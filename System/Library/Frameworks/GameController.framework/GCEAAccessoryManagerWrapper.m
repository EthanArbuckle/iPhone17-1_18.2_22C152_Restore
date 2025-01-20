@interface GCEAAccessoryManagerWrapper
+ (id)observers;
+ (void)registerForLocalNotificationsWithObserver:(id)a3;
+ (void)unregisterForLocalNotificationsWithObserver:(id)a3;
@end

@implementation GCEAAccessoryManagerWrapper

+ (id)observers
{
  if (observers_onceToken != -1) {
    dispatch_once(&observers_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)observers__observers;

  return v2;
}

void __40__GCEAAccessoryManagerWrapper_observers__block_invoke()
{
  uint64_t v0 = +[NSHashTable weakObjectsHashTable];
  v1 = (void *)observers__observers;
  observers__observers = v0;
}

+ (void)registerForLocalNotificationsWithObserver:(id)a3
{
  id v11 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = +[GCEAAccessoryManagerWrapper observers];
  char v6 = [v5 containsObject:v11];

  if ((v6 & 1) == 0)
  {
    v7 = +[GCEAAccessoryManagerWrapper observers];
    [v7 addObject:v11];

    v8 = +[GCEAAccessoryManagerWrapper observers];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = unk_26D2C9D38(&off_26D2CBA00, "sharedAccessoryManager");
      [v10 registerForLocalNotifications];
    }
  }
  objc_sync_exit(v4);
}

+ (void)unregisterForLocalNotificationsWithObserver:(id)a3
{
  id v12 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = +[GCEAAccessoryManagerWrapper observers];
  int v6 = [v5 containsObject:v12];

  if (v6)
  {
    v7 = +[GCEAAccessoryManagerWrapper observers];
    [v7 removeObject:v12];
  }
  v8 = +[GCEAAccessoryManagerWrapper observers];
  uint64_t v9 = [v8 allObjects];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    id v11 = unk_26D2C9D38(&off_26D2CBA00, "sharedAccessoryManager");
    [v11 unregisterForLocalNotifications];
  }
  objc_sync_exit(v4);
}

@end