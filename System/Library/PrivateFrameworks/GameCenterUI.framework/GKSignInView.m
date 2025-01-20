@interface GKSignInView
- (GKSignInView)initWithCoder:(id)a3;
- (GKSignInView)initWithSignInAction:(id)a3;
- (double)contentTopMargin;
- (void)disablePrimaryButton;
- (void)enablePrimaryButton;
- (void)primaryAction;
- (void)setupHorizontalLayout;
- (void)setupVerticalLayout;
@end

@implementation GKSignInView

- (double)contentTopMargin
{
  v2 = self;
  double v3 = sub_1AF48BB68();

  return v3;
}

- (GKSignInView)initWithSignInAction:(id)a3
{
  double v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (GKSignInView *)SignInView.init(signInAction:)((uint64_t)sub_1AF388384, v4);
}

- (GKSignInView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF72F474();
}

- (void)disablePrimaryButton
{
  v2 = self;
  SignInView.disablePrimaryButton()();
}

- (void)enablePrimaryButton
{
  v2 = self;
  SignInView.enablePrimaryButton()();
}

- (void)primaryAction
{
  v2 = self;
  sub_1AF72F5F8();
}

- (void)setupVerticalLayout
{
  v2 = self;
  sub_1AF72F674();
}

- (void)setupHorizontalLayout
{
  v2 = self;
  sub_1AF72F800();
}

- (void).cxx_destruct
{
  swift_release();

  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___GKSignInView____lazy_storage___artworkHeight);
}

@end