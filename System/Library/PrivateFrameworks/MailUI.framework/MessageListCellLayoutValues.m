@interface MessageListCellLayoutValues
- (BOOL)inMultiSelectionMode;
- (BOOL)isSubjectVisible;
- (BOOL)supportsPopover;
- (BOOL)useSelectedColorForConfigurationState:(id)a3 backgroundConfiguration:(id)a4;
- (BOOL)useSidebarAppearance;
- (NSDirectionalEdgeInsets)padding;
- (NSDirectionalEdgeInsets)systemLayoutMargins;
- (UIBackgroundConfiguration)defaultBackgroundConfiguration;
- (UIColor)tintColor;
- (UIFont)addressFont;
- (UIFont)dateFont;
- (UIFont)subjectFont;
- (UIFont)summaryFont;
- (UIFont)summarySymbolFont;
- (UITraitCollection)traitCollection;
- (double)addressAndSubjectHeight;
- (double)addressCapHeight;
- (double)avatarSize;
- (double)backgroundCornerRadius;
- (double)bodyLeading;
- (double)bottomLeadingSeparatorInsetShowingAvatar:(BOOL)a3;
- (double)bottomMargin;
- (double)bottomPadding;
- (double)compactRowHeight;
- (double)defaultRowHeight;
- (double)heightWithNumberOfSummaryLines:(int64_t)a3;
- (double)horizontalSpacing;
- (double)indicatorMaxWidth;
- (double)indicatorToTrailingMargin;
- (double)leadingPadding;
- (double)leadingToIndicatorMargin;
- (double)standardAvatarSize;
- (double)topMargin;
- (double)topPadding;
- (double)trailingPadding;
- (id)_init;
- (id)absentDataColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5;
- (id)addressColorForContentConfiguration:(id)a3;
- (id)annotationColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5;
- (id)backgroundColorForConfigurationState:(id)a3 backgroundConfiguration:(id)a4;
- (id)backgroundColorForSelectedState:(unint64_t)a3 disclosureEnabled:(BOOL)a4;
- (id)dateColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5;
- (id)recipientColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5;
- (id)subjectColorForContentConfiguration:(id)a3;
- (id)summaryColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5;
- (id)summarySymbolColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5;
- (id)threadDisclosureColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5;
- (int64_t)actualLineCountForSummary:(id)a3 bounds:(CGRect)a4;
- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3;
- (int64_t)subjectNumberOfLines;
- (void)_invalidateAndNotify:(BOOL)a3;
- (void)setDefaultBackgroundConfiguration:(id)a3;
- (void)setInMultiSelectionMode:(BOOL)a3;
- (void)setSupportsPopover:(BOOL)a3;
- (void)setSystemLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setTintColor:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation MessageListCellLayoutValues

- (double)horizontalSpacing
{
  return 8.0;
}

- (UIBackgroundConfiguration)defaultBackgroundConfiguration
{
  v2 = (void *)[(UIBackgroundConfiguration *)self->_defaultBackgroundConfiguration copy];
  return (UIBackgroundConfiguration *)v2;
}

- (double)backgroundCornerRadius
{
  double result = 10.0;
  if (!self->_useSidebarAppearance) {
    return 0.0;
  }
  return result;
}

- (id)backgroundColorForConfigurationState:(id)a3 backgroundConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 isSelected];
  unsigned int v9 = v8;
  if (!self->_useSidebarAppearance)
  {
    uint64_t v17 = -[MessageListCellLayoutValues backgroundColorForSelectedState:disclosureEnabled:](self, "backgroundColorForSelectedState:disclosureEnabled:", v8, [v6 isParent]);
LABEL_12:
    v16 = (void *)v17;
    goto LABEL_13;
  }
  int v10 = [v6 isFocusSystemActive];
  int v11 = [v6 isFocused];
  int v12 = [v6 isEditing];
  if (((v9 ^ 1) & 1) == 0 && (v11 & 1) == 0 && v12)
  {
    v13 = (void *)[v6 copy];
    [v13 setEditing:0];
    v14 = [v7 updatedConfigurationForState:v13];

    v15 = [(MessageListCellLayoutValues *)self tintColor];
    v16 = [v14 resolvedBackgroundColorForTintColor:v15];

    id v7 = v14;
    goto LABEL_13;
  }
  if (((v10 | v9 ^ 1) & 1) == 0)
  {
    uint64_t v17 = [(MessageListCellLayoutValues *)self tintColor];
    goto LABEL_12;
  }
  if (((v9 | v11) & 1) == 0)
  {
    if ([v6 isParent])
    {
      uint64_t v17 = [MEMORY[0x1E4FB1618] mailMessageListSecondarySelectionColor];
      goto LABEL_12;
    }
    if ([v6 isChild])
    {
      uint64_t v17 = [MEMORY[0x1E4FB1618] mailMessageListTertiarySelectionColor];
      goto LABEL_12;
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)supportsPopover
{
  return self->_supportsPopover;
}

- (BOOL)useSidebarAppearance
{
  return self->_useSidebarAppearance;
}

- (double)addressAndSubjectHeight
{
  [(MessageListCellLayoutValues *)self addressCapHeight];
  double v4 = v3;
  if ([(MessageListCellLayoutValues *)self isSubjectVisible])
  {
    double v5 = (double)[(MessageListCellLayoutValues *)self subjectNumberOfLines];
    [(MessageListCellLayoutValues *)self bodyLeading];
    double v4 = v4 + v5 * v6;
  }
  id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  double v9 = v4 + 1.0 / v8;

  return v9;
}

- (int64_t)subjectNumberOfLines
{
  return 1;
}

- (double)addressCapHeight
{
  double result = self->_addressCapHeight;
  if (result == 2.22507386e-308)
  {
    double v4 = [(MessageListCellLayoutValues *)self addressFont];
    [v4 capHeight];
    UICeilToViewScale();
    self->_addressCapHeight = v5;

    return self->_addressCapHeight;
  }
  return result;
}

- (double)standardAvatarSize
{
  double v3 = [(MessageListCellLayoutValues *)self addressFont];
  [v3 lineHeight];
  double v5 = v4;
  double v6 = [(MessageListCellLayoutValues *)self subjectFont];
  [v6 lineHeight];
  double v8 = v5 + v7;

  return v8;
}

- (double)bodyLeading
{
  double result = self->_bodyLeading;
  if (result == 2.22507386e-308)
  {
    double v4 = [(MessageListCellLayoutValues *)self summaryFont];
    [v4 _bodyLeading];
    UIRoundToViewScale();
    self->_bodyLeading = v5;

    return self->_bodyLeading;
  }
  return result;
}

- (id)threadDisclosureColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8 = a4;
  if ([(MessageListCellLayoutValues *)self useSelectedColorForConfigurationState:a3 backgroundConfiguration:a5])
  {
    double v9 = [v8 textProperties];
    int v10 = [v9 resolvedColor];
  }
  else
  {
    int v10 = [MEMORY[0x1E4FB1618] mailInteractiveColor];
  }

  return v10;
}

- (double)heightWithNumberOfSummaryLines:(int64_t)a3
{
  [(MessageListCellLayoutValues *)self topPadding];
  [(MessageListCellLayoutValues *)self addressAndSubjectHeight];
  double v5 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
  {
    double v7 = [(MessageListCellLayoutValues *)self dateFont];
    [v7 _bodyLeading];
    [v7 descender];
  }
  if (a3)
  {
    id v8 = [(MessageListCellLayoutValues *)self summaryFont];
    [(MessageListCellLayoutValues *)self bodyLeading];
    if (a3 >= 2) {
      [v8 _bodyLeading];
    }
  }
  [(MessageListCellLayoutValues *)self bottomPadding];
  UIRoundToViewScale();
  if (v9 < 44.0)
  {
    double v10 = vabdd_f64(44.0, v9) * 0.5;
    self->_topMargin = floor(v10);
    self->_bottomMargin = ceil(v10);
    double v9 = 44.0;
  }
  return ceil(v9);
}

- (NSDirectionalEdgeInsets)padding
{
  [(MessageListCellLayoutValues *)self topPadding];
  double v4 = v3;
  [(MessageListCellLayoutValues *)self leadingPadding];
  double v6 = v5;
  [(MessageListCellLayoutValues *)self bottomPadding];
  double v8 = v7;
  [(MessageListCellLayoutValues *)self trailingPadding];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.trailing = v10;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (double)leadingPadding
{
  double result = self->_leadingPadding;
  if (result == 2.22507386e-308)
  {
    [(MessageListCellLayoutValues *)self leadingToIndicatorMargin];
    double v5 = v4;
    [(MessageListCellLayoutValues *)self indicatorMaxWidth];
    double result = v6 + v5 * 2.0;
    self->_leadingPadding = result;
  }
  return result;
}

- (double)bottomPadding
{
  if (self->_bottomPadding == 2.22507386e-308)
  {
    double v3 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    UIContentSizeCategoryIsAccessibilityCategory(v3);

    double v4 = [(MessageListCellLayoutValues *)self summaryFont];
    [v4 _bodyLeading];
    [(MessageListCellLayoutValues *)self bottomMargin];
    UIRoundToViewScale();
    self->_bottomPadding = v5;
  }
  return self->_bottomPadding;
}

- (UIFont)summaryFont
{
  summaryFont = self->_summaryFont;
  if (!summaryFont)
  {
    double v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    double v5 = self->_summaryFont;
    self->_summaryFont = v4;

    summaryFont = self->_summaryFont;
  }
  return summaryFont;
}

- (double)trailingPadding
{
  double result = self->_trailingPadding;
  if (result == 2.22507386e-308)
  {
    [(MessageListCellLayoutValues *)self indicatorToTrailingMargin];
    self->_trailingPadding = result;
  }
  return result;
}

- (id)dateColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = (void *)*MEMORY[0x1E4FB2608];
  id v11 = a4;
  double v12 = [v10 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
  {
    v14 = [v11 textProperties];

    v15 = [v14 resolvedColor];
    id v11 = v14;
  }
  else
  {
    v15 = [(MessageListCellLayoutValues *)self summaryColorForConfigurationState:v8 contentConfiguration:v11 backgroundConfiguration:v9];
  }

  return v15;
}

- (id)addressColorForContentConfiguration:(id)a3
{
  double v3 = [a3 textProperties];
  double v4 = [v3 resolvedColor];

  return v4;
}

- (id)subjectColorForContentConfiguration:(id)a3
{
  double v3 = [a3 textProperties];
  double v4 = [v3 resolvedColor];

  return v4;
}

- (id)annotationColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8 = a4;
  if ([(MessageListCellLayoutValues *)self useSelectedColorForConfigurationState:a3 backgroundConfiguration:a5])
  {
    id v9 = [MEMORY[0x1E4FB1618] mailMessageListSelectedAnnotationColor];
  }
  else
  {
    double v10 = [v8 secondaryTextProperties];
    id v9 = [v10 resolvedColor];
  }
  return v9;
}

- (id)summaryColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8 = a4;
  if ([(MessageListCellLayoutValues *)self useSelectedColorForConfigurationState:a3 backgroundConfiguration:a5])
  {
    id v9 = [MEMORY[0x1E4FB1618] mailMessageListSelectedSummaryColor];
  }
  else
  {
    double v10 = [v8 secondaryTextProperties];
    id v9 = [v10 resolvedColor];
  }
  return v9;
}

- (BOOL)useSelectedColorForConfigurationState:(id)a3 backgroundConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_useSidebarAppearance)
  {
    int v8 = [v6 isSelected];
    int v9 = [v6 isFocusSystemActive];
    if (v8 && !v9
      || ([v6 isFocused] & 1) != 0
      || (char v10 = [v6 isEditing], (v8 & objc_msgSend(v6, "isFocusingOnMessageListCell")) == 1)
      && ((v10 & 1) != 0 || [(MessageListCellLayoutValues *)self inMultiSelectionMode]))
    {
      char v11 = 1;
    }
    else
    {
      double v12 = [v7 backgroundColor];
      double v13 = [(MessageListCellLayoutValues *)self tintColor];
      char v11 = [v12 isEqual:v13];
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (double)leadingToIndicatorMargin
{
  double result = self->_leadingToIndicatorMargin;
  if (result == 2.22507386e-308)
  {
    double v4 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    double result = 4.0;
    if (!IsAccessibilityCategory)
    {
      double result = 8.0;
      if (!self->_useSidebarAppearance)
      {
        [(MessageListCellLayoutValues *)self indicatorMaxWidth];
        double v7 = v6;
        double leading = self->_systemLayoutMargins.leading;
        [(UITraitCollection *)self->_traitCollection mf_leadingEdgeToBackButtonText];
        double result = (leading + v9 - v7) * 0.5;
      }
    }
    self->_leadingToIndicatorMargin = result;
  }
  return result;
}

- (double)indicatorMaxWidth
{
  double result = self->_indicatorMaxWidth;
  if (result == 2.22507386e-308)
  {
    double v4 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    double result = 16.0;
    if (IsAccessibilityCategory) {
      double result = 30.0;
    }
    self->_indicatorMaxWidth = result;
  }
  return result;
}

- (double)indicatorToTrailingMargin
{
  double result = self->_indicatorToTrailingMargin;
  if (result == 2.22507386e-308)
  {
    if (self->_useSidebarAppearance)
    {
      double v4 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

      double result = 8.0;
      if (IsAccessibilityCategory) {
        double result = 4.0;
      }
    }
    else
    {
      double result = self->_systemLayoutMargins.trailing;
    }
    self->_indicatorToTrailingMargin = result;
  }
  return result;
}

- (double)bottomMargin
{
  double result = self->_bottomMargin;
  if (result == 2.22507386e-308)
  {
    int v4 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mui_isLargeFormatPad");
    double result = 0.0;
    if (v4) {
      double result = 4.0;
    }
    self->_bottomMargin = result;
  }
  return result;
}

- (UIFont)dateFont
{
  dateFont = self->_dateFont;
  if (!dateFont)
  {
    int v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    double v5 = self->_dateFont;
    self->_dateFont = v4;

    dateFont = self->_dateFont;
  }
  return dateFont;
}

- (void)setTintColor:(id)a3
{
}

- (void)setSystemLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  CGFloat leading = a3.leading;
  CGFloat top = a3.top;
  double v8 = self->_systemLayoutMargins.leading - a3.leading;
  if (v8 < 0.0) {
    double v8 = -v8;
  }
  if (v8 >= 2.22044605e-16) {
    goto LABEL_7;
  }
  double v9 = self->_systemLayoutMargins.trailing - a3.trailing;
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 >= 2.22044605e-16)
  {
LABEL_7:
    [(MessageListCellLayoutValues *)self _invalidateAndNotify:1];
    self->_systemLayoutMargins.CGFloat top = top;
    self->_systemLayoutMargins.CGFloat leading = leading;
    self->_systemLayoutMargins.CGFloat bottom = bottom;
    self->_systemLayoutMargins.CGFloat trailing = trailing;
  }
}

- (void)setTraitCollection:(id)a3
{
  id v6 = a3;
  traitCollection = self->_traitCollection;
  if (!traitCollection
    || [(UITraitCollection *)traitCollection mf_traitDifferenceAffectsTextLayout:v6])
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    self->_useSidebarAppearance = objc_msgSend(v6, "mf_useSplitViewStyling");
    [(MessageListCellLayoutValues *)self _invalidateAndNotify:0];
  }
}

- (void)setDefaultBackgroundConfiguration:(id)a3
{
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)MessageListCellLayoutValues;
  v2 = [(MessageListCellLayoutValues *)&v5 init];
  double v3 = v2;
  if (v2) {
    [(MessageListCellLayoutValues *)v2 _invalidateAndNotify:0];
  }
  return v3;
}

- (void)_invalidateAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_main_np() != 1)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MessageListCellLayoutValues.m" lineNumber:262 description:@"Current thread must be main"];
  }
  addressFont = self->_addressFont;
  self->_addressFont = 0;

  dateFont = self->_dateFont;
  self->_dateFont = 0;

  subjectFont = self->_subjectFont;
  self->_subjectFont = 0;

  summaryFont = self->_summaryFont;
  self->_summaryFont = 0;

  int64x2_t v10 = vdupq_n_s64(0x10000000000000uLL);
  *(int64x2_t *)&self->_defaultRowHeight = v10;
  *(int64x2_t *)&self->_topMargin = v10;
  *(int64x2_t *)&self->_leadingPadding = v10;
  *(int64x2_t *)&self->_bottomMargin = v10;
  self->_addressCapHeight = 2.22507386e-308;
  *(int64x2_t *)&self->_bottomPadding = v10;
  *(int64x2_t *)&self->_indicatorToTrailingMargin = v10;
  if (v3)
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"kMessageListCellLayoutValuesDidChangeNotification" object:self];
  }
}

- (double)topMargin
{
  double result = self->_topMargin;
  if (result == 2.22507386e-308)
  {
    int v4 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mui_isLargeFormatPad");
    double result = 0.0;
    if (v4) {
      double result = 4.0;
    }
    self->_topMargin = result;
  }
  return result;
}

- (double)avatarSize
{
  return 0.0;
}

- (double)bottomLeadingSeparatorInsetShowingAvatar:(BOOL)a3
{
  BOOL v3 = a3;
  [(MessageListCellLayoutValues *)self leadingPadding];
  double v6 = v5;
  if (v3)
  {
    [(MessageListCellLayoutValues *)self avatarSize];
    double v8 = v7;
    [(MessageListCellLayoutValues *)self horizontalSpacing];
    return v6 + v8 + v9;
  }
  return v6;
}

- (UIFont)summarySymbolFont
{
  summarySymbolFont = self->_summarySymbolFont;
  if (!summarySymbolFont)
  {
    int v4 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] weight:*MEMORY[0x1E4FB09E0]];
    double v5 = self->_summarySymbolFont;
    self->_summarySymbolFont = v4;

    summarySymbolFont = self->_summarySymbolFont;
  }
  return summarySymbolFont;
}

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
}

- (id)backgroundColorForSelectedState:(unint64_t)a3 disclosureEnabled:(BOOL)a4
{
}

- (id)absentDataColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8 = a4;
  if ([(MessageListCellLayoutValues *)self useSelectedColorForConfigurationState:a3 backgroundConfiguration:a5])
  {
    double v9 = [MEMORY[0x1E4FB1618] mailMessageListSelectedSummaryColor];
  }
  else
  {
    int64x2_t v10 = [v8 secondaryTextProperties];
    double v9 = [v10 resolvedColor];
  }
  return v9;
}

- (id)summarySymbolColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  if ([(MessageListCellLayoutValues *)self useSelectedColorForConfigurationState:a3 backgroundConfiguration:a5])
  {
    [MEMORY[0x1E4FB1618] mailMessageListSelectedSummarySymbolColor];
  }
  else
  {
    [MEMORY[0x1E4FB1618] mailMessageListSummarySymbolColor];
  double v5 = };
  return v5;
}

- (id)recipientColorForConfigurationState:(id)a3 contentConfiguration:(id)a4 backgroundConfiguration:(id)a5
{
  id v8 = a4;
  if ([(MessageListCellLayoutValues *)self useSelectedColorForConfigurationState:a3 backgroundConfiguration:a5])
  {
    double v9 = [MEMORY[0x1E4FB1618] mailMessageListSelectedRecipientColor];
  }
  else
  {
    int64x2_t v10 = [v8 secondaryTextProperties];
    double v9 = [v10 resolvedColor];
  }
  return v9;
}

- (int64_t)actualLineCountForSummary:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  [(MessageListCellLayoutValues *)self bodyLeading];
  double v11 = v10;
  int64_t v12 = [(MessageListCellLayoutValues *)self linesOfSummaryForCompactHeight:0];
  double v13 = objc_alloc_init(MessageListCellLabel);
  v14 = [(MessageListCellLayoutValues *)self summaryFont];
  [(MessageListCellLabel *)v13 setFont:v14];

  [(MessageListCellLabel *)v13 setText:v9];
  v15 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  LODWORD(v9) = UIContentSizeCategoryIsAccessibilityCategory(v15);

  if (v9)
  {
    LODWORD(v16) = 1.0;
    [(MessageListCellLabel *)v13 _setHyphenationFactor:v16];
  }
  -[MessageListCellLabel setFrame:](v13, "setFrame:", x + v11, y + 0.0, width - (v11 + 0.0), height);
  [(MessageListCellLabel *)v13 frame];
  double v18 = v17;
  v19 = [(MessageListCellLabel *)v13 text];
  uint64_t v31 = *MEMORY[0x1E4FB06F8];
  v20 = [(MessageListCellLabel *)v13 font];
  v32[0] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 1, v21, 0, v18, 3.40282347e38);
  double v23 = v22;

  v24 = [(MessageListCellLabel *)v13 font];
  [v24 _bodyLeading];
  double v26 = v25;
  v27 = [(MessageListCellLabel *)v13 font];
  [v27 descender];
  int64_t v29 = vcvtpd_s64_f64(v23 / (v26 - v28));

  if (v12 >= v29) {
    int64_t v12 = v29;
  }

  return v12;
}

- (UIFont)addressFont
{
  return self->_addressFont;
}

- (UIFont)subjectFont
{
  return self->_subjectFont;
}

- (double)compactRowHeight
{
  return self->_compactRowHeight;
}

- (double)defaultRowHeight
{
  return self->_defaultRowHeight;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (BOOL)isSubjectVisible
{
  return self->_subjectVisible;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setSupportsPopover:(BOOL)a3
{
  self->_supportsPopover = a3;
}

- (BOOL)inMultiSelectionMode
{
  return self->_inMultiSelectionMode;
}

- (void)setInMultiSelectionMode:(BOOL)a3
{
  self->_inMultiSelectionMode = a3;
}

- (NSDirectionalEdgeInsets)systemLayoutMargins
{
  double top = self->_systemLayoutMargins.top;
  double leading = self->_systemLayoutMargins.leading;
  double bottom = self->_systemLayoutMargins.bottom;
  double trailing = self->_systemLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_dateFont, 0);
  objc_storeStrong((id *)&self->_summarySymbolFont, 0);
  objc_storeStrong((id *)&self->_summaryFont, 0);
  objc_storeStrong((id *)&self->_subjectFont, 0);
  objc_storeStrong((id *)&self->_addressFont, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundConfiguration, 0);
}

@end