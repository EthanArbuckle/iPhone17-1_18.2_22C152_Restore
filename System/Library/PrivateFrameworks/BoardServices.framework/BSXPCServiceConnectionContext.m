@interface BSXPCServiceConnectionContext
- (BOOL)isChild;
- (BOOL)isClient;
- (BOOL)isNonLaunching;
- (BOOL)isRoot;
- (BOOL)isServer;
- (BSXPCServiceConnectionContext)init;
- (NSString)endpointDescription;
- (id)description;
- (void)_initWithProem:(void *)a1;
@end

@implementation BSXPCServiceConnectionContext

- (BOOL)isRoot
{
  return 0;
}

- (void).cxx_destruct
{
}

- (BOOL)isServer
{
  return 0;
}

- (BOOL)isClient
{
  return 0;
}

- (BOOL)isChild
{
  return 0;
}

- (void)_initWithProem:(void *)a1
{
  id v3 = a2;
  v8.receiver = a1;
  v8.super_class = (Class)BSXPCServiceConnectionContext;
  v4 = objc_msgSendSuper2(&v8, sel_init);
  if (v4)
  {
    uint64_t v5 = [v3 copy];
    v6 = (void *)v4[1];
    v4[1] = v5;
  }
  return v4;
}

- (BOOL)isNonLaunching
{
  return 0;
}

- (BSXPCServiceConnectionContext)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithFormat:@"init is not allowed on BSXPCServiceConnectionContext"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BSXPCServiceConnectionContext.m";
    __int16 v17 = 1024;
    int v18 = 23;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSXPCServiceConnectionContext *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)endpointDescription
{
  return 0;
}

- (id)description
{
  if (self) {
    proem = self->_proem;
  }
  else {
    proem = 0;
  }
  v4 = NSString;
  id v5 = proem;
  v6 = [(BSXPCServiceConnectionContext *)self endpointDescription];
  v7 = [v4 stringWithFormat:@"%@%@", v5, v6];

  return v7;
}

@end