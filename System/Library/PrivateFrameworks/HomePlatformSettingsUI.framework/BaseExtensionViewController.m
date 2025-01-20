@interface BaseExtensionViewController
- (_TtC22HomePlatformSettingsUI27BaseExtensionViewController)init;
- (_TtC22HomePlatformSettingsUI27BaseExtensionViewController)initWithCoder:(id)a3;
- (_TtC22HomePlatformSettingsUI27BaseExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation BaseExtensionViewController

- (_TtC22HomePlatformSettingsUI27BaseExtensionViewController)init
{
  return (_TtC22HomePlatformSettingsUI27BaseExtensionViewController *)sub_232E54434();
}

- (_TtC22HomePlatformSettingsUI27BaseExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_232E5AED8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22HomePlatformSettingsUI27BaseExtensionViewController *)sub_232E5452C(v5, v7, a4);
}

- (_TtC22HomePlatformSettingsUI27BaseExtensionViewController)initWithCoder:(id)a3
{
  return (_TtC22HomePlatformSettingsUI27BaseExtensionViewController *)sub_232E546B0(a3);
}

- (void)viewDidLoad
{
  v4 = self;
  sub_232E547C0((uint64_t)v4, v2, v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC));
  sub_232E4CAC0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient));
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner);
}

@end