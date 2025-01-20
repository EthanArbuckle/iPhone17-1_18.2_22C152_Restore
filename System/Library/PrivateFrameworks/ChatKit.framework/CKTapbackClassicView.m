@interface CKTapbackClassicView
- (BOOL)animationExplicitlyResumed;
- (BOOL)isSelected;
- (CKTapbackClassicView)initWithCoder:(id)a3;
- (CKTapbackClassicView)initWithFrame:(CGRect)a3;
- (CKTapbackViewDelegate)delegate;
- (UIEdgeInsets)platterEdgeInsets;
- (double)attributionScaleFactor;
- (void)animationTimerFired:(double)a3;
- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)performViewControllerAppearingAnimation;
- (void)prepareForAppearingAnimation;
- (void)setDelegate:(id)a3;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation CKTapbackClassicView

- (double)attributionScaleFactor
{
  return 0.9;
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackClassicView_platterEdgeInsets);
  double v3 = *(double *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR___CKTapbackClassicView_platterEdgeInsets);
  double v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR___CKTapbackClassicView_platterEdgeInsets);
  double v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackClassicView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  double v2 = (char *)self + OBJC_IVAR___CKTapbackClassicView_delegate;
  swift_beginAccess();
  double v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKTapbackViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSelected
{
  double v2 = (BOOL *)self + OBJC_IVAR___CKTapbackClassicView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  double v5 = (BOOL *)self + OBJC_IVAR___CKTapbackClassicView_isSelected;
  swift_beginAccess();
  *double v5 = a3;
  v6 = self;
  sub_18F7263C4(a3);
}

- (void)dealloc
{
  double v3 = self;
  double v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedTimer);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_removeAnimationTimerObserver_, v4);
  }
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for TapbackClassicView();
  [(CKTapbackClassicView *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackClassicView_delegate);

  double v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackClassicView_asset);
}

- (CKTapbackClassicView)initWithFrame:(CGRect)a3
{
  return (CKTapbackClassicView *)_s7ChatKit18TapbackClassicViewC5frameACSo6CGRectV_tcfc_0();
}

- (CKTapbackClassicView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F726978();
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TapbackClassicView();
  double v2 = (char *)v9.receiver;
  [(CKTapbackClassicView *)&v9 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v9.receiver, v9.super_class);
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  CGFloat height = v10.size.height;
  double v7 = CGRectGetWidth(v10);
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v11);
  if (v8 >= v7) {
    double v8 = v7;
  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR___CKTapbackClassicView_imageView], sel_setFrame_, CGSizeCenteredInRect(v8, v8, x, y, width));
}

- (void)prepareForAppearingAnimation
{
  double v2 = self;
  sub_18F725E6C();
}

- (void)performViewControllerAppearingAnimation
{
  double v2 = self;
  sub_18F7260E4();
}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  id v6 = a3;
  double v7 = self;
  sub_18F725D90((uint64_t)objc_msgSend(v6, sel_associatedMessageType), a4);
}

- (void)animationTimerFired:(double)a3
{
  id v3 = self;
  _s7ChatKit18TapbackClassicViewC19animationTimerFiredyySdF_0();
}

- (BOOL)animationExplicitlyResumed
{
  return 0;
}

@end