@interface CIDVUIProofingFlowManager
- (CIDVUIProofingFlowManager)initWithDelegate:(id)a3;
- (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager)proofingFlowManager;
- (id)proofingFlowViewController;
- (unint64_t)currentProofingEligibilityStatus;
- (void)proofingFlowAvailability:(id)a3;
- (void)proofingStatus:(id)a3 country:(id)a4 completion:(id)a5;
- (void)setProofingFlowManager:(id)a3;
- (void)startProofing:(id)a3 completion:(id)a4;
@end

@implementation CIDVUIProofingFlowManager

- (CIDVUIProofingFlowManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CIDVUIProofingFlowManager;
  v5 = [(CIDVUIProofingFlowManager *)&v8 init];
  if (v5)
  {
    v6 = [[_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager alloc] initWithDelegate:v4 externalProofingFlowManager:v5];
    [(CIDVUIProofingFlowManager *)v5 setProofingFlowManager:v6];
  }
  return v5;
}

- (unint64_t)currentProofingEligibilityStatus
{
  v2 = [(CIDVUIProofingFlowManager *)self proofingFlowManager];
  unint64_t v3 = [v2 proofingEligibilityStatus];

  return v3;
}

- (void)startProofing:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CIDVUIProofingFlowManager *)self proofingFlowManager];
  [v8 startProofingWithConfiguration:v7 completionHandler:v6];
}

- (id)proofingFlowViewController
{
  v2 = [(CIDVUIProofingFlowManager *)self proofingFlowManager];
  unint64_t v3 = [v2 proofingFlowViewController];

  return v3;
}

- (void)proofingFlowAvailability:(id)a3
{
  id v4 = a3;
  id v5 = [(CIDVUIProofingFlowManager *)self proofingFlowManager];
  [v5 proofingFlowAvailabilityWithCompletionHandler:v4];
}

- (void)proofingStatus:(id)a3 country:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CIDVUIProofingFlowManager *)self proofingFlowManager];
  [v11 proofingStatusFor:v10 country:v9 completionHandler:v8];
}

- (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager)proofingFlowManager
{
  return self->_proofingFlowManager;
}

- (void)setProofingFlowManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end