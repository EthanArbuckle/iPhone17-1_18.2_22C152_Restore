@interface FKBankConnectInstitutionMatcher
- (FKBankConnectInstitutionMatcher)init;
- (void)institutionForPaymentPass:(id)a3 withCompletion:(id)a4;
@end

@implementation FKBankConnectInstitutionMatcher

- (FKBankConnectInstitutionMatcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectInstitutionMatcher;
  v2 = [(FKBankConnectInstitutionMatcher *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10FinanceKit29BankConnectInstitutionMatcher);
    wrappedMatcher = v2->_wrappedMatcher;
    v2->_wrappedMatcher = v3;
  }
  return v2;
}

- (void)institutionForPaymentPass:(id)a3 withCompletion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end