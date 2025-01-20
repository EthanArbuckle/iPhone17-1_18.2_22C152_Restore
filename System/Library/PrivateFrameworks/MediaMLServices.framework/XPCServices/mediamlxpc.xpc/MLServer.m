@interface MLServer
- (_TtC10mediamlxpc8MLServer)init;
- (void)getModelStatsWith:(id)a3;
- (void)getPredictionDictionaryWithInputFeatures:(id)a3 with:(id)a4;
- (void)getPredictionWithInputFeatures:(id)a3 with:(id)a4;
- (void)wakeRemoteServiceWith:(id)a3;
- (void)writeWithData:(id)a3 with:(id)a4;
@end

@implementation MLServer

- (void)getPredictionWithInputFeatures:(id)a3 with:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  MLServer.getPrediction(inputFeatures:with:)(v10, (void (*)(void, double))partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Double) -> (), v9);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)getPredictionDictionaryWithInputFeatures:(id)a3 with:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  MLServer.getPredictionDictionary(inputFeatures:with:)(v10, partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary) -> (), v9);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)writeWithData:(id)a3 with:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  MLServer.write(data:with:)(v10, (void (*)(uint64_t))partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> (), v9);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)wakeRemoteServiceWith:(id)a3
{
  id v5 = _Block_copy(a3);
  v4 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  MLServer.wakeRemoteService(with:)((void (*)(uint64_t))partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> (), v6);
  swift_release();
}

- (void)getModelStatsWith:(id)a3
{
  id v5 = _Block_copy(a3);
  v4 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  MLServer.getModelStats(with:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?) -> (), v6);
  swift_release();
}

- (_TtC10mediamlxpc8MLServer)init
{
  return (_TtC10mediamlxpc8MLServer *)MLServer.init()();
}

- (void).cxx_destruct
{
}

@end