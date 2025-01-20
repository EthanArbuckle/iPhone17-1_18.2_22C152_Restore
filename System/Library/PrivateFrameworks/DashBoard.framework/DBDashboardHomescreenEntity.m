@interface DBDashboardHomescreenEntity
+ (id)entity;
- (BOOL)isHomescreenEntity;
@end

@implementation DBDashboardHomescreenEntity

+ (id)entity
{
  id v2 = [(DBDashboardEntity *)[DBDashboardHomescreenEntity alloc] _initWithIdentifier:@"com.apple.CarPlay.dashboard"];
  return v2;
}

- (BOOL)isHomescreenEntity
{
  return 1;
}

@end