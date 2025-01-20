@interface MindWeekdaySelectionViewController
- (_TtC12MindSettings34MindWeekdaySelectionViewController)initWithCoder:(id)a3;
- (_TtC12MindSettings34MindWeekdaySelectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12MindSettings34MindWeekdaySelectionViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MindWeekdaySelectionViewController

- (_TtC12MindSettings34MindWeekdaySelectionViewController)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC12MindSettings34MindWeekdaySelectionViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC12MindSettings34MindWeekdaySelectionViewController *)sub_E4C0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_5930();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_E1C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E190();
  id v10 = a3;
  v11 = self;
  sub_5A68(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_E1C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E190();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = (void *)sub_5D0C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC12MindSettings34MindWeekdaySelectionViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC12MindSettings34MindWeekdaySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12MindSettings34MindWeekdaySelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12MindSettings34MindWeekdaySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end