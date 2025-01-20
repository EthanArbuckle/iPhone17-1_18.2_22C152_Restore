@interface ConsentNoticeTableViewController
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC11Diagnostics32ConsentNoticeTableViewController)init;
- (_TtC11Diagnostics32ConsentNoticeTableViewController)initWithCoder:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ConsentNoticeTableViewController

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  v4 = (void *)self;
  int64_t v5 = self + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate;
  if (*(void *)(self + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate))
  {
    int64_t v6 = a4 - 1;
    if (!__OFSUB__(a4, 1))
    {
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v9 = *(void *)(v5 + 8);
      v10 = *(uint64_t (**)(id, int64_t, uint64_t, uint64_t))(v9 + 16);
      id v11 = a3;
      id v12 = v4;
      swift_unknownObjectRetain();
      int64_t v13 = v10(v11, v6, ObjectType, v9);

      swift_unknownObjectRelease();
      return v13;
    }
    __break(1u);
  }
  __break(1u);
  return self;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_1000B0B7C((uint64_t)v10);
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (!*(void *)(self + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = (*(uint64_t (**)(id, uint64_t, uint64_t))(v4 + 40))(a3, ObjectType, v4);
  BOOL v7 = __OFADD__(v6, 1);
  self = v6 + 1;
  if (v7)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  id v12 = sub_1000B0FB8((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_1000B1268(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return a4 != 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v8 = IndexPath.section.getter() != 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (_TtC11Diagnostics32ConsentNoticeTableViewController)init
{
  return (_TtC11Diagnostics32ConsentNoticeTableViewController *)sub_1000B15D0();
}

- (_TtC11Diagnostics32ConsentNoticeTableViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics32ConsentNoticeTableViewController *)sub_1000B16DC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_tableView));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController____lazy_storage___headerCell);
}

@end