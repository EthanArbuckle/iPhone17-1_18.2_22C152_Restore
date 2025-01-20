@interface CAFDisplayedSpeedObservable
- (NSString)description;
- (_TtC10CAFCombine27CAFDisplayedSpeedObservable)init;
- (void)dealloc;
- (void)displayedSpeedService:(id)a3 didUpdateShowSecondarySpeed:(BOOL)a4;
- (void)displayedSpeedService:(id)a3 didUpdateSpeedMaxKMH:(id)a4;
- (void)displayedSpeedService:(id)a3 didUpdateSpeedMaxMPH:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)speedDisplayService:(id)a3 didUpdateSpeed:(id)a4;
- (void)speedDisplayService:(id)a3 didUpdateSpeedKMH:(id)a4;
- (void)speedDisplayService:(id)a3 didUpdateSpeedMPH:(id)a4;
@end

@implementation CAFDisplayedSpeedObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFDisplayedSpeedObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFDisplayedSpeedObservable.__deallocating_deinit();
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

  swift_release();
}

- (_TtC10CAFCombine27CAFDisplayedSpeedObservable)init
{
}

- (void)speedDisplayService:(id)a3 didUpdateSpeed:(id)a4
{
}

- (void)speedDisplayService:(id)a3 didUpdateSpeedKMH:(id)a4
{
}

- (void)speedDisplayService:(id)a3 didUpdateSpeedMPH:(id)a4
{
}

- (void)displayedSpeedService:(id)a3 didUpdateSpeedMaxKMH:(id)a4
{
}

- (void)displayedSpeedService:(id)a3 didUpdateSpeedMaxMPH:(id)a4
{
}

- (void)displayedSpeedService:(id)a3 didUpdateShowSecondarySpeed:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFDisplayedSpeedObservable.displayedSpeedService(_:didUpdateShowSecondarySpeed:)();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFDisplayedSpeedObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFDisplayedSpeedObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFDisplayedSpeedObservable.serviceDidFinishGroupUpdate(_:)();
}

@end