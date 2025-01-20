@interface IdentityProofingErrorRetryViewController
- (BOOL)inWatchModeOnly;
- (_TtC9CoreIDVUI40IdentityProofingErrorRetryViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI40IdentityProofingErrorRetryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)bodyButtonClicked;
- (void)configureFonts;
- (void)primaryButtonClicked;
- (void)secondaryButtonClicked;
- (void)viewDidLoad;
@end

@implementation IdentityProofingErrorRetryViewController

- (_TtC9CoreIDVUI40IdentityProofingErrorRetryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F4A43B8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4A2BA4();
}

- (BOOL)inWatchModeOnly
{
  return ((*(void **)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_proofingFlowManager))[17] & 3) == 2;
}

- (void)configureFonts
{
  v2 = self;
  sub_21F4A3AF4();
}

- (void)primaryButtonClicked
{
}

- (void)secondaryButtonClicked
{
}

- (void)bodyButtonClicked
{
}

- (_TtC9CoreIDVUI40IdentityProofingErrorRetryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI40IdentityProofingErrorRetryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_viewConfig);
  swift_release();
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_primaryButtonTargetAction));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_secondaryButtonTargetAction));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_bodyButtonTargetAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___bottomTray));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___secondaryButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___bodyButton);
}

@end