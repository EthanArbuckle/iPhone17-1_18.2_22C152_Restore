@interface FPExceptionToErrorProxy
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (FPExceptionToErrorProxy)initWithTarget:(id)a3;
- (id)errorFromException:(id)a3 whileSendingToSelector:(SEL)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)target;
- (id)unhandledExceptionHandler;
- (void)forwardInvocation:(id)a3;
- (void)setTarget:(id)a3;
- (void)setUnhandledExceptionHandler:(id)a3;
@end

@implementation FPExceptionToErrorProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = objc_msgSend(self->_target, "methodSignatureForSelector:");
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)FPExceptionToErrorProxy;
    id v7 = [(FPExceptionToErrorProxy *)&v10 methodSignatureForSelector:a3];
  }
  v8 = v7;

  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)FPExceptionToErrorProxy;
  return [(FPExceptionToErrorProxy *)&v6 respondsToSelector:a3];
}

- (BOOL)isKindOfClass:(Class)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (FPExceptionToErrorProxy)initWithTarget:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPExceptionToErrorProxy;
  objc_super v6 = [(FPExceptionToErrorProxy *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_target, a3);
  }

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  __FP_EXCEPTION_TO_ERROR_PROXY_CALLING_OUT__(v4, (const char *)self->_target);
}

- (BOOL)conformsToProtocol:(id)a3
{
  return [self->_target conformsToProtocol:a3];
}

- (id)errorFromException:(id)a3 whileSendingToSelector:(SEL)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 debugDescription];
  v8 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  objc_super v9 = [v7 componentsSeparatedByCharactersInSet:v8];

  unint64_t v10 = [v9 indexOfObjectPassingTest:&__block_literal_global_60];
  if (v10 < 2 || v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [v6 debugDescription];
  }
  else
  {
    v12 = objc_msgSend(v9, "subarrayWithRange:", 0, v10 - 2);
    v13 = [v12 arrayByAddingObject:@""]);

    v14 = [v13 componentsJoinedByString:@"\n"];
  }
  v15 = NSString;
  v16 = NSStringFromSelector(a4);
  v17 = [v15 stringWithFormat:@"Exception caught sending %@ to %@:\n%@", v16, self->_target, v14];

  v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F281F8];
  uint64_t v23 = *MEMORY[0x1E4F28228];
  v24[0] = v17;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  v21 = [v18 errorWithDomain:v19 code:4099 userInfo:v20];

  return v21;
}

uint64_t __69__FPExceptionToErrorProxy_errorFromException_whileSendingToSelector___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"__FP_EXCEPTION_TO_ERROR_PROXY_CALLING_OUT__"];
}

uint64_t __45__FPExceptionToErrorProxy_forwardInvocation___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FileProvider", "exceptions");
  uint64_t v1 = forwardInvocation__exceptionLog;
  forwardInvocation__exceptionLog = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)unhandledExceptionHandler
{
  return self->_unhandledExceptionHandler;
}

- (void)setUnhandledExceptionHandler:(id)a3
{
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unhandledExceptionHandler, 0);

  objc_storeStrong(&self->_target, 0);
}

- (void)forwardInvocation:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1A33AE000, log, OS_LOG_TYPE_FAULT, "[CRIT] %@", buf, 0xCu);
}

@end