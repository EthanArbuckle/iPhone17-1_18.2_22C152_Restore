@interface CalMigrationToolReminderMigrationController
- (BOOL)shouldPerformMigration;
- (CalMigrationController)defaultProvider;
- (CalMigrationToolOptions)toolOptions;
- (CalMigrationToolReminderMigrationController)initWithToolOptions:(id)a3 defaultProvider:(id)a4;
- (void)migrationDidFinishWithResult:(unint64_t)a3;
@end

@implementation CalMigrationToolReminderMigrationController

- (CalMigrationToolReminderMigrationController)initWithToolOptions:(id)a3 defaultProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalMigrationToolReminderMigrationController;
  v9 = [(CalMigrationToolReminderMigrationController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_toolOptions, a3);
    objc_storeStrong((id *)&v10->_defaultProvider, a4);
  }

  return v10;
}

- (BOOL)shouldPerformMigration
{
  v3 = [(CalMigrationToolReminderMigrationController *)self toolOptions];
  uint64_t v4 = [v3 performReminderMigration];

  if (v4 == 1) {
    return 1;
  }
  if (v4 != -1) {
    return 0;
  }
  v5 = [(CalMigrationToolReminderMigrationController *)self defaultProvider];
  char v6 = [v5 shouldPerformMigration];

  return v6;
}

- (void)migrationDidFinishWithResult:(unint64_t)a3
{
  id v3 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"This method should not be called in CalendarMigrationTool" userInfo:0];
  [v3 raise];
}

- (CalMigrationToolOptions)toolOptions
{
  return self->_toolOptions;
}

- (CalMigrationController)defaultProvider
{
  return self->_defaultProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProvider, 0);
  objc_storeStrong((id *)&self->_toolOptions, 0);
}

@end