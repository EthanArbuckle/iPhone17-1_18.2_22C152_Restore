@interface LibcoreReflectTypeVariableImpl
+ (const)__metadata;
+ (id)findFormalVarWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4;
+ (id)nextLayerWithJavaLangReflectGenericDeclaration:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LibcoreReflectTypeVariableImpl)initWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4;
- (LibcoreReflectTypeVariableImpl)initWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4 withLibcoreReflectListOfTypes:(id)a5;
- (NSString)description;
- (id)getBounds;
- (id)getGenericDeclaration;
- (id)getName;
- (unint64_t)hash;
- (void)dealloc;
- (void)resolve;
@end

@implementation LibcoreReflectTypeVariableImpl

- (BOOL)isEqual:(id)a3
{
  if (![(id)JavaLangReflectTypeVariable_class_() isInstance:a3]) {
    return 0;
  }
  v5 = (void *)JavaLangReflectTypeVariable_class_();
  if (!a3)
  {
    [(LibcoreReflectTypeVariableImpl *)self getName];
    JreThrowNullPointerException();
  }
  if (([v5 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  id v6 = [(LibcoreReflectTypeVariableImpl *)self getName];
  if (!v6) {
LABEL_11:
  }
    JreThrowNullPointerException();
  if (!objc_msgSend(v6, "isEqual:", objc_msgSend(a3, "getName"))) {
    return 0;
  }
  id v7 = [(LibcoreReflectTypeVariableImpl *)self getGenericDeclaration];
  if (!v7) {
    goto LABEL_11;
  }
  v8 = v7;
  id v9 = [a3 getGenericDeclaration];
  return [v8 isEqual:v9];
}

- (unint64_t)hash
{
  id v3 = [(LibcoreReflectTypeVariableImpl *)self getName];
  if (!v3
    || (unsigned int v4 = [v3 hash],
        (id v5 = [(LibcoreReflectTypeVariableImpl *)self getGenericDeclaration]) == 0))
  {
    JreThrowNullPointerException();
  }
  return (int)([v5 hash] - v4 + 32 * v4);
}

- (LibcoreReflectTypeVariableImpl)initWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4 withLibcoreReflectListOfTypes:(id)a5
{
  return self;
}

- (LibcoreReflectTypeVariableImpl)initWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4
{
  return self;
}

+ (id)findFormalVarWithJavaLangReflectGenericDeclaration:(id)a3 withNSString:(id)a4
{
  return LibcoreReflectTypeVariableImpl_findFormalVarWithJavaLangReflectGenericDeclaration_withNSString_(a3, a4);
}

+ (id)nextLayerWithJavaLangReflectGenericDeclaration:(id)a3
{
  return sub_1001782C0(a3);
}

- (void)resolve
{
  p_formalVar = &self->formalVar_;
  if (!self->formalVar_)
  {
    declOfVarUser = self->declOfVarUser_;
    while (1)
    {
      FormalVarWithJavaLangReflectGenericDeclaration_withNSString = LibcoreReflectTypeVariableImpl_findFormalVarWithJavaLangReflectGenericDeclaration_withNSString_(declOfVarUser, self->name_);
      if (FormalVarWithJavaLangReflectGenericDeclaration_withNSString) {
        break;
      }
      declOfVarUser = sub_1001782C0(declOfVarUser);
      if (!declOfVarUser)
      {
        id v6 = new_JavaLangAssertionError_initWithId_(@"illegal type variable reference");
        objc_exception_throw(v6);
      }
    }
    id v7 = FormalVarWithJavaLangReflectGenericDeclaration_withNSString;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    JreStrongAssign((id *)p_formalVar, v7);
    if (!*p_formalVar) {
      JreThrowNullPointerException();
    }
    JreStrongAssign((id *)&self->genericDeclaration_, (*p_formalVar)->genericDeclaration_);
    bounds = self->formalVar_->bounds_;
    JreStrongAssign((id *)&self->bounds_, bounds);
  }
}

- (id)getBounds
{
  [(LibcoreReflectTypeVariableImpl *)self resolve];
  bounds = self->bounds_;
  if (!bounds || (id v4 = [(LibcoreReflectListOfTypes *)bounds getResolvedTypes]) == 0) {
    JreThrowNullPointerException();
  }
  return [v4 clone];
}

- (id)getGenericDeclaration
{
  return self->genericDeclaration_;
}

- (id)getName
{
  return self->name_;
}

- (NSString)description
{
  return self->name_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreReflectTypeVariableImpl;
  [(LibcoreReflectTypeVariableImpl *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100404198;
}

@end