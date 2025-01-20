@interface HMDIDSActivityRegistrationModel
+ (HMBModelInfiniteQuery)registeredDevicesQuery;
+ (id)hmbProperties;
+ (id)hmbQueries;
@end

@implementation HMDIDSActivityRegistrationModel

+ (id)hmbQueries
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [a1 registeredDevicesQuery];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (HMBModelInfiniteQuery)registeredDevicesQuery
{
  if (registeredDevicesQuery_onceToken != -1) {
    dispatch_once(&registeredDevicesQuery_onceToken, &__block_literal_global_28_256558);
  }
  v2 = (void *)registeredDevicesQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __57__HMDIDSActivityRegistrationModel_registeredDevicesQuery__block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F492D0];
  v5 = @"subjectDeviceIdentifier";
  v1 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"subjectDeviceIdentifier"];
  v6[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 queryWithSQLPredicate:@"subjectDeviceIdentifier == :subjectDeviceIdentifier" sequenceArgumentName:@"subjectDeviceIdentifier" indexedProperties:&unk_26E474500 arguments:v2];
  v4 = (void *)registeredDevicesQuery_query;
  registeredDevicesQuery_query = v3;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_15 != -1) {
    dispatch_once(&hmbProperties_onceToken_15, &__block_literal_global_18_256571);
  }
  v2 = (void *)hmbProperties_properties_16;
  return v2;
}

void __48__HMDIDSActivityRegistrationModel_hmbProperties__block_invoke()
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"subjectDeviceIdentifier";
  v0 = (void *)MEMORY[0x263F492C0];
  uint64_t v1 = objc_opt_class();
  v2 = [MEMORY[0x263F492C8] queryableField];
  v8 = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  v4 = [v0 fieldWithClass:v1 options:v3];
  v9[1] = @"subActivities";
  v10[0] = v4;
  v5 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v10[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = (void *)hmbProperties_properties_16;
  hmbProperties_properties_16 = v6;
}

@end