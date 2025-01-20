@interface PeopleDetectionSettingsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didToggleFeedbackSwitch:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PeopleDetectionSettingsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_23576F2B8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_23576FA7C(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_235949AC8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController *)sub_23576FC44(v5, v7, a4);
}

- (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController *)sub_23576FEF8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport37PeopleDetectionSettingsViewController_tableView));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 2) {
    return (*(void **)((char *)&self->super.super.super.isa
  }
                       + OBJC_IVAR____TtC16MagnifierSupport37PeopleDetectionSettingsViewController_availableDetectionFeedbacks))[2];
  int64_t v4 = 2;
  if (a4) {
    int64_t v4 = 0;
  }
  if (a4 == 1) {
    return 1;
  }
  else {
    return v4;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  id v16 = sub_235770200(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_235771008(v4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_235770DD0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(unint64_t))sub_23576EF40);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_235770DD0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(unint64_t))sub_23576F0D8);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  BOOL v12 = sub_235947B28() != 2;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  sub_235771414(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end