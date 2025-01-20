@interface BSXPCServiceConnectionActivationMessage
- (id)initWithMessage:(void *)a1;
- (void)dealloc;
- (void)invalidate;
- (void)sendIfNecessary;
@end

@implementation BSXPCServiceConnectionActivationMessage

- (void).cxx_destruct
{
}

- (id)initWithMessage:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)BSXPCServiceConnectionActivationMessage;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong(v3 + 1, a2);
    *((_DWORD *)v4 + 4) = 0;
  }
  return v4;
}

- (void)sendIfNecessary
{
  if (BSAtomicSetFlag())
  {
    [(BSXPCServiceConnectionMessage *)self->_message send];
    message = self->_message;
    self->_message = 0;
  }
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((BSAtomicGetFlag() & 1) == 0)
  {
    v4 = [NSString stringWithFormat:@"must be sent or invalidated before dealloc"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_super v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      v16 = @"BSXPCServiceConnection.m";
      __int16 v17 = 1024;
      int v18 = 1332;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C767CB0);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSXPCServiceConnectionActivationMessage;
  [(BSXPCServiceConnectionActivationMessage *)&v8 dealloc];
}

- (void)invalidate
{
  if (BSAtomicSetFlag())
  {
    [(BSXPCServiceConnectionMessage *)self->_message invalidate];
    message = self->_message;
    self->_message = 0;
  }
}

@end