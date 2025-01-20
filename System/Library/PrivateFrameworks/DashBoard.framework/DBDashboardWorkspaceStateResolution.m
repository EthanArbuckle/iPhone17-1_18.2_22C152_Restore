@interface DBDashboardWorkspaceStateResolution
- (DBDashboardEntity)activateSuspendedEntity;
- (DBDashboardWorkspaceState)state;
- (id)changeItemForEntity:(id)a3;
- (void)setActivateSuspendedEntity:(id)a3;
- (void)setState:(id)a3;
@end

@implementation DBDashboardWorkspaceStateResolution

- (id)changeItemForEntity:(id)a3
{
  return (id)objc_msgSend(a3, "_sr_associatedChangeItem");
}

- (DBDashboardWorkspaceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (DBDashboardEntity)activateSuspendedEntity
{
  return self->_activateSuspendedEntity;
}

- (void)setActivateSuspendedEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activateSuspendedEntity, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end