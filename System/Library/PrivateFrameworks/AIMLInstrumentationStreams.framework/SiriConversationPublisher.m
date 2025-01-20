@interface SiriConversationPublisher
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (NSArray)bookmarkableUpstreams;
- (_TtC26AIMLInstrumentationStreams25SiriConversationPublisher)init;
- (void)subscribe:(id)a3;
@end

@implementation SiriConversationPublisher

- (void)subscribe:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22AE8C4D8();
  swift_unknownObjectRelease();
}

- (NSArray)bookmarkableUpstreams
{
  v2 = self;
  sub_22AE8C640();

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
  v8 = (void *)sub_22AE94290(v6);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC26AIMLInstrumentationStreams25SiriConversationPublisher)init
{
  result = (_TtC26AIMLInstrumentationStreams25SiriConversationPublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams25SiriConversationPublisher_upstream));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC26AIMLInstrumentationStreams25SiriConversationPublisher_inner);
}

@end