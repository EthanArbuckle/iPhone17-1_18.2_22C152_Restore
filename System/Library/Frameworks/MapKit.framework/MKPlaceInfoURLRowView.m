@interface MKPlaceInfoURLRowView
- (Class)_labeledValueExpectedValueType;
- (MKPlaceInfoURLRowView)initWithFrame:(CGRect)a3;
- (id)_icon;
- (id)_iconAccessibilityLabel;
- (id)_valueString;
- (id)draggableContent;
- (int)analyticsTarget;
@end

@implementation MKPlaceInfoURLRowView

- (MKPlaceInfoURLRowView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceInfoURLRowView;
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
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"website");
}

- (id)_iconAccessibilityLabel
{
  return _MKLocalizedStringFromThisBundle(@"PlaceCard_OpenURL_Button_AccessibilityLabel");
}

- (id)_valueString
{
  v2 = [(MKPlaceInfoContactRowView *)self labeledValue];
  v3 = [v2 value];

  v4 = objc_msgSend(NSString, "_mapkit_shortenedURLStringForFullURLString:", v3);

  return v4;
}

- (Class)_labeledValueExpectedValueType
{
  return (Class)objc_opt_class();
}

- (id)draggableContent
{
  v2 = [(MKPlaceInfoContactRowView *)self labeledValue];
  v3 = [v2 value];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)analyticsTarget
{
  return 1504;
}

@end