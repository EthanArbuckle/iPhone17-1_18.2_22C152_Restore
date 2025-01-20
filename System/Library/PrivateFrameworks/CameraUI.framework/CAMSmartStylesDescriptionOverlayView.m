@interface CAMSmartStylesDescriptionOverlayView
- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3;
- (id)descriptionTextUsingNarrowWidth:(BOOL)a3;
- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)detailTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)titleTextUsingNarrowWidth:(BOOL)a3;
@end

@implementation CAMSmartStylesDescriptionOverlayView

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SMART_STYLES_DESCRIPTION_OVERLAY_TITLE", &stru_26BD78BA0);
}

- (id)detailTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SMART_STYLES_DESCRIPTION_OVERLAY_SET_UP", &stru_26BD78BA0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SMART_STYLES_DESCRIPTION_OVERLAY_CONTINUE", &stru_26BD78BA0);
}

- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)descriptionTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SMART_STYLES_DESCRIPTION_OVERLAY_DESCRIPTION", &stru_26BD78BA0);
}

- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  [(CAMDescriptionOverlayView *)self additionalSpacing];
  double v8 = 370.0;
  if (v6) {
    double v8 = 340.0;
  }
  if (v5) {
    double v7 = 0.0;
  }
  double result = v8 + v7;
  if (v5)
  {
    UICeilToViewScale();
  }
  return result;
}

@end