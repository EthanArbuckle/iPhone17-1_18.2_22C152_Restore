@interface FIMindfulnessCustomReminderProvider
- (FIMindfulnessCustomReminderProvider)init;
- (id)reminders;
- (void)reminders;
- (void)updateReminders:(id)a3;
@end

@implementation FIMindfulnessCustomReminderProvider

- (FIMindfulnessCustomReminderProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)FIMindfulnessCustomReminderProvider;
  v2 = [(FIMindfulnessCustomReminderProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;
  }
  return v2;
}

- (id)reminders
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CustomReminders", @"com.apple.Mind");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v4 = (void *)MEMORY[0x263EFFA08];
  if (isKindOfClass)
  {
    uint64_t v5 = objc_opt_class();
    objc_super v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    id v13 = 0;
    v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v6 fromData:v2 error:&v13];
    id v8 = v13;
    if (v7)
    {
      uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v7];
    }
    else
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x263F098F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F0], OS_LOG_TYPE_ERROR)) {
        [(FIMindfulnessCustomReminderProvider *)(uint64_t)v8 reminders];
      }
      uint64_t v9 = [MEMORY[0x263EFFA08] set];
    }
    v10 = (void *)v9;
  }
  else
  {
    v10 = [MEMORY[0x263EFFA08] set];
  }

  return v10;
}

- (void)updateReminders:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F08910];
  uint64_t v5 = [a3 allObjects];
  id v14 = 0;
  objc_super v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v14];
  id v7 = v14;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    CFPreferencesSetAppValue(@"CustomReminders", v6, @"com.apple.Mind");
    CFPreferencesAppSynchronize(@"com.apple.Mind");
    syncManager = self->_syncManager;
    v11 = (void *)MEMORY[0x263EFFA08];
    v15[0] = @"CustomReminders";
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    id v13 = [v11 setWithArray:v12];
    [(NPSManager *)syncManager synchronizeUserDefaultsDomain:@"com.apple.Mind" keys:v13];

    notify_post("NanoLifestyleMindfulnessPreferencesChangedNotification");
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x263F098F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F0], OS_LOG_TYPE_ERROR)) {
      -[FIMindfulnessCustomReminderProvider updateReminders:]((uint64_t)v7, v9);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)reminders
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C74B000, a2, OS_LOG_TYPE_ERROR, "Error to unarchiving reminders %@", (uint8_t *)&v2, 0xCu);
}

- (void)updateReminders:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C74B000, a2, OS_LOG_TYPE_ERROR, "Error to archiving reminders %@", (uint8_t *)&v2, 0xCu);
}

@end