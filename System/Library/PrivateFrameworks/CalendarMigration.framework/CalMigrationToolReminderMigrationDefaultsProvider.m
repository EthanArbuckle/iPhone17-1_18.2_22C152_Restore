@interface CalMigrationToolReminderMigrationDefaultsProvider
- (BOOL)havePerformedReminderMigrationCleanup;
- (BOOL)shouldBackupBeforeMigration;
- (CalCalendarMigrationDefaultsProvider)calendarDefaultsProvider;
- (CalMigrationController)calendarMigrationController;
- (CalMigrationToolOptions)toolOptions;
- (CalMigrationToolReminderMigrationDefaultsProvider)initWithToolOptions:(id)a3 reminderDefaultsProvider:(id)a4 calendarDefaultsProvider:(id)a5 calendarMigrationController:(id)a6;
- (CalReminderMigrationDefaultsProvider)reminderDefaultsProvider;
- (void)setHavePerformedReminderMigrationCleanup:(BOOL)a3;
@end

@implementation CalMigrationToolReminderMigrationDefaultsProvider

- (CalMigrationToolReminderMigrationDefaultsProvider)initWithToolOptions:(id)a3 reminderDefaultsProvider:(id)a4 calendarDefaultsProvider:(id)a5 calendarMigrationController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CalMigrationToolReminderMigrationDefaultsProvider;
  v15 = [(CalMigrationToolReminderMigrationDefaultsProvider *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_toolOptions, a3);
    objc_storeStrong((id *)&v16->_reminderDefaultsProvider, a4);
    objc_storeStrong((id *)&v16->_calendarDefaultsProvider, a5);
    objc_storeStrong((id *)&v16->_calendarMigrationController, a6);
  }

  return v16;
}

- (BOOL)shouldBackupBeforeMigration
{
  v3 = [(CalMigrationToolReminderMigrationDefaultsProvider *)self toolOptions];
  uint64_t v4 = [v3 backupBeforeReminderMigration];

  if (v4 == 1) {
    return 1;
  }
  if (v4 != -1) {
    return 0;
  }
  v5 = [(CalMigrationToolReminderMigrationDefaultsProvider *)self reminderDefaultsProvider];
  char v6 = [v5 shouldBackupBeforeMigration];

  return v6;
}

- (BOOL)havePerformedReminderMigrationCleanup
{
  v3 = [(CalMigrationToolReminderMigrationDefaultsProvider *)self toolOptions];
  uint64_t v4 = [v3 performCleanup];

  if (v4 != -1) {
    return v4 == 0;
  }
  char v6 = [(CalMigrationToolReminderMigrationDefaultsProvider *)self reminderDefaultsProvider];
  char v7 = [v6 havePerformedReminderMigrationCleanup];

  return v7;
}

- (void)setHavePerformedReminderMigrationCleanup:(BOOL)a3
{
  id v3 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"This method should not be called in CalendarMigrationTool" userInfo:0];
  [v3 raise];
}

- (CalMigrationToolOptions)toolOptions
{
  return self->_toolOptions;
}

- (CalReminderMigrationDefaultsProvider)reminderDefaultsProvider
{
  return self->_reminderDefaultsProvider;
}

- (CalCalendarMigrationDefaultsProvider)calendarDefaultsProvider
{
  return self->_calendarDefaultsProvider;
}

- (CalMigrationController)calendarMigrationController
{
  return self->_calendarMigrationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarMigrationController, 0);
  objc_storeStrong((id *)&self->_calendarDefaultsProvider, 0);
  objc_storeStrong((id *)&self->_reminderDefaultsProvider, 0);
  objc_storeStrong((id *)&self->_toolOptions, 0);
}

@end