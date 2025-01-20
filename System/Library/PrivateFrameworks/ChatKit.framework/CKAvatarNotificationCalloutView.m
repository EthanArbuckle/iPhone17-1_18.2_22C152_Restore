@interface CKAvatarNotificationCalloutView
- (BOOL)_shouldShowShadow;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CAAnimation)finisherAnimation;
- (CAAnimation)starterAniamtion;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAvatarNotificationCalloutView)initWithFrame:(CGRect)a3 previewText:(id)a4 mode:(int64_t)a5;
- (CKAvatarNotificationCalloutViewDelegate)delegate;
- (UIImageView)tailImageView;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UITextView)textView;
- (int64_t)mode;
- (void)_handleTap:(id)a3;
- (void)animateIn;
- (void)animateOut;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFinisherAnimation:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setStarterAniamtion:(id)a3;
- (void)setTailImageView:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation CKAvatarNotificationCalloutView

- (CKAvatarNotificationCalloutView)initWithFrame:(CGRect)a3 previewText:(id)a4 mode:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v49.receiver = self;
  v49.super_class = (Class)CKAvatarNotificationCalloutView;
  v11 = -[CKAvatarNotificationCalloutView initWithFrame:](&v49, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKAvatarNotificationCalloutView *)v11 setBackgroundColor:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F42F58]);
    [(CKAvatarNotificationCalloutView *)v11 setTextView:v13];

    v14 = [MEMORY[0x1E4F428B8] whiteColor];
    v15 = [(CKAvatarNotificationCalloutView *)v11 textView];
    [v15 setBackgroundColor:v14];

    v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43878]];
    v17 = [(CKAvatarNotificationCalloutView *)v11 textView];
    [v17 setFont:v16];

    v18 = [(CKAvatarNotificationCalloutView *)v11 textView];
    [v18 setText:v10];

    v19 = [(CKAvatarNotificationCalloutView *)v11 textView];
    [v19 setEditable:0];

    v20 = [(CKAvatarNotificationCalloutView *)v11 textView];
    [v20 setScrollEnabled:0];

    v21 = [(CKAvatarNotificationCalloutView *)v11 textView];
    [v21 setUserInteractionEnabled:0];

    v22 = [(CKAvatarNotificationCalloutView *)v11 textView];
    objc_msgSend(v22, "setTextContainerInset:", 3.0, 5.0, 3.0, 5.0);

    v23 = [(CKAvatarNotificationCalloutView *)v11 textView];
    v24 = [v23 layer];
    [v24 setCornerRadius:12.5];

    if ([(CKAvatarNotificationCalloutView *)v11 _shouldShowShadow])
    {
      v25 = [(CKAvatarNotificationCalloutView *)v11 textView];
      v26 = [v25 layer];
      [v26 setMasksToBounds:0];

      v27 = [(CKAvatarNotificationCalloutView *)v11 textView];
      v28 = [v27 layer];
      LODWORD(v29) = 1050253722;
      [v28 setShadowOpacity:v29];

      id v30 = [MEMORY[0x1E4F428B8] blackColor];
      uint64_t v31 = [v30 CGColor];
      v32 = [(CKAvatarNotificationCalloutView *)v11 textView];
      v33 = [v32 layer];
      [v33 setShadowColor:v31];

      v34 = [(CKAvatarNotificationCalloutView *)v11 textView];
      v35 = [v34 layer];
      objc_msgSend(v35, "setShadowOffset:", 0.0, 0.0);

      v36 = [(CKAvatarNotificationCalloutView *)v11 textView];
      v37 = [v36 layer];
      [v37 setShadowRadius:12.5];
    }
    v38 = [(CKAvatarNotificationCalloutView *)v11 textView];
    [v38 sizeToFit];

    v39 = [(CKAvatarNotificationCalloutView *)v11 textView];
    [(CKAvatarNotificationCalloutView *)v11 addSubview:v39];

    id v40 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
    [(CKAvatarNotificationCalloutView *)v11 setTailImageView:v40];

    v41 = [MEMORY[0x1E4F42A80] ckTemplateImageNamed:@"Message-Callout-Tail"];
    v42 = [(CKAvatarNotificationCalloutView *)v11 tailImageView];
    [v42 setImage:v41];

    v43 = [MEMORY[0x1E4F428B8] whiteColor];
    v44 = [(CKAvatarNotificationCalloutView *)v11 tailImageView];
    [v44 setTintColor:v43];

    v45 = [(CKAvatarNotificationCalloutView *)v11 tailImageView];
    [(CKAvatarNotificationCalloutView *)v11 addSubview:v45];

    [(CKAvatarNotificationCalloutView *)v11 setUserInteractionEnabled:1];
    v46 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v11 action:sel__handleTap_];
    [(CKAvatarNotificationCalloutView *)v11 setTapGestureRecognizer:v46];

    v47 = [(CKAvatarNotificationCalloutView *)v11 tapGestureRecognizer];
    [(CKAvatarNotificationCalloutView *)v11 addGestureRecognizer:v47];
  }
  return v11;
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)CKAvatarNotificationCalloutView;
  [(CKAvatarNotificationCalloutView *)&v43 layoutSubviews];
  [(CKAvatarNotificationCalloutView *)self sizeToFit];
  [(CKAvatarNotificationCalloutView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v41 = v5;
  CGFloat v42 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(CKAvatarNotificationCalloutView *)self tailImageView];
  [v11 sizeToFit];

  v12 = [(CKAvatarNotificationCalloutView *)self tailImageView];
  [v12 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v44.origin.double x = v4;
  v44.origin.double y = v6;
  v44.size.double width = v8;
  v44.size.double height = v10;
  CGFloat v21 = CGRectGetWidth(v44) * 0.5;
  v45.origin.double x = v14;
  v45.origin.double y = v16;
  v45.size.double width = v18;
  v45.size.double height = v20;
  CGFloat v22 = v21 - CGRectGetWidth(v45) * 0.5;
  v23 = [(CKAvatarNotificationCalloutView *)self tailImageView];
  objc_msgSend(v23, "setFrame:", v22, 0.0, v18, v20);

  v46.origin.double x = v42;
  v46.origin.double y = v41;
  v46.size.double width = v8;
  v46.size.double height = v10;
  double Width = CGRectGetWidth(v46);
  v47.origin.double x = v42;
  v47.origin.double y = v41;
  v47.size.double width = v8;
  v47.size.double height = v10;
  CGFloat v25 = CGRectGetHeight(v47) + -9.0;
  v26 = [(CKAvatarNotificationCalloutView *)self textView];
  objc_msgSend(v26, "setFrame:", 0.0, 9.0, Width, v25);

  v48.origin.double x = v42;
  v48.origin.double y = v41;
  v48.size.double width = v8;
  v48.size.double height = v10;
  if (CGRectGetWidth(v48) == 50.0)
  {
    v27 = [(CKAvatarNotificationCalloutView *)self textView];
    [v27 setTextAlignment:1];
  }
  if ([(CKAvatarNotificationCalloutView *)self _shouldShowShadow])
  {
    v28 = [(CKAvatarNotificationCalloutView *)self textView];
    [v28 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;

    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v30 + -1.0, v32 + -1.0, v34 + 2.0, v36 + 2.0);
    id v37 = objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [v37 CGPath];
    v39 = [(CKAvatarNotificationCalloutView *)self textView];
    id v40 = [v39 layer];
    [v40 setShadowPath:v38];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(CKAvatarNotificationCalloutView *)self textView];
  CGFloat v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  CGFloat v5 = CGRectGetWidth(v14) * 0.7;
  CGFloat v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 bounds];
  objc_msgSend(v3, "sizeThatFits:", v5, CGRectGetHeight(v15) * 0.5);
  double v8 = v7;
  double v10 = v9;

  double v11 = fmax(v8, 50.0);
  double v12 = v10 + 9.0;
  if (v10 > 200.0) {
    double v12 = 209.0;
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (BOOL)_shouldShowShadow
{
  return [(CKAvatarNotificationCalloutView *)self mode] == 0;
}

- (void)animateIn
{
  double v3 = alphaAnimation(1);
  [v3 setDelegate:self];
  [(CKAvatarNotificationCalloutView *)self setStarterAniamtion:v3];
  CGFloat v4 = [(CKAvatarNotificationCalloutView *)self layer];
  [v4 addAnimation:v3 forKey:@"message-in-opacity-animation"];

  CGFloat v5 = [(CKAvatarNotificationCalloutView *)self layer];
  LODWORD(v6) = 1.0;
  [v5 setOpacity:v6];

  double v7 = [(CKAvatarNotificationCalloutView *)self layer];
  double v8 = scaleAnimation(1);
  [v7 addAnimation:v8 forKey:@"message-in-scale-animation"];

  CATransform3DMakeScale(&v11, 1.0, 1.0, 0.0);
  double v9 = [(CKAvatarNotificationCalloutView *)self layer];
  CATransform3D v10 = v11;
  [v9 setTransform:&v10];
}

- (void)animateOut
{
  double v3 = alphaAnimation(0);
  [v3 setDelegate:self];
  [(CKAvatarNotificationCalloutView *)self setFinisherAnimation:v3];
  CGFloat v4 = [(CKAvatarNotificationCalloutView *)self layer];
  [v4 addAnimation:v3 forKey:@"message-out-opacity-animation"];

  CGFloat v5 = [(CKAvatarNotificationCalloutView *)self layer];
  [v5 setOpacity:0.0];

  double v6 = scaleAnimation(0);
  double v7 = [(CKAvatarNotificationCalloutView *)self layer];
  [v7 addAnimation:v6 forKey:@"message-out-scale-animation"];

  CATransform3DMakeScale(&v10, 0.001, 0.001, 1.0);
  double v8 = [(CKAvatarNotificationCalloutView *)self layer];
  CATransform3D v9 = v10;
  [v8 setTransform:&v9];
}

- (void)animationDidStart:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAvatarNotificationCalloutView *)self starterAniamtion];

  if (v5 == v4)
  {
    id v6 = [(CKAvatarNotificationCalloutView *)self delegate];
    [v6 avatarNotificationCalloutViewWillFadeIn:self];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CKAvatarNotificationCalloutView *)self finisherAnimation];

  if (v7 == v6 && v4)
  {
    id v8 = [(CKAvatarNotificationCalloutView *)self delegate];
    [v8 avatarNotificationCalloutViewDidFinishFadeOut:self];
  }
}

- (void)_handleTap:(id)a3
{
  BOOL v4 = [(CKAvatarNotificationCalloutView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKAvatarNotificationCalloutView *)self delegate];
    [v6 avatarNotificationCalloutViewReceivedTouch:self];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKAvatarNotificationCalloutView;
  return -[CKAvatarNotificationCalloutView pointInside:withEvent:](&v5, sel_pointInside_withEvent_, a4, a3.x, a3.y);
}

- (CKAvatarNotificationCalloutViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAvatarNotificationCalloutViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (UIImageView)tailImageView
{
  return self->_tailImageView;
}

- (void)setTailImageView:(id)a3
{
}

- (CAAnimation)starterAniamtion
{
  return self->_starterAniamtion;
}

- (void)setStarterAniamtion:(id)a3
{
}

- (CAAnimation)finisherAnimation
{
  return self->_finisherAnimation;
}

- (void)setFinisherAnimation:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_finisherAnimation, 0);
  objc_storeStrong((id *)&self->_starterAniamtion, 0);
  objc_storeStrong((id *)&self->_tailImageView, 0);
  objc_storeStrong((id *)&self->_textView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end