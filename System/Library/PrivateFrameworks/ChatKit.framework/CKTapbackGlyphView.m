@interface CKTapbackGlyphView
- (BOOL)isSelected;
- (CKTapbackGlyphView)init;
- (CKTapbackGlyphView)initWithCoder:(id)a3;
- (CKTapbackGlyphView)initWithFrame:(CGRect)a3;
- (CKTapbackViewDelegate)delegate;
- (UIEdgeInsets)platterEdgeInsets;
- (double)attributionScaleFactor;
- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4;
- (void)performViewControllerAppearingAnimation;
- (void)prepareForAppearingAnimation;
- (void)setDelegate:(id)a3;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation CKTapbackGlyphView

- (double)attributionScaleFactor
{
  return *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackGlyphView_attributionScaleFactor);
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  double v3 = *(double *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  double v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  double v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  double v2 = (char *)self + OBJC_IVAR___CKTapbackGlyphView_delegate;
  swift_beginAccess();
  double v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKTapbackViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (CKTapbackGlyphView)init
{
  return (CKTapbackGlyphView *)TapbackGlyphView.init()();
}

- (BOOL)isSelected
{
  double v2 = (BOOL *)self + OBJC_IVAR___CKTapbackGlyphView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR___CKTapbackGlyphView_isSelected;
  swift_beginAccess();
  *double v4 = a3;
}

- (CKTapbackGlyphView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackGlyphView_attributionScaleFactor) = (Class)0x3FE6A09E667F3BCDLL;
  double v4 = (_OWORD *)((char *)self + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  __asm
  {
    FMOV            V0.2D, #4.0
    FMOV            V1.2D, #-4.0
  }
  *double v4 = _Q0;
  v4[1] = _Q1;
  id v11 = a3;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackGlyphView_isSelected) = 0;

  UIEdgeInsets result = (CKTapbackGlyphView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (CKTapbackGlyphView)initWithFrame:(CGRect)a3
{
  UIEdgeInsets result = (CKTapbackGlyphView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = a3;
    v9 = self;
    id v10 = objc_msgSend(v7, sel_associatedMessageEmoji);
    sub_18F7B97E0();

    id v11 = (id)sub_18F7B97A0();
    [(CKTapbackGlyphView *)v9 setText:v11];

    swift_bridgeObjectRelease();
  }
}

- (void)prepareForAppearingAnimation
{
}

- (void)performViewControllerAppearingAnimation
{
  double v2 = self;
  TapbackGlyphView.performViewControllerAppearingAnimation()();
}

@end