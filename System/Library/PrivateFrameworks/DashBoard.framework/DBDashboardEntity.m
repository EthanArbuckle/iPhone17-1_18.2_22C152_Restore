@interface DBDashboardEntity
- (BOOL)isApplicationEntity;
- (BOOL)isFullScreenEntity;
- (BOOL)isHomescreenEntity;
- (BOOL)isOEMPunchthroughEntity;
- (BOOL)isProxiedApplicationEntity;
- (BOOL)isSiriEntity;
- (DBDashboardEntity)init;
- (DBDashboardWorkspaceStateChangeItem)_sr_associatedChangeItem;
- (NSString)identifier;
- (id)_initWithIdentifier:(id)a3;
- (id)description;
- (void)_buildDescriptionWithBuilder:(id)a3;
- (void)_setSR_associatedChangeItem:(id)a3;
@end

@implementation DBDashboardEntity

- (DBDashboardEntity)init
{
  return 0;
}

- (id)_initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBDashboardEntity;
  v6 = [(DBDashboardEntity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F29C40]) initWithObject:self];
  [(DBDashboardEntity *)self _buildDescriptionWithBuilder:v3];
  v4 = [v3 build];

  return v4;
}

- (void)_buildDescriptionWithBuilder:(id)a3
{
  id v3 = (id)[a3 appendObject:self->_identifier withName:@"identifier"];
}

- (BOOL)isSiriEntity
{
  return 0;
}

- (BOOL)isHomescreenEntity
{
  return 0;
}

- (BOOL)isApplicationEntity
{
  return 0;
}

- (BOOL)isProxiedApplicationEntity
{
  return 0;
}

- (BOOL)isFullScreenEntity
{
  return 0;
}

- (BOOL)isOEMPunchthroughEntity
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

- (void)_setSR_associatedChangeItem:(id)a3
{
}

- (DBDashboardWorkspaceStateChangeItem)_sr_associatedChangeItem
{
  v2 = objc_getAssociatedObject(self, "sr_aci");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  v4 = v3;

  return v4;
}

@end