@interface JavaLangEnum
+ (const)__metadata;
+ (id)getSharedConstantsWithIOSClass:(id)a3;
+ (id)valueOfWithIOSClass:(id)a3 withNSString:(id)a4;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaLangEnum)initWithNSString:(id)a3 withInt:(int)a4;
- (NSString)description;
- (id)clone;
- (id)getDeclaringClass;
- (id)name;
- (int)compareToWithId:(id)a3;
- (int)ordinal;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaLangEnum

- (JavaLangEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  self->ordinal_ = a4;
  return self;
}

- (id)name
{
  return self->name_;
}

- (int)ordinal
{
  return self->ordinal_;
}

- (NSString)description
{
  return self->name_;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  int ordinal = self->ordinal_;
  name = self->name_;
  if (name) {
    LODWORD(name) = [(NSString *)name hash];
  }
  return (int)name + ordinal;
}

- (id)clone
{
  v2 = new_JavaLangCloneNotSupportedException_initWithNSString_(@"Enums may not be cloned");
  objc_exception_throw(v2);
}

- (int)compareToWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return self->ordinal_ - *((_DWORD *)a3 + 4);
}

- (id)getDeclaringClass
{
  id v2 = [(JavaLangEnum *)self getClass];
  id v3 = [v2 getSuperclass];
  uint64_t v4 = JavaLangEnum_class_();
  objc_opt_class();
  if ((id)v4 == v3)
  {
    if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_7:
    }
      JreThrowClassCastException();
  }
  else if (v3)
  {
    id v2 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    return 0;
  }
  return v2;
}

+ (id)valueOfWithIOSClass:(id)a3 withNSString:(id)a4
{
  return (id)JavaLangEnum_valueOfWithIOSClass_withNSString_(a3, a4);
}

+ (id)getSharedConstantsWithIOSClass:(id)a3
{
  return JavaLangEnum_getSharedConstantsWithIOSClass_((uint64_t)a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangEnum;
  [(JavaLangEnum *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = [JavaLangEnum__1 alloc];
    LibcoreUtilBasicLruCache_initWithInt_((uint64_t)v2, 64);
    JreStrongAssignAndConsume((id *)&qword_100562F40, v2);
    atomic_store(1u, (unsigned __int8 *)&JavaLangEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004882A0;
}

@end