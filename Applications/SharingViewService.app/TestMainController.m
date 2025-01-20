@interface TestMainController
- (_TtC18SharingViewService18TestMainController)initWithCoder:(id)a3;
- (_TtC18SharingViewService18TestMainController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TestMainController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000199D4(a3);
}

- (_TtC18SharingViewService18TestMainController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService18TestMainController_vcNav] = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService18TestMainController_vcNav] = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TestMainController();
  v9 = [(TestMainController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18SharingViewService18TestMainController)initWithCoder:(id)a3
{
  *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService18TestMainController_vcNav] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TestMainController();
  return [(TestMainController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end