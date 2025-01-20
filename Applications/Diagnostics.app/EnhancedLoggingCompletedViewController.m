@interface EnhancedLoggingCompletedViewController
- (_TtC11Diagnostics38EnhancedLoggingCompletedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11Diagnostics38EnhancedLoggingCompletedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation EnhancedLoggingCompletedViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100056A98();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EnhancedLoggingCompletedViewController();
  id v4 = v6.receiver;
  [(EnhancedLoggingCompletedViewController *)&v6 viewDidAppear:v3];
  if (qword_1001827C8 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  id v5 = [self sharedManager];
  [v5 flush];
}

- (_TtC11Diagnostics38EnhancedLoggingCompletedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC11Diagnostics38EnhancedLoggingCompletedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics38EnhancedLoggingCompletedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC11Diagnostics38EnhancedLoggingCompletedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end