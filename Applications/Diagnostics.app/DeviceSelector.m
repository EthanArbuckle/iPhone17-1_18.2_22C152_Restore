@interface DeviceSelector
- (_TtC11Diagnostics14DeviceSelector)initWithCoder:(id)a3;
- (_TtC11Diagnostics14DeviceSelector)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelConsent;
- (void)viewDidLoad;
@end

@implementation DeviceSelector

- (void)viewDidLoad
{
  v2 = self;
  sub_1000CF8D0();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics14DeviceSelector_deviceCollection);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1000D1514(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)cancelConsent
{
  v2 = self;
  sub_1000D1808();
}

- (_TtC11Diagnostics14DeviceSelector)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11Diagnostics14DeviceSelector *)sub_1000D21B0(v5, v7, a4);
}

- (_TtC11Diagnostics14DeviceSelector)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics14DeviceSelector *)sub_1000D23A4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics14DeviceSelector_devicesTableView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end