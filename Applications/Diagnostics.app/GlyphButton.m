@interface GlyphButton
- (UILabel)buttonTitleLabel;
- (_TtC11Diagnostics11GlyphButton)initWithCoder:(id)a3;
- (_TtC11Diagnostics11GlyphButton)initWithFrame:(CGRect)a3;
- (void)handleTouchUpInside;
@end

@implementation GlyphButton

- (UILabel)buttonTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonTitleLabel));
}

- (_TtC11Diagnostics11GlyphButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10006E328();
}

- (void)handleTouchUpInside
{
  v2 = *(void (**)(_TtC11Diagnostics11GlyphButton *))&self->imageAndLabelGapConstraint[OBJC_IVAR____TtC11Diagnostics11GlyphButton_action];
  id v3 = self;
  swift_retain();
  v2(v3);

  swift_release();
}

- (_TtC11Diagnostics11GlyphButton)initWithFrame:(CGRect)a3
{
  result = (_TtC11Diagnostics11GlyphButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonTopMarginConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_imageAndLabelGapConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonLabelColor));
  id v3 = *(void **)&self->buttonHeightConstraint[OBJC_IVAR____TtC11Diagnostics11GlyphButton_action];
  swift_release();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_button));
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonTitleLabel);
}

@end