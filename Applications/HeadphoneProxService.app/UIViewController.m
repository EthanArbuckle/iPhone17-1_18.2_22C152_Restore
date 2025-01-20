@interface UIViewController
- (void)perormTapActionWithRecognizer:(id)a3 targetString:(id)a4 inLabel:(id)a5 action:(id)a6;
@end

@implementation UIViewController

- (void)perormTapActionWithRecognizer:(id)a3 targetString:(id)a4 inLabel:(id)a5 action:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v9);
  id v13 = a3;
  id v14 = a5;
  v15 = self;
  sub_10007B40C((uint64_t)v13, v10, v12, v14, (uint64_t)v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

@end