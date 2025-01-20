@interface CKBlurEffectBalloonView
- (CKBlurEffectBalloonView)initWithFrame:(CGRect)a3;
- (UIView)commSafetyBadgeView;
- (UIVisualEffectView)blurEffectView;
- (id)description;
- (void)layoutSubviews;
- (void)setBlurEffectView:(id)a3;
- (void)setCommSafetyBadgeView:(id)a3;
@end

@implementation CKBlurEffectBalloonView

- (id)description
{
  v3 = NSString;
  v4 = [(CKImageBalloonView *)self animatedImage];
  v8.receiver = self;
  v8.super_class = (Class)CKBlurEffectBalloonView;
  v5 = [(CKImageBalloonView *)&v8 description];
  v6 = [v3 stringWithFormat:@"[CKBlurEffectBalloonView animatedImage:%@ %@]", v4, v5];

  return v6;
}

- (CKBlurEffectBalloonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKBlurEffectBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKBlurEffectBalloonView *)v3 blurEffectView];
    [(CKBlurEffectBalloonView *)v4 addSubview:v5];
  }
  return v4;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)CKBlurEffectBalloonView;
  [(CKImageBalloonView *)&v33 layoutSubviews];
  if (CKIsRunningInMessagesNotificationExtension()
    || CKIsRunningInMessagesNotificationViewService())
  {
    v3 = [(CKBlurEffectBalloonView *)self layer];
    [v3 setContents:0];
  }
  v4 = [(CKBlurEffectBalloonView *)self blurEffectView];
  [(CKBlurEffectBalloonView *)self bounds];
  objc_msgSend(v4, "setFrame:");

  v5 = [(CKBlurEffectBalloonView *)self blurEffectView];
  [(CKBlurEffectBalloonView *)self bringSubviewToFront:v5];

  v6 = [(CKImageBalloonView *)self tailMask];
  objc_super v7 = [v6 superview];

  if (v7)
  {
    objc_super v8 = [(CKBlurEffectBalloonView *)self blurEffectView];
    v9 = [(CKImageBalloonView *)self tailMask];
    [(CKBlurEffectBalloonView *)self insertSubview:v8 belowSubview:v9];
  }
  v10 = [(CKImageBalloonView *)self outlineMask];
  [(CKBlurEffectBalloonView *)self bringSubviewToFront:v10];

  v11 = [(CKBlurEffectBalloonView *)self commSafetyBadgeView];

  if (v11)
  {
    v12 = +[CKUIBehavior sharedBehaviors];
    [v12 verticalBalloonBadgeInset];
    double v14 = v13;

    v15 = +[CKUIBehavior sharedBehaviors];
    [v15 horizontalBalloonBadgeInset];
    double v17 = v16;

    v18 = [(CKBlurEffectBalloonView *)self commSafetyBadgeView];
    [v18 sizeToFit];

    v19 = [(CKBlurEffectBalloonView *)self commSafetyBadgeView];
    [v19 frame];
    double v21 = v20;
    double v23 = v22;

    [(CKBlurEffectBalloonView *)self frame];
    double v25 = v24 - v21 - v17;
    [(CKBlurEffectBalloonView *)self frame];
    double v27 = v26 - v23 - v14;
    if ([(CKBalloonView *)self orientation] == 1)
    {
      v28 = +[CKUIBehavior sharedBehaviors];
      [v28 balloonMaskTailSizeForTailShape:1];
      double v25 = v25 - v29;
    }
    v30 = [(CKBlurEffectBalloonView *)self commSafetyBadgeView];
    objc_msgSend(v30, "setFrame:", v25, v27, v21, v23);
  }
  v31 = [(CKBlurEffectBalloonView *)self blurEffectView];
  if (v31)
  {
    v32 = [(CKBlurEffectBalloonView *)self commSafetyBadgeView];
    [(CKBlurEffectBalloonView *)self insertSubview:v32 aboveSubview:v31];
  }
}

- (UIVisualEffectView)blurEffectView
{
  blurEffectView = self->_blurEffectView;
  if (!blurEffectView)
  {
    v4 = [MEMORY[0x1E4F427D8] effectWithStyle:7];
    v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v4];
    v6 = self->_blurEffectView;
    self->_blurEffectView = v5;

    blurEffectView = self->_blurEffectView;
  }

  return blurEffectView;
}

- (UIView)commSafetyBadgeView
{
  [(CKImageBalloonView *)self setIsIrisAsset:0];
  [(CKImageBalloonView *)self setIsMonoskiAsset:0];
  commSafetyBadgeView = self->_commSafetyBadgeView;
  if (!commSafetyBadgeView)
  {
    v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"eye.slash"];
    v5 = [MEMORY[0x1E4F428B8] labelColor];
    v6 = [MEMORY[0x1E4F42A98] configurationWithHierarchicalColor:v5];
    objc_super v7 = [v4 imageWithSymbolConfiguration:v6];

    objc_super v8 = (UIView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v7];
    v9 = self->_commSafetyBadgeView;
    self->_commSafetyBadgeView = v8;

    commSafetyBadgeView = self->_commSafetyBadgeView;
  }

  return commSafetyBadgeView;
}

- (void)setBlurEffectView:(id)a3
{
}

- (void)setCommSafetyBadgeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commSafetyBadgeView, 0);

  objc_storeStrong((id *)&self->_blurEffectView, 0);
}

@end