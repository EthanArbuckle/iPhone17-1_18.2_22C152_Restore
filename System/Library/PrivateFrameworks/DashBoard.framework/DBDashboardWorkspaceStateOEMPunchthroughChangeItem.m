@interface DBDashboardWorkspaceStateOEMPunchthroughChangeItem
- (BOOL)prefersAnimation;
- (DBDashboardWorkspaceStateOEMPunchthroughChangeItem)init;
- (NSString)oemPunchthroughIdentifier;
- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3;
- (void)setOemPunchthroughIdentifier:(id)a3;
@end

@implementation DBDashboardWorkspaceStateOEMPunchthroughChangeItem

- (DBDashboardWorkspaceStateOEMPunchthroughChangeItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)DBDashboardWorkspaceStateOEMPunchthroughChangeItem;
  return (DBDashboardWorkspaceStateOEMPunchthroughChangeItem *)[(DBDashboardWorkspaceStateChangeItem *)&v3 _init];
}

- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3
{
  objc_super v3 = [(DBDashboardWorkspaceStateOEMPunchthroughChangeItem *)self oemPunchthroughIdentifier];
  v4 = +[DBDashboardOEMPunchthroughEntity oemPunchthroughEntityForIdentifier:v3];

  return v4;
}

- (BOOL)prefersAnimation
{
  return 0;
}

- (NSString)oemPunchthroughIdentifier
{
  return self->_oemPunchthroughIdentifier;
}

- (void)setOemPunchthroughIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end