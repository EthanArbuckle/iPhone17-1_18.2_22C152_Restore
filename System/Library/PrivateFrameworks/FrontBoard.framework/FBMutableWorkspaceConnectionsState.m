@interface FBMutableWorkspaceConnectionsState
- (BOOL)addProcessIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation FBMutableWorkspaceConnectionsState

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [FBWorkspaceConnectionsState alloc];
  pidSet = self->super._pidSet;

  return [(FBWorkspaceConnectionsState *)v4 _initWithIndexSet:pidSet];
}

- (BOOL)addProcessIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"processIdentifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      [(FBMutableWorkspaceConnectionsState *)a2 addProcessIdentifier:(uint64_t)v11];
    }
    }
LABEL_11:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632551CLL);
  }
  v6 = v5;
  int v7 = objc_msgSend(v5, "rbs_pid");
  if (v7 <= 0)
  {
    v11 = [NSString stringWithFormat:@"invalid pid"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      [(FBMutableWorkspaceConnectionsState *)a2 addProcessIdentifier:(uint64_t)v11];
    }
    }
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  char v9 = [(NSMutableIndexSet *)self->super._pidSet containsIndex:v7];
  if ((v9 & 1) == 0) { {
    [(NSMutableIndexSet *)self->super._pidSet addIndex:v8];
  }
  }

  return v9 ^ 1;
}

- (void)addProcessIdentifier:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  char v9 = @"FBWorkspaceConnectionsState.m";
  __int16 v10 = 1024;
  int v11 = 202;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)addProcessIdentifier:(uint64_t)a3 .cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  char v9 = @"FBWorkspaceConnectionsState.m";
  __int16 v10 = 1024;
  int v11 = 205;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end