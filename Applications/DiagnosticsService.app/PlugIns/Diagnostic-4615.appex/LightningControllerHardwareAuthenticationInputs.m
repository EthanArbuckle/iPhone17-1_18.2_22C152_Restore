@interface LightningControllerHardwareAuthenticationInputs
- (BOOL)_applyChallengeParameter:(id)a3;
- (BOOL)_applyKeyIndexParameter:(id)a3;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSData)challenge;
- (int)keyIndex;
- (void)setChallenge:(id)a3;
- (void)setKeyIndex:(int)a3;
@end

@implementation LightningControllerHardwareAuthenticationInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  if ([(LightningControllerHardwareAuthenticationInputs *)self _applyChallengeParameter:v4])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    unsigned int v5 = ![(LightningControllerHardwareAuthenticationInputs *)self _applyKeyIndexParameter:v4];
  }

  return v5;
}

- (BOOL)_applyChallengeParameter:(id)a3
{
  char v9 = 0;
  id v4 = [a3 dk_stringFromRequiredKey:@"challenge" maxLength:256 failed:&v9];
  if (v9)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v4 options:0];
    [(LightningControllerHardwareAuthenticationInputs *)self setChallenge:v6];

    v7 = [(LightningControllerHardwareAuthenticationInputs *)self challenge];

    if (v7)
    {
      BOOL v5 = v9 != 0;
    }
    else
    {
      BOOL v5 = 1;
      char v9 = 1;
    }
  }

  return v5;
}

- (BOOL)_applyKeyIndexParameter:(id)a3
{
  BOOL v6 = 0;
  id v4 = [a3 dk_numberFromKey:@"keyIndex" lowerBound:&off_1000042F0 upperBound:&off_100004308 defaultValue:&off_1000042F0 failed:&v6];
  -[LightningControllerHardwareAuthenticationInputs setKeyIndex:](self, "setKeyIndex:", [v4 intValue]);

  return v6;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (int)keyIndex
{
  return self->_keyIndex;
}

- (void)setKeyIndex:(int)a3
{
  self->_keyIndex = a3;
}

- (void).cxx_destruct
{
}

@end