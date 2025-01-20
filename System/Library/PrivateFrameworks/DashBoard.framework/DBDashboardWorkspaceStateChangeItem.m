@interface DBDashboardWorkspaceStateChangeItem
- (BOOL)prefersAnimation;
- (DBDashboardWorkspaceStateChangeItem)init;
- (NSString)description;
- (id)_init;
- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)changeType;
- (unint64_t)presentationPreference;
- (void)_buildDescriptionWithBuilder:(id)a3;
- (void)setChangeType:(unint64_t)a3;
- (void)setPresentationPreference:(unint64_t)a3;
@end

@implementation DBDashboardWorkspaceStateChangeItem

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)DBDashboardWorkspaceStateChangeItem;
  return [(DBDashboardWorkspaceStateChangeItem *)&v3 init];
}

- (DBDashboardWorkspaceStateChangeItem)init
{
  return 0;
}

- (NSString)description
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F29C40]) initWithObject:self];
  [(DBDashboardWorkspaceStateChangeItem *)self _buildDescriptionWithBuilder:v3];
  v4 = [v3 build];

  return (NSString *)v4;
}

- (BOOL)prefersAnimation
{
  return [(DBDashboardWorkspaceStateChangeItem *)self changeType] != 2;
}

- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3
{
  return 0;
}

- (void)_buildDescriptionWithBuilder:(id)a3
{
  id v4 = a3;
  if (self->_changeType) {
    v5 = @"Remove";
  }
  else {
    v5 = @"Add";
  }
  id v11 = v4;
  id v6 = (id)[v4 appendObject:v5 withName:@"changeType"];
  unint64_t presentationPreference = self->_presentationPreference;
  if (presentationPreference)
  {
    v8 = @"Normal";
    if (presentationPreference != 1) {
      v8 = 0;
    }
    if (presentationPreference == 2) {
      v9 = @"Stacked";
    }
    else {
      v9 = v8;
    }
    id v10 = (id)[v11 appendObject:v9 withName:@"presentationPreference"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) _init];
  *((void *)result + 1) = self->_changeType;
  *((void *)result + 2) = self->_presentationPreference;
  return result;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (unint64_t)presentationPreference
{
  return self->_presentationPreference;
}

- (void)setPresentationPreference:(unint64_t)a3
{
  self->_unint64_t presentationPreference = a3;
}

@end