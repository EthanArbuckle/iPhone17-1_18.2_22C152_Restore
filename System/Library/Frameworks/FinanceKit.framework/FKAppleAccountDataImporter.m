@interface FKAppleAccountDataImporter
- (BOOL)deleteAllTransactionsForAppleAccountWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteAppleAccountWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAssociatedAppleAccountWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)insertOrUpdateAccount:(id)a3 error:(id *)a4;
- (BOOL)insertOrUpdateAppleAccounts:(id)a3 error:(id *)a4;
- (FKAppleAccountDataImporter)init;
- (_TtC10FinanceKit24AppleAccountDataImporter)wrappedClass;
- (void)init;
- (void)setWrappedClass:(id)a3;
@end

@implementation FKAppleAccountDataImporter

- (FKAppleAccountDataImporter)init
{
  v7.receiver = self;
  v7.super_class = (Class)FKAppleAccountDataImporter;
  v2 = [(FKAppleAccountDataImporter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[AppleAccountDataImporter makeClassAndReturnError:0];
    wrappedClass = v2->_wrappedClass;
    v2->_wrappedClass = (_TtC10FinanceKit24AppleAccountDataImporter *)v3;

    if (!v2->_wrappedClass)
    {
      v5 = os_log_create("com.apple.FinanceKit", "BankConnect");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[FKAppleAccountDataImporter init](v5);
      }
    }
  }
  return v2;
}

- (BOOL)insertOrUpdateAccount:(id)a3 error:(id *)a4
{
  wrappedClass = self->_wrappedClass;
  id v9 = 0;
  [(AppleAccountDataImporter *)wrappedClass insertOrUpdateWithAppleAccount:a3 error:&v9];
  id v6 = v9;
  objc_super v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v7 == 0;
}

- (BOOL)insertOrUpdateAppleAccounts:(id)a3 error:(id *)a4
{
  wrappedClass = self->_wrappedClass;
  id v9 = 0;
  [(AppleAccountDataImporter *)wrappedClass insertOrUpdateWithAppleAccounts:a3 error:&v9];
  id v6 = v9;
  objc_super v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v7 == 0;
}

- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAssociatedAppleAccountWithIdentifier:(id)a4 error:(id *)a5
{
  wrappedClass = self->_wrappedClass;
  id v10 = 0;
  [(AppleAccountDataImporter *)wrappedClass deleteTransactionsWithIdentifiers:a3 forAppleAccountIdentifier:a4 error:&v10];
  id v7 = v10;
  v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return v8 == 0;
}

- (BOOL)deleteAllTransactionsForAppleAccountWithIdentifier:(id)a3 error:(id *)a4
{
  wrappedClass = self->_wrappedClass;
  id v9 = 0;
  [(AppleAccountDataImporter *)wrappedClass deleteAllTransactionsFor:a3 error:&v9];
  id v6 = v9;
  id v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v7 == 0;
}

- (BOOL)deleteAppleAccountWithIdentifier:(id)a3 error:(id *)a4
{
  wrappedClass = self->_wrappedClass;
  id v9 = 0;
  [(AppleAccountDataImporter *)wrappedClass deleteAppleAccountWith:a3 error:&v9];
  id v6 = v9;
  id v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v7 == 0;
}

- (_TtC10FinanceKit24AppleAccountDataImporter)wrappedClass
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
  _os_log_error_impl(&dword_243363000, log, OS_LOG_TYPE_ERROR, "Error initializing AppleAccountDataImporter", v1, 2u);
}

@end