@interface MPActiveUserChangeMonitor
@end

@implementation MPActiveUserChangeMonitor

void __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 activeUserChangeDidFinish];
}

void __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v13 = [v3 notificationTimer];
    v15 = [*(id *)(a1 + 32) receivedNotifications];
    uint64_t v12 = [v15 count];
    v14 = [*(id *)(a1 + 32) expectedNotifications];
    uint64_t v4 = [v14 count];
    v5 = [*(id *)(a1 + 32) receivedNotifications];
    v6 = [v5 allObjects];
    v7 = [v6 componentsJoinedByString:@", "];
    v8 = [*(id *)(a1 + 32) expectedNotifications];
    v9 = [v8 allObjects];
    v10 = [v9 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 134219266;
    v18 = v3;
    __int16 v19 = 2048;
    v20 = v13;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    uint64_t v24 = v4;
    __int16 v25 = 2114;
    v26 = v7;
    __int16 v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "<_MPActiveUserChangeMonitor %p> - Firing notification timer %p [%ld of %ld notifications received] - received=[%{public}@] - expected=[%{public}@]", buf, 0x3Eu);
  }
  v11 = [*(id *)(a1 + 32) receivedNotifications];
  [v11 removeAllObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke_8;
  block[3] = &unk_1E57F9EA8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke_8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 activeUserChangeDidFinish];
}

@end