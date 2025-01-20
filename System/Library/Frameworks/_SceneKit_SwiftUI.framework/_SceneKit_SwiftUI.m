uint64_t SceneView.Options.rawValue.getter()
{
  uint64_t v0;

  return *(void *)v0;
}

_SceneKit_SwiftUI::SceneView::Options __swiftcall SceneView.Options.init(rawValue:)(_SceneKit_SwiftUI::SceneView::Options rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static SceneView.Options.allowsCameraControl.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static SceneView.Options.rendersContinuously.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static SceneView.Options.autoenablesDefaultLighting.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static SceneView.Options.jitteringEnabled.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static SceneView.Options.temporalAntialiasingEnabled.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void *sub_230B0A080@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_230B0A08C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_230B0A094@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_230B0A0A8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_230B0A0BC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_230B0A0D0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_230B0A100@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_230B0A12C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_230B0A150(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_230B0A164(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_230B0A178(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_230B0A18C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_230B0A1A0(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_230B0A1B4(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_230B0A1C8(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_230B0A1DC()
{
  return *v0 == 0;
}

uint64_t sub_230B0A1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_230B0A204(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_230B0A218@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_230B0A228(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_230B0A234(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_230B0A24C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
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

uint64_t SceneView.init(scene:pointOfView:options:preferredFramesPerSecond:antialiasingMode:delegate:technique:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v8 = *a3;
  *a8 = result;
  a8[1] = a2;
  a8[2] = a4;
  a8[3] = a5;
  a8[4] = a6;
  a8[5] = v8;
  a8[6] = a7;
  return result;
}

uint64_t SceneView.body.getter@<X0>(uint64_t a1@<X8>)
{
  v2 = *(void **)v1;
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void **)(v1 + 48);
  *(void *)a1 = *(void *)v1;
  long long v5 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 8) = v5;
  *(void *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(void *)(a1 + 48) = v4;
  uint64_t v6 = (void *)v5;
  id v7 = v4;
  id v8 = v2;
  id v9 = v6;

  return swift_unknownObjectRetain();
}

unint64_t sub_230B0A334()
{
  unint64_t result = qword_26870C420;
  if (!qword_26870C420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26870C420);
  }
  return result;
}

unint64_t sub_230B0A38C()
{
  unint64_t result = qword_26870C428;
  if (!qword_26870C428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26870C428);
  }
  return result;
}

unint64_t sub_230B0A3E4()
{
  unint64_t result = qword_26870C430;
  if (!qword_26870C430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26870C430);
  }
  return result;
}

unint64_t sub_230B0A43C()
{
  unint64_t result = qword_26870C438;
  if (!qword_26870C438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26870C438);
  }
  return result;
}

uint64_t sub_230B0A490(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of SceneView.body>>, 1);
}

uint64_t sub_230B0A4B4@<X0>(uint64_t a1@<X8>)
{
  v2 = *(void **)v1;
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void **)(v1 + 48);
  *(void *)a1 = *(void *)v1;
  long long v5 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 8) = v5;
  *(void *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(void *)(a1 + 48) = v4;
  uint64_t v6 = (void *)v5;
  id v7 = v4;
  id v8 = v2;
  id v9 = v6;

  return swift_unknownObjectRetain();
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

ValueMetadata *type metadata accessor for SceneView()
{
  return &type metadata for SceneView;
}

ValueMetadata *type metadata accessor for SceneView.Options()
{
  return &type metadata for SceneView.Options;
}

unint64_t sub_230B0A580()
{
  unint64_t result = qword_26870C820[0];
  if (!qword_26870C820[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26870C820);
  }
  return result;
}

void type metadata accessor for SCNAntialiasingMode()
{
  if (!qword_26870C4A0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26870C4A0);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for UIKitSceneView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

ValueMetadata *type metadata accessor for UIKitSceneView()
{
  return &type metadata for UIKitSceneView;
}

uint64_t sub_230B0A674()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  id v7 = *(void **)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26870C4A8);
  sub_230B0AFA0();
  id v8 = v14;
  v13[0] = v1;
  v13[1] = v2;
  v13[2] = v3;
  v13[3] = v4;
  v13[4] = v5;
  v13[5] = v6;
  v13[6] = v7;
  id v9 = v7;
  id v10 = v1;
  id v11 = v2;
  swift_unknownObjectRetain();
  sub_230B0AA54(v14, v13);

  swift_unknownObjectRelease();
  sub_230B0AFA0();
  return v13[0];
}

void sub_230B0A750()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  id v7 = *(void **)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26870C4A8);
  sub_230B0AFA0();
  id v8 = v13;
  v12[0] = v1;
  v12[1] = v2;
  v12[2] = v3;
  v12[3] = v4;
  v12[4] = v5;
  v12[5] = v6;
  v12[6] = v7;
  id v9 = v7;
  id v10 = v1;
  id v11 = v2;
  swift_unknownObjectRetain();
  sub_230B0AA54(v13, v12);

  swift_unknownObjectRelease();
}

id sub_230B0A820@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16B10]), sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_230B0A860()
{
  return sub_230B0AF10();
}

uint64_t sub_230B0A8A4()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_230B0A8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_230B0A9BC();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_230B0A914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_230B0A9BC();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

uint64_t sub_230B0A978()
{
  return sub_230B0AFD0();
}

void sub_230B0A994()
{
}

unint64_t sub_230B0A9BC()
{
  unint64_t result = qword_26870C930;
  if (!qword_26870C930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26870C930);
  }
  return result;
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

void sub_230B0AA54(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  uint64_t v6 = a2[4];
  unint64_t v7 = a2[5];
  uint64_t v8 = a2[6];
  objc_msgSend(a1, sel_setScene_, *a2);
  objc_msgSend(a1, sel_setDelegate_, v6);
  objc_msgSend(a1, sel_setAntialiasingMode_, v5);
  objc_msgSend(a1, sel_setPreferredFramesPerSecond_, v4);
  objc_msgSend(a1, sel_setAllowsCameraControl_, v7 & 1);
  objc_msgSend(a1, sel_setRendersContinuously_, (v7 >> 1) & 1);
  objc_msgSend(a1, sel_setAutoenablesDefaultLighting_, (v7 >> 2) & 1);
  objc_msgSend(a1, sel_setJitteringEnabled_, (v7 >> 3) & 1);
  objc_msgSend(a1, sel_setTemporalAntialiasingEnabled_, (v7 >> 4) & 1);
  objc_msgSend(a1, sel_setShowsStatistics_, (v7 >> 5) & 1);
  objc_msgSend(a1, sel_setTechnique_, v8);
  if (v3)
  {
    id v13 = v3;
    id v9 = objc_msgSend(a1, sel_pointOfView);
    if (!v9) {
      goto LABEL_4;
    }
    id v10 = v9;
    sub_230B0AC28();
    id v11 = v13;
    id v12 = v10;
    LOBYTE(v10) = sub_230B0AFE0();

    if ((v10 & 1) == 0) {
LABEL_4:
    }
      objc_msgSend(a1, sel_setPointOfView_, v13);
  }
}

unint64_t sub_230B0AC28()
{
  unint64_t result = qword_26870C4B0;
  if (!qword_26870C4B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26870C4B0);
  }
  return result;
}

void _s17_SceneKit_SwiftUI9SceneViewVwxx_0(uint64_t a1)
{
  swift_unknownObjectRelease();
  uint64_t v2 = *(void **)(a1 + 48);
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v6;
  id v7 = v3;
  id v8 = v4;
  swift_unknownObjectRetain();
  id v9 = v6;
  return a1;
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  id v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  id v10 = *(void **)(a1 + 48);
  id v11 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v11;
  id v12 = v11;

  return a1;
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_unknownObjectRelease();
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;

  return a1;
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneViewState()
{
  return &type metadata for SceneViewState;
}

uint64_t sub_230B0AEF0()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_230B0AF00()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_230B0AF10()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_230B0AF30()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_230B0AF40()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_230B0AF50()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_230B0AF60()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_230B0AF70()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_230B0AF80()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_230B0AFA0()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_230B0AFB0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_230B0AFC0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_230B0AFD0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_230B0AFE0()
{
  return MEMORY[0x270FA1180]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}