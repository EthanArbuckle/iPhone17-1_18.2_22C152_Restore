@interface TapbackEmojiKeyboardGlyphView
- (BOOL)isSelected;
- (CKTapbackViewDelegate)delegate;
- (UIEdgeInsets)platterEdgeInsets;
- (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView)init;
- (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView)initWithCoder:(id)a3;
- (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView)initWithFrame:(CGRect)a3;
- (double)attributionScaleFactor;
- (void)interfaceStyleChanged;
- (void)setDelegate:(id)a3;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation TapbackEmojiKeyboardGlyphView

- (double)attributionScaleFactor
{
  return 1.0;
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2 = *(double *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  double v3 = *(double *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  double v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  double v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isSelected
{
  double v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_isSelected;
  swift_beginAccess();
  *double v4 = a3;
}

- (CKTapbackViewDelegate)delegate
{
  swift_beginAccess();
  double v2 = (void *)swift_unknownObjectRetain();

  return (CKTapbackViewDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  double v4 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_delegate);
  swift_beginAccess();
  *double v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView)init
{
  TapbackEmojiKeyboardGlyphView.init()();
  return result;
}

- (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_attributionScaleFactor) = (Class)0x3FF0000000000000;
  double v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  *double v4 = *MEMORY[0x1E4F437F8];
  v4[1] = v5;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_isSelected) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_delegate) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_horizontalOffset) = (Class)0x4010000000000000;
  id v6 = a3;

  UIEdgeInsets result = (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView)initWithFrame:(CGRect)a3
{
  UIEdgeInsets result = (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_contentView);
}

- (void)interfaceStyleChanged
{
  double v2 = self;
  sub_18F682E40();
}

@end