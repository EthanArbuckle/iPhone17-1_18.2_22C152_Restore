uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
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

void sub_2476F2290()
{
  qword_26925E968 = 0x6E6C7566646E694DLL;
  unk_26925E970 = 0xEB00000000737365;
}

uint64_t static MindfulnessAccessibilityIdentifier.base.getter()
{
  return sub_2476F245C(&qword_26925E960, &qword_26925E968);
}

uint64_t sub_2476F22E4()
{
  sub_2477098D0();
  if (qword_26925E960 != -1) {
    swift_once();
  }
  uint64_t result = swift_bridgeObjectRelease();
  qword_26925E980 = 0xD00000000000001ELL;
  *(void *)algn_26925E988 = 0x800000024770B300;
  return result;
}

uint64_t static MindfulnessAccessibilityIdentifier.SessionSummaryView.base.getter()
{
  return sub_2476F245C(&qword_26925E978, &qword_26925E980);
}

uint64_t sub_2476F23A4()
{
  if (qword_26925E978 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26925E980;
  uint64_t v2 = *(void *)algn_26925E988;
  swift_bridgeObjectRetain();
  uint64_t result = sub_247709710();
  qword_26925E998 = v1;
  unk_26925E9A0 = v2;
  return result;
}

uint64_t static MindfulnessAccessibilityIdentifier.SessionSummaryView.closeButton.getter()
{
  return sub_2476F245C(&qword_26925E990, &qword_26925E998);
}

uint64_t sub_2476F245C(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t static MindfulnessAccessibilityIdentifier.build(_:)()
{
  return sub_2477096B0();
}

unint64_t sub_2476F2504()
{
  unint64_t result = qword_26B130600;
  if (!qword_26B130600)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1305F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B130600);
  }
  return result;
}

ValueMetadata *type metadata accessor for MindfulnessAccessibilityIdentifier()
{
  return &type metadata for MindfulnessAccessibilityIdentifier;
}

ValueMetadata *type metadata accessor for MindfulnessAccessibilityIdentifier.SessionSummaryView()
{
  return &type metadata for MindfulnessAccessibilityIdentifier.SessionSummaryView;
}

void sub_2476F2580(void *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_2476F2588(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_2476F259C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2476F25A8(void *a1@<X8>)
{
  *a1 = *v1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2476F25C4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2476F25E4(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for FitnessPlusSessionProvider.SessionInformation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2476F2660(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2476F2680(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_2476F26D4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t HKWorkout.isFitnessPlusWorkout.getter()
{
  id v1 = objc_msgSend(v0, sel_metadata);
  if (!v1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    goto LABEL_8;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2477096A0();

  uint64_t v4 = sub_2477095F0();
  if (!*(void *)(v3 + 16) || (unint64_t v6 = sub_2476F3204(v4, v5), (v7 & 1) == 0))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_2476F327C(*(void *)(v3 + 56) + 32 * v6, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v11 + 1))
  {
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = 1;
LABEL_9:
  sub_2476F3340((uint64_t)&v10, &qword_26B130638);
  return v8;
}

BOOL sub_2476F281C()
{
  uint64_t v1 = sub_2477094D0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  v32 = &v30[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305D0);
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = &v30[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305C8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  v33 = &v30[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v12 = &v30[-v11];
  MEMORY[0x270FA5388](v10);
  v14 = &v30[-v13];
  id v34 = v0;
  id v15 = objc_msgSend(v0, sel_metadata);
  if (v15)
  {
    v16 = v15;
    sub_2477096A0();
  }
  sub_2477094A0();
  sub_2477094C0();
  sub_2477094B0();
  v17 = (void *)sub_247709480();
  swift_release();
  swift_bridgeObjectRelease();
  if (v17)
  {
    id v18 = v17;
    sub_247709490();

    v19 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v19(v14, 0, 1, v1);
  }
  else
  {
    v19 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v19(v14, 1, 1, v1);
  }
  (*(void (**)(unsigned char *, void, uint64_t))(v2 + 104))(v12, *MEMORY[0x263F87E08], v1);
  v19(v12, 0, 1, v1);
  uint64_t v20 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_2476F32D8((uint64_t)v14, (uint64_t)v6);
  sub_2476F32D8((uint64_t)v12, v20);
  v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v21((uint64_t)v6, 1, v1) == 1)
  {
    sub_2476F3340((uint64_t)v12, &qword_26B1305C8);
    sub_2476F3340((uint64_t)v14, &qword_26B1305C8);
    if (v21(v20, 1, v1) == 1)
    {
      sub_2476F3340((uint64_t)v6, &qword_26B1305C8);
LABEL_13:

      return 1;
    }
    goto LABEL_11;
  }
  v22 = v33;
  sub_2476F32D8((uint64_t)v6, (uint64_t)v33);
  if (v21(v20, 1, v1) == 1)
  {
    sub_2476F3340((uint64_t)v12, &qword_26B1305C8);
    sub_2476F3340((uint64_t)v14, &qword_26B1305C8);
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v22, v1);
LABEL_11:
    sub_2476F3340((uint64_t)v6, &qword_26B1305D0);
    goto LABEL_14;
  }
  v23 = v32;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 32))(v32, v20, v1);
  sub_2476F339C();
  int v31 = sub_2477096C0();
  v24 = *(void (**)(unsigned char *, uint64_t))(v2 + 8);
  v24(v23, v1);
  sub_2476F3340((uint64_t)v12, &qword_26B1305C8);
  sub_2476F3340((uint64_t)v14, &qword_26B1305C8);
  v24(v22, v1);
  sub_2476F3340((uint64_t)v6, &qword_26B1305C8);
  if (v31) {
    goto LABEL_13;
  }
LABEL_14:
  id v26 = v34;
  if (objc_msgSend(v34, sel_workoutActivityType) == (id)82)
  {

    return 0;
  }
  else
  {
    id v27 = objc_msgSend(v26, sel_workoutActivities);
    sub_2476F33F4();
    unint64_t v28 = sub_247709740();

    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_247709920();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();

    return v29 > 1;
  }
}

uint64_t sub_2476F2D68()
{
  return sub_2476F2D80(MEMORY[0x263F87E00]);
}

uint64_t sub_2476F2D74()
{
  return sub_2476F2D80(MEMORY[0x263F87DF8]);
}

uint64_t sub_2476F2D80(unsigned int *a1)
{
  v32 = a1;
  uint64_t v2 = sub_2477094D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v31 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305D0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305C8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v33 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v30 - v12;
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v30 - v14;
  id v16 = objc_msgSend(v1, sel_metadata);
  if (v16)
  {
    v17 = v16;
    sub_2477096A0();
  }
  sub_2477094A0();
  sub_2477094C0();
  sub_2477094B0();
  id v18 = (void *)sub_247709480();
  swift_release();
  swift_bridgeObjectRelease();
  if (v18)
  {
    id v19 = v18;
    sub_247709490();

    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v20(v15, 0, 1, v2);
  }
  else
  {
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v20(v15, 1, 1, v2);
  }
  uint64_t v21 = (uint64_t)v33;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v13, *v32, v2);
  v20(v13, 0, 1, v2);
  uint64_t v22 = (uint64_t)&v7[*(int *)(v5 + 48)];
  sub_2476F32D8((uint64_t)v15, (uint64_t)v7);
  sub_2476F32D8((uint64_t)v13, v22);
  v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v23((uint64_t)v7, 1, v2) == 1)
  {

    sub_2476F3340((uint64_t)v13, &qword_26B1305C8);
    sub_2476F3340((uint64_t)v15, &qword_26B1305C8);
    int v24 = v23(v22, 1, v2);
    if (v24 == 1) {
      v25 = &qword_26B1305C8;
    }
    else {
      v25 = &qword_26B1305D0;
    }
    if (v24 == 1) {
      char v26 = -1;
    }
    else {
      char v26 = 0;
    }
  }
  else
  {
    sub_2476F32D8((uint64_t)v7, v21);
    if (v23(v22, 1, v2) == 1)
    {

      sub_2476F3340((uint64_t)v13, &qword_26B1305C8);
      sub_2476F3340((uint64_t)v15, &qword_26B1305C8);
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v21, v2);
      char v26 = 0;
      v25 = &qword_26B1305D0;
    }
    else
    {
      id v27 = v31;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v31, v22, v2);
      sub_2476F339C();
      char v26 = sub_2477096C0();

      unint64_t v28 = *(void (**)(char *, uint64_t))(v3 + 8);
      v28(v27, v2);
      v25 = &qword_26B1305C8;
      sub_2476F3340((uint64_t)v13, &qword_26B1305C8);
      sub_2476F3340((uint64_t)v15, &qword_26B1305C8);
      v28((char *)v21, v2);
    }
  }
  sub_2476F3340((uint64_t)v7, v25);
  return v26 & 1;
}

unint64_t sub_2476F3204(uint64_t a1, uint64_t a2)
{
  sub_247709A00();
  sub_247709700();
  uint64_t v4 = sub_247709A20();
  return sub_2476F3434(a1, a2, v4);
}

uint64_t sub_2476F327C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2476F32D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2476F3340(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2476F339C()
{
  unint64_t result = qword_26925EA50;
  if (!qword_26925EA50)
  {
    sub_2477094D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925EA50);
  }
  return result;
}

unint64_t sub_2476F33F4()
{
  unint64_t result = qword_26B130618;
  if (!qword_26B130618)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B130618);
  }
  return result;
}

unint64_t sub_2476F3434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_247709990() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_247709990() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2476F351C()
{
  sub_247709540();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305C0);
  uint64_t v7 = sub_2476F39C4(&qword_26B1305B8, &qword_26B1305C0);
  __swift_allocate_boxed_opaque_existential_1(v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305E0);
  sub_247709240();
  uint64_t v0 = sub_247709380();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  sub_2477094F0();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305B0);
  uint64_t v7 = sub_2476F39C4(&qword_26B1305A8, &qword_26B1305B0);
  __swift_allocate_boxed_opaque_existential_1(v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305D8);
  sub_247709240();
  uint64_t v1 = sub_247709380();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B130630);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24770A0A0;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  sub_247709370();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_247709360();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s11SeymourCore12DependenciesC10ActivityUIE08activityE05queue18wheelchairUseCacheACSo012OS_dispatch_G0C_So013_HKWheelchairi14CharacteristicJ0CtFZ_0(uint64_t a1, void *a2)
{
  sub_247709280();
  MEMORY[0x24C55A020](a1);
  sub_247709270();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305E8);
  sub_247709270();
  uint64_t v4 = sub_247709520();
  swift_allocObject();
  uint64_t v5 = sub_247709510();
  uint64_t v17 = v4;
  uint64_t v18 = MEMORY[0x263F6B548];
  uint64_t v16 = v5;
  sub_2476F3918((uint64_t)v19, (uint64_t)v15);
  sub_247709540();
  swift_allocObject();
  swift_retain();
  sub_247709530();
  sub_247709680();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v8 = sub_2477095D0();
  swift_allocObject();
  uint64_t v9 = sub_2477095C0();
  uint64_t v17 = v8;
  uint64_t v18 = MEMORY[0x263F685C0];
  uint64_t v16 = v9;
  uint64_t v10 = sub_247709580();
  swift_allocObject();
  uint64_t v11 = sub_247709560();
  sub_247709570();
  uint64_t v17 = v10;
  uint64_t v18 = MEMORY[0x263F6B5D0];
  uint64_t v16 = v11;
  v15[3] = sub_2476F397C();
  v15[4] = MEMORY[0x263F6B930];
  v15[0] = a2;
  sub_2477094F0();
  swift_allocObject();
  swift_retain();
  id v12 = a2;
  sub_2477094E0();
  uint64_t v13 = sub_247709260();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  swift_release();
  swift_release();
  return v13;
}

uint64_t sub_2476F3918(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2476F397C()
{
  unint64_t result = qword_26B130620;
  if (!qword_26B130620)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B130620);
  }
  return result;
}

uint64_t sub_2476F39BC()
{
  return sub_2476F351C();
}

uint64_t sub_2476F39C4(unint64_t *a1, uint64_t *a2)
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

id sub_2476F3A14()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F23950]), sel_init);
  id v1 = FIUIColorSpecRGB(0x9Bu, 0x6Eu, 0xFAu);
  objc_msgSend(v0, sel_setNonGradientTextColor_, v1);

  id v2 = FIUIColorSpecRGB(0x16u, 0x10u, 0x28u);
  objc_msgSend(v0, sel_setGradientDarkColor_, v2);

  id v3 = FIUIColorSpecRGB(0x2Fu, 0x21u, 0x5Au);
  objc_msgSend(v0, sel_setGradientLightColor_, v3);

  id v4 = FIUIColorSpecRGB(0x9Bu, 0x6Eu, 0xFAu);
  objc_msgSend(v0, sel_setAdjustmentButtonBackgroundColor_, v4);

  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_whiteColor);
  objc_msgSend(v0, sel_setValueDisplayColor_, v6);

  id v7 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonTextColor_, v7);

  id v8 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonDisabledTextColor_, v8);

  return v0;
}

id sub_2476F3BCC()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F23950]), sel_init);
  id v1 = FIUIColorSpecRGB(0, 0xFFu, 0xA8u);
  objc_msgSend(v0, sel_setNonGradientTextColor_, v1);

  id v2 = FIUIColorSpecRGB(2u, 0x23u, 0x1Cu);
  objc_msgSend(v0, sel_setGradientDarkColor_, v2);

  id v3 = FIUIColorSpecRGB(4u, 0x33u, 0x23u);
  objc_msgSend(v0, sel_setGradientLightColor_, v3);

  id v4 = FIUIColorSpecRGB(0, 0xFFu, 0xA8u);
  objc_msgSend(v0, sel_setAdjustmentButtonBackgroundColor_, v4);

  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_whiteColor);
  objc_msgSend(v0, sel_setValueDisplayColor_, v6);

  id v7 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonTextColor_, v7);

  id v8 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonDisabledTextColor_, v8);

  return v0;
}

id sub_2476F3D84()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F23950]), sel_init);
  id v1 = FIUIColorSpecRGB(0x3Au, 0xE9u, 0xE6u);
  objc_msgSend(v0, sel_setNonGradientTextColor_, v1);

  id v2 = FIUIColorSpecRGB(0, 0x25u, 0x22u);
  objc_msgSend(v0, sel_setGradientDarkColor_, v2);

  id v3 = FIUIColorSpecRGB(0, 0x3Du, 0x39u);
  objc_msgSend(v0, sel_setGradientLightColor_, v3);

  id v4 = FIUIColorSpecRGB(0x3Au, 0xE9u, 0xE6u);
  objc_msgSend(v0, sel_setAdjustmentButtonBackgroundColor_, v4);

  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_whiteColor);
  objc_msgSend(v0, sel_setValueDisplayColor_, v6);

  id v7 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonTextColor_, v7);

  id v8 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonDisabledTextColor_, v8);

  return v0;
}

id sub_2476F3F3C(id a1)
{
  uint64_t v2 = sub_2477094D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_workoutActivityType) == (id)84)
  {
    a1 = objc_msgSend(self, sel_diveColors);
    if (a1) {
      return a1;
    }
    __break(1u);
  }
  id v6 = objc_msgSend(a1, sel_metadata);
  if (v6)
  {
    id v7 = v6;
    sub_2477096A0();
  }
  sub_2477094A0();
  sub_2477094C0();
  sub_2477094B0();
  id v8 = (void *)sub_247709480();
  swift_release();
  swift_bridgeObjectRelease();
  if (v8)
  {
    sub_247709490();
    int v9 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
    if (v9 == *MEMORY[0x263F87DF0])
    {
      sub_247709470();
      if (swift_dynamicCastClass())
      {
        id v10 = v8;
        uint64_t v11 = (void *)sub_247709460();
        id v12 = objc_msgSend(v11, sel_goalTypeIdentifier);

        id v13 = objc_msgSend(self, sel_metricColorsForGoalTypeIdentifier_, v12);
        return v13;
      }
      id result = objc_msgSend(self, sel_metricColorsForGoalTypeIdentifier_, objc_msgSend(a1, sel__goalType));
      goto LABEL_26;
    }
    if (v9 == *MEMORY[0x263F87E08])
    {
      id result = sub_2476F3A14();
LABEL_26:
      a1 = result;

      return a1;
    }
    if (v9 == *MEMORY[0x263F87DF8])
    {
      id result = sub_2476F3BCC();
      goto LABEL_26;
    }
    if (v9 == *MEMORY[0x263F87E00])
    {
      id result = sub_2476F3D84();
      goto LABEL_26;
    }
    if (v9 != *MEMORY[0x263F87DE8])
    {
      a1 = objc_msgSend(self, sel_metricColorsForGoalTypeIdentifier_, objc_msgSend(a1, sel__goalType));

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return a1;
    }
    id result = objc_msgSend(self, sel_noMetricColors);
    if (result) {
      goto LABEL_26;
    }
    __break(1u);
  }
  else if (sub_2476F281C())
  {
    return sub_2476F3A14();
  }
  else
  {
    id v15 = objc_msgSend(self, sel_metricColorsForGoalTypeIdentifier_, objc_msgSend(a1, sel__goalType));
    return v15;
  }
  return result;
}

id FIUIColorSpecRGB(unsigned int a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:(double)a1 / 255.0 green:(double)a2 / 255.0 blue:(double)a3 / 255.0 alpha:1.0];
  return v3;
}

uint64_t sub_2476F43A8(double a1, double a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827A0]), sel_initWithSize_, a1, a2);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  *(double *)(v6 + 24) = a1;
  *(double *)(v6 + 32) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2476F45BC;
  *(void *)(v7 + 24) = v6;
  v13[4] = sub_2476F45E8;
  v13[5] = v7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_247706E90;
  v13[3] = &block_descriptor;
  id v8 = _Block_copy(v13);
  id v9 = v2;
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v5, sel_imageWithActions_, v8);

  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v5)
  {
    __break(1u);
  }
  else
  {
    id v12 = objc_msgSend(v10, sel_imageWithRenderingMode_, objc_msgSend(v9, sel_renderingMode));
    swift_release();

    return (uint64_t)v12;
  }
  return result;
}

uint64_t sub_2476F4584()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_2476F45BC()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_2476F45D8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2476F45E8(uint64_t a1)
{
  return sub_247706E68(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2476F4608()
{
  uint64_t v0 = sub_247709840();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_247709670();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_247709830();
  MEMORY[0x270FA5388](v5 - 8);
  sub_2476FBAB8(0, &qword_26B130250);
  sub_247709820();
  sub_247709660();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_247709870();
  qword_26925EA58 = result;
  return result;
}

unint64_t sub_2476F47C0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAE8);
  uint64_t v2 = (void *)sub_247709950();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (char *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 3);
    uint64_t v6 = *((void *)v4 - 2);
    uint64_t v7 = (void *)*((void *)v4 - 1);
    char v8 = *v4;
    swift_bridgeObjectRetain();
    sub_2476FB160(v7, v8);
    unint64_t result = sub_2476F3204(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = v2[7] + 16 * result;
    *(void *)uint64_t v12 = v7;
    *(unsigned char *)(v12 + 8) = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    v4 += 32;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t AppIconImageProvider.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_2476F47C0(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t AppIconImageProvider.init()()
{
  *(void *)(v0 + 16) = sub_2476F47C0(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t sub_2476F495C(uint64_t a1, uint64_t a2, char a3, double a4)
{
  *(void *)(v5 + 136) = v4;
  *(double *)(v5 + 128) = a4;
  *(unsigned char *)(v5 + 73) = a3;
  *(void *)(v5 + 112) = a1;
  *(void *)(v5 + 120) = a2;
  *(void *)(v5 + 144) = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B130610);
  *(void *)(v5 + 152) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2476F4A24, 0, 0);
}

uint64_t sub_2476F4A24()
{
  uint64_t v44 = v0;
  if (qword_26925EA30 != -1) {
    swift_once();
  }
  uint64_t v1 = (const void *)(v0 + 16);
  uint64_t v2 = v0 + 64;
  uint64_t v3 = sub_247709620();
  __swift_project_value_buffer(v3, (uint64_t)qword_26925ED80);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_247709600();
  os_log_type_t v5 = sub_247709810();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = *(void *)(v0 + 120);
  if (v6)
  {
    uint64_t v42 = *(void *)(v0 + 112);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v43 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v0 + 96) = sub_2476F9E40(0xD00000000000002ELL, 0x800000024770B380, &v43);
    sub_2477098A0();
    *(_WORD *)(v8 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 104) = sub_2476F9E40(v42, v7, &v43);
    uint64_t v2 = v0 + 64;
    uint64_t v1 = (const void *)(v0 + 16);
    sub_2477098A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2476F0000, v4, v5, "%s bundleID: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C55ACF0](v9, -1, -1);
    MEMORY[0x24C55ACF0](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v10 = sub_2476FAD60(*(void *)(v0 + 112), *(void *)(v0 + 120), *(unsigned char *)(v0 + 73), *(double *)(v0 + 128));
  uint64_t v12 = v11;
  *(void *)(v0 + 160) = v10;
  *(void *)(v0 + 168) = v11;
  *(void *)(v0 + 64) = 0;
  *(unsigned char *)(v0 + 72) = -1;
  if (qword_26925E9A8 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void *)(v0 + 136);
  BOOL v14 = qword_26925EA58;
  uint64_t v15 = (void *)swift_allocObject();
  *(void *)(v0 + 176) = v15;
  v15[2] = v2;
  v15[3] = v13;
  v15[4] = v10;
  void v15[5] = v12;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_2476FAEA4;
  *(void *)(v16 + 24) = v15;
  *(void *)(v0 + 48) = sub_2476FAEC0;
  *(void *)(v0 + 56) = v16;
  *(void *)(v0 + 16) = MEMORY[0x263EF8330];
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_2476F5A8C;
  *(void *)(v0 + 40) = &block_descriptor_0;
  uint64_t v17 = _Block_copy(v1);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v14, v17);
  _Block_release(v17);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  uint64_t v18 = swift_release();
  if (v13)
  {
    __break(1u);
    return MEMORY[0x270FA1FA8](v18, v19, v20, v21, v22);
  }
  v23 = *(void **)(v0 + 64);
  *(void *)(v0 + 184) = v23;
  int v24 = *(unsigned __int8 *)(v0 + 72);
  *(unsigned char *)(v0 + 74) = v24;
  if (v24 == 255)
  {
    uint64_t v26 = *(void *)(v0 + 144);
    uint64_t v25 = *(void *)(v0 + 152);
    uint64_t v27 = *(void *)(v0 + 136);
    uint64_t v28 = *(void *)(v0 + 128);
    char v29 = *(unsigned char *)(v0 + 73);
    uint64_t v31 = *(void *)(v0 + 112);
    uint64_t v30 = *(void *)(v0 + 120);
    sub_2477097A0();
    uint64_t v32 = sub_2477097C0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v25, 0, 1, v32);
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = 0;
    *(void *)(v33 + 24) = 0;
    *(unsigned char *)(v33 + 32) = v29;
    *(void *)(v33 + 40) = v27;
    *(void *)(v33 + 48) = v31;
    *(void *)(v33 + 56) = v30;
    *(void *)(v33 + 64) = v28;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v34 = sub_2476F6FC8(v25, (uint64_t)&unk_26925EA70, v33);
    *(void *)(v0 + 208) = v34;
    uint64_t v35 = swift_task_alloc();
    *(void *)(v0 + 216) = v35;
    *(void *)(v35 + 16) = v27;
    *(void *)(v35 + 24) = v10;
    *(void *)(v35 + 32) = v12;
    *(void *)(v35 + 40) = v34;
    *(unsigned char *)(v35 + 48) = 0;
    *(void *)(v35 + 56) = v26;
    v36 = (void *)swift_task_alloc();
    *(void *)(v0 + 224) = v36;
    void *v36 = v0;
    uint64_t v37 = MEMORY[0x263F8EE60];
    v36[1] = sub_2476F5284;
    return MEMORY[0x270FA2318](v36, 0, 0, 0xD000000000000017, 0x800000024770B360, sub_2476FB124, v35, v37 + 8);
  }
  sub_2476FB160(v23, v24 & 1);
  swift_bridgeObjectRelease();
  if ((v24 & 1) == 0)
  {
    sub_2476FB160(v23, 0);
    v39 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v39;
    uint64_t v40 = sub_2476FBAB8(0, (unint64_t *)&qword_26B130628);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EA78);
    void *v39 = v0;
    v39[1] = sub_2476F50C0;
    uint64_t v22 = MEMORY[0x263F8E4E0];
    uint64_t v18 = v0 + 88;
    id v19 = v23;
    uint64_t v20 = v40;
    return MEMORY[0x270FA1FA8](v18, v19, v20, v21, v22);
  }
  sub_2476FB128(*(void **)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_task_dealloc();
  v38 = *(uint64_t (**)(void *))(v0 + 8);
  return v38(v23);
}

uint64_t sub_2476F50C0()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2476F5878;
  }
  else {
    uint64_t v2 = sub_2476F51D4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2476F51D4()
{
  uint64_t v1 = *(void **)(v0 + 184);
  unsigned __int8 v2 = *(unsigned char *)(v0 + 74);
  sub_2476FB128(v1, v2);
  sub_2476FB128(v1, v2);
  uint64_t v3 = *(void *)(v0 + 88);
  sub_2476FB128(*(void **)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_2476F5284()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2476F539C, 0, 0);
}

uint64_t sub_2476F539C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v1;
  uint64_t v2 = sub_2476FBAB8(0, (unint64_t *)&qword_26B130628);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EA78);
  *uint64_t v1 = v0;
  v1[1] = sub_2476F547C;
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v0 + 80, v4, v2, v3, v5);
}

uint64_t sub_2476F547C()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2476F5920;
  }
  else
  {
    uint64_t v2 = sub_2476F5598;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2476F5598()
{
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v4 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v5 = (void *)v0[10];
  v0[31] = v5;
  id v6 = v5;
  uint64_t v7 = swift_task_alloc();
  v0[32] = v7;
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v2;
  *(void *)(v7 + 32) = v1;
  *(void *)(v7 + 40) = v5;
  *(unsigned char *)(v7 + 48) = 1;
  *(void *)(v7 + 56) = v3;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[33] = v8;
  *uint64_t v8 = v0;
  uint64_t v9 = MEMORY[0x263F8EE60];
  v8[1] = sub_2476F56B4;
  return MEMORY[0x270FA2318](v8, 0, 0, 0xD000000000000017, 0x800000024770B360, sub_2476FB124, v7, v9 + 8);
}

uint64_t sub_2476F56B4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2476F57CC, 0, 0);
}

uint64_t sub_2476F57CC()
{
  uint64_t v1 = *(void **)(v0 + 248);
  swift_bridgeObjectRelease();

  swift_release();
  uint64_t v2 = *(void *)(v0 + 248);
  sub_2476FB128(*(void **)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_2476F5878()
{
  uint64_t v1 = *(void **)(v0 + 184);
  unsigned __int8 v2 = *(unsigned char *)(v0 + 74);
  sub_2476FB128(v1, v2);
  sub_2476FB128(v1, v2);
  sub_2476FB128(*(void **)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2476F5920()
{
  swift_release();
  sub_2476FB128(*(void **)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_2476F59B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t v8 = *(void *)(a2 + 16);
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_2476F3204(a3, a4);
    if (v10)
    {
      uint64_t v11 = *(void *)(v8 + 56) + 16 * v9;
      id v12 = *(id *)v11;
      char v13 = *(unsigned char *)(v11 + 8);
      sub_2476FB160(*(id *)v11, v13);
    }
    else
    {
      id v12 = 0;
      char v13 = -1;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = 0;
    char v13 = -1;
  }
  BOOL v14 = *(void **)a1;
  *(void *)a1 = v12;
  unsigned __int8 v15 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v13;
  sub_2476FB128(v14, v15);
}

uint64_t sub_2476F5A8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2476F5AB4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, double a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B130610);
  MEMORY[0x270FA5388]();
  BOOL v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2477097C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0;
  *(void *)(v16 + 24) = 0;
  *(void *)(v16 + 32) = v6;
  *(void *)(v16 + 40) = a1;
  *(void *)(v16 + 48) = a2;
  *(unsigned char *)(v16 + 56) = a3;
  *(double *)(v16 + 64) = a6;
  *(void *)(v16 + 72) = a4;
  *(void *)(v16 + 80) = a5;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2476F6310((uint64_t)v14, (uint64_t)&unk_26925EA88, v16);
  return swift_release();
}

uint64_t sub_2476F5C00(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  v9[16] = a9;
  v9[17] = v19;
  uint64_t v14 = sub_247709640();
  v9[18] = v14;
  v9[19] = *(void *)(v14 - 8);
  v9[20] = swift_task_alloc();
  uint64_t v15 = sub_247709670();
  v9[21] = v15;
  v9[22] = *(void *)(v15 - 8);
  v9[23] = swift_task_alloc();
  uint64_t v16 = (void *)swift_task_alloc();
  v9[24] = v16;
  void *v16 = v9;
  v16[1] = sub_2476F5D88;
  return sub_2476F495C(a6, a7, a8, a1);
}

uint64_t sub_2476F5D88(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 200) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2476F60BC;
  }
  else
  {
    *(void *)(v4 + 208) = a1;
    uint64_t v5 = sub_2476F5EB0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2476F5EB0()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[20];
  uint64_t v14 = v0[22];
  uint64_t v15 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  uint64_t v7 = v0[16];
  uint64_t v6 = v0[17];
  sub_2476FBAB8(0, &qword_26B130250);
  uint64_t v13 = (void *)sub_247709850();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = v6;
  v8[4] = v1;
  v0[12] = sub_2476FBC30;
  v0[13] = v8;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_2476F62CC;
  v0[11] = &block_descriptor_56;
  unint64_t v9 = _Block_copy(v0 + 8);
  swift_retain();
  id v10 = v1;
  sub_247709660();
  v0[15] = MEMORY[0x263F8EE78];
  sub_2476FBB3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAC8);
  sub_2476FBB94();
  sub_2477098C0();
  MEMORY[0x24C55A630](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v2, v15);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_2476F60BC()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[20];
  uint64_t v14 = v0[22];
  uint64_t v15 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  uint64_t v6 = v0[16];
  uint64_t v7 = v0[17];
  sub_2476FBAB8(0, &qword_26B130250);
  uint64_t v13 = (void *)sub_247709850();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = v1;
  v0[6] = sub_2476FBB34;
  v0[7] = v8;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_2476F62CC;
  v0[5] = &block_descriptor_49;
  unint64_t v9 = _Block_copy(v0 + 2);
  swift_retain();
  id v10 = v1;
  sub_247709660();
  v0[14] = MEMORY[0x263F8EE78];
  sub_2476FBB3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAC8);
  sub_2476FBB94();
  sub_2477098C0();
  MEMORY[0x24C55A630](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v2, v15);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_2476F62CC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2476F6310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2477097C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2477097B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2476F3340(a1, &qword_26B130610);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247709750();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2476F64BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2477097C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2477097B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2476F3340(a1, &qword_26B130610);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247709750();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_2476FBAB8(0, (unint64_t *)&qword_26B130628);
  return swift_task_create();
}

uint64_t sub_2476F667C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  int v27 = a6;
  uint64_t v31 = a5;
  uint64_t v9 = sub_247709670();
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v33 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v30 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAE0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_247709640();
  uint64_t v28 = *(void *)(v15 - 8);
  uint64_t v29 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26925E9A8 != -1) {
    swift_once();
  }
  uint64_t v26 = qword_26925EA58;
  sub_247709630();
  uint64_t v18 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  unint64_t v19 = (*(unsigned __int8 *)(v12 + 80) + 49) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v18;
  *(void *)(v20 + 24) = a3;
  *(void *)(v20 + 32) = a4;
  uint64_t v21 = v31;
  *(void *)(v20 + 40) = v31;
  char v22 = v27 & 1;
  *(unsigned char *)(v20 + 48) = v27 & 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v20 + v19, v14, v11);
  aBlock[4] = sub_2476FBD8C;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2476F62CC;
  aBlock[3] = &block_descriptor_65;
  v23 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2476FB160(v21, v22);
  int v24 = v30;
  sub_247709660();
  MEMORY[0x24C55A630](0, v24, v17, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v24, v33);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v29);
  swift_release();
  return swift_release();
}

uint64_t sub_2476F6A14(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = Strong;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2476FB160(a4, a5 & 1);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *(void *)(v10 + 16);
    *(void *)(v10 + 16) = 0x8000000000000000;
    sub_2476FA7C8((uint64_t)a4, a5 & 1, a2, a3, isUniquelyReferenced_nonNull_native);
    *(void *)(v10 + 16) = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAE0);
  return sub_247709770();
}

uint64_t sub_2476F6B2C(uint64_t a1, double a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(double *)(v8 + 72) = a2;
  *(void *)(v8 + 64) = a1;
  if (a5)
  {
    uint64_t v12 = swift_task_alloc();
    *(void *)(v8 + 80) = v12;
    *(void *)uint64_t v12 = v8;
    *(void *)(v12 + 8) = sub_2476F6C50;
    *(double *)(v12 + 56) = a2;
    *(void *)(v12 + 40) = a7;
    *(void *)(v12 + 48) = a8;
    uint64_t v13 = sub_2476FC530;
  }
  else
  {
    uint64_t v14 = swift_task_alloc();
    *(void *)(v8 + 88) = v14;
    *(void *)uint64_t v14 = v8;
    *(void *)(v14 + 8) = sub_2476F6E0C;
    *(double *)(v14 + 48) = a2;
    *(void *)(v14 + 32) = a7;
    *(void *)(v14 + 40) = a8;
    uint64_t v13 = sub_2476FD200;
  }
  return MEMORY[0x270FA2498](v13, 0, 0);
}

uint64_t sub_2476F6C50(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = v1;
  uint64_t v4 = (void *)*v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2476F6D88, 0, 0);
  }
}

uint64_t sub_2476F6D88()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(uint64_t **)(v0 + 64);
  uint64_t v3 = sub_2476F43A8(*(double *)(v0 + 72), *(double *)(v0 + 72));

  *uint64_t v2 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2476F6E0C(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[5] = v2;
  v3[6] = a1;
  v3[7] = v1;
  uint64_t v4 = (void *)*v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2476F6F44, 0, 0);
  }
}

uint64_t sub_2476F6F44()
{
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = *(uint64_t **)(v0 + 64);
  uint64_t v3 = sub_2476F43A8(*(double *)(v0 + 72), *(double *)(v0 + 72));

  *uint64_t v2 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2476F6FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2477097C0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2477097B0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2476F3340(a1, &qword_26B130610);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247709750();
    swift_unknownObjectRelease();
  }
LABEL_5:
  sub_2476FBAB8(0, (unint64_t *)&qword_26B130628);
  return swift_task_create();
}

void sub_2476F715C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB58);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v11 = self;
  swift_bridgeObjectRetain();
  id v12 = objc_msgSend(v11, sel_sharedDeviceConnection);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = (void *)sub_2477096D0();
    aBlock[4] = sub_2476FDBFC;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2476F7A94;
    aBlock[3] = &block_descriptor_91;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_fetchWatchAppBundleIDForCompanionAppBundleID_completion_, v14, v15);
    _Block_release(v15);
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2476F7378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a6;
  uint64_t v28 = a1;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v29 = a2;
  uint64_t v33 = sub_247709640();
  uint64_t v36 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v32 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247709670();
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB58);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = sub_247709650();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2476FBAB8(0, &qword_26B130250);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F8F060], v13);
  uint64_t v17 = (void *)sub_247709880();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v10);
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v19 = (char *)swift_allocObject();
  uint64_t v20 = v29;
  *((void *)v19 + 2) = v28;
  *((void *)v19 + 3) = v20;
  uint64_t v21 = v31;
  *((void *)v19 + 4) = v30;
  *((void *)v19 + 5) = v21;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v19[v18], (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  aBlock[4] = sub_2476FDD64;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2476F62CC;
  aBlock[3] = &block_descriptor_97;
  char v22 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_247709660();
  uint64_t v37 = MEMORY[0x263F8EE78];
  sub_2476FBB3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAC8);
  sub_2476FBB94();
  int v24 = v32;
  uint64_t v23 = v33;
  sub_2477098C0();
  MEMORY[0x24C55A630](0, v9, v24, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v24, v23);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v35);
  return swift_release();
}

void sub_2476F77AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v16[1] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB58);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  id v10 = objc_msgSend(self, sel_sharedInstance);
  if (v10)
  {
    uint64_t v11 = v10;
    if (!a2) {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)sub_2477096D0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v7);
    unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v14 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v14 + v13, (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    aBlock[4] = sub_2476FDE68;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2476F7A28;
    aBlock[3] = &block_descriptor_103;
    uint64_t v15 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v11, sel_getIconForBundleID_iconVariant_block_timeout_, v12, 50, v15, 20.0);
    _Block_release(v15);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2476F79E0(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB58);
  return sub_247709770();
}

void sub_2476F7A28(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_2476F7A94(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_2477096E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2476F7B2C(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v25 = a1;
  uint64_t v29 = sub_247709640();
  uint64_t v32 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v28 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247709670();
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v31 = v6;
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB68);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = sub_247709650();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2476FBAB8(0, &qword_26B130250);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F8F060], v12);
  uint64_t v16 = (void *)sub_247709880();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v25, v9);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v27;
  *(void *)(v18 + 16) = v26;
  *(void *)(v18 + 24) = v19;
  *(double *)(v18 + 32) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v18 + v17, (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_2476FDFB8;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2476F62CC;
  aBlock[3] = &block_descriptor_114;
  uint64_t v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  sub_247709660();
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_2476FBB3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAC8);
  sub_2476FBB94();
  char v22 = v28;
  uint64_t v21 = v29;
  sub_2477098C0();
  MEMORY[0x24C55A630](0, v8, v22, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v21);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v31);
  return swift_release();
}

uint64_t sub_2476F7F5C(double a1)
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)sub_2477096D0();
  objc_msgSend(v2, sel__applicationIconImageForBundleIdentifier_format_scale_, v3, 2, a1);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB68);
  return sub_247709770();
}

void sub_2476F8008(uint64_t a1, uint64_t a2, uint64_t a3, int a4, double a5, double a6)
{
  uint64_t v45 = a2;
  uint64_t v43 = a1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v44 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = self;
  id v14 = objc_msgSend(v13, sel_bagSubProfile);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v41 = v10;
    int v42 = a4;
    sub_2477096E0();

    id v16 = objc_msgSend(v13, sel_bagSubProfileVersion);
    if (v16)
    {
      unint64_t v17 = v16;
      sub_2477096E0();

      uint64_t v18 = (void *)sub_2477096D0();
      swift_bridgeObjectRelease();
      uint64_t v19 = (void *)sub_2477096D0();
      swift_bridgeObjectRelease();
      id v20 = objc_msgSend(self, sel_bagForProfile_profileVersion_, v18, v19);

      id v21 = objc_allocWithZone(MEMORY[0x263F27D18]);
      id v22 = v20;
      id v40 = v22;
      uint64_t v23 = (void *)sub_2477096D0();
      uint64_t v24 = (void *)sub_2477096D0();
      id v25 = objc_msgSend(v21, sel_initWithType_clientIdentifier_clientVersion_bag_, 0, v23, v24, v22);

      __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB10);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_24770A0D0;
      uint64_t v27 = v45;
      *(void *)(v26 + 32) = v45;
      *(void *)(v26 + 40) = a3;
      uint64_t v28 = a3;
      swift_bridgeObjectRetain();
      uint64_t v29 = (void *)sub_247709730();
      swift_bridgeObjectRelease();
      id v39 = v25;
      objc_msgSend(v25, sel_setBundleIdentifiers_, v29);

      id v30 = objc_msgSend(v25, sel_perform);
      uint64_t v31 = v44;
      uint64_t v32 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))((char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v43, v41);
      unint64_t v33 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
      unint64_t v34 = (v11 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = v27;
      *(void *)(v35 + 24) = v28;
      (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v35 + v33, v12, v32);
      *(double *)(v35 + v34) = a5;
      unint64_t v36 = v35 + ((v34 + 15) & 0xFFFFFFFFFFFFFFF8);
      *(double *)unint64_t v36 = a6;
      *(unsigned char *)(v36 + 8) = v42 & 1;
      aBlock[4] = sub_2476FD830;
      aBlock[5] = v35;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2476F9804;
      aBlock[3] = &block_descriptor_79;
      uint64_t v37 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      swift_release();
      objc_msgSend(v30, sel_addFinishBlock_, v37);
      _Block_release(v37);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_2476F8414(void *a1, void *a2, void *a3, unint64_t a4, uint64_t a5, int a6, double a7, double a8)
{
  int v96 = a6;
  uint64_t v99 = a5;
  id v97 = a3;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
  uint64_t v94 = *(void *)(v13 - 8);
  uint64_t v14 = *(void *)(v94 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB18);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v16 = (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_247709210();
  uint64_t v95 = *(void *)(v17 - 8);
  uint64_t v18 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v20 = (char *)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  id v22 = (char *)&v92 - v21;
  if (!a1) {
    goto LABEL_14;
  }
  id v23 = objc_msgSend(a1, sel_responseDictionary);
  if (!v23) {
    goto LABEL_14;
  }
  uint64_t v24 = v23;
  uint64_t v25 = sub_2477096A0();
  uint64_t v98 = v13;
  uint64_t v26 = v25;

  unint64_t v27 = sub_2476F91F4(v26);
  uint64_t v13 = v98;
  swift_bridgeObjectRelease();
  if (!v27) {
    goto LABEL_14;
  }
  if (!*(void *)(v27 + 16) || (unint64_t v28 = sub_2476F3204(1635017060, 0xE400000000000000), (v29 & 1) == 0))
  {
    long long aBlock = 0u;
    long long v101 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_2476F327C(*(void *)(v27 + 56) + 32 * v28, (uint64_t)&aBlock);
  swift_bridgeObjectRelease();
  if (!*((void *)&v101 + 1)) {
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB30);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_14;
  }
  if (!*(void *)(v104[0] + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v93 = *(void **)(v104[0] + 32);
  swift_bridgeObjectRetain();
  id v30 = v93;
  swift_bridgeObjectRelease();
  if (v30[2] && (unint64_t v31 = sub_2476F3204(0x7475626972747461, 0xEA00000000007365), (v32 & 1) != 0))
  {
    sub_2476F327C(v30[7] + 32 * v31, (uint64_t)&aBlock);
  }
  else
  {
    long long aBlock = 0u;
    long long v101 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v101 + 1)) {
    goto LABEL_13;
  }
  v49 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_26925EB38);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_14;
  }
  v93 = v49;
  uint64_t v50 = v104[0];
  if (*(void *)(v104[0] + 16) && (unint64_t v51 = sub_2476F3204(0xD000000000000012, 0x800000024770B730), (v52 & 1) != 0))
  {
    sub_2476F327C(*(void *)(v50 + 56) + 32 * v51, (uint64_t)&aBlock);
  }
  else
  {
    long long aBlock = 0u;
    long long v101 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v101 + 1)) {
    goto LABEL_13;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v53 = v104[0];
  if (*(void *)(v104[0] + 16) && (unint64_t v54 = sub_2476F3204(7565161, 0xE300000000000000), (v55 & 1) != 0))
  {
    sub_2476F327C(*(void *)(v53 + 56) + 32 * v54, (uint64_t)&aBlock);
  }
  else
  {
    long long aBlock = 0u;
    long long v101 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v101 + 1)) {
    goto LABEL_13;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v56 = v104[0];
  if (*(void *)(v104[0] + 16) && (unint64_t v57 = sub_2476F3204(0x6B726F77747261, 0xE700000000000000), (v58 & 1) != 0))
  {
    sub_2476F327C(*(void *)(v56 + 56) + 32 * v57, (uint64_t)&aBlock);
  }
  else
  {
    long long aBlock = 0u;
    long long v101 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v101 + 1))
  {
LABEL_13:
    sub_2476F3340((uint64_t)&aBlock, &qword_26B130638);
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB40);
  if (swift_dynamicCast())
  {
    v93 = objc_allocWithZone(MEMORY[0x263F27CD0]);
    v59 = (void *)sub_247709690();
    swift_bridgeObjectRelease();
    v93 = objc_msgSend(v93, sel_initWithArtworkDictionary_, v59);

    double v60 = a7 * a8;
    if (v96)
    {
      if (qword_26925E9B0 != -1) {
        swift_once();
      }
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_2477096E0();
    }
    if ((~*(void *)&v60 & 0x7FF0000000000000) != 0)
    {
      if (v60 > -9.22337204e18)
      {
        if (v60 < 9.22337204e18)
        {
          uint64_t v61 = sub_2477096D0();
          swift_bridgeObjectRelease();
          v62 = (void *)v61;
          id v63 = objc_msgSend(v93, sel_URLWithHeight_width_cropStyle_format_, (uint64_t)v60, (uint64_t)v60, v61, *MEMORY[0x263F27928]);

          if (v63)
          {
            sub_247709200();

            v64 = *(void (**)(char *, char *, uint64_t))(v95 + 32);
            v65 = v20;
            uint64_t v66 = v95;
            v64(v16, v65, v17);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v16, 0, 1, v17);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v16, 1, v17) != 1)
            {
              v64(v22, v16, v17);
              id v67 = objc_msgSend(self, sel_ephemeralSessionConfiguration);
              id v97 = objc_msgSend(self, sel_sessionWithConfiguration_, v67);

              v68 = (void *)sub_2477091F0();
              uint64_t v69 = v94;
              uint64_t v70 = v98;
              (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))((char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v99, v98);
              unint64_t v71 = (*(unsigned __int8 *)(v69 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
              uint64_t v72 = swift_allocObject();
              (*(void (**)(unint64_t, char *, uint64_t))(v69 + 32))(v72 + v71, (char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v70);
              v102 = sub_2476FD958;
              uint64_t v103 = v72;
              *(void *)&long long aBlock = MEMORY[0x263EF8330];
              *((void *)&aBlock + 1) = 1107296256;
              *(void *)&long long v101 = sub_2476F973C;
              *((void *)&v101 + 1) = &block_descriptor_85;
              v73 = _Block_copy(&aBlock);
              swift_release();
              id v74 = v97;
              id v75 = objc_msgSend(v97, sel_dataTaskWithURL_completionHandler_, v68, v73);
              _Block_release(v73);

              objc_msgSend(v75, sel_resume);
              (*(void (**)(char *, uint64_t))(v66 + 8))(v22, v17);
              return;
            }
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v95 + 56))(v16, 1, 1, v17);
          }
          sub_2476F3340((uint64_t)v16, &qword_26925EB18);
          if (qword_26925EA30 == -1) {
            goto LABEL_60;
          }
          goto LABEL_72;
        }
LABEL_71:
        __break(1u);
LABEL_72:
        swift_once();
LABEL_60:
        uint64_t v76 = sub_247709620();
        __swift_project_value_buffer(v76, (uint64_t)qword_26925ED80);
        swift_bridgeObjectRetain();
        id v77 = a2;
        swift_bridgeObjectRetain();
        id v78 = a2;
        v79 = sub_247709600();
        os_log_type_t v80 = sub_247709810();
        if (os_log_type_enabled(v79, v80))
        {
          uint64_t v81 = swift_slowAlloc();
          uint64_t v82 = swift_slowAlloc();
          v104[0] = v82;
          *(_DWORD *)uint64_t v81 = 136315394;
          swift_bridgeObjectRetain();
          *(void *)&long long aBlock = sub_2476F9E40((uint64_t)v97, a4, v104);
          sub_2477098A0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v81 + 12) = 2080;
          if (a2)
          {
            swift_getErrorValue();
            uint64_t v83 = Error.logOutput.getter();
            uint64_t v85 = v84;
          }
          else
          {
            uint64_t v83 = 0;
            uint64_t v85 = 0;
          }
          *(void *)&long long aBlock = v83;
          *((void *)&aBlock + 1) = v85;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB28);
          uint64_t v86 = sub_247709890();
          unint64_t v88 = v87;
          swift_bridgeObjectRelease();
          *(void *)&long long aBlock = sub_2476F9E40(v86, v88, v104);
          sub_2477098A0();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_2476F0000, v79, v80, "Failed to fetch icon from store for bundle id: %s: %s", (uint8_t *)v81, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24C55ACF0](v82, -1, -1);
          MEMORY[0x24C55ACF0](v81, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }
        uint64_t v89 = (uint64_t)a2;
        if (!a2)
        {
          sub_2476FD8F8();
          uint64_t v89 = swift_allocError();
          unsigned char *v90 = 0;
        }
        *(void *)&long long aBlock = v89;
        id v91 = a2;
        sub_247709760();

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_71;
  }
LABEL_14:
  if (qword_26925EA30 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_247709620();
  __swift_project_value_buffer(v33, (uint64_t)qword_26925ED80);
  swift_bridgeObjectRetain();
  id v34 = a2;
  swift_bridgeObjectRetain();
  id v35 = a2;
  unint64_t v36 = sub_247709600();
  os_log_type_t v37 = sub_247709810();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v98 = v13;
    uint64_t v38 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v104[0] = v39;
    *(_DWORD *)uint64_t v38 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long aBlock = sub_2476F9E40((uint64_t)v97, a4, v104);
    sub_2477098A0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v38 + 12) = 2080;
    if (a2)
    {
      swift_getErrorValue();
      uint64_t v40 = Error.logOutput.getter();
      uint64_t v42 = v41;
    }
    else
    {
      uint64_t v40 = 0;
      uint64_t v42 = 0;
    }
    *(void *)&long long aBlock = v40;
    *((void *)&aBlock + 1) = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB28);
    uint64_t v43 = sub_247709890();
    unint64_t v45 = v44;
    swift_bridgeObjectRelease();
    *(void *)&long long aBlock = sub_2476F9E40(v43, v45, v104);
    sub_2477098A0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2476F0000, v36, v37, "Failed to fetch icon from store for bundle id: %s: %s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C55ACF0](v39, -1, -1);
    MEMORY[0x24C55ACF0](v38, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v46 = (uint64_t)a2;
  if (!a2)
  {
    sub_2476FD8F8();
    uint64_t v46 = swift_allocError();
    unsigned char *v47 = 0;
  }
  *(void *)&long long aBlock = v46;
  id v48 = a2;
  sub_247709760();
}

unint64_t sub_2476F91F4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB48);
    uint64_t v2 = (void *)sub_247709950();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_2476FDB14();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_2476FDAB8(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_2476F327C(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_2476FDAB8((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_2476F3340((uint64_t)v30, &qword_26925EB50);
      swift_bridgeObjectRelease();
      sub_2476FDB14();
      swift_release();
      return 0;
    }
    sub_2476F327C((uint64_t)v31 + 8, (uint64_t)v25);
    sub_2476F3340((uint64_t)v30, &qword_26925EB50);
    sub_2476FDB1C(v25, v26);
    long long v27 = v24;
    sub_2476FDB1C(v26, v28);
    long long v16 = v27;
    sub_2476FDB1C(v28, v29);
    sub_2476FDB1C(v29, &v27);
    unint64_t result = sub_2476F3204(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      id v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v8 = v16;
      uint64_t v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      unint64_t result = (unint64_t)sub_2476FDB1C(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_2476FDB1C(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

void sub_2476F95C8(uint64_t a1, unint64_t a2, int a3, id a4)
{
  if (a2 >> 60 == 15)
  {
    if (!a4)
    {
      sub_2476FD8F8();
      swift_allocError();
      a4 = 0;
      *uint64_t v10 = 0;
    }
    id v11 = a4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
    sub_247709760();
  }
  else
  {
    id v6 = objc_allocWithZone(MEMORY[0x263F827E8]);
    sub_2476FDA60(a1, a2);
    int64_t v7 = (void *)sub_247709220();
    id v8 = objc_msgSend(v6, sel_initWithData_, v7);

    if (v8)
    {
      id v9 = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
      sub_247709770();
      sub_2476FD9F4(a1, a2);
    }
    else
    {
      sub_2476FD8F8();
      swift_allocError();
      unsigned char *v12 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
      sub_247709760();
      sub_2476FD9F4(a1, a2);
    }
  }
}

uint64_t sub_2476F973C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  int64_t v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    id v6 = (void *)sub_247709230();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a3;
  id v12 = a4;
  v7(v6, v10, a3, a4);

  sub_2476FD9F4((uint64_t)v6, v10);
  return swift_release();
}

void sub_2476F9804(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t AppIconImageProvider.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AppIconImageProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

BOOL static AppIconImageProvider.IconFetchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AppIconImageProvider.IconFetchError.hash(into:)()
{
  return sub_247709A10();
}

uint64_t AppIconImageProvider.IconFetchError.hashValue.getter()
{
  return sub_247709A20();
}

BOOL sub_2476F9974(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2476F998C()
{
  return sub_247709A20();
}

uint64_t sub_2476F99D4()
{
  return sub_247709A10();
}

uint64_t sub_2476F9A00()
{
  return sub_247709A20();
}

void sub_2476F9A54()
{
  qword_26925ED70 = 25187;
  *(void *)algn_26925ED78 = 0xE200000000000000;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_2476F9AA4(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v5 = (void *)sub_2477096D0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_2477091E0();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_2476F9B80(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2476F9B90(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2476F9BCC(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2476F9CA8;
  return v6(a1);
}

uint64_t sub_2476F9CA8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2476F9DA0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2476F9DC8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2476F9E40(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2477098A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2476F9E40(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2476F9F14(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2476F327C((uint64_t)v12, *a3);
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
      sub_2476F327C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2476F9F14(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2477098B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2476FA0D0(a5, a6);
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
  uint64_t v8 = sub_247709900();
  if (!v8)
  {
    sub_247709910();
    __break(1u);
LABEL_17:
    uint64_t result = sub_247709960();
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

uint64_t sub_2476FA0D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2476FA168(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2476FA348(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2476FA348(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2476FA168(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2476FA2E0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2477098E0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_247709910();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_247709720();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_247709960();
    __break(1u);
LABEL_14:
    uint64_t result = sub_247709910();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2476FA2E0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAD8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2476FA348(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAD8);
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
  int64_t v13 = a4 + 32;
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
  uint64_t result = sub_247709960();
  __break(1u);
  return result;
}

unsigned char **sub_2476FA498(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_2476FA4A8(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAE8);
  char v40 = a2;
  uint64_t v6 = sub_247709940();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v39 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v38 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v21 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v22 = v21 | (v13 << 6);
      }
      else
      {
        int64_t v23 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v38) {
          goto LABEL_33;
        }
        unint64_t v24 = v39[v23];
        ++v13;
        if (!v24)
        {
          int64_t v13 = v23 + 1;
          if (v23 + 1 >= v38) {
            goto LABEL_33;
          }
          unint64_t v24 = v39[v13];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v38)
            {
LABEL_33:
              swift_release();
              unint64_t v3 = v2;
              if (v40)
              {
                uint64_t v37 = 1 << *(unsigned char *)(v5 + 32);
                if (v37 >= 64) {
                  bzero(v39, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v39 = -1 << v37;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v39[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v13 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v38) {
                  goto LABEL_33;
                }
                unint64_t v24 = v39[v13];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v25;
          }
        }
LABEL_30:
        unint64_t v10 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v13 << 6);
      }
      uint64_t v30 = 16 * v22;
      unint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      uint64_t v34 = *(void *)(v5 + 56) + v30;
      uint64_t v35 = *(void **)v34;
      char v36 = *(unsigned char *)(v34 + 8);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_2476FB160(v35, v36);
      }
      sub_247709A00();
      sub_247709700();
      uint64_t result = sub_247709A20();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v16 == v27;
          if (v16 == v27) {
            unint64_t v16 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v11 + 8 * v16);
        }
        while (v29 == -1);
        unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 16 * v17;
      uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
      *uint64_t v19 = v33;
      v19[1] = v32;
      uint64_t v20 = *(void *)(v7 + 56) + v18;
      *(void *)uint64_t v20 = v35;
      *(unsigned char *)(v20 + 8) = v36;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

void sub_2476FA7C8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_2476F3204(a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a5 & 1) == 0)
  {
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_2476FA980();
      goto LABEL_9;
    }
    sub_2476FA4A8(v17, a5 & 1);
    unint64_t v20 = sub_2476F3204(a3, a4);
    if ((v18 & 1) == (v21 & 1))
    {
      unint64_t v14 = v20;
      goto LABEL_9;
    }
LABEL_15:
    sub_2477099B0();
    __break(1u);
    return;
  }
LABEL_9:
  int v22 = a2 & 1;
  int64_t v23 = *v6;
  if (v18)
  {
    BOOL v24 = v22 != 0;
    uint64_t v25 = v23[7] + 16 * v14;
    sub_2476FB140(*(id *)v25, *(unsigned char *)(v25 + 8));
    *(void *)uint64_t v25 = a1;
    *(unsigned char *)(v25 + 8) = v24;
  }
  else
  {
    sub_2476FA928(v14, a3, a4, a1, v22, v23);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_2476FA928(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = a6[7] + 16 * result;
  *(void *)uint64_t v7 = a4;
  *(unsigned char *)(v7 + 8) = a5 & 1;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

void *sub_2476FA980()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_247709930();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v26 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v14) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v7 + 8 * v26);
    ++v10;
    if (!v27)
    {
      int64_t v10 = v26 + 1;
      if (v26 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v7 + 8 * v10);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v27 - 1) & v27;
    unint64_t v16 = __clz(__rbit64(v27)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = *(void *)(v2 + 56);
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + v17);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    int v22 = *(void **)(v18 + v17);
    char v23 = *(unsigned char *)(v18 + v17 + 8);
    BOOL v24 = (void *)(*(void *)(v4 + 48) + v17);
    *BOOL v24 = v21;
    v24[1] = v20;
    uint64_t v25 = *(void *)(v4 + 56) + v17;
    *(void *)uint64_t v25 = v22;
    *(unsigned char *)(v25 + 8) = v23;
    swift_bridgeObjectRetain();
    uint64_t result = sub_2476FB160(v22, v23);
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v14) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v7 + 8 * v28);
  if (v27)
  {
    int64_t v10 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v7 + 8 * v10);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2476FAB50(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2476FAC30;
  return v5(v2 + 16);
}

uint64_t sub_2476FAC30()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_2476FAD60(uint64_t a1, uint64_t a2, char a3, double a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB70);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_24770A0E0;
  uint64_t v9 = MEMORY[0x263F8D310];
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  unint64_t v10 = sub_2476FE024();
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  *(void *)(v8 + 96) = v9;
  *(void *)(v8 + 104) = v10;
  uint64_t v11 = 0x656E6F685069;
  if (a3) {
    uint64_t v11 = 0x6863746177;
  }
  unint64_t v12 = 0xE600000000000000;
  if (a3) {
    unint64_t v12 = 0xE500000000000000;
  }
  *(void *)(v8 + 64) = v10;
  *(void *)(v8 + 72) = v11;
  uint64_t v13 = MEMORY[0x263F8D538];
  *(void *)(v8 + 80) = v12;
  uint64_t v14 = MEMORY[0x263F8D5B8];
  *(void *)(v8 + 136) = v13;
  *(void *)(v8 + 144) = v14;
  *(double *)(v8 + 112) = a4;
  swift_bridgeObjectRetain();
  return MEMORY[0x270EF1A50](0x2E255F40255F4025, 0xEA00000000006632, v8);
}

uint64_t sub_2476FAE64()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2476FAEA4()
{
  sub_2476F59B0(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_2476FAEB0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2476FAEC0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_2476FAF00()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2476FAF48(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  double v10 = *(double *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_2476FB030;
  return sub_2476F6B2C(a1, v10, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2476FB030()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_2476FB128(void *a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_2476FB140(a1, a2 & 1);
  }
}

void sub_2476FB140(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_2476FB14C(uint64_t a1)
{
  return sub_2476F667C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(unsigned __int8 *)(v1 + 48));
}

id sub_2476FB160(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

uint64_t sub_2476FB16C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_2476FB1BC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  char v9 = *(unsigned char *)(v1 + 56);
  double v10 = *(double *)(v1 + 64);
  uint64_t v11 = *(void *)(v1 + 72);
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_2476FB030;
  return sub_2476F5C00(v10, a1, v4, v5, v6, v7, v8, v9, v11);
}

unint64_t sub_2476FB2B8()
{
  unint64_t result = qword_26925EA90;
  if (!qword_26925EA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925EA90);
  }
  return result;
}

uint64_t type metadata accessor for AppIconImageProvider()
{
  return self;
}

uint64_t method lookup function for AppIconImageProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppIconImageProvider);
}

uint64_t dispatch thunk of AppIconImageProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AppIconImageProvider.fetchAppIcon(bundleID:isWatch:preferredWidth:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, __n128))(*(void *)(*(void *)v4 + 120)
                                                                  + **(int **)(*(void *)v4 + 120));
  double v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *double v10 = v5;
  v10[1] = sub_2476FB488;
  v11.n128_f64[0] = a4;
  return v13(a1, a2, a3, v11);
}

uint64_t sub_2476FB488(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of AppIconImageProvider.fetchAppIcon(bundleID:isWatch:preferredWidth:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppIconImageProvider.IconFetchError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppIconImageProvider.IconFetchError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2476FB710);
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

uint64_t sub_2476FB738(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2476FB744(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppIconImageProvider.IconFetchError()
{
  return &type metadata for AppIconImageProvider.IconFetchError;
}

uint64_t initializeBufferWithCopyOfBuffer for AppIconImageProvider.AppIconCacheStatus(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2476FB160(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void destroy for AppIconImageProvider.AppIconCacheStatus(uint64_t a1)
{
}

uint64_t assignWithCopy for AppIconImageProvider.AppIconCacheStatus(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2476FB160(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_2476FB140(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for AppIconImageProvider.AppIconCacheStatus(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_2476FB140(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppIconImageProvider.AppIconCacheStatus(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppIconImageProvider.AppIconCacheStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2476FB8EC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2476FB8F4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppIconImageProvider.AppIconCacheStatus()
{
  return &type metadata for AppIconImageProvider.AppIconCacheStatus;
}

uint64_t sub_2476FB910()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2476FB948(uint64_t a1)
{
  int v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2476FE07C;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26925EAA0 + dword_26925EAA0);
  return v6(a1, v4);
}

uint64_t sub_2476FBA00(uint64_t a1)
{
  int v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2476FE07C;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26925EAB0 + dword_26925EAB0);
  return v6(a1, v4);
}

uint64_t sub_2476FBAB8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2476FBAF4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2476FBB34()
{
  return sub_2476FBC38(1);
}

unint64_t sub_2476FBB3C()
{
  unint64_t result = qword_26925EAC0;
  if (!qword_26925EAC0)
  {
    sub_247709640();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925EAC0);
  }
  return result;
}

unint64_t sub_2476FBB94()
{
  unint64_t result = qword_26925EAD0;
  if (!qword_26925EAD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925EAC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925EAD0);
  }
  return result;
}

uint64_t sub_2476FBBF0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2476FBC30()
{
  return sub_2476FBC38(0);
}

uint64_t sub_2476FBC38(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(v1 + 16))(*(void *)(v1 + 32), a1);
}

uint64_t sub_2476FBC70()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2476FBCA8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAE0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 49) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  sub_2476FB140(*(id *)(v0 + 40), *(unsigned char *)(v0 + 48));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2476FBD8C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EAE0);
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 40);
  char v5 = *(unsigned char *)(v0 + 48);
  return sub_2476F6A14(v1, v2, v3, v4, v5);
}

uint64_t sub_2476FBDFC(uint64_t a1, uint64_t a2, char a3, double a4)
{
  *(double *)(v4 + 56) = a4;
  *(unsigned char *)(v4 + 136) = a3;
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a2;
  return MEMORY[0x270FA2498](sub_2476FBE24, 0, 0);
}

uint64_t sub_2476FBE24()
{
  uint64_t v13 = v0;
  if (qword_26925EA30 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247709620();
  __swift_project_value_buffer(v1, (uint64_t)qword_26925ED80);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_247709600();
  os_log_type_t v3 = sub_247709810();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[6];
  if (v4)
  {
    uint64_t v11 = v0[5];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[3] = sub_2476F9E40(0xD000000000000034, 0x800000024770B6A0, &v12);
    sub_2477098A0();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[4] = sub_2476F9E40(v11, v5, &v12);
    sub_2477098A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2476F0000, v2, v3, "%s bundleID: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C55ACF0](v7, -1, -1);
    MEMORY[0x24C55ACF0](v6, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v0[8] = self;
  v0[9] = sub_247709790();
  v0[10] = sub_247709780();
  uint64_t v9 = sub_247709750();
  return MEMORY[0x270FA2498](sub_2476FC0A8, v9, v8);
}

uint64_t sub_2476FC0A8()
{
  uint64_t v1 = *(void **)(v0 + 64);
  swift_release();
  *(void *)(v0 + 88) = objc_msgSend(v1, sel_mainScreen);
  return MEMORY[0x270FA2498](sub_2476FC130, 0, 0);
}

uint64_t sub_2476FC130()
{
  *(void *)(v0 + 96) = sub_247709780();
  uint64_t v2 = sub_247709750();
  return MEMORY[0x270FA2498](sub_2476FC1BC, v2, v1);
}

uint64_t sub_2476FC1BC()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();
  objc_msgSend(v1, sel_scale);
  *(void *)(v0 + 104) = v2;

  return MEMORY[0x270FA2498](sub_2476FC23C, 0, 0);
}

uint64_t sub_2476FC23C()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 56);
  char v3 = *(unsigned char *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 112) = v6;
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *(void *)(v6 + 32) = v2;
  *(void *)(v6 + 40) = v1;
  *(unsigned char *)(v6 + 48) = v3;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v7;
  uint64_t v8 = sub_2476FBAB8(0, (unint64_t *)&qword_26B130628);
  *uint64_t v7 = v0;
  v7[1] = sub_2476FC370;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000034, 0x800000024770B6A0, sub_2476FD73C, v6, v8);
}

uint64_t sub_2476FC370()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2476FC4A8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2476FC48C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2476FC48C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_2476FC4A8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2476FC50C(uint64_t a1, uint64_t a2, double a3)
{
  *(double *)(v3 + 56) = a3;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  return MEMORY[0x270FA2498](sub_2476FC530, 0, 0);
}

uint64_t sub_2476FC530()
{
  unint64_t v16 = v0;
  if (qword_26925EA30 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247709620();
  __swift_project_value_buffer(v1, (uint64_t)qword_26925ED80);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_247709600();
  os_log_type_t v3 = sub_247709810();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[6];
  if (v4)
  {
    uint64_t v14 = v0[5];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v15 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[3] = sub_2476F9E40(0xD00000000000002BLL, 0x800000024770B670, &v15);
    sub_2477098A0();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[4] = sub_2476F9E40(v14, v5, &v15);
    sub_2477098A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2476F0000, v2, v3, "%s bundleID: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C55ACF0](v7, -1, -1);
    MEMORY[0x24C55ACF0](v6, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v9 = v0[5];
  uint64_t v8 = v0[6];
  uint64_t v10 = swift_task_alloc();
  v0[8] = v10;
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v8;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[9] = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB00);
  *uint64_t v11 = v0;
  v11[1] = sub_2476FC80C;
  return MEMORY[0x270FA2318](v0 + 2, 0, 0, 0xD00000000000002ALL, 0x800000024770B640, sub_2476FD734, v10, v12);
}

uint64_t sub_2476FC80C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2476FC924, 0, 0);
}

uint64_t sub_2476FC924()
{
  if (v0[2])
  {
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    uint64_t v3 = swift_task_alloc();
    v0[10] = v3;
    *(void *)uint64_t v3 = v0;
    *(void *)(v3 + 8) = sub_2476FCA1C;
    uint64_t v5 = v0[5];
    uint64_t v4 = v0[6];
    *(void *)(v3 + 56) = v0[7];
    *(unsigned char *)(v3 + 136) = 1;
    *(void *)(v3 + 40) = v5;
    *(void *)(v3 + 48) = v4;
    return MEMORY[0x270FA2498](sub_2476FBE24, 0, 0);
  }
}

uint64_t sub_2476FCA1C(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_2476FCB1C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_2476FCB3C, 0, 0);
}

uint64_t sub_2476FCB3C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  id v3 = objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  id v4 = sub_2476F9AA4(v1, v2, 0);
  v0[5] = v4;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_2477096D0();
  id v7 = objc_msgSend(v5, sel__sourceWithBundleIdentifier_name_productType_options_, v6, 0, 0, 0);
  v0[6] = v7;

  if (v7)
  {
    if ((v4 != 0) | objc_msgSend(v7, sel__hasFirstPartyBundleID) & 1)
    {
LABEL_3:
      v0[7] = self;
      v0[8] = sub_247709790();
      v0[9] = sub_247709780();
      uint64_t v9 = sub_247709750();
      return MEMORY[0x270FA2498](sub_2476FCD38, v9, v8);
    }
  }
  else if (v4)
  {
    goto LABEL_3;
  }
  sub_2476FD8F8();
  swift_allocError();
  *uint64_t v10 = 0;
  swift_willThrow();

  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_2476FCD38()
{
  uint64_t v1 = *(void **)(v0 + 56);
  swift_release();
  *(void *)(v0 + 80) = objc_msgSend(v1, sel_mainScreen);
  return MEMORY[0x270FA2498](sub_2476FCDC0, 0, 0);
}

uint64_t sub_2476FCDC0()
{
  *(void *)(v0 + 88) = sub_247709780();
  uint64_t v2 = sub_247709750();
  return MEMORY[0x270FA2498](sub_2476FCE4C, v2, v1);
}

uint64_t sub_2476FCE4C()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();
  objc_msgSend(v1, sel_scale);
  *(void *)(v0 + 96) = v2;

  return MEMORY[0x270FA2498](sub_2476FCECC, 0, 0);
}

uint64_t sub_2476FCECC()
{
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[13] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[14] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB00);
  *uint64_t v5 = v0;
  v5[1] = sub_2476FCFE0;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000035, 0x800000024770B7F0, sub_2476FDEDC, v4, v6);
}

uint64_t sub_2476FCFE0()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2476FD168;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2476FD0FC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2476FD0FC()
{
  uint64_t v1 = *(void **)(v0 + 40);

  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_2476FD168()
{
  uint64_t v1 = *(void **)(v0 + 40);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2476FD1DC(uint64_t a1, uint64_t a2, double a3)
{
  *(double *)(v3 + 48) = a3;
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 40) = a2;
  return MEMORY[0x270FA2498](sub_2476FD200, 0, 0);
}

uint64_t sub_2476FD200()
{
  uint64_t v13 = v0;
  if (qword_26925EA30 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247709620();
  __swift_project_value_buffer(v1, (uint64_t)qword_26925ED80);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_247709600();
  os_log_type_t v3 = sub_247709810();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[5];
  if (v4)
  {
    uint64_t v11 = v0[4];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[2] = sub_2476F9E40(0xD00000000000002BLL, 0x800000024770B7C0, &v12);
    sub_2477098A0();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_2476F9E40(v11, v5, &v12);
    sub_2477098A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2476F0000, v2, v3, "%s bundleID: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C55ACF0](v7, -1, -1);
    MEMORY[0x24C55ACF0](v6, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v8 = (void *)swift_task_alloc();
  v0[7] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2476FD488;
  uint64_t v9 = v0[5];
  v8[3] = v0[4];
  v8[4] = v9;
  return MEMORY[0x270FA2498](sub_2476FCB3C, 0, 0);
}

uint64_t sub_2476FD488(uint64_t a1)
{
  BOOL v4 = (void *)*v2;
  unint64_t v5 = (void *)*v2;
  swift_task_dealloc();
  if (v1)
  {

LABEL_3:
    uint64_t v6 = swift_task_alloc();
    v4[8] = v6;
    *(void *)uint64_t v6 = v5;
    *(void *)(v6 + 8) = sub_2476FD634;
    uint64_t v8 = v4[4];
    uint64_t v7 = v4[5];
    *(void *)(v6 + 56) = v4[6];
    *(unsigned char *)(v6 + 136) = 0;
    *(void *)(v6 + 40) = v8;
    *(void *)(v6 + 48) = v7;
    return MEMORY[0x270FA2498](sub_2476FBE24, 0, 0);
  }
  if (!a1) {
    goto LABEL_3;
  }
  uint64_t v9 = (uint64_t (*)(uint64_t))v5[1];
  return v9(a1);
}

uint64_t sub_2476FD634(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

void sub_2476FD734(uint64_t a1)
{
  sub_2476F715C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_2476FD73C(uint64_t a1)
{
  sub_2476F8008(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 48), *(double *)(v1 + 32), *(double *)(v1 + 40));
}

uint64_t sub_2476FD74C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 9;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_2476FD830(void *a1, void *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B130608) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void **)(v2 + 16);
  unint64_t v9 = *(void *)(v2 + 24);
  double v10 = *(double *)(v2 + v7);
  uint64_t v11 = v2 + v6;
  uint64_t v12 = v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  double v13 = *(double *)v12;
  int v14 = *(unsigned __int8 *)(v12 + 8);
  sub_2476F8414(a1, a2, v8, v9, v11, v14, v10, v13);
}

unint64_t sub_2476FD8F8()
{
  unint64_t result = qword_26925EB20;
  if (!qword_26925EB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925EB20);
  }
  return result;
}

uint64_t sub_2476FD94C()
{
  return objectdestroy_81Tm(&qword_26B130608);
}

void sub_2476FD958(uint64_t a1, unint64_t a2, int a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
  sub_2476F95C8(a1, a2, a3, a4);
}

uint64_t sub_2476FD9F4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2476FDA08(a1, a2);
  }
  return a1;
}

uint64_t sub_2476FDA08(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_2476FDA60(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_2476FDAB8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2476FDB14()
{
  return swift_release();
}

_OWORD *sub_2476FDB1C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2476FDB2C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB58);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2476FDBFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925EB58) - 8);
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  uint64_t v10 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_2476F7378(a1, a2, a3, v8, v9, v10);
}

uint64_t sub_2476FDC8C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB58);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_2476FDD64()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925EB58) - 8);
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  sub_2476F77AC(v2, v3, v4, v5, v6);
}

uint64_t sub_2476FDDD0()
{
  return objectdestroy_81Tm(&qword_26925EB58);
}

uint64_t objectdestroy_81Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_2476FDE68(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB58);
  return sub_2476F79E0(a1);
}

uint64_t sub_2476FDEDC(uint64_t a1)
{
  return sub_2476F7B2C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(double *)(v1 + 32));
}

uint64_t sub_2476FDEE8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB68);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2476FDFB8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EB68);
  double v1 = *(double *)(v0 + 32);
  return sub_2476F7F5C(v1);
}

unint64_t sub_2476FE024()
{
  unint64_t result = qword_26925EB78;
  if (!qword_26925EB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925EB78);
  }
  return result;
}

void sub_2476FE0CC()
{
  qword_26B130590 = 0x7373656E746946;
  *(void *)algn_26B130598 = 0xE700000000000000;
}

uint64_t static FitnessAccessibilityIdentifier.base.getter()
{
  return sub_2476F245C(&qword_26B1305A0, &qword_26B130590);
}

uint64_t sub_2476FE118(uint64_t a1)
{
  return sub_2476FE8A8(a1, 0xD000000000000013, &qword_26B130578, 0x800000024770B930, &qword_26B130580);
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.base.getter()
{
  return sub_2476F245C(&qword_26B130588, &qword_26B130578);
}

uint64_t sub_2476FE168()
{
  sub_2477098D0();
  if (qword_26B130588 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B130578;
  uint64_t v0 = qword_26B130580;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_247709710();
  qword_26B130548 = v1;
  unk_26B130550 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.accountSettingsButton.getter()
{
  return sub_2476F245C(&qword_26B130558, &qword_26B130548);
}

uint64_t sub_2476FE254(uint64_t a1)
{
  return sub_2476FE5E0(a1, 0x73676E69722ELL, 0xE600000000000000, &qword_26925EB80, &qword_26925EB88);
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.rings.getter()
{
  return sub_2476F245C(&qword_26925E9B8, &qword_26925EB80);
}

uint64_t sub_2476FE29C(uint64_t a1)
{
  return sub_2476FE5E0(a1, 0x65636E616C61622ELL, 0xE800000000000000, &qword_26925EB90, &qword_26925EB98);
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.balance.getter()
{
  return sub_2476F245C(&qword_26925E9C0, &qword_26925EB90);
}

uint64_t sub_2476FE2E8()
{
  sub_2477098D0();
  if (qword_26B130588 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B130578;
  uint64_t v0 = qword_26B130580;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_247709710();
  qword_26925EBA0 = v1;
  *(void *)algn_26925EBA8 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.fitnessPlusUpNext.getter()
{
  return sub_2476F245C(&qword_26925E9C8, &qword_26925EBA0);
}

uint64_t sub_2476FE3D4()
{
  sub_2477098D0();
  if (qword_26B130588 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B130578;
  uint64_t v0 = qword_26B130580;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_247709710();
  qword_26B130520 = v1;
  *(void *)algn_26B130528 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.editSummaryButton.getter()
{
  return sub_2476F245C(&qword_26B130248, &qword_26B130520);
}

uint64_t sub_2476FE4C0()
{
  sub_2477098D0();
  if (qword_26B130588 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B130578;
  uint64_t v0 = qword_26B130580;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_247709710();
  qword_26925EBB0 = v1;
  *(void *)algn_26925EBB8 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.plusSignButton.getter()
{
  return sub_2476F245C(&qword_26925E9D0, &qword_26925EBB0);
}

uint64_t sub_2476FE5B4(uint64_t a1)
{
  return sub_2476FE5E0(a1, 0x747542656E6F642ELL, 0xEB000000006E6F74, &qword_26925EBC0, &qword_26925EBC8);
}

uint64_t sub_2476FE5E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  if (qword_26B130588 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_26B130578;
  uint64_t v9 = qword_26B130580;
  swift_bridgeObjectRetain();
  uint64_t result = sub_247709710();
  *a4 = v8;
  *a5 = v9;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.doneButton.getter()
{
  return sub_2476F245C(&qword_26925E9D8, &qword_26925EBC0);
}

uint64_t sub_2476FE6AC()
{
  sub_2477098D0();
  if (qword_26B130588 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B130578;
  uint64_t v0 = qword_26B130580;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_247709710();
  qword_26B130560 = v1;
  *(void *)algn_26B130568 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.seeAllCategoriesButton.getter()
{
  return sub_2476F245C(&qword_26B130570, &qword_26B130560);
}

void sub_2476FE798()
{
  algn_26925EBD8[5] = 0;
  *(_WORD *)&algn_26925EBD8[6] = -5120;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.deleteButton.getter()
{
  return sub_2476F245C(&qword_26925E9E0, &qword_26925EBD0);
}

void sub_2476FE7EC()
{
  qword_26B130530 = 0x7474754274696445;
  *(void *)algn_26B130538 = 0xEA00000000006E6FLL;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.editButton.getter()
{
  return sub_2476F245C(&qword_26B130540, &qword_26B130530);
}

void sub_2476FE83C()
{
  qword_26925EBE0 = 1954047316;
  *(void *)algn_26925EBE8 = 0xE400000000000000;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.text.getter()
{
  return sub_2476F245C(&qword_26925E9E8, &qword_26925EBE0);
}

uint64_t sub_2476FE880(uint64_t a1)
{
  return sub_2476FE8A8(a1, 0xD000000000000025, &qword_26925EBF0, 0x800000024770B880, algn_26925EBF8);
}

uint64_t sub_2476FE8A8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (qword_26B1305A0 != -1) {
    uint64_t result = swift_once();
  }
  *a3 = a2;
  *a5 = a4;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView.base.getter()
{
  return sub_2476F245C(&qword_26925E9F0, &qword_26925EBF0);
}

uint64_t sub_2476FE93C()
{
  sub_2477098D0();
  if (qword_26925E9F0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26925EBF0;
  uint64_t v0 = *(void *)algn_26925EBF8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_247709710();
  qword_26925EC00 = v1;
  *(void *)algn_26925EC08 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView.addOrSwapButton.getter()
{
  return sub_2476F245C(&qword_26925E9F8, &qword_26925EC00);
}

uint64_t static FitnessAccessibilityIdentifier.build(_:)()
{
  return sub_2477096B0();
}

ValueMetadata *type metadata accessor for FitnessAccessibilityIdentifier()
{
  return &type metadata for FitnessAccessibilityIdentifier;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityIdentifier.SummaryView()
{
  return &type metadata for FitnessAccessibilityIdentifier.SummaryView;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView()
{
  return &type metadata for FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView;
}

uint64_t FitnessPlusSessionProvider.__allocating_init(healthStore:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  FitnessPlusSessionProvider.init(healthStore:)(a1);
  return v2;
}

id FitnessPlusSessionProvider.init(healthStore:)(void *a1)
{
  uint64_t v2 = v1;
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0AA30]), sel_initWithHealthStore_, a1);
  if (result)
  {
    uint64_t v5 = result;
    sub_2476FBAB8(0, &qword_26B130250);
    uint64_t v6 = (void *)sub_247709850();
    uint64_t v7 = _s11SeymourCore12DependenciesC10ActivityUIE08activityE05queue18wheelchairUseCacheACSo012OS_dispatch_G0C_So013_HKWheelchairi14CharacteristicJ0CtFZ_0((uint64_t)v6, v5);

    *(void *)(v2 + 16) = v7;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305E0);
    sub_247709270();
    swift_release();
    sub_247704F04(v8, v2 + 24);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305F0);
    sub_247709270();
    swift_release();
    sub_247704F04(v8, v2 + 64);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1305D8);
    sub_247709270();
    swift_release();

    sub_247704F04(v8, v2 + 104);
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2476FEC54(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v66 = a2;
  uint64_t v67 = a3;
  v65 = a1;
  uint64_t v73 = *v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC10);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  double v13 = (char *)&v60 - v12;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC18);
  uint64_t v14 = *(void *)(v64 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](v64);
  v62 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v61 = (char *)&v60 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC20);
  uint64_t v70 = *(void *)(v18 - 8);
  uint64_t v71 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v68 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  id v63 = (char *)&v60 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v72 = (char *)&v60 - v23;
  sub_247701938(a1, (uint64_t)v13);
  sub_2476F3918((uint64_t)(v4 + 3), (uint64_t)v74);
  uint64_t v24 = swift_allocObject();
  sub_247704F04(v74, v24 + 16);
  *(double *)(v24 + 56) = a4;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  unint64_t v25 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v26 = (v9 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v27 + v25, v11, v7);
  int64_t v28 = (uint64_t (**)(uint64_t))(v27 + v26);
  *int64_t v28 = sub_247704F54;
  v28[1] = (uint64_t (*)(uint64_t))v24;
  sub_2476FBAB8(0, (unint64_t *)&qword_26B130628);
  uint64_t v29 = v61;
  sub_2477093F0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = v66;
  uint64_t v32 = v67;
  *(void *)(v30 + 16) = v66;
  *(void *)(v30 + 24) = v32;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = sub_247704FA8;
  *(void *)(v33 + 24) = v30;
  uint64_t v34 = v62;
  uint64_t v35 = v29;
  uint64_t v36 = v64;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v62, v29, v64);
  unint64_t v37 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v38 = (v15 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v39 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v39 + v37, v34, v36);
  char v40 = (uint64_t (**)(void **))(v39 + v38);
  *char v40 = sub_247704FE0;
  v40[1] = (uint64_t (*)(void **))v33;
  swift_retain();
  v62 = (char *)(MEMORY[0x263F8EE60] + 8);
  uint64_t v41 = v63;
  sub_2477093F0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v35, v36);
  uint64_t v42 = (void *)swift_allocObject();
  uint64_t v43 = v65;
  v42[2] = v65;
  v42[3] = v31;
  uint64_t v44 = v73;
  v42[4] = v32;
  v42[5] = v44;
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = sub_247705144;
  *(void *)(v45 + 24) = v42;
  uint64_t v46 = v70;
  uint64_t v47 = v71;
  id v48 = v68;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v68, v41, v71);
  uint64_t v49 = v46;
  unint64_t v50 = (*(unsigned __int8 *)(v46 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  unint64_t v51 = (v69 + v50 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v52 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v52 + v50, v48, v47);
  uint64_t v53 = (uint64_t (**)(void *))(v52 + v51);
  *uint64_t v53 = sub_247705164;
  v53[1] = (uint64_t (*)(void *))v45;
  swift_retain();
  id v54 = v43;
  char v55 = v72;
  sub_2477093F0();
  uint64_t v56 = *(void (**)(char *, uint64_t))(v49 + 8);
  v56(v41, v47);
  unint64_t v57 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_247709410();
  uint64_t v58 = swift_allocObject();
  *(void *)(v58 + 16) = 0;
  *(void *)(v58 + 24) = 0;
  v57(sub_247705234, v58);
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v56)(v55, v47);
}

uint64_t sub_2476FF2E8(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_2477093C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247709330();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2477093D0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  double v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2477092B0();
  sub_247709320();
  sub_24770618C((uint64_t)v9);
  sub_2477093B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_247709550();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_2476FF4FC(void *a1, void *a2, uint64_t (*a3)(void, void))
{
  if (qword_26925EA30 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_247709620();
  __swift_project_value_buffer(v6, (uint64_t)qword_26925ED80);
  id v7 = a2;
  id v8 = a1;
  id v9 = v7;
  id v10 = a1;
  uint64_t v11 = sub_247709600();
  os_log_type_t v12 = sub_247709800();
  if (os_log_type_enabled(v11, v12))
  {
    unint64_t v25 = a3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = v24;
    *(_DWORD *)uint64_t v13 = 136315650;
    uint64_t v14 = sub_247709A30();
    sub_2476F9E40(v14, v15, &v26);
    sub_2477098A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    id v16 = objc_msgSend(v9, sel_description);
    uint64_t v17 = sub_2477096E0();
    unint64_t v19 = v18;

    sub_2476F9E40(v17, v19, &v26);
    sub_2477098A0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 22) = 2080;
    swift_getErrorValue();
    uint64_t v20 = Error.logOutput.getter();
    sub_2476F9E40(v20, v21, &v26);
    sub_2477098A0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2476F0000, v11, v12, "%s: Failed to fetch image for %s: %s.", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C55ACF0](v24, -1, -1);
    uint64_t v22 = v13;
    a3 = v25;
    MEMORY[0x24C55ACF0](v22, -1, -1);
  }
  else
  {
  }
  return a3(a1, 1);
}

uint64_t sub_2476FF7E8(void *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v66 = a3;
  uint64_t v67 = a2;
  uint64_t v76 = a1;
  uint64_t v73 = *v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC10);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  os_log_type_t v12 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v62 - v13;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(qword_26925EC28);
  uint64_t v63 = *(void *)(v65 - 8);
  uint64_t v64 = *(void *)(v63 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v65);
  uint64_t v17 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v74 = (char *)&v62 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC20);
  uint64_t v70 = *(void *)(v19 - 8);
  uint64_t v71 = v19;
  uint64_t v69 = *(void *)(v70 + 64);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  v68 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  id v75 = (char *)&v62 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v72 = (char *)&v62 - v24;
  uint64_t v25 = swift_allocObject();
  swift_weakInit();
  sub_2476F3918((uint64_t)(v5 + 13), (uint64_t)v78);
  sub_2476F3918((uint64_t)(v5 + 3), (uint64_t)v77);
  uint64_t v26 = swift_allocObject();
  sub_247704F04(v78, v26 + 16);
  sub_247704F04(v77, v26 + 56);
  *(double *)(v26 + 96) = a4;
  *(void *)(v26 + 104) = v25;
  *(double *)(v26 + 112) = a5;
  sub_247701938(v76, (uint64_t)v14);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = sub_2477052B8;
  *(void *)(v27 + 24) = v26;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v28 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v29 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v29 + v28, v12, v8);
  uint64_t v30 = (uint64_t (**)())(v29 + ((v10 + v28 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v30 = sub_2477052D0;
  v30[1] = (uint64_t (*)())v27;
  swift_retain();
  uint64_t v31 = v74;
  sub_2477093F0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = v67;
  uint64_t v34 = v66;
  *(void *)(v32 + 16) = v67;
  *(void *)(v32 + 24) = v34;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = sub_247705340;
  *(void *)(v35 + 24) = v32;
  uint64_t v36 = v63;
  uint64_t v37 = v65;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v17, v31, v65);
  uint64_t v38 = v36;
  unint64_t v39 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  unint64_t v40 = (v64 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v41 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v41 + v39, v17, v37);
  uint64_t v42 = (uint64_t (**)(uint64_t))(v41 + v40);
  *uint64_t v42 = sub_24770535C;
  v42[1] = (uint64_t (*)(uint64_t))v35;
  uint64_t v43 = v34;
  swift_retain();
  uint64_t v64 = MEMORY[0x263F8EE60] + 8;
  uint64_t v44 = v75;
  sub_2477093F0();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v74, v37);
  uint64_t v45 = (void *)swift_allocObject();
  uint64_t v46 = v76;
  v45[2] = v76;
  v45[3] = v33;
  uint64_t v47 = v73;
  v45[4] = v43;
  v45[5] = v47;
  uint64_t v48 = swift_allocObject();
  *(void *)(v48 + 16) = sub_2477053F0;
  *(void *)(v48 + 24) = v45;
  uint64_t v49 = v70;
  uint64_t v50 = v71;
  unint64_t v51 = v68;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v68, v44, v71);
  unint64_t v52 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  unint64_t v53 = (v69 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v54 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v54 + v52, v51, v50);
  char v55 = (uint64_t (**)(void *))(v54 + v53);
  *char v55 = sub_247706E5C;
  v55[1] = (uint64_t (*)(void *))v48;
  swift_retain();
  id v56 = v46;
  unint64_t v57 = v72;
  sub_2477093F0();
  uint64_t v58 = *(void (**)(char *, uint64_t))(v49 + 8);
  v58(v75, v50);
  v59 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_247709410();
  uint64_t v60 = swift_allocObject();
  *(void *)(v60 + 16) = 0;
  *(void *)(v60 + 24) = 0;
  v59(sub_247705234, v60);
  swift_release();
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v58)(v57, v50);
}

uint64_t sub_2476FFF28@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D1>)
{
  uint64_t v107 = a5;
  v108 = a3;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC68);
  uint64_t v86 = *(void *)(v87 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v87);
  uint64_t v84 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v85 = (uint64_t)&v82 - v12;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC18);
  uint64_t v94 = *(void *)(v95 - 8);
  v93 = *(void (**)(char *, char *, uint64_t))(v94 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v95);
  uint64_t v92 = (char *)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v91 = (char *)&v82 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC20);
  uint64_t v105 = *(void *)(v16 - 8);
  uint64_t v106 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v103 = (char *)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v104 = (char *)&v82 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v98 = (char *)&v82 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v109 = (char *)&v82 - v24;
  uint64_t v102 = v25;
  MEMORY[0x270FA5388](v23);
  v110 = (char *)&v82 - v26;
  uint64_t v99 = sub_2477093C0();
  uint64_t v89 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  unint64_t v28 = (char *)&v82 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_247709330();
  MEMORY[0x270FA5388](v29 - 8);
  uint64_t v31 = (char *)&v82 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_2477093D0();
  uint64_t v100 = *(void *)(v32 - 8);
  uint64_t v101 = v32;
  MEMORY[0x270FA5388](v32);
  uint64_t v34 = (char *)&v82 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = a4 + 16;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_2477092C0();
  uint64_t v97 = sub_247709500();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_2477092A0();
  uint64_t v96 = sub_247709500();
  swift_bridgeObjectRelease();
  uint64_t v35 = (void *)swift_allocObject();
  v35[2] = 0;
  uint64_t v36 = (void *)swift_allocObject();
  v36[3] = 0;
  v36[4] = 0;
  v36[2] = 0;
  uint64_t v82 = a1;
  sub_2477092B0();
  sub_247709320();
  sub_24770618C((uint64_t)v31);
  sub_2477093B0();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v28, v99);
  __swift_project_boxed_opaque_existential_1(v108, v108[3]);
  uint64_t v37 = v91;
  uint64_t v99 = (uint64_t)v34;
  sub_247709550();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = sub_2477066D4;
  *(void *)(v38 + 24) = v35;
  uint64_t v39 = v94;
  unint64_t v40 = v92;
  uint64_t v41 = v95;
  (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v92, v37, v95);
  uint64_t v42 = v39;
  unint64_t v43 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  unint64_t v44 = ((unint64_t)v93 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v45 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v42 + 32))(v45 + v43, v40, v41);
  uint64_t v46 = (uint64_t (**)(void **))(v45 + v44);
  *uint64_t v46 = sub_247706E60;
  v46[1] = (uint64_t (*)(void **))v38;
  v108 = v35;
  swift_retain();
  uint64_t v47 = MEMORY[0x263F8EE60] + 8;
  sub_2477093F0();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v37, v41);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t v48 = v85;
    sub_247702140(v85, a6);
    uint64_t v49 = swift_allocObject();
    *(void *)(v49 + 16) = sub_24770686C;
    *(void *)(v49 + 24) = v36;
    uint64_t v50 = v86;
    unint64_t v51 = *(void (**)(char *, uint64_t, uint64_t))(v86 + 16);
    uint64_t v95 = v47;
    unint64_t v52 = v84;
    uint64_t v53 = v87;
    v51(v84, v48, v87);
    unint64_t v54 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
    unint64_t v55 = (v83 + v54 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v56 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v50 + 32))(v56 + v54, v52, v53);
    unint64_t v57 = (uint64_t (**)(uint64_t *))(v56 + v55);
    *unint64_t v57 = sub_247706888;
    v57[1] = (uint64_t (*)(uint64_t *))v49;
    swift_retain();
    uint64_t v58 = v98;
    sub_2477093F0();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v48, v53);
  }
  else
  {
    uint64_t v58 = v98;
    sub_247709420();
  }
  v59 = v36;
  unint64_t v88 = v36;
  uint64_t v60 = v105;
  uint64_t v61 = *(char **)(v105 + 32);
  uint64_t v95 = v105 + 32;
  uint64_t v98 = v61;
  uint64_t v62 = v109;
  uint64_t v63 = v106;
  ((void (*)(char *, char *, uint64_t))v61)(v109, v58, v106);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925ECA8);
  uint64_t v64 = *(void *)(v60 + 72);
  uint64_t v65 = *(unsigned __int8 *)(v60 + 80);
  uint64_t v94 = v65 | 7;
  uint64_t v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = xmmword_24770A0A0;
  uint64_t v67 = v66 + ((v65 + 32) & ~v65);
  v68 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
  v93 = v68;
  v68((char *)v67, v110, v63);
  v68((char *)(v67 + v64), v62, v63);
  uint64_t v111 = v66;
  sub_2476FBAB8(0, &qword_26B130250);
  uint64_t v69 = (void *)sub_247709850();
  sub_2477095E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925ECB0);
  sub_247706734();
  uint64_t v70 = v104;
  sub_2477093E0();

  swift_bridgeObjectRelease();
  uint64_t v71 = (void *)swift_allocObject();
  uint64_t v72 = v96;
  v71[2] = v97;
  v71[3] = v72;
  v71[4] = v108;
  v71[5] = v59;
  uint64_t v73 = swift_allocObject();
  *(void *)(v73 + 16) = sub_2477067E0;
  *(void *)(v73 + 24) = v71;
  uint64_t v74 = swift_allocObject();
  *(void *)(v74 + 16) = sub_2477067EC;
  *(void *)(v74 + 24) = v73;
  id v75 = v103;
  v93(v103, v70, v63);
  uint64_t v76 = (v65 + 16) & ~v65;
  unint64_t v77 = (v102 + v76 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v78 = swift_allocObject();
  ((void (*)(uint64_t, char *, uint64_t))v98)(v78 + v76, v75, v63);
  v79 = (uint64_t (**)(uint64_t))(v78 + v77);
  NSObject *v79 = sub_24770681C;
  v79[1] = (uint64_t (*)(uint64_t))v74;
  swift_retain();
  swift_retain();
  sub_2477093F0();
  os_log_type_t v80 = *(void (**)(char *, uint64_t))(v60 + 8);
  v80(v70, v63);
  v80(v109, v63);
  v80(v110, v63);
  (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v99, v101);
  swift_release();
  return swift_release();
}

void sub_247700A48(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v3;
  id v5 = v3;
}

void sub_247700AA8(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  id v5 = (void *)a1[2];
  swift_beginAccess();
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = (void *)a2[4];
  a2[2] = v4;
  a2[3] = v3;
  a2[4] = v5;
  swift_bridgeObjectRetain();
  id v9 = v5;
  sub_247706514(v6, v7, v8);
}

void sub_247700B38(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void *a5@<X8>)
{
  swift_beginAccess();
  uint64_t v10 = *(void **)(a3 + 16);
  swift_beginAccess();
  uint64_t v11 = a4[2];
  uint64_t v12 = a4[3];
  uint64_t v13 = (void *)a4[4];
  *a5 = a1;
  a5[1] = a2;
  a5[2] = v10;
  a5[3] = v11;
  a5[4] = v12;
  a5[5] = v13;
  id v14 = v10;
  id v15 = a1;
  id v16 = a2;
  sub_247705438(v11, v12, v13);
}

void sub_247700BE8(uint64_t a1, void (*a2)(id *))
{
  uint64_t v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  id v5 = *(void **)(a1 + 24);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  v11[0] = *(id *)a1;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  char v12 = 0;
  id v8 = v4;
  id v9 = v11[0];
  id v10 = v3;
  sub_247705438((uint64_t)v5, (uint64_t)v6, v7);
  a2(v11);

  sub_247706514((uint64_t)v5, (uint64_t)v6, v7);
}

void sub_247700CA8(void *a1, void *a2, void (*a3)(void))
{
  if (qword_26925EA30 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_247709620();
  __swift_project_value_buffer(v6, (uint64_t)qword_26925ED80);
  id v7 = a2;
  id v8 = a1;
  id v9 = v7;
  id v10 = a1;
  uint64_t v11 = sub_247709600();
  os_log_type_t v12 = sub_247709800();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v25 = a3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = v24;
    *(_DWORD *)uint64_t v13 = 136315650;
    uint64_t v14 = sub_247709A30();
    uint64_t v31 = sub_2476F9E40(v14, v15, &v26);
    sub_2477098A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    id v16 = objc_msgSend(v9, sel_description);
    uint64_t v17 = sub_2477096E0();
    unint64_t v19 = v18;

    uint64_t v31 = sub_2476F9E40(v17, v19, &v26);
    sub_2477098A0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 22) = 2080;
    swift_getErrorValue();
    uint64_t v20 = Error.logOutput.getter();
    uint64_t v31 = sub_2476F9E40(v20, v21, &v26);
    sub_2477098A0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2476F0000, v11, v12, "%s: Failed to fetch session information for %s: %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C55ACF0](v24, -1, -1);
    uint64_t v22 = v13;
    a3 = v25;
    MEMORY[0x24C55ACF0](v22, -1, -1);
  }
  else
  {
  }
  uint64_t v26 = (uint64_t)a1;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v29 = 0;
  char v30 = 1;
  id v23 = a1;
  a3(&v26);
}

uint64_t sub_247700FB8(uint64_t a1, double a2)
{
  *(void *)(v3 + 40) = v2;
  *(double *)(v3 + 32) = a2;
  *(void *)(v3 + 24) = a1;
  return MEMORY[0x270FA2498](sub_247700FE0, 0, 0);
}

uint64_t sub_247700FE0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  id v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  uint64_t v6 = sub_2476FBAB8(0, (unint64_t *)&qword_26B130628);
  *id v5 = v0;
  v5[1] = sub_247701104;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD00000000000001DLL, 0x800000024770B950, sub_247705420, v4, v6);
}

uint64_t sub_247701104()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247701220;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2476FC48C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247701220()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247701284(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  sub_2476FEC54(a4, (uint64_t)sub_247706318, v11, a2);
  return swift_release();
}

uint64_t sub_2477013DC(void *a1, char a2)
{
  if (a2)
  {
    id v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
    return sub_247709760();
  }
  else
  {
    id v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
    return sub_247709770();
  }
}

uint64_t sub_24770144C(uint64_t a1, uint64_t a2, double a3, double a4)
{
  *(void *)(v5 + 48) = v4;
  *(double *)(v5 + 32) = a3;
  *(double *)(v5 + 40) = a4;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  return MEMORY[0x270FA2498](sub_247701474, 0, 0);
}

uint64_t sub_247701474()
{
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[3];
  uint64_t v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  v5[2] = v1;
  uint64_t v5[3] = v4;
  v5[4] = v3;
  v5[5] = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[8] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_247701580;
  uint64_t v7 = v0[2];
  return MEMORY[0x270FA2360](v7, 0, 0, 0xD000000000000041, 0x800000024770B970, sub_24770542C, v5, &type metadata for FitnessPlusSessionProvider.SessionInformation);
}

uint64_t sub_247701580()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2477016BC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2477016BC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247701720(uint64_t a1, double a2, double a3, uint64_t a4, void *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC90);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  sub_2476FF7E8(a5, (uint64_t)sub_247706298, v13, a2, a3);
  return swift_release();
}

uint64_t sub_247701880(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC90);
    return sub_247709760();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 24);
    uint64_t v7 = *(void **)(a1 + 8);
    id v8 = *(id *)(a1 + 16);
    id v9 = v1;
    id v10 = v7;
    sub_247705438(v6, v5, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC90);
    return sub_247709770();
  }
}

uint64_t sub_247701938@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925ECC0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v43 - v8;
  uint64_t v10 = sub_2477093A0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(a1, sel_metadata);
  if (!v14)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    goto LABEL_9;
  }
  uint64_t v15 = v14;
  uint64_t v45 = v4;
  uint64_t v16 = sub_2477096A0();

  uint64_t v17 = sub_2477095F0();
  if (!*(void *)(v16 + 16) || (unint64_t v19 = sub_2476F3204(v17, v18), (v20 & 1) == 0))
  {
    long long v49 = 0u;
    long long v50 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_2476F327C(*(void *)(v16 + 56) + 32 * v19, (uint64_t)&v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v50 + 1))
  {
LABEL_9:
    sub_2476F3340((uint64_t)&v49, &qword_26B130638);
    goto LABEL_10;
  }
  if (swift_dynamicCast())
  {
    sub_247709390();
    unint64_t v21 = v46 + 8;
    uint64_t v22 = v46[11];
    uint64_t v46 = (void *)v46[12];
    v43[1] = __swift_project_boxed_opaque_existential_1(v21, v22);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26925ECC8);
    uint64_t v23 = *(unsigned __int8 *)(v11 + 80);
    uint64_t v44 = v11;
    uint64_t v24 = (v23 + 32) & ~v23;
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_24770A0D0;
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v25 + v24, v13, v10);
    sub_247709590();
    swift_bridgeObjectRelease();
    uint64_t v26 = v45;
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v7, v9, v3);
    unint64_t v27 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v28 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v26 + 32))(v28 + v27, v7, v3);
    uint64_t v29 = (uint64_t (**)(uint64_t *))(v28 + ((v5 + v27 + 7) & 0xFFFFFFFFFFFFFFF8));
    *uint64_t v29 = sub_247702138;
    v29[1] = 0;
    sub_2477092D0();
    sub_2477093F0();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v13, v10);
  }
LABEL_10:
  if (qword_26925EA30 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_247709620();
  __swift_project_value_buffer(v31, (uint64_t)qword_26925ED80);
  id v32 = a1;
  uint64_t v33 = sub_247709600();
  os_log_type_t v34 = sub_247709800();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(void *)&long long v49 = v36;
    *(_DWORD *)uint64_t v35 = 136315394;
    uint64_t v48 = sub_2476F9E40(0xD000000000000018, 0x800000024770BA50, (uint64_t *)&v49);
    sub_2477098A0();
    *(_WORD *)(v35 + 12) = 2080;
    id v37 = objc_msgSend(v32, sel_description);
    uint64_t v38 = sub_2477096E0();
    unint64_t v40 = v39;

    uint64_t v48 = sub_2476F9E40(v38, v40, (uint64_t *)&v49);
    sub_2477098A0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2476F0000, v33, v34, "%s failed to load catalog workout identifier for session: %s", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C55ACF0](v36, -1, -1);
    MEMORY[0x24C55ACF0](v35, -1, -1);
  }
  else
  {
  }
  sub_2477061E8();
  uint64_t v41 = swift_allocError();
  *uint64_t v42 = 0;
  *(void *)(swift_allocObject() + 16) = v41;
  sub_2477092D0();
  return sub_247709400();
}

uint64_t sub_247701F60(uint64_t a1)
{
  uint64_t v2 = sub_2477092D0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  if (*(void *)(a1 + 16))
  {
    uint64_t v5 = *(unsigned __int8 *)(v3 + 80);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1 + ((v5 + 32) & ~v5), v2);
    uint64_t v6 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v6 + ((v5 + 16) & ~v5), (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    return sub_247709400();
  }
  else
  {
    sub_2477061E8();
    uint64_t v8 = swift_allocError();
    *id v9 = 1;
    *(void *)(swift_allocObject() + 16) = v8;
    return sub_247709400();
  }
}

uint64_t sub_247702138(uint64_t *a1)
{
  return sub_247701F60(*a1);
}

uint64_t sub_247702140@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v61 = a1;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC58);
  uint64_t v4 = *(void *)(v51 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v51);
  uint64_t v7 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v48 = (char *)&v47 - v8;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC60);
  uint64_t v53 = *(void *)(v55 - 8);
  uint64_t v54 = *(void *)(v53 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v55);
  unint64_t v52 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  long long v49 = (char *)&v47 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC18);
  uint64_t v59 = *(void *)(v12 - 8);
  uint64_t v60 = v12;
  uint64_t v58 = *(void *)(v59 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  unint64_t v57 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v56 = (char *)&v47 - v15;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0;
  *(void *)(v16 + 24) = 0xE000000000000000;
  sub_2476F3918(v2 + 64, (uint64_t)v63);
  uint64_t v17 = swift_allocObject();
  uint64_t v62 = v17;
  *(void *)(v17 + 16) = v16;
  uint64_t v50 = v16;
  sub_247704F04(v63, v17 + 24);
  sub_2476F3918(v2 + 24, (uint64_t)v63);
  uint64_t v18 = swift_allocObject();
  uint64_t v47 = v18;
  sub_247704F04(v63, v18 + 16);
  *(double *)(v18 + 56) = a2;
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 64), *(void *)(v2 + 88));
  swift_retain();
  sub_247709290();
  unint64_t v19 = v48;
  sub_2477095B0();
  swift_bridgeObjectRelease();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_247705EA0;
  *(void *)(v20 + 24) = v62;
  uint64_t v21 = v51;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v19, v51);
  unint64_t v22 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v23 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v23 + v22, v7, v21);
  uint64_t v24 = (uint64_t (**)())(v23 + ((v5 + v22 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v24 = sub_247706E54;
  v24[1] = (uint64_t (*)())v20;
  sub_2477092F0();
  swift_retain();
  uint64_t v25 = v49;
  sub_2477093F0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v19, v21);
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = v47;
  *(void *)(v26 + 16) = sub_247705EAC;
  *(void *)(v26 + 24) = v27;
  uint64_t v29 = v52;
  uint64_t v28 = v53;
  uint64_t v30 = v55;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v52, v25, v55);
  unint64_t v31 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  unint64_t v32 = (v54 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v28 + 32))(v33 + v31, v29, v30);
  os_log_type_t v34 = (uint64_t (**)())(v33 + v32);
  *os_log_type_t v34 = sub_247706E54;
  v34[1] = (uint64_t (*)())v26;
  sub_2476FBAB8(0, (unint64_t *)&qword_26B130628);
  swift_retain();
  uint64_t v35 = v56;
  sub_2477093F0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v30);
  uint64_t v36 = swift_allocObject();
  uint64_t v37 = v50;
  *(void *)(v36 + 16) = sub_247705F8C;
  *(void *)(v36 + 24) = v37;
  uint64_t v39 = v59;
  uint64_t v38 = v60;
  unint64_t v40 = v57;
  uint64_t v41 = v35;
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v57, v35, v60);
  unint64_t v42 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  unint64_t v43 = (v58 + v42 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v44 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v39 + 32))(v44 + v42, v40, v38);
  uint64_t v45 = (uint64_t (**)(void **))(v44 + v43);
  *uint64_t v45 = sub_247705FA8;
  v45[1] = (uint64_t (*)(void **))v36;
  swift_retain();
  sub_2477093F0();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v38);
  return swift_release();
}

uint64_t sub_2477027D8@<X0>(uint64_t a1@<X1>, void *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v24 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC80);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247709310();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_247709450();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247709340();
  uint64_t v16 = sub_247709300();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (*(void *)(v16 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v7, v16 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)), v12);
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v7, v17, 1, v12);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) == 1)
  {
    sub_2476F3340((uint64_t)v7, &qword_26925EC80);
    sub_2477061E8();
    uint64_t v18 = swift_allocError();
    *unint64_t v19 = 1;
    *(void *)(swift_allocObject() + 16) = v18;
    sub_2477092F0();
    return sub_247709400();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v7, v12);
    uint64_t v21 = sub_247709440();
    uint64_t v23 = v22;
    swift_beginAccess();
    *(void *)(a1 + 16) = v21;
    *(void *)(a1 + 24) = v23;
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    sub_247709430();
    sub_2477095A0();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

uint64_t sub_247702B4C@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v15 = sub_2477093D0();
  uint64_t v3 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2477093C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_247709330();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2477092E0();
  sub_247709320();
  sub_24770618C((uint64_t)v12);
  sub_2477093B0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_247709550();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v15);
}

id sub_247702D68@<X0>(void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_beginAccess();
  uint64_t v6 = *(void *)(a2 + 24);
  *a3 = *(void *)(a2 + 16);
  a3[1] = v6;
  a3[2] = v5;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t FitnessPlusSessionProvider.deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  return v0;
}

uint64_t FitnessPlusSessionProvider.__deallocating_deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  return MEMORY[0x270FA0228](v0, 144, 7);
}

BOOL static FitnessPlusSessionProvider.FetchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FitnessPlusSessionProvider.FetchError.hash(into:)()
{
  return sub_247709A10();
}

uint64_t FitnessPlusSessionProvider.FetchError.hashValue.getter()
{
  return sub_247709A20();
}

id FitnessPlusSessionProvider.SessionInformation.title.getter()
{
  return *v0;
}

id FitnessPlusSessionProvider.SessionInformation.subtitle.getter()
{
  return *(id *)(v0 + 8);
}

void *FitnessPlusSessionProvider.SessionInformation.artwork.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void FitnessPlusSessionProvider.SessionInformation.trainer.getter(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  uint64_t v4 = (void *)v1[5];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  sub_247705438(v2, v3, v4);
}

uint64_t FitnessPlusSessionProvider.TrainerInformation.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id FitnessPlusSessionProvider.TrainerInformation.artwork.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_247702F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v13 = (void (*)(uint64_t, void *))sub_247709410();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a1;
  v14[5] = a2;
  swift_retain();
  swift_retain();
  v13(a8, v14);
  swift_release();
  return swift_release();
}

uint64_t sub_247703024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v13 = (void (*)(uint64_t, void *))sub_247709410();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a1;
  v14[5] = a2;
  swift_retain();
  swift_retain();
  v13(a8, v14);
  swift_release();
  return swift_release();
}

uint64_t sub_2477030E0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  id v7 = a1;
  return sub_2477093F0();
}

void sub_247703184(void (*a1)(void **), uint64_t a2, void (*a3)(void **__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  a3(&v7, a5);
  uint64_t v6 = v7;
  char v8 = 0;
  a1(&v7);
  sub_2477065CC(v6, 0);
}

uint64_t sub_247703218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC20);
  uint64_t v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_247709410();
  uint64_t v10 = (void *)swift_allocObject();
  id v10[2] = a1;
  v10[3] = a2;
  v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_24770697C, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_2477032E4(void *a1, char a2, uint64_t (*a3)(void **), uint64_t a4, void (*a5)(void *))
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC20);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v15 = a1;
    a5(a1);
    uint64_t v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_247709410();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a3;
    *(void *)(v17 + 24) = a4;
    swift_retain();
    v16(sub_247705234, v17);
    swift_release();
    swift_release();
    sub_2477065CC(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    uint64_t v18 = a1;
    char v19 = 0;
    return a3(&v18);
  }
}

uint64_t sub_247703480(void *a1, char a2, void (*a3)(void **), uint64_t a4, void (*a5)(void *), uint64_t a6)
{
  uint64_t v21 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925ECA0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (void (**)(void *))((char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC10);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    void *v12 = a1;
    swift_storeEnumTagMultiPayload();
    id v20 = a1;
    v21(v12);
    return sub_2476F3340((uint64_t)v12, &qword_26925ECA0);
  }
  else
  {
    uint64_t v22 = a1;
    swift_bridgeObjectRetain();
    a3(&v22);
    uint64_t v17 = (void (*)(uint64_t (*)(), uint64_t))sub_247709410();
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v21;
    *(void *)(v18 + 24) = a6;
    swift_retain();
    v17(sub_247706188, v18);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    return swift_bridgeObjectRelease();
  }
}

void sub_24770369C(void *a1, char a2, void (*a3)(id *), uint64_t a4, void (*a5)(id *), uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC20);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = a1;
  if (a2)
  {
    char v20 = 1;
    id v18 = a1;
    a5(&v19);
    sub_24770604C(a1);
  }
  else
  {
    id v15 = a1;
    a3(&v19);
    uint64_t v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_247709410();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a5;
    *(void *)(v17 + 24) = a6;
    swift_retain();
    v16(sub_247705234, v17);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

void sub_24770384C(uint64_t a1, void (*a2)(id *), uint64_t a3, void (*a4)(id *), uint64_t a5)
{
  uint64_t v30 = a5;
  uint64_t v29 = a4;
  v27[1] = a3;
  uint64_t v28 = a2;
  sub_2477063F4(a1, (uint64_t)v37);
  id v7 = (void *)v37[0];
  uint64_t v6 = (void *)v37[1];
  char v8 = (void *)v37[2];
  uint64_t v9 = v37[3];
  uint64_t v11 = v37[4];
  uint64_t v10 = (void *)v37[5];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC20);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2477063F4(a1, (uint64_t)v38);
  id v31 = v7;
  if (v38[48])
  {
    LOBYTE(v32) = 1;
    id v16 = v7;
    v29(&v31);
    sub_24770645C(a1);
  }
  else
  {
    unint64_t v32 = v6;
    uint64_t v33 = v8;
    uint64_t v34 = v9;
    uint64_t v35 = v11;
    uint64_t v36 = v10;
    id v17 = v8;
    id v18 = v7;
    id v19 = v6;
    sub_247705438(v9, v11, v10);
    v28(&v31);
    char v20 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_247709410();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v29;
    *(void *)(v21 + 24) = v30;
    swift_retain();
    v20(sub_247705234, v21);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v22 = v32;
    uint64_t v24 = v33;
    uint64_t v23 = v34;
    uint64_t v25 = v35;
    uint64_t v26 = v36;

    sub_247706514(v23, v25, v26);
  }
}

void sub_247703A88(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(id *), uint64_t a5)
{
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  v21[1] = a3;
  uint64_t v22 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_26925EC28);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2477092D0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925ECA0);
  MEMORY[0x270FA5388](v14);
  id v16 = (id *)((char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2477065E8(a1, (uint64_t)v16, &qword_26925ECA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v25 = *v16;
    id v17 = v25;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v28 = 0;
    char v29 = 1;
    id v18 = v25;
    v23(&v25);
  }
  else
  {
    (*(void (**)(char *, id *, uint64_t))(v11 + 32))(v13, v16, v10);
    v22(v13);
    id v19 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_247709410();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v23;
    *(void *)(v20 + 24) = v24;
    swift_retain();
    v19(sub_247706650, v20);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

void sub_247703D60(void *a1, char a2, void (*a3)(id *), uint64_t a4, void (*a5)(id *), uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC68);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v19[1] = 0;
    v19[2] = 0;
    v19[0] = a1;
    char v20 = 1;
    id v18 = a1;
    a5(v19);
    sub_24770604C(a1);
  }
  else
  {
    v19[0] = a1;
    id v15 = a1;
    a3(v19);
    id v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_247709410();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a5;
    *(void *)(v17 + 24) = a6;
    swift_retain();
    v16(sub_24770605C, v17);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

void sub_247703F14(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(id *), uint64_t a5, uint64_t (*a6)(void), uint64_t *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v29 = a8;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  v27[1] = a3;
  uint64_t v28 = a2;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC18);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a6(0);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  id v19 = (char *)v27 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(a7);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (id *)((char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2477065E8(a1, (uint64_t)v22, a7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v32 = *v22;
    id v23 = v32;
    char v33 = 1;
    id v24 = v32;
    v30(&v32);
  }
  else
  {
    (*(void (**)(char *, id *, uint64_t))(v17 + 32))(v19, v22, v16);
    v28(v19);
    id v25 = (void (*)(uint64_t, uint64_t))sub_247709410();
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v30;
    *(void *)(v26 + 24) = v31;
    swift_retain();
    v25(a9, v26);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
}

uint64_t sub_2477041D4(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(void **), uint64_t a5)
{
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v25 = a3;
  uint64_t v26 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC70);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (void **)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC60);
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_247709350();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC78);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (void **)((char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2477065E8(a1, (uint64_t)v18, &qword_26925EC78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v19 = *v18;
    *uint64_t v8 = *v18;
    swift_storeEnumTagMultiPayload();
    id v20 = v19;
    v29(v8);

    return sub_2476F3340((uint64_t)v8, &qword_26925EC70);
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v13 + 32))(v15, v18, v12);
    v26(v15);
    uint64_t v22 = v28;
    id v23 = (void (*)(uint64_t (*)(), uint64_t))sub_247709410();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v29;
    *(void *)(v24 + 24) = v30;
    swift_retain();
    v23(sub_247706188, v24);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

void sub_247704504(void *a1, char a2, void (*a3)(uint64_t), uint64_t a4, void (*a5)(void **), uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26925EC28);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v20 = a1;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v23 = 0;
    char v24 = 1;
    id v18 = a1;
    a5(&v20);
    sub_2477065CC(a1, 1);
  }
  else
  {
    a3(v13);
    uint64_t v16 = (void (*)(uint64_t (*)(), uint64_t))sub_247709410();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a5;
    *(void *)(v17 + 24) = a6;
    swift_retain();
    v16(sub_247706E64, v17);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
}

void sub_2477046AC(void *a1, uint64_t a2, void *a3, char a4, void (*a5)(void **), uint64_t a6, void (*a7)(void **), uint64_t a8)
{
  long long v22 = a7;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC20);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v23 = a1;
    LOBYTE(v24) = 1;
    id v21 = a1;
    v22(&v23);
    sub_2477060BC(a1, a2, a3, 1);
  }
  else
  {
    uint64_t v23 = a1;
    uint64_t v24 = a2;
    id v25 = a3;
    swift_bridgeObjectRetain();
    id v18 = a3;
    a5(&v23);
    uint64_t v19 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_247709410();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v22;
    *(void *)(v20 + 24) = a8;
    swift_retain();
    v19(sub_247705234, v20);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);

    swift_bridgeObjectRelease();
  }
}

void sub_247704888(void (*a1)(void **), uint64_t a2, void (*a3)(void **__return_ptr, uint64_t *), uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = *a5;
  a3(&v8, &v7);
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);
  sub_2477065CC(v6, 0);
}

uint64_t sub_247704924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a1;
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = v5;
  v11[5] = v6;
  id v11[6] = v8;
  v11[7] = v7;
  v11[8] = v9;
  v11[9] = v10;
  id v12 = v8;
  id v13 = v5;
  id v14 = v6;
  sub_247705438(v7, v9, v10);
  swift_retain();
  return sub_2477093F0();
}

void sub_2477049FC(void (*a1)(_OWORD *), uint64_t a2, void (*a3)(void **__return_ptr, _OWORD *), uint64_t a4, _OWORD *a5)
{
  long long v6 = a5[1];
  v8[0] = *a5;
  v8[1] = v6;
  long long v8[2] = a5[2];
  a3(&v9, v8);
  uint64_t v7 = v9;
  *(void *)&v8[0] = v9;
  BYTE8(v8[0]) = 0;
  a1(v8);
  sub_2477065CC(v7, 0);
}

uint64_t sub_247704AA0(uint64_t result, uint64_t (*a2)(_OWORD *))
{
  char v2 = *(unsigned char *)(result + 48);
  long long v3 = *(_OWORD *)(result + 16);
  v4[0] = *(_OWORD *)result;
  v4[1] = v3;
  v4[2] = *(_OWORD *)(result + 32);
  char v5 = v2;
  if (a2) {
    return a2(v4);
  }
  return result;
}

uint64_t sub_247704AF0(void **a1, uint64_t a2, uint64_t a3)
{
  char v5 = *a1;
  long long v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = v5;
  id v7 = v5;
  swift_retain();
  return sub_2477093F0();
}

void sub_247704B84(void (*a1)(void *), uint64_t a2, void (*a3)(void *__return_ptr, uint64_t *), uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = *a5;
  a3(v10, &v9);
  long long v6 = (void *)v10[0];
  uint64_t v7 = v10[1];
  uint64_t v8 = (void *)v10[2];
  char v11 = 0;
  a1(v10);
  sub_2477060BC(v6, v7, v8, 0);
}

uint64_t sub_247704C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  swift_retain();
  return sub_2477093F0();
}

void sub_247704CC8(void (*a1)(void *), uint64_t a2, void (*a3)(void *__return_ptr))
{
  a3(v10);
  uint64_t v4 = (void *)v10[0];
  uint64_t v5 = (void *)v10[1];
  long long v6 = (void *)v10[2];
  uint64_t v7 = v10[3];
  uint64_t v8 = v10[4];
  uint64_t v9 = (void *)v10[5];
  char v11 = 0;
  a1(v10);
  sub_247706498(v4, v5, v6, v7, v8, v9, 0);
}

uint64_t sub_247704DA8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = (void *)a1[2];
  uint64_t v8 = (void *)swift_allocObject();
  long long v8[2] = a2;
  _OWORD v8[3] = a3;
  v8[4] = v6;
  v8[5] = v5;
  v8[6] = v7;
  swift_bridgeObjectRetain();
  id v9 = v7;
  swift_retain();
  return sub_2477093F0();
}

void sub_247704E60(void (*a1)(void **), uint64_t a2, void (*a3)(void **__return_ptr, void **), uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(void **)a5;
  long long v8 = *(_OWORD *)(a5 + 8);
  a3(&v9, &v7);
  uint64_t v6 = v9;
  uint64_t v7 = v9;
  LOBYTE(v8) = 0;
  a1(&v7);
  sub_2477065CC(v6, 0);
}

uint64_t sub_247704F04(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_247704F1C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_247704F54(uint64_t a1)
{
  return sub_2476FF2E8(a1, (void *)(v1 + 16));
}

uint64_t sub_247704F60()
{
  return objectdestroy_2Tm(&qword_26925EC10);
}

uint64_t sub_247704F6C(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, &qword_26925EC10, (uint64_t)&unk_26FBB8F08, (uint64_t)sub_247706A58, sub_247702F68);
}

uint64_t sub_247704FA8(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, 0);
}

uint64_t sub_247704FE0(void **a1)
{
  return sub_247704AF0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_247705024()
{
  return objectdestroy_2Tm(&qword_26925EC18);
}

uint64_t sub_247705030(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, &qword_26925EC18, (uint64_t)&unk_26FBB8E90, (uint64_t)sub_2477069E8, sub_247702F68);
}

uint64_t sub_24770506C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, void, void, uint64_t *, uint64_t, uint64_t))
{
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  unint64_t v14 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = v6 + v14;
  uint64_t v16 = (void *)(v6 + ((*(void *)(v13 + 64) + v14 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a6(a1, a2, v15, *v16, v16[1], a3, a4, a5);
}

uint64_t sub_247705144(void *a1)
{
  return sub_2476FF4FC(a1, *(void **)(v1 + 16), *(uint64_t (**)(void, void))(v1 + 24));
}

uint64_t sub_247705164(void *a1)
{
  return sub_2477030E0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24770516C()
{
  return objectdestroy_2Tm(&qword_26925EC20);
}

uint64_t sub_24770517C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925EC20) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v2 + v6;
  long long v8 = (uint64_t *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  return sub_247703218(a1, a2, v7, v9, v10);
}

uint64_t sub_247705238()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247705270()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_2477052B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2476FFF28(a1, (void *)(v2 + 16), (void *)(v2 + 56), *(void *)(v2 + 104), a2, *(double *)(v2 + 112));
}

uint64_t sub_2477052D0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2477052F8()
{
  return objectdestroy_2Tm(&qword_26925EC10);
}

uint64_t sub_247705304(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, &qword_26925EC10, (uint64_t)&unk_26FBB8B48, (uint64_t)sub_2477065DC, sub_247703024);
}

void sub_247705340(uint64_t a1)
{
  sub_247700BE8(a1, *(void (**)(id *))(v1 + 16));
}

uint64_t sub_24770535C(uint64_t a1)
{
  return sub_247704924(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_247705364()
{
  return objectdestroy_2Tm(qword_26925EC28);
}

uint64_t sub_247705370(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, qword_26925EC28, (uint64_t)&unk_26FBB8AD0, (uint64_t)sub_2477063A0, sub_247703024);
}

uint64_t objectdestroy_14Tm()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2477053F0(void *a1)
{
  sub_247700CA8(a1, *(void **)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_247705410()
{
  return objectdestroy_2Tm(&qword_26925EC20);
}

uint64_t sub_247705420(uint64_t a1)
{
  return sub_247701284(a1, *(double *)(v1 + 32), *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_24770542C(uint64_t a1)
{
  return sub_247701720(a1, *(double *)(v1 + 32), *(double *)(v1 + 40), *(void *)(v1 + 16), *(void **)(v1 + 24));
}

void sub_247705438(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v3 = a3;
  }
}

unint64_t sub_247705480()
{
  unint64_t result = qword_26925EC40;
  if (!qword_26925EC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925EC40);
  }
  return result;
}

uint64_t type metadata accessor for FitnessPlusSessionProvider()
{
  return self;
}

uint64_t method lookup function for FitnessPlusSessionProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FitnessPlusSessionProvider);
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.__allocating_init(healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.fetchImage(for:width:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.fetchSessionInformation(for:sessionImageWidth:trainerImageWidth:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.fetchImage(forSession:width:)(uint64_t a1, double a2)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, __n128))(*(void *)(*(void *)v2 + 136) + **(int **)(*(void *)v2 + 136));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_2476FB488;
  v7.n128_f64[0] = a2;
  return v9(a1, v7);
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.fetchSessionInformation(for:sessionImageWidth:trainerImageWidth:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  unint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, __n128, __n128))(*(void *)(*(void *)v4 + 144)
                                                                 + **(int **)(*(void *)v4 + 144));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_2476FB030;
  v11.n128_f64[0] = a3;
  v12.n128_f64[0] = a4;
  return v14(a1, a2, v11, v12);
}

unsigned char *storeEnumTagSinglePayload for FitnessPlusSessionProvider.FetchError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247705874);
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

ValueMetadata *type metadata accessor for FitnessPlusSessionProvider.FetchError()
{
  return &type metadata for FitnessPlusSessionProvider.FetchError;
}

void destroy for FitnessPlusSessionProvider.SessionInformation(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = *(void **)(a1 + 40);
  }
}

void *initializeWithCopy for FitnessPlusSessionProvider.SessionInformation(void *a1, uint64_t a2)
{
  unsigned int v4 = *(void **)a2;
  uint64_t v5 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v5;
  unsigned int v6 = *(void **)(a2 + 16);
  a1[2] = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  if (v7)
  {
    a1[3] = *(void *)(a2 + 24);
    a1[4] = v7;
    __n128 v11 = *(void **)(a2 + 40);
    a1[5] = v11;
    swift_bridgeObjectRetain();
    id v12 = v11;
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
    a1[5] = *(void *)(a2 + 40);
  }
  return a1;
}

uint64_t assignWithCopy for FitnessPlusSessionProvider.SessionInformation(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  id v10 = *(void **)(a1 + 16);
  __n128 v11 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v11;
  id v12 = v11;

  uint64_t v13 = (_OWORD *)(a1 + 24);
  unint64_t v14 = (_OWORD *)(a2 + 24);
  uint64_t v15 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v15)
    {
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void **)(a2 + 40);
      uint64_t v17 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v16;
      id v18 = v16;
    }
    else
    {
      sub_247705AB8(a1 + 24);
      uint64_t v21 = *(void *)(a2 + 40);
      *uint64_t v13 = *v14;
      *(void *)(a1 + 40) = v21;
    }
  }
  else if (v15)
  {
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    uint64_t v19 = *(void **)(a2 + 40);
    *(void *)(a1 + 40) = v19;
    swift_bridgeObjectRetain();
    id v20 = v19;
  }
  else
  {
    long long v22 = *v14;
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *uint64_t v13 = v22;
  }
  return a1;
}

uint64_t sub_247705AB8(uint64_t a1)
{
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

uint64_t assignWithTake for FitnessPlusSessionProvider.SessionInformation(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  id v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  if (!*(void *)(a1 + 32)) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void *)(a2 + 32);
  if (!v7)
  {
    sub_247705AB8(a1 + 24);
LABEL_5:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    return a1;
  }
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  id v8 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for FitnessPlusSessionProvider.SessionInformation(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FitnessPlusSessionProvider.SessionInformation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FitnessPlusSessionProvider.SessionInformation()
{
  return &type metadata for FitnessPlusSessionProvider.SessionInformation;
}

void destroy for FitnessPlusSessionProvider.TrainerInformation(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s10ActivityUI26FitnessPlusSessionProviderC18TrainerInformationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  unsigned int v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for FitnessPlusSessionProvider.TrainerInformation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unsigned int v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FitnessPlusSessionProvider.TrainerInformation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  unsigned int v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for FitnessPlusSessionProvider.TrainerInformation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FitnessPlusSessionProvider.TrainerInformation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FitnessPlusSessionProvider.TrainerInformation()
{
  return &type metadata for FitnessPlusSessionProvider.TrainerInformation;
}

uint64_t sub_247705E28()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247705E60()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_247705EA0@<X0>(uint64_t a1@<X8>)
{
  return sub_2477027D8(*(void *)(v1 + 16), (void *)(v1 + 24), a1);
}

uint64_t sub_247705EAC@<X0>(uint64_t a1@<X8>)
{
  return sub_247702B4C((void *)(v1 + 16), a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_247705EFC()
{
  return objectdestroy_2Tm(&qword_26925EC58);
}

uint64_t sub_247705F08(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, &qword_26925EC58, (uint64_t)&unk_26FBB8A08, (uint64_t)sub_247706178, sub_247702F68);
}

uint64_t sub_247705F44()
{
  return objectdestroy_2Tm(&qword_26925EC60);
}

uint64_t sub_247705F50(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, &qword_26925EC60, (uint64_t)&unk_26FBB89B8, (uint64_t)sub_247706110, sub_247702F68);
}

id sub_247705F8C@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return sub_247702D68(a1, v2, a2);
}

uint64_t sub_247705FA8(void **a1)
{
  return sub_247704AF0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_247705FE8()
{
  return objectdestroy_2Tm(&qword_26925EC18);
}

uint64_t sub_247705FF4(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, &qword_26925EC18, (uint64_t)&unk_26FBB8940, (uint64_t)sub_247706034, sub_247703024);
}

uint64_t sub_247706034(uint64_t a1)
{
  return sub_247706C4C(a1, (uint64_t (*)(void, void, void, void, void, void))sub_247703D60);
}

void sub_24770604C(id a1)
{
}

uint64_t sub_24770605C(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(long long *))(v1 + 16);
  uint64_t v3 = *(void *)(result + 16);
  char v4 = *(unsigned char *)(result + 24);
  long long v5 = *(_OWORD *)result;
  uint64_t v6 = v3;
  char v7 = v4;
  if (v2) {
    return v2(&v5);
  }
  return result;
}

void sub_2477060B0(void (*a1)(void *), uint64_t a2)
{
  sub_247704B84(a1, a2, *(void (**)(void *__return_ptr, uint64_t *))(v2 + 16), *(void *)(v2 + 24), (uint64_t *)(v2 + 32));
}

void sub_2477060BC(void *a1, uint64_t a2, void *a3, char a4)
{
  if (a4)
  {
  }
  else
  {
    swift_bridgeObjectRelease();
    a1 = a3;
  }
}

void sub_247706110(uint64_t a1)
{
  sub_247703F14(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(id *))(v1 + 32), *(void *)(v1 + 40), MEMORY[0x263F69550], &qword_26925EC70, (uint64_t)&unk_26FBB89E0, (uint64_t)sub_247705234);
}

uint64_t sub_247706178(uint64_t a1)
{
  return sub_2477041D4(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(void **))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_24770618C(uint64_t a1)
{
  uint64_t v2 = sub_247709330();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2477061E8()
{
  unint64_t result = qword_26925EC88;
  if (!qword_26925EC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925EC88);
  }
  return result;
}

uint64_t sub_24770623C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_247706274()
{
  return sub_247706DE0();
}

uint64_t sub_24770628C()
{
  return objectdestroy_81Tm(&qword_26925EC90);
}

uint64_t sub_247706298(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC90);
  return sub_247701880(a1);
}

uint64_t sub_24770630C()
{
  return objectdestroy_81Tm(&qword_26B130608);
}

uint64_t sub_247706318(void *a1, char a2)
{
  char v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
  return sub_2477013DC(a1, v3);
}

void sub_2477063A0(uint64_t a1)
{
  uint64_t v2 = (void (*)(id *))v1[2];
  uint64_t v3 = v1[3];
  long long v5 = (void (*)(id *))v1[4];
  uint64_t v4 = v1[5];
  sub_2477063F4(a1, (uint64_t)v6);
  sub_24770384C((uint64_t)v6, v2, v3, v5, v4);
}

uint64_t sub_2477063F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925EC98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24770645C(uint64_t a1)
{
  return a1;
}

void sub_247706498(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, char a7)
{
  if (a7)
  {
  }
  else
  {

    sub_247706514(a4, a5, a6);
  }
}

void sub_247706514(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24770655C()
{
  swift_release();

  if (*(void *)(v0 + 64))
  {
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_2477065C0(void (*a1)(_OWORD *), uint64_t a2)
{
  sub_2477049FC(a1, a2, *(void (**)(void **__return_ptr, _OWORD *))(v2 + 16), *(void *)(v2 + 24), (_OWORD *)(v2 + 32));
}

void sub_2477065CC(id a1, char a2)
{
  if (a2) {
}
  }

void sub_2477065DC(uint64_t a1)
{
  sub_247703A88(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(id *))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_2477065E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247706650(uint64_t a1)
{
  return sub_247704AA0(a1, *(uint64_t (**)(_OWORD *))(v1 + 16));
}

uint64_t sub_247706658()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247706690()
{
  if (*(void *)(v0 + 24))
  {
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2477066D4(void **a1)
{
  sub_247700A48(a1, v1);
}

uint64_t sub_2477066F0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247706728()
{
  return objectdestroy_2Tm(&qword_26925EC18);
}

unint64_t sub_247706734()
{
  unint64_t result = qword_26925ECB8;
  if (!qword_26925ECB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925ECB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925ECB8);
  }
  return result;
}

uint64_t sub_247706790()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2477067E0(void *a1@<X8>)
{
  sub_247700B38(*(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), a1);
}

uint64_t sub_2477067EC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24770681C(uint64_t a1)
{
  return sub_247704C40(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_247706824()
{
  return objectdestroy_2Tm(&qword_26925EC20);
}

uint64_t sub_247706830(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, &qword_26925EC20, (uint64_t)&unk_26FBB8DA0, (uint64_t)sub_247706954, sub_247703024);
}

void sub_24770686C(uint64_t *a1)
{
  sub_247700AA8(a1, v1);
}

uint64_t sub_247706888(uint64_t *a1)
{
  return sub_247704DA8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_247706890()
{
  return objectdestroy_2Tm(&qword_26925EC68);
}

uint64_t sub_24770689C(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, &qword_26925EC68, (uint64_t)&unk_26FBB8D28, (uint64_t)sub_2477068DC, sub_247703024);
}

void sub_2477068DC(uint64_t a1)
{
  sub_2477046AC(*(void **)a1, *(void *)(a1 + 8), *(void **)(a1 + 16), *(unsigned char *)(a1 + 24), *(void (**)(void **))(v1 + 16), *(void *)(v1 + 24), *(void (**)(void **))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_2477068FC()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_247706944(void (*a1)(void **), uint64_t a2)
{
  sub_247704E60(a1, a2, *(void (**)(void **__return_ptr, void **))(v2 + 16), *(void *)(v2 + 24), v2 + 32);
}

uint64_t sub_247706954(uint64_t a1)
{
  return sub_247706C4C(a1, (uint64_t (*)(void, void, void, void, void, void))sub_247704504);
}

void sub_247706970(void (*a1)(void *), uint64_t a2)
{
  sub_247704CC8(a1, a2, *(void (**)(void *__return_ptr))(v2 + 16));
}

uint64_t sub_24770697C(uint64_t a1)
{
  return sub_247706C4C(a1, (uint64_t (*)(void, void, void, void, void, void))sub_2477032E4);
}

uint64_t sub_247706998()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2477069D8(void (*a1)(void **), uint64_t a2)
{
  sub_247703184(a1, a2, *(void (**)(void **__return_ptr, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_2477069E8(uint64_t a1)
{
  return sub_247706C4C(a1, (uint64_t (*)(void, void, void, void, void, void))sub_24770369C);
}

uint64_t objectdestroy_107Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_247706A48(void (*a1)(void **), uint64_t a2)
{
  sub_247704888(a1, a2, *(void (**)(void **__return_ptr, uint64_t *))(v2 + 16), *(void *)(v2 + 24), (uint64_t *)(v2 + 32));
}

void sub_247706A58(uint64_t a1)
{
  sub_247703F14(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(id *))(v1 + 32), *(void *)(v1 + 40), MEMORY[0x263F69420], &qword_26925ECA0, (uint64_t)&unk_26FBB8F30, (uint64_t)sub_247705234);
}

uint64_t sub_247706ABC(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(unsigned char *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

uint64_t sub_247706B04()
{
  return objectdestroy_2Tm(&qword_26925ECC0);
}

uint64_t objectdestroy_2Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_release();
  return MEMORY[0x270FA0238](v1, v7, v6);
}

uint64_t sub_247706BB4(uint64_t a1, uint64_t a2)
{
  return sub_24770506C(a1, a2, &qword_26925ECC0, (uint64_t)&unk_26FBB8FA8, (uint64_t)sub_247706C34, sub_247702F68);
}

uint64_t objectdestroy_101Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_247706C34(uint64_t a1)
{
  return sub_247706C4C(a1, (uint64_t (*)(void, void, void, void, void, void))sub_247703480);
}

uint64_t sub_247706C4C(uint64_t a1, uint64_t (*a2)(void, void, void, void, void, void))
{
  return a2(*(void *)a1, *(unsigned __int8 *)(a1 + 8), v2[2], v2[3], v2[4], v2[5]);
}

uint64_t objectdestroy_23Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247706CB0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_247706CE0()
{
  uint64_t v1 = sub_2477092D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_247706D70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2477092D0();
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v3);
}

id sub_247706DE0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_willThrow();
  return v1;
}

uint64_t sub_247706E68(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_247706E90(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t WorkoutImageProvider.__allocating_init(healthStore:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  type metadata accessor for FitnessPlusSessionProvider();
  swift_allocObject();
  id v3 = a1;
  *(void *)(v2 + 24) = FitnessPlusSessionProvider.init(healthStore:)(v3);
  type metadata accessor for AppIconImageProvider();
  uint64_t v4 = swift_allocObject();
  unint64_t v5 = sub_2476F47C0(MEMORY[0x263F8EE78]);

  *(void *)(v4 + 16) = v5;
  *(void *)(v2 + 16) = v4;
  return v2;
}

uint64_t WorkoutImageProvider.init(healthStore:)(void *a1)
{
  uint64_t v2 = v1;
  type metadata accessor for FitnessPlusSessionProvider();
  swift_allocObject();
  id v4 = a1;
  *(void *)(v2 + 24) = FitnessPlusSessionProvider.init(healthStore:)(v4);
  type metadata accessor for AppIconImageProvider();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2476F47C0(MEMORY[0x263F8EE78]);

  *(void *)(v2 + 16) = v5;
  return v2;
}

uint64_t WorkoutImageProvider.__allocating_init(fitnessPlusWorkoutProvider:appIconImageProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t WorkoutImageProvider.init(fitnessPlusWorkoutProvider:appIconImageProvider:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = a1;
  return v2;
}

uint64_t sub_247707054(uint64_t a1, double a2)
{
  *(void *)(v3 + 40) = v2;
  *(double *)(v3 + 32) = a2;
  *(void *)(v3 + 24) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B130610);
  *(void *)(v3 + 48) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2477070F0, 0, 0);
}

uint64_t sub_2477070F0()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  id v4 = (void *)v0[3];
  uint64_t v5 = sub_2477097C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v1, 1, 1, v5);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v2;
  v6[5] = v4;
  v6[6] = v3;
  swift_retain();
  id v7 = v4;
  uint64_t v8 = sub_2476F64BC(v1, (uint64_t)&unk_26925ECE0, (uint64_t)v6);
  v0[7] = v8;
  id v9 = (void *)swift_task_alloc();
  v0[8] = v9;
  unint64_t v10 = sub_24770856C();
  *id v9 = v0;
  v9[1] = sub_247707250;
  return MEMORY[0x270FA1FD0](v0 + 2, v8, v10);
}

uint64_t sub_247707250()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24770734C, 0, 0);
}

uint64_t sub_24770734C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2477073BC(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(double *)(v6 + 32) = a2;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a6;
  return MEMORY[0x270FA2498](sub_2477073E0, 0, 0);
}

uint64_t sub_2477073E0()
{
  uint64_t v1 = *(id **)(v0 + 16);
  *uint64_t v1 = sub_247707FB4(*(void **)(v0 + 24), *(double *)(v0 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_247707448(void *a1, void (*a2)(id, void), uint64_t a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B130610);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (HKWorkout.isFitnessPlusWorkout.getter())
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a2;
    *(void *)(v13 + 24) = a3;
    swift_retain();
    swift_retain();
    sub_2476FEC54(a1, (uint64_t)sub_247708758, v13, a4);
    swift_release();
    swift_release();
    return;
  }
  if (!objc_msgSend(a1, sel_fiui_isConnectedGymWorkout)
    || (id v14 = objc_msgSend(a1, sel_device)) == 0)
  {
LABEL_13:
    id v19 = objc_msgSend(a1, sel_sourceRevision);
    id v20 = objc_msgSend(v19, sel_source);

    unsigned int v21 = objc_msgSend(v20, sel__hasFirstPartyBundleID);
    id v22 = objc_msgSend(a1, sel_sourceRevision);
    id v23 = objc_msgSend(v22, sel_source);

    if (v21)
    {
      unsigned __int8 v24 = objc_msgSend(v23, sel__isAppleWatch);

      if ((v24 & 1) != 0 || objc_msgSend(a1, sel__isWatchWorkout))
      {
        v45[0] = sub_247707FB4(a1, a4);
        a2(v45[0], 0);
        goto LABEL_17;
      }
      uint64_t v41 = *(void *)(v5 + 16);
      uint64_t v42 = sub_2477097C0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v12, 1, 1, v42);
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = 0;
      *(void *)(v35 + 24) = 0;
      *(void *)(v35 + 32) = v41;
      *(void *)(v35 + 40) = 0xD000000000000010;
      *(void *)(v35 + 48) = 0x800000024770B6E0;
      *(unsigned char *)(v35 + 56) = 0;
      *(double *)(v35 + 64) = a4;
      *(void *)(v35 + 72) = a2;
      *(void *)(v35 + 80) = a3;
      swift_retain_n();
      swift_retain();
      uint64_t v36 = &unk_26925ECF0;
    }
    else
    {
      id v26 = objc_msgSend(v23, sel_bundleIdentifier);

      uint64_t v27 = (void *)sub_2477096E0();
      uint64_t v29 = v28;

      id v30 = objc_msgSend(self, sel_hiddenApplications);
      sub_2477097F0();
      unint64_t v31 = sub_247709740();

      MEMORY[0x270FA5388](v32);
      v45[-2] = v27;
      v45[-1] = v29;
      LOBYTE(v30) = sub_247707B80(sub_2477085AC, (uint64_t)&v45[-4], v31);
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0)
      {
        uint64_t v37 = *(void *)(v5 + 16);
        swift_retain();
        id v38 = objc_msgSend(a1, sel_sourceRevision);
        id v39 = objc_msgSend(v38, sel_source);

        LOBYTE(v38) = objc_msgSend(v39, sel__isAppleWatch);
        if (v38) {
          unsigned __int8 v40 = 1;
        }
        else {
          unsigned __int8 v40 = objc_msgSend(a1, sel__isWatchWorkout);
        }
        uint64_t v43 = sub_2477097C0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v12, 1, 1, v43);
        uint64_t v44 = swift_allocObject();
        *(void *)(v44 + 16) = 0;
        *(void *)(v44 + 24) = 0;
        *(void *)(v44 + 32) = v37;
        *(void *)(v44 + 40) = v27;
        *(void *)(v44 + 48) = v29;
        *(unsigned char *)(v44 + 56) = v40;
        *(double *)(v44 + 64) = a4;
        *(void *)(v44 + 72) = a2;
        *(void *)(v44 + 80) = a3;
        swift_retain();
        swift_retain();
        swift_bridgeObjectRetain();
        sub_2476F6310((uint64_t)v12, (uint64_t)&unk_26925EA88, v44);
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      swift_bridgeObjectRelease();
      uint64_t v33 = *(void *)(v5 + 16);
      uint64_t v34 = sub_2477097C0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v12, 1, 1, v34);
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = 0;
      *(void *)(v35 + 24) = 0;
      *(void *)(v35 + 32) = v33;
      *(void *)(v35 + 40) = 0xD000000000000010;
      *(void *)(v35 + 48) = 0x800000024770B6E0;
      *(unsigned char *)(v35 + 56) = 0;
      *(double *)(v35 + 64) = a4;
      *(void *)(v35 + 72) = a2;
      *(void *)(v35 + 80) = a3;
      swift_retain_n();
      swift_retain();
      uint64_t v36 = &unk_26925ECE8;
    }
    sub_2476F6310((uint64_t)v12, (uint64_t)v36, v35);
LABEL_28:
    swift_release();
    swift_release();
    return;
  }
  uint64_t v15 = v14;
  if (a4 <= 60.0) {
    double v16 = a4;
  }
  else {
    double v16 = 60.0;
  }
  id v17 = objc_msgSend(self, sel_iconForConnectedGymDevice_preferredIconWidth_, v14, v16);
  if (!v17)
  {

    goto LABEL_13;
  }
  id v18 = v17;
  v45[0] = v17;
  a2(v18, 0);

LABEL_17:
  id v25 = v45[0];
}

uint64_t sub_247707AD8(id *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(*a1, sel_bundleIdentifier);
  uint64_t v6 = sub_2477096E0();
  uint64_t v8 = v7;

  if (v6 == a2 && v8 == a3) {
    char v10 = 1;
  }
  else {
    char v10 = sub_247709990();
  }
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_247707B80(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_247709920())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C55A6C0](v6 - 4, a3) : *(id *)(a3 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v15 = v7;
      char v10 = a1(&v15);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v12 & 1;
      }
      char v11 = v10;

      if (v11)
      {
        swift_bridgeObjectRelease();
        char v12 = 1;
        return v12 & 1;
      }
      ++v6;
      if (v9 == v5) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  char v12 = 0;
  return v12 & 1;
}

uint64_t sub_247707CB8(uint64_t a1, double a2)
{
  *(void *)(v3 + 40) = v2;
  *(double *)(v3 + 32) = a2;
  *(void *)(v3 + 24) = a1;
  return MEMORY[0x270FA2498](sub_247707CE0, 0, 0);
}

uint64_t sub_247707CE0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = v1;
  _OWORD v4[3] = v3;
  v4[4] = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  unint64_t v6 = sub_24770856C();
  *uint64_t v5 = v0;
  v5[1] = sub_247701104;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000016, 0x800000024770BA70, sub_247708784, v4, v6);
}

uint64_t sub_247707DF4(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  sub_247707448(a4, (void (*)(id, void))sub_247706318, v11, a2);
  return swift_release();
}

uint64_t WorkoutImageProvider.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t WorkoutImageProvider.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

id sub_247707FB4(void *a1, double a2)
{
  id v4 = objc_msgSend(self, sel_effectiveActivityTypeWithWorkout_, a1);
  id v5 = sub_2476F3F3C(a1);
  id result = (id)FIUIStaticWorkoutIconImage();
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v7 = result;
  id v8 = objc_msgSend(result, sel_imageWithRenderingMode_, 2);

  id result = objc_msgSend(v5, sel_nonGradientTextColor);
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v9 = result;
  id v10 = objc_msgSend(v8, sel_imageWithTintColor_, result);

  objc_msgSend(a1, sel_fiui_completionFactor);
  double v12 = v11;
  id v13 = sub_2476F3F3C(a1);
  uint64_t v32 = v5;
  if ((sub_2476F2D68() & 1) != 0
    || sub_2476F281C()
    || (sub_2476F2D74() & 1) != 0
    || objc_msgSend(a1, sel_workoutActivityType) == (id)84)
  {
    id v14 = objc_msgSend(v13, sel_gradientDarkColor);
    id v15 = objc_msgSend(v13, sel_gradientLightColor);
    id v16 = (id)FIUICircularGradientImage();

LABEL_8:
    double v17 = (a2 - a2) * 0.5;
    double v18 = (a2 - a2 * 0.583333333) * 0.5;
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827A0]), sel_initWithSize_, a2, a2);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v16;
    *(double *)(v20 + 24) = v17;
    *(double *)(v20 + 32) = v17;
    *(double *)(v20 + 40) = a2;
    *(double *)(v20 + 48) = a2;
    *(void *)(v20 + 56) = v10;
    *(double *)(v20 + 64) = v18;
    *(double *)(v20 + 72) = v18;
    *(double *)(v20 + 80) = a2 * 0.583333333;
    *(double *)(v20 + 88) = a2 * 0.583333333;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = sub_247708C34;
    *(void *)(v21 + 24) = v20;
    aBlock[4] = sub_247708CC8;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247706E90;
    aBlock[3] = &block_descriptor_1;
    id v22 = _Block_copy(aBlock);
    id v23 = v16;
    id v24 = v10;
    swift_retain();
    swift_release();
    id v25 = objc_msgSend(v19, sel_imageWithActions_, v22);

    _Block_release(v22);
    LOBYTE(v24) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    id result = (id)swift_release();
    if ((v24 & 1) == 0) {
      return v25;
    }
    __break(1u);
    goto LABEL_16;
  }
  if (!objc_msgSend(a1, sel__goalType))
  {
    id v16 = (id)FIUICircularWorkoutGradientImage();
    goto LABEL_8;
  }
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F23968]), sel_initWithNumberOfRings_, 1);
  *(float *)&double v27 = v12;
  objc_msgSend(v26, sel_setPercentage_ofRingAtIndex_animated_, 0, 0, v27);
  *(float *)&double v28 = a2;
  objc_msgSend(v26, sel_setGroupDiameter_, v28);
  double v29 = a2 * 0.105769231;
  *(float *)&double v29 = a2 * 0.105769231;
  objc_msgSend(v26, sel_setThickness_, v29);
  id result = objc_msgSend(v13, sel_gradientDarkColor);
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v30 = result;
  id result = objc_msgSend(v13, sel_gradientLightColor);
  if (result)
  {
    unint64_t v31 = result;
    objc_msgSend(v26, sel_setTopColor_bottomColor_ofRingAtIndex_, v30, result, 0);

    id v16 = objc_msgSend(self, sel_renderRingGroup_withRenderer_, v26, 0);
    goto LABEL_8;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_247708464()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2477084AC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 48);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[4] = v5;
  v6[2] = a1;
  v6[3] = v4;
  v6[1] = sub_2476FE07C;
  return MEMORY[0x270FA2498](sub_2477073E0, 0, 0);
}

unint64_t sub_24770856C()
{
  unint64_t result = qword_26B130628;
  if (!qword_26B130628)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B130628);
  }
  return result;
}

uint64_t sub_2477085AC(id *a1)
{
  return sub_247707AD8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_2477085D0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  char v9 = *(unsigned char *)(v1 + 56);
  double v10 = *(double *)(v1 + 64);
  uint64_t v11 = *(void *)(v1 + 72);
  double v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_2476FE07C;
  return sub_2476F5C00(v10, a1, v4, v5, v6, v7, v8, v9, v11);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_247708720()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247708758(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(a1, a2 & 1);
}

uint64_t sub_247708784(uint64_t a1)
{
  return sub_247707DF4(a1, *(double *)(v1 + 32), *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t type metadata accessor for WorkoutImageProvider()
{
  return self;
}

uint64_t method lookup function for WorkoutImageProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WorkoutImageProvider);
}

uint64_t dispatch thunk of WorkoutImageProvider.__allocating_init(healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of WorkoutImageProvider.__allocating_init(fitnessPlusWorkoutProvider:appIconImageProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of WorkoutImageProvider.placeholderImage(for:width:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of WorkoutImageProvider.placeholderImage(for:width:)(uint64_t a1, double a2)
{
  char v9 = (uint64_t (*)(uint64_t, __n128))(*(void *)(*(void *)v2 + 168) + **(int **)(*(void *)v2 + 168));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24770892C;
  v7.n128_f64[0] = a2;
  return v9(a1, v7);
}

uint64_t sub_24770892C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of WorkoutImageProvider.fetchImage(for:width:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of WorkoutImageProvider.fetchImage(for:width:)(uint64_t a1, double a2)
{
  char v9 = (uint64_t (*)(uint64_t, __n128))(*(void *)(*(void *)v2 + 184) + **(int **)(*(void *)v2 + 184));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_2476FB488;
  v7.n128_f64[0] = a2;
  return v9(a1, v7);
}

uint64_t sub_247708B60()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B130608);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_247708BF4()
{
  return MEMORY[0x270FA0238](v0, 96, 7);
}

id sub_247708C34()
{
  uint64_t v1 = *(void **)(v0 + 56);
  double v2 = *(double *)(v0 + 64);
  double v3 = *(double *)(v0 + 72);
  double v4 = *(double *)(v0 + 80);
  double v5 = *(double *)(v0 + 88);
  objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
  return objc_msgSend(v1, sel_drawInRect_blendMode_alpha_, 0, v2, v3, v4, v5, 1.0);
}

uint64_t sub_247708CB8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247708CC8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void sub_247708D08()
{
  qword_26925ED10 = 0x7974697669746341;
  *(void *)algn_26925ED18 = 0xE800000000000000;
}

uint64_t static ActivityAccessibilityIdentifier.base.getter()
{
  return sub_2476F245C(&qword_26925EA00, &qword_26925ED10);
}

uint64_t sub_247708D54()
{
  if (qword_26925EA00 != -1) {
    uint64_t result = swift_once();
  }
  qword_26925ED20 = 0xD000000000000014;
  *(void *)algn_26925ED28 = 0x800000024770BB20;
  return result;
}

uint64_t static ActivityAccessibilityIdentifier.LandingView.base.getter()
{
  return sub_2476F245C(&qword_26925EA08, &qword_26925ED20);
}

uint64_t sub_247708DE4()
{
  sub_2477098D0();
  if (qword_26925EA00 != -1) {
    swift_once();
  }
  uint64_t result = swift_bridgeObjectRelease();
  qword_26925ED30 = 0xD00000000000001ALL;
  *(void *)algn_26925ED38 = 0x800000024770BB00;
  return result;
}

uint64_t static ActivityAccessibilityIdentifier.MetricGraphicView.base.getter()
{
  return sub_2476F245C(&qword_26925EA10, &qword_26925ED30);
}

uint64_t sub_247708EA4(uint64_t a1)
{
  return sub_247708F5C(a1, 0x65766F6D2ELL, 0xE500000000000000, &qword_26925ED40, &qword_26925ED48);
}

uint64_t static ActivityAccessibilityIdentifier.MetricGraphicView.move.getter()
{
  return sub_2476F245C(&qword_26925EA18, &qword_26925ED40);
}

uint64_t sub_247708EEC(uint64_t a1)
{
  return sub_247708F5C(a1, 0x736963726578652ELL, 0xE900000000000065, &qword_26925ED50, &qword_26925ED58);
}

uint64_t static ActivityAccessibilityIdentifier.MetricGraphicView.exercise.getter()
{
  return sub_2476F245C(&qword_26925EA20, &qword_26925ED50);
}

uint64_t sub_247708F3C(uint64_t a1)
{
  return sub_247708F5C(a1, 0x646E6174732ELL, 0xE600000000000000, &qword_26925ED60, &qword_26925ED68);
}

uint64_t sub_247708F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  if (qword_26925EA10 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_26925ED30;
  uint64_t v9 = *(void *)algn_26925ED38;
  swift_bridgeObjectRetain();
  uint64_t result = sub_247709710();
  *a4 = v8;
  *a5 = v9;
  return result;
}

uint64_t static ActivityAccessibilityIdentifier.MetricGraphicView.stand.getter()
{
  return sub_2476F245C(&qword_26925EA28, &qword_26925ED60);
}

uint64_t static ActivityAccessibilityIdentifier.build(_:)()
{
  return sub_2477096B0();
}

ValueMetadata *type metadata accessor for ActivityAccessibilityIdentifier()
{
  return &type metadata for ActivityAccessibilityIdentifier;
}

ValueMetadata *type metadata accessor for ActivityAccessibilityIdentifier.LandingView()
{
  return &type metadata for ActivityAccessibilityIdentifier.LandingView;
}

ValueMetadata *type metadata accessor for ActivityAccessibilityIdentifier.MetricGraphicView()
{
  return &type metadata for ActivityAccessibilityIdentifier.MetricGraphicView;
}

uint64_t Error.logOutput.getter()
{
  return 0;
}

uint64_t sub_2477090F0()
{
  uint64_t v0 = sub_247709620();
  __swift_allocate_value_buffer(v0, qword_26925ED80);
  __swift_project_value_buffer(v0, (uint64_t)qword_26925ED80);
  return sub_247709610();
}

uint64_t sub_247709168(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
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

uint64_t sub_2477091E0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2477091F0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_247709200()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_247709210()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_247709220()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_247709230()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_247709240()
{
  return MEMORY[0x270F5ECF0]();
}

uint64_t sub_247709250()
{
  return MEMORY[0x270F621A0]();
}

uint64_t sub_247709260()
{
  return MEMORY[0x270F5F1B0]();
}

uint64_t sub_247709270()
{
  return MEMORY[0x270F5F1B8]();
}

uint64_t sub_247709280()
{
  return MEMORY[0x270F5F1C8]();
}

uint64_t sub_247709290()
{
  return MEMORY[0x270F5F398]();
}

uint64_t sub_2477092A0()
{
  return MEMORY[0x270F5F3B8]();
}

uint64_t sub_2477092B0()
{
  return MEMORY[0x270F5F400]();
}

uint64_t sub_2477092C0()
{
  return MEMORY[0x270F5F498]();
}

uint64_t sub_2477092D0()
{
  return MEMORY[0x270F5F4A0]();
}

uint64_t sub_2477092E0()
{
  return MEMORY[0x270F5F6B0]();
}

uint64_t sub_2477092F0()
{
  return MEMORY[0x270F5F6C8]();
}

uint64_t sub_247709300()
{
  return MEMORY[0x270F5F848]();
}

uint64_t sub_247709310()
{
  return MEMORY[0x270F5F868]();
}

uint64_t sub_247709320()
{
  return MEMORY[0x270F5FF10]();
}

uint64_t sub_247709330()
{
  return MEMORY[0x270F5FF18]();
}

uint64_t sub_247709340()
{
  return MEMORY[0x270F606B0]();
}

uint64_t sub_247709350()
{
  return MEMORY[0x270F606D8]();
}

uint64_t sub_247709360()
{
  return MEMORY[0x270F60C68]();
}

uint64_t sub_247709370()
{
  return MEMORY[0x270F60C70]();
}

uint64_t sub_247709380()
{
  return MEMORY[0x270F60C78]();
}

uint64_t sub_247709390()
{
  return MEMORY[0x270F60E28]();
}

uint64_t sub_2477093A0()
{
  return MEMORY[0x270F60E50]();
}

uint64_t sub_2477093B0()
{
  return MEMORY[0x270F61270]();
}

uint64_t sub_2477093C0()
{
  return MEMORY[0x270F61280]();
}

uint64_t sub_2477093D0()
{
  return MEMORY[0x270F61D50]();
}

uint64_t sub_2477093E0()
{
  return MEMORY[0x270F5D358]();
}

uint64_t sub_2477093F0()
{
  return MEMORY[0x270F61D58]();
}

uint64_t sub_247709400()
{
  return MEMORY[0x270F61D60]();
}

uint64_t sub_247709410()
{
  return MEMORY[0x270F61D68]();
}

uint64_t sub_247709420()
{
  return MEMORY[0x270F61D70]();
}

uint64_t sub_247709430()
{
  return MEMORY[0x270F61E50]();
}

uint64_t sub_247709440()
{
  return MEMORY[0x270F61E78]();
}

uint64_t sub_247709450()
{
  return MEMORY[0x270F61E90]();
}

uint64_t sub_247709460()
{
  return MEMORY[0x270F86AE8]();
}

uint64_t sub_247709470()
{
  return MEMORY[0x270F86AF0]();
}

uint64_t sub_247709480()
{
  return MEMORY[0x270F86BE0]();
}

uint64_t sub_247709490()
{
  return MEMORY[0x270F86C28]();
}

uint64_t sub_2477094A0()
{
  return MEMORY[0x270F86C40]();
}

uint64_t sub_2477094B0()
{
  return MEMORY[0x270F86CD0]();
}

uint64_t sub_2477094C0()
{
  return MEMORY[0x270F86CD8]();
}

uint64_t sub_2477094D0()
{
  return MEMORY[0x270F86FF0]();
}

uint64_t sub_2477094E0()
{
  return MEMORY[0x270F62298]();
}

uint64_t sub_2477094F0()
{
  return MEMORY[0x270F622A0]();
}

uint64_t sub_247709500()
{
  return MEMORY[0x270F622C0]();
}

uint64_t sub_247709510()
{
  return MEMORY[0x270F62530]();
}

uint64_t sub_247709520()
{
  return MEMORY[0x270F62538]();
}

uint64_t sub_247709530()
{
  return MEMORY[0x270F62590]();
}

uint64_t sub_247709540()
{
  return MEMORY[0x270F62598]();
}

uint64_t sub_247709550()
{
  return MEMORY[0x270F625E8]();
}

uint64_t sub_247709560()
{
  return MEMORY[0x270F62648]();
}

uint64_t sub_247709570()
{
  return MEMORY[0x270F62650]();
}

uint64_t sub_247709580()
{
  return MEMORY[0x270F62658]();
}

uint64_t sub_247709590()
{
  return MEMORY[0x270F5DAC0]();
}

uint64_t sub_2477095A0()
{
  return MEMORY[0x270F5DB68]();
}

uint64_t sub_2477095B0()
{
  return MEMORY[0x270F5DBB8]();
}

uint64_t sub_2477095C0()
{
  return MEMORY[0x270F5DF58]();
}

uint64_t sub_2477095D0()
{
  return MEMORY[0x270F5DF60]();
}

uint64_t sub_2477095E0()
{
  return MEMORY[0x270F5E010]();
}

uint64_t sub_2477095F0()
{
  return MEMORY[0x270F5E1C8]();
}

uint64_t sub_247709600()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247709610()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247709620()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247709630()
{
  return MEMORY[0x270FA0998]();
}

uint64_t sub_247709640()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_247709650()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_247709660()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_247709670()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_247709680()
{
  return MEMORY[0x270F62D00]();
}

uint64_t sub_247709690()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2477096A0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2477096B0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2477096C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2477096D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2477096E0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247709700()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247709710()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247709720()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247709730()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_247709740()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_247709750()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_247709760()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_247709770()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_247709780()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_247709790()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2477097A0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2477097B0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2477097C0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2477097F0()
{
  return MEMORY[0x270F0CCA0]();
}

uint64_t sub_247709800()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247709810()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_247709820()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_247709830()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_247709840()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_247709850()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_247709860()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_247709870()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_247709880()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_247709890()
{
  return MEMORY[0x270F62148]();
}

uint64_t sub_2477098A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2477098B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2477098C0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2477098D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2477098E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2477098F0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_247709900()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247709910()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247709920()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_247709930()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247709940()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247709950()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247709960()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247709980()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_247709990()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2477099B0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2477099C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2477099D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2477099E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2477099F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_247709A00()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247709A10()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247709A20()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247709A30()
{
  return MEMORY[0x270FA0128]();
}

uint64_t FIUICircularGradientImage()
{
  return MEMORY[0x270F2CC08]();
}

uint64_t FIUICircularWorkoutGradientImage()
{
  return MEMORY[0x270F2CC10]();
}

uint64_t FIUIStaticWorkoutIconImage()
{
  return MEMORY[0x270F2CCA8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}