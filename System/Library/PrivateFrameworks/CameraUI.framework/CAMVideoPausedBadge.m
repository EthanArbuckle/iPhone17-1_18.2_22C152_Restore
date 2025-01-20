@interface CAMVideoPausedBadge
- (CAMVideoPausedBadge)initWithFrame:(CGRect)a3;
@end

@implementation CAMVideoPausedBadge

- (CAMVideoPausedBadge)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMVideoPausedBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] systemRedColor];
    [(CEKBadgeView *)v3 _setFillColor:v4];

    v5 = [MEMORY[0x263F825C8] whiteColor];
    [(CEKBadgeView *)v3 _setContentColor:v5];

    v6 = CAMLocalizedFrameworkString(@"CAM_VIDEO_PAUSED_BADGE", 0);
    [(CEKBadgeTextView *)v3 _setText:v6];

    v7 = v3;
  }

  return v3;
}

@end