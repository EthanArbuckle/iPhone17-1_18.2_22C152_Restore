@interface WidgetEventListener
- (_TtC19appstorecomponentsd19WidgetEventListener)init;
- (void)eventServiceListener:(id)a3 didReceiveOpenEventWithURL:(id)a4;
@end

@implementation WidgetEventListener

- (void)eventServiceListener:(id)a3 didReceiveOpenEventWithURL:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10013BE40((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC19appstorecomponentsd19WidgetEventListener)init
{
  result = (_TtC19appstorecomponentsd19WidgetEventListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end