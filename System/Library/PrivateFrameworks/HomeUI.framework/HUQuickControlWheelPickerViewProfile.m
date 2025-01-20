@interface HUQuickControlWheelPickerViewProfile
- (BOOL)showOffState;
- (BOOL)sizeToFitTextWidth;
- (BOOL)uppercaseRowTitles;
- (HUQuickControlWheelPickerViewProfile)init;
- (UIColor)borderColor;
- (double)borderWidth;
- (double)cornerRadius;
- (double)selectedRowBorderWidth;
- (double)selectedRowCornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)style;
- (void)_setDefaultStyleProperties;
- (void)_setMultiStateStyleProperties;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setSelectedRowBorderWidth:(double)a3;
- (void)setSelectedRowCornerRadius:(double)a3;
- (void)setShowOffState:(BOOL)a3;
- (void)setSizeToFitTextWidth:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setUppercaseRowTitles:(BOOL)a3;
@end

@implementation HUQuickControlWheelPickerViewProfile

- (HUQuickControlWheelPickerViewProfile)init
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlWheelPickerViewProfile;
  v2 = [(HUQuickControlWheelPickerViewProfile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HUQuickControlWheelPickerViewProfile *)v2 setStyle:0];
    [(HUQuickControlWheelPickerViewProfile *)v3 setShowOffState:0];
  }
  return v3;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  if (a3 == 1)
  {
    [(HUQuickControlWheelPickerViewProfile *)self _setMultiStateStyleProperties];
  }
  else if (!a3)
  {
    [(HUQuickControlWheelPickerViewProfile *)self _setDefaultStyleProperties];
  }
}

- (void)_setDefaultStyleProperties
{
  [(HUQuickControlWheelPickerViewProfile *)self setBorderWidth:2.0];
  v3 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
  [(HUQuickControlWheelPickerViewProfile *)self setBorderColor:v3];

  [(HUQuickControlWheelPickerViewProfile *)self setCornerRadius:20.0];
  [(HUQuickControlWheelPickerViewProfile *)self setSizeToFitTextWidth:1];
  [(HUQuickControlWheelPickerViewProfile *)self setUppercaseRowTitles:0];
  [(HUQuickControlWheelPickerViewProfile *)self borderWidth];
  -[HUQuickControlWheelPickerViewProfile setSelectedRowBorderWidth:](self, "setSelectedRowBorderWidth:");

  [(HUQuickControlWheelPickerViewProfile *)self setSelectedRowCornerRadius:8.0];
}

- (void)_setMultiStateStyleProperties
{
  [(HUQuickControlWheelPickerViewProfile *)self _setDefaultStyleProperties];
  [(HUQuickControlWheelPickerViewProfile *)self setBorderWidth:0.0];
  [(HUQuickControlWheelPickerViewProfile *)self setUppercaseRowTitles:1];

  [(HUQuickControlWheelPickerViewProfile *)self setSelectedRowCornerRadius:16.0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlWheelPickerViewProfile;
  id v4 = [(HUQuickControlViewProfile *)&v7 copyWithZone:a3];
  [(HUQuickControlWheelPickerViewProfile *)self borderWidth];
  objc_msgSend(v4, "setBorderWidth:");
  objc_super v5 = [(HUQuickControlWheelPickerViewProfile *)self borderColor];
  [v4 setBorderColor:v5];

  [(HUQuickControlWheelPickerViewProfile *)self cornerRadius];
  objc_msgSend(v4, "setCornerRadius:");
  objc_msgSend(v4, "setSizeToFitTextWidth:", -[HUQuickControlWheelPickerViewProfile sizeToFitTextWidth](self, "sizeToFitTextWidth"));
  objc_msgSend(v4, "setUppercaseRowTitles:", -[HUQuickControlWheelPickerViewProfile uppercaseRowTitles](self, "uppercaseRowTitles"));
  [(HUQuickControlWheelPickerViewProfile *)self selectedRowBorderWidth];
  objc_msgSend(v4, "setSelectedRowBorderWidth:");
  [(HUQuickControlWheelPickerViewProfile *)self selectedRowCornerRadius];
  objc_msgSend(v4, "setSelectedRowCornerRadius:");
  objc_msgSend(v4, "setShowOffState:", -[HUQuickControlWheelPickerViewProfile showOffState](self, "showOffState"));
  objc_msgSend(v4, "setStyle:", -[HUQuickControlWheelPickerViewProfile style](self, "style"));
  return v4;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)sizeToFitTextWidth
{
  return self->_sizeToFitTextWidth;
}

- (void)setSizeToFitTextWidth:(BOOL)a3
{
  self->_sizeToFitTextWidth = a3;
}

- (BOOL)uppercaseRowTitles
{
  return self->_uppercaseRowTitles;
}

- (void)setUppercaseRowTitles:(BOOL)a3
{
  self->_uppercaseRowTitles = a3;
}

- (double)selectedRowBorderWidth
{
  return self->_selectedRowBorderWidth;
}

- (void)setSelectedRowBorderWidth:(double)a3
{
  self->_selectedRowBorderWidth = a3;
}

- (double)selectedRowCornerRadius
{
  return self->_selectedRowCornerRadius;
}

- (void)setSelectedRowCornerRadius:(double)a3
{
  self->_selectedRowCornerRadius = a3;
}

- (BOOL)showOffState
{
  return self->_showOffState;
}

- (void)setShowOffState:(BOOL)a3
{
  self->_showOffState = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end