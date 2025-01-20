@interface HDSignedClinicalDataRegistry
+ (BOOL)_validateOrInitializeDatabase:(id)a3 error:(id *)a4;
+ (id)_validateOrInitializeDatabaseAtURL:(id)a3 error:(id *)a4;
+ (int64_t)databaseSchemaVersionInBuild;
- (BOOL)fetchTitleForIssuerWithIdentifier:(id)a3 titleOut:(id *)a4 error:(id *)a5;
- (BOOL)insertOrReplaceIssuer:(id)a3 database:(id)a4 error:(id *)a5;
- (BOOL)insertOrReplacePublicKeyWithKeyID:(id)a3 added:(id)a4 removed:(id)a5 source:(id)a6 jwk:(id)a7 database:(id)a8 error:(id *)a9;
- (BOOL)performTransactionWithError:(id *)a3 block:(id)a4;
- (BOOL)removePublicKeyWithKeyID:(id)a3 removedDate:(id)a4 database:(id)a5 error:(id *)a6;
- (BOOL)setIssuerContentVersion:(id)a3 error:(id *)a4;
- (BOOL)setNumericValue:(id)a3 forMetadataKey:(id)a4 error:(id *)a5;
- (BOOL)setPublicKeyContentVersion:(id)a3 error:(id *)a4;
- (HDSignedClinicalDataRegistry)initWithDatabaseURL:(id)a3;
- (HDSignedClinicalDataRegistry)initWithHealthDirectoryURL:(id)a3;
- (NSURL)databaseURL;
- (id)currentDatabaseSchemaVersionWithError:(id *)a3;
- (id)fetchPublicKeysWithDatabase:(id)a3 error:(id *)a4;
- (id)issuerContentVersionWithError:(id *)a3;
- (id)numericValueForMetadataKey:(id)a3 error:(id *)a4;
- (id)openAndInitializeDatabaseIfNeededWithError:(id *)a3;
- (id)publicKeyContentVersionWithError:(id *)a3;
- (id)publicKeyWithID:(id)a3;
- (id)titleForIssuerWithIdentifier:(id)a3;
- (int64_t)_currentDatabaseSchemaVersionWithError:(id *)a3;
- (void)close;
- (void)dealloc;
@end

@implementation HDSignedClinicalDataRegistry

- (HDSignedClinicalDataRegistry)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSignedClinicalDataRegistry;
  v5 = [(HDSignedClinicalDataRegistry *)&v9 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    v5->_dbLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (HDSignedClinicalDataRegistry)initWithHealthDirectoryURL:(id)a3
{
  id v4 = [a3 URLByAppendingPathComponent:@"IssuerRegistry"];
  v5 = [v4 URLByAppendingPathComponent:@"Registry.db"];
  v6 = [(HDSignedClinicalDataRegistry *)self initWithDatabaseURL:v5];

  return v6;
}

- (void)dealloc
{
  [(HDSQLiteDatabase *)self->_database close];
  v3.receiver = self;
  v3.super_class = (Class)HDSignedClinicalDataRegistry;
  [(HDSignedClinicalDataRegistry *)&v3 dealloc];
}

- (id)titleForIssuerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v15 = 0;
  id v16 = 0;
  unsigned __int8 v5 = [(HDSignedClinicalDataRegistry *)self fetchTitleForIssuerWithIdentifier:v4 titleOut:&v16 error:&v15];
  id v6 = v16;
  id v7 = v15;
  if (v5)
  {
    id v8 = v6;
  }
  else
  {
    _HKInitializeLogging();
    objc_super v9 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      v11 = v9;
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "%{public}@ failed to look up title for issuer %{public}@: %{public}@", buf, 0x20u);
    }
    id v8 = 0;
  }

  return v8;
}

- (BOOL)fetchTitleForIssuerWithIdentifier:(id)a3 titleOut:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  objc_super v9 = [(HDSignedClinicalDataRegistry *)self openAndInitializeDatabaseIfNeededWithError:a5];
  if (v9)
  {
    id v18 = 0;
    v10 = +[HDSignedClinicalDataRegistryIssuerEntity entityForIssuerWithIdentifier:v8 database:v9 error:&v18];
    id v11 = v18;
    v12 = v11;
    if (v10) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v11 == 0;
    }
    BOOL v14 = v13;
    if (v13)
    {
      id v15 = [v10 titleInDatabase:v9];
      id v16 = v15;
      if (a4) {
        *a4 = v15;
      }
    }
    else if (a5)
    {
      *a5 = v11;
    }
    else
    {
      _HKLogDroppedError();
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)insertOrReplaceIssuer:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v7 title];
  unsigned __int8 v10 = [v9 isEqualToString:&stru_1152E8];

  id v11 = [v7 identifier];
  if (v10)
  {
    unsigned __int8 v12 = +[HDSignedClinicalDataRegistryIssuerEntity deleteIssuerWithIdentifier:v11 database:v8 error:a5];
  }
  else
  {
    uint64_t v13 = [v7 title];
    BOOL v14 = +[HDSignedClinicalDataRegistryIssuerEntity insertOrReplaceIssuerWithIdentifier:v11 title:v13 logoURL:0 softwareLogoURL:0 database:v8 error:a5];

    unsigned __int8 v12 = v14 != 0;
    id v8 = (id)v13;
  }

  return v12;
}

- (id)issuerContentVersionWithError:(id *)a3
{
  return [(HDSignedClinicalDataRegistry *)self numericValueForMetadataKey:@"content_version" error:a3];
}

- (BOOL)setIssuerContentVersion:(id)a3 error:(id *)a4
{
  return [(HDSignedClinicalDataRegistry *)self setNumericValue:a3 forMetadataKey:@"content_version" error:a4];
}

- (id)publicKeyWithID:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  unsigned __int8 v5 = [(HDSignedClinicalDataRegistry *)self openAndInitializeDatabaseIfNeededWithError:&v11];
  id v6 = v11;
  if (v5)
  {
    id v7 = +[HDSignedClinicalDataRegistryPublicKeyEntity publicKeyWithKeyID:v4 database:v5];
  }
  else
  {
    _HKInitializeLogging();
    id v8 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_ACC40(v8, (uint64_t)self, (uint64_t)v6);
    }
    id v7 = [objc_alloc((Class)HKSignedClinicalDataRegistryPublicKeyFetchResult) initWithKeyID:v4 outcome:4 jwkData:0];
  }
  objc_super v9 = v7;

  return v9;
}

- (BOOL)insertOrReplacePublicKeyWithKeyID:(id)a3 added:(id)a4 removed:(id)a5 source:(id)a6 jwk:(id)a7 database:(id)a8 error:(id *)a9
{
  objc_super v9 = +[HDSignedClinicalDataRegistryPublicKeyEntity insertOrReplacePublicKeyWithKeyID:a3 added:a4 removed:a5 source:a6 jwk:a7 database:a8 error:a9];
  BOOL v10 = v9 != 0;

  return v10;
}

- (id)fetchPublicKeysWithDatabase:(id)a3 error:(id *)a4
{
  return +[HDSignedClinicalDataRegistryPublicKeyEntity publicKeysInDatabase:a3 error:a4];
}

- (BOOL)removePublicKeyWithKeyID:(id)a3 removedDate:(id)a4 database:(id)a5 error:(id *)a6
{
  id v6 = +[HDSignedClinicalDataRegistryPublicKeyEntity removePublicKeyWithKeyID:a3 removedDate:a4 database:a5 error:a6];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)publicKeyContentVersionWithError:(id *)a3
{
  return [(HDSignedClinicalDataRegistry *)self numericValueForMetadataKey:@"public_key_content_version" error:a3];
}

- (BOOL)setPublicKeyContentVersion:(id)a3 error:(id *)a4
{
  return [(HDSignedClinicalDataRegistry *)self setNumericValue:a3 forMetadataKey:@"public_key_content_version" error:a4];
}

- (BOOL)performTransactionWithError:(id *)a3 block:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(HDSignedClinicalDataRegistry *)self openAndInitializeDatabaseIfNeededWithError:a3];
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_2D998;
    v10[3] = &unk_112B48;
    id v11 = v6;
    unsigned __int8 v8 = [v7 performTransactionWithType:1 error:a3 usingBlock:v10];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)numericValueForMetadataKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(HDSignedClinicalDataRegistry *)self openAndInitializeDatabaseIfNeededWithError:a4];
  if (!v7)
  {
    unsigned __int8 v8 = 0;
    goto LABEL_13;
  }
  id v13 = 0;
  unsigned __int8 v8 = +[HDSignedClinicalDataRegistryMetadataEntity numericValueForKey:v6 database:v7 error:&v13];
  id v9 = v13;
  BOOL v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = +[NSError hk_error:11, @"%@ has not yet been set", v6 format];
      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if (a4) {
      *a4 = v11;
    }
    else {
      _HKLogDroppedError();
    }

    if (v10) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:

  return v8;
}

- (BOOL)setNumericValue:(id)a3 forMetadataKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(HDSignedClinicalDataRegistry *)self openAndInitializeDatabaseIfNeededWithError:a5];
  if (v10)
  {
    id v11 = +[HDSignedClinicalDataRegistryMetadataEntity setNumericValue:v8 forKey:v9 database:v10 error:a5];
    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)openAndInitializeDatabaseIfNeededWithError:(id *)a3
{
  p_dbLock = &self->_dbLock;
  os_unfair_lock_lock(&self->_dbLock);
  id v6 = self->_database;
  if (!v6)
  {
    id v6 = [(id)objc_opt_class() _validateOrInitializeDatabaseAtURL:self->_databaseURL error:a3];
    objc_storeStrong((id *)&self->_database, v6);
  }
  os_unfair_lock_unlock(p_dbLock);

  return v6;
}

- (void)close
{
  p_dbLock = &self->_dbLock;
  os_unfair_lock_lock(&self->_dbLock);
  [(HDSQLiteDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;

  os_unfair_lock_unlock(p_dbLock);
}

+ (id)_validateOrInitializeDatabaseAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSFileManager);
  BOOL v7 = [v5 URLByDeletingLastPathComponent];
  id v16 = 0;
  unsigned __int8 v8 = [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v16];
  id v9 = v16;

  if ((v8 & 1) == 0)
  {
    +[NSError hk_assignError:a4 code:100 description:@"Unable to create issuer registry database directory" underlyingError:v9];
    id v13 = 0;
    goto LABEL_10;
  }
  id v10 = [objc_alloc((Class)HDSQLiteDatabase) initWithDatabaseURL:v5];
  [v10 setFileProtectionType:NSFileProtectionNone];
  id v15 = 0;
  unsigned int v11 = [v10 openWithError:&v15];
  id v12 = v15;
  if (v11)
  {
    +[NSError hk_assignError:a4 code:100 description:@"Unable to open issuer registry database" underlyingError:v12];
LABEL_8:
    id v13 = 0;
    goto LABEL_9;
  }
  if (([(id)objc_opt_class() _validateOrInitializeDatabase:v10 error:a4] & 1) == 0)
  {
    [v10 close];
    goto LABEL_8;
  }
  id v13 = v10;
LABEL_9:

LABEL_10:

  return v13;
}

+ (BOOL)_validateOrInitializeDatabase:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    BOOL v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDSignedClinicalDataRegistry.m", 268, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  id v8 = [a1 databaseSchemaVersionInBuild];
  id v15 = 0;
  int64_t v9 = (int64_t)[v7 userVersionWithDatabaseName:0 error:&v15];
  id v10 = v15;
  if (v9 < 0)
  {
    +[NSError hk_assignError:a4 code:100 description:@"Unable to read issuer registry database schema version" underlyingError:v10];
LABEL_9:
    unsigned __int8 v11 = 0;
    goto LABEL_11;
  }
  if ((id)v9 != v8)
  {
    if (v9 <= (uint64_t)v8)
    {
      id v12 = objc_alloc_init(HDSignedClinicalDataRegistryMigrator);
      unsigned __int8 v11 = [(HDSignedClinicalDataRegistryMigrator *)v12 migrateDatabase:v7 fromVersion:v9 toVersion:v8 error:a4];

      goto LABEL_11;
    }
    +[NSError hk_assignError:a4, 116, @"Issuer registry database schema version %ld is greater than current version %ld, cannot use registry", v9, v8 code format];
    goto LABEL_9;
  }
  unsigned __int8 v11 = 1;
LABEL_11:

  return v11;
}

+ (int64_t)databaseSchemaVersionInBuild
{
  return 2;
}

- (int64_t)_currentDatabaseSchemaVersionWithError:(id *)a3
{
  database = self->_database;
  id v8 = 0;
  int64_t v5 = (int64_t)[(HDSQLiteDatabase *)database userVersionWithDatabaseName:0 error:&v8];
  id v6 = v8;
  if (v5 < 0) {
    +[NSError hk_assignError:a3 code:100 description:@"Unable to read issuer registry database schema version" underlyingError:v6];
  }

  return v5;
}

- (id)currentDatabaseSchemaVersionWithError:(id *)a3
{
  int64_t v3 = [(HDSignedClinicalDataRegistry *)self _currentDatabaseSchemaVersionWithError:a3];
  if (v3 < 0)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = +[NSNumber numberWithInteger:v3];
  }

  return v4;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end