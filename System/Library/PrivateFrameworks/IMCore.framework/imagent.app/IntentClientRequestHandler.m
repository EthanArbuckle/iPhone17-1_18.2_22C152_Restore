@interface IntentClientRequestHandler
- (_TtC7imagent26IntentClientRequestHandler)init;
- (void)requestContactsForIdentifiers:(id)a3 reply:(id)a4;
@end

@implementation IntentClientRequestHandler

- (_TtC7imagent26IntentClientRequestHandler)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent26IntentClientRequestHandler_requiredCapabilities) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent26IntentClientRequestHandler_requiredEntitlements) = (Class)&off_100072298;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentClientRequestHandler();
  return [(IntentClientRequestHandler *)&v3 init];
}

- (void)requestContactsForIdentifiers:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_10004D250();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  sub_1000370A4(v6, (uint64_t)sub_100037340, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void).cxx_destruct
{
}

@end