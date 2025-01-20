@interface DBInstrumentClusterWorkspaceOwner
- (DBWorkspace)workspace;
- (unint64_t)session:(id)a3 policyForRequest:(id)a4;
- (void)setWorkspace:(id)a3;
@end

@implementation DBInstrumentClusterWorkspaceOwner

- (unint64_t)session:(id)a3 policyForRequest:(id)a4
{
  return 0;
}

- (DBWorkspace)workspace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workspace);
  return (DBWorkspace *)WeakRetained;
}

- (void)setWorkspace:(id)a3
{
}

- (void).cxx_destruct
{
}

@end