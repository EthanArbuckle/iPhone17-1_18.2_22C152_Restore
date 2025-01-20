@interface FBProcessExitContext
+ (id)descriptionForExitReason:(unint64_t)a3;
- (BOOL)consideredJetsam;
- (BOOL)exitedNormally;
- (BOOL)fairPlayFailure;
- (FBProcessExitContext)initWithLaunchError:(id)a3;
- (FBProcessExitContext)initWithTerminationError:(id)a3;
- (FBProcessExitContext)initWithUnderlyingContext:(id)a3;
- (FBProcessState)stateBeforeExiting;
- (FBProcessWatchdogEventContext)watchdogContext;
- (FBSProcessTerminationRequest)terminationRequest;
- (NSError)launchError;
- (NSError)terminationError;
- (NSString)debugDescription;
- (NSString)description;
- (RBSProcessExitContext)underlyingContext;
- (id)createError;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)exitCode;
- (int)terminationSignal;
- (int64_t)exitStatus;
- (int64_t)terminationReason;
- (unint64_t)exitReason;
- (void)setStateBeforeExiting:(id)a3;
- (void)setTerminationReason:(int64_t)a3;
- (void)setTerminationRequest:(id)a3;
- (void)setWatchdogContext:(id)a3;
@end

@implementation FBProcessExitContext

- (FBProcessExitContext)initWithUnderlyingContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FBProcessExitContext;
  v6 = [(FBProcessExitContext *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingContext, a3);
    uint64_t v8 = [v5 type];
    if (v8 == 1)
    {
      v7->_exitReason = 1;
    }
    else if (v8 == 2)
    {
      v9 = [v5 status];
      if ([v9 isValid])
      {
        if ([v9 domain] == 10 && objc_msgSend(v9, "code") == 2343432205)
        {
          uint64_t v10 = 2;
        }
        else if ([v9 isCrash])
        {
          uint64_t v10 = 4;
        }
        else if ([v9 isJetsam])
        {
          uint64_t v10 = 16;
        }
        else if ([v9 isSignal])
        {
          uint64_t v10 = 8;
        }
        else if ([v9 isFairPlayFailure])
        {
          uint64_t v10 = 32;
        }
        else
        {
          uint64_t v10 = 128;
        }
        v7->_exitReason = v10;
      }
      else
      {
        v7->_exitReason = 0;
      }
    }
    else
    {
      v7->_exitReason = 0;
    }
  }

  return v7;
}

- (FBProcessExitContext)initWithLaunchError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"error != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      [(FBProcessExitContext *)a2 initWithLaunchError:(uint64_t)v20];
    }
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635986CLL);
  }
  v7 = v6;
  uint64_t v8 = [(FBProcessExitContext *)self initWithUnderlyingContext:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_launchError, a3);
    v9->_exitReason = 64;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = [v7 underlyingErrors];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      uint64_t v14 = *MEMORY[0x1E4F28798];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) { {
            objc_enumerationMutation(v10);
          }
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v17 = [v16 domain];
          if ([v17 isEqual:v14])
          {
            uint64_t v18 = [v16 code];

            if (v18 == 80)
            {
              v9->_exitReason = 32;
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }
LABEL_14:
  }
  return v9;
}

- (FBProcessExitContext)initWithTerminationError:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = [(FBProcessExitContext *)self initWithUnderlyingContext:0];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_terminationError, a3);
      v9->_exitReason = 128;
    }

    return v9;
  }
  else
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"error != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      [(FBProcessExitContext *)a2 initWithTerminationError:(uint64_t)v11];
    }
    }
    [v11 UTF8String];
    result = (FBProcessExitContext *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)createError
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSStringFromFBProcessExitReason(self->_exitReason);
  [v3 setObject:v4 forKey:*MEMORY[0x1E4F624F0]];

  id v5 = [(RBSProcessExitContext *)self->_underlyingContext status];
  id v6 = v5;
  launchError = self->_launchError;
  if (launchError || (launchError = self->_terminationError) != 0)
  {
    [v3 setObject:launchError forKey:*MEMORY[0x1E4F28A50]];
  }
  else if ([v5 isValid])
  {
    uint64_t v10 = [v6 error];
    if (v10) { {
      [v3 setObject:v10 forKey:*MEMORY[0x1E4F28A50]];
    }
    }
  }
  int64_t exitReason = self->_exitReason;
  if (exitReason <= 15)
  {
    v9 = @"The process exited.";
    switch(exitReason)
    {
      case 0:
        goto LABEL_28;
      case 1:
        v9 = @"The process exited voluntarily.";
        goto LABEL_28;
      case 2:
        watchdogContext = self->_watchdogContext;
        if (!watchdogContext)
        {
          v9 = @"The process was watchdogged.";
          goto LABEL_28;
        }
        uint64_t v12 = NSString;
        uint64_t v13 = NSStringFromProcessWatchdogEvent([(FBProcessWatchdogEventContext *)watchdogContext event]);
        v9 = [v12 stringWithFormat:@"The process was watchdogged during a %@ event.", v13];

        if (v9) { {
          goto LABEL_28;
        }
        }
        break;
      case 4:
        v9 = @"The process crashed.";
        goto LABEL_28;
      case 8:
        objc_msgSend(NSString, "stringWithFormat:", @"The process exited with signal %llu.", objc_msgSend(v6, "code"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v9) { {
          goto LABEL_24;
        }
        }
        goto LABEL_28;
      default:
        goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (exitReason <= 63)
  {
    if (exitReason != 16)
    {
      if (exitReason == 32)
      {
        v9 = @"The process was unable to launch due to a FairPlay failure.";
        goto LABEL_28;
      }
      goto LABEL_24;
    }
    v9 = @"The process was jettisoned.";
    goto LABEL_28;
  }
  if (exitReason == 64)
  {
    v9 = @"The process failed to launch.";
    goto LABEL_28;
  }
  if (exitReason != 128)
  {
LABEL_24:
    v9 = @"The process exited.";
    goto LABEL_28;
  }
  if (self->_terminationError)
  {
    v9 = @"The process failed to terminate as expected.";
    goto LABEL_28;
  }
  uint64_t v16 = [v6 code];
  if (v16 <= 3735883979)
  {
    if (v16 == 732775916)
    {
      if (self->_terminationReason == 8) { {
        v9 = @"The process was terminated for rendering insecurely.";
      }
      }
      else {
        v9 = @"The process was terminated due to a security violation.";
      }
      goto LABEL_28;
    }
    if (v16 == 3221229823)
    {
      v9 = @"The process exited due to thermal pressure.";
      goto LABEL_28;
    }
    goto LABEL_24;
  }
  switch(v16)
  {
    case 3735883980:
      v9 = @"The process suspended while holding a shared file lock.";
      break;
    case 3735943697:
      v9 = @"The process was quit by the user.";
      break;
    case 4227595259:
      int64_t terminationReason = self->_terminationReason;
      if (terminationReason == 9 || terminationReason == 6) { {
        v9 = @"The process was quit because the system is shutting down or logging out.";
      }
      }
      else {
        v9 = @"The process was force quit by the system.";
      }
      break;
    default:
      goto LABEL_24;
  }
LABEL_28:
  [v3 setObject:v9 forKey:*MEMORY[0x1E4F28588]];
  uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBProcessExit" code:self->_exitReason userInfo:v3];

  return v14;
}

- (NSString)description
{
  if (self->_exitReason == 2 && self->_terminationRequest)
  {
    id v3 = [MEMORY[0x1E4F62810] builderWithObject:objc_opt_class()];
    v4 = NSStringFromFBProcessExitReason(self->_exitReason);
    id v5 = [(FBSProcessTerminationRequest *)self->_terminationRequest label];
    id v6 = [v4 stringByAppendingFormat:@" (\"%@\"", v5];

    id v7 = (id)[v3 appendObject:v6 withName:0];
    uint64_t v8 = [v3 build];
  }
  else
  {
    uint64_t v8 = [(RBSProcessExitContext *)self->_underlyingContext description];
  }

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  return (NSString *)[(FBProcessExitContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBProcessExitContext *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F62810] builderWithObject:objc_opt_class()];
  v4 = NSStringFromFBProcessExitReason(self->_exitReason);
  id v5 = (id)[v3 appendObject:v4 withName:@"exitReason"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBProcessExitContext *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(FBProcessExitContext *)self succinctDescriptionBuilder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__FBProcessExitContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v8[3] = &unk_1E5C497A0;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:0 block:v8];
  id v6 = v5;

  return v6;
}

id __62__FBProcessExitContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"underlying" skipIfNil:1];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(uint64_t *)(v3 + 64) >= 1)
  {
    v4 = *(void **)(a1 + 32);
    id v5 = FBSApplicationTerminationReasonDescription();
    id v6 = (id)[v4 appendObject:v5 withName:@"terminationReason"];

    uint64_t v3 = *(void *)(a1 + 40);
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(v3 + 24) descriptionWithMultilinePrefix:0];
  id v9 = (id)[v7 appendObject:v8 withName:@"launchError" skipIfNil:1];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 32) descriptionWithMultilinePrefix:0];
  id v12 = (id)[v10 appendObject:v11 withName:@"launchError" skipIfNil:1];

  id v13 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"stateAtExit" skipIfNil:1];
  id v14 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"terminationRequest" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"watchdogContext" skipIfNil:1];
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

- (RBSProcessExitContext)underlyingContext
{
  return self->_underlyingContext;
}

- (NSError)launchError
{
  return self->_launchError;
}

- (NSError)terminationError
{
  return self->_terminationError;
}

- (FBSProcessTerminationRequest)terminationRequest
{
  return self->_terminationRequest;
}

- (void)setTerminationRequest:(id)a3
{
}

- (FBProcessWatchdogEventContext)watchdogContext
{
  return self->_watchdogContext;
}

- (void)setWatchdogContext:(id)a3
{
}

- (FBProcessState)stateBeforeExiting
{
  return self->_stateBeforeExiting;
}

- (void)setStateBeforeExiting:(id)a3
{
}

- (int64_t)terminationReason
{
  return self->_terminationReason;
}

- (void)setTerminationReason:(int64_t)a3
{
  self->_int64_t terminationReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingContext, 0);
}

- (int64_t)exitStatus
{
  return 0;
}

- (BOOL)exitedNormally
{
  return self->_exitReason == 1;
}

- (int)exitCode
{
  return ![(FBProcessExitContext *)self exitedNormally];
}

- (int)terminationSignal
{
  if (self->_exitReason != 8) { {
    return 0;
  }
  }
  id v2 = [(RBSProcessExitContext *)self->_underlyingContext status];
  int v3 = [v2 code];

  return v3;
}

- (BOOL)consideredJetsam
{
  return self->_exitReason == 16;
}

- (BOOL)fairPlayFailure
{
  return self->_exitReason == 32;
}

+ (id)descriptionForExitReason:(unint64_t)a3
{
  return NSStringFromFBProcessExitReason(a3);
}

- (void)initWithLaunchError:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"FBProcessExitContext.m";
  __int16 v10 = 1024;
  int v11 = 68;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithTerminationError:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"FBProcessExitContext.m";
  __int16 v10 = 1024;
  int v11 = 87;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end