@interface LibcoreIcuLocaleData
+ (BOOL)initLocaleDataImplWithNSString:(id)a3 withLibcoreIcuLocaleData:(id)a4;
+ (const)__metadata;
+ (id)getWithJavaUtilLocale:(id)a3;
+ (id)initLocaleDataWithJavaUtilLocale:(id)a3;
+ (void)initialize;
- (LibcoreIcuLocaleData)init;
- (id)getDateFormatWithInt:(int)a3;
- (id)getTimeFormatWithInt:(int)a3;
- (void)dealloc;
@end

@implementation LibcoreIcuLocaleData

- (LibcoreIcuLocaleData)init
{
  self->patternSeparator_ = 59;
  return self;
}

+ (id)getWithJavaUtilLocale:(id)a3
{
  return LibcoreIcuLocaleData_getWithJavaUtilLocale_(a3);
}

- (id)getDateFormatWithInt:(int)a3
{
  if (a3 >= 4)
  {
    v4 = new_JavaLangAssertionError_init();
    objc_exception_throw(v4);
  }
  return (id)*((void *)&self->fullDateFormat_ + a3);
}

- (id)getTimeFormatWithInt:(int)a3
{
  if (a3 >= 4)
  {
    v4 = new_JavaLangAssertionError_init();
    objc_exception_throw(v4);
  }
  return (id)*((void *)&self->fullTimeFormat_ + a3);
}

+ (id)initLocaleDataWithJavaUtilLocale:(id)a3
{
  return sub_100181FAC(a3);
}

+ (BOOL)initLocaleDataImplWithNSString:(id)a3 withLibcoreIcuLocaleData:(id)a4
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreIcuLocaleData;
  [(LibcoreIcuLocaleData *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_1005609C0, v2);
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    LibcoreIcuLocaleData_getWithJavaUtilLocale_((void *)JavaUtilLocale_ROOT_);
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    LibcoreIcuLocaleData_getWithJavaUtilLocale_((void *)JavaUtilLocale_US_);
    Default = (void *)JavaUtilLocale_getDefault();
    LibcoreIcuLocaleData_getWithJavaUtilLocale_(Default);
    atomic_store(1u, (unsigned __int8 *)LibcoreIcuLocaleData__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100408838;
}

@end