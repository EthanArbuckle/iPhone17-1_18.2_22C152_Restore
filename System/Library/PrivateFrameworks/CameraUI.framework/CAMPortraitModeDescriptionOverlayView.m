@interface CAMPortraitModeDescriptionOverlayView
- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (double)maxInfoTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3;
- (id)descriptionTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTextUsingNarrowWidth:(BOOL)a3;
- (id)titleTextUsingNarrowWidth:(BOOL)a3;
@end

@implementation CAMPortraitModeDescriptionOverlayView

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"PORTRAIT_MODE_DESCRIPTION_OVERLAY_TITLE", &stru_26BD78BA0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"PORTRAIT_MODE_DESCRIPTION_OVERLAY_CONTINUE", &stru_26BD78BA0);
}

- (id)descriptionTextUsingNarrowWidth:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[CAMCaptureCapabilities capabilities];
  int v5 = [v4 arePortraitEffectsSupported];

  v6 = @"PORTRAIT_MODE_LIGHTING_DESCRIPTION_OVERLAY_DESCRIPTION";
  if (v3) {
    v6 = @"PORTRAIT_MODE_LIGHTING_DESCRIPTION_OVERLAY_DESCRIPTION_NO_NEWLINE";
  }
  if (v5) {
    v7 = v6;
  }
  else {
    v7 = @"PORTRAIT_MODE_DESCRIPTION_OVERLAY_DESCRIPTION";
  }
  return CAMLocalizedFrameworkString(v7, &stru_26BD78BA0);
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  BOOL v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 arePortraitEffectsSupported];

  if (v4) {
    int v5 = @"PORTRAIT_MODE_LIGHTING_DESCRIPTION_OVERLAY_INFO";
  }
  else {
    int v5 = @"PORTRAIT_MODE_DESCRIPTION_OVERLAY_INFO";
  }
  return CAMLocalizedFrameworkString(v5, &stru_26BD78BA0);
}

- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  BOOL v5 = a4;
  v8 = +[CAMCaptureCapabilities capabilities];
  int v9 = [v8 arePortraitEffectsSupported];

  [(CAMDescriptionOverlayView *)self additionalSpacing];
  if (v9 && a3)
  {
    if (v5)
    {
      UICeilToViewScale();
    }
    else
    {
      return v10 + 312.0;
    }
  }
  else
  {
    if (v9)
    {
      double result = v10 * 3.0 + 343.0;
      BOOL v12 = !v5;
    }
    else
    {
      BOOL v12 = !v5;
      double result = 375.0;
    }
    if (!v12) {
      return 440.0;
    }
  }
  return result;
}

- (double)maxInfoTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  BOOL v5 = a4;
  v8 = +[CAMCaptureCapabilities capabilities];
  int v9 = [v8 arePortraitEffectsSupported];

  [(CAMDescriptionOverlayView *)self additionalSpacing];
  if (v9 && a3)
  {
    if (v5)
    {
      UICeilToViewScale();
      return result;
    }
    double v12 = 293.0;
    return v10 + v12;
  }
  if (v9)
  {
    if (!v5) {
      return v10 * 3.0 + 294.0;
    }
    double v12 = 470.0;
    return v10 + v12;
  }
  double result = v10 + 470.0;
  if (!v5) {
    return 376.0;
  }
  return result;
}

@end