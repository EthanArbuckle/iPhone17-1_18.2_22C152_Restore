@interface HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)buildVersion;
- (void)processUserInfo:(id)a3;
- (void)setBuildVersion:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule

+ (id)ruleIdentifier
{
  return @"WatchOSBuildVersionGreaterThan";
}

- (void)processUserInfo:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"BuildVersion"];
  [(HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule *)self setBuildVersion:v4];
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule *)self buildVersion];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v5 = [v4 watchOSBuildVersion];

  if (!v5) {
    return 0;
  }
  v6 = [(HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule *)self buildVersion];
  v7 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v8 = [v7 watchOSBuildVersion];
  BOOL v9 = objc_msgSend(v6, "hk_compareBuildVersionWithString:", v8) == -1;

  return v9;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end