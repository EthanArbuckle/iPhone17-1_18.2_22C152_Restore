@interface DBDashboardWorkspaceState
- (DBDashboardEntity)baseEntity;
- (DBDashboardEntity)stackedEntity;
- (NSString)activeBundleIdentifier;
- (NSString)description;
- (id)_bundleIdentifierFromEntity:(id)a3;
- (id)_initWithState:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation DBDashboardWorkspaceState

- (id)_initWithState:(id)a3
{
  v4 = (id *)a3;
  v10.receiver = self;
  v10.super_class = (Class)DBDashboardWorkspaceState;
  v5 = [(DBDashboardWorkspaceState *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_baseEntity, v4[1]);
    uint64_t v7 = [v4[2] copy];
    stackedEntity = v6->_stackedEntity;
    v6->_stackedEntity = (DBDashboardEntity *)v7;
  }
  return v6;
}

- (id)_bundleIdentifierFromEntity:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 applicationToProxy];
LABEL_5:
    v5 = v4;
    v6 = [v4 bundleIdentifier];

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 application];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v3 identifier];
  }
  else
  {
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (NSString)activeBundleIdentifier
{
  id v3 = [(DBDashboardWorkspaceState *)self _bundleIdentifierFromEntity:self->_stackedEntity];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(DBDashboardWorkspaceState *)self _bundleIdentifierFromEntity:self->_baseEntity];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F29C40]) initWithObject:self];
  id v4 = (id)[v3 appendObject:self->_baseEntity withName:@"baseEntity" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_stackedEntity withName:@"stackedEntity" skipIfNil:1];
  v6 = [v3 build];

  return (NSString *)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [DBMutableDashboardWorkspaceState alloc];
  return [(DBDashboardWorkspaceState *)v4 _initWithState:self];
}

- (DBDashboardEntity)baseEntity
{
  return self->_baseEntity;
}

- (DBDashboardEntity)stackedEntity
{
  return self->_stackedEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedEntity, 0);
  objc_storeStrong((id *)&self->_baseEntity, 0);
}

@end