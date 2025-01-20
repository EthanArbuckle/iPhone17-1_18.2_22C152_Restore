@interface _EMRemoteInterfaceDistantObjectReattempt
+ (id)recordedAttemptWithOriginalInvocation:(id)a3 target:(id)a4 error:(id)a5;
- (NSError)error;
- (NSInvocation)invocation;
- (_EMRemoteInterfaceDistantObjectReattempt)initWithOriginalInvocation:(id)a3 target:(id)a4 error:(id)a5;
- (id)debugDescription;
- (void)perform;
@end

@implementation _EMRemoteInterfaceDistantObjectReattempt

+ (id)recordedAttemptWithOriginalInvocation:(id)a3 target:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithOriginalInvocation:v8 target:v9 error:v10];

  return v11;
}

- (_EMRemoteInterfaceDistantObjectReattempt)initWithOriginalInvocation:(id)a3 target:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_EMRemoteInterfaceDistantObjectReattempt;
  v12 = [(_EMRemoteInterfaceDistantObjectReattempt *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_invocation, a3);
    [(NSInvocation *)v13->_invocation setTarget:v10];
    [(NSInvocation *)v13->_invocation retainArguments];
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@: %p> invocation: %@\noriginal error: %@", objc_opt_class(), self, self->_invocation, self->_error];
}

- (void)perform
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = +[EMRemoteConnection log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    invocation = self->_invocation;
    v5 = NSStringFromSelector([(NSInvocation *)invocation selector]);
    v6 = [(NSInvocation *)self->_invocation target];
    int v7 = 138544130;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = invocation;
    __int16 v11 = 2114;
    v12 = v5;
    __int16 v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: reattempting invocation: %{public}@, selector: %{public}@, target: %p", (uint8_t *)&v7, 0x2Au);
  }
  [(NSInvocation *)self->_invocation invoke];
}

- (NSInvocation)invocation
{
  return (NSInvocation *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
}

@end