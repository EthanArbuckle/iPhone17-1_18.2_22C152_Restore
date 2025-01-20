@interface ISMigrator
+ (id)migratorForNewUserAccountWithVersion:(id)a3;
+ (id)migratorFromSchemaVersion:(unint64_t)a3;
+ (id)migratorFromVersion:(id)a3 toVersion:(id)a4;
+ (id)migratorFromVersion:(id)a3 toVersion:(id)a4 platform:(unint64_t)a5;
+ (id)migratorFromVersion:(id)a3 toVersion:(id)a4 platform:(unint64_t)a5 newUserAccount:(BOOL)a6;
+ (unint64_t)currentPlatform;
- (BOOL)newUserAccount;
- (BOOL)previousVersionIsOlderThanMacOS:(id)a3 iOS:(id)a4 watchOS:(id)a5 tvOS:(id)a6;
- (NSString)currentVersion;
- (NSString)previousVersion;
- (id)performMigrationForPreferences:(id)a3;
- (id)performMigrationForUserPreferences:(id)a3 systemPreferences:(id)a4;
- (unint64_t)platform;
- (unint64_t)previousSchemaVersion;
- (void)setCurrentVersion:(id)a3;
- (void)setNewUserAccount:(BOOL)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setPreviousSchemaVersion:(unint64_t)a3;
- (void)setPreviousVersion:(id)a3;
@end

@implementation ISMigrator

+ (unint64_t)currentPlatform
{
  return 2;
}

+ (id)migratorFromVersion:(id)a3 toVersion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(a1, "migratorFromVersion:toVersion:platform:", v7, v6, objc_msgSend((id)objc_opt_class(), "currentPlatform"));

  return v8;
}

+ (id)migratorForNewUserAccountWithVersion:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "migratorFromVersion:toVersion:platform:newUserAccount:", &stru_1F19D5770, v4, objc_msgSend((id)objc_opt_class(), "currentPlatform"), 1);

  return v5;
}

+ (id)migratorFromVersion:(id)a3 toVersion:(id)a4 platform:(unint64_t)a5
{
  return (id)[a1 migratorFromVersion:a3 toVersion:a4 platform:a5 newUserAccount:0];
}

+ (id)migratorFromVersion:(id)a3 toVersion:(id)a4 platform:(unint64_t)a5 newUserAccount:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  [v11 setPlatform:a5];
  [v11 setPreviousVersion:v10];

  [v11 setCurrentVersion:v9];
  [v11 setNewUserAccount:v6];
  return v11;
}

+ (id)migratorFromSchemaVersion:(unint64_t)a3
{
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setPlatform:", objc_msgSend((id)objc_opt_class(), "currentPlatform"));
  [v4 setPreviousSchemaVersion:a3];
  return v4;
}

- (id)performMigrationForPreferences:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)performMigrationForUserPreferences:(id)a3 systemPreferences:(id)a4
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (BOOL)previousVersionIsOlderThanMacOS:(id)a3 iOS:(id)a4 watchOS:(id)a5 tvOS:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = [(ISMigrator *)self platform];
  v15 = v10;
  switch(v14)
  {
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      v15 = v11;
      goto LABEL_6;
    case 3uLL:
      v15 = v12;
      goto LABEL_6;
    case 4uLL:
      v15 = v13;
LABEL_6:
      id v16 = v15;
      break;
    default:
      id v16 = 0;
      break;
  }
  v17 = [(ISMigrator *)self previousVersion];
  BOOL v18 = [v17 compare:v16 options:64] == -1;

  return v18;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (NSString)previousVersion
{
  return self->_previousVersion;
}

- (void)setPreviousVersion:(id)a3
{
}

- (NSString)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
}

- (unint64_t)previousSchemaVersion
{
  return self->_previousSchemaVersion;
}

- (void)setPreviousSchemaVersion:(unint64_t)a3
{
  self->_previousSchemaVersion = a3;
}

- (BOOL)newUserAccount
{
  return self->_newUserAccount;
}

- (void)setNewUserAccount:(BOOL)a3
{
  self->_newUserAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVersion, 0);
  objc_storeStrong((id *)&self->_previousVersion, 0);
}

@end