@interface _ATXInternalInstallNotification
+ (id)_installedAppsWithDatesFromNotificationData:(id)a3;
+ (void)postNotificationWithInstallDictionary:(id)a3;
- (_ATXInternalInstallNotification)init;
- (void)registerForNotificationsWithInstallBlock:(id)a3;
@end

@implementation _ATXInternalInstallNotification

- (_ATXInternalInstallNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXInternalInstallNotification;
  v2 = [(_ATXInternalInstallNotification *)&v6 init];
  if (v2)
  {
    v3 = [[_ATXInternalNotification alloc] initWithNotificationName:@"com.apple.duetexpertd._ATXInternalInstallNotification.appInstalled"];
    note = v2->_note;
    v2->_note = v3;
  }
  return v2;
}

- (void)registerForNotificationsWithInstallBlock:(id)a3
{
  id v4 = a3;
  note = self->_note;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76___ATXInternalInstallNotification_registerForNotificationsWithInstallBlock___block_invoke;
  v7[3] = &unk_1E68AF638;
  id v8 = v4;
  id v6 = v4;
  [(_ATXInternalNotification *)note registerForNotifications:v7];
}

+ (void)postNotificationWithInstallDictionary:(id)a3
{
}

+ (id)_installedAppsWithDatesFromNotificationData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
    v5 = [v4 keysOfEntriesPassingTest:&__block_literal_global_219];
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v13 = objc_msgSend(v4, "objectForKeyedSubscript:", v12, (void)v16);
          [v6 setObject:v13 forKeyedSubscript:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    v14 = (void *)[v6 copy];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
}

@end