@interface ResultHandler
- (void)onData:(id)a3;
- (void)onInterrupt;
@end

@implementation ResultHandler

- (void)onData:(id)a3
{
  id v3 = a3;
  swift_retain();
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  ResultHandler.onData(_:)(v4, v6);
  outlined consume of Data._Representation(v4, v6);
  swift_release();
}

- (void)onInterrupt
{
  v2 = *(void (**)(uint64_t))self->_cbInterrupt;
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
}

@end