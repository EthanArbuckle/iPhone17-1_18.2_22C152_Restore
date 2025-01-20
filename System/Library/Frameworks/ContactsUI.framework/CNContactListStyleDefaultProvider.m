@interface CNContactListStyleDefaultProvider
- (BOOL)cellIsOpaque;
- (BOOL)cellIsVibrant;
- (BOOL)navigationBarIsTranslucent;
- (BOOL)searchBarIsTranslucent;
- (BOOL)tableIsOpaque;
- (BOOL)usesInsetPlatterStyle;
- (UIColor)bannerTitleTextColor;
- (UIColor)cellBackgroundColor;
- (UIColor)cellBackgroundSelectedColor;
- (UIColor)cellBlueSelectionSecondaryTextColor;
- (UIColor)cellNameTextColor;
- (UIColor)cellNameTextHighlightedColor;
- (UIColor)cellNameTextHighlightedLightColor;
- (UIColor)cellSearchBackgroundColor;
- (UIColor)cellSearchResultTextColor;
- (UIColor)cellSearchResultTextDisabledColor;
- (UIColor)headerBackgroundColor;
- (UIColor)headerIndexTextColor;
- (UIColor)searchBarBackgroundColor;
- (UIColor)searchBarPlaceholderTextColor;
- (UIColor)searchBarPlaceholderTextDisabledColor;
- (UIColor)searchBarTextColor;
- (UIColor)searchBarTextDisabledColor;
- (UIColor)tableBackgroundColor;
- (UIColor)tableBackgroundFilteredColor;
- (UIColor)tableSectionIndexBackgroundColor;
- (UIColor)tableSeparatorColor;
- (UIFont)cellNameTextEmphasisedFont;
- (UIFont)cellNameTextFont;
- (int64_t)navigationBarStyle;
- (int64_t)searchBarKeyboardAppearance;
- (int64_t)searchBarStyle;
- (int64_t)tableSeparatorOverlayBlendMode;
- (int64_t)tableSeparatorStyle;
- (unint64_t)tableNoContactsAvailableStyle;
@end

@implementation CNContactListStyleDefaultProvider

- (BOOL)navigationBarIsTranslucent
{
  return 0;
}

- (int64_t)navigationBarStyle
{
  return 0;
}

- (BOOL)searchBarIsTranslucent
{
  return 0;
}

- (int64_t)searchBarKeyboardAppearance
{
  return 0;
}

- (int64_t)searchBarStyle
{
  return 0;
}

- (UIColor)searchBarPlaceholderTextDisabledColor
{
  return +[CNUIColorRepository contactStyleDefaultPlaceholderTextColor];
}

- (UIColor)searchBarPlaceholderTextColor
{
  return +[CNUIColorRepository contactStyleDefaultPlaceholderTextColor];
}

- (UIColor)searchBarTextDisabledColor
{
  return +[CNUIColorRepository contactStyleDefaultReadOnlyTextColor];
}

- (UIColor)searchBarTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor];
}

- (UIColor)searchBarBackgroundColor
{
  return 0;
}

- (BOOL)usesInsetPlatterStyle
{
  return 0;
}

- (BOOL)tableIsOpaque
{
  return 1;
}

- (int64_t)tableSeparatorOverlayBlendMode
{
  return 0;
}

- (int64_t)tableSeparatorStyle
{
  return 0;
}

- (unint64_t)tableNoContactsAvailableStyle
{
  return 0;
}

- (UIColor)tableSeparatorColor
{
  return +[CNUIColorRepository contactStyleDefaultSeparatorColor];
}

- (UIColor)tableSectionIndexBackgroundColor
{
  return 0;
}

- (UIColor)tableBackgroundFilteredColor
{
  return 0;
}

- (UIColor)tableBackgroundColor
{
  return 0;
}

- (UIColor)bannerTitleTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor];
}

- (UIColor)headerIndexTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor];
}

- (UIColor)headerBackgroundColor
{
  return 0;
}

- (BOOL)cellIsVibrant
{
  return 0;
}

- (BOOL)cellIsOpaque
{
  return 1;
}

- (UIFont)cellNameTextEmphasisedFont
{
  return +[CNUIFontRepository contactStyleDefaultBoldTextFont];
}

- (UIFont)cellNameTextFont
{
  return +[CNUIFontRepository contactStyleDefaultTextFont];
}

- (UIColor)cellBlueSelectionSecondaryTextColor
{
  return +[CNUIColorRepository contactStyleDefaultBlueSelectionSecondaryTextColor];
}

- (UIColor)cellSearchResultTextDisabledColor
{
  return +[CNUIColorRepository contactStyleDefaultDisabledTextColor];
}

- (UIColor)cellSearchResultTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor];
}

- (UIColor)cellSearchBackgroundColor
{
  return +[CNUIColorRepository contactStyleDefaultSearchCellBackgroundColor];
}

- (UIColor)cellNameTextHighlightedLightColor
{
  return +[CNUIColorRepository contactStyleLightStyleHighlightedTextColor];
}

- (UIColor)cellNameTextHighlightedColor
{
  return +[CNUIColorRepository contactStyleDefaultHighlightedTextColor];
}

- (UIColor)cellNameTextColor
{
  return +[CNUIColorRepository contactStyleDefaultTextColor];
}

- (UIColor)cellBackgroundSelectedColor
{
  return +[CNUIColorRepository contactStyleDefaultSelectedCellBackgroundColor];
}

- (UIColor)cellBackgroundColor
{
  return 0;
}

@end