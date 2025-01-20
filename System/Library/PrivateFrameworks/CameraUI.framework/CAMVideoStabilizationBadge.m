@interface CAMVideoStabilizationBadge
- (CAMVideoStabilizationBadge)initWithFrame:(CGRect)a3;
- (int64_t)videoStabilizationMode;
- (void)_updateTextAndColors;
- (void)setVideoStabilizationMode:(int64_t)a3;
@end

@implementation CAMVideoStabilizationBadge

- (CAMVideoStabilizationBadge)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMVideoStabilizationBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMVideoStabilizationBadge *)v3 _updateTextAndColors];
    v5 = v4;
  }

  return v4;
}

- (void)setVideoStabilizationMode:(int64_t)a3
{
  if (self->_videoStabilizationMode != a3)
  {
    self->_videoStabilizationMode = a3;
    [(CAMVideoStabilizationBadge *)self _updateTextAndColors];
  }
}

- (void)_updateTextAndColors
{
  int64_t v3 = [(CAMVideoStabilizationBadge *)self videoStabilizationMode];
  if (v3 == 1)
  {
    CAMLocalizedFrameworkString(@"VIDEO_STABILIZATION_BADGE_ULTRA", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [MEMORY[0x263F825C8] systemYellowColor];
    goto LABEL_5;
  }
  if (!v3)
  {
    CAMLocalizedFrameworkString(@"VIDEO_STABILIZATION_BADGE_OFF", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [MEMORY[0x263F825C8] whiteColor];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  id v6 = 0;
  v5 = 0;
LABEL_7:
  [(CEKBadgeTextView *)self _setText:v6];
  [(CEKBadgeView *)self _setFillColor:v5];
  [(CAMVideoStabilizationBadge *)self setNeedsLayout];
}

- (int64_t)videoStabilizationMode
{
  return self->_videoStabilizationMode;
}

@end