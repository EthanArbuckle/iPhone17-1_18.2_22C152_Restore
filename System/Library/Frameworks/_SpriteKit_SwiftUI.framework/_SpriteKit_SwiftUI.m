uint64_t SpriteView.Options.rawValue.getter()
{
  uint64_t v0;

  return *(void *)v0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance SpriteView.Options(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance SpriteView.Options@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return specialized SetAlgebra<>.init(arrayLiteral:)(a1, a2);
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t SpriteView.DebugOptions.rawValue.getter()
{
  return *(void *)v0;
}

_SpriteKit_SwiftUI::SpriteView::DebugOptions __swiftcall SpriteView.DebugOptions.init(rawValue:)(_SpriteKit_SwiftUI::SpriteView::DebugOptions rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static SpriteView.DebugOptions.showsFPS.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static SpriteView.DebugOptions.showsDrawCount.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static SpriteView.DebugOptions.showsNodeCount.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static SpriteView.DebugOptions.showsQuadCount.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static SpriteView.DebugOptions.showsPhysics.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static SpriteView.DebugOptions.showsFields.getter(void *a1@<X8>)
{
  *a1 = 32;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance SpriteView.DebugOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for SetAlgebra.init() in conformance SpriteView.DebugOptions(void *a1@<X8>)
{
  *a1 = 0;
}

void *protocol witness for SetAlgebra.union(_:) in conformance SpriteView.DebugOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *protocol witness for SetAlgebra.intersection(_:) in conformance SpriteView.DebugOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance SpriteView.DebugOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance SpriteView.DebugOptions(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *protocol witness for SetAlgebra.remove(_:) in conformance SpriteView.Options@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance SpriteView.Options@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *protocol witness for SetAlgebra.formUnion(_:) in conformance SpriteView.DebugOptions(void *result)
{
  *v1 |= *result;
  return result;
}

void *protocol witness for SetAlgebra.formIntersection(_:) in conformance SpriteView.DebugOptions(void *result)
{
  *v1 &= *result;
  return result;
}

void *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance SpriteView.DebugOptions(void *result)
{
  *v1 ^= *result;
  return result;
}

void *protocol witness for SetAlgebra.subtracting(_:) in conformance SpriteView.DebugOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance SpriteView.DebugOptions(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance SpriteView.DebugOptions(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance SpriteView.DebugOptions(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance SpriteView.DebugOptions()
{
  return *v0 == 0;
}

void *protocol witness for SetAlgebra.subtract(_:) in conformance SpriteView.DebugOptions(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance SpriteView.DebugOptions@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SpriteView.DebugOptions(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SpriteView.DebugOptions(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5 = qword_26EA3B238;
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = a4;
  *(void *)(a5 + 32) = v5;
  *(void *)(a5 + 40) = 0;
  *(void *)(a5 + 48) = closure #1 in SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:);
  *(void *)(a5 + 56) = 0;
  return result;
}

uint64_t closure #1 in SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:)()
{
  return 1;
}

uint64_t SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:options:shouldRender:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v8 = *a5;
  *(void *)a8 = result;
  *(void *)(a8 + 8) = a2;
  *(unsigned char *)(a8 + 16) = a3;
  *(void *)(a8 + 24) = a4;
  *(void *)(a8 + 32) = v8;
  *(void *)(a8 + 40) = 0;
  *(void *)(a8 + 48) = a6;
  *(void *)(a8 + 56) = a7;
  return result;
}

uint64_t SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:options:debugOptions:shouldRender:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9 = *a5;
  uint64_t v10 = *a6;
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = v9;
  *(void *)(a9 + 40) = v10;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  return result;
}

__n128 SpriteView.body.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void **)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  __n128 v16 = *(__n128 *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v9 = (objc_class *)type metadata accessor for SpriteKitViewDelegate();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate_callback];
  *(void *)v11 = v7;
  *((void *)v11 + 1) = v8;
  v17.receiver = v10;
  v17.super_class = v9;
  id v12 = v3;
  id v13 = v4;
  swift_retain();
  id v14 = objc_msgSendSuper2(&v17, sel_init);
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  __n128 result = v16;
  *(__n128 *)(a1 + 24) = v16;
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v14;
  return result;
}

uint64_t type metadata accessor for SpriteKitViewDelegate()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type SpriteView.Options and conformance SpriteView.Options()
{
  unint64_t result = lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options;
  if (!lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options;
  if (!lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options;
  if (!lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options;
  if (!lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions()
{
  unint64_t result = lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions;
  if (!lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions;
  if (!lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions;
  if (!lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions;
  if (!lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in SpriteView(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of SpriteView.body>>, 1);
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance SpriteView()
{
  return MEMORY[0x270F032C0]();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance SpriteView()
{
  return MEMORY[0x270F032D0]();
}

__n128 protocol witness for View.body.getter in conformance SpriteView@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void **)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  __n128 v16 = *(__n128 *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v9 = (objc_class *)type metadata accessor for SpriteKitViewDelegate();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate_callback];
  *(void *)v11 = v7;
  *((void *)v11 + 1) = v8;
  v17.receiver = v10;
  v17.super_class = v9;
  id v12 = v3;
  id v13 = v4;
  swift_retain();
  id v14 = objc_msgSendSuper2(&v17, sel_init);
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  __n128 result = v16;
  *(__n128 *)(a1 + 24) = v16;
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v14;
  return result;
}

uint64_t destroy for SpriteView(id *a1)
{
  return swift_release();
}

uint64_t initializeWithCopy for SpriteView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = v6;
  id v7 = v3;
  id v8 = v4;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SpriteView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v10;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SpriteView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SpriteView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SpriteView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SpriteView()
{
  return &type metadata for SpriteView;
}

ValueMetadata *type metadata accessor for SpriteView.Options()
{
  return &type metadata for SpriteView.Options;
}

ValueMetadata *type metadata accessor for SpriteView.DebugOptions()
{
  return &type metadata for SpriteView.DebugOptions;
}

id SpriteKitViewDelegate.__deallocating_deinit()
{
  return SpriteKitViewDelegate.__deallocating_deinit((uint64_t (*)(void))type metadata accessor for SpriteKitViewDelegate);
}

id SKView.assignState(state:)(uint64_t a1)
{
  uint64_t v2 = v1;
  long long v4 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  unint64_t v6 = *(void *)(a1 + 32);
  unint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = objc_msgSend(v1, sel_scene);
  if (!v10) {
    goto LABEL_4;
  }
  v11 = v10;
  type metadata accessor for SKScene();
  uint64_t v17 = v6;
  v18 = v4;
  id v12 = v4;
  id v13 = v11;
  LOBYTE(v11) = static NSObject.== infix(_:_:)();

  long long v4 = v18;
  if ((v11 & 1) == 0)
  {
LABEL_4:
    objc_msgSend(v2, sel_frame, v17);
    if (v15 != 0.0 || v14 != 0.0)
    {
      if (v3) {
        objc_msgSend(v2, sel_presentScene_transition_, v4, v3);
      }
      else {
        objc_msgSend(v2, sel_presentScene_, v4);
      }
    }
  }
  objc_msgSend(v2, sel_setDelegate_, v9, v17);
  objc_msgSend(v2, sel_setAllowsTransparency_, v6 & 1);
  objc_msgSend(v2, sel_setIgnoresSiblingOrder_, (v6 >> 1) & 1);
  objc_msgSend(v2, sel_setShouldCullNonVisibleNodes_, (v6 >> 2) & 1);
  objc_msgSend(v2, sel_setPreferredFramesPerSecond_, v7);
  objc_msgSend(v2, sel_setPaused_, v5);
  objc_msgSend(v2, sel_setShowsFPS_, v8 & 1);
  objc_msgSend(v2, sel_setShowsDrawCount_, (v8 >> 1) & 1);
  objc_msgSend(v2, sel_setShowsNodeCount_, (v8 >> 2) & 1);
  objc_msgSend(v2, sel_setShowsQuadCount_, (v8 >> 3) & 1);
  objc_msgSend(v2, sel_setShowsPhysics_, (v8 >> 4) & 1);

  return objc_msgSend(v2, sel_setShowsFields_, (v8 >> 5) & 1);
}

id SpriteKitViewCoordinator.__deallocating_deinit()
{
  return SpriteKitViewDelegate.__deallocating_deinit((uint64_t (*)(void))type metadata accessor for SpriteKitViewCoordinator);
}

id SpriteKitViewDelegate.__deallocating_deinit(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SpriteKitViewCoordinator()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type UIKitSpriteKitView and conformance UIKitSpriteKitView()
{
  unint64_t result = lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView;
  if (!lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView;
  if (!lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView);
  }
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

void *type metadata accessor for SpriteKitViewState()
{
  return &unk_26EA3B390;
}

uint64_t initializeBufferWithCopyOfBuffer for UIKitSpriteKitView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for UIKitSpriteKitView(id *a1)
{
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for SpriteKitViewState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  long long v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  id v6 = v3;
  id v7 = v4;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SpriteKitViewState(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a1 + 8);
  unint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for SpriteKitViewState(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SpriteKitViewState(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SpriteKitViewState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void *type metadata accessor for UIKitSpriteKitView()
{
  return &unk_26EA3B428;
}

char *UIKitSpriteKitView.makeUIView(context:)()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v7 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UIViewRepresentableContext<UIKitSpriteKitView>);
  UIViewRepresentableContext.coordinator.getter();
  unint64_t v8 = &v16[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  double v14 = *(void **)&v16[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState
                     + 8];
  double v15 = *(void **)&v16[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  *(void *)unint64_t v8 = v1;
  *((void *)v8 + 1) = v2;
  *((void *)v8 + 2) = v3;
  *((void *)v8 + 3) = v4;
  *((void *)v8 + 4) = v5;
  *((void *)v8 + 5) = v7;
  *((void *)v8 + 6) = v6;
  swift_unknownObjectRetain_n();
  id v9 = v1;
  id v10 = v2;
  id v11 = v9;
  id v12 = v10;
  outlined consume of SpriteKitViewState?(v15, v14);
  swift_unknownObjectRelease();

  UIViewRepresentableContext.coordinator.getter();
  return v16;
}

void protocol witness for UIViewRepresentable.updateUIView(_:context:) in conformance UIKitSpriteKitView()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v7 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UIViewRepresentableContext<UIKitSpriteKitView>);
  UIViewRepresentableContext.coordinator.getter();
  unint64_t v8 = &v15[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  id v9 = *(void **)&v15[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState
                    + 8];
  double v14 = *(void **)&v15[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  *(void *)unint64_t v8 = v1;
  *((void *)v8 + 1) = v2;
  *((void *)v8 + 2) = v3;
  *((void *)v8 + 3) = v4;
  *((void *)v8 + 4) = v5;
  *((void *)v8 + 5) = v7;
  *((void *)v8 + 6) = v6;
  swift_unknownObjectRetain_n();
  id v10 = v1;
  id v11 = v2;
  id v12 = v10;
  id v13 = v11;
  outlined consume of SpriteKitViewState?(v14, v9);
  swift_unknownObjectRelease();
}

uint64_t protocol witness for UIViewRepresentable._resetUIView(_:coordinator:destroy:) in conformance UIKitSpriteKitView()
{
  return MEMORY[0x270F016E0]();
}

uint64_t protocol witness for static UIViewRepresentable.dismantleUIView(_:coordinator:) in conformance UIKitSpriteKitView()
{
  return MEMORY[0x270F016F8]();
}

id protocol witness for UIViewRepresentable.makeCoordinator() in conformance UIKitSpriteKitView@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SpriteKitViewCoordinator()), sel_init);
  *a1 = result;
  return result;
}

uint64_t protocol witness for UIViewRepresentable._identifiedViewTree(in:) in conformance UIKitSpriteKitView()
{
  return MEMORY[0x270F01738]();
}

uint64_t protocol witness for UIViewRepresentable.sizeThatFits(_:uiView:context:) in conformance UIKitSpriteKitView()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t protocol witness for UIViewRepresentable._overrideSizeThatFits(_:in:uiView:) in conformance UIKitSpriteKitView()
{
  return MEMORY[0x270F01758]();
}

uint64_t protocol witness for UIViewRepresentable._overrideLayoutTraits(_:for:) in conformance UIKitSpriteKitView()
{
  return MEMORY[0x270F01748]();
}

uint64_t protocol witness for static UIViewRepresentable._modifyBridgedViewInputs(_:) in conformance UIKitSpriteKitView()
{
  return MEMORY[0x270F01768]();
}

uint64_t protocol witness for static UIViewRepresentable._layoutOptions(_:) in conformance UIKitSpriteKitView()
{
  return MEMORY[0x270F01728]();
}

uint64_t associated type witness table accessor for View.Body : View in UIKitSpriteKitView()
{
  return MEMORY[0x263F1BB58];
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance UIKitSpriteKitView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type UIKitSpriteKitView and conformance UIKitSpriteKitView();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance UIKitSpriteKitView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type UIKitSpriteKitView and conformance UIKitSpriteKitView();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance UIKitSpriteKitView()
{
  return static View._viewListCount(inputs:)();
}

void protocol witness for View.body.getter in conformance UIKitSpriteKitView()
{
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

void *outlined consume of SpriteKitViewState?(void *result, void *a2)
{
  if (result)
  {

    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

unint64_t type metadata accessor for SKScene()
{
  unint64_t result = lazy cache variable for type metadata for SKScene;
  if (!lazy cache variable for type metadata for SKScene)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SKScene);
  }
  return result;
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return MEMORY[0x270F01708]();
}

uint64_t UIViewRepresentable.body.getter()
{
  return MEMORY[0x270F01778]();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return MEMORY[0x270F02418]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x270F036C0]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}