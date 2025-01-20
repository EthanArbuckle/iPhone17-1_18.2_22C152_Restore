@interface _COClusterRoleMonitorSnapshotObserver
- (NSSet)lastValue;
- (OS_dispatch_queue)queue;
- (id)block;
- (id)cluster;
- (id)description;
- (id)initInCluster:(id)a3 queue:(id)a4 block:(id)a5;
- (void)notify:(id)a3;
- (void)setLastValue:(id)a3;
@end

@implementation _COClusterRoleMonitorSnapshotObserver

- (id)initInCluster:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_COClusterRoleMonitorSnapshotObserver;
  v11 = [(_COClusterRoleMonitorSnapshotObserver *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    id cluster = v11->_cluster;
    v11->_id cluster = (id)v12;

    objc_storeStrong((id *)&v11->_queue, a4);
    uint64_t v14 = [v10 copy];
    id block = v11->_block;
    v11->_id block = (id)v14;

    lastValue = v11->_lastValue;
    v11->_lastValue = 0;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_COClusterRoleMonitorSnapshotObserver *)self cluster];
  v7 = [v3 stringWithFormat:@"<%@: %p, id cluster = %@>", v5, self, v6];

  return v7;
}

- (void)notify:(id)a3
{
  id v4 = a3;
  v5 = [(_COClusterRoleMonitorSnapshotObserver *)self lastValue];

  if (!v5)
  {
    id v8 = COLogForCategory(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_COClusterRoleMonitorSnapshotObserver notify:]();
    }
    goto LABEL_10;
  }
  v6 = [(_COClusterRoleMonitorSnapshotObserver *)self lastValue];
  char v7 = [v4 isEqualToSet:v6];

  id v8 = COLogForCategory(2);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) == 0)
  {
    if (v9) {
      -[_COClusterRoleMonitorSnapshotObserver notify:]();
    }
LABEL_10:

    [(_COClusterRoleMonitorSnapshotObserver *)self setLastValue:v4];
    id v10 = [(_COClusterRoleMonitorSnapshotObserver *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __48___COClusterRoleMonitorSnapshotObserver_notify___block_invoke;
    v11[3] = &unk_2644444E0;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v10, v11);

    goto LABEL_11;
  }
  if (v9) {
    -[_COClusterRoleMonitorSnapshotObserver notify:]();
  }

LABEL_11:
}

- (id)cluster
{
  return self->_cluster;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)block
{
  return self->_block;
}

- (NSSet)lastValue
{
  return self->_lastValue;
}

- (void)setLastValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastValue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_cluster, 0);
}

- (void)notify:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v0, v1, "%@ invoking block for initial Snapshot(%@)");
}

- (void)notify:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v0, v1, "%@ not invoking block due to no change in Snapshot(%@)");
}

- (void)notify:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v0, v1, "%@ invoking block for changed Snapshot(%@)");
}

@end