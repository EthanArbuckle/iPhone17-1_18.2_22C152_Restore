@interface IMSwizzledMethod
- (BOOL)isSwizzled;
- (BOOL)swizzleWithMethod:(id)a3;
- (BOOL)unswizzle;
- (Class)swizzledClass;
- (IMSwizzledMethod)initWithClass:(Class)a3 selector:(SEL)a4;
- (IMSwizzledMethod)swizzledWithMethod;
- (SEL)swizzledSelector;
- (const)typeEncoding;
- (id)description;
- (objc_method)method;
- (void)implementation;
- (void)setSwizzledWithMethod:(id)a3;
@end

@implementation IMSwizzledMethod

- (IMSwizzledMethod)initWithClass:(Class)a3 selector:(SEL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)IMSwizzledMethod;
  v6 = [(IMSwizzledMethod *)&v9 init];
  if (v6)
  {
    InstanceMethod = class_getInstanceMethod(a3, a4);
    v6->_method = InstanceMethod;
    v6->_implementation = method_getImplementation(InstanceMethod);
    v6->_typeEncoding = method_getTypeEncoding(v6->_method);
    objc_storeStrong((id *)&v6->_swizzledClass, a3);
    v6->_swizzledSelector = a4;
  }
  return v6;
}

- (BOOL)isSwizzled
{
  v2 = [(IMSwizzledMethod *)self swizzledWithMethod];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)swizzleWithMethod:(id)a3
{
  id v4 = a3;
  if ([(IMSwizzledMethod *)self isSwizzled])
  {
    v5 = IMLogHandleForCategory("IMSwizzledMethod");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1A09F10BC(self);
    }
  }
  else
  {
    if ([v4 isSwizzled])
    {
      v6 = IMLogHandleForCategory("IMSwizzledMethod");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1A09F1144(v4);
      }
    }
    else
    {
      if (!strcmp(-[IMSwizzledMethod typeEncoding](self, "typeEncoding"), (const char *)[v4 typeEncoding]))
      {
        method_setImplementation(-[IMSwizzledMethod method](self, "method"), (IMP)[v4 implementation]);
        [(IMSwizzledMethod *)self setSwizzledWithMethod:v4];
        [v4 setSwizzledWithMethod:self];
        BOOL v7 = 1;
        goto LABEL_13;
      }
      v6 = IMLogHandleForCategory("IMSwizzledMethod");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1A09F11CC(v6);
      }
    }
  }
  BOOL v7 = 0;
LABEL_13:

  return v7;
}

- (BOOL)unswizzle
{
  BOOL v3 = [(IMSwizzledMethod *)self isSwizzled];
  if (v3)
  {
    method_setImplementation([(IMSwizzledMethod *)self method], (IMP)[(IMSwizzledMethod *)self implementation]);
    id v4 = [(IMSwizzledMethod *)self swizzledWithMethod];
    [v4 setSwizzledWithMethod:0];

    [(IMSwizzledMethod *)self setSwizzledWithMethod:0];
  }
  else
  {
    v5 = IMLogHandleForCategory("IMSwizzledMethod");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1A09F1210(self);
    }
  }
  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = NSStringFromClass([(IMSwizzledMethod *)self swizzledClass]);
  v5 = NSStringFromSelector([(IMSwizzledMethod *)self swizzledSelector]);
  if ([(IMSwizzledMethod *)self isSwizzled]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  BOOL v7 = [(IMSwizzledMethod *)self swizzledWithMethod];
  if (v7)
  {
    v8 = [(IMSwizzledMethod *)self swizzledWithMethod];
    objc_super v9 = NSStringFromSelector((SEL)[v8 swizzledSelector]);
    v10 = [v3 stringWithFormat:@"<IMSwizzledMethod: swizzled class: %@, selector: %@, isSwizzled: %@, swizzled with method: %@>", v4, v5, v6, v9];
  }
  else
  {
    v10 = [v3 stringWithFormat:@"<IMSwizzledMethod: swizzled class: %@, selector: %@, isSwizzled: %@, swizzled with method: %@>", v4, v5, v6, @"NONE"];
  }

  return v10;
}

- (IMSwizzledMethod)swizzledWithMethod
{
  return self->_swizzledWithMethod;
}

- (void)setSwizzledWithMethod:(id)a3
{
}

- (objc_method)method
{
  return self->_method;
}

- (void)implementation
{
  return self->_implementation;
}

- (const)typeEncoding
{
  return self->_typeEncoding;
}

- (Class)swizzledClass
{
  return self->_swizzledClass;
}

- (SEL)swizzledSelector
{
  return self->_swizzledSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swizzledClass, 0);

  objc_storeStrong((id *)&self->_swizzledWithMethod, 0);
}

@end