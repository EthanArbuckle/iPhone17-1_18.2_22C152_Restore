@interface __HMFThreadContext
+ (__HMFThreadContext)currentContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldRestoreVoucher;
- (NSThread)thread;
- (OS_voucher)voucher;
- (__HMFThreadContext)init;
- (id)__init;
- (id)description;
- (unint64_t)count;
- (unint64_t)hash;
- (void)setCount:(unint64_t)a3;
- (void)setShouldRestoreVoucher:(BOOL)a3;
- (void)setVoucher:(id)a3;
@end

@implementation __HMFThreadContext

- (unint64_t)hash
{
  return [(NSThread *)self->_thread hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (__HMFThreadContext *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6) {
      char v7 = [(NSThread *)self->_thread isEqual:v6->_thread];
    }
    else {
      char v7 = 0;
    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_thread, 0);
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)count
{
  return self->_count;
}

+ (__HMFThreadContext)currentContext
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "__init");
  v4 = (void *)v3;
  if (v3)
  {
    objc_storeStrong((id *)(v3 + 16), v2);
    uint64_t v5 = voucher_copy();
    v6 = (void *)v4[4];
    v4[4] = v5;
  }
  return (__HMFThreadContext *)v4;
}

- (id)__init
{
  v3.receiver = self;
  v3.super_class = (Class)__HMFThreadContext;
  return [(__HMFThreadContext *)&v3 init];
}

- (void)setVoucher:(id)a3
{
}

- (void)setShouldRestoreVoucher:(BOOL)a3
{
  self->_shouldRestoreVoucher = a3;
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (BOOL)shouldRestoreVoucher
{
  return self->_shouldRestoreVoucher;
}

- (__HMFThreadContext)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<Context: Thread = %@, Count = %tu>", self->_thread, self->_count];
}

- (NSThread)thread
{
  return (NSThread *)objc_getProperty(self, a2, 16, 1);
}

@end