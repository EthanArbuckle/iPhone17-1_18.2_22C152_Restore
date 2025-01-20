@interface BLTTransaction
+ (id)transactionWithDescription:(id)a3;
- (BLTTransaction)initWithDescription:(id)a3;
- (OS_os_transaction)osTransaction;
- (void)setOsTransaction:(id)a3;
@end

@implementation BLTTransaction

- (BLTTransaction)initWithDescription:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTTransaction;
  v5 = [(BLTTransaction *)&v9 init];
  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"BLTTransaction: %@", v4];
    [v6 UTF8String];
    v7 = (void *)os_transaction_create();
    [(BLTTransaction *)v5 setOsTransaction:v7];
  }
  return v5;
}

+ (id)transactionWithDescription:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDescription:v4];

  return v5;
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end