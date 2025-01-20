@interface UInt64:
- (uint64_t)PluginAttachmentLedgerTopic.Participant;
- (unint64_t)PubSubTopic.Participant;
- (void)PubSubTopic.Participant;
@end

@implementation UInt64:

- (uint64_t)PluginAttachmentLedgerTopic.Participant
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

- (void)PubSubTopic.Participant
{
  if (!lazy cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt64 : PubSubTopic.Participant]);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>);
    }
  }
}

- (unint64_t)PubSubTopic.Participant
{
  unint64_t result = lazy protocol witness table cache variable for type [UInt64 : PubSubTopic.Participant] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [UInt64 : PubSubTopic.Participant] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt64 : PubSubTopic.Participant]);
    lazy protocol witness table accessor for type Topic and conformance Topic(&lazy protocol witness table cache variable for type PubSubTopic.Participant and conformance PubSubTopic.Participant, MEMORY[0x1E4F5AF40]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UInt64 : PubSubTopic.Participant] and conformance <> [A : B]);
  }
  return result;
}

@end