@interface LibcoreReflectGenericArrayTypeImpl
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (LibcoreReflectGenericArrayTypeImpl)initWithJavaLangReflectType:(id)a3;
- (NSString)description;
- (id)getGenericComponentType;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation LibcoreReflectGenericArrayTypeImpl

- (LibcoreReflectGenericArrayTypeImpl)initWithJavaLangReflectType:(id)a3
{
  return self;
}

- (id)getGenericComponentType
{
  componentType = self->componentType_;
  objc_opt_class();
  if (!componentType) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [(JavaLangReflectType *)componentType getResolvedType];
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [(id)JavaLangReflectGenericArrayType_class_() isInstance:a3];
  if (v5)
  {
    v6 = (void *)JavaLangReflectGenericArrayType_class_();
    if (!a3)
    {
      [(LibcoreReflectGenericArrayTypeImpl *)self getGenericComponentType];
      JreThrowNullPointerException();
    }
    if (([v6 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    id v7 = [(LibcoreReflectGenericArrayTypeImpl *)self getGenericComponentType];
    id v8 = [a3 getGenericComponentType];
    LOBYTE(v5) = JavaUtilObjects_equalsWithId_withId_(v7, (uint64_t)v8);
  }
  return v5;
}

- (unint64_t)hash
{
  return (int)JavaUtilObjects_hashCodeWithId_([(LibcoreReflectGenericArrayTypeImpl *)self getGenericComponentType]);
}

- (NSString)description
{
  componentType = self->componentType_;
  if (!componentType) {
    JreThrowNullPointerException();
  }
  id v3 = [(JavaLangReflectType *)componentType description];
  return (NSString *)JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreReflectGenericArrayTypeImpl;
  [(LibcoreReflectGenericArrayTypeImpl *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040E620;
}

@end