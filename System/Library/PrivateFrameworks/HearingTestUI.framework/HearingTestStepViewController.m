@interface HearingTestStepViewController
- (_TtC13HearingTestUI29HearingTestStepViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13HearingTestUI29HearingTestStepViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (uint64_t)continueButtonTapped:(void *)a1;
- (void)cancelButtonTapped:(id)a3;
- (void)takeTestAgainButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HearingTestStepViewController

- (_TtC13HearingTestUI29HearingTestStepViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  sub_2513EB148();
}

- (uint64_t)continueButtonTapped:(void *)a1
{
  swift_unknownObjectRetain();
  v2 = a1;
  sub_251445230();
  swift_unknownObjectRelease();
  v3 = *(void **)&v2[OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController_flowManager];
  unsigned __int8 v7 = v2[OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController_step];
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v5 = v3;
  sub_251413F00(v2, &v7, v5, v4);

  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)takeTestAgainButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_251445230();
  swift_unknownObjectRelease();
  id v5 = objc_retain(*(id *)((char *)&v4->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController_flowManager));
  sub_25140EC60(1);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_251445230();
  swift_unknownObjectRelease();
  sub_2513E9BCC();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_2513E9F64(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HearingTestStepViewController();
  uint64_t v4 = (char *)v8.receiver;
  [(HearingTestStepViewController *)&v8 viewWillDisappear:v3];
  uint64_t v5 = *(char **)&v4[OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController_flowManager];
  uint64_t v6 = *__swift_project_boxed_opaque_existential_1(&v5[OBJC_IVAR____TtC13HearingTestUI22HearingTestFlowManager_interruptionViewControllerManager], *(void *)&v5[OBJC_IVAR____TtC13HearingTestUI22HearingTestFlowManager_interruptionViewControllerManager + 24]);
  unsigned __int8 v7 = v5;
  sub_2513EAC60(v4, v6);
}

- (_TtC13HearingTestUI29HearingTestStepViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13HearingTestUI29HearingTestStepViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController_flowManager));
  sub_2513AFA58((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController_stepStartTime);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController____lazy_storage___continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController____lazy_storage___takeTestAgainButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController____lazy_storage___doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController____lazy_storage___cancelButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13HearingTestUI29HearingTestStepViewController____lazy_storage___doneBarButton);
}

@end