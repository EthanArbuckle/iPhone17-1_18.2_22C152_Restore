@interface HMDIDSActivityRegistrationModel
+ (HMBModelInfiniteQuery)registeredDevicesQuery;
+ (id)hmbProperties;
+ (id)hmbQueries;
@end

@implementation HMDIDSActivityRegistrationModel

+ (id)hmbQueries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 registeredDevicesQuery];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (HMBModelInfiniteQuery)registeredDevicesQuery
{
  if (registeredDevicesQuery_onceToken != -1) {
    dispatch_once(&registeredDevicesQuery_onceToken, &__block_literal_global_28_181425);
  }
  v2 = (void *)registeredDevicesQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __57__HMDIDSActivityRegistrationModel_registeredDevicesQuery__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F69EA8];
  v5 = @"subjectDeviceIdentifier";
  v1 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"subjectDeviceIdentifier"];
  v6[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 queryWithSQLPredicate:@"subjectDeviceIdentifier == :subjectDeviceIdentifier" sequenceArgumentName:@"subjectDeviceIdentifier" indexedProperties:&unk_1F2DC7078 arguments:v2];
  v4 = (void *)registeredDevicesQuery_query;
  registeredDevicesQuery_query = v3;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_15 != -1) {
    dispatch_once(&hmbProperties_onceToken_15, &__block_literal_global_18_181438);
  }
  v2 = (void *)hmbProperties_properties_16;
  return v2;
}

void __48__HMDIDSActivityRegistrationModel_hmbProperties__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"subjectDeviceIdentifier";
  v0 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v1 = objc_opt_class();
  v2 = [MEMORY[0x1E4F69EA0] queryableField];
  v8 = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v4 = [v0 fieldWithClass:v1 options:v3];
  v9[1] = @"subActivities";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = (void *)hmbProperties_properties_16;
  hmbProperties_properties_16 = v6;
}

@end