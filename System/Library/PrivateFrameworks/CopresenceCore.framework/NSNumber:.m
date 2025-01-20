@interface NSNumber:
- (uint64_t)String;
@end

@implementation NSNumber:

- (uint64_t)String
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_allocError();
    void *v5 = a3;
    id v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
    lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type NSNumber and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
    **(void **)(*(void *)(v3 + 64) + 40) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    return swift_continuation_throwingResume();
  }
}

@end