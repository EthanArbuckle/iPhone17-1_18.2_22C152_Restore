@interface DMCFeatureOverrides
+ (BOOL)BOOLForDefaultsKey:(id)a3;
+ (BOOL)_isUnknownProduct;
+ (BOOL)allowAnyESSOApplicationEntitlements;
+ (BOOL)allowAnyMAIDToSignIn;
+ (BOOL)bypassMDMTLSClientAuthentication;
+ (BOOL)bypassWatchUnpairWhenUnenrolling;
+ (BOOL)fakePushToken;
+ (BOOL)forceAppInstallUnremovability;
+ (BOOL)forceAppRemovalOnUnenroll;
+ (BOOL)forceMediaCommandSupport;
+ (BOOL)ignoreEnrollmentMode;
+ (BOOL)sentinelExistsAtPath:(id)a3;
+ (BOOL)shouldSimulateDEPCommunication;
+ (BOOL)shouldSimulateMDMAccountDrivenEnrollment;
+ (BOOL)shouldSimulateMDMCommunication;
+ (BOOL)useHTTPLogging;
+ (BOOL)useNonEphemeralWebAuthSession;
+ (BOOL)watchEnrollmentAllowLocalProfile;
+ (double)accountSignInTimeoutThresholdWithDefaultValue:(double)a3;
+ (double)enrollmentStepTimeoutThresholdWithDefaultValue:(double)a3;
+ (id)activationRecordFlagsWithFlags:(id)a3;
+ (id)appleMDMWellKnownURLWithDefaultValue:(id)a3;
+ (id)attestationRateLimitOverrideMinutes;
+ (id)deviceNameWithDefaultValue:(id)a3;
+ (id)dictForDefaultsKey:(id)a3;
+ (id)enrollmentProfileWithDefaultValue:(id)a3;
+ (id)gestaltOverrideForKey:(__CFString *)a3 withDefaultValue:(id)a4;
+ (id)mdmAppInstallationSourceIdentifierWithDefaultValue:(id)a3;
+ (id)modelNameWithDefaultValue:(id)a3;
+ (id)modelNumberWithDefaultValue:(id)a3;
+ (id)numberForDefaultsKey:(id)a3;
+ (id)objectForDefaultsKey:(id)a3;
+ (id)productNameWithDefaultValue:(id)a3;
+ (id)serviceDiscoveryDefaultPortWithValue:(id)a3;
+ (id)serviceDiscoveryDomainWithValue:(id)a3;
+ (id)serviceDiscoveryFallbackServerVersion;
+ (id)serviceDiscoveryFallbackURLWithValue:(id)a3;
+ (id)simluatedMDMAccountDrivenEnrollmentAuthenticationResults;
+ (id)simulatedCloudConfigProfile;
+ (id)simulatedMDMAccountDrivenEnrollmentAuthMethod;
+ (id)simulatedMDMAccountDrivenEnrollmentDefaultUsername;
+ (id)simulatedMDMEnrollmentMode;
+ (id)simulatedMDMEnrollmentProfile;
+ (id)softwareUpdateDeviceIDWithDefaultValue:(id)a3;
+ (id)stringForDefaultsKey:(id)a3;
+ (id)wellKnownDiscoveryURLWithValue:(id)a3;
@end

@implementation DMCFeatureOverrides

+ (id)stringForDefaultsKey:(id)a3
{
  id v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal])
  {
    v4 = +[DMCDefaults stringForDefaultsKey:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)numberForDefaultsKey:(id)a3
{
  id v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal])
  {
    v4 = +[DMCDefaults numberForDefaultsKey:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)BOOLForDefaultsKey:(id)a3
{
  id v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal]) {
    BOOL v4 = +[DMCDefaults BOOLForDefaultsKey:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)dictForDefaultsKey:(id)a3
{
  id v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal])
  {
    BOOL v4 = +[DMCDefaults dictForDefaultsKey:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)objectForDefaultsKey:(id)a3
{
  id v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal])
  {
    BOOL v4 = +[DMCDefaults objectForDefaultsKey:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)sentinelExistsAtPath:(id)a3
{
  id v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal])
  {
    BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v5 = [v4 fileExistsAtPath:v3];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (double)accountSignInTimeoutThresholdWithDefaultValue:(double)a3
{
  BOOL v4 = [a1 numberForDefaultsKey:@"AccountSignInTimeout"];
  char v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    a3 = v6;
  }

  return a3;
}

+ (BOOL)allowAnyMAIDToSignIn
{
  return [a1 BOOLForDefaultsKey:@"AllowAnyMAID"];
}

+ (id)enrollmentProfileWithDefaultValue:(id)a3
{
  id v4 = a3;
  char v5 = [a1 stringForDefaultsKey:@"MDMProfilePath"];
  if (v5)
  {
    double v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  }
  else
  {
    double v6 = 0;
  }
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = v4;
  }
  id v8 = v7;

  return v8;
}

+ (double)enrollmentStepTimeoutThresholdWithDefaultValue:(double)a3
{
  id v4 = [a1 numberForDefaultsKey:@"EnrollmentStepTimeout"];
  char v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    a3 = v6;
  }

  return a3;
}

+ (BOOL)ignoreEnrollmentMode
{
  return [a1 BOOLForDefaultsKey:@"DMCIgnoreEnrollmentMode"];
}

+ (id)serviceDiscoveryDefaultPortWithValue:(id)a3
{
  id v4 = a3;
  char v5 = [a1 numberForDefaultsKey:@"ServiceDiscoveryDefaultPort"];
  double v6 = v5;
  if (!v5) {
    char v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)serviceDiscoveryDomainWithValue:(id)a3
{
  id v4 = a3;
  char v5 = [a1 stringForDefaultsKey:@"ServiceDiscoveryDomain"];
  double v6 = v5;
  if (!v5) {
    char v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)appleMDMWellKnownURLWithDefaultValue:(id)a3
{
  id v4 = a3;
  char v5 = [a1 stringForDefaultsKey:@"AppleMDMWellKnownURL"];
  double v6 = v5;
  if (!v5) {
    char v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)serviceDiscoveryFallbackURLWithValue:(id)a3
{
  id v4 = a3;
  char v5 = [a1 stringForDefaultsKey:@"ServiceDiscoveryFallbackURL"];
  double v6 = v5;
  if (!v5) {
    char v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)wellKnownDiscoveryURLWithValue:(id)a3
{
  id v4 = a3;
  char v5 = [a1 stringForDefaultsKey:@"WellKnownDiscoveryURL"];
  double v6 = v5;
  if (!v5) {
    char v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)serviceDiscoveryFallbackServerVersion
{
  return (id)[a1 stringForDefaultsKey:@"ServiceDiscoveryFallbackServerVersion"];
}

+ (BOOL)useNonEphemeralWebAuthSession
{
  return [a1 BOOLForDefaultsKey:@"DMCUseNonEphemeralWebAuthSession"];
}

+ (BOOL)allowAnyESSOApplicationEntitlements
{
  return [a1 BOOLForDefaultsKey:@"DMCAllowAnyESSOTestApplicationEntitlements"];
}

+ (BOOL)shouldSimulateMDMCommunication
{
  if ([a1 BOOLForDefaultsKey:@"SimulateMDMCommunication"]) {
    return 1;
  }
  return [a1 sentinelExistsAtPath:@"/var/db/MDM_EnableSim"];
}

+ (BOOL)shouldSimulateDEPCommunication
{
  return [a1 BOOLForDefaultsKey:@"SimulateDEPCommunication"];
}

+ (BOOL)shouldSimulateMDMAccountDrivenEnrollment
{
  return [a1 BOOLForDefaultsKey:@"SimulateMDMAccountDrivenEnrollment"];
}

+ (id)simulatedMDMEnrollmentMode
{
  return (id)[a1 stringForDefaultsKey:@"SimulatedMDMEnrollmentMode"];
}

+ (id)simulatedMDMAccountDrivenEnrollmentDefaultUsername
{
  return (id)[a1 stringForDefaultsKey:@"SimulatedMDMAccountDrivenEnrollmentDefaultUsername"];
}

+ (id)simulatedMDMAccountDrivenEnrollmentAuthMethod
{
  return (id)[a1 stringForDefaultsKey:@"SimulatedMDMAccountDrivenEnrollmentAuthMethod"];
}

+ (id)simluatedMDMAccountDrivenEnrollmentAuthenticationResults
{
  v2 = [a1 objectForDefaultsKey:@"SimulatedMDMAccountDrivenEnrollmentAuthenticationResults"];
  id v3 = (void *)[v2 mutableCopy];

  return v3;
}

+ (id)simulatedCloudConfigProfile
{
  return (id)[a1 objectForDefaultsKey:@"SimulatedCloudConfigProfile"];
}

+ (id)simulatedMDMEnrollmentProfile
{
  return (id)[a1 objectForDefaultsKey:@"SimulatedMDMEnrollmentProfile"];
}

+ (BOOL)useHTTPLogging
{
  return [a1 BOOLForDefaultsKey:@"UseHTTPLogging"];
}

+ (BOOL)bypassMDMTLSClientAuthentication
{
  return [a1 BOOLForDefaultsKey:@"DMCBypassMDMTLSClientAuthentication"];
}

+ (BOOL)bypassWatchUnpairWhenUnenrolling
{
  return [a1 BOOLForDefaultsKey:@"DMCBypassWatchUnpairWhenUnenrolling"];
}

+ (id)activationRecordFlagsWithFlags:(id)a3
{
  id v4 = a3;
  if (([a1 sentinelExistsAtPath:*MEMORY[0x1E4F5E598]] & 1) != 0
    || ([a1 stringForDefaultsKey:*MEMORY[0x1E4F5E620]],
        char v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (int)([v4 intValue] | 1);
    }
    else {
      uint64_t v6 = 1;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%lld", v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v4;
  }
  id v8 = v7;

  return v8;
}

+ (BOOL)_isUnknownProduct
{
  return 0;
}

+ (id)modelNameWithDefaultValue:(id)a3
{
  id v4 = (__CFString *)a3;
  if ([a1 _isUnknownProduct])
  {
    char v5 = @"iProd";
  }
  else
  {
    char v5 = [a1 stringForDefaultsKey:@"DMCModelNameOverride"];
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;

  return v7;
}

+ (id)modelNumberWithDefaultValue:(id)a3
{
  id v4 = (__CFString *)a3;
  if ([a1 _isUnknownProduct])
  {
    char v5 = @"iProd";
  }
  else
  {
    char v5 = [a1 stringForDefaultsKey:@"DMCModelNumberOverride"];
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;

  return v7;
}

+ (id)productNameWithDefaultValue:(id)a3
{
  id v4 = (__CFString *)a3;
  if ([a1 _isUnknownProduct])
  {
    char v5 = @"iProd1,1";
  }
  else
  {
    char v5 = [a1 stringForDefaultsKey:@"DMCProductNameOverride"];
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;

  return v7;
}

+ (id)deviceNameWithDefaultValue:(id)a3
{
  id v4 = (__CFString *)a3;
  if ([a1 _isUnknownProduct])
  {
    char v5 = @"iDevice";
  }
  else
  {
    char v5 = [a1 stringForDefaultsKey:@"DMCDeviceNameOverride"];
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;

  return v7;
}

+ (id)softwareUpdateDeviceIDWithDefaultValue:(id)a3
{
  id v4 = (__CFString *)a3;
  if ([a1 _isUnknownProduct])
  {
    char v5 = @"iProd1,1";
  }
  else
  {
    char v5 = [a1 stringForDefaultsKey:@"DMCSoftwareUpdateDeviceIDOverride"];
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;

  return v7;
}

+ (id)attestationRateLimitOverrideMinutes
{
  return (id)[a1 numberForDefaultsKey:@"DMCAttestationRateLimitOverrideMinutes"];
}

+ (id)gestaltOverrideForKey:(__CFString *)a3 withDefaultValue:(id)a4
{
  id v6 = a4;
  id v7 = [a1 objectForDefaultsKey:@"DMCMobileGestaltOverride"];
  id v8 = [v7 objectForKeyedSubscript:a3];
  v9 = v8;
  if (!v8) {
    id v8 = v6;
  }
  id v10 = v8;

  return v10;
}

+ (BOOL)watchEnrollmentAllowLocalProfile
{
  return [a1 BOOLForDefaultsKey:@"DMCWatchEnrollmentAllowLocalProfile"];
}

+ (id)mdmAppInstallationSourceIdentifierWithDefaultValue:(id)a3
{
  id v4 = a3;
  char v5 = [a1 stringForDefaultsKey:@"DMCMDMAppSourceIdentifierOverride"];
  id v6 = v5;
  if (!v5) {
    char v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (BOOL)forceAppInstallUnremovability
{
  v2 = [a1 numberForDefaultsKey:@"DMCDefaultsKeyForceAppInstallUnremovability"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)forceAppRemovalOnUnenroll
{
  v2 = [a1 numberForDefaultsKey:@"DMCDefaultsKeyForceAppRemovalOnUnenroll"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)forceMediaCommandSupport
{
  v2 = [a1 numberForDefaultsKey:@"DMCEnableMediaCommands"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)fakePushToken
{
  v2 = [a1 numberForDefaultsKey:@"DMCFakePushToken"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end