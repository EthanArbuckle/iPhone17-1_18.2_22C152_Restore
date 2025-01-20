@interface _CNOSTransactionInhibitor
- (NSString)label;
- (OS_os_transaction)transaction;
- (_CNOSTransactionInhibitor)initWithLabel:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _CNOSTransactionInhibitor

- (void)stop
{
  v4.receiver = self;
  v4.super_class = (Class)_CNOSTransactionInhibitor;
  [(CNInhibitor *)&v4 stop];
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)start
{
  v6.receiver = self;
  v6.super_class = (Class)_CNOSTransactionInhibitor;
  [(CNInhibitor *)&v6 start];
  id v3 = [(_CNOSTransactionInhibitor *)self label];
  [v3 UTF8String];
  objc_super v4 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v4;
}

- (NSString)label
{
  return self->_label;
}

- (_CNOSTransactionInhibitor)initWithLabel:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNOSTransactionInhibitor;
  v5 = [(_CNOSTransactionInhibitor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    transaction = v5->_transaction;
    v5->_transaction = 0;

    v9 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

@end