@interface CKSendAnimationContainerView
- (CKGradientReferenceView)gradientReferenceView;
- (CKSendAnimationContainerView)initWithFrame:(CGRect)a3;
- (void)setGradientReferenceView:(id)a3;
@end

@implementation CKSendAnimationContainerView

- (CKSendAnimationContainerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKSendAnimationContainerView;
  v3 = -[CKSendAnimationContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKGradientReferenceView alloc];
    [(CKSendAnimationContainerView *)v3 bounds];
    v5 = -[CKGradientReferenceView initWithFrame:](v4, "initWithFrame:");
    [(CKGradientReferenceView *)v5 setAutoresizingMask:18];
    [(CKSendAnimationContainerView *)v3 setGradientReferenceView:v5];
    [(CKSendAnimationContainerView *)v3 addSubview:v5];
  }
  return v3;
}

- (CKGradientReferenceView)gradientReferenceView
{
  return self->_gradientReferenceView;
}

- (void)setGradientReferenceView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end