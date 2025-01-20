@interface _MLServiceS
- (_MLServiceS)init;
- (_MLServiceS)initWithNameOfModel:(id)a3;
- (double)getPredictionWithInputFeatures:(id)a3;
- (id)getPredictionDictionaryWithInputFeatures:(id)a3;
- (void)dealloc;
- (void)getModelStatsWithCompletionHandler:(id)a3;
- (void)writeWithData:(id)a3;
@end

@implementation _MLServiceS

- (_MLServiceS)initWithNameOfModel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = (_MLServiceS *)_MLServiceS.init(nameOfModel:)(v4, v5);

  return v8;
}

- (void)getModelStatsWithCompletionHandler:(id)a3
{
  v8 = _Block_copy(a3);
  id v3 = self;
  if (v8)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v8;
    uint64_t v5 = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSDictionary?) -> ();
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  _MLServiceS.getModelStats(completionHandler:)((uint64_t)v5, v6);
  outlined consume of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?((uint64_t)v5);
}

- (double)getPredictionWithInputFeatures:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  double v10 = _MLServiceS.getPrediction(inputFeatures:)((Swift::OpaquePointer)v7);
  swift_bridgeObjectRelease();

  return v10;
}

- (id)getPredictionDictionaryWithInputFeatures:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = (unint64_t)_MLServiceS.getPredictionDictionary(withInputFeatures:)((Swift::OpaquePointer)v9);
  swift_bridgeObjectRelease();

  if (v12)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  return v8;
}

- (void)writeWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  _MLServiceS.write(data:)((Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  _MLServiceS.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined destroy of MLServerProtocol?();
}

- (_MLServiceS)init
{
  return (_MLServiceS *)_MLServiceS.init()();
}

@end