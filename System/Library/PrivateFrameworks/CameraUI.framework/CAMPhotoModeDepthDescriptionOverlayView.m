@interface CAMPhotoModeDepthDescriptionOverlayView
- (CAMDepthEffectSuggestionButton)_button;
- (CAMPhotoModeDepthDescriptionOverlayView)initWithFrame:(CGRect)a3;
- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3;
- (id)attributedDescriptionTextUsingNarrowWidth:(BOOL)a3;
- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)detailTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)titleTextUsingNarrowWidth:(BOOL)a3;
- (void)_handleDidTapButton:(id)a3;
- (void)layoutSubviews;
- (void)setCustomSubviewsVisible:(BOOL)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMPhotoModeDepthDescriptionOverlayView

- (CAMPhotoModeDepthDescriptionOverlayView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMPhotoModeDepthDescriptionOverlayView;
  v3 = -[CAMDescriptionOverlayView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CAMDepthEffectSuggestionButton);
    button = v3->__button;
    v3->__button = v4;

    [(CAMDepthEffectSuggestionButton *)v3->__button addTarget:v3 action:sel__handleDidTapButton_ forControlEvents:64];
    [(CAMPhotoModeDepthDescriptionOverlayView *)v3 addSubview:v3->__button];
  }
  return v3;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPhotoModeDepthDescriptionOverlayView;
  [(CAMDescriptionOverlayView *)&v6 layoutSubviews];
  v3 = [(CAMPhotoModeDepthDescriptionOverlayView *)self _button];
  [v3 intrinsicContentSize];
  CEKRectWithSize();
  CGRect v8 = CGRectInset(v7, -29.0, -16.0);
  double width = v8.size.width;
  double height = v8.size.height;
  [(CAMDescriptionOverlayView *)self viewportFrame];
  objc_msgSend(v3, "setFrame:", 0.0, CGRectGetMaxY(v9) - height, width, height);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CAMPhotoModeDepthDescriptionOverlayView;
  -[CAMDescriptionOverlayView setOrientation:animated:](&v8, sel_setOrientation_animated_);
  CGRect v7 = [(CAMPhotoModeDepthDescriptionOverlayView *)self _button];
  [v7 setOrientation:a3 animated:v4];
}

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"PHOTO_MODE_DEPTH_OVERLAY_TITLE", &stru_26BD78BA0);
}

- (id)detailTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(@"PHOTO_MODE_DEPTH_DESCRIPTION_OVERLAY_CONTINUE", &stru_26BD78BA0);
}

- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)attributedDescriptionTextUsingNarrowWidth:(BOOL)a3
{
  v3 = CAMLocalizedFrameworkString(@"PHOTO_MODE_DEPTH_OVERLAY_DESCRIPTION_%@_GLYPH", &stru_26BD78BA0);
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];
  uint64_t v5 = [v3 rangeOfString:@"%@"];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    CGRect v9 = [MEMORY[0x263F827E8] systemImageNamed:@"f.cursive.circle.fill"];
    v10 = [MEMORY[0x263F81678] textAttachmentWithImage:v9];
    v11 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v10];
    objc_msgSend(v4, "replaceCharactersInRange:withAttributedString:", v7, v8, v11);
  }
  return v4;
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

- (void)setCustomSubviewsVisible:(BOOL)a3
{
  double v3 = (double)a3;
  id v4 = [(CAMPhotoModeDepthDescriptionOverlayView *)self _button];
  [v4 setAlpha:v3];
}

- (void)_handleDidTapButton:(id)a3
{
  id v5 = a3;
  unint64_t v3 = [v5 mode];
  unint64_t v4 = v3;
  if (v3 <= 2) {
    unint64_t v4 = qword_209C7B708[v3];
  }
  [v5 setMode:v4];
}

- (CAMDepthEffectSuggestionButton)_button
{
  return self->__button;
}

- (void).cxx_destruct
{
}

@end