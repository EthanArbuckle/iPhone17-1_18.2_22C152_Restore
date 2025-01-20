@interface CNContactListStyleApplier
+ (void)applyDefaultContactListStyleToHeaderFooter:(id)a3 withTitle:(id)a4 isRTL:(BOOL)a5;
+ (void)applyDefaultStyleToContact:(id)a3 usingFormatter:(id)a4 ofCell:(id)a5;
- (BOOL)usesInsetPlatterStyle;
- (CNContactListStyle)contactListStyle;
- (CNContactListStyleApplier)initWithContactListStyle:(id)a3;
- (double)cellEstimatedHeight;
- (id)attributedString:(id)a3 foregroundColor:(id)a4;
- (unint64_t)tableNoContactsAvailableStyle;
- (void)applyCellSeparatorInsetStyleToConfiguration:(id)a3 superviewDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a4 itemWantsFullLengthBottomSeparator:(BOOL)a5;
- (void)applyContactListDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3 toLayoutSection:(id)a4 collectionViewIsShowingIndexBar:(BOOL)a5;
- (void)applyContactListStyleToBannerFootnote:(id)a3 primaryAppearance:(BOOL)a4;
- (void)applyContactListStyleToBannerTitle:(id)a3 primaryAppearance:(BOOL)a4;
- (void)applyContactListStyleToCell:(id)a3;
- (void)applyContactListStyleToCollectionLayoutConfiguration:(id)a3;
- (void)applyContactListStyleToCollectionView:(id)a3;
- (void)applyContactListStyleToContact:(id)a3 usingFormatter:(id)a4 ofCell:(id)a5;
- (void)applyContactListStyleToContentConfiguration:(id)a3 usingState:(id)a4 forCell:(id)a5;
- (void)applyContactListStyleToEmergencyIcon:(id)a3 ofCell:(id)a4;
- (void)applyContactListStyleToHeaderFooter:(id)a3 withTitle:(id)a4 isRTL:(BOOL)a5;
- (void)applyContactListStyleToMeContactLabel:(id)a3 ofCell:(id)a4;
- (void)applyContactListStyleToNavigationBar:(id)a3;
- (void)applyContactListStyleToSearchBar:(id)a3;
- (void)applyContactListStyleToSearchCell:(id)a3;
- (void)applyContactListStyleToSearchHeader:(id)a3 withTitle:(id)a4;
- (void)applyContactListStyleToSubtitleText:(id)a3 ofSearchResultCell:(id)a4;
- (void)applyEditingStateBackgroundConfigurationToCell:(id)a3;
- (void)applySubtitleTextColorsToSearchCellContentConfiguration:(id)a3 withSubtitleText:(id)a4 forSelectedState:(BOOL)a5;
- (void)applyTextColorsToContentConfiguration:(id)a3 usingState:(id)a4 forCell:(id)a5;
@end

@implementation CNContactListStyleApplier

- (void)applyContactListStyleToCollectionLayoutConfiguration:(id)a3
{
  id v14 = a3;
  v4 = [(CNContactListStyleApplier *)self contactListStyle];
  uint64_t v5 = [v4 tableBackgroundFilteredColor];
  if (v5)
  {
    v6 = (void *)v5;
    uint64_t v7 = [v14 appearance];

    if (v7 == 1)
    {
      v8 = [(CNContactListStyleApplier *)self contactListStyle];
      uint64_t v9 = [v8 tableBackgroundFilteredColor];
LABEL_8:
      v13 = (void *)v9;
      [v14 setBackgroundColor:v9];

      goto LABEL_9;
    }
  }
  else
  {
  }
  v8 = [(CNContactListStyleApplier *)self contactListStyle];
  uint64_t v10 = [v8 tableBackgroundColor];
  if (v10)
  {
    v11 = (void *)v10;
    uint64_t v12 = [v14 appearance];

    if (v12 == 1) {
      goto LABEL_10;
    }
    v8 = [(CNContactListStyleApplier *)self contactListStyle];
    uint64_t v9 = [v8 tableBackgroundColor];
    goto LABEL_8;
  }
LABEL_9:

LABEL_10:
}

- (void)applyContactListDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3 toLayoutSection:(id)a4 collectionViewIsShowingIndexBar:(BOOL)a5
{
  BOOL v5 = a5;
  double trailing = a3.trailing;
  id v20 = a4;
  v8 = [(CNContactListStyleApplier *)self contactListStyle];
  int v9 = [v8 usesInsetPlatterStyle];

  if (v9)
  {
    [v20 contentInsets];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    if (v5)
    {
      v16 = [(CNContactListStyleApplier *)self contactListStyle];
      int v17 = [v16 usesInsetPlatterStyle];

      if (v17)
      {
        v18 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v19 = [v18 userInterfaceIdiom];

        if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
          double trailing = 30.0;
        }
        else {
          double trailing = 15.0;
        }
      }
    }
    objc_msgSend(v20, "setContentInsets:", v11, v13, v15, trailing);
  }
}

- (void)applyCellSeparatorInsetStyleToConfiguration:(id)a3 superviewDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a4 itemWantsFullLengthBottomSeparator:(BOOL)a5
{
  BOOL v5 = a5;
  double trailing = a4.trailing;
  double leading = a4.leading;
  id v9 = a3;
  [v9 topSeparatorInsets];
  double v11 = v10;
  id v27 = v12;
  double v14 = v13;
  [v9 bottomSeparatorInsets];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  if (v5) {
    double v22 = leading;
  }
  else {
    double v22 = v15;
  }
  v23 = [(CNContactListStyleApplier *)self contactListStyle];
  int v24 = [v23 usesInsetPlatterStyle];

  if (v24)
  {
    double v25 = v14;
  }
  else
  {
    double v21 = trailing;
    double v25 = trailing;
  }
  objc_msgSend(v9, "setTopSeparatorInsets:", v11, leading, *(double *)&v27, v25);
  objc_msgSend(v9, "setBottomSeparatorInsets:", v17, v22, v19, v21);
  v26 = [(CNContactListStyleApplier *)self contactListStyle];
  objc_msgSend(v9, "setBottomSeparatorVisibility:", objc_msgSend(v26, "tableSeparatorStyle"));

  id v28 = [(CNContactListStyleApplier *)self contactListStyle];
  objc_msgSend(v9, "setTopSeparatorVisibility:", objc_msgSend(v28, "tableSeparatorStyle"));
}

- (CNContactListStyle)contactListStyle
{
  return self->_contactListStyle;
}

- (void)applyContactListStyleToContact:(id)a3 usingFormatter:(id)a4 ofCell:(id)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  v34[0] = *MEMORY[0x1E4FB06F8];
  id v10 = a4;
  id v11 = a3;
  double v12 = [(CNContactListStyleApplier *)self contactListStyle];
  double v13 = [v12 cellNameTextFont];
  v35[0] = v13;
  v34[1] = *MEMORY[0x1E4F1AEA8];
  double v14 = [(CNContactListStyleApplier *)self contactListStyle];
  double v15 = [v14 cellNameTextEmphasisedFont];
  v35[1] = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  double v17 = [v10 attributedStringForObjectValue:v11 withDefaultAttributes:v16];

  if (![v17 length])
  {
    double v18 = (void *)[v16 mutableCopy];
    double v19 = [(CNContactListStyleApplier *)self contactListStyle];
    double v20 = [v19 cellNameTextFont];
    double v21 = [v20 fontDescriptor];
    double v22 = [v21 fontDescriptorWithSymbolicTraits:1];

    v23 = (void *)MEMORY[0x1E4FB08E0];
    int v24 = [(CNContactListStyleApplier *)self contactListStyle];
    double v25 = [v24 cellNameTextFont];
    [v25 pointSize];
    v26 = objc_msgSend(v23, "fontWithDescriptor:size:", v22);
    [v18 setObject:v26 forKeyedSubscript:v9];

    id v27 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v28 = CNContactsUIBundle();
    v29 = [v28 localizedStringForKey:@"NO_NAME" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v30 = [v27 initWithString:v29 attributes:v18];

    double v17 = (void *)v30;
  }
  objc_opt_class();
  v31 = [v8 contentConfiguration];
  if (objc_opt_isKindOfClass()) {
    v32 = v31;
  }
  else {
    v32 = 0;
  }
  id v33 = v32;

  if (!v33)
  {
    v31 = [v8 defaultContentConfiguration];
  }
  [v31 setAttributedText:v17];
  [v8 setContentConfiguration:v31];
}

- (void)applyContactListStyleToCell:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 backgroundConfiguration];

  if (!v5)
  {
    v6 = [v4 defaultBackgroundConfiguration];
    [v4 setBackgroundConfiguration:v6];
  }
  uint64_t v7 = [(CNContactListStyleApplier *)self contactListStyle];
  id v8 = [v7 cellBackgroundColor];

  if (v8)
  {
    uint64_t v9 = [v4 backgroundView];
    char v10 = [v9 isMemberOfClass:objc_opt_class()];

    if ((v10 & 1) == 0)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      [v4 setBackgroundView:v11];
    }
    double v12 = [(CNContactListStyleApplier *)self contactListStyle];
    double v13 = [v12 cellBackgroundColor];
    double v14 = [v4 backgroundView];
    [v14 setBackgroundColor:v13];

    double v15 = [MEMORY[0x1E4FB1618] clearColor];
    [v4 setBackgroundColor:v15];

    double v16 = [MEMORY[0x1E4FB1618] clearColor];
    double v17 = [v4 contentView];
    [v17 setBackgroundColor:v16];
  }
  objc_opt_class();
  double v18 = [v4 contentConfiguration];
  if (objc_opt_isKindOfClass()) {
    double v19 = v18;
  }
  else {
    double v19 = 0;
  }
  id v20 = v19;

  if (!v20)
  {
    double v18 = [v4 defaultContentConfiguration];
  }
  double v21 = [(CNContactListStyleApplier *)self contactListStyle];
  objc_msgSend(v4, "setOpaque:", objc_msgSend(v21, "cellIsOpaque"));

  [v4 setContentConfiguration:v18];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__CNContactListStyleApplier_applyContactListStyleToCell___block_invoke;
  v23[3] = &unk_1E5497168;
  v23[4] = self;
  id v24 = v18;
  id v22 = v18;
  [v4 setConfigurationUpdateHandler:v23];
}

- (void)applyContactListStyleToHeaderFooter:(id)a3 withTitle:(id)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  [(id)objc_opt_class() applyDefaultContactListStyleToHeaderFooter:v8 withTitle:v7 isRTL:v5];
}

+ (void)applyDefaultContactListStyleToHeaderFooter:(id)a3 withTitle:(id)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v7 = a4;
  if (v15)
  {
    objc_opt_class();
    id v8 = [v15 contentConfiguration];
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (!v10)
    {
      id v8 = [MEMORY[0x1E4FB1948] plainHeaderConfiguration];
    }
    [v8 setText:v7];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
    double v12 = [v8 textProperties];
    [v12 setNumberOfLines:v11];

    if (v5)
    {
      [v8 setAxesPreservingSuperviewLayoutMargins:0];
      [v8 directionalLayoutMargins];
      double v14 = v13;
      [v15 directionalLayoutMargins];
      [v15 directionalLayoutMargins];
      [v8 setDirectionalLayoutMargins:v14];
    }
    [v15 setContentConfiguration:v8];
  }
}

- (void)applyContactListStyleToBannerFootnote:(id)a3 primaryAppearance:(BOOL)a4
{
  id v5 = a3;
  if (a4)
  {
    id v7 = +[CNUIFontRepository contactListBannerFootnoteFontPrimary];
    +[CNUIColorRepository contactListBannerFootnoteTextColorPrimary];
  }
  else
  {
    id v7 = +[CNUIFontRepository contactListBannerFootnoteFontSecondary];
    +[CNUIColorRepository contactListBannerFootnoteTextColorSecondary];
  v6 = };
  [v5 setFont:v7];
  [v5 setColor:v6];
}

- (void)applyContactListStyleToBannerTitle:(id)a3 primaryAppearance:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if (v4)
  {
    v6 = +[CNUIFontRepository contactListBannerTitleFontPrimary];
    [v10 setFont:v6];
  }
  id v7 = [(CNContactListStyleApplier *)self contactListStyle];
  id v8 = [v7 bannerTitleTextColor];
  [v10 setTextColor:v8];

  uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v10 setBackgroundColor:v9];
}

void __57__CNContactListStyleApplier_applyContactListStyleToCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 isEditing]) {
    [*(id *)(a1 + 32) applyEditingStateBackgroundConfigurationToCell:v6];
  }
  [*(id *)(a1 + 32) applyContactListStyleToContentConfiguration:*(void *)(a1 + 40) usingState:v5 forCell:v6];
}

- (void)applyContactListStyleToContentConfiguration:(id)a3 usingState:(id)a4 forCell:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 updatedConfigurationForState:v9];
  [(CNContactListStyleApplier *)self applyTextColorsToContentConfiguration:v10 usingState:v9 forCell:v8];

  [v8 applyAccessories];
  [v8 setContentConfiguration:v10];
}

- (void)applyTextColorsToContentConfiguration:(id)a3 usingState:(id)a4 forCell:(id)a5
{
  id v36 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 isDisabled])
  {
    id v10 = +[CNUIColorRepository contactStyleDefaultDisabledTextColor];
    if (!v10) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v11 = [(CNContactListStyleApplier *)self contactListStyle];
    double v12 = [v11 cellNameTextColor];

    if (v12)
    {
      double v13 = [(CNContactListStyleApplier *)self contactListStyle];
      id v10 = [v13 cellNameTextColor];
    }
    else
    {
      double v13 = [v9 defaultContentConfiguration];
      double v14 = [v13 updatedConfigurationForState:v8];
      id v15 = [v14 textProperties];
      id v10 = [v15 color];
    }
    if (!v10) {
      goto LABEL_14;
    }
  }
  double v16 = [v36 textProperties];
  double v17 = [v16 color];
  char v18 = [v17 isEqual:v10];

  double v19 = (uint64_t *)MEMORY[0x1E4F5A2A0];
  if ((v18 & 1) == 0)
  {
    id v20 = [v36 textProperties];
    [v20 setColor:v10];

    uint64_t v21 = *v19;
    id v22 = [v36 attributedText];
    v23 = [v22 string];
    LODWORD(v21) = (*(uint64_t (**)(uint64_t, void *))(v21 + 16))(v21, v23);

    if (v21)
    {
      id v24 = [v36 attributedText];
      double v25 = [v36 textProperties];
      v26 = [v25 color];
      id v27 = [(CNContactListStyleApplier *)self attributedString:v24 foregroundColor:v26];
      [v36 setAttributedText:v27];
    }
  }
  id v28 = [v36 secondaryTextProperties];
  v29 = [v28 color];
  char v30 = [v29 isEqual:v10];

  if ((v30 & 1) == 0)
  {
    v31 = [v36 secondaryTextProperties];
    [v31 setColor:v10];

    uint64_t v32 = *v19;
    id v33 = [v36 secondaryAttributedText];
    v34 = [v33 string];
    LODWORD(v32) = (*(uint64_t (**)(uint64_t, void *))(v32 + 16))(v32, v34);

    if (v32)
    {
      v35 = [v36 secondaryAttributedText];
      -[CNContactListStyleApplier applySubtitleTextColorsToSearchCellContentConfiguration:withSubtitleText:forSelectedState:](self, "applySubtitleTextColorsToSearchCellContentConfiguration:withSubtitleText:forSelectedState:", v36, v35, [v8 isSelected]);
    }
  }
LABEL_14:
}

- (CNContactListStyleApplier)initWithContactListStyle:(id)a3
{
  id v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)CNContactListStyleApplier,
        id v6 = [(CNContactListStyleApplier *)&v9 init],
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_contactListStyle, a3);
    self = self;
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)applyContactListStyleToSearchBar:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNContactListStyleApplier *)self contactListStyle];
  id v6 = [v5 searchBarBackgroundColor];

  if (v6)
  {
    id v7 = [(CNContactListStyleApplier *)self contactListStyle];
    id v8 = [v7 searchBarBackgroundColor];
    [v4 setBackgroundColor:v8];
  }
  objc_super v9 = [(CNContactListStyleApplier *)self contactListStyle];
  uint64_t v10 = [v9 searchBarStyle];

  if (v10)
  {
    uint64_t v11 = [(CNContactListStyleApplier *)self contactListStyle];
    objc_msgSend(v4, "setBarStyle:", objc_msgSend(v11, "searchBarStyle"));
  }
  double v12 = [(CNContactListStyleApplier *)self contactListStyle];
  int v13 = [v12 searchBarIsTranslucent];

  if (v13)
  {
    double v14 = [(CNContactListStyleApplier *)self contactListStyle];
    objc_msgSend(v4, "setTranslucent:", objc_msgSend(v14, "searchBarIsTranslucent"));
  }
  id v15 = [(CNContactListStyleApplier *)self contactListStyle];
  double v16 = [v15 searchBarTextColor];

  if (v16)
  {
    double v17 = [v4 searchField];
    int v18 = [v17 isEnabled];

    double v19 = [(CNContactListStyleApplier *)self contactListStyle];
    id v20 = v19;
    if (v18) {
      [v19 searchBarTextColor];
    }
    else {
    uint64_t v21 = [v19 searchBarTextDisabledColor];
    }
    id v22 = [v4 searchField];
    [v22 setTextColor:v21];
  }
  v23 = [(CNContactListStyleApplier *)self contactListStyle];
  uint64_t v24 = [v23 searchBarKeyboardAppearance];

  if (v24)
  {
    double v25 = [(CNContactListStyleApplier *)self contactListStyle];
    uint64_t v26 = [v25 searchBarKeyboardAppearance];
    id v27 = [v4 searchField];
    [v27 setKeyboardAppearance:v26];
  }
  id v28 = [v4 searchField];
  char v29 = [v28 isEnabled];
  char v30 = [(CNContactListStyleApplier *)self contactListStyle];
  v31 = v30;
  if (v29) {
    [v30 searchBarPlaceholderTextColor];
  }
  else {
  uint64_t v32 = [v30 searchBarPlaceholderTextDisabledColor];
  }

  id v33 = [v4 searchField];
  v34 = [v33 placeholder];

  if (v34 && v32)
  {
    uint64_t v41 = *MEMORY[0x1E4FB0700];
    v42[0] = v32;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    id v36 = objc_alloc(MEMORY[0x1E4F28E48]);
    v37 = [v4 searchField];
    v38 = [v37 placeholder];
    v39 = (void *)[v36 initWithString:v38 attributes:v35];
    v40 = [v4 searchField];
    [v40 setAttributedPlaceholder:v39];
  }
}

- (void)applyContactListStyleToNavigationBar:(id)a3
{
  id v10 = a3;
  id v4 = [(CNContactListStyleApplier *)self contactListStyle];
  uint64_t v5 = [v4 navigationBarStyle];

  if (v5)
  {
    id v6 = [(CNContactListStyleApplier *)self contactListStyle];
    objc_msgSend(v10, "setBarStyle:", objc_msgSend(v6, "navigationBarStyle"));
  }
  id v7 = [(CNContactListStyleApplier *)self contactListStyle];
  int v8 = [v7 navigationBarIsTranslucent];

  if (v8)
  {
    objc_super v9 = [(CNContactListStyleApplier *)self contactListStyle];
    objc_msgSend(v10, "setTranslucent:", objc_msgSend(v9, "navigationBarIsTranslucent"));
  }
}

- (void)applyContactListStyleToCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactListStyleApplier *)self contactListStyle];
  objc_msgSend(v4, "setOpaque:", objc_msgSend(v5, "tableIsOpaque"));
}

- (void).cxx_destruct
{
}

- (void)applyContactListStyleToEmergencyIcon:(id)a3 ofCell:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4FB1818];
  id v7 = a3;
  id v5 = +[CNUIColorRepository contactListEmergencyContactGlyphColor];
  id v6 = objc_msgSend(v4, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", @"staroflife.fill", 3, v5, 0);
  [v7 setImage:v6];

  [v7 sizeToFit];
}

- (void)applyContactListStyleToMeContactLabel:(id)a3 ofCell:(id)a4
{
  id v4 = a3;
  id v5 = +[CNUIColorRepository contactListMeLabelTextColor];
  [v4 setTextColor:v5];
}

- (void)applySubtitleTextColorsToSearchCellContentConfiguration:(id)a3 withSubtitleText:(id)a4 forSelectedState:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CNContactListStyleApplier *)self contactListStyle];
  uint64_t v11 = [v10 cellSearchResultTextDisabledColor];

  if (v5)
  {
    double v12 = [(CNContactListStyleApplier *)self contactListStyle];
    int v13 = [v12 usesInsetPlatterStyle];

    if (v13)
    {
      double v14 = [(CNContactListStyleApplier *)self contactListStyle];
      uint64_t v15 = [v14 cellBlueSelectionSecondaryTextColor];

      uint64_t v11 = (void *)v15;
    }
  }
  double v16 = [(CNContactListStyleApplier *)self contactListStyle];
  double v17 = [v16 cellSearchResultTextColor];
  int v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v20 = [v8 textProperties];
    id v19 = [v20 color];
  }
  if ([v9 length]) {
    uint64_t v21 = (void *)[v9 mutableCopy];
  }
  else {
    uint64_t v21 = 0;
  }
  objc_msgSend(v21, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v11, 0, objc_msgSend(v21, "length"));
  uint64_t v22 = *MEMORY[0x1E4F1B778];
  uint64_t v23 = [v21 length];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  char v29 = __119__CNContactListStyleApplier_applySubtitleTextColorsToSearchCellContentConfiguration_withSubtitleText_forSelectedState___block_invoke;
  char v30 = &unk_1E5497190;
  id v31 = v21;
  id v32 = v19;
  id v24 = v19;
  id v25 = v21;
  objc_msgSend(v25, "enumerateAttribute:inRange:options:usingBlock:", v22, 0, v23, 0, &v27);
  objc_msgSend(v8, "setSecondaryText:", &stru_1ED8AC728, v27, v28, v29, v30);
  uint64_t v26 = [v8 secondaryTextProperties];
  [v26 setColor:v24];

  [v8 setSecondaryAttributedText:v25];
}

uint64_t __119__CNContactListStyleApplier_applySubtitleTextColorsToSearchCellContentConfiguration_withSubtitleText_forSelectedState___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 BOOLValue];
  if (result)
  {
    uint64_t v8 = *MEMORY[0x1E4FB0700];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    return objc_msgSend(v9, "addAttribute:value:range:", v8, v10, a3, a4);
  }
  return result;
}

- (void)applyContactListStyleToSubtitleText:(id)a3 ofSearchResultCell:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  objc_opt_class();
  id v7 = [v10 contentConfiguration];
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (!v9)
  {
    id v7 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  }
  -[CNContactListStyleApplier applySubtitleTextColorsToSearchCellContentConfiguration:withSubtitleText:forSelectedState:](self, "applySubtitleTextColorsToSearchCellContentConfiguration:withSubtitleText:forSelectedState:", v7, v6, [v10 isSelected]);

  [v10 setContentConfiguration:v7];
}

- (id)attributedString:(id)a3 foregroundColor:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  id v7 = [v6 string];
  uint64_t v8 = [v7 length];

  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v5, 0, v8);

  return v6;
}

- (void)applyContactListStyleToSearchHeader:(id)a3 withTitle:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a4;
  id v7 = a3;
  id v11 = [v5 groupedHeaderConfiguration];
  uint64_t v8 = [v6 uppercaseString];

  [v11 setText:v8];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
  id v10 = [v11 textProperties];
  [v10 setNumberOfLines:v9];

  [v7 setContentConfiguration:v11];
}

- (void)applyContactListStyleToSearchCell:(id)a3
{
  id v8 = a3;
  -[CNContactListStyleApplier applyContactListStyleToCell:](self, "applyContactListStyleToCell:");
  id v4 = [(CNContactListStyleApplier *)self contactListStyle];
  id v5 = [v4 cellSearchBackgroundColor];

  if (v5)
  {
    id v6 = [(CNContactListStyleApplier *)self contactListStyle];
    id v7 = [v6 cellSearchBackgroundColor];
    [v8 setBackgroundColor:v7];
  }
}

- (void)applyEditingStateBackgroundConfigurationToCell:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1498];
  id v4 = a3;
  id v5 = [v3 clearConfiguration];
  [v4 setBackgroundConfiguration:v5];
}

- (BOOL)usesInsetPlatterStyle
{
  v2 = [(CNContactListStyleApplier *)self contactListStyle];
  char v3 = [v2 usesInsetPlatterStyle];

  return v3;
}

- (unint64_t)tableNoContactsAvailableStyle
{
  v2 = [(CNContactListStyleApplier *)self contactListStyle];
  unint64_t v3 = [v2 tableNoContactsAvailableStyle];

  return v3;
}

- (double)cellEstimatedHeight
{
  v2 = [(CNContactListStyleApplier *)self contactListStyle];
  unint64_t v3 = [v2 cellNameTextFont];
  [v3 _scaledValueForValue:44.0];
  double v5 = v4;

  return v5;
}

+ (void)applyDefaultStyleToContact:(id)a3 usingFormatter:(id)a4 ofCell:(id)a5
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  v25[0] = *MEMORY[0x1E4FB06F8];
  id v9 = a4;
  id v10 = a3;
  id v11 = +[CNUIFontRepository contactStyleDefaultTextFont];
  v26[0] = v11;
  v25[1] = *MEMORY[0x1E4FB0700];
  double v12 = +[CNUIColorRepository contactStyleDefaultTextColor];
  v26[1] = v12;
  v25[2] = *MEMORY[0x1E4F1AEA8];
  int v13 = +[CNUIFontRepository contactStyleDefaultBoldTextFont];
  v26[2] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

  uint64_t v15 = [v9 attributedStringForObjectValue:v10 withDefaultAttributes:v14];

  if (![v15 length])
  {
    double v16 = (void *)[v14 mutableCopy];
    double v17 = +[CNUIFontRepository contactStyleDefaultItalicTextFont];
    [v16 setObject:v17 forKeyedSubscript:v8];

    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v19 = CNContactsUIBundle();
    id v20 = [v19 localizedStringForKey:@"NO_NAME" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v21 = [v18 initWithString:v20 attributes:v16];

    uint64_t v15 = (void *)v21;
  }
  objc_opt_class();
  uint64_t v22 = [v7 contentConfiguration];
  if (objc_opt_isKindOfClass()) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  id v24 = v23;

  if (!v24)
  {
    uint64_t v22 = [v7 defaultContentConfiguration];
  }
  [v22 setAttributedText:v15];
  [v7 setContentConfiguration:v22];
}

@end