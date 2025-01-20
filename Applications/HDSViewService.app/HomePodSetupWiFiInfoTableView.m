@interface HomePodSetupWiFiInfoTableView
- (_TtC14HDSViewService29HomePodSetupWiFiInfoTableView)initWithCoder:(id)a3;
- (_TtC14HDSViewService29HomePodSetupWiFiInfoTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
@end

@implementation HomePodSetupWiFiInfoTableView

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService29HomePodSetupWiFiInfoTableView_elements))[2];
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
  v12 = (void *)sub_100095F58(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC14HDSViewService29HomePodSetupWiFiInfoTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC14HDSViewService29HomePodSetupWiFiInfoTableView_elements) = (Class)_swiftEmptyArrayStorage;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HomePodSetupWiFiInfoTableView();
  return -[HomePodSetupWiFiInfoTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC14HDSViewService29HomePodSetupWiFiInfoTableView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC14HDSViewService29HomePodSetupWiFiInfoTableView_elements) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupWiFiInfoTableView();
  return [(HomePodSetupWiFiInfoTableView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end