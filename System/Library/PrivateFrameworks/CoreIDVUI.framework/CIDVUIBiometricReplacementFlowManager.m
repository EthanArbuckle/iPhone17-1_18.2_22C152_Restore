@interface CIDVUIBiometricReplacementFlowManager
- (CIDVUIBiometricReplacementFlowManager)init;
- (_TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager)biometricReplacementFlowManager;
- (void)beginBiometricReplacement:(id)a3;
- (void)beginBiometricReplacementForWatch:(id)a3;
- (void)beginBiometricReplacementWithAuthenticationHandler:(id)a3 andCompletion:(id)a4;
- (void)setBiometricReplacementFlowManager:(id)a3;
@end

@implementation CIDVUIBiometricReplacementFlowManager

- (CIDVUIBiometricReplacementFlowManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CIDVUIBiometricReplacementFlowManager;
  v2 = [(CIDVUIBiometricReplacementFlowManager *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager);
    [(CIDVUIBiometricReplacementFlowManager *)v2 setBiometricReplacementFlowManager:v3];
  }
  return v2;
}

- (void)beginBiometricReplacement:(id)a3
{
  id v4 = a3;
  id v5 = [(CIDVUIBiometricReplacementFlowManager *)self biometricReplacementFlowManager];
  [v5 beginBiometricReplacementForTarget:1 withAuthHandler:v4 andCompletionHandler:0];
}

- (void)beginBiometricReplacementForWatch:(id)a3
{
  id v4 = a3;
  id v5 = [(CIDVUIBiometricReplacementFlowManager *)self biometricReplacementFlowManager];
  [v5 beginBiometricReplacementForTarget:2 withAuthHandler:v4 andCompletionHandler:0];
}

- (void)beginBiometricReplacementWithAuthenticationHandler:(id)a3 andCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CIDVUIBiometricReplacementFlowManager *)self biometricReplacementFlowManager];
  [v8 beginBiometricReplacementForTarget:1 withAuthHandler:v7 andCompletionHandler:v6];
}

- (_TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager)biometricReplacementFlowManager
{
  return self->_biometricReplacementFlowManager;
}

- (void)setBiometricReplacementFlowManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end