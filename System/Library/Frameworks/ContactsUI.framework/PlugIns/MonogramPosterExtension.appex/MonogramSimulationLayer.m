@interface MonogramSimulationLayer
- (_TtC23MonogramPosterExtension23MonogramSimulationLayer)init;
- (_TtC23MonogramPosterExtension23MonogramSimulationLayer)initWithCoder:(id)a3;
- (_TtC23MonogramPosterExtension23MonogramSimulationLayer)initWithLayer:(id)a3;
@end

@implementation MonogramSimulationLayer

- (_TtC23MonogramPosterExtension23MonogramSimulationLayer)init
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23MonogramPosterExtension23MonogramSimulationLayer_monogramTexture) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MonogramSimulationLayer(0);
  return [(BackgroundSimulationLayer *)&v3 init];
}

- (_TtC23MonogramPosterExtension23MonogramSimulationLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23MonogramPosterExtension23MonogramSimulationLayer_monogramTexture) = 0;
  id v4 = a3;

  result = (_TtC23MonogramPosterExtension23MonogramSimulationLayer *)sub_100016610();
  __break(1u);
  return result;
}

- (_TtC23MonogramPosterExtension23MonogramSimulationLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_100016540();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23MonogramPosterExtension23MonogramSimulationLayer_monogramTexture) = 0;

  result = (_TtC23MonogramPosterExtension23MonogramSimulationLayer *)sub_100016610();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end