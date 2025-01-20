@interface ATXBBNotificationManager
+ (id)sharedInstance;
- (ATXBBNotificationManager)init;
- (ATXBBNotificationManager)initWithDebugOutput:(BOOL)a3;
- (BOOL)_purgeNotificationsWithMinDate:(id)a3;
- (id)recentNotifications;
- (void)addNotificationForBundleId:(id)a3 withPublicationDate:(id)a4;
- (void)recentNotifications;
@end

@implementation ATXBBNotificationManager

- (ATXBBNotificationManager)init
{
  return [(ATXBBNotificationManager *)self initWithDebugOutput:0];
}

- (ATXBBNotificationManager)initWithDebugOutput:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ATXBBNotificationManager;
  v4 = [(ATXBBNotificationManager *)&v14 init];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = objc_claimAutoreleasedReturnValue();
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v9;

    v4->_debugOutput = a3;
    uint64_t v11 = objc_opt_new();
    recentNotifications = v4->_recentNotifications;
    v4->_recentNotifications = (NSMutableDictionary *)v11;
  }
  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_165);
  }
  v2 = (void *)sharedInstance_instance_3;
  return v2;
}

uint64_t __42__ATXBBNotificationManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_instance_3;
  sharedInstance_instance_3 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)addNotificationForBundleId:(id)a3 withPublicationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ATXBBNotificationManager_addNotificationForBundleId_withPublicationDate___block_invoke;
  block[3] = &unk_1E68AC320;
  id v12 = v6;
  id v13 = v7;
  objc_super v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __75__ATXBBNotificationManager_addNotificationForBundleId_withPublicationDate___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) length]) {
    return;
  }
  id v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-600.0];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "compare:");
  v3 = *(unsigned char **)(a1 + 48);
  if (v2 == -1)
  {
    if (v3[16])
    {
      uint64_t v11 = (FILE **)MEMORY[0x1E4F143D8];
      id v12 = (FILE *)*MEMORY[0x1E4F143D8];
      id v13 = [NSString stringWithFormat:@"Rejecting old notification for %@", *(void *)(a1 + 32)];
      fprintf(v12, "%s\n", (const char *)[v13 UTF8String]);

      fflush(*v11);
    }
    goto LABEL_19;
  }
  if (![v3 _purgeNotificationsWithMinDate:v17]
    || (unint64_t)[*(id *)(*(void *)(a1 + 48) + 24) count] <= 0x3E8)
  {
    v4 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:*(void *)(a1 + 32)];
    v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 compare:*(void *)(a1 + 40)];
      uint64_t v7 = *(void *)(a1 + 48);
      if (v6 != -1)
      {
        if (*(unsigned char *)(v7 + 16))
        {
          v8 = (FILE **)MEMORY[0x1E4F143D8];
          id v9 = (FILE *)*MEMORY[0x1E4F143D8];
          id v10 = [NSString stringWithFormat:@"not updating notification for %@", *(void *)(a1 + 32)];
          fprintf(v9, "%s\n", (const char *)[v10 UTF8String]);

          fflush(*v8);
        }
        goto LABEL_18;
      }
      if (*(unsigned char *)(v7 + 16))
      {
        objc_super v14 = (FILE **)MEMORY[0x1E4F143D8];
        v15 = (FILE *)*MEMORY[0x1E4F143D8];
        [NSString stringWithFormat:@"updating notification for %@", *(void *)(a1 + 32)];
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 48);
      if (*(unsigned char *)(v7 + 16))
      {
        objc_super v14 = (FILE **)MEMORY[0x1E4F143D8];
        v15 = (FILE *)*MEMORY[0x1E4F143D8];
        [NSString stringWithFormat:@"setting notification date for %@", *(void *)(a1 + 32)];
LABEL_16:
        id v16 = objc_claimAutoreleasedReturnValue();
        fprintf(v15, "%s\n", (const char *)[v16 UTF8String]);

        fflush(*v14);
        uint64_t v7 = *(void *)(a1 + 48);
      }
    }
    [*(id *)(v7 + 24) setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
LABEL_18:
  }
LABEL_19:
}

- (BOOL)_purgeNotificationsWithMinDate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v5 = [(NSMutableDictionary *)self->_recentNotifications count];
  if (v5 >= 0x64)
  {
    uint64_t v6 = (void *)MEMORY[0x1D25F6CC0]();
    recentNotifications = self->_recentNotifications;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __59__ATXBBNotificationManager__purgeNotificationsWithMinDate___block_invoke;
    v20 = &unk_1E68B3C08;
    id v21 = v4;
    v8 = [(NSMutableDictionary *)recentNotifications keysOfEntriesPassingTest:&v17];
    id v9 = (FILE **)MEMORY[0x1E4F143D8];
    if (self->_debugOutput)
    {
      id v10 = (FILE *)*MEMORY[0x1E4F143D8];
      id v11 = [NSString stringWithFormat:@"bundleIdsToRemove: %@", v8, v17, v18, v19, v20];
      fprintf(v10, "%s\n", (const char *)[v11 UTF8String]);

      fflush(*v9);
    }
    id v12 = self->_recentNotifications;
    id v13 = [v8 allObjects];
    [(NSMutableDictionary *)v12 removeObjectsForKeys:v13];

    if (self->_debugOutput)
    {
      objc_super v14 = *v9;
      objc_msgSend(NSString, "stringWithFormat:", @"entries remaining after purge: %lu", -[NSMutableDictionary count](self->_recentNotifications, "count"));
      id v15 = objc_claimAutoreleasedReturnValue();
      fprintf(v14, "%s\n", (const char *)[v15 UTF8String]);

      fflush(*v9);
    }
  }

  return v5 > 0x63;
}

BOOL __59__ATXBBNotificationManager__purgeNotificationsWithMinDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:*(void *)(a1 + 32)] == 1;
}

- (id)recentNotifications
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-600.0];
  uint64_t v12 = 0;
  v13[0] = &v12;
  v13[1] = 0x3032000000;
  v13[2] = __Block_byref_object_copy__77;
  v13[3] = __Block_byref_object_dispose__77;
  id v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ATXBBNotificationManager_recentNotifications__block_invoke;
  block[3] = &unk_1E68AD278;
  void block[4] = self;
  id v5 = v3;
  id v10 = v5;
  id v11 = &v12;
  dispatch_sync(queue, block);
  uint64_t v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(ATXBBNotificationManager *)(uint64_t)v13 recentNotifications];
  }

  id v7 = *(id *)(v13[0] + 40);
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __47__ATXBBNotificationManager_recentNotifications__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _purgeNotificationsWithMinDate:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentNotifications, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)recentNotifications
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Recent notifications: %@", (uint8_t *)&v3, 0xCu);
}

@end