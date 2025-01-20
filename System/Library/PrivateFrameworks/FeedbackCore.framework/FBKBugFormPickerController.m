@interface FBKBugFormPickerController
- (FBKBugFormStub)currentSelection;
- (FBKTeam)team;
- (_TtC12FeedbackCore26FBKBugFormPickerController)init;
- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithCoder:(id)a3;
- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithStubsPredicate:(id)a3;
- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithStyle:(int64_t)a3;
- (_TtP12FeedbackCore24FBKBugFormPickerDelegate_)pickerDelegate;
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

@implementation FBKBugFormPickerController

- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithStyle:(int64_t)a3
{
}

- (_TtC12FeedbackCore26FBKBugFormPickerController)init
{
}

- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22A490FF8();
}

- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithStubsPredicate:(id)a3
{
  return (_TtC12FeedbackCore26FBKBugFormPickerController *)FBKBugFormPickerController.init(stubsPredicate:)((uint64_t)a3);
}

- (int64_t)context
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_context);
  swift_beginAccess();
  return *v2;
}

- (void)setContext:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_context);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (FBKBugFormStub)currentSelection
{
  return (FBKBugFormStub *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_currentSelection);
}

- (void)setCurrentSelection:(id)a3
{
}

- (FBKTeam)team
{
  return (FBKTeam *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_team);
}

- (void)setTeam:(id)a3
{
}

- (_TtP12FeedbackCore24FBKBugFormPickerDelegate_)pickerDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_pickerDelegate;
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x22A6CA870](v2);

  return (_TtP12FeedbackCore24FBKBugFormPickerDelegate_ *)v3;
}

- (void)setPickerDelegate:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22A48F824();
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_22A4910CC();
  uint64_t v8 = v7;

  if (v8)
  {
    v9 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_22A49120C(v9, a5);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = *(void *)(self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_formStubs);
  if (v4)
  {
    if (v4 >> 62)
    {
      id v5 = (void *)self;
      id v6 = a3;
      id v7 = v5;
      swift_bridgeObjectRetain();
      int64_t v8 = sub_22A4B3C18();

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
  uint64_t v6 = sub_22A4B25F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B25B8();
  id v10 = a3;
  v11 = self;
  sub_22A48FD9C(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_22A4B25F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B25B8();
  id v10 = a3;
  v11 = self;
  sub_22A491318();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  unint64_t v4 = self;
  sub_22A490588(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  unint64_t v4 = self;
  sub_22A490AB0(a3);
}

- (void)dismissPicker
{
  v2 = self;
  sub_22A490C18();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_pickerDelegate;
  swift_beginAccess();
  uint64_t v6 = (void *)MEMORY[0x22A6CA870](v5);
  if (v6)
  {
    uint64_t v7 = v6;
    if (objc_msgSend(v6, sel_respondsToSelector_, sel_bugFormPickerDidCancel_))
    {
      id v8 = a3;
      id v9 = self;
      objc_msgSend(v7, sel_bugFormPickerDidCancel_, v9);
    }
    swift_unknownObjectRelease();
  }
}

- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12FeedbackCore26FBKBugFormPickerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_stubsPredicate));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_currentSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_team));
  sub_22A432A10((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_pickerDelegate);
  id v3 = (char *)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_formsRefreshObserver;

  sub_22A40A904((uint64_t)v3);
}

@end