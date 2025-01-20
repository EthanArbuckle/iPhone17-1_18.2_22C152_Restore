@interface FKBankConnectInstitutionProvider
- (FKBankConnectInstitutionProvider)init;
- (_TtC10FinanceKit30BankConnectInstitutionProvider)wrappedProvider;
- (void)init;
- (void)institutionWithInstitutionID:(id)a3 completion:(id)a4;
- (void)setWrappedProvider:(id)a3;
@end

@implementation FKBankConnectInstitutionProvider

- (FKBankConnectInstitutionProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)FKBankConnectInstitutionProvider;
  v2 = [(FKBankConnectInstitutionProvider *)&v10 init];
  if (!v2) {
    goto LABEL_4;
  }
  id v9 = 0;
  uint64_t v3 = +[BankConnectInstitutionProvider makeProviderAndReturnError:&v9];
  id v4 = v9;
  wrappedProvider = v2->_wrappedProvider;
  v2->_wrappedProvider = (_TtC10FinanceKit30BankConnectInstitutionProvider *)v3;

  if (v2->_wrappedProvider)
  {

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  v7 = os_log_create("com.apple.FinanceKit", "BankConnect");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(FKBankConnectInstitutionProvider *)(uint64_t)v4 init];
  }

  v6 = 0;
LABEL_8:

  return v6;
}

- (void)institutionWithInstitutionID:(id)a3 completion:(id)a4
{
}

- (_TtC10FinanceKit30BankConnectInstitutionProvider)wrappedProvider
{
  return self->_wrappedProvider;
}

- (void)setWrappedProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_243363000, a2, OS_LOG_TYPE_ERROR, "Error initializing BankConnectInstitutionProvider: %@", (uint8_t *)&v2, 0xCu);
}

@end