@interface AXTeachableLongFormViewController
- (AXTeachableLongFormViewController)initWithCoder:(id)a3;
- (AXTeachableLongFormViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (void)didReceiveNotification:(id)a3;
@end

@implementation AXTeachableLongFormViewController

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  AXTeachableLongFormViewController.didReceive(_:)((UNNotification)v4);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXTeachableLongFormViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100007110();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (AXTeachableLongFormViewController *)AXTeachableLongFormViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (AXTeachableLongFormViewController)initWithCoder:(id)a3
{
  return (AXTeachableLongFormViewController *)AXTeachableLongFormViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___AXTeachableLongFormViewController_TeachableLogger;
  uint64_t v3 = sub_1000070E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end