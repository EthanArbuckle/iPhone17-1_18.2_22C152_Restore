@interface IdentityProofingWatchPendingStateExtendedReviewViewController
- (_TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation IdentityProofingWatchPendingStateExtendedReviewViewController

- (_TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController)initWithCoder:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController_issuerURL;
  uint64_t v6 = sub_21F54EBC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController_urlLaunchTask) = 0;
  id v7 = a3;

  result = (_TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController *)sub_21F551B40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4ADDB0();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateExtendedReviewViewController();
  v4 = (char *)v6.receiver;
  [(IdentityProofingWatchPendingStateExtendedReviewViewController *)&v6 viewDidDisappear:v3];
  uint64_t v5 = OBJC_IVAR____TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController_urlLaunchTask;
  if (*(void *)&v4[OBJC_IVAR____TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController_urlLaunchTask])
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE638);
    sub_21F551720();
    swift_release();
  }
  *(void *)&v4[v5] = 0;

  swift_release();
}

- (_TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController_config));
  swift_release();
  sub_21F47F030((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI61IdentityProofingWatchPendingStateExtendedReviewViewController_issuerURL, &qword_267EDE790);

  swift_release();
}

@end