@interface HUQuickControlPushButtonViewProfile
- (BOOL)hasSecondaryValue;
- (BOOL)toggleColorScheme;
- (HFNumberValueConstraints)primaryValueConstraints;
- (HFNumberValueConstraints)secondaryValueConstraints;
- (HUQuickControlPushButtonViewProfile)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setToggleColorScheme:(BOOL)a3;
@end

@implementation HUQuickControlPushButtonViewProfile

- (HUQuickControlPushButtonViewProfile)init
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlPushButtonViewProfile;
  v2 = [(HUQuickControlPushButtonViewProfile *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HUQuickControlPushButtonViewProfile *)v2 setToggleColorScheme:1];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlPushButtonViewProfile;
  id v4 = [(HUQuickControlViewProfile *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setToggleColorScheme:", -[HUQuickControlPushButtonViewProfile toggleColorScheme](self, "toggleColorScheme"));
  return v4;
}

- (HFNumberValueConstraints)primaryValueConstraints
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F69370]) initWithMinValue:&unk_1F19B5498 maxValue:&unk_1F19B54B0 stepValue:&unk_1F19B54B0];

  return (HFNumberValueConstraints *)v2;
}

- (HFNumberValueConstraints)secondaryValueConstraints
{
  return 0;
}

- (BOOL)hasSecondaryValue
{
  return 0;
}

- (BOOL)toggleColorScheme
{
  return self->_toggleColorScheme;
}

- (void)setToggleColorScheme:(BOOL)a3
{
  self->_toggleColorScheme = a3;
}

@end