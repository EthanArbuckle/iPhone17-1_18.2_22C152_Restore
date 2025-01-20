@interface HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)buildVersion;
- (void)processUserInfo:(id)a3;
- (void)setBuildVersion:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule

+ (id)ruleIdentifier
{
  return @"IOSBuildVersionEquals";
}

- (void)processUserInfo:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"BuildVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  [(HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule *)self setBuildVersion:v4];
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule *)self buildVersion];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  id v5 = [v4 iOSBuildVersion];

  if (!v5) {
    return 0;
  }
  v6 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v7 = [v6 iOSBuildVersion];
  v8 = [(HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule *)self buildVersion];
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