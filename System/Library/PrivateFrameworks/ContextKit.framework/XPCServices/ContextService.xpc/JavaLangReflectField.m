@interface JavaLangReflectField
+ (JavaLangReflectField)fieldWithIvar:(objc_ivar *)a3 withClass:(id)a4 withMetadata:(id)a5;
+ (const)__metadata;
+ (id)propertyName:(id)a3;
+ (id)variableName:(id)a3;
- (BOOL)getBooleanWithId:(id)a3;
- (BOOL)isEnumConstant;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSynthetic;
- (JavaLangReflectField)initWithIvar:(objc_ivar *)a3 withClass:(id)a4 withMetadata:(id)a5;
- (NSString)description;
- (char)getByteWithId:(id)a3;
- (double)getDoubleWithId:(id)a3;
- (float)getFloatWithId:(id)a3;
- (id)getDeclaredAnnotations;
- (id)getDeclaringClass;
- (id)getGenericType;
- (id)getType;
- (id)getWithId:(id)a3;
- (id)propertyName;
- (id)toGenericString;
- (int)getIntWithId:(id)a3;
- (int)getModifiers;
- (int)unsafeOffset;
- (int64_t)getLongWithId:(id)a3;
- (signed)getShortWithId:(id)a3;
- (unint64_t)hash;
- (unsigned)getCharWithId:(id)a3;
- (void)dealloc;
- (void)setBooleanWithId:(id)a3 withBoolean:(BOOL)a4;
- (void)setByteWithId:(id)a3 withByte:(char)a4;
- (void)setCharWithId:(id)a3 withChar:(unsigned __int16)a4;
- (void)setDoubleWithId:(id)a3 withDouble:(double)a4;
- (void)setFloatWithId:(id)a3 withFloat:(float)a4;
- (void)setIntWithId:(id)a3 withInt:(int)a4;
- (void)setLongWithId:(id)a3 withLong:(int64_t)a4;
- (void)setShortWithId:(id)a3 withShort:(signed __int16)a4;
- (void)setWithId:(id)a3 withId:(id)a4;
@end

@implementation JavaLangReflectField

- (JavaLangReflectField)initWithIvar:(objc_ivar *)a3 withClass:(id)a4 withMetadata:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)JavaLangReflectField;
  v8 = [(JavaLangReflectAccessibleObject *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->ivar_ = a3;
    v8->declaringClass_ = (IOSClass *)a4;
    v8->metadata_ = (JavaFieldMetadata *)a5;
  }
  return v9;
}

+ (JavaLangReflectField)fieldWithIvar:(objc_ivar *)a3 withClass:(id)a4 withMetadata:(id)a5
{
  v5 = [[JavaLangReflectField alloc] initWithIvar:a3 withClass:a4 withMetadata:a5];
  v6 = v5;
  return v5;
}

- (NSString)description
{
  metadata = self->metadata_;
  if (metadata) {
    v4 = (__CFString *)JavaLangReflectModifier_toStringWithInt_((__int16)[(JavaFieldMetadata *)metadata modifiers]);
  }
  else {
    v4 = &stru_10048C1F8;
  }
  id v5 = [(__CFString *)v4 length];
  id v6 = [(JavaLangReflectField *)self getType];
  id v7 = objc_msgSend(-[JavaLangReflectField getDeclaringClass](self, "getDeclaringClass"), "getName");
  id v8 = [(JavaLangReflectField *)self propertyName];
  if (v5) {
    return +[NSString stringWithFormat:@"%@ %@ %@.%@", v4, v6, v7, v8];
  }
  else {
    return +[NSString stringWithFormat:@"%@ %@.%@", v6, v7, v8, v10];
  }
}

- (id)getWithId:(id)a3
{
  uint64_t v7 = 0;
  id v5 = [(JavaLangReflectField *)self getType];
  sub_10023BB7C(&v7, (uint64_t)self, (uint64_t)a3, v5);
  return objc_msgSend(v5, "__boxValue:", &v7);
}

- (BOOL)getBooleanWithId:(id)a3
{
  BOOL v4 = 0;
  sub_10023BB7C(&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass BOOLeanClass]);
  return v4;
}

- (char)getByteWithId:(id)a3
{
  uint64_t v4 = 0;
  sub_10023BB7C(&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass byteClass]);
  return v4;
}

- (unsigned)getCharWithId:(id)a3
{
  uint64_t v4 = 0;
  sub_10023BB7C(&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass charClass]);
  return v4;
}

- (double)getDoubleWithId:(id)a3
{
  double v4 = 0.0;
  sub_10023BB7C(&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass doubleClass]);
  return v4;
}

- (float)getFloatWithId:(id)a3
{
  uint64_t v4 = 0;
  sub_10023BB7C(&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass floatClass]);
  return *(float *)&v4;
}

- (int)getIntWithId:(id)a3
{
  uint64_t v4 = 0;
  sub_10023BB7C(&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass intClass]);
  return v4;
}

- (int64_t)getLongWithId:(id)a3
{
  int64_t v4 = 0;
  sub_10023BB7C(&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass longClass]);
  return v4;
}

- (signed)getShortWithId:(id)a3
{
  uint64_t v4 = 0;
  sub_10023BB7C(&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass shortClass]);
  return v4;
}

- (void)setWithId:(id)a3 withId:(id)a4
{
  id v7 = [(JavaLangReflectField *)self getType];
  unsigned __int8 v8 = [v7 isPrimitive];
  if ((v8 & 1) == 0) {
    id v9 = [(JavaLangReflectField *)self getWithId:a3];
  }
  uint64_t v11 = 0;
  if ((objc_msgSend(v7, "__unboxValue:toRawValue:", a4, &v11) & 1) == 0) {
    objc_exception_throw([[JavaLangIllegalArgumentException alloc] initWithNSString:@"field type mismatch"]);
  }
  sub_10023BFE0((uint64_t)&v11, (uint64_t)self, (uint64_t)a3, v7);
  if ((v8 & 1) == 0) {
    id v10 = a4;
  }
}

- (void)setBooleanWithId:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  sub_10023BFE0((uint64_t)&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass BOOLeanClass]);
}

- (void)setByteWithId:(id)a3 withByte:(char)a4
{
  uint64_t v4 = a4;
  sub_10023BFE0((uint64_t)&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass byteClass]);
}

- (void)setCharWithId:(id)a3 withChar:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  sub_10023BFE0((uint64_t)&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass charClass]);
}

- (void)setDoubleWithId:(id)a3 withDouble:(double)a4
{
  double v4 = a4;
  sub_10023BFE0((uint64_t)&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass doubleClass]);
}

- (void)setFloatWithId:(id)a3 withFloat:(float)a4
{
  uint64_t v4 = LODWORD(a4);
  sub_10023BFE0((uint64_t)&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass floatClass]);
}

- (void)setIntWithId:(id)a3 withInt:(int)a4
{
  uint64_t v4 = a4;
  sub_10023BFE0((uint64_t)&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass intClass]);
}

- (void)setLongWithId:(id)a3 withLong:(int64_t)a4
{
  int64_t v4 = a4;
  sub_10023BFE0((uint64_t)&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass longClass]);
}

- (void)setShortWithId:(id)a3 withShort:(signed __int16)a4
{
  uint64_t v4 = (unsigned __int16)a4;
  sub_10023BFE0((uint64_t)&v4, (uint64_t)self, (uint64_t)a3, +[IOSClass shortClass]);
}

- (id)getType
{
  if (self->metadata_)
  {
    id v2 = [(JavaFieldMetadata *)self->metadata_ type];
    return (id)TypeToClass((uint64_t)v2);
  }
  else if (self->ivar_)
  {
    TypeEncoding = ivar_getTypeEncoding(self->ivar_);
    return decodeTypeEncoding(TypeEncoding);
  }
  else
  {
    id v5 = [(IOSClass *)self->declaringClass_ getMethod:[(JavaLangReflectField *)self getName] parameterTypes:0];
    if (!v5) {
      JreThrowNullPointerException();
    }
    return [v5 getReturnType];
  }
}

- (id)getGenericType
{
  v3 = [(JavaLangReflectField *)self getType];
  metadata = self->metadata_;
  if (metadata)
  {
    id v5 = [(JavaFieldMetadata *)metadata genericSignature];
    if (v5)
    {
      id v6 = v5;
      id v7 = [[LibcoreReflectGenericSignatureParser alloc] initWithJavaLangClassLoader:JavaLangClassLoader_getSystemClassLoader()];
      [(LibcoreReflectGenericSignatureParser *)v7 parseForFieldWithJavaLangReflectGenericDeclaration:self->declaringClass_ withNSString:v6];
      fieldType = v7->fieldType_;
      if (fieldType) {
        v3 = fieldType;
      }
    }
  }
  return v3;
}

- (int)getModifiers
{
  metadata = self->metadata_;
  if (metadata) {
    return [(JavaFieldMetadata *)metadata modifiers];
  }
  else {
    return 1;
  }
}

- (id)getDeclaringClass
{
  return self->declaringClass_;
}

- (id)propertyName
{
  if (self->metadata_) {
    id v2 = [(JavaFieldMetadata *)self->metadata_ name];
  }
  else {
    id v2 = +[NSString stringWithUTF8String:ivar_getName(self->ivar_)];
  }
  return +[JavaLangReflectField propertyName:v2];
}

+ (id)propertyName:(id)a3
{
  uint64_t v4 = (char *)[a3 length] - 1;
  if ([a3 characterAtIndex:v4] != 95) {
    return a3;
  }
  return [a3 substringToIndex:v4];
}

+ (id)variableName:(id)a3
{
  if (objc_msgSend(a3, "characterAtIndex:", (char *)objc_msgSend(a3, "length") - 1) == 95) {
    return a3;
  }
  return [a3 stringByAppendingString:@"_"];
}

- (BOOL)isSynthetic
{
  metadata = self->metadata_;
  if (metadata) {
    LODWORD(metadata) = ([(JavaFieldMetadata *)metadata modifiers] >> 12) & 1;
  }
  return (char)metadata;
}

- (BOOL)isEnumConstant
{
  metadata = self->metadata_;
  if (metadata)
  {
    return ([(JavaFieldMetadata *)metadata modifiers] >> 14) & 1;
  }
  else
  {
    unsigned int v4 = [(IOSClass *)self->declaringClass_ isEnum];
    if (v4)
    {
      id v5 = [(JavaLangReflectField *)self getType];
      declaringClass = self->declaringClass_;
      LOBYTE(v4) = [v5 isEqual:declaringClass];
    }
  }
  return v4;
}

- (id)toGenericString
{
  metadata = self->metadata_;
  if (metadata) {
    unsigned int v4 = (__CFString *)JavaLangReflectModifier_toStringWithInt_((__int16)[(JavaFieldMetadata *)metadata modifiers]);
  }
  else {
    unsigned int v4 = &stru_10048C1F8;
  }
  if ([(__CFString *)v4 length]) {
    unsigned int v4 = (__CFString *)[(__CFString *)v4 stringByAppendingString:@" "];
  }
  id v5 = [(JavaLangReflectField *)self getGenericType];
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___JavaLangReflectTypeVariable]) {
    id v6 = [v5 getName];
  }
  else {
    id v6 = [v5 description];
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%@ %@.%@", v4, v6, objc_msgSend(-[JavaLangReflectField getDeclaringClass](self, "getDeclaringClass"), "getName"), -[JavaLangReflectField propertyName](self, "propertyName"));
}

- (id)getDeclaredAnnotations
{
  v3 = [(IOSClass *)self->declaringClass_ objcClass];
  if (v3
    && JreFindClassMethod(v3, [+[NSString stringWithFormat:@"__annotations_%@_", [(JavaLangReflectField *)self getName]] UTF8String]))
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

- (int)unsafeOffset
{
  return ivar_getOffset(self->ivar_);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->declaringClass_ != (IOSClass *)*((void *)a3 + 3)) {
    return 0;
  }
  id v6 = [(JavaLangReflectField *)self propertyName];
  id v7 = [a3 propertyName];
  return [v6 isEqual:v7];
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)objc_msgSend(-[IOSClass getName](self->declaringClass_, "getName"), "hash");
  return (unint64_t)objc_msgSend(-[JavaLangReflectField propertyName](self, "propertyName"), "hash") ^ v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangReflectField;
  [(JavaLangReflectField *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045B2F8;
}

@end