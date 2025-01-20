@interface _COClusterAliasManagerStateTrackingAddOn
- (COClusterAliasManager)aliasManager;
- (void)didStopMeshController:(id)a3;
- (void)setAliasManager:(id)a3;
@end

@implementation _COClusterAliasManagerStateTrackingAddOn

- (void)didStopMeshController:(id)a3
{
  id v4 = a3;
  v5 = [(_COClusterAliasManagerStateTrackingAddOn *)self aliasManager];
  [v5 didStopMeshController:v4];

  v6.receiver = self;
  v6.super_class = (Class)_COClusterAliasManagerStateTrackingAddOn;
  [(COMeshAddOn *)&v6 didStopMeshController:v4];
}

- (COClusterAliasManager)aliasManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_aliasManager);
  return (COClusterAliasManager *)WeakRetained;
}

- (void)setAliasManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end