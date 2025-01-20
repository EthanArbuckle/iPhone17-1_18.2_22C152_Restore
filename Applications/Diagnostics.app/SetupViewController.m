@interface SetupViewController
- (_TtC11Diagnostics19SetupViewController)init;
- (_TtC11Diagnostics19SetupViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics19SetupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)applicationDidResume;
- (void)applicationWillSuspend;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SetupViewController

- (_TtC11Diagnostics19SetupViewController)init
{
  return (_TtC11Diagnostics19SetupViewController *)sub_100034834();
}

- (_TtC11Diagnostics19SetupViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10003A8D0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100034D58(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100035164(a3);
}

- (void)applicationWillSuspend
{
  v2 = self;
  sub_1000386F8();
}

- (void)applicationDidResume
{
  v2 = self;
  sub_1000387B8();
}

- (_TtC11Diagnostics19SetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11Diagnostics19SetupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController_loadingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController_termsAndConditionsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController____lazy_storage___noSessionNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController____lazy_storage___storageFullscreenAlertViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController____lazy_storage___diagnosticsCompletedNavigationController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController_currentViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics19SetupViewController_retryTimer);
}

@end