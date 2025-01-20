@interface JavaLangReflectConstructor
+ (const)__metadata;
+ (id)constructorWithMethodSignature:(id)a3 selector:(SEL)a4 class:(id)a5 metadata:(id)a6;
- (id)allocInstance;
- (id)description;
- (id)getName;
- (id)invocationForTarget:(id)a3;
- (id)jniNewInstance:(id *)a3;
- (id)newInstanceWithNSObjectArray:(id)a3;
- (unint64_t)hash;
- (void)invoke:(id)a3;
@end

@implementation JavaLangReflectConstructor

+ (id)constructorWithMethodSignature:(id)a3 selector:(SEL)a4 class:(id)a5 metadata:(id)a6
{
  v6 = [(ExecutableMember *)[JavaLangReflectConstructor alloc] initWithMethodSignature:a3 selector:a4 class:a5 metadata:a6];
  return v6;
}

- (id)newInstanceWithNSObjectArray:(id)a3
{
  id v5 = [(JavaLangReflectConstructor *)self allocInstance];
  id v6 = [(JavaLangReflectConstructor *)self invocationForTarget:v5];
  if (a3) {
    LODWORD(v7) = *((_DWORD *)a3 + 2);
  }
  else {
    LODWORD(v7) = 0;
  }
  v8 = [(ExecutableMember *)self getParameterTypes];
  if (v7 != v8[2])
  {
    v12 = [JavaLangIllegalArgumentException alloc];
    CFStringRef v13 = @"wrong number of arguments";
    goto LABEL_11;
  }
  if ((int)v7 >= 1)
  {
    v9 = (id *)v8;
    uint64_t v10 = 0x200000000;
    uint64_t v7 = v7;
    while (1)
    {
      uint64_t v14 = 0;
      if ((objc_msgSend(v9[3], "__unboxValue:toRawValue:", *((void *)a3 + 3), &v14) & 1) == 0) {
        break;
      }
      [v6 setArgument:&v14 atIndex:v10 >> 32];
      v10 += (uint64_t)&_mh_execute_header;
      a3 = (char *)a3 + 8;
      ++v9;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    v12 = [JavaLangIllegalArgumentException alloc];
    CFStringRef v13 = @"argument type mismatch";
LABEL_11:
    objc_exception_throw([(JavaLangIllegalArgumentException *)v12 initWithNSString:v13]);
  }
LABEL_9:
  [(JavaLangReflectConstructor *)self invoke:v6];
  return v5;
}

- (id)jniNewInstance:(id *)a3
{
  id v5 = [(JavaLangReflectConstructor *)self allocInstance];
  id v6 = [(JavaLangReflectConstructor *)self invocationForTarget:v5];
  if ([(ExecutableMember *)self getNumParams] >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0x200000000;
    do
    {
      [v6 setArgument:a3 atIndex:v8 >> 32];
      ++v7;
      v8 += (uint64_t)&_mh_execute_header;
      ++a3;
    }
    while (v7 < [(ExecutableMember *)self getNumParams]);
  }
  [(JavaLangReflectConstructor *)self invoke:v6];
  return v5;
}

- (id)allocInstance
{
  return objc_alloc([(IOSClass *)self->super.class_ objcClass]);
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
  [(NSInvocation *)v6 setTarget:a3];
  return v6;
}

- (void)invoke:(id)a3
{
}

- (id)getName
{
  return [(IOSClass *)self->super.class_ getName];
}

- (unint64_t)hash
{
  id v2 = [(IOSClass *)self->super.class_ getName];
  return (unint64_t)[v2 hash];
}

- (id)description
{
  id v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"%@ %@("), JavaLangReflectModifier_toStringWithInt_((__int16)-[ExecutableMember getModifiers](self, "getModifiers")), objc_msgSend(-[ExecutableMember getDeclaringClass](self, "getDeclaringClass"), "getName");
  v4 = [(ExecutableMember *)self getParameterTypes];
  uint64_t v5 = *((unsigned int *)v4 + 2);
  if ((int)v5 >= 1)
  {
    id v6 = v4;
    objc_msgSend(v3, "appendString:", objc_msgSend(v4[3], "getName"));
    if (v5 != 1)
    {
      uint64_t v7 = v6 + 1;
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
  v9 = [(ExecutableMember *)self getExceptionTypes];
  uint64_t v10 = *((unsigned int *)v9 + 2);
  if ((int)v10 >= 1)
  {
    v11 = v9;
    [v3 appendFormat:@" throws %@", objc_msgSend(v9[3], "getName")];
    if (v10 != 1)
    {
      v12 = v11 + 1;
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

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042D1C0;
}

@end