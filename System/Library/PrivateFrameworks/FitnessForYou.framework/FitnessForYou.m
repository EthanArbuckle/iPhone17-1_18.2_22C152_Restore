__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  long long v3;
  long long v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t CanvasPlaceholder.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasPlaceholder.referenceIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasPlaceholder.editorialCardIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasPlaceholder.markerType.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t CanvasPlaceholder.referenceType.getter()
{
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t CanvasPlaceholder.displayStyle.getter()
{
  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t CanvasPlaceholder.reason.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasPlaceholder.planMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CanvasPlaceholder();
  return sub_24EFA37B8(v1 + *(int *)(v3 + 44), a1, (uint64_t (*)(void))type metadata accessor for PlanMetadata);
}

uint64_t type metadata accessor for CanvasPlaceholder()
{
  uint64_t result = qword_26B1E81E0;
  if (!qword_26B1E81E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CanvasPlaceholder.init(identifier:referenceIdentifier:editorialCardIdentifier:markerType:referenceType:displayStyle:reason:planMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(unsigned char *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 49) = a8;
  *(unsigned char *)(a9 + 50) = a10;
  *(void *)(a9 + 56) = a11;
  *(void *)(a9 + 64) = a12;
  uint64_t v13 = a9 + *(int *)(type metadata accessor for CanvasPlaceholder() + 44);
  return sub_24EFA2970(a13, v13);
}

uint64_t sub_24EFA2970(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlanMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24EFA29D4(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0x795472656B72616DLL;
      break;
    case 4:
      unint64_t result = 0x636E657265666572;
      break;
    case 5:
      unint64_t result = 0x5379616C70736964;
      break;
    case 6:
      unint64_t result = 0x6E6F73616572;
      break;
    case 7:
      unint64_t result = 0x6174654D6E616C70;
      break;
    default:
      unint64_t result = 0x696669746E656469;
      break;
  }
  return result;
}

BOOL sub_24EFA2B00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24EFA2B14()
{
  return sub_24EFED980();
}

uint64_t sub_24EFA2B5C()
{
  return sub_24EFED950();
}

uint64_t sub_24EFA2B88()
{
  return sub_24EFED980();
}

unint64_t sub_24EFA2BCC()
{
  return sub_24EFA29D4(*v0);
}

uint64_t sub_24EFA2BD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFA3D58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFA2BFC()
{
  return 0;
}

void sub_24EFA2C08(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_24EFA2C14(uint64_t a1)
{
  unint64_t v2 = sub_24EFA3004();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFA2C50(uint64_t a1)
{
  unint64_t v2 = sub_24EFA3004();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CanvasPlaceholder.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8950);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFA3004();
  sub_24EFED9A0();
  v10[15] = 0;
  sub_24EFED860();
  if (!v2)
  {
    v10[14] = 1;
    sub_24EFED860();
    v10[13] = 2;
    sub_24EFED830();
    v10[12] = v3[48];
    v10[11] = 3;
    sub_24EFA3058();
    sub_24EFED850();
    v10[10] = v3[49];
    v10[9] = 4;
    sub_24EFA30AC();
    sub_24EFED8A0();
    v10[8] = v3[50];
    v10[7] = 5;
    sub_24EFA3100();
    sub_24EFED8A0();
    v10[6] = 6;
    sub_24EFED830();
    type metadata accessor for CanvasPlaceholder();
    v10[5] = 7;
    type metadata accessor for PlanMetadata();
    sub_24EFA4358(&qword_26B1E86B0, (void (*)(uint64_t))type metadata accessor for PlanMetadata);
    sub_24EFED8A0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24EFA3004()
{
  unint64_t result = qword_26B1E86E0;
  if (!qword_26B1E86E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E86E0);
  }
  return result;
}

unint64_t sub_24EFA3058()
{
  unint64_t result = qword_26B1E8708;
  if (!qword_26B1E8708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8708);
  }
  return result;
}

unint64_t sub_24EFA30AC()
{
  unint64_t result = qword_26B1E8758;
  if (!qword_26B1E8758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8758);
  }
  return result;
}

unint64_t sub_24EFA3100()
{
  unint64_t result = qword_26B1E8658;
  if (!qword_26B1E8658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8658);
  }
  return result;
}

uint64_t CanvasPlaceholder.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for PlanMetadata();
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997DA8);
  uint64_t v24 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  MEMORY[0x270FA5388]();
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CanvasPlaceholder();
  MEMORY[0x270FA5388]();
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  v26 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_24EFA3004();
  uint64_t v13 = v27;
  sub_24EFED990();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  v22[1] = v3;
  v27 = v5;
  uint64_t v14 = v24;
  uint64_t v15 = v25;
  char v38 = 0;
  *(void *)v11 = sub_24EFED7C0();
  *((void *)v11 + 1) = v16;
  char v37 = 1;
  *((void *)v11 + 2) = sub_24EFED7C0();
  *((void *)v11 + 3) = v17;
  char v36 = 2;
  *((void *)v11 + 4) = sub_24EFED790();
  *((void *)v11 + 5) = v18;
  char v34 = 3;
  sub_24EFA36BC();
  sub_24EFED7B0();
  v11[48] = v35;
  char v32 = 4;
  sub_24EFA3710();
  sub_24EFED800();
  v11[49] = v33;
  char v30 = 5;
  sub_24EFA3764();
  sub_24EFED800();
  v11[50] = v31;
  char v29 = 6;
  *((void *)v11 + 7) = sub_24EFED790();
  *((void *)v11 + 8) = v19;
  char v28 = 7;
  sub_24EFA4358(&qword_269997DC8, (void (*)(uint64_t))type metadata accessor for PlanMetadata);
  uint64_t v20 = (uint64_t)v27;
  sub_24EFED800();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  sub_24EFA2970(v20, (uint64_t)&v11[*(int *)(v9 + 44)]);
  sub_24EFA37B8((uint64_t)v11, v23, (uint64_t (*)(void))type metadata accessor for CanvasPlaceholder);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return sub_24EFA3820((uint64_t)v11);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_24EFA36BC()
{
  unint64_t result = qword_269997DB0;
  if (!qword_269997DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997DB0);
  }
  return result;
}

unint64_t sub_24EFA3710()
{
  unint64_t result = qword_269997DB8;
  if (!qword_269997DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997DB8);
  }
  return result;
}

unint64_t sub_24EFA3764()
{
  unint64_t result = qword_269997DC0;
  if (!qword_269997DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997DC0);
  }
  return result;
}

uint64_t sub_24EFA37B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24EFA3820(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CanvasPlaceholder();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24EFA387C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CanvasPlaceholder.init(from:)(a1, a2);
}

uint64_t sub_24EFA3894(void *a1)
{
  return CanvasPlaceholder.encode(to:)(a1);
}

uint64_t CanvasPlaceholder.hash(into:)()
{
  uint64_t v1 = sub_24EFECFB0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PlanMetadata();
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40))
  {
    sub_24EFED960();
    swift_bridgeObjectRetain();
    sub_24EFED560();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24EFED960();
  }
  if (*(unsigned char *)(v0 + 48) == 2)
  {
    sub_24EFED960();
  }
  else
  {
    sub_24EFED960();
    sub_24EFED560();
    swift_bridgeObjectRelease();
  }
  sub_24EFED560();
  swift_bridgeObjectRelease();
  DisplayStyle.rawValue.getter(*(unsigned char *)(v0 + 50));
  sub_24EFED560();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 64))
  {
    sub_24EFED960();
    swift_bridgeObjectRetain();
    sub_24EFED560();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24EFED960();
  }
  uint64_t v7 = type metadata accessor for CanvasPlaceholder();
  sub_24EFA37B8(v0 + *(int *)(v7 + 44), (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for PlanMetadata);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) == 1) {
    return sub_24EFED950();
  }
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v6, v1);
  sub_24EFED950();
  sub_24EFA4358((unint64_t *)&qword_269997DD0, MEMORY[0x263F07508]);
  sub_24EFED500();
  sub_24EFED960();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t CanvasPlaceholder.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t sub_24EFA3CD4()
{
  return sub_24EFED980();
}

uint64_t sub_24EFA3D18()
{
  return sub_24EFED980();
}

uint64_t sub_24EFA3D58(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024EFF49F0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024EFF4A10 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x795472656B72616DLL && a2 == 0xEA00000000006570 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x636E657265666572 && a2 == 0xED00006570795465 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x5379616C70736964 && a2 == 0xEC000000656C7974 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6174654D6E616C70 && a2 == 0xEC00000061746164)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v5 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t _s13FitnessForYou17CanvasPlaceholderV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (!v4 && (sub_24EFED8B0() & 1) == 0) {
    return 0;
  }
  BOOL v5 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
  if (!v5 && (sub_24EFED8B0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a2 + 40);
  if (v6)
  {
    if (!v7 || (*(void *)(a1 + 32) != *(void *)(a2 + 32) || v6 != v7) && (sub_24EFED8B0() & 1) == 0) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  int v8 = *(unsigned __int8 *)(a1 + 48);
  int v9 = *(unsigned __int8 *)(a2 + 48);
  if (v8 == 2)
  {
    if (v9 != 2) {
      return 0;
    }
  }
  else
  {
    if (v9 == 2) {
      return 0;
    }
    if (v8) {
      unint64_t v10 = 0xD000000000000018;
    }
    else {
      unint64_t v10 = 0x737543646C697562;
    }
    if (v8) {
      unint64_t v11 = 0x800000024EFF4970;
    }
    else {
      unint64_t v11 = 0xEF6E616C506D6F74;
    }
    if (v9) {
      unint64_t v12 = 0xD000000000000018;
    }
    else {
      unint64_t v12 = 0x737543646C697562;
    }
    if (v9) {
      unint64_t v13 = 0x800000024EFF4970;
    }
    else {
      unint64_t v13 = 0xEF6E616C506D6F74;
    }
    if (v10 == v12 && v11 == v13)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v14 = sub_24EFED8B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        return 0;
      }
    }
  }
  if ((sub_24EFD8D14(*(unsigned char *)(a1 + 49), *(unsigned char *)(a2 + 49)) & 1) == 0) {
    return 0;
  }
  char v15 = *(unsigned char *)(a2 + 50);
  uint64_t v16 = DisplayStyle.rawValue.getter(*(unsigned char *)(a1 + 50));
  uint64_t v18 = v17;
  if (v16 == DisplayStyle.rawValue.getter(v15) && v18 == v19)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v20 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v22 = *(void *)(a2 + 64);
  if (!v21)
  {
    if (!v22) {
      goto LABEL_48;
    }
    return 0;
  }
  if (!v22 || (*(void *)(a1 + 56) != *(void *)(a2 + 56) || v21 != v22) && (sub_24EFED8B0() & 1) == 0) {
    return 0;
  }
LABEL_48:
  uint64_t v23 = *(int *)(type metadata accessor for CanvasPlaceholder() + 44);
  return _s13FitnessForYou12PlanMetadataO2eeoiySbAC_ACtFZ_0(a1 + v23, a2 + v23);
}

uint64_t sub_24EFA4310()
{
  return sub_24EFA4358(&qword_26B1E8700, (void (*)(uint64_t))type metadata accessor for CanvasPlaceholder);
}

uint64_t sub_24EFA4358(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CanvasPlaceholder(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *(void *)a1 = *a2;
    a1 = v15 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v7;
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    *(_WORD *)(a1 + 49) = *(_WORD *)((char *)a2 + 49);
    uint64_t v8 = a2[8];
    uint64_t v9 = *(int *)(a3 + 44);
    unint64_t v10 = (char *)a2 + v9;
    unint64_t v11 = (void *)(a1 + v9);
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
    {
      uint64_t v14 = type metadata accessor for PlanMetadata();
      memcpy(v11, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v16 = sub_24EFECFB0();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v11, v10, v16);
      *((unsigned char *)v11 + *(int *)(v12 + 48)) = v10[*(int *)(v12 + 48)];
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for CanvasPlaceholder(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = sub_24EFECFB0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v4, v7);
  }
  return result;
}

uint64_t initializeWithCopy for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  uint64_t v7 = *(void *)(a2 + 64);
  uint64_t v8 = *(int *)(a3 + 44);
  uint64_t v9 = (const void *)(a2 + v8);
  unint64_t v10 = (void *)(a1 + v8);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
  {
    uint64_t v13 = type metadata accessor for PlanMetadata();
    memcpy(v10, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = sub_24EFECFB0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v9, v14);
    *((unsigned char *)v10 + *(int *)(v11 + 48)) = *((unsigned char *)v9 + *(int *)(v11 + 48));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 44);
  uint64_t v7 = (unsigned char *)(a1 + v6);
  uint64_t v8 = (unsigned char *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      uint64_t v17 = sub_24EFECFB0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 24))(v7, v8, v17);
      v7[*(int *)(v9 + 48)] = v8[*(int *)(v9 + 48)];
      return a1;
    }
    sub_24EFA4A24((uint64_t)v7);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v15 = type metadata accessor for PlanMetadata();
    memcpy(v7, v8, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  uint64_t v14 = sub_24EFECFB0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 16))(v7, v8, v14);
  v7[*(int *)(v9 + 48)] = v8[*(int *)(v9 + 48)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t sub_24EFA4A24(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  uint64_t v5 = *(int *)(a3 + 44);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = type metadata accessor for PlanMetadata();
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_24EFECFB0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v6, v7, v11);
    *((unsigned char *)v6 + *(int *)(v8 + 48)) = *((unsigned char *)v7 + *(int *)(v8 + 48));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 44);
  uint64_t v11 = (unsigned char *)(a1 + v10);
  int v12 = (unsigned char *)(a2 + v10);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      uint64_t v21 = sub_24EFECFB0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v21 - 8) + 40))(v11, v12, v21);
      v11[*(int *)(v13 + 48)] = v12[*(int *)(v13 + 48)];
      return a1;
    }
    sub_24EFA4A24((uint64_t)v11);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v19 = type metadata accessor for PlanMetadata();
    memcpy(v11, v12, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  uint64_t v18 = sub_24EFECFB0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v18 - 8) + 32))(v11, v12, v18);
  v11[*(int *)(v13 + 48)] = v12[*(int *)(v13 + 48)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EFA4E00);
}

uint64_t sub_24EFA4E00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for PlanMetadata();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for CanvasPlaceholder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EFA4EC4);
}

uint64_t sub_24EFA4EC4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for PlanMetadata();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24EFA4F6C()
{
  uint64_t result = type metadata accessor for PlanMetadata();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24EFA503C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24EFA505C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  if (!qword_269997DD8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269997DD8);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CanvasPlaceholder.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CanvasPlaceholder.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *__n128 result = a2 + 7;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFA5244);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_24EFA526C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24EFA5278(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CanvasPlaceholder.CodingKeys()
{
  return &type metadata for CanvasPlaceholder.CodingKeys;
}

unint64_t sub_24EFA5294()
{
  unint64_t result = qword_269997DE0;
  if (!qword_269997DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997DE0);
  }
  return result;
}

unint64_t sub_24EFA52EC()
{
  unint64_t result = qword_26B1E86F0;
  if (!qword_26B1E86F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E86F0);
  }
  return result;
}

unint64_t sub_24EFA5344()
{
  unint64_t result = qword_26B1E86E8;
  if (!qword_26B1E86E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E86E8);
  }
  return result;
}

uint64_t sub_24EFA5398()
{
  uint64_t v0 = sub_24EFED020();
  __swift_allocate_value_buffer(v0, qword_26B1EB990);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1EB990);
  return sub_24EFED010();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL static DeviceType.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24EFA54C8(char a1)
{
  return *(void *)&aPhone_0[8 * a1];
}

uint64_t sub_24EFA54F0()
{
  return sub_24EFA54C8(*v0);
}

uint64_t sub_24EFA54F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFA5E88(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EFA5520(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24EFA552C(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5C14();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFA5568(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5C14();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFA55A4()
{
  return 0;
}

void sub_24EFA55B0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24EFA55BC(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5D64();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFA55F8(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5D64();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFA5634(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5CBC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFA5670(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5CBC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFA56AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24EFA56DC(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5C68();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFA5718(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5C68();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFA5754(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5D10();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFA5790(uint64_t a1)
{
  unint64_t v2 = sub_24EFA5D10();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DeviceType.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997DE8);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  MEMORY[0x270FA5388]();
  char v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997DF0);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v25 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997DF8);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997E00);
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  int v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997E08);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388]();
  int v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFA5C14();
  sub_24EFED9A0();
  switch((char)v31)
  {
    case 1:
      char v33 = 1;
      sub_24EFA5D10();
      sub_24EFED820();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
      break;
    case 2:
      char v34 = 2;
      sub_24EFA5CBC();
      int v17 = v25;
      sub_24EFED820();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
      goto LABEL_5;
    case 3:
      char v35 = 3;
      sub_24EFA5C68();
      int v17 = v28;
      sub_24EFED820();
      uint64_t v19 = v29;
      uint64_t v18 = v30;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_24EFA5D64();
      sub_24EFED820();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

unint64_t sub_24EFA5C14()
{
  unint64_t result = qword_269997E10;
  if (!qword_269997E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E10);
  }
  return result;
}

unint64_t sub_24EFA5C68()
{
  unint64_t result = qword_269997E18;
  if (!qword_269997E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E18);
  }
  return result;
}

unint64_t sub_24EFA5CBC()
{
  unint64_t result = qword_269997E20;
  if (!qword_269997E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E20);
  }
  return result;
}

unint64_t sub_24EFA5D10()
{
  unint64_t result = qword_269997E28;
  if (!qword_269997E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E28);
  }
  return result;
}

unint64_t sub_24EFA5D64()
{
  unint64_t result = qword_269997E30;
  if (!qword_269997E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E30);
  }
  return result;
}

char *DeviceType.init(from:)(void *a1)
{
  return sub_24EFA5FFC(a1);
}

char *sub_24EFA5DD0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24EFA5FFC(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24EFA5DFC(void *a1)
{
  return DeviceType.encode(to:)(a1, *v1);
}

uint64_t DeviceType.hash(into:)()
{
  return sub_24EFED950();
}

uint64_t DeviceType.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t sub_24EFA5E88(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656E6F6870 && a2 == 0xE500000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6863746177 && a2 == 0xE500000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74656C626174 && a2 == 0xE600000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 30324 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

char *sub_24EFA5FFC(void *a1)
{
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997E98);
  uint64_t v45 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388]();
  v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997EA0);
  uint64_t v42 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388]();
  v43 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997EA8);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  MEMORY[0x270FA5388]();
  char v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997EB0);
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997EB8);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_24EFA5C14();
  uint64_t v15 = v47;
  sub_24EFED990();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v35 = v7;
  char v36 = v9;
  int v16 = v43;
  int v17 = v44;
  uint64_t v47 = 0;
  uint64_t v18 = v45;
  uint64_t v19 = v11;
  char v20 = v13;
  uint64_t v21 = sub_24EFED810();
  uint64_t v22 = (char *)v21;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v25 = sub_24EFED6C0();
    swift_allocError();
    uint64_t v13 = v22;
    uint64_t v26 = v10;
    char v28 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
    *char v28 = &type metadata for DeviceType;
    sub_24EFED780();
    sub_24EFED6B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v28, *MEMORY[0x263F8DCB0], v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v26);
LABEL_7:
    uint64_t v29 = (uint64_t)v46;
    goto LABEL_8;
  }
  uint64_t v13 = (char *)*(unsigned __int8 *)(v21 + 32);
  switch(*(unsigned char *)(v21 + 32))
  {
    case 1:
      char v49 = 1;
      sub_24EFA5D10();
      uint64_t v31 = v47;
      sub_24EFED770();
      if (v31) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
      goto LABEL_14;
    case 2:
      char v50 = 2;
      sub_24EFA5CBC();
      uint64_t v32 = v47;
      sub_24EFED770();
      if (v32) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v40);
      goto LABEL_14;
    case 3:
      char v51 = 3;
      sub_24EFA5C68();
      uint64_t v33 = v47;
      sub_24EFED770();
      if (v33) {
        goto LABEL_14;
      }
      (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
    default:
      char v48 = 0;
      sub_24EFA5D64();
      uint64_t v23 = v36;
      uint64_t v24 = v47;
      sub_24EFED770();
      if (v24)
      {
LABEL_12:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v35);
LABEL_14:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
  }
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(v29);
  return v13;
}

unint64_t sub_24EFA6638()
{
  unint64_t result = qword_269997E38;
  if (!qword_269997E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E38);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceType()
{
  return &type metadata for DeviceType;
}

uint64_t getEnumTagSinglePayload for ForYouAction.LoadedCodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s13FitnessForYou10DeviceTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFA6800);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceType.CodingKeys()
{
  return &type metadata for DeviceType.CodingKeys;
}

ValueMetadata *type metadata accessor for DeviceType.PhoneCodingKeys()
{
  return &type metadata for DeviceType.PhoneCodingKeys;
}

ValueMetadata *type metadata accessor for DeviceType.WatchCodingKeys()
{
  return &type metadata for DeviceType.WatchCodingKeys;
}

ValueMetadata *type metadata accessor for DeviceType.TabletCodingKeys()
{
  return &type metadata for DeviceType.TabletCodingKeys;
}

ValueMetadata *type metadata accessor for DeviceType.TvCodingKeys()
{
  return &type metadata for DeviceType.TvCodingKeys;
}

unint64_t sub_24EFA687C()
{
  unint64_t result = qword_269997E40;
  if (!qword_269997E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E40);
  }
  return result;
}

unint64_t sub_24EFA68D4()
{
  unint64_t result = qword_269997E48;
  if (!qword_269997E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E48);
  }
  return result;
}

unint64_t sub_24EFA692C()
{
  unint64_t result = qword_269997E50;
  if (!qword_269997E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E50);
  }
  return result;
}

unint64_t sub_24EFA6984()
{
  unint64_t result = qword_269997E58;
  if (!qword_269997E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E58);
  }
  return result;
}

unint64_t sub_24EFA69DC()
{
  unint64_t result = qword_269997E60;
  if (!qword_269997E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E60);
  }
  return result;
}

unint64_t sub_24EFA6A34()
{
  unint64_t result = qword_269997E68;
  if (!qword_269997E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E68);
  }
  return result;
}

unint64_t sub_24EFA6A8C()
{
  unint64_t result = qword_269997E70;
  if (!qword_269997E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E70);
  }
  return result;
}

unint64_t sub_24EFA6AE4()
{
  unint64_t result = qword_269997E78;
  if (!qword_269997E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E78);
  }
  return result;
}

unint64_t sub_24EFA6B3C()
{
  unint64_t result = qword_269997E80;
  if (!qword_269997E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E80);
  }
  return result;
}

unint64_t sub_24EFA6B94()
{
  unint64_t result = qword_269997E88;
  if (!qword_269997E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E88);
  }
  return result;
}

unint64_t sub_24EFA6BEC()
{
  unint64_t result = qword_269997E90;
  if (!qword_269997E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997E90);
  }
  return result;
}

BOOL static ForYouError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ForYouError.hash(into:)()
{
  return sub_24EFED950();
}

uint64_t ForYouError.hashValue.getter()
{
  return sub_24EFED980();
}

unint64_t sub_24EFA6CE0()
{
  unint64_t result = qword_269997EC8;
  if (!qword_269997EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997EC8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ForYouError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ForYouError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFA6EA0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouError()
{
  return &type metadata for ForYouError;
}

__n128 ForYouEnvironment.init(fetchSectionDescriptors:makeAchievementEnvironmentCacheUpdatedStream:makeActiveWorkoutPlanUpdatedStream:makeAllowedContentRatingsUpdatedStream:makeAppDidBecomeActiveStream:makeBrowsingIdentityUpdatedStream:makeCatalogDeletedStream:makeContentAvailabilityStream:makeNetworkConditionsUpdatedStream:makeOnboardingSurveyResultsUpdatedStream:makePersonalizationPrivacyPreferenceUpdatedStream:makeSignificantTimeChangeStream:makeWheelchairStatusUpdatedStream:navigateToExplore:presentToastIfNeeded:queryActiveParticipantDeviceType:refreshCanvas:reloadCanvas:requirePersonalizationSupported:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, long long a11, long long a12, long long a13, long long a14, long long a15, long long a16, long long a17, long long a18, long long a19, long long a20,long long a21,long long a22,__n128 a23,uint64_t a24,uint64_t a25)
{
  __n128 result = a23;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(_OWORD *)(a9 + 96) = a12;
  *(_OWORD *)(a9 + 112) = a13;
  *(_OWORD *)(a9 + 128) = a14;
  *(_OWORD *)(a9 + 144) = a15;
  *(_OWORD *)(a9 + 160) = a16;
  *(_OWORD *)(a9 + 176) = a17;
  *(_OWORD *)(a9 + 192) = a18;
  *(_OWORD *)(a9 + 208) = a19;
  *(_OWORD *)(a9 + 224) = a20;
  *(_OWORD *)(a9 + 240) = a21;
  *(_OWORD *)(a9 + 256) = a22;
  *(__n128 *)(a9 + 272) = a23;
  *(void *)(a9 + 288) = a24;
  *(void *)(a9 + 296) = a25;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AwardCanvasPlaceholder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ForYouEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ForYouEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  uint64_t v3 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = v3;
  uint64_t v4 = *(void *)(a2 + 288);
  uint64_t v5 = *(void *)(a2 + 296);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = v4;
  *(void *)(a1 + 296) = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ForYouEnvironment(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_retain();
  swift_release();
  uint64_t v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  swift_retain();
  swift_release();
  uint64_t v13 = a2[19];
  a1[18] = a2[18];
  a1[19] = v13;
  swift_retain();
  swift_release();
  uint64_t v14 = a2[21];
  a1[20] = a2[20];
  a1[21] = v14;
  swift_retain();
  swift_release();
  uint64_t v15 = a2[23];
  a1[22] = a2[22];
  a1[23] = v15;
  swift_retain();
  swift_release();
  uint64_t v16 = a2[25];
  a1[24] = a2[24];
  a1[25] = v16;
  swift_retain();
  swift_release();
  uint64_t v17 = a2[27];
  a1[26] = a2[26];
  a1[27] = v17;
  swift_retain();
  swift_release();
  uint64_t v18 = a2[29];
  a1[28] = a2[28];
  a1[29] = v18;
  swift_retain();
  swift_release();
  uint64_t v19 = a2[31];
  a1[30] = a2[30];
  a1[31] = v19;
  swift_retain();
  swift_release();
  uint64_t v20 = a2[33];
  a1[32] = a2[32];
  a1[33] = v20;
  swift_retain();
  swift_release();
  uint64_t v21 = a2[35];
  a1[34] = a2[34];
  a1[35] = v21;
  swift_retain();
  swift_release();
  uint64_t v22 = a2[37];
  a1[36] = a2[36];
  a1[37] = v22;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy304_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x130uLL);
}

_OWORD *assignWithTake for ForYouEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  a1[6] = a2[6];
  swift_release();
  a1[7] = a2[7];
  swift_release();
  a1[8] = a2[8];
  swift_release();
  a1[9] = a2[9];
  swift_release();
  a1[10] = a2[10];
  swift_release();
  a1[11] = a2[11];
  swift_release();
  a1[12] = a2[12];
  swift_release();
  a1[13] = a2[13];
  swift_release();
  a1[14] = a2[14];
  swift_release();
  a1[15] = a2[15];
  swift_release();
  a1[16] = a2[16];
  swift_release();
  a1[17] = a2[17];
  swift_release();
  a1[18] = a2[18];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouEnvironment(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 304)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 296) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 304) = 1;
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
    *(unsigned char *)(result + 304) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouEnvironment()
{
  return &type metadata for ForYouEnvironment;
}

uint64_t DisplayStyle.rawValue.getter(char a1)
{
  uint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x427472616863;
      goto LABEL_19;
    case 2:
      uint64_t result = 0x6C6573756F726163;
      break;
    case 3:
      uint64_t result = 0x656C63726963;
      break;
    case 4:
      uint64_t result = 0x4263696D616E7964;
      break;
    case 5:
      return result;
    case 6:
      uint64_t result = 0x6369724264697267;
      break;
    case 7:
      uint64_t result = 0x7552646564697567;
      break;
    case 8:
      uint64_t result = 0x6157646564697567;
      break;
    case 9:
      uint64_t result = 0x427972617262696CLL;
      break;
    case 10:
      uint64_t result = 0x6E6974656B72616DLL;
      break;
    case 11:
      uint64_t result = 0x7974696C61646F6DLL;
      break;
    case 12:
      uint64_t result = 0xD000000000000011;
      break;
    case 13:
      uint64_t result = 0xD000000000000012;
      break;
    case 14:
      uint64_t result = 0x647261646E617473;
      break;
    case 15:
      uint64_t v3 = 0x426F65646976;
LABEL_19:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6972000000000000;
      break;
    default:
      uint64_t result = 0x736472617761;
      break;
  }
  return result;
}

uint64_t sub_24EFA7868(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = DisplayStyle.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == DisplayStyle.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24EFED8B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24EFA78F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s13FitnessForYou12DisplayStyleO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_24EFA7924@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DisplayStyle.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24EFA7950()
{
  return sub_24EFED590();
}

uint64_t sub_24EFA79B0()
{
  return sub_24EFED580();
}

uint64_t sub_24EFA7A00()
{
  char v1 = *v0;
  sub_24EFED940();
  DisplayStyle.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t sub_24EFA7A64()
{
  DisplayStyle.rawValue.getter(*v0);
  sub_24EFED560();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFA7AB8()
{
  char v1 = *v0;
  sub_24EFED940();
  DisplayStyle.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t _s13FitnessForYou12DisplayStyleO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_24EFED760();
  swift_bridgeObjectRelease();
  if (v0 >= 0x10) {
    return 16;
  }
  else {
    return v0;
  }
}

unint64_t sub_24EFA7B68()
{
  unint64_t result = qword_26B1E8660;
  if (!qword_26B1E8660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8660);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DisplayStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF1) {
    goto LABEL_17;
  }
  if (a2 + 15 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 15) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 15;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 15;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 15;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x10;
  int v8 = v6 - 16;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DisplayStyle(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 15 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 15) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF0)
  {
    unsigned int v6 = ((a2 - 241) >> 8) + 1;
    *unint64_t result = a2 + 15;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFA7D18);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 15;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisplayStyle()
{
  return &type metadata for DisplayStyle;
}

unint64_t sub_24EFA7D50()
{
  unint64_t result = qword_26B1E8668;
  if (!qword_26B1E8668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8668);
  }
  return result;
}

void __swiftcall SectionDescriptors.init(awardDescriptors:forYouDescriptors:recoId:requestStartTime:responseEndTime:)(FitnessForYou::SectionDescriptors *__return_ptr retstr, Swift::OpaquePointer awardDescriptors, Swift::OpaquePointer forYouDescriptors, Swift::String recoId, Swift::Double requestStartTime, Swift::Double responseEndTime)
{
  retstr->awardDescriptors = awardDescriptors;
  retstr->forYouDescriptors = forYouDescriptors;
  retstr->recoId = recoId;
  retstr->requestStartTime = requestStartTime;
  retstr->responseEndTime = responseEndTime;
}

unint64_t sub_24EFA7DB4(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x64496F636572;
      break;
    case 4:
      unint64_t result = 0x65736E6F70736572;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24EFA7E64()
{
  return sub_24EFA7DB4(*v0);
}

uint64_t sub_24EFA7E6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFA9928(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EFA7E94(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24EFA7EA0(uint64_t a1)
{
  unint64_t v2 = sub_24EFA81D0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFA7EDC(uint64_t a1)
{
  unint64_t v2 = sub_24EFA81D0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SectionDescriptors.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997ED0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  v11[1] = v1[2];
  uint64_t v12 = v8;
  v11[0] = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFA81D0();
  sub_24EFED9A0();
  uint64_t v14 = v9;
  char v13 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8888);
  sub_24EFA8768(&qword_26B1E8890, &qword_26B1E8888, (void (*)(void))sub_24EFA826C);
  sub_24EFED8A0();
  if (!v2)
  {
    uint64_t v14 = v12;
    char v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8878);
    sub_24EFA8768(&qword_26B1E8880, &qword_26B1E8878, (void (*)(void))sub_24EFA82C0);
    sub_24EFED8A0();
    LOBYTE(v14) = 2;
    sub_24EFED860();
    LOBYTE(v14) = 3;
    sub_24EFED880();
    LOBYTE(v14) = 4;
    sub_24EFED880();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24EFA81D0()
{
  unint64_t result = qword_269997ED8;
  if (!qword_269997ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997ED8);
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

unint64_t sub_24EFA826C()
{
  unint64_t result = qword_26B1E8780;
  if (!qword_26B1E8780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8780);
  }
  return result;
}

unint64_t sub_24EFA82C0()
{
  unint64_t result = qword_26B1E8750;
  if (!qword_26B1E8750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8750);
  }
  return result;
}

uint64_t SectionDescriptors.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997EE0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFA81D0();
  sub_24EFED990();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8888);
  char v22 = 0;
  sub_24EFA8768(&qword_269997EE8, &qword_26B1E8888, (void (*)(void))sub_24EFA8714);
  sub_24EFED800();
  uint64_t v9 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8878);
  char v22 = 1;
  sub_24EFA8768(&qword_269997EF8, &qword_26B1E8878, (void (*)(void))sub_24EFA87D4);
  swift_bridgeObjectRetain();
  sub_24EFED800();
  uint64_t v20 = v9;
  uint64_t v10 = v23;
  LOBYTE(v23) = 2;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_24EFED7C0();
  LOBYTE(v23) = 3;
  uint64_t v21 = v11;
  swift_bridgeObjectRetain();
  sub_24EFED7E0();
  uint64_t v13 = v12;
  LOBYTE(v23) = 4;
  sub_24EFED7E0();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v17 = v19;
  *a2 = v20;
  a2[1] = v10;
  uint64_t v18 = v21;
  a2[2] = v17;
  a2[3] = v18;
  a2[4] = v13;
  a2[5] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_24EFA8714()
{
  unint64_t result = qword_269997EF0;
  if (!qword_269997EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997EF0);
  }
  return result;
}

uint64_t sub_24EFA8768(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24EFA87D4()
{
  unint64_t result = qword_269997F00;
  if (!qword_269997F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F00);
  }
  return result;
}

uint64_t sub_24EFA8828@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return SectionDescriptors.init(from:)(a1, a2);
}

uint64_t sub_24EFA8840(void *a1)
{
  return SectionDescriptors.encode(to:)(a1);
}

uint64_t SectionDescriptors.hash(into:)(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  swift_bridgeObjectRetain();
  sub_24EFA9248(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v3 + 16);
  sub_24EFED950();
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    do
    {
      CanvasSectionDescriptor.hash(into:)(a1);
      v6 += 104;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  sub_24EFED970();
  return sub_24EFED970();
}

uint64_t SectionDescriptors.hashValue.getter()
{
  uint64_t v1 = *((void *)v0 + 2);
  uint64_t v2 = *((void *)v0 + 3);
  long long v5 = *v0;
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  long long v8 = v0[2];
  sub_24EFED940();
  SectionDescriptors.hash(into:)((uint64_t)v4);
  return sub_24EFED980();
}

uint64_t sub_24EFA89E4()
{
  uint64_t v1 = *((void *)v0 + 2);
  uint64_t v2 = *((void *)v0 + 3);
  long long v5 = *v0;
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  long long v8 = v0[2];
  sub_24EFED940();
  SectionDescriptors.hash(into:)((uint64_t)v4);
  return sub_24EFED980();
}

uint64_t sub_24EFA8A44()
{
  uint64_t v1 = *((void *)v0 + 2);
  uint64_t v2 = *((void *)v0 + 3);
  long long v5 = *v0;
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  long long v8 = v0[2];
  sub_24EFED940();
  SectionDescriptors.hash(into:)((uint64_t)v4);
  return sub_24EFED980();
}

uint64_t sub_24EFA8AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_24EFED950();
  if (v3)
  {
    long long v5 = (unsigned __int8 *)(a2 + 64);
    do
    {
      int v6 = *v5;
      swift_bridgeObjectRetain();
      sub_24EFED560();
      sub_24EFED560();
      swift_bridgeObjectRelease();
      sub_24EFED960();
      if (v6 != 1) {
        sub_24EFED970();
      }
      uint64_t result = swift_bridgeObjectRelease();
      v5 += 40;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_24EFA8B90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_24EFECFB0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  int v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PlanMetadata();
  MEMORY[0x270FA5388]();
  long long v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for CanvasPlaceholder();
  uint64_t v9 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a2 + 16);
  uint64_t result = sub_24EFED950();
  if (v12)
  {
    uint64_t v14 = a2 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v15 = *(void *)(v9 + 72);
    uint64_t v18 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v19 = (void (**)(char *, char *, uint64_t))(v4 + 32);
    uint64_t v20 = "k";
    uint64_t v21 = v15;
    v17[0] = "smallDynamicBrick";
    v17[1] = "arketing";
    v17[2] = 0x800000024EFF4970;
    do
    {
      sub_24EFA9B38(v14, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for CanvasPlaceholder);
      swift_bridgeObjectRetain();
      sub_24EFED560();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24EFED560();
      swift_bridgeObjectRelease();
      if (*((void *)v11 + 5))
      {
        sub_24EFED960();
        swift_bridgeObjectRetain();
        sub_24EFED560();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_24EFED960();
      }
      if (v11[48] == 2)
      {
        sub_24EFED960();
      }
      else
      {
        sub_24EFED960();
        sub_24EFED560();
        swift_bridgeObjectRelease();
      }
      sub_24EFED560();
      swift_bridgeObjectRelease();
      sub_24EFED560();
      swift_bridgeObjectRelease();
      if (*((void *)v11 + 8))
      {
        sub_24EFED960();
        swift_bridgeObjectRetain();
        sub_24EFED560();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_24EFED960();
      }
      sub_24EFA9B38((uint64_t)&v11[*(int *)(v22 + 44)], (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for PlanMetadata);
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v8, 1, v16) == 1)
      {
        sub_24EFED950();
      }
      else
      {
        (*v19)(v6, v8, v3);
        sub_24EFED950();
        sub_24EFA9BA0();
        sub_24EFED500();
        sub_24EFED960();
        (*v18)(v6, v3);
      }
      uint64_t result = sub_24EFA3820((uint64_t)v11);
      v14 += v21;
      --v12;
    }
    while (v12);
  }
  return result;
}

uint64_t sub_24EFA9248(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t result = sub_24EFED950();
  if (v4)
  {
    int v6 = (uint64_t *)(a2 + 64);
    do
    {
      uint64_t v7 = *v6;
      v6 += 5;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24EFED560();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24EFED560();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24EFA8AA0(a1, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease_n();
      --v4;
    }
    while (v4);
  }
  return result;
}

BOOL _s13FitnessForYou18SectionDescriptorsV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  double v6 = *(double *)(a1 + 32);
  double v5 = *(double *)(a1 + 40);
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  double v11 = *(double *)(a2 + 32);
  double v10 = *(double *)(a2 + 40);
  if ((sub_24EFD904C(*(void *)a1, *(void *)a2) & 1) == 0 || (sub_24EFD91AC(v2, v7) & 1) == 0) {
    return 0;
  }
  if (v3 == v8 && v4 == v9)
  {
    if (v6 != v11) {
      return 0;
    }
    return v5 == v10;
  }
  char v13 = sub_24EFED8B0();
  BOOL result = 0;
  if ((v13 & 1) != 0 && v6 == v11) {
    return v5 == v10;
  }
  return result;
}

unint64_t sub_24EFA93FC()
{
  unint64_t result = qword_269997F08;
  if (!qword_269997F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F08);
  }
  return result;
}

uint64_t destroy for SectionDescriptors()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SectionDescriptors(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SectionDescriptors(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SectionDescriptors(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SectionDescriptors(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SectionDescriptors(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SectionDescriptors()
{
  return &type metadata for SectionDescriptors;
}

uint64_t getEnumTagSinglePayload for PersonalizationInferenceRequestTrigger(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SectionDescriptors.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *__n128 result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFA97E8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SectionDescriptors.CodingKeys()
{
  return &type metadata for SectionDescriptors.CodingKeys;
}

unint64_t sub_24EFA9824()
{
  unint64_t result = qword_269997F10;
  if (!qword_269997F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F10);
  }
  return result;
}

unint64_t sub_24EFA987C()
{
  unint64_t result = qword_269997F18;
  if (!qword_269997F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F18);
  }
  return result;
}

unint64_t sub_24EFA98D4()
{
  unint64_t result = qword_269997F20;
  if (!qword_269997F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F20);
  }
  return result;
}

uint64_t sub_24EFA9928(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024EFF4A80 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EFF4AA0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64496F636572 && a2 == 0xE600000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EFF4AC0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xEF656D6954646E45)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_24EFA9B38(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_24EFA9BA0()
{
  unint64_t result = qword_269997DD0;
  if (!qword_269997DD0)
  {
    sub_24EFECFB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997DD0);
  }
  return result;
}

uint64_t ForYouLocalState.previousLoadState.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24EFA9C4C(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  return v1;
}

uint64_t sub_24EFA9C4C(uint64_t result, uint64_t a2, char a3, char a4)
{
  if (a4 != -1) {
    return sub_24EFA9C60(result, a2, a3, a4);
  }
  return result;
}

uint64_t sub_24EFA9C60(uint64_t result, uint64_t a2, char a3, char a4)
{
  if (a4 == 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  else if (!a4)
  {
    return sub_24EFA9CD8(result, a2, a3);
  }
  return result;
}

uint64_t sub_24EFA9CD8(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t ForYouLocalState.previousLoadState.setter(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result = sub_24EFA9D44(*(void *)v4, *(void *)(v4 + 8), *(void *)(v4 + 16), *(unsigned char *)(v4 + 24));
  *(void *)uint64_t v4 = a1;
  *(void *)(v4 + 8) = a2;
  *(void *)(v4 + 16) = a3;
  *(unsigned char *)(v4 + 24) = a4;
  return result;
}

uint64_t sub_24EFA9D44(uint64_t result, uint64_t a2, char a3, char a4)
{
  if (a4 != -1) {
    return sub_24EFA9D58(result, a2, a3, a4);
  }
  return result;
}

uint64_t sub_24EFA9D58(uint64_t result, uint64_t a2, char a3, char a4)
{
  if (a4 == 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (!a4)
  {
    return sub_24EFA9DD0(result, a2, a3);
  }
  return result;
}

uint64_t sub_24EFA9DD0(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*ForYouLocalState.previousLoadState.modify())()
{
  return nullsub_1;
}

void ForYouLocalState.init()(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = -1;
}

uint64_t sub_24EFA9E18()
{
  return 1;
}

uint64_t sub_24EFA9E20()
{
  return sub_24EFED980();
}

uint64_t sub_24EFA9E64()
{
  return sub_24EFED950();
}

uint64_t sub_24EFA9E8C()
{
  return sub_24EFED980();
}

unint64_t sub_24EFA9ECC()
{
  return 0xD000000000000011;
}

uint64_t sub_24EFA9EE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFAAAC8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EFA9F14(uint64_t a1)
{
  unint64_t v2 = sub_24EFAA0F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFA9F50(uint64_t a1)
{
  unint64_t v2 = sub_24EFAA0F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ForYouLocalState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997F28);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = *(_OWORD *)v1;
  uint64_t v7 = *(void *)(v1 + 16);
  char v8 = *(unsigned char *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFAA0F0();
  sub_24EFED9A0();
  v10[1] = v10[0];
  uint64_t v11 = v7;
  char v12 = v8;
  sub_24EFAA144();
  sub_24EFED850();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24EFAA0F0()
{
  unint64_t result = qword_269997F30;
  if (!qword_269997F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F30);
  }
  return result;
}

unint64_t sub_24EFAA144()
{
  unint64_t result = qword_269997F38;
  if (!qword_269997F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F38);
  }
  return result;
}

uint64_t ForYouLocalState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997F40);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFAA0F0();
  sub_24EFED990();
  if (!v2)
  {
    sub_24EFAA314();
    sub_24EFED7B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v9 = v13;
    char v10 = v14;
    *(_OWORD *)a2 = v12;
    *(void *)(a2 + 16) = v9;
    *(unsigned char *)(a2 + 24) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24EFAA314()
{
  unint64_t result = qword_269997F48;
  if (!qword_269997F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F48);
  }
  return result;
}

uint64_t sub_24EFAA368@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ForYouLocalState.init(from:)(a1, a2);
}

uint64_t sub_24EFAA380(void *a1)
{
  return ForYouLocalState.encode(to:)(a1);
}

uint64_t static ForYouLocalState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 24);
  int v3 = *(unsigned __int8 *)(a2 + 24);
  if (v2 == 255)
  {
    if (v3 == 255) {
      return 1;
    }
  }
  else if (v3 != 255)
  {
    uint64_t v4 = *(void *)a1;
    uint64_t v5 = *(void *)(a1 + 8);
    uint64_t v6 = *(void *)(a1 + 16);
    uint64_t v7 = *(void *)a2;
    uint64_t v8 = *(void *)(a2 + 8);
    uint64_t v9 = *(void *)(a2 + 16);
    sub_24EFA9C4C(*(void *)a2, v8, v9, v3);
    sub_24EFA9C4C(v4, v5, v6, v2);
    char StateO2eeoiySbAC_ACtFZ_0 = _s13FitnessForYou9LoadStateO2eeoiySbAC_ACtFZ_0(v4, v5, v6, v2, v7, v8, v9, v3);
    sub_24EFA9D44(v7, v8, v9, v3);
    sub_24EFA9D44(v4, v5, v6, v2);
    if (StateO2eeoiySbAC_ACtFZ_0) {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_24EFAA48C(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 24);
  int v3 = *(unsigned __int8 *)(a2 + 24);
  if (v2 == 255)
  {
    if (v3 == 255) {
      return 1;
    }
  }
  else if (v3 != 255)
  {
    uint64_t v4 = *(void *)a1;
    uint64_t v5 = *(void *)(a1 + 8);
    uint64_t v6 = *(void *)(a1 + 16);
    uint64_t v7 = *(void *)a2;
    uint64_t v8 = *(void *)(a2 + 8);
    uint64_t v9 = *(void *)(a2 + 16);
    sub_24EFA9C4C(*(void *)a2, v8, v9, v3);
    sub_24EFA9C4C(v4, v5, v6, v2);
    char StateO2eeoiySbAC_ACtFZ_0 = _s13FitnessForYou9LoadStateO2eeoiySbAC_ACtFZ_0(v4, v5, v6, v2, v7, v8, v9, v3);
    sub_24EFA9D44(v7, v8, v9, v3);
    sub_24EFA9D44(v4, v5, v6, v2);
    if (StateO2eeoiySbAC_ACtFZ_0) {
      return 1;
    }
  }
  return 0;
}

uint64_t destroy for ForYouLocalState(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 24);
  if (v1 != 255) {
    return sub_24EFA9D58(*(void *)result, *(void *)(result + 8), *(void *)(result + 16), v1);
  }
  return result;
}

uint64_t initializeWithCopy for ForYouLocalState(uint64_t a1, uint64_t *a2)
{
  int v3 = *((unsigned __int8 *)a2 + 24);
  if (v3 == 255)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 9) = *(_OWORD *)((char *)a2 + 9);
  }
  else
  {
    uint64_t v4 = *a2;
    uint64_t v5 = a2[1];
    uint64_t v6 = a2[2];
    sub_24EFA9C60(*a2, v5, v6, v3);
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v6;
    *(unsigned char *)(a1 + 24) = v3;
  }
  return a1;
}

uint64_t assignWithCopy for ForYouLocalState(uint64_t a1, long long *a2)
{
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (*(unsigned __int8 *)(a1 + 24) == 255)
  {
    if (v4 == 255)
    {
      long long v16 = *a2;
      *(_OWORD *)(a1 + 9) = *(long long *)((char *)a2 + 9);
      *(_OWORD *)a1 = v16;
    }
    else
    {
      uint64_t v12 = *(void *)a2;
      uint64_t v13 = *((void *)a2 + 1);
      uint64_t v14 = *((void *)a2 + 2);
      sub_24EFA9C60(*(void *)a2, v13, v14, v4);
      *(void *)a1 = v12;
      *(void *)(a1 + 8) = v13;
      *(void *)(a1 + 16) = v14;
      *(unsigned char *)(a1 + 24) = v4;
    }
  }
  else if (v4 == 255)
  {
    sub_24EFAA708(a1);
    long long v15 = *(long long *)((char *)a2 + 9);
    *(_OWORD *)a1 = *a2;
    *(_OWORD *)(a1 + 9) = v15;
  }
  else
  {
    uint64_t v5 = *(void *)a2;
    uint64_t v6 = *((void *)a2 + 1);
    uint64_t v7 = *((void *)a2 + 2);
    sub_24EFA9C60(*(void *)a2, v6, v7, v4);
    uint64_t v8 = *(void *)a1;
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v10 = *(void *)(a1 + 16);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = v7;
    char v11 = *(unsigned char *)(a1 + 24);
    *(unsigned char *)(a1 + 24) = v4;
    sub_24EFA9D58(v8, v9, v10, v11);
  }
  return a1;
}

uint64_t sub_24EFAA708(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ForYouLocalState(uint64_t a1, uint64_t a2)
{
  int v4 = *(unsigned __int8 *)(a1 + 24);
  if (v4 == 255) {
    goto LABEL_5;
  }
  int v5 = *(unsigned __int8 *)(a2 + 24);
  if (v5 == 255)
  {
    sub_24EFAA708(a1);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
    return a1;
  }
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = v5;
  sub_24EFA9D58(v7, v8, v9, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouLocalState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = (v3 ^ 0xFF) - 1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouLocalState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = ~(_BYTE)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouLocalState()
{
  return &type metadata for ForYouLocalState;
}

uint64_t getEnumTagSinglePayload for ForYouLocalState.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for ForYouLocalState.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24EFAA980);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EFAA9A8()
{
  return 0;
}

ValueMetadata *type metadata accessor for ForYouLocalState.CodingKeys()
{
  return &type metadata for ForYouLocalState.CodingKeys;
}

unint64_t sub_24EFAA9C4()
{
  unint64_t result = qword_269997F50;
  if (!qword_269997F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F50);
  }
  return result;
}

unint64_t sub_24EFAAA1C()
{
  unint64_t result = qword_269997F58;
  if (!qword_269997F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F58);
  }
  return result;
}

unint64_t sub_24EFAAA74()
{
  unint64_t result = qword_269997F60;
  if (!qword_269997F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F60);
  }
  return result;
}

uint64_t sub_24EFAAAC8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024EFF4AE0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t PersonalizationInferenceRequestTrigger.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E65704F707061;
      break;
    case 2:
      unint64_t result = 0x6F54736472617761;
      break;
    case 3:
      unint64_t result = 0x44676F6C61746163;
      break;
    case 4:
      unint64_t result = 0x616470556E616C70;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EFAAC24(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = PersonalizationInferenceRequestTrigger.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == PersonalizationInferenceRequestTrigger.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24EFED8B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24EFAACB0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s13FitnessForYou38PersonalizationInferenceRequestTriggerO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_24EFAACE0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PersonalizationInferenceRequestTrigger.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24EFAAD0C()
{
  return sub_24EFED590();
}

uint64_t sub_24EFAAD6C()
{
  return sub_24EFED580();
}

uint64_t sub_24EFAADBC()
{
  char v1 = *v0;
  sub_24EFED940();
  PersonalizationInferenceRequestTrigger.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t sub_24EFAAE20()
{
  PersonalizationInferenceRequestTrigger.rawValue.getter(*v0);
  sub_24EFED560();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFAAE74()
{
  char v1 = *v0;
  sub_24EFED940();
  PersonalizationInferenceRequestTrigger.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t _s13FitnessForYou38PersonalizationInferenceRequestTriggerO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_24EFED760();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

unint64_t sub_24EFAAF24()
{
  unint64_t result = qword_269997F68;
  if (!qword_269997F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997F68);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PersonalizationInferenceRequestTrigger(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFAB044);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PersonalizationInferenceRequestTrigger()
{
  return &type metadata for PersonalizationInferenceRequestTrigger;
}

unint64_t sub_24EFAB07C()
{
  unint64_t result = qword_26B1E8790;
  if (!qword_26B1E8790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8790);
  }
  return result;
}

uint64_t ForYouToastView.init(store:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a3 = sub_24EFAB170;
  *(void *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0x4034000000000000;
  return result;
}

uint64_t sub_24EFAB138()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24EFAB170()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t ForYouToastView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v127 = a1;
  uint64_t v122 = sub_24EFED1C0();
  MEMORY[0x270FA5388](v122);
  v121 = &v83[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_24EFED070();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v123 = v3;
  uint64_t v124 = v4;
  MEMORY[0x270FA5388](v3);
  v119 = &v83[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997F70);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v125 = v6;
  uint64_t v126 = v7;
  MEMORY[0x270FA5388](v6);
  v120 = &v83[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v114 = sub_24EFED0F0() - 8;
  MEMORY[0x270FA5388](v114);
  v113 = &v83[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_24EFED030();
  uint64_t v111 = *(void *)(v10 - 8);
  uint64_t v112 = v10;
  MEMORY[0x270FA5388](v10);
  v109 = &v83[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997F78) - 8;
  MEMORY[0x270FA5388](v101);
  v95 = &v83[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_24EFED420();
  uint64_t v99 = *(void *)(v13 - 8);
  uint64_t v100 = v13;
  MEMORY[0x270FA5388](v13);
  v97 = &v83[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997F80) - 8;
  MEMORY[0x270FA5388](v98);
  v96 = &v83[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997F88) - 8;
  MEMORY[0x270FA5388](v103);
  v102 = &v83[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997F90);
  MEMORY[0x270FA5388](v108);
  v107 = &v83[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997F98);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v115 = v18;
  uint64_t v116 = v19;
  MEMORY[0x270FA5388](v18);
  v110 = &v83[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997FA0);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v117 = v21;
  uint64_t v118 = v22;
  MEMORY[0x270FA5388](v21);
  v131 = &v83[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = *v1;
  uint64_t v105 = v1[1];
  uint64_t v106 = v24;
  int v104 = *((unsigned __int8 *)v1 + 16);
  uint64_t v25 = v1[3];
  uint64_t v89 = sub_24EFED160();
  sub_24EFABDD8((uint64_t)v139);
  uint64_t v87 = *((void *)&v139[0] + 1);
  uint64_t v88 = *(void *)&v139[0];
  char v26 = v139[1];
  uint64_t v129 = *(void *)&v139[2];
  uint64_t v130 = *((void *)&v139[1] + 1);
  LOBYTE(v24) = BYTE8(v139[2]);
  long long v27 = v139[3];
  long long v90 = v139[3];
  uint64_t v128 = *(void *)&v139[4];
  char v28 = BYTE8(v139[4]);
  int v93 = BYTE8(v139[2]);
  int v94 = BYTE8(v139[4]);
  long long v29 = v139[5];
  uint64_t v91 = *((void *)&v139[5] + 1);
  uint64_t v92 = *(void *)&v139[5];
  uint64_t v30 = *(void *)&v139[6];
  uint64_t v85 = *(void *)&v139[7];
  uint64_t v86 = *((void *)&v139[6] + 1);
  int v84 = sub_24EFED200();
  sub_24EFED430();
  char v137 = 1;
  char v136 = v26;
  char v135 = v24;
  char v134 = v28;
  char v31 = v24;
  LOBYTE(v24) = v134;
  char v138 = 1;
  sub_24EFED100();
  v139[0] = (unint64_t)v89;
  LOBYTE(v139[1]) = 1;
  *((void *)&v139[1] + 1) = v88;
  *(void *)&v139[2] = v87;
  BYTE8(v139[2]) = v26;
  *(void *)&v139[3] = v130;
  *((void *)&v139[3] + 1) = v129;
  LOBYTE(v139[4]) = v31;
  *(_OWORD *)((char *)&v139[4] + 8) = v27;
  *((void *)&v139[5] + 1) = v128;
  LOBYTE(v139[6]) = v24;
  *(_OWORD *)((char *)&v139[6] + 8) = v29;
  *((void *)&v139[7] + 1) = v30;
  *(void *)&v139[8] = v86;
  *((void *)&v139[8] + 1) = v85;
  LOBYTE(v139[9]) = v84;
  *(_OWORD *)((char *)&v139[10] + 8) = 0u;
  *(_OWORD *)((char *)&v139[9] + 8) = 0u;
  BYTE8(v139[11]) = v138;
  *(void *)&v139[12] = v140;
  BYTE8(v139[12]) = v141;
  *(void *)&v139[13] = v142;
  BYTE8(v139[13]) = v143;
  *(void *)&v139[14] = v144;
  BYTE8(v139[14]) = v145;
  *(void *)&v139[15] = v146;
  BYTE8(v139[15]) = v147;
  *(void *)&v139[16] = v148;
  BYTE8(v139[16]) = v149;
  *(void *)&v139[17] = v150;
  BYTE8(v139[17]) = v151;
  v139[18] = v152;
  uint64_t v32 = v97;
  sub_24EFED410();
  char v33 = sub_24EFED200();
  uint64_t v35 = v99;
  uint64_t v34 = v100;
  uint64_t v36 = (uint64_t)v95;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v99 + 16))(v95, v32, v100);
  *(unsigned char *)(v36 + *(int *)(v101 + 44)) = v33;
  uint64_t v37 = v96;
  sub_24EFAC754(v36, (uint64_t)&v96[*(int *)(v98 + 44)], &qword_269997F78);
  memcpy(v37, v139, 0x130uLL);
  sub_24EFAC000((uint64_t)v139);
  sub_24EFACB28(v36, &qword_269997F78);
  (*(void (**)(unsigned char *, uint64_t))(v35 + 8))(v32, v34);
  sub_24EFAC0BC(v130, v129, v93);
  swift_bridgeObjectRelease();
  sub_24EFAC0BC(*((uint64_t *)&v90 + 1), v128, v94);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v40 = v111;
  uint64_t v39 = v112;
  uint64_t v41 = v109;
  (*(void (**)(unsigned char *, void, uint64_t))(v111 + 104))(v109, *MEMORY[0x263F184F8], v112);
  uint64_t v42 = (uint64_t)v102;
  v43 = (uint64_t *)&v102[*(int *)(v103 + 44)];
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269997FA8);
  (*(void (**)(char *, unsigned char *, uint64_t))(v40 + 16))((char *)v43 + *(int *)(v44 + 28), v41, v39);
  uint64_t *v43 = KeyPath;
  sub_24EFAC754((uint64_t)v37, v42, &qword_269997F80);
  (*(void (**)(unsigned char *, uint64_t))(v40 + 8))(v41, v39);
  sub_24EFACB28((uint64_t)v37, &qword_269997F80);
  uint64_t v45 = v113;
  v46 = &v113[*(int *)(v114 + 28)];
  uint64_t v47 = *MEMORY[0x263F19860];
  uint64_t v48 = sub_24EFED170();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v48 - 8) + 104))(v46, v47, v48);
  __asm { FMOV            V0.2D, #14.0 }
  uint64_t v54 = (uint64_t)v45;
  *uint64_t v45 = _Q0;
  uint64_t v56 = (uint64_t)v107;
  uint64_t v55 = v108;
  uint64_t v57 = (uint64_t)&v107[*(int *)(v108 + 36)];
  sub_24EFAC6F0(v54, v57);
  *(_WORD *)(v57 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269997FB0) + 36)) = 256;
  uint64_t v58 = v56;
  sub_24EFAC754(v42, v56, &qword_269997F88);
  sub_24EFAC7B8(v54);
  sub_24EFACB28(v42, &qword_269997F88);
  uint64_t v59 = swift_allocObject();
  uint64_t v60 = v105;
  uint64_t v61 = v106;
  *(void *)(v59 + 16) = v106;
  *(void *)(v59 + 24) = v60;
  char v62 = v104;
  *(unsigned char *)(v59 + 32) = v104;
  *(void *)(v59 + 40) = v25;
  uint64_t v63 = v60;
  char v64 = v62;
  sub_24EFAC824();
  unint64_t v65 = sub_24EFAC82C();
  v66 = v110;
  sub_24EFED2B0();
  swift_release();
  sub_24EFACB28(v58, &qword_269997F90);
  uint64_t v67 = swift_allocObject();
  *(void *)(v67 + 16) = v61;
  *(void *)(v67 + 24) = v63;
  uint64_t v68 = v63;
  LOBYTE(v63) = v64;
  *(unsigned char *)(v67 + 32) = v64;
  *(void *)(v67 + 40) = v25;
  uint64_t v69 = v68;
  sub_24EFAC824();
  uint64_t v132 = v55;
  unint64_t v133 = v65;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v71 = v115;
  sub_24EFED2D0();
  swift_release();
  v72 = v66;
  uint64_t v73 = v71;
  (*(void (**)(unsigned char *, uint64_t))(v116 + 8))(v72, v71);
  sub_24EFED1F0();
  v74 = v119;
  sub_24EFED040();
  uint64_t v75 = swift_allocObject();
  *(void *)(v75 + 16) = v61;
  *(void *)(v75 + 24) = v69;
  *(unsigned char *)(v75 + 32) = v63;
  *(void *)(v75 + 40) = v25;
  sub_24EFAC824();
  sub_24EFACDCC();
  v76 = v120;
  uint64_t v77 = v123;
  sub_24EFED400();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v124 + 8))(v74, v77);
  sub_24EFED080();
  uint64_t v132 = v73;
  unint64_t v133 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_24EFAD150(&qword_269998020, &qword_269997F70);
  v78 = v76;
  uint64_t v79 = v117;
  uint64_t v80 = v125;
  v81 = v131;
  sub_24EFED310();
  (*(void (**)(unsigned char *, uint64_t))(v126 + 8))(v78, v80);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v118 + 8))(v81, v79);
}

uint64_t sub_24EFABDD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = sub_24EFED350();
  uint64_t v2 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24EFED180();
  sub_24EFAC0CC(v24);
  uint64_t v5 = v24[0];
  uint64_t v6 = v24[1];
  char v7 = v25;
  uint64_t v9 = v26;
  uint64_t v8 = v27;
  uint64_t v10 = v28;
  char v11 = v29;
  uint64_t v21 = v30;
  uint64_t v20 = sub_24EFED3A0();
  uint64_t v19 = sub_24EFED210();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F1B388], v23);
  uint64_t v12 = MEMORY[0x253351440](v4, 0.650980392, 1.0, 0.0, 1.0);
  uint64_t v13 = v21;
  *(void *)a1 = v22;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 72) = v11;
  uint64_t v14 = v20;
  *(void *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v14;
  uint64_t v15 = v19;
  *(void *)(a1 + 96) = KeyPath;
  *(void *)(a1 + 104) = v15;
  *(void *)(a1 + 112) = v12;
  sub_24EFAC0AC(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_24EFAC0AC(v8, v10, v11);
  swift_bridgeObjectRetain();
  sub_24EFAC0BC(v5, v6, v7);
  swift_bridgeObjectRelease();
  sub_24EFAC0BC(v8, v10, v11);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFAC000(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  sub_24EFAC0AC(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRetain();
  sub_24EFAC0AC(v2, v3, v4);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_24EFAC0AC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24EFAC0BC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24EFAC0CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v47 = sub_24EFED350();
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  v46 = (char *)v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24EFECFD0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24EFED520();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EFED510();
  if (qword_26B1E88A0 != -1) {
    swift_once();
  }
  id v6 = (id)qword_26B1EB9A8;
  sub_24EFAC824();
  v40[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_269998028);
  v40[3] = sub_24EFAD150(&qword_269998030, &qword_269998028);
  sub_24EFED090();
  sub_24EFAC818();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  uint64_t v49 = sub_24EFED550();
  uint64_t v50 = v7;
  v40[2] = sub_24EFAD1EC();
  uint64_t v8 = sub_24EFED270();
  v40[1] = v5;
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_24EFED240();
  sub_24EFED220();
  sub_24EFED230();
  swift_release();
  uint64_t v13 = sub_24EFED260();
  uint64_t v43 = v14;
  uint64_t v44 = v13;
  uint64_t v42 = v15;
  char v17 = v16;
  swift_release();
  int v41 = v17 & 1;
  sub_24EFAC0BC(v8, v10, v12);
  swift_bridgeObjectRelease();
  sub_24EFED510();
  uint64_t v18 = (void *)qword_26B1EB9A8;
  sub_24EFAC824();
  id v19 = v18;
  sub_24EFED090();
  sub_24EFAC818();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  uint64_t v49 = sub_24EFED550();
  uint64_t v50 = v20;
  uint64_t v21 = sub_24EFED270();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  uint64_t v26 = v46;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v46, *MEMORY[0x263F1B388], v47);
  uint64_t v49 = MEMORY[0x253351440](v26, 0.650980392, 1.0, 0.0, 1.0);
  uint64_t v27 = sub_24EFED250();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  sub_24EFAC0BC(v21, v23, v25);
  swift_release();
  swift_bridgeObjectRelease();
  char v34 = v41;
  LOBYTE(v49) = v41;
  uint64_t v35 = v48;
  uint64_t v36 = v43;
  uint64_t v37 = v44;
  uint64_t v38 = v42;
  *uint64_t v48 = v44;
  v35[1] = v38;
  *((unsigned char *)v35 + 16) = v34;
  v35[3] = v36;
  v35[4] = v27;
  v35[5] = v29;
  *((unsigned char *)v35 + 48) = v33;
  v35[7] = v31;
  sub_24EFAC0AC(v37, v38, v34);
  swift_bridgeObjectRetain();
  sub_24EFAC0AC(v27, v29, v33);
  swift_bridgeObjectRetain();
  sub_24EFAC0BC(v27, v29, v33);
  swift_bridgeObjectRelease();
  sub_24EFAC0BC(v37, v38, v49);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFAC600()
{
  return sub_24EFED110();
}

uint64_t sub_24EFAC624(uint64_t a1)
{
  uint64_t v2 = sub_24EFED030();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_24EFED120();
}

uint64_t sub_24EFAC6F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFED0F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EFAC754(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24EFAC7B8(uint64_t a1)
{
  uint64_t v2 = sub_24EFED0F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24EFAC818()
{
  return swift_release();
}

uint64_t sub_24EFAC824()
{
  return swift_retain();
}

unint64_t sub_24EFAC82C()
{
  unint64_t result = qword_269997FB8;
  if (!qword_269997FB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269997F90);
    sub_24EFAC8CC();
    sub_24EFAD150(&qword_269998010, &qword_269997FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997FB8);
  }
  return result;
}

unint64_t sub_24EFAC8CC()
{
  unint64_t result = qword_269997FC0;
  if (!qword_269997FC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269997F88);
    sub_24EFAC96C();
    sub_24EFAD150(&qword_269998008, &qword_269997FA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997FC0);
  }
  return result;
}

unint64_t sub_24EFAC96C()
{
  unint64_t result = qword_269997FC8;
  if (!qword_269997FC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269997F80);
    sub_24EFACA0C();
    sub_24EFAD150(&qword_269998000, &qword_269997F78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997FC8);
  }
  return result;
}

unint64_t sub_24EFACA0C()
{
  unint64_t result = qword_269997FD0;
  if (!qword_269997FD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269997FD8);
    sub_24EFACA88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997FD0);
  }
  return result;
}

unint64_t sub_24EFACA88()
{
  unint64_t result = qword_269997FE0;
  if (!qword_269997FE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269997FE8);
    sub_24EFAD150(&qword_269997FF0, &qword_269997FF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269997FE0);
  }
  return result;
}

uint64_t sub_24EFACB28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24EFACB84()
{
  return swift_release();
}

uint64_t sub_24EFACC50()
{
  return sub_24EFACB84();
}

uint64_t sub_24EFACC7C(double a1)
{
  sub_24EFED060();
  double v3 = v2;
  uint64_t result = sub_24EFED050();
  if (v3 - v5 > a1)
  {
    sub_24EFAC824();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269998028);
    sub_24EFAD150(&qword_269998030, &qword_269998028);
    sub_24EFED090();
    sub_24EFAC818();
    sub_24EFED4E0();
    return swift_release();
  }
  return result;
}

uint64_t objectdestroy_2Tm()
{
  sub_24EFAC818();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24EFACDB4()
{
  return sub_24EFACC7C(*(double *)(v0 + 40));
}

unint64_t sub_24EFACDCC()
{
  unint64_t result = qword_269998018;
  if (!qword_269998018)
  {
    sub_24EFED070();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998018);
  }
  return result;
}

uint64_t sub_24EFACE24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24EFACE48()
{
  return sub_24EFED2C0();
}

uint64_t destroy for ForYouToastView()
{
  return sub_24EFAC818();
}

uint64_t initializeWithCopy for ForYouToastView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24EFAC824();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t assignWithCopy for ForYouToastView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24EFAC824();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24EFAC818();
  *(void *)(a1 + 24) = a2[3];
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for ForYouToastView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_24EFAC818();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouToastView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouToastView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastView()
{
  return &type metadata for ForYouToastView;
}

uint64_t sub_24EFAD03C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24EFAD150(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24EFAD194@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24EFED130();
  *a1 = result;
  return result;
}

uint64_t sub_24EFAD1C0()
{
  return sub_24EFED140();
}

unint64_t sub_24EFAD1EC()
{
  unint64_t result = qword_269998038;
  if (!qword_269998038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998038);
  }
  return result;
}

uint64_t ForYouToastState.init(locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24EFECFD0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t sub_24EFAD2B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFADFB4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EFAD2DC(uint64_t a1)
{
  unint64_t v2 = sub_24EFAD4B4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAD318(uint64_t a1)
{
  unint64_t v2 = sub_24EFAD4B4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ForYouToastState.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998040);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFAD4B4();
  sub_24EFED9A0();
  sub_24EFECFD0();
  sub_24EFAD7C0(&qword_269998050);
  sub_24EFED8A0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24EFAD4B4()
{
  unint64_t result = qword_269998048;
  if (!qword_269998048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998048);
  }
  return result;
}

uint64_t ForYouToastState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v4 = sub_24EFECFD0();
  uint64_t v14 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v17 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998058);
  uint64_t v16 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ForYouToastState();
  MEMORY[0x270FA5388](v9 - 8);
  char v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFAD4B4();
  sub_24EFED990();
  if (!v2)
  {
    sub_24EFAD7C0(&qword_269998060);
    sub_24EFED800();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v17, v4);
    sub_24EFAD804((uint64_t)v11, v15);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for ForYouToastState()
{
  uint64_t result = qword_269998068;
  if (!qword_269998068) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24EFAD7C0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24EFECFD0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24EFAD804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ForYouToastState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EFAD868@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ForYouToastState.init(from:)(a1, a2);
}

uint64_t sub_24EFAD880(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998040);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFAD4B4();
  sub_24EFED9A0();
  sub_24EFECFD0();
  sub_24EFAD7C0(&qword_269998050);
  sub_24EFED8A0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFECFD0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for ForYouToastState(uint64_t a1)
{
  uint64_t v2 = sub_24EFECFD0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ForYouToastState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouToastState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EFADC5C);
}

uint64_t sub_24EFADC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFECFD0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ForYouToastState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EFADCDC);
}

uint64_t sub_24EFADCDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFECFD0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_24EFADD4C()
{
  uint64_t result = sub_24EFECFD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ForYouToastState.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24EFADE74);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastState.CodingKeys()
{
  return &type metadata for ForYouToastState.CodingKeys;
}

unint64_t sub_24EFADEB0()
{
  unint64_t result = qword_269998078;
  if (!qword_269998078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998078);
  }
  return result;
}

unint64_t sub_24EFADF08()
{
  unint64_t result = qword_269998080;
  if (!qword_269998080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998080);
  }
  return result;
}

unint64_t sub_24EFADF60()
{
  unint64_t result = qword_269998088;
  if (!qword_269998088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998088);
  }
  return result;
}

uint64_t sub_24EFADFB4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EFAE034()
{
  return 0x656C61636F6CLL;
}

unint64_t sub_24EFAE048(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000017;
      break;
    case 2:
      unint64_t result = 0x79536C65636E6163;
      break;
    case 3:
      unint64_t result = 0x6F5464656C696166;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0xD000000000000016;
      break;
    case 7:
      unint64_t result = 0x646564616F6CLL;
      break;
    case 8:
    case 11:
      unint64_t result = 0xD000000000000011;
      break;
    case 9:
      unint64_t result = 0xD000000000000018;
      break;
    case 10:
      unint64_t result = 0xD000000000000014;
      break;
    case 12:
      unint64_t result = 0x6E79537472617473;
      break;
    case 13:
      unint64_t result = 0xD000000000000018;
      break;
    case 14:
      unint64_t result = 0x4164694477656976;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24EFAE208(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x65736E6F70736572;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      unint64_t result = 0x64496F636572;
      break;
  }
  return result;
}

uint64_t sub_24EFAE2A8(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0450();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE2E4(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0450();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAE32C(uint64_t a1)
{
  unint64_t v2 = sub_24EFB03A8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE368(uint64_t a1)
{
  unint64_t v2 = sub_24EFB03A8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAE3A4(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0354();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE3E0(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0354();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_24EFAE41C()
{
  return sub_24EFAE048(*v0);
}

uint64_t sub_24EFAE424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB0584(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EFAE44C(unsigned char *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_24EFAE458(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFD4C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE494(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFD4C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAE4D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB0EA4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EFAE4FC(uint64_t a1)
{
  unint64_t v2 = sub_24EFB02AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE538(uint64_t a1)
{
  unint64_t v2 = sub_24EFB02AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAE578@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB0B44(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EFAE5A4(uint64_t a1)
{
  unint64_t v2 = sub_24EFB01A8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE5E0(uint64_t a1)
{
  unint64_t v2 = sub_24EFB01A8();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_24EFAE61C()
{
  return 0xD000000000000014;
}

uint64_t sub_24EFAE638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB0BE4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EFAE664(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0154();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE6A0(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0154();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_24EFAE6DC()
{
  return 0xD000000000000012;
}

uint64_t sub_24EFAE6F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB0C6C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EFAE724(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0100();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE760(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0100();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_24EFAE79C()
{
  return sub_24EFAE208(*v0);
}

uint64_t sub_24EFAE7A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB0CF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFAE7CC(uint64_t a1)
{
  unint64_t v2 = sub_24EFB00AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE808(uint64_t a1)
{
  unint64_t v2 = sub_24EFB00AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAE844(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0058();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE880(uint64_t a1)
{
  unint64_t v2 = sub_24EFB0058();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAE8BC(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFFB0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE8F8(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFFB0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAE934(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFF5C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE970(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFF5C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAE9AC(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFF08();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAE9E8(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFF08();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAEA24(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFEB4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAEA60(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFEB4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAEA9C(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFE0C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAEAD8(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFE0C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFAEB14(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFDB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFAEB50(uint64_t a1)
{
  unint64_t v2 = sub_24EFAFDB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ForYouAction.encode(to:)(void *a1)
{
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88D0);
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v60 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8930);
  uint64_t v95 = *(void *)(v3 - 8);
  uint64_t v96 = v3;
  MEMORY[0x270FA5388](v3);
  int v94 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88D8);
  uint64_t v58 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v57 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88F8);
  uint64_t v64 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v63 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8908);
  uint64_t v67 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  v66 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8928);
  uint64_t v76 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  long long v90 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88F0);
  uint64_t v70 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v69 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88C0);
  uint64_t v75 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  uint64_t v92 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8910);
  uint64_t v88 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  uint64_t v87 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88E8);
  uint64_t v85 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  int v84 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8920);
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v80 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88C8);
  uint64_t v79 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  v78 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88E0);
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8918);
  uint64_t v77 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  id v19 = (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8900);
  uint64_t v74 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88B8);
  uint64_t v97 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  char v24 = (char *)&v57 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFAFD4C();
  uint64_t v98 = v24;
  sub_24EFED9A0();
  sub_24EFAFDA0(v101, &v103);
  uint64_t v25 = v103;
  switch(v107)
  {
    case 1:
      sub_24EFB0250((uint64_t)&v103, (uint64_t)v108);
      LOBYTE(v102) = 3;
      sub_24EFB02AC();
      uint64_t v28 = v78;
      uint64_t v27 = v98;
      uint64_t v26 = v99;
      sub_24EFED820();
      sub_24EFB0250((uint64_t)v108, (uint64_t)&v102);
      sub_24EFB0300();
      uint64_t v29 = v81;
      sub_24EFED8A0();
      uint64_t v30 = v108;
      goto LABEL_12;
    case 2:
      LOBYTE(v102) = 4;
      sub_24EFB01A8();
      uint64_t v28 = v80;
      uint64_t v27 = v98;
      uint64_t v26 = v99;
      sub_24EFED820();
      LOBYTE(v102) = v25;
      sub_24EFB01FC();
      uint64_t v29 = v83;
      sub_24EFED8A0();
      uint64_t v30 = &v109;
      goto LABEL_12;
    case 3:
      LOBYTE(v102) = 5;
      sub_24EFB0154();
      uint64_t v31 = v84;
      char v33 = v98;
      uint64_t v32 = v99;
      sub_24EFED820();
      uint64_t v34 = v86;
      sub_24EFED860();
      uint64_t v35 = &v110;
      goto LABEL_7;
    case 4:
      LOBYTE(v102) = 6;
      sub_24EFB0100();
      uint64_t v31 = v87;
      char v33 = v98;
      uint64_t v32 = v99;
      sub_24EFED820();
      uint64_t v102 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8888);
      sub_24EFB3E68(&qword_26B1E8890, &qword_26B1E8888, (void (*)(void))sub_24EFA826C);
      uint64_t v34 = v89;
      sub_24EFED8A0();
      uint64_t v35 = &v112;
LABEL_7:
      (*(void (**)(char *, uint64_t))(*(v35 - 32) + 8))(v31, v34);
      return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v33, v32);
    case 5:
      uint64_t v37 = v106;
      LOBYTE(v102) = 7;
      sub_24EFB00AC();
      uint64_t v38 = v92;
      uint64_t v40 = v98;
      uint64_t v39 = v99;
      sub_24EFED820();
      LOBYTE(v102) = 0;
      uint64_t v41 = v93;
      uint64_t v42 = v100;
      sub_24EFED860();
      if (!v42)
      {
        LOBYTE(v102) = 1;
        sub_24EFED880();
        LOBYTE(v102) = 2;
        sub_24EFED880();
        uint64_t v102 = v37;
        char v111 = 3;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8878);
        sub_24EFB3E68(&qword_26B1E8880, &qword_26B1E8878, (void (*)(void))sub_24EFA82C0);
        sub_24EFED8A0();
      }
      (*(void (**)(char *, uint64_t))(v75 + 8))(v38, v41);
      return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v40, v39);
    case 6:
      LOBYTE(v102) = 9;
      sub_24EFAFFB0();
      uint64_t v28 = v90;
      uint64_t v27 = v98;
      uint64_t v26 = v99;
      sub_24EFED820();
      LOBYTE(v102) = v25;
      sub_24EFB0004();
      uint64_t v29 = v91;
      sub_24EFED8A0();
      uint64_t v30 = (char *)&v105;
LABEL_12:
      uint64_t v43 = *((void *)v30 - 32);
      goto LABEL_14;
    case 7:
      LOBYTE(v102) = 13;
      sub_24EFAFE0C();
      uint64_t v28 = v94;
      uint64_t v27 = v98;
      uint64_t v26 = v99;
      sub_24EFED820();
      LOBYTE(v102) = v25;
      sub_24EFAFE60();
      uint64_t v29 = v96;
      sub_24EFED8A0();
      uint64_t v43 = v95;
LABEL_14:
      (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v29);
      goto LABEL_15;
    case 8:
      if (!(v105 | v106 | (unint64_t)v103 | v104 | *((void *)&v103 + 1)))
      {
        LOBYTE(v102) = 0;
        sub_24EFB0450();
        uint64_t v49 = v98;
        uint64_t v50 = v99;
        sub_24EFED820();
        (*(void (**)(char *, uint64_t))(v74 + 8))(v22, v20);
        return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v49, v50);
      }
      uint64_t v46 = v105 | v106 | v104 | *((void *)&v103 + 1);
      if ((void)v103 == 1 && !v46)
      {
        LOBYTE(v102) = 2;
        sub_24EFB0354();
        uint64_t v48 = v98;
        uint64_t v47 = v99;
        sub_24EFED820();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v16, v73);
        return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v48, v47);
      }
      if ((void)v103 == 2 && !v46)
      {
        LOBYTE(v102) = 8;
        sub_24EFB0058();
        char v51 = v69;
        uint64_t v48 = v98;
        uint64_t v47 = v99;
        sub_24EFED820();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v51, v71);
        return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v48, v47);
      }
      if ((void)v103 == 3 && !v46)
      {
        LOBYTE(v102) = 10;
        sub_24EFAFF5C();
        v52 = v66;
        uint64_t v48 = v98;
        uint64_t v47 = v99;
        sub_24EFED820();
        (*(void (**)(char *, uint64_t))(v67 + 8))(v52, v68);
        return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v48, v47);
      }
      if ((void)v103 == 4 && !v46)
      {
        LOBYTE(v102) = 11;
        sub_24EFAFF08();
        v53 = v63;
        uint64_t v48 = v98;
        uint64_t v47 = v99;
        sub_24EFED820();
        (*(void (**)(char *, uint64_t))(v64 + 8))(v53, v65);
        return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v48, v47);
      }
      uint64_t v26 = v99;
      uint64_t v54 = v98;
      if ((void)v103 != 5 || v46)
      {
        LOBYTE(v102) = 14;
        sub_24EFAFDB8();
        uint64_t v56 = v60;
        sub_24EFED820();
        (*(void (**)(char *, uint64_t))(v61 + 8))(v56, v62);
      }
      else
      {
        LOBYTE(v102) = 12;
        sub_24EFAFEB4();
        uint64_t v55 = v57;
        sub_24EFED820();
        (*(void (**)(char *, uint64_t))(v58 + 8))(v55, v59);
      }
      uint64_t v44 = *(uint64_t (**)(char *, uint64_t))(v97 + 8);
      uint64_t v45 = v54;
      return v44(v45, v26);
    default:
      LOBYTE(v102) = 1;
      sub_24EFB03A8();
      uint64_t v27 = v98;
      uint64_t v26 = v99;
      sub_24EFED820();
      LOBYTE(v102) = v25 & 1;
      sub_24EFB03FC();
      sub_24EFED8A0();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v19, v17);
LABEL_15:
      uint64_t v44 = *(uint64_t (**)(char *, uint64_t))(v97 + 8);
      uint64_t v45 = v27;
      return v44(v45, v26);
  }
}

unint64_t sub_24EFAFD4C()
{
  unint64_t result = qword_26B1E8508;
  if (!qword_26B1E8508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8508);
  }
  return result;
}

_OWORD *sub_24EFAFDA0(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

unint64_t sub_24EFAFDB8()
{
  unint64_t result = qword_26B1E8548;
  if (!qword_26B1E8548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8548);
  }
  return result;
}

unint64_t sub_24EFAFE0C()
{
  unint64_t result = qword_269998090;
  if (!qword_269998090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998090);
  }
  return result;
}

unint64_t sub_24EFAFE60()
{
  unint64_t result = qword_269998098;
  if (!qword_269998098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998098);
  }
  return result;
}

unint64_t sub_24EFAFEB4()
{
  unint64_t result = qword_2699980A0;
  if (!qword_2699980A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980A0);
  }
  return result;
}

unint64_t sub_24EFAFF08()
{
  unint64_t result = qword_2699980A8;
  if (!qword_2699980A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980A8);
  }
  return result;
}

unint64_t sub_24EFAFF5C()
{
  unint64_t result = qword_26B1E85C8;
  if (!qword_26B1E85C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85C8);
  }
  return result;
}

unint64_t sub_24EFAFFB0()
{
  unint64_t result = qword_2699980B0;
  if (!qword_2699980B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980B0);
  }
  return result;
}

unint64_t sub_24EFB0004()
{
  unint64_t result = qword_2699980B8;
  if (!qword_2699980B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980B8);
  }
  return result;
}

unint64_t sub_24EFB0058()
{
  unint64_t result = qword_2699980C0;
  if (!qword_2699980C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980C0);
  }
  return result;
}

unint64_t sub_24EFB00AC()
{
  unint64_t result = qword_26B1E8520;
  if (!qword_26B1E8520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8520);
  }
  return result;
}

unint64_t sub_24EFB0100()
{
  unint64_t result = qword_26B1E85E0;
  if (!qword_26B1E85E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85E0);
  }
  return result;
}

unint64_t sub_24EFB0154()
{
  unint64_t result = qword_2699980C8;
  if (!qword_2699980C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980C8);
  }
  return result;
}

unint64_t sub_24EFB01A8()
{
  unint64_t result = qword_26B1E81D8;
  if (!qword_26B1E81D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E81D8);
  }
  return result;
}

unint64_t sub_24EFB01FC()
{
  unint64_t result = qword_26B1E8788;
  if (!qword_26B1E8788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8788);
  }
  return result;
}

uint64_t sub_24EFB0250(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_24EFB02AC()
{
  unint64_t result = qword_2699980D0;
  if (!qword_2699980D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980D0);
  }
  return result;
}

unint64_t sub_24EFB0300()
{
  unint64_t result = qword_2699980D8;
  if (!qword_2699980D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980D8);
  }
  return result;
}

unint64_t sub_24EFB0354()
{
  unint64_t result = qword_26B1E8570;
  if (!qword_26B1E8570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8570);
  }
  return result;
}

unint64_t sub_24EFB03A8()
{
  unint64_t result = qword_2699980E0;
  if (!qword_2699980E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980E0);
  }
  return result;
}

unint64_t sub_24EFB03FC()
{
  unint64_t result = qword_2699980E8;
  if (!qword_2699980E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980E8);
  }
  return result;
}

unint64_t sub_24EFB0450()
{
  unint64_t result = qword_26B1E81D0;
  if (!qword_26B1E81D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E81D0);
  }
  return result;
}

_OWORD *ForYouAction.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  unint64_t result = (_OWORD *)sub_24EFB0F14(a1, (uint64_t)v5);
  if (!v2) {
    return sub_24EFAFDA0(v5, a2);
  }
  return result;
}

_OWORD *sub_24EFB04EC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  unint64_t result = (_OWORD *)sub_24EFB0F14(a1, (uint64_t)v5);
  if (!v2) {
    return sub_24EFAFDA0(v5, a2);
  }
  return result;
}

uint64_t sub_24EFB0534(void *a1)
{
  sub_24EFAFDA0(v1, v4);
  return ForYouAction.encode(to:)(a1);
}

uint64_t sub_24EFB0584(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000024EFF4B40 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024EFF4B60 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79536C65636E6163 && a2 == 0xEF72656D6954636ELL || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F5464656C696166 && a2 == 0xEC00000064616F4CLL || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024EFF4B80 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EFF4BA0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024EFF4BC0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x646564616F6CLL && a2 == 0xE600000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EFF4BE0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024EFF4C00 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024EFF4C20 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EFF4C40 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6E79537472617473 && a2 == 0xEE0072656D695463 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024EFF4C60 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x4164694477656976 && a2 == 0xED00007261657070)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    char v5 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 14;
    }
    else {
      return 15;
    }
  }
}

uint64_t sub_24EFB0B38()
{
  return 12383;
}

uint64_t sub_24EFB0B44(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x72656767697274 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EFB0BCC()
{
  return 0x72656767697274;
}

uint64_t sub_24EFB0BE4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x800000024EFF4CA0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_24EFB0C6C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000024EFF4C80)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_24EFB0CF4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64496F636572 && a2 == 0xE600000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EFF4AC0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xEF656D6954646E45 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024EFF4C80)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24EFB0EA4(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EFB0F14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v130 = a2;
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998138);
  uint64_t v117 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  char v134 = (char *)&v87 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998140);
  uint64_t v97 = *(void *)(v116 - 8);
  MEMORY[0x270FA5388](v116);
  uint64_t v129 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998148);
  uint64_t v114 = *(void *)(v115 - 8);
  MEMORY[0x270FA5388](v115);
  unint64_t v133 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998150);
  uint64_t v112 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  uint64_t v128 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998158);
  uint64_t v109 = *(void *)(v110 - 8);
  MEMORY[0x270FA5388](v110);
  uint64_t v126 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998160);
  uint64_t v96 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388](v111);
  uint64_t v127 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998168);
  uint64_t v106 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  uint64_t v125 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998170);
  uint64_t v120 = *(void *)(v119 - 8);
  MEMORY[0x270FA5388](v119);
  uint64_t v132 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998178);
  uint64_t v95 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388](v107);
  uint64_t v124 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998180);
  uint64_t v94 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  v131 = (char *)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998188);
  uint64_t v93 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  uint64_t v123 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998190);
  uint64_t v92 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  uint64_t v122 = (char *)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998198);
  uint64_t v101 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  v121 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699981A0);
  uint64_t v100 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v17 = (char *)&v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699981A8);
  uint64_t v99 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v87 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699981B0);
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  char v24 = (char *)&v87 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1[3];
  char v135 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v25);
  sub_24EFAFD4C();
  uint64_t v26 = v136;
  sub_24EFED990();
  if (v26) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v135);
  }
  uint64_t v89 = v20;
  uint64_t v88 = v18;
  long long v90 = v17;
  uint64_t v27 = v131;
  uint64_t v28 = v132;
  uint64_t v30 = v133;
  uint64_t v29 = v134;
  uint64_t v91 = 0;
  uint64_t v136 = v22;
  uint64_t v31 = sub_24EFED810();
  if (*(void *)(v31 + 16) != 1)
  {
    uint64_t v40 = sub_24EFED6C0();
    swift_allocError();
    uint64_t v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
    *uint64_t v42 = &type metadata for ForYouAction;
    sub_24EFED780();
    sub_24EFED6B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v40 - 8) + 104))(v42, *MEMORY[0x263F8DCB0], v40);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v135);
  }
  switch(*(unsigned char *)(v31 + 32))
  {
    case 1:
      LOBYTE(v137) = 1;
      sub_24EFB03A8();
      uint64_t v43 = v90;
      uint64_t v44 = v91;
      sub_24EFED770();
      if (v44) {
        goto LABEL_34;
      }
      sub_24EFB3F7C();
      uint64_t v45 = v102;
      sub_24EFED800();
      (*(void (**)(char *, uint64_t))(v100 + 8))(v43, v45);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      char v39 = 0;
      uint64_t v34 = v137;
      goto LABEL_37;
    case 2:
      LOBYTE(v137) = 2;
      sub_24EFB0354();
      uint64_t v46 = v121;
      uint64_t v47 = v91;
      sub_24EFED770();
      if (v47) {
        goto LABEL_34;
      }
      (*(void (**)(char *, uint64_t))(v101 + 8))(v46, v103);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      char v39 = 8;
      uint64_t v38 = 0;
      uint64_t v34 = 1;
      goto LABEL_38;
    case 3:
      LOBYTE(v137) = 3;
      sub_24EFB02AC();
      uint64_t v48 = v122;
      uint64_t v49 = v91;
      sub_24EFED770();
      if (v49) {
        goto LABEL_34;
      }
      sub_24EFB3F28();
      uint64_t v50 = v98;
      sub_24EFED800();
      uint64_t v51 = v136;
      (*(void (**)(char *, uint64_t))(v92 + 8))(v48, v50);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v24, v21);
      uint64_t v37 = 0;
      uint64_t v34 = v137;
      uint64_t v35 = v138;
      char v39 = 1;
      uint64_t v38 = 0;
      uint64_t v36 = v139;
      goto LABEL_38;
    case 4:
      LOBYTE(v137) = 4;
      sub_24EFB01A8();
      v52 = v123;
      uint64_t v53 = v91;
      sub_24EFED770();
      if (v53) {
        goto LABEL_34;
      }
      sub_24EFB3ED4();
      uint64_t v54 = v104;
      sub_24EFED800();
      uint64_t v55 = v136;
      (*(void (**)(char *, uint64_t))(v93 + 8))(v52, v54);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v34 = v137;
      char v39 = 2;
      goto LABEL_37;
    case 5:
      LOBYTE(v137) = 5;
      sub_24EFB0154();
      uint64_t v56 = v27;
      uint64_t v57 = v91;
      sub_24EFED770();
      if (v57) {
        goto LABEL_34;
      }
      uint64_t v58 = v105;
      uint64_t v34 = sub_24EFED7C0();
      uint64_t v35 = v80;
      (*(void (**)(char *, uint64_t))(v94 + 8))(v56, v58);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      char v39 = 3;
      goto LABEL_37;
    case 6:
      LOBYTE(v137) = 6;
      sub_24EFB0100();
      uint64_t v59 = v124;
      uint64_t v60 = v91;
      sub_24EFED770();
      if (v60) {
        goto LABEL_34;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8888);
      sub_24EFB3E68(&qword_269997EE8, &qword_26B1E8888, (void (*)(void))sub_24EFA8714);
      uint64_t v61 = v107;
      sub_24EFED800();
      (*(void (**)(char *, uint64_t))(v95 + 8))(v59, v61);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v34 = v137;
      char v39 = 4;
      goto LABEL_37;
    case 7:
      LOBYTE(v137) = 7;
      sub_24EFB00AC();
      uint64_t v62 = v91;
      sub_24EFED770();
      if (v62) {
        goto LABEL_34;
      }
      LOBYTE(v137) = 0;
      uint64_t v34 = sub_24EFED7C0();
      uint64_t v35 = v81;
      LOBYTE(v137) = 1;
      sub_24EFED7E0();
      uint64_t v85 = v84;
      LOBYTE(v137) = 2;
      sub_24EFED7E0();
      uint64_t v38 = v86;
      char v134 = (char *)v21;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8878);
      char v140 = 3;
      sub_24EFB3E68(&qword_269997EF8, &qword_26B1E8878, (void (*)(void))sub_24EFA87D4);
      sub_24EFED800();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v119);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v136 + 8))(v24, v134);
      uint64_t v37 = v137;
      uint64_t v36 = v85;
      char v39 = 5;
      goto LABEL_38;
    case 8:
      LOBYTE(v137) = 8;
      sub_24EFB0058();
      uint64_t v63 = v125;
      uint64_t v64 = v91;
      sub_24EFED770();
      if (v64) {
        goto LABEL_34;
      }
      (*(void (**)(char *, uint64_t))(v106 + 8))(v63, v108);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      char v39 = 8;
      uint64_t v38 = 0;
      uint64_t v34 = 2;
      goto LABEL_38;
    case 9:
      LOBYTE(v137) = 9;
      sub_24EFAFFB0();
      uint64_t v65 = v127;
      uint64_t v66 = v91;
      sub_24EFED770();
      if (v66) {
        goto LABEL_34;
      }
      sub_24EFB3E14();
      uint64_t v67 = v111;
      sub_24EFED800();
      uint64_t v68 = v136;
      (*(void (**)(char *, uint64_t))(v96 + 8))(v65, v67);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v34 = v137;
      char v39 = 6;
LABEL_37:
      uint64_t v38 = 0;
      goto LABEL_38;
    case 0xA:
      LOBYTE(v137) = 10;
      sub_24EFAFF5C();
      uint64_t v69 = v126;
      uint64_t v70 = v91;
      sub_24EFED770();
      if (v70) {
        goto LABEL_34;
      }
      (*(void (**)(char *, uint64_t))(v109 + 8))(v69, v110);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      char v39 = 8;
      uint64_t v38 = 0;
      uint64_t v34 = 3;
      goto LABEL_38;
    case 0xB:
      LOBYTE(v137) = 11;
      sub_24EFAFF08();
      uint64_t v71 = v128;
      uint64_t v72 = v91;
      sub_24EFED770();
      if (v72) {
        goto LABEL_34;
      }
      (*(void (**)(char *, uint64_t))(v112 + 8))(v71, v113);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      char v39 = 8;
      uint64_t v38 = 0;
      uint64_t v34 = 4;
      goto LABEL_38;
    case 0xC:
      LOBYTE(v137) = 12;
      sub_24EFAFEB4();
      uint64_t v73 = v91;
      sub_24EFED770();
      if (v73) {
        goto LABEL_34;
      }
      (*(void (**)(char *, uint64_t))(v114 + 8))(v30, v115);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      char v39 = 8;
      uint64_t v38 = 0;
      uint64_t v34 = 5;
      goto LABEL_38;
    case 0xD:
      LOBYTE(v137) = 13;
      sub_24EFAFE0C();
      uint64_t v74 = v129;
      uint64_t v75 = v91;
      sub_24EFED770();
      if (v75) {
        goto LABEL_34;
      }
      sub_24EFB3DC0();
      uint64_t v76 = v116;
      sub_24EFED800();
      uint64_t v77 = v136;
      uint64_t v91 = 0;
      (*(void (**)(char *, uint64_t))(v97 + 8))(v74, v76);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v34 = v137;
      char v39 = 7;
      uint64_t v38 = 0;
      uint64_t v82 = (uint64_t)v135;
      uint64_t v83 = v130;
      goto LABEL_39;
    case 0xE:
      LOBYTE(v137) = 14;
      sub_24EFAFDB8();
      uint64_t v78 = v91;
      sub_24EFED770();
      if (v78) {
        goto LABEL_34;
      }
      (*(void (**)(char *, uint64_t))(v117 + 8))(v29, v118);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      char v39 = 8;
      uint64_t v38 = 0;
      uint64_t v34 = 6;
      goto LABEL_38;
    default:
      LOBYTE(v137) = 0;
      sub_24EFB0450();
      uint64_t v32 = v89;
      uint64_t v33 = v91;
      sub_24EFED770();
      if (v33)
      {
LABEL_34:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v135);
      }
      (*(void (**)(char *, uint64_t))(v99 + 8))(v32, v88);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v136 + 8))(v24, v21);
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      char v39 = 8;
LABEL_38:
      uint64_t v82 = (uint64_t)v135;
      uint64_t v83 = v130;
LABEL_39:
      uint64_t result = __swift_destroy_boxed_opaque_existential_1(v82);
      *(void *)uint64_t v83 = v34;
      *(void *)(v83 + 8) = v35;
      *(void *)(v83 + 16) = v36;
      *(void *)(v83 + 24) = v38;
      *(void *)(v83 + 32) = v37;
      *(unsigned char *)(v83 + 40) = v39;
      break;
  }
  return result;
}

uint64_t sub_24EFB27AC(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 1:
      uint64_t result = sub_24EFA9CD8(result, a2, a3);
      break;
    case 3:
    case 4:
      goto LABEL_7;
    case 5:
      swift_bridgeObjectRetain();
LABEL_7:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for ForYouAction(uint64_t a1)
{
  return sub_24EFB286C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t sub_24EFB286C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 1:
      uint64_t result = sub_24EFA9DD0(result, a2, a3);
      break;
    case 3:
    case 4:
      goto LABEL_7;
    case 5:
      swift_bridgeObjectRelease();
LABEL_7:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for ForYouAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_24EFB27AC(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for ForYouAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_24EFB27AC(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  char v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_24EFB286C(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ForYouAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_24EFB286C(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouAction(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF8 && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 248);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 8) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF7)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 248;
    if (a3 >= 0xF8) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF8) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24EFB2B18(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) <= 7u) {
    return *(unsigned __int8 *)(a1 + 40);
  }
  else {
    return (*(_DWORD *)a1 + 8);
  }
}

uint64_t sub_24EFB2B30(uint64_t result, unsigned int a2)
{
  if (a2 >= 8)
  {
    *(void *)__n128 result = a2 - 8;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    LOBYTE(a2) = 8;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ForYouAction()
{
  return &type metadata for ForYouAction;
}

uint64_t getEnumTagSinglePayload for ForYouAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ForYouAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *__n128 result = a2 + 14;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFB2CC0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouAction.CodingKeys()
{
  return &type metadata for ForYouAction.CodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.AppDidBecomeActiveCodingKeys()
{
  return &type metadata for ForYouAction.AppDidBecomeActiveCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.BrowsingIdentityUpdatedCodingKeys()
{
  return &type metadata for ForYouAction.BrowsingIdentityUpdatedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.CancelSyncTimerCodingKeys()
{
  return &type metadata for ForYouAction.CancelSyncTimerCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.FailedToLoadCodingKeys()
{
  return &type metadata for ForYouAction.FailedToLoadCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.FetchSectionDescriptorsCodingKeys()
{
  return &type metadata for ForYouAction.FetchSectionDescriptorsCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.HandleFetchErrorCodingKeys()
{
  return &type metadata for ForYouAction.HandleFetchErrorCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.LoadedAwardDescriptorsCodingKeys()
{
  return &type metadata for ForYouAction.LoadedAwardDescriptorsCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ForYouAction.LoadedCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFB2E3CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouAction.LoadedCodingKeys()
{
  return &type metadata for ForYouAction.LoadedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.NavigateToExploreCodingKeys()
{
  return &type metadata for ForYouAction.NavigateToExploreCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.NetworkConditionsUpdatedCodingKeys()
{
  return &type metadata for ForYouAction.NetworkConditionsUpdatedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.PresentToastIfNeededCodingKeys()
{
  return &type metadata for ForYouAction.PresentToastIfNeededCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.RetryButtonTappedCodingKeys()
{
  return &type metadata for ForYouAction.RetryButtonTappedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.StartSyncTimerCodingKeys()
{
  return &type metadata for ForYouAction.StartSyncTimerCodingKeys;
}

unsigned char *_s13FitnessForYou12ForYouActionO33BrowsingIdentityUpdatedCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24EFB2F60);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouAction.SubscriptionStateUpdatedCodingKeys()
{
  return &type metadata for ForYouAction.SubscriptionStateUpdatedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouAction.ViewDidAppearCodingKeys()
{
  return &type metadata for ForYouAction.ViewDidAppearCodingKeys;
}

unint64_t sub_24EFB2FAC()
{
  unint64_t result = qword_2699980F0;
  if (!qword_2699980F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980F0);
  }
  return result;
}

unint64_t sub_24EFB3004()
{
  unint64_t result = qword_2699980F8;
  if (!qword_2699980F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699980F8);
  }
  return result;
}

unint64_t sub_24EFB305C()
{
  unint64_t result = qword_269998100;
  if (!qword_269998100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998100);
  }
  return result;
}

unint64_t sub_24EFB30B4()
{
  unint64_t result = qword_269998108;
  if (!qword_269998108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998108);
  }
  return result;
}

unint64_t sub_24EFB310C()
{
  unint64_t result = qword_269998110;
  if (!qword_269998110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998110);
  }
  return result;
}

unint64_t sub_24EFB3164()
{
  unint64_t result = qword_269998118;
  if (!qword_269998118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998118);
  }
  return result;
}

unint64_t sub_24EFB31BC()
{
  unint64_t result = qword_269998120;
  if (!qword_269998120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998120);
  }
  return result;
}

unint64_t sub_24EFB3214()
{
  unint64_t result = qword_269998128;
  if (!qword_269998128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998128);
  }
  return result;
}

unint64_t sub_24EFB326C()
{
  unint64_t result = qword_269998130;
  if (!qword_269998130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998130);
  }
  return result;
}

unint64_t sub_24EFB32C4()
{
  unint64_t result = qword_26B1E85C0;
  if (!qword_26B1E85C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85C0);
  }
  return result;
}

unint64_t sub_24EFB331C()
{
  unint64_t result = qword_26B1E85B8;
  if (!qword_26B1E85B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85B8);
  }
  return result;
}

unint64_t sub_24EFB3374()
{
  unint64_t result = qword_26B1E8600;
  if (!qword_26B1E8600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8600);
  }
  return result;
}

unint64_t sub_24EFB33CC()
{
  unint64_t result = qword_26B1E85F8;
  if (!qword_26B1E85F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85F8);
  }
  return result;
}

unint64_t sub_24EFB3424()
{
  unint64_t result = qword_26B1E8580;
  if (!qword_26B1E8580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8580);
  }
  return result;
}

unint64_t sub_24EFB347C()
{
  unint64_t result = qword_26B1E8578;
  if (!qword_26B1E8578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8578);
  }
  return result;
}

unint64_t sub_24EFB34D4()
{
  unint64_t result = qword_26B1E8540;
  if (!qword_26B1E8540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8540);
  }
  return result;
}

unint64_t sub_24EFB352C()
{
  unint64_t result = qword_26B1E8538;
  if (!qword_26B1E8538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8538);
  }
  return result;
}

unint64_t sub_24EFB3584()
{
  unint64_t result = qword_26B1E8610;
  if (!qword_26B1E8610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8610);
  }
  return result;
}

unint64_t sub_24EFB35DC()
{
  unint64_t result = qword_26B1E8608;
  if (!qword_26B1E8608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8608);
  }
  return result;
}

unint64_t sub_24EFB3634()
{
  unint64_t result = qword_26B1E8590;
  if (!qword_26B1E8590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8590);
  }
  return result;
}

unint64_t sub_24EFB368C()
{
  unint64_t result = qword_26B1E8588;
  if (!qword_26B1E8588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8588);
  }
  return result;
}

unint64_t sub_24EFB36E4()
{
  unint64_t result = qword_26B1E85F0;
  if (!qword_26B1E85F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85F0);
  }
  return result;
}

unint64_t sub_24EFB373C()
{
  unint64_t result = qword_26B1E85E8;
  if (!qword_26B1E85E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85E8);
  }
  return result;
}

unint64_t sub_24EFB3794()
{
  unint64_t result = qword_26B1E8530;
  if (!qword_26B1E8530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8530);
  }
  return result;
}

unint64_t sub_24EFB37EC()
{
  unint64_t result = qword_26B1E8528;
  if (!qword_26B1E8528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8528);
  }
  return result;
}

unint64_t sub_24EFB3844()
{
  unint64_t result = qword_26B1E85A0;
  if (!qword_26B1E85A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85A0);
  }
  return result;
}

unint64_t sub_24EFB389C()
{
  unint64_t result = qword_26B1E8598;
  if (!qword_26B1E8598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8598);
  }
  return result;
}

unint64_t sub_24EFB38F4()
{
  unint64_t result = qword_26B1E8620;
  if (!qword_26B1E8620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8620);
  }
  return result;
}

unint64_t sub_24EFB394C()
{
  unint64_t result = qword_26B1E8618;
  if (!qword_26B1E8618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8618);
  }
  return result;
}

unint64_t sub_24EFB39A4()
{
  unint64_t result = qword_26B1E85D8;
  if (!qword_26B1E85D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85D8);
  }
  return result;
}

unint64_t sub_24EFB39FC()
{
  unint64_t result = qword_26B1E85D0;
  if (!qword_26B1E85D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85D0);
  }
  return result;
}

unint64_t sub_24EFB3A54()
{
  unint64_t result = qword_26B1E85B0;
  if (!qword_26B1E85B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85B0);
  }
  return result;
}

unint64_t sub_24EFB3AAC()
{
  unint64_t result = qword_26B1E85A8;
  if (!qword_26B1E85A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E85A8);
  }
  return result;
}

unint64_t sub_24EFB3B04()
{
  unint64_t result = qword_26B1E8568;
  if (!qword_26B1E8568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8568);
  }
  return result;
}

unint64_t sub_24EFB3B5C()
{
  unint64_t result = qword_26B1E8560;
  if (!qword_26B1E8560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8560);
  }
  return result;
}

unint64_t sub_24EFB3BB4()
{
  unint64_t result = qword_26B1E8630;
  if (!qword_26B1E8630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8630);
  }
  return result;
}

unint64_t sub_24EFB3C0C()
{
  unint64_t result = qword_26B1E8628;
  if (!qword_26B1E8628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8628);
  }
  return result;
}

unint64_t sub_24EFB3C64()
{
  unint64_t result = qword_26B1E8558;
  if (!qword_26B1E8558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8558);
  }
  return result;
}

unint64_t sub_24EFB3CBC()
{
  unint64_t result = qword_26B1E8550;
  if (!qword_26B1E8550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8550);
  }
  return result;
}

unint64_t sub_24EFB3D14()
{
  unint64_t result = qword_26B1E8518;
  if (!qword_26B1E8518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8518);
  }
  return result;
}

unint64_t sub_24EFB3D6C()
{
  unint64_t result = qword_26B1E8510;
  if (!qword_26B1E8510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8510);
  }
  return result;
}

unint64_t sub_24EFB3DC0()
{
  unint64_t result = qword_2699981B8;
  if (!qword_2699981B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699981B8);
  }
  return result;
}

unint64_t sub_24EFB3E14()
{
  unint64_t result = qword_2699981C0;
  if (!qword_2699981C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699981C0);
  }
  return result;
}

uint64_t sub_24EFB3E68(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24EFB3ED4()
{
  unint64_t result = qword_2699981C8;
  if (!qword_2699981C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699981C8);
  }
  return result;
}

unint64_t sub_24EFB3F28()
{
  unint64_t result = qword_2699981D0;
  if (!qword_2699981D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699981D0);
  }
  return result;
}

unint64_t sub_24EFB3F7C()
{
  unint64_t result = qword_2699981D8;
  if (!qword_2699981D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699981D8);
  }
  return result;
}

BOOL static NetworkConditions.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24EFB3FE8(char a1)
{
  return *(void *)&aAvailablunavai[8 * a1];
}

uint64_t sub_24EFB4008(uint64_t a1)
{
  unint64_t v2 = sub_24EFB468C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB4044(uint64_t a1)
{
  unint64_t v2 = sub_24EFB468C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB4080()
{
  return sub_24EFB3FE8(*v0);
}

uint64_t sub_24EFB4088@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB47B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EFB40B0(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24EFB40BC(uint64_t a1)
{
  unint64_t v2 = sub_24EFB4590();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB40F8(uint64_t a1)
{
  unint64_t v2 = sub_24EFB4590();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB4134(uint64_t a1)
{
  unint64_t v2 = sub_24EFB4638();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB4170(uint64_t a1)
{
  unint64_t v2 = sub_24EFB4638();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB41AC(uint64_t a1)
{
  unint64_t v2 = sub_24EFB45E4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB41E8(uint64_t a1)
{
  unint64_t v2 = sub_24EFB45E4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NetworkConditions.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699981E0);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699981E8);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699981F0);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  long long v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699981F8);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFB4590();
  sub_24EFED9A0();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_24EFB4638();
      sub_24EFED820();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_24EFB45E4();
      uint64_t v15 = v21;
      sub_24EFED820();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_24EFB468C();
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_24EFB4590()
{
  unint64_t result = qword_269998200;
  if (!qword_269998200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998200);
  }
  return result;
}

unint64_t sub_24EFB45E4()
{
  unint64_t result = qword_269998208;
  if (!qword_269998208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998208);
  }
  return result;
}

unint64_t sub_24EFB4638()
{
  unint64_t result = qword_269998210;
  if (!qword_269998210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998210);
  }
  return result;
}

unint64_t sub_24EFB468C()
{
  unint64_t result = qword_269998218;
  if (!qword_269998218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998218);
  }
  return result;
}

void *NetworkConditions.init(from:)(void *a1)
{
  return sub_24EFB4910(a1);
}

void *sub_24EFB46F8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24EFB4910(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24EFB4724(void *a1)
{
  return NetworkConditions.encode(to:)(a1, *v1);
}

uint64_t NetworkConditions.hash(into:)()
{
  return sub_24EFED950();
}

uint64_t NetworkConditions.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t sub_24EFB47B0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C62616C69617661 && a2 == 0xE900000000000065;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616C696176616E75 && a2 == 0xEB00000000656C62 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_24EFB4910(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998270);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998278);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998280);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998288);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFB4590();
  uint64_t v12 = (uint64_t)v30;
  sub_24EFED990();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  char v14 = v11;
  uint64_t v15 = sub_24EFED810();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_24EFED6C0();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
    void *v11 = &type metadata for NetworkConditions;
    sub_24EFED780();
    sub_24EFED6B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_24EFB4638();
      sub_24EFED770();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_24EFB45E4();
      sub_24EFED770();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_24EFB468C();
    sub_24EFED770();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v11;
}

unint64_t sub_24EFB4E84()
{
  unint64_t result = qword_269998220;
  if (!qword_269998220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998220);
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkConditions()
{
  return &type metadata for NetworkConditions;
}

unsigned char *_s13FitnessForYou17NetworkConditionsOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFB4FBCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkConditions.CodingKeys()
{
  return &type metadata for NetworkConditions.CodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.AvailableCodingKeys()
{
  return &type metadata for NetworkConditions.AvailableCodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.UnavailableCodingKeys()
{
  return &type metadata for NetworkConditions.UnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.UnknownCodingKeys()
{
  return &type metadata for NetworkConditions.UnknownCodingKeys;
}

unint64_t sub_24EFB5028()
{
  unint64_t result = qword_269998228;
  if (!qword_269998228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998228);
  }
  return result;
}

unint64_t sub_24EFB5080()
{
  unint64_t result = qword_269998230;
  if (!qword_269998230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998230);
  }
  return result;
}

unint64_t sub_24EFB50D8()
{
  unint64_t result = qword_269998238;
  if (!qword_269998238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998238);
  }
  return result;
}

unint64_t sub_24EFB5130()
{
  unint64_t result = qword_269998240;
  if (!qword_269998240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998240);
  }
  return result;
}

unint64_t sub_24EFB5188()
{
  unint64_t result = qword_269998248;
  if (!qword_269998248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998248);
  }
  return result;
}

unint64_t sub_24EFB51E0()
{
  unint64_t result = qword_269998250;
  if (!qword_269998250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998250);
  }
  return result;
}

unint64_t sub_24EFB5238()
{
  unint64_t result = qword_269998258;
  if (!qword_269998258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998258);
  }
  return result;
}

unint64_t sub_24EFB5290()
{
  unint64_t result = qword_269998260;
  if (!qword_269998260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998260);
  }
  return result;
}

unint64_t sub_24EFB52E8()
{
  unint64_t result = qword_269998268;
  if (!qword_269998268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998268);
  }
  return result;
}

FitnessForYou::SubtitleTextType_optional __swiftcall SubtitleTextType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_24EFED760();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = FitnessForYou_SubtitleTextType_text;
  }
  else {
    v2.value = FitnessForYou_SubtitleTextType_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t SubtitleTextType.rawValue.getter(char a1)
{
  if (a1) {
    return 1954047348;
  }
  else {
    return 0x657069636572;
  }
}

uint64_t sub_24EFB53BC(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = SubtitleTextType.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == SubtitleTextType.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24EFED8B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24EFB5448@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24EFED760();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_24EFB54A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SubtitleTextType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24EFB54D4()
{
  return sub_24EFED590();
}

uint64_t sub_24EFB5534()
{
  return sub_24EFED580();
}

unint64_t sub_24EFB5588()
{
  unint64_t result = qword_269998290;
  if (!qword_269998290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998290);
  }
  return result;
}

uint64_t sub_24EFB55DC()
{
  char v1 = *v0;
  sub_24EFED940();
  SubtitleTextType.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t sub_24EFB5640()
{
  SubtitleTextType.rawValue.getter(*v0);
  sub_24EFED560();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFB5694()
{
  char v1 = *v0;
  sub_24EFED940();
  SubtitleTextType.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t getEnumTagSinglePayload for PlaceholderMarkerType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SubtitleTextType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFB5850);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_24EFB5878(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SubtitleTextType()
{
  return &type metadata for SubtitleTextType;
}

unint64_t sub_24EFB5894()
{
  unint64_t result = qword_26B1E86D8;
  if (!qword_26B1E86D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E86D8);
  }
  return result;
}

BOOL static RemoteBrowsingIdentity.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24EFB58F8(char a1)
{
  if (a1) {
    return 0x7069636974726170;
  }
  else {
    return 0x756F6D796E6F6E61;
  }
}

uint64_t sub_24EFB593C(uint64_t a1)
{
  unint64_t v2 = sub_24EFB5E50();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB5978(uint64_t a1)
{
  unint64_t v2 = sub_24EFB5E50();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_24EFB59B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24EFB59CC()
{
  return sub_24EFB58F8(*v0);
}

uint64_t sub_24EFB59D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB5F7C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EFB59FC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24EFB5A08(uint64_t a1)
{
  unint64_t v2 = sub_24EFB5DA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB5A44(uint64_t a1)
{
  unint64_t v2 = sub_24EFB5DA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB5A80(uint64_t a1)
{
  unint64_t v2 = sub_24EFB5DFC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB5ABC(uint64_t a1)
{
  unint64_t v2 = sub_24EFB5DFC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RemoteBrowsingIdentity.encode(to:)(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998298);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699982A0);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  int v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699982A8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFB5DA8();
  sub_24EFED9A0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_24EFB5DFC();
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_24EFB5E50();
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

unint64_t sub_24EFB5DA8()
{
  unint64_t result = qword_2699982B0;
  if (!qword_2699982B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982B0);
  }
  return result;
}

unint64_t sub_24EFB5DFC()
{
  unint64_t result = qword_2699982B8;
  if (!qword_2699982B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982B8);
  }
  return result;
}

unint64_t sub_24EFB5E50()
{
  unint64_t result = qword_2699982C0;
  if (!qword_2699982C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982C0);
  }
  return result;
}

uint64_t RemoteBrowsingIdentity.init(from:)(uint64_t a1)
{
  return sub_24EFB6080(a1) & 1;
}

uint64_t sub_24EFB5EC0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_24EFB6080(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_24EFB5EF0(void *a1)
{
  return RemoteBrowsingIdentity.encode(to:)(a1, *v1);
}

uint64_t RemoteBrowsingIdentity.hash(into:)()
{
  return sub_24EFED950();
}

uint64_t RemoteBrowsingIdentity.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t sub_24EFB5F7C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x756F6D796E6F6E61 && a2 == 0xE900000000000073;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7069636974726170 && a2 == 0xEB00000000746E61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EFB6080(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998308);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998310);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998318);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)a1, *(void *)(a1 + 24));
  sub_24EFB5DA8();
  uint64_t v12 = v26;
  sub_24EFED990();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_24EFED810();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_24EFED6C0();
    swift_allocError();
    int v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
    *int v18 = &type metadata for RemoteBrowsingIdentity;
    sub_24EFED780();
    sub_24EFED6B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_24EFB5DFC();
    sub_24EFED770();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_24EFB5E50();
    sub_24EFED770();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  __swift_destroy_boxed_opaque_existential_1(v26);
  return a1;
}

unint64_t sub_24EFB64D4()
{
  unint64_t result = qword_2699982C8;
  if (!qword_2699982C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdentity()
{
  return &type metadata for RemoteBrowsingIdentity;
}

unsigned char *_s13FitnessForYou22RemoteBrowsingIdentityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFB660CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdentity.CodingKeys()
{
  return &type metadata for RemoteBrowsingIdentity.CodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdentity.AnonymousCodingKeys()
{
  return &type metadata for RemoteBrowsingIdentity.AnonymousCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdentity.ParticipantCodingKeys()
{
  return &type metadata for RemoteBrowsingIdentity.ParticipantCodingKeys;
}

unint64_t sub_24EFB6668()
{
  unint64_t result = qword_2699982D0;
  if (!qword_2699982D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982D0);
  }
  return result;
}

unint64_t sub_24EFB66C0()
{
  unint64_t result = qword_2699982D8;
  if (!qword_2699982D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982D8);
  }
  return result;
}

unint64_t sub_24EFB6718()
{
  unint64_t result = qword_2699982E0;
  if (!qword_2699982E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982E0);
  }
  return result;
}

unint64_t sub_24EFB6770()
{
  unint64_t result = qword_2699982E8;
  if (!qword_2699982E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982E8);
  }
  return result;
}

unint64_t sub_24EFB67C8()
{
  unint64_t result = qword_2699982F0;
  if (!qword_2699982F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982F0);
  }
  return result;
}

unint64_t sub_24EFB6820()
{
  unint64_t result = qword_2699982F8;
  if (!qword_2699982F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699982F8);
  }
  return result;
}

unint64_t sub_24EFB6878()
{
  unint64_t result = qword_269998300;
  if (!qword_269998300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998300);
  }
  return result;
}

uint64_t ForYouPerformanceMetric.pageAppearTime.getter()
{
  return *(void *)v0;
}

uint64_t ForYouPerformanceMetric.pageAppearTime.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.pageAppearTime.modify())()
{
  return nullsub_1;
}

uint64_t ForYouPerformanceMetric.pageRequestTime.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ForYouPerformanceMetric.pageRequestTime.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.pageRequestTime.modify())()
{
  return nullsub_1;
}

uint64_t ForYouPerformanceMetric.resourceRequestStartTime.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t ForYouPerformanceMetric.resourceRequestStartTime.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 32) = result;
  *(unsigned char *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.resourceRequestStartTime.modify())()
{
  return nullsub_1;
}

uint64_t ForYouPerformanceMetric.secondaryDataRequestStartTime.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t ForYouPerformanceMetric.secondaryDataRequestStartTime.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 48) = result;
  *(unsigned char *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.secondaryDataRequestStartTime.modify())()
{
  return nullsub_1;
}

uint64_t ForYouPerformanceMetric.secondaryDataResponseEndTime.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t ForYouPerformanceMetric.secondaryDataResponseEndTime.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 64) = result;
  *(unsigned char *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*ForYouPerformanceMetric.secondaryDataResponseEndTime.modify())()
{
  return nullsub_1;
}

void __swiftcall ForYouPerformanceMetric.init(pageAppearTime:pageRequestTime:resourceRequestStartTime:secondaryDataRequestStartTime:secondaryDataResponseEndTime:)(FitnessForYou::ForYouPerformanceMetric *__return_ptr retstr, Swift::Double_optional pageAppearTime, Swift::Double_optional pageRequestTime, Swift::Double_optional resourceRequestStartTime, Swift::Double_optional secondaryDataRequestStartTime, Swift::Double_optional secondaryDataResponseEndTime)
{
  retstr->pageAppearTime.value = *(Swift::Double *)&pageAppearTime.is_nil;
  retstr->pageAppearTime.is_nil = pageRequestTime.is_nil;
  retstr->pageRequestTime.value = *(Swift::Double *)&resourceRequestStartTime.is_nil;
  retstr->pageRequestTime.is_nil = secondaryDataRequestStartTime.is_nil;
  retstr->resourceRequestStartTime.value = *(Swift::Double *)&secondaryDataResponseEndTime.is_nil;
  retstr->resourceRequestStartTime.is_nil = v6 & 1;
  retstr->secondaryDataRequestStartTime.value = v7;
  retstr->secondaryDataRequestStartTime.is_nil = v8 & 1;
  retstr->secondaryDataResponseEndTime.value = v9;
  retstr->secondaryDataResponseEndTime.is_nil = v10 & 1;
}

unint64_t sub_24EFB6A48(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7571655265676170;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      unint64_t result = 0x6570704165676170;
      break;
  }
  return result;
}

unint64_t sub_24EFB6B0C()
{
  return sub_24EFB6A48(*v0);
}

uint64_t sub_24EFB6B14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB778C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFB6B3C(uint64_t a1)
{
  unint64_t v2 = sub_24EFB6DFC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB6B78(uint64_t a1)
{
  unint64_t v2 = sub_24EFB6DFC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ForYouPerformanceMetric.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998320);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(v1 + 16);
  int v15 = *(unsigned __int8 *)(v1 + 24);
  uint64_t v14 = *(void *)(v1 + 32);
  int v13 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v12 = *(void *)(v1 + 48);
  int v11 = *(unsigned __int8 *)(v1 + 56);
  uint64_t v10 = *(void *)(v1 + 64);
  v9[3] = *(unsigned __int8 *)(v1 + 72);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFB6DFC();
  sub_24EFED9A0();
  char v22 = 0;
  uint64_t v7 = v17;
  sub_24EFED840();
  if (!v7)
  {
    char v21 = 1;
    sub_24EFED840();
    char v20 = 2;
    sub_24EFED840();
    char v19 = 3;
    sub_24EFED840();
    char v18 = 4;
    sub_24EFED840();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24EFB6DFC()
{
  unint64_t result = qword_269998328;
  if (!qword_269998328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998328);
  }
  return result;
}

uint64_t ForYouPerformanceMetric.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998330);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFB6DFC();
  sub_24EFED990();
  if (!v2)
  {
    char v33 = 0;
    uint64_t v9 = sub_24EFED7A0();
    char v11 = v10;
    char v32 = 1;
    uint64_t v12 = sub_24EFED7A0();
    int v27 = v13;
    uint64_t v28 = v12;
    char v31 = 2;
    uint64_t v14 = sub_24EFED7A0();
    int v25 = v15;
    uint64_t v26 = v14;
    char v30 = 3;
    uint64_t v16 = sub_24EFED7A0();
    HIDWORD(v23) = v17;
    uint64_t v24 = v16;
    char v29 = 4;
    uint64_t v19 = sub_24EFED7A0();
    char v20 = v8;
    char v22 = v21;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v20, v5);
    *(void *)a2 = v9;
    *(unsigned char *)(a2 + 8) = v11 & 1;
    *(void *)(a2 + 16) = v28;
    *(unsigned char *)(a2 + 24) = v27 & 1;
    *(void *)(a2 + 32) = v26;
    *(unsigned char *)(a2 + 40) = v25 & 1;
    *(void *)(a2 + 48) = v24;
    *(unsigned char *)(a2 + 56) = BYTE4(v23) & 1;
    *(void *)(a2 + 64) = v19;
    *(unsigned char *)(a2 + 72) = v22 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24EFB70CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ForYouPerformanceMetric.init(from:)(a1, a2);
}

uint64_t sub_24EFB70E4(void *a1)
{
  return ForYouPerformanceMetric.encode(to:)(a1);
}

uint64_t ForYouPerformanceMetric.hash(into:)()
{
  int v1 = v0[24];
  int v2 = v0[40];
  int v3 = v0[56];
  int v4 = v0[72];
  if (v0[8] == 1)
  {
    sub_24EFED960();
    if (!v1) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_24EFED960();
    sub_24EFED970();
    if (!v1)
    {
LABEL_3:
      sub_24EFED960();
      sub_24EFED970();
      if (!v2) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  sub_24EFED960();
  if (!v2)
  {
LABEL_4:
    sub_24EFED960();
    sub_24EFED970();
    if (!v3) {
      goto LABEL_5;
    }
LABEL_10:
    sub_24EFED960();
    if (!v4) {
      goto LABEL_6;
    }
    return sub_24EFED960();
  }
LABEL_9:
  sub_24EFED960();
  if (v3) {
    goto LABEL_10;
  }
LABEL_5:
  sub_24EFED960();
  sub_24EFED970();
  if (!v4)
  {
LABEL_6:
    sub_24EFED960();
    return sub_24EFED970();
  }
  return sub_24EFED960();
}

uint64_t ForYouPerformanceMetric.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t sub_24EFB72B8()
{
  return sub_24EFED980();
}

uint64_t sub_24EFB7350()
{
  return sub_24EFED980();
}

BOOL _s13FitnessForYou0bC17PerformanceMetricV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8))
  {
    if (!*(unsigned char *)(a2 + 8)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)a1 != *(double *)a2) {
      char v2 = 1;
    }
    if (v2) {
      return 0;
    }
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if (!*(unsigned char *)(a2 + 24)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)(a1 + 16) == *(double *)(a2 + 16)) {
      char v3 = *(unsigned char *)(a2 + 24);
    }
    else {
      char v3 = 1;
    }
    if (v3) {
      return 0;
    }
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (!*(unsigned char *)(a2 + 40)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)(a1 + 32) == *(double *)(a2 + 32)) {
      char v4 = *(unsigned char *)(a2 + 40);
    }
    else {
      char v4 = 1;
    }
    if (v4) {
      return 0;
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if (!*(unsigned char *)(a2 + 56)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)(a1 + 48) == *(double *)(a2 + 48)) {
      char v5 = *(unsigned char *)(a2 + 56);
    }
    else {
      char v5 = 1;
    }
    if (v5) {
      return 0;
    }
  }
  if ((*(unsigned char *)(a1 + 72) & 1) == 0)
  {
    if (*(double *)(a1 + 64) == *(double *)(a2 + 64)) {
      char v7 = *(unsigned char *)(a2 + 72);
    }
    else {
      char v7 = 1;
    }
    return (v7 & 1) == 0;
  }
  return (*(unsigned char *)(a2 + 72) & 1) != 0;
}

unint64_t sub_24EFB74BC()
{
  unint64_t result = qword_269998338;
  if (!qword_269998338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998338);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ForYouPerformanceMetric(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 73)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ForYouPerformanceMetric(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)unint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 73) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ForYouPerformanceMetric()
{
  return &type metadata for ForYouPerformanceMetric;
}

unsigned char *storeEnumTagSinglePayload for ForYouPerformanceMetric.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFB764CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouPerformanceMetric.CodingKeys()
{
  return &type metadata for ForYouPerformanceMetric.CodingKeys;
}

unint64_t sub_24EFB7688()
{
  unint64_t result = qword_269998340;
  if (!qword_269998340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998340);
  }
  return result;
}

unint64_t sub_24EFB76E0()
{
  unint64_t result = qword_269998348;
  if (!qword_269998348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998348);
  }
  return result;
}

unint64_t sub_24EFB7738()
{
  unint64_t result = qword_269998350;
  if (!qword_269998350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998350);
  }
  return result;
}

uint64_t sub_24EFB778C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6570704165676170 && a2 == 0xEE00656D69547261;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7571655265676170 && a2 == 0xEF656D6954747365 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024EFF4CC0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000024EFF4CE0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000024EFF4D00)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

FitnessForYou::PlaceholderMarkerType_optional __swiftcall PlaceholderMarkerType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_24EFED760();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = FitnessForYou_PlaceholderMarkerType_buildYourFirstCustomPlan;
  }
  else {
    v2.value = FitnessForYou_PlaceholderMarkerType_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t PlaceholderMarkerType.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000018;
  }
  else {
    return 0x737543646C697562;
  }
}

uint64_t sub_24EFB7A50(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = PlaceholderMarkerType.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == PlaceholderMarkerType.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24EFED8B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24EFB7ADC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24EFED760();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_24EFB7B3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PlaceholderMarkerType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24EFB7B68()
{
  return sub_24EFED590();
}

uint64_t sub_24EFB7BC8()
{
  return sub_24EFED580();
}

unint64_t sub_24EFB7C1C()
{
  unint64_t result = qword_269998358;
  if (!qword_269998358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998358);
  }
  return result;
}

uint64_t sub_24EFB7C70()
{
  char v1 = *v0;
  sub_24EFED940();
  PlaceholderMarkerType.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t sub_24EFB7CD4()
{
  PlaceholderMarkerType.rawValue.getter(*v0);
  sub_24EFED560();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFB7D28()
{
  char v1 = *v0;
  sub_24EFED940();
  PlaceholderMarkerType.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

unsigned char *storeEnumTagSinglePayload for PlaceholderMarkerType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFB7E54);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlaceholderMarkerType()
{
  return &type metadata for PlaceholderMarkerType;
}

unint64_t sub_24EFB7E8C()
{
  unint64_t result = qword_26B1E8710;
  if (!qword_26B1E8710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8710);
  }
  return result;
}

BOOL static SizeClass.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24EFB7EF0(char a1)
{
  return *(void *)&aExtrasmasmall[8 * a1];
}

uint64_t sub_24EFB7F10()
{
  return sub_24EFB7EF0(*v0);
}

uint64_t sub_24EFB7F18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFB8BC8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EFB7F40(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_24EFB7F4C(uint64_t a1)
{
  unint64_t v2 = sub_24EFB884C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB7F88(uint64_t a1)
{
  unint64_t v2 = sub_24EFB884C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB7FC4(uint64_t a1)
{
  unint64_t v2 = sub_24EFB88A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB8000(uint64_t a1)
{
  unint64_t v2 = sub_24EFB88A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB803C(uint64_t a1)
{
  unint64_t v2 = sub_24EFB8A44();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB8078(uint64_t a1)
{
  unint64_t v2 = sub_24EFB8A44();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB80B4(uint64_t a1)
{
  unint64_t v2 = sub_24EFB88F4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB80F0(uint64_t a1)
{
  unint64_t v2 = sub_24EFB88F4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB812C(uint64_t a1)
{
  unint64_t v2 = sub_24EFB8948();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB8168(uint64_t a1)
{
  unint64_t v2 = sub_24EFB8948();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB81A4(uint64_t a1)
{
  unint64_t v2 = sub_24EFB899C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB81E0(uint64_t a1)
{
  unint64_t v2 = sub_24EFB899C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFB821C(uint64_t a1)
{
  unint64_t v2 = sub_24EFB89F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB8258(uint64_t a1)
{
  unint64_t v2 = sub_24EFB89F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SizeClass.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998360);
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v37 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998368);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v34 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998370);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  MEMORY[0x270FA5388](v7);
  char v31 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998378);
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v28 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998380);
  uint64_t v26 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  MEMORY[0x270FA5388](v11);
  int v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998388);
  uint64_t v25 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998390);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  char v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFB884C();
  sub_24EFED9A0();
  switch((char)v40)
  {
    case 1:
      char v42 = 1;
      sub_24EFB89F0();
      sub_24EFED820();
      uint64_t v22 = v26;
      uint64_t v21 = v27;
      goto LABEL_8;
    case 2:
      char v43 = 2;
      sub_24EFB899C();
      int v13 = v28;
      sub_24EFED820();
      uint64_t v22 = v29;
      uint64_t v21 = v30;
      goto LABEL_8;
    case 3:
      char v44 = 3;
      sub_24EFB8948();
      int v13 = v31;
      sub_24EFED820();
      uint64_t v22 = v32;
      uint64_t v21 = v33;
      goto LABEL_8;
    case 4:
      char v45 = 4;
      sub_24EFB88F4();
      int v13 = v34;
      sub_24EFED820();
      uint64_t v22 = v35;
      uint64_t v21 = v36;
      goto LABEL_8;
    case 5:
      char v46 = 5;
      sub_24EFB88A0();
      int v13 = v37;
      sub_24EFED820();
      uint64_t v22 = v38;
      uint64_t v21 = v39;
LABEL_8:
      (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v21);
      break;
    default:
      char v41 = 0;
      sub_24EFB8A44();
      sub_24EFED820();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v14);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
}

unint64_t sub_24EFB884C()
{
  unint64_t result = qword_269998398;
  if (!qword_269998398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998398);
  }
  return result;
}

unint64_t sub_24EFB88A0()
{
  unint64_t result = qword_2699983A0;
  if (!qword_2699983A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983A0);
  }
  return result;
}

unint64_t sub_24EFB88F4()
{
  unint64_t result = qword_2699983A8;
  if (!qword_2699983A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983A8);
  }
  return result;
}

unint64_t sub_24EFB8948()
{
  unint64_t result = qword_2699983B0;
  if (!qword_2699983B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983B0);
  }
  return result;
}

unint64_t sub_24EFB899C()
{
  unint64_t result = qword_2699983B8;
  if (!qword_2699983B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983B8);
  }
  return result;
}

unint64_t sub_24EFB89F0()
{
  unint64_t result = qword_2699983C0;
  if (!qword_2699983C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983C0);
  }
  return result;
}

unint64_t sub_24EFB8A44()
{
  unint64_t result = qword_2699983C8;
  if (!qword_2699983C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983C8);
  }
  return result;
}

char *SizeClass.init(from:)(void *a1)
{
  return sub_24EFB8E1C(a1);
}

char *sub_24EFB8AB0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24EFB8E1C(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24EFB8ADC(void *a1)
{
  return SizeClass.encode(to:)(a1, *v1);
}

BOOL static SizeClass.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

BOOL sub_24EFB8B08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_24EFB8B1C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_24EFB8B30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_24EFB8B44(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t SizeClass.hash(into:)()
{
  return sub_24EFED950();
}

uint64_t SizeClass.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t sub_24EFB8BC8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x616D536172747865 && a2 == 0xEA00000000006C6CLL || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6C616D73 && a2 == 0xE500000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72616C75676572 && a2 == 0xE700000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D756964656DLL && a2 == 0xE600000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656772616CLL && a2 == 0xE500000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x72614C6172747865 && a2 == 0xEA00000000006567)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

char *sub_24EFB8E1C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998450);
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v55 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998458);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v54 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998460);
  uint64_t v46 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v53 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998468);
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  MEMORY[0x270FA5388](v8);
  v52 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998470);
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998478);
  uint64_t v43 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998480);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1[3];
  uint64_t v56 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_24EFB884C();
  uint64_t v21 = v57;
  sub_24EFED990();
  if (!v21)
  {
    uint64_t v38 = v13;
    uint64_t v39 = v15;
    uint64_t v40 = v12;
    uint64_t v22 = v52;
    uint64_t v23 = v53;
    uint64_t v24 = v54;
    uint64_t v25 = v55;
    uint64_t v57 = (char *)v16;
    uint64_t v26 = v19;
    uint64_t v27 = sub_24EFED810();
    if (*(void *)(v27 + 16) == 1)
    {
      uint64_t v19 = (char *)*(unsigned __int8 *)(v27 + 32);
      switch(*(unsigned char *)(v27 + 32))
      {
        case 1:
          char v59 = 1;
          sub_24EFB89F0();
          uint64_t v24 = v40;
          uint64_t v29 = v57;
          sub_24EFED770();
          uint64_t v35 = v44;
          uint64_t v34 = v45;
          goto LABEL_12;
        case 2:
          char v60 = 2;
          sub_24EFB899C();
          uint64_t v24 = v22;
          uint64_t v29 = v57;
          sub_24EFED770();
          uint64_t v35 = v47;
          uint64_t v34 = v48;
          goto LABEL_12;
        case 3:
          char v61 = 3;
          sub_24EFB8948();
          uint64_t v36 = v57;
          sub_24EFED770();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v23, v49);
          goto LABEL_14;
        case 4:
          char v62 = 4;
          sub_24EFB88F4();
          uint64_t v29 = v57;
          sub_24EFED770();
          uint64_t v34 = v50;
          uint64_t v35 = v51;
LABEL_12:
          (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v34);
          goto LABEL_13;
        case 5:
          char v63 = 5;
          sub_24EFB88A0();
          uint64_t v36 = v57;
          sub_24EFED770();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v42);
LABEL_14:
          swift_bridgeObjectRelease();
          (*(void (**)(char *, char *))(v17 + 8))(v26, v36);
          break;
        default:
          char v58 = 0;
          sub_24EFB8A44();
          uint64_t v28 = v39;
          uint64_t v29 = v57;
          sub_24EFED770();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v38);
LABEL_13:
          swift_bridgeObjectRelease();
          (*(void (**)(char *, char *))(v17 + 8))(v26, v29);
          break;
      }
    }
    else
    {
      uint64_t v30 = sub_24EFED6C0();
      swift_allocError();
      uint64_t v32 = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
      *uint64_t v32 = &type metadata for SizeClass;
      uint64_t v19 = v57;
      sub_24EFED780();
      sub_24EFED6B0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v17 + 8))(v26, v19);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  return v19;
}

unint64_t sub_24EFB95C8()
{
  unint64_t result = qword_2699983D0;
  if (!qword_2699983D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeClass()
{
  return &type metadata for SizeClass;
}

uint64_t _s13FitnessForYou9SizeClassOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s13FitnessForYou9SizeClassOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFB9790);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeClass.CodingKeys()
{
  return &type metadata for SizeClass.CodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.ExtraSmallCodingKeys()
{
  return &type metadata for SizeClass.ExtraSmallCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.SmallCodingKeys()
{
  return &type metadata for SizeClass.SmallCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.RegularCodingKeys()
{
  return &type metadata for SizeClass.RegularCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.MediumCodingKeys()
{
  return &type metadata for SizeClass.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.LargeCodingKeys()
{
  return &type metadata for SizeClass.LargeCodingKeys;
}

ValueMetadata *type metadata accessor for SizeClass.ExtraLargeCodingKeys()
{
  return &type metadata for SizeClass.ExtraLargeCodingKeys;
}

unint64_t sub_24EFB982C()
{
  unint64_t result = qword_2699983D8;
  if (!qword_2699983D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983D8);
  }
  return result;
}

unint64_t sub_24EFB9884()
{
  unint64_t result = qword_2699983E0;
  if (!qword_2699983E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983E0);
  }
  return result;
}

unint64_t sub_24EFB98DC()
{
  unint64_t result = qword_2699983E8;
  if (!qword_2699983E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983E8);
  }
  return result;
}

unint64_t sub_24EFB9934()
{
  unint64_t result = qword_2699983F0;
  if (!qword_2699983F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983F0);
  }
  return result;
}

unint64_t sub_24EFB998C()
{
  unint64_t result = qword_2699983F8;
  if (!qword_2699983F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699983F8);
  }
  return result;
}

unint64_t sub_24EFB99E4()
{
  unint64_t result = qword_269998400;
  if (!qword_269998400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998400);
  }
  return result;
}

unint64_t sub_24EFB9A3C()
{
  unint64_t result = qword_269998408;
  if (!qword_269998408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998408);
  }
  return result;
}

unint64_t sub_24EFB9A94()
{
  unint64_t result = qword_269998410;
  if (!qword_269998410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998410);
  }
  return result;
}

unint64_t sub_24EFB9AEC()
{
  unint64_t result = qword_269998418;
  if (!qword_269998418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998418);
  }
  return result;
}

unint64_t sub_24EFB9B44()
{
  unint64_t result = qword_269998420;
  if (!qword_269998420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998420);
  }
  return result;
}

unint64_t sub_24EFB9B9C()
{
  unint64_t result = qword_269998428;
  if (!qword_269998428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998428);
  }
  return result;
}

unint64_t sub_24EFB9BF4()
{
  unint64_t result = qword_269998430;
  if (!qword_269998430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998430);
  }
  return result;
}

unint64_t sub_24EFB9C4C()
{
  unint64_t result = qword_269998438;
  if (!qword_269998438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998438);
  }
  return result;
}

unint64_t sub_24EFB9CA4()
{
  unint64_t result = qword_269998440;
  if (!qword_269998440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998440);
  }
  return result;
}

unint64_t sub_24EFB9CFC()
{
  unint64_t result = qword_269998448;
  if (!qword_269998448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998448);
  }
  return result;
}

double ContentMargins.bottom.getter()
{
  return *(double *)v0;
}

double ContentMargins.leading.getter()
{
  return *(double *)(v0 + 8);
}

double ContentMargins.top.getter()
{
  return *(double *)(v0 + 16);
}

double ContentMargins.trailing.getter()
{
  return *(double *)(v0 + 24);
}

void ContentMargins.init(top:leading:bottom:trailing:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a4;
  a1[1] = a3;
  a1[2] = a2;
  a1[3] = a5;
}

uint64_t sub_24EFB9D7C(char a1)
{
  return *(void *)&aBottom_0[8 * a1];
}

uint64_t sub_24EFB9D9C()
{
  return sub_24EFB9D7C(*v0);
}

uint64_t sub_24EFB9DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFBA82C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFB9DCC(uint64_t a1)
{
  unint64_t v2 = sub_24EFBA050();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFB9E08(uint64_t a1)
{
  unint64_t v2 = sub_24EFBA050();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ContentMargins.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998488);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v11 = v1[2];
  uint64_t v10 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFBA050();
  sub_24EFED9A0();
  uint64_t v14 = v9;
  HIBYTE(v13) = 0;
  sub_24EFBA0A4();
  sub_24EFED8A0();
  if (!v2)
  {
    uint64_t v14 = v8;
    HIBYTE(v13) = 1;
    sub_24EFED8A0();
    uint64_t v14 = v11;
    HIBYTE(v13) = 2;
    sub_24EFED8A0();
    uint64_t v14 = v10;
    HIBYTE(v13) = 3;
    sub_24EFED8A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24EFBA050()
{
  unint64_t result = qword_269998490;
  if (!qword_269998490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998490);
  }
  return result;
}

unint64_t sub_24EFBA0A4()
{
  unint64_t result = qword_269998498;
  if (!qword_269998498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998498);
  }
  return result;
}

uint64_t ContentMargins.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699984A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFBA050();
  sub_24EFED990();
  if (!v2)
  {
    HIBYTE(v14) = 0;
    sub_24EFBA354();
    sub_24EFED800();
    uint64_t v9 = v15;
    HIBYTE(v14) = 1;
    sub_24EFED800();
    uint64_t v10 = v15;
    HIBYTE(v14) = 2;
    sub_24EFED800();
    uint64_t v12 = v15;
    HIBYTE(v14) = 3;
    sub_24EFED800();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v15;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24EFBA354()
{
  unint64_t result = qword_2699984A8;
  if (!qword_2699984A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699984A8);
  }
  return result;
}

uint64_t sub_24EFBA3A8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ContentMargins.init(from:)(a1, a2);
}

uint64_t sub_24EFBA3C0(void *a1)
{
  return ContentMargins.encode(to:)(a1);
}

uint64_t ContentMargins.hash(into:)()
{
  return sub_24EFED970();
}

uint64_t ContentMargins.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t sub_24EFBA494()
{
  return sub_24EFED980();
}

uint64_t sub_24EFBA4E4()
{
  return sub_24EFED980();
}

BOOL _s13FitnessForYou14ContentMarginsV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

unint64_t sub_24EFBA570()
{
  unint64_t result = qword_2699984B0;
  if (!qword_2699984B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699984B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ContentMargins(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ContentMargins(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ContentMargins()
{
  return &type metadata for ContentMargins;
}

unsigned char *storeEnumTagSinglePayload for ContentMargins.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFBA6ECLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentMargins.CodingKeys()
{
  return &type metadata for ContentMargins.CodingKeys;
}

unint64_t sub_24EFBA728()
{
  unint64_t result = qword_2699984B8;
  if (!qword_2699984B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699984B8);
  }
  return result;
}

unint64_t sub_24EFBA780()
{
  unint64_t result = qword_2699984C0;
  if (!qword_2699984C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699984C0);
  }
  return result;
}

unint64_t sub_24EFBA7D8()
{
  unint64_t result = qword_2699984C8;
  if (!qword_2699984C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699984C8);
  }
  return result;
}

uint64_t sub_24EFBA82C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6D6F74746F62 && a2 == 0xE600000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696461656CLL && a2 == 0xE700000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7368564 && a2 == 0xE300000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E696C69617274 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

BOOL sub_24EFBA9B8()
{
  uint64_t v1 = type metadata accessor for ForYouState();
  return *(void *)(v0 + *(int *)(v1 + 64)) < *(void *)(v0 + *(int *)(v1 + 56));
}

uint64_t AwardCanvasPlaceholder.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AwardCanvasPlaceholder.referenceType.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t AwardCanvasPlaceholder.score.getter()
{
  return *(void *)(v0 + 24);
}

void __swiftcall AwardCanvasPlaceholder.init(identifier:referenceType:score:)(FitnessForYou::AwardCanvasPlaceholder *__return_ptr retstr, Swift::String identifier, FitnessForYou::PlaceholderReferenceType referenceType, Swift::Double_optional score)
{
  retstr->identifier = identifier;
  retstr->referenceType = referenceType;
  retstr->score.value = *(Swift::Double *)&score.is_nil;
  retstr->score.is_nil = v4 & 1;
}

uint64_t sub_24EFBAA48(char a1)
{
  return *(void *)&aIdentifirefere[8 * a1];
}

uint64_t sub_24EFBAA68()
{
  return sub_24EFBAA48(*v0);
}

uint64_t sub_24EFBAA70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFBB774(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFBAA98(uint64_t a1)
{
  unint64_t v2 = sub_24EFBACE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBAAD4(uint64_t a1)
{
  unint64_t v2 = sub_24EFBACE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AwardCanvasPlaceholder.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8958);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  v9[3] = *(unsigned __int8 *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFBACE4();
  sub_24EFED9A0();
  char v16 = 0;
  uint64_t v7 = v11;
  sub_24EFED860();
  if (!v7)
  {
    char v15 = v12;
    char v14 = 1;
    sub_24EFA30AC();
    sub_24EFED8A0();
    char v13 = 2;
    sub_24EFED840();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24EFBACE4()
{
  unint64_t result = qword_26B1E8718;
  if (!qword_26B1E8718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8718);
  }
  return result;
}

uint64_t AwardCanvasPlaceholder.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699984D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFBACE4();
  sub_24EFED990();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v22 = 0;
  uint64_t v9 = sub_24EFED7C0();
  uint64_t v11 = v10;
  char v20 = 1;
  sub_24EFA3710();
  swift_bridgeObjectRetain();
  sub_24EFED800();
  int v18 = v21;
  char v19 = 2;
  uint64_t v13 = sub_24EFED7A0();
  char v14 = v8;
  char v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v18;
  *(void *)(a2 + 24) = v13;
  *(unsigned char *)(a2 + 32) = v16 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFBAF74@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AwardCanvasPlaceholder.init(from:)(a1, a2);
}

uint64_t sub_24EFBAF8C(void *a1)
{
  return AwardCanvasPlaceholder.encode(to:)(a1);
}

uint64_t AwardCanvasPlaceholder.hash(into:)()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    return sub_24EFED960();
  }
  sub_24EFED960();
  return sub_24EFED970();
}

uint64_t AwardCanvasPlaceholder.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  sub_24EFED940();
  sub_24EFED560();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  sub_24EFED960();
  if (v1 != 1) {
    sub_24EFED970();
  }
  return sub_24EFED980();
}

uint64_t sub_24EFBB140()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  sub_24EFED560();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    return sub_24EFED960();
  }
  sub_24EFED960();
  return sub_24EFED970();
}

uint64_t sub_24EFBB1E4()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  sub_24EFED940();
  sub_24EFED560();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  sub_24EFED960();
  if (v1 != 1) {
    sub_24EFED970();
  }
  return sub_24EFED980();
}

uint64_t _s13FitnessForYou22AwardCanvasPlaceholderV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a1 + 16);
  double v3 = *(double *)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);
  char v5 = *(unsigned char *)(a2 + 16);
  double v6 = *(double *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  BOOL v8 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v8 || (v9 = sub_24EFED8B0(), uint64_t result = 0, (v9 & 1) != 0))
  {
    if ((sub_24EFD8D14(v2, v5) & 1) == 0) {
      return 0;
    }
    if (v4)
    {
      if ((v7 & 1) == 0) {
        return 0;
      }
    }
    else
    {
      if (v3 == v6) {
        char v11 = v7;
      }
      else {
        char v11 = 1;
      }
      if (v11) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

unint64_t sub_24EFBB35C()
{
  unint64_t result = qword_2699984D8;
  if (!qword_2699984D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699984D8);
  }
  return result;
}

uint64_t destroy for AwardCanvasPlaceholder()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AwardCanvasPlaceholder(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AwardCanvasPlaceholder(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AwardCanvasPlaceholder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AwardCanvasPlaceholder(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwardCanvasPlaceholder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwardCanvasPlaceholder()
{
  return &type metadata for AwardCanvasPlaceholder;
}

unsigned char *storeEnumTagSinglePayload for AwardCanvasPlaceholder.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFBB634);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwardCanvasPlaceholder.CodingKeys()
{
  return &type metadata for AwardCanvasPlaceholder.CodingKeys;
}

unint64_t sub_24EFBB670()
{
  unint64_t result = qword_2699984E0;
  if (!qword_2699984E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699984E0);
  }
  return result;
}

unint64_t sub_24EFBB6C8()
{
  unint64_t result = qword_26B1E8728;
  if (!qword_26B1E8728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8728);
  }
  return result;
}

unint64_t sub_24EFBB720()
{
  unint64_t result = qword_26B1E8720;
  if (!qword_26B1E8720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8720);
  }
  return result;
}

uint64_t sub_24EFBB774(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x636E657265666572 && a2 == 0xED00006570795465 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24EFBB8D4()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for LocalizationBundle()
{
  return self;
}

id sub_24EFBB908()
{
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26B1EB9A8 = (uint64_t)result;
  return result;
}

BOOL static ForYouToastAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ForYouToastAction.hash(into:)()
{
  return sub_24EFED950();
}

uint64_t sub_24EFBB9A4(char a1)
{
  if (a1) {
    return 0x7061547473616F74;
  }
  else {
    return 0x6977537473616F74;
  }
}

uint64_t sub_24EFBB9DC()
{
  return sub_24EFBB9A4(*v0);
}

uint64_t sub_24EFBB9E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFBC7DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFBBA0C(uint64_t a1)
{
  unint64_t v2 = sub_24EFBBE60();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBBA48(uint64_t a1)
{
  unint64_t v2 = sub_24EFBBE60();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFBBA84(uint64_t a1)
{
  unint64_t v2 = sub_24EFBBF08();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBBAC0(uint64_t a1)
{
  unint64_t v2 = sub_24EFBBF08();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFBBAFC(uint64_t a1)
{
  unint64_t v2 = sub_24EFBBEB4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBBB38(uint64_t a1)
{
  unint64_t v2 = sub_24EFBBEB4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ForYouToastAction.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t ForYouToastAction.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699984E8);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  int v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699984F0);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699984F8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFBBE60();
  sub_24EFED9A0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24EFBBEB4();
    char v14 = v18;
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24EFBBF08();
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24EFBBE60()
{
  unint64_t result = qword_269998500;
  if (!qword_269998500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998500);
  }
  return result;
}

unint64_t sub_24EFBBEB4()
{
  unint64_t result = qword_269998508;
  if (!qword_269998508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998508);
  }
  return result;
}

unint64_t sub_24EFBBF08()
{
  unint64_t result = qword_269998510;
  if (!qword_269998510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998510);
  }
  return result;
}

uint64_t ForYouToastAction.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  char v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998518);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998520);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998528);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFBBE60();
  char v11 = v32;
  sub_24EFED990();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  char v14 = v10;
  uint64_t v15 = sub_24EFED810();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24EFED6C0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
    *char v22 = &type metadata for ForYouToastAction;
    sub_24EFED780();
    sub_24EFED6B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_24EFBBEB4();
    int v18 = v14;
    sub_24EFED770();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24EFBBF08();
    sub_24EFED770();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

unint64_t sub_24EFBC3B8()
{
  unint64_t result = qword_269998530;
  if (!qword_269998530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998530);
  }
  return result;
}

uint64_t sub_24EFBC40C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return ForYouToastAction.init(from:)(a1, a2);
}

uint64_t sub_24EFBC424(void *a1)
{
  return ForYouToastAction.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for ForYouToastAction()
{
  return &type metadata for ForYouToastAction;
}

unsigned char *_s13FitnessForYou17ForYouToastActionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFBC51CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastAction.CodingKeys()
{
  return &type metadata for ForYouToastAction.CodingKeys;
}

ValueMetadata *type metadata accessor for ForYouToastAction.ToastSwipedCodingKeys()
{
  return &type metadata for ForYouToastAction.ToastSwipedCodingKeys;
}

ValueMetadata *type metadata accessor for ForYouToastAction.ToastTappedCodingKeys()
{
  return &type metadata for ForYouToastAction.ToastTappedCodingKeys;
}

unint64_t sub_24EFBC578()
{
  unint64_t result = qword_269998538;
  if (!qword_269998538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998538);
  }
  return result;
}

unint64_t sub_24EFBC5D0()
{
  unint64_t result = qword_269998540;
  if (!qword_269998540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998540);
  }
  return result;
}

unint64_t sub_24EFBC628()
{
  unint64_t result = qword_269998548;
  if (!qword_269998548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998548);
  }
  return result;
}

unint64_t sub_24EFBC680()
{
  unint64_t result = qword_269998550;
  if (!qword_269998550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998550);
  }
  return result;
}

unint64_t sub_24EFBC6D8()
{
  unint64_t result = qword_269998558;
  if (!qword_269998558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998558);
  }
  return result;
}

unint64_t sub_24EFBC730()
{
  unint64_t result = qword_269998560;
  if (!qword_269998560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998560);
  }
  return result;
}

unint64_t sub_24EFBC788()
{
  unint64_t result = qword_269998568;
  if (!qword_269998568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998568);
  }
  return result;
}

uint64_t sub_24EFBC7DC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6977537473616F74 && a2 == 0xEB00000000646570;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7061547473616F74 && a2 == 0xEB00000000646570)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EFBC8E8(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_24EFBC928(char a1)
{
  if (a1) {
    return 0x657669746361;
  }
  else {
    return 1701736302;
  }
}

uint64_t sub_24EFBC954()
{
  return sub_24EFBC8E8(*v0);
}

uint64_t sub_24EFBC95C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFBF074(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFBC984(uint64_t a1)
{
  unint64_t v2 = sub_24EFBE098();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBC9C0(uint64_t a1)
{
  unint64_t v2 = sub_24EFBE098();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFBC9FC()
{
  return sub_24EFBC928(*v0);
}

uint64_t sub_24EFBCA04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFBF164(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFBCA2C(uint64_t a1)
{
  unint64_t v2 = sub_24EFBDFE0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBCA68(uint64_t a1)
{
  unint64_t v2 = sub_24EFBDFE0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFBCAA4(uint64_t a1)
{
  unint64_t v2 = sub_24EFBE0EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBCAE0(uint64_t a1)
{
  unint64_t v2 = sub_24EFBE0EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PlanMetadata.encode(to:)(void *a1)
{
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8948);
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24EFECFB0();
  uint64_t v25 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8940);
  uint64_t v22 = *(void *)(v5 - 8);
  uint64_t v23 = v5;
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PlanMetadata();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8938);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFBDFE0();
  sub_24EFED9A0();
  sub_24EFBE034(v29, (uint64_t)v10);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v10, 1, v15) == 1)
  {
    char v31 = 0;
    sub_24EFBE0EC();
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    uint64_t v29 = v12;
    LODWORD(v23) = v10[*(int *)(v15 + 48)];
    uint64_t v18 = v24;
    uint64_t v17 = v25;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v28, v10, v3);
    char v34 = 1;
    sub_24EFBE098();
    sub_24EFED820();
    char v33 = 0;
    sub_24EFBE188(&qword_269998578, MEMORY[0x263F07508]);
    uint64_t v20 = v26;
    uint64_t v19 = v27;
    sub_24EFED8A0();
    if (!v19)
    {
      char v32 = 1;
      sub_24EFED870();
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v30, v20);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v28, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v14, v11);
  }
}

uint64_t PlanMetadata.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998580);
  uint64_t v42 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v45 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998588);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  uint64_t v41 = v5;
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998590);
  uint64_t v44 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PlanMetadata();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v39 - v15;
  uint64_t v17 = a1[3];
  uint64_t v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_24EFBDFE0();
  uint64_t v18 = v48;
  sub_24EFED990();
  if (!v18)
  {
    uint64_t v19 = v11;
    uint64_t v48 = v14;
    uint64_t v21 = v45;
    uint64_t v20 = v46;
    uint64_t v39 = v16;
    uint64_t v22 = sub_24EFED810();
    uint64_t v23 = v22;
    if (*(void *)(v22 + 16) == 1)
    {
      if (*(unsigned char *)(v22 + 32))
      {
        char v52 = 1;
        sub_24EFBE098();
        sub_24EFED770();
        sub_24EFECFB0();
        uint64_t v24 = v21;
        char v51 = 0;
        sub_24EFBE188(&qword_269998598, MEMORY[0x263F07508]);
        sub_24EFED800();
        uint64_t v40 = v23;
        char v50 = 1;
        char v30 = sub_24EFED7D0();
        uint64_t v31 = v44;
        uint64_t v41 = 0;
        uint64_t v32 = v42;
        char v33 = v30;
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
        uint64_t v35 = *(int *)(v34 + 48);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v24, v20);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v8);
        uint64_t v36 = (uint64_t)v48;
        v48[v35] = v33 & 1;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v36, 0, 1, v34);
        uint64_t v37 = v36;
        uint64_t v38 = (uint64_t)v39;
        sub_24EFA2970(v37, (uint64_t)v39);
      }
      else
      {
        char v49 = 0;
        sub_24EFBE0EC();
        sub_24EFED770();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v40);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v8);
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
        uint64_t v38 = (uint64_t)v39;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v39, 1, 1, v29);
      }
      sub_24EFA2970(v38, v43);
    }
    else
    {
      uint64_t v25 = sub_24EFED6C0();
      swift_allocError();
      uint64_t v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
      uint64_t *v27 = v19;
      sub_24EFED780();
      sub_24EFED6B0();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCB0], v25);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
}

uint64_t sub_24EFBD664@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PlanMetadata.init(from:)(a1, a2);
}

uint64_t sub_24EFBD67C(void *a1)
{
  return PlanMetadata.encode(to:)(a1);
}

uint64_t PlanMetadata.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24EFECFB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PlanMetadata();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EFBE034(v1, (uint64_t)v8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9) == 1) {
    return sub_24EFED950();
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
  sub_24EFED950();
  sub_24EFBE188((unint64_t *)&qword_269997DD0, MEMORY[0x263F07508]);
  sub_24EFED500();
  sub_24EFED960();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t PlanMetadata.hashValue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24EFECFB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PlanMetadata();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EFED940();
  sub_24EFBE034(v1, (uint64_t)v8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9) == 1)
  {
    sub_24EFED950();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_24EFED950();
    sub_24EFBE188((unint64_t *)&qword_269997DD0, MEMORY[0x263F07508]);
    sub_24EFED500();
    sub_24EFED960();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_24EFED980();
}

uint64_t sub_24EFBDAA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24EFECFB0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EFED940();
  sub_24EFBE034(v1, (uint64_t)v8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9) == 1)
  {
    sub_24EFED950();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_24EFED950();
    sub_24EFBE188((unint64_t *)&qword_269997DD0, MEMORY[0x263F07508]);
    sub_24EFED500();
    sub_24EFED960();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return sub_24EFED980();
}

uint64_t _s13FitnessForYou12PlanMetadataO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFECFB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for PlanMetadata();
  MEMORY[0x270FA5388]();
  uint64_t v9 = &v22[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E86C8);
  uint64_t v10 = MEMORY[0x270FA5388]();
  uint64_t v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = (uint64_t)&v12[*(int *)(v10 + 56)];
  sub_24EFBE034(a1, (uint64_t)v12);
  sub_24EFBE034(a2, v13);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  if (v15((uint64_t)v12, 1, v14) == 1)
  {
    if (v15(v13, 1, v14) == 1)
    {
      sub_24EFBF238((uint64_t)v12);
      return 1;
    }
    goto LABEL_6;
  }
  sub_24EFBE034((uint64_t)v12, (uint64_t)v9);
  uint64_t v17 = *(int *)(v14 + 48);
  int v23 = v9[v17];
  if (v15(v13, 1, v14) == 1)
  {
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v9, v4);
LABEL_6:
    sub_24EFACB28((uint64_t)v12, &qword_26B1E86C8);
    return 0;
  }
  int v18 = *(unsigned __int8 *)(v13 + v17);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 32))(v7, v13, v4);
  char v19 = sub_24EFECFA0();
  uint64_t v20 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v9, v4);
  if (v19)
  {
    int v21 = v23 ^ v18;
    sub_24EFBF238((uint64_t)v12);
    return v21 ^ 1u;
  }
  sub_24EFBF238((uint64_t)v12);
  return 0;
}

uint64_t type metadata accessor for PlanMetadata()
{
  uint64_t result = qword_26B1E86B8;
  if (!qword_26B1E86B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24EFBDFE0()
{
  unint64_t result = qword_26B1E8670;
  if (!qword_26B1E8670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8670);
  }
  return result;
}

uint64_t sub_24EFBE034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlanMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24EFBE098()
{
  unint64_t result = qword_269998570;
  if (!qword_269998570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998570);
  }
  return result;
}

unint64_t sub_24EFBE0EC()
{
  unint64_t result = qword_26B1E8688;
  if (!qword_26B1E8688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8688);
  }
  return result;
}

uint64_t sub_24EFBE140()
{
  return sub_24EFBE188(&qword_2699985A0, (void (*)(uint64_t))type metadata accessor for PlanMetadata);
}

uint64_t sub_24EFBE188(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PlanMetadata(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_24EFECFB0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      *((unsigned char *)a1 + *(int *)(v7 + 48)) = *((unsigned char *)a2 + *(int *)(v7 + 48));
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for PlanMetadata(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = sub_24EFECFB0();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *initializeWithCopy for PlanMetadata(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_24EFECFB0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    *((unsigned char *)a1 + *(int *)(v6 + 48)) = *((unsigned char *)a2 + *(int *)(v6 + 48));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

unsigned char *assignWithCopy for PlanMetadata(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_24EFECFB0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 24))(a1, a2, v13);
      a1[*(int *)(v6 + 48)] = a2[*(int *)(v6 + 48)];
      return a1;
    }
    sub_24EFACB28((uint64_t)a1, &qword_26B1E8450);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_24EFECFB0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  a1[*(int *)(v6 + 48)] = a2[*(int *)(v6 + 48)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for PlanMetadata(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_24EFECFB0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    *((unsigned char *)a1 + *(int *)(v6 + 48)) = *((unsigned char *)a2 + *(int *)(v6 + 48));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

unsigned char *assignWithTake for PlanMetadata(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_24EFECFB0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      a1[*(int *)(v6 + 48)] = a2[*(int *)(v6 + 48)];
      return a1;
    }
    sub_24EFACB28((uint64_t)a1, &qword_26B1E8450);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_24EFECFB0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  a1[*(int *)(v6 + 48)] = a2[*(int *)(v6 + 48)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlanMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EFBEA10);
}

uint64_t sub_24EFBEA10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PlanMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EFBEA94);
}

uint64_t sub_24EFBEA94(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_24EFBEB18(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 1, v2);
}

uint64_t sub_24EFBEB84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8450);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 1, v4);
}

uint64_t sub_24EFBEBF8()
{
  uint64_t result = sub_24EFECFB0();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanMetadata.CodingKeys()
{
  return &type metadata for PlanMetadata.CodingKeys;
}

ValueMetadata *type metadata accessor for PlanMetadata.NoneCodingKeys()
{
  return &type metadata for PlanMetadata.NoneCodingKeys;
}

unsigned char *_s13FitnessForYou12PlanMetadataO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFBED7CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanMetadata.ActiveCodingKeys()
{
  return &type metadata for PlanMetadata.ActiveCodingKeys;
}

unint64_t sub_24EFBEDB8()
{
  unint64_t result = qword_2699985A8;
  if (!qword_2699985A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699985A8);
  }
  return result;
}

unint64_t sub_24EFBEE10()
{
  unint64_t result = qword_2699985B0;
  if (!qword_2699985B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699985B0);
  }
  return result;
}

unint64_t sub_24EFBEE68()
{
  unint64_t result = qword_26B1E8698;
  if (!qword_26B1E8698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8698);
  }
  return result;
}

unint64_t sub_24EFBEEC0()
{
  unint64_t result = qword_26B1E8690;
  if (!qword_26B1E8690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8690);
  }
  return result;
}

unint64_t sub_24EFBEF18()
{
  unint64_t result = qword_26B1E86A8;
  if (!qword_26B1E86A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E86A8);
  }
  return result;
}

unint64_t sub_24EFBEF70()
{
  unint64_t result = qword_26B1E86A0;
  if (!qword_26B1E86A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E86A0);
  }
  return result;
}

unint64_t sub_24EFBEFC8()
{
  unint64_t result = qword_26B1E8680;
  if (!qword_26B1E8680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8680);
  }
  return result;
}

unint64_t sub_24EFBF020()
{
  unint64_t result = qword_26B1E8678;
  if (!qword_26B1E8678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8678);
  }
  return result;
}

uint64_t sub_24EFBF074(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EFF4D70)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EFBF164(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657669746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EFBF238(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PlanMetadata();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL static BrowsingIdentity.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24EFBF2A4(char a1)
{
  if (a1) {
    return 0x65746F6D6572;
  }
  else {
    return 0x6C61636F6CLL;
  }
}

uint64_t sub_24EFBF2D4()
{
  return sub_24EFBF2A4(*v0);
}

uint64_t sub_24EFBF2DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFBF8F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFBF304(uint64_t a1)
{
  unint64_t v2 = sub_24EFBF71C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBF340(uint64_t a1)
{
  unint64_t v2 = sub_24EFBF71C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFBF37C(uint64_t a1)
{
  unint64_t v2 = sub_24EFBF7C4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBF3B8(uint64_t a1)
{
  unint64_t v2 = sub_24EFBF7C4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFBF3F4(uint64_t a1)
{
  unint64_t v2 = sub_24EFBF770();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFBF430(uint64_t a1)
{
  unint64_t v2 = sub_24EFBF770();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BrowsingIdentity.encode(to:)(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699985B8);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699985C0);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699985C8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFBF71C();
  sub_24EFED9A0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_24EFBF770();
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_24EFBF7C4();
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

unint64_t sub_24EFBF71C()
{
  unint64_t result = qword_2699985D0;
  if (!qword_2699985D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699985D0);
  }
  return result;
}

unint64_t sub_24EFBF770()
{
  unint64_t result = qword_2699985D8;
  if (!qword_2699985D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699985D8);
  }
  return result;
}

unint64_t sub_24EFBF7C4()
{
  unint64_t result = qword_2699985E0;
  if (!qword_2699985E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699985E0);
  }
  return result;
}

uint64_t BrowsingIdentity.init(from:)(uint64_t a1)
{
  return sub_24EFBF9CC(a1) & 1;
}

uint64_t sub_24EFBF834@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_24EFBF9CC(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_24EFBF864(void *a1)
{
  return BrowsingIdentity.encode(to:)(a1, *v1);
}

uint64_t BrowsingIdentity.hash(into:)()
{
  return sub_24EFED950();
}

uint64_t BrowsingIdentity.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t sub_24EFBF8F0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746F6D6572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EFBF9CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998628);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998630);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998638);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)a1, *(void *)(a1 + 24));
  sub_24EFBF71C();
  uint64_t v12 = v26;
  sub_24EFED990();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_24EFED810();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_24EFED6C0();
    swift_allocError();
    int v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
    *int v18 = &type metadata for BrowsingIdentity;
    sub_24EFED780();
    sub_24EFED6B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_24EFBF770();
    sub_24EFED770();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_24EFBF7C4();
    sub_24EFED770();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  __swift_destroy_boxed_opaque_existential_1(v26);
  return a1;
}

unint64_t sub_24EFBFE20()
{
  unint64_t result = qword_2699985E8;
  if (!qword_2699985E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699985E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for BrowsingIdentity()
{
  return &type metadata for BrowsingIdentity;
}

unsigned char *_s13FitnessForYou16BrowsingIdentityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFBFF54);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BrowsingIdentity.CodingKeys()
{
  return &type metadata for BrowsingIdentity.CodingKeys;
}

ValueMetadata *type metadata accessor for BrowsingIdentity.LocalCodingKeys()
{
  return &type metadata for BrowsingIdentity.LocalCodingKeys;
}

ValueMetadata *type metadata accessor for BrowsingIdentity.RemoteCodingKeys()
{
  return &type metadata for BrowsingIdentity.RemoteCodingKeys;
}

unint64_t sub_24EFBFFB0()
{
  unint64_t result = qword_2699985F0;
  if (!qword_2699985F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699985F0);
  }
  return result;
}

unint64_t sub_24EFC0008()
{
  unint64_t result = qword_2699985F8;
  if (!qword_2699985F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699985F8);
  }
  return result;
}

unint64_t sub_24EFC0060()
{
  unint64_t result = qword_269998600;
  if (!qword_269998600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998600);
  }
  return result;
}

unint64_t sub_24EFC00B8()
{
  unint64_t result = qword_269998608;
  if (!qword_269998608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998608);
  }
  return result;
}

unint64_t sub_24EFC0110()
{
  unint64_t result = qword_269998610;
  if (!qword_269998610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998610);
  }
  return result;
}

unint64_t sub_24EFC0168()
{
  unint64_t result = qword_269998618;
  if (!qword_269998618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998618);
  }
  return result;
}

unint64_t sub_24EFC01C0()
{
  unint64_t result = qword_269998620;
  if (!qword_269998620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998620);
  }
  return result;
}

uint64_t CanvasSectionDescriptor.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasSectionDescriptor.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasSectionDescriptor.subtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasSectionDescriptor.subtitleType.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t CanvasSectionDescriptor.detail.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasSectionDescriptor.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CanvasSectionDescriptor.displayStyle.getter()
{
  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t CanvasSectionDescriptor.recoId.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall CanvasSectionDescriptor.init(identifier:title:subtitle:subtitleType:detail:items:displayStyle:recoId:)(FitnessForYou::CanvasSectionDescriptor *__return_ptr retstr, Swift::String identifier, Swift::String_optional title, Swift::String_optional subtitle, FitnessForYou::SubtitleTextType subtitleType, Swift::String_optional detail, Swift::OpaquePointer items, FitnessForYou::DisplayStyle displayStyle, Swift::String recoId)
{
  retstr->identifier = identifier;
  retstr->title = title;
  retstr->subtitle = subtitle;
  retstr->subtitleType = subtitleType & 1;
  retstr->detail = detail;
  retstr->items = items;
  retstr->displayStyle = displayStyle;
  retstr->recoId = recoId;
}

uint64_t sub_24EFC0350(char a1)
{
  return *(void *)&aIdentifititle[8 * a1];
}

uint64_t sub_24EFC0370()
{
  return sub_24EFC0350(*v0);
}

uint64_t sub_24EFC0378@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFC1C34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFC03A0(uint64_t a1)
{
  unint64_t v2 = sub_24EFC075C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC03DC(uint64_t a1)
{
  unint64_t v2 = sub_24EFC075C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CanvasSectionDescriptor.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8960);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v21 = *(void *)(v1 + 24);
  uint64_t v22 = v7;
  uint64_t v8 = *(void *)(v1 + 32);
  uint64_t v19 = *(void *)(v1 + 40);
  uint64_t v20 = v8;
  int v25 = *(unsigned __int8 *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 64);
  uint64_t v17 = *(void *)(v1 + 56);
  uint64_t v18 = v9;
  uint64_t v16 = *(void *)(v1 + 72);
  int v15 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v10 = *(void *)(v1 + 88);
  v14[0] = *(void *)(v1 + 96);
  v14[1] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFC075C();
  sub_24EFED9A0();
  LOBYTE(v24) = 0;
  uint64_t v11 = v23;
  sub_24EFED860();
  if (!v11)
  {
    char v12 = v25;
    LOBYTE(v24) = 1;
    sub_24EFED830();
    LOBYTE(v24) = 2;
    sub_24EFED830();
    LOBYTE(v24) = v12;
    char v26 = 3;
    sub_24EFC07B0();
    sub_24EFED8A0();
    LOBYTE(v24) = 4;
    sub_24EFED830();
    uint64_t v24 = v16;
    char v26 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8858);
    sub_24EFC0ED8(&qword_26B1E8860, &qword_26B1E86F8);
    sub_24EFED8A0();
    LOBYTE(v24) = v15;
    char v26 = 6;
    sub_24EFA3100();
    sub_24EFED8A0();
    LOBYTE(v24) = 7;
    sub_24EFED860();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24EFC075C()
{
  unint64_t result = qword_26B1E8738;
  if (!qword_26B1E8738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8738);
  }
  return result;
}

unint64_t sub_24EFC07B0()
{
  unint64_t result = qword_26B1E86D0;
  if (!qword_26B1E86D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E86D0);
  }
  return result;
}

uint64_t CanvasSectionDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998640);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFC075C();
  sub_24EFED990();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v40) = 0;
  uint64_t v10 = sub_24EFED7C0();
  uint64_t v12 = v11;
  LOBYTE(v40) = 1;
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_24EFED790();
  uint64_t v38 = v10;
  LOBYTE(v40) = 2;
  uint64_t v14 = v13;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_24EFED790();
  uint64_t v39 = v14;
  uint64_t v17 = v16;
  uint64_t v36 = v15;
  char v42 = 3;
  sub_24EFC0E84();
  swift_bridgeObjectRetain();
  sub_24EFED800();
  uint64_t v35 = v17;
  LODWORD(v14) = v40;
  LOBYTE(v40) = 4;
  uint64_t v18 = sub_24EFED790();
  uint64_t v34 = v19;
  uint64_t v32 = v18;
  int v41 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8858);
  char v42 = 5;
  sub_24EFC0ED8(&qword_269998650, &qword_269998658);
  swift_bridgeObjectRetain();
  uint64_t v33 = 0;
  sub_24EFED800();
  uint64_t v20 = v40;
  char v42 = 6;
  sub_24EFA3764();
  uint64_t v31 = v20;
  swift_bridgeObjectRetain();
  sub_24EFED800();
  LODWORD(v14) = v40;
  LOBYTE(v40) = 7;
  uint64_t v21 = sub_24EFED7C0();
  uint64_t v23 = v22;
  uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v33 = v21;
  v24(v8, v5);
  swift_bridgeObjectRetain();
  int v30 = v14;
  uint64_t v25 = v39;
  swift_bridgeObjectRetain();
  uint64_t v26 = v35;
  swift_bridgeObjectRetain();
  uint64_t v27 = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)a2 = v38;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = v37;
  *(void *)(a2 + 24) = v25;
  *(void *)(a2 + 32) = v36;
  *(void *)(a2 + 40) = v26;
  *(unsigned char *)(a2 + 48) = v41;
  uint64_t v28 = v31;
  *(void *)(a2 + 56) = v32;
  *(void *)(a2 + 64) = v27;
  *(void *)(a2 + 72) = v28;
  *(unsigned char *)(a2 + 80) = v30;
  *(void *)(a2 + 88) = v33;
  *(void *)(a2 + 96) = v23;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_24EFC0E84()
{
  unint64_t result = qword_269998648;
  if (!qword_269998648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998648);
  }
  return result;
}

uint64_t sub_24EFC0ED8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E8858);
    sub_24EFC0F58(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24EFC0F58(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CanvasPlaceholder();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24EFC0F9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CanvasSectionDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24EFC0FB4(void *a1)
{
  return CanvasSectionDescriptor.encode(to:)(a1);
}

uint64_t CanvasSectionDescriptor.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 64);
  uint64_t v6 = *(void *)(v1 + 72);
  char v8 = *(unsigned char *)(v1 + 80);
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  if (v3)
  {
    sub_24EFED960();
    swift_bridgeObjectRetain();
    sub_24EFED560();
    swift_bridgeObjectRelease();
    if (v4)
    {
LABEL_3:
      sub_24EFED960();
      swift_bridgeObjectRetain();
      sub_24EFED560();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24EFED960();
    if (v4) {
      goto LABEL_3;
    }
  }
  sub_24EFED960();
LABEL_6:
  sub_24EFED560();
  swift_bridgeObjectRelease();
  sub_24EFED960();
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_24EFED560();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_24EFA8B90(a1, v6);
  swift_bridgeObjectRelease();
  DisplayStyle.rawValue.getter(v8);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  return swift_bridgeObjectRelease();
}

uint64_t CanvasSectionDescriptor.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  char v2 = *(unsigned char *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 72);
  char v4 = *(unsigned char *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 96);
  v9[9] = *(void *)v0;
  v9[10] = v1;
  long long v7 = *(_OWORD *)(v0 + 32);
  long long v10 = *(_OWORD *)(v0 + 16);
  long long v11 = v7;
  char v12 = v2;
  long long v13 = *(_OWORD *)(v0 + 56);
  uint64_t v14 = v3;
  char v15 = v4;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  sub_24EFED940();
  CanvasSectionDescriptor.hash(into:)((uint64_t)v9);
  return sub_24EFED980();
}

uint64_t sub_24EFC1254()
{
  uint64_t v1 = *(void *)(v0 + 8);
  char v2 = *(unsigned char *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 72);
  char v4 = *(unsigned char *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 96);
  v9[9] = *(void *)v0;
  v9[10] = v1;
  long long v7 = *(_OWORD *)(v0 + 32);
  long long v10 = *(_OWORD *)(v0 + 16);
  long long v11 = v7;
  char v12 = v2;
  long long v13 = *(_OWORD *)(v0 + 56);
  uint64_t v14 = v3;
  char v15 = v4;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  sub_24EFED940();
  CanvasSectionDescriptor.hash(into:)((uint64_t)v9);
  return sub_24EFED980();
}

uint64_t sub_24EFC12D8()
{
  uint64_t v1 = *(void *)(v0 + 8);
  char v2 = *(unsigned char *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 72);
  char v4 = *(unsigned char *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 96);
  v9[9] = *(void *)v0;
  v9[10] = v1;
  long long v7 = *(_OWORD *)(v0 + 32);
  long long v10 = *(_OWORD *)(v0 + 16);
  long long v11 = v7;
  char v12 = v2;
  long long v13 = *(_OWORD *)(v0 + 56);
  uint64_t v14 = v3;
  char v15 = v4;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  sub_24EFED940();
  CanvasSectionDescriptor.hash(into:)((uint64_t)v9);
  return sub_24EFED980();
}

uint64_t _s13FitnessForYou23CanvasSectionDescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v38 = *(void *)(a1 + 64);
  uint64_t v34 = *(void *)(a1 + 72);
  char v32 = *(unsigned char *)(a1 + 80);
  uint64_t v29 = *(void *)(a1 + 96);
  uint64_t v30 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  int v11 = *(unsigned __int8 *)(a2 + 48);
  uint64_t v35 = *(void *)(a2 + 56);
  uint64_t v36 = *(void *)(a1 + 56);
  uint64_t v37 = *(void *)(a2 + 64);
  uint64_t v33 = *(void *)(a2 + 72);
  char v31 = *(unsigned char *)(a2 + 80);
  uint64_t v27 = *(void *)(a2 + 96);
  uint64_t v28 = *(void *)(a2 + 88);
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v12 = sub_24EFED8B0();
    uint64_t result = 0;
    if ((v12 & 1) == 0) {
      return result;
    }
  }
  if (v4)
  {
    if (!v8) {
      return 0;
    }
    if (v2 != v7 || v4 != v8)
    {
      char v14 = sub_24EFED8B0();
      uint64_t result = 0;
      if ((v14 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v8)
  {
    return 0;
  }
  if (v5)
  {
    if (!v9) {
      return 0;
    }
    if (v3 != v10 || v5 != v9)
    {
      char v15 = sub_24EFED8B0();
      uint64_t result = 0;
      if ((v15 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v9)
  {
    return 0;
  }
  if (v6) {
    uint64_t v16 = 1954047348;
  }
  else {
    uint64_t v16 = 0x657069636572;
  }
  if (v6) {
    unint64_t v17 = 0xE400000000000000;
  }
  else {
    unint64_t v17 = 0xE600000000000000;
  }
  if (v11) {
    uint64_t v18 = 1954047348;
  }
  else {
    uint64_t v18 = 0x657069636572;
  }
  if (v11) {
    unint64_t v19 = 0xE400000000000000;
  }
  else {
    unint64_t v19 = 0xE600000000000000;
  }
  if (v16 == v18 && v17 == v19)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v20 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v20 & 1) == 0) {
      return result;
    }
  }
  if (!v38)
  {
    if (!v37) {
      goto LABEL_41;
    }
    return 0;
  }
  if (!v37) {
    return 0;
  }
  if (v36 != v35 || v38 != v37)
  {
    char v21 = sub_24EFED8B0();
    uint64_t result = 0;
    if ((v21 & 1) == 0) {
      return result;
    }
  }
LABEL_41:
  if ((sub_24EFD8EEC(v34, v33) & 1) == 0) {
    return 0;
  }
  uint64_t v22 = DisplayStyle.rawValue.getter(v32);
  uint64_t v24 = v23;
  if (v22 == DisplayStyle.rawValue.getter(v31) && v24 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v26 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v26 & 1) == 0) {
      return result;
    }
  }
  if (v30 == v28 && v29 == v27) {
    return 1;
  }
  return sub_24EFED8B0();
}

unint64_t sub_24EFC166C()
{
  unint64_t result = qword_269998660;
  if (!qword_269998660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998660);
  }
  return result;
}

uint64_t destroy for CanvasSectionDescriptor()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CanvasSectionDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CanvasSectionDescriptor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for CanvasSectionDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CanvasSectionDescriptor(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CanvasSectionDescriptor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CanvasSectionDescriptor()
{
  return &type metadata for CanvasSectionDescriptor;
}

unsigned char *storeEnumTagSinglePayload for CanvasSectionDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *__n128 result = a2 + 7;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFC1AF4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CanvasSectionDescriptor.CodingKeys()
{
  return &type metadata for CanvasSectionDescriptor.CodingKeys;
}

unint64_t sub_24EFC1B30()
{
  unint64_t result = qword_269998668;
  if (!qword_269998668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998668);
  }
  return result;
}

unint64_t sub_24EFC1B88()
{
  unint64_t result = qword_26B1E8748;
  if (!qword_26B1E8748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8748);
  }
  return result;
}

unint64_t sub_24EFC1BE0()
{
  unint64_t result = qword_26B1E8740;
  if (!qword_26B1E8740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8740);
  }
  return result;
}

uint64_t sub_24EFC1C34(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xEC00000065707954 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6961746564 && a2 == 0xE600000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x736D657469 && a2 == 0xE500000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x5379616C70736964 && a2 == 0xEC000000656C7974 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x64496F636572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_24EFC1F48(char a1)
{
  return *(void *)&aError_0[8 * a1];
}

uint64_t sub_24EFC1F68()
{
  return sub_24EFC1F48(*v0);
}

uint64_t sub_24EFC1F70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFC2D38(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFC1F98(uint64_t a1)
{
  unint64_t v2 = sub_24EFC26D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC1FD4(uint64_t a1)
{
  unint64_t v2 = sub_24EFC26D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFC2010(uint64_t a1)
{
  unint64_t v2 = sub_24EFC2878();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC204C(uint64_t a1)
{
  unint64_t v2 = sub_24EFC2878();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFC208C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFC2EF4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EFC20B8(uint64_t a1)
{
  unint64_t v2 = sub_24EFC27D0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC20F4(uint64_t a1)
{
  unint64_t v2 = sub_24EFC27D0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFC2130(uint64_t a1)
{
  unint64_t v2 = sub_24EFC277C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC216C(uint64_t a1)
{
  unint64_t v2 = sub_24EFC277C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFC21A8(uint64_t a1)
{
  unint64_t v2 = sub_24EFC2728();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC21E4(uint64_t a1)
{
  unint64_t v2 = sub_24EFC2728();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LoadFailureReason.encode(to:)(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  *((void *)&v36 + 1) = a3;
  int v37 = a4;
  *(void *)&long long v36 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998670);
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v32 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v30 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998678);
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v29 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v27 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998680);
  uint64_t v34 = *(void *)(v9 - 8);
  uint64_t v35 = v9;
  MEMORY[0x270FA5388](v9);
  int v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998688);
  uint64_t v33 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  char v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998690);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFC26D4();
  sub_24EFED9A0();
  if (!(_BYTE)v37)
  {
    char v38 = 0;
    sub_24EFC2878();
    sub_24EFED820();
    sub_24EFED860();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v12);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  char v19 = v36;
  if (v37 == 1)
  {
    char v40 = 1;
    sub_24EFC27D0();
    sub_24EFED820();
    char v39 = v19;
    sub_24EFC2824();
    uint64_t v20 = v35;
    sub_24EFED850();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v20);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  uint64_t v22 = (uint64_t (**)(char *, uint64_t))(v16 + 8);
  if (v36 == 0)
  {
    char v41 = 2;
    sub_24EFC277C();
    uint64_t v23 = v27;
    sub_24EFED820();
    uint64_t v25 = v28;
    uint64_t v24 = v29;
  }
  else
  {
    char v42 = 3;
    sub_24EFC2728();
    uint64_t v23 = v30;
    sub_24EFED820();
    uint64_t v25 = v31;
    uint64_t v24 = v32;
  }
  (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v24);
  return (*v22)(v18, v15);
}

unint64_t sub_24EFC26D4()
{
  unint64_t result = qword_269998698;
  if (!qword_269998698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998698);
  }
  return result;
}

unint64_t sub_24EFC2728()
{
  unint64_t result = qword_2699986A0;
  if (!qword_2699986A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986A0);
  }
  return result;
}

unint64_t sub_24EFC277C()
{
  unint64_t result = qword_2699986A8;
  if (!qword_2699986A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986A8);
  }
  return result;
}

unint64_t sub_24EFC27D0()
{
  unint64_t result = qword_2699986B0;
  if (!qword_2699986B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986B0);
  }
  return result;
}

unint64_t sub_24EFC2824()
{
  unint64_t result = qword_2699986B8;
  if (!qword_2699986B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986B8);
  }
  return result;
}

unint64_t sub_24EFC2878()
{
  unint64_t result = qword_2699986C0;
  if (!qword_2699986C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986C0);
  }
  return result;
}

uint64_t LoadFailureReason.init(from:)(void *a1)
{
  uint64_t result = sub_24EFC2FA0(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_24EFC28F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_24EFC2FA0(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_24EFC2920(void *a1)
{
  return LoadFailureReason.encode(to:)(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t LoadFailureReason.hash(into:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a4)
  {
    if (a4 == 1)
    {
      sub_24EFED950();
      if (a2 == 4) {
        return sub_24EFED960();
      }
      sub_24EFED960();
    }
    return sub_24EFED950();
  }
  else
  {
    sub_24EFED950();
    return sub_24EFED560();
  }
}

uint64_t LoadFailureReason.hashValue.getter(char a1, uint64_t a2, char a3)
{
  if (!a3)
  {
    sub_24EFED950();
    sub_24EFED560();
    return sub_24EFED980();
  }
  if (a3 != 1)
  {
LABEL_8:
    sub_24EFED950();
    return sub_24EFED980();
  }
  sub_24EFED950();
  if (a1 != 4)
  {
    sub_24EFED960();
    goto LABEL_8;
  }
  sub_24EFED960();
  return sub_24EFED980();
}

uint64_t sub_24EFC2AD0()
{
  return LoadFailureReason.hashValue.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_24EFC2ADC()
{
  uint64_t v1 = *v0;
  if (*((unsigned char *)v0 + 16))
  {
    if (*((unsigned char *)v0 + 16) == 1)
    {
      sub_24EFED950();
      if (v1 == 4) {
        return sub_24EFED960();
      }
      sub_24EFED960();
    }
    return sub_24EFED950();
  }
  else
  {
    sub_24EFED950();
    return sub_24EFED560();
  }
}

uint64_t sub_24EFC2B98()
{
  uint64_t v1 = *v0;
  int v2 = *((unsigned __int8 *)v0 + 16);
  sub_24EFED940();
  if (!v2)
  {
    sub_24EFED950();
    sub_24EFED560();
    return sub_24EFED980();
  }
  if (v2 != 1)
  {
LABEL_8:
    sub_24EFED950();
    return sub_24EFED980();
  }
  sub_24EFED950();
  if (v1 != 4)
  {
    sub_24EFED960();
    goto LABEL_8;
  }
  sub_24EFED960();
  return sub_24EFED980();
}

uint64_t sub_24EFC2C60(uint64_t a1, uint64_t a2)
{
  return _s13FitnessForYou17LoadFailureReasonO2eeoiySbAC_ACtFZ_0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t _s13FitnessForYou17LoadFailureReasonO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3)
  {
    if (a3 != 1)
    {
      if (a1 | a2)
      {
        if (a6 != 2 || a4 != 1 || a5) {
          return 0;
        }
      }
      else if (a6 != 2 || a5 | a4)
      {
        return 0;
      }
      return 1;
    }
    if (a6 == 1)
    {
      if (a1 == 4)
      {
        if (a4 != 4) {
          return 0;
        }
      }
      else if (a4 == 4 || a4 != a1)
      {
        return 0;
      }
      return 1;
    }
  }
  else if (!a6)
  {
    if (a1 != a4 || a2 != a5) {
      return sub_24EFED8B0();
    }
    return 1;
  }
  return 0;
}

uint64_t sub_24EFC2D38(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726F727265 && a2 == 0xE500000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F70707553746F6ELL && a2 == 0xEC00000064657472 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E69636E7973 && a2 == 0xE700000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x616C696176616E75 && a2 == 0xEB00000000656C62)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24EFC2EF4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7954656369766564 && a2 == 0xEA00000000006570)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EFC2F84()
{
  return 0x7954656369766564;
}

uint64_t sub_24EFC2FA0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998738);
  uint64_t v42 = *(void *)(v2 - 8);
  uint64_t v43 = v2;
  MEMORY[0x270FA5388](v2);
  char v41 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998740);
  uint64_t v37 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  char v40 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998748);
  uint64_t v36 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  char v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998750);
  uint64_t v39 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998758);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v44 = a1;
  uint64_t v15 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, v14);
  sub_24EFC26D4();
  uint64_t v16 = v45;
  sub_24EFED990();
  if (!v16)
  {
    uint64_t v32 = v7;
    uint64_t v33 = v9;
    uint64_t v34 = v6;
    uint64_t v17 = v40;
    uint64_t v18 = v41;
    uint64_t v20 = v42;
    uint64_t v19 = v43;
    uint64_t v45 = v11;
    uint64_t v21 = sub_24EFED810();
    if (*(void *)(v21 + 16) == 1)
    {
      switch(*(unsigned char *)(v21 + 32))
      {
        case 1:
          char v48 = 1;
          sub_24EFC27D0();
          uint64_t v30 = v34;
          sub_24EFED770();
          sub_24EFC3F84();
          uint64_t v31 = v38;
          sub_24EFED7B0();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v30, v31);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v10);
          uint64_t v15 = v47;
          break;
        case 2:
          char v49 = 2;
          sub_24EFC277C();
          sub_24EFED770();
          (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v35);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v10);
          uint64_t v15 = 0;
          break;
        case 3:
          char v50 = 3;
          sub_24EFC2728();
          sub_24EFED770();
          (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v19);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v10);
          uint64_t v15 = 1;
          break;
        default:
          char v46 = 0;
          sub_24EFC2878();
          uint64_t v22 = v33;
          sub_24EFED770();
          uint64_t v23 = v32;
          uint64_t v24 = sub_24EFED7C0();
          uint64_t v25 = v45;
          uint64_t v15 = v24;
          (*(void (**)(char *, uint64_t))(v39 + 8))(v22, v23);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v10);
          break;
      }
    }
    else
    {
      uint64_t v26 = sub_24EFED6C0();
      swift_allocError();
      uint64_t v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
      *uint64_t v28 = &type metadata for LoadFailureReason;
      uint64_t v15 = (uint64_t)v13;
      sub_24EFED780();
      sub_24EFED6B0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB0], v26);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v10);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  return v15;
}

unint64_t sub_24EFC36CC()
{
  unint64_t result = qword_2699986C8;
  if (!qword_2699986C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986C8);
  }
  return result;
}

uint64_t destroy for LoadFailureReason(uint64_t a1)
{
  return sub_24EFA9DD0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s13FitnessForYou17LoadFailureReasonOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24EFA9CD8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LoadFailureReason(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24EFA9CD8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24EFA9DD0(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LoadFailureReason(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24EFA9DD0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LoadFailureReason(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LoadFailureReason(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24EFC38C0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24EFC38D8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LoadFailureReason()
{
  return &type metadata for LoadFailureReason;
}

unsigned char *storeEnumTagSinglePayload for LoadFailureReason.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFC39CCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadFailureReason.CodingKeys()
{
  return &type metadata for LoadFailureReason.CodingKeys;
}

ValueMetadata *type metadata accessor for LoadFailureReason.ErrorCodingKeys()
{
  return &type metadata for LoadFailureReason.ErrorCodingKeys;
}

unsigned char *_s13FitnessForYou17LoadFailureReasonO15ErrorCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24EFC3AB4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadFailureReason.NotSupportedCodingKeys()
{
  return &type metadata for LoadFailureReason.NotSupportedCodingKeys;
}

ValueMetadata *type metadata accessor for LoadFailureReason.SyncingCodingKeys()
{
  return &type metadata for LoadFailureReason.SyncingCodingKeys;
}

ValueMetadata *type metadata accessor for LoadFailureReason.UnavailableCodingKeys()
{
  return &type metadata for LoadFailureReason.UnavailableCodingKeys;
}

unint64_t sub_24EFC3B10()
{
  unint64_t result = qword_2699986D0;
  if (!qword_2699986D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986D0);
  }
  return result;
}

unint64_t sub_24EFC3B68()
{
  unint64_t result = qword_2699986D8;
  if (!qword_2699986D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986D8);
  }
  return result;
}

unint64_t sub_24EFC3BC0()
{
  unint64_t result = qword_2699986E0;
  if (!qword_2699986E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986E0);
  }
  return result;
}

unint64_t sub_24EFC3C18()
{
  unint64_t result = qword_2699986E8;
  if (!qword_2699986E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986E8);
  }
  return result;
}

unint64_t sub_24EFC3C70()
{
  unint64_t result = qword_2699986F0;
  if (!qword_2699986F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986F0);
  }
  return result;
}

unint64_t sub_24EFC3CC8()
{
  unint64_t result = qword_2699986F8;
  if (!qword_2699986F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699986F8);
  }
  return result;
}

unint64_t sub_24EFC3D20()
{
  unint64_t result = qword_269998700;
  if (!qword_269998700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998700);
  }
  return result;
}

unint64_t sub_24EFC3D78()
{
  unint64_t result = qword_269998708;
  if (!qword_269998708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998708);
  }
  return result;
}

unint64_t sub_24EFC3DD0()
{
  unint64_t result = qword_269998710;
  if (!qword_269998710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998710);
  }
  return result;
}

unint64_t sub_24EFC3E28()
{
  unint64_t result = qword_269998718;
  if (!qword_269998718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998718);
  }
  return result;
}

unint64_t sub_24EFC3E80()
{
  unint64_t result = qword_269998720;
  if (!qword_269998720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998720);
  }
  return result;
}

unint64_t sub_24EFC3ED8()
{
  unint64_t result = qword_269998728;
  if (!qword_269998728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998728);
  }
  return result;
}

unint64_t sub_24EFC3F30()
{
  unint64_t result = qword_269998730;
  if (!qword_269998730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998730);
  }
  return result;
}

unint64_t sub_24EFC3F84()
{
  unint64_t result = qword_269998760;
  if (!qword_269998760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998760);
  }
  return result;
}

uint64_t ForYouToastEnvironment.init(requestToastDismissal:navigateToForYou:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ForYouToastEnvironment.requestToastDismissal.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t ForYouToastEnvironment.navigateToForYou.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t destroy for ForYouToastEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ForYouToastEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ForYouToastEnvironment(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for ForYouToastEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouToastEnvironment(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ForYouToastEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastEnvironment()
{
  return &type metadata for ForYouToastEnvironment;
}

uint64_t AwardCanvasSectionDescriptor.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AwardCanvasSectionDescriptor.templateUniqueName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AwardCanvasSectionDescriptor.items.getter()
{
  return swift_bridgeObjectRetain();
}

void __swiftcall AwardCanvasSectionDescriptor.init(identifier:templateUniqueName:items:)(FitnessForYou::AwardCanvasSectionDescriptor *__return_ptr retstr, Swift::String identifier, Swift::String templateUniqueName, Swift::OpaquePointer items)
{
  retstr->identifier = identifier;
  retstr->templateUniqueName = templateUniqueName;
  retstr->items = items;
}

uint64_t sub_24EFC4284(char a1)
{
  if (!a1) {
    return 0x696669746E656469;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0x736D657469;
}

uint64_t sub_24EFC42E0()
{
  return sub_24EFC4284(*v0);
}

uint64_t sub_24EFC42E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFC52C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFC4310(uint64_t a1)
{
  unint64_t v2 = sub_24EFC4588();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC434C(uint64_t a1)
{
  unint64_t v2 = sub_24EFC4588();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AwardCanvasSectionDescriptor.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8968);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  uint64_t v13 = v1[3];
  uint64_t v14 = v7;
  uint64_t v12 = v1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFC4588();
  sub_24EFED9A0();
  char v19 = 0;
  uint64_t v8 = v15;
  sub_24EFED860();
  if (!v8)
  {
    uint64_t v9 = v12;
    char v18 = 1;
    sub_24EFED860();
    uint64_t v16 = v9;
    char v17 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8868);
    sub_24EFC4928(&qword_26B1E8870, (void (*)(void))sub_24EFC45DC);
    sub_24EFED8A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24EFC4588()
{
  unint64_t result = qword_26B1E8768;
  if (!qword_26B1E8768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8768);
  }
  return result;
}

unint64_t sub_24EFC45DC()
{
  unint64_t result = qword_26B1E8730;
  if (!qword_26B1E8730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8730);
  }
  return result;
}

uint64_t AwardCanvasSectionDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998768);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFC4588();
  sub_24EFED990();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v24 = 0;
  uint64_t v9 = sub_24EFED7C0();
  uint64_t v11 = v10;
  uint64_t v20 = v9;
  char v23 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_24EFED7C0();
  uint64_t v14 = v13;
  uint64_t v18 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8868);
  char v22 = 2;
  sub_24EFC4928(&qword_269998770, (void (*)(void))sub_24EFC4998);
  uint64_t v19 = v14;
  swift_bridgeObjectRetain();
  sub_24EFED800();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v15 = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = v19;
  *a2 = v20;
  a2[1] = v11;
  a2[2] = v18;
  a2[3] = v16;
  a2[4] = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFC4928(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E8868);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24EFC4998()
{
  unint64_t result = qword_269998778;
  if (!qword_269998778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998778);
  }
  return result;
}

uint64_t sub_24EFC49EC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return AwardCanvasSectionDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24EFC4A04(void *a1)
{
  return AwardCanvasSectionDescriptor.encode(to:)(a1);
}

uint64_t AwardCanvasSectionDescriptor.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFA8AA0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t AwardCanvasSectionDescriptor.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_24EFED940();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFA8AA0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t sub_24EFC4B74()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_24EFED940();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFA8AA0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t sub_24EFC4C24(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFA8AA0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFC4CC8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_24EFED940();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFED560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EFA8AA0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t _s13FitnessForYou28AwardCanvasSectionDescriptorV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  BOOL v8 = *a1 == *a2 && a1[1] == a2[1];
  if (!v8 && (sub_24EFED8B0() & 1) == 0) {
    return 0;
  }
  BOOL v9 = v2 == v5 && v4 == v6;
  if (!v9 && (sub_24EFED8B0() & 1) == 0) {
    return 0;
  }
  return sub_24EFD8D9C(v3, v7);
}

unint64_t sub_24EFC4E38()
{
  unint64_t result = qword_269998780;
  if (!qword_269998780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998780);
  }
  return result;
}

uint64_t destroy for AwardCanvasSectionDescriptor()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AwardCanvasSectionDescriptor(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AwardCanvasSectionDescriptor(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AwardCanvasSectionDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AwardCanvasSectionDescriptor(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwardCanvasSectionDescriptor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwardCanvasSectionDescriptor()
{
  return &type metadata for AwardCanvasSectionDescriptor;
}

unsigned char *storeEnumTagSinglePayload for AwardCanvasSectionDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFC5188);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwardCanvasSectionDescriptor.CodingKeys()
{
  return &type metadata for AwardCanvasSectionDescriptor.CodingKeys;
}

unint64_t sub_24EFC51C4()
{
  unint64_t result = qword_269998788;
  if (!qword_269998788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998788);
  }
  return result;
}

unint64_t sub_24EFC521C()
{
  unint64_t result = qword_26B1E8778;
  if (!qword_26B1E8778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8778);
  }
  return result;
}

unint64_t sub_24EFC5274()
{
  unint64_t result = qword_26B1E8770;
  if (!qword_26B1E8770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8770);
  }
  return result;
}

uint64_t sub_24EFC52C8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024EFF4D90 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x736D657469 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t ForYouState.activeStorefrontLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24EFECFD0();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t ForYouState.awardLoadStates.getter()
{
  type metadata accessor for ForYouState();
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for ForYouState()
{
  uint64_t result = qword_26B1E84F8;
  if (!qword_26B1E84F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ForYouState.awardLoadStates.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for ForYouState() + 20);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*ForYouState.awardLoadStates.modify())()
{
  return nullsub_1;
}

uint64_t ForYouState.browsingIdentity.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 24));
}

uint64_t ForYouState.hasExistingDescriptors.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 28));
}

uint64_t ForYouState.isFixedWidth.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 32));
}

uint64_t ForYouState.isInternalBuild.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 36));
}

uint64_t ForYouState.isShowingCreatePlanAlert.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 40));
}

uint64_t ForYouState.isShowingCreatePlanAlert.setter(char a1)
{
  uint64_t result = type metadata accessor for ForYouState();
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*ForYouState.isShowingCreatePlanAlert.modify())()
{
  return nullsub_1;
}

__n128 ForYouState.layout.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ForYouState() + 44);
  long long v4 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v4;
  __n128 result = *(__n128 *)(v3 + 32);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t ForYouState.loadState.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for ForYouState() + 48);
  uint64_t v2 = *(void *)v1;
  sub_24EFA9C60(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
  return v2;
}

uint64_t ForYouState.loadState.setter(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v9 = v4 + *(int *)(type metadata accessor for ForYouState() + 48);
  uint64_t result = sub_24EFA9D58(*(void *)v9, *(void *)(v9 + 8), *(void *)(v9 + 16), *(unsigned char *)(v9 + 24));
  *(void *)uint64_t v9 = a1;
  *(void *)(v9 + 8) = a2;
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = a4;
  return result;
}

uint64_t (*ForYouState.loadState.modify())()
{
  return nullsub_1;
}

uint64_t ForYouState.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = type metadata accessor for ForYouState();
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(result + 52));
  uint64_t v5 = *v4;
  char v6 = *((unsigned char *)v4 + 8);
  uint64_t v7 = v4[2];
  char v8 = *((unsigned char *)v4 + 24);
  uint64_t v9 = v4[4];
  char v10 = *((unsigned char *)v4 + 40);
  uint64_t v11 = v4[6];
  char v12 = *((unsigned char *)v4 + 56);
  uint64_t v13 = v4[8];
  LOBYTE(v4) = *((unsigned char *)v4 + 72);
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  *(unsigned char *)(a1 + 56) = v12;
  *(void *)(a1 + 64) = v13;
  *(unsigned char *)(a1 + 72) = (_BYTE)v4;
  return result;
}

uint64_t ForYouState.metrics.setter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  char v2 = *((unsigned char *)a1 + 8);
  uint64_t v3 = a1[2];
  char v4 = *((unsigned char *)a1 + 24);
  uint64_t v5 = a1[4];
  char v6 = *((unsigned char *)a1 + 40);
  uint64_t v7 = a1[6];
  char v8 = *((unsigned char *)a1 + 56);
  uint64_t v9 = a1[8];
  char v10 = *((unsigned char *)a1 + 72);
  uint64_t result = type metadata accessor for ForYouState();
  uint64_t v12 = v13 + *(int *)(result + 52);
  *(void *)uint64_t v12 = v1;
  *(unsigned char *)(v12 + 8) = v2;
  *(void *)(v12 + 16) = v3;
  *(unsigned char *)(v12 + 24) = v4;
  *(void *)(v12 + 32) = v5;
  *(unsigned char *)(v12 + 40) = v6;
  *(void *)(v12 + 48) = v7;
  *(unsigned char *)(v12 + 56) = v8;
  *(void *)(v12 + 64) = v9;
  *(unsigned char *)(v12 + 72) = v10;
  return result;
}

uint64_t (*ForYouState.metrics.modify())()
{
  return nullsub_1;
}

uint64_t ForYouState.maxRetryCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ForYouState() + 56));
}

uint64_t ForYouState.networkConditions.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 60));
}

uint64_t ForYouState.networkConditions.setter(char a1)
{
  uint64_t result = type metadata accessor for ForYouState();
  *(unsigned char *)(v1 + *(int *)(result + 60)) = a1;
  return result;
}

uint64_t (*ForYouState.networkConditions.modify())()
{
  return nullsub_1;
}

uint64_t ForYouState.retryCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ForYouState() + 64));
}

uint64_t ForYouState.retryCount.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for ForYouState();
  *(void *)(v1 + *(int *)(result + 64)) = a1;
  return result;
}

uint64_t (*ForYouState.retryCount.modify())()
{
  return nullsub_1;
}

uint64_t ForYouState.shouldShowExploreButton.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 68));
}

uint64_t ForYouState.sizeClass.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 72));
}

uint64_t ForYouState.sizeClass.setter(char a1)
{
  uint64_t result = type metadata accessor for ForYouState();
  *(unsigned char *)(v1 + *(int *)(result + 72)) = a1;
  return result;
}

uint64_t (*ForYouState.sizeClass.modify())()
{
  return nullsub_1;
}

uint64_t ForYouState.subscriptionState.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 76));
}

uint64_t ForYouState.subscriptionState.setter(char a1)
{
  uint64_t result = type metadata accessor for ForYouState();
  *(unsigned char *)(v1 + *(int *)(result + 76)) = a1;
  return result;
}

uint64_t (*ForYouState.subscriptionState.modify())()
{
  return nullsub_1;
}

uint64_t ForYouState.supportsLocalDataSource.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ForYouState() + 80));
}

__n128 ForYouState.init(activeStorefrontLocale:awardLoadStates:browsingIdentity:hasExistingDescriptors:isFixedWidth:isInternalBuild:isShowingCreatePlanAlert:layout:loadState:metrics:maxRetryCount:networkConditions:shouldShowExploreButton:sizeClass:subscriptionState:supportsLocalDataSource:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, char a7@<W6>, long long *a8@<X7>, uint64_t a9@<X8>, __n128 a10, unint64_t a11, unsigned __int8 a12, uint64_t *a13, uint64_t a14, char a15, char a16, char a17, char a18, char a19)
{
  char v23 = a3 & 1;
  long long v36 = a8[1];
  long long v37 = *a8;
  uint64_t v24 = *((void *)a8 + 4);
  uint64_t v25 = *((void *)a8 + 5);
  uint64_t v43 = *a13;
  char v26 = *((unsigned char *)a13 + 8);
  uint64_t v27 = a13[2];
  char v28 = *((unsigned char *)a13 + 24);
  uint64_t v29 = a13[4];
  char v42 = *((unsigned char *)a13 + 40);
  uint64_t v41 = a13[6];
  char v40 = *((unsigned char *)a13 + 56);
  uint64_t v39 = a13[8];
  char v38 = *((unsigned char *)a13 + 72);
  uint64_t v30 = (int *)type metadata accessor for ForYouState();
  *(void *)(a9 + v30[16]) = 0;
  uint64_t v31 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32))(a9, a1, v31);
  *(void *)(a9 + v30[5]) = a2;
  *(unsigned char *)(a9 + v30[6]) = v23;
  *(unsigned char *)(a9 + v30[7]) = a4;
  *(unsigned char *)(a9 + v30[8]) = a5;
  *(unsigned char *)(a9 + v30[9]) = a6;
  *(unsigned char *)(a9 + v30[10]) = a7;
  uint64_t v32 = a9 + v30[11];
  *(_OWORD *)uint64_t v32 = v37;
  *(_OWORD *)(v32 + 16) = v36;
  *(void *)(v32 + 32) = v24;
  *(void *)(v32 + 40) = v25;
  uint64_t v33 = (__n128 *)(a9 + v30[12]);
  __n128 result = a10;
  *uint64_t v33 = a10;
  v33[1].n128_u64[0] = a11;
  v33[1].n128_u8[8] = a12;
  uint64_t v35 = a9 + v30[13];
  *(void *)uint64_t v35 = v43;
  *(unsigned char *)(v35 + 8) = v26;
  *(void *)(v35 + 16) = v27;
  *(unsigned char *)(v35 + 24) = v28;
  *(void *)(v35 + 32) = v29;
  *(unsigned char *)(v35 + 40) = v42;
  *(void *)(v35 + 48) = v41;
  *(unsigned char *)(v35 + 56) = v40;
  *(void *)(v35 + 64) = v39;
  *(unsigned char *)(v35 + 72) = v38;
  *(void *)(a9 + v30[14]) = a14;
  *(unsigned char *)(a9 + v30[15]) = a15;
  *(unsigned char *)(a9 + v30[17]) = a16;
  *(unsigned char *)(a9 + v30[18]) = a17;
  *(unsigned char *)(a9 + v30[19]) = a18;
  *(unsigned char *)(a9 + v30[20]) = a19;
  return result;
}

unint64_t sub_24EFC5EA0(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x616F4C6472617761;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0x5764657869467369;
      break;
    case 5:
      unint64_t result = 0x6E7265746E497369;
      break;
    case 6:
      unint64_t result = 0xD000000000000018;
      break;
    case 7:
      unint64_t result = 0x74756F79616CLL;
      break;
    case 8:
      unint64_t result = 0x7461745364616F6CLL;
      break;
    case 9:
      unint64_t result = 0x7363697274656DLL;
      break;
    case 10:
      unint64_t result = 0x797274655278616DLL;
      break;
    case 11:
    case 15:
      unint64_t result = 0xD000000000000011;
      break;
    case 12:
      unint64_t result = 0x756F437972746572;
      break;
    case 13:
      unint64_t result = 0xD000000000000017;
      break;
    case 14:
      unint64_t result = 0x73616C43657A6973;
      break;
    case 16:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24EFC60B8()
{
  return sub_24EFC5EA0(*v0);
}

uint64_t sub_24EFC60C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFC8800(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EFC60E8(unsigned char *a1@<X8>)
{
  *a1 = 17;
}

uint64_t sub_24EFC60F4(uint64_t a1)
{
  unint64_t v2 = sub_24EFC6714();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC6130(uint64_t a1)
{
  unint64_t v2 = sub_24EFC6714();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ForYouState.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998790);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFC6714();
  sub_24EFED9A0();
  LOBYTE(v26) = 0;
  sub_24EFECFD0();
  sub_24EFAD7C0(&qword_269998050);
  sub_24EFED8A0();
  if (!v2)
  {
    uint64_t v9 = (int *)type metadata accessor for ForYouState();
    *(void *)&long long v26 = *(void *)(v3 + v9[5]);
    char v33 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699987A0);
    sub_24EFC710C(&qword_2699987A8, (void (*)(void))sub_24EFC6768);
    sub_24EFED8A0();
    LOBYTE(v26) = *(unsigned char *)(v3 + v9[6]);
    char v33 = 2;
    sub_24EFB03FC();
    sub_24EFED8A0();
    LOBYTE(v26) = 3;
    sub_24EFED870();
    LOBYTE(v26) = 4;
    sub_24EFED870();
    LOBYTE(v26) = 5;
    sub_24EFED870();
    LOBYTE(v26) = 6;
    sub_24EFED870();
    char v10 = (long long *)(v3 + v9[11]);
    long long v11 = v10[1];
    long long v26 = *v10;
    long long v27 = v11;
    long long v28 = v10[2];
    char v33 = 7;
    sub_24EFC67BC();
    sub_24EFED8A0();
    uint64_t v12 = (long long *)(v3 + v9[12]);
    uint64_t v13 = *((void *)v12 + 2);
    char v14 = *((unsigned char *)v12 + 24);
    long long v26 = *v12;
    *(void *)&long long v27 = v13;
    BYTE8(v27) = v14;
    char v33 = 8;
    sub_24EFAA144();
    sub_24EFED8A0();
    uint64_t v15 = (uint64_t *)(v3 + v9[13]);
    uint64_t v16 = *v15;
    char v17 = *((unsigned char *)v15 + 8);
    uint64_t v18 = v15[2];
    char v19 = *((unsigned char *)v15 + 24);
    uint64_t v20 = v15[4];
    char v21 = *((unsigned char *)v15 + 40);
    uint64_t v22 = v15[6];
    char v23 = *((unsigned char *)v15 + 56);
    uint64_t v24 = v15[8];
    LOBYTE(v15) = *((unsigned char *)v15 + 72);
    *(void *)&long long v26 = v16;
    BYTE8(v26) = v17;
    *(void *)&long long v27 = v18;
    BYTE8(v27) = v19;
    *(void *)&long long v28 = v20;
    BYTE8(v28) = v21;
    uint64_t v29 = v22;
    char v30 = v23;
    uint64_t v31 = v24;
    char v32 = (char)v15;
    char v33 = 9;
    sub_24EFC6810();
    sub_24EFED8A0();
    LOBYTE(v26) = 10;
    sub_24EFED890();
    LOBYTE(v26) = *(unsigned char *)(v3 + v9[15]);
    char v33 = 11;
    sub_24EFB0004();
    sub_24EFED8A0();
    LOBYTE(v26) = 12;
    sub_24EFED890();
    LOBYTE(v26) = 13;
    sub_24EFED870();
    LOBYTE(v26) = *(unsigned char *)(v3 + v9[18]);
    char v33 = 14;
    sub_24EFC6864();
    sub_24EFED8A0();
    LOBYTE(v26) = *(unsigned char *)(v3 + v9[19]);
    char v33 = 15;
    sub_24EFAFE60();
    sub_24EFED8A0();
    LOBYTE(v26) = 16;
    sub_24EFED870();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24EFC6714()
{
  unint64_t result = qword_269998798;
  if (!qword_269998798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998798);
  }
  return result;
}

unint64_t sub_24EFC6768()
{
  unint64_t result = qword_2699987B0;
  if (!qword_2699987B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699987B0);
  }
  return result;
}

unint64_t sub_24EFC67BC()
{
  unint64_t result = qword_2699987B8;
  if (!qword_2699987B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699987B8);
  }
  return result;
}

unint64_t sub_24EFC6810()
{
  unint64_t result = qword_2699987C0;
  if (!qword_2699987C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699987C0);
  }
  return result;
}

unint64_t sub_24EFC6864()
{
  unint64_t result = qword_2699987C8;
  if (!qword_2699987C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699987C8);
  }
  return result;
}

uint64_t ForYouState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v4 = sub_24EFECFD0();
  uint64_t v39 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699987D0);
  uint64_t v7 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ForYouState();
  char v42 = (int *)MEMORY[0x270FA5388](v10);
  uint64_t v43 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v42[16];
  *(void *)&v43[v12] = 0;
  uint64_t v13 = a1[3];
  uint64_t v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_24EFC6714();
  char v38 = v9;
  sub_24EFED990();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  }
  uint64_t v35 = v12;
  uint64_t v36 = v7;
  LOBYTE(v44) = 0;
  sub_24EFAD7C0(&qword_269998060);
  sub_24EFED800();
  char v14 = v43;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v43, v6, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699987A0);
  char v51 = 1;
  sub_24EFC710C(&qword_2699987D8, (void (*)(void))sub_24EFC7188);
  sub_24EFED800();
  uint64_t v15 = v42;
  *(void *)&v14[v42[5]] = v44;
  char v51 = 2;
  sub_24EFB3F7C();
  sub_24EFED800();
  v14[v15[6]] = v44;
  LOBYTE(v44) = 3;
  v14[v15[7]] = sub_24EFED7D0() & 1;
  LOBYTE(v44) = 4;
  v14[v15[8]] = sub_24EFED7D0() & 1;
  LOBYTE(v44) = 5;
  v14[v15[9]] = sub_24EFED7D0() & 1;
  LOBYTE(v44) = 6;
  v14[v15[10]] = sub_24EFED7D0() & 1;
  char v51 = 7;
  sub_24EFC71DC();
  sub_24EFED800();
  uint64_t v16 = &v14[v15[11]];
  long long v17 = v45;
  *(_OWORD *)uint64_t v16 = v44;
  *((_OWORD *)v16 + 1) = v17;
  *((_OWORD *)v16 + 2) = v46;
  char v51 = 8;
  sub_24EFAA314();
  sub_24EFED800();
  uint64_t v18 = v45;
  char v19 = BYTE8(v45);
  uint64_t v20 = &v14[v15[12]];
  *(_OWORD *)uint64_t v20 = v44;
  *((void *)v20 + 2) = v18;
  v20[24] = v19;
  char v51 = 9;
  sub_24EFC7230();
  sub_24EFED800();
  char v21 = BYTE8(v44);
  uint64_t v22 = v45;
  char v23 = BYTE8(v45);
  uint64_t v24 = v46;
  char v25 = BYTE8(v46);
  uint64_t v26 = v47;
  char v27 = v48;
  uint64_t v28 = v49;
  char v29 = v50;
  char v30 = &v43[v42[13]];
  *(void *)char v30 = v44;
  v30[8] = v21;
  *((void *)v30 + 2) = v22;
  v30[24] = v23;
  *((void *)v30 + 4) = v24;
  v30[40] = v25;
  *((void *)v30 + 6) = v26;
  v30[56] = v27;
  *((void *)v30 + 8) = v28;
  v30[72] = v29;
  LOBYTE(v44) = 10;
  *(void *)&v43[v42[14]] = sub_24EFED7F0();
  char v51 = 11;
  sub_24EFB3E14();
  sub_24EFED800();
  v43[v42[15]] = v44;
  LOBYTE(v44) = 12;
  *(void *)&v43[v35] = sub_24EFED7F0();
  LOBYTE(v44) = 13;
  v43[v42[17]] = sub_24EFED7D0() & 1;
  char v51 = 14;
  sub_24EFC7284();
  sub_24EFED800();
  v43[v42[18]] = v44;
  char v51 = 15;
  sub_24EFB3DC0();
  sub_24EFED800();
  v43[v42[19]] = v44;
  LOBYTE(v44) = 16;
  char v31 = sub_24EFED7D0();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v40);
  uint64_t v32 = (uint64_t)v43;
  v43[v42[20]] = v31 & 1;
  sub_24EFC72D8(v32, v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  return sub_24EFC733C(v32);
}

uint64_t sub_24EFC710C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699987A0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24EFC7188()
{
  unint64_t result = qword_2699987E0;
  if (!qword_2699987E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699987E0);
  }
  return result;
}

unint64_t sub_24EFC71DC()
{
  unint64_t result = qword_2699987E8;
  if (!qword_2699987E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699987E8);
  }
  return result;
}

unint64_t sub_24EFC7230()
{
  unint64_t result = qword_2699987F0;
  if (!qword_2699987F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699987F0);
  }
  return result;
}

unint64_t sub_24EFC7284()
{
  unint64_t result = qword_2699987F8;
  if (!qword_2699987F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699987F8);
  }
  return result;
}

uint64_t sub_24EFC72D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ForYouState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EFC733C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ForYouState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24EFC7398@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ForYouState.init(from:)(a1, a2);
}

uint64_t sub_24EFC73B0(void *a1)
{
  return ForYouState.encode(to:)(a1);
}

unint64_t sub_24EFC73CC(unint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  unint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  unint64_t v33 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  int64_t v37 = 0;
  int64_t v34 = (unint64_t)(v4 + 63) >> 6;
  unint64_t v6 = v5 & *(void *)(result + 64);
  if (v6) {
    goto LABEL_9;
  }
LABEL_10:
  int64_t v8 = v37 + 1;
  if (!__OFADD__(v37, 1))
  {
    if (v8 < v34)
    {
      unint64_t v9 = *(void *)(v33 + 8 * v8);
      int64_t v10 = v37 + 1;
      if (v9) {
        goto LABEL_25;
      }
      int64_t v10 = v37 + 2;
      if (v37 + 2 >= v34) {
        return 1;
      }
      unint64_t v9 = *(void *)(v33 + 8 * v10);
      if (v9) {
        goto LABEL_25;
      }
      int64_t v10 = v37 + 3;
      if (v37 + 3 >= v34) {
        return 1;
      }
      unint64_t v9 = *(void *)(v33 + 8 * v10);
      if (v9) {
        goto LABEL_25;
      }
      int64_t v10 = v37 + 4;
      if (v37 + 4 >= v34) {
        return 1;
      }
      unint64_t v9 = *(void *)(v33 + 8 * v10);
      if (v9)
      {
LABEL_25:
        int64_t v37 = v10;
        uint64_t v38 = (v9 - 1) & v9;
        for (unint64_t i = __clz(__rbit64(v9)) + (v10 << 6); ; unint64_t i = __clz(__rbit64(v6)) | (v37 << 6))
        {
          uint64_t v12 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
          uint64_t v13 = *v12;
          uint64_t v14 = v12[1];
          unint64_t v15 = *(void *)(*(void *)(v3 + 56) + 8 * i);
          swift_bridgeObjectRetain();
          sub_24EFC8E84(v15);
          unint64_t v16 = sub_24EFEC090(v13, v14);
          char v18 = v17;
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
LABEL_52:
            sub_24EFC8E94(v15);
            return 0;
          }
          unint64_t result = *(void *)(*(void *)(v2 + 56) + 8 * v16);
          if (!result) {
            break;
          }
          if (result == 1)
          {
            if (v15 != 1) {
              goto LABEL_52;
            }
LABEL_8:
            unint64_t v6 = v38;
            if (!v38) {
              goto LABEL_10;
            }
            goto LABEL_9;
          }
          if (v15 < 2) {
            goto LABEL_52;
          }
          uint64_t v19 = *(void *)(result + 16);
          if (v19 != *(void *)(v15 + 16)) {
            goto LABEL_52;
          }
          if (v19) {
            BOOL v20 = result == v15;
          }
          else {
            BOOL v20 = 1;
          }
          if (!v20)
          {
            unint64_t v30 = v3;
            uint64_t v31 = v2;
            unint64_t result = swift_bridgeObjectRetain();
            unint64_t v21 = 0;
            uint64_t v22 = (uint64_t *)(v15 + 64);
            unint64_t v32 = result;
            char v23 = (uint64_t *)(result + 64);
            uint64_t v35 = v19;
            unint64_t v36 = v15;
            while (v21 < *(void *)(v15 + 16))
            {
              uint64_t v24 = *(v23 - 2);
              uint64_t v25 = *(v23 - 1);
              uint64_t v26 = *v23;
              uint64_t v27 = *(v22 - 2);
              uint64_t v28 = *(v22 - 1);
              uint64_t v39 = *v22;
              if ((*(v23 - 4) != *(v22 - 4) || *(v23 - 3) != *(v22 - 3)) && (sub_24EFED8B0() & 1) == 0) {
                goto LABEL_51;
              }
              if ((v24 != v27 || v25 != v28) && (sub_24EFED8B0() & 1) == 0) {
                goto LABEL_51;
              }
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              char v29 = sub_24EFD8D9C(v26, v39);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              unint64_t result = swift_bridgeObjectRelease();
              if ((v29 & 1) == 0)
              {
LABEL_51:
                sub_24EFC8E94(v32);
                unint64_t v15 = v36;
                goto LABEL_52;
              }
              ++v21;
              v22 += 5;
              v23 += 5;
              unint64_t v15 = v36;
              if (v35 == v21)
              {
                sub_24EFC8E94(v32);
                unint64_t v3 = v30;
                uint64_t v2 = v31;
                goto LABEL_36;
              }
            }
            __break(1u);
            goto LABEL_55;
          }
LABEL_36:
          unint64_t result = sub_24EFC8E94(v15);
          unint64_t v6 = v38;
          if (!v38) {
            goto LABEL_10;
          }
LABEL_9:
          uint64_t v38 = (v6 - 1) & v6;
        }
        if (v15) {
          goto LABEL_52;
        }
        goto LABEL_8;
      }
      int64_t v11 = v37 + 5;
      if (v37 + 5 < v34)
      {
        unint64_t v9 = *(void *)(v33 + 8 * v11);
        if (v9)
        {
          int64_t v10 = v37 + 5;
          goto LABEL_25;
        }
        while (1)
        {
          int64_t v10 = v11 + 1;
          if (__OFADD__(v11, 1)) {
            goto LABEL_56;
          }
          if (v10 >= v34) {
            return 1;
          }
          unint64_t v9 = *(void *)(v33 + 8 * v10);
          ++v11;
          if (v9) {
            goto LABEL_25;
          }
        }
      }
    }
    return 1;
  }
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
  return result;
}

uint64_t _s13FitnessForYou0bC5StateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x253351090]() & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v4 = (int *)type metadata accessor for ForYouState();
  if ((sub_24EFC73CC(*(void *)(a1 + v4[5]), *(void *)(a2 + v4[5])) & 1) == 0) {
    goto LABEL_18;
  }
  if (*(unsigned __int8 *)(a1 + v4[6]) != *(unsigned __int8 *)(a2 + v4[6])) {
    goto LABEL_18;
  }
  if (*(unsigned __int8 *)(a1 + v4[7]) != *(unsigned __int8 *)(a2 + v4[7])) {
    goto LABEL_18;
  }
  if (*(unsigned __int8 *)(a1 + v4[8]) != *(unsigned __int8 *)(a2 + v4[8])) {
    goto LABEL_18;
  }
  if (*(unsigned __int8 *)(a1 + v4[9]) != *(unsigned __int8 *)(a2 + v4[9])) {
    goto LABEL_18;
  }
  if (*(unsigned __int8 *)(a1 + v4[10]) != *(unsigned __int8 *)(a2 + v4[10])) {
    goto LABEL_18;
  }
  uint64_t v5 = a1 + v4[11];
  long long v6 = *(_OWORD *)(v5 + 16);
  float64x2_t v39 = *(float64x2_t *)v5;
  long long v40 = v6;
  long long v41 = *(_OWORD *)(v5 + 32);
  uint64_t v7 = a2 + v4[11];
  long long v8 = *(_OWORD *)(v7 + 16);
  float64x2_t v32 = *(float64x2_t *)v7;
  long long v33 = v8;
  long long v34 = *(_OWORD *)(v7 + 32);
  if (!_s13FitnessForYou6LayoutV2eeoiySbAC_ACtFZ_0(&v39, &v32)) {
    goto LABEL_18;
  }
  uint64_t v9 = v4[12];
  if ((_s13FitnessForYou9LoadStateO2eeoiySbAC_ACtFZ_0(*(void *)(a1 + v9), *(void *)(a1 + v9 + 8), *(void *)(a1 + v9 + 16), *(unsigned char *)(a1 + v9 + 24), *(void *)(a2 + v9), *(void *)(a2 + v9 + 8), *(void *)(a2 + v9 + 16), *(unsigned char *)(a2 + v9 + 24)) & 1) == 0)goto LABEL_18; {
  uint64_t v10 = a1 + v4[13];
  }
  float64_t v11 = *(double *)v10;
  char v12 = *(unsigned char *)(v10 + 8);
  uint64_t v13 = *(void *)(v10 + 16);
  char v14 = *(unsigned char *)(v10 + 24);
  uint64_t v15 = *(void *)(v10 + 32);
  char v16 = *(unsigned char *)(v10 + 40);
  uint64_t v17 = *(void *)(v10 + 48);
  char v18 = *(unsigned char *)(v10 + 56);
  uint64_t v19 = *(void *)(v10 + 64);
  LOBYTE(v10) = *(unsigned char *)(v10 + 72);
  v39.f64[0] = v11;
  LOBYTE(v39.f64[1]) = v12;
  *(void *)&long long v40 = v13;
  BYTE8(v40) = v14;
  *(void *)&long long v41 = v15;
  BYTE8(v41) = v16;
  uint64_t v42 = v17;
  char v43 = v18;
  uint64_t v44 = v19;
  char v45 = v10;
  uint64_t v20 = a2 + v4[13];
  float64_t v21 = *(double *)v20;
  char v22 = *(unsigned char *)(v20 + 8);
  uint64_t v23 = *(void *)(v20 + 16);
  char v24 = *(unsigned char *)(v20 + 24);
  uint64_t v25 = *(void *)(v20 + 32);
  char v26 = *(unsigned char *)(v20 + 40);
  uint64_t v27 = *(void *)(v20 + 48);
  char v28 = *(unsigned char *)(v20 + 56);
  uint64_t v29 = *(void *)(v20 + 64);
  LOBYTE(v20) = *(unsigned char *)(v20 + 72);
  v32.f64[0] = v21;
  LOBYTE(v32.f64[1]) = v22;
  *(void *)&long long v33 = v23;
  BYTE8(v33) = v24;
  *(void *)&long long v34 = v25;
  BYTE8(v34) = v26;
  uint64_t v35 = v27;
  char v36 = v28;
  uint64_t v37 = v29;
  char v38 = v20;
  if (!_s13FitnessForYou0bC17PerformanceMetricV2eeoiySbAC_ACtFZ_0((uint64_t)&v39, (uint64_t)&v32)) {
    goto LABEL_18;
  }
  if (*(void *)(a1 + v4[14]) == *(void *)(a2 + v4[14])
    && *(unsigned __int8 *)(a1 + v4[15]) == *(unsigned __int8 *)(a2 + v4[15])
    && *(void *)(a1 + v4[16]) == *(void *)(a2 + v4[16])
    && *(unsigned __int8 *)(a1 + v4[17]) == *(unsigned __int8 *)(a2 + v4[17])
    && *(unsigned __int8 *)(a1 + v4[18]) == *(unsigned __int8 *)(a2 + v4[18])
    && *(unsigned __int8 *)(a1 + v4[19]) == *(unsigned __int8 *)(a2 + v4[19]))
  {
    char v30 = *(unsigned char *)(a1 + v4[20]) ^ *(unsigned char *)(a2 + v4[20]) ^ 1;
  }
  else
  {
LABEL_18:
    char v30 = 0;
  }
  return v30 & 1;
}

void *initializeBufferWithCopyOfBuffer for ForYouState(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v31 = *a2;
    *a1 = *a2;
    a1 = (void *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24EFECFD0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    uint64_t v9 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v10 = a3[10];
    *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    uint64_t v11 = a3[11];
    uint64_t v12 = a3[12];
    uint64_t v13 = (_OWORD *)((char *)a1 + v11);
    char v14 = (long long *)((char *)a2 + v11);
    long long v15 = v14[2];
    long long v16 = *v14;
    v13[1] = v14[1];
    v13[2] = v15;
    *uint64_t v13 = v16;
    uint64_t v17 = (char *)a1 + v12;
    uint64_t v18 = *(void *)((char *)a2 + v12);
    uint64_t v19 = *(void *)((char *)a2 + v12 + 8);
    uint64_t v20 = *(void *)((char *)a2 + v12 + 16);
    char v21 = *((unsigned char *)a2 + v12 + 24);
    swift_bridgeObjectRetain();
    sub_24EFA9C60(v18, v19, v20, v21);
    *(void *)uint64_t v17 = v18;
    *((void *)v17 + 1) = v19;
    *((void *)v17 + 2) = v20;
    v17[24] = v21;
    uint64_t v22 = a3[13];
    uint64_t v23 = a3[14];
    char v24 = (_OWORD *)((char *)a1 + v22);
    uint64_t v25 = (_OWORD *)((char *)a2 + v22);
    long long v26 = v25[3];
    uint64_t v24[2] = v25[2];
    v24[3] = v26;
    *(_OWORD *)((char *)v24 + 57) = *(_OWORD *)((char *)v25 + 57);
    long long v27 = v25[1];
    *char v24 = *v25;
    v24[1] = v27;
    *(void *)((char *)a1 + v23) = *(void *)((char *)a2 + v23);
    uint64_t v28 = a3[16];
    *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
    uint64_t v29 = a3[18];
    *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
    *((unsigned char *)a1 + v29) = *((unsigned char *)a2 + v29);
    uint64_t v30 = a3[20];
    *((unsigned char *)a1 + a3[19]) = *((unsigned char *)a2 + a3[19]);
    *((unsigned char *)a1 + v30) = *((unsigned char *)a2 + v30);
  }
  return a1;
}

uint64_t destroy for ForYouState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 48);
  uint64_t v6 = *(void *)v5;
  uint64_t v7 = *(void *)(v5 + 8);
  uint64_t v8 = *(void *)(v5 + 16);
  char v9 = *(unsigned char *)(v5 + 24);
  return sub_24EFA9D58(v6, v7, v8, v9);
}

uint64_t initializeWithCopy for ForYouState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[11];
  uint64_t v11 = a3[12];
  uint64_t v12 = (_OWORD *)(a1 + v10);
  uint64_t v13 = (long long *)(a2 + v10);
  long long v14 = v13[2];
  long long v15 = *v13;
  v12[1] = v13[1];
  v12[2] = v14;
  *uint64_t v12 = v15;
  uint64_t v16 = a1 + v11;
  uint64_t v17 = *(void *)(a2 + v11);
  uint64_t v18 = *(void *)(a2 + v11 + 8);
  uint64_t v19 = *(void *)(a2 + v11 + 16);
  char v20 = *(unsigned char *)(a2 + v11 + 24);
  swift_bridgeObjectRetain();
  sub_24EFA9C60(v17, v18, v19, v20);
  *(void *)uint64_t v16 = v17;
  *(void *)(v16 + 8) = v18;
  *(void *)(v16 + 16) = v19;
  *(unsigned char *)(v16 + 24) = v20;
  uint64_t v21 = a3[13];
  uint64_t v22 = a3[14];
  uint64_t v23 = (_OWORD *)(a1 + v21);
  char v24 = (_OWORD *)(a2 + v21);
  long long v25 = v24[3];
  v23[2] = v24[2];
  v23[3] = v25;
  *(_OWORD *)((char *)v23 + 57) = *(_OWORD *)((char *)v24 + 57);
  long long v26 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v26;
  *(void *)(a1 + v22) = *(void *)(a2 + v22);
  uint64_t v27 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  uint64_t v28 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v28) = *(unsigned char *)(a2 + v28);
  uint64_t v29 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + v29) = *(unsigned char *)(a2 + v29);
  return a1;
}

uint64_t assignWithCopy for ForYouState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v7 = a3[11];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  v8[5] = v9[5];
  uint64_t v10 = a3[12];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *(void *)(v12 + 8);
  uint64_t v15 = *(void *)(v12 + 16);
  char v16 = *(unsigned char *)(v12 + 24);
  sub_24EFA9C60(*(void *)v12, v14, v15, v16);
  uint64_t v17 = *(void *)v11;
  uint64_t v18 = *(void *)(v11 + 8);
  uint64_t v19 = *(void *)(v11 + 16);
  *(void *)uint64_t v11 = v13;
  *(void *)(v11 + 8) = v14;
  *(void *)(v11 + 16) = v15;
  char v20 = *(unsigned char *)(v11 + 24);
  *(unsigned char *)(v11 + 24) = v16;
  sub_24EFA9D58(v17, v18, v19, v20);
  uint64_t v21 = a3[13];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v24 = *v23;
  *(unsigned char *)(v22 + 8) = *((unsigned char *)v23 + 8);
  *(void *)uint64_t v22 = v24;
  uint64_t v25 = v23[2];
  *(unsigned char *)(v22 + 24) = *((unsigned char *)v23 + 24);
  *(void *)(v22 + 16) = v25;
  uint64_t v26 = v23[4];
  *(unsigned char *)(v22 + 40) = *((unsigned char *)v23 + 40);
  *(void *)(v22 + 32) = v26;
  uint64_t v27 = v23[6];
  *(unsigned char *)(v22 + 56) = *((unsigned char *)v23 + 56);
  *(void *)(v22 + 48) = v27;
  uint64_t v28 = v23[8];
  *(unsigned char *)(v22 + 72) = *((unsigned char *)v23 + 72);
  *(void *)(v22 + 64) = v28;
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + a3[18]) = *(unsigned char *)(a2 + a3[18]);
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + a3[20]) = *(unsigned char *)(a2 + a3[20]);
  return a1;
}

uint64_t initializeWithTake for ForYouState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[11];
  uint64_t v11 = a3[12];
  uint64_t v12 = (_OWORD *)(a1 + v10);
  uint64_t v13 = (_OWORD *)(a2 + v10);
  long long v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  v12[2] = v13[2];
  uint64_t v15 = (_OWORD *)(a1 + v11);
  char v16 = (_OWORD *)(a2 + v11);
  *uint64_t v15 = *v16;
  *(_OWORD *)((char *)v15 + 9) = *(_OWORD *)((char *)v16 + 9);
  uint64_t v17 = a3[13];
  uint64_t v18 = a3[14];
  uint64_t v19 = (_OWORD *)(a1 + v17);
  char v20 = (_OWORD *)(a2 + v17);
  *(_OWORD *)((char *)v19 + 57) = *(_OWORD *)((char *)v20 + 57);
  long long v21 = v20[3];
  v19[2] = v20[2];
  v19[3] = v21;
  long long v22 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v22;
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  uint64_t v23 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  uint64_t v24 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v24) = *(unsigned char *)(a2 + v24);
  uint64_t v25 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + v25) = *(unsigned char *)(a2 + v25);
  return a1;
}

uint64_t assignWithTake for ForYouState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24EFECFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  _OWORD v10[2] = v11[2];
  uint64_t v13 = a3[12];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void *)(v15 + 16);
  char v17 = *(unsigned char *)(v15 + 24);
  uint64_t v18 = *(void *)v14;
  uint64_t v19 = *(void *)(v14 + 8);
  uint64_t v20 = *(void *)(v14 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(void *)(v14 + 16) = v16;
  char v21 = *(unsigned char *)(v14 + 24);
  *(unsigned char *)(v14 + 24) = v17;
  sub_24EFA9D58(v18, v19, v20, v21);
  uint64_t v22 = a3[13];
  uint64_t v23 = a3[14];
  uint64_t v24 = a1 + v22;
  uint64_t v25 = a2 + v22;
  *(void *)uint64_t v24 = *(void *)v25;
  *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
  *(void *)(v24 + 16) = *(void *)(v25 + 16);
  *(unsigned char *)(v24 + 24) = *(unsigned char *)(v25 + 24);
  *(void *)(v24 + 32) = *(void *)(v25 + 32);
  *(unsigned char *)(v24 + 40) = *(unsigned char *)(v25 + 40);
  *(unsigned char *)(v24 + 56) = *(unsigned char *)(v25 + 56);
  *(void *)(v24 + 48) = *(void *)(v25 + 48);
  *(unsigned char *)(v24 + 72) = *(unsigned char *)(v25 + 72);
  *(void *)(v24 + 64) = *(void *)(v25 + 64);
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  uint64_t v26 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v27 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v27) = *(unsigned char *)(a2 + v27);
  uint64_t v28 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + v28) = *(unsigned char *)(a2 + v28);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForYouState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EFC82E0);
}

uint64_t sub_24EFC82E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EFECFD0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ForYouState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EFC83B4);
}

uint64_t sub_24EFC83B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24EFECFD0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24EFC8470()
{
  uint64_t result = sub_24EFECFD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ForYouState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 16;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ForYouState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *uint64_t result = a2 + 16;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFC86C0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouState.CodingKeys()
{
  return &type metadata for ForYouState.CodingKeys;
}

unint64_t sub_24EFC86FC()
{
  unint64_t result = qword_269998800;
  if (!qword_269998800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998800);
  }
  return result;
}

unint64_t sub_24EFC8754()
{
  unint64_t result = qword_269998808;
  if (!qword_269998808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998808);
  }
  return result;
}

unint64_t sub_24EFC87AC()
{
  unint64_t result = qword_269998810;
  if (!qword_269998810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998810);
  }
  return result;
}

uint64_t sub_24EFC8800(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000016 && a2 == 0x800000024EFF4DB0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616F4C6472617761 && a2 == 0xEF73657461745364 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EFF4DD0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024EFF4DF0 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x5764657869467369 && a2 == 0xEC00000068746469 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E7265746E497369 && a2 == 0xEF646C6975426C61 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024EFF4E10 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x74756F79616CLL && a2 == 0xE600000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7363697274656DLL && a2 == 0xE700000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x797274655278616DLL && a2 == 0xED0000746E756F43 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EFF4E30 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x756F437972746572 && a2 == 0xEA0000000000746ELL || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024EFF4E50 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x73616C43657A6973 && a2 == 0xE900000000000073 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EFF4E70 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024EFF4E90)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else
  {
    char v5 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 16;
    }
    else {
      return 17;
    }
  }
}

unint64_t sub_24EFC8E84(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_24EFC8E94(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24EFC8EA8(char a1)
{
  return *(void *)&aIdle_1[8 * a1];
}

uint64_t sub_24EFC8EC8(char a1)
{
  if (a1) {
    return 0xD000000000000012;
  }
  else {
    return 0x64496F636572;
  }
}

uint64_t sub_24EFC8F00()
{
  return sub_24EFC8EA8(*v0);
}

uint64_t sub_24EFC8F08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFC9B34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFC8F30(uint64_t a1)
{
  unint64_t v2 = sub_24EFC9990();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC8F6C(uint64_t a1)
{
  unint64_t v2 = sub_24EFC9990();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFC8FAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFC9CD8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EFC8FD8(uint64_t a1)
{
  unint64_t v2 = sub_24EFC9A8C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC9014(uint64_t a1)
{
  unint64_t v2 = sub_24EFC9A8C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFC9050()
{
  return sub_24EFC8EC8(*v0);
}

uint64_t sub_24EFC9058@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFC9D6C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFC9080(uint64_t a1)
{
  unint64_t v2 = sub_24EFC9A38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC90BC(uint64_t a1)
{
  unint64_t v2 = sub_24EFC9A38();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFC90F8(uint64_t a1)
{
  unint64_t v2 = sub_24EFC99E4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC9134(uint64_t a1)
{
  unint64_t v2 = sub_24EFC99E4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFC9170(uint64_t a1)
{
  unint64_t v2 = sub_24EFC9AE0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFC91AC(uint64_t a1)
{
  unint64_t v2 = sub_24EFC9AE0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LoadState.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v39 = a4;
  int v44 = a5;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998818);
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v30 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998820);
  uint64_t v35 = *(void *)(v8 - 8);
  uint64_t v36 = v8;
  MEMORY[0x270FA5388](v8);
  long long v34 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998828);
  uint64_t v33 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  long long v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998830);
  uint64_t v28 = *(void *)(v13 - 8);
  uint64_t v29 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998838);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFC9990();
  sub_24EFED9A0();
  if ((_BYTE)v44)
  {
    uint64_t v20 = v17;
    uint64_t v21 = v39;
    uint64_t v22 = v40;
    if (v44 == 1)
    {
      LOBYTE(v41) = 2;
      sub_24EFC9A38();
      uint64_t v23 = v34;
      sub_24EFED820();
      LOBYTE(v41) = 0;
      uint64_t v24 = v23;
      uint64_t v25 = v36;
      sub_24EFED860();
      if (!v22)
      {
        uint64_t v41 = v21;
        char v45 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8878);
        sub_24EFCB058(&qword_26B1E8880, (void (*)(void))sub_24EFA82C0);
        sub_24EFED8A0();
      }
      (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v25);
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v19, v16);
    }
    else
    {
      if (v39 | v38 | v37)
      {
        LOBYTE(v41) = 3;
        sub_24EFC99E4();
        uint64_t v27 = v30;
        sub_24EFED820();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v32);
      }
      else
      {
        LOBYTE(v41) = 0;
        sub_24EFC9AE0();
        sub_24EFED820();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v29);
      }
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v19, v16);
    }
  }
  else
  {
    LOBYTE(v41) = 1;
    sub_24EFC9A8C();
    sub_24EFED820();
    uint64_t v41 = v37;
    uint64_t v42 = v38;
    char v43 = v39;
    sub_24EFB0300();
    sub_24EFED8A0();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
}

uint64_t LoadState.init(from:)(void *a1)
{
  uint64_t result = sub_24EFC9E4C(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_24EFC9784@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_24EFC9E4C(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(unsigned char *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_24EFC97B8(void *a1)
{
  return LoadState.encode(to:)(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

uint64_t sub_24EFC97DC(uint64_t a1, uint64_t a2)
{
  return _s13FitnessForYou9LoadStateO2eeoiySbAC_ACtFZ_0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(unsigned char *)(a2 + 24));
}

uint64_t _s13FitnessForYou9LoadStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (!a4)
  {
    if (a8) {
      return 0;
    }
    if ((_BYTE)a3)
    {
      if (a3 == 1)
      {
        if (a7 != 1) {
          return 0;
        }
        if (a1 == 4)
        {
          if (a5 != 4) {
            return 0;
          }
        }
        else if (a5 == 4 || a5 != a1)
        {
          return 0;
        }
      }
      else if (a1 | a2)
      {
        if (a7 != 2 || a5 != 1 || a6) {
          return 0;
        }
      }
      else if (a7 != 2 || a6 | a5)
      {
        return 0;
      }
    }
    else if ((_BYTE)a7 || (a1 != a5 || a2 != a6) && (sub_24EFED8B0() & 1) == 0)
    {
      return 0;
    }
    return 1;
  }
  if (a4 != 1)
  {
    if (a3 | a2 | a1)
    {
      if (a8 != 2 || a5 != 1 || a7 | a6) {
        return 0;
      }
    }
    else if (a8 != 2 || a6 | a5 | a7)
    {
      return 0;
    }
    return 1;
  }
  if (a8 != 1) {
    return 0;
  }
  if (a1 == a5 && a2 == a6 || (v10 = sub_24EFED8B0(), uint64_t result = 0, (v10 & 1) != 0))
  {
    return sub_24EFD91AC(a3, a7);
  }
  return result;
}

unint64_t sub_24EFC9990()
{
  unint64_t result = qword_269998840;
  if (!qword_269998840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998840);
  }
  return result;
}

unint64_t sub_24EFC99E4()
{
  unint64_t result = qword_269998848;
  if (!qword_269998848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998848);
  }
  return result;
}

unint64_t sub_24EFC9A38()
{
  unint64_t result = qword_269998850;
  if (!qword_269998850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998850);
  }
  return result;
}

unint64_t sub_24EFC9A8C()
{
  unint64_t result = qword_269998858;
  if (!qword_269998858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998858);
  }
  return result;
}

unint64_t sub_24EFC9AE0()
{
  unint64_t result = qword_269998860;
  if (!qword_269998860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998860);
  }
  return result;
}

uint64_t sub_24EFC9B34(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F5464656C696166 && a2 == 0xEC00000064616F4CLL || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24EFC9CD8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EFC9D58()
{
  return 0x6E6F73616572;
}

uint64_t sub_24EFC9D6C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64496F636572 && a2 == 0xE600000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024EFF4C80)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EFC9E4C(void *a1)
{
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699988D0);
  uint64_t v41 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  char v45 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699988D8);
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  char v43 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699988E0);
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699988E8);
  uint64_t v38 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699988F0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_24EFC9990();
  uint64_t v15 = v48;
  sub_24EFED990();
  if (v15)
  {
LABEL_7:
    uint64_t v26 = (uint64_t)v47;
LABEL_8:
    __swift_destroy_boxed_opaque_existential_1(v26);
    return v11;
  }
  uint64_t v35 = v7;
  uint64_t v36 = v9;
  uint64_t v16 = v45;
  uint64_t v17 = v46;
  uint64_t v37 = 0;
  uint64_t v18 = v43;
  uint64_t v19 = v44;
  uint64_t v48 = v11;
  uint64_t v20 = v13;
  uint64_t v21 = sub_24EFED810();
  uint64_t v11 = v21;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v24 = sub_24EFED6C0();
    swift_allocError();
    uint64_t v11 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
    *(void *)uint64_t v11 = &type metadata for LoadState;
    sub_24EFED780();
    sub_24EFED6B0();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v24 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v24);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v20, v10);
    goto LABEL_7;
  }
  switch(*(unsigned char *)(v21 + 32))
  {
    case 1:
      LOBYTE(v49) = 1;
      sub_24EFC9A8C();
      uint64_t v28 = v37;
      sub_24EFED770();
      if (v28) {
        goto LABEL_13;
      }
      sub_24EFB3F28();
      uint64_t v31 = v40;
      sub_24EFED800();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v31);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v10);
      uint64_t v11 = v49;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      return v11;
    case 2:
      LOBYTE(v49) = 2;
      sub_24EFC9A38();
      uint64_t v29 = v37;
      sub_24EFED770();
      if (v29)
      {
LABEL_13:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v10);
        uint64_t v26 = (uint64_t)v47;
        goto LABEL_8;
      }
      uint64_t v46 = (uint64_t)v13;
      LOBYTE(v49) = 0;
      uint64_t v32 = v19;
      uint64_t v11 = sub_24EFED7C0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8878);
      char v50 = 1;
      sub_24EFCB058(&qword_269997EF8, (void (*)(void))sub_24EFA87D4);
      sub_24EFED800();
      uint64_t v33 = v48;
      (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v32);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v46, v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      return v11;
    case 3:
      LOBYTE(v49) = 3;
      sub_24EFC99E4();
      uint64_t v30 = v37;
      sub_24EFED770();
      if (v30) {
        goto LABEL_15;
      }
      (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v17);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v10);
      uint64_t v11 = 1;
      goto LABEL_19;
    default:
      LOBYTE(v49) = 0;
      sub_24EFC9AE0();
      uint64_t v22 = v36;
      uint64_t v23 = v37;
      sub_24EFED770();
      if (v23)
      {
LABEL_15:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v20, v10);
        uint64_t v26 = (uint64_t)v47;
        goto LABEL_8;
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v35);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v20, v10);
      uint64_t v11 = 0;
LABEL_19:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      break;
  }
  return v11;
}

uint64_t destroy for LoadState(uint64_t a1)
{
  return sub_24EFA9D58(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for LoadState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24EFA9C60(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for LoadState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24EFA9C60(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_24EFA9D58(v7, v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for LoadState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_24EFA9D58(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for LoadState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LoadState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24EFCA8A0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24EFCA8B8(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(void *)unint64_t result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LoadState()
{
  return &type metadata for LoadState;
}

unsigned char *storeEnumTagSinglePayload for LoadState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFCA9B0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadState.CodingKeys()
{
  return &type metadata for LoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for LoadState.IdleCodingKeys()
{
  return &type metadata for LoadState.IdleCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for LoadState.FailedToLoadCodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24EFCAA94);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadState.FailedToLoadCodingKeys()
{
  return &type metadata for LoadState.FailedToLoadCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for LoadState.FetchedCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFCAB98);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadState.FetchedCodingKeys()
{
  return &type metadata for LoadState.FetchedCodingKeys;
}

ValueMetadata *type metadata accessor for LoadState.FetchingCodingKeys()
{
  return &type metadata for LoadState.FetchingCodingKeys;
}

unint64_t sub_24EFCABE4()
{
  unint64_t result = qword_269998868;
  if (!qword_269998868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998868);
  }
  return result;
}

unint64_t sub_24EFCAC3C()
{
  unint64_t result = qword_269998870;
  if (!qword_269998870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998870);
  }
  return result;
}

unint64_t sub_24EFCAC94()
{
  unint64_t result = qword_269998878;
  if (!qword_269998878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998878);
  }
  return result;
}

unint64_t sub_24EFCACEC()
{
  unint64_t result = qword_269998880;
  if (!qword_269998880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998880);
  }
  return result;
}

unint64_t sub_24EFCAD44()
{
  unint64_t result = qword_269998888;
  if (!qword_269998888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998888);
  }
  return result;
}

unint64_t sub_24EFCAD9C()
{
  unint64_t result = qword_269998890;
  if (!qword_269998890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998890);
  }
  return result;
}

unint64_t sub_24EFCADF4()
{
  unint64_t result = qword_269998898;
  if (!qword_269998898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998898);
  }
  return result;
}

unint64_t sub_24EFCAE4C()
{
  unint64_t result = qword_2699988A0;
  if (!qword_2699988A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699988A0);
  }
  return result;
}

unint64_t sub_24EFCAEA4()
{
  unint64_t result = qword_2699988A8;
  if (!qword_2699988A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699988A8);
  }
  return result;
}

unint64_t sub_24EFCAEFC()
{
  unint64_t result = qword_2699988B0;
  if (!qword_2699988B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699988B0);
  }
  return result;
}

unint64_t sub_24EFCAF54()
{
  unint64_t result = qword_2699988B8;
  if (!qword_2699988B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699988B8);
  }
  return result;
}

unint64_t sub_24EFCAFAC()
{
  unint64_t result = qword_2699988C0;
  if (!qword_2699988C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699988C0);
  }
  return result;
}

unint64_t sub_24EFCB004()
{
  unint64_t result = qword_2699988C8;
  if (!qword_2699988C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699988C8);
  }
  return result;
}

uint64_t sub_24EFCB058(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E8878);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t AssetBundle.deinit()
{
  return v0;
}

uint64_t AssetBundle.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id sub_24EFCB0E0()
{
  type metadata accessor for AssetBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2699988F8 = (uint64_t)result;
  return result;
}

id static NSBundle.asset.getter()
{
  if (qword_269997DA0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_2699988F8;
  return v0;
}

void static NSBundle.asset.setter(uint64_t a1)
{
  if (qword_269997DA0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_2699988F8;
  qword_2699988F8 = a1;
}

uint64_t (*static NSBundle.asset.modify())()
{
  if (qword_269997DA0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t type metadata accessor for AssetBundle()
{
  return self;
}

uint64_t method lookup function for AssetBundle(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AssetBundle);
}

__n128 Layout.contentMargins.getter@<Q0>(_OWORD *a1@<X8>)
{
  __n128 result = *(__n128 *)v1;
  long long v3 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v3;
  return result;
}

double Layout.imageSequenceViewSize.getter()
{
  return *(double *)(v0 + 32);
}

_OWORD *Layout.init(contentMargins:imageSequenceViewSize:)@<X0>(_OWORD *result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  long long v4 = result[1];
  *(_OWORD *)a2 = *result;
  *(_OWORD *)(a2 + 16) = v4;
  *(double *)(a2 + 32) = a3;
  *(double *)(a2 + 40) = a4;
  return result;
}

uint64_t sub_24EFCB32C(char a1)
{
  if (a1) {
    return 0xD000000000000015;
  }
  else {
    return 0x4D746E65746E6F63;
  }
}

uint64_t sub_24EFCB374()
{
  return sub_24EFCB32C(*v0);
}

uint64_t sub_24EFCB37C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFCBC34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFCB3A4(uint64_t a1)
{
  unint64_t v2 = sub_24EFCB880();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFCB3E0(uint64_t a1)
{
  unint64_t v2 = sub_24EFCB880();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Layout.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998900);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v13 = *v1;
  uint64_t v8 = *((void *)v1 + 2);
  uint64_t v9 = *((void *)v1 + 3);
  uint64_t v10 = *((void *)v1 + 4);
  uint64_t v11 = *((void *)v1 + 5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFCB880();
  sub_24EFED9A0();
  long long v15 = v13;
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  char v14 = 0;
  sub_24EFCB8D4();
  sub_24EFED8A0();
  if (!v2)
  {
    *(void *)&long long v15 = v10;
    *((void *)&v15 + 1) = v11;
    char v14 = 1;
    type metadata accessor for CGSize();
    sub_24EFCB97C(&qword_269998918);
    sub_24EFED8A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t Layout.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998920);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFCB880();
  sub_24EFED990();
  if (!v2)
  {
    char v17 = 0;
    sub_24EFCB928();
    sub_24EFED800();
    long long v9 = v14;
    uint64_t v10 = v15;
    uint64_t v11 = v16;
    type metadata accessor for CGSize();
    char v17 = 1;
    sub_24EFCB97C(&qword_269998930);
    sub_24EFED800();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    long long v12 = v14;
    *(_OWORD *)a2 = v9;
    *(void *)(a2 + 16) = v10;
    *(void *)(a2 + 24) = v11;
    *(_OWORD *)(a2 + 32) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24EFCB7FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Layout.init(from:)(a1, a2);
}

uint64_t sub_24EFCB814(void *a1)
{
  return Layout.encode(to:)(a1);
}

BOOL _s13FitnessForYou6LayoutV2eeoiySbAC_ACtFZ_0(float64x2_t *a1, float64x2_t *a2)
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*a1, *a2), (int32x4_t)vceqq_f64(a1[1], a2[1]))), 0xFuLL))) & 1) == 0)return 0; {
  if (a1[2].f64[1] == a2[2].f64[1])
  }
    return a1[2].f64[0] == a2[2].f64[0];
  return 0;
}

unint64_t sub_24EFCB880()
{
  unint64_t result = qword_269998908;
  if (!qword_269998908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998908);
  }
  return result;
}

unint64_t sub_24EFCB8D4()
{
  unint64_t result = qword_269998910;
  if (!qword_269998910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998910);
  }
  return result;
}

unint64_t sub_24EFCB928()
{
  unint64_t result = qword_269998928;
  if (!qword_269998928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998928);
  }
  return result;
}

uint64_t sub_24EFCB97C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Layout(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Layout(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Layout()
{
  return &type metadata for Layout;
}

unsigned char *storeEnumTagSinglePayload for Layout.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFCBAF4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Layout.CodingKeys()
{
  return &type metadata for Layout.CodingKeys;
}

unint64_t sub_24EFCBB30()
{
  unint64_t result = qword_269998938;
  if (!qword_269998938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998938);
  }
  return result;
}

unint64_t sub_24EFCBB88()
{
  unint64_t result = qword_269998940;
  if (!qword_269998940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998940);
  }
  return result;
}

unint64_t sub_24EFCBBE0()
{
  unint64_t result = qword_269998948;
  if (!qword_269998948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998948);
  }
  return result;
}

uint64_t sub_24EFCBC34(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4D746E65746E6F63 && a2 == 0xEE00736E69677261;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000024EFF4EE0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

ValueMetadata *type metadata accessor for AwardEnvironmentUpdatedEvent()
{
  return &type metadata for AwardEnvironmentUpdatedEvent;
}

BOOL static SubscriptionState.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24EFCBD58(char a1)
{
  return *(void *)&aUnknown_1[8 * a1];
}

uint64_t sub_24EFCBD78()
{
  return sub_24EFCBD58(*v0);
}

uint64_t sub_24EFCBD80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFCC514(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFCBDA8(uint64_t a1)
{
  unint64_t v2 = sub_24EFCC2F4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFCBDE4(uint64_t a1)
{
  unint64_t v2 = sub_24EFCC2F4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFCBE20(uint64_t a1)
{
  unint64_t v2 = sub_24EFCC39C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFCBE5C(uint64_t a1)
{
  unint64_t v2 = sub_24EFCC39C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFCBE98(uint64_t a1)
{
  unint64_t v2 = sub_24EFCC3F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFCBED4(uint64_t a1)
{
  unint64_t v2 = sub_24EFCC3F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFCBF10(uint64_t a1)
{
  unint64_t v2 = sub_24EFCC348();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFCBF4C(uint64_t a1)
{
  unint64_t v2 = sub_24EFCC348();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SubscriptionState.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998950);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998958);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998960);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998968);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  long long v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFCC2F4();
  sub_24EFED9A0();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_24EFCC39C();
      sub_24EFED820();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_24EFCC348();
      uint64_t v15 = v21;
      sub_24EFED820();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_24EFCC3F0();
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_24EFCC2F4()
{
  unint64_t result = qword_269998970;
  if (!qword_269998970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998970);
  }
  return result;
}

unint64_t sub_24EFCC348()
{
  unint64_t result = qword_269998978;
  if (!qword_269998978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998978);
  }
  return result;
}

unint64_t sub_24EFCC39C()
{
  unint64_t result = qword_269998980;
  if (!qword_269998980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998980);
  }
  return result;
}

unint64_t sub_24EFCC3F0()
{
  unint64_t result = qword_269998988;
  if (!qword_269998988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998988);
  }
  return result;
}

void *SubscriptionState.init(from:)(void *a1)
{
  return sub_24EFCC674(a1);
}

void *sub_24EFCC45C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24EFCC674(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24EFCC488(void *a1)
{
  return SubscriptionState.encode(to:)(a1, *v1);
}

uint64_t SubscriptionState.hash(into:)()
{
  return sub_24EFED950();
}

uint64_t SubscriptionState.hashValue.getter()
{
  return sub_24EFED980();
}

uint64_t sub_24EFCC514(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6269726373627573 && a2 == 0xEA00000000006465 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7263736275736E75 && a2 == 0xEC00000064656269)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_24EFCC674(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699989E0);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699989E8);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699989F0);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699989F8);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFCC2F4();
  uint64_t v12 = (uint64_t)v30;
  sub_24EFED990();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  long long v14 = v11;
  uint64_t v15 = sub_24EFED810();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_24EFED6C0();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
    void *v11 = &type metadata for SubscriptionState;
    sub_24EFED780();
    sub_24EFED6B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_24EFCC39C();
      sub_24EFED770();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_24EFCC348();
      sub_24EFED770();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_24EFCC3F0();
    sub_24EFED770();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v11;
}

unint64_t sub_24EFCCBE8()
{
  unint64_t result = qword_269998990;
  if (!qword_269998990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998990);
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionState()
{
  return &type metadata for SubscriptionState;
}

unsigned char *_s13FitnessForYou17SubscriptionStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFCCD1CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionState.CodingKeys()
{
  return &type metadata for SubscriptionState.CodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.UnknownCodingKeys()
{
  return &type metadata for SubscriptionState.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.SubscribedCodingKeys()
{
  return &type metadata for SubscriptionState.SubscribedCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.UnsubscribedCodingKeys()
{
  return &type metadata for SubscriptionState.UnsubscribedCodingKeys;
}

unint64_t sub_24EFCCD88()
{
  unint64_t result = qword_269998998;
  if (!qword_269998998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998998);
  }
  return result;
}

unint64_t sub_24EFCCDE0()
{
  unint64_t result = qword_2699989A0;
  if (!qword_2699989A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699989A0);
  }
  return result;
}

unint64_t sub_24EFCCE38()
{
  unint64_t result = qword_2699989A8;
  if (!qword_2699989A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699989A8);
  }
  return result;
}

unint64_t sub_24EFCCE90()
{
  unint64_t result = qword_2699989B0;
  if (!qword_2699989B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699989B0);
  }
  return result;
}

unint64_t sub_24EFCCEE8()
{
  unint64_t result = qword_2699989B8;
  if (!qword_2699989B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699989B8);
  }
  return result;
}

unint64_t sub_24EFCCF40()
{
  unint64_t result = qword_2699989C0;
  if (!qword_2699989C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699989C0);
  }
  return result;
}

unint64_t sub_24EFCCF98()
{
  unint64_t result = qword_2699989C8;
  if (!qword_2699989C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699989C8);
  }
  return result;
}

unint64_t sub_24EFCCFF0()
{
  unint64_t result = qword_2699989D0;
  if (!qword_2699989D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699989D0);
  }
  return result;
}

unint64_t sub_24EFCD048()
{
  unint64_t result = qword_2699989D8;
  if (!qword_2699989D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699989D8);
  }
  return result;
}

uint64_t sub_24EFCD09C(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  unsigned int v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        _OWORD *v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        uint64_t v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)uint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_24EFED490();
}

uint64_t sub_24EFCD260()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8850);
  sub_24EFAD150(&qword_26B1E8848, &qword_26B1E8850);
  return sub_24EFED090();
}

uint64_t sub_24EFCD2F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AB0);
  sub_24EFED3D0();
  return v1;
}

__n128 ForYouView.init(store:canvasViewBuilder:marketingForYouViewBuilder:imageSequenceViewBuilder:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  sub_24EFED440();
  sub_24EFED3C0();
  sub_24EFED3C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8830);
  sub_24EFED3C0();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  *(void *)a9 = sub_24EFAB170;
  *(void *)(a9 + 8) = v14;
  *(unsigned char *)(a9 + 16) = 0;
  *(void *)(a9 + 24) = a3;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 56) = a7;
  *(void *)(a9 + 64) = a8;
  __n128 result = v20;
  *(__n128 *)(a9 + 72) = v20;
  *(void *)(a9 + 88) = v21;
  *(unsigned char *)(a9 + 96) = v20.n128_u8[0];
  *(void *)(a9 + 104) = v20.n128_u64[1];
  *(__n128 *)(a9 + 112) = v20;
  return result;
}

uint64_t sub_24EFCD478()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24EFCD4B0()
{
  return sub_24EFED1D0();
}

uint64_t sub_24EFCD608@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  *((void *)&v46 + 1) = a3;
  *(void *)&long long v46 = a2;
  uint64_t v16 = sub_24EFECFD0();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v17 = sub_24EFED520();
  MEMORY[0x270FA5388](v17 - 8);
  sub_24EFED510();
  if (qword_26B1E88A0 != -1) {
    swift_once();
  }
  long long v18 = a1[4];
  long long v19 = a1[6];
  long long v20 = a1[7];
  long long v54 = a1[5];
  long long v55 = v19;
  long long v56 = v20;
  long long v21 = a1[1];
  long long v49 = *a1;
  long long v50 = v21;
  long long v22 = a1[3];
  long long v51 = a1[2];
  long long v52 = v22;
  long long v53 = v18;
  id v23 = (id)qword_26B1EB9A8;
  v48[0] = a4;
  v48[1] = a5;
  v48[2] = a6;
  v48[3] = a7;
  v48[4] = a8;
  v48[5] = a10;
  type metadata accessor for ForYouView(0, (uint64_t)v48);
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  *(void *)&long long v49 = sub_24EFED550();
  *((void *)&v49 + 1) = v24;
  sub_24EFAD1EC();
  uint64_t v25 = sub_24EFED270();
  uint64_t v27 = v26;
  char v29 = v28;
  uint64_t v31 = v30;
  long long v32 = a1[4];
  long long v33 = a1[6];
  long long v34 = a1[7];
  long long v54 = a1[5];
  long long v55 = v33;
  long long v56 = v34;
  long long v35 = a1[1];
  long long v49 = *a1;
  long long v50 = v35;
  long long v36 = a1[3];
  long long v51 = a1[2];
  long long v52 = v36;
  long long v53 = v32;
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  if (v49 == 1)
  {
    long long v49 = v46;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_24EFED270();
    uint64_t v38 = v41;
    uint64_t v40 = v42;
    uint64_t v39 = v43 & 1;
  }
  char v44 = v29 & 1;
  *(void *)a9 = v25;
  *(void *)(a9 + 8) = v27;
  *(unsigned char *)(a9 + 16) = v44;
  *(void *)(a9 + 24) = v31;
  *(void *)(a9 + 32) = v37;
  *(void *)(a9 + 40) = v38;
  *(void *)(a9 + 48) = v39;
  *(void *)(a9 + 56) = v40;
  sub_24EFAC0AC(v25, v27, v44);
  swift_bridgeObjectRetain();
  sub_24EFD7530(v37, v38, v39, v40);
  sub_24EFD7574(v37, v38, v39, v40);
  sub_24EFAC0BC(v25, v27, v44);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFCD970()
{
  return sub_24EFED1D0();
}

uint64_t sub_24EFCDAB0@<X0>(char a1@<W0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v37 = a3;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998A90);
  MEMORY[0x270FA5388](v34);
  uint64_t v36 = (uint64_t)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998A98);
  MEMORY[0x270FA5388](v32);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998AA0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998A40);
  MEMORY[0x270FA5388](v33);
  long long v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998A30);
  MEMORY[0x270FA5388](v35);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998A50);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  long long v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = v3[5];
  v40[4] = v3[4];
  void v40[5] = v20;
  long long v21 = v3[7];
  v40[6] = v3[6];
  v40[7] = v21;
  long long v22 = v3[1];
  v40[0] = *v3;
  v40[1] = v22;
  long long v23 = v3[3];
  v40[2] = v3[2];
  v40[3] = v23;
  switch(a1)
  {
    case 2:
      char v38 = 0;
      goto LABEL_5;
    case 3:
      char v38 = 1;
LABEL_5:
      sub_24EFED1A0();
      unsigned char *v8 = v39;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998A60);
      sub_24EFD77B4();
      sub_24EFD784C(&qword_269998A58, &qword_269998A60);
      sub_24EFED1A0();
      sub_24EFAC754((uint64_t)v15, v36, &qword_269998A30);
      swift_storeEnumTagMultiPayload();
      sub_24EFD7720();
      sub_24EFAD150(&qword_269998A48, &qword_269998A50);
      sub_24EFED1A0();
      uint64_t result = sub_24EFACB28((uint64_t)v15, &qword_269998A30);
      break;
    case 4:
      MEMORY[0x270FA5388](v17);
      long long v28 = a2[2];
      *((_OWORD *)&v31 - 4) = a2[1];
      *((_OWORD *)&v31 - 3) = v28;
      *((_OWORD *)&v31 - 2) = a2[3];
      *(&v31 - 2) = (uint64_t)v40;
      uint64_t v30 = v29;
      sub_24EFED3B0();
      (*(void (**)(uint64_t, char *, uint64_t))(v30 + 16))(v36, v19, v16);
      swift_storeEnumTagMultiPayload();
      sub_24EFD7720();
      sub_24EFAD150(&qword_269998A48, &qword_269998A50);
      sub_24EFED1A0();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v19, v16);
      break;
    default:
      MEMORY[0x270FA5388](v17);
      long long v24 = a2[2];
      *((_OWORD *)&v31 - 4) = a2[1];
      *((_OWORD *)&v31 - 3) = v24;
      *((_OWORD *)&v31 - 2) = a2[3];
      *(&v31 - 2) = (uint64_t)v40;
      uint64_t v26 = v25;
      uint64_t v31 = v25;
      sub_24EFED3B0();
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v11, v19, v16);
      swift_storeEnumTagMultiPayload();
      sub_24EFAD150(&qword_269998A48, &qword_269998A50);
      sub_24EFED1A0();
      sub_24EFAC754((uint64_t)v13, (uint64_t)v8, &qword_269998A40);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998A60);
      sub_24EFD77B4();
      sub_24EFD784C(&qword_269998A58, &qword_269998A60);
      sub_24EFED1A0();
      sub_24EFACB28((uint64_t)v13, &qword_269998A40);
      sub_24EFAC754((uint64_t)v15, v36, &qword_269998A30);
      swift_storeEnumTagMultiPayload();
      sub_24EFD7720();
      sub_24EFED1A0();
      sub_24EFACB28((uint64_t)v15, &qword_269998A30);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v19, v16);
      break;
  }
  return result;
}

double sub_24EFCE2CC@<D0>(long long *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  long long v11 = a1[5];
  long long v27 = a1[4];
  long long v28 = v11;
  long long v12 = a1[7];
  long long v29 = a1[6];
  long long v30 = v12;
  long long v13 = a1[1];
  long long v23 = *a1;
  long long v24 = v13;
  long long v14 = a1[3];
  long long v25 = a1[2];
  long long v26 = v14;
  *(void *)&long long v19 = a3;
  *((void *)&v19 + 1) = a4;
  *(void *)&long long v20 = a5;
  *((void *)&v20 + 1) = a6;
  uint64_t v21 = a7;
  uint64_t v22 = a8;
  type metadata accessor for ForYouView(0, (uint64_t)&v19);
  sub_24EFCE364(a2, (uint64_t)&v19);
  __int16 v15 = v21;
  char v16 = BYTE2(v21);
  double result = *(double *)&v19;
  long long v18 = v20;
  *(_OWORD *)a9 = v19;
  *(_OWORD *)(a9 + 16) = v18;
  *(_WORD *)(a9 + 32) = v15;
  *(unsigned char *)(a9 + 34) = v16;
  return result;
}

double sub_24EFCE364@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_24EFECFD0();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_24EFED520();
  MEMORY[0x270FA5388](v6 - 8);
  switch(a1)
  {
    case 1:
      sub_24EFED510();
      if (qword_26B1E88A0 != -1) {
        goto LABEL_12;
      }
      goto LABEL_5;
    case 2:
    case 3:
      sub_24EFED1A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998A88);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998A60);
      sub_24EFD784C(&qword_269998A80, &qword_269998A88);
      sub_24EFD784C(&qword_269998A58, &qword_269998A60);
      sub_24EFED1A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998A78);
      sub_24EFD792C();
      goto LABEL_10;
    case 4:
      sub_24EFED510();
      if (qword_26B1E88A0 != -1) {
        swift_once();
      }
      long long v18 = *(_OWORD *)(v2 + 16);
      long long v19 = *(_OWORD *)(v2 + 32);
      id v14 = (id)qword_26B1EB9A8;
      sub_24EFCD260();
      swift_getKeyPath();
      sub_24EFED4D0();
      swift_release();
      swift_release();
      *(void *)&long long v17 = sub_24EFED550();
      *((void *)&v17 + 1) = v15;
      sub_24EFAD1EC();
      sub_24EFED270();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998A78);
      sub_24EFD792C();
LABEL_10:
      sub_24EFED1A0();
      break;
    default:
      sub_24EFED510();
      if (qword_26B1E88A0 != -1) {
LABEL_12:
      }
        swift_once();
LABEL_5:
      long long v18 = *(_OWORD *)(v2 + 16);
      long long v19 = *(_OWORD *)(v2 + 32);
      id v7 = (id)qword_26B1EB9A8;
      sub_24EFCD260();
      swift_getKeyPath();
      sub_24EFED4D0();
      swift_release();
      swift_release();
      *(void *)&long long v17 = sub_24EFED550();
      *((void *)&v17 + 1) = v8;
      sub_24EFAD1EC();
      uint64_t v9 = sub_24EFED270();
      uint64_t v11 = v10;
      char v13 = v12 & 1;
      sub_24EFAC0AC(v9, v10, v12 & 1);
      swift_bridgeObjectRetain();
      sub_24EFED1A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998A88);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998A60);
      sub_24EFD784C(&qword_269998A80, &qword_269998A88);
      sub_24EFD784C(&qword_269998A58, &qword_269998A60);
      sub_24EFED1A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998A78);
      sub_24EFD792C();
      sub_24EFED1A0();
      sub_24EFAC0BC(v9, v11, v13);
      swift_bridgeObjectRelease();
      break;
  }
  double result = *(double *)&v17;
  *(_OWORD *)a2 = v17;
  *(_OWORD *)(a2 + 16) = v18;
  *(_WORD *)(a2 + 32) = v19;
  *(unsigned char *)(a2 + 34) = BYTE2(v19);
  return result;
}

uint64_t sub_24EFCEABC@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v31 = a1[4];
  uint64_t v32 = a2;
  long long v29 = a1;
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87B8);
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87A8);
  sub_24EFED1B0();
  sub_24EFED390();
  v28[1] = sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  uint64_t v30 = a1[7];
  uint64_t v64 = v30;
  uint64_t v65 = MEMORY[0x263F1A240];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F18860];
  uint64_t v62 = WitnessTable;
  uint64_t v63 = MEMORY[0x263F18860];
  uint64_t v60 = swift_getWitnessTable();
  uint64_t v61 = sub_24EFAD150(&qword_26B1E87B0, &qword_26B1E87B8);
  uint64_t v58 = swift_getWitnessTable();
  uint64_t v59 = MEMORY[0x263F189A8];
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v57 = v5;
  swift_getWitnessTable();
  sub_24EFD41D0();
  swift_getOpaqueTypeMetadata2();
  sub_24EFED1B0();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v55 = sub_24EFD4224();
  swift_getWitnessTable();
  sub_24EFED0D0();
  sub_24EFED0E0();
  sub_24EFED1B0();
  uint64_t v6 = MEMORY[0x263F1A830];
  swift_getTupleTypeMetadata2();
  uint64_t v7 = sub_24EFED480();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E8820);
  uint64_t v9 = swift_getWitnessTable();
  unint64_t v10 = sub_24EFD4298();
  *(void *)&long long v66 = v7;
  *((void *)&v66 + 1) = v6;
  *(void *)&long long v67 = v8;
  *((void *)&v67 + 1) = v9;
  *(void *)&long long v68 = MEMORY[0x263F1A820];
  *((void *)&v68 + 1) = v10;
  uint64_t v11 = sub_24EFED1E0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  long long v17 = (char *)v28 - v16;
  long long v18 = v2[5];
  long long v70 = v2[4];
  long long v71 = v18;
  long long v19 = v2[7];
  long long v72 = v2[6];
  long long v73 = v19;
  long long v20 = v2[1];
  long long v66 = *v2;
  long long v67 = v20;
  long long v21 = v2[3];
  long long v68 = v2[2];
  long long v69 = v21;
  uint64_t v22 = v29[3];
  uint64_t v47 = v29[2];
  uint64_t v48 = v22;
  uint64_t v23 = v29[5];
  uint64_t v24 = v29[6];
  uint64_t v49 = v31;
  uint64_t v50 = v23;
  uint64_t v51 = v24;
  uint64_t v52 = v30;
  long long v53 = &v66;
  uint64_t v40 = v47;
  uint64_t v41 = v22;
  uint64_t v42 = v31;
  uint64_t v43 = v23;
  uint64_t v44 = v24;
  uint64_t v45 = v30;
  long long v46 = &v66;
  uint64_t v33 = v47;
  uint64_t v34 = v22;
  uint64_t v35 = v31;
  uint64_t v36 = v23;
  uint64_t v37 = v24;
  uint64_t v38 = v30;
  char v39 = &v66;
  sub_24EFED1D0();
  swift_getWitnessTable();
  long long v25 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v25(v17, v15, v11);
  long long v26 = *(void (**)(char *, uint64_t))(v12 + 8);
  v26(v15, v11);
  v25(v32, v17, v11);
  return ((uint64_t (*)(char *, uint64_t))v26)(v17, v11);
}

uint64_t sub_24EFCF03C@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v119 = a6;
  *((void *)&v108 + 1) = a3;
  uint64_t v109 = a5;
  uint64_t v107 = a4;
  *(void *)&long long v108 = a2;
  uint64_t v117 = a8;
  uint64_t v10 = sub_24EFECFD0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v116 = (char *)v102 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24EFED520();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v115 = (char *)v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EFED0E0();
  uint64_t v132 = sub_24EFED0E0();
  uint64_t v14 = sub_24EFED0E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87B8);
  uint64_t v131 = v14;
  uint64_t v127 = sub_24EFED0E0();
  uint64_t v128 = sub_24EFED0E0();
  uint64_t v15 = sub_24EFED0E0();
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87A8);
  uint64_t v130 = v15;
  uint64_t v129 = sub_24EFED1B0();
  uint64_t v16 = sub_24EFED390();
  uint64_t v103 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v111 = (char *)v102 - v17;
  uint64_t v118 = v18;
  uint64_t v19 = sub_24EFED0E0();
  uint64_t v106 = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v105 = (char *)v102 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v104 = (char *)v102 - v22;
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  uint64_t v23 = sub_24EFED0E0();
  uint64_t v219 = a7;
  uint64_t v220 = MEMORY[0x263F1A240];
  uint64_t v24 = a7;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v217 = WitnessTable;
  uint64_t v218 = MEMORY[0x263F18860];
  uint64_t v25 = MEMORY[0x263F18860];
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v27 = sub_24EFAD150(&qword_26B1E87B0, &qword_26B1E87B8);
  uint64_t v215 = v26;
  uint64_t v216 = v27;
  uint64_t v125 = v27;
  uint64_t v213 = swift_getWitnessTable();
  uint64_t v214 = MEMORY[0x263F189A8];
  uint64_t v211 = swift_getWitnessTable();
  uint64_t v212 = v25;
  uint64_t v28 = swift_getWitnessTable();
  unint64_t v29 = sub_24EFD41D0();
  uint64_t v30 = MEMORY[0x263F8EF38];
  *(void *)&long long v201 = v23;
  *((void *)&v201 + 1) = MEMORY[0x263F8EF38];
  *(void *)&long long v202 = v28;
  *((void *)&v202 + 1) = v29;
  swift_getOpaqueTypeMetadata2();
  uint64_t v31 = sub_24EFED1B0();
  *(void *)&long long v201 = v23;
  *((void *)&v201 + 1) = v30;
  *(void *)&long long v202 = v28;
  *((void *)&v202 + 1) = v29;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v33 = sub_24EFD4224();
  uint64_t v209 = OpaqueTypeConformance2;
  unint64_t v210 = v33;
  unint64_t v121 = v33;
  v102[0] = swift_getWitnessTable();
  v102[1] = v31;
  uint64_t v122 = sub_24EFED0D0();
  uint64_t v34 = sub_24EFED0E0();
  uint64_t v126 = v19;
  uint64_t v35 = sub_24EFED1B0();
  uint64_t v113 = *(void *)(v35 - 8);
  uint64_t v114 = v35;
  uint64_t v36 = MEMORY[0x270FA5388](v35);
  uint64_t v123 = (char *)v102 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v120 = (char *)v102 - v38;
  long long v39 = a1[5];
  long long v205 = a1[4];
  long long v206 = v39;
  long long v40 = a1[7];
  long long v207 = a1[6];
  long long v208 = v40;
  long long v41 = a1[1];
  long long v201 = *a1;
  long long v202 = v41;
  long long v42 = a1[3];
  long long v203 = a1[2];
  long long v204 = v42;
  uint64_t v43 = v108;
  long long v195 = v108;
  uint64_t v44 = *((void *)&v108 + 1);
  uint64_t v45 = v107;
  uint64_t v196 = v107;
  uint64_t v46 = v109;
  uint64_t v197 = v109;
  uint64_t v198 = v119;
  uint64_t v110 = v24;
  uint64_t v199 = v24;
  uint64_t v47 = type metadata accessor for ForYouView(0, (uint64_t)&v195);
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  uint64_t v48 = swift_release();
  uint64_t v133 = v34;
  uint64_t v112 = v47;
  if (v201 == 1)
  {
    MEMORY[0x270FA5388](v48);
    v102[-8] = v43;
    v102[-7] = v44;
    v102[-6] = v45;
    v102[-5] = v46;
    uint64_t v49 = v110;
    v102[-4] = v119;
    v102[-3] = v49;
    v102[-2] = a1;
    uint64_t v149 = WitnessTable;
    uint64_t v150 = MEMORY[0x263F1A240];
    uint64_t v147 = swift_getWitnessTable();
    uint64_t v50 = MEMORY[0x263F18860];
    uint64_t v148 = MEMORY[0x263F18860];
    uint64_t v145 = swift_getWitnessTable();
    uint64_t v146 = v125;
    uint64_t v143 = swift_getWitnessTable();
    uint64_t v144 = MEMORY[0x263F189A8];
    uint64_t v141 = swift_getWitnessTable();
    uint64_t v142 = v50;
    uint64_t v139 = swift_getWitnessTable();
    unint64_t v140 = v121;
    uint64_t v51 = swift_getWitnessTable();
    sub_24EFED380();
    long long v52 = a1[5];
    long long v205 = a1[4];
    long long v206 = v52;
    long long v53 = a1[7];
    long long v207 = a1[6];
    long long v208 = v53;
    long long v54 = a1[1];
    long long v201 = *a1;
    long long v202 = v54;
    long long v55 = a1[3];
    long long v203 = a1[2];
    long long v204 = v55;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    sub_24EFED430();
    uint64_t v138 = v51;
    uint64_t v56 = v118;
    uint64_t v57 = swift_getWitnessTable();
    uint64_t v58 = v126;
    uint64_t v59 = (uint64_t)v105;
    uint64_t v60 = v111;
    sub_24EFED2F0();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v60, v56);
    uint64_t v136 = v57;
    uint64_t v137 = MEMORY[0x263F18860];
    uint64_t v119 = swift_getWitnessTable();
    uint64_t v61 = v106;
    uint64_t v62 = *(void (**)(char *, uint64_t, uint64_t))(v106 + 16);
    uint64_t v63 = v104;
    v62(v104, v59, v58);
    uint64_t v64 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
    v64(v59, v58);
    v62((char *)v59, (uint64_t)v63, v58);
    uint64_t v134 = swift_getWitnessTable();
    uint64_t v135 = MEMORY[0x263F18860];
    swift_getWitnessTable();
    sub_24EFD11A4(v59, v58);
    v64(v59, v58);
    v64((uint64_t)v63, v58);
  }
  else
  {
    uint64_t v65 = swift_allocObject();
    *(void *)(v65 + 16) = v43;
    *(void *)(v65 + 24) = v44;
    *(void *)(v65 + 32) = v45;
    *(void *)(v65 + 40) = v46;
    uint64_t v66 = v110;
    *(void *)(v65 + 48) = v119;
    *(void *)(v65 + 56) = v66;
    long long v67 = a1[5];
    *(_OWORD *)(v65 + 128) = a1[4];
    *(_OWORD *)(v65 + 144) = v67;
    long long v68 = a1[7];
    *(_OWORD *)(v65 + 160) = a1[6];
    *(_OWORD *)(v65 + 176) = v68;
    long long v69 = a1[1];
    *(_OWORD *)(v65 + 64) = *a1;
    *(_OWORD *)(v65 + 80) = v69;
    long long v70 = a1[3];
    *(_OWORD *)(v65 + 96) = a1[2];
    *(_OWORD *)(v65 + 112) = v70;
    sub_24EFD6790((uint64_t)a1);
    *(void *)&long long v189 = sub_24EFED0C0();
    *((void *)&v189 + 1) = v71;
    long long v72 = a1[5];
    long long v205 = a1[4];
    long long v206 = v72;
    long long v73 = a1[7];
    long long v207 = a1[6];
    long long v208 = v73;
    long long v74 = a1[1];
    long long v201 = *a1;
    long long v202 = v74;
    long long v75 = a1[3];
    long long v203 = a1[2];
    long long v204 = v75;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    sub_24EFED430();
    uint64_t v76 = swift_getWitnessTable();
    sub_24EFED2F0();
    swift_release();
    long long v189 = v195;
    uint64_t v190 = v196;
    char v191 = v197;
    uint64_t v192 = v198;
    char v193 = v199;
    long long v194 = v200;
    uint64_t v187 = v76;
    uint64_t v77 = MEMORY[0x263F18860];
    uint64_t v188 = MEMORY[0x263F18860];
    uint64_t v78 = v133;
    uint64_t v119 = swift_getWitnessTable();
    uint64_t v79 = *(void (**)(long long *, long long *, uint64_t))(*(void *)(v78 - 8) + 16);
    uint64_t v80 = v126;
    v79(&v201, &v189, v133);
    swift_release();
    long long v189 = v201;
    uint64_t v190 = v202;
    char v191 = BYTE8(v202);
    uint64_t v192 = v203;
    char v193 = BYTE8(v203);
    long long v194 = v204;
    v79(&v195, &v189, v133);
    long long v189 = v195;
    uint64_t v190 = v196;
    char v191 = v197;
    uint64_t v192 = v198;
    char v193 = v199;
    long long v194 = v200;
    uint64_t v185 = WitnessTable;
    uint64_t v186 = MEMORY[0x263F1A240];
    uint64_t v183 = swift_getWitnessTable();
    uint64_t v184 = v77;
    uint64_t v181 = swift_getWitnessTable();
    uint64_t v182 = v125;
    uint64_t v179 = swift_getWitnessTable();
    uint64_t v180 = MEMORY[0x263F189A8];
    uint64_t v177 = swift_getWitnessTable();
    uint64_t v178 = v77;
    uint64_t v175 = swift_getWitnessTable();
    unint64_t v176 = v121;
    uint64_t v174 = swift_getWitnessTable();
    uint64_t v172 = swift_getWitnessTable();
    uint64_t v173 = v77;
    swift_getWitnessTable();
    sub_24EFD18F4((uint64_t)&v189, v80, v133);
    swift_release();
    swift_release();
  }
  sub_24EFED510();
  if (qword_26B1E88A0 != -1) {
    swift_once();
  }
  long long v81 = a1[5];
  long long v205 = a1[4];
  long long v206 = v81;
  long long v82 = a1[7];
  long long v207 = a1[6];
  long long v208 = v82;
  long long v83 = a1[1];
  long long v201 = *a1;
  long long v202 = v83;
  long long v84 = a1[3];
  long long v203 = a1[2];
  long long v204 = v84;
  id v85 = (id)qword_26B1EB9A8;
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  *(void *)&long long v201 = sub_24EFED550();
  *((void *)&v201 + 1) = v86;
  sub_24EFAD1EC();
  uint64_t v87 = sub_24EFED270();
  uint64_t v89 = v88;
  uint64_t v91 = v90;
  uint64_t v119 = v90;
  char v93 = v92 & 1;
  uint64_t v94 = v113;
  uint64_t v95 = v123;
  uint64_t v96 = v114;
  (*(void (**)(void))(v113 + 16))();
  *(void *)&long long v201 = v87;
  *((void *)&v201 + 1) = v89;
  LOBYTE(v202) = v93;
  *((void *)&v202 + 1) = v91;
  *(void *)&long long v195 = v95;
  *((void *)&v195 + 1) = &v201;
  sub_24EFAC0AC(v87, v89, v93);
  swift_bridgeObjectRetain();
  *(void *)&long long v189 = v96;
  *((void *)&v189 + 1) = MEMORY[0x263F1A830];
  uint64_t v168 = WitnessTable;
  uint64_t v169 = MEMORY[0x263F1A240];
  uint64_t v166 = swift_getWitnessTable();
  uint64_t v97 = MEMORY[0x263F18860];
  uint64_t v167 = MEMORY[0x263F18860];
  uint64_t v164 = swift_getWitnessTable();
  uint64_t v165 = v125;
  uint64_t v162 = swift_getWitnessTable();
  uint64_t v163 = MEMORY[0x263F189A8];
  uint64_t v160 = swift_getWitnessTable();
  uint64_t v161 = v97;
  uint64_t v158 = swift_getWitnessTable();
  unint64_t v159 = v121;
  uint64_t v157 = swift_getWitnessTable();
  uint64_t v155 = swift_getWitnessTable();
  uint64_t v156 = v97;
  uint64_t v98 = swift_getWitnessTable();
  uint64_t v153 = swift_getWitnessTable();
  uint64_t v154 = v97;
  uint64_t v99 = swift_getWitnessTable();
  uint64_t v151 = v98;
  uint64_t v152 = v99;
  uint64_t v170 = swift_getWitnessTable();
  uint64_t v171 = MEMORY[0x263F1A820];
  sub_24EFCD09C((uint64_t)&v195, 2uLL, (uint64_t)&v189);
  sub_24EFAC0BC(v87, v89, v93);
  swift_bridgeObjectRelease();
  uint64_t v100 = *(void (**)(char *, uint64_t))(v94 + 8);
  v100(v120, v96);
  sub_24EFAC0BC(v201, *((uint64_t *)&v201 + 1), v202);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v100)(v123, v96);
}

uint64_t sub_24EFD00A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v155 = a7;
  uint64_t v152 = a6;
  uint64_t v148 = a8;
  uint64_t v128 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v127 = (char *)&v124 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24EFED0E0();
  uint64_t v130 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v129 = (char *)&v124 - v15;
  uint64_t v151 = v16;
  uint64_t v17 = sub_24EFED0E0();
  uint64_t v132 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v131 = (char *)&v124 - v18;
  uint64_t v150 = v19;
  uint64_t v20 = sub_24EFED0E0();
  uint64_t v134 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v133 = (char *)&v124 - v21;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87B8);
  uint64_t v154 = v20;
  uint64_t v22 = sub_24EFED0E0();
  uint64_t v137 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v135 = (char *)&v124 - v23;
  uint64_t v149 = v24;
  uint64_t v25 = sub_24EFED0E0();
  uint64_t v138 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v136 = (char *)&v124 - v26;
  uint64_t v153 = v27;
  uint64_t v28 = sub_24EFED0E0();
  uint64_t v141 = *(void *)(v28 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  unint64_t v140 = (char *)&v124 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v139 = (char *)&v124 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87A8);
  uint64_t v143 = v28;
  uint64_t v144 = v32;
  uint64_t v33 = sub_24EFED1B0();
  uint64_t v146 = *(void *)(v33 - 8);
  uint64_t v147 = v33;
  MEMORY[0x270FA5388](v33);
  uint64_t v145 = (char *)&v124 - v34;
  LOBYTE(v28) = *(unsigned char *)(a1 + 96);
  uint64_t v35 = *(void *)(a1 + 104);
  uint64_t v36 = a2;
  *(void *)&long long v166 = a2;
  *((void *)&v166 + 1) = a3;
  uint64_t v37 = a4;
  *(void *)&long long v167 = a4;
  *((void *)&v167 + 1) = a5;
  uint64_t v38 = a5;
  *(void *)&long long v168 = v152;
  *((void *)&v168 + 1) = v155;
  uint64_t v142 = type metadata accessor for ForYouView(0, (uint64_t)&v166);
  LOBYTE(v166) = v28 & 1;
  *((void *)&v166 + 1) = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AC0);
  uint64_t v39 = sub_24EFED3D0();
  uint64_t v40 = MEMORY[0x263F18860];
  if (v202 == 1)
  {
    long long v41 = v127;
    (*(void (**)(uint64_t))(a1 + 56))(v39);
    uint64_t v42 = swift_allocObject();
    *(void *)(v42 + 16) = a2;
    *(void *)(v42 + 24) = a3;
    uint64_t v125 = a3;
    uint64_t v126 = v38;
    *(void *)(v42 + 32) = v37;
    *(void *)(v42 + 40) = v38;
    uint64_t v43 = v152;
    uint64_t v44 = v155;
    *(void *)(v42 + 48) = v152;
    *(void *)(v42 + 56) = v44;
    long long v45 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v42 + 128) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v42 + 144) = v45;
    long long v46 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)(v42 + 160) = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(v42 + 176) = v46;
    long long v47 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v42 + 64) = *(_OWORD *)a1;
    *(_OWORD *)(v42 + 80) = v47;
    long long v48 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v42 + 96) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v42 + 112) = v48;
    sub_24EFD6790(a1);
    uint64_t v49 = v129;
    sub_24EFED320();
    swift_release();
    (*(void (**)(char *, uint64_t))(v128 + 8))(v41, v37);
    uint64_t v50 = swift_allocObject();
    uint64_t v51 = v125;
    *(void *)(v50 + 16) = v36;
    *(void *)(v50 + 24) = v51;
    uint64_t v52 = v126;
    *(void *)(v50 + 32) = v37;
    *(void *)(v50 + 40) = v52;
    *(void *)(v50 + 48) = v43;
    *(void *)(v50 + 56) = v44;
    long long v53 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v50 + 128) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v50 + 144) = v53;
    long long v54 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)(v50 + 160) = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(v50 + 176) = v54;
    long long v55 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v50 + 64) = *(_OWORD *)a1;
    *(_OWORD *)(v50 + 80) = v55;
    long long v56 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v50 + 96) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v50 + 112) = v56;
    sub_24EFD6790(a1);
    uint64_t v174 = v44;
    uint64_t v175 = MEMORY[0x263F1A240];
    uint64_t v57 = v151;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v59 = v131;
    sub_24EFED2A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v130 + 8))(v49, v57);
    long long v60 = *(_OWORD *)(a1 + 80);
    long long v170 = *(_OWORD *)(a1 + 64);
    long long v171 = v60;
    long long v61 = *(_OWORD *)(a1 + 112);
    long long v172 = *(_OWORD *)(a1 + 96);
    long long v173 = v61;
    long long v62 = *(_OWORD *)(a1 + 16);
    long long v166 = *(_OWORD *)a1;
    long long v167 = v62;
    long long v63 = *(_OWORD *)(a1 + 48);
    long long v168 = *(_OWORD *)(a1 + 32);
    long long v169 = v63;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    sub_24EFED430();
    uint64_t v164 = WitnessTable;
    uint64_t v165 = MEMORY[0x263F1A240];
    uint64_t v64 = v150;
    uint64_t v65 = swift_getWitnessTable();
    uint64_t v66 = v133;
    sub_24EFED2F0();
    (*(void (**)(char *, uint64_t))(v132 + 8))(v59, v64);
    long long v166 = *(_OWORD *)(a1 + 112);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269998AB8);
    sub_24EFED3D0();
    long long v67 = *(_OWORD *)(a1 + 80);
    long long v170 = *(_OWORD *)(a1 + 64);
    long long v171 = v67;
    long long v68 = *(_OWORD *)(a1 + 112);
    long long v172 = *(_OWORD *)(a1 + 96);
    long long v173 = v68;
    long long v69 = *(_OWORD *)(a1 + 16);
    long long v166 = *(_OWORD *)a1;
    long long v167 = v69;
    long long v70 = *(_OWORD *)(a1 + 48);
    long long v168 = *(_OWORD *)(a1 + 32);
    long long v169 = v70;
    *(void *)&long long v166 = sub_24EFCD2F0();
    *((void *)&v166 + 1) = v71;
    uint64_t v162 = v65;
    uint64_t v163 = MEMORY[0x263F18860];
    uint64_t v72 = v154;
    uint64_t v73 = swift_getWitnessTable();
    sub_24EFD7BC4();
    long long v74 = v135;
    sub_24EFED340();
    swift_release();
    (*(void (**)(char *, uint64_t))(v134 + 8))(v66, v72);
    long long v75 = *(_OWORD *)(a1 + 80);
    long long v170 = *(_OWORD *)(a1 + 64);
    long long v171 = v75;
    long long v76 = *(_OWORD *)(a1 + 112);
    long long v172 = *(_OWORD *)(a1 + 96);
    long long v173 = v76;
    long long v77 = *(_OWORD *)(a1 + 16);
    long long v166 = *(_OWORD *)a1;
    long long v167 = v77;
    long long v78 = *(_OWORD *)(a1 + 48);
    long long v168 = *(_OWORD *)(a1 + 32);
    long long v169 = v78;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    long long v79 = *(_OWORD *)(a1 + 80);
    long long v170 = *(_OWORD *)(a1 + 64);
    long long v171 = v79;
    long long v80 = *(_OWORD *)(a1 + 112);
    long long v172 = *(_OWORD *)(a1 + 96);
    long long v173 = v80;
    long long v81 = *(_OWORD *)(a1 + 16);
    long long v166 = *(_OWORD *)a1;
    long long v167 = v81;
    long long v82 = *(_OWORD *)(a1 + 48);
    long long v168 = *(_OWORD *)(a1 + 32);
    long long v169 = v82;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    uint64_t v83 = sub_24EFAD150(&qword_26B1E87B0, &qword_26B1E87B8);
    uint64_t v160 = v73;
    uint64_t v161 = v83;
    uint64_t v84 = v149;
    uint64_t v85 = swift_getWitnessTable();
    uint64_t v86 = v136;
    sub_24EFED300();
    (*(void (**)(char *, uint64_t))(v137 + 8))(v74, v84);
    long long v87 = *(_OWORD *)(a1 + 80);
    long long v170 = *(_OWORD *)(a1 + 64);
    long long v171 = v87;
    long long v88 = *(_OWORD *)(a1 + 112);
    long long v172 = *(_OWORD *)(a1 + 96);
    long long v173 = v88;
    long long v89 = *(_OWORD *)(a1 + 16);
    long long v166 = *(_OWORD *)a1;
    long long v167 = v89;
    long long v90 = *(_OWORD *)(a1 + 48);
    long long v168 = *(_OWORD *)(a1 + 32);
    long long v169 = v90;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    long long v91 = *(_OWORD *)(a1 + 80);
    long long v170 = *(_OWORD *)(a1 + 64);
    long long v171 = v91;
    long long v92 = *(_OWORD *)(a1 + 112);
    long long v172 = *(_OWORD *)(a1 + 96);
    long long v173 = v92;
    long long v93 = *(_OWORD *)(a1 + 16);
    long long v166 = *(_OWORD *)a1;
    long long v167 = v93;
    long long v94 = *(_OWORD *)(a1 + 48);
    long long v168 = *(_OWORD *)(a1 + 32);
    long long v169 = v94;
    sub_24EFCD2F0();
    uint64_t v158 = v85;
    uint64_t v159 = MEMORY[0x263F189A8];
    uint64_t v95 = v153;
    uint64_t v96 = swift_getWitnessTable();
    uint64_t v97 = (uint64_t)v140;
    sub_24EFED2F0();
    uint64_t v98 = v95;
    uint64_t v40 = MEMORY[0x263F18860];
    (*(void (**)(char *, uint64_t))(v138 + 8))(v86, v98);
    uint64_t v156 = v96;
    uint64_t v157 = v40;
    uint64_t v99 = v143;
    swift_getWitnessTable();
    uint64_t v100 = v141;
    uint64_t v101 = *(void (**)(char *, uint64_t, uint64_t))(v141 + 16);
    uint64_t v102 = v139;
    v101(v139, v97, v99);
    uint64_t v103 = *(void (**)(uint64_t, uint64_t))(v100 + 8);
    v103(v97, v99);
    v101((char *)v97, (uint64_t)v102, v99);
    sub_24EFD4224();
    uint64_t v104 = v145;
    sub_24EFD11A4(v97, v99);
    v103(v97, v99);
    v103((uint64_t)v102, v99);
  }
  else
  {
    uint64_t v105 = sub_24EFED360();
    uint64_t v106 = swift_allocObject();
    *(void *)(v106 + 16) = a2;
    *(void *)(v106 + 24) = a3;
    *(void *)(v106 + 32) = v37;
    *(void *)(v106 + 40) = a5;
    uint64_t v107 = v155;
    *(void *)(v106 + 48) = v152;
    *(void *)(v106 + 56) = v107;
    long long v108 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v106 + 128) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v106 + 144) = v108;
    long long v109 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)(v106 + 160) = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(v106 + 176) = v109;
    long long v110 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v106 + 64) = *(_OWORD *)a1;
    *(_OWORD *)(v106 + 80) = v110;
    long long v111 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v106 + 96) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v106 + 112) = v111;
    *(void *)&long long v166 = v105;
    *((void *)&v166 + 1) = sub_24EFD7B14;
    long long v167 = (unint64_t)v106;
    *(void *)&long long v168 = 0;
    sub_24EFD6790(a1);
    uint64_t v200 = v107;
    uint64_t v112 = MEMORY[0x263F1A240];
    uint64_t v201 = MEMORY[0x263F1A240];
    uint64_t v198 = swift_getWitnessTable();
    uint64_t v199 = v112;
    uint64_t v196 = swift_getWitnessTable();
    uint64_t v197 = v40;
    uint64_t v113 = swift_getWitnessTable();
    uint64_t v114 = sub_24EFAD150(&qword_26B1E87B0, &qword_26B1E87B8);
    uint64_t v194 = v113;
    uint64_t v195 = v114;
    uint64_t v192 = swift_getWitnessTable();
    uint64_t v193 = MEMORY[0x263F189A8];
    uint64_t v190 = swift_getWitnessTable();
    uint64_t v191 = v40;
    uint64_t v115 = v143;
    swift_getWitnessTable();
    sub_24EFD4224();
    uint64_t v104 = v145;
    sub_24EFD18F4((uint64_t)&v166, v115, v144);
    swift_release();
    swift_release();
  }
  uint64_t v188 = v155;
  uint64_t v116 = MEMORY[0x263F1A240];
  uint64_t v189 = MEMORY[0x263F1A240];
  uint64_t v186 = swift_getWitnessTable();
  uint64_t v187 = v116;
  uint64_t v184 = swift_getWitnessTable();
  uint64_t v185 = v40;
  uint64_t v117 = swift_getWitnessTable();
  uint64_t v118 = sub_24EFAD150(&qword_26B1E87B0, &qword_26B1E87B8);
  uint64_t v182 = v117;
  uint64_t v183 = v118;
  uint64_t v180 = swift_getWitnessTable();
  uint64_t v181 = MEMORY[0x263F189A8];
  uint64_t v178 = swift_getWitnessTable();
  uint64_t v179 = v40;
  uint64_t v119 = swift_getWitnessTable();
  unint64_t v120 = sub_24EFD4224();
  uint64_t v176 = v119;
  unint64_t v177 = v120;
  uint64_t v121 = v147;
  swift_getWitnessTable();
  uint64_t v122 = v146;
  (*(void (**)(uint64_t, char *, uint64_t))(v146 + 16))(v148, v104, v121);
  return (*(uint64_t (**)(char *, uint64_t))(v122 + 8))(v104, v121);
}

uint64_t sub_24EFD0F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  long long v14 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 48);
  long long v41 = *(_OWORD *)(a1 + 64);
  long long v42 = v14;
  long long v16 = *(_OWORD *)(a1 + 80);
  long long v43 = *(_OWORD *)(a1 + 96);
  long long v17 = *(_OWORD *)(a1 + 16);
  long long v37 = *(_OWORD *)a1;
  long long v38 = v17;
  long long v18 = *(_OWORD *)(a1 + 48);
  long long v20 = *(_OWORD *)a1;
  long long v19 = *(_OWORD *)(a1 + 16);
  long long v39 = *(_OWORD *)(a1 + 32);
  long long v40 = v18;
  long long v48 = v41;
  long long v49 = v16;
  long long v21 = *(_OWORD *)(a1 + 112);
  long long v50 = *(_OWORD *)(a1 + 96);
  long long v51 = v21;
  long long v44 = v20;
  long long v45 = v19;
  uint64_t v23 = *(void *)(a1 + 112);
  uint64_t v22 = *(void *)(a1 + 120);
  long long v46 = v39;
  long long v47 = v15;
  sub_24EFD6790(a1);
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  uint64_t v36 = a7;
  type metadata accessor for ForYouView(0, (uint64_t)&v31);
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  sub_24EFED470();
  uint64_t v24 = sub_24EFED460();
  swift_release();
  *(void *)&long long v44 = v23;
  *((void *)&v44 + 1) = v22;
  uint64_t v31 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AB8);
  sub_24EFED3E0();
  long long v48 = v41;
  long long v49 = v42;
  long long v50 = v43;
  long long v44 = v37;
  long long v45 = v38;
  long long v46 = v39;
  long long v47 = v40;
  *(void *)&long long v51 = v23;
  *((void *)&v51 + 1) = v22;
  sub_24EFD7C18((uint64_t)&v44);
  uint64_t v25 = *(void *)(a1 + 104);
  LOBYTE(v37) = *(unsigned char *)(a1 + 96) & 1;
  *((void *)&v37 + 1) = v25;
  LOBYTE(v31) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AC0);
  sub_24EFED3E0();
  long long v30 = *(_OWORD *)(a1 + 72);
  uint64_t v26 = *(void *)(a1 + 88);
  sub_24EFD6790(a1);
  uint64_t v27 = sub_24EFED450();
  long long v37 = v30;
  *(void *)&long long v38 = v26;
  uint64_t v31 = v27;
  uint64_t v32 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AB0);
  sub_24EFED3E0();
  return sub_24EFD7C18(a1);
}

uint64_t sub_24EFD1134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v7 = *(unsigned char *)(a1 + 96);
  uint64_t v8 = *(void *)(a1 + 104);
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  uint64_t v13 = a5;
  uint64_t v14 = a6;
  uint64_t v15 = a7;
  type metadata accessor for ForYouView(0, (uint64_t)&v10);
  LOBYTE(v10) = v7 & 1;
  uint64_t v11 = v8;
  char v16 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AC0);
  return sub_24EFED3E0();
}

uint64_t sub_24EFD11A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EFED190();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_24EFED1A0();
}

uint64_t sub_24EFD129C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[13] = v14;
  v8[14] = v15;
  v8[11] = a7;
  v8[12] = a8;
  v8[9] = a5;
  v8[10] = a6;
  v8[8] = a4;
  uint64_t v9 = sub_24EFED700();
  v8[15] = v9;
  v8[16] = *(void *)(v9 - 8);
  v8[17] = swift_task_alloc();
  sub_24EFED5E0();
  v8[18] = sub_24EFED5D0();
  uint64_t v11 = sub_24EFED5B0();
  v8[19] = v11;
  v8[20] = v10;
  return MEMORY[0x270FA2498](sub_24EFD13A4, v11, v10);
}

uint64_t sub_24EFD13A4()
{
  uint64_t v1 = sub_24EFED9B0();
  uint64_t v3 = v2;
  sub_24EFED6F0();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_269998AD8 + dword_269998AD8);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24EFD1484;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_24EFD1484()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 136);
  uint64_t v4 = *(void *)(*v1 + 128);
  uint64_t v5 = *(void *)(*v1 + 120);
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 160);
  uint64_t v7 = *(void *)(v2 + 152);
  if (v0) {
    uint64_t v8 = sub_24EFD1700;
  }
  else {
    uint64_t v8 = sub_24EFD161C;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_24EFD161C()
{
  long long v4 = *(_OWORD *)(v0 + 88);
  long long v5 = *(_OWORD *)(v0 + 72);
  long long v3 = *(_OWORD *)(v0 + 104);
  swift_release();
  *(_OWORD *)(v0 + 16) = v5;
  *(_OWORD *)(v0 + 32) = v4;
  *(_OWORD *)(v0 + 48) = v3;
  type metadata accessor for ForYouView(0, v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AC0);
  sub_24EFED3E0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EFD1700()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EFD176C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24EFED610();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24EFED600();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24EFACB28(a1, &qword_26B1E8898);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24EFED5B0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_24EFD18F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24EFED190();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_24EFED1A0();
}

uint64_t sub_24EFD19EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *((void *)&v169 + 1) = a6;
  uint64_t OpaqueTypeConformance2 = a7;
  *(void *)&long long v169 = a5;
  *(void *)&long long v166 = a3;
  *((void *)&v166 + 1) = a4;
  uint64_t v162 = a1;
  uint64_t v164 = a9;
  uint64_t v12 = sub_24EFED0B0();
  uint64_t v135 = *(void *)(v12 - 8);
  uint64_t v136 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  v131[1] = v14;
  uint64_t v132 = (char *)v131 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v133 = (char *)v131 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24EFED0E0();
  uint64_t v139 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v138 = (char *)v131 - v17;
  uint64_t v18 = sub_24EFED0E0();
  uint64_t v143 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v142 = (char *)v131 - v19;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87B8);
  uint64_t v20 = sub_24EFED0E0();
  uint64_t v146 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v145 = (char *)v131 - v21;
  uint64_t v22 = sub_24EFED0E0();
  uint64_t v152 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v151 = (char *)v131 - v23;
  uint64_t v24 = sub_24EFED0E0();
  uint64_t v156 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v155 = (char *)v131 - v25;
  uint64_t v193 = a8;
  uint64_t v194 = MEMORY[0x263F1A240];
  uint64_t v140 = v16;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v27 = MEMORY[0x263F18860];
  v131[0] = WitnessTable;
  uint64_t v191 = WitnessTable;
  uint64_t v192 = MEMORY[0x263F18860];
  uint64_t v144 = v18;
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v29 = sub_24EFAD150(&qword_26B1E87B0, &qword_26B1E87B8);
  v131[2] = v28;
  uint64_t v189 = v28;
  uint64_t v190 = v29;
  uint64_t v147 = v20;
  uint64_t v141 = swift_getWitnessTable();
  uint64_t v187 = v141;
  uint64_t v188 = MEMORY[0x263F189A8];
  uint64_t v154 = v22;
  uint64_t v148 = swift_getWitnessTable();
  uint64_t v185 = v148;
  uint64_t v186 = v27;
  uint64_t v30 = swift_getWitnessTable();
  unint64_t v31 = sub_24EFD41D0();
  uint64_t v163 = v24;
  *(void *)&long long v171 = v24;
  *((void *)&v171 + 1) = MEMORY[0x263F8EF38];
  unint64_t v167 = v31;
  uint64_t v168 = v30;
  *(void *)&long long v172 = v30;
  *((void *)&v172 + 1) = v31;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v153 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v150 = (char *)v131 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v149 = (char *)v131 - v35;
  uint64_t v157 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87A8);
  uint64_t v158 = OpaqueTypeMetadata2;
  uint64_t v36 = sub_24EFED1B0();
  uint64_t v160 = *(void *)(v36 - 8);
  uint64_t v161 = v36;
  MEMORY[0x270FA5388](v36);
  uint64_t v159 = (char *)v131 - v37;
  LOBYTE(OpaqueTypeMetadata2) = *(unsigned char *)(a2 + 96);
  uint64_t v38 = *(void *)(a2 + 104);
  uint64_t v39 = v166;
  long long v171 = v166;
  uint64_t v40 = *((void *)&v166 + 1);
  long long v172 = v169;
  *(void *)&long long v173 = OpaqueTypeConformance2;
  *((void *)&v173 + 1) = a8;
  uint64_t v165 = a8;
  uint64_t v134 = type metadata accessor for ForYouView(0, (uint64_t)&v171);
  LOBYTE(v171) = OpaqueTypeMetadata2 & 1;
  *((void *)&v171 + 1) = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AC0);
  uint64_t v41 = sub_24EFED3D0();
  if (v181 == 1)
  {
    long long v42 = v133;
    (*(void (**)(uint64_t))(a2 + 56))(v41);
    uint64_t v43 = v135;
    uint64_t v44 = v136;
    long long v45 = v132;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v132, v162, v136);
    unint64_t v46 = (*(unsigned __int8 *)(v43 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = v39;
    *(void *)(v47 + 24) = v40;
    uint64_t v48 = v169;
    *(void *)(v47 + 32) = v169;
    uint64_t v49 = v48;
    uint64_t v50 = OpaqueTypeConformance2;
    *(void *)(v47 + 40) = *((void *)&v169 + 1);
    *(void *)(v47 + 48) = v50;
    *(void *)(v47 + 56) = v165;
    long long v51 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(v47 + 128) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(v47 + 144) = v51;
    long long v52 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(v47 + 160) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(v47 + 176) = v52;
    long long v53 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v47 + 64) = *(_OWORD *)a2;
    *(_OWORD *)(v47 + 80) = v53;
    long long v54 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v47 + 96) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v47 + 112) = v54;
    (*(void (**)(unint64_t, char *, uint64_t))(v43 + 32))(v47 + v46, v45, v44);
    sub_24EFD6790(a2);
    long long v55 = v138;
    uint64_t v56 = v49;
    sub_24EFED320();
    swift_release();
    (*(void (**)(char *, uint64_t))(v137 + 8))(v42, v49);
    long long v57 = *(_OWORD *)(a2 + 80);
    long long v175 = *(_OWORD *)(a2 + 64);
    long long v176 = v57;
    long long v58 = *(_OWORD *)(a2 + 112);
    long long v177 = *(_OWORD *)(a2 + 96);
    long long v178 = v58;
    long long v59 = *(_OWORD *)(a2 + 16);
    long long v171 = *(_OWORD *)a2;
    long long v172 = v59;
    long long v60 = *(_OWORD *)(a2 + 48);
    long long v173 = *(_OWORD *)(a2 + 32);
    long long v174 = v60;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    sub_24EFED430();
    long long v61 = v142;
    uint64_t v62 = v140;
    sub_24EFED2F0();
    (*(void (**)(char *, uint64_t))(v139 + 8))(v55, v62);
    long long v171 = *(_OWORD *)(a2 + 112);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269998AB8);
    sub_24EFED3D0();
    long long v63 = *(_OWORD *)(a2 + 80);
    long long v175 = *(_OWORD *)(a2 + 64);
    long long v176 = v63;
    long long v64 = *(_OWORD *)(a2 + 112);
    long long v177 = *(_OWORD *)(a2 + 96);
    long long v178 = v64;
    long long v65 = *(_OWORD *)(a2 + 16);
    long long v171 = *(_OWORD *)a2;
    long long v172 = v65;
    long long v66 = *(_OWORD *)(a2 + 48);
    long long v173 = *(_OWORD *)(a2 + 32);
    long long v174 = v66;
    *(void *)&long long v171 = sub_24EFCD2F0();
    *((void *)&v171 + 1) = v67;
    sub_24EFD7BC4();
    uint64_t v68 = v144;
    long long v69 = v145;
    sub_24EFED340();
    swift_release();
    (*(void (**)(char *, uint64_t))(v143 + 8))(v61, v68);
    long long v70 = *(_OWORD *)(a2 + 80);
    long long v175 = *(_OWORD *)(a2 + 64);
    long long v176 = v70;
    long long v71 = *(_OWORD *)(a2 + 112);
    long long v177 = *(_OWORD *)(a2 + 96);
    long long v178 = v71;
    long long v72 = *(_OWORD *)(a2 + 16);
    long long v171 = *(_OWORD *)a2;
    long long v172 = v72;
    long long v73 = *(_OWORD *)(a2 + 48);
    long long v173 = *(_OWORD *)(a2 + 32);
    long long v174 = v73;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    long long v74 = *(_OWORD *)(a2 + 80);
    long long v175 = *(_OWORD *)(a2 + 64);
    long long v176 = v74;
    long long v75 = *(_OWORD *)(a2 + 112);
    long long v177 = *(_OWORD *)(a2 + 96);
    long long v178 = v75;
    long long v76 = *(_OWORD *)(a2 + 16);
    long long v171 = *(_OWORD *)a2;
    long long v172 = v76;
    long long v77 = *(_OWORD *)(a2 + 48);
    long long v173 = *(_OWORD *)(a2 + 32);
    long long v174 = v77;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    long long v78 = v151;
    uint64_t v79 = v147;
    sub_24EFED300();
    (*(void (**)(char *, uint64_t))(v146 + 8))(v69, v79);
    sub_24EFED0A0();
    long long v80 = *(_OWORD *)(a2 + 80);
    long long v175 = *(_OWORD *)(a2 + 64);
    long long v176 = v80;
    long long v81 = *(_OWORD *)(a2 + 112);
    long long v177 = *(_OWORD *)(a2 + 96);
    long long v178 = v81;
    long long v82 = *(_OWORD *)(a2 + 16);
    long long v171 = *(_OWORD *)a2;
    long long v172 = v82;
    long long v83 = *(_OWORD *)(a2 + 48);
    long long v173 = *(_OWORD *)(a2 + 32);
    long long v174 = v83;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    long long v84 = *(_OWORD *)(a2 + 80);
    long long v175 = *(_OWORD *)(a2 + 64);
    long long v176 = v84;
    long long v85 = *(_OWORD *)(a2 + 112);
    long long v177 = *(_OWORD *)(a2 + 96);
    long long v178 = v85;
    long long v86 = *(_OWORD *)(a2 + 16);
    long long v171 = *(_OWORD *)a2;
    long long v172 = v86;
    long long v87 = *(_OWORD *)(a2 + 48);
    long long v173 = *(_OWORD *)(a2 + 32);
    long long v174 = v87;
    sub_24EFCD260();
    swift_getKeyPath();
    sub_24EFED4D0();
    swift_release();
    swift_release();
    long long v88 = *(_OWORD *)(a2 + 80);
    long long v175 = *(_OWORD *)(a2 + 64);
    long long v176 = v88;
    long long v89 = *(_OWORD *)(a2 + 112);
    long long v177 = *(_OWORD *)(a2 + 96);
    long long v178 = v89;
    long long v90 = *(_OWORD *)(a2 + 16);
    long long v171 = *(_OWORD *)a2;
    long long v172 = v90;
    long long v91 = *(_OWORD *)(a2 + 48);
    long long v173 = *(_OWORD *)(a2 + 32);
    long long v174 = v91;
    sub_24EFCD2F0();
    long long v92 = v155;
    uint64_t v93 = v154;
    sub_24EFED2F0();
    (*(void (**)(char *, uint64_t))(v152 + 8))(v78, v93);
    sub_24EFED0A0();
    *(void *)&long long v171 = v94;
    uint64_t v95 = swift_allocObject();
    uint64_t v96 = *((void *)&v166 + 1);
    *(void *)(v95 + 16) = v166;
    *(void *)(v95 + 24) = v96;
    uint64_t v97 = *((void *)&v169 + 1);
    *(void *)(v95 + 32) = v56;
    *(void *)(v95 + 40) = v97;
    uint64_t v98 = v165;
    *(void *)(v95 + 48) = OpaqueTypeConformance2;
    *(void *)(v95 + 56) = v98;
    long long v99 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(v95 + 128) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(v95 + 144) = v99;
    long long v100 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(v95 + 160) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(v95 + 176) = v100;
    long long v101 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v95 + 64) = *(_OWORD *)a2;
    *(_OWORD *)(v95 + 80) = v101;
    long long v102 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v95 + 96) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v95 + 112) = v102;
    sub_24EFD6790(a2);
    uint64_t v103 = (uint64_t)v150;
    uint64_t v104 = v163;
    uint64_t v105 = MEMORY[0x263F8EF38];
    uint64_t v106 = v168;
    unint64_t v107 = v167;
    sub_24EFED330();
    swift_release();
    (*(void (**)(char *, uint64_t))(v156 + 8))(v92, v104);
    *(void *)&long long v171 = v104;
    *((void *)&v171 + 1) = v105;
    *(void *)&long long v172 = v106;
    *((void *)&v172 + 1) = v107;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v108 = v153;
    long long v109 = *(void (**)(char *, uint64_t, uint64_t))(v153 + 16);
    long long v110 = v149;
    uint64_t v111 = v158;
    v109(v149, v103, v158);
    uint64_t v112 = *(void (**)(uint64_t, uint64_t))(v108 + 8);
    v112(v103, v111);
    v109((char *)v103, (uint64_t)v110, v111);
    sub_24EFD4224();
    uint64_t v113 = v159;
    sub_24EFD11A4(v103, v111);
    uint64_t v114 = v103;
    unint64_t v115 = v167;
    v112(v114, v111);
    v112((uint64_t)v110, v111);
    uint64_t v116 = v168;
    uint64_t v117 = MEMORY[0x263F8EF38];
  }
  else
  {
    uint64_t v118 = sub_24EFED360();
    uint64_t v119 = swift_allocObject();
    *(void *)(v119 + 16) = v39;
    *(void *)(v119 + 24) = v40;
    uint64_t v120 = *((void *)&v169 + 1);
    *(void *)(v119 + 32) = v169;
    *(void *)(v119 + 40) = v120;
    uint64_t v121 = v165;
    *(void *)(v119 + 48) = OpaqueTypeConformance2;
    *(void *)(v119 + 56) = v121;
    long long v122 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(v119 + 128) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(v119 + 144) = v122;
    long long v123 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(v119 + 160) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(v119 + 176) = v123;
    long long v124 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v119 + 64) = *(_OWORD *)a2;
    *(_OWORD *)(v119 + 80) = v124;
    long long v125 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v119 + 96) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v119 + 112) = v125;
    *(void *)&long long v171 = v118;
    *((void *)&v171 + 1) = sub_24EFD83B8;
    long long v172 = (unint64_t)v119;
    *(void *)&long long v173 = 0;
    sub_24EFD6790(a2);
    uint64_t v104 = v163;
    uint64_t v181 = v163;
    uint64_t v117 = MEMORY[0x263F8EF38];
    unint64_t v115 = v167;
    uint64_t v116 = v168;
    uint64_t v182 = MEMORY[0x263F8EF38];
    uint64_t v183 = v168;
    unint64_t v184 = v167;
    swift_getOpaqueTypeConformance2();
    sub_24EFD4224();
    uint64_t v113 = v159;
    sub_24EFD18F4((uint64_t)&v171, v158, v157);
    swift_release();
    swift_release();
  }
  *(void *)&long long v171 = v104;
  *((void *)&v171 + 1) = v117;
  *(void *)&long long v172 = v116;
  *((void *)&v172 + 1) = v115;
  uint64_t v126 = swift_getOpaqueTypeConformance2();
  unint64_t v127 = sub_24EFD4224();
  uint64_t v179 = v126;
  unint64_t v180 = v127;
  uint64_t v128 = v161;
  swift_getWitnessTable();
  uint64_t v129 = v160;
  (*(void (**)(uint64_t, char *, uint64_t))(v160 + 16))(v164, v113, v128);
  return (*(uint64_t (**)(char *, uint64_t))(v129 + 8))(v113, v128);
}

uint64_t sub_24EFD28BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v15 = *(_OWORD *)(a1 + 80);
  long long v41 = *(_OWORD *)(a1 + 64);
  long long v42 = v15;
  long long v43 = *(_OWORD *)(a1 + 96);
  long long v16 = *(_OWORD *)(a1 + 16);
  long long v37 = *(_OWORD *)a1;
  long long v38 = v16;
  long long v17 = *(_OWORD *)(a1 + 48);
  long long v39 = *(_OWORD *)(a1 + 32);
  long long v40 = v17;
  uint64_t v18 = *(void *)(a1 + 112);
  uint64_t v19 = *(void *)(a1 + 120);
  sub_24EFD6790(a1);
  sub_24EFED0A0();
  long long v20 = *(_OWORD *)(a1 + 80);
  long long v48 = *(_OWORD *)(a1 + 64);
  long long v49 = v20;
  long long v21 = *(_OWORD *)(a1 + 112);
  long long v50 = *(_OWORD *)(a1 + 96);
  long long v51 = v21;
  long long v22 = *(_OWORD *)(a1 + 16);
  long long v44 = *(_OWORD *)a1;
  long long v45 = v22;
  long long v23 = *(_OWORD *)(a1 + 48);
  long long v46 = *(_OWORD *)(a1 + 32);
  long long v47 = v23;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v33 = a5;
  uint64_t v34 = a6;
  uint64_t v35 = a7;
  uint64_t v36 = a8;
  type metadata accessor for ForYouView(0, (uint64_t)&v31);
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  sub_24EFED470();
  uint64_t v24 = sub_24EFED460();
  swift_release();
  *(void *)&long long v44 = v18;
  *((void *)&v44 + 1) = v19;
  uint64_t v31 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AB8);
  sub_24EFED3E0();
  long long v48 = v41;
  long long v49 = v42;
  long long v50 = v43;
  long long v44 = v37;
  long long v45 = v38;
  long long v46 = v39;
  long long v47 = v40;
  *(void *)&long long v51 = v18;
  *((void *)&v51 + 1) = v19;
  sub_24EFD7C18((uint64_t)&v44);
  uint64_t v25 = *(void *)(a1 + 104);
  LOBYTE(v37) = *(unsigned char *)(a1 + 96) & 1;
  *((void *)&v37 + 1) = v25;
  LOBYTE(v31) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AC0);
  sub_24EFED3E0();
  long long v30 = *(_OWORD *)(a1 + 72);
  uint64_t v26 = *(void *)(a1 + 88);
  sub_24EFD6790(a1);
  uint64_t v27 = sub_24EFED450();
  long long v37 = v30;
  *(void *)&long long v38 = v26;
  uint64_t v31 = v27;
  uint64_t v32 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AB0);
  sub_24EFED3E0();
  return sub_24EFD7C18(a1);
}

uint64_t sub_24EFD2AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v9 = *(unsigned char *)(a3 + 96);
  uint64_t v10 = *(void *)(a3 + 104);
  uint64_t v12 = a4;
  uint64_t v13 = a5;
  uint64_t v14 = a6;
  uint64_t v15 = a7;
  uint64_t v16 = a8;
  uint64_t v17 = a9;
  type metadata accessor for ForYouView(0, (uint64_t)&v12);
  LOBYTE(v12) = v9 & 1;
  uint64_t v13 = v10;
  char v18 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AC0);
  return sub_24EFED3E0();
}

uint64_t sub_24EFD2B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v34 = a8;
  uint64_t v35 = a9;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8898);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v33 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v32 = *(_OWORD *)(a1 + 72);
  uint64_t v18 = *(void *)(a1 + 88);
  sub_24EFD6790(a1);
  uint64_t v19 = sub_24EFED440();
  uint64_t v21 = v20;
  *(void *)&long long v36 = a2;
  *((void *)&v36 + 1) = a3;
  uint64_t v37 = a4;
  uint64_t v38 = a5;
  uint64_t v39 = a6;
  uint64_t v40 = a7;
  type metadata accessor for ForYouView(0, (uint64_t)&v36);
  long long v36 = v32;
  uint64_t v37 = v18;
  uint64_t v41 = v19;
  uint64_t v42 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998AB0);
  sub_24EFED3E0();
  sub_24EFD7C18(a1);
  uint64_t v22 = sub_24EFED610();
  uint64_t v23 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v33, 1, 1, v22);
  sub_24EFED5E0();
  sub_24EFD6790(a1);
  uint64_t v24 = sub_24EFED5D0();
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = MEMORY[0x263F8F500];
  *(void *)(v25 + 16) = v24;
  *(void *)(v25 + 24) = v26;
  *(void *)(v25 + 32) = a2;
  *(void *)(v25 + 40) = a3;
  *(void *)(v25 + 48) = a4;
  *(void *)(v25 + 56) = a5;
  *(void *)(v25 + 64) = a6;
  *(void *)(v25 + 72) = a7;
  long long v27 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v25 + 144) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v25 + 160) = v27;
  long long v28 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v25 + 176) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v25 + 192) = v28;
  long long v29 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v25 + 80) = *(_OWORD *)a1;
  *(_OWORD *)(v25 + 96) = v29;
  long long v30 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v25 + 112) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v25 + 128) = v30;
  sub_24EFD176C(v23, v35, v25);
  return swift_release();
}

uint64_t sub_24EFD2D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[13] = v14;
  v8[14] = v15;
  v8[11] = a7;
  v8[12] = a8;
  v8[9] = a5;
  v8[10] = a6;
  v8[8] = a4;
  uint64_t v9 = sub_24EFED700();
  v8[15] = v9;
  v8[16] = *(void *)(v9 - 8);
  v8[17] = swift_task_alloc();
  sub_24EFED5E0();
  v8[18] = sub_24EFED5D0();
  uint64_t v11 = sub_24EFED5B0();
  v8[19] = v11;
  v8[20] = v10;
  return MEMORY[0x270FA2498](sub_24EFD2E28, v11, v10);
}

uint64_t sub_24EFD2E28()
{
  uint64_t v1 = sub_24EFED9B0();
  uint64_t v3 = v2;
  sub_24EFED6F0();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_269998AD8 + dword_269998AD8);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v4;
  *long long v4 = v0;
  v4[1] = sub_24EFD2F08;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_24EFD2F08()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 136);
  uint64_t v4 = *(void *)(*v1 + 128);
  uint64_t v5 = *(void *)(*v1 + 120);
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 160);
  uint64_t v7 = *(void *)(v2 + 152);
  if (v0) {
    uint64_t v8 = sub_24EFD87A8;
  }
  else {
    uint64_t v8 = sub_24EFD87AC;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_24EFD30A0@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  long long v19 = a1[5];
  long long v37 = a1[4];
  long long v38 = v19;
  long long v20 = a1[7];
  long long v39 = a1[6];
  long long v40 = v20;
  long long v21 = a1[1];
  long long v33 = *a1;
  long long v34 = v21;
  long long v22 = a1[3];
  long long v35 = a1[2];
  long long v36 = v22;
  v32[0] = a2;
  v32[1] = a3;
  v32[2] = a4;
  v32[3] = a5;
  v32[4] = a6;
  v32[5] = a7;
  type metadata accessor for ForYouView(0, (uint64_t)v32);
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  if (v33 == 1)
  {
    v31[3] = a11;
    v31[2] = a10;
    uint64_t v23 = swift_allocObject();
    v31[1] = v31;
    *(void *)(v23 + 16) = a2;
    *(void *)(v23 + 24) = a3;
    *(void *)(v23 + 32) = a4;
    *(void *)(v23 + 40) = a5;
    *(void *)(v23 + 48) = a6;
    *(void *)(v23 + 56) = a7;
    long long v24 = a1[5];
    *(_OWORD *)(v23 + 128) = a1[4];
    *(_OWORD *)(v23 + 144) = v24;
    long long v25 = a1[7];
    *(_OWORD *)(v23 + 160) = a1[6];
    *(_OWORD *)(v23 + 176) = v25;
    long long v26 = a1[1];
    *(_OWORD *)(v23 + 64) = *a1;
    *(_OWORD *)(v23 + 80) = v26;
    long long v27 = a1[3];
    *(_OWORD *)(v23 + 96) = a1[2];
    *(_OWORD *)(v23 + 112) = v27;
    MEMORY[0x270FA5388](v23);
    sub_24EFD6790((uint64_t)a1);
    sub_24EFED3F0();
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8818);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a8, 0, 1, v28);
  }
  else
  {
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8818);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(a8, 1, 1, v30);
  }
}

uint64_t sub_24EFD32DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24EFED3A0();
  *a1 = result;
  return result;
}

uint64_t sub_24EFD3314@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24EFED3A0();
  *a1 = result;
  return result;
}

uint64_t sub_24EFD3354@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v13 = sub_24EFECFD0();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = sub_24EFED520();
  MEMORY[0x270FA5388](v14 - 8);
  sub_24EFED510();
  if (qword_26B1E88A0 != -1) {
    swift_once();
  }
  long long v15 = a1[4];
  long long v16 = a1[6];
  long long v17 = a1[7];
  long long v35 = a1[5];
  long long v36 = v16;
  long long v37 = v17;
  long long v18 = a1[1];
  long long v30 = *a1;
  long long v31 = v18;
  long long v19 = a1[3];
  long long v32 = a1[2];
  long long v33 = v19;
  long long v34 = v15;
  id v20 = (id)qword_26B1EB9A8;
  v29[0] = a2;
  v29[1] = a3;
  v29[2] = a4;
  v29[3] = a5;
  v29[4] = a6;
  v29[5] = a7;
  type metadata accessor for ForYouView(0, (uint64_t)v29);
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  *(void *)&long long v30 = sub_24EFED550();
  *((void *)&v30 + 1) = v21;
  sub_24EFAD1EC();
  uint64_t result = sub_24EFED270();
  *(void *)a8 = result;
  *(void *)(a8 + 8) = v23;
  *(unsigned char *)(a8 + 16) = v24 & 1;
  *(void *)(a8 + 24) = v25;
  return result;
}

uint64_t sub_24EFD358C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24EFED3A0();
  *a1 = result;
  return result;
}

uint64_t ForYouView.body.getter@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v106 = a2;
  uint64_t v3 = sub_24EFED150();
  uint64_t v104 = *(void *)(v3 - 8);
  uint64_t v105 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v103 = (char *)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = a1[3];
  uint64_t v101 = sub_24EFED1B0();
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87E8);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87D8);
  uint64_t v108 = sub_24EFECFF0();
  uint64_t v113 = a1[4];
  long long v110 = a1;
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87B8);
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87A8);
  sub_24EFED1B0();
  sub_24EFED390();
  uint64_t v107 = sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  uint64_t v5 = sub_24EFED0E0();
  uint64_t v112 = a1[7];
  uint64_t v156 = v112;
  uint64_t v157 = MEMORY[0x263F1A240];
  uint64_t v6 = MEMORY[0x263F18E48];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v8 = MEMORY[0x263F18860];
  uint64_t v154 = WitnessTable;
  uint64_t v155 = MEMORY[0x263F18860];
  uint64_t v98 = v6;
  uint64_t v9 = swift_getWitnessTable();
  uint64_t v10 = sub_24EFAD150(&qword_26B1E87B0, &qword_26B1E87B8);
  uint64_t v152 = v9;
  uint64_t v153 = v10;
  uint64_t v150 = swift_getWitnessTable();
  uint64_t v151 = MEMORY[0x263F189A8];
  uint64_t v148 = swift_getWitnessTable();
  uint64_t v149 = v8;
  uint64_t v11 = swift_getWitnessTable();
  unint64_t v12 = sub_24EFD41D0();
  uint64_t v13 = MEMORY[0x263F8EF38];
  *(void *)&long long v158 = v5;
  *((void *)&v158 + 1) = MEMORY[0x263F8EF38];
  *(void *)&long long v159 = v11;
  *((void *)&v159 + 1) = v12;
  uint64_t v100 = MEMORY[0x263F1B260];
  swift_getOpaqueTypeMetadata2();
  sub_24EFED1B0();
  *(void *)&long long v158 = v5;
  *((void *)&v158 + 1) = v13;
  *(void *)&long long v159 = v11;
  *((void *)&v159 + 1) = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v15 = sub_24EFD4224();
  uint64_t v146 = OpaqueTypeConformance2;
  unint64_t v147 = v15;
  swift_getWitnessTable();
  sub_24EFED0D0();
  sub_24EFED0E0();
  sub_24EFED1B0();
  uint64_t v16 = MEMORY[0x263F1A830];
  swift_getTupleTypeMetadata2();
  uint64_t v17 = sub_24EFED480();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E8820);
  uint64_t v19 = swift_getWitnessTable();
  unint64_t v20 = sub_24EFD4298();
  *(void *)&long long v158 = v17;
  *((void *)&v158 + 1) = v16;
  *(void *)&long long v159 = v18;
  *((void *)&v159 + 1) = v19;
  *(void *)&long long v160 = MEMORY[0x263F1A820];
  *((void *)&v160 + 1) = v20;
  sub_24EFED1E0();
  sub_24EFED1B0();
  sub_24EFED1B0();
  uint64_t v21 = v110;
  uint64_t v109 = v110[2];
  unint64_t v94 = sub_24EFED1B0();
  uint64_t v95 = sub_24EFED1B0();
  uint64_t v108 = sub_24EFED1B0();
  uint64_t v111 = sub_24EFED390();
  uint64_t v97 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388](v111);
  uint64_t v93 = (char *)&v85 - v22;
  uint64_t v107 = sub_24EFED0E0();
  uint64_t v99 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388](v107);
  uint64_t v96 = (char *)&v85 - v23;
  uint64_t v90 = v21[6];
  uint64_t v144 = MEMORY[0x263F1B428];
  uint64_t v145 = v90;
  uint64_t v24 = swift_getWitnessTable();
  unint64_t v25 = sub_24EFD4330();
  unint64_t v26 = sub_24EFD43DC();
  uint64_t v27 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v142 = v27;
  uint64_t v143 = v28;
  uint64_t v29 = swift_getWitnessTable();
  unint64_t v140 = v26;
  uint64_t v141 = v29;
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v31 = v21[5];
  uint64_t v138 = v30;
  uint64_t v139 = v31;
  uint64_t v32 = v31;
  uint64_t v33 = swift_getWitnessTable();
  unint64_t v136 = v25;
  uint64_t v137 = v33;
  uint64_t v34 = swift_getWitnessTable();
  uint64_t v134 = v24;
  uint64_t v135 = v34;
  uint64_t v85 = swift_getWitnessTable();
  uint64_t v133 = v85;
  uint64_t v89 = swift_getWitnessTable();
  uint64_t v131 = v89;
  uint64_t v132 = MEMORY[0x263F1A240];
  uint64_t v35 = v107;
  uint64_t v36 = swift_getWitnessTable();
  *(void *)&long long v158 = v35;
  *((void *)&v158 + 1) = v36;
  uint64_t v37 = v35;
  uint64_t v38 = v36;
  uint64_t v88 = v36;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v98 = OpaqueTypeMetadata2;
  uint64_t v101 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  long long v87 = (char *)&v85 - v40;
  *(void *)&long long v158 = v37;
  *((void *)&v158 + 1) = v38;
  uint64_t v41 = swift_getOpaqueTypeConformance2();
  uint64_t v95 = v41;
  unint64_t v94 = sub_24EFCCBE8();
  *(void *)&long long v158 = OpaqueTypeMetadata2;
  *((void *)&v158 + 1) = &type metadata for SubscriptionState;
  *(void *)&long long v159 = v41;
  *((void *)&v159 + 1) = v94;
  uint64_t v100 = swift_getOpaqueTypeMetadata2();
  uint64_t v42 = *(void *)(v100 - 8);
  uint64_t v43 = MEMORY[0x270FA5388](v100);
  long long v91 = (char *)&v85 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v43);
  long long v92 = (char *)&v85 - v45;
  long long v46 = v102[5];
  long long v162 = v102[4];
  long long v163 = v46;
  long long v47 = v102[7];
  long long v164 = v102[6];
  long long v165 = v47;
  long long v48 = v102[1];
  long long v158 = *v102;
  long long v159 = v48;
  long long v49 = v102[3];
  long long v160 = v102[2];
  long long v161 = v49;
  uint64_t v50 = v109;
  uint64_t v52 = v113;
  uint64_t v51 = v114;
  uint64_t v115 = v109;
  uint64_t v116 = v114;
  uint64_t v117 = v113;
  uint64_t v118 = v32;
  uint64_t v53 = v32;
  uint64_t v86 = v32;
  uint64_t v54 = v90;
  uint64_t v55 = v112;
  uint64_t v119 = v90;
  uint64_t v120 = v112;
  uint64_t v121 = &v158;
  uint64_t v56 = v93;
  sub_24EFED380();
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = v50;
  *(void *)(v57 + 24) = v51;
  *(void *)(v57 + 32) = v52;
  *(void *)(v57 + 40) = v53;
  *(void *)(v57 + 48) = v54;
  *(void *)(v57 + 56) = v55;
  uint64_t v58 = v54;
  long long v59 = v163;
  *(_OWORD *)(v57 + 128) = v162;
  *(_OWORD *)(v57 + 144) = v59;
  long long v60 = v165;
  *(_OWORD *)(v57 + 160) = v164;
  *(_OWORD *)(v57 + 176) = v60;
  long long v61 = v159;
  *(_OWORD *)(v57 + 64) = v158;
  *(_OWORD *)(v57 + 80) = v61;
  long long v62 = v161;
  *(_OWORD *)(v57 + 96) = v160;
  *(_OWORD *)(v57 + 112) = v62;
  sub_24EFD6790((uint64_t)&v158);
  long long v63 = v96;
  uint64_t v64 = v111;
  sub_24EFED320();
  swift_release();
  (*(void (**)(char *, uint64_t))(v97 + 8))(v56, v64);
  long long v65 = v103;
  uint64_t v66 = v104;
  uint64_t v67 = v105;
  (*(void (**)(char *, void, uint64_t))(v104 + 104))(v103, *MEMORY[0x263F19698], v105);
  uint64_t v68 = v87;
  uint64_t v69 = v107;
  sub_24EFCB300();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v65, v67);
  (*(void (**)(char *, uint64_t))(v99 + 8))(v63, v69);
  long long v127 = v162;
  long long v128 = v163;
  long long v129 = v164;
  long long v130 = v165;
  long long v123 = v158;
  long long v124 = v159;
  long long v125 = v160;
  long long v126 = v161;
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  swift_release();
  char v122 = v123;
  uint64_t v70 = swift_allocObject();
  uint64_t v71 = v114;
  *(void *)(v70 + 16) = v109;
  *(void *)(v70 + 24) = v71;
  uint64_t v72 = v86;
  *(void *)(v70 + 32) = v113;
  *(void *)(v70 + 40) = v72;
  uint64_t v73 = v112;
  *(void *)(v70 + 48) = v58;
  *(void *)(v70 + 56) = v73;
  long long v74 = v163;
  *(_OWORD *)(v70 + 128) = v162;
  *(_OWORD *)(v70 + 144) = v74;
  long long v75 = v165;
  *(_OWORD *)(v70 + 160) = v164;
  *(_OWORD *)(v70 + 176) = v75;
  long long v76 = v159;
  *(_OWORD *)(v70 + 64) = v158;
  *(_OWORD *)(v70 + 80) = v76;
  long long v77 = v161;
  *(_OWORD *)(v70 + 96) = v160;
  *(_OWORD *)(v70 + 112) = v77;
  sub_24EFD6790((uint64_t)&v158);
  long long v78 = v91;
  uint64_t v79 = v98;
  sub_24EFED330();
  swift_release();
  (*(void (**)(char *, uint64_t))(v101 + 8))(v68, v79);
  long long v80 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  long long v81 = v92;
  uint64_t v82 = v100;
  v80(v92, v78, v100);
  long long v83 = *(void (**)(char *, uint64_t))(v42 + 8);
  v83(v78, v82);
  v80(v106, v81, v82);
  return ((uint64_t (*)(char *, uint64_t))v83)(v81, v82);
}

unint64_t sub_24EFD41D0()
{
  unint64_t result = qword_26B1E8458;
  if (!qword_26B1E8458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8458);
  }
  return result;
}

unint64_t sub_24EFD4224()
{
  unint64_t result = qword_26B1E87A0;
  if (!qword_26B1E87A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E87A0);
  }
  return result;
}

unint64_t sub_24EFD4298()
{
  unint64_t result = qword_26B1E8828;
  if (!qword_26B1E8828)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E8820);
    sub_24EFAD150(&qword_26B1E8810, &qword_26B1E8818);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8828);
  }
  return result;
}

unint64_t sub_24EFD4330()
{
  unint64_t result = qword_26B1E87E0;
  if (!qword_26B1E87E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87E8);
    sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E87E0);
  }
  return result;
}

unint64_t sub_24EFD43DC()
{
  unint64_t result = qword_26B1E87D0;
  if (!qword_26B1E87D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87D8);
    sub_24EFAD150(&qword_26B1E8800, &qword_26B1E8808);
    sub_24EFAD150(&qword_26B1E87F0, &qword_26B1E87F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E87D0);
  }
  return result;
}

uint64_t sub_24EFD449C@<X0>(void (**a1)(uint64_t)@<X0>, void (*a2)(void, void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v272 = a7;
  uint64_t v273 = a3;
  uint64_t v287 = a6;
  uint64_t v289 = a5;
  uint64_t v274 = a4;
  v283 = a2;
  uint64_t v280 = a8;
  uint64_t v262 = *((void *)a2 - 1);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  v260 = (char *)&v235 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v264 = (char *)&v235 - v12;
  uint64_t v281 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87D8);
  v282 = (void *)sub_24EFECFF0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87B8);
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E87A8);
  sub_24EFED1B0();
  sub_24EFED390();
  uint64_t v288 = sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  sub_24EFED0E0();
  uint64_t v13 = sub_24EFED0E0();
  uint64_t v388 = a7;
  uint64_t v389 = MEMORY[0x263F1A240];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v15 = MEMORY[0x263F18860];
  uint64_t v386 = WitnessTable;
  uint64_t v387 = MEMORY[0x263F18860];
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v17 = sub_24EFAD150(&qword_26B1E87B0, &qword_26B1E87B8);
  uint64_t v384 = v16;
  uint64_t v385 = v17;
  uint64_t v382 = swift_getWitnessTable();
  uint64_t v383 = MEMORY[0x263F189A8];
  uint64_t v380 = swift_getWitnessTable();
  uint64_t v381 = v15;
  uint64_t v18 = swift_getWitnessTable();
  unint64_t v19 = sub_24EFD41D0();
  uint64_t v20 = MEMORY[0x263F8EF38];
  *(void *)&long long v370 = v13;
  *((void *)&v370 + 1) = MEMORY[0x263F8EF38];
  *(void *)&long long v371 = v18;
  *((void *)&v371 + 1) = v19;
  swift_getOpaqueTypeMetadata2();
  sub_24EFED1B0();
  *(void *)&long long v370 = v13;
  *((void *)&v370 + 1) = v20;
  *(void *)&long long v371 = v18;
  *((void *)&v371 + 1) = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v22 = sub_24EFD4224();
  uint64_t v378 = OpaqueTypeConformance2;
  unint64_t v379 = v22;
  swift_getWitnessTable();
  sub_24EFED0D0();
  sub_24EFED0E0();
  sub_24EFED1B0();
  uint64_t v23 = MEMORY[0x263F1A830];
  swift_getTupleTypeMetadata2();
  uint64_t v24 = sub_24EFED480();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E8820);
  uint64_t v26 = swift_getWitnessTable();
  unint64_t v27 = sub_24EFD4298();
  *(void *)&long long v370 = v24;
  *((void *)&v370 + 1) = v23;
  *(void *)&long long v371 = v25;
  *((void *)&v371 + 1) = v26;
  *(void *)&long long v372 = MEMORY[0x263F1A820];
  *((void *)&v372 + 1) = v27;
  uint64_t v28 = sub_24EFED1E0();
  uint64_t v29 = v282;
  uint64_t v30 = sub_24EFED1B0();
  uint64_t v31 = sub_24EFED1B0();
  uint64_t v32 = v283;
  uint64_t v33 = sub_24EFED1B0();
  uint64_t v266 = *(void *)(v33 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v33);
  v265 = (char *)&v235 - v35;
  uint64_t v288 = v28;
  uint64_t v240 = *(void *)(v28 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v238 = (char *)&v235 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v239 = (char *)&v235 - v39;
  uint64_t v285 = v30;
  uint64_t v244 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v38);
  v243 = (char *)&v235 - v40;
  uint64_t v250 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E87F8);
  uint64_t v242 = *(void *)(v250 - 8);
  MEMORY[0x270FA5388](v250);
  v241 = (char *)&v235 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v246 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E87C0);
  uint64_t v42 = MEMORY[0x270FA5388](v246);
  v249 = (char *)&v235 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v42);
  v251 = (char *)&v235 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v258 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8808);
  uint64_t v248 = *(void *)(v258 - 8);
  uint64_t v45 = MEMORY[0x270FA5388](v258);
  v247 = (char *)&v235 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v284 = v31;
  uint64_t v263 = *(void *)(v31 - 8);
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v261 = (char *)&v235 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = MEMORY[0x270FA5388](v47);
  v259 = (char *)&v235 - v50;
  uint64_t v254 = *(v29 - 1);
  uint64_t v51 = MEMORY[0x270FA5388](v49);
  v237 = (char *)&v235 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v51);
  v245 = (char *)&v235 - v53;
  uint64_t v54 = sub_24EFECFD0();
  MEMORY[0x270FA5388](v54 - 8);
  v253 = (char *)&v235 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_24EFED520();
  MEMORY[0x270FA5388](v56 - 8);
  v252 = (char *)&v235 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v256 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E87C8);
  MEMORY[0x270FA5388](v256);
  v255 = (uint64_t *)((char *)&v235 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E87E8);
  MEMORY[0x270FA5388](v59);
  v257 = (char *)&v235 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v286 = v33;
  uint64_t v61 = sub_24EFED1B0();
  uint64_t v268 = *(void *)(v61 - 8);
  uint64_t v62 = MEMORY[0x270FA5388](v61);
  v267 = (char *)&v235 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v270 = (char *)&v235 - v65;
  uint64_t v271 = *(void *)(v273 - 8);
  uint64_t v66 = MEMORY[0x270FA5388](v64);
  uint64_t v68 = (char *)&v235 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v66);
  uint64_t v70 = (char *)&v235 - v69;
  uint64_t v72 = v71;
  uint64_t v73 = sub_24EFED1B0();
  uint64_t v269 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  long long v75 = (char *)&v235 - v74;
  uint64_t v275 = v76;
  uint64_t v279 = v61;
  uint64_t v77 = sub_24EFED1B0();
  uint64_t v277 = *(void *)(v77 - 8);
  uint64_t v278 = v77;
  MEMORY[0x270FA5388](v77);
  v276 = (char *)&v235 - v78;
  long long v79 = *((_OWORD *)a1 + 5);
  long long v374 = *((_OWORD *)a1 + 4);
  long long v375 = v79;
  long long v80 = *((_OWORD *)a1 + 7);
  long long v376 = *((_OWORD *)a1 + 6);
  long long v377 = v80;
  long long v81 = *((_OWORD *)a1 + 1);
  long long v370 = *(_OWORD *)a1;
  long long v371 = v81;
  long long v82 = *((_OWORD *)a1 + 3);
  long long v372 = *((_OWORD *)a1 + 2);
  long long v373 = v82;
  *(void *)&long long v365 = v32;
  uint64_t v83 = v72;
  *((void *)&v365 + 1) = v72;
  uint64_t v366 = v274;
  uint64_t v367 = v289;
  uint64_t v368 = v287;
  uint64_t v369 = v272;
  long long v84 = (void *)type metadata accessor for ForYouView(0, (uint64_t)&v365);
  sub_24EFCD260();
  swift_getKeyPath();
  sub_24EFED4D0();
  swift_release();
  uint64_t v85 = swift_release();
  uint64_t v86 = MEMORY[0x263F1B428];
  if (v364)
  {
    if (v364 == 1)
    {
      uint64_t v274 = v59;
      long long v87 = *((_OWORD *)a1 + 5);
      long long v374 = *((_OWORD *)a1 + 4);
      long long v375 = v87;
      long long v88 = *((_OWORD *)a1 + 7);
      long long v376 = *((_OWORD *)a1 + 6);
      long long v377 = v88;
      long long v89 = *((_OWORD *)a1 + 1);
      long long v370 = *(_OWORD *)a1;
      long long v371 = v89;
      long long v90 = *((_OWORD *)a1 + 3);
      long long v372 = *((_OWORD *)a1 + 2);
      long long v373 = v90;
      sub_24EFCD260();
      swift_getKeyPath();
      sub_24EFED4D0();
      swift_release();
      swift_release();
      long long v91 = v365;
      char v92 = v366;
      if ((_BYTE)v367)
      {
        uint64_t v93 = v286;
        if (v367 == 1)
        {
          uint64_t v94 = v284;
          swift_bridgeObjectRelease();
          uint64_t v95 = swift_bridgeObjectRelease();
          uint64_t v96 = (uint64_t)v260;
          a1[3](v95);
          uint64_t v97 = v262;
          uint64_t v98 = *(void (**)(char *, uint64_t, void (*)(void, void)))(v262 + 16);
          uint64_t v99 = v264;
          uint64_t v100 = (uint64_t)v283;
          v98(v264, v96, v283);
          v282 = *(void **)(v97 + 8);
          ((void (*)(uint64_t, uint64_t))v282)(v96, v100);
          v98((char *)v96, (uint64_t)v99, (void (*)(void, void))v100);
          unint64_t v101 = sub_24EFD43DC();
          uint64_t v102 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
          uint64_t v103 = swift_getWitnessTable();
          uint64_t v362 = v102;
          uint64_t v363 = v103;
          uint64_t v104 = swift_getWitnessTable();
          unint64_t v360 = v101;
          uint64_t v361 = v104;
          uint64_t v105 = swift_getWitnessTable();
          uint64_t v106 = (uint64_t)v265;
          uint64_t v107 = v94;
          uint64_t v108 = v289;
          sub_24EFD18F4(v96, v107, v100);
          uint64_t v109 = (void (*)(char *, uint64_t))v282;
          ((void (*)(uint64_t, uint64_t))v282)(v96, v100);
          sub_24EFD4330();
          uint64_t v358 = v105;
          uint64_t v359 = v108;
          swift_getWitnessTable();
          sub_24EFD18F4(v106, v274, v93);
          (*(void (**)(uint64_t, uint64_t))(v266 + 8))(v106, v93);
          uint64_t v110 = v100;
          uint64_t v111 = v108;
          v109(v264, v110);
LABEL_16:
          uint64_t v113 = v287;
          uint64_t v168 = v279;
          char v122 = v276;
LABEL_25:
          unint64_t v213 = sub_24EFD4330();
          unint64_t v214 = sub_24EFD43DC();
          uint64_t v215 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
          uint64_t v216 = swift_getWitnessTable();
          uint64_t v356 = v215;
          uint64_t v357 = v216;
          uint64_t v217 = swift_getWitnessTable();
          unint64_t v354 = v214;
          uint64_t v355 = v217;
          uint64_t v352 = swift_getWitnessTable();
          uint64_t v353 = v111;
          uint64_t v218 = swift_getWitnessTable();
          unint64_t v350 = v213;
          uint64_t v351 = v218;
          swift_getWitnessTable();
          uint64_t v220 = (uint64_t)v267;
          uint64_t v219 = v268;
          v221 = v270;
          (*(void (**)(char *, char *, uint64_t))(v268 + 16))(v267, v270, v168);
          uint64_t v123 = MEMORY[0x263F1B428];
          uint64_t v348 = MEMORY[0x263F1B428];
          uint64_t v349 = v113;
          uint64_t v222 = v275;
          swift_getWitnessTable();
          sub_24EFD18F4(v220, v222, v168);
          v223 = *(void (**)(uint64_t, uint64_t))(v219 + 8);
          v223(v220, v168);
          v223((uint64_t)v221, v168);
          goto LABEL_26;
        }
        if (!(v366 | *((void *)&v365 + 1) | (unint64_t)v365))
        {
          uint64_t *v255 = sub_24EFED360();
          swift_storeEnumTagMultiPayload();
          uint64_t v163 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
          swift_retain();
          uint64_t v164 = (uint64_t)v257;
          sub_24EFED1A0();
          sub_24EFD4330();
          unint64_t v165 = sub_24EFD43DC();
          uint64_t v166 = swift_getWitnessTable();
          uint64_t v314 = v163;
          uint64_t v315 = v166;
          uint64_t v167 = swift_getWitnessTable();
          unint64_t v312 = v165;
          uint64_t v313 = v167;
          uint64_t v310 = swift_getWitnessTable();
          uint64_t v111 = v289;
          uint64_t v311 = v289;
          swift_getWitnessTable();
          sub_24EFD11A4(v164, v274);
          sub_24EFACB28(v164, &qword_26B1E87E8);
          swift_release();
          goto LABEL_16;
        }
        sub_24EFED510();
        if (qword_26B1E88A0 != -1) {
          swift_once();
        }
        long long v149 = *((_OWORD *)a1 + 5);
        long long v374 = *((_OWORD *)a1 + 4);
        long long v375 = v149;
        long long v150 = *((_OWORD *)a1 + 7);
        long long v376 = *((_OWORD *)a1 + 6);
        long long v377 = v150;
        long long v151 = *((_OWORD *)a1 + 1);
        long long v370 = *(_OWORD *)a1;
        long long v371 = v151;
        long long v152 = *((_OWORD *)a1 + 3);
        long long v372 = *((_OWORD *)a1 + 2);
        long long v373 = v152;
        id v153 = (id)qword_26B1EB9A8;
        sub_24EFCD260();
        swift_getKeyPath();
        sub_24EFED4D0();
        swift_release();
        swift_release();
        sub_24EFED530();
        uint64_t v154 = v245;
        sub_24EFECFE0();
        uint64_t v155 = v254;
        uint64_t v156 = (void (*)(void, void))v282;
        (*(void (**)(uint64_t *, char *, void *))(v254 + 16))(v255, v154, v282);
        swift_storeEnumTagMultiPayload();
        uint64_t v157 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
        uint64_t v158 = (uint64_t)v257;
        sub_24EFED1A0();
        sub_24EFD4330();
        unint64_t v159 = sub_24EFD43DC();
        uint64_t v160 = swift_getWitnessTable();
        uint64_t v320 = v157;
        uint64_t v321 = v160;
        uint64_t v161 = swift_getWitnessTable();
        unint64_t v318 = v159;
        uint64_t v319 = v161;
        uint64_t v316 = swift_getWitnessTable();
        uint64_t v162 = v289;
        uint64_t v317 = v289;
        swift_getWitnessTable();
        sub_24EFD11A4(v158, v274);
        sub_24EFACB28(v158, &qword_26B1E87E8);
        (*(void (**)(char *, void))(v155 + 8))(v154, v156);
        uint64_t v113 = v287;
        char v122 = v276;
        uint64_t v111 = v162;
      }
      else
      {
        if ((_BYTE)v366)
        {
          if (v366 == 1)
          {
            long long v138 = *((_OWORD *)a1 + 5);
            long long v374 = *((_OWORD *)a1 + 4);
            long long v375 = v138;
            long long v139 = *((_OWORD *)a1 + 7);
            long long v376 = *((_OWORD *)a1 + 6);
            long long v377 = v139;
            long long v140 = *((_OWORD *)a1 + 1);
            long long v370 = *(_OWORD *)a1;
            long long v371 = v140;
            long long v141 = *((_OWORD *)a1 + 3);
            long long v372 = *((_OWORD *)a1 + 2);
            long long v373 = v141;
            uint64_t v142 = v241;
            sub_24EFCD970();
            uint64_t v143 = v242;
            uint64_t v144 = v250;
            (*(void (**)(char *, char *, uint64_t))(v242 + 16))(v249, v142, v250);
            swift_storeEnumTagMultiPayload();
            sub_24EFAD150(&qword_26B1E8800, &qword_26B1E8808);
            sub_24EFAD150(&qword_26B1E87F0, &qword_26B1E87F8);
            uint64_t v145 = (uint64_t)v251;
            sub_24EFED1A0();
            sub_24EFD43DC();
            uint64_t v146 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
            uint64_t v147 = swift_getWitnessTable();
            uint64_t v324 = v146;
            uint64_t v325 = v147;
            swift_getWitnessTable();
            uint64_t v148 = v259;
            sub_24EFD11A4(v145, v281);
            sub_24EFACB28(v145, &qword_26B1E87D8);
            (*(void (**)(char *, uint64_t))(v143 + 8))(v142, v144);
          }
          else if (v365 == 0)
          {
            sub_24EFED510();
            uint64_t v188 = v285;
            if (qword_26B1E88A0 != -1) {
              swift_once();
            }
            long long v189 = *((_OWORD *)a1 + 5);
            long long v374 = *((_OWORD *)a1 + 4);
            long long v375 = v189;
            long long v190 = *((_OWORD *)a1 + 7);
            long long v376 = *((_OWORD *)a1 + 6);
            long long v377 = v190;
            long long v191 = *((_OWORD *)a1 + 1);
            long long v370 = *(_OWORD *)a1;
            long long v371 = v191;
            long long v192 = *((_OWORD *)a1 + 3);
            long long v372 = *((_OWORD *)a1 + 2);
            long long v373 = v192;
            id v193 = (id)qword_26B1EB9A8;
            sub_24EFCD260();
            swift_getKeyPath();
            sub_24EFED4D0();
            swift_release();
            swift_release();
            sub_24EFED530();
            uint64_t v194 = (uint64_t)v237;
            sub_24EFECFE0();
            uint64_t v195 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
            uint64_t v196 = swift_getWitnessTable();
            uint64_t v197 = (uint64_t)v243;
            uint64_t v198 = (void (*)(void, void))v282;
            sub_24EFD11A4(v194, (uint64_t)v282);
            sub_24EFD43DC();
            uint64_t v326 = v195;
            uint64_t v327 = v196;
            swift_getWitnessTable();
            uint64_t v199 = v259;
            sub_24EFD18F4(v197, v281, v188);
            (*(void (**)(uint64_t, uint64_t))(v244 + 8))(v197, v188);
            uint64_t v200 = v198;
            uint64_t v148 = v199;
            (*(void (**)(uint64_t, void))(v254 + 8))(v194, v200);
          }
          else
          {
            long long v173 = *((_OWORD *)a1 + 5);
            long long v374 = *((_OWORD *)a1 + 4);
            long long v375 = v173;
            long long v174 = *((_OWORD *)a1 + 7);
            long long v376 = *((_OWORD *)a1 + 6);
            long long v377 = v174;
            long long v175 = *((_OWORD *)a1 + 1);
            long long v370 = *(_OWORD *)a1;
            long long v371 = v175;
            long long v176 = *((_OWORD *)a1 + 3);
            long long v372 = *((_OWORD *)a1 + 2);
            long long v373 = v176;
            long long v177 = v238;
            sub_24EFCEABC(v84, v238);
            uint64_t v178 = v288;
            uint64_t v179 = swift_getWitnessTable();
            uint64_t v181 = v239;
            uint64_t v180 = v240;
            uint64_t v182 = *(void (**)(char *, char *, uint64_t))(v240 + 16);
            v182(v239, v177, v178);
            uint64_t v183 = *(void (**)(char *, uint64_t))(v180 + 8);
            v183(v177, v178);
            v182(v177, v181, v178);
            uint64_t v184 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
            uint64_t v185 = (uint64_t)v243;
            sub_24EFD18F4((uint64_t)v177, (uint64_t)v282, v178);
            v183(v177, v178);
            sub_24EFD43DC();
            uint64_t v334 = v184;
            uint64_t v335 = v179;
            uint64_t v186 = v285;
            swift_getWitnessTable();
            uint64_t v187 = v259;
            sub_24EFD18F4(v185, v281, v186);
            (*(void (**)(uint64_t, uint64_t))(v244 + 8))(v185, v186);
            v183(v181, v178);
            uint64_t v148 = v187;
          }
        }
        else
        {
          long long v169 = v247;
          sub_24EFCD4B0();
          (*(void (**)(char *, char *, uint64_t))(v248 + 16))(v249, v169, v258);
          swift_storeEnumTagMultiPayload();
          sub_24EFAD150(&qword_26B1E8800, &qword_26B1E8808);
          sub_24EFAD150(&qword_26B1E87F0, &qword_26B1E87F8);
          uint64_t v170 = (uint64_t)v251;
          sub_24EFED1A0();
          sub_24EFD43DC();
          uint64_t v171 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
          uint64_t v172 = swift_getWitnessTable();
          uint64_t v322 = v171;
          uint64_t v323 = v172;
          swift_getWitnessTable();
          uint64_t v148 = v259;
          sub_24EFD11A4(v170, v281);
          sub_24EFA9D58(v91, *((uint64_t *)&v91 + 1), v92, 0);
          sub_24EFACB28(v170, &qword_26B1E87D8);
          (*(void (**)(char *, uint64_t))(v248 + 8))(v247, v258);
        }
        uint64_t v111 = v289;
        unint64_t v201 = sub_24EFD43DC();
        uint64_t v202 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
        uint64_t v203 = swift_getWitnessTable();
        uint64_t v332 = v202;
        uint64_t v333 = v203;
        uint64_t v204 = swift_getWitnessTable();
        unint64_t v330 = v201;
        uint64_t v331 = v204;
        uint64_t v205 = v284;
        uint64_t v206 = swift_getWitnessTable();
        uint64_t v207 = v263;
        uint64_t v208 = (uint64_t)v261;
        (*(void (**)(char *, char *, uint64_t))(v263 + 16))(v261, v148, v205);
        uint64_t v209 = (uint64_t)v265;
        sub_24EFD11A4(v208, v205);
        unint64_t v210 = v148;
        uint64_t v211 = *(void (**)(uint64_t, uint64_t))(v207 + 8);
        v211(v208, v205);
        sub_24EFD4330();
        uint64_t v328 = v206;
        uint64_t v329 = v111;
        uint64_t v212 = v286;
        swift_getWitnessTable();
        sub_24EFD18F4(v209, v274, v212);
        (*(void (**)(uint64_t, uint64_t))(v266 + 8))(v209, v212);
        v211((uint64_t)v210, v205);
        uint64_t v113 = v287;
        char v122 = v276;
      }
      uint64_t v168 = v279;
      goto LABEL_25;
    }
    a1[5](v85);
    uint64_t v124 = v271;
    long long v125 = *(void (**)(char *, char *, uint64_t))(v271 + 16);
    v236 = v70;
    v125(v70, v68, v83);
    long long v126 = *(void (**)(char *, uint64_t))(v124 + 8);
    v126(v68, v83);
    v283 = (void (*)(void, void))v126;
    uint64_t v271 = v124 + 8;
    v125(v68, v70, v83);
    uint64_t v127 = (uint64_t)v75;
    uint64_t v128 = MEMORY[0x263F1B428];
    uint64_t v129 = v287;
    sub_24EFD18F4((uint64_t)v68, MEMORY[0x263F1B440], v83);
    v126(v68, v83);
    uint64_t v308 = v128;
    uint64_t v309 = v129;
    uint64_t v130 = v275;
    v282 = (void *)swift_getWitnessTable();
    unint64_t v131 = sub_24EFD4330();
    unint64_t v132 = sub_24EFD43DC();
    uint64_t v133 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
    uint64_t v134 = swift_getWitnessTable();
    uint64_t v306 = v133;
    uint64_t v307 = v134;
    uint64_t v135 = swift_getWitnessTable();
    unint64_t v304 = v132;
    uint64_t v305 = v135;
    uint64_t v302 = swift_getWitnessTable();
    uint64_t v303 = v289;
    uint64_t v136 = swift_getWitnessTable();
    unint64_t v300 = v131;
    uint64_t v123 = MEMORY[0x263F1B428];
    uint64_t v301 = v136;
    uint64_t v137 = v130;
    swift_getWitnessTable();
    char v122 = v276;
    sub_24EFD11A4(v127, v137);
    (*(void (**)(uint64_t, uint64_t))(v269 + 8))(v127, v137);
    v283(v236, v83);
    uint64_t v113 = v287;
  }
  else
  {
    v283 = (void (*)(void, void))sub_24EFED360();
    *(void *)&long long v370 = v283;
    uint64_t v112 = (uint64_t)v75;
    uint64_t v113 = v287;
    sub_24EFD11A4((uint64_t)&v370, MEMORY[0x263F1B440]);
    uint64_t v298 = v86;
    uint64_t v299 = v113;
    uint64_t v114 = v275;
    swift_getWitnessTable();
    unint64_t v115 = sub_24EFD4330();
    unint64_t v116 = sub_24EFD43DC();
    uint64_t v117 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
    uint64_t v118 = swift_getWitnessTable();
    uint64_t v296 = v117;
    uint64_t v297 = v118;
    uint64_t v119 = swift_getWitnessTable();
    unint64_t v294 = v116;
    uint64_t v295 = v119;
    uint64_t v292 = swift_getWitnessTable();
    uint64_t v293 = v289;
    uint64_t v120 = swift_getWitnessTable();
    unint64_t v290 = v115;
    uint64_t v291 = v120;
    uint64_t v121 = v114;
    swift_getWitnessTable();
    char v122 = v276;
    uint64_t v123 = MEMORY[0x263F1B428];
    sub_24EFD11A4(v112, v121);
    (*(void (**)(uint64_t, uint64_t))(v269 + 8))(v112, v121);
    swift_release();
  }
LABEL_26:
  uint64_t v346 = v123;
  uint64_t v347 = v113;
  uint64_t v224 = swift_getWitnessTable();
  unint64_t v225 = sub_24EFD4330();
  unint64_t v226 = sub_24EFD43DC();
  uint64_t v227 = sub_24EFD836C(&qword_26B1E8460, MEMORY[0x263F3E160]);
  uint64_t v228 = swift_getWitnessTable();
  uint64_t v344 = v227;
  uint64_t v345 = v228;
  uint64_t v229 = swift_getWitnessTable();
  unint64_t v342 = v226;
  uint64_t v343 = v229;
  uint64_t v340 = swift_getWitnessTable();
  uint64_t v341 = v289;
  uint64_t v230 = swift_getWitnessTable();
  unint64_t v338 = v225;
  uint64_t v339 = v230;
  uint64_t v231 = swift_getWitnessTable();
  uint64_t v336 = v224;
  uint64_t v337 = v231;
  uint64_t v232 = v278;
  swift_getWitnessTable();
  uint64_t v233 = v277;
  (*(void (**)(uint64_t, char *, uint64_t))(v277 + 16))(v280, v122, v232);
  return (*(uint64_t (**)(char *, uint64_t))(v233 + 8))(v122, v232);
}

uint64_t sub_24EFD66D8()
{
  return sub_24EFD7A44((uint64_t (*)(void, void, void, void, void, void, void))sub_24EFD449C);
}

uint64_t sub_24EFD66F0(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v9 = a1[5];
  long long v17 = a1[4];
  long long v18 = v9;
  long long v10 = a1[7];
  long long v19 = a1[6];
  long long v20 = v10;
  long long v11 = a1[1];
  *(_OWORD *)uint64_t v15 = *a1;
  *(_OWORD *)&v15[16] = v11;
  long long v12 = a1[3];
  *(_OWORD *)&v15[32] = a1[2];
  long long v16 = v12;
  v14[0] = a2;
  v14[1] = a3;
  void v14[2] = a4;
  v14[3] = a5;
  v14[4] = a6;
  v14[5] = a7;
  type metadata accessor for ForYouView(0, (uint64_t)v14);
  sub_24EFCD260();
  *(void *)uint64_t v15 = a8;
  memset(&v15[8], 0, 32);
  v15[40] = 8;
  sub_24EFED4E0();
  return swift_release();
}

uint64_t sub_24EFD6788()
{
  return sub_24EFD74AC(6);
}

uint64_t sub_24EFD6790(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EFD682C(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  long long v9 = a3[5];
  long long v17 = a3[4];
  long long v18 = v9;
  long long v10 = a3[7];
  long long v19 = a3[6];
  long long v20 = v10;
  long long v11 = a3[1];
  *(_OWORD *)uint64_t v15 = *a3;
  *(_OWORD *)&v15[16] = v11;
  long long v12 = a3[3];
  *(_OWORD *)&v15[32] = a3[2];
  long long v16 = v12;
  v14[0] = a4;
  v14[1] = a5;
  void v14[2] = a6;
  v14[3] = a7;
  v14[4] = a8;
  v14[5] = a9;
  type metadata accessor for ForYouView(0, (uint64_t)v14);
  sub_24EFCD260();
  *(void *)uint64_t v15 = 1;
  memset(&v15[8], 0, 32);
  v15[40] = 2;
  sub_24EFED4E0();
  return swift_release();
}

uint64_t sub_24EFD68C8(uint64_t a1, uint64_t a2)
{
  return sub_24EFD682C(a1, a2, (_OWORD *)(v2 + 64), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_24EFD68FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24EFD694C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 80);
}

uint64_t sub_24EFD6954()
{
  sub_24EFAC818();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24EFD69C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24EFAC824();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = a2[3];
  uint64_t v7 = a2[8];
  long long v8 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 48) = v8;
  *(void *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
  *(void *)(a1 + 88) = a2[11];
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
  uint64_t v9 = a2[14];
  *(void *)(a1 + 104) = a2[13];
  *(void *)(a1 + 112) = v9;
  *(void *)(a1 + 120) = a2[15];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_24EFD6AA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24EFAC824();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24EFAC818();
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = a2[8];
  *(void *)(a1 + 56) = a2[7];
  *(void *)(a1 + 64) = v9;
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = a2[9];
  *(void *)(a1 + 80) = a2[10];
  *(void *)(a1 + 88) = a2[11];
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
  *(void *)(a1 + 104) = a2[13];
  swift_retain();
  swift_release();
  *(void *)(a1 + 112) = a2[14];
  swift_retain();
  swift_release();
  *(void *)(a1 + 120) = a2[15];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t sub_24EFD6BF0(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_24EFAC818();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  swift_release();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_release();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  return a1;
}

uint64_t sub_24EFD6CB0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24EFD6CF8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ForYouView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for ForYouView);
}

uint64_t sub_24EFD6D70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24EFD7380@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD74F4(a1);
}

uint64_t sub_24EFD739C@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFCD608(*(long long **)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), a1, *(void *)(v1 + 56));
}

uint64_t sub_24EFD73D4@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD7410((uint64_t)&unk_2700A3918, (uint64_t)sub_24EFD74A4, (uint64_t)sub_24EFD74D8, a1);
}

uint64_t sub_24EFD7410@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return sub_24EFD30A0(*(long long **)(v4 + 64), *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48), *(void *)(v4 + 56), a4, a1, a2, a3);
}

uint64_t sub_24EFD7458@<X0>(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t result = type metadata accessor for ForYouState();
  *a2 = *(void *)(a1 + *(int *)(result + 64)) < *(void *)(a1 + *(int *)(result + 56));
  return result;
}

uint64_t sub_24EFD74A4()
{
  return sub_24EFD74AC(4);
}

uint64_t sub_24EFD74AC(uint64_t a1)
{
  return sub_24EFD66F0((_OWORD *)(v1 + 64), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), a1);
}

uint64_t sub_24EFD74D8@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD74F4(a1);
}

uint64_t sub_24EFD74F4@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD3354(*(long long **)(v1 + 64), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), a1);
}

uint64_t sub_24EFD7530(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_24EFAC0AC(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24EFD7574(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_24EFAC0BC(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24EFD75B8@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD **)(v1 + 64);
  char v4 = *(unsigned char *)(v1 + 72);
  long long v5 = *(_OWORD *)(v1 + 16);
  long long v6 = *(_OWORD *)(v1 + 32);
  long long v7 = *(_OWORD *)(v1 + 48);
  long long v8 = v3[5];
  v14[7] = v3[4];
  v14[8] = v8;
  long long v9 = v3[7];
  v14[9] = v3[6];
  v14[10] = v9;
  long long v10 = v3[1];
  v14[3] = *v3;
  v14[4] = v10;
  long long v11 = v3[3];
  v14[5] = v3[2];
  void v14[6] = v11;
  v14[0] = v5;
  v14[1] = v6;
  void v14[2] = v7;
  long long v12 = (_OWORD *)type metadata accessor for ForYouView(0, (uint64_t)v14);
  return sub_24EFCDAB0(v4, v12, a1);
}

double sub_24EFD7640@<D0>(uint64_t a1@<X8>)
{
  return sub_24EFCE2CC(*(long long **)(v1 + 64), *(unsigned char *)(v1 + 72), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), a1);
}

uint64_t sub_24EFD7658()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_24EFD7680()
{
  unint64_t result = qword_269998A20;
  if (!qword_269998A20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269998A10);
    sub_24EFD7720();
    sub_24EFAD150(&qword_269998A48, &qword_269998A50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998A20);
  }
  return result;
}

unint64_t sub_24EFD7720()
{
  unint64_t result = qword_269998A28;
  if (!qword_269998A28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269998A30);
    sub_24EFD77B4();
    sub_24EFD784C(&qword_269998A58, &qword_269998A60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998A28);
  }
  return result;
}

unint64_t sub_24EFD77B4()
{
  unint64_t result = qword_269998A38;
  if (!qword_269998A38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269998A40);
    sub_24EFAD150(&qword_269998A48, &qword_269998A50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998A38);
  }
  return result;
}

uint64_t sub_24EFD784C(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_24EFD78B0()
{
  unint64_t result = qword_269998A68;
  if (!qword_269998A68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269998A18);
    sub_24EFD792C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998A68);
  }
  return result;
}

unint64_t sub_24EFD792C()
{
  unint64_t result = qword_269998A70;
  if (!qword_269998A70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269998A78);
    sub_24EFD784C(&qword_269998A80, &qword_269998A88);
    sub_24EFD784C(&qword_269998A58, &qword_269998A60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998A70);
  }
  return result;
}

uint64_t sub_24EFD79D8@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD74F4(a1);
}

uint64_t sub_24EFD79F4@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD74F4(a1);
}

uint64_t sub_24EFD7A10@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD74F4(a1);
}

uint64_t sub_24EFD7A2C()
{
  return sub_24EFD7A44((uint64_t (*)(void, void, void, void, void, void, void))sub_24EFCF03C);
}

uint64_t sub_24EFD7A44(uint64_t (*a1)(void, void, void, void, void, void, void))
{
  return a1(v1[8], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_24EFD7A60@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD74F4(a1);
}

uint64_t sub_24EFD7A7C@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD7410((uint64_t)&unk_2700A3940, (uint64_t)sub_24EFD7ABC, (uint64_t)sub_24EFD7AC4, a1);
}

uint64_t sub_24EFD7ABC()
{
  return sub_24EFD74AC(2);
}

uint64_t sub_24EFD7AC4@<X0>(uint64_t a1@<X8>)
{
  return sub_24EFD74F4(a1);
}

uint64_t sub_24EFD7AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24EFD19EC(a1, (uint64_t)(v2 + 8), v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], a2);
}

uint64_t sub_24EFD7AF8()
{
  return sub_24EFD7A44((uint64_t (*)(void, void, void, void, void, void, void))sub_24EFD00A8);
}

uint64_t sub_24EFD7B14()
{
  return sub_24EFD7B34((uint64_t)&unk_2700A3A08, (uint64_t)&unk_269998AD0);
}

uint64_t sub_24EFD7B34(uint64_t a1, uint64_t a2)
{
  return sub_24EFD2B44((uint64_t)(v2 + 8), v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], a1, a2);
}

uint64_t sub_24EFD7B74()
{
  return sub_24EFD7B8C((uint64_t (*)(void *, void, void, void, void, void, void))sub_24EFD0F2C);
}

uint64_t sub_24EFD7B8C(uint64_t (*a1)(void *, void, void, void, void, void, void))
{
  return a1(v1 + 8, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_24EFD7BAC()
{
  return sub_24EFD7B8C((uint64_t (*)(void *, void, void, void, void, void, void))sub_24EFD1134);
}

unint64_t sub_24EFD7BC4()
{
  unint64_t result = qword_269998AA8;
  if (!qword_269998AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998AA8);
  }
  return result;
}

uint64_t sub_24EFD7C18(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EFD7CB8(uint64_t a1)
{
  uint64_t v4 = v1[5];
  uint64_t v11 = v1[4];
  uint64_t v5 = v1[6];
  uint64_t v6 = v1[7];
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *long long v9 = v2;
  v9[1] = sub_24EFD7DAC;
  return sub_24EFD129C(a1, v7, v8, (uint64_t)(v1 + 10), v11, v4, v5, v6);
}

uint64_t sub_24EFD7DAC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EFD7EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_24EFED6E0();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_24EFD7FA4, 0, 0);
}

uint64_t sub_24EFD7FA4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_24EFED700();
  uint64_t v5 = sub_24EFD836C(&qword_269998AE0, MEMORY[0x263F8F710]);
  sub_24EFED8D0();
  sub_24EFD836C(&qword_269998AE8, MEMORY[0x263F8F6D8]);
  sub_24EFED710();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24EFD8144;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_24EFD8144()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(void *)(v5 + 8);
    __asm { BRAA            X1, X16 }
  }
  return MEMORY[0x270FA2498](sub_24EFD8300, 0, 0);
}

uint64_t sub_24EFD8300()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EFD836C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24EFD83B8()
{
  return sub_24EFD7B34((uint64_t)&unk_2700A3AA8, (uint64_t)&unk_269998AF8);
}

uint64_t sub_24EFD83D8()
{
  uint64_t v1 = sub_24EFED0B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 192) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  sub_24EFAC818();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24EFD84E0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = *(void *)(sub_24EFED0B0() - 8);
  uint64_t v8 = (uint64_t)v0 + ((*(unsigned __int8 *)(v7 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_24EFD28BC((uint64_t)(v0 + 8), v8, v1, v2, v3, v4, v5, v6);
}

uint64_t objectdestroy_2Tm_0()
{
  sub_24EFAC818();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 192, 7);
}

uint64_t sub_24EFD8600(uint64_t a1, uint64_t a2)
{
  return sub_24EFD2AD0(a1, a2, (uint64_t)(v2 + 8), v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t objectdestroy_43Tm()
{
  swift_unknownObjectRelease();
  sub_24EFAC818();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 208, 7);
}

uint64_t sub_24EFD86B4(uint64_t a1)
{
  uint64_t v4 = v1[5];
  uint64_t v11 = v1[4];
  uint64_t v5 = v1[6];
  uint64_t v6 = v1[7];
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *long long v9 = v2;
  v9[1] = sub_24EFD87B0;
  return sub_24EFD2D20(a1, v7, v8, (uint64_t)(v1 + 10), v11, v4, v5, v6);
}

uint64_t PlaceholderReferenceType.rawValue.getter(char a1)
{
  return *(void *)&aAward_4[8 * a1];
}

uint64_t sub_24EFD87D8(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = PlaceholderReferenceType.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == PlaceholderReferenceType.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24EFED8B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24EFD8864@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s13FitnessForYou24PlaceholderReferenceTypeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_24EFD8894@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PlaceholderReferenceType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24EFD88C0()
{
  return sub_24EFED590();
}

uint64_t sub_24EFD8920()
{
  return sub_24EFED580();
}

uint64_t sub_24EFD8970()
{
  char v1 = *v0;
  sub_24EFED940();
  PlaceholderReferenceType.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t sub_24EFD89D4()
{
  PlaceholderReferenceType.rawValue.getter(*v0);
  sub_24EFED560();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EFD8A28()
{
  char v1 = *v0;
  sub_24EFED940();
  PlaceholderReferenceType.rawValue.getter(v1);
  sub_24EFED560();
  swift_bridgeObjectRelease();
  return sub_24EFED980();
}

uint64_t _s13FitnessForYou24PlaceholderReferenceTypeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_24EFED760();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

unint64_t sub_24EFD8AD8()
{
  unint64_t result = qword_269998B00;
  if (!qword_269998B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B00);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PlaceholderReferenceType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PlaceholderReferenceType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFD8C88);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlaceholderReferenceType()
{
  return &type metadata for PlaceholderReferenceType;
}

unint64_t sub_24EFD8CC0()
{
  unint64_t result = qword_26B1E8760;
  if (!qword_26B1E8760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8760);
  }
  return result;
}

uint64_t sub_24EFD8D14(char a1, char a2)
{
  if (*(void *)&aAward_5[8 * a1] == *(void *)&aAward_5[8 * a2] && qword_24EFF4560[a1] == qword_24EFF4560[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_24EFED8B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24EFD8D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v7 = *(char *)(a1 + v5 + 48);
      double v8 = *(double *)(a1 + v5 + 56);
      char v9 = *(unsigned char *)(a1 + v5 + 64);
      uint64_t v10 = *(char *)(a2 + v5 + 48);
      double v11 = *(double *)(a2 + v5 + 56);
      int v12 = *(unsigned __int8 *)(a2 + v5 + 64);
      BOOL v13 = *(void *)(a1 + v5 + 32) == *(void *)(a2 + v5 + 32)
         && *(void *)(a1 + v5 + 40) == *(void *)(a2 + v5 + 40);
      if (!v13 && (sub_24EFED8B0() & 1) == 0) {
        return 0;
      }
      if (*(void *)&aAward_5[8 * v7] == *(void *)&aAward_5[8 * v10] && qword_24EFF4560[v7] == qword_24EFF4560[v10])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v9) {
          goto LABEL_23;
        }
      }
      else
      {
        char v15 = sub_24EFED8B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v15 & 1) == 0) {
          return 0;
        }
        if (v9)
        {
LABEL_23:
          if (!v12) {
            return 0;
          }
          goto LABEL_9;
        }
      }
      if (v8 == v11) {
        char v6 = v12;
      }
      else {
        char v6 = 1;
      }
      if (v6) {
        return 0;
      }
LABEL_9:
      v5 += 40;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_24EFD8EEC(uint64_t a1, uint64_t a2)
{
  type metadata accessor for CanvasPlaceholder();
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  char v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  char v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      char v14 = 1;
    }
    else
    {
      unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v12 = *(void *)(v7 + 72);
      uint64_t v13 = v10 - 1;
      do
      {
        sub_24EFDAA5C(a1 + v11, (uint64_t)v9);
        sub_24EFDAA5C(a2 + v11, (uint64_t)v6);
        char v14 = _s13FitnessForYou17CanvasPlaceholderV2eeoiySbAC_ACtFZ_0((uint64_t)v9, (uint64_t)v6);
        sub_24EFA3820((uint64_t)v6);
        sub_24EFA3820((uint64_t)v9);
        BOOL v16 = v13-- != 0;
        if ((v14 & 1) == 0) {
          break;
        }
        v11 += v12;
      }
      while (v16);
    }
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_24EFD904C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2) {
      return 1;
    }
    char v3 = (uint64_t *)(a2 + 64);
    for (unint64_t i = (uint64_t *)(a1 + 64); ; i += 5)
    {
      uint64_t v6 = *(i - 2);
      uint64_t v5 = *(i - 1);
      uint64_t v7 = *i;
      uint64_t v9 = *(v3 - 2);
      uint64_t v8 = *(v3 - 1);
      uint64_t v14 = *v3;
      BOOL v10 = *(i - 4) == *(v3 - 4) && *(i - 3) == *(v3 - 3);
      if (!v10 && (sub_24EFED8B0() & 1) == 0) {
        break;
      }
      BOOL v11 = v6 == v9 && v5 == v8;
      if (!v11 && (sub_24EFED8B0() & 1) == 0) {
        break;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v12 = sub_24EFD8D9C(v7, v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0) {
        break;
      }
      v3 += 5;
      if (!--v2) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_24EFD91AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v21 = 1;
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2 - 1;
      do
      {
        uint64_t v7 = *(void *)(a1 + v5 + 40);
        char v8 = *(unsigned char *)(a1 + v5 + 80);
        uint64_t v9 = *(void *)(a1 + v5 + 104);
        char v10 = *(unsigned char *)(a1 + v5 + 112);
        uint64_t v11 = *(void *)(a1 + v5 + 120);
        uint64_t v12 = *(void *)(a1 + v5 + 128);
        v34[0] = *(void *)(a1 + v5 + 32);
        v34[1] = v7;
        long long v13 = *(_OWORD *)(a1 + v5 + 64);
        long long v35 = *(_OWORD *)(a1 + v5 + 48);
        long long v36 = v13;
        char v37 = v8;
        long long v38 = *(_OWORD *)(a1 + v5 + 88);
        uint64_t v39 = v9;
        char v40 = v10;
        uint64_t v41 = v11;
        uint64_t v42 = v12;
        uint64_t v14 = *(void *)(a2 + v5 + 40);
        char v15 = *(unsigned char *)(a2 + v5 + 80);
        uint64_t v16 = *(void *)(a2 + v5 + 104);
        char v17 = *(unsigned char *)(a2 + v5 + 112);
        uint64_t v18 = *(void *)(a2 + v5 + 120);
        uint64_t v19 = *(void *)(a2 + v5 + 128);
        v25[0] = *(void *)(a2 + v5 + 32);
        v25[1] = v14;
        long long v20 = *(_OWORD *)(a2 + v5 + 64);
        long long v26 = *(_OWORD *)(a2 + v5 + 48);
        long long v27 = v20;
        char v28 = v15;
        long long v29 = *(_OWORD *)(a2 + v5 + 88);
        uint64_t v30 = v16;
        char v31 = v17;
        uint64_t v32 = v18;
        uint64_t v33 = v19;
        char v21 = _s13FitnessForYou23CanvasSectionDescriptorV2eeoiySbAC_ACtFZ_0((uint64_t)v34, (uint64_t)v25);
        BOOL v23 = v6-- != 0;
        if ((v21 & 1) == 0) {
          break;
        }
        v5 += 104;
      }
      while (v23);
    }
  }
  else
  {
    char v21 = 0;
  }
  return v21 & 1;
}

uint64_t sub_24EFD92C0(char a1)
{
  return *(void *)&aIdle_2[8 * a1];
}

uint64_t sub_24EFD92E0()
{
  return sub_24EFD92C0(*v0);
}

uint64_t sub_24EFD92E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EFD9B1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EFD9310(uint64_t a1)
{
  unint64_t v2 = sub_24EFD98F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFD934C(uint64_t a1)
{
  unint64_t v2 = sub_24EFD98F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFD9388(uint64_t a1)
{
  unint64_t v2 = sub_24EFD9998();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFD93C4(uint64_t a1)
{
  unint64_t v2 = sub_24EFD9998();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFD9400(uint64_t a1)
{
  unint64_t v2 = sub_24EFD9944();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFD943C(uint64_t a1)
{
  unint64_t v2 = sub_24EFD9944();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EFD9478(uint64_t a1)
{
  unint64_t v2 = sub_24EFD99EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EFD94B4(uint64_t a1)
{
  unint64_t v2 = sub_24EFD99EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AwardLoadState.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v26 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998B08);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v3);
  char v21 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998B10);
  uint64_t v24 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998B18);
  uint64_t v20 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998B20);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EFD98F0();
  uint64_t v15 = v26;
  sub_24EFED9A0();
  if (!v15)
  {
    char v28 = 0;
    sub_24EFD99EC();
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  if (v15 == 1)
  {
    char v30 = 2;
    sub_24EFD9944();
    uint64_t v16 = v21;
    sub_24EFED820();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  char v29 = 1;
  sub_24EFD9998();
  sub_24EFED820();
  uint64_t v27 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8888);
  sub_24EFDA9EC(&qword_26B1E8890, (void (*)(void))sub_24EFA826C);
  uint64_t v18 = v25;
  sub_24EFED8A0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_24EFD98F0()
{
  unint64_t result = qword_269998B28;
  if (!qword_269998B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B28);
  }
  return result;
}

unint64_t sub_24EFD9944()
{
  unint64_t result = qword_269998B30;
  if (!qword_269998B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B30);
  }
  return result;
}

unint64_t sub_24EFD9998()
{
  unint64_t result = qword_269998B38;
  if (!qword_269998B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B38);
  }
  return result;
}

unint64_t sub_24EFD99EC()
{
  unint64_t result = qword_269998B40;
  if (!qword_269998B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B40);
  }
  return result;
}

uint64_t AwardLoadState.init(from:)(void *a1)
{
  return sub_24EFD9C54(a1);
}

uint64_t sub_24EFD9A58@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_24EFD9C54(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_24EFD9A84(void *a1)
{
  return AwardLoadState.encode(to:)(a1, *v1);
}

uint64_t static AwardLoadState.== infix(_:_:)(uint64_t a1, unint64_t a2)
{
  if (!a1) {
    return !a2;
  }
  if (a1 == 1) {
    return a2 == 1;
  }
  if (a2 < 2) {
    return 0;
  }
  return sub_24EFD904C(a1, a2);
}

uint64_t sub_24EFD9ADC(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = *a2;
  if (!v2) {
    return !v3;
  }
  if (v2 == 1) {
    return v3 == 1;
  }
  if (v3 < 2) {
    return 0;
  }
  return sub_24EFD904C(v2, v3);
}

uint64_t sub_24EFD9B1C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v3 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000 || (sub_24EFED8B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EFED8B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24EFD9C54(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998B98);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v33 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998BA0);
  uint64_t v32 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  char v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998BA8);
  uint64_t v29 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998BB0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v34 = a1;
  uint64_t v15 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, v14);
  sub_24EFD98F0();
  uint64_t v16 = v35;
  sub_24EFED990();
  if (!v16)
  {
    char v17 = v33;
    uint64_t v35 = v11;
    uint64_t v18 = sub_24EFED810();
    if (*(void *)(v18 + 16) == 1)
    {
      if (*(unsigned char *)(v18 + 32))
      {
        if (*(unsigned char *)(v18 + 32) == 1)
        {
          uint64_t v19 = v35;
          char v38 = 1;
          sub_24EFD9998();
          sub_24EFED770();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8888);
          sub_24EFDA9EC(&qword_269997EE8, (void (*)(void))sub_24EFA8714);
          uint64_t v26 = v28;
          sub_24EFED800();
          (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v26);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v19 + 8))(v13, v10);
          uint64_t v15 = v36;
        }
        else
        {
          uint64_t v24 = v35;
          char v39 = 2;
          sub_24EFD9944();
          sub_24EFED770();
          (*(void (**)(char *, uint64_t))(v31 + 8))(v17, v30);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v10);
          uint64_t v15 = 1;
        }
      }
      else
      {
        uint64_t v23 = v35;
        char v37 = 0;
        sub_24EFD99EC();
        sub_24EFED770();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v7);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v10);
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v20 = sub_24EFED6C0();
      swift_allocError();
      uint64_t v22 = v21;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269997EC0);
      *uint64_t v22 = &type metadata for AwardLoadState;
      uint64_t v15 = (uint64_t)v13;
      sub_24EFED780();
      sub_24EFED6B0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v10);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  return v15;
}

uint64_t *initializeBufferWithCopyOfBuffer for AwardLoadState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for AwardLoadState(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for AwardLoadState(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for AwardLoadState(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AwardLoadState(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AwardLoadState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_24EFDA43C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24EFDA454(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AwardLoadState()
{
  return &type metadata for AwardLoadState;
}

unsigned char *storeEnumTagSinglePayload for AwardLoadState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFDA550);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwardLoadState.CodingKeys()
{
  return &type metadata for AwardLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for AwardLoadState.IdleCodingKeys()
{
  return &type metadata for AwardLoadState.IdleCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for AwardLoadState.FetchedCodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24EFDA634);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwardLoadState.FetchedCodingKeys()
{
  return &type metadata for AwardLoadState.FetchedCodingKeys;
}

ValueMetadata *type metadata accessor for AwardLoadState.FetchingCodingKeys()
{
  return &type metadata for AwardLoadState.FetchingCodingKeys;
}

unint64_t sub_24EFDA680()
{
  unint64_t result = qword_269998B48;
  if (!qword_269998B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B48);
  }
  return result;
}

unint64_t sub_24EFDA6D8()
{
  unint64_t result = qword_269998B50;
  if (!qword_269998B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B50);
  }
  return result;
}

unint64_t sub_24EFDA730()
{
  unint64_t result = qword_269998B58;
  if (!qword_269998B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B58);
  }
  return result;
}

unint64_t sub_24EFDA788()
{
  unint64_t result = qword_269998B60;
  if (!qword_269998B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B60);
  }
  return result;
}

unint64_t sub_24EFDA7E0()
{
  unint64_t result = qword_269998B68;
  if (!qword_269998B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B68);
  }
  return result;
}

unint64_t sub_24EFDA838()
{
  unint64_t result = qword_269998B70;
  if (!qword_269998B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B70);
  }
  return result;
}

unint64_t sub_24EFDA890()
{
  unint64_t result = qword_269998B78;
  if (!qword_269998B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B78);
  }
  return result;
}

unint64_t sub_24EFDA8E8()
{
  unint64_t result = qword_269998B80;
  if (!qword_269998B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B80);
  }
  return result;
}

unint64_t sub_24EFDA940()
{
  unint64_t result = qword_269998B88;
  if (!qword_269998B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B88);
  }
  return result;
}

unint64_t sub_24EFDA998()
{
  unint64_t result = qword_269998B90;
  if (!qword_269998B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998B90);
  }
  return result;
}

uint64_t sub_24EFDA9EC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E8888);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24EFDAA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CanvasPlaceholder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

__n128 ForYouToastFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t ForYouToastFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, unint64_t *a3, unsigned char *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269998BB8);
  uint64_t v81 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v62 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v62 - v14;
  LOBYTE(a4) = *a4;
  uint64_t v16 = v4[1];
  uint64_t v17 = v4[2];
  uint64_t v18 = v4[3];
  uint64_t v79 = *v4;
  uint64_t v80 = v17;
  uint64_t v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88A8);
  uint64_t v20 = v19[16];
  uint64_t v21 = v19[20];
  uint64_t v22 = v19[24];
  if (a4)
  {
    uint64_t v23 = v19;
    uint64_t v24 = &v13[v20];
    uint64_t v25 = &v13[v21];
    uint64_t v78 = a3;
    uint64_t v26 = &v13[v22];
    char v84 = 1;
    unint64_t v76 = sub_24EFDB1DC();
    sub_24EFED690();
    sub_24EFED5F0();
    uint64_t v27 = *MEMORY[0x263F39580];
    uint64_t v28 = sub_24EFED4C0();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = *(void (**)(char *, void, uint64_t))(v29 + 104);
    unsigned int v75 = v27;
    uint64_t v73 = v30;
    uint64_t v74 = v28;
    uint64_t v72 = v29 + 104;
    ((void (*)(char *, uint64_t))v30)(v24, v27);
    uint64_t v31 = (void *)swift_allocObject();
    v31[2] = v79;
    v31[3] = v16;
    void v31[4] = v80;
    v31[5] = v18;
    *(void *)uint64_t v26 = &unk_269998BD0;
    *((void *)v26 + 1) = v31;
    uint64_t v32 = *MEMORY[0x263F39578];
    uint64_t v33 = sub_24EFED4B0();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = *(void (**)(char *, void, uint64_t))(v34 + 104);
    unsigned int v71 = v32;
    uint64_t v69 = v35;
    uint64_t v70 = v33;
    uint64_t v68 = v34 + 104;
    ((void (*)(char *, uint64_t))v35)(v25, v32);
    uint64_t v36 = *(void (**)(void))(v81 + 104);
    unsigned int v67 = *MEMORY[0x263F39530];
    uint64_t v77 = v7;
    uint64_t v66 = (void (*)(char *, void, uint64_t))v36;
    v36(v13);
    unint64_t v37 = *v78;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v37 = sub_24EFDBDE0(0, *(void *)(v37 + 16) + 1, 1, v37, &qword_269998C20, &qword_269998BB8);
    }
    unint64_t v39 = *(void *)(v37 + 16);
    unint64_t v38 = *(void *)(v37 + 24);
    if (v39 >= v38 >> 1) {
      unint64_t v37 = sub_24EFDBDE0(v38 > 1, v39 + 1, 1, v37, &qword_269998C20, &qword_269998BB8);
    }
    *(void *)(v37 + 16) = v39 + 1;
    char v40 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v81 + 32);
    unint64_t v64 = (*(unsigned __int8 *)(v81 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
    uint64_t v65 = v40;
    uint64_t v63 = *(void *)(v81 + 72);
    uint64_t v41 = v77;
    v81 += 32;
    v40(v37 + v64 + v63 * v39, v13, v77);
    uint64_t v42 = v78;
    unint64_t *v78 = v37;
    uint64_t v43 = &v10[v23[16]];
    uint64_t v44 = &v10[v23[20]];
    uint64_t v45 = &v10[v23[24]];
    char v83 = 0;
    sub_24EFED690();
    sub_24EFED5F0();
    v73(v43, v75, v74);
    uint64_t v46 = (void *)swift_allocObject();
    v46[2] = v79;
    v46[3] = v16;
    v46[4] = v80;
    v46[5] = v18;
    *(void *)uint64_t v45 = &unk_269998BE0;
    *((void *)v45 + 1) = v46;
    v69(v44, v71, v70);
    v66(v10, v67, v41);
    unint64_t v47 = *v42;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v47 = sub_24EFDBDE0(0, *(void *)(v47 + 16) + 1, 1, v47, &qword_269998C20, &qword_269998BB8);
    }
    unint64_t v49 = *(void *)(v47 + 16);
    unint64_t v48 = *(void *)(v47 + 24);
    if (v49 >= v48 >> 1) {
      unint64_t v47 = sub_24EFDBDE0(v48 > 1, v49 + 1, 1, v47, &qword_269998C20, &qword_269998BB8);
    }
    *(void *)(v47 + 16) = v49 + 1;
    uint64_t result = v65(v47 + v64 + v49 * v63, v10, v41);
    a3 = v78;
  }
  else
  {
    uint64_t v51 = &v15[v20];
    uint64_t v52 = &v15[v21];
    uint64_t v53 = &v15[v22];
    char v82 = 1;
    sub_24EFDB1DC();
    sub_24EFED690();
    sub_24EFED5F0();
    uint64_t v54 = *MEMORY[0x263F39580];
    uint64_t v55 = sub_24EFED4C0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v55 - 8) + 104))(v51, v54, v55);
    uint64_t v56 = (void *)swift_allocObject();
    v56[2] = v79;
    v56[3] = v16;
    v56[4] = v80;
    v56[5] = v18;
    *(void *)uint64_t v53 = &unk_269998BF0;
    *((void *)v53 + 1) = v56;
    uint64_t v57 = *MEMORY[0x263F39578];
    uint64_t v58 = sub_24EFED4B0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v58 - 8) + 104))(v52, v57, v58);
    uint64_t v59 = v81;
    (*(void (**)(char *, void, uint64_t))(v81 + 104))(v15, *MEMORY[0x263F39530], v7);
    unint64_t v47 = *a3;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v47 = sub_24EFDBDE0(0, *(void *)(v47 + 16) + 1, 1, v47, &qword_269998C20, &qword_269998BB8);
    }
    unint64_t v61 = *(void *)(v47 + 16);
    unint64_t v60 = *(void *)(v47 + 24);
    if (v61 >= v60 >> 1) {
      unint64_t v47 = sub_24EFDBDE0(v60 > 1, v61 + 1, 1, v47, &qword_269998C20, &qword_269998BB8);
    }
    *(void *)(v47 + 16) = v61 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v59 + 32))(v47+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(void *)(v59 + 72) * v61, v15, v7);
  }
  *a3 = v47;
  return result;
}

unint64_t sub_24EFDB1DC()
{
  unint64_t result = qword_269998BC0;
  if (!qword_269998BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269998BC0);
  }
  return result;
}

uint64_t sub_24EFDB230(uint64_t a1, int *a2)
{
  v2[2] = sub_24EFED5E0();
  v2[3] = sub_24EFED5D0();
  unsigned int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFDB328;
  return v6(1);
}

uint64_t sub_24EFDB328()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24EFED5B0();
  return MEMORY[0x270FA2498](sub_24EFDC1A8, v1, v0);
}

uint64_t sub_24EFDB464(uint64_t a1, int *a2)
{
  v2[2] = sub_24EFED5E0();
  v2[3] = sub_24EFED5D0();
  unsigned int v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFDB328;
  return v6(0);
}

uint64_t sub_24EFDB560(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24EFD87B0;
  return sub_24EFDB464(a1, v4);
}

uint64_t sub_24EFDB61C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[2] = sub_24EFED5E0();
  _OWORD v4[3] = sub_24EFED5D0();
  uint64_t v8 = (uint64_t (*)(void))((char *)a4 + *a4);
  unsigned int v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  *unsigned int v6 = v4;
  v6[1] = sub_24EFDB710;
  return v8();
}

uint64_t sub_24EFDB710()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24EFED5B0();
  if (v0) {
    uint64_t v4 = sub_24EFDB8D0;
  }
  else {
    uint64_t v4 = sub_24EFDB86C;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_24EFDB86C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EFDB8D0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EFDB940(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24EFD7DAC;
  return sub_24EFDB61C(a1, v4, v5, v6);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24EFDBA40(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24EFD87B0;
  return sub_24EFDB230(a1, v4);
}

unint64_t sub_24EFDBB00()
{
  unint64_t result = qword_269998BF8;
  if (!qword_269998BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998BF8);
  }
  return result;
}

unint64_t sub_24EFDBB58()
{
  unint64_t result = qword_269998C00;
  if (!qword_269998C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998C00);
  }
  return result;
}

unint64_t sub_24EFDBBB0()
{
  unint64_t result = qword_269998C08;
  if (!qword_269998C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998C08);
  }
  return result;
}

unint64_t sub_24EFDBC08()
{
  unint64_t result = qword_269998C10;
  if (!qword_269998C10)
  {
    type metadata accessor for ForYouToastState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998C10);
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastFeature()
{
  return &type metadata for ForYouToastFeature;
}

unsigned char *storeEnumTagSinglePayload for ForYouToastFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFDBD3CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouToastFeature.TaskIdentifier()
{
  return &type metadata for ForYouToastFeature.TaskIdentifier;
}

unint64_t sub_24EFDBD78()
{
  unint64_t result = qword_269998C18;
  if (!qword_269998C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998C18);
  }
  return result;
}

uint64_t sub_24EFDBDCC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24EFDBDE0(a1, a2, a3, a4, &qword_26B1E8978, &qword_26B1E8838);
}

uint64_t sub_24EFDBDE0(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v10 = a2;
      }
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (BOOL v18 = v14 == -1) : (BOOL v18 = 0), v18))
  {
LABEL_29:
    uint64_t result = sub_24EFED720();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v16 + v20;
  if (a1)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(void *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24EFDC04C(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_24EFDC04C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a5) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_24EFED750();
  __break(1u);
  return result;
}

void *ForYouFeature.init(environment:)@<X0>(void *__src@<X0>, void *a2@<X8>)
{
  return memcpy(a2, __src, 0x130uLL);
}

uint64_t ForYouFeature.environment.getter@<X0>(void *a1@<X8>)
{
  memcpy(__dst, v1, 0x130uLL);
  memcpy(a1, v1, 0x130uLL);
  return sub_24EFE4274((uint64_t)__dst);
}

void sub_24EFDC20C(uint64_t a1, uint64_t a2, unint64_t *a3, int a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8838);
  uint64_t v64 = *(void *)(v9 - 8);
  uint64_t v65 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v63 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v74, v4, 0x130uLL);
  uint64_t v11 = (int *)type metadata accessor for ForYouState();
  uint64_t v71 = v11[15];
  char v12 = *(unsigned char *)(a2 + v71);
  uint64_t v69 = v11[19];
  int v13 = *(unsigned __int8 *)(a2 + v69);
  uint64_t v66 = v11[6];
  int v14 = *(unsigned __int8 *)(a2 + v66);
  int v67 = v13;
  int v68 = v14;
  if (qword_26B1E8798 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_24EFED020();
  uint64_t v70 = __swift_project_value_buffer(v15, (uint64_t)qword_26B1EB990);
  uint64_t v16 = sub_24EFED000();
  os_log_type_t v17 = sub_24EFED660();
  BOOL v18 = os_log_type_enabled(v16, v17);
  int v62 = a4;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    unint64_t v61 = a3;
    uint64_t v21 = v20;
    v73[0] = v20;
    *(_DWORD *)uint64_t v19 = 136315650;
    uint64_t v60 = a1;
    LOBYTE(v72) = v12;
    uint64_t v22 = sub_24EFED540();
    uint64_t v72 = sub_24EFEB7F8(v22, v23, v73);
    sub_24EFED670();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    LOBYTE(v72) = v67;
    uint64_t v24 = sub_24EFED540();
    uint64_t v72 = sub_24EFEB7F8(v24, v25, v73);
    sub_24EFED670();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    LOBYTE(v72) = v68;
    uint64_t v26 = sub_24EFED540();
    uint64_t v72 = sub_24EFEB7F8(v26, v27, v73);
    a1 = v60;
    sub_24EFED670();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24EFA0000, v16, v17, "For You State — NetworkConditions: %s, SubscriptionState: %s, BrowsingIdentity: %s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    uint64_t v28 = v21;
    a3 = v61;
    MEMORY[0x253351EB0](v28, -1, -1);
    MEMORY[0x253351EB0](v19, -1, -1);
  }

  if (*(unsigned char *)(a2 + v71) == 1)
  {
    uint64_t v29 = sub_24EFED000();
    os_log_type_t v30 = sub_24EFED660();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      uint64_t v32 = "Current Network Conditions are unsupported for fetching section descriptors.";
LABEL_11:
      _os_log_impl(&dword_24EFA0000, v29, v30, v32, v31, 2u);
      MEMORY[0x253351EB0](v31, -1, -1);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (*(unsigned char *)(a2 + v69) == 2)
  {
    uint64_t v29 = sub_24EFED000();
    os_log_type_t v30 = sub_24EFED660();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      uint64_t v32 = "Current Subscription State is unsupported for fetching section descriptors.";
      goto LABEL_11;
    }
LABEL_12:

    return;
  }
  if ((*(unsigned char *)(a2 + v66) & 1) == 0 && (*(unsigned char *)(a2 + v11[20]) & 1) == 0)
  {
    uint64_t v36 = a2 + v11[12];
    uint64_t v37 = *(void *)v36;
    uint64_t v38 = *(void *)(v36 + 8);
    uint64_t v39 = *(void *)(v36 + 16);
    uint64_t v40 = *(void *)(a1 + 8);
    uint64_t v71 = *(void *)a1;
    uint64_t v41 = *(void *)(a1 + 16);
    char v42 = *(unsigned char *)(v36 + 24);
    char v43 = *(unsigned char *)(a1 + 24);
    sub_24EFA9C60(v37, v38, v39, v42);
    sub_24EFA9D44(v71, v40, v41, v43);
    *(void *)a1 = v37;
    *(void *)(a1 + 8) = v38;
    *(void *)(a1 + 16) = v39;
    *(unsigned char *)(a1 + 24) = v42;
    sub_24EFDC8E8(0, 0, 0, 2, a2);
    return;
  }
  uint64_t v33 = a2 + v11[12];
  uint64_t v34 = *(void *)(v33 + 16);
  if (*(unsigned char *)(v33 + 24))
  {
    if (*(unsigned char *)(v33 + 24) != 1 && v34 | *(void *)v33 | *(void *)(v33 + 8)) {
      return;
    }
    char v35 = *(unsigned char *)(a2 + v11[7]);
    goto LABEL_22;
  }
  char v35 = *(unsigned char *)(a2 + v11[7]);
  if ((v34 & 0xFE) == 0) {
LABEL_22:
  }
    sub_24EFDCC78(a1, a2);
  uint64_t v44 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88A8);
  uint64_t v45 = v63;
  uint64_t v46 = &v63[v44[16]];
  unint64_t v47 = &v63[v44[20]];
  unint64_t v48 = &v63[v44[24]];
  LOBYTE(v73[0]) = 2;
  sub_24EFE2B98();
  sub_24EFED690();
  sub_24EFED5F0();
  uint64_t v49 = *MEMORY[0x263F39590];
  uint64_t v50 = sub_24EFED4C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v50 - 8) + 104))(v46, v49, v50);
  uint64_t v51 = *MEMORY[0x263F39570];
  uint64_t v52 = sub_24EFED4B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v52 - 8) + 104))(v47, v51, v52);
  uint64_t v53 = (unsigned char *)swift_allocObject();
  memcpy(v53 + 16, v74, 0x130uLL);
  v53[320] = v62;
  v53[321] = v35;
  *(void *)unint64_t v48 = &unk_269998D48;
  *((void *)v48 + 1) = v53;
  uint64_t v55 = v64;
  uint64_t v54 = v65;
  (*(void (**)(char *, void, uint64_t))(v64 + 104))(v45, *MEMORY[0x263F39530], v65);
  unint64_t v56 = *a3;
  sub_24EFE4274((uint64_t)v74);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v56 = sub_24EFDBDCC(0, *(void *)(v56 + 16) + 1, 1, v56);
  }
  unint64_t v58 = *(void *)(v56 + 16);
  unint64_t v57 = *(void *)(v56 + 24);
  if (v58 >= v57 >> 1) {
    unint64_t v56 = sub_24EFDBDCC(v57 > 1, v58 + 1, 1, v56);
  }
  *(void *)(v56 + 16) = v58 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v55 + 32))(v56+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v58, v45, v54);
  *a3 = v56;
}

uint64_t sub_24EFDC8E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v9 = a5 + *(int *)(type metadata accessor for ForYouState() + 48);
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *(void *)(v9 + 8);
  uint64_t v12 = *(void *)(v9 + 16);
  char v13 = *(unsigned char *)(v9 + 24);
  sub_24EFA9C60(*(void *)v9, v11, v12, v13);
  if (qword_26B1E8798 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24EFED020();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B1EB990);
  sub_24EFA9C60(a1, a2, a3, a4);
  sub_24EFA9C60(v10, v11, v12, v13);
  sub_24EFA9C60(a1, a2, a3, a4);
  uint64_t v15 = sub_24EFED000();
  os_log_type_t type = sub_24EFED660();
  if (os_log_type_enabled(v15, type))
  {
    char v29 = a4;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v30 = v27;
    *(_DWORD *)uint64_t v16 = 136315394;
    sub_24EFA9C60(v10, v11, v12, v13);
    uint64_t v17 = sub_24EFED540();
    sub_24EFEB7F8(v17, v18, &v30);
    sub_24EFED670();
    swift_bridgeObjectRelease();
    sub_24EFA9D58(v10, v11, v12, v13);
    sub_24EFA9D58(v10, v11, v12, v13);
    *(_WORD *)(v16 + 12) = 2080;
    sub_24EFA9C60(a1, a2, a3, v29);
    uint64_t v19 = sub_24EFED540();
    sub_24EFEB7F8(v19, v20, &v30);
    sub_24EFED670();
    swift_bridgeObjectRelease();
    sub_24EFA9D58(a1, a2, a3, v29);
    sub_24EFA9D58(a1, a2, a3, v29);
    _os_log_impl(&dword_24EFA0000, v15, type, "Transitioning from %s to %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253351EB0](v27, -1, -1);
    uint64_t v21 = v16;
    a4 = v29;
    MEMORY[0x253351EB0](v21, -1, -1);
  }
  else
  {
    sub_24EFA9D58(v10, v11, v12, v13);
    sub_24EFA9D58(v10, v11, v12, v13);
    sub_24EFA9D58(a1, a2, a3, a4);
    sub_24EFA9D58(a1, a2, a3, a4);
  }
  uint64_t v22 = *(void *)v9;
  uint64_t v23 = *(void *)(v9 + 8);
  uint64_t v24 = *(void *)(v9 + 16);
  char v25 = *(unsigned char *)(v9 + 24);
  sub_24EFA9C60(a1, a2, a3, a4);
  uint64_t result = sub_24EFA9D58(v22, v23, v24, v25);
  *(void *)uint64_t v9 = a1;
  *(void *)(v9 + 8) = a2;
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = a4;
  return result;
}

uint64_t sub_24EFDCC78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v52 = a2;
  uint64_t v4 = sub_24EFECF90();
  int64_t v54 = *(void *)(v4 - 8);
  uint64_t v55 = v4;
  MEMORY[0x270FA5388](v4);
  unsigned int v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = type metadata accessor for ForYouState();
  uint64_t v7 = v2 + *(int *)(v53 + 48);
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *(void *)(v7 + 8);
  uint64_t v10 = *(void *)(v7 + 16);
  uint64_t v11 = *(void *)a1;
  uint64_t v51 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  char v13 = *(unsigned char *)(v7 + 24);
  LOBYTE(v2) = *(unsigned char *)(a1 + 24);
  sub_24EFA9C60(v8, v9, v10, v13);
  sub_24EFA9D44(v11, v51, v12, v2);
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v9;
  *(void *)(a1 + 16) = v10;
  *(unsigned char *)(a1 + 24) = v13;
  uint64_t v14 = v52;
  sub_24EFDC8E8(1, 0, 0, 2, v52);
  sub_24EFECF80();
  sub_24EFECF70();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v6, v55);
  sub_24EFED650();
  uint64_t v15 = v53;
  uint64_t v16 = v14 + *(int *)(v53 + 52);
  *(void *)(v16 + 16) = v17;
  *(unsigned char *)(v16 + 24) = 0;
  uint64_t v51 = *(int *)(v15 + 20);
  uint64_t v18 = *(void *)(v14 + v51);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v53 = v18 + 64;
  uint64_t v20 = 1 << *(unsigned char *)(v18 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & v19;
  int64_t v54 = (unint64_t)(v20 + 63) >> 6;
  uint64_t v55 = v18;
  swift_bridgeObjectRetain_n();
  int64_t v23 = 0;
  uint64_t v24 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v22)
    {
      unint64_t v27 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      unint64_t v28 = v27 | (v23 << 6);
    }
    else
    {
      int64_t v29 = v23 + 1;
      if (__OFADD__(v23, 1)) {
        goto LABEL_40;
      }
      if (v29 >= v54)
      {
LABEL_37:
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v49 = v51;
        uint64_t v48 = v52;
        uint64_t result = swift_bridgeObjectRelease();
        *(void *)(v48 + v49) = v24;
        return result;
      }
      unint64_t v30 = *(void *)(v53 + 8 * v29);
      ++v23;
      if (!v30)
      {
        int64_t v23 = v29 + 1;
        if (v29 + 1 >= v54) {
          goto LABEL_37;
        }
        unint64_t v30 = *(void *)(v53 + 8 * v23);
        if (!v30)
        {
          int64_t v23 = v29 + 2;
          if (v29 + 2 >= v54) {
            goto LABEL_37;
          }
          unint64_t v30 = *(void *)(v53 + 8 * v23);
          if (!v30)
          {
            int64_t v23 = v29 + 3;
            if (v29 + 3 >= v54) {
              goto LABEL_37;
            }
            unint64_t v30 = *(void *)(v53 + 8 * v23);
            if (!v30)
            {
              int64_t v23 = v29 + 4;
              if (v29 + 4 >= v54) {
                goto LABEL_37;
              }
              unint64_t v30 = *(void *)(v53 + 8 * v23);
              if (!v30)
              {
                int64_t v31 = v29 + 5;
                if (v31 >= v54) {
                  goto LABEL_37;
                }
                unint64_t v30 = *(void *)(v53 + 8 * v31);
                if (!v30)
                {
                  while (1)
                  {
                    int64_t v23 = v31 + 1;
                    if (__OFADD__(v31, 1)) {
                      goto LABEL_41;
                    }
                    if (v23 >= v54) {
                      goto LABEL_37;
                    }
                    unint64_t v30 = *(void *)(v53 + 8 * v23);
                    ++v31;
                    if (v30) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v23 = v31;
              }
            }
          }
        }
      }
LABEL_25:
      unint64_t v22 = (v30 - 1) & v30;
      unint64_t v28 = __clz(__rbit64(v30)) + (v23 << 6);
    }
    uint64_t v32 = (uint64_t *)(*(void *)(v55 + 48) + 16 * v28);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v56 = v24;
    unint64_t v37 = sub_24EFEC090(v34, v33);
    uint64_t v38 = v24[2];
    BOOL v39 = (v36 & 1) == 0;
    uint64_t v40 = v38 + v39;
    if (__OFADD__(v38, v39)) {
      break;
    }
    char v41 = v36;
    if (v24[3] >= v40)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v24 = v56;
        if (v36) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_24EFEC4E0();
        uint64_t v24 = v56;
        if (v41) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_24EFEC1EC(v40, isUniquelyReferenced_nonNull_native);
      unint64_t v42 = sub_24EFEC090(v34, v33);
      if ((v41 & 1) != (v43 & 1)) {
        goto LABEL_42;
      }
      unint64_t v37 = v42;
      uint64_t v24 = v56;
      if (v41)
      {
LABEL_4:
        uint64_t v25 = v24[7];
        unint64_t v26 = *(void *)(v25 + 8 * v37);
        *(void *)(v25 + 8 * v37) = 1;
        sub_24EFC8E94(v26);
        goto LABEL_5;
      }
    }
    v24[(v37 >> 6) + 8] |= 1 << v37;
    uint64_t v44 = (uint64_t *)(v24[6] + 16 * v37);
    uint64_t *v44 = v34;
    v44[1] = v33;
    *(void *)(v24[7] + 8 * v37) = 1;
    uint64_t v45 = v24[2];
    BOOL v46 = __OFADD__(v45, 1);
    uint64_t v47 = v45 + 1;
    if (v46) {
      goto LABEL_39;
    }
    uint64_t v24[2] = v47;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  uint64_t result = sub_24EFED8C0();
  __break(1u);
  return result;
}

uint64_t sub_24EFDD0F0(uint64_t a1, uint64_t a2, char a3, char a4)
{
  *(unsigned char *)(v4 + 107) = a4;
  *(unsigned char *)(v4 + 106) = a3;
  *(void *)(v4 + 648) = a2;
  *(void *)(v4 + 640) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 656) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24EFDD194;
  v6.n128_u64[0] = 0.5;
  return MEMORY[0x270F5EA48](v6);
}

uint64_t sub_24EFDD194()
{
  uint64_t v2 = (void *)*v1;
  int v3 = (void *)*v1;
  swift_task_dealloc();
  if (v0) {
    MEMORY[0x253351CE0](v0);
  }
  uint64_t v4 = (void *)v2[81];
  v2[83] = *v4;
  v2[84] = v4[1];
  v2[85] = v4[30];
  v2[86] = v4[31];
  v2[87] = v4[32];
  v2[88] = v4[33];
  v2[89] = v4[34];
  v2[90] = v4[35];
  uint64_t v7 = (uint64_t (*)(void))(v4[36] + *(int *)v4[36]);
  uint64_t v5 = (void *)swift_task_alloc();
  v2[91] = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_24EFDD34C;
  return v7();
}

uint64_t sub_24EFDD34C(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 736) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24EFDF924;
  }
  else
  {
    *(unsigned char *)(v4 + 108) = a1 & 1;
    uint64_t v5 = sub_24EFDD478;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24EFDD478()
{
  uint64_t v26 = v0;
  if (*(unsigned char *)(v0 + 108) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 736);
    sub_24EFED630();
    if (v1)
    {
      *(void *)(v0 + 880) = v1;
      if (qword_26B1E8798 != -1) {
        swift_once();
      }
      uint64_t v2 = (unsigned char *)(v0 + 105);
      uint64_t v3 = sub_24EFED020();
      __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
      id v4 = v1;
      id v5 = v1;
      __n128 v6 = sub_24EFED000();
      os_log_type_t v7 = sub_24EFED660();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        uint64_t v9 = swift_slowAlloc();
        uint64_t v25 = v9;
        *(_DWORD *)uint64_t v8 = 136315138;
        swift_getErrorValue();
        uint64_t v10 = sub_24EFED8F0();
        *(void *)(v0 + 592) = sub_24EFEB7F8(v10, v11, &v25);
        sub_24EFED670();
        swift_bridgeObjectRelease();
        MEMORY[0x253351CE0](v1);
        MEMORY[0x253351CE0](v1);
        _os_log_impl(&dword_24EFA0000, v6, v7, "Failed to fetched descriptors with error: %s", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253351EB0](v9, -1, -1);
        MEMORY[0x253351EB0](v8, -1, -1);
      }
      else
      {
        MEMORY[0x253351CE0](v1);
        MEMORY[0x253351CE0](v1);
      }

      *(void *)(v0 + 600) = v1;
      id v16 = v1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269998D50);
      if (!swift_dynamicCast()) {
        goto LABEL_18;
      }
      if (!*v2)
      {
        uint64_t v17 = v0 + 256;
        *(_OWORD *)(v0 + 256) = xmmword_24EFF4700;
        *(void *)(v0 + 280) = 0;
        *(void *)(v0 + 288) = 0;
        *(void *)(v0 + 272) = 2;
        *(unsigned char *)(v0 + 296) = 1;
        uint64_t v18 = (void *)swift_task_alloc();
        *(void *)(v0 + 912) = v18;
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
        *(void *)(v0 + 920) = v19;
        *uint64_t v18 = v0;
        uint64_t v20 = sub_24EFDF558;
        goto LABEL_20;
      }
      if (*v2 == 1)
      {
        uint64_t v17 = v0 + 352;
        *(void *)(v0 + 352) = 0;
        *(void *)(v0 + 360) = 0;
        *(void *)(v0 + 376) = 0;
        *(void *)(v0 + 384) = 0;
        *(void *)(v0 + 368) = 2;
        *(unsigned char *)(v0 + 392) = 1;
        uint64_t v18 = (void *)swift_task_alloc();
        *(void *)(v0 + 888) = v18;
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
        *(void *)(v0 + 896) = v19;
        *uint64_t v18 = v0;
        uint64_t v20 = sub_24EFDF274;
      }
      else
      {
LABEL_18:
        MEMORY[0x253351CE0](*(void *)(v0 + 600));
        swift_getErrorValue();
        uint64_t v21 = sub_24EFED8F0();
        *(void *)(v0 + 936) = v22;
        *(void *)(v0 + 208) = v21;
        uint64_t v17 = v0 + 208;
        *(void *)(v0 + 216) = v22;
        *(void *)(v0 + 224) = 0;
        *(void *)(v0 + 232) = 0;
        *(void *)(v0 + 240) = 0;
        *(unsigned char *)(v0 + 248) = 3;
        uint64_t v18 = (void *)swift_task_alloc();
        *(void *)(v0 + 944) = v18;
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
        *uint64_t v18 = v0;
        uint64_t v20 = sub_24EFDF7A8;
      }
LABEL_20:
      v18[1] = v20;
      return MEMORY[0x270F252C8](v17, v19);
    }
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v0 + 664) + **(int **)(v0 + 664));
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 744) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_24EFDDA0C;
    uint64_t v15 = *(unsigned __int8 *)(v0 + 106);
    return v24(v0 + 16, v15);
  }
  else
  {
    int64_t v23 = (uint64_t (*)(void))(*(void *)(v0 + 680) + **(int **)(v0 + 680));
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 864) = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_24EFDEFFC;
    return v23();
  }
}

uint64_t sub_24EFDDA0C()
{
  *(void *)(*(void *)v1 + 752) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24EFDFD2C;
  }
  else {
    uint64_t v2 = sub_24EFDDB20;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24EFDDB20()
{
  uint64_t v26 = v0;
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 760) = *(void *)(v0 + 16);
  *(void *)(v0 + 768) = v1;
  uint64_t v2 = *(void *)(v0 + 40);
  *(void *)(v0 + 776) = *(void *)(v0 + 32);
  *(void *)(v0 + 784) = v2;
  *(_OWORD *)(v0 + 792) = *(_OWORD *)(v0 + 48);
  if (*(void *)(v1 + 16))
  {
    *(void *)(v0 + 496) = 3;
    *(_OWORD *)(v0 + 504) = 0u;
    *(_OWORD *)(v0 + 520) = 0u;
    *(unsigned char *)(v0 + 536) = 8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 808) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *(void *)(v0 + 816) = v4;
    *uint64_t v3 = v0;
    v3[1] = sub_24EFDE030;
    uint64_t v5 = v0 + 496;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24EFECEE8();
  __n128 v6 = (void *)swift_allocError();
  *os_log_type_t v7 = 2;
  swift_willThrow();
  *(void *)(v0 + 880) = v6;
  if (qword_26B1E8798 != -1) {
    swift_once();
  }
  uint64_t v8 = (unsigned char *)(v0 + 105);
  uint64_t v9 = sub_24EFED020();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B1EB990);
  id v10 = v6;
  id v11 = v6;
  uint64_t v12 = sub_24EFED000();
  os_log_type_t v13 = sub_24EFED660();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_getErrorValue();
    uint64_t v16 = sub_24EFED8F0();
    *(void *)(v0 + 592) = sub_24EFEB7F8(v16, v17, &v25);
    sub_24EFED670();
    swift_bridgeObjectRelease();
    MEMORY[0x253351CE0](v6);
    MEMORY[0x253351CE0](v6);
    _os_log_impl(&dword_24EFA0000, v12, v13, "Failed to fetched descriptors with error: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253351EB0](v15, -1, -1);
    MEMORY[0x253351EB0](v14, -1, -1);
  }
  else
  {
    MEMORY[0x253351CE0](v6);
    MEMORY[0x253351CE0](v6);
  }

  *(void *)(v0 + 600) = v6;
  id v18 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998D50);
  if (!swift_dynamicCast()) {
    goto LABEL_12;
  }
  if (!*v8)
  {
    uint64_t v19 = v0 + 256;
    *(_OWORD *)(v0 + 256) = xmmword_24EFF4700;
    *(void *)(v0 + 280) = 0;
    *(void *)(v0 + 288) = 0;
    *(void *)(v0 + 272) = 2;
    *(unsigned char *)(v0 + 296) = 1;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 912) = v20;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *(void *)(v0 + 920) = v4;
    *uint64_t v20 = v0;
    uint64_t v21 = sub_24EFDF558;
    goto LABEL_14;
  }
  if (*v8 == 1)
  {
    uint64_t v19 = v0 + 352;
    *(void *)(v0 + 352) = 0;
    *(void *)(v0 + 360) = 0;
    *(void *)(v0 + 376) = 0;
    *(void *)(v0 + 384) = 0;
    *(void *)(v0 + 368) = 2;
    *(unsigned char *)(v0 + 392) = 1;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 888) = v20;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *(void *)(v0 + 896) = v4;
    *uint64_t v20 = v0;
    uint64_t v21 = sub_24EFDF274;
  }
  else
  {
LABEL_12:
    MEMORY[0x253351CE0](*(void *)(v0 + 600));
    swift_getErrorValue();
    uint64_t v22 = sub_24EFED8F0();
    *(void *)(v0 + 936) = v23;
    *(void *)(v0 + 208) = v22;
    uint64_t v19 = v0 + 208;
    *(void *)(v0 + 216) = v23;
    *(void *)(v0 + 224) = 0;
    *(void *)(v0 + 232) = 0;
    *(void *)(v0 + 240) = 0;
    *(unsigned char *)(v0 + 248) = 3;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 944) = v20;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v20 = v0;
    uint64_t v21 = sub_24EFDF7A8;
  }
LABEL_14:
  v20[1] = v21;
  uint64_t v5 = v19;
LABEL_15:
  return MEMORY[0x270F252C8](v5, v4);
}

uint64_t sub_24EFDE030()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  *(void *)(v1 + 448) = 1;
  *(_OWORD *)(v1 + 456) = 0u;
  *(_OWORD *)(v1 + 472) = 0u;
  *(unsigned char *)(v1 + 488) = 8;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 824) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24EFDE1AC;
  uint64_t v4 = *(void *)(v1 + 816);
  return MEMORY[0x270F252C8](v1 + 448, v4);
}

uint64_t sub_24EFDE1AC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24EFDE2A8, 0, 0);
}

uint64_t sub_24EFDE2A8()
{
  uint64_t v41 = v0;
  uint64_t v1 = *(void **)(v0 + 752);
  sub_24EFED630();
  if (v1)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 880) = v1;
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v2 = (unsigned char *)(v0 + 105);
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    id v4 = v1;
    id v5 = v1;
    uint64_t v6 = sub_24EFED000();
    os_log_type_t v7 = sub_24EFED660();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      v40[0] = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_getErrorValue();
      uint64_t v10 = sub_24EFED8F0();
      *(void *)(v0 + 592) = sub_24EFEB7F8(v10, v11, v40);
      sub_24EFED670();
      swift_bridgeObjectRelease();
      MEMORY[0x253351CE0](v1);
      MEMORY[0x253351CE0](v1);
      _os_log_impl(&dword_24EFA0000, v6, v7, "Failed to fetched descriptors with error: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253351EB0](v9, -1, -1);
      MEMORY[0x253351EB0](v8, -1, -1);
    }
    else
    {
      MEMORY[0x253351CE0](v1);
      MEMORY[0x253351CE0](v1);
    }

    *(void *)(v0 + 600) = v1;
    id v21 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269998D50);
    if (!swift_dynamicCast()) {
      goto LABEL_15;
    }
    if (!*v2)
    {
      uint64_t v22 = v0 + 256;
      *(_OWORD *)(v0 + 256) = xmmword_24EFF4700;
      *(void *)(v0 + 280) = 0;
      *(void *)(v0 + 288) = 0;
      *(void *)(v0 + 272) = 2;
      *(unsigned char *)(v0 + 296) = 1;
      uint64_t v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 912) = v23;
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
      *(void *)(v0 + 920) = v24;
      *uint64_t v23 = v0;
      uint64_t v25 = sub_24EFDF558;
      goto LABEL_16;
    }
    if (*v2 == 1)
    {
      uint64_t v22 = v0 + 352;
      *(void *)(v0 + 352) = 0;
      *(void *)(v0 + 360) = 0;
      *(void *)(v0 + 376) = 0;
      *(void *)(v0 + 384) = 0;
      *(void *)(v0 + 368) = 2;
      *(unsigned char *)(v0 + 392) = 1;
      uint64_t v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 888) = v23;
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
      *(void *)(v0 + 896) = v24;
      *uint64_t v23 = v0;
      uint64_t v25 = sub_24EFDF274;
    }
    else
    {
LABEL_15:
      MEMORY[0x253351CE0](*(void *)(v0 + 600));
      swift_getErrorValue();
      uint64_t v26 = sub_24EFED8F0();
      *(void *)(v0 + 936) = v27;
      *(void *)(v0 + 208) = v26;
      uint64_t v22 = v0 + 208;
      *(void *)(v0 + 216) = v27;
      *(void *)(v0 + 224) = 0;
      *(void *)(v0 + 232) = 0;
      *(void *)(v0 + 240) = 0;
      *(unsigned char *)(v0 + 248) = 3;
      uint64_t v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 944) = v23;
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
      *uint64_t v23 = v0;
      uint64_t v25 = sub_24EFDF7A8;
    }
LABEL_16:
    v23[1] = v25;
    goto LABEL_22;
  }
  if (qword_26B1E8798 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24EFED020();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B1EB990);
  swift_bridgeObjectRetain_n();
  os_log_type_t v13 = sub_24EFED000();
  os_log_type_t v14 = sub_24EFED660();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v40[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x253351670](v17, &type metadata for CanvasSectionDescriptor);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 632) = sub_24EFEB7F8(v18, v20, v40);
    sub_24EFED670();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24EFA0000, v13, v14, "Fetched descriptors: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253351EB0](v16, -1, -1);
    MEMORY[0x253351EB0](v15, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRetain_n();
  unint64_t v28 = sub_24EFED000();
  os_log_type_t v29 = sub_24EFED660();
  if (os_log_type_enabled(v28, v29))
  {
    unint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v40[0] = v31;
    *(_DWORD *)unint64_t v30 = 136315138;
    uint64_t v32 = swift_bridgeObjectRetain();
    uint64_t v33 = MEMORY[0x253351670](v32, &type metadata for AwardCanvasSectionDescriptor);
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 624) = sub_24EFEB7F8(v33, v35, v40);
    sub_24EFED670();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24EFA0000, v28, v29, "Fetched award descriptors: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253351EB0](v31, -1, -1);
    MEMORY[0x253351EB0](v30, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v36 = *(void *)(v0 + 784);
  uint64_t v37 = *(void *)(v0 + 768);
  *(void *)(v0 + 112) = *(void *)(v0 + 776);
  uint64_t v22 = v0 + 112;
  *(void *)(v0 + 120) = v36;
  *(_OWORD *)(v0 + 128) = *(_OWORD *)(v0 + 792);
  *(void *)(v0 + 144) = v37;
  *(unsigned char *)(v0 + 152) = 5;
  swift_bridgeObjectRetain();
  uint64_t v38 = (void *)swift_task_alloc();
  *(void *)(v0 + 832) = v38;
  *uint64_t v38 = v0;
  v38[1] = sub_24EFDEA3C;
  uint64_t v24 = *(void *)(v0 + 816);
LABEL_22:
  return MEMORY[0x270F252C8](v22, v24);
}

uint64_t sub_24EFDEA3C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 760);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  *(void *)(v1 + 64) = v2;
  uint64_t v3 = v1 + 64;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  *(unsigned char *)(v3 + 40) = 4;
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 776) = v4;
  *id v4 = v7;
  v4[1] = sub_24EFDEBF8;
  uint64_t v5 = *(void *)(v3 + 752);
  return MEMORY[0x270F252C8](v3, v5);
}

uint64_t sub_24EFDEBF8()
{
  uint64_t v1 = (void *)*v0;
  int v2 = *(unsigned __int8 *)(*v0 + 107);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v2 == 1)
  {
    uint64_t v7 = (uint64_t (*)(void))(v1[89] + *(int *)v1[89]);
    id v4 = (void *)swift_task_alloc();
    v1[106] = v4;
    *id v4 = v3;
    v4[1] = sub_24EFDEE0C;
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(void))(v1[87] + *(int *)v1[87]);
    uint64_t v5 = (void *)swift_task_alloc();
    v1[107] = v5;
    *uint64_t v5 = v3;
    v5[1] = sub_24EFDEF04;
  }
  return v7();
}

uint64_t sub_24EFDEE0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EFDEF04()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EFDEFFC(unsigned __int8 a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    MEMORY[0x253351CE0](v1);
    a1 = 4;
  }
  *(void *)(v4 + 304) = a1;
  *(void *)(v4 + 312) = 0;
  *(void *)(v4 + 328) = 0;
  *(void *)(v4 + 336) = 0;
  *(void *)(v4 + 320) = 1;
  *(unsigned char *)(v4 + 344) = 1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 872) = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
  *uint64_t v6 = v5;
  v6[1] = sub_24EFDF17C;
  return MEMORY[0x270F252C8](v4 + 304, v7);
}

uint64_t sub_24EFDF17C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EFDF274()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  *(void *)(v1 + 400) = 5;
  *(_OWORD *)(v1 + 408) = 0u;
  *(_OWORD *)(v1 + 424) = 0u;
  *(unsigned char *)(v1 + 440) = 8;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 904) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24EFDF3F0;
  uint64_t v4 = *(void *)(v1 + 896);
  return MEMORY[0x270F252C8](v1 + 400, v4);
}

uint64_t sub_24EFDF3F0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24EFDF4EC, 0, 0);
}

uint64_t sub_24EFDF4EC()
{
  MEMORY[0x253351CE0](v0[110]);
  MEMORY[0x253351CE0](v0[75]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24EFDF558()
{
  uint64_t v1 = *v0;
  uint64_t v6 = *v0;
  swift_task_dealloc();
  *(void *)(v1 + 160) = 5;
  uint64_t v2 = v1 + 160;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(unsigned char *)(v2 + 40) = 8;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 768) = v3;
  *uint64_t v3 = v6;
  v3[1] = sub_24EFDF6AC;
  uint64_t v4 = *(void *)(v2 + 760);
  return MEMORY[0x270F252C8](v2, v4);
}

uint64_t sub_24EFDF6AC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24EFECF3C, 0, 0);
}

uint64_t sub_24EFDF7A8()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24EFDF8C0, 0, 0);
}

uint64_t sub_24EFDF8C0()
{
  MEMORY[0x253351CE0](*(void *)(v0 + 880));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EFDF924()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(void **)(v0 + 736);
  *(void *)(v0 + 880) = v1;
  if (qword_26B1E8798 != -1) {
    swift_once();
  }
  uint64_t v2 = (unsigned char *)(v0 + 105);
  uint64_t v3 = sub_24EFED020();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
  id v4 = v1;
  id v5 = v1;
  uint64_t v6 = sub_24EFED000();
  os_log_type_t v7 = sub_24EFED660();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v20 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v10 = sub_24EFED8F0();
    *(void *)(v0 + 592) = sub_24EFEB7F8(v10, v11, &v20);
    sub_24EFED670();
    swift_bridgeObjectRelease();
    MEMORY[0x253351CE0](v1);
    MEMORY[0x253351CE0](v1);
    _os_log_impl(&dword_24EFA0000, v6, v7, "Failed to fetched descriptors with error: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253351EB0](v9, -1, -1);
    MEMORY[0x253351EB0](v8, -1, -1);
  }
  else
  {
    MEMORY[0x253351CE0](v1);
    MEMORY[0x253351CE0](v1);
  }

  *(void *)(v0 + 600) = v1;
  id v12 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998D50);
  if (!swift_dynamicCast())
  {
LABEL_10:
    MEMORY[0x253351CE0](*(void *)(v0 + 600));
    swift_getErrorValue();
    uint64_t v17 = sub_24EFED8F0();
    *(void *)(v0 + 936) = v18;
    *(void *)(v0 + 208) = v17;
    uint64_t v13 = v0 + 208;
    *(void *)(v0 + 216) = v18;
    *(void *)(v0 + 224) = 0;
    *(void *)(v0 + 232) = 0;
    *(void *)(v0 + 240) = 0;
    *(unsigned char *)(v0 + 248) = 3;
    os_log_type_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 944) = v14;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *os_log_type_t v14 = v0;
    uint64_t v16 = sub_24EFDF7A8;
    goto LABEL_12;
  }
  if (*v2)
  {
    if (*v2 == 1)
    {
      uint64_t v13 = v0 + 352;
      *(void *)(v0 + 352) = 0;
      *(void *)(v0 + 360) = 0;
      *(void *)(v0 + 376) = 0;
      *(void *)(v0 + 384) = 0;
      *(void *)(v0 + 368) = 2;
      *(unsigned char *)(v0 + 392) = 1;
      os_log_type_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 888) = v14;
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
      *(void *)(v0 + 896) = v15;
      *os_log_type_t v14 = v0;
      uint64_t v16 = sub_24EFDF274;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  uint64_t v13 = v0 + 256;
  *(_OWORD *)(v0 + 256) = xmmword_24EFF4700;
  *(void *)(v0 + 280) = 0;
  *(void *)(v0 + 288) = 0;
  *(void *)(v0 + 272) = 2;
  *(unsigned char *)(v0 + 296) = 1;
  os_log_type_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 912) = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
  *(void *)(v0 + 920) = v15;
  *os_log_type_t v14 = v0;
  uint64_t v16 = sub_24EFDF558;
LABEL_12:
  v14[1] = v16;
  return MEMORY[0x270F252C8](v13, v15);
}

uint64_t sub_24EFDFD2C()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(void **)(v0 + 752);
  *(void *)(v0 + 880) = v1;
  if (qword_26B1E8798 != -1) {
    swift_once();
  }
  uint64_t v2 = (unsigned char *)(v0 + 105);
  uint64_t v3 = sub_24EFED020();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
  id v4 = v1;
  id v5 = v1;
  uint64_t v6 = sub_24EFED000();
  os_log_type_t v7 = sub_24EFED660();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v20 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v10 = sub_24EFED8F0();
    *(void *)(v0 + 592) = sub_24EFEB7F8(v10, v11, &v20);
    sub_24EFED670();
    swift_bridgeObjectRelease();
    MEMORY[0x253351CE0](v1);
    MEMORY[0x253351CE0](v1);
    _os_log_impl(&dword_24EFA0000, v6, v7, "Failed to fetched descriptors with error: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253351EB0](v9, -1, -1);
    MEMORY[0x253351EB0](v8, -1, -1);
  }
  else
  {
    MEMORY[0x253351CE0](v1);
    MEMORY[0x253351CE0](v1);
  }

  *(void *)(v0 + 600) = v1;
  id v12 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269998D50);
  if (!swift_dynamicCast())
  {
LABEL_10:
    MEMORY[0x253351CE0](*(void *)(v0 + 600));
    swift_getErrorValue();
    uint64_t v17 = sub_24EFED8F0();
    *(void *)(v0 + 936) = v18;
    *(void *)(v0 + 208) = v17;
    uint64_t v13 = v0 + 208;
    *(void *)(v0 + 216) = v18;
    *(void *)(v0 + 224) = 0;
    *(void *)(v0 + 232) = 0;
    *(void *)(v0 + 240) = 0;
    *(unsigned char *)(v0 + 248) = 3;
    os_log_type_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 944) = v14;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *os_log_type_t v14 = v0;
    uint64_t v16 = sub_24EFDF7A8;
    goto LABEL_12;
  }
  if (*v2)
  {
    if (*v2 == 1)
    {
      uint64_t v13 = v0 + 352;
      *(void *)(v0 + 352) = 0;
      *(void *)(v0 + 360) = 0;
      *(void *)(v0 + 376) = 0;
      *(void *)(v0 + 384) = 0;
      *(void *)(v0 + 368) = 2;
      *(unsigned char *)(v0 + 392) = 1;
      os_log_type_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 888) = v14;
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
      *(void *)(v0 + 896) = v15;
      *os_log_type_t v14 = v0;
      uint64_t v16 = sub_24EFDF274;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  uint64_t v13 = v0 + 256;
  *(_OWORD *)(v0 + 256) = xmmword_24EFF4700;
  *(void *)(v0 + 280) = 0;
  *(void *)(v0 + 288) = 0;
  *(void *)(v0 + 272) = 2;
  *(unsigned char *)(v0 + 296) = 1;
  os_log_type_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 912) = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
  *(void *)(v0 + 920) = v15;
  *os_log_type_t v14 = v0;
  uint64_t v16 = sub_24EFDF558;
LABEL_12:
  v14[1] = v16;
  return MEMORY[0x270F252C8](v13, v15);
}

void ForYouFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, unint64_t *a3, long long *a4)
{
  id v5 = v4;
  long long v374 = a3;
  uint64_t v375 = a2;
  *(void *)&long long v376 = a1;
  sub_24EFAFDA0(a4, &v379);
  long long v370 = v379;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8898);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v368 = (char *)&v349 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (unint64_t *)sub_24EFECF90();
  uint64_t v371 = *(v9 - 1);
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = (char *)&v349 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8838);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v372 = v12;
  uint64_t v373 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v367 = (char *)&v349 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v366 = (char *)&v349 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v359 = (char *)&v349 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  long long v365 = (char *)&v349 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  char v364 = (char *)&v349 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v358 = (char *)&v349 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v363 = (char *)&v349 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v362 = (char *)&v349 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v357 = (char *)&v349 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v361 = (char *)&v349 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  unint64_t v360 = (char *)&v349 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&v349 - v37;
  uint64_t v39 = MEMORY[0x270FA5388](v36);
  uint64_t v41 = (char *)&v349 - v40;
  uint64_t v42 = MEMORY[0x270FA5388](v39);
  uint64_t v44 = (char *)&v349 - v43;
  uint64_t v45 = MEMORY[0x270FA5388](v42);
  uint64_t v47 = (char *)&v349 - v46;
  MEMORY[0x270FA5388](v45);
  uint64_t v49 = (char *)&v349 - v48;
  memcpy(v386, v5, 0x130uLL);
  uint64_t v369 = a4;
  sub_24EFAFDA0(a4, &v380);
  uint64_t v50 = (unint64_t *)v380;
  switch(v384)
  {
    case 1:
      uint64_t v372 = v381;
      uint64_t v373 = *((void *)&v380 + 1);
      uint64_t v103 = v375 + *(int *)(type metadata accessor for ForYouState() + 48);
      uint64_t v104 = *(void *)v103;
      uint64_t v105 = *(void *)(v103 + 8);
      uint64_t v106 = *(void *)(v103 + 16);
      long long v374 = v50;
      uint64_t v107 = v376;
      uint64_t v108 = *(void *)v376;
      uint64_t v109 = *(void *)(v376 + 8);
      uint64_t v110 = *(void *)(v376 + 16);
      char v111 = *(unsigned char *)(v103 + 24);
      char v112 = *(unsigned char *)(v376 + 24);
      sub_24EFA9C60(v104, v105, v106, v111);
      sub_24EFA9D44(v108, v109, v110, v112);
      *(void *)uint64_t v107 = v104;
      *(void *)(v107 + 8) = v105;
      *(void *)(v107 + 16) = v106;
      *(unsigned char *)(v107 + 24) = v111;
      uint64_t v114 = v373;
      uint64_t v113 = v374;
      uint64_t v115 = v372;
      char v116 = 0;
      goto LABEL_31;
    case 2:
      memcpy(v378, v386, sizeof(v378));
      sub_24EFDC20C(v376, v375, v374, v380);
      return;
    case 3:
      uint64_t v86 = *((void *)&v380 + 1);
      uint64_t v87 = v375 + *(int *)(type metadata accessor for ForYouState() + 48);
      if (!*(unsigned char *)(v87 + 24) && (*(void *)(v87 + 16) & 0xFELL) != 0)
      {
        unint64_t v159 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88A8);
        uint64_t v160 = &v44[v159[16]];
        uint64_t v161 = &v44[v159[20]];
        uint64_t v162 = &v44[v159[24]];
        LOBYTE(v378[0]) = 19;
        sub_24EFE2B98();
        sub_24EFED690();
        sub_24EFED5F0();
        uint64_t v163 = *MEMORY[0x263F39590];
        uint64_t v164 = sub_24EFED4C0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v164 - 8) + 104))(v160, v163, v164);
        uint64_t v165 = *MEMORY[0x263F39570];
        uint64_t v166 = sub_24EFED4B0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v166 - 8) + 104))(v161, v165, v166);
        *(void *)uint64_t v162 = &unk_269998D18;
        *((void *)v162 + 1) = 0;
        uint64_t v167 = v372;
        uint64_t v168 = v373;
        (*(void (**)(char *, void, uint64_t))(v373 + 104))(v44, *MEMORY[0x263F39530], v372);
        unint64_t v169 = *v374;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v169 = sub_24EFDBDCC(0, *(void *)(v169 + 16) + 1, 1, v169);
        }
        unint64_t v171 = *(void *)(v169 + 16);
        unint64_t v170 = *(void *)(v169 + 24);
        if (v171 >= v170 >> 1) {
          unint64_t v169 = sub_24EFDBDCC(v170 > 1, v171 + 1, 1, v169);
        }
        *(void *)(v169 + 16) = v171 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v168 + 32))(v169+ ((*(unsigned __int8 *)(v168 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v168 + 80))+ *(void *)(v168 + 72) * v171, v44, v167);
        goto LABEL_74;
      }
      long long v88 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88A8);
      long long v89 = &v47[v88[16]];
      long long v90 = &v47[v88[20]];
      long long v91 = &v47[v88[24]];
      LOBYTE(v378[0]) = 3;
      sub_24EFE2B98();
      swift_bridgeObjectRetain();
      sub_24EFED690();
      sub_24EFED5F0();
      uint64_t v92 = *MEMORY[0x263F39590];
      uint64_t v93 = sub_24EFED4C0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v93 - 8) + 104))(v89, v92, v93);
      uint64_t v94 = *MEMORY[0x263F39570];
      uint64_t v95 = sub_24EFED4B0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v95 - 8) + 104))(v90, v94, v95);
      uint64_t v96 = swift_allocObject();
      *(void *)(v96 + 16) = v50;
      *(void *)(v96 + 24) = v86;
      *(void *)long long v91 = &unk_269998D28;
      *((void *)v91 + 1) = v96;
      uint64_t v97 = v372;
      uint64_t v98 = v373;
      (*(void (**)(char *, void, uint64_t))(v373 + 104))(v47, *MEMORY[0x263F39530], v372);
      uint64_t v99 = v374;
      unint64_t v100 = *v374;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v100 = sub_24EFDBDCC(0, *(void *)(v100 + 16) + 1, 1, v100);
      }
      unint64_t v102 = *(void *)(v100 + 16);
      unint64_t v101 = *(void *)(v100 + 24);
      if (v102 >= v101 >> 1) {
        unint64_t v100 = sub_24EFDBDCC(v101 > 1, v102 + 1, 1, v100);
      }
      *(void *)(v100 + 16) = v102 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v98 + 32))(v100+ ((*(unsigned __int8 *)(v98 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80))+ *(void *)(v98 + 72) * v102, v47, v97);
      goto LABEL_51;
    case 4:
      uint64_t v64 = *(void *)(v380 + 16);
      if (!v64)
      {
        uint64_t v65 = MEMORY[0x263F8EE80];
        goto LABEL_54;
      }
      swift_bridgeObjectRetain();
      uint64_t v65 = MEMORY[0x263F8EE80];
      uint64_t v66 = (uint64_t *)(v50 + 8);
      long long v376 = xmmword_24EFF4710;
      while (1)
      {
        uint64_t v9 = (unint64_t *)*(v66 - 2);
        uint64_t v38 = (char *)*(v66 - 1);
        uint64_t v69 = *v66;
        uint64_t v71 = *(v66 - 4);
        uint64_t v70 = *(v66 - 3);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8970);
        uint64_t v72 = swift_allocObject();
        *(_OWORD *)(v72 + 16) = v376;
        *(void *)(v72 + 32) = v71;
        *(void *)(v72 + 40) = v70;
        *(void *)(v72 + 48) = v9;
        *(void *)(v72 + 56) = v38;
        *(void *)(v72 + 64) = v69;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        unint64_t v11 = (char *)v65;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v378[0] = v65;
        unint64_t v75 = sub_24EFEC090((uint64_t)v9, (uint64_t)v38);
        uint64_t v76 = *(void *)(v65 + 16);
        BOOL v77 = (v74 & 1) == 0;
        uint64_t v78 = v76 + v77;
        if (__OFADD__(v76, v77))
        {
          __break(1u);
          goto LABEL_105;
        }
        uint64_t v51 = v74;
        if (*((void *)v11 + 3) >= v78)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            uint64_t v81 = (void *)v378[0];
            if ((v74 & 1) == 0) {
              goto LABEL_19;
            }
          }
          else
          {
            sub_24EFEC4E0();
            uint64_t v81 = (void *)v378[0];
            if ((v51 & 1) == 0) {
              goto LABEL_19;
            }
          }
        }
        else
        {
          sub_24EFEC1EC(v78, isUniquelyReferenced_nonNull_native);
          unint64_t v79 = sub_24EFEC090((uint64_t)v9, (uint64_t)v38);
          if ((v51 & 1) != (v80 & 1))
          {
            sub_24EFED8C0();
            __break(1u);
            JUMPOUT(0x24EFE2B74);
          }
          unint64_t v75 = v79;
          uint64_t v81 = (void *)v378[0];
          if ((v51 & 1) == 0)
          {
LABEL_19:
            v81[(v75 >> 6) + 8] |= 1 << v75;
            char v82 = (unint64_t **)(v81[6] + 16 * v75);
            *char v82 = v9;
            v82[1] = (unint64_t *)v38;
            *(void *)(v81[7] + 8 * v75) = v72;
            uint64_t v83 = v81[2];
            BOOL v84 = __OFADD__(v83, 1);
            uint64_t v85 = v83 + 1;
            if (v84)
            {
              __break(1u);
LABEL_156:
              swift_once();
LABEL_3:
              uint64_t v52 = sub_24EFED020();
              __swift_project_value_buffer(v52, (uint64_t)qword_26B1EB990);
              uint64_t v53 = sub_24EFED000();
              os_log_type_t v54 = sub_24EFED660();
              if (os_log_type_enabled(v53, v54))
              {
                uint64_t v55 = (uint8_t *)swift_slowAlloc();
                uint64_t v56 = swift_slowAlloc();
                v378[0] = v56;
                *(_DWORD *)uint64_t v55 = 136315138;
                LOBYTE(v377) = v385;
                uint64_t v57 = sub_24EFED540();
                uint64_t v377 = sub_24EFEB7F8(v57, v58, v378);
                sub_24EFED670();
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_24EFA0000, v53, v54, "Browsing Identity Updated to state: %s", v55, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x253351EB0](v56, -1, -1);
                MEMORY[0x253351EB0](v55, -1, -1);
              }

              uint64_t v59 = v375;
              uint64_t v60 = (int *)type metadata accessor for ForYouState();
              if (*(unsigned char *)(v59 + v60[6]) & 1) != 0 || (*(unsigned char *)(v59 + v60[20]))
              {
                memcpy(v378, v386, sizeof(v378));
                uint64_t v61 = v376;
                uint64_t v62 = v59;
                uint64_t v63 = v51;
                goto LABEL_42;
              }
              uint64_t v178 = v59 + v60[12];
              uint64_t v179 = *(void *)v178;
              uint64_t v180 = *(void *)(v178 + 8);
              uint64_t v181 = *(void *)(v178 + 16);
              uint64_t v182 = v376;
              uint64_t v183 = *(void *)v376;
              uint64_t v184 = *(void *)(v376 + 8);
              uint64_t v185 = *(void *)(v376 + 16);
              char v186 = *(unsigned char *)(v178 + 24);
              char v187 = *(unsigned char *)(v376 + 24);
              sub_24EFA9C60(*(void *)v178, v180, v181, v186);
              sub_24EFA9D44(v183, v184, v185, v187);
              *(void *)uint64_t v182 = v179;
              *(void *)(v182 + 8) = v180;
              *(void *)(v182 + 16) = v181;
              *(unsigned char *)(v182 + 24) = v186;
              uint64_t v113 = 0;
              uint64_t v114 = 0;
              uint64_t v115 = 0;
              char v116 = 2;
LABEL_31:
              sub_24EFDC8E8((uint64_t)v113, v114, v115, v116, v375);
              return;
            }
            uint64_t v65 = (uint64_t)v81;
            v81[2] = v85;
            swift_bridgeObjectRetain();
            goto LABEL_11;
          }
        }
        uint64_t v65 = (uint64_t)v81;
        uint64_t v67 = v81[7];
        unint64_t v68 = *(void *)(v67 + 8 * v75);
        *(void *)(v67 + 8 * v75) = v72;
        sub_24EFC8E94(v68);
LABEL_11:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v66 += 5;
        if (!--v64)
        {
          sub_24EFEC680((uint64_t)v369);
LABEL_54:
          if (qword_26B1E8798 != -1) {
            swift_once();
          }
          uint64_t v143 = sub_24EFED020();
          __swift_project_value_buffer(v143, (uint64_t)qword_26B1EB990);
          uint64_t v144 = v65;
          swift_bridgeObjectRetain_n();
          uint64_t v145 = sub_24EFED000();
          os_log_type_t v146 = sub_24EFED660();
          if (os_log_type_enabled(v145, v146))
          {
            uint64_t v147 = (uint8_t *)swift_slowAlloc();
            uint64_t v148 = swift_slowAlloc();
            v378[0] = v148;
            *(_DWORD *)uint64_t v147 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v149 = sub_24EFED4F0();
            unint64_t v151 = v150;
            swift_bridgeObjectRelease();
            uint64_t v377 = sub_24EFEB7F8(v149, v151, v378);
            sub_24EFED670();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_24EFA0000, v145, v146, "Updated award load states %s", v147, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x253351EB0](v148, -1, -1);
            MEMORY[0x253351EB0](v147, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v152 = v375;
          uint64_t v153 = *(int *)(type metadata accessor for ForYouState() + 20);
          swift_bridgeObjectRelease();
          *(void *)(v152 + v153) = v144;
          return;
        }
      }
    case 5:
      uint64_t v124 = v381;
      uint64_t v125 = v382;
      uint64_t v372 = v383;
      uint64_t v373 = *((void *)&v380 + 1);
      long long v126 = (int *)type metadata accessor for ForYouState();
      uint64_t v127 = v126[16];
      long long v374 = v50;
      uint64_t v128 = v375;
      *(void *)(v375 + v127) = 0;
      sub_24EFECF80();
      sub_24EFECF70();
      (*(void (**)(char *, unint64_t *))(v371 + 8))(v11, v9);
      sub_24EFED650();
      uint64_t v129 = v128 + v126[13];
      *(void *)(v129 + 32) = v130;
      *(unsigned char *)(v129 + 40) = 0;
      *(void *)(v129 + 48) = v124;
      *(unsigned char *)(v129 + 56) = 0;
      *(void *)(v129 + 64) = v125;
      *(unsigned char *)(v129 + 72) = 0;
      uint64_t v131 = v128 + v126[12];
      uint64_t v132 = *(void *)v131;
      uint64_t v133 = *(void *)(v131 + 8);
      uint64_t v134 = *(void *)(v131 + 16);
      uint64_t v135 = v376;
      uint64_t v136 = *(void *)(v376 + 8);
      uint64_t v371 = *(void *)v376;
      uint64_t v137 = *(void *)(v376 + 16);
      LOBYTE(v124) = *(unsigned char *)(v131 + 24);
      LOBYTE(v125) = *(unsigned char *)(v376 + 24);
      sub_24EFA9C60(v132, v133, v134, v124);
      sub_24EFA9D44(v371, v136, v137, v125);
      *(void *)uint64_t v135 = v132;
      *(void *)(v135 + 8) = v133;
      *(void *)(v135 + 16) = v134;
      *(unsigned char *)(v135 + 24) = v124;
      sub_24EFDC8E8((uint64_t)v374, v373, v372, 1, v128);
      return;
    case 6:
      if (v380 != 1) {
        goto LABEL_40;
      }
      return;
    case 7:
      if (qword_26B1E8798 != -1) {
        swift_once();
      }
      uint64_t v117 = sub_24EFED020();
      __swift_project_value_buffer(v117, (uint64_t)qword_26B1EB990);
      uint64_t v118 = sub_24EFED000();
      os_log_type_t v119 = sub_24EFED660();
      if (os_log_type_enabled(v118, v119))
      {
        uint64_t v120 = (uint8_t *)swift_slowAlloc();
        uint64_t v121 = swift_slowAlloc();
        v378[0] = v121;
        *(_DWORD *)uint64_t v120 = 136315138;
        LOBYTE(v377) = (_BYTE)v50;
        uint64_t v122 = sub_24EFED540();
        uint64_t v377 = sub_24EFEB7F8(v122, v123, v378);
        sub_24EFED670();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24EFA0000, v118, v119, "Subscription State Updated to state: %s", v120, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253351EB0](v121, -1, -1);
        MEMORY[0x253351EB0](v120, -1, -1);
      }

      if (v50 == 2) {
        return;
      }
LABEL_40:
      memcpy(v378, v386, sizeof(v378));
      uint64_t v62 = v375;
      uint64_t v61 = v376;
      goto LABEL_41;
    case 8:
      if (!(v382 | v383 | (unint64_t)v380 | v381 | *((void *)&v380 + 1)))
      {
        uint64_t v154 = v375 + *(int *)(type metadata accessor for ForYouState() + 48);
        if (*(unsigned char *)(v154 + 24))
        {
          if (*(unsigned char *)(v154 + 24) == 1 || *(void *)(v154 + 16) | *(void *)v154 | *(void *)(v154 + 8)) {
            goto LABEL_63;
          }
        }
        else if (*(void *)(v154 + 16))
        {
LABEL_63:
          if (qword_26B1E8798 != -1) {
            swift_once();
          }
          uint64_t v155 = sub_24EFED020();
          __swift_project_value_buffer(v155, (uint64_t)qword_26B1EB990);
          uint64_t v156 = sub_24EFED000();
          os_log_type_t v157 = sub_24EFED660();
          if (os_log_type_enabled(v156, v157))
          {
            uint64_t v158 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v158 = 0;
            _os_log_impl(&dword_24EFA0000, v156, v157, "App Did Become Active - Current Load State is unsupported for fetching section descriptors.", v158, 2u);
            MEMORY[0x253351EB0](v158, -1, -1);
          }

          return;
        }
        memcpy(v378, v386, sizeof(v378));
        uint64_t v61 = v376;
        uint64_t v62 = v375;
LABEL_41:
        uint64_t v63 = v374;
LABEL_42:
        sub_24EFDC20C(v61, v62, v63, 1);
        return;
      }
      uint64_t v138 = v382 | v383 | v381 | *((void *)&v380 + 1);
      if ((void)v380 == 1 && !v138)
      {
        LOBYTE(v378[0]) = 20;
        sub_24EFE2B98();
        sub_24EFED690();
        uint64_t v139 = v372;
        uint64_t v140 = v373;
        (*(void (**)(char *, void, uint64_t))(v373 + 104))(v49, *MEMORY[0x263F39540], v372);
        uint64_t v99 = v374;
        unint64_t v100 = *v374;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v100 = sub_24EFDBDCC(0, *(void *)(v100 + 16) + 1, 1, v100);
        }
        unint64_t v142 = *(void *)(v100 + 16);
        unint64_t v141 = *(void *)(v100 + 24);
        if (v142 >= v141 >> 1) {
          unint64_t v100 = sub_24EFDBDCC(v141 > 1, v142 + 1, 1, v100);
        }
        *(void *)(v100 + 16) = v142 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v140 + 32))(v100+ ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80))+ *(void *)(v140 + 72) * v142, v49, v139);
LABEL_51:
        *uint64_t v99 = v100;
        return;
      }
      if ((void)v380 == 2 && !v138)
      {
        uint64_t v172 = sub_24EFED610();
        uint64_t v173 = (uint64_t)v368;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v172 - 8) + 56))(v368, 1, 1, v172);
        sub_24EFED5E0();
        sub_24EFE4274((uint64_t)v386);
        uint64_t v174 = sub_24EFED5D0();
        long long v175 = (void *)swift_allocObject();
        uint64_t v176 = MEMORY[0x263F8F500];
        v175[2] = v174;
        v175[3] = v176;
        memcpy(v175 + 4, v386, 0x130uLL);
        long long v177 = &unk_269998D10;
        goto LABEL_78;
      }
      if ((void)v380 == 3 && !v138)
      {
        uint64_t v188 = v375 + *(int *)(type metadata accessor for ForYouState() + 48);
        if (*(unsigned char *)(v188 + 24) || *(unsigned char *)(v188 + 16) != 2 || *(void *)(v188 + 8) || *(void *)v188 != 1) {
          return;
        }
        uint64_t v189 = sub_24EFED610();
        uint64_t v173 = (uint64_t)v368;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v189 - 8) + 56))(v368, 1, 1, v189);
        sub_24EFED5E0();
        sub_24EFE4274((uint64_t)v386);
        uint64_t v190 = sub_24EFED5D0();
        long long v175 = (void *)swift_allocObject();
        uint64_t v191 = MEMORY[0x263F8F500];
        v175[2] = v190;
        v175[3] = v191;
        memcpy(v175 + 4, v386, 0x130uLL);
        long long v177 = &unk_269998D00;
LABEL_78:
        sub_24EFE332C(v173, (uint64_t)v177, (uint64_t)v175);
        swift_release();
        return;
      }
      if ((void)v380 == 4 && !v138)
      {
        uint64_t v192 = *(int *)(type metadata accessor for ForYouState() + 64);
        uint64_t v193 = v375;
        uint64_t v194 = *(void *)(v375 + v192);
        BOOL v84 = __OFADD__(v194, 1);
        uint64_t v195 = v194 + 1;
        if (!v84)
        {
          *(void *)(v375 + v192) = v195;
          memcpy(v378, v386, sizeof(v378));
          sub_24EFDC20C(v376, v193, v374, 0);
          return;
        }
        __break(1u);
        goto LABEL_158;
      }
      if ((void)v380 == 5 && !v138)
      {
        uint64_t v196 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269998CE8);
        uint64_t v9 = v374;
        uint64_t v197 = &v41[v196[24]];
        uint64_t v198 = &v41[v196[28]];
        uint64_t v199 = &v41[v196[32]];
        LOBYTE(v378[0]) = 20;
        sub_24EFE2B98();
        sub_24EFED690();
        *((void *)v41 + 5) = 0x4000000000000000;
        v41[48] = 0;
        sub_24EFED5F0();
        uint64_t v200 = *MEMORY[0x263F39590];
        uint64_t v201 = sub_24EFED4C0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v201 - 8) + 104))(v197, v200, v201);
        uint64_t v202 = *MEMORY[0x263F39570];
        uint64_t v203 = sub_24EFED4B0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v203 - 8) + 104))(v198, v202, v203);
        *(void *)uint64_t v199 = &unk_269998CF0;
        *((void *)v199 + 1) = 0;
        uint64_t v38 = (char *)v372;
        (*(void (**)(char *, void, uint64_t))(v373 + 104))(v41, *MEMORY[0x263F39538], v372);
        unint64_t v11 = (char *)*v9;
        if (swift_isUniquelyReferenced_nonNull_native())
        {
LABEL_97:
          unint64_t v205 = *((void *)v11 + 2);
          unint64_t v204 = *((void *)v11 + 3);
          if (v205 >= v204 >> 1) {
            unint64_t v11 = (char *)sub_24EFDBDCC(v204 > 1, v205 + 1, 1, (unint64_t)v11);
          }
          *((void *)v11 + 2) = v205 + 1;
          (*(void (**)(char *, char *, char *))(v373 + 32))(&v11[((*(unsigned __int8 *)(v373 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v373 + 80))+ *(void *)(v373 + 72) * v205], v41, v38);
          *uint64_t v9 = (unint64_t)v11;
          return;
        }
LABEL_158:
        unint64_t v11 = (char *)sub_24EFDBDCC(0, *((void *)v11 + 2) + 1, 1, (unint64_t)v11);
        goto LABEL_97;
      }
      uint64_t isUniquelyReferenced_nonNull_native = type metadata accessor for ForYouState();
      uint64_t v206 = v375 + *(int *)(isUniquelyReferenced_nonNull_native + 48);
      uint64_t v76 = *(void *)(v206 + 16);
      if (*(unsigned char *)(v206 + 24))
      {
        if (*(unsigned char *)(v206 + 24) == 1 || v76 | *(void *)v206 | *(void *)(v206 + 8)) {
          return;
        }
      }
      else
      {
LABEL_105:
        if ((_BYTE)v76) {
          return;
        }
      }
      sub_24EFECF80();
      sub_24EFECF70();
      (*(void (**)(char *, unint64_t *))(v371 + 8))(v11, v9);
      sub_24EFED650();
      uint64_t v207 = *(int *)(isUniquelyReferenced_nonNull_native + 52);
      uint64_t v208 = v375;
      uint64_t v209 = v375 + v207;
      *(void *)uint64_t v209 = v210;
      *(unsigned char *)(v209 + 8) = 0;
      memcpy(v378, v386, sizeof(v378));
      sub_24EFDC20C(v376, v208, v374, 1);
      uint64_t v211 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88A8);
      uint64_t v212 = &v38[v211[16]];
      unint64_t v213 = &v38[v211[20]];
      unint64_t v214 = &v38[v211[24]];
      LOBYTE(v378[0]) = 4;
      *(void *)&long long v376 = sub_24EFE2B98();
      sub_24EFED690();
      sub_24EFED5F0();
      uint64_t v215 = *MEMORY[0x263F39590];
      uint64_t v216 = sub_24EFED4C0();
      uint64_t v217 = *(void *)(v216 - 8);
      uint64_t v218 = *(void (**)(char *, uint64_t))(v217 + 104);
      LODWORD(v375) = v215;
      *((void *)&v370 + 1) = v218;
      uint64_t v371 = v216;
      *(void *)&long long v370 = v217 + 104;
      v218(v212, v215);
      uint64_t v219 = *MEMORY[0x263F39570];
      uint64_t v220 = sub_24EFED4B0();
      uint64_t v221 = *(void *)(v220 - 8);
      uint64_t v222 = *(void (**)(char *, void, char *))(v221 + 104);
      LODWORD(v369) = v219;
      uint64_t v368 = (char *)v220;
      uint64_t v355 = v221 + 104;
      uint64_t v356 = v222;
      ((void (*)(char *, uint64_t))v222)(v213, v219);
      uint64_t v223 = swift_allocObject();
      memcpy((void *)(v223 + 16), v386, 0x130uLL);
      *(void *)unint64_t v214 = &unk_269998C30;
      *((void *)v214 + 1) = v223;
      unsigned int v224 = *MEMORY[0x263F39530];
      uint64_t v225 = v373;
      uint64_t v226 = v373 + 104;
      uint64_t v227 = *MEMORY[0x263F39530];
      unint64_t v354 = *(void (**)(char *, uint64_t, uint64_t))(v373 + 104);
      v354(v38, v227, v372);
      unint64_t v228 = *v374;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v228 = sub_24EFDBDCC(0, *(void *)(v228 + 16) + 1, 1, v228);
      }
      unint64_t v230 = *(void *)(v228 + 16);
      unint64_t v229 = *(void *)(v228 + 24);
      unsigned int v350 = v224;
      if (v230 >= v229 >> 1) {
        unint64_t v228 = sub_24EFDBDCC(v229 > 1, v230 + 1, 1, v228);
      }
      *(void *)(v228 + 16) = v230 + 1;
      uint64_t v232 = *(void (**)(unint64_t, char *, uint64_t))(v225 + 32);
      uint64_t v231 = v225 + 32;
      unint64_t v352 = (*(unsigned __int8 *)(v231 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v231 + 48);
      uint64_t v353 = v232;
      uint64_t v351 = *(void *)(v231 + 40);
      uint64_t v233 = v231;
      uint64_t v234 = v372;
      uint64_t v373 = v233;
      v232(v228 + v352 + v351 * v230, v38, v372);
      uint64_t v235 = v374;
      *long long v374 = v228;
      v236 = v360;
      v237 = &v360[v211[16]];
      v238 = &v360[v211[20]];
      v239 = &v360[v211[24]];
      LOBYTE(v378[0]) = 5;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v237, v375, v371);
      v356(v238, v369, v368);
      uint64_t v240 = swift_allocObject();
      memcpy((void *)(v240 + 16), v386, 0x130uLL);
      *(void *)v239 = &unk_269998C40;
      *((void *)v239 + 1) = v240;
      uint64_t v241 = v234;
      v354(v236, v350, v234);
      unint64_t v242 = *v235;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v242 = sub_24EFDBDCC(0, *(void *)(v242 + 16) + 1, 1, v242);
      }
      v243 = v357;
      unint64_t v245 = *(void *)(v242 + 16);
      unint64_t v244 = *(void *)(v242 + 24);
      uint64_t v349 = v226;
      if (v245 >= v244 >> 1) {
        unint64_t v242 = sub_24EFDBDCC(v244 > 1, v245 + 1, 1, v242);
      }
      uint64_t v246 = v350;
      *(void *)(v242 + 16) = v245 + 1;
      v353(v242 + v352 + v245 * v351, v360, v241);
      v247 = v374;
      *long long v374 = v242;
      uint64_t v248 = v361;
      v249 = &v361[v211[16]];
      uint64_t v250 = &v361[v211[20]];
      v251 = &v361[v211[24]];
      LOBYTE(v378[0]) = 6;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v249, v375, v371);
      v356(v250, v369, v368);
      uint64_t v252 = swift_allocObject();
      memcpy((void *)(v252 + 16), v386, 0x130uLL);
      *(void *)v251 = &unk_269998C50;
      *((void *)v251 + 1) = v252;
      uint64_t v253 = v372;
      v354(v248, v246, v372);
      unint64_t v254 = *v247;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v254 = sub_24EFDBDCC(0, *(void *)(v254 + 16) + 1, 1, v254);
      }
      unint64_t v256 = *(void *)(v254 + 16);
      unint64_t v255 = *(void *)(v254 + 24);
      if (v256 >= v255 >> 1) {
        unint64_t v254 = sub_24EFDBDCC(v255 > 1, v256 + 1, 1, v254);
      }
      *(void *)(v254 + 16) = v256 + 1;
      v353(v254 + v352 + v256 * v351, v361, v253);
      v257 = v374;
      *long long v374 = v254;
      uint64_t v258 = &v243[v211[16]];
      v259 = &v243[v211[20]];
      v260 = &v243[v211[24]];
      LOBYTE(v378[0]) = 7;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v258, v375, v371);
      v356(v259, v369, v368);
      uint64_t v261 = swift_allocObject();
      memcpy((void *)(v261 + 16), v386, 0x130uLL);
      *(void *)v260 = &unk_269998C60;
      *((void *)v260 + 1) = v261;
      uint64_t v262 = v372;
      v354(v243, v350, v372);
      unint64_t v263 = *v257;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v263 = sub_24EFDBDCC(0, *(void *)(v263 + 16) + 1, 1, v263);
      }
      unint64_t v265 = *(void *)(v263 + 16);
      unint64_t v264 = *(void *)(v263 + 24);
      if (v265 >= v264 >> 1) {
        unint64_t v263 = sub_24EFDBDCC(v264 > 1, v265 + 1, 1, v263);
      }
      *(void *)(v263 + 16) = v265 + 1;
      v353(v263 + v352 + v265 * v351, v243, v262);
      uint64_t v266 = v374;
      *long long v374 = v263;
      v267 = v362;
      uint64_t v268 = &v362[v211[16]];
      uint64_t v269 = &v362[v211[20]];
      v270 = &v362[v211[24]];
      LOBYTE(v378[0]) = 8;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v268, v375, v371);
      v356(v269, v369, v368);
      uint64_t v271 = swift_allocObject();
      memcpy((void *)(v271 + 16), v386, 0x130uLL);
      *(void *)v270 = &unk_269998C70;
      *((void *)v270 + 1) = v271;
      uint64_t v272 = v372;
      v354(v267, v350, v372);
      unint64_t v273 = *v266;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v273 = sub_24EFDBDCC(0, *(void *)(v273 + 16) + 1, 1, v273);
      }
      unint64_t v275 = *(void *)(v273 + 16);
      unint64_t v274 = *(void *)(v273 + 24);
      if (v275 >= v274 >> 1) {
        unint64_t v273 = sub_24EFDBDCC(v274 > 1, v275 + 1, 1, v273);
      }
      *(void *)(v273 + 16) = v275 + 1;
      v353(v273 + v352 + v275 * v351, v362, v272);
      v276 = v374;
      *long long v374 = v273;
      uint64_t v277 = v363;
      uint64_t v278 = &v363[v211[16]];
      uint64_t v279 = &v363[v211[20]];
      uint64_t v280 = &v363[v211[24]];
      LOBYTE(v378[0]) = 9;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v278, v375, v371);
      v356(v279, v369, v368);
      uint64_t v281 = swift_allocObject();
      memcpy((void *)(v281 + 16), v386, 0x130uLL);
      *(void *)uint64_t v280 = &unk_269998C80;
      *((void *)v280 + 1) = v281;
      uint64_t v282 = v372;
      v354(v277, v350, v372);
      unint64_t v283 = *v276;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v283 = sub_24EFDBDCC(0, *(void *)(v283 + 16) + 1, 1, v283);
      }
      uint64_t v284 = v358;
      unint64_t v286 = *(void *)(v283 + 16);
      unint64_t v285 = *(void *)(v283 + 24);
      if (v286 >= v285 >> 1) {
        unint64_t v283 = sub_24EFDBDCC(v285 > 1, v286 + 1, 1, v283);
      }
      *(void *)(v283 + 16) = v286 + 1;
      v353(v283 + v352 + v286 * v351, v363, v282);
      uint64_t v287 = v374;
      *long long v374 = v283;
      uint64_t v288 = &v284[v211[16]];
      uint64_t v289 = &v284[v211[20]];
      unint64_t v290 = &v284[v211[24]];
      LOBYTE(v378[0]) = 10;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v288, v375, v371);
      v356(v289, v369, v368);
      uint64_t v291 = swift_allocObject();
      memcpy((void *)(v291 + 16), v386, 0x130uLL);
      *(void *)unint64_t v290 = &unk_269998C90;
      *((void *)v290 + 1) = v291;
      uint64_t v292 = v372;
      v354(v284, v350, v372);
      unint64_t v293 = *v287;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v293 = sub_24EFDBDCC(0, *(void *)(v293 + 16) + 1, 1, v293);
      }
      unint64_t v295 = *(void *)(v293 + 16);
      unint64_t v294 = *(void *)(v293 + 24);
      if (v295 >= v294 >> 1) {
        unint64_t v293 = sub_24EFDBDCC(v294 > 1, v295 + 1, 1, v293);
      }
      *(void *)(v293 + 16) = v295 + 1;
      v353(v293 + v352 + v295 * v351, v284, v292);
      uint64_t v296 = v374;
      *long long v374 = v293;
      uint64_t v297 = v364;
      uint64_t v298 = &v364[v211[16]];
      uint64_t v299 = &v364[v211[20]];
      unint64_t v300 = &v364[v211[24]];
      LOBYTE(v378[0]) = 11;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v298, v375, v371);
      v356(v299, v369, v368);
      uint64_t v301 = swift_allocObject();
      memcpy((void *)(v301 + 16), v386, 0x130uLL);
      *(void *)unint64_t v300 = &unk_269998CA0;
      *((void *)v300 + 1) = v301;
      uint64_t v302 = v372;
      v354(v297, v350, v372);
      unint64_t v303 = *v296;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v303 = sub_24EFDBDCC(0, *(void *)(v303 + 16) + 1, 1, v303);
      }
      unint64_t v304 = v359;
      unint64_t v306 = *(void *)(v303 + 16);
      unint64_t v305 = *(void *)(v303 + 24);
      if (v306 >= v305 >> 1) {
        unint64_t v303 = sub_24EFDBDCC(v305 > 1, v306 + 1, 1, v303);
      }
      *(void *)(v303 + 16) = v306 + 1;
      v353(v303 + v352 + v306 * v351, v364, v302);
      uint64_t v307 = v374;
      *long long v374 = v303;
      uint64_t v308 = v365;
      uint64_t v309 = &v365[v211[16]];
      uint64_t v310 = &v365[v211[20]];
      uint64_t v311 = &v365[v211[24]];
      LOBYTE(v378[0]) = 12;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v309, v375, v371);
      v356(v310, v369, v368);
      uint64_t v312 = swift_allocObject();
      memcpy((void *)(v312 + 16), v386, 0x130uLL);
      *(void *)uint64_t v311 = &unk_269998CB0;
      *((void *)v311 + 1) = v312;
      uint64_t v313 = v372;
      uint64_t v314 = v308;
      uint64_t v315 = v350;
      v354(v314, v350, v372);
      unint64_t v316 = *v307;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v316 = sub_24EFDBDCC(0, *(void *)(v316 + 16) + 1, 1, v316);
      }
      unint64_t v318 = *(void *)(v316 + 16);
      unint64_t v317 = *(void *)(v316 + 24);
      if (v318 >= v317 >> 1) {
        unint64_t v316 = sub_24EFDBDCC(v317 > 1, v318 + 1, 1, v316);
      }
      *(void *)(v316 + 16) = v318 + 1;
      v353(v316 + v352 + v318 * v351, v365, v313);
      uint64_t v319 = v374;
      *long long v374 = v316;
      uint64_t v320 = &v304[v211[16]];
      uint64_t v321 = &v304[v211[20]];
      uint64_t v322 = &v304[v211[24]];
      LOBYTE(v378[0]) = 13;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v320, v375, v371);
      v356(v321, v369, v368);
      uint64_t v323 = swift_allocObject();
      memcpy((void *)(v323 + 16), v386, 0x130uLL);
      *(void *)uint64_t v322 = &unk_269998CC0;
      *((void *)v322 + 1) = v323;
      uint64_t v324 = v372;
      v354(v304, v315, v372);
      unint64_t v325 = *v319;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v325 = sub_24EFDBDCC(0, *(void *)(v325 + 16) + 1, 1, v325);
      }
      unint64_t v327 = *(void *)(v325 + 16);
      unint64_t v326 = *(void *)(v325 + 24);
      if (v327 >= v326 >> 1) {
        unint64_t v325 = sub_24EFDBDCC(v326 > 1, v327 + 1, 1, v325);
      }
      *(void *)(v325 + 16) = v327 + 1;
      v353(v325 + v352 + v327 * v351, v304, v324);
      uint64_t v328 = v374;
      *long long v374 = v325;
      uint64_t v329 = v366;
      unint64_t v330 = &v366[v211[16]];
      uint64_t v331 = &v366[v211[20]];
      uint64_t v332 = &v366[v211[24]];
      LOBYTE(v378[0]) = 14;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v330, v375, v371);
      v356(v331, v369, v368);
      uint64_t v333 = swift_allocObject();
      memcpy((void *)(v333 + 16), v386, 0x130uLL);
      *(void *)uint64_t v332 = &unk_269998CD0;
      *((void *)v332 + 1) = v333;
      uint64_t v334 = v372;
      uint64_t v335 = v329;
      uint64_t v336 = v350;
      v354(v335, v350, v372);
      unint64_t v337 = *v328;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v337 = sub_24EFDBDCC(0, *(void *)(v337 + 16) + 1, 1, v337);
      }
      unint64_t v339 = *(void *)(v337 + 16);
      unint64_t v338 = *(void *)(v337 + 24);
      if (v339 >= v338 >> 1) {
        unint64_t v337 = sub_24EFDBDCC(v338 > 1, v339 + 1, 1, v337);
      }
      *(void *)(v337 + 16) = v339 + 1;
      v353(v337 + v352 + v339 * v351, v366, v334);
      uint64_t v340 = v374;
      *long long v374 = v337;
      uint64_t v341 = v367;
      unint64_t v342 = &v367[v211[16]];
      uint64_t v343 = &v367[v211[20]];
      uint64_t v344 = &v367[v211[24]];
      LOBYTE(v378[0]) = 15;
      sub_24EFED690();
      sub_24EFED5F0();
      (*((void (**)(char *, void, uint64_t))&v370 + 1))(v342, v375, v371);
      v356(v343, v369, v368);
      uint64_t v345 = swift_allocObject();
      memcpy((void *)(v345 + 16), v386, 0x130uLL);
      *(void *)uint64_t v344 = &unk_269998CE0;
      *((void *)v344 + 1) = v345;
      uint64_t v346 = v372;
      v354(v341, v336, v372);
      unint64_t v169 = *v340;
      sub_24EFE4274((uint64_t)v386);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v169 = sub_24EFDBDCC(0, *(void *)(v169 + 16) + 1, 1, v169);
      }
      unint64_t v348 = *(void *)(v169 + 16);
      unint64_t v347 = *(void *)(v169 + 24);
      if (v348 >= v347 >> 1) {
        unint64_t v169 = sub_24EFDBDCC(v347 > 1, v348 + 1, 1, v169);
      }
      *(void *)(v169 + 16) = v348 + 1;
      v353(v169 + v352 + v348 * v351, v367, v346);
LABEL_74:
      *long long v374 = v169;
      return;
    default:
      uint64_t v51 = v374;
      char v385 = v380 & 1;
      if (qword_26B1E8798 == -1) {
        goto LABEL_3;
      }
      goto LABEL_156;
  }
}

unint64_t sub_24EFE2B98()
{
  unint64_t result = qword_26B1E8648;
  if (!qword_26B1E8648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8648);
  }
  return result;
}

uint64_t sub_24EFE2BEC()
{
  *(void *)(v0 + 64) = sub_24EFED5E0();
  *(void *)(v0 + 72) = sub_24EFED5D0();
  *(void *)(v0 + 16) = 5;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(unsigned char *)(v0 + 56) = 8;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
  *uint64_t v1 = v0;
  v1[1] = sub_24EFE2CDC;
  return MEMORY[0x270F252C8](v0 + 16, v2);
}

uint64_t sub_24EFE2CDC()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24EFED5B0();
  return MEMORY[0x270FA2498](sub_24EFECF44, v1, v0);
}

uint64_t sub_24EFE2E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 64) = sub_24EFED5E0();
  *(void *)(v3 + 72) = sub_24EFED5D0();
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0;
  *(void *)(v3 + 48) = 0;
  *(unsigned char *)(v3 + 56) = 1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 80) = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
  *uint64_t v6 = v3;
  v6[1] = sub_24EFE2F08;
  return MEMORY[0x270F252C8](v3 + 16, v7);
}

uint64_t sub_24EFE2F08()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24EFED5B0();
  return MEMORY[0x270FA2498](sub_24EFE3044, v1, v0);
}

uint64_t sub_24EFE3044()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EFE30A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = sub_24EFED5E0();
  _OWORD v4[3] = sub_24EFED5D0();
  uint64_t v8 = (uint64_t (*)(void))(*(void *)(a4 + 208) + **(int **)(a4 + 208));
  uint64_t v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_24EFE3190;
  return v8();
}

uint64_t sub_24EFE3190()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24EFED5B0();
  return MEMORY[0x270FA2498](sub_24EFE32CC, v1, v0);
}

uint64_t sub_24EFE32CC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EFE332C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EFED610();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24EFED600();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24EFECAF8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24EFED5B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24EFE34D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = sub_24EFED5E0();
  _OWORD v4[3] = sub_24EFED5D0();
  uint64_t v8 = (uint64_t (*)(void))(*(void *)(a4 + 224) + **(int **)(a4 + 224));
  uint64_t v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_24EFE35B8;
  return v8();
}

uint64_t sub_24EFE35B8()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24EFED5B0();
  return MEMORY[0x270FA2498](sub_24EFECF48, v1, v0);
}

uint64_t sub_24EFE36F4()
{
  *(void *)(v0 + 64) = sub_24EFED5E0();
  *(void *)(v0 + 72) = sub_24EFED5D0();
  *(void *)(v0 + 16) = 1;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(unsigned char *)(v0 + 56) = 2;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
  *uint64_t v1 = v0;
  v1[1] = sub_24EFE2CDC;
  return MEMORY[0x270F252C8](v0 + 16, v2);
}

uint64_t sub_24EFE37E4(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE38E0;
  return v6(v2 + 13);
}

uint64_t sub_24EFE38E0()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    id v5 = sub_24EFECF40;
  }
  else {
    id v5 = sub_24EFE3A40;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE3A40()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EFE3C30;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE3C30()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE3D74, v3, v2);
}

uint64_t sub_24EFE3D74()
{
  uint64_t v13 = v0;
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    uint64_t v4 = sub_24EFED000();
    os_log_type_t v5 = sub_24EFED660();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v12 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      uint64_t v8 = sub_24EFED540();
      *(void *)(v6 + 4) = sub_24EFEB7F8(v8, v9, &v12);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24EFA0000, v4, v5, "AchievementEnvironmentCache updated - refreshing. Updated cache %s ", (uint8_t *)v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253351EB0](v7, -1, -1);
      MEMORY[0x253351EB0](v6, -1, -1);
    }

    *(void *)(v0 + 48) = 0;
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(unsigned char *)(v0 + 56) = 2;
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v10;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v10 = v0;
    v10[1] = sub_24EFE3FC4;
    return MEMORY[0x270F252C8](v0 + 16, v11);
  }
}

uint64_t sub_24EFE3FC4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE40E4, v3, v2);
}

uint64_t sub_24EFE40E4()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE3C30;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE41D0()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFE41D8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE37E4(a1, v1 + 16);
}

uint64_t sub_24EFE4274(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EFE43B4(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE44B0;
  return v6(v2 + 13);
}

uint64_t sub_24EFE44B0()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFECF40;
  }
  else {
    uint64_t v5 = sub_24EFE4610;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE4610()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EFE4800;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE4800()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE4944, v3, v2);
}

uint64_t sub_24EFE4944()
{
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    uint64_t v4 = sub_24EFED000();
    os_log_type_t v5 = sub_24EFED660();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_24EFA0000, v4, v5, "Active Workout Plan Updated — refreshing", v6, 2u);
      MEMORY[0x253351EB0](v6, -1, -1);
    }

    *(void *)(v0 + 16) = 4;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(unsigned char *)(v0 + 56) = 2;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v7 = v0;
    v7[1] = sub_24EFE4B24;
    return MEMORY[0x270F252C8](v0 + 16, v8);
  }
}

uint64_t sub_24EFE4B24()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE4C44, v3, v2);
}

uint64_t sub_24EFE4C44()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE4800;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE4D30(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 48) + **(int **)(a2 + 48));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE4E2C;
  return v6(v2 + 13);
}

uint64_t sub_24EFE4E2C()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFECF40;
  }
  else {
    uint64_t v5 = sub_24EFE4F8C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE4F8C()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EFE517C;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE517C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE52C0, v3, v2);
}

uint64_t sub_24EFE52C0()
{
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    uint64_t v4 = sub_24EFED000();
    os_log_type_t v5 = sub_24EFED660();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_24EFA0000, v4, v5, "Allowed Content Ratings Updated — refreshing", v6, 2u);
      MEMORY[0x253351EB0](v6, -1, -1);
    }

    *(void *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(unsigned char *)(v0 + 56) = 2;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v7 = v0;
    v7[1] = sub_24EFE54A0;
    return MEMORY[0x270F252C8](v0 + 16, v8);
  }
}

uint64_t sub_24EFE54A0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE55C0, v3, v2);
}

uint64_t sub_24EFE55C0()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE517C;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE56AC(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 64) + **(int **)(a2 + 64));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE57A8;
  return v6(v2 + 13);
}

uint64_t sub_24EFE57A8()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFECF40;
  }
  else {
    uint64_t v5 = sub_24EFE5908;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE5908()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EFE5AF8;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE5AF8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE5C3C, v3, v2);
}

uint64_t sub_24EFE5C3C()
{
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    *(void *)(v0 + 48) = 0;
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(unsigned char *)(v0 + 56) = 8;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v3 = v0;
    v3[1] = sub_24EFE5D64;
    return MEMORY[0x270F252C8](v0 + 16, v4);
  }
}

uint64_t sub_24EFE5D64()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE5E84, v3, v2);
}

uint64_t sub_24EFE5E84()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE5AF8;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE5F70(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 80) + **(int **)(a2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE606C;
  return v6(v2 + 13);
}

uint64_t sub_24EFE606C()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFECF40;
  }
  else {
    uint64_t v5 = sub_24EFE61CC;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE61CC()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EFE63BC;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE63BC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE6500, v3, v2);
}

uint64_t sub_24EFE6500()
{
  int v1 = *(unsigned __int8 *)(v0 + 57);
  if (v1 == 2)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24EFED020();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B1EB990);
    uint64_t v5 = sub_24EFED000();
    os_log_type_t v6 = sub_24EFED660();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24EFA0000, v5, v6, "Browsing Identity Updated — refreshing", v7, 2u);
      MEMORY[0x253351EB0](v7, -1, -1);
    }

    *(void *)(v0 + 16) = v1 & 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(unsigned char *)(v0 + 56) = 0;
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v8;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    void *v8 = v0;
    v8[1] = sub_24EFE66DC;
    return MEMORY[0x270F252C8](v0 + 16, v9);
  }
}

uint64_t sub_24EFE66DC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE67FC, v3, v2);
}

uint64_t sub_24EFE67FC()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE63BC;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE68E8(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  os_log_type_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 96) + **(int **)(a2 + 96));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE69E4;
  return v6(v2 + 13);
}

uint64_t sub_24EFE69E4()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFE7264;
  }
  else {
    uint64_t v5 = sub_24EFE6B44;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE6B44()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_24EFE6D34;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE6D34()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE6E78, v3, v2);
}

uint64_t sub_24EFE6E78()
{
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    uint64_t v4 = sub_24EFED000();
    os_log_type_t v5 = sub_24EFED660();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_24EFA0000, v4, v5, "Catalog Deleted — refreshing", v6, 2u);
      MEMORY[0x253351EB0](v6, -1, -1);
    }

    *(void *)(v0 + 16) = 3;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(unsigned char *)(v0 + 56) = 2;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v7 = v0;
    v7[1] = sub_24EFE7058;
    return MEMORY[0x270F252C8](v0 + 16, v8);
  }
}

uint64_t sub_24EFE7058()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE7178, v3, v2);
}

uint64_t sub_24EFE7178()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE6D34;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE7264()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EFE72C8(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  os_log_type_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 112) + **(int **)(a2 + 112));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE73C4;
  return v6(v2 + 13);
}

uint64_t sub_24EFE73C4()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFECF40;
  }
  else {
    uint64_t v5 = sub_24EFE7524;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE7524()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_24EFE7714;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE7714()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE7858, v3, v2);
}

uint64_t sub_24EFE7858()
{
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    uint64_t v4 = sub_24EFED000();
    os_log_type_t v5 = sub_24EFED660();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_24EFA0000, v4, v5, "Content Availability Updated — refreshing", v6, 2u);
      MEMORY[0x253351EB0](v6, -1, -1);
    }

    *(void *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(unsigned char *)(v0 + 56) = 2;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v7 = v0;
    v7[1] = sub_24EFE7A38;
    return MEMORY[0x270F252C8](v0 + 16, v8);
  }
}

uint64_t sub_24EFE7A38()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE7B58, v3, v2);
}

uint64_t sub_24EFE7B58()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE7714;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE7C44(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  os_log_type_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 128) + **(int **)(a2 + 128));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE7D40;
  return v6(v2 + 13);
}

uint64_t sub_24EFE7D40()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFECF40;
  }
  else {
    uint64_t v5 = sub_24EFE7EA0;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE7EA0()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_24EFE8090;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE8090()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE81D4, v3, v2);
}

uint64_t sub_24EFE81D4()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 57);
  if (v1 == 3)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24EFED020();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B1EB990);
    uint64_t v5 = sub_24EFED000();
    os_log_type_t v6 = sub_24EFED660();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24EFA0000, v5, v6, "Network Conditions Updated — refreshing", v7, 2u);
      MEMORY[0x253351EB0](v7, -1, -1);
    }

    *(void *)(v0 + 16) = v1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(unsigned char *)(v0 + 56) = 6;
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v8;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    void *v8 = v0;
    v8[1] = sub_24EFE83B0;
    return MEMORY[0x270F252C8](v0 + 16, v9);
  }
}

uint64_t sub_24EFE83B0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE84D0, v3, v2);
}

uint64_t sub_24EFE84D0()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE8090;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE85BC(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  os_log_type_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 144) + **(int **)(a2 + 144));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE86B8;
  return v6(v2 + 13);
}

uint64_t sub_24EFE86B8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24EFED5B0();
  *(void *)(v1 + 176) = v3;
  *(void *)(v1 + 184) = v2;
  return MEMORY[0x270FA2498](sub_24EFE87FC, v3, v2);
}

uint64_t sub_24EFE87FC()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[24] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[25] = (uint64_t)v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_24EFE89EC;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE89EC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 184);
  uint64_t v3 = *(void *)(v1 + 176);
  return MEMORY[0x270FA2498](sub_24EFE8B30, v3, v2);
}

uint64_t sub_24EFE8B30()
{
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    uint64_t v4 = sub_24EFED000();
    os_log_type_t v5 = sub_24EFED660();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_24EFA0000, v4, v5, "Onboarding Survey Results Updated — refreshing", v6, 2u);
      MEMORY[0x253351EB0](v6, -1, -1);
    }

    *(void *)(v0 + 48) = 0;
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(unsigned char *)(v0 + 56) = 2;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v7 = v0;
    v7[1] = sub_24EFE8D0C;
    return MEMORY[0x270F252C8](v0 + 16, v8);
  }
}

uint64_t sub_24EFE8D0C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 184);
  uint64_t v3 = *(void *)(v1 + 176);
  return MEMORY[0x270FA2498](sub_24EFE8E2C, v3, v2);
}

uint64_t sub_24EFE8E2C()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[24] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[25] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE89EC;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE8F18(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  os_log_type_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 160) + **(int **)(a2 + 160));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE9014;
  return v6(v2 + 13);
}

uint64_t sub_24EFE9014()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFECF40;
  }
  else {
    uint64_t v5 = sub_24EFE9174;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE9174()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_24EFE9364;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE9364()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE94A8, v3, v2);
}

uint64_t sub_24EFE94A8()
{
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    uint64_t v4 = sub_24EFED000();
    os_log_type_t v5 = sub_24EFED660();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_24EFA0000, v4, v5, "Personalization Privacy Preference Updated — refreshing", v6, 2u);
      MEMORY[0x253351EB0](v6, -1, -1);
    }

    *(void *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(unsigned char *)(v0 + 56) = 2;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v7 = v0;
    v7[1] = sub_24EFE9688;
    return MEMORY[0x270F252C8](v0 + 16, v8);
  }
}

uint64_t sub_24EFE9688()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE97A8, v3, v2);
}

uint64_t sub_24EFE97A8()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE9364;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFE9894(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  os_log_type_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 176) + **(int **)(a2 + 176));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFE9990;
  return v6(v2 + 13);
}

uint64_t sub_24EFE9990()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFECF40;
  }
  else {
    uint64_t v5 = sub_24EFE9AF0;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFE9AF0()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_24EFE9CE0;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFE9CE0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFE9E24, v3, v2);
}

uint64_t sub_24EFE9E24()
{
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    uint64_t v4 = sub_24EFED000();
    os_log_type_t v5 = sub_24EFED660();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_24EFA0000, v4, v5, "Significant Time Change — refreshing", v6, 2u);
      MEMORY[0x253351EB0](v6, -1, -1);
    }

    *(void *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(unsigned char *)(v0 + 56) = 2;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v7 = v0;
    v7[1] = sub_24EFEA004;
    return MEMORY[0x270F252C8](v0 + 16, v8);
  }
}

uint64_t sub_24EFEA004()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFEA124, v3, v2);
}

uint64_t sub_24EFEA124()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFE9CE0;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t sub_24EFEA210(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24EFED5E0();
  v2[20] = sub_24EFED5D0();
  os_log_type_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 192) + **(int **)(a2 + 192));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFEA30C;
  return v6(v2 + 13);
}

uint64_t sub_24EFEA30C()
{
  uint64_t v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EFED5B0();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    uint64_t v5 = sub_24EFECF40;
  }
  else {
    uint64_t v5 = sub_24EFEA46C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EFEA46C()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 13, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[11] = swift_getAssociatedTypeWitness();
  v0[12] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 8);
  sub_24EFED640();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  uint64_t v5 = sub_24EFED5D0();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_24EFEA65C;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v5, v7);
}

uint64_t sub_24EFEA65C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFEA7A0, v3, v2);
}

uint64_t sub_24EFEA7A0()
{
  if (*(unsigned char *)(v0 + 57) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    if (qword_26B1E8798 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EFED020();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1EB990);
    uint64_t v4 = sub_24EFED000();
    os_log_type_t v5 = sub_24EFED660();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_24EFA0000, v4, v5, "Wheelchair Status Updated — refreshing", v6, 2u);
      MEMORY[0x253351EB0](v6, -1, -1);
    }

    *(void *)(v0 + 16) = 1;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(unsigned char *)(v0 + 56) = 2;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8840);
    *uint64_t v7 = v0;
    v7[1] = sub_24EFEA980;
    return MEMORY[0x270F252C8](v0 + 16, v8);
  }
}

uint64_t sub_24EFEA980()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24EFEAAA0, v3, v2);
}

uint64_t sub_24EFEAAA0()
{
  uint64_t v1 = sub_24EFED5D0();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 8), v0[11]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EFEA65C;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88]((char *)v0 + 57, v1, v3);
}

uint64_t ForYouFeature.dispose(localState:sharedState:)(uint64_t a1, uint64_t a2)
{
  sub_24EFDC8E8(0, 0, 0, 2, a2);
  uint64_t v34 = *(int *)(type metadata accessor for ForYouState() + 20);
  uint64_t v35 = a2;
  uint64_t v3 = *(void *)(a2 + v34);
  uint64_t v36 = v3 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v3 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain_n();
  int64_t v8 = 0;
  uint64_t v9 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v8 << 6);
    }
    else
    {
      int64_t v14 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v7)
      {
LABEL_37:
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        *(void *)(v35 + v34) = v9;
        return result;
      }
      unint64_t v15 = *(void *)(v36 + 8 * v14);
      ++v8;
      if (!v15)
      {
        int64_t v8 = v14 + 1;
        if (v14 + 1 >= v7) {
          goto LABEL_37;
        }
        unint64_t v15 = *(void *)(v36 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 2;
          if (v14 + 2 >= v7) {
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v36 + 8 * v8);
          if (!v15)
          {
            int64_t v8 = v14 + 3;
            if (v14 + 3 >= v7) {
              goto LABEL_37;
            }
            unint64_t v15 = *(void *)(v36 + 8 * v8);
            if (!v15)
            {
              int64_t v8 = v14 + 4;
              if (v14 + 4 >= v7) {
                goto LABEL_37;
              }
              unint64_t v15 = *(void *)(v36 + 8 * v8);
              if (!v15)
              {
                int64_t v16 = v14 + 5;
                if (v16 >= v7) {
                  goto LABEL_37;
                }
                unint64_t v15 = *(void *)(v36 + 8 * v16);
                if (!v15)
                {
                  while (1)
                  {
                    int64_t v8 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_41;
                    }
                    if (v8 >= v7) {
                      goto LABEL_37;
                    }
                    unint64_t v15 = *(void *)(v36 + 8 * v8);
                    ++v16;
                    if (v15) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v8 = v16;
              }
            }
          }
        }
      }
LABEL_25:
      unint64_t v6 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v8 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v22 = sub_24EFEC090(v19, v18);
    uint64_t v23 = v9[2];
    BOOL v24 = (v21 & 1) == 0;
    uint64_t v25 = v23 + v24;
    if (__OFADD__(v23, v24)) {
      break;
    }
    char v26 = v21;
    if (v9[3] >= v25)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v21) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_24EFEC4E0();
        if (v26) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_24EFEC1EC(v25, isUniquelyReferenced_nonNull_native);
      unint64_t v27 = sub_24EFEC090(v19, v18);
      if ((v26 & 1) != (v28 & 1)) {
        goto LABEL_42;
      }
      unint64_t v22 = v27;
      if (v26)
      {
LABEL_4:
        uint64_t v10 = v9[7];
        unint64_t v11 = *(void *)(v10 + 8 * v22);
        *(void *)(v10 + 8 * v22) = 0;
        sub_24EFC8E94(v11);
        goto LABEL_5;
      }
    }
    v9[(v22 >> 6) + 8] |= 1 << v22;
    uint64_t v29 = (uint64_t *)(v9[6] + 16 * v22);
    *uint64_t v29 = v19;
    v29[1] = v18;
    *(void *)(v9[7] + 8 * v22) = 0;
    uint64_t v30 = v9[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31) {
      goto LABEL_39;
    }
    v9[2] = v32;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  uint64_t result = sub_24EFED8C0();
  __break(1u);
  return result;
}

uint64_t sub_24EFEAEA8(uint64_t a1, uint64_t a2)
{
  return ForYouFeature.dispose(localState:sharedState:)(a1, a2);
}

void sub_24EFEAEC0(uint64_t a1, uint64_t a2, unint64_t *a3, long long *a4)
{
  sub_24EFAFDA0(a4, v7);
  ForYouFeature.reduce(localState:sharedState:sideEffects:action:)(a1, a2, a3, v7);
}

uint64_t sub_24EFEAF18(uint64_t a1, int *a2)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFEAFF4;
  return v6(a1);
}

uint64_t sub_24EFEAFF4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EFEB0EC()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB0F4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE43B4(a1, v1 + 16);
}

uint64_t sub_24EFEB190()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB198(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE4D30(a1, v1 + 16);
}

uint64_t sub_24EFEB234()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB23C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE56AC(a1, v1 + 16);
}

uint64_t sub_24EFEB2D8()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB2E0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE5F70(a1, v1 + 16);
}

uint64_t sub_24EFEB37C()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB384(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE68E8(a1, v1 + 16);
}

uint64_t sub_24EFEB420()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB428(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE72C8(a1, v1 + 16);
}

uint64_t sub_24EFEB4C4()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB4CC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE7C44(a1, v1 + 16);
}

uint64_t sub_24EFEB568()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB570(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE85BC(a1, v1 + 16);
}

uint64_t sub_24EFEB60C()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB614(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE8F18(a1, v1 + 16);
}

uint64_t sub_24EFEB6B0()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB6B8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFE9894(a1, v1 + 16);
}

uint64_t sub_24EFEB754()
{
  return objectdestroyTm_0(320);
}

uint64_t sub_24EFEB75C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EFD87B0;
  return sub_24EFEA210(a1, v1 + 16);
}

uint64_t sub_24EFEB7F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24EFEB8CC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24EFECC48((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_24EFECC48((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24EFEB8CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_24EFED680();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24EFEBA88(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_24EFED6D0();
  if (!v8)
  {
    sub_24EFED720();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24EFED750();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_24EFEBA88(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24EFEBB20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24EFEBD00(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24EFEBD00(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24EFEBB20(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_24EFEBC98(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24EFED6A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24EFED720();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24EFED570();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24EFED750();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24EFED720();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24EFEBC98(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1E8980);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  _OWORD v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24EFEBD00(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1E8980);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24EFED750();
  __break(1u);
  return result;
}

uint64_t sub_24EFEBE54(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_24EFD87B0;
  return sub_24EFE34D0(a1, v4, v5, v1 + 32);
}

uint64_t objectdestroy_47Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 336, 7);
}

uint64_t sub_24EFEBFDC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_24EFD7DAC;
  return sub_24EFE30A8(a1, v4, v5, v1 + 32);
}

unint64_t sub_24EFEC090(uint64_t a1, uint64_t a2)
{
  sub_24EFED940();
  sub_24EFED560();
  uint64_t v4 = sub_24EFED980();
  return sub_24EFEC108(a1, a2, v4);
}

unint64_t sub_24EFEC108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24EFED8B0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24EFED8B0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24EFEC1EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88B0);
  char v37 = a2;
  uint64_t v6 = sub_24EFED740();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v35;
        if ((v37 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v36 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    char v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    unint64_t v29 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      sub_24EFC8E84(v29);
    }
    sub_24EFED940();
    sub_24EFED560();
    uint64_t result = sub_24EFED980();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v32 = v17 == v31;
        if (v17 == v31) {
          unint64_t v17 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *uint64_t v19 = v28;
    v19[1] = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_24EFEC4E0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E88B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24EFED730();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_24EFC8E84(v20);
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24EFEC680(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EFEC6B8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24EFEC6F0(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24EFD87B0;
  return sub_24EFE2E18(a1, v5, v4);
}

unint64_t sub_24EFEC79C()
{
  unint64_t result = qword_26B1E8640;
  if (!qword_26B1E8640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8640);
  }
  return result;
}

unint64_t sub_24EFEC7F4()
{
  unint64_t result = qword_26B1E8638;
  if (!qword_26B1E8638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8638);
  }
  return result;
}

unint64_t sub_24EFEC84C()
{
  unint64_t result = qword_26B1E8468[0];
  if (!qword_26B1E8468[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B1E8468);
  }
  return result;
}

unint64_t sub_24EFEC8A4()
{
  unint64_t result = qword_26B1E84F0;
  if (!qword_26B1E84F0)
  {
    type metadata accessor for ForYouState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E84F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouFeature()
{
  return &type metadata for ForYouFeature;
}

uint64_t getEnumTagSinglePayload for ForYouFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEB) {
    goto LABEL_17;
  }
  if (a2 + 21 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 21) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 21;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 21;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 21;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x16;
  int v8 = v6 - 22;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ForYouFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 21 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 21) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEA)
  {
    unsigned int v6 = ((a2 - 235) >> 8) + 1;
    *unint64_t result = a2 + 21;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24EFECA68);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 21;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouFeature.TaskIdentifier()
{
  return &type metadata for ForYouFeature.TaskIdentifier;
}

unint64_t sub_24EFECAA4()
{
  unint64_t result = qword_26B1E8650;
  if (!qword_26B1E8650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E8650);
  }
  return result;
}

uint64_t sub_24EFECAF8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E8898);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24EFECB58()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24EFECB90(uint64_t a1)
{
  unsigned int v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24EFD87B0;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269998D30 + dword_269998D30);
  return v6(a1, v4);
}

uint64_t sub_24EFECC48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_24EFECD58()
{
  return objectdestroyTm_0(322);
}

uint64_t objectdestroyTm_0(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24EFECE34(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  char v5 = *(unsigned char *)(v1 + 321);
  char v6 = *(unsigned char *)(v1 + 320);
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_24EFD7DAC;
  return sub_24EFDD0F0(a1, v4, v6, v5);
}

unint64_t sub_24EFECEE8()
{
  unint64_t result = qword_269998D58;
  if (!qword_269998D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269998D58);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24EFECF70()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_24EFECF80()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24EFECF90()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24EFECFA0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24EFECFB0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24EFECFC0()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_24EFECFD0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24EFECFE0()
{
  return MEMORY[0x270F2B370]();
}

uint64_t sub_24EFECFF0()
{
  return MEMORY[0x270F2B378]();
}

uint64_t sub_24EFED000()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24EFED010()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24EFED020()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24EFED030()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_24EFED040()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_24EFED050()
{
  return MEMORY[0x270EFEF78]();
}

uint64_t sub_24EFED060()
{
  return MEMORY[0x270EFEFA0]();
}

uint64_t sub_24EFED070()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_24EFED080()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_24EFED090()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24EFED0A0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24EFED0B0()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_24EFED0C0()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_24EFED0D0()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_24EFED0E0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24EFED0F0()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24EFED100()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24EFED110()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_24EFED120()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_24EFED130()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24EFED140()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24EFED150()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_24EFED160()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24EFED170()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24EFED180()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24EFED190()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24EFED1A0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24EFED1B0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24EFED1C0()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_24EFED1D0()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_24EFED1E0()
{
  return MEMORY[0x270F01CD8]();
}

uint64_t sub_24EFED1F0()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_24EFED200()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24EFED210()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_24EFED220()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_24EFED230()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_24EFED240()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_24EFED250()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24EFED260()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24EFED270()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24EFED280()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24EFED290()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24EFED2A0()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_24EFED2B0()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_24EFED2C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24EFED2D0()
{
  return MEMORY[0x270F03A78]();
}

uint64_t sub_24EFED2E0()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_24EFED2F0()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_24EFED300()
{
  return MEMORY[0x270F04038]();
}

uint64_t sub_24EFED310()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_24EFED320()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_24EFED330()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_24EFED340()
{
  return MEMORY[0x270F041E8]();
}

uint64_t sub_24EFED350()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_24EFED360()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24EFED370()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_24EFED380()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_24EFED390()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_24EFED3A0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24EFED3B0()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_24EFED3C0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24EFED3D0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24EFED3E0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24EFED3F0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24EFED400()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_24EFED410()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_24EFED420()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_24EFED430()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24EFED440()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24EFED450()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_24EFED460()
{
  return MEMORY[0x270F050C0]();
}

uint64_t sub_24EFED470()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_24EFED480()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24EFED490()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24EFED4B0()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24EFED4C0()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24EFED4D0()
{
  return MEMORY[0x270F253B0]();
}

uint64_t sub_24EFED4E0()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24EFED4F0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24EFED500()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24EFED510()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24EFED520()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24EFED530()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_24EFED540()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24EFED550()
{
  return MEMORY[0x270F2CE98]();
}

uint64_t sub_24EFED560()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24EFED570()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24EFED580()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24EFED590()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24EFED5A0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24EFED5B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24EFED5D0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24EFED5E0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24EFED5F0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24EFED600()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24EFED610()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24EFED630()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24EFED640()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24EFED650()
{
  return MEMORY[0x270F620F8]();
}

uint64_t sub_24EFED660()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24EFED670()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24EFED680()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24EFED690()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24EFED6A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24EFED6B0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24EFED6C0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24EFED6D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24EFED6E0()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24EFED6F0()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24EFED700()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24EFED710()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24EFED720()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24EFED730()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24EFED740()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24EFED750()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24EFED760()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24EFED770()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24EFED780()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24EFED790()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24EFED7A0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_24EFED7B0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24EFED7C0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24EFED7D0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24EFED7E0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24EFED7F0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24EFED800()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24EFED810()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24EFED820()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24EFED830()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24EFED840()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_24EFED850()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24EFED860()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24EFED870()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24EFED880()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24EFED890()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24EFED8A0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24EFED8B0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24EFED8C0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24EFED8D0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24EFED8F0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24EFED900()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24EFED910()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24EFED920()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24EFED930()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24EFED940()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24EFED950()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24EFED960()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24EFED970()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24EFED980()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24EFED990()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24EFED9A0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24EFED9B0()
{
  return MEMORY[0x270F9FFE8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}