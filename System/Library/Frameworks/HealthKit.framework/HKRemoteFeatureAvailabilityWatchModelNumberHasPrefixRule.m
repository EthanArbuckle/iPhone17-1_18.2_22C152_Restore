@interface HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)modelNumberPrefix;
- (void)processUserInfo:(id)a3;
- (void)setModelNumberPrefix:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule

+ (id)ruleIdentifier
{
  return @"WatchModelNumberHasPrefix";
}

- (void)processUserInfo:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"ModelNumberPrefix"];
  [(HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule *)self setModelNumberPrefix:v4];
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule *)self modelNumberPrefix];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v5 = [v4 watchModelNumber];
  v6 = [(HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule *)self modelNumberPrefix];
  char v7 = [v5 hasPrefix:v6];

  return v7;
}

- (NSString)modelNumberPrefix
{
  return self->_modelNumberPrefix;
}

- (void)setModelNumberPrefix:(id)a3
{
}

- (void).cxx_destruct
{
}

@end