@interface HearingTestSetUpViewController
- (_TtC13HearingTestUI30HearingTestSetUpViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC13HearingTestUI30HearingTestSetUpViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC13HearingTestUI30HearingTestSetUpViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC13HearingTestUI30HearingTestSetUpViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelButtonTapped:(id)a3;
- (void)continueButtonTapped:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HearingTestSetUpViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2513A9F5C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2513AA6CC(a3);
}

- (void)continueButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_251445230();
  swift_unknownObjectRelease();
  sub_2513AB060();
  v5 = *(Class *)((char *)&v4->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC13HearingTestUI30HearingTestSetUpViewController_flowManager);
  unsigned __int8 v7 = *((unsigned char *)&v4->super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC13HearingTestUI30HearingTestSetUpViewController_currentStep);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_251413A14(v4, &v7, v5, v6);

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_251445230();
  swift_unknownObjectRelease();
  uint64_t v5 = *(void *)(*(char **)((char *)&v4->super.super.super.super.super.super.isa
                            + OBJC_IVAR____TtC13HearingTestUI30HearingTestSetUpViewController_flowManager)
                 + OBJC_IVAR____TtC13HearingTestUI22HearingTestFlowManager_analyticsManager
                 + 8);
  uint64_t ObjectType = swift_getObjectType();
  char v8 = 4;
  unsigned __int8 v7 = *(void (**)(char *, _TtC13HearingTestUI30HearingTestSetUpViewController *, _UNKNOWN **, uint64_t, uint64_t))(v5 + 48);
  swift_unknownObjectRetain();
  v7(&v8, v4, &off_270236D38, ObjectType, v5);
  swift_unknownObjectRelease();
  sub_25140F0D0();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (_TtC13HearingTestUI30HearingTestSetUpViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC13HearingTestUI30HearingTestSetUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingTestUI30HearingTestSetUpViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC13HearingTestUI30HearingTestSetUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingTestUI30HearingTestSetUpViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC13HearingTestUI30HearingTestSetUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingTestUI30HearingTestSetUpViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC13HearingTestUI30HearingTestSetUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI30HearingTestSetUpViewController_flowManager));
  sub_2513A8E7C((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI30HearingTestSetUpViewController_stepStartTime, (uint64_t)&qword_26B21D4A0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_2513ACCE8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI30HearingTestSetUpViewController____lazy_storage___continueButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC13HearingTestUI30HearingTestSetUpViewController____lazy_storage___cancelButton);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  unint64_t v6 = sub_2513A94D0();
  if (v6 >> 62) {
    int64_t v7 = sub_251445430();
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
  int64_t result = sub_2513A94D0();
  if ((result & 0xC000000000000001) != 0)
  {
    uint64_t v9 = MEMORY[0x25339EE20](a4, result);
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
    uint64_t v10 = *(void *)(v9 + 32);
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
  uint64_t v6 = sub_251443910();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2514438D0();
  id v10 = a3;
  int64_t v11 = self;
  v12 = (void *)sub_2513AB590(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_2513AB8D0(v6, a4);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_251443910();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2514438D0();
  id v10 = a3;
  int64_t v11 = self;
  sub_2513ABD08(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end