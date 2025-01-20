@interface CAMSpatialModeDescriptionOverlayView
- (BOOL)_didTapAcknowledgement;
- (double)_maxTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (double)maxTitleTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4;
- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3;
- (id)descriptionTextUsingNarrowWidth:(BOOL)a3;
- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)titleTextUsingNarrowWidth:(BOOL)a3;
- (void)acknowledgementButtonTapped;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)set_didTapAcknowledgement:(BOOL)a3;
@end

@implementation CAMSpatialModeDescriptionOverlayView

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(CAMSpatialModeDescriptionOverlayView *)self _didTapAcknowledgement])
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMSpatialModeDescriptionOverlayView;
    [(CAMDescriptionOverlayView *)&v7 setOrientation:a3 animated:v4];
  }
}

- (void)acknowledgementButtonTapped
{
}

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SPATIAL_MODE_DESCRIPTION_OVERLAY_TITLE", &stru_26BD78BA0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SPATIAL_MODE_DESCRIPTION_OVERLAY_CONTINUE", &stru_26BD78BA0);
}

- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)descriptionTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SPATIAL_MODE_OVERLAY_INFO", &stru_26BD78BA0);
}

- (double)maxTitleTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4
{
  [(CAMSpatialModeDescriptionOverlayView *)self _maxTextWidthForNarrowWidth:a3 isLandscape:a4 usingFontSizeMultiplier:1.0];
  return result;
}

- (double)_maxTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  if (a3) {
    double v5 = 340.0;
  }
  else {
    double v5 = 370.0;
  }
  if (a4)
  {
    UICeilToViewScale();
  }
  else
  {
    [(CAMDescriptionOverlayView *)self additionalSpacing];
    return v5 + v7;
  }
  return result;
}

- (BOOL)_didTapAcknowledgement
{
  return self->__didTapAcknowledgement;
}

- (void)set_didTapAcknowledgement:(BOOL)a3
{
  self->__didTapAcknowledgement = a3;
}

@end