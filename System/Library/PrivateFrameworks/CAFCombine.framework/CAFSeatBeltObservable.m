@interface CAFSeatBeltObservable
- (NSString)description;
- (_TtC10CAFCombine21CAFSeatBeltObservable)init;
- (void)dealloc;
- (void)seatBeltService:(id)a3 didUpdateBuckleState:(unsigned __int8)a4;
- (void)seatBeltService:(id)a3 didUpdateName:(id)a4;
- (void)seatBeltService:(id)a3 didUpdateSeatBeltIndicator:(unsigned __int8)a4;
- (void)seatBeltService:(id)a3 didUpdateSeatOccupancy:(unsigned __int8)a4;
- (void)seatBeltService:(id)a3 didUpdateVehicleLayoutKey:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFSeatBeltObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFSeatBeltObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFSeatBeltObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine21CAFSeatBeltObservable)init
{
}

- (void)seatBeltService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
}

- (void)seatBeltService:(id)a3 didUpdateSeatOccupancy:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = self;
  CAFSeatBeltObservable.seatBeltService(_:didUpdateSeatOccupancy:)((uint64_t)v7, a4);
}

- (void)seatBeltService:(id)a3 didUpdateBuckleState:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = self;
  CAFSeatBeltObservable.seatBeltService(_:didUpdateBuckleState:)((uint64_t)v7, a4);
}

- (void)seatBeltService:(id)a3 didUpdateSeatBeltIndicator:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  CAFSeatBeltObservable.seatBeltService(_:didUpdateSeatBeltIndicator:)();
}

- (void)seatBeltService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFSeatBeltObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFSeatBeltObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFSeatBeltObservable.serviceDidFinishGroupUpdate(_:)();
}

@end