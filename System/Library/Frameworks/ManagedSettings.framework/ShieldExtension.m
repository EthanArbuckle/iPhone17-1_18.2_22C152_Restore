@interface ShieldExtension
- (void)fetchConfigurationForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 replyHandler:(id)a6;
- (void)fetchConfigurationForCategoryIdentifier:(id)a3 categoryName:(id)a4 replyHandler:(id)a5;
- (void)fetchConfigurationForWebDomain:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 replyHandler:(id)a6;
- (void)handleAction:(int64_t)a3 bundleIdentifier:(id)a4 categoryIdentifier:(id)a5 replyHandler:(id)a6;
- (void)handleAction:(int64_t)a3 categoryIdentifier:(id)a4 replyHandler:(id)a5;
- (void)handleAction:(int64_t)a3 webDomain:(id)a4 categoryIdentifier:(id)a5 replyHandler:(id)a6;
@end

@implementation ShieldExtension

- (void)handleAction:(int64_t)a3 bundleIdentifier:(id)a4 categoryIdentifier:(id)a5 replyHandler:(id)a6
{
}

- (void)handleAction:(int64_t)a3 categoryIdentifier:(id)a4 replyHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  swift_retain();
  sub_100057610(a3, v8, v10, (uint64_t)self, (void (**)(const void *, void, void *))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)handleAction:(int64_t)a3 webDomain:(id)a4 categoryIdentifier:(id)a5 replyHandler:(id)a6
{
}

- (void)fetchConfigurationForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 replyHandler:(id)a6
{
}

- (void)fetchConfigurationForCategoryIdentifier:(id)a3 categoryName:(id)a4 replyHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v6);
  swift_retain();
  sub_1000593C0(v7, v9, v10, v12, (uint64_t)self, (void (**)(const void *, void, void *))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fetchConfigurationForWebDomain:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 replyHandler:(id)a6
{
}

@end