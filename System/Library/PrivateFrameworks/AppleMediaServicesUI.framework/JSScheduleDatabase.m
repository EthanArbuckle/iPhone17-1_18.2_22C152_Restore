@interface JSScheduleDatabase
- (_TtC14amsengagementd18JSScheduleDatabase)init;
- (id)fetch:(id)a3;
- (id)fetchIdentifiersMatching:(id)a3;
- (id)fetchSchedules:(id)a3;
- (void)removeIdentifiers:(id)a3;
@end

@implementation JSScheduleDatabase

- (id)fetch:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_1000F7900();
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (id)fetchSchedules:(id)a3
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_1000F7CD4();

  swift_bridgeObjectRelease();
  sub_100043478(&qword_10022D7B0);
  v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v5.super.isa;
}

- (id)fetchIdentifiersMatching:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_1000F7FF0();

  swift_bridgeObjectRelease();
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v5.super.isa;
}

- (void)removeIdentifiers:(id)a3
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_1000F82C4();

  swift_bridgeObjectRelease();
}

- (_TtC14amsengagementd18JSScheduleDatabase)init
{
}

- (void).cxx_destruct
{
}

@end