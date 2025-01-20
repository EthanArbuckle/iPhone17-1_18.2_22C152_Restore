@interface InternalSettingsTableViewController
- (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)pregnancyModelDidUpdate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation InternalSettingsTableViewController

- (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *)sub_2413D483C(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2413D4924();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_2413D58EC(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v7 = type metadata accessor for Section() - 8;
  MEMORY[0x270FA5388](v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_sections);
    if (*(void *)(v12 + 16) > (unint64_t)a4)
    {
      sub_2413DA1BC(v12+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * a4, (uint64_t)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      id v13 = a3;
      v14 = self;
      int64_t v15 = sub_2413D6BB4();
      sub_2413DA288((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for Section);

      return v15;
    }
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v7 = type metadata accessor for Section() - 8;
  MEMORY[0x270FA5388](v7);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v12 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_sections);
  if (*(void *)(v12 + 16) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  sub_2413DA1BC(v12+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * a4, (uint64_t)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v13 = a3;
  v14 = self;
  sub_2413D6E08();
  uint64_t v16 = v15;
  sub_2413DA288((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for Section);

  if (v16)
  {
    v17 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_2413D71A4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController)initWithStyle:(int64_t)a3
{
  id result = (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  id result = (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_analysis));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_pregnancyModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController____lazy_storage___store));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController____lazy_storage___notificationSyncStore));

  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_2413D9D78(v7, (unint64_t *)&qword_26B012340, 0x263F45110, "[%{public}s] Received analysis: %{public}s", &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_analysis);
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2413D9D78(v4, &qword_26B00ED70, 0x263F0A488, "[%{public}s] Received update: %{public}s", &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_pregnancyModel);
}

@end