@interface EnhancedLoggingDiagnosticInfoViewController
- (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EnhancedLoggingDiagnosticInfoViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10005B3DC(a3);
}

- (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController *)sub_10005BC7C(v5, v7, a4);
}

- (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController *)sub_10005BE14(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController_descriptionTextView);
}

@end