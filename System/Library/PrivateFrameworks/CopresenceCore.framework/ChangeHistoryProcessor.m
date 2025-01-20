@interface ChangeHistoryProcessor
- (_TtC14CopresenceCore22ChangeHistoryProcessor)init;
- (void)visitDeleteContactEvent:(id)a3;
@end

@implementation ChangeHistoryProcessor

- (void)visitDeleteContactEvent:(id)a3
{
  v4 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtC14CopresenceCore22ChangeHistoryProcessor_onContactDeleted);
  id v5 = a3;
  v6 = self;
  id v7 = objc_msgSend(v5, sel_contactIdentifier);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  v4(v8, v10);
  swift_bridgeObjectRelease();
}

- (_TtC14CopresenceCore22ChangeHistoryProcessor)init
{
  result = (_TtC14CopresenceCore22ChangeHistoryProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end