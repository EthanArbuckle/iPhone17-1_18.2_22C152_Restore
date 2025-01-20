@interface RootViewController
- (_TtC19DiagnosticsReporter18RootViewController)initWithCoder:(id)a3;
- (_TtC19DiagnosticsReporter18RootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation RootViewController

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  sub_10000B374();
}

- (_TtC19DiagnosticsReporter18RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = (char *)self + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((void *)v8 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController) = 0;
    id v9 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (char *)self + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog;
    *(_OWORD *)v10 = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((void *)v10 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController) = 0;
    id v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = [(RootViewController *)&v14 initWithNibName:a3 bundle:a4];

  return v12;
}

- (_TtC19DiagnosticsReporter18RootViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(RootViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_100005AF4((uint64_t)self + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog);

  swift_release();
}

@end