@interface MKPlaceInfoEmailRowView
- (Class)_labeledValueExpectedValueType;
- (MKPlaceInfoEmailRowView)initWithFrame:(CGRect)a3;
- (id)_icon;
- (id)_iconAccessibilityLabel;
- (id)_valueString;
- (int)analyticsTarget;
@end

@implementation MKPlaceInfoEmailRowView

- (MKPlaceInfoEmailRowView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceInfoEmailRowView;
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
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"email");
}

- (id)_iconAccessibilityLabel
{
  return _MKLocalizedStringFromThisBundle(@"PlaceCard_Send_Email_Button_AccessibilityLabel");
}

- (id)_valueString
{
  v2 = [(MKPlaceInfoContactRowView *)self labeledValue];
  v3 = [v2 value];

  return v3;
}

- (Class)_labeledValueExpectedValueType
{
  return (Class)objc_opt_class();
}

- (int)analyticsTarget
{
  return 0;
}

@end