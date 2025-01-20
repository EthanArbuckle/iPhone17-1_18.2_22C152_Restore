@interface MOPlatformInfo
+ (BOOL)isInternalBuild;
+ (BOOL)isIpad;
+ (BOOL)isSeedBuild;
+ (BOOL)wasBuildVersionUpdated;
+ (id)extractHardwareAndSoftwareMetadata;
+ (id)getBuildVersion;
+ (id)getHWModel;
+ (id)getProductType;
+ (id)getProductVersion;
+ (unint64_t)generativeModelsAvailabilityStatus;
+ (void)getBuildVersion;
+ (void)getHWModel;
+ (void)getProductType;
+ (void)getProductVersion;
+ (void)persistBuildVersion;
@end

@implementation MOPlatformInfo

+ (id)extractHardwareAndSoftwareMetadata
{
  v2 = objc_opt_new();
  v3 = +[MOPlatformInfo getHWModel];
  v4 = +[MOPlatformInfo getProductType];
  v5 = +[MOPlatformInfo getBuildVersion];
  v6 = +[MOPlatformInfo getProductVersion];
  unsigned int v7 = +[MOPlatformInfo isInternalBuild];
  unsigned int v8 = +[MOPlatformInfo isSeedBuild];
  if (v3) {
    [v2 setObject:v3 forKey:@"kMOHardwareModel"];
  }
  if (v4) {
    [v2 setObject:v4 forKey:@"kMOProductType"];
  }
  if (v5) {
    [v2 setObject:v5 forKey:@"kMOBuildVersion"];
  }
  if (v6) {
    [v2 setObject:v6 forKey:@"kMOProductVersion"];
  }
  if (v7) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  [v2 setObject:v9 forKey:@"kMOIsInternalBuild"];
  if (v8) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  [v2 setObject:v10 forKey:@"kMOIsSeedBuild"];
  id v11 = [v2 copy];

  return v11;
}

+ (id)getHWModel
{
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    v3 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[MOPlatformInfo getHWModel]();
    }
  }

  return v2;
}

+ (id)getProductType
{
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    v3 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[MOPlatformInfo getProductType]();
    }
  }

  return v2;
}

+ (id)getBuildVersion
{
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    v3 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[MOPlatformInfo getBuildVersion]();
    }
  }

  return v2;
}

+ (id)getProductVersion
{
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    v3 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[MOPlatformInfo getProductVersion]();
    }
  }

  return v2;
}

+ (BOOL)isInternalBuild
{
  if (!os_variant_has_internal_diagnostics()) {
    return 0;
  }
  v2 = objc_opt_new();
  v3 = [v2 objectForKey:@"PlatformInfoOverrideIsInternalBuild"];
  v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

+ (BOOL)isSeedBuild
{
  v2 = objc_opt_new();
  v3 = [v2 objectForKey:@"PlatformInfoOverrideIsSeedBuild"];
  v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)wasBuildVersionUpdated
{
  v2 = objc_opt_new();
  v3 = +[MOPlatformInfo extractHardwareAndSoftwareMetadata];
  v4 = [v2 objectForKey:@"LastBuildVersion"];
  if (v4)
  {
    unsigned __int8 v5 = [v3 objectForKey:@"kMOBuildVersion"];
    unsigned int v6 = [v4 isEqualToString:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (void)persistBuildVersion
{
  id v4 = (id)objc_opt_new();
  v2 = +[MOPlatformInfo extractHardwareAndSoftwareMetadata];
  v3 = [v2 objectForKey:@"kMOBuildVersion"];
  [v4 setObject:v3 forKey:@"LastBuildVersion"];
}

+ (BOOL)isIpad
{
  if (isIpad_onceToken != -1) {
    dispatch_once(&isIpad_onceToken, &__block_literal_global_0);
  }
  return isIpad_result;
}

void __24__MOPlatformInfo_isIpad__block_invoke(id a1)
{
  v1 = (void *)MGCopyAnswer();
  if (v1 && [v1 isEqualToString:@"iPad"]) {
    isIpad_result = 1;
  }

  _objc_release_x1();
}

+ (unint64_t)generativeModelsAvailabilityStatus
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = +[MOMomentsIntelligenceServiceManager sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __52__MOPlatformInfo_generativeModelsAvailabilityStatus__block_invoke;
  v5[3] = &unk_10021FAD0;
  v5[4] = &v6;
  [v2 fetchGenerativeModelsAvailabilityWithReply:v5];
  unint64_t v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__MOPlatformInfo_generativeModelsAvailabilityStatus__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52__MOPlatformInfo_generativeModelsAvailabilityStatus__block_invoke_cold_1();
    }
  }
  else
  {
    if (a2) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  }
}

+ (void)getHWModel
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Could not get hardware version string", v2, v3, v4, v5, v6);
}

+ (void)getProductType
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Could not get product type", v2, v3, v4, v5, v6);
}

+ (void)getBuildVersion
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Could not get build version", v2, v3, v4, v5, v6);
}

+ (void)getProductVersion
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Could not get product version", v2, v3, v4, v5, v6);
}

void __52__MOPlatformInfo_generativeModelsAvailabilityStatus__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Could not get GMS Availability", v2, v3, v4, v5, v6);
}

@end