@interface IDSPersistentMigratingPersister
- (BOOL)isAvailable;
- (BOOL)migrated;
- (IDSPersistentMapPersister)destinationPersister;
- (IDSPersistentMapPersister)originPersister;
- (IDSPersistentMigratingPersister)initWithOriginPersister:(id)a3 destinationPersister:(id)a4;
- (IDSPersistentMigratingPersister)initWithOriginPersister:(id)a3 destinationPersister:(id)a4 userDefaults:(id)a5;
- (IMUserDefaults)userDefaults;
- (NSString)description;
- (NSString)identifier;
- (NSString)migrationDefaultKey;
- (id)data;
- (void)purgeData;
- (void)saveData:(id)a3 allowBackup:(BOOL)a4;
- (void)setDestinationPersister:(id)a3;
- (void)setMigrated:(BOOL)a3;
- (void)setMigrationDefaultKey:(id)a3;
- (void)setOriginPersister:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation IDSPersistentMigratingPersister

- (IDSPersistentMigratingPersister)initWithOriginPersister:(id)a3 destinationPersister:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[IMUserDefaults sharedDefaults];
  v9 = [(IDSPersistentMigratingPersister *)self initWithOriginPersister:v7 destinationPersister:v6 userDefaults:v8];

  return v9;
}

- (IDSPersistentMigratingPersister)initWithOriginPersister:(id)a3 destinationPersister:(id)a4 userDefaults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)IDSPersistentMigratingPersister;
  v11 = [(IDSPersistentMigratingPersister *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userDefaults, a5);
    objc_storeStrong((id *)&v12->_destinationPersister, a4);
    v13 = [v9 identifier];
    uint64_t v14 = +[NSString stringWithFormat:@"persister-migration-%@", v13];
    migrationDefaultKey = v12->_migrationDefaultKey;
    v12->_migrationDefaultKey = (NSString *)v14;

    unsigned __int8 v16 = [(IMUserDefaults *)v12->_userDefaults appBoolForKey:v12->_migrationDefaultKey];
    v12->_migrated = v16;
    if (v16)
    {
      originPersister = v12->_migrationDefaultKey;
      v12->_migrationDefaultKey = 0;
    }
    else
    {
      v18 = (IDSPersistentMapPersister *)v8;
      originPersister = v12->_originPersister;
      v12->_originPersister = v18;
    }
  }
  return v12;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; origin = %@; destination = %@>",
    v4,
    self,
    self->_originPersister,
  v5 = self->_destinationPersister);

  return (NSString *)v5;
}

- (NSString)identifier
{
  return (NSString *)[(IDSPersistentMapPersister *)self->_destinationPersister identifier];
}

- (BOOL)isAvailable
{
  if (self->_migrated
    || (unsigned int v3 = [(IDSPersistentMapPersister *)self->_originPersister isAvailable]) != 0)
  {
    destinationPersister = self->_destinationPersister;
    LOBYTE(v3) = [(IDSPersistentMapPersister *)destinationPersister isAvailable];
  }
  return v3;
}

- (id)data
{
  if ([(IDSPersistentMigratingPersister *)self isAvailable])
  {
    uint64_t v3 = 24;
    if (!self->_migrated) {
      uint64_t v3 = 16;
    }
    v4 = [*(id *)((char *)&self->super.isa + v3) data];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)saveData:(id)a3 allowBackup:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ([(IDSPersistentMigratingPersister *)self isAvailable])
  {
    [(IDSPersistentMapPersister *)self->_destinationPersister saveData:v8 allowBackup:v4];
    if (!self->_migrated)
    {
      [(IDSPersistentMapPersister *)self->_originPersister purgeData];
      [(IMUserDefaults *)self->_userDefaults setAppBool:1 forKey:self->_migrationDefaultKey];
      migrationDefaultKey = self->_migrationDefaultKey;
      self->_migrationDefaultKey = 0;

      originPersister = self->_originPersister;
      self->_originPersister = 0;

      self->_migrated = 1;
    }
  }
}

- (void)purgeData
{
  if ([(IDSPersistentMigratingPersister *)self isAvailable])
  {
    [(IDSPersistentMapPersister *)self->_originPersister purgeData];
    destinationPersister = self->_destinationPersister;
    [(IDSPersistentMapPersister *)destinationPersister purgeData];
  }
  else
  {
    BOOL v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Tried to purge before available -- returning {self: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (IDSPersistentMapPersister)originPersister
{
  return self->_originPersister;
}

- (void)setOriginPersister:(id)a3
{
}

- (IDSPersistentMapPersister)destinationPersister
{
  return self->_destinationPersister;
}

- (void)setDestinationPersister:(id)a3
{
}

- (BOOL)migrated
{
  return self->_migrated;
}

- (void)setMigrated:(BOOL)a3
{
  self->_migrated = a3;
}

- (NSString)migrationDefaultKey
{
  return self->_migrationDefaultKey;
}

- (void)setMigrationDefaultKey:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_migrationDefaultKey, 0);
  objc_storeStrong((id *)&self->_destinationPersister, 0);

  objc_storeStrong((id *)&self->_originPersister, 0);
}

@end