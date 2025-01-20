@interface SleepingSampleHelpTileViewController
- (_TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController)initWithCoder:(id)a3;
- (_TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation SleepingSampleHelpTileViewController

- (void)loadView
{
  v2 = self;
  id v3 = sub_250E6F058();
  [(SleepingSampleHelpTileViewController *)v2 setView:v3];
}

- (_TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_250E7ABA8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration;
  uint64_t v10 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView) = 0;
  id v11 = a4;
  if (v7)
  {
    v12 = (void *)sub_250E7AB78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  v13 = [(SleepingSampleHelpTileViewController *)&v15 initWithNibName:v12 bundle:a4];

  return v13;
}

- (_TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration;
  uint64_t v7 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  return [(SleepingSampleHelpTileViewController *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_250E7376C((uint64_t)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context, &qword_269B0C778, (void (*)(uint64_t))sub_250E6EA4C);
  sub_250E7376C((uint64_t)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration, &qword_269B0CEE0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView);
}

@end