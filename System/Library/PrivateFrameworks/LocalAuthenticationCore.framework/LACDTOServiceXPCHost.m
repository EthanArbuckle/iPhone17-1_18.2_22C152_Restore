@interface LACDTOServiceXPCHost
- (LACDTOServiceXPCHost)initWithFeatureController:(id)a3 ratchetStateProvider:(id)a4 trustStateProvider:(id)a5 pendingEvaluationController:(id)a6;
- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)checkIsFeatureAvailableWithCompletion:(id)a3;
- (void)checkIsFeatureEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureSupportedWithCompletion:(id)a3;
- (void)checkIsSensorTrustedWithCompletion:(id)a3;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithCompletion:(id)a3;
- (void)ratchetStateCompositeWithCompletion:(id)a3;
- (void)ratchetStateWithCompletion:(id)a3;
@end

@implementation LACDTOServiceXPCHost

- (LACDTOServiceXPCHost)initWithFeatureController:(id)a3 ratchetStateProvider:(id)a4 trustStateProvider:(id)a5 pendingEvaluationController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LACDTOServiceXPCHost;
  v15 = [(LACDTOServiceXPCHost *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_featureController, a3);
    objc_storeStrong((id *)&v16->_ratchetStateProvider, a4);
    objc_storeStrong((id *)&v16->_pendingEvaluationController, a6);
    objc_storeStrong((id *)&v16->_trustStateProvider, a5);
  }

  return v16;
}

- (void)checkIsFeatureEnabledWithCompletion:(id)a3
{
}

- (void)checkIsFeatureSupportedWithCompletion:(id)a3
{
}

- (void)checkIsFeatureAvailableWithCompletion:(id)a3
{
}

- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
}

- (void)checkIsSensorTrustedWithCompletion:(id)a3
{
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
}

- (void)enableFeatureWithCompletion:(id)a3
{
}

- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3
{
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
}

- (void)ratchetStateWithCompletion:(id)a3
{
}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
}

- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [LACXPCClient alloc];
  id v12 = [MEMORY[0x263F08D68] currentConnection];
  id v13 = [(LACXPCClient *)v11 initWithConnection:v12];

  [(LACDTOPendingPolicyEvaluationController *)self->_pendingEvaluationController cancelPendingEvaluationForClient:v13 ratchetIdentifier:v10 reason:v9 completion:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvaluationController, 0);
  objc_storeStrong((id *)&self->_trustStateProvider, 0);
  objc_storeStrong((id *)&self->_ratchetStateProvider, 0);
  objc_storeStrong((id *)&self->_featureController, 0);
}

@end