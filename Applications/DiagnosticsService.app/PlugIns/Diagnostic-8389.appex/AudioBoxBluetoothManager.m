@interface AudioBoxBluetoothManager
- (_TtC15Diagnostic_838924AudioBoxBluetoothManager)init;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation AudioBoxBluetoothManager

- (_TtC15Diagnostic_838924AudioBoxBluetoothManager)init
{
  result = (_TtC15Diagnostic_838924AudioBoxBluetoothManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000B858((uint64_t)self + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_peripheralScanTimeout;
  uint64_t v4 = sub_1000217A0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_authenticationTimeout, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagingCharacteristic));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capPSMCharacteristic));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100008C84(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived), *(void *)&self->delegate[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived]);
  sub_100008C84(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend), *(void *)&self->delegate[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000B290(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback));
  sub_10000B290(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion));
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion);

  sub_10000B290(v6);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000054D8(v4);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10 = sub_100021870();
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  sub_10000A068(v11, v12, v10);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000A514(v7);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_10000A6E0();
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_10000A848();
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_100005F4C(v6, (uint64_t)a4);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  sub_10000B730(0, &qword_1000320E0);
  unint64_t v6 = sub_100021980();
  id v7 = a3;
  id v8 = self;
  sub_10000A9B0(v6);

  swift_bridgeObjectRelease();
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_10000AD78((uint64_t)a5);
}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_10000AF9C(a4, (uint64_t)a5);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100008070(v6, a4);
}

@end