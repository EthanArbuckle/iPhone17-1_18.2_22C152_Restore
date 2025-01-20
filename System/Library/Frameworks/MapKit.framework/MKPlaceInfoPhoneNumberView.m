@interface MKPlaceInfoPhoneNumberView
- (BOOL)optsOutOfAds;
- (Class)_labeledValueExpectedValueType;
- (MKPlaceInfoPhoneNumberView)initWithFrame:(CGRect)a3;
- (id)_icon;
- (id)_iconAccessibilityLabel;
- (id)_valueString;
- (id)formatPhoneNumber:(id)a3;
- (int)analyticsTarget;
- (void)setOptsOutOfAds:(BOOL)a3;
@end

@implementation MKPlaceInfoPhoneNumberView

- (MKPlaceInfoPhoneNumberView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceInfoPhoneNumberView;
  v3 = -[MKPlaceInfoContactRowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MKPlaceInfoContactRowView *)v3 valueLabel];
    [v5 setLineBreakMode:1];
  }
  return v4;
}

- (id)_icon
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"call");
}

- (id)_iconAccessibilityLabel
{
  return _MKLocalizedStringFromThisBundle(@"PlaceCard_Call_PhoneNumber_Button_AccessibilityLabel");
}

- (id)_valueString
{
  v3 = [(MKPlaceInfoContactRowView *)self labeledValue];
  v4 = [v3 value];
  v5 = [v4 stringValue];
  v6 = [(MKPlaceInfoPhoneNumberView *)self formatPhoneNumber:v5];

  return v6;
}

- (id)formatPhoneNumber:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F1CF80];
  v4 = (void *)MEMORY[0x1E4F64500];
  id v5 = a3;
  v6 = [v4 sharedConfiguration];
  objc_super v7 = [v6 countryCode];
  v8 = (const void *)mk_CFPhoneNumberCreate(v3, (uint64_t)v5, (uint64_t)v7);

  if (v8)
  {
    String = (__CFString *)mk_CFPhoneNumberCreateString(v3, (uint64_t)v8, 5);
    CFRelease(v8);
  }
  else
  {
    String = &stru_1ED919588;
  }

  return String;
}

- (Class)_labeledValueExpectedValueType
{
  return (Class)objc_opt_class();
}

- (void)setOptsOutOfAds:(BOOL)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if (LOBYTE(self->_optsOutOfAdsView) != a3)
  {
    LOBYTE(self->_optsOutOfAdsView) = a3;
    labelColor = self->super._labelColor;
    if (a3)
    {
      if (!labelColor)
      {
        id v5 = [_MKUILabel alloc];
        v6 = -[_MKUILabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        objc_super v7 = self->super._labelColor;
        self->super._labelColor = v6;

        [(UIColor *)self->super._labelColor setTranslatesAutoresizingMaskIntoConstraints:0];
        v8 = [(MKPlaceInfoContactRowView *)self valueLabel];
        v9 = [v8 font];
        [(UIColor *)self->super._labelColor setFont:v9];

        v10 = [(MKPlaceInfoContactRowView *)self valueLabel];
        v11 = [v10 textColor];
        [(UIColor *)self->super._labelColor setTextColor:v11];

        v12 = _MKLocalizedStringFromThisBundle(@"PlaceOptsOutOfTelephoneAds");
        [(UIColor *)self->super._labelColor setText:v12];

        [(MKPlaceInfoPhoneNumberView *)self addSubview:self->super._labelColor];
        v13 = (void *)MEMORY[0x1E4F28DC8];
        v14 = [(UIColor *)self->super._labelColor leadingAnchor];
        v15 = [(MKPlaceInfoContactRowView *)self valueLabel];
        v16 = [v15 trailingAnchor];
        v17 = [v14 constraintEqualToAnchor:v16 constant:5.0];
        v24[0] = v17;
        v18 = [(UIColor *)self->super._labelColor firstBaselineAnchor];
        v19 = [(MKPlaceInfoContactRowView *)self valueLabel];
        v20 = [v19 firstBaselineAnchor];
        v21 = [v18 constraintEqualToAnchor:v20];
        v24[1] = v21;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
        [v13 activateConstraints:v22];
      }
    }
    else if (labelColor)
    {
      [(UIColor *)labelColor removeFromSuperview];
      v23 = self->super._labelColor;
      self->super._labelColor = 0;
    }
  }
}

- (int)analyticsTarget
{
  return 1503;
}

- (BOOL)optsOutOfAds
{
  return (BOOL)self->_optsOutOfAdsView;
}

- (void).cxx_destruct
{
}

@end