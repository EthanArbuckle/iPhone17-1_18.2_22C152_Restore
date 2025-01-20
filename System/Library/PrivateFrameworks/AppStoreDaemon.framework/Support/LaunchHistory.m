@interface LaunchHistory
+ (_TtC9appstored13LaunchHistory)shared;
- (_TtC9appstored13LaunchHistory)init;
- (id)getBiomeLaunchesWithLogKey:(id)a3 dateInterval:(id)a4 latestLaunchOnly:(BOOL)a5;
- (id)getLaunchesWithLogKey:(id)a3 dateInterval:(id)a4;
- (id)syncIfNeededWithLogKey:(id)a3;
- (id)syncLaunchesWithLogKey:(id)a3;
- (void)clearLaunchHistoryWithBundleIDs:(id)a3;
@end

@implementation LaunchHistory

+ (_TtC9appstored13LaunchHistory)shared
{
  if (qword_1005A3020 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B14E0;
  return (_TtC9appstored13LaunchHistory *)v2;
}

- (void)clearLaunchHistoryWithBundleIDs:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_100068160(v4);

  swift_bridgeObjectRelease();
}

- (id)getLaunchesWithLogKey:(id)a3 dateInterval:(id)a4
{
  uint64_t v4 = type metadata accessor for DateInterval();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10006F000((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100018D68(0, &qword_1005A4A60);
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v8.super.isa;
}

- (id)syncIfNeededWithLogKey:(id)a3
{
  uint64_t v4 = (void (**)(char *, uint64_t, uint64_t, uint64_t))a3;
  uint64_t v5 = self;
  sub_1000691BC(v4);
  v7 = v6;

  return v7;
}

- (id)syncLaunchesWithLogKey:(id)a3
{
  uint64_t v4 = (void (**)(char *, uint64_t, uint64_t, uint64_t))a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_100069C70(v4);

  return v6;
}

- (id)getBiomeLaunchesWithLogKey:(id)a3 dateInterval:(id)a4 latestLaunchOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = type metadata accessor for DateInterval();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))a3;
  v13 = self;
  sub_10006B480(v12, v11, v5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_100018D68(0, &qword_1005A4A60);
  v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v14.super.isa;
}

- (_TtC9appstored13LaunchHistory)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored13LaunchHistory_twentyEightDays) = (Class)0x4142750000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored13LaunchHistory_fiveMinutes) = (Class)0x4072C00000000000;
  uint64_t v3 = OBJC_IVAR____TtC9appstored13LaunchHistory_lockedThing;
  sub_10001644C(&qword_1005A4A78);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 24) = 0;
  *(void *)(v4 + 16) = 0;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LaunchHistory();
  return [(LaunchHistory *)&v6 init];
}

- (void).cxx_destruct
{
}

@end