@interface JavaUtilResourceBundle_NoFallbackControl
+ (const)__metadata;
+ (void)initialize;
- (JavaUtilResourceBundle_NoFallbackControl)initWithJavaUtilList:(id)a3;
- (JavaUtilResourceBundle_NoFallbackControl)initWithNSString:(id)a3;
- (id)getFallbackLocaleWithNSString:(id)a3 withJavaUtilLocale:(id)a4;
@end

@implementation JavaUtilResourceBundle_NoFallbackControl

- (JavaUtilResourceBundle_NoFallbackControl)initWithNSString:(id)a3
{
  return self;
}

- (JavaUtilResourceBundle_NoFallbackControl)initWithJavaUtilList:(id)a3
{
  return self;
}

- (id)getFallbackLocaleWithNSString:(id)a3 withJavaUtilLocale:(id)a4
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
    v6 = new_JavaLangNullPointerException_initWithNSString_((uint64_t)v5);
    objc_exception_throw(v6);
  }
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(JavaUtilResourceBundle_Control__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v2 = JavaUtilResourceBundle_Control_JAVAPROPERTIES_;
    v3 = [JavaUtilResourceBundle_NoFallbackControl alloc];
    sub_100253150((uint64_t)v3, v2);
    JreStrongAssignAndConsume((id *)&qword_100561240, v3);
    if ((atomic_load_explicit(JavaUtilResourceBundle_Control__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v4 = JavaUtilResourceBundle_Control_JAVACLASS_;
    CFStringRef v5 = [JavaUtilResourceBundle_NoFallbackControl alloc];
    sub_100253150((uint64_t)v5, v4);
    JreStrongAssignAndConsume((id *)&qword_100561238, v5);
    if ((atomic_load_explicit(JavaUtilResourceBundle_Control__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v6 = (void *)JavaUtilResourceBundle_Control_listDefault_;
    v7 = [JavaUtilResourceBundle_NoFallbackControl alloc];
    JavaUtilResourceBundle_Control_init((uint64_t)v7);
    JreStrongAssign((id *)&v7->super.format_, v6);
    JreStrongAssignAndConsume((id *)&qword_100561248, v7);
    atomic_store(1u, (unsigned __int8 *)&JavaUtilResourceBundle_NoFallbackControl__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100466A40;
}

@end