@interface DOCTagListCellAppearance
- (BOOL)addTagCellShowsDashedBorder;
- (DOCTagContainerAppearanceProviding)container;
- (NSDirectionalEdgeInsets)cellExternalMargins;
- (NSDirectionalEdgeInsets)cellInteriorLayoutMargins;
- (NSString)titleTextStyle;
- (UIHoverStyle)cellContentHoverStyle;
- (UIImageSymbolConfiguration)checkmarkImageConfiguration;
- (double)cellCornerRadius;
- (double)dotSize;
- (double)spacing_dotToTitle;
- (double)spacing_leadingEdgeToDot;
- (double)spacing_titleToCheckmark;
- (double)spacing_trailingEdgeToCheckmark;
- (id)_init;
- (id)backgroundColorForTag:(id)a3 selected:(BOOL)a4;
- (id)checkmarkImageColorForTag:(id)a3;
@end

@implementation DOCTagListCellAppearance

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)DOCTagListCellAppearance;
  return [(DOCTagListCellAppearance *)&v3 init];
}

- (DOCTagContainerAppearanceProviding)container
{
  v2 = [[DOCTagPickerPanelAppearance alloc] initWithTopMargin:18.0 bottomMargin:10.0 maxHeight:428.0];

  return (DOCTagContainerAppearanceProviding *)v2;
}

- (BOOL)addTagCellShowsDashedBorder
{
  return 1;
}

- (id)checkmarkImageColorForTag:(id)a3
{
  objc_super v3 = [a3 tagColorIfNotClear];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263F3ABC0] nonClearNoneTagColor];
  }
  v6 = v5;

  return v6;
}

- (UIImageSymbolConfiguration)checkmarkImageConfiguration
{
  return (UIImageSymbolConfiguration *)[MEMORY[0x263F82818] configurationWithWeight:6];
}

- (id)backgroundColorForTag:(id)a3 selected:(BOOL)a4
{
  if (a3 && a4)
  {
    v4 = [a3 tagBackgroundColor];
  }
  else
  {
    id v5 = [MEMORY[0x263F825C8] labelColor];
    v4 = [v5 colorWithAlphaComponent:0.04];
  }

  return v4;
}

- (NSString)titleTextStyle
{
  return (NSString *)(id)*MEMORY[0x263F83570];
}

- (NSDirectionalEdgeInsets)cellExternalMargins
{
  double v2 = 0.0;
  double v3 = 15.0;
  double v4 = 7.0;
  double v5 = 15.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)cellInteriorLayoutMargins
{
  double v2 = 0.0;
  double v3 = 13.0;
  double v4 = 0.0;
  double v5 = 14.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (UIHoverStyle)cellContentHoverStyle
{
  return 0;
}

- (double)dotSize
{
  return 12.0;
}

- (double)cellCornerRadius
{
  return 3.0;
}

- (double)spacing_leadingEdgeToDot
{
  return 13.0;
}

- (double)spacing_dotToTitle
{
  return 14.0;
}

- (double)spacing_trailingEdgeToCheckmark
{
  return 12.0;
}

- (double)spacing_titleToCheckmark
{
  return 12.0;
}

@end