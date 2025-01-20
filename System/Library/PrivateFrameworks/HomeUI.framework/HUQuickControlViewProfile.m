@interface HUQuickControlViewProfile
- (BOOL)supportsTouchContinuation;
- (HFDynamicFormattingValue)supplementaryFormattedValue;
- (HFIconDescriptor)decorationIconDescriptor;
- (UIColor)tintColor;
- (double)gestureDragCoefficient;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)controlSize;
- (unint64_t)orientation;
- (unint64_t)suspendedState;
- (void)setControlSize:(unint64_t)a3;
- (void)setDecorationIconDescriptor:(id)a3;
- (void)setOrientation:(unint64_t)a3;
- (void)setSupplementaryFormattedValue:(id)a3;
- (void)setSuspendedState:(unint64_t)a3;
- (void)setTintColor:(id)a3;
@end

@implementation HUQuickControlViewProfile

- (double)gestureDragCoefficient
{
  return 1.0;
}

- (BOOL)supportsTouchContinuation
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setControlSize:", -[HUQuickControlViewProfile controlSize](self, "controlSize"));
  objc_msgSend(v4, "setSuspendedState:", -[HUQuickControlViewProfile suspendedState](self, "suspendedState"));
  objc_msgSend(v4, "setOrientation:", -[HUQuickControlViewProfile orientation](self, "orientation"));
  v5 = [(HUQuickControlViewProfile *)self supplementaryFormattedValue];
  [v4 setSupplementaryFormattedValue:v5];

  v6 = [(HUQuickControlViewProfile *)self decorationIconDescriptor];
  [v4 setDecorationIconDescriptor:v6];

  v7 = [(HUQuickControlViewProfile *)self tintColor];
  [v4 setTintColor:v7];

  return v4;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void)setControlSize:(unint64_t)a3
{
  self->_controlSize = a3;
}

- (unint64_t)suspendedState
{
  return self->_suspendedState;
}

- (void)setSuspendedState:(unint64_t)a3
{
  self->_suspendedState = a3;
}

- (HFDynamicFormattingValue)supplementaryFormattedValue
{
  return self->_supplementaryFormattedValue;
}

- (void)setSupplementaryFormattedValue:(id)a3
{
}

- (HFIconDescriptor)decorationIconDescriptor
{
  return self->_decorationIconDescriptor;
}

- (void)setDecorationIconDescriptor:(id)a3
{
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_decorationIconDescriptor, 0);

  objc_storeStrong((id *)&self->_supplementaryFormattedValue, 0);
}

@end