@interface CNAutocompleteNetworkActivityPolicy
+ (id)policyWithNoDelay;
+ (id)policyWithThrottlingDelayForString:(id)a3;
- (BOOL)shouldSearchServers;
- (double)delayBeforeBeginningNetworkActivity;
@end

@implementation CNAutocompleteNetworkActivityPolicy

+ (id)policyWithNoDelay
{
  v2 = objc_alloc_init(CNAutocompleteNetworkActivityPolicy);
  return v2;
}

+ (id)policyWithThrottlingDelayForString:(id)a3
{
  id v3 = a3;
  v4 = [[CNAutocompleteNetworkActivityThrottlingPolicy alloc] initWithString:v3];

  return v4;
}

- (BOOL)shouldSearchServers
{
  return 1;
}

- (double)delayBeforeBeginningNetworkActivity
{
  return 0.0;
}

@end