@interface InternalPeopleDetectionOptionsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation InternalPeopleDetectionOptionsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_235736A78();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_235736C1C(a3);
}

- (_TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController *)sub_235736D4C(v5, v7, a4);
}

- (_TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23573B708();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController_tableView);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController_availableInternalPeopleDetectionSections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_23573B864(a4);

  return v8;
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
  id v16 = sub_2357370D0(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (*(void *)(*(void *)((char *)self
                             + OBJC_IVAR____TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController_availableInternalPeopleDetectionSections)
                 + 16) <= a4)
  {
    v4 = 0;
  }
  else
  {
    if (a4 < 0)
    {
      __break(1u);
      return self;
    }
    sub_2356ED340();
    v4 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  return v4;
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
  sub_235737B2C(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  LOBYTE(self) = sub_23573B95C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return self & 1;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_235947B38();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10, v11, v12, v13);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v16 = a3;
  uint64_t v17 = self;
  sub_235739014(v16, a4, (unint64_t)v15);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
}

@end