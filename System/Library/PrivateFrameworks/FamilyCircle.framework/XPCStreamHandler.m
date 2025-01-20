@interface XPCStreamHandler
- (_TtC13familycircled16XPCStreamHandler)init;
- (void)setEventHandlerForStream:(id)a3 queue:(id)a4 handler:(id)a5;
@end

@implementation XPCStreamHandler

- (void)setEventHandlerForStream:(id)a3 queue:(id)a4 handler:(id)a5
{
  v7 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10002F1E4;
  *(void *)(v9 + 24) = v8;
  v14[4] = sub_10002F230;
  v14[5] = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10002EA00;
  v14[3] = &unk_10004ED38;
  v10 = _Block_copy(v14);
  v11 = a4;
  v12 = self;
  swift_retain();
  swift_release();
  uint64_t v13 = String.utf8CString.getter();
  xpc_set_event_stream_handler((const char *)(v13 + 32), v11, v10);
  swift_release();
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC13familycircled16XPCStreamHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for XPCStreamHandler();
  return [(XPCStreamHandler *)&v3 init];
}

@end