@interface AKAuthorizationSubPaneMetrics
+ (double)accessoryViewSize;
+ (double)bulletImagePixelAdjustmentOffset;
+ (double)bulletImageSize;
+ (double)bulletImageToInfoLabelSpacing;
+ (double)bulletInfoTitleToDescriptionVerticalSpacing;
+ (double)bulletLeadingSpacing;
+ (double)bulletTrailingSpacing;
+ (double)checkmarkToLabelSpacing;
+ (double)editInfoLabelToInputFieldSpacing;
+ (double)infoLabelMarginInset;
+ (double)infoLabelMessageFontSize;
+ (double)privacyLinkMarginInset;
+ (double)scopeImageViewCornerRadius;
+ (double)scopeImageViewLeadingSpacing;
+ (double)scopeImageViewSize;
+ (double)scopeImageViewTopSpacing;
+ (double)scopeRowCornerRadius;
+ (double)scopeTitleLabelLeadingSpacing;
+ (double)separatorInset;
+ (double)sharedAccountIconPadding;
+ (double)sharedAccountIconSize;
@end

@implementation AKAuthorizationSubPaneMetrics

+ (double)bulletImageSize
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 44.0;
  }
  else {
    double v3 = 36.0;
  }

  return v3;
}

+ (double)bulletImagePixelAdjustmentOffset
{
  return 4.0;
}

+ (double)bulletLeadingSpacing
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 64.0;
  }
  else {
    double v3 = 42.0;
  }

  return v3;
}

+ (double)bulletTrailingSpacing
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = -64.0;
  }
  else {
    double v3 = -36.0;
  }

  return v3;
}

+ (double)bulletImageToInfoLabelSpacing
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 16.0;
  }
  else {
    double v3 = 26.0;
  }

  return v3;
}

+ (double)bulletInfoTitleToDescriptionVerticalSpacing
{
  return 4.0;
}

+ (double)infoLabelMarginInset
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 50.0;
  }
  else {
    double v3 = 32.0;
  }

  return v3;
}

+ (double)infoLabelMessageFontSize
{
  return 15.0;
}

+ (double)scopeImageViewSize
{
  return 36.0;
}

+ (double)scopeImageViewTopSpacing
{
  return 12.0;
}

+ (double)scopeRowCornerRadius
{
  return 10.0;
}

+ (double)scopeImageViewCornerRadius
{
  return 6.0;
}

+ (double)scopeImageViewLeadingSpacing
{
  return 18.0;
}

+ (double)scopeTitleLabelLeadingSpacing
{
  return 16.0;
}

+ (double)separatorInset
{
  return 70.0;
}

+ (double)checkmarkToLabelSpacing
{
  return 8.0;
}

+ (double)accessoryViewSize
{
  return 20.0;
}

+ (double)editInfoLabelToInputFieldSpacing
{
  return 14.0;
}

+ (double)privacyLinkMarginInset
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 76.0;
  }
  else {
    double v3 = 42.0;
  }

  return v3;
}

+ (double)sharedAccountIconSize
{
  return 22.0;
}

+ (double)sharedAccountIconPadding
{
  return 4.0;
}

@end