@interface HAPCharacteristicValueActiveTransitionContext(Validator)
- (BOOL)isValid;
@end

@implementation HAPCharacteristicValueActiveTransitionContext(Validator)

- (BOOL)isValid
{
  v2 = [a1 HAPInstanceID];
  if (v2)
  {
    v3 = [a1 timeElapsedSinceStart];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end