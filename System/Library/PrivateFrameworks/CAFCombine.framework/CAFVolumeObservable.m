@interface CAFVolumeObservable
- (NSString)description;
- (_TtC10CAFCombine19CAFVolumeObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)volumeService:(id)a3 didUpdateName:(id)a4;
- (void)volumeService:(id)a3 didUpdateUserVisibleLabel:(id)a4;
- (void)volumeService:(id)a3 didUpdateVolume:(unsigned __int8)a4;
- (void)volumeService:(id)a3 didUpdateVolumeType:(unsigned __int8)a4;
@end

@implementation CAFVolumeObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFVolumeObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFVolumeObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine19CAFVolumeObservable)init
{
}

- (void)volumeService:(id)a3 didUpdateVolumeType:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  CAFVolumeObservable.volumeService(_:didUpdateVolumeType:)();
}

- (void)volumeService:(id)a3 didUpdateVolume:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  CAFVolumeObservable.volumeService(_:didUpdateVolume:)();
}

- (void)volumeService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFVolumeObservable.volumeService(_:didUpdateUserVisibleLabel:)();

  swift_bridgeObjectRelease();
}

- (void)volumeService:(id)a3 didUpdateName:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  CAFVolumeObservable.volumeService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFVolumeObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFVolumeObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFVolumeObservable.serviceDidFinishGroupUpdate(_:)();
}

@end