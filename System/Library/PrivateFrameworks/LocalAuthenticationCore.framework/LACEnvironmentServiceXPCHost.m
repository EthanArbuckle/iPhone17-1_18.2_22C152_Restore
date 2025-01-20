@interface LACEnvironmentServiceXPCHost
- (LACEnvironmentServiceXPCHost)initWithDependencies:(id)a3 workQueue:(id)a4;
- (void)environmentStateForUser:(id)a3 completion:(id)a4;
@end

@implementation LACEnvironmentServiceXPCHost

- (LACEnvironmentServiceXPCHost)initWithDependencies:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACEnvironmentServiceXPCHost;
  v9 = [(LACEnvironmentServiceXPCHost *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dependencies, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)environmentStateForUser:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v8 = [MEMORY[0x263F08D68] currentConnection];
  if (!v8) {
    -[LACEnvironmentServiceXPCHost environmentStateForUser:completion:]();
  }
  v9 = (void *)v8;
  uint64_t v10 = [v6 unsignedIntValue];
  [v9 auditToken];
  dependencies = self->_dependencies;
  id v17 = 0;
  objc_super v12 = +[LACEnvironmentState environmentStateForUser:v10 auditToken:v18 dependencies:dependencies error:&v17];
  id v13 = v17;
  v14 = LACLogEnvironment();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v9 processIdentifier];
    if (v12) {
      id v16 = v12;
    }
    else {
      id v16 = v13;
    }
    *(_DWORD *)buf = 67109378;
    int v20 = v15;
    __int16 v21 = 2112;
    id v22 = v16;
    _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "Environment state for PID %u: %@", buf, 0x12u);
  }

  v7[2](v7, v12, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_stateForUser, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
}

- (void)environmentStateForUser:completion:.cold.1()
{
}

@end