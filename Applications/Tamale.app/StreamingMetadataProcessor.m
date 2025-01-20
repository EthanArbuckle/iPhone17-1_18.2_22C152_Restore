@interface StreamingMetadataProcessor
- (_TtC6Tamale26StreamingMetadataProcessor)init;
- (void)captureOutput:(id)a3 didOutputMetadataObjectCollections:(id)a4 fromConnection:(id)a5;
@end

@implementation StreamingMetadataProcessor

- (_TtC6Tamale26StreamingMetadataProcessor)init
{
  return (_TtC6Tamale26StreamingMetadataProcessor *)sub_1000A4820();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6Tamale26StreamingMetadataProcessor_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC6Tamale26StreamingMetadataProcessor_resultStream;
  uint64_t v6 = sub_10000F214(&qword_100525230);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC6Tamale26StreamingMetadataProcessor_continuation;
  uint64_t v8 = sub_10000F214((uint64_t *)&unk_10051CAF0);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

- (void)captureOutput:(id)a3 didOutputMetadataObjectCollections:(id)a4 fromConnection:(id)a5
{
  unint64_t v6 = (unint64_t)a4;
  if (a4)
  {
    sub_10000F734(0, (unint64_t *)&qword_100518A40);
    unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_1000A7908(v6);

  swift_bridgeObjectRelease();
}

@end