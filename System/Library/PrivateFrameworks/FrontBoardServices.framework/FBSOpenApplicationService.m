@interface FBSOpenApplicationService
+ (BOOL)currentProcessServicesDefaultShellEndpoint;
+ (FBSOpenApplicationService)serviceWithDefaultShellEndpoint;
+ (FBSOpenApplicationService)serviceWithEndpoint:(id)a3;
+ (id)serviceName;
- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4;
- (FBSOpenApplicationService)init;
- (id)_initWithEndpoint:(id)a3;
- (id)_remoteTarget;
- (void)_openApplication:(id)a3 withOptions:(id)a4 clientHandle:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)openApplication:(id)a3 withOptions:(id)a4 clientHandle:(id)a5 completion:(id)a6;
- (void)openApplication:(id)a3 withOptions:(id)a4 completion:(id)a5;
@end

@implementation FBSOpenApplicationService

+ (FBSOpenApplicationService)serviceWithDefaultShellEndpoint
{
  v2 = [off_1E58F4520 environmentAliases];
  v3 = [off_1E58F4568 defaultShellMachName];
  v4 = [v2 resolveMachService:v3];

  v5 = +[FBSOpenApplicationServiceSpecification identifier];
  v6 = [off_1E58F4568 endpointForMachName:v4 service:v5 instance:0];
  if (v6) {
    id v7 = [[FBSOpenApplicationService alloc] _initWithEndpoint:v6];
  }
  else {
    id v7 = 0;
  }

  return (FBSOpenApplicationService *)v7;
}

- (id)_initWithEndpoint:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Bsserviceconne.isa);
  if (!v4)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSOpenApplicationService _initWithEndpoint:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSOpenApplicationService _initWithEndpoint:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }

  v5 = +[FBSOpenApplicationServiceSpecification identifier];
  v6 = [v4 service];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v15 = [NSString stringWithFormat:@"service of endpoint is incorrect"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSOpenApplicationService _initWithEndpoint:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
  }
  v16.receiver = self;
  v16.super_class = (Class)FBSOpenApplicationService;
  v8 = [(FBSOpenApplicationService *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [off_1E58F4560 connectionWithEndpoint:v4];
    connection = v8->_connection;
    v8->_connection = (BSServiceConnection *)v9;

    v11 = +[FBSOpenApplicationServiceSpecification serviceQuality];
    [off_1E58F44F8 serial];
    [[objc_claimAutoreleasedReturnValue() serviceClass:objc_msgSend(v11, "serviceClass")] relativePriority:objc_msgSend(v11, "relativePriority")];
    objc_claimAutoreleasedReturnValue();
    BSDispatchQueueCreate();
  }

  return 0;
}

void __47__FBSOpenApplicationService__initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setServiceQuality:v3];
  [v5 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 8)];
  id v4 = +[FBSOpenApplicationServiceSpecification interface];
  [v5 setInterface:v4];

  [v5 setInterruptionHandler:&__block_literal_global_16];
  [v5 setInvalidationHandler:&__block_literal_global_23];
}

+ (id)serviceName
{
  return +[FBSOpenApplicationServiceSpecification identifier];
}

void __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_68(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (v6)
  {
    v8 = [v6 domain];
    int v9 = [@"FBSOpenApplicationServiceErrorDomain" isEqualToString:v8];

    if (v9)
    {
      id v10 = v7;
      goto LABEL_19;
    }
    if ([v7 isBSServiceConnectionError])
    {
      v14 = [off_1E58F4560 currentContext];
      v15 = [v14 remoteProcess];

      if (v15)
      {
        objc_super v16 = NSString;
        v17 = FBSProcessPrettyDescription(v15);
        v18 = [v16 stringWithFormat:@"The system shell (%@) probably crashed.", v17];
      }
      else
      {
        v18 = @"The system shell probably crashed.";
      }
    }
    else
    {
      v18 = 0;
    }
    (*(void (**)(void))(a1[7] + 16))();
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_19:
      v11 = FBLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_68_cold_1((uint64_t)a1, v10, v11);
      }
      goto LABEL_21;
    }
  }
  else if ((int)[(__CFString *)v5 pid] >= 1 && ([(__CFString *)v5 isValid] & 1) == 0)
  {
    (*(void (**)(void))(a1[7] + 16))();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10) {
      goto LABEL_19;
    }
  }
  v11 = FBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[4];
    v13 = @"(process was not provided)";
    if (v5) {
      v13 = v5;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v12;
    __int16 v22 = 2114;
    v23 = v13;
    _os_log_impl(&dword_19C680000, v11, OS_LOG_TYPE_DEFAULT, "[FBSSystemService][%{public}@] Request successful: %{public}@", buf, 0x16u);
  }
  id v10 = 0;
LABEL_21:

  uint64_t v19 = a1[8];
  if (v19) {
    (*(void (**)(uint64_t, __CFString *, id))(v19 + 16))(v19, v5, v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)dealloc
{
  [(BSServiceConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FBSOpenApplicationService;
  [(FBSOpenApplicationService *)&v3 dealloc];
}

- (void)openApplication:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [off_1E58F4558 processHandle];
  [(FBSOpenApplicationService *)self _openApplication:v10 withOptions:v9 clientHandle:v11 completion:v8];
}

- (void)_openApplication:(id)a3 withOptions:(id)a4 clientHandle:(id)a5 completion:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  if (v14)
  {
    NSClassFromString(&cfstr_Bsprocesshandl.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSProcessHandleClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSOpenApplicationService _openApplication:withOptions:clientHandle:completion:]();
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
    }
  }

  id v15 = v10;
  if (v15)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSOpenApplicationService _openApplication:withOptions:clientHandle:completion:]();
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
    }
  }

  id v16 = v11;
  if (v16)
  {
    NSClassFromString(&cfstr_Fbsopenapplica_4.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSOpenApplicationOptionsClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSOpenApplicationService _openApplication:withOptions:clientHandle:completion:]();
      }
      [v29 UTF8String];
      _bs_set_crash_log_message();
    }
  }

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke;
  v37[3] = &unk_1E58F6AA0;
  id v17 = v15;
  id v38 = v17;
  v18 = (void (**)(void, void, void, void))MEMORY[0x19F3991F0](v37);
  uint64_t v19 = [(FBSOpenApplicationService *)self _remoteTarget];
  if (v19)
  {
    v30 = self;
    v20 = [v16 actions];
    uint64_t v21 = [NSString stringWithFormat:@"%#04x", arc4random() % 0xFFFF];
    uint64_t v22 = [v20 count];
    v23 = FBLogCommon();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        v25 = [v20 fbs_singleLineDescriptionOfBSActions];
        *(_DWORD *)buf = 138543874;
        v40 = v21;
        __int16 v41 = 2114;
        id v42 = v17;
        __int16 v43 = 2114;
        v44 = v25;
        _os_log_impl(&dword_19C680000, v23, OS_LOG_TYPE_DEFAULT, "[FBSSystemService][%{public}@] Sending request to open \"%{public}@\" with action(s): %{public}@", buf, 0x20u);
      }
    }
    else if (v24)
    {
      *(_DWORD *)buf = 138543618;
      v40 = v21;
      __int16 v41 = 2114;
      id v42 = v17;
      _os_log_impl(&dword_19C680000, v23, OS_LOG_TYPE_DEFAULT, "[FBSSystemService][%{public}@] Sending request to open \"%{public}@\"", buf, 0x16u);
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_68;
    v31[3] = &unk_1E58F6AC8;
    v35 = v18;
    id v32 = v21;
    id v33 = v17;
    id v36 = v13;
    v34 = v30;
    id v26 = v21;
    [v19 openApplication:v33 withOptions:v16 originator:v14 requestID:v26 completion:v31];

    goto LABEL_16;
  }
  if (v13)
  {
    v20 = ((void (**)(void, uint64_t, __CFString *, void))v18)[2](v18, 5, @"System shell connection is invalid.", 0);
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v20);
LABEL_16:
  }
}

- (id)_remoteTarget
{
  objc_super v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v3)
  {
    [(BSServiceConnection *)self->_connection activate];
    objc_super v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  }

  return v3;
}

- (FBSOpenApplicationService)init
{
  objc_super v3 = [off_1E58F4520 environmentAliases];
  id v4 = [off_1E58F4568 defaultShellMachName];
  id v5 = [v3 resolveMachService:v4];
  id v6 = +[FBSOpenApplicationServiceSpecification identifier];
  char v7 = [off_1E58F4568 endpointForMachName:v5 service:v6 instance:0];
  if (v7)
  {
    id v8 = (FBSOpenApplicationService *)[(FBSOpenApplicationService *)self _initWithEndpoint:v7];
  }
  else
  {
    id v9 = +[FBSOpenApplicationServiceSpecification identifier];
    id v10 = [off_1E58F4568 nullEndpointForService:v9 instance:0];
    id v8 = (FBSOpenApplicationService *)[(FBSOpenApplicationService *)self _initWithEndpoint:v10];
  }
  return v8;
}

+ (FBSOpenApplicationService)serviceWithEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = [[FBSOpenApplicationService alloc] _initWithEndpoint:v3];

  return (FBSOpenApplicationService *)v4;
}

+ (BOOL)currentProcessServicesDefaultShellEndpoint
{
  v2 = [off_1E58F4568 defaultShellMachName];
  id v3 = +[FBSOpenApplicationServiceSpecification identifier];
  id v4 = [off_1E58F4588 bootstrapConfiguration];
  id v5 = [v4 domainForMachName:v2];
  id v6 = [v5 serviceForIdentifier:v3];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)openApplication:(id)a3 withOptions:(id)a4 clientHandle:(id)a5 completion:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F28F80] processInfo];
  id v14 = [v13 bs_jobLabel];
  char v15 = [v14 isEqualToString:@"com.apple.lsd"];

  if ((v15 & 1) == 0)
  {
    id v17 = [NSString stringWithFormat:@"what part about LaunchServices-only did you not understand?"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSOpenApplicationService openApplication:withOptions:clientHandle:completion:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }
  id v16 = v11;
  NSClassFromString(&cfstr_Bsprocesshandl.isa);
  if (!v16)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSOpenApplicationService openApplication:withOptions:clientHandle:completion:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSProcessHandleClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSOpenApplicationService openApplication:withOptions:clientHandle:completion:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }

  [(FBSOpenApplicationService *)self _openApplication:v20 withOptions:v10 clientHandle:v16 completion:v12];
}

- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    BOOL v7 = [(FBSOpenApplicationService *)self _remoteTarget];
    id v8 = v7;
    if (v7)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__FBSOpenApplicationService_canOpenApplication_reason___block_invoke;
      v12[3] = &unk_1E58F6A50;
      v12[4] = self;
      v12[5] = &v13;
      [v7 canOpenApplication:v6 completion:v12];
      id v9 = v14;
      if (!a4)
      {
LABEL_5:
        BOOL v10 = v9[3] == 0;

        _Block_object_dispose(&v13, 8);
        goto LABEL_8;
      }
    }
    else
    {
      id v9 = v14;
      v14[3] = 8;
      if (!a4) {
        goto LABEL_5;
      }
    }
    *a4 = v9[3];
    goto LABEL_5;
  }
  BOOL v10 = 0;
  if (a4) {
    *a4 = 2;
  }
LABEL_8:

  return v10;
}

void __55__FBSOpenApplicationService_canOpenApplication_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    id v4 = [v3 domain];
    int v5 = [v4 isEqualToString:@"FBSOpenApplicationErrorDomain"];

    if (v5) {
      uint64_t v6 = [v7 code];
    }
    else {
      uint64_t v6 = 8;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
    id v3 = v7;
  }
}

id __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F28C58];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_2;
  v14[3] = &unk_1E58F6A78;
  id v15 = *(id *)(a1 + 32);
  id v16 = v7;
  id v17 = v8;
  uint64_t v18 = a2;
  id v10 = v8;
  id v11 = v7;
  id v12 = [v9 bs_errorWithDomain:@"FBSOpenApplicationServiceErrorDomain" code:a2 configuration:v14];

  return v12;
}

void __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = NSString;
  uint64_t v4 = a1[4];
  id v8 = a2;
  int v5 = [v3 stringWithFormat:@"The request to open \"%@\" failed.", v4];
  [v8 setFailureDescription:v5];

  if (a1[5]) {
    uint64_t v6 = @"%@";
  }
  else {
    uint64_t v6 = 0;
  }
  [v8 setFailureReason:v6, a1[5]];
  id v7 = FBSOpenApplicationServiceErrorCodeToString(a1[7]);
  [v8 setCodeDescription:v7];

  [v8 setUnderlyingError:a1[6]];
}

- (void)_initWithEndpoint:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithEndpoint:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)openApplication:withOptions:clientHandle:completion:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)openApplication:withOptions:clientHandle:completion:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_openApplication:withOptions:clientHandle:completion:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_openApplication:withOptions:clientHandle:completion:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_openApplication:withOptions:clientHandle:completion:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_68_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [a2 descriptionWithMultilinePrefix:0];
  int v7 = 138543874;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_error_impl(&dword_19C680000, a3, OS_LOG_TYPE_ERROR, "[FBSSystemService][%{public}@] Error handling open request for %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
}

@end