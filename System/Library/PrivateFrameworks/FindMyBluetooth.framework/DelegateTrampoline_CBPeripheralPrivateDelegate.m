@interface DelegateTrampoline_CBPeripheralPrivateDelegate
- (_TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate)init;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheralDidUpdateName:(id)a3;
- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3;
@end

@implementation DelegateTrampoline_CBPeripheralPrivateDelegate

- (void)peripheralDidUpdateName:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_24E156898(v5);
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  sub_24E1408DC(0, &qword_2698C0240);
  uint64_t v6 = sub_24E1DA3F0();
  id v8 = a3;
  v7 = self;
  sub_24E156CA0(v8, v6);
  swift_bridgeObjectRelease();
}

- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v8 = a3;
  uint64_t v6 = self;
  id v7 = a4;
  sub_24E15743C(v8, a4);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_24E1581E8(v5);
}

- (_TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate)init
{
  result = (_TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate_delegateQueue));
  swift_weakDestroy();
}

@end