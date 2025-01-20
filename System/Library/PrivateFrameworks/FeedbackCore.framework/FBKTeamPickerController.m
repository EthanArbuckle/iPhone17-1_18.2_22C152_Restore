@interface FBKTeamPickerController
- (BOOL)showsDismissButton;
- (FBKBugFormStub)formStub;
- (FBKTeam)selectedTeam;
- (NSArray)teams;
- (_TtC12FeedbackCore23FBKTeamPickerController)initWithCoder:(id)a3;
- (_TtC12FeedbackCore23FBKTeamPickerController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12FeedbackCore23FBKTeamPickerController)initWithStyle:(int64_t)a3;
- (_TtP12FeedbackCore21FBKTeamPickerDelegate_)pickerDelegate;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
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

@implementation FBKTeamPickerController

- (FBKBugFormStub)formStub
{
  return (FBKBugFormStub *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_formStub);
}

- (void)setFormStub:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_formStub);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_22A497F84();
}

- (NSArray)teams
{
  swift_beginAccess();
  sub_22A40F5A0(0, &qword_268377390);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setTeams:(id)a3
{
  sub_22A40F5A0(0, &qword_268377390);
  uint64_t v4 = sub_22A4B3628();
  v5 = self;
  sub_22A496824(v4);
}

- (FBKTeam)selectedTeam
{
  return (FBKTeam *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_selectedTeam);
}

- (void)setSelectedTeam:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_selectedTeam);
  swift_beginAccess();
  v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (BOOL)showsDismissButton
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_showsDismissButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDismissButton:(BOOL)a3
{
  uint64_t v4 = self;
  sub_22A496D8C(a3);
}

- (_TtP12FeedbackCore21FBKTeamPickerDelegate_)pickerDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_pickerDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x22A6CA870](v2);

  return (_TtP12FeedbackCore21FBKTeamPickerDelegate_ *)v3;
}

- (void)setPickerDelegate:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22A497190();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for FBKTeamPickerController();
  v13.receiver = self;
  v13.super_class = v5;
  id v6 = self;
  [(FBKTeamPickerController *)&v13 viewWillAppear:v3];
  v12.receiver = v6;
  v12.super_class = v5;
  [(FBKTeamPickerController *)&v12 preferredContentSize];
  double v8 = v7;
  v9 = (unint64_t *)((char *)v6 + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_teams);
  swift_beginAccess();
  unint64_t v10 = *v9;
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  -[FBKTeamPickerController setPreferredContentSize:](v6, sel_setPreferredContentSize_, v8, (double)v11 * 70.0 + 15.0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_teams);
  swift_beginAccess();
  unint64_t v6 = *v5;
  if (!(v6 >> 62)) {
    return *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v9 = a3;
  unint64_t v10 = self;
  swift_bridgeObjectRetain();
  int64_t v7 = sub_22A4B3C18();

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

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_22A4B25F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B25B8();
  id v10 = a3;
  uint64_t v11 = self;
  objc_super v12 = (void *)sub_22A4976B0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)dismissSelf
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v6[4] = sub_22A498D5C;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_22A43598C;
  v6[3] = &block_descriptor_12;
  uint64_t v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  [(FBKTeamPickerController *)v5 dismissViewControllerAnimated:1 completion:v4];
  _Block_release(v4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_22A4B25F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B25B8();
  id v10 = a3;
  uint64_t v11 = self;
  sub_22A498724();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC12FeedbackCore23FBKTeamPickerController)initWithStyle:(int64_t)a3
{
  return (_TtC12FeedbackCore23FBKTeamPickerController *)FBKTeamPickerController.init(style:)(a3);
}

- (_TtC12FeedbackCore23FBKTeamPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_22A4B3458();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC12FeedbackCore23FBKTeamPickerController *)FBKTeamPickerController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC12FeedbackCore23FBKTeamPickerController)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore23FBKTeamPickerController *)FBKTeamPickerController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_formStub));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_selectedTeam));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_pickerDelegate;

  sub_22A432A10((uint64_t)v3);
}

@end