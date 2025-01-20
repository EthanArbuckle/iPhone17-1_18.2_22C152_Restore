@interface DBMutableDashboardWorkspaceState
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBaseEntity:(id)a3;
- (void)setStackedEntity:(id)a3;
@end

@implementation DBMutableDashboardWorkspaceState

- (void)setBaseEntity:(id)a3
{
}

- (void)setStackedEntity:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DBDashboardWorkspaceState alloc];
  return [(DBDashboardWorkspaceState *)v4 _initWithState:self];
}

@end