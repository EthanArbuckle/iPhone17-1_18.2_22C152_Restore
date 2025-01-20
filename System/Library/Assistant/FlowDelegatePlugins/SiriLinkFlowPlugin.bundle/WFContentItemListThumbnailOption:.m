@interface WFContentItemListThumbnailOption:
- (uint64_t)Any;
@end

@implementation WFContentItemListThumbnailOption:

- (uint64_t)Any
{
  uint64_t v3 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3)
  {
    type metadata accessor for WFContentItemListThumbnailOption(0);
    lazy protocol witness table accessor for type WFChooseFromListFlow and conformance WFChooseFromListFlow(&lazy protocol witness table cache variable for type WFContentItemListThumbnailOption and conformance WFContentItemListThumbnailOption, 255, type metadata accessor for WFContentItemListThumbnailOption);
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a2;

  return specialized _resumeUnsafeContinuation<A>(_:_:)(v5, (uint64_t)a2, v3);
}

@end