@interface ACHDataStoreSyncEntity
+ (BOOL)removeDataStoreValuesForKeys:(id)a3 domain:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)setDataStoreValuesWithDictionary:(id)a3 domain:(id)a4 profile:(id)a5 error:(id *)a6;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)dataStoreValueForKey:(id)a3 domain:(id)a4 profile:(id)a5 error:(id *)a6;
+ (int)nanoSyncObjectType;
+ (int64_t)category;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
+ (void)didReceiveValuesForKeys:(id)a3 profile:(id)a4;
@end

@implementation ACHDataStoreSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return (HDSyncEntityIdentifier *)[MEMORY[0x263F433C8] identifierWithSchema:0 entity:21];
}

+ (id)dataStoreValueForKey:(id)a3 domain:(id)a4 profile:(id)a5 error:(id *)a6
{
  return (id)[MEMORY[0x263F432E0] numberForKey:a3 domain:a4 category:107 profile:a5 entity:0 error:a6];
}

+ (BOOL)setDataStoreValuesWithDictionary:(id)a3 domain:(id)a4 profile:(id)a5 error:(id *)a6
{
  return [MEMORY[0x263F432E0] setValuesWithDictionary:a3 domain:a4 category:107 profile:a5 error:a6];
}

+ (BOOL)removeDataStoreValuesForKeys:(id)a3 domain:(id)a4 profile:(id)a5 error:(id *)a6
{
  return [MEMORY[0x263F432E0] removeValuesForDomain:a4 category:107 keys:a3 profile:a5 error:a6];
}

+ (int64_t)category
{
  return 107;
}

+ (void)didReceiveValuesForKeys:(id)a3 profile:(id)a4
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"ACHDataStoreSyncEntityDidReceiveValuesNotification" object:a1];
}

+ (int)nanoSyncObjectType
{
  return 21;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  if (a3 >= 8) {
    return 3;
  }
  else {
    return 0;
  }
}

@end