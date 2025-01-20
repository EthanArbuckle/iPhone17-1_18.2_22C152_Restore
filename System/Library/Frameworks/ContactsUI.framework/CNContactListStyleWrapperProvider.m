@interface CNContactListStyleWrapperProvider
- (BOOL)cellIsOpaque;
- (BOOL)cellIsVibrant;
- (BOOL)navigationBarIsTranslucent;
- (BOOL)searchBarIsTranslucent;
- (BOOL)tableIsOpaque;
- (BOOL)usesInsetPlatterStyle;
- (CNContactListStyleWrapperProvider)initWithContactStyle:(id)a3;
- (CNContactStyle)contactStyle;
- (id)bannerTitleTextColor;
- (id)cellBackgroundColor;
- (id)cellBackgroundSelectedColor;
- (id)cellBlueSelectionSecondaryTextColor;
- (id)cellNameTextColor;
- (id)cellNameTextEmphasisedFont;
- (id)cellNameTextFont;
- (id)cellNameTextHighlightedColor;
- (id)cellSearchBackgroundColor;
- (id)cellSearchResultTextColor;
- (id)cellSearchResultTextDisabledColor;
- (id)headerBackgroundColor;
- (id)headerIndexTextColor;
- (id)searchBarBackgroundColor;
- (id)searchBarPlaceholderTextColor;
- (id)searchBarPlaceholderTextDisabledColor;
- (id)searchBarTextColor;
- (id)searchBarTextDisabledColor;
- (id)tableBackgroundColor;
- (id)tableBackgroundFilteredColor;
- (id)tableSectionIndexBackgroundColor;
- (id)tableSeparatorColor;
- (int64_t)listAppearanceForTraitCollection:(id)a3;
- (int64_t)navigationBarStyle;
- (int64_t)searchBarKeyboardAppearance;
- (int64_t)searchBarStyle;
- (int64_t)tableSeparatorOverlayBlendMode;
- (int64_t)tableSeparatorStyle;
- (unint64_t)tableNoContactsAvailableStyle;
@end

@implementation CNContactListStyleWrapperProvider

- (int64_t)listAppearanceForTraitCollection:(id)a3
{
  return 4 * ([a3 _splitViewControllerContext] == 3);
}

- (id)tableBackgroundFilteredColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  v3 = [v2 groupedBackgroundColor];

  return v3;
}

- (int64_t)tableSeparatorStyle
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = 2 * ([v2 separatorStyle] == 0);

  return v3;
}

- (CNContactStyle)contactStyle
{
  return self->_contactStyle;
}

- (BOOL)usesInsetPlatterStyle
{
  int64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  v5 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v6 = [v5 usesInsetPlatterStyle];

  return v6;
}

- (id)cellBackgroundColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 backgroundColor];

  return v3;
}

- (id)tableBackgroundColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 backgroundColor];

  return v3;
}

- (id)cellNameTextFont
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 textFont];

  return v3;
}

- (id)cellNameTextEmphasisedFont
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 boldTextFont];

  return v3;
}

- (BOOL)cellIsOpaque
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 usesOpaqueBackground];

  return v3;
}

- (id)bannerTitleTextColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 textColor];

  return v3;
}

- (id)cellNameTextColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 listTextColor];

  return v3;
}

- (CNContactListStyleWrapperProvider)initWithContactStyle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactListStyleWrapperProvider;
  char v6 = [(CNContactListStyleWrapperProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStyle, a3);
    v8 = v7;
  }

  return v7;
}

- (id)searchBarTextColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 textColor];

  return v3;
}

- (id)searchBarPlaceholderTextColor
{
  char v3 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  uint64_t v4 = [v3 placeholderTextColor];

  id v5 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v6 = [v5 placeholderTextColor];

  if (!v4)
  {
    v7 = [(CNContactListStyleWrapperProvider *)self contactStyle];
    v8 = [v7 textColor];

    if (!v8)
    {
      uint64_t v4 = 0;
      if (v6) {
        goto LABEL_8;
      }
      goto LABEL_5;
    }
    double v19 = 0.0;
    double v20 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    v9 = [(CNContactListStyleWrapperProvider *)self contactStyle];
    objc_super v10 = [v9 textColor];
    [v10 getRed:&v20 green:&v19 blue:&v18 alpha:&v17];

    uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:v20 green:v19 blue:v18 alpha:v17 * 0.5];
  }
  if (v6) {
    goto LABEL_8;
  }
LABEL_5:
  v11 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  v12 = [v11 readOnlyTextColor];

  if (v12)
  {
    double v19 = 0.0;
    double v20 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    v13 = [(CNContactListStyleWrapperProvider *)self contactStyle];
    v14 = [v13 readOnlyTextColor];
    [v14 getRed:&v20 green:&v19 blue:&v18 alpha:&v17];

    uint64_t v15 = [MEMORY[0x1E4FB1618] colorWithRed:v20 green:v19 blue:v18 alpha:v17 * 0.5];

    uint64_t v4 = (void *)v15;
  }
LABEL_8:

  return v4;
}

- (int64_t)searchBarKeyboardAppearance
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 keyboardAppearance];

  return v3;
}

- (id)searchBarBackgroundColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 searchBarBackgroundColor];

  return v3;
}

- (int64_t)navigationBarStyle
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 barStyle];

  return v3;
}

- (int64_t)searchBarStyle
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 barStyle];

  return v3;
}

- (BOOL)navigationBarIsTranslucent
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 usesTranslucentBarStyle];

  return v3;
}

- (BOOL)searchBarIsTranslucent
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 usesTranslucentBarStyle];

  return v3;
}

- (BOOL)tableIsOpaque
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 usesOpaqueBackground];

  return v3;
}

- (void).cxx_destruct
{
}

- (id)searchBarPlaceholderTextDisabledColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 placeholderTextColor];

  return v3;
}

- (id)searchBarTextDisabledColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 readOnlyTextColor];

  return v3;
}

- (int64_t)tableSeparatorOverlayBlendMode
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 separatorBackdropOverlayBlendMode];

  return v3;
}

- (unint64_t)tableNoContactsAvailableStyle
{
  int64_t v3 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  if ([v3 barStyle])
  {
    unint64_t v4 = 1;
  }
  else
  {
    id v5 = [(CNContactListStyleWrapperProvider *)self contactStyle];
    unint64_t v4 = [v5 blurSupported];
  }
  return v4;
}

- (id)tableSeparatorColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 separatorColor];

  return v3;
}

- (id)tableSectionIndexBackgroundColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 sectionIndexBackgroundColor];

  return v3;
}

- (id)headerIndexTextColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  int64_t v3 = [v2 textColor];

  return v3;
}

- (id)headerBackgroundColor
{
  int64_t v3 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  unint64_t v4 = [v3 headerBackgroundColor];
  id v5 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v6 = v5;
  if (v4) {
    [v5 headerBackgroundColor];
  }
  else {
  v7 = [v5 backgroundColor];
  }

  return v7;
}

- (BOOL)cellIsVibrant
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 blurSupported];

  return v3;
}

- (id)cellBlueSelectionSecondaryTextColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 blueSelectionSecondaryTextColor];

  return v3;
}

- (id)cellSearchResultTextDisabledColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 disabledTextColor];

  return v3;
}

- (id)cellSearchResultTextColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 listTextColor];

  return v3;
}

- (id)cellSearchBackgroundColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 searchCellBackgroundColor];

  return v3;
}

- (id)cellNameTextHighlightedColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 highlightedTextColor];

  return v3;
}

- (id)cellBackgroundSelectedColor
{
  v2 = [(CNContactListStyleWrapperProvider *)self contactStyle];
  char v3 = [v2 selectedCellBackgroundColor];

  return v3;
}

@end