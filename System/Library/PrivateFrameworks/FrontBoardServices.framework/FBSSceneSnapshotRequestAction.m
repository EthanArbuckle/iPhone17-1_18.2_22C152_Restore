@interface FBSSceneSnapshotRequestAction
- (FBSSceneSnapshotContext)context;
- (id)_initWithType:(unint64_t)a3 context:(id)a4 responder:(id)a5;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (unint64_t)type;
@end

@implementation FBSSceneSnapshotRequestAction

- (id)_initWithType:(unint64_t)a3 context:(id)a4 responder:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"responder"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneSnapshotRequestAction _initWithType:context:responder:](a2, (uint64_t)self, (uint64_t)v16);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  v11 = v10;
  id v12 = objc_alloc_init((Class)off_1E58F4540);
  v13 = [NSNumber numberWithUnsignedInteger:a3];
  [v12 setObject:v13 forSetting:1];

  [v12 setObject:v9 forSetting:2];
  [v12 setDescriptionProvider:self];
  v17.receiver = self;
  v17.super_class = (Class)FBSSceneSnapshotRequestAction;
  v14 = [(FBSSceneSnapshotRequestAction *)&v17 initWithInfo:v12 responder:v11];

  return v14;
}

- (unint64_t)type
{
  v2 = [(FBSSceneSnapshotRequestAction *)self info];
  v3 = [v2 objectForSetting:1];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (FBSSceneSnapshotContext)context
{
  v2 = [(FBSSceneSnapshotRequestAction *)self info];
  v3 = [v2 objectForSetting:2];

  return (FBSSceneSnapshotContext *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v3 = @"context";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return @"requestType";
  }
  else {
    return v3;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 != 1) {
    return 0;
  }
  uint64_t v7 = [a4 unsignedIntegerValue:a3, v5, v6];
  v8 = @"invalidateSnapshot";
  if (v7 != 2) {
    v8 = 0;
  }
  if (v7 == 1) {
    return @"performSnapshot";
  }
  else {
    return v8;
  }
}

- (void)_initWithType:(const char *)a1 context:(uint64_t)a2 responder:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBSSceneSnapshotRequestAction.m";
  __int16 v16 = 1024;
  int v17 = 19;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end