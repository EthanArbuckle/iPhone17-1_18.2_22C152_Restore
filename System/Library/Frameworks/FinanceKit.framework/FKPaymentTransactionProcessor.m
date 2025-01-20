@interface FKPaymentTransactionProcessor
- (FKPaymentTransactionProcessor)init;
- (_TtC10FinanceKit27PaymentTransactionProcessor)importer;
- (void)deleteTransactionWithIdentifier:(id)a3 forPrimaryAccountIdentifier:(id)a4;
- (void)insertOrUpdateTransaction:(id)a3 forPrimaryAccountIdentifier:(id)a4;
- (void)setImporter:(id)a3;
@end

@implementation FKPaymentTransactionProcessor

- (FKPaymentTransactionProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKPaymentTransactionProcessor;
  v2 = [(FKPaymentTransactionProcessor *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10FinanceKit27PaymentTransactionProcessor);
    importer = v2->_importer;
    v2->_importer = v3;
  }
  return v2;
}

- (void)insertOrUpdateTransaction:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
}

- (void)deleteTransactionWithIdentifier:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
}

- (_TtC10FinanceKit27PaymentTransactionProcessor)importer
{
  return self->_importer;
}

- (void)setImporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end