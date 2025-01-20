@interface CalMigrationToolOptions
+ (id)_stringForTriStateOption:(int64_t)a3;
- (BOOL)migrateUsingCalendarDaemon;
- (BOOL)waitForRemindersOnly;
- (CalMigrationToolOptions)initWithHomeDirectory:(id)a3;
- (CalMigrationToolOptions)initWithHomeDirectory:(id)a3 destinationDirectory:(id)a4 performCalendarMigration:(int64_t)a5 performReminderMigration:(int64_t)a6 performCleanup:(int64_t)a7 deleteMigratedData:(int64_t)a8 backupBeforeCalendarMigration:(int64_t)a9 backupBeforeReminderMigration:(int64_t)a10 saveAccountsChangesToFile:(id)a11 accountsDatabaseFile:(id)a12;
- (CalMigrationToolOptions)initWithSourceCalendarDirectory:(id)a3 destinationDirectory:(id)a4 performCalendarMigration:(int64_t)a5 performReminderMigration:(int64_t)a6 performCleanup:(int64_t)a7 deleteMigratedData:(int64_t)a8 backupBeforeCalendarMigration:(int64_t)a9 backupBeforeReminderMigration:(int64_t)a10 saveAccountsChangesToFile:(id)a11 accountsDatabaseFile:(id)a12;
- (NSURL)accountsChangesFile;
- (NSURL)accountsDatabaseFile;
- (NSURL)destinationDirectory;
- (NSURL)homeDirectory;
- (NSURL)sourceCalendarDirectory;
- (id)_initWithHomeDirectory:(id)a3 sourceCalendarDirectory:(id)a4 destinationDirectory:(id)a5 migrateUsingCalendarDaemon:(BOOL)a6 waitForRemindersOnly:(BOOL)a7 performCalendarMigration:(int64_t)a8 performReminderMigration:(int64_t)a9 performCleanup:(int64_t)a10 deleteMigratedData:(int64_t)a11 backupBeforeCalendarMigration:(int64_t)a12 backupBeforeReminderMigration:(int64_t)a13 saveAccountsChangesToFile:(id)a14 accountsDatabaseFile:(id)a15;
- (id)description;
- (id)initUsingCalendarDaemon;
- (id)initUsingCalendarDaemonWaitingForRemindersOnly;
- (int64_t)backupBeforeCalendarMigration;
- (int64_t)backupBeforeReminderMigration;
- (int64_t)deleteMigratedData;
- (int64_t)performCalendarMigration;
- (int64_t)performCleanup;
- (int64_t)performReminderMigration;
@end

@implementation CalMigrationToolOptions

- (id)initUsingCalendarDaemon
{
  return [(CalMigrationToolOptions *)self _initWithHomeDirectory:0 sourceCalendarDirectory:0 destinationDirectory:0 migrateUsingCalendarDaemon:1 waitForRemindersOnly:0 performCalendarMigration:-1 performReminderMigration:-1 performCleanup:-1 deleteMigratedData:-1 backupBeforeCalendarMigration:-1 backupBeforeReminderMigration:-1 saveAccountsChangesToFile:0 accountsDatabaseFile:0];
}

- (id)initUsingCalendarDaemonWaitingForRemindersOnly
{
  return [(CalMigrationToolOptions *)self _initWithHomeDirectory:0 sourceCalendarDirectory:0 destinationDirectory:0 migrateUsingCalendarDaemon:1 waitForRemindersOnly:1 performCalendarMigration:-1 performReminderMigration:-1 performCleanup:-1 deleteMigratedData:-1 backupBeforeCalendarMigration:-1 backupBeforeReminderMigration:-1 saveAccountsChangesToFile:0 accountsDatabaseFile:0];
}

- (CalMigrationToolOptions)initWithHomeDirectory:(id)a3
{
  return [(CalMigrationToolOptions *)self initWithHomeDirectory:a3 destinationDirectory:0 performCalendarMigration:-1 performReminderMigration:-1 performCleanup:-1 deleteMigratedData:-1 backupBeforeCalendarMigration:-1 backupBeforeReminderMigration:-1 saveAccountsChangesToFile:0 accountsDatabaseFile:0];
}

- (CalMigrationToolOptions)initWithHomeDirectory:(id)a3 destinationDirectory:(id)a4 performCalendarMigration:(int64_t)a5 performReminderMigration:(int64_t)a6 performCleanup:(int64_t)a7 deleteMigratedData:(int64_t)a8 backupBeforeCalendarMigration:(int64_t)a9 backupBeforeReminderMigration:(int64_t)a10 saveAccountsChangesToFile:(id)a11 accountsDatabaseFile:(id)a12
{
  return (CalMigrationToolOptions *)[(CalMigrationToolOptions *)self _initWithHomeDirectory:a3 sourceCalendarDirectory:0 destinationDirectory:a4 migrateUsingCalendarDaemon:0 waitForRemindersOnly:0 performCalendarMigration:a5 performReminderMigration:a6 performCleanup:a7 deleteMigratedData:a8 backupBeforeCalendarMigration:a9 backupBeforeReminderMigration:a10 saveAccountsChangesToFile:a11 accountsDatabaseFile:a12];
}

- (CalMigrationToolOptions)initWithSourceCalendarDirectory:(id)a3 destinationDirectory:(id)a4 performCalendarMigration:(int64_t)a5 performReminderMigration:(int64_t)a6 performCleanup:(int64_t)a7 deleteMigratedData:(int64_t)a8 backupBeforeCalendarMigration:(int64_t)a9 backupBeforeReminderMigration:(int64_t)a10 saveAccountsChangesToFile:(id)a11 accountsDatabaseFile:(id)a12
{
  return (CalMigrationToolOptions *)[(CalMigrationToolOptions *)self _initWithHomeDirectory:0 sourceCalendarDirectory:a3 destinationDirectory:a4 migrateUsingCalendarDaemon:0 waitForRemindersOnly:0 performCalendarMigration:a5 performReminderMigration:a6 performCleanup:a7 deleteMigratedData:a8 backupBeforeCalendarMigration:a9 backupBeforeReminderMigration:a10 saveAccountsChangesToFile:a11 accountsDatabaseFile:a12];
}

- (id)_initWithHomeDirectory:(id)a3 sourceCalendarDirectory:(id)a4 destinationDirectory:(id)a5 migrateUsingCalendarDaemon:(BOOL)a6 waitForRemindersOnly:(BOOL)a7 performCalendarMigration:(int64_t)a8 performReminderMigration:(int64_t)a9 performCleanup:(int64_t)a10 deleteMigratedData:(int64_t)a11 backupBeforeCalendarMigration:(int64_t)a12 backupBeforeReminderMigration:(int64_t)a13 saveAccountsChangesToFile:(id)a14 accountsDatabaseFile:(id)a15
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v29 = a14;
  id v28 = a15;
  v30.receiver = self;
  v30.super_class = (Class)CalMigrationToolOptions;
  v23 = [(CalMigrationToolOptions *)&v30 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_homeDirectory, a3);
    objc_storeStrong((id *)&v24->_sourceCalendarDirectory, a4);
    objc_storeStrong((id *)&v24->_destinationDirectory, a5);
    v24->_migrateUsingCalendarDaemon = a6;
    v24->_waitForRemindersOnly = a7;
    v24->_performCalendarMigration = a8;
    v24->_performReminderMigration = a9;
    v24->_performCleanup = a10;
    v24->_deleteMigratedData = a11;
    v24->_backupBeforeCalendarMigration = a12;
    v24->_backupBeforeReminderMigration = a13;
    objc_storeStrong((id *)&v24->_accountsChangesFile, a14);
    objc_storeStrong((id *)&v24->_accountsDatabaseFile, a15);
  }

  return v24;
}

+ (id)_stringForTriStateOption:(int64_t)a3
{
  v3 = @"default";
  if (a3 == 1) {
    v3 = @"enable";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"disable";
  }
}

- (id)description
{
  if ([(CalMigrationToolOptions *)self migrateUsingCalendarDaemon])
  {
    v3 = NSString;
    uint64_t v4 = objc_opt_class();
    BOOL v5 = [(CalMigrationToolOptions *)self waitForRemindersOnly];
    v6 = @"NO";
    if (v5) {
      v6 = @"YES";
    }
    v7 = [v3 stringWithFormat:@"<%@: %p>(\n migrateUsingCalendarDaemon = YES,\n waitForRemindersOnly = %@\n)", v4, self, v6];
  }
  else
  {
    v8 = [(CalMigrationToolOptions *)self homeDirectory];

    if (v8)
    {
      v9 = [(CalMigrationToolOptions *)self homeDirectory];
      v10 = @"homeDirectory";
    }
    else
    {
      v9 = [(CalMigrationToolOptions *)self sourceCalendarDirectory];
      v10 = @"sourceCalendarDirectory";
    }
    v23 = v10;
    id v22 = [v9 path];

    id v21 = NSString;
    uint64_t v20 = objc_opt_class();
    v24 = [(CalMigrationToolOptions *)self destinationDirectory];
    v27 = [v24 path];
    v26 = objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions performCalendarMigration](self, "performCalendarMigration"));
    v25 = objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions performReminderMigration](self, "performReminderMigration"));
    v19 = objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions performCleanup](self, "performCleanup"));
    v11 = objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions deleteMigratedData](self, "deleteMigratedData"));
    v12 = objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions backupBeforeCalendarMigration](self, "backupBeforeCalendarMigration"));
    v13 = objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions backupBeforeCalendarMigration](self, "backupBeforeCalendarMigration"));
    v14 = [(CalMigrationToolOptions *)self accountsChangesFile];
    v15 = [v14 path];
    v16 = [(CalMigrationToolOptions *)self accountsDatabaseFile];
    v17 = [v16 path];
    v7 = [v21 stringWithFormat:@"<%@: %p>(\n %@ = %@,\n destinationDirectory = %@,\n performCalendarMigration = %@,\n performReminderMigration = %@,\n performCleanup = %@,\n deleteMigratedData = %@,\n backupBeforeCalendarMigration = %@,\n backupBeforeReminderMigration = %@,\n accountChangesFile = %@,\n accountsDatabaseFile = %@,\n)", v20, self, v23, v22, v27, v26, v25, v19, v11, v12, v13, v15, v17];
  }
  return v7;
}

- (BOOL)migrateUsingCalendarDaemon
{
  return self->_migrateUsingCalendarDaemon;
}

- (BOOL)waitForRemindersOnly
{
  return self->_waitForRemindersOnly;
}

- (NSURL)homeDirectory
{
  return self->_homeDirectory;
}

- (NSURL)sourceCalendarDirectory
{
  return self->_sourceCalendarDirectory;
}

- (NSURL)destinationDirectory
{
  return self->_destinationDirectory;
}

- (int64_t)performCalendarMigration
{
  return self->_performCalendarMigration;
}

- (int64_t)performReminderMigration
{
  return self->_performReminderMigration;
}

- (int64_t)performCleanup
{
  return self->_performCleanup;
}

- (int64_t)deleteMigratedData
{
  return self->_deleteMigratedData;
}

- (int64_t)backupBeforeCalendarMigration
{
  return self->_backupBeforeCalendarMigration;
}

- (int64_t)backupBeforeReminderMigration
{
  return self->_backupBeforeReminderMigration;
}

- (NSURL)accountsChangesFile
{
  return self->_accountsChangesFile;
}

- (NSURL)accountsDatabaseFile
{
  return self->_accountsDatabaseFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsDatabaseFile, 0);
  objc_storeStrong((id *)&self->_accountsChangesFile, 0);
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
  objc_storeStrong((id *)&self->_sourceCalendarDirectory, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
}

@end