@interface ObjectUnderstandingSettingsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport41ObjectUnderstandingSettingsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport41ObjectUnderstandingSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleFeedbackSwitch:(id)a3;
- (void)toggleSeatOccupancySwitch:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ObjectUnderstandingSettingsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_235653408();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_235653B90(a3);
}

- (_TtC16MagnifierSupport41ObjectUnderstandingSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport41ObjectUnderstandingSettingsViewController *)sub_235653D50(v5, v7, a4);
}

- (_TtC16MagnifierSupport41ObjectUnderstandingSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport41ObjectUnderstandingSettingsViewController *)sub_235654000(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport41ObjectUnderstandingSettingsViewController_tableView));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
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
  id v16 = sub_235654304(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = 2;
  switch(a4)
  {
    case 0:
      return result;
    case 1:
    case 3:
      int64_t result = 1;
      break;
    case 2:
      int64_t result = (*(void **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MagnifierSupport41ObjectUnderstandingSettingsViewController_availableDetectionFeedbacks))[2];
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
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

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_235655378((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_235652F98);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_235655378((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_23565323C);
}

- (void)toggleFeedbackSwitch:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_235658084(a3);
}

- (void)toggleSeatOccupancySwitch:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_235658498(a3);
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
  sub_235658684(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end