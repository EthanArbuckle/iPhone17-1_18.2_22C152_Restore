@interface CIDVUIIdentityProofingDataSharingFlowManager
- (CIDVUIIdentityProofingDataSharingFlowManager)init;
- (_TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager)dataSharingManager;
- (void)checkUserConsent:(id)a3;
- (void)didChangeUserConsent:(unint64_t)a3 completion:(id)a4;
- (void)fetchUserConsent:(id)a3;
- (void)setDataSharingManager:(id)a3;
@end

@implementation CIDVUIIdentityProofingDataSharingFlowManager

- (CIDVUIIdentityProofingDataSharingFlowManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CIDVUIIdentityProofingDataSharingFlowManager;
  v2 = [(CIDVUIIdentityProofingDataSharingFlowManager *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager);
    [(CIDVUIIdentityProofingDataSharingFlowManager *)v2 setDataSharingManager:v3];
  }
  return v2;
}

- (void)checkUserConsent:(id)a3
{
  id v4 = a3;
  id v5 = [(CIDVUIIdentityProofingDataSharingFlowManager *)self dataSharingManager];
  [v5 checkUserConsentWithCompletionHandler:v4];
}

- (void)fetchUserConsent:(id)a3
{
  id v4 = a3;
  id v5 = [(CIDVUIIdentityProofingDataSharingFlowManager *)self dataSharingManager];
  [v5 fetchUserConsentWithCompletionHandler:v4];
}

- (void)didChangeUserConsent:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(CIDVUIIdentityProofingDataSharingFlowManager *)self dataSharingManager];
  [v7 didChangeUserConsent:a3 completion:v6];
}

- (_TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager)dataSharingManager
{
  return self->_dataSharingManager;
}

- (void)setDataSharingManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end