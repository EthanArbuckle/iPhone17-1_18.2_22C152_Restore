@interface CAFEqualizerObservable
- (NSString)description;
- (_TtC10CAFCombine22CAFEqualizerObservable)init;
- (void)dealloc;
- (void)equalizerService:(id)a3 didUpdateName:(id)a4;
- (void)equalizerService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4;
- (void)equalizerService:(id)a3 didUpdateType:(unsigned __int8)a4;
- (void)equalizerService:(id)a3 didUpdateUserVisibleLabel:(id)a4;
- (void)equalizerService:(id)a3 didUpdateValue:(char)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFEqualizerObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFEqualizerObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFEqualizerObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine22CAFEqualizerObservable)init
{
}

- (void)equalizerService:(id)a3 didUpdateType:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateType:)((uint64_t)v7, a4);
}

- (void)equalizerService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateSortOrder:)((uint64_t)v7, a4);
}

- (void)equalizerService:(id)a3 didUpdateValue:(char)a4
{
  id v5 = a3;
  id v6 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateValue:)();
}

- (void)equalizerService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateUserVisibleLabel:)();

  swift_bridgeObjectRelease();
}

- (void)equalizerService:(id)a3 didUpdateName:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFEqualizerObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFEqualizerObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFEqualizerObservable.serviceDidFinishGroupUpdate(_:)();
}

@end