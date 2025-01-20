@interface DefaultsObserver
- (_TtC16HeadphoneManager16DefaultsObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DefaultsObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = a5;
  v8 = self;
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a4)
  {
    _bridgeAnyObjectToAny(_:)();
    outlined init with take of Any((uint64_t)v13, (uint64_t)v14);
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  if (a5)
  {
    type metadata accessor for NSKeyValueChangeKey();
    lazy protocol witness table accessor for type NSKeyValueChangeKey and conformance NSKeyValueChangeKey();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  DefaultsObserver.observeValue(forKeyPath:of:change:context:)();
  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)v14);
  swift_bridgeObjectRelease();
}

- (_TtC16HeadphoneManager16DefaultsObserver)init
{
  return (_TtC16HeadphoneManager16DefaultsObserver *)DefaultsObserver.init()();
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of AnyPublisher<NSUserDefaults, Never>?();
}

@end