@interface _CRKBuiltInProvider
- (NSString)providerIdentifier;
- (id)cardViewControllerForCard:(id)a3;
- (unint64_t)displayPriorityForCard:(id)a3;
@end

@implementation _CRKBuiltInProvider

- (NSString)providerIdentifier
{
  return (NSString *)@"com.apple.cardkit";
}

- (id)cardViewControllerForCard:(id)a3
{
  id v3 = a3;
  id v4 = [[CRKCardViewController alloc] _initWithCard:v3 delegate:0 loadBundles:0 loadProvidersImmediately:0];

  return v4;
}

- (unint64_t)displayPriorityForCard:(id)a3
{
  return 0;
}

@end