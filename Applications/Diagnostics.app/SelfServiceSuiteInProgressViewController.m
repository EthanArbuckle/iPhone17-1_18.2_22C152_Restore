@interface SelfServiceSuiteInProgressViewController
- (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SelfServiceSuiteInProgressViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SelfServiceSuiteInProgressViewController();
  v2 = (char *)v4.receiver;
  [(SelfServiceSuiteInProgressViewController *)&v4 viewDidLoad];
  sub_10009D9A0();
  id v3 = [v2 contentView];
  [v3 addSubview:*(void *)&v2[OBJC_IVAR____TtC11Diagnostics40SelfServiceSuiteInProgressViewController_progressView]];

  sub_10009DF50();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_10009E498(a3);
}

- (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics40SelfServiceSuiteInProgressViewController_onAppear];

  sub_10003B0B8(v3);
}

@end