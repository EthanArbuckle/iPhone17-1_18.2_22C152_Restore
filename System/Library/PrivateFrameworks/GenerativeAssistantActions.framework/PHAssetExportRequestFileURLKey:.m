@interface PHAssetExportRequestFileURLKey:
- (uint64_t)URL;
@end

@implementation PHAssetExportRequestFileURLKey:

- (uint64_t)URL
{
  uint64_t v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for PHAssetExportRequestFileURLKey(0);
    type metadata accessor for URL();
    lazy protocol witness table accessor for type PHAssetExportRequestFileURLKey and conformance PHAssetExportRequestFileURLKey();
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

@end