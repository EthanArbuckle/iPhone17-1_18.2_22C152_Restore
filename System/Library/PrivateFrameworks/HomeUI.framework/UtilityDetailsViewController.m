@interface UtilityDetailsViewController
- (_TtC6HomeUI28UtilityDetailsViewController)initWithCoder:(id)a3;
- (_TtC6HomeUI28UtilityDetailsViewController)initWithHome:(id)a3 details:(id)a4;
- (_TtC6HomeUI28UtilityDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation UtilityDetailsViewController

- (_TtC6HomeUI28UtilityDetailsViewController)initWithHome:(id)a3 details:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA114170);
  v6 = (objc_class *)sub_1BE9C4908();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI28UtilityDetailsViewController_home) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI28UtilityDetailsViewController_details) = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for UtilityDetailsViewController();
  id v7 = a3;
  return [(UtilityDetailsViewController *)&v9 initWithNibName:0 bundle:0];
}

- (_TtC6HomeUI28UtilityDetailsViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE3BDC20();
}

- (_TtC6HomeUI28UtilityDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6HomeUI28UtilityDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end