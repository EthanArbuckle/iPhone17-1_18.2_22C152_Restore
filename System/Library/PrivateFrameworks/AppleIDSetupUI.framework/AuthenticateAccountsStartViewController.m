@interface AuthenticateAccountsStartViewController
- (_TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AuthenticateAccountsStartViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_248348114();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_248348548(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AuthenticateAccountsStartViewController();
  [(AuthenticateAccountsStartViewController *)&v4 viewDidDisappear:v3];
}

- (_TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController)initWithContentView:(id)a3
{
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)((char *)&self->super.super._childModalViewControllers
                 + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[6] = *(_OWORD *)((char *)&self->super.super._nibBundle
                    + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[7] = v2;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super._previousRootViewController
                  + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  long long v3 = *(_OWORD *)((char *)&self->super.super._tab
                 + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[2] = *(_OWORD *)((char *)&self->super.super._view
                    + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[3] = v3;
  long long v4 = *(_OWORD *)((char *)&self->super.super._title
                 + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[4] = *(_OWORD *)((char *)&self->super.super._navigationItem
                    + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[5] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[1] = v5;
  sub_2483494F8((uint64_t)v6);
  swift_release();
  swift_release();
}

@end