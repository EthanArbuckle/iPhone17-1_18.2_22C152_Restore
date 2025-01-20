@interface DOCTagMakerAppearance
- (BOOL)inputFieldShowsLeadingDot;
- (DOCTagContainerAppearanceProviding)container;
- (NSDirectionalEdgeInsets)inputFieldRoundedCornerBackgroundMargins;
- (NSDirectionalEdgeInsets)rowOfTagsContentInsets;
- (UIColor)rowOfTagsDotSelectionBorderColor;
- (double)rowOfTagsDotSelectionBorderWidth;
- (double)rowOfTagsDotSize;
- (id)_init;
@end

@implementation DOCTagMakerAppearance

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)DOCTagMakerAppearance;
  return [(DOCTagMakerAppearance *)&v3 init];
}

- (DOCTagContainerAppearanceProviding)container
{
  v2 = [[DOCTagPickerPanelAppearance alloc] initWithTopMargin:18.0 bottomMargin:18.0 maxHeight:-12341234.0];

  return (DOCTagContainerAppearanceProviding *)v2;
}

- (BOOL)inputFieldShowsLeadingDot
{
  return 1;
}

- (NSDirectionalEdgeInsets)inputFieldRoundedCornerBackgroundMargins
{
  double v2 = *MEMORY[0x263F82250];
  double v3 = *(double *)(MEMORY[0x263F82250] + 8);
  double v4 = *(double *)(MEMORY[0x263F82250] + 16);
  double v5 = *(double *)(MEMORY[0x263F82250] + 24);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)rowOfTagsDotSize
{
  return 30.0;
}

- (double)rowOfTagsDotSelectionBorderWidth
{
  return 0.0;
}

- (UIColor)rowOfTagsDotSelectionBorderColor
{
  return (UIColor *)[MEMORY[0x263F825C8] clearColor];
}

- (NSDirectionalEdgeInsets)rowOfTagsContentInsets
{
  double v2 = +[DOCTagAppearance pickerList];
  [v2 cellExternalMargins];
  double v4 = v3 + -8.0;

  double v5 = +[DOCTagAppearance pickerList];
  [v5 cellExternalMargins];
  double v7 = v6 + -8.0;

  double v8 = 8.0;
  double v9 = 8.0;
  double v10 = v4;
  double v11 = v7;
  result.trailing = v11;
  result.bottom = v9;
  result.leading = v10;
  result.top = v8;
  return result;
}

@end