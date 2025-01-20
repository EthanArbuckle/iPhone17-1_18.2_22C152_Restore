@interface ActivitySceneContentViewController
- (BOOL)_canShowWhileLocked;
- (_TtC10ChronoCore34ActivitySceneContentViewController)initWithCoder:(id)a3;
- (_TtC10ChronoCore34ActivitySceneContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_timelinesForDateInterval:(id)a3;
- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ActivitySceneContentViewController

- (_TtC10ChronoCore34ActivitySceneContentViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore34ActivitySceneContentViewController__cancellables) = (Class)MEMORY[0x1E4FBC870];
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC10ChronoCore34ActivitySceneContentViewController *)sub_1DAD28728();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DABD2C38();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1DABD2F58((uint8_t *)a3);
}

- (id)_timelinesForDateInterval:(id)a3
{
  uint64_t v4 = sub_1DAD21AF8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAD21AD8();
  v8 = self;
  sub_1DABD37F0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1DA9E142C(0, &qword_1EA8EF880);
  v9 = (void *)sub_1DAD27B28();
  swift_bridgeObjectRelease();

  return v9;
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1DABD3CF4(a3, (uint64_t)sub_1DABD4830, v7);

  swift_release();
}

- (_TtC10ChronoCore34ActivitySceneContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10ChronoCore34ActivitySceneContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore34ActivitySceneContentViewController__logger;
  uint64_t v4 = sub_1DAD23828();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore34ActivitySceneContentViewController__hostingController));

  swift_unknownObjectWeakDestroy();
}

@end