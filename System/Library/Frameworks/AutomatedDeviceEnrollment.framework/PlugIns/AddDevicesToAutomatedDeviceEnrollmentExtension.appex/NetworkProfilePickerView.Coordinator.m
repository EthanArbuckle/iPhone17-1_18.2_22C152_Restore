@interface NetworkProfilePickerView.Coordinator
- (_TtCV46AddDevicesToAutomatedDeviceEnrollmentExtension24NetworkProfilePickerView11Coordinator)init;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
@end

@implementation NetworkProfilePickerView.Coordinator

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_10009CB50();
  uint64_t v6 = sub_10009DDC0();
  id v7 = a3;
  v8 = self;
  sub_100089E0C(v6);

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10008A240();
}

- (_TtCV46AddDevicesToAutomatedDeviceEnrollmentExtension24NetworkProfilePickerView11Coordinator)init
{
  result = (_TtCV46AddDevicesToAutomatedDeviceEnrollmentExtension24NetworkProfilePickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end