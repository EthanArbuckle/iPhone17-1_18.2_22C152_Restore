@interface IntentHandler
- (_TtC23AnnounceIntentExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
- (void)transactionDidCompleteForIntentIdentifier:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000075AC(v4, v8);

  sub_100009014(v8, (uint64_t)v8[3]);
  v6 = (void *)sub_10001B410();
  sub_100009058((uint64_t)v8);
  return v6;
}

- (_TtC23AnnounceIntentExtension13IntentHandler)init
{
  uint64_t v3 = OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers;
  id v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_100007288((uint64_t)&_swiftEmptyArrayStorage);
  v5 = (char *)v4 + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler____lazy_storage___logger;
  uint64_t v6 = sub_10001B0B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for IntentHandler();
  return [(IntentHandler *)&v8 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler____lazy_storage___logger;
  sub_100008F4C((uint64_t)v3);
}

- (void)transactionDidCompleteForIntentIdentifier:(id)a3
{
  uint64_t v4 = sub_10001B0F0();
  unint64_t v6 = v5;
  v7 = self;
  sub_10000885C(v4, v6);

  swift_bridgeObjectRelease();
}

@end