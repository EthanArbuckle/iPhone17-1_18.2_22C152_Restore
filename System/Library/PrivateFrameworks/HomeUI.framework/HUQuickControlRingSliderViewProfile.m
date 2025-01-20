@interface HUQuickControlRingSliderViewProfile
- (BOOL)hasOffState;
- (BOOL)hasSecondaryValue;
- (BOOL)isHandleViewVisible;
- (BOOL)shouldShowSupplementaryValue;
- (HFNumberValueConstraints)primaryValueConstraints;
- (HFNumberValueConstraints)secondaryValueConstraints;
- (HUQuickControlRingSliderViewProfile)init;
- (NSArray)gradationMarkingValues;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)gradationMarkingViewStyle;
- (unint64_t)handleViewStyle;
- (unint64_t)style;
- (void)setGradationMarkingValues:(id)a3;
- (void)setGradationMarkingViewStyle:(unint64_t)a3;
- (void)setHandleViewStyle:(unint64_t)a3;
- (void)setHasOffState:(BOOL)a3;
- (void)setHasSecondaryValue:(BOOL)a3;
- (void)setIsHandleViewVisible:(BOOL)a3;
- (void)setPrimaryValueConstraints:(id)a3;
- (void)setSecondaryValueConstraints:(id)a3;
- (void)setShouldShowSupplementaryValue:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation HUQuickControlRingSliderViewProfile

- (NSArray)gradationMarkingValues
{
  gradationMarkingValues = self->_gradationMarkingValues;
  if (!gradationMarkingValues)
  {
    v4 = (NSArray *)objc_opt_new();
    v5 = self->_gradationMarkingValues;
    self->_gradationMarkingValues = v4;

    gradationMarkingValues = self->_gradationMarkingValues;
  }

  return gradationMarkingValues;
}

- (HUQuickControlRingSliderViewProfile)init
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlRingSliderViewProfile;
  v2 = [(HUQuickControlRingSliderViewProfile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HUQuickControlRingSliderViewProfile *)v2 setHasOffState:0];
    [(HUQuickControlRingSliderViewProfile *)v3 setHasSecondaryValue:0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlRingSliderViewProfile;
  id v4 = [(HUQuickControlViewProfile *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setHasOffState:", -[HUQuickControlRingSliderViewProfile hasOffState](self, "hasOffState"));
  objc_super v5 = [(HUQuickControlRingSliderViewProfile *)self primaryValueConstraints];
  [v4 setPrimaryValueConstraints:v5];

  v6 = [(HUQuickControlRingSliderViewProfile *)self secondaryValueConstraints];
  [v4 setSecondaryValueConstraints:v6];

  objc_msgSend(v4, "setHasSecondaryValue:", -[HUQuickControlRingSliderViewProfile hasSecondaryValue](self, "hasSecondaryValue"));
  objc_msgSend(v4, "setStyle:", -[HUQuickControlRingSliderViewProfile style](self, "style"));
  objc_msgSend(v4, "setShouldShowSupplementaryValue:", -[HUQuickControlRingSliderViewProfile shouldShowSupplementaryValue](self, "shouldShowSupplementaryValue"));
  return v4;
}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (void)setHasSecondaryValue:(BOOL)a3
{
  self->_hasSecondaryValue = a3;
}

- (BOOL)isHandleViewVisible
{
  return self->_isHandleViewVisible;
}

- (void)setIsHandleViewVisible:(BOOL)a3
{
  self->_isHandleViewVisible = a3;
}

- (unint64_t)handleViewStyle
{
  return self->_handleViewStyle;
}

- (void)setHandleViewStyle:(unint64_t)a3
{
  self->_handleViewStyle = a3;
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

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BOOL)shouldShowSupplementaryValue
{
  return self->_shouldShowSupplementaryValue;
}

- (void)setShouldShowSupplementaryValue:(BOOL)a3
{
  self->_shouldShowSupplementaryValue = a3;
}

- (void)setGradationMarkingValues:(id)a3
{
}

- (unint64_t)gradationMarkingViewStyle
{
  return self->_gradationMarkingViewStyle;
}

- (void)setGradationMarkingViewStyle:(unint64_t)a3
{
  self->_gradationMarkingViewStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradationMarkingValues, 0);
  objc_storeStrong((id *)&self->_secondaryValueConstraints, 0);

  objc_storeStrong((id *)&self->_primaryValueConstraints, 0);
}

@end