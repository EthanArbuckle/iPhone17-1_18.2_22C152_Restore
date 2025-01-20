@interface ClockAngelConnectionManager
- (_TtC10ClockAngel27ClockAngelConnectionManager)init;
- (id)alertingSessionId;
- (void)alertAlarm:(id)a3 activityId:(id)a4;
- (void)alertTimerWithActivityId:(id)a3 timerId:(id)a4;
- (void)endAlertingSession;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)pauseTimerSessionWithId:(id)a3 title:(id)a4 duration:(id)a5 remaining:(id)a6 timeRemainingString:(id)a7 remainingPortion:(id)a8;
- (void)removeAlarms:(id)a3;
- (void)startAlarmSnoozeSessionWithAlarm:(id)a3;
- (void)startAlarmSnoozeSessionWithId:(id)a3 estimatedEndDate:(id)a4 title:(id)a5;
- (void)startTimerSessionWithId:(id)a3 title:(id)a4 estimatedEndDate:(id)a5 duartion:(id)a6;
- (void)stopAlarmSnoozeSessionWithId:(id)a3;
- (void)stopTimerSessionWithId:(id)a3;
- (void)updateAlarmEntry:(id)a3;
- (void)updateTimerSessionWithId:(id)a3 title:(id)a4;
- (void)warmUp;
@end

@implementation ClockAngelConnectionManager

- (_TtC10ClockAngel27ClockAngelConnectionManager)init
{
  sub_100050E7C();
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_100054B4C(v8);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager_publicListener));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager_connectionManagerQueue));
  sub_10000E8EC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager_reloadLayout));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager____lazy_storage___interface));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager____lazy_storage___timerManager));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager____lazy_storage___alarmManager);
}

- (void)startTimerSessionWithId:(id)a3 title:(id)a4 estimatedEndDate:(id)a5 duartion:(id)a6
{
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  id v18 = a6;
  v19 = self;
  sub_100051ADC(v12, v14, v15, v17, (uint64_t)v11, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)pauseTimerSessionWithId:(id)a3 title:(id)a4 duration:(id)a5 remaining:(id)a6 timeRemainingString:(id)a7 remainingPortion:(id)a8
{
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  v23 = self;
  sub_100051EFC(v24, v13, v14, v16, v20, v21, v17, v19, v22);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updateTimerSessionWithId:(id)a3 title:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  v11 = self;
  sub_100054E68(v5, v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)stopTimerSessionWithId:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_10005230C();

  swift_bridgeObjectRelease();
}

- (void)warmUp
{
  v3 = self;
  v4 = self;
  id v5 = [(ClockAngelConnectionManager *)v4 description];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  v6._countAndFlagsBits = 0x676E696D72617720;
  v6._object = (void *)0xEB00000000707520;
  String.append(_:)(v6);
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v3 logInfo:v7];
}

- (void)alertTimerWithActivityId:(id)a3 timerId:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = qword_1000C2C90;
  uint64_t v12 = self;
  if (v11 != -1) {
    swift_once();
  }
  sub_10004A03C(v5, v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)endAlertingSession
{
  v2 = self;
  sub_10001EA70(38, 0xD000000000000024, (void *)0x800000010009BFC0);
}

- (id)alertingSessionId
{
  sub_100055060();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (void)alertAlarm:(id)a3 activityId:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = qword_1000C2C90;
  id v10 = a3;
  uint64_t v11 = self;
  if (v9 != -1) {
    swift_once();
  }
  sub_10004A440(v10, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)startAlarmSnoozeSessionWithId:(id)a3 estimatedEndDate:(id)a4 title:(id)a5
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = self;
  sub_1000550E4(v10, v12);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)startAlarmSnoozeSessionWithAlarm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100052960(v4);
}

- (void)stopAlarmSnoozeSessionWithId:(id)a3
{
  v3 = self;
  sub_10001EA70(37, 0xD000000000000023, (void *)0x800000010009BED0);
}

- (void)removeAlarms:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_100052C30(v4);

  swift_bridgeObjectRelease();
}

- (void)updateAlarmEntry:(id)a3
{
  uint64_t v4 = qword_1000C2C78;
  id v5 = a3;
  uint64_t v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  dispatch thunk of DataStore.updateEntry(_:)();
}

@end