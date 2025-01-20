@interface SelfServiceSessionHistoryViewController
- (_TtC11Diagnostics39SelfServiceSessionHistoryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11Diagnostics39SelfServiceSessionHistoryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation SelfServiceSessionHistoryViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SelfServiceSessionHistoryViewController();
  id v2 = v3.receiver;
  [(SelfServiceSessionHistoryViewController *)&v3 viewDidLoad];
  sub_100049C44();
  sub_100049FE8();
  sub_10004A1B8();
}

- (_TtC11Diagnostics39SelfServiceSessionHistoryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC11Diagnostics39SelfServiceSessionHistoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics39SelfServiceSessionHistoryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC11Diagnostics39SelfServiceSessionHistoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics39SelfServiceSessionHistoryViewController_suiteManager];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = *(void **)(*(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics39SelfServiceSessionHistoryViewController_suiteManager]
                + OBJC_IVAR____TtC11Diagnostics12SuiteManager_deviceState);
  if (!v6)
  {
    id v14 = a3;
    v15 = self;
    unint64_t v11 = (unint64_t)_swiftEmptyArrayStorage;
    if (!((unint64_t)_swiftEmptyArrayStorage >> 62)) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRetain();
    int64_t v12 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  id v7 = a3;
  v8 = self;
  id v9 = [v6 history];
  sub_10003C374(0, &qword_100186210);
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v11 = sub_10004B088(v10);
  if (v11 >> 62) {
    goto LABEL_6;
  }
LABEL_3:
  int64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);

LABEL_4:
  swift_bridgeObjectRelease();

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  unint64_t v11 = self;
  int64_t v12 = sub_10004AA24(v10, v9);

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
  unint64_t v11 = self;
  sub_10004B2A4(v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end