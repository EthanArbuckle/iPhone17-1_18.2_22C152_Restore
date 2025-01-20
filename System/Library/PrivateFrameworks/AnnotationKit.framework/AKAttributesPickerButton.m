@interface AKAttributesPickerButton
- (void)layoutSubviews;
@end

@implementation AKAttributesPickerButton

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AKAttributesPickerButton;
  [(AKAttributesPickerButton *)&v5 layoutSubviews];
  [(AKAttributesPickerButton *)self bounds];
  double v3 = CGRectGetWidth(v6) * 0.5;
  [(AKAttributesPickerButton *)self bounds];
  double v4 = CGRectGetHeight(v7) * 0.5;
  if (v3 < v4) {
    double v4 = v3;
  }
  [(AKAttributesPickerButton *)self _setCornerRadius:v4];
}

@end