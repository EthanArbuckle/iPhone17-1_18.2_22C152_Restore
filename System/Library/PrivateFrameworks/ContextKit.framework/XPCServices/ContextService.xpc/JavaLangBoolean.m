@interface JavaLangBoolean
+ (BOOL)getBooleanWithNSString:(id)a3;
+ (BOOL)parseBooleanWithNSString:(id)a3;
+ (const)__metadata;
+ (id)toStringWithBoolean:(BOOL)a3;
+ (id)valueOfWithBoolean:(BOOL)a3;
+ (id)valueOfWithNSString:(id)a3;
+ (int)compareWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4;
+ (void)initialize;
- (BOOL)BOOLeanValue;
- (BOOL)isEqual:(id)a3;
- (JavaLangBoolean)initWithBoolean:(BOOL)a3;
- (JavaLangBoolean)initWithNSString:(id)a3;
- (NSString)description;
- (int)compareToWithId:(id)a3;
- (unint64_t)hash;
@end

@implementation JavaLangBoolean

- (JavaLangBoolean)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangBoolean)initWithBoolean:(BOOL)a3
{
  self->value_ = a3;
  return self;
}

- (BOOL)BOOLeanValue
{
  return self->value_;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return *((unsigned __int8 *)a3 + 8) == self->value_;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  BOOL value = self->value_;
  int v6 = *((unsigned __int8 *)a3 + 8);
  if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (value) {
    int v7 = 1;
  }
  else {
    int v7 = -1;
  }
  if (value != (v6 != 0)) {
    return v7;
  }
  else {
    return 0;
  }
}

+ (int)compareWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4
{
  int v4 = a4;
  int v5 = a3;
  if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v5) {
    int v6 = 1;
  }
  else {
    int v6 = -1;
  }
  if (v5 != v4) {
    return v6;
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  if (self->value_) {
    return 1231;
  }
  else {
    return 1237;
  }
}

- (NSString)description
{
  return (NSString *)NSString_valueOfBool_(self->value_);
}

+ (BOOL)getBooleanWithNSString:(id)a3
{
  return JavaLangBoolean_getBooleanWithNSString_(a3);
}

+ (BOOL)parseBooleanWithNSString:(id)a3
{
  if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return [@"true" equalsIgnoreCase:a3];
}

+ (id)toStringWithBoolean:(BOOL)a3
{
  return (id)JavaLangBoolean_toStringWithBoolean_(a3);
}

+ (id)valueOfWithNSString:(id)a3
{
  return (id)JavaLangBoolean_valueOfWithNSString_((uint64_t)a3);
}

+ (id)valueOfWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  int v4 = &JavaLangBoolean_TRUE__;
  if (!v3) {
    int v4 = &JavaLangBoolean_FALSE__;
  }
  return (id)*v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_msgSend((id)IOSClass_arrayType((uint64_t)+[IOSClass BOOLeanClass](IOSClass, "BOOLeanClass"), 1u), "getComponentType");
    objc_opt_class();
    if (v2)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
    JreStrongAssign(&JavaLangBoolean_TYPE_, v2);
    BOOL v3 = [JavaLangBoolean alloc];
    v3->value_ = 1;
    JreStrongAssignAndConsume((id *)&JavaLangBoolean_TRUE__, v3);
    int v4 = [JavaLangBoolean alloc];
    v4->value_ = 0;
    JreStrongAssignAndConsume((id *)&JavaLangBoolean_FALSE__, v4);
    atomic_store(1u, (unsigned __int8 *)JavaLangBoolean__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040A460;
}

@end