@interface FBExtensionProcess
- (BOOL)isExtensionProcess;
- (FBProcess)hostProcess;
- (FBSExtensionInfo)extensionInfo;
- (id)succinctDescriptionBuilder;
- (int)hostPID;
- (void)_finishInit;
@end

@implementation FBExtensionProcess

- (void)_finishInit
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBExtensionProcess.m";
  __int16 v16 = 1024;
  int v17 = 28;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (FBProcess)hostProcess
{
  p_hostProcessLock = &self->_hostProcessLock;
  os_unfair_lock_lock(&self->_hostProcessLock);
  lock_hostProcess = self->_lock_hostProcess;
  if (!lock_hostProcess)
  {
    if (self->_hostPID < 1)
    {
      lock_hostProcess = 0;
    }
    else
    {
      v5 = +[FBProcessManager sharedInstance];
      v6 = [v5 processForPID:self->_hostPID];
      v7 = self->_lock_hostProcess;
      self->_lock_hostProcess = v6;

      lock_hostProcess = self->_lock_hostProcess;
    }
  }
  int v8 = lock_hostProcess;
  os_unfair_lock_unlock(p_hostProcessLock);

  return v8;
}

- (BOOL)isExtensionProcess
{
  return 1;
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)FBExtensionProcess;
  v3 = [(FBProcess *)&v7 succinctDescriptionBuilder];
  v4 = [(FBSExtensionInfo *)self->_extensionInfo typeIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"typeID" skipIfNil:1];

  return v3;
}

- (FBSExtensionInfo)extensionInfo
{
  return self->_extensionInfo;
}

- (int)hostPID
{
  return self->_hostPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInfo, 0);
}

@end