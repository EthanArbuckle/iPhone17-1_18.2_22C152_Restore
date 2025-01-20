@interface FBABugFormPickerController
- (FBKBugFormStub)currentSelection;
- (FBKTeam)team;
- (_TtC18Feedback_Assistant26FBABugFormPickerController)init;
- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithStubsPredicate:(id)a3;
- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithStyle:(int64_t)a3;
- (_TtP18Feedback_Assistant24FBABugFormPickerDelegate_)pickerDelegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)context;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dismissPicker;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setCurrentSelection:(id)a3;
- (void)setPickerDelegate:(id)a3;
- (void)setTeam:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FBABugFormPickerController

- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithStyle:(int64_t)a3
{
}

- (_TtC18Feedback_Assistant26FBABugFormPickerController)init
{
}

- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100090DA4();
}

- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithStubsPredicate:(id)a3
{
  return (_TtC18Feedback_Assistant26FBABugFormPickerController *)sub_10008F480((uint64_t)a3);
}

- (int64_t)context
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_context);
}

- (void)setContext:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_context) = (Class)a3;
}

- (FBKBugFormStub)currentSelection
{
  return (FBKBugFormStub *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_currentSelection));
}

- (void)setCurrentSelection:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_currentSelection);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_currentSelection) = (Class)a3;
  id v3 = a3;
}

- (FBKTeam)team
{
  return (FBKTeam *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_team));
}

- (void)setTeam:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_team);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_team) = (Class)a3;
  id v3 = a3;
}

- (_TtP18Feedback_Assistant24FBABugFormPickerDelegate_)pickerDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP18Feedback_Assistant24FBABugFormPickerDelegate_ *)Strong;
}

- (void)setPickerDelegate:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10008F724();
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_100090E78();
  uint64_t v8 = v7;

  if (v8)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_100090FA0(v9, a5);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = *(void *)(self + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_formStubs);
  if (v4)
  {
    if (v4 >> 62)
    {
      id v5 = (void *)self;
      id v6 = a3;
      id v7 = v5;
      swift_bridgeObjectRetain();
      int64_t v8 = _CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease();
      return v8;
    }
    else
    {
      return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10008FBE0(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
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
  sub_1000910AC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  unint64_t v4 = self;
  sub_100090048(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  unint64_t v4 = self;
  sub_100090454(a3);
}

- (void)dismissPicker
{
  v2 = self;
  sub_1000905BC();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    if ([Strong respondsToSelector:"bugFormPickerDidCancel:"])
    {
      id v7 = a3;
      uint64_t v8 = self;
      [v6 bugFormPickerDidCancel:v8];
    }
    swift_unknownObjectRelease();
  }
}

- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18Feedback_Assistant26FBABugFormPickerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_stubsPredicate));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_currentSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_team));
  sub_100056D7C((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_pickerDelegate);
  id v3 = (char *)self + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_formsRefreshObserver;

  sub_100055344((uint64_t)v3);
}

@end