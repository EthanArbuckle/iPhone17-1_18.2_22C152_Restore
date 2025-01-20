@interface RootViewController
- (_TtC24AuthenticationServicesUI18RootViewController)initWithCoder:(id)a3;
- (_TtC24AuthenticationServicesUI18RootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation RootViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100003E98(a3);
}

- (_TtC24AuthenticationServicesUI18RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RootViewController();
  v9 = [(RootViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC24AuthenticationServicesUI18RootViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  return [(RootViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController));
}

@end