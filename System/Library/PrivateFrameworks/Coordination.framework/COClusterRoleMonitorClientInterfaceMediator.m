@interface COClusterRoleMonitorClientInterfaceMediator
- (COClusterRoleMonitor)monitor;
- (COClusterRoleMonitorClientInterfaceMediator)initWithClusterRoleMonitor:(id)a3;
- (void)membersWithRole:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5;
- (void)roleOfMember:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5;
- (void)snapshotOfCluster:(id)a3 didChangeTo:(id)a4;
@end

@implementation COClusterRoleMonitorClientInterfaceMediator

- (COClusterRoleMonitorClientInterfaceMediator)initWithClusterRoleMonitor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COClusterRoleMonitorClientInterfaceMediator;
  v5 = [(COClusterRoleMonitorClientInterfaceMediator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_monitor, v4);
  }

  return v6;
}

- (void)roleOfMember:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monitor);
  v11 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained roleOfMember:v12 inCluster:v8 didChangeTo:v9];
  }
}

- (void)membersWithRole:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monitor);
  v11 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained membersWithRole:v12 inCluster:v8 didChangeTo:v9];
  }
}

- (void)snapshotOfCluster:(id)a3 didChangeTo:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monitor);
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained snapshotOfCluster:v9 didChangeTo:v6];
  }
}

- (COClusterRoleMonitor)monitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monitor);

  return (COClusterRoleMonitor *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end