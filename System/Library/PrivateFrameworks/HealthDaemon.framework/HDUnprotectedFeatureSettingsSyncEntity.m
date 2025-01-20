@interface HDUnprotectedFeatureSettingsSyncEntity
+ (id)syncEntityIdentifier;
+ (int64_t)category;
+ (void)didReceiveValuesForDomainNames:(id)a3 profile:(id)a4;
@end

@implementation HDUnprotectedFeatureSettingsSyncEntity

+ (void)didReceiveValuesForDomainNames:(id)a3 profile:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 defaultCenter];
  v10 = @"HDUnprotectedFeatureSettingsSyncEntityDidSyncNotificationDomainNamesKey";
  v11[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [v8 postNotificationName:@"HDUnprotectedFeatureSettingsSyncEntityDidSync" object:v6 userInfo:v9];
}

+ (int64_t)category
{
  return 4;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:60];
}

@end