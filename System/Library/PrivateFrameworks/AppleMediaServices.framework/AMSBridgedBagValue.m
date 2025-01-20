@interface AMSBridgedBagValue
- (AMSBridgedBagValue)initWithKey:(id)a3 valueType:(unint64_t)a4 valuePromise:(id)a5;
- (AMSBridgedBagValue)valueWithCompletion:(id)a3;
- (AMSPromise)valuePromise;
- (void)setValuePromise:(id)a3;
@end

@implementation AMSBridgedBagValue

- (AMSPromise)valuePromise
{
  return self->_valuePromise;
}

- (AMSBridgedBagValue)initWithKey:(id)a3 valueType:(unint64_t)a4 valuePromise:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AMSBridgedBagValue;
  v10 = [(AMSFrozenBagValue *)&v13 initWithKey:a3 value:0 valueType:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_valuePromise, a5);
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (AMSBridgedBagValue)valueWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(AMSBridgedBagValue *)self valuePromise];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__AMSBridgedBagValue_valueWithCompletion___block_invoke;
  v8[3] = &unk_1E55A07F0;
  id v6 = v4;
  id v9 = v6;
  [v5 addFinishBlock:v8];

  return result;
}

uint64_t __42__AMSBridgedBagValue_valueWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setValuePromise:(id)a3
{
}

@end