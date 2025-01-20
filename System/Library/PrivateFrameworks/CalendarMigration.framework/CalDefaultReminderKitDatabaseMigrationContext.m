@interface CalDefaultReminderKitDatabaseMigrationContext
+ (unint64_t)remMigrationStageFromCalMigrationStage:(unint64_t)a3;
- (BOOL)ensureAccountsExist:(id)a3 error:(id *)a4;
- (BOOL)shouldDeleteMigratedData;
- (BOOL)shouldPerformMigration;
- (CalDefaultReminderKitDatabaseMigrationContext)init;
- (REMDatabaseMigrationContext)remDatabaseMigrationContext;
- (REMStore)reminderStore;
- (void)didEndMigrationWithSuccess:(BOOL)a3;
- (void)migrationDidFinishWithResult:(unint64_t)a3;
- (void)recordMigrationFailure:(id)a3;
- (void)willBeginMigration;
@end

@implementation CalDefaultReminderKitDatabaseMigrationContext

- (CalDefaultReminderKitDatabaseMigrationContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)CalDefaultReminderKitDatabaseMigrationContext;
  v2 = [(CalDefaultReminderKitDatabaseMigrationContext *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getREMDatabaseMigrationContextClass_softClass;
    uint64_t v13 = getREMDatabaseMigrationContextClass_softClass;
    if (!getREMDatabaseMigrationContextClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getREMDatabaseMigrationContextClass_block_invoke;
      v9[3] = &unk_2645A4398;
      v9[4] = &v10;
      __getREMDatabaseMigrationContextClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = objc_opt_new();
    remDatabaseMigrationContext = v2->_remDatabaseMigrationContext;
    v2->_remDatabaseMigrationContext = (REMDatabaseMigrationContext *)v5;
  }
  return v2;
}

- (void)willBeginMigration
{
  id v2 = [(CalDefaultReminderKitDatabaseMigrationContext *)self remDatabaseMigrationContext];
  [v2 reportMigrationWillBegin];
}

- (void)didEndMigrationWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CalDefaultReminderKitDatabaseMigrationContext *)self remDatabaseMigrationContext];
  [v4 reportMigrationDidFinishWithSuccess:v3];
}

- (void)recordMigrationFailure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "remMigrationStageFromCalMigrationStage:", objc_msgSend(v4, "stage"));
  id v9 = [(CalDefaultReminderKitDatabaseMigrationContext *)self remDatabaseMigrationContext];
  v6 = [v4 failureDescription];
  v7 = [v4 underlyingError];
  objc_super v8 = [v4 relatedPath];

  [v9 reportMigrationErrorWithIdentifier:v6 atStage:v5 error:v7 objectLocator:v8];
}

+ (unint64_t)remMigrationStageFromCalMigrationStage:(unint64_t)a3
{
  if (a3 > 7) {
    return 1;
  }
  else {
    return qword_221352220[a3];
  }
}

- (BOOL)ensureAccountsExist:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CalDefaultReminderKitDatabaseMigrationContext *)self remDatabaseMigrationContext];
  LOBYTE(a4) = [v7 ensureAccountsExist:v6 error:a4];

  return (char)a4;
}

- (REMStore)reminderStore
{
  id v2 = [(CalDefaultReminderKitDatabaseMigrationContext *)self remDatabaseMigrationContext];
  BOOL v3 = [v2 remStore];

  return (REMStore *)v3;
}

- (BOOL)shouldPerformMigration
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [(CalDefaultReminderKitDatabaseMigrationContext *)self remDatabaseMigrationContext];
  uint64_t v3 = [v2 isDatabaseMigrated];

  id v4 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [NSNumber numberWithBool:v3];
    int v7 = 138543362;
    objc_super v8 = v5;
    _os_log_impl(&dword_22133F000, v4, OS_LOG_TYPE_INFO, "ReminderKit says isDatabaseMigrated = %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v3 ^ 1;
}

- (BOOL)shouldDeleteMigratedData
{
  id v2 = [(CalDefaultReminderKitDatabaseMigrationContext *)self remDatabaseMigrationContext];
  char v3 = [v2 shouldDeleteMigratedData];

  return v3;
}

- (void)migrationDidFinishWithResult:(unint64_t)a3
{
  if (!a3)
  {
    [(CalDefaultReminderKitDatabaseMigrationContext *)self willBeginMigration];
    [(CalDefaultReminderKitDatabaseMigrationContext *)self didEndMigrationWithSuccess:1];
  }
}

- (REMDatabaseMigrationContext)remDatabaseMigrationContext
{
  return self->_remDatabaseMigrationContext;
}

- (void).cxx_destruct
{
}

@end