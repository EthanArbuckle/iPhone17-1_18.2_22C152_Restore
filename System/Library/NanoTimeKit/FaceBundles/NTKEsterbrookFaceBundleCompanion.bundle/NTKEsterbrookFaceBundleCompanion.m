uint64_t sub_246A82F60()
{
  uint64_t vars8;

  qword_2691C1EF0 = _EnumValueRange();

  return MEMORY[0x270F9A758]();
}

void sub_246A830A4(uint64_t a1, const char *a2)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26FB08E20;
  v4[1] = &unk_26FB08E38;
  v5[0] = @"daily";
  v5[1] = @"sunday";
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 2);
  v3 = (void *)qword_2691C1F10;
  qword_2691C1F10 = v2;
}

uint64_t sub_246A83238()
{
  qword_2691C1F20 = _EnumValueRange();

  return MEMORY[0x270F9A758]();
}

void sub_246A83374(uint64_t a1, const char *a2)
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26FB08E50;
  v4[1] = &unk_26FB08E68;
  v5[0] = @"none";
  v5[1] = @"ticks";
  void v4[2] = &unk_26FB08E80;
  v4[3] = &unk_26FB08E98;
  v5[2] = @"numerals-i";
  void v5[3] = @"numerals-ii";
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 4);
  v3 = (void *)qword_2691C1F40;
  qword_2691C1F40 = v2;
}

void sub_246A840C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_246A840E8(uint64_t a1, void *a2, id *a3)
{
  id v10 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend_layoutForDateChange(WeakRetained[109], v6, v7, v8);
  }
}

void sub_246A8415C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_246A84170()
{
  return @"esterbrook face view s";
}

void type metadata accessor for NTKFaceDataMode(uint64_t a1)
{
}

__n128 initializeBufferWithCopyOfBuffer for Placement.Point(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Placement.Point(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Placement.Point(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGImage(uint64_t a1)
{
}

void type metadata accessor for NTKEsterbrookDensity(uint64_t a1)
{
}

uint64_t sub_246A84EBC()
{
  return sub_246A85318(&qword_2691C02D8, type metadata accessor for NTKEsterbrookDensity);
}

BOOL sub_246A84F04(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_246A84F18(uint64_t a1, uint64_t a2)
{
  return sub_246A85084(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_246A84F30(uint64_t a1, id *a2)
{
  uint64_t result = sub_246AD8B90();
  *a2 = 0;
  return result;
}

uint64_t sub_246A84FA8(uint64_t a1, id *a2)
{
  char v3 = sub_246AD8BA0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_246A85028@<X0>(uint64_t *a1@<X8>)
{
  sub_246AD8BB0();
  uint64_t v2 = sub_246AD8B80();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_246A8506C(uint64_t a1, uint64_t a2)
{
  return sub_246A85084(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_246A85084(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_246AD8BB0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_246A850C8()
{
  sub_246AD8BB0();
  sub_246AD8BE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_246A8511C()
{
  sub_246AD8BB0();
  sub_246AD9100();
  sub_246AD8BE0();
  uint64_t v0 = sub_246AD9140();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_246A85190()
{
  swift_getWitnessTable();

  return sub_246AD8A80();
}

void *sub_246A851FC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_246A8520C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_246A85218()
{
  return sub_246AD9140();
}

uint64_t sub_246A85260()
{
  return sub_246AD9110();
}

uint64_t sub_246A8528C()
{
  return sub_246AD9140();
}

uint64_t sub_246A852D0()
{
  return sub_246A85318(&qword_2691C02E0, type metadata accessor for CGImage);
}

uint64_t sub_246A85318(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_246A85360(void *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_246A85368@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_246A85374()
{
  return sub_246AD8AA0();
}

uint64_t sub_246A853C0()
{
  return sub_246AD8A90();
}

uint64_t sub_246A85418()
{
  return sub_246A8572C();
}

uint64_t sub_246A85430()
{
  uint64_t v0 = sub_246AD8BB0();
  uint64_t v2 = v1;
  if (v0 == sub_246AD8BB0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_246AD9060();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_246A854BC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_246A854C8(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_246A854D4()
{
  swift_getWitnessTable();

  return sub_246AD8A80();
}

uint64_t sub_246A85540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_246AD8B80();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_246A85588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_246AD8BB0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_246A855B4(uint64_t a1)
{
  uint64_t v2 = sub_246A85318(&qword_2691C03A0, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_246A85318(&qword_2691C03A8, type metadata accessor for URLResourceKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_246A85670()
{
  return sub_246AD8AA0();
}

uint64_t sub_246A856BC()
{
  return sub_246AD8A90();
}

uint64_t sub_246A85714()
{
  return sub_246A8572C();
}

uint64_t sub_246A8572C()
{
  return sub_246AD9140();
}

uint64_t sub_246A85790()
{
  return sub_246A85318(&qword_2691C02E8, type metadata accessor for CGImage);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for Atlas(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_246A85848(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_246A85854(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_246A85874(uint64_t result, int a2, int a3)
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

void sub_246A858C8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_246A85910()
{
  return sub_246A85318(&qword_2691C0378, type metadata accessor for URLResourceKey);
}

uint64_t sub_246A85958()
{
  return sub_246A85318(&qword_2691C0380, type metadata accessor for URLResourceKey);
}

uint64_t sub_246A859A0()
{
  return sub_246A85318(&qword_2691C0388, type metadata accessor for URLResourceKey);
}

uint64_t sub_246A859E8()
{
  return sub_246A85318(&qword_2691C0390, type metadata accessor for CFString);
}

uint64_t sub_246A85A30()
{
  return sub_246A85318(&qword_2691C0398, type metadata accessor for CFString);
}

BOOL sub_246A85A8C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_246A85AA0()
{
  return sub_246AD9140();
}

uint64_t sub_246A85AE8()
{
  return sub_246AD9110();
}

uint64_t sub_246A85B14()
{
  return sub_246AD9140();
}

uint64_t sub_246A85B58()
{
  sub_246A85F9C(v0 + 120);
  uint64_t v1 = v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneScorer_date;
  uint64_t v2 = sub_246AD8980();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_246A85FEC(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneScorer_result);
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_246A85BEC()
{
  return type metadata accessor for SceneScorer();
}

uint64_t type metadata accessor for SceneScorer()
{
  uint64_t result = qword_2691C0418;
  if (!qword_2691C0418) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_246A85C40()
{
  sub_246AD8980();
  if (v0 <= 0x3F)
  {
    sub_246A85D2C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_246A85D2C()
{
  if (!qword_2691C0428)
  {
    type metadata accessor for Scene();
    unint64_t v0 = sub_246AD8D80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2691C0428);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for SceneScorer.State(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SceneScorer.State(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SceneScorer.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x246A85EECLL);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_246A85F14(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_246A85F20(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SceneScorer.State()
{
  return &type metadata for SceneScorer.State;
}

unint64_t sub_246A85F3C()
{
  unint64_t result = qword_2691C0430;
  if (!qword_2691C0430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0430);
  }
  return result;
}

uint64_t sub_246A85F90()
{
  return v0;
}

uint64_t sub_246A85F9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_246A85FEC(uint64_t a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C12E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246A8604C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_246A8611C(void *a1, double a2, double a3, double a4, double a5)
{
  *(_OWORD *)&v5[OBJC_IVAR___NTKEsterbrookSceneDialView_hours] = xmmword_246ADC880;
  uint64_t v11 = OBJC_IVAR___NTKEsterbrookSceneDialView_hourLayers;
  *(void *)&v5[v11] = sub_246ACF330(MEMORY[0x263F8EE78]);
  *(void *)&v5[OBJC_IVAR___NTKEsterbrookSceneDialView_density] = 0;
  *(void *)&v5[OBJC_IVAR___NTKEsterbrookSceneDialView_tritiumProgress] = 0;
  v12 = v5;
  id v13 = a1;
  sub_246AC6EC8(v13, (uint64_t)v19);
  v14 = &v12[OBJC_IVAR___NTKEsterbrookSceneDialView_layout];
  long long v15 = v19[1];
  *(_OWORD *)v14 = v19[0];
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v19[2];
  *((void *)v14 + 6) = v20;

  v18.receiver = v12;
  v18.super_class = (Class)type metadata accessor for SceneDialView();
  id v16 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a2, a3, a4, a5);
  sub_246A862B8();

  return v16;
}

void sub_246A862B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = self;
  objc_msgSend(v2, sel_begin);
  uint64_t v3 = 1;
  id v21 = v2;
  objc_msgSend(v2, sel_setDisableActions_, 1);
  id v4 = sub_246A874C4();
  id v22 = objc_msgSend(v4, sel_CGColor);

  uint64_t v5 = &v1[OBJC_IVAR___NTKEsterbrookSceneDialView_hourLayers];
  uint64_t v6 = *(void *)&v1[OBJC_IVAR___NTKEsterbrookSceneDialView_layout + 24];
  uint64_t v7 = OBJC_IVAR___NTKEsterbrookSceneDialView_density;
  do
  {
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
    sub_246A8604C(&qword_2691C0468);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_246ADC890;
    *(void *)(inited + 32) = 0x73646E756F62;
    *(void *)(inited + 40) = 0xE600000000000000;
    *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    *(void *)(inited + 56) = 0x73746E65746E6F63;
    *(void *)(inited + 64) = 0xE800000000000000;
    *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    *(void *)(inited + 80) = 0xD000000000000015;
    *(void *)(inited + 88) = 0x8000000246ADAB00;
    *(void *)(inited + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    *(void *)(inited + 104) = 0x656D617266;
    *(void *)(inited + 112) = 0xE500000000000000;
    *(void *)(inited + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    *(void *)(inited + 128) = 0x7974696361706FLL;
    *(void *)(inited + 136) = 0xE700000000000000;
    *(void *)(inited + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    *(void *)(inited + 152) = 0x6E6F697469736F70;
    *(void *)(inited + 160) = 0xE800000000000000;
    *(void *)(inited + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    sub_246AC72C4(inited);
    sub_246A8604C(&qword_2691C0470);
    id v16 = (void *)sub_246AD8B40();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setActions_, v16);

    double v17 = 0.0;
    if (*(void *)(v6 + 16))
    {
      uint64_t v18 = sub_246ACBDC8(*(void *)&v1[v7]);
      double v8 = 0.0;
      double v9 = 0.0;
      double v10 = 0.0;
      if (v19)
      {
        uint64_t v20 = (double *)(*(void *)(v6 + 56) + 32 * v18);
        double v9 = *v20;
        double v10 = v20[1];
        double v17 = v20[2];
        double v8 = v20[3];
      }
    }
    else
    {
      double v8 = 0.0;
      double v9 = 0.0;
      double v10 = 0.0;
    }
    objc_msgSend(v14, sel_setFrame_, v9, v10, v17, v8);
    objc_msgSend(v14, sel_setContentsMultiplyColor_, v22);
    objc_msgSend(v14, sel_setPosition_, sub_246AC624C(v3, *(void *)&v1[v7]));
    id v11 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v11, sel_addSublayer_, v14);

    swift_beginAccess();
    id v12 = v14;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v23 = *(void *)v5;
    *(void *)uint64_t v5 = 0x8000000000000000;
    sub_246ACDBE8((uint64_t)v12, v3, isUniquelyReferenced_nonNull_native);
    *(void *)uint64_t v5 = v23;
    swift_bridgeObjectRelease();
    swift_endAccess();

    ++v3;
  }
  while (v3 != 13);
  objc_msgSend(v21, sel_commit);
}

void sub_246A866AC(uint64_t a1, uint64_t a2, double a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(v62 + OBJC_IVAR___NTKEsterbrookSceneDialView_layout + 32);
    double v7 = *(double *)(v62 + OBJC_IVAR___NTKEsterbrookSceneDialView_layout + 40);
    double v8 = *(double *)(v62 + OBJC_IVAR___NTKEsterbrookSceneDialView_layout + 48);
    double v10 = self;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v64 = v6;
    swift_bridgeObjectRetain();
    objc_msgSend(v10, sel_begin);
    uint64_t v11 = 1;
    id v57 = v10;
    objc_msgSend(v10, sel_setDisableActions_, 1);
    id v12 = (uint64_t *)(v62 + OBJC_IVAR___NTKEsterbrookSceneDialView_hourLayers);
    uint64_t v61 = OBJC_IVAR___NTKEsterbrookSceneDialView_tritiumProgress;
    swift_beginAccess();
    BOOL v13 = a3 < 0.5;
    if (a3 > 1.0) {
      BOOL v13 = 1;
    }
    double v14 = 0.0;
    if ((a1 | (unint64_t)a2) > 1) {
      BOOL v13 = 1;
    }
    BOOL v60 = v13;
    if ((a1 | (unint64_t)a2) > 1) {
      double v14 = 1.0;
    }
    double v59 = v14;
    unint64_t v15 = 0x263F82000;
    id v16 = &selRef_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_;
    double v17 = &selRef_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_;
    uint64_t v18 = &selRef_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_;
    v58 = v12;
    while (1)
    {
      uint64_t v22 = *v12;
      if (!*(void *)(*v12 + 16)) {
        goto LABEL_16;
      }
      unint64_t v23 = sub_246ACBDCC(v11);
      if ((v24 & 1) == 0) {
        goto LABEL_16;
      }
      id v25 = *(id *)(*(void *)(v22 + 56) + 8 * v23);
      sub_246AC3AE4();
      objc_msgSend(v25, sel_setFrame_);
      id v26 = sub_246A87918(v11, a1, a2, a3);
      v27 = v26;
      if (v26)
      {
        id v28 = objc_msgSend(v26, sel_CGImage);

        if (v28)
        {
          type metadata accessor for CGImage(0);
          v27 = (void *)sub_246AD9040();
        }
        else
        {
          v27 = 0;
        }
        unint64_t v15 = 0x263F82000uLL;
      }
      objc_msgSend(v25, sel_setContents_, v27);
      swift_unknownObjectRelease();
      double v29 = *(double *)(v62 + v61);
      if (v29 == 0.0)
      {
        id v30 = objc_msgSend(objc_allocWithZone(*(Class *)(v15 + 1480)), sel_initWithRed_green_blue_alpha_, 0.0, 0.0, 0.0, 1.0);
      }
      else
      {
        v31 = v18;
        v32 = v17;
        v33 = v16;
        id v34 = objc_allocWithZone(*(Class *)(v15 + 1480));
        if (v29 == 1.0)
        {
          id v30 = objc_msgSend(v34, sel_initWithRed_green_blue_alpha_, 0.8, 0.8, 0.8, 1.0);
        }
        else
        {
          id v35 = objc_msgSend(v34, sel_initWithRed_green_blue_alpha_, 0.0, 0.0, 0.0, 1.0);
          id v36 = objc_msgSend(objc_allocWithZone(*(Class *)(v15 + 1480)), sel_initWithRed_green_blue_alpha_, 0.8, 0.8, 0.8, 1.0);
          id v37 = (id)CLKUIInterpolateBetweenColors();
          if (!v37)
          {
            __break(1u);
            return;
          }
          id v30 = v37;

          id v12 = v58;
        }
        id v16 = v33;
        double v17 = v32;
        uint64_t v18 = v31;
      }
      id v38 = [v30 v16[155]];

      objc_msgSend(v25, v17[156], v38);
      double v39 = v59;
      if (!v60)
      {
        CLKCompressFraction();
        sub_246AD8A70();
      }
      *(float *)&double v39 = v39;
      objc_msgSend(v25, v18[165], v39);
      double v40 = v8;
      double v41 = v7;
      double v42 = v7;
      double v43 = v8;
      unint64_t v15 = 0x263F82000;
      if (*(void *)(v64 + 16))
      {
        uint64_t v44 = sub_246ACBDC8(a1);
        double v41 = v7;
        double v40 = v8;
        if (v45)
        {
          uint64_t v46 = *(void *)(*(void *)(v64 + 56) + 8 * v44);
          double v41 = v7;
          double v40 = v8;
          if (*(void *)(v46 + 16))
          {
            unint64_t v47 = sub_246ACBDCC(v11);
            double v41 = v7;
            double v40 = v8;
            if (v48)
            {
              v49 = (double *)(*(void *)(v46 + 56) + 16 * v47);
              double v41 = *v49;
              double v40 = v49[1];
            }
          }
        }
        if (*(void *)(v64 + 16)
          && (uint64_t v50 = sub_246ACBDC8(a2), (v51 & 1) != 0)
          && (uint64_t v52 = *(void *)(*(void *)(v64 + 56) + 8 * v50), *(void *)(v52 + 16))
          && (unint64_t v53 = sub_246ACBDCC(v11), (v54 & 1) != 0))
        {
          v55 = (double *)(*(void *)(v52 + 56) + 16 * v53);
          double v42 = *v55;
          double v43 = v55[1];
        }
        else
        {
          double v42 = v7;
          double v43 = v8;
        }
      }
      if (a1 != 2) {
        break;
      }
      if (a2 == 1) {
        goto LABEL_13;
      }
      double v19 = 1.0;
      if (a2 == 3)
      {
        sub_246AD8D60();
        double v20 = v56;
        goto LABEL_15;
      }
LABEL_14:
      double v20 = v7 + (v42 - v7) * v19;
      double v21 = v8 + (v43 - v8) * v19;
LABEL_15:
      objc_msgSend(v25, sel_setPosition_, v20, v21);

LABEL_16:
      if (++v11 == 13)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        objc_msgSend(v57, sel_commit);
        return;
      }
    }
    double v19 = 1.0;
    if (a2 == 2)
    {
      if (a1 != 1) {
        goto LABEL_14;
      }
      if (qword_2691C0298 != -1) {
        swift_once();
      }
      if (*(double *)&xmmword_2691D4160 <= a3 && *((double *)&xmmword_2691D4160 + 1) >= a3)
      {
        CLKMapFractionIntoRange();
        double v43 = v40;
        double v42 = v41;
        goto LABEL_14;
      }
    }
    else if (a2 != 1)
    {
      goto LABEL_14;
    }
LABEL_13:
    sub_246AD8A70();
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)(v62 + OBJC_IVAR___NTKEsterbrookSceneDialView_density);
  *(void *)(v62 + OBJC_IVAR___NTKEsterbrookSceneDialView_density) = a1;
  if (v3 != a1)
  {
    sub_246A86DA8(a1);
  }
}

void sub_246A86DA8(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = (uint64_t *)(v1 + OBJC_IVAR___NTKEsterbrookSceneDialView_hourLayers);
  uint64_t v5 = v1 + OBJC_IVAR___NTKEsterbrookSceneDialView_layout;
  uint64_t v6 = OBJC_IVAR___NTKEsterbrookSceneDialView_tritiumProgress;
  swift_beginAccess();
  uint64_t v7 = 1;
  unint64_t v47 = a1 - 1;
  unint64_t v8 = 0x263F82000;
  double v9 = &selRef_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_;
  uint64_t v46 = a1;
  while (1)
  {
    uint64_t v11 = *v4;
    if (*(void *)(*v4 + 16))
    {
      unint64_t v12 = sub_246ACBDCC(v7);
      if (v13) {
        break;
      }
    }
LABEL_4:
    if (++v7 == 13) {
      return;
    }
  }
  double v14 = *(void **)(*(void *)(v11 + 56) + 8 * v12);
  uint64_t v15 = *(void *)(v5 + 24);
  double v16 = 0.0;
  if (*(void *)(v15 + 16))
  {
    uint64_t v17 = sub_246ACBDC8(a1);
    double v18 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
    if (v21)
    {
      uint64_t v22 = (double *)(*(void *)(v15 + 56) + 32 * v17);
      double v19 = *v22;
      double v20 = v22[1];
      double v16 = v22[2];
      double v18 = v22[3];
    }
  }
  else
  {
    double v18 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
  }
  id v23 = v14;
  objc_msgSend(v23, sel_setFrame_, v19, v20, v16, v18);
  if (v47 >= 3)
  {
    id v29 = 0;
  }
  else
  {
    uint64_t v24 = v2;
    uint64_t v25 = v6;
    sub_246AD8DF0();
    swift_bridgeObjectRelease();
    sub_246AD8BF0();
    swift_bridgeObjectRelease();
    sub_246AD8BF0();
    sub_246A8604C(&qword_2691C0460);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_246ADC8A0;
    *(void *)(v26 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v26 + 64) = MEMORY[0x263F8D750];
    *(void *)(v26 + 32) = v7;
    sub_246AD8BC0();
    sub_246AD8BF0();
    swift_bridgeObjectRelease();
    type metadata accessor for SceneLoader();
    id v27 = sub_246A93A20();
    id v28 = (void *)sub_246AD8B80();
    swift_bridgeObjectRelease();
    id v29 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v28, v27, 0);

    if (v29)
    {
      id v30 = objc_msgSend(v29, sel_imageWithRenderingMode_, 2);

      uint64_t v6 = v25;
      unint64_t v8 = 0x263F82000uLL;
      if (v30)
      {
        id v29 = objc_msgSend(v30, sel_CGImage);

        uint64_t v2 = v24;
        if (v29)
        {
          v49 = v29;
          type metadata accessor for CGImage(0);
          id v29 = (id)sub_246AD9040();
        }
      }
      else
      {
        id v29 = 0;
        uint64_t v2 = v24;
      }
      a1 = v46;
    }
    else
    {
      uint64_t v6 = v25;
      uint64_t v2 = v24;
      a1 = v46;
      unint64_t v8 = 0x263F82000;
    }
    double v9 = &selRef_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_;
  }
  objc_msgSend(v23, sel_setContents_, v29);
  swift_unknownObjectRelease();
  double v31 = *(double *)(v2 + v6);
  if (v31 == 0.0)
  {
    id v32 = objc_msgSend(objc_allocWithZone(*(Class *)(v8 + 1480)), v9[154], 0.0, 0.0, 0.0, 1.0);
LABEL_25:
    id v35 = v32;
LABEL_26:
    id v36 = objc_msgSend(v35, sel_CGColor);

    objc_msgSend(v23, sel_setContentsMultiplyColor_, v36);
    uint64_t v37 = *(void *)(v5 + 32);
    long long v10 = *(_OWORD *)(v5 + 40);
    if (*(void *)(v37 + 16))
    {
      long long v48 = *(_OWORD *)(v5 + 40);
      uint64_t v38 = sub_246ACBDC8(a1);
      double v9 = &selRef_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_;
      if ((v39 & 1) != 0 && (uint64_t v40 = *(void *)(*(void *)(v37 + 56) + 8 * v38), *(void *)(v40 + 16)))
      {
        unint64_t v41 = sub_246ACBDCC(v7);
        long long v10 = v48;
        if (v42) {
          long long v10 = *(_OWORD *)(*(void *)(v40 + 56) + 16 * v41);
        }
      }
      else
      {
        long long v10 = v48;
      }
    }
    else
    {
      double v9 = &selRef_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_;
    }
    objc_msgSend(v23, sel_setPosition_, v10);

    goto LABEL_4;
  }
  id v33 = objc_allocWithZone(*(Class *)(v8 + 1480));
  id v34 = v9[154];
  if (v31 == 1.0)
  {
    id v32 = objc_msgSend(v33, v34, 0.8, 0.8, 0.8, 1.0);
    goto LABEL_25;
  }
  id v43 = objc_msgSend(v33, v34, 0.0, 0.0, 0.0, 1.0);
  id v44 = objc_msgSend(objc_allocWithZone(*(Class *)(v8 + 1480)), v9[154], 0.8, 0.8, 0.8, 1.0);
  id v45 = (id)CLKUIInterpolateBetweenColors();
  if (v45)
  {
    id v35 = v45;

    unint64_t v8 = 0x263F82000;
    goto LABEL_26;
  }
  __break(1u);
}

id sub_246A87328()
{
  id v1 = sub_246A874C4();
  id v2 = objc_msgSend(v1, sel_CGColor);

  uint64_t v3 = (uint64_t *)(v0 + OBJC_IVAR___NTKEsterbrookSceneDialView_hourLayers);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v4 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v14 >= v9) {
      goto LABEL_21;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v9) {
        goto LABEL_21;
      }
      unint64_t v15 = *(void *)(v5 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v9) {
          goto LABEL_21;
        }
        unint64_t v15 = *(void *)(v5 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_5:
    id result = objc_msgSend(*(id *)(*(void *)(v4 + 56) + 8 * v13), sel_setContentsMultiplyColor_, v2);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v9)
  {
LABEL_21:

    return (id)swift_release();
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v9) {
      goto LABEL_21;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

id sub_246A874C4()
{
  double v1 = *(double *)(v0 + OBJC_IVAR___NTKEsterbrookSceneDialView_tritiumProgress);
  if (v1 == 0.0)
  {
    id v2 = objc_allocWithZone(MEMORY[0x263F825C8]);
    double v3 = 0.0;
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 1.0;
  }
  else
  {
    id v2 = objc_allocWithZone(MEMORY[0x263F825C8]);
    if (v1 != 1.0)
    {
      id v8 = objc_msgSend(v2, sel_initWithRed_green_blue_alpha_, 0.0, 0.0, 0.0, 1.0);
      id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.8, 0.8, 0.8, 1.0);
      id result = (id)CLKUIInterpolateBetweenColors();
      if (result)
      {
        id v10 = result;

        return v10;
      }
      else
      {
        __break(1u);
      }
      return result;
    }
    double v3 = 0.8;
    double v6 = 1.0;
    double v4 = 0.8;
    double v5 = 0.8;
  }

  return objc_msgSend(v2, sel_initWithRed_green_blue_alpha_, v3, v4, v5, v6);
}

id sub_246A87634()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDialView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SceneDialView()
{
  return self;
}

uint64_t sub_246A87714(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) > 2) {
    return 0;
  }
  v9[6] = v2;
  v9[7] = v3;
  sub_246AD8DF0();
  swift_bridgeObjectRelease();
  strcpy((char *)v9, "hour-density-");
  HIWORD(v9[1]) = -4864;
  sub_246AD8BF0();
  swift_bridgeObjectRelease();
  sub_246AD8BF0();
  sub_246A8604C(&qword_2691C0460);
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v5 + 16) = xmmword_246ADC8A0;
  uint64_t v7 = MEMORY[0x263F8D750];
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = v7;
  *(void *)(v5 + 32) = a1;
  sub_246AD8BC0();
  sub_246AD8BF0();
  swift_bridgeObjectRelease();
  return v9[0];
}

id sub_246A8784C(uint64_t a1, uint64_t a2)
{
  sub_246A87714(a1, a2);
  if (!v2) {
    return 0;
  }
  type metadata accessor for SceneLoader();
  id v3 = sub_246A93A20();
  double v4 = (void *)sub_246AD8B80();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v4, v3, 0);

  if (!v5) {
    return 0;
  }
  id v6 = objc_msgSend(v5, sel_imageWithRenderingMode_, 2);

  return v6;
}

id sub_246A87918(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  if (a2 == 2)
  {
    if (a3 == 3)
    {
      if (qword_2691C02A0 != -1) {
        swift_once();
      }
      if (*(double *)&xmmword_2691D4170 > a4 || *((double *)&xmmword_2691D4170 + 1) < a4)
      {
        uint64_t v7 = a1;
        uint64_t v8 = 3;
        goto LABEL_26;
      }
LABEL_25:
      uint64_t v7 = a1;
      uint64_t v8 = 2;
      goto LABEL_26;
    }
  }
  else if (a2 == 1 && a3 == 2)
  {
    if (qword_2691C0298 != -1) {
      swift_once();
    }
    if (*(double *)&xmmword_2691D4160 <= a4 && *((double *)&xmmword_2691D4160 + 1) >= a4)
    {
      uint64_t v7 = a1;
      uint64_t v8 = 1;
LABEL_26:
      return sub_246A8784C(v7, v8);
    }
    goto LABEL_25;
  }
  sub_246A87714(a1, a3);
  if (!v10) {
    return 0;
  }
  type metadata accessor for SceneLoader();
  id v11 = sub_246A93A20();
  unint64_t v12 = (void *)sub_246AD8B80();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v12, v11, 0);

  if (!v13) {
    return 0;
  }
  id v14 = objc_msgSend(v13, sel_imageWithRenderingMode_, 2);

  return v14;
}

char *sub_246A87AF0(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_246AD89C0();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v24(a1, (char *)a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = &a1[v8];
    id v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *(void *)uint64_t v10 = *v11;
    *((void *)v10 + 1) = v12;
    *(void *)&a1[v9] = *(uint64_t *)((char *)a2 + v9);
    uint64_t v13 = a3[8];
    *(void *)&a1[a3[7]] = *(uint64_t *)((char *)a2 + a3[7]);
    *(void *)&a1[v13] = *(uint64_t *)((char *)a2 + v13);
    uint64_t v14 = a3[9];
    unint64_t v15 = &a1[v14];
    int64_t v16 = (char *)a2 + v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24(v15, v16, v7);
    uint64_t v17 = type metadata accessor for Timeline(0);
    v15[*(int *)(v17 + 20)] = v16[*(int *)(v17 + 20)];
    *(void *)&v15[*(int *)(v17 + 24)] = *(void *)&v16[*(int *)(v17 + 24)];
    uint64_t v18 = a3[10];
    double v19 = &a1[v18];
    double v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v21 = v20[1];
    *(void *)double v19 = *v20;
    *((void *)v19 + 1) = v21;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_246A87C84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246AD89C0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5(a1 + *(int *)(a2 + 36), v4);

  return swift_bridgeObjectRelease();
}

uint64_t sub_246A87D5C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v22(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22(v14, v15, v6);
  uint64_t v16 = type metadata accessor for Timeline(0);
  *(unsigned char *)(v14 + *(int *)(v16 + 20)) = *(unsigned char *)(v15 + *(int *)(v16 + 20));
  *(void *)(v14 + *(int *)(v16 + 24)) = *(void *)(v15 + *(int *)(v16 + 24));
  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)(a1 + v17);
  double v19 = (void *)(a2 + v17);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_246A87EA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  v7(a1 + v11, a2 + v11, v6);
  uint64_t v14 = type metadata accessor for Timeline(0);
  *(unsigned char *)(v12 + *(int *)(v14 + 20)) = *(unsigned char *)(v13 + *(int *)(v14 + 20));
  *(void *)(v12 + *(int *)(v14 + 24)) = *(void *)(v13 + *(int *)(v14 + 24));
  uint64_t v15 = a3[10];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246A88014(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[9];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  v7(a1 + v10, a2 + v10, v6);
  uint64_t v13 = type metadata accessor for Timeline(0);
  *(unsigned char *)(v11 + *(int *)(v13 + 20)) = *(unsigned char *)(v12 + *(int *)(v13 + 20));
  *(void *)(v11 + *(int *)(v13 + 24)) = *(void *)(v12 + *(int *)(v13 + 24));
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_246A88110(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[9];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  v7(a1 + v13, a2 + v13, v6);
  uint64_t v16 = type metadata accessor for Timeline(0);
  *(unsigned char *)(v14 + *(int *)(v16 + 20)) = *(unsigned char *)(v15 + *(int *)(v16 + 20));
  *(void *)(v14 + *(int *)(v16 + 24)) = *(void *)(v15 + *(int *)(v16 + 24));
  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)(a1 + v17);
  double v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246A8824C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246A88260);
}

uint64_t sub_246A88260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for Timeline(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 36);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_246A88390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246A883A4);
}

uint64_t sub_246A883A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_246AD89C0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for Timeline(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 36);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for Scene()
{
  uint64_t result = qword_2691C0478;
  if (!qword_2691C0478) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246A88520()
{
  uint64_t result = sub_246AD89C0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Timeline(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_246A88604(char a1)
{
  return qword_246ADCB38[a1];
}

uint64_t sub_246A88624()
{
  return sub_246A88604(*v0);
}

uint64_t sub_246A8862C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8AEB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A88654()
{
  return 0;
}

void sub_246A88660(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_246A8866C(uint64_t a1)
{
  unint64_t v2 = sub_246A8A728();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A886A8(uint64_t a1)
{
  unint64_t v2 = sub_246A8A728();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A886E4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_246A8604C(&qword_2691C04F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A8A728();
  sub_246AD9160();
  LOBYTE(v12) = 0;
  sub_246AD89C0();
  sub_246A8AAC8(&qword_2691C0500, MEMORY[0x263F07508]);
  sub_246AD9020();
  if (!v2)
  {
    uint64_t v9 = (int *)type metadata accessor for Scene();
    LOBYTE(v12) = 1;
    sub_246AD8FF0();
    uint64_t v12 = *(void *)(v3 + v9[6]);
    HIBYTE(v11) = 2;
    sub_246A8604C(&qword_2691C04A8);
    sub_246A8A94C(&qword_2691C0508, &qword_2691C0510);
    sub_246AD9020();
    uint64_t v12 = *(void *)(v3 + v9[7]);
    HIBYTE(v11) = 3;
    sub_246A8604C(&qword_2691C04C0);
    sub_246A8A9E0(&qword_2691C0518, &qword_2691C0520);
    sub_246AD9020();
    uint64_t v12 = *(void *)(v3 + v9[8]);
    HIBYTE(v11) = 4;
    sub_246A8604C(&qword_2691C04D8);
    sub_246A8A824(&qword_2691C0528, (void (*)(void))sub_246A8AA74);
    sub_246AD9020();
    LOBYTE(v12) = 5;
    type metadata accessor for Timeline(0);
    sub_246A8AAC8(&qword_2691C0538, (void (*)(uint64_t))type metadata accessor for Timeline);
    sub_246AD9020();
    LOBYTE(v12) = 6;
    sub_246AD8FF0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_246A88AD8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = type metadata accessor for Timeline(0);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246AD89C0();
  uint64_t v35 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C0490);
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for Scene();
  MEMORY[0x270FA5388]();
  id v32 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246AD89B0();
  uint64_t v13 = a1[3];
  double v31 = a1;
  sub_246A8A6E4(a1, v13);
  sub_246A8A728();
  uint64_t v14 = v33;
  sub_246AD9150();
  if (v14)
  {
    uint64_t v16 = v32;
    sub_246A85F9C((uint64_t)v31);
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v16, v6);
  }
  else
  {
    uint64_t v33 = v3;
    uint64_t v15 = v29;
    LOBYTE(v37) = 0;
    sub_246A8AAC8(&qword_2691C04A0, MEMORY[0x263F07508]);
    sub_246AD8FA0();
    uint64_t v18 = (uint64_t)v32;
    (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v32, v8, v6);
    LOBYTE(v37) = 1;
    uint64_t v19 = sub_246AD8F70();
    uint64_t v20 = (int *)v34;
    uint64_t v21 = (uint64_t *)(v18 + *(int *)(v34 + 20));
    *uint64_t v21 = v19;
    v21[1] = v22;
    sub_246A8604C(&qword_2691C04A8);
    char v36 = 2;
    sub_246A8A94C(&qword_2691C04B0, &qword_2691C04B8);
    sub_246AD8FA0();
    *(void *)(v18 + v20[6]) = v37;
    sub_246A8604C(&qword_2691C04C0);
    char v36 = 3;
    sub_246A8A9E0(&qword_2691C04C8, &qword_2691C04D0);
    sub_246AD8FA0();
    *(void *)(v18 + v20[7]) = v37;
    sub_246A8604C(&qword_2691C04D8);
    char v36 = 4;
    sub_246A8A824(&qword_2691C04E0, (void (*)(void))sub_246A8A894);
    sub_246AD8FA0();
    *(void *)(v18 + v20[8]) = v37;
    LOBYTE(v37) = 5;
    sub_246A8AAC8(&qword_2691C04F0, (void (*)(uint64_t))type metadata accessor for Timeline);
    sub_246AD8FA0();
    sub_246A8A8E8((uint64_t)v5, v18 + v20[9]);
    LOBYTE(v37) = 6;
    uint64_t v23 = sub_246AD8F70();
    uint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v30);
    uint64_t v26 = (uint64_t *)(v18 + v20[10]);
    *uint64_t v26 = v23;
    v26[1] = v25;
    sub_246A8ABAC(v18, v28, (uint64_t (*)(void))type metadata accessor for Scene);
    sub_246A85F9C((uint64_t)v31);
    return sub_246A8A77C(v18, (uint64_t (*)(void))type metadata accessor for Scene);
  }
}

uint64_t sub_246A8927C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_246AD89C0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_246A892E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246A88AD8(a1, a2);
}

uint64_t sub_246A892FC(void *a1)
{
  return sub_246A886E4(a1);
}

uint64_t sub_246A89314()
{
  return sub_246A8AAC8(&qword_2691C0488, MEMORY[0x263F07508]);
}

uint64_t sub_246A8935C()
{
  uint64_t v0 = sub_246AD89C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (int *)type metadata accessor for Scene();
  sub_246A8AB10((uint64_t)v4, qword_2691D3FE8);
  uint64_t v5 = sub_246A8AB74((uint64_t)v4, (uint64_t)qword_2691D3FE8);
  if (qword_2691C0260 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Timeline(0);
  uint64_t v7 = sub_246A8AB74(v6, (uint64_t)qword_2691D4110);
  sub_246AD89B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
  uint64_t v8 = (void *)(v5 + v4[5]);
  *uint64_t v8 = 0x63732D7974706D65;
  v8[1] = 0xEB00000000656E65;
  uint64_t v9 = MEMORY[0x263F8EE78];
  *(void *)(v5 + v4[6]) = MEMORY[0x263F8EE78];
  *(void *)(v5 + v4[7]) = v9;
  *(void *)(v5 + v4[8]) = v9;
  uint64_t result = sub_246A8ABAC(v7, v5 + v4[9], type metadata accessor for Timeline);
  uint64_t v11 = (void *)(v5 + v4[10]);
  *uint64_t v11 = 0x7974706D65206E41;
  v11[1] = 0xEF2E656E65637320;
  return result;
}

uint64_t sub_246A89534(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (char *)(a1 + 32);
    uint64_t v4 = (char *)(a2 + 32);
    do
    {
      uint64_t v6 = *v3++;
      uint64_t v5 = v6;
      uint64_t v7 = *v4++;
      uint64_t v8 = v5;
      uint64_t v9 = qword_246ADCBE8[v7];
      if (*(void *)&aNone_2[v8 * 8] == *(void *)&aNone_2[8 * v7] && qword_246ADCBE8[v8] == v9)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v11 = sub_246AD9060();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v11 & 1) == 0) {
          return 0;
        }
      }
      --v2;
    }
    while (v2);
  }
  return 1;
}

BOOL sub_246A89618(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Sprite() - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      return 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_246A8ABAC(a1 + v12, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Sprite);
        sub_246A8ABAC(a2 + v12, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Sprite);
        BOOL v15 = sub_246AD3C6C((uint64_t)v10, (uint64_t)v7);
        sub_246A8A77C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Sprite);
        sub_246A8A77C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Sprite);
        BOOL v17 = v14-- != 0;
        if (!v15) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    return 0;
  }
  return v15;
}

uint64_t sub_246A897A4(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = type metadata accessor for TimeRule();
  uint64_t v4 = MEMORY[0x270FA5388](v66);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v57 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v57 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v57 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v19 = (char *)&v57 - v18;
  uint64_t v20 = *(void *)(a1 + 16);
  if (v20 == *(void *)(a2 + 16))
  {
    if (!v20 || a1 == a2) {
      return 1;
    }
    uint64_t v63 = v17;
    uint64_t v64 = v16;
    unint64_t v21 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    uint64_t v58 = *(void *)(v15 + 72);
    uint64_t v59 = a2;
    v65 = v14;
    uint64_t v61 = v8;
    uint64_t v62 = a1;
    BOOL v60 = v11;
    while (1)
    {
      sub_246A8ABAC(a1 + v21, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for TimeRule);
      sub_246A8ABAC(a2 + v21, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for TimeRule);
      char v22 = sub_246AD89A0();
      sub_246A8ABAC((uint64_t)v19, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for TimeRule);
      sub_246A8ABAC((uint64_t)v14, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for TimeRule);
      if ((v22 & 1) == 0) {
        break;
      }
      uint64_t v23 = v66;
      uint64_t v24 = &v11[*(int *)(v66 + 20)];
      uint64_t v25 = (uint64_t)v11;
      uint64_t v27 = *(void *)v24;
      uint64_t v26 = *((void *)v24 + 1);
      unsigned int v28 = v24[16];
      sub_246A8A77C(v25, (uint64_t (*)(void))type metadata accessor for TimeRule);
      uint64_t v29 = &v8[*(int *)(v23 + 20)];
      uint64_t v30 = *(void *)v29;
      uint64_t v31 = *((void *)v29 + 1);
      uint64_t v32 = (uint64_t)v8;
      unsigned int v33 = v29[16];
      sub_246A8A77C(v32, (uint64_t (*)(void))type metadata accessor for TimeRule);
      switch(v28 >> 5)
      {
        case 1u:
          if ((v33 & 0xE0) != 0x20 || v27 != v30) {
            goto LABEL_70;
          }
          BOOL v34 = v26 == v31;
          goto LABEL_31;
        case 2u:
          if ((v33 & 0xE0) != 0x40 || v27 != v30 || v26 != v31) {
            goto LABEL_70;
          }
          BOOL v34 = ((v33 ^ v28) & 1) == 0;
          goto LABEL_31;
        case 3u:
          if ((v33 & 0xE0) != 0x60) {
            goto LABEL_70;
          }
          int v38 = v27 >> 6;
          if (v38)
          {
            if (v38 != 1)
            {
              if (v27 == 128)
              {
                if (v30 != 128) {
                  goto LABEL_70;
                }
              }
              else if (v30 != 129)
              {
                goto LABEL_70;
              }
              uint64_t v41 = v63;
              sub_246A8ABAC((uint64_t)v19, v63, (uint64_t (*)(void))type metadata accessor for TimeRule);
              uint64_t v40 = v64;
              sub_246A8ABAC((uint64_t)v65, v64, (uint64_t (*)(void))type metadata accessor for TimeRule);
              goto LABEL_35;
            }
            if ((v30 & 0xC0) != 0x40) {
              goto LABEL_70;
            }
            BOOL v34 = ((v30 ^ v27) & 0x3FLL) == 0;
          }
          else
          {
            if (v30 >= 0x40u) {
              goto LABEL_70;
            }
            BOOL v34 = (v30 ^ v27) == 0;
          }
LABEL_31:
          char v39 = v34;
          uint64_t v41 = v63;
          uint64_t v40 = v64;
          uint64_t v42 = (uint64_t)v65;
          sub_246A8ABAC((uint64_t)v19, v63, (uint64_t (*)(void))type metadata accessor for TimeRule);
          sub_246A8ABAC(v42, v40, (uint64_t (*)(void))type metadata accessor for TimeRule);
          if ((v39 & 1) == 0) {
            goto LABEL_71;
          }
LABEL_35:
          uint64_t v43 = v66;
          uint64_t v44 = v41 + *(int *)(v66 + 24);
          uint64_t v46 = *(void *)v44;
          uint64_t v45 = *(void *)(v44 + 8);
          unsigned int v47 = *(unsigned __int8 *)(v44 + 16);
          sub_246A8A77C(v41, (uint64_t (*)(void))type metadata accessor for TimeRule);
          uint64_t v48 = v40 + *(int *)(v43 + 24);
          uint64_t v49 = *(void *)v48;
          uint64_t v50 = *(void *)(v48 + 8);
          uint64_t v51 = v40;
          unsigned int v52 = *(unsigned __int8 *)(v48 + 16);
          sub_246A8A77C(v51, (uint64_t (*)(void))type metadata accessor for TimeRule);
          switch(v47 >> 5)
          {
            case 1u:
              if ((v52 & 0xE0) != 0x20 || v46 != v49) {
                goto LABEL_72;
              }
              BOOL v53 = v45 == v50;
              goto LABEL_55;
            case 2u:
              if ((v52 & 0xE0) != 0x40 || v46 != v49 || v45 != v50) {
                goto LABEL_72;
              }
              BOOL v53 = ((v52 ^ v47) & 1) == 0;
              goto LABEL_55;
            case 3u:
              if ((v52 & 0xE0) != 0x60) {
                goto LABEL_72;
              }
              int v54 = v46 >> 6;
              if (v54)
              {
                if (v54 != 1)
                {
                  if (v46 == 128)
                  {
                    if (v49 != 128) {
                      goto LABEL_72;
                    }
                  }
                  else if (v49 != 129)
                  {
                    goto LABEL_72;
                  }
                  uint64_t v14 = v65;
                  sub_246A8A77C((uint64_t)v65, (uint64_t (*)(void))type metadata accessor for TimeRule);
                  sub_246A8A77C((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for TimeRule);
                  uint64_t v8 = v61;
                  a1 = v62;
                  uint64_t v11 = v60;
                  goto LABEL_59;
                }
                if ((v49 & 0xC0) != 0x40) {
                  goto LABEL_72;
                }
                BOOL v53 = ((v49 ^ v46) & 0x3FLL) == 0;
              }
              else
              {
                if (v49 >= 0x40u) {
                  goto LABEL_72;
                }
                BOOL v53 = (v49 ^ v46) == 0;
              }
LABEL_55:
              char v55 = v53;
              uint64_t v8 = v61;
              a1 = v62;
              uint64_t v14 = v65;
              uint64_t v11 = v60;
              sub_246A8A77C((uint64_t)v65, (uint64_t (*)(void))type metadata accessor for TimeRule);
              sub_246A8A77C((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for TimeRule);
              if ((v55 & 1) == 0) {
                return 0;
              }
LABEL_59:
              a2 = v59;
              v21 += v58;
              uint64_t result = 1;
              if (!--v20) {
                return result;
              }
              break;
            case 4u:
              goto LABEL_72;
            default:
              if (v52 >= 0x20) {
                goto LABEL_72;
              }
              BOOL v53 = v46 == v49;
              goto LABEL_55;
          }
          break;
        case 4u:
          goto LABEL_70;
        default:
          if (v33 >= 0x20) {
            goto LABEL_70;
          }
          BOOL v34 = v27 == v30;
          goto LABEL_31;
      }
    }
    sub_246A8A77C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for TimeRule);
    sub_246A8A77C((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for TimeRule);
LABEL_70:
    uint64_t v41 = v63;
    sub_246A8ABAC((uint64_t)v19, v63, (uint64_t (*)(void))type metadata accessor for TimeRule);
    uint64_t v40 = v64;
    sub_246A8ABAC((uint64_t)v65, v64, (uint64_t (*)(void))type metadata accessor for TimeRule);
LABEL_71:
    sub_246A8A77C(v40, (uint64_t (*)(void))type metadata accessor for TimeRule);
    sub_246A8A77C(v41, (uint64_t (*)(void))type metadata accessor for TimeRule);
LABEL_72:
    sub_246A8A77C((uint64_t)v65, (uint64_t (*)(void))type metadata accessor for TimeRule);
    sub_246A8A77C((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for TimeRule);
  }
  return 0;
}

uint64_t sub_246A89E08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (unsigned __int8 *)(a1 + 40);
    uint64_t v4 = (unsigned __int8 *)(a2 + 40);
    while (1)
    {
      uint64_t v7 = *((void *)v3 - 1);
      unsigned int v9 = *v3;
      v3 += 16;
      uint64_t v8 = v9;
      uint64_t v10 = *((void *)v4 - 1);
      int v12 = *v4;
      v4 += 16;
      int v11 = v12;
      switch(v8)
      {
        case 1:
          if (v11 != 1) {
            return 0;
          }
          if (*(void *)&aTheater_1[8 * (char)v7] == *(void *)&aTheater_1[8 * (char)v10]
            && *(void *)&aLowpowerwaterl[8 * (char)v7 + 16] == *(void *)&aLowpowerwaterl[8 * (char)v10 + 16])
          {
            sub_246A8A6BC(v10, 1);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v5 = v7;
            char v6 = 1;
            goto LABEL_6;
          }
          char v16 = sub_246AD9060();
          sub_246A8A6BC(v10, 1);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_246A8A6D0(v7, 1);
          if (v16) {
            goto LABEL_7;
          }
          return 0;
        case 2:
          if (v11 != 2) {
            return 0;
          }
          if (*(void *)&aMorning_1[8 * (char)v7] == *(void *)&aMorning_1[8 * (char)v10]
            && qword_246ADCCF8[(char)v7] == qword_246ADCCF8[(char)v10])
          {
            sub_246A8A6BC(v10, 2);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v18 = sub_246AD9060();
            sub_246A8A6BC(v10, 2);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v18 & 1) == 0) {
              return 0;
            }
          }
LABEL_7:
          if (!--v2) {
            return 1;
          }
          break;
        case 3:
          if (v11 != 3) {
            return 0;
          }
          sub_246A8A6BC(v10, 3);
          sub_246A8A6BC(v7, 3);
          char v19 = sub_246A89534(v7, v10);
          sub_246A8A6D0(v10, 3);
          sub_246A8A6D0(v7, 3);
          if ((v19 & 1) == 0) {
            return 0;
          }
          goto LABEL_7;
        case 4:
          switch(v7)
          {
            case 1:
              if (v11 != 4 || v10 != 1) {
                return 0;
              }
              sub_246A8A6BC(1, 4);
              uint64_t v5 = 1;
              char v6 = 4;
              break;
            case 2:
              if (v11 != 4 || v10 != 2) {
                return 0;
              }
              goto LABEL_7;
            case 3:
              if (v11 != 4 || v10 != 3) {
                return 0;
              }
              goto LABEL_7;
            case 4:
              if (v11 != 4 || v10 != 4) {
                return 0;
              }
              goto LABEL_7;
            case 5:
              if (v11 != 4 || v10 != 5) {
                return 0;
              }
              goto LABEL_7;
            case 6:
              if (v11 != 4 || v10 != 6) {
                return 0;
              }
              goto LABEL_7;
            case 7:
              if (v11 != 4 || v10 != 7) {
                return 0;
              }
              goto LABEL_7;
            default:
              if (v11 != 4 || v10 != 0) {
                return 0;
              }
              sub_246A8A6BC(0, 4);
              uint64_t v5 = 0;
              char v6 = 4;
              break;
          }
          goto LABEL_6;
        default:
          if (v11) {
            return 0;
          }
          if (*(void *)&aNewyear_1[8 * (char)v7] == *(void *)&aNewyear_1[8 * (char)v10]
            && *(void *)&aLunarnewvalent[8 * (char)v7 + 56] == *(void *)&aLunarnewvalent[8 * (char)v10 + 56])
          {
            sub_246A8A6BC(v10, 0);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v5 = v7;
            char v6 = 0;
LABEL_6:
            sub_246A8A6D0(v5, v6);
          }
          else
          {
            char v14 = sub_246AD9060();
            sub_246A8A6BC(v10, 0);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_246A8A6D0(v7, 0);
            if ((v14 & 1) == 0) {
              return 0;
            }
          }
          goto LABEL_7;
      }
    }
  }
  return 1;
}

BOOL sub_246A8A1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for Scene();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v48 = (uint64_t)&v46 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v47 = (uint64_t)&v46 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int v12 = (char *)&v46 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v46 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  char v18 = (char *)&v46 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  unint64_t v21 = (char *)&v46 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v25 = (char *)&v46 - v23;
  uint64_t v26 = *(int *)(v22 + 20);
  uint64_t v27 = *(void *)(a1 + v26);
  uint64_t v28 = *(void *)(a1 + v26 + 8);
  uint64_t v29 = (void *)(a2 + v26);
  BOOL v30 = v27 == *v29 && v28 == v29[1];
  uint64_t v49 = v24;
  if (v30)
  {
    sub_246A8ABAC(a1, (uint64_t)&v46 - v23, (uint64_t (*)(void))type metadata accessor for Scene);
    sub_246A8ABAC(a2, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for Scene);
  }
  else
  {
    char v31 = sub_246AD9060();
    sub_246A8ABAC(a1, (uint64_t)v25, (uint64_t (*)(void))type metadata accessor for Scene);
    sub_246A8ABAC(a2, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for Scene);
    if ((v31 & 1) == 0)
    {
      sub_246A8A77C((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for Scene);
      sub_246A8A77C((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for Scene);
      sub_246A8ABAC(a1, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for Scene);
      sub_246A8ABAC(a2, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for Scene);
      uint64_t v32 = v49;
LABEL_14:
      sub_246A8A77C((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for Scene);
      sub_246A8A77C((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for Scene);
      sub_246A8ABAC(a1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for Scene);
      uint64_t v35 = v47;
      sub_246A8ABAC(a2, v47, (uint64_t (*)(void))type metadata accessor for Scene);
      goto LABEL_15;
    }
  }
  BOOL v33 = sub_246A89618(*(void *)&v25[v4[6]], *(void *)&v21[v4[6]]);
  sub_246A8A77C((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246A8A77C((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246A8ABAC(a1, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246A8ABAC(a2, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for Scene);
  uint64_t v32 = v49;
  if (!v33) {
    goto LABEL_14;
  }
  char v34 = sub_246A897A4(*(void *)&v18[v4[7]], *(void *)&v15[v4[7]]);
  sub_246A8A77C((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246A8A77C((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246A8ABAC(a1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for Scene);
  uint64_t v35 = v47;
  sub_246A8ABAC(a2, v47, (uint64_t (*)(void))type metadata accessor for Scene);
  if ((v34 & 1) == 0)
  {
LABEL_15:
    sub_246A8A77C((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for Scene);
    sub_246A8A77C(v35, (uint64_t (*)(void))type metadata accessor for Scene);
    uint64_t v44 = a1;
    uint64_t v38 = v48;
    sub_246A8ABAC(v44, v48, (uint64_t (*)(void))type metadata accessor for Scene);
    sub_246A8ABAC(a2, v32, (uint64_t (*)(void))type metadata accessor for Scene);
LABEL_16:
    BOOL v43 = 0;
    goto LABEL_17;
  }
  char v36 = sub_246A89E08(*(void *)&v12[v4[8]], *(void *)(v35 + v4[8]));
  sub_246A8A77C((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246A8A77C(v35, (uint64_t (*)(void))type metadata accessor for Scene);
  uint64_t v37 = a1;
  uint64_t v38 = v48;
  sub_246A8ABAC(v37, v48, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246A8ABAC(a2, v32, (uint64_t (*)(void))type metadata accessor for Scene);
  if ((v36 & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v39 = v4[9];
  uint64_t v40 = v38 + v39;
  uint64_t v41 = v32 + v39;
  if ((sub_246AD89A0() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v42 = type metadata accessor for Timeline(0);
  if (qword_246ADCD18[*(char *)(v40 + *(int *)(v42 + 20))] != qword_246ADCD18[*(char *)(v41 + *(int *)(v42 + 20))]) {
    goto LABEL_16;
  }
  BOOL v43 = *(void *)(v40 + *(int *)(v42 + 24)) == *(void *)(v41 + *(int *)(v42 + 24));
LABEL_17:
  sub_246A8A77C(v32, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246A8A77C(v38, (uint64_t (*)(void))type metadata accessor for Scene);
  return v43;
}

uint64_t sub_246A8A6BC(uint64_t a1, char a2)
{
  if (a2 == 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_246A8A6D0(uint64_t a1, char a2)
{
  if (a2 == 3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_246A8A6E4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_246A8A728()
{
  unint64_t result = qword_2691C0498;
  if (!qword_2691C0498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0498);
  }
  return result;
}

uint64_t sub_246A8A77C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246A8A7DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_246A8A824(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_246A8A7DC(&qword_2691C04D8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_246A8A894()
{
  unint64_t result = qword_2691C04E8;
  if (!qword_2691C04E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C04E8);
  }
  return result;
}

uint64_t sub_246A8A8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Timeline(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A8A94C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_246A8A7DC(&qword_2691C04A8);
    sub_246A8AAC8(a2, (void (*)(uint64_t))type metadata accessor for Sprite);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246A8A9E0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_246A8A7DC(&qword_2691C04C0);
    sub_246A8AAC8(a2, (void (*)(uint64_t))type metadata accessor for TimeRule);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_246A8AA74()
{
  unint64_t result = qword_2691C0530;
  if (!qword_2691C0530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0530);
  }
  return result;
}

uint64_t sub_246A8AAC8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_246A8AB10(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_246A8AB74(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_246A8ABAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t getEnumTagSinglePayload for Scene.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Scene.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x246A8AD70);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Scene.CodingKeys()
{
  return &type metadata for Scene.CodingKeys;
}

unint64_t sub_246A8ADAC()
{
  unint64_t result = qword_2691C0540;
  if (!qword_2691C0540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0540);
  }
  return result;
}

unint64_t sub_246A8AE04()
{
  unint64_t result = qword_2691C0548;
  if (!qword_2691C0548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0548);
  }
  return result;
}

unint64_t sub_246A8AE5C()
{
  unint64_t result = qword_2691C0550;
  if (!qword_2691C0550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0550);
  }
  return result;
}

uint64_t sub_246A8AEB0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x73657469727073 && a2 == 0xE700000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C7552656D6974 && a2 == 0xE900000000000073 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1868983913 && a2 == 0xE400000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656E696C656D6974 && a2 == 0xE800000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_246A8B148(uint64_t a1)
{
  return sub_246A8B244(a1, qword_2691D4000);
}

uint64_t sub_246A8B16C(uint64_t a1)
{
  return sub_246A8B244(a1, qword_2691D4018);
}

uint64_t sub_246A8B190(uint64_t a1)
{
  return sub_246A8B244(a1, qword_2691D4030);
}

uint64_t sub_246A8B1B4(uint64_t a1)
{
  return sub_246A8B244(a1, qword_2691D4048);
}

uint64_t sub_246A8B1D8(uint64_t a1)
{
  return sub_246A8B244(a1, qword_2691D4060);
}

uint64_t sub_246A8B1FC(uint64_t a1)
{
  return sub_246A8B244(a1, qword_2691D4078);
}

uint64_t sub_246A8B220(uint64_t a1)
{
  return sub_246A8B244(a1, qword_2691D4090);
}

uint64_t sub_246A8B244(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_246AD8AD0();
  sub_246A8AB10(v3, a2);
  sub_246A8AB74(v3, (uint64_t)a2);
  return sub_246AD8AC0();
}

uint64_t sub_246A8B2BC(char a1)
{
  if (a1) {
    return 121;
  }
  else {
    return 120;
  }
}

uint64_t sub_246A8B2D8()
{
  return sub_246A8B2BC(*v0);
}

uint64_t sub_246A8B2E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8E320(a1, a2);
  *a3 = result;
  return result;
}

void sub_246A8B308(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_246A8B314(uint64_t a1)
{
  unint64_t v2 = sub_246A8FC98();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B350(uint64_t a1)
{
  unint64_t v2 = sub_246A8FC98();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B38C(char a1)
{
  return qword_246ADE890[a1];
}

uint64_t sub_246A8B3AC()
{
  return sub_246A8B38C(*v0);
}

uint64_t sub_246A8B3B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8E3E0(a1, a2);
  *a3 = result;
  return result;
}

void sub_246A8B3DC(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_246A8B3E8(uint64_t a1)
{
  unint64_t v2 = sub_246A8F8A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B424(uint64_t a1)
{
  unint64_t v2 = sub_246A8F8A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B460()
{
  return 1;
}

uint64_t sub_246A8B474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8E554(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_246A8B4A0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_246A8B4AC(uint64_t a1)
{
  unint64_t v2 = sub_246A8F8F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B4E8(uint64_t a1)
{
  unint64_t v2 = sub_246A8F8F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B524()
{
  return 0;
}

uint64_t sub_246A8B530(uint64_t a1)
{
  unint64_t v2 = sub_246A8F9F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B56C(uint64_t a1)
{
  unint64_t v2 = sub_246A8F9F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B5A8(uint64_t a1)
{
  unint64_t v2 = sub_246A8F99C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B5E4(uint64_t a1)
{
  unint64_t v2 = sub_246A8F99C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B620(uint64_t a1)
{
  unint64_t v2 = sub_246A8FA44();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B65C(uint64_t a1)
{
  unint64_t v2 = sub_246A8FA44();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B698(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x7369776B636F6C63;
  }
}

uint64_t sub_246A8B6D8(char a1)
{
  return qword_246ADE8D0[a1];
}

uint64_t sub_246A8B6F8(char a1)
{
  return *(void *)&aLeft_1[8 * a1];
}

uint64_t sub_246A8B718(uint64_t a1)
{
  unint64_t v2 = sub_246A901E4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B754(uint64_t a1)
{
  unint64_t v2 = sub_246A901E4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B790()
{
  return sub_246A8B698(*v0);
}

uint64_t sub_246A8B798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8E5F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A8B7C0(uint64_t a1)
{
  unint64_t v2 = sub_246A9013C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B7FC(uint64_t a1)
{
  unint64_t v2 = sub_246A9013C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B838(uint64_t a1)
{
  unint64_t v2 = sub_246A90190();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B874(uint64_t a1)
{
  unint64_t v2 = sub_246A90190();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B8B0()
{
  return sub_246A8B6D8(*v0);
}

uint64_t sub_246A8B8B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8E6E4(a1, a2);
  *a3 = result;
  return result;
}

void sub_246A8B8E0(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_246A8B8EC(uint64_t a1)
{
  unint64_t v2 = sub_246A911D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B928(uint64_t a1)
{
  unint64_t v2 = sub_246A911D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B964(uint64_t a1)
{
  unint64_t v2 = sub_246A9127C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8B9A0(uint64_t a1)
{
  unint64_t v2 = sub_246A9127C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8B9DC(uint64_t a1)
{
  unint64_t v2 = sub_246A91228();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8BA18(uint64_t a1)
{
  unint64_t v2 = sub_246A91228();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8BA54(uint64_t a1)
{
  unint64_t v2 = sub_246A912D0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8BA90(uint64_t a1)
{
  unint64_t v2 = sub_246A912D0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8BACC()
{
  return sub_246A8B6F8(*v0);
}

uint64_t sub_246A8BAD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8E7FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A8BAFC(uint64_t a1)
{
  unint64_t v2 = sub_246A91894();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8BB38(uint64_t a1)
{
  unint64_t v2 = sub_246A91894();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8BB74(uint64_t a1)
{
  unint64_t v2 = sub_246A918E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8BBB0(uint64_t a1)
{
  unint64_t v2 = sub_246A918E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8BBEC(uint64_t a1)
{
  unint64_t v2 = sub_246A91990();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8BC28(uint64_t a1)
{
  unint64_t v2 = sub_246A91990();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8BC64(uint64_t a1)
{
  unint64_t v2 = sub_246A9193C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8BCA0(uint64_t a1)
{
  unint64_t v2 = sub_246A9193C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8BCDC(char a1)
{
  return *(void *)&aVerticalhorizo[8 * a1];
}

uint64_t sub_246A8BCFC(char a1)
{
  if (a1) {
    return 0x6574756E696DLL;
  }
  else {
    return 1920298856;
  }
}

uint64_t sub_246A8BD28(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C05E8);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_246A8604C(&qword_2691C05F0);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C05F8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  int v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A8F080();
  sub_246AD9160();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_246A8F0D4();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_246A8F128();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

uint64_t sub_246A8BFD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return sub_246AD9110();
  }
  sub_246AD9110();
  sub_246AD9130();
  return sub_246AD9130();
}

uint64_t sub_246A8C05C(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v33 = a4;
  *(void *)&long long v34 = a2;
  *((void *)&v34 + 1) = a3;
  uint64_t v5 = sub_246A8604C(&qword_2691C0658);
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v32 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246A8604C(&qword_2691C0660);
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  MEMORY[0x270FA5388]();
  uint64_t v28 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C0668);
  uint64_t v26 = *(void *)(v10 - 8);
  uint64_t v27 = v10;
  MEMORY[0x270FA5388]();
  uint64_t v25 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_246A8604C(&qword_2691C0670);
  uint64_t v24 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_246A8604C(&qword_2691C0678);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388]();
  int v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A8F8A0();
  sub_246AD9160();
  if (v33)
  {
    if (v34 == 0)
    {
      LOBYTE(v35) = 0;
      sub_246A8FA44();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v12);
    }
    else
    {
      if ((unint64_t)v34 ^ 1 | *((void *)&v34 + 1))
      {
        LOBYTE(v35) = 2;
        sub_246A8F99C();
        unint64_t v21 = v28;
        sub_246AD8FC0();
        uint64_t v23 = v29;
        uint64_t v22 = v30;
      }
      else
      {
        LOBYTE(v35) = 1;
        sub_246A8F9F0();
        unint64_t v21 = v25;
        sub_246AD8FC0();
        uint64_t v23 = v26;
        uint64_t v22 = v27;
      }
      (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v22);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  else
  {
    LOBYTE(v35) = 3;
    sub_246A8F8F4();
    sub_246AD8FC0();
    long long v35 = v34;
    sub_246A8FA98();
    uint64_t v19 = v32;
    sub_246AD9020();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
}

uint64_t sub_246A8C4FC(void *a1)
{
  uint64_t v3 = sub_246A8604C(&qword_2691C0698);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A8FC98();
  sub_246AD9160();
  char v10 = 0;
  sub_246AD9000();
  if (!v1)
  {
    char v9 = 1;
    sub_246AD9000();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_246A8C664()
{
  return sub_246AD9140();
}

uint64_t sub_246A8C6D4(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C06D0);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_246A8604C(&qword_2691C06D8);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C06E0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A9013C();
  sub_246AD9160();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_246A90190();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_246A901E4();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

uint64_t sub_246A8C984()
{
  return sub_246A8BCDC(*v0);
}

uint64_t sub_246A8C98C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8E924(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A8C9B4(uint64_t a1)
{
  unint64_t v2 = sub_246A90970();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8C9F0(uint64_t a1)
{
  unint64_t v2 = sub_246A90970();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8CA30(uint64_t a1)
{
  unint64_t v2 = sub_246A90A6C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8CA6C(uint64_t a1)
{
  unint64_t v2 = sub_246A90A6C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8CAA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_246A8CAD8(uint64_t a1)
{
  unint64_t v2 = sub_246A909C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8CB14(uint64_t a1)
{
  unint64_t v2 = sub_246A909C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8CB50(uint64_t a1)
{
  unint64_t v2 = sub_246A90A18();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8CB8C(uint64_t a1)
{
  unint64_t v2 = sub_246A90A18();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8CBC8()
{
  return sub_246AD9140();
}

uint64_t sub_246A8CC0C()
{
  return sub_246AD9110();
}

uint64_t sub_246A8CC34()
{
  return sub_246AD9140();
}

uint64_t sub_246A8CC74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8EAE0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A8CCA0(uint64_t a1)
{
  unint64_t v2 = sub_246A90B14();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8CCDC(uint64_t a1)
{
  unint64_t v2 = sub_246A90B14();

  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_246A8CD18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_246A8CD30()
{
  return sub_246A8BCFC(*v0);
}

uint64_t sub_246A8CD38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A8EB5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A8CD60(uint64_t a1)
{
  unint64_t v2 = sub_246A8F080();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8CD9C(uint64_t a1)
{
  unint64_t v2 = sub_246A8F080();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8CDD8(uint64_t a1)
{
  unint64_t v2 = sub_246A8F128();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8CE14(uint64_t a1)
{
  unint64_t v2 = sub_246A8F128();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8CE50(uint64_t a1)
{
  unint64_t v2 = sub_246A8F0D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A8CE8C(uint64_t a1)
{
  unint64_t v2 = sub_246A8F0D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A8CEC8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246A8EC30(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_246A8CEF8(void *a1)
{
  return sub_246A8BD28(a1, *v1);
}

uint64_t sub_246A8CF14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_246A8F17C(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_246A8CF48(void *a1)
{
  return sub_246A8C05C(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

BOOL sub_246A8CF68(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)(a1 + 8);
  double v5 = *(double *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(unsigned char *)(a1 + 16) == 1)
  {
    if (*(void *)&v2 | *(void *)&v3)
    {
      if (*(void *)&v2 ^ 1 | *(void *)&v3)
      {
        if (*(unsigned char *)(a2 + 16) && __PAIR128__(v4, *(unint64_t *)&v5) >= 2) {
          return 1;
        }
      }
      else if (*(unsigned char *)(a2 + 16) && !(*(void *)&v5 ^ 1 | v4))
      {
        return 1;
      }
    }
    else
    {
      uint64_t v7 = *(void *)&v5 | v4;
      if (*(unsigned char *)(a2 + 16)) {
        BOOL v8 = v7 == 0;
      }
      else {
        BOOL v8 = 0;
      }
      if (v8) {
        return 1;
      }
    }
    return 0;
  }
  if (*(unsigned char *)(a2 + 16)) {
    return 0;
  }
  return v3 == *(double *)(a2 + 8) && v2 == v5;
}

uint64_t sub_246A8D004()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_246AD9100();
  sub_246A8BFD8((uint64_t)v5, v1, v2, v3);
  return sub_246AD9140();
}

uint64_t sub_246A8D060(uint64_t a1)
{
  return sub_246A8BFD8(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

uint64_t sub_246A8D06C()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_246AD9100();
  sub_246A8BFD8((uint64_t)v5, v1, v2, v3);
  return sub_246AD9140();
}

void sub_246A8D0C4(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = sub_246A8FAEC(a1);
  if (!v2)
  {
    *(double *)a2 = v4;
    *(void *)(a2 + 8) = v5;
  }
}

uint64_t sub_246A8D0F0(void *a1)
{
  return sub_246A8C4FC(a1);
}

BOOL sub_246A8D10C(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_246A8D138()
{
  return sub_246A8C664();
}

uint64_t sub_246A8D140()
{
  return sub_246AD9130();
}

uint64_t sub_246A8D188()
{
  return sub_246AD9140();
}

void sub_246A8D1E8(void *a1@<X8>)
{
  *a1 = &unk_26FB01C50;
}

uint64_t sub_246A8D1F8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246A8FCEC(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_246A8D228(void *a1)
{
  return sub_246A8C6D4(a1, *v1);
}

uint64_t sub_246A8D244(unsigned __int8 a1)
{
  if (a1 >> 6 && a1 >> 6 != 1)
  {
    while (1)
      ;
  }
  return sub_246AD9110();
}

uint64_t sub_246A8D264(void *a1, int a2)
{
  int v34 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C0748);
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388]();
  uint64_t v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C0750);
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v26 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C0758);
  uint64_t v33 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C0760);
  uint64_t v32 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_246A8604C(&qword_2691C0768);
  uint64_t v13 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A90970();
  unsigned __int8 v16 = v34;
  sub_246AD9160();
  if (!(v16 >> 6))
  {
    char v37 = 0;
    sub_246A90B14();
    uint64_t v17 = v35;
    sub_246AD8FC0();
    unsigned __int8 v36 = v16;
    sub_246A90C10();
    sub_246AD9020();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v17);
  }
  if (v16 >> 6 == 1)
  {
    char v39 = 1;
    sub_246A90A6C();
    uint64_t v17 = v35;
    sub_246AD8FC0();
    char v38 = v16 & 0x3F;
    sub_246A90BBC();
    sub_246AD9020();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v17);
  }
  int v19 = v16;
  char v20 = (uint64_t (**)(char *, uint64_t))(v13 + 8);
  if (v19 == 128)
  {
    char v40 = 2;
    sub_246A90A18();
    unint64_t v21 = v26;
    uint64_t v22 = v35;
    sub_246AD8FC0();
    uint64_t v24 = v27;
    uint64_t v23 = v28;
  }
  else
  {
    char v41 = 3;
    sub_246A909C4();
    unint64_t v21 = v29;
    uint64_t v22 = v35;
    sub_246AD8FC0();
    uint64_t v24 = v30;
    uint64_t v23 = v31;
  }
  (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
  return (*v20)(v15, v22);
}

uint64_t sub_246A8D734(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C07C0);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388]();
  unint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C07C8);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246A8604C(&qword_2691C07D0);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_246A8604C(&qword_2691C07D8);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A911D4();
  sub_246AD9160();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_246A9127C();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_246A91228();
      uint64_t v15 = v21;
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_246A912D0();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_246A8DAA0(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C0820);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388]();
  unint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C0828);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246A8604C(&qword_2691C0830);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_246A8604C(&qword_2691C0838);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A91894();
  sub_246AD9160();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_246A9193C();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_246A918E8();
      uint64_t v15 = v21;
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_246A91990();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_246A8DE0C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246A90238(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_246A8DE38(void *a1)
{
  return sub_246A8D264(a1, *v1);
}

uint64_t sub_246A8DE54()
{
  unsigned int v1 = *v0;
  sub_246AD9100();
  if (v1 >> 6 > 1) {
    sub_246A8D244(v1);
  }
  else {
    sub_246AD9110();
  }
  return sub_246AD9140();
}

uint64_t sub_246A8DEC8()
{
  unsigned int v1 = *v0;
  if (v1 >> 6 > 1) {
    return sub_246A8D244(v1);
  }
  else {
    return sub_246AD9110();
  }
}

uint64_t sub_246A8DF14()
{
  unsigned int v1 = *v0;
  sub_246AD9100();
  if (v1 >> 6 > 1) {
    sub_246A8D244(v1);
  }
  else {
    sub_246AD9110();
  }
  return sub_246AD9140();
}

uint64_t sub_246A8DF84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2 = *a1;
  unsigned int v3 = *a2;
  if (v2 >> 6)
  {
    if (v2 >> 6 == 1)
    {
      int v4 = v3 & 0xC0;
      BOOL v5 = ((v3 ^ v2) & 0x3F) == 0;
      return v4 == 64 && v5;
    }
    if (v2 == 128)
    {
      if (v3 != 128) {
        return 0;
      }
    }
    else if (v3 != 129)
    {
      return 0;
    }
    return 1;
  }
  return v3 < 0x40 && v2 == v3;
}

void sub_246A8DFF0(void *a1@<X8>)
{
  *a1 = &unk_26FB01C78;
}

void *sub_246A8E000@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246A90C64(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_246A8E02C(void *a1)
{
  return sub_246A8D734(a1, *v1);
}

void sub_246A8E048(void *a1@<X8>)
{
  *a1 = &unk_26FB01CA0;
}

void *sub_246A8E058@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246A91324(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_246A8E084(void *a1)
{
  return sub_246A8DAA0(a1, *v1);
}

uint64_t sub_246A8E0A0()
{
  return sub_246A8E1C8(&qword_2691C0558, &qword_2691C0560);
}

uint64_t sub_246A8E0C8()
{
  return sub_246A8E1C8(&qword_2691C0568, &qword_2691C0570);
}

unint64_t sub_246A8E0F4()
{
  unint64_t result = qword_2691C0578;
  if (!qword_2691C0578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0578);
  }
  return result;
}

unint64_t sub_246A8E14C()
{
  unint64_t result = qword_2691C0580;
  if (!qword_2691C0580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0580);
  }
  return result;
}

uint64_t sub_246A8E1A0()
{
  return sub_246A8E1C8(&qword_2691C0588, &qword_2691C0590);
}

uint64_t sub_246A8E1C8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_246A8A7DC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_246A8E21C()
{
  unint64_t result = qword_2691C0598;
  if (!qword_2691C0598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0598);
  }
  return result;
}

unint64_t sub_246A8E274()
{
  unint64_t result = qword_2691C05A0;
  if (!qword_2691C05A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C05A0);
  }
  return result;
}

unint64_t sub_246A8E2CC()
{
  unint64_t result = qword_2691C05A8;
  if (!qword_2691C05A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C05A8);
  }
  return result;
}

uint64_t sub_246A8E320(uint64_t a1, uint64_t a2)
{
  if (a1 == 120 && a2 == 0xE100000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 121 && a2 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246A8E3E0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7367028 && a2 == 0xE300000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C6464696DLL && a2 == 0xE600000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7235952 && a2 == 0xE300000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D6F74737563 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_246A8E554(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F697469736F70 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246A8E5DC()
{
  return 0x6E6F697469736F70;
}

uint64_t sub_246A8E5F4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7369776B636F6C63 && a2 == 0xE900000000000065;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000246ADACB0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246A8E6E4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 28789 && a2 == 0xE200000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1853321060 && a2 == 0xE400000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726568746965 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_246A8E7FC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1952867692 && a2 == 0xE400000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7468676972 && a2 == 0xE500000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726568746965 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_246A8E924(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C61636974726576 && a2 == 0xE800000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E6F7A69726F68 && a2 == 0xEA00000000006C61 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61487265707075 && a2 == 0xE900000000000066 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C61487265776F6CLL && a2 == 0xE900000000000066)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_246A8EAE0(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246A8EB50()
{
  return 12383;
}

uint64_t sub_246A8EB5C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1920298856 && a2 == 0xE400000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574756E696DLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246A8EC30(uint64_t a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C05B0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388]();
  char v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C05B8);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C05C0);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4((void *)a1, *(void *)(a1 + 24));
  sub_246A8F080();
  uint64_t v12 = v26;
  sub_246AD9150();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_246AD8FB0();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_246AD8E70();
    swift_allocError();
    uint64_t v18 = v17;
    sub_246A8604C(&qword_2691C05D0);
    *uint64_t v18 = &type metadata for Hand;
    sub_246AD8F40();
    sub_246AD8E30();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    sub_246A85F9C(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_246A8F0D4();
    sub_246AD8F30();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_246A8F128();
    sub_246AD8F30();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  sub_246A85F9C(v26);
  return a1;
}

unint64_t sub_246A8F080()
{
  unint64_t result = qword_2691C05C8;
  if (!qword_2691C05C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C05C8);
  }
  return result;
}

unint64_t sub_246A8F0D4()
{
  unint64_t result = qword_2691C05D8;
  if (!qword_2691C05D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C05D8);
  }
  return result;
}

unint64_t sub_246A8F128()
{
  unint64_t result = qword_2691C05E0;
  if (!qword_2691C05E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C05E0);
  }
  return result;
}

uint64_t sub_246A8F17C(void *a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C0600);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  uint64_t v38 = v3;
  MEMORY[0x270FA5388]();
  char v40 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_246A8604C(&qword_2691C0608);
  uint64_t v32 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388]();
  char v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_246A8604C(&qword_2691C0610);
  uint64_t v34 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246A8604C(&qword_2691C0618);
  uint64_t v33 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_246A8604C(&qword_2691C0620);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  char v41 = a1;
  uint64_t v16 = (uint64_t)sub_246A8A6E4(a1, v15);
  sub_246A8F8A0();
  uint64_t v17 = v43;
  sub_246AD9150();
  if (!v17)
  {
    uint64_t v18 = v10;
    uint64_t v31 = v8;
    uint64_t v19 = v7;
    uint64_t v21 = v39;
    uint64_t v20 = v40;
    uint64_t v43 = v12;
    uint64_t v22 = sub_246AD8FB0();
    if (*(void *)(v22 + 16) == 1)
    {
      switch(*(unsigned char *)(v22 + 32))
      {
        case 1:
          LOBYTE(v42) = 1;
          sub_246A8F9F0();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v19, v36);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v11);
          uint64_t v16 = 1;
          break;
        case 2:
          LOBYTE(v42) = 2;
          sub_246A8F99C();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v32 + 8))(v21, v35);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v11);
          uint64_t v16 = 2;
          break;
        case 3:
          LOBYTE(v42) = 3;
          sub_246A8F8F4();
          uint64_t v26 = v20;
          sub_246AD8F30();
          sub_246A8F948();
          uint64_t v28 = v37;
          sub_246AD8FA0();
          uint64_t v29 = v43;
          (*(void (**)(char *, uint64_t))(v38 + 8))(v26, v28);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v11);
          uint64_t v16 = v42;
          break;
        default:
          LOBYTE(v42) = 0;
          sub_246A8FA44();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v18, v31);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v11);
          uint64_t v16 = 0;
          break;
      }
    }
    else
    {
      uint64_t v23 = sub_246AD8E70();
      swift_allocError();
      uint64_t v16 = (uint64_t)v14;
      uint64_t v25 = v24;
      sub_246A8604C(&qword_2691C05D0);
      *uint64_t v25 = &type metadata for Hand.Anchor;
      sub_246AD8F40();
      sub_246AD8E30();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB0], v23);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v16, v11);
    }
  }
  sub_246A85F9C((uint64_t)v41);
  return v16;
}

unint64_t sub_246A8F8A0()
{
  unint64_t result = qword_2691C0628;
  if (!qword_2691C0628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0628);
  }
  return result;
}

unint64_t sub_246A8F8F4()
{
  unint64_t result = qword_2691C0630;
  if (!qword_2691C0630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0630);
  }
  return result;
}

unint64_t sub_246A8F948()
{
  unint64_t result = qword_2691C0638;
  if (!qword_2691C0638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0638);
  }
  return result;
}

unint64_t sub_246A8F99C()
{
  unint64_t result = qword_2691C0640;
  if (!qword_2691C0640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0640);
  }
  return result;
}

unint64_t sub_246A8F9F0()
{
  unint64_t result = qword_2691C0648;
  if (!qword_2691C0648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0648);
  }
  return result;
}

unint64_t sub_246A8FA44()
{
  unint64_t result = qword_2691C0650;
  if (!qword_2691C0650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0650);
  }
  return result;
}

unint64_t sub_246A8FA98()
{
  unint64_t result = qword_2691C0680;
  if (!qword_2691C0680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0680);
  }
  return result;
}

double sub_246A8FAEC(void *a1)
{
  uint64_t v4 = sub_246A8604C(&qword_2691C0688);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_246A8A6E4(a1, a1[3]);
  sub_246A8FC98();
  sub_246AD9150();
  if (!v1)
  {
    v10[15] = 0;
    sub_246AD8F80();
    double v2 = v8;
    v10[14] = 1;
    sub_246AD8F80();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_246A85F9C((uint64_t)a1);
  return v2;
}

unint64_t sub_246A8FC98()
{
  unint64_t result = qword_2691C0690;
  if (!qword_2691C0690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0690);
  }
  return result;
}

uint64_t sub_246A8FCEC(uint64_t a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C06A0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C06A8);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  double v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C06B0);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4((void *)a1, *(void *)(a1 + 24));
  sub_246A9013C();
  uint64_t v12 = v26;
  sub_246AD9150();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_246AD8FB0();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_246AD8E70();
    swift_allocError();
    uint64_t v18 = v17;
    sub_246A8604C(&qword_2691C05D0);
    *uint64_t v18 = &type metadata for Hand.Side;
    sub_246AD8F40();
    sub_246AD8E30();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    sub_246A85F9C(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_246A90190();
    sub_246AD8F30();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_246A901E4();
    sub_246AD8F30();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  sub_246A85F9C(v26);
  return a1;
}

unint64_t sub_246A9013C()
{
  unint64_t result = qword_2691C06B8;
  if (!qword_2691C06B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C06B8);
  }
  return result;
}

unint64_t sub_246A90190()
{
  unint64_t result = qword_2691C06C0;
  if (!qword_2691C06C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C06C0);
  }
  return result;
}

unint64_t sub_246A901E4()
{
  unint64_t result = qword_2691C06C8;
  if (!qword_2691C06C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C06C8);
  }
  return result;
}

uint64_t sub_246A90238(void *a1)
{
  uint64_t v38 = sub_246A8604C(&qword_2691C06E8);
  uint64_t v31 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v36 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_246A8604C(&qword_2691C06F0);
  uint64_t v34 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v37 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_246A8604C(&qword_2691C06F8);
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C0700);
  uint64_t v30 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  double v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C0708);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  char v39 = a1;
  sub_246A8A6E4(a1, v13);
  sub_246A90970();
  uint64_t v14 = v40;
  sub_246AD9150();
  if (!v14)
  {
    uint64_t v29 = v6;
    uint64_t v15 = v5;
    uint64_t v16 = v37;
    uint64_t v17 = v38;
    uint64_t v40 = v10;
    uint64_t v18 = sub_246AD8FB0();
    uint64_t v19 = v9;
    uint64_t v20 = v12;
    if (*(void *)(v18 + 16) == 1)
    {
      switch(*(unsigned char *)(v18 + 32))
      {
        case 1:
          char v44 = 1;
          sub_246A90A6C();
          sub_246AD8F30();
          sub_246A90AC0();
          uint64_t v25 = v35;
          sub_246AD8FA0();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v25);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v12, v19);
          uint64_t v12 = v43 | 0x40u;
          break;
        case 2:
          char v45 = 2;
          sub_246A90A18();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v16, v32);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v12, v19);
          uint64_t v12 = 128;
          break;
        case 3:
          uint64_t v26 = v17;
          char v46 = 3;
          sub_246A909C4();
          char v27 = v36;
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v26);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v20, v19);
          uint64_t v12 = 129;
          break;
        default:
          char v42 = 0;
          sub_246A90B14();
          uint64_t v21 = v8;
          sub_246AD8F30();
          sub_246A90B68();
          uint64_t v22 = v29;
          sub_246AD8FA0();
          (*(void (**)(char *, uint64_t))(v30 + 8))(v21, v22);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v12, v19);
          uint64_t v12 = v41;
          break;
      }
    }
    else
    {
      uint64_t v12 = sub_246AD8E70();
      swift_allocError();
      uint64_t v24 = v23;
      sub_246A8604C(&qword_2691C05D0);
      *uint64_t v24 = &type metadata for Hand.Orientation;
      sub_246AD8F40();
      sub_246AD8E30();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v24, *MEMORY[0x263F8DCB0], v12);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v20, v19);
    }
  }
  sub_246A85F9C((uint64_t)v39);
  return v12;
}

unint64_t sub_246A90970()
{
  unint64_t result = qword_2691C0710;
  if (!qword_2691C0710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0710);
  }
  return result;
}

unint64_t sub_246A909C4()
{
  unint64_t result = qword_2691C0718;
  if (!qword_2691C0718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0718);
  }
  return result;
}

unint64_t sub_246A90A18()
{
  unint64_t result = qword_2691C0720;
  if (!qword_2691C0720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0720);
  }
  return result;
}

unint64_t sub_246A90A6C()
{
  unint64_t result = qword_2691C0728;
  if (!qword_2691C0728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0728);
  }
  return result;
}

unint64_t sub_246A90AC0()
{
  unint64_t result = qword_2691C0730;
  if (!qword_2691C0730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0730);
  }
  return result;
}

unint64_t sub_246A90B14()
{
  unint64_t result = qword_2691C0738;
  if (!qword_2691C0738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0738);
  }
  return result;
}

unint64_t sub_246A90B68()
{
  unint64_t result = qword_2691C0740;
  if (!qword_2691C0740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0740);
  }
  return result;
}

unint64_t sub_246A90BBC()
{
  unint64_t result = qword_2691C0770;
  if (!qword_2691C0770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0770);
  }
  return result;
}

unint64_t sub_246A90C10()
{
  unint64_t result = qword_2691C0778;
  if (!qword_2691C0778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0778);
  }
  return result;
}

void *sub_246A90C64(void *a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C0780);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388]();
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_246A8604C(&qword_2691C0788);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C0790);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  double v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C0798);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_246A8A6E4(a1, a1[3]);
  sub_246A911D4();
  uint64_t v12 = (uint64_t)v30;
  sub_246AD9150();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  uint64_t v14 = v11;
  uint64_t v15 = sub_246AD8FB0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_246AD8E70();
    swift_allocError();
    uint64_t v11 = v18;
    sub_246A8604C(&qword_2691C05D0);
    *uint64_t v11 = &type metadata for Hand.Orientation.Direction.Vertical;
    sub_246AD8F40();
    sub_246AD8E30();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    sub_246A85F9C((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_246A9127C();
      sub_246AD8F30();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_246A91228();
      sub_246AD8F30();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_246A912D0();
    sub_246AD8F30();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  sub_246A85F9C((uint64_t)v30);
  return v11;
}

unint64_t sub_246A911D4()
{
  unint64_t result = qword_2691C07A0;
  if (!qword_2691C07A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C07A0);
  }
  return result;
}

unint64_t sub_246A91228()
{
  unint64_t result = qword_2691C07A8;
  if (!qword_2691C07A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C07A8);
  }
  return result;
}

unint64_t sub_246A9127C()
{
  unint64_t result = qword_2691C07B0;
  if (!qword_2691C07B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C07B0);
  }
  return result;
}

unint64_t sub_246A912D0()
{
  unint64_t result = qword_2691C07B8;
  if (!qword_2691C07B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C07B8);
  }
  return result;
}

void *sub_246A91324(void *a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C07E0);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388]();
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_246A8604C(&qword_2691C07E8);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C07F0);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  double v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C07F8);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_246A8A6E4(a1, a1[3]);
  sub_246A91894();
  uint64_t v12 = (uint64_t)v30;
  sub_246AD9150();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  uint64_t v14 = v11;
  uint64_t v15 = sub_246AD8FB0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_246AD8E70();
    swift_allocError();
    uint64_t v11 = v18;
    sub_246A8604C(&qword_2691C05D0);
    *uint64_t v11 = &type metadata for Hand.Orientation.Direction.Horizontal;
    sub_246AD8F40();
    sub_246AD8E30();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    sub_246A85F9C((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_246A9193C();
      sub_246AD8F30();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_246A918E8();
      sub_246AD8F30();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_246A91990();
    sub_246AD8F30();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  sub_246A85F9C((uint64_t)v30);
  return v11;
}

unint64_t sub_246A91894()
{
  unint64_t result = qword_2691C0800;
  if (!qword_2691C0800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0800);
  }
  return result;
}

unint64_t sub_246A918E8()
{
  unint64_t result = qword_2691C0808;
  if (!qword_2691C0808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0808);
  }
  return result;
}

unint64_t sub_246A9193C()
{
  unint64_t result = qword_2691C0810;
  if (!qword_2691C0810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0810);
  }
  return result;
}

unint64_t sub_246A91990()
{
  unint64_t result = qword_2691C0818;
  if (!qword_2691C0818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0818);
  }
  return result;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Horizontal.CodingKeys()
{
  return &type metadata for Hand.Orientation.Direction.Horizontal.CodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Horizontal.LeftCodingKeys()
{
  return &type metadata for Hand.Orientation.Direction.Horizontal.LeftCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Horizontal.RightCodingKeys()
{
  return &type metadata for Hand.Orientation.Direction.Horizontal.RightCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Horizontal.EitherCodingKeys()
{
  return &type metadata for Hand.Orientation.Direction.Horizontal.EitherCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Vertical.CodingKeys()
{
  return &type metadata for Hand.Orientation.Direction.Vertical.CodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Vertical.UpCodingKeys()
{
  return &type metadata for Hand.Orientation.Direction.Vertical.UpCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Vertical.DownCodingKeys()
{
  return &type metadata for Hand.Orientation.Direction.Vertical.DownCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Vertical.EitherCodingKeys()
{
  return &type metadata for Hand.Orientation.Direction.Vertical.EitherCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.CodingKeys()
{
  return &type metadata for Hand.Orientation.CodingKeys;
}

uint64_t sub_246A91A90()
{
  return 0;
}

ValueMetadata *type metadata accessor for Hand.Orientation.VerticalCodingKeys()
{
  return &type metadata for Hand.Orientation.VerticalCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.HorizontalCodingKeys()
{
  return &type metadata for Hand.Orientation.HorizontalCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.UpperHalfCodingKeys()
{
  return &type metadata for Hand.Orientation.UpperHalfCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Orientation.LowerHalfCodingKeys()
{
  return &type metadata for Hand.Orientation.LowerHalfCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Side.CodingKeys()
{
  return &type metadata for Hand.Side.CodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Side.ClockwiseCodingKeys()
{
  return &type metadata for Hand.Side.ClockwiseCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Side.CounterclockwiseCodingKeys()
{
  return &type metadata for Hand.Side.CounterclockwiseCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.AnchorPosition.CodingKeys()
{
  return &type metadata for Hand.AnchorPosition.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RoutineType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s32NTKEsterbrookFaceBundleCompanion4HandO11OrientationO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246A91C7CLL);
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

ValueMetadata *type metadata accessor for Hand.Anchor.CodingKeys()
{
  return &type metadata for Hand.Anchor.CodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Anchor.TipCodingKeys()
{
  return &type metadata for Hand.Anchor.TipCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Anchor.MiddleCodingKeys()
{
  return &type metadata for Hand.Anchor.MiddleCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.Anchor.PinCodingKeys()
{
  return &type metadata for Hand.Anchor.PinCodingKeys;
}

uint64_t getEnumTagSinglePayload for Atlas.IndexMappingBehavior(unsigned int *a1, int a2)
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

unsigned char *_s32NTKEsterbrookFaceBundleCompanion4HandO11OrientationO18VerticalCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x246A91DD0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Hand.Anchor.CustomCodingKeys()
{
  return &type metadata for Hand.Anchor.CustomCodingKeys;
}

unsigned char *sub_246A91E08(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Hand.CodingKeys()
{
  return &type metadata for Hand.CodingKeys;
}

ValueMetadata *type metadata accessor for Hand.HourCodingKeys()
{
  return &type metadata for Hand.HourCodingKeys;
}

ValueMetadata *type metadata accessor for Hand.MinuteCodingKeys()
{
  return &type metadata for Hand.MinuteCodingKeys;
}

__n128 initializeBufferWithCopyOfBuffer for Hand.Anchor(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Hand.Anchor(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Hand.Anchor(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

uint64_t sub_246A91EA8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_246A91EC4(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
  }
  else
  {
    *(unsigned char *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Hand.Anchor()
{
  return &type metadata for Hand.Anchor;
}

ValueMetadata *type metadata accessor for Hand.AnchorPosition()
{
  return &type metadata for Hand.AnchorPosition;
}

ValueMetadata *type metadata accessor for Hand.Side()
{
  return &type metadata for Hand.Side;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Vertical()
{
  return &type metadata for Hand.Orientation.Direction.Vertical;
}

uint64_t getEnumTagSinglePayload for AnimatingState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s32NTKEsterbrookFaceBundleCompanion4HandOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x246A92080);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Hand()
{
  return &type metadata for Hand;
}

uint64_t getEnumTagSinglePayload for Hand.Orientation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x3E) {
    goto LABEL_17;
  }
  if (a2 + 194 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 194) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 194;
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
      return (*a1 | (v4 << 8)) - 194;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 194;
    }
  }
LABEL_17:
  unsigned int v6 = (*a1 & 0x3C | (*a1 >> 6)) ^ 0x3F;
  if (v6 >= 0x3D) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for Hand.Orientation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 194 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 194) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x3E) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x3D)
  {
    unsigned int v6 = ((a2 - 62) >> 8) + 1;
    *__n128 result = a2 - 62;
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
        JUMPOUT(0x246A9222CLL);
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
          *__n128 result = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_246A92254(unsigned char *a1)
{
  int v1 = (char)*a1;
  if (v1 >= 0) {
    return *a1 >> 6;
  }
  else {
    return (v1 & 3u) + 2;
  }
}

unsigned char *sub_246A92270(unsigned char *result)
{
  *result &= 0x3Fu;
  return result;
}

unsigned char *sub_246A92280(unsigned char *result, unsigned int a2)
{
  if (a2 < 2) {
    *__n128 result = *result & 3 | ((_BYTE)a2 << 6);
  }
  else {
    *__n128 result = (a2 + 2) & 3 | 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for Hand.Orientation()
{
  return &type metadata for Hand.Orientation;
}

ValueMetadata *type metadata accessor for Hand.Orientation.Direction()
{
  return &type metadata for Hand.Orientation.Direction;
}

uint64_t getEnumTagSinglePayload for Atlas.IndexPattern(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s32NTKEsterbrookFaceBundleCompanion4HandO11OrientationO9DirectionO8VerticalOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246A9242CLL);
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

ValueMetadata *type metadata accessor for Hand.Orientation.Direction.Horizontal()
{
  return &type metadata for Hand.Orientation.Direction.Horizontal;
}

unint64_t sub_246A92468()
{
  unint64_t result = qword_2691C0840;
  if (!qword_2691C0840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0840);
  }
  return result;
}

unint64_t sub_246A924C0()
{
  unint64_t result = qword_2691C0848;
  if (!qword_2691C0848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0848);
  }
  return result;
}

unint64_t sub_246A92518()
{
  unint64_t result = qword_2691C0850;
  if (!qword_2691C0850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0850);
  }
  return result;
}

unint64_t sub_246A92570()
{
  unint64_t result = qword_2691C0858;
  if (!qword_2691C0858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0858);
  }
  return result;
}

unint64_t sub_246A925C8()
{
  unint64_t result = qword_2691C0860;
  if (!qword_2691C0860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0860);
  }
  return result;
}

unint64_t sub_246A92620()
{
  unint64_t result = qword_2691C0868;
  if (!qword_2691C0868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0868);
  }
  return result;
}

unint64_t sub_246A92678()
{
  unint64_t result = qword_2691C0870;
  if (!qword_2691C0870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0870);
  }
  return result;
}

unint64_t sub_246A926D0()
{
  unint64_t result = qword_2691C0878;
  if (!qword_2691C0878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0878);
  }
  return result;
}

unint64_t sub_246A92728()
{
  unint64_t result = qword_2691C0880;
  if (!qword_2691C0880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0880);
  }
  return result;
}

unint64_t sub_246A92780()
{
  unint64_t result = qword_2691C0888;
  if (!qword_2691C0888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0888);
  }
  return result;
}

unint64_t sub_246A927D8()
{
  unint64_t result = qword_2691C0890;
  if (!qword_2691C0890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0890);
  }
  return result;
}

unint64_t sub_246A92830()
{
  unint64_t result = qword_2691C0898;
  if (!qword_2691C0898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0898);
  }
  return result;
}

unint64_t sub_246A92888()
{
  unint64_t result = qword_2691C08A0;
  if (!qword_2691C08A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08A0);
  }
  return result;
}

unint64_t sub_246A928E0()
{
  unint64_t result = qword_2691C08A8;
  if (!qword_2691C08A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08A8);
  }
  return result;
}

unint64_t sub_246A92938()
{
  unint64_t result = qword_2691C08B0;
  if (!qword_2691C08B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08B0);
  }
  return result;
}

unint64_t sub_246A92990()
{
  unint64_t result = qword_2691C08B8;
  if (!qword_2691C08B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08B8);
  }
  return result;
}

unint64_t sub_246A929E8()
{
  unint64_t result = qword_2691C08C0;
  if (!qword_2691C08C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08C0);
  }
  return result;
}

unint64_t sub_246A92A40()
{
  unint64_t result = qword_2691C08C8;
  if (!qword_2691C08C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08C8);
  }
  return result;
}

unint64_t sub_246A92A98()
{
  unint64_t result = qword_2691C08D0;
  if (!qword_2691C08D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08D0);
  }
  return result;
}

unint64_t sub_246A92AF0()
{
  unint64_t result = qword_2691C08D8;
  if (!qword_2691C08D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08D8);
  }
  return result;
}

unint64_t sub_246A92B48()
{
  unint64_t result = qword_2691C08E0;
  if (!qword_2691C08E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08E0);
  }
  return result;
}

unint64_t sub_246A92BA0()
{
  unint64_t result = qword_2691C08E8;
  if (!qword_2691C08E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08E8);
  }
  return result;
}

unint64_t sub_246A92BF8()
{
  unint64_t result = qword_2691C08F0;
  if (!qword_2691C08F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08F0);
  }
  return result;
}

unint64_t sub_246A92C50()
{
  unint64_t result = qword_2691C08F8;
  if (!qword_2691C08F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C08F8);
  }
  return result;
}

unint64_t sub_246A92CA8()
{
  unint64_t result = qword_2691C0900;
  if (!qword_2691C0900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0900);
  }
  return result;
}

unint64_t sub_246A92D00()
{
  unint64_t result = qword_2691C0908;
  if (!qword_2691C0908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0908);
  }
  return result;
}

unint64_t sub_246A92D58()
{
  unint64_t result = qword_2691C0910;
  if (!qword_2691C0910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0910);
  }
  return result;
}

unint64_t sub_246A92DB0()
{
  unint64_t result = qword_2691C0918;
  if (!qword_2691C0918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0918);
  }
  return result;
}

unint64_t sub_246A92E08()
{
  unint64_t result = qword_2691C0920;
  if (!qword_2691C0920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0920);
  }
  return result;
}

unint64_t sub_246A92E60()
{
  unint64_t result = qword_2691C0928;
  if (!qword_2691C0928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0928);
  }
  return result;
}

unint64_t sub_246A92EB8()
{
  unint64_t result = qword_2691C0930;
  if (!qword_2691C0930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0930);
  }
  return result;
}

unint64_t sub_246A92F10()
{
  unint64_t result = qword_2691C0938;
  if (!qword_2691C0938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0938);
  }
  return result;
}

unint64_t sub_246A92F68()
{
  unint64_t result = qword_2691C0940;
  if (!qword_2691C0940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0940);
  }
  return result;
}

unint64_t sub_246A92FC0()
{
  unint64_t result = qword_2691C0948;
  if (!qword_2691C0948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0948);
  }
  return result;
}

unint64_t sub_246A93018()
{
  unint64_t result = qword_2691C0950;
  if (!qword_2691C0950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0950);
  }
  return result;
}

unint64_t sub_246A93070()
{
  unint64_t result = qword_2691C0958;
  if (!qword_2691C0958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0958);
  }
  return result;
}

unint64_t sub_246A930C8()
{
  unint64_t result = qword_2691C0960;
  if (!qword_2691C0960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0960);
  }
  return result;
}

unint64_t sub_246A93120()
{
  unint64_t result = qword_2691C0968;
  if (!qword_2691C0968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0968);
  }
  return result;
}

unint64_t sub_246A93178()
{
  unint64_t result = qword_2691C0970;
  if (!qword_2691C0970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0970);
  }
  return result;
}

unint64_t sub_246A931D0()
{
  unint64_t result = qword_2691C0978;
  if (!qword_2691C0978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0978);
  }
  return result;
}

unint64_t sub_246A93228()
{
  unint64_t result = qword_2691C0980;
  if (!qword_2691C0980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0980);
  }
  return result;
}

unint64_t sub_246A93280()
{
  unint64_t result = qword_2691C0988;
  if (!qword_2691C0988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0988);
  }
  return result;
}

unint64_t sub_246A932D8()
{
  unint64_t result = qword_2691C0990;
  if (!qword_2691C0990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0990);
  }
  return result;
}

unint64_t sub_246A93330()
{
  unint64_t result = qword_2691C0998;
  if (!qword_2691C0998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0998);
  }
  return result;
}

unint64_t sub_246A93388()
{
  unint64_t result = qword_2691C09A0;
  if (!qword_2691C09A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09A0);
  }
  return result;
}

unint64_t sub_246A933E0()
{
  unint64_t result = qword_2691C09A8;
  if (!qword_2691C09A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09A8);
  }
  return result;
}

unint64_t sub_246A93438()
{
  unint64_t result = qword_2691C09B0;
  if (!qword_2691C09B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09B0);
  }
  return result;
}

unint64_t sub_246A93490()
{
  unint64_t result = qword_2691C09B8;
  if (!qword_2691C09B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09B8);
  }
  return result;
}

unint64_t sub_246A934E8()
{
  unint64_t result = qword_2691C09C0;
  if (!qword_2691C09C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09C0);
  }
  return result;
}

unint64_t sub_246A93540()
{
  unint64_t result = qword_2691C09C8;
  if (!qword_2691C09C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09C8);
  }
  return result;
}

unint64_t sub_246A93598()
{
  unint64_t result = qword_2691C09D0;
  if (!qword_2691C09D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09D0);
  }
  return result;
}

unint64_t sub_246A935F0()
{
  unint64_t result = qword_2691C09D8;
  if (!qword_2691C09D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09D8);
  }
  return result;
}

unint64_t sub_246A93648()
{
  unint64_t result = qword_2691C09E0;
  if (!qword_2691C09E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09E0);
  }
  return result;
}

unint64_t sub_246A936A0()
{
  unint64_t result = qword_2691C09E8;
  if (!qword_2691C09E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09E8);
  }
  return result;
}

unint64_t sub_246A936F8()
{
  unint64_t result = qword_2691C09F0;
  if (!qword_2691C09F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09F0);
  }
  return result;
}

unint64_t sub_246A93750()
{
  unint64_t result = qword_2691C09F8;
  if (!qword_2691C09F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C09F8);
  }
  return result;
}

unint64_t sub_246A937A8()
{
  unint64_t result = qword_2691C0A00;
  if (!qword_2691C0A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0A00);
  }
  return result;
}

unint64_t sub_246A93800()
{
  unint64_t result = qword_2691C0A08;
  if (!qword_2691C0A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0A08);
  }
  return result;
}

unint64_t sub_246A93858()
{
  unint64_t result = qword_2691C0A10;
  if (!qword_2691C0A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0A10);
  }
  return result;
}

unint64_t sub_246A938B0()
{
  unint64_t result = qword_2691C0A18;
  if (!qword_2691C0A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0A18);
  }
  return result;
}

unint64_t sub_246A93908()
{
  unint64_t result = qword_2691C0A20;
  if (!qword_2691C0A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0A20);
  }
  return result;
}

unint64_t sub_246A93960()
{
  unint64_t result = qword_2691C0A28;
  if (!qword_2691C0A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0A28);
  }
  return result;
}

id sub_246A93A20()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

  return v1;
}

void sub_246A93A78(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v62[22] = a2;
  uint64_t v3 = sub_246AD8E60();
  v62[20] = *(void *)(v3 - 8);
  v62[21] = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  v62[16] = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v62[18] = (char *)v62 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v62[19] = (char *)v62 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v62[13] = (char *)v62 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v62[15] = (char *)v62 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v62[14] = (char *)v62 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v62[10] = (char *)v62 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v62[12] = (char *)v62 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v62[11] = (char *)v62 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v62[7] = (char *)v62 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v62[8] = (char *)v62 - v25;
  MEMORY[0x270FA5388](v24);
  v62[9] = (char *)v62 - v26;
  uint64_t v27 = sub_246AD8E70();
  v62[17] = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)v62 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_246AD8940();
  uint64_t v64 = *(void *)(v66 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v66);
  char v32 = (char *)v62 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)v62 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  uint64_t v38 = (char *)v62 - v37;
  uint64_t v39 = MEMORY[0x270FA5388](v36);
  unsigned __int8 v41 = (char *)v62 - v40;
  uint64_t v42 = MEMORY[0x270FA5388](v39);
  char v44 = (char *)v62 - v43;
  MEMORY[0x270FA5388](v42);
  char v46 = (char *)v62 - v45;
  uint64_t v63 = a1;
  uint64_t v47 = v65;
  uint64_t v48 = sub_246AD8950();
  if (v47)
  {

    if (qword_2691C0230 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_246AD8AD0();
    sub_246A8AB74(v50, (uint64_t)qword_2691D4048);
    uint64_t v51 = v64;
    uint64_t v52 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v46, v63, v66);
    BOOL v53 = sub_246AD8AB0();
    os_log_type_t v54 = sub_246AD8CF0();
    if (os_log_type_enabled(v53, v54))
    {
      char v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v68 = v56;
      *(_DWORD *)char v55 = 136315138;
      uint64_t v57 = sub_246AD8910();
      uint64_t v67 = sub_246ACB68C(v57, v58, &v68);
      sub_246AD8D90();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v46, v66);
      _os_log_impl(&dword_246A80000, v53, v54, "Could not load scene data from url: %s", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C541130](v56, -1, -1);
      MEMORY[0x24C541130](v55, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v51 + 8))(v46, v52);
    }

    sub_246A960BC();
    swift_allocError();
    *(_OWORD *)uint64_t v61 = xmmword_246ADE960;
    *(unsigned char *)(v61 + 16) = 3;
    swift_willThrow();
  }
  else
  {
    v62[1] = v44;
    v62[6] = v29;
    v62[3] = v38;
    v62[4] = v35;
    v65 = v32;
    v62[2] = v41;
    uint64_t v59 = v48;
    unint64_t v60 = v49;
    sub_246AD88D0();
    swift_allocObject();
    sub_246AD88C0();
    type metadata accessor for Scene();
    sub_246A96110(&qword_2691C0A50, (void (*)(uint64_t))type metadata accessor for Scene);
    sub_246AD88B0();
    swift_release();
    sub_246A96158(v59, v60);
  }
}

id sub_246A9582C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneLoader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SceneLoader()
{
  return self;
}

unint64_t sub_246A95884(uint64_t a1)
{
  sub_246A8604C(&qword_2691C0A30);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246AD8940();
  uint64_t v57 = *(void *)(v4 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v51 = (char *)&v49 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v49 - v10;
  uint64_t v12 = sub_246AD88F0();
  uint64_t v55 = *(void *)(v12 - 8);
  uint64_t v56 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_msgSend(self, sel_defaultManager);
  sub_246A8604C(&qword_2691C0A38);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_246ADE980;
  uint64_t v17 = (void *)*MEMORY[0x263EFF750];
  uint64_t v18 = (void *)*MEMORY[0x263EFF6A8];
  *(void *)(v16 + 32) = *MEMORY[0x263EFF750];
  *(void *)(v16 + 40) = v18;
  id v19 = v17;
  id v20 = v18;
  uint64_t v21 = (void *)sub_246AD8CC0();

  swift_bridgeObjectRelease();
  if (v21)
  {
    id v53 = v21;
    sub_246AD8CB0();
    sub_246AD88E0();
    if (v61)
    {
      uint64_t v22 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56);
      uint64_t v23 = (unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48);
      unint64_t v58 = (void (**)(char *, uint64_t))(v57 + 8);
      uint64_t v59 = (void (**)(char *, char *, uint64_t))(v57 + 32);
      unint64_t v49 = (void (**)(char *, char *, uint64_t))(v57 + 16);
      uint64_t v54 = MEMORY[0x263F8EE78];
      uint64_t v52 = "T@\"NSBundle\",N,R";
      unint64_t v50 = 0x8000000246ADAD30;
      while (1)
      {
        int v24 = swift_dynamicCast();
        uint64_t v25 = *v22;
        if (v24)
        {
          v25(v3, 0, 1, v4);
          if ((*v23)(v3, 1, v4) != 1)
          {
            uint64_t v26 = *v59;
            (*v59)(v11, v3, v4);
            if (sub_246AD8910() == 0x696C702E6F666E49 && v27 == 0xEA00000000007473)
            {
LABEL_11:
              swift_bridgeObjectRelease();
            }
            else
            {
              char v28 = sub_246AD9060();
              swift_bridgeObjectRelease();
              if ((v28 & 1) == 0)
              {
                if (sub_246AD8910() == 0xD000000000000016 && v29 == v50) {
                  goto LABEL_11;
                }
                char v30 = sub_246AD9060();
                swift_bridgeObjectRelease();
                if ((v30 & 1) == 0)
                {
                  uint64_t v31 = sub_246AD8900();
                  uint64_t v33 = v32;
                  if (qword_2691C0258 != -1) {
                    swift_once();
                  }
                  if (v31 == qword_2691D40B8 && v33 == unk_2691D40C0)
                  {
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    char v34 = sub_246AD9060();
                    swift_bridgeObjectRelease();
                    if ((v34 & 1) == 0) {
                      goto LABEL_16;
                    }
                  }
                  (*v49)(v51, v11, v4);
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                    uint64_t v54 = sub_246AD0380(0, *(void *)(v54 + 16) + 1, 1, v54);
                  }
                  uint64_t v35 = v54;
                  unint64_t v37 = *(void *)(v54 + 16);
                  unint64_t v36 = *(void *)(v54 + 24);
                  if (v37 >= v36 >> 1) {
                    uint64_t v35 = sub_246AD0380(v36 > 1, v37 + 1, 1, v54);
                  }
                  *(void *)(v35 + 16) = v37 + 1;
                  unint64_t v38 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
                  uint64_t v54 = v35;
                  v26((char *)(v35 + v38 + *(void *)(v57 + 72) * v37), v51, v4);
                }
              }
            }
LABEL_16:
            (*v58)(v11, v4);
            goto LABEL_6;
          }
        }
        else
        {
          v25(v3, 1, 1, v4);
        }
        sub_246A9605C((uint64_t)v3);
LABEL_6:
        sub_246AD88E0();
        if (!v61) {
          goto LABEL_33;
        }
      }
    }
    uint64_t v54 = MEMORY[0x263F8EE78];
LABEL_33:
    (*(void (**)(char *, uint64_t))(v55 + 8))(v14, v56);

    return v54;
  }
  else
  {
    if (qword_2691C0230 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_246AD8AD0();
    sub_246A8AB74(v39, (uint64_t)qword_2691D4048);
    uint64_t v40 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v7, a1, v4);
    unsigned __int8 v41 = sub_246AD8AB0();
    os_log_type_t v42 = sub_246AD8CF0();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = v40;
      uint64_t v45 = swift_slowAlloc();
      v60[0] = v45;
      *(_DWORD *)uint64_t v43 = 136315138;
      sub_246A96110(&qword_2691C0A40, MEMORY[0x263F06EA8]);
      uint64_t v46 = sub_246AD9030();
      uint64_t v62 = sub_246ACB68C(v46, v47, v60);
      sub_246AD8D90();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v7, v4);
      _os_log_impl(&dword_246A80000, v41, v42, "FileManager failed to enumerate scenes bundle at url: %s.", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C541130](v45, -1, -1);
      MEMORY[0x24C541130](v43, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
    }

    return MEMORY[0x263F8EE78];
  }
}

uint64_t sub_246A9605C(uint64_t a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C0A30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_246A960BC()
{
  unint64_t result = qword_2691C0A48;
  if (!qword_2691C0A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0A48);
  }
  return result;
}

uint64_t sub_246A96110(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246A96158(uint64_t a1, unint64_t a2)
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

uint64_t sub_246A961B0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_246A961C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_246A96230(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for SceneDecodingError(uint64_t a1)
{
  return sub_246A96254(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_246A96254(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s32NTKEsterbrookFaceBundleCompanion18SceneDecodingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_246A96230(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SceneDecodingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_246A96230(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_246A96254(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for SceneDecodingError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_246A96254(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneDecodingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneDecodingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_246A963E0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_246A963F8(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SceneDecodingError()
{
  return &type metadata for SceneDecodingError;
}

uint64_t sub_246A96420(char a1)
{
  return qword_246ADF6B0[a1];
}

uint64_t sub_246A96440(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_246A8604C(&qword_2691C0AA8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A98BD0();
  sub_246AD9160();
  LOBYTE(v17) = 0;
  sub_246AD89C0();
  sub_246A98C78(&qword_2691C0500, MEMORY[0x263F07508]);
  sub_246AD9020();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for TimeRule();
    uint64_t v10 = (long long *)(v3 + *(int *)(v9 + 20));
    char v11 = *((unsigned char *)v10 + 16);
    long long v17 = *v10;
    char v18 = v11;
    char v16 = 1;
    sub_246A98CC0();
    sub_246AD9020();
    uint64_t v12 = (long long *)(v3 + *(int *)(v9 + 24));
    char v13 = *((unsigned char *)v12 + 16);
    long long v17 = *v12;
    char v18 = v13;
    char v16 = 2;
    sub_246AD9020();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_246A9666C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v4 = sub_246AD89C0();
  uint64_t v25 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v23 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_246A8604C(&qword_2691C0A90);
  uint64_t v22 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TimeRule();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246AD89B0();
  sub_246A8A6E4(a1, a1[3]);
  sub_246A98BD0();
  sub_246AD9150();
  if (v2)
  {
    uint64_t v11 = v25;
    sub_246A85F9C((uint64_t)a1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v10, v4);
  }
  else
  {
    uint64_t v20 = v8;
    uint64_t v12 = v22;
    LOBYTE(v26) = 0;
    sub_246A98C78(&qword_2691C04A0, MEMORY[0x263F07508]);
    char v13 = v23;
    sub_246AD8FA0();
    (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v10, v13, v4);
    char v28 = 1;
    sub_246A98C24();
    sub_246AD8FA0();
    char v14 = v27;
    uint64_t v15 = &v10[*(int *)(v20 + 20)];
    *(_OWORD *)uint64_t v15 = v26;
    v15[16] = v14;
    char v28 = 2;
    sub_246AD8FA0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v24);
    char v17 = v27;
    uint64_t v18 = v21;
    id v19 = &v10[*(int *)(v20 + 24)];
    *(_OWORD *)id v19 = v26;
    v19[16] = v17;
    sub_246A9831C((uint64_t)v10, v18);
    sub_246A85F9C((uint64_t)a1);
    return sub_246A98380((uint64_t)v10);
  }
}

uint64_t sub_246A96A24()
{
  return sub_246A96420(*v0);
}

uint64_t sub_246A96A2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A98D14(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A96A54(uint64_t a1)
{
  unint64_t v2 = sub_246A98BD0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A96A90(uint64_t a1)
{
  unint64_t v2 = sub_246A98BD0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A96AD0()
{
  sub_246AD9100();
  sub_246AD89C0();
  sub_246A98C78(&qword_2691C0488, MEMORY[0x263F07508]);
  sub_246AD8B60();
  unint64_t v0 = sub_246A9A0D4();
  sub_246A97E80((uint64_t)v2, (uint64_t)&type metadata for TimeUnit, v0);
  sub_246A97E80((uint64_t)v2, (uint64_t)&type metadata for TimeUnit, v0);
  return sub_246AD9140();
}

uint64_t sub_246A96BD8(uint64_t a1)
{
  sub_246AD89C0();
  sub_246A98C78(&qword_2691C0488, MEMORY[0x263F07508]);
  sub_246AD8B60();
  unint64_t v2 = sub_246A9A0D4();
  sub_246A97E80(a1, (uint64_t)&type metadata for TimeUnit, v2);
  return sub_246A97E80(a1, (uint64_t)&type metadata for TimeUnit, v2);
}

uint64_t sub_246A96CD0()
{
  sub_246AD9100();
  sub_246AD89C0();
  sub_246A98C78(&qword_2691C0488, MEMORY[0x263F07508]);
  sub_246AD8B60();
  unint64_t v0 = sub_246A9A0D4();
  sub_246A97E80((uint64_t)v2, (uint64_t)&type metadata for TimeUnit, v0);
  sub_246A97E80((uint64_t)v2, (uint64_t)&type metadata for TimeUnit, v0);
  return sub_246AD9140();
}

uint64_t sub_246A96DD4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246A9666C(a1, a2);
}

uint64_t sub_246A96DEC(void *a1)
{
  return sub_246A96440(a1);
}

uint64_t sub_246A96E04(char a1)
{
  return qword_246ADF6C8[a1];
}

uint64_t sub_246A96E24(char a1)
{
  return *(void *)&aStart_2[8 * a1];
}

uint64_t sub_246A96E44(char a1)
{
  if (a1) {
    return 6581861;
  }
  else {
    return 0x7472617473;
  }
}

uint64_t sub_246A96E70(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v48 = a4;
  v32[1] = a3;
  uint64_t v44 = a2;
  uint64_t v41 = sub_246A8604C(&qword_2691C0B28);
  uint64_t v34 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v39 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C0B30);
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v43 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_246A8604C(&qword_2691C0B38);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  unint64_t v37 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C0B40);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_246A8604C(&qword_2691C0B48);
  uint64_t v35 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  char v14 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_246A8604C(&qword_2691C0B50);
  uint64_t v45 = *(void *)(v15 - 8);
  uint64_t v46 = v15;
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A99D8C();
  uint64_t v18 = v17;
  unsigned __int8 v19 = v48;
  sub_246AD9160();
  switch(v19 >> 5)
  {
    case 1:
      char v53 = 2;
      sub_246A99F30();
      uint64_t v21 = v37;
      uint64_t v22 = v46;
      uint64_t v23 = v18;
      sub_246AD8FC0();
      char v52 = 0;
      uint64_t v24 = v38;
      uint64_t v25 = v47;
      sub_246AD9010();
      if (!v25)
      {
        char v51 = 1;
        sub_246AD9010();
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v24);
      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v23, v22);
    case 2:
      char v58 = 3;
      sub_246A99E88();
      char v27 = v40;
      uint64_t v20 = v46;
      sub_246AD8FC0();
      char v57 = 0;
      uint64_t v28 = v43;
      uint64_t v29 = v47;
      sub_246AD9010();
      if (!v29)
      {
        char v56 = 1;
        sub_246AD9010();
        char v55 = v19 & 1;
        char v54 = 2;
        sub_246A9A080();
        sub_246AD9020();
      }
      uint64_t v31 = v42;
      goto LABEL_11;
    case 3:
      char v60 = 4;
      sub_246A99DE0();
      char v27 = v39;
      uint64_t v20 = v46;
      sub_246AD8FC0();
      char v59 = v44;
      sub_246A9A02C();
      uint64_t v28 = v41;
      sub_246AD9020();
      uint64_t v31 = v34;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v28);
      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v18, v20);
    case 4:
      char v49 = 0;
      sub_246A99FD8();
      uint64_t v30 = v46;
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v12);
      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v18, v30);
    default:
      char v50 = 1;
      sub_246A99F84();
      uint64_t v20 = v46;
      sub_246AD8FC0();
      sub_246AD9010();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v18, v20);
  }
}

uint64_t sub_246A97528(char a1)
{
  if (a1) {
    return 0x6465726975716572;
  }
  else {
    return 0x6572726566657270;
  }
}

uint64_t sub_246A97564(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C0C48);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_246A8604C(&qword_2691C0C50);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C0C58);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A9B16C();
  sub_246AD9160();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_246A9B1C0();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_246A9B214();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

uint64_t sub_246A97814(uint64_t a1)
{
  unint64_t v2 = sub_246A99FD8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A97850(uint64_t a1)
{
  unint64_t v2 = sub_246A99FD8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9788C()
{
  return sub_246A96E04(*v0);
}

uint64_t sub_246A97894@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A98E2C(a1, a2);
  *a3 = result;
  return result;
}

void sub_246A978BC(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_246A978C8(uint64_t a1)
{
  unint64_t v2 = sub_246A99D8C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A97904(uint64_t a1)
{
  unint64_t v2 = sub_246A99D8C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A97944@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A99014(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A97970(uint64_t a1)
{
  unint64_t v2 = sub_246A99F84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A979AC(uint64_t a1)
{
  unint64_t v2 = sub_246A99F84();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A979E8()
{
  return sub_246A96E24(*v0);
}

uint64_t sub_246A979F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A9909C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A97A18(uint64_t a1)
{
  unint64_t v2 = sub_246A99E88();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A97A54(uint64_t a1)
{
  unint64_t v2 = sub_246A99E88();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A97A90()
{
  return sub_246A96E44(*v0);
}

uint64_t sub_246A97A98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A991BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A97AC0(uint64_t a1)
{
  unint64_t v2 = sub_246A99F30();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A97AFC(uint64_t a1)
{
  unint64_t v2 = sub_246A99F30();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A97B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A99290(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A97B68(uint64_t a1)
{
  unint64_t v2 = sub_246A99DE0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A97BA4(uint64_t a1)
{
  unint64_t v2 = sub_246A99DE0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A97BE0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_246A99348(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_246A97C10(void *a1)
{
  return sub_246A96E70(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_246A97C30()
{
  return sub_246A97528(*v0);
}

uint64_t sub_246A97C38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246A9AC28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A97C60(uint64_t a1)
{
  unint64_t v2 = sub_246A9B16C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A97C9C(uint64_t a1)
{
  unint64_t v2 = sub_246A9B16C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A97CD8(uint64_t a1)
{
  unint64_t v2 = sub_246A9B214();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A97D14(uint64_t a1)
{
  unint64_t v2 = sub_246A9B214();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A97D50(uint64_t a1)
{
  unint64_t v2 = sub_246A9B1C0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A97D8C(uint64_t a1)
{
  unint64_t v2 = sub_246A9B1C0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A97DC8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246A9AD1C(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_246A97DF8(void *a1)
{
  return sub_246A97564(a1, *v1);
}

uint64_t sub_246A97E14(uint64_t a1, uint64_t a2)
{
  char v5 = *((unsigned char *)v2 + 16);
  long long v8 = *v2;
  char v9 = v5;
  sub_246AD9100();
  sub_246A97E80((uint64_t)v7, a1, a2);
  return sub_246AD9140();
}

uint64_t sub_246A97E80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_246A97E80(a1, a2, a3);
}

uint64_t sub_246A97EBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *((unsigned char *)v3 + 16);
  long long v9 = *v3;
  char v10 = v6;
  sub_246AD9100();
  sub_246A97E80((uint64_t)v8, a2, a3);
  return sub_246AD9140();
}

uint64_t sub_246A97F24(uint64_t a1, uint64_t a2)
{
  return sub_246A97F98(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

unint64_t sub_246A97F44()
{
  unint64_t result = qword_2691C0A70;
  if (!qword_2691C0A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0A70);
  }
  return result;
}

uint64_t sub_246A97F98(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v6 = 0;
  switch(a3 >> 5)
  {
    case 1:
      return (a6 & 0xE0) == 0x20 && a1 == a4 && a2 == a5;
    case 2:
      int v9 = a6 & 0xE0;
      BOOL v10 = ((a6 ^ a3) & 1) == 0;
      if (a2 != a5) {
        BOOL v10 = 0;
      }
      if (a1 != a4) {
        BOOL v10 = 0;
      }
      return v9 == 64 && v10;
    case 3:
      if ((a6 & 0xE0) != 0x60) {
        return 0;
      }
      int v11 = a1 >> 6;
      if (!v11) {
        return a4 < 0x40u && a4 == a1;
      }
      if (v11 == 1)
      {
        int v9 = a4 & 0xC0;
        BOOL v10 = ((a4 ^ a1) & 0x3F) == 0;
        return v9 == 64 && v10;
      }
      if (a1 == 128)
      {
        if (a4 != 128) {
          return 0;
        }
      }
      else if (a4 != 129)
      {
        return 0;
      }
      return 1;
    case 4:
      return v6;
    default:
      return a6 < 0x20u && a1 == a4;
  }
}

uint64_t sub_246A980AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimeRule();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  BOOL v10 = (char *)&v35 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v35 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v35 - v14;
  char v16 = sub_246AD89A0();
  sub_246A9831C(a1, (uint64_t)v15);
  sub_246A9831C(a2, (uint64_t)v13);
  if ((v16 & 1) == 0)
  {
    sub_246A98380((uint64_t)v13);
    sub_246A98380((uint64_t)v15);
    sub_246A9831C(a1, (uint64_t)v10);
    sub_246A9831C(a2, (uint64_t)v7);
    goto LABEL_5;
  }
  uint64_t v17 = &v15[*(int *)(v4 + 20)];
  uint64_t v18 = *(void *)v17;
  uint64_t v35 = *((void *)v17 + 1);
  uint64_t v36 = v18;
  unsigned __int8 v19 = v17[16];
  sub_246A98380((uint64_t)v15);
  char v20 = &v13[*(int *)(v4 + 20)];
  uint64_t v21 = *(void *)v20;
  uint64_t v22 = *((void *)v20 + 1);
  unsigned __int8 v23 = v20[16];
  sub_246A98380((uint64_t)v13);
  char v24 = sub_246A97F98(v36, v35, v19, v21, v22, v23);
  sub_246A9831C(a1, (uint64_t)v10);
  sub_246A9831C(a2, (uint64_t)v7);
  if ((v24 & 1) == 0)
  {
LABEL_5:
    sub_246A98380((uint64_t)v7);
    sub_246A98380((uint64_t)v10);
    char v33 = 0;
    return v33 & 1;
  }
  uint64_t v25 = &v10[*(int *)(v4 + 24)];
  uint64_t v26 = *(void *)v25;
  uint64_t v27 = *((void *)v25 + 1);
  unsigned __int8 v28 = v25[16];
  sub_246A98380((uint64_t)v10);
  uint64_t v29 = &v7[*(int *)(v4 + 24)];
  uint64_t v30 = *(void *)v29;
  uint64_t v31 = *((void *)v29 + 1);
  unsigned __int8 v32 = v29[16];
  sub_246A98380((uint64_t)v7);
  char v33 = sub_246A97F98(v26, v27, v28, v30, v31, v32);
  return v33 & 1;
}

uint64_t type metadata accessor for TimeRule()
{
  uint64_t result = qword_2691C0A78;
  if (!qword_2691C0A78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246A9831C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimeRule();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A98380(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimeRule();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimeUnit(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7C && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 124);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 16) >> 5) & 0xFFFFFF87 | (8 * ((*(unsigned __int8 *)(a1 + 16) >> 1) & 0xF))) ^ 0x7F;
  if (v3 >= 0x7B) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for TimeUnit(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7B)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 124;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7C) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7C) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = 2 * (((-a2 >> 3) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_246A98484(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 16);
  int v2 = (char)v1;
  unsigned int v3 = v1 >> 5;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_246A984A4(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0x1Fu;
  return result;
}

uint64_t sub_246A984B4(uint64_t result, unsigned int a2)
{
  if (a2 < 4)
  {
    *(unsigned char *)(result + 16) = *(unsigned char *)(result + 16) & 1 | (32 * a2);
  }
  else
  {
    *(void *)uint64_t result = a2 - 4;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeUnit()
{
  return &type metadata for TimeUnit;
}

uint64_t *sub_246A984F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_246AD89C0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    BOOL v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    *(_OWORD *)BOOL v10 = *(_OWORD *)v11;
    unsigned char v10[16] = v11[16];
    uint64_t v12 = (char *)a1 + v9;
    uint64_t v13 = (char *)a2 + v9;
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    v12[16] = v13[16];
  }
  return a1;
}

uint64_t sub_246A985E4(uint64_t a1)
{
  uint64_t v2 = sub_246AD89C0();
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_246A98648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *(unsigned char *)(v11 + 16) = *(unsigned char *)(v12 + 16);
  return a1;
}

uint64_t sub_246A986EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = v10;
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  char v14 = *(unsigned char *)(v13 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(unsigned char *)(v12 + 16) = v14;
  return a1;
}

uint64_t sub_246A98794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *(unsigned char *)(v11 + 16) = *(unsigned char *)(v12 + 16);
  return a1;
}

uint64_t sub_246A98838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *(unsigned char *)(v11 + 16) = *(unsigned char *)(v12 + 16);
  return a1;
}

uint64_t sub_246A988DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246A988F0);
}

uint64_t sub_246A988F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 16);
    unsigned int v11 = (v10 >> 5) & 0xFFFFFF87 | (8 * ((v10 >> 1) & 0xF));
    unsigned int v12 = v11 ^ 0x7F;
    unsigned int v13 = 128 - v11;
    if (v12 >= 0x7B) {
      return 0;
    }
    else {
      return v13;
    }
  }
}

uint64_t sub_246A989C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246A989D8);
}

uint64_t sub_246A989D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_246AD89C0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    *(void *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 2 * (((-(int)a2 >> 3) & 0xF) - 16 * a2);
  }
  return result;
}

uint64_t sub_246A98AA8()
{
  uint64_t result = sub_246AD89C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_246A98B40()
{
  return sub_246A98C78(&qword_2691C0A88, (void (*)(uint64_t))type metadata accessor for TimeRule);
}

uint64_t sub_246A98B88()
{
  return sub_246A98C78(&qword_2691C0488, MEMORY[0x263F07508]);
}

unint64_t sub_246A98BD0()
{
  unint64_t result = qword_2691C0A98;
  if (!qword_2691C0A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0A98);
  }
  return result;
}

unint64_t sub_246A98C24()
{
  unint64_t result = qword_2691C0AA0;
  if (!qword_2691C0AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0AA0);
  }
  return result;
}

uint64_t sub_246A98C78(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_246A98CC0()
{
  unint64_t result = qword_2691C0AB0;
  if (!qword_2691C0AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0AB0);
  }
  return result;
}

uint64_t sub_246A98D14(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1920298856 && a2 == 0xE400000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6574756E696DLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_246A98E2C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7958113 && a2 == 0xE300000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7463617865 && a2 == 0xE500000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65676E6172 && a2 == 0xE500000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6964756C637865 && a2 == 0xE900000000000067 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65766974616C6572 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_246A99014(uint64_t a1, uint64_t a2)
{
  if (a1 == 1953066613 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246A9908C()
{
  return 1953066613;
}

uint64_t sub_246A9909C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7472617473 && a2 == 0xE500000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 6581861 && a2 == 0xE300000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_246A991BC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7472617473 && a2 == 0xE500000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 6581861 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246A99290(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7461746E6569726FLL && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246A99328()
{
  return 0x7461746E6569726FLL;
}

uint64_t sub_246A99348(void *a1)
{
  uint64_t v44 = sub_246A8604C(&qword_2691C0AB8);
  uint64_t v38 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  int v48 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_246A8604C(&qword_2691C0AC0);
  uint64_t v45 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v47 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_246A8604C(&qword_2691C0AC8);
  uint64_t v37 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v46 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C0AD0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  uint64_t v41 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C0AD8);
  uint64_t v39 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_246A8604C(&qword_2691C0AE0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  char v49 = a1;
  sub_246A8A6E4(a1, v16);
  sub_246A99D8C();
  uint64_t v17 = v50;
  sub_246AD9150();
  if (v17) {
    goto LABEL_10;
  }
  uint64_t v35 = v9;
  uint64_t v36 = v11;
  uint64_t v18 = v46;
  unsigned __int8 v19 = v47;
  char v20 = v48;
  uint64_t v50 = v13;
  uint64_t v21 = sub_246AD8FB0();
  uint64_t v22 = v12;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v24 = sub_246AD8E70();
    swift_allocError();
    uint64_t v26 = v25;
    sub_246A8604C(&qword_2691C05D0);
    uint64_t v16 = v22;
    *uint64_t v26 = &type metadata for TimeUnit;
    sub_246AD8F40();
    sub_246AD8E30();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, *MEMORY[0x263F8DCB0], v24);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v15, v22);
LABEL_10:
    sub_246A85F9C((uint64_t)v49);
    return v16;
  }
  switch(*(unsigned char *)(v21 + 32))
  {
    case 1:
      char v52 = 1;
      sub_246A99F84();
      sub_246AD8F30();
      uint64_t v27 = v40;
      uint64_t v16 = sub_246AD8F90();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v15, v12);
      sub_246A85F9C((uint64_t)v49);
      break;
    case 2:
      char v55 = 2;
      sub_246A99F30();
      sub_246AD8F30();
      char v54 = 0;
      uint64_t v30 = v42;
      uint64_t v16 = sub_246AD8F90();
      char v53 = 1;
      sub_246AD8F90();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v30);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v15, v12);
      goto LABEL_10;
    case 3:
      char v59 = 3;
      sub_246A99E88();
      unsigned __int8 v28 = v19;
      sub_246AD8F30();
      int v48 = (char *)v12;
      char v58 = 0;
      uint64_t v31 = v43;
      uint64_t v16 = sub_246AD8F90();
      char v57 = 1;
      sub_246AD8F90();
      char v56 = 2;
      sub_246A99EDC();
      sub_246AD8FA0();
      uint64_t v33 = v50;
      (*(void (**)(char *, uint64_t))(v45 + 8))(v28, v31);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v33 + 8))(v15, v48);
      goto LABEL_10;
    case 4:
      char v61 = 4;
      sub_246A99DE0();
      sub_246AD8F30();
      sub_246A99E34();
      uint64_t v29 = v44;
      sub_246AD8FA0();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v29);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v15, v22);
      uint64_t v16 = v60;
      goto LABEL_10;
    default:
      char v51 = 0;
      sub_246A99FD8();
      unsigned __int8 v23 = v36;
      sub_246AD8F30();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v23, v35);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v15, v12);
      uint64_t v16 = 0;
      goto LABEL_10;
  }
  return v16;
}

unint64_t sub_246A99D8C()
{
  unint64_t result = qword_2691C0AE8;
  if (!qword_2691C0AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0AE8);
  }
  return result;
}

unint64_t sub_246A99DE0()
{
  unint64_t result = qword_2691C0AF0;
  if (!qword_2691C0AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0AF0);
  }
  return result;
}

unint64_t sub_246A99E34()
{
  unint64_t result = qword_2691C0AF8;
  if (!qword_2691C0AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0AF8);
  }
  return result;
}

unint64_t sub_246A99E88()
{
  unint64_t result = qword_2691C0B00;
  if (!qword_2691C0B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B00);
  }
  return result;
}

unint64_t sub_246A99EDC()
{
  unint64_t result = qword_2691C0B08;
  if (!qword_2691C0B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B08);
  }
  return result;
}

unint64_t sub_246A99F30()
{
  unint64_t result = qword_2691C0B10;
  if (!qword_2691C0B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B10);
  }
  return result;
}

unint64_t sub_246A99F84()
{
  unint64_t result = qword_2691C0B18;
  if (!qword_2691C0B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B18);
  }
  return result;
}

unint64_t sub_246A99FD8()
{
  unint64_t result = qword_2691C0B20;
  if (!qword_2691C0B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B20);
  }
  return result;
}

unint64_t sub_246A9A02C()
{
  unint64_t result = qword_2691C0B58;
  if (!qword_2691C0B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B58);
  }
  return result;
}

unint64_t sub_246A9A080()
{
  unint64_t result = qword_2691C0B60;
  if (!qword_2691C0B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B60);
  }
  return result;
}

unint64_t sub_246A9A0D4()
{
  unint64_t result = qword_2691C0B68;
  if (!qword_2691C0B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B68);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TimeUnit.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TimeUnit.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246A9A284);
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

ValueMetadata *type metadata accessor for TimeUnit.CodingKeys()
{
  return &type metadata for TimeUnit.CodingKeys;
}

ValueMetadata *type metadata accessor for TimeUnit.AnyCodingKeys()
{
  return &type metadata for TimeUnit.AnyCodingKeys;
}

ValueMetadata *type metadata accessor for TimeUnit.ExactCodingKeys()
{
  return &type metadata for TimeUnit.ExactCodingKeys;
}

ValueMetadata *type metadata accessor for TimeUnit.RangeCodingKeys()
{
  return &type metadata for TimeUnit.RangeCodingKeys;
}

ValueMetadata *type metadata accessor for TimeUnit.ExcludingCodingKeys()
{
  return &type metadata for TimeUnit.ExcludingCodingKeys;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion8TimeUnitO15ExactCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x246A9A3A4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeUnit.RelativeCodingKeys()
{
  return &type metadata for TimeUnit.RelativeCodingKeys;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion8TimeUnitO19ExcludingCodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246A9A4A8);
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

ValueMetadata *type metadata accessor for TimeRule.CodingKeys()
{
  return &type metadata for TimeRule.CodingKeys;
}

ValueMetadata *type metadata accessor for ExclusionType()
{
  return &type metadata for ExclusionType;
}

unint64_t sub_246A9A4F4()
{
  unint64_t result = qword_2691C0B70;
  if (!qword_2691C0B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B70);
  }
  return result;
}

unint64_t sub_246A9A54C()
{
  unint64_t result = qword_2691C0B78;
  if (!qword_2691C0B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B78);
  }
  return result;
}

unint64_t sub_246A9A5A4()
{
  unint64_t result = qword_2691C0B80;
  if (!qword_2691C0B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B80);
  }
  return result;
}

unint64_t sub_246A9A5FC()
{
  unint64_t result = qword_2691C0B88;
  if (!qword_2691C0B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B88);
  }
  return result;
}

unint64_t sub_246A9A654()
{
  unint64_t result = qword_2691C0B90;
  if (!qword_2691C0B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B90);
  }
  return result;
}

unint64_t sub_246A9A6AC()
{
  unint64_t result = qword_2691C0B98;
  if (!qword_2691C0B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0B98);
  }
  return result;
}

unint64_t sub_246A9A704()
{
  unint64_t result = qword_2691C0BA0;
  if (!qword_2691C0BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BA0);
  }
  return result;
}

unint64_t sub_246A9A75C()
{
  unint64_t result = qword_2691C0BA8;
  if (!qword_2691C0BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BA8);
  }
  return result;
}

unint64_t sub_246A9A7B4()
{
  unint64_t result = qword_2691C0BB0;
  if (!qword_2691C0BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BB0);
  }
  return result;
}

unint64_t sub_246A9A80C()
{
  unint64_t result = qword_2691C0BB8;
  if (!qword_2691C0BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BB8);
  }
  return result;
}

unint64_t sub_246A9A864()
{
  unint64_t result = qword_2691C0BC0;
  if (!qword_2691C0BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BC0);
  }
  return result;
}

unint64_t sub_246A9A8BC()
{
  unint64_t result = qword_2691C0BC8;
  if (!qword_2691C0BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BC8);
  }
  return result;
}

unint64_t sub_246A9A914()
{
  unint64_t result = qword_2691C0BD0;
  if (!qword_2691C0BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BD0);
  }
  return result;
}

unint64_t sub_246A9A96C()
{
  unint64_t result = qword_2691C0BD8;
  if (!qword_2691C0BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BD8);
  }
  return result;
}

unint64_t sub_246A9A9C4()
{
  unint64_t result = qword_2691C0BE0;
  if (!qword_2691C0BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BE0);
  }
  return result;
}

unint64_t sub_246A9AA1C()
{
  unint64_t result = qword_2691C0BE8;
  if (!qword_2691C0BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BE8);
  }
  return result;
}

unint64_t sub_246A9AA74()
{
  unint64_t result = qword_2691C0BF0;
  if (!qword_2691C0BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BF0);
  }
  return result;
}

unint64_t sub_246A9AACC()
{
  unint64_t result = qword_2691C0BF8;
  if (!qword_2691C0BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0BF8);
  }
  return result;
}

unint64_t sub_246A9AB24()
{
  unint64_t result = qword_2691C0C00;
  if (!qword_2691C0C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C00);
  }
  return result;
}

unint64_t sub_246A9AB7C()
{
  unint64_t result = qword_2691C0C08;
  if (!qword_2691C0C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C08);
  }
  return result;
}

unint64_t sub_246A9ABD4()
{
  unint64_t result = qword_2691C0C10;
  if (!qword_2691C0C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C10);
  }
  return result;
}

uint64_t sub_246A9AC28(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6572726566657270 && a2 == 0xE900000000000064;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465726975716572 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246A9AD1C(uint64_t a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C0C18);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C0C20);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C0C28);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4((void *)a1, *(void *)(a1 + 24));
  sub_246A9B16C();
  uint64_t v12 = v26;
  sub_246AD9150();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_246AD8FB0();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_246AD8E70();
    swift_allocError();
    uint64_t v18 = v17;
    sub_246A8604C(&qword_2691C05D0);
    *uint64_t v18 = &type metadata for ExclusionType;
    sub_246AD8F40();
    sub_246AD8E30();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    sub_246A85F9C(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_246A9B1C0();
    sub_246AD8F30();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_246A9B214();
    sub_246AD8F30();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  sub_246A85F9C(v26);
  return a1;
}

unint64_t sub_246A9B16C()
{
  unint64_t result = qword_2691C0C30;
  if (!qword_2691C0C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C30);
  }
  return result;
}

unint64_t sub_246A9B1C0()
{
  unint64_t result = qword_2691C0C38;
  if (!qword_2691C0C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C38);
  }
  return result;
}

unint64_t sub_246A9B214()
{
  unint64_t result = qword_2691C0C40;
  if (!qword_2691C0C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C40);
  }
  return result;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion13ExclusionTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246A9B334);
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

ValueMetadata *type metadata accessor for ExclusionType.CodingKeys()
{
  return &type metadata for ExclusionType.CodingKeys;
}

ValueMetadata *type metadata accessor for ExclusionType.PreferredCodingKeys()
{
  return &type metadata for ExclusionType.PreferredCodingKeys;
}

ValueMetadata *type metadata accessor for ExclusionType.RequiredCodingKeys()
{
  return &type metadata for ExclusionType.RequiredCodingKeys;
}

unint64_t sub_246A9B390()
{
  unint64_t result = qword_2691C0C60;
  if (!qword_2691C0C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C60);
  }
  return result;
}

unint64_t sub_246A9B3E8()
{
  unint64_t result = qword_2691C0C68;
  if (!qword_2691C0C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C68);
  }
  return result;
}

unint64_t sub_246A9B440()
{
  unint64_t result = qword_2691C0C70;
  if (!qword_2691C0C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C70);
  }
  return result;
}

unint64_t sub_246A9B498()
{
  unint64_t result = qword_2691C0C78;
  if (!qword_2691C0C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C78);
  }
  return result;
}

unint64_t sub_246A9B4F0()
{
  unint64_t result = qword_2691C0C80;
  if (!qword_2691C0C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C80);
  }
  return result;
}

unint64_t sub_246A9B548()
{
  unint64_t result = qword_2691C0C88;
  if (!qword_2691C0C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C88);
  }
  return result;
}

unint64_t sub_246A9B5A0()
{
  unint64_t result = qword_2691C0C90;
  if (!qword_2691C0C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C90);
  }
  return result;
}

uint64_t destroy for Atlas()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Atlas(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Atlas(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for Atlas(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Atlas(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for Atlas(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Atlas(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Atlas()
{
  return &type metadata for Atlas;
}

unint64_t sub_246A9B840()
{
  unint64_t result = qword_2691C0C98;
  if (!qword_2691C0C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0C98);
  }
  return result;
}

uint64_t sub_246A9B894(char a1, char a2)
{
  if (*(void *)&aNewyear_2[8 * a1] == *(void *)&aNewyear_2[8 * a2]
    && *(void *)&aLunarnewvalent_0[8 * a1 + 56] == *(void *)&aLunarnewvalent_0[8 * a2 + 56])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_246AD9060();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_246A9B91C(char a1, char a2)
{
  if (*(void *)&aMorning_2[8 * a1] == *(void *)&aMorning_2[8 * a2] && qword_246ADFC00[a1] == qword_246ADFC00[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_246AD9060();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_246A9B9A4(char a1, char a2)
{
  if (*(void *)&aNone_3[8 * a1] == *(void *)&aNone_3[8 * a2] && qword_246ADFAF0[a1] == qword_246ADFAF0[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_246AD9060();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_246A9BA2C(char a1, char a2)
{
  if (*(void *)&aStart_3[8 * a1] == *(void *)&aStart_3[8 * a2]
    && *(void *)&aEndbehav[8 * a1 + 8] == *(void *)&aEndbehav[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_246AD9060();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_246A9BAB4(char a1, char a2)
{
  if (*(void *)&a02d_0[8 * a1] == *(void *)&a02d_0[8 * a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_246AD9060();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_246A9BB1C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000018;
  unint64_t v3 = 0x8000000246ADA840;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000018;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x7A69537465737361;
      unint64_t v3 = 0xE900000000000065;
      break;
    case 2:
      unint64_t v5 = 0x7465737341657375;
      unint64_t v3 = 0xEF656C646E754273;
      break;
    case 3:
      break;
    default:
      unint64_t v5 = 0x7361427465737361;
      unint64_t v3 = 0xED0000656D614E65;
      break;
  }
  unint64_t v6 = 0x8000000246ADA840;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x7A69537465737361;
      unint64_t v6 = 0xE900000000000065;
      goto LABEL_9;
    case 2:
      unint64_t v6 = 0xEF656C646E754273;
      if (v5 == 0x7465737341657375) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 3:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    default:
      unint64_t v6 = 0xED0000656D614E65;
      if (v5 != 0x7361427465737361) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_246AD9060();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_246A9BCE0(char a1, char a2)
{
  if (*(void *)&aTheater_2[8 * a1] == *(void *)&aTheater_2[8 * a2]
    && *(void *)&aLowpowerwaterl_0[8 * a1 + 16] == *(void *)&aLowpowerwaterl_0[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_246AD9060();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_246A9BD68(char a1)
{
  return *(void *)&a02d_0[8 * a1];
}

uint64_t sub_246A9BD80(char *a1, char *a2)
{
  return sub_246A9BAB4(*a1, *a2);
}

uint64_t sub_246A9BD8C()
{
  return sub_246A9D000();
}

uint64_t sub_246A9BD94()
{
  return sub_246A9D444();
}

uint64_t sub_246A9BD9C()
{
  return sub_246A9D804();
}

uint64_t sub_246A9BDA4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246A9C6D8();
  *a1 = result;
  return result;
}

uint64_t sub_246A9BDD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_246A9BD68(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_246A9BE00(uint64_t a1)
{
  long long v8 = *v1;
  uint64_t v7 = v8;
  sub_246A9CABC((uint64_t)&v8);
  sub_246AD8BF0();
  sub_246A8604C(&qword_2691C0460);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v3 + 16) = xmmword_246ADC8A0;
  uint64_t v5 = MEMORY[0x263F8D750];
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = v5;
  *(void *)(v3 + 32) = a1;
  sub_246AD8BC0();
  swift_bridgeObjectRelease();
  sub_246AD8BF0();
  swift_bridgeObjectRelease();
  return v7;
}

unint64_t sub_246A9BEDC(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7A69537465737361;
      break;
    case 2:
      unint64_t result = 0x7465737341657375;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0x7361427465737361;
      break;
  }
  return result;
}

unint64_t sub_246A9BF90(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7A69537465737361;
      break;
    case 2:
      unint64_t result = 0x7465737341657375;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0x7361427465737361;
      break;
  }
  return result;
}

uint64_t sub_246A9C044()
{
  swift_bridgeObjectRetain();
  sub_246AD8BE0();
  swift_bridgeObjectRelease();
  sub_246AD9130();
  sub_246AD9130();
  if (*(unsigned char *)(v0 + 32) != 2) {
    sub_246AD9120();
  }
  sub_246AD9120();
  if (*(void *)(v0 + 48))
  {
    sub_246AD9120();
    swift_bridgeObjectRetain();
    sub_246AD8BE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_246AD9120();
  }
  sub_246AD8BE0();
  swift_bridgeObjectRelease();
  return sub_246AD9110();
}

uint64_t sub_246A9C144(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_246A8604C(&qword_2691C0CB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_246A8A6E4(a1, a1[3]);
  sub_246A9CA24();
  sub_246AD9160();
  LOBYTE(v11) = 0;
  sub_246AD8FF0();
  if (!v2)
  {
    long long v11 = *(_OWORD *)(v3 + 16);
    v10[15] = 1;
    type metadata accessor for CGSize(0);
    sub_246A9CA78(&qword_2691C0CC0);
    sub_246AD9020();
    LOBYTE(v11) = 2;
    sub_246AD8FE0();
    LOBYTE(v11) = 3;
    sub_246AD8FD0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_246A9C330(unsigned __int8 *a1, char *a2)
{
  return sub_246A9BB1C(*a1, *a2);
}

uint64_t sub_246A9C33C()
{
  return sub_246A9D060();
}

uint64_t sub_246A9C344()
{
  return sub_246A9D484();
}

uint64_t sub_246A9C34C()
{
  return sub_246A9D70C();
}

uint64_t sub_246A9C354@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246A9C724();
  *a1 = result;
  return result;
}

unint64_t sub_246A9C384@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_246A9BEDC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_246A9C3B0()
{
  return sub_246A9BF90(*v0);
}

uint64_t sub_246A9C3B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246A9C724();
  *a1 = result;
  return result;
}

uint64_t sub_246A9C3E0(uint64_t a1)
{
  unint64_t v2 = sub_246A9CA24();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9C41C(uint64_t a1)
{
  unint64_t v2 = sub_246A9CA24();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_246A9C458@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_246A9C770(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 41) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_246A9C4A4(void *a1)
{
  return sub_246A9C144(a1);
}

uint64_t sub_246A9C4BC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  v6[0] = a1[2];
  *(_OWORD *)((char *)v6 + 9) = *(_OWORD *)((char *)a1 + 41);
  long long v3 = a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  v8[0] = a2[2];
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a2 + 41);
  return sub_246A9C598((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t sub_246A9C518()
{
  return sub_246AD9140();
}

uint64_t sub_246A9C55C()
{
  return sub_246AD9140();
}

uint64_t sub_246A9C598(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v5 = 0;
    if ((sub_246AD9060() & 1) == 0) {
      return v5 & 1;
    }
  }
  if (*(double *)(a1 + 16) != *(double *)(a2 + 16) || *(double *)(a1 + 24) != *(double *)(a2 + 24)) {
    goto LABEL_20;
  }
  int v6 = *(unsigned __int8 *)(a1 + 32);
  int v7 = *(unsigned __int8 *)(a2 + 32);
  if (v6 == 2)
  {
    if (v7 != 2) {
      goto LABEL_20;
    }
  }
  else
  {
    char v5 = 0;
    BOOL v8 = (v6 & 1) == 0;
    if (v7 == 2 || ((v8 ^ v7) & 1) == 0) {
      return v5 & 1;
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a2 + 48);
  if (!v9)
  {
    if (!v10)
    {
LABEL_22:
      if (*(void *)&a02d_0[8 * *(char *)(a1 + 56)] == *(void *)&a02d_0[8 * *(char *)(a2 + 56)]) {
        char v5 = 1;
      }
      else {
        char v5 = sub_246AD9060();
      }
      swift_bridgeObjectRelease_n();
      return v5 & 1;
    }
LABEL_20:
    char v5 = 0;
    return v5 & 1;
  }
  if (!v10) {
    goto LABEL_20;
  }
  if (*(void *)(a1 + 40) == *(void *)(a2 + 40) && v9 == v10) {
    goto LABEL_22;
  }
  char v5 = 0;
  if (sub_246AD9060()) {
    goto LABEL_22;
  }
  return v5 & 1;
}

uint64_t sub_246A9C6D8()
{
  unint64_t v0 = sub_246AD8F20();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_246A9C724()
{
  unint64_t v0 = sub_246AD8F20();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_246A9C770@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_246A8604C(&qword_2691C0CA0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246A9CA24();
  sub_246AD9150();
  if (v2) {
    return sub_246A85F9C((uint64_t)a1);
  }
  LOBYTE(v21) = 0;
  uint64_t v9 = sub_246AD8F70();
  uint64_t v11 = v10;
  type metadata accessor for CGSize(0);
  char v24 = 1;
  sub_246A9CA78(&qword_2691C0CB0);
  swift_bridgeObjectRetain();
  sub_246AD8FA0();
  uint64_t v12 = v21;
  uint64_t v13 = v22;
  LOBYTE(v21) = 2;
  int v23 = sub_246AD8F60();
  LOBYTE(v21) = 3;
  uint64_t v14 = sub_246AD8F50();
  uint64_t v16 = v15;
  uint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v20 = v14;
  v17(v8, v5);
  swift_bridgeObjectRetain();
  sub_246A85F9C((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v13;
  *(unsigned char *)(a2 + 32) = v23;
  *(void *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v16;
  *(unsigned char *)(a2 + 56) = 0;
  return result;
}

unint64_t sub_246A9CA24()
{
  unint64_t result = qword_2691C0CA8;
  if (!qword_2691C0CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0CA8);
  }
  return result;
}

uint64_t sub_246A9CA78(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246A9CABC(uint64_t a1)
{
  return a1;
}

unsigned char *storeEnumTagSinglePayload for Atlas.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x246A9CBB4);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Atlas.CodingKeys()
{
  return &type metadata for Atlas.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Atlas.IndexMappingBehavior(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x246A9CC88);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Atlas.IndexMappingBehavior()
{
  return &type metadata for Atlas.IndexMappingBehavior;
}

unsigned char *storeEnumTagSinglePayload for Atlas.IndexPattern(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246A9CD8CLL);
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

ValueMetadata *type metadata accessor for Atlas.IndexPattern()
{
  return &type metadata for Atlas.IndexPattern;
}

unint64_t sub_246A9CDC8()
{
  unint64_t result = qword_2691C0CC8;
  if (!qword_2691C0CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0CC8);
  }
  return result;
}

unint64_t sub_246A9CE20()
{
  unint64_t result = qword_2691C0CD0;
  if (!qword_2691C0CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0CD0);
  }
  return result;
}

unint64_t sub_246A9CE78()
{
  unint64_t result = qword_2691C0CD8;
  if (!qword_2691C0CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0CD8);
  }
  return result;
}

unint64_t sub_246A9CED0()
{
  unint64_t result = qword_2691C0CE0;
  if (!qword_2691C0CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0CE0);
  }
  return result;
}

unint64_t sub_246A9CF28()
{
  unint64_t result = qword_2691C0CE8;
  if (!qword_2691C0CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0CE8);
  }
  return result;
}

void sub_246A9CF7C()
{
  qword_2691D40A8 = 6778480;
  unk_2691D40B0 = 0xE300000000000000;
}

void sub_246A9CF98()
{
  qword_2691D40B8 = 0x7473696C70;
  unk_2691D40C0 = 0xE500000000000000;
}

double radian(at:)(uint64_t a1)
{
  uint64_t v1 = a1 & ~(a1 >> 63);
  if (v1 >= 60) {
    uint64_t v1 = 60;
  }
  return (double)v1 * 60.0 / 3600.0 * 6.28318531;
}

uint64_t sub_246A9CFF8(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_246A9D000()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D060()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D15C()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D1C8()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D234()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D2A0()
{
  sub_246AD8BE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_246A9D2F4()
{
  sub_246AD8BE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_246A9D348()
{
  sub_246AD8BE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_246A9D39C()
{
  sub_246AD8BE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_246A9D3F0()
{
  sub_246AD8BE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_246A9D444()
{
  sub_246AD8BE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_246A9D484()
{
  sub_246AD8BE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_246A9D56C()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D5D4()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D63C()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D6A4()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D70C()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D804()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D860()
{
  return sub_246AD9140();
}

uint64_t sub_246A9D8C8(char a1)
{
  return *(void *)&aCalendardevice[8 * a1];
}

uint64_t sub_246A9D8EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AA0210(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A9D918(uint64_t a1)
{
  unint64_t v2 = sub_246AA120C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9D954(uint64_t a1)
{
  unint64_t v2 = sub_246AA120C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9D990()
{
  return sub_246A9D8C8(*v0);
}

uint64_t sub_246A9D998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AA02A4(a1, a2);
  *a3 = result;
  return result;
}

void sub_246A9D9C0(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_246A9D9CC(uint64_t a1)
{
  unint64_t v2 = sub_246AA0C78();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DA08(uint64_t a1)
{
  unint64_t v2 = sub_246AA0C78();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DA48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AA0720(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A9DA74(uint64_t a1)
{
  unint64_t v2 = sub_246AA1164();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DAB0(uint64_t a1)
{
  unint64_t v2 = sub_246AA1164();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DAF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AA07B4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A9DB1C(uint64_t a1)
{
  unint64_t v2 = sub_246AA1014();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DB58(uint64_t a1)
{
  unint64_t v2 = sub_246AA1014();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DB94(uint64_t a1)
{
  unint64_t v2 = sub_246AA0FC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DBD0(uint64_t a1)
{
  unint64_t v2 = sub_246AA0FC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DC10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AA083C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A9DC3C(uint64_t a1)
{
  unint64_t v2 = sub_246AA10BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DC78(uint64_t a1)
{
  unint64_t v2 = sub_246AA10BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DCB4(uint64_t a1)
{
  unint64_t v2 = sub_246AA0F6C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DCF0(uint64_t a1)
{
  unint64_t v2 = sub_246AA0F6C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DD2C(uint64_t a1)
{
  unint64_t v2 = sub_246AA0D20();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DD68(uint64_t a1)
{
  unint64_t v2 = sub_246AA0D20();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DDA4(uint64_t a1)
{
  unint64_t v2 = sub_246AA0F18();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DDE0(uint64_t a1)
{
  unint64_t v2 = sub_246AA0F18();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DE1C(uint64_t a1)
{
  unint64_t v2 = sub_246AA0CCC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DE58(uint64_t a1)
{
  unint64_t v2 = sub_246AA0CCC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DE98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AA08DC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A9DEC4(uint64_t a1)
{
  unint64_t v2 = sub_246AA0E70();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DF00(uint64_t a1)
{
  unint64_t v2 = sub_246AA0E70();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DF3C(uint64_t a1)
{
  unint64_t v2 = sub_246AA0E1C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9DF78(uint64_t a1)
{
  unint64_t v2 = sub_246AA0E1C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246A9DFB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AA0964(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A9DFE4(uint64_t a1)
{
  unint64_t v2 = sub_246AA0D74();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246A9E020(uint64_t a1)
{
  unint64_t v2 = sub_246AA0D74();

  return MEMORY[0x270FA00B8](a1, v2);
}

NTKEsterbrookFaceBundleCompanion::EsterbrookWeatherCondition_optional __swiftcall EsterbrookWeatherCondition.init(rawValue:)(Swift::String rawValue)
{
  return (NTKEsterbrookFaceBundleCompanion::EsterbrookWeatherCondition_optional)sub_246AA0A5C();
}

void *static EsterbrookWeatherCondition.allCases.getter()
{
  return &unk_26FB01E90;
}

uint64_t EsterbrookWeatherCondition.rawValue.getter(char a1)
{
  return *(void *)&aNone_4[8 * a1];
}

uint64_t sub_246A9E0A8(char *a1, char *a2)
{
  return sub_246A9B9A4(*a1, *a2);
}

uint64_t sub_246A9E0B4()
{
  return sub_246A9D6A4();
}

uint64_t sub_246A9E0C0()
{
  return sub_246A9D2A0();
}

uint64_t sub_246A9E0C8()
{
  return sub_246A9D6A4();
}

uint64_t sub_246A9E0D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246AA0A5C();
  *a1 = result;
  return result;
}

uint64_t sub_246A9E108@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EsterbrookWeatherCondition.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_246A9E134()
{
  return sub_246AD8C30();
}

uint64_t sub_246A9E194()
{
  return sub_246AD8C20();
}

void sub_246A9E1E4(void *a1@<X8>)
{
  *a1 = &unk_26FB01E90;
}

uint64_t RoutineType.rawValue.getter(char a1)
{
  return *(void *)&aMorning_3[8 * a1];
}

uint64_t sub_246A9E218(char *a1, char *a2)
{
  return sub_246A9B91C(*a1, *a2);
}

uint64_t sub_246A9E224()
{
  return sub_246A9D15C();
}

uint64_t sub_246A9E22C()
{
  return sub_246A9D2F4();
}

uint64_t sub_246A9E234()
{
  return sub_246A9D5D4();
}

uint64_t sub_246A9E23C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s32NTKEsterbrookFaceBundleCompanion11RoutineTypeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_246A9E26C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = RoutineType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_246A9E298()
{
  return sub_246AD8C30();
}

uint64_t sub_246A9E2F8()
{
  return sub_246AD8C20();
}

NTKEsterbrookFaceBundleCompanion::CalendarEvent_optional __swiftcall CalendarEvent.init(rawValue:)(Swift::String rawValue)
{
  return (NTKEsterbrookFaceBundleCompanion::CalendarEvent_optional)sub_246AA0A5C();
}

uint64_t CalendarEvent.rawValue.getter(char a1)
{
  return *(void *)&aNewyear_3[8 * a1];
}

uint64_t sub_246A9E388(char *a1, char *a2)
{
  return sub_246A9B894(*a1, *a2);
}

uint64_t sub_246A9E394()
{
  return sub_246A9D63C();
}

uint64_t sub_246A9E3A0()
{
  return sub_246A9D39C();
}

uint64_t sub_246A9E3A8()
{
  return sub_246A9D63C();
}

uint64_t sub_246A9E3B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246AA0A5C();
  *a1 = result;
  return result;
}

uint64_t sub_246A9E3E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CalendarEvent.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_246A9E414()
{
  return sub_246AD8C30();
}

uint64_t sub_246A9E474()
{
  return sub_246AD8C20();
}

BOOL HealthCategory.init(rawValue:)()
{
  return sub_246A9E624();
}

uint64_t sub_246A9E4D8()
{
  return sub_246AA01C0();
}

uint64_t sub_246A9E508()
{
  return sub_246AA0144();
}

uint64_t sub_246A9E534@<X0>(BOOL *a1@<X8>)
{
  return sub_246A9E6C4(a1);
}

uint64_t sub_246A9E540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s32NTKEsterbrookFaceBundleCompanion14HealthCategoryO8rawValueSSvg_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_246A9E568()
{
  return sub_246AD8C30();
}

uint64_t sub_246A9E5C8()
{
  return sub_246AD8C20();
}

BOOL FocusMode.init(rawValue:)()
{
  return sub_246A9E624();
}

BOOL sub_246A9E624()
{
  uint64_t v0 = sub_246AD8F20();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_246A9E66C()
{
  return sub_246AA01C0();
}

uint64_t sub_246A9E694()
{
  return sub_246AA0144();
}

uint64_t sub_246A9E6B8@<X0>(BOOL *a1@<X8>)
{
  return sub_246A9E6C4(a1);
}

uint64_t sub_246A9E6C4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_246AD8F20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_246A9E714@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s32NTKEsterbrookFaceBundleCompanion9FocusModeO8rawValueSSvg_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_246A9E73C()
{
  return sub_246AD8C30();
}

uint64_t sub_246A9E79C()
{
  return sub_246AD8C20();
}

void *static DeviceState.allCases.getter()
{
  return &unk_26FB02160;
}

uint64_t DeviceState.rawValue.getter(char a1)
{
  return *(void *)&aTheater_3[8 * a1];
}

uint64_t sub_246A9E81C(char *a1, char *a2)
{
  return sub_246A9BCE0(*a1, *a2);
}

uint64_t sub_246A9E828()
{
  return sub_246A9D1C8();
}

uint64_t sub_246A9E830()
{
  return sub_246A9D348();
}

uint64_t sub_246A9E838()
{
  return sub_246A9D56C();
}

uint64_t sub_246A9E840@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s32NTKEsterbrookFaceBundleCompanion11DeviceStateO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_246A9E870@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DeviceState.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_246A9E89C()
{
  return sub_246AD8C30();
}

uint64_t sub_246A9E8FC()
{
  return sub_246AD8C20();
}

void sub_246A9E94C(void *a1@<X8>)
{
  *a1 = &unk_26FB02188;
}

void SceneInfo.hash(into:)(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v5 = a3;
  unint64_t v6 = a2 - 2;
  while (1)
  {
    switch(v5)
    {
      case 0:
      case 1:
      case 2:
        sub_246AD8BE0();
        swift_bridgeObjectRelease();
        break;
      case 3:
        sub_246A9FDC4(a1, a2);
        break;
      case 4:
        if (v6 >= 6) {
          sub_246AD8BE0();
        }
        break;
      default:
        JUMPOUT(0);
    }
  }
}

uint64_t SceneInfo.description.getter(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
      unint64_t v14 = 0xC23A656369766544;
      goto LABEL_5;
    case 2:
      unint64_t v14 = 0x3A656E6974756F52;
      goto LABEL_5;
    case 3:
      unint64_t v14 = 0x3A72656874616557;
      int64_t v3 = *(void *)(a1 + 16);
      uint64_t v4 = MEMORY[0x263F8EE78];
      if (v3)
      {
        uint64_t v13 = MEMORY[0x263F8EE78];
        sub_246A9FCF0(v3);
        uint64_t v5 = a1 + 32;
        sub_246AA0B18();
        do
        {
          ++v5;
          uint64_t v6 = sub_246AD8DB0();
          uint64_t v8 = v7;
          swift_bridgeObjectRelease();
          sub_246A9FD68();
          uint64_t v4 = v13;
          unint64_t v10 = *(void *)(v13 + 16);
          unint64_t v9 = *(void *)(v13 + 24);
          if (v10 >= v9 >> 1)
          {
            sub_246AC6678(v9 > 1, v10 + 1, 1);
            uint64_t v4 = v13;
          }
          *(void *)(v4 + 16) = v10 + 1;
          uint64_t v11 = v4 + 16 * v10;
          *(void *)(v11 + 32) = v6;
          *(void *)(v11 + 40) = v8;
          --v3;
        }
        while (v3);
      }
      MEMORY[0x24C540270](v4, MEMORY[0x263F8D310]);
      sub_246AD8BF0();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    case 4:
      uint64_t result = 0x636973754DLL;
      switch(a1)
      {
        case 1:
          unint64_t v14 = 0xA0C23A7375636F46;
          goto LABEL_18;
        case 2:
          return 0x636972656E6547;
        case 3:
          return 0x657A696C61656449;
        case 4:
          return result;
        case 5:
          return 0x6D756974697254;
        case 6:
          return 0x6465726F6E6749;
        case 7:
          return 0x6C6F686563616C50;
        default:
          unint64_t v14 = 0xC23A68746C616548;
LABEL_18:
          sub_246AA0B18();
          sub_246AD8DB0();
          sub_246AD8BF0();
          goto LABEL_15;
      }
    default:
      unint64_t v14 = 0x7261646E656C6143;
LABEL_5:
      sub_246AA0B18();
      sub_246AD8DB0();
      swift_bridgeObjectRelease();
      sub_246AD8BF0();
LABEL_15:
      swift_bridgeObjectRelease();
      return v14;
  }
}

uint64_t SceneInfo.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v82 = a2;
  uint64_t v83 = a3;
  uint64_t v4 = sub_246A8604C(&qword_2691C0CF8);
  uint64_t v69 = *(void *)(v4 - 8);
  uint64_t v70 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v68 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C0D00);
  uint64_t v66 = *(void *)(v6 - 8);
  uint64_t v67 = v6;
  MEMORY[0x270FA5388](v6);
  v65 = (char *)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_246A8604C(&qword_2691C0D08);
  uint64_t v71 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  v78 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_246A8604C(&qword_2691C0D10);
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v62 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C0D18);
  uint64_t v76 = *(void *)(v10 - 8);
  uint64_t v77 = v10;
  MEMORY[0x270FA5388](v10);
  v75 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_246A8604C(&qword_2691C0D20);
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  char v59 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_246A8604C(&qword_2691C0D28);
  uint64_t v57 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  char v56 = (char *)v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_246A8604C(&qword_2691C0D30);
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  char v51 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_246A8604C(&qword_2691C0D38);
  uint64_t v53 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  v74 = (char *)v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_246A8604C(&qword_2691C0D40);
  v49[1] = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  v49[0] = (char *)v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_246A8604C(&qword_2691C0D48);
  uint64_t v73 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_246A8604C(&qword_2691C0D50);
  uint64_t v72 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_246A8604C(&qword_2691C0D58);
  uint64_t v80 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246AA0C78();
  v81 = v25;
  sub_246AD9160();
  switch((char)v83)
  {
    case 1:
      LOBYTE(v86) = 1;
      sub_246AA1164();
      uint64_t v26 = v81;
      sub_246AD8FC0();
      LOBYTE(v86) = v82;
      sub_246AA11B8();
      sub_246AD9020();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v19, v17);
      return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v26, v23);
    case 2:
      LOBYTE(v86) = 7;
      sub_246AA0E70();
      char v27 = v75;
      uint64_t v28 = v23;
      uint64_t v29 = v81;
      sub_246AD8FC0();
      LOBYTE(v86) = v82;
      sub_246AA0EC4();
      uint64_t v30 = v77;
      sub_246AD9020();
      uint64_t v31 = v76;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v30);
      return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v29, v28);
    case 3:
      LOBYTE(v86) = 9;
      sub_246AA0D74();
      uint64_t v34 = v78;
      uint64_t v35 = v23;
      uint64_t v36 = v81;
      sub_246AD8FC0();
      uint64_t v86 = v82;
      sub_246A8604C(&qword_2691C0D80);
      sub_246AA3CC0(&qword_2691C0D88, (void (*)(void))sub_246AA0DC8);
      uint64_t v37 = v79;
      sub_246AD9020();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v34, v37);
      return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v36, v35);
    case 4:
      uint64_t v28 = v23;
      char v27 = v74;
      switch(v82)
      {
        case 1:
          LOBYTE(v86) = 3;
          sub_246AA1014();
          uint64_t v29 = v81;
          sub_246AD8FC0();
          sub_246AA1068();
          uint64_t v30 = v55;
          sub_246AD9020();
          unsigned __int8 v32 = (char **)&v84;
          goto LABEL_10;
        case 2:
          LOBYTE(v86) = 4;
          sub_246AA0FC0();
          uint64_t v38 = v51;
          uint64_t v39 = v81;
          sub_246AD8FC0();
          uint64_t v40 = *(void (**)(char *, uint64_t))(v52 + 8);
          uint64_t v41 = v38;
          uint64_t v42 = &v85;
          goto LABEL_16;
        case 3:
          LOBYTE(v86) = 5;
          sub_246AA0F6C();
          uint64_t v43 = v56;
          uint64_t v39 = v81;
          sub_246AD8FC0();
          uint64_t v40 = *(void (**)(char *, uint64_t))(v57 + 8);
          uint64_t v41 = v43;
          uint64_t v42 = &v87;
          goto LABEL_16;
        case 4:
          LOBYTE(v86) = 6;
          sub_246AA0F18();
          uint64_t v44 = v59;
          uint64_t v39 = v81;
          sub_246AD8FC0();
          uint64_t v40 = *(void (**)(char *, uint64_t))(v60 + 8);
          uint64_t v41 = v44;
          uint64_t v42 = &v88;
LABEL_16:
          uint64_t v45 = *(v42 - 32);
          goto LABEL_21;
        case 5:
          LOBYTE(v86) = 8;
          sub_246AA0E1C();
          uint64_t v46 = v62;
          uint64_t v39 = v81;
          sub_246AD8FC0();
          (*(void (**)(char *, uint64_t))(v63 + 8))(v46, v64);
          return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v39, v23);
        case 6:
          LOBYTE(v86) = 10;
          sub_246AA0D20();
          uint64_t v47 = v65;
          uint64_t v39 = v81;
          sub_246AD8FC0();
          uint64_t v48 = v66;
          uint64_t v45 = v67;
          goto LABEL_20;
        case 7:
          LOBYTE(v86) = 11;
          sub_246AA0CCC();
          uint64_t v47 = v68;
          uint64_t v39 = v81;
          sub_246AD8FC0();
          uint64_t v48 = v69;
          uint64_t v45 = v70;
LABEL_20:
          uint64_t v40 = *(void (**)(char *, uint64_t))(v48 + 8);
          uint64_t v41 = v47;
LABEL_21:
          v40(v41, v45);
          return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v39, v23);
        default:
          LOBYTE(v86) = 2;
          sub_246AA10BC();
          char v27 = (char *)v49[0];
          uint64_t v29 = v81;
          sub_246AD8FC0();
          sub_246AA1110();
          uint64_t v30 = v50;
          sub_246AD9020();
          unsigned __int8 v32 = &v81;
LABEL_10:
          uint64_t v31 = (uint64_t)*(v32 - 32);
          goto LABEL_11;
      }
    default:
      LOBYTE(v86) = 0;
      sub_246AA120C();
      uint64_t v26 = v81;
      sub_246AD8FC0();
      LOBYTE(v86) = v82;
      sub_246AA1260();
      sub_246AD9020();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v22, v20);
      return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v26, v23);
  }
}

uint64_t SceneInfo.hashValue.getter(uint64_t a1, unsigned __int8 a2)
{
  sub_246AD9100();
  SceneInfo.hash(into:)((uint64_t)v5, a1, a2);
  return SceneInfo.init(from:)();
}

uint64_t SceneInfo.init(from:)(void *a1)
{
  return sub_246AA12B4(a1);
}

uint64_t sub_246A9FBD0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_246AA12B4(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_246A9FC00(void *a1)
{
  return SceneInfo.encode(to:)(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8));
}

uint64_t sub_246A9FC20()
{
  return SceneInfo.description.getter(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_246A9FC2C(uint64_t a1, uint64_t a2)
{
  return _s32NTKEsterbrookFaceBundleCompanion9SceneInfoO21__derived_enum_equalsySbAC_ACtFZ_0(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_246A9FC44()
{
  uint64_t v1 = *(void *)v0;
  unsigned __int8 v2 = *(unsigned char *)(v0 + 8);
  sub_246AD9100();
  SceneInfo.hash(into:)((uint64_t)v4, v1, v2);
  return sub_246A9FC7C();
}

uint64_t sub_246A9FC7C(uint64_t a1)
{
  SceneInfo.hash(into:)(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
  return sub_246A9FC94();
}

uint64_t sub_246A9FC94()
{
  uint64_t v1 = *(void *)v0;
  unsigned __int8 v2 = *(unsigned char *)(v0 + 8);
  sub_246AD9100();
  SceneInfo.hash(into:)((uint64_t)v4, v1, v2);
  return sub_246A9FCC8();
}

void sub_246A9FCC8(void *a1@<X8>)
{
  _s32NTKEsterbrookFaceBundleCompanion9SceneInfoO8allCasesSayACGvgZ_0();
  *a1 = v2;
}

uint64_t sub_246A9FCF0(int64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v1 = v3;
  if (!result || a1 > *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v3 + 16) <= a1) {
      int64_t v5 = a1;
    }
    else {
      int64_t v5 = *(void *)(v3 + 16);
    }
    return sub_246AC6678(result, v5, 0);
  }
  return result;
}

uint64_t sub_246A9FD68()
{
  uint64_t v1 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if ((result & 1) == 0)
  {
    int64_t v3 = *(void *)(v1 + 16) + 1;
    return sub_246AC6678(0, v3, 1);
  }
  return result;
}

uint64_t sub_246A9FDC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_246AD9110();
  if (v3)
  {
    uint64_t v5 = a2 + 32;
    do
    {
      ++v5;
      sub_246AD8BE0();
      uint64_t result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t _s32NTKEsterbrookFaceBundleCompanion9SceneInfoO21__derived_enum_equalsySbAC_ACtFZ_0(uint64_t a1, char a2, uint64_t a3, char a4)
{
  switch(a2)
  {
    case 1:
      if (a4 != 1) {
        goto LABEL_49;
      }
      if (*(void *)&aTheater_3[8 * (char)a1] == *(void *)&aTheater_3[8 * (char)a3]
        && *(void *)&aLowpowerwaterl_1[8 * (char)a1 + 16] == *(void *)&aLowpowerwaterl_1[8 * (char)a3 + 16])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = 1;
      }
      else
      {
        char v7 = sub_246AD9060();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = v7 & 1;
      }
      break;
    case 2:
      if (a4 != 2) {
        goto LABEL_49;
      }
      uint64_t result = sub_246A9B91C(a1, a3);
      break;
    case 3:
      if (a4 != 3) {
        goto LABEL_49;
      }
      uint64_t result = sub_246A89534(a1, a3);
      break;
    case 4:
      switch(a1)
      {
        case 1:
          if (a4 != 4 || a3 != 1) {
            goto LABEL_49;
          }
          break;
        case 2:
          if (a4 != 4 || a3 != 2) {
            goto LABEL_49;
          }
          break;
        case 3:
          if (a4 != 4 || a3 != 3) {
            goto LABEL_49;
          }
          break;
        case 4:
          if (a4 != 4 || a3 != 4) {
            goto LABEL_49;
          }
          break;
        case 5:
          if (a4 != 4 || a3 != 5) {
            goto LABEL_49;
          }
          break;
        case 6:
          if (a4 != 4 || a3 != 6) {
            goto LABEL_49;
          }
          break;
        case 7:
          if (a4 != 4 || a3 != 7) {
            goto LABEL_49;
          }
          break;
        default:
          if (a4 != 4 || a3 != 0) {
            goto LABEL_49;
          }
          break;
      }
      uint64_t result = 1;
      break;
    default:
      if (a4)
      {
LABEL_49:
        uint64_t result = 0;
      }
      else
      {
        uint64_t result = sub_246A9B894(a1, a3);
      }
      break;
  }
  return result;
}

uint64_t sub_246AA00BC()
{
  return sub_246AA0144();
}

uint64_t sub_246AA00D8()
{
  return sub_246AD8BE0();
}

uint64_t sub_246AA00F0()
{
  return sub_246AD8BE0();
}

uint64_t sub_246AA010C()
{
  return sub_246AD8BE0();
}

uint64_t sub_246AA0120()
{
  return sub_246AD8BE0();
}

uint64_t sub_246AA0130()
{
  return sub_246AA0144();
}

uint64_t sub_246AA0144()
{
  return sub_246AD9140();
}

uint64_t sub_246AA0190()
{
  return sub_246AA01C0();
}

uint64_t sub_246AA01A4()
{
  return sub_246AA01C0();
}

uint64_t sub_246AA01C0()
{
  return sub_246AD9140();
}

uint64_t sub_246AA0210(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x746E657665 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246AA0290()
{
  return 0x746E657665;
}

uint64_t sub_246AA02A4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7261646E656C6163 && a2 == 0xE800000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656369766564 && a2 == 0xE600000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x68746C616568 && a2 == 0xE600000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7375636F66 && a2 == 0xE500000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x636972656E6567 && a2 == 0xE700000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x657A696C61656469 && a2 == 0xE900000000000064 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x636973756DLL && a2 == 0xE500000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x656E6974756F72 && a2 == 0xE700000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6D756974697274 && a2 == 0xE700000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x72656874616577 && a2 == 0xE700000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6465726F6E6769 && a2 == 0xE700000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6C6F686563616C70 && a2 == 0xEB00000000726564)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_246AA0720(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246AA07A0()
{
  return 0x6574617473;
}

uint64_t sub_246AA07B4(uint64_t a1, uint64_t a2)
{
  if (a1 == 1701080941 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246AA082C()
{
  return 1701080941;
}

uint64_t sub_246AA083C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246AA08C4()
{
  return 0x79726F6765746163;
}

uint64_t sub_246AA08DC(uint64_t a1, uint64_t a2)
{
  if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246AA0954()
{
  return 1701869940;
}

uint64_t sub_246AA0964(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6F697469646E6F63 && a2 == 0xEA0000000000736ELL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_246AD9060();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246AA09F4()
{
  return 0x6F697469646E6F63;
}

uint64_t _s32NTKEsterbrookFaceBundleCompanion11RoutineTypeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_246AD8F20();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_246AA0A5C()
{
  unint64_t v0 = sub_246AD8F20();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

uint64_t _s32NTKEsterbrookFaceBundleCompanion14HealthCategoryO8rawValueSSvg_0()
{
  return 0x74756F6B726F77;
}

uint64_t _s32NTKEsterbrookFaceBundleCompanion9FocusModeO8rawValueSSvg_0()
{
  return 6581860;
}

uint64_t _s32NTKEsterbrookFaceBundleCompanion11DeviceStateO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_246AD8F20();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_246AA0B18()
{
  unint64_t result = qword_2691C0CF0;
  if (!qword_2691C0CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0CF0);
  }
  return result;
}

double _s32NTKEsterbrookFaceBundleCompanion9SceneInfoO8allCasesSayACGvgZ_0()
{
  sub_246A8604C(&qword_2691C1038);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 21;
  *(_OWORD *)(v0 + 16) = xmmword_246ADFC70;
  *(void *)(v0 + 32) = 0;
  *(unsigned char *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 1;
  *(unsigned char *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = 2;
  *(unsigned char *)(v0 + 72) = 0;
  *(void *)(v0 + 80) = 3;
  *(unsigned char *)(v0 + 88) = 0;
  *(void *)(v0 + 96) = 4;
  *(unsigned char *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 6;
  *(unsigned char *)(v0 + 120) = 0;
  *(void *)(v0 + 128) = 7;
  *(unsigned char *)(v0 + 136) = 0;
  *(void *)(v0 + 144) = 0;
  *(unsigned char *)(v0 + 152) = 1;
  *(void *)(v0 + 160) = 1;
  *(unsigned char *)(v0 + 168) = 1;
  *(void *)(v0 + 176) = 2;
  *(unsigned char *)(v0 + 184) = 1;
  *(void *)(v0 + 192) = 0;
  *(unsigned char *)(v0 + 200) = 4;
  *(void *)(v0 + 208) = 1;
  *(unsigned char *)(v0 + 216) = 4;
  *(void *)(v0 + 224) = 2;
  *(unsigned char *)(v0 + 232) = 4;
  *(void *)(v0 + 240) = 3;
  *(unsigned char *)(v0 + 248) = 4;
  *(void *)(v0 + 256) = 4;
  *(unsigned char *)(v0 + 264) = 4;
  *(void *)(v0 + 272) = 0;
  *(unsigned char *)(v0 + 280) = 2;
  *(void *)(v0 + 288) = 1;
  *(unsigned char *)(v0 + 296) = 2;
  *(void *)(v0 + 304) = 5;
  *(unsigned char *)(v0 + 312) = 4;
  *(void *)(v0 + 320) = &unk_26FB01E90;
  *(unsigned char *)(v0 + 328) = 3;
  *(void *)(v0 + 336) = 6;
  *(unsigned char *)(v0 + 344) = 4;
  *(void *)(v0 + 352) = 7;
  *(unsigned char *)(v0 + 360) = 4;
  return result;
}

unint64_t sub_246AA0C78()
{
  unint64_t result = qword_2691C0D60;
  if (!qword_2691C0D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0D60);
  }
  return result;
}

unint64_t sub_246AA0CCC()
{
  unint64_t result = qword_2691C0D68;
  if (!qword_2691C0D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0D68);
  }
  return result;
}

unint64_t sub_246AA0D20()
{
  unint64_t result = qword_2691C0D70;
  if (!qword_2691C0D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0D70);
  }
  return result;
}

unint64_t sub_246AA0D74()
{
  unint64_t result = qword_2691C0D78;
  if (!qword_2691C0D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0D78);
  }
  return result;
}

unint64_t sub_246AA0DC8()
{
  unint64_t result = qword_2691C0D90;
  if (!qword_2691C0D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0D90);
  }
  return result;
}

unint64_t sub_246AA0E1C()
{
  unint64_t result = qword_2691C0D98;
  if (!qword_2691C0D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0D98);
  }
  return result;
}

unint64_t sub_246AA0E70()
{
  unint64_t result = qword_2691C0DA0;
  if (!qword_2691C0DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DA0);
  }
  return result;
}

unint64_t sub_246AA0EC4()
{
  unint64_t result = qword_2691C0DA8;
  if (!qword_2691C0DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DA8);
  }
  return result;
}

unint64_t sub_246AA0F18()
{
  unint64_t result = qword_2691C0DB0;
  if (!qword_2691C0DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DB0);
  }
  return result;
}

unint64_t sub_246AA0F6C()
{
  unint64_t result = qword_2691C0DB8;
  if (!qword_2691C0DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DB8);
  }
  return result;
}

unint64_t sub_246AA0FC0()
{
  unint64_t result = qword_2691C0DC0;
  if (!qword_2691C0DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DC0);
  }
  return result;
}

unint64_t sub_246AA1014()
{
  unint64_t result = qword_2691C0DC8;
  if (!qword_2691C0DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DC8);
  }
  return result;
}

unint64_t sub_246AA1068()
{
  unint64_t result = qword_2691C0DD0;
  if (!qword_2691C0DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DD0);
  }
  return result;
}

unint64_t sub_246AA10BC()
{
  unint64_t result = qword_2691C0DD8;
  if (!qword_2691C0DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DD8);
  }
  return result;
}

unint64_t sub_246AA1110()
{
  unint64_t result = qword_2691C0DE0;
  if (!qword_2691C0DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DE0);
  }
  return result;
}

unint64_t sub_246AA1164()
{
  unint64_t result = qword_2691C0DE8;
  if (!qword_2691C0DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DE8);
  }
  return result;
}

unint64_t sub_246AA11B8()
{
  unint64_t result = qword_2691C0DF0;
  if (!qword_2691C0DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DF0);
  }
  return result;
}

unint64_t sub_246AA120C()
{
  unint64_t result = qword_2691C0DF8;
  if (!qword_2691C0DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0DF8);
  }
  return result;
}

unint64_t sub_246AA1260()
{
  unint64_t result = qword_2691C0E00;
  if (!qword_2691C0E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E00);
  }
  return result;
}

uint64_t sub_246AA12B4(void *a1)
{
  uint64_t v90 = sub_246A8604C(&qword_2691C0F98);
  uint64_t v88 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  v101 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_246A8604C(&qword_2691C0FA0);
  uint64_t v86 = *(void *)(v3 - 8);
  uint64_t v87 = v3;
  MEMORY[0x270FA5388](v3);
  v100 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_246A8604C(&qword_2691C0FA8);
  uint64_t v89 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  v96 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_246A8604C(&qword_2691C0FB0);
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  v95 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C0FB8);
  uint64_t v84 = *(void *)(v7 - 8);
  uint64_t v85 = v7;
  MEMORY[0x270FA5388](v7);
  v99 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_246A8604C(&qword_2691C0FC0);
  uint64_t v81 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  v98 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_246A8604C(&qword_2691C0FC8);
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  v97 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_246A8604C(&qword_2691C0FD0);
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  v93 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_246A8604C(&qword_2691C0FD8);
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  v94 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_246A8604C(&qword_2691C0FE0);
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  v92 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_246A8604C(&qword_2691C0FE8);
  uint64_t v70 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_246A8604C(&qword_2691C0FF0);
  uint64_t v69 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_246A8604C(&qword_2691C0FF8);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1[3];
  v102 = a1;
  uint64_t v24 = (uint64_t)sub_246A8A6E4(a1, v23);
  sub_246AA0C78();
  uint64_t v25 = v103;
  sub_246AD9150();
  if (!v25)
  {
    uint64_t v66 = v18;
    uint64_t v65 = v16;
    uint64_t v67 = v15;
    char v27 = v97;
    uint64_t v26 = v98;
    uint64_t v28 = v99;
    uint64_t v29 = v100;
    uint64_t v68 = 0;
    uint64_t v30 = v101;
    uint64_t v103 = v20;
    uint64_t v31 = sub_246AD8FB0();
    if (*(void *)(v31 + 16) == 1)
    {
      switch(*(unsigned char *)(v31 + 32))
      {
        case 1:
          LOBYTE(v104) = 1;
          sub_246AA1164();
          uint64_t v38 = v67;
          uint64_t v24 = (uint64_t)v22;
          uint64_t v39 = v68;
          sub_246AD8F30();
          if (v39) {
            goto LABEL_28;
          }
          sub_246AA3E80();
          uint64_t v40 = v71;
          sub_246AD8FA0();
          (*(void (**)(char *, uint64_t))(v70 + 8))(v38, v40);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
          uint64_t v24 = v104;
          break;
        case 2:
          LOBYTE(v104) = 2;
          sub_246AA10BC();
          uint64_t v41 = v92;
          uint64_t v24 = (uint64_t)v22;
          uint64_t v42 = v68;
          sub_246AD8F30();
          if (v42) {
            goto LABEL_28;
          }
          sub_246AA3E2C();
          uint64_t v43 = v73;
          sub_246AD8FA0();
          uint64_t v44 = v103;
          (*(void (**)(char *, uint64_t))(v72 + 8))(v41, v43);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v44 + 8))(v22, v19);
          uint64_t v24 = 0;
          break;
        case 3:
          LOBYTE(v104) = 3;
          sub_246AA1014();
          uint64_t v45 = v94;
          uint64_t v24 = (uint64_t)v22;
          uint64_t v46 = v68;
          sub_246AD8F30();
          if (v46) {
            goto LABEL_28;
          }
          sub_246AA3DD8();
          uint64_t v47 = v77;
          sub_246AD8FA0();
          uint64_t v48 = v103;
          (*(void (**)(char *, uint64_t))(v76 + 8))(v45, v47);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v48 + 8))(v22, v19);
          uint64_t v24 = 1;
          break;
        case 4:
          LOBYTE(v104) = 4;
          sub_246AA0FC0();
          char v49 = v93;
          uint64_t v24 = (uint64_t)v22;
          uint64_t v50 = v68;
          sub_246AD8F30();
          if (v50) {
            goto LABEL_28;
          }
          (*(void (**)(char *, uint64_t))(v74 + 8))(v49, v75);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
          uint64_t v24 = 2;
          break;
        case 5:
          LOBYTE(v104) = 5;
          sub_246AA0F6C();
          uint64_t v24 = (uint64_t)v22;
          uint64_t v51 = v68;
          sub_246AD8F30();
          if (v51) {
            goto LABEL_28;
          }
          (*(void (**)(char *, uint64_t))(v78 + 8))(v27, v79);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
          uint64_t v24 = 3;
          break;
        case 6:
          LOBYTE(v104) = 6;
          sub_246AA0F18();
          uint64_t v24 = (uint64_t)v22;
          uint64_t v52 = v68;
          sub_246AD8F30();
          if (v52) {
            goto LABEL_28;
          }
          (*(void (**)(char *, uint64_t))(v81 + 8))(v26, v80);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
          uint64_t v24 = 4;
          break;
        case 7:
          LOBYTE(v104) = 7;
          sub_246AA0E70();
          uint64_t v53 = v28;
          uint64_t v24 = (uint64_t)v22;
          uint64_t v54 = v68;
          sub_246AD8F30();
          if (v54) {
            goto LABEL_28;
          }
          sub_246AA3D84();
          uint64_t v55 = v85;
          sub_246AD8FA0();
          uint64_t v56 = v103;
          (*(void (**)(char *, uint64_t))(v84 + 8))(v53, v55);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v22, v19);
          uint64_t v24 = v104;
          break;
        case 8:
          LOBYTE(v104) = 8;
          sub_246AA0E1C();
          uint64_t v57 = v95;
          uint64_t v24 = (uint64_t)v22;
          uint64_t v58 = v68;
          sub_246AD8F30();
          if (v58) {
            goto LABEL_28;
          }
          (*(void (**)(char *, uint64_t))(v82 + 8))(v57, v83);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
          uint64_t v24 = 5;
          break;
        case 9:
          LOBYTE(v104) = 9;
          sub_246AA0D74();
          char v59 = v96;
          uint64_t v24 = (uint64_t)v22;
          uint64_t v60 = v68;
          sub_246AD8F30();
          if (v60) {
            goto LABEL_28;
          }
          sub_246A8604C(&qword_2691C0D80);
          sub_246AA3CC0(&qword_2691C1000, (void (*)(void))sub_246AA3D30);
          uint64_t v61 = v91;
          sub_246AD8FA0();
          (*(void (**)(char *, uint64_t))(v89 + 8))(v59, v61);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
          uint64_t v24 = v104;
          break;
        case 0xA:
          LOBYTE(v104) = 10;
          sub_246AA0D20();
          uint64_t v24 = (uint64_t)v22;
          uint64_t v62 = v68;
          sub_246AD8F30();
          if (v62) {
            goto LABEL_28;
          }
          (*(void (**)(char *, uint64_t))(v86 + 8))(v29, v87);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
          uint64_t v24 = 6;
          break;
        case 0xB:
          LOBYTE(v104) = 11;
          sub_246AA0CCC();
          uint64_t v24 = (uint64_t)v22;
          uint64_t v63 = v68;
          sub_246AD8F30();
          if (v63) {
            goto LABEL_28;
          }
          (*(void (**)(char *, uint64_t))(v88 + 8))(v30, v90);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
          uint64_t v24 = 7;
          break;
        default:
          LOBYTE(v104) = 0;
          sub_246AA120C();
          unsigned __int8 v32 = v66;
          uint64_t v24 = (uint64_t)v22;
          uint64_t v33 = v68;
          sub_246AD8F30();
          if (v33)
          {
LABEL_28:
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
          }
          else
          {
            sub_246AA3ED4();
            uint64_t v34 = v65;
            sub_246AD8FA0();
            (*(void (**)(char *, uint64_t))(v69 + 8))(v32, v34);
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
            uint64_t v24 = v104;
          }
          break;
      }
    }
    else
    {
      uint64_t v35 = sub_246AD8E70();
      swift_allocError();
      uint64_t v37 = v36;
      sub_246A8604C(&qword_2691C05D0);
      *uint64_t v37 = &type metadata for SceneInfo;
      uint64_t v24 = (uint64_t)v22;
      sub_246AD8F40();
      sub_246AD8E30();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v35 - 8) + 104))(v37, *MEMORY[0x263F8DCB0], v35);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v19);
    }
  }
  sub_246A85F9C((uint64_t)v102);
  return v24;
}

unint64_t sub_246AA2468()
{
  unint64_t result = qword_2691C0E08;
  if (!qword_2691C0E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E08);
  }
  return result;
}

uint64_t sub_246AA24BC()
{
  return sub_246A8E1C8(&qword_2691C0E10, &qword_2691C0D80);
}

unint64_t sub_246AA24E8()
{
  unint64_t result = qword_2691C0E18;
  if (!qword_2691C0E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E18);
  }
  return result;
}

unint64_t sub_246AA2540()
{
  unint64_t result = qword_2691C0E20;
  if (!qword_2691C0E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E20);
  }
  return result;
}

unint64_t sub_246AA2598()
{
  unint64_t result = qword_2691C0E28;
  if (!qword_2691C0E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E28);
  }
  return result;
}

unint64_t sub_246AA25F0()
{
  unint64_t result = qword_2691C0E30;
  if (!qword_2691C0E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E30);
  }
  return result;
}

unint64_t sub_246AA2648()
{
  unint64_t result = qword_2691C0E38;
  if (!qword_2691C0E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E38);
  }
  return result;
}

uint64_t sub_246AA269C()
{
  return sub_246A8E1C8(&qword_2691C0E40, &qword_2691C0E48);
}

unint64_t sub_246AA26C8()
{
  unint64_t result = qword_2691C0E50;
  if (!qword_2691C0E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E50);
  }
  return result;
}

uint64_t sub_246AA271C()
{
  return sub_246A8E1C8(&qword_2691C0E58, &qword_2691C04D8);
}

uint64_t initializeBufferWithCopyOfBuffer for SceneInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_246A8A6BC(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for SceneInfo(uint64_t a1)
{
  return sub_246A8A6D0(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t assignWithCopy for SceneInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_246A8A6BC(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  *(void *)a1 = v3;
  char v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_246A8A6D0(v5, v6);
  return a1;
}

uint64_t initializeWithTake for SceneInfo(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for SceneInfo(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_246A8A6D0(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_246AA28D0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 3u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_246AA28E8(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)unint64_t result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SceneInfo()
{
  return &type metadata for SceneInfo;
}

ValueMetadata *type metadata accessor for EsterbrookWeatherCondition()
{
  return &type metadata for EsterbrookWeatherCondition;
}

unsigned char *storeEnumTagSinglePayload for RoutineType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AA29F4);
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

ValueMetadata *type metadata accessor for RoutineType()
{
  return &type metadata for RoutineType;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion13CalendarEventOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x246AA2AF8);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CalendarEvent()
{
  return &type metadata for CalendarEvent;
}

ValueMetadata *type metadata accessor for HealthCategory()
{
  return &type metadata for HealthCategory;
}

ValueMetadata *type metadata accessor for FocusMode()
{
  return &type metadata for FocusMode;
}

unsigned char *storeEnumTagSinglePayload for DeviceState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AA2C20);
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

ValueMetadata *type metadata accessor for DeviceState()
{
  return &type metadata for DeviceState;
}

uint64_t getEnumTagSinglePayload for SceneInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SceneInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x246AA2DB4);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneInfo.CodingKeys()
{
  return &type metadata for SceneInfo.CodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.CalendarCodingKeys()
{
  return &type metadata for SceneInfo.CalendarCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.DeviceCodingKeys()
{
  return &type metadata for SceneInfo.DeviceCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.HealthCodingKeys()
{
  return &type metadata for SceneInfo.HealthCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.FocusCodingKeys()
{
  return &type metadata for SceneInfo.FocusCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.GenericCodingKeys()
{
  return &type metadata for SceneInfo.GenericCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.IdealizedCodingKeys()
{
  return &type metadata for SceneInfo.IdealizedCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.MusicCodingKeys()
{
  return &type metadata for SceneInfo.MusicCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.RoutineCodingKeys()
{
  return &type metadata for SceneInfo.RoutineCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.TritiumCodingKeys()
{
  return &type metadata for SceneInfo.TritiumCodingKeys;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion14HealthCategoryOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x246AA2F18);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneInfo.WeatherCodingKeys()
{
  return &type metadata for SceneInfo.WeatherCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.IgnoredCodingKeys()
{
  return &type metadata for SceneInfo.IgnoredCodingKeys;
}

ValueMetadata *type metadata accessor for SceneInfo.PlaceholderCodingKeys()
{
  return &type metadata for SceneInfo.PlaceholderCodingKeys;
}

unint64_t sub_246AA2F74()
{
  unint64_t result = qword_2691C0E60;
  if (!qword_2691C0E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E60);
  }
  return result;
}

unint64_t sub_246AA2FCC()
{
  unint64_t result = qword_2691C0E68;
  if (!qword_2691C0E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E68);
  }
  return result;
}

unint64_t sub_246AA3024()
{
  unint64_t result = qword_2691C0E70;
  if (!qword_2691C0E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E70);
  }
  return result;
}

unint64_t sub_246AA307C()
{
  unint64_t result = qword_2691C0E78;
  if (!qword_2691C0E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E78);
  }
  return result;
}

unint64_t sub_246AA30D4()
{
  unint64_t result = qword_2691C0E80;
  if (!qword_2691C0E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E80);
  }
  return result;
}

unint64_t sub_246AA312C()
{
  unint64_t result = qword_2691C0E88;
  if (!qword_2691C0E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E88);
  }
  return result;
}

unint64_t sub_246AA3184()
{
  unint64_t result = qword_2691C0E90;
  if (!qword_2691C0E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E90);
  }
  return result;
}

unint64_t sub_246AA31DC()
{
  unint64_t result = qword_2691C0E98;
  if (!qword_2691C0E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0E98);
  }
  return result;
}

unint64_t sub_246AA3234()
{
  unint64_t result = qword_2691C0EA0;
  if (!qword_2691C0EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EA0);
  }
  return result;
}

unint64_t sub_246AA328C()
{
  unint64_t result = qword_2691C0EA8;
  if (!qword_2691C0EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EA8);
  }
  return result;
}

unint64_t sub_246AA32E4()
{
  unint64_t result = qword_2691C0EB0;
  if (!qword_2691C0EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EB0);
  }
  return result;
}

unint64_t sub_246AA333C()
{
  unint64_t result = qword_2691C0EB8;
  if (!qword_2691C0EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EB8);
  }
  return result;
}

unint64_t sub_246AA3394()
{
  unint64_t result = qword_2691C0EC0;
  if (!qword_2691C0EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EC0);
  }
  return result;
}

unint64_t sub_246AA33EC()
{
  unint64_t result = qword_2691C0EC8;
  if (!qword_2691C0EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EC8);
  }
  return result;
}

unint64_t sub_246AA3444()
{
  unint64_t result = qword_2691C0ED0;
  if (!qword_2691C0ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0ED0);
  }
  return result;
}

unint64_t sub_246AA349C()
{
  unint64_t result = qword_2691C0ED8;
  if (!qword_2691C0ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0ED8);
  }
  return result;
}

unint64_t sub_246AA34F4()
{
  unint64_t result = qword_2691C0EE0;
  if (!qword_2691C0EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EE0);
  }
  return result;
}

unint64_t sub_246AA354C()
{
  unint64_t result = qword_2691C0EE8;
  if (!qword_2691C0EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EE8);
  }
  return result;
}

unint64_t sub_246AA35A4()
{
  unint64_t result = qword_2691C0EF0;
  if (!qword_2691C0EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EF0);
  }
  return result;
}

unint64_t sub_246AA35FC()
{
  unint64_t result = qword_2691C0EF8;
  if (!qword_2691C0EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0EF8);
  }
  return result;
}

unint64_t sub_246AA3654()
{
  unint64_t result = qword_2691C0F00;
  if (!qword_2691C0F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F00);
  }
  return result;
}

unint64_t sub_246AA36AC()
{
  unint64_t result = qword_2691C0F08;
  if (!qword_2691C0F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F08);
  }
  return result;
}

unint64_t sub_246AA3704()
{
  unint64_t result = qword_2691C0F10;
  if (!qword_2691C0F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F10);
  }
  return result;
}

unint64_t sub_246AA375C()
{
  unint64_t result = qword_2691C0F18;
  if (!qword_2691C0F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F18);
  }
  return result;
}

unint64_t sub_246AA37B4()
{
  unint64_t result = qword_2691C0F20;
  if (!qword_2691C0F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F20);
  }
  return result;
}

unint64_t sub_246AA380C()
{
  unint64_t result = qword_2691C0F28;
  if (!qword_2691C0F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F28);
  }
  return result;
}

unint64_t sub_246AA3864()
{
  unint64_t result = qword_2691C0F30;
  if (!qword_2691C0F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F30);
  }
  return result;
}

unint64_t sub_246AA38BC()
{
  unint64_t result = qword_2691C0F38;
  if (!qword_2691C0F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F38);
  }
  return result;
}

unint64_t sub_246AA3914()
{
  unint64_t result = qword_2691C0F40;
  if (!qword_2691C0F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F40);
  }
  return result;
}

unint64_t sub_246AA396C()
{
  unint64_t result = qword_2691C0F48;
  if (!qword_2691C0F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F48);
  }
  return result;
}

unint64_t sub_246AA39C4()
{
  unint64_t result = qword_2691C0F50;
  if (!qword_2691C0F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F50);
  }
  return result;
}

unint64_t sub_246AA3A1C()
{
  unint64_t result = qword_2691C0F58;
  if (!qword_2691C0F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F58);
  }
  return result;
}

unint64_t sub_246AA3A74()
{
  unint64_t result = qword_2691C0F60;
  if (!qword_2691C0F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F60);
  }
  return result;
}

unint64_t sub_246AA3AC8()
{
  unint64_t result = qword_2691C0F68;
  if (!qword_2691C0F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F68);
  }
  return result;
}

unint64_t sub_246AA3B1C()
{
  unint64_t result = qword_2691C0F70;
  if (!qword_2691C0F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F70);
  }
  return result;
}

unint64_t sub_246AA3B70()
{
  unint64_t result = qword_2691C0F78;
  if (!qword_2691C0F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F78);
  }
  return result;
}

unint64_t sub_246AA3BC4()
{
  unint64_t result = qword_2691C0F80;
  if (!qword_2691C0F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F80);
  }
  return result;
}

unint64_t sub_246AA3C18()
{
  unint64_t result = qword_2691C0F88;
  if (!qword_2691C0F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F88);
  }
  return result;
}

unint64_t sub_246AA3C6C()
{
  unint64_t result = qword_2691C0F90;
  if (!qword_2691C0F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C0F90);
  }
  return result;
}

uint64_t sub_246AA3CC0(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_246A8A7DC(&qword_2691C0D80);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_246AA3D30()
{
  unint64_t result = qword_2691C1008;
  if (!qword_2691C1008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1008);
  }
  return result;
}

unint64_t sub_246AA3D84()
{
  unint64_t result = qword_2691C1010;
  if (!qword_2691C1010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1010);
  }
  return result;
}

unint64_t sub_246AA3DD8()
{
  unint64_t result = qword_2691C1018;
  if (!qword_2691C1018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1018);
  }
  return result;
}

unint64_t sub_246AA3E2C()
{
  unint64_t result = qword_2691C1020;
  if (!qword_2691C1020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1020);
  }
  return result;
}

unint64_t sub_246AA3E80()
{
  unint64_t result = qword_2691C1028;
  if (!qword_2691C1028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1028);
  }
  return result;
}

unint64_t sub_246AA3ED4()
{
  unint64_t result = qword_2691C1030;
  if (!qword_2691C1030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1030);
  }
  return result;
}

BOOL sub_246AA3F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a1 + *(int *)(a3 + 24)) < *(double *)(a2 + *(int *)(a3 + 24));
}

BOOL sub_246AA3F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a2 + *(int *)(a3 + 24)) >= *(double *)(a1 + *(int *)(a3 + 24));
}

BOOL sub_246AA3F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a1 + *(int *)(a3 + 24)) >= *(double *)(a2 + *(int *)(a3 + 24));
}

BOOL sub_246AA3F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a2 + *(int *)(a3 + 24)) < *(double *)(a1 + *(int *)(a3 + 24));
}

BOOL sub_246AA3F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a1 + *(int *)(a3 + 24)) == *(double *)(a2 + *(int *)(a3 + 24));
}

unint64_t sub_246AA3FA8()
{
  unint64_t result = qword_2691C1040;
  if (!qword_2691C1040)
  {
    type metadata accessor for SceneScore();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1040);
  }
  return result;
}

uint64_t type metadata accessor for SceneScore()
{
  uint64_t result = qword_2691C1048;
  if (!qword_2691C1048) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_246AA404C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_246AD89C0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_246AA4124(uint64_t a1)
{
  uint64_t v2 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_246AA4198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_246AA4220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_246AA42B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_246AA433C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_246AA43CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246AA43E0);
}

uint64_t sub_246AA43E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
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

uint64_t sub_246AA44A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246AA44B4);
}

uint64_t sub_246AA44B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_246AD89C0();
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

uint64_t sub_246AA4570()
{
  uint64_t result = sub_246AD89C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_246AA4618(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  uint64_t v6 = sub_246A8604C(&qword_2691C12E0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Scene();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_246AABBEC(a1, &qword_2691C12E0);
    uint64_t v13 = sub_246ACBDC8(a2);
    if (v14)
    {
      unint64_t v15 = v13;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v17 = *v3;
      uint64_t v21 = *v3;
      uint64_t *v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_246ACE69C();
        uint64_t v17 = v21;
      }
      sub_246AAB894(*(void *)(v17 + 56) + *(void *)(v10 + 72) * v15, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for Scene);
      sub_246ACD85C(v15, v17);
      uint64_t *v3 = v17;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    }
    return sub_246AABBEC((uint64_t)v8, &qword_2691C12E0);
  }
  else
  {
    sub_246AAB894(a1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for Scene);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_246ACDD30((uint64_t)v12, a2, v18);
    uint64_t *v3 = v21;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_246AA4878()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_246AD8AD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR___NTKEsterbrookSceneView_animatingState;
  if (v0[OBJC_IVAR___NTKEsterbrookSceneView_animatingState]) {
    sub_246AAA8CC();
  }
  else {
    sub_246AAA270();
  }
  if (qword_2691C0238 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_246A8AB74(v2, (uint64_t)qword_2691D4060);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  uint64_t v8 = v0;
  uint64_t v9 = sub_246AD8AB0();
  os_log_type_t v10 = sub_246AD8D00();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v19 = v2;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    int v14 = v1[v6];
    uint64_t v21 = v13;
    if (v14) {
      uint64_t v15 = 0x646573756170;
    }
    else {
      uint64_t v15 = 0x676E6979616C70;
    }
    if (v14) {
      unint64_t v16 = 0xE600000000000000;
    }
    else {
      unint64_t v16 = 0xE700000000000000;
    }
    uint64_t v20 = sub_246ACB68C(v15, v16, &v21);
    sub_246AD8D90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v9, v10, "Updated scene view state to [%s]!", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v13, -1, -1);
    MEMORY[0x24C541130](v12, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v19);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t (*sub_246AA4B2C())()
{
  return j__swift_endAccess;
}

id sub_246AA4C14(double a1)
{
  uint64_t v2 = OBJC_IVAR___NTKEsterbrookSceneView_tritiumProgress;
  *(double *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_tritiumProgress) = a1;
  *(double *)(*(void *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_sceneBackgroundView)
            + OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumProgress) = a1;
  sub_246AC475C();
  *(void *)(*(void *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_dialView)
            + OBJC_IVAR___NTKEsterbrookSceneDialView_tritiumProgress) = *(void *)(v1 + v2);
  sub_246A87328();

  return sub_246AA7808();
}

uint64_t sub_246AA4D98()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_246A8604C(&qword_2691C12E0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (uint64_t)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v48 - v6;
  if (*(double *)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_liveProgress) == 1.0)
  {
    uint64_t v8 = (uint64_t *)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes);
    swift_beginAccess();
    uint64_t v9 = *v8;
    if (*(void *)(*v8 + 16) && (uint64_t v10 = sub_246ACBDC8(1), (v11 & 1) != 0))
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)(v9 + 56);
      int v14 = (uint64_t *)type metadata accessor for Scene();
      uint64_t v15 = *(v14 - 1);
      uint64_t v50 = *(void *)(v15 + 72);
      sub_246AAB960(v13 + v50 * v12, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Scene);
      uint64_t v16 = v15 + 56;
      uint64_t v17 = *(char **)(v15 + 56);
      ((void (*)(char *, void, uint64_t, uint64_t *))v17)(v7, 0, 1, v14);
      sub_246AABBEC((uint64_t)v7, &qword_2691C12E0);
      uint64_t v18 = (uint64_t *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_spriteViews);
      swift_beginAccess();
      uint64_t v19 = *v18;
      if (*(void *)(v19 + 16) && (uint64_t v20 = sub_246ACBDC8(1), (v21 & 1) != 0))
      {
        unint64_t v22 = *(void *)(*(void *)(v19 + 56) + 8 * v20);
        swift_bridgeObjectRetain();
      }
      else
      {
        unint64_t v22 = MEMORY[0x263F8EE78];
      }
      if (v22 >> 62) {
        goto LABEL_46;
      }
      uint64_t v27 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
      while (v27)
      {
        char v49 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))v17;
        uint64_t v54 = v16;
        uint64_t v55 = v8;
        uint64_t v51 = v15;
        uint64_t v52 = v14;
        uint64_t v53 = v5;
        if ((v22 & 0xC000000000000001) == 0)
        {
          uint64_t v5 = 0;
          uint64_t v17 = (char *)OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite;
          uint64_t v15 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator;
          uint64_t v8 = (uint64_t *)OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_state;
          while (1)
          {
            uint64_t v30 = (char *)(v5 + 1);
            if (__OFADD__(v5, 1)) {
              goto LABEL_45;
            }
            uint64_t v16 = *(void *)(v22 + 8 * v5 + 32);
            int v14 = (uint64_t *)&v17[*(int *)(type metadata accessor for Sprite() + 32) + v16];
            if (*((unsigned char *)v14 + *(int *)(type metadata accessor for Timing(0) + 28)) == 3) {
              break;
            }
            if (*((unsigned char *)v8 + *(void *)(v16 + v15)) != 2)
            {
              uint64_t v33 = v52;
              uint64_t v32 = v53;
              uint64_t v34 = v51;
              uint64_t v31 = v55;
              swift_bridgeObjectRelease();
              goto LABEL_32;
            }
            ++v5;
            if (v30 == (char *)v27) {
              goto LABEL_43;
            }
          }
          swift_bridgeObjectRelease();
LABEL_31:
          uint64_t v33 = v52;
          uint64_t v32 = v53;
          uint64_t v34 = v51;
          uint64_t v31 = v55;
LABEL_32:
          if (*(unsigned char *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_animatingState)) {
            return 0;
          }
          uint64_t v35 = *v31;
          if (*(void *)(*v31 + 16))
          {
            uint64_t v36 = 1;
            uint64_t v37 = sub_246ACBDC8(1);
            if (v38)
            {
              sub_246AAB960(*(void *)(v35 + 56) + v37 * v50, v32, (uint64_t (*)(void))type metadata accessor for Scene);
              uint64_t v36 = 0;
            }
          }
          else
          {
            uint64_t v36 = 1;
          }
          v49(v32, v36, 1, v33);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(v34 + 48))(v32, 1, v33))
          {
            uint64_t v24 = v32;
            goto LABEL_8;
          }
          swift_bridgeObjectRetain();
          sub_246AABBEC(v32, &qword_2691C12E0);
          uint64_t v56 = 0;
          unint64_t v57 = 0xE000000000000000;
          sub_246AD8DF0();
          swift_bridgeObjectRelease();
          uint64_t v56 = 0x52435345445F4F56;
          unint64_t v57 = 0xEF5F4E4F49545049;
          sub_246AD8BF0();
          swift_bridgeObjectRelease();
          uint64_t v40 = v56;
          unint64_t v39 = v57;
          sub_246AABC48(0, &qword_2691C1160);
          uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
          uint64_t v42 = (void *)sub_246AD8B80();
          uint64_t v43 = (void *)sub_246AD8B80();
          id v44 = objc_msgSend(ObjCClassFromMetadata, sel_localizedStringForKey_comment_, v42, v43);

          uint64_t v25 = sub_246AD8BB0();
          uint64_t v46 = v45;

          if (v25 == v40 && v46 == v39)
          {
            swift_bridgeObjectRelease_n();
            return 0;
          }
          char v47 = sub_246AD9060();
          swift_bridgeObjectRelease();
          if ((v47 & 1) == 0) {
            return v25;
          }
          break;
        }
        uint64_t v17 = 0;
        uint64_t v8 = &OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite;
        int v14 = &OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator;
        while (1)
        {
          uint64_t v28 = MEMORY[0x24C540420](v17, v22);
          uint64_t v5 = (uint64_t)(v17 + 1);
          if (__OFADD__(v17, 1)) {
            break;
          }
          uint64_t v15 = v28;
          uint64_t v29 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite;
          uint64_t v16 = v28 + *(int *)(type metadata accessor for Sprite() + 32) + v29;
          if (*(unsigned char *)(v16 + *(int *)(type metadata accessor for Timing(0) + 28)) == 3)
          {
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            goto LABEL_31;
          }
          if (*(unsigned char *)(*(void *)(v15 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator)
                        + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_state) != 2)
          {
            uint64_t v31 = v55;
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            uint64_t v33 = v52;
            uint64_t v32 = v53;
            uint64_t v34 = v51;
            goto LABEL_32;
          }
          swift_unknownObjectRelease();
          ++v17;
          if (v5 == v27) {
            goto LABEL_43;
          }
        }
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_246AD8EC0();
        swift_bridgeObjectRelease();
      }
LABEL_43:
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = type metadata accessor for Scene();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v7, 1, 1, v23);
      uint64_t v24 = (uint64_t)v7;
LABEL_8:
      sub_246AABBEC(v24, &qword_2691C12E0);
    }
  }
  return 0;
}

uint64_t sub_246AA5454(char a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = OBJC_IVAR___NTKEsterbrookSceneView_showSpriteDebugHelpers;
  *(unsigned char *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_showSpriteDebugHelpers) = a1;
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_spriteViews);
  uint64_t result = swift_beginAccess();
  uint64_t v6 = *v4;
  if (*(void *)(v6 + 16) && (uint64_t result = sub_246ACBDC8(1), (v7 & 1) != 0))
  {
    unint64_t v8 = *(void *)(*(void *)(v6 + 56) + 8 * result);
    uint64_t result = swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v8 = MEMORY[0x263F8EE78];
  }
  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9) {
      goto LABEL_7;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_246AD8EC0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v9) {
    return swift_bridgeObjectRelease();
  }
LABEL_7:
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      if ((v8 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x24C540420](v10, v8);
      }
      else {
        id v11 = *(id *)(v8 + 8 * v10 + 32);
      }
      uint64_t v12 = v11;
      ++v10;
      *((unsigned char *)v11 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_showDebugHelpers) = *(unsigned char *)(v2 + v3);
      sub_246AC49E4();
    }
    while (v9 != v10);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

char *sub_246AA55A0(void *a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v15 = OBJC_IVAR___NTKEsterbrookSceneView_loader;
  id v16 = objc_allocWithZone((Class)type metadata accessor for SceneLoader());
  uint64_t v17 = v7;
  *(void *)&v7[v15] = objc_msgSend(v16, sel_init);
  *(_OWORD *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_layout] = xmmword_246AE13F0;
  uint64_t v18 = OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes;
  uint64_t v19 = (void *)MEMORY[0x263F8EE78];
  *(void *)&v17[v18] = sub_246ACF4F4(MEMORY[0x263F8EE78]);
  v17[OBJC_IVAR___NTKEsterbrookSceneView_animatingState] = 1;
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v17[OBJC_IVAR___NTKEsterbrookSceneView_didNotifyLiveSceneStartedPlayback] = 0;
  uint64_t v20 = OBJC_IVAR___NTKEsterbrookSceneView_spriteViews;
  *(void *)&v17[v20] = sub_246ACF69C(v19);
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_tritiumProgress] = 0;
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_liveProgress] = 0;
  v17[OBJC_IVAR___NTKEsterbrookSceneView_showSpriteDebugHelpers] = 0;
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_handsView] = a1;
  char v21 = (objc_class *)type metadata accessor for ScenePalette();
  id v22 = objc_allocWithZone(v21);
  id v23 = a1;
  swift_unknownObjectRetain();
  uint64_t v24 = (char *)v22;
  id v25 = objc_msgSend(a2, sel_background);
  *(void *)&v24[OBJC_IVAR___NTKEsterbrookScenePalette_background] = v25;
  id v26 = objc_msgSend(a2, sel_overlay);
  *(void *)&v24[OBJC_IVAR___NTKEsterbrookScenePalette_overlay] = v26;
  id v27 = objc_msgSend(a2, sel_secondHand);
  *(void *)&v24[OBJC_IVAR___NTKEsterbrookScenePalette_secondHand] = v27;

  v50.receiver = v24;
  v50.super_class = v21;
  id v28 = objc_msgSendSuper2(&v50, sel_init);
  swift_unknownObjectRelease();
  uint64_t v29 = OBJC_IVAR___NTKEsterbrookSceneView_scenePalette;
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_scenePalette] = v28;
  id v30 = objc_allocWithZone((Class)type metadata accessor for SceneDialView());
  id v31 = a3;
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_dialView] = sub_246A8611C(v31, 0.0, 0.0, a6, a7);
  uint64_t v32 = *(void **)&v17[v29];
  id v33 = objc_allocWithZone((Class)type metadata accessor for SceneBackgroundView());
  id v34 = v31;
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_sceneBackgroundView] = sub_246AC42CC(v34, v32, 0.0, 0.0, a6, a7);
  id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, a6, a7);
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_tritiumContainerView] = v35;
  id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, a6, a7);
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_backgroundContainerView] = v36;
  id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, a6, a7);
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_midgroundContainerView] = v37;
  id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, a6, a7);
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_foregroundContainerView] = v38;
  id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, a6, a7);
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_forefrontContainerView] = v39;
  id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, a6, a7);
  *(void *)&v17[OBJC_IVAR___NTKEsterbrookSceneView_idealizedContainerView] = v40;

  v49.receiver = v17;
  v49.super_class = (Class)type metadata accessor for SceneView();
  uint64_t v41 = (char *)objc_msgSendSuper2(&v49, sel_initWithFrame_, a4, a5, a6, a7);
  uint64_t v42 = *(void *)&v41[OBJC_IVAR___NTKEsterbrookSceneView_sceneBackgroundView];
  uint64_t v43 = v41;
  objc_msgSend(v43, sel_addSubview_, v42);
  objc_msgSend(v43, sel_addSubview_, *(void *)&v43[OBJC_IVAR___NTKEsterbrookSceneView_dialView]);
  objc_msgSend(v43, sel_addSubview_, *(void *)&v43[OBJC_IVAR___NTKEsterbrookSceneView_tritiumContainerView]);
  objc_msgSend(v43, sel_addSubview_, *(void *)&v43[OBJC_IVAR___NTKEsterbrookSceneView_backgroundContainerView]);
  id v44 = v43;
  uint64_t result = (char *)objc_msgSend(v23, sel_hourHandView);
  if (result)
  {
    uint64_t v46 = result;
    objc_msgSend(v44, sel_addSubview_, result);

    objc_msgSend(v44, sel_addSubview_, *(void *)&v44[OBJC_IVAR___NTKEsterbrookSceneView_midgroundContainerView]);
    objc_msgSend(v44, sel_addSubview_, v23);
    objc_msgSend(v44, sel_addSubview_, *(void *)&v44[OBJC_IVAR___NTKEsterbrookSceneView_foregroundContainerView]);
    char v47 = v44;
    uint64_t result = (char *)objc_msgSend(v23, sel_secondHandView);
    if (result)
    {
      uint64_t v48 = result;
      objc_msgSend(v47, sel_addSubview_, result);

      objc_msgSend(v47, sel_addSubview_, *(void *)&v47[OBJC_IVAR___NTKEsterbrookSceneView_forefrontContainerView]);
      objc_msgSend(v47, sel_addSubview_, *(void *)&v47[OBJC_IVAR___NTKEsterbrookSceneView_idealizedContainerView]);
      sub_246AA7808();
      sub_246AA63D0();

      swift_unknownObjectRelease();
      return v47;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_246AA5B6C(void *a1)
{
  uint64_t v3 = OBJC_IVAR___NTKEsterbrookSceneView_loader;
  id v4 = objc_allocWithZone((Class)type metadata accessor for SceneLoader());
  uint64_t v5 = v1;
  *(void *)&v1[v3] = objc_msgSend(v4, sel_init);
  *(_OWORD *)&v5[OBJC_IVAR___NTKEsterbrookSceneView_layout] = xmmword_246AE13F0;
  uint64_t v6 = OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes;
  char v7 = (void *)MEMORY[0x263F8EE78];
  *(void *)&v5[v6] = sub_246ACF4F4(MEMORY[0x263F8EE78]);
  v5[OBJC_IVAR___NTKEsterbrookSceneView_animatingState] = 1;
  uint64_t v8 = (uint64_t)&v5[OBJC_IVAR___NTKEsterbrookSceneView_delegate];
  *(void *)&v5[OBJC_IVAR___NTKEsterbrookSceneView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v5[OBJC_IVAR___NTKEsterbrookSceneView_didNotifyLiveSceneStartedPlayback] = 0;
  uint64_t v9 = OBJC_IVAR___NTKEsterbrookSceneView_spriteViews;
  unint64_t v10 = sub_246ACF69C(v7);

  *(void *)&v5[v9] = v10;
  *(void *)&v5[OBJC_IVAR___NTKEsterbrookSceneView_tritiumProgress] = 0;
  *(void *)&v5[OBJC_IVAR___NTKEsterbrookSceneView_liveProgress] = 0;
  v5[OBJC_IVAR___NTKEsterbrookSceneView_showSpriteDebugHelpers] = 0;

  swift_bridgeObjectRelease();
  sub_246AABC84(v8);

  swift_bridgeObjectRelease();
  type metadata accessor for SceneView();
  swift_deallocPartialClassInstance();
  return 0;
}

id sub_246AA5CF0()
{
  uint64_t v1 = &v0[OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes];
  swift_beginAccess();
  *(void *)uint64_t v1 = MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
  uint64_t v2 = &v0[OBJC_IVAR___NTKEsterbrookSceneView_spriteViews];
  swift_beginAccess();
  uint64_t v3 = swift_bridgeObjectRetain();
  unint64_t v4 = sub_246AA5E88(v3);
  id result = (id)swift_bridgeObjectRelease();
  if (!(v4 >> 62))
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    *(void *)uint64_t v2 = MEMORY[0x263F8EE80];
    swift_bridgeObjectRelease();
    v10.receiver = v0;
    v10.super_class = (Class)type metadata accessor for SceneView();
    return objc_msgSendSuper2(&v10, sel_dealloc);
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_246AD8EC0();
  id result = (id)swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_10;
  }
LABEL_3:
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x24C540420](v7, v4);
      }
      else {
        id v8 = *(id *)(v4 + 8 * v7 + 32);
      }
      uint64_t v9 = v8;
      ++v7;
      *((unsigned char *)v8 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_state) = 1;
      objc_msgSend(v8, sel_removeFromSuperview);
    }
    while (v6 != v7);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_246AA5E88(uint64_t a1)
{
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v1 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v9 >= v5) {
      goto LABEL_23;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v9);
    ++v7;
    if (!v10)
    {
      int64_t v7 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_23;
      }
      uint64_t v10 = *(void *)(v1 + 8 * v7);
      if (!v10)
      {
        int64_t v7 = v9 + 2;
        if (v9 + 2 >= v5) {
          goto LABEL_23;
        }
        uint64_t v10 = *(void *)(v1 + 8 * v7);
        if (!v10)
        {
          int64_t v7 = v9 + 3;
          if (v9 + 3 >= v5) {
            goto LABEL_23;
          }
          uint64_t v10 = *(void *)(v1 + 8 * v7);
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v4 = (v10 - 1) & v10;
LABEL_5:
    unint64_t v8 = swift_bridgeObjectRetain();
    uint64_t result = sub_246ACFF7C(v8);
  }
  int64_t v11 = v9 + 4;
  if (v11 >= v5)
  {
LABEL_23:
    swift_release();
    return v12;
  }
  uint64_t v10 = *(void *)(v1 + 8 * v11);
  if (v10)
  {
    int64_t v7 = v11;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_23;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v7);
    ++v11;
    if (v10) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_246AA612C()
{
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for SceneView();
  objc_msgSendSuper2(&v14, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___NTKEsterbrookSceneView_sceneBackgroundView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_ntk_setBoundsAndPositionFromFrame_);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___NTKEsterbrookSceneView_tritiumContainerView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_ntk_setBoundsAndPositionFromFrame_);
  uint64_t v3 = *(void **)&v0[OBJC_IVAR___NTKEsterbrookSceneView_backgroundContainerView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v3, sel_ntk_setBoundsAndPositionFromFrame_);
  uint64_t v4 = *(void **)&v0[OBJC_IVAR___NTKEsterbrookSceneView_midgroundContainerView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v4, sel_ntk_setBoundsAndPositionFromFrame_);
  int64_t v5 = *(void **)&v0[OBJC_IVAR___NTKEsterbrookSceneView_foregroundContainerView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v5, sel_ntk_setBoundsAndPositionFromFrame_);
  uint64_t v6 = *(void **)&v0[OBJC_IVAR___NTKEsterbrookSceneView_forefrontContainerView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v6, sel_ntk_setBoundsAndPositionFromFrame_);
  int64_t v7 = *(void **)&v0[OBJC_IVAR___NTKEsterbrookSceneView_idealizedContainerView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v7, sel_ntk_setBoundsAndPositionFromFrame_);
  uint64_t v8 = OBJC_IVAR___NTKEsterbrookSceneView_handsView;
  id v9 = *(id *)&v0[OBJC_IVAR___NTKEsterbrookSceneView_handsView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v9, sel_ntk_setBoundsAndPositionFromFrame_);

  id v10 = objc_msgSend(*(id *)&v0[v8], sel_hourHandView);
  if (v10)
  {
    int64_t v11 = v10;
    MEMORY[0x24C540930](objc_msgSend(v0, sel_bounds));
    objc_msgSend(v11, sel_setCenter_);

    id v12 = objc_msgSend(*(id *)&v0[v8], sel_secondHandView);
    if (v12)
    {
      uint64_t v13 = v12;
      MEMORY[0x24C540930](objc_msgSend(v0, sel_bounds));
      objc_msgSend(v13, sel_setCenter_);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_246AA63D0()
{
  if (qword_2691C0238 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_246AD8AD0();
  sub_246A8AB74(v1, (uint64_t)qword_2691D4060);
  uint64_t v2 = v0;
  uint64_t v3 = sub_246AD8AB0();
  os_log_type_t v4 = sub_246AD8D00();
  if (os_log_type_enabled(v3, v4))
  {
    int64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)int64_t v5 = 138412290;
    objc_super v14 = *(void **)&v2[OBJC_IVAR___NTKEsterbrookSceneView_scenePalette];
    id v7 = v14;
    sub_246AD8D90();
    void *v6 = v14;

    _os_log_impl(&dword_246A80000, v3, v4, "Applying scene palette: %@", v5, 0xCu);
    sub_246A8604C(&qword_2691C1158);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v6, -1, -1);
    MEMORY[0x24C541130](v5, -1, -1);
  }
  else
  {
  }
  uint64_t v8 = *(void *)&v2[OBJC_IVAR___NTKEsterbrookSceneView_sceneBackgroundView];
  uint64_t v9 = OBJC_IVAR___NTKEsterbrookSceneView_scenePalette;
  id v10 = *(void **)&v2[OBJC_IVAR___NTKEsterbrookSceneView_scenePalette];
  int64_t v11 = *(void **)(v8 + OBJC_IVAR___NTKEsterbrookSceneBackgroundView_scenePalette);
  *(void *)(v8 + OBJC_IVAR___NTKEsterbrookSceneBackgroundView_scenePalette) = v10;
  id v12 = v10;

  sub_246AC475C();
  return objc_msgSend(*(id *)&v2[OBJC_IVAR___NTKEsterbrookSceneView_handsView], sel_applySecondHandColor_, *(void *)(*(void *)&v2[v9] + OBJC_IVAR___NTKEsterbrookScenePalette_secondHand));
}

void sub_246AA65E0(uint64_t a1, unint64_t a2)
{
  unint64_t v69 = a2;
  uint64_t v71 = a1;
  uint64_t v66 = sub_246A8604C(&qword_2691C1150);
  MEMORY[0x270FA5388](v66);
  uint64_t v67 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_246A8604C(&qword_2691C12E0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v65 = (uint64_t)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v62 = (uint64_t)&v57 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v57 - v9;
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v57 - v11;
  uint64_t v13 = type metadata accessor for Scene();
  objc_super v14 = *(void **)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v61 = (uint64_t)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v57 - v17;
  uint64_t v19 = sub_246AD8AD0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  id v22 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2691C0238 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_246A8AB74(v19, (uint64_t)qword_2691D4060);
  uint64_t v24 = *(void (**)(char *))(v20 + 16);
  uint64_t v63 = v23;
  v24(v22);
  sub_246AAB960(v71, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for Scene);
  id v25 = sub_246AD8AB0();
  os_log_type_t v26 = sub_246AD8D00();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v68 = v13;
  if (v27)
  {
    char v59 = v14;
    uint64_t v60 = v10;
    uint64_t v64 = v12;
    uint64_t v28 = v13;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    v73[0] = v58;
    *(_DWORD *)uint64_t v29 = 136315394;
    id v30 = (uint64_t *)&v18[*(int *)(v28 + 20)];
    uint64_t v31 = *v30;
    unint64_t v32 = v30[1];
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_246ACB68C(v31, v32, v73);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    sub_246AAB9DC((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for Scene);
    *(_WORD *)(v29 + 12) = 2080;
    unint64_t v33 = v69;
    if (v69 >= 3)
    {
      uint64_t v72 = v69;
      sub_246AD9070();
      __break(1u);
      return;
    }
    uint64_t v72 = sub_246ACB68C(*(void *)&aIdealizelive[8 * v69], *(void *)&aD_2[8 * v69], v73);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v25, v26, "Loading [%s] for mode [%s]", (uint8_t *)v29, 0x16u);
    uint64_t v34 = v58;
    swift_arrayDestroy();
    MEMORY[0x24C541130](v34, -1, -1);
    MEMORY[0x24C541130](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    uint64_t v13 = v68;
    id v12 = v64;
    objc_super v14 = v59;
    id v10 = v60;
  }
  else
  {
    sub_246AAB9DC((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for Scene);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    unint64_t v33 = v69;
  }
  id v35 = &v70[OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes];
  swift_beginAccess();
  uint64_t v64 = v35;
  uint64_t v36 = *(void *)v35;
  uint64_t v37 = (uint64_t)v67;
  if (*(void *)(v36 + 16) && (uint64_t v38 = sub_246ACBDC8(v33), (v39 & 1) != 0))
  {
    sub_246AAB960(*(void *)(v36 + 56) + v14[9] * v38, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for Scene);
    id v40 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v14[7];
    v40(v12, 0, 1, v13);
  }
  else
  {
    id v40 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v14[7];
    v40(v12, 1, 1, v13);
  }
  sub_246AAB960(v71, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Scene);
  v40(v10, 0, 1, v13);
  uint64_t v41 = (uint64_t)v10;
  uint64_t v42 = v37 + *(int *)(v66 + 48);
  sub_246AABB88((uint64_t)v12, v37, &qword_2691C12E0);
  sub_246AABB88(v41, v42, &qword_2691C12E0);
  uint64_t v43 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v14[6];
  if (v43(v37, 1, v13) == 1)
  {
    sub_246AABBEC(v41, &qword_2691C12E0);
    sub_246AABBEC((uint64_t)v12, &qword_2691C12E0);
    if (v43(v42, 1, v13) == 1)
    {
      sub_246AABBEC(v37, &qword_2691C12E0);
LABEL_23:
      uint64_t v54 = sub_246AD8AB0();
      os_log_type_t v55 = sub_246AD8D00();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v56 = 0;
        _os_log_impl(&dword_246A80000, v54, v55, "Scene already loaded!", v56, 2u);
        MEMORY[0x24C541130](v56, -1, -1);
      }

      return;
    }
    goto LABEL_16;
  }
  uint64_t v44 = v62;
  sub_246AABB88(v37, v62, &qword_2691C12E0);
  if (v43(v42, 1, v13) == 1)
  {
    sub_246AABBEC(v41, &qword_2691C12E0);
    sub_246AABBEC((uint64_t)v12, &qword_2691C12E0);
    sub_246AAB9DC(v44, (uint64_t (*)(void))type metadata accessor for Scene);
LABEL_16:
    sub_246AABBEC(v37, &qword_2691C1150);
    goto LABEL_17;
  }
  uint64_t v52 = v61;
  sub_246AAB894(v42, v61, (uint64_t (*)(void))type metadata accessor for Scene);
  BOOL v53 = sub_246A8A1E0(v44, v52);
  sub_246AAB9DC(v52, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246AABBEC(v41, &qword_2691C12E0);
  sub_246AABBEC((uint64_t)v12, &qword_2691C12E0);
  sub_246AAB9DC(v44, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246AABBEC(v37, &qword_2691C12E0);
  if (v53) {
    goto LABEL_23;
  }
LABEL_17:
  unint64_t v46 = v69;
  uint64_t v45 = v70;
  sub_246AA6F30(v69);
  uint64_t v47 = v71;
  uint64_t v48 = v65;
  sub_246AAB960(v71, v65, (uint64_t (*)(void))type metadata accessor for Scene);
  v40((char *)v48, 0, 1, v68);
  swift_beginAccess();
  sub_246AA4618(v48, v46);
  swift_endAccess();
  sub_246AA7F98(v47, v46);
  sub_246AA89D8(v46);
  objc_msgSend(v45, sel_setNeedsDisplay);
  if (v46 == 1 && (v70[OBJC_IVAR___NTKEsterbrookSceneView_animatingState] & 1) == 0)
  {
    objc_super v49 = sub_246AD8AB0();
    os_log_type_t v50 = sub_246AD8D00();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl(&dword_246A80000, v49, v50, "Scene loaded; displayMode=.live and animatingState=.playing, starting animation",
        v51,
        2u);
      MEMORY[0x24C541130](v51, -1, -1);
    }

    sub_246AAA270();
  }
}

id sub_246AA6F30(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246A8604C(&qword_2691C12E0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246AD8AD0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2691C0238 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_246A8AB74(v7, (uint64_t)qword_2691D4060);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  id v12 = sub_246AD8AB0();
  os_log_type_t v13 = sub_246AD8D00();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v18 = v6;
    uint64_t v19 = v2;
    objc_super v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v21[0] = v15;
    *(_DWORD *)objc_super v14 = 136315138;
    if (a1 >= 3)
    {
      uint64_t v20 = a1;
      id result = (id)sub_246AD9070();
      __break(1u);
      return result;
    }
    uint64_t v16 = v15;
    uint64_t v20 = sub_246ACB68C(*(void *)&aIdealizelive[8 * a1], *(void *)&aD_2[8 * a1], v21);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v12, v13, "Unloading scene at for mode [%s]", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v16, -1, -1);
    MEMORY[0x24C541130](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v6 = v18;
    uint64_t v2 = v19;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_246AAA8CC();
  sub_246AA7AE8(a1);
  swift_beginAccess();
  sub_246AA7288(a1, (uint64_t)v6);
  sub_246AABBEC((uint64_t)v6, &qword_2691C12E0);
  swift_endAccess();
  if (a1 == 1) {
    v2[OBJC_IVAR___NTKEsterbrookSceneView_didNotifyLiveSceneStartedPlayback] = 0;
  }
  return objc_msgSend(v2, sel_setNeedsDisplay);
}

uint64_t sub_246AA7288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_246ACBDC8(a1);
  if (v6)
  {
    unint64_t v7 = v5;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v2;
    uint64_t v19 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_246ACE69C();
      uint64_t v9 = v19;
    }
    uint64_t v10 = *(void *)(v9 + 56);
    uint64_t v11 = type metadata accessor for Scene();
    uint64_t v18 = *(void *)(v11 - 8);
    sub_246AAB894(v10 + *(void *)(v18 + 72) * v7, a2, (uint64_t (*)(void))type metadata accessor for Scene);
    sub_246ACD85C(v7, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
    id v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v13 = a2;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v16 = type metadata accessor for Scene();
    id v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v15 = v16;
    uint64_t v13 = a2;
    uint64_t v14 = 1;
  }

  return v12(v13, v14, 1, v15);
}

uint64_t sub_246AA73F4(char a1, double a2)
{
  uint64_t v4 = sub_246AD8AE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246AD8B10();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246AABC48(0, (unint64_t *)&qword_2691C1130);
  id v12 = (void *)sub_246AD8D30();
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(double *)(v14 + 24) = a2;
  if (a1)
  {
    id v22 = sub_246AABB68;
    uint64_t v23 = v14;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v19 = 1107296256;
    uint64_t v15 = &unk_26FB04498;
  }
  else
  {
    id v22 = sub_246AABCAC;
    uint64_t v23 = v14;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v19 = 1107296256;
    uint64_t v15 = &unk_26FB04448;
  }
  uint64_t v20 = sub_246AA7758;
  uint64_t v21 = v15;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_release();
  sub_246AD8AF0();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_246AABAC4(&qword_2691C1138, MEMORY[0x263F8F030]);
  sub_246A8604C(&qword_2691C1140);
  sub_246AABB0C();
  sub_246AD8DD0();
  MEMORY[0x24C540350](0, v11, v7, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_246AA7758(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_246AA779C(uint64_t a1, double a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x24C5411D0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    *(double *)(v4 + OBJC_IVAR___NTKEsterbrookSceneView_liveProgress) = a2;
    sub_246AA7808();
  }
}

id sub_246AA7808()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_tritiumContainerView);
  CLKCompressFraction();
  objc_msgSend(v1, sel_setAlpha_);
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_backgroundContainerView);
  CLKCompressFraction();
  uint64_t v4 = OBJC_IVAR___NTKEsterbrookSceneView_liveProgress;
  objc_msgSend(v2, sel_setAlpha_, (1.0 - v3) * *(double *)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_liveProgress));
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_midgroundContainerView);
  CLKCompressFraction();
  objc_msgSend(v5, sel_setAlpha_, (1.0 - v6) * *(double *)(v0 + v4));
  unint64_t v7 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_foregroundContainerView);
  CLKCompressFraction();
  objc_msgSend(v7, sel_setAlpha_, (1.0 - v8) * *(double *)(v0 + v4));
  uint64_t v9 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_forefrontContainerView);
  CLKCompressFraction();
  objc_msgSend(v9, sel_setAlpha_, (1.0 - v10) * *(double *)(v0 + v4));
  uint64_t v11 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_idealizedContainerView);
  CLKCompressFraction();
  double v13 = (1.0 - v12) * (1.0 - *(double *)(v0 + v4));

  return objc_msgSend(v11, sel_setAlpha_, v13);
}

uint64_t sub_246AA79A0(void *a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR___NTKEsterbrookSceneView_spriteViews);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(*v5 + 16) && (uint64_t v7 = sub_246ACBDC8(a2), (v8 & 1) != 0))
  {
    uint64_t v13 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
  }
  id v9 = a1;
  MEMORY[0x24C540250]();
  if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_246AD8C80();
  }
  sub_246AD8C90();
  sub_246AD8C70();
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *v5;
  *uint64_t v5 = 0x8000000000000000;
  sub_246ACDBF4(v13, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v5 = v12;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_246AA7AE8(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246AD8AD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v29[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2691C0238 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_246A8AB74(v4, (uint64_t)qword_2691D4060);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = sub_246AD8AB0();
  os_log_type_t v10 = sub_246AD8D00();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v28 = v2;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v30[0] = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    if (a1 >= 3) {
      goto LABEL_25;
    }
    uint64_t v13 = v12;
    v29[0] = sub_246ACB68C(*(void *)&aIdealizelive[8 * a1], *(void *)&aD_2[8 * a1], v30);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v9, v10, "Removing sprite views for mode [%s]", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v13, -1, -1);
    MEMORY[0x24C541130](v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v2 = v28;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v14 = (uint64_t *)(v2 + OBJC_IVAR___NTKEsterbrookSceneView_spriteViews);
  swift_beginAccess();
  uint64_t v15 = *v14;
  uint64_t v16 = MEMORY[0x263F8EE78];
  if (*(void *)(v15 + 16))
  {
    uint64_t v17 = sub_246ACBDC8(a1);
    if (v18)
    {
      unint64_t v19 = *(void *)(*(void *)(v15 + 56) + 8 * v17);
      swift_bridgeObjectRetain();
      if (v19 >> 62)
      {
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_246AD8EC0();
        swift_bridgeObjectRelease();
        if (!v20) {
          goto LABEL_21;
        }
        goto LABEL_13;
      }
    }
    else
    {
      unint64_t v19 = MEMORY[0x263F8EE78];
      if (MEMORY[0x263F8EE78] >> 62) {
        goto LABEL_20;
      }
    }
  }
  else
  {
    unint64_t v19 = MEMORY[0x263F8EE78];
    if (MEMORY[0x263F8EE78] >> 62) {
      goto LABEL_20;
    }
  }
  uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v20)
  {
LABEL_13:
    if (v20 >= 1)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if ((v19 & 0xC000000000000001) != 0) {
          id v22 = (id)MEMORY[0x24C540420](i, v19);
        }
        else {
          id v22 = *(id *)(v19 + 8 * i + 32);
        }
        uint64_t v23 = v22;
        objc_msgSend(v22, sel_removeFromSuperview);
      }
      goto LABEL_21;
    }
    __break(1u);
LABEL_25:
    v29[0] = a1;
    uint64_t result = sub_246AD9070();
    __break(1u);
    return result;
  }
LABEL_21:
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_246AA4B2C();
  os_log_type_t v26 = sub_246AA7EEC(v29, a1);
  if (*v25)
  {
    *id v25 = v16;
    swift_bridgeObjectRelease();
  }
  ((void (*)(void *, void))v26)(v29, 0);
  return ((uint64_t (*)(uint64_t *, void))v24)(v30, 0);
}

void (*sub_246AA7EEC(void *a1, uint64_t a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  void v4[4] = sub_246AAADBC(v4, a2);
  return sub_246AA7F4C;
}

void sub_246AA7F4C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_246AA7F98(uint64_t a1, unint64_t a2)
{
  uint64_t v63 = type metadata accessor for Sprite();
  uint64_t v65 = *(void *)(v63 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v63);
  uint64_t v71 = (uint64_t)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v58 - v6;
  uint64_t v8 = sub_246A8604C(&qword_2691C1118);
  uint64_t v66 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v64 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C1120);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (uint64_t *)((char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (uint64_t *)((char *)&v58 - v14);
  uint64_t v72 = type metadata accessor for SpriteAnimationAttributes();
  uint64_t v16 = MEMORY[0x270FA5388](v72);
  uint64_t v70 = (uint64_t)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v75 = (uint64_t *)((char *)&v58 - v18);
  uint64_t v73 = type metadata accessor for Scene();
  MEMORY[0x270FA5388](v73);
  unint64_t v20 = (unint64_t)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_246AD8AD0();
  unint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2691C0238 != -1) {
LABEL_25:
  }
    swift_once();
  uint64_t v25 = sub_246A8AB74(v21, (uint64_t)qword_2691D4060);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v25, v21);
  sub_246AAB960(a1, v20, (uint64_t (*)(void))type metadata accessor for Scene);
  uint64_t v26 = sub_246AD8AB0();
  uint64_t v68 = (id *)v20;
  uint64_t v27 = a1;
  uint64_t v28 = v26;
  LODWORD(v67) = sub_246AD8D00();
  BOOL v29 = os_log_type_enabled(v28, (os_log_type_t)v67);
  uint64_t v76 = v15;
  uint64_t v69 = v27;
  if (v29)
  {
    unint64_t v60 = v22;
    os_log_t v59 = v28;
    uint64_t v61 = v24;
    uint64_t v62 = (id *)v21;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v78[0] = v31;
    *(_DWORD *)uint64_t v30 = 136315394;
    uint64_t v58 = v30 + 4;
    uint64_t v32 = (uint64_t)v68;
    unint64_t v33 = (uint64_t *)((char *)v68 + *(int *)(v73 + 20));
    uint64_t v35 = *v33;
    unint64_t v34 = v33[1];
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_246ACB68C(v35, v34, v78);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    sub_246AAB9DC(v32, (uint64_t (*)(void))type metadata accessor for Scene);
    *(_WORD *)(v30 + 12) = 2080;
    if (a2 >= 3)
    {
LABEL_27:
      uint64_t v77 = a2;
      sub_246AD9070();
      __break(1u);
      JUMPOUT(0x246AA89C8);
    }
    uint64_t v77 = sub_246ACB68C(*(void *)&aIdealizelive[8 * a2], *(void *)&aD_2[8 * a2], v78);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    os_log_t v36 = v59;
    _os_log_impl(&dword_246A80000, v59, (os_log_type_t)v67, "Loading sprite views of scene [%s] for mode [%s]", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v31, -1, -1);
    MEMORY[0x24C541130](v30, -1, -1);

    (*(void (**)(char *, id *))(v60 + 8))(v61, v62);
    uint64_t v15 = v76;
  }
  else
  {
    sub_246AAB9DC((uint64_t)v68, (uint64_t (*)(void))type metadata accessor for Scene);

    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  uint64_t v37 = v73;
  uint64_t v21 = v69;
  uint64_t v38 = (uint64_t *)(v69 + *(int *)(v73 + 20));
  uint64_t v39 = *v38;
  uint64_t v24 = (char *)v38[1];
  id v40 = v75;
  sub_246AAB960(v69 + *(int *)(v73 + 36), (uint64_t)v75 + *(int *)(v72 + 20), type metadata accessor for Timeline);
  a1 = *(void *)(v21 + *(int *)(v37 + 24));
  *id v40 = v39;
  v40[1] = v24;
  unint64_t v22 = *(void *)(a1 + 16);
  uint64_t v69 = OBJC_IVAR___NTKEsterbrookSceneView_showSpriteDebugHelpers;
  uint64_t v67 = (id *)&v74[OBJC_IVAR___NTKEsterbrookSceneView_tritiumContainerView];
  uint64_t v61 = &v74[OBJC_IVAR___NTKEsterbrookSceneView_forefrontContainerView];
  unint64_t v60 = (unint64_t)&v74[OBJC_IVAR___NTKEsterbrookSceneView_foregroundContainerView];
  os_log_t v59 = (os_log_t)&v74[OBJC_IVAR___NTKEsterbrookSceneView_midgroundContainerView];
  uint64_t v62 = (id *)&v74[OBJC_IVAR___NTKEsterbrookSceneView_backgroundContainerView];
  uint64_t v68 = (id *)&v74[OBJC_IVAR___NTKEsterbrookSceneView_idealizedContainerView];
  uint64_t v72 = v66 + 48;
  uint64_t v73 = v66 + 56;
  swift_bridgeObjectRetain();
  uint64_t v66 = a1;
  swift_bridgeObjectRetain();
  unint64_t v20 = 0;
  while (1)
  {
    if (v20 == v22)
    {
      uint64_t v43 = 1;
      unint64_t v20 = v22;
    }
    else
    {
      if (v20 >= *(void *)(v66 + 16))
      {
        __break(1u);
        goto LABEL_25;
      }
      uint64_t v44 = (uint64_t)&v64[*(int *)(v8 + 48)];
      sub_246AAB960(v66+ ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80))+ *(void *)(v65 + 72) * v20, v44, (uint64_t (*)(void))type metadata accessor for Sprite);
      uint64_t v45 = (uint64_t)v13 + *(int *)(v8 + 48);
      *uint64_t v13 = v20;
      sub_246AAB894(v44, v45, (uint64_t (*)(void))type metadata accessor for Sprite);
      uint64_t v43 = 0;
      ++v20;
      uint64_t v15 = v76;
    }
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))v73)(v13, v43, 1, v8);
    sub_246AAB8FC((uint64_t)v13, (uint64_t)v15, &qword_2691C1120);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))v72)(v15, 1, v8) == 1) {
      break;
    }
    uint64_t v21 = (uint64_t)v13;
    a1 = a2;
    uint64_t v46 = *v15;
    uint64_t v47 = v8;
    sub_246AAB894((uint64_t)v15 + *(int *)(v8 + 48), (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Sprite);
    uint64_t v48 = v7;
    uint64_t v49 = v71;
    sub_246AAB960((uint64_t)v7, v71, (uint64_t (*)(void))type metadata accessor for Sprite);
    uint64_t v50 = v70;
    sub_246AAB960((uint64_t)v75, v70, (uint64_t (*)(void))type metadata accessor for SpriteAnimationAttributes);
    id v51 = objc_allocWithZone((Class)type metadata accessor for SpriteView());
    uint64_t v52 = sub_246AC4FC4(v49, v50);
    BOOL v53 = &v52[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debug_labelPositioning];
    *(void *)BOOL v53 = v46;
    *((void *)v53 + 1) = v22;
    uint64_t v54 = *(void **)&v52[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel];
    if (v54)
    {
      id v55 = v54;
      objc_msgSend(v52, sel_bounds);
      objc_msgSend(v52, sel_bounds);
      objc_msgSend(v55, sel_setFrame_, sub_246AAB9C8());
    }
    uint64_t v56 = v74;
    v52[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_showDebugHelpers] = v74[v69];
    sub_246AC49E4();
    a2 = a1;
    uint64_t v24 = v56;
    sub_246AA79A0(v52, a1);
    uint64_t v42 = v68;
    uint64_t v7 = v48;
    uint64_t v8 = v47;
    uint64_t v13 = (void *)v21;
    if (a1)
    {
      uint64_t v42 = v67;
      if (a1 != 2)
      {
        if (a1 != 1)
        {
          sub_246A8604C(&qword_2691C1128);
          sub_246AD9050();
          __break(1u);
          goto LABEL_27;
        }
        uint64_t v42 = v62;
        switch(v7[*(int *)(v63 + 24)])
        {
          case 1:
            uint64_t v41 = &v80;
            goto LABEL_8;
          case 2:
            uint64_t v41 = &v79;
            goto LABEL_8;
          case 3:
            break;
          default:
            uint64_t v41 = &v81;
LABEL_8:
            uint64_t v42 = (id *)*(v41 - 32);
            break;
        }
      }
    }
    objc_msgSend(*v42, sel_addSubview_, v52);

    sub_246AAB9DC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Sprite);
    uint64_t v15 = v76;
  }
  swift_bridgeObjectRelease();
  return sub_246AAB9DC((uint64_t)v75, (uint64_t (*)(void))type metadata accessor for SpriteAnimationAttributes);
}

uint64_t sub_246AA89D8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246A8604C(&qword_2691C12E0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v71 = (uint64_t)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246AD8AD0();
  uint64_t v7 = *(char **)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = type metadata accessor for SceneLayoutAttributes(0);
  uint64_t v10 = MEMORY[0x270FA5388](v70);
  uint64_t v69 = (uint64_t)v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v62 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v62 - v15;
  CGFloat v80 = *(double *)&a1;
  sub_246AA9484(a1, (void *)((char *)v62 - v15));
  uint64_t v17 = &v2[OBJC_IVAR___NTKEsterbrookSceneView_spriteViews];
  swift_beginAccess();
  uint64_t v18 = *(void *)v17;
  if (*(void *)(v18 + 16) && (uint64_t v19 = sub_246ACBDC8(*(void *)&v80), (v20 & 1) != 0))
  {
    unint64_t v21 = *(void *)(*(void *)(v18 + 56) + 8 * v19);
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v21 = MEMORY[0x263F8EE78];
  }
  if (v21 >> 62)
  {
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_246AD8EC0();
    swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_7;
    }
LABEL_35:
    swift_bridgeObjectRelease();
    return sub_246AAB9DC((uint64_t)v16, type metadata accessor for SceneLayoutAttributes);
  }
  uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v22) {
    goto LABEL_35;
  }
LABEL_7:
  unint64_t v83 = v21 & 0xC000000000000001;
  uint64_t v64 = &v2[OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes];
  swift_beginAccess();
  uint64_t v77 = (void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v76 = (void (**)(char *, uint64_t))(v7 + 8);
  p_b = &v86.b;
  uint64_t v23 = 4;
  *(void *)&long long v24 = 136315906;
  long long v63 = v24;
  v62[1] = MEMORY[0x263F8EE58] + 8;
  uint64_t v67 = v6;
  uint64_t v68 = v2;
  uint64_t v66 = v9;
  uint64_t v65 = v16;
  unint64_t v78 = v21;
  uint64_t v82 = v22;
  while (1)
  {
    if (v83) {
      uint64_t v25 = (char *)MEMORY[0x24C540420](v23 - 4, v21);
    }
    else {
      uint64_t v25 = (char *)*(id *)(v21 + 8 * v23);
    }
    uint64_t v7 = v25;
    uint64_t v26 = v23 - 3;
    if (__OFADD__(v23 - 4, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (*(void *)&v25[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer])
    {
      uint64_t v84 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_needsInitialLayout;
      if (v25[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_needsInitialLayout]) {
        break;
      }
      uint64_t v27 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite;
      if ((*(void *)&v25[*(int *)(type metadata accessor for Sprite() + 28) + 24 + v27] & 0x8000000000000000) != 0) {
        break;
      }
    }
LABEL_9:

    ++v23;
    if (v26 == v82) {
      goto LABEL_35;
    }
  }
  uint64_t v81 = v23 - 3;
  if (qword_2691C0238 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_246A8AB74(v6, (uint64_t)qword_2691D4060);
  (*v77)(v9, v28, v6);
  sub_246AAB960((uint64_t)v16, (uint64_t)v14, type metadata accessor for SceneLayoutAttributes);
  BOOL v29 = v2;
  uint64_t v30 = v2;
  uint64_t v31 = v7;
  uint64_t v32 = sub_246AD8AB0();
  int v79 = sub_246AD8D00();
  if (!os_log_type_enabled(v32, (os_log_type_t)v79))
  {

    sub_246AAB9DC((uint64_t)v14, type metadata accessor for SceneLayoutAttributes);
    (*v76)(v9, v6);
    uint64_t v2 = v29;
    uint64_t v26 = v81;
LABEL_30:
    uint64_t v58 = (uint64_t)&v31[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite];
    objc_msgSend(v31, sel_bounds);
    sub_246AAB0AC(v58, (uint64_t)v16, (uint64_t)v87, v59, v60, 0.3, 0.77);
    objc_msgSend(v31, sel_setCenter_, v88, v89);
    if ((v91 & 1) == 0 && v90 != 0.0)
    {
      CGAffineTransformMakeRotation(&v86, v90);
      objc_msgSend(v31, sel_setTransform_, &v86);
    }
    v7[v84] = 0;
    unint64_t v21 = v78;
    goto LABEL_9;
  }
  uint64_t v72 = v30;
  os_log_t v74 = v32;
  uint64_t v33 = swift_slowAlloc();
  uint64_t v73 = swift_slowAlloc();
  uint64_t v85 = v73;
  *(_DWORD *)uint64_t v33 = v63;
  uint64_t v34 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite;
  uint64_t v35 = (uint64_t *)&v31[*(int *)(type metadata accessor for Sprite() + 20) + v34];
  uint64_t v36 = *v35;
  unint64_t v37 = v35[1];
  swift_bridgeObjectRetain();
  *(void *)&v86.a = sub_246ACB68C(v36, v37, &v85);
  sub_246AD8D90();

  swift_bridgeObjectRelease();
  *(_WORD *)(v33 + 12) = 2080;
  uint64_t v38 = *(void *)v64;
  if (*(void *)(*(void *)v64 + 16))
  {
    uint64_t v39 = sub_246ACBDC8(*(void *)&v80);
    uint64_t v26 = v81;
    if (v40)
    {
      uint64_t v41 = v39;
      v62[0] = *(void *)(v38 + 56);
      uint64_t v42 = type metadata accessor for Scene();
      uint64_t v43 = *(void *)(v42 - 8);
      uint64_t v44 = v62[0] + *(void *)(v43 + 72) * v41;
      uint64_t v45 = v71;
      sub_246AAB960(v44, v71, (uint64_t (*)(void))type metadata accessor for Scene);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v45, 0, 1, v42);
    }
    else
    {
      uint64_t v42 = type metadata accessor for Scene();
      uint64_t v45 = v71;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v71, 1, 1, v42);
    }
  }
  else
  {
    uint64_t v42 = type metadata accessor for Scene();
    uint64_t v45 = v71;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v71, 1, 1, v42);
    uint64_t v26 = v81;
  }
  type metadata accessor for Scene();
  int v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 48))(v45, 1, v42);
  CGFloat v47 = 0.0;
  uint64_t v48 = v45;
  CGFloat v49 = 0.0;
  if (!v46)
  {
    uint64_t v50 = (CGFloat *)(v48 + *(int *)(v42 + 20));
    CGFloat v47 = *v50;
    CGFloat v49 = v50[1];
    swift_bridgeObjectRetain();
  }
  sub_246AABBEC(v48, &qword_2691C12E0);
  v86.a = v47;
  v86.b = v49;
  sub_246A8604C(&qword_2691C10F8);
  uint64_t v51 = sub_246AD8BD0();
  *(void *)&v86.a = sub_246ACB68C(v51, v52, &v85);
  sub_246AD8D90();
  BOOL v53 = v72;

  swift_bridgeObjectRelease();
  *(_WORD *)(v33 + 22) = 2080;
  if (*(void *)&v80 < 3uLL)
  {
    *(void *)&v86.a = sub_246ACB68C(*(void *)&aIdealizelive[8 * *(void *)&v80], *(void *)&aD_2[8 * *(void *)&v80], &v85);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 32) = 2080;
    sub_246AAB960((uint64_t)v14, v69, type metadata accessor for SceneLayoutAttributes);
    uint64_t v54 = sub_246AD8BD0();
    *(void *)&v86.a = sub_246ACB68C(v54, v55, &v85);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    sub_246AAB9DC((uint64_t)v14, type metadata accessor for SceneLayoutAttributes);
    os_log_t v56 = v74;
    _os_log_impl(&dword_246A80000, v74, (os_log_type_t)v79, "Laying out spriteView for [%s] of scene [%s] for mode [%s] with [%s].", (uint8_t *)v33, 0x2Au);
    uint64_t v57 = v73;
    swift_arrayDestroy();
    MEMORY[0x24C541130](v57, -1, -1);
    MEMORY[0x24C541130](v33, -1, -1);

    uint64_t v9 = v66;
    uint64_t v6 = v67;
    (*v76)(v66, v67);
    uint64_t v2 = v68;
    uint64_t v16 = v65;
    goto LABEL_30;
  }
  v86.a = v80;
  uint64_t result = sub_246AD9070();
  __break(1u);
  return result;
}

id sub_246AA9484@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for TimeAttributes(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v76 = (unint64_t *)((char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_246A8604C((uint64_t *)&unk_2691C12C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v77 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246AD8980();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int v79 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v78 = (char *)&v72 - v13;
  uint64_t v14 = type metadata accessor for TimeRule();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_246A8604C(&qword_2691C12E0);
  MEMORY[0x270FA5388](v18 - 8);
  char v20 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_246A8604C(&qword_2691C1108);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v75 = v15;
  uint64_t v23 = *(void (**)(void))(v15 + 56);
  uint64_t v81 = (uint64_t)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_t v74 = v23;
  v23();
  CGFloat v80 = v2;
  long long v24 = (uint64_t *)&v2[OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes];
  swift_beginAccess();
  uint64_t v25 = *v24;
  if (*(void *)(v25 + 16) && (uint64_t v26 = sub_246ACBDC8(a1), (v27 & 1) != 0))
  {
    uint64_t v28 = v26;
    uint64_t v72 = v10;
    uint64_t v29 = v9;
    uint64_t v30 = *(void *)(v25 + 56);
    uint64_t v31 = type metadata accessor for Scene();
    uint64_t v32 = *(void *)(v31 - 8);
    uint64_t v73 = a2;
    uint64_t v33 = v32;
    uint64_t v34 = v30 + *(void *)(v32 + 72) * v28;
    uint64_t v9 = v29;
    uint64_t v10 = v72;
    sub_246AAB960(v34, (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for Scene);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v20, 0, 1, v31);
    a2 = v73;
  }
  else
  {
    uint64_t v31 = type metadata accessor for Scene();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v20, 1, 1, v31);
  }
  type metadata accessor for Scene();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 48))(v20, 1, v31))
  {
    sub_246AABBEC((uint64_t)v20, &qword_2691C12E0);
  }
  else
  {
    uint64_t v35 = *(void *)&v20[*(int *)(v31 + 28)];
    swift_bridgeObjectRetain();
    sub_246AABBEC((uint64_t)v20, &qword_2691C12E0);
    uint64_t v36 = *(void *)(v35 + 16);
    if (v36)
    {
      uint64_t v73 = (void *)v9;
      uint64_t v37 = v35 + ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80));
      uint64_t v38 = *(void *)(v75 + 72);
      while (1)
      {
        sub_246AAB960(v37, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TimeRule);
        if (v17[*(int *)(v14 + 24) + 16] <= 0x1Fu) {
          break;
        }
        sub_246AAB9DC((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TimeRule);
        v37 += v38;
        if (!--v36)
        {
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v39 = v81;
      sub_246AABBEC(v81, &qword_2691C1108);
      sub_246AAB894((uint64_t)v17, v39, (uint64_t (*)(void))type metadata accessor for TimeRule);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v74)(v39, 0, 1, v14);
LABEL_14:
      uint64_t v9 = (uint64_t)v73;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  char v40 = v80;
  uint64_t v41 = (uint64_t)v79;
  uint64_t v42 = v78;
  if (qword_2691C02A8 != -1) {
    swift_once();
  }
  id v43 = objc_msgSend(self, sel_sharedManager);
  if (!v43)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v44 = v43;
  id v45 = objc_msgSend(v43, sel_faceDisplayTime);

  if (!v45)
  {
LABEL_24:
    id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v77, 1, 1, v9);
    goto LABEL_25;
  }
  sub_246AD8970();

  int v46 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 32);
  CGFloat v47 = v77;
  v46(v77, v41, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v47, 0, 1, v9);
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v47, 1, v9);
  if (result == 1)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v46(v42, (uint64_t)v47, v9);
  objc_msgSend(v40, sel_bounds);
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  sub_246A8604C(&qword_2691C1110);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246ADE980;
  *(unsigned char *)(inited + 32) = 0;
  uint64_t v58 = OBJC_IVAR___NTKEsterbrookSceneView_handsView;
  id result = objc_msgSend(*(id *)&v40[OBJC_IVAR___NTKEsterbrookSceneView_handsView], sel_hourHandView);
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  double v59 = result;
  sub_246AD6790();
  uint64_t v61 = v60;
  uint64_t v63 = v62;

  *(void *)(inited + 40) = v61;
  *(void *)(inited + 48) = v63;
  *(unsigned char *)(inited + 56) = 1;
  id result = objc_msgSend(*(id *)&v40[v58], sel_minuteHandView);
  if (result)
  {
    uint64_t v64 = result;
    sub_246AD6790();
    uint64_t v66 = v65;
    uint64_t v68 = v67;

    *(void *)(inited + 64) = v66;
    *(void *)(inited + 72) = v68;
    unint64_t v69 = sub_246ACF414(inited);
    swift_setDeallocating();
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v41, v42, v9);
    uint64_t v70 = v76;
    sub_246AD68A0(v41, v76);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v42, v9);
    *a2 = v50;
    a2[1] = v52;
    a2[2] = v54;
    a2[3] = v56;
    a2[4] = v69;
    uint64_t v71 = type metadata accessor for SceneLayoutAttributes(0);
    sub_246AAB894((uint64_t)v70, (uint64_t)a2 + *(int *)(v71 + 24), type metadata accessor for TimeAttributes);
    return (id)sub_246AAB8FC(v81, (uint64_t)a2 + *(int *)(v71 + 28), &qword_2691C1108);
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_246AA9CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 1)
  {
    uint64_t v11 = OBJC_IVAR___NTKEsterbrookSceneView_didNotifyLiveSceneStartedPlayback;
    if ((*(unsigned char *)(v3 + OBJC_IVAR___NTKEsterbrookSceneView_didNotifyLiveSceneStartedPlayback) & 1) == 0)
    {
      if (qword_2691C0238 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_246AD8AD0();
      sub_246A8AB74(v12, (uint64_t)qword_2691D4060);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
      uint64_t v13 = sub_246AD8AB0();
      os_log_type_t v14 = sub_246AD8D00();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        uint64_t v22 = v20;
        *(_DWORD *)uint64_t v15 = 136315138;
        uint64_t v19 = v15 + 4;
        sub_246AABAC4(&qword_2691C1100, MEMORY[0x263F07508]);
        uint64_t v16 = sub_246AD9030();
        uint64_t v21 = sub_246ACB68C(v16, v17, &v22);
        sub_246AD8D90();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
        _os_log_impl(&dword_246A80000, v13, v14, "Notifying started playback for scene:[%s]", v15, 0xCu);
        uint64_t v18 = v20;
        swift_arrayDestroy();
        MEMORY[0x24C541130](v18, -1, -1);
        MEMORY[0x24C541130](v15, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      }

      *(unsigned char *)(v3 + v11) = 1;
      uint64_t result = MEMORY[0x24C5411D0](v3 + OBJC_IVAR___NTKEsterbrookSceneView_delegate);
      if (result) {
        return swift_unknownObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_246AA9FC8(char a1)
{
  int v2 = a1 & 1;
  uint64_t v3 = sub_246AD8AD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (((v2 == 0) ^ *(unsigned __int8 *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_animatingState)))
  {
    if (qword_2691C0238 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_246A8AB74(v3, (uint64_t)qword_2691D4060);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
    uint64_t v8 = sub_246AD8AB0();
    os_log_type_t v9 = sub_246AD8D00();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v16 = v11;
      if (v2) {
        uint64_t v12 = 0x646573756170;
      }
      else {
        uint64_t v12 = 0x676E6979616C70;
      }
      if (v2) {
        unint64_t v13 = 0xE600000000000000;
      }
      else {
        unint64_t v13 = 0xE700000000000000;
      }
      uint64_t v15 = sub_246ACB68C(v12, v13, &v16);
      sub_246AD8D90();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_246A80000, v8, v9, "AnimatingState is already [%s]; don't do anything.", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C541130](v11, -1, -1);
      MEMORY[0x24C541130](v10, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    *(unsigned char *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_animatingState) = v2;
    return sub_246AA4878();
  }
}

void sub_246AAA270()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Scene();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  os_log_type_t v9 = (char *)&v47 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v47 - v10;
  uint64_t v12 = (uint64_t *)(v0 + OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes);
  swift_beginAccess();
  uint64_t v13 = *v12;
  if (!*(void *)(v13 + 16) || (uint64_t v14 = sub_246ACBDC8(1), (v15 & 1) == 0))
  {
    if (qword_2691C0238 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_246AD8AD0();
    sub_246A8AB74(v21, (uint64_t)qword_2691D4060);
    uint64_t v22 = sub_246AD8AB0();
    os_log_type_t v23 = sub_246AD8D00();
    if (os_log_type_enabled(v22, v23))
    {
      long long v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v24 = 0;
      _os_log_impl(&dword_246A80000, v22, v23, "Tried to start animation but no scene loaded.", v24, 2u);
      MEMORY[0x24C541130](v24, -1, -1);
    }

    return;
  }
  sub_246AAB960(*(void *)(v13 + 56) + *(void *)(v3 + 72) * v14, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Scene);
  sub_246AAB894((uint64_t)v9, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for Scene);
  uint64_t v16 = (uint64_t *)(v1 + OBJC_IVAR___NTKEsterbrookSceneView_spriteViews);
  swift_beginAccess();
  uint64_t v17 = *v16;
  if (*(void *)(*v16 + 16) && (uint64_t v18 = sub_246ACBDC8(1), (v19 & 1) != 0))
  {
    unint64_t v20 = *(void *)(*(void *)(v17 + 56) + 8 * v18);
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v20 = MEMORY[0x263F8EE78];
  }
  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_246AD8EC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v25)
  {
    if (qword_2691C0238 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_246AD8AD0();
    sub_246A8AB74(v34, (uint64_t)qword_2691D4060);
    uint64_t v35 = sub_246AD8AB0();
    os_log_type_t v36 = sub_246AD8D00();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_246A80000, v35, v36, "Tried to start animation but no spriteViews available for scene.", v37, 2u);
      MEMORY[0x24C541130](v37, -1, -1);
    }

    goto LABEL_39;
  }
  if (qword_2691C0238 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_246AD8AD0();
  sub_246A8AB74(v26, (uint64_t)qword_2691D4060);
  sub_246AAB960((uint64_t)v11, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Scene);
  char v27 = sub_246AD8AB0();
  os_log_type_t v28 = sub_246AD8D00();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v48 = v16;
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136315138;
    uint64_t v50 = v30;
    CGFloat v47 = v29 + 4;
    uint64_t v31 = (uint64_t *)&v6[*(int *)(v2 + 20)];
    uint64_t v33 = *v31;
    unint64_t v32 = v31[1];
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_246ACB68C(v33, v32, &v50);
    sub_246AD8D90();
    uint64_t v16 = v48;
    swift_bridgeObjectRelease();
    sub_246AAB9DC((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Scene);
    _os_log_impl(&dword_246A80000, v27, v28, "Starting live animation for scene [%s].", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v30, -1, -1);
    MEMORY[0x24C541130](v29, -1, -1);
  }
  else
  {
    sub_246AAB9DC((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Scene);
  }

  sub_246AA89D8(1);
  uint64_t v38 = *v16;
  if (*(void *)(*v16 + 16) && (uint64_t v39 = sub_246ACBDC8(1), (v40 & 1) != 0))
  {
    unint64_t v41 = *(void *)(*(void *)(v38 + 56) + 8 * v39);
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v41 = MEMORY[0x263F8EE78];
  }
  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_246AD8EC0();
    swift_bridgeObjectRelease();
    if (v42) {
      goto LABEL_31;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    sub_246AA9CF0(1, (uint64_t)v11);
LABEL_39:
    sub_246AAB9DC((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for Scene);
    return;
  }
  uint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v42) {
    goto LABEL_38;
  }
LABEL_31:
  if (v42 >= 1)
  {
    if ((v41 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        uint64_t v44 = MEMORY[0x24C540420](i, v41);
        *(unsigned char *)(v44 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_state) = 0;
        swift_unknownObjectRelease();
      }
    }
    else
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        uint64_t v46 = *(void *)(v41 + 8 * j + 32);
        *(unsigned char *)(v46 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_state) = 0;
      }
    }
    goto LABEL_38;
  }
  __break(1u);
}

uint64_t sub_246AAA8CC()
{
  uint64_t v1 = sub_246A8604C(&qword_2691C12E0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2691C0238 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_246AD8AD0();
  sub_246A8AB74(v4, (uint64_t)qword_2691D4060);
  uint64_t v5 = v0;
  uint64_t v6 = sub_246AD8AB0();
  os_log_type_t v7 = sub_246AD8D00();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v33 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = &v5[OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes];
    swift_beginAccess();
    uint64_t v11 = *(void *)v10;
    if (*(void *)(v11 + 16) && (uint64_t v12 = sub_246ACBDC8(1), (v13 & 1) != 0))
    {
      uint64_t v14 = v12;
      uint64_t v32 = *(void *)(v11 + 56);
      uint64_t v15 = type metadata accessor for Scene();
      uint64_t v16 = *(void *)(v15 - 8);
      sub_246AAB960(v32 + *(void *)(v16 + 72) * v14, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for Scene);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v3, 0, 1, v15);
    }
    else
    {
      uint64_t v15 = type metadata accessor for Scene();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v3, 1, 1, v15);
    }
    type metadata accessor for Scene();
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v3, 1, v15))
    {
      char v19 = (uint64_t *)&v3[*(int *)(v15 + 20)];
      uint64_t v17 = *v19;
      uint64_t v18 = v19[1];
      swift_bridgeObjectRetain();
    }
    sub_246AABBEC((uint64_t)v3, &qword_2691C12E0);
    uint64_t v34 = v17;
    uint64_t v35 = v18;
    sub_246A8604C(&qword_2691C10F8);
    uint64_t v20 = sub_246AD8BD0();
    uint64_t v34 = sub_246ACB68C(v20, v21, &v33);
    sub_246AD8D90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v6, v7, "Pausing live animation for scene [%s].", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v9, -1, -1);
    MEMORY[0x24C541130](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v22 = &v5[OBJC_IVAR___NTKEsterbrookSceneView_spriteViews];
  uint64_t result = swift_beginAccess();
  uint64_t v24 = *(void *)v22;
  if (*(void *)(*(void *)v22 + 16) && (uint64_t result = sub_246ACBDC8(1), (v25 & 1) != 0))
  {
    unint64_t v26 = *(void *)(*(void *)(v24 + 56) + 8 * result);
    uint64_t result = swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v26 = MEMORY[0x263F8EE78];
  }
  if (!(v26 >> 62))
  {
    uint64_t v27 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v27) {
      goto LABEL_18;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_246AD8EC0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v27) {
    return swift_bridgeObjectRelease();
  }
LABEL_18:
  if (v27 >= 1)
  {
    if ((v26 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        uint64_t v29 = MEMORY[0x24C540420](i, v26);
        *(unsigned char *)(v29 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_state) = 1;
        swift_unknownObjectRelease();
      }
    }
    else
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        uint64_t v31 = *(void *)(v26 + 8 * j + 32);
        *(unsigned char *)(v31 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_state) = 1;
      }
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SceneView()
{
  return self;
}

void (*sub_246AAADBC(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x50uLL);
  *a1 = v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v4[8] = sub_246AAB070(v4);
  v4[9] = sub_246AAAEAC(v4 + 4, a2, isUniquelyReferenced_nonNull_native);
  return sub_246AAAE4C;
}

void sub_246AAAE4C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 72))();
  v2(v1, 0);

  free(v1);
}

void (*sub_246AAAEAC(void *a1, uint64_t a2, char a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[1] = a2;
  _OWORD v8[2] = v3;
  uint64_t v9 = *v3;
  uint64_t v11 = sub_246ACBDC8(a2);
  *((unsigned char *)v8 + 32) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    char v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*(void *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *uint64_t v8 = v17;
        return sub_246AAAFDC;
      }
LABEL_11:
      uint64_t v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_246ACE4F8();
      goto LABEL_7;
    }
    sub_246ACC8A8(v14, a3 & 1);
    uint64_t v18 = sub_246ACBDC8(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      uint64_t v11 = v18;
      v8[3] = v18;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_246AD90A0();
  __break(1u);
  return result;
}

void sub_246AAAFDC(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  char v3 = *((unsigned char *)*a1 + 32);
  if (v2)
  {
    unint64_t v4 = v1[3];
    uint64_t v5 = *(void **)v1[2];
    if (v3) {
      *(void *)(v5[7] + 8 * v4) = v2;
    }
    else {
      sub_246ACE1AC(v4, v1[1], v2, v5);
    }
  }
  else if ((*a1)[4])
  {
    sub_246ACD6A0(v1[3], *(void *)v1[2]);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t (*sub_246AAB070(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_246AAB0A0;
}

uint64_t sub_246AAB0A0(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_246AAB0AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v14 = sub_246A8604C(&qword_2691C1108);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v100 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for Sprite();
  uint64_t v106 = v17;
  v107 = &off_26FB05C00;
  uint64_t v18 = sub_246AAB814(v105);
  sub_246AAB960(a1, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for Sprite);
  char v19 = (double *)((char *)sub_246A8A6E4(v105, v106) + *(int *)(v17 + 28));
  double v20 = *v19;
  double v21 = v19[1];
  double v23 = v19[2];
  unint64_t v22 = *((void *)v19 + 3);
  uint64_t v24 = *((void *)v19 + 4);
  switch(v22 >> 62)
  {
    case 1uLL:
      double v27 = sub_246AAE01C(*(void *)v19, (CGFloat *)a2, a6, a7);
      CGFloat v29 = v28;
      CGFloat v103 = v30;
      CGFloat v104 = v31;
      double v32 = a4 * 0.5;
      double v101 = a5 * 0.5;
      double v33 = sub_246AAB878(*(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24), a5, a4 * 0.5);
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v102 = v29;
      switch(BYTE1(v20))
      {
        case 1:
          v110.origin.x = v27;
          v110.origin.y = v29;
          CGFloat v89 = v103;
          v110.size.height = v104;
          v110.size.width = v103;
          double MidX = CGRectGetMidX(v110);
          v111.origin.x = v27;
          v111.origin.y = v102;
          v111.size.width = v89;
          v111.size.height = v104;
          double MinY = CGRectGetMaxY(v111) + a5;
          break;
        case 2:
          v112.origin.x = v27;
          v112.origin.y = v29;
          CGFloat v91 = v103;
          CGFloat v90 = v104;
          v112.size.width = v103;
          v112.size.height = v104;
          double MidX = CGRectGetMinX(v112) - v32;
          goto LABEL_49;
        case 3:
          v113.origin.x = v27;
          v113.origin.y = v29;
          CGFloat v91 = v103;
          CGFloat v90 = v104;
          v113.size.width = v103;
          v113.size.height = v104;
          double MidX = v32 + CGRectGetMaxX(v113);
          goto LABEL_49;
        case 4:
          v114.origin.x = v27;
          v114.origin.y = v29;
          CGFloat v91 = v103;
          CGFloat v90 = v104;
          v114.size.width = v103;
          v114.size.height = v104;
          double MidX = CGRectGetMidX(v114);
LABEL_49:
          v115.origin.x = v27;
          v115.origin.y = v102;
          v115.size.width = v91;
          v115.size.height = v90;
          double MinY = v101 + CGRectGetMidY(v115);
          break;
        default:
          v108.origin.x = v27;
          v108.origin.y = v29;
          CGFloat v41 = v103;
          CGFloat v40 = v104;
          v108.size.width = v103;
          v108.size.height = v104;
          double MidX = CGRectGetMidX(v108);
          v109.origin.x = v27;
          v109.origin.y = v102;
          v109.size.width = v41;
          v109.size.height = v40;
          double MinY = CGRectGetMinY(v109);
          break;
      }
      v116.origin.x = v33;
      v116.origin.y = v35;
      v116.size.width = v37;
      v116.size.height = v39;
      double MinX = CGRectGetMinX(v116);
      v117.origin.x = v33;
      v117.origin.y = v35;
      v117.size.width = v37;
      v117.size.height = v39;
      double MaxX = CGRectGetMaxX(v117);
      if (MaxX >= MidX) {
        double MaxX = MidX;
      }
      if (MinX > MaxX) {
        double v25 = MinX;
      }
      else {
        double v25 = MaxX;
      }
      v118.origin.x = v33;
      v118.origin.y = v35;
      v118.size.width = v37;
      v118.size.height = v39;
      double v94 = CGRectGetMinY(v118);
      v119.origin.x = v33;
      v119.origin.y = v35;
      v119.size.width = v37;
      v119.size.height = v39;
      double MaxY = CGRectGetMaxY(v119);
      if (MaxY >= MinY) {
        double MaxY = MinY;
      }
      if (v94 > MaxY) {
        double v26 = v94;
      }
      else {
        double v26 = MaxY;
      }
      goto LABEL_60;
    case 2uLL:
      char v44 = LOBYTE(v20) & 1;
      double v45 = MEMORY[0x24C540930](*(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
      double v47 = v46;
      uint64_t v48 = *(void *)(a2 + 32);
      if (*(void *)(v48 + 16) && (unint64_t v49 = sub_246ACBEF0(v44), (v50 & 1) != 0))
      {
        uint64_t v51 = (double *)(*(void *)(v48 + 56) + 16 * v49);
        uint64_t v52 = v51 + 1;
      }
      else
      {
        uint64_t v51 = (double *)&qword_2691D41D0;
        uint64_t v52 = (double *)&qword_2691D41D8;
        if (qword_2691C02B0 != -1) {
          swift_once();
        }
      }
      double v60 = *v52;
      double v61 = *v51;
      uint64_t v62 = type metadata accessor for SceneLayoutAttributes(0);
      uint64_t v63 = *(void *)(a2 + *(int *)(v62 + 24));
      double v64 = 0.0;
      if (*(void *)(v63 + 16))
      {
        unint64_t v65 = sub_246ACBEF0(v44);
        if (v66) {
          double v64 = *(double *)(*(void *)(v63 + 56) + 8 * v65);
        }
      }
      if (v22)
      {
        double v68 = dbl_246AE1488[*(void *)&v21];
        double v67 = 0.5;
      }
      else
      {
        double v67 = v21;
        double v68 = v23;
      }
      double v75 = v61 * v68;
      __double2 v76 = __sincos_stret(1.57079633 - v64);
      double v77 = v45 + v76.__cosval * v75;
      double v78 = v47 - v76.__sinval * v75;
      double v79 = 0.0;
      switch(BYTE2(v22))
      {
        case 2u:
          goto LABEL_65;
        case 3u:
          goto LABEL_63;
        case 4u:
          sub_246AABB88(a2 + *(int *)(v62 + 28), (uint64_t)v16, &qword_2691C1108);
          uint64_t v80 = type metadata accessor for TimeRule();
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v80 - 8) + 48))(v16, 1, v80) == 1)
          {
            sub_246AABBEC((uint64_t)v16, &qword_2691C1108);
LABEL_65:
            double v87 = 0.0;
            double v64 = 0.0;
            break;
          }
          v97 = &v16[*(int *)(v80 + 24)];
          if (v97[16] >= 0x20u)
          {
            sub_246AAB9DC((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for TimeRule);
            goto LABEL_65;
          }
          double v98 = (double)*(uint64_t *)v97 * -60.0 / 3600.0 * 6.28318531;
          sub_246AAB9DC((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for TimeRule);
          double v64 = v64 + v98;
LABEL_63:
          double v87 = 0.0;
          break;
        default:
          char v84 = sub_246AB6EF8(v22 >> 8, v64);
          if ((v84 == 2) | v84 & 1) {
            double v85 = a4 * 0.5 + v60 * v67 - v60 * 0.5;
          }
          else {
            double v85 = -(a4 * 0.5 + v60 * v67 - v60 * 0.5);
          }
          __double2 v86 = __sincos_stret(3.14159265 - v64);
          double v87 = v86.__cosval * v85;
          double v79 = -(v86.__sinval * v85);
          if (((v22 >> 16) & 1) != (v84 & 1) && v84 != 2) {
            double v64 = v64 + 3.14159265;
          }
          break;
      }
      char v96 = 0;
      double v25 = v77 + v87;
      double v26 = v78 + v79;
LABEL_67:
      uint64_t result = sub_246A85F9C((uint64_t)v105);
      *(double *)a3 = v77;
      *(double *)(a3 + 8) = v78;
      *(unsigned char *)(a3 + 16) = 0;
      *(double *)(a3 + 24) = v25;
      *(double *)(a3 + 32) = v26;
      *(double *)(a3 + 40) = v64;
      *(unsigned char *)(a3 + 48) = v96;
      return result;
    case 3uLL:
      char v53 = LOBYTE(v20) & 1;
      double v54 = MEMORY[0x24C540930](*(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
      double v26 = v55;
      uint64_t v56 = *(void *)(a2 + 32);
      if (*(void *)(v56 + 16) && (unint64_t v57 = sub_246ACBEF0(v53), (v58 & 1) != 0))
      {
        double v59 = (double *)(*(void *)(v56 + 56) + 16 * v57);
      }
      else
      {
        if (qword_2691C02B0 != -1) {
          swift_once();
        }
        double v59 = (double *)&qword_2691D41D0;
      }
      double v69 = *v59;
      uint64_t v70 = *(void *)(a2 + *(int *)(type metadata accessor for SceneLayoutAttributes(0) + 24));
      double v71 = 0.0;
      if (*(void *)(v70 + 16))
      {
        unint64_t v72 = sub_246ACBEF0(v53);
        if (v73) {
          double v71 = *(double *)(*(void *)(v70 + 56) + 8 * v72);
        }
      }
      if (v22) {
        double v74 = dbl_246AE1488[*(void *)&v21];
      }
      else {
        double v74 = v23;
      }
      double v81 = v69 * v74;
      double v82 = v54 + cos(1.57079633 - v71) * v81;
      uint64_t v83 = v24 & ~(v24 >> 63);
      if (v83 >= 60) {
        uint64_t v83 = 60;
      }
      double v25 = v54 + v82 - (v54 + cos((double)v83 * -60.0 / 3600.0 * 6.28318531 + 1.57079633) * v81);
      goto LABEL_60;
    default:
      double v25 = *v19;
      double v26 = v19[1];
LABEL_60:
      char v96 = 1;
      double v64 = 0.0;
      double v78 = 0.0;
      double v77 = 0.0;
      goto LABEL_67;
  }
}

uint64_t *sub_246AAB814(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

double sub_246AAB878(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_246AAB894(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_246AAB8FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_246A8604C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_246AAB960(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

double sub_246AAB9C8()
{
  return 0.0;
}

uint64_t sub_246AAB9DC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246AABA3C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246AABA74()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246AABAAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_246AABABC()
{
  return swift_release();
}

uint64_t sub_246AABAC4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_246AABB0C()
{
  unint64_t result = qword_2691C1148;
  if (!qword_2691C1148)
  {
    sub_246A8A7DC(&qword_2691C1140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1148);
  }
  return result;
}

void sub_246AABB68()
{
  sub_246AA779C(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_246AABB88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_246A8604C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_246AABBEC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_246A8604C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246AABC48(uint64_t a1, unint64_t *a2)
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

uint64_t sub_246AABC84(uint64_t a1)
{
  return a1;
}

uint64_t sub_246AABCBC()
{
  uint64_t v1 = v0;
  unint64_t v2 = sub_246AD8AD0();
  v193 = *(void (***)(char *, char *, uint64_t))(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v175 = (char *)v158 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v173 = (char *)v158 - v5;
  uint64_t isUniquelyReferenced_nonNull_native = sub_246AD89C0();
  uint64_t v189 = *(void *)(isUniquelyReferenced_nonNull_native - 8);
  uint64_t v7 = MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
  v164 = (char *)v158 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v176 = (char *)v158 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v170 = (char *)v158 - v12;
  MEMORY[0x270FA5388](v11);
  v195 = (char *)v158 - v13;
  uint64_t v14 = sub_246A8604C(&qword_2691C12E0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v187 = (uint64_t)v158 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = type metadata accessor for Scene();
  uint64_t v188 = *(void *)(v180 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v180);
  unint64_t v18 = (unint64_t)v158 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v167 = (uint64_t)v158 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v163 = (uint64_t)v158 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v172 = (uint64_t)v158 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v165 = (uint64_t)v158 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v194 = (uint64_t)v158 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v181 = (char *)v158 - v30;
  MEMORY[0x270FA5388](v29);
  double v32 = (char *)v158 - v31;
  double v33 = (void *)sub_246AD8940();
  unint64_t v34 = *(v33 - 1);
  MEMORY[0x270FA5388](v33);
  unint64_t v36 = (unint64_t)v158 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2691C0228 != -1) {
    goto LABEL_132;
  }
  while (1)
  {
    v174 = (void (*)(uint64_t, char *, uint64_t))v2;
    uint64_t v182 = sub_246A8AB74(v2, (uint64_t)qword_2691D4030);
    CGFloat v37 = sub_246AD8AB0();
    os_log_type_t v38 = sub_246AD8D00();
    if (os_log_type_enabled(v37, v38))
    {
      CGFloat v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CGFloat v39 = 0;
      _os_log_impl(&dword_246A80000, v37, v38, "Scene store is initializing.", v39, 2u);
      MEMORY[0x24C541130](v39, -1, -1);
    }

    id v40 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SceneLoader()), sel_init);
    unint64_t v201 = MEMORY[0x263F8EE80];
    uint64_t v202 = MEMORY[0x263F8EE80];
    unint64_t v200 = MEMORY[0x263F8EE80];
    id v41 = sub_246A93A20();
    id v42 = objc_msgSend(v41, sel_bundleURL);
    sub_246AD8930();

    unint64_t v43 = sub_246A95884(v36);
    (*(void (**)(unint64_t, void *))(v34 + 8))(v36, v33);
    id v44 = v40;
    unint64_t v36 = sub_246AAD958(v43, (uint64_t)v44);

    swift_bridgeObjectRelease();
    id v160 = v44;

    uint64_t v186 = *(void *)(v36 + 16);
    if (!v186) {
      break;
    }
    v158[1] = 0;
    unint64_t v171 = v18;
    v159 = v1;
    unint64_t v18 = 0;
    unint64_t v184 = v36 + ((*(unsigned __int8 *)(v188 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v188 + 80));
    v185 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v188 + 56);
    v178 = (void (**)(unint64_t, uint64_t, void *))(v193 + 2);
    v177 = (void (**)(char *, void (*)(uint64_t, char *, uint64_t)))(v193 + 1);
    v193 = (void (**)(char *, char *, uint64_t))(v189 + 16);
    v190 = (void (**)(uint64_t, uint64_t))(v189 + 8);
    v162 = &v199;
    double v33 = (void *)MEMORY[0x263F8EE80];
    *(void *)&long long v45 = 136315138;
    long long v169 = v45;
    uint64_t v161 = MEMORY[0x263F8EE58] + 8;
    uint64_t v1 = v174;
    unint64_t v2 = (unint64_t)v175;
    uint64_t v191 = isUniquelyReferenced_nonNull_native;
    uint64_t v46 = v180;
    unint64_t v34 = (unint64_t)v181;
    unint64_t v179 = v36;
    while (v18 < *(void *)(v36 + 16))
    {
      uint64_t v192 = *(void *)(v188 + 72);
      sub_246AADE24(v184 + v192 * v18, (uint64_t)v32);
      uint64_t v47 = v202;
      if (*(void *)(v202 + 16) && (unint64_t v48 = sub_246ACBF60((uint64_t)v32), (v49 & 1) != 0))
      {
        uint64_t v50 = *(void *)(v47 + 56) + v48 * v192;
        uint64_t v51 = v187;
        sub_246AADE24(v50, v187);
        (*v185)(v51, 0, 1, v46);
        sub_246A85FEC(v51);
        (*v178)(v2, v182, v1);
        uint64_t v52 = v171;
        sub_246AADE24((uint64_t)v32, v171);
        uint64_t v53 = v46;
        double v54 = sub_246AD8AB0();
        os_log_type_t v55 = sub_246AD8CF0();
        if (os_log_type_enabled(v54, v55))
        {
          uint64_t v56 = (_DWORD *)swift_slowAlloc();
          uint64_t v183 = (uint64_t)v56;
          uint64_t v192 = swift_slowAlloc();
          uint64_t v197 = v192;
          *uint64_t v56 = v169;
          uint64_t v198 = 91;
          unint64_t v199 = 0xE100000000000000;
          sub_246AD8990();
          sub_246AD8BF0();
          swift_bridgeObjectRelease();
          sub_246AD8BF0();
          sub_246AD8BF0();
          sub_246AD8BF0();
          sub_246AD8BF0();
          sub_246AD8BF0();
          uint64_t v57 = sub_246ACB68C(v198, v199, &v197);
          char v58 = (uint8_t *)v183;
          *(void *)(v183 + 4) = v57;
          swift_bridgeObjectRelease();
          sub_246AADE88(v52);
          _os_log_impl(&dword_246A80000, v54, v55, "  NOT LOADED: %s (duplicate UUID detected)", v58, 0xCu);
          uint64_t v59 = v192;
          swift_arrayDestroy();
          MEMORY[0x24C541130](v59, -1, -1);
          uint64_t isUniquelyReferenced_nonNull_native = v191;
          MEMORY[0x24C541130](v58, -1, -1);

          unint64_t v2 = (unint64_t)v175;
          (*v177)(v175, v1);
          sub_246AADE88((uint64_t)v32);
LABEL_109:
          uint64_t v46 = v180;
          goto LABEL_7;
        }

        sub_246AADE88(v52);
        (*v177)((char *)v2, v1);
        sub_246AADE88((uint64_t)v32);
        uint64_t v46 = v53;
      }
      else
      {
        uint64_t v60 = v187;
        (*v185)(v187, 1, 1, v46);
        sub_246A85FEC(v60);
        uint64_t v61 = *(void *)&v32[*(int *)(v46 + 32)];
        uint64_t v62 = *(void *)(v61 + 16);
        if (v62)
        {
          uint64_t v63 = (unsigned __int8 *)(v61 + 40);
          double v64 = v63;
          uint64_t v65 = v62;
          while (*v64 < 4u || *((void *)v64 - 1) != 6)
          {
            v64 += 16;
            if (!--v65)
            {
              while (*v63 < 4u || *((void *)v63 - 1) != 6)
              {
                v63 += 16;
                if (!--v62) {
                  goto LABEL_26;
                }
              }
              sub_246AADE24((uint64_t)v32, v34);
              goto LABEL_78;
            }
          }
LABEL_79:
          sub_246AADE88((uint64_t)v32);
          goto LABEL_8;
        }
LABEL_26:
        uint64_t v183 = *(int *)(v46 + 32);
        sub_246AADE24((uint64_t)v32, v34);
        uint64_t v68 = *(void *)(v34 + *(int *)(v46 + 32));
        uint64_t v69 = *(void *)(v68 + 16);
        if (v69)
        {
          uint64_t v70 = (unsigned __int8 *)(v68 + 40);
          while (*v70 < 4u || *((void *)v70 - 1) <= 6uLL)
          {
            v70 += 16;
            if (!--v69) {
              goto LABEL_33;
            }
          }
LABEL_78:
          sub_246AADE88(v34);
          goto LABEL_79;
        }
LABEL_33:
        sub_246AADE88(v34);
        uint64_t v72 = v183;
        unint64_t v34 = *(void *)(*(void *)&v32[v183] + 16);
        if (v34)
        {
          uint64_t v168 = swift_bridgeObjectRetain();
          unint64_t v36 = v168 + 40;
          do
          {
            if (*(unsigned char *)v36 == 4 && *(void *)(v36 - 8) == 2)
            {
              uint64_t v1 = (void (*)(uint64_t, char *, uint64_t))*v193;
              uint64_t v74 = (uint64_t)v195;
              (*v193)(v195, v32, isUniquelyReferenced_nonNull_native);
              sub_246AADE24((uint64_t)v32, v194);
              uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              uint64_t v198 = (uint64_t)v33;
              unint64_t v2 = sub_246ACBF60(v74);
              uint64_t v76 = v33[2];
              BOOL v77 = (v75 & 1) == 0;
              uint64_t v78 = v76 + v77;
              if (__OFADD__(v76, v77)) {
                goto LABEL_126;
              }
              char v79 = v75;
              if (v33[3] >= v78)
              {
                if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                  sub_246ACE904();
                }
              }
              else
              {
                sub_246ACCF00(v78, isUniquelyReferenced_nonNull_native);
                unint64_t v80 = sub_246ACBF60((uint64_t)v195);
                if ((v79 & 1) != (v81 & 1)) {
                  goto LABEL_136;
                }
                unint64_t v2 = v80;
              }
              uint64_t isUniquelyReferenced_nonNull_native = v191;
              double v33 = (void *)v198;
              if (v79)
              {
                sub_246AADF48(v194, *(void *)(v198 + 56) + v2 * v192);
              }
              else
              {
                *(void *)(v198 + 8 * (v2 >> 6) + 64) |= 1 << v2;
                v1(v33[6] + *(void *)(v189 + 72) * v2, v195, isUniquelyReferenced_nonNull_native);
                sub_246AADEE4(v194, v33[7] + v2 * v192);
                uint64_t v82 = v33[2];
                BOOL v83 = __OFADD__(v82, 1);
                uint64_t v84 = v82 + 1;
                if (v83) {
                  goto LABEL_127;
                }
                v33[2] = v84;
                double v33 = (void *)v198;
              }
              swift_bridgeObjectRelease();
              (*v190)((uint64_t)v195, isUniquelyReferenced_nonNull_native);
            }
            v36 += 16;
            --v34;
          }
          while (v34);
          swift_bridgeObjectRelease();
          uint64_t v72 = v183;
          uint64_t v1 = *(void (**)(uint64_t, char *, uint64_t))&v32[v183];
          uint64_t v85 = *((void *)v1 + 2);
          if (v85)
          {
            swift_bridgeObjectRetain();
            unint64_t v2 = 0;
            unint64_t v34 = 0;
            unint64_t v36 = -v85;
            __double2 v86 = (char *)v1 + 40;
LABEL_54:
            unint64_t v87 = *((void *)v1 + 2);
            if (v34 > v87) {
              unint64_t v87 = v34;
            }
            uint64_t v88 = -(uint64_t)v87;
            CGFloat v89 = &v86[16 * v34++];
            while (v88 + v34 != 1)
            {
              if (*v89 == 4 && *((void *)v89 - 1) == 5)
              {
                uint64_t v168 = (uint64_t)v86;
                uint64_t v91 = (uint64_t)v170;
                v166 = (void (*)(uint64_t, char *, uint64_t))*v193;
                v166((uint64_t)v170, v32, isUniquelyReferenced_nonNull_native);
                sub_246AADE24((uint64_t)v32, v165);
                uint64_t v92 = v201;
                uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v198 = v92;
                unint64_t v201 = 0x8000000000000000;
                unint64_t v2 = sub_246ACBF60(v91);
                uint64_t v94 = *(void *)(v92 + 16);
                BOOL v95 = (v93 & 1) == 0;
                uint64_t v96 = v94 + v95;
                if (__OFADD__(v94, v95)) {
                  goto LABEL_130;
                }
                char v97 = v93;
                if (*(void *)(v92 + 24) >= v96)
                {
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                    sub_246ACE904();
                  }
                }
                else
                {
                  sub_246ACCF00(v96, isUniquelyReferenced_nonNull_native);
                  unint64_t v98 = sub_246ACBF60((uint64_t)v170);
                  if ((v97 & 1) != (v99 & 1)) {
                    goto LABEL_136;
                  }
                  unint64_t v2 = v98;
                }
                uint64_t isUniquelyReferenced_nonNull_native = v191;
                uint64_t v100 = (void *)v198;
                if (v97)
                {
                  sub_246AADF48(v165, *(void *)(v198 + 56) + v2 * v192);
                }
                else
                {
                  *(void *)(v198 + 8 * (v2 >> 6) + 64) |= 1 << v2;
                  v166(v100[6] + *(void *)(v189 + 72) * v2, v170, isUniquelyReferenced_nonNull_native);
                  sub_246AADEE4(v165, v100[7] + v2 * v192);
                  uint64_t v101 = v100[2];
                  BOOL v83 = __OFADD__(v101, 1);
                  uint64_t v102 = v101 + 1;
                  if (v83)
                  {
                    __break(1u);
                    goto LABEL_134;
                  }
                  v100[2] = v102;
                  uint64_t v100 = (void *)v198;
                }
                unint64_t v201 = (unint64_t)v100;
                swift_bridgeObjectRelease();
                (*v190)((uint64_t)v170, isUniquelyReferenced_nonNull_native);
                unint64_t v2 = 1;
                __double2 v86 = (char *)v168;
                if (v36 + v34) {
                  goto LABEL_54;
                }
                swift_bridgeObjectRelease();
                uint64_t v134 = *(void *)&v32[v183];
                uint64_t v104 = *(void *)(v134 + 16);
                uint64_t v183 = v134 + 16;
                if (v104) {
                  goto LABEL_81;
                }
                goto LABEL_106;
              }
              ++v34;
              v89 += 16;
              if (v36 + v34 == 1)
              {
                swift_bridgeObjectRelease();
                uint64_t v72 = v183;
                goto LABEL_80;
              }
            }
            goto LABEL_125;
          }
        }
        unint64_t v2 = 0;
LABEL_80:
        uint64_t v103 = *(void *)&v32[v72];
        uint64_t v104 = *(void *)(v103 + 16);
        uint64_t v183 = v103 + 16;
        if (v104)
        {
LABEL_81:
          uint64_t v105 = swift_bridgeObjectRetain();
          unint64_t v36 = 0;
          unint64_t v34 = -v104;
          uint64_t v106 = v105 + 40;
LABEL_82:
          unint64_t v107 = *(void *)v183;
          if (v36 > *(void *)v183) {
            unint64_t v107 = v36;
          }
          uint64_t v108 = -(uint64_t)v107;
          CGRect v109 = (unsigned char *)(v106 + 16 * v36++);
          while (v108 + v36 != 1)
          {
            if (*v109 == 4 && *((void *)v109 - 1) == 3)
            {
              v166 = (void (*)(uint64_t, char *, uint64_t))v105;
              uint64_t v168 = v106;
              uint64_t v111 = (uint64_t)v176;
              uint64_t v1 = (void (*)(uint64_t, char *, uint64_t))*v193;
              (*v193)(v176, v32, isUniquelyReferenced_nonNull_native);
              sub_246AADE24((uint64_t)v32, v172);
              uint64_t v112 = v200;
              uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              uint64_t v198 = v112;
              unint64_t v200 = 0x8000000000000000;
              unint64_t v2 = sub_246ACBF60(v111);
              uint64_t v114 = *(void *)(v112 + 16);
              BOOL v115 = (v113 & 1) == 0;
              uint64_t v116 = v114 + v115;
              if (__OFADD__(v114, v115)) {
                goto LABEL_129;
              }
              char v117 = v113;
              if (*(void *)(v112 + 24) >= v116)
              {
                if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                  sub_246ACE904();
                }
              }
              else
              {
                sub_246ACCF00(v116, isUniquelyReferenced_nonNull_native);
                unint64_t v118 = sub_246ACBF60((uint64_t)v176);
                if ((v117 & 1) != (v119 & 1)) {
                  goto LABEL_136;
                }
                unint64_t v2 = v118;
              }
              uint64_t isUniquelyReferenced_nonNull_native = v191;
              v120 = (void *)v198;
              if (v117)
              {
                sub_246AADF48(v172, *(void *)(v198 + 56) + v2 * v192);
              }
              else
              {
                *(void *)(v198 + 8 * (v2 >> 6) + 64) |= 1 << v2;
                v1(v120[6] + *(void *)(v189 + 72) * v2, v176, isUniquelyReferenced_nonNull_native);
                sub_246AADEE4(v172, v120[7] + v2 * v192);
                uint64_t v121 = v120[2];
                BOOL v83 = __OFADD__(v121, 1);
                uint64_t v122 = v121 + 1;
                if (v83) {
                  goto LABEL_131;
                }
                v120[2] = v122;
                v120 = (void *)v198;
              }
              unint64_t v200 = (unint64_t)v120;
              swift_bridgeObjectRelease();
              (*v190)((uint64_t)v176, isUniquelyReferenced_nonNull_native);
              unint64_t v2 = 1;
              uint64_t v106 = v168;
              uint64_t v105 = (uint64_t)v166;
              if (!(v34 + v36))
              {
                swift_bridgeObjectRelease();
                goto LABEL_106;
              }
              goto LABEL_82;
            }
            ++v36;
            v109 += 16;
            if (v34 + v36 == 1)
            {
              swift_bridgeObjectRelease();
              goto LABEL_104;
            }
          }
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
          break;
        }
LABEL_104:
        if ((v2 & 1) == 0)
        {
          uint64_t v123 = (uint64_t)v164;
          (*v193)(v164, v32, isUniquelyReferenced_nonNull_native);
          uint64_t v124 = v163;
          sub_246AADE24((uint64_t)v32, v163);
          uint64_t v125 = v202;
          char v126 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v198 = v125;
          sub_246ACDE7C(v124, v123, v126);
          uint64_t v202 = v198;
          swift_bridgeObjectRelease();
          (*v190)(v123, isUniquelyReferenced_nonNull_native);
        }
LABEL_106:
        v127 = v173;
        uint64_t v1 = v174;
        (*v178)((unint64_t)v173, v182, v174);
        uint64_t v128 = v167;
        sub_246AADE24((uint64_t)v32, v167);
        v129 = sub_246AD8AB0();
        os_log_type_t v130 = sub_246AD8D00();
        if (!os_log_type_enabled(v129, v130))
        {

          sub_246AADE88(v128);
          (*v177)(v127, v1);
          sub_246AADE88((uint64_t)v32);
          unint64_t v2 = (unint64_t)v175;
          goto LABEL_109;
        }
        v131 = (uint8_t *)swift_slowAlloc();
        uint64_t v192 = swift_slowAlloc();
        uint64_t v197 = v192;
        *(_DWORD *)v131 = v169;
        uint64_t v198 = 91;
        unint64_t v199 = 0xE100000000000000;
        sub_246AD8990();
        sub_246AD8BF0();
        swift_bridgeObjectRelease();
        sub_246AD8BF0();
        sub_246AD8BF0();
        sub_246AD8BF0();
        sub_246AD8BF0();
        sub_246AD8BF0();
        uint64_t v198 = sub_246ACB68C(v198, v199, &v197);
        uint64_t isUniquelyReferenced_nonNull_native = v191;
        sub_246AD8D90();
        swift_bridgeObjectRelease();
        sub_246AADE88(v128);
        _os_log_impl(&dword_246A80000, v129, v130, "  Loaded: %s", v131, 0xCu);
        uint64_t v132 = v192;
        swift_arrayDestroy();
        MEMORY[0x24C541130](v132, -1, -1);
        v133 = v131;
        uint64_t v1 = v174;
        MEMORY[0x24C541130](v133, -1, -1);

        uint64_t v46 = v180;
        (*v177)(v173, v1);
        sub_246AADE88((uint64_t)v32);
        unint64_t v2 = (unint64_t)v175;
      }
LABEL_7:
      unint64_t v34 = (unint64_t)v181;
      unint64_t v36 = v179;
LABEL_8:
      if (++v18 == v186)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v159;
        goto LABEL_114;
      }
    }
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    swift_once();
  }
  swift_bridgeObjectRelease();
  double v33 = (void *)MEMORY[0x263F8EE80];
LABEL_114:
  unint64_t v136 = v200;
  unint64_t v135 = v201;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v137 = sub_246AD8AB0();
  os_log_type_t v138 = sub_246AD8D00();
  if (os_log_type_enabled(v137, v138))
  {
    v139 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v139 = 134217984;
    swift_beginAccess();
    uint64_t v140 = *(void *)(v202 + 16);
    uint64_t v141 = *(void *)(v135 + 16);
    BOOL v83 = __OFADD__(v140, v141);
    uint64_t v142 = v140 + v141;
    if (v83)
    {
LABEL_134:
      __break(1u);
    }
    else
    {
      uint64_t v143 = *(void *)(v136 + 16);
      BOOL v83 = __OFADD__(v142, v143);
      uint64_t v144 = v142 + v143;
      if (!v83)
      {
        uint64_t v198 = v144;
        sub_246AD8D90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_246A80000, v137, v138, "Scene store loaded %ld scenes.", v139, 0xCu);
        MEMORY[0x24C541130](v139, -1, -1);

        goto LABEL_119;
      }
    }
    __break(1u);
LABEL_136:
    uint64_t result = sub_246AD90A0();
    __break(1u);
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_119:
    swift_beginAccess();
    *((void *)v1 + 2) = v202;
    swift_beginAccess();
    *((void *)v1 + 3) = v201;
    swift_beginAccess();
    *((void *)v1 + 4) = v200;
    *((void *)v1 + 5) = v33;
    swift_bridgeObjectRetain();
    uint64_t v145 = swift_bridgeObjectRetain();
    size_t v146 = sub_246AAD538(v145);
    swift_bridgeObjectRelease();
    type metadata accessor for ShuffledSceneProvider();
    uint64_t v147 = swift_allocObject();
    uint64_t v148 = MEMORY[0x263F8EE78];
    *(void *)(v147 + 24) = MEMORY[0x263F8EE78];
    *(void *)(v147 + 16) = v146;
    size_t v196 = v146;
    swift_bridgeObjectRetain();
    sub_246AD0EE4();
    uint64_t v149 = v196;
    swift_beginAccess();
    sub_246AD0148(v149);
    swift_endAccess();
    *((void *)v1 + 6) = v147;
    uint64_t v150 = swift_bridgeObjectRetain();
    size_t v151 = sub_246AAD538(v150);
    swift_bridgeObjectRelease();
    uint64_t v152 = swift_allocObject();
    *(void *)(v152 + 24) = v148;
    *(void *)(v152 + 16) = v151;
    size_t v196 = v151;
    swift_bridgeObjectRetain();
    sub_246AD0EE4();
    uint64_t v153 = v196;
    swift_beginAccess();
    sub_246AD0148(v153);
    swift_endAccess();
    *((void *)v1 + 7) = v152;
    if (!*(void *)(*((void *)v1 + 3) + 16))
    {
      v154 = sub_246AD8AB0();
      os_log_type_t v155 = sub_246AD8CF0();
      if (os_log_type_enabled(v154, v155))
      {
        v156 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v156 = 0;
        _os_log_impl(&dword_246A80000, v154, v155, "Scene store failed to find any tritium scenes!", v156, 2u);
        MEMORY[0x24C541130](v156, -1, -1);
      }
    }
    swift_bridgeObjectRelease();
    return (uint64_t)v1;
  }
  return result;
}

uint64_t sub_246AAD4B4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SceneStore()
{
  return self;
}

size_t sub_246AAD538(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  sub_246A8604C(&qword_2691C1168);
  uint64_t v3 = *(void *)(type metadata accessor for Scene() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      _OWORD v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_246AAD68C(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_246AADFAC();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_246AAD68C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Scene();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v35 = a4;
  uint64_t v18 = *(void *)(a4 + 64);
  uint64_t v17 = a4 + 64;
  uint64_t v16 = v18;
  uint64_t v19 = -1 << *(unsigned char *)(v17 - 32);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1 << -(char)v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v16;
  if (!a2)
  {
    int64_t v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    int64_t v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v32 = -1 << *(unsigned char *)(v17 - 32);
  double v33 = a1;
  int64_t v22 = 0;
  uint64_t v23 = 0;
  int64_t v34 = (unint64_t)(63 - v19) >> 6;
  int64_t v31 = v34 - 1;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    uint64_t v29 = *(void *)(v9 + 72);
    sub_246AADE24(*(void *)(v35 + 56) + v29 * v25, (uint64_t)v12);
    sub_246AADEE4((uint64_t)v12, (uint64_t)v15);
    uint64_t result = sub_246AADEE4((uint64_t)v15, a2);
    if (v23 == a3) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v21) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    if (!v27) {
      break;
    }
LABEL_18:
    unint64_t v21 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v26 << 6);
    int64_t v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27) {
    goto LABEL_14;
  }
  int64_t v28 = v26 + 2;
  if (v26 + 2 >= v34) {
    goto LABEL_32;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27) {
    goto LABEL_17;
  }
  int64_t v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26 + 2;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    int64_t v26 = v22;
    goto LABEL_18;
  }
  int64_t v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    unint64_t v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    uint64_t v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    int64_t v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v26 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v26 >= v34)
    {
      unint64_t v21 = 0;
      int64_t v22 = v31;
      goto LABEL_36;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    ++v28;
    if (v27) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

unint64_t sub_246AAD958(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_246A8604C(&qword_2691C12E0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = type metadata accessor for Scene();
  uint64_t v9 = *(void *)(v49 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v49);
  uint64_t v48 = (uint64_t)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v40 = (uint64_t)&v36 - v12;
  uint64_t v13 = sub_246AD8940();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  double v54 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_246A8604C(&qword_2691C0A30);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v51 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18)
  {
    uint64_t v53 = v8;
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    uint64_t v19 = v14 + 16;
    uint64_t v21 = a1;
    uint64_t v22 = a1 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
    uint64_t v50 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v46 = (unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 32);
    uint64_t v47 = v20;
    uint64_t v23 = *(void *)(v19 + 56);
    id v44 = (void (**)(char *, char *, uint64_t))(v19 + 16);
    uint64_t v45 = v23;
    id v42 = (void (**)(char *, uint64_t))(v19 - 8);
    unint64_t v43 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v36 = v21;
    uint64_t v37 = v9;
    id v41 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    swift_bridgeObjectRetain();
    unint64_t v52 = MEMORY[0x263F8EE78];
    uint64_t v38 = v19;
    uint64_t v39 = a2;
    unint64_t v24 = v51;
    while (1)
    {
      v47(v24, v22, v13);
      unint64_t v25 = *v50;
      (*v50)(v24, 0, 1, v13);
      if ((*v46)(v24, 1, v13) == 1) {
        break;
      }
      uint64_t v26 = (uint64_t)v54;
      (*v44)(v54, v24, v13);
      sub_246A93A78(v26, (uint64_t)v53);
      if (v3)
      {

        uint64_t v3 = 0;
        uint64_t v27 = 1;
      }
      else
      {
        uint64_t v27 = 0;
      }
      uint64_t v28 = (uint64_t)v53;
      uint64_t v29 = v49;
      (*v43)((uint64_t)v53, v27, 1, v49);
      (*v42)(v54, v13);
      if ((*v41)(v28, 1, v29) == 1)
      {
        sub_246A85FEC(v28);
        unint64_t v24 = v51;
      }
      else
      {
        uint64_t v30 = v40;
        sub_246AADEE4(v28, v40);
        sub_246AADEE4(v30, v48);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v52 = sub_246AD03B4(0, *(void *)(v52 + 16) + 1, 1, v52);
        }
        unint64_t v24 = v51;
        unint64_t v32 = *(void *)(v52 + 16);
        unint64_t v31 = *(void *)(v52 + 24);
        if (v32 >= v31 >> 1) {
          unint64_t v52 = sub_246AD03B4(v31 > 1, v32 + 1, 1, v52);
        }
        unint64_t v33 = v52;
        *(void *)(v52 + 16) = v32 + 1;
        sub_246AADEE4(v48, v33+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(void *)(v37 + 72) * v32);
        uint64_t v3 = 0;
      }
      v22 += v45;
      if (!--v18)
      {
        v25(v24, 1, 1, v13);
        break;
      }
    }
  }
  else
  {
    int64_t v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    swift_bridgeObjectRetain();
    unint64_t v52 = MEMORY[0x263F8EE78];
    v34(v51, 1, 1, v13);
  }
  swift_bridgeObjectRelease();
  return v52;
}

uint64_t sub_246AADE24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Scene();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246AADE88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Scene();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246AADEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Scene();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246AADF48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Scene();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_246AADFAC()
{
  return swift_release();
}

uint64_t _sSo7CGPointV32NTKEsterbrookFaceBundleCompanionE4hash4intoys6HasherVz_tF_0()
{
  return sub_246AD9130();
}

ValueMetadata *type metadata accessor for SceneLayout()
{
  return &type metadata for SceneLayout;
}

double sub_246AAE01C(char a1, CGFloat *a2, double a3, double a4)
{
  switch(a1)
  {
    case 1:
      double v14 = 1.0 - a4;
      CGFloat v15 = *a2;
      CGFloat v16 = a2[1];
      CGFloat v17 = a2[2];
      CGFloat v18 = a2[3];
      v25.origin.x = *a2;
      v25.origin.y = v16;
      v25.size.width = v17;
      v25.size.height = v18;
      ceil(CGRectGetHeight(v25) * a4);
      v26.origin.x = v15;
      v26.origin.y = v16;
      v26.size.width = v17;
      v26.size.height = v18;
      CGRectGetWidth(v26);
      v27.origin.x = v15;
      v27.origin.y = v16;
      v27.size.width = v17;
      v27.size.height = v18;
      ceil(v14 * CGRectGetHeight(v27));
      goto LABEL_6;
    case 2:
      CGFloat v9 = *a2;
      CGFloat v10 = a2[1];
      CGFloat v11 = a2[2];
      CGFloat v12 = a2[3];
      v22.origin.x = *a2;
      v22.origin.y = v10;
      v22.size.width = v11;
      v22.size.height = v12;
      CGRectGetHeight(v22);
      v23.origin.x = v9;
      v23.origin.y = v10;
      v23.size.width = v11;
      v23.size.height = v12;
      CGRectGetHeight(v23);
      v24.origin.x = v9;
      v24.origin.y = v10;
      v24.size.width = v11;
      v24.size.height = v12;
      CGRectGetWidth(v24);
LABEL_6:
      double v8 = 0.0;
      break;
    case 3:
      double v8 = *a2;
      break;
    default:
      CGFloat v4 = *a2;
      CGFloat v5 = a2[1];
      CGFloat v6 = a2[2];
      CGFloat v7 = a2[3];
      v20.origin.x = *a2;
      v20.origin.y = v5;
      v20.size.width = v6;
      v20.size.height = v7;
      double v8 = CGRectGetWidth(v20) * 0.5 + -5.0;
      v21.origin.x = v4;
      v21.origin.y = v5;
      v21.size.width = v6;
      v21.size.height = v7;
      CGRectGetHeight(v21);
      break;
  }
  return v8;
}

uint64_t sub_246AAE1CC()
{
  return swift_deallocClassInstance();
}

uint64_t sub_246AAE1DC(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = type metadata accessor for Timeline(0);
  MEMORY[0x270FA5388](v38);
  uint64_t v39 = (uint64_t)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SpriteAnimationAttributes();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  CGFloat v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Timing(0);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  double v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  CGFloat v16 = (char *)&v36 - v15;
  *(void *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_currentImage] = 0;
  *(void *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_displayLink] = 0;
  *(void *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_animationObserver + 8] = 0;
  swift_unknownObjectWeakInit();
  sub_246AAF154(a1, (uint64_t)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_sprite], (uint64_t (*)(void))type metadata accessor for Sprite);
  uint64_t v17 = type metadata accessor for Sprite();
  CGFloat v18 = (long long *)(a1 + *(int *)(v17 + 20));
  v42[0] = v18[2];
  *(_OWORD *)((char *)v42 + 9) = *(long long *)((char *)v18 + 41);
  long long v19 = v18[1];
  v41[0] = *v18;
  v41[1] = v19;
  uint64_t v20 = *(int *)(v17 + 32);
  uint64_t v37 = a1;
  uint64_t v21 = a1 + v20;
  sub_246AAF154(a1 + v20, (uint64_t)v16, type metadata accessor for Timing);
  sub_246AAF154(a2, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for SpriteAnimationAttributes);
  type metadata accessor for AtlasImageCache();
  swift_allocObject();
  CGRect v22 = v2;
  sub_246AAF11C((uint64_t)v41);
  CGRect v23 = v9;
  uint64_t v24 = v38;
  *(void *)&v22[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_cache] = sub_246AC76AC(v41, (uint64_t)v16, v23);
  uint64_t v25 = a2 + *(int *)(v7 + 28);
  uint64_t v26 = v39;
  sub_246AAF154(v25, v39, type metadata accessor for Timeline);
  sub_246AAF154(v21, (uint64_t)v14, type metadata accessor for Timing);
  type metadata accessor for SpriteAnimator.AnimationCounter();
  CGRect v27 = (void *)swift_allocObject();
  uint64_t v28 = v26;
  uint64_t v29 = *(void *)(v26 + *(int *)(v24 + 24));
  if (v29 <= 0) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = v29 - 1;
  }
  v27[2] = 0;
  uint64_t result = sub_246AAF1BC(v28, type metadata accessor for Timeline);
  v27[3] = 0;
  v27[4] = v30;
  uint64_t v32 = *(void *)&v14[*(int *)(v11 + 28)];
  uint64_t v33 = *(void *)&v14[*(int *)(v11 + 32)];
  if (v33 < v32)
  {
    __break(1u);
  }
  else
  {
    sub_246AAF1BC((uint64_t)v14, type metadata accessor for Timing);
    v27[5] = v32;
    v27[6] = v33;
    *(void *)&v22[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_counter] = v27;
    v22[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_fps] = *(unsigned char *)(v25 + *(int *)(v24 + 20));
    v22[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_state] = 0;

    int64_t v34 = (objc_class *)type metadata accessor for SpriteAnimator();
    v40.receiver = v22;
    v40.super_class = v34;
    id v35 = objc_msgSendSuper2(&v40, sel_init);
    sub_246AAEAC0();

    sub_246AAF1BC(a2, (uint64_t (*)(void))type metadata accessor for SpriteAnimationAttributes);
    sub_246AAF1BC(v37, (uint64_t (*)(void))type metadata accessor for Sprite);
    return (uint64_t)v35;
  }
  return result;
}

id sub_246AAE5A0()
{
  uint64_t v1 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_displayLink;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_displayLink];
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v3, sel_invalidate);
    CGFloat v4 = *(void **)&v0[v1];
    *(void *)&v0[v1] = 0;
  }
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for SpriteAnimator();
  return objc_msgSendSuper2(&v6, sel_dealloc);
}

uint64_t sub_246AAE6E4()
{
  return type metadata accessor for SpriteAnimator();
}

uint64_t type metadata accessor for SpriteAnimator()
{
  uint64_t result = qword_2691C1190;
  if (!qword_2691C1190) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_246AAE738()
{
  if (qword_2691C0240 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_246AD8AD0();
  sub_246A8AB74(v1, (uint64_t)qword_2691D4078);
  uint64_t v2 = v0;
  id v3 = sub_246AD8AB0();
  os_log_type_t v4 = sub_246AD8D00();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v15 = v6;
    uint64_t v7 = &v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_sprite];
    uint64_t v8 = (uint64_t *)&v7[*(int *)(type metadata accessor for Sprite() + 20)];
    uint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    swift_bridgeObjectRetain();
    sub_246ACB68C(v9, v10, &v15);
    sub_246AD8D90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v3, v4, "Stopping sprite animator animation for [%s].", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v6, -1, -1);
    MEMORY[0x24C541130](v5, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_displayLink;
  uint64_t v12 = *(void **)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_displayLink];
  if (v12)
  {
    id v13 = v12;
    objc_msgSend(v13, sel_invalidate);
    double v14 = *(void **)&v2[v11];
    *(void *)&v2[v11] = 0;
  }
}

void sub_246AAE92C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_counter;
  id v3 = *(void **)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_counter);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  BOOL v6 = __OFSUB__(v5, v4);
  uint64_t v7 = v5 - v4;
  if (v6)
  {
    __break(1u);
    goto LABEL_26;
  }
  BOOL v6 = __OFADD__(v7, 1);
  uint64_t v8 = v7 + 1;
  if (v6)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v8 < 2)
  {
LABEL_16:
    sub_246AAE738();
    return;
  }
  uint64_t v9 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_state;
  if (!*(unsigned char *)(v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_state))
  {
    if (MEMORY[0x24C5411D0](v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_animationObserver))
    {
      sub_246AC5AD4();
      swift_unknownObjectRelease();
    }
    *(unsigned char *)(v1 + v9) = 1;
    id v3 = *(void **)(v1 + v2);
  }
  if (v3[2] >= v3[6])
  {
    uint64_t v10 = v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_sprite;
    uint64_t v11 = v10 + *(int *)(type metadata accessor for Sprite() + 32);
    if (*(unsigned char *)(v11 + *(int *)(type metadata accessor for Timing(0) + 28)) == 3)
    {
      uint64_t v12 = v3[5];
      BOOL v6 = __OFSUB__(v12, 1);
      uint64_t v13 = v12 - 1;
      if (v6)
      {
LABEL_28:
        __break(1u);
        return;
      }
      v3[2] = v13;
    }
    else
    {
      *(unsigned char *)(v1 + v9) = 2;
      if (MEMORY[0x24C5411D0](v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_animationObserver))
      {
        sub_246AC5CBC();
        swift_unknownObjectRelease();
      }
      sub_246AAE738();
    }
  }
  if (*(unsigned char *)(v1 + v9) == 2) {
    goto LABEL_16;
  }
  uint64_t v14 = *(void *)(v1 + v2);
  uint64_t v15 = *(void *)(v14 + 16);
  BOOL v6 = __OFADD__(v15, 1);
  uint64_t v16 = v15 + 1;
  if (v6)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (*(void *)(v14 + 32) < v16) {
    uint64_t v16 = *(void *)(v14 + 32);
  }
  *(void *)(v14 + 16) = v16;

  sub_246AAEAC0();
}

void sub_246AAEAC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_counter);
  uint64_t v3 = v2[2];
  if (v3 < v2[5] || v2[6] < v3) {
    return;
  }
  swift_retain();
  id v13 = (id)sub_246AC7D08(v3);
  swift_release();
  uint64_t v5 = v13;
  if (!v13) {
    return;
  }
  uint64_t v6 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_currentImage;
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_currentImage);
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  type metadata accessor for CGImage(0);
  sub_246AAEFB0();
  id v8 = v13;
  id v9 = v7;
  char v10 = sub_246AD8A80();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = *(void **)(v1 + v6);
    uint64_t v5 = v13;
LABEL_11:
    *(void *)(v1 + v6) = v5;
    id v12 = v5;

    sub_246AAEBF4();
  }
}

uint64_t sub_246AAEBF4()
{
  uint64_t result = MEMORY[0x24C5411D0](v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_animationObserver);
  if (result)
  {
    uint64_t v2 = *(void **)(result + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer);
    if (v2)
    {
      uint64_t v3 = *(void **)(*(void *)(result + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator)
                    + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_currentImage);
      uint64_t v4 = self;
      id v5 = v3;
      id v6 = v2;
      objc_msgSend(v4, sel_begin);
      objc_msgSend(v4, sel_setDisableActions_, 1);
      objc_msgSend(v6, sel_setContents_, v5);
      objc_msgSend(v4, sel_commit);
    }
    sub_246AC5A14();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_246AAED70()
{
  uint64_t result = type metadata accessor for Sprite();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for SpriteAnimator.AnimationCounter()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for SpriteAnimator.AnimatorState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AAEF20);
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

ValueMetadata *type metadata accessor for SpriteAnimator.AnimatorState()
{
  return &type metadata for SpriteAnimator.AnimatorState;
}

unint64_t sub_246AAEF5C()
{
  unint64_t result = qword_2691C11A0;
  if (!qword_2691C11A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C11A0);
  }
  return result;
}

unint64_t sub_246AAEFB0()
{
  unint64_t result = qword_2691C11A8;
  if (!qword_2691C11A8)
  {
    type metadata accessor for CGImage(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C11A8);
  }
  return result;
}

uint64_t sub_246AAF008(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_animationObserver + 8) = a2;
  uint64_t v3 = swift_unknownObjectWeakAssign();
  uint64_t result = MEMORY[0x24C5411D0](v3);
  if (result)
  {
    uint64_t v5 = *(void **)(result + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer);
    if (v5)
    {
      unsigned int v6 = *(void **)(*(void *)(result + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator)
                    + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_currentImage);
      uint64_t v7 = self;
      id v8 = v6;
      id v9 = v5;
      objc_msgSend(v7, sel_begin);
      objc_msgSend(v7, sel_setDisableActions_, 1);
      objc_msgSend(v9, sel_setContents_, v8);
      objc_msgSend(v7, sel_commit);
    }
    sub_246AC5A14();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_246AAF11C(uint64_t a1)
{
  return a1;
}

uint64_t sub_246AAF154(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_246AAF1BC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246AAF2BC@<X0>(char *a1@<X8>)
{
  uint64_t v3 = sub_246AD8980();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C((uint64_t *)&unk_2691C12C0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  char v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v19 - v11;
  uint64_t v13 = v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_overrideDate;
  swift_beginAccess();
  sub_246AB2C58(v13, (uint64_t)v12);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
  if (v14(v12, 1, v3) != 1) {
    return (*(uint64_t (**)(char *, char *, uint64_t))(v4 + 32))(a1, v12, v3);
  }
  id v15 = objc_msgSend(self, sel_faceDate);
  if (v15)
  {
    uint64_t v16 = v15;
    sub_246AD8970();

    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v17(v10, v6, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v10, 0, 1, v3);
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v14)(v10, 1, v3);
    if (result != 1)
    {
      v17(a1, v10, v3);
      return sub_246AABBEC((uint64_t)v12, (uint64_t *)&unk_2691C12C0);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v10, 1, 1, v3);
  }
  __break(1u);
  return result;
}

void sub_246AAF538()
{
  uint64_t v1 = v0;
  if ((*(unsigned char *)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_isEditing) & 1) != 0 || !sub_246AB121C())
  {
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_colorPalette);
    uint64_t v4 = (objc_class *)type metadata accessor for ScenePalette();
    id v5 = objc_allocWithZone(v4);
    swift_unknownObjectRetain();
    unsigned int v6 = (char *)v5;
    id v7 = objc_msgSend(v3, sel_background);
    *(void *)&v6[OBJC_IVAR___NTKEsterbrookScenePalette_background] = v7;
    id v8 = objc_msgSend(v3, sel_overlay);
    *(void *)&v6[OBJC_IVAR___NTKEsterbrookScenePalette_overlay] = v8;
    id v9 = objc_msgSend(v3, sel_secondHand);
    *(void *)&v6[OBJC_IVAR___NTKEsterbrookScenePalette_secondHand] = v9;

    v29.receiver = v6;
    v29.super_class = v4;
    id v2 = objc_msgSendSuper2(&v29, sel_init);
    swift_unknownObjectRelease();
  }
  else
  {
    id v2 = sub_246AB23A4();
  }
  uint64_t v10 = OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView;
  uint64_t v11 = *(void **)(*(void *)(v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView)
                 + OBJC_IVAR___NTKEsterbrookSceneView_scenePalette);
  type metadata accessor for ScenePalette();
  id v12 = v11;
  id v13 = v2;
  char v14 = sub_246AD8D70();

  if ((v14 & 1) == 0)
  {
    if (qword_2691C0248 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_246AD8AD0();
    sub_246A8AB74(v15, (uint64_t)qword_2691D4090);
    uint64_t v16 = v13;
    uint64_t v17 = sub_246AD8AB0();
    os_log_type_t v18 = sub_246AD8D00();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v28 = v10;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      CGRect v27 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      uint64_t v20 = v16;
      sub_246AD8D90();
      void *v27 = v16;

      _os_log_impl(&dword_246A80000, v17, v18, "Applying new scene palette: %@", v19, 0xCu);
      sub_246A8604C(&qword_2691C1158);
      swift_arrayDestroy();
      MEMORY[0x24C541130](v27, -1, -1);
      uint64_t v21 = v19;
      uint64_t v10 = v28;
      MEMORY[0x24C541130](v21, -1, -1);
    }
    else
    {

      uint64_t v17 = v16;
    }

    CGRect v22 = *(char **)(v1 + v10);
    CGRect v23 = *(void **)&v22[OBJC_IVAR___NTKEsterbrookSceneView_scenePalette];
    *(void *)&v22[OBJC_IVAR___NTKEsterbrookSceneView_scenePalette] = v16;
    uint64_t v24 = v16;
    uint64_t v25 = v22;

    sub_246AA63D0();
    uint64_t v26 = (void *)MEMORY[0x24C5411D0](v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_delegate);
    if (v26)
    {
      objc_msgSend(v26, sel_didChangeScenePalette);
      swift_unknownObjectRelease();
    }
  }
}

char *sub_246AAF940(void *a1, void *a2, void *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v9 = v8;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v19 = OBJC_IVAR___NTKEsterbrookSceneCoordinator_engine;
  uint64_t v20 = qword_2691C0290;
  uint64_t v21 = v9;
  if (v20 != -1) {
    swift_once();
  }
  *(void *)&v9[v19] = qword_2691D4150;
  swift_unknownObjectWeakInit();
  CGRect v22 = &v21[OBJC_IVAR___NTKEsterbrookSceneCoordinator_overrideDate];
  uint64_t v23 = sub_246AD8980();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  v21[OBJC_IVAR___NTKEsterbrookSceneCoordinator_isEditing] = 0;
  *(void *)&v21[OBJC_IVAR___NTKEsterbrookSceneCoordinator_tritiumProgress] = 0;
  v21[OBJC_IVAR___NTKEsterbrookSceneCoordinator_isFrozen] = 0;
  *(void *)&v21[OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___sundayWakeStyle] = 0;
  *(void *)&v21[OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___allSundayStyles] = 0;
  id v24 = objc_allocWithZone((Class)type metadata accessor for SceneView());
  swift_retain();
  id v25 = a2;
  swift_unknownObjectRetain();
  id v26 = a1;
  *(void *)&v21[OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView] = sub_246AA55A0(v25, a3, v26, a5, a6, a7, a8);
  *(void *)&v21[OBJC_IVAR___NTKEsterbrookSceneCoordinator_colorPalette] = a3;
  *(void *)&v21[OBJC_IVAR___NTKEsterbrookSceneCoordinator_faceState] = a4;
  swift_unknownObjectRetain();
  id v27 = a4;

  v34.receiver = v21;
  v34.super_class = ObjectType;
  uint64_t v28 = (char *)objc_msgSendSuper2(&v34, sel_init);
  sub_246AAF538();
  *(void *)(*(void *)&v28[OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView]
            + OBJC_IVAR___NTKEsterbrookSceneView_delegate
            + 8) = &off_26FB045D0;
  swift_unknownObjectWeakAssign();
  sub_246AAFE90(v27, 0);
  if (qword_2691C0220 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_246AD8AD0();
  sub_246A8AB74(v29, (uint64_t)qword_2691D4018);
  uint64_t v30 = sub_246AD8AB0();
  os_log_type_t v31 = sub_246AD8D00();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl(&dword_246A80000, v30, v31, "Initialized Scene Coordinator", v32, 2u);
    MEMORY[0x24C541130](v32, -1, -1);
  }

  swift_unknownObjectRelease();
  return v28;
}

id sub_246AAFD08()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246AAFE3C()
{
  return type metadata accessor for SceneCoordinator();
}

uint64_t type metadata accessor for SceneCoordinator()
{
  uint64_t result = qword_2691C1248;
  if (!qword_2691C1248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_246AAFE90(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_246AD8AD0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    uint64_t v10 = *(void **)(v3 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_faceState);
    type metadata accessor for NTKFaceState();
    id v11 = v10;
    char v12 = sub_246AD8D70();

    if (v12) {
      return;
    }
  }
  uint64_t v84 = v9;
  id v13 = *(void **)(v3 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_faceState);
  *(void *)(v3 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_faceState) = a1;
  uint64_t v14 = qword_2691C0220;
  id v15 = a1;
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_246A8AB74(v6, (uint64_t)qword_2691D4018);
  id v17 = v13;
  id v18 = v15;
  uint64_t v19 = (char *)v17;
  uint64_t v20 = (char *)v18;
  uint64_t v80 = v16;
  uint64_t v21 = sub_246AD8AB0();
  os_log_type_t v22 = sub_246AD8CE0();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v83 = v3;
  uint64_t v81 = v6;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    id v25 = (void *)swift_slowAlloc();
    uint64_t v82 = swift_slowAlloc();
    v86[0] = v82;
    *(_DWORD *)uint64_t v24 = 136315650;
    os_log_t v79 = v21;
    uint64_t v85 = sub_246ACB68C(0xD000000000000018, 0x8000000246ADB500, v86);
    sub_246AD8D90();
    *(_WORD *)(v24 + 12) = 2112;
    uint64_t v85 = (uint64_t)v19;
    id v26 = v19;
    sub_246AD8D90();
    *id v25 = v19;

    *(_WORD *)(v24 + 22) = 2112;
    uint64_t v85 = (uint64_t)v20;
    id v27 = v20;
    sub_246AD8D90();
    v25[1] = v20;

    uint64_t v6 = v81;
    os_log_t v28 = v79;
    _os_log_impl(&dword_246A80000, v79, v22, "%s: %@ → %@", (uint8_t *)v24, 0x20u);
    sub_246A8604C(&qword_2691C1158);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v25, -1, -1);
    uint64_t v29 = v82;
    swift_arrayDestroy();
    MEMORY[0x24C541130](v29, -1, -1);
    uint64_t v30 = v24;
    uint64_t v3 = v83;
    MEMORY[0x24C541130](v30, -1, -1);
  }
  else
  {
  }
  int v31 = 1;
  char v89 = 1;
  uint64_t v88 = 0x3FF0000000000000;
  uint64_t v32 = *(void *)&v20[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_dataMode];
  double v33 = 1.0;
  objc_super v34 = v84;
  switch(v32)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      uint64_t v88 = 0;
      char v89 = 1;
      sub_246AB09D8(0);
      int v35 = 0;
      double v33 = 0.0;
      break;
    case 1:
      int v31 = 0;
      char v89 = 0;
      int v35 = 1;
      break;
    case 2:
      int v35 = 0;
      char v89 = 1;
      break;
    default:
      int v35 = 0;
      break;
  }
  char v87 = 0;
  uint64_t v36 = *(void *)&v20[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_screenState];
  if (v36 == 1)
  {
    LODWORD(v82) = v35;
    int v38 = 0;
    LODWORD(v79) = 1;
    char v89 = 1;
  }
  else
  {
    LODWORD(v79) = v31;
    if (!v36)
    {
      uint64_t v37 = *(void *)&v19[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_screenState];
      if (v37 == 1)
      {
        int v45 = v31;
        int v38 = 0;
        LODWORD(v82) = v35 | v45 ^ 1;
        goto LABEL_25;
      }
      if (!v37)
      {
        int v38 = 1;
        char v87 = 1;
        uint64_t v39 = *(void *)&v19[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_dataMode];
        LODWORD(v82) = v39 == 3;
        if (v32 == 1 && v39 == 2)
        {
          uint64_t v78 = *(char **)(v3 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
          objc_super v40 = &v78[OBJC_IVAR___NTKEsterbrookSceneView_spriteViews];
          swift_beginAccess();
          uint64_t v41 = *(void *)v40;
          if (*(void *)(*(void *)v40 + 16) && (uint64_t v42 = sub_246ACBDC8(1), (v43 & 1) != 0))
          {
            unint64_t v44 = *(void *)(*(void *)(v41 + 56) + 8 * v42);
            swift_bridgeObjectRetain();
          }
          else
          {
            unint64_t v44 = MEMORY[0x263F8EE78];
          }
          if (v44 >> 62) {
            goto LABEL_66;
          }
          uint64_t v63 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
          double v64 = v78;
          while (v63)
          {
            uint64_t v75 = v7;
            if ((v44 & 0xC000000000000001) != 0)
            {
              uint64_t v3 = 0;
              while (1)
              {
                uint64_t v65 = v19;
                uint64_t v66 = MEMORY[0x24C540420](v3, v44);
                uint64_t v7 = v3 + 1;
                if (__OFADD__(v3, 1)) {
                  break;
                }
                uint64_t v67 = v66;
                uint64_t v68 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite;
                uint64_t v69 = v66 + *(int *)(type metadata accessor for Sprite() + 32) + v68;
                if (*(unsigned char *)(v69 + *(int *)(type metadata accessor for Timing(0) + 28)) == 3)
                {

                  swift_bridgeObjectRelease();
                  swift_unknownObjectRelease();
                  int v38 = 1;
                  uint64_t v3 = v83;
                  uint64_t v7 = v75;
                  uint64_t v19 = v65;
                  goto LABEL_25;
                }
                if (*(unsigned char *)(*(void *)(v67 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator)
                              + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_state) != 2)
                {
                  uint64_t v3 = v83;
                  uint64_t v7 = v75;
                  uint64_t v19 = v65;

                  swift_bridgeObjectRelease();
                  swift_unknownObjectRelease();
                  int v38 = 1;
                  goto LABEL_25;
                }
                swift_unknownObjectRelease();
                ++v3;
                uint64_t v19 = v65;
                if (v7 == v63) {
                  goto LABEL_59;
                }
              }
              __break(1u);
            }
            else
            {
              uint64_t v70 = 0;
              uint64_t v77 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite;
              uint64_t v76 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator;
              uint64_t v3 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_state;
              while (1)
              {
                uint64_t v7 = v70 + 1;
                if (__OFADD__(v70, 1)) {
                  break;
                }
                double v71 = v19;
                uint64_t v72 = *(void *)(v44 + 8 * v70 + 32);
                uint64_t v73 = v72 + v77 + *(int *)(type metadata accessor for Sprite() + 32);
                if (*(unsigned char *)(v73 + *(int *)(type metadata accessor for Timing(0) + 28)) == 3)
                {

                  swift_bridgeObjectRelease();
                  int v38 = 1;
                  uint64_t v3 = v83;
                  uint64_t v7 = v75;
                  uint64_t v19 = v71;
                  goto LABEL_25;
                }
                if (*(unsigned char *)(*(void *)(v72 + v76) + v3) != 2)
                {
                  uint64_t v3 = v83;
                  uint64_t v7 = v75;
                  uint64_t v19 = v71;

                  swift_bridgeObjectRelease();
                  int v38 = 1;
                  goto LABEL_25;
                }
                ++v70;
                uint64_t v19 = v71;
                if (v7 == v63)
                {
LABEL_59:

                  swift_bridgeObjectRelease();
                  LODWORD(v82) = 1;
                  int v38 = 1;
                  uint64_t v3 = v83;
                  uint64_t v7 = v75;
                  goto LABEL_25;
                }
              }
            }
            __break(1u);
LABEL_66:
            uint64_t v74 = v78;
            swift_bridgeObjectRetain();
            uint64_t v63 = sub_246AD8EC0();
            swift_bridgeObjectRelease();
          }

          swift_bridgeObjectRelease();
          LODWORD(v82) = 1;
          int v38 = 1;
        }
        goto LABEL_25;
      }
    }
    LODWORD(v82) = v35;
    int v38 = 0;
  }
LABEL_25:
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v34, v80, v6);
  uint64_t v46 = sub_246AD8AB0();
  os_log_type_t v47 = sub_246AD8CE0();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    v86[0] = v49;
    *(_DWORD *)uint64_t v48 = 136315906;
    uint64_t v85 = sub_246ACB68C(0xD000000000000018, 0x8000000246ADB500, v86);
    sub_246AD8D90();
    *(_WORD *)(v48 + 12) = 2048;
    uint64_t v85 = *(void *)&v33;
    sub_246AD8D90();
    *(_WORD *)(v48 + 22) = 2080;
    if (v38) {
      uint64_t v50 = 1702195828;
    }
    else {
      uint64_t v50 = 0x65736C6166;
    }
    if (v38) {
      unint64_t v51 = 0xE400000000000000;
    }
    else {
      unint64_t v51 = 0xE500000000000000;
    }
    uint64_t v85 = sub_246ACB68C(v50, v51, v86);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 32) = 2080;
    if (v79) {
      uint64_t v52 = 0x646573756170;
    }
    else {
      uint64_t v52 = 0x676E6979616C70;
    }
    if (v79) {
      unint64_t v53 = 0xE600000000000000;
    }
    else {
      unint64_t v53 = 0xE700000000000000;
    }
    uint64_t v85 = sub_246ACB68C(v52, v53, v86);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v46, v47, "%s - [resolved] liveProgress:%f; animated: %s; animatingState: %s;",
      (uint8_t *)v48,
      0x2Au);
    swift_arrayDestroy();
    uint64_t v54 = v49;
    uint64_t v3 = v83;
    MEMORY[0x24C541130](v54, -1, -1);
    MEMORY[0x24C541130](v48, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v84, v81);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v34, v6);
  }
  if (v82) {
    sub_246AB0DF4(1uLL);
  }
  uint64_t v55 = OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView;
  uint64_t v56 = *(void **)(v3 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  swift_beginAccess();
  char v57 = v89;
  id v58 = v56;
  sub_246AA9FC8(v57);

  uint64_t v59 = *(void **)(v3 + v55);
  swift_beginAccess();
  double v60 = *(double *)&v88;
  swift_beginAccess();
  char v61 = v87;
  id v62 = v59;
  sub_246AA73F4(v61, v60);
}

uint64_t sub_246AB09D8(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246A8604C(&qword_2691C12E0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246AD8AD0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2691C0220 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_246A8AB74(v7, (uint64_t)qword_2691D4018);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  char v12 = sub_246AD8AB0();
  os_log_type_t v13 = sub_246AD8CE0();
  if (os_log_type_enabled(v12, v13))
  {
    id v27 = v6;
    uint64_t v28 = v2;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v30[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    if (a1 >= 3)
    {
      uint64_t v29 = a1;
      uint64_t result = sub_246AD9070();
      __break(1u);
      return result;
    }
    uint64_t v16 = v15;
    uint64_t v29 = sub_246ACB68C(*(void *)&aIdealizelive_0[8 * a1], *(void *)&aD_3[8 * a1], v30);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v12, v13, "prepareNextSceneIfNeeded: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v16, -1, -1);
    MEMORY[0x24C541130](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v6 = v27;
    uint64_t v2 = v28;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  id v17 = (uint64_t *)(*(void *)(v2 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView)
                  + OBJC_IVAR___NTKEsterbrookSceneView_loadedScenes);
  swift_beginAccess();
  uint64_t v18 = *v17;
  if (*(void *)(v18 + 16) && (uint64_t v19 = sub_246ACBDC8(a1), (v20 & 1) != 0))
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)(v18 + 56);
    uint64_t v23 = type metadata accessor for Scene();
    uint64_t v24 = *(void *)(v23 - 8);
    sub_246AADE24(v22 + *(void *)(v24 + 72) * v21, (uint64_t)v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v6, 0, 1, v23);
    return sub_246AABBEC((uint64_t)v6, &qword_2691C12E0);
  }
  else
  {
    uint64_t v26 = type metadata accessor for Scene();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v6, 1, 1, v26);
    sub_246AABBEC((uint64_t)v6, &qword_2691C12E0);
    return sub_246AB0DF4(a1);
  }
}

uint64_t sub_246AB0DF4(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Scene();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246AD8AD0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2691C0220 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_246A8AB74(v7, (uint64_t)qword_2691D4018);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  char v12 = sub_246AD8AB0();
  os_log_type_t v13 = sub_246AD8CE0();
  if (!os_log_type_enabled(v12, v13))
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    goto LABEL_7;
  }
  v18[0] = v6;
  v18[1] = v2;
  uint64_t v14 = (uint8_t *)swift_slowAlloc();
  uint64_t v15 = swift_slowAlloc();
  uint64_t v20 = v15;
  *(_DWORD *)uint64_t v14 = 136315138;
  if (a1 < 3)
  {
    uint64_t v16 = v15;
    uint64_t v19 = sub_246ACB68C(*(void *)&aIdealizelive_0[8 * a1], *(void *)&aD_3[8 * a1], &v20);
    sub_246AD8D90();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v12, v13, "prepareNextScene: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v16, -1, -1);
    MEMORY[0x24C541130](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v6 = (char *)v18[0];
LABEL_7:
    swift_unknownObjectWeakInit();
    sub_246ACFAE4((uint64_t)v6);
    sub_246AB1E50((uint64_t)v6, (uint64_t)&v20, a1);
    sub_246AADE88((uint64_t)v6);
    return swift_unknownObjectWeakDestroy();
  }
  uint64_t v19 = a1;
  uint64_t result = sub_246AD9070();
  __break(1u);
  return result;
}

BOOL sub_246AB121C()
{
  uint64_t v1 = sub_246AD8A10();
  uint64_t v18 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246AD8A30();
  uint64_t v17 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246AD8980();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = OBJC_IVAR___NTKEsterbrookSceneCoordinator_colorPalette;
  char v12 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_colorPalette);
  sub_246AABC48(0, (unint64_t *)&unk_2691C12D0);
  if ((objc_msgSend(v12, sel_isKindOfClass_, swift_getObjCClassFromMetadata()) & 1) != 0
    || !objc_msgSend(*(id *)(v0 + v11), sel_isSundayOption))
  {
    return 0;
  }
  sub_246AAF2BC(v10);
  sub_246AD8A00();
  uint64_t v13 = v18;
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v3, *MEMORY[0x263F078E8], v1);
  uint64_t v14 = sub_246AD8A20();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v4);
  BOOL v15 = v14 == 1;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

void sub_246AB14CC()
{
  unint64_t v1 = sub_246AB24DC();
  if (v1 >> 62) {
LABEL_26:
  }
    uint64_t v2 = sub_246AD8EC0();
  else {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v2 >= 2)
  {
    while (1)
    {
      unint64_t v3 = sub_246AB24DC();
      unint64_t v4 = v3;
      if (v3 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = sub_246AD8EC0();
        swift_bridgeObjectRelease();
        if (!v12) {
          goto LABEL_5;
        }
        swift_bridgeObjectRetain();
        unint64_t v5 = sub_246AD8EC0();
        swift_bridgeObjectRelease();
        if ((v5 & 0x8000000000000000) != 0)
        {
          __break(1u);
          return;
        }
        if (!v5) {
          goto LABEL_25;
        }
LABEL_8:
        unint64_t v14 = 0;
        MEMORY[0x24C541140](&v14, 8);
        uint64_t v6 = (v14 * (unsigned __int128)v5) >> 64;
        if (v5 > v14 * v5)
        {
          unint64_t v7 = -(uint64_t)v5 % v5;
          if (v7 > v14 * v5)
          {
            do
            {
              unint64_t v14 = 0;
              MEMORY[0x24C541140](&v14, 8);
            }
            while (v7 > v14 * v5);
            uint64_t v6 = (v14 * (unsigned __int128)v5) >> 64;
          }
        }
        if ((v4 & 0xC000000000000001) != 0)
        {
          uint64_t v8 = (char *)MEMORY[0x24C540420](v6, v4);
        }
        else
        {
          if (v6 >= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_25:
            __break(1u);
            goto LABEL_26;
          }
          uint64_t v8 = (char *)*(id *)(v4 + 8 * v6 + 32);
        }
        uint64_t v9 = v8;
        swift_bridgeObjectRelease();
        uint64_t v10 = (char *)sub_246AB23A4();
        id v11 = *(id *)&v10[OBJC_IVAR___NTKEsterbrookScenePalette_background];

        LOBYTE(v10) = objc_msgSend(v11, sel_isEqual_, *(void *)&v9[OBJC_IVAR___NTKEsterbrookScenePalette_background]);
        if ((v10 & 1) == 0)
        {
          uint64_t v13 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___sundayWakeStyle);
          *(void *)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___sundayWakeStyle) = v9;

          return;
        }
      }
      else
      {
        unint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v5) {
          goto LABEL_8;
        }
LABEL_5:
        swift_bridgeObjectRelease();
      }
    }
  }
}

void sub_246AB1770()
{
  unint64_t v1 = *(char **)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_tritiumProgress);
  uint64_t v3 = OBJC_IVAR___NTKEsterbrookSceneView_tritiumProgress;
  *(void *)&v1[OBJC_IVAR___NTKEsterbrookSceneView_tritiumProgress] = v2;
  *(void *)(*(void *)&v1[OBJC_IVAR___NTKEsterbrookSceneView_sceneBackgroundView]
            + OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumProgress) = v2;
  unint64_t v4 = v1;
  sub_246AC475C();
  *(void *)(*(void *)&v4[OBJC_IVAR___NTKEsterbrookSceneView_dialView]
            + OBJC_IVAR___NTKEsterbrookSceneDialView_tritiumProgress) = *(void *)&v1[v3];
  sub_246A87328();
  sub_246AA7808();
}

void sub_246AB1838()
{
  uint64_t v1 = v0;
  if (qword_2691C0220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_246AD8AD0();
  sub_246A8AB74(v2, (uint64_t)qword_2691D4018);
  uint64_t v3 = sub_246AD8AB0();
  os_log_type_t v4 = sub_246AD8CE0();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_246A80000, v3, v4, "didTransitionToTritiumOn", v5, 2u);
    MEMORY[0x24C541130](v5, -1, -1);
  }

  *(void *)(v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_tritiumProgress) = 0x3FF0000000000000;
  sub_246AB1770();
  id v6 = *(id *)(v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_faceState);
  sub_246AAFE90(v6, 1);
}

void sub_246AB19AC()
{
  uint64_t v1 = v0;
  if (qword_2691C0220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_246AD8AD0();
  sub_246A8AB74(v2, (uint64_t)qword_2691D4018);
  uint64_t v3 = sub_246AD8AB0();
  os_log_type_t v4 = sub_246AD8CE0();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_246A80000, v3, v4, "didTransitionToTritiumOff", v5, 2u);
    MEMORY[0x24C541130](v5, -1, -1);
  }

  *(void *)(v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_tritiumProgress) = 0;
  sub_246AB1770();
  id v6 = *(id *)(v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_faceState);
  sub_246AAFE90(v6, 1);
}

void sub_246AB1B1C()
{
  uint64_t v1 = v0;
  if (qword_2691C0220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_246AD8AD0();
  sub_246A8AB74(v2, (uint64_t)qword_2691D4018);
  uint64_t v3 = sub_246AD8AB0();
  os_log_type_t v4 = sub_246AD8CE0();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_246A80000, v3, v4, "prepareForTransitionToTritiumOn", v5, 2u);
    MEMORY[0x24C541130](v5, -1, -1);
  }

  id v6 = *(id *)(v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  sub_246AA9FC8(1);
}

void sub_246AB1CEC()
{
  uint64_t v1 = v0;
  if (qword_2691C0220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_246AD8AD0();
  sub_246A8AB74(v2, (uint64_t)qword_2691D4018);
  uint64_t v3 = sub_246AD8AB0();
  os_log_type_t v4 = sub_246AD8D00();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_246A80000, v3, v4, "Received a time zone or significant time change notification.", v5, 2u);
    MEMORY[0x24C541130](v5, -1, -1);
  }

  id v6 = *(id *)(v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  sub_246AA89D8(1);
}

void sub_246AB1E50(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_246AD8B20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x24C5411D0](a2);
  if (v10)
  {
    id v11 = (char *)v10;
    sub_246AABC48(0, (unint64_t *)&qword_2691C1130);
    *uint64_t v9 = sub_246AD8D30();
    (*(void (**)(uint64_t *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F0E0], v6);
    char v12 = sub_246AD8B30();
    (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
    if (v12)
    {
      id v13 = *(id *)&v11[OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView];
      sub_246AA65E0(a1, a3);

      if (a3 == 1 && (uint64_t v14 = MEMORY[0x24C5411D0](&v11[OBJC_IVAR___NTKEsterbrookSceneCoordinator_delegate])) != 0)
      {
        BOOL v15 = (void *)v14;
        type metadata accessor for Scene();
        uint64_t v16 = (void *)sub_246AD8B80();
        objc_msgSend(v15, sel_didLoadSceneNamed_, v16);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    else
    {
      __break(1u);
    }
  }
}

id sub_246AB23A4()
{
  uint64_t v1 = OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___sundayWakeStyle;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___sundayWakeStyle);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___sundayWakeStyle);
  }
  else
  {
    os_log_type_t v4 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_colorPalette);
    unint64_t v5 = (objc_class *)type metadata accessor for ScenePalette();
    id v6 = objc_allocWithZone(v5);
    swift_unknownObjectRetain();
    uint64_t v7 = (char *)v6;
    id v8 = objc_msgSend(v4, sel_background);
    *(void *)&v7[OBJC_IVAR___NTKEsterbrookScenePalette_background] = v8;
    id v9 = objc_msgSend(v4, sel_overlay);
    *(void *)&v7[OBJC_IVAR___NTKEsterbrookScenePalette_overlay] = v9;
    id v10 = objc_msgSend(v4, sel_secondHand);
    *(void *)&v7[OBJC_IVAR___NTKEsterbrookScenePalette_secondHand] = v10;

    v15.receiver = v7;
    v15.super_class = v5;
    id v11 = objc_msgSendSuper2(&v15, sel_init);
    swift_unknownObjectRelease();
    char v12 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v11;
    id v3 = v11;

    uint64_t v2 = 0;
  }
  id v13 = v2;
  return v3;
}

uint64_t sub_246AB24DC()
{
  uint64_t v1 = OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___allSundayStyles;
  if (*(void *)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___allSundayStyles))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___allSundayStyles);
  }
  else
  {
    uint64_t v2 = sub_246AB2540();
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_246AB2540()
{
  uint64_t v21 = MEMORY[0x263F8EE78];
  type metadata accessor for SceneLoader();
  id v17 = self;
  for (uint64_t i = 1; i != 13; ++i)
  {
    sub_246A8604C(&qword_2691C0460);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_246ADC8A0;
    *(void *)(v1 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v1 + 64) = MEMORY[0x263F8D750];
    *(void *)(v1 + 32) = i;
    sub_246AD8BC0();
    uint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
    sub_246AD8DF0();
    swift_bridgeObjectRelease();
    uint64_t v19 = 0x6F72627265747365;
    unint64_t v20 = 0xEB000000002F6B6FLL;
    sub_246AD8BF0();
    sub_246AD8BF0();
    id v2 = sub_246A93A20();
    id v3 = (void *)sub_246AD8B80();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v17, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v3, v2, 0);

    if (v4)
    {
      uint64_t v19 = 0;
      unint64_t v20 = 0xE000000000000000;
      sub_246AD8DF0();
      swift_bridgeObjectRelease();
      uint64_t v19 = 0x6F72627265747365;
      unint64_t v20 = 0xEB000000002F6B6FLL;
      sub_246AD8BF0();
      sub_246AD8BF0();
      id v5 = sub_246A93A20();
      id v6 = (void *)sub_246AD8B80();
      swift_bridgeObjectRelease();
      id v7 = objc_msgSend(v17, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v6, v5, 0);

      if (v7)
      {
        uint64_t v19 = 0;
        unint64_t v20 = 0xE000000000000000;
        sub_246AD8DF0();
        swift_bridgeObjectRelease();
        uint64_t v19 = 0x6F72627265747365;
        unint64_t v20 = 0xEB000000002F6B6FLL;
        sub_246AD8BF0();
        swift_bridgeObjectRelease();
        sub_246AD8BF0();
        id v8 = sub_246A93A20();
        id v9 = (void *)sub_246AD8B80();
        swift_bridgeObjectRelease();
        id v10 = objc_msgSend(v17, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v9, v8, 0);

        if (v10)
        {
          id v11 = (objc_class *)type metadata accessor for ScenePalette();
          char v12 = (char *)objc_allocWithZone(v11);
          *(void *)&v12[OBJC_IVAR___NTKEsterbrookScenePalette_background] = v4;
          *(void *)&v12[OBJC_IVAR___NTKEsterbrookScenePalette_overlay] = v7;
          *(void *)&v12[OBJC_IVAR___NTKEsterbrookScenePalette_secondHand] = v10;
          v18.receiver = v12;
          v18.super_class = v11;
          id v13 = v4;
          id v14 = v7;
          id v15 = v10;
          objc_msgSendSuper2(&v18, sel_init);
          MEMORY[0x24C540250]();
          if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_246AD8C80();
          }
          sub_246AD8C90();
          sub_246AD8C70();
        }
        else
        {
        }
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return v21;
}

void sub_246AB29D0()
{
  sub_246AB2AB8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_246AB2AB8()
{
  if (!qword_2691C1258)
  {
    sub_246AD8980();
    unint64_t v0 = sub_246AD8D80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2691C1258);
    }
  }
}

uint64_t sub_246AB2B10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246A8604C((uint64_t *)&unk_2691C12C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_246AB2B78(uint64_t (*a1)(void))
{
  return a1();
}

void sub_246AB2BA0(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_246AD8D90();
  *a1 = v7;
  id v8 = *a2;
  if (*a2)
  {
    *id v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_246AB2C58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246A8604C((uint64_t *)&unk_2691C12C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void (*sub_246AB2CC0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  id v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_246AB2D70(v6, a2, a3);
  return sub_246AB2D28;
}

void sub_246AB2D28(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_246AB2D70(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  id v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x24C540420](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)id v3 = v4;
    return sub_246AB2DF0;
  }
  __break(1u);
  return result;
}

void sub_246AB2DF0(id *a1)
{
}

void sub_246AB2DF8()
{
  uint64_t v1 = v0;
  if (qword_2691C0220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_246AD8AD0();
  sub_246A8AB74(v2, (uint64_t)qword_2691D4018);
  id v3 = sub_246AD8AB0();
  os_log_type_t v4 = sub_246AD8CE0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_246A80000, v3, v4, "screenDidTurnOff", v5, 2u);
    MEMORY[0x24C541130](v5, -1, -1);
  }

  id v6 = *(id *)(v1 + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  sub_246AA6F30(1uLL);

  if (sub_246AB121C())
  {
    sub_246AB14CC();
  }
}

id sub_246AB2F20(id result)
{
  if (result)
  {
    uint64_t v2 = result;
    id v3 = objc_allocWithZone(MEMORY[0x263EFD188]);
    os_log_type_t v4 = v1;
    id v5 = objc_msgSend(v3, sel_initWithDevice_identitySizeClass_, v2, 6);
    objc_msgSend(v5, sel_scaledValue_, 44.5);
    uint64_t v7 = v6;
    objc_msgSend(v5, sel_scaledValue_, 83.0);
    uint64_t v9 = v8;
    objc_msgSend(v5, sel_scaledValue_, 96.0);
    uint64_t v11 = v10;

    char v12 = &v4[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView_metrics];
    *(void *)char v12 = v7;
    *((void *)v12 + 1) = v9;
    *((void *)v12 + 2) = v11;

    v14.receiver = v4;
    v14.super_class = (Class)type metadata accessor for NTKEsterbrookHandsView();
    id v13 = objc_msgSendSuper2(&v14, sel_initForDevice_, v2);

    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_246AB3274()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NTKEsterbrookHandsView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NTKEsterbrookHandsView()
{
  return self;
}

__n128 initializeWithTake for SceneBoost(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for NTKEsterbrookHandsView.Metrics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NTKEsterbrookHandsView.Metrics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for NTKEsterbrookHandsView.Metrics()
{
  return &type metadata for NTKEsterbrookHandsView.Metrics;
}

void *sub_246AB333C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_246AD89C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_246AB3420(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_246AB34B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_246AB3544(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_246AB35D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_246AB3664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246AB3678);
}

uint64_t sub_246AB3678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 4) {
      return v10 - 3;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_246AB3734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246AB3748);
}

uint64_t sub_246AB3748(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_246AD89C0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 28)) = a2 + 3;
  }
  return result;
}

uint64_t type metadata accessor for Timing(uint64_t a1)
{
  return sub_246AB3D70(a1, (uint64_t *)&unk_2691C12F0);
}

uint64_t sub_246AB3824()
{
  uint64_t result = sub_246AD89C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_246AB38C8(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_246AD89C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  }
  return a1;
}

uint64_t sub_246AB399C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_246AB3A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_246AB3AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_246AB3B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_246AB3BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246AB3BC4);
}

uint64_t sub_246AB3BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 3) {
      return v10 - 2;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_246AB3C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246AB3C94);
}

uint64_t sub_246AB3C94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_246AD89C0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
  return result;
}

uint64_t type metadata accessor for Timeline(uint64_t a1)
{
  return sub_246AB3D70(a1, (uint64_t *)&unk_2691C1300);
}

uint64_t sub_246AB3D70(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246AB3DA8()
{
  uint64_t result = sub_246AD89C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Timeline.FPS()
{
  return &type metadata for Timeline.FPS;
}

BOOL sub_246AB3E60(char *a1, char *a2)
{
  return qword_246AE22D0[*a1] == qword_246AE22D0[*a2];
}

uint64_t sub_246AB3E84()
{
  return sub_246AD9140();
}

uint64_t sub_246AB3ED4()
{
  return sub_246AD9110();
}

uint64_t sub_246AB3F0C()
{
  return sub_246AD9140();
}

uint64_t *sub_246AB3F58@<X0>(uint64_t *result@<X0>, char *a2@<X8>)
{
  uint64_t v2 = *result;
  if (*result == 12) {
    char v3 = 0;
  }
  else {
    char v3 = 3;
  }
  if (v2 == 6) {
    char v4 = 1;
  }
  else {
    char v4 = v3;
  }
  if (v2 == 3) {
    char v5 = 2;
  }
  else {
    char v5 = v4;
  }
  *a2 = v5;
  return result;
}

void sub_246AB3F88(void *a1@<X8>)
{
  *a1 = qword_246AE22D0[*v1];
}

unint64_t sub_246AB3FA4()
{
  unint64_t result = qword_2691C1310;
  if (!qword_2691C1310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1310);
  }
  return result;
}

unint64_t sub_246AB3FFC()
{
  unint64_t result = qword_2691C1318;
  if (!qword_2691C1318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1318);
  }
  return result;
}

uint64_t sub_246AB4050(char a1)
{
  return *(void *)&aFreeze_0[8 * a1];
}

uint64_t sub_246AB4070()
{
  return sub_246AB4050(*v0);
}

uint64_t sub_246AB4078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AB5BD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB40A0(uint64_t a1)
{
  unint64_t v2 = sub_246AB63F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB40DC(uint64_t a1)
{
  unint64_t v2 = sub_246AB63F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB4118(uint64_t a1)
{
  unint64_t v2 = sub_246AB649C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB4154(uint64_t a1)
{
  unint64_t v2 = sub_246AB649C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB4190(uint64_t a1)
{
  unint64_t v2 = sub_246AB6544();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB41CC(uint64_t a1)
{
  unint64_t v2 = sub_246AB6544();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB4208(uint64_t a1)
{
  unint64_t v2 = sub_246AB6448();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB4244(uint64_t a1)
{
  unint64_t v2 = sub_246AB6448();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB4280(uint64_t a1)
{
  unint64_t v2 = sub_246AB64F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB42BC(uint64_t a1)
{
  unint64_t v2 = sub_246AB64F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB4304@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_246AD8F20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_246AB4358@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_246AB5D5C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_246AB4384@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_246AD8F20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_246AB43DC(uint64_t a1)
{
  unint64_t v2 = sub_246AB5948();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB4418(uint64_t a1)
{
  unint64_t v2 = sub_246AB5948();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB4454@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v4 = sub_246A8604C(&qword_2691C1340);
  uint64_t v16 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Timeline(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246AD89B0();
  v9[*(int *)(v7 + 20)] = 0;
  sub_246A8A6E4(a1, a1[3]);
  sub_246AB5948();
  sub_246AD9150();
  if (v2)
  {
    sub_246A85F9C((uint64_t)a1);
    uint64_t v12 = sub_246AD89C0();
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v9, v12);
  }
  else
  {
    uint64_t v10 = v16;
    uint64_t v11 = v17;
    uint64_t v13 = sub_246AD8F90();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v4);
    *(void *)&v9[*(int *)(v7 + 24)] = v13;
    sub_246AB5A44((uint64_t)v9, v11, type metadata accessor for Timeline);
    sub_246A85F9C((uint64_t)a1);
    return sub_246AB5AAC((uint64_t)v9, type metadata accessor for Timeline);
  }
}

uint64_t sub_246AB469C(char a1)
{
  return *(void *)&aStart_5[8 * a1];
}

uint64_t sub_246AB46BC()
{
  uint64_t v0 = type metadata accessor for Timeline(0);
  sub_246A8AB10(v0, qword_2691D4110);
  uint64_t v1 = sub_246A8AB74(v0, (uint64_t)qword_2691D4110);
  uint64_t result = sub_246AD89B0();
  *(unsigned char *)(v1 + *(int *)(v0 + 20)) = 0;
  *(void *)(v1 + *(int *)(v0 + 24)) = 60;
  return result;
}

uint64_t sub_246AB4720@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246AB4454(a1, a2);
}

uint64_t sub_246AB4738(void *a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C1350);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246AB5948();
  sub_246AD9160();
  sub_246AD9010();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL sub_246AB4874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_246AD89A0() & 1) != 0
      && qword_246AE22D0[*(char *)(a1 + *(int *)(a3 + 20))] == qword_246AE22D0[*(char *)(a2 + *(int *)(a3 + 20))]
      && *(void *)(a1 + *(int *)(a3 + 24)) == *(void *)(a2 + *(int *)(a3 + 24));
}

uint64_t sub_246AB48EC()
{
  return sub_246AD9140();
}

uint64_t sub_246AB49B0()
{
  return sub_246AD9110();
}

uint64_t sub_246AB4A60()
{
  return sub_246AD9140();
}

uint64_t sub_246AB4B24(char *a1, char *a2)
{
  return sub_246A9BA2C(*a1, *a2);
}

uint64_t sub_246AB4B30()
{
  return sub_246A9D234();
}

uint64_t sub_246AB4B38()
{
  return sub_246A9D3F0();
}

uint64_t sub_246AB4B40()
{
  return sub_246A9D860();
}

uint64_t sub_246AB4B48@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246AB5D70();
  *a1 = result;
  return result;
}

uint64_t sub_246AB4B78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_246AB469C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_246AB4BA4()
{
  return sub_246AB469C(*v0);
}

uint64_t sub_246AB4BAC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246AB5D70();
  *a1 = result;
  return result;
}

uint64_t sub_246AB4BD4(uint64_t a1)
{
  unint64_t v2 = sub_246AB599C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB4C10(uint64_t a1)
{
  unint64_t v2 = sub_246AB599C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB4C4C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_246A8604C(&qword_2691C1370);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_246A8A6E4(a1, a1[3]);
  sub_246AB599C();
  sub_246AD9160();
  uint64_t v9 = type metadata accessor for Timing(0);
  v11[15] = 0;
  sub_246AD9010();
  if (!v2)
  {
    v11[14] = 1;
    sub_246AD9010();
    v11[13] = *(unsigned char *)(v3 + *(int *)(v9 + 28));
    v11[12] = 2;
    sub_246AB5B0C();
    sub_246AD9020();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_246AB4E04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v4 = sub_246A8604C(&qword_2691C1358);
  uint64_t v14 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for Timing(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246AD89B0();
  sub_246A8A6E4(a1, a1[3]);
  sub_246AB599C();
  sub_246AD9150();
  if (v2)
  {
    sub_246A85F9C((uint64_t)a1);
    uint64_t v12 = sub_246AD89C0();
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v9, v12);
  }
  else
  {
    uint64_t v10 = v14;
    uint64_t v11 = v15;
    char v19 = 0;
    *(void *)&v9[v7[5]] = sub_246AD8F90();
    char v18 = 1;
    *(void *)&v9[v7[6]] = sub_246AD8F90();
    char v16 = 2;
    sub_246AB59F0();
    sub_246AD8FA0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v4);
    v9[v7[7]] = v17;
    sub_246AB5A44((uint64_t)v9, v11, type metadata accessor for Timing);
    sub_246A85F9C((uint64_t)a1);
    return sub_246AB5AAC((uint64_t)v9, type metadata accessor for Timing);
  }
}

uint64_t sub_246AB50B8(void *a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C13D0);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C13D8);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v5);
  id v25 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C13E0);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C13E8);
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_246A8604C(&qword_2691C13F0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246AB63F4();
  sub_246AD9160();
  switch((char)v31)
  {
    case 1:
      char v33 = 1;
      sub_246AB64F0();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
      break;
    case 2:
      char v34 = 2;
      sub_246AB649C();
      char v17 = v25;
      sub_246AD8FC0();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
      goto LABEL_5;
    case 3:
      char v35 = 3;
      sub_246AB6448();
      char v17 = v28;
      sub_246AD8FC0();
      uint64_t v19 = v29;
      uint64_t v18 = v30;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_246AB6544();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_246AB5500@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246AB4E04(a1, a2);
}

uint64_t sub_246AB5518(void *a1)
{
  return sub_246AB4C4C(a1);
}

uint64_t sub_246AB5534()
{
  return sub_246AD9140();
}

uint64_t sub_246AB55FC()
{
  return sub_246AD9110();
}

uint64_t sub_246AB56AC()
{
  return sub_246AD9140();
}

void sub_246AB5770(void *a1@<X8>)
{
  *a1 = &unk_26FB02288;
}

char *sub_246AB5780@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246AB5DBC(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_246AB57AC(void *a1)
{
  return sub_246AB50B8(a1, *v1);
}

unint64_t sub_246AB57CC()
{
  unint64_t result = qword_2691C1320;
  if (!qword_2691C1320)
  {
    sub_246A8A7DC(&qword_2691C1328);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1320);
  }
  return result;
}

uint64_t sub_246AB5828()
{
  return sub_246AB58B8(&qword_2691C0488, MEMORY[0x263F07508]);
}

uint64_t sub_246AB5870()
{
  return sub_246AB58B8(&qword_2691C1330, (void (*)(uint64_t))type metadata accessor for Timing);
}

uint64_t sub_246AB58B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246AB5900()
{
  return sub_246AB58B8(&qword_2691C1338, (void (*)(uint64_t))type metadata accessor for Timeline);
}

unint64_t sub_246AB5948()
{
  unint64_t result = qword_2691C1348;
  if (!qword_2691C1348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1348);
  }
  return result;
}

unint64_t sub_246AB599C()
{
  unint64_t result = qword_2691C1360;
  if (!qword_2691C1360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1360);
  }
  return result;
}

unint64_t sub_246AB59F0()
{
  unint64_t result = qword_2691C1368;
  if (!qword_2691C1368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1368);
  }
  return result;
}

uint64_t sub_246AB5A44(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_246AB5AAC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_246AB5B0C()
{
  unint64_t result = qword_2691C1378;
  if (!qword_2691C1378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1378);
  }
  return result;
}

BOOL sub_246AB5B60(uint64_t a1, uint64_t a2)
{
  if ((sub_246AD89A0() & 1) != 0
    && (uint64_t v4 = (int *)type metadata accessor for Timing(0), *(void *)(a1 + v4[5]) == *(void *)(a2 + v4[5]))
    && *(void *)(a1 + v4[6]) == *(void *)(a2 + v4[6]))
  {
    return *(unsigned __int8 *)(a1 + v4[7]) == *(unsigned __int8 *)(a2 + v4[7]);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_246AB5BD8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x657A65657266 && a2 == 0xE600000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65766F6D6572 && a2 == 0xE600000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74754F65646166 && a2 == 0xE700000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1886351212 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_246AB5D5C()
{
  return 0x73656D617266;
}

uint64_t sub_246AB5D70()
{
  unint64_t v0 = sub_246AD8F20();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

char *sub_246AB5DBC(void *a1)
{
  uint64_t v41 = sub_246A8604C(&qword_2691C1380);
  uint64_t v45 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  unint64_t v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_246A8604C(&qword_2691C1388);
  uint64_t v42 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  char v43 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246A8604C(&qword_2691C1390);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C1398);
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C13A0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v46 = a1;
  sub_246A8A6E4(a1, v14);
  sub_246AB63F4();
  uint64_t v15 = v47;
  sub_246AD9150();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v35 = v7;
  uint64_t v36 = v9;
  char v16 = v43;
  char v17 = v44;
  uint64_t v47 = 0;
  uint64_t v18 = v45;
  uint64_t v19 = v11;
  unint64_t v20 = v13;
  uint64_t v21 = sub_246AD8FB0();
  uint64_t v22 = (char *)v21;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v25 = sub_246AD8E70();
    swift_allocError();
    uint64_t v13 = v22;
    uint64_t v26 = v10;
    uint64_t v28 = v27;
    sub_246A8604C(&qword_2691C05D0);
    *uint64_t v28 = &type metadata for Timing.EndBehavior;
    sub_246AD8F40();
    sub_246AD8E30();
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
      sub_246AB64F0();
      uint64_t v31 = v47;
      sub_246AD8F30();
      if (v31) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
      goto LABEL_14;
    case 2:
      char v50 = 2;
      sub_246AB649C();
      uint64_t v32 = v47;
      sub_246AD8F30();
      if (v32) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v40);
      goto LABEL_14;
    case 3:
      char v51 = 3;
      sub_246AB6448();
      uint64_t v33 = v47;
      sub_246AD8F30();
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
      sub_246AB6544();
      uint64_t v23 = v36;
      uint64_t v24 = v47;
      sub_246AD8F30();
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
  sub_246A85F9C(v29);
  return v13;
}

unint64_t sub_246AB63F4()
{
  unint64_t result = qword_2691C13A8;
  if (!qword_2691C13A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C13A8);
  }
  return result;
}

unint64_t sub_246AB6448()
{
  unint64_t result = qword_2691C13B0;
  if (!qword_2691C13B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C13B0);
  }
  return result;
}

unint64_t sub_246AB649C()
{
  unint64_t result = qword_2691C13B8;
  if (!qword_2691C13B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C13B8);
  }
  return result;
}

unint64_t sub_246AB64F0()
{
  unint64_t result = qword_2691C13C0;
  if (!qword_2691C13C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C13C0);
  }
  return result;
}

unint64_t sub_246AB6544()
{
  unint64_t result = qword_2691C13C8;
  if (!qword_2691C13C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C13C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for Timing.EndBehavior.CodingKeys()
{
  return &type metadata for Timing.EndBehavior.CodingKeys;
}

ValueMetadata *type metadata accessor for Timing.EndBehavior.FreezeCodingKeys()
{
  return &type metadata for Timing.EndBehavior.FreezeCodingKeys;
}

ValueMetadata *type metadata accessor for Timing.EndBehavior.RemoveCodingKeys()
{
  return &type metadata for Timing.EndBehavior.RemoveCodingKeys;
}

ValueMetadata *type metadata accessor for Timing.EndBehavior.FadeOutCodingKeys()
{
  return &type metadata for Timing.EndBehavior.FadeOutCodingKeys;
}

ValueMetadata *type metadata accessor for Timing.EndBehavior.LoopCodingKeys()
{
  return &type metadata for Timing.EndBehavior.LoopCodingKeys;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion8TimelineV3FPSOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AB66B8);
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

ValueMetadata *type metadata accessor for Timing.CodingKeys()
{
  return &type metadata for Timing.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Timeline.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x246AB678CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Timeline.CodingKeys()
{
  return &type metadata for Timeline.CodingKeys;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion6TimingV11EndBehaviorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AB6890);
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

ValueMetadata *type metadata accessor for Timing.EndBehavior()
{
  return &type metadata for Timing.EndBehavior;
}

unint64_t sub_246AB68CC()
{
  unint64_t result = qword_2691C13F8;
  if (!qword_2691C13F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C13F8);
  }
  return result;
}

unint64_t sub_246AB6924()
{
  unint64_t result = qword_2691C1400;
  if (!qword_2691C1400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1400);
  }
  return result;
}

unint64_t sub_246AB697C()
{
  unint64_t result = qword_2691C1408;
  if (!qword_2691C1408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1408);
  }
  return result;
}

unint64_t sub_246AB69D4()
{
  unint64_t result = qword_2691C1410;
  if (!qword_2691C1410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1410);
  }
  return result;
}

unint64_t sub_246AB6A2C()
{
  unint64_t result = qword_2691C1418;
  if (!qword_2691C1418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1418);
  }
  return result;
}

unint64_t sub_246AB6A84()
{
  unint64_t result = qword_2691C1420;
  if (!qword_2691C1420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1420);
  }
  return result;
}

unint64_t sub_246AB6ADC()
{
  unint64_t result = qword_2691C1428;
  if (!qword_2691C1428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1428);
  }
  return result;
}

unint64_t sub_246AB6B34()
{
  unint64_t result = qword_2691C1430;
  if (!qword_2691C1430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1430);
  }
  return result;
}

unint64_t sub_246AB6B8C()
{
  unint64_t result = qword_2691C1438;
  if (!qword_2691C1438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1438);
  }
  return result;
}

unint64_t sub_246AB6BE4()
{
  unint64_t result = qword_2691C1440;
  if (!qword_2691C1440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1440);
  }
  return result;
}

unint64_t sub_246AB6C3C()
{
  unint64_t result = qword_2691C1448;
  if (!qword_2691C1448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1448);
  }
  return result;
}

unint64_t sub_246AB6C94()
{
  unint64_t result = qword_2691C1450;
  if (!qword_2691C1450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1450);
  }
  return result;
}

unint64_t sub_246AB6CEC()
{
  unint64_t result = qword_2691C1458;
  if (!qword_2691C1458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1458);
  }
  return result;
}

unint64_t sub_246AB6D44()
{
  unint64_t result = qword_2691C1460;
  if (!qword_2691C1460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1460);
  }
  return result;
}

unint64_t sub_246AB6D9C()
{
  unint64_t result = qword_2691C1468;
  if (!qword_2691C1468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1468);
  }
  return result;
}

unint64_t sub_246AB6DF4()
{
  unint64_t result = qword_2691C1470;
  if (!qword_2691C1470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1470);
  }
  return result;
}

unint64_t sub_246AB6E4C()
{
  unint64_t result = qword_2691C1478;
  if (!qword_2691C1478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1478);
  }
  return result;
}

unint64_t sub_246AB6EA4()
{
  unint64_t result = qword_2691C1480;
  if (!qword_2691C1480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1480);
  }
  return result;
}

unint64_t sub_246AB6EF8(unint64_t a1, double a2)
{
  char v3 = sub_246ABA624(a2);
  switch((char)a1)
  {
    case 1:
      return 1;
    case 2:
      return 0x1010100uLL >> (8 * (v3 & 0x1Fu));
    case 3:
      char v4 = 8 * (v3 & 0x1F);
      unint64_t v5 = 0x10000000101;
      goto LABEL_7;
    case 4:
      char v4 = 8 * (v3 & 0x1F);
      unint64_t v5 = 0x101010000;
      goto LABEL_7;
    case 5:
      char v4 = 8 * (v3 & 0x1F);
      unint64_t v5 = 0x10100000001;
LABEL_7:
      a1 = v5 >> v4;
      break;
    default:
      return a1;
  }
  return a1;
}

uint64_t sub_246AB6FAC(char a1)
{
  return qword_246AE4528[a1];
}

uint64_t sub_246AB6FCC(char a1)
{
  return *(void *)&aCenterpiground[8 * a1];
}

uint64_t sub_246AB6FEC(uint64_t a1)
{
  unint64_t v2 = sub_246ABE240();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7028(uint64_t a1)
{
  unint64_t v2 = sub_246ABE240();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7064(uint64_t a1)
{
  unint64_t v2 = sub_246ABE144();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB70A0(uint64_t a1)
{
  unint64_t v2 = sub_246ABE144();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB70DC()
{
  return sub_246AB6FAC(*v0);
}

uint64_t sub_246AB70E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABB4FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB710C(uint64_t a1)
{
  unint64_t v2 = sub_246ABE0F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7148(uint64_t a1)
{
  unint64_t v2 = sub_246ABE0F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7184(uint64_t a1)
{
  unint64_t v2 = sub_246ABE1EC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB71C0(uint64_t a1)
{
  unint64_t v2 = sub_246ABE1EC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB71FC(uint64_t a1)
{
  unint64_t v2 = sub_246ABE198();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7238(uint64_t a1)
{
  unint64_t v2 = sub_246ABE198();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7274(uint64_t a1)
{
  unint64_t v2 = sub_246ABE294();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB72B0(uint64_t a1)
{
  unint64_t v2 = sub_246ABE294();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB72EC(uint64_t a1)
{
  unint64_t v2 = sub_246ABEA70();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7328(uint64_t a1)
{
  unint64_t v2 = sub_246ABEA70();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7364()
{
  return sub_246AB6FCC(*v0);
}

uint64_t sub_246AB736C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABB6C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB7394(uint64_t a1)
{
  unint64_t v2 = sub_246ABE920();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB73D0(uint64_t a1)
{
  unint64_t v2 = sub_246ABE920();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB740C(uint64_t a1)
{
  unint64_t v2 = sub_246ABEA1C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7448(uint64_t a1)
{
  unint64_t v2 = sub_246ABEA1C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7484(uint64_t a1)
{
  unint64_t v2 = sub_246ABE9C8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB74C0(uint64_t a1)
{
  unint64_t v2 = sub_246ABE9C8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB74FC(uint64_t a1)
{
  unint64_t v2 = sub_246ABE974();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7538(uint64_t a1)
{
  unint64_t v2 = sub_246ABE974();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7574(uint64_t a1)
{
  unint64_t v2 = sub_246ABD954();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB75B0(uint64_t a1)
{
  unint64_t v2 = sub_246ABD954();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB75EC(char a1)
{
  if (a1) {
    return 0x6D6F74746F62;
  }
  else {
    return 0x7265746E6563;
  }
}

unint64_t sub_246AB7614(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unsigned int v3 = 1953656686;
      return v3 | 0x7361656800000000;
    case 3:
      unsigned int v4 = 1953656686;
      goto LABEL_8;
    case 4:
      unsigned int v3 = 1953853299;
      return v3 | 0x7361656800000000;
    case 5:
      unsigned int v4 = 1953853299;
LABEL_8:
      unint64_t result = v4 | 0x7365776800000000;
      break;
    default:
      unint64_t result = 0x7369776B636F6C63;
      break;
  }
  return result;
}

uint64_t sub_246AB76D4(char a1)
{
  return *(void *)&aNone_5[8 * a1];
}

uint64_t sub_246AB76F4(char a1)
{
  if (a1) {
    return 0x536C616974696E69;
  }
  else {
    return 0x6F69746365726964;
  }
}

uint64_t sub_246AB7738(uint64_t a1)
{
  unint64_t v2 = sub_246ABD700();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7774(uint64_t a1)
{
  unint64_t v2 = sub_246ABD700();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB77B0(uint64_t a1)
{
  unint64_t v2 = sub_246ABD754();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB77EC(uint64_t a1)
{
  unint64_t v2 = sub_246ABD754();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7828()
{
  return sub_246AB75EC(*v0);
}

uint64_t sub_246AB7830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABB868(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB7858(uint64_t a1)
{
  unint64_t v2 = sub_246ABD6AC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7894(uint64_t a1)
{
  unint64_t v2 = sub_246ABD6AC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB78D0(uint64_t a1)
{
  unint64_t v2 = sub_246ABFEC4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB790C(uint64_t a1)
{
  unint64_t v2 = sub_246ABFEC4();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_246AB7948()
{
  return sub_246AB7614(*v0);
}

uint64_t sub_246AB7950@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABB944(a1, a2);
  *a3 = result;
  return result;
}

void sub_246AB7978(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_246AB7984(uint64_t a1)
{
  unint64_t v2 = sub_246ABFCCC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB79C0(uint64_t a1)
{
  unint64_t v2 = sub_246ABFCCC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB79FC(uint64_t a1)
{
  unint64_t v2 = sub_246ABFE70();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7A38(uint64_t a1)
{
  unint64_t v2 = sub_246ABFE70();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7A74(uint64_t a1)
{
  unint64_t v2 = sub_246ABFE1C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7AB0(uint64_t a1)
{
  unint64_t v2 = sub_246ABFE1C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7AEC(uint64_t a1)
{
  unint64_t v2 = sub_246ABFDC8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7B28(uint64_t a1)
{
  unint64_t v2 = sub_246ABFDC8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7B64(uint64_t a1)
{
  unint64_t v2 = sub_246ABFD74();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7BA0(uint64_t a1)
{
  unint64_t v2 = sub_246ABFD74();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7BDC(uint64_t a1)
{
  unint64_t v2 = sub_246ABFD20();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7C18(uint64_t a1)
{
  unint64_t v2 = sub_246ABFD20();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7C54()
{
  return sub_246AB76D4(*v0);
}

uint64_t sub_246AB7C5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABBBB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB7C84(uint64_t a1)
{
  unint64_t v2 = sub_246ABF230();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7CC0(uint64_t a1)
{
  unint64_t v2 = sub_246ABF230();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7CFC()
{
  return sub_246AB76F4(*v0);
}

uint64_t sub_246AB7D04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABBD3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB7D2C(uint64_t a1)
{
  unint64_t v2 = sub_246ABF284();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7D68(uint64_t a1)
{
  unint64_t v2 = sub_246ABF284();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7DA4(uint64_t a1)
{
  unint64_t v2 = sub_246ABF3D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7DE0(uint64_t a1)
{
  unint64_t v2 = sub_246ABF3D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7E1C(uint64_t a1)
{
  unint64_t v2 = sub_246ABF428();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7E58(uint64_t a1)
{
  unint64_t v2 = sub_246ABF428();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7E94(uint64_t a1)
{
  unint64_t v2 = sub_246ABF380();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB7ED0(uint64_t a1)
{
  unint64_t v2 = sub_246ABF380();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB7F0C(char a1)
{
  if (a1) {
    return 0x6E656D6E67696C61;
  }
  else {
    return 28532;
  }
}

uint64_t sub_246AB7F3C(char a1)
{
  return qword_246AE45F8[a1];
}

uint64_t sub_246AB7F5C(char a1)
{
  return *(void *)&aCoordinaanchor[8 * a1];
}

uint64_t sub_246AB7F7C(char a1)
{
  return *(void *)&aFrom_0[8 * a1];
}

uint64_t sub_246AB7F9C()
{
  return sub_246AB7F0C(*v0);
}

uint64_t sub_246AB7FA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABBE40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB7FCC(uint64_t a1)
{
  unint64_t v2 = sub_246ABCEC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB8008(uint64_t a1)
{
  unint64_t v2 = sub_246ABCEC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB8044()
{
  return sub_246AB7F3C(*v0);
}

uint64_t sub_246AB804C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABBF1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB8074(uint64_t a1)
{
  unint64_t v2 = sub_246ABCE18();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB80B0(uint64_t a1)
{
  unint64_t v2 = sub_246ABCE18();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB80EC()
{
  return sub_246AB7F5C(*v0);
}

uint64_t sub_246AB80F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABC034(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB811C(uint64_t a1)
{
  unint64_t v2 = sub_246ABCCC8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB8158(uint64_t a1)
{
  unint64_t v2 = sub_246ABCCC8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB8194(uint64_t a1)
{
  unint64_t v2 = sub_246ABCFBC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB81D0(uint64_t a1)
{
  unint64_t v2 = sub_246ABCFBC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB820C()
{
  return sub_246AB7F7C(*v0);
}

uint64_t sub_246AB8214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246ABC1E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AB823C(uint64_t a1)
{
  unint64_t v2 = sub_246ABCD1C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AB8278(uint64_t a1)
{
  unint64_t v2 = sub_246ABCD1C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AB82B4()
{
  sub_246A961B0(v0, (uint64_t)&v3);
  int v1 = v4;
  switch(v4 >> 62)
  {
    case 1uLL:
      v4 &= 0x3FFFFFFFFFFFFFFFuLL;
      goto LABEL_4;
    case 2uLL:
      v4 &= 0x3FFFFFFFFFFFFFFFuLL;
      sub_246AD9110();
      sub_246AD9110();
      if ((v1 & 1) == 0)
      {
        sub_246AD9130();
        sub_246AD9130();
      }
      if (BYTE2(v1) != 2 && BYTE2(v1) != 3 && BYTE2(v1) != 4)
      {
        sub_246AD9110();
        sub_246AD9110();
      }
      goto LABEL_9;
    case 3uLL:
      v4 &= 0x3FFFFFFFFFFFFFFFuLL;
      sub_246AD9110();
      if (v1)
      {
LABEL_4:
        sub_246AD9110();
      }
      else
      {
        sub_246AD9110();
        sub_246AD9130();
        sub_246AD9130();
      }
LABEL_9:
      uint64_t result = sub_246AD9110();
      break;
    default:
      v4 &= 0x3FFFFFFFFFFFFFFFuLL;
      sub_246AD9130();
      uint64_t result = sub_246AD9130();
      break;
  }
  return result;
}

uint64_t sub_246AB849C(void *a1)
{
  uint64_t v42 = sub_246A8604C(&qword_2691C1578);
  uint64_t v37 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v40 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_246A8604C(&qword_2691C1580);
  uint64_t v36 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v39 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246A8604C(&qword_2691C1588);
  uint64_t v35 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned int v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C1590);
  uint64_t v38 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C1598);
  uint64_t v43 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246ABCCC8();
  uint64_t v46 = v12;
  sub_246AD9160();
  sub_246A961B0(v45, (uint64_t)&v49);
  unsigned int v13 = v51;
  switch(v51 >> 62)
  {
    case 1uLL:
      v51 &= 0x3FFFFFFFFFFFFFFFuLL;
      char v16 = v49;
      char v17 = BYTE1(v49);
      LOBYTE(v47) = 1;
      sub_246ABCEC0();
      uint64_t v18 = v10;
      uint64_t v19 = v46;
      sub_246AD8FC0();
      LOBYTE(v47) = v16;
      char v53 = 0;
      sub_246ABD160();
      uint64_t v20 = v44;
      sub_246AD9020();
      if (!v20)
      {
        LOBYTE(v47) = v17;
        char v53 = 1;
        sub_246ABD1B4();
        sub_246AD9020();
      }
      (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v4);
      goto LABEL_9;
    case 2uLL:
      v51 &= 0x3FFFFFFFFFFFFFFFuLL;
      char v21 = v49;
      uint64_t v22 = *((void *)&v49 + 1);
      uint64_t v23 = v50;
      LOBYTE(v47) = 2;
      sub_246ABCE18();
      uint64_t v24 = v39;
      uint64_t v18 = v10;
      uint64_t v19 = v46;
      sub_246AD8FC0();
      LOBYTE(v47) = v21;
      char v53 = 0;
      sub_246ABD064();
      uint64_t v25 = v41;
      uint64_t v26 = v44;
      sub_246AD9020();
      if (!v26)
      {
        *(void *)&long long v47 = v22;
        *((void *)&v47 + 1) = v23;
        char v48 = v13 & 1;
        char v53 = 1;
        sub_246ABD0B8();
        sub_246AD9020();
        LOWORD(v47) = v13 >> 8;
        char v53 = 2;
        sub_246ABD10C();
        sub_246AD9020();
      }
      (*(void (**)(char *, uint64_t))(v36 + 8))(v24, v25);
LABEL_9:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v19, v18);
      break;
    case 3uLL:
      v51 &= 0x3FFFFFFFFFFFFFFFuLL;
      char v27 = v49;
      uint64_t v28 = v50;
      uint64_t v45 = (long long *)*((void *)&v49 + 1);
      LOBYTE(v47) = 3;
      sub_246ABCD1C();
      uint64_t v29 = v40;
      uint64_t v30 = v46;
      sub_246AD8FC0();
      LOBYTE(v47) = v27;
      char v53 = 0;
      sub_246ABD064();
      uint64_t v31 = v42;
      uint64_t v32 = v44;
      sub_246AD9020();
      if (v32)
      {
        (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v31);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v30, v10);
      }
      else
      {
        *(void *)&long long v47 = v45;
        *((void *)&v47 + 1) = v28;
        char v48 = v13 & 1;
        char v53 = 1;
        sub_246ABD0B8();
        uint64_t v33 = v29;
        sub_246AD9020();
        LOBYTE(v47) = 2;
        sub_246AD9010();
        uint64_t v34 = v46;
        (*(void (**)(char *, uint64_t))(v37 + 8))(v33, v31);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v34, v10);
      }
      break;
    default:
      v51 &= 0x3FFFFFFFFFFFFFFFuLL;
      long long v52 = v49;
      LOBYTE(v47) = 0;
      sub_246ABCFBC();
      uint64_t v14 = v46;
      sub_246AD8FC0();
      long long v47 = v52;
      sub_246ABD208();
      sub_246AD9020();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v9, v7);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v14, v10);
      break;
  }
  return result;
}

uint64_t sub_246AB8C20(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C1600);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_246A8604C(&qword_2691C1608);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C1610);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246ABD6AC();
  sub_246AD9160();
  unsigned int v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_246ABD700();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_246ABD754();
    sub_246AD8FC0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

void sub_246AB8ED0(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_246ABC300(a1, (uint64_t)v4);
  if (!v2) {
    sub_246A961B0(v4, a2);
  }
}

uint64_t sub_246AB8F18(void *a1)
{
  sub_246A961B0(v1, (uint64_t)v4);
  return sub_246AB849C(a1);
}

BOOL sub_246AB8F68(long long *a1, long long *a2)
{
  sub_246A961B0(a1, (uint64_t)v4);
  sub_246A961B0(a2, (uint64_t)v5);
  return sub_246ABB194(v4, v5);
}

uint64_t sub_246AB8FB4()
{
  sub_246A961B0(v0, (uint64_t)v2);
  sub_246AD9100();
  sub_246AB82B4();
  return sub_246AD9140();
}

uint64_t sub_246AB9004()
{
  sub_246A961B0(v0, (uint64_t)v2);
  return sub_246AB82B4();
}

uint64_t sub_246AB9044()
{
  sub_246A961B0(v0, (uint64_t)v2);
  sub_246AD9100();
  sub_246AB82B4();
  return sub_246AD9140();
}

void sub_246AB9098(void *a1@<X8>)
{
  *a1 = &unk_26FB022B0;
}

uint64_t sub_246AB90A8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246ABD25C(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_246AB90D8(void *a1)
{
  return sub_246AB8C20(a1, *v1);
}

uint64_t sub_246AB90F4(void *a1)
{
  uint64_t v3 = sub_246A8604C(&qword_2691C1628);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246ABD954();
  sub_246AD9160();
  char v10 = 0;
  sub_246AD9000();
  if (!v1)
  {
    char v9 = 1;
    sub_246AD9000();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_246AB925C(void *a1, uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C1690);
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v32 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C1698);
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v29 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C16A0);
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v28 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v26 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C16A8);
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v25 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_246A8604C(&qword_2691C16B0);
  uint64_t v23 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_246A8604C(&qword_2691C16B8);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  int v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246ABE0F0();
  sub_246AD9160();
  switch((char)v35)
  {
    case 1:
      char v37 = 1;
      sub_246ABE240();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    case 2:
      char v38 = 2;
      sub_246ABE1EC();
      char v19 = v26;
      sub_246AD8FC0();
      uint64_t v21 = v27;
      uint64_t v20 = v28;
      goto LABEL_7;
    case 3:
      char v39 = 3;
      sub_246ABE198();
      char v19 = v29;
      sub_246AD8FC0();
      uint64_t v21 = v30;
      uint64_t v20 = v31;
      goto LABEL_7;
    case 4:
      char v40 = 4;
      sub_246ABE144();
      char v19 = v32;
      sub_246AD8FC0();
      uint64_t v21 = v33;
      uint64_t v20 = v34;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v21 + 8))(v19, v20);
      break;
    default:
      char v36 = 0;
      sub_246ABE294();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v12);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

void sub_246AB9760(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = sub_246ABD7A8(a1);
  if (!v2)
  {
    *(double *)a2 = v4;
    *(void *)(a2 + 8) = v5;
  }
}

uint64_t sub_246AB978C(void *a1)
{
  return sub_246AB90F4(a1);
}

void sub_246AB97A8(void *a1@<X8>)
{
  *a1 = &unk_26FB022D8;
}

uint64_t sub_246AB97B8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246ABD9A8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_246AB97E4(void *a1)
{
  return sub_246AB925C(a1, *v1);
}

uint64_t sub_246AB9800(char a1)
{
  return *(void *)&aCenterPground[8 * a1];
}

uint64_t sub_246AB9820(void *a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C1710);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C1718);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v25 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C1720);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C1728);
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_246A8604C(&qword_2691C1730);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246ABE920();
  sub_246AD9160();
  switch((char)v31)
  {
    case 1:
      char v33 = 1;
      sub_246ABEA1C();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
      break;
    case 2:
      char v34 = 2;
      sub_246ABE9C8();
      uint64_t v17 = v25;
      sub_246AD8FC0();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
      goto LABEL_5;
    case 3:
      char v35 = 3;
      sub_246ABE974();
      uint64_t v17 = v28;
      sub_246AD8FC0();
      uint64_t v19 = v29;
      uint64_t v18 = v30;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_246ABEA70();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

void sub_246AB9C68(void *a1@<X8>)
{
  *a1 = &unk_26FB02300;
}

char *sub_246AB9C78@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246ABE2E8(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_246AB9CA4(void *a1)
{
  return sub_246AB9820(a1, *v1);
}

uint64_t sub_246AB9CC0()
{
  return sub_246AB9800(*v0);
}

uint64_t sub_246AB9CC8(__int16 a1)
{
  switch(HIBYTE(a1))
  {
    case 2u:
      return 1701736270;
    case 4u:
      return 0x73736572676F7250;
    case 3u:
      return 1684955464;
  }
  sub_246AD8DF0();
  swift_bridgeObjectRelease();
  sub_246AD8BF0();
  swift_bridgeObjectRelease();
  sub_246AD8BF0();
  sub_246AD8BD0();
  sub_246AD8BF0();
  swift_bridgeObjectRelease();
  return 0x20676E69636146;
}

uint64_t sub_246AB9EA8(void *a1, int a2)
{
  int v36 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C1798);
  uint64_t v31 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v30 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C17A0);
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246A8604C(&qword_2691C17A8);
  uint64_t v27 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_246A8604C(&qword_2691C17B0);
  uint64_t v26 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_246A8604C(&qword_2691C17B8);
  uint64_t v33 = *(void *)(v14 - 8);
  uint64_t v34 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246ABF230();
  __int16 v17 = v36;
  sub_246AD9160();
  switch(HIBYTE(v17))
  {
    case 2u:
      char v37 = 0;
      sub_246ABF428();
      uint64_t v18 = v34;
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v18);
    case 3u:
      char v38 = 1;
      sub_246ABF3D4();
      uint64_t v20 = v34;
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v20);
    case 4u:
      char v39 = 2;
      sub_246ABF380();
      uint64_t v18 = v34;
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v29);
      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v18);
    default:
      char v44 = 3;
      sub_246ABF284();
      uint64_t v21 = v30;
      uint64_t v22 = v34;
      sub_246AD8FC0();
      char v43 = v17;
      char v42 = 0;
      sub_246ABF47C();
      uint64_t v23 = v32;
      uint64_t v24 = v35;
      sub_246AD9020();
      if (!v24)
      {
        char v41 = HIBYTE(v17) & 1;
        char v40 = 1;
        sub_246ABF4D0();
        sub_246AD9020();
      }
      (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v23);
      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v22);
  }
}

uint64_t sub_246ABA3B8@<X0>(void *a1@<X0>, _WORD *a2@<X8>)
{
  uint64_t result = sub_246ABEAC4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_246ABA3E4(void *a1)
{
  return sub_246AB9EA8(a1, *v1);
}

uint64_t sub_246ABA400()
{
  return sub_246AB9CC8(*v0);
}

BOOL sub_246ABA408(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_246ABB474(*a1, *a2);
}

uint64_t sub_246ABA414()
{
  __int16 v1 = *v0;
  sub_246AD9100();
  if ((HIBYTE(v1) - 2) >= 3u)
  {
    sub_246AD9110();
    sub_246AD9110();
  }
  sub_246AD9110();
  return sub_246AD9140();
}

uint64_t sub_246ABA490()
{
  if ((HIBYTE(*v0) - 2) >= 3u)
  {
    sub_246AD9110();
    sub_246AD9110();
  }
  return sub_246AD9110();
}

uint64_t sub_246ABA4EC()
{
  __int16 v1 = *v0;
  sub_246AD9100();
  if ((HIBYTE(v1) - 2) >= 3u)
  {
    sub_246AD9110();
    sub_246AD9110();
  }
  sub_246AD9110();
  return sub_246AD9140();
}

unint64_t sub_246ABA564(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unsigned int v3 = 1953656654;
      return v3 | 0x7361656800000000;
    case 3:
      unsigned int v4 = 1953656654;
      goto LABEL_8;
    case 4:
      unsigned int v3 = 1953853267;
      return v3 | 0x7361656800000000;
    case 5:
      unsigned int v4 = 1953853267;
LABEL_8:
      unint64_t result = v4 | 0x7365776800000000;
      break;
    default:
      unint64_t result = 0x7369776B636F6C43;
      break;
  }
  return result;
}

uint64_t sub_246ABA624(double a1)
{
  if (a1 > 6.28318531) {
    a1 = 6.28318531;
  }
  if (a1 < 0.0) {
    double v1 = 0.0;
  }
  else {
    double v1 = a1;
  }
  if (qword_2691C0268 != -1) {
    uint64_t result = swift_once();
  }
  double v2 = *(double *)&qword_2691D4128;
  if (v1 <= *(double *)&qword_2691D4128) {
    return 0;
  }
  if (qword_2691C0270 != -1) {
    uint64_t result = swift_once();
  }
  double v3 = *(double *)&qword_2691D4130;
  if (v2 > *(double *)&qword_2691D4130)
  {
    __break(1u);
LABEL_43:
    double v11 = v3;
    uint64_t result = swift_once();
    double v3 = v11;
    goto LABEL_18;
  }
  if (v2 <= v1 && v1 <= *(double *)&qword_2691D4130) {
    return 1;
  }
  if (qword_2691C0278 != -1) {
    goto LABEL_43;
  }
LABEL_18:
  double v5 = *(double *)&qword_2691D4138;
  if (v3 > *(double *)&qword_2691D4138)
  {
    __break(1u);
LABEL_45:
    double v12 = v5;
    uint64_t result = swift_once();
    double v5 = v12;
    goto LABEL_25;
  }
  if (v3 <= v1 && v1 <= *(double *)&qword_2691D4138) {
    return 2;
  }
  if (qword_2691C0280 != -1) {
    goto LABEL_45;
  }
LABEL_25:
  double v7 = *(double *)&qword_2691D4140;
  if (v5 > *(double *)&qword_2691D4140)
  {
    __break(1u);
  }
  else
  {
    if (v5 <= v1 && v1 <= *(double *)&qword_2691D4140) {
      return 3;
    }
    if (qword_2691C0288 == -1) {
      goto LABEL_32;
    }
  }
  double v13 = v7;
  uint64_t result = swift_once();
  double v7 = v13;
LABEL_32:
  if (v7 > *(double *)&qword_2691D4148)
  {
    __break(1u);
    __break(1u);
  }
  else if (v7 > v1 || v1 > *(double *)&qword_2691D4148)
  {
    if (*(double *)&qword_2691D4148 > v1) {
      return 0;
    }
    else {
      return 5;
    }
  }
  else
  {
    return 4;
  }
  return result;
}

uint64_t sub_246ABA840(void *a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C1840);
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  char v37 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C1848);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v34 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C1850);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v31 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C1858);
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v28 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_246A8604C(&qword_2691C1860);
  uint64_t v26 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  MEMORY[0x270FA5388](v11);
  double v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_246A8604C(&qword_2691C1868);
  uint64_t v25 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_246A8604C(&qword_2691C1870);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246ABFCCC();
  sub_246AD9160();
  switch((char)v40)
  {
    case 1:
      char v42 = 1;
      sub_246ABFE70();
      sub_246AD8FC0();
      uint64_t v22 = v26;
      uint64_t v21 = v27;
      goto LABEL_8;
    case 2:
      char v43 = 2;
      sub_246ABFE1C();
      double v13 = v28;
      sub_246AD8FC0();
      uint64_t v22 = v29;
      uint64_t v21 = v30;
      goto LABEL_8;
    case 3:
      char v44 = 3;
      sub_246ABFDC8();
      double v13 = v31;
      sub_246AD8FC0();
      uint64_t v22 = v32;
      uint64_t v21 = v33;
      goto LABEL_8;
    case 4:
      char v45 = 4;
      sub_246ABFD74();
      double v13 = v34;
      sub_246AD8FC0();
      uint64_t v22 = v35;
      uint64_t v21 = v36;
      goto LABEL_8;
    case 5:
      char v46 = 5;
      sub_246ABFD20();
      double v13 = v37;
      sub_246AD8FC0();
      uint64_t v22 = v38;
      uint64_t v21 = v39;
LABEL_8:
      (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v21);
      break;
    default:
      char v41 = 0;
      sub_246ABFEC4();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v14);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
}

void sub_246ABADF8(void *a1@<X8>)
{
  *a1 = &unk_26FB02328;
}

char *sub_246ABAE08@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246ABF524(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_246ABAE34(void *a1)
{
  return sub_246ABA840(a1, *v1);
}

unint64_t sub_246ABAE50()
{
  return sub_246ABA564(*v0);
}

uint64_t sub_246ABAE58()
{
  return sub_246A8E1C8(&qword_2691C1488, &qword_2691C1490);
}

unint64_t sub_246ABAE84()
{
  unint64_t result = qword_2691C1498;
  if (!qword_2691C1498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1498);
  }
  return result;
}

unint64_t sub_246ABAEDC()
{
  unint64_t result = qword_2691C14A0;
  if (!qword_2691C14A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C14A0);
  }
  return result;
}

uint64_t sub_246ABAF30()
{
  return sub_246A8E1C8(&qword_2691C14A8, &qword_2691C14B0);
}

unint64_t sub_246ABAF5C()
{
  unint64_t result = qword_2691C14B8;
  if (!qword_2691C14B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C14B8);
  }
  return result;
}

uint64_t sub_246ABAFB0()
{
  return sub_246A8E1C8(&qword_2691C14C0, &qword_2691C14C8);
}

unint64_t sub_246ABAFDC()
{
  unint64_t result = qword_2691C14D0;
  if (!qword_2691C14D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C14D0);
  }
  return result;
}

unint64_t sub_246ABB034()
{
  unint64_t result = qword_2691C14D8;
  if (!qword_2691C14D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C14D8);
  }
  return result;
}

uint64_t sub_246ABB088()
{
  return sub_246A8E1C8(&qword_2691C14E0, &qword_2691C14E8);
}

unint64_t sub_246ABB0B4()
{
  unint64_t result = qword_2691C14F0;
  if (!qword_2691C14F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C14F0);
  }
  return result;
}

void sub_246ABB108()
{
  qword_2691D4128 = 0x3FF0C152382D7365;
}

void sub_246ABB124()
{
  qword_2691D4130 = 0x400197C987C952C4;
}

void sub_246ABB140()
{
  qword_2691D4138 = 0x400921FB54442D18;
}

void sub_246ABB15C()
{
  qword_2691D4140 = 0x40105616905F83B6;
}

void sub_246ABB178()
{
  qword_2691D4148 = 0x4014F1A6C638D03FLL;
}

BOOL sub_246ABB194(long long *a1, long long *a2)
{
  sub_246A961B0(a1, (uint64_t)&v24);
  int v3 = v27;
  switch(v27 >> 62)
  {
    case 1uLL:
      v27 &= 0x3FFFFFFFFFFFFFFFuLL;
      int v7 = LOBYTE(v24);
      int v8 = BYTE1(v24);
      sub_246A961B0(a2, (uint64_t)&v20);
      if (v22 >> 62 != 1 || v7 != LOBYTE(v20)) {
        return 0;
      }
      return v8 == BYTE1(v20);
    case 2uLL:
      v27 &= 0x3FFFFFFFFFFFFFFFuLL;
      int v11 = LOBYTE(v24);
      double v12 = v25;
      double v13 = v26;
      sub_246A961B0(a2, (uint64_t)&v20);
      if (v22 >> 62 != 2 || v11 != LOBYTE(v20)) {
        return 0;
      }
      if (v3)
      {
        if (*(void *)&v12 | *(void *)&v13)
        {
          if (*(void *)&v12 ^ 1 | *(void *)&v13)
          {
            if ((v22 & 1) == 0 || v21 < 2) {
              return 0;
            }
          }
          else if ((v22 & 1) == 0 || (unint64_t)v21 ^ 1 | *((void *)&v21 + 1))
          {
            return 0;
          }
        }
        else if ((v22 & 1) == 0 || v21 != 0)
        {
          return 0;
        }
      }
      else
      {
        if (v22) {
          return 0;
        }
        if (v12 != *(double *)&v21 || v13 != *((double *)&v21 + 1)) {
          return 0;
        }
      }
      switch(BYTE2(v3))
      {
        case 2u:
          return ((v22 >> 8) & 0xFF00) == 0x200;
        case 3u:
          return ((v22 >> 8) & 0xFF00) == 0x300;
        case 4u:
          return ((v22 >> 8) & 0xFF00) == 0x400;
      }
      return BYTE2(v22) - 2 >= 3 && ((v22 ^ v3) & 0x1FF00) == 0;
    case 3uLL:
      v27 &= 0x3FFFFFFFFFFFFFFFuLL;
      int v15 = LOBYTE(v24);
      double v16 = v25;
      double v17 = v26;
      uint64_t v18 = v28;
      sub_246A961B0(a2, (uint64_t)&v20);
      if (v22 >> 62 != 3 || v15 != LOBYTE(v20)) {
        return 0;
      }
      if (v3)
      {
        if (*(void *)&v16 | *(void *)&v17)
        {
          if (*(void *)&v16 ^ 1 | *(void *)&v17)
          {
            if ((v22 & 1) == 0 || v21 < 2) {
              return 0;
            }
          }
          else if ((v22 & 1) == 0 || (unint64_t)v21 ^ 1 | *((void *)&v21 + 1))
          {
            return 0;
          }
        }
        else if ((v22 & 1) == 0 || v21 != 0)
        {
          return 0;
        }
      }
      else
      {
        if (v22) {
          return 0;
        }
        if (v16 != *(double *)&v21 || v17 != *((double *)&v21 + 1)) {
          return 0;
        }
      }
      return v18 == v23;
    default:
      v27 &= 0x3FFFFFFFFFFFFFFFuLL;
      double v4 = v24;
      double v5 = v25;
      sub_246A961B0(a2, (uint64_t)&v20);
      if (v22 >> 62) {
        return 0;
      }
      return v5 == *(double *)&v21 && v4 == v20;
  }
}

BOOL sub_246ABB474(unsigned __int16 a1, unsigned __int16 a2)
{
  switch(HIBYTE(a1))
  {
    case 2u:
      return (a2 & 0xFF00) == 0x200;
    case 3u:
      return (a2 & 0xFF00) == 0x300;
    case 4u:
      return (a2 & 0xFF00) == 0x400;
  }
  if (HIBYTE(a2) - 2 < 3) {
    return 0;
  }
  return a2 == a1 && ((a2 ^ a1) & 0x100) == 0;
}

uint64_t sub_246ABB4FC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7368564 && a2 == 0xE300000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D6F74746F62 && a2 == 0xE600000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1952867692 && a2 == 0xE400000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7468676972 && a2 == 0xE500000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7265746E6563 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_246ABB6C4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x69507265746E6563 && a2 == 0xE90000000000006ELL;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646E756F7267 && a2 == 0xE600000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656E696C796B73 && a2 == 0xE700000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74726F7077656976 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_246ABB868(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7265746E6563 && a2 == 0xE600000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D6F74746F62 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246ABB944(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7369776B636F6C63 && a2 == 0xE900000000000065 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000246ADACB0 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7361656874726F6ELL && a2 == 0xE900000000000074 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7365776874726F6ELL && a2 == 0xE900000000000074 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7361656874756F73 && a2 == 0xE900000000000074 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7365776874756F73 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_246ABBBB0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684955496 && a2 == 0xE400000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x73736572676F7270 && a2 == 0xEB00000000676E69 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E69636166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_246ABBD3C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6F69746365726964 && a2 == 0xE90000000000006ELL;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x536C616974696E69 && a2 == 0xEB00000000656469)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246ABBE40(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 28532 && a2 == 0xE200000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E656D6E67696C61 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246ABBF1C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 28532 && a2 == 0xE200000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 29793 && a2 == 0xE200000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461746F72 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_246ABC034(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x616E6964726F6F63 && a2 == 0xEA00000000006574 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465726F68636E61 && a2 == 0xE800000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6465686361747461 && a2 == 0xE800000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74616C736E617274 && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_246ABC1E8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1836020326 && a2 == 0xE400000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 29793 && a2 == 0xE200000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E696769726FLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

double sub_246ABC300@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v47 = sub_246A8604C(&qword_2691C14F8);
  uint64_t v50 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  long long v52 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_246A8604C(&qword_2691C1500);
  uint64_t v45 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  unint64_t v51 = (unint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v49 = sub_246A8604C(&qword_2691C1508);
  uint64_t v44 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  char v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C1510);
  uint64_t v46 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C1518);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  double v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  char v53 = a1;
  sub_246A8A6E4(a1, v14);
  sub_246ABCCC8();
  unint64_t v15 = v54;
  sub_246AD9150();
  if (v15) {
    goto LABEL_9;
  }
  double v16 = v9;
  unint64_t v54 = v7;
  unint64_t v17 = v51;
  uint64_t v18 = v52;
  uint64_t v19 = sub_246AD8FB0();
  uint64_t v20 = v10;
  unsigned long long v21 = v13;
  if (*(void *)(v19 + 16) != 1)
  {
    uint64_t v22 = sub_246AD8E70();
    swift_allocError();
    double v24 = v23;
    sub_246A8604C(&qword_2691C05D0);
    *double v24 = &type metadata for Placement;
    sub_246AD8F40();
    sub_246AD8E30();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCB0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, v20);
LABEL_9:
    sub_246A85F9C((uint64_t)v53);
    return result;
  }
  switch(*(unsigned char *)(v19 + 32))
  {
    case 1:
      LOBYTE(v55) = 1;
      sub_246ABCEC0();
      double v25 = v6;
      sub_246AD8F30();
      LOBYTE(v57) = 0;
      sub_246ABCF14();
      uint64_t v26 = v49;
      sub_246AD8FA0();
      uint64_t v38 = v55;
      unsigned __int8 v59 = 1;
      sub_246ABCF68();
      sub_246AD8FA0();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
      uint64_t v35 = 0;
      unint64_t v36 = v38 | ((unint64_t)v57 << 8);
      long long v49 = 0u;
      unint64_t v34 = 0x4000000000000000;
      goto LABEL_13;
    case 2:
      LOBYTE(v55) = 2;
      sub_246ABCE18();
      unint64_t v27 = v17;
      sub_246AD8F30();
      LOBYTE(v55) = 0;
      sub_246ABCD70();
      uint64_t v28 = v48;
      sub_246AD8FA0();
      unint64_t v29 = v59;
      LOBYTE(v57) = 1;
      sub_246ABCDC4();
      sub_246AD8FA0();
      unint64_t v54 = v29;
      long long v49 = v55;
      int v39 = v56;
      char v58 = 2;
      sub_246ABCE6C();
      sub_246AD8FA0();
      (*(void (**)(unint64_t, uint64_t))(v45 + 8))(v27, v28);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
      uint64_t v35 = 0;
      unint64_t v40 = 0x8000000000000000;
      if (v39) {
        unint64_t v40 = 0x8000000000000001;
      }
      unint64_t v34 = v40 | ((unint64_t)v57 << 8);
      uint64_t v41 = (uint64_t)v53;
      unint64_t v36 = v54;
      goto LABEL_14;
    case 3:
      unint64_t v54 = v19;
      LOBYTE(v55) = 3;
      sub_246ABCD1C();
      sub_246AD8F30();
      LOBYTE(v55) = 0;
      sub_246ABCD70();
      uint64_t v30 = v47;
      sub_246AD8FA0();
      unint64_t v31 = v57;
      unsigned __int8 v59 = 1;
      sub_246ABCDC4();
      sub_246AD8FA0();
      long long v49 = v55;
      unint64_t v51 = v56;
      unsigned __int8 v59 = 2;
      uint64_t v35 = sub_246AD8F90();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v18, v30);
      unint64_t v36 = v31;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v21, v20);
      unint64_t v34 = v51 | 0xC000000000000000;
      goto LABEL_13;
    default:
      LOBYTE(v55) = 0;
      sub_246ABCFBC();
      sub_246AD8F30();
      sub_246ABD010();
      unint64_t v33 = v54;
      sub_246AD8FA0();
      (*(void (**)(char *, unint64_t))(v46 + 8))(v16, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
      unint64_t v34 = 0;
      uint64_t v35 = 0;
      *(void *)&long long v37 = *((void *)&v55 + 1);
      unint64_t v36 = v55;
      long long v49 = v37;
LABEL_13:
      uint64_t v41 = (uint64_t)v53;
LABEL_14:
      uint64_t v42 = v43;
      sub_246A85F9C(v41);
      *(void *)uint64_t v42 = v36;
      double result = *(double *)&v49;
      *(_OWORD *)(v42 + 8) = v49;
      *(void *)(v42 + 24) = v34;
      *(void *)(v42 + 32) = v35;
      break;
  }
  return result;
}

unint64_t sub_246ABCCC8()
{
  unint64_t result = qword_2691C1520;
  if (!qword_2691C1520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1520);
  }
  return result;
}

unint64_t sub_246ABCD1C()
{
  unint64_t result = qword_2691C1528;
  if (!qword_2691C1528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1528);
  }
  return result;
}

unint64_t sub_246ABCD70()
{
  unint64_t result = qword_2691C1530;
  if (!qword_2691C1530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1530);
  }
  return result;
}

unint64_t sub_246ABCDC4()
{
  unint64_t result = qword_2691C1538;
  if (!qword_2691C1538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1538);
  }
  return result;
}

unint64_t sub_246ABCE18()
{
  unint64_t result = qword_2691C1540;
  if (!qword_2691C1540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1540);
  }
  return result;
}

unint64_t sub_246ABCE6C()
{
  unint64_t result = qword_2691C1548;
  if (!qword_2691C1548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1548);
  }
  return result;
}

unint64_t sub_246ABCEC0()
{
  unint64_t result = qword_2691C1550;
  if (!qword_2691C1550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1550);
  }
  return result;
}

unint64_t sub_246ABCF14()
{
  unint64_t result = qword_2691C1558;
  if (!qword_2691C1558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1558);
  }
  return result;
}

unint64_t sub_246ABCF68()
{
  unint64_t result = qword_2691C1560;
  if (!qword_2691C1560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1560);
  }
  return result;
}

unint64_t sub_246ABCFBC()
{
  unint64_t result = qword_2691C1568;
  if (!qword_2691C1568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1568);
  }
  return result;
}

unint64_t sub_246ABD010()
{
  unint64_t result = qword_2691C1570;
  if (!qword_2691C1570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1570);
  }
  return result;
}

unint64_t sub_246ABD064()
{
  unint64_t result = qword_2691C15A0;
  if (!qword_2691C15A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C15A0);
  }
  return result;
}

unint64_t sub_246ABD0B8()
{
  unint64_t result = qword_2691C15A8;
  if (!qword_2691C15A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C15A8);
  }
  return result;
}

unint64_t sub_246ABD10C()
{
  unint64_t result = qword_2691C15B0;
  if (!qword_2691C15B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C15B0);
  }
  return result;
}

unint64_t sub_246ABD160()
{
  unint64_t result = qword_2691C15B8;
  if (!qword_2691C15B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C15B8);
  }
  return result;
}

unint64_t sub_246ABD1B4()
{
  unint64_t result = qword_2691C15C0;
  if (!qword_2691C15C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C15C0);
  }
  return result;
}

unint64_t sub_246ABD208()
{
  unint64_t result = qword_2691C15C8;
  if (!qword_2691C15C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C15C8);
  }
  return result;
}

uint64_t sub_246ABD25C(uint64_t a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C15D0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C15D8);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C15E0);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4((void *)a1, *(void *)(a1 + 24));
  sub_246ABD6AC();
  uint64_t v12 = v26;
  sub_246AD9150();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_246AD8FB0();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_246AD8E70();
    swift_allocError();
    uint64_t v18 = v17;
    sub_246A8604C(&qword_2691C05D0);
    *uint64_t v18 = &type metadata for Placement.Pivot;
    sub_246AD8F40();
    sub_246AD8E30();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    sub_246A85F9C(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_246ABD700();
    sub_246AD8F30();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_246ABD754();
    sub_246AD8F30();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  sub_246A85F9C(v26);
  return a1;
}

unint64_t sub_246ABD6AC()
{
  unint64_t result = qword_2691C15E8;
  if (!qword_2691C15E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C15E8);
  }
  return result;
}

unint64_t sub_246ABD700()
{
  unint64_t result = qword_2691C15F0;
  if (!qword_2691C15F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C15F0);
  }
  return result;
}

unint64_t sub_246ABD754()
{
  unint64_t result = qword_2691C15F8;
  if (!qword_2691C15F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C15F8);
  }
  return result;
}

double sub_246ABD7A8(void *a1)
{
  uint64_t v4 = sub_246A8604C(&qword_2691C1618);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_246A8A6E4(a1, a1[3]);
  sub_246ABD954();
  sub_246AD9150();
  if (!v1)
  {
    v10[15] = 0;
    sub_246AD8F80();
    double v2 = v8;
    v10[14] = 1;
    sub_246AD8F80();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_246A85F9C((uint64_t)a1);
  return v2;
}

unint64_t sub_246ABD954()
{
  unint64_t result = qword_2691C1620;
  if (!qword_2691C1620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1620);
  }
  return result;
}

uint64_t sub_246ABD9A8(void *a1)
{
  uint64_t v41 = sub_246A8604C(&qword_2691C1630);
  uint64_t v34 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v44 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_246A8604C(&qword_2691C1638);
  uint64_t v40 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v43 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246A8604C(&qword_2691C1640);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246A8604C(&qword_2691C1648);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  MEMORY[0x270FA5388](v6);
  double v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C1650);
  uint64_t v33 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_246A8604C(&qword_2691C1658);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v45 = a1;
  sub_246A8A6E4(a1, v16);
  sub_246ABE0F0();
  unint64_t v17 = v46;
  sub_246AD9150();
  if (!v17)
  {
    uint64_t v46 = v11;
    uint64_t v31 = v9;
    uint64_t v32 = v13;
    uint64_t v18 = v8;
    uint64_t v20 = v42;
    uint64_t v19 = v43;
    uint64_t v21 = v44;
    uint64_t v22 = v15;
    uint64_t v23 = sub_246AD8FB0();
    if (*(void *)(v23 + 16) == 1)
    {
      uint64_t v15 = *(unsigned __int8 *)(v23 + 32);
      switch(*(unsigned char *)(v23 + 32))
      {
        case 1:
          uint64_t v30 = v32;
          char v48 = 1;
          sub_246ABE240();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v36);
          goto LABEL_12;
        case 2:
          uint64_t v30 = v32;
          char v49 = 2;
          sub_246ABE1EC();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v39);
LABEL_12:
          swift_bridgeObjectRelease();
          uint64_t v24 = v30;
          goto LABEL_10;
        case 3:
          uint64_t v24 = v32;
          char v50 = 3;
          sub_246ABE198();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v19, v37);
          goto LABEL_13;
        case 4:
          char v51 = 4;
          sub_246ABE144();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v41);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v22, v12);
          break;
        default:
          uint64_t v24 = v32;
          char v47 = 0;
          sub_246ABE294();
          uint64_t v25 = v46;
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v31);
LABEL_13:
          swift_bridgeObjectRelease();
LABEL_10:
          (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v12);
          break;
      }
    }
    else
    {
      uint64_t v26 = sub_246AD8E70();
      uint64_t v15 = swift_allocError();
      char v28 = v27;
      sub_246A8604C(&qword_2691C05D0);
      *char v28 = &type metadata for Placement.Alignment;
      sub_246AD8F40();
      sub_246AD8E30();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB0], v26);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v22, v12);
    }
  }
  sub_246A85F9C((uint64_t)v45);
  return v15;
}

unint64_t sub_246ABE0F0()
{
  unint64_t result = qword_2691C1660;
  if (!qword_2691C1660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1660);
  }
  return result;
}

unint64_t sub_246ABE144()
{
  unint64_t result = qword_2691C1668;
  if (!qword_2691C1668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1668);
  }
  return result;
}

unint64_t sub_246ABE198()
{
  unint64_t result = qword_2691C1670;
  if (!qword_2691C1670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1670);
  }
  return result;
}

unint64_t sub_246ABE1EC()
{
  unint64_t result = qword_2691C1678;
  if (!qword_2691C1678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1678);
  }
  return result;
}

unint64_t sub_246ABE240()
{
  unint64_t result = qword_2691C1680;
  if (!qword_2691C1680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1680);
  }
  return result;
}

unint64_t sub_246ABE294()
{
  unint64_t result = qword_2691C1688;
  if (!qword_2691C1688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1688);
  }
  return result;
}

char *sub_246ABE2E8(void *a1)
{
  uint64_t v41 = sub_246A8604C(&qword_2691C16C0);
  uint64_t v45 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_246A8604C(&qword_2691C16C8);
  uint64_t v42 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246A8604C(&qword_2691C16D0);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C16D8);
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C16E0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v46 = a1;
  sub_246A8A6E4(a1, v14);
  sub_246ABE920();
  uint64_t v15 = v47;
  sub_246AD9150();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v35 = v7;
  uint64_t v36 = v9;
  uint64_t v16 = v43;
  unint64_t v17 = v44;
  uint64_t v47 = 0;
  uint64_t v18 = v45;
  uint64_t v19 = v11;
  uint64_t v20 = v13;
  uint64_t v21 = sub_246AD8FB0();
  uint64_t v22 = (char *)v21;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v25 = sub_246AD8E70();
    swift_allocError();
    uint64_t v13 = v22;
    uint64_t v26 = v10;
    char v28 = v27;
    sub_246A8604C(&qword_2691C05D0);
    *char v28 = &type metadata for Placement.Element;
    sub_246AD8F40();
    sub_246AD8E30();
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
      sub_246ABEA1C();
      uint64_t v31 = v47;
      sub_246AD8F30();
      if (v31) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
      goto LABEL_14;
    case 2:
      char v50 = 2;
      sub_246ABE9C8();
      uint64_t v32 = v47;
      sub_246AD8F30();
      if (v32) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v40);
      goto LABEL_14;
    case 3:
      char v51 = 3;
      sub_246ABE974();
      uint64_t v33 = v47;
      sub_246AD8F30();
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
      sub_246ABEA70();
      uint64_t v23 = v36;
      uint64_t v24 = v47;
      sub_246AD8F30();
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
  sub_246A85F9C(v29);
  return v13;
}

unint64_t sub_246ABE920()
{
  unint64_t result = qword_2691C16E8;
  if (!qword_2691C16E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C16E8);
  }
  return result;
}

unint64_t sub_246ABE974()
{
  unint64_t result = qword_2691C16F0;
  if (!qword_2691C16F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C16F0);
  }
  return result;
}

unint64_t sub_246ABE9C8()
{
  unint64_t result = qword_2691C16F8;
  if (!qword_2691C16F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C16F8);
  }
  return result;
}

unint64_t sub_246ABEA1C()
{
  unint64_t result = qword_2691C1700;
  if (!qword_2691C1700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1700);
  }
  return result;
}

unint64_t sub_246ABEA70()
{
  unint64_t result = qword_2691C1708;
  if (!qword_2691C1708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1708);
  }
  return result;
}

uint64_t sub_246ABEAC4(void *a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C1738);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v36 = v2;
  uint64_t v37 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_246A8604C(&qword_2691C1740);
  uint64_t v31 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_246A8604C(&qword_2691C1748);
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246A8604C(&qword_2691C1750);
  uint64_t v32 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_246A8604C(&qword_2691C1758);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  uint64_t v40 = a1;
  sub_246A8A6E4(a1, v15);
  sub_246ABF230();
  uint64_t v16 = v41;
  sub_246AD9150();
  if (!v16)
  {
    unint64_t v17 = v10;
    uint64_t v30 = v8;
    uint64_t v18 = v7;
    uint64_t v19 = v38;
    uint64_t v20 = v39;
    uint64_t v41 = v12;
    uint64_t v21 = sub_246AD8FB0();
    if (*(void *)(v21 + 16) == 1)
    {
      switch(*(unsigned char *)(v21 + 32))
      {
        case 1:
          char v43 = 1;
          sub_246ABF3D4();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v18, v35);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
          uint64_t v8 = 768;
          break;
        case 2:
          char v44 = 2;
          sub_246ABF380();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v34);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
          uint64_t v8 = 1024;
          break;
        case 3:
          char v49 = 3;
          sub_246ABF284();
          sub_246AD8F30();
          char v47 = 0;
          sub_246ABF2D8();
          uint64_t v25 = v36;
          sub_246AD8FA0();
          unsigned int v27 = v48;
          char v45 = 1;
          sub_246ABF32C();
          sub_246AD8FA0();
          uint64_t v28 = v41;
          (*(void (**)(char *, uint64_t))(v37 + 8))(v20, v25);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v11);
          if (v46) {
            int v29 = 256;
          }
          else {
            int v29 = 0;
          }
          uint64_t v8 = v29 | v27;
          break;
        default:
          char v42 = 0;
          sub_246ABF428();
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v32 + 8))(v17, v30);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
          uint64_t v8 = 512;
          break;
      }
    }
    else
    {
      uint64_t v8 = sub_246AD8E70();
      swift_allocError();
      uint64_t v22 = v14;
      uint64_t v24 = v23;
      sub_246A8604C(&qword_2691C05D0);
      *uint64_t v24 = &type metadata for Placement.Rotation;
      sub_246AD8F40();
      sub_246AD8E30();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v24, *MEMORY[0x263F8DCB0], v8);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v22, v11);
    }
  }
  sub_246A85F9C((uint64_t)v40);
  return v8;
}

unint64_t sub_246ABF230()
{
  unint64_t result = qword_2691C1760;
  if (!qword_2691C1760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1760);
  }
  return result;
}

unint64_t sub_246ABF284()
{
  unint64_t result = qword_2691C1768;
  if (!qword_2691C1768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1768);
  }
  return result;
}

unint64_t sub_246ABF2D8()
{
  unint64_t result = qword_2691C1770;
  if (!qword_2691C1770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1770);
  }
  return result;
}

unint64_t sub_246ABF32C()
{
  unint64_t result = qword_2691C1778;
  if (!qword_2691C1778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1778);
  }
  return result;
}

unint64_t sub_246ABF380()
{
  unint64_t result = qword_2691C1780;
  if (!qword_2691C1780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1780);
  }
  return result;
}

unint64_t sub_246ABF3D4()
{
  unint64_t result = qword_2691C1788;
  if (!qword_2691C1788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1788);
  }
  return result;
}

unint64_t sub_246ABF428()
{
  unint64_t result = qword_2691C1790;
  if (!qword_2691C1790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1790);
  }
  return result;
}

unint64_t sub_246ABF47C()
{
  unint64_t result = qword_2691C17C0;
  if (!qword_2691C17C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C17C0);
  }
  return result;
}

unint64_t sub_246ABF4D0()
{
  unint64_t result = qword_2691C17C8;
  if (!qword_2691C17C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C17C8);
  }
  return result;
}

char *sub_246ABF524(void *a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C17D0);
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  MEMORY[0x270FA5388](v2);
  long long v55 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246A8604C(&qword_2691C17D8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v4);
  unint64_t v54 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_246A8604C(&qword_2691C17E0);
  uint64_t v46 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  char v53 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246A8604C(&qword_2691C17E8);
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  MEMORY[0x270FA5388](v8);
  long long v52 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C17F0);
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_246A8604C(&qword_2691C17F8);
  uint64_t v43 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_246A8604C(&qword_2691C1800);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1[3];
  unsigned __int8 v56 = a1;
  sub_246A8A6E4(a1, v20);
  sub_246ABFCCC();
  uint64_t v21 = v57;
  sub_246AD9150();
  if (!v21)
  {
    uint64_t v38 = v13;
    uint64_t v39 = v15;
    uint64_t v40 = v12;
    uint64_t v22 = v52;
    uint64_t v23 = v53;
    uint64_t v24 = v54;
    uint64_t v25 = v55;
    unsigned __int16 v57 = (char *)v16;
    uint64_t v26 = v19;
    uint64_t v27 = sub_246AD8FB0();
    if (*(void *)(v27 + 16) == 1)
    {
      uint64_t v19 = (char *)*(unsigned __int8 *)(v27 + 32);
      switch(*(unsigned char *)(v27 + 32))
      {
        case 1:
          char v59 = 1;
          sub_246ABFE70();
          uint64_t v24 = v40;
          int v29 = v57;
          sub_246AD8F30();
          uint64_t v35 = v44;
          uint64_t v34 = v45;
          goto LABEL_12;
        case 2:
          char v60 = 2;
          sub_246ABFE1C();
          uint64_t v24 = v22;
          int v29 = v57;
          sub_246AD8F30();
          uint64_t v35 = v47;
          uint64_t v34 = v48;
          goto LABEL_12;
        case 3:
          char v61 = 3;
          sub_246ABFDC8();
          uint64_t v36 = v57;
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v23, v49);
          goto LABEL_14;
        case 4:
          char v62 = 4;
          sub_246ABFD74();
          int v29 = v57;
          sub_246AD8F30();
          uint64_t v34 = v50;
          uint64_t v35 = v51;
LABEL_12:
          (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v34);
          goto LABEL_13;
        case 5:
          char v63 = 5;
          sub_246ABFD20();
          uint64_t v36 = v57;
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v42);
LABEL_14:
          swift_bridgeObjectRelease();
          (*(void (**)(char *, char *))(v17 + 8))(v26, v36);
          break;
        default:
          char v58 = 0;
          sub_246ABFEC4();
          uint64_t v28 = v39;
          int v29 = v57;
          sub_246AD8F30();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v38);
LABEL_13:
          swift_bridgeObjectRelease();
          (*(void (**)(char *, char *))(v17 + 8))(v26, v29);
          break;
      }
    }
    else
    {
      uint64_t v30 = sub_246AD8E70();
      swift_allocError();
      uint64_t v32 = v31;
      sub_246A8604C(&qword_2691C05D0);
      *uint64_t v32 = &type metadata for Placement.Rotation.Direction;
      uint64_t v19 = v57;
      sub_246AD8F40();
      sub_246AD8E30();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v17 + 8))(v26, v19);
    }
  }
  sub_246A85F9C((uint64_t)v56);
  return v19;
}

unint64_t sub_246ABFCCC()
{
  unint64_t result = qword_2691C1808;
  if (!qword_2691C1808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1808);
  }
  return result;
}

unint64_t sub_246ABFD20()
{
  unint64_t result = qword_2691C1810;
  if (!qword_2691C1810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1810);
  }
  return result;
}

unint64_t sub_246ABFD74()
{
  unint64_t result = qword_2691C1818;
  if (!qword_2691C1818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1818);
  }
  return result;
}

unint64_t sub_246ABFDC8()
{
  unint64_t result = qword_2691C1820;
  if (!qword_2691C1820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1820);
  }
  return result;
}

unint64_t sub_246ABFE1C()
{
  unint64_t result = qword_2691C1828;
  if (!qword_2691C1828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1828);
  }
  return result;
}

unint64_t sub_246ABFE70()
{
  unint64_t result = qword_2691C1830;
  if (!qword_2691C1830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1830);
  }
  return result;
}

unint64_t sub_246ABFEC4()
{
  unint64_t result = qword_2691C1838;
  if (!qword_2691C1838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1838);
  }
  return result;
}

ValueMetadata *type metadata accessor for Placement.Rotation.Direction.CodingKeys()
{
  return &type metadata for Placement.Rotation.Direction.CodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.Direction.ClockwiseCodingKeys()
{
  return &type metadata for Placement.Rotation.Direction.ClockwiseCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.Direction.CounterclockwiseCodingKeys()
{
  return &type metadata for Placement.Rotation.Direction.CounterclockwiseCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.Direction.NortheastCodingKeys()
{
  return &type metadata for Placement.Rotation.Direction.NortheastCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.Direction.NorthwestCodingKeys()
{
  return &type metadata for Placement.Rotation.Direction.NorthwestCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.Direction.SoutheastCodingKeys()
{
  return &type metadata for Placement.Rotation.Direction.SoutheastCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.Direction.SouthwestCodingKeys()
{
  return &type metadata for Placement.Rotation.Direction.SouthwestCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.CodingKeys()
{
  return &type metadata for Placement.Rotation.CodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.NoneCodingKeys()
{
  return &type metadata for Placement.Rotation.NoneCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.HandCodingKeys()
{
  return &type metadata for Placement.Rotation.HandCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.ProgressingCodingKeys()
{
  return &type metadata for Placement.Rotation.ProgressingCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Rotation.FacingCodingKeys()
{
  return &type metadata for Placement.Rotation.FacingCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Element.CodingKeys()
{
  return &type metadata for Placement.Element.CodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Element.CenterPinCodingKeys()
{
  return &type metadata for Placement.Element.CenterPinCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Element.GroundCodingKeys()
{
  return &type metadata for Placement.Element.GroundCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Element.SkylineCodingKeys()
{
  return &type metadata for Placement.Element.SkylineCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Element.ViewportCodingKeys()
{
  return &type metadata for Placement.Element.ViewportCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Alignment.CodingKeys()
{
  return &type metadata for Placement.Alignment.CodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Alignment.TopCodingKeys()
{
  return &type metadata for Placement.Alignment.TopCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Alignment.BottomCodingKeys()
{
  return &type metadata for Placement.Alignment.BottomCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Alignment.LeftCodingKeys()
{
  return &type metadata for Placement.Alignment.LeftCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Alignment.RightCodingKeys()
{
  return &type metadata for Placement.Alignment.RightCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Alignment.CenterCodingKeys()
{
  return &type metadata for Placement.Alignment.CenterCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Point.CodingKeys()
{
  return &type metadata for Placement.Point.CodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Pivot.CodingKeys()
{
  return &type metadata for Placement.Pivot.CodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Pivot.CenterCodingKeys()
{
  return &type metadata for Placement.Pivot.CenterCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.Pivot.BottomCodingKeys()
{
  return &type metadata for Placement.Pivot.BottomCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.CodingKeys()
{
  return &type metadata for Placement.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Placement.CoordinateCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x246AC018CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Placement.CoordinateCodingKeys()
{
  return &type metadata for Placement.CoordinateCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.AnchoredCodingKeys()
{
  return &type metadata for Placement.AnchoredCodingKeys;
}

ValueMetadata *type metadata accessor for Placement.AttachedCodingKeys()
{
  return &type metadata for Placement.AttachedCodingKeys;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion9PlacementO18AttachedCodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AC02B4);
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

ValueMetadata *type metadata accessor for Placement.TranslatedCodingKeys()
{
  return &type metadata for Placement.TranslatedCodingKeys;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion9PlacementO8RotationO16FacingCodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AC03B8);
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

ValueMetadata *type metadata accessor for Placement.Pivot()
{
  return &type metadata for Placement.Pivot;
}

ValueMetadata *type metadata accessor for Placement.Point()
{
  return &type metadata for Placement.Point;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion9PlacementO9AlignmentOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AC04CCLL);
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

ValueMetadata *type metadata accessor for Placement.Alignment()
{
  return &type metadata for Placement.Alignment;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion9PlacementO7ElementOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AC05D0);
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

ValueMetadata *type metadata accessor for Placement.Element()
{
  return &type metadata for Placement.Element;
}

_WORD *initializeBufferWithCopyOfBuffer for Placement.Rotation(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Placement.Rotation(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC)
  {
    unsigned int v2 = a2 + 65284;
    if (a2 + 65284 <= 0xFFFEFFFF) {
      unsigned int v3 = 2;
    }
    else {
      unsigned int v3 = 4;
    }
    if (v2 < 0xFF0000) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x10000) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = *((unsigned __int8 *)a1 + 2);
        if (!*((unsigned char *)a1 + 2)) {
          break;
        }
        return (*a1 | (v5 << 16)) - 65284;
      case 2:
        int v5 = a1[1];
        if (a1[1]) {
          return (*a1 | (v5 << 16)) - 65284;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x246AC06C8);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 16)) - 65284;
      default:
        break;
    }
  }
  unsigned int v7 = *((unsigned __int8 *)a1 + 1);
  if (v7 >= 2) {
    unsigned int v8 = v7 - 1;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 4) {
    return v8 - 3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Placement.Rotation(uint64_t result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 65284;
  if (a3 + 65284 <= 0xFFFEFFFF) {
    int v4 = 2;
  }
  else {
    int v4 = 4;
  }
  if (v3 < 0xFF0000) {
    int v4 = 1;
  }
  if (v3 >= 0x10000) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFC) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v7 = ((a2 - 252) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 252;
    switch(v6)
    {
      case 1:
        *(unsigned char *)(result + 2) = v7;
        break;
      case 2:
        *(_WORD *)(result + 2) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x246AC07B0);
      case 4:
        *(_DWORD *)(result + 2) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *(unsigned char *)(result + 1) = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_246AC07D8(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 1);
  if (v1 >= 2) {
    return v1 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_246AC07EC(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)unint64_t result = a2 - 255;
  }
  else if (a2)
  {
    *(unsigned char *)(result + 1) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for Placement.Rotation()
{
  return &type metadata for Placement.Rotation;
}

uint64_t _s32NTKEsterbrookFaceBundleCompanion9PlacementO8RotationO9DirectionOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s32NTKEsterbrookFaceBundleCompanion9PlacementO8RotationO9DirectionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AC097CLL);
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

ValueMetadata *type metadata accessor for Placement.Rotation.Direction()
{
  return &type metadata for Placement.Rotation.Direction;
}

__n128 initializeWithCopy for Placement(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for Placement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unsigned int v2 = (*(void *)(a1 + 24) >> 17) & 0xFFFFFF80 | (*(void *)(a1 + 24) >> 1);
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for Placement(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = ((unint64_t)-a2 << 17) & 0x1FFFFFF000000 | (2 * (-a2 & 0x7FLL));
      *(void *)(result + 32) = 0;
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_246AC0A78(uint64_t a1)
{
  return *(void *)(a1 + 24) >> 62;
}

uint64_t sub_246AC0A84(uint64_t result)
{
  *(void *)(result + 24) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_246AC0A94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = *(void *)(result + 24) & 0xFFFF01 | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for Placement()
{
  return &type metadata for Placement;
}

unint64_t sub_246AC0AC0()
{
  unint64_t result = qword_2691C1878;
  if (!qword_2691C1878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1878);
  }
  return result;
}

unint64_t sub_246AC0B18()
{
  unint64_t result = qword_2691C1880;
  if (!qword_2691C1880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1880);
  }
  return result;
}

unint64_t sub_246AC0B70()
{
  unint64_t result = qword_2691C1888;
  if (!qword_2691C1888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1888);
  }
  return result;
}

unint64_t sub_246AC0BC8()
{
  unint64_t result = qword_2691C1890;
  if (!qword_2691C1890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1890);
  }
  return result;
}

unint64_t sub_246AC0C20()
{
  unint64_t result = qword_2691C1898;
  if (!qword_2691C1898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1898);
  }
  return result;
}

unint64_t sub_246AC0C78()
{
  unint64_t result = qword_2691C18A0;
  if (!qword_2691C18A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18A0);
  }
  return result;
}

unint64_t sub_246AC0CD0()
{
  unint64_t result = qword_2691C18A8;
  if (!qword_2691C18A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18A8);
  }
  return result;
}

unint64_t sub_246AC0D28()
{
  unint64_t result = qword_2691C18B0;
  if (!qword_2691C18B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18B0);
  }
  return result;
}

unint64_t sub_246AC0D80()
{
  unint64_t result = qword_2691C18B8;
  if (!qword_2691C18B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18B8);
  }
  return result;
}

unint64_t sub_246AC0DD8()
{
  unint64_t result = qword_2691C18C0;
  if (!qword_2691C18C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18C0);
  }
  return result;
}

unint64_t sub_246AC0E30()
{
  unint64_t result = qword_2691C18C8;
  if (!qword_2691C18C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18C8);
  }
  return result;
}

unint64_t sub_246AC0E88()
{
  unint64_t result = qword_2691C18D0;
  if (!qword_2691C18D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18D0);
  }
  return result;
}

unint64_t sub_246AC0EE0()
{
  unint64_t result = qword_2691C18D8;
  if (!qword_2691C18D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18D8);
  }
  return result;
}

unint64_t sub_246AC0F38()
{
  unint64_t result = qword_2691C18E0;
  if (!qword_2691C18E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18E0);
  }
  return result;
}

unint64_t sub_246AC0F90()
{
  unint64_t result = qword_2691C18E8;
  if (!qword_2691C18E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18E8);
  }
  return result;
}

unint64_t sub_246AC0FE8()
{
  unint64_t result = qword_2691C18F0;
  if (!qword_2691C18F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18F0);
  }
  return result;
}

unint64_t sub_246AC1040()
{
  unint64_t result = qword_2691C18F8;
  if (!qword_2691C18F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C18F8);
  }
  return result;
}

unint64_t sub_246AC1098()
{
  unint64_t result = qword_2691C1900;
  if (!qword_2691C1900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1900);
  }
  return result;
}

unint64_t sub_246AC10F0()
{
  unint64_t result = qword_2691C1908;
  if (!qword_2691C1908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1908);
  }
  return result;
}

unint64_t sub_246AC1148()
{
  unint64_t result = qword_2691C1910;
  if (!qword_2691C1910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1910);
  }
  return result;
}

unint64_t sub_246AC11A0()
{
  unint64_t result = qword_2691C1918;
  if (!qword_2691C1918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1918);
  }
  return result;
}

unint64_t sub_246AC11F8()
{
  unint64_t result = qword_2691C1920;
  if (!qword_2691C1920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1920);
  }
  return result;
}

unint64_t sub_246AC1250()
{
  unint64_t result = qword_2691C1928;
  if (!qword_2691C1928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1928);
  }
  return result;
}

unint64_t sub_246AC12A8()
{
  unint64_t result = qword_2691C1930;
  if (!qword_2691C1930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1930);
  }
  return result;
}

unint64_t sub_246AC1300()
{
  unint64_t result = qword_2691C1938;
  if (!qword_2691C1938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1938);
  }
  return result;
}

unint64_t sub_246AC1358()
{
  unint64_t result = qword_2691C1940;
  if (!qword_2691C1940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1940);
  }
  return result;
}

unint64_t sub_246AC13B0()
{
  unint64_t result = qword_2691C1948;
  if (!qword_2691C1948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1948);
  }
  return result;
}

unint64_t sub_246AC1408()
{
  unint64_t result = qword_2691C1950;
  if (!qword_2691C1950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1950);
  }
  return result;
}

unint64_t sub_246AC1460()
{
  unint64_t result = qword_2691C1958;
  if (!qword_2691C1958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1958);
  }
  return result;
}

unint64_t sub_246AC14B8()
{
  unint64_t result = qword_2691C1960;
  if (!qword_2691C1960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1960);
  }
  return result;
}

unint64_t sub_246AC1510()
{
  unint64_t result = qword_2691C1968;
  if (!qword_2691C1968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1968);
  }
  return result;
}

unint64_t sub_246AC1568()
{
  unint64_t result = qword_2691C1970;
  if (!qword_2691C1970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1970);
  }
  return result;
}

unint64_t sub_246AC15C0()
{
  unint64_t result = qword_2691C1978;
  if (!qword_2691C1978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1978);
  }
  return result;
}

unint64_t sub_246AC1618()
{
  unint64_t result = qword_2691C1980;
  if (!qword_2691C1980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1980);
  }
  return result;
}

unint64_t sub_246AC1670()
{
  unint64_t result = qword_2691C1988;
  if (!qword_2691C1988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1988);
  }
  return result;
}

unint64_t sub_246AC16C8()
{
  unint64_t result = qword_2691C1990;
  if (!qword_2691C1990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1990);
  }
  return result;
}

unint64_t sub_246AC1720()
{
  unint64_t result = qword_2691C1998;
  if (!qword_2691C1998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1998);
  }
  return result;
}

unint64_t sub_246AC1778()
{
  unint64_t result = qword_2691C19A0;
  if (!qword_2691C19A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19A0);
  }
  return result;
}

unint64_t sub_246AC17D0()
{
  unint64_t result = qword_2691C19A8;
  if (!qword_2691C19A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19A8);
  }
  return result;
}

unint64_t sub_246AC1828()
{
  unint64_t result = qword_2691C19B0;
  if (!qword_2691C19B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19B0);
  }
  return result;
}

unint64_t sub_246AC1880()
{
  unint64_t result = qword_2691C19B8;
  if (!qword_2691C19B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19B8);
  }
  return result;
}

unint64_t sub_246AC18D8()
{
  unint64_t result = qword_2691C19C0;
  if (!qword_2691C19C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19C0);
  }
  return result;
}

unint64_t sub_246AC1930()
{
  unint64_t result = qword_2691C19C8;
  if (!qword_2691C19C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19C8);
  }
  return result;
}

unint64_t sub_246AC1988()
{
  unint64_t result = qword_2691C19D0;
  if (!qword_2691C19D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19D0);
  }
  return result;
}

unint64_t sub_246AC19E0()
{
  unint64_t result = qword_2691C19D8;
  if (!qword_2691C19D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19D8);
  }
  return result;
}

unint64_t sub_246AC1A38()
{
  unint64_t result = qword_2691C19E0;
  if (!qword_2691C19E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19E0);
  }
  return result;
}

unint64_t sub_246AC1A90()
{
  unint64_t result = qword_2691C19E8;
  if (!qword_2691C19E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19E8);
  }
  return result;
}

unint64_t sub_246AC1AE8()
{
  unint64_t result = qword_2691C19F0;
  if (!qword_2691C19F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19F0);
  }
  return result;
}

unint64_t sub_246AC1B40()
{
  unint64_t result = qword_2691C19F8;
  if (!qword_2691C19F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C19F8);
  }
  return result;
}

unint64_t sub_246AC1B98()
{
  unint64_t result = qword_2691C1A00;
  if (!qword_2691C1A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A00);
  }
  return result;
}

unint64_t sub_246AC1BF0()
{
  unint64_t result = qword_2691C1A08;
  if (!qword_2691C1A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A08);
  }
  return result;
}

unint64_t sub_246AC1C48()
{
  unint64_t result = qword_2691C1A10;
  if (!qword_2691C1A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A10);
  }
  return result;
}

unint64_t sub_246AC1CA0()
{
  unint64_t result = qword_2691C1A18;
  if (!qword_2691C1A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A18);
  }
  return result;
}

unint64_t sub_246AC1CF8()
{
  unint64_t result = qword_2691C1A20;
  if (!qword_2691C1A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A20);
  }
  return result;
}

unint64_t sub_246AC1D50()
{
  unint64_t result = qword_2691C1A28;
  if (!qword_2691C1A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A28);
  }
  return result;
}

unint64_t sub_246AC1DA8()
{
  unint64_t result = qword_2691C1A30;
  if (!qword_2691C1A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A30);
  }
  return result;
}

unint64_t sub_246AC1E00()
{
  unint64_t result = qword_2691C1A38;
  if (!qword_2691C1A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A38);
  }
  return result;
}

unint64_t sub_246AC1E58()
{
  unint64_t result = qword_2691C1A40;
  if (!qword_2691C1A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A40);
  }
  return result;
}

unint64_t sub_246AC1EB0()
{
  unint64_t result = qword_2691C1A48;
  if (!qword_2691C1A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A48);
  }
  return result;
}

unint64_t sub_246AC1F08()
{
  unint64_t result = qword_2691C1A50;
  if (!qword_2691C1A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A50);
  }
  return result;
}

unint64_t sub_246AC1F60()
{
  unint64_t result = qword_2691C1A58;
  if (!qword_2691C1A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A58);
  }
  return result;
}

unint64_t sub_246AC1FB8()
{
  unint64_t result = qword_2691C1A60;
  if (!qword_2691C1A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A60);
  }
  return result;
}

unint64_t sub_246AC2010()
{
  unint64_t result = qword_2691C1A68;
  if (!qword_2691C1A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A68);
  }
  return result;
}

unint64_t sub_246AC2068()
{
  unint64_t result = qword_2691C1A70;
  if (!qword_2691C1A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A70);
  }
  return result;
}

unint64_t sub_246AC20C0()
{
  unint64_t result = qword_2691C1A78;
  if (!qword_2691C1A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A78);
  }
  return result;
}

unint64_t sub_246AC2118()
{
  unint64_t result = qword_2691C1A80;
  if (!qword_2691C1A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A80);
  }
  return result;
}

unint64_t sub_246AC2170()
{
  unint64_t result = qword_2691C1A88;
  if (!qword_2691C1A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A88);
  }
  return result;
}

unint64_t sub_246AC21C8()
{
  unint64_t result = qword_2691C1A90;
  if (!qword_2691C1A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A90);
  }
  return result;
}

unint64_t sub_246AC2220()
{
  unint64_t result = qword_2691C1A98;
  if (!qword_2691C1A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1A98);
  }
  return result;
}

unint64_t sub_246AC2278()
{
  unint64_t result = qword_2691C1AA0;
  if (!qword_2691C1AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1AA0);
  }
  return result;
}

unint64_t sub_246AC22D0()
{
  unint64_t result = qword_2691C1AA8;
  if (!qword_2691C1AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1AA8);
  }
  return result;
}

unint64_t sub_246AC2328()
{
  unint64_t result = qword_2691C1AB0;
  if (!qword_2691C1AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1AB0);
  }
  return result;
}

unint64_t sub_246AC2380()
{
  unint64_t result = qword_2691C1AB8;
  if (!qword_2691C1AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1AB8);
  }
  return result;
}

unint64_t sub_246AC23D8()
{
  unint64_t result = qword_2691C1AC0;
  if (!qword_2691C1AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1AC0);
  }
  return result;
}

unint64_t sub_246AC2430()
{
  unint64_t result = qword_2691C1AC8;
  if (!qword_2691C1AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1AC8);
  }
  return result;
}

unint64_t sub_246AC2488()
{
  unint64_t result = qword_2691C1AD0;
  if (!qword_2691C1AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1AD0);
  }
  return result;
}

uint64_t clamp<A>(value:lower:upper:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  BOOL v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246AD9090();
  sub_246AD9080();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a4);
}

CGPoint __swiftcall CGPoint.clip(within:)(__C::CGRect within)
{
  double v3 = v2;
  double v4 = v1;
  CGFloat height = within.size.height;
  CGFloat width = within.size.width;
  CGFloat y = within.origin.y;
  CGFloat x = within.origin.x;
  double MinX = CGRectGetMinX((CGRect)within);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v17);
  if (MaxX >= v4) {
    double MaxX = v4;
  }
  if (MinX > MaxX) {
    double v11 = MinX;
  }
  else {
    double v11 = MaxX;
  }
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v19);
  if (MaxY >= v3) {
    double MaxY = v3;
  }
  if (MinY > MaxY) {
    double v14 = MinY;
  }
  else {
    double v14 = MaxY;
  }
  double v15 = v11;
  result.CGFloat y = v14;
  result.CGFloat x = v15;
  return result;
}

uint64_t sub_246AC2684()
{
  type metadata accessor for SceneEngine();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_246AC26C4();
  qword_2691D4150 = v0;
  return result;
}

uint64_t sub_246AC26C4()
{
  sub_246AD89E0();
  double v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneEngine_stores);
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneEngine_stores) = MEMORY[0x263F8EE78];
  uint64_t v25 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneEngine_sources;
  *(void *)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneEngine_sources) = v2;
  double v3 = (void **)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneEngine_pausables);
  *(void *)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneEngine_pausables) = v2;
  type metadata accessor for SceneStore();
  swift_allocObject();
  uint64_t v26 = v0;
  *(void *)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneEngine_scenes) = sub_246AABCBC();
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x24C540250](v4);
  if (*(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_246AD8C80();
  }
  sub_246AD8C90();
  sub_246AD8C70();
  swift_endAccess();
  uint64_t v5 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_246AD8EC0();
    uint64_t v6 = result;
    if (!result) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_19;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_37;
  }
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      MEMORY[0x24C540420](i, v5);
    }
    else {
      swift_unknownObjectRetain();
    }
    swift_unknownObjectRetain();
    sub_246A8604C(&qword_2691C1B18);
    if (swift_dynamicCast())
    {
      sub_246A961B0(&v27, (uint64_t)v30);
      sub_246A961C8((uint64_t)v30, (uint64_t)&v27);
      swift_beginAccess();
      uint64_t v9 = *v3;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      NSObject *v3 = v9;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v9 = sub_246AD067C(0, v9[2] + 1, 1, v9);
        NSObject *v3 = v9;
      }
      unint64_t v12 = v9[2];
      unint64_t v11 = v9[3];
      if (v12 >= v11 >> 1)
      {
        uint64_t v9 = sub_246AD067C((void *)(v11 > 1), v12 + 1, 1, v9);
        NSObject *v3 = v9;
      }
      v9[2] = v12 + 1;
      sub_246A961B0(&v27, (uint64_t)&v9[5 * v12 + 4]);
      swift_endAccess();
      swift_unknownObjectRelease();
      sub_246A85F9C((uint64_t)v30);
    }
    else
    {
      uint64_t v29 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
      swift_unknownObjectRelease();
      sub_246AABBEC((uint64_t)&v27, &qword_2691C1B20);
    }
  }
LABEL_19:
  swift_bridgeObjectRelease();
  unint64_t v13 = *(void *)(v26 + v25);
  if (!(v13 >> 62))
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v14) {
      goto LABEL_21;
    }
LABEL_35:
    swift_bridgeObjectRelease();
    unint64_t v20 = swift_bridgeObjectRetain();
    uint64_t v21 = sub_246AC2C14(v20);
    swift_bridgeObjectRelease();
    unint64_t v22 = swift_bridgeObjectRetain();
    uint64_t v23 = sub_246AC2C14(v22);
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_246AC3040(v21, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v26 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneEngine_boosters) = v24;
    return v26;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_246AD8EC0();
  uint64_t v14 = result;
  if (!result) {
    goto LABEL_35;
  }
LABEL_21:
  if (v14 >= 1)
  {
    for (uint64_t j = 0; j != v14; ++j)
    {
      if ((v13 & 0xC000000000000001) != 0) {
        MEMORY[0x24C540420](j, v13);
      }
      else {
        swift_unknownObjectRetain();
      }
      swift_unknownObjectRetain();
      sub_246A8604C(&qword_2691C1B18);
      if (swift_dynamicCast())
      {
        sub_246A961B0(&v27, (uint64_t)v30);
        sub_246A961C8((uint64_t)v30, (uint64_t)&v27);
        swift_beginAccess();
        uint64_t v16 = *v3;
        char v17 = swift_isUniquelyReferenced_nonNull_native();
        NSObject *v3 = v16;
        if ((v17 & 1) == 0)
        {
          uint64_t v16 = sub_246AD067C(0, v16[2] + 1, 1, v16);
          NSObject *v3 = v16;
        }
        unint64_t v19 = v16[2];
        unint64_t v18 = v16[3];
        if (v19 >= v18 >> 1)
        {
          uint64_t v16 = sub_246AD067C((void *)(v18 > 1), v19 + 1, 1, v16);
          NSObject *v3 = v16;
        }
        v16[2] = v19 + 1;
        sub_246A961B0(&v27, (uint64_t)&v16[5 * v19 + 4]);
        swift_endAccess();
        swift_unknownObjectRelease();
        sub_246A85F9C((uint64_t)v30);
      }
      else
      {
        uint64_t v29 = 0;
        long long v27 = 0u;
        long long v28 = 0u;
        swift_unknownObjectRelease();
        sub_246AABBEC((uint64_t)&v27, &qword_2691C1B20);
      }
    }
    goto LABEL_35;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_246AC2C14(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_246AD8EC0();
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
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t result = sub_246AC6698(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      uint64_t v3 = v12;
      do
      {
        MEMORY[0x24C540420](v5, a1);
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246AC6698(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_246AC6698(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v12;
        }
        ++v5;
        *(void *)(v3 + 16) = v7 + 1;
        sub_246AC3AD4(v11, (_OWORD *)(v3 + 32 * v7 + 32));
      }
      while (v2 != v5);
    }
    else
    {
      unint64_t v8 = a1 + 32;
      uint64_t v3 = v12;
      do
      {
        swift_unknownObjectRetain();
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246AC6698(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v10 = *(void *)(v3 + 16);
        unint64_t v9 = *(void *)(v3 + 24);
        if (v10 >= v9 >> 1)
        {
          sub_246AC6698(v9 > 1, v10 + 1, 1);
          uint64_t v3 = v12;
        }
        *(void *)(v3 + 16) = v10 + 1;
        sub_246AC3AD4(v11, (_OWORD *)(v3 + 32 * v10 + 32));
        v8 += 8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_246AC2E4C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion11SceneEngine_autoupdatingCalendar;
  uint64_t v2 = sub_246AD8A30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_246AC2F3C()
{
  return type metadata accessor for SceneEngine();
}

uint64_t type metadata accessor for SceneEngine()
{
  uint64_t result = qword_2691C1B08;
  if (!qword_2691C1B08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246AC2F90()
{
  uint64_t result = sub_246AD8A30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *sub_246AC3040(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = a2;
  uint64_t v3 = sub_246AD8AD0();
  uint64_t v57 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  *(void *)&long long v60 = (char *)v56 - v7;
  if (qword_2691C0228 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_246A8AB74(v3, (uint64_t)qword_2691D4030);
  unint64_t v9 = sub_246AD8AB0();
  os_log_type_t v10 = sub_246AD8D00();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl(&dword_246A80000, v9, v10, "Checking for stores or sources that support scene boosting.", v11, 2u);
    MEMORY[0x24C541130](v11, -1, -1);
  }

  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = MEMORY[0x263F8EE58];
  uint64_t v14 = &unk_246ADE000;
  uint64_t v65 = v3;
  double v64 = v6;
  uint64_t v63 = v8;
  if (v12)
  {
    uint64_t v15 = a1 + 32;
    char v62 = (void (**)(char *, uint64_t))(v57 + 16);
    char v61 = (void (**)(uint64_t, uint64_t))(v57 + 8);
    v56[1] = a1;
    swift_bridgeObjectRetain();
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    uint64_t v67 = (void (**)(char *, uint64_t, uint64_t))(v13 + 8);
    *(void *)&long long v17 = 136315394;
    long long v59 = v17;
    uint64_t v18 = v60;
    do
    {
      sub_246AC3A1C(v15, (uint64_t)v76);
      sub_246AC3A1C((uint64_t)v76, (uint64_t)v73);
      sub_246A8604C(&qword_2691C1B28);
      if (swift_dynamicCast())
      {
        sub_246A961B0(&v70, (uint64_t)v75);
        sub_246A961C8((uint64_t)v75, (uint64_t)&v70);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v16 = sub_246AD0668(0, v16[2] + 1, 1, v16);
        }
        unint64_t v20 = v16[2];
        unint64_t v19 = v16[3];
        if (v20 >= v19 >> 1) {
          uint64_t v16 = sub_246AD0668((void *)(v19 > 1), v20 + 1, 1, v16);
        }
        v16[2] = v20 + 1;
        sub_246A961B0(&v70, (uint64_t)&v16[5 * v20 + 4]);
        ((void (*)(uint64_t, uint64_t, uint64_t))*v62)(v18, v8, v3);
        sub_246AC3A1C((uint64_t)v76, (uint64_t)v73);
        sub_246A961C8((uint64_t)v75, (uint64_t)&v70);
        uint64_t v21 = v18;
        unint64_t v22 = sub_246AD8AB0();
        os_log_type_t v23 = sub_246AD8D00();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = swift_slowAlloc();
          uint64_t v25 = swift_slowAlloc();
          uint64_t v66 = v16;
          uint64_t v26 = v25;
          uint64_t v69 = v25;
          *(_DWORD *)uint64_t v24 = v59;
          sub_246A8A6E4(v73, v74);
          uint64_t DynamicType = swift_getDynamicType();
          sub_246A8604C(&qword_2691C1B38);
          uint64_t v27 = sub_246AD8BD0();
          *(void *)(v24 + 4) = sub_246ACB68C(v27, v28, &v69);
          swift_bridgeObjectRelease();
          sub_246A85F9C((uint64_t)v73);
          *(_WORD *)(v24 + 12) = 2080;
          uint64_t v29 = *((void *)&v71 + 1);
          uint64_t v30 = v72;
          sub_246A8A6E4(&v70, *((uint64_t *)&v71 + 1));
          uint64_t DynamicType = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v29, v30);
          sub_246A8604C(&qword_2691C1B40);
          sub_246AC3A78();
          sub_246AA0B18();
          uint64_t v13 = MEMORY[0x263F8EE58];
          uint64_t v31 = sub_246AD8C10();
          unint64_t v33 = v32;
          uint64_t v3 = v65;
          swift_bridgeObjectRelease();
          *(void *)(v24 + 14) = sub_246ACB68C(v31, v33, &v69);
          uint64_t v8 = v63;
          swift_bridgeObjectRelease();
          sub_246A85F9C((uint64_t)&v70);
          _os_log_impl(&dword_246A80000, v22, v23, "  + %s [%s]", (uint8_t *)v24, 0x16u);
          swift_arrayDestroy();
          uint64_t v34 = v26;
          uint64_t v16 = v66;
          MEMORY[0x24C541130](v34, -1, -1);
          uint64_t v35 = v24;
          unint64_t v6 = v64;
          MEMORY[0x24C541130](v35, -1, -1);

          uint64_t v18 = v60;
          (*v61)(v60, v3);
          sub_246A85F9C((uint64_t)v75);
          sub_246A85F9C((uint64_t)v76);
        }
        else
        {

          sub_246A85F9C((uint64_t)&v70);
          sub_246A85F9C((uint64_t)v73);
          (*v61)(v21, v3);
          sub_246A85F9C((uint64_t)v75);
          sub_246A85F9C((uint64_t)v76);
          uint64_t v18 = v21;
        }
      }
      else
      {
        uint64_t v72 = 0;
        long long v70 = 0u;
        long long v71 = 0u;
        sub_246A85F9C((uint64_t)v76);
        sub_246AABBEC((uint64_t)&v70, &qword_2691C1B30);
      }
      v15 += 32;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    uint64_t v14 = (void *)&unk_246ADE000;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v36 = *(void *)(v58 + 16);
  if (v36)
  {
    uint64_t v37 = v58 + 32;
    uint64_t v67 = (void (**)(char *, uint64_t, uint64_t))(v57 + 16);
    char v62 = (void (**)(char *, uint64_t))(v57 + 8);
    swift_bridgeObjectRetain();
    *(void *)&long long v38 = v14[297];
    long long v60 = v38;
    char v61 = (void (**)(uint64_t, uint64_t))(v13 + 8);
    do
    {
      sub_246AC3A1C(v37, (uint64_t)v76);
      sub_246AC3A1C((uint64_t)v76, (uint64_t)v73);
      sub_246A8604C(&qword_2691C1B28);
      if (swift_dynamicCast())
      {
        sub_246A961B0(&v70, (uint64_t)v75);
        sub_246A961C8((uint64_t)v75, (uint64_t)&v70);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v16 = sub_246AD0668(0, v16[2] + 1, 1, v16);
        }
        unint64_t v40 = v16[2];
        unint64_t v39 = v16[3];
        if (v40 >= v39 >> 1) {
          uint64_t v16 = sub_246AD0668((void *)(v39 > 1), v40 + 1, 1, v16);
        }
        v16[2] = v40 + 1;
        sub_246A961B0(&v70, (uint64_t)&v16[5 * v40 + 4]);
        (*v67)(v6, v8, v3);
        sub_246AC3A1C((uint64_t)v76, (uint64_t)v73);
        sub_246A961C8((uint64_t)v75, (uint64_t)&v70);
        uint64_t v41 = sub_246AD8AB0();
        os_log_type_t v42 = sub_246AD8D00();
        if (os_log_type_enabled(v41, v42))
        {
          uint64_t v43 = swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          uint64_t v66 = v16;
          uint64_t v45 = v44;
          uint64_t v69 = v44;
          *(_DWORD *)uint64_t v43 = v60;
          sub_246A8A6E4(v73, v74);
          uint64_t DynamicType = swift_getDynamicType();
          sub_246A8604C(&qword_2691C1B38);
          uint64_t v46 = sub_246AD8BD0();
          *(void *)(v43 + 4) = sub_246ACB68C(v46, v47, &v69);
          swift_bridgeObjectRelease();
          sub_246A85F9C((uint64_t)v73);
          *(_WORD *)(v43 + 12) = 2080;
          uint64_t v49 = *((void *)&v71 + 1);
          uint64_t v48 = v72;
          sub_246A8A6E4(&v70, *((uint64_t *)&v71 + 1));
          uint64_t DynamicType = (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 8))(v49, v48);
          sub_246A8604C(&qword_2691C1B40);
          sub_246AC3A78();
          sub_246AA0B18();
          uint64_t v8 = v63;
          uint64_t v50 = sub_246AD8C10();
          unint64_t v52 = v51;
          swift_bridgeObjectRelease();
          *(void *)(v43 + 14) = sub_246ACB68C(v50, v52, &v69);
          uint64_t v3 = v65;
          swift_bridgeObjectRelease();
          sub_246A85F9C((uint64_t)&v70);
          _os_log_impl(&dword_246A80000, v41, v42, "  + %s [%s]", (uint8_t *)v43, 0x16u);
          swift_arrayDestroy();
          uint64_t v53 = v45;
          uint64_t v16 = v66;
          MEMORY[0x24C541130](v53, -1, -1);
          uint64_t v54 = v43;
          unint64_t v6 = v64;
          MEMORY[0x24C541130](v54, -1, -1);
        }
        else
        {

          sub_246A85F9C((uint64_t)&v70);
          sub_246A85F9C((uint64_t)v73);
        }
        (*v62)(v6, v3);
        sub_246A85F9C((uint64_t)v75);
        sub_246A85F9C((uint64_t)v76);
      }
      else
      {
        uint64_t v72 = 0;
        long long v70 = 0u;
        long long v71 = 0u;
        sub_246A85F9C((uint64_t)v76);
        sub_246AABBEC((uint64_t)&v70, &qword_2691C1B30);
      }
      v37 += 32;
      --v36;
    }
    while (v36);
    swift_bridgeObjectRelease();
  }
  return v16;
}

uint64_t sub_246AC3A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_246AC3A78()
{
  unint64_t result = qword_2691C1B48;
  if (!qword_2691C1B48)
  {
    sub_246A8A7DC(&qword_2691C1B40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1B48);
  }
  return result;
}

_OWORD *sub_246AC3AD4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_246AC3AE4()
{
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t result = *(void *)(v0 + 16);
  if (v2 == 2)
  {
    if (result != 3) {
      goto LABEL_25;
    }
    if (qword_2691C02A0 != -1) {
      uint64_t result = swift_once();
    }
    double v4 = *(double *)v0;
    uint64_t v5 = *(void *)(v0 + 48);
    if (*(double *)&xmmword_2691D4170 <= v4 && v4 <= *((double *)&xmmword_2691D4170 + 1))
    {
      if (*(void *)(v5 + 16))
      {
        uint64_t result = sub_246ACBDC8(2);
        if (v7)
        {
          if (*(void *)(v5 + 16))
          {
            uint64_t result = sub_246ACBDC8(3);
            if (v8)
            {
              CLKMapFractionIntoRange();
              return CLKInterpolateBetweenRects();
            }
          }
        }
      }
    }
    if (*(void *)(v5 + 16))
    {
      uint64_t result = 3;
      return sub_246ACBDC8(result);
    }
  }
  else
  {
    if (v2 != 1)
    {
      if (v2) {
        BOOL v3 = 0;
      }
      else {
        BOOL v3 = result == 1;
      }
      if (!v3)
      {
LABEL_25:
        if (!*(void *)(*(void *)(v0 + 48) + 16)) {
          return result;
        }
        return sub_246ACBDC8(result);
      }
      goto LABEL_23;
    }
    if (result != 2)
    {
      if (result) {
        goto LABEL_25;
      }
LABEL_23:
      if (!*(void *)(*(void *)(v0 + 48) + 16)) {
        return result;
      }
      goto LABEL_24;
    }
    if (qword_2691C0298 != -1) {
      uint64_t result = swift_once();
    }
    uint64_t v9 = *(void *)(*(void *)(v0 + 48) + 16);
    if (*(double *)&xmmword_2691D4160 > *(double *)v0 || *(double *)v0 > *((double *)&xmmword_2691D4160 + 1))
    {
      if (v9)
      {
        uint64_t result = 2;
        return sub_246ACBDC8(result);
      }
    }
    else if (v9)
    {
LABEL_24:
      uint64_t result = 1;
      return sub_246ACBDC8(result);
    }
  }
  return result;
}

double sub_246AC3D10()
{
  double result = 0.0;
  xmmword_2691D4160 = xmmword_246AE4730;
  return result;
}

double sub_246AC3D24()
{
  double result = 0.0;
  xmmword_2691D4170 = xmmword_246AE4740;
  return result;
}

BOOL sub_246AC3D38(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL sub_246AC3D4C(double *a1, double *a2)
{
  return *a2 >= *a1;
}

BOOL sub_246AC3D60(double *a1, double *a2)
{
  return *a1 >= *a2;
}

BOOL sub_246AC3D74(double *a1, double *a2)
{
  return *a2 < *a1;
}

BOOL sub_246AC3D88(double *a1, double *a2)
{
  return *a1 == *a2;
}

unint64_t sub_246AC3DA0()
{
  unint64_t result = qword_2691C1B50;
  if (!qword_2691C1B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1B50);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SceneBoost(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SceneBoost()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SceneBoost(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for SceneBoost(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneBoost(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneBoost(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneBoost()
{
  return &type metadata for SceneBoost;
}

ValueMetadata *type metadata accessor for SceneBoostValue()
{
  return &type metadata for SceneBoostValue;
}

id sub_246AC3FAC()
{
  uint64_t v1 = OBJC_IVAR___NTKEsterbrookSceneBackgroundView____lazy_storage___backgroundDotsLayer;
  unint64_t v2 = *(void **)(v0 + OBJC_IVAR___NTKEsterbrookSceneBackgroundView____lazy_storage___backgroundDotsLayer);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___NTKEsterbrookSceneBackgroundView____lazy_storage___backgroundDotsLayer);
  }
  else
  {
    id v4 = sub_246AC4054();
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    unint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_246AC4054()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
  type metadata accessor for SceneLoader();
  id v1 = sub_246A93A20();
  unint64_t v2 = (void *)sub_246AD8B80();
  id v3 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v2, v1, 0);

  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_imageWithRenderingMode_, 2);

    if (v4)
    {
      sub_246A8604C(&qword_2691C0468);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_246ADE980;
      *(void *)(inited + 32) = 0xD000000000000015;
      *(void *)(inited + 40) = 0x8000000246ADAB00;
      id v6 = objc_allocWithZone(MEMORY[0x263EFF9D0]);
      id v7 = v4;
      *(void *)(inited + 48) = objc_msgSend(v6, sel_init);
      *(void *)(inited + 56) = 0x73746E65746E6F63;
      *(void *)(inited + 64) = 0xE800000000000000;
      *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      sub_246AC72C4(inited);
      sub_246A8604C(&qword_2691C0470);
      char v8 = (void *)sub_246AD8B40();
      swift_bridgeObjectRelease();
      objc_msgSend(v0, sel_setActions_, v8);

      id v9 = objc_msgSend(v7, sel_CGImage);
      objc_msgSend(v0, sel_setContents_, v9);
    }
  }
  return v0;
}

id sub_246AC42CC(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  *(int64x2_t *)&v6[OBJC_IVAR___NTKEsterbrookSceneBackgroundView_defaultDotsSize] = vdupq_n_s64(0x4070500000000000uLL);
  *(void *)&v6[OBJC_IVAR___NTKEsterbrookSceneBackgroundView____lazy_storage___backgroundDotsLayer] = 0;
  uint64_t v13 = OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumPalette;
  id v14 = objc_allocWithZone(MEMORY[0x263F825C8]);
  uint64_t v15 = v6;
  id v16 = objc_msgSend(v14, sel_initWithRed_green_blue_alpha_, 0.156862745, 0.156862745, 0.156862745, 1.0);
  long long v17 = self;
  id v18 = objc_msgSend(v17, sel_blackColor);
  id v19 = objc_msgSend(v17, sel_blackColor);
  unint64_t v20 = (objc_class *)type metadata accessor for ScenePalette();
  uint64_t v21 = (char *)objc_allocWithZone(v20);
  *(void *)&v21[OBJC_IVAR___NTKEsterbrookScenePalette_background] = v16;
  *(void *)&v21[OBJC_IVAR___NTKEsterbrookScenePalette_overlay] = v18;
  *(void *)&v21[OBJC_IVAR___NTKEsterbrookScenePalette_secondHand] = v19;
  v38.receiver = v21;
  v38.super_class = v20;
  *(void *)&v6[v13] = objc_msgSendSuper2(&v38, sel_init);
  *(void *)&v15[OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumProgress] = 0;
  *(void *)&v15[OBJC_IVAR___NTKEsterbrookSceneBackgroundView_scenePalette] = a2;
  id v22 = a2;

  v37.receiver = v15;
  v37.super_class = (Class)type metadata accessor for SceneBackgroundView();
  id v23 = objc_msgSendSuper2(&v37, sel_initWithFrame_, a3, a4, a5, a6);
  id v24 = objc_allocWithZone(MEMORY[0x263EFD188]);
  id v25 = v23;
  id v26 = objc_msgSend(v24, sel_initWithDevice_identitySizeClass_, a1, 6);
  objc_msgSend(v26, sel_scaledSize_, 261.0, 261.0);
  double v28 = v27;
  double v30 = v29;
  id v31 = sub_246AC3FAC();
  objc_msgSend(v31, sel_setFrame_, 0.0, 0.0, v28, v30);

  id v32 = sub_246AC3FAC();
  objc_msgSend(v25, sel_bounds);
  double MidX = CGRectGetMidX(v39);
  objc_msgSend(v25, sel_bounds);
  objc_msgSend(v32, sel_setPosition_, MidX, CGRectGetMidY(v40));

  id v34 = objc_msgSend(v25, sel_layer);
  id v35 = sub_246AC3FAC();
  objc_msgSend(v34, sel_addSublayer_, v35);

  sub_246AC475C();
  return v25;
}

uint64_t sub_246AC45A4(void *a1)
{
  *(int64x2_t *)&v1[OBJC_IVAR___NTKEsterbrookSceneBackgroundView_defaultDotsSize] = vdupq_n_s64(0x4070500000000000uLL);
  uint64_t v3 = OBJC_IVAR___NTKEsterbrookSceneBackgroundView____lazy_storage___backgroundDotsLayer;
  *(void *)&v1[OBJC_IVAR___NTKEsterbrookSceneBackgroundView____lazy_storage___backgroundDotsLayer] = 0;
  uint64_t v4 = OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumPalette;
  id v5 = objc_allocWithZone(MEMORY[0x263F825C8]);
  id v6 = v1;
  id v7 = objc_msgSend(v5, sel_initWithRed_green_blue_alpha_, 0.156862745, 0.156862745, 0.156862745, 1.0);
  char v8 = self;
  id v9 = objc_msgSend(v8, sel_blackColor);
  id v10 = objc_msgSend(v8, sel_blackColor);
  unint64_t v11 = (objc_class *)type metadata accessor for ScenePalette();
  uint64_t v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR___NTKEsterbrookScenePalette_background] = v7;
  *(void *)&v12[OBJC_IVAR___NTKEsterbrookScenePalette_overlay] = v9;
  *(void *)&v12[OBJC_IVAR___NTKEsterbrookScenePalette_secondHand] = v10;
  v16.receiver = v12;
  v16.super_class = v11;
  id v13 = objc_msgSendSuper2(&v16, sel_init);

  *(void *)&v1[v4] = v13;
  *(void *)&v6[OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumProgress] = 0;

  id v14 = *(void **)&v1[v4];
  type metadata accessor for SceneBackgroundView();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_246AC475C()
{
  double v1 = *(double *)&v0[OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumProgress];
  if (v1 == 0.0)
  {
    uint64_t v2 = OBJC_IVAR___NTKEsterbrookSceneBackgroundView_scenePalette;
LABEL_5:
    uint64_t v3 = (char *)*(id *)&v0[v2];
    goto LABEL_6;
  }
  if (v1 == 1.0)
  {
    uint64_t v2 = OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumPalette;
    goto LABEL_5;
  }
  type metadata accessor for ScenePalette();
  id v5 = *(id *)&v0[OBJC_IVAR___NTKEsterbrookSceneBackgroundView_scenePalette];
  uint64_t v3 = (char *)sub_246AD56FC();

LABEL_6:
  objc_msgSend(v0, sel_setBackgroundColor_, *(void *)&v3[OBJC_IVAR___NTKEsterbrookScenePalette_background]);
  id v4 = sub_246AC3FAC();
  id v6 = objc_msgSend(*(id *)&v3[OBJC_IVAR___NTKEsterbrookScenePalette_overlay], sel_CGColor);
  objc_msgSend(v4, sel_setContentsMultiplyColor_, v6);
}

id sub_246AC48CC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneBackgroundView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SceneBackgroundView()
{
  return self;
}

void sub_246AC49E4()
{
  double v1 = v0;
  if (v0[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_showDebugHelpers] == 1)
  {
    id v2 = objc_msgSend(v0, sel_layer);
    uint64_t v3 = self;
    id v4 = objc_msgSend(v3, sel_magentaColor);
    id v5 = objc_msgSend(v4, sel_CGColor);

    objc_msgSend(v2, sel_setBorderColor_, v5);
    id v6 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v6, sel_setBorderWidth_, 1.0);

    uint64_t v7 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugContainerView;
    if (!*(void *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugContainerView])
    {
      objc_msgSend(v1, sel_bounds);
      id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, v8, v9, v10, v11);
      objc_msgSend(v1, sel_addSubview_, v12);
      id v13 = *(void **)&v1[v7];
      *(void *)&v1[v7] = v12;
    }
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, 30.0, 30.0);
    objc_msgSend(v1, sel_bounds);
    double v16 = v15 * 0.5;
    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v14, sel_setCenter_, v16, v17 + -15.0);
    objc_msgSend(*(id *)&v1[v7], sel_addSubview_, v14);
    id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithFrame_, 0.0, 0.0, 30.0, 30.0);
    id v19 = (void *)sub_246AD8B80();
    id v20 = objc_msgSend(self, sel_systemImageNamed_, v19);

    objc_msgSend(v18, sel_setImage_, v20);
    id v21 = objc_msgSend(v3, sel_magentaColor);
    objc_msgSend(v18, sel_setTintColor_, v21);

    objc_msgSend(v14, sel_addSubview_, v18);
    id v22 = *(void **)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugNormalsView];
    *(void *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugNormalsView] = v14;
    id v23 = v14;

    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v1, sel_bounds);
    double v24 = sub_246AAB9C8();
    id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, v24, v25, v26, v27);
    id v29 = objc_msgSend(v3, sel_magentaColor);
    objc_msgSend(v28, sel_setTextColor_, v29);

    objc_msgSend(v28, sel_setTextAlignment_, 1);
    objc_msgSend(v28, sel_setAdjustsFontSizeToFitWidth_, 1);
    id v30 = objc_msgSend(self, sel_systemFontOfSize_, 30.0);
    objc_msgSend(v28, sel_setFont_, v30);

    sub_246AD9030();
    id v31 = (void *)sub_246AD8B80();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_setText_, v31);

    id v32 = *(void **)&v1[v7];
    if (v32) {
      objc_msgSend(v32, sel_addSubview_, v28);
    }
    unint64_t v33 = *(void **)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel];
    *(void *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel] = v28;
  }
  else
  {
    uint64_t v34 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugContainerView;
    objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugContainerView], sel_removeFromSuperview);
    id v35 = *(void **)&v1[v34];
    *(void *)&v1[v34] = 0;

    uint64_t v36 = *(void **)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugNormalsView];
    *(void *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugNormalsView] = 0;

    objc_super v37 = *(void **)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel];
    *(void *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel] = 0;

    id v38 = objc_msgSend(v1, sel_layer);
    id v39 = objc_msgSend(self, sel_clearColor);
    id v40 = objc_msgSend(v39, sel_CGColor);

    objc_msgSend(v38, sel_setBorderColor_, v40);
    id v41 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v41, sel_setBorderWidth_, 0.0);
  }
}

char *sub_246AC4FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for SpriteAnimationAttributes();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Sprite();
  MEMORY[0x270FA5388](v8);
  double v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_needsInitialLayout] = 1;
  *(void *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer] = 0;
  v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_state] = 1;
  *(void *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugContainerView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugNormalsView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel] = 0;
  double v11 = &v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debug_labelPositioning];
  *double v11 = 0;
  v11[1] = 0;
  v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_showDebugHelpers] = 0;
  sub_246AC5ED0(a1, (uint64_t)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite], (uint64_t (*)(void))type metadata accessor for Sprite);
  sub_246AC5ED0(a1, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Sprite);
  sub_246AC5ED0(a2, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SpriteAnimationAttributes);
  objc_allocWithZone((Class)type metadata accessor for SpriteAnimator());
  id v12 = v2;
  *(void *)&v12[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator] = sub_246AAE1DC((uint64_t)v10, (uint64_t)v7);
  unint64_t result = (char *)objc_msgSend(self, sel_currentDevice);
  if (result)
  {
    id v14 = result;
    objc_msgSend(result, sel_screenBounds);
    double v16 = v15;
    double v18 = v17;

    id v19 = (double *)&v12[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_screenSize];
    *id v19 = v16;
    v19[1] = v18;

    uint64_t v20 = a1 + *(int *)(v8 + 20);
    double v21 = v16 * (*(double *)(v20 + 16) / 206.0);
    double v22 = v18 * (*(double *)(v20 + 24) / 251.0);
    id v23 = (objc_class *)type metadata accessor for SpriteView();
    v41.receiver = v12;
    v41.super_class = v23;
    id v24 = objc_msgSendSuper2(&v41, sel_initWithFrame_, 0.0, 0.0, v21, v22);
    double v25 = *(double *)((char *)&unk_246AE4930 + ((*(void *)(a1 + *(int *)(v8 + 28) + 24) >> 59) & 0x18));
    double v26 = (char *)v24;
    objc_msgSend(v26, sel_setAnchorPoint_, 0.5, v25);
    id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
    objc_msgSend(v26, sel_bounds);
    objc_msgSend(v27, sel_setFrame_);
    id v28 = objc_msgSend(v26, sel_layer);
    objc_msgSend(v28, sel_addSublayer_, v27);

    uint64_t v29 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer;
    id v30 = *(void **)&v26[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer];
    *(void *)&v26[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer] = v27;
    id v31 = v27;

    uint64_t v32 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator;
    unint64_t v33 = *(void **)&v26[v29];
    if (v33)
    {
      uint64_t v34 = *(void **)(*(void *)&v26[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator]
                     + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_currentImage);
      id v35 = self;
      id v36 = v34;
      id v37 = v33;
      objc_msgSend(v35, sel_begin);
      objc_msgSend(v35, sel_setDisableActions_, 1);
      objc_msgSend(v37, sel_setContents_, v36);
      objc_msgSend(v35, sel_commit);
    }
    id v38 = *(void **)&v26[v32];
    id v39 = v26;
    id v40 = v38;
    sub_246AAF008((uint64_t)v26, (uint64_t)&off_26FB057A0);

    sub_246AC5F38(a2, (uint64_t (*)(void))type metadata accessor for SpriteAnimationAttributes);
    sub_246AC5F38(a1, (uint64_t (*)(void))type metadata accessor for Sprite);
    return v39;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_246AC5420(void *a1)
{
  v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_needsInitialLayout] = 1;
  *(void *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer] = 0;
  v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_state] = 1;
  *(void *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugContainerView] = 0;
  uint64_t v2 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugNormalsView;
  *(void *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugNormalsView] = 0;
  uint64_t v3 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel;
  *(void *)&v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel] = 0;
  id v4 = &v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debug_labelPositioning];
  *id v4 = 0;
  v4[1] = 0;
  v1[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_showDebugHelpers] = 0;
  uint64_t v5 = *(void **)&v1[v2];
  uint64_t v6 = v1;

  uint64_t v7 = *(void **)&v1[v3];
  type metadata accessor for SpriteView();
  swift_deallocPartialClassInstance();
  return 0;
}

id sub_246AC554C()
{
  uint64_t v1 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer];
  if (v2)
  {
    objc_msgSend(v2, sel_removeFromSuperlayer);
    uint64_t v3 = *(void **)&v0[v1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  *(void *)&v0[v1] = 0;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for SpriteView();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

uint64_t sub_246AC5684()
{
  return type metadata accessor for SpriteView();
}

uint64_t type metadata accessor for SpriteView()
{
  uint64_t result = qword_2691C1BA0;
  if (!qword_2691C1BA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_246AC56D8()
{
  if (v0[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_showDebugHelpers] == 1)
  {
    uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugContainerView];
    if (v1)
    {
      id v2 = v1;
      objc_msgSend(v0, sel_bounds);
      objc_msgSend(v2, sel_setFrame_);
    }
    uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugNormalsView];
    if (v3)
    {
      id v4 = v3;
      objc_msgSend(v0, sel_bounds);
      double v6 = v5 * 0.5;
      objc_msgSend(v0, sel_bounds);
      double v8 = v7;
      objc_msgSend(v4, sel_bounds);
      objc_msgSend(v4, sel_setCenter_, v6, v8 - CGRectGetHeight(v12) * 0.5);
    }
    uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel];
    if (v9)
    {
      id v10 = v9;
      objc_msgSend(v0, sel_bounds);
      objc_msgSend(v0, sel_bounds);
      objc_msgSend(v10, sel_setFrame_, sub_246AAB9C8());
    }
  }
}

uint64_t sub_246AC594C()
{
  uint64_t result = type metadata accessor for Sprite();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_246AC5A14()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_showDebugHelpers) == 1)
  {
    unint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel);
    if (v1)
    {
      id v2 = v1;
      sub_246AD9030();
      uint64_t v3 = (void *)sub_246AD8B80();
      swift_bridgeObjectRelease();
      objc_msgSend(v2, sel_setText_, v3);
    }
  }
}

void sub_246AC5AD4()
{
  if (qword_2691C0240 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_246AD8AD0();
  sub_246A8AB74(v1, (uint64_t)qword_2691D4078);
  id v10 = v0;
  id v2 = sub_246AD8AB0();
  os_log_type_t v3 = sub_246AD8D00();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)id v4 = 136315138;
    uint64_t v11 = v5;
    double v6 = &v10[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite];
    double v7 = (uint64_t *)&v6[*(int *)(type metadata accessor for Sprite() + 20)];
    uint64_t v8 = *v7;
    unint64_t v9 = v7[1];
    swift_bridgeObjectRetain();
    sub_246ACB68C(v8, v9, &v11);
    sub_246AD8D90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v2, v3, "[%s] SpriteView animationDidStart.", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v5, -1, -1);
    MEMORY[0x24C541130](v4, -1, -1);
  }
  else
  {
  }
}

void sub_246AC5CBC()
{
  if (qword_2691C0240 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_246AD8AD0();
  sub_246A8AB74(v1, (uint64_t)qword_2691D4078);
  id v2 = v0;
  os_log_type_t v3 = sub_246AD8AB0();
  os_log_type_t v4 = sub_246AD8D00();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    double v7 = &v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite];
    uint64_t v8 = (uint64_t *)&v7[*(int *)(type metadata accessor for Sprite() + 20)];
    uint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    swift_bridgeObjectRetain();
    sub_246ACB68C(v9, v10, &v15);
    sub_246AD8D90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v3, v4, "[%s] SpriteView animationDidFinish.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v6, -1, -1);
    MEMORY[0x24C541130](v5, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = &v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite];
  CGRect v12 = &v11[*(int *)(type metadata accessor for Sprite() + 32)];
  if (v12[*(int *)(type metadata accessor for Timing(0) + 28)] == 1)
  {
    uint64_t v13 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer], sel_removeFromSuperlayer);
    id v14 = *(void **)&v2[v13];
    *(void *)&v2[v13] = 0;
  }
}

uint64_t sub_246AC5ED0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_246AC5F38(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t destroy for SceneDialLayout()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SceneDialLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SceneDialLayout(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

__n128 initializeWithTake for SceneDialLayout(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SceneDialLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneDialLayout(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SceneDialLayout(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SceneDialLayout()
{
  return &type metadata for SceneDialLayout;
}

double sub_246AC624C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 + 32);
  if (*(void *)(v4 + 16)
    && (uint64_t v6 = sub_246ACBDC8(a2), (v7 & 1) != 0)
    && (uint64_t v8 = *(void *)(*(void *)(v4 + 56) + 8 * v6), *(void *)(v8 + 16))
    && (unint64_t v9 = sub_246ACBDCC(a1), (v10 & 1) != 0))
  {
    uint64_t v11 = *(void *)(v8 + 56) + 16 * v9;
  }
  else
  {
    uint64_t v11 = v3 + 40;
  }
  return *(double *)v11;
}

uint64_t sub_246AC62CC()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_246AC6A94(v0, sub_246AC72B8);
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + 16))
  {
    sub_246A8604C(&qword_2691C1BC8);
    uint64_t v2 = sub_246AD8EF0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v5 = v2;
  uint64_t v3 = (void *)swift_bridgeObjectRetain();
  sub_246AC66B8(v3, 1, &v5);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_246AC63B4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  uint64_t v8 = *(void *)(a2 + 8);
  if (*(void *)(v8 + 16))
  {
    uint64_t v9 = sub_246ACBDC8(a3);
    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
      if (*(void *)(v11 + 16))
      {
        unint64_t v12 = sub_246ACBDCC(a1);
        if (v13) {
          objc_msgSend(a4, sel_scaledPoint_, *(double *)(*(void *)(v11 + 56) + 16 * v12), *(double *)(*(void *)(v11 + 56) + 16 * v12 + 8));
        }
      }
    }
  }
  objc_msgSend(a4, sel_scaledValue_, a5);
  __sincos_stret((double)a1 * -0.523598776 + 1.57079633);
  return a1;
}

void *sub_246AC64C0(uint64_t a1, uint64_t a2)
{
  sub_246A8604C(&qword_2691C1BC8);
  __n128 result = (void *)sub_246AD8ED0();
  int64_t v5 = 0;
  uint64_t v6 = a1 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v11 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v5 << 6))
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8 * i);
    float64x2_t v17 = *(float64x2_t *)(*(void *)(a1 + 56) + 16 * i);
    uint64_t v18 = result[6];
    float64x2_t v19 = *(float64x2_t *)(a2 + 40);
    *(void *)((char *)result + ((i >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << i;
    *(void *)(v18 + 8 * i) = v16;
    *(float64x2_t *)(result[7] + 16 * i) = vaddq_f64(v17, v19);
    uint64_t v20 = result[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    result[2] = v22;
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_24;
    }
    if (v13 >= v10) {
      return result;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v10) {
        return result;
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v10) {
          return result;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v9 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v10) {
    return result;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v10) {
      return result;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_246AC6658(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_246AD084C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_246AC6678(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_246AD09C8(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_246AC6698(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_246AD0D74(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

void sub_246AC66B8(void *a1, char a2, void *a3)
{
  uint64_t v4 = a1[2];
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  swift_bridgeObjectRetain();
  int64_t v10 = (void *)*a3;
  unint64_t v12 = sub_246ACBDCC(v7);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14)) {
    goto LABEL_23;
  }
  char v16 = v11;
  if (v10[3] >= v15)
  {
    if (a2)
    {
      if (v11) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_246ACE364();
      if (v16) {
        goto LABEL_10;
      }
    }
LABEL_13:
    BOOL v21 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    *(void *)(v21[6] + 8 * v12) = v7;
    uint64_t v22 = (void *)(v21[7] + 16 * v12);
    *uint64_t v22 = v8;
    v22[1] = v9;
    uint64_t v23 = v21[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v21[2] = v25;
    uint64_t v26 = v4 - 1;
    if (v4 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    id v27 = a1 + 8;
    while (1)
    {
      uint64_t v28 = *((void *)v27 - 1);
      long long v40 = *v27;
      uint64_t v29 = (void *)*a3;
      unint64_t v30 = sub_246ACBDCC(v28);
      uint64_t v32 = v29[2];
      BOOL v33 = (v31 & 1) == 0;
      BOOL v24 = __OFADD__(v32, v33);
      uint64_t v34 = v32 + v33;
      if (v24) {
        break;
      }
      char v35 = v31;
      if (v29[3] < v34)
      {
        sub_246ACC604(v34, 1);
        unint64_t v30 = sub_246ACBDCC(v28);
        if ((v35 & 1) != (v36 & 1)) {
          goto LABEL_25;
        }
      }
      if (v35) {
        goto LABEL_10;
      }
      id v37 = (void *)*a3;
      *(void *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      *(void *)(v37[6] + 8 * v30) = v28;
      *(_OWORD *)(v37[7] + 16 * v30) = v40;
      uint64_t v38 = v37[2];
      BOOL v24 = __OFADD__(v38, 1);
      uint64_t v39 = v38 + 1;
      if (v24) {
        goto LABEL_24;
      }
      v37[2] = v39;
      id v27 = (_OWORD *)((char *)v27 + 24);
      if (!--v26) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_246ACC604(v15, a2 & 1);
  unint64_t v17 = sub_246ACBDCC(v7);
  if ((v16 & 1) == (v18 & 1))
  {
    unint64_t v12 = v17;
    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    float64x2_t v19 = (void *)swift_allocError();
    swift_willThrow();
    id v20 = v19;
    sub_246A8604C(&qword_2691C0A58);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_246AD90A0();
  __break(1u);
LABEL_26:
  sub_246AD8DF0();
  sub_246AD8BF0();
  sub_246AD8E90();
  sub_246AD8BF0();
  sub_246AD8EB0();
  __break(1u);
}

uint64_t sub_246AC6A0C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_246AC6A94(uint64_t a1, uint64_t (*a2)(void, double))
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_246AC6658(0, v2, 0);
  uint64_t v3 = v30;
  uint64_t result = sub_246AC6A0C(a1);
  uint64_t v7 = result;
  uint64_t v8 = 0;
  uint64_t v9 = a1 + 64;
  int64_t v26 = v2;
  int v27 = v6;
  uint64_t v28 = a1 + 64;
  while ((v7 & 0x8000000000000000) == 0 && v7 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v12 = (unint64_t)v7 >> 6;
    if ((*(void *)(v9 + 8 * ((unint64_t)v7 >> 6)) & (1 << v7)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v6) {
      goto LABEL_24;
    }
    uint64_t result = a2(*(void *)(*(void *)(a1 + 48) + 8 * v7), *(double *)(*(void *)(a1 + 56) + 8 * v7));
    uint64_t v13 = result;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    unint64_t v19 = *(void *)(v30 + 16);
    unint64_t v18 = *(void *)(v30 + 24);
    if (v19 >= v18 >> 1) {
      uint64_t result = sub_246AC6658(v18 > 1, v19 + 1, 1);
    }
    *(void *)(v30 + 16) = v19 + 1;
    id v20 = (void *)(v30 + 24 * v19);
    v20[4] = v13;
    v20[5] = v15;
    v20[6] = v17;
    int64_t v10 = 1 << *(unsigned char *)(a1 + 32);
    if (v7 >= v10) {
      goto LABEL_25;
    }
    uint64_t v9 = a1 + 64;
    uint64_t v21 = *(void *)(v28 + 8 * v12);
    if ((v21 & (1 << v7)) == 0) {
      goto LABEL_26;
    }
    int v6 = v27;
    if (*(_DWORD *)(a1 + 36) != v27) {
      goto LABEL_27;
    }
    unint64_t v22 = v21 & (-2 << (v7 & 0x3F));
    if (v22)
    {
      int64_t v10 = __clz(__rbit64(v22)) | v7 & 0xFFFFFFFFFFFFFFC0;
      int64_t v11 = v26;
    }
    else
    {
      unint64_t v23 = v12 + 1;
      unint64_t v24 = (unint64_t)(v10 + 63) >> 6;
      int64_t v11 = v26;
      if (v12 + 1 < v24)
      {
        unint64_t v25 = *(void *)(v28 + 8 * v23);
        if (v25)
        {
LABEL_20:
          int64_t v10 = __clz(__rbit64(v25)) + (v23 << 6);
        }
        else
        {
          while (v24 - 2 != v12)
          {
            unint64_t v25 = *(void *)(a1 + 80 + 8 * v12++);
            if (v25)
            {
              unint64_t v23 = v12 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v8;
    uint64_t v7 = v10;
    if (v8 == v11) {
      return v3;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void *sub_246AC6CC8(uint64_t a1, void *a2)
{
  sub_246A8604C(&qword_2691C1BC8);
  uint64_t result = (void *)sub_246AD8ED0();
  uint64_t v4 = result;
  int64_t v5 = 0;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v23 = a1 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & v6;
  int64_t v24 = (unint64_t)(v7 + 63) >> 6;
  int64_t v10 = (char *)(result + 8);
  if ((v8 & v6) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v11 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v5 << 6))
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8 * i);
    uint64_t result = objc_msgSend(a2, sel_scaledPoint_, *(double *)(*(void *)(a1 + 56) + 16 * i), *(double *)(*(void *)(a1 + 56) + 16 * i + 8));
    *(void *)&v10[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    *(void *)(v4[6] + 8 * i) = v16;
    uint64_t v17 = (void *)(v4[7] + 16 * i);
    *uint64_t v17 = v18;
    v17[1] = v19;
    uint64_t v20 = v4[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    long long v4[2] = v22;
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_24;
    }
    if (v13 >= v24) {
      return v4;
    }
    unint64_t v14 = *(void *)(v23 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v24) {
        return v4;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v24) {
          return v4;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v9 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v24) {
    return v4;
  }
  unint64_t v14 = *(void *)(v23 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v24) {
      return v4;
    }
    unint64_t v14 = *(void *)(v23 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

__n128 sub_246AC6EC8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = sub_246ACF06C((uint64_t)&unk_26FB01858);
  *(void *)&long long v29 = v4;
  sub_246A8604C(&qword_2691C1BB0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246ADE980;
  *(void *)(inited + 32) = 1;
  *(void *)(inited + 40) = sub_246ACF148((uint64_t)&unk_26FB01938);
  *(void *)(inited + 48) = 2;
  *(void *)(inited + 56) = sub_246ACF148((uint64_t)&unk_26FB01A48);
  unint64_t v6 = sub_246ACF228((void *)inited);
  swift_setDeallocating();
  sub_246A8604C(&qword_2691C1BB8);
  swift_arrayDestroy();
  *((void *)&v29 + 1) = v6;
  unint64_t v7 = sub_246ACF148((uint64_t)&unk_26FB01B10);
  *(void *)&long long v30 = v7;
  unint64_t v8 = sub_246ACF228(MEMORY[0x263F8EE78]);
  unint64_t v31 = v8;
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD188]), sel_initWithDevice_identitySizeClass_, a1, 2);
  objc_msgSend(v9, sel_setScale_forSizeClass_, 6, 1.2376);
  sub_246A8604C(&qword_2691C1BC0);
  uint64_t v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_246AE4970;
  *(void *)(v10 + 32) = 1;
  objc_msgSend(v9, sel_scaledSize_, 25.0, 25.0);
  *(void *)(v10 + 40) = 0;
  *(void *)(v10 + 48) = 0;
  *(void *)(v10 + 56) = v11;
  *(void *)(v10 + 64) = v12;
  *(void *)(v10 + 72) = 2;
  objc_msgSend(v9, sel_scaledSize_, 13.0, 15.0);
  *(void *)(v10 + 80) = 0;
  *(void *)(v10 + 88) = 0;
  *(void *)(v10 + 96) = v13;
  *(void *)(v10 + 104) = v14;
  *(void *)(v10 + 112) = 3;
  objc_msgSend(v9, sel_scaledSize_, 16.5, 19.0);
  *(void *)(v10 + 120) = 0;
  *(void *)(v10 + 128) = 0;
  *(void *)(v10 + 136) = v15;
  *(void *)(v10 + 144) = v16;
  unint64_t v17 = sub_246ACF234(v10);
  swift_setDeallocating();
  *((void *)&v30 + 1) = v17;
  objc_msgSend(a1, sel_screenBounds);
  CGFloat MidX = CGRectGetMidX(v39);
  objc_msgSend(a1, sel_screenBounds);
  v32.n128_f64[0] = MidX;
  v32.n128_u64[1] = CGRectGetMidY(v40);
  unint64_t v33 = v4;
  unint64_t v34 = v6;
  unint64_t v35 = v7;
  unint64_t v36 = v17;
  unint64_t v37 = v8;
  unsigned long long v38 = __PAIR128__(v32.n128_u64[1], *(unint64_t *)&MidX);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_246AC62CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_246AC62CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setScale_forSizeClass_, 2, 0.957);
  id v21 = v9;
  uint64_t v22 = swift_bridgeObjectRetain();
  uint64_t v23 = sub_246AC6CC8(v22, v21);
  swift_bridgeObjectRelease();

  int64_t v24 = sub_246AC64C0((uint64_t)v23, (uint64_t)&v29);
  swift_release();
  uint64_t v25 = swift_initStackObject();
  *(void *)(v25 + 32) = 1;
  *(_OWORD *)(v25 + 16) = xmmword_246AE4970;
  *(void *)(v25 + 40) = v19;
  *(void *)(v25 + 48) = 2;
  *(void *)(v25 + 56) = v20;
  *(void *)(v25 + 64) = 3;
  *(void *)(v25 + 72) = v24;
  unint64_t v26 = sub_246ACF228((void *)v25);
  swift_setDeallocating();
  swift_arrayDestroy();

  swift_bridgeObjectRelease();
  __n128 result = v32;
  long long v28 = v30;
  *(_OWORD *)a2 = v29;
  *(_OWORD *)(a2 + 16) = v28;
  *(void *)(a2 + 32) = v26;
  *(__n128 *)(a2 + 40) = result;
  return result;
}

uint64_t sub_246AC72B8(uint64_t a1, double a2)
{
  return sub_246AC63B4(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), a2);
}

unint64_t sub_246AC72C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_246A8604C(&qword_2691C1C38);
  uint64_t v2 = (void *)sub_246AD8EF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_246ACBE10(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_246AC73E0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_246A8604C(&qword_2691C1C20);
  uint64_t v2 = (void *)sub_246AD8EF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (id *)(a1 + 40);
  while (1)
  {
    char v5 = *(unsigned char *)v4;
    id v6 = *(v4 - 1);
    unint64_t result = sub_246ACBFF8((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v6;
    *(unsigned char *)(v2[7] + result) = v5;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
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

uint64_t sub_246AC74E0()
{
  return sub_246AD9140();
}

uint64_t sub_246AC7534()
{
  return sub_246AD9110();
}

uint64_t sub_246AC7570()
{
  return sub_246AD9140();
}

void *sub_246AC75C0@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 5) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result == 2) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_246AC75E0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 2;
  if (*v1) {
    uint64_t v2 = 5;
  }
  *a1 = v2;
}

uint64_t sub_246AC75FC()
{
  int v1 = *(unsigned __int8 *)(v0 + 48);
  if (v1 != 2 && (v1 & 1) == 0) {
    return 0;
  }
  if (!*(void *)(v0 + 64)) {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_246AD8BF0();
  swift_bridgeObjectRelease();
  return 0x6F72627265747365;
}

uint64_t sub_246AC76AC(long long *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  int v27 = a3;
  uint64_t v28 = a2;
  unint64_t v26 = a1;
  uint64_t v5 = sub_246AD8D20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246AD8D10();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_246AD8B10();
  MEMORY[0x270FA5388](v10 - 8);
  *(unsigned char *)(v3 + 73) = 1;
  uint64_t v11 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCache;
  uint64_t v12 = MEMORY[0x263F8EE78];
  *(void *)(v4 + v11) = sub_246ACF80C(MEMORY[0x263F8EE78], &qword_2691C1C30);
  *(unsigned char *)(v4 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCacheIsValid) = 0;
  *(void *)(v4 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_lastRequestedIndex) = 0;
  uint64_t v13 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cachedIndexes;
  *(void *)(v4 + v13) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F089C8]), sel_init);
  uint64_t v25 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cacheIsolationQueue;
  v24[4] = sub_246ACF900();
  sub_246AD8B00();
  uint64_t v29 = v12;
  v24[2] = sub_246ACF940(&qword_2691C1C98, MEMORY[0x263F8F0F8]);
  v24[1] = sub_246A8604C(&qword_2691C1CA0);
  v24[3] = sub_246ACF988(&qword_2691C1CA8, &qword_2691C1CA0);
  sub_246AD8DD0();
  uint64_t v14 = *MEMORY[0x263F8F130];
  uint64_t v15 = v6 + 104;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v24[0] = v15;
  v16(v8, v14, v5);
  *(void *)(v4 + v25) = sub_246AD8D50();
  uint64_t v25 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameGenerationQueue;
  sub_246AD8B00();
  uint64_t v29 = MEMORY[0x263F8EE78];
  sub_246AD8DD0();
  v16(v8, v14, v5);
  *(void *)(v4 + v25) = sub_246AD8D50();
  unint64_t v17 = v26;
  uint64_t v18 = v27;
  *(_OWORD *)(v4 + 57) = *(long long *)((char *)v26 + 41);
  long long v19 = v17[2];
  long long v20 = *v17;
  *(_OWORD *)(v4 + 32) = v17[1];
  *(_OWORD *)(v4 + 48) = v19;
  *(_OWORD *)(v4 + 16) = v20;
  uint64_t v21 = v18[1];
  *(void *)(v4 + 80) = *v18;
  *(void *)(v4 + 88) = v21;
  uint64_t v22 = v28;
  sub_246ACF9D8(v28, v4 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_timing, type metadata accessor for Timing);
  swift_bridgeObjectRetain();
  sub_246AC8754();
  sub_246ACFA40((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for SpriteAnimationAttributes);
  sub_246ACFA40(v22, type metadata accessor for Timing);
  return v4;
}

uint64_t sub_246AC7AB8()
{
  int v1 = (void *)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCache);
  swift_beginAccess();
  void *v1 = MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
  uint64_t v2 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cachedIndexes;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cachedIndexes), sel_removeAllIndexes);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_246ACFA40(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_timing, type metadata accessor for Timing);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_246AC7BD4()
{
  return type metadata accessor for AtlasImageCache();
}

uint64_t type metadata accessor for AtlasImageCache()
{
  uint64_t result = qword_2691C1BF8;
  if (!qword_2691C1BF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246AC7C28()
{
  uint64_t result = type metadata accessor for Timing(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_246AC7D08(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246AD8AD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_timing;
  uint64_t v9 = type metadata accessor for Timing(0);
  uint64_t v10 = *(void *)(v8 + *(int *)(v9 + 20));
  uint64_t v11 = *(void *)(v8 + *(int *)(v9 + 24));
  if (v11 < v10)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v10 > a1 || v11 < a1)
  {
    if (qword_2691C0218 == -1)
    {
LABEL_8:
      uint64_t v13 = sub_246A8AB74(v4, (uint64_t)qword_2691D4000);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
      swift_retain_n();
      uint64_t v14 = sub_246AD8AB0();
      os_log_type_t v15 = sub_246AD8CF0();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        v27[0] = swift_slowAlloc();
        uint64_t v34 = v27[0];
        *(_DWORD *)uint64_t v16 = 134218242;
        uint64_t aBlock = a1;
        sub_246AD8D90();
        *(_WORD *)(v16 + 12) = 2080;
        v27[1] = v11;
        v27[2] = v10;
        uint64_t aBlock = 0;
        unint64_t v29 = 0xE000000000000000;
        sub_246AD8E90();
        sub_246AD8BF0();
        sub_246AD8E90();
        uint64_t aBlock = sub_246ACB68C(aBlock, v29, &v34);
        sub_246AD8D90();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_246A80000, v14, v15, "Out of bound frame; requested (%ld) but there are only %s frames)",
          (uint8_t *)v16,
          0x16u);
        uint64_t v17 = v27[0];
        swift_arrayDestroy();
        MEMORY[0x24C541130](v17, -1, -1);
        MEMORY[0x24C541130](v16, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return 0;
    }
LABEL_16:
    swift_once();
    goto LABEL_8;
  }
  uint64_t v34 = 0;
  uint64_t v18 = *(void **)(v2 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cacheIsolationQueue);
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  long long v20 = (void *)swift_allocObject();
  v20[2] = v19;
  v20[3] = a1;
  v20[4] = &v34;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_246ACF018;
  *(void *)(v21 + 24) = v20;
  __n128 v32 = sub_246ACFAA0;
  uint64_t v33 = v21;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v29 = 1107296256;
  long long v30 = sub_246AC872C;
  unint64_t v31 = &unk_26FB05BD8;
  uint64_t v22 = _Block_copy(&aBlock);
  uint64_t v23 = v18;
  swift_retain();
  swift_release();
  dispatch_sync(v23, v22);

  _Block_release(v22);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    sub_246AC8754();
    uint64_t v26 = v34;
    swift_release();
    return v26;
  }
  __break(1u);
  return result;
}

void sub_246AC8198(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v5 = sub_246AD8B20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (void *)((char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v10 = (_OWORD *)Strong;
  if (*(void *)(Strong + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_lastRequestedIndex) != a2)
  {
    *(void *)(Strong + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_lastRequestedIndex) = a2;
    uint64_t v11 = *(void **)(Strong + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cacheIsolationQueue);
    *uint64_t v8 = v11;
    (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F0E0], v5);
    id v12 = v11;
    LOBYTE(v11) = sub_246AD8B30();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
    if ((v11 & 1) == 0)
    {
      __break(1u);
      goto LABEL_29;
    }
    *((unsigned char *)v10 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCacheIsValid) = 0;
  }
  uint64_t v13 = (uint64_t *)((char *)v10 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCache);
  swift_beginAccess();
  uint64_t v14 = *v13;
  if (*(void *)(v14 + 16) && (unint64_t v15 = sub_246ACBDCC(a2), (v16 & 1) != 0))
  {
    uint64_t v17 = *(void **)(*(void *)(v14 + 56) + 8 * v15);
    id v18 = v17;
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v19 = *a3;
  *a3 = v17;

  if (*a3) {
    goto LABEL_10;
  }
  long long v20 = v10[2];
  v43[0] = v10[1];
  v43[1] = v20;
  v44[0] = v10[3];
  *(_OWORD *)((char *)v44 + 9) = *(_OWORD *)((char *)v10 + 57);
  sub_246AAF11C((uint64_t)v43);
  uint64_t v21 = sub_246A9BE00(a2);
  unint64_t v23 = v22;
  sub_246ACF034((uint64_t)v43);
  if (!v23)
  {
LABEL_18:
    if (qword_2691C0218 == -1)
    {
LABEL_19:
      uint64_t v32 = sub_246AD8AD0();
      sub_246A8AB74(v32, (uint64_t)qword_2691D4000);
      uint64_t v33 = sub_246AD8AB0();
      os_log_type_t v34 = sub_246AD8CF0();
      if (!os_log_type_enabled(v33, v34))
      {

LABEL_10:
        swift_release();
        return;
      }
      unint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v35 = 134217984;
      uint64_t v42 = a2;
      sub_246AD8D90();
      _os_log_impl(&dword_246A80000, v33, v34, "Failed to create image for undrawn frame at index: %ld", v35, 0xCu);
      MEMORY[0x24C541130](v35, -1, -1);
      goto LABEL_25;
    }
LABEL_29:
    swift_once();
    goto LABEL_19;
  }
  CGImageRef v24 = sub_246ACA76C(v21, v23);
  if (!v24)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  CGImageRef v25 = v24;
  if (qword_2691C0218 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_246AD8AD0();
  uint64_t v27 = sub_246A8AB74(v26, (uint64_t)qword_2691D4000);
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_246AD8AB0();
  os_log_type_t v29 = sub_246AD8D00();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    v40[0] = swift_slowAlloc();
    uint64_t v42 = v40[0];
    *(_DWORD *)uint64_t v30 = 136315394;
    v40[1] = v27;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_246ACB68C(v21, v23, &v42);
    sub_246AD8D90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 12) = 2048;
    uint64_t v41 = a2;
    sub_246AD8D90();
    _os_log_impl(&dword_246A80000, v28, v29, "Caching image frame named: %s at index: %ld", (uint8_t *)v30, 0x16u);
    uint64_t v31 = v40[0];
    swift_arrayDestroy();
    MEMORY[0x24C541130](v31, -1, -1);
    MEMORY[0x24C541130](v30, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_246ACA5B4(v25, a2);
  unint64_t v36 = *a3;
  *a3 = v25;
  unint64_t v37 = v25;

  uint64_t v33 = sub_246AD8AB0();
  os_log_type_t v38 = sub_246AD8CD0();
  if (os_log_type_enabled(v33, v38))
  {
    CGRect v39 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)CGRect v39 = 134217984;
    uint64_t v42 = a2;
    sub_246AD8D90();
    _os_log_impl(&dword_246A80000, v33, v38, "Returning undrawn frame at index %ld", v39, 0xCu);
    MEMORY[0x24C541130](v39, -1, -1);

LABEL_25:
    swift_release();

    return;
  }

  swift_release();
}

uint64_t sub_246AC872C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_246AC8754()
{
  uint64_t v1 = sub_246AD8AE0();
  uint64_t v14 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_246AD8B10();
  uint64_t v4 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameGenerationQueue);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_246ACF010;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_246AA7758;
  aBlock[3] = &unk_26FB05B60;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = v7;
  swift_retain();
  sub_246AD8AF0();
  uint64_t v15 = MEMORY[0x263F8EE78];
  sub_246ACF940(&qword_2691C1138, MEMORY[0x263F8F030]);
  sub_246A8604C(&qword_2691C1140);
  sub_246ACF988((unint64_t *)&qword_2691C1148, &qword_2691C1140);
  sub_246AD8DD0();
  MEMORY[0x24C540350](0, v6, v3, v9);
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
  swift_release();
  return swift_release();
}

uint64_t sub_246AC8A28()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_246AC8A80();
    return swift_release();
  }
  return result;
}

uint64_t sub_246AC8A80()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_246AD8B20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameGenerationQueue);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F0E0], v2);
  id v7 = v6;
  LOBYTE(v6) = sub_246AD8B30();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F089C8]), sel_init);
  uint64_t v44 = 0;
  id v45 = v9;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v41 = 0;
  uint64_t v10 = v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_timing;
  int v11 = *(unsigned __int8 *)(v10 + *(int *)(type metadata accessor for Timing(0) + 28));
  uint64_t v12 = *(void **)(v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cacheIsolationQueue);
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(unsigned char *)(v14 + 24) = v11 == 3;
  *(void *)(v14 + 32) = &v45;
  *(void *)(v14 + 40) = &v43;
  *(void *)(v14 + 48) = &v41;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_246ACEF4C;
  *(void *)(v15 + 24) = v14;
  CGRect v39 = sub_246ACFAA0;
  uint64_t v40 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  unint64_t v37 = sub_246AC872C;
  os_log_type_t v38 = &unk_26FB05A48;
  char v16 = _Block_copy(&aBlock);
  uint64_t v17 = v12;
  swift_retain();
  swift_release();
  dispatch_sync(v17, v16);

  _Block_release(v16);
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v16)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!objc_msgSend(v45, sel_count))
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    goto LABEL_10;
  }
  uint64_t v18 = swift_allocObject();
  swift_weakInit();
  uint64_t v19 = v44;
  id v20 = v45;
  uint64_t v21 = v43;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_246ACEF70;
  *(void *)(v22 + 24) = v18;
  CGRect v39 = sub_246ACEF88;
  uint64_t v40 = v22;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  unint64_t v37 = sub_246AC9608;
  os_log_type_t v38 = &unk_26FB05A98;
  unint64_t v23 = _Block_copy(&aBlock);
  id v24 = v20;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v24, sel_enumerateRangesInRange_options_usingBlock_, v21, v19, 0, v23);

  _Block_release(v23);
  LOBYTE(v21) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v21) {
    goto LABEL_13;
  }
  if (v11 != 3)
  {
    swift_release();
    uint64_t v32 = 0;
    uint64_t v31 = sub_246ACEF70;
    goto LABEL_10;
  }
  id v25 = v45;
  uint64_t v26 = v41;
  uint64_t v27 = v42;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_246ACEF70;
  *(void *)(v28 + 24) = v18;
  CGRect v39 = sub_246ACFAC4;
  uint64_t v40 = v28;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  unint64_t v37 = sub_246AC9608;
  os_log_type_t v38 = &unk_26FB05AE8;
  os_log_type_t v29 = _Block_copy(&aBlock);
  swift_retain();
  id v30 = v25;
  swift_retain();
  swift_release();
  objc_msgSend(v30, sel_enumerateRangesInRange_options_usingBlock_, v26, v27, 0, v29);

  _Block_release(v29);
  LOBYTE(v26) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v26 & 1) == 0)
  {
    uint64_t v31 = sub_246ACEF70;
    uint64_t v32 = sub_246ACEF70;
LABEL_10:
    id v33 = v45;
    swift_release();

    sub_246ACEFB0((uint64_t)v31);
    return sub_246ACEFB0((uint64_t)v32);
  }
LABEL_14:
  __break(1u);
  return result;
}

void sub_246AC9040(uint64_t a1, char a2, void **a3, void *a4, void *a5)
{
  uint64_t v9 = sub_246AD8A60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = Strong;
    if (*(unsigned char *)(Strong + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCacheIsValid))
    {
LABEL_24:
      swift_release();
      return;
    }
    *(unsigned char *)(Strong + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCacheIsValid) = 1;
    uint64_t v15 = Strong + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_timing;
    uint64_t v16 = type metadata accessor for Timing(0);
    uint64_t v17 = *(int *)(v16 + 20);
    uint64_t v18 = *(int *)(v16 + 24);
    uint64_t v19 = *(void *)(v15 + v17);
    uint64_t v20 = *(void *)(v15 + v18);
    BOOL v21 = __OFSUB__(v20, v19);
    BOOL v22 = v20 < v19;
    uint64_t v23 = v20 - v19;
    if (v22)
    {
      __break(1u);
    }
    else if (!v21)
    {
      BOOL v21 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (!v21)
      {
        uint64_t v49 = v15;
        uint64_t v50 = a3;
        unint64_t v51 = a4;
        uint64_t v25 = 2;
        if (*(unsigned char *)(v14 + 73)) {
          uint64_t v25 = 5;
        }
        if (v25 >= v24) {
          uint64_t v26 = v24;
        }
        else {
          uint64_t v26 = v25;
        }
        uint64_t v27 = *(void *)(v14 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_lastRequestedIndex);
        uint64_t v28 = v24 - v27;
        if (!__OFSUB__(v24, v27))
        {
          id v45 = a5;
          uint64_t v46 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_lastRequestedIndex;
          uint64_t v47 = v18;
          uint64_t v48 = v17;
          if (v28 < 0)
          {
            uint64_t v28 = 0;
            uint64_t v29 = v26;
            if (v24 <= 0)
            {
LABEL_15:
              id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F089C8]), sel_initWithIndexesInRange_, v27, v29);
              uint64_t v31 = v30;
              if (v29 >= v26 || (a2 & 1) == 0)
              {
LABEL_19:
                uint64_t v32 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cachedIndexes;
                if (objc_msgSend(*(id *)(v14+ OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cachedIndexes), sel_isEqualToIndexSet_, v31, v45))
                {
                  swift_release();

                  return;
                }
                sub_246AD8A50();
                id v33 = objc_allocWithZone(MEMORY[0x263F089C8]);
                uint64_t v34 = (void *)sub_246AD8A40();
                id v35 = objc_msgSend(v33, sel_initWithIndexSet_, v34);

                (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
                objc_msgSend(v35, sel_removeIndexes_, v31);
                uint64_t v36 = swift_allocObject();
                *(void *)(v36 + 16) = sub_246ACEFD0;
                *(void *)(v36 + 24) = v14;
                aBlock[4] = sub_246ACEFE8;
                aBlock[5] = v36;
                aBlock[0] = MEMORY[0x263EF8330];
                aBlock[1] = 1107296256;
                aBlock[2] = sub_246AC9534;
                aBlock[3] = &unk_26FB05B38;
                unint64_t v37 = _Block_copy(aBlock);
                swift_retain();
                swift_retain();
                swift_release();
                objc_msgSend(v35, sel_enumerateIndexesUsingBlock_, v37);
                _Block_release(v37);
                LOBYTE(v37) = swift_isEscapingClosureAtFileLocation();
                swift_release();
                if ((v37 & 1) == 0)
                {
                  objc_msgSend(*(id *)(v14 + v32), sel_removeIndexes_, v35);
                  objc_msgSend(v31, sel_removeIndexes_, v35);
                  os_log_type_t v38 = *v50;
                  *uint64_t v50 = v31;
                  id v39 = v31;

                  uint64_t v40 = v46;
                  uint64_t v41 = v51;
                  *unint64_t v51 = *(void *)(v14 + v46);
                  v41[1] = v28;
                  uint64_t v42 = *(void *)(v49 + v48);
                  if (*(void *)(v49 + v47) >= v42)
                  {
                    uint64_t v43 = *(void *)(v14 + v40);
                    swift_release();

                    uint64_t v44 = v45;
                    *id v45 = v42;
                    v44[1] = v43;
                    goto LABEL_24;
                  }
LABEL_34:
                  __break(1u);
                  return;
                }
LABEL_33:
                __break(1u);
                goto LABEL_34;
              }
              if (!__OFSUB__(v26, v29))
              {
                objc_msgSend(v30, sel_addIndexesInRange_, v19, v26 - v29);
                goto LABEL_19;
              }
LABEL_32:
              __break(1u);
              goto LABEL_33;
            }
          }
          else
          {
            uint64_t v29 = v26;
            if (v28 >= v26) {
              goto LABEL_15;
            }
          }
          uint64_t v29 = v28;
          goto LABEL_15;
        }
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    __break(1u);
    goto LABEL_30;
  }
}

void sub_246AC946C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)(a3 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCache);
  swift_beginAccess();
  unint64_t v5 = sub_246ACBDCC(a1);
  uint64_t v6 = 0;
  if (v7)
  {
    unint64_t v8 = v5;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v4;
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_246ACEC30(&qword_2691C1C30);
      uint64_t v10 = v11;
    }
    uint64_t v6 = *(void **)(*(void *)(v10 + 56) + 8 * v8);
    sub_246ACDA50(v8, v10);
    *uint64_t v4 = v10;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
}

uint64_t sub_246AC9534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 32))(a2, a3);
}

void sub_246AC9564(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (a2 + a1 < a1)
    {
      __break(1u);
    }
    else
    {
      sub_246AC963C(a1);
      if (!a2)
      {
LABEL_7:
        swift_release();
        return;
      }
      if (a2 + a1 > a1)
      {
        uint64_t v4 = a1 + 1;
        do
        {
          sub_246AC963C(v4++);
          --a2;
        }
        while (a2);
        goto LABEL_7;
      }
    }
    __break(1u);
  }
}

uint64_t sub_246AC9608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4);
}

void sub_246AC963C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246AD8B20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (uint64_t *)((char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = *(void **)((char *)v2 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameGenerationQueue);
  *char v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F0E0], v4);
  id v9 = v8;
  LOBYTE(v8) = sub_246AD8B30();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v10 = (char *)v2 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_timing;
  uint64_t v11 = type metadata accessor for Timing(0);
  uint64_t v12 = *(void *)&v10[*(int *)(v11 + 20)];
  uint64_t v13 = *(void *)&v10[*(int *)(v11 + 24)];
  if (v13 < v12)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v12 > a1 || v13 < a1) {
    return;
  }
  char v62 = 1;
  uint64_t v15 = OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cacheIsolationQueue;
  uint64_t v16 = *(void **)((char *)v2 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cacheIsolationQueue);
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = (void *)swift_allocObject();
  void v18[2] = v17;
  v18[3] = &v62;
  v18[4] = a1;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_246ACEE50;
  *(void *)(v19 + 24) = v18;
  *(void *)&v65[0] = sub_246ACEE6C;
  *((void *)&v65[0] + 1) = v19;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v64 = sub_246AC872C;
  *((void *)&v64 + 1) = &unk_26FB05958;
  uint64_t v20 = _Block_copy(&aBlock);
  BOOL v21 = v16;
  swift_retain();
  swift_release();
  dispatch_sync(v21, v20);

  _Block_release(v20);
  LOBYTE(v20) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v20) {
    goto LABEL_34;
  }
  if (v62 != 1)
  {
    swift_release();
    return;
  }
  long long v22 = v2[2];
  long long aBlock = v2[1];
  long long v64 = v22;
  v65[0] = v2[3];
  *(_OWORD *)((char *)v65 + 9) = *(_OWORD *)((char *)v2 + 57);
  uint64_t v23 = sub_246A9BE00(a1);
  if (!v24)
  {
    if (qword_2691C0218 == -1)
    {
LABEL_15:
      uint64_t v32 = sub_246AD8AD0();
      sub_246A8AB74(v32, (uint64_t)qword_2691D4000);
      id v33 = sub_246AD8AB0();
      os_log_type_t v34 = sub_246AD8CF0();
      if (!os_log_type_enabled(v33, v34))
      {
LABEL_22:
        swift_release();

        return;
      }
      id v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v35 = 134217984;
      v60[0] = a1;
      sub_246AD8D90();
      _os_log_impl(&dword_246A80000, v33, v34, "No image name for frame index: %ld", v35, 0xCu);
      uint64_t v36 = (uint64_t)v35;
LABEL_21:
      MEMORY[0x24C541130](v36, -1, -1);
      goto LABEL_22;
    }
LABEL_36:
    swift_once();
    goto LABEL_15;
  }
  uint64_t v25 = v23;
  unint64_t v26 = v24;
  uint64_t v27 = sub_246ACA76C(v23, v24);
  if (!v27)
  {
    if (qword_2691C0218 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_246AD8AD0();
    sub_246A8AB74(v37, (uint64_t)qword_2691D4000);
    swift_bridgeObjectRetain();
    id v33 = sub_246AD8AB0();
    os_log_type_t v38 = sub_246AD8CF0();
    if (!os_log_type_enabled(v33, v38))
    {
      swift_release();

      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v39 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    v60[0] = v40;
    *(_DWORD *)uint64_t v39 = 134218242;
    uint64_t v61 = a1;
    sub_246AD8D90();
    *(_WORD *)(v39 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_246ACB68C(v25, v26, v60);
    sub_246AD8D90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246A80000, v33, v38, "Unable to create CGImage for frame index: %ld with image name: %s", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v40, -1, -1);
    uint64_t v36 = v39;
    goto LABEL_21;
  }
  uint64_t v28 = v27;
  uint64_t v29 = sub_246ACA1B4(v27);
  uint64_t v59 = v25;
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = v29;
  }
  else
  {
    if (qword_2691C0218 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_246AD8AD0();
    sub_246A8AB74(v41, (uint64_t)qword_2691D4000);
    swift_bridgeObjectRetain_n();
    uint64_t v42 = sub_246AD8AB0();
    os_log_type_t v43 = sub_246AD8CF0();
    int v44 = v43;
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v45 = swift_slowAlloc();
      int v57 = v44;
      uint64_t v46 = v45;
      uint64_t v58 = swift_slowAlloc();
      v60[0] = v58;
      *(_DWORD *)uint64_t v46 = 134218242;
      uint64_t v61 = a1;
      sub_246AD8D90();
      *(_WORD *)(v46 + 12) = 2080;
      uint64_t v56 = v46 + 14;
      swift_bridgeObjectRetain();
      uint64_t v61 = sub_246ACB68C(v25, v26, v60);
      sub_246AD8D90();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246A80000, v42, (os_log_type_t)v57, "Predrawing failed for image at index: %ld with name: %s", (uint8_t *)v46, 0x16u);
      uint64_t v47 = v58;
      swift_arrayDestroy();
      MEMORY[0x24C541130](v47, -1, -1);
      MEMORY[0x24C541130](v46, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v30 = v28;
    uint64_t v31 = 0;
  }
  uint64_t v48 = *(void **)((char *)v2 + v15);
  uint64_t v49 = swift_allocObject();
  swift_weakInit();
  uint64_t v50 = (void *)swift_allocObject();
  v50[2] = v49;
  v50[3] = v30;
  uint64_t v51 = v59;
  v50[4] = a1;
  v50[5] = v51;
  v50[6] = v26;
  a1 = swift_allocObject();
  *(void *)(a1 + 16) = sub_246ACEEF4;
  *(void *)(a1 + 24) = v50;
  v60[4] = (uint64_t)sub_246ACFAA0;
  v60[5] = a1;
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 1107296256;
  v60[2] = (uint64_t)sub_246AC872C;
  uint64_t v60[3] = (uint64_t)&unk_26FB059D0;
  unint64_t v52 = _Block_copy(v60);
  uint64_t v53 = v31;
  uint64_t v54 = v48;
  long long v55 = v30;
  swift_retain();
  swift_release();
  dispatch_sync(v54, v52);

  _Block_release(v52);
  LOBYTE(v52) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  swift_release();
  if (v52)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
}

uint64_t sub_246AC9EE4(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = result + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCache;
    swift_beginAccess();
    if (*(void *)(*(void *)v6 + 16))
    {
      sub_246ACBDCC(a3);
      char v8 = v7;
      uint64_t result = swift_release();
      char v9 = v8 ^ 1;
    }
    else
    {
      uint64_t result = swift_release();
      char v9 = 1;
    }
    *a2 = v9 & 1;
  }
  return result;
}

uint64_t sub_246AC9F9C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_246ACA5B4(a2, a3);
    if (qword_2691C0218 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_246AD8AD0();
    sub_246A8AB74(v10, (uint64_t)qword_2691D4000);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_246AD8AB0();
    os_log_type_t v12 = sub_246AD8CD0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = v14;
      *(_DWORD *)uint64_t v13 = 134218242;
      sub_246AD8D90();
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_246ACB68C(a4, a5, &v15);
      sub_246AD8D90();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246A80000, v11, v12, "Cached image at index: %ld with name: %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C541130](v14, -1, -1);
      MEMORY[0x24C541130](v13, -1, -1);

      return swift_release();
    }
    else
    {

      swift_release();
      return swift_bridgeObjectRelease_n();
    }
  }
  return result;
}

NSObject *sub_246ACA1B4(CGImage *a1)
{
  uint64_t v3 = sub_246AD8B20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v7 = *(void **)(v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameGenerationQueue);
  void *v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F0E0], v3);
  id v8 = v7;
  LOBYTE(v7) = sub_246AD8B30();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_5;
  }
  size_t Width = CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a1);
  size_t BytesPerRow = CGImageGetBytesPerRow(a1);
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a1);
  uint32_t v24 = 0;
  uint64_t v14 = CGImageGetColorSpace(a1);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v23 = 0;
    uint64_t v16 = (void *)MEMORY[0x24C540A80]();
    sub_246ACA438(AlphaInfo, &v24, Width, Height, BitsPerComponent, BytesPerRow, v15, (int)a1, &v23);

    return v23;
  }
  if (qword_2691C0218 != -1) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v18 = sub_246AD8AD0();
  sub_246A8AB74(v18, (uint64_t)qword_2691D4000);
  uint64_t v19 = sub_246AD8AB0();
  os_log_type_t v20 = sub_246AD8CF0();
  if (os_log_type_enabled(v19, v20))
  {
    BOOL v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v21 = 0;
    _os_log_impl(&dword_246A80000, v19, v20, "Could not get color space from image", v21, 2u);
    MEMORY[0x24C541130](v21, -1, -1);
  }

  return 0;
}

void sub_246ACA438(int a1, uint32_t *a2, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, int a8, NSObject **a9)
{
  if (a1 == 4) {
    int v10 = 2;
  }
  else {
    int v10 = a1;
  }
  if (a1 == 3) {
    int v11 = 1;
  }
  else {
    int v11 = v10;
  }
  uint32_t v12 = *a2 | v11;
  *a2 = v12;
  CGContextRef v13 = CGBitmapContextCreate(0, width, height, bitsPerComponent, bytesPerRow, space, v12);
  if (v13)
  {
    uint64_t v14 = v13;
    sub_246ACEDCC();
    sub_246AD8CA0();
    CGImageRef Image = CGBitmapContextCreateImage(v14);

    uint64_t v16 = *a9;
    *a9 = Image;
  }
  else
  {
    if (qword_2691C0218 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_246AD8AD0();
    sub_246A8AB74(v17, (uint64_t)qword_2691D4000);
    uint64_t v16 = sub_246AD8AB0();
    os_log_type_t v18 = sub_246AD8CF0();
    if (os_log_type_enabled(v16, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_246A80000, v16, v18, "Failed to create pre-drawing context", v19, 2u);
      MEMORY[0x24C541130](v19, -1, -1);
    }
  }
}

id sub_246ACA5B4(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_246AD8B20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (uint64_t *)((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v10 = *(void **)(v3 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cacheIsolationQueue);
  *char v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F0E0], v6);
  id v11 = v10;
  LOBYTE(v10) = sub_246AD8B30();
  id result = (id)(*(uint64_t (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if (v10)
  {
    CGContextRef v13 = (uint64_t *)(v3 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_frameCache);
    swift_beginAccess();
    id v14 = a1;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v13;
    *CGContextRef v13 = 0x8000000000000000;
    sub_246ACE064((uint64_t)v14, a2, isUniquelyReferenced_nonNull_native, &qword_2691C1C30);
    *CGContextRef v13 = v16;
    swift_bridgeObjectRelease();
    swift_endAccess();
    return objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion15AtlasImageCache_cachedIndexes), sel_addIndex_, a2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

CGImageRef sub_246ACA76C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_246A8604C(&qword_2691C0A30);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246AD8940();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  CGContextRef v13 = (char *)v43 - v12;
  sub_246ACAEF4(a1, a2, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_246A9605C((uint64_t)v6);
    if (qword_2691C0218 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_246AD8AD0();
    sub_246A8AB74(v14, (uint64_t)qword_2691D4000);
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_246AD8AB0();
    os_log_type_t v16 = sub_246AD8CF0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v47 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_246ACB68C(a1, a2, &v47);
      sub_246AD8D90();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246A80000, v15, v16, "Could not create URL for image name: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C541130](v18, -1, -1);
      MEMORY[0x24C541130](v17, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  CFURLRef v19 = (const __CFURL *)sub_246AD8920();
  os_log_type_t v20 = CGImageSourceCreateWithURL(v19, 0);

  if (!v20)
  {
    if (qword_2691C0218 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_246AD8AD0();
    sub_246A8AB74(v27, (uint64_t)qword_2691D4000);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    uint64_t v28 = sub_246AD8AB0();
    os_log_type_t v29 = sub_246AD8CF0();
    if (os_log_type_enabled(v28, v29))
    {
      id v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v47 = v31;
      *(_DWORD *)id v30 = 136315138;
      uint64_t v45 = (uint64_t)(v30 + 4);
      sub_246ACF940(&qword_2691C0A40, MEMORY[0x263F06EA8]);
      uint64_t v32 = sub_246AD9030();
      uint64_t v46 = sub_246ACB68C(v32, v33, &v47);
      sub_246AD8D90();
      swift_bridgeObjectRelease();
      os_log_type_t v34 = *(void (**)(char *, uint64_t))(v8 + 8);
      v34(v11, v7);
      _os_log_impl(&dword_246A80000, v28, v29, "Could not create image source at url: %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C541130](v31, -1, -1);
      MEMORY[0x24C541130](v30, -1, -1);
    }
    else
    {

      os_log_type_t v34 = *(void (**)(char *, uint64_t))(v8 + 8);
      v34(v11, v7);
    }
    v34(v13, v7);
    return 0;
  }
  sub_246A8604C(&qword_2691C1C18);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246ADC8A0;
  uint64_t v22 = (void *)*MEMORY[0x263F0F600];
  *(void *)(inited + 32) = *MEMORY[0x263F0F600];
  *(unsigned char *)(inited + 40) = 0;
  id v23 = v22;
  sub_246AC73E0(inited);
  type metadata accessor for CFString(0);
  sub_246ACF940(&qword_2691C0390, type metadata accessor for CFString);
  CFDictionaryRef v24 = (const __CFDictionary *)sub_246AD8B40();
  swift_bridgeObjectRelease();
  ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v20, 0, v24);
  if (!ImageAtIndex)
  {
    if (qword_2691C0218 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_246AD8AD0();
    sub_246A8AB74(v35, (uint64_t)qword_2691D4000);
    swift_bridgeObjectRetain_n();
    uint64_t v36 = sub_246AD8AB0();
    os_log_type_t v37 = sub_246AD8CF0();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = swift_slowAlloc();
      os_log_t v44 = v36;
      uint64_t v39 = (uint8_t *)v38;
      uint64_t v45 = swift_slowAlloc();
      uint64_t v47 = v45;
      *(_DWORD *)uint64_t v39 = 136315138;
      v43[1] = v39 + 4;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_246ACB68C(a1, a2, &v47);
      sub_246AD8D90();
      swift_bridgeObjectRelease_n();
      os_log_t v40 = v44;
      _os_log_impl(&dword_246A80000, v44, v37, "Unable to create CGImage for imageName: %s", v39, 0xCu);
      uint64_t v41 = v45;
      swift_arrayDestroy();
      MEMORY[0x24C541130](v41, -1, -1);
      MEMORY[0x24C541130](v39, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return 0;
  }
  CGImageRef v26 = ImageAtIndex;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);

  return v26;
}

id sub_246ACAEF4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_246AD8940();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_246A8604C(&qword_2691C0A30);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = a1;
  unint64_t v44 = a2;
  swift_bridgeObjectRetain();
  sub_246AD8BF0();
  unint64_t v15 = v44;
  uint64_t v41 = v43;
  uint64_t v16 = sub_246AC75FC();
  unint64_t v18 = v17;
  int v19 = *(unsigned __int8 *)(v4 + 48);
  if (v19 == 2 || (v19 & 1) != 0)
  {
    id result = (id)NTKAssetsBundle();
    id v20 = result;
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    type metadata accessor for SceneLoader();
    id v20 = sub_246A93A20();
  }
  uint64_t v39 = a3;
  uint64_t v22 = (void *)sub_246AD8B80();
  if (qword_2691C0250 != -1) {
    swift_once();
  }
  uint64_t v40 = v9;
  id v23 = (void *)sub_246AD8B80();
  uint64_t v38 = v16;
  if (v18)
  {
    swift_bridgeObjectRetain();
    CFDictionaryRef v24 = (void *)sub_246AD8B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    CFDictionaryRef v24 = 0;
  }
  id v25 = objc_msgSend(v20, sel_URLForResource_withExtension_subdirectory_, v22, v23, v24);

  if (v25)
  {
    sub_246AD8930();

    uint64_t v26 = v40;
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
    v27(v14, v11, v8);
    uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56);
    v28(v14, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v14, 1, v8) != 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      os_log_type_t v29 = v39;
      v27(v39, v14, v8);
      return (id)((uint64_t (*)(char *, void, uint64_t, uint64_t))v28)(v29, 0, 1, v8);
    }
  }
  else
  {
    uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56);
    v28(v14, 1, 1, v8);
  }
  sub_246A9605C((uint64_t)v14);
  if (qword_2691C0218 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_246AD8AD0();
  sub_246A8AB74(v30, (uint64_t)qword_2691D4000);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_246AD8AB0();
  os_log_type_t v32 = sub_246AD8CF0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v42 = v34;
    *(_DWORD *)uint64_t v33 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_246ACB68C(v41, v15, &v42);
    sub_246AD8D90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 12) = 2080;
    uint64_t v43 = v38;
    unint64_t v44 = v18;
    swift_bridgeObjectRetain();
    sub_246A8604C(&qword_2691C10F8);
    uint64_t v35 = sub_246AD8BD0();
    uint64_t v43 = sub_246ACB68C(v35, v36, &v42);
    sub_246AD8D90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246A80000, v31, v32, "Could not create URL for image name: %s in subdirectory: %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C541130](v34, -1, -1);
    MEMORY[0x24C541130](v33, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return (id)((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v28)(v39, 1, 1, v8);
}

unsigned char *storeEnumTagSinglePayload for AtlasImageCache.CacheStrategy(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x246ACB510);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AtlasImageCache.CacheStrategy()
{
  return &type metadata for AtlasImageCache.CacheStrategy;
}

unint64_t sub_246ACB54C()
{
  unint64_t result = qword_2691C1C08;
  if (!qword_2691C1C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1C08);
  }
  return result;
}

uint64_t sub_246ACB5A0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_246ACB5B0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_246ACB5EC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_246ACB614(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_246ACB68C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_246AD8D90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_246ACB68C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_246ACB760(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_246AC3A1C((uint64_t)v12, *a3);
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
      sub_246AC3A1C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_246A85F9C((uint64_t)v12);
  return v7;
}

uint64_t sub_246ACB760(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_246AD8DA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_246ACB91C(a5, a6);
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
  uint64_t v8 = sub_246AD8E80();
  if (!v8)
  {
    sub_246AD8EA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_246AD8F00();
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

uint64_t sub_246ACB91C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_246ACB9B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_246ACBB94(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_246ACBB94(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246ACB9B4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_246ACBB2C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_246AD8E00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_246AD8EA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_246AD8C00();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_246AD8F00();
    __break(1u);
LABEL_14:
    uint64_t result = sub_246AD8EA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_246ACBB2C(uint64_t a1, uint64_t a2)
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
  sub_246A8604C(&qword_2691C1C10);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  long long v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_246ACBB94(char a1, int64_t a2, char a3, char *a4)
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
    sub_246A8604C(&qword_2691C1C10);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
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
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

unsigned char **sub_246ACBCE4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_246ACBCF4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_246AD8F00();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_246ACBD98@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_246ACBDCC(uint64_t a1)
{
  uint64_t v2 = sub_246AD90F0();

  return sub_246ACC0AC(a1, v2);
}

unint64_t sub_246ACBE10(uint64_t a1, uint64_t a2)
{
  sub_246AD9100();
  sub_246AD8BE0();
  uint64_t v4 = sub_246AD9140();

  return sub_246ACC148(a1, a2, v4);
}

unint64_t sub_246ACBE88(uint64_t a1)
{
  sub_246AD9100();
  sub_246AD9110();
  uint64_t v2 = sub_246AD9140();
  return sub_246ACC0AC(a1, v2);
}

unint64_t sub_246ACBEF0(char a1)
{
  char v1 = a1 & 1;
  sub_246AD9100();
  sub_246AD9110();
  uint64_t v2 = sub_246AD9140();

  return sub_246ACC22C(v1, v2);
}

unint64_t sub_246ACBF60(uint64_t a1)
{
  sub_246AD89C0();
  sub_246ACF940(&qword_2691C0488, MEMORY[0x263F07508]);
  uint64_t v2 = sub_246AD8B50();

  return sub_246ACC2E8(a1, v2);
}

unint64_t sub_246ACBFF8(uint64_t a1)
{
  sub_246AD9100();
  type metadata accessor for CFString(0);
  sub_246ACF940(&qword_2691C1C28, type metadata accessor for CFString);
  sub_246AD8A90();
  uint64_t v2 = sub_246AD9140();

  return sub_246ACC4A8(a1, v2);
}

unint64_t sub_246ACC0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_246ACC148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_246AD9060() & 1) == 0)
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
      while (!v14 && (sub_246AD9060() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_246ACC22C(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_246ACC2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_246AD89C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_246ACF940(&qword_2691C1C80, MEMORY[0x263F07508]);
      char v15 = sub_246AD8B70();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_246ACC4A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_246ACF940(&qword_2691C1C28, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_246AD8A80();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_246AD8A80();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_246ACC604(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246A8604C(&qword_2691C1BC8);
  uint64_t result = sub_246AD8EE0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v32 = a2;
    uint64_t v31 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v29 = -1 << v10;
    uint64_t v30 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13) {
          goto LABEL_31;
        }
        unint64_t v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v19 = v9[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v32 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v31;
                goto LABEL_38;
              }
              if (v30 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v29;
              }
              uint64_t v3 = v31;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v19 = v9[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
      long long v33 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v17);
      uint64_t result = sub_246AD90F0();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v14 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v14 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v14 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v7 + 48) + 8 * v15) = v21;
      *(_OWORD *)(*(void *)(v7 + 56) + 16 * v15) = v33;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_246ACC8A8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246A8604C(&qword_2691C1C60);
  uint64_t result = sub_246AD8EE0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    char v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v32[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *char v32 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + v27);
      uint64_t v29 = *(void *)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_246AD9100();
      sub_246AD9110();
      uint64_t result = sub_246AD9140();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_246ACCB84(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for Scene();
  uint64_t v37 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_246A8604C(&qword_2691C1C70);
  int v38 = a2;
  uint64_t result = sub_246AD8EE0();
  uint64_t v10 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v34 = v2;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)(v8 + 64);
    unint64_t v36 = (void *)(v8 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v35 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v16 = result + 64;
    while (1)
    {
      if (v15)
      {
        unint64_t v18 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v19 = v18 | (v11 << 6);
      }
      else
      {
        int64_t v20 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v36;
        if (v20 >= v35) {
          goto LABEL_34;
        }
        unint64_t v21 = v36[v20];
        ++v11;
        if (!v21)
        {
          int64_t v11 = v20 + 1;
          if (v20 + 1 >= v35) {
            goto LABEL_34;
          }
          unint64_t v21 = v36[v11];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v35)
            {
LABEL_34:
              if ((v38 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_41;
              }
              uint64_t v33 = 1 << *(unsigned char *)(v8 + 32);
              if (v33 >= 64) {
                bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *unint64_t v36 = -1 << v33;
              }
              uint64_t v3 = v34;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v11 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_43;
                }
                if (v11 >= v35) {
                  goto LABEL_34;
                }
                unint64_t v21 = v36[v11];
                ++v22;
                if (v21) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v11 = v22;
          }
        }
LABEL_21:
        unint64_t v15 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v11 << 6);
      }
      uint64_t v23 = *(void *)(*(void *)(v8 + 48) + 8 * v19);
      uint64_t v24 = *(void *)(v37 + 72);
      uint64_t v25 = *(void *)(v8 + 56) + v24 * v19;
      if (v38) {
        sub_246AADEE4(v25, (uint64_t)v7);
      }
      else {
        sub_246ACF9D8(v25, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Scene);
      }
      sub_246AD9100();
      sub_246AD9110();
      uint64_t result = sub_246AD9140();
      uint64_t v26 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v16 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(void *)(*(void *)(v10 + 48) + 8 * v17) = v23;
      uint64_t result = sub_246AADEE4((uint64_t)v7, *(void *)(v10 + 56) + v24 * v17);
      ++*(void *)(v10 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_246ACCF00(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for Scene();
  uint64_t v49 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v54 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246AD89C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v51 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_246A8604C(&qword_2691C1C78);
  int v50 = a2;
  uint64_t v11 = v10;
  uint64_t v12 = sub_246AD8EE0();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v46 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  unint64_t v44 = v2;
  int64_t v45 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  unint64_t v52 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v53 = v7;
  uint64_t v18 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v48 = v11;
  unint64_t v21 = v51;
  while (1)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45) {
      break;
    }
    uint64_t v26 = v46;
    unint64_t v27 = v46[v25];
    ++v20;
    if (!v27)
    {
      int64_t v20 = v25 + 1;
      if (v25 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v27 = v46[v20];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v44;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v20 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v45) {
              goto LABEL_34;
            }
            unint64_t v27 = v46[v20];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v20 << 6);
    unint64_t v21 = v51;
LABEL_22:
    uint64_t v29 = v8;
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = *(void *)(v11 + 48) + v30 * v24;
    if (v50)
    {
      (*v52)(v21, v31, v53);
      uint64_t v32 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_246AADEE4(v32 + v33 * v24, v54);
    }
    else
    {
      (*v47)(v21, v31, v53);
      uint64_t v34 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_246ACF9D8(v34 + v33 * v24, v54, (uint64_t (*)(void))type metadata accessor for Scene);
    }
    sub_246ACF940(&qword_2691C0488, MEMORY[0x263F07508]);
    uint64_t result = sub_246AD8B50();
    uint64_t v35 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      unint64_t v21 = v51;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      unint64_t v21 = v51;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v18 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v22 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v52)((char *)(*(void *)(v13 + 48) + v30 * v22), (unint64_t)v21, v53);
    uint64_t result = sub_246AADEE4(v54, *(void *)(v13 + 56) + v33 * v22);
    ++*(void *)(v13 + 16);
    uint64_t v11 = v48;
    uint64_t v8 = v29;
  }
  swift_release();
  uint64_t v3 = v44;
  uint64_t v26 = v46;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v11 + 32);
  if (v42 >= 64) {
    bzero(v26, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v26 = -1 << v42;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v13;
  return result;
}

uint64_t sub_246ACD3F0(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_246A8604C(a3);
  uint64_t result = sub_246AD8EE0();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    int64_t v9 = 0;
    uint64_t v10 = (uint64_t *)(v6 + 64);
    uint64_t v11 = 1 << *(unsigned char *)(v6 + 32);
    uint64_t v33 = -1 << v11;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v6 + 64);
    uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
    uint64_t v35 = v4;
    int64_t v36 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v21 = v20 | (v9 << 6);
      }
      else
      {
        int64_t v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v22 >= v36) {
          goto LABEL_33;
        }
        unint64_t v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          int64_t v9 = v22 + 1;
          if (v22 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v23 = v10[v9];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v36)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v4 = v35;
                goto LABEL_40;
              }
              if (v34 >= 64) {
                bzero((void *)(v6 + 64), 8 * v36);
              }
              else {
                *uint64_t v10 = v33;
              }
              uint64_t v4 = v35;
              *(void *)(v6 + 16) = 0;
              break;
            }
            unint64_t v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v9 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v9 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v23 = v10[v9];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v9 = v24;
          }
        }
LABEL_30:
        unint64_t v13 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      uint64_t v29 = 8 * v21;
      uint64_t v30 = *(void *)(*(void *)(v6 + 48) + v29);
      unint64_t v31 = *(void **)(*(void *)(v6 + 56) + v29);
      if ((a2 & 1) == 0) {
        id v32 = v31;
      }
      uint64_t result = sub_246AD90F0();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v27 = v17 == v26;
          if (v17 == v26) {
            unint64_t v17 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v14 + 8 * v17);
        }
        while (v28 == -1);
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v8 + 48) + v19) = v30;
      *(void *)(*(void *)(v8 + 56) + v19) = v31;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v4 = v8;
  return result;
}

unint64_t sub_246ACD6A0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_246AD8DE0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_246AD9100();
        sub_246AD9110();
        uint64_t result = sub_246AD9140();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (void *)(v10 + 8 * v3);
          uint64_t v12 = (void *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            void *v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *unint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_246ACD85C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_246AD8DE0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_246AD9100();
        sub_246AD9110();
        uint64_t result = sub_246AD9140();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v9 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v10 = *(void *)(a2 + 48);
        uint64_t v11 = (void *)(v10 + 8 * v3);
        uint64_t v12 = (void *)(v10 + 8 * v6);
        if (v3 != v6 || v11 >= v12 + 1) {
          *uint64_t v11 = *v12;
        }
        uint64_t v13 = *(void *)(a2 + 56);
        uint64_t v14 = *(void *)(*(void *)(type metadata accessor for Scene() - 8) + 72);
        int64_t v15 = v14 * v3;
        uint64_t result = v13 + v14 * v3;
        int64_t v16 = v14 * v6;
        unint64_t v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v15 == v16) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v9 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v9) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_246ACDA50(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_246AD8DE0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_246AD90F0();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              void *v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            int64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *int64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_246ACDBE8(uint64_t a1, uint64_t a2, char a3)
{
}

uint64_t sub_246ACDBF4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_246ACBE88(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_246ACE4F8();
LABEL_7:
    int64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_246ACC8A8(result, a3 & 1);
  uint64_t result = sub_246ACBE88(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    int64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_246AD90A0();
  __break(1u);
  return result;
}

uint64_t sub_246ACDD30(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_246ACBE88(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_246ACE69C();
      goto LABEL_7;
    }
    sub_246ACCB84(v13, a3 & 1);
    unint64_t v20 = sub_246ACBE88(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      unint64_t v10 = v20;
      int64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_246AD90A0();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = v17 + *(void *)(*(void *)(type metadata accessor for Scene() - 8) + 72) * v10;
    return sub_246AADF48(a1, v18);
  }
LABEL_13:

  return sub_246ACE1F4(v10, a2, a1, v16);
}

uint64_t sub_246ACDE7C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_246AD89C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v12 = (void *)*v3;
  unint64_t v14 = sub_246ACBF60(a2);
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
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_246ACE904();
      goto LABEL_7;
    }
    sub_246ACCF00(v17, a3 & 1);
    unint64_t v24 = sub_246ACBF60(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      unint64_t v14 = v24;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_246ACE288(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_246AD90A0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = v21 + *(void *)(*(void *)(type metadata accessor for Scene() - 8) + 72) * v14;

  return sub_246AADF48(a1, v22);
}

void sub_246ACE064(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  unint64_t v6 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_246ACBDCC(a2);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a3 & 1) == 0)
  {
    sub_246ACEC30(a4);
LABEL_7:
    char v18 = (void *)*v6;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    uint64_t v22 = 8 * v12;
    *(void *)(v18[6] + v22) = a2;
    *(void *)(v18[7] + v22) = a1;
    uint64_t v23 = v18[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (!v24)
    {
      void v18[2] = v25;
      return;
    }
    goto LABEL_14;
  }
  sub_246ACD3F0(v15, a3 & 1, a4);
  unint64_t v20 = sub_246ACBDCC(a2);
  if ((v16 & 1) == (v21 & 1))
  {
    unint64_t v12 = v20;
    char v18 = (void *)*v6;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_246AD90A0();
  __break(1u);
}

unint64_t sub_246ACE1AC(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v4 = 8 * result;
  *(void *)(a4[6] + v4) = a2;
  *(void *)(a4[7] + v4) = a3;
  uint64_t v5 = a4[2];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    a4[2] = v7;
  }
  return result;
}

uint64_t sub_246ACE1F4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for Scene();
  uint64_t result = sub_246AADEE4(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_246ACE288(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_246AD89C0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for Scene();
  uint64_t result = sub_246AADEE4(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

void *sub_246ACE364()
{
  char v1 = v0;
  sub_246A8604C(&qword_2691C1BC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246AD8ED0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v23 = __clz(__rbit64(v21));
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = v23 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_246ACE4F8()
{
  char v1 = v0;
  sub_246A8604C(&qword_2691C1C60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246AD8ED0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_246ACE69C()
{
  char v1 = v0;
  uint64_t v2 = type metadata accessor for Scene();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8604C(&qword_2691C1C70);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_246AD8ED0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  BOOL v24 = v1;
  uint64_t result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    uint64_t v18 = 8 * v17;
    uint64_t v19 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
    unint64_t v20 = *(void *)(v25 + 72) * v17;
    sub_246ACF9D8(*(void *)(v5 + 56) + v20, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Scene);
    *(void *)(*(void *)(v7 + 48) + v18) = v19;
    uint64_t result = (void *)sub_246AADEE4((uint64_t)v4, *(void *)(v7 + 56) + v20);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_246ACE904()
{
  uint64_t v1 = type metadata accessor for Scene();
  uint64_t v29 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246AD89C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8604C(&qword_2691C1C78);
  BOOL v24 = v0;
  uint64_t v8 = *v0;
  uint64_t v9 = sub_246AD8ED0();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *BOOL v24 = v10;
    return result;
  }
  uint64_t result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    uint64_t result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  int64_t v13 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  uint64_t v25 = v8 + 64;
  int64_t v26 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v27 = v5 + 32;
  uint64_t v28 = v5 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v25 + 8 * v13);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v18 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v5 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v19, v4);
    unint64_t v20 = *(void *)(v29 + 72) * v18;
    sub_246ACF9D8(*(void *)(v8 + 56) + v20, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for Scene);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v19, v7, v4);
    uint64_t result = (void *)sub_246AADEE4((uint64_t)v3, *(void *)(v10 + 56) + v20);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v26) {
    goto LABEL_23;
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_246ACEC30(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_246A8604C(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_246AD8ED0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
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
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    unint64_t v18 = *(void **)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = *(void *)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v14) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

double sub_246ACEDCC()
{
  return 0.0;
}

uint64_t sub_246ACEDE0()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246ACEE18()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246ACEE50()
{
  return sub_246AC9EE4(*(void *)(v0 + 16), *(unsigned char **)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_246ACEE5C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246ACEE6C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_246ACEE94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_246ACEEA4()
{
  return swift_release();
}

uint64_t sub_246ACEEAC()
{
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_246ACEEF4()
{
  return sub_246AC9F9C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_246ACEF04()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246ACEF14()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_246ACEF4C()
{
  sub_246AC9040(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(void ***)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t sub_246ACEF60()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_246ACEF70(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_246ACEF78()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246ACEF88()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_246ACEFB0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_246ACEFC0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_246ACEFD0(uint64_t a1, uint64_t a2)
{
  sub_246AC946C(a1, a2, v2);
}

uint64_t sub_246ACEFD8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246ACEFE8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_246ACF010()
{
  return sub_246AC8A28();
}

void sub_246ACF018()
{
  sub_246AC8198(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_246ACF024()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246ACF034(uint64_t a1)
{
  return a1;
}

unint64_t sub_246ACF06C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_246A8604C(&qword_2691C1C50);
    uint64_t v3 = (void *)sub_246AD8EF0();
    for (unint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      unint64_t result = sub_246ACBDCC(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(void *)(v3[6] + v9) = v5;
      *(void *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_246ACF148(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_246A8604C(&qword_2691C1BC8);
    uint64_t v3 = (void *)sub_246AD8EF0();
    for (unint64_t i = (_OWORD *)(a1 + 40); ; unint64_t i = (_OWORD *)((char *)i + 24))
    {
      uint64_t v5 = *((void *)i - 1);
      long long v11 = *i;
      unint64_t result = sub_246ACBDCC(v5);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      *(_OWORD *)(v3[7] + 16 * result) = v11;
      uint64_t v8 = v3[2];
      BOOL v9 = __OFADD__(v8, 1);
      uint64_t v10 = v8 + 1;
      if (v9) {
        goto LABEL_10;
      }
      v3[2] = v10;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_246ACF228(void *a1)
{
  return sub_246ACF6A8(a1, &qword_2691C1C48);
}

unint64_t sub_246ACF234(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_246A8604C(&qword_2691C1C40);
    uint64_t v3 = (void *)sub_246AD8EF0();
    for (unint64_t i = (void *)(a1 + 64); ; i += 5)
    {
      uint64_t v5 = *(i - 4);
      uint64_t v6 = *(i - 3);
      long long v14 = *((_OWORD *)i - 1);
      uint64_t v7 = *i;
      unint64_t result = sub_246ACBE88(v5);
      if (v9) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      uint64_t v10 = v3[7] + 32 * result;
      *(void *)uint64_t v10 = v6;
      *(_OWORD *)(v10 + 8) = v14;
      *(void *)(v10 + 24) = v7;
      uint64_t v11 = v3[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12) {
        goto LABEL_10;
      }
      v3[2] = v13;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_246ACF330(void *a1)
{
  return sub_246ACF80C(a1, &qword_2691C1C58);
}

unint64_t sub_246ACF33C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_246A8604C(&qword_2691C1C88);
    uint64_t v3 = (void *)sub_246AD8EF0();
    for (unint64_t i = (void *)(a1 + 40); ; i += 2)
    {
      char v5 = *((unsigned char *)i - 8);
      uint64_t v6 = *i;
      unint64_t result = sub_246ACBEF0(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      *(void *)(v3[7] + 8 * result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_246ACF414(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_246A8604C(&qword_2691C1C90);
    uint64_t v3 = (void *)sub_246AD8EF0();
    for (unint64_t i = (_OWORD *)(a1 + 40); ; unint64_t i = (_OWORD *)((char *)i + 24))
    {
      char v5 = *((unsigned char *)i - 8);
      long long v11 = *i;
      unint64_t result = sub_246ACBEF0(v5);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      *(_OWORD *)(v3[7] + 16 * result) = v11;
      uint64_t v8 = v3[2];
      BOOL v9 = __OFADD__(v8, 1);
      uint64_t v10 = v8 + 1;
      if (v9) {
        goto LABEL_10;
      }
      v3[2] = v10;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_246ACF4F4(uint64_t a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C1C68);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    sub_246A8604C(&qword_2691C1C70);
    char v7 = (void *)sub_246AD8EF0();
    uint64_t v8 = (uint64_t)v5 + *(int *)(v2 + 48);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_246ACF7A4(v9, (uint64_t)v5);
      uint64_t v11 = *v5;
      unint64_t result = sub_246ACBE88(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v7[6] + 8 * result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = type metadata accessor for Scene();
      unint64_t result = sub_246AADEE4(v8, v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      _OWORD v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_246ACF69C(void *a1)
{
  return sub_246ACF6A8(a1, &qword_2691C1C60);
}

unint64_t sub_246ACF6A8(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[2];
  if (!v2) {
    return MEMORY[0x263F8EE80];
  }
  sub_246A8604C(a2);
  uint64_t v4 = (void *)sub_246AD8EF0();
  uint64_t v6 = a1[4];
  uint64_t v5 = a1[5];
  unint64_t result = sub_246ACBE88(v6);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v4;
  }
  uint64_t v9 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v4[6] + v10) = v6;
    *(void *)(v4[7] + v10) = v5;
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    long long v4[2] = v13;
    if (!--v2) {
      goto LABEL_8;
    }
    unint64_t v14 = v9 + 2;
    uint64_t v6 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = sub_246ACBE88(v6);
    uint64_t v9 = v14;
    uint64_t v5 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_246ACF7A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246A8604C(&qword_2691C1C68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_246ACF80C(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[2];
  if (!v2) {
    return MEMORY[0x263F8EE80];
  }
  sub_246A8604C(a2);
  uint64_t v4 = (void *)sub_246AD8EF0();
  uint64_t v5 = a1[4];
  uint64_t v6 = (void *)a1[5];
  unint64_t result = sub_246ACBDCC(v5);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    id v18 = v6;
    return (unint64_t)v4;
  }
  uint64_t v9 = (void **)(a1 + 7);
  while (1)
  {
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v4[6] + v10) = v5;
    *(void *)(v4[7] + v10) = v6;
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    long long v4[2] = v13;
    if (!--v2) {
      goto LABEL_8;
    }
    unint64_t v14 = v9 + 2;
    uint64_t v5 = (uint64_t)*(v9 - 1);
    uint64_t v15 = *v9;
    id v16 = v6;
    unint64_t result = sub_246ACBDCC(v5);
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if (v17) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_246ACF900()
{
  unint64_t result = qword_2691C1130;
  if (!qword_2691C1130)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2691C1130);
  }
  return result;
}

uint64_t sub_246ACF940(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246ACF988(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_246A8A7DC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246ACF9D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_246ACFA40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246ACFAE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246A8604C(&qword_2691C12E0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Scene();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v28 - v12;
  unint64_t v14 = (uint64_t *)(v1 + 24);
  swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 24) + 16))
  {
    swift_beginAccess();
    if (*(void *)(*v14 + 16))
    {
      unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      sub_246AADE24(*v14 + v15, (uint64_t)v13);
      sub_246AD16E4(0, 1);
      swift_endAccess();
      if (!*(void *)(*v14 + 16))
      {
        v28[0] = *(void *)(v1 + 16);
        swift_bridgeObjectRetain();
        sub_246AD0EE4();
        uint64_t v16 = v28[0];
        swift_beginAccess();
        sub_246AD0148(v16);
        swift_endAccess();
        uint64_t v17 = *(void *)(v2 + 24);
        if (*(void *)(v17 + 16) >= 2uLL)
        {
          while (1)
          {
            sub_246AADE24(v17 + v15, (uint64_t)v11);
            if ((sub_246AD89A0() & 1) == 0) {
              break;
            }
            swift_beginAccess();
            sub_246AD1128();
            swift_endAccess();
            sub_246AADE88((uint64_t)v11);
            uint64_t v17 = *v14;
            if (!*(void *)(*v14 + 16)) {
              goto LABEL_22;
            }
          }
          sub_246AADE88((uint64_t)v11);
        }
      }
LABEL_22:
      uint64_t v27 = (uint64_t)v13;
      return sub_246AADEE4(v27, a1);
    }
    __break(1u);
  }
  else if (qword_2691C0230 == -1)
  {
    goto LABEL_9;
  }
  swift_once();
LABEL_9:
  uint64_t v18 = sub_246AD8AD0();
  sub_246A8AB74(v18, (uint64_t)qword_2691D4048);
  swift_retain();
  uint64_t v19 = sub_246AD8AB0();
  os_log_type_t v20 = sub_246AD8CF0();
  if (os_log_type_enabled(v19, v20))
  {
    int64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v21 = 134217984;
    v28[0] = *(void *)(*(void *)(v2 + 16) + 16);
    sub_246AD8D90();
    swift_release();
    _os_log_impl(&dword_246A80000, v19, v20, "ShuffledSceneProvider tried to pop a scene when the shuffled array is already empty! (scene count: %ld)", v21, 0xCu);
    MEMORY[0x24C541130](v21, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v22 = *(void *)(v2 + 16);
  unint64_t v23 = *(void *)(v22 + 16);
  if (v23)
  {
    swift_bridgeObjectRetain();
    unint64_t v24 = sub_246AD07C0(v23);
    if ((v24 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v24 < *(void *)(v22 + 16))
    {
      sub_246AADE24(v22+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v24, (uint64_t)v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    __break(1u);
    goto LABEL_28;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
LABEL_17:
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    if (qword_2691C0210 == -1)
    {
LABEL_19:
      uint64_t v25 = sub_246A8AB74(v7, (uint64_t)qword_2691D3FE8);
      sub_246AADE24(v25, a1);
      return sub_246A85FEC((uint64_t)v6);
    }
LABEL_28:
    swift_once();
    goto LABEL_19;
  }
  uint64_t v27 = (uint64_t)v6;
  return sub_246AADEE4(v27, a1);
}

uint64_t sub_246ACFF7C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_246AD8EC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_246AD8EC0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x24C540430](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_246AD1318(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_246AD8EC0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_246AD8C70();
}

uint64_t sub_246AD0148(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_246AD03E8(isUniquelyReferenced_nonNull_native, v22, 1, v3, &qword_2691C1168, (uint64_t (*)(void))type metadata accessor for Scene, (uint64_t (*)(void))type metadata accessor for Scene);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for Scene() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

uint64_t sub_246AD031C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ShuffledSceneProvider()
{
  return self;
}

uint64_t sub_246AD0380(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_246AD03E8(a1, a2, a3, a4, &qword_2691C1CD0, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
}

uint64_t sub_246AD03B4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_246AD03E8(a1, a2, a3, a4, &qword_2691C1168, (uint64_t (*)(void))type metadata accessor for Scene, (uint64_t (*)(void))type metadata accessor for Scene);
}

uint64_t sub_246AD03E8(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_246A8604C(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_246AD8EA0();
    __break(1u);
    return result;
  }
  void v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_246AD1588(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_246AD0668(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_246AD0690(a1, a2, a3, a4, &qword_2691C1CC0, &qword_2691C1B28);
}

void *sub_246AD067C(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_246AD0690(a1, a2, a3, a4, &qword_2691C1CB8, &qword_2691C1B18);
}

void *sub_246AD0690(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      sub_246A8604C(a5);
      uint64_t v13 = (void *)swift_allocObject();
      size_t v14 = j__malloc_size(v13);
      v13[2] = v11;
      v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
      uint64_t v15 = v13 + 4;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[5 * v11 + 4]) {
          memmove(v15, a4 + 4, 40 * v11);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      uint64_t v15 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_246AD1960(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

unint64_t sub_246AD07C0(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x24C541140](&v3, 8);
    uint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x24C541140](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_246AD084C(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_246A8604C(&qword_2691C1CB0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    memcpy(v12, v13, 24 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

uint64_t sub_246AD09C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_246A8604C(&qword_2691C1CE8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

uint64_t sub_246AD0B34(char a1, int64_t a2, char a3, void *a4)
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
  sub_246A8604C(&qword_2691C1168);
  uint64_t v10 = *(void *)(type metadata accessor for Scene() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
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
  uint64_t v16 = *(void *)(type metadata accessor for Scene() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  size_t v19 = (char *)a4 + v17;
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
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

uint64_t sub_246AD0D74(char a1, int64_t a2, char a3, char *a4)
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
    sub_246A8604C(&qword_2691C1CC8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
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
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

uint64_t sub_246AD0EE4()
{
  uint64_t v1 = type metadata accessor for Scene();
  uint64_t v23 = *(void *)(v1 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  int64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v2);
  uint64_t v25 = (uint64_t)&v21 - v6;
  int64_t v7 = *(void **)v0;
  unint64_t v8 = *(void *)(*(void *)v0 + 16);
  unint64_t v9 = v8 - 2;
  if (v8 >= 2)
  {
    unint64_t v10 = 0;
    unint64_t v22 = v8 - 2;
    while (1)
    {
      unint64_t v26 = 0;
      uint64_t result = MEMORY[0x24C541140](&v26, 8);
      uint64_t v12 = (v26 * (unsigned __int128)v8) >> 64;
      if (v8 > v26 * v8)
      {
        unint64_t v13 = -(uint64_t)v8 % v8;
        if (v13 > v26 * v8)
        {
          do
          {
            unint64_t v26 = 0;
            uint64_t result = MEMORY[0x24C541140](&v26, 8);
          }
          while (v13 > v26 * v8);
          uint64_t v12 = (v26 * (unsigned __int128)v8) >> 64;
        }
      }
      unint64_t v14 = v10 + v12;
      if (__OFADD__(v10, v12)) {
        break;
      }
      if (v10 != v14)
      {
        unint64_t v15 = v7[2];
        if (v10 >= v15) {
          goto LABEL_19;
        }
        unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
        uint64_t v16 = (char *)v7 + v24;
        uint64_t v17 = *(void *)(v23 + 72);
        uint64_t v18 = v17 * v10;
        uint64_t result = sub_246AADE24((uint64_t)v7 + v24 + v17 * v10, v25);
        if (v14 >= v15) {
          goto LABEL_20;
        }
        uint64_t v19 = v17 * v14;
        sub_246AADE24((uint64_t)&v16[v17 * v14], (uint64_t)v4);
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        *(void *)uint64_t v0 = v7;
        if ((result & 1) == 0)
        {
          uint64_t result = sub_246AD151C(v7);
          int64_t v7 = (void *)result;
          *(void *)uint64_t v0 = result;
        }
        if (v10 >= v7[2]) {
          goto LABEL_21;
        }
        unint64_t v20 = v24;
        uint64_t result = sub_246AADF48((uint64_t)v4, (uint64_t)v7 + v24 + v18);
        if (v14 >= *(void *)(*(void *)v0 + 16)) {
          goto LABEL_22;
        }
        uint64_t result = sub_246AADF48(v25, *(void *)v0 + v20 + v19);
        int64_t v7 = *(void **)v0;
        unint64_t v9 = v22;
      }
      --v8;
      if (v10++ == v9) {
        return result;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
  }
  return result;
}

uint64_t sub_246AD1128()
{
  uint64_t v1 = type metadata accessor for Scene();
  uint64_t v15 = *(void *)(v1 - 8);
  uint64_t result = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v16 = (uint64_t)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = *v0;
  unint64_t v5 = *(void *)(*v0 + 16);
  if (v5 >= 2)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_20:
    }
      unint64_t v4 = sub_246AD1530(v4);
    unint64_t v6 = 0;
    *uint64_t v0 = v4;
    do
    {
      unint64_t v17 = 0;
      uint64_t result = MEMORY[0x24C541140](&v17, 8);
      uint64_t v8 = (v17 * (unsigned __int128)v5) >> 64;
      if (v5 > v17 * v5)
      {
        unint64_t v9 = -(uint64_t)v5 % v5;
        if (v9 > v17 * v5)
        {
          do
          {
            unint64_t v17 = 0;
            uint64_t result = MEMORY[0x24C541140](&v17, 8);
          }
          while (v9 > v17 * v5);
          uint64_t v8 = (v17 * (unsigned __int128)v5) >> 64;
        }
      }
      unint64_t v10 = v6 + v8;
      if (__OFADD__(v6, v8))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (v6 != v10)
      {
        unint64_t v11 = *(void *)(v4 + 16);
        if (v6 >= v11) {
          goto LABEL_18;
        }
        unint64_t v12 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
        uint64_t v13 = *(void *)(v15 + 72);
        sub_246AADE24(v4 + v12 + v13 * v6, v16);
        if (v10 >= v11) {
          goto LABEL_19;
        }
        *uint64_t v0 = v4;
        uint64_t result = sub_246AD18FC(v4 + v12 + v13 * v10, v4 + v12 + v13 * v6);
        if (v10 >= *(void *)(*v0 + 16))
        {
          __break(1u);
          return result;
        }
        uint64_t result = sub_246AADF48(v16, *v0 + v12 + v13 * v10);
        unint64_t v4 = *v0;
      }
      ++v6;
    }
    while ((uint64_t)v5-- > 2);
  }
  return result;
}

uint64_t sub_246AD1318(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_246AD8EC0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_246AD8EC0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_246AD1A6C();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_246A8604C(&qword_2691C1CD8);
          unint64_t v12 = sub_246AB2CC0(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for SpriteView();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

uint64_t sub_246AD151C(void *a1)
{
  return sub_246AD0B34(0, a1[2], 0, a1);
}

uint64_t sub_246AD1530(unint64_t a1)
{
  return sub_246AD03E8(0, *(void *)(a1 + 16), 0, a1, &qword_2691C1168, (uint64_t (*)(void))type metadata accessor for Scene, (uint64_t (*)(void))type metadata accessor for Scene);
}

uint64_t sub_246AD1588(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
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
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

uint64_t sub_246AD16E4(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_246AD03E8(isUniquelyReferenced_nonNull_native, v11, 1, v4, &qword_2691C1168, (uint64_t (*)(void))type metadata accessor for Scene, (uint64_t (*)(void))type metadata accessor for Scene);
  }
  uint64_t v12 = *(void *)(type metadata accessor for Scene() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

uint64_t sub_246AD18FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Scene();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_246AD1960(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      sub_246A8604C(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_246AD8F00();
  __break(1u);
  return result;
}

unint64_t sub_246AD1A6C()
{
  unint64_t result = qword_2691C1CE0;
  if (!qword_2691C1CE0)
  {
    sub_246A8A7DC(&qword_2691C1CD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1CE0);
  }
  return result;
}

id sub_246AD1AC8()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SceneTimeOverrideManager()), sel_init);
  qword_2691D41C8 = (uint64_t)result;
  return result;
}

id sub_246AD1B9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneTimeOverrideManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SceneTimeOverrideManager()
{
  return self;
}

char *sub_246AD1BF8(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_246AD89C0();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    int64_t v11 = &a1[v9];
    uint64_t v12 = &a2[v9];
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)int64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    *((_OWORD *)v11 + 1) = *((_OWORD *)v12 + 1);
    v11[32] = v12[32];
    uint64_t v14 = *((void *)v12 + 6);
    *((void *)v11 + 5) = *((void *)v12 + 5);
    *((void *)v11 + 6) = v14;
    v11[56] = v12[56];
    a1[v10] = a2[v10];
    uint64_t v15 = a3[7];
    uint64_t v16 = a3[8];
    unint64_t v17 = &a1[v15];
    uint64_t v18 = &a2[v15];
    *((void *)v17 + 4) = *((void *)v18 + 4);
    long long v19 = *((_OWORD *)v18 + 1);
    unint64_t v20 = &a1[v16];
    uint64_t v21 = &a2[v16];
    *(_OWORD *)unint64_t v17 = *(_OWORD *)v18;
    *((_OWORD *)v17 + 1) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8(v20, v21, v7);
    BOOL v22 = (int *)type metadata accessor for Timing(0);
    *(void *)&v20[v22[5]] = *(void *)&v21[v22[5]];
    *(void *)&v20[v22[6]] = *(void *)&v21[v22[6]];
    v20[v22[7]] = v21[v22[7]];
  }
  return a1;
}

uint64_t sub_246AD1D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246AD89C0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 32);

  return v7(v5, v4);
}

uint64_t sub_246AD1E34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v8;
  uint64_t v11 = a2 + v8;
  uint64_t v12 = *(void *)(v11 + 8);
  *(void *)uint64_t v10 = *(void *)v11;
  *(void *)(v10 + 8) = v12;
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v11 + 16);
  *(unsigned char *)(v10 + 32) = *(unsigned char *)(v11 + 32);
  uint64_t v13 = *(void *)(v11 + 48);
  *(void *)(v10 + 40) = *(void *)(v11 + 40);
  *(void *)(v10 + 48) = v13;
  *(unsigned char *)(v10 + 56) = *(unsigned char *)(v11 + 56);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  *(void *)(v16 + 32) = *(void *)(v17 + 32);
  long long v18 = *(_OWORD *)(v17 + 16);
  uint64_t v19 = a1 + v15;
  uint64_t v20 = a2 + v15;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + 16) = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7(v19, v20, v6);
  uint64_t v21 = (int *)type metadata accessor for Timing(0);
  *(void *)(v19 + v21[5]) = *(void *)(v20 + v21[5]);
  *(void *)(v19 + v21[6]) = *(void *)(v20 + v21[6]);
  *(unsigned char *)(v19 + v21[7]) = *(unsigned char *)(v20 + v21[7]);
  return a1;
}

uint64_t sub_246AD1F68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)uint64_t v9 = *(void *)(a2 + v8);
  *(void *)(v9 + 8) = *(void *)(a2 + v8 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  *(void *)(v9 + 24) = *(void *)(v10 + 24);
  *(unsigned char *)(v9 + 32) = *(unsigned char *)(v10 + 32);
  *(void *)(v9 + 40) = *(void *)(v10 + 40);
  *(void *)(v9 + 48) = *(void *)(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v9 + 56) = *(unsigned char *)(v10 + 56);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (long long *)(a2 + v11);
  long long v14 = *v13;
  long long v15 = v13[1];
  *(void *)(v12 + 32) = *((void *)v13 + 4);
  *(_OWORD *)uint64_t v12 = v14;
  *(_OWORD *)(v12 + 16) = v15;
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  v7(a1 + v16, v18, v6);
  uint64_t v19 = (int *)type metadata accessor for Timing(0);
  *(void *)(v17 + v19[5]) = *(void *)(v18 + v19[5]);
  *(void *)(v17 + v19[6]) = *(void *)(v18 + v19[6]);
  *(unsigned char *)(v17 + v19[7]) = *(unsigned char *)(v18 + v19[7]);
  return a1;
}

uint64_t sub_246AD20D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = (_OWORD *)(a1 + v8);
  uint64_t v11 = (_OWORD *)(a2 + v8);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  long long v13 = *(_OWORD *)((char *)v11 + 41);
  v10[2] = v11[2];
  *(_OWORD *)((char *)v10 + 41) = v13;
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  long long v18 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + 16) = v18;
  *(void *)(v16 + 32) = *(void *)(v17 + 32);
  uint64_t v19 = a1 + v15;
  uint64_t v20 = a2 + v15;
  v7(a1 + v15, v20, v6);
  uint64_t v21 = (int *)type metadata accessor for Timing(0);
  *(void *)(v19 + v21[5]) = *(void *)(v20 + v21[5]);
  *(void *)(v19 + v21[6]) = *(void *)(v20 + v21[6]);
  *(unsigned char *)(v19 + v21[7]) = *(unsigned char *)(v20 + v21[7]);
  return a1;
}

uint64_t sub_246AD21E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = *(void *)(a2 + v8 + 8);
  *(void *)uint64_t v9 = *(void *)(a2 + v8);
  *(void *)(v9 + 8) = v11;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v9 + 16) = *(_OWORD *)(v10 + 16);
  *(unsigned char *)(v9 + 32) = *(unsigned char *)(v10 + 32);
  uint64_t v12 = *(void *)(v10 + 48);
  *(void *)(v9 + 40) = *(void *)(v10 + 40);
  *(void *)(v9 + 48) = v12;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v9 + 56) = *(unsigned char *)(v10 + 56);
  uint64_t v13 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)(v14 + 32) = *(void *)(v15 + 32);
  long long v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  v7(a1 + v17, v19, v6);
  uint64_t v20 = (int *)type metadata accessor for Timing(0);
  *(void *)(v18 + v20[5]) = *(void *)(v19 + v20[5]);
  *(void *)(v18 + v20[6]) = *(void *)(v19 + v20[6]);
  *(unsigned char *)(v18 + v20[7]) = *(unsigned char *)(v19 + v20[7]);
  return a1;
}

uint64_t sub_246AD2324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246AD2338);
}

uint64_t sub_246AD2338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246AD89C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for Timing(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 32);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_246AD2468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246AD247C);
}

uint64_t sub_246AD247C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_246AD89C0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for Timing(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 32);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for Sprite()
{
  uint64_t result = qword_2691C1CF0;
  if (!qword_2691C1CF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246AD25F8()
{
  uint64_t result = sub_246AD89C0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Timing(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_246AD26DC(char a1)
{
  return *(void *)&aForefronforegr[8 * a1];
}

uint64_t sub_246AD26FC(char a1)
{
  return qword_246AE5380[a1];
}

uint64_t sub_246AD271C(uint64_t a1)
{
  unint64_t v2 = sub_246AD4E28();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AD2758(uint64_t a1)
{
  unint64_t v2 = sub_246AD4E28();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AD2794()
{
  return sub_246AD26DC(*v0);
}

uint64_t sub_246AD279C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AD4404(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AD27C4(uint64_t a1)
{
  unint64_t v2 = sub_246AD4DD4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AD2800(uint64_t a1)
{
  unint64_t v2 = sub_246AD4DD4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AD283C(uint64_t a1)
{
  unint64_t v2 = sub_246AD4F24();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AD2878(uint64_t a1)
{
  unint64_t v2 = sub_246AD4F24();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AD28B4(uint64_t a1)
{
  unint64_t v2 = sub_246AD4ED0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AD28F0(uint64_t a1)
{
  unint64_t v2 = sub_246AD4ED0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AD292C(uint64_t a1)
{
  unint64_t v2 = sub_246AD4E7C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AD2968(uint64_t a1)
{
  unint64_t v2 = sub_246AD4E7C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AD29A4()
{
  return sub_246AD26FC(*v0);
}

uint64_t sub_246AD29AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246AD45C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246AD29D4(uint64_t a1)
{
  unint64_t v2 = sub_246AD410C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246AD2A10(uint64_t a1)
{
  unint64_t v2 = sub_246AD410C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246AD2A4C()
{
  sub_246AD89C0();
  sub_246AD43BC(&qword_2691C0488, MEMORY[0x263F07508]);
  sub_246AD8B60();
  uint64_t v1 = type metadata accessor for Sprite();
  unint64_t v2 = (_OWORD *)(v0 + *(int *)(v1 + 20));
  v7[0] = v2[2];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)v2 + 41);
  long long v3 = v2[1];
  v6[0] = *v2;
  v6[1] = v3;
  sub_246AAF11C((uint64_t)v6);
  sub_246A9C044();
  sub_246ACF034((uint64_t)v6);
  sub_246AD9110();
  sub_246A961B0((long long *)(v0 + *(int *)(v1 + 28)), (uint64_t)v5);
  sub_246AB82B4();
  sub_246AD8B60();
  type metadata accessor for Timing(0);
  sub_246AD9110();
  sub_246AD9110();
  return sub_246AD9110();
}

uint64_t sub_246AD2BA0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_246A8604C(&qword_2691C1D48);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246AD410C();
  sub_246AD9160();
  LOBYTE(v20) = 0;
  sub_246AD89C0();
  sub_246AD43BC(&qword_2691C0500, MEMORY[0x263F07508]);
  sub_246AD9020();
  if (!v2)
  {
    uint64_t v9 = (int *)type metadata accessor for Sprite();
    uint64_t v10 = v3 + v9[5];
    uint64_t v11 = *(void *)(v10 + 8);
    char v12 = *(unsigned char *)(v10 + 32);
    char v13 = *(unsigned char *)(v10 + 56);
    *(void *)&long long v20 = *(void *)v10;
    *((void *)&v20 + 1) = v11;
    long long v21 = *(_OWORD *)(v10 + 16);
    LOBYTE(v22) = v12;
    long long v23 = *(_OWORD *)(v10 + 40);
    char v24 = v13;
    char v19 = 1;
    sub_246AD42C0();
    sub_246AD9020();
    LOBYTE(v20) = *(unsigned char *)(v3 + v9[6]);
    char v19 = 2;
    sub_246AD4314();
    sub_246AD9020();
    uint64_t v14 = (long long *)(v3 + v9[7]);
    uint64_t v15 = *((void *)v14 + 4);
    long long v16 = v14[1];
    long long v20 = *v14;
    long long v21 = v16;
    uint64_t v22 = v15;
    char v19 = 3;
    sub_246AD4368();
    sub_246AD9020();
    LOBYTE(v20) = 4;
    type metadata accessor for Timing(0);
    sub_246AD43BC(&qword_2691C1D68, (void (*)(uint64_t))type metadata accessor for Timing);
    sub_246AD9020();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_246AD2EA0()
{
  sub_246AD9100();
  sub_246AD89C0();
  sub_246AD43BC(&qword_2691C0488, MEMORY[0x263F07508]);
  sub_246AD8B60();
  uint64_t v1 = type metadata accessor for Sprite();
  uint64_t v2 = (_OWORD *)(v0 + *(int *)(v1 + 20));
  v7[0] = v2[2];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)v2 + 41);
  long long v3 = v2[1];
  v6[0] = *v2;
  v6[1] = v3;
  sub_246AAF11C((uint64_t)v6);
  sub_246A9C044();
  sub_246ACF034((uint64_t)v6);
  sub_246AD9110();
  sub_246A961B0((long long *)(v0 + *(int *)(v1 + 28)), (uint64_t)v5);
  sub_246AB82B4();
  sub_246AD8B60();
  type metadata accessor for Timing(0);
  sub_246AD9110();
  sub_246AD9110();
  sub_246AD9110();
  return sub_246AD9140();
}

uint64_t sub_246AD300C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = type metadata accessor for Timing(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246AD89C0();
  uint64_t v37 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246A8604C(&qword_2691C1D18);
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v33 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = type metadata accessor for Sprite();
  MEMORY[0x270FA5388](v36);
  char v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246AD89B0();
  uint64_t v14 = a1[3];
  uint64_t v35 = a1;
  sub_246A8A6E4(a1, v14);
  sub_246AD410C();
  uint64_t v34 = v11;
  uint64_t v15 = v38;
  sub_246AD9150();
  if (v15)
  {
    uint64_t v16 = v6;
    uint64_t v19 = v37;
    sub_246A85F9C((uint64_t)v35);
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v13, v16);
  }
  else
  {
    v30[1] = v3;
    uint64_t v17 = v32;
    char v38 = v5;
    LOBYTE(v39) = 0;
    sub_246AD43BC(&qword_2691C04A0, MEMORY[0x263F07508]);
    uint64_t v18 = v33;
    sub_246AD8FA0();
    (*(void (**)(char *, char *, uint64_t))(v37 + 40))(v13, v8, v6);
    char v44 = 1;
    sub_246AD4160();
    sub_246AD8FA0();
    uint64_t v21 = *((void *)&v39 + 1);
    char v22 = v41;
    char v23 = v43;
    char v24 = (int *)v36;
    uint64_t v25 = &v13[*(int *)(v36 + 20)];
    *(void *)uint64_t v25 = v39;
    *((void *)v25 + 1) = v21;
    *((_OWORD *)v25 + 1) = v40;
    v25[32] = v22;
    *(_OWORD *)(v25 + 40) = v42;
    v25[56] = v23;
    char v44 = 2;
    sub_246AD41B4();
    sub_246AD8FA0();
    v13[v24[6]] = v39;
    char v44 = 3;
    sub_246AD4208();
    sub_246AD8FA0();
    uint64_t v26 = v41;
    uint64_t v27 = &v13[v24[7]];
    long long v28 = v40;
    *(_OWORD *)uint64_t v27 = v39;
    *((_OWORD *)v27 + 1) = v28;
    *((void *)v27 + 4) = v26;
    LOBYTE(v39) = 4;
    sub_246AD43BC(&qword_2691C1D40, (void (*)(uint64_t))type metadata accessor for Timing);
    uint64_t v29 = (uint64_t)v38;
    sub_246AD8FA0();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v34, v18);
    sub_246AD425C(v29, (uint64_t)&v13[v24[8]]);
    sub_246AD404C((uint64_t)v13, v31);
    sub_246A85F9C((uint64_t)v35);
    return sub_246AD40B0((uint64_t)v13);
  }
}

uint64_t sub_246AD3540(void *a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_246A8604C(&qword_2691C1DC0);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  MEMORY[0x270FA5388](v3);
  long long v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246A8604C(&qword_2691C1DC8);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v25 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C1DD0);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C1DD8);
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_246A8604C(&qword_2691C1DE0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246A8A6E4(a1, a1[3]);
  sub_246AD4DD4();
  sub_246AD9160();
  switch((char)v31)
  {
    case 1:
      char v33 = 1;
      sub_246AD4ED0();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
      break;
    case 2:
      char v34 = 2;
      sub_246AD4E7C();
      uint64_t v17 = v25;
      sub_246AD8FC0();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
      goto LABEL_5;
    case 3:
      char v35 = 3;
      sub_246AD4E28();
      uint64_t v17 = v28;
      sub_246AD8FC0();
      uint64_t v19 = v29;
      uint64_t v18 = v30;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_246AD4F24();
      sub_246AD8FC0();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_246AD3988@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246AD300C(a1, a2);
}

uint64_t sub_246AD39A0(void *a1)
{
  return sub_246AD2BA0(a1);
}

uint64_t sub_246AD39C4(uint64_t a1, uint64_t a2)
{
  sub_246AD9100();
  sub_246AD89C0();
  sub_246AD43BC(&qword_2691C0488, MEMORY[0x263F07508]);
  sub_246AD8B60();
  uint64_t v4 = (_OWORD *)(v2 + *(int *)(a2 + 20));
  long long v5 = v4[1];
  v8[0] = *v4;
  v8[1] = v5;
  v9[0] = v4[2];
  *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)((char *)v4 + 41);
  sub_246AAF11C((uint64_t)v8);
  sub_246A9C044();
  sub_246ACF034((uint64_t)v8);
  sub_246AD9110();
  sub_246A961B0((long long *)(v2 + *(int *)(a2 + 28)), (uint64_t)v7);
  sub_246AB82B4();
  sub_246AD8B60();
  type metadata accessor for Timing(0);
  sub_246AD9110();
  sub_246AD9110();
  sub_246AD9110();
  return sub_246AD9140();
}

void sub_246AD3B24(void *a1@<X8>)
{
  *a1 = &unk_26FB02350;
}

char *sub_246AD3B34@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_246AD479C(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_246AD3B60(void *a1)
{
  return sub_246AD3540(a1, *v1);
}

unint64_t sub_246AD3B80()
{
  unint64_t result = qword_2691C1D00;
  if (!qword_2691C1D00)
  {
    sub_246A8A7DC(&qword_2691C1D08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1D00);
  }
  return result;
}

uint64_t sub_246AD3BDC()
{
  return sub_246AD43BC(&qword_2691C0488, MEMORY[0x263F07508]);
}

uint64_t sub_246AD3C24()
{
  return sub_246AD43BC(&qword_2691C1D10, (void (*)(uint64_t))type metadata accessor for Sprite);
}

BOOL sub_246AD3C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for Sprite();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v47 = (uint64_t)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v46 = (uint64_t)&v46 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v46 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v46 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v46 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  long long v20 = (char *)&v46 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v46 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v46 - v24;
  char v26 = sub_246AD89A0();
  sub_246AD404C(a1, (uint64_t)v25);
  sub_246AD404C(a2, (uint64_t)v23);
  if ((v26 & 1) == 0)
  {
    sub_246AD40B0((uint64_t)v25);
    sub_246AD40B0((uint64_t)v23);
    sub_246AD404C(a1, (uint64_t)v20);
    sub_246AD404C(a2, (uint64_t)v17);
    goto LABEL_10;
  }
  uint64_t v27 = &v25[v4[5]];
  v51[0] = *((_OWORD *)v27 + 2);
  *(_OWORD *)((char *)v51 + 9) = *(_OWORD *)(v27 + 41);
  long long v28 = *((_OWORD *)v27 + 1);
  v50[0] = *(_OWORD *)v27;
  v50[1] = v28;
  uint64_t v29 = &v23[v4[5]];
  *(_OWORD *)&v53[9] = *(_OWORD *)(v29 + 41);
  long long v30 = *((_OWORD *)v29 + 2);
  long long v31 = *(_OWORD *)v29;
  v52[1] = *((_OWORD *)v29 + 1);
  *(_OWORD *)uint64_t v53 = v30;
  v52[0] = v31;
  char v32 = sub_246A9C598((uint64_t)v50, (uint64_t)v52);
  sub_246AD40B0((uint64_t)v25);
  sub_246AD40B0((uint64_t)v23);
  sub_246AD404C(a1, (uint64_t)v20);
  sub_246AD404C(a2, (uint64_t)v17);
  if ((v32 & 1) == 0)
  {
LABEL_10:
    sub_246AD40B0((uint64_t)v17);
    sub_246AD40B0((uint64_t)v20);
    sub_246AD404C(a1, (uint64_t)v14);
    sub_246AD404C(a2, (uint64_t)v11);
    goto LABEL_11;
  }
  int v33 = v20[v4[6]];
  sub_246AD40B0((uint64_t)v20);
  int v34 = v17[v4[6]];
  sub_246AD40B0((uint64_t)v17);
  sub_246AD404C(a1, (uint64_t)v14);
  sub_246AD404C(a2, (uint64_t)v11);
  if (v33 != v34)
  {
LABEL_11:
    sub_246AD40B0((uint64_t)v11);
    sub_246AD40B0((uint64_t)v14);
    uint64_t v44 = a1;
    uint64_t v37 = v46;
    sub_246AD404C(v44, v46);
    uint64_t v38 = v47;
    sub_246AD404C(a2, v47);
LABEL_12:
    BOOL v43 = 0;
    goto LABEL_13;
  }
  sub_246A961B0((long long *)&v14[v4[7]], (uint64_t)v48);
  sub_246AD40B0((uint64_t)v14);
  sub_246A961B0((long long *)&v11[v4[7]], (uint64_t)v49);
  sub_246AD40B0((uint64_t)v11);
  BOOL v35 = sub_246ABB194(v48, v49);
  uint64_t v36 = a1;
  uint64_t v37 = v46;
  sub_246AD404C(v36, v46);
  uint64_t v38 = v47;
  sub_246AD404C(a2, v47);
  if (!v35) {
    goto LABEL_12;
  }
  uint64_t v39 = v4[8];
  uint64_t v40 = v37 + v39;
  uint64_t v41 = v38 + v39;
  if ((sub_246AD89A0() & 1) == 0) {
    goto LABEL_12;
  }
  long long v42 = (int *)type metadata accessor for Timing(0);
  if (*(void *)(v40 + v42[5]) != *(void *)(v41 + v42[5]) || *(void *)(v40 + v42[6]) != *(void *)(v41 + v42[6])) {
    goto LABEL_12;
  }
  BOOL v43 = *(unsigned __int8 *)(v40 + v42[7]) == *(unsigned __int8 *)(v41 + v42[7]);
LABEL_13:
  sub_246AD40B0(v38);
  sub_246AD40B0(v37);
  return v43;
}

uint64_t sub_246AD404C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Sprite();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246AD40B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Sprite();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_246AD410C()
{
  unint64_t result = qword_2691C1D20;
  if (!qword_2691C1D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1D20);
  }
  return result;
}

unint64_t sub_246AD4160()
{
  unint64_t result = qword_2691C1D28;
  if (!qword_2691C1D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1D28);
  }
  return result;
}

unint64_t sub_246AD41B4()
{
  unint64_t result = qword_2691C1D30;
  if (!qword_2691C1D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1D30);
  }
  return result;
}

unint64_t sub_246AD4208()
{
  unint64_t result = qword_2691C1D38;
  if (!qword_2691C1D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1D38);
  }
  return result;
}

uint64_t sub_246AD425C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Timing(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_246AD42C0()
{
  unint64_t result = qword_2691C1D50;
  if (!qword_2691C1D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1D50);
  }
  return result;
}

unint64_t sub_246AD4314()
{
  unint64_t result = qword_2691C1D58;
  if (!qword_2691C1D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1D58);
  }
  return result;
}

unint64_t sub_246AD4368()
{
  unint64_t result = qword_2691C1D60;
  if (!qword_2691C1D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1D60);
  }
  return result;
}

uint64_t sub_246AD43BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246AD4404(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F726665726F66 && a2 == 0xE900000000000074 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x756F726765726F66 && a2 == 0xEA0000000000646ELL || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E756F726764696DLL && a2 == 0xE900000000000064 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x756F72676B636162 && a2 == 0xEA0000000000646ELL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_246AD45C4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73616C7461 && a2 == 0xE500000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656E616C70 && a2 == 0xE500000000000000 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E656D6563616C70 && a2 == 0xE900000000000074 || (sub_246AD9060() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x676E696D6974 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_246AD9060();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

char *sub_246AD479C(void *a1)
{
  uint64_t v41 = sub_246A8604C(&qword_2691C1D70);
  uint64_t v45 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_246A8604C(&qword_2691C1D78);
  uint64_t v42 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  BOOL v43 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246A8604C(&qword_2691C1D80);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246A8604C(&qword_2691C1D88);
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246A8604C(&qword_2691C1D90);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v46 = a1;
  sub_246A8A6E4(a1, v14);
  sub_246AD4DD4();
  uint64_t v15 = v47;
  sub_246AD9150();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v35 = v7;
  uint64_t v36 = v9;
  uint64_t v16 = v43;
  uint64_t v17 = v44;
  uint64_t v47 = 0;
  uint64_t v18 = v45;
  uint64_t v19 = v11;
  long long v20 = v13;
  uint64_t v21 = sub_246AD8FB0();
  uint64_t v22 = (char *)v21;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v25 = sub_246AD8E70();
    swift_allocError();
    uint64_t v13 = v22;
    uint64_t v26 = v10;
    long long v28 = v27;
    sub_246A8604C(&qword_2691C05D0);
    *long long v28 = &type metadata for Sprite.Plane;
    sub_246AD8F40();
    sub_246AD8E30();
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
      sub_246AD4ED0();
      uint64_t v31 = v47;
      sub_246AD8F30();
      if (v31) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
      goto LABEL_14;
    case 2:
      char v50 = 2;
      sub_246AD4E7C();
      uint64_t v32 = v47;
      sub_246AD8F30();
      if (v32) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v40);
      goto LABEL_14;
    case 3:
      char v51 = 3;
      sub_246AD4E28();
      uint64_t v33 = v47;
      sub_246AD8F30();
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
      sub_246AD4F24();
      uint64_t v23 = v36;
      uint64_t v24 = v47;
      sub_246AD8F30();
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
  sub_246A85F9C(v29);
  return v13;
}

unint64_t sub_246AD4DD4()
{
  unint64_t result = qword_2691C1D98;
  if (!qword_2691C1D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1D98);
  }
  return result;
}

unint64_t sub_246AD4E28()
{
  unint64_t result = qword_2691C1DA0;
  if (!qword_2691C1DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1DA0);
  }
  return result;
}

unint64_t sub_246AD4E7C()
{
  unint64_t result = qword_2691C1DA8;
  if (!qword_2691C1DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1DA8);
  }
  return result;
}

unint64_t sub_246AD4ED0()
{
  unint64_t result = qword_2691C1DB0;
  if (!qword_2691C1DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1DB0);
  }
  return result;
}

unint64_t sub_246AD4F24()
{
  unint64_t result = qword_2691C1DB8;
  if (!qword_2691C1DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1DB8);
  }
  return result;
}

ValueMetadata *type metadata accessor for Sprite.Plane.CodingKeys()
{
  return &type metadata for Sprite.Plane.CodingKeys;
}

ValueMetadata *type metadata accessor for Sprite.Plane.ForefrontCodingKeys()
{
  return &type metadata for Sprite.Plane.ForefrontCodingKeys;
}

ValueMetadata *type metadata accessor for Sprite.Plane.ForegroundCodingKeys()
{
  return &type metadata for Sprite.Plane.ForegroundCodingKeys;
}

ValueMetadata *type metadata accessor for Sprite.Plane.MidgroundCodingKeys()
{
  return &type metadata for Sprite.Plane.MidgroundCodingKeys;
}

ValueMetadata *type metadata accessor for Sprite.Plane.BackgroundCodingKeys()
{
  return &type metadata for Sprite.Plane.BackgroundCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Sprite.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AD5098);
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

ValueMetadata *type metadata accessor for Sprite.CodingKeys()
{
  return &type metadata for Sprite.CodingKeys;
}

unsigned char *_s32NTKEsterbrookFaceBundleCompanion6SpriteV5PlaneOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AD519CLL);
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

ValueMetadata *type metadata accessor for Sprite.Plane()
{
  return &type metadata for Sprite.Plane;
}

unint64_t sub_246AD51D8()
{
  unint64_t result = qword_2691C1DE8;
  if (!qword_2691C1DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1DE8);
  }
  return result;
}

unint64_t sub_246AD5230()
{
  unint64_t result = qword_2691C1DF0;
  if (!qword_2691C1DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1DF0);
  }
  return result;
}

unint64_t sub_246AD5288()
{
  unint64_t result = qword_2691C1DF8;
  if (!qword_2691C1DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1DF8);
  }
  return result;
}

unint64_t sub_246AD52E0()
{
  unint64_t result = qword_2691C1E00;
  if (!qword_2691C1E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E00);
  }
  return result;
}

unint64_t sub_246AD5338()
{
  unint64_t result = qword_2691C1E08;
  if (!qword_2691C1E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E08);
  }
  return result;
}

unint64_t sub_246AD5390()
{
  unint64_t result = qword_2691C1E10;
  if (!qword_2691C1E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E10);
  }
  return result;
}

unint64_t sub_246AD53E8()
{
  unint64_t result = qword_2691C1E18;
  if (!qword_2691C1E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E18);
  }
  return result;
}

unint64_t sub_246AD5440()
{
  unint64_t result = qword_2691C1E20;
  if (!qword_2691C1E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E20);
  }
  return result;
}

unint64_t sub_246AD5498()
{
  unint64_t result = qword_2691C1E28;
  if (!qword_2691C1E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E28);
  }
  return result;
}

unint64_t sub_246AD54F0()
{
  unint64_t result = qword_2691C1E30;
  if (!qword_2691C1E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E30);
  }
  return result;
}

unint64_t sub_246AD5548()
{
  unint64_t result = qword_2691C1E38;
  if (!qword_2691C1E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E38);
  }
  return result;
}

unint64_t sub_246AD55A0()
{
  unint64_t result = qword_2691C1E40;
  if (!qword_2691C1E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E40);
  }
  return result;
}

unint64_t sub_246AD55F8()
{
  unint64_t result = qword_2691C1E48;
  if (!qword_2691C1E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E48);
  }
  return result;
}

unint64_t sub_246AD5650()
{
  unint64_t result = qword_2691C1E50;
  if (!qword_2691C1E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E50);
  }
  return result;
}

unint64_t sub_246AD56A8()
{
  unint64_t result = qword_2691C1E58;
  if (!qword_2691C1E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E58);
  }
  return result;
}

id sub_246AD56FC()
{
  id result = (id)CLKUIInterpolateBetweenColors();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v1 = result;
  id result = (id)CLKUIInterpolateBetweenColors();
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v2 = result;
  id result = (id)CLKUIInterpolateBetweenColors();
  if (result)
  {
    id v3 = result;
    unsigned int v4 = (objc_class *)type metadata accessor for ScenePalette();
    uint64_t v5 = (char *)objc_allocWithZone(v4);
    *(void *)&v5[OBJC_IVAR___NTKEsterbrookScenePalette_background] = v1;
    *(void *)&v5[OBJC_IVAR___NTKEsterbrookScenePalette_overlay] = v2;
    *(void *)&v5[OBJC_IVAR___NTKEsterbrookScenePalette_secondHand] = v3;
    v6.receiver = v5;
    v6.super_class = v4;
    objc_msgSendSuper2(&v6, sel_init);
    return (id)swift_dynamicCastClassUnconditional();
  }
LABEL_7:
  __break(1u);
  return result;
}

id sub_246AD5A0C(uint64_t a1)
{
  sub_246AD5D5C(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_246AD5CFC((uint64_t)v5);
    return 0;
  }
  type metadata accessor for ScenePalette();
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  if (!objc_msgSend(*(id *)(v1 + OBJC_IVAR___NTKEsterbrookScenePalette_background), sel_isEqual_, *(void *)&v4[OBJC_IVAR___NTKEsterbrookScenePalette_background])|| (objc_msgSend(*(id *)(v1 + OBJC_IVAR___NTKEsterbrookScenePalette_overlay), sel_isEqual_, *(void *)&v4[OBJC_IVAR___NTKEsterbrookScenePalette_overlay]) & 1) == 0)
  {

    return 0;
  }
  id v2 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___NTKEsterbrookScenePalette_secondHand), sel_isEqual_, *(void *)&v4[OBJC_IVAR___NTKEsterbrookScenePalette_secondHand]);

  return v2;
}

id sub_246AD5B94()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScenePalette();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScenePalette()
{
  return self;
}

id sub_246AD5CCC@<X0>(void *a1@<X8>)
{
  id result = sub_246AD56FC();
  *a1 = result;
  return result;
}

uint64_t sub_246AD5CFC(uint64_t a1)
{
  uint64_t v2 = sub_246A8604C(&qword_2691C1E78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246AD5D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246A8604C(&qword_2691C1E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for AtlasDirectoryAttributes(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AtlasDirectoryAttributes()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AtlasDirectoryAttributes(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AtlasDirectoryAttributes(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AtlasDirectoryAttributes(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AtlasDirectoryAttributes(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)id result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AtlasDirectoryAttributes()
{
  return &type metadata for AtlasDirectoryAttributes;
}

uint64_t sub_246AD5F14@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_246AD8F20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_246AD5F68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_246AD5F94();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_246AD5F94()
{
  return 0x6F72627265747365;
}

uint64_t *sub_246AD5FB0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_246AD89C0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
    uint64_t v11 = type metadata accessor for Timeline(0);
    v7[*(int *)(v11 + 20)] = v8[*(int *)(v11 + 20)];
    *(void *)&v7[*(int *)(v11 + 24)] = *(void *)&v8[*(int *)(v11 + 24)];
  }
  return v3;
}

uint64_t sub_246AD60B8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_246AD89C0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_246AD6130(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_246AD89C0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  uint64_t v10 = type metadata accessor for Timeline(0);
  v6[*(int *)(v10 + 20)] = v7[*(int *)(v10 + 20)];
  *(void *)&v6[*(int *)(v10 + 24)] = *(void *)&v7[*(int *)(v10 + 24)];
  return a1;
}

void *sub_246AD61E8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_246AD89C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = type metadata accessor for Timeline(0);
  v7[*(int *)(v10 + 20)] = v8[*(int *)(v10 + 20)];
  *(void *)&v7[*(int *)(v10 + 24)] = *(void *)&v8[*(int *)(v10 + 24)];
  return a1;
}

_OWORD *sub_246AD62A4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_246AD89C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  uint64_t v8 = type metadata accessor for Timeline(0);
  v5[*(int *)(v8 + 20)] = v6[*(int *)(v8 + 20)];
  *(void *)&v5[*(int *)(v8 + 24)] = *(void *)&v6[*(int *)(v8 + 24)];
  return a1;
}

void *sub_246AD6340(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_246AD89C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = type metadata accessor for Timeline(0);
  v8[*(int *)(v11 + 20)] = v9[*(int *)(v11 + 20)];
  *(void *)&v8[*(int *)(v11 + 24)] = *(void *)&v9[*(int *)(v11 + 24)];
  return a1;
}

uint64_t sub_246AD63EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246AD6400);
}

uint64_t sub_246AD6400(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for Timeline(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_246AD64B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246AD64C4);
}

uint64_t sub_246AD64C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Timeline(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for SpriteAnimationAttributes()
{
  uint64_t result = qword_2691C1E80;
  if (!qword_2691C1E80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246AD65B8()
{
  uint64_t result = type metadata accessor for Timeline(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AtlasDirectoryAttributes.Directory(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x246AD66ECLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AtlasDirectoryAttributes.Directory()
{
  return &type metadata for AtlasDirectoryAttributes.Directory;
}

unint64_t sub_246AD6728()
{
  unint64_t result = qword_2691C1E90;
  if (!qword_2691C1E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E90);
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneDisplayMode()
{
  return &type metadata for SceneDisplayMode;
}

void sub_246AD6790()
{
  id v1 = objc_msgSend(v0, sel_configuration);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_handLength);
    objc_msgSend(v2, sel_armLength);
    objc_msgSend(v2, sel_pegRadius);
    objc_msgSend(v2, sel_pegStrokeWidth);
    objc_msgSend(v2, sel_inlayInsetRadius);

    id v3 = objc_msgSend(v0, sel_configuration);
    if (v3)
    {
      unsigned int v4 = v3;
      objc_msgSend(v3, sel_handWidth);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_246AD68A0@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  v19[9] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_246AD8A30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (char *)a2 + *(int *)(type metadata accessor for TimeAttributes(0) + 20);
  uint64_t v9 = sub_246AD8980();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  uint64_t v18 = 0;
  v19[0] = 0;
  uint64_t v17 = 0;
  uint64_t v11 = (void *)sub_246AD8960();
  id v12 = objc_msgSend(self, sel_autoupdatingCurrentCalendar);
  sub_246AD89F0();

  uint64_t v13 = (void *)sub_246AD89D0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  MEMORY[0x24C540980](v19, &v18, &v17, v11, v13);

  sub_246A8604C(&qword_2691C1EA0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246ADE980;
  *(unsigned char *)(inited + 32) = 0;
  *(void *)(inited + 40) = v19[0];
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 56) = v18;
  unint64_t v15 = sub_246ACF33C(inited);
  swift_setDeallocating();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  *a2 = v15;
  return result;
}

uint64_t sub_246AD6AEC(unint64_t a1)
{
  if (a1 < 3) {
    return *(void *)&aIdealizelive_1[8 * a1];
  }
  uint64_t result = sub_246AD9070();
  __break(1u);
  return result;
}

uint64_t *sub_246AD6B50@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_246AD6B6C()
{
  return sub_246AD6AEC(*v0);
}

unint64_t sub_246AD6B78()
{
  unint64_t result = qword_2691C1E98;
  if (!qword_2691C1E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1E98);
  }
  return result;
}

uint64_t type metadata accessor for TimeAttributes(uint64_t a1)
{
  return sub_246AB3D70(a1, (uint64_t *)&unk_2691C1EC0);
}

void sub_246AD6BEC()
{
  qword_2691D41D0 = 0;
  qword_2691D41D8 = 0;
}

void *sub_246AD6BFC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(void *)(a1 + 32) = a2[4];
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    *(void *)(a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v11 = *(int *)(type metadata accessor for TimeAttributes(0) + 20);
    uint64_t v12 = v9 + v11;
    uint64_t v13 = v10 + v11;
    uint64_t v14 = sub_246AD8980();
    unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v12, v13, v14);
    uint64_t v16 = *(int *)(a3 + 28);
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = type metadata accessor for TimeRule();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = sub_246A8604C(&qword_2691C1108);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v23 = sub_246AD89C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v17, v18, v23);
      uint64_t v24 = *(int *)(v19 + 20);
      uint64_t v25 = &v17[v24];
      uint64_t v26 = &v18[v24];
      *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
      v25[16] = v26[16];
      uint64_t v27 = *(int *)(v19 + 24);
      long long v28 = &v17[v27];
      uint64_t v29 = &v18[v27];
      *(_OWORD *)long long v28 = *(_OWORD *)v29;
      v28[16] = v29[16];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
  }
  return v4;
}

uint64_t sub_246AD6E4C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for TimeAttributes(0) + 20);
  uint64_t v6 = sub_246AD8980();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  uint64_t v8 = type metadata accessor for TimeRule();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8);
  if (!result)
  {
    uint64_t v10 = sub_246AD89C0();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
    return v11(v7, v10);
  }
  return result;
}

uint64_t sub_246AD6F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v10 = *(int *)(type metadata accessor for TimeAttributes(0) + 20);
  uint64_t v11 = v8 + v10;
  uint64_t v12 = v9 + v10;
  uint64_t v13 = sub_246AD8980();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v11, v12, v13);
  uint64_t v15 = *(int *)(a3 + 28);
  uint64_t v16 = (char *)(a1 + v15);
  uint64_t v17 = (char *)(a2 + v15);
  uint64_t v18 = type metadata accessor for TimeRule();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = sub_246A8604C(&qword_2691C1108);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    uint64_t v21 = sub_246AD89C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v16, v17, v21);
    uint64_t v22 = *(int *)(v18 + 20);
    uint64_t v23 = &v16[v22];
    uint64_t v24 = &v17[v22];
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    v23[16] = v24[16];
    uint64_t v25 = *(int *)(v18 + 24);
    uint64_t v26 = &v16[v25];
    uint64_t v27 = &v17[v25];
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    v26[16] = v27[16];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

void *sub_246AD7174(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(type metadata accessor for TimeAttributes(0) + 20);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = sub_246AD8980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for TimeRule();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v11) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (!v11)
  {
    if (!v19)
    {
      uint64_t v31 = sub_246AD89C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 24))(v14, v15, v31);
      uint64_t v32 = *(int *)(v16 + 20);
      uint64_t v33 = &v14[v32];
      uint64_t v34 = &v15[v32];
      char v35 = v34[16];
      *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
      v33[16] = v35;
      uint64_t v36 = *(int *)(v16 + 24);
      uint64_t v37 = &v14[v36];
      uint64_t v38 = &v15[v36];
      char v39 = v38[16];
      *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
      v37[16] = v39;
      return a1;
    }
    sub_246A98380((uint64_t)v14);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v29 = sub_246A8604C(&qword_2691C1108);
    memcpy(v14, v15, *(void *)(*(void *)(v29 - 8) + 64));
    return a1;
  }
  uint64_t v20 = sub_246AD89C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v14, v15, v20);
  uint64_t v21 = *(int *)(v16 + 20);
  uint64_t v22 = &v14[v21];
  uint64_t v23 = &v15[v21];
  char v24 = v23[16];
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  v22[16] = v24;
  uint64_t v25 = *(int *)(v16 + 24);
  uint64_t v26 = &v14[v25];
  uint64_t v27 = &v15[v25];
  char v28 = v27[16];
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  v26[16] = v28;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t sub_246AD7434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v10 = *(int *)(type metadata accessor for TimeAttributes(0) + 20);
  uint64_t v11 = v8 + v10;
  uint64_t v12 = v9 + v10;
  uint64_t v13 = sub_246AD8980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = type metadata accessor for TimeRule();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = sub_246A8604C(&qword_2691C1108);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    uint64_t v20 = sub_246AD89C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v15, v16, v20);
    uint64_t v21 = *(int *)(v17 + 20);
    uint64_t v22 = &v15[v21];
    uint64_t v23 = &v16[v21];
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    v22[16] = v23[16];
    uint64_t v24 = *(int *)(v17 + 24);
    uint64_t v25 = &v15[v24];
    uint64_t v26 = &v16[v24];
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
    v25[16] = v26[16];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t sub_246AD7610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(type metadata accessor for TimeAttributes(0) + 20);
  uint64_t v11 = v8 + v10;
  uint64_t v12 = v9 + v10;
  uint64_t v13 = sub_246AD8980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = type metadata accessor for TimeRule();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v12) = v19(v15, 1, v17);
  int v20 = v19(v16, 1, v17);
  if (!v12)
  {
    if (!v20)
    {
      uint64_t v30 = sub_246AD89C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 40))(v15, v16, v30);
      uint64_t v31 = *(int *)(v17 + 20);
      uint64_t v32 = &v15[v31];
      uint64_t v33 = &v16[v31];
      *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
      v32[16] = v33[16];
      uint64_t v34 = *(int *)(v17 + 24);
      char v35 = &v15[v34];
      uint64_t v36 = &v16[v34];
      *(_OWORD *)char v35 = *(_OWORD *)v36;
      v35[16] = v36[16];
      return a1;
    }
    sub_246A98380((uint64_t)v15);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v28 = sub_246A8604C(&qword_2691C1108);
    memcpy(v15, v16, *(void *)(*(void *)(v28 - 8) + 64));
    return a1;
  }
  uint64_t v21 = sub_246AD89C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v15, v16, v21);
  uint64_t v22 = *(int *)(v17 + 20);
  uint64_t v23 = &v15[v22];
  uint64_t v24 = &v16[v22];
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  v23[16] = v24[16];
  uint64_t v25 = *(int *)(v17 + 24);
  uint64_t v26 = &v15[v25];
  uint64_t v27 = &v16[v25];
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  v26[16] = v27[16];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

uint64_t sub_246AD78A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246AD78BC);
}

uint64_t sub_246AD78BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for TimeAttributes(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_246A8604C(&qword_2691C1108);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_246AD79EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246AD7A00);
}

uint64_t sub_246AD7A00(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for TimeAttributes(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_246A8604C(&qword_2691C1108);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for SceneLayoutAttributes(uint64_t a1)
{
  return sub_246AB3D70(a1, (uint64_t *)&unk_2691C1EA8);
}

void sub_246AD7B50()
{
  type metadata accessor for TimeAttributes(319);
  if (v0 <= 0x3F)
  {
    sub_246AD7C30();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_246AD7C30()
{
  if (!qword_2691C1EB8)
  {
    type metadata accessor for TimeRule();
    unint64_t v0 = sub_246AD8D80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2691C1EB8);
    }
  }
}

ValueMetadata *type metadata accessor for HandSize()
{
  return &type metadata for HandSize;
}

uint64_t *sub_246AD7C98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_246AD8980();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_246AD7D7C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_246AD8980();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_246AD7DF4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_246AD8980();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

void *sub_246AD7E8C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_246AD8980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *sub_246AD7F20(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_246AD8980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_246AD7F9C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_246AD8980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_246AD8028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246AD803C);
}

uint64_t sub_246AD803C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_246AD8980();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_246AD80EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246AD8100);
}

void *sub_246AD8100(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_246AD8980();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_246AD81A8()
{
  uint64_t result = sub_246AD8980();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for HandAttributes()
{
  return &type metadata for HandAttributes;
}

unsigned char *storeEnumTagSinglePayload for AnimatingState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246AD8320);
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

ValueMetadata *type metadata accessor for AnimatingState()
{
  return &type metadata for AnimatingState;
}

uint64_t sub_246AD8358(char a1)
{
  if (a1) {
    return 0x646573756170;
  }
  else {
    return 0x676E6979616C70;
  }
}

uint64_t sub_246AD838C()
{
  return sub_246AD8358(*v0);
}

unint64_t sub_246AD8398()
{
  unint64_t result = qword_2691C1ED0;
  if (!qword_2691C1ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1ED0);
  }
  return result;
}

uint64_t sub_246AD83EC(uint64_t a1)
{
  if (a1) {
    return 6710863;
  }
  else {
    return 7229216;
  }
}

void *sub_246AD840C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_246AD843C()
{
  return sub_246AD83EC(*v0);
}

uint64_t sub_246AD84AC()
{
  sub_246AD8BF0();
  swift_bridgeObjectRelease();
  sub_246AD8BF0();
  uint64_t result = (uint64_t)(id)NTKFaceDataModeDescription();
  if (result)
  {
    unint64_t v1 = (void *)result;
    sub_246AD8BB0();

    sub_246AA0B18();
    sub_246AD8DB0();
    swift_bridgeObjectRelease();
    sub_246AD8BF0();
    swift_bridgeObjectRelease();
    sub_246AD8BF0();
    return 40;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL sub_246AD85BC(uint64_t a1)
{
  sub_246AD5D5C(a1, (uint64_t)v5);
  if (v6)
  {
    type metadata accessor for NTKFaceState();
    if (swift_dynamicCast())
    {
      if (*(void *)&v4[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_dataMode] == *(void *)(v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_dataMode))
      {
        uint64_t v2 = *(void *)&v4[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_screenState];

        return v2 == *(void *)(v1 + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_screenState);
      }
    }
  }
  else
  {
    sub_246AD5CFC((uint64_t)v5);
  }
  return 0;
}

id sub_246AD871C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NTKFaceState();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NTKFaceState()
{
  return self;
}

id sub_246AD8774(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_dataMode);
  uint64_t v3 = NTKIsScreenOn() ^ 1;
  unsigned int v4 = (objc_class *)type metadata accessor for NTKFaceState();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_dataMode] = v2;
  *(void *)&v5[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState_screenState] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, sel_init);

  return v6;
}

ValueMetadata *type metadata accessor for NTKFaceState.NTKScreenState()
{
  return &type metadata for NTKFaceState.NTKScreenState;
}

unint64_t sub_246AD8828()
{
  unint64_t result = qword_2691C1EE8;
  if (!qword_2691C1EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691C1EE8);
  }
  return result;
}

uint64_t sub_246AD887C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_246AD88B0()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_246AD88C0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_246AD88D0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_246AD88E0()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_246AD88F0()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_246AD8900()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_246AD8910()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_246AD8920()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_246AD8930()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_246AD8940()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_246AD8950()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_246AD8960()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_246AD8970()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_246AD8980()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_246AD8990()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_246AD89A0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_246AD89B0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_246AD89C0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_246AD89D0()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_246AD89E0()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_246AD89F0()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_246AD8A00()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_246AD8A10()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_246AD8A20()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_246AD8A30()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_246AD8A40()
{
  return MEMORY[0x270EF1490]();
}

uint64_t sub_246AD8A50()
{
  return MEMORY[0x270EF14A0]();
}

uint64_t sub_246AD8A60()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_246AD8A70()
{
  return MEMORY[0x270EE3130]();
}

uint64_t sub_246AD8A80()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_246AD8A90()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_246AD8AA0()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_246AD8AB0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_246AD8AC0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_246AD8AD0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_246AD8AE0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_246AD8AF0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_246AD8B00()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_246AD8B10()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_246AD8B20()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_246AD8B30()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_246AD8B40()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_246AD8B50()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_246AD8B60()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_246AD8B70()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_246AD8B80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_246AD8B90()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_246AD8BA0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_246AD8BB0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_246AD8BC0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_246AD8BD0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_246AD8BE0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_246AD8BF0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_246AD8C00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_246AD8C10()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_246AD8C20()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_246AD8C30()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_246AD8C40()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_246AD8C50()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_246AD8C60()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_246AD8C70()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_246AD8C80()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_246AD8C90()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_246AD8CA0()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_246AD8CB0()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_246AD8CC0()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t sub_246AD8CD0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_246AD8CE0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_246AD8CF0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_246AD8D00()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_246AD8D10()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_246AD8D20()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_246AD8D30()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_246AD8D40()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_246AD8D50()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_246AD8D60()
{
  return MEMORY[0x270EE3150]();
}

uint64_t sub_246AD8D70()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_246AD8D80()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_246AD8D90()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_246AD8DA0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_246AD8DB0()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_246AD8DC0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_246AD8DD0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_246AD8DE0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_246AD8DF0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_246AD8E00()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_246AD8E10()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_246AD8E20()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_246AD8E30()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_246AD8E40()
{
  return MEMORY[0x270F9EA80]();
}

uint64_t sub_246AD8E50()
{
  return MEMORY[0x270F9EA88]();
}

uint64_t sub_246AD8E60()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_246AD8E70()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_246AD8E80()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_246AD8E90()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_246AD8EA0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_246AD8EB0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_246AD8EC0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_246AD8ED0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_246AD8EE0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_246AD8EF0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_246AD8F00()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_246AD8F20()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_246AD8F30()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_246AD8F40()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_246AD8F50()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_246AD8F60()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_246AD8F70()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_246AD8F80()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_246AD8F90()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_246AD8FA0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_246AD8FB0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_246AD8FC0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_246AD8FD0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_246AD8FE0()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_246AD8FF0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_246AD9000()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_246AD9010()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_246AD9020()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_246AD9030()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_246AD9040()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_246AD9050()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_246AD9060()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_246AD9070()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_246AD9080()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t sub_246AD9090()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t sub_246AD90A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_246AD90B0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_246AD90C0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_246AD90D0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_246AD90E0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_246AD90F0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_246AD9100()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_246AD9110()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_246AD9120()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_246AD9130()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_246AD9140()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_246AD9150()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_246AD9160()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_246AD9190()
{
  return MEMORY[0x270FA0128]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CLKCompressFraction()
{
  return MEMORY[0x270EE3170]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x270EE31B0]();
}

uint64_t CLKInterpolateBetweenRects()
{
  return MEMORY[0x270EE31C8]();
}

uint64_t CLKMapFractionIntoRange()
{
  return MEMORY[0x270EE3210]();
}

uint64_t CLKRectGetCenter()
{
  return MEMORY[0x270EE3240]();
}

uint64_t CLKUIInterpolateBetweenColors()
{
  return MEMORY[0x270F16920]();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return MEMORY[0x270F4D8F8]();
}

uint64_t NTKAssetsBundle()
{
  return MEMORY[0x270F4D900]();
}

uint64_t NTKFaceDataModeDescription()
{
  return MEMORY[0x270F4D988]();
}

uint64_t NTKHourMinuteSecondAnglesForTime()
{
  return MEMORY[0x270F4D9B8]();
}

uint64_t NTKIdealizedDate()
{
  return MEMORY[0x270F4D9C0]();
}

uint64_t NTKIsScreenOn()
{
  return MEMORY[0x270F4DA08]();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return MEMORY[0x270F4DA30]();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return MEMORY[0x270F4DA90]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _EnumValueRange()
{
  return MEMORY[0x270F4DAD8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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