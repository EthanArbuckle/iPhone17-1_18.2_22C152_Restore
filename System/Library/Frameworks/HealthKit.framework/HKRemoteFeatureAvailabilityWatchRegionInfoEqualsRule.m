@interface HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)regionInfo;
- (void)processUserInfo:(id)a3;
- (void)setRegionInfo:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule

+ (id)ruleIdentifier
{
  return @"WatchRegionInfoEquals";
}

- (void)processUserInfo:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"RegionInfo"];
  [(HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule *)self setRegionInfo:v4];
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule *)self regionInfo];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v5 = [v4 watchRegionInfo];
  v6 = [(HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule *)self regionInfo];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (NSString)regionInfo
{
  return self->_regionInfo;
}

- (void)setRegionInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end