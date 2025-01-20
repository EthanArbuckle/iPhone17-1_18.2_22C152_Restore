@interface FBATeamPickerController
- (BOOL)showsDismissButton;
- (FBKBugFormStub)formStub;
- (FBKTeam)selectedTeam;
- (NSArray)teams;
- (_TtC18Feedback_Assistant23FBATeamPickerController)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant23FBATeamPickerController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18Feedback_Assistant23FBATeamPickerController)initWithStyle:(int64_t)a3;
- (_TtP18Feedback_Assistant21FBATeamPickerDelegate_)pickerDelegate;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:viewForHeaderInSection:;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dismissSelf;
- (void)setFormStub:(id)a3;
- (void)setPickerDelegate:(id)a3;
- (void)setSelectedTeam:(id)a3;
- (void)setShowsDismissButton:(BOOL)a3;
- (void)setTeams:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBATeamPickerController

- (FBKBugFormStub)formStub
{
  return (FBKBugFormStub *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_formStub));
}

- (void)setFormStub:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_formStub);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_formStub) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_1000564BC();
}

- (NSArray)teams
{
  sub_100056B94(0, &qword_100122610);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setTeams:(id)a3
{
  sub_100056B94(0, &qword_100122610);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_10005551C(v4);
}

- (FBKTeam)selectedTeam
{
  return (FBKTeam *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_selectedTeam));
}

- (void)setSelectedTeam:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_selectedTeam);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_selectedTeam) = (Class)a3;
  id v3 = a3;
}

- (BOOL)showsDismissButton
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_showsDismissButton);
}

- (void)setShowsDismissButton:(BOOL)a3
{
  id v4 = self;
  sub_1000556E4(a3);
}

- (_TtP18Feedback_Assistant21FBATeamPickerDelegate_)pickerDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP18Feedback_Assistant21FBATeamPickerDelegate_ *)Strong;
}

- (void)setPickerDelegate:(id)a3
{
}

- (void)viewDidLoad
{
  NSArray v2 = self;
  sub_1000557FC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for FBATeamPickerController();
  v12.receiver = self;
  v12.super_class = v5;
  id v6 = self;
  [(FBATeamPickerController *)&v12 viewWillAppear:v3];
  v11.receiver = v6;
  v11.super_class = v5;
  [(FBATeamPickerController *)&v11 preferredContentSize];
  double v8 = v7;
  unint64_t v9 = *(unint64_t *)((char *)&v6->super.super.super.super.isa
                           + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_teams);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  -[FBATeamPickerController setPreferredContentSize:](v6, "setPreferredContentSize:", v8, (double)v10 * 70.0 + 15.0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_teams);
  if (!(v3 >> 62)) {
    return *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v6 = a3;
  double v7 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:viewForHeaderInSection:
{
  id v0 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];

  return v0;
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

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  objc_super v11 = self;
  objc_super v12 = (void *)sub_100055B34(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)dismissSelf
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v6[4] = sub_100056CF8;
  v6[5] = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_1000992C4;
  v6[3] = &unk_1000F46D8;
  id v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  [(FBATeamPickerController *)v5 dismissViewControllerAnimated:1 completion:v4];
  _Block_release(v4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  objc_super v11 = self;
  sub_100056BD0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18Feedback_Assistant23FBATeamPickerController)initWithStyle:(int64_t)a3
{
  return (_TtC18Feedback_Assistant23FBATeamPickerController *)sub_100056728(a3);
}

- (_TtC18Feedback_Assistant23FBATeamPickerController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18Feedback_Assistant23FBATeamPickerController *)sub_100056808(v5, v7, a4);
}

- (_TtC18Feedback_Assistant23FBATeamPickerController)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant23FBATeamPickerController *)sub_100056968(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_formStub));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_selectedTeam));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_pickerDelegate;

  sub_100056D7C((uint64_t)v3);
}

@end