@interface HTAccessoryAHPSManager
- (_TtC11HearingTest22HTAccessoryAHPSManager)init;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
@end

@implementation HTAccessoryAHPSManager

- (void)dealloc
{
  v2 = self;
  sub_25131F1C4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11HearingTest22HTAccessoryAHPSManager_connectedDiscovery));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11HearingTest22HTAccessoryAHPSManager_connectedDeviceLock));

  swift_bridgeObjectRelease();
  sub_2512EF6A8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HearingTest22HTAccessoryAHPSManager_deviceLostHandler));
  sub_2513430DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HearingTest22HTAccessoryAHPSManager_CaliCharacteristic), *(void *)&self->queue[OBJC_IVAR____TtC11HearingTest22HTAccessoryAHPSManager_CaliCharacteristic]);
  swift_release();
  swift_release();

  swift_weakDestroy();
  sub_2513430DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HearingTest22HTAccessoryAHPSManager_HearingTestMode), *(void *)&self->queue[OBJC_IVAR____TtC11HearingTest22HTAccessoryAHPSManager_HearingTestMode]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2513210D0(v4);
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25133D8A8(v7);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_25133EA48(v9);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_25133F3EC(v8, v9);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_251341D34(v6);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_2513424A8(v8, v9);
}

- (_TtC11HearingTest22HTAccessoryAHPSManager)init
{
  result = (_TtC11HearingTest22HTAccessoryAHPSManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end