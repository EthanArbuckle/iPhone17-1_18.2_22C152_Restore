@interface CKTapbackEmojiView
- (BOOL)isSelected;
- (CKTapbackEmojiView)init;
- (CKTapbackEmojiView)initWithCoder:(id)a3;
- (CKTapbackEmojiView)initWithFrame:(CGRect)a3;
- (CKTapbackViewDelegate)delegate;
- (UIEdgeInsets)platterEdgeInsets;
- (double)attributionScaleFactor;
- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4;
- (void)displayScaleChanged;
- (void)layoutSubviews;
- (void)performSendAnimation;
- (void)performViewControllerAppearingAnimation;
- (void)prepareForAppearingAnimation;
- (void)setDelegate:(id)a3;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation CKTapbackEmojiView

- (double)attributionScaleFactor
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackEmojiView_attributionScaleFactor);
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets);
  double v3 = *(double *)((char *)&self->super.super._responderFlags + OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets);
  double v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets);
  double v5 = *(double *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isSelected
{
  double v2 = (BOOL *)self + OBJC_IVAR___CKTapbackEmojiView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR___CKTapbackEmojiView_isSelected;
  swift_beginAccess();
  *double v4 = a3;
}

- (CKTapbackViewDelegate)delegate
{
  double v2 = (char *)self + OBJC_IVAR___CKTapbackEmojiView_delegate;
  swift_beginAccess();
  double v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKTapbackViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (CKTapbackEmojiView)init
{
  return (CKTapbackEmojiView *)TapbackEmojiView.init()();
}

- (CKTapbackEmojiView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F765F84();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackEmojiView();
  id v2 = v3.receiver;
  [(CKTapbackEmojiView *)&v3 layoutSubviews];
  sub_18F76513C();
}

- (void)displayScaleChanged
{
  id v2 = self;
  sub_18F76513C();
}

- (CKTapbackEmojiView)initWithFrame:(CGRect)a3
{
  UIEdgeInsets result = (CKTapbackEmojiView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackEmojiView_delegate);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackEmojiView_contentView);
}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  TapbackEmojiView.configure(for:isSelected:)(v6, a4);
}

- (void)performSendAnimation
{
}

- (void)prepareForAppearingAnimation
{
}

- (void)performViewControllerAppearingAnimation
{
  id v2 = self;
  TapbackEmojiView.performViewControllerAppearingAnimation()();
}

@end