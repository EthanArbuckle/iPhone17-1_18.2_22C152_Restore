@interface IdentityProofingStatePendingViewController
- (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureFonts;
- (void)primaryButtonClicked;
- (void)secondaryButtonClicked;
- (void)tertiaryButtonClicked;
- (void)viewDidLayoutSubviews;
@end

@implementation IdentityProofingStatePendingViewController

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_21F4B5384();
}

- (void)primaryButtonClicked
{
}

- (void)secondaryButtonClicked
{
}

- (void)tertiaryButtonClicked
{
}

- (void)configureFonts
{
  v2 = self;
  sub_21F4B497C();
}

- (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_21F5515A0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController *)sub_21F4B5788(v5, v7, a4);
}

- (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController *)sub_21F4B5910(a3);
}

- (void).cxx_destruct
{
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_primaryButtonClickedAction));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_secondaryButtonClickedAction));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_tertiaryButtonClickedAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___tertiaryButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_imageView);
}

@end