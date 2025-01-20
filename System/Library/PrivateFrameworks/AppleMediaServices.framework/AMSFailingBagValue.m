@interface AMSFailingBagValue
- (AMSFailingBagValue)initWithKey:(id)a3 valueType:(unint64_t)a4 error:(id)a5;
- (AMSFailingBagValue)valueWithCompletion:(id)a3;
- (NSError)error;
- (void)setError:(id)a3;
@end

@implementation AMSFailingBagValue

- (AMSFailingBagValue)valueWithCompletion:(id)a3
{
  id v5 = a3;
  id v7 = [(AMSFailingBagValue *)self error];
  (*((void (**)(id, void, void, id))a3 + 2))(v5, 0, 0, v7);

  return result;
}

- (NSError)error
{
  return self->_error;
}

- (AMSFailingBagValue)initWithKey:(id)a3 valueType:(unint64_t)a4 error:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AMSFailingBagValue;
  v10 = [(AMSFrozenBagValue *)&v13 initWithKey:a3 value:0 valueType:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_error, a5);
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (void)setError:(id)a3
{
}

@end