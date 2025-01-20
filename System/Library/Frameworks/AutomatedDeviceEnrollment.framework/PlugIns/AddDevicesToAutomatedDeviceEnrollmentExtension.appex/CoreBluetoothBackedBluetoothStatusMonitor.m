@interface CoreBluetoothBackedBluetoothStatusMonitor
- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension41CoreBluetoothBackedBluetoothStatusMonitor)init;
- (void)centralManagerDidUpdateState:(id)a3;
@end

@implementation CoreBluetoothBackedBluetoothStatusMonitor

- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension41CoreBluetoothBackedBluetoothStatusMonitor)init
{
  return (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension41CoreBluetoothBackedBluetoothStatusMonitor *)sub_10007E220();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension41CoreBluetoothBackedBluetoothStatusMonitor_monitor));
  v3 = (char *)self
     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension41CoreBluetoothBackedBluetoothStatusMonitor__bluetoothStatus;
  uint64_t v4 = sub_10000D308(&qword_1000D73D0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10007E54C(v4);
}

@end