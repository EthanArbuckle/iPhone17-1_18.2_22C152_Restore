@interface CRKOSTransactionToken
- (CRKOSTransactionToken)initWithReason:(id)a3 completionHandler:(id)a4;
- (OS_os_transaction)underlyingTransaction;
- (id)completionHandler;
- (void)cancel;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setUnderlyingTransaction:(id)a3;
@end

@implementation CRKOSTransactionToken

- (void)dealloc
{
  [(CRKOSTransactionToken *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKOSTransactionToken;
  [(CRKOSTransactionToken *)&v3 dealloc];
}

- (CRKOSTransactionToken)initWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKOSTransactionToken;
  v8 = [(CRKOSTransactionToken *)&v14 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x22A620AF0](v7);
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = (id)v9;

    [v6 UTF8String];
    uint64_t v11 = os_transaction_create();
    underlyingTransaction = v8->_underlyingTransaction;
    v8->_underlyingTransaction = (OS_os_transaction *)v11;
  }
  return v8;
}

- (void)cancel
{
  [(CRKOSTransactionToken *)self setUnderlyingTransaction:0];
  objc_super v3 = [(CRKOSTransactionToken *)self completionHandler];

  if (v3)
  {
    v4 = [(CRKOSTransactionToken *)self completionHandler];
    [(CRKOSTransactionToken *)self setCompletionHandler:0];
    v4[2]();
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_os_transaction)underlyingTransaction
{
  return self->_underlyingTransaction;
}

- (void)setUnderlyingTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingTransaction, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end