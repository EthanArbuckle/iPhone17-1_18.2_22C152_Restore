@interface EFProcessTransaction
+ (id)transactionWithDescription:(id)a3;
- (BOOL)extend;
- (EFProcessTransaction)initWithDescription:(id)a3;
- (id)description;
- (void)invalidate;
@end

@implementation EFProcessTransaction

+ (id)transactionWithDescription:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDescription:v4];

  return v5;
}

- (EFProcessTransaction)initWithDescription:(id)a3
{
  id v4 = (__CFString *)a3;
  v11.receiver = self;
  v11.super_class = (Class)EFProcessTransaction;
  v5 = [(EFProcessTransaction *)&v11 init];
  if (v5)
  {
    v6 = @"<unnamed>";
    if (v4) {
      v6 = v4;
    }
    v7 = v6;

    id v4 = v7;
    [(__CFString *)v4 UTF8String];
    uint64_t v8 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v8;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)invalidate
{
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (id)description
{
  if (self->_transaction)
  {
    v3 = (void *)os_transaction_copy_description();
    id v4 = [NSString stringWithFormat:@"<%@: %p> %s", objc_opt_class(), self, v3];
    free(v3);
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"<%@: %p> <invalidated>", objc_opt_class(), self];
  }
  return v4;
}

- (BOOL)extend
{
  return MEMORY[0x1F40CD5B0](self->_transaction, a2);
}

@end