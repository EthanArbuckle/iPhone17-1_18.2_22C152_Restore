@interface DBDashboardSiriEntity
+ (id)entity;
- (BOOL)isFloating;
- (BOOL)isSiriEntity;
- (void)setFloating:(BOOL)a3;
@end

@implementation DBDashboardSiriEntity

+ (id)entity
{
  id v2 = [(DBDashboardEntity *)[DBDashboardSiriEntity alloc] _initWithIdentifier:@"com.apple.carplay.dashboard.siri"];
  return v2;
}

- (BOOL)isSiriEntity
{
  return 1;
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

@end