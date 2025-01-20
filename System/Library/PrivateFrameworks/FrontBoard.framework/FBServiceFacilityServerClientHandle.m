@interface FBServiceFacilityServerClientHandle
- (BOOL)isSuspended;
- (BSProcessHandle)processHandle;
- (BSXPCServiceConnectionMessaging)clientHandle_messageBuilder;
- (FBSServiceFacilityClientContext)context;
- (FBServiceFacilityServerClientHandle)initWithFacilityID:(id)a3 connection:(id)a4;
- (NSString)description;
- (NSString)facilityID;
- (RBSProcessIdentity)processIdentity;
- (id)prettyProcessDescription;
- (int)pid;
- (void)invalidate;
- (void)setContext:(id)a3;
@end

@implementation FBServiceFacilityServerClientHandle

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_facilityID withName:0 skipIfNil:1];
  v5 = FBSProcessPrettyDescription();
  id v6 = (id)[v3 appendObject:@"remote" withName:v5 skipIfNil:1];

  v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)facilityID
{
  return self->_facilityID;
}

- (id)prettyProcessDescription
{
  return (id)FBSProcessPrettyDescription();
}

- (FBServiceFacilityServerClientHandle)initWithFacilityID:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"facilityID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBServiceFacilityServerClientHandle initWithFacilityID:connection:](a2, (uint64_t)self, (uint64_t)v19);
    }
    }
LABEL_11:
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632B718);
  }
  v9 = v8;
  if (!v8)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"connection"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBServiceFacilityServerClientHandle initWithFacilityID:connection:](a2, (uint64_t)self, (uint64_t)v19);
    }
    }
    goto LABEL_11;
  }
  v20.receiver = self;
  v20.super_class = (Class)FBServiceFacilityServerClientHandle;
  v10 = [(FBServiceFacilityServerClientHandle *)&v20 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    facilityID = v10->_facilityID;
    v10->_facilityID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_connection, a4);
    uint64_t v13 = [v9 remoteProcess];
    processHandle = v10->_processHandle;
    v10->_processHandle = (BSProcessHandle *)v13;

    v15 = +[FBProcessManager sharedInstance];
    uint64_t v16 = [v15 registerProcessForHandle:v10->_processHandle];
    process = v10->_process;
    v10->_process = (FBProcess *)v16;
  }
  return v10;
}

- (int)pid
{
  return [(BSProcessHandle *)self->_processHandle pid];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facilityID, 0);
}

- (void)invalidate
{
}

- (RBSProcessIdentity)processIdentity
{
  return [(FBProcess *)self->_process identity];
}

- (BOOL)isSuspended
{
  return [(FBProcess *)self->_process taskState] == 3;
}

- (void)setContext:(id)a3
{
  v5 = (FBSServiceFacilityClientContext *)a3;
  context = self->_context;
  if (context != v5)
  {
    id v7 = v5;
    [(FBSServiceFacilityClientContext *)context setClientHandle:0];
    objc_storeStrong((id *)&self->_context, a3);
    [(FBSServiceFacilityClientContext *)self->_context setClientHandle:self];
    v5 = v7;
  }
}

- (BSXPCServiceConnectionMessaging)clientHandle_messageBuilder
{
  return self->_connection;
}

- (FBSServiceFacilityClientContext)context
{
  return self->_context;
}

- (void)initWithFacilityID:(uint64_t)a3 connection:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"FBServiceFacilityServerClientHandle.m";
  __int16 v10 = 1024;
  int v11 = 29;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithFacilityID:(uint64_t)a3 connection:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"FBServiceFacilityServerClientHandle.m";
  __int16 v10 = 1024;
  int v11 = 30;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end