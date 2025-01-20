@interface ClimateAppViewController
- (_TtC7Climate24ClimateAppViewController)init;
- (_TtC7Climate24ClimateAppViewController)initWithCoder:(id)a3;
- (_TtC7Climate24ClimateAppViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)updateSettingsButtonForLimitUIChanged;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ClimateAppViewController

- (_TtC7Climate24ClimateAppViewController)init
{
  return (_TtC7Climate24ClimateAppViewController *)sub_100069A78();
}

- (_TtC7Climate24ClimateAppViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000719D0();
}

- (_TtC7Climate24ClimateAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Climate24ClimateAppViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController_coordinator));
  sub_100071F20((uint64_t)self + OBJC_IVAR____TtC7Climate24ClimateAppViewController_climateSystem, (uint64_t (*)(void))type metadata accessor for ClimateSystemManager);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController____lazy_storage___zoneCard));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateAppViewController_autoSettingsObserver));
  sub_100015120(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7Climate24ClimateAppViewController_settingsCache));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Climate24ClimateAppViewController____lazy_storage___systemControls);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10006B284();
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClimateAppViewController();
  id v2 = v4.receiver;
  [(ClimateAppViewController *)&v4 viewDidLayoutSubviews];
  id v3 = sub_100068DE0();
  sub_1000513E0();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClimateAppViewController();
  id v4 = v7.receiver;
  [(ClimateAppViewController *)&v7 viewWillAppear:v3];
  id v5 = [v4 navigationController];
  if (v5)
  {
    id v6 = v5;
    [v5 setNavigationBarHidden:1];

    id v4 = v6;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_10006D334(a3);
}

- (void)updateSettingsButtonForLimitUIChanged
{
  id v2 = self;
  sub_10006DA74();
}

@end