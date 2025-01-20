@interface HMBCloudZoneRebuilderModel
+ (NSUUID)sentinelUUID;
+ (id)hmbProperties;
- (HMBCloudZoneRebuilderModel)init;
@end

@implementation HMBCloudZoneRebuilderModel

- (HMBCloudZoneRebuilderModel)init
{
  v3 = [(id)objc_opt_class() sentinelUUID];
  v4 = [(id)objc_opt_class() sentinelUUID];
  v7.receiver = self;
  v7.super_class = (Class)HMBCloudZoneRebuilderModel;
  v5 = [(HMBModel *)&v7 initWithModelID:v3 parentModelID:v4];

  return v5;
}

+ (NSUUID)sentinelUUID
{
  if (sentinelUUID_onceToken != -1) {
    dispatch_once(&sentinelUUID_onceToken, &__block_literal_global_12_2933);
  }
  v2 = (void *)sentinelUUID__sentinelUUID;
  return (NSUUID *)v2;
}

uint64_t __42__HMBCloudZoneRebuilderModel_sentinelUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4C636B6B-9784-4D02-9E47-5A5259B3BAF2"];
  uint64_t v1 = sentinelUUID__sentinelUUID;
  sentinelUUID__sentinelUUID = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_2939 != -1) {
    dispatch_once(&hmbProperties_onceToken_2939, &__block_literal_global_2940);
  }
  v2 = (void *)hmbProperties__properties_2941;
  return v2;
}

void __43__HMBCloudZoneRebuilderModel_hmbProperties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uniqueToken";
  uint64_t v0 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v4[1] = @"hasCompleted";
  v5[0] = v0;
  uint64_t v1 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)hmbProperties__properties_2941;
  hmbProperties__properties_2941 = v2;
}

@end