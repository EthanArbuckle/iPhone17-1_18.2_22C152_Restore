@interface DBDashboardWorkspaceStateSiriChangeItem
- (BOOL)isFloating;
- (BOOL)prefersAnimation;
- (DBDashboardWorkspaceStateSiriChangeItem)init;
- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3;
- (void)setFloating:(BOOL)a3;
@end

@implementation DBDashboardWorkspaceStateSiriChangeItem

- (DBDashboardWorkspaceStateSiriChangeItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)DBDashboardWorkspaceStateSiriChangeItem;
  return (DBDashboardWorkspaceStateSiriChangeItem *)[(DBDashboardWorkspaceStateChangeItem *)&v3 _init];
}

- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3
{
  v4 = +[DBDashboardSiriEntity entity];
  objc_msgSend(v4, "setFloating:", -[DBDashboardWorkspaceStateSiriChangeItem isFloating](self, "isFloating"));
  return v4;
}

- (BOOL)prefersAnimation
{
  return 0;
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