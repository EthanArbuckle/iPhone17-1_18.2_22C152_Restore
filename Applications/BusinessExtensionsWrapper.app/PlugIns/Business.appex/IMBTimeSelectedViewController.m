@interface IMBTimeSelectedViewController
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (_TtC8Business29IMBTimeSelectedViewController)initWithCoder:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IMBTimeSelectedViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000A16C8();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IMBTimeSelectedViewController();
  v4 = (char *)v6.receiver;
  [(IMBTimeSelectedViewController *)&v6 viewWillAppear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView];
  [v5 setPreservesSuperviewLayoutMargins:1];
  [v5 layoutMargins];
  [v5 setLayoutMargins:];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v6 = (unint64_t *)((char *)self + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = sub_1000BC0D8();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000BB3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  id v11 = a3;
  v12 = self;
  sub_1000A390C(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v14;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000BB3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  id v11 = a3;
  v12 = self;
  sub_1000A483C();
  double v14 = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000BB3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  id v11 = a3;
  v12 = self;
  sub_1000A40A8(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC8Business29IMBTimeSelectedViewController)initWithCoder:(id)a3
{
  return (_TtC8Business29IMBTimeSelectedViewController *)sub_1000A44A4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_timeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_warningLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_containerView));
  swift_bridgeObjectRelease();

  swift_release();
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  unsigned int v7 = sub_1000304C4();

  return v7 < 2;
}

@end