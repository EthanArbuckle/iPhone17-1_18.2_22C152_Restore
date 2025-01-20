@interface AVBorealisServerHysteresisNotifier
- (AVBorealisServerHysteresisNotifier)initWithSerialQueue:(id)a3;
- (BOOL)isPortActive:(unint64_t)a3 activePortsToken:(unint64_t)a4;
- (NSMutableArray)portsToMonitor;
- (OS_dispatch_queue)queue;
- (id)addPortToMonitor:(unint64_t)a3 hysteresisDurationSeconds:(float)a4 notificationBlock:(id)a5;
- (id)getPortManagerForType:(unint64_t)a3;
- (void)dealloc;
- (void)processState:(unint64_t)a3;
- (void)removePortToMonitor:(unint64_t)a3;
- (void)sendState:(id)a3;
- (void)setPortsToMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)stateChanged:(BOOL)a3;
- (void)stateChanged:(BOOL)a3 forPort:(id)a4;
@end

@implementation AVBorealisServerHysteresisNotifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portsToMonitor, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setPortsToMonitor:(id)a3
{
}

- (NSMutableArray)portsToMonitor
{
  return self->_portsToMonitor;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)removePortToMonitor:(unint64_t)a3
{
  id v4 = [(AVBorealisServerHysteresisNotifier *)self getPortManagerForType:a3];
  if (v4) {
    [(NSMutableArray *)self->_portsToMonitor removeObject:v4];
  }
}

- (id)addPortToMonitor:(unint64_t)a3 hysteresisDurationSeconds:(float)a4 notificationBlock:(id)a5
{
  id v8 = a5;
  v9 = [(AVBorealisServerHysteresisNotifier *)self getPortManagerForType:a3];
  if (!v9)
  {
    v10 = [AVBorealisServerPortManager alloc];
    *(float *)&double v11 = a4;
    v9 = [(AVBorealisServerPortManager *)v10 initWithPortType:a3 hysteresisDurationSeconds:v8 notificationBlock:v11];
    [(NSMutableArray *)self->_portsToMonitor addObject:v9];
  }

  return v9;
}

- (void)processState:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(AVBorealisServerHysteresisNotifier *)self portsToMonitor];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v6)
  {
    id v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 136315906;
    long long v14 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v12 = -[AVBorealisServerHysteresisNotifier isPortActive:activePortsToken:](self, "isPortActive:activePortsToken:", objc_msgSend(v11, "portType", v14), a3);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = [v11 portType];
          *(_DWORD *)buf = v14;
          v20 = "AVBorealisServer.mm";
          __int16 v21 = 1024;
          int v22 = 387;
          __int16 v23 = 2048;
          uint64_t v24 = v13;
          __int16 v25 = 1024;
          BOOL v26 = v12;
          _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d State may have changed for port: %lu current state: %d", buf, 0x22u);
        }
        [(AVBorealisServerHysteresisNotifier *)self stateChanged:v12 forPort:v11];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v6);
  }
}

- (BOOL)isPortActive:(unint64_t)a3 activePortsToken:(unint64_t)a4
{
  unint64_t v4 = (a4 >> 1) & 1;
  if (a3 != 1) {
    LOBYTE(v4) = 0;
  }
  if (a3 == 2) {
    return (a4 & 0xC) != 0;
  }
  else {
    return v4;
  }
}

- (id)getPortManagerForType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(AVBorealisServerHysteresisNotifier *)self portsToMonitor];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 portType] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)sendState:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVBorealisServerHysteresisNotifier_sendState___block_invoke;
  block[3] = &unk_1E5B15DE8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __48__AVBorealisServerHysteresisNotifier_sendState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 lastStateSent];

  return [v1 callNotificationBlock:v2];
}

- (void)stateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AVBorealisServerHysteresisNotifier *)self getPortManagerForType:1];
  -[AVBorealisServerHysteresisNotifier stateChanged:forPort:](self, "stateChanged:forPort:", v3);
}

- (void)stateChanged:(BOOL)a3 forPort:(id)a4
{
}

- (void)dealloc
{
  [(NSMutableArray *)self->_portsToMonitor removeAllObjects];
  portsToMonitor = self->_portsToMonitor;
  self->_portsToMonitor = 0;

  queue = self->_queue;
  self->_queue = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVBorealisServerHysteresisNotifier;
  [(AVBorealisServerHysteresisNotifier *)&v5 dealloc];
}

- (AVBorealisServerHysteresisNotifier)initWithSerialQueue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVBorealisServerHysteresisNotifier;
  id v6 = [(AVBorealisServerHysteresisNotifier *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    portsToMonitor = v7->_portsToMonitor;
    v7->_portsToMonitor = v8;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v7->_portsToMonitor;
      *(_DWORD *)buf = 136315650;
      long long v14 = "AVBorealisServer.mm";
      __int16 v15 = 1024;
      int v16 = 317;
      __int16 v17 = 2048;
      long long v18 = v10;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d portMontior list: %p", buf, 0x1Cu);
    }
  }

  return v7;
}

@end