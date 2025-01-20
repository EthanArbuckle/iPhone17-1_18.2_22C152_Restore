@interface CAFVehicleVariantObservable
- (NSString)description;
- (_TtC10CAFCombine27CAFVehicleVariantObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)vehicleVariantService:(id)a3 didUpdateAudioLogo:(id)a4;
- (void)vehicleVariantService:(id)a3 didUpdateExteriorStyle:(id)a4;
- (void)vehicleVariantService:(id)a3 didUpdateInteriorStyle:(id)a4;
- (void)vehicleVariantService:(id)a3 didUpdateVehicleLayout:(id)a4;
- (void)vehicleVariantService:(id)a3 didUpdateVehicleLogo:(id)a4;
@end

@implementation CAFVehicleVariantObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFVehicleVariantObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFVehicleVariantObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine27CAFVehicleVariantObservable)init
{
}

- (void)vehicleVariantService:(id)a3 didUpdateExteriorStyle:(id)a4
{
}

- (void)vehicleVariantService:(id)a3 didUpdateInteriorStyle:(id)a4
{
}

- (void)vehicleVariantService:(id)a3 didUpdateVehicleLayout:(id)a4
{
}

- (void)vehicleVariantService:(id)a3 didUpdateAudioLogo:(id)a4
{
}

- (void)vehicleVariantService:(id)a3 didUpdateVehicleLogo:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFVehicleVariantObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFVehicleVariantObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CAFVehicleVariantObservable.serviceDidFinishGroupUpdate(_:)();
}

@end