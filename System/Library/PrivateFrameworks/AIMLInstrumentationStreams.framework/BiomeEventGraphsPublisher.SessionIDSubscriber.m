@interface BiomeEventGraphsPublisher.SessionIDSubscriber
- (_TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber)init;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
@end

@implementation BiomeEventGraphsPublisher.SessionIDSubscriber

- (void)receiveSubscription:(id)a3
{
}

- (int64_t)receiveInput:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22AEAA428();
  swift_unknownObjectRelease();
  int64_t v5 = sub_22A78BF90((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (void)receiveCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  sub_22A78C0CC((uint64_t)v4);
}

- (void)cancel
{
  v2 = self;
  sub_22A78C360();
}

- (_TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber)init
{
  result = (_TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22A757A2C((uint64_t)self+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber_tracker, (uint64_t *)&unk_26838BC90);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber_logger;
  uint64_t v4 = sub_22AEA9EA8();
  int64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end