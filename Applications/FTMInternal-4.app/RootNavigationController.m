@interface RootNavigationController
- (_TtC13FTMInternal_424RootNavigationController)initWithCoder:(id)a3;
- (_TtC13FTMInternal_424RootNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC13FTMInternal_424RootNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC13FTMInternal_424RootNavigationController)initWithRootViewController:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)firstTimerMetricRefresh;
- (void)viewDidLoad;
@end

@implementation RootNavigationController

- (_TtC13FTMInternal_424RootNavigationController)initWithCoder:(id)a3
{
  result = (_TtC13FTMInternal_424RootNavigationController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001ADAE4();
}

- (void)firstTimerMetricRefresh
{
  v2 = self;
  sub_1001AE0C8();
}

- (void)dealloc
{
  uint64_t v2 = qword_1002D7A80;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  static os_log_type_t.error.getter();
  os_log(_:dso:log:type:_:)();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for RootNavigationController();
  [(RootNavigationController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_424RootNavigationController_persistanceStore));
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for RootNavigationController();
  [(RootNavigationController *)&v2 didReceiveMemoryWarning];
}

- (_TtC13FTMInternal_424RootNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC13FTMInternal_424RootNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13FTMInternal_424RootNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC13FTMInternal_424RootNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13FTMInternal_424RootNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13FTMInternal_424RootNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end