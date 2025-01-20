@interface CAFPairedDevicesInformationObservable
- (NSString)description;
- (_TtC10CAFCombine37CAFPairedDevicesInformationObservable)init;
- (void)dealloc;
- (void)pairedDevicesInformationService:(id)a3 didUpdatePairedDeviceList:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFPairedDevicesInformationObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFPairedDevicesInformationObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFPairedDevicesInformationObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine37CAFPairedDevicesInformationObservable_observed));
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine37CAFPairedDevicesInformationObservable)init
{
}

- (void)pairedDevicesInformationService:(id)a3 didUpdatePairedDeviceList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFPairedDevicesInformationObservable.pairedDevicesInformationService(_:didUpdatePairedDeviceList:)((uint64_t)v8, v7);
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFPairedDevicesInformationObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CAFPairedDevicesInformationObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CAFPairedDevicesInformationObservable.serviceDidFinishGroupUpdate(_:)();
}

@end