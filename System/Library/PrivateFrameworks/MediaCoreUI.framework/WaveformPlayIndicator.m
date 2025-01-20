@interface WaveformPlayIndicator
- (_TtC11MediaCoreUI21WaveformPlayIndicator)init;
- (_TtC11MediaCoreUI21WaveformPlayIndicator)initWithCoder:(id)a3;
- (_TtC11MediaCoreUI21WaveformPlayIndicator)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation WaveformPlayIndicator

- (_TtC11MediaCoreUI21WaveformPlayIndicator)init
{
  return (_TtC11MediaCoreUI21WaveformPlayIndicator *)sub_255A3A9D0();
}

- (void)dealloc
{
  v2 = self;
  sub_255A3DFB4();
}

- (void).cxx_destruct
{
  swift_release();
  sub_255A42584(*(unint64_t *)((char *)&self->super.super.super.isa
                                    + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_inputMode));
  sub_255A42584(*(unint64_t *)((char *)&self->super.super.super.isa
                                    + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_mode));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_colorPalette);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_colorPalette);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_colorPalette);
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_colorPalette));

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC11MediaCoreUI21WaveformPlayIndicator)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_255A43174();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_255A403B0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_255A3F3EC();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_255A406F8();
}

- (_TtC11MediaCoreUI21WaveformPlayIndicator)initWithFrame:(CGRect)a3
{
  result = (_TtC11MediaCoreUI21WaveformPlayIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end