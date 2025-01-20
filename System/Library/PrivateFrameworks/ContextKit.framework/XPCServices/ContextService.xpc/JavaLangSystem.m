@interface JavaLangSystem
+ (const)__metadata;
+ (id)clearPropertyWithNSString:(id)a3;
+ (id)getPropertyWithNSString:(id)a3;
+ (id)getPropertyWithNSString:(id)a3 withNSString:(id)a4;
+ (id)getSecurityManager;
+ (id)getenvWithNSString:(id)a3;
+ (id)lineSeparator;
+ (id)setPropertyWithNSString:(id)a3 withNSString:(id)a4;
+ (int)identityHashCodeWithId:(id)a3;
+ (uint64_t)setTimeInfoConsts;
+ (void)arraycopyWithId:(id)a3 withInt:(int)a4 withId:(id)a5 withInt:(int)a6 withInt:(int)a7;
+ (void)exitWithInt:(int)a3;
+ (void)initialize;
+ (void)loadLibraryWithNSString:(id)a3;
+ (void)load__WithNSString:(id)a3;
+ (void)logEWithNSString:(id)a3;
+ (void)logEWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
+ (void)logIWithNSString:(id)a3;
+ (void)logIWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
+ (void)logWWithNSString:(id)a3;
+ (void)logWWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
+ (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withJavaLangThrowable:(id)a5;
+ (void)runFinalization;
+ (void)runFinalizersOnExitWithBoolean:(BOOL)a3;
+ (void)setErrWithJavaIoPrintStream:(id)a3;
+ (void)setInWithJavaIoInputStream:(id)a3;
+ (void)setOutWithJavaIoPrintStream:(id)a3;
+ (void)setPropertiesWithJavaUtilProperties:(id)a3;
@end

@implementation JavaLangSystem

+ (void)setInWithJavaIoInputStream:(id)a3
{
}

+ (void)setOutWithJavaIoPrintStream:(id)a3
{
}

+ (void)setErrWithJavaIoPrintStream:(id)a3
{
}

+ (int)identityHashCodeWithId:(id)a3
{
  int v3 = (int)a3;
  if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return v3;
}

+ (void)arraycopyWithId:(id)a3 withInt:(int)a4 withId:(id)a5 withInt:(int)a6 withInt:(int)a7
{
}

+ (void)exitWithInt:(int)a3
{
}

+ (id)getPropertyWithNSString:(id)a3
{
  return JavaLangSystem_getPropertyWithNSString_((uint64_t)a3);
}

+ (id)getPropertyWithNSString:(id)a3 withNSString:(id)a4
{
  return JavaLangSystem_getPropertyWithNSString_withNSString_((uint64_t)a3, (uint64_t)a4);
}

+ (id)setPropertyWithNSString:(id)a3 withNSString:(id)a4
{
  return JavaLangSystem_setPropertyWithNSString_withNSString_((uint64_t)a3, (uint64_t)a4);
}

+ (void)setPropertiesWithJavaUtilProperties:(id)a3
{
}

+ (id)clearPropertyWithNSString:(id)a3
{
  return JavaLangSystem_clearPropertyWithNSString_((uint64_t)a3);
}

+ (id)getenvWithNSString:(id)a3
{
  return JavaLangSystem_getenvWithNSString_(a3);
}

+ (id)getSecurityManager
{
  if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 0;
}

+ (id)lineSeparator
{
  if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return @"\n";
}

+ (void)load__WithNSString:(id)a3
{
}

+ (void)loadLibraryWithNSString:(id)a3
{
}

+ (void)runFinalization
{
  if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
}

+ (void)runFinalizersOnExitWithBoolean:(BOOL)a3
{
  if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
}

+ (void)logEWithNSString:(id)a3
{
}

+ (void)logEWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
}

+ (void)logIWithNSString:(id)a3
{
}

+ (void)logIWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
}

+ (void)logWWithNSString:(id)a3
{
}

+ (void)logWWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
}

+ (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withJavaLangThrowable:(id)a5
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(JavaIoFileDescriptor__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v2 = new_JavaIoFileOutputStream_initWithJavaIoFileDescriptor_((void *)JavaIoFileDescriptor_err_);
    int v3 = new_JavaIoPrintStream_initWithJavaIoOutputStream_(v2);
    JreStrongAssignAndConsume((id *)&JavaLangSystem_err_, v3);
    if ((atomic_load_explicit(JavaIoFileDescriptor__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v4 = new_JavaIoFileOutputStream_initWithJavaIoFileDescriptor_((void *)JavaIoFileDescriptor_out_);
    v5 = new_JavaIoPrintStream_initWithJavaIoOutputStream_(v4);
    JreStrongAssignAndConsume((id *)&JavaLangSystem_out_, v5);
    if ((atomic_load_explicit(JavaIoFileDescriptor__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v6 = new_JavaIoFileInputStream_initWithJavaIoFileDescriptor_((void *)JavaIoFileDescriptor_in_);
    v7 = new_JavaIoBufferedInputStream_initWithJavaIoInputStream_(v6);
    JreStrongAssignAndConsume(&JavaLangSystem_in_, v7);
    +[JavaLangSystem setTimeInfoConsts]_0();
    atomic_store(1u, (unsigned __int8 *)JavaLangSystem__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100415E00;
}

+ (uint64_t)setTimeInfoConsts
{
  if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return mach_timebase_info((mach_timebase_info_t)&dword_100560A68);
}

@end