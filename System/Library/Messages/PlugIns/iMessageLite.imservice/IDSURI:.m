@interface IDSURI:
- (uint64_t)IDSOffGridDeliveryQueryResult;
- (uint64_t)NSNumber;
@end

@implementation IDSURI:

- (uint64_t)NSNumber
{
  return swift_release();
}

- (uint64_t)IDSOffGridDeliveryQueryResult
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSURI);
    type metadata accessor for IMDHandle(0, &lazy cache variable for type metadata for IDSOffGridDeliveryQueryResult);
    lazy protocol witness table accessor for type IDSURI and conformance NSObject();
    **(void **)(*(void *)(v3 + 64) + 40) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

@end