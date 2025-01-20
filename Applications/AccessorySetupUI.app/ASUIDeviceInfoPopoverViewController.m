@interface ASUIDeviceInfoPopoverViewController
- (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController)initWithCoder:(id)a3;
- (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation ASUIDeviceInfoPopoverViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10002C3A8();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_10002CBE0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *)a3;
  v11 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v13 = (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *)[(ASUIDeviceInfoPopoverViewController *)v10 cellForRowAtIndexPath:isa];

  if (v13)
  {
    [(ASUIDeviceInfoPopoverViewController *)v13 setSelected:0 animated:1];

    id v10 = v11;
    v11 = v13;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *)sub_10002C898(v5, v7, a4);
}

- (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController)initWithCoder:(id)a3
{
  return (_TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController *)sub_10002CA00(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_device));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_tableView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end