@interface CAFUIPickerViewController
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CAFUIPickerViewController

- (void)viewDidLoad
{
  v2 = self;
  CAFUIPickerViewController.viewDidLoad()();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6 = *(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC5CAFUI25CAFUIPickerViewController_representable);
  uint64_t ObjectType = swift_getObjectType();
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
  id v9 = a3;
  v10 = self;
  int64_t v11 = *(void *)(v8(ObjectType, v6) + 16);

  swift_bridgeObjectRelease();
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  int64_t v11 = self;
  v12 = (void *)CAFUIPickerViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  double v7 = specialized CAFUIPickerViewController.tableView(_:heightForFooterInSection:)();

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  double v7 = (void *)specialized CAFUIPickerViewController.tableView(_:viewForFooterInSection:)(v5);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  int64_t v11 = self;
  CAFUIPickerViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
}

@end