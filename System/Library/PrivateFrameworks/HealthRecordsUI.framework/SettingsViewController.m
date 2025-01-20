@interface SettingsViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC15HealthRecordsUI22SettingsViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15HealthRecordsUI22SettingsViewController)initWithStyle:(int64_t)a3;
- (_TtC15HealthRecordsUI22SettingsViewController)initWithUsingInsetStyling:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)closeButtonTapped;
- (void)dealloc;
- (void)sourceListDataSourceDidUpdate:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tapToRadar:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SettingsViewController

- (_TtC15HealthRecordsUI22SettingsViewController)initWithCoder:(id)a3
{
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_accountStateCancellable))
  {
    v3 = self;
    swift_retain();
    sub_1C254EA00();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SettingsViewController();
  [(SettingsViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_sourceLoadingToken));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_factory));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_profile));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_sourceListDataSource));
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C22AED7C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1C22AFB34(a3);
}

- (void)tapToRadar:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    objc_super v5 = self;
  }
  type metadata accessor for TapToRadarManager();
  static TapToRadarManager.presentTapToRadarDialogue(from:)(self);

  sub_1C224E3A4((uint64_t)v6);
}

- (_TtC15HealthRecordsUI22SettingsViewController)initWithUsingInsetStyling:(BOOL)a3
{
  result = (_TtC15HealthRecordsUI22SettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI22SettingsViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15HealthRecordsUI22SettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15HealthRecordsUI22SettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)closeButtonTapped
{
}

- (void)sourceListDataSourceDidUpdate:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  SettingsViewController.sourceListDataSourceDidUpdate(_:)(v4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  SettingsViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1C23C5674();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  unint64_t v6 = swift_bridgeObjectRetain();
  int64_t v7 = sub_1C22E6C84(v6);
  swift_bridgeObjectRelease();
  int64_t v8 = *(void *)(v7 + 16);

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = self;
  int64_t v8 = sub_1C2437570(a4);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = (UITableView *)a3;
  int64_t v7 = self;
  object = SettingsViewController.tableView(_:titleForHeaderInSection:)(v6, a4).value._object;

  if (object)
  {
    v9 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = self;
  sub_1C2437834(a4);
  uint64_t v9 = v8;

  if (v9)
  {
    id v10 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  SettingsViewController.tableView(_:cellForRowAt:)(v10, v9);
  uint64_t v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1C254CD90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  sub_1C254D4D0();
  if (swift_dynamicCastClass())
  {
    uint64_t v12 = self;
    id v13 = a3;
    id v14 = a4;
    sub_1C254D4B0();
  }
  else
  {
    uint64_t v15 = self;
    id v16 = a3;
    id v17 = a4;
  }
  type metadata accessor for LoadingTableViewCell();
  uint64_t v18 = swift_dynamicCastClass();
  if (v18) {
    objc_msgSend(*(id *)(v18 + OBJC_IVAR____TtC15HealthRecordsUI20LoadingTableViewCell_spinner), sel_startAnimating);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1C254CD90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  sub_1C254D4D0();
  uint64_t v12 = swift_dynamicCastClass();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  if (v12) {
    sub_1C254D4B0();
  }
  type metadata accessor for LoadingTableViewCell();
  uint64_t v16 = swift_dynamicCastClass();
  if (v16) {
    objc_msgSend(*(id *)(v16 + OBJC_IVAR____TtC15HealthRecordsUI20LoadingTableViewCell_spinner), sel_stopAnimating);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end