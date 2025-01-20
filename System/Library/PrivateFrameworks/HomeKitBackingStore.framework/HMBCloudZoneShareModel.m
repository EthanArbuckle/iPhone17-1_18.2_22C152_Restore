@interface HMBCloudZoneShareModel
+ (id)hmbExternalRecordType;
+ (id)hmbProperties;
@end

@implementation HMBCloudZoneShareModel

+ (id)hmbExternalRecordType
{
  return (id)*MEMORY[0x1E4F19D78];
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_244 != -1) {
    dispatch_once(&hmbProperties_onceToken_244, &__block_literal_global_245);
  }
  v2 = (void *)hmbProperties__properties_246;
  return v2;
}

void __39__HMBCloudZoneShareModel_hmbProperties__block_invoke()
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"share";
  uint64_t v0 = objc_opt_class();
  v1 = +[HMBModelFieldOption excludeFromCloudStorage];
  v6 = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  v3 = +[HMBModelField fieldWithClass:v0 options:v2];
  v8[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = (void *)hmbProperties__properties_246;
  hmbProperties__properties_246 = v4;
}

@end