@interface DNDSBaseLifetimeMonitor
+ (Class)lifetimeClass;
- (DNDSBaseLifetimeMonitor)init;
- (DNDSLifetimeMonitorDataSource)dataSource;
- (DNDSLifetimeMonitorDelegate)delegate;
- (NSArray)activeLifetimeAssertionUUIDs;
- (NSString)sysdiagnoseDataIdentifier;
- (OS_dispatch_queue)queue;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (id)updateForModeAssertions:(id)a3 date:(id)a4;
- (void)dealloc;
- (void)refreshMonitorForDate:(id)a3;
- (void)refreshMonitorFromQueueForDate:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSBaseLifetimeMonitor

- (DNDSBaseLifetimeMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)DNDSBaseLifetimeMonitor;
  v2 = [(DNDSBaseLifetimeMonitor *)&v14 init];
  if (v2)
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [v3 stringWithFormat:@"com.apple.donotdisturb.lifetime-monitor.%@", v5];

    id v7 = v6;
    v8 = (const char *)[v7 cStringUsingEncoding:4];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    activeLifetimeAssertionUUIDs = v2->_activeLifetimeAssertionUUIDs;
    v2->_activeLifetimeAssertionUUIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    DNDSRegisterSysdiagnoseDataProvider(v2);
  }
  return v2;
}

- (void)dealloc
{
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSBaseLifetimeMonitor;
  [(DNDSBaseLifetimeMonitor *)&v3 dealloc];
}

+ (Class)lifetimeClass
{
  return (Class)objc_opt_class();
}

- (id)updateForModeAssertions:(id)a3 date:(id)a4
{
  v4 = [DNDSLifetimeMonitorResult alloc];
  v5 = [(DNDSLifetimeMonitorResult *)v4 initWithActiveUUIDs:MEMORY[0x1E4F1CBF0] expiredUUIDs:MEMORY[0x1E4F1CBF0]];
  return v5;
}

- (void)refreshMonitorForDate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__DNDSBaseLifetimeMonitor_refreshMonitorForDate___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __49__DNDSBaseLifetimeMonitor_refreshMonitorForDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshMonitorFromQueueForDate:*(void *)(a1 + 40)];
}

- (void)refreshMonitorFromQueueForDate:(id)a3
{
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = [(DNDSBaseLifetimeMonitor *)self dataSource];
  v5 = objc_msgSend(v4, "lifetimeMonitor:modeAssertionsWithLifetimeClass:", self, objc_msgSend((id)objc_opt_class(), "lifetimeClass"));
  id v6 = (void *)[(NSArray *)self->_activeLifetimeAssertionUUIDs copy];
  id v7 = [(DNDSBaseLifetimeMonitor *)self updateForModeAssertions:v5 date:v15];
  id v8 = [v7 activeUUIDs];
  v9 = (NSArray *)[v8 copy];
  activeLifetimeAssertionUUIDs = self->_activeLifetimeAssertionUUIDs;
  self->_activeLifetimeAssertionUUIDs = v9;

  v11 = [(DNDSBaseLifetimeMonitor *)self delegate];
  v12 = [v7 expiredUUIDs];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    objc_super v14 = [v7 expiredUUIDs];
    [v11 lifetimeMonitor:self lifetimeDidExpireForAssertionUUIDs:v14 expirationDate:v15];
  }
  if (([v6 isEqual:self->_activeLifetimeAssertionUUIDs] & 1) == 0) {
    [v11 activeAssertionsDidChangeForLifetimeMonitor:self];
  }
}

- (NSString)sysdiagnoseDataIdentifier
{
  v2 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"com.apple.donotdisturb.lifetime-monitor.%@", v4];

  return (NSString *)v5;
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  objc_super v14 = __Block_byref_object_copy__1;
  id v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__DNDSBaseLifetimeMonitor_sysdiagnoseDataForDate_redacted___block_invoke;
  block[3] = &unk_1E6973518;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(queue, block);
  id v7 = objc_msgSend((id)v12[5], "bs_mapNoNulls:", &__block_literal_global_0);
  v17 = @"active-uuids";
  v18[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __59__DNDSBaseLifetimeMonitor_sysdiagnoseDataForDate_redacted___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeLifetimeAssertionUUIDs];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __59__DNDSBaseLifetimeMonitor_sysdiagnoseDataForDate_redacted___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)activeLifetimeAssertionUUIDs
{
  return self->_activeLifetimeAssertionUUIDs;
}

- (DNDSLifetimeMonitorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSLifetimeMonitorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (DNDSLifetimeMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSLifetimeMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_activeLifetimeAssertionUUIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end