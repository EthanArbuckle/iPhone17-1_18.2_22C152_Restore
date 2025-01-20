@interface CKInlineReplyTransparentBlurBackgroundView
- (CKInlineReplyTransparentBlurBackgroundView)initWithFrame:(CGRect)a3;
- (UIVisualEffectView)blurEffectView;
- (void)animateIn;
- (void)animateOut;
- (void)setBlurEffectView:(id)a3;
@end

@implementation CKInlineReplyTransparentBlurBackgroundView

- (CKInlineReplyTransparentBlurBackgroundView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CKInlineReplyTransparentBlurBackgroundView;
  v3 = -[CKInlineReplyTransparentBlurBackgroundView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKInlineReplyTransparentBlurBackgroundView *)v3 setAlpha:0.0];
    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKInlineReplyTransparentBlurBackgroundView *)v4 setBackgroundColor:v5];

    id v6 = objc_alloc(MEMORY[0x1E4F43028]);
    v7 = (void *)MEMORY[0x1E4F427D8];
    v8 = +[CKUIBehavior sharedBehaviors];
    v9 = [v8 theme];
    [v9 replyTranscriptBlurBackgroundBlurRadius];
    v10 = objc_msgSend(v7, "effectWithBlurRadius:");
    v11 = (void *)[v6 initWithEffect:v10];
    [(CKInlineReplyTransparentBlurBackgroundView *)v4 setBlurEffectView:v11];

    v12 = [(CKInlineReplyTransparentBlurBackgroundView *)v4 blurEffectView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v13 = [(CKInlineReplyTransparentBlurBackgroundView *)v4 blurEffectView];
    [(CKInlineReplyTransparentBlurBackgroundView *)v4 addSubview:v13];

    v14 = [(CKInlineReplyTransparentBlurBackgroundView *)v4 blurEffectView];
    objc_msgSend(v14, "__ck_makeEdgesEqualTo:", v4);
  }
  return v4;
}

- (void)animateIn
{
  [(CKInlineReplyTransparentBlurBackgroundView *)self setAlpha:1.0];
  id v5 = +[CKUIBehavior sharedBehaviors];
  v3 = [v5 theme];
  v4 = [v3 replyTranscriptBlurBackgroundColor];
  [(CKInlineReplyTransparentBlurBackgroundView *)self setBackgroundColor:v4];
}

- (void)animateOut
{
  [(CKInlineReplyTransparentBlurBackgroundView *)self setAlpha:0.0];
  id v3 = [MEMORY[0x1E4F428B8] clearColor];
  [(CKInlineReplyTransparentBlurBackgroundView *)self setBackgroundColor:v3];
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (void)setBlurEffectView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end