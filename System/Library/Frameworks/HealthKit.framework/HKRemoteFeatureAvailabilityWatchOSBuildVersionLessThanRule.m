@interface HKRemoteFeatureAvailabilityWatchOSBuildVersionLessThanRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)buildVersion;
- (void)processUserInfo:(id)a3;
- (void)setBuildVersion:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityWatchOSBuildVersionLessThanRule

+ (id)ruleIdentifier
{
  return @"WatchOSBuildVersionLessThan";
}

- (void)processUserInfo:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"BuildVersion"];
  [(HKRemoteFeatureAvailabilityWatchOSBuildVersionLessThanRule *)self setBuildVersion:v4];
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityWatchOSBuildVersionLessThanRule *)self buildVersion];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v5 = [v4 watchOSBuildVersion];

  if (!v5) {
    return 0;
  }
  v6 = [(HKRemoteFeatureAvailabilityWatchOSBuildVersionLessThanRule *)self buildVersion];
  v7 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v8 = [v7 watchOSBuildVersion];
  BOOL v9 = objc_msgSend(v6, "hk_compareBuildVersionWithString:", v8) == 1;

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