@interface ExecutableMember
- (BOOL)isBridge;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSynthetic;
- (BOOL)isVarArgs;
- (ExecutableMember)initWithMethodSignature:(id)a3 selector:(SEL)a4 class:(id)a5 metadata:(id)a6;
- (NSMethodSignature)signature;
- (const)getBinaryParameterTypes;
- (id)getDeclaredAnnotations;
- (id)getDeclaringClass;
- (id)getExceptionTypes;
- (id)getGenericExceptionTypes;
- (id)getGenericParameterTypes;
- (id)getName;
- (id)getParameterAnnotations;
- (id)getParameterTypes;
- (id)getTypeParameters;
- (id)internalName;
- (id)metadata;
- (id)toGenericString;
- (int)getModifiers;
- (int)getNumParams;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation ExecutableMember

- (ExecutableMember)initWithMethodSignature:(id)a3 selector:(SEL)a4 class:(id)a5 metadata:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)ExecutableMember;
  v10 = [(JavaLangReflectAccessibleObject *)&v13 init];
  if (v10)
  {
    v10->methodSignature_ = (NSMethodSignature *)a3;
    if (a4) {
      SEL v11 = a4;
    }
    else {
      SEL v11 = 0;
    }
    v10->selector_ = v11;
    v10->class_ = (IOSClass *)a5;
    v10->metadata_ = (JavaMethodMetadata *)a6;
  }
  return v10;
}

- (id)getName
{
  return 0;
}

- (int)getModifiers
{
  metadata = self->metadata_;
  if (metadata) {
    return [(JavaMethodMetadata *)metadata modifiers];
  }
  else {
    return 1;
  }
}

- (int)getNumParams
{
  return [(NSMethodSignature *)self->methodSignature_ numberOfArguments] - 2;
}

- (id)getParameterTypes
{
  int v3 = [(ExecutableMember *)self getNumParams];
  v4 = +[IOSObjectArray arrayWithLength:v3 type:IOSClass_class_()];
  if (self->selector_) {
    selector = self->selector_;
  }
  else {
    selector = 0;
  }
  v6 = NSStringFromSelector(selector);
  if ([(NSString *)v6 hasPrefix:@"init"])
  {
    v7 = [[(NSString *)v6 substringFromIndex:4] componentsSeparatedByString:@":"];
    if (v3 < 1) {
      return v4;
    }
    goto LABEL_12;
  }
  if (v3 > 0)
  {
    id v8 = [(NSString *)v6 rangeOfString:@":"];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = [(NSString *)v6 rangeOfString:@"With", 4, 0, v8 options range];
      if (v9 != (id)0x7FFFFFFFFFFFFFFFLL) {
        v6 = [(NSString *)v6 substringFromIndex:v9];
      }
    }
    v7 = [(NSString *)v6 componentsSeparatedByString:@":"];
LABEL_12:
    v10 = v7;
    uint64_t v11 = 0;
    uint64_t v12 = 0x200000000;
    while (1)
    {
      objc_super v13 = [(NSMethodSignature *)self->methodSignature_ getArgumentTypeAtIndex:v12 >> 32];
      id v14 = [(NSArray *)v10 objectAtIndex:v11];
      if (([v14 hasPrefix:@"with"] & 1) == 0
        && ([v14 hasPrefix:@"With"] & 1) == 0)
      {
        break;
      }
      id v15 = [v14 substringFromIndex:4];
      v16 = v15;
      if (*v13 == 64)
      {
        if ([v15 hasSuffix:@"Array"])
        {
          id v17 = objc_msgSend(v16, "substringToIndex:", (char *)objc_msgSend(v16, "length") - 5);
          id v18 = sub_10028CD6C(v17);
          if (!v18)
          {
            id v18 = +[IOSClass classForIosName:v17];
            if (!v18)
            {
LABEL_24:
              uint64_t v20 = NSObject_class_();
              goto LABEL_25;
            }
          }
          id v19 = (id)IOSClass_arrayOf((uint64_t)v18);
        }
        else
        {
          id v19 = +[IOSClass classForIosName:v16];
        }
      }
      else
      {
        id v19 = sub_10028CD6C(v15);
      }
      id v21 = v19;
      if (!v19) {
        goto LABEL_24;
      }
LABEL_26:
      [(IOSObjectArray *)v4 replaceObjectAtIndex:v11++ withObject:v21];
      v12 += (uint64_t)&_mh_execute_header;
      if (v3 == v11) {
        return v4;
      }
    }
    uint64_t v20 = (uint64_t)decodeTypeEncoding(v13);
LABEL_25:
    id v21 = (id)v20;
    goto LABEL_26;
  }
  [(NSString *)v6 componentsSeparatedByString:@":"];
  return v4;
}

- (const)getBinaryParameterTypes
{
  binaryParameterTypes = self->binaryParameterTypes_;
  if (!binaryParameterTypes)
  {
    id v4 = [(ExecutableMember *)self getParameterTypes];
    int v5 = [v4 length];
    binaryParameterTypes = (const char *)malloc_type_malloc(v5 + 1, 0x100004077774924uLL);
    v6 = binaryParameterTypes;
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
        binaryParameterTypes[i] = *(unsigned char *)objc_msgSend(objc_msgSend(objc_msgSend(v4, "objectAtIndex:", i), "binaryName"), "UTF8String");
      v6 = &binaryParameterTypes[i];
    }
    const char *v6 = 0;
    self->binaryParameterTypes_ = binaryParameterTypes;
  }
  return binaryParameterTypes;
}

- (id)getDeclaringClass
{
  return self->class_;
}

- (id)getTypeParameters
{
  id result = (id)*((void *)sub_10028C398(self) + 4);
  if (*((_DWORD *)result + 2))
  {
    return [result clone];
  }
  return result;
}

- (id)getGenericParameterTypes
{
  v2 = (void *)*((void *)sub_10028C398(self) + 2);
  return LibcoreReflectTypes_getTypeArray_clone_(v2, 0);
}

- (id)getGenericExceptionTypes
{
  v2 = (void *)*((void *)sub_10028C398(self) + 1);
  return LibcoreReflectTypes_getTypeArray_clone_(v2, 0);
}

- (BOOL)isSynthetic
{
  metadata = self->metadata_;
  if (metadata) {
    LODWORD(metadata) = ([(JavaMethodMetadata *)metadata modifiers] >> 12) & 1;
  }
  return (char)metadata;
}

- (id)getExceptionTypes
{
  id result = [(JavaMethodMetadata *)self->metadata_ exceptionTypes];
  if (!result)
  {
    uint64_t v3 = IOSClass_class_();
    return +[IOSObjectArray arrayWithLength:0 type:v3];
  }
  return result;
}

- (id)internalName
{
  selector = self->selector_;
  if (selector) {
    return NSStringFromSelector(selector);
  }
  else {
    return NSStringFromSelector(0);
  }
}

- (id)getDeclaredAnnotations
{
  uint64_t v3 = [(IOSClass *)self->class_ objcClass];
  if (v3
    && JreFindClassMethod(v3, -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__annotations_%@", objc_msgSend(-[ExecutableMember internalName](self, "internalName"), "stringByReplacingOccurrencesOfString:withString:", @":", @"_")), "UTF8String")))
  {
    method_invoke();
  }
  else
  {
    uint64_t v5 = JavaLangAnnotationAnnotation_class_();
    return +[IOSObjectArray arrayWithLength:0 type:v5];
  }
  return result;
}

- (id)getParameterAnnotations
{
  uint64_t v3 = [(IOSClass *)self->class_ objcClass];
  if (v3
    && JreFindClassMethod(v3, -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__annotations_%@_params", objc_msgSend(-[ExecutableMember internalName](self, "internalName"), "stringByReplacingOccurrencesOfString:withString:", @":", @"_")), "UTF8String")))
  {
    method_invoke();
  }
  else
  {
    v5[0] = [(NSMethodSignature *)self->methodSignature_ numberOfArguments] - 2;
    v5[1] = 0;
    return +[IOSObjectArray arrayWithDimensions:2 lengths:v5 type:JavaLangAnnotationAnnotation_class_()];
  }
  return result;
}

- (id)toGenericString
{
  uint64_t v3 = [[JavaLangStringBuilder alloc] initWithInt:80];
  id v4 = sub_10028C398(self);
  unsigned int v5 = [(ExecutableMember *)self getModifiers];
  if (v5) {
    objc_msgSend(-[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", JavaLangReflectModifier_toStringWithInt_(v5 & 0xFF7F)), "appendWithChar:", 32);
  }
  if (v4)
  {
    uint64_t v6 = *((void *)v4 + 4);
    if (v6)
    {
      if (*(int *)(v6 + 8) >= 1)
      {
        [(JavaLangStringBuilder *)v3 appendWithChar:60];
        uint64_t v7 = *((void *)v4 + 4);
        if (*(int *)(v7 + 8) >= 1)
        {
          uint64_t v8 = 0;
          do
          {
            LibcoreReflectTypes_appendGenericType_type_(v3, *(void **)(v7 + 24 + 8 * v8));
            uint64_t v7 = *((void *)v4 + 4);
            int v9 = *(_DWORD *)(v7 + 8);
            if (v8 < v9 - 1)
            {
              [(JavaLangStringBuilder *)v3 appendWithNSString:@","];
              uint64_t v7 = *((void *)v4 + 4);
              int v9 = *(_DWORD *)(v7 + 8);
            }
            ++v8;
          }
          while (v8 < v9);
        }
        [(JavaLangStringBuilder *)v3 appendWithNSString:@"> "];
      }
    }
  }
  id v10 = [(ExecutableMember *)self getDeclaringClass];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LibcoreReflectTypes_appendTypeName_class_(v3, v10);
  }
  else
  {
    if (v4)
    {
      id Type = LibcoreReflectTypes_getType_(*((void **)v4 + 3));
      LibcoreReflectTypes_appendGenericType_type_(v3, Type);
    }
    [(JavaLangStringBuilder *)v3 appendWithChar:32];
    LibcoreReflectTypes_appendTypeName_class_(v3, v10);
    objc_msgSend(-[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", @"."), "appendWithNSString:", -[ExecutableMember getName](self, "getName"));
  }
  [(JavaLangStringBuilder *)v3 appendWithChar:40];
  if (v4)
  {
    LibcoreReflectTypes_appendArrayGenericType_types_(v3, (uint64_t)[*((id *)v4 + 2) getResolvedTypes]);
    [(JavaLangStringBuilder *)v3 appendWithChar:41];
    TypeArray_clone = (int *)LibcoreReflectTypes_getTypeArray_clone_(*((void **)v4 + 1), 0);
    if (TypeArray_clone[2] >= 1)
    {
      uint64_t v13 = (uint64_t)TypeArray_clone;
      [(JavaLangStringBuilder *)v3 appendWithNSString:@" throws "];
      LibcoreReflectTypes_appendArrayGenericType_types_(v3, v13);
    }
  }
  else
  {
    [(JavaLangStringBuilder *)v3 appendWithChar:41];
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (BOOL)isVarArgs
{
  metadata = self->metadata_;
  if (metadata) {
    LODWORD(metadata) = ([(JavaMethodMetadata *)metadata modifiers] >> 7) & 1;
  }
  return (char)metadata;
}

- (BOOL)isBridge
{
  return 0;
}

- (NSMethodSignature)signature
{
  return self->methodSignature_;
}

- (id)metadata
{
  return self->metadata_;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->class_ != (IOSClass *)*((void *)a3 + 2)) {
    return 0;
  }
  if (self->selector_) {
    selector = self->selector_;
  }
  else {
    selector = 0;
  }
  if (*((void *)a3 + 3)) {
    uint64_t v7 = (const char *)*((void *)a3 + 3);
  }
  else {
    uint64_t v7 = 0;
  }
  return sel_isEqual(selector, v7);
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)objc_msgSend(-[IOSClass getName](self->class_, "getName"), "hash");
  if (self->selector_) {
    selector = self->selector_;
  }
  else {
    selector = 0;
  }
  return [NSStringFromSelector(selector) hash] ^ v3;
}

- (void)dealloc
{
  free((void *)self->binaryParameterTypes_);

  v3.receiver = self;
  v3.super_class = (Class)ExecutableMember;
  [(ExecutableMember *)&v3 dealloc];
}

@end