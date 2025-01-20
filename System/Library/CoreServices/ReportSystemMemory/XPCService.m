@interface XPCService
- (void)writeJetsamMemoryReportWithVisibilityEndowmentSet:(id)a3 audioAssertionSet:(id)a4 with:(id)a5;
@end

@implementation XPCService

- (void)writeJetsamMemoryReportWithVisibilityEndowmentSet:(id)a3 audioAssertionSet:(id)a4 with:(id)a5
{
  v7 = _Block_copy(a5);
  if (a3) {
    a3 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a4) {
    a4 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v7);
  swift_retain();
  sub_100002554((uint64_t)a3, (uint64_t)a4, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end