@interface IDSDMessageStoreMigrator
+ (id)sharedInstance;
- (IDSDMessageStoreMigrator)init;
- (void)_checkAndUpdateDBIfRequiredForClass:(unsigned int)a3;
- (void)migrateClassA;
- (void)migrateClassC;
- (void)migrateClassD;
@end

@implementation IDSDMessageStoreMigrator

+ (id)sharedInstance
{
  if (qword_100A4C518 != -1) {
    dispatch_once(&qword_100A4C518, &stru_100987C28);
  }
  v2 = (void *)qword_100A4C520;

  return v2;
}

- (IDSDMessageStoreMigrator)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSDMessageStoreMigrator;
  v2 = [(IDSDMessageStoreMigrator *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(IDSDMessageStoreMigrator *)v2 _checkAndUpdateDBIfRequiredForClass:2];
    [(IDSDMessageStoreMigrator *)v3 _checkAndUpdateDBIfRequiredForClass:1];
    [(IDSDMessageStoreMigrator *)v3 _checkAndUpdateDBIfRequiredForClass:0];
  }
  return v3;
}

- (void)migrateClassA
{
}

- (void)migrateClassC
{
}

- (void)migrateClassD
{
}

- (void)_checkAndUpdateDBIfRequiredForClass:(unsigned int)a3
{
  v3 = +[IDSDMessageStore sharedInstanceForDataProtectionClass:*(void *)&a3];
  int v4 = [v3 internalMigrationVersionOnDatabase];
  if (v4 == 100)
  {
    objc_super v5 = +[IMRGLog liveMigration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DB version up to date", buf, 2u);
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v4 <= 99)
  {
    v6 = +[IDSDAccountController sharedInstance];
    objc_super v5 = [v6 accountsOfAdHocType:2];

    v7 = +[IDSPairingManager sharedInstance];
    v8 = [v7 pairedDeviceUniqueID];
    [v3 markLocalDestinationDeviceUUIDForAccounts:v5 deviceUUID:v8];

    [v3 updateInternalMigrationVersionOnDatabaseWithValue:100];
    v9 = +[IMRGLog liveMigration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updated DB to version 100", v10, 2u);
    }

    goto LABEL_8;
  }
LABEL_9:
}

@end