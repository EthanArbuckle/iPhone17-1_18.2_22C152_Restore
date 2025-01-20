@interface AVTCoreDataCloudKitMirroringConfiguration
+ (BOOL)manateeContainer:(id)a3;
+ (id)createMirroringHandlerWithEnvironment:(id)a3;
+ (id)currentContainerIdentifier;
+ (id)managedModelAttributesRequiredForMirroring;
+ (void)configureMirroringRequestOptions:(id)a3;
+ (void)configureMirroringRequestOptions:(id)a3 discretionary:(BOOL)a4;
+ (void)configureStoreDescriptionForMirroring:(id)a3 logger:(id)a4;
+ (void)deviceConfigurationSupportsCloudKitMirroringWithLogger:(id)a3 completionHandler:(id)a4;
@end

@implementation AVTCoreDataCloudKitMirroringConfiguration

+ (BOOL)manateeContainer:(id)a3
{
  return [a3 isEqual:@"com.apple.Avatars"];
}

+ (id)currentContainerIdentifier
{
  if (AVTUIUseTestCloudKitContainer()) {
    return @"iCloud.com.apple.AvatarUI.Staryu";
  }
  else {
    return @"com.apple.Avatars";
  }
}

+ (void)deviceConfigurationSupportsCloudKitMirroringWithLogger:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __118__AVTCoreDataCloudKitMirroringConfiguration_deviceConfigurationSupportsCloudKitMirroringWithLogger_completionHandler___block_invoke;
  v10[3] = &unk_2647C45A0;
  id v12 = v7;
  id v13 = a1;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [v9 checkingAccountInfo:v10];
}

void __118__AVTCoreDataCloudKitMirroringConfiguration_deviceConfigurationSupportsCloudKitMirroringWithLogger_completionHandler___block_invoke(id *a1)
{
  v2 = [a1[6] currentContainerIdentifier];
  v3 = [MEMORY[0x263EFD610] containerWithIdentifier:v2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __118__AVTCoreDataCloudKitMirroringConfiguration_deviceConfigurationSupportsCloudKitMirroringWithLogger_completionHandler___block_invoke_2;
  v7[3] = &unk_2647C4578;
  id v8 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v10 = v4;
  id v11 = v5;
  id v9 = v2;
  id v6 = v2;
  [v3 accountInfoWithCompletionHandler:v7];
}

void __118__AVTCoreDataCloudKitMirroringConfiguration_deviceConfigurationSupportsCloudKitMirroringWithLogger_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v12)
  {
    id v9 = [v5 description];
    [v6 logErrorGettingAccountInfo:v9];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_9;
  }
  id v7 = [v12 description];
  objc_msgSend(v6, "logAccountInfo:status:deviceToDeviceEncryption:", v7, objc_msgSend(v12, "accountStatus"), objc_msgSend(v12, "supportsDeviceToDeviceEncryption"));

  if (![*(id *)(a1 + 56) manateeContainer:*(void *)(a1 + 40)])
  {
    if ([v12 accountStatus] != 1) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = 1;
    goto LABEL_8;
  }
  if ([v12 supportsDeviceToDeviceEncryption]) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v8 = 0;
LABEL_8:
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = [NSNumber numberWithBool:v8];
  (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);

LABEL_9:
}

+ (void)configureStoreDescriptionForMirroring:(id)a3 logger:(id)a4
{
  id v5 = a3;
  id v11 = [a1 currentContainerIdentifier];
  int v6 = [a1 manateeContainer:v11];
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF1F0]) initWithContainerIdentifier:v11];
  id v8 = objc_alloc_init(MEMORY[0x263EFD628]);
  id v9 = v8;
  if (v6)
  {
    [v8 setUseZoneWidePCS:1];
    [v7 setUseDeviceToDeviceEncryption:1];
  }
  [v7 setContainerOptions:v9];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF1E8]) initWithOptions:v7];
  [v5 setMirroringDelegate:v10];
}

+ (id)createMirroringHandlerWithEnvironment:(id)a3
{
  id v3 = a3;
  if (AVTUIIsAvatarSyncEnabled())
  {
    id v4 = [AVTCoreDataCloudKitMirroringHandler alloc];
    id v5 = [v3 logger];
    int v6 = [v3 scheduler];
    id v7 = [(AVTCoreDataCloudKitMirroringHandler *)v4 initWithLogger:v5 blockScheduler:v6];
  }
  else
  {
    id v7 = objc_alloc_init(AVTDisabledMirroringHandler);
  }

  return v7;
}

+ (id)managedModelAttributesRequiredForMirroring
{
  v6[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF1C8]);
  [v2 setName:*MEMORY[0x263EFEFB8]];
  [v2 setAttributeType:700];
  [v2 setPreservesValueInHistoryOnDeletion:1];
  id v3 = objc_alloc_init(MEMORY[0x263EFF1C8]);
  [v3 setName:*MEMORY[0x263EFEFC0]];
  [v3 setAttributeType:1000];
  [v3 setPreservesValueInHistoryOnDeletion:1];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

+ (void)configureMirroringRequestOptions:(id)a3
{
}

+ (void)configureMirroringRequestOptions:(id)a3 discretionary:(BOOL)a4
{
  id v6 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFD778]);
  [v5 setApplicationBundleIdentifierOverrideForNetworkAttribution:@"com.apple.Memoji"];
  if (!a4) {
    [v5 setDiscretionaryNetworkBehavior:0];
  }
  [v6 setOperationConfiguration:v5];
}

@end