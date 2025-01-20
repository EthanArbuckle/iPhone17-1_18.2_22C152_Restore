@interface HKRemoteFeatureAvailabilityWatchRegionEqualsRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)regionCode;
- (void)processUserInfo:(id)a3;
- (void)setRegionCode:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityWatchRegionEqualsRule

+ (id)ruleIdentifier
{
  return @"WatchRegionEquals";
}

- (void)processUserInfo:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"RegionCode"];
  [(HKRemoteFeatureAvailabilityWatchRegionEqualsRule *)self setRegionCode:v4];
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityWatchRegionEqualsRule *)self regionCode];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v5 = [v4 watchRegion];
  v6 = [(HKRemoteFeatureAvailabilityWatchRegionEqualsRule *)self regionCode];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end