@interface JavaLangSystemClassLoader
+ (const)__metadata;
+ (void)initialize;
- (JavaLangSystemClassLoader)init;
- (id)findClassWithNSString:(id)a3;
- (id)findResourceWithNSString:(id)a3;
- (id)findResourcesWithNSString:(id)a3;
- (id)getResourceWithNSString:(id)a3;
- (id)loadClassWithNSString:(id)a3 withBoolean:(BOOL)a4;
@end

@implementation JavaLangSystemClassLoader

- (JavaLangSystemClassLoader)init
{
  p_packages = &self->super.packages_;
  v4 = new_JavaUtilHashMap_init();
  JreStrongAssignAndConsume((id *)p_packages, v4);
  JreStrongAssign((id *)&self->super.parent_, 0);
  return self;
}

- (id)findClassWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return +[IOSClass forName:initialize:classLoader:](IOSClass, "forName:initialize:classLoader:");
}

- (id)findResourceWithNSString:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [+[NSBundle mainBundle] URLForResource:a3 withExtension:0];
  if (!v3) {
    return 0;
  }
  v4 = [[JavaNetURL alloc] initWithNSString:[(NSURL *)v3 description]];
  return v4;
}

- (id)findResourcesWithNSString:(id)a3
{
  if (a3)
  {
    v4 = objc_alloc_init(JavaUtilArrayList);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = +[NSBundle allBundles];
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) URLForResource:a3 withExtension:0];
          if (v10) {
            -[JavaUtilArrayList addWithId:](v4, "addWithId:", -[JavaNetURL initWithNSString:]([JavaNetURL alloc], "initWithNSString:", [v10 description]));
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
    return JavaUtilCollections_enumerationWithJavaUtilCollection_(v4);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)JavaLangSystemClassLoader;
    return -[JavaLangClassLoader findResourcesWithNSString:](&v16, "findResourcesWithNSString:");
  }
}

- (id)loadClassWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  objc_sync_enter(self);
  id v6 = [(JavaLangSystemClassLoader *)self findClassWithNSString:a3];
  objc_sync_exit(self);
  return v6;
}

- (id)getResourceWithNSString:(id)a3
{
  return [(JavaLangSystemClassLoader *)self findResourceWithNSString:a3];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaLangSystemClassLoader_init();
    JreStrongAssignAndConsume((id *)&JavaLangSystemClassLoader_loader_, v2);
    atomic_store(1u, (unsigned __int8 *)&JavaLangSystemClassLoader__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040B410;
}

@end