@interface CalDefaultReminderKitProvider
+ (CalDefaultReminderKitProvider)sharedInstance;
- (BOOL)reminderKitAvailable;
- (id)newDatabaseMigrationContext;
- (id)newSaveRequestWithStore:(id)a3;
- (void)setDefaultReminderListIdentifier:(id)a3;
@end

@implementation CalDefaultReminderKitProvider

+ (CalDefaultReminderKitProvider)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return (CalDefaultReminderKitProvider *)v2;
}

uint64_t __47__CalDefaultReminderKitProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)reminderKitAvailable
{
  return ReminderKitLibraryCore() != 0;
}

- (id)newSaveRequestWithStore:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)getREMSaveRequestClass_softClass;
  uint64_t v12 = getREMSaveRequestClass_softClass;
  if (!getREMSaveRequestClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getREMSaveRequestClass_block_invoke;
    v8[3] = &unk_2645A4398;
    v8[4] = &v9;
    __getREMSaveRequestClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = v4;
  _Block_object_dispose(&v9, 8);
  v6 = (void *)[[v5 alloc] initWithStore:v3];

  return v6;
}

- (id)newDatabaseMigrationContext
{
  return (id)objc_opt_new();
}

- (void)setDefaultReminderListIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v4 = (void *)getREMUserDefaultsClass_softClass;
  uint64_t v11 = getREMUserDefaultsClass_softClass;
  if (!getREMUserDefaultsClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getREMUserDefaultsClass_block_invoke;
    v7[3] = &unk_2645A4398;
    v7[4] = &v8;
    __getREMUserDefaultsClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  v6 = [v5 daemonUserDefaults];
  [v6 setPreferredDefaultListID:v3];
}

@end