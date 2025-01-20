@interface HearingTestPreEvaluationCoachingViewController
- (void)cleanUp;
- (void)continueButtonTapped:(id)a3;
- (void)didTapPlaySample;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HearingTestPreEvaluationCoachingViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HearingTestPreEvaluationCoachingViewController();
  id v2 = v3.receiver;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  sub_2513EBB44();
  sub_2513EBDCC();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HearingTestPreEvaluationCoachingViewController();
  id v4 = v5.receiver;
  [(HearingTestStepViewController *)&v5 viewDidAppear:v3];
  sub_251443E90();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HearingTestPreEvaluationCoachingViewController();
  id v4 = v5.receiver;
  [(HearingTestPreEvaluationCoachingViewController *)&v5 viewDidDisappear:v3];
  sub_251443E80();
  if (v4[OBJC_IVAR____TtC13HearingTestUI46HearingTestPreEvaluationCoachingViewController_supportsSampleTone] == 1) {
    sub_2513ED1D0();
  }
}

- (void)cleanUp
{
  id v2 = self;
  sub_2513EC464();
}

- (void)continueButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_251445230();
  swift_unknownObjectRelease();
  sub_2513EC770();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)didTapPlaySample
{
  id v2 = self;
  sub_2513EC88C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC13HearingTestUI46HearingTestPreEvaluationCoachingViewController_symbolEffect;
  uint64_t v4 = sub_251444950();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI46HearingTestPreEvaluationCoachingViewController_playToneImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI46HearingTestPreEvaluationCoachingViewController_animationView));

  swift_unknownObjectWeakDestroy();
}

@end