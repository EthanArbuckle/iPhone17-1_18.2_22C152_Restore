@interface C2DeviceInfo
+ (BOOL)isAppleInternal;
+ (BOOL)whitelistedForDisableAPWakeOnIdleConnections;
+ (id)buildVersion;
+ (id)processName;
+ (id)processUUID;
+ (id)processVersion;
+ (id)productName;
+ (id)productType;
+ (id)productVersion;
+ (id)testName;
@end

@implementation C2DeviceInfo

+ (id)testName
{
  v2 = [MEMORY[0x1E4F1CB18] c2DefaultsDomain];
  v3 = [v2 stringForKey:@"C2MetricsTestName"];

  return v3;
}

+ (id)productVersion
{
  return _CKGetCachedGestaltValue(@"ProductVersion");
}

+ (id)productType
{
  return _CKGetCachedGestaltValue(@"ProductType");
}

+ (id)productName
{
  return _CKGetCachedGestaltValue(@"ProductName");
}

+ (id)processVersion
{
  v2 = processInfoDict();
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CC70]];

  return v3;
}

+ (id)processUUID
{
  if (C2MetricProcessUUID_onceToken != -1) {
    dispatch_once(&C2MetricProcessUUID_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)C2MetricProcessUUID_processUUIDString;
  return v2;
}

+ (id)processName
{
  v2 = processInfoDict();
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];

  return v3;
}

+ (BOOL)isAppleInternal
{
  return MEMORY[0x1F40CD648]("com.apple.c2", a2);
}

+ (id)buildVersion
{
  return _CKGetCachedGestaltValue(@"BuildVersion");
}

+ (BOOL)whitelistedForDisableAPWakeOnIdleConnections
{
  if (entitlementsDict_onceToken != -1) {
    dispatch_once(&entitlementsDict_onceToken, &__block_literal_global_29);
  }
  v2 = [(id)entitlementsDict_entitlementsDict objectForKeyedSubscript:@"application-identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 isEqual:@"com.apple.cloudd"];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

@end