@interface FMR1GlyphButton
- (_TtC11FMFindingUI15FMR1GlyphButton)initWithCoder:(id)a3;
- (_TtC11FMFindingUI15FMR1GlyphButton)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)ringDisplayLinkUpdateWithDisplaylink:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation FMR1GlyphButton

- (_TtC11FMFindingUI15FMR1GlyphButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D39A0F0();
}

- (void)dealloc
{
  v2 = self;
  sub_24D397EB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_style));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_normalBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_ringDisplayLink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_ringPerimiterAnimationSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_ringFadeAnimationSpring));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)ringDisplayLinkUpdateWithDisplaylink:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D398D58(v4);
}

- (void)drawRect:(CGRect)a3
{
  id v3 = self;
  sub_24D39A294();
}

- (_TtC11FMFindingUI15FMR1GlyphButton)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI15FMR1GlyphButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end