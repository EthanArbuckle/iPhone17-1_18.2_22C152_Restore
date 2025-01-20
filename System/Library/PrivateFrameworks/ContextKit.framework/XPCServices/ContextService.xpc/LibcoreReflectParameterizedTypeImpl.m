@interface LibcoreReflectParameterizedTypeImpl
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (LibcoreReflectParameterizedTypeImpl)initWithLibcoreReflectParameterizedTypeImpl:(id)a3 withNSString:(id)a4 withLibcoreReflectListOfTypes:(id)a5 withJavaLangClassLoader:(id)a6;
- (NSString)description;
- (id)getActualTypeArguments;
- (id)getOwnerType;
- (id)getRawType;
- (id)getResolvedType;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation LibcoreReflectParameterizedTypeImpl

- (LibcoreReflectParameterizedTypeImpl)initWithLibcoreReflectParameterizedTypeImpl:(id)a3 withNSString:(id)a4 withLibcoreReflectListOfTypes:(id)a5 withJavaLangClassLoader:(id)a6
{
  return self;
}

- (id)getActualTypeArguments
{
  args = self->args_;
  if (!args || (id v3 = [(LibcoreReflectListOfTypes *)args getResolvedTypes]) == 0) {
    JreThrowNullPointerException();
  }
  return [v3 clone];
}

- (id)getOwnerType
{
  p_ownerTypeRes = &self->ownerTypeRes_;
  if (!self->ownerTypeRes_)
  {
    if (self->ownerType0_)
    {
      id v3 = [(LibcoreReflectParameterizedTypeImpl *)self->ownerType0_ getResolvedType];
    }
    else
    {
      id v4 = [(LibcoreReflectParameterizedTypeImpl *)self getRawType];
      if (!v4) {
        JreThrowNullPointerException();
      }
      id v3 = [v4 getDeclaringClass];
    }
    JreStrongAssign((id *)p_ownerTypeRes, v3);
  }
  return *p_ownerTypeRes;
}

- (id)getRawType
{
  p_rawType = &self->rawType_;
  id result = self->rawType_;
  if (!result)
  {
    v5 = (void *)IOSClass_forName_initialize_classLoader_(self->rawTypeName_, 0, self->loader_);
    JreStrongAssign((id *)p_rawType, v5);
    return *p_rawType;
  }
  return result;
}

- (id)getResolvedType
{
  args = self->args_;
  if (!args || (id v4 = [(LibcoreReflectListOfTypes *)args getResolvedTypes]) == 0) {
    JreThrowNullPointerException();
  }
  if (v4[2]) {
    return self;
  }
  return [(LibcoreReflectParameterizedTypeImpl *)self getRawType];
}

- (BOOL)isEqual:(id)a3
{
  if (![(id)JavaLangReflectParameterizedType_class_() isInstance:a3]) {
    return 0;
  }
  v5 = (void *)JavaLangReflectParameterizedType_class_();
  if (!a3)
  {
    [(LibcoreReflectParameterizedTypeImpl *)self getRawType];
    JreThrowNullPointerException();
  }
  if (([v5 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  if (!JavaUtilObjects_equalsWithId_withId_(-[LibcoreReflectParameterizedTypeImpl getRawType](self, "getRawType"), (uint64_t)[a3 getRawType])|| !JavaUtilObjects_equalsWithId_withId_(-[LibcoreReflectParameterizedTypeImpl getOwnerType](self, "getOwnerType"), (uint64_t)objc_msgSend(a3, "getOwnerType")))
  {
    return 0;
  }
  args = self->args_;
  if (!args) {
    JreThrowNullPointerException();
  }
  id v7 = [(LibcoreReflectListOfTypes *)args getResolvedTypes];
  id v8 = [a3 getActualTypeArguments];
  return JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)v7, (uint64_t)v8);
}

- (unint64_t)hash
{
  unsigned int v3 = JavaUtilObjects_hashCodeWithId_([(LibcoreReflectParameterizedTypeImpl *)self getRawType]);
  unsigned int v4 = JavaUtilObjects_hashCodeWithId_([(LibcoreReflectParameterizedTypeImpl *)self getOwnerType]);
  args = self->args_;
  if (!args) {
    JreThrowNullPointerException();
  }
  return (int)(JavaUtilArrays_hashCodeWithNSObjectArray_((uint64_t)[(LibcoreReflectListOfTypes *)args getResolvedTypes])- (v4- v3+ 32 * v3)+ 32 * (v4 - v3 + 32 * v3));
}

- (NSString)description
{
  unsigned int v3 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v3 appendWithNSString:self->rawTypeName_];
  args = self->args_;
  if (!args) {
    goto LABEL_9;
  }
  if ([(LibcoreReflectListOfTypes *)args length] < 1) {
    goto LABEL_6;
  }
  id v5 = [(JavaLangStringBuilder *)v3 appendWithNSString:@"<"];
  if (!v5 || (id v6 = [v5 appendWithId:self->args_]) == 0) {
LABEL_9:
  }
    JreThrowNullPointerException();
  [v6 appendWithNSString:@">"];
LABEL_6:
  return [(JavaLangStringBuilder *)v3 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreReflectParameterizedTypeImpl;
  [(LibcoreReflectParameterizedTypeImpl *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004499E0;
}

@end