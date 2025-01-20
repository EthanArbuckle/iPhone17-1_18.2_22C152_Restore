@interface CalDefaultCalendarMigrationController
- (BOOL)shouldPerformMigration;
- (CalCalendarMigrationDefaultsProvider)defaultsProvider;
- (CalDefaultCalendarMigrationController)initWithDefaultsProvider:(id)a3;
@end

@implementation CalDefaultCalendarMigrationController

- (CalDefaultCalendarMigrationController)initWithDefaultsProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalDefaultCalendarMigrationController;
  v6 = [(CalDefaultCalendarMigrationController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaultsProvider, a3);
  }

  return v7;
}

- (BOOL)shouldPerformMigration
{
  v3 = [(CalDefaultCalendarMigrationController *)self defaultsProvider];
  int v4 = [v3 shouldPerformMigrationWithDestinationDirectory:0];

  if (v4)
  {
    id v5 = +[CalMigrationLog calendar];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      v6 = "Should perform migration because the defaults provider says so.";
      v7 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v8 = [(CalDefaultCalendarMigrationController *)self defaultsProvider];
  int v9 = [v8 needsMigrationCleanupWithDestinationDirectory:0];

  if (v9)
  {
    id v5 = +[CalMigrationLog calendar];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      v6 = "Should perform migration because the defaults provider says we need to run cleanup.";
      v7 = (uint8_t *)&v11;
      goto LABEL_7;
    }
LABEL_8:

    return 1;
  }
  return 0;
}

- (CalCalendarMigrationDefaultsProvider)defaultsProvider
{
  return self->_defaultsProvider;
}

- (void).cxx_destruct
{
}

@end