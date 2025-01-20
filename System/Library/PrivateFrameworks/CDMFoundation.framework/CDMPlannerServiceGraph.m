@interface CDMPlannerServiceGraph
+ (id)requiredCDMGraphServices;
+ (id)requiredDAGServices;
+ (id)responseFeatureStoreStreamId;
+ (id)serializeFeatureStoreWithResponseCmd:(id)a3;
+ (int)getNLXSchemaCDMServiceGraphName;
- (Class)supportedGraphInputType;
@end

@implementation CDMPlannerServiceGraph

+ (id)serializeFeatureStoreWithResponseCmd:(id)a3
{
  return 0;
}

+ (id)responseFeatureStoreStreamId
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (+[CDMPlatformUtils isInternalInstall])
  {
    v2 = @"CdmPlannerResponse";
    v3 = @"CdmPlannerResponse";
  }
  else
  {
    v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315138;
      v7 = "+[CDMPlannerServiceGraph responseFeatureStoreStreamId]";
      _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Device not on internal build. Not inserting CdmPlannerResponse to FeatureStore.", (uint8_t *)&v6, 0xCu);
    }

    v2 = 0;
  }
  return v2;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 7;
}

+ (id)requiredCDMGraphServices
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

+ (id)requiredDAGServices
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

@end