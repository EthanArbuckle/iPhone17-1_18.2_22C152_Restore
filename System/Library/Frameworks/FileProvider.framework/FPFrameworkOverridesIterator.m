@interface FPFrameworkOverridesIterator
+ (id)allOverrides;
+ (id)newIteratorForURL:(__CFURL *)a3 withNotFoundHandler:(id)a4;
+ (id)newIteratorWithNotFoundHandler:(id)a3;
+ (void)addOverride:(id)a3;
+ (void)removeOverride:(id)a3;
- (FPFrameworkOverridesIterator)initWithOverrides:(id)a3 noSuitableModuleFoundHandler:(id)a4;
- (FPFrameworkOverridesIterator)initWithOverrides:(id)a3 url:(__CFURL *)a4 noSuitableModuleFoundHandler:(id)a5;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)callNextOverrides;
- (void)finish;
- (void)forwardInvocation:(id)a3;
@end

@implementation FPFrameworkOverridesIterator

+ (id)allOverrides
{
  v2 = cachedFrameworkOverridingObjects();
  v3 = (void *)[v2 copy];

  return v3;
}

+ (id)newIteratorWithNotFoundHandler:(id)a3
{
  return (id)[a1 newIteratorForURL:0 withNotFoundHandler:a3];
}

+ (id)newIteratorForURL:(__CFURL *)a3 withNotFoundHandler:(id)a4
{
  id v5 = a4;
  v6 = [FPFrameworkOverridesIterator alloc];
  v7 = cachedFrameworkOverridingObjects();
  v8 = [(FPFrameworkOverridesIterator *)v6 initWithOverrides:v7 url:a3 noSuitableModuleFoundHandler:v5];

  return v8;
}

- (FPFrameworkOverridesIterator)initWithOverrides:(id)a3 url:(__CFURL *)a4 noSuitableModuleFoundHandler:(id)a5
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_overrides, a3);
  id v10 = a5;
  v11 = (void *)MEMORY[0x1A6248B00]();

  id noSuitableModuleFoundHandler = self->_noSuitableModuleFoundHandler;
  self->_id noSuitableModuleFoundHandler = v11;

  if (a4)
  {
    self->_checkURL = 1;
    unsigned __int8 v13 = FPURLMightBeInFileProvider(a4);
  }
  else
  {
    unsigned __int8 v13 = 0;
    self->_checkURL = 0;
  }
  self->_mightBeFPURL = v13;

  return self;
}

- (FPFrameworkOverridesIterator)initWithOverrides:(id)a3 noSuitableModuleFoundHandler:(id)a4
{
  return [(FPFrameworkOverridesIterator *)self initWithOverrides:a3 url:0 noSuitableModuleFoundHandler:a4];
}

- (void)callNextOverrides
{
  if (!self->_invocation)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"FPFrameworkOverridesIterator.m" lineNumber:234 description:@"Object misuses: you can only call -callNextOverrides after you have invoked the method once"];
  }
  unint64_t currentIndex = self->_currentIndex;
  if (currentIndex >= [(NSArray *)self->_overrides count])
  {
LABEL_8:
    id noSuitableModuleFoundHandler = (void (**)(void))self->_noSuitableModuleFoundHandler;
    if (noSuitableModuleFoundHandler)
    {
      noSuitableModuleFoundHandler[2]();
      id v8 = self->_noSuitableModuleFoundHandler;
    }
    else
    {
      id v8 = 0;
    }
    self->_id noSuitableModuleFoundHandler = 0;

    invocation = self->_invocation;
    self->_invocation = 0;
  }
  else
  {
    while (1)
    {
      v11 = [(NSArray *)self->_overrides objectAtIndexedSubscript:self->_currentIndex];
      ++self->_currentIndex;
      [(NSInvocation *)self->_invocation selector];
      if ((objc_opt_respondsToSelector() & 1) != 0 && (!self->_checkURL || self->_mightBeFPURL)) {
        break;
      }

      unint64_t v6 = self->_currentIndex;
      if (v6 >= [(NSArray *)self->_overrides count]) {
        goto LABEL_8;
      }
    }
    id v9 = [(NSInvocation *)self->_invocation fp_copy];
    [v9 invokeWithTarget:v11];

    invocation = v11;
  }
}

- (void)finish
{
  self->_invocation = 0;
  MEMORY[0x1F41817F8]();
}

+ (void)addOverride:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = cachedFrameworkOverridingObjects();
    id v5 = (void *)[(id)frameworkOverridingObjects mutableCopy];
    [v5 insertObject:v3 atIndex:0];

    unint64_t v6 = (void *)frameworkOverridingObjects;
    frameworkOverridingObjects = (uint64_t)v5;
  }
}

+ (void)removeOverride:(id)a3
{
  if (a3)
  {
    id v3 = (void *)frameworkOverridingObjects;
    id v4 = a3;
    id v5 = (void *)[v3 mutableCopy];
    [v5 removeObject:v4];

    unint64_t v6 = (void *)frameworkOverridingObjects;
    frameworkOverridingObjects = (uint64_t)v5;
  }
}

- (void)forwardInvocation:(id)a3
{
  p_invocation = &self->_invocation;
  objc_storeStrong((id *)&self->_invocation, a3);
  id v6 = a3;
  [(NSInvocation *)*p_invocation retainArguments];

  [(FPFrameworkOverridesIterator *)self callNextOverrides];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1EF6EE120, a3, 0, 1);
  if (MethodDescription == 0uLL)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodDescription.types];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocation, 0);
  objc_storeStrong(&self->_noSuitableModuleFoundHandler, 0);

  objc_storeStrong((id *)&self->_overrides, 0);
}

@end