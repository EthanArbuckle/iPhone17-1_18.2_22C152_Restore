@interface IMBDetailedMessageTableViewController
- (_TtC8Business37IMBDetailedMessageTableViewController)initWithCoder:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation IMBDetailedMessageTableViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IMBDetailedMessageTableViewController();
  v2 = v4.receiver;
  id v3 = [(IMBDetailedMessageViewController *)&v4 viewDidLoad];
  (*(void (**)(id))((swift_isaMask & *v2) + 0x128))(v3);
  sub_10008E8B8();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10008F358();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t result = sub_1000BC0B8();
  __break(1u);
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = sub_1000BC0B8();
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1000BB3C8();
  __chkstk_darwin(v4 - 8, v5);
  sub_1000BB388();
  id result = (id)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1000BB3C8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = [objc_allocWithZone((Class)UIView) init];

  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (_TtC8Business37IMBDetailedMessageTableViewController)initWithCoder:(id)a3
{
  return (_TtC8Business37IMBDetailedMessageTableViewController *)sub_10008F8AC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_nothingAvailableLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___tableViewHeader));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___footerToolbarViewController);
}

@end