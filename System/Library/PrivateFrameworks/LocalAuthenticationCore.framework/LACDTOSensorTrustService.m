@interface LACDTOSensorTrustService
- (LACDTOSensorTrustService)initWithReplyQueue:(id)a3 uiController:(id)a4 store:(id)a5 featureStateProvider:(id)a6;
- (id)_repairStateProvider;
- (id)_trustStore;
- (id)_trustVerifier;
- (id)_uiPresenter;
- (id)evaluationProcessor;
- (id)trustStateProvider;
@end

@implementation LACDTOSensorTrustService

- (id)evaluationProcessor
{
  v3 = [(LACDTOSensorTrustService *)self _trustVerifier];
  v4 = [(LACDTOSensorTrustService *)self _trustStore];
  v5 = [(LACDTOSensorTrustService *)self _uiPresenter];
  v6 = [[LACDTOSensorTrustController alloc] initWithReplyQueue:self->_replyQueue ui:v5 store:v4 verifier:v3 flags:self->_flags];

  return v6;
}

- (id)_uiPresenter
{
  v2 = [[LACUserInterfacePresenter alloc] initWithReplyQueue:self->_replyQueue uiController:self->_uiController];
  return v2;
}

- (id)_trustVerifier
{
  v3 = [LACDTOSensorTrustVerifier alloc];
  v4 = [(LACDTOSensorTrustService *)self trustStateProvider];
  featureStateProvider = self->_featureStateProvider;
  v6 = [(LACDTOSensorTrustService *)self _repairStateProvider];
  v7 = [(LACDTOSensorTrustVerifier *)v3 initWithTrustStateProvider:v4 featureStateProvider:featureStateProvider repairStateProvider:v6];

  return v7;
}

- (id)trustStateProvider
{
  return self->_trustStateProvider;
}

- (id)_trustStore
{
  v2 = [[LACDTOSensorTrustStoreKVSAdapter alloc] initWithKVStore:self->_store];
  return v2;
}

- (id)_repairStateProvider
{
  return +[LACDTOSensorRepairStateProviderFactory repairStateProviderWithReplyQueue:self->_replyQueue flags:self->_flags];
}

- (LACDTOSensorTrustService)initWithReplyQueue:(id)a3 uiController:(id)a4 store:(id)a5 featureStateProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)LACDTOSensorTrustService;
  v15 = [(LACDTOSensorTrustService *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_replyQueue, a3);
    objc_storeStrong((id *)&v16->_uiController, a4);
    objc_storeStrong((id *)&v16->_store, a5);
    objc_storeStrong((id *)&v16->_featureStateProvider, a6);
    uint64_t v17 = +[LACFlags sharedInstance];
    flags = v16->_flags;
    v16->_flags = (LACFlagsProvider *)v17;

    v19 = [[LACDTOSensorTrustStateProvider alloc] initWithStore:v16->_store];
    trustStateProvider = v16->_trustStateProvider;
    v16->_trustStateProvider = v19;
  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustStateProvider, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_featureStateProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end