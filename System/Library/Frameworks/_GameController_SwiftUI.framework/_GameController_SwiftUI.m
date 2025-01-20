uint64_t View.handlesGameControllerEvents(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = a1;
  return MEMORY[0x24C52DD80](&v4, a2, &unk_26FAC19A0, a3);
}

uint64_t sub_246547050()
{
  return swift_getWitnessTable();
}

unint64_t lazy protocol witness table accessor for type GameControllerEventInteractionModifier and conformance GameControllerEventInteractionModifier()
{
  unint64_t result = lazy protocol witness table cache variable for type GameControllerEventInteractionModifier and conformance GameControllerEventInteractionModifier;
  if (!lazy protocol witness table cache variable for type GameControllerEventInteractionModifier and conformance GameControllerEventInteractionModifier)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GameControllerEventInteractionModifier and conformance GameControllerEventInteractionModifier);
  }
  return result;
}

void *type metadata accessor for GameControllerEventInteractionModifier()
{
  return &unk_26FAC19A0;
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in GameControllerEventInteractionModifier()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for static ViewModifier._makeView(modifier:inputs:body:) in conformance GameControllerEventInteractionModifier()
{
  return MEMORY[0x270F05440]();
}

uint64_t protocol witness for static ViewModifier._makeViewList(modifier:inputs:body:) in conformance GameControllerEventInteractionModifier()
{
  return MEMORY[0x270F05448]();
}

uint64_t protocol witness for static ViewModifier._viewListCount(inputs:body:) in conformance GameControllerEventInteractionModifier()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t protocol witness for ViewModifier.body(content:) in conformance GameControllerEventInteractionModifier()
{
  return View.interactionRepresentable<A>(_:)();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>;
  if (!lazy protocol witness table cache variable for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ViewModifier_Content<GameControllerEventInteractionModifier>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable()
{
  unint64_t result = lazy protocol witness table cache variable for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable;
  if (!lazy protocol witness table cache variable for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable);
  }
  return result;
}

void *type metadata accessor for GCEventInteractionRepresentable()
{
  return &unk_26FAC1A08;
}

void type metadata accessor for GCUIEventTypes()
{
  if (!lazy cache variable for type metadata for GCUIEventTypes)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for GCUIEventTypes);
    }
  }
}

uint64_t sub_246547378()
{
  return swift_getOpaqueTypeConformance2();
}

id protocol witness for _UIInteractionRepresentable.makeUIInteraction() in conformance GCEventInteractionRepresentable()
{
  uint64_t v1 = *v0;
  id v2 = objc_msgSend(objc_allocWithZone((Class)&off_26FAC2BB8), sel_init);
  objc_msgSend(v2, sel_setHandledEventTypes_, v1);
  return v2;
}

id protocol witness for _UIInteractionRepresentable.updateUIInteraction(_:) in conformance GCEventInteractionRepresentable(void *a1)
{
  return objc_msgSend(a1, sel_setHandledEventTypes_, *v1);
}

void protocol witness for SetAlgebra.init() in conformance GCUIEventTypes(void *a1@<X8>)
{
  *a1 = 0;
}

void *protocol witness for SetAlgebra.union(_:) in conformance GCUIEventTypes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *protocol witness for SetAlgebra.intersection(_:) in conformance GCUIEventTypes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance GCUIEventTypes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance GCUIEventTypes(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *protocol witness for SetAlgebra.remove(_:) in conformance GCUIEventTypes@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance GCUIEventTypes@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *protocol witness for SetAlgebra.formUnion(_:) in conformance GCUIEventTypes(void *result)
{
  *v1 |= *result;
  return result;
}

void *protocol witness for SetAlgebra.formIntersection(_:) in conformance GCUIEventTypes(void *result)
{
  *v1 &= *result;
  return result;
}

void *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance GCUIEventTypes(void *result)
{
  *v1 ^= *result;
  return result;
}

void *protocol witness for SetAlgebra.subtracting(_:) in conformance GCUIEventTypes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance GCUIEventTypes(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance GCUIEventTypes(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance GCUIEventTypes(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance GCUIEventTypes()
{
  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance GCUIEventTypes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *protocol witness for SetAlgebra.subtract(_:) in conformance GCUIEventTypes(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GCUIEventTypes(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance GCUIEventTypes@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance GCUIEventTypes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance GCUIEventTypes@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GCUIEventTypes(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t base witness table accessor for Equatable in GCUIEventTypes()
{
  return lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes(&lazy protocol witness table cache variable for type GCUIEventTypes and conformance GCUIEventTypes);
}

uint64_t base witness table accessor for ExpressibleByArrayLiteral in GCUIEventTypes()
{
  return lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes(&lazy protocol witness table cache variable for type GCUIEventTypes and conformance GCUIEventTypes);
}

uint64_t base witness table accessor for RawRepresentable in GCUIEventTypes()
{
  return lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes(&lazy protocol witness table cache variable for type GCUIEventTypes and conformance GCUIEventTypes);
}

uint64_t base witness table accessor for SetAlgebra in GCUIEventTypes()
{
  return lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes((unint64_t *)&lazy protocol witness table cache variable for type GCUIEventTypes and conformance GCUIEventTypes);
}

uint64_t lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for GCUIEventTypes();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return MEMORY[0x270F05450]();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return MEMORY[0x270F05458]();
}

uint64_t View.interactionRepresentable<A>(_:)()
{
  return MEMORY[0x270F03D90]();
}

uint64_t View.modifier<A>(_:)()
{
  return MEMORY[0x270F05460]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}