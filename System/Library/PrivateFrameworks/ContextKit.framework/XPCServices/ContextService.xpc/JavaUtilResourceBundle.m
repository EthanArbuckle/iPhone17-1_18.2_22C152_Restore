@interface JavaUtilResourceBundle
+ (const)__metadata;
+ (id)getBundleWithNSString:(id)a3;
+ (id)getBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4;
+ (id)getBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withJavaLangClassLoader:(id)a5;
+ (id)getBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withJavaLangClassLoader:(id)a5 withJavaUtilResourceBundle_Control:(id)a6;
+ (id)getBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withJavaUtilResourceBundle_Control:(id)a5;
+ (id)getBundleWithNSString:(id)a3 withJavaUtilResourceBundle_Control:(id)a4;
+ (id)getLoader;
+ (id)getLoaderCacheWithId:(id)a3;
+ (id)handleGetBundleWithBoolean:(BOOL)a3 withNSString:(id)a4 withJavaUtilLocale:(id)a5 withJavaLangClassLoader:(id)a6;
+ (id)missingResourceExceptionWithNSString:(id)a3 withNSString:(id)a4;
+ (id)processGetBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withJavaLangClassLoader:(id)a5 withJavaUtilResourceBundle_Control:(id)a6 withBoolean:(BOOL)a7 withJavaUtilResourceBundle:(id)a8;
+ (id)stripWithJavaUtilLocale:(id)a3;
+ (void)clearCacheWithJavaLangClassLoader:(id)a3;
+ (void)initialize;
- (BOOL)containsKeyWithNSString:(id)a3;
- (JavaUtilResourceBundle)init;
- (id)getKeys;
- (id)getLocale;
- (id)getObjectWithNSString:(id)a3;
- (id)getStringArrayWithNSString:(id)a3;
- (id)getStringWithNSString:(id)a3;
- (id)handleGetObjectWithNSString:(id)a3;
- (id)handleKeySet;
- (id)keySet;
- (void)dealloc;
- (void)setLocaleWithJavaUtilLocale:(id)a3;
- (void)setParentWithJavaUtilResourceBundle:(id)a3;
@end

@implementation JavaUtilResourceBundle

- (JavaUtilResourceBundle)init
{
  self->lastLoadTime_ = 0;
  return self;
}

+ (id)getBundleWithNSString:(id)a3
{
  return JavaUtilResourceBundle_getBundleWithNSString_((__CFString *)a3);
}

+ (id)getBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4
{
  return JavaUtilResourceBundle_getBundleWithNSString_withJavaUtilLocale_((__CFString *)a3, (JavaUtilLocale *)a4);
}

+ (id)getBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withJavaLangClassLoader:(id)a5
{
  return JavaUtilResourceBundle_getBundleWithNSString_withJavaUtilLocale_withJavaLangClassLoader_((__CFString *)a3, (JavaUtilLocale *)a4, (__CFString *)a5);
}

+ (id)missingResourceExceptionWithNSString:(id)a3 withNSString:(id)a4
{
  sub_100251300(a3, a4, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
}

+ (id)getBundleWithNSString:(id)a3 withJavaUtilResourceBundle_Control:(id)a4
{
  return JavaUtilResourceBundle_getBundleWithNSString_withJavaUtilResourceBundle_Control_((uint64_t)a3, a4);
}

+ (id)getBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withJavaUtilResourceBundle_Control:(id)a5
{
  return JavaUtilResourceBundle_getBundleWithNSString_withJavaUtilLocale_withJavaUtilResourceBundle_Control_((uint64_t)a3, (uint64_t)a4, a5);
}

+ (id)getBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withJavaLangClassLoader:(id)a5 withJavaUtilResourceBundle_Control:(id)a6
{
  return JavaUtilResourceBundle_getBundleWithNSString_withJavaUtilLocale_withJavaLangClassLoader_withJavaUtilResourceBundle_Control_((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6);
}

+ (id)processGetBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withJavaLangClassLoader:(id)a5 withJavaUtilResourceBundle_Control:(id)a6 withBoolean:(BOOL)a7 withJavaUtilResourceBundle:(id)a8
{
  return (id)sub_10025163C((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, (uint64_t)a8);
}

- (id)getKeys
{
  return 0;
}

- (id)getLocale
{
  return self->locale_;
}

- (id)getObjectWithNSString:(id)a3
{
  return sub_100251ABC(self, a3);
}

- (id)getStringWithNSString:(id)a3
{
  id v3 = sub_100251ABC(self, a3);
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v3;
}

- (id)getStringArrayWithNSString:(id)a3
{
  id v3 = sub_100251ABC(self, a3);
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v3;
}

+ (id)handleGetBundleWithBoolean:(BOOL)a3 withNSString:(id)a4 withJavaUtilLocale:(id)a5 withJavaLangClassLoader:(id)a6
{
  return sub_100251BBC(a3, (__CFString *)a4, (JavaUtilLocale *)a5, (__CFString *)a6);
}

+ (id)getLoaderCacheWithId:(id)a3
{
  return sub_100251F74((uint64_t)a3);
}

- (id)handleGetObjectWithNSString:(id)a3
{
  return 0;
}

- (void)setParentWithJavaUtilResourceBundle:(id)a3
{
}

+ (id)stripWithJavaUtilLocale:(id)a3
{
  return sub_10025205C(a3);
}

- (void)setLocaleWithJavaUtilLocale:(id)a3
{
}

+ (void)clearCacheWithJavaLangClassLoader:(id)a3
{
}

- (BOOL)containsKeyWithNSString:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = new_JavaLangNullPointerException_initWithNSString_(@"key == null");
    objc_exception_throw(v6);
  }
  id v4 = [(JavaUtilResourceBundle *)self keySet];
  if (!v4) {
    JreThrowNullPointerException();
  }
  return [v4 containsWithId:a3];
}

- (id)keySet
{
  id v3 = new_JavaUtilHashSet_init();
  id v4 = [(JavaUtilResourceBundle *)self getKeys];
  if (!v4) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = v4;
  if ([v4 hasMoreElements])
  {
    do
      -[JavaUtilHashSet addWithId:](v3, "addWithId:", [v5 nextElement]);
    while (([v5 hasMoreElements] & 1) != 0);
  }
  return v3;
}

- (id)handleKeySet
{
  id v3 = [(JavaUtilResourceBundle *)self keySet];
  id v4 = new_JavaUtilHashSet_init();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (!v3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = v4;
  id v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (-[JavaUtilResourceBundle handleGetObjectWithNSString:](self, "handleGetObjectWithNSString:", v10, (void)v12))
        {
          [(JavaUtilHashSet *)v5 addWithId:v10];
        }
      }
      id v7 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilResourceBundle;
  [(JavaUtilResourceBundle *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaUtilResourceBundle_MissingBundle alloc];
    v2->super.lastLoadTime_ = 0;
    JreStrongAssignAndConsume((id *)&qword_1005611F0, v2);
    objc_super v3 = [JavaUtilResourceBundle_MissingBundle alloc];
    v3->super.lastLoadTime_ = 0;
    JreStrongAssignAndConsume((id *)&qword_1005611F8, v3);
    id v4 = new_JavaUtilWeakHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100561200, v4);
    Default = (void *)JavaUtilLocale_getDefault();
    JreStrongAssign((id *)&qword_100561208, Default);
    atomic_store(1u, (unsigned __int8 *)&JavaUtilResourceBundle__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004661E8;
}

+ (id)getLoader
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilResourceBundle__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = [(id)JavaUtilResourceBundle_class_() getClassLoader];
  if (!result)
  {
    return (id)JavaLangClassLoader_getSystemClassLoader();
  }
  return result;
}

@end