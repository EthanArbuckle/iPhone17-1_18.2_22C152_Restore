@interface DOCTagInfoCollectionAppearance
- (NSDirectionalEdgeInsets)cellContentInsets;
- (NSString)labelFontStyle;
- (double)cellCornerRadius;
- (double)dimmingAlphaDuringMenuPresentation;
- (double)horizontalTagSpacing;
- (double)tagToLabelSpacing;
- (double)verticalTagSpacing;
- (id)_init;
@end

@implementation DOCTagInfoCollectionAppearance

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)DOCTagInfoCollectionAppearance;
  return [(DOCTagInfoCollectionAppearance *)&v3 init];
}

- (NSString)labelFontStyle
{
  return (NSString *)(id)*MEMORY[0x263F835B8];
}

- (double)horizontalTagSpacing
{
  v2 = [MEMORY[0x263F82770] defaultMetrics];
  [v2 scaledValueForValue:3.0];
  double v4 = v3;

  return v4;
}

- (double)verticalTagSpacing
{
  return 3.0;
}

- (double)tagToLabelSpacing
{
  v2 = [MEMORY[0x263F82770] defaultMetrics];
  [v2 scaledValueForValue:4.0];
  double v4 = v3;

  return v4;
}

- (double)cellCornerRadius
{
  return 3.0;
}

- (NSDirectionalEdgeInsets)cellContentInsets
{
  v2 = [MEMORY[0x263F82770] defaultMetrics];
  [v2 scaledValueForValue:4.0];
  double v4 = v3;

  v5 = [MEMORY[0x263F82770] defaultMetrics];
  [v5 scaledValueForValue:4.0];
  double v7 = v6;

  double v8 = 2.0;
  double v9 = 2.0;
  double v10 = v4;
  double v11 = v7;
  result.trailing = v11;
  result.bottom = v9;
  result.leading = v10;
  result.top = v8;
  return result;
}

- (double)dimmingAlphaDuringMenuPresentation
{
  return 1.0;
}

@end