@interface OnboardingTileViewController
- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithStyle:(int64_t)a3;
- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithUsingInsetStyling:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)closeButtonTapped;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tapToRadar:(id)a3;
- (void)viewDidLoad;
@end

@implementation OnboardingTileViewController

- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithCoder:(id)a3
{
  result = (_TtC15HealthRecordsUI28OnboardingTileViewController *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C239D638();
}

- (void)closeButtonTapped
{
}

- (void)tapToRadar:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  type metadata accessor for TapToRadarManager();
  static TapToRadarManager.presentTapToRadarDialogue(from:)(self);

  sub_1C224E3A4((uint64_t)v6);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1C239E240();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1C254CD90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  sub_1C254D4D0();
  if (swift_dynamicCastClass())
  {
    id v12 = self;
    id v13 = a3;
    id v14 = a4;
    sub_1C254D4B0();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1C254CD90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  sub_1C254D4D0();
  if (swift_dynamicCastClass())
  {
    id v12 = a3;
    id v13 = a4;
    id v14 = self;
    sub_1C254D4B0();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithUsingInsetStyling:(BOOL)a3
{
  result = (_TtC15HealthRecordsUI28OnboardingTileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15HealthRecordsUI28OnboardingTileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15HealthRecordsUI28OnboardingTileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28OnboardingTileViewController_profile));
  swift_bridgeObjectRelease();
}

@end