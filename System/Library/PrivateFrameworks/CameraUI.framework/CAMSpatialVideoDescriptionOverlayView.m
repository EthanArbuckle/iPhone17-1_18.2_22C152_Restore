@interface CAMSpatialVideoDescriptionOverlayView
- (BOOL)_didTapDetail;
- (BOOL)detailTextShouldHaveVibrancyEffect;
- (BOOL)isTitleMultiline;
- (double)_maxTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (double)maxTitleTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4;
- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3;
- (id)attributedDescriptionTextUsingNarrowWidth:(BOOL)a3;
- (id)detailTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTextUsingNarrowWidth:(BOOL)a3;
- (id)titleTextUsingNarrowWidth:(BOOL)a3;
- (int64_t)buttonStyle;
- (void)detailButtonTapped;
- (void)handleDescriptionLabelTapped:(id)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)set_didTapDetail:(BOOL)a3;
@end

@implementation CAMSpatialVideoDescriptionOverlayView

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(CAMSpatialVideoDescriptionOverlayView *)self _didTapDetail])
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMSpatialVideoDescriptionOverlayView;
    [(CAMDescriptionOverlayView *)&v7 setOrientation:a3 animated:v4];
  }
}

- (BOOL)isTitleMultiline
{
  return 1;
}

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SPATIAL_VIDEO_CAPTURE_OVERLAY_TITLE", &stru_26BD78BA0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SPATIAL_VIDEO_CAPTURE_OVERLAY_SET_UP_LATER", &stru_26BD78BA0);
}

- (id)attributedDescriptionTextUsingNarrowWidth:(BOOL)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263F089B8]);
  id v4 = objc_alloc(MEMORY[0x263F086A0]);
  v5 = CAMLocalizedFrameworkString(@"SPATIAL_VIDEO_CAPTURE_OVERLAY_DESCRIPTION", &stru_26BD78BA0);
  v6 = (void *)[v4 initWithString:v5];

  id v7 = objc_alloc(MEMORY[0x263F089B8]);
  v8 = CAMLocalizedFrameworkString(@"SPATIAL_VIDEO_CAPTURE_OVERLAY_DESCRIPTION_LINK", &stru_26BD78BA0);
  v9 = (void *)[v7 initWithString:v8];

  uint64_t v10 = *MEMORY[0x263F81500];
  v11 = CAMYellowColor();
  objc_msgSend(v9, "addAttribute:value:range:", v10, v11, 0, objc_msgSend(v9, "length"));

  id v12 = objc_alloc_init(MEMORY[0x263F81660]);
  v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
  [v12 setShadowColor:v13];

  objc_msgSend(v12, "setShadowOffset:", 0.0, 0.0);
  [v12 setShadowBlurRadius:3.0];
  objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x263F81560], v12, 0, objc_msgSend(v9, "length"));
  [v3 appendAttributedString:v6];
  v14 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
  [v3 appendAttributedString:v14];

  [v3 appendAttributedString:v9];
  return v3;
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (double)maxTitleTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4
{
  [(CAMSpatialVideoDescriptionOverlayView *)self _maxTextWidthForNarrowWidth:a3 isLandscape:a4 usingFontSizeMultiplier:1.0];
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

- (void)detailButtonTapped
{
  v3.receiver = self;
  v3.super_class = (Class)CAMSpatialVideoDescriptionOverlayView;
  [(CAMDescriptionOverlayView *)&v3 detailButtonTapped];
  [(CAMSpatialVideoDescriptionOverlayView *)self set_didTapDetail:1];
}

- (void)handleDescriptionLabelTapped:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMSpatialVideoDescriptionOverlayView;
  [(CAMDescriptionOverlayView *)&v4 handleDescriptionLabelTapped:a3];
  objc_super v3 = [NSURL URLWithString:@"https://support.apple.com/guide/iphone/record-spatial-videos-for-apple-vision-pro-iph6e3a6d4fe/ios"];
  CAMOpenURL(v3, MEMORY[0x263EFFA78]);
}

- (id)detailTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"SPATIAL_VIDEO_CAPTURE_OVERLAY_CONTINUE", &stru_26BD78BA0);
}

- (BOOL)detailTextShouldHaveVibrancyEffect
{
  return 0;
}

- (int64_t)buttonStyle
{
  return 1;
}

- (BOOL)_didTapDetail
{
  return self->__didTapDetail;
}

- (void)set_didTapDetail:(BOOL)a3
{
  self->__didTapDetail = a3;
}

@end