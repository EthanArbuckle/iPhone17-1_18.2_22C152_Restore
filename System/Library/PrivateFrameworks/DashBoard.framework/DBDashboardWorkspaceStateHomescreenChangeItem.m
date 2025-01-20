@interface DBDashboardWorkspaceStateHomescreenChangeItem
- (DBDashboardWorkspaceStateHomescreenChangeItem)init;
- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3;
@end

@implementation DBDashboardWorkspaceStateHomescreenChangeItem

- (DBDashboardWorkspaceStateHomescreenChangeItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)DBDashboardWorkspaceStateHomescreenChangeItem;
  return (DBDashboardWorkspaceStateHomescreenChangeItem *)[(DBDashboardWorkspaceStateChangeItem *)&v3 _init];
}

- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end