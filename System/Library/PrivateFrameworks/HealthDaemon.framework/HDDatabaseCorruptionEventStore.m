@interface HDDatabaseCorruptionEventStore
+ (id)TTREventKeyForProfileIdentifier:(id)a3 component:(int64_t)a4;
+ (id)_migrationFailureEventKeyForProfileIdentifier:(unint64_t)a3 component:;
+ (id)corruptionEventKeyForProfileIdentifier:(id)a3 component:(int64_t)a4;
+ (id)outOfSpaceEventKey;
- (HDDatabaseCorruptionEventStore)initWithDelegate:(id)a3;
- (HDDatabaseCorruptionEventStoreDelegate)delegate;
- (id)dateOfMostRecentDeviceOutOfSpaceEvent;
- (id)dateOfMostRecentObliteration:(id *)a3;
- (id)mostRecentCorruptionEventForProfileIdentifier:(id)a3 component:(int64_t)a4;
- (id)mostRecentMigrationFailureEventForProfile:(id)a3 component:(int64_t)a4 schemaVersion:(int64_t *)a5;
- (id)mostRecentTTRAttemptForProfileIdentifier:(id)a3 component:(int64_t)a4;
- (void)persistCorruptionEvent:(id)a3;
- (void)persistDeviceOutOfSpaceEvent;
- (void)persistMigrationFailureEventForProfile:(id)a3 component:(int64_t)a4 schemaVersion:(int64_t)a5;
- (void)persistObliterationForReason:(id)a3;
- (void)persistTTRAttempt:(id)a3 forProfileIdentifier:(id)a4 component:(int64_t)a5;
- (void)setDelegate:(id)a3;
@end

@implementation HDDatabaseCorruptionEventStore

- (HDDatabaseCorruptionEventStore)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDatabaseCorruptionEventStore;
  v5 = [(HDDatabaseCorruptionEventStore *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

+ (id)corruptionEventKeyForProfileIdentifier:(id)a3 component:(int64_t)a4
{
  id v5 = a3;
  v6 = HDStringFromDatabaseComponentIdentifier(a4);
  v7 = [@"corruption." stringByAppendingString:v6];

  objc_super v8 = HDDatabaseUserDefaultsKeyForProfileIdentifier(v7, v5);

  return v8;
}

+ (id)TTREventKeyForProfileIdentifier:(id)a3 component:(int64_t)a4
{
  id v5 = a3;
  v6 = HDStringFromDatabaseComponentIdentifier(a4);
  v7 = [@"corruption-reported." stringByAppendingString:v6];

  objc_super v8 = HDDatabaseUserDefaultsKeyForProfileIdentifier(v7, v5);

  return v8;
}

+ (id)outOfSpaceEventKey
{
  return @"databaseDetectedOutOfSpace";
}

+ (id)_migrationFailureEventKeyForProfileIdentifier:(unint64_t)a3 component:
{
  id v4 = a2;
  self;
  id v5 = HDStringFromDatabaseComponentIdentifier(a3);
  v6 = [@"migration-failure" stringByAppendingString:v5];

  v7 = HDDatabaseUserDefaultsKeyForProfileIdentifier(v6, v4);

  return v7;
}

- (void)persistCorruptionEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HDDatabaseCorruptionEventStore *)self delegate];

  if (v5)
  {
    v6 = objc_opt_class();
    v7 = [v4 profileIdentifier];
    objc_super v8 = objc_msgSend(v6, "corruptionEventKeyForProfileIdentifier:component:", v7, objc_msgSend(v4, "component"));

    id v13 = 0;
    v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v13];
    id v10 = v13;
    if (v9)
    {
      v11 = [(HDDatabaseCorruptionEventStore *)self delegate];
      [v11 store:self setObject:v9 forKey:v8];
    }
    else
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Could not encode corruption event (%@); skipping",
          buf,
          0xCu);
      }
    }
  }
}

- (id)mostRecentCorruptionEventForProfileIdentifier:(id)a3 component:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(id)objc_opt_class() corruptionEventKeyForProfileIdentifier:v6 component:a4];

  objc_super v8 = [(HDDatabaseCorruptionEventStore *)self delegate];
  v9 = [v8 store:self objectForKey:v7];

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v14 = 0;
    id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v14];
    id v11 = v14;
    if (!v10)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Could not decode corruption event (%@)", buf, 0xCu);
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)persistDeviceOutOfSpaceEvent
{
  id v4 = [(HDDatabaseCorruptionEventStore *)self delegate];
  v3 = [MEMORY[0x1E4F1C9C8] now];
  [v4 store:self setObject:v3 forKey:@"databaseDetectedOutOfSpace"];
}

- (id)dateOfMostRecentDeviceOutOfSpaceEvent
{
  v3 = [(HDDatabaseCorruptionEventStore *)self delegate];
  id v4 = [v3 store:self objectForKey:@"databaseDetectedOutOfSpace"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)persistMigrationFailureEventForProfile:(id)a3 component:(int64_t)a4 schemaVersion:(int64_t)a5
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v7 = +[HDDatabaseCorruptionEventStore _migrationFailureEventKeyForProfileIdentifier:component:]((uint64_t)HDDatabaseCorruptionEventStore, a3, a4);
  v12[0] = @"lastReportedDate";
  objc_super v8 = [MEMORY[0x1E4F1C9C8] now];
  v12[1] = @"failedSchemaVersion";
  v13[0] = v8;
  v9 = [NSNumber numberWithInteger:a5];
  v13[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v11 = [(HDDatabaseCorruptionEventStore *)self delegate];
  [v11 store:self setObject:v10 forKey:v7];
}

- (id)mostRecentMigrationFailureEventForProfile:(id)a3 component:(int64_t)a4 schemaVersion:(int64_t *)a5
{
  v7 = +[HDDatabaseCorruptionEventStore _migrationFailureEventKeyForProfileIdentifier:component:]((uint64_t)HDDatabaseCorruptionEventStore, a3, a4);
  objc_super v8 = [(HDDatabaseCorruptionEventStore *)self delegate];
  v9 = [v8 store:self objectForKey:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 valueForKey:@"lastReportedDate"];
    id v11 = [v9 valueForKey:@"failedSchemaVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      *a5 = [v11 integerValue];
      id v12 = v10;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)mostRecentTTRAttemptForProfileIdentifier:(id)a3 component:(int64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() TTREventKeyForProfileIdentifier:v6 component:a4];

  objc_super v8 = [(HDDatabaseCorruptionEventStore *)self delegate];
  v9 = [v8 store:self objectForKey:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (void)persistTTRAttempt:(id)a3 forProfileIdentifier:(id)a4 component:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v11 = [(id)objc_opt_class() TTREventKeyForProfileIdentifier:v8 component:a5];

  id v10 = [(HDDatabaseCorruptionEventStore *)self delegate];
  [v10 store:self setObject:v9 forKey:v11];
}

- (void)persistObliterationForReason:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"reason";
  v9[1] = @"date";
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 now];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v8 = [(HDDatabaseCorruptionEventStore *)self delegate];
  [v8 store:self setObject:v7 forKey:@"databaseObliterated"];
}

- (id)dateOfMostRecentObliteration:(id *)a3
{
  id v5 = [(HDDatabaseCorruptionEventStore *)self delegate];
  id v6 = [v5 store:self objectForKey:@"databaseObliterated"];

  if (a3) {
    *a3 = 0;
  }
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = [v6 objectForKeyedSubscript:@"date"];
    uint64_t v8 = [v6 objectForKeyedSubscript:@"reason"];
    id v9 = (void *)v8;
    id v10 = 0;
    if (v7 && v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        if (a3) {
          *a3 = v9;
        }
        id v10 = v7;
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (HDDatabaseCorruptionEventStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDDatabaseCorruptionEventStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end