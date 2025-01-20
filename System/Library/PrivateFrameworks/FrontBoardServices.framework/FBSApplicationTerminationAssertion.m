@interface FBSApplicationTerminationAssertion
- (FBSApplicationTerminationAssertion)initWithBundleID:(id)a3 reason:(id)a4 acquisitionHandler:(id)a5;
- (NSString)bundleID;
- (NSString)reason;
- (id)description;
- (int64_t)assertionState;
- (void)dealloc;
- (void)invalidate;
@end

@implementation FBSApplicationTerminationAssertion

- (int64_t)assertionState
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t assertionState = v2->_assertionState;
  objc_sync_exit(v2);

  return assertionState;
}

- (FBSApplicationTerminationAssertion)initWithBundleID:(id)a3 reason:(id)a4 acquisitionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bundleID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationTerminationAssertion initWithBundleID:reason:acquisitionHandler:](a2);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!v10)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationTerminationAssertion initWithBundleID:reason:acquisitionHandler:](a2);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
  }
  v12 = v11;
  v13 = [(FBSApplicationTerminationAssertion *)self init];
  if (v13)
  {
    uint64_t v14 = [v9 copy];
    bundleID = v13->_bundleID;
    v13->_bundleID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v16;

    v18 = [MEMORY[0x1E4F4E298] terminationAssertionContext];
    [v18 setExceptionCode:4227595259];
    if ([v10 isEqualToString:@"critical"])
    {
      uint64_t v19 = 3;
    }
    else if ([v10 isEqualToString:@"installation"])
    {
      uint64_t v19 = 2;
    }
    else
    {
      uint64_t v19 = [v10 isEqualToString:@"deletion"];
    }
    id v20 = objc_alloc(MEMORY[0x1E4F4E290]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __81__FBSApplicationTerminationAssertion_initWithBundleID_reason_acquisitionHandler___block_invoke;
    v27[3] = &unk_1E58F74D8;
    v21 = v13;
    v28 = v21;
    id v29 = v12;
    uint64_t v22 = [v20 initWithBundleIdentifier:v9 efficacy:v19 name:@"FBSApplicationTerminationAssertion" context:v18 withHandler:v27];
    assertion = v21->_assertion;
    v21->_assertion = (BKSTerminationAssertion *)v22;
  }
  return v13;
}

void __81__FBSApplicationTerminationAssertion_initWithBundleID_reason_acquisitionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 16))
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    if (v5)
    {
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      id v17 = v5;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    }
    else
    {
      id v9 = 0;
    }
    id v10 = [v8 errorWithDomain:@"FBSApplicationTerminationAssertionErrorDomain" code:-4 userInfo:v9];
    if (v5) {
  }
    }
  else if (a2)
  {
    id v10 = 0;
    *(void *)(v7 + 16) = 1;
  }
  else
  {
    *(void *)(v7 + 16) = 2;
    unint64_t v11 = [0 code];
    if (v11 >= 3) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = qword_19C722CC8[v11];
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    if (v5)
    {
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      v19[0] = v5;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v10 = [v13 errorWithDomain:@"FBSApplicationTerminationAssertionErrorDomain" code:v12 userInfo:v14];
    if (v5) {
  }
    }
  objc_sync_exit(v6);

  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, *(void *)(a1 + 32), v10);
  }
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (id)description
{
  v3 = [off_1E58F44F0 builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_reason withName:@"reason"];
  id v5 = (id)[v3 appendObject:self->_bundleID withName:@"bundleID"];
  id v6 = (id)[v3 appendUnsignedInteger:self->_assertionState withName:@"state"];
  uint64_t v7 = [v3 build];

  return v7;
}

- (void)invalidate
{
  [(BKSTerminationAssertion *)self->_assertion invalidate];
  assertion = self->_assertion;
  self->_assertion = 0;

  self->_int64_t assertionState = 3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_assertion, 0);
}

- (void)initWithBundleID:(const char *)a1 reason:acquisitionHandler:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithBundleID:(const char *)a1 reason:acquisitionHandler:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end