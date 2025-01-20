@interface AuthenticateAccountsStartViewController
- (_TtC18SharingViewService39AuthenticateAccountsStartViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AuthenticateAccountsStartViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000A390C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000A3D4C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000A3F0C(a3);
}

- (_TtC18SharingViewService39AuthenticateAccountsStartViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC18SharingViewService39AuthenticateAccountsStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 104];
  v7[6] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                    + 88];
  v7[7] = v3;
  uint64_t v8 = *(void *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 120];
  long long v4 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 40];
  v7[2] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                    + 24];
  v7[3] = v4;
  long long v5 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 72];
  v7[4] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                    + 56];
  v7[5] = v5;
  long long v6 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 8];
  v7[0] = *(_OWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel];
  v7[1] = v6;
  sub_1000912AC((uint64_t)v7);
  sub_1000181B0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_presenter]);
}

@end