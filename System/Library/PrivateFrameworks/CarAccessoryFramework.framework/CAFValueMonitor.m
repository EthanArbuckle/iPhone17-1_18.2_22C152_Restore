@interface CAFValueMonitor
- (BOOL)_locked_receivedAllValues;
- (BOOL)receivedAllValues;
- (BOOL)signaledReadyToMonitor;
- (BOOL)valueReceivedFor:(id)a3;
- (CAFValueMonitor)initWithDelegate:(id)a3;
- (CAFValueMonitorDelegate)delegate;
- (NSMutableSet)monitoringForValue;
- (OS_dispatch_queue)monitorQueue;
- (void)monitorForValue:(id)a3;
- (void)setMonitorQueue:(id)a3;
- (void)setSignaledReadyToMonitor:(BOOL)a3;
- (void)signalReadyToMonitor;
@end

@implementation CAFValueMonitor

- (CAFValueMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAFValueMonitor;
  v5 = [(CAFValueMonitor *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_opt_new();
    monitoringForValue = v6->_monitoringForValue;
    v6->_monitoringForValue = (NSMutableSet *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);

    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    v13 = [v4 uniqueIdentifier];
    id v14 = [v11 stringWithFormat:@"com.apple.CarAccessoryFramework.%@.%@.valueMonitor", v12, v13];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], v10);
    monitorQueue = v6->_monitorQueue;
    v6->_monitorQueue = (OS_dispatch_queue *)v15;
  }
  return v6;
}

- (BOOL)receivedAllValues
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(CAFValueMonitor *)self monitorQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__CAFValueMonitor_receivedAllValues__block_invoke;
  v5[3] = &unk_265264128;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __36__CAFValueMonitor_receivedAllValues__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_locked_receivedAllValues");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_locked_receivedAllValues
{
  v3 = [(CAFValueMonitor *)self monitoringForValue];
  if ([v3 count]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(CAFValueMonitor *)self signaledReadyToMonitor];
  }

  return v4;
}

- (void)monitorForValue:(id)a3
{
  id v4 = a3;
  v5 = [(CAFValueMonitor *)self monitorQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__CAFValueMonitor_monitorForValue___block_invoke;
  v7[3] = &unk_265263280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __35__CAFValueMonitor_monitorForValue___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) monitoringForValue];
  [v3 addObject:*(void *)(a1 + 40)];

  if ([*v2 signaledReadyToMonitor])
  {
    id v4 = CAFValueMonitorLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __35__CAFValueMonitor_monitorForValue___block_invoke_cold_1(v2);
    }
  }
}

- (void)signalReadyToMonitor
{
  v3 = [(CAFValueMonitor *)self monitorQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CAFValueMonitor_signalReadyToMonitor__block_invoke;
  block[3] = &unk_265263258;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __39__CAFValueMonitor_signalReadyToMonitor__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  uint64_t result = [*(id *)(a1 + 32) signaledReadyToMonitor];
  if ((result & 1) == 0)
  {
    v3 = CAFValueMonitorLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __39__CAFValueMonitor_signalReadyToMonitor__block_invoke_cold_1(v1, v3);
    }

    return [*v1 setSignaledReadyToMonitor:1];
  }
  return result;
}

- (BOOL)valueReceivedFor:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(CAFValueMonitor *)self monitorQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CAFValueMonitor_valueReceivedFor___block_invoke;
  block[3] = &unk_265264150;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __36__CAFValueMonitor_valueReceivedFor___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) monitoringForValue];
  char v4 = [v3 containsObject:*(void *)(a1 + 40)];

  id v5 = *v2;
  if (v4)
  {
    id v6 = [v5 monitoringForValue];
    [v6 removeObject:*(void *)(a1 + 40)];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_locked_receivedAllValues");
    uint64_t v7 = CAFValueMonitorLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __36__CAFValueMonitor_valueReceivedFor___block_invoke_cold_1(v2);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "_locked_receivedAllValues");
  }
}

- (void)setSignaledReadyToMonitor:(BOOL)a3
{
  if (self->_signaledReadyToMonitor != a3)
  {
    if (a3)
    {
      self->_signaledReadyToMonitor = a3;
    }
    else
    {
      v3 = CAFGeneralLogging();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        -[CAFValueMonitor setSignaledReadyToMonitor:](v3);
      }
    }
  }
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
}

- (CAFValueMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAFValueMonitorDelegate *)WeakRetained;
}

- (BOOL)signaledReadyToMonitor
{
  return self->_signaledReadyToMonitor;
}

- (NSMutableSet)monitoringForValue
{
  return self->_monitoringForValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringForValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
}

void __35__CAFValueMonitor_monitorForValue___block_invoke_cold_1(id *a1)
{
  v2 = [*a1 delegate];
  v3 = [v2 uniqueIdentifier];
  [*a1 signaledReadyToMonitor];
  char v4 = [*a1 monitoringForValue];
  [v4 count];
  OUTLINED_FUNCTION_0_1(&dword_249710000, v5, v6, "%s %@%@ added %@ monitoring.count=%ld ", v7, v8, v9, v10, 2u);
}

void __39__CAFValueMonitor_signalReadyToMonitor__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v4 = [*a1 delegate];
  uint64_t v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [*a1 monitoringForValue];
  uint64_t v7 = [v6 count];
  uint64_t v8 = [*a1 monitoringForValue];
  uint64_t v9 = [v8 allObjects];
  uint64_t v10 = [v9 componentsJoinedByString:@", "];
  int v11 = 136315906;
  uint64_t v12 = "-[CAFValueMonitor signalReadyToMonitor]_block_invoke";
  __int16 v13 = 2112;
  char v14 = v5;
  __int16 v15 = 2048;
  uint64_t v16 = v7;
  __int16 v17 = 2112;
  objc_super v18 = v10;
  _os_log_debug_impl(&dword_249710000, a2, OS_LOG_TYPE_DEBUG, "%s %@ %ld [%@]", (uint8_t *)&v11, 0x2Au);
}

void __36__CAFValueMonitor_valueReceivedFor___block_invoke_cold_1(id *a1)
{
  v2 = [*a1 delegate];
  v3 = [v2 uniqueIdentifier];
  char v4 = [*a1 monitoringForValue];
  [v4 count];
  [*a1 signaledReadyToMonitor];
  OUTLINED_FUNCTION_0_1(&dword_249710000, v5, v6, "%s %@ count=%ld signaledReadyToMonitor=%@ recieved %@", v7, v8, v9, v10, 2u);
}

- (void)setSignaledReadyToMonitor:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_249710000, log, OS_LOG_TYPE_FAULT, "signaledReadyToMonitor should not be set to NO", v1, 2u);
}

@end