@interface JavaLangThread_SystemUncaughtExceptionHandler
+ (const)__metadata;
- (void)uncaughtExceptionWithJavaLangThread:(id)a3 withJavaLangThrowable:(id)a4;
@end

@implementation JavaLangThread_SystemUncaughtExceptionHandler

- (void)uncaughtExceptionWithJavaLangThread:(id)a3 withJavaLangThrowable:(id)a4
{
  objc_sync_enter(self);
  if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v7 = (void *)JavaLangSystem_err_;
  if (JavaLangSystem_err_) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || ([a3 getName],
        objc_msgSend(v7, "printWithNSString:", JreStrcat("$$$", v9, v10, v11, v12, v13, v14, v15, @"Exception in thread \"")), !a4))
  {
    JreThrowNullPointerException();
  }
  if ((atomic_load_explicit(JavaLangSystem__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [a4 printStackTraceWithJavaIoPrintStream:JavaLangSystem_err_];
  objc_sync_exit(self);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047F2E0;
}

@end