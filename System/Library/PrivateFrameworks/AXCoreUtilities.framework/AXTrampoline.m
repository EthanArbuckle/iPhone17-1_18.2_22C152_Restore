@interface AXTrampoline
+ (id)methodNotFoundSentinal;
+ (id)trampolineWithCaller:(id)a3 targetClass:(Class)a4;
- (AXTrampoline)initWithCaller:(id)a3 targetClass:(Class)a4;
- (BOOL)callerIsClass;
- (BOOL)warnAboutUnknownSelectors;
- (Class)targetClass;
- (id)caller;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_findIMPForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setCaller:(id)a3;
- (void)setTargetClass:(Class)a3;
- (void)setWarnAboutUnknownSelectors:(BOOL)a3;
@end

@implementation AXTrampoline

+ (id)trampolineWithCaller:(id)a3 targetClass:(Class)a4
{
  id v5 = a3;
  v6 = [[AXTrampoline alloc] initWithCaller:v5 targetClass:a4];

  return v6;
}

+ (id)methodNotFoundSentinal
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AXTrampoline_methodNotFoundSentinal__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (methodNotFoundSentinal_onceToken != -1) {
    dispatch_once(&methodNotFoundSentinal_onceToken, block);
  }
  v2 = (void *)methodNotFoundSentinal__shared;
  return v2;
}

uint64_t __38__AXTrampoline_methodNotFoundSentinal__block_invoke(uint64_t a1)
{
  methodNotFoundSentinal__shared = [*(id *)(a1 + 32) methodSignatureForSelector:sel_methodDoesNotExistSentinal];
  return MEMORY[0x1F41817F8]();
}

- (AXTrampoline)initWithCaller:(id)a3 targetClass:(Class)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXTrampoline;
  v7 = [(AXTrampoline *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_caller, v6);
    objc_storeWeak((id *)&v8->_targetClass, a4);
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(AXTrampoline *)self caller];
  id v5 = [v3 stringWithFormat:@"AXTrampoline:<%p>. caller:%@ target:%@", self, v4, -[AXTrampoline targetClass](self, "targetClass")];

  return v5;
}

- (BOOL)callerIsClass
{
  id WeakRetained = objc_loadWeakRetained(&self->_caller);
  Class = object_getClass(WeakRetained);
  BOOL isMetaClass = class_isMetaClass(Class);

  return isMetaClass;
}

- (void)forwardInvocation:(id)a3
{
  id v12 = a3;
  v4 = [v12 methodSignature];
  id v5 = +[AXTrampoline methodNotFoundSentinal];

  if (v4 == v5)
  {
    if ([(AXTrampoline *)self warnAboutUnknownSelectors]) {
      _AXLogWithFacility(1, 0, 1, 0, 0, 0, 0, 0.0, 0, 1, @"No method signature to act on. Ignoring this invocation");
    }
  }
  else
  {
    id v6 = -[AXTrampoline _findIMPForSelector:](self, "_findIMPForSelector:", [v12 selector]);
    if (v6)
    {
      v7 = v6;
      v8 = [(AXTrampoline *)self caller];
      [v12 setTarget:v8];

      [v12 invokeUsingIMP:v7];
    }
    else if ([(AXTrampoline *)self warnAboutUnknownSelectors])
    {
      v9 = NSStringFromSelector((SEL)[v12 selector]);
      id WeakRetained = objc_loadWeakRetained(&self->_caller);
      id v11 = objc_loadWeakRetained((id *)&self->_targetClass);
      _AXLogWithFacility(1, 0, 1, 0, 0, 0, 0, 0.0, 0, 1, @"An IMP could not be found for the invocation with selector:%@. caller:%@ target:%@");
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5 = [(AXTrampoline *)self caller];
  id v6 = [v5 methodSignatureForSelector:a3];
  if (!v6)
  {
    if ([(AXTrampoline *)self warnAboutUnknownSelectors])
    {
      v8 = NSStringFromSelector(a3);
      _AXLogWithFacility(1, 0, 1, 0, 0, 0, 0, 0.0, 0, 1, @"A methodSignature could not be found for selector:%@, on caller:%@. You probably should not be trampolining this method");
    }
    id v6 = +[AXTrampoline methodNotFoundSentinal];
  }

  return v6;
}

- (void)_findIMPForSelector:(SEL)a3
{
  unsigned int outCount = 0;
  id v5 = [(AXTrampoline *)self targetClass];
  BOOL v6 = [(AXTrampoline *)self callerIsClass];
  Class = v5;
  if (v6) {
    Class = object_getClass(v5);
  }
  v8 = class_copyMethodList(Class, &outCount);
  if (v8)
  {
    v9 = v8;
    if (outCount)
    {
      uint64_t v10 = 0;
      while (method_getName(v9[v10]) != a3)
      {
        if (++v10 >= (unint64_t)outCount) {
          goto LABEL_8;
        }
      }
      IMP Implementation = method_getImplementation(v9[v10]);
    }
    else
    {
LABEL_8:
      IMP Implementation = 0;
    }
    free(v9);
  }
  else
  {
    IMP Implementation = 0;
  }

  return Implementation;
}

- (id)caller
{
  id WeakRetained = objc_loadWeakRetained(&self->_caller);
  return WeakRetained;
}

- (void)setCaller:(id)a3
{
}

- (Class)targetClass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetClass);
  return (Class)WeakRetained;
}

- (void)setTargetClass:(Class)a3
{
}

- (BOOL)warnAboutUnknownSelectors
{
  return self->_warnAboutUnknownSelectors;
}

- (void)setWarnAboutUnknownSelectors:(BOOL)a3
{
  self->_warnAboutUnknownSelectors = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetClass);
  objc_destroyWeak(&self->_caller);
}

@end