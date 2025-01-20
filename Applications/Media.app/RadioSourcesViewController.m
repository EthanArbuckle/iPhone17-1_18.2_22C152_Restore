@interface RadioSourcesViewController
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)invalidate;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation RadioSourcesViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RadioSourcesViewController();
  v2 = (char *)v3.receiver;
  [(RadioPopoverViewController *)&v3 viewDidLoad];
  [*(id *)&v2[OBJC_IVAR____TtC5Media31TableHeaderFooterViewController_tableView] setDataSource:v2];
}

- (void)invalidate
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Media26RadioSourcesViewController_cancelSet);
  swift_beginAccess();
  void *v2 = &_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t Strong = swift_weakLoadStrong();
  int64_t v7 = Strong;
  if (Strong)
  {
    unint64_t v8 = *(void *)(Strong + OBJC_IVAR____TtC5Media18NowPlayingObserver_mediaSourceObservers);
    swift_bridgeObjectRetain();
    id v9 = a3;
    v10 = self;
    swift_release();
    if (v8)
    {
      if (v8 >> 62)
      {
        swift_bridgeObjectRetain();
        int64_t v7 = _CocoaArrayWrapper.endIndex.getter();

        swift_bridgeObjectRelease_n();
      }
      else
      {
        int64_t v7 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);

        swift_bridgeObjectRelease();
      }
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_100069FCC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10006A488(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Media26RadioSourcesViewController_completionBlock);

  sub_10000F940(v3);
}

@end