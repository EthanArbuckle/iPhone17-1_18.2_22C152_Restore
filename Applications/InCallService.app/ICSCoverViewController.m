@interface ICSCoverViewController
- (BOOL)_canShowWhileLocked;
- (ICSCoverViewController)initWithCallDisplayStyleManager:(id)a3;
- (ICSCoverViewController)initWithCoder:(id)a3;
- (ICSCoverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)updateViews;
- (void)viewDidLoad;
@end

@implementation ICSCoverViewController

- (ICSCoverViewController)initWithCallDisplayStyleManager:(id)a3
{
  return (ICSCoverViewController *)sub_1001B7AC8(a3);
}

- (ICSCoverViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001B7C08();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001B7CE4();
}

- (void)updateViews
{
  v2 = self;
  sub_1001B80E0();
}

- (ICSCoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_1001B8550();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSCoverViewController_callParticipantsViewController));

  swift_bridgeObjectRelease();
}

@end