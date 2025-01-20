@interface HKHealthStore(HealthToolboxViewControllerFactoryAdditions)
- (id)viewControllerFactory;
@end

@implementation HKHealthStore(HealthToolboxViewControllerFactoryAdditions)

- (id)viewControllerFactory
{
  return +[HBXViewControllerFactory sharedInstanceForHealthStore:a1];
}

@end