@interface IdentityProofingWatchPendingLivenessStepUpViewController
- (_TtC9CoreIDVUI56IdentityProofingWatchPendingLivenessStepUpViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI56IdentityProofingWatchPendingLivenessStepUpViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation IdentityProofingWatchPendingLivenessStepUpViewController

- (_TtC9CoreIDVUI56IdentityProofingWatchPendingLivenessStepUpViewController)initWithCoder:(id)a3
{
  result = (_TtC9CoreIDVUI56IdentityProofingWatchPendingLivenessStepUpViewController *)sub_21F551B40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingLivenessStepUpViewController();
  id v2 = v3.receiver;
  [(IdentityProofingWatchPendingStateBaseViewController *)&v3 viewDidLoad];
  sub_21F476464();
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_21F4761B0((uint64_t)a3);
}

- (_TtC9CoreIDVUI56IdentityProofingWatchPendingLivenessStepUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI56IdentityProofingWatchPendingLivenessStepUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI56IdentityProofingWatchPendingLivenessStepUpViewController_config));
  swift_release();

  swift_release();
}

@end