@interface ALXPCClient
- (void)onData:(id)a3;
- (void)onInterrupt;
@end

@implementation ALXPCClient

- (void)onData:(id)a3
{
  id v3 = a3;
  swift_retain();
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  ALXPCClient.onData(_:)(v4, v6);
  outlined consume of Data._Representation(v4, v6);
  swift_release();
}

- (void)onInterrupt
{
}

@end