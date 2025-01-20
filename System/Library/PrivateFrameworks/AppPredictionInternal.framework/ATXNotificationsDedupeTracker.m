@interface ATXNotificationsDedupeTracker
+ (ATXNotificationsDedupeTracker)sharedInstance;
- (ATXNotificationsDedupeTracker)init;
- (BOOL)addNotificationId:(id)a3;
- (void)insertEvent:(int64_t)a3 notificationID:(id)a4;
@end

@implementation ATXNotificationsDedupeTracker

+ (ATXNotificationsDedupeTracker)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1) {
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_217);
  }
  v2 = (void *)sharedInstance_instance_5;
  return (ATXNotificationsDedupeTracker *)v2;
}

uint64_t __47__ATXNotificationsDedupeTracker_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_instance_5;
  sharedInstance_instance_5 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXNotificationsDedupeTracker)init
{
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationsDedupeTracker;
  v2 = [(ATXNotificationsDedupeTracker *)&v12 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    recordsTable = v2->_recordsTable;
    v2->_recordsTable = (NSMutableSet *)v9;
  }
  return v2;
}

- (BOOL)addNotificationId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ATXNotificationsDedupeTracker_addNotificationId___block_invoke;
  block[3] = &unk_1E68AD278;
  id v9 = v4;
  v10 = self;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)queue;
}

uint64_t __51__ATXNotificationsDedupeTracker_addNotificationId___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) length];
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 40) + 16) containsObject:*(void *)(a1 + 32)];
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(*(void *)(a1 + 40) + 16) addObject:*(void *)(a1 + 32)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)insertEvent:(int64_t)a3 notificationID:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ATXNotificationsDedupeTracker_insertEvent_notificationID___block_invoke;
  block[3] = &unk_1E68AE7A8;
  v11 = self;
  int64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void *__60__ATXNotificationsDedupeTracker_insertEvent_notificationID___block_invoke(void *result)
{
  unint64_t v1 = result[6];
  BOOL v2 = v1 > 0xD;
  uint64_t v3 = (1 << v1) & 0x202E;
  if (!v2 && v3 != 0)
  {
    if (result[4]) {
      return objc_msgSend(*(id *)(result[5] + 16), "removeObject:");
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsTable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end