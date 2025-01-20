@interface UIColor(MailUI)
+ (id)_mui_mailUIBundleColorNamed:()MailUI;
+ (id)mailCellSelectionStateColorForInterfaceLevel:()MailUI;
+ (id)mailConversationViewCollapsedCellHighlightedBackgroundColor;
+ (id)mailDockViewShadowGradientColors;
+ (id)mailFocusBannerTitleColor;
+ (id)mailMailboxPickerBackgroundColorForTraitCollection:()MailUI;
+ (id)mf_colorFromColor:()MailUI toColor:progress:;
+ (id)mf_colorFromFlagColor:()MailUI;
+ (uint64_t)mailAccountCellTitleColor;
+ (uint64_t)mailAppBackgroundColor;
+ (uint64_t)mailArchiveActionColor;
+ (uint64_t)mailAttachmentsFilterColor;
+ (uint64_t)mailConversationViewBackgroundColor;
+ (uint64_t)mailConversationViewCollapsedCellBackgroundColor;
+ (uint64_t)mailConversationViewCollapsedCellLabelColor;
+ (uint64_t)mailConversationViewCollapsedCellSubjectLabelColor;
+ (uint64_t)mailConversationViewExpandedCellBackgroundColor;
+ (uint64_t)mailConversationViewFindOverlayColor;
+ (uint64_t)mailConversationViewFooterBackgroundColor;
+ (uint64_t)mailDarkGrayColor;
+ (uint64_t)mailDestructiveActionColor;
+ (uint64_t)mailDestructiveActionSwipeColor;
+ (uint64_t)mailDockViewDarkBackgroundColor;
+ (uint64_t)mailDockViewLightBackgroundColor;
+ (uint64_t)mailDockedPlaceholderViewBackgroundColor;
+ (uint64_t)mailExpandedConversationViewCellDateLabelColor;
+ (uint64_t)mailFlaggedColor;
+ (uint64_t)mailFlaggedColorGray;
+ (uint64_t)mailFlaggedColorGreen;
+ (uint64_t)mailFlaggedColorIncreasedContrastRed;
+ (uint64_t)mailFlaggedColorIndigo;
+ (uint64_t)mailFlaggedColorOrange;
+ (uint64_t)mailFlaggedColorRed;
+ (uint64_t)mailFlaggedColorTeal;
+ (uint64_t)mailFlaggedColorYellow;
+ (uint64_t)mailHeaderSeparatorLayerColor;
+ (uint64_t)mailMessageListBackgroundColor;
+ (uint64_t)mailMessageListHighImpactColor;
+ (uint64_t)mailMessageListHighlightColor;
+ (uint64_t)mailMessageListPrimarySelectionColor;
+ (uint64_t)mailMessageListSecondarySelectionColor;
+ (uint64_t)mailMessageListSelectedAnnotationColor;
+ (uint64_t)mailMessageListSelectedRecipientColor;
+ (uint64_t)mailMessageListSelectedStatusIndicatorColor;
+ (uint64_t)mailMessageListSelectedSummaryColor;
+ (uint64_t)mailMessageListSelectedSummarySymbolColor;
+ (uint64_t)mailMessageListSummarySymbolColor;
+ (uint64_t)mailMessageListTertiarySelectionColor;
+ (uint64_t)mailMoreButtonGrayColor;
+ (uint64_t)mailPreviousDraftPickerHeaderTextColor;
+ (uint64_t)mailReadLaterActionColor;
+ (uint64_t)mailRemoveFollowUpColor;
+ (uint64_t)mailRemoveReminderColor;
+ (uint64_t)mailRemoveTimeSensitiveColor;
+ (uint64_t)mailSearchImageBorderColor;
+ (uint64_t)mailSecondaryLabelDarkColor;
+ (uint64_t)mailSenderFilterColor;
+ (uint64_t)mailSplitViewBackgroundColor;
+ (uint64_t)mailSplitViewBorderColor;
+ (uint64_t)mailSystemLightGrayColor;
+ (uint64_t)mailTiltedTabCloseButtonTintColor;
+ (uint64_t)mailTodayFilterColor;
+ (uint64_t)mailTransferConversationViewBackgroundColor;
+ (uint64_t)mailTransferStackViewBackgroundColor;
+ (uint64_t)mailTransparentLightGrayColor;
+ (uint64_t)mailUpcomingReminderFilterColor;
+ (uint64_t)mailVIPFilterColor;
+ (uint64_t)mailVibrantDarkColor;
+ (uint64_t)mailVibrantLightColor;
+ (uint64_t)tableCellEligibleColor;
+ (uint64_t)tableCellIneligibleColor;
+ (uint64_t)tableCellSelectedColor;
+ (void)mailDockViewShadowGradientColorLocations;
- (BOOL)mf_isTranslucent;
@end

@implementation UIColor(MailUI)

+ (uint64_t)mailMessageListBackgroundColor
{
  return [MEMORY[0x1E4FB1618] tableBackgroundColor];
}

+ (uint64_t)mailDockViewDarkBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemBlackColor];
}

+ (uint64_t)mailTransferConversationViewBackgroundColor
{
  return [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
}

+ (uint64_t)mailSplitViewBorderColor
{
  return [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
}

+ (uint64_t)mailSplitViewBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)mailConversationViewBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (id)mailMailboxPickerBackgroundColorForTraitCollection:()MailUI
{
  if (objc_msgSend(a3, "mf_usePrimarySidebarStyling")) {
    [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  return v3;
}

+ (id)_mui_mailUIBundleColorNamed:()MailUI
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = objc_msgSend(v4, "mui_MailUIBundle");
  v7 = [v3 colorNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

+ (uint64_t)mailFlaggedColor
{
  return [MEMORY[0x1E4FB1618] systemOrangeColor];
}

+ (uint64_t)mailFlaggedColorRed
{
  return [MEMORY[0x1E4FB1618] systemRedColor];
}

+ (uint64_t)mailFlaggedColorIncreasedContrastRed
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailIncreasedContrastRed");
}

+ (uint64_t)mailFlaggedColorOrange
{
  return [MEMORY[0x1E4FB1618] systemOrangeColor];
}

+ (uint64_t)mailFlaggedColorYellow
{
  return [MEMORY[0x1E4FB1618] systemYellowColor];
}

+ (uint64_t)mailFlaggedColorGreen
{
  return [MEMORY[0x1E4FB1618] systemGreenColor];
}

+ (uint64_t)mailFlaggedColorTeal
{
  return [MEMORY[0x1E4FB1618] systemTealColor];
}

+ (uint64_t)mailFlaggedColorIndigo
{
  return [MEMORY[0x1E4FB1618] systemIndigoColor];
}

+ (uint64_t)mailFlaggedColorGray
{
  return [MEMORY[0x1E4FB1618] systemGrayColor];
}

+ (uint64_t)mailDestructiveActionColor
{
  return [MEMORY[0x1E4FB1618] systemRedColor];
}

+ (uint64_t)mailDestructiveActionSwipeColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailDestructiveActionSwipeColor");
}

+ (uint64_t)mailArchiveActionColor
{
  return [MEMORY[0x1E4FB1618] systemPurpleColor];
}

+ (uint64_t)mailReadLaterActionColor
{
  return [MEMORY[0x1E4FB1618] systemIndigoColor];
}

+ (uint64_t)mailTransparentLightGrayColor
{
  return [MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (uint64_t)mailDarkGrayColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailDarkGrayColor");
}

+ (uint64_t)mailMoreButtonGrayColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailMoreButtonGrayColor");
}

+ (uint64_t)mailRemoveReminderColor
{
  return [MEMORY[0x1E4FB1618] systemYellowColor];
}

+ (uint64_t)mailRemoveFollowUpColor
{
  return [MEMORY[0x1E4FB1618] systemYellowColor];
}

+ (uint64_t)mailRemoveTimeSensitiveColor
{
  return [MEMORY[0x1E4FB1618] systemYellowColor];
}

+ (uint64_t)mailAppBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
}

+ (uint64_t)mailSystemLightGrayColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailSystemLightGrayColor");
}

+ (uint64_t)mailSecondaryLabelDarkColor
{
  return [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_38];
}

+ (uint64_t)mailVibrantDarkColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailVibrantDarkColor");
}

+ (uint64_t)mailVibrantLightColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailVibrantLightColor");
}

+ (uint64_t)mailAccountCellTitleColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailAccountCellTitleColor");
}

+ (uint64_t)mailPreviousDraftPickerHeaderTextColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailPreviousDraftPickerHeaderTextColor");
}

+ (uint64_t)mailSearchImageBorderColor
{
  return [MEMORY[0x1E4FB1618] systemGray4Color];
}

+ (uint64_t)mailConversationViewExpandedCellBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailConversationViewCellBackgroundColor");
}

+ (uint64_t)mailConversationViewFooterBackgroundColor
{
  return [MEMORY[0x1E4FB1618] mailConversationViewExpandedCellBackgroundColor];
}

+ (uint64_t)mailConversationViewCollapsedCellBackgroundColor
{
  return [MEMORY[0x1E4FB1618] mailConversationViewExpandedCellBackgroundColor];
}

+ (id)mailConversationViewCollapsedCellHighlightedBackgroundColor
{
  v0 = [MEMORY[0x1E4FB1618] mailConversationViewExpandedCellBackgroundColor];
  v1 = [v0 colorWithAlphaComponent:0.75];

  return v1;
}

+ (uint64_t)mailConversationViewCollapsedCellLabelColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailConversationViewCollapsedCellLabelColor");
}

+ (uint64_t)mailConversationViewCollapsedCellSubjectLabelColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)mailConversationViewFindOverlayColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.101960786 green:0.101960786 blue:0.101960786 alpha:0.25];
}

+ (uint64_t)mailHeaderSeparatorLayerColor
{
  return [MEMORY[0x1E4FB1618] separatorColor];
}

+ (uint64_t)mailDockViewLightBackgroundColor
{
  return [MEMORY[0x1E4FB1618] mailSystemLightGrayColor];
}

+ (uint64_t)mailDockedPlaceholderViewBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (id)mailDockViewShadowGradientColors
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB1618] blackColor];
  v1 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 0.0, 0.5, v0);
  v5[1] = v1;
  v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
  v5[2] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];

  return v3;
}

+ (void)mailDockViewShadowGradientColorLocations
{
  return &unk_1F39E1E60;
}

+ (uint64_t)mailTiltedTabCloseButtonTintColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)mailExpandedConversationViewCellDateLabelColor
{
  return [MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (uint64_t)mailTransferStackViewBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
}

+ (uint64_t)mailMessageListPrimarySelectionColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailMessageListPrimarySelectionColor");
}

+ (uint64_t)mailMessageListSecondarySelectionColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailMessageListSecondarySelectionColor");
}

+ (uint64_t)mailMessageListTertiarySelectionColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailMessageListTertiarySelectionColor");
}

+ (uint64_t)mailMessageListSelectedSummaryColor
{
  return [MEMORY[0x1E4FB1618] mailSecondaryLabelDarkColor];
}

+ (uint64_t)mailMessageListSelectedAnnotationColor
{
  return [MEMORY[0x1E4FB1618] mailSecondaryLabelDarkColor];
}

+ (uint64_t)mailMessageListSelectedStatusIndicatorColor
{
  return [MEMORY[0x1E4FB1618] mailSecondaryLabelDarkColor];
}

+ (uint64_t)mailMessageListSelectedRecipientColor
{
  return [MEMORY[0x1E4FB1618] mailSecondaryLabelDarkColor];
}

+ (uint64_t)mailMessageListSummarySymbolColor
{
  return [MEMORY[0x1E4FB1618] tertiaryLabelColor];
}

+ (uint64_t)mailMessageListSelectedSummarySymbolColor
{
  return [MEMORY[0x1E4FB1618] mailSecondaryLabelDarkColor];
}

+ (id)mailFocusBannerTitleColor
{
  v0 = [MEMORY[0x1E4FB1618] systemIndigoColor];
  v1 = [v0 colorWithAlphaComponent:0.8];

  return v1;
}

+ (uint64_t)mailMessageListHighlightColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_mui_mailUIBundleColorNamed:", @"mailSnippetHighlightColor");
}

+ (id)mailCellSelectionStateColorForInterfaceLevel:()MailUI
{
  if (a3 == 1) {
    [MEMORY[0x1E4FB1618] systemGray4Color];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] systemGray5Color];
  }
  return v3;
}

+ (uint64_t)mailMessageListHighImpactColor
{
  return [MEMORY[0x1E4FB1618] systemGrayColor];
}

- (BOOL)mf_isTranslucent
{
  uint64_t v5 = -1;
  uint64_t v3 = -1;
  uint64_t v4 = -1;
  double v2 = NAN;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  return v2 != 1.0;
}

+ (uint64_t)mailTodayFilterColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (uint64_t)mailAttachmentsFilterColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (uint64_t)mailUpcomingReminderFilterColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (uint64_t)mailVIPFilterColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (uint64_t)mailSenderFilterColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (id)mf_colorFromColor:()MailUI toColor:progress:
{
  id v7 = a5;
  double v22 = NAN;
  double v20 = NAN;
  double v21 = NAN;
  uint64_t v18 = -1;
  double v19 = NAN;
  uint64_t v16 = -1;
  uint64_t v17 = -1;
  double v15 = NAN;
  id v8 = a4;
  if (CGColorGetNumberOfComponents((CGColorRef)[v8 CGColor]) == 2)
  {
    [v8 getWhite:&v22 alpha:&v19];

    double v20 = v22;
    double v21 = v22;
  }
  else
  {
    [v8 getRed:&v22 green:&v20 blue:&v21 alpha:&v19];
  }
  id v9 = v7;
  if (CGColorGetNumberOfComponents((CGColorRef)[v9 CGColor]) == 2)
  {
    [v9 getWhite:&v18 alpha:&v15];
    double v10 = *(double *)&v18;
    uint64_t v16 = v18;
    uint64_t v17 = v18;
    double v11 = *(double *)&v18;
    double v12 = *(double *)&v18;
  }
  else
  {
    [v9 getRed:&v18 green:&v16 blue:&v17 alpha:&v15];
    double v10 = *(double *)&v17;
    double v12 = *(double *)&v18;
    double v11 = *(double *)&v16;
  }
  v13 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", v22 + a1 * (v12 - v22), v20 + a1 * (v11 - v20), v21 + a1 * (v10 - v21), v19 + a1 * (v15 - v19), *(void *)&v15, v16, v17);

  return v13;
}

+ (id)mf_colorFromFlagColor:()MailUI
{
  switch(a3)
  {
    case 0:
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "mailFlaggedColorRed", v3);
      goto LABEL_12;
    case 1:
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "mailFlaggedColorOrange", v3);
      goto LABEL_12;
    case 2:
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "mailFlaggedColorYellow", v3);
      goto LABEL_12;
    case 3:
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "mailFlaggedColorGreen", v3);
      goto LABEL_12;
    case 4:
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "mailFlaggedColorTeal", v3);
      goto LABEL_12;
    case 5:
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "mailFlaggedColorIndigo", v3);
      goto LABEL_12;
    case 6:
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "mailFlaggedColorGray", v3);
LABEL_12:
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

+ (uint64_t)tableCellSelectedColor
{
  return [MEMORY[0x1E4FB1618] tableCellBlueTextColor];
}

+ (uint64_t)tableCellEligibleColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)tableCellIneligibleColor
{
  return [MEMORY[0x1E4FB1618] systemGrayColor];
}

@end