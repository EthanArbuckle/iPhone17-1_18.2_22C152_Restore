uint64_t TGOnDeviceInferenceProviderService.__allocating_init()()
{
  swift_allocObject();
  return InferenceProviderExtension.init()();
}

uint64_t TGOnDeviceInferenceProviderService.__deallocating_deinit()
{
  uint64_t v0 = InferenceProviderExtension.deinit();

  return _swift_deallocClassInstance(v0, 16, 7);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for TGOnDeviceInferenceProviderService()
{
  uint64_t result = type metadata singleton initialization cache for TGOnDeviceInferenceProviderService;
  if (!type metadata singleton initialization cache for TGOnDeviceInferenceProviderService) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TGOnDeviceInferenceProviderService and conformance InferenceProviderExtension<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type TGOnDeviceInferenceProviderService and conformance InferenceProviderExtension<A>;
  if (!lazy protocol witness table cache variable for type TGOnDeviceInferenceProviderService and conformance InferenceProviderExtension<A>)
  {
    type metadata accessor for TGOnDeviceInferenceProviderService();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TGOnDeviceInferenceProviderService and conformance InferenceProviderExtension<A>);
  }
  return result;
}

uint64_t type metadata completion function for TGOnDeviceInferenceProviderService()
{
  return swift_initClassMetadata2();
}

uint64_t ObjC metadata update function for TGOnDeviceInferenceProviderService()
{
  return type metadata accessor for TGOnDeviceInferenceProviderService();
}

uint64_t static AppExtension.main()()
{
  return static AppExtension.main()();
}

uint64_t InferenceProviderExtension.init()()
{
  return InferenceProviderExtension.init()();
}

uint64_t InferenceProviderExtension.deinit()
{
  return InferenceProviderExtension.deinit();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}