@interface CAFUIDevicePickerDetailViewController
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CAFUIDevicePickerDetailViewController

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (void *)MEMORY[0x24C59F610](v6);
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_removeObserver_, v7);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for CAFUIDevicePickerDetailViewController();
  [(CAFUIDevicePickerDetailViewController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_device));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_pairedDevices));
  swift_bridgeObjectRelease();
  outlined destroy of weak CAFUIAutomakerSettingObserverDelegate?((uint64_t)self + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_limitedUIView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_carSession);
}

- (void)viewDidLoad
{
  v2 = self;
  CAFUIDevicePickerDetailViewController.viewDidLoad()();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI37CAFUIDevicePickerDetailViewController_actions))[2];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)CAFUIDevicePickerDetailViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

@end