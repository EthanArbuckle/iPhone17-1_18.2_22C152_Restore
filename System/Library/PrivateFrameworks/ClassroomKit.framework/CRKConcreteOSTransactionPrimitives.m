@interface CRKConcreteOSTransactionPrimitives
- (id)transactionWithReverseDNSReason:(id)a3;
- (int64_t)transactionCount;
- (void)decrementCount;
- (void)incrementCount;
@end

@implementation CRKConcreteOSTransactionPrimitives

- (int64_t)transactionCount
{
  return (int)atomic_load((unsigned int *)&underlyingTransactionCount);
}

- (id)transactionWithReverseDNSReason:(id)a3
{
  id v4 = a3;
  [(CRKConcreteOSTransactionPrimitives *)self incrementCount];
  objc_initWeak(&location, self);
  v5 = [CRKOSTransactionToken alloc];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__CRKConcreteOSTransactionPrimitives_transactionWithReverseDNSReason___block_invoke;
  v8[3] = &unk_2646F3D40;
  objc_copyWeak(&v9, &location);
  v6 = [(CRKOSTransactionToken *)v5 initWithReason:v4 completionHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __70__CRKConcreteOSTransactionPrimitives_transactionWithReverseDNSReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained decrementCount];
}

- (void)incrementCount
{
}

- (void)decrementCount
{
}

@end