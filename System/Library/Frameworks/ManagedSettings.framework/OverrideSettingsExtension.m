@interface OverrideSettingsExtension
- (void)askToOverrideUnremovabilityOfApplication:(id)a3 teamIdentifier:(id)a4 replyHandler:(id)a5;
@end

@implementation OverrideSettingsExtension

- (void)askToOverrideUnremovabilityOfApplication:(id)a3 teamIdentifier:(id)a4 replyHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v6);
  swift_retain();
  sub_100021774(v7, v9, v10, v12, self, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end