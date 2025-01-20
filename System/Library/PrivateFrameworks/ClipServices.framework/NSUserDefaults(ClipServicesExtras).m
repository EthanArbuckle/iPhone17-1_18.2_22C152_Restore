@interface NSUserDefaults(ClipServicesExtras)
+ (id)cps_clipServicesDefaults;
- (uint64_t)cps_didShowFirstTimeLocationConsent;
- (uint64_t)cps_forceReportProblemErrorFetchProblemTypes;
- (uint64_t)cps_forceReportProblemErrorNoDeveloperSupportURL;
- (uint64_t)cps_forceReportProblemErrorUnableToSubmitResponse;
- (void)setCps_didShowFirstTimeLocationConsent:()ClipServicesExtras;
@end

@implementation NSUserDefaults(ClipServicesExtras)

+ (id)cps_clipServicesDefaults
{
  if (cps_clipServicesDefaults_onceToken != -1) {
    dispatch_once(&cps_clipServicesDefaults_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)cps_clipServicesDefaults_clipServicesDefaults;

  return v0;
}

- (uint64_t)cps_didShowFirstTimeLocationConsent
{
  v0 = objc_msgSend(MEMORY[0x263EFFA40], "cps_clipServicesDefaults");
  uint64_t v1 = [v0 BOOLForKey:@"CPSDidShowFirstTimeLocationConsent"];

  return v1;
}

- (void)setCps_didShowFirstTimeLocationConsent:()ClipServicesExtras
{
  objc_msgSend(MEMORY[0x263EFFA40], "cps_clipServicesDefaults");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBool:a3 forKey:@"CPSDidShowFirstTimeLocationConsent"];
}

- (uint64_t)cps_forceReportProblemErrorFetchProblemTypes
{
  v0 = objc_msgSend(MEMORY[0x263EFFA40], "cps_clipServicesDefaults");
  uint64_t v1 = [v0 BOOLForKey:@"CPSForceReportProblemErrorFetchProblemTypes"];

  return v1;
}

- (uint64_t)cps_forceReportProblemErrorNoDeveloperSupportURL
{
  v0 = objc_msgSend(MEMORY[0x263EFFA40], "cps_clipServicesDefaults");
  uint64_t v1 = [v0 BOOLForKey:@"CPSForceReportProblemErrorNoDeveloperSupportURL"];

  return v1;
}

- (uint64_t)cps_forceReportProblemErrorUnableToSubmitResponse
{
  v0 = objc_msgSend(MEMORY[0x263EFFA40], "cps_clipServicesDefaults");
  uint64_t v1 = [v0 BOOLForKey:@"CPSForceReportProblemErrorUnableToSubmitResponse"];

  return v1;
}

@end