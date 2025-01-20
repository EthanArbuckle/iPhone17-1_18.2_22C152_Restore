@interface _FBAActionSheetController
- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithStyle:(int64_t)a3;
- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addAction:(id)a3;
- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5;
- (void)dismissSelf;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _FBAActionSheetController

- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC18Feedback_Assistant25_FBAActionSheetController *)sub_100078528((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100078274);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000785E0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100079CC8();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1000787BC(a3);
}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
}

- (void)addAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100078D90(v4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_actions);
  swift_beginAccess();
  unint64_t v6 = *v5;
  if (!(v6 >> 62)) {
    return *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  int64_t v7 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 5.0;
  if (!a4) {
    return 15.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 5.0;
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
  sub_100079E14();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
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
  uint64_t v12 = (void *)sub_100079144(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)dismissSelf
{
}

- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_actions) = (Class)_swiftEmptyArrayStorage;
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerTitle);
  *id v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerSubtitle);
  void *v5 = 0;
  v5[1] = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_dismissesOnAction) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _FBAActionSheetController();
  return [(_FBAActionSheetController *)&v7 initWithStyle:a3];
}

- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18Feedback_Assistant25_FBAActionSheetController *)sub_1000795D8(v5, v7, a4);
}

- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_actions) = (Class)_swiftEmptyArrayStorage;
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerTitle);
  *id v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerSubtitle);
  void *v5 = 0;
  v5[1] = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_dismissesOnAction) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _FBAActionSheetController();
  return [(_FBAActionSheetController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end