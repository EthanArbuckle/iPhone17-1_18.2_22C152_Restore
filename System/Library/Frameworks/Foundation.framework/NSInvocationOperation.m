@interface NSInvocationOperation
- (NSInvocation)invocation;
- (NSInvocationOperation)init;
- (NSInvocationOperation)initWithInvocation:(NSInvocation *)inv;
- (NSInvocationOperation)initWithTarget:(id)target selector:(SEL)sel object:(id)arg;
- (id)result;
- (void)dealloc;
- (void)main;
@end

@implementation NSInvocationOperation

- (NSInvocationOperation)init
{
  return [(NSInvocationOperation *)self initWithInvocation:0];
}

- (NSInvocationOperation)initWithTarget:(id)target selector:(SEL)sel object:(id)arg
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v19[0] = arg;
  v9 = (void *)[target methodSignatureForSelector:sel];
  if (!v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)NSInvocationOperation;
    [(NSOperation *)&v18 init];
LABEL_10:

    return 0;
  }
  v10 = v9;
  unint64_t v11 = [v9 numberOfArguments];
  unint64_t v12 = v11;
  if ((v11 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v11 >= 4)
    {
      v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      v16 = NSStringFromSelector(sel);
      NSLog((NSString *)@"%@: method '%@' requires more than 1 argument", v15, v16);
    }
    v17.receiver = self;
    v17.super_class = (Class)NSInvocationOperation;
    [(NSOperation *)&v17 init];
    goto LABEL_10;
  }
  v13 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
  [v13 setTarget:target];
  [v13 setSelector:sel];
  if (v12 >= 3) {
    [v13 setArgument:v19 atIndex:2];
  }
  return [(NSInvocationOperation *)self initWithInvocation:v13];
}

- (NSInvocationOperation)initWithInvocation:(NSInvocation *)inv
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (inv)
  {
    v7.receiver = self;
    v7.super_class = (Class)NSInvocationOperation;
    v5 = [(NSOperation *)&v7 init];
    [(NSInvocation *)inv retainArguments];
    v5->_inv = inv;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSInvocationOperation;
    [(NSOperation *)&v8 init];

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSInvocationOperation;
  [(NSOperation *)&v3 dealloc];
}

- (NSInvocation)invocation
{
  v2 = self->_inv;

  return v2;
}

- (void)main
{
}

- (id)result
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v22[0] = 0;
  BOOL v4 = [(NSOperation *)self isFinished];
  id result = 0;
  if (!v4) {
    return result;
  }
  if ([(NSOperation *)self isCancelled])
  {
    v20 = +[NSString stringWithFormat:@"%@: operation was cancelled", _NSMethodExceptionProem((objc_class *)self, a2)];
    objc_super v18 = (void *)MEMORY[0x1E4F1CA00];
    v19 = @"NSInvocationOperationCancelledException";
LABEL_14:
    objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v20 userInfo:0]);
  }
  p_iop = (os_unfair_lock_s *)&self->super._iop;
  os_unfair_lock_lock(&self->super._iop.__lock);
  exception = self->_exception;
  if (exception)
  {
    v21 = exception;
    iop_unlock(p_iop);
    objc_exception_throw(v21);
  }
  inv = self->_inv;
  if (!inv
    || ![(NSMethodSignature *)[(NSInvocation *)inv methodSignature] methodReturnLength])
  {
    objc_super v17 = +[NSString stringWithFormat:@"%@: operation had void result", _NSMethodExceptionProem((objc_class *)self, a2)];
    iop_unlock(p_iop);
    objc_super v18 = (void *)MEMORY[0x1E4F1CA00];
    v19 = @"NSInvocationOperationVoidResultException";
    v20 = v17;
    goto LABEL_14;
  }
  uint64_t v9 = [(NSInvocation *)self->_inv methodSignature];
  v10 = [(NSMethodSignature *)v9 methodReturnType];
  unint64_t v11 = &v10[strspn(v10, "norNORV+0123456789")];
  int v12 = *(unsigned __int8 *)v11;
  if (v12 == 64 || v12 == 35)
  {
    [(NSInvocation *)self->_inv getReturnValue:v22];
  }
  else
  {
    uint64_t v13 = [(NSMethodSignature *)v9 methodReturnLength];
    double v14 = MEMORY[0x1F4188790](v13);
    v16 = (char *)v22 - v15;
    -[NSInvocation getReturnValue:](self->_inv, "getReturnValue:", (char *)v22 - v15, v14);
    v22[0] = +[NSValue valueWithBytes:v16 objCType:v11];
  }
  os_unfair_lock_unlock(&self->super._iop.__lock);
  return (id)v22[0];
}

@end