@interface HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)buildType;
- (void)processUserInfo:(id)a3;
- (void)setBuildType:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule

+ (id)ruleIdentifier
{
  return @"WatchBuildTypeEquals";
}

- (void)processUserInfo:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"BuildType"];
  [(HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule *)self setBuildType:v4];
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule *)self buildType];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v5 = [v4 watchBuildType];
  v6 = [(HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule *)self buildType];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (NSString)buildType
{
  return self->_buildType;
}

- (void)setBuildType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end