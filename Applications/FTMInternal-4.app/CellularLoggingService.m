@interface CellularLoggingService
- (_TtC13FTMInternal_422CellularLoggingService)init;
- (void)configurationListAvailable:(id)a3;
- (void)dealloc;
- (void)didCollectLogs:(id)a3 errorCode:(id)a4;
- (void)didStateChanged:(int64_t)a3 errorCode:(id)a4 config:(id)a5;
@end

@implementation CellularLoggingService

- (_TtC13FTMInternal_422CellularLoggingService)init
{
  return (_TtC13FTMInternal_422CellularLoggingService *)sub_10020A0B0();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 removeObserver:v6];

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for CellularLoggingService();
  [(CellularLoggingService *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_10015E120((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_timer);
}

- (void)didCollectLogs:(id)a3 errorCode:(id)a4
{
  if (a3) {
    NSString v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    NSString v6 = 0;
  }
  id v7 = a4;
  v8 = self;
  sub_10020A5C4(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)didStateChanged:(int64_t)a3 errorCode:(id)a4 config:(id)a5
{
  id v9 = a5;
  v10 = self;
  id v11 = a4;
  sub_10020AC90(a3, (uint64_t)a4, a5);
}

- (void)configurationListAvailable:(id)a3
{
  if (a3) {
    v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    v4 = 0;
  }
  id v5 = self;
  sub_10020B2A0(v4);

  swift_bridgeObjectRelease();
}

@end