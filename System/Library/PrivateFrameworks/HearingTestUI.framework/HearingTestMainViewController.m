@interface HearingTestMainViewController
+ (id)makeStandardViewControllerWithHealthStore:(id)a3 entryPoint:(int64_t)a4 options:(id)a5 articleProvider:(id)a6 importFlowProvider:(id)a7;
- (_TtC13HearingTestUI29HearingTestMainViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13HearingTestUI29HearingTestMainViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapDebugVFXView;
- (void)didTapImportPriorResult:(id)a3;
- (void)didTapStartTest:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HearingTestMainViewController

- (void)didTapDebugVFXView
{
  v2 = self;
  sub_2513DE0E0();
}

+ (id)makeStandardViewControllerWithHealthStore:(id)a3 entryPoint:(int64_t)a4 options:(id)a5 articleProvider:(id)a6 importFlowProvider:(id)a7
{
  id v10 = a3;
  id v11 = a5;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v12 = sub_2513FB4A0(v10, a4, v11, (uint64_t)a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v12;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HearingTestMainViewController();
  id v2 = v4.receiver;
  [(OBBaseWelcomeController *)&v4 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_headerView, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setAllowFullWidthIcon_, 1);

  sub_2513F98BC();
  sub_2513F73B4();
  sub_2513F7788();
  sub_2513F86B8();
  sub_2513F92B8();
  sub_2513F954C();
  sub_2513F7D38();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HearingTestMainViewController();
  id v4 = v6.receiver;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:v3];
  __int16 v5 = 0;
  sub_2513F5DE0((unsigned __int8 *)&v5 + 1, (char *)&v5);
}

- (void)didTapStartTest:(id)a3
{
}

- (void)didTapImportPriorResult:(id)a3
{
}

- (_TtC13HearingTestUI29HearingTestMainViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13HearingTestUI29HearingTestMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingTestUI29HearingTestMainViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13HearingTestUI29HearingTestMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestMainViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestMainViewController_application));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestMainViewController_options));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI29HearingTestMainViewController_articlePresenter);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestMainViewController_flowManager));
  sub_2513A810C((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI29HearingTestMainViewController_importFlowProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestMainViewController____lazy_storage___startHearingTestButton));

  swift_bridgeObjectRelease();
}

@end