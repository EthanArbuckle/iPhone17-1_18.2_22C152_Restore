@interface CNKCrossFadeAnimatorFactory
- (CNKCrossFadeAnimatorFactory)init;
- (id)makeAnimator;
@end

@implementation CNKCrossFadeAnimatorFactory

- (id)makeAnimator
{
  v2 = self;
  id v3 = CNKCrossFadeAnimatorFactory.makeAnimator()();

  return v3;
}

- (CNKCrossFadeAnimatorFactory)init
{
  return (CNKCrossFadeAnimatorFactory *)CNKCrossFadeAnimatorFactory.init()();
}

@end