@interface LibcoreIoGaiException
+ (const)__metadata;
- (LibcoreIoGaiException)initWithNSString:(id)a3 withInt:(int)a4;
- (LibcoreIoGaiException)initWithNSString:(id)a3 withInt:(int)a4 withJavaLangThrowable:(id)a5;
- (id)getMessage;
- (id)rethrowAsUnknownHostException;
- (id)rethrowAsUnknownHostExceptionWithNSString:(id)a3;
- (void)dealloc;
@end

@implementation LibcoreIoGaiException

- (LibcoreIoGaiException)initWithNSString:(id)a3 withInt:(int)a4
{
  *(&self->super.super.super.rawFrameCount + 1) = a4;
  return self;
}

- (LibcoreIoGaiException)initWithNSString:(id)a3 withInt:(int)a4 withJavaLangThrowable:(id)a5
{
  *(&self->super.super.super.rawFrameCount + 1) = a4;
  return self;
}

- (id)getMessage
{
  if (!LibcoreIoOsConstants_gaiNameWithInt_(*(&self->super.super.super.rawFrameCount + 1))) {
    JreStrcat("$I", v3, v4, v5, v6, v7, v8, v9, @"GAI_ error ");
  }
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  objc_msgSend((id)LibcoreIoLibcore_os_, "gai_strerrorWithInt:", *(&self->super.super.super.rawFrameCount + 1));
  return (id)JreStrcat("$$$$$C", v10, v11, v12, v13, v14, v15, v16, *(id *)&self->error_);
}

- (id)rethrowAsUnknownHostExceptionWithNSString:(id)a3
{
  uint64_t v4 = new_JavaNetUnknownHostException_initWithNSString_((uint64_t)a3);
  [(JavaLangThrowable *)v4 initCauseWithJavaLangThrowable:self];
  objc_exception_throw(v4);
}

- (id)rethrowAsUnknownHostException
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreIoGaiException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040CF88;
}

@end