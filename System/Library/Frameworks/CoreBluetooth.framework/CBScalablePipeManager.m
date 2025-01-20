@interface CBScalablePipeManager
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (CBScalablePipeManager)initWithDelegate:(id)a3;
- (CBScalablePipeManager)initWithDelegate:(id)a3 queue:(id)a4;
- (CBScalablePipeManagerDelegate)delegate;
- (NSHashTable)pipes;
- (NSSet)identifiers;
- (id)pipeForName:(id)a3 identifier:(id)a4;
- (id)sharedPairingAgent;
- (void)dealloc;
- (void)getStatistics:(id)a3;
- (void)handleEndpointAdded:(id)a3;
- (void)handleEndpointRemoved:(id)a3;
- (void)handleHostStateUpdated:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handlePipeConnected:(id)a3;
- (void)handlePipeDisconnected:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)orphanPipes;
- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5;
- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 options:(id)a6;
- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6;
- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6 requireEncryption:(BOOL)a7;
- (void)setDelegate:(id)a3;
- (void)setLinkRequirementsForPeer:(id)a3 packetsPerSecond:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6;
- (void)setLinkRequirementsForPeer:(id)a3 withClientName:(id)a4 packetsPerSecond:(unsigned int)a5 inputBytesPerSecond:(unsigned int)a6 outputBytesPerSecond:(unsigned int)a7;
- (void)setLinkRequirementsForPeerWithLatency:(id)a3 latencyInMs:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6;
- (void)unregisterAllEndpoints;
- (void)unregisterEndpoint:(id)a3;
@end

@implementation CBScalablePipeManager

- (CBScalablePipeManager)initWithDelegate:(id)a3
{
  return [(CBScalablePipeManager *)self initWithDelegate:a3 queue:0];
}

- (CBScalablePipeManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CBScalablePipeManager;
  v8 = [(CBManager *)&v14 initInternal];
  if (v8)
  {
    [(CBScalablePipeManager *)v8 addObserver:v8 forKeyPath:@"state" options:0 context:objc_opt_class()];
    [(CBScalablePipeManager *)v8 addObserver:v8 forKeyPath:@"delegate" options:0 context:objc_opt_class()];
    [(CBScalablePipeManager *)v8 addObserver:v8 forKeyPath:@"localName" options:0 context:objc_opt_class()];
    [(CBScalablePipeManager *)v8 setDelegate:v6];
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    identifiers = v8->_identifiers;
    v8->_identifiers = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    pipes = v8->_pipes;
    v8->_pipes = (NSHashTable *)v11;

    [(CBManager *)v8 startWithQueue:v7 options:0 sessionType:2];
  }

  return v8;
}

- (void)dealloc
{
  [(CBScalablePipeManager *)self orphanPipes];
  [(CBScalablePipeManager *)self removeObserver:self forKeyPath:@"state" context:objc_opt_class()];
  [(CBScalablePipeManager *)self removeObserver:self forKeyPath:@"delegate" context:objc_opt_class()];
  [(CBScalablePipeManager *)self removeObserver:self forKeyPath:@"localName" context:objc_opt_class()];
  v3.receiver = self;
  v3.super_class = (Class)CBScalablePipeManager;
  [(CBManager *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (objc_opt_class() == a6)
  {
    if ([v10 isEqualToString:@"state"])
    {
      if ([(CBManager *)self state] != CBManagerStatePoweredOn)
      {
        [(CBScalablePipeManager *)self orphanPipes];
        if ([(CBManager *)self state] == CBManagerStateResetting) {
          [(NSMutableSet *)self->_identifiers removeAllObjects];
        }
      }
      v13 = [(CBScalablePipeManager *)self delegate];
      [v13 scalablePipeManagerDidUpdateState:self];
    }
    else
    {
      if (![v10 isEqualToString:@"delegate"]) {
        goto LABEL_20;
      }
      objc_super v14 = [(CBScalablePipeManager *)self delegate];
      *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

      v15 = [(CBScalablePipeManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        char v16 = 2;
      }
      else {
        char v16 = 0;
      }
      *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v16;

      v17 = [(CBScalablePipeManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        char v18 = 4;
      }
      else {
        char v18 = 0;
      }
      *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v18;

      v13 = [(CBScalablePipeManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        char v19 = 8;
      }
      else {
        char v19 = 0;
      }
      *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xF7 | v19;
    }

    goto LABEL_20;
  }
  v20.receiver = self;
  v20.super_class = (Class)CBScalablePipeManager;
  [(CBScalablePipeManager *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_20:
}

- (id)sharedPairingAgent
{
  return 0;
}

- (id)pipeForName:(id)a3 identifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = self->_pipes;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
      v13 = [v12 name];
      if ([v13 isEqualToString:v6])
      {
        objc_super v14 = [v12 peer];
        v15 = [v14 identifier];
        char v16 = [v15 isEqual:v20];

        if (v16)
        {
          id v17 = v12;

          goto LABEL_17;
        }
      }
      else
      {
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (!v9) {
          break;
        }
        goto LABEL_4;
      }
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  char v18 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBScalablePipeManager pipeForName:identifier:]((uint64_t)v20, (uint64_t)v6, v18);
  }
  id v17 = 0;
LABEL_17:

  return v17;
}

- (void)orphanPipes
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_pipes;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setOrphan", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSHashTable *)self->_pipes removeAllObjects];
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5
{
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6
{
  v15[1] = *MEMORY[0x1E4F143B8];
  objc_super v14 = @"kCBMsgArgsTransport";
  long long v10 = NSNumber;
  id v11 = a3;
  id v12 = [v10 numberWithInteger:a6];
  v15[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [(CBScalablePipeManager *)self registerEndpoint:v11 type:a4 priority:a5 options:v13];
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6 requireEncryption:(BOOL)a7
{
  BOOL v7 = a7;
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = @"kCBMsgArgsTransport";
  id v12 = NSNumber;
  id v13 = a3;
  objc_super v14 = [v12 numberWithInteger:a6];
  v17[1] = @"kCBMsgArgRequiresEncryption";
  v18[0] = v14;
  v15 = [NSNumber numberWithBool:v7];
  v18[1] = v15;
  char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [(CBScalablePipeManager *)self registerEndpoint:v13 type:a4 priority:a5 options:v16];
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 options:(id)a6
{
  v42[8] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = [v11 objectForKeyedSubscript:@"kCBMsgArgRequiresEncryption"];
  if (v12)
  {
    id v13 = [v11 objectForKeyedSubscript:@"kCBMsgArgRequiresEncryption"];
    unsigned int v39 = [v13 BOOLValue];
  }
  else
  {
    unsigned int v39 = 1;
  }

  objc_super v14 = [v11 objectForKeyedSubscript:@"kCBMsgArgsTransport"];
  if (v14)
  {
    v15 = [v11 objectForKeyedSubscript:@"kCBMsgArgsTransport"];
    uint64_t v38 = (int)[v15 intValue];
  }
  else
  {
    uint64_t v38 = 0;
  }

  char v16 = [v11 objectForKeyedSubscript:@"kCBDisableBluetoothReliability"];
  if (v16)
  {
    id v17 = [v11 objectForKeyedSubscript:@"kCBDisableBluetoothReliability"];
    uint64_t v18 = [v17 BOOLValue];
  }
  else
  {
    uint64_t v18 = 0;
  }
  v40 = self;

  char v19 = [v11 objectForKeyedSubscript:@"kCBOptionStayConnectedWhenIdle"];
  if (v19)
  {
    id v20 = [v11 objectForKeyedSubscript:@"kCBOptionStayConnectedWhenIdle"];
    uint64_t v21 = [v20 BOOLValue];
  }
  else
  {
    uint64_t v21 = 0;
  }

  long long v22 = [v11 objectForKeyedSubscript:@"kCBLePipeOptionTrace"];
  if (v22)
  {
    [v11 objectForKeyedSubscript:@"kCBLePipeOptionTrace"];
    v24 = int64_t v23 = a5;
    unsigned int v37 = [v24 intValue];

    a5 = v23;
    if ([v10 length]) {
      goto LABEL_15;
    }
  }
  else
  {
    unsigned int v37 = 0;

    if ([v10 length]) {
      goto LABEL_15;
    }
  }
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, v40, @"CBScalablePipeManager.m", 158, @"Invalid parameter not satisfying: %@", @"identifier.length" object file lineNumber description];

LABEL_15:
  v42[0] = v10;
  v41[0] = @"kCBMsgArgName";
  v41[1] = @"kCBMsgArgType";
  v34 = v10;
  v36 = [NSNumber numberWithInteger:a4];
  v42[1] = v36;
  v41[2] = @"kCBLePipeMsgArgPriority";
  v25 = [NSNumber numberWithInteger:a5];
  v42[2] = v25;
  v41[3] = @"kCBMsgArgOptions";
  uint64_t v26 = [NSNumber numberWithInteger:v38];
  v42[3] = v26;
  v41[4] = @"kCBMsgArgRequiresEncryption";
  v27 = [NSNumber numberWithInt:v39];
  v42[4] = v27;
  v41[5] = @"kCBDisableBluetoothReliability";
  v28 = [NSNumber numberWithInt:v18];
  v42[5] = v28;
  v41[6] = @"kCBOptionStayConnectedWhenIdle";
  v29 = [NSNumber numberWithInt:v21];
  v42[6] = v29;
  v41[7] = @"kCBLePipeOptionTrace";
  v30 = [NSNumber numberWithInt:v37];
  v42[7] = v30;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:8];
  BOOL v32 = [(CBManager *)v40 sendMsg:8 args:v31];

  if (v32) {
    [(NSMutableSet *)v40->_identifiers addObject:v34];
  }
}

- (void)unregisterEndpoint:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 length])
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CBScalablePipeManager.m", 167, @"Invalid parameter not satisfying: %@", @"identifier.length" object file lineNumber description];
  }
  long long v9 = @"kCBMsgArgName";
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  BOOL v7 = [(CBManager *)self sendMsg:9 args:v6];

  if (v7) {
    [(NSMutableSet *)self->_identifiers removeObject:v5];
  }
}

- (void)unregisterAllEndpoints
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = self->_identifiers;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        objc_super v14 = @"kCBMsgArgName";
        uint64_t v15 = v8;
        long long v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, (void)v10);
        [(CBManager *)self sendMsg:9 args:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_identifiers removeAllObjects];
}

- (void)setLinkRequirementsForPeer:(id)a3 packetsPerSecond:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  v17[4] = *MEMORY[0x1E4F143B8];
  v17[0] = a3;
  v16[0] = @"kCBMsgArgDeviceUUID";
  v16[1] = @"kCBMsgArgPacketsPerSecond";
  long long v10 = NSNumber;
  id v11 = a3;
  long long v12 = [v10 numberWithUnsignedInt:v8];
  v17[1] = v12;
  v16[2] = @"kCBMsgArgInputBytesPerSecond";
  long long v13 = [NSNumber numberWithUnsignedInt:v7];
  void v17[2] = v13;
  v16[3] = @"kCBMsgArgOutputBytesPerSecond";
  objc_super v14 = [NSNumber numberWithUnsignedInt:v6];
  v17[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  [(CBManager *)self sendMsg:10 args:v15];
}

- (void)setLinkRequirementsForPeer:(id)a3 withClientName:(id)a4 packetsPerSecond:(unsigned int)a5 inputBytesPerSecond:(unsigned int)a6 outputBytesPerSecond:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  v20[5] = *MEMORY[0x1E4F143B8];
  v19[0] = @"kCBMsgArgDeviceUUID";
  v19[1] = @"kCBMsgArgClientName";
  v20[0] = a3;
  v20[1] = a4;
  v19[2] = @"kCBMsgArgPacketsPerSecond";
  long long v12 = NSNumber;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v12 numberWithUnsignedInt:v9];
  v20[2] = v15;
  v19[3] = @"kCBMsgArgInputBytesPerSecond";
  char v16 = [NSNumber numberWithUnsignedInt:v8];
  v20[3] = v16;
  v19[4] = @"kCBMsgArgOutputBytesPerSecond";
  uint64_t v17 = [NSNumber numberWithUnsignedInt:v7];
  v20[4] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];

  [(CBManager *)self sendMsg:10 args:v18];
}

- (void)setLinkRequirementsForPeerWithLatency:(id)a3 latencyInMs:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  v17[4] = *MEMORY[0x1E4F143B8];
  v17[0] = a3;
  v16[0] = @"kCBMsgArgDeviceUUID";
  v16[1] = @"kCBMsgArgLatencyInMs";
  long long v10 = NSNumber;
  id v11 = a3;
  long long v12 = [v10 numberWithUnsignedInt:v8];
  v17[1] = v12;
  v16[2] = @"kCBMsgArgInputBytesPerSecond";
  id v13 = [NSNumber numberWithUnsignedInt:v7];
  void v17[2] = v13;
  v16[3] = @"kCBMsgArgOutputBytesPerSecond";
  id v14 = [NSNumber numberWithUnsignedInt:v6];
  v17[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  [(CBManager *)self sendMsg:11 args:v15];
}

- (void)getStatistics:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CBScalablePipeManager_getStatistics___block_invoke;
  v6[3] = &unk_1E5E310E0;
  id v7 = v4;
  id v5 = v4;
  [(CBManager *)self sendMsg:12 args:MEMORY[0x1E4F1CC08] withReply:v6];
}

uint64_t __39__CBScalablePipeManager_getStatistics___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleEndpointAdded:(id)a3
{
  id v4 = a3;
  id v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  id v5 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];

  uint64_t v6 = [(NSMutableSet *)self->_identifiers member:v8];

  if (v6)
  {
    if (v5) {
      [(NSMutableSet *)self->_identifiers removeObject:v8];
    }
    if (*(unsigned char *)&self->_delegateFlags)
    {
      id v7 = [(CBScalablePipeManager *)self delegate];
      [v7 scalablePipeManager:self didRegisterEndpoint:v8 error:v5];
    }
  }
}

- (void)handleEndpointRemoved:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"kCBMsgArgName"];
  -[NSMutableSet removeObject:](self->_identifiers, "removeObject:");
  if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
  {
    id v4 = [(CBScalablePipeManager *)self delegate];
    [v4 scalablePipeManager:self didUnregisterEndpoint:v5];
  }
}

- (void)handlePipeConnected:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CBScalablePipe alloc] initWithPipeManager:self info:v4];

  [(NSHashTable *)self->_pipes addObject:v6];
  if ((*(unsigned char *)&self->_delegateFlags & 4) != 0)
  {
    id v5 = [(CBScalablePipeManager *)self delegate];
    [v5 scalablePipeManager:self pipeDidConnect:v6];
  }
}

- (void)handlePipeDisconnected:(id)a3
{
  id v4 = a3;
  id v9 = [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];

  id v7 = [(CBScalablePipeManager *)self pipeForName:v9 identifier:v5];
  if (v7)
  {
    if ((*(unsigned char *)&self->_delegateFlags & 8) != 0)
    {
      id v8 = [(CBScalablePipeManager *)self delegate];
      [v8 scalablePipeManager:self pipeDidDisconnect:v7 error:v6];
    }
    [(NSHashTable *)self->_pipes removeObject:v7];
  }
}

- (void)handleHostStateUpdated:(id)a3
{
  id v4 = a3;
  id v10 = [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v6 = [(CBScalablePipeManager *)self pipeForName:v10 identifier:v5];
  id v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgState"];

  uint64_t v8 = [v7 integerValue];
  id v9 = [v6 peer];
  [v9 setHostState:v8];
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return (a3 & 0xFFFE) == 8;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  char v7 = 1;
  uint64_t v8 = &selRef_handleEndpointAdded_;
  switch(v4)
  {
    case 13:
      goto LABEL_9;
    case 14:
      id v9 = sel_handleEndpointRemoved_;
      [(CBManager *)self state];
      goto LABEL_16;
    case 15:
      id v9 = sel_handlePipeConnected_;
      CBManagerState v11 = [(CBManager *)self state];
      goto LABEL_10;
    case 16:
      char v7 = 0;
      uint64_t v8 = &selRef_handlePipeDisconnected_;
LABEL_9:
      id v9 = *v8;
      CBManagerState v11 = [(CBManager *)self state];
      if ((v7 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    case 17:
      id v9 = sel_handleHostStateUpdated_;
      CBManagerState v11 = [(CBManager *)self state];
LABEL_10:
      if (v11 == CBManagerStatePoweredOn)
      {
LABEL_16:
        objc_msgSend(self, v9, v6);
      }
      else
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        }
        long long v12 = CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        {
          -[CBScalablePipeManager handleMsg:args:]((uint64_t)self, v4, v12);
        }
        else
        {
LABEL_6:
        }
      }
      break;
    default:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      id v10 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      -[CBCentralManager handleMsg:args:](v4, v10);

      break;
  }
}

- (NSSet)identifiers
{
  return &self->_identifiers->super;
}

- (CBScalablePipeManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CBScalablePipeManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSHashTable)pipes
{
  return self->_pipes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipes, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (void)pipeForName:(os_log_t)log identifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_ERROR, "Unable to locate pipe to device %@ on endpoint \"%@\"", (uint8_t *)&v3, 0x16u);
}

- (void)handleMsg:(os_log_t)log args:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_DEBUG, "%@ is not powered on, ignoring message: %u", (uint8_t *)&v3, 0x12u);
}

@end