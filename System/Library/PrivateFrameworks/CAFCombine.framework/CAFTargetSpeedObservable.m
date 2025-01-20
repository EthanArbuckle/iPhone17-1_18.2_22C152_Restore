@interface CAFTargetSpeedObservable
- (NSString)description;
- (_TtC10CAFCombine24CAFTargetSpeedObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)targetSpeedService:(id)a3 didUpdateSpeedKMH:(id)a4;
- (void)targetSpeedService:(id)a3 didUpdateSpeedLimited:(BOOL)a4;
- (void)targetSpeedService:(id)a3 didUpdateSpeedMPH:(id)a4;
- (void)targetSpeedService:(id)a3 didUpdateTargetSpeedState:(unsigned __int8)a4;
@end

@implementation CAFTargetSpeedObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFTargetSpeedObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFTargetSpeedObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine24CAFTargetSpeedObservable)init
{
}

- (void)targetSpeedService:(id)a3 didUpdateTargetSpeedState:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  CAFTargetSpeedObservable.targetSpeedService(_:didUpdateTargetSpeedState:)();
}

- (void)targetSpeedService:(id)a3 didUpdateSpeedKMH:(id)a4
{
}

- (void)targetSpeedService:(id)a3 didUpdateSpeedMPH:(id)a4
{
}

- (void)targetSpeedService:(id)a3 didUpdateSpeedLimited:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFTargetSpeedObservable.targetSpeedService(_:didUpdateSpeedLimited:)();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFTargetSpeedObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFTargetSpeedObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFTargetSpeedObservable.serviceDidFinishGroupUpdate(_:)();
}

@end