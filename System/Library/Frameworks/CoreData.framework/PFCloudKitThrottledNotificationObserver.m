@interface PFCloudKitThrottledNotificationObserver
- (PFCloudKitThrottledNotificationObserver)initWithLabel:(id)a3 handlerBlock:(id)a4;
- (void)dealloc;
- (void)noteRecievedNotification:(uint64_t)a1;
@end

@implementation PFCloudKitThrottledNotificationObserver

- (PFCloudKitThrottledNotificationObserver)initWithLabel:(id)a3 handlerBlock:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PFCloudKitThrottledNotificationObserver;
  v6 = [(PFCloudKitThrottledNotificationObserver *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_notificationStalenessInterval = 10;
    atomic_store(0, (unsigned int *)&v6->_notificationIteration);
    v6->_label = (NSString *)a3;
    v7->_assertionLabel = (NSString *)[[NSString alloc] initWithFormat:@"CoreData: %@", v7->_label];
    v7->_notificationHandlerBlock = (id)[a4 copy];
  }
  return v7;
}

- (void)dealloc
{
  self->_notificationHandlerBlock = 0;
  self->_assertionLabel = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitThrottledNotificationObserver;
  [(PFCloudKitThrottledNotificationObserver *)&v3 dealloc];
}

- (void)noteRecievedNotification:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = [a2 name];
    v4 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 9) {
      uint64_t v5 = 9;
    }
    else {
      uint64_t v5 = __ckLoggingOverride;
    }
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Got: %@ - %d"];
    atomic_load((unsigned int *)(a1 + 8));
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]");
    if (atomic_fetch_add((atomic_uint *volatile)(a1 + 8), 1u))
    {
      v13 = (void *)MEMORY[0x18C127630]();
      if ((unint64_t)__ckLoggingOverride >= 0x10) {
        uint64_t v14 = 16;
      }
      else {
        uint64_t v14 = __ckLoggingOverride;
      }
      uint64_t v15 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Already scheduled a block to respond to '%@', %d notifications since."];
      atomic_load((unsigned int *)(a1 + 8));
      _NSCoreDataLog(v14, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]");
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v22 = +[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, *(void *)(a1 + 16), &v26);
      dispatch_time_t v23 = dispatch_time(0, 1000000000 * *(void *)(a1 + 32));
      global_queue = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__PFCloudKitThrottledNotificationObserver_noteRecievedNotification___block_invoke;
      block[3] = &unk_1E544FC80;
      block[4] = a1;
      block[5] = v3;
      block[6] = v22;
      block[7] = v26;
      dispatch_after(v23, global_queue, block);
    }
  }
}

void __68__PFCloudKitThrottledNotificationObserver_noteRecievedNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  atomic_exchange((atomic_uint *volatile)(*(void *)(a1 + 32) + 8), 0);
  v2 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 9) {
    uint64_t v3 = 9;
  }
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Executing '%@' block for '%@' clearing %d iterations."];
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]_block_invoke");
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v11)
  {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v12 = [NSString stringWithUTF8String:"No notification handler block specified. Dropping: %@"];
    _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, *(void *)(a1 + 40));
    uint64_t v19 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v20;
      _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: No notification handler block specified. Dropping: %@", buf, 0xCu);
    }
  }
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, *(void *)(a1 + 56), *(void **)(a1 + 48));
}

@end