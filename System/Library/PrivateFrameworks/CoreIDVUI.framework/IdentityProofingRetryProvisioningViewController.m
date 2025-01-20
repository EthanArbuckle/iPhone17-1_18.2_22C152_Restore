@interface IdentityProofingRetryProvisioningViewController
- (_TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController)initWithCoder:(id)a3;
- (void)configureFonts;
- (void)tertiaryButtonClicked;
- (void)viewDidLoad;
@end

@implementation IdentityProofingRetryProvisioningViewController

- (_TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController____lazy_storage___tertiaryButton) = 0;
  id v4 = a3;

  result = (_TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController *)sub_21F551B40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4A6FE4();
}

- (void)configureFonts
{
  v2 = self;
  sub_21F4A7A9C();
}

- (void)tertiaryButtonClicked
{
  v2 = self;
  sub_21F4A7C94();
}

- (void).cxx_destruct
{
  swift_release();
  sub_21F4A8308((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController_retryConfig);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController____lazy_storage___tertiaryButton);
}

@end