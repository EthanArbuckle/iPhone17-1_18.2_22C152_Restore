@interface AVTCoreDataPersistentStoreConfiguration
+ (id)currentManagedObjectModel;
+ (id)localConfigurationWithStoreLocation:(id)a3 environment:(id)a4;
+ (id)modelV1;
+ (id)remoteConfigurationWithDaemonClient:(id)a3 environment:(id)a4;
+ (id)remoteConfigurationWithEnvironment:(id)a3;
@end

@implementation AVTCoreDataPersistentStoreConfiguration

+ (id)remoteConfigurationWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [AVTAvatarsDaemonClient alloc];
  v6 = [v4 logger];
  v7 = [(AVTAvatarsDaemonClient *)v5 initWithLogger:v6];

  v8 = [a1 remoteConfigurationWithDaemonClient:v7 environment:v4];

  return v8;
}

+ (id)remoteConfigurationWithDaemonClient:(id)a3 environment:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_AVTCoreDataPersistentStoreRemoteConfiguration alloc] initWithDaemonClient:v6 environment:v5];

  return v7;
}

+ (id)localConfigurationWithStoreLocation:(id)a3 environment:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_AVTCoreDataPersistentStoreLocalConfiguration alloc] initWithStoreLocation:v6 copiedAside:0 environment:v5];

  return v7;
}

+ (id)currentManagedObjectModel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__AVTCoreDataPersistentStoreConfiguration_currentManagedObjectModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentManagedObjectModel_onceToken != -1) {
    dispatch_once(&currentManagedObjectModel_onceToken, block);
  }
  v2 = (void *)currentManagedObjectModel__model;

  return v2;
}

uint64_t __68__AVTCoreDataPersistentStoreConfiguration_currentManagedObjectModel__block_invoke(uint64_t a1)
{
  currentManagedObjectModel__model = [*(id *)(a1 + 32) createModel];

  return MEMORY[0x270F9A758]();
}

+ (id)modelV1
{
  v15[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF298]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF240]);
  [v3 setName:@"Avatar"];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 setManagedObjectClassName:v5];

  id v6 = objc_alloc_init(MEMORY[0x263EFF1C8]);
  [v6 setAttributeType:1100];
  [v6 setName:@"identifier"];
  [v6 setPreservesValueInHistoryOnDeletion:1];
  id v7 = objc_alloc_init(MEMORY[0x263EFF1C8]);
  [v7 setAttributeType:900];
  [v7 setName:@"orderDate"];
  id v8 = objc_alloc_init(MEMORY[0x263EFF1C8]);
  [v8 setAttributeType:1000];
  [v8 setName:@"avatarData"];
  v9 = +[AVTCoreDataCloudKitMirroringConfiguration managedModelAttributesRequiredForMirroring];
  v15[0] = v6;
  v15[1] = v7;
  v15[2] = v8;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  v11 = [v10 arrayByAddingObjectsFromArray:v9];
  [v3 setProperties:v11];

  id v14 = v3;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  [v2 setEntities:v12];

  return v2;
}

@end