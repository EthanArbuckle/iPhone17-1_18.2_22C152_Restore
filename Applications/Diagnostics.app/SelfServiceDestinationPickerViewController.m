@interface SelfServiceDestinationPickerViewController
- (_TtC11Diagnostics42SelfServiceDestinationPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11Diagnostics42SelfServiceDestinationPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(void *)a3 viewForHeaderInSection:;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SelfServiceDestinationPickerViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelfServiceDestinationPickerViewController();
  v2 = (char *)v5.receiver;
  [(SelfServiceDestinationPickerViewController *)&v5 viewDidLoad];
  sub_1000E40B8();
  id v3 = [v2 contentView];
  [v3 addSubview:*(void *)&v2[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_tableView]];

  id v4 = [v2 buttonTray];
  [v4 addButton:*(void *)&v2[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_cancelButton]];

  sub_1000E4668();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1000E3D60(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelfServiceDestinationPickerViewController();
  id v4 = (char *)v5.receiver;
  [(SelfServiceDestinationPickerViewController *)&v5 viewWillDisappear:v3];
  *(void *)(*(void *)&v4[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_suiteManager]
            + OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate
            + 8) = 0;
  swift_unknownObjectWeakAssign();
}

- (_TtC11Diagnostics42SelfServiceDestinationPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC11Diagnostics42SelfServiceDestinationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics42SelfServiceDestinationPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC11Diagnostics42SelfServiceDestinationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics42SelfServiceDestinationPickerViewController_destinationConfirmationHandler];

  sub_10003B0B8(v3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
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
  v12 = sub_1000E4A90(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  int64_t v6 = sub_1000E63F0();

  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(void *)a3 viewForHeaderInSection:
{
  id v5 = objc_allocWithZone((Class)UIView);
  id v6 = a3;
  id v7 = a1;
  id v8 = [v5 init];
  id v9 = [self clearColor];
  [v8 setBackgroundColor:v9];

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 12.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1000E6598();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end