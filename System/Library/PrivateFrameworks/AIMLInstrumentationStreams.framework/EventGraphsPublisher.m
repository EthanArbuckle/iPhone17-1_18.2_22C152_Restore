@interface EventGraphsPublisher
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (NSArray)bookmarkableUpstreams;
- (_TtC26AIMLInstrumentationStreams20EventGraphsPublisher)init;
- (void)subscribe:(id)a3;
@end

@implementation EventGraphsPublisher

- (void)subscribe:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22A7ABD00();
  swift_unknownObjectRelease();
}

- (NSArray)bookmarkableUpstreams
{
  v2 = self;
  sub_22A7ABE80();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268380700);
  v3 = (void *)sub_22AEAA0E8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268380700);
  unint64_t v6 = sub_22AEAA0F8();
  id v7 = a3;
  swift_unknownObjectRetain();
  v8 = (void *)_s26AIMLInstrumentationStreams20EventGraphsPublisherC9publisher4with9upstreams13bookmarkStateSo014BMBookmarkableE0_So12BPSPublisherCyyXlGXcSgSoAH_AKXc_SayAKGSo10BMBookmark_pSgtFZ_0(v7, v6);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC26AIMLInstrumentationStreams20EventGraphsPublisher)init
{
  result = (_TtC26AIMLInstrumentationStreams20EventGraphsPublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams20EventGraphsPublisher_upstream));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams20EventGraphsPublisher_inner));
  v3 = (char *)self + OBJC_IVAR____TtC26AIMLInstrumentationStreams20EventGraphsPublisher_logger;
  uint64_t v4 = sub_22AEA9EA8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end