@interface EnhancedLoggingCompletedNavigationController
- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithCoder:(id)a3;
- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithRootViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation EnhancedLoggingCompletedNavigationController

- (void)viewDidLoad
{
  v2 = self;
  sub_100077E58();
}

- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *)sub_100078054(ObjCClassMetadata, v6);
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata();
  return (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController *)sub_100078054(ObjCClassMetadata, v6);
}

- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithRootViewController:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11Diagnostics44EnhancedLoggingCompletedNavigationController_enhancedLoggingCompletedViewController;
  id v6 = objc_allocWithZone((Class)type metadata accessor for EnhancedLoggingCompletedViewController());
  id v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1000565D0();

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for EnhancedLoggingCompletedNavigationController();
  v9 = [(EnhancedLoggingCompletedNavigationController *)&v11 initWithRootViewController:v7];

  return v9;
}

- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC11Diagnostics44EnhancedLoggingCompletedNavigationController_enhancedLoggingCompletedViewController;
  id v9 = objc_allocWithZone((Class)type metadata accessor for EnhancedLoggingCompletedViewController());
  v10 = self;
  id v11 = a4;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)sub_1000565D0();

  if (v7)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for EnhancedLoggingCompletedNavigationController();
  v13 = [(EnhancedLoggingCompletedNavigationController *)&v15 initWithNibName:v12 bundle:v11];

  return v13;
}

- (_TtC11Diagnostics44EnhancedLoggingCompletedNavigationController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11Diagnostics44EnhancedLoggingCompletedNavigationController_enhancedLoggingCompletedViewController;
  id v6 = objc_allocWithZone((Class)type metadata accessor for EnhancedLoggingCompletedViewController());
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1000565D0();

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for EnhancedLoggingCompletedNavigationController();
  id v9 = [(EnhancedLoggingCompletedNavigationController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics44EnhancedLoggingCompletedNavigationController_enhancedLoggingCompletedViewController));
}

@end