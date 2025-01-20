@interface HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)productType;
- (void)processUserInfo:(id)a3;
- (void)setProductType:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule

+ (id)ruleIdentifier
{
  return @"WatchProductTypeHasPrefix";
}

- (void)processUserInfo:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"ProductTypePrefix"];
  [(HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule *)self setProductType:v4];
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule *)self productType];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v5 = [v4 watchProductType];
  v6 = [(HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule *)self productType];
  char v7 = [v5 hasPrefix:v6];

  return v7;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end