@interface CRProcessTransaction
+ (id)transactionWithDescription:(id)a3;
- (CRProcessTransaction)init;
- (CRProcessTransaction)initWithDescription:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation CRProcessTransaction

+ (id)transactionWithDescription:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithDescription:a3];
  return v3;
}

- (CRProcessTransaction)init
{
}

- (CRProcessTransaction)initWithDescription:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRProcessTransaction;
  v4 = [(CRProcessTransaction *)&v6 init];
  if (v4)
  {
    [a3 UTF8String];
    v4->_transaction = (OS_os_transaction *)os_transaction_create();
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRProcessTransaction;
  [(CRProcessTransaction *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)os_transaction_copy_description();
  v4 = +[NSString stringWithFormat:@"<%@:%p> %s", objc_opt_class(), self, v3];
  free(v3);
  return v4;
}

@end