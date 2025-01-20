@interface HomePodPrivacyConsentViewController
- (_TtC14HDSViewService35HomePodPrivacyConsentViewController)initWithCoder:(id)a3;
- (_TtC14HDSViewService35HomePodPrivacyConsentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation HomePodPrivacyConsentViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006780C();
}

- (_TtC14HDSViewService35HomePodPrivacyConsentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC14HDSViewService35HomePodPrivacyConsentViewController_consentView) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC14HDSViewService35HomePodPrivacyConsentViewController_consentView) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HomePodPrivacyConsentViewController();
  v9 = [(HomePodPrivacyConsentViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC14HDSViewService35HomePodPrivacyConsentViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14HDSViewService35HomePodPrivacyConsentViewController_consentView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodPrivacyConsentViewController();
  return [(HomePodPrivacyConsentViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService35HomePodPrivacyConsentViewController_consentView));
}

@end