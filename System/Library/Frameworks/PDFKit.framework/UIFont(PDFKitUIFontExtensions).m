@interface UIFont(PDFKitUIFontExtensions)
- (id)convertToFitMaximumHeight:()PDFKitUIFontExtensions;
@end

@implementation UIFont(PDFKitUIFontExtensions)

- (id)convertToFitMaximumHeight:()PDFKitUIFontExtensions
{
  [a1 pointSize];
  double v5 = v4;
  [a1 descender];
  double v7 = v5 - v6;
  if (v7 <= a2 || ([a1 pointSize], a2 == 1.0))
  {
    id v9 = a1;
  }
  else
  {
    id v9 = [a1 fontWithSize:v8 * a2 / v7];
  }

  return v9;
}

@end