void sub_25275D1F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

double HUDefaultSizeForIconSize(uint64_t a1)
{
  double result = 16.0;
  switch(a1)
  {
    case 0:
    case 2:
      double result = 24.0;
      break;
    case 3:
      double v2 = 32.0;
      goto LABEL_5;
    case 4:
      double v2 = 48.0;
LABEL_5:
      double result = v2;
      break;
    case 5:
      double result = *MEMORY[0x263F1D7C8];
      break;
    default:
      return result;
  }
  return result;
}

void sub_252760F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25276126C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2527612B8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_252761318()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_252761364(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2527613B8())()
{
  return j__swift_endAccess;
}

uint64_t ScheduleRuleList.rules.getter()
{
  return swift_bridgeObjectRetain();
}

void *ScheduleRuleList.__allocating_init(rules:)(uint64_t a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  v2[4] = a1;
  if (*(void *)(a1 + 16))
  {
    type metadata accessor for ScheduleRuleDisplayInfo();
    uint64_t v3 = sub_252761564();
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0xE000000000000000;
  }
  v2[2] = v3;
  v2[3] = v4;
  return v2;
}

void *ScheduleRuleList.init(rules:)(uint64_t a1)
{
  v1[4] = a1;
  if (*(void *)(a1 + 16))
  {
    type metadata accessor for ScheduleRuleDisplayInfo();
    uint64_t v2 = sub_252761564();
  }
  else
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0xE000000000000000;
  }
  v1[2] = v2;
  v1[3] = v3;
  return v1;
}

uint64_t sub_252761564()
{
  uint64_t v0 = (void *)sub_2527726B0();
  id v1 = (id)HFLocalizedString();

  uint64_t v2 = sub_2527726C0();
  return v2;
}

uint64_t type metadata accessor for ScheduleRuleDisplayInfo()
{
  uint64_t result = qword_269C1C0E8;
  if (!qword_269C1C0E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ScheduleRuleList.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ScheduleRuleList.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2527616C8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ScheduleRuleList();
  uint64_t result = sub_2527723A0();
  *a1 = result;
  return result;
}

uint64_t ScheduleRuleDisplayInfo.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_252772300();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t ScheduleRuleDisplayInfo.id.setter(uint64_t a1)
{
  uint64_t v3 = sub_252772300();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*ScheduleRuleDisplayInfo.id.modify())()
{
  return CGSizeMake;
}

uint64_t ScheduleRuleDisplayInfo.type.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for ScheduleRuleDisplayInfo();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t ScheduleRuleDisplayInfo.primaryText.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ScheduleRuleDisplayInfo() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScheduleRuleDisplayInfo.secondaryText.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ScheduleRuleDisplayInfo() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

int *ScheduleRuleDisplayInfo.init(id:type:primaryText:secondaryText:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v13 = *a2;
  uint64_t v14 = sub_252772300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(a7, a1, v14);
  uint64_t result = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  *(unsigned char *)(a7 + result[5]) = v13;
  v16 = (void *)(a7 + result[6]);
  void *v16 = a3;
  v16[1] = a4;
  v17 = (void *)(a7 + result[7]);
  void *v17 = a5;
  v17[1] = a6;
  return result;
}

BOOL static ScheduleRuleDisplayInfo.ScheduleType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ScheduleRuleDisplayInfo.ScheduleType.hash(into:)()
{
  return sub_252772940();
}

uint64_t ScheduleRuleDisplayInfo.ScheduleType.hashValue.getter()
{
  return sub_252772960();
}

BOOL sub_2527619E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2527619FC()
{
  return sub_252772960();
}

uint64_t sub_252761A44()
{
  return sub_252772940();
}

uint64_t sub_252761A70()
{
  return sub_252772960();
}

uint64_t ScheduleRuleDisplayInfo.hash(into:)()
{
  sub_252772300();
  sub_252762078(&qword_269C1C0C8, MEMORY[0x263F07508]);
  sub_2527726A0();
  uint64_t v1 = type metadata accessor for ScheduleRuleDisplayInfo();
  sub_252772940();
  swift_bridgeObjectRetain();
  sub_2527726D0();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + *(int *)(v1 + 28) + 8)) {
    return sub_252772950();
  }
  sub_252772950();
  swift_bridgeObjectRetain();
  sub_2527726D0();
  return swift_bridgeObjectRelease();
}

uint64_t ScheduleRuleDisplayInfo.hashValue.getter()
{
  sub_252772930();
  sub_252772300();
  sub_252762078(&qword_269C1C0C8, MEMORY[0x263F07508]);
  sub_2527726A0();
  uint64_t v1 = type metadata accessor for ScheduleRuleDisplayInfo();
  sub_252772940();
  swift_bridgeObjectRetain();
  sub_2527726D0();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + *(int *)(v1 + 28) + 8))
  {
    sub_252772950();
    swift_bridgeObjectRetain();
    sub_2527726D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252772950();
  }
  return sub_252772960();
}

uint64_t sub_252761D1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_252772300();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_252761D8C(uint64_t a1, uint64_t a2)
{
  sub_252772930();
  sub_252772300();
  sub_252762078(&qword_269C1C0C8, MEMORY[0x263F07508]);
  sub_2527726A0();
  sub_252772940();
  swift_bridgeObjectRetain();
  sub_2527726D0();
  swift_bridgeObjectRelease();
  if (*(void *)(v2 + *(int *)(a2 + 28) + 8))
  {
    sub_252772950();
    swift_bridgeObjectRetain();
    sub_2527726D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252772950();
  }
  return sub_252772960();
}

uint64_t _s12HomeUICommon23ScheduleRuleDisplayInfoV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_2527722D0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for ScheduleRuleDisplayInfo();
  if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) != *(unsigned __int8 *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(int *)(v4 + 24);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  v9 = (void *)(a2 + v6);
  BOOL v10 = v7 == *v9 && v8 == v9[1];
  if (v10 || (v11 = sub_252772920(), uint64_t result = 0, (v11 & 1) != 0))
  {
    uint64_t v13 = *(int *)(v5 + 28);
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = *(void *)(a1 + v13 + 8);
    v16 = (void *)(a2 + v13);
    uint64_t v17 = v16[1];
    if (v15)
    {
      if (v17)
      {
        BOOL v18 = *v14 == *v16 && v15 == v17;
        if (v18 || (sub_252772920() & 1) != 0) {
          return 1;
        }
      }
    }
    else if (!v17)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_252761F84()
{
  return MEMORY[0x263EFDDD8];
}

unint64_t sub_252761F94()
{
  unint64_t result = qword_269C1C0D0;
  if (!qword_269C1C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C0D0);
  }
  return result;
}

uint64_t sub_252761FE8()
{
  return sub_252762078(&qword_269C1C0C8, MEMORY[0x263F07508]);
}

uint64_t sub_252762030()
{
  return sub_252762078((unint64_t *)&unk_269C1C0D8, (void (*)(uint64_t))type metadata accessor for ScheduleRuleDisplayInfo);
}

uint64_t sub_252762078(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ScheduleRuleList()
{
  return self;
}

uint64_t method lookup function for ScheduleRuleList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ScheduleRuleList);
}

uint64_t dispatch thunk of ScheduleRuleList.title.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ScheduleRuleList.title.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ScheduleRuleList.title.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ScheduleRuleList.__allocating_init(rules:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

void *initializeBufferWithCopyOfBuffer for ScheduleRuleDisplayInfo(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_252772300();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    v9 = (void *)((char *)a1 + v8);
    BOOL v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    void *v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = (void *)((char *)a1 + v12);
    uint64_t v14 = (void *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ScheduleRuleDisplayInfo(uint64_t a1)
{
  uint64_t v2 = sub_252772300();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252772300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252772300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252772300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252772300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2527625D4);
}

uint64_t sub_2527625D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252772300();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2527626AC);
}

uint64_t sub_2527626AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_252772300();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25276276C()
{
  uint64_t result = sub_252772300();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ScheduleRuleDisplayInfo.ScheduleType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ScheduleRuleDisplayInfo.ScheduleType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x252762980);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_2527629A8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2527629B0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScheduleRuleDisplayInfo.ScheduleType()
{
  return &type metadata for ScheduleRuleDisplayInfo.ScheduleType;
}

void type metadata accessor for HUIconSize()
{
  if (!qword_269C1C0F8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269C1C0F8);
    }
  }
}

uint64_t SwiftUICanary.body.getter@<X0>(uint64_t a1@<X8>)
{
  sub_252772410();
  uint64_t result = sub_2527725B0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_252762A9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_252762AC0()
{
  return sub_2527725F0();
}

uint64_t sub_252762ADC@<X0>(uint64_t a1@<X8>)
{
  sub_252772410();
  uint64_t result = sub_2527725B0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

ValueMetadata *type metadata accessor for SwiftUICanary()
{
  return &type metadata for SwiftUICanary;
}

uint64_t sub_252762B64()
{
  return MEMORY[0x263F1A820];
}

HomeUICommon::IconViewStyling_optional __swiftcall IconViewStyling.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *uint64_t v1 = v2;
  return (HomeUICommon::IconViewStyling_optional)rawValue;
}

uint64_t IconViewStyling.rawValue.getter()
{
  return *v0;
}

BOOL sub_252762B94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void *sub_252762BAC@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_252762BCC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t IconViewWrapper.init(iconDescriptor:iconSize:styling:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v4 = *a3;
  *(void *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = v4;
  return result;
}

uint64_t IconViewWrapper.iconDescriptor.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t IconViewWrapper.iconDescriptor.setter(uint64_t a1)
{
  uint64_t result = swift_unknownObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*IconViewWrapper.iconDescriptor.modify())()
{
  return CGSizeMake;
}

uint64_t IconViewWrapper.iconSize.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t IconViewWrapper.iconSize.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*IconViewWrapper.iconSize.modify())()
{
  return CGSizeMake;
}

void IconViewWrapper.appearanceStyling.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *IconViewWrapper.appearanceStyling.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*IconViewWrapper.appearanceStyling.modify())()
{
  return CGSizeMake;
}

id IconViewWrapper.makeUIView(context:)()
{
  uint64_t v1 = *v0;
  id v2 = objc_msgSend(objc_allocWithZone((Class)HUIconView), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_updateWithIconDescriptor_displayStyle_animated_, v1, 1, 0);
  char v3 = self;
  id v4 = v2;
  id v5 = objc_msgSend(v3, sel_whiteColor);
  objc_msgSend(v4, sel_setTintColor_, v5);

  return v4;
}

id IconViewWrapper.updateUIView(_:context:)(id a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  if (!*v1)
  {
    objc_msgSend(a1, sel_setVibrancyEffect_, 0);
    uint64_t v17 = 1;
    goto LABEL_15;
  }
  int v5 = *((unsigned __int8 *)v1 + 16);
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    BOOL v7 = (void *)v6;
    swift_unknownObjectRetain();
    id v8 = objc_msgSend(v7, sel_state);
    uint64_t v9 = sub_2527726C0();
    uint64_t v11 = v10;
    if (v9 == sub_2527726C0() && v11 == v12)
    {

      swift_bridgeObjectRelease_n();
      if (v5) {
        goto LABEL_8;
      }
    }
    else
    {
      int v14 = sub_252772920();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v14 & v5)
      {
LABEL_8:
        id v15 = objc_msgSend(self, sel_whiteColor);
        id v16 = objc_msgSend(self, sel_colorEffectMonochromeTint_blendingAmount_brightnessAdjustment_, v15, 1.0, 0.45);

        objc_msgSend(a1, sel_setVibrancyEffect_, v16);
        swift_unknownObjectRelease();

        uint64_t v17 = 2;
        goto LABEL_13;
      }
    }
    swift_unknownObjectRelease();
  }
  objc_msgSend(a1, sel_setVibrancyEffect_, 0);
  uint64_t v17 = 1;
LABEL_13:
  self;
  BOOL v18 = (void *)swift_dynamicCastObjCClass();
  if (v18) {
    objc_msgSend(v18, sel_isSystemImage);
  }
LABEL_15:
  objc_msgSend(a1, sel_setContentMode_, 1);
  objc_msgSend(a1, sel_setIconSize_, v4);
  return objc_msgSend(a1, sel_updateWithIconDescriptor_displayStyle_animated_, v3, v17, 0);
}

double IconViewWrapper.sizeThatFits(_:uiView:context:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (*(unsigned char *)(v4 + 16) == 1 && *(void *)v4 != 0)
  {
    int v8 = a4 & 1;
    int v9 = a2 & 1;
    self;
    if (swift_dynamicCastObjCClass()) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11 && v8 == 0) {
      return CGSizeMake(*(double *)&a1, *(double *)&a3 + -10.0);
    }
  }
  return result;
}

id sub_252763048()
{
  uint64_t v1 = *v0;
  id v2 = objc_msgSend(objc_allocWithZone((Class)HUIconView), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_updateWithIconDescriptor_displayStyle_animated_, v1, 1, 0);
  uint64_t v3 = self;
  id v4 = v2;
  id v5 = objc_msgSend(v3, sel_whiteColor);
  objc_msgSend(v4, sel_setTintColor_, v5);

  return v4;
}

double sub_252763114(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (*(unsigned char *)(v4 + 16) == 1 && *(void *)v4 != 0)
  {
    int v8 = a4 & 1;
    int v9 = a2 & 1;
    self;
    if (swift_dynamicCastObjCClass()) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11 && v8 == 0) {
      return CGSizeMake(*(double *)&a1, *(double *)&a3 + -10.0);
    }
  }
  return result;
}

uint64_t sub_2527631CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2527636D0();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_252763230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2527636D0();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_252763294()
{
}

unint64_t sub_2527632C0()
{
  unint64_t result = qword_269C1C220;
  if (!qword_269C1C220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C220);
  }
  return result;
}

unint64_t sub_252763318()
{
  unint64_t result = qword_269C1C228;
  if (!qword_269C1C228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C228);
  }
  return result;
}

uint64_t sub_25276336C()
{
  return MEMORY[0x263F1BB58];
}

uint64_t getEnumTagSinglePayload for IconViewStyling(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IconViewStyling(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2527634D4);
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

unsigned char *sub_2527634FC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IconViewStyling()
{
  return &type metadata for IconViewStyling;
}

uint64_t destroy for IconViewWrapper()
{
  return swift_unknownObjectRelease();
}

uint64_t _s12HomeUICommon15IconViewWrapperVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IconViewWrapper(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IconViewWrapper(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for IconViewWrapper(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17)) {
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

uint64_t storeEnumTagSinglePayload for IconViewWrapper(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IconViewWrapper()
{
  return &type metadata for IconViewWrapper;
}

unint64_t sub_2527636D0()
{
  unint64_t result = qword_269C1C290;
  if (!qword_269C1C290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C290);
  }
  return result;
}

uint64_t *sub_252763724(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    BOOL v7 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v11 = sub_252772300();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      *((unsigned char *)a1 + v7[5]) = *((unsigned char *)a2 + v7[5]);
      uint64_t v12 = v7[6];
      uint64_t v13 = (uint64_t *)((char *)a1 + v12);
      int v14 = (uint64_t *)((char *)a2 + v12);
      uint64_t v15 = v14[1];
      *uint64_t v13 = *v14;
      v13[1] = v15;
      uint64_t v16 = v7[7];
      uint64_t v17 = (uint64_t *)((char *)a1 + v16);
      BOOL v18 = (uint64_t *)((char *)a2 + v16);
      uint64_t v19 = v18[1];
      void *v17 = *v18;
      v17[1] = v19;
      v20 = *(void (**)(uint64_t *, void, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20(a1, 0, 1, v7);
    }
    uint64_t v21 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v22 = *(void **)((char *)a2 + v21);
    *(uint64_t *)((char *)a1 + v21) = (uint64_t)v22;
    swift_retain();
    id v23 = v22;
  }
  return a1;
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

void sub_252763954(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScheduleRuleDisplayInfo();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    uint64_t v5 = sub_252772300();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  unsigned int v6 = *(void **)(a1 + *(int *)(a2 + 24));
}

char *sub_252763A40(char *a1, char *a2, uint64_t a3)
{
  unsigned int v6 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2A0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_252772300();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    a1[v6[5]] = a2[v6[5]];
    uint64_t v10 = v6[6];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    uint64_t v14 = v6[7];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    BOOL v18 = *(void (**)(char *, void, uint64_t, int *))(v7 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(a1, 0, 1, v6);
  }
  uint64_t v19 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  v20 = *(void **)&a2[v19];
  *(void *)&a1[v19] = v20;
  swift_retain();
  id v21 = v20;
  return a1;
}

unsigned char *sub_252763BDC(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  unsigned int v6 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v25 = sub_252772300();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v25 - 8) + 24))(a1, a2, v25);
      a1[v6[5]] = a2[v6[5]];
      uint64_t v26 = v6[6];
      v27 = &a1[v26];
      v28 = &a2[v26];
      void *v27 = *v28;
      v27[1] = v28[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v29 = v6[7];
      v30 = &a1[v29];
      v31 = &a2[v29];
      void *v30 = *v31;
      v30[1] = v31[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_252763E70((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2A0);
    memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v11 = sub_252772300();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  a1[v6[5]] = a2[v6[5]];
  uint64_t v12 = v6[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  uint64_t v15 = v6[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  void *v16 = *v17;
  v16[1] = v17[1];
  BOOL v18 = *(void (**)(unsigned char *, void, uint64_t, int *))(v7 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_retain();
  swift_release();
  uint64_t v20 = *(int *)(a3 + 24);
  id v21 = *(void **)&a2[v20];
  v22 = *(void **)&a1[v20];
  *(void *)&a1[v20] = v21;
  id v23 = v21;

  return a1;
}

uint64_t sub_252763E70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ScheduleRuleDisplayInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_252763ECC(char *a1, char *a2, uint64_t a3)
{
  unsigned int v6 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2A0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_252772300();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    a1[v6[5]] = a2[v6[5]];
    *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
    *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
    (*(void (**)(char *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  return a1;
}

unsigned char *sub_25276403C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  unsigned int v6 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v16 = sub_252772300();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v16 - 8) + 40))(a1, a2, v16);
      a1[v6[5]] = a2[v6[5]];
      uint64_t v17 = v6[6];
      BOOL v18 = &a1[v17];
      uint64_t v19 = (uint64_t *)&a2[v17];
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      *BOOL v18 = v21;
      v18[1] = v20;
      swift_bridgeObjectRelease();
      uint64_t v22 = v6[7];
      id v23 = &a1[v22];
      v24 = (uint64_t *)&a2[v22];
      uint64_t v26 = *v24;
      uint64_t v25 = v24[1];
      *id v23 = v26;
      v23[1] = v25;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_252763E70((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2A0);
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v11 = sub_252772300();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  a1[v6[5]] = a2[v6[5]];
  *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
  *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
  (*(void (**)(unsigned char *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_release();
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = *(void **)&a1[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];

  return a1;
}

uint64_t sub_252764278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25276428C);
}

uint64_t sub_25276428C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2A0);
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

uint64_t sub_252764350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252764364);
}

uint64_t sub_252764364(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2A0);
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

uint64_t type metadata accessor for ScheduleRuleAccessListCell()
{
  uint64_t result = qword_269C1C2A8;
  if (!qword_269C1C2A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_252764470()
{
  sub_252764518();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_252764518()
{
  if (!qword_269C1C2B8)
  {
    type metadata accessor for ScheduleRuleDisplayInfo();
    unint64_t v0 = sub_252772830();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269C1C2B8);
    }
  }
}

uint64_t sub_252764570()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25276458C()
{
  uint64_t v0 = sub_252772390();
  __swift_allocate_value_buffer(v0, qword_269C1CDE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C1CDE8);
  return sub_252772350();
}

uint64_t sub_2527645D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2C8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_252772400();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2D0);
  sub_252764800(v1, (uint64_t)&v5[*(int *)(v9 + 44)]);
  unsigned __int8 v10 = sub_252772530();
  unsigned __int8 v11 = sub_252772540();
  char v12 = sub_252772560();
  sub_252772560();
  if (sub_252772560() != v10) {
    char v12 = sub_252772560();
  }
  sub_252772560();
  if (sub_252772560() != v11) {
    char v12 = sub_252772560();
  }
  if (qword_269C1C0B0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_252772390();
  __swift_project_value_buffer(v13, (uint64_t)qword_269C1CDE8);
  sub_252772370();
  sub_2527723B0();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  sub_2527655E4((uint64_t)v5, (uint64_t)v8, &qword_269C1C2C0);
  uint64_t v22 = &v8[*(int *)(v6 + 36)];
  char *v22 = v12;
  *((void *)v22 + 1) = v15;
  *((void *)v22 + 2) = v17;
  *((void *)v22 + 3) = v19;
  *((void *)v22 + 4) = v21;
  v22[40] = 0;
  sub_252765648((uint64_t)v5, &qword_269C1C2C0);
  return sub_2527656A4((uint64_t)v8, a1, &qword_269C1C2C8);
}

uint64_t sub_252764800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2D8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v45 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2E0);
  MEMORY[0x270FA5388](v9 - 8);
  unsigned __int8 v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2E8);
  uint64_t v12 = MEMORY[0x270FA5388](v47);
  uint64_t v49 = (uint64_t)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v45 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v48 = (uint64_t)&v45 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2F0);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v46 = (uint64_t)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v45 - v21;
  uint64_t v23 = sub_252772640();
  uint64_t v24 = *(void *)(a1 + *(int *)(type metadata accessor for ScheduleRuleAccessListCell() + 20));
  uint64_t v51 = v23;
  uint64_t v52 = v24;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2F8);
  sub_252765434();
  sub_252772600();
  swift_release();
  swift_release();
  *(void *)unsigned __int8 v11 = sub_2527723F0();
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  uint64_t v25 = (uint64_t)&v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C1C318) + 44)];
  *(void *)uint64_t v8 = sub_252772420();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C320);
  sub_252764CC8(a1, (uint64_t)&v8[*(int *)(v26 + 44)]);
  sub_2527655E4((uint64_t)v8, (uint64_t)v6, &qword_269C1C2D8);
  sub_2527655E4((uint64_t)v6, v25, &qword_269C1C2D8);
  uint64_t v27 = v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C1C328) + 48);
  *(void *)uint64_t v27 = 0;
  *(unsigned char *)(v27 + 8) = 1;
  sub_252765648((uint64_t)v8, &qword_269C1C2D8);
  sub_252765648((uint64_t)v6, &qword_269C1C2D8);
  LOBYTE(v25) = sub_252772550();
  char v28 = sub_252772560();
  sub_252772560();
  if (sub_252772560() != v25) {
    char v28 = sub_252772560();
  }
  if (qword_269C1C0B0 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_252772390();
  __swift_project_value_buffer(v29, (uint64_t)qword_269C1CDE8);
  sub_252772360();
  sub_2527723B0();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  sub_2527655E4((uint64_t)v11, (uint64_t)v16, &qword_269C1C2E0);
  v38 = &v16[*(int *)(v47 + 36)];
  char *v38 = v28;
  *((void *)v38 + 1) = v31;
  *((void *)v38 + 2) = v33;
  *((void *)v38 + 3) = v35;
  *((void *)v38 + 4) = v37;
  v38[40] = 0;
  sub_252765648((uint64_t)v11, &qword_269C1C2E0);
  uint64_t v39 = v48;
  sub_2527656A4((uint64_t)v16, v48, &qword_269C1C2E8);
  uint64_t v40 = v46;
  sub_2527655E4((uint64_t)v22, v46, &qword_269C1C2F0);
  uint64_t v41 = v49;
  sub_2527655E4(v39, v49, &qword_269C1C2E8);
  uint64_t v42 = v50;
  sub_2527655E4(v40, v50, &qword_269C1C2F0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C330);
  sub_2527655E4(v41, v42 + *(int *)(v43 + 48), &qword_269C1C2E8);
  sub_252765648(v39, &qword_269C1C2E8);
  sub_252765648((uint64_t)v22, &qword_269C1C2F0);
  sub_252765648(v41, &qword_269C1C2E8);
  return sub_252765648(v40, &qword_269C1C2F0);
}

uint64_t sub_252764CC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v75 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C338);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C340);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v69 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C348);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v74 = (uint64_t)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v69 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C2A0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for ScheduleRuleDisplayInfo();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2527655E4(a1, (uint64_t)v17, &qword_269C1C2A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_252765648((uint64_t)v17, &qword_269C1C2A0);
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C350);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v75, 1, 1, v22);
  }
  else
  {
    v72 = v9;
    v73 = v7;
    sub_25276551C((uint64_t)v17, (uint64_t)v21);
    uint64_t v24 = &v21[*(int *)(v18 + 24)];
    uint64_t v25 = *((void *)v24 + 1);
    uint64_t v76 = *(void *)v24;
    uint64_t v77 = v25;
    sub_252765580();
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_2527725C0();
    uint64_t v28 = v27;
    uint64_t v76 = v26;
    uint64_t v77 = v27;
    char v30 = v29 & 1;
    char v78 = v29 & 1;
    uint64_t v79 = v31;
    v71 = v14;
    sub_252772600();
    sub_2527655D4(v26, v28, v30);
    swift_bridgeObjectRelease();
    uint64_t v32 = &v21[*(int *)(v18 + 28)];
    uint64_t v33 = *((void *)v32 + 1);
    uint64_t v34 = (uint64_t)v21;
    if (v33)
    {
      v69 = v21;
      v70 = v4;
      uint64_t v76 = *(void *)v32;
      uint64_t v77 = v33;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_2527725C0();
      uint64_t v37 = v36;
      char v39 = v38 & 1;
      sub_252772570();
      uint64_t v40 = sub_2527725A0();
      uint64_t v42 = v41;
      char v44 = v43;
      swift_release();
      char v45 = v44 & 1;
      sub_2527655D4(v35, v37, v39);
      swift_bridgeObjectRelease();
      LODWORD(v76) = sub_252772520();
      uint64_t v46 = sub_252772590();
      uint64_t v48 = v47;
      char v50 = v49;
      uint64_t v52 = v51;
      sub_2527655D4(v40, v42, v45);
      swift_bridgeObjectRelease();
      char v53 = sub_252772530();
      if (qword_269C1C0B0 != -1) {
        swift_once();
      }
      uint64_t v54 = sub_252772390();
      __swift_project_value_buffer(v54, (uint64_t)qword_269C1CDE8);
      sub_252772380();
      sub_2527723B0();
      uint64_t v76 = v46;
      uint64_t v77 = v48;
      char v55 = v50 & 1;
      char v78 = v55;
      uint64_t v79 = v52;
      char v80 = v53;
      uint64_t v81 = v56;
      uint64_t v82 = v57;
      uint64_t v83 = v58;
      uint64_t v84 = v59;
      char v85 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C370);
      sub_252765708();
      uint64_t v60 = (uint64_t)v72;
      sub_252772600();
      sub_2527655D4(v46, v48, v55);
      swift_bridgeObjectRelease();
      uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C360);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v60, 0, 1, v61);
      uint64_t v62 = v75;
      uint64_t v4 = v70;
      uint64_t v63 = (uint64_t)v71;
      uint64_t v34 = (uint64_t)v69;
    }
    else
    {
      uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C360);
      uint64_t v60 = (uint64_t)v72;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v72, 1, 1, v64);
      uint64_t v63 = (uint64_t)v71;
      uint64_t v62 = v75;
    }
    uint64_t v65 = v74;
    sub_2527655E4(v63, v74, &qword_269C1C348);
    uint64_t v66 = (uint64_t)v73;
    sub_2527655E4(v60, (uint64_t)v73, &qword_269C1C340);
    sub_2527655E4(v65, (uint64_t)v4, &qword_269C1C348);
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C368);
    sub_2527655E4(v66, (uint64_t)&v4[*(int *)(v67 + 48)], &qword_269C1C340);
    sub_252765648(v60, &qword_269C1C340);
    sub_252765648(v63, &qword_269C1C348);
    sub_252763E70(v34);
    sub_252765648(v66, &qword_269C1C340);
    sub_252765648(v65, &qword_269C1C348);
    uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C350);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v4, 0, 1, v68);
    return sub_2527656A4((uint64_t)v4, v62, &qword_269C1C338);
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t sub_252765434()
{
  unint64_t result = qword_269C1C300;
  if (!qword_269C1C300)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C2F8);
    sub_252765820(&qword_269C1C308, &qword_269C1C310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C300);
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

uint64_t sub_25276551C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScheduleRuleDisplayInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_252765580()
{
  unint64_t result = qword_269C1C358;
  if (!qword_269C1C358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C358);
  }
  return result;
}

uint64_t sub_2527655D4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2527655E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_252765648(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2527656A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_252765708()
{
  unint64_t result = qword_269C1C378;
  if (!qword_269C1C378)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C378);
  }
  return result;
}

unint64_t sub_252765780()
{
  unint64_t result = qword_269C1C380;
  if (!qword_269C1C380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C2C8);
    sub_252765820(&qword_269C1C388, &qword_269C1C2C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C380);
  }
  return result;
}

uint64_t sub_252765820(unint64_t *a1, uint64_t *a2)
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

uint64_t ScheduleAccessList.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v2 = sub_252772510();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v32 = v2;
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C390);
  uint64_t v29 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C398);
  uint64_t v9 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3A0);
  MEMORY[0x270FA5388](v28);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3A8);
  uint64_t v14 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v17 = v1[1];
  long long v36 = *v1;
  long long v37 = v17;
  long long v18 = v1[3];
  long long v38 = v1[2];
  long long v39 = v18;
  uint64_t v35 = &v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3B0);
  sub_2527663C8(&qword_269C1C3B8, &qword_269C1C3B0, (void (*)(void))sub_252766314);
  sub_252772580();
  sub_252772500();
  sub_252765820(&qword_269C1C498, &qword_269C1C390);
  uint64_t v19 = v32;
  sub_252772620();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v5, v19);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v6);
  uint64_t v20 = *((void *)&v37 + 1);
  swift_retain();
  uint64_t v21 = sub_252772690();
  uint64_t v23 = v22;
  uint64_t v24 = v31;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v11, v31);
  uint64_t v25 = &v13[*(int *)(v28 + 36)];
  *(void *)uint64_t v25 = v20;
  *((void *)v25 + 1) = v21;
  *((void *)v25 + 2) = v23;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);
  sub_2527668B8();
  sub_252772610();
  sub_252765648((uint64_t)v13, &qword_269C1C3A0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v34, v16, v30);
}

uint64_t sub_252765CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C428);
  MEMORY[0x270FA5388](v35);
  uint64_t v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C418);
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v37 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ScheduleRuleDisplayInfo();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C4B8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3B0);
  MEMORY[0x270FA5388](v15 - 8);
  long long v17 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3D8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(*(void *)(a1 + 8) + 32);
  if (*(void *)(v22 + 16))
  {
    unint64_t v23 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v32[1] = v19;
    uint64_t v33 = v11;
    uint64_t v34 = type metadata accessor for ScheduleRuleDisplayInfo;
    uint64_t v24 = sub_252767930(v22 + v23, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ScheduleRuleDisplayInfo);
    v32[0] = v32;
    MEMORY[0x270FA5388](v24);
    v32[-2] = v22;
    v32[-1] = a1;
    swift_bridgeObjectRetain();
    sub_252766E84(a1, (uint64_t)v11, (uint64_t)v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C468);
    sub_252766614();
    sub_2527663C8(&qword_269C1C460, &qword_269C1C468, (void (*)(void))sub_2527667E8);
    sub_252772670();
    swift_bridgeObjectRelease();
    uint64_t v25 = v36;
    uint64_t v26 = v37;
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v14, v7, v37);
    swift_storeEnumTagMultiPayload();
    sub_2527663C8(&qword_269C1C3D0, &qword_269C1C3D8, (void (*)(void))sub_252766434);
    sub_252766554();
    sub_2527724F0();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v26);
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3C8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v17, 0, 1, v27);
    sub_2527656A4((uint64_t)v17, v38, &qword_269C1C3B0);
    return sub_252767998((uint64_t)v33, (uint64_t (*)(void))v34);
  }
  else
  {
    if (*(unsigned char *)(a1 + 40))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3F8);
      sub_2527664B4();
      sub_252772680();
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3E8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v21, 0, 1, v30);
    }
    else
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3E8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v21, 1, 1, v29);
    }
    sub_2527655E4((uint64_t)v21, (uint64_t)v14, &qword_269C1C3D8);
    swift_storeEnumTagMultiPayload();
    sub_2527663C8(&qword_269C1C3D0, &qword_269C1C3D8, (void (*)(void))sub_252766434);
    sub_252766554();
    sub_2527724F0();
    sub_252765648((uint64_t)v21, &qword_269C1C3D8);
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C3C8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v17, 0, 1, v31);
    return sub_2527656A4((uint64_t)v17, v38, &qword_269C1C3B0);
  }
}

uint64_t sub_25276630C@<X0>(uint64_t a1@<X8>)
{
  return sub_252765CB8(*(void *)(v1 + 16), a1);
}

unint64_t sub_252766314()
{
  unint64_t result = qword_269C1C3C0;
  if (!qword_269C1C3C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C3C8);
    sub_2527663C8(&qword_269C1C3D0, &qword_269C1C3D8, (void (*)(void))sub_252766434);
    sub_252766554();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C3C0);
  }
  return result;
}

uint64_t sub_2527663C8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_252766434()
{
  unint64_t result = qword_269C1C3E0;
  if (!qword_269C1C3E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C3E8);
    sub_2527664B4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C3E0);
  }
  return result;
}

unint64_t sub_2527664B4()
{
  unint64_t result = qword_269C1C3F0;
  if (!qword_269C1C3F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C3F8);
    sub_252765820(&qword_269C1C400, &qword_269C1C408);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C3F0);
  }
  return result;
}

unint64_t sub_252766554()
{
  unint64_t result = qword_269C1C410;
  if (!qword_269C1C410)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C418);
    sub_252766614();
    sub_2527663C8(&qword_269C1C460, &qword_269C1C468, (void (*)(void))sub_2527667E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C410);
  }
  return result;
}

unint64_t sub_252766614()
{
  unint64_t result = qword_269C1C420;
  if (!qword_269C1C420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C428);
    sub_2527663C8(&qword_269C1C430, &qword_269C1C438, (void (*)(void))sub_2527666C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C420);
  }
  return result;
}

unint64_t sub_2527666C8()
{
  unint64_t result = qword_269C1C440;
  if (!qword_269C1C440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C448);
    sub_25276673C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C440);
  }
  return result;
}

unint64_t sub_25276673C()
{
  unint64_t result = qword_269C1C450;
  if (!qword_269C1C450)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C348);
    sub_2527678E8(&qword_269C1C458, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C450);
  }
  return result;
}

unint64_t sub_2527667E8()
{
  unint64_t result = qword_269C1C470;
  if (!qword_269C1C470)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C478);
    sub_2527678E8(&qword_269C1C480, (void (*)(uint64_t))type metadata accessor for ScheduleRuleAccessListCell);
    sub_252765820(&qword_269C1C488, &qword_269C1C490);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C470);
  }
  return result;
}

unint64_t sub_2527668B8()
{
  unint64_t result = qword_269C1C4A0;
  if (!qword_269C1C4A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C3A0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1C390);
    sub_252772510();
    sub_252765820(&qword_269C1C498, &qword_269C1C390);
    swift_getOpaqueTypeConformance2();
    sub_252765820(&qword_269C1C4A8, &qword_269C1C4B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C4A0);
  }
  return result;
}

uint64_t sub_2527669D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2527669EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)sub_2527726B0();
  id v3 = (id)HFLocalizedString();

  sub_2527726C0();
  sub_252765580();
  uint64_t v4 = sub_2527725C0();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v8 & 1;
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 40) = 1;
  return result;
}

uint64_t sub_252766ABC(uint64_t a1, _OWORD *a2)
{
  id v3 = (_OWORD *)swift_allocObject();
  long long v4 = a2[1];
  v3[1] = *a2;
  v3[2] = v4;
  long long v5 = a2[3];
  v3[3] = a2[2];
  v3[4] = v5;
  swift_bridgeObjectRetain();
  sub_252767884((uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C4D0);
  sub_252772300();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C478);
  sub_252765820(&qword_269C1C4D8, &qword_269C1C4D0);
  sub_2527667E8();
  sub_2527678E8(&qword_269C1C4E0, (void (*)(uint64_t))type metadata accessor for ScheduleRuleDisplayInfo);
  return sub_252772660();
}

uint64_t sub_252766C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for ScheduleRuleAccessListCell();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C478);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252767930(a1, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ScheduleRuleDisplayInfo);
  uint64_t v13 = type metadata accessor for ScheduleRuleDisplayInfo();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  *(void *)&v9[*(int *)(v7 + 28)] = *(void *)(a2 + 16);
  uint64_t v14 = *(int *)(v7 + 32);
  id v15 = objc_allocWithZone(MEMORY[0x263F08790]);
  swift_retain();
  id v16 = objc_msgSend(v15, sel_init);
  objc_msgSend(v16, sel_setDateStyle_, 0);
  objc_msgSend(v16, sel_setTimeStyle_, 1);
  objc_msgSend(v16, sel_setFormattingContext_, 3);
  *(void *)&v9[v14] = v16;
  if (*(void *)(a2 + 32))
  {
    uint64_t v17 = *(void *)(a2 + 32);
  }
  else
  {
    id v18 = objc_msgSend(self, sel_tertiarySystemFillColor);
    uint64_t v17 = MEMORY[0x2533BB8E0](v18);
  }
  v21[1] = v17;
  swift_retain();
  swift_retain();
  uint64_t v19 = sub_252772650();
  sub_252767930((uint64_t)v9, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ScheduleRuleAccessListCell);
  swift_release();
  *(void *)&v12[*(int *)(v10 + 36)] = v19;
  sub_252767998((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ScheduleRuleAccessListCell);
  return sub_2527656A4((uint64_t)v12, a3, &qword_269C1C478);
}

uint64_t sub_252766E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C4C0);
  MEMORY[0x270FA5388](v51);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C348);
  MEMORY[0x270FA5388](v52);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C438);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  char v53 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v48 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C4C8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(a1 + 56);
  if (v18)
  {
    uint64_t v19 = *(void *)(a1 + 48);
    swift_bridgeObjectRetain();
    if (sub_2527726E0() >= 1)
    {
      uint64_t v54 = v19;
      uint64_t v55 = v18;
      sub_252765580();
      *(void *)uint64_t v17 = sub_2527725C0();
      *((void *)v17 + 1) = v20;
      v17[16] = v21 & 1;
      *((void *)v17 + 3) = v22;
      swift_storeEnumTagMultiPayload();
      sub_2527663C8(&qword_269C1C430, &qword_269C1C438, (void (*)(void))sub_2527666C8);
      return sub_2527724F0();
    }
    swift_bridgeObjectRelease();
  }
  int v24 = *(unsigned __int8 *)(a2 + *(int *)(type metadata accessor for ScheduleRuleDisplayInfo() + 20));
  uint64_t v50 = v15;
  if (v24 == 1)
  {
    id v35 = objc_msgSend(self, sel_localizedStringFromScheduleType_, 1);
    uint64_t v36 = sub_2527726C0();
    uint64_t v38 = v37;

    uint64_t v54 = v36;
    uint64_t v55 = v38;
    sub_252765580();
    uint64_t v39 = sub_2527725C0();
    uint64_t v41 = v40;
    uint64_t v49 = a3;
    char v43 = v42 & 1;
    uint64_t v54 = v39;
    uint64_t v55 = v40;
    char v56 = v42 & 1;
    uint64_t v57 = v44;
    sub_252772600();
    sub_2527655D4(v39, v41, v43);
    swift_bridgeObjectRelease();
    sub_2527655E4((uint64_t)v9, (uint64_t)v7, &qword_269C1C348);
  }
  else
  {
    if (v24 != 2)
    {
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C448);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v14, 1, 1, v47);
      goto LABEL_11;
    }
    id v25 = objc_msgSend(self, sel_localizedStringFromScheduleType_, 2);
    uint64_t v26 = sub_2527726C0();
    uint64_t v28 = v27;

    uint64_t v54 = v26;
    uint64_t v55 = v28;
    sub_252765580();
    uint64_t v29 = sub_2527725C0();
    uint64_t v31 = v30;
    uint64_t v54 = v29;
    uint64_t v55 = v30;
    uint64_t v49 = v10;
    char v33 = v32 & 1;
    char v56 = v32 & 1;
    uint64_t v57 = v34;
    sub_252772600();
    sub_2527655D4(v29, v31, v33);
    swift_bridgeObjectRelease();
    sub_2527655E4((uint64_t)v9, (uint64_t)v7, &qword_269C1C348);
  }
  swift_storeEnumTagMultiPayload();
  sub_25276673C();
  uint64_t v45 = (uint64_t)v53;
  sub_2527724F0();
  sub_252765648((uint64_t)v9, &qword_269C1C348);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C448);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 0, 1, v46);
  sub_2527656A4(v45, (uint64_t)v14, &qword_269C1C438);
LABEL_11:
  sub_2527655E4((uint64_t)v14, (uint64_t)v17, &qword_269C1C438);
  swift_storeEnumTagMultiPayload();
  sub_2527663C8(&qword_269C1C430, &qword_269C1C438, (void (*)(void))sub_2527666C8);
  sub_2527724F0();
  return sub_252765648((uint64_t)v14, &qword_269C1C438);
}

uint64_t initializeBufferWithCopyOfBuffer for ScheduleAccessList(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ScheduleAccessList()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ScheduleAccessList(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ScheduleAccessList(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for ScheduleAccessList(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduleAccessList(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScheduleAccessList(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScheduleAccessList()
{
  return &type metadata for ScheduleAccessList;
}

uint64_t sub_25276776C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2527677C8()
{
  return sub_252766ABC(*(void *)(v0 + 16), *(_OWORD **)(v0 + 24));
}

uint64_t sub_2527677D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2527723D0();
  *a1 = result;
  return result;
}

uint64_t sub_2527677FC()
{
  return sub_2527723E0();
}

uint64_t sub_252767824()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_25276787C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_252766C10(a1, v2 + 16, a2);
}

uint64_t sub_252767884(uint64_t a1)
{
  return a1;
}

uint64_t sub_2527678E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252767930(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_252767998(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id HUScheduleAccessViewController.init(guestAccessSchedule:tintColor:shouldDisplayAlwaysAllowedSchedule:scheduleBackgroundColor:listRowBackgroundColor:)(void *a1, void *a2, char a3, void *a4, void *a5)
{
  id v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithGuestAccessSchedule_tintColor_shouldDisplayAlwaysAllowedSchedule_scheduleBackgroundColor_listRowBackgroundColor_, a1, a2, a3 & 1, a4, a5);

  return v9;
}

char *HUScheduleAccessViewController.init(guestAccessSchedule:tintColor:shouldDisplayAlwaysAllowedSchedule:scheduleBackgroundColor:listRowBackgroundColor:)(void *a1, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v11 = &v5[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  *(_OWORD *)uint64_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *((_OWORD *)v11 + 3) = 0u;
  *(void *)&v5[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = 0;
  *(void *)&v5[OBJC_IVAR___HUScheduleAccessViewController_task] = 0;
  type metadata accessor for HUScheduleAccessViewController((uint64_t)a1);
  uint64_t v12 = v5;
  uint64_t v37 = a1;
  uint64_t v13 = sub_252767DE4(a1, a3);
  uint64_t v36 = a5;
  if (a5) {
    uint64_t v38 = MEMORY[0x2533BB8E0](a5);
  }
  else {
    uint64_t v38 = 0;
  }
  type metadata accessor for ScheduleRuleList();
  swift_allocObject();
  ScheduleRuleList.init(rules:)((uint64_t)v13);
  id v35 = a2;
  uint64_t v14 = MEMORY[0x2533BB8E0]();
  id v34 = a4;
  uint64_t v15 = MEMORY[0x2533BB8E0]();
  swift_retain();
  uint64_t v16 = (void *)sub_2527726B0();
  id v17 = (id)HFLocalizedString();

  uint64_t v18 = sub_2527726C0();
  uint64_t v20 = v19;

  sub_25276E958(&qword_269C1C500, (void (*)(uint64_t))type metadata accessor for ScheduleRuleList);
  uint64_t v21 = sub_2527723C0();
  uint64_t v22 = *(void *)v11;
  uint64_t v23 = *((void *)v11 + 1);
  *(void *)uint64_t v11 = v21;
  *((void *)v11 + 1) = v24;
  *((void *)v11 + 2) = v14;
  *((void *)v11 + 3) = v15;
  *((void *)v11 + 4) = v38;
  *((void *)v11 + 5) = 0;
  *((void *)v11 + 6) = v18;
  *((void *)v11 + 7) = v20;
  sub_252768FC8(v22, v23);

  v39.receiver = v12;
  v39.super_class = (Class)HUScheduleAccessViewController;
  id v25 = (char *)objc_msgSendSuper2(&v39, sel_initWithNibName_bundle_, 0, 0);
  uint64_t v26 = *(void *)&v25[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList + 8];
  if (v26)
  {
    uint64_t v27 = *(void *)&v25[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
    id v28 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269C1C508));
    sub_252769038(v27, v26);
    char v33 = v25;
    uint64_t v29 = v25;
    sub_252769038(v27, v26);
    uint64_t v30 = sub_252772430();
    uint64_t v31 = *(void **)&v29[OBJC_IVAR___HUScheduleAccessViewController_hostingController];
    *(void *)&v29[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = v30;

    sub_2527690A8();
    id v25 = v33;
    swift_release();

    sub_252768FC8(v27, v26);
  }
  else
  {

    swift_release();
  }
  return v25;
}

uint64_t type metadata accessor for HUScheduleAccessViewController(uint64_t a1)
{
  return sub_25276EBE8(a1, &qword_269C1C530);
}

uint64_t *sub_252767DE4(void *a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v4 = type metadata accessor for ScheduleRuleDisplayInfo();
  uint64_t v164 = *(void *)(v4 - 8);
  uint64_t v165 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v148 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v148 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v148 - v11;
  unint64_t v160 = sub_252772320();
  uint64_t v13 = *(void *)(v160 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v160);
  uint64_t v16 = (char *)&v148 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v148 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  MEMORY[0x270FA5388](v21);
  id v25 = (char *)&v148 - v24;
  v169 = (uint64_t *)MEMORY[0x263F8EE78];
  uint64_t v158 = v13;
  if (a1)
  {
    v154 = v23;
    v156 = v22;
    v152 = v12;
    LODWORD(v155) = v2;
    v161 = v10;
    uint64_t v26 = self;
    v153 = a1;
    id v27 = a1;
    id v28 = objc_msgSend(v26, sel_scheduleBuilderFromHomeAccessSchedule_, v27);
    uint64_t v29 = self;
    id v30 = objc_msgSend(v28, sel_rules);
    uint64_t v31 = sub_25276EBE8(0, &qword_269C1C580);
    sub_25276EC24();
    uint64_t v32 = sub_2527727D0();

    unint64_t v33 = sub_25276DEAC(v32);
    swift_bridgeObjectRelease();
    sub_25276D388(v33);
    swift_release();
    id v34 = (void *)sub_252772710();
    swift_bridgeObjectRelease();
    id v162 = v29;
    id v35 = objc_msgSend(v29, sel_sortedScheduleRules_, v34);

    uint64_t v151 = v31;
    unint64_t v36 = sub_252772720();

    if (qword_269C1C0B8 != -1) {
      swift_once();
    }
    id v37 = (id)qword_269C1CE00;
    uint64_t v38 = v25;
    sub_252772330();
    id v39 = v27;
    id v40 = v28;
    uint64_t v16 = (char *)v39;
    id v41 = v40;
    char v42 = sub_252772310();
    os_log_type_t v43 = sub_252772800();
    BOOL v44 = os_log_type_enabled(v42, v43);
    unint64_t v163 = v36;
    v159 = v16;
    id v157 = v41;
    if (v44)
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v46 = (void *)swift_slowAlloc();
      uint64_t v150 = swift_slowAlloc();
      v168[0] = v150;
      *(_DWORD *)uint64_t v45 = 136315906;
      uint64_t v47 = sub_252772970();
      uint64_t v167 = sub_25276D854(v47, v48, v168);
      sub_252772840();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      uint64_t v167 = sub_25276D854(0xD000000000000049, 0x8000000252775A50, v168);
      sub_252772840();
      *(_WORD *)(v45 + 22) = 2112;
      uint64_t v167 = (uint64_t)v41;
      id v49 = v41;
      v149 = v38;
      id v50 = v49;
      sub_252772840();
      *uint64_t v46 = v41;

      *(_WORD *)(v45 + 32) = 2112;
      unint64_t v36 = v163;
      uint64_t v167 = (uint64_t)v159;
      uint64_t v51 = v159;
      sub_252772840();
      v46[1] = v153;

      _os_log_impl(&dword_25275A000, v42, v43, "%s%s Constructed builder {%@} from unwrapped schedule {%@}", (uint8_t *)v45, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C528);
      swift_arrayDestroy();
      uint64_t v52 = v46;
      uint64_t v16 = v159;
      MEMORY[0x2533BC470](v52, -1, -1);
      uint64_t v53 = v150;
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v53, -1, -1);
      MEMORY[0x2533BC470](v45, -1, -1);

      uint64_t v54 = *(void (**)(char *, unint64_t))(v158 + 8);
      uint64_t v55 = v149;
    }
    else
    {

      uint64_t v54 = *(void (**)(char *, unint64_t))(v158 + 8);
      uint64_t v55 = v38;
    }
    uint64_t v7 = (char *)v160;
    v54(v55, v160);
    v87 = v156;
    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v124 = sub_2527728F0();
      swift_bridgeObjectRelease();
      if (v124) {
        goto LABEL_19;
      }
    }
    else if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_19:
      id v88 = (id)qword_269C1CE00;
      sub_252772330();
      swift_bridgeObjectRetain_n();
      v89 = sub_252772310();
      os_log_type_t v90 = sub_252772800();
      int v91 = v90;
      if (os_log_type_enabled(v89, v90))
      {
        uint64_t v92 = swift_slowAlloc();
        LODWORD(v160) = v91;
        uint64_t v93 = v92;
        uint64_t v155 = swift_slowAlloc();
        v168[0] = v155;
        *(_DWORD *)uint64_t v93 = 136315650;
        uint64_t v94 = sub_252772970();
        uint64_t v167 = sub_25276D854(v94, v95, v168);
        sub_252772840();
        swift_bridgeObjectRelease();
        v96 = v89;
        *(_WORD *)(v93 + 12) = 2080;
        uint64_t v167 = sub_25276D854(0xD000000000000049, 0x8000000252775A50, v168);
        sub_252772840();
        *(_WORD *)(v93 + 22) = 2080;
        uint64_t v97 = swift_bridgeObjectRetain();
        uint64_t v98 = MEMORY[0x2533BB9E0](v97, v151);
        unint64_t v100 = v99;
        swift_bridgeObjectRelease();
        uint64_t v167 = sub_25276D854(v98, v100, v168);
        sub_252772840();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25275A000, v96, (os_log_type_t)v160, "%s%s Mapping rules to ruleDisplayInfos {%s}", (uint8_t *)v93, 0x20u);
        uint64_t v101 = v155;
        swift_arrayDestroy();
        MEMORY[0x2533BC470](v101, -1, -1);
        MEMORY[0x2533BC470](v93, -1, -1);

        uint64_t v16 = v159;
        v102 = v156;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v102 = v87;
      }
      v54(v102, (unint64_t)v7);
      id v103 = v157;
      if (v36 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_2527728F0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v65 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (!v65)
      {
        swift_bridgeObjectRelease();

        uint64_t v105 = MEMORY[0x263F8EE78];
LABEL_39:
        swift_bridgeObjectRelease();
        v169 = (uint64_t *)v105;
        goto LABEL_52;
      }
      v168[0] = MEMORY[0x263F8EE78];
      v73 = v168;
      sub_25276DFA8(0, v65 & ~(v65 >> 63), 0);
      if ((v65 & 0x8000000000000000) == 0)
      {
        uint64_t v104 = 0;
        unint64_t v160 = v36 & 0xC000000000000001;
        uint64_t v105 = v168[0];
        do
        {
          if (v160) {
            id v106 = (id)MEMORY[0x2533BBB60](v104, v36);
          }
          else {
            id v106 = *(id *)(v36 + 8 * v104 + 32);
          }
          v107 = v106;
          if (objc_msgSend(v106, sel_isYearDayRule)) {
            char v108 = 1;
          }
          else {
            char v108 = 2;
          }
          id v109 = v162;
          id v110 = objc_msgSend(v162, sel_localizedMainStringForRule_, v107);
          uint64_t v111 = sub_2527726C0();
          uint64_t v113 = v112;

          id v114 = objc_msgSend(v109, sel_localizedDetailedStringForRule_, v107);
          uint64_t v115 = sub_2527726C0();
          uint64_t v117 = v116;

          uint64_t v118 = (uint64_t)v161;
          sub_2527722F0();

          uint64_t v119 = v165;
          *(unsigned char *)(v118 + *(int *)(v165 + 20)) = v108;
          v120 = (uint64_t *)(v118 + *(int *)(v119 + 24));
          uint64_t *v120 = v111;
          v120[1] = v113;
          v121 = (uint64_t *)(v118 + *(int *)(v119 + 28));
          uint64_t *v121 = v115;
          v121[1] = v117;
          v168[0] = v105;
          unint64_t v123 = *(void *)(v105 + 16);
          unint64_t v122 = *(void *)(v105 + 24);
          if (v123 >= v122 >> 1)
          {
            sub_25276DFA8(v122 > 1, v123 + 1, 1);
            uint64_t v105 = v168[0];
          }
          ++v104;
          *(void *)(v105 + 16) = v123 + 1;
          sub_25276551C(v118, v105+ ((*(unsigned __int8 *)(v164 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v164 + 80))+ *(void *)(v164 + 72) * v123);
          unint64_t v36 = v163;
        }
        while (v65 != v104);
        swift_bridgeObjectRelease();

        goto LABEL_39;
      }
      __break(1u);
      goto LABEL_54;
    }
    swift_bridgeObjectRelease();
    id v125 = (id)qword_269C1CE00;
    v126 = v154;
    sub_252772330();
    v127 = sub_252772310();
    os_log_type_t v128 = sub_252772800();
    if (os_log_type_enabled(v127, v128))
    {
      uint64_t v129 = swift_slowAlloc();
      uint64_t v130 = swift_slowAlloc();
      v168[0] = v130;
      *(_DWORD *)uint64_t v129 = 136315394;
      uint64_t v131 = sub_252772970();
      uint64_t v167 = sub_25276D854(v131, v132, v168);
      sub_252772840();
      swift_bridgeObjectRelease();
      *(_WORD *)(v129 + 12) = 2080;
      uint64_t v167 = sub_25276D854(0xD000000000000049, 0x8000000252775A50, v168);
      sub_252772840();
      _os_log_impl(&dword_25275A000, v127, v128, "%s%s Rules are empty!", (uint8_t *)v129, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v130, -1, -1);
      MEMORY[0x2533BC470](v129, -1, -1);

      v54(v154, (unint64_t)v7);
    }
    else
    {

      v54(v126, (unint64_t)v7);
    }
    id v133 = v159;
    id v134 = v157;
    if (v155)
    {
      id v135 = objc_msgSend(v162, sel_localizedStringFromScheduleType_, 0);
      uint64_t v136 = sub_2527726C0();
      uint64_t v138 = v137;

      uint64_t v139 = (uint64_t)v152;
      sub_2527722F0();
      uint64_t v140 = v165;
      *(unsigned char *)(v139 + *(int *)(v165 + 20)) = 0;
      v141 = (uint64_t *)(v139 + *(int *)(v140 + 24));
      uint64_t *v141 = v136;
      v141[1] = v138;
      v142 = (void *)(v139 + *(int *)(v140 + 28));
      void *v142 = 0;
      v142[1] = 0;
      unint64_t v143 = (unint64_t)v169;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v143 = sub_25276D5EC(0, *(void *)(v143 + 16) + 1, 1, v143);
      }
      unint64_t v145 = *(void *)(v143 + 16);
      unint64_t v144 = *(void *)(v143 + 24);
      id v146 = v159;
      if (v145 >= v144 >> 1) {
        unint64_t v143 = sub_25276D5EC(v144 > 1, v145 + 1, 1, v143);
      }
      *(void *)(v143 + 16) = v145 + 1;
      sub_25276551C((uint64_t)v152, v143+ ((*(unsigned __int8 *)(v164 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v164 + 80))+ *(void *)(v164 + 72) * v145);

      v169 = (uint64_t *)v143;
    }
    else
    {
    }
  }
  else
  {
    if (qword_269C1C0B8 != -1) {
      swift_once();
    }
    id v56 = (id)qword_269C1CE00;
    sub_252772330();
    uint64_t v57 = sub_252772310();
    os_log_type_t v58 = sub_252772800();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = swift_slowAlloc();
      LODWORD(v155) = v2;
      uint64_t v2 = v59;
      uint64_t v60 = swift_slowAlloc();
      v168[0] = v60;
      *(_DWORD *)uint64_t v2 = 136315394;
      uint64_t v61 = sub_252772970();
      uint64_t v167 = sub_25276D854(v61, v62, v168);
      sub_252772840();
      swift_bridgeObjectRelease();
      *(_WORD *)(v2 + 12) = 2080;
      uint64_t v167 = sub_25276D854(0xD000000000000049, 0x8000000252775A50, v168);
      sub_252772840();
      _os_log_impl(&dword_25275A000, v57, v58, "%s%s There is no schedule to get ruleDisplayInfos from.", (uint8_t *)v2, 0x16u);
      swift_arrayDestroy();
      uint64_t v63 = v60;
      uint64_t v13 = v158;
      MEMORY[0x2533BC470](v63, -1, -1);
      uint64_t v64 = v2;
      LOBYTE(v2) = v155;
      MEMORY[0x2533BC470](v64, -1, -1);
    }

    uint64_t v65 = *(void *)(v13 + 8);
    ((void (*)(char *, unint64_t))v65)(v19, v160);
    if (v2)
    {
      id v66 = objc_msgSend(self, sel_localizedStringFromScheduleType_, 0);
      uint64_t v67 = sub_2527726C0();
      uint64_t v69 = v68;

      sub_2527722F0();
      uint64_t v70 = v165;
      v7[*(int *)(v165 + 20)] = 0;
      v71 = (uint64_t *)&v7[*(int *)(v70 + 24)];
      uint64_t *v71 = v67;
      v71[1] = v69;
      v72 = &v7[*(int *)(v70 + 28)];
      *(void *)v72 = 0;
      *((void *)v72 + 1) = 0;
      v73 = v169;
      if (swift_isUniquelyReferenced_nonNull_native())
      {
LABEL_12:
        unint64_t v75 = v73[2];
        unint64_t v74 = v73[3];
        if (v75 >= v74 >> 1) {
          v73 = (uint64_t *)sub_25276D5EC(v74 > 1, v75 + 1, 1, (unint64_t)v73);
        }
        v73[2] = v75 + 1;
        sub_25276551C((uint64_t)v7, (uint64_t)v73+ ((*(unsigned __int8 *)(v164 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v164 + 80))+ *(void *)(v164 + 72) * v75);
        v169 = v73;
        id v76 = (id)qword_269C1CE00;
        sub_252772330();
        uint64_t v77 = sub_252772310();
        os_log_type_t v78 = sub_252772800();
        if (os_log_type_enabled(v77, v78))
        {
          uint64_t v79 = swift_slowAlloc();
          uint64_t v80 = swift_slowAlloc();
          v168[0] = v80;
          *(_DWORD *)uint64_t v79 = 136315650;
          uint64_t v81 = sub_252772970();
          uint64_t v167 = sub_25276D854(v81, v82, v168);
          sub_252772840();
          swift_bridgeObjectRelease();
          *(_WORD *)(v79 + 12) = 2080;
          uint64_t v167 = sub_25276D854(0xD000000000000049, 0x8000000252775A50, v168);
          sub_252772840();
          *(_WORD *)(v79 + 22) = 2080;
          swift_beginAccess();
          uint64_t v83 = swift_bridgeObjectRetain();
          uint64_t v84 = MEMORY[0x2533BB9E0](v83, v165);
          unint64_t v86 = v85;
          swift_bridgeObjectRelease();
          uint64_t v166 = sub_25276D854(v84, v86, v168);
          sub_252772840();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25275A000, v77, v78, "%s%s Adding always allowed info. List of displayInfos to be presented {%s}", (uint8_t *)v79, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x2533BC470](v80, -1, -1);
          MEMORY[0x2533BC470](v79, -1, -1);
        }

        ((void (*)(char *, unint64_t))v65)(v16, v160);
        goto LABEL_52;
      }
LABEL_54:
      v73 = (uint64_t *)sub_25276D5EC(0, v73[2] + 1, 1, (unint64_t)v73);
      goto LABEL_12;
    }
  }
LABEL_52:
  swift_beginAccess();
  return v169;
}

uint64_t sub_252768FC8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_252769038(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

void sub_2527690A8()
{
  uint64_t v1 = sub_252772320();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v68 - v6;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR___HUScheduleAccessViewController_hostingController];
  if (v8)
  {
    uint64_t v9 = qword_269C1C0B8;
    id v10 = v8;
    if (v9 != -1) {
      swift_once();
    }
    id v11 = (id)qword_269C1CE00;
    sub_252772330();
    uint64_t v12 = v0;
    uint64_t v13 = sub_252772310();
    os_log_type_t v14 = sub_252772800();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v69 = (uint64_t)v10;
      uint64_t v17 = (void *)v16;
      uint64_t v68 = swift_slowAlloc();
      uint64_t v72 = (uint64_t)v12;
      uint64_t v73 = v68;
      *(_DWORD *)uint64_t v15 = 138412546;
      uint64_t v70 = v2;
      uint64_t v18 = v12;
      uint64_t v71 = v1;
      uint64_t v19 = v18;
      sub_252772840();
      void *v17 = v12;

      *(_WORD *)(v15 + 12) = 2080;
      uint64_t v72 = sub_25276D854(0xD00000000000001ALL, 0x8000000252775A30, &v73);
      sub_252772840();
      _os_log_impl(&dword_25275A000, v13, v14, "%@%s Presenting hosting controller for schedule access", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C528);
      swift_arrayDestroy();
      uint64_t v20 = v17;
      id v10 = (id)v69;
      MEMORY[0x2533BC470](v20, -1, -1);
      uint64_t v21 = v68;
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v21, -1, -1);
      MEMORY[0x2533BC470](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v70 + 8))(v7, v71);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    }
    objc_msgSend(v12, sel_addChildViewController_, v10);
    id v31 = objc_msgSend(v12, sel_view);
    if (v31)
    {
      uint64_t v32 = v31;
      id v33 = objc_msgSend(v10, sel_view);
      if (v33)
      {
        id v34 = v33;
        objc_msgSend(v32, sel_addSubview_, v33);

        id v35 = objc_msgSend(v10, sel_view);
        if (v35)
        {
          unint64_t v36 = v35;
          objc_msgSend(v35, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

          __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C570);
          uint64_t v37 = swift_allocObject();
          *(_OWORD *)(v37 + 16) = xmmword_252775370;
          id v38 = objc_msgSend(v10, sel_view);
          if (v38)
          {
            id v39 = v38;
            id v40 = objc_msgSend(v38, sel_leadingAnchor);

            id v41 = objc_msgSend(v12, sel_view);
            if (v41)
            {
              char v42 = v41;
              id v43 = objc_msgSend(v41, sel_leadingAnchor);

              id v44 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v43);
              *(void *)(v37 + 32) = v44;
              id v45 = objc_msgSend(v10, sel_view);
              if (v45)
              {
                uint64_t v46 = v45;
                id v47 = objc_msgSend(v45, sel_trailingAnchor);

                id v48 = objc_msgSend(v12, sel_view);
                if (v48)
                {
                  id v49 = v48;
                  id v50 = objc_msgSend(v48, sel_trailingAnchor);

                  id v51 = objc_msgSend(v47, sel_constraintEqualToAnchor_, v50);
                  *(void *)(v37 + 40) = v51;
                  id v52 = objc_msgSend(v10, sel_view);
                  if (v52)
                  {
                    uint64_t v53 = v52;
                    id v54 = objc_msgSend(v52, sel_topAnchor);

                    id v55 = objc_msgSend(v12, sel_view);
                    if (v55)
                    {
                      id v56 = v55;
                      id v57 = objc_msgSend(v55, sel_topAnchor);

                      id v58 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v57);
                      *(void *)(v37 + 48) = v58;
                      id v59 = objc_msgSend(v10, sel_view);
                      if (v59)
                      {
                        uint64_t v60 = v59;
                        id v61 = objc_msgSend(v59, sel_bottomAnchor);

                        id v62 = objc_msgSend(v12, sel_view);
                        if (v62)
                        {
                          uint64_t v63 = v62;
                          uint64_t v64 = self;
                          id v65 = objc_msgSend(v63, sel_bottomAnchor);

                          id v66 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v65);
                          *(void *)(v37 + 56) = v66;
                          uint64_t v73 = v37;
                          sub_252772740();
                          sub_25276EBE8(0, &qword_269C1C578);
                          uint64_t v67 = (void *)sub_252772710();
                          swift_bridgeObjectRelease();
                          objc_msgSend(v64, sel_activateConstraints_, v67);

                          return;
                        }
                        goto LABEL_34;
                      }
LABEL_33:
                      __break(1u);
LABEL_34:
                      __break(1u);
                      return;
                    }
LABEL_32:
                    __break(1u);
                    goto LABEL_33;
                  }
LABEL_31:
                  __break(1u);
                  goto LABEL_32;
                }
LABEL_30:
                __break(1u);
                goto LABEL_31;
              }
LABEL_29:
              __break(1u);
              goto LABEL_30;
            }
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
  if (qword_269C1C0B8 != -1) {
    swift_once();
  }
  id v22 = (id)qword_269C1CE00;
  sub_252772330();
  uint64_t v23 = v0;
  uint64_t v24 = sub_252772310();
  os_log_type_t v25 = sub_2527727F0();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v71 = v1;
    uint64_t v27 = v26;
    id v28 = (void *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    uint64_t v72 = (uint64_t)v23;
    uint64_t v73 = v69;
    *(_DWORD *)uint64_t v27 = 138412546;
    uint64_t v70 = v2;
    uint64_t v29 = v23;
    sub_252772840();
    void *v28 = v23;

    *(_WORD *)(v27 + 12) = 2080;
    uint64_t v72 = sub_25276D854(0xD00000000000001ALL, 0x8000000252775A30, &v73);
    sub_252772840();
    _os_log_impl(&dword_25275A000, v24, v25, "%@%s Unexpected error! We have no host controller!", (uint8_t *)v27, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C528);
    swift_arrayDestroy();
    MEMORY[0x2533BC470](v28, -1, -1);
    uint64_t v30 = v69;
    swift_arrayDestroy();
    MEMORY[0x2533BC470](v30, -1, -1);
    MEMORY[0x2533BC470](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v70 + 8))(v5, v71);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

id HUScheduleAccessViewController.init(homeID:tintColor:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_2527722C0();
  id v6 = objc_msgSend(v4, sel_initWithHomeID_tintColor_, v5, a2);

  uint64_t v7 = sub_252772300();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

{
  void *v2;
  void *v3;
  void *v6;
  id v7;
  uint64_t v8;

  uint64_t v3 = v2;
  id v6 = (void *)sub_2527722C0();
  uint64_t v7 = objc_msgSend(v3, sel_initWithHomeID_tintColor_listRowBackgroundColor_, v6, a2, 0);

  uint64_t v8 = sub_252772300();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  return v7;
}

id HUScheduleAccessViewController.init(homeID:tintColor:listRowBackgroundColor:)(uint64_t a1, void *a2, void *a3)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v7 = (void *)sub_2527722C0();
  id v8 = objc_msgSend(v6, sel_initWithHomeID_tintColor_listRowBackgroundColor_, v7, a2, a3);

  uint64_t v9 = sub_252772300();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  return v8;
}

char *HUScheduleAccessViewController.init(homeID:tintColor:listRowBackgroundColor:)(void (*a1)(char *, uint64_t), void *a2, char *a3)
{
  uint64_t v69 = a2;
  uint64_t v6 = sub_252772320();
  uint64_t v66 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v68 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_252772300();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v67 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C510);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v14 = &v3[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  *(_OWORD *)os_log_type_t v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *((_OWORD *)v14 + 3) = 0u;
  *(void *)&v3[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = 0;
  *(void *)&v3[OBJC_IVAR___HUScheduleAccessViewController_task] = 0;
  v72.receiver = v3;
  v72.super_class = (Class)HUScheduleAccessViewController;
  id v15 = objc_msgSendSuper2(&v72, sel_initWithNibName_bundle_, 0, 0);
  uint64_t v16 = self;
  uint64_t v17 = (char *)v15;
  id v18 = objc_msgSend(v16, sel_sharedDispatcher);
  id v19 = objc_msgSend(v18, sel_homeManager);

  if (v19)
  {
    uint64_t v64 = (char *)v6;
    uint64_t v20 = qword_269C1C0B8;
    id v21 = v19;
    if (v20 != -1) {
      swift_once();
    }
    id v22 = (id)qword_269C1CE00;
    uint64_t v23 = v68;
    sub_252772330();
    uint64_t v67 = v17;
    uint64_t v24 = v17;
    id v25 = v21;
    uint64_t v26 = v24;
    id v27 = v25;
    id v28 = sub_252772310();
    os_log_type_t v29 = sub_252772800();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      id v62 = a3;
      uint64_t v31 = v30;
      uint64_t v32 = swift_slowAlloc();
      id v65 = a1;
      id v33 = (void *)v32;
      uint64_t v60 = swift_slowAlloc();
      uint64_t v70 = (uint64_t)v26;
      uint64_t v71 = v60;
      *(_DWORD *)uint64_t v31 = 138412802;
      os_log_t v59 = v28;
      uint64_t v61 = v9;
      uint64_t v63 = v8;
      id v34 = v26;
      sub_252772840();
      *id v33 = v26;

      *(_WORD *)(v31 + 12) = 2080;
      uint64_t v70 = sub_25276D854(0xD00000000000002ELL, 0x80000002527755E0, &v71);
      sub_252772840();
      *(_WORD *)(v31 + 22) = 2112;
      uint64_t v70 = (uint64_t)v27;
      id v35 = v27;
      uint64_t v8 = v63;
      uint64_t v9 = v61;
      sub_252772840();
      v33[1] = v19;

      os_log_t v36 = v59;
      _os_log_impl(&dword_25275A000, v59, v29, "%@%s HMHomeManager exists! as %@", (uint8_t *)v31, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C528);
      swift_arrayDestroy();
      uint64_t v37 = v33;
      a1 = v65;
      MEMORY[0x2533BC470](v37, -1, -1);
      uint64_t v38 = v60;
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v38, -1, -1);
      uint64_t v39 = v31;
      a3 = v62;
      MEMORY[0x2533BC470](v39, -1, -1);

      (*(void (**)(char *, char *))(v66 + 8))(v68, v64);
    }
    else
    {

      (*(void (**)(char *, char *))(v66 + 8))(v23, v64);
    }
    id v56 = v69;
    sub_25276A3DC(a1, v69, a3);
    sub_2527690A8();

    id v50 = v67;
  }
  else
  {
    uint64_t v40 = sub_2527727A0();
    id v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56);
    uint64_t v64 = v13;
    v41(v13, 1, 1, v40);
    uint64_t v42 = swift_allocObject();
    swift_unknownObjectWeakInit();
    (*(void (**)(char *, void (*)(char *, uint64_t), uint64_t))(v9 + 16))(v67, a1, v8);
    sub_252772770();
    uint64_t v68 = a3;
    swift_retain();
    id v43 = v69;
    id v65 = a1;
    uint64_t v69 = v43;
    uint64_t v44 = sub_252772760();
    uint64_t v45 = v8;
    unint64_t v46 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v47 = v9;
    unint64_t v48 = (v10 + v46 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v49 = (v48 + 15) & 0xFFFFFFFFFFFFFFF8;
    id v50 = v17;
    id v51 = a3;
    id v52 = (void *)swift_allocObject();
    uint64_t v53 = MEMORY[0x263F8F500];
    v52[2] = v44;
    v52[3] = v53;
    v52[4] = v42;
    id v54 = (char *)v52 + v46;
    uint64_t v8 = v45;
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v54, v67, v45);
    id v55 = v69;
    *(void *)((char *)v52 + v48) = v69;
    uint64_t v9 = v47;
    *(void *)((char *)v52 + v49) = v51;
    swift_release();
    sub_25276C2A4((uint64_t)v64, (uint64_t)&unk_269C1C520, (uint64_t)v52);
    swift_release();

    a1 = v65;
    a3 = v50;
  }

  (*(void (**)(void, uint64_t))(v9 + 8))(a1, v8);
  return v50;
}

uint64_t sub_25276A3A4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25276A3DC(void (*a1)(char *, uint64_t), void *a2, void *a3)
{
  id v144 = a3;
  id v142 = a2;
  uint64_t v156 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_252772300();
  uint64_t v6 = *(char **)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v141 = (char *)&v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v130 - v9;
  uint64_t v11 = sub_252772320();
  uint64_t v148 = *(void *)(v11 - 8);
  uint64_t v149 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  os_log_type_t v14 = (char *)&v130 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v130 - v16;
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v130 - v18;
  id v20 = objc_msgSend(self, sel_sharedDispatcher);
  id v21 = objc_msgSend(v20, sel_homeManager);

  uint64_t v140 = v14;
  v147 = (void (*)(char *, uint64_t))a1;
  if (v21)
  {
    id v22 = v6;
    uint64_t v23 = v3;
    uint64_t v24 = v10;
    id v25 = v19;
    uint64_t v26 = v5;
    id v27 = v21;
    id v28 = (void *)sub_2527722C0();
    id v29 = objc_msgSend(v27, sel_hf_homeWithIdentifier_, v28);

    uint64_t v5 = v26;
    id v19 = v25;
    uint64_t v10 = v24;
    uint64_t v3 = v23;
    uint64_t v6 = v22;
  }
  else
  {
    id v29 = 0;
  }
  uint64_t v145 = (uint64_t)v17;
  id v143 = v21;
  if (qword_269C1C0B8 != -1) {
    swift_once();
  }
  id v30 = (id)qword_269C1CE00;
  sub_252772330();
  uint64_t v31 = (char *)*((void *)v6 + 2);
  uint64_t v138 = v6 + 16;
  uint64_t v137 = v31;
  ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v31)(v10, v147, v5);
  id v32 = v29;
  id v33 = v29;
  id v34 = v3;
  id v35 = (char *)v32;
  os_log_t v36 = v6;
  uint64_t v150 = (char *)v34;
  uint64_t v37 = sub_252772310();
  int v38 = sub_252772800();
  BOOL v39 = os_log_type_enabled(v37, (os_log_type_t)v38);
  uint64_t v40 = v149;
  id v146 = v35;
  uint64_t v139 = v6;
  if (v39)
  {
    int v132 = v38;
    os_log_t v134 = v37;
    id v135 = v19;
    uint64_t v41 = swift_slowAlloc();
    uint64_t v42 = (void *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v133 = v43;
    *(_DWORD *)uint64_t v41 = 138413058;
    id v131 = v33;
    uint64_t v44 = v150;
    uint64_t v151 = v150;
    v152[0] = v43;
    uint64_t v45 = v5;
    unint64_t v46 = v150;
    sub_252772840();
    *uint64_t v42 = v44;

    *(_WORD *)(v41 + 12) = 2080;
    uint64_t v151 = (char *)sub_25276D854(0xD00000000000002FLL, 0x80000002527759E0, v152);
    sub_252772840();
    *(_WORD *)(v41 + 22) = 2080;
    sub_25276E958(&qword_269C1C540, MEMORY[0x263F07508]);
    uint64_t v47 = sub_252772910();
    uint64_t v151 = (char *)sub_25276D854(v47, v48, v152);
    sub_252772840();
    swift_bridgeObjectRelease();
    uint64_t v136 = (void (*)(char *, uint64_t))*((void *)v36 + 1);
    v136(v10, v5);
    *(_WORD *)(v41 + 32) = 2112;
    id v49 = v131;
    if (v131)
    {
      id v35 = v146;
      uint64_t v151 = v146;
      id v50 = v146;
      sub_252772840();
    }
    else
    {
      uint64_t v151 = 0;
      sub_252772840();
      id v35 = v146;
    }
    id v54 = v135;
    v42[1] = v49;

    os_log_t v55 = v134;
    _os_log_impl(&dword_25275A000, v134, (os_log_type_t)v132, "%@%s Lookup result for home with id=%s as %@", (uint8_t *)v41, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C528);
    swift_arrayDestroy();
    MEMORY[0x2533BC470](v42, -1, -1);
    uint64_t v56 = v133;
    swift_arrayDestroy();
    MEMORY[0x2533BC470](v56, -1, -1);
    MEMORY[0x2533BC470](v41, -1, -1);

    uint64_t v40 = v149;
    uint64_t v53 = *(void (**)(char *, uint64_t))(v148 + 8);
    v53(v54, v149);
    uint64_t v5 = v45;
  }
  else
  {
    id v49 = v33;
    id v51 = v10;
    id v52 = v150;

    uint64_t v136 = (void (*)(char *, uint64_t))*((void *)v36 + 1);
    v136(v51, v5);

    uint64_t v53 = *(void (**)(char *, uint64_t))(v148 + 8);
    v53(v19, v40);
  }
  id v57 = (void (*)(void, void))v147;
  uint64_t v58 = v145;
  os_log_t v59 = v141;
  if (!v144)
  {
    id v60 = 0;
    id v144 = 0;
    if (v49) {
      goto LABEL_14;
    }
LABEL_18:
    id v82 = (id)qword_269C1CE00;
    uint64_t v83 = v140;
    sub_252772330();
    ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v137)(v59, (void (*)(char *, uint64_t))v57, v5);
    uint64_t v84 = v150;
    unint64_t v85 = sub_252772310();
    os_log_type_t v86 = sub_252772800();
    int v87 = v86;
    if (os_log_type_enabled(v85, v86))
    {
      uint64_t v88 = swift_slowAlloc();
      v89 = (void *)swift_slowAlloc();
      uint64_t v145 = swift_slowAlloc();
      uint64_t v151 = v84;
      v152[0] = v145;
      *(_DWORD *)uint64_t v88 = 138413058;
      LODWORD(v138) = v87;
      uint64_t v137 = (char *)v5;
      os_log_type_t v90 = v84;
      v147 = v53;
      int v91 = v84;
      uint64_t v92 = v90;
      sub_252772840();
      void *v89 = v91;

      uint64_t v84 = v91;
      *(_WORD *)(v88 + 12) = 2080;
      uint64_t v151 = (char *)sub_25276D854(0xD00000000000002FLL, 0x80000002527759E0, v152);
      sub_252772840();
      *(_WORD *)(v88 + 22) = 2080;
      sub_25276E958(&qword_269C1C540, MEMORY[0x263F07508]);
      uint64_t v93 = (void (*)(void, void, void))v137;
      uint64_t v94 = sub_252772910();
      uint64_t v151 = (char *)sub_25276D854(v94, v95, v152);
      id v60 = v144;
      sub_252772840();
      swift_bridgeObjectRelease();
      v136(v59, (uint64_t)v93);
      *(_WORD *)(v88 + 32) = 2112;
      uint64_t v151 = 0;
      sub_252772840();
      v89[1] = 0;
      _os_log_impl(&dword_25275A000, v85, (os_log_type_t)v138, "%@%s Unable to find home with id=%s as %@", (uint8_t *)v88, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C528);
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v89, -1, -1);
      uint64_t v96 = v145;
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v96, -1, -1);
      MEMORY[0x2533BC470](v88, -1, -1);

      v147(v83, v149);
    }
    else
    {

      v136(v59, v5);
      v53(v83, v40);
    }
    type metadata accessor for ScheduleRuleList();
    swift_allocObject();
    ScheduleRuleList.init(rules:)(MEMORY[0x263F8EE78]);
    uint64_t v99 = MEMORY[0x2533BB8E0](v142);
    sub_25276E958(&qword_269C1C500, (void (*)(uint64_t))type metadata accessor for ScheduleRuleList);
    swift_retain();
    uint64_t v100 = sub_2527723C0();
    uint64_t v101 = (uint64_t *)&v84[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
    uint64_t v102 = *(void *)&v84[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
    uint64_t v103 = *(void *)&v84[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList + 8];
    *uint64_t v101 = v100;
    v101[1] = v104;
    v101[2] = v99;
    v101[3] = 0;
    v101[4] = (uint64_t)v60;
    v101[5] = 1;
    v101[6] = 0;
    v101[7] = 0;
    uint64_t v105 = v102;
    uint64_t v106 = v103;
    goto LABEL_29;
  }
  id v60 = (id)MEMORY[0x2533BB8E0](v144);
  id v144 = v60;
  if (!v49) {
    goto LABEL_18;
  }
LABEL_14:
  v147 = v53;
  uint64_t v61 = v35;
  id v62 = objc_msgSend(v61, sel_currentUser);
  uint64_t v140 = v61;
  id v63 = objc_msgSend(v61, sel_homeAccessControlForUser_, v62);

  id v64 = objc_msgSend(v63, sel_restrictedGuestAccessSettings);
  id v65 = (char *)objc_msgSend(v64, sel_guestAccessSchedule);
  id v66 = (id)qword_269C1CE00;
  sub_252772330();
  uint64_t v67 = v150;
  v141 = v65;
  uint64_t v68 = v65;
  id v69 = v64;
  id v70 = v63;
  uint64_t v71 = v67;
  objc_super v72 = v68;
  uint64_t v73 = (char *)v69;
  unint64_t v74 = (char *)v70;
  unint64_t v75 = sub_252772310();
  int v76 = sub_252772800();
  if (os_log_type_enabled(v75, (os_log_type_t)v76))
  {
    LODWORD(v135) = v76;
    uint64_t v137 = v73;
    uint64_t v138 = v74;
    uint64_t v77 = swift_slowAlloc();
    os_log_type_t v78 = (void *)swift_slowAlloc();
    uint64_t v136 = (void (*)(char *, uint64_t))swift_slowAlloc();
    uint64_t v151 = v71;
    v152[0] = (uint64_t)v136;
    *(_DWORD *)uint64_t v77 = 138413314;
    uint64_t v79 = v71;
    sub_252772840();
    uint64_t v139 = v71;
    *os_log_type_t v78 = v71;

    *(_WORD *)(v77 + 12) = 2080;
    uint64_t v151 = (char *)sub_25276D854(0xD00000000000002FLL, 0x80000002527759E0, v152);
    sub_252772840();
    *(_WORD *)(v77 + 22) = 2112;
    if (v72)
    {
      uint64_t v151 = v72;
      uint64_t v80 = v72;
      sub_252772840();
      uint64_t v81 = v141;
    }
    else
    {
      uint64_t v151 = 0;
      sub_252772840();
      uint64_t v81 = 0;
    }
    v107 = v137;
    v78[1] = v81;

    *(_WORD *)(v77 + 32) = 2112;
    if (v107)
    {
      uint64_t v151 = v107;
      char v108 = v107;
      sub_252772840();
    }
    else
    {
      uint64_t v151 = 0;
      sub_252772840();
      id v64 = 0;
    }
    v78[2] = v64;

    *(_WORD *)(v77 + 42) = 2112;
    unint64_t v74 = v138;
    uint64_t v151 = v138;
    id v109 = v138;
    sub_252772840();
    v78[3] = v74;

    uint64_t v98 = v107;
    _os_log_impl(&dword_25275A000, v75, (os_log_type_t)v135, "%@%s Found access schedule {%@} from guest settings {%@} and home access control {%@}", (uint8_t *)v77, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C528);
    swift_arrayDestroy();
    MEMORY[0x2533BC470](v78, -1, -1);
    id v110 = v136;
    swift_arrayDestroy();
    MEMORY[0x2533BC470](v110, -1, -1);
    MEMORY[0x2533BC470](v77, -1, -1);

    uint64_t v97 = ((uint64_t (*)(uint64_t, uint64_t))v147)(v145, v149);
    id v60 = v144;
    uint64_t v71 = v139;
  }
  else
  {

    uint64_t v97 = ((uint64_t (*)(uint64_t, uint64_t))v147)(v58, v149);
    uint64_t v98 = v73;
  }
  type metadata accessor for HUScheduleAccessViewController(v97);
  uint64_t v111 = sub_252767DE4(v141, 1);
  type metadata accessor for ScheduleRuleList();
  swift_allocObject();
  ScheduleRuleList.init(rules:)((uint64_t)v111);
  uint64_t v112 = MEMORY[0x2533BB8E0](v142);
  sub_25276E958(&qword_269C1C500, (void (*)(uint64_t))type metadata accessor for ScheduleRuleList);
  swift_retain();
  uint64_t v113 = sub_2527723C0();
  uint64_t v115 = v114;

  uint64_t v116 = (uint64_t *)&v71[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  uint64_t v105 = *(void *)&v71[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  uint64_t v106 = *(void *)&v71[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList + 8];
  *uint64_t v116 = v113;
  v116[1] = v115;
  v116[2] = v112;
  v116[3] = 0;
  v116[4] = (uint64_t)v60;
  v116[5] = 1;
  v116[6] = 0;
  v116[7] = 0;
LABEL_29:
  sub_252768FC8(v105, v106);
  uint64_t v117 = (uint64_t *)&v150[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  uint64_t v118 = *(void *)&v150[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList + 8];
  if (v118)
  {
    uint64_t v120 = v117[6];
    uint64_t v119 = v117[7];
    uint64_t v122 = v117[4];
    uint64_t v121 = v117[5];
    uint64_t v124 = v117[2];
    uint64_t v123 = v117[3];
    id v125 = v150;
    v152[0] = *v117;
    uint64_t v126 = v152[0];
    v152[1] = v118;
    v152[2] = v124;
    v152[3] = v123;
    v152[4] = v122;
    char v153 = v121 & 1;
    uint64_t v154 = v120;
    uint64_t v155 = v119;
    id v127 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269C1C508));
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    uint64_t v128 = sub_252772430();

    swift_release();
    sub_252768FC8(v126, v118);
    uint64_t v129 = *(void **)&v125[OBJC_IVAR___HUScheduleAccessViewController_hostingController];
    *(void *)&v125[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = v128;
  }
  else
  {

    swift_release();
  }
}

uint64_t sub_25276B474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  sub_252772770();
  v7[9] = sub_252772760();
  uint64_t v9 = sub_252772750();
  v7[10] = v9;
  v7[11] = v8;
  return MEMORY[0x270FA2498](sub_25276B510, v9, v8);
}

uint64_t sub_25276B510()
{
  uint64_t v1 = v0[5] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x2533BC520](v1);
  v0[12] = v2;
  if (v2)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[13] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_25276B604;
    return sub_25276BA68();
  }
  else
  {
    swift_release();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_25276B604(void *a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 80);
    uint64_t v6 = *(void *)(v4 + 88);
    uint64_t v7 = sub_25276B7B4;
  }
  else
  {

    uint64_t v5 = *(void *)(v4 + 80);
    uint64_t v6 = *(void *)(v4 + 88);
    uint64_t v7 = sub_25276B728;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_25276B728()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = (void *)v0[8];
  uint64_t v4 = (void (*)(char *, uint64_t))v0[6];
  uint64_t v3 = (void *)v0[7];
  swift_release();
  sub_25276A3DC(v4, v3, v2);
  sub_2527690A8();

  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25276B7B4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25276B824()
{
  uint64_t v1 = sub_252772300();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v7 + 8, v5);
}

uint64_t sub_25276B924(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_252772300() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = (uint64_t)v1 + v5;
  uint64_t v11 = *(void *)((char *)v1 + v6);
  uint64_t v12 = *(void *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_25276ECA4;
  return sub_25276B474(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_25276BA68()
{
  v1[4] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C510);
  v1[5] = swift_task_alloc();
  v1[6] = sub_252772770();
  v1[7] = sub_252772760();
  uint64_t v3 = sub_252772750();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25276BB34, v3, v2);
}

uint64_t sub_25276BB34()
{
  id v1 = objc_msgSend(self, sel_sharedDispatcher);
  id v2 = objc_msgSend(v1, sel_homeManager);

  if (v2)
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(id))v0[1];
    return v3(v2);
  }
  else
  {
    uint64_t v5 = (char *)v0[4];
    uint64_t v6 = OBJC_IVAR___HUScheduleAccessViewController_task;
    v0[10] = OBJC_IVAR___HUScheduleAccessViewController_task;
    uint64_t v7 = *(void *)&v5[v6];
    v0[11] = v7;
    if (v7)
    {
      uint64_t v8 = v0 + 3;
      swift_retain();
      uint64_t v9 = (void *)swift_task_alloc();
      v0[12] = v9;
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C560);
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C568);
      void *v9 = v0;
      uint64_t v12 = sub_25276BDF4;
    }
    else
    {
      uint64_t v8 = v0 + 2;
      uint64_t v13 = v0[5];
      sub_252772780();
      uint64_t v14 = sub_2527727A0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
      uint64_t v15 = v5;
      uint64_t v16 = sub_252772760();
      uint64_t v17 = (void *)swift_allocObject();
      uint64_t v18 = MEMORY[0x263F8F500];
      v17[2] = v16;
      v17[3] = v18;
      v17[4] = v15;
      uint64_t v7 = sub_25276C424(v13, (uint64_t)&unk_269C1C558, (uint64_t)v17);
      v0[14] = v7;
      *(void *)&v5[v6] = v7;
      swift_retain();
      swift_release();
      uint64_t v9 = (void *)swift_task_alloc();
      v0[15] = v9;
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C560);
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C568);
      void *v9 = v0;
      uint64_t v12 = sub_25276BFB0;
    }
    v9[1] = v12;
    uint64_t v19 = MEMORY[0x263F8E4E0];
    return MEMORY[0x270FA1FA8](v8, v7, v10, v11, v19);
  }
}

uint64_t sub_25276BDF4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(void *)(v2 + 64);
  if (v0) {
    uint64_t v5 = sub_25276C194;
  }
  else {
    uint64_t v5 = sub_25276BF30;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25276BF30()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25276BFB0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(void *)(v2 + 64);
  if (v0) {
    uint64_t v5 = sub_25276C20C;
  }
  else {
    uint64_t v5 = sub_25276C0EC;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25276C0EC()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[4];
  swift_release();
  uint64_t v3 = v0[2];
  *(void *)(v2 + v1) = 0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

uint64_t sub_25276C194()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25276C20C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[4];
  swift_release();
  *(void *)(v2 + v1) = 0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25276C2A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2527727A0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_252772790();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_25276E9A0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_252772750();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_25276C424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2527727A0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_252772790();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25276E9A0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_252772750();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C560);
  return swift_task_create();
}

void __swiftcall HUScheduleAccessViewController.init(coder:)(HUScheduleAccessViewController_optional *__return_ptr retstr, NSCoder coder)
{
}

void HUScheduleAccessViewController.init(coder:)()
{
}

void __swiftcall HUScheduleAccessViewController.init(nibName:bundle:)(HUScheduleAccessViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    uint64_t v4 = (void *)sub_2527726B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);
}

void HUScheduleAccessViewController.init(nibName:bundle:)()
{
}

Swift::Void __swiftcall HUScheduleAccessViewController.viewDidLoad()()
{
  v9.super_class = (Class)HUScheduleAccessViewController;
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  uint64_t v1 = (void *)sub_2527726B0();
  id v2 = (id)HFLocalizedString();

  if (!v2)
  {
    sub_2527726C0();
    id v2 = (id)sub_2527726B0();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v0, sel_setTitle_, v2);

  id v3 = objc_msgSend(v0, sel_view);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(self, sel_systemBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    id v6 = objc_msgSend(v0, sel_view);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = (void *)sub_2527726B0();
      objc_msgSend(v7, sel_setAccessibilityIdentifier_, v8);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_25276C9C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a1;
  v4[7] = a4;
  uint64_t v5 = sub_252772320();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  sub_252772770();
  v4[13] = sub_252772760();
  uint64_t v7 = sub_252772750();
  v4[14] = v7;
  v4[15] = v6;
  return MEMORY[0x270FA2498](sub_25276CAD8, v7, v6);
}

uint64_t sub_25276CAD8()
{
  if (qword_269C1C0B8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_269C1CE00;
  sub_252772330();
  id v2 = sub_252772310();
  os_log_type_t v3 = sub_252772800();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_25275A000, v2, v3, "HMHomeManager is nil! Attempting to load homes to create the manager!", v4, 2u);
    MEMORY[0x2533BC470](v4, -1, -1);
  }
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[9];

  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v0[16] = v8;
  v0[17] = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v5, v6);
  uint64_t v9 = self;
  v0[18] = v9;
  v0[19] = objc_msgSend(v9, sel_sharedDispatcher);
  sub_252772340();
  unint64_t v11 = v10;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[20] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_25276CC90;
  v13.n128_u64[0] = v11;
  return MEMORY[0x270F3A0B8](v13);
}

uint64_t sub_25276CC90()
{
  id v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[14];
    uint64_t v4 = v2[15];
    uint64_t v5 = sub_25276D288;
  }
  else
  {
    uint64_t v6 = (void *)v2[19];
    swift_bridgeObjectRelease();

    uint64_t v3 = v2[14];
    uint64_t v4 = v2[15];
    uint64_t v5 = sub_25276CDC0;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25276CDC0()
{
  uint64_t v37 = v0;
  uint64_t v1 = *(void **)(v0 + 144);
  swift_release();
  id v2 = objc_msgSend(v1, sel_sharedDispatcher);
  id v3 = objc_msgSend(v2, sel_homeManager);

  id v4 = (id)qword_269C1CE00;
  uint64_t v5 = *(void **)(v0 + 56);
  if (v3)
  {
    sub_252772330();
    id v6 = v5;
    uint64_t v7 = sub_252772310();
    os_log_type_t v8 = sub_252772800();
    BOOL v9 = os_log_type_enabled(v7, v8);
    unint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    uint64_t v11 = *(void *)(v0 + 88);
    uint64_t v12 = *(void **)(v0 + 56);
    uint64_t v13 = *(void *)(v0 + 64);
    if (v9)
    {
      id v35 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
      uint64_t v14 = swift_slowAlloc();
      log = v7;
      uint64_t v15 = (void *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v36 = v31;
      *(_DWORD *)uint64_t v14 = 138412546;
      *(void *)(v0 + 32) = v12;
      id v16 = v12;
      sub_252772840();
      *uint64_t v15 = v12;

      *(_WORD *)(v14 + 12) = 2080;
      *(void *)(v0 + 40) = sub_25276D854(0xD000000000000010, 0x8000000252775A10, &v36);
      sub_252772840();
      _os_log_impl(&dword_25275A000, log, v8, "%@%s Successfully created HMHomeManager!", (uint8_t *)v14, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C528);
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v15, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v31, -1, -1);
      MEMORY[0x2533BC470](v14, -1, -1);

      v35(v11, v13);
    }
    else
    {

      v10(v11, v13);
    }
  }
  else
  {
    sub_252772330();
    id v17 = v5;
    uint64_t v18 = sub_252772310();
    os_log_type_t v19 = sub_252772800();
    BOOL v20 = os_log_type_enabled(v18, v19);
    id v21 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    uint64_t v22 = *(void *)(v0 + 80);
    uint64_t v23 = *(void **)(v0 + 56);
    uint64_t v24 = *(void *)(v0 + 64);
    if (v20)
    {
      id v34 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
      uint64_t v25 = swift_slowAlloc();
      id v29 = (void *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v36 = v32;
      *(_DWORD *)uint64_t v25 = 138412546;
      *(void *)(v0 + 16) = v23;
      uint64_t v33 = v22;
      id v26 = v23;
      sub_252772840();
      *id v29 = v23;

      *(_WORD *)(v25 + 12) = 2080;
      *(void *)(v0 + 24) = sub_25276D854(0xD000000000000010, 0x8000000252775A10, &v36);
      sub_252772840();
      _os_log_impl(&dword_25275A000, v18, v19, "%@%s HMHomeManager is still nil! Unexpected!", (uint8_t *)v25, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C528);
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v29, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2533BC470](v32, -1, -1);
      MEMORY[0x2533BC470](v25, -1, -1);

      v34(v33, v24);
    }
    else
    {

      v21(v22, v24);
    }
  }
  **(void **)(v0 + 48) = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v27 = *(uint64_t (**)(void))(v0 + 8);
  return v27();
}

uint64_t sub_25276D288()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25276D388(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2527728F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25276DFC8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x2533BBB60](i, a1);
        sub_25276EBE8(0, &qword_269C1C580);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25276DFC8(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_25276DFC8(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_25276EC8C(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      os_log_type_t v8 = (id *)(a1 + 32);
      sub_25276EBE8(0, &qword_269C1C580);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25276DFC8(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_25276DFC8(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_25276EC8C(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_25276D5EC(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C590);
  uint64_t v10 = *(void *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2527728D0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25276E6A4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_25276D854(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25276D928(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25276E8F8((uint64_t)v12, *a3);
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
      sub_25276E8F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25276D928(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_252772850();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25276DAE4(a5, a6);
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
  uint64_t v8 = sub_2527728C0();
  if (!v8)
  {
    sub_2527728D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_252772900();
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

uint64_t sub_25276DAE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25276DB7C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25276DD5C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25276DD5C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25276DB7C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25276DCF4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2527728A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2527728D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_252772700();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_252772900();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2527728D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25276DCF4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C538);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25276DD5C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C538);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_252772900();
  __break(1u);
  return result;
}

uint64_t sub_25276DEAC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_252772870();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_3:
  if (v2 <= 0)
  {
    unint64_t v3 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C570);
    unint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25276E398(&v8, v3 + 4, v2, a1);
  uint64_t result = sub_25276EC9C();
  if (v6 == (void *)v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_25276DFA8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25276DFE8(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_25276DFC8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25276E228(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25276DFE8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C590);
  uint64_t v10 = *(void *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  os_log_type_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  id v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_252772900();
  __break(1u);
  return result;
}

uint64_t sub_25276E228(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C598);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_252772900();
  __break(1u);
  return result;
}

void *sub_25276E398(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  unint64_t v6 = a2;
  int64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_252772860();
    sub_25276EBE8(0, &qword_269C1C580);
    sub_25276EC24();
    uint64_t result = (void *)sub_2527727E0();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    uint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    void *v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  uint64_t v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_252772880()) {
        goto LABEL_45;
      }
      sub_25276EBE8(0, &qword_269C1C580);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      BOOL v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    BOOL v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_25276E6A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_252772900();
  __break(1u);
  return result;
}

void sub_25276E7FC()
{
  uint64_t v1 = &v0[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *(void *)&v0[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = 0;
  *(void *)&v0[OBJC_IVAR___HUScheduleAccessViewController_task] = 0;

  sub_252772890();
  swift_bridgeObjectRelease();
  sub_2527728E0();
  __break(1u);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25276E8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25276E958(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25276E9A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1C510);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25276EA00()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25276EA40(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *int64_t v7 = v2;
  v7[1] = sub_25276EAF4;
  return sub_25276C9C8(a1, v4, v5, v6);
}

uint64_t sub_25276EAF4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25276EBE8(uint64_t a1, unint64_t *a2)
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

unint64_t sub_25276EC24()
{
  unint64_t result = qword_269C1C588;
  if (!qword_269C1C588)
  {
    sub_25276EBE8(255, &qword_269C1C580);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1C588);
  }
  return result;
}

_OWORD *sub_25276EC8C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25276EC9C()
{
  return swift_release();
}

uint64_t sub_25276ECA8()
{
  sub_25276ED08();
  uint64_t result = sub_252772820();
  qword_269C1CE00 = result;
  return result;
}

unint64_t sub_25276ED08()
{
  unint64_t result = qword_269C1C5A0;
  if (!qword_269C1C5A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C1C5A0);
  }
  return result;
}

unint64_t sub_25276ED48()
{
  unint64_t result = sub_25276ED6C();
  qword_269C1C5A8 = result;
  unk_269C1C5B0 = v1;
  return result;
}

unint64_t sub_25276ED6C()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_redColor);
  uint64_t v3 = 0;
  v4[0] = 0;
  uint64_t v2 = 0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v4, &v3, &v2, 0);
  sub_252772890();
  swift_bridgeObjectRelease();
  sub_2527727C0();
  sub_2527726F0();
  swift_bridgeObjectRelease();
  sub_2527726F0();
  sub_2527727C0();
  sub_2527726F0();
  swift_bridgeObjectRelease();
  sub_2527726F0();
  sub_2527727C0();
  sub_2527726F0();

  swift_bridgeObjectRelease();
  return 0xD000000000000017;
}

uint64_t static PlatformCanary.tweet.getter()
{
  if (qword_269C1C0C0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_269C1C5A8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static PlatformCanary.isMacBuild.getter()
{
  return 0;
}

id PlatformCanary.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PlatformCanary.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlatformCanary();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for PlatformCanary()
{
  return self;
}

id PlatformCanary.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlatformCanary();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25276F048()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id HUIconImageNamed(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v6 = &stru_2702C0AF0;
  int64_t v7 = &stru_2702C0AF0;
  if (a2 <= 5) {
    int64_t v7 = off_265381118[a2];
  }
  if (a3 != 1) {
    uint64_t v6 = @"-vibrant";
  }
  uint64_t v8 = v6;
  uint64_t v9 = [NSString stringWithFormat:@"%@%@%@", v5, v8, v7, v17, 3221225472, __HUIconImageNamed_block_invoke, &__block_descriptor_40_e15___NSString_8__0l, a2];
  uint64_t v10 = HUCommonNullableImageNamed(v9);
  if (!v10)
  {
    unint64_t v11 = [v5 stringByAppendingString:v7];
    uint64_t v10 = HUCommonNullableImageNamed(v11);

    if (!v10)
    {
      unint64_t v12 = [v5 stringByAppendingString:v8];
      uint64_t v10 = HUCommonNullableImageNamed(v12);

      if (!v10)
      {
        uint64_t v10 = HUCommonNullableImageNamed(v5);
        if (!v10)
        {
          uint64_t v13 = *MEMORY[0x263F47948];
          if ([v5 isEqualToString:*MEMORY[0x263F47948]])
          {
            BOOL v15 = [MEMORY[0x263F08690] currentHandler];
            int64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "UIImage * _Nonnull HUIconImageNamed(NSString *__strong _Nonnull, HUIconSize, HUIconDisplayStyle)");
            [v15 handleFailureInFunction:v16 file:@"HUIconDefines.m" lineNumber:42 description:@"No generic fallback icon found"];
          }
          uint64_t v10 = HUIconImageNamed(v13, a2, a3);
        }
      }
    }
  }

  return v10;
}

id HUCommonBundle()
{
  if (qword_26B22BA68 != -1) {
    dispatch_once(&qword_26B22BA68, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)qword_26B22BA60;
  return v0;
}

uint64_t __HUCommonBundle_block_invoke()
{
  qword_26B22BA60 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

id HUCommonImageNamed(void *a1)
{
  id v1 = a1;
  objc_super v2 = HUCommonNullableImageNamed(v1);
  if (!v2) {
    NSLog(&cfstr_MissingImage.isa, v1);
  }

  return v2;
}

id HUCommonNullableImageNamed(void *a1)
{
  id v1 = a1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  uint64_t v9 = __HUCommonNullableImageNamed_block_invoke;
  uint64_t v10 = &unk_2653812D0;
  id v11 = v1;
  id v2 = v11;
  uint64_t v3 = v8;
  if (qword_26B22BA70 != -1) {
    dispatch_once(&qword_26B22BA70, &__block_literal_global_13);
  }
  if (_MergedGlobals_7)
  {
    uint64_t v4 = [NSString stringWithFormat:@"HomeUICommon_%@", v2];
    id v5 = [MEMORY[0x263F791A8] systemAppPersistenteCache];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    _OWORD v12[2] = ___HUCommonLoadCachedImageWithGenerationBlock_block_invoke;
    uint64_t v12[3] = &unk_2653812F8;
    uint64_t v13 = v3;
    uint64_t v6 = [v5 imageForKey:v4 generatingIfNecessaryWithBlock:v12];
  }
  else
  {
    uint64_t v6 = v9((uint64_t)v3);
  }

  return v6;
}

id __HUCommonNullableImageNamed_block_invoke(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = HUCommonBundle();
  uint64_t v4 = [v1 imageNamed:v2 inBundle:v3 compatibleWithTraitCollection:0];

  return v4;
}

uint64_t sub_2527722C0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2527722D0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2527722E0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2527722F0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_252772300()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_252772310()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_252772320()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252772330()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_252772340()
{
  return MEMORY[0x270F3A0A8]();
}

uint64_t sub_252772350()
{
  return MEMORY[0x270F05E48]();
}

uint64_t sub_252772360()
{
  return MEMORY[0x270F05E50]();
}

uint64_t sub_252772370()
{
  return MEMORY[0x270F05E58]();
}

uint64_t sub_252772380()
{
  return MEMORY[0x270F05E60]();
}

uint64_t sub_252772390()
{
  return MEMORY[0x270F05E68]();
}

uint64_t sub_2527723A0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2527723B0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2527723C0()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2527723D0()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_2527723E0()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_2527723F0()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_252772400()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_252772410()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_252772420()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_252772430()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_252772440()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_252772450()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_252772470()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_252772480()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_252772490()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_2527724A0()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_2527724B0()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_2527724C0()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_2527724E0()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_2527724F0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_252772500()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_252772510()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_252772520()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_252772530()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_252772540()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_252772550()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_252772560()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_252772570()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_252772580()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_252772590()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_2527725A0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2527725B0()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2527725C0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2527725D0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2527725E0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2527725F0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_252772600()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_252772610()
{
  return MEMORY[0x270F03D40]();
}

uint64_t sub_252772620()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_252772630()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_252772640()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_252772650()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_252772660()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_252772670()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_252772680()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_252772690()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2527726A0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2527726B0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2527726C0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2527726D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2527726E0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2527726F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_252772700()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_252772710()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_252772720()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_252772730()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_252772740()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_252772750()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_252772760()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_252772770()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_252772780()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_252772790()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2527727A0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2527727C0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_2527727D0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_2527727E0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_2527727F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252772800()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_252772820()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_252772830()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_252772840()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_252772850()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_252772860()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_252772870()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_252772880()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_252772890()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2527728A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2527728B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2527728C0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2527728D0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2527728E0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2527728F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_252772900()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_252772910()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_252772920()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_252772930()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_252772940()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_252772950()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_252772960()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_252772970()
{
  return MEMORY[0x270FA0128]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x270EE9A80]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x270EE9C30]();
}

uint64_t HFLocalizedString()
{
  return MEMORY[0x270F3A100]();
}

uint64_t HFLogForCategory()
{
  return MEMORY[0x270F3A108]();
}

uint64_t HFVibrantStateForHFCAPackageState()
{
  return MEMORY[0x270F3A118]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x270F061E0]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F061F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIScaleTransformForAspectFitOfSizeInTargetSize()
{
  return MEMORY[0x270F063A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}