@interface JavaLangReflectMethod
+ (const)__metadata;
+ (id)methodWithMethodSignature:(id)a3 selector:(SEL)a4 class:(id)a5 isStatic:(BOOL)a6 metadata:(id)a7;
- (JavaLangReflectMethod)initWithMethodSignature:(id)a3 selector:(SEL)a4 class:(id)a5 isStatic:(BOOL)a6 metadata:(id)a7;
- (id)description;
- (id)getDefaultValue;
- (id)getGenericReturnType;
- (id)getName;
- (id)getReturnType;
- (id)invocationForTarget:(id)a3;
- (id)invokeWithId:(id)a3 withNSObjectArray:(id)a4;
- (int)getModifiers;
- (unint64_t)hash;
- (void)invoke:(id)a3 object:(id)a4;
- (void)jniInvokeWithId:(id)a3 args:(id *)a4 result:(id *)a5;
@end

@implementation JavaLangReflectMethod

- (JavaLangReflectMethod)initWithMethodSignature:(id)a3 selector:(SEL)a4 class:(id)a5 isStatic:(BOOL)a6 metadata:(id)a7
{
  v9.receiver = self;
  v9.super_class = (Class)JavaLangReflectMethod;
  result = [(ExecutableMember *)&v9 initWithMethodSignature:a3 selector:a4 class:a5 metadata:a7];
  if (result) {
    result->isStatic_ = a6;
  }
  return result;
}

+ (id)methodWithMethodSignature:(id)a3 selector:(SEL)a4 class:(id)a5 isStatic:(BOOL)a6 metadata:(id)a7
{
  v7 = [[JavaLangReflectMethod alloc] initWithMethodSignature:a3 selector:a4 class:a5 isStatic:a6 metadata:a7];
  return v7;
}

- (id)getName
{
  v3 = [(JavaMethodMetadata *)self->super.metadata_ javaName];
  if (v3) {
    return v3;
  }
  v4 = self->super.selector_ ? self->super.selector_ : 0;
  v3 = NSStringFromSelector(v4);
  id v5 = [(NSString *)v3 rangeOfString:@":"];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return v3;
  }
  id v6 = [(NSString *)v3 rangeOfString:@"With", 4, 0, v5 options range];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return v3;
  }
  return [(NSString *)v3 substringToIndex:v6];
}

- (int)getModifiers
{
  v4.receiver = self;
  v4.super_class = (Class)JavaLangReflectMethod;
  int result = [(ExecutableMember *)&v4 getModifiers];
  if (self->isStatic_) {
    return result | 8;
  }
  return result;
}

- (id)getReturnType
{
  id v3 = [(JavaMethodMetadata *)self->super.metadata_ returnType];
  if (v3)
  {
    objc_super v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return v4;
    }
    else
    {
      return (id)NSObject_class_();
    }
  }
  else
  {
    id v6 = [(NSMethodSignature *)self->super.methodSignature_ methodReturnType];
    if (strlen(v6) != 1)
    {
      v7 = [(JavaLangError *)[JavaLangAssertionError alloc] initWithNSString:+[NSString stringWithFormat:@"unexpected return type: %s", v6]];
      v8 = v7;
      objc_exception_throw(v7);
    }
    return decodeTypeEncoding(v6);
  }
}

- (id)getGenericReturnType
{
  id v3 = [(JavaMethodMetadata *)self->super.metadata_ genericSignature];
  if (v3)
  {
    id v4 = v3;
    id v5 = [[LibcoreReflectGenericSignatureParser alloc] initWithJavaLangClassLoader:JavaLangClassLoader_getSystemClassLoader()];
    [(LibcoreReflectGenericSignatureParser *)v5 parseForMethodWithJavaLangReflectGenericDeclaration:self withNSString:v4 withIOSClassArray:[(ExecutableMember *)self getExceptionTypes]];
    id v6 = +[LibcoreReflectTypes getType:v5->returnType_];

    return v6;
  }
  else
  {
    id v8 = [(JavaMethodMetadata *)self->super.metadata_ returnType];
    if (v8
      && (objc_super v9 = v8,
          ([v8 conformsToProtocol:&OBJC_PROTOCOL___JavaLangReflectTypeVariable] & 1) != 0))
    {
      return v9;
    }
    else
    {
      return [(JavaLangReflectMethod *)self getReturnType];
    }
  }
}

- (id)invokeWithId:(id)a3 withNSObjectArray:(id)a4
{
  if (!a3 && !self->isStatic_)
  {
    v14 = [JavaLangNullPointerException alloc];
    CFStringRef v15 = @"null object specified for non-final method";
    goto LABEL_15;
  }
  v7 = [(ExecutableMember *)self getParameterTypes];
  id v8 = (id *)v7;
  if (a4) {
    LODWORD(v9) = *((_DWORD *)a4 + 2);
  }
  else {
    LODWORD(v9) = 0;
  }
  if (v9 != v7[2])
  {
    v14 = [JavaLangIllegalArgumentException alloc];
    CFStringRef v15 = @"wrong number of arguments";
    goto LABEL_15;
  }
  id v10 = [(JavaLangReflectMethod *)self invocationForTarget:a3];
  if ((int)v9 >= 1)
  {
    uint64_t v11 = 0x200000000;
    uint64_t v9 = v9;
    while (1)
    {
      uint64_t v16 = 0;
      if ((objc_msgSend(v8[3], "__unboxValue:toRawValue:", *((void *)a4 + 3), &v16) & 1) == 0) {
        break;
      }
      [v10 setArgument:&v16 atIndex:v11 >> 32];
      v11 += (uint64_t)&_mh_execute_header;
      a4 = (char *)a4 + 8;
      ++v8;
      if (!--v9) {
        goto LABEL_11;
      }
    }
    v14 = [JavaLangIllegalArgumentException alloc];
    CFStringRef v15 = @"argument type mismatch";
LABEL_15:
    objc_exception_throw([(JavaLangNullPointerException *)v14 initWithNSString:v15]);
  }
LABEL_11:
  [(JavaLangReflectMethod *)self invoke:v10 object:a3];
  id v12 = [(JavaLangReflectMethod *)self getReturnType];
  if (v12 == +[IOSClass voidClass]) {
    return 0;
  }
  uint64_t v16 = 0;
  [v10 getReturnValue:&v16];
  return objc_msgSend(v12, "__boxValue:", &v16);
}

- (void)jniInvokeWithId:(id)a3 args:(id *)a4 result:(id *)a5
{
  id v9 = -[JavaLangReflectMethod invocationForTarget:](self, "invocationForTarget:");
  if ([(ExecutableMember *)self getNumParams] >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0x200000000;
    do
    {
      [v9 setArgument:a4 atIndex:v11 >> 32];
      ++v10;
      v11 += (uint64_t)&_mh_execute_header;
      ++a4;
    }
    while (v10 < [(ExecutableMember *)self getNumParams]);
  }
  [(JavaLangReflectMethod *)self invoke:v9 object:a3];
  if (a5)
  {
    [v9 getReturnValue:a5];
  }
}

- (id)invocationForTarget:(id)a3
{
  id v5 = +[NSInvocation invocationWithMethodSignature:self->super.methodSignature_];
  id v6 = v5;
  if (self->super.selector_) {
    SEL selector = self->super.selector_;
  }
  else {
    SEL selector = 0;
  }
  [(NSInvocation *)v5 setSelector:selector];
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v9 = v6;
    id v8 = (objc_class *)a3;
  }
  else
  {
    id v8 = [(IOSClass *)self->super.class_ objcClass];
    id v9 = v6;
  }
  [(NSInvocation *)v9 setTarget:v8];
  return v6;
}

- (void)invoke:(id)a3 object:(id)a4
{
  id v7 = [(ExecutableMember *)self getDeclaringClass];
  if (a4
    && (id v8 = v7, ([(JavaLangReflectMethod *)self getModifiers] & 2) != 0)
    && v8 != [a4 getClass])
  {
    id v9 = object_setClass(a4, (Class)[v8 objcClass]);
    [a3 invoke];
    object_setClass(a4, v9);
  }
  else
  {
    [a3 invoke];
  }
}

- (id)description
{
  id v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"%@ %@ %@.%@("), JavaLangReflectModifier_toStringWithInt_((__int16)-[JavaLangReflectMethod getModifiers](self, "getModifiers")), objc_msgSend(-[JavaLangReflectMethod getReturnType](self, "getReturnType"), "getName"), objc_msgSend(-[ExecutableMember getDeclaringClass](self, "getDeclaringClass"), "getName"), -[JavaLangReflectMethod getName](self, "getName");
  id v4 = [(ExecutableMember *)self getParameterTypes];
  uint64_t v5 = *((unsigned int *)v4 + 2);
  if ((int)v5 >= 1)
  {
    id v6 = v4;
    objc_msgSend(v3, "appendString:", objc_msgSend(v4[3], "getName"));
    if (v5 != 1)
    {
      id v7 = v6 + 1;
      uint64_t v8 = v5 - 1;
      do
      {
        [v3 appendFormat:@",%@", objc_msgSend(v7[3], "getName")];
        ++v7;
        --v8;
      }
      while (v8);
    }
  }
  [v3 appendString:@""]);
  id v9 = [(ExecutableMember *)self getExceptionTypes];
  uint64_t v10 = *((unsigned int *)v9 + 2);
  if ((int)v10 >= 1)
  {
    uint64_t v11 = v9;
    [v3 appendFormat:@" throws %@", objc_msgSend(v9[3], "getName")];
    if (v10 != 1)
    {
      id v12 = v11 + 1;
      uint64_t v13 = v10 - 1;
      do
      {
        [v3 appendFormat:@",%@", objc_msgSend(v12[3], "getName")];
        ++v12;
        --v13;
      }
      while (v13);
    }
  }
  return [v3 description];
}

- (id)getDefaultValue
{
  if ([(IOSClass *)self->super.class_ isAnnotation]
    && (id v3 = -[IOSClass getDeclaredMethod:parameterTypes:](self->super.class_, "getDeclaredMethod:parameterTypes:", objc_msgSend(-[JavaLangReflectMethod getName](self, "getName"), "stringByAppendingString:", @"Default"), +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, IOSClass_class_()))) != 0)
  {
    return objc_msgSend(v3, "invokeWithId:withNSObjectArray:", self->super.class_, +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, NSObject_class_()));
  }
  else
  {
    return 0;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)objc_msgSend(-[IOSClass getName](self->super.class_, "getName"), "hash");
  return (unint64_t)objc_msgSend(-[JavaLangReflectMethod getName](self, "getName"), "hash") ^ v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045C640;
}

@end