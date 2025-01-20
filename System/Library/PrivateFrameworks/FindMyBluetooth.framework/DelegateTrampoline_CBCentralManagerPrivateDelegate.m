@interface DelegateTrampoline_CBCentralManagerPrivateDelegate
- (_TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate)init;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
@end

@implementation DelegateTrampoline_CBCentralManagerPrivateDelegate

- (void)centralManagerDidUpdateState:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_24E1ACC74(v5);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10 = sub_24E1DA260();
  id v14 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  sub_24E1B12F4(v11, v10, v12);
  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_24E1B1504(v6, (uint64_t)&unk_270032D80, (uint64_t)&unk_2698C0DF0);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  v9 = self;
  sub_24E1B18EC(a4, v8);
}

- (_TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate)init
{
  result = (_TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate_delegateQueue));
  swift_weakDestroy();
}

@end