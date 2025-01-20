@interface CIDVUIBiometricBindingFlowManager
- (CIDVUIBiometricBindingFlowManager)init;
- (_TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager)bioBindingFlowManager;
- (void)deleteBoundACLWithCompletion:(id)a3;
- (void)evaluateBoundACL:(id)a3;
- (void)fetchBiometricBindingDetails:(id)a3;
- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3;
- (void)setBioBindingFlowManager:(id)a3;
@end

@implementation CIDVUIBiometricBindingFlowManager

- (CIDVUIBiometricBindingFlowManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CIDVUIBiometricBindingFlowManager;
  v2 = [(CIDVUIBiometricBindingFlowManager *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager);
    [(CIDVUIBiometricBindingFlowManager *)v2 setBioBindingFlowManager:v3];
  }
  return v2;
}

- (void)evaluateBoundACL:(id)a3
{
  id v4 = a3;
  id v5 = [(CIDVUIBiometricBindingFlowManager *)self bioBindingFlowManager];
  [v5 evaluateBoundACLWithCompletionHandler:v4];
}

- (void)deleteBoundACLWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CIDVUIBiometricBindingFlowManager *)self bioBindingFlowManager];
  [v5 deleteBoundACLWithCompletionHandler:v4];
}

- (void)fetchBiometricBindingDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(CIDVUIBiometricBindingFlowManager *)self bioBindingFlowManager];
  [v5 fetchBiometricBindingDetailsWithCompletionHandler:v4];
}

- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CIDVUIBiometricBindingFlowManager *)self bioBindingFlowManager];
  [v5 globalAuthACLTemplateUUIDsWithCompletionHandler:v4];
}

- (_TtC9CoreIDVUI34CIDVUIInternalBiometricFlowManager)bioBindingFlowManager
{
  return self->_bioBindingFlowManager;
}

- (void)setBioBindingFlowManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end