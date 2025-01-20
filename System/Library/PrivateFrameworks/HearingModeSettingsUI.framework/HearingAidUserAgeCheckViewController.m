@interface HearingAidUserAgeCheckViewController
- (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtP21HearingModeSettingsUI26HearingAidAgeCheckDelegate_)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelButtonTapped:(id)a3;
- (void)continueButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HearingAidUserAgeCheckViewController

- (_TtP21HearingModeSettingsUI26HearingAidAgeCheckDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x25339A050](v2);
  return (_TtP21HearingModeSettingsUI26HearingAidAgeCheckDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_251245884();
}

- (void)continueButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_25126C7A8();
  swift_unknownObjectRelease();
  id v5 = [(HearingAidUserAgeCheckViewController *)v4 navigationController];
  if (v5)
  {
    v6 = v5;
    v7 = (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController *)objc_msgSend(objc_allocWithZone((Class)HMHearingAidAudiogramViewController), sel_init);
    objc_msgSend(v6, sel_pushViewController_animated_, v7, 1);

    v4 = v7;
  }

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v8);
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_25126C7A8();
  uint64_t v5 = swift_unknownObjectRelease();
  v6 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v4->super.super.super.super.super.super.super.super.isa)
                                                  + 0x90))(v5);
  if (v6)
  {
    objc_msgSend(v6, sel_dismissHearingAidEnrollment);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v7);
}

- (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_2512470BC((uint64_t)self + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingAidUserAgeCheckViewController____lazy_storage___cancelButton));
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  unint64_t v6 = sub_251243F98();
  if (v6 >> 62) {
    int64_t v7 = sub_25126C8C8();
  }
  else {
    int64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = self;
  int64_t result = sub_251243F98();
  if ((result & 0xC000000000000001) != 0)
  {
    uint64_t v9 = MEMORY[0x253399500](a4, result);
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
  {
    uint64_t v9 = *(void *)(result + 8 * a4 + 32);
    swift_retain();
LABEL_5:
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v9 + 48);
    swift_bridgeObjectRetain();
    swift_release();
    int64_t v11 = *(void *)(v10 + 16);

    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_25126BBB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BB88();
  id v11 = a3;
  v12 = self;
  unint64_t v13 = sub_25126BBA8();
  id result = (id)sub_251243F98();
  if (((unint64_t)result & 0xC000000000000001) == 0)
  {
    if ((v13 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v13 < *(void *)(((unint64_t)result & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      v15 = (void *)*((void *)result + v13 + 4);
      swift_retain();
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_13;
  }
  v15 = (void *)MEMORY[0x253399500](v13, result);
LABEL_5:
  swift_bridgeObjectRelease();
  uint64_t v16 = v15[6];
  id result = (id)sub_25126BB98();
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if ((unint64_t)result >= *(void *)(v16 + 16))
  {
LABEL_14:
    __break(1u);
    return result;
  }
  v17 = (void *)(*(uint64_t (**)(void))(*v15 + 184))(*((unsigned __int8 *)result + v16 + 32));

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v17;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v6 = (UITableView *)a3;
  uint64_t v7 = self;
  HearingAidUserAgeCheckViewController.tableView(_:viewForHeaderInSection:)(v8, v6, a4);
  uint64_t v10 = v9;

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_25126BBB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BB88();
  id v11 = a3;
  v12 = self;
  unint64_t v13 = sub_25126BBA8();
  uint64_t v14 = sub_251243F98();
  if ((v14 & 0xC000000000000001) == 0)
  {
    if ((v13 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v13 < *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      v15 = *(void **)(v14 + 8 * v13 + 32);
      swift_retain();
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_11;
  }
  v15 = (void *)MEMORY[0x253399500](v13, v14);
LABEL_5:
  swift_bridgeObjectRelease();
  uint64_t v16 = v15[6];
  unint64_t v17 = sub_25126BB98();
  if ((v17 & 0x8000000000000000) != 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v17 < *(void *)(v16 + 16))
  {
    (*(void (**)(void))(*v15 + 200))(*(unsigned __int8 *)(v16 + v17 + 32));

    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    return;
  }
LABEL_12:
  __break(1u);
}

@end