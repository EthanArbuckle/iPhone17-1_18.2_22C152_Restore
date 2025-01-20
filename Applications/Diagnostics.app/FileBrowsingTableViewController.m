@interface FileBrowsingTableViewController
- (_TtC11Diagnostics31FileBrowsingTableViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics31FileBrowsingTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11Diagnostics31FileBrowsingTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FileBrowsingTableViewController

- (_TtC11Diagnostics31FileBrowsingTableViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_completion);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_remoteFiles) = (Class)_swiftEmptyArrayStorage;
  id v5 = a3;

  result = (_TtC11Diagnostics31FileBrowsingTableViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10004E4F8(a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100076670();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  int64_t v7 = *(void *)(sub_100074AD0() + 16);

  swift_bridgeObjectRelease();
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_100071284(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC11Diagnostics31FileBrowsingTableViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC11Diagnostics31FileBrowsingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics31FileBrowsingTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11Diagnostics31FileBrowsingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_completion));
  v3 = (char *)self + OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_directoryURL;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end