@interface JavaUtilServiceLoader
+ (const)__metadata;
+ (id)loadFromSystemPropertyWithIOSClass:(id)a3;
+ (id)loadInstalledWithIOSClass:(id)a3;
+ (id)load__WithIOSClass:(id)a3;
+ (id)load__WithIOSClass:(id)a3 withJavaLangClassLoader:(id)a4;
- (JavaUtilServiceLoader)initWithIOSClass:(id)a3 withJavaLangClassLoader:(id)a4;
- (NSString)description;
- (id)internalLoad;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation JavaUtilServiceLoader

- (JavaUtilServiceLoader)initWithIOSClass:(id)a3 withJavaLangClassLoader:(id)a4
{
  return self;
}

- (id)internalLoad
{
  v2 = *(void **)(a1 + 24);
  if (!v2) {
    JreThrowNullPointerException();
  }
  [v2 clear];
  v3 = *(void **)(a1 + 8);
  if (!v3
    || ([v3 getName],
        CFStringRef v11 = JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, @"META-INF/services/"),
        (v12 = *(void **)(a1 + 16)) == 0))
  {
    JreThrowNullPointerException();
  }
  return objc_msgSend(*(id *)(a1 + 24), "addAllWithJavaUtilCollection:", JavaUtilCollections_listWithJavaUtilEnumeration_(objc_msgSend(v12, "getResourcesWithNSString:", v11)));
}

- (id)iterator
{
  v3 = [JavaUtilServiceLoader_ServiceIterator alloc];
  sub_10025C94C((uint64_t)v3, (uint64_t)self);
  return v3;
}

+ (id)load__WithIOSClass:(id)a3 withJavaLangClassLoader:(id)a4
{
  return JavaUtilServiceLoader_load__WithIOSClass_withJavaLangClassLoader_(a3, a4);
}

+ (id)load__WithIOSClass:(id)a3
{
  uint64_t v4 = JavaLangThread_currentThread();
  if (!v4) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaLangThread *)v4 getContextClassLoader];
  return JavaUtilServiceLoader_load__WithIOSClass_withJavaLangClassLoader_(a3, v5);
}

+ (id)loadInstalledWithIOSClass:(id)a3
{
  return JavaUtilServiceLoader_loadInstalledWithIOSClass_(a3);
}

+ (id)loadFromSystemPropertyWithIOSClass:(id)a3
{
  return JavaUtilServiceLoader_loadFromSystemPropertyWithIOSClass_(a3);
}

- (NSString)description
{
  service = self->service_;
  if (!service) {
    JreThrowNullPointerException();
  }
  [(IOSClass *)service getName];
  return (NSString *)JreStrcat("$$", v3, v4, v5, v6, v7, v8, v9, @"ServiceLoader for ");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilServiceLoader;
  [(JavaUtilServiceLoader *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046A768;
}

@end