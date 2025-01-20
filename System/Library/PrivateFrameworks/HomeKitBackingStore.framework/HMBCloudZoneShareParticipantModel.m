@interface HMBCloudZoneShareParticipantModel
+ (id)hmbProperties;
@end

@implementation HMBCloudZoneShareParticipantModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_3212 != -1) {
    dispatch_once(&hmbProperties_onceToken_3212, &__block_literal_global_3213);
  }
  v2 = (void *)hmbProperties__properties_3214;
  return v2;
}

void __50__HMBCloudZoneShareParticipantModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"participant";
  v0 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties__properties_3214;
  hmbProperties__properties_3214 = v1;
}

@end