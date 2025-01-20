@interface HKHealthStore(HKDisplayTypeControllerAccessorAdditions)
- (id)displayTypeController;
@end

@implementation HKHealthStore(HKDisplayTypeControllerAccessorAdditions)

- (id)displayTypeController
{
  return +[HKDisplayTypeController sharedInstanceForHealthStore:a1];
}

@end