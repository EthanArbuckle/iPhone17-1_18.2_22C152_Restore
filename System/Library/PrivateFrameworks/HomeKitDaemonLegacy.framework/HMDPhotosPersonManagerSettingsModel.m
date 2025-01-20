@interface HMDPhotosPersonManagerSettingsModel
+ (NSUUID)sentinelParentUUID;
+ (id)hmbProperties;
- (HMDPhotosPersonManagerSettingsModel)initWithModelID:(id)a3 settings:(id)a4;
- (id)createSettings;
@end

@implementation HMDPhotosPersonManagerSettingsModel

- (id)createSettings
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F2E998]);
  v4 = [(HMDPhotosPersonManagerSettingsModel *)self zoneUUID];
  [v3 setImportingFromPhotoLibraryEnabled:v4 != 0];

  v5 = [(HMDPhotosPersonManagerSettingsModel *)self sharingFaceClassificationsEnabled];
  objc_msgSend(v3, "setSharingFaceClassificationsEnabled:", objc_msgSend(v5, "BOOLValue"));

  v6 = (void *)[v3 copy];
  return v6;
}

- (HMDPhotosPersonManagerSettingsModel)initWithModelID:(id)a3 settings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [HMDPhotosPersonManagerSettingsModel alloc];
  v9 = [(id)objc_opt_class() sentinelParentUUID];
  v10 = [(HMBModel *)v8 initWithModelID:v7 parentModelID:v9];

  v11 = NSNumber;
  uint64_t v12 = [v6 isSharingFaceClassificationsEnabled];

  v13 = [v11 numberWithBool:v12];
  [(HMDPhotosPersonManagerSettingsModel *)v10 setSharingFaceClassificationsEnabled:v13];

  return v10;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_108699 != -1) {
    dispatch_once(&sentinelParentUUID_onceToken_108699, &__block_literal_global_9_108700);
  }
  v2 = (void *)sentinelParentUUID_sentinelParentUUID_108701;
  return (NSUUID *)v2;
}

uint64_t __57__HMDPhotosPersonManagerSettingsModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BCF7ED70-4FE2-4186-8B8C-F4832AC1A54B"];
  uint64_t v1 = sentinelParentUUID_sentinelParentUUID_108701;
  sentinelParentUUID_sentinelParentUUID_108701 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_108707 != -1) {
    dispatch_once(&hmbProperties_onceToken_108707, &__block_literal_global_108708);
  }
  v2 = (void *)hmbProperties_properties_108709;
  return v2;
}

void __52__HMDPhotosPersonManagerSettingsModel_hmbProperties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"sharingFaceClassificationsEnabled";
  uint64_t v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v4[1] = @"zoneUUID";
  v5[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  id v3 = (void *)hmbProperties_properties_108709;
  hmbProperties_properties_108709 = v2;
}

@end