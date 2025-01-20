@interface JavaIoObjectStreamField
+ (const)__metadata;
- (BOOL)isPrimitive;
- (BOOL)isUnshared;
- (BOOL)writeFieldWithJavaIoDataOutputStream:(id)a3;
- (JavaIoObjectStreamField)initWithNSString:(id)a3 withIOSClass:(id)a4;
- (JavaIoObjectStreamField)initWithNSString:(id)a3 withIOSClass:(id)a4 withBoolean:(BOOL)a5;
- (JavaIoObjectStreamField)initWithNSString:(id)a3 withNSString:(id)a4;
- (NSString)description;
- (id)getName;
- (id)getType;
- (id)getTypeInternal;
- (id)getTypeString;
- (int)compareToWithId:(id)a3;
- (int)getOffset;
- (uint64_t)defaultResolve;
- (unsigned)getTypeCode;
- (unsigned)typeCodeOfWithIOSClass:(id)a3;
- (void)dealloc;
- (void)resolveWithJavaLangClassLoader:(id)a3;
- (void)setOffsetWithInt:(int)a3;
- (void)setUnsharedWithBoolean:(BOOL)a3;
@end

@implementation JavaIoObjectStreamField

- (JavaIoObjectStreamField)initWithNSString:(id)a3 withIOSClass:(id)a4
{
  return self;
}

- (JavaIoObjectStreamField)initWithNSString:(id)a3 withIOSClass:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (JavaIoObjectStreamField)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3)
  {
    objc_opt_class();
    [(JavaIoObjectStreamField *)self isPrimitive];
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    JreThrowClassCastException();
  }
  unsigned int v5 = [(JavaIoObjectStreamField *)self isPrimitive];
  if (v5 == [a3 isPrimitive])
  {
    id v7 = [(JavaIoObjectStreamField *)self getName];
    if (!v7) {
      JreThrowNullPointerException();
    }
    v8 = v7;
    id v9 = [a3 getName];
    return [v8 compareToWithId:v9];
  }
  else if (v5)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

- (id)getName
{
  return self->name_;
}

- (int)getOffset
{
  return self->offset_;
}

- (id)getTypeInternal
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id type = self->type_;
  if (isKindOfClass)
  {
    objc_opt_class();
    if (!type) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_8:
    }
      JreThrowClassCastException();
    id type = [type get];
  }
  objc_opt_class();
  if (type && (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  return type;
}

- (id)getType
{
  id v3 = [(JavaIoObjectStreamField *)self getTypeInternal];
  v4 = v3;
  if (!self->isDeserialized_) {
    return v4;
  }
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ([v3 isPrimitive]) {
    return v4;
  }
  return (id)NSObject_class_();
}

- (unsigned)getTypeCode
{
  id v2 = [(JavaIoObjectStreamField *)self getTypeInternal];
  return sub_1002923E8(v2);
}

- (unsigned)typeCodeOfWithIOSClass:(id)a3
{
  return sub_1002923E8(a3);
}

- (id)getTypeString
{
  if ([(JavaIoObjectStreamField *)self isPrimitive]) {
    return 0;
  }
  p_typeString = &self->typeString_;
  id result = self->typeString_;
  if (!result)
  {
    id v5 = [(JavaIoObjectStreamField *)self getTypeInternal];
    if (!v5 || (v6 = v5, (id v7 = [v5 getName]) == 0)) {
      JreThrowNullPointerException();
    }
    v8 = (__CFString *)[v7 replace:46 withChar:47];
    if (([v6 isArray] & 1) == 0) {
      v8 = (__CFString *)JreStrcat("C$C", v9, v10, v11, v12, v13, v14, v15, (id)0x4C);
    }
    JreStrongAssign((id *)p_typeString, [(__CFString *)v8 intern]);
    return *p_typeString;
  }
  return result;
}

- (BOOL)isPrimitive
{
  id v2 = [(JavaIoObjectStreamField *)self getTypeInternal];
  if (v2)
  {
    LOBYTE(v2) = [v2 isPrimitive];
  }
  return (char)v2;
}

- (BOOL)writeFieldWithJavaIoDataOutputStream:(id)a3
{
  id v5 = [(JavaIoObjectStreamField *)self getTypeInternal];
  if (!a3) {
    JreThrowNullPointerException();
  }
  v6 = v5;
  [a3 writeByteWithInt:sub_1002923E8(v5)];
  [a3 writeUTFWithNSString:self->name_];
  if (!v6) {
    return 0;
  }
  return [v6 isPrimitive];
}

- (void)setOffsetWithInt:(int)a3
{
  self->offset_ = a3;
}

- (NSString)description
{
  id v3 = objc_msgSend(-[JavaIoObjectStreamField getClass](self, "getClass"), "getName");
  [(JavaIoObjectStreamField *)self getName];
  [(JavaIoObjectStreamField *)self getTypeInternal];
  return (NSString *)JreStrcat("$C$C@C", v4, v5, v6, v7, v8, v9, v10, v3);
}

- (void)resolveWithJavaLangClassLoader:(id)a3
{
  p_typeString = &self->typeString_;
  typeString = self->typeString_;
  if (!typeString)
  {
    if ([(JavaIoObjectStreamField *)self isPrimitive])
    {
      uint64_t v7 = NSString_valueOfChar_([(JavaIoObjectStreamField *)self getTypeCode]);
      JreStrongAssign((id *)p_typeString, v7);
    }
    typeString = *p_typeString;
    if (!*p_typeString) {
      goto LABEL_15;
    }
  }
  if ([(NSString *)typeString length] == 1
    && (-[JavaIoObjectStreamField defaultResolve]_0((uint64_t)self) & 1) != 0)
  {
    return;
  }
  id v8 = [(NSString *)*p_typeString replace:47 withChar:46];
  if (!v8) {
LABEL_15:
  }
    JreThrowNullPointerException();
  id v9 = v8;
  if ([v8 charAtWithInt:0] == 76) {
    id v9 = objc_msgSend(v9, "substring:endIndex:", 1, objc_msgSend(v9, "length") - 1);
  }
  uint64_t v10 = (JavaLangRefWeakReference *)IOSClass_forName_initialize_classLoader_(v9, 0, a3);
  uint64_t v11 = v10;
  if (!v10) {
    JreThrowNullPointerException();
  }
  if ([(JavaLangRefWeakReference *)v10 getClassLoader]) {
    uint64_t v11 = new_JavaLangRefWeakReference_initWithId_((unint64_t)v11);
  }
  JreStrongAssign(&self->type_, v11);
}

- (uint64_t)defaultResolve
{
  id v2 = *(void **)(a1 + 32);
  if (!v2) {
    JreThrowNullPointerException();
  }
  unsigned int v3 = [v2 charAtWithInt:0];
  switch(v3)
  {
    case 'B':
      uint64_t v4 = (id *)(a1 + 24);
      id v5 = +[IOSClass byteClass];
      goto LABEL_14;
    case 'C':
      uint64_t v4 = (id *)(a1 + 24);
      id v5 = +[IOSClass charClass];
      goto LABEL_14;
    case 'D':
      uint64_t v4 = (id *)(a1 + 24);
      id v5 = +[IOSClass doubleClass];
      goto LABEL_14;
    case 'E':
    case 'G':
    case 'H':
      goto LABEL_7;
    case 'F':
      uint64_t v4 = (id *)(a1 + 24);
      id v5 = +[IOSClass floatClass];
      goto LABEL_14;
    case 'I':
      uint64_t v4 = (id *)(a1 + 24);
      id v5 = +[IOSClass intClass];
      goto LABEL_14;
    case 'J':
      uint64_t v4 = (id *)(a1 + 24);
      id v5 = +[IOSClass longClass];
      goto LABEL_14;
    default:
      if (v3 == 83)
      {
        uint64_t v4 = (id *)(a1 + 24);
        id v5 = +[IOSClass shortClass];
      }
      else
      {
        if (v3 != 90)
        {
LABEL_7:
          uint64_t v6 = NSObject_class_();
          JreStrongAssign((id *)(a1 + 24), v6);
          return 0;
        }
        uint64_t v4 = (id *)(a1 + 24);
        id v5 = +[IOSClass BOOLeanClass];
      }
LABEL_14:
      JreStrongAssign(v4, v5);
      return 1;
  }
}

- (BOOL)isUnshared
{
  return self->unshared_;
}

- (void)setUnsharedWithBoolean:(BOOL)a3
{
  self->unshared_ = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoObjectStreamField;
  [(JavaIoObjectStreamField *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100484430;
}

@end