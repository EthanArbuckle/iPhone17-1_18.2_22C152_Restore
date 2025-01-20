@interface OcclusionTutorialController
- (_TtC13HearingModeUI27OcclusionTutorialController)initWithCoder:(id)a3;
- (_TtC13HearingModeUI27OcclusionTutorialController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation OcclusionTutorialController

- (_TtC13HearingModeUI27OcclusionTutorialController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2512A3F3C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2512A228C();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_2512C3F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512C3F08();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_2512A3FE4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    id v5 = a3;
    uint64_t v6 = self;
    sub_2512B7824();

    uint64_t v7 = (void *)sub_2512C47C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (_TtC13HearingModeUI27OcclusionTutorialController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13HearingModeUI27OcclusionTutorialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___table));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___learnButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___buttonSpecifier));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewCell));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13HearingModeUI27OcclusionTutorialController____lazy_storage___topViewSpecifier);
}

@end