@interface LibcoreIoErrnoException
+ (const)__metadata;
- (LibcoreIoErrnoException)initWithNSString:(id)a3 withInt:(int)a4;
- (LibcoreIoErrnoException)initWithNSString:(id)a3 withInt:(int)a4 withJavaLangThrowable:(id)a5;
- (id)getMessage;
- (id)rethrowAsIOException;
- (id)rethrowAsSocketException;
- (void)dealloc;
@end

@implementation LibcoreIoErrnoException

- (LibcoreIoErrnoException)initWithNSString:(id)a3 withInt:(int)a4
{
  *(&self->super.super.rawFrameCount + 1) = a4;
  return self;
}

- (LibcoreIoErrnoException)initWithNSString:(id)a3 withInt:(int)a4 withJavaLangThrowable:(id)a5
{
  *(&self->super.super.rawFrameCount + 1) = a4;
  return self;
}

- (id)getMessage
{
  if (!LibcoreIoOsConstants_errnoNameWithInt_(*(&self->super.super.rawFrameCount + 1))) {
    JreStrcat("$I", v3, v4, v5, v6, v7, v8, v9, @"errno ");
  }
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ strerrorWithInt:*(&self->super.super.rawFrameCount + 1)];
  return (id)JreStrcat("$$$$$C", v10, v11, v12, v13, v14, v15, v16, *(id *)&self->errno__);
}

- (id)rethrowAsIOException
{
  uint64_t v3 = new_JavaIoIOException_initWithNSString_((uint64_t)[(LibcoreIoErrnoException *)self getMessage]);
  [(JavaLangThrowable *)v3 initCauseWithJavaLangThrowable:self];
  objc_exception_throw(v3);
}

- (id)rethrowAsSocketException
{
  v2 = new_JavaNetSocketException_initWithNSString_withJavaLangThrowable_((uint64_t)[(LibcoreIoErrnoException *)self getMessage], (uint64_t)self);
  objc_exception_throw(v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreIoErrnoException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10048A878;
}

@end