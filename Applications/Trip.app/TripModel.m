@interface TripModel
- (_TtC4Trip9TripModel)init;
- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)dealloc;
@end

@implementation TripModel

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  if (qword_100036808 != -1) {
    swift_once();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 removeObserver:v6];

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for TripModel();
  [(TripModel *)&v7 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC4Trip9TripModel__cardmodels;
  uint64_t v4 = sub_100004E64(&qword_100036E38);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  id v5 = (char *)self + OBJC_IVAR____TtC4Trip9TripModel__carouselModel;
  uint64_t v6 = sub_100004E64(&qword_100036E40);
  objc_super v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v6 = self;
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  sub_10001B638(v5, 0xD000000000000027, 0x8000000100027CF0, 0xD00000000000001BLL, 0x8000000100027CD0);
  sub_100009908();
}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  objc_super v7 = self;
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  sub_10001B638(v6, 0xD00000000000002ELL, 0x8000000100027CA0, 0xD000000000000022, 0x8000000100027C70);
  sub_100009908();
}

- (_TtC4Trip9TripModel)init
{
  result = (_TtC4Trip9TripModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end