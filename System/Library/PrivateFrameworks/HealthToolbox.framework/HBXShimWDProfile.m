@interface HBXShimWDProfile
- (HBXShimWDProfile)initWithHealthStore:(id)a3;
- (id)userActivityManager;
@end

@implementation HBXShimWDProfile

- (HBXShimWDProfile)initWithHealthStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HBXShimWDProfile;
  return [(WDProfile *)&v4 initWithHealthStore:a3];
}

- (id)userActivityManager
{
  return 0;
}

@end