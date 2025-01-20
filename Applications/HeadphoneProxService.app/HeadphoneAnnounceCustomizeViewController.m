@interface HeadphoneAnnounceCustomizeViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController)initWithContentView:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation HeadphoneAnnounceCustomizeViewController

- (_TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  return (_TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController *)sub_100070050(a3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(HeadphoneAnnounceCustomizeViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  sub_100069410((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController_viewModel]);
  objc_super v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_100071628(a4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
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
  id v12 = sub_100070B40(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = UITableViewAutomaticDimension;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = sub_10007170C(a4);

  return v4;
}

@end