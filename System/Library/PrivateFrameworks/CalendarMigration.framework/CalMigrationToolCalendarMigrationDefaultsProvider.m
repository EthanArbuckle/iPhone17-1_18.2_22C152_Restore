@interface CalMigrationToolCalendarMigrationDefaultsProvider
- (BOOL)isHolidayCalendarEnabled;
- (BOOL)needsMigrationCleanupWithDestinationDirectory:(id)a3;
- (BOOL)shouldBackupBeforeMigration;
- (BOOL)shouldDeleteMigratedData;
- (BOOL)shouldPerformMigrationWithDestinationDirectory:(id)a3;
- (CalCalendarMigrationDefaultsProvider)defaultProvider;
- (CalMigrationToolCalendarMigrationDefaultsProvider)initWithToolOptions:(id)a3 defaultProvider:(id)a4;
- (CalMigrationToolOptions)toolOptions;
- (NSString)defaultCalendarUUID;
- (void)clearLegacyDefaults;
- (void)migrateLegacyDefaults;
- (void)recordMigrationDidBeginWithDestinationDirectory:(id)a3;
- (void)recordMigrationDidEndWithReason:(unint64_t)a3;
- (void)setDefaultAllDayAlarmOffset:(id)a3;
- (void)setDefaultCalendarExternalIDOrUUID:(id)a3 storeID:(int)a4;
- (void)setDefaultTimedAlarmOffset:(id)a3;
@end

@implementation CalMigrationToolCalendarMigrationDefaultsProvider

- (CalMigrationToolCalendarMigrationDefaultsProvider)initWithToolOptions:(id)a3 defaultProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalMigrationToolCalendarMigrationDefaultsProvider;
  v9 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_toolOptions, a3);
    objc_storeStrong((id *)&v10->_defaultProvider, a4);
  }

  return v10;
}

- (BOOL)shouldPerformMigrationWithDestinationDirectory:(id)a3
{
  v4 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self toolOptions];
  uint64_t v5 = [v4 performCalendarMigration];

  if (v5 == 1) {
    return 1;
  }
  if (v5 != -1) {
    return 0;
  }
  v6 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  id v7 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self toolOptions];
  id v8 = [v7 destinationDirectory];
  char v9 = [v6 shouldPerformMigrationWithDestinationDirectory:v8];

  return v9;
}

- (BOOL)shouldBackupBeforeMigration
{
  v3 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self toolOptions];
  uint64_t v4 = [v3 backupBeforeCalendarMigration];

  if (v4 == 1) {
    return 1;
  }
  if (v4 != -1) {
    return 0;
  }
  uint64_t v5 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  char v6 = [v5 shouldBackupBeforeMigration];

  return v6;
}

- (BOOL)shouldDeleteMigratedData
{
  v3 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self toolOptions];
  uint64_t v4 = [v3 deleteMigratedData];

  if (v4 == 1) {
    return 1;
  }
  if (v4 != -1) {
    return 0;
  }
  uint64_t v5 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  char v6 = [v5 shouldDeleteMigratedData];

  return v6;
}

- (BOOL)needsMigrationCleanupWithDestinationDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  char v6 = [v5 needsMigrationCleanupWithDestinationDirectory:v4];

  return v6;
}

- (BOOL)isHolidayCalendarEnabled
{
  v2 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  char v3 = [v2 isHolidayCalendarEnabled];

  return v3;
}

- (void)migrateLegacyDefaults
{
  id v2 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  [v2 migrateLegacyDefaults];
}

- (void)clearLegacyDefaults
{
  id v2 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  [v2 clearLegacyDefaults];
}

- (void)recordMigrationDidBeginWithDestinationDirectory:(id)a3
{
  id v4 = a3;
  id v5 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  [v5 recordMigrationDidBeginWithDestinationDirectory:v4];
}

- (void)recordMigrationDidEndWithReason:(unint64_t)a3
{
  id v4 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  [v4 recordMigrationDidEndWithReason:a3];
}

- (void)setDefaultTimedAlarmOffset:(id)a3
{
  id v4 = a3;
  id v5 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  [v5 setDefaultTimedAlarmOffset:v4];
}

- (void)setDefaultAllDayAlarmOffset:(id)a3
{
  id v4 = a3;
  id v5 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  [v5 setDefaultAllDayAlarmOffset:v4];
}

- (NSString)defaultCalendarUUID
{
  id v2 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  char v3 = [v2 defaultCalendarUUID];

  return (NSString *)v3;
}

- (void)setDefaultCalendarExternalIDOrUUID:(id)a3 storeID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(CalMigrationToolCalendarMigrationDefaultsProvider *)self defaultProvider];
  [v7 setDefaultCalendarExternalIDOrUUID:v6 storeID:v4];
}

- (CalMigrationToolOptions)toolOptions
{
  return self->_toolOptions;
}

- (CalCalendarMigrationDefaultsProvider)defaultProvider
{
  return self->_defaultProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProvider, 0);
  objc_storeStrong((id *)&self->_toolOptions, 0);
}

@end