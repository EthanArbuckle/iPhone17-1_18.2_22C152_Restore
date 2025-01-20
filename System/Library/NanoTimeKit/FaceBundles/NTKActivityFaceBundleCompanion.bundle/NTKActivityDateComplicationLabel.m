@interface NTKActivityDateComplicationLabel
- (CGSize)_highlightInset;
- (double)_cornerRadius;
@end

@implementation NTKActivityDateComplicationLabel

- (CGSize)_highlightInset
{
  v3 = [(NTKActivityDateComplicationLabel *)self device];
  NTKUtilityComplicationHighlightPadding();
  double v5 = v4;
  double v7 = v6;

  v12.receiver = self;
  v12.super_class = (Class)NTKActivityDateComplicationLabel;
  [(NTKActivityDateComplicationLabel *)&v12 _highlightInset];
  double v9 = v8 - v5;
  double v11 = v10 - v7;
  result.height = v11;
  result.width = v9;
  return result;
}

- (double)_cornerRadius
{
  v2 = [(NTKActivityDateComplicationLabel *)self device];
  NTKUtilityComplicationHighlightCornerRadius();
  double v4 = v3;

  return v4;
}

@end