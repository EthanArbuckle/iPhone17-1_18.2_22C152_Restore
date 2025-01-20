@interface SiriConversationPublisher.SiriConversationSubscriber
- (_TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber)init;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
@end

@implementation SiriConversationPublisher.SiriConversationSubscriber

- (void)receiveSubscription:(id)a3
{
}

- (int64_t)receiveInput:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22AEAA428();
  swift_unknownObjectRelease();
  sub_22A766ED0((uint64_t)v9, (uint64_t)v8);
  type metadata accessor for SiriTurn();
  if (swift_dynamicCast())
  {
    sub_22AE8E010(v7);
    sub_22AE8D268();
    int64_t v5 = BPSDemandMax();

    v4 = (_TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber *)v7;
  }
  else
  {
    int64_t v5 = BPSDemandMax();
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v5;
}

- (void)receiveCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  sub_22AE8CA6C((uint64_t)v4);
}

- (void)cancel
{
  v2 = self;
  sub_22AE8CCE4();
}

- (_TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber)init
{
  result = (_TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22A757A2C((uint64_t)self+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber_tracker, (uint64_t *)&unk_26838BC90);
  swift_unknownObjectRelease();
  swift_release();
}

@end