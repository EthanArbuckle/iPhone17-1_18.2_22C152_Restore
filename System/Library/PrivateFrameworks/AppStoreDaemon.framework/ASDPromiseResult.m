@interface ASDPromiseResult
+ (id)resultWithError:(id)a3;
+ (id)resultWithValue:(id)a3;
- (ASDPromiseResult)init;
- (NSError)error;
- (id)_initWithValue:(void *)a3 error:;
- (id)value;
@end

@implementation ASDPromiseResult

+ (id)resultWithValue:(id)a3
{
  id v3 = a3;
  v4 = -[ASDPromiseResult _initWithValue:error:]((id *)[ASDPromiseResult alloc], v3, 0);

  return v4;
}

- (id)_initWithValue:(void *)a3 error:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)ASDPromiseResult;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      if (v6)
      {
        v9 = v8 + 2;
        v10 = a2;
      }
      else
      {
        if (!v7)
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PromiseResult must represent either a value or an error"];
          goto LABEL_8;
        }
        v9 = v8 + 1;
        v10 = a3;
      }
      objc_storeStrong(v9, v10);
    }
  }
LABEL_8:

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

+ (id)resultWithError:(id)a3
{
  id v3 = a3;
  v4 = -[ASDPromiseResult _initWithValue:error:]((id *)[ASDPromiseResult alloc], 0, v3);

  return v4;
}

- (ASDPromiseResult)init
{
  return (ASDPromiseResult *)-[ASDPromiseResult _initWithValue:error:]((id *)&self->super.isa, 0, 0);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

@end