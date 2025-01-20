@interface FMDExtHostContext
- (BOOL)respondsToSelector:(SEL)a3;
- (FMDExtAccessoryDelegateProtocol)accessoryDelegate;
- (FMDExtHostContext)init;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setAccessoryDelegate:(id)a3;
@end

@implementation FMDExtHostContext

- (FMDExtHostContext)init
{
  v3 = LogCategory_Extensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0E93000, v3, OS_LOG_TYPE_DEFAULT, "#ext - alloced host context instance", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)FMDExtHostContext;
  return [(FMDExtHostContext *)&v5 init];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FMDExtHostContext;
  if (-[FMDExtHostContext respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    objc_super v5 = [(FMDExtHostContext *)self accessoryDelegate];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FMDExtHostContext;
  objc_super v5 = -[FMDExtHostContext methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    v6 = [(FMDExtHostContext *)self accessoryDelegate];
    objc_super v5 = [v6 methodSignatureForSelector:a3];
  }

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(FMDExtHostContext *)self accessoryDelegate];
  [v4 selector];
  char v6 = objc_opt_respondsToSelector();

  objc_super v7 = LogCategory_Extensions();
  objc_super v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(FMDExtHostContext *)self accessoryDelegate];
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "HostContext forwardInvocation %@ to delegate %@", (uint8_t *)&v10, 0x16u);
    }
    objc_super v8 = [(FMDExtHostContext *)self accessoryDelegate];
    [v4 invokeWithTarget:v8];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[FMDExtHostContext forwardInvocation:](v4, v8);
  }
}

- (FMDExtAccessoryDelegateProtocol)accessoryDelegate
{
  return self->_accessoryDelegate;
}

- (void)setAccessoryDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)forwardInvocation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector((SEL)[a1 selector]);
  int v4 = 138412290;
  objc_super v5 = v3;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "Invocation %@ not supported skipping completion block", (uint8_t *)&v4, 0xCu);
}

@end