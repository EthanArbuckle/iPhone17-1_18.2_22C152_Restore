@interface Intents
- (_TtC9appstored7Intents)init;
- (id)intentUsageWithDateInterval:(id)a3 logKey:(id)a4;
@end

@implementation Intents

- (id)intentUsageWithDateInterval:(id)a3 logKey:(id)a4
{
  uint64_t v6 = type metadata accessor for DateInterval();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a4;
  v11 = self;
  sub_1000CDADC(v9, v10);
  uint64_t v13 = v12;

  (*(void (**)(void (**)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t))(v7 + 8))(v9, v6);
  if (v13)
  {
    sub_100018D68(0, &qword_1005A4A60);
    v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v14.super.isa = 0;
  }
  return v14.super.isa;
}

- (_TtC9appstored7Intents)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Intents();
  return [(Intents *)&v3 init];
}

@end