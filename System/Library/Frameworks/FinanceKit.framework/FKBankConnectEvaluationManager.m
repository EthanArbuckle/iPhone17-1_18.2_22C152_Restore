@interface FKBankConnectEvaluationManager
- (BOOL)hasAnyConnectedCardWithBankConnect;
- (BOOL)hasAnyEligibleBankConectCard;
- (BOOL)hasAnyEligibleBankConnectCard;
- (FKBankConnectEvaluationManager)init;
- (void)reevaluateEligibilityAndConnectionsWithCompletion:(id)a3;
- (void)reevaluateEligibilityWithCompletion:(id)a3;
@end

@implementation FKBankConnectEvaluationManager

- (FKBankConnectEvaluationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectEvaluationManager;
  v2 = [(FKBankConnectEvaluationManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10FinanceKit35BankConnectEvaluationManagerWrapper);
    wrappedManager = v2->_wrappedManager;
    v2->_wrappedManager = v3;
  }
  return v2;
}

- (void)reevaluateEligibilityWithCompletion:(id)a3
{
}

- (void)reevaluateEligibilityAndConnectionsWithCompletion:(id)a3
{
}

- (BOOL)hasAnyConnectedCardWithBankConnect
{
  return [(BankConnectEvaluationManagerWrapper *)self->_wrappedManager hasAnyConnectedCardWithBankConnect];
}

- (BOOL)hasAnyEligibleBankConnectCard
{
  return [(BankConnectEvaluationManagerWrapper *)self->_wrappedManager hasAnyEligibleBankConnectCard];
}

- (BOOL)hasAnyEligibleBankConectCard
{
  return [(BankConnectEvaluationManagerWrapper *)self->_wrappedManager hasAnyEligibleBankConnectCard];
}

- (void).cxx_destruct
{
}

@end