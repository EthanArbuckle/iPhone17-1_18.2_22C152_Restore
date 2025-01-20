@interface ANTransactionInfo
+ (id)infoWithTransaction:(id)a3;
- (OS_dispatch_source)timer;
- (OS_os_transaction)transaction;
- (double)expiration;
- (void)setExpiration:(double)a3;
- (void)setTimer:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation ANTransactionInfo

+ (id)infoWithTransaction:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setTransaction:v3];

  return v4;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (double)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(double)a3
{
  self->_expiration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end