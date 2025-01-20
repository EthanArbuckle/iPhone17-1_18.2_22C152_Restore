@interface _ATXInternalUninstallNotification
+ (void)postNotificationWithUninstallSet:(id)a3 histogramBundleIdTable:(id)a4;
- (_ATXInternalUninstallNotification)init;
- (void)registerForNotificationsWithUninstallBlock:(id)a3;
@end

@implementation _ATXInternalUninstallNotification

- (_ATXInternalUninstallNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXInternalUninstallNotification;
  v2 = [(_ATXInternalUninstallNotification *)&v6 init];
  if (v2)
  {
    v3 = [[_ATXInternalNotification alloc] initWithNotificationName:@"com.apple.duetexpertd._ATXInternalUninstallNotification.appUninstalled"];
    note = v2->_note;
    v2->_note = v3;
  }
  return v2;
}

- (void)registerForNotificationsWithUninstallBlock:(id)a3
{
}

+ (void)postNotificationWithUninstallSet:(id)a3 histogramBundleIdTable:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  +[_ATXInternalNotification postData:v5 forNotificationNamed:@"com.apple.duetexpertd._ATXInternalUninstallNotification.appUninstalled"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "remove:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
}

@end