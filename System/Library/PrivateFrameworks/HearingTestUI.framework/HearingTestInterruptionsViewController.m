@interface HearingTestInterruptionsViewController
- (_TtC13HearingTestUI38HearingTestInterruptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13HearingTestUI38HearingTestInterruptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueButtonTapped:(id)a3;
- (void)didTapDone;
- (void)didTapEndTest;
- (void)startOverButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HearingTestInterruptionsViewController

- (_TtC13HearingTestUI38HearingTestInterruptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  sub_2513AF814();
}

- (void)continueButtonTapped:(id)a3
{
}

- (void)startOverButtonTapped:(id)a3
{
}

- (void)didTapEndTest
{
}

- (void)didTapDone
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2513AEF38();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  sub_2513AF3EC();
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for HearingTestInterruptionsViewController();
  v13.receiver = self;
  v13.super_class = v8;
  v9 = self;
  [(OBBaseWelcomeController *)&v13 viewDidAppear:v3];
  sub_2514437D0();
  uint64_t v10 = sub_2514437E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  uint64_t v11 = (uint64_t)v9 + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController_interruptionStartTime;
  swift_beginAccess();
  sub_2513ADD3C((uint64_t)v7, v11);
  swift_endAccess();
}

- (_TtC13HearingTestUI38HearingTestInterruptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13HearingTestUI38HearingTestInterruptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2513AF804(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController_continueButtonHandler));
  sub_2513AF804(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController_startOverButtonHandler));
  sub_2513AF804(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController_doneButtonHandler));
  sub_2513AF804(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController_endTestButtonHandler));
  swift_bridgeObjectRelease();
  sub_2513AFA58((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController_interruptionStartTime);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController____lazy_storage___continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController____lazy_storage___linkContinueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController____lazy_storage___boldEndTestButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController____lazy_storage___endTestButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController____lazy_storage___startOverButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13HearingTestUI38HearingTestInterruptionsViewController____lazy_storage___doneButton);
}

@end