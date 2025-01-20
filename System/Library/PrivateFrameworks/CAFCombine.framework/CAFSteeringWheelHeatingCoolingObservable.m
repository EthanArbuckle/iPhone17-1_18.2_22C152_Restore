@interface CAFSteeringWheelHeatingCoolingObservable
- (NSString)description;
- (_TtC10CAFCombine40CAFSteeringWheelHeatingCoolingObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateAutoMode:(BOOL)a4;
- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4;
@end

@implementation CAFSteeringWheelHeatingCoolingObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFSteeringWheelHeatingCoolingObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFSteeringWheelHeatingCoolingObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine40CAFSteeringWheelHeatingCoolingObservable_observed));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine40CAFSteeringWheelHeatingCoolingObservable)init
{
}

- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4
{
  id v5 = a3;
  v6 = self;
  CAFSteeringWheelHeatingCoolingObservable.steeringWheelHeatingCoolingService(_:didUpdateHeatingCoolingLevel:)();
}

- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFSteeringWheelHeatingCoolingObservable.steeringWheelHeatingCoolingService(_:didUpdateAutoMode:)();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFSteeringWheelHeatingCoolingObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFSteeringWheelHeatingCoolingObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFSteeringWheelHeatingCoolingObservable.serviceDidFinishGroupUpdate(_:)();
}

@end