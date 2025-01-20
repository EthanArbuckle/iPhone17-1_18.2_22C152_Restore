@interface IOSProtocolClass
- (BOOL)isAssignableFrom:(id)a3;
- (BOOL)isInstance:(id)a3;
- (BOOL)isInterface;
- (Class)objcClass;
- (IOSProtocolClass)initWithProtocol:(id)a3;
- (id)description;
- (id)findMethodWithTranslatedName:(id)a3 checkSupertypes:(BOOL)a4;
- (id)getInterfacesInternal;
- (id)getName;
- (id)getSimpleName;
- (id)objcName;
- (id)objcProtocol;
- (int)getModifiers;
- (void)collectMethods:(id)a3 publicOnly:(BOOL)a4;
- (void)dealloc;
@end

@implementation IOSProtocolClass

- (IOSProtocolClass)initWithProtocol:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IOSProtocolClass;
  v4 = [(IOSProtocolClass *)&v6 init];
  if (v4) {
    v4->protocol_ = (Protocol *)a3;
  }
  return v4;
}

- (BOOL)isInstance:(id)a3
{
  id v4 = [a3 getClass];
  return sub_10029A39C(v4, self);
}

- (id)description
{
  return +[NSString stringWithFormat:@"interface %@", [(IOSProtocolClass *)self getName]];
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
    protocol = self->protocol_;
    return NSStringFromProtocol(protocol);
  }
}

- (id)getSimpleName
{
  id v3 = [(IOSClass *)self getMetadata];
  if (v3)
  {
    id v4 = [v3 typeName];
    return v4;
  }
  else
  {
    protocol = self->protocol_;
    return NSStringFromProtocol(protocol);
  }
}

- (id)objcName
{
  return NSStringFromProtocol(self->protocol_);
}

- (Class)objcClass
{
  Name = protocol_getName(self->protocol_);
  return objc_lookUpClass(Name);
}

- (int)getModifiers
{
  id v2 = [(IOSClass *)self getMetadata];
  if (!v2) {
    return 1545;
  }
  unsigned int v3 = [v2 modifiers];
  return (JavaLangReflectModifier_interfaceModifiers() | 0x200) & v3;
}

- (BOOL)isAssignableFrom:(id)a3
{
  return sub_10029A39C(a3, self);
}

- (BOOL)isInterface
{
  return 1;
}

- (void)collectMethods:(id)a3 publicOnly:(BOOL)a4
{
  id v6 = [(IOSClass *)self getMetadata];
  unsigned int outCount = 0;
  v7 = protocol_copyMethodDescriptionList(self->protocol_, 1, 1, &outCount);
  v8 = v7;
  if (outCount)
  {
    unint64_t v9 = 0;
    p_name = &v7->name;
    do
    {
      SEL v11 = *p_name;
      v12 = NSStringFromSelector(*p_name);
      if (![a3 objectForKey:v12])
      {
        id v13 = [v6 findMethodMetadata:v12];
        id v14 = v13;
        if (!v6 || v13)
        {
          v15 = JreSignatureOrNull((uint64_t)p_name);
          if (v15) {
            objc_msgSend(a3, "setObject:forKey:", +[JavaLangReflectMethod methodWithMethodSignature:selector:class:isStatic:metadata:](JavaLangReflectMethod, "methodWithMethodSignature:selector:class:isStatic:metadata:", v15, v11, self, 0, v14), v12);
          }
        }
      }
      ++v9;
      p_name += 2;
    }
    while (v9 < outCount);
  }
  free(v8);
}

- (id)findMethodWithTranslatedName:(id)a3 checkSupertypes:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int outCount = 0;
  v7 = protocol_copyMethodDescriptionList(self->protocol_, 1, 1, &outCount);
  v8 = v7;
  if (!outCount) {
    goto LABEL_9;
  }
  unint64_t v9 = 0;
  p_name = &v7->name;
  while (1)
  {
    SEL v11 = *p_name;
    if ([a3 isEqualToString:NSStringFromSelector(*p_name)]) {
      break;
    }
    ++v9;
    p_name += 2;
    if (v9 >= outCount) {
      goto LABEL_9;
    }
  }
  v12 = JreSignatureOrNull((uint64_t)p_name);
  if (v12)
  {
    id v13 = +[JavaLangReflectMethod methodWithMethodSignature:selector:class:isStatic:metadata:](JavaLangReflectMethod, "methodWithMethodSignature:selector:class:isStatic:metadata:", v12, v11, self, 0, objc_msgSend(-[IOSClass getMetadata](self, "getMetadata"), "findMethodMetadata:", a3));
    free(v8);
    if (v13) {
      return v13;
    }
  }
  else
  {
LABEL_9:
    free(v8);
  }
  Name = protocol_getName(self->protocol_);
  Class Class = objc_getClass(Name);
  if (Class && (ClassMethod = JreFindClassMethod(Class, (const char *)[a3 UTF8String])) != 0)
  {
    v17 = ClassMethod;
    Description = method_getDescription(ClassMethod);
    id v13 = (JavaLangReflectMethod *)JreSignatureOrNull((uint64_t)Description);
    if (v13) {
      id v13 = +[JavaLangReflectMethod methodWithMethodSignature:selector:class:isStatic:metadata:](JavaLangReflectMethod, "methodWithMethodSignature:selector:class:isStatic:metadata:", v13, method_getName(v17), self, 1, objc_msgSend(-[IOSClass getMetadata](self, "getMetadata"), "findMethodMetadata:", a3));
    }
  }
  else
  {
    id v13 = 0;
  }
  if (!v13 && v4)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = [(IOSProtocolClass *)self getInterfacesInternal];
    id v20 = [v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(IOSProtocolClass **)(*((void *)&v27 + 1) + 8 * i);
          if (v24 != self)
          {
            id v25 = [(IOSProtocolClass *)v24 findMethodWithTranslatedName:a3 checkSupertypes:1];
            if (v25) {
              return v25;
            }
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
        id v13 = 0;
        if (v21) {
          continue;
        }
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v13;
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
      BOOL v4 = protocol_copyProtocolList(self->protocol_, &outCount);
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
  v3.super_class = (Class)IOSProtocolClass;
  [(IOSProtocolClass *)&v3 dealloc];
}

- (id)objcProtocol
{
  return self->protocol_;
}

@end