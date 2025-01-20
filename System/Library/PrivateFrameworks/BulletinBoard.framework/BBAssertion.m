@interface BBAssertion
- (BBAssertion)initWithDelegate:(id)a3 identifier:(id)a4;
- (BBAssertionDelegate)delegate;
- (id)identifier;
- (unint64_t)transactionID;
- (void)dealloc;
- (void)increaseOrIgnoreTransactionID:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BBAssertion

- (BBAssertion)initWithDelegate:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BBAssertion;
  v8 = [(BBAssertion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = [v7 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;
  }
  return v9;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assertionExpired:self->_identifier transactionID:self->_transactionID];

  v4.receiver = self;
  v4.super_class = (Class)BBAssertion;
  [(BBAssertion *)&v4 dealloc];
}

- (void)increaseOrIgnoreTransactionID:(unint64_t)a3
{
  if (self->_transactionID < a3) {
    self->_transactionID = a3;
  }
}

- (id)identifier
{
  return self->_identifier;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (BBAssertionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BBAssertionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end