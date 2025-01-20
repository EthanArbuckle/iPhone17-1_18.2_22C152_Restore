@interface IdentityProofingAddedToWalletViewController
- (_TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureFonts;
- (void)primaryButtonClicked;
- (void)viewDidLoad;
@end

@implementation IdentityProofingAddedToWalletViewController

- (_TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___secondaryLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView) = 0;
  id v4 = a3;

  result = (_TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController *)sub_21F551B40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F52FE90();
}

- (void)configureFonts
{
  v2 = self;
  sub_21F53044C();
}

- (void)primaryButtonClicked
{
  v2 = self;
  sub_21F530714();
}

- (_TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView);
}

@end