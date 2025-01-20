@interface BiomeEventGraphsPublisher
- (NSArray)bookmarkableUpstreams;
- (_TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher)init;
- (void)subscribe:(id)a3;
@end

@implementation BiomeEventGraphsPublisher

- (void)subscribe:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22A78BD40();
  swift_unknownObjectRelease();
}

- (NSArray)bookmarkableUpstreams
{
  v2 = self;
  sub_22A78BEC0();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268380700);
  v3 = (void *)sub_22AEAA0E8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher)init
{
  result = (_TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher_mergedStream));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher_inner);
}

@end