@interface LogEntry
- (_TtC7healthd8LogEntry)init;
- (_TtC7healthd8LogEntry)initWithCategory:(id)a3 composedMessage:(id)a4 date:(id)a5 formatString:(id)a6 logLevel:(int64_t)a7 processIdentifier:(int64_t)a8 process:(id)a9 subsystem:(id)a10;
@end

@implementation LogEntry

- (_TtC7healthd8LogEntry)initWithCategory:(id)a3 composedMessage:(id)a4 date:(id)a5 formatString:(id)a6 logLevel:(int64_t)a7 processIdentifier:(int64_t)a8 process:(id)a9 subsystem:(id)a10
{
  uint64_t v29 = a8;
  v30 = self;
  unint64_t v31 = a7;
  uint64_t v10 = type metadata accessor for Date();
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;
  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC7healthd8LogEntry *)sub_1000068FC(v13, v15, v16, v18, (uint64_t)v12, v19, v21, v31, v29, v22, v24, v25, v26);
}

- (_TtC7healthd8LogEntry)init
{
  result = (_TtC7healthd8LogEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7healthd8LogEntry_date;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end