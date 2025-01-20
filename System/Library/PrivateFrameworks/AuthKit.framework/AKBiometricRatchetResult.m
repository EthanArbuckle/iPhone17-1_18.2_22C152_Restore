@interface AKBiometricRatchetResult
- (AKBiometricRatchetResult)initWithRatchetState:(id)a3 armingMethod:(unint64_t)a4;
- (AKRatchetState)ratchetState;
- (unint64_t)armingMethod;
- (void)setArmingMethod:(unint64_t)a3;
@end

@implementation AKBiometricRatchetResult

- (AKBiometricRatchetResult)initWithRatchetState:(id)a3 armingMethod:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKBiometricRatchetResult;
  v8 = [(AKBiometricRatchetResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_ratchetState, a3);
    v9->_armingMethod = a4;
  }

  return v9;
}

- (AKRatchetState)ratchetState
{
  return self->_ratchetState;
}

- (unint64_t)armingMethod
{
  return self->_armingMethod;
}

- (void)setArmingMethod:(unint64_t)a3
{
  self->_armingMethod = a3;
}

- (void).cxx_destruct
{
}

@end