@interface JavaUtilResourceBundle_Control
+ (const)__metadata;
+ (id)getControlWithJavaUtilList:(id)a3;
+ (id)getNoFallbackControlWithJavaUtilList:(id)a3;
+ (void)initialize;
- (BOOL)needsReloadWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withNSString:(id)a5 withJavaLangClassLoader:(id)a6 withJavaUtilResourceBundle:(id)a7 withLong:(int64_t)a8;
- (JavaUtilResourceBundle_Control)init;
- (id)getCandidateLocalesWithNSString:(id)a3 withJavaUtilLocale:(id)a4;
- (id)getFallbackLocaleWithNSString:(id)a3 withJavaUtilLocale:(id)a4;
- (id)getFormatsWithNSString:(id)a3;
- (id)newBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withNSString:(id)a5 withJavaLangClassLoader:(id)a6 withBoolean:(BOOL)a7;
- (id)toBundleNameWithNSString:(id)a3 withJavaUtilLocale:(id)a4;
- (id)toResourceNameWithNSString:(id)a3 withNSString:(id)a4;
- (int64_t)getTimeToLiveWithNSString:(id)a3 withJavaUtilLocale:(id)a4;
- (void)dealloc;
@end

@implementation JavaUtilResourceBundle_Control

- (JavaUtilResourceBundle_Control)init
{
  return self;
}

+ (id)getControlWithJavaUtilList:(id)a3
{
  return (id)JavaUtilResourceBundle_Control_getControlWithJavaUtilList_(a3);
}

+ (id)getNoFallbackControlWithJavaUtilList:(id)a3
{
  return (id)JavaUtilResourceBundle_Control_getNoFallbackControlWithJavaUtilList_(a3);
}

- (id)getCandidateLocalesWithNSString:(id)a3 withJavaUtilLocale:(id)a4
{
  if (!a3)
  {
    CFStringRef v10 = @"baseName == null";
    goto LABEL_16;
  }
  if (!a4)
  {
    CFStringRef v10 = @"locale == null";
LABEL_16:
    v11 = new_JavaLangNullPointerException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  v5 = new_JavaUtilArrayList_init();
  id v6 = [a4 getLanguage];
  id v7 = [a4 getCountry];
  id v8 = [a4 getVariant];
  if (!off_10055E0D8) {
    JreThrowNullPointerException();
  }
  if (([off_10055E0D8 isEqual:v8] & 1) == 0) {
    [(JavaUtilArrayList *)v5 addWithId:new_JavaUtilLocale_initWithNSString_withNSString_withNSString_(v6, v7, v8)];
  }
  if (([off_10055E0D8 isEqual:v7] & 1) == 0) {
    [(JavaUtilArrayList *)v5 addWithId:new_JavaUtilLocale_initWithNSString_withNSString_(v6, v7)];
  }
  if (([off_10055E0D8 isEqual:v6] & 1) == 0) {
    [(JavaUtilArrayList *)v5 addWithId:new_JavaUtilLocale_initWithNSString_(v6)];
  }
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [(JavaUtilArrayList *)v5 addWithId:JavaUtilLocale_ROOT_];
  return v5;
}

- (id)getFormatsWithNSString:(id)a3
{
  if (!a3)
  {
    v4 = new_JavaLangNullPointerException_initWithNSString_(@"baseName == null");
    objc_exception_throw(v4);
  }
  return self->format_;
}

- (id)getFallbackLocaleWithNSString:(id)a3 withJavaUtilLocale:(id)a4
{
  if (!a3)
  {
    CFStringRef v5 = @"baseName == null";
    goto LABEL_10;
  }
  if (!a4)
  {
    CFStringRef v5 = @"locale == null";
LABEL_10:
    id v6 = new_JavaLangNullPointerException_initWithNSString_((uint64_t)v5);
    objc_exception_throw(v6);
  }
  if ((id)JavaUtilLocale_getDefault() == a4) {
    return 0;
  }
  return (id)JavaUtilLocale_getDefault();
}

- (id)newBundleWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withNSString:(id)a5 withJavaLangClassLoader:(id)a6 withBoolean:(BOOL)a7
{
  if (!a5)
  {
    CFStringRef v19 = @"format == null";
LABEL_18:
    v20 = new_JavaLangNullPointerException_initWithNSString_((uint64_t)v19);
    goto LABEL_19;
  }
  if (!a6)
  {
    CFStringRef v19 = @"loader == null";
    goto LABEL_18;
  }
  BOOL v8 = a7;
  id v11 = -[JavaUtilResourceBundle_Control toBundleNameWithNSString:withJavaUtilLocale:](self, "toBundleNameWithNSString:withJavaUtilLocale:", a3);
  if (![a5 isEqual:JavaUtilResourceBundle_Control_JAVACLASS_])
  {
    if ([a5 isEqual:JavaUtilResourceBundle_Control_JAVAPROPERTIES_])
    {
      v14 = sub_100252C0C(v11, @"properties");
      if (v8)
      {
        id v15 = [a6 getResourceWithNSString:v14];
        if (!v15) {
          return 0;
        }
        v16 = new_JavaIoFileInputStream_initWithNSString_([v15 getFile]);
      }
      else
      {
        v16 = (JavaIoFileInputStream *)[a6 getResourceAsStreamWithNSString:v14];
      }
      v17 = v16;
      if (v16)
      {
        v18 = new_JavaIoInputStreamReader_initWithJavaIoInputStream_(v16);
        v13 = new_JavaUtilPropertyResourceBundle_initWithJavaIoReader_((uint64_t)v18);
        JreStrongAssign((id *)&v13->super.locale_, a4);
        [(JavaIoFileInputStream *)v17 close];
        return v13;
      }
      return 0;
    }
    v20 = new_JavaLangIllegalArgumentException_init();
LABEL_19:
    objc_exception_throw(v20);
  }
  id v12 = [a6 loadClassWithNSString:v11];
  if (!v12) {
    return 0;
  }
  v13 = (JavaUtilPropertyResourceBundle *)[v12 newInstance];
  objc_opt_class();
  if (!v13) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign((id *)&v13->super.locale_, a4);
  return v13;
}

- (int64_t)getTimeToLiveWithNSString:(id)a3 withJavaUtilLocale:(id)a4
{
  if (!a3)
  {
    CFStringRef v5 = @"baseName == null";
    goto LABEL_6;
  }
  if (!a4)
  {
    CFStringRef v5 = @"locale == null";
LABEL_6:
    id v6 = new_JavaLangNullPointerException_initWithNSString_((uint64_t)v5);
    objc_exception_throw(v6);
  }
  return -2;
}

- (BOOL)needsReloadWithNSString:(id)a3 withJavaUtilLocale:(id)a4 withNSString:(id)a5 withJavaLangClassLoader:(id)a6 withJavaUtilResourceBundle:(id)a7 withLong:(int64_t)a8
{
  if (!a7)
  {
    v18 = new_JavaLangNullPointerException_initWithNSString_(@"bundle == null");
    objc_exception_throw(v18);
  }
  id v11 = [(JavaUtilResourceBundle_Control *)self toBundleNameWithNSString:a3 withJavaUtilLocale:a4];
  if (!a5
    || ((id v12 = v11, ![a5 isEqual:JavaUtilResourceBundle_Control_JAVACLASS_])
      ? (CFStringRef v13 = (const __CFString *)a5)
      : (CFStringRef v13 = @"class"),
        ![a5 isEqual:JavaUtilResourceBundle_Control_JAVAPROPERTIES_]
      ? (CFStringRef v14 = v13)
      : (CFStringRef v14 = @"properties"),
        id v15 = sub_100252C0C(v12, (uint64_t)v14),
        !a6))
  {
    JreThrowNullPointerException();
  }
  id v16 = [a6 getResourceWithNSString:v15];
  return v16
      && -[JavaIoFile lastModified](new_JavaIoFile_initWithNSString_([v16 getFile]), "lastModified") > a8;
}

- (id)toBundleNameWithNSString:(id)a3 withJavaUtilLocale:(id)a4
{
  if (!a3)
  {
    id v16 = new_JavaLangNullPointerException_initWithNSString_(@"baseName == null");
    objc_exception_throw(v16);
  }
  uint64_t v6 = off_10055E0D8;
  id v7 = (void *)off_10055E0D0;
  BOOL v8 = new_JavaLangStringBuilder_init();
  v9 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v8 appendWithNSString:a3];
  if (!a4) {
    goto LABEL_17;
  }
  id v10 = [a4 getLanguage];
  if (!v10) {
    goto LABEL_17;
  }
  if ([v10 isEqual:v6])
  {
    id v11 = v9;
    id v12 = v7;
  }
  else
  {
    [(JavaLangStringBuilder *)v8 appendWithNSString:v7];
    id v12 = [a4 getLanguage];
    id v11 = v8;
  }
  [(JavaLangStringBuilder *)v11 appendWithNSString:v12];
  id v13 = [a4 getCountry];
  if (!v13) {
    goto LABEL_17;
  }
  if ([v13 isEqual:v6])
  {
    [(JavaLangStringBuilder *)v9 appendWithNSString:v7];
  }
  else
  {
    [(JavaLangStringBuilder *)v8 appendWithJavaLangCharSequence:v9];
    [(JavaLangStringBuilder *)v8 appendWithNSString:v7];
    -[JavaLangStringBuilder appendWithNSString:](v8, "appendWithNSString:", [a4 getCountry]);
    v9 = new_JavaLangStringBuilder_init();
  }
  id v14 = [a4 getVariant];
  if (!v14) {
LABEL_17:
  }
    JreThrowNullPointerException();
  if (([v14 isEqual:v6] & 1) == 0)
  {
    [(JavaLangStringBuilder *)v8 appendWithJavaLangCharSequence:v9];
    [(JavaLangStringBuilder *)v8 appendWithNSString:v7];
    -[JavaLangStringBuilder appendWithNSString:](v8, "appendWithNSString:", [a4 getVariant]);
  }
  return [(JavaLangStringBuilder *)v8 description];
}

- (id)toResourceNameWithNSString:(id)a3 withNSString:(id)a4
{
  return sub_100252C0C(a3, (uint64_t)a4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilResourceBundle_Control;
  [(JavaUtilResourceBundle_Control *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilArrayList_init();
    JreStrongAssignAndConsume((id *)&JavaUtilResourceBundle_Control_listDefault_, v2);
    objc_super v3 = new_JavaUtilArrayList_init();
    JreStrongAssignAndConsume((id *)&JavaUtilResourceBundle_Control_listClass_, v3);
    v4 = new_JavaUtilArrayList_init();
    JreStrongAssignAndConsume((id *)&JavaUtilResourceBundle_Control_listProperties_, v4);
    [(id)JavaUtilResourceBundle_Control_listDefault_ addWithId:JavaUtilResourceBundle_Control_JAVACLASS_];
    [(id)JavaUtilResourceBundle_Control_listDefault_ addWithId:JavaUtilResourceBundle_Control_JAVAPROPERTIES_];
    [(id)JavaUtilResourceBundle_Control_listClass_ addWithId:JavaUtilResourceBundle_Control_JAVACLASS_];
    [(id)JavaUtilResourceBundle_Control_listProperties_ addWithId:JavaUtilResourceBundle_Control_JAVAPROPERTIES_];
    CFStringRef v5 = JavaUtilCollections_unmodifiableListWithJavaUtilList_((void *)JavaUtilResourceBundle_Control_listDefault_);
    JreStrongAssign((id *)&JavaUtilResourceBundle_Control_FORMAT_DEFAULT_, v5);
    uint64_t v6 = JavaUtilCollections_unmodifiableListWithJavaUtilList_((void *)JavaUtilResourceBundle_Control_listClass_);
    JreStrongAssign((id *)&JavaUtilResourceBundle_Control_FORMAT_CLASS_, v6);
    id v7 = JavaUtilCollections_unmodifiableListWithJavaUtilList_((void *)JavaUtilResourceBundle_Control_listProperties_);
    JreStrongAssign((id *)&JavaUtilResourceBundle_Control_FORMAT_PROPERTIES_, v7);
    uint64_t v8 = JavaUtilResourceBundle_Control_JAVAPROPERTIES_;
    v9 = [JavaUtilResourceBundle_SimpleControl alloc];
    sub_100253150((uint64_t)v9, v8);
    JreStrongAssignAndConsume((id *)&qword_100561220, v9);
    uint64_t v10 = JavaUtilResourceBundle_Control_JAVACLASS_;
    id v11 = [JavaUtilResourceBundle_SimpleControl alloc];
    sub_100253150((uint64_t)v11, v10);
    JreStrongAssignAndConsume((id *)&qword_100561228, v11);
    id v12 = [JavaUtilResourceBundle_Control alloc];
    JavaUtilResourceBundle_Control_init((uint64_t)v12);
    JreStrongAssignAndConsume((id *)&qword_100561230, v12);
    atomic_store(1u, (unsigned __int8 *)JavaUtilResourceBundle_Control__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100466898;
}

@end