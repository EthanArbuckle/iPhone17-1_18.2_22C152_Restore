@interface CNContactStyle
+ (BOOL)supportsSecureCoding;
+ (id)currentStyle;
+ (id)darkStyleWithOverrideUserInterfaceStyle:(int64_t)a3;
+ (id)defaultStyle;
+ (id)faceTimeStyle;
+ (id)siriStyle;
+ (id)spotlightStyle;
+ (id)testStyle;
+ (id)watchStyle;
+ (void)setCurrentStyle:(id)a3;
- (BOOL)blurSupported;
- (BOOL)shouldPresentInCurrentContext;
- (BOOL)usesInsetPlatterStyle;
- (BOOL)usesOpaqueBackground;
- (BOOL)usesTranslucentBarStyle;
- (CNContactStyle)init;
- (CNContactStyle)initWithCoder:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)blueSelectionSecondaryTextColor;
- (UIColor)contactHeaderBackgroundColor;
- (UIColor)contactHeaderDropShadowColor;
- (UIColor)disabledTextColor;
- (UIColor)groupedBackgroundColor;
- (UIColor)headerBackgroundColor;
- (UIColor)highlightedTextColor;
- (UIColor)highlightedTextLightColor;
- (UIColor)listTextColor;
- (UIColor)notesTextColor;
- (UIColor)placeholderTextColor;
- (UIColor)readOnlyTextColor;
- (UIColor)searchBarBackgroundColor;
- (UIColor)searchCellBackgroundColor;
- (UIColor)sectionBackgroundColor;
- (UIColor)sectionHeaderTextColor;
- (UIColor)sectionIndexBackgroundColor;
- (UIColor)selectedCellBackgroundColor;
- (UIColor)separatorColor;
- (UIColor)suggestedLabelTextColor;
- (UIColor)suggestedValueTextColor;
- (UIColor)taglineTextColor;
- (UIColor)textColor;
- (UIColor)tintColorOverride;
- (UIColor)transportBackgroundColor;
- (UIColor)transportBoldBackgroundColor;
- (UIColor)transportBorderColor;
- (UIEdgeInsets)separatorInset;
- (UIFont)boldTextFont;
- (UIFont)textFont;
- (double)sectionContentInset;
- (double)sectionCornerRadius;
- (double)sectionMaximumPlatterWidth;
- (int64_t)barStyle;
- (int64_t)contactViewPlatterStyle;
- (int64_t)inlineActionsViewStyle;
- (int64_t)keyboardAppearance;
- (int64_t)modalTransitionStyle;
- (int64_t)separatorBackdropOverlayBlendMode;
- (int64_t)separatorStyle;
- (int64_t)topActionsViewStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBarStyle:(int64_t)a3;
- (void)setBlueSelectionSecondaryTextColor:(id)a3;
- (void)setBlurSupported:(BOOL)a3;
- (void)setContactHeaderBackgroundColor:(id)a3;
- (void)setContactHeaderDropShadowColor:(id)a3;
- (void)setContactViewPlatterStyle:(int64_t)a3;
- (void)setDisabledTextColor:(id)a3;
- (void)setGroupedBackgroundColor:(id)a3;
- (void)setHeaderBackgroundColor:(id)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setHighlightedTextLightColor:(id)a3;
- (void)setInlineActionsViewStyle:(int64_t)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setListTextColor:(id)a3;
- (void)setModalTransitionStyle:(int64_t)a3;
- (void)setNotesTextColor:(id)a3;
- (void)setPlaceholderTextColor:(id)a3;
- (void)setReadOnlyTextColor:(id)a3;
- (void)setSearchBarBackgroundColor:(id)a3;
- (void)setSearchCellBackgroundColor:(id)a3;
- (void)setSectionBackgroundColor:(id)a3;
- (void)setSectionContentInset:(double)a3;
- (void)setSectionCornerRadius:(double)a3;
- (void)setSectionHeaderTextColor:(id)a3;
- (void)setSectionIndexBackgroundColor:(id)a3;
- (void)setSectionMaximumPlatterWidth:(double)a3;
- (void)setSelectedCellBackgroundColor:(id)a3;
- (void)setSeparatorBackdropOverlayBlendMode:(int64_t)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorInset:(UIEdgeInsets)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setShouldPresentInCurrentContext:(BOOL)a3;
- (void)setSuggestedLabelTextColor:(id)a3;
- (void)setSuggestedValueTextColor:(id)a3;
- (void)setTaglineTextColor:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTintColorOverride:(id)a3;
- (void)setTopActionsViewStyle:(int64_t)a3;
- (void)setTransportBackgroundColor:(id)a3;
- (void)setTransportBoldBackgroundColor:(id)a3;
- (void)setTransportBorderColor:(id)a3;
- (void)setUsesOpaqueBackground:(BOOL)a3;
- (void)setUsesTranslucentBarStyle:(BOOL)a3;
@end

@implementation CNContactStyle

- (UIColor)groupedBackgroundColor
{
  return self->_groupedBackgroundColor;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIFont)textFont
{
  return +[CNUIFontRepository contactStyleDefaultTextFont];
}

- (UIFont)boldTextFont
{
  return +[CNUIFontRepository contactStyleDefaultBoldTextFont];
}

- (BOOL)usesOpaqueBackground
{
  return self->_usesOpaqueBackground;
}

- (CNContactStyle)init
{
  v26.receiver = self;
  v26.super_class = (Class)CNContactStyle;
  v2 = [(CNContactStyle *)&v26 init];
  if (v2)
  {
    v3 = +[CNUIColorRepository contactStyleDefaultTextColor];
    [(CNContactStyle *)v2 setTextColor:v3];

    v4 = +[CNUIColorRepository contactStyleDefaultTaglineTextColor];
    [(CNContactStyle *)v2 setTaglineTextColor:v4];

    v5 = +[CNUIColorRepository contactStyleDefaultDisabledTextColor];
    [(CNContactStyle *)v2 setDisabledTextColor:v5];

    v6 = +[CNUIColorRepository contactStyleDefaultBlueSelectionSecondaryTextColor];
    [(CNContactStyle *)v2 setBlueSelectionSecondaryTextColor:v6];

    v7 = +[CNUIColorRepository contactStyleDefaultHighlightedTextColor];
    [(CNContactStyle *)v2 setHighlightedTextColor:v7];

    v8 = +[CNUIColorRepository contactStyleDefaultPlaceholderTextColor];
    [(CNContactStyle *)v2 setPlaceholderTextColor:v8];

    v9 = +[CNUIColorRepository contactStyleDefaultNotesTextColor];
    [(CNContactStyle *)v2 setNotesTextColor:v9];

    v10 = +[CNUIColorRepository contactStyleDefaultReadOnlyTextColor];
    [(CNContactStyle *)v2 setReadOnlyTextColor:v10];

    v11 = +[CNUIColorRepository contactStyleDefaultSuggestedLabelTextColor];
    [(CNContactStyle *)v2 setSuggestedLabelTextColor:v11];

    v12 = +[CNUIColorRepository contactStyleDefaultSuggestedValueTextColor];
    [(CNContactStyle *)v2 setSuggestedValueTextColor:v12];

    [(CNContactStyle *)v2 setContactViewPlatterStyle:1];
    uint64_t v13 = [(CNContactStyle *)v2 contactViewPlatterStyle];
    [(CNContactStyle *)v2 setUsesOpaqueBackground:1];
    v14 = +[CNUIColorRepository contactStyleDefaultTransportBackgroundColor];
    [(CNContactStyle *)v2 setTransportBackgroundColor:v14];

    v15 = +[CNUIColorRepository contactStyleDefaultTransportBorderColor];
    [(CNContactStyle *)v2 setTransportBorderColor:v15];

    if (v13 == 1)
    {
      v16 = +[CNUIColorRepository contactStyleWithInsetPlattersDefaultContactHeaderBackgroundColor];
      [(CNContactStyle *)v2 setContactHeaderBackgroundColor:v16];

      v17 = +[CNUIColorRepository contactStyleWithInsetPlattersDefaultContactHeaderDropShadowColor];
      uint64_t v18 = 7;
    }
    else
    {
      v19 = +[CNUIColorRepository contactStyleDefaultContactHeaderBackgroundColor];
      [(CNContactStyle *)v2 setContactHeaderBackgroundColor:v19];

      v17 = +[CNUIColorRepository contactStyleDefaultContactHeaderDropShadowColor];
      uint64_t v18 = 4;
    }
    [(CNContactStyle *)v2 setContactHeaderDropShadowColor:v17];

    [(CNContactStyle *)v2 setSectionMaximumPlatterWidth:454.0];
    [(CNContactStyle *)v2 setSectionCornerRadius:8.0];
    [(CNContactStyle *)v2 setSectionContentInset:16.0];
    v20 = +[CNUIColorRepository contactStyleDefaultSeparatorColor];
    [(CNContactStyle *)v2 setSeparatorColor:v20];

    [(CNContactStyle *)v2 setSeparatorStyle:1];
    v21 = +[CNUIColorRepository contactStyleDefaultSelectedCellBackgroundColor];
    [(CNContactStyle *)v2 setSelectedCellBackgroundColor:v21];

    v22 = +[CNUIColorRepository contactStyleDefaultGroupedBackgroundColor];
    [(CNContactStyle *)v2 setGroupedBackgroundColor:v22];

    v23 = +[CNUIColorRepository contactStyleDefaultSearchCellBackgroundColor];
    [(CNContactStyle *)v2 setSearchCellBackgroundColor:v23];

    [(CNContactStyle *)v2 setUsesTranslucentBarStyle:0];
    [(CNContactStyle *)v2 setTopActionsViewStyle:v18];
    [(CNContactStyle *)v2 setInlineActionsViewStyle:1];
    v24 = v2;
  }

  return v2;
}

- (void)setUsesTranslucentBarStyle:(BOOL)a3
{
  self->_usesTranslucentBarStyle = a3;
}

- (void)setUsesOpaqueBackground:(BOOL)a3
{
  self->_usesOpaqueBackground = a3;
}

- (void)setTransportBorderColor:(id)a3
{
}

- (void)setTransportBackgroundColor:(id)a3
{
}

- (void)setTopActionsViewStyle:(int64_t)a3
{
  self->_topActionsViewStyle = a3;
}

- (void)setTextColor:(id)a3
{
}

- (void)setTaglineTextColor:(id)a3
{
}

- (void)setSuggestedValueTextColor:(id)a3
{
}

- (void)setSuggestedLabelTextColor:(id)a3
{
}

- (void)setSeparatorStyle:(int64_t)a3
{
  self->_separatorStyle = a3;
}

- (void)setSeparatorColor:(id)a3
{
}

- (void)setSelectedCellBackgroundColor:(id)a3
{
}

- (void)setSectionMaximumPlatterWidth:(double)a3
{
  self->_sectionMaximumPlatterWidth = a3;
}

- (void)setSectionCornerRadius:(double)a3
{
  self->_sectionCornerRadius = a3;
}

- (void)setSectionContentInset:(double)a3
{
  self->_sectionContentInset = a3;
}

- (void)setSearchCellBackgroundColor:(id)a3
{
}

- (void)setReadOnlyTextColor:(id)a3
{
}

- (void)setPlaceholderTextColor:(id)a3
{
}

- (void)setNotesTextColor:(id)a3
{
}

- (void)setInlineActionsViewStyle:(int64_t)a3
{
  self->_inlineActionsViewStyle = a3;
}

- (void)setHighlightedTextColor:(id)a3
{
}

- (void)setGroupedBackgroundColor:(id)a3
{
}

- (void)setDisabledTextColor:(id)a3
{
}

- (void)setContactViewPlatterStyle:(int64_t)a3
{
  self->_contactViewPlatterStyle = a3;
}

- (void)setContactHeaderDropShadowColor:(id)a3
{
}

- (void)setContactHeaderBackgroundColor:(id)a3
{
}

- (void)setBlueSelectionSecondaryTextColor:(id)a3
{
}

- (UIColor)listTextColor
{
  return self->_listTextColor;
}

- (BOOL)shouldPresentInCurrentContext
{
  return self->_shouldPresentInCurrentContext;
}

+ (id)currentStyle
{
  v3 = (void *)sCurrentStyle;
  if (!sCurrentStyle)
  {
    if (CNUIIsFaceTime())
    {
      uint64_t v4 = [a1 faceTimeStyle];
    }
    else
    {
      if (CNUIIsWatchCompanion()) {
        [a1 watchStyle];
      }
      else {
      uint64_t v4 = [a1 defaultStyle];
      }
    }
    v5 = (void *)sCurrentStyle;
    sCurrentStyle = v4;

    v3 = (void *)sCurrentStyle;
  }

  return v3;
}

- (BOOL)usesInsetPlatterStyle
{
  return [(CNContactStyle *)self contactViewPlatterStyle] == 1;
}

- (int64_t)contactViewPlatterStyle
{
  return self->_contactViewPlatterStyle;
}

+ (id)defaultStyle
{
  v2 = objc_alloc_init(CNContactStyle);

  return v2;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)placeholderTextColor
{
  return self->_placeholderTextColor;
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (UIColor)searchBarBackgroundColor
{
  return self->_searchBarBackgroundColor;
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (BOOL)usesTranslucentBarStyle
{
  return self->_usesTranslucentBarStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listTextColor, 0);
  objc_storeStrong((id *)&self->_searchCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_groupedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_headerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColorOverride, 0);
  objc_storeStrong((id *)&self->_contactHeaderDropShadowColor, 0);
  objc_storeStrong((id *)&self->_contactHeaderBackgroundColor, 0);
  objc_storeStrong((id *)&self->_transportBoldBackgroundColor, 0);
  objc_storeStrong((id *)&self->_transportBorderColor, 0);
  objc_storeStrong((id *)&self->_transportBackgroundColor, 0);
  objc_storeStrong((id *)&self->_searchBarBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionIndexBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_notesTextColor, 0);
  objc_storeStrong((id *)&self->_readOnlyTextColor, 0);
  objc_storeStrong((id *)&self->_suggestedValueTextColor, 0);
  objc_storeStrong((id *)&self->_suggestedLabelTextColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextLightColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_placeholderTextColor, 0);
  objc_storeStrong((id *)&self->_blueSelectionSecondaryTextColor, 0);
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
  objc_storeStrong((id *)&self->_taglineTextColor, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTextColor, 0);

  objc_storeStrong((id *)&self->_textColor, 0);
}

- (double)sectionContentInset
{
  return self->_sectionContentInset;
}

- (double)sectionCornerRadius
{
  return self->_sectionCornerRadius;
}

- (double)sectionMaximumPlatterWidth
{
  return self->_sectionMaximumPlatterWidth;
}

- (int64_t)inlineActionsViewStyle
{
  return self->_inlineActionsViewStyle;
}

- (int64_t)topActionsViewStyle
{
  return self->_topActionsViewStyle;
}

- (void)setModalTransitionStyle:(int64_t)a3
{
  self->_modalTransitionStyle = a3;
}

- (int64_t)modalTransitionStyle
{
  return self->_modalTransitionStyle;
}

- (void)setBlurSupported:(BOOL)a3
{
  self->_blurSupported = a3;
}

- (BOOL)blurSupported
{
  return self->_blurSupported;
}

- (void)setShouldPresentInCurrentContext:(BOOL)a3
{
  self->_shouldPresentInCurrentContext = a3;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (void)setBarStyle:(int64_t)a3
{
  self->_barStyle = a3;
}

- (void)setListTextColor:(id)a3
{
}

- (UIColor)searchCellBackgroundColor
{
  return self->_searchCellBackgroundColor;
}

- (UIColor)selectedCellBackgroundColor
{
  return self->_selectedCellBackgroundColor;
}

- (void)setSectionBackgroundColor:(id)a3
{
}

- (UIColor)sectionBackgroundColor
{
  return self->_sectionBackgroundColor;
}

- (void)setSeparatorInset:(UIEdgeInsets)a3
{
  self->_separatorInset = a3;
}

- (UIEdgeInsets)separatorInset
{
  double top = self->_separatorInset.top;
  double left = self->_separatorInset.left;
  double bottom = self->_separatorInset.bottom;
  double right = self->_separatorInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setHeaderBackgroundColor:(id)a3
{
}

- (UIColor)headerBackgroundColor
{
  return self->_headerBackgroundColor;
}

- (void)setTintColorOverride:(id)a3
{
}

- (UIColor)tintColorOverride
{
  return self->_tintColorOverride;
}

- (UIColor)contactHeaderDropShadowColor
{
  return self->_contactHeaderDropShadowColor;
}

- (UIColor)contactHeaderBackgroundColor
{
  return self->_contactHeaderBackgroundColor;
}

- (void)setTransportBoldBackgroundColor:(id)a3
{
}

- (UIColor)transportBoldBackgroundColor
{
  return self->_transportBoldBackgroundColor;
}

- (UIColor)transportBorderColor
{
  return self->_transportBorderColor;
}

- (UIColor)transportBackgroundColor
{
  return self->_transportBackgroundColor;
}

- (void)setSearchBarBackgroundColor:(id)a3
{
}

- (void)setSeparatorBackdropOverlayBlendMode:(int64_t)a3
{
  self->_separatorBackdropOverlayBlendMode = a3;
}

- (int64_t)separatorBackdropOverlayBlendMode
{
  return self->_separatorBackdropOverlayBlendMode;
}

- (void)setSectionIndexBackgroundColor:(id)a3
{
}

- (UIColor)sectionIndexBackgroundColor
{
  return self->_sectionIndexBackgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)notesTextColor
{
  return self->_notesTextColor;
}

- (UIColor)readOnlyTextColor
{
  return self->_readOnlyTextColor;
}

- (UIColor)suggestedValueTextColor
{
  return self->_suggestedValueTextColor;
}

- (UIColor)suggestedLabelTextColor
{
  return self->_suggestedLabelTextColor;
}

- (void)setHighlightedTextLightColor:(id)a3
{
}

- (UIColor)highlightedTextLightColor
{
  return self->_highlightedTextLightColor;
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (UIColor)blueSelectionSecondaryTextColor
{
  return self->_blueSelectionSecondaryTextColor;
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (UIColor)taglineTextColor
{
  return self->_taglineTextColor;
}

- (void)setSectionHeaderTextColor:(id)a3
{
}

- (UIColor)sectionHeaderTextColor
{
  return self->_sectionHeaderTextColor;
}

- (void)encodeWithCoder:(id)a3
{
  textColor = self->_textColor;
  id v5 = a3;
  [v5 encodeObject:textColor forKey:@"textColor"];
  [v5 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
}

- (CNContactStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactStyle;
  id v5 = [(CNContactStyle *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textColor"];
    [(CNContactStyle *)v5 setTextColor:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    [(CNContactStyle *)v5 setBackgroundColor:v7];

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)setCurrentStyle:(id)a3
{
  objc_storeStrong((id *)&sCurrentStyle, a3);
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"CNContactStyleCurrentStyleDidChangeNotification" object:0];
}

+ (id)testStyle
{
  v2 = +[CNContactStyle defaultStyle];
  v3 = [MEMORY[0x1E4FB1618] blueColor];
  [v2 setTextColor:v3];

  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v2 setSectionHeaderTextColor:v4];

  id v5 = [v2 textColor];
  [v2 setTaglineTextColor:v5];

  v6 = [MEMORY[0x1E4FB1618] cyanColor];
  [v2 setDisabledTextColor:v6];

  v7 = [MEMORY[0x1E4FB1618] brownColor];
  [v2 setPlaceholderTextColor:v7];

  v8 = [MEMORY[0x1E4FB1618] orangeColor];
  [v2 setHighlightedTextColor:v8];

  v9 = [MEMORY[0x1E4FB1618] purpleColor];
  [v2 setHeaderBackgroundColor:v9];

  objc_super v10 = [v2 textColor];
  [v2 setListTextColor:v10];

  v11 = [MEMORY[0x1E4FB1618] greenColor];
  [v2 setBackgroundColor:v11];

  v12 = [MEMORY[0x1E4FB1618] greenColor];
  [v2 setSearchBarBackgroundColor:v12];

  uint64_t v13 = [MEMORY[0x1E4FB1618] magentaColor];
  [v2 setTransportBackgroundColor:v13];

  v14 = [MEMORY[0x1E4FB1618] brownColor];
  [v2 setTransportBorderColor:v14];

  v15 = [MEMORY[0x1E4FB1618] yellowColor];
  [v2 setSeparatorColor:v15];

  v16 = [MEMORY[0x1E4FB1618] redColor];
  [v2 setSectionBackgroundColor:v16];

  v17 = [MEMORY[0x1E4FB1618] brownColor];
  [v2 setSelectedCellBackgroundColor:v17];

  [v2 setBarStyle:1];
  [v2 setKeyboardAppearance:1];

  return v2;
}

+ (id)siriStyle
{
  v2 = +[CNContactStyle defaultStyle];
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "siriui_textColor");
  [v2 setTextColor:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "siriui_textColor");
  [v2 setSectionHeaderTextColor:v4];

  id v5 = [v2 textColor];
  [v2 setTaglineTextColor:v5];

  v6 = objc_msgSend(MEMORY[0x1E4FB1618], "siriui_textColor");
  [v2 setNotesTextColor:v6];

  v7 = [v2 textColor];
  [v2 setListTextColor:v7];

  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v8];

  v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setContactHeaderBackgroundColor:v9];

  objc_super v10 = objc_msgSend(MEMORY[0x1E4FB1618], "siriui_keylineColor");
  [v2 setContactHeaderDropShadowColor:v10];

  v11 = objc_msgSend(MEMORY[0x1E4FB1618], "siriui_keylineColor");
  [v2 setSeparatorColor:v11];

  objc_msgSend(v2, "setSeparatorInset:", 0.0, 16.0, 0.0, 16.0);
  v12 = objc_msgSend(MEMORY[0x1E4FB1618], "siriui_highlightColor");
  [v2 setSelectedCellBackgroundColor:v12];

  uint64_t v13 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setSectionBackgroundColor:v13];

  [v2 setModalTransitionStyle:14];
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    [MEMORY[0x1E4FB1618] systemDarkBlueColor];
  }
  else {
  v14 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  [v2 setTintColorOverride:v14];

  return v2;
}

+ (id)watchStyle
{
  v2 = [a1 defaultStyle];
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 setTextColor:v3];

  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 setSectionHeaderTextColor:v4];

  id v5 = [v2 textColor];
  [v2 setTaglineTextColor:v5];

  v6 = [v2 textColor];
  [v2 setNotesTextColor:v6];

  v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 setHighlightedTextColor:v7];

  v8 = [v2 textColor];
  [v2 setListTextColor:v8];

  [v2 setUsesOpaqueBackground:1];
  v9 = [MEMORY[0x1E4FB1618] colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];
  [v2 setBackgroundColor:v9];

  objc_super v10 = [MEMORY[0x1E4FB1618] colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];
  [v2 setSearchBarBackgroundColor:v10];

  v11 = [v2 backgroundColor];
  [v2 setContactHeaderBackgroundColor:v11];

  v12 = [MEMORY[0x1E4FB1618] colorWithRed:0.95 green:0.95 blue:0.97 alpha:0.5];
  [v2 setContactHeaderDropShadowColor:v12];

  uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.58 blue:0.0 alpha:1.0];
  [v2 setTransportBoldBackgroundColor:v13];

  v14 = [MEMORY[0x1E4FB1618] colorWithRed:0.176470588 green:0.176470588 blue:0.176470588 alpha:1.0];
  [v2 setTransportBackgroundColor:v14];

  v15 = [MEMORY[0x1E4FB1618] colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];
  [v2 setSectionBackgroundColor:v15];

  v16 = [MEMORY[0x1E4FB1618] colorWithRed:0.16 green:0.16 blue:0.16 alpha:1.0];
  [v2 setSeparatorColor:v16];

  v17 = [MEMORY[0x1E4FB1618] colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];
  [v2 setHeaderBackgroundColor:v17];

  uint64_t v18 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.12];
  [v2 setSelectedCellBackgroundColor:v18];

  [v2 setBarStyle:1];
  [v2 setUsesTranslucentBarStyle:0];
  [v2 setKeyboardAppearance:1];

  return v2;
}

+ (id)darkStyleWithOverrideUserInterfaceStyle:(int64_t)a3
{
  id v4 = [a1 defaultStyle];
  if (darkStyleWithOverrideUserInterfaceStyle__onceToken != -1) {
    dispatch_once(&darkStyleWithOverrideUserInterfaceStyle__onceToken, &__block_literal_global_25982);
  }
  BOOL v5 = darkStyleWithOverrideUserInterfaceStyle__blurSupported
    && !UIAccessibilityIsReduceMotionEnabled()
    && !UIAccessibilityIsReduceTransparencyEnabled();
  [v4 setBlurSupported:v5];
  if (a3 == 2) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v6 = [MEMORY[0x1E4FB1618] labelColor];
  }
  [v4 setTextColor:v6];
  [v4 setSectionHeaderTextColor:v6];
  [v4 setHighlightedTextColor:v6];
  v7 = [v4 textColor];
  [v4 setTaglineTextColor:v7];

  [v4 setNotesTextColor:v6];
  [v4 setSuggestedLabelTextColor:v6];
  [v4 setSuggestedValueTextColor:v6];
  v8 = [v4 textColor];
  [v4 setListTextColor:v8];

  [v4 setUsesOpaqueBackground:0];
  [v4 setBackgroundColor:0];
  v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setSearchBarBackgroundColor:v9];

  [v4 setContactHeaderBackgroundColor:0];
  objc_super v10 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.14];
  [v4 setTransportBackgroundColor:v10];

  v11 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.14];
  [v4 setTransportBorderColor:v11];

  v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.14];
  [v4 setTransportBoldBackgroundColor:v12];

  uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.95 green:0.95 blue:0.97 alpha:0.5];
  [v4 setContactHeaderDropShadowColor:v13];

  [v4 setTintColorOverride:v6];
  [v4 setSectionBackgroundColor:0];
  if ([v4 blurSupported]) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 0;
  }
  [v4 setSeparatorBackdropOverlayBlendMode:v14];
  [v4 setSeparatorStyle:1];
  if ([v4 blurSupported]) {
    +[CNUIColorRepository faceTimeLightSeparatorColor];
  }
  else {
  v15 = +[CNUIColorRepository faceTimeSeparatorColorWithBlurUnsupported];
  }
  [v4 setSeparatorColor:v15];

  if (darkStyleWithOverrideUserInterfaceStyle__blurSupported) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v16 = [MEMORY[0x1E4FB1618] colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
  }
  [v4 setHeaderBackgroundColor:v16];

  [v4 setSelectedCellBackgroundColor:0];
  v17 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setGroupedBackgroundColor:v17];

  [v4 setBarStyle:1];
  [v4 setUsesTranslucentBarStyle:1];
  [v4 setKeyboardAppearance:1];
  [v4 setShouldPresentInCurrentContext:1];
  [v4 setModalTransitionStyle:14];
  [v4 setTopActionsViewStyle:6];
  [v4 setInlineActionsViewStyle:3];

  return v4;
}

void __58__CNContactStyle_darkStyleWithOverrideUserInterfaceStyle___block_invoke()
{
  id v1 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:2030];
  [v1 blurRadius];
  darkStyleWithOverrideUserInterfaceStyle__blurSupported = v0 > 0.0;
}

+ (id)spotlightStyle
{
  v2 = objc_opt_class();

  return (id)[v2 darkStyleWithOverrideUserInterfaceStyle:0];
}

+ (id)faceTimeStyle
{
  v2 = objc_opt_class();

  return (id)[v2 darkStyleWithOverrideUserInterfaceStyle:2];
}

@end