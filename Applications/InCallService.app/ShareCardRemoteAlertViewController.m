@interface ShareCardRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC13InCallService34ShareCardRemoteAlertViewController)initWithCoder:(id)a3;
- (_TtC13InCallService34ShareCardRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ShareCardRemoteAlertViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10015BC28(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC13InCallService34ShareCardRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC13InCallService34ShareCardRemoteAlertViewController *)sub_10015C318(v5, v7, a4);
}

- (_TtC13InCallService34ShareCardRemoteAlertViewController)initWithCoder:(id)a3
{
  return (_TtC13InCallService34ShareCardRemoteAlertViewController *)sub_10015C420(a3);
}

- (void).cxx_destruct
{
}

@end