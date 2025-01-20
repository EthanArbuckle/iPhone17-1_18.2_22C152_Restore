@interface HDDeviceUnprotectedKeyValueStorageEntryEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_propertiesForEntity;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (int64_t)protectionClass;
+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 key:(id)a4 domain:(id)a5 object:(id)a6 syncEntityIdentity:(int64_t)a7 deviceContext:(int64_t)a8 modificationDate:(id)a9;
+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 syncEntityIdentity:(int64_t)a4 deviceContext:(int64_t)a5;
@end

@implementation HDDeviceUnprotectedKeyValueStorageEntryEntity

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDDeviceKeyValueStorageEntryEntityColumnDefinitions_369;
}

+ (id)databaseTable
{
  return @"kv_device_storage";
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_propertiesForEntity
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"sync_identity_id";
  v4[1] = @"device_record_id";
  v4[2] = @"domain";
  v4[3] = @"key";
  v4[4] = @"value";
  v4[5] = @"date_modified";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];

  return v2;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"device_record_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 key:(id)a4 domain:(id)a5 object:(id)a6 syncEntityIdentity:(int64_t)a7 deviceContext:(int64_t)a8 modificationDate:(id)a9
{
  id v15 = a9;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  MEMORY[0x1C1879E80](a3, @"sync_identity_id", a7);
  MEMORY[0x1C1879E80](a3, @"device_record_id", a8);
  MEMORY[0x1C1879EC0](a3, @"domain", v17);

  MEMORY[0x1C1879EC0](a3, @"key", v18);
  MEMORY[0x1C1879E30](a3, @"value", v16);

  [v15 timeIntervalSinceReferenceDate];

  JUMPOUT(0x1C1879E50);
}

+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 syncEntityIdentity:(int64_t)a4 deviceContext:(int64_t)a5
{
  MEMORY[0x1C1879E80](a3, @"sync_identity_id", a4);

  JUMPOUT(0x1C1879E80);
}

@end