@interface HUQuickControlSwitchViewProfile
- (BOOL)hasSecondaryValue;
- (BOOL)supportsTouchContinuation;
- (HFNumberValueConstraints)primaryValueConstraints;
- (HFNumberValueConstraints)secondaryValueConstraints;
- (double)gestureDragCoefficient;
@end

@implementation HUQuickControlSwitchViewProfile

- (HFNumberValueConstraints)primaryValueConstraints
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F69370]) initWithMinValue:&unk_1F19B5498 maxValue:&unk_1F19B54B0 stepValue:&unk_1F19B54B0];

  return (HFNumberValueConstraints *)v2;
}

- (HFNumberValueConstraints)secondaryValueConstraints
{
  return 0;
}

- (double)gestureDragCoefficient
{
  return dbl_1BEA1AA80[([(HUQuickControlViewProfile *)self controlSize] & 0xFFFFFFFFFFFFFFFELL) == 2];
}

- (BOOL)supportsTouchContinuation
{
  return 1;
}

- (BOOL)hasSecondaryValue
{
  return 0;
}

@end