@interface UIColor(MessageUI)
+ (id)mailQuoteColorsForInterfaceStyle:()MessageUI;
+ (id)mf_colorNamed:()MessageUI;
+ (id)quoteColorsForSupportedInterfaceStyle;
+ (uint64_t)datePickerHeaderColor;
+ (uint64_t)mailAutoCompleteTableViewCellBackgroundColorForPopoverDisplay;
+ (uint64_t)mailComposeFormatButtonSelectedBackgroundColor;
+ (uint64_t)mailComposeHeaderBackgroundColor;
+ (uint64_t)mailComposeSuggestionsListTintColor;
+ (uint64_t)mailComposeTextViewBackgroundColor;
+ (uint64_t)mailGeneralBackgroundColor;
+ (uint64_t)mailInteractiveColor;
+ (uint64_t)mailMessageContentViewBackgroundColor;
+ (uint64_t)mailModernLabelledAddressAtomDefaultTextColor;
+ (uint64_t)mailModernLabelledAtomDefaultTextColor;
+ (uint64_t)mailPopoverBackgroundCellColor;
+ (uint64_t)mailQuickComposeBackgroundColor;
+ (uint64_t)mailQuoteColorLevelOne;
+ (uint64_t)mailQuoteColorLevelOneCorona;
+ (uint64_t)mailQuoteColorLevelThree;
+ (uint64_t)mailQuoteColorLevelThreeCorona;
+ (uint64_t)mailQuoteColorLevelTwo;
+ (uint64_t)mailQuoteColorLevelTwoCorona;
+ (uint64_t)mailSecureMIMERegularTextColor;
+ (uint64_t)mailSecureMIMEWarningColor;
+ (uint64_t)mailSenderAddressPickerColorHighlightedTextColor;
+ (uint64_t)mailSenderAddressPickerColorNormalTextColor;
+ (uint64_t)mailSenderAddressPickerUnsafeDomainColorTextColor;
+ (uint64_t)mailStyleSheetBackground;
+ (uint64_t)mailSubtitleGrayColor;
- (double)mf_contrastRatioTo:()MessageUI;
- (double)mf_luminance;
@end

@implementation UIColor(MessageUI)

+ (uint64_t)mailInteractiveColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (uint64_t)datePickerHeaderColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (id)mf_colorNamed:()MessageUI
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4FB1618];
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.messageui"];
  v6 = [v4 colorNamed:v3 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

+ (uint64_t)mailStyleSheetBackground
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)mailComposeFormatButtonSelectedBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "mf_colorNamed:", @"mailComposeFormatButtonSelectedBackgroundColor");
}

+ (uint64_t)mailComposeTextViewBackgroundColor
{
  return [MEMORY[0x1E4FB1618] clearColor];
}

+ (uint64_t)mailAutoCompleteTableViewCellBackgroundColorForPopoverDisplay
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "mf_colorNamed:", @"mailAutoCompleteTableViewCellBackgroundColorForPopoverDisplay");
}

+ (uint64_t)mailModernLabelledAtomDefaultTextColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)mailModernLabelledAddressAtomDefaultTextColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)mailSubtitleGrayColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "mf_colorNamed:", @"mailSubtitleGrayColor");
}

+ (uint64_t)mailSenderAddressPickerColorNormalTextColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)mailSenderAddressPickerColorHighlightedTextColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (uint64_t)mailSenderAddressPickerUnsafeDomainColorTextColor
{
  return [MEMORY[0x1E4FB1618] systemRedColor];
}

+ (uint64_t)mailComposeSuggestionsListTintColor
{
  return [MEMORY[0x1E4FB1618] blackColor];
}

+ (uint64_t)mailSecureMIMERegularTextColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)mailSecureMIMEWarningColor
{
  return [MEMORY[0x1E4FB1618] systemRedColor];
}

+ (uint64_t)mailGeneralBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)mailQuickComposeBackgroundColor
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "mf_colorNamed:", @"mailQuickComposeBackgroundColor");
}

+ (uint64_t)mailComposeHeaderBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)mailQuoteColorLevelOneCorona
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "mf_colorNamed:", @"QuoteColorPurpleCorona");
}

+ (uint64_t)mailQuoteColorLevelTwoCorona
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "mf_colorNamed:", @"QuoteColorTealCorona");
}

+ (uint64_t)mailQuoteColorLevelThreeCorona
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "mf_colorNamed:", @"QuoteColorGreenCorona");
}

+ (uint64_t)mailQuoteColorLevelOne
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "mf_colorNamed:", @"QuoteColorPurple");
}

+ (uint64_t)mailQuoteColorLevelTwo
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "mf_colorNamed:", @"QuoteColorTeal");
}

+ (uint64_t)mailQuoteColorLevelThree
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "mf_colorNamed:", @"QuoteColorGreen");
}

+ (id)quoteColorsForSupportedInterfaceStyle
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F0841488;
  v0 = [MEMORY[0x1E4FB1618] mailQuoteColorsForInterfaceStyle:1];
  v4[1] = &unk_1F08414A0;
  v5[0] = v0;
  v1 = [MEMORY[0x1E4FB1618] mailQuoteColorsForInterfaceStyle:2];
  v5[1] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

+ (id)mailQuoteColorsForInterfaceStyle:()MessageUI
{
  v10[3] = *MEMORY[0x1E4F143B8];
  if (a3 >= 2)
  {
    if (a3 != 2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    id v3 = [MEMORY[0x1E4FB1618] mailQuoteColorLevelOneCorona];
    v9[0] = v3;
    v4 = [MEMORY[0x1E4FB1618] mailQuoteColorLevelTwoCorona];
    v9[1] = v4;
    v5 = [MEMORY[0x1E4FB1618] mailQuoteColorLevelThreeCorona];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB1618] mailQuoteColorLevelOne];
    v10[0] = v3;
    v4 = [MEMORY[0x1E4FB1618] mailQuoteColorLevelTwo];
    v10[1] = v4;
    v5 = [MEMORY[0x1E4FB1618] mailQuoteColorLevelThree];
    v10[2] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  }
  v7 = (void *)v6;

LABEL_7:

  return v7;
}

+ (uint64_t)mailMessageContentViewBackgroundColor
{
  return [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
}

+ (uint64_t)mailPopoverBackgroundCellColor
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "mf_colorNamed:", @"mailPopoverBackgroundCellColor");
}

- (double)mf_luminance
{
  v1 = objc_msgSend(MEMORY[0x1E4F1E008], "colorWithCGColor:", objc_msgSend(a1, "CGColor"));
  [v1 red];
  if (v2 >= 0.03928) {
    double v3 = pow((v2 + 0.055) / 1.055, 2.4);
  }
  else {
    double v3 = v2 / 12.92;
  }
  [v1 green];
  if (v4 >= 0.03928) {
    double v5 = pow((v4 + 0.055) / 1.055, 2.4);
  }
  else {
    double v5 = v4 / 12.92;
  }
  [v1 blue];
  if (v6 >= 0.03928) {
    double v7 = pow((v6 + 0.055) / 1.055, 2.4);
  }
  else {
    double v7 = v6 / 12.92;
  }
  double v8 = v5 * 0.7152 + v3 * 0.2126 + v7 * 0.0722;

  return v8;
}

- (double)mf_contrastRatioTo:()MessageUI
{
  id v4 = a3;
  objc_msgSend(a1, "mf_luminance");
  double v6 = v5;
  objc_msgSend(v4, "mf_luminance");
  if (v6 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  if (v6 >= v7) {
    double v7 = v6;
  }
  double v9 = (v7 + 0.05) / (v8 + 0.05);

  return v9;
}

@end