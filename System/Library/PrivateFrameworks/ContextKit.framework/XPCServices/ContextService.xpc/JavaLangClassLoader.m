@interface JavaLangClassLoader
+ (const)__metadata;
+ (id)__annotations_defineClassWithByteArray_withInt_withInt_;
+ (id)getSystemClassLoader;
+ (id)getSystemResourceAsStreamWithNSString:(id)a3;
+ (id)getSystemResourceWithNSString:(id)a3;
+ (id)getSystemResourcesWithNSString:(id)a3;
- (JavaLangClassLoader)init;
- (JavaLangClassLoader)initWithJavaLangClassLoader:(id)a3;
- (JavaLangClassLoader)initWithJavaLangClassLoader:(id)a3 withBoolean:(BOOL)a4;
- (id)defineClassWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)defineClassWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (id)defineClassWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withJavaSecurityProtectionDomain:(id)a7;
- (id)defineClassWithNSString:(id)a3 withJavaNioByteBuffer:(id)a4 withJavaSecurityProtectionDomain:(id)a5;
- (id)definePackageWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9 withJavaNetURL:(id)a10;
- (id)findClassWithNSString:(id)a3;
- (id)findLibraryWithNSString:(id)a3;
- (id)findLoadedClassWithNSString:(id)a3;
- (id)findResourceWithNSString:(id)a3;
- (id)findSystemClassWithNSString:(id)a3;
- (id)getPackageWithNSString:(id)a3;
- (id)getPackages;
- (id)getParent;
- (id)getResourceAsStreamWithNSString:(id)a3;
- (id)getResourceWithNSString:(id)a3;
- (id)getResourcesWithNSString:(id)a3;
- (id)loadClassWithNSString:(id)a3;
- (id)loadClassWithNSString:(id)a3 withBoolean:(BOOL)a4;
- (void)dealloc;
@end

@implementation JavaLangClassLoader

+ (id)getSystemClassLoader
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangSystemClassLoader__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaLangSystemClassLoader_loader_;
}

+ (id)getSystemResourceWithNSString:(id)a3
{
  return JavaLangClassLoader_getSystemResourceWithNSString_((uint64_t)a3);
}

+ (id)getSystemResourcesWithNSString:(id)a3
{
  return JavaLangClassLoader_getSystemResourcesWithNSString_((uint64_t)a3);
}

+ (id)getSystemResourceAsStreamWithNSString:(id)a3
{
  return JavaLangClassLoader_getSystemResourceAsStreamWithNSString_((uint64_t)a3);
}

- (JavaLangClassLoader)init
{
  return self;
}

- (JavaLangClassLoader)initWithJavaLangClassLoader:(id)a3
{
  return self;
}

- (JavaLangClassLoader)initWithJavaLangClassLoader:(id)a3 withBoolean:(BOOL)a4
{
  return self;
}

- (id)defineClassWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  v5 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"can't load this type of class file");
  objc_exception_throw(v5);
}

- (id)defineClassWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  v6 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"can't load this type of class file");
  objc_exception_throw(v6);
}

- (id)defineClassWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withJavaSecurityProtectionDomain:(id)a7
{
  v7 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"can't load this type of class file");
  objc_exception_throw(v7);
}

- (id)defineClassWithNSString:(id)a3 withJavaNioByteBuffer:(id)a4 withJavaSecurityProtectionDomain:(id)a5
{
  v5 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"can't load this type of class file");
  objc_exception_throw(v5);
}

- (id)findClassWithNSString:(id)a3
{
  v3 = new_JavaLangClassNotFoundException_initWithNSString_((uint64_t)a3);
  objc_exception_throw(v3);
}

- (id)findLoadedClassWithNSString:(id)a3
{
  return sub_1001886A4((uint64_t)a3);
}

- (id)findSystemClassWithNSString:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangSystemClassLoader__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v4 = JavaLangSystemClassLoader_loader_;
  return (id)IOSClass_forName_initialize_classLoader_(a3, 0, v4);
}

- (id)getParent
{
  return self->parent_;
}

- (id)getResourceWithNSString:(id)a3
{
  parent = self->parent_;
  if (!parent) {
    JreThrowNullPointerException();
  }
  id result = -[JavaLangClassLoader getResourceWithNSString:](parent, "getResourceWithNSString:");
  if (!result)
  {
    return [(JavaLangClassLoader *)self findResourceWithNSString:a3];
  }
  return result;
}

- (id)getResourcesWithNSString:(id)a3
{
  parent = self->parent_;
  if (!parent) {
    JreThrowNullPointerException();
  }
  v5 = new_JavaLangTwoEnumerationsInOne_initWithJavaUtilEnumeration_withJavaUtilEnumeration_(-[JavaLangClassLoader getResourcesWithNSString:](parent, "getResourcesWithNSString:"), [(JavaLangClassLoader *)self findResourcesWithNSString:a3]);
  return v5;
}

- (id)getResourceAsStreamWithNSString:(id)a3
{
  id result = [(JavaLangClassLoader *)self getResourceWithNSString:a3];
  if (result) {
    return [result openStream];
  }
  return result;
}

- (id)loadClassWithNSString:(id)a3
{
  return [(JavaLangClassLoader *)self loadClassWithNSString:a3 withBoolean:0];
}

- (id)loadClassWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  id result = sub_1001886A4((uint64_t)a3);
  if (!result)
  {
    parent = self->parent_;
    if (!parent) {
      JreThrowNullPointerException();
    }
    id result = [(JavaLangClassLoader *)parent loadClassWithNSString:a3 withBoolean:0];
    if (!result)
    {
      return [(JavaLangClassLoader *)self findClassWithNSString:a3];
    }
  }
  return result;
}

- (id)findResourceWithNSString:(id)a3
{
  return 0;
}

- (id)findLibraryWithNSString:(id)a3
{
  return 0;
}

- (id)getPackageWithNSString:(id)a3
{
  packages = self->packages_;
  objc_sync_enter(packages);
  v6 = self->packages_;
  if (!v6) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilMap *)v6 getWithId:a3];
  objc_sync_exit(packages);
  return v7;
}

- (id)getPackages
{
  packages = self->packages_;
  objc_sync_enter(packages);
  uint64_t v4 = self->packages_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilMap *)v4 values];
  v6 = v5;
  if (!v5) {
    JreThrowNullPointerException();
  }
  id v7 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", (int)[v5 size], JavaLangPackage_class_());
  [v6 toArrayWithNSObjectArray:v7];
  objc_sync_exit(packages);
  return v7;
}

- (id)definePackageWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9 withJavaNetURL:(id)a10
{
  v10 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"new package definitions unsupported");
  objc_exception_throw(v10);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangClassLoader;
  [(JavaLangClassLoader *)&v3 dealloc];
}

+ (id)__annotations_defineClassWithByteArray_withInt_withInt_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040B0A8;
}

@end