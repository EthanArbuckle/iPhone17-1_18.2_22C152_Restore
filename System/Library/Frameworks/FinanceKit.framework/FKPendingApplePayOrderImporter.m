@interface FKPendingApplePayOrderImporter
- (FKPendingApplePayOrderImporter)init;
- (_TtC10FinanceKit28PendingApplePayOrderImporter)wrappedImporter;
- (void)init;
- (void)insertOrUpdatePendingApplePayOrder:(id)a3;
- (void)setWrappedImporter:(id)a3;
@end

@implementation FKPendingApplePayOrderImporter

- (FKPendingApplePayOrderImporter)init
{
  v7.receiver = self;
  v7.super_class = (Class)FKPendingApplePayOrderImporter;
  v2 = [(FKPendingApplePayOrderImporter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[PendingApplePayOrderImporter makeImporterAndReturnError:0];
    wrappedImporter = v2->_wrappedImporter;
    v2->_wrappedImporter = (_TtC10FinanceKit28PendingApplePayOrderImporter *)v3;

    if (!v2->_wrappedImporter)
    {
      v5 = os_log_create("com.apple.FinanceKit", "Orders");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[FKPendingApplePayOrderImporter init](v5);
      }
    }
  }
  return v2;
}

- (void)insertOrUpdatePendingApplePayOrder:(id)a3
{
}

- (_TtC10FinanceKit28PendingApplePayOrderImporter)wrappedImporter
{
  return self->_wrappedImporter;
}

- (void)setWrappedImporter:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_243363000, log, OS_LOG_TYPE_ERROR, "Error initializing PendingApplePayOrderImporter", v1, 2u);
}

@end