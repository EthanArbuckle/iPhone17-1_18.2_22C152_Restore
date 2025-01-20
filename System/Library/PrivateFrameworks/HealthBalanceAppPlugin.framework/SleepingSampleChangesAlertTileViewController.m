@interface SleepingSampleChangesAlertTileViewController
- (NSString)title;
- (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController)initWithCoder:(id)a3;
- (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation SleepingSampleChangesAlertTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_250E437A0();
}

- (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_250E7ABA8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController *)SleepingSampleChangesAlertTileViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController)initWithCoder:(id)a3
{
  return (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController *)SleepingSampleChangesAlertTileViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint));
  swift_release();
  sub_250E48DF0((uint64_t)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel, (uint64_t)&qword_269B0C7C8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_250E47F5C);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph));
  sub_250E47ED4((uint64_t)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
}

- (NSString)title
{
  uint64_t v3 = sub_250E79958();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_250E7AB68();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = self;
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();

  id v8 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

@end