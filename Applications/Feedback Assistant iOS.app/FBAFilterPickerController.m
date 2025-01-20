@interface FBAFilterPickerController
- (_TtC18Feedback_Assistant16FBAFilterManager)filterManager;
- (_TtC18Feedback_Assistant25FBAFilterPickerController)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant25FBAFilterPickerController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18Feedback_Assistant25FBAFilterPickerController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dismissSelf;
- (void)setFilterManager:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation FBAFilterPickerController

- (_TtC18Feedback_Assistant16FBAFilterManager)filterManager
{
  return (_TtC18Feedback_Assistant16FBAFilterManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                               + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager));
}

- (void)setFilterManager:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = (Class)a3;
  id v5 = a3;
  v6 = self;

  id v7 = [(FBAFilterPickerController *)v6 tableView];
  if (v7)
  {
    id v8 = v7;
    [v7 reloadData];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100059A68();
}

- (void)dismissSelf
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager);
  if (!v3) {
    return 0;
  }
  unint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterGroups);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  id v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  unint64_t v8 = sub_10005A500(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100059DBC(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10005A60C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_10005A780(a4);
  uint64_t v9 = v8;

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (_TtC18Feedback_Assistant25FBAFilterPickerController)initWithStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAFilterPickerController();
  return [(FBAFilterPickerController *)&v5 initWithStyle:a3];
}

- (_TtC18Feedback_Assistant25FBAFilterPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBAFilterPickerController();
  uint64_t v9 = [(FBAFilterPickerController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18Feedback_Assistant25FBAFilterPickerController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAFilterPickerController();
  return [(FBAFilterPickerController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager));
}

@end