@interface FKTrillianTransactionImporter
- (FKTrillianTransactionImporter)init;
- (_TtC10FinanceKit27TrillianTransactionImporter)wrappedClass;
- (void)init;
- (void)registerTransaction:(id)a3;
- (void)setWrappedClass:(id)a3;
@end

@implementation FKTrillianTransactionImporter

- (FKTrillianTransactionImporter)init
{
  v7.receiver = self;
  v7.super_class = (Class)FKTrillianTransactionImporter;
  v2 = [(FKTrillianTransactionImporter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[TrillianTransactionImporter makeClassAndReturnError:0];
    wrappedClass = v2->_wrappedClass;
    v2->_wrappedClass = (_TtC10FinanceKit27TrillianTransactionImporter *)v3;

    if (!v2->_wrappedClass)
    {
      v5 = os_log_create("com.apple.FinanceKit", "Orders");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[FKTrillianTransactionImporter init](v5);
      }
    }
  }
  return v2;
}

- (void)registerTransaction:(id)a3
{
}

- (_TtC10FinanceKit27TrillianTransactionImporter)wrappedClass
{
  return self->_wrappedClass;
}

- (void)setWrappedClass:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_243363000, log, OS_LOG_TYPE_ERROR, "Error initializing TrillianTransactionImporter", v1, 2u);
}

@end