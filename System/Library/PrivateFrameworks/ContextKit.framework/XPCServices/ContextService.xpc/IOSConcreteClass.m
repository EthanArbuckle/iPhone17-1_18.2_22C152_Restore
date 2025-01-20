@interface IOSConcreteClass
- (BOOL)isAnonymousClass;
- (BOOL)isAssignableFrom:(id)a3;
- (BOOL)isEnum;
- (BOOL)isInstance:(id)a3;
- (Class)objcClass;
- (IOSConcreteClass)initWithClass:(Class)a3;
- (id)findConstructorWithTranslatedName:(id)a3;
- (id)findMethodWithTranslatedName:(id)a3 checkSupertypes:(BOOL)a4;
- (id)getConstructor:(id)a3;
- (id)getConstructors;
- (id)getDeclaredConstructor:(id)a3;
- (id)getDeclaredConstructors;
- (id)getInterfacesInternal;
- (id)getName;
- (id)getSimpleName;
- (id)getSuperclass;
- (id)newInstance;
- (id)objcName;
- (void)collectMethods:(id)a3 publicOnly:(BOOL)a4;
- (void)dealloc;
@end

@implementation IOSConcreteClass

- (IOSConcreteClass)initWithClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IOSConcreteClass;
  result = [(IOSConcreteClass *)&v5 init];
  if (result) {
    result->class_ = a3;
  }
  return result;
}

- (id)newInstance
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || [(objc_class *)self->class_ isMemberOfClass:objc_opt_class()])
  {
    objc_exception_throw(objc_alloc_init(JavaLangInstantiationException));
  }
  id v3 = objc_alloc_init(self->class_);
  return v3;
}

- (id)getSuperclass
{
  id result = [(objc_class *)self->class_ superclass];
  if (result)
  {
    return (id)IOSClass_fromClass((uint64_t)result);
  }
  return result;
}

- (BOOL)isInstance:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)getName
{
  id v3 = [(IOSClass *)self getMetadata];
  if (v3)
  {
    return [v3 qualifiedName];
  }
  else
  {
    v4 = self->class_;
    return NSStringFromClass(v4);
  }
}

- (id)getSimpleName
{
  id v3 = [(IOSClass *)self getMetadata];
  if (v3)
  {
    return [v3 typeName];
  }
  else
  {
    objc_super v5 = self->class_;
    return NSStringFromClass(v5);
  }
}

- (id)objcName
{
  return NSStringFromClass(self->class_);
}

- (BOOL)isAssignableFrom:(id)a3
{
  Class v5 = self->class_;
  if (v5 == (Class)objc_opt_class()) {
    return [a3 isPrimitive] ^ 1;
  }
  id v6 = [a3 objcClass];
  Class v7 = self->class_;
  return [v6 isSubclassOfClass:v7];
}

- (BOOL)isEnum
{
  id v3 = [(IOSClass *)self getMetadata];
  if (v3)
  {
    if (([v3 modifiers] & 0x4000) != 0)
    {
      id v6 = [(IOSConcreteClass *)self getSuperclass];
      LOBYTE(v4) = v6 == (id)JavaLangEnum_class_();
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    v4 = self->class_;
    if (v4)
    {
      Class v5 = NSStringFromClass(v4);
      LOBYTE(v4) = [(NSString *)v5 hasSuffix:@"Enum"];
    }
  }
  return (char)v4;
}

- (BOOL)isAnonymousClass
{
  id v2 = [(IOSClass *)self getMetadata];
  if (v2) {
    LOBYTE(v2) = (__int16)[v2 modifiers] < 0;
  }
  return (char)v2;
}

- (void)collectMethods:(id)a3 publicOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C6804;
  v7[3] = &unk_100422F68;
  v7[4] = [(IOSClass *)self getMetadata];
  v7[5] = self;
  sub_1001C674C((uint64_t)self, a3, v4, (uint64_t)v7);
}

- (id)getDeclaredConstructors
{
  return getConstructorsImpl(self, 0);
}

- (id)getConstructors
{
  return getConstructorsImpl(self, 1);
}

- (id)findMethodWithTranslatedName:(id)a3 checkSupertypes:(BOOL)a4
{
  id v6 = (const char *)[a3 UTF8String];
  Method InstanceMethod = JreFindInstanceMethod(self->class_, v6);
  ClassMethod = InstanceMethod;
  if (!InstanceMethod)
  {
    ClassMethod = JreFindClassMethod(self->class_, v6);
    if (!ClassMethod) {
      return 0;
    }
  }
  Description = method_getDescription(ClassMethod);
  v10 = JreSignatureOrNull((uint64_t)Description);
  if (!v10) {
    return 0;
  }
  v11 = v10;
  id v12 = [(IOSClass *)self getMetadata];
  SEL Name = method_getName(ClassMethod);
  id v14 = [v12 findMethodMetadata:a3];
  return +[JavaLangReflectMethod methodWithMethodSignature:v11 selector:Name class:self isStatic:InstanceMethod == 0 metadata:v14];
}

- (id)getConstructor:(id)a3
{
  TranslatedMethodSEL Name = IOSClass_GetTranslatedMethodName(0, @"init", (uint64_t)a3);
  id v5 = sub_1001C6BD0(&self->super.super.isa, TranslatedMethodName);
  if (([v5 getModifiers] & 1) == 0) {
    objc_exception_throw(objc_alloc_init(JavaLangNoSuchMethodException));
  }
  return v5;
}

- (id)getDeclaredConstructor:(id)a3
{
  TranslatedMethodSEL Name = IOSClass_GetTranslatedMethodName(0, @"init", (uint64_t)a3);
  return sub_1001C6BD0(&self->super.super.isa, TranslatedMethodName);
}

- (id)findConstructorWithTranslatedName:(id)a3
{
  return sub_1001C6BD0(&self->super.super.isa, a3);
}

- (id)getInterfacesInternal
{
  id explicit = (id)atomic_load_explicit((atomic_ullong *volatile)&self->interfaces_, memory_order_acquire);
  if (!explicit)
  {
    objc_sync_enter(self);
    id explicit = self->interfaces_;
    if (!explicit)
    {
      unsigned int outCount = 0;
      BOOL v4 = class_copyProtocolList(self->class_, &outCount);
      id explicit = IOSClass_NewInterfacesFromProtocolList((__objc2_prot **)v4);
      atomic_store((unint64_t)explicit, (unint64_t *)&self->interfaces_);
      free(v4);
    }
    objc_sync_exit(self);
  }
  return explicit;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IOSConcreteClass;
  [(IOSConcreteClass *)&v3 dealloc];
}

- (Class)objcClass
{
  return self->class_;
}

@end