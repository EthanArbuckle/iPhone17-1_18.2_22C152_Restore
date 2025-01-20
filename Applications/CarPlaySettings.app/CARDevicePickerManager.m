@interface CARDevicePickerManager
- (_TtC15CarPlaySettings22CARDevicePickerManager)init;
- (_TtC15CarPlaySettings22CARDevicePickerManager)initWithPairedDevices:(id)a3 carSession:(id)a4;
- (_TtC5CAFUI31CAFUIDevicePickerViewController)viewController;
- (void)dealloc;
@end

@implementation CARDevicePickerManager

- (_TtC5CAFUI31CAFUIDevicePickerViewController)viewController
{
  return (_TtC5CAFUI31CAFUIDevicePickerViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_viewController));
}

- (_TtC15CarPlaySettings22CARDevicePickerManager)initWithPairedDevices:(id)a3 carSession:(id)a4
{
  return (_TtC15CarPlaySettings22CARDevicePickerManager *)CARDevicePickerManager.init(pairedDevices:carSession:)(a3, a4);
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_viewController);
  v3 = *(void (**)(void, void))((*v2 & swift_isaMask) + 0x1F0);
  v4 = self;
  v5 = v2;
  v3(0, 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CARDevicePickerManager();
  [(CARDevicePickerManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_viewController);
}

- (_TtC15CarPlaySettings22CARDevicePickerManager)init
{
  result = (_TtC15CarPlaySettings22CARDevicePickerManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end