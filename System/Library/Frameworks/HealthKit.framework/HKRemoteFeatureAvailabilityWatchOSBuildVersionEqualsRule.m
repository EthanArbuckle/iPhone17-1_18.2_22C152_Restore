@interface HKRemoteFeatureAvailabilityWatchOSBuildVersionEqualsRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)buildVersion;
- (void)processUserInfo:(id)a3;
- (void)setBuildVersion:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityWatchOSBuildVersionEqualsRule

+ (id)ruleIdentifier
{
  return @"WatchOSBuildVersionEquals";
}

- (void)processUserInfo:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"BuildVersion"];
  [(HKRemoteFeatureAvailabilityWatchOSBuildVersionEqualsRule *)self setBuildVersion:v4];
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityWatchOSBuildVersionEqualsRule *)self buildVersion];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v5 = [v4 watchOSBuildVersion];

  if (!v5) {
    return 0;
  }
  v6 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v7 = [v6 watchOSBuildVersion];
  v8 = [(HKRemoteFeatureAvailabilityWatchOSBuildVersionEqualsRule *)self buildVersion];
  char v9 = [v7 isEqualToString:v8];

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