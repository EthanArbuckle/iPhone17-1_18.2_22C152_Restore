@interface EditCycleFactorTableViewController
- (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelAndDismiss;
- (void)doneSaveAndDismiss;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation EditCycleFactorTableViewController

- (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2414C78A0();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_sections);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_8:
    __break(1u);
    return self;
  }
  if (*(unsigned char *)(v4 + a4 + 32))
  {
    int64_t v5 = self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_deleteRows;
  }
  else
  {
    int64_t v5 = self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_dateRows;
    swift_beginAccess();
  }
  return *(void *)(*(void *)v5 + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  v10 = (char *)a3;
  v11 = self;
  v12 = sub_2414C1190(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_2414C230C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)doneSaveAndDismiss
{
  v2 = self;
  sub_2414C413C();
}

- (void)cancelAndDismiss
{
  int64_t v5 = self;
  v2 = (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *)[(EditCycleFactorTableViewController *)v5 presentingViewController];
  if (v2)
  {
    id v3 = v2;
    [(EditCycleFactorTableViewController *)v2 dismissViewControllerAnimated:1 completion:0];

    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = v5;
  }
}

- (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_factorSample));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_providedHealthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_analysisProvider));
  id v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_startDate;
  uint64_t v4 = sub_24162B718();
  int64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_endDate, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController____lazy_storage___doneBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController____lazy_storage___cancelBarButtonItem));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_nanoSyncControl);
}

@end