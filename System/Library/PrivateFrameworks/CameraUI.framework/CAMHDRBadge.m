@interface CAMHDRBadge
- (CAMHDRBadge)initWithFrame:(CGRect)a3;
@end

@implementation CAMHDRBadge

- (CAMHDRBadge)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMHDRBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = CAMLocalizedFrameworkString(@"HDR_BADGE", &stru_26BD78BA0);
    [(CEKBadgeTextView *)v3 _setText:v4];
    v5 = v3;
  }
  return v3;
}

@end