@interface _COClusterRoleMonitorMemberObserver
- (COClusterMember)member;
- (COClusterRole)lastValue;
- (OS_dispatch_queue)queue;
- (_COClusterRoleMonitorMemberObserver)initWithMember:(id)a3 inCluster:(id)a4 queue:(id)a5 block:(id)a6;
- (id)block;
- (id)cluster;
- (id)description;
- (void)notify:(id)a3;
- (void)setLastValue:(id)a3;
@end

@implementation _COClusterRoleMonitorMemberObserver

- (_COClusterRoleMonitorMemberObserver)initWithMember:(id)a3 inCluster:(id)a4 queue:(id)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_COClusterRoleMonitorMemberObserver;
  v15 = [(_COClusterRoleMonitorMemberObserver *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_member, a3);
    uint64_t v17 = [v12 copy];
    id cluster = v16->_cluster;
    v16->_id cluster = (id)v17;

    objc_storeStrong((id *)&v16->_queue, a5);
    uint64_t v19 = [v14 copy];
    id block = v16->_block;
    v16->_id block = (id)v19;

    lastValue = v16->_lastValue;
    v16->_lastValue = 0;
  }
  return v16;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_COClusterRoleMonitorMemberObserver *)self member];
  v7 = [(_COClusterRoleMonitorMemberObserver *)self cluster];
  v8 = [v3 stringWithFormat:@"<%@: %p, member = %@, id cluster = %@>", v5, self, v6, v7];

  return v8;
}

- (void)notify:(id)a3
{
  id v4 = a3;
  v5 = [(_COClusterRoleMonitorMemberObserver *)self lastValue];

  if (!v5)
  {
    v8 = COLogForCategory(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_COClusterRoleMonitorMemberObserver notify:]();
    }
    goto LABEL_10;
  }
  v6 = [(_COClusterRoleMonitorMemberObserver *)self lastValue];
  char v7 = [v4 isEqual:v6];

  v8 = COLogForCategory(2);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) == 0)
  {
    if (v9) {
      -[_COClusterRoleMonitorMemberObserver notify:]();
    }
LABEL_10:

    [(_COClusterRoleMonitorMemberObserver *)self setLastValue:v4];
    v10 = [(_COClusterRoleMonitorMemberObserver *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46___COClusterRoleMonitorMemberObserver_notify___block_invoke;
    v11[3] = &unk_2644444E0;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v10, v11);

    goto LABEL_11;
  }
  if (v9) {
    -[_COClusterRoleMonitorMemberObserver notify:]();
  }

LABEL_11:
}

- (COClusterMember)member
{
  return self->_member;
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

- (COClusterRole)lastValue
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

  objc_storeStrong((id *)&self->_member, 0);
}

- (void)notify:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v0, v1, "%@ invoking block for initial Role(%@)");
}

- (void)notify:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v0, v1, "%@ not invoking block due to no change in Role(%@)");
}

- (void)notify:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v0, v1, "%@ invoking block for changed Role(%@)");
}

@end