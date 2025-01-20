@interface IMFeatureFlagsTestSwizzler
- (BOOL)isEnabled;
- (BOOL)isSwizzled;
- (IMFeatureFlagsTestSwizzler)initWithFeature:(SEL)a3 enabled:(BOOL)a4;
- (IMSwizzledMethod)originalMethod;
- (IMSwizzledMethod)replacementMethod;
- (SEL)feature;
- (SEL)testMethod;
- (void)dealloc;
- (void)swizzle;
- (void)unswizzle;
@end

@implementation IMFeatureFlagsTestSwizzler

- (IMFeatureFlagsTestSwizzler)initWithFeature:(SEL)a3 enabled:(BOOL)a4
{
  v34.receiver = self;
  v34.super_class = (Class)IMFeatureFlagsTestSwizzler;
  v6 = [(IMFeatureFlagsTestSwizzler *)&v34 init];
  if (!v6) {
    return v6;
  }
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    v30 = (void *)MEMORY[0x1E4F1CA00];
    v31 = @"IMFeatureFlagsNotRunningUnitTests";
    v32 = @"Swizzling for testing is not permitted outside of testing.";
    goto LABEL_24;
  }
  v6->_BOOL enabled = a4;
  if (a3) {
    SEL v7 = a3;
  }
  else {
    SEL v7 = 0;
  }
  v6->_feature = v7;
  v8 = [[IMSwizzledMethod alloc] initWithClass:objc_opt_class() selector:a3];
  originalMethod = v6->_originalMethod;
  v6->_originalMethod = v8;

  BOOL enabled = v6->_enabled;
  p_testMethod = &v6->_testMethod;
  v12 = NSString;
  uint64_t v13 = NSStringFromSelector(a3);
  v14 = (void *)v13;
  if (enabled)
  {
    v15 = [v12 stringWithFormat:@"%@_SwizzledOnForTests", v13];
    SEL v16 = NSSelectorFromString(v15);
    v17 = sub_1A07A87FC;
  }
  else
  {
    v15 = [v12 stringWithFormat:@"%@_SwizzledOffForTests", v13];
    SEL v16 = NSSelectorFromString(v15);
    v17 = sub_1A07A8804;
  }
  v18 = (void (*)(void))v17;
  if (v16) {
    SEL v19 = v16;
  }
  else {
    SEL v19 = 0;
  }
  SEL *p_testMethod = v19;

  v20 = +[IMFeatureFlags sharedFeatureFlags];
  char v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) == 0)
  {
    v22 = (objc_class *)objc_opt_class();
    v23 = *p_testMethod ? *p_testMethod : 0;
    if (!class_addMethod(v22, v23, v18, [(IMSwizzledMethod *)v6->_originalMethod typeEncoding]))
    {
      v30 = (void *)MEMORY[0x1E4F1CA00];
      v31 = @"IMFeatureFlagsCreatingTestMethodFailed";
      v32 = @"Creating test method failed";
LABEL_24:
      id v33 = [v30 exceptionWithName:v31 reason:v32 userInfo:0];
      objc_exception_throw(v33);
    }
  }
  v24 = [IMSwizzledMethod alloc];
  uint64_t v25 = objc_opt_class();
  if (*p_testMethod) {
    SEL v26 = *p_testMethod;
  }
  else {
    SEL v26 = 0;
  }
  uint64_t v27 = [(IMSwizzledMethod *)v24 initWithClass:v25 selector:v26];
  replacementMethod = v6->_replacementMethod;
  v6->_replacementMethod = (IMSwizzledMethod *)v27;

  return v6;
}

- (BOOL)isSwizzled
{
  return [(IMSwizzledMethod *)self->_originalMethod isSwizzled];
}

- (void)swizzle
{
  if ([(IMFeatureFlagsTestSwizzler *)self isSwizzled])
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    v4 = @"IMFeatureFlagTestSwizzerSwizzlingFailedAlreadySwizzling";
    v5 = @"Already swizzing a test";
    goto LABEL_8;
  }
  if (![(IMSwizzledMethod *)self->_originalMethod swizzleWithMethod:self->_replacementMethod])
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    v4 = @"IMFeatureFlagTestSwizzerFailed";
    v5 = @"Failed to swizzle test method";
LABEL_8:
    id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];
    objc_exception_throw(v6);
  }
  id v7 = [(IMSwizzledMethod *)self->_originalMethod description];
  NSLog(&cfstr_Imfeatureflags_1.isa, v7);
}

- (void)unswizzle
{
  if (![(IMFeatureFlagsTestSwizzler *)self isSwizzled])
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    v4 = @"IMFeatureFlagTestSwizzerUnswizzlingFailedNotSwizzling";
    v5 = @"Not swizzling a test";
    goto LABEL_8;
  }
  if (![(IMSwizzledMethod *)self->_originalMethod unswizzle])
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    v4 = @"IMFeatureFlagTestSwizzerFailed";
    v5 = @"Failed to unswizzle test method";
LABEL_8:
    id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];
    objc_exception_throw(v6);
  }
  id v7 = [(IMSwizzledMethod *)self->_originalMethod description];
  NSLog(&cfstr_Imfeatureflags_2.isa, v7);
}

- (void)dealloc
{
  if ([(IMFeatureFlagsTestSwizzler *)self isSwizzled]) {
    [(IMFeatureFlagsTestSwizzler *)self unswizzle];
  }
  v3.receiver = self;
  v3.super_class = (Class)IMFeatureFlagsTestSwizzler;
  [(IMFeatureFlagsTestSwizzler *)&v3 dealloc];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SEL)feature
{
  if (self->_feature) {
    return self->_feature;
  }
  else {
    return 0;
  }
}

- (IMSwizzledMethod)originalMethod
{
  return self->_originalMethod;
}

- (IMSwizzledMethod)replacementMethod
{
  return self->_replacementMethod;
}

- (SEL)testMethod
{
  if (self->_testMethod) {
    return self->_testMethod;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementMethod, 0);

  objc_storeStrong((id *)&self->_originalMethod, 0);
}

@end