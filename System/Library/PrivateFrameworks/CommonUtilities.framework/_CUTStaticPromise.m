@interface _CUTStaticPromise
- (CUTResult)result;
- (_CUTStaticPromise)initWithResult:(id)a3 safe:(BOOL)a4;
- (id)then:(id)a3;
- (void)registerResultBlock:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation _CUTStaticPromise

- (_CUTStaticPromise)initWithResult:(id)a3 safe:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CUTStaticPromise;
  v8 = [(CUTUnsafePromise *)&v11 _init];
  v9 = (_CUTStaticPromise *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 1, a3);
    v9->_safe = a4;
  }

  return v9;
}

- (void)registerResultBlock:(id)a3
{
}

- (id)then:(id)a3
{
  if (self->_safe) {
    sub_1A3561BA4(self, a3);
  }
  else {
  v3 = sub_1A35618E4(self, a3);
  }
  return v3;
}

- (CUTResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end