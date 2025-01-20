uint64_t sub_24671E8C0()
{
  return sub_2467293C0();
}

uint64_t sub_24671E8DC()
{
  v1 = *(void **)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  id v4 = v1;
  sub_24671EF7C(v2);

  return MEMORY[0x270F80710](v4, v2, v3);
}

uint64_t sub_24671E940()
{
  return swift_getOpaqueTypeMetadata2();
}

uint64_t sub_24671E9D4()
{
  return swift_getOpaqueTypeConformance2();
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

unint64_t sub_24671EAA8()
{
  unint64_t result = qword_268F9DAE8;
  if (!qword_268F9DAE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9DAD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DAE8);
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

unint64_t sub_24671EB4C()
{
  unint64_t result = qword_268F9DAF0;
  if (!qword_268F9DAF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9DAE0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9DAF8);
    sub_24671EBFC();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DAF0);
  }
  return result;
}

unint64_t sub_24671EBFC()
{
  unint64_t result = qword_268F9DB00;
  if (!qword_268F9DB00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9DAF8);
    sub_24671EC78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DB00);
  }
  return result;
}

unint64_t sub_24671EC78()
{
  unint64_t result = qword_268F9DB08;
  if (!qword_268F9DB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DB08);
  }
  return result;
}

void destroy for DownloadsHostingView(uint64_t a1)
{
  if (*(void *)(a1 + 8))
  {
    swift_release();
  }
}

void *_s20_Translation_SwiftUI20DownloadsHostingViewVwCP_0(void *a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  *a1 = *(void *)a2;
  v5 = a1 + 1;
  v7 = (_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 8);
  id v8 = v4;
  if (v6)
  {
    uint64_t v9 = *(void *)(a2 + 16);
    a1[1] = v6;
    a1[2] = v9;
    swift_retain();
  }
  else
  {
    _OWORD *v5 = *v7;
  }
  return a1;
}

uint64_t assignWithCopy for DownloadsHostingView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 8);
  if (!*(void *)(a1 + 8))
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a2 + 16);
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v9;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DownloadsHostingView(uint64_t a1, void *a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[1];
  if (!*(void *)(a1 + 8))
  {
    if (v5)
    {
      uint64_t v7 = a2[2];
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = a2[2];
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DownloadsHostingView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DownloadsHostingView(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DownloadsHostingView()
{
  return &type metadata for DownloadsHostingView;
}

uint64_t sub_24671EF60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24671EF7C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_24671EF90()
{
  unint64_t result = qword_268F9DB10;
  if (!qword_268F9DB10)
  {
    sub_246729170();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DB10);
  }
  return result;
}

uint64_t sub_24671EFE8(uint64_t a1)
{
  return sub_24671F0E4(a1, qword_268F9E180);
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

uint64_t sub_24671F0A0(uint64_t a1)
{
  return sub_24671F0E4(a1, qword_268F9E198);
}

uint64_t sub_24671F0C0(uint64_t a1)
{
  return sub_24671F0E4(a1, qword_268F9E1B0);
}

uint64_t sub_24671F0E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2467291B0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2467291A0();
}

uint64_t initializeBufferWithCopyOfBuffer for SystemTranslationView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SystemTranslationView(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for SystemTranslationView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  return a1;
}

void *assignWithCopy for SystemTranslationView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  if (!a1[2])
  {
    if (v4)
    {
      uint64_t v6 = a2[3];
      a1[2] = v4;
      a1[3] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[3];
  a1[2] = v4;
  a1[3] = v5;
  swift_retain();
  swift_release();
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

void *assignWithTake for SystemTranslationView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[2];
  if (!a1[2])
  {
    if (v5)
    {
      uint64_t v7 = a2[3];
      a1[2] = v5;
      a1[3] = v7;
      return a1;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemTranslationView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemTranslationView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemTranslationView()
{
  return &type metadata for SystemTranslationView;
}

id sub_24671F420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F80CF8]), sel_initWithNibName_bundle_, 0, 0);
  id v8 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_246729480();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithString_, v9);

  objc_msgSend(v7, sel_setText_, v10);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F80CF0]), sel_init);
  objc_msgSend(v11, sel_setOrigin_, 2);
  objc_msgSend(v7, sel_setSourceMeta_, v11);
  if (a4)
  {
    swift_retain();
    objc_msgSend(v7, sel_setIsSourceEditable_, 1);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a4;
    *(void *)(v12 + 24) = a5;
    v15[4] = sub_24671F9C4;
    v15[5] = v12;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 1107296256;
    v15[2] = sub_24671F754;
    v15[3] = &block_descriptor;
    v13 = _Block_copy(v15);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_setReplacementHandler_, v13);

    _Block_release(v13);
    sub_24671F9E4(a4);
  }
  else
  {
  }
  return v7;
}

uint64_t sub_24671F614(void *a1, void (*a2)(uint64_t, uint64_t))
{
  if (qword_268F9DAD0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2467291B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_268F9E1B0);
  uint64_t v5 = sub_246729190();
  os_log_type_t v6 = sub_246729540();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_24671C000, v5, v6, "Replacement action invoked through API", v7, 2u);
    MEMORY[0x24C5370E0](v7, -1, -1);
  }

  id v8 = objc_msgSend(a1, sel_string);
  uint64_t v9 = sub_246729490();
  uint64_t v11 = v10;

  a2(v9, v11);

  return swift_bridgeObjectRelease();
}

void sub_24671F754(uint64_t a1, void *a2)
{
  long long v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_24671F7BC(uint64_t a1)
{
  return sub_24671F420(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_24671F7D8()
{
  return sub_2467292D0();
}

unint64_t sub_24671F814(uint64_t a1)
{
  unint64_t result = sub_24671F83C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24671F83C()
{
  unint64_t result = qword_268F9DB18;
  if (!qword_268F9DB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DB18);
  }
  return result;
}

uint64_t sub_24671F890()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_24671F89C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24671F83C();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_24671F900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24671F83C();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_24671F964()
{
}

uint64_t sub_24671F98C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24671F9C4(void *a1)
{
  return sub_24671F614(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_24671F9E4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24671F9F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DB38);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v10 = (uint64_t *)(a1 + *(int *)(type metadata accessor for SystemTranslationViewModifier() + 32));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  swift_bridgeObjectRetain();
  sub_24671EF7C(v11);
  uint64_t v13 = sub_246729450();
  sub_24671FCF4(0.0, 1, 320.0, 0, 0.0, 1, 0.0, 1, (uint64_t)v20, 480.0, 0, 0.0, 1, v13, v14, v9, v8, v11, v12);
  swift_bridgeObjectRelease();
  sub_24671F9E4(v11);
  v19[6] = v20[6];
  v19[7] = v20[7];
  v19[8] = v20[8];
  v19[2] = v20[2];
  v19[3] = v20[3];
  v19[4] = v20[4];
  v19[5] = v20[5];
  v19[0] = v20[0];
  v19[1] = v20[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DB40);
  sub_246729280();
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_246729D50;
  sub_246729270();
  sub_246729260();
  sub_246720EDC(v15);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DAF8);
  sub_24671EBFC();
  sub_2467293D0();
  swift_bridgeObjectRelease();
  sub_2467211F4((uint64_t)v20);
  uint64_t v16 = sub_246729200();
  LOBYTE(v8) = sub_246729360();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(a2, v7, v4);
  uint64_t v17 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F9DAE0) + 36);
  *(void *)uint64_t v17 = v16;
  *(unsigned char *)(v17 + 8) = v8;
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_24671FCF4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v20 = a18;
  uint64_t v21 = a19;
  uint64_t v22 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_246729530();
    v31 = (void *)sub_246729340();
    sub_246729180();

    uint64_t v22 = a16;
    uint64_t v21 = a19;
    uint64_t v20 = a18;
  }
  sub_246729210();
  *(void *)a9 = v22;
  *(void *)(a9 + 8) = a17;
  *(void *)(a9 + 16) = v20;
  *(void *)(a9 + 24) = v21;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v36;
  swift_bridgeObjectRetain();

  return sub_24671EF7C(v20);
}

uint64_t sub_24671FEE4()
{
  return sub_2467291E0();
}

uint64_t sub_24671FF00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v15[1] = a3;
  v15[2] = a1;
  uint64_t v4 = a2 - 8;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = sub_2467292A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = *(void *)v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, &v3[*(int *)(v4 + 32)], v7);
  uint64_t v11 = v3[*(int *)(v4 + 36)];
  sub_246720C88((uint64_t)v3, (uint64_t)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  sub_246720E08((uint64_t)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  MEMORY[0x24C536A00](v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DAD8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DAE0);
  sub_24671EAA8();
  sub_24671EB4C();
  sub_2467293B0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t View.translationPresentation(isPresented:text:attachmentAnchor:arrowEdge:replacementAction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v27 = a7;
  uint64_t v26 = a4;
  uint64_t v29 = a9;
  uint64_t v30 = a12;
  uint64_t v28 = a11;
  uint64_t v18 = type metadata accessor for SystemTranslationViewModifier();
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = &v21[*(int *)(v19 + 24)];
  uint64_t v23 = sub_2467292A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v22, a6, v23);
  *(void *)uint64_t v21 = a1;
  *((void *)v21 + 1) = a2;
  v21[16] = a3;
  *((void *)v21 + 3) = v26;
  *((void *)v21 + 4) = a5;
  v21[*(int *)(v18 + 28)] = v27;
  v24 = (uint64_t *)&v21[*(int *)(v18 + 32)];
  uint64_t *v24 = a8;
  v24[1] = a10;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24671EF7C(a8);
  MEMORY[0x24C536A80](v21, v28, v18, v30);
  return sub_246720300((uint64_t)v21);
}

uint64_t type metadata accessor for SystemTranslationViewModifier()
{
  uint64_t result = qword_268F9DB28;
  if (!qword_268F9DB28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246720300(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SystemTranslationViewModifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24672035C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2467203F8(uint64_t a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    uint64_t v9 = a3[6];
    uint64_t v18 = a1 + v9;
    uint64_t v10 = (uint64_t)a2 + v9;
    uint64_t v11 = sub_2467292A0();
    unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v12(v18, v10, v11);
    uint64_t v13 = a3[8];
    *(unsigned char *)(v7 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    uint64_t v14 = (void *)(v7 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    if (*v15)
    {
      uint64_t v16 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v16;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
  }
  return v7;
}

uint64_t sub_246720554(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_2467292A0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  if (*(void *)(a1 + *(int *)(a2 + 32)))
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_24672060C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = a3[6];
  uint64_t v17 = a1 + v8;
  uint64_t v9 = a2 + v8;
  uint64_t v10 = sub_2467292A0();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v11(v17, v9, v10);
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  if (*v14)
  {
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  }
  return a1;
}

uint64_t sub_246720714(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_2467292A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v13 = *(void *)(a1 + v10);
  uint64_t v14 = *v12;
  if (!v13)
  {
    if (v14)
    {
      uint64_t v16 = v12[1];
      *uint64_t v11 = v14;
      v11[1] = v16;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v15 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v15;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_246720858(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_2467292A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v13 = *v12;
  if (*v12)
  {
    uint64_t v14 = v12[1];
    *uint64_t v11 = v13;
    v11[1] = v14;
  }
  else
  {
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  }
  return a1;
}

uint64_t sub_246720924(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2467292A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  if (!*(void *)(a1 + v11))
  {
    if (v14)
    {
      uint64_t v16 = v13[1];
      *uint64_t v12 = v14;
      v12[1] = v16;
      return a1;
    }
LABEL_7:
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v15 = v13[1];
  *uint64_t v12 = v14;
  v12[1] = v15;
  swift_release();
  return a1;
}

uint64_t sub_246720A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246720A4C);
}

uint64_t sub_246720A4C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_2467292A0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_246720AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246720B10);
}

uint64_t sub_246720B10(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2467292A0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_246720BB8()
{
  uint64_t result = sub_2467292A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_246720C6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246720C88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SystemTranslationViewModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246720CEC()
{
  unint64_t v1 = (int *)(type metadata accessor for SystemTranslationViewModifier() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[8];
  uint64_t v6 = sub_2467292A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  if (*(void *)(v0 + v3 + v1[10])) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_246720E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SystemTranslationViewModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246720E6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for SystemTranslationViewModifier() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24671F9F4(v4, a1);
}

uint64_t sub_246720EDC(uint64_t a1)
{
  uint64_t v2 = sub_246729280();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  long long v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DB48);
    uint64_t v9 = sub_246729570();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    long long v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_246721238(&qword_268F9DB50, MEMORY[0x263F19830]);
      uint64_t v16 = sub_246729460();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_246721238(&qword_268F9DB58, MEMORY[0x263F19830]);
          char v23 = sub_246729470();
          v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_2467211F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRelease();
  sub_24671F9E4(v2);
  return a1;
}

uint64_t sub_246721238(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246721280()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246721300()
{
  return swift_retain();
}

uint64_t sub_24672137C(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__translationSession) = a2;
  swift_retain();
  return swift_release();
}

void *sub_2467213C0()
{
  swift_getKeyPath();
  sub_246721E88();
  sub_2467290C0();
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration);
  id v2 = v1;
  return v1;
}

void sub_246721440(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration);
  *(void *)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration) = a2;
  id v3 = a2;
}

uint64_t sub_24672147C()
{
  swift_getKeyPath();
  sub_246721E88();
  sub_2467290C0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  sub_24671EF7C(v1);
  return v1;
}

uint64_t sub_24672150C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  *id v3 = a2;
  v3[1] = a3;
  sub_24671EF7C(a2);
  return sub_24671F9E4(v4);
}

id sub_246721564(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration] = 0;
  id v3 = &v1[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = v1;
  sub_2467290D0();
  *(void *)&v4[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__translationSession] = a1;
  swift_retain();

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for TranslationSessionViewModel();
  id v5 = objc_msgSendSuper2(&v9, sel_init);
  swift_getKeyPath();
  sub_246721E88();
  id v6 = v5;
  sub_2467290C0();
  swift_release();
  id v7 = v6;
  swift_retain();
  sub_2467290F0();
  swift_release();

  swift_release();
  return v7;
}

void sub_246721688(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v32 = a2;
  if (a1)
  {
    uint64_t v6 = qword_268F9DAC0;
    id v7 = a2;
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2467291B0();
    __swift_project_value_buffer(v8, (uint64_t)qword_268F9E180);
    id v9 = a1;
    uint64_t v10 = sub_246729190();
    os_log_type_t v11 = sub_246729540();
    if (!os_log_type_enabled(v10, v11))
    {

      goto LABEL_16;
    }
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138543362;
    id v14 = v9;
    sub_246729560();
    void *v13 = a1;

    _os_log_impl(&dword_24671C000, v10, v11, "User finished remote UI and provided completed configuration: %{public}@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F9DC00);
    swift_arrayDestroy();
    MEMORY[0x24C5370E0](v13, -1, -1);
    uint64_t v15 = v12;
    goto LABEL_14;
  }
  if (a2)
  {
    id v16 = a2;
  }
  else
  {
    sub_246729490();
    id v17 = objc_allocWithZone(MEMORY[0x263F087E8]);
    unint64_t v18 = (void *)sub_246729480();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 20, 0);
  }
  uint64_t v32 = v16;
  uint64_t v19 = qword_268F9DAC0;
  id v20 = a2;
  id v21 = v16;
  if (v19 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_2467291B0();
  __swift_project_value_buffer(v22, (uint64_t)qword_268F9E180);
  id v23 = v21;
  uint64_t v10 = sub_246729190();
  os_log_type_t v24 = sub_246729520();
  if (os_log_type_enabled(v10, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v31 = (void *)swift_slowAlloc();
    *(_DWORD *)v25 = 138412290;
    id v26 = v23;
    sub_246729560();
    void *v31 = v16;

    _os_log_impl(&dword_24671C000, v10, v24, "Reported that remote UI finished but didn't get finished configuration, reporting the error as: %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F9DC00);
    swift_arrayDestroy();
    MEMORY[0x24C5370E0](v31, -1, -1);
    uint64_t v15 = v25;
LABEL_14:
    MEMORY[0x24C5370E0](v15, -1, -1);

    goto LABEL_16;
  }

LABEL_16:
  swift_getKeyPath();
  sub_246721E88();
  sub_2467290C0();
  swift_release();
  uint64_t v27 = *(void (**)(void *, void *))(v3
                                              + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  if (v27)
  {
    swift_beginAccess();
    sub_24671EF7C((uint64_t)v27);
    id v28 = v32;
    v27(a1, v32);
    sub_24671F9E4((uint64_t)v27);
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_2467290B0();
  swift_release();
  uint64_t v30 = swift_getKeyPath();
  MEMORY[0x270FA5388](v30);
  sub_2467290B0();
  swift_release();
}

id sub_246721BE4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TranslationSessionViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246721CC0()
{
  return type metadata accessor for TranslationSessionViewModel();
}

uint64_t type metadata accessor for TranslationSessionViewModel()
{
  uint64_t result = qword_268F9DB88;
  if (!qword_268F9DB88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246721D14()
{
  uint64_t result = sub_2467290E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_246721E88()
{
  unint64_t result = qword_268F9DBF8;
  if (!qword_268F9DBF8)
  {
    type metadata accessor for TranslationSessionViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DBF8);
  }
  return result;
}

void sub_246721EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_2467290A0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_246721F50()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_246721F88(uint64_t a1, uint64_t a2)
{
  sub_246721EE0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_246721F90(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_268F9DAC0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2467291B0();
  __swift_project_value_buffer(v5, (uint64_t)qword_268F9E180);
  id v6 = a1;
  id v7 = sub_246729190();
  os_log_type_t v8 = sub_246729540();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    id v16 = (void *)swift_slowAlloc();
    *(_DWORD *)id v9 = 138543362;
    id v10 = v6;
    sub_246729560();
    *id v16 = v6;

    _os_log_impl(&dword_24671C000, v7, v8, "Text session reported that it needs user action; will present UI with configuration: %{public}@",
      v9,
      0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F9DC00);
    swift_arrayDestroy();
    MEMORY[0x24C5370E0](v16, -1, -1);
    MEMORY[0x24C5370E0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_246721E88();
  id v12 = v6;
  sub_2467290B0();
  swift_release();

  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  uint64_t v14 = swift_getKeyPath();
  MEMORY[0x270FA5388](v14);
  swift_retain();
  sub_2467290B0();
  swift_release();
  return swift_release();
}

void sub_2467222B0()
{
}

uint64_t sub_2467222C8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246722300()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_246722330()
{
  return sub_246722348();
}

uint64_t sub_246722348()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  uint64_t v4 = *v3;
  *uint64_t v3 = v1;
  v3[1] = v2;
  sub_24671EF7C(v1);
  return sub_24671F9E4(v4);
}

void sub_2467223A0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration);
  *(void *)(v1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration) = v2;
  id v4 = v2;
}

uint64_t sub_2467223E0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for _TranslationSwiftUIBundleObject()
{
  return self;
}

uint64_t View.translationTask(_:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a5;
  uint64_t v22 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  os_log_type_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v22 - v12;
  uint64_t v14 = (int *)type metadata accessor for TranslationTaskModifier();
  MEMORY[0x270FA5388](v14);
  id v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246722BF4(a1, (uint64_t)v16, &qword_268F9DC70);
  id v17 = &v16[v14[5]];
  *(void *)id v17 = a2;
  *((void *)v17 + 1) = a3;
  uint64_t v18 = sub_246729120();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v13, 1, 1, v18);
  sub_246722BF4((uint64_t)v13, (uint64_t)v11, &qword_268F9DC70);
  swift_retain();
  sub_246729410();
  sub_246722644((uint64_t)v13);
  uint64_t v19 = v14[7];
  uint64_t v24 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC78);
  sub_246729410();
  *(_OWORD *)&v16[v19] = v25;
  id v20 = (uint64_t *)&v16[v14[8]];
  *id v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
  swift_storeEnumTagMultiPayload();
  MEMORY[0x24C536A80](v16, v22, v14, v23);
  return sub_246722AD4((uint64_t)v16);
}

uint64_t sub_246722644(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t View.translationTask(source:target:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v37 = a6;
  uint64_t v35 = a7;
  uint64_t v36 = a5;
  uint64_t v33 = a3;
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
  uint64_t v8 = MEMORY[0x270FA5388](v34);
  uint64_t v32 = (uint64_t)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v11 = (char *)&v30 - v10;
  uint64_t v12 = (int *)type metadata accessor for TranslationTaskModifier();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC88);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  id v20 = (char *)&v30 - v19;
  uint64_t v21 = sub_246729120();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v30 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246722BF4(v30, (uint64_t)v20, &qword_268F9DC88);
  sub_246722BF4(v31, (uint64_t)v18, &qword_268F9DC88);
  sub_246729110();
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v14, v24, v21);
  long long v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  v25(v14, 0, 1, v21);
  id v26 = &v14[v12[5]];
  *(void *)id v26 = v33;
  *((void *)v26 + 1) = a4;
  v25(v11, 1, 1, v21);
  sub_246722BF4((uint64_t)v11, v32, &qword_268F9DC70);
  swift_retain();
  sub_246729410();
  sub_246722644((uint64_t)v11);
  uint64_t v27 = v12[7];
  uint64_t v38 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC78);
  sub_246729410();
  *(_OWORD *)&v14[v27] = v39;
  id v28 = (uint64_t *)&v14[v12[8]];
  *id v28 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
  swift_storeEnumTagMultiPayload();
  MEMORY[0x24C536A80](v14, v36, v12, v37);
  sub_246722AD4((uint64_t)v14);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
}

uint64_t sub_246722A18()
{
  return sub_246729220();
}

uint64_t sub_246722A3C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC98);
  MEMORY[0x270FA5388](v2 - 8);
  sub_246722BF4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_268F9DC98);
  return sub_246729230();
}

uint64_t sub_246722AD4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TranslationTaskModifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246722B30()
{
  return swift_getWitnessTable();
}

unint64_t sub_246722B9C()
{
  unint64_t result = qword_268F9DC90;
  if (!qword_268F9DC90)
  {
    type metadata accessor for TranslationTaskModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DC90);
  }
  return result;
}

uint64_t sub_246722BF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *sub_246722C58(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_246729120();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = a3[5];
    uint64_t v13 = a3[6];
    uint64_t v14 = (uint64_t *)((char *)a1 + v12);
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = (char *)a1 + v13;
    uint64_t v18 = (char *)a2 + v13;
    swift_retain();
    if (v9((uint64_t *)v18, 1, v7))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v17, v18, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v17, 0, 1, v7);
    }
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
    *(void *)&v17[*(int *)(v20 + 28)] = *(void *)&v18[*(int *)(v20 + 28)];
    uint64_t v21 = a3[7];
    uint64_t v22 = a3[8];
    uint64_t v23 = (uint64_t *)((char *)a1 + v21);
    uint64_t v24 = (char *)a2 + v21;
    id v26 = *(void **)v24;
    uint64_t v25 = *((void *)v24 + 1);
    *uint64_t v23 = *(void *)v24;
    v23[1] = v25;
    uint64_t v27 = (uint64_t *)((char *)a1 + v22);
    id v28 = (uint64_t *)((char *)a2 + v22);
    swift_retain();
    id v29 = v26;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = sub_246729290();
      uint64_t v31 = *(void *)(v30 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v31 + 48))(v28, 1, v30))
      {
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC98);
        memcpy(v27, v28, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v31 + 16))(v27, v28, v30);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v27, 0, 1, v30);
      }
    }
    else
    {
      *uint64_t v27 = *v28;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_246722FF8(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_246729120();
  uint64_t v5 = *(void *)(v4 - 8);
  id v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  swift_release();
  uint64_t v7 = a1 + a2[6];
  if (!v6(v7, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
  swift_release();

  swift_release();
  uint64_t v8 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_246729290();
    uint64_t v12 = *(void *)(v9 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, 1, v9);
    if (!result)
    {
      uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
      return v11(v8, v9);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

char *sub_246723250(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_246729120();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  uint64_t v14 = *((void *)v13 + 1);
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = v14;
  uint64_t v15 = &a1[v11];
  uint64_t v16 = &a2[v11];
  swift_retain();
  if (v8(v16, 1, v6))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v15, v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
  *(void *)&v15[*(int *)(v18 + 28)] = *(void *)&v16[*(int *)(v18 + 28)];
  uint64_t v19 = a3[7];
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v19];
  uint64_t v22 = &a2[v19];
  uint64_t v24 = *(void **)v22;
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)uint64_t v21 = *(void *)v22;
  *((void *)v21 + 1) = v23;
  uint64_t v25 = &a1[v20];
  id v26 = &a2[v20];
  swift_retain();
  id v27 = v24;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = sub_246729290();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v26, 1, v28))
    {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC98);
      memcpy(v25, v26, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v25, v26, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v25, 0, 1, v28);
    }
  }
  else
  {
    *(void *)uint64_t v25 = *(void *)v26;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_2467235A0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_246729120();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  swift_retain();
  swift_release();
  uint64_t v16 = a3[6];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  int v19 = v8(&a1[v16], 1, v6);
  int v20 = v8(v18, 1, v6);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v17, v18, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v17, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v17, v6);
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v17, v18, v6);
LABEL_13:
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
  *(void *)&v17[*(int *)(v22 + 28)] = *(void *)&v18[*(int *)(v22 + 28)];
  swift_retain();
  swift_release();
  uint64_t v23 = a3[7];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  id v26 = *(void **)&a1[v23];
  id v27 = *(void **)&a2[v23];
  *(void *)uint64_t v24 = v27;
  id v28 = v27;

  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v29 = a3[8];
    uint64_t v30 = &a1[v29];
    uint64_t v31 = &a2[v29];
    sub_2467289E0((uint64_t)&a1[v29], &qword_268F9DC80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = sub_246729290();
      uint64_t v33 = *(void *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
      {
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC98);
        memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      }
    }
    else
    {
      *(void *)uint64_t v30 = *(void *)v31;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_2467239FC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_246729120();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
  *(void *)&v11[*(int *)(v14 + 28)] = *(void *)&v12[*(int *)(v14 + 28)];
  uint64_t v15 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_246729290();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v17, 1, v19))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC98);
      memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v16, v17, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v16, 0, 1, v19);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  return a1;
}

char *sub_246723D30(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_246729120();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  swift_release();
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
LABEL_13:
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
  *(void *)&v13[*(int *)(v18 + 28)] = *(void *)&v14[*(int *)(v18 + 28)];
  swift_release();
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = *(void **)&a1[v19];
  *(void *)uint64_t v20 = *(void *)v21;

  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v23 = a3[8];
    uint64_t v24 = &a1[v23];
    uint64_t v25 = &a2[v23];
    sub_2467289E0((uint64_t)&a1[v23], &qword_268F9DC80);
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_246729290();
      uint64_t v28 = *(void *)(v27 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v25, 1, v27))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC98);
        memcpy(v24, v25, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v24, v25, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v24, 0, 1, v27);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_246724174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246724188);
}

uint64_t sub_246724188(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5]);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[6];
      int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA8);
    int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[8];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_246724314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246724328);
}

uint64_t sub_246724328(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5]) = (a2 - 1);
    return result;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[6];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA8);
  int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[8];

  return v16(v18, a2, a2, v17);
}

uint64_t type metadata accessor for TranslationTaskModifier()
{
  uint64_t result = qword_268F9DCB0;
  if (!qword_268F9DCB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_246724500()
{
  sub_246724660();
  if (v0 <= 0x3F)
  {
    sub_2467246B8(319, &qword_268F9DCC8, &qword_268F9DC70, MEMORY[0x263F1B5D0]);
    if (v1 <= 0x3F)
    {
      sub_2467246B8(319, &qword_268F9DCD0, &qword_268F9DC98, MEMORY[0x263F185C8]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_246724660()
{
  if (!qword_268F9DCC0)
  {
    sub_246729120();
    unint64_t v0 = sub_246729550();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F9DCC0);
    }
  }
}

void sub_2467246B8(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_246724718()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246724734@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
  sub_2467290C0();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__translationSession);
  return swift_retain();
}

uint64_t sub_2467247E8()
{
  return swift_release();
}

id sub_2467248C8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
  sub_2467290C0();
  swift_release();
  uint64_t v4 = *(void **)(v3 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration);
  *a2 = v4;

  return v4;
}

void sub_246724988(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
  id v2 = v1;
  sub_2467290B0();
  swift_release();
}

uint64_t sub_246724A64@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
  sub_2467290C0();
  swift_release();
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion + 8);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_24672898C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_24671EF7C(v4);
}

uint64_t sub_246724B5C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = v1;
    uint64_t v4 = sub_246728950;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24671EF7C(v2);
  sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
  sub_2467290B0();
  sub_24671F9E4((uint64_t)v4);
  return swift_release();
}

uint64_t sub_246724CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v49 = a2;
  uint64_t v3 = sub_2467294F0();
  uint64_t v46 = *(void *)(v3 - 8);
  uint64_t v47 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TranslationTaskModifier();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = v8;
  uint64_t v45 = v8;
  uint64_t v10 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCD8);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCE0);
  MEMORY[0x270FA5388](v51);
  uint64_t v42 = v2;
  uint64_t v43 = (uint64_t)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246722BF4(v2, (uint64_t)v13, &qword_268F9DC70);
  sub_2467273D4(v2, (uint64_t)v10);
  uint64_t v19 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v50 = ((v19 + 16) & ~v19) + v9;
  uint64_t v20 = (v19 + 16) & ~v19;
  uint64_t v41 = v19 | 7;
  uint64_t v21 = swift_allocObject();
  uint64_t v44 = v20;
  sub_24672743C((uint64_t)v10, v21 + v20);
  uint64_t v22 = v5;
  sub_2467294E0();
  uint64_t v23 = &v17[*(int *)(v15 + 44)];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCF8);
  sub_246722BF4((uint64_t)v13, (uint64_t)&v23[*(int *)(v24 + 40)], &qword_268F9DC70);
  uint64_t v25 = &v23[*(int *)(v24 + 36)];
  uint64_t v27 = v46;
  uint64_t v26 = v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v25, v22, v47);
  *(void *)uint64_t v23 = &unk_268F9DCF0;
  *((void *)v23 + 1) = v21;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD00);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v17, v48, v28);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v26);
  sub_2467289E0((uint64_t)v13, &qword_268F9DC70);
  uint64_t v29 = v42;
  sub_2467273D4(v42, (uint64_t)v10);
  uint64_t v30 = swift_allocObject();
  sub_24672743C((uint64_t)v10, v30 + v20);
  uint64_t v31 = v43;
  sub_246722BF4((uint64_t)v17, v43, &qword_268F9DCD8);
  uint64_t v32 = (void *)(v31 + *(int *)(v51 + 36));
  *uint64_t v32 = 0;
  v32[1] = 0;
  v32[2] = sub_246727664;
  v32[3] = v30;
  sub_2467289E0((uint64_t)v17, &qword_268F9DCD8);
  sub_2467273D4(v29, (uint64_t)v10);
  sub_2467294D0();
  uint64_t v33 = sub_2467294C0();
  uint64_t v34 = (v19 + 32) & ~v19;
  uint64_t v35 = swift_allocObject();
  uint64_t v36 = MEMORY[0x263F8F500];
  *(void *)(v35 + 16) = v33;
  *(void *)(v35 + 24) = v36;
  sub_24672743C((uint64_t)v10, v35 + v34);
  sub_2467273D4(v29, (uint64_t)v10);
  uint64_t v37 = sub_2467294C0();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v37;
  *(void *)(v38 + 24) = v36;
  sub_24672743C((uint64_t)v10, v38 + v34);
  sub_246729440();
  sub_2467273D4(v29, (uint64_t)v10);
  uint64_t v39 = swift_allocObject();
  sub_24672743C((uint64_t)v10, v39 + v44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD08);
  sub_246727AA8();
  sub_246727C2C();
  sub_2467293F0();
  swift_release();
  swift_release();
  swift_release();
  return sub_2467289E0(v31, &qword_268F9DCE0);
}

uint64_t sub_246725244(uint64_t a1)
{
  v1[12] = a1;
  v1[13] = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD80);
  v1[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC70);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  uint64_t v2 = sub_246729120();
  v1[21] = v2;
  v1[22] = *(void *)(v2 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = sub_2467294D0();
  v1[26] = sub_2467294C0();
  uint64_t v4 = sub_2467294B0();
  v1[27] = v4;
  v1[28] = v3;
  return MEMORY[0x270FA2498](sub_2467253F0, v4, v3);
}

uint64_t sub_2467253F0()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = v1 + *(int *)(type metadata accessor for TranslationTaskModifier() + 28);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD60);
  sub_246729420();
  uint64_t v3 = *(void **)(v0 + 64);
  if (v3)
  {
    swift_getKeyPath();
    *(void *)(v0 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v3;
    sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
    sub_2467290C0();
    swift_release();
    swift_retain();

    if (qword_268F9DAC8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2467291B0();
    __swift_project_value_buffer(v4, (uint64_t)qword_268F9E198);
    uint64_t v5 = sub_246729190();
    os_log_type_t v6 = sub_246729510();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24671C000, v5, v6, "Cancelling previous session because a configuration change was triggered", v7, 2u);
      MEMORY[0x24C5370E0](v7, -1, -1);
    }

    sub_246729140();
    uint64_t v8 = *(void **)v2;
    uint64_t v9 = *(void *)(v2 + 8);
    *(void *)(v0 + 16) = *(void *)v2;
    *(void *)(v0 + 24) = v9;
    *(void *)(v0 + 72) = 0;
    swift_retain();
    id v10 = v8;
    sub_246729430();
    swift_release();

    swift_release();
  }
  uint64_t v12 = *(void *)(v0 + 168);
  uint64_t v11 = *(void *)(v0 + 176);
  uint64_t v13 = *(void *)(v0 + 160);
  sub_246722BF4(*(void *)(v0 + 96), v13, &qword_268F9DC70);
  uint64_t v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (v14(v13, 1, v12) == 1)
  {
    uint64_t v15 = *(void *)(v0 + 160);
    swift_release();
    sub_2467289E0(v15, &qword_268F9DC70);
LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
  v69 = (_OWORD *)v2;
  uint64_t v18 = *(void *)(v0 + 192);
  uint64_t v20 = *(void *)(v0 + 168);
  uint64_t v19 = *(void **)(v0 + 176);
  uint64_t v21 = *(void *)(v0 + 152);
  uint64_t v22 = *(void *)(v0 + 144);
  uint64_t v23 = *(void *)(v0 + 112);
  uint64_t v70 = *(void *)(v0 + 104);
  v66 = (void (*)(uint64_t, uint64_t, uint64_t))v19[4];
  v66(v18, *(void *)(v0 + 160), v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
  sub_246729420();
  v68 = (void (*)(uint64_t, uint64_t, uint64_t))v19[2];
  v68(v22, v18, v20);
  v67 = (void (*)(uint64_t, void, uint64_t, uint64_t))v19[7];
  v67(v22, 0, 1, v20);
  uint64_t v24 = v23 + *(int *)(v70 + 48);
  sub_246722BF4(v21, v23, &qword_268F9DC70);
  sub_246722BF4(v22, v24, &qword_268F9DC70);
  unsigned int v25 = v14(v23, 1, v20);
  uint64_t v26 = *(void *)(v0 + 168);
  if (v25 != 1)
  {
    sub_246722BF4(*(void *)(v0 + 112), *(void *)(v0 + 136), &qword_268F9DC70);
    if (v14(v24, 1, v26) != 1)
    {
      uint64_t v32 = *(void *)(v0 + 176);
      uint64_t v33 = *(void *)(v0 + 184);
      uint64_t v34 = *(void *)(v0 + 168);
      uint64_t v36 = *(void *)(v0 + 144);
      uint64_t v35 = *(void *)(v0 + 152);
      uint64_t v37 = *(void *)(v0 + 136);
      uint64_t v38 = *(void *)(v0 + 112);
      v66(v33, v24, v34);
      sub_246728AF0(&qword_268F9DD98, MEMORY[0x263F1C088]);
      char v39 = sub_246729470();
      v40 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      v40(v33, v34);
      sub_2467289E0(v36, &qword_268F9DC70);
      sub_2467289E0(v35, &qword_268F9DC70);
      v40(v37, v34);
      sub_2467289E0(v38, &qword_268F9DC70);
      if ((v39 & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_19;
    }
    uint64_t v29 = *(void *)(v0 + 168);
    uint64_t v28 = *(void *)(v0 + 176);
    uint64_t v30 = *(void *)(v0 + 152);
    uint64_t v31 = *(void *)(v0 + 136);
    sub_2467289E0(*(void *)(v0 + 144), &qword_268F9DC70);
    sub_2467289E0(v30, &qword_268F9DC70);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v31, v29);
LABEL_17:
    sub_2467289E0(*(void *)(v0 + 112), &qword_268F9DD80);
    goto LABEL_25;
  }
  uint64_t v27 = *(void *)(v0 + 152);
  sub_2467289E0(*(void *)(v0 + 144), &qword_268F9DC70);
  sub_2467289E0(v27, &qword_268F9DC70);
  if (v14(v24, 1, v26) != 1) {
    goto LABEL_17;
  }
  sub_2467289E0(*(void *)(v0 + 112), &qword_268F9DC70);
LABEL_19:
  if ((sub_246729100() & 1) == 0)
  {
    swift_release();
    if (qword_268F9DAC8 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_2467291B0();
    __swift_project_value_buffer(v58, (uint64_t)qword_268F9E198);
    v59 = sub_246729190();
    os_log_type_t v60 = sub_246729510();
    BOOL v61 = os_log_type_enabled(v59, v60);
    uint64_t v62 = *(void *)(v0 + 192);
    uint64_t v63 = *(void *)(v0 + 168);
    uint64_t v64 = *(void *)(v0 + 176);
    if (v61)
    {
      v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v65 = 0;
      _os_log_impl(&dword_24671C000, v59, v60, "Not triggering translation on configuration since it hasn't changed; the view is likely reappearing",
        v65,
        2u);
      MEMORY[0x24C5370E0](v65, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v62, v63);
    goto LABEL_9;
  }
  if (qword_268F9DAC8 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_2467291B0();
  __swift_project_value_buffer(v41, (uint64_t)qword_268F9E198);
  uint64_t v42 = sub_246729190();
  os_log_type_t v43 = sub_246729510();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    _os_log_impl(&dword_24671C000, v42, v43, "Configurations are identical but both were created internally, so allowing to change", v44, 2u);
    MEMORY[0x24C5370E0](v44, -1, -1);
  }

LABEL_25:
  uint64_t v45 = *(void *)(v0 + 192);
  uint64_t v46 = *(void *)(v0 + 184);
  uint64_t v47 = *(void *)(v0 + 168);
  uint64_t v48 = *(void *)(v0 + 120);
  uint64_t v49 = *(void *)(v0 + 128);
  uint64_t v50 = *(void *)(v0 + 96);
  v68(v49, v45, v47);
  v67(v49, 0, 1, v47);
  sub_246722BF4(v49, v48, &qword_268F9DC70);
  sub_246729430();
  sub_2467289E0(v49, &qword_268F9DC70);
  sub_246729150();
  v68(v46, v45, v47);
  uint64_t v51 = sub_246729130();
  *(void *)(v0 + 232) = v51;
  id v52 = objc_allocWithZone((Class)type metadata accessor for TranslationSessionViewModel());
  uint64_t v53 = swift_retain();
  id v54 = sub_246721564(v53);
  *(_OWORD *)(v0 + 48) = *v69;
  *(void *)(v0 + 88) = v54;
  sub_246729430();
  uint64_t v55 = swift_task_alloc();
  *(void *)(v0 + 24__isPlatformVersionAtLeast(2, 18, 1, 0) = v55;
  *(void *)(v55 + 16) = v50;
  *(void *)(v55 + 24) = v51;
  uint64_t v56 = swift_task_alloc();
  *(void *)(v0 + 248) = v56;
  *(void *)(v56 + 16) = v50;
  *(void *)(v0 + 256) = sub_2467294C0();
  v57 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v57;
  void *v57 = v0;
  v57[1] = sub_246725D40;
  return MEMORY[0x270FA2338]();
}

uint64_t sub_246725D40()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 224);
  uint64_t v3 = *(void *)(v1 + 216);
  return MEMORY[0x270FA2498](sub_246725EC4, v3, v2);
}

uint64_t sub_246725EC4()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[22];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_246725FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a2;
  v3[3] = a3;
  sub_2467294D0();
  v3[4] = sub_2467294C0();
  uint64_t v5 = sub_2467294B0();
  v3[5] = v5;
  v3[6] = v4;
  return MEMORY[0x270FA2498](sub_246726058, v5, v4);
}

uint64_t sub_246726058()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = (void *)(v1 + *(int *)(type metadata accessor for TranslationTaskModifier() + 20));
  uint64_t v6 = (uint64_t (*)(uint64_t))(*v2 + *(int *)*v2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24672613C;
  uint64_t v4 = v0[3];
  return v6(v4);
}

uint64_t sub_24672613C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return MEMORY[0x270FA2498](sub_24672625C, v3, v2);
}

uint64_t sub_24672625C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2467262C0()
{
  if (qword_268F9DAC8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2467291B0();
  __swift_project_value_buffer(v0, (uint64_t)qword_268F9E198);
  uint64_t v1 = sub_246729190();
  os_log_type_t v2 = sub_246729500();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_24671C000, v1, v2, "Received cancel while performing client 'action', asking session to cancel pending work", v3, 2u);
    MEMORY[0x24C5370E0](v3, -1, -1);
  }

  type metadata accessor for TranslationTaskModifier();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD60);
  uint64_t result = sub_246729420();
  if (v5)
  {
    swift_getKeyPath();
    sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
    sub_2467290C0();
    swift_release();
    swift_retain();

    sub_246729140();
    return swift_release();
  }
  return result;
}

uint64_t sub_246726468(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + *(int *)(type metadata accessor for TranslationTaskModifier() + 28));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD60);
  uint64_t result = sub_246729420();
  if (v9)
  {
    swift_getKeyPath();
    sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
    sub_2467290C0();
    swift_release();
    swift_retain();

    if (qword_268F9DAC8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_2467291B0();
    __swift_project_value_buffer(v3, (uint64_t)qword_268F9E198);
    uint64_t v4 = sub_246729190();
    os_log_type_t v5 = sub_246729510();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      MEMORY[0x24C5370E0](v6, -1, -1);
    }

    sub_246729140();
    uint64_t v7 = *v1;
    swift_retain();
    id v8 = v7;
    sub_246729430();
    swift_release();

    return swift_release();
  }
  return result;
}

uint64_t sub_24672665C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TranslationTaskModifier();
  uint64_t v5 = v4 - 8;
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v39 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD48);
  uint64_t v40 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD58);
  uint64_t v43 = *(void *)(v11 - 8);
  uint64_t v44 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v42 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD40);
  uint64_t v13 = *(void *)(v45 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v45);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v41 = (uint64_t)&v38 - v17;
  long long v46 = *(_OWORD *)(a1 + *(int *)(v5 + 36));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD60);
  sub_246729420();
  uint64_t v18 = v48;
  if (!v48)
  {
    uint64_t v36 = 1;
LABEL_10:
    uint64_t v33 = v45;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a2, v36, 1, v33);
  }
  uint64_t v38 = a2;
  swift_getKeyPath();
  *(void *)&long long v46 = v18;
  sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
  sub_2467290C0();
  swift_release();
  uint64_t v19 = *(void **)&v18[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration];
  id v20 = v19;

  if (!v19)
  {
    uint64_t v36 = 1;
    a2 = v38;
    goto LABEL_10;
  }
  sub_2467273D4(a1, (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v21 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v22 = swift_allocObject();
  sub_24672743C((uint64_t)v7, v22 + v21);
  *(void *)&long long v46 = v20;
  *((void *)&v46 + 1) = sub_246728054;
  uint64_t v47 = v22;
  id v23 = v20;
  sub_246726C7C();
  unint64_t v24 = sub_246727D7C();
  sub_2467293D0();
  swift_release();

  swift_bridgeObjectRelease();
  *(void *)&long long v46 = &type metadata for DownloadsHostingView;
  *((void *)&v46 + 1) = v24;
  swift_getOpaqueTypeConformance2();
  unsigned int v25 = v42;
  sub_2467293E0();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v8);
  unsigned __int8 v26 = sub_246729360();
  char v27 = sub_246729350();
  char v28 = sub_246729370();
  sub_246729370();
  if (sub_246729370() != v26) {
    char v28 = sub_246729370();
  }
  sub_246729370();
  char v29 = sub_246729370();
  a2 = v38;
  if (v29 != v27) {
    char v28 = sub_246729370();
  }
  uint64_t v30 = sub_246729200();

  uint64_t v32 = v43;
  uint64_t v31 = v44;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v16, v25, v44);
  uint64_t v33 = v45;
  uint64_t v34 = &v16[*(int *)(v45 + 36)];
  *(void *)uint64_t v34 = v30;
  v34[8] = v28;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v31);
  uint64_t v35 = v41;
  sub_2467287C0((uint64_t)v16, v41, &qword_268F9DD40);
  sub_2467287C0(v35, a2, &qword_268F9DD40);
  uint64_t v36 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a2, v36, 1, v33);
}

void sub_246726B9C(void *a1, void *a2)
{
  if (a2)
  {
    type metadata accessor for TranslationTaskModifier();
    id v3 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD60);
    sub_246729420();
    if (v5)
    {
      id v3 = v3;
      sub_246721688(0, a2);
    }
  }
  else
  {
    type metadata accessor for TranslationTaskModifier();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD60);
    sub_246729420();
    id v3 = v5;
    if (!v5) {
      return;
    }
    sub_246721688(a1, 0);
  }
}

uint64_t sub_246726C7C()
{
  uint64_t v0 = sub_246729290();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD68);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC98);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v24 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v24 - v15;
  type metadata accessor for TranslationTaskModifier();
  sub_2467280D4((uint64_t)v16);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v14, *MEMORY[0x263F19F00], v0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v14, 0, 1, v0);
  uint64_t v17 = (uint64_t)&v7[*(int *)(v5 + 56)];
  sub_246722BF4((uint64_t)v16, (uint64_t)v7, &qword_268F9DC98);
  sub_246722BF4((uint64_t)v14, v17, &qword_268F9DC98);
  uint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v18((uint64_t)v7, 1, v0) != 1)
  {
    sub_246722BF4((uint64_t)v7, (uint64_t)v11, &qword_268F9DC98);
    if (v18(v17, 1, v0) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v17, v0);
      sub_246728AF0(&qword_268F9DD70, MEMORY[0x263F19F18]);
      char v19 = sub_246729470();
      id v20 = *(void (**)(char *, uint64_t))(v1 + 8);
      v20(v3, v0);
      sub_2467289E0((uint64_t)v14, &qword_268F9DC98);
      sub_2467289E0((uint64_t)v16, &qword_268F9DC98);
      v20(v11, v0);
      sub_2467289E0((uint64_t)v7, &qword_268F9DC98);
      if (v19) {
        goto LABEL_8;
      }
      return MEMORY[0x263F8EE88];
    }
    sub_2467289E0((uint64_t)v14, &qword_268F9DC98);
    sub_2467289E0((uint64_t)v16, &qword_268F9DC98);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v11, v0);
LABEL_6:
    sub_2467289E0((uint64_t)v7, &qword_268F9DD68);
    return MEMORY[0x263F8EE88];
  }
  sub_2467289E0((uint64_t)v14, &qword_268F9DC98);
  sub_2467289E0((uint64_t)v16, &qword_268F9DC98);
  if (v18(v17, 1, v0) != 1) {
    goto LABEL_6;
  }
  sub_2467289E0((uint64_t)v7, &qword_268F9DC98);
LABEL_8:
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DB40);
  sub_246729280();
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_246729D50;
  sub_246729270();
  sub_246729260();
  uint64_t v22 = sub_246720EDC(v21);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v22;
}

void sub_246727144(BOOL *a1@<X8>)
{
  type metadata accessor for TranslationTaskModifier();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD60);
  sub_246729420();
  if (!v4) {
    goto LABEL_5;
  }
  swift_getKeyPath();
  sub_246728AF0((unint64_t *)&qword_268F9DBF8, (void (*)(uint64_t))type metadata accessor for TranslationSessionViewModel);
  sub_2467290C0();
  swift_release();
  if (!*(void *)&v4[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion])
  {

LABEL_5:
    BOOL v3 = 0;
    goto LABEL_6;
  }
  swift_getKeyPath();
  sub_2467290C0();
  swift_release();
  uint64_t v2 = *(void *)&v4[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration];

  BOOL v3 = v2 != 0;
LABEL_6:
  *a1 = v3;
}

void sub_246727288(unsigned char *a1)
{
  if (*a1)
  {
    if (qword_268F9DAC0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2467291B0();
    __swift_project_value_buffer(v1, (uint64_t)qword_268F9E180);
    oslog = sub_246729190();
    os_log_type_t v2 = sub_246729520();
    if (os_log_type_enabled(oslog, v2))
    {
      BOOL v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl(&dword_24671C000, oslog, v2, "Attempted to force present API UI via Binding which isn't supported, not doing anything", v3, 2u);
      MEMORY[0x24C5370E0](v3, -1, -1);
    }
  }
  else
  {
    type metadata accessor for TranslationTaskModifier();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD60);
    sub_246729420();
    if (v5)
    {
      sub_246721688(0, 0);
    }
  }
}

uint64_t sub_2467273D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranslationTaskModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24672743C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranslationTaskModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2467274A0()
{
  uint64_t v2 = *(void *)(type metadata accessor for TranslationTaskModifier() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24672756C;
  return sub_246725244(v3);
}

uint64_t sub_24672756C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_246727664()
{
  uint64_t v1 = *(void *)(type metadata accessor for TranslationTaskModifier() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_246726468(v2);
}

void sub_2467276C8(BOOL *a1@<X8>)
{
  type metadata accessor for TranslationTaskModifier();

  sub_246727144(a1);
}

uint64_t objectdestroy_7Tm()
{
  uint64_t v1 = (int *)type metadata accessor for TranslationTaskModifier();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v13 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v4 = v0 + v3;
  uint64_t v5 = sub_246729120();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  swift_release();
  uint64_t v8 = v4 + v1[6];
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
  swift_release();

  swift_release();
  uint64_t v9 = v4 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_246729290();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v13, v2 | 7);
}

void sub_2467279C0(unsigned char *a1)
{
  type metadata accessor for TranslationTaskModifier();

  sub_246727288(a1);
}

uint64_t sub_246727A38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for TranslationTaskModifier() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24672665C(v4, a1);
}

unint64_t sub_246727AA8()
{
  unint64_t result = qword_268F9DD10;
  if (!qword_268F9DD10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9DCE0);
    sub_246727B24();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DD10);
  }
  return result;
}

unint64_t sub_246727B24()
{
  unint64_t result = qword_268F9DD18;
  if (!qword_268F9DD18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9DCD8);
    sub_246727BE8(&qword_268F9DD20, &qword_268F9DD00);
    sub_246727BE8(&qword_268F9DD28, &qword_268F9DCF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DD18);
  }
  return result;
}

uint64_t sub_246727BE8(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_246727C2C()
{
  unint64_t result = qword_268F9DD30;
  if (!qword_268F9DD30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9DD08);
    sub_246727CA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DD30);
  }
  return result;
}

unint64_t sub_246727CA0()
{
  unint64_t result = qword_268F9DD38;
  if (!qword_268F9DD38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9DD40);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9DD48);
    sub_246727D7C();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DD38);
  }
  return result;
}

unint64_t sub_246727D7C()
{
  unint64_t result = qword_268F9DD50;
  if (!qword_268F9DD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9DD50);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)type metadata accessor for TranslationTaskModifier();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v13 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = sub_246729120();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  swift_release();
  uint64_t v8 = v4 + v1[6];
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DCA0);
  swift_release();

  swift_release();
  uint64_t v9 = v4 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_246729290();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v13, v2 | 7);
}

void sub_246728054(void *a1, void *a2)
{
  type metadata accessor for TranslationTaskModifier();

  sub_246726B9C(a1, a2);
}

uint64_t sub_2467280D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246729250();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DC80);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246722BF4(v2, (uint64_t)v10, &qword_268F9DC80);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_2467287C0((uint64_t)v10, a1, &qword_268F9DC98);
  }
  os_log_type_t v12 = sub_246729530();
  uint64_t v13 = sub_246729340();
  os_log_type_t v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v18[1] = a1;
    uint64_t v17 = v16;
    uint64_t v19 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    v18[2] = sub_246728364(0xD000000000000020, 0x800000024672B0E0, &v19);
    sub_246729560();
    _os_log_impl(&dword_24671C000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5370E0](v17, -1, -1);
    MEMORY[0x24C5370E0](v15, -1, -1);
  }

  sub_246729240();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_246728364(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_246728438(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_246728874((uint64_t)v12, *a3);
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
      sub_246728874((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_246728438(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v1__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_246728538(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_246729590();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_246728538(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2467285D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2467286D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2467286D4((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2467285D0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_24672866C(v2, 0);
      uint64_t result = sub_246729580();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_2467294A0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24672866C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD78);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2467286D4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9DD78);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  os_log_type_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2467287C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
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

uint64_t sub_246728874(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2467288D4()
{
  sub_246721440(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2467288F8()
{
  return sub_24672150C(v0[2], v0[3], v0[4]);
}

uint64_t sub_246728918()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246728950(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_24672898C(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_2467289C4()
{
  return sub_24672137C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2467289E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246728A3C(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24672756C;
  return sub_246725FC0(a1, v5, v4);
}

uint64_t sub_246728AE8()
{
  return sub_2467262C0();
}

uint64_t sub_246728AF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246728B38()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_268F9E170 == -1)
  {
    if (qword_268F9E178) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_268F9E170, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_268F9E178) {
      return _availability_version_check();
    }
  }
  if (qword_268F9E168 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_268F9E168, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_268F9E15C > a3) {
    return 1;
  }
  return dword_268F9E15C >= a3 && dword_268F9E160 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_268F9E178;
  if (qword_268F9E178) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_268F9E178 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            int64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                int64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    size_t v11 = (uint64_t (*)(void))result;
                    uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    char v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        os_log_type_t v12 = (FILE *)result;
                        uint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          char v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x24C536D00](v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              unsigned __int8 v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_268F9E15C, &dword_268F9E160);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2467290A0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2467290B0()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2467290C0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2467290D0()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2467290E0()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2467290F0()
{
  return MEMORY[0x270F05DB0]();
}

uint64_t sub_246729100()
{
  return MEMORY[0x270F05DB8]();
}

uint64_t sub_246729110()
{
  return MEMORY[0x270F05DC0]();
}

uint64_t sub_246729120()
{
  return MEMORY[0x270F05DC8]();
}

uint64_t sub_246729130()
{
  return MEMORY[0x270F05DD0]();
}

uint64_t sub_246729140()
{
  return MEMORY[0x270F05DD8]();
}

uint64_t sub_246729150()
{
  return MEMORY[0x270F05DE0]();
}

uint64_t sub_246729170()
{
  return MEMORY[0x270F80718]();
}

uint64_t sub_246729180()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_246729190()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2467291A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2467291B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2467291C0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_2467291D0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_2467291E0()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_2467291F0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_246729200()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_246729210()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_246729220()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_246729230()
{
  return MEMORY[0x270F00BD0]();
}

uint64_t sub_246729240()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_246729250()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_246729260()
{
  return MEMORY[0x270F012E0]();
}

uint64_t sub_246729270()
{
  return MEMORY[0x270F012F0]();
}

uint64_t sub_246729280()
{
  return MEMORY[0x270F01300]();
}

uint64_t sub_246729290()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_2467292A0()
{
  return MEMORY[0x270F02078]();
}

uint64_t sub_2467292B0()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2467292C0()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2467292D0()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2467292F0()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_246729300()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_246729310()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_246729330()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_246729340()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_246729350()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_246729360()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_246729370()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_246729380()
{
  return MEMORY[0x270F02A98]();
}

uint64_t sub_246729390()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2467293A0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2467293B0()
{
  return MEMORY[0x270F03500]();
}

uint64_t sub_2467293C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2467293D0()
{
  return MEMORY[0x270F03B70]();
}

uint64_t sub_2467293E0()
{
  return MEMORY[0x270F03DE0]();
}

uint64_t sub_2467293F0()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_246729400()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_246729410()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_246729420()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_246729430()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_246729440()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_246729450()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_246729460()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_246729470()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_246729480()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_246729490()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2467294A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2467294B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2467294C0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2467294D0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2467294E0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2467294F0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_246729500()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_246729510()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_246729520()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_246729530()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_246729540()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_246729550()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_246729560()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_246729570()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_246729580()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_246729590()
{
  return MEMORY[0x270F9EB28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
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

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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