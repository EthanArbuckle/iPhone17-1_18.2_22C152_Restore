@interface CAFDefrostObservable
- (NSString)description;
- (_TtC10CAFCombine20CAFDefrostObservable)init;
- (void)dealloc;
- (void)defrostService:(id)a3 didUpdateLevel:(unsigned __int8)a4;
- (void)defrostService:(id)a3 didUpdateName:(id)a4;
- (void)defrostService:(id)a3 didUpdateTypes:(unint64_t)a4;
- (void)defrostService:(id)a3 didUpdateVehicleLayoutKey:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFDefrostObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFDefrostObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFDefrostObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine20CAFDefrostObservable)init
{
}

- (void)defrostService:(id)a3 didUpdateTypes:(unint64_t)a4
{
  id v5 = a3;
  v6 = self;
  CAFDefrostObservable.defrostService(_:didUpdateTypes:)();
}

- (void)defrostService:(id)a3 didUpdateLevel:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  CAFDefrostObservable.defrostService(_:didUpdateLevel:)();
}

- (void)defrostService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
}

- (void)defrostService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFDefrostObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFDefrostObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFDefrostObservable.serviceDidFinishGroupUpdate(_:)();
}

@end