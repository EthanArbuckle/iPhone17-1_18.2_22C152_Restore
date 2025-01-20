@interface UUID:
- (unint64_t)TUConversationActivitySessionContainer;
- (void)SystemCoordinatorConfiguration;
- (void)TopicManager.ConversationClient;
@end

@implementation UUID:

- (void)SystemCoordinatorConfiguration
{
  if (!lazy cache variable for type metadata for Published<[UUID : SystemCoordinatorConfiguration]>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UUID : SystemCoordinatorConfiguration]);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<[UUID : SystemCoordinatorConfiguration]>);
    }
  }
}

- (void)TopicManager.ConversationClient
{
  if (!lazy cache variable for type metadata for Published<[UUID : TopicManager.ConversationClient]>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [UUID : TopicManager.ConversationClient]);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<[UUID : TopicManager.ConversationClient]>);
    }
  }
}

- (unint64_t)TUConversationActivitySessionContainer
{
  unint64_t result = lazy protocol witness table cache variable for type AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never> and conformance AnyPublisher<A, B>;
  if (!lazy protocol witness table cache variable for type AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never> and conformance AnyPublisher<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never> and conformance AnyPublisher<A, B>);
  }
  return result;
}

@end