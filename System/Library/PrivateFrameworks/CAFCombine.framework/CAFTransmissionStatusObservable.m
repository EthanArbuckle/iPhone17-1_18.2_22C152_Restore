@interface CAFTransmissionStatusObservable
- (NSString)description;
- (_TtC10CAFCombine31CAFTransmissionStatusObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)transmissionStatusService:(id)a3 didUpdateGearPosition:(unsigned __int8)a4;
- (void)transmissionStatusService:(id)a3 didUpdateTransmissionMode:(unsigned __int8)a4;
@end

@implementation CAFTransmissionStatusObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFTransmissionStatusObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFTransmissionStatusObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine31CAFTransmissionStatusObservable)init
{
}

- (void)transmissionStatusService:(id)a3 didUpdateTransmissionMode:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = self;
  CAFTransmissionStatusObservable.transmissionStatusService(_:didUpdateTransmissionMode:)((uint64_t)v7, a4);
}

- (void)transmissionStatusService:(id)a3 didUpdateGearPosition:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = self;
  CAFTransmissionStatusObservable.transmissionStatusService(_:didUpdateGearPosition:)((uint64_t)v7, a4);
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFTransmissionStatusObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFTransmissionStatusObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CAFTransmissionStatusObservable.serviceDidFinishGroupUpdate(_:)();
}

@end