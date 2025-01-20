@interface AMSPromiseResult
- (AMSPromiseResult)initWithResult:(id)a3 error:(id)a4;
- (NSError)error;
- (id)result;
- (void)setError:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation AMSPromiseResult

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (id)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (AMSPromiseResult)initWithResult:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSPromiseResult;
  v9 = [(AMSPromiseResult *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_result, a3);
    uint64_t v11 = [v8 copy];
    error = v10->_error;
    v10->_error = (NSError *)v11;
  }
  return v10;
}

- (void)setError:(id)a3
{
}

- (void)setResult:(id)a3
{
}

@end