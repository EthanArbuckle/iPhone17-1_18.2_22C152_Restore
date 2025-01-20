@interface BackgroundSimulationLayer
- (_TtC23MonogramPosterExtension25BackgroundSimulationLayer)init;
- (_TtC23MonogramPosterExtension25BackgroundSimulationLayer)initWithCoder:(id)a3;
- (_TtC23MonogramPosterExtension25BackgroundSimulationLayer)initWithLayer:(id)a3;
- (void)dealloc;
- (void)display;
@end

@implementation BackgroundSimulationLayer

- (_TtC23MonogramPosterExtension25BackgroundSimulationLayer)init
{
  return (_TtC23MonogramPosterExtension25BackgroundSimulationLayer *)sub_100006038();
}

- (void)dealloc
{
  v2 = self;
  sub_100006408();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_renderPassDescriptor));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC23MonogramPosterExtension25BackgroundSimulationLayer_logger;
  uint64_t v4 = sub_100016290();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (_TtC23MonogramPosterExtension25BackgroundSimulationLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000078C4();
}

- (_TtC23MonogramPosterExtension25BackgroundSimulationLayer)initWithLayer:(id)a3
{
}

- (void)display
{
  id v3 = self;
  sub_1000069D0((char *)v3);
}

@end