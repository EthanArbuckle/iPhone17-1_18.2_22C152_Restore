@interface JavaLangPackage
+ (const)__metadata;
+ (id)getPackageWithNSString:(id)a3;
+ (void)initialize;
- (BOOL)isAnnotationPresentWithIOSClass:(id)a3;
- (BOOL)isCompatibleWithWithNSString:(id)a3;
- (BOOL)isSealed;
- (BOOL)isSealedWithJavaNetURL:(id)a3;
- (JavaLangPackage)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9 withJavaNetURL:(id)a10;
- (NSString)description;
- (id)getAnnotationWithIOSClass:(id)a3;
- (id)getAnnotations;
- (id)getImplementationTitle;
- (id)getImplementationVendor;
- (id)getImplementationVersion;
- (id)getName;
- (id)getSpecificationTitle;
- (id)getSpecificationVendor;
- (id)getSpecificationVersion;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaLangPackage

- (JavaLangPackage)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9 withJavaNetURL:(id)a10
{
  return self;
}

- (id)getAnnotationWithIOSClass:(id)a3
{
  v4 = [(JavaLangPackage *)self getAnnotations];
  if (!v4) {
LABEL_11:
  }
    JreThrowNullPointerException();
  v5 = (void **)(v4 + 6);
  unint64_t v6 = (unint64_t)&v4[2 * v4[2] + 6];
  do
  {
    if ((unint64_t)v5 >= v6) {
      return 0;
    }
    if (!a3) {
      goto LABEL_11;
    }
    v8 = *v5++;
    v7 = v8;
  }
  while (![a3 isInstance:v8]);
  v9 = (void *)JavaLangAnnotationAnnotation_class_();
  if (v7 && ([v9 isInstance:v7] & 1) == 0) {
    JreThrowClassCastException();
  }
  return v7;
}

- (id)getAnnotations
{
  id v2 = [(JavaLangPackage *)self getName];
  v10 = (__CFString *)JreStrcat("$$", v3, v4, v5, v6, v7, v8, v9, v2);
  v11 = (void *)IOSClass_forName_(v10);
  if (!v11) {
    JreThrowNullPointerException();
  }
  return [v11 getAnnotations];
}

- (BOOL)isAnnotationPresentWithIOSClass:(id)a3
{
  return [(JavaLangPackage *)self getAnnotationWithIOSClass:a3] != 0;
}

- (id)getImplementationTitle
{
  return self->implTitle_;
}

- (id)getImplementationVendor
{
  return self->implVendor_;
}

- (id)getImplementationVersion
{
  return self->implVersion_;
}

- (id)getName
{
  return self->name_;
}

+ (id)getPackageWithNSString:(id)a3
{
  return JavaLangPackage_getPackageWithNSString_((uint64_t)a3);
}

- (id)getSpecificationTitle
{
  return self->specTitle_;
}

- (id)getSpecificationVendor
{
  return self->specVendor_;
}

- (id)getSpecificationVersion
{
  return self->specVersion_;
}

- (unint64_t)hash
{
  name = self->name_;
  if (!name) {
    JreThrowNullPointerException();
  }
  return (int)[(NSString *)name hash];
}

- (BOOL)isCompatibleWithWithNSString:(id)a3
{
  if (!a3
    || (uint64_t v4 = (void **)[a3 split:@"\\."], (specVersion = self->specVersion_) == 0)
    || (uint64_t v6 = [(NSString *)specVersion split:@"\\."], !v4)
    || (uint64_t v7 = v6) == 0)
  {
    JreThrowNullPointerException();
  }
  int v15 = JavaLangMath_minWithInt_withInt_(*((unsigned int *)v4 + 2), v6[2]);
  uint64_t v16 = *((unsigned int *)v4 + 2);
  if (v15 < 1)
  {
    return (int)v16 <= v7[2];
  }
  else
  {
    uint64_t v17 = 0;
    while (1)
    {
      if (v17 >= (int)v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v17);
      }
      int v25 = JavaLangInteger_parseIntWithNSString_(v4[v17 + 3], v8, v9, v10, v11, v12, v13, v14);
      uint64_t v26 = (int)v7[2];
      if (v17 >= v26) {
        IOSArray_throwOutOfBoundsWithMsg(v26, v17);
      }
      int v27 = JavaLangInteger_parseIntWithNSString_(*(void **)&v7[2 * v17 + 6], v18, v19, v20, v21, v22, v23, v24);
      BOOL v28 = v25 <= v27;
      if (v25 != v27) {
        break;
      }
      ++v17;
      int v29 = JavaLangMath_minWithInt_withInt_(*((unsigned int *)v4 + 2), v7[2]);
      uint64_t v16 = *((unsigned int *)v4 + 2);
      if (v17 >= v29) {
        return (int)v16 <= v7[2];
      }
    }
  }
  return v28;
}

- (BOOL)isSealed
{
  return self->sealBase_ != 0;
}

- (BOOL)isSealedWithJavaNetURL:(id)a3
{
  sealBase = self->sealBase_;
  if (sealBase) {
    LOBYTE(sealBase) = [(JavaNetURL *)sealBase sameFileWithJavaNetURL:a3];
  }
  return (char)sealBase;
}

- (NSString)description
{
  return (NSString *)JreStrcat("$$", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"package ");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangPackage;
  [(JavaLangPackage *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:JavaLangAnnotationAnnotation_class_()];
    JreStrongAssignAndConsume((id *)&qword_1005611C0, v2);
    atomic_store(1u, (unsigned __int8 *)JavaLangPackage__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100463078;
}

@end