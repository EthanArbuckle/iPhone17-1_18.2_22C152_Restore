@interface ICSVideoMessageRootViewController
- (ICSVideoMessageRootViewController)initWithCoder:(id)a3;
- (ICSVideoMessageRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICSVideoMessageRootViewController)initWithViewModel:(id)a3;
- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation ICSVideoMessageRootViewController

- (ICSVideoMessageRootViewController)initWithViewModel:(id)a3
{
  return (ICSVideoMessageRootViewController *)sub_100172980(a3);
}

- (ICSVideoMessageRootViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100172AA8();
}

- (ICSVideoMessageRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_100172F54();
}

- (void).cxx_destruct
{
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  id v5 = self;
  sub_100173014((uint64_t)v5, a4);
}

@end