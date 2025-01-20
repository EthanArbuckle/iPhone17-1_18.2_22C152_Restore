@interface CAMSemanticStyleMaskedBadge
- (CAMSemanticStyleMaskedBadge)initWithFrame:(CGRect)a3;
- (CEKBadgeTextView)badgeView;
- (CEKCaptureStyle)semanticStyle;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)_cachedText;
- (NSTimer)_badgeUpdateLockoutTimer;
- (double)badgeLeftInset;
- (int64_t)orientation;
- (void)_handleBadgeUpdateLockoutTimerFired:(id)a3;
- (void)_requestTextUpdateDelayIfNeeded:(BOOL)a3;
- (void)layoutSubviews;
- (void)setBadgeLeftInset:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setSemanticStyle:(id)a3;
- (void)setSemanticStyle:(id)a3 delayIfNeeded:(BOOL)a4;
- (void)set_badgeUpdateLockoutTimer:(id)a3;
- (void)set_cachedText:(id)a3;
@end

@implementation CAMSemanticStyleMaskedBadge

- (CAMSemanticStyleMaskedBadge)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMSemanticStyleMaskedBadge;
  v3 = -[CAMSemanticStyleMaskedBadge initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMSemanticStyleMaskedBadge *)v3 setClipsToBounds:1];
    [(CAMSemanticStyleMaskedBadge *)v4 setUserInteractionEnabled:0];
    uint64_t v5 = +[CAMSemanticStyle standardStyle];
    semanticStyle = v4->_semanticStyle;
    v4->_semanticStyle = (CEKCaptureStyle *)v5;

    v7 = (CEKBadgeTextView *)objc_alloc_init(MEMORY[0x263F30690]);
    badgeView = v4->_badgeView;
    v4->_badgeView = v7;

    [(CAMSemanticStyleMaskedBadge *)v4 addSubview:v4->_badgeView];
    [(CAMSemanticStyleMaskedBadge *)v4 _requestTextUpdateDelayIfNeeded:0];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CAMSemanticStyleMaskedBadge *)self badgeView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(CAMSemanticStyleMaskedBadge *)self badgeView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  double v3 = [(CAMSemanticStyleMaskedBadge *)self badgeView];
  [v3 intrinsicContentSize];
  CGFloat v5 = v4;
  double v7 = v6;

  int64_t v8 = [(CAMSemanticStyleMaskedBadge *)self orientation];
  if ((unint64_t)(v8 - 3) >= 2) {
    CGFloat v9 = v7;
  }
  else {
    CGFloat v9 = v5;
  }
  if ((unint64_t)(v8 - 3) < 2) {
    CGFloat v5 = v7;
  }
  [(CAMSemanticStyleMaskedBadge *)self badgeLeftInset];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v11 = [(CAMSemanticStyleMaskedBadge *)self badgeView];
  v12[2] = v15;
  v12[3] = v16;
  v12[4] = v17;
  v12[5] = v18;
  v12[0] = v13;
  v12[1] = v14;
  CAMApplyAnimationSensitiveGeometryToView((double *)v12, v11);
}

- (void)setSemanticStyle:(id)a3
{
}

- (void)setSemanticStyle:(id)a3 delayIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([v7 isEqual:self->_semanticStyle] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    [(CAMSemanticStyleMaskedBadge *)self _requestTextUpdateDelayIfNeeded:v4];
  }
}

- (void)setBadgeLeftInset:(double)a3
{
  if (self->_badgeLeftInset != a3)
  {
    self->_badgeLeftInset = a3;
    [(CAMSemanticStyleMaskedBadge *)self setNeedsLayout];
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(CAMSemanticStyleMaskedBadge *)self setNeedsLayout];
  }
}

- (void)_requestTextUpdateDelayIfNeeded:(BOOL)a3
{
  id v14 = [(CAMSemanticStyleMaskedBadge *)self semanticStyle];
  CGFloat v5 = [v14 displayName];
  double v6 = objc_msgSend(v5, "cam_uppercaseStringWithPreferredLocale");

  id v7 = [(CAMSemanticStyleMaskedBadge *)self _cachedText];
  if (([v6 isEqualToString:v7] & 1) == 0)
  {
    [(CAMSemanticStyleMaskedBadge *)self set_cachedText:v6];
    int64_t v8 = [(CAMSemanticStyleMaskedBadge *)self _badgeUpdateLockoutTimer];

    if (!v8 || !a3)
    {
      CGFloat v9 = [(CAMSemanticStyleMaskedBadge *)self badgeView];
      [v9 _setText:v6];

      CGFloat v10 = [(CAMSemanticStyleMaskedBadge *)self _badgeUpdateLockoutTimer];
      [v10 invalidate];

      double v11 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel__handleBadgeUpdateLockoutTimerFired_ selector:0 userInfo:0 repeats:0.3];
      [(CAMSemanticStyleMaskedBadge *)self set_badgeUpdateLockoutTimer:v11];

      v12 = [MEMORY[0x263EFF9F0] currentRunLoop];
      long long v13 = [(CAMSemanticStyleMaskedBadge *)self _badgeUpdateLockoutTimer];
      [v12 addTimer:v13 forMode:*MEMORY[0x263EFF588]];
    }
    [(CAMSemanticStyleMaskedBadge *)self setNeedsLayout];
  }
}

- (void)_handleBadgeUpdateLockoutTimerFired:(id)a3
{
  BOOL v4 = [(CAMSemanticStyleMaskedBadge *)self _badgeUpdateLockoutTimer];
  [v4 invalidate];

  [(CAMSemanticStyleMaskedBadge *)self set_badgeUpdateLockoutTimer:0];
  id v6 = [(CAMSemanticStyleMaskedBadge *)self _cachedText];
  CGFloat v5 = [(CAMSemanticStyleMaskedBadge *)self badgeView];
  [v5 _setText:v6];
}

- (CEKBadgeTextView)badgeView
{
  return self->_badgeView;
}

- (CEKCaptureStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (double)badgeLeftInset
{
  return self->_badgeLeftInset;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSTimer)_badgeUpdateLockoutTimer
{
  return self->__badgeUpdateLockoutTimer;
}

- (void)set_badgeUpdateLockoutTimer:(id)a3
{
}

- (NSString)_cachedText
{
  return self->__cachedText;
}

- (void)set_cachedText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedText, 0);
  objc_storeStrong((id *)&self->__badgeUpdateLockoutTimer, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end