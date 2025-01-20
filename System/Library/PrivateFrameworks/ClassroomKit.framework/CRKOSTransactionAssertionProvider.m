@interface CRKOSTransactionAssertionProvider
- (CRKOSTransactionAssertionProvider)initWithReverseDNSReason:(id)a3 primitives:(id)a4;
- (CRKOSTransactionPrimitives)primitives;
- (NSString)reason;
- (id)acquireAssertion;
@end

@implementation CRKOSTransactionAssertionProvider

- (CRKOSTransactionAssertionProvider)initWithReverseDNSReason:(id)a3 primitives:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKOSTransactionAssertionProvider;
  v8 = [(CRKOSTransactionAssertionProvider *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    objc_storeStrong((id *)&v8->_primitives, a4);
  }

  return v8;
}

- (id)acquireAssertion
{
  v3 = [(CRKOSTransactionAssertionProvider *)self primitives];
  v4 = [(CRKOSTransactionAssertionProvider *)self reason];
  v5 = [v3 transactionWithReverseDNSReason:v4];

  id v6 = objc_alloc(MEMORY[0x263F39C78]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__CRKOSTransactionAssertionProvider_acquireAssertion__block_invoke;
  v10[3] = &unk_2646F35C0;
  id v11 = v5;
  id v7 = v5;
  v8 = (void *)[v6 initWithCancellationBlock:v10];

  return v8;
}

uint64_t __53__CRKOSTransactionAssertionProvider_acquireAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (NSString)reason
{
  return self->_reason;
}

- (CRKOSTransactionPrimitives)primitives
{
  return self->_primitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitives, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end