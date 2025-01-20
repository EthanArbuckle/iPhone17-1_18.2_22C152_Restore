@interface CameraViewController
- (_TtC15ConversationKit20CameraViewController)initWithCaptureMode:(int64_t)a3 devicePosition:(int64_t)a4 flashMode:(int64_t)a5 aspectRatioCrop:(int64_t)a6;
- (void)effectBrowserViewController:(id)a3 didSelectAppWithIdentifier:(id)a4;
- (void)effectBrowserViewController:(id)a3 didSelectEffect:(id)a4;
@end

@implementation CameraViewController

- (void)effectBrowserViewController:(id)a3 didSelectAppWithIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  CameraViewController.effectBrowserViewController(_:didSelectAppWith:)((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)effectBrowserViewController:(id)a3 didSelectEffect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  CameraViewController.effectBrowserViewController(_:didSelect:)((uint64_t)v6, (uint64_t)v7);
}

- (_TtC15ConversationKit20CameraViewController)initWithCaptureMode:(int64_t)a3 devicePosition:(int64_t)a4 flashMode:(int64_t)a5 aspectRatioCrop:(int64_t)a6
{
  return (_TtC15ConversationKit20CameraViewController *)CameraViewController.init(captureMode:devicePosition:flashMode:aspectRatioCrop:)();
}

- (void).cxx_destruct
{
}

@end