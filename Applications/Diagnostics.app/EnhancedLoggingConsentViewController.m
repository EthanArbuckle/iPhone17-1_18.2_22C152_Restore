@interface EnhancedLoggingConsentViewController
- (_TtC11Diagnostics36EnhancedLoggingConsentViewController)init;
- (_TtC11Diagnostics36EnhancedLoggingConsentViewController)initWithCoder:(id)a3;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
@end

@implementation EnhancedLoggingConsentViewController

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    id v5 = a3;
    v6 = self;
    sub_100045FCC(0, 0, (uint64_t)_swiftEmptyArrayStorage, 0xD00000000000001CLL, (void *)0x800000010012BD10);

    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

- (_TtC11Diagnostics36EnhancedLoggingConsentViewController)init
{
  return (_TtC11Diagnostics36EnhancedLoggingConsentViewController *)sub_100063598();
}

- (_TtC11Diagnostics36EnhancedLoggingConsentViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics36EnhancedLoggingConsentViewController *)sub_100063714(a3);
}

- (void).cxx_destruct
{
  sub_10003C44C((uint64_t)self + OBJC_IVAR____TtC11Diagnostics36EnhancedLoggingConsentViewController_delegate, &qword_100183CE8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics36EnhancedLoggingConsentViewController_diagnosticsTable);
}

@end