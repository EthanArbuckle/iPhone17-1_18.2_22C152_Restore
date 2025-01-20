@interface HUQuickControlSliderViewProfile
- (BOOL)hasOffState;
- (BOOL)hasSecondaryValue;
- (BOOL)showGrabbers;
- (BOOL)supportsTouchContinuation;
- (HFNumberValueConstraints)primaryValueConstraints;
- (HFNumberValueConstraints)secondaryValueConstraints;
- (HUQuickControlSliderViewProfile)init;
- (double)gestureDragCoefficient;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)interactionFidelity;
- (unint64_t)preferredFillSection;
- (void)setHasOffState:(BOOL)a3;
- (void)setHasSecondaryValue:(BOOL)a3;
- (void)setInteractionFidelity:(unint64_t)a3;
- (void)setPreferredFillSection:(unint64_t)a3;
- (void)setPrimaryValueConstraints:(id)a3;
- (void)setSecondaryValueConstraints:(id)a3;
- (void)setShowGrabbers:(BOOL)a3;
@end

@implementation HUQuickControlSliderViewProfile

- (HUQuickControlSliderViewProfile)init
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlSliderViewProfile;
  v2 = [(HUQuickControlSliderViewProfile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HUQuickControlSliderViewProfile *)v2 setHasOffState:1];
    [(HUQuickControlSliderViewProfile *)v3 setPreferredFillSection:0];
    [(HUQuickControlSliderViewProfile *)v3 setHasSecondaryValue:0];
    [(HUQuickControlSliderViewProfile *)v3 setInteractionFidelity:0];
    [(HUQuickControlSliderViewProfile *)v3 setShowGrabbers:0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlSliderViewProfile;
  id v4 = [(HUQuickControlViewProfile *)&v8 copyWithZone:a3];
  objc_super v5 = [(HUQuickControlSliderViewProfile *)self primaryValueConstraints];
  [v4 setPrimaryValueConstraints:v5];

  v6 = [(HUQuickControlSliderViewProfile *)self secondaryValueConstraints];
  [v4 setSecondaryValueConstraints:v6];

  objc_msgSend(v4, "setHasOffState:", -[HUQuickControlSliderViewProfile hasOffState](self, "hasOffState"));
  objc_msgSend(v4, "setHasSecondaryValue:", -[HUQuickControlSliderViewProfile hasSecondaryValue](self, "hasSecondaryValue"));
  objc_msgSend(v4, "setShowGrabbers:", -[HUQuickControlSliderViewProfile showGrabbers](self, "showGrabbers"));
  return v4;
}

- (BOOL)supportsTouchContinuation
{
  return 1;
}

- (double)gestureDragCoefficient
{
  unint64_t v2 = [(HUQuickControlSliderViewProfile *)self interactionFidelity];
  double result = 1.75;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (void)setHasSecondaryValue:(BOOL)a3
{
  self->_hasSecondaryValue = a3;
}

- (BOOL)hasOffState
{
  return self->_hasOffState;
}

- (void)setHasOffState:(BOOL)a3
{
  self->_hasOffState = a3;
}

- (HFNumberValueConstraints)primaryValueConstraints
{
  return self->_primaryValueConstraints;
}

- (void)setPrimaryValueConstraints:(id)a3
{
}

- (HFNumberValueConstraints)secondaryValueConstraints
{
  return self->_secondaryValueConstraints;
}

- (void)setSecondaryValueConstraints:(id)a3
{
}

- (BOOL)showGrabbers
{
  return self->_showGrabbers;
}

- (void)setShowGrabbers:(BOOL)a3
{
  self->_showGrabbers = a3;
}

- (unint64_t)preferredFillSection
{
  return self->_preferredFillSection;
}

- (void)setPreferredFillSection:(unint64_t)a3
{
  self->_preferredFillSection = a3;
}

- (unint64_t)interactionFidelity
{
  return self->_interactionFidelity;
}

- (void)setInteractionFidelity:(unint64_t)a3
{
  self->_interactionFidelity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryValueConstraints, 0);

  objc_storeStrong((id *)&self->_primaryValueConstraints, 0);
}

@end