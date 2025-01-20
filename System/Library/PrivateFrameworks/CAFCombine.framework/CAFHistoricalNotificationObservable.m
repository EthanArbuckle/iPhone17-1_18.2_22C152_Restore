@interface CAFHistoricalNotificationObservable
- (NSString)description;
- (_TtC10CAFCombine35CAFHistoricalNotificationObservable)init;
- (void)dealloc;
- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4;
- (void)historicalNotificationService:(id)a3 didUpdateHistoricalNotificationUserActions:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateName:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateNotificationSeverity:(unsigned __int8)a4;
- (void)historicalNotificationService:(id)a3 didUpdateSymbolName:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateUserAction:(unsigned __int8)a4;
- (void)historicalNotificationService:(id)a3 didUpdateUserDismissible:(BOOL)a4;
- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleDescription:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleFullDescription:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleLabel:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFHistoricalNotificationObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFHistoricalNotificationObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFHistoricalNotificationObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine35CAFHistoricalNotificationObservable_observed));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine35CAFHistoricalNotificationObservable)init
{
}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleDescription:(id)a4
{
}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleFullDescription:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateUserVisibleFullDescription:)();

  swift_bridgeObjectRelease();
}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitDuration);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateTimestamp:)((uint64_t)v11, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)historicalNotificationService:(id)a3 didUpdateSymbolName:(id)a4
{
}

- (void)historicalNotificationService:(id)a3 didUpdateNotificationSeverity:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateNotificationSeverity:)();
}

- (void)historicalNotificationService:(id)a3 didUpdateHistoricalNotificationUserActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateHistoricalNotificationUserActions:)((uint64_t)v8, a4);
}

- (void)historicalNotificationService:(id)a3 didUpdateUserDismissible:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateUserDismissible:)();
}

- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateHidden:)();
}

- (void)historicalNotificationService:(id)a3 didUpdateUserAction:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateUserAction:)();
}

- (void)historicalNotificationService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFHistoricalNotificationObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CAFHistoricalNotificationObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFHistoricalNotificationObservable.serviceDidFinishGroupUpdate(_:)();
}

@end