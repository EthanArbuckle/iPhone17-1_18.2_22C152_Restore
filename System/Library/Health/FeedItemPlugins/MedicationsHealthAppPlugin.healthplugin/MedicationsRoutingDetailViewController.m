@interface MedicationsRoutingDetailViewController
- (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation MedicationsRoutingDetailViewController

- (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController *)sub_2411616B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicationsRoutingDetailViewController();
  id v2 = v3.receiver;
  [(MedicationsRoutingDetailViewController *)&v3 viewDidLoad];
  sub_24104DCAC();
}

- (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24104F27C((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController_context, (unint64_t *)&qword_268CF0858, (void (*)(uint64_t))sub_24104F090);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController_healthStore));
  objc_super v3 = (char *)self
     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController_pinnedContentManager;

  sub_24101F178((uint64_t)v3);
}

@end