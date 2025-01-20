@interface AccountStatusUpgradeSummaryTileFeedItemViewController
- (NSString)title;
- (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController)initWithCoder:(id)a3;
- (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AccountStatusUpgradeSummaryTileFeedItemViewController

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountStatusUpgradeSummaryTileFeedItemViewController(0);
  id v4 = v6.receiver;
  [(AccountStatusUpgradeSummaryTileFeedItemViewController *)&v6 viewDidAppear:v3];
  sub_2409529A8();
  v5 = (void *)sub_240952998();
  sub_2409470D8();
  sub_240952978();
}

- (NSString)title
{
  uint64_t v3 = sub_240952B98();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  objc_super v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x263F07690];
  sub_24094D194(0, &qword_26AFCC6A8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v15 - v9;
  uint64_t v11 = sub_240951AB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = self;
  sub_240952B88();
  sub_2409535A8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_24094D8DC((uint64_t)v10, &qword_26AFCC6A8, v7);

  v13 = (void *)sub_240954788();
  swift_bridgeObjectRelease();

  return (NSString *)v13;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_240949774();
}

- (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2409547C8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController *)sub_24094BB44(v5, v7, a4);
}

- (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController)initWithCoder:(id)a3
{
  return (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController *)sub_24094BD04(a3);
}

- (void).cxx_destruct
{
  sub_24094D8DC((uint64_t)self + OBJC_IVAR____TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController_accountData, &qword_268C90C88, MEMORY[0x263F461A8]);
  sub_24094D370((uint64_t)self + OBJC_IVAR____TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController_context, (uint64_t (*)(void))sub_24089D370);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController_tileView);
}

@end