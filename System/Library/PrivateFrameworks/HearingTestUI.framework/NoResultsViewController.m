@interface NoResultsViewController
- (_TtC13HearingTestUI23NoResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13HearingTestUI23NoResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapEnd;
- (void)didTapRestart;
- (void)viewDidLoad;
@end

@implementation NoResultsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2513C2758();
}

- (void)didTapRestart
{
  uint64_t v3 = *(void *)(*(char **)((char *)&self->super.super.super.super.super.isa
                            + OBJC_IVAR____TtC13HearingTestUI23NoResultsViewController_flowManager)
                 + OBJC_IVAR____TtC13HearingTestUI22HearingTestFlowManager_analyticsManager
                 + 8);
  uint64_t ObjectType = swift_getObjectType();
  char v7 = 5;
  v5 = *(void (**)(char *, _TtC13HearingTestUI23NoResultsViewController *, _UNKNOWN **, uint64_t, uint64_t))(v3 + 48);
  v6 = self;
  swift_unknownObjectRetain();
  v5(&v7, v6, &protocol witness table for NoResultsViewController, ObjectType, v3);
  swift_unknownObjectRelease();
  sub_25140EC60(1);
}

- (void)didTapEnd
{
  uint64_t v3 = *(void *)(*(char **)((char *)&self->super.super.super.super.super.isa
                            + OBJC_IVAR____TtC13HearingTestUI23NoResultsViewController_flowManager)
                 + OBJC_IVAR____TtC13HearingTestUI22HearingTestFlowManager_analyticsManager
                 + 8);
  uint64_t ObjectType = swift_getObjectType();
  char v7 = 3;
  v5 = *(void (**)(char *, _TtC13HearingTestUI23NoResultsViewController *, _UNKNOWN **, uint64_t, uint64_t))(v3 + 48);
  v6 = self;
  swift_unknownObjectRetain();
  v5(&v7, v6, &protocol witness table for NoResultsViewController, ObjectType, v3);
  swift_unknownObjectRelease();
  sub_25140F0D0();
}

- (_TtC13HearingTestUI23NoResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13HearingTestUI23NoResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingTestUI23NoResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13HearingTestUI23NoResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI23NoResultsViewController_flowManager));
  sub_2513AFA58((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI23NoResultsViewController_stepStartTime);

  swift_bridgeObjectRelease();
}

@end