@interface CKTapbackStickerView
- (BOOL)animationExplicitlyResumed;
- (BOOL)isSelected;
- (CKTapbackStickerView)init;
- (CKTapbackStickerView)initWithCoder:(id)a3;
- (CKTapbackStickerView)initWithFrame:(CGRect)a3;
- (CKTapbackViewDelegate)delegate;
- (UIEdgeInsets)platterEdgeInsets;
- (double)attributionScaleFactor;
- (void)animationTimerFired:(double)a3;
- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)displayScaleChanged;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation CKTapbackStickerView

- (double)attributionScaleFactor
{
  return *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackStickerView_attributionScaleFactor);
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackStickerView_platterEdgeInsets);
  double v3 = *(double *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR___CKTapbackStickerView_platterEdgeInsets);
  double v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR___CKTapbackStickerView_platterEdgeInsets);
  double v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackStickerView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  double v2 = (char *)self + OBJC_IVAR___CKTapbackStickerView_delegate;
  swift_beginAccess();
  double v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKTapbackViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
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
  v7.super_class = (Class)type metadata accessor for TapbackStickerView();
  [(CKTapbackStickerView *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackStickerView_delegate);

  double v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackStickerView_animatedImage);
}

- (CKTapbackStickerView)init
{
  return (CKTapbackStickerView *)TapbackStickerView.init()();
}

- (BOOL)isSelected
{
  double v2 = (BOOL *)self + OBJC_IVAR___CKTapbackStickerView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  id v5 = (BOOL *)self + OBJC_IVAR___CKTapbackStickerView_isSelected;
  swift_beginAccess();
  *id v5 = a3;
  if (*((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackStickerView_isPlaceholderImage) == 1)
  {
    v6 = self;
    sub_18F67AA7C();
  }
}

- (CKTapbackStickerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F67C854();
}

- (void)didMoveToWindow
{
}

- (void)layoutSubviews
{
}

- (void)displayScaleChanged
{
  double v2 = self;
  sub_18F67B064();
}

- (CKTapbackStickerView)initWithFrame:(CGRect)a3
{
  UIEdgeInsets result = (CKTapbackStickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)animationTimerFired:(double)a3
{
  double v4 = self;
  TapbackStickerView.animationTimerFired(_:)(a3);
}

- (BOOL)animationExplicitlyResumed
{
  return 0;
}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  _s7ChatKit18TapbackStickerViewC9configure3for10isSelectedySo9IMTapbackC_SbtF_0(v5);
}

@end