@interface DetailedConsentNavigationController
- (_TtC11Diagnostics35DetailedConsentNavigationController)initWithCoder:(id)a3;
- (_TtC11Diagnostics35DetailedConsentNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)agreeButtonClicked;
- (void)disagreeButtonClicked;
- (void)viewDidLoad;
@end

@implementation DetailedConsentNavigationController

- (_TtC11Diagnostics35DetailedConsentNavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100044EC0();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DetailedConsentNavigationController();
  id v2 = v6.receiver;
  [(DetailedConsentNavigationController *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self systemBackgroundColor];
    [v4 setBackgroundColor:v5];

    sub_100042EEC();
    sub_100043AD0();
  }
  else
  {
    __break(1u);
  }
}

- (void)agreeButtonClicked
{
  id v2 = self;
  sub_1000445D4();
}

- (void)disagreeButtonClicked
{
  id v2 = self;
  sub_1000448B8();
}

- (_TtC11Diagnostics35DetailedConsentNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11Diagnostics35DetailedConsentNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_agreeBtn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_disagreeBtn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_consentContent));

  swift_bridgeObjectRelease();
}

@end