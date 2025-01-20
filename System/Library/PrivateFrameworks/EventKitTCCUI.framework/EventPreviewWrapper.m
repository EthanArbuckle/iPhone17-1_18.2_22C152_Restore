@interface EventPreviewWrapper
- (_TtC13EventKitTCCUI19EventPreviewWrapper)init;
- (_TtC13EventKitTCCUI19EventPreviewWrapper)initWithEvent:(id)a3;
- (id)getPreviewControllerForPrompt:(BOOL)a3;
@end

@implementation EventPreviewWrapper

- (_TtC13EventKitTCCUI19EventPreviewWrapper)initWithEvent:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13EventKitTCCUI19EventPreviewWrapper_event) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EventPreviewWrapper();
  id v4 = a3;
  return [(EventPreviewWrapper *)&v6 init];
}

- (id)getPreviewControllerForPrompt:(BOOL)a3
{
  id v4 = self;
  EventPreviewWrapper.getPreviewController(forPrompt:)(v5, a3);
  v7 = v6;

  return v7;
}

- (_TtC13EventKitTCCUI19EventPreviewWrapper)init
{
  result = (_TtC13EventKitTCCUI19EventPreviewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end