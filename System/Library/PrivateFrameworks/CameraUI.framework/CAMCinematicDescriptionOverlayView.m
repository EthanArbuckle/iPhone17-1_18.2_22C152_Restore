@interface CAMCinematicDescriptionOverlayView
- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (double)maxInfoTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3;
- (id)descriptionTextUsingNarrowWidth:(BOOL)a3;
- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)titleTextUsingNarrowWidth:(BOOL)a3;
@end

@implementation CAMCinematicDescriptionOverlayView

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"CINEMATIC_DESCRIPTION_OVERLAY_TITLE", &stru_26BD78BA0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"CINEMATIC_DESCRIPTION_OVERLAY_CONTINUE", &stru_26BD78BA0);
}

- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)descriptionTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"CINEMATIC_DESCRIPTION_OVERLAY_DESCRIPTION", &stru_26BD78BA0);
}

- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"CINEMATIC_DESCRIPTION_OVERLAY_INFO", &stru_26BD78BA0);
}

- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  [(CAMDescriptionOverlayView *)self additionalSpacing];
  if (v6)
  {
    if (v5) {
      goto LABEL_5;
    }
    double v9 = 320.0;
    return v7 + v9;
  }
  if (!v5)
  {
    double v9 = 360.0;
    return v7 + v9;
  }
LABEL_5:
  UICeilToViewScale();
  return result;
}

- (double)maxInfoTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  [(CAMDescriptionOverlayView *)self additionalSpacing];
  if (v6)
  {
    if (v5) {
      goto LABEL_5;
    }
    double v9 = 293.0;
    return v7 + v9;
  }
  if (!v5)
  {
    double v9 = 375.0;
    return v7 + v9;
  }
LABEL_5:
  UICeilToViewScale();
  return result;
}

@end