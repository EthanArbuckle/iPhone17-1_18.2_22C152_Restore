@interface FKBankConnectAuthorizationSessionProvider
- (FKBankConnectAuthorizationSessionProvider)init;
- (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider)wrappedProvider;
- (void)authorizationSessionWithCompletion:(id)a3;
- (void)setWrappedProvider:(id)a3;
@end

@implementation FKBankConnectAuthorizationSessionProvider

- (FKBankConnectAuthorizationSessionProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)FKBankConnectAuthorizationSessionProvider;
  v2 = [(FKBankConnectAuthorizationSessionProvider *)&v10 init];
  if (!v2) {
    goto LABEL_4;
  }
  id v9 = 0;
  uint64_t v3 = +[BankConnectAuthorizationSessionProvider makeProviderAndReturnError:&v9];
  id v4 = v9;
  wrappedProvider = v2->_wrappedProvider;
  v2->_wrappedProvider = (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider *)v3;

  if (v2->_wrappedProvider)
  {

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  v7 = os_log_create("com.apple.FinanceKit", "BankConnect");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(FKBankConnectInstitutionsProvider *)(uint64_t)v4 init];
  }

  v6 = 0;
LABEL_8:

  return v6;
}

- (void)authorizationSessionWithCompletion:(id)a3
{
}

- (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider)wrappedProvider
{
  return self->_wrappedProvider;
}

- (void)setWrappedProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end