id OUTLINED_FUNCTION_3_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;
  uint64_t v27;

  sub_247ADF0C8(v23, v24, v25);
  return a23;
}

uint64_t OUTLINED_FUNCTION_4_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(v4 + 504);
  return __swift_storeEnumTagSinglePayload(v6, 1, 1, a4);
}

__n128 OUTLINED_FUNCTION_6_19()
{
  return *(__n128 *)(v0 + 56);
}

uint64_t OUTLINED_FUNCTION_8_16()
{
  return sub_247CBD878();
}

uint64_t OUTLINED_FUNCTION_9_16()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_11_18()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_14_16(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_247CBEAC8();
}

uint64_t OUTLINED_FUNCTION_16_14(uint64_t a1)
{
  sub_247ADF0F8(a1, v2, v1);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18_15()
{
  sub_247ADF0F8(v1, v0, v2);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_14()
{
  return sub_247CBE7F8();
}

uint64_t OUTLINED_FUNCTION_20_14()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_21_13@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 32) = v1;
  return sub_247CBDDB8();
}

uint64_t OUTLINED_FUNCTION_22_13@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 + 64) = a1;
  *(void *)(v1 + 32) = v2;
  return sub_247CBDDB8();
}

uint64_t OUTLINED_FUNCTION_23_12(uint64_t a1, uint64_t a2)
{
  return sub_247BBF8F4(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_25_14()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_26_10(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, ...)
{
  va_start(va, a18);
  return sub_247B69044(a1, a2, (uint64_t *)va);
}

void OUTLINED_FUNCTION_29_14(float a1)
{
  *uint64_t v1 = a1;
}

id OUTLINED_FUNCTION_30_9()
{
  sub_247ADF0C8(v0, v1, v2);
  return v3;
}

uint64_t OUTLINED_FUNCTION_31_7(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_32_6()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_36_8()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t sub_247C8CD60@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  long long v14 = *a1;
  uint64_t v7 = *((void *)a1 + 2);
  uint64_t v8 = *((void *)a1 + 3);
  *(void *)(a4 + 40) = 0;
  swift_unknownObjectWeakInit();
  *(_OWORD *)a4 = v14;
  *(void *)(a4 + 16) = v7;
  *(void *)(a4 + 24) = v8;
  if (a2
    && (swift_unknownObjectRetain(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA388),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA390),
        (swift_dynamicCast() & 1) != 0))
  {
    if (*((void *)&v16 + 1))
    {
      sub_247AD94B8(&v15, (uint64_t)v18);
      uint64_t v9 = v19;
      uint64_t v10 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      *(void *)(a4 + 40) = v12;
      swift_unknownObjectWeakAssign();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
  }
  else
  {
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
  }
  sub_247B688B4((uint64_t)&v15, &qword_2692AA398);
  *(void *)(a4 + 40) = a3;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void sub_247C8CEC0(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (a1)
  {
    uint64_t v4 = *(void (**)(void))(a3 + 32);
    id v5 = a1;
    v4();
  }
  else
  {
    __swift_storeEnumTagSinglePayload(a4, 1, 1, a2);
  }
}

id sub_247C8CF8C(uint64_t a1)
{
  return IntentValueTypeIdentifiable.lnValue.getter(a1);
}

id sub_247C8CFE8(uint64_t (*a1)(void), SEL *a2)
{
  v14[3] = a1(0);
  __swift_allocate_boxed_opaque_existential_1(v14);
  OUTLINED_FUNCTION_13_15();
  v3();
  id v4 = [self *a2];
  id v5 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return OUTLINED_FUNCTION_2_32((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12, v14[0]);
}

id sub_247C8D08C(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = MEMORY[0x263F8D310];
  uint64_t v6 = a1;
  uint64_t v7 = a2;
  unsigned __int8 v2 = self;
  swift_bridgeObjectRetain();
  id v3 = objc_msgSend(v2, sel_stringValueType, v6, v7);
  id v4 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_247C8E878(&v6, v3);
}

id sub_247C8D114(char a1)
{
  v4[3] = MEMORY[0x263F8D4F8];
  LOBYTE(v4[0]) = a1;
  id v1 = objc_msgSend(self, sel_BOOLValueType, v4[0]);
  id v2 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_247C8E878(v4, v1);
}

id sub_247C8D188(double a1)
{
  v4[3] = MEMORY[0x263F8D538];
  id v1 = objc_msgSend(self, sel_doubleValueType, *(void *)&a1);
  id v2 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_247C8E878(v4, v1);
}

id sub_247C8D1FC(char a1)
{
  v4[3] = MEMORY[0x263F8E498];
  LOBYTE(v4[0]) = a1;
  id v1 = objc_msgSend(self, sel_int8ValueType, v4[0]);
  id v2 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_247C8E878(v4, v1);
}

id sub_247C8D270(__int16 a1)
{
  v4[3] = MEMORY[0x263F8E4F0];
  LOWORD(v4[0]) = a1;
  id v1 = objc_msgSend(self, sel_int16ValueType, v4[0]);
  id v2 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_247C8E878(v4, v1);
}

id sub_247C8D2E4(int a1)
{
  v4[3] = MEMORY[0x263F8E548];
  LODWORD(v4[0]) = a1;
  id v1 = objc_msgSend(self, sel_int32ValueType, v4[0]);
  id v2 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_247C8E878(v4, v1);
}

id sub_247C8D358(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v3 = [self *a3];
  id v4 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return OUTLINED_FUNCTION_2_32((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11, a1);
}

id IntentValueTypeIdentifiable.lnValue.getter(uint64_t a1)
{
  v13[3] = a1;
  __swift_allocate_boxed_opaque_existential_1(v13);
  OUTLINED_FUNCTION_13_15();
  v1();
  uint64_t v2 = OUTLINED_FUNCTION_3_28();
  v3(v2);
  id v4 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return OUTLINED_FUNCTION_2_32((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11, v13[0]);
}

unint64_t sub_247C8D438(void *a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return (unint64_t)static IntentValueTypeIdentifiable.canConvert(_:)(a1, a2, WitnessTable) & 1;
}

uint64_t sub_247C8D4A4(void *a1, uint64_t a2, SEL *a3, uint64_t a4, unint64_t a5)
{
  if (a1)
  {
    id v9 = a1;
    id v10 = objc_msgSend(v9, sel_valueType);
    char v11 = sub_247C8DAAC(v10, a2, a3, a4, a5);
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

void *static IntentValueTypeIdentifiable.canConvert(_:)(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    id v4 = result;
    id v5 = objc_msgSend(v4, sel_valueType);
    char v6 = (*(uint64_t (**)(void))(*(void *)(a3 + 8) + 16))();

    return (void *)(v6 & 1);
  }
  return result;
}

uint64_t sub_247C8D5B4(void *a1)
{
  return static IntentValueTypeIdentifiable.from(_:context:)(a1);
}

uint64_t sub_247C8D624(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = objc_msgSend(a1, sel_value);
  sub_247CBE4D8();
  swift_unknownObjectRelease();
  a3(0);
  int v5 = OUTLINED_FUNCTION_6_20();
  return OUTLINED_FUNCTION_11_19(v5);
}

uint64_t sub_247C8D6A0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_value);
  sub_247CBE4D8();
  swift_unknownObjectRelease();
  if (swift_dynamicCast()) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_247C8D720(void *a1)
{
  id v1 = objc_msgSend(a1, sel_value);
  sub_247CBE4D8();
  swift_unknownObjectRelease();
  if (swift_dynamicCast()) {
    return v3;
  }
  else {
    return 2;
  }
}

uint64_t sub_247C8D7A0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_value);
  sub_247CBE4D8();
  swift_unknownObjectRelease();
  int v2 = swift_dynamicCast();
  int v3 = v5;
  if (!v2) {
    int v3 = 0;
  }
  return v3 | ((v2 ^ 1u) << 8);
}

uint64_t sub_247C8D824(void *a1)
{
  id v1 = objc_msgSend(a1, sel_value);
  sub_247CBE4D8();
  swift_unknownObjectRelease();
  int v2 = swift_dynamicCast();
  int v3 = v5;
  if (!v2) {
    int v3 = 0;
  }
  return v3 | ((v2 ^ 1u) << 16);
}

unint64_t sub_247C8D8A8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_value);
  sub_247CBE4D8();
  swift_unknownObjectRelease();
  int v2 = swift_dynamicCast();
  uint64_t v3 = v5;
  if (!v2) {
    uint64_t v3 = 0;
  }
  return v3 | ((unint64_t)(v2 ^ 1u) << 32);
}

uint64_t sub_247C8D934(void *a1)
{
  id v1 = objc_msgSend(a1, sel_value);
  sub_247CBE4D8();
  swift_unknownObjectRelease();
  int v2 = swift_dynamicCast();
  uint64_t v3 = v5;
  if (!v2) {
    return 0;
  }
  return v3;
}

uint64_t static IntentValueTypeIdentifiable.from(_:context:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_value);
  sub_247CBE4D8();
  swift_unknownObjectRelease();
  int v2 = OUTLINED_FUNCTION_6_20();
  return OUTLINED_FUNCTION_11_19(v2);
}

uint64_t sub_247C8DA24(void *a1)
{
  return sub_247C8D4A4(a1, 0x263F51C90, (SEL *)&selRef_attributedStringValueType, 0xD000000000000010, 0x8000000247CC3D00) & 1;
}

uint64_t sub_247C8DA68(void *a1)
{
  return sub_247C8DAAC(a1, 0x263F51C90, (SEL *)&selRef_attributedStringValueType, 0xD000000000000010, 0x8000000247CC3D00) & 1;
}

uint64_t sub_247C8DAAC(void *a1, uint64_t a2, SEL *a3, uint64_t a4, unint64_t a5)
{
  sub_247C8C548();
  id v9 = [self *a3];
  char v10 = sub_247CBE438();

  if ((v10 & 1) == 0)
  {
    if (qword_2692A9E28 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_247CBD878();
    __swift_project_value_buffer(v11, (uint64_t)qword_2692C8370);
    id v12 = a1;
    v13 = sub_247CBD858();
    os_log_type_t v14 = sub_247CBE2F8();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 138412546;
      id v16 = v12;
      sub_247CBE488();
      *uint64_t v18 = v12;

      *(_WORD *)(v15 + 12) = 2080;
      sub_247B69044(a4, a5, &v19);
      sub_247CBE488();
      _os_log_impl(&dword_247AC5000, v13, v14, "Cannot convert from %@ to %s", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF20);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_2();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_3_2();
    }
    else
    {
    }
  }
  return v10 & 1;
}

uint64_t static IntentValueTypeIdentifiable.canConvertFrom(_:)(void *a1)
{
  sub_247C8C548();
  uint64_t v2 = OUTLINED_FUNCTION_3_28();
  id v4 = (void *)v3(v2);
  char v5 = sub_247CBE438();

  if ((v5 & 1) == 0)
  {
    if (qword_2692A9E28 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_247CBD878();
    __swift_project_value_buffer(v6, (uint64_t)qword_2692C8370);
    id v7 = a1;
    uint64_t v8 = sub_247CBD858();
    os_log_type_t v9 = sub_247CBE2F8();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412546;
      id v11 = v7;
      sub_247CBE488();
      *uint64_t v15 = v7;

      *(_WORD *)(v10 + 12) = 2080;
      uint64_t v12 = sub_247CBEC28();
      sub_247B69044(v12, v13, &v16);
      sub_247CBE488();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247AC5000, v8, v9, "Cannot convert from %@ to %s", (uint8_t *)v10, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF20);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_2();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_3_2();
    }
    else
    {
    }
  }
  return v5 & 1;
}

id sub_247C8DF48()
{
  return sub_247C8D114(*v0);
}

uint64_t sub_247C8DF50(void *a1)
{
  return sub_247C8D4A4(a1, 0x263F51C90, (SEL *)&selRef_BOOLValueType, 1819242306, 0xE400000000000000) & 1;
}

uint64_t sub_247C8DF88@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_247C8D720(a1);
  *a2 = result;
  return result;
}

uint64_t sub_247C8DFB0(void *a1)
{
  return sub_247C8DAAC(a1, 0x263F51C90, (SEL *)&selRef_BOOLValueType, 1819242306, 0xE400000000000000) & 1;
}

id sub_247C8DFE8(uint64_t a1)
{
  return IntentValueTypeIdentifiable.lnValue.getter(a1);
}

void *sub_247C8DFF4(void *a1, uint64_t a2)
{
  return static IntentValueTypeIdentifiable.canConvert(_:)(a1, a2, (uint64_t)&protocol witness table for CLPlacemark);
}

uint64_t sub_247C8E000(void *a1)
{
  return static IntentValueTypeIdentifiable.from(_:context:)(a1);
}

uint64_t sub_247C8E018(void *a1)
{
  return static IntentValueTypeIdentifiable.canConvertFrom(_:)(a1) & 1;
}

id sub_247C8E03C()
{
  return sub_247C8CFE8(MEMORY[0x263F07490], (SEL *)&selRef_dateValueType);
}

uint64_t sub_247C8E070(void *a1)
{
  return sub_247C8D4A4(a1, 0x263F51C90, (SEL *)&selRef_dateValueType, 1702125892, 0xE400000000000000) & 1;
}

uint64_t sub_247C8E0A8(void *a1, uint64_t a2)
{
  return sub_247C8D624(a1, a2, MEMORY[0x263F07490]);
}

uint64_t sub_247C8E0D4(void *a1)
{
  return sub_247C8DAAC(a1, 0x263F51C90, (SEL *)&selRef_dateValueType, 1702125892, 0xE400000000000000) & 1;
}

id sub_247C8E10C()
{
  return sub_247C8CFE8(MEMORY[0x263F063B0], (SEL *)&selRef_dateComponentsValueType);
}

uint64_t sub_247C8E140()
{
  OUTLINED_FUNCTION_1_29();
  return sub_247C8D4A4(v0, v1, v2, v3, v4) & 1;
}

uint64_t sub_247C8E170(void *a1, uint64_t a2)
{
  return sub_247C8D624(a1, a2, MEMORY[0x263F063B0]);
}

uint64_t sub_247C8E19C()
{
  OUTLINED_FUNCTION_1_29();
  return sub_247C8DAAC(v0, v1, v2, v3, v4) & 1;
}

id sub_247C8E1CC()
{
  return sub_247C8D188(*v0);
}

uint64_t sub_247C8E1D4()
{
  OUTLINED_FUNCTION_12_15();
  return sub_247C8D4A4(v0, v1, v2, v3, v4) & 1;
}

uint64_t sub_247C8E204(void *a1)
{
  uint64_t v1 = sub_247C8D934(a1);
  return OUTLINED_FUNCTION_5_15(v1, v2);
}

uint64_t sub_247C8E234()
{
  OUTLINED_FUNCTION_12_15();
  return sub_247C8DAAC(v0, v1, v2, v3, v4) & 1;
}

id sub_247C8E264()
{
  return sub_247C8D358(*v0, MEMORY[0x263F8D6C8], (SEL *)&selRef_intValueType);
}

uint64_t sub_247C8E290(void *a1)
{
  return sub_247C8D4A4(a1, 0x263F51C90, (SEL *)&selRef_intValueType, 7630409, 0xE300000000000000) & 1;
}

uint64_t sub_247C8E2C8(void *a1)
{
  uint64_t v1 = sub_247C8D934(a1);
  return OUTLINED_FUNCTION_5_15(v1, v2);
}

uint64_t sub_247C8E2F8(void *a1)
{
  return sub_247C8DAAC(a1, 0x263F51C90, (SEL *)&selRef_intValueType, 7630409, 0xE300000000000000) & 1;
}

id sub_247C8E330()
{
  return sub_247C8D1FC(*v0);
}

uint64_t sub_247C8E338(void *a1)
{
  return sub_247C8D4A4(a1, 0x263F51C90, (SEL *)&selRef_int8ValueType, 947154505, 0xE400000000000000) & 1;
}

uint64_t sub_247C8E370@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_247C8D7A0(a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_247C8E3A0(void *a1)
{
  return sub_247C8DAAC(a1, 0x263F51C90, (SEL *)&selRef_int8ValueType, 947154505, 0xE400000000000000) & 1;
}

id sub_247C8E3D8()
{
  return sub_247C8D270(*v0);
}

uint64_t sub_247C8E3E0()
{
  OUTLINED_FUNCTION_9_17();
  return sub_247C8D4A4(v0, v1, v2, v3, v4) & 1;
}

uint64_t sub_247C8E410@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_247C8D824(a1);
  *(_WORD *)a2 = result;
  *(unsigned char *)(a2 + 2) = BYTE2(result) & 1;
  return result;
}

uint64_t sub_247C8E440()
{
  OUTLINED_FUNCTION_9_17();
  return sub_247C8DAAC(v0, v1, v2, v3, v4) & 1;
}

id sub_247C8E470()
{
  return sub_247C8D2E4(*v0);
}

uint64_t sub_247C8E478()
{
  OUTLINED_FUNCTION_8_17();
  return sub_247C8D4A4(v0, v1, v2, v3, v4) & 1;
}

unint64_t sub_247C8E4A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_247C8D8A8(a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_247C8E4D8()
{
  OUTLINED_FUNCTION_8_17();
  return sub_247C8DAAC(v0, v1, v2, v3, v4) & 1;
}

id sub_247C8E508()
{
  return sub_247C8D358(*v0, MEMORY[0x263F8E5C0], (SEL *)&selRef_int64ValueType);
}

uint64_t sub_247C8E534()
{
  OUTLINED_FUNCTION_10_15();
  return sub_247C8D4A4(v0, v1, v2, v3, v4) & 1;
}

uint64_t sub_247C8E564(void *a1)
{
  uint64_t v1 = sub_247C8D934(a1);
  return OUTLINED_FUNCTION_5_15(v1, v2);
}

uint64_t sub_247C8E594()
{
  OUTLINED_FUNCTION_10_15();
  return sub_247C8DAAC(v0, v1, v2, v3, v4) & 1;
}

id sub_247C8E5C4()
{
  return sub_247C8CFE8(MEMORY[0x263F06EA8], (SEL *)&selRef_URLValueType);
}

uint64_t sub_247C8E5F8(void *a1)
{
  return sub_247C8D4A4(a1, 0x263F51C90, (SEL *)&selRef_URLValueType, 5001813, 0xE300000000000000) & 1;
}

uint64_t sub_247C8E630(void *a1, uint64_t a2)
{
  return sub_247C8D624(a1, a2, MEMORY[0x263F06EA8]);
}

uint64_t sub_247C8E65C(void *a1)
{
  return sub_247C8DAAC(a1, 0x263F51C90, (SEL *)&selRef_URLValueType, 5001813, 0xE300000000000000) & 1;
}

id sub_247C8E694()
{
  return sub_247C8D08C(*v0, v0[1]);
}

uint64_t sub_247C8E69C()
{
  OUTLINED_FUNCTION_7_13();
  return sub_247C8D4A4(v0, v1, v2, v3, v4) & 1;
}

uint64_t sub_247C8E6CC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_247C8D6A0(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_247C8E6F4()
{
  OUTLINED_FUNCTION_7_13();
  return sub_247C8DAAC(v0, v1, v2, v3, v4) & 1;
}

uint64_t sub_247C8E724()
{
  OUTLINED_FUNCTION_0_25();
  return sub_247C8D4A4(v0, v1, v2, v3, v4) & 1;
}

uint64_t sub_247C8E754()
{
  OUTLINED_FUNCTION_0_25();
  return sub_247C8DAAC(v0, v1, v2, v3, v4) & 1;
}

uint64_t static LNValue.canConvert(_:)()
{
  return 1;
}

id static LNValue.from(_:context:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_value);
  sub_247CBE4D8();
  swift_unknownObjectRelease();
  id v3 = objc_msgSend(a1, sel_valueType);
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return OUTLINED_FUNCTION_2_32((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11, v13);
}

void *LNValue.lnValue.getter()
{
  id v1 = v0;
  return v0;
}

void *sub_247C8E82C()
{
  return LNValue.lnValue.getter();
}

id sub_247C8E850@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = static LNValue.from(_:context:)(a1);
  *a2 = result;
  return result;
}

id sub_247C8E878(void *a1, void *a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  id v5 = objc_msgSend(v2, sel_initWithValue_valueType_, sub_247CBE988(), a2);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v5;
}

uint64_t dispatch thunk of IntentValue.lnValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static IntentValue.canConvert(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of static IntentValue.from(_:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of IntentValueConversionContext.origin.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static IntentValueTypeIdentifiable.lnValueType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t destroy for _IntentValueConversionContext(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if ((unint64_t)(*(void *)(a1 + 24) - 1) >= 2) {
    swift_bridgeObjectRelease();
  }
  return swift_unknownObjectWeakDestroy();
}

uint64_t initializeWithCopy for _IntentValueConversionContext(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  id v5 = a2 + 2;
  uint64_t v6 = a2[3];
  swift_bridgeObjectRetain();
  if (v6 == 1 || v6 == 2)
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  else
  {
    *(void *)(a1 + 16) = *(void *)v5;
    *(void *)(a1 + 24) = v6;
    swift_bridgeObjectRetain();
  }
  swift_unknownObjectWeakCopyInit();
  *(void *)(a1 + 40) = a2[5];
  return a1;
}

void *assignWithCopy for _IntentValueConversionContext(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1[3];
  uint64_t v5 = a2[3];
  if (v4 == 2)
  {
    if (v5 != 1 && v5 != 2) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if (v5 == 2)
  {
    sub_247B68690((uint64_t)(a1 + 2));
    goto LABEL_12;
  }
  if (v4 != 1)
  {
    if (v5 != 1)
    {
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    sub_247B688B4((uint64_t)(a1 + 2), &qword_2692AB568);
    goto LABEL_12;
  }
  if (v5 == 1)
  {
LABEL_12:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    goto LABEL_13;
  }
LABEL_9:
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
LABEL_13:
  swift_unknownObjectWeakCopyAssign();
  a1[5] = a2[5];
  return a1;
}

uint64_t initializeWithTake for _IntentValueConversionContext(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  swift_unknownObjectWeakTakeInit();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

void *assignWithTake for _IntentValueConversionContext(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2 + 2;
  uint64_t v6 = a1[3];
  if (v6 != 2)
  {
    uint64_t v7 = a2[3];
    if (v7 == 2)
    {
      sub_247B68690((uint64_t)(a1 + 2));
    }
    else if (v6 != 1)
    {
      if (v7 != 1)
      {
        a1[2] = *v5;
        a1[3] = v7;
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      sub_247B688B4((uint64_t)(a1 + 2), &qword_2692AB568);
    }
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v5;
LABEL_8:
  swift_unknownObjectWeakTakeAssign();
  a1[5] = a2[5];
  return a1;
}

ValueMetadata *type metadata accessor for _IntentValueConversionContext()
{
  return &type metadata for _IntentValueConversionContext;
}

id OUTLINED_FUNCTION_2_32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_247C8E878(&a9, v9);
}

uint64_t OUTLINED_FUNCTION_3_28()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_15(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_20()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_11_19(int a1)
{
  return __swift_storeEnumTagSinglePayload(v2, a1 ^ 1u, 1, v1);
}

uint64_t sub_247C8ED9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *))
{
  uint64_t v4 = a1;
  return a3(&v4);
}

uint64_t sub_247C8EDD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_247C8EE00(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247C8EE00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_247C8F480;
  *(void *)(v5 + 24) = v4;
  swift_retain();
  swift_retain();
  uint64_t v6 = sub_247BC1058((uint64_t)sub_247C8F488, v5);
  swift_release();
  swift_release();
  return v6;
}

uint64_t DeviceSessionProviding.onInvalidated(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = *(void (**)(uint64_t (*)(uint64_t, void *), void *, uint64_t, uint64_t))(a4 + 56);
  swift_retain();
  v9(sub_247C8F368, v8, a3, a4);
  return swift_release();
}

uint64_t sub_247C8EF78(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t *))
{
  uint64_t v15 = a1;
  if (qword_2692A9E50 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_247CBD878();
  __swift_project_value_buffer(v5, (uint64_t)qword_2692C83E8);
  id v6 = a2;
  id v7 = a2;
  uint64_t v8 = sub_247CBD858();
  os_log_type_t v9 = sub_247CBE2F8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = a2;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    sub_247CBE488();
    *uint64_t v11 = v14;

    _os_log_impl(&dword_247AC5000, v8, v9, "Not able to handle error because of deprecated call: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF20);
    swift_arrayDestroy();
    MEMORY[0x24C568940](v11, -1, -1);
    MEMORY[0x24C568940](v10, -1, -1);
  }
  else
  {
  }
  return a3(&v15);
}

uint64_t sub_247C8F148(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  if (qword_2692A9E50 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_247CBD878();
  __swift_project_value_buffer(v6, (uint64_t)qword_2692C83E8);
  id v7 = a2;
  id v8 = a2;
  os_log_type_t v9 = sub_247CBD858();
  os_log_type_t v10 = sub_247CBE2F8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    id v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    id v13 = a2;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    sub_247CBE488();
    *id v12 = v15;

    _os_log_impl(&dword_247AC5000, v9, v10, "Not able to handle error because of deprecated call: %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF20);
    swift_arrayDestroy();
    MEMORY[0x24C568940](v12, -1, -1);
    MEMORY[0x24C568940](v11, -1, -1);
  }
  else
  {
  }
  return a3(a1);
}

uint64_t sub_247C8F330()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_247C8F368(uint64_t a1, void *a2)
{
  return sub_247C8F148(a1, a2, *(uint64_t (**)(uint64_t))(v2 + 32));
}

uint64_t dispatch thunk of DeviceSessionProviding.connected.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))() & 1;
}

uint64_t dispatch thunk of DeviceSessionProviding.device.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of DeviceSessionProviding.user.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of DeviceSessionProviding.valid.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DeviceSessionProviding.onConnected(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of DeviceSessionProviding.onDisconnected(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of DeviceSessionProviding.onInvalidated(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t sub_247C8F440(uint64_t *a1, void *a2, uint64_t (*a3)(uint64_t *))
{
  return sub_247C8EF78(*a1, a2, a3);
}

uint64_t sub_247C8F448()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247C8F480(uint64_t *a1, void *a2)
{
  return sub_247C8F440(a1, a2, *(uint64_t (**)(uint64_t *))(v2 + 16));
}

uint64_t sub_247C8F488(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

void sub_247C8F4C4()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = sub_247CBE468();
  OUTLINED_FUNCTION_2_3(v10);
  OUTLINED_FUNCTION_2_12();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_21_14();
  uint64_t v12 = *v0;
  uint64_t v13 = v0[1];
  uint64_t v14 = OUTLINED_FUNCTION_37_7();
  __swift_storeEnumTagSinglePayload(v14, v15, v16, v9);
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = *(void *)(v4 + 24);
  v17[2] = v9;
  v17[3] = v18;
  v17[4] = v2;
  v17[5] = v12;
  v17[6] = v13;
  v17[7] = v0;
  v17[8] = v8;
  v17[9] = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_27_10();
  sub_247C8F898();
  OUTLINED_FUNCTION_64();
}

uint64_t IntentsServices.ProgressTask.makeAsyncIterator()()
{
  sub_247C904FC(*(os_unfair_lock_s **)(v0 + 8));
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  sub_247CBE1D8();
  return sub_247CBE0D8();
}

void IntentsServices.ProgressTask.cancel(_:)(void *a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  sub_247C903C4(a1);
  if (v2)
  {
    sub_247CBE108();
  }
}

uint64_t IntentsServices.ProgressTask.finalValue.getter(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_247C8F704()
{
  OUTLINED_FUNCTION_3();
  swift_task_alloc();
  OUTLINED_FUNCTION_21();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_247C725C4;
  uint64_t v3 = *(void *)(v0 + 16);
  return sub_247B6C2B0(v3);
}

#error "247C8F7C0: call analysis failed (funcsize=9)"

void sub_247C8F7D0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_15();
  uint64_t v6 = v2 + *(void *)(v5 + 144);
  os_unfair_lock_lock((os_unfair_lock_t)v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  swift_retain();
  sub_247C77190();
  uint64_t v8 = *(void *)(*(void *)(v6 + 8) + 16);
  sub_247C7727C(v8);
  uint64_t v9 = *(void *)(v6 + 8);
  *(void *)(v9 + 16) = v8 + 1;
  uint64_t v10 = v9 + 16 * v8;
  *(void *)(v10 + 32) = sub_247C92730;
  *(void *)(v10 + 40) = v7;
  *(void *)(v6 + 8) = v9;
  os_unfair_lock_unlock((os_unfair_lock_t)v6);
}

void sub_247C8F898()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v38 = v2;
  uint64_t v39 = v1;
  uint64_t v4 = v3;
  uint64_t v40 = v5;
  uint64_t v41 = v6;
  uint64_t v42 = v7;
  uint64_t v43 = v8;
  uint64_t v10 = v9;
  v44 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC20);
  uint64_t v13 = OUTLINED_FUNCTION_2_3(v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = v15;
  uint64_t v37 = v4;
  uint64_t v16 = sub_247CBE468();
  OUTLINED_FUNCTION_2_5();
  uint64_t v18 = v17;
  uint64_t v20 = *(void *)(v19 + 64);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_31_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAF80);
  uint64_t v22 = swift_allocObject();
  *(_DWORD *)(v22 + 24) = 0;
  *(void *)(v22 + 16) = 0;
  _s12ProgressTaskV12ContinuationCMa();
  v23 = *(void (**)(void))(v18 + 16);
  uint64_t v36 = v10;
  OUTLINED_FUNCTION_35_8();
  v23();
  uint64_t v24 = sub_247C8FAEC();
  uint64_t v25 = sub_247CBE0A8();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v25);
  OUTLINED_FUNCTION_35_8();
  v23();
  unint64_t v26 = (*(unsigned __int8 *)(v18 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v27 = (v20 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF8;
  v29 = (char *)swift_allocObject();
  *((void *)v29 + 2) = 0;
  *((void *)v29 + 3) = 0;
  uint64_t v30 = v38;
  *((void *)v29 + 4) = v37;
  *((void *)v29 + 5) = v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(&v29[v26], v0, v16);
  *(void *)&v29[v27] = v24;
  v31 = &v29[v28];
  uint64_t v32 = v43;
  *(void *)v31 = v42;
  *((void *)v31 + 1) = v32;
  *(void *)&v29[(v28 + 23) & 0xFFFFFFFFFFFFFFF8] = v24;
  swift_retain_n();
  uint64_t v33 = sub_247BBF8F4((uint64_t)v35, (uint64_t)&unk_2692AE0C0, (uint64_t)v29);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v36, v16);
  v34 = v44;
  uint64_t *v44 = v24;
  v34[1] = v22;
  v34[2] = v33;
  OUTLINED_FUNCTION_64();
}

uint64_t sub_247C8FAEC()
{
  uint64_t v0 = swift_allocObject();
  sub_247C920C0();
  return v0;
}

uint64_t sub_247C8FB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  uint64_t v9 = *a5;
  uint64_t v10 = *(void *)(*a5 + 88);
  v8[7] = v10;
  v8[8] = *(void *)(v10 - 8);
  v8[9] = swift_task_alloc();
  uint64_t v11 = *(void *)(v9 + 80);
  v8[10] = v11;
  uint64_t v12 = sub_247CBE468();
  v8[11] = v12;
  v8[12] = *(void *)(v12 - 8);
  v8[13] = swift_task_alloc();
  v8[14] = *(void *)(v11 - 8);
  v8[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247C8FCF8, 0, 0);
}

#error "247C8FD90: call analysis failed (funcsize=87)"

uint64_t sub_247C8FE58()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_247C8FF34()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = *(void **)(v0 + 136);
  sub_247CBE138();
  if (v1)
  {
    OUTLINED_FUNCTION_31();
    v2();
    sub_247C902EC();
  }
  else
  {
    sub_247C9021C();
    OUTLINED_FUNCTION_31();
    v3();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  return v4();
}

uint64_t sub_247C90018()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = *(void **)(v0 + 136);
  sub_247C902EC();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  return v2();
}

void sub_247C900B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_59_1();
  a19 = v22;
  a20 = v23;
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)(*(void *)v20 + 80);
  OUTLINED_FUNCTION_2_5();
  uint64_t v28 = v27;
  OUTLINED_FUNCTION_2_12();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_21_14();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  uint64_t v30 = sub_247CBE158();
  OUTLINED_FUNCTION_2_5();
  uint64_t v32 = v31;
  OUTLINED_FUNCTION_2_12();
  MEMORY[0x270FA5388](v33);
  v35 = (char *)&a9 - v34;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v21, v25, v26);
  sub_247CBE198();
  sub_247CBE178();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v30);
  OUTLINED_FUNCTION_64();
}

uint64_t sub_247C9021C()
{
  OUTLINED_FUNCTION_6_21();
  uint64_t result = sub_247B6A554();
  if ((result & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
    sub_247CBE198();
    sub_247CBE188();
    return sub_247B6B9A0(v0);
  }
  return result;
}

uint64_t sub_247C902EC()
{
  OUTLINED_FUNCTION_6_21();
  uint64_t result = sub_247B6A554();
  if ((result & 1) == 0)
  {
    id v2 = v0;
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
    sub_247CBE198();
    sub_247CBE188();
    return sub_247B6BCA4(v0);
  }
  return result;
}

void sub_247C903C4(id a1)
{
  if (a1)
  {
    id v3 = a1;
  }
  else
  {
    sub_247CBE068();
    sub_247C9339C();
    id v3 = (id)swift_allocError();
    sub_247CBDCB8();
  }
  id v4 = a1;
  sub_247C902EC();
  OUTLINED_FUNCTION_3_15();
  uint64_t v6 = v1 + *(void *)(v5 + 144);
  os_unfair_lock_lock((os_unfair_lock_t)v6);
  uint64_t v7 = *(void *)(v6 + 8);
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = v7 + 40;
    do
    {
      uint64_t v10 = *(void (**)(id *))(v9 - 8);
      v11[0] = v3;
      swift_retain();
      v10(v11);
      swift_release();
      v9 += 16;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  *(void *)(v6 + 8) = MEMORY[0x263F8EE78];
  os_unfair_lock_unlock((os_unfair_lock_t)v6);
}

void sub_247C904FC(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1 + 4;
  id v2 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_247C933EC(v1);
  os_unfair_lock_unlock(v2);
}

uint64_t sub_247C90564()
{
  IntentsServices.ProgressTask.makeAsyncIterator()();
  swift_release();
  swift_release();
  return swift_release();
}

void IntentsServices.ProgressTask.emitting(_:after:)()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v2 = v1;
  uint64_t v26 = v3;
  uint64_t v27 = v4;
  uint64_t v28 = v5;
  uint64_t v6 = *(void *)(v1 + 16);
  OUTLINED_FUNCTION_2_5();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = OUTLINED_FUNCTION_42_5();
  OUTLINED_FUNCTION_2_3(v12);
  OUTLINED_FUNCTION_2_12();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_21_14();
  uint64_t v14 = *v0;
  uint64_t v25 = v0[1];
  uint64_t v15 = OUTLINED_FUNCTION_37_7();
  __swift_storeEnumTagSinglePayload(v15, v16, v17, v6);
  OUTLINED_FUNCTION_24_2();
  v18();
  unint64_t v19 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v20 = (char *)swift_allocObject();
  uint64_t v21 = *(void *)(v2 + 24);
  *((void *)v20 + 2) = v6;
  *((void *)v20 + 3) = v21;
  uint64_t v22 = v27;
  *((void *)v20 + 4) = v26;
  *((void *)v20 + 5) = v22;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v20[v19], (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v23 = &v20[(v10 + v19 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v24 = v25;
  *(void *)uint64_t v23 = v14;
  *((void *)v23 + 1) = v24;
  *((void *)v23 + 2) = v0;
  swift_retain();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_27_10();
  sub_247C8F898();
  OUTLINED_FUNCTION_64();
}

uint64_t sub_247C90758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[14] = v13;
  v8[15] = v14;
  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[8] = a3;
  v8[9] = a4;
  v8[6] = a1;
  v8[7] = a2;
  sub_247CBE468();
  v8[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  uint64_t v9 = sub_247CBE1C8();
  v8[17] = v9;
  v8[18] = *(void *)(v9 - 8);
  v8[19] = swift_task_alloc();
  uint64_t v10 = *(void *)(v13 - 8);
  v8[20] = v10;
  v8[21] = *(void *)(v10 + 64);
  v8[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247C908D4, 0, 0);
}

uint64_t sub_247C908D4()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[11];
  uint64_t v17 = v0[13];
  uint64_t v7 = v0[7];
  OUTLINED_FUNCTION_24_2();
  v8();
  unint64_t v9 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v10 = (char *)swift_allocObject();
  *((void *)v10 + 2) = v3;
  *((void *)v10 + 3) = v4;
  *((void *)v10 + 4) = v7;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 32);
  v0[23] = v11;
  v0[24] = (v2 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v11(&v10[v9], v1, v3);
  swift_retain();
  uint64_t v12 = sub_247B0D0C8();
  v0[25] = v12;
  swift_release();
  uint64_t v13 = (void *)OUTLINED_FUNCTION_40();
  v13[2] = v3;
  v13[3] = v4;
  uint64_t v13[4] = v12;
  v13[5] = v6;
  v13[6] = v5;
  v13[7] = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_247C8F7D0((uint64_t)sub_247C92FEC, (uint64_t)v13);
  swift_release();
  v0[26] = type metadata accessor for IntentsServices.ProgressTask();
  IntentsServices.ProgressTask.makeAsyncIterator()();
  uint64_t v14 = (void *)swift_task_alloc();
  v0[27] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_247C90AFC;
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA20F8](v15);
}

uint64_t sub_247C90AFC()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "247C90CD0: call analysis failed (funcsize=97)"

uint64_t sub_247C90D54()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 232) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_247C90E30()
{
  OUTLINED_FUNCTION_8();
  sub_247CBE108();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_37();
  return v0();
}

uint64_t sub_247C90EDC()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_31();
  v0();
  OUTLINED_FUNCTION_36_9();
  sub_247CBE108();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  return v1();
}

uint64_t sub_247C90F98()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_36_9();
  sub_247CBE108();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  return v0();
}

uint64_t sub_247C91044()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 24;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_247C910F4()
{
  OUTLINED_FUNCTION_34_9();
  OUTLINED_FUNCTION_2_5();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_3_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247ADF794;
  OUTLINED_FUNCTION_17_15();
  OUTLINED_FUNCTION_302();
  return sub_247C90758(v3, v4, v5, v6, v7, v8, v9, v10);
}

void IntentsServices.ProgressTask.throwing(_:after:)()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v2 + 16);
  uint64_t v11 = OUTLINED_FUNCTION_42_5();
  OUTLINED_FUNCTION_2_3(v11);
  OUTLINED_FUNCTION_2_12();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_31_8();
  uint64_t v13 = *v0;
  uint64_t v14 = v0[1];
  uint64_t v15 = v0[2];
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v10);
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t v17 = *(void *)(v3 + 24);
  v16[2] = v10;
  v16[3] = v17;
  v16[4] = v7;
  v16[5] = v5;
  v16[6] = v13;
  v16[7] = v14;
  v16[8] = v15;
  v16[9] = v9;
  swift_retain();
  swift_retain();
  swift_retain();
  id v18 = v9;
  sub_247C8F898();
  OUTLINED_FUNCTION_64();
}

uint64_t sub_247C9130C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[14] = v12;
  v8[15] = v13;
  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[8] = a3;
  v8[9] = a4;
  v8[6] = a1;
  v8[7] = a2;
  v8[16] = *(void *)(v12 - 8);
  v8[17] = swift_task_alloc();
  sub_247CBE468();
  v8[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  uint64_t v9 = sub_247CBE1C8();
  v8[19] = v9;
  v8[20] = *(void *)(v9 - 8);
  v8[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247C91484, 0, 0);
}

uint64_t sub_247C91484()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[12];
  uint64_t v4 = (void *)v0[13];
  uint64_t v6 = v0[10];
  uint64_t v5 = v0[11];
  uint64_t v7 = (void *)OUTLINED_FUNCTION_40();
  v7[2] = v2;
  v7[3] = v1;
  v7[4] = v6;
  v7[5] = v5;
  v7[6] = v3;
  v7[7] = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  id v8 = v4;
  uint64_t v9 = sub_247B0D0C8();
  v0[22] = v9;
  swift_release();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_40();
  v10[2] = v2;
  v10[3] = v1;
  v10[4] = v9;
  v10[5] = v6;
  v10[6] = v5;
  v10[7] = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_247C8F7D0((uint64_t)sub_247C92FEC, (uint64_t)v10);
  swift_release();
  v0[23] = type metadata accessor for IntentsServices.ProgressTask();
  IntentsServices.ProgressTask.makeAsyncIterator()();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[24] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_247C91668;
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA20F8](v12);
}

uint64_t sub_247C91668()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "247C9181C: call analysis failed (funcsize=89)"

uint64_t sub_247C918A0()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 208) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_247C9197C()
{
  OUTLINED_FUNCTION_8();
  sub_247CBE108();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_37();
  return v0();
}

uint64_t sub_247C91A20()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_31();
  v0();
  sub_247CBE108();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  return v1();
}

uint64_t sub_247C91AE0()
{
  OUTLINED_FUNCTION_53();
  sub_247CBE108();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  return v0();
}

uint64_t sub_247C91B90()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_247C91BE0()
{
  OUTLINED_FUNCTION_34_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_3_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247ADF794;
  OUTLINED_FUNCTION_17_15();
  OUTLINED_FUNCTION_302();
  return sub_247C9130C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_247C91C94()
{
  return swift_getWitnessTable();
}

uint64_t sub_247C91CB4()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_247C91CF8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_247C91D48(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_247C91DC0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t sub_247C91E10(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247C91E50(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for IntentsServices.ProgressTask()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_247C91EA8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  uint64_t result = sub_247CBE1D8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_247CBE198();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_247CBE468();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return result;
}

void sub_247C92018(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

void sub_247C92050()
{
}

void sub_247C920C0()
{
  OUTLINED_FUNCTION_59_1();
  unint64_t v3 = v0;
  uint64_t v36 = v4;
  uint64_t v37 = v5;
  uint64_t v34 = v6;
  uint64_t v35 = v7;
  uint64_t v30 = *(void *)v0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  OUTLINED_FUNCTION_40_7();
  uint64_t v32 = sub_247CBE168();
  OUTLINED_FUNCTION_2_5();
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_2_12();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_31_8();
  uint64_t v33 = v8;
  uint64_t v31 = sub_247CBE198();
  OUTLINED_FUNCTION_2_5();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_2_12();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_21_14();
  OUTLINED_FUNCTION_40_7();
  uint64_t v15 = sub_247CBE1D8();
  OUTLINED_FUNCTION_2_5();
  uint64_t v17 = v16;
  OUTLINED_FUNCTION_2_12();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v30 - v19;
  uint64_t v21 = &v3[*(void *)(v30 + 144)];
  *(_DWORD *)uint64_t v21 = 0;
  *((void *)v21 + 1) = MEMORY[0x263F8EE78];
  sub_247C923D8(v1);
  sub_247CBE148();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v32);
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v3[*(void *)(*(void *)v3 + 96)], v20, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(&v3[*(void *)(*(void *)v3 + 104)], v2, v31);
  uint64_t v22 = sub_247CBE468();
  OUTLINED_FUNCTION_1_23();
  uint64_t v24 = v23;
  uint64_t v25 = v34;
  OUTLINED_FUNCTION_24_2();
  v26();
  type metadata accessor for Awaitable();
  uint64_t v27 = sub_247B6A3C4();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v22);
  *(void *)&v3[*(void *)(*(void *)v3 + 112)] = v27;
  uint64_t v28 = &v3[*(void *)(*(void *)v3 + 128)];
  uint64_t v29 = v36;
  *(void *)uint64_t v28 = v35;
  *((void *)v28 + 1) = v29;
  *(void *)&v3[*(void *)(*(void *)v3 + 136)] = v37;
  OUTLINED_FUNCTION_64();
}

uint64_t sub_247C923D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F680];
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  uint64_t v3 = sub_247CBE168();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_247C92474(void *a1, uint64_t (*a2)(void))
{
  return a2(*a1);
}

uint64_t sub_247C924A0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  OUTLINED_FUNCTION_41_8();
  sub_247CBE1D8();
  OUTLINED_FUNCTION_3_0();
  uint64_t v1 = OUTLINED_FUNCTION_26_11();
  v2(v1);
  OUTLINED_FUNCTION_41_8();
  sub_247CBE198();
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = OUTLINED_FUNCTION_26_11();
  v4(v3);
  swift_release();
  OUTLINED_FUNCTION_3_15();
  OUTLINED_FUNCTION_42_5();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = OUTLINED_FUNCTION_26_11();
  v6(v5);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_15();
  sub_247C92698(v0 + *(void *)(v7 + 144));
  return v0;
}

uint64_t sub_247C92600()
{
  sub_247C924A0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t _s12ProgressTaskV12ContinuationCMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_247C92670()
{
  if (MEMORY[0x263F8EEE0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE0B0);
  }
  else {
    return MEMORY[0x263F8EE60] + 8;
  }
}

uint64_t sub_247C92698(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE0B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247C926F8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247C92730(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_247C9275C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[14] = v12;
  v8[15] = v13;
  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[8] = a3;
  v8[9] = a4;
  v8[6] = a1;
  v8[7] = a2;
  v8[16] = *(void *)(a8 - 8);
  v8[17] = swift_task_alloc();
  v8[18] = *(void *)(v12 - 8);
  v8[19] = swift_task_alloc();
  sub_247CBE468();
  v8[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  uint64_t v9 = sub_247CBE1C8();
  v8[21] = v9;
  v8[22] = *(void *)(v9 - 8);
  v8[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247C92928, 0, 0);
}

uint64_t sub_247C92928()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = OUTLINED_FUNCTION_40();
  *(void *)(v5 + 16) = v1;
  *(_OWORD *)(v5 + 24) = *(_OWORD *)(v0 + 112);
  *(void *)(v5 + 40) = v4;
  *(void *)(v5 + 48) = v3;
  *(void *)(v5 + 56) = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_247C8F7D0((uint64_t)sub_247C93578, v5);
  swift_release();
  *(void *)(v0 + 192) = type metadata accessor for IntentsServices.ProgressTask();
  IntentsServices.ProgressTask.makeAsyncIterator()();
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_33_8(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_247C92A88;
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA20F8](v9);
}

uint64_t sub_247C92A88()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "247C92C40: call analysis failed (funcsize=88)"

uint64_t sub_247C92CBC()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 216) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_247C92D98()
{
  OUTLINED_FUNCTION_27();
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 112);
  (*(void (**)(uint64_t))(v0 + 88))(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_37();
  return v4();
}

uint64_t sub_247C92E5C()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_31();
  v0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  return v1();
}

uint64_t sub_247C92EF0()
{
  OUTLINED_FUNCTION_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  return v0();
}

void sub_247C92F74()
{
}

uint64_t sub_247C92FAC()
{
  return objectdestroy_13Tm(MEMORY[0x263F8EEB0]);
}

void sub_247C92FC4()
{
  sub_247C92018(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void **)(v0 + 56));
}

uint64_t sub_247C92FD4()
{
  return objectdestroy_13Tm(MEMORY[0x263F8EED8]);
}

uint64_t sub_247C92FF0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = OUTLINED_FUNCTION_42_5();
  OUTLINED_FUNCTION_1_2(v2);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 48) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  swift_unknownObjectRelease();
  if (!__swift_getEnumTagSinglePayload(v0 + v5, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v5, v1);
  }
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((((((v7 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v4 | 7);
}

uint64_t sub_247C930F8()
{
  OUTLINED_FUNCTION_27();
  uint64_t v2 = v1;
  uint64_t v3 = sub_247CBE468();
  OUTLINED_FUNCTION_1_2(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void *)(v0 + 16);
  uint64_t v12 = *(void *)(v0 + 24);
  uint64_t v13 = v0 + v8;
  uint64_t v14 = *(uint64_t **)(v0 + v9);
  uint64_t v15 = *(void *)(v0 + v10);
  uint64_t v16 = *(void *)(v0 + v10 + 8);
  uint64_t v17 = *(void *)(v0 + ((v10 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v18 = swift_task_alloc();
  uint64_t v19 = (void *)OUTLINED_FUNCTION_3_4(v18);
  *uint64_t v19 = v20;
  v19[1] = sub_247ACA74C;
  return sub_247C8FB54(v2, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_247C93220()
{
  uint64_t v1 = *(void *)(v0 + 16);
  OUTLINED_FUNCTION_2_5();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 40) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

#error "247C932F0: call analysis failed (funcsize=16)"

uint64_t sub_247C93300()
{
  return objectdestroy_13Tm(MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_13Tm(void (*a1)(void))
{
  swift_release();
  swift_release();
  swift_release();
  a1(*(void *)(v1 + 56));
  return MEMORY[0x270FA0238](v1, 64, 7);
}

void sub_247C93378()
{
}

unint64_t sub_247C9339C()
{
  unint64_t result = qword_2692A9F28;
  if (!qword_2692A9F28)
  {
    sub_247CBE068();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692A9F28);
  }
  return result;
}

void *sub_247C933EC(void *a1)
{
  return sub_247ACA980(a1);
}

uint64_t sub_247C93410()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_247C93460()
{
  OUTLINED_FUNCTION_34_9();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_3_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247ACA74C;
  OUTLINED_FUNCTION_302();
  return sub_247C9275C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_247C93530()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_247C93578()
{
}

uint64_t OUTLINED_FUNCTION_9_18()
{
  return *(void *)(v0 + 136);
}

uint64_t OUTLINED_FUNCTION_11_20()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_15()
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v0;
  return v1;
}

__n128 OUTLINED_FUNCTION_19_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9)
{
  __n128 result = a9;
  v10[1] = a9;
  v10[2].n128_u64[0] = v9;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_15(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_26_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33_8(uint64_t result)
{
  *(void *)(v1 + 200) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_37_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40_7()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_41_8()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_42_5()
{
  return sub_247CBE468();
}

uint64_t DefaultPerformAppIntentDelegate.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t sub_247C93760()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_247C94DD4;
  return PerformAppIntentDelegate.needsContinueInApp(_:)();
}

uint64_t sub_247C937EC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_247C94DD4;
  return PerformAppIntentDelegate.needsContinueInApp(_:)();
}

uint64_t PerformAppIntentDelegate.needsContinueInApp(_:)()
{
  return sub_247C93DC0(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 1);
}

uint64_t sub_247C938B4()
{
  return OUTLINED_FUNCTION_15((uint64_t)sub_247C938C8);
}

uint64_t sub_247C938C8()
{
  OUTLINED_FUNCTION_8();
  sub_247AD93CC();
  uint64_t v0 = OUTLINED_FUNCTION_32();
  *uint64_t v1 = 0xD00000000000005CLL;
  v1[1] = 0x8000000247CC3DA0;
  OUTLINED_FUNCTION_6_22(v0, (uint64_t)v1);
  uint64_t v2 = OUTLINED_FUNCTION_17_16();
  return v3(v2);
}

uint64_t sub_247C93958(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return OUTLINED_FUNCTION_15((uint64_t)sub_247C93970);
}

uint64_t sub_247C93970()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_1_10();
  sub_247CBE638();
  OUTLINED_FUNCTION_20_16();
  OUTLINED_FUNCTION_15_14();
  uint64_t v0 = OUTLINED_FUNCTION_8_18();
  v1(v0);
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_15();
  sub_247AD93CC();
  uint64_t v2 = OUTLINED_FUNCTION_32();
  *uint64_t v3 = v7;
  v3[1] = v8;
  OUTLINED_FUNCTION_6_22(v2, (uint64_t)v3);
  uint64_t v4 = OUTLINED_FUNCTION_17_16();
  return v5(v4);
}

uint64_t sub_247C93A38()
{
  return OUTLINED_FUNCTION_15((uint64_t)sub_247C93A4C);
}

uint64_t sub_247C93A4C()
{
  OUTLINED_FUNCTION_8();
  sub_247AD93CC();
  uint64_t v0 = OUTLINED_FUNCTION_32();
  *uint64_t v1 = 0xD00000000000005ALL;
  v1[1] = 0x8000000247CC3E80;
  OUTLINED_FUNCTION_6_22(v0, (uint64_t)v1);
  uint64_t v2 = OUTLINED_FUNCTION_17_16();
  return v3(v2);
}

uint64_t sub_247C93ADC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return OUTLINED_FUNCTION_15((uint64_t)sub_247C93AF4);
}

uint64_t sub_247C93AF4()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_1_10();
  sub_247CBE638();
  OUTLINED_FUNCTION_20_16();
  OUTLINED_FUNCTION_15_14();
  uint64_t v0 = OUTLINED_FUNCTION_8_18();
  v1(v0);
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_15();
  sub_247AD93CC();
  uint64_t v2 = OUTLINED_FUNCTION_32();
  *uint64_t v3 = v6;
  v3[1] = v7;
  OUTLINED_FUNCTION_6_22(v2, (uint64_t)v3);
  OUTLINED_FUNCTION_19();
  return v4();
}

double sub_247C93BBC(uint64_t a1, uint64_t a2)
{
  sub_247ADF5B4(a2, (uint64_t)v6);
  uint64_t v2 = swift_allocObject();
  sub_247AD94B8(v6, v2 + 16);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = &unk_2692AE110;
  *(void *)(v3 + 24) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692ADD98);
  uint64_t v4 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v4 + 16) = xmmword_247CCDDF0;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  *(unsigned char *)(v4 + 48) = 0;
  *(void *)(v4 + 56) = &unk_2692AE120;
  *(void *)(v4 + 64) = v3;
  return result;
}

uint64_t sub_247C93C7C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_247C93C9C, 0, 0);
}

uint64_t sub_247C93C9C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  OUTLINED_FUNCTION_1_10();
  sub_247CBE638();
  sub_247CBDE68();
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_14();
  sub_247AD93CC();
  uint64_t v4 = OUTLINED_FUNCTION_32();
  *uint64_t v5 = v8;
  v5[1] = v9;
  OUTLINED_FUNCTION_6_22(v4, (uint64_t)v5);
  OUTLINED_FUNCTION_19();
  return v6();
}

uint64_t DefaultPerformAppIntentDelegate.init()()
{
  return v0;
}

uint64_t sub_247C93DC0(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_247C93DD4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_247C93E0C()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_11_15(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_247C93E98;
  return sub_247C93C7C(v0 + 16);
}

uint64_t sub_247C93E98()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_19_16();
  return v5(v2);
}

uint64_t DefaultPerformAppIntentDelegate.deinit()
{
  return v0;
}

uint64_t DefaultPerformAppIntentDelegate.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_247C93F78(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_247C94DD4;
  return sub_247C93958(a1);
}

uint64_t sub_247C9400C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_247C940A0;
  return sub_247C93ADC(a1);
}

uint64_t sub_247C940A0()
{
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_19_16();
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

double sub_247C9416C(uint64_t a1, uint64_t a2)
{
  return sub_247C93BBC(a1, a2);
}

uint64_t sub_247C94184()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_247C94DD4;
  return sub_247C938B4();
}

uint64_t sub_247C94210()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_247C9429C;
  return sub_247C93A38();
}

uint64_t sub_247C9429C()
{
  OUTLINED_FUNCTION_3();
  char v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_19_16();
  if (v0) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v3 & 1;
  }
  return v6(v7);
}

uint64_t sub_247C94370()
{
  OUTLINED_FUNCTION_3();
  *(void *)(v0 + 16) = v1;
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  char v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v3;
  *char v3 = v0;
  v3[1] = sub_247C9443C;
  return v5();
}

uint64_t sub_247C9443C()
{
  OUTLINED_FUNCTION_8();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_1();
  *uint64_t v7 = v6;
  swift_task_dealloc();
  if (!v0)
  {
    uint64_t v9 = *(void **)(v5 + 16);
    v9[3] = sub_247ACB774();
    v9[4] = &protocol witness table for LNValue;
    *uint64_t v9 = v3;
  }
  OUTLINED_FUNCTION_19();
  return v8();
}

uint64_t sub_247C94534()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247C9456C()
{
  OUTLINED_FUNCTION_8();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247ACA74C;
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_2692AE118 + dword_2692AE118);
  return v3();
}

uint64_t dispatch thunk of PerformAppIntentDelegate.needsConfirmation(_:)()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_5_16();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247C94DD8;
  uint64_t v3 = OUTLINED_FUNCTION_2_33();
  return v4(v3);
}

uint64_t dispatch thunk of PerformAppIntentDelegate.needsDisambiguation(_:)()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_5_16();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247C94DD8;
  uint64_t v3 = OUTLINED_FUNCTION_2_33();
  return v4(v3);
}

uint64_t dispatch thunk of PerformAppIntentDelegate.needsValue(dialog:parameter:dispatcher:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of PerformAppIntentDelegate.needsActionConfirmation(_:)()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_5_16();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247C94DD8;
  uint64_t v3 = OUTLINED_FUNCTION_2_33();
  return v4(v3);
}

uint64_t dispatch thunk of PerformAppIntentDelegate.needsContinueInApp(_:)()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_5_16();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247C94DD8;
  uint64_t v3 = OUTLINED_FUNCTION_2_33();
  return v4(v3);
}

uint64_t type metadata accessor for DefaultPerformAppIntentDelegate()
{
  return self;
}

uint64_t method lookup function for DefaultPerformAppIntentDelegate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultPerformAppIntentDelegate);
}

uint64_t dispatch thunk of DefaultPerformAppIntentDelegate.needsActionConfirmation(_:)()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11_21();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247C94DD8;
  uint64_t v3 = OUTLINED_FUNCTION_9_19();
  return v4(v3);
}

uint64_t dispatch thunk of DefaultPerformAppIntentDelegate.needsConfirmation(_:)()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11_21();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247C94DD8;
  uint64_t v3 = OUTLINED_FUNCTION_9_19();
  return v4(v3);
}

uint64_t dispatch thunk of DefaultPerformAppIntentDelegate.needsContinueInApp(_:)()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11_21();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247C93E98;
  uint64_t v3 = OUTLINED_FUNCTION_9_19();
  return v4(v3);
}

uint64_t dispatch thunk of DefaultPerformAppIntentDelegate.needsDisambiguation(_:)()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11_21();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_11_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247C94DD8;
  uint64_t v3 = OUTLINED_FUNCTION_9_19();
  return v4(v3);
}

uint64_t dispatch thunk of DefaultPerformAppIntentDelegate.needsValue(dialog:parameter:dispatcher:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of DefaultPerformAppIntentDelegate.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t OUTLINED_FUNCTION_2_33()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_22(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 16) = 1;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_8_18()
{
  uint64_t v1 = *(void *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 40), v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_9_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_14()
{
  return sub_247CBDE68();
}

uint64_t OUTLINED_FUNCTION_16_15()
{
  return sub_247CBDE68();
}

uint64_t OUTLINED_FUNCTION_17_16()
{
  return 0;
}

uint64_t sub_247C94EF4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_5();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  MEMORY[0x270FA5388](v7);
  char v8 = *v2;
  uint64_t v9 = *(void (**)(void))(v5 + 16);
  OUTLINED_FUNCTION_1_30();
  v9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA2B8);
  if (swift_dynamicCast())
  {
    sub_247AD94B8(v14, (uint64_t)v16);
    uint64_t v10 = v17;
    uint64_t v11 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    LOBYTE(v14[0]) = v8;
    uint64_t v12 = (*(uint64_t (**)(long long *, uint64_t, uint64_t))(v11 + 16))(v14, v10, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_247C955B4((uint64_t)v14);
    if (v8)
    {
      v16[0] = 0x20656D6F7328;
      v16[1] = 0xE600000000000000;
      *(void *)&v14[0] = a2;
      swift_getMetatypeMetadata();
      sub_247CBDE08();
      sub_247CBDE68();
      swift_bridgeObjectRelease();
      sub_247CBDE68();
      return v16[0];
    }
    else
    {
      OUTLINED_FUNCTION_1_30();
      v9();
      return sub_247CBDDE8();
    }
  }
  return v12;
}

uint64_t sub_247C950C8(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_5();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_247CBE468();
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = &v17[-v11];
  char v13 = *v2;
  (*(void (**)(unsigned char *, uint64_t))(v14 + 16))(&v17[-v11], a1);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, a2) == 1) {
    return 7104878;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v9, v12, a2);
  v17[15] = v13;
  uint64_t v15 = sub_247C94EF4((uint64_t)v9, a2);
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v9, a2);
  return v15;
}

uint64_t IntentsServices.PayloadPrivacy.rawValue.getter()
{
  return (*v0 << 31 >> 31);
}

uint64_t sub_247C95248(uint64_t a1, uint64_t a2)
{
  char v3 = 0;
  return (*(uint64_t (**)(char *, uint64_t))(a2 + 16))(&v3, a1);
}

uint64_t IntentsServices.PayloadPrivacy.init(rawValue:)@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  if (result == -1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!result) {
    char v2 = 0;
  }
  *a2 = v2;
  return result;
}

unint64_t sub_247C952A8()
{
  unint64_t result = qword_2692AE198;
  if (!qword_2692AE198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE198);
  }
  return result;
}

uint64_t sub_247C952F4()
{
  return sub_247AC98F8();
}

uint64_t sub_247C952FC()
{
  return sub_247BE8520();
}

uint64_t sub_247C95304()
{
  return sub_247AC9B7C();
}

uint64_t sub_247C9530C@<X0>(unsigned int *a1@<X0>, char *a2@<X8>)
{
  return IntentsServices.PayloadPrivacy.init(rawValue:)(*a1, a2);
}

uint64_t sub_247C95314@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = IntentsServices.PayloadPrivacy.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_247C9533C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4 = *a1;
  uint64_t v12 = 91;
  unint64_t v13 = 0xE100000000000000;
  uint64_t v11 = a2;
  v9[2] = a3;
  v9[3] = a4;
  char v10 = v4;
  uint64_t v5 = sub_247CBE008();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = sub_247B650D0((void (*)(char *, uint64_t))sub_247C95614, (uint64_t)v9, v5, MEMORY[0x263F8D310], MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA4C0);
  sub_247AE0324();
  sub_247CBDD38();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  return v12;
}

uint64_t sub_247C95460(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_247C9533C(a1, *v3, *(void *)(a2 + 16), *(void *)(a3 - 8));
}

uint64_t sub_247C95474(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

unsigned char *_s14PayloadPrivacyOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247C9557CLL);
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

ValueMetadata *type metadata accessor for IntentsServices.PayloadPrivacy()
{
  return &type metadata for IntentsServices.PayloadPrivacy;
}

uint64_t sub_247C955B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA2C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247C95614@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_247C94EF4(a1, *(void *)(v2 + 16));
  *a2 = result;
  a2[1] = v5;
  return result;
}

void sub_247C95670(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AABD0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_1_1();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_247CBD108();
  uint64_t v68 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v61 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692ABB30);
  MEMORY[0x270FA5388](v16 - 8);
  OUTLINED_FUNCTION_1_1();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = type metadata accessor for RemoteFileDescriptor(0);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_1_1();
  uint64_t v23 = v22 - v21;
  id v24 = objc_msgSend(v3, sel_exportedContent);
  if (!v24)
  {
    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return;
  }
  uint64_t v25 = v24;
  v66 = v15;
  uint64_t v67 = a1;
  id v26 = objc_msgSend(v24, sel_content);
  sub_247B83954();

  if (__swift_getEnumTagSinglePayload(v19, 1, v20) != 1)
  {
    sub_247B873B4(v19, v23);
    if (qword_2692A9E58 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_247CBD878();
    __swift_project_value_buffer(v54, (uint64_t)qword_2692C8400);
    v55 = sub_247CBD858();
    os_log_type_t v56 = sub_247CBE2E8();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_247AC5000, v55, v56, "Decoding exportedContent using new INFile descriptor codepath", v57, 2u);
      MEMORY[0x24C568940](v57, -1, -1);
    }

    uint64_t v58 = type metadata accessor for RemoteFileRepresentation(0);
    *(void *)(a2 + 24) = v58;
    *(void *)(a2 + 32) = &off_26FBF8CB8;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a2);
    sub_247B873B4(v23, (uint64_t)boxed_opaque_existential_1);
    uint64_t v53 = (uint64_t)boxed_opaque_existential_1 + *(int *)(v58 + 20);
    goto LABEL_16;
  }
  sub_247B688B4(v19, &qword_2692ABB30);
  id v27 = objc_msgSend(v25, sel_content);
  id v28 = objc_msgSend(v27, sel_fileURL);

  if (v28)
  {
    sub_247CBD0A8();

    uint64_t v29 = v68 + 32;
    uint64_t v30 = *(void (**)(uint64_t, char *, uint64_t))(v68 + 32);
    v30(v9, v13, v10);
    __swift_storeEnumTagSinglePayload(v9, 0, 1, v10);
    if (__swift_getEnumTagSinglePayload(v9, 1, v10) != 1)
    {
      uint64_t v31 = v66;
      v64 = (void (*)(uint64_t *, char *, uint64_t))v30;
      v30((uint64_t)v66, (char *)v9, v10);
      if (qword_2692A9E58 != -1) {
        swift_once();
      }
      uint64_t v65 = v29;
      uint64_t v32 = sub_247CBD878();
      __swift_project_value_buffer(v32, (uint64_t)qword_2692C8400);
      uint64_t v33 = sub_247CBD858();
      os_log_type_t v34 = sub_247CBE2E8();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_247AC5000, v33, v34, "Decoding exportedContent using legacy INFile descriptor codepath", v35, 2u);
        MEMORY[0x24C568940](v35, -1, -1);
      }

      id v36 = [v25 (SEL)0x26522B798];
      id v37 = objc_msgSend(v36, sel_filename);

      uint64_t v38 = sub_247CBDD98();
      uint64_t v62 = v39;
      uint64_t v63 = v38;

      uint64_t v40 = v68;
      (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v13, v31, v10);
      id v41 = objc_msgSend(v25, sel_contentType);
      id v42 = objc_msgSend(v41, sel_contentType);

      uint64_t v43 = sub_247CBDD98();
      uint64_t v45 = v44;

      (*(void (**)(char *, uint64_t))(v40 + 8))(v31, v10);
      uint64_t v46 = type metadata accessor for RemoteFileRepresentation(0);
      *(void *)(a2 + 24) = v46;
      *(void *)(a2 + 32) = &off_26FBF8CB8;
      v47 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a2);
      v48 = (uint64_t *)((char *)v47 + *(int *)(v20 + 20));
      uint64_t v49 = v62;
      uint64_t *v48 = v63;
      v48[1] = v49;
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC18);
      v51 = (char *)v47 + *(int *)(v50 + 48);
      v52 = (uint64_t *)((char *)v47 + *(int *)(v50 + 64));
      v64(v47, v13, v10);
      *(void *)v51 = 0;
      v51[8] = 0;
      uint64_t *v52 = v43;
      v52[1] = v45;
      type metadata accessor for RemoteFileDescriptor.Content(0);
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = (uint64_t)v47 + *(int *)(v46 + 20);
LABEL_16:
      sub_247ADF5B4(v67, v53);
      return;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  }
  sub_247B688B4(v9, &qword_2692AABD0);
  id v60 = [v25 (SEL)0x26522B798];
  *(void *)(a2 + 24) = &unk_26FBF8BA0;
  *(void *)(a2 + 32) = &off_26FBF8B50;

  *(void *)a2 = v60;
}

id sub_247C95CD8(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = objc_msgSend(a1, sel_value);
  id v5 = objc_msgSend(a1, sel_valueType);
  id v6 = objc_msgSend(a1, sel_displayRepresentation);
  v11.receiver = v1;
  v11.super_class = ObjectType;
  id v7 = objc_msgSendSuper2(&v11, sel_initWithValue_valueType_displayRepresentation_, v4, v5, v6);
  swift_unknownObjectRelease();

  id v8 = v7;
  id v9 = objc_msgSend(a1, sel_exportedContent);
  objc_msgSend(v8, sel_setExportedContent_, v9);

  return v8;
}

id sub_247C95DEC(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

void sub_247C95E68()
{
}

void sub_247C95ED8()
{
}

void sub_247C95F3C()
{
}

void sub_247C95FB8()
{
}

uint64_t type metadata accessor for RemoteLNValue()
{
  return self;
}

uint64_t NamedProperty.init<A>(identifier:value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  sub_247CBE468();
  OUTLINED_FUNCTION_0_26();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v23 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v23 - v16, a3, v6);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, a4) == 1)
  {
    uint64_t v18 = *(void (**)(void))(v14 + 8);
    OUTLINED_FUNCTION_2_34();
    v18();
    OUTLINED_FUNCTION_2_34();
    uint64_t result = ((uint64_t (*)(void))v18)();
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16))(a4, a5);
    OUTLINED_FUNCTION_2_34();
    v21();
    OUTLINED_FUNCTION_21_3();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v17, a4);
  }
  *a6 = a1;
  a6[1] = a2;
  a6[2] = v20;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t sub_247C961C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  sub_247CBE468();
  OUTLINED_FUNCTION_21_3();
  (*(void (**)(uint64_t))(v8 + 8))(a3);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t result = swift_getAssociatedConformanceWitness();
  *a4 = a1;
  a4[1] = a2;
  a4[2] = 0;
  a4[3] = AssociatedTypeWitness;
  a4[4] = result;
  return result;
}

uint64_t NamedProperty.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void *NamedProperty.value.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

uint64_t sub_247C962F4()
{
  return sub_247CBEAD8();
}

BOOL sub_247C9631C(uint64_t *a1, uint64_t *a2)
{
  return sub_247B656A0(*a1, (uint64_t)a2, *a2);
}

uint64_t sub_247C96328()
{
  return sub_247AC9878();
}

uint64_t sub_247C96330()
{
  return sub_247C962F4();
}

uint64_t sub_247C96338()
{
  return sub_247CBEB18();
}

uint64_t NamedProperty.init<A, B>(identifier:value:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X4>, void *a4@<X8>)
{
  uint64_t v25 = a3;
  sub_247CBE468();
  OUTLINED_FUNCTION_0_26();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v24 - v11;
  sub_247CBDF48();
  uint64_t v13 = v26;
  uint64_t v24 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, a2) == 1)
  {
    uint64_t v14 = *(void (**)(void))(v9 + 8);
    OUTLINED_FUNCTION_1_31();
    v14();
    OUTLINED_FUNCTION_21_3();
    uint64_t v15 = OUTLINED_FUNCTION_4_20();
    v16(v15);
    OUTLINED_FUNCTION_1_31();
    uint64_t result = ((uint64_t (*)(void))v14)();
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(v25 + 16))(a2);
    OUTLINED_FUNCTION_1_31();
    v19();
    OUTLINED_FUNCTION_21_3();
    uint64_t v20 = OUTLINED_FUNCTION_4_20();
    v21(v20);
    OUTLINED_FUNCTION_21_3();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v12, a2);
  }
  uint64_t v23 = v24;
  *a4 = v13;
  a4[1] = v23;
  a4[2] = v18;
  a4[3] = a2;
  a4[4] = v25;
  return result;
}

BOOL static NamedProperty.== infix(_:_:)(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  unint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = sub_247CBE998(), result = 0, (v5 & 1) != 0))
  {
    BOOL result = (v2 | v3) == 0;
    if (v2)
    {
      if (v3)
      {
        sub_247ACB774();
        id v7 = (id)v3;
        id v8 = (id)v2;
        char v9 = sub_247CBE438();

        return v9 & 1;
      }
    }
  }
  return result;
}

void NamedProperty.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_247CBDE38();
  if (v1)
  {
    sub_247CBEAE8();
    id v2 = v1;
    sub_247CBE448();
  }
  else
  {
    sub_247CBEAE8();
  }
}

uint64_t NamedProperty.hashValue.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_247CBEAC8();
  sub_247CBDE38();
  sub_247CBEAE8();
  if (v1)
  {
    id v2 = v1;
    sub_247CBE448();
  }
  return sub_247CBEB18();
}

uint64_t sub_247C96724()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_247CBEAC8();
  sub_247CBDE38();
  sub_247CBEAE8();
  if (v1)
  {
    id v2 = v1;
    sub_247CBE448();
  }
  return sub_247CBEB18();
}

unint64_t sub_247C967AC()
{
  unint64_t result = qword_2692AE1A0;
  if (!qword_2692AE1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE1A0);
  }
  return result;
}

uint64_t sub_247C967F8(char *a1)
{
  char v2 = *a1;
  uint64_t v3 = *v1;
  BOOL v4 = (void *)v1[2];
  if (v2)
  {
    if (v4)
    {
      id v5 = objc_msgSend(v4, sel_valueType);
      id v6 = objc_msgSend(v5, sel_description);

      sub_247CBDD98();
      sub_247CBDE68();
      sub_247CBDE68();
      swift_bridgeObjectRelease();
    }
  }
  else if (v4)
  {
    id v7 = objc_msgSend(v4, sel_description);
    sub_247CBDD98();
  }
  swift_bridgeObjectRetain();
  sub_247CBDE68();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_247C96940()
{
  return sub_247B8C52C();
}

unint64_t sub_247C96980(uint64_t a1)
{
  unint64_t result = sub_247C969A8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247C969A8()
{
  unint64_t result = qword_2692AE1A8;
  if (!qword_2692AE1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE1A8);
  }
  return result;
}

uint64_t initializeWithCopy for NamedProperty(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  BOOL v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for NamedProperty(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  BOOL v4 = *(void **)(a1 + 16);
  id v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for NamedProperty(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  BOOL v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for NamedProperty(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NamedProperty(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for NamedProperty()
{
  return &type metadata for NamedProperty;
}

ValueMetadata *type metadata accessor for NamedProperty.IntentValueTypeWrapper()
{
  return &type metadata for NamedProperty.IntentValueTypeWrapper;
}

unint64_t sub_247C96BA0()
{
  unint64_t result = qword_2692AE1B0;
  if (!qword_2692AE1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE1B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_20()
{
  return v0;
}

uint64_t sub_247C96C40@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = a3;
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    id v6 = (_OWORD *)(a2 + 56);
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v32 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v9 = *((void *)v6 - 3);
      uint64_t v8 = *((void *)v6 - 2);
      char v10 = *((unsigned char *)v6 - 8);
      long long v35 = *v6;
      if (!v9) {
        break;
      }
      uint64_t v34 = v7;
      uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 16);
      swift_retain();
      uint64_t v12 = (void *)v11(v9, v8);
      self;
      uint64_t v13 = swift_dynamicCastObjCClass();
      if (v13)
      {
        if (v10)
        {
          uint64_t v14 = (void *)v13;
          sub_247C8C548();
          id v31 = a1;
          id v15 = objc_msgSend(v14, sel_memberValueType);
          char v16 = sub_247CBE438();

          goto LABEL_15;
        }
      }
      else if ((v10 & 1) == 0)
      {
        sub_247C8C548();
        char v16 = sub_247CBE438();
LABEL_15:

        uint64_t v7 = v34;
        if (v16)
        {
          swift_retain();
          if (swift_isUniquelyReferenced_nonNull_native())
          {
            uint64_t v20 = v32;
          }
          else
          {
            sub_247C84EAC();
            uint64_t v20 = v25;
          }
          unint64_t v22 = *(void *)(v20 + 16);
          unint64_t v21 = *(void *)(v20 + 24);
          if (v22 >= v21 >> 1)
          {
            OUTLINED_FUNCTION_4_21(v21);
            sub_247C84EAC();
            uint64_t v20 = v26;
          }
          *(void *)(v20 + 16) = v22 + 1;
          uint64_t v32 = v20;
          unint64_t v19 = v20 + 40 * v22;
          *(void *)(v19 + 32) = v9;
          goto LABEL_21;
        }
        goto LABEL_22;
      }
      swift_release();

      uint64_t v7 = v34;
LABEL_23:
      id v6 = (_OWORD *)((char *)v6 + 40);
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = a3;
        uint64_t v27 = v32;
        goto LABEL_27;
      }
    }
    swift_retain_n();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_247C84EAC();
      uint64_t v7 = v23;
    }
    unint64_t v18 = *(void *)(v7 + 16);
    unint64_t v17 = *(void *)(v7 + 24);
    if (v18 >= v17 >> 1)
    {
      OUTLINED_FUNCTION_4_21(v17);
      sub_247C84EAC();
      uint64_t v7 = v24;
    }
    *(void *)(v7 + 16) = v18 + 1;
    unint64_t v19 = v7 + 40 * v18;
    *(void *)(v19 + 32) = 0;
LABEL_21:
    *(void *)(v19 + 40) = v8;
    *(unsigned char *)(v19 + 48) = v10;
    *(_OWORD *)(v19 + 56) = v35;
LABEL_22:
    swift_release();
    goto LABEL_23;
  }
  uint64_t v27 = MEMORY[0x263F8EE78];
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v28 = swift_bridgeObjectRetain();
  sub_247C977D0(v28);
  sub_247B8AB98(v27, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t ValueProvider.init(valueProvider:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = &unk_2692AE120;
  *(void *)(a3 + 32) = result;
  return result;
}

uint64_t static ValueProviderBuilder.buildExpression(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(unsigned char *)(a2 + 16) = v2;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v3;
  return swift_retain();
}

void *ValueProvider.init<A>(_:valueProvider:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a1;
  result[5] = a2;
  *(void *)a5 = a3;
  *(void *)(a5 + 8) = a4;
  *(unsigned char *)(a5 + 16) = 0;
  *(void *)(a5 + 24) = &unk_2692AE1C0;
  *(void *)(a5 + 32) = result;
  return result;
}

uint64_t sub_247C9702C(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = *(void *)(a4 - 8);
  uint64_t v7 = swift_task_alloc();
  v5[6] = v7;
  char v10 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v8 = (void *)swift_task_alloc();
  v5[7] = v8;
  *uint64_t v8 = v5;
  v8[1] = sub_247C97168;
  return v10(v7);
}

uint64_t sub_247C97168()
{
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  *id v5 = v4;
  swift_task_dealloc();
  if (!v0)
  {
    uint64_t v8 = v3[5];
    uint64_t v7 = v3[6];
    uint64_t v10 = v3[3];
    uint64_t v9 = v3[4];
    uint64_t v11 = (uint64_t *)v3[2];
    v11[3] = v10;
    v11[4] = *(void *)(*(void *)(v9 + 8) + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 32))(boxed_opaque_existential_1, v7, v10);
  }
  swift_task_dealloc();
  id v6 = *(uint64_t (**)(void))(v4 + 8);
  return v6();
}

void *ValueProvider.init<A>(_:valueProvider:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a1;
  result[5] = a2;
  *(void *)a5 = a3;
  *(void *)(a5 + 8) = a4;
  *(unsigned char *)(a5 + 16) = 1;
  *(void *)(a5 + 24) = &unk_2692AE1D0;
  *(void *)(a5 + 32) = result;
  return result;
}

uint64_t sub_247C97310(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[3] = a1;
  uint64_t v8 = (uint64_t (*)(void))((char *)a2 + *a2);
  id v6 = (void *)swift_task_alloc();
  v5[6] = v6;
  *id v6 = v5;
  v6[1] = sub_247C973E4;
  return v8();
}

uint64_t sub_247C973E4(uint64_t a1)
{
  OUTLINED_FUNCTION_0();
  id v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_1();
  *uint64_t v7 = v6;
  swift_task_dealloc();
  if (!v1)
  {
    uint64_t v9 = v5[5];
    uint64_t v10 = (void *)v5[3];
    v10[3] = sub_247CBE008();
    v5[2] = *(void *)(v9 + 8);
    v10[4] = swift_getWitnessTable();
    *uint64_t v10 = a1;
  }
  uint64_t v8 = *(uint64_t (**)(void))(v6 + 8);
  return v8();
}

uint64_t sub_247C97518()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247C97550()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_247C97588()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_3_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247C978B0;
  uint64_t v3 = OUTLINED_FUNCTION_1_32();
  return v4(v3);
}

uint64_t sub_247C97630()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_3_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_247B68298;
  uint64_t v3 = OUTLINED_FUNCTION_1_32();
  return v4(v3);
}

uint64_t destroy for ValueProvider()
{
  return swift_release();
}

uint64_t initializeWithCopy for ValueProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ValueProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ValueProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for ValueProvider()
{
  return &type metadata for ValueProvider;
}

ValueMetadata *type metadata accessor for ValueProviderBuilder()
{
  return &type metadata for ValueProviderBuilder;
}

void sub_247C977D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v4 + v2 > *(void *)(v3 + 24) >> 1)
  {
    sub_247C84EAC();
    uint64_t v3 = v6;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_247BBA424();
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_1_32()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_4_21@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_247C978F0()
{
  id v1 = objc_msgSend(v0, sel_identifier);
  uint64_t v2 = sub_247CBDD98();
  unint64_t v4 = v3;

  if (sub_247CBDED8())
  {
    unint64_t v5 = sub_247C86734(1uLL, v2, v4);
    uint64_t v2 = MEMORY[0x24C567290](v5);
    unint64_t v4 = v6;
    swift_bridgeObjectRelease();
  }
  if (v2 == 0x494C52556E65704FLL && v4 == 0xED0000746E65746ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v8 = sub_247CBE998();
    swift_bridgeObjectRelease();
    return v8 & 1;
  }
}

uint64_t sub_247C97A08()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  uint64_t result = sub_247CBE058();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_247C97AC4()
{
  sub_247C97BE8(v0 + 16);
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2692ACD00);
  uint64_t v2 = sub_247CBE058();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_247C97B78()
{
  sub_247C97AC4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for CompetingTaskGroup()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_247C97BE8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692ABA98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247C97C48()
{
  sub_247B0B49C(v0, (uint64_t)&v55);
  switch(v58)
  {
    case 1:
      uint64_t v7 = v55;
      sub_247B8ABD0(v55, (uint64_t)v52);
      uint64_t v8 = v53;
      if (v53)
      {
        uint64_t v9 = v54;
        __swift_project_boxed_opaque_existential_1(v52, v53);
        uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v8, v9);
        unint64_t v12 = v11;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
      }
      else
      {
        sub_247C98600((uint64_t)v52);
        unint64_t v12 = 0xE300000000000000;
        uint64_t v10 = 7104878;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
      inited = (__n128 *)swift_initStackObject();
      uint64_t v44 = OUTLINED_FUNCTION_4_22(inited, (__n128)xmmword_247CD1260);
      uint64_t v45 = MEMORY[0x263F8D310];
      v44[2].n128_u64[0] = v46;
      v44[2].n128_u64[1] = v47;
      strcpy((char *)&v44[3], "byIdentifier");
      v44[3].n128_u8[13] = 0;
      v44[3].n128_u16[7] = -5120;
      v48 = (void *)OUTLINED_FUNCTION_2_35((uint64_t)v44);
      v48[11] = v49;
      v48[12] = v10;
      v48[13] = v12;
      v48[15] = v45;
      v48[16] = 0x696669746E656469;
      v48[17] = 0xEF746E756F437265;
      unint64_t v50 = *(void *)(v7 + 16);
      swift_bridgeObjectRelease();
      inited[10].n128_u64[1] = MEMORY[0x263F8D6C8];
      inited[9].n128_u64[0] = v50;
      return sub_247CBDCF8();
    case 2:
      uint64_t v13 = v55;
      uint64_t v14 = v56;
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
      id v15 = (__n128 *)swift_initStackObject();
      char v16 = OUTLINED_FUNCTION_0_27(v15, (__n128)xmmword_247CCDDF0);
      v16[4].n128_u64[1] = MEMORY[0x263F8D310];
      v16[3].n128_u64[0] = 0xD000000000000010;
      v16[3].n128_u64[1] = 0x8000000247CC4140;
      uint64_t v17 = sub_247CBDCF8();
      uint64_t v18 = sub_247C98560(v13, v14);
      swift_bridgeObjectRelease();
      uint64_t v19 = v18;
      return sub_247BB4F54(v19, v17);
    case 3:
      uint64_t v20 = v55;
      uint64_t v21 = v56;
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
      unint64_t v22 = (__n128 *)swift_initStackObject();
      uint64_t v23 = OUTLINED_FUNCTION_4_22(v22, (__n128)xmmword_247CCDDF0);
      unint64_t v24 = MEMORY[0x263F8D310];
      v23[2].n128_u64[0] = v25;
      v23[2].n128_u64[1] = v26;
      v23[4].n128_u64[1] = v24;
      strcpy((char *)&v23[3], "byProperties");
      v23[3].n128_u8[13] = 0;
      v23[3].n128_u16[7] = -5120;
      uint64_t v27 = sub_247CBDCF8();
      uint64_t v28 = sub_247C98560(v20, v21);
      swift_bridgeObjectRelease();
      uint64_t v29 = sub_247BB4F54(v28, v27);
      sub_247B0B1EC((uint64_t)&v57);
      return v29;
    case 4:
      uint64_t v31 = v55;
      uint64_t v30 = v56;
      unint64_t v32 = v57;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
      uint64_t v33 = (__n128 *)swift_initStackObject();
      uint64_t v34 = OUTLINED_FUNCTION_0_27(v33, (__n128)xmmword_247CCBD90);
      v34[3].n128_u64[0] = 0xD000000000000011;
      v34[3].n128_u64[1] = 0x8000000247CC4100;
      v34[4].n128_u64[1] = MEMORY[0x263F8D310];
      v34[5].n128_u64[0] = 0xD000000000000016;
      v34[5].n128_u64[1] = 0x8000000247CC4120;
      if (v32 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_247CBE848();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v35 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v33[7].n128_u64[1] = MEMORY[0x263F8D6C8];
      v33[6].n128_u64[0] = v35;
      uint64_t v17 = sub_247CBDCF8();
      uint64_t v36 = sub_247C98560(v31, v30);
      swift_bridgeObjectRelease();
      uint64_t v19 = v36;
      return sub_247BB4F54(v19, v17);
    case 5:
      uint64_t v1 = v55;
      uint64_t v2 = v56;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
      uint64_t v38 = (__n128 *)swift_initStackObject();
      unint64_t v4 = OUTLINED_FUNCTION_0_27(v38, (__n128)xmmword_247CCBD90);
      unint64_t v5 = 0xD000000000000011;
      unint64_t v6 = 0x8000000247CC3170;
      goto LABEL_13;
    case 6:
      uint64_t v1 = v55;
      uint64_t v2 = v56;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
      uint64_t v39 = (__n128 *)swift_initStackObject();
      unint64_t v4 = OUTLINED_FUNCTION_0_27(v39, (__n128)xmmword_247CCBD90);
      unint64_t v5 = 0x6E45657571696E75;
      unint64_t v6 = 0xEC00000079746974;
      goto LABEL_13;
    default:
      uint64_t v1 = v55;
      uint64_t v2 = v56;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
      unint64_t v3 = (__n128 *)swift_initStackObject();
      unint64_t v4 = OUTLINED_FUNCTION_0_27(v3, (__n128)xmmword_247CCBD90);
      unint64_t v5 = 0x7469746E456C6C61;
      unint64_t v6 = 0xEB00000000736569;
LABEL_13:
      v4[3].n128_u64[0] = v5;
      v4[3].n128_u64[1] = v6;
      OUTLINED_FUNCTION_3_29();
      v40[9] = v41;
      v40[10] = v42;
      v40[15] = v41;
      v40[11] = 0xEA00000000006570;
      v40[12] = v1;
      v40[13] = v2;
      return sub_247CBDCF8();
  }
}

uint64_t sub_247C98174(unint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
  inited = (__n128 *)swift_initStackObject();
  unint64_t v3 = OUTLINED_FUNCTION_1_33(inited, (__n128)xmmword_247CD1260);
  unint64_t v4 = a1[8];
  unint64_t v5 = MEMORY[0x263F8D310];
  v3[3].n128_u64[0] = a1[7];
  v3[3].n128_u64[1] = v4;
  uint64_t v6 = OUTLINED_FUNCTION_2_35((uint64_t)v3);
  *(void *)(v6 + 88) = v7;
  uint64_t v8 = a1[5];
  unint64_t v9 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v8);
  uint64_t v10 = *(uint64_t (**)(uint64_t, unint64_t))(v9 + 16);
  swift_bridgeObjectRetain();
  inited[6].n128_u64[0] = v10(v8, v9);
  inited[6].n128_u64[1] = v11;
  inited[7].n128_u64[1] = v5;
  inited[8].n128_u64[0] = 0x79747265706F7270;
  inited[8].n128_u64[1] = 0xE800000000000000;
  unint64_t v13 = *a1;
  unint64_t v12 = a1[1];
  inited[10].n128_u64[1] = v5;
  inited[9].n128_u64[0] = v13;
  inited[9].n128_u64[1] = v12;
  swift_bridgeObjectRetain();
  sub_247CBDCF8();
  sub_247B76994();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247C9829C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
  inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_1_33(inited, (__n128)xmmword_247CD1260);
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v3);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v4 + 8))(v24, v3, v4);
  unint64_t v5 = v24[0];
  unint64_t v6 = v24[1];
  sub_247AD9418(v24[2], v24[3]);
  unint64_t v7 = MEMORY[0x263F8D310];
  inited[3].n128_u64[0] = v5;
  inited[3].n128_u64[1] = v6;
  inited[4].n128_u64[1] = v7;
  inited[5].n128_u64[0] = 0x6E6F69746361;
  inited[5].n128_u64[1] = 0xE600000000000000;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  uint64_t v8 = OUTLINED_FUNCTION_5_17();
  inited[6].n128_u64[0] = v9(v8);
  inited[6].n128_u64[1] = v10;
  inited[7].n128_u64[1] = v7;
  inited[8].n128_u64[0] = 0x6574656D61726170;
  inited[8].n128_u64[1] = 0xEA00000000007372;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  uint64_t v11 = OUTLINED_FUNCTION_5_17();
  uint64_t v13 = v12(v11);
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    unint64_t v23 = MEMORY[0x263F8EE78];
    sub_247BBAB18();
    unint64_t v15 = v23;
    char v16 = (uint64_t *)(v13 + 40);
    do
    {
      uint64_t v18 = *(v16 - 1);
      uint64_t v17 = *v16;
      unint64_t v19 = *(void *)(v23 + 16);
      unint64_t v20 = *(void *)(v23 + 24);
      swift_bridgeObjectRetain();
      if (v19 >= v20 >> 1) {
        sub_247BBAB18();
      }
      v16 += 5;
      *(void *)(v23 + 16) = v19 + 1;
      unint64_t v21 = v23 + 16 * v19;
      *(void *)(v21 + 32) = v18;
      *(void *)(v21 + 40) = v17;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v15 = MEMORY[0x263F8EE78];
  }
  inited[10].n128_u64[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA4C0);
  inited[9].n128_u64[0] = v15;
  return sub_247CBDCF8();
}

uint64_t sub_247C984BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247C97C48();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
  inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_1_33(inited, (__n128)xmmword_247CCDDF0);
  unint64_t v5 = *v1;
  unint64_t v4 = v1[1];
  inited[4].n128_u64[1] = MEMORY[0x263F8D310];
  inited[3].n128_u64[0] = v5;
  inited[3].n128_u64[1] = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_247CBDCF8();
  return sub_247BB4F54(v6, v2);
}

uint64_t sub_247C98560(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AADC8);
  *(_OWORD *)(swift_initStackObject() + 16) = xmmword_247CCDDF0;
  OUTLINED_FUNCTION_3_29();
  void v4[4] = v5;
  v4[5] = 0xEA00000000006570;
  v4[9] = MEMORY[0x263F8D310];
  v4[6] = a1;
  v4[7] = a2;
  swift_bridgeObjectRetain();
  return sub_247CBDCF8();
}

uint64_t sub_247C98600(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692ABC60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 *OUTLINED_FUNCTION_0_27(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 1684957547;
  result[2].n128_u64[1] = 0xE400000000000000;
  return result;
}

__n128 *OUTLINED_FUNCTION_1_33(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 7368801;
  result[2].n128_u64[1] = 0xE300000000000000;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_35(uint64_t result)
{
  *(void *)(result + 72) = v1;
  *(void *)(result + 80) = 0x7954797469746E65;
  return result;
}

__n128 *OUTLINED_FUNCTION_4_22(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_17()
{
  return v0;
}

__n128 DeferredEntityPropertySpecification.init(propertyIdentifier:entityIdentifier:app:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, __n128 *a4@<X3>, uint64_t a5@<X8>)
{
  __n128 v9 = *a4;
  unint64_t v6 = a4[1].n128_u64[0];
  unint64_t v7 = a4[1].n128_u64[1];
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  sub_247AD94B8(a3, a5 + 16);
  __n128 result = v9;
  *(__n128 *)(a5 + 56) = v9;
  *(void *)(a5 + 72) = v6;
  *(void *)(a5 + 80) = v7;
  return result;
}

__n128 DeferredEntityPropertySpecification.init(propertyIdentifier:entityType:entityInstance:app:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X6>, uint64_t a4@<X8>)
{
  __n128 v10 = *a3;
  unint64_t v5 = a3[1].n128_u64[0];
  unint64_t v6 = a3[1].n128_u64[1];
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  id v7 = objc_allocWithZone(MEMORY[0x263F51BB8]);
  id v8 = sub_247BA5018();
  *(void *)(a4 + 40) = sub_247BA039C();
  *(void *)(a4 + 48) = sub_247B0B250();
  *(void *)(a4 + 16) = v8;
  __n128 result = v10;
  *(__n128 *)(a4 + 56) = v10;
  *(void *)(a4 + 72) = v5;
  *(void *)(a4 + 80) = v6;
  return result;
}

uint64_t sub_247C987F8(char *a1)
{
  uint64_t v2 = v1;
  char v3 = *a1;
  sub_247CBE638();
  sub_247CBDE68();
  swift_bridgeObjectRetain();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), *(void *)(v2 + 40));
  uint64_t v4 = OUTLINED_FUNCTION_0_28();
  v5(v4);
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), *(void *)(v2 + 40));
  uint64_t v6 = OUTLINED_FUNCTION_0_28();
  uint64_t v8 = v7(v6);
  sub_247AD73AC(v8, v9, v3);
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  swift_bridgeObjectRetain();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  return 0;
}

unint64_t sub_247C989D0(uint64_t a1)
{
  unint64_t result = sub_247C989F8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247C989F8()
{
  unint64_t result = qword_2692AE258;
  if (!qword_2692AE258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE258);
  }
  return result;
}

uint64_t destroy for DeferredEntityPropertySpecification(uint64_t a1)
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 80);
  if ((unint64_t)(result - 1) >= 2)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for DeferredEntityPropertySpecification(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  v8(a1 + 16, v5, v7);
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  __n128 v10 = (_OWORD *)(a2 + 72);
  uint64_t v11 = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  if (v11 == 1 || v11 == 2)
  {
    *(_OWORD *)(a1 + 72) = *v10;
  }
  else
  {
    *(void *)(a1 + 72) = *(void *)v10;
    *(void *)(a1 + 80) = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for DeferredEntityPropertySpecification(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1[10];
  uint64_t v5 = a2[10];
  if (v4 == 2)
  {
    if (v5 != 1 && v5 != 2) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if (v5 == 2)
  {
    sub_247B68690((uint64_t)(a1 + 9));
    goto LABEL_12;
  }
  if (v4 != 1)
  {
    if (v5 != 1)
    {
      a1[9] = a2[9];
      a1[10] = a2[10];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_247BE903C((uint64_t)(a1 + 9));
    goto LABEL_12;
  }
  if (v5 == 1)
  {
LABEL_12:
    *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
    return a1;
  }
LABEL_9:
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithTake for DeferredEntityPropertySpecification(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  long long v6 = (void *)(a2 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  if (v7 != 2)
  {
    uint64_t v8 = *(void *)(a2 + 80);
    if (v8 == 2)
    {
      sub_247B68690(a1 + 72);
    }
    else if (v7 != 1)
    {
      if (v8 != 1)
      {
        *(void *)(a1 + 72) = *v6;
        *(void *)(a1 + 80) = v8;
        swift_bridgeObjectRelease();
        return a1;
      }
      sub_247BE903C(a1 + 72);
    }
  }
  *(_OWORD *)(a1 + 72) = *(_OWORD *)v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for DeferredEntityPropertySpecification(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeferredEntityPropertySpecification(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeferredEntityPropertySpecification()
{
  return &type metadata for DeferredEntityPropertySpecification;
}

uint64_t OUTLINED_FUNCTION_0_28()
{
  return v0;
}

uint64_t sub_247C98E20()
{
  uint64_t v0 = type metadata accessor for AppIntentsProtobuf_Action(0);
  if (OUTLINED_FUNCTION_284_0(*(int *)(v0 + 40))) {
    OUTLINED_FUNCTION_281_0();
  }
  else {
    OUTLINED_FUNCTION_280_0();
  }
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_47();
}

uint64_t sub_247C98E64(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AppIntentsProtobuf_Action(0);
  uint64_t result = OUTLINED_FUNCTION_278_0();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

BOOL sub_247C98EA4()
{
  uint64_t v0 = type metadata accessor for AppIntentsProtobuf_Action(0);
  return OUTLINED_FUNCTION_88_3(*(int *)(v0 + 40));
}

uint64_t sub_247C98EC8()
{
  OUTLINED_FUNCTION_135_3();
  if (v0[8]) {
    return 0;
  }
  else {
    return *(void *)v0;
  }
}

uint64_t sub_247C98EF0(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_135_3();
  *(void *)uint64_t v3 = a1;
  *(unsigned char *)(v3 + 8) = 0;
  return result;
}

BOOL sub_247C98F1C()
{
  OUTLINED_FUNCTION_135_3();
  return (*(unsigned char *)(v0 + 8) & 1) == 0;
}

uint64_t sub_247C98F40()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
  uint64_t v2 = OUTLINED_FUNCTION_2_3(v1);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_Action(0);
  sub_247CAC68C(v0 + *(int *)(v5 + 52), (uint64_t)v4, &qword_2692AA9E0);
  uint64_t v6 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
  uint64_t v7 = OUTLINED_FUNCTION_8_0((uint64_t)v4, 1, v6);
  if (!v9) {
    return OUTLINED_FUNCTION_82_3(v7, v8, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
  }
  OUTLINED_FUNCTION_89_3((__n128)xmmword_247CCBE60);
  return sub_247ACB4EC((uint64_t)v4, &qword_2692AA9E0);
}

uint64_t sub_247C99028()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for AppIntentsProtobuf_Action(0) + 52);
  sub_247ACB4EC(v1, &qword_2692AA9E0);
  uint64_t v2 = OUTLINED_FUNCTION_47();
  sub_247CAC504(v2, v3, v4);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v5);
}

BOOL sub_247C990AC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
  uint64_t v1 = OUTLINED_FUNCTION_2_3(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = v3 - v2;
  type metadata accessor for AppIntentsProtobuf_Action(0);
  OUTLINED_FUNCTION_802();
  sub_247CAC68C(v5, v6, v7);
  uint64_t v8 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
  BOOL v9 = __swift_getEnumTagSinglePayload(v4, 1, v8) != 1;
  sub_247ACB4EC(v4, &qword_2692AA9E0);
  return v9;
}

uint64_t sub_247C9915C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9C8);
  uint64_t v3 = OUTLINED_FUNCTION_2_3(v2);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_20_17();
  OUTLINED_FUNCTION_86_1();
  OUTLINED_FUNCTION_70_3();
  uint64_t v6 = type metadata accessor for AppIntentsProtobuf_ConfirmationActionName(0);
  uint64_t v7 = OUTLINED_FUNCTION_8_0((uint64_t)v5, 1, v6);
  if (!v9) {
    return OUTLINED_FUNCTION_82_3(v7, v8, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v10;
  sub_247CBD3F8();
  uint64_t v11 = (void *)((char *)a1 + *(int *)(v6 + 28));
  *uint64_t v11 = 0;
  v11[1] = 0;
  OUTLINED_FUNCTION_229_1(*(int *)(v6 + 32));
  return sub_247ACB4EC((uint64_t)v5, &qword_2692AA9C8);
}

void sub_247C9926C()
{
}

BOOL sub_247C992A8()
{
  return sub_247C99444(&qword_2692AA9C8, &OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__confirmationActionName, type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
}

uint64_t sub_247C992D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9C0);
  uint64_t v3 = OUTLINED_FUNCTION_2_3(v2);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_20_17();
  OUTLINED_FUNCTION_86_1();
  OUTLINED_FUNCTION_70_3();
  uint64_t v6 = type metadata accessor for AppIntentsProtobuf_Dialog(0);
  uint64_t v7 = OUTLINED_FUNCTION_8_0((uint64_t)v5, 1, v6);
  if (!v9) {
    return OUTLINED_FUNCTION_82_3(v7, v8, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Dialog);
  }
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  sub_247CBD3F8();
  uint64_t v10 = (void *)(a1 + *(int *)(v6 + 24));
  *uint64_t v10 = 0;
  v10[1] = 0;
  OUTLINED_FUNCTION_229_1(*(int *)(v6 + 28));
  return sub_247ACB4EC((uint64_t)v5, &qword_2692AA9C0);
}

void sub_247C993E0()
{
}

BOOL sub_247C9941C()
{
  return sub_247C99444(&qword_2692AA9C0, &OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__dialog, type metadata accessor for AppIntentsProtobuf_Dialog);
}

BOOL sub_247C99444(uint64_t *a1, void *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v7 = OUTLINED_FUNCTION_2_3(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  uint64_t v10 = v9 - v8;
  OUTLINED_FUNCTION_20_17();
  uint64_t v12 = v11 + *a2;
  OUTLINED_FUNCTION_86_1();
  sub_247CAC68C(v12, v10, a1);
  uint64_t v13 = a3(0);
  BOOL v14 = __swift_getEnumTagSinglePayload(v10, 1, v13) != 1;
  sub_247ACB4EC(v10, a1);
  return v14;
}

uint64_t sub_247C99514@<X0>(void *a1@<X8>)
{
  return sub_247C99590(a1);
}

void sub_247C99520()
{
}

BOOL sub_247C9955C()
{
  return sub_247C99444(&qword_2692AA9B8, &OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__nextAction, type metadata accessor for AppIntentsProtobuf_Action);
}

uint64_t sub_247C99584@<X0>(void *a1@<X8>)
{
  return sub_247C99590(a1);
}

uint64_t sub_247C99590@<X0>(void *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9B8);
  uint64_t v3 = OUTLINED_FUNCTION_2_3(v2);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_20_17();
  OUTLINED_FUNCTION_86_1();
  uint64_t v6 = OUTLINED_FUNCTION_116_2();
  sub_247CAC68C(v6, v7, &qword_2692AA9B8);
  uint64_t v8 = type metadata accessor for AppIntentsProtobuf_Action(0);
  uint64_t v9 = OUTLINED_FUNCTION_8_0((uint64_t)v5, 1, v8);
  if (!v11) {
    return OUTLINED_FUNCTION_82_3(v9, v10, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
  }
  sub_247C9A2B8(a1);
  return sub_247ACB4EC((uint64_t)v5, &qword_2692AA9B8);
}

void sub_247C99688()
{
}

BOOL sub_247C996C4()
{
  return sub_247C99444(&qword_2692AA9B8, &OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputAction, type metadata accessor for AppIntentsProtobuf_Action);
}

uint64_t sub_247C996EC()
{
  OUTLINED_FUNCTION_20_17();
  uint64_t v1 = (unsigned char *)(v0
               + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputActionOptions);
  OUTLINED_FUNCTION_86_1();
  if (v1[8]) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t sub_247C9973C(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for AppIntentsProtobuf_ActionOutput(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_65_2();
    swift_retain();
    sub_247C9C44C();
    *(void *)(v1 + v3) = v4;
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v3)
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputActionOptions;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = 0;
  return result;
}

BOOL sub_247C997E8()
{
  OUTLINED_FUNCTION_20_17();
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputActionOptions;
  OUTLINED_FUNCTION_86_1();
  return (*(unsigned char *)(v1 + 8) & 1) == 0;
}

uint64_t sub_247C99834@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9B0);
  uint64_t v3 = OUTLINED_FUNCTION_2_3(v2);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_20_17();
  OUTLINED_FUNCTION_86_1();
  OUTLINED_FUNCTION_70_3();
  uint64_t v6 = (int *)type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  uint64_t v7 = OUTLINED_FUNCTION_8_0((uint64_t)v5, 1, (uint64_t)v6);
  if (!v9) {
    return OUTLINED_FUNCTION_82_3(v7, v8, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
  }
  OUTLINED_FUNCTION_89_3((__n128)xmmword_247CCBE60);
  uint64_t v10 = (void *)(a1 + v6[6]);
  *uint64_t v10 = 0;
  v10[1] = 0;
  char v11 = (void *)(a1 + v6[7]);
  *char v11 = 0;
  v11[1] = 0;
  OUTLINED_FUNCTION_229_1(v6[8]);
  *(_OWORD *)(a1 + v6[9]) = xmmword_247CCBE70;
  return sub_247ACB4EC((uint64_t)v5, &qword_2692AA9B0);
}

void sub_247C99954()
{
}

BOOL sub_247C99990()
{
  return sub_247C99444(&qword_2692AA9B0, &OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__viewSnippet, type metadata accessor for AppIntentsProtobuf_ViewSnippet);
}

uint64_t sub_247C999B8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
  uint64_t v1 = OUTLINED_FUNCTION_2_3(v0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_20_17();
  OUTLINED_FUNCTION_86_1();
  OUTLINED_FUNCTION_70_3();
  uint64_t v4 = type metadata accessor for AppIntentsProtobuf_Value(0);
  uint64_t v5 = OUTLINED_FUNCTION_8_0((uint64_t)v3, 1, v4);
  if (!v7) {
    return OUTLINED_FUNCTION_82_3(v5, v6, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
  }
  OUTLINED_FUNCTION_89_3((__n128)xmmword_247CCBE60);
  return sub_247ACB4EC((uint64_t)v3, &qword_2692AA920);
}

void sub_247C99AA8()
{
}

void sub_247C99AE4()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(v5);
  uint64_t v10 = OUTLINED_FUNCTION_2_3(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_113();
  uint64_t v13 = v11 - v12;
  MEMORY[0x270FA5388](v14);
  char v16 = (char *)&v23 - v15;
  uint64_t v17 = *(int *)(type metadata accessor for AppIntentsProtobuf_ActionOutput(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_65_2();
    unint64_t v23 = v6;
    swift_retain();
    uint64_t v6 = v23;
    sub_247C9C44C();
    *(void *)(v0 + v17) = v18;
    swift_release();
  }
  sub_247CAC504(v8, (uint64_t)v16, v4);
  uint64_t v19 = v2(0);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v19);
  sub_247B0B4F8((uint64_t)v16, v13, v6);
  OUTLINED_FUNCTION_717();
  swift_retain();
  OUTLINED_FUNCTION_802();
  sub_247CAC558(v20, v21, v22);
  swift_endAccess();
  swift_release();
  OUTLINED_FUNCTION_64();
}

BOOL sub_247C99C70()
{
  return sub_247C99444(&qword_2692AA920, &OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__value, type metadata accessor for AppIntentsProtobuf_Value);
}

uint64_t sub_247C99C98()
{
  uint64_t v0 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  if (OUTLINED_FUNCTION_284_0(*(int *)(v0 + 24))) {
    OUTLINED_FUNCTION_281_0();
  }
  else {
    OUTLINED_FUNCTION_280_0();
  }
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_47();
}

uint64_t sub_247C99CDC()
{
  OUTLINED_FUNCTION_99_4();
  uint64_t result = OUTLINED_FUNCTION_278_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

BOOL sub_247C99D10()
{
  uint64_t v0 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  return OUTLINED_FUNCTION_88_3(*(int *)(v0 + 24));
}

uint64_t sub_247C99D34()
{
  uint64_t v0 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  if (OUTLINED_FUNCTION_284_0(*(int *)(v0 + 28))) {
    OUTLINED_FUNCTION_281_0();
  }
  else {
    OUTLINED_FUNCTION_280_0();
  }
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_47();
}

uint64_t sub_247C99D78()
{
  OUTLINED_FUNCTION_99_4();
  uint64_t result = OUTLINED_FUNCTION_278_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

BOOL sub_247C99DAC()
{
  uint64_t v0 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  return OUTLINED_FUNCTION_88_3(*(int *)(v0 + 28));
}

uint64_t sub_247C99DD0()
{
  uint64_t v0 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  if (OUTLINED_FUNCTION_284_0(*(int *)(v0 + 32))) {
    OUTLINED_FUNCTION_281_0();
  }
  else {
    OUTLINED_FUNCTION_280_0();
  }
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_47();
}

uint64_t sub_247C99E14()
{
  OUTLINED_FUNCTION_99_4();
  uint64_t result = OUTLINED_FUNCTION_278_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

BOOL sub_247C99E48()
{
  uint64_t v0 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  return OUTLINED_FUNCTION_88_3(*(int *)(v0 + 32));
}

uint64_t sub_247C99E6C@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  return sub_247CBD3F8();
}

uint64_t sub_247C99EA4@<X0>(void (*a1)(void)@<X0>, _OWORD *a2@<X8>)
{
  *a2 = xmmword_247CCBE60;
  a1(0);
  return sub_247CBD3F8();
}

uint64_t sub_247C99EEC@<X0>(void *a1@<X8>)
{
  OUTLINED_FUNCTION_95_4(a1);
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = v2;
  type metadata accessor for AppIntentsProtobuf_EntityIdentifier(0);
  return sub_247CBD3F8();
}

void sub_247C99F24(void *a1@<X8>)
{
  uint64_t v2 = OUTLINED_FUNCTION_444_0(a1);
  type metadata accessor for AppIntentsProtobuf_NotificationTopic(v2);
  OUTLINED_FUNCTION_161_1();
  OUTLINED_FUNCTION_229_1(*(int *)(v1 + 24));
}

uint64_t sub_247C99F54@<X0>(uint64_t a1@<X8>)
{
  sub_247CBD3F8();
  uint64_t v2 = *(int *)(type metadata accessor for AppIntentsProtobuf_ActionOutput(0) + 20);
  if (qword_2692A9D80 != -1) {
    swift_once();
  }
  *(void *)(a1 + v2) = qword_2692AE260;
  return swift_retain();
}

void sub_247C99FD0(void *a1@<X8>)
{
  uint64_t v1 = OUTLINED_FUNCTION_444_0(a1);
  type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata(v1);
  OUTLINED_FUNCTION_161_1();
  OUTLINED_FUNCTION_45_7();
}

void sub_247C99FFC(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  type metadata accessor for AppIntentsProtobuf_Dialog(0);
  OUTLINED_FUNCTION_161_1();
  OUTLINED_FUNCTION_45_7();
}

uint64_t sub_247C9A038@<X0>(void *a1@<X8>)
{
  OUTLINED_FUNCTION_95_4(a1);
  *(void *)(v1 + 16) = MEMORY[0x263F8EE78];
  type metadata accessor for AppIntentsProtobuf_DisplayRepresentation(0);
  OUTLINED_FUNCTION_102_2();
  uint64_t v3 = (void *)(v1 + *(int *)(v2 + 28));
  *uint64_t v3 = 0;
  v3[1] = 0;
  uint64_t v4 = OUTLINED_FUNCTION_300_0();
  type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(v4);
  uint64_t v5 = OUTLINED_FUNCTION_54_2();
  return __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
}

uint64_t sub_247C9A09C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  *a1 = 0;
  a1[1] = v3;
  type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage(0);
  OUTLINED_FUNCTION_102_2();
  uint64_t v4 = (uint64_t)a1 + *(int *)(v1 + 28);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_UUID(0);
  uint64_t result = OUTLINED_FUNCTION_90_3(v4, v6, v7, v5);
  *((unsigned char *)a1 + *(int *)(v1 + 32)) = 2;
  return result;
}

BOOL sub_247C9A118(BOOL result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

void sub_247C9A12C()
{
  qword_2692C8138 = (uint64_t)&unk_26FBF6F48;
}

uint64_t *sub_247C9A140()
{
  if (qword_2692A9D58 != -1) {
    swift_once();
  }
  return &qword_2692C8138;
}

uint64_t sub_247C9A18C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247C9A4E0(a1, a2, a3, (uint64_t (*)(void))sub_247C9A104);
}

BOOL sub_247C9A1A4()
{
  return sub_247C9A118(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_247C9A1B0@<X0>(void *a1@<X8>)
{
  sub_247C9A140();
  *a1 = qword_2692C8138;
  return swift_bridgeObjectRetain();
}

uint64_t sub_247C9A1F0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_247C9A564(a1, a2, a3, (uint64_t (*)(void))sub_247C9A104);
}

BOOL sub_247C9A208@<W0>(BOOL *a1@<X8>)
{
  BOOL result = sub_247C9A118(*(void *)v1, *(unsigned char *)(v1 + 8));
  *a1 = result;
  return result;
}

uint64_t sub_247C9A238()
{
  return sub_247AC9944(*(void *)v0, *(unsigned __int8 *)(v0 + 8));
}

uint64_t sub_247C9A244(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_247CAC59C();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_247C9A290(uint64_t a1)
{
  return sub_247AC9CC4(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8));
}

uint64_t sub_247C9A29C(uint64_t a1, uint64_t a2)
{
  return sub_247B656AC(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *(void *)a2, *(unsigned __int8 *)(a2 + 8));
}

uint64_t sub_247C9A2B8@<X0>(void *a1@<X8>)
{
  OUTLINED_FUNCTION_95_4(a1);
  uint64_t v2 = MEMORY[0x263F8EE78];
  v1[2] = MEMORY[0x263F8EE78];
  v1[3] = 0;
  v1[4] = v3;
  v1[5] = v2;
  unint64_t v4 = (int *)type metadata accessor for AppIntentsProtobuf_Action(0);
  sub_247CBD3F8();
  uint64_t v5 = (char *)v1 + v4[9];
  *(void *)uint64_t v5 = 0;
  *((_WORD *)v5 + 4) = 256;
  OUTLINED_FUNCTION_229_1(v4[10]);
  *((unsigned char *)v1 + v4[11]) = 2;
  OUTLINED_FUNCTION_72_3(v4[12]);
  uint64_t v6 = OUTLINED_FUNCTION_300_0();
  type metadata accessor for AppIntentsProtobuf_ValueType(v6);
  uint64_t v7 = OUTLINED_FUNCTION_54_2();
  return __swift_storeEnumTagSinglePayload(v7, v8, v9, v10);
}

uint64_t sub_247C9A350()
{
  uint64_t v1 = *(int *)(type metadata accessor for AppIntentsProtobuf_ActionOutput(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_65_2();
    swift_retain();
    sub_247C9C44C();
    *(void *)(v0 + v1) = v2;
    swift_release();
  }
  return swift_retain();
}

void sub_247C9A3D0(void *a1@<X8>)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v3;
  type metadata accessor for AppIntentsProtobuf_ConfirmationActionName(0);
  OUTLINED_FUNCTION_102_2();
  unint64_t v4 = (void *)((char *)a1 + *(int *)(v1 + 28));
  *unint64_t v4 = 0;
  v4[1] = 0;
  OUTLINED_FUNCTION_229_1(*(int *)(v1 + 32));
}

double sub_247C9A41C@<D0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_247CCBE60;
  type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  OUTLINED_FUNCTION_161_1();
  OUTLINED_FUNCTION_45_7();
  OUTLINED_FUNCTION_122_3();
  double result = 0.0;
  *(_OWORD *)((char *)a1 + v3) = xmmword_247CCBE70;
  return result;
}

void sub_247C9A468()
{
  qword_2692C8140 = (uint64_t)&unk_26FBF7018;
}

uint64_t *sub_247C9A47C()
{
  if (qword_2692A9D60 != -1) {
    swift_once();
  }
  return &qword_2692C8140;
}

uint64_t sub_247C9A4C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247C9A4E0(a1, a2, a3, (uint64_t (*)(void))sub_247CB1CFC);
}

uint64_t sub_247C9A4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  return OUTLINED_FUNCTION_120_3(v4, v5);
}

uint64_t sub_247C9A50C@<X0>(void *a1@<X8>)
{
  sub_247C9A47C();
  *a1 = qword_2692C8140;
  return swift_bridgeObjectRetain();
}

uint64_t sub_247C9A54C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_247C9A564(a1, a2, a3, (uint64_t (*)(void))sub_247CB1CFC);
}

uint64_t sub_247C9A564(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4(*a1);
  return OUTLINED_FUNCTION_120_3(v4, v5);
}

uint64_t sub_247C9A594()
{
  return sub_247AC9964(*(void *)v0, *(unsigned __int8 *)(v0 + 8));
}

uint64_t sub_247C9A5A0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_247CAC640();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_247C9A5EC(uint64_t a1)
{
  return sub_247AC9CA4(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8));
}

void sub_247C9A5F8(uint64_t a1@<X8>)
{
  sub_247CBD3F8();
  uint64_t v2 = type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
  *(_OWORD *)(a1 + *(int *)(v2 + 20)) = xmmword_247CCBE70;
  OUTLINED_FUNCTION_72_3(*(int *)(v2 + 24));
  uint64_t v4 = a1 + *(int *)(v3 + 28);
  *(void *)uint64_t v4 = 0;
  *(unsigned char *)(v4 + 8) = v5;
}

uint64_t sub_247C9A64C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = OUTLINED_FUNCTION_444_0(a1);
  type metadata accessor for AppIntentsProtobuf_FileDescriptor(v3);
  OUTLINED_FUNCTION_161_1();
  uint64_t v4 = (void *)(v1 + *(int *)(v2 + 24));
  *uint64_t v4 = 0;
  v4[1] = 0;
  OUTLINED_FUNCTION_72_3(*(int *)(v2 + 28));
  OUTLINED_FUNCTION_122_3();
  uint64_t v5 = OUTLINED_FUNCTION_300_0();
  type metadata accessor for AppIntentsProtobuf_Error(v5);
  uint64_t v6 = OUTLINED_FUNCTION_54_2();
  return __swift_storeEnumTagSinglePayload(v6, v7, v8, v9);
}

uint64_t sub_247C9A6A8@<X0>(void *a1@<X8>)
{
  uint64_t v1 = OUTLINED_FUNCTION_444_0(a1);
  type metadata accessor for AppIntentsProtobuf_Property(v1);
  OUTLINED_FUNCTION_161_1();
  uint64_t v2 = OUTLINED_FUNCTION_300_0();
  type metadata accessor for AppIntentsProtobuf_Value(v2);
  uint64_t v3 = OUTLINED_FUNCTION_54_2();
  return __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
}

uint64_t sub_247C9A6F0@<X0>(void *a1@<X8>)
{
  uint64_t v1 = OUTLINED_FUNCTION_444_0(a1);
  v2(v1);
  return sub_247CBD3F8();
}

uint64_t sub_247C9A728()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8148);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8148);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CD8D30;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "identifier";
  *(void *)(v6 + 8) = 10;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "parameters";
  *(void *)(v10 + 8) = 10;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "bundleIdentifier";
  *((void *)v12 + 1) = 16;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 4;
  *(void *)uint64_t v14 = "kind";
  *((void *)v14 + 1) = 4;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  char v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)char v16 = "mangledTypeName";
  *((void *)v16 + 1) = 15;
  v16[16] = 2;
  v9();
  uint64_t v17 = (void *)(v5 + 5 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 6;
  *(void *)uint64_t v18 = "openAppWhenRun";
  *((void *)v18 + 1) = 14;
  v18[16] = 2;
  v9();
  uint64_t v19 = (void *)(v5 + 6 * v2);
  uint64_t v20 = (char *)v19 + v1[14];
  *uint64_t v19 = 7;
  *(void *)uint64_t v20 = "outputFlags";
  *((void *)v20 + 1) = 11;
  v20[16] = 2;
  v9();
  uint64_t v21 = (void *)(v5 + 7 * v2);
  unint64_t v22 = (char *)v21 + v1[14];
  *uint64_t v21 = 8;
  *(void *)unint64_t v22 = "outputType";
  *((void *)v22 + 1) = 10;
  v22[16] = 2;
  v9();
  unint64_t v23 = (void *)(v5 + 8 * v2);
  unint64_t v24 = (char *)v23 + v1[14];
  *unint64_t v23 = 9;
  *(void *)unint64_t v24 = "systemProtocols";
  *((void *)v24 + 1) = 15;
  v24[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247C9AA94()
{
  uint64_t result = OUTLINED_FUNCTION_19_11();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 3:
          sub_247CBD598();
          break;
        case 2:
          OUTLINED_FUNCTION_6_15();
          sub_247C9ABB8();
          break;
        case 4:
          OUTLINED_FUNCTION_6_15();
          sub_247C9AC54();
          break;
        case 5:
          OUTLINED_FUNCTION_6_15();
          sub_247C9ACCC();
          break;
        case 6:
          OUTLINED_FUNCTION_6_15();
          sub_247C9AD30();
          break;
        case 7:
          OUTLINED_FUNCTION_6_15();
          sub_247C9AD94();
          break;
        case 8:
          OUTLINED_FUNCTION_6_15();
          sub_247C9ADF8();
          break;
        case 9:
          OUTLINED_FUNCTION_6_15();
          sub_247C9AEA8();
          break;
        default:
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_153_2();
    }
  }
  return result;
}

uint64_t sub_247C9ABB8()
{
  return sub_247CBD5C8();
}

uint64_t sub_247C9AC54()
{
  return sub_247CBD4F8();
}

uint64_t sub_247C9ACCC()
{
  return sub_247CBD588();
}

uint64_t sub_247C9AD30()
{
  return sub_247CBD4D8();
}

uint64_t sub_247C9AD94()
{
  return sub_247CBD538();
}

uint64_t sub_247C9ADF8()
{
  return sub_247CBD5E8();
}

uint64_t sub_247C9AEA8()
{
  return sub_247CBD5C8();
}

uint64_t sub_247C9AF44()
{
  OUTLINED_FUNCTION_67_5();
  OUTLINED_FUNCTION_20_10();
  if (!v2 || (uint64_t result = OUTLINED_FUNCTION_158_2(), !v0))
  {
    if (!*(void *)(*(void *)(v1 + 16) + 16)
      || (uint64_t v4 = type metadata accessor for AppIntentsProtobuf_Property(0),
          sub_247CAAE6C((unint64_t *)&dword_2692AA948, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Property), uint64_t v5 = OUTLINED_FUNCTION_306_0(), result = OUTLINED_FUNCTION_364_0(v5, 2, v4, v6), !v0))
    {
      OUTLINED_FUNCTION_20_10();
      if (!v7 || (uint64_t result = OUTLINED_FUNCTION_158_2(), !v0))
      {
        OUTLINED_FUNCTION_8_19();
        uint64_t result = sub_247C9B124(v8);
        if (!v0)
        {
          OUTLINED_FUNCTION_8_19();
          sub_247C9B1C8(v9);
          OUTLINED_FUNCTION_8_19();
          sub_247C9B240(v10);
          OUTLINED_FUNCTION_8_19();
          sub_247C9B2B8(v11);
          OUTLINED_FUNCTION_8_19();
          sub_247C9B330(v12);
          if (*(void *)(*(void *)(v1 + 40) + 16))
          {
            uint64_t v13 = type metadata accessor for AppIntentsProtobuf_SystemProtocol(0);
            sub_247CAAE6C(&qword_2692AAA88, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
            uint64_t v14 = OUTLINED_FUNCTION_306_0();
            OUTLINED_FUNCTION_364_0(v14, 9, v13, v15);
          }
          type metadata accessor for AppIntentsProtobuf_Action(0);
          OUTLINED_FUNCTION_116_2();
          return sub_247CBD3E8();
        }
      }
    }
  }
  return result;
}

uint64_t sub_247C9B124(uint64_t a1)
{
  uint64_t result = type metadata accessor for AppIntentsProtobuf_Action(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 36) + 9) & 1) == 0)
  {
    sub_247CAC59C();
    return sub_247CBD688();
  }
  return result;
}

uint64_t sub_247C9B1C8(uint64_t a1)
{
  uint64_t result = type metadata accessor for AppIntentsProtobuf_Action(0);
  if (*(void *)(a1 + *(int *)(result + 40) + 8)) {
    return sub_247CBD6E8();
  }
  return result;
}

uint64_t sub_247C9B240(uint64_t a1)
{
  uint64_t result = type metadata accessor for AppIntentsProtobuf_Action(0);
  if (*(unsigned char *)(a1 + *(int *)(result + 44)) != 2) {
    return sub_247CBD678();
  }
  return result;
}

uint64_t sub_247C9B2B8(uint64_t a1)
{
  uint64_t result = type metadata accessor for AppIntentsProtobuf_Action(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 48) + 8) & 1) == 0) {
    return sub_247CBD6A8();
  }
  return result;
}

uint64_t sub_247C9B330(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppIntentsProtobuf_Action(0);
  sub_247CAC68C(a1 + *(int *)(v8 + 52), (uint64_t)v4, &qword_2692AA9E0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AA9E0);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
  sub_247CAAE6C(&qword_2692AAA90, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ValueType);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
}

void sub_247C9B4FC()
{
  OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v77 = v7;
  uint64_t v78 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_36_10(v8, v76[0]);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v18 = OUTLINED_FUNCTION_42_3(v10, v11, v12, v13, v14, v15, v16, v17, v76[0]);
  type metadata accessor for AppIntentsProtobuf_ValueType(v18);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_47_0();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD3D8);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_20_1();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
  uint64_t v23 = OUTLINED_FUNCTION_2_3(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_78_3();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_118_2();
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)v76 - v26;
  OUTLINED_FUNCTION_30_10();
  BOOL v30 = v30 && v28 == v29;
  if (v30 || (sub_247CBE998() & 1) != 0)
  {
    sub_247C6740C();
    if (v31)
    {
      BOOL v32 = *(void *)(v2 + 24) == *(void *)(v1 + 24) && *(void *)(v2 + 32) == *(void *)(v1 + 32);
      if (v32 || (sub_247CBE998() & 1) != 0)
      {
        uint64_t v33 = *(int *)(type metadata accessor for AppIntentsProtobuf_Action(0) + 36);
        uint64_t v34 = (uint64_t *)(v2 + v33);
        char v35 = *(unsigned char *)(v2 + v33 + 9);
        uint64_t v36 = (uint64_t *)(v1 + v33);
        if (v35)
        {
          if ((*((unsigned char *)v36 + 9) & 1) == 0) {
            goto LABEL_53;
          }
        }
        else
        {
          if (*((unsigned char *)v36 + 9)) {
            goto LABEL_53;
          }
          uint64_t v37 = *v34;
          char v38 = *((unsigned char *)v34 + 8);
          uint64_t v39 = *v36;
          char v40 = *((unsigned char *)v36 + 8);
          uint64_t v41 = v37 != 0;
          if ((v38 & 1) == 0) {
            uint64_t v41 = v37;
          }
          if (v40)
          {
            if (v39)
            {
              if (v41 != 1) {
                goto LABEL_53;
              }
            }
            else if (v41)
            {
              goto LABEL_53;
            }
          }
          else if (v41 != v39)
          {
            goto LABEL_53;
          }
        }
        OUTLINED_FUNCTION_129_2();
        if (v45)
        {
          if (!v42) {
            goto LABEL_53;
          }
          OUTLINED_FUNCTION_56_5(v43);
          if (!v30 || v46 != v47)
          {
            uint64_t v49 = v44;
            char v50 = sub_247CBE998();
            uint64_t v44 = v49;
            if ((v50 & 1) == 0) {
              goto LABEL_53;
            }
          }
        }
        else if (v42)
        {
          goto LABEL_53;
        }
        uint64_t v51 = *(int *)(v44 + 44);
        int v52 = *(unsigned __int8 *)(v2 + v51);
        int v53 = *(unsigned __int8 *)(v1 + v51);
        if (v52 == 2)
        {
          if (v53 != 2) {
            goto LABEL_53;
          }
        }
        else if (v53 == 2 || ((((v53 & 1) == 0) ^ v52) & 1) == 0)
        {
          goto LABEL_53;
        }
        OUTLINED_FUNCTION_128_1();
        if (v56)
        {
          if (!v54) {
            goto LABEL_53;
          }
        }
        else
        {
          OUTLINED_FUNCTION_127_2();
          if (v57) {
            goto LABEL_53;
          }
        }
        uint64_t v58 = v55;
        sub_247CAC68C(v2 + *(int *)(v55 + 52), (uint64_t)v27, &qword_2692AA9E0);
        v76[1] = v58;
        sub_247CAC68C(v1 + *(int *)(v58 + 52), v0, &qword_2692AA9E0);
        uint64_t v59 = OUTLINED_FUNCTION_106_3();
        sub_247CAC68C(v59, v60, &qword_2692AA9E0);
        uint64_t v61 = OUTLINED_FUNCTION_47();
        sub_247CAC68C(v61, v62, &qword_2692AA9E0);
        OUTLINED_FUNCTION_14_17(v3);
        if (v30)
        {
          sub_247ACB4EC(v0, &qword_2692AA9E0);
          sub_247ACB4EC((uint64_t)v27, &qword_2692AA9E0);
          OUTLINED_FUNCTION_14_17(v20);
          if (v30)
          {
            sub_247ACB4EC(v3, &qword_2692AA9E0);
LABEL_56:
            sub_247C68BFC();
            if (v69)
            {
              uint64_t v70 = v76[2];
              uint64_t v72 = v77;
              uint64_t v71 = v78;
              v73 = *(void (**)(void))(v77 + 16);
              OUTLINED_FUNCTION_18_10();
              v73();
              uint64_t v74 = v76[3];
              OUTLINED_FUNCTION_18_10();
              v73();
              sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
              OUTLINED_FUNCTION_109_2();
              sub_247CBDD48();
              v75 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
              v75(v74, v71);
              v75(v70, v71);
            }
            goto LABEL_53;
          }
        }
        else
        {
          sub_247CAC68C(v3, (uint64_t)v4, &qword_2692AA9E0);
          uint64_t v64 = OUTLINED_FUNCTION_14_17(v20);
          if (!v63)
          {
            OUTLINED_FUNCTION_115_3(v64, v65, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
            if (MEMORY[0x24C5665C0](*v4, v4[1], *v5, v5[1]))
            {
              sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
              char v68 = sub_247CBDD48();
              sub_247CAC5E8((uint64_t)v5, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
              OUTLINED_FUNCTION_381_0();
              sub_247ACB4EC((uint64_t)v27, &qword_2692AA9E0);
              sub_247CAC5E8((uint64_t)v4, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
              sub_247ACB4EC(v3, &qword_2692AA9E0);
              if ((v68 & 1) == 0) {
                goto LABEL_53;
              }
              goto LABEL_56;
            }
            sub_247CAC5E8((uint64_t)v5, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
            sub_247ACB4EC(v0, &qword_2692AA9E0);
            sub_247ACB4EC((uint64_t)v27, &qword_2692AA9E0);
            sub_247CAC5E8((uint64_t)v4, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
            uint64_t v67 = OUTLINED_FUNCTION_347_0();
LABEL_52:
            sub_247ACB4EC(v67, v66);
            goto LABEL_53;
          }
          OUTLINED_FUNCTION_185_0();
          sub_247ACB4EC((uint64_t)v27, &qword_2692AA9E0);
          sub_247CAC5E8((uint64_t)v4, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
        }
        v66 = &qword_2692AD3D8;
        uint64_t v67 = v3;
        goto LABEL_52;
      }
    }
  }
LABEL_53:
  OUTLINED_FUNCTION_64();
}

unint64_t sub_247C9BA9C()
{
  return 0xD000000000000019;
}

uint64_t sub_247C9BAB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = sub_247CBD408();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_247C9BB28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 32);
  uint64_t v5 = sub_247CBD408();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_247C9BB98())(void)
{
  return nullsub_1;
}

uint64_t sub_247C9BBBC()
{
  return sub_247C9AA94();
}

uint64_t sub_247C9BBD4()
{
  return sub_247C9AF44();
}

uint64_t sub_247C9BBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE508, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247C9BC68(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9D68, (uint64_t)qword_2692C8148);
}

uint64_t sub_247C9BC8C(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AA518, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247C9BCF8()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
}

uint64_t sub_247C9BD54()
{
  sub_247CAAE6C(&qword_2692AA518, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
  return sub_247CBD658();
}

uint64_t sub_247C9BDD8()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8160);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CCBD90;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 0;
  *(void *)unint64_t v6 = "GENERIC_SPECIFICATION";
  *(void *)(v6 + 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)uint64_t v10 = "OPEN_URL_SPECIFICATION";
  *((void *)v10 + 1) = 22;
  v10[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247C9BF90(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9D70, (uint64_t)qword_2692C8160);
}

uint64_t sub_247C9BFB4()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8178);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8178);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_247CD2EA0;
  unint64_t v4 = v23 + v3;
  unint64_t v5 = v23 + v3 + v1[14];
  *(void *)(v23 + v3) = 10;
  *(void *)unint64_t v5 = "dialog";
  *(void *)(v5 + 8) = 6;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_247CBD738();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 11;
  *(void *)unint64_t v9 = "nextAction";
  *(void *)(v9 + 8) = 10;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *uint64_t v10 = 12;
  *(void *)uint64_t v11 = "showOutputAction";
  *((void *)v11 + 1) = 16;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 13;
  *(void *)uint64_t v13 = "value";
  *((void *)v13 + 1) = 5;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 14;
  *(void *)uint64_t v15 = "confirmationActionName";
  *((void *)v15 + 1) = 22;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 15;
  *(void *)uint64_t v17 = "shouldShowPrompt";
  *((void *)v17 + 1) = 16;
  unsigned char v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 16;
  *(void *)uint64_t v19 = "viewSnippet";
  *((void *)v19 + 1) = 11;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  *uint64_t v20 = 17;
  *(void *)uint64_t v21 = "showOutputActionOptions";
  *((void *)v21 + 1) = 23;
  v21[16] = 2;
  v8();
  return sub_247CBD748();
}

uint64_t sub_247C9C2E4()
{
  OUTLINED_FUNCTION_65_2();
  uint64_t result = sub_247C9C314();
  qword_2692AE260 = result;
  return result;
}

uint64_t sub_247C9C314()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__dialog;
  uint64_t v2 = type metadata accessor for AppIntentsProtobuf_Dialog(0);
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  uint64_t v3 = v0
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__nextAction;
  uint64_t v4 = type metadata accessor for AppIntentsProtobuf_Action(0);
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v4);
  __swift_storeEnumTagSinglePayload(v0+ OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputAction, 1, 1, v4);
  uint64_t v5 = v0
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__value;
  uint64_t v6 = type metadata accessor for AppIntentsProtobuf_Value(0);
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
  uint64_t v7 = v0
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__confirmationActionName;
  uint64_t v8 = type metadata accessor for AppIntentsProtobuf_ConfirmationActionName(0);
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__shouldShowPrompt) = 2;
  uint64_t v9 = v0
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__viewSnippet;
  uint64_t v10 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  uint64_t v11 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputActionOptions;
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 1;
  return v0;
}

void sub_247C9C44C()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9B0);
  uint64_t v4 = OUTLINED_FUNCTION_2_3(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_9_0();
  uint64_t v59 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9C8);
  uint64_t v7 = OUTLINED_FUNCTION_2_3(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_9_0();
  uint64_t v58 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
  uint64_t v10 = OUTLINED_FUNCTION_2_3(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_9_0();
  uint64_t v57 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9B8);
  uint64_t v13 = OUTLINED_FUNCTION_2_3(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_1_1();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9C0);
  uint64_t v18 = OUTLINED_FUNCTION_2_3(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_1_1();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__dialog;
  uint64_t v23 = type metadata accessor for AppIntentsProtobuf_Dialog(0);
  OUTLINED_FUNCTION_90_3(v22, v24, v25, v23);
  uint64_t v26 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__nextAction;
  uint64_t v27 = type metadata accessor for AppIntentsProtobuf_Action(0);
  __swift_storeEnumTagSinglePayload(v26, 1, 1, v27);
  uint64_t v28 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputAction;
  __swift_storeEnumTagSinglePayload(v0+ OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputAction, 1, 1, v27);
  uint64_t v29 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__value;
  uint64_t v30 = type metadata accessor for AppIntentsProtobuf_Value(0);
  OUTLINED_FUNCTION_90_3(v29, v31, v32, v30);
  uint64_t v33 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__confirmationActionName;
  uint64_t v54 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__confirmationActionName;
  uint64_t v34 = type metadata accessor for AppIntentsProtobuf_ConfirmationActionName(0);
  OUTLINED_FUNCTION_90_3(v33, v35, v36, v34);
  uint64_t v55 = (unsigned char *)(v0
                + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__shouldShowPrompt);
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__shouldShowPrompt) = 2;
  uint64_t v37 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__viewSnippet;
  uint64_t v56 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__viewSnippet;
  uint64_t v38 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  OUTLINED_FUNCTION_90_3(v37, v39, v40, v38);
  uint64_t v41 = v0
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputActionOptions;
  *(void *)uint64_t v41 = 0;
  *(unsigned char *)(v41 + 8) = 1;
  uint64_t v42 = v2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__dialog;
  OUTLINED_FUNCTION_86_1();
  sub_247CAC68C(v42, v21, &qword_2692AA9C0);
  OUTLINED_FUNCTION_717();
  OUTLINED_FUNCTION_104_3();
  sub_247CAC558(v43, v44, v45);
  swift_endAccess();
  uint64_t v46 = v2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__nextAction;
  OUTLINED_FUNCTION_86_1();
  sub_247CAC68C(v46, v16, &qword_2692AA9B8);
  OUTLINED_FUNCTION_717();
  sub_247CAC558(v16, v26, &qword_2692AA9B8);
  swift_endAccess();
  uint64_t v47 = v2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputAction;
  OUTLINED_FUNCTION_86_1();
  sub_247CAC68C(v47, v16, &qword_2692AA9B8);
  OUTLINED_FUNCTION_717();
  sub_247CAC558(v16, v28, &qword_2692AA9B8);
  swift_endAccess();
  uint64_t v48 = v2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__value;
  OUTLINED_FUNCTION_86_1();
  sub_247CAC68C(v48, v57, &qword_2692AA920);
  OUTLINED_FUNCTION_717();
  sub_247CAC558(v57, v29, &qword_2692AA920);
  swift_endAccess();
  uint64_t v49 = v2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__confirmationActionName;
  OUTLINED_FUNCTION_86_1();
  sub_247CAC68C(v49, v58, &qword_2692AA9C8);
  OUTLINED_FUNCTION_717();
  sub_247CAC558(v58, v54, &qword_2692AA9C8);
  swift_endAccess();
  char v50 = (unsigned char *)(v2
                + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__shouldShowPrompt);
  OUTLINED_FUNCTION_86_1();
  LOBYTE(v50) = *v50;
  swift_beginAccess();
  unsigned char *v55 = (_BYTE)v50;
  uint64_t v51 = v2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__viewSnippet;
  OUTLINED_FUNCTION_86_1();
  sub_247CAC68C(v51, v59, &qword_2692AA9B0);
  OUTLINED_FUNCTION_717();
  sub_247CAC558(v59, v56, &qword_2692AA9B0);
  swift_endAccess();
  int v52 = (uint64_t *)(v2
                  + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputActionOptions);
  OUTLINED_FUNCTION_86_1();
  uint64_t v53 = *v52;
  LOBYTE(v52) = *((unsigned char *)v52 + 8);
  swift_release();
  swift_beginAccess();
  *(void *)uint64_t v41 = v53;
  *(unsigned char *)(v41 + 8) = (_BYTE)v52;
  OUTLINED_FUNCTION_64();
}

uint64_t sub_247C9C964()
{
  sub_247ACB4EC(v0+ OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__dialog, &qword_2692AA9C0);
  sub_247ACB4EC(v0+ OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__nextAction, &qword_2692AA9B8);
  sub_247ACB4EC(v0+ OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputAction, &qword_2692AA9B8);
  sub_247ACB4EC(v0+ OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__value, &qword_2692AA920);
  sub_247ACB4EC(v0+ OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__confirmationActionName, &qword_2692AA9C8);
  sub_247ACB4EC(v0+ OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__viewSnippet, &qword_2692AA9B0);
  return v0;
}

uint64_t sub_247C9CA14()
{
  uint64_t v0 = sub_247C9C964();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_247C9CA68()
{
  return type metadata accessor for AppIntentsProtobuf_ActionOutput._StorageClass(0);
}

uint64_t type metadata accessor for AppIntentsProtobuf_ActionOutput._StorageClass(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE2A8);
}

void sub_247C9CA90()
{
  sub_247C9CCC8(319, &qword_2692AD800, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Dialog);
  if (v0 <= 0x3F)
  {
    sub_247C9CCC8(319, &qword_2692AE2B8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
    if (v1 <= 0x3F)
    {
      sub_247C9CCC8(319, &qword_2692AD6D0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
      if (v2 <= 0x3F)
      {
        sub_247C9CCC8(319, &qword_2692AE2C0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
        if (v3 <= 0x3F)
        {
          sub_247C9CCC8(319, &qword_2692AE2C8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

uint64_t type metadata accessor for AppIntentsProtobuf_Dialog(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE300);
}

void sub_247C9CCC8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_247CBE468();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t type metadata accessor for AppIntentsProtobuf_Action(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE310);
}

uint64_t type metadata accessor for AppIntentsProtobuf_Value(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE2F0);
}

uint64_t type metadata accessor for AppIntentsProtobuf_ConfirmationActionName(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE2E0);
}

uint64_t type metadata accessor for AppIntentsProtobuf_ViewSnippet(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE2D0);
}

uint64_t *sub_247C9CD9C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_247ADF298(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_247CBD408();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (uint64_t *)((char *)a1 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (uint64_t *)((char *)a1 + v14);
    uint64_t v19 = (uint64_t *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[8];
    uint64_t v22 = a3[9];
    uint64_t v23 = (uint64_t *)((char *)a1 + v21);
    uint64_t v24 = (uint64_t *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = (char *)a1 + v22;
    uint64_t v27 = (uint64_t *)((char *)a2 + v22);
    unint64_t v28 = *(uint64_t *)((char *)a2 + v22 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    }
    else
    {
      uint64_t v30 = *v27;
      sub_247ADF298(*v27, v28);
      *(void *)uint64_t v26 = v30;
      *((void *)v26 + 1) = v28;
    }
  }
  return a1;
}

uint64_t sub_247C9CF08(uint64_t a1, uint64_t a2)
{
  sub_247B0A060(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(a2 + 36));
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15)
  {
    uint64_t v9 = *v7;
    return sub_247B0A060(v9, v8);
  }
  return result;
}

uint64_t *sub_247C9CFEC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_247ADF298(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (uint64_t *)((char *)a1 + v12);
  uint64_t v15 = (uint64_t *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (uint64_t *)((char *)a1 + v13);
  uint64_t v18 = (uint64_t *)((char *)a2 + v13);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[8];
  uint64_t v21 = a3[9];
  uint64_t v22 = (uint64_t *)((char *)a1 + v20);
  uint64_t v23 = (uint64_t *)((char *)a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = (char *)a1 + v21;
  uint64_t v26 = (char *)a2 + v21;
  unint64_t v27 = *((void *)v26 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v27 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  }
  else
  {
    uint64_t v28 = *(void *)v26;
    sub_247ADF298(v28, v27);
    *(void *)uint64_t v25 = v28;
    *((void *)v25 + 1) = v27;
  }
  return a1;
}

uint64_t *sub_247C9D108(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_247ADF298(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_247B0A060(v8, v9);
  uint64_t v10 = a3[5];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = (uint64_t *)((char *)a1 + v14);
  uint64_t v16 = (uint64_t *)((char *)a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (uint64_t *)((char *)a1 + v17);
  uint64_t v19 = (uint64_t *)((char *)a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  uint64_t v21 = (uint64_t *)((char *)a1 + v20);
  uint64_t v22 = (uint64_t *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[9];
  uint64_t v24 = (uint64_t *)((char *)a1 + v23);
  uint64_t v25 = (uint64_t *)((char *)a2 + v23);
  unint64_t v26 = *(uint64_t *)((char *)a2 + v23 + 8);
  if (*(unint64_t *)((char *)a1 + v23 + 8) >> 60 != 15)
  {
    if (v26 >> 60 != 15)
    {
      uint64_t v28 = *v25;
      sub_247ADF298(v28, v26);
      uint64_t v29 = *v24;
      unint64_t v30 = v24[1];
      *uint64_t v24 = v28;
      v24[1] = v26;
      sub_247B0A060(v29, v30);
      return a1;
    }
    sub_247C52378((uint64_t)v24);
    goto LABEL_6;
  }
  if (v26 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    return a1;
  }
  uint64_t v27 = *v25;
  sub_247ADF298(v27, v26);
  *uint64_t v24 = v27;
  v24[1] = v26;
  return a1;
}

_OWORD *sub_247C9D2AC(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  uint64_t v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  return a1;
}

uint64_t *sub_247C9D360(uint64_t *a1, _OWORD *a2, int *a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_247B0A060(v6, v7);
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = (uint64_t *)((char *)a1 + v12);
  uint64_t v14 = (uint64_t *)((char *)a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (uint64_t *)((char *)a1 + v17);
  uint64_t v19 = (uint64_t *)((char *)a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[8];
  uint64_t v23 = (uint64_t *)((char *)a1 + v22);
  uint64_t v24 = (uint64_t *)((char *)a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[9];
  uint64_t v28 = (uint64_t *)((char *)a1 + v27);
  uint64_t v29 = (uint64_t *)((char *)a2 + v27);
  unint64_t v30 = *(uint64_t *)((char *)a1 + v27 + 8);
  if (v30 >> 60 != 15)
  {
    unint64_t v31 = v29[1];
    if (v31 >> 60 != 15)
    {
      uint64_t v32 = *v28;
      *uint64_t v28 = *v29;
      v28[1] = v31;
      sub_247B0A060(v32, v30);
      return a1;
    }
    sub_247C52378((uint64_t)v28);
  }
  *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
  return a1;
}

uint64_t sub_247C9D49C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t sub_247C9D4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t sub_247C9D4CC()
{
  uint64_t result = sub_247CBD408();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_247C9D57C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_247CBD408();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    uint64_t v15 = (uint64_t *)((char *)v7 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (uint64_t *)((char *)v7 + v14);
    uint64_t v19 = (uint64_t *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_247C9D6B0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_247C9D758(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)((char *)a1 + v13);
  uint64_t v18 = (void *)((char *)a2 + v13);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_247C9D838(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_247C9D944(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  return a1;
}

void *sub_247C9D9E4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247C9DAC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247C9DAD4);
}

uint64_t sub_247C9DAD4()
{
  OUTLINED_FUNCTION_87_1();
  if (v2) {
    return OUTLINED_FUNCTION_19_5(*v0);
  }
  OUTLINED_FUNCTION_68_3();
  uint64_t v4 = OUTLINED_FUNCTION_112_2(*(int *)(v1 + 24));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_247C9DB38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247C9DB4C);
}

void sub_247C9DB4C()
{
  OUTLINED_FUNCTION_38_6();
  if (v3)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_329_0();
    uint64_t v4 = OUTLINED_FUNCTION_44_4(*(int *)(v2 + 24));
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

uint64_t sub_247C9DBB0()
{
  uint64_t result = sub_247CBD408();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247C9DC70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_32Tm);
}

uint64_t sub_247C9DC88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_33Tm);
}

uint64_t sub_247C9DCA0()
{
  return sub_247CB0AAC();
}

void *sub_247C9DCAC(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v7 = a3[5];
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = sub_247CBD408();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = a3[7];
    uint64_t v13 = (void *)((char *)v4 + v11);
    uint64_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = (void *)((char *)v4 + v12);
    uint64_t v17 = (uint64_t *)((char *)a2 + v12);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_247C9DDC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247C9DE58(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v10);
  uint64_t v13 = (void *)(a2 + v10);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = (void *)(a1 + v11);
  uint64_t v16 = (void *)(a2 + v11);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247C9DF1C(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (uint64_t *)((char *)a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247C9E008(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  return a1;
}

uint64_t sub_247C9E0B0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247C9E17C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247C9E190);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, int a2, uint64_t a3)
{
  sub_247CBD408();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v6 + 84) == a2)
  {
    uint64_t v7 = OUTLINED_FUNCTION_112_2(*(int *)(a3 + 20));
    return __swift_getEnumTagSinglePayload(v7, v8, v9);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    int v12 = v11 - 1;
    if (v12 < 0) {
      int v12 = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_247C9E234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247C9E248);
}

void __swift_store_extra_inhabitant_indexTm(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  sub_247CBD408();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    OUTLINED_FUNCTION_50_4();
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
}

uint64_t sub_247C9E2DC()
{
  return sub_247CB0240();
}

void *sub_247C9E2E8(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    uint64_t v10 = a3[8];
    uint64_t v34 = (char *)a2 + v10;
    uint64_t v35 = (char *)a1 + v10;
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v11 = sub_247CBD408();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v35, v34, v11);
    uint64_t v13 = a3[9];
    uint64_t v14 = a3[10];
    uint64_t v15 = (char *)v4 + v13;
    uint64_t v16 = (char *)a2 + v13;
    *(void *)uint64_t v15 = *(void *)v16;
    *((_WORD *)v15 + 4) = *((_WORD *)v16 + 4);
    uint64_t v17 = (void *)((char *)v4 + v14);
    uint64_t v18 = (void *)((char *)a2 + v14);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = a3[11];
    uint64_t v22 = a3[12];
    char v23 = *((unsigned char *)a2 + v21);
    *uint64_t v17 = v19;
    v17[1] = v20;
    *((unsigned char *)v4 + v21) = v23;
    uint64_t v24 = (char *)v4 + v22;
    v24[8] = *((unsigned char *)a2 + v22 + 8);
    *(void *)uint64_t v24 = *(void *)((char *)a2 + v22);
    uint64_t v25 = a3[13];
    uint64_t v26 = (void *)((char *)v4 + v25);
    uint64_t v27 = (void *)((char *)a2 + v25);
    uint64_t v28 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28))
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
      memcpy(v26, v27, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      uint64_t v31 = *v27;
      unint64_t v32 = v27[1];
      sub_247ADF298(*v27, v32);
      *uint64_t v26 = v31;
      v26[1] = v32;
      v12((char *)v26 + *(int *)(v28 + 20), (char *)v27 + *(int *)(v28 + 20), v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v28);
    }
  }
  return v4;
}

uint64_t type metadata accessor for AppIntentsProtobuf_ValueType(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE320);
}

uint64_t sub_247C9E52C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_247CBD408();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 52);
  uint64_t v7 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
  uint64_t result = __swift_getEnumTagSinglePayload(v6, 1, v7);
  if (!result)
  {
    sub_247B0A060(*(void *)v6, *(void *)(v6 + 8));
    uint64_t v9 = v6 + *(int *)(v7 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

void *sub_247C9E644(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  uint64_t v9 = a3[8];
  unint64_t v32 = (char *)a2 + v9;
  uint64_t v33 = (char *)a1 + v9;
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v33, v32, v10);
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = (char *)a1 + v12;
  uint64_t v15 = (char *)a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *((_WORD *)v14 + 4) = *((_WORD *)v15 + 4);
  uint64_t v16 = (void *)((char *)a1 + v13);
  uint64_t v17 = (void *)((char *)a2 + v13);
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  uint64_t v20 = a3[11];
  uint64_t v21 = a3[12];
  char v22 = *((unsigned char *)a2 + v20);
  *uint64_t v16 = v18;
  v16[1] = v19;
  *((unsigned char *)a1 + v20) = v22;
  char v23 = (char *)a1 + v21;
  v23[8] = *((unsigned char *)a2 + v21 + 8);
  *(void *)char v23 = *(void *)((char *)a2 + v21);
  uint64_t v24 = a3[13];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  uint64_t v27 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
    memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    uint64_t v29 = *v26;
    unint64_t v30 = v26[1];
    sub_247ADF298(*v26, v30);
    *uint64_t v25 = v29;
    v25[1] = v30;
    v11((char *)v25 + *(int *)(v27 + 20), (char *)v26 + *(int *)(v27 + 20), v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
  }
  return a1;
}

void *sub_247C9E818(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[8];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  uint64_t v12 = a3[9];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)v14;
  *((_WORD *)v13 + 4) = *((_WORD *)v14 + 4);
  *(void *)uint64_t v13 = v15;
  uint64_t v16 = a3[10];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  uint64_t v19 = a3[12];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  char v22 = v21[8];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v22;
  uint64_t v23 = a3[13];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  uint64_t v26 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v26);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26);
  if (!v8)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v32 = *v25;
      unint64_t v33 = v25[1];
      sub_247ADF298(*v25, v33);
      uint64_t v34 = *v24;
      unint64_t v35 = v24[1];
      *uint64_t v24 = v32;
      v24[1] = v33;
      sub_247B0A060(v34, v35);
      v11((char *)v24 + *(int *)(v26 + 20), (char *)v25 + *(int *)(v26 + 20), v9);
      return a1;
    }
    sub_247CAC5E8((uint64_t)v24, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
    memcpy(v24, v25, *(void *)(*(void *)(v30 - 8) + 64));
    return a1;
  }
  uint64_t v28 = *v25;
  unint64_t v29 = v25[1];
  sub_247ADF298(*v25, v29);
  *uint64_t v24 = v28;
  v24[1] = v29;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v24 + *(int *)(v26 + 20), (char *)v25 + *(int *)(v26 + 20), v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  return a1;
}

uint64_t sub_247C9EAC0(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v6 = a3[8];
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[9];
  uint64_t v12 = a3[10];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *(_WORD *)(v13 + 8) = *(_WORD *)(v14 + 8);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v15 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  uint64_t v18 = a3[13];
  uint64_t v19 = (_OWORD *)(a1 + v18);
  uint64_t v20 = (_OWORD *)(a2 + v18);
  uint64_t v21 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
    memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    *uint64_t v19 = *v20;
    v10((char *)v19 + *(int *)(v21 + 20), (char *)v20 + *(int *)(v21 + 20), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
  }
  return a1;
}

void *sub_247C9EC4C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[4];
  a1[3] = a2[3];
  a1[4] = v7;
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[8];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_247CBD408();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v13(v9, v10, v11);
  uint64_t v14 = a3[9];
  uint64_t v15 = a3[10];
  uint64_t v16 = (char *)a1 + v14;
  uint64_t v17 = (char *)a2 + v14;
  *(void *)uint64_t v16 = *(void *)v17;
  *((_WORD *)v16 + 4) = *((_WORD *)v17 + 4);
  uint64_t v18 = (void *)((char *)a1 + v15);
  uint64_t v19 = (void *)((char *)a2 + v15);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[12];
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v24[8];
  uint64_t v25 = a3[13];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = type metadata accessor for AppIntentsProtobuf_ValueType(0);
  LODWORD(v10) = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v28);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28);
  if (!v10)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v32 = *v26;
      unint64_t v33 = v26[1];
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
      sub_247B0A060(v32, v33);
      v13((char *)v26 + *(int *)(v28 + 20), &v27[*(int *)(v28 + 20)], v11);
      return a1;
    }
    sub_247CAC5E8((uint64_t)v26, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v26 + *(int *)(v28 + 20), &v27[*(int *)(v28 + 20)], v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v28);
  return a1;
}

uint64_t sub_247C9EE94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247C9EEA8);
}

uint64_t sub_247C9EEA8()
{
  OUTLINED_FUNCTION_87_1();
  if (v3) {
    return OUTLINED_FUNCTION_19_5(*(void *)(v1 + 8));
  }
  OUTLINED_FUNCTION_68_3();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v5 + 84) == v0)
  {
    uint64_t v6 = *(int *)(v2 + 32);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
    uint64_t v6 = *(int *)(v2 + 52);
  }
  uint64_t v7 = OUTLINED_FUNCTION_112_2(v6);
  return __swift_getEnumTagSinglePayload(v7, v8, v9);
}

uint64_t sub_247C9EF38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247C9EF4C);
}

void sub_247C9EF4C()
{
  OUTLINED_FUNCTION_38_6();
  if (v2)
  {
    OUTLINED_FUNCTION_223_1();
  }
  else
  {
    OUTLINED_FUNCTION_106_2();
    OUTLINED_FUNCTION_1_23();
    if (*(_DWORD *)(v3 + 84) == v1)
    {
      uint64_t v4 = *(int *)(v0 + 32);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9E0);
      uint64_t v4 = *(int *)(v0 + 52);
    }
    uint64_t v5 = OUTLINED_FUNCTION_44_4(v4);
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

void sub_247C9EFD8()
{
  sub_247CBD408();
  if (v0 <= 0x3F)
  {
    sub_247C9CCC8(319, &qword_2692AD830, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ValueType);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_247C9F100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_32Tm_0);
}

uint64_t sub_247C9F118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_33Tm_0);
}

uint64_t *sub_247C9F130(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_247CBD408();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_247C9F240(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

void *sub_247C9F2D0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_247C9F390(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_247C9F460(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_247C9F4F8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247C9F5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_44Tm);
}

uint64_t sub_247C9F5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_45Tm);
}

uint64_t type metadata accessor for AppIntentsProtobuf_NotificationTopic(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE330);
}

uint64_t sub_247C9F5F8()
{
  uint64_t result = sub_247CBD408();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247C9F698()
{
  return swift_release();
}

uint64_t sub_247C9F718()
{
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v0 || (v2 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 10:
        sub_247C9F894();
        break;
      case 11:
        sub_247C9F964();
        break;
      case 12:
        sub_247C9FA34();
        break;
      case 13:
        sub_247C9FB04();
        break;
      case 14:
        sub_247C9FBD4();
        break;
      case 15:
        sub_247C9FCA4();
        break;
      case 16:
        sub_247C9FD2C();
        break;
      case 17:
        sub_247C9FDFC();
        break;
      default:
        continue;
    }
  }
}

uint64_t sub_247C9F894()
{
  return swift_endAccess();
}

uint64_t sub_247C9F964()
{
  return swift_endAccess();
}

uint64_t sub_247C9FA34()
{
  return swift_endAccess();
}

uint64_t sub_247C9FB04()
{
  return swift_endAccess();
}

uint64_t sub_247C9FBD4()
{
  return swift_endAccess();
}

uint64_t sub_247C9FCA4()
{
  return swift_endAccess();
}

uint64_t sub_247C9FD2C()
{
  return swift_endAccess();
}

uint64_t sub_247C9FDFC()
{
  return swift_endAccess();
}

uint64_t sub_247C9FE84()
{
  type metadata accessor for AppIntentsProtobuf_ActionOutput(0);
  swift_retain();
  OUTLINED_FUNCTION_8_19();
  sub_247C9FF04(v1);
  uint64_t result = swift_release();
  if (!v0) {
    return OUTLINED_FUNCTION_56_6();
  }
  return result;
}

uint64_t sub_247C9FF04(uint64_t a1)
{
  uint64_t result = sub_247C9FFE4(a1);
  if (!v1)
  {
    sub_247CA01C8(a1);
    sub_247CA03AC(a1);
    sub_247CA0590(a1);
    sub_247CA0774(a1);
    sub_247CA0958(a1);
    sub_247CA09E8(a1);
    return sub_247CA0BCC(a1);
  }
  return result;
}

uint64_t sub_247C9FFE4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9C0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_Dialog(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__dialog;
  swift_beginAccess();
  sub_247CAC68C(v8, (uint64_t)v4, &qword_2692AA9C0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AA9C0);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Dialog);
  sub_247CAAE6C(&qword_2692AAA98, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Dialog);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Dialog);
}

uint64_t sub_247CA01C8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9B8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_Action(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__nextAction;
  swift_beginAccess();
  sub_247CAC68C(v8, (uint64_t)v4, &qword_2692AA9B8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AA9B8);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247CAAE6C(&qword_2692AA518, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
}

uint64_t sub_247CA03AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9B8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_Action(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputAction;
  swift_beginAccess();
  sub_247CAC68C(v8, (uint64_t)v4, &qword_2692AA9B8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AA9B8);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247CAAE6C(&qword_2692AA518, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
}

uint64_t sub_247CA0590(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_Value(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__value;
  swift_beginAccess();
  sub_247CAC68C(v8, (uint64_t)v4, &qword_2692AA920);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AA920);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
  sub_247CAAE6C(&qword_2692AA988, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
}

uint64_t sub_247CA0774(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9C8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_ConfirmationActionName(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__confirmationActionName;
  swift_beginAccess();
  sub_247CAC68C(v8, (uint64_t)v4, &qword_2692AA9C8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AA9C8);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
  sub_247CAAE6C(&qword_2692AAAA0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
}

uint64_t sub_247CA0958(uint64_t a1)
{
  uint64_t v1 = (unsigned char *)(a1
               + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__shouldShowPrompt);
  uint64_t result = swift_beginAccess();
  if (*v1 != 2) {
    return sub_247CBD678();
  }
  return result;
}

uint64_t sub_247CA09E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9B0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__viewSnippet;
  swift_beginAccess();
  sub_247CAC68C(v8, (uint64_t)v4, &qword_2692AA9B0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AA9B0);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
  sub_247CAAE6C(&qword_2692AAA80, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
}

uint64_t sub_247CA0BCC(uint64_t a1)
{
  uint64_t v1 = a1
     + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputActionOptions;
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(v1 + 8) & 1) == 0) {
    return sub_247CBD6F8();
  }
  return result;
}

void sub_247CA0C58()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v3 = OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_419_0();
  uint64_t v9 = *(int *)(type metadata accessor for AppIntentsProtobuf_ActionOutput(v8) + 20);
  uint64_t v10 = *(void *)(v2 + v9);
  uint64_t v11 = *(void *)(v1 + v9);
  if (v10 == v11
    || (swift_retain(), swift_retain(), BOOL v12 = sub_247CA0DB8(v10, v11), swift_release(), swift_release(), v12))
  {
    uint64_t v13 = *(void (**)(uint64_t))(v5 + 16);
    uint64_t v14 = OUTLINED_FUNCTION_92_4();
    v13(v14);
    ((void (*)(uint64_t, uint64_t, uint64_t))v13)(v0, v1, v3);
    sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_58_4();
    uint64_t v15 = *(void (**)(void))(v5 + 8);
    OUTLINED_FUNCTION_76_4();
    v15();
    OUTLINED_FUNCTION_76_4();
    v15();
  }
  OUTLINED_FUNCTION_64();
}

BOOL sub_247CA0DB8(uint64_t a1, uint64_t a2)
{
  uint64_t v130 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  MEMORY[0x270FA5388](v130);
  uint64_t v127 = (uint64_t)&v127 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE518);
  MEMORY[0x270FA5388](v129);
  uint64_t v131 = (uint64_t)&v127 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9B0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v128 = (uint64_t)&v127 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v146 = (uint64_t)&v127 - v9;
  uint64_t v136 = type metadata accessor for AppIntentsProtobuf_ConfirmationActionName(0);
  MEMORY[0x270FA5388](v136);
  uint64_t v132 = (uint64_t)&v127 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE520);
  MEMORY[0x270FA5388](v135);
  uint64_t v137 = (uint64_t)&v127 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9C8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v133 = (uint64_t)&v127 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v139 = (char *)&v127 - v15;
  uint64_t v141 = type metadata accessor for AppIntentsProtobuf_Value(0);
  MEMORY[0x270FA5388](v141);
  v134 = (uint64_t *)((char *)&v127 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD2A0);
  MEMORY[0x270FA5388](v140);
  uint64_t v142 = (uint64_t)&v127 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  v138 = (uint64_t *)((char *)&v127 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v19);
  uint64_t v150 = (uint64_t)&v127 - v21;
  uint64_t v152 = type metadata accessor for AppIntentsProtobuf_Action(0);
  MEMORY[0x270FA5388](v152);
  uint64_t v144 = (uint64_t)&v127 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE528);
  uint64_t v23 = MEMORY[0x270FA5388](v155);
  uint64_t v145 = (uint64_t)&v127 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v153 = (uint64_t)&v127 - v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9B8);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v143 = (uint64_t)&v127 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v148 = (uint64_t)&v127 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v147 = (uint64_t)&v127 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v151 = (uint64_t)&v127 - v33;
  uint64_t v34 = type metadata accessor for AppIntentsProtobuf_Dialog(0);
  MEMORY[0x270FA5388](v34);
  uint64_t v149 = (uint64_t)&v127 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD3C0);
  uint64_t v37 = v36 - 8;
  MEMORY[0x270FA5388](v36);
  uint64_t v39 = (char *)&v127 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA9C0);
  uint64_t v41 = MEMORY[0x270FA5388](v40 - 8);
  uint64_t v154 = (uint64_t)&v127 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v41);
  uint64_t v44 = (char *)&v127 - v43;
  uint64_t v45 = a1;
  uint64_t v46 = a1
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__dialog;
  swift_beginAccess();
  sub_247CAC68C(v46, (uint64_t)v44, &qword_2692AA9C0);
  uint64_t v47 = a2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__dialog;
  swift_beginAccess();
  uint64_t v48 = (uint64_t)&v39[*(int *)(v37 + 56)];
  sub_247CAC68C((uint64_t)v44, (uint64_t)v39, &qword_2692AA9C0);
  sub_247CAC68C(v47, v48, &qword_2692AA9C0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v39, 1, v34) == 1)
  {
    swift_retain();
    swift_retain();
    sub_247ACB4EC((uint64_t)v44, &qword_2692AA9C0);
    uint64_t v49 = v45;
    if (__swift_getEnumTagSinglePayload(v48, 1, v34) == 1)
    {
      sub_247ACB4EC((uint64_t)v39, &qword_2692AA9C0);
      goto LABEL_8;
    }
LABEL_6:
    int v52 = &qword_2692AD3C0;
    uint64_t v53 = (uint64_t)v39;
LABEL_23:
    sub_247ACB4EC(v53, v52);
    goto LABEL_24;
  }
  uint64_t v50 = v45;
  uint64_t v51 = v154;
  sub_247CAC68C((uint64_t)v39, v154, &qword_2692AA9C0);
  if (__swift_getEnumTagSinglePayload(v48, 1, v34) == 1)
  {
    swift_retain();
    swift_retain();
    sub_247ACB4EC((uint64_t)v44, &qword_2692AA9C0);
    sub_247CAC5E8(v51, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Dialog);
    goto LABEL_6;
  }
  uint64_t v54 = v149;
  sub_247CAC504(v48, v149, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Dialog);
  swift_retain();
  swift_retain();
  sub_247CA3ED8();
  uint64_t v55 = v51;
  char v57 = v56;
  sub_247CAC5E8(v54, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Dialog);
  sub_247ACB4EC((uint64_t)v44, &qword_2692AA9C0);
  sub_247CAC5E8(v55, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Dialog);
  uint64_t v49 = v50;
  sub_247ACB4EC((uint64_t)v39, &qword_2692AA9C0);
  if ((v57 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_8:
  uint64_t v58 = v49
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__nextAction;
  swift_beginAccess();
  uint64_t v59 = v151;
  sub_247CAC68C(v58, v151, &qword_2692AA9B8);
  uint64_t v60 = a2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__nextAction;
  swift_beginAccess();
  uint64_t v61 = v153;
  uint64_t v62 = v153 + *(int *)(v155 + 48);
  sub_247CAC68C(v59, v153, &qword_2692AA9B8);
  sub_247CAC68C(v60, v62, &qword_2692AA9B8);
  uint64_t v63 = v152;
  if (__swift_getEnumTagSinglePayload(v61, 1, v152) == 1)
  {
    sub_247ACB4EC(v59, &qword_2692AA9B8);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v62, 1, v63);
    uint64_t v65 = v150;
    if (EnumTagSinglePayload == 1)
    {
      sub_247ACB4EC(v61, &qword_2692AA9B8);
      goto LABEL_16;
    }
LABEL_13:
    int v52 = &qword_2692AE528;
LABEL_14:
    uint64_t v53 = v61;
    goto LABEL_23;
  }
  uint64_t v66 = v147;
  sub_247CAC68C(v61, v147, &qword_2692AA9B8);
  if (__swift_getEnumTagSinglePayload(v62, 1, v63) == 1)
  {
    sub_247ACB4EC(v59, &qword_2692AA9B8);
    sub_247CAC5E8(v66, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
    goto LABEL_13;
  }
  uint64_t v67 = v144;
  sub_247CAC504(v62, v144, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247C9B4FC();
  char v69 = v68;
  sub_247CAC5E8(v67, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247ACB4EC(v59, &qword_2692AA9B8);
  sub_247CAC5E8(v66, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247ACB4EC(v153, &qword_2692AA9B8);
  uint64_t v65 = v150;
  if ((v69 & 1) == 0)
  {
LABEL_24:
    swift_release();
    swift_release();
    return 0;
  }
LABEL_16:
  uint64_t v70 = v49
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputAction;
  swift_beginAccess();
  uint64_t v71 = v148;
  sub_247CAC68C(v70, v148, &qword_2692AA9B8);
  uint64_t v72 = a2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputAction;
  swift_beginAccess();
  uint64_t v73 = v145;
  uint64_t v74 = v145 + *(int *)(v155 + 48);
  sub_247CAC68C(v71, v145, &qword_2692AA9B8);
  uint64_t v75 = v73;
  sub_247CAC68C(v72, v74, &qword_2692AA9B8);
  if (__swift_getEnumTagSinglePayload(v73, 1, v63) == 1)
  {
    sub_247ACB4EC(v71, &qword_2692AA9B8);
    int v76 = __swift_getEnumTagSinglePayload(v74, 1, v63);
    uint64_t v77 = v146;
    if (v76 == 1)
    {
      sub_247ACB4EC(v73, &qword_2692AA9B8);
      goto LABEL_27;
    }
LABEL_21:
    int v52 = &qword_2692AE528;
LABEL_22:
    uint64_t v53 = v75;
    goto LABEL_23;
  }
  uint64_t v78 = v73;
  uint64_t v79 = v143;
  sub_247CAC68C(v78, v143, &qword_2692AA9B8);
  int v80 = __swift_getEnumTagSinglePayload(v74, 1, v63);
  uint64_t v77 = v146;
  if (v80 == 1)
  {
    sub_247ACB4EC(v148, &qword_2692AA9B8);
    sub_247CAC5E8(v79, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
    goto LABEL_21;
  }
  uint64_t v82 = v144;
  sub_247CAC504(v74, v144, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247C9B4FC();
  char v84 = v83;
  sub_247CAC5E8(v82, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247ACB4EC(v148, &qword_2692AA9B8);
  sub_247CAC5E8(v79, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Action);
  sub_247ACB4EC(v75, &qword_2692AA9B8);
  if ((v84 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_27:
  uint64_t v85 = v49
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__value;
  swift_beginAccess();
  sub_247CAC68C(v85, v65, &qword_2692AA920);
  uint64_t v86 = a2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__value;
  swift_beginAccess();
  uint64_t v87 = v142;
  uint64_t v88 = v142 + *(int *)(v140 + 48);
  sub_247CAC68C(v65, v142, &qword_2692AA920);
  uint64_t v89 = v86;
  uint64_t v61 = v87;
  sub_247CAC68C(v89, v88, &qword_2692AA920);
  uint64_t v90 = v141;
  if (__swift_getEnumTagSinglePayload(v87, 1, v141) == 1)
  {
    sub_247ACB4EC(v65, &qword_2692AA920);
    int v91 = __swift_getEnumTagSinglePayload(v88, 1, v90);
    uint64_t v92 = (uint64_t)v139;
    if (v91 == 1)
    {
      sub_247ACB4EC(v87, &qword_2692AA920);
      goto LABEL_30;
    }
    goto LABEL_35;
  }
  uint64_t v98 = v87;
  v99 = v138;
  sub_247CAC68C(v98, (uint64_t)v138, &qword_2692AA920);
  int v100 = __swift_getEnumTagSinglePayload(v88, 1, v90);
  uint64_t v92 = (uint64_t)v139;
  if (v100 == 1)
  {
    sub_247ACB4EC(v65, &qword_2692AA920);
    sub_247CAC5E8((uint64_t)v99, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
LABEL_35:
    int v52 = &qword_2692AD2A0;
    goto LABEL_14;
  }
  v101 = v134;
  sub_247CAC504(v88, (uint64_t)v134, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
  if ((MEMORY[0x24C5665C0](*v99, v99[1], *v101, v101[1]) & 1) == 0)
  {
    sub_247CAC5E8((uint64_t)v101, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
    sub_247ACB4EC(v65, &qword_2692AA920);
    sub_247CAC5E8((uint64_t)v99, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
    uint64_t v53 = v61;
    int v52 = &qword_2692AA920;
    goto LABEL_23;
  }
  sub_247CBD408();
  sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
  char v102 = sub_247CBDD48();
  sub_247CAC5E8((uint64_t)v101, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
  sub_247ACB4EC(v150, &qword_2692AA920);
  sub_247CAC5E8((uint64_t)v99, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
  sub_247ACB4EC(v142, &qword_2692AA920);
  if ((v102 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_30:
  uint64_t v93 = v49
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__confirmationActionName;
  swift_beginAccess();
  sub_247CAC68C(v93, v92, &qword_2692AA9C8);
  uint64_t v94 = a2
      + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__confirmationActionName;
  swift_beginAccess();
  uint64_t v95 = v137;
  uint64_t v96 = v137 + *(int *)(v135 + 48);
  sub_247CAC68C(v92, v137, &qword_2692AA9C8);
  uint64_t v75 = v95;
  sub_247CAC68C(v94, v96, &qword_2692AA9C8);
  uint64_t v97 = v136;
  if (__swift_getEnumTagSinglePayload(v95, 1, v136) == 1)
  {
    sub_247ACB4EC(v92, &qword_2692AA9C8);
    if (__swift_getEnumTagSinglePayload(v96, 1, v97) == 1)
    {
      sub_247ACB4EC(v95, &qword_2692AA9C8);
      goto LABEL_44;
    }
    goto LABEL_41;
  }
  uint64_t v103 = v133;
  sub_247CAC68C(v95, v133, &qword_2692AA9C8);
  if (__swift_getEnumTagSinglePayload(v96, 1, v97) == 1)
  {
    sub_247ACB4EC(v92, &qword_2692AA9C8);
    sub_247CAC5E8(v103, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
LABEL_41:
    int v52 = &qword_2692AE520;
    goto LABEL_22;
  }
  uint64_t v104 = v132;
  sub_247CAC504(v96, v132, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
  sub_247CA3688();
  char v106 = v105;
  sub_247CAC5E8(v104, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
  sub_247ACB4EC(v92, &qword_2692AA9C8);
  sub_247CAC5E8(v103, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
  sub_247ACB4EC(v95, &qword_2692AA9C8);
  if ((v106 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_44:
  v107 = (unsigned __int8 *)(v49
                           + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__shouldShowPrompt);
  swift_beginAccess();
  int v108 = *v107;
  v109 = (unsigned __int8 *)(a2
                           + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__shouldShowPrompt);
  swift_beginAccess();
  int v110 = *v109;
  if (v108 == 2)
  {
    if (v110 != 2) {
      goto LABEL_24;
    }
  }
  else if (v110 == 2 || ((((v110 & 1) == 0) ^ v108) & 1) == 0)
  {
    goto LABEL_24;
  }
  uint64_t v111 = v49
       + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__viewSnippet;
  swift_beginAccess();
  sub_247CAC68C(v111, v77, &qword_2692AA9B0);
  uint64_t v112 = a2
       + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__viewSnippet;
  swift_beginAccess();
  uint64_t v113 = v131;
  uint64_t v114 = v131 + *(int *)(v129 + 48);
  sub_247CAC68C(v77, v131, &qword_2692AA9B0);
  uint64_t v75 = v113;
  sub_247CAC68C(v112, v114, &qword_2692AA9B0);
  uint64_t v115 = v130;
  if (__swift_getEnumTagSinglePayload(v113, 1, v130) == 1)
  {
    sub_247ACB4EC(v77, &qword_2692AA9B0);
    if (__swift_getEnumTagSinglePayload(v114, 1, v115) == 1)
    {
      sub_247ACB4EC(v113, &qword_2692AA9B0);
      goto LABEL_56;
    }
    goto LABEL_54;
  }
  uint64_t v116 = v128;
  sub_247CAC68C(v113, v128, &qword_2692AA9B0);
  if (__swift_getEnumTagSinglePayload(v114, 1, v115) == 1)
  {
    sub_247ACB4EC(v146, &qword_2692AA9B0);
    sub_247CAC5E8(v116, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
LABEL_54:
    int v52 = &qword_2692AE518;
    goto LABEL_22;
  }
  uint64_t v117 = v127;
  sub_247CAC504(v114, v127, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
  sub_247CAA84C();
  char v119 = v118;
  sub_247CAC5E8(v117, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
  sub_247ACB4EC(v146, &qword_2692AA9B0);
  sub_247CAC5E8(v116, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
  sub_247ACB4EC(v113, &qword_2692AA9B0);
  if ((v119 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_56:
  v120 = (uint64_t *)(v49
                   + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputActionOptions);
  swift_beginAccess();
  uint64_t v121 = *v120;
  char v122 = *((unsigned char *)v120 + 8);
  swift_release();
  v123 = (uint64_t *)(a2
                   + OBJC_IVAR____TtCV18AppIntentsServices31AppIntentsProtobuf_ActionOutputP33_D321C84350D2B5DD9AE571CCF7A1723513_StorageClass__showOutputActionOptions);
  swift_beginAccess();
  uint64_t v124 = *v123;
  int v125 = *((unsigned __int8 *)v123 + 8);
  swift_release();
  if ((v122 & 1) == 0)
  {
    if (v121 == v124) {
      char v126 = v125;
    }
    else {
      char v126 = 1;
    }
    return (v126 & 1) == 0;
  }
  return v125 != 0;
}

unint64_t sub_247CA20C4()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_247CA20E4()
{
  return sub_247C9F698();
}

uint64_t sub_247CA20FC()
{
  return sub_247C9FE84();
}

uint64_t sub_247CA2114(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE538, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ActionOutput);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA2190(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9D78, (uint64_t)qword_2692C8178);
}

uint64_t sub_247CA21B4(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAA78, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ActionOutput);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA2220()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_ActionOutput);
}

uint64_t sub_247CA227C()
{
  sub_247CAAE6C(&qword_2692AAA78, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ActionOutput);
  return sub_247CBD658();
}

uint64_t sub_247CA22FC()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8190);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8190);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CCDE00;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "sequenceIdentifier";
  *(void *)(v6 + 8) = 18;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "iteratorIdentifier";
  *(void *)(v10 + 8) = 18;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "complete";
  *((void *)v12 + 1) = 8;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 10;
  *(void *)uint64_t v14 = "values";
  *((void *)v14 + 1) = 6;
  v14[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA2530(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_9(a1, a2);
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v2 || (v4 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
        OUTLINED_FUNCTION_6_15();
        sub_247CA2600();
        break;
      case 2:
        OUTLINED_FUNCTION_104_3();
        sub_247CBD548();
        break;
      case 3:
        OUTLINED_FUNCTION_6_15();
        sub_247CA26B0();
        break;
      case 10:
        OUTLINED_FUNCTION_6_15();
        sub_247CA2714();
        break;
      default:
        break;
    }
    OUTLINED_FUNCTION_82_2();
  }
}

uint64_t sub_247CA2600()
{
  return sub_247CBD5E8();
}

uint64_t sub_247CA26B0()
{
  return sub_247CBD4D8();
}

uint64_t sub_247CA2714()
{
  return sub_247CBD5C8();
}

uint64_t sub_247CA27B0()
{
  uint64_t result = sub_247CA28DC((uint64_t)v0);
  if (!v1)
  {
    if (*v0) {
      sub_247CBD6A8();
    }
    OUTLINED_FUNCTION_8_19();
    sub_247CA2AA8(v3);
    if (*(void *)(v0[1] + 16))
    {
      uint64_t v4 = type metadata accessor for AppIntentsProtobuf_Value(0);
      sub_247CAAE6C(&qword_2692AA988, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
      uint64_t v5 = OUTLINED_FUNCTION_306_0();
      OUTLINED_FUNCTION_364_0(v5, 10, v4, v6);
    }
    type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage(0);
    return OUTLINED_FUNCTION_56_6();
  }
  return result;
}

uint64_t sub_247CA28DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA08);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_UUID(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage(0);
  sub_247CAC68C(a1 + *(int *)(v8 + 28), (uint64_t)v4, &qword_2692AAA08);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AAA08);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
  sub_247CAAE6C(&qword_2692AAAA8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_UUID);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
}

uint64_t sub_247CA2AA8(uint64_t a1)
{
  uint64_t result = type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage(0);
  if (*(unsigned char *)(a1 + *(int *)(result + 32)) != 2) {
    return sub_247CBD678();
  }
  return result;
}

void sub_247CA2B20()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  sub_247CBD408();
  OUTLINED_FUNCTION_30_0();
  uint64_t v49 = v7;
  uint64_t v50 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_10_1();
  uint64_t v48 = v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v47 = (char *)&v47 - v10;
  uint64_t v11 = type metadata accessor for AppIntentsProtobuf_UUID(0);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_1();
  uint64_t v15 = (void *)(v14 - v13);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1E0);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_20_1();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA08);
  uint64_t v19 = OUTLINED_FUNCTION_2_3(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_113();
  uint64_t v22 = (void *)(v20 - v21);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_48_5();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v47 - v25;
  uint64_t v27 = type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage(0);
  uint64_t v28 = *(int *)(v27 + 28);
  uint64_t v51 = v5;
  uint64_t v29 = (uint64_t)v5 + v28;
  uint64_t v30 = v27;
  sub_247CAC68C(v29, (uint64_t)v26, &qword_2692AAA08);
  uint64_t v31 = *(int *)(v30 + 28);
  int v52 = v3;
  sub_247CAC68C((uint64_t)v3 + v31, v0, &qword_2692AAA08);
  uint64_t v32 = v1 + *(int *)(v17 + 56);
  sub_247CAC68C((uint64_t)v26, v1, &qword_2692AAA08);
  sub_247CAC68C(v0, v32, &qword_2692AAA08);
  OUTLINED_FUNCTION_8_0(v1, 1, v11);
  if (v36)
  {
    sub_247ACB4EC(v0, &qword_2692AAA08);
    sub_247ACB4EC((uint64_t)v26, &qword_2692AAA08);
    OUTLINED_FUNCTION_8_0(v32, 1, v11);
    if (v36)
    {
      sub_247ACB4EC(v1, &qword_2692AAA08);
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  sub_247CAC68C(v1, (uint64_t)v22, &qword_2692AAA08);
  OUTLINED_FUNCTION_8_0(v32, 1, v11);
  if (v36)
  {
    sub_247ACB4EC(v0, &qword_2692AAA08);
    OUTLINED_FUNCTION_185_0();
    sub_247CAC5E8((uint64_t)v22, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
LABEL_13:
    uint64_t v37 = &qword_2692AD1E0;
    uint64_t v38 = v1;
LABEL_19:
    sub_247ACB4EC(v38, v37);
    goto LABEL_20;
  }
  sub_247CAC504(v32, (uint64_t)v15, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
  if (*v22 != *v15 || v22[1] != v15[1])
  {
    sub_247CAC5E8((uint64_t)v15, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
    sub_247ACB4EC(v0, &qword_2692AAA08);
    sub_247ACB4EC((uint64_t)v26, &qword_2692AAA08);
    sub_247CAC5E8((uint64_t)v22, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
    uint64_t v38 = v1;
    uint64_t v37 = &qword_2692AAA08;
    goto LABEL_19;
  }
  sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
  OUTLINED_FUNCTION_116_2();
  char v39 = sub_247CBDD48();
  sub_247CAC5E8((uint64_t)v15, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
  sub_247ACB4EC(v0, &qword_2692AAA08);
  sub_247ACB4EC((uint64_t)v26, &qword_2692AAA08);
  sub_247CAC5E8((uint64_t)v22, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
  sub_247ACB4EC(v1, &qword_2692AAA08);
  if ((v39 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_6:
  if (*v51 != *v52) {
    goto LABEL_20;
  }
  uint64_t v33 = *(int *)(v30 + 32);
  int v34 = *((unsigned __int8 *)v51 + v33);
  int v35 = *((unsigned __int8 *)v52 + v33);
  if (v34 == 2)
  {
    if (v35 != 2) {
      goto LABEL_20;
    }
  }
  else if (v35 == 2 || ((((v35 & 1) == 0) ^ v34) & 1) == 0)
  {
    goto LABEL_20;
  }
  sub_247C6829C();
  if (v40)
  {
    uint64_t v42 = v49;
    uint64_t v41 = v50;
    uint64_t v43 = *(void (**)(void))(v49 + 16);
    OUTLINED_FUNCTION_18_10();
    v43();
    uint64_t v44 = v48;
    OUTLINED_FUNCTION_18_10();
    v43();
    sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
    sub_247CBDD48();
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v45(v44, v41);
    uint64_t v46 = OUTLINED_FUNCTION_347_0();
    ((void (*)(uint64_t))v45)(v46);
  }
LABEL_20:
  OUTLINED_FUNCTION_64();
}

unint64_t sub_247CA3044()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_247CA3060(uint64_t a1, uint64_t a2)
{
  return sub_247CA2530(a1, a2);
}

uint64_t sub_247CA3078()
{
  return sub_247CA27B0();
}

uint64_t sub_247CA3090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE540, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA310C(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9D88, (uint64_t)qword_2692C8190);
}

uint64_t sub_247CA3130(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AABB0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA319C()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage);
}

uint64_t sub_247CA31F8()
{
  sub_247CAAE6C(&qword_2692AABB0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage);
  return sub_247CBD658();
}

uint64_t sub_247CA3278()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C81A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C81A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CCDE00;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "acceptLabel";
  *(void *)(v6 + 8) = 11;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "acceptAlternatives";
  *(void *)(v10 + 8) = 18;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "denyLabel";
  *((void *)v12 + 1) = 9;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 4;
  *(void *)uint64_t v14 = "denyAlternatives";
  *((void *)v14 + 1) = 16;
  v14[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA34AC()
{
  uint64_t result = OUTLINED_FUNCTION_19_11();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          OUTLINED_FUNCTION_32_7();
          break;
        case 2:
        case 4:
          sub_247CBD558();
          break;
        case 3:
          OUTLINED_FUNCTION_71_4();
          break;
        default:
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_153_2();
    }
  }
  return result;
}

uint64_t sub_247CA358C()
{
  uint64_t result = sub_247CA3E78();
  if (!v1)
  {
    if (*(void *)(*v0 + 16)) {
      OUTLINED_FUNCTION_130_2();
    }
    OUTLINED_FUNCTION_8_19();
    sub_247CA6D98();
    if (*(void *)(v0[1] + 16)) {
      OUTLINED_FUNCTION_130_2();
    }
    type metadata accessor for AppIntentsProtobuf_ConfirmationActionName(0);
    return OUTLINED_FUNCTION_56_6();
  }
  return result;
}

void sub_247CA3688()
{
  OUTLINED_FUNCTION_114_2();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_419_0();
  type metadata accessor for AppIntentsProtobuf_ConfirmationActionName(v6);
  OUTLINED_FUNCTION_129_2();
  if (!v9)
  {
    if (v7) {
      goto LABEL_22;
    }
LABEL_10:
    if ((sub_247C6733C(*v1, *(void **)v0) & 1) == 0) {
      goto LABEL_22;
    }
    OUTLINED_FUNCTION_129_2();
    if (v15)
    {
      if (!v13) {
        goto LABEL_22;
      }
      OUTLINED_FUNCTION_56_5(v14);
      BOOL v18 = v12 && v16 == v17;
      if (!v18 && (sub_247CBE998() & 1) == 0) {
        goto LABEL_22;
      }
    }
    else if (v13)
    {
      goto LABEL_22;
    }
    if (sub_247C6733C(v1[1], *((void **)v0 + 1)))
    {
      uint64_t v19 = *(void (**)(void))(v3 + 16);
      OUTLINED_FUNCTION_49_6();
      v19();
      OUTLINED_FUNCTION_49_6();
      v19();
      sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
      OUTLINED_FUNCTION_58_4();
      uint64_t v20 = OUTLINED_FUNCTION_157_2();
      v0(v20);
      uint64_t v21 = OUTLINED_FUNCTION_441_0();
      v0(v21);
    }
    goto LABEL_22;
  }
  if (v7)
  {
    OUTLINED_FUNCTION_56_5(v8);
    BOOL v12 = v12 && v10 == v11;
    if (v12 || (sub_247CBE998() & 1) != 0) {
      goto LABEL_10;
    }
  }
LABEL_22:
  OUTLINED_FUNCTION_97_4();
  OUTLINED_FUNCTION_116_1();
}

unint64_t sub_247CA381C()
{
  return 0xD000000000000029;
}

uint64_t sub_247CA3838()
{
  return sub_247CA34AC();
}

uint64_t sub_247CA3850()
{
  return sub_247CA358C();
}

uint64_t sub_247CA3868(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE548, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA38E4(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9D90, (uint64_t)qword_2692C81A8);
}

uint64_t sub_247CA3908(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAAA0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA3974()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
}

uint64_t sub_247CA39D0()
{
  sub_247CAAE6C(&qword_2692AAAA0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
  return sub_247CBD658();
}

uint64_t sub_247CA3A50()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C81C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C81C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CD1260;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "type";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 10;
  *(void *)uint64_t v10 = "fullString";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  BOOL v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 11;
  *(void *)BOOL v12 = "supportingString";
  *((void *)v12 + 1) = 16;
  v12[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA3C48(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_9(a1, a2);
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 11:
        OUTLINED_FUNCTION_32_7();
        break;
      case 10:
        OUTLINED_FUNCTION_33_9();
        break;
      case 1:
        OUTLINED_FUNCTION_6_15();
        sub_247CA3CE8();
        break;
    }
    OUTLINED_FUNCTION_82_2();
  }
  return result;
}

uint64_t sub_247CA3CE8()
{
  return sub_247CBD508();
}

uint64_t sub_247CA3D50()
{
  uint64_t v0 = OUTLINED_FUNCTION_164_1();
  v1(v0);
  return OUTLINED_FUNCTION_142_2();
}

uint64_t sub_247CA3D90()
{
  OUTLINED_FUNCTION_219_1();
  if (!*v1 || (sub_247CAC640(), uint64_t v2 = v0, result = sub_247CBD688(), !v0))
  {
    OUTLINED_FUNCTION_346_0();
    uint64_t result = sub_247CA6CD4();
    if (!v2)
    {
      OUTLINED_FUNCTION_346_0();
      sub_247CA3E78();
      type metadata accessor for AppIntentsProtobuf_Dialog(0);
      return OUTLINED_FUNCTION_18_16();
    }
  }
  return result;
}

uint64_t sub_247CA3E78()
{
  uint64_t v1 = OUTLINED_FUNCTION_126_2();
  uint64_t result = v2(v1);
  if (*(void *)(v0 + *(int *)(result + 28) + 8)) {
    return OUTLINED_FUNCTION_80_3();
  }
  return result;
}

void sub_247CA3ED8()
{
  OUTLINED_FUNCTION_114_2();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = *v1;
  uint64_t v7 = *v0;
  if (*((unsigned char *)v1 + 8)) {
    uint64_t v6 = *v1 != 0;
  }
  if (*((unsigned char *)v0 + 8) == 1)
  {
    if (v7)
    {
      if (v6 != 1) {
        goto LABEL_28;
      }
    }
    else if (v6)
    {
      goto LABEL_28;
    }
  }
  else if (v6 != v7)
  {
    goto LABEL_28;
  }
  type metadata accessor for AppIntentsProtobuf_Dialog(0);
  OUTLINED_FUNCTION_129_2();
  if (!v10)
  {
    if (v8) {
      goto LABEL_28;
    }
LABEL_19:
    OUTLINED_FUNCTION_129_2();
    if (v16)
    {
      if (!v14) {
        goto LABEL_28;
      }
      OUTLINED_FUNCTION_56_5(v15);
      BOOL v19 = v13 && v17 == v18;
      if (!v19 && (sub_247CBE998() & 1) == 0) {
        goto LABEL_28;
      }
    }
    else if (v14)
    {
      goto LABEL_28;
    }
    uint64_t v20 = *(void (**)(void))(v3 + 16);
    OUTLINED_FUNCTION_49_6();
    v20();
    OUTLINED_FUNCTION_49_6();
    v20();
    sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_58_4();
    uint64_t v21 = OUTLINED_FUNCTION_157_2();
    ((void (*)(uint64_t))v0)(v21);
    uint64_t v22 = OUTLINED_FUNCTION_441_0();
    ((void (*)(uint64_t))v0)(v22);
    goto LABEL_28;
  }
  if (v8)
  {
    OUTLINED_FUNCTION_56_5(v9);
    BOOL v13 = v13 && v11 == v12;
    if (v13 || (sub_247CBE998() & 1) != 0) {
      goto LABEL_19;
    }
  }
LABEL_28:
  OUTLINED_FUNCTION_97_4();
  OUTLINED_FUNCTION_116_1();
}

unint64_t sub_247CA40A0()
{
  return 0xD000000000000019;
}

uint64_t sub_247CA40BC(uint64_t a1, uint64_t a2)
{
  return sub_247CA3C48(a1, a2);
}

uint64_t sub_247CA40D4()
{
  return sub_247CA3D90();
}

uint64_t sub_247CA40EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE550, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Dialog);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA4168(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9D98, (uint64_t)qword_2692C81C0);
}

uint64_t sub_247CA418C(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAA98, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Dialog);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA41F8()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_Dialog);
}

uint64_t sub_247CA4254()
{
  sub_247CAAE6C(&qword_2692AAA98, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Dialog);
  return sub_247CBD658();
}

uint64_t sub_247CA42D4()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C81D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C81D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CCBD90;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 0;
  *(void *)unint64_t v6 = "DIALOG_UNKNOWN";
  *(void *)(v6 + 8) = 14;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)uint64_t v10 = "DIALOG_LOCALIZED_STRINGS";
  *((void *)v10 + 1) = 24;
  v10[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA448C(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DA0, (uint64_t)qword_2692C81D8);
}

uint64_t sub_247CA44B0()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C81F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C81F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CD1260;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "imageData";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "renderingMode";
  *((void *)v10 + 1) = 13;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "displayStyle";
  *((void *)v12 + 1) = 12;
  v12[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA46A8(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_9(a1, a2);
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 3:
        OUTLINED_FUNCTION_117_3();
        break;
      case 2:
        OUTLINED_FUNCTION_6_15();
        sub_247CA479C();
        break;
      case 1:
        OUTLINED_FUNCTION_6_15();
        sub_247CA4738();
        break;
    }
    OUTLINED_FUNCTION_82_2();
  }
  return result;
}

uint64_t sub_247CA4738()
{
  return sub_247CBD518();
}

uint64_t sub_247CA479C()
{
  return sub_247CBD538();
}

uint64_t sub_247CA4800()
{
  uint64_t v1 = OUTLINED_FUNCTION_11_13();
  uint64_t result = sub_247CA4878(v1);
  if (!v0)
  {
    uint64_t v3 = OUTLINED_FUNCTION_11_13();
    sub_247CA4918(v3);
    OUTLINED_FUNCTION_11_13();
    sub_247CA6D34();
    return sub_247CBD3E8();
  }
  return result;
}

uint64_t sub_247CA4878(uint64_t a1)
{
  uint64_t result = type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
  uint64_t v3 = a1 + *(int *)(result + 20);
  unint64_t v4 = *(void *)(v3 + 8);
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *(void *)v3;
    sub_247ADF298(*(void *)v3, *(void *)(v3 + 8));
    sub_247CBD698();
    return sub_247B0AC80(v5, v4);
  }
  return result;
}

uint64_t sub_247CA4918(uint64_t a1)
{
  uint64_t result = type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 24) + 8) & 1) == 0) {
    return sub_247CBD6A8();
  }
  return result;
}

void sub_247CA4990()
{
  OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_419_0();
  uint64_t v6 = *(int *)(type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(v5) + 20);
  uint64_t v7 = *(void *)(v1 + v6);
  unint64_t v8 = *(void *)(v1 + v6 + 8);
  uint64_t v9 = (uint64_t *)(v0 + v6);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  if (v8 >> 60 == 15)
  {
    OUTLINED_FUNCTION_110_1();
    if (!(!v13 & v12)) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_110_1();
  if (!v13 & v12)
  {
LABEL_7:
    uint64_t v14 = OUTLINED_FUNCTION_85_3();
    sub_247B0AC80(v14, v15);
    sub_247B0AC80(v10, v11);
    goto LABEL_8;
  }
  uint64_t v16 = OUTLINED_FUNCTION_85_3();
  char v17 = MEMORY[0x24C5665C0](v16);
  sub_247B0AC80(v10, v11);
  sub_247B0AC80(v7, v8);
  if (v17)
  {
LABEL_10:
    OUTLINED_FUNCTION_128_1();
    if (v19)
    {
      if (!v18) {
        goto LABEL_8;
      }
    }
    else
    {
      OUTLINED_FUNCTION_127_2();
      if (v20) {
        goto LABEL_8;
      }
    }
    OUTLINED_FUNCTION_128_1();
    if (v22)
    {
      if (!v21) {
        goto LABEL_8;
      }
    }
    else
    {
      OUTLINED_FUNCTION_127_2();
      if (v23) {
        goto LABEL_8;
      }
    }
    uint64_t v24 = *(void (**)(void))(v26 + 16);
    OUTLINED_FUNCTION_92_4();
    OUTLINED_FUNCTION_18_10();
    v24();
    OUTLINED_FUNCTION_82_2();
    OUTLINED_FUNCTION_18_10();
    v24();
    sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_92_4();
    sub_247CBDD48();
    uint64_t v25 = *(void (**)(void))(v26 + 8);
    OUTLINED_FUNCTION_79_3();
    v25();
    OUTLINED_FUNCTION_79_3();
    v25();
  }
LABEL_8:
  OUTLINED_FUNCTION_64();
}

unint64_t sub_247CA4B74()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_247CA4B90()
{
  sub_247CBD408();
  OUTLINED_FUNCTION_20();
  uint64_t v0 = OUTLINED_FUNCTION_203_1();
  return v1(v0);
}

uint64_t sub_247CA4BE8(uint64_t a1, uint64_t a2)
{
  return sub_247CA46A8(a1, a2);
}

uint64_t sub_247CA4C00()
{
  return sub_247CA4800();
}

uint64_t sub_247CA4C18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE560, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA4C94(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DA8, (uint64_t)qword_2692C81F0);
}

uint64_t sub_247CA4CB8(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AE470, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA4D24()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
}

uint64_t sub_247CA4D80()
{
  sub_247CAAE6C(&qword_2692AE470, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
  return sub_247CBD658();
}

uint64_t sub_247CA4E00()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8208);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8208);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CCDE00;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "title";
  *(void *)(v6 + 8) = 5;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "subtitle";
  *(void *)(v10 + 8) = 8;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  unint64_t v11 = (void *)(v5 + 2 * v2);
  char v12 = (char *)v11 + v1[14];
  *unint64_t v11 = 3;
  *(void *)char v12 = "synonyms";
  *((void *)v12 + 1) = 8;
  v12[16] = 2;
  v9();
  char v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 4;
  *(void *)uint64_t v14 = "image";
  *((void *)v14 + 1) = 5;
  v14[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA5030()
{
  uint64_t result = OUTLINED_FUNCTION_19_11();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          OUTLINED_FUNCTION_59_5();
          break;
        case 2:
          OUTLINED_FUNCTION_32_7();
          break;
        case 3:
          sub_247CBD558();
          break;
        case 4:
          OUTLINED_FUNCTION_6_15();
          sub_247CA5104();
          break;
        default:
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_153_2();
    }
  }
  return result;
}

uint64_t sub_247CA5104()
{
  return sub_247CBD5E8();
}

uint64_t sub_247CA51B4()
{
  OUTLINED_FUNCTION_20_10();
  if (!v2 || (uint64_t result = sub_247CBD6E8(), !v1))
  {
    OUTLINED_FUNCTION_200_1();
    uint64_t result = sub_247CA3E78();
    if (!v1)
    {
      if (*(void *)(*(void *)(v0 + 16) + 16)) {
        sub_247CBD6B8();
      }
      uint64_t v4 = OUTLINED_FUNCTION_200_1();
      sub_247CA52B4(v4);
      type metadata accessor for AppIntentsProtobuf_DisplayRepresentation(0);
      return sub_247CBD3E8();
    }
  }
  return result;
}

uint64_t sub_247CA52B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA18);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppIntentsProtobuf_DisplayRepresentation(0);
  sub_247CAC68C(a1 + *(int *)(v8 + 32), (uint64_t)v4, &qword_2692AAA18);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AAA18);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
  sub_247CAAE6C(&qword_2692AE470, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
}

void sub_247CA5480()
{
  OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v52 = v6;
  uint64_t v53 = v5;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_36_10(v7, v50);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v17 = OUTLINED_FUNCTION_42_3(v9, v10, v11, v12, v13, v14, v15, v16, v50);
  uint64_t v18 = type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(v17);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_47_0();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE530);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_20_1();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA18);
  uint64_t v23 = OUTLINED_FUNCTION_2_3(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_113();
  uint64_t v26 = v24 - v25;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_48_5();
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v50 - v29;
  OUTLINED_FUNCTION_30_10();
  BOOL v33 = v33 && v31 == v32;
  if (!v33 && (sub_247CBE998() & 1) == 0) {
    goto LABEL_27;
  }
  uint64_t v51 = type metadata accessor for AppIntentsProtobuf_DisplayRepresentation(0);
  OUTLINED_FUNCTION_129_2();
  if (!v36)
  {
    if (v34) {
      goto LABEL_27;
    }
LABEL_15:
    if ((sub_247C6733C(*(void **)(v2 + 16), *(void **)(v1 + 16)) & 1) == 0) {
      goto LABEL_27;
    }
    uint64_t v40 = v51;
    sub_247CAC68C(v2 + *(int *)(v51 + 32), (uint64_t)v30, &qword_2692AAA18);
    sub_247CAC68C(v1 + *(int *)(v40 + 32), v0, &qword_2692AAA18);
    uint64_t v41 = v3 + *(int *)(v20 + 48);
    sub_247CAC68C((uint64_t)v30, v3, &qword_2692AAA18);
    sub_247CAC68C(v0, v41, &qword_2692AAA18);
    OUTLINED_FUNCTION_8_0(v3, 1, v18);
    if (v33)
    {
      sub_247ACB4EC(v0, &qword_2692AAA18);
      OUTLINED_FUNCTION_381_0();
      OUTLINED_FUNCTION_8_0(v41, 1, v18);
      if (v33)
      {
        sub_247ACB4EC(v3, &qword_2692AAA18);
        goto LABEL_26;
      }
    }
    else
    {
      sub_247CAC68C(v3, v26, &qword_2692AAA18);
      uint64_t v43 = OUTLINED_FUNCTION_8_0(v41, 1, v18);
      if (!v42)
      {
        OUTLINED_FUNCTION_115_3(v43, v44, (void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
        sub_247CA4990();
        char v46 = v45;
        sub_247CAC5E8(v4, (void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
        sub_247ACB4EC(v0, &qword_2692AAA18);
        OUTLINED_FUNCTION_381_0();
        sub_247CAC5E8(v26, (void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
        sub_247ACB4EC(v3, &qword_2692AAA18);
        if ((v46 & 1) == 0) {
          goto LABEL_27;
        }
LABEL_26:
        uint64_t v47 = v52;
        uint64_t v48 = *(void (**)(void))(v52 + 16);
        OUTLINED_FUNCTION_18_10();
        v48();
        OUTLINED_FUNCTION_18_10();
        v48();
        sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
        sub_247CBDD48();
        uint64_t v49 = *(void (**)(void))(v47 + 8);
        OUTLINED_FUNCTION_143_0();
        v49();
        OUTLINED_FUNCTION_347_0();
        OUTLINED_FUNCTION_143_0();
        v49();
        goto LABEL_27;
      }
      sub_247ACB4EC(v0, &qword_2692AAA18);
      OUTLINED_FUNCTION_185_0();
      sub_247CAC5E8(v26, (void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
    }
    sub_247ACB4EC(v3, &qword_2692AE530);
    goto LABEL_27;
  }
  if (v34)
  {
    OUTLINED_FUNCTION_56_5(v35);
    BOOL v39 = v33 && v37 == v38;
    if (v39 || (sub_247CBE998() & 1) != 0) {
      goto LABEL_15;
    }
  }
LABEL_27:
  OUTLINED_FUNCTION_64();
}

unint64_t sub_247CA58A8()
{
  return 0xD000000000000028;
}

uint64_t sub_247CA58C4()
{
  return sub_247CA5030();
}

uint64_t sub_247CA58DC()
{
  return sub_247CA51B4();
}

uint64_t sub_247CA58F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE568, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentation);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA5970(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DB0, (uint64_t)qword_2692C8208);
}

uint64_t sub_247CA5994(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAAC0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentation);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA5A00()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentation);
}

uint64_t sub_247CA5A5C()
{
  sub_247CAAE6C(&qword_2692AAAC0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentation);
  return sub_247CBD658();
}

uint64_t sub_247CA5ADC()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8220);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8220);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CCBD90;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "type";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "instance";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA5C94()
{
  uint64_t result = OUTLINED_FUNCTION_19_11();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1) {
        sub_247CBD598();
      }
      uint64_t result = OUTLINED_FUNCTION_153_2();
    }
  }
  return result;
}

uint64_t sub_247CA5D08()
{
  OUTLINED_FUNCTION_20_10();
  if (!v1 || (uint64_t result = OUTLINED_FUNCTION_80_3(), !v0))
  {
    OUTLINED_FUNCTION_20_10();
    if (!v3 || (uint64_t result = OUTLINED_FUNCTION_80_3(), !v0))
    {
      type metadata accessor for AppIntentsProtobuf_EntityIdentifier(0);
      return OUTLINED_FUNCTION_18_16();
    }
  }
  return result;
}

void sub_247CA5DA0()
{
  OUTLINED_FUNCTION_114_2();
  uint64_t v3 = OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_96_2();
  BOOL v10 = v10 && v8 == v9;
  if (v10 || (sub_247CBE998() & 1) != 0)
  {
    BOOL v11 = *(void *)(v2 + 16) == *(void *)(v1 + 16) && *(void *)(v2 + 24) == *(void *)(v1 + 24);
    if (v11 || (sub_247CBE998() & 1) != 0)
    {
      type metadata accessor for AppIntentsProtobuf_EntityIdentifier(0);
      uint64_t v12 = *(void (**)(void))(v5 + 16);
      OUTLINED_FUNCTION_49_6();
      v12();
      OUTLINED_FUNCTION_49_6();
      v12();
      sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
      OUTLINED_FUNCTION_58_4();
      uint64_t v13 = *(void (**)(void))(v5 + 8);
      OUTLINED_FUNCTION_79_3();
      v13();
      ((void (*)(uint64_t, uint64_t))v13)(v0, v3);
    }
  }
  OUTLINED_FUNCTION_116_1();
}

unint64_t sub_247CA5F00()
{
  return 0xD000000000000023;
}

uint64_t sub_247CA5F1C()
{
  return sub_247CA5C94();
}

uint64_t sub_247CA5F34()
{
  return sub_247CA5D08();
}

uint64_t sub_247CA5F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE570, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_EntityIdentifier);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA5FC8(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DB8, (uint64_t)qword_2692C8220);
}

uint64_t sub_247CA5FEC(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAB60, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_EntityIdentifier);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA6058()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_EntityIdentifier);
}

uint64_t sub_247CA60B4()
{
  sub_247CAAE6C(&qword_2692AAB60, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_EntityIdentifier);
  return sub_247CBD658();
}

uint64_t sub_247CA6134(uint64_t a1)
{
  return sub_247C21D6C(a1, qword_2692C8238, (uint64_t)"localeIdentifier", 16);
}

uint64_t sub_247CA614C@<X0>(void *a1@<X8>)
{
  return sub_247C9A6F0(a1);
}

unint64_t sub_247CA6178()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_247CA6194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247CA9E78(a1, a2, a3, MEMORY[0x263F50660]);
}

uint64_t sub_247CA61C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247CA9094(a1, a2, a3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Environment);
}

uint64_t sub_247CA61EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE578, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Environment);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA6268(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DC0, (uint64_t)qword_2692C8238);
}

uint64_t sub_247CA628C(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AA980, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Environment);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA62F8()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_Environment);
}

uint64_t sub_247CA6354()
{
  sub_247CAAE6C(&qword_2692AA980, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Environment);
  return sub_247CBD658();
}

uint64_t sub_247CA63D0()
{
  sub_247CA9118();
  return v0 & 1;
}

uint64_t sub_247CA6400(uint64_t a1)
{
  return sub_247C21D6C(a1, qword_2692C8250, (uint64_t)"nsErrorBytes", 12);
}

uint64_t sub_247CA6418@<X0>(_OWORD *a1@<X8>)
{
  return sub_247C99EA4((void (*)(void))type metadata accessor for AppIntentsProtobuf_Error, a1);
}

unint64_t sub_247CA6444()
{
  return 0xD000000000000018;
}

uint64_t sub_247CA6460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247CA9E78(a1, a2, a3, MEMORY[0x263F505F0]);
}

uint64_t sub_247CA648C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247CA9AF8(a1, a2, a3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
}

uint64_t sub_247CA64B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE580, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Error);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA6534(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DC8, (uint64_t)qword_2692C8250);
}

uint64_t sub_247CA6558(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAA68, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Error);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA65C4()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
}

uint64_t sub_247CA6620()
{
  sub_247CAAE6C(&qword_2692AAA68, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Error);
  return sub_247CBD658();
}

uint64_t sub_247CA669C()
{
  sub_247CA9EF8();
  return v0 & 1;
}

uint64_t sub_247CA66CC()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8268);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8268);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CD2E80;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "name";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "url";
  *(void *)(v10 + 8) = 3;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  BOOL v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *BOOL v11 = 3;
  *(void *)uint64_t v12 = "size";
  *((void *)v12 + 1) = 4;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 4;
  *(void *)uint64_t v14 = "uttype";
  *((void *)v14 + 1) = 6;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 10;
  *(void *)uint64_t v16 = "error";
  *((void *)v16 + 1) = 5;
  v16[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA6938(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_9(a1, a2);
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v2 || (v4 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
        OUTLINED_FUNCTION_59_5();
        break;
      case 2:
        OUTLINED_FUNCTION_33_9();
        break;
      case 3:
        OUTLINED_FUNCTION_117_3();
        break;
      case 4:
        OUTLINED_FUNCTION_71_4();
        break;
      case 10:
        OUTLINED_FUNCTION_6_15();
        sub_247CA6B0C();
        break;
      default:
        break;
    }
    OUTLINED_FUNCTION_82_2();
  }
}

uint64_t sub_247CA6A40()
{
  uint64_t v0 = OUTLINED_FUNCTION_164_1();
  v1(v0);
  return OUTLINED_FUNCTION_142_2();
}

uint64_t sub_247CA6A80()
{
  uint64_t v0 = OUTLINED_FUNCTION_75_4();
  v1(v0);
  OUTLINED_FUNCTION_104_3();
  return sub_247CBD538();
}

uint64_t sub_247CA6ACC()
{
  uint64_t v0 = OUTLINED_FUNCTION_164_1();
  v1(v0);
  return OUTLINED_FUNCTION_142_2();
}

uint64_t sub_247CA6B0C()
{
  return sub_247CBD5E8();
}

uint64_t sub_247CA6BBC()
{
  OUTLINED_FUNCTION_67_5();
  OUTLINED_FUNCTION_20_10();
  if (!v1 || (uint64_t result = OUTLINED_FUNCTION_158_2(), !v0))
  {
    OUTLINED_FUNCTION_8_19();
    uint64_t result = sub_247CA6CD4();
    if (!v0)
    {
      OUTLINED_FUNCTION_8_19();
      sub_247CA6D34();
      OUTLINED_FUNCTION_8_19();
      sub_247CA6D98();
      OUTLINED_FUNCTION_8_19();
      sub_247CA6DF8(v3);
      type metadata accessor for AppIntentsProtobuf_FileDescriptor(0);
      return OUTLINED_FUNCTION_56_6();
    }
  }
  return result;
}

uint64_t sub_247CA6CD4()
{
  uint64_t v1 = OUTLINED_FUNCTION_126_2();
  uint64_t result = v2(v1);
  if (*(void *)(v0 + *(int *)(result + 24) + 8)) {
    return OUTLINED_FUNCTION_80_3();
  }
  return result;
}

uint64_t sub_247CA6D34()
{
  uint64_t v1 = OUTLINED_FUNCTION_75_4();
  uint64_t result = v2(v1);
  if ((*(unsigned char *)(v0 + *(int *)(result + 28) + 8) & 1) == 0) {
    return sub_247CBD6A8();
  }
  return result;
}

uint64_t sub_247CA6D98()
{
  uint64_t v1 = OUTLINED_FUNCTION_126_2();
  uint64_t result = v2(v1);
  if (*(void *)(v0 + *(int *)(result + 32) + 8)) {
    return OUTLINED_FUNCTION_80_3();
  }
  return result;
}

uint64_t sub_247CA6DF8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC10);
  MEMORY[0x270FA5388](v2 - 8);
  char v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_Error(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppIntentsProtobuf_FileDescriptor(0);
  sub_247CAC68C(a1 + *(int *)(v8 + 36), (uint64_t)v4, &qword_2692AAC10);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AAC10);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
  sub_247CAAE6C(&qword_2692AAA68, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Error);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
}

void sub_247CA6FC4()
{
  OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v56 = v6;
  uint64_t v57 = v5;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10_1();
  uint64_t v55 = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v54 = (char *)&v53 - v9;
  type metadata accessor for AppIntentsProtobuf_Error(0);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_47_0();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE590);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_9_0();
  uint64_t v58 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC10);
  uint64_t v15 = OUTLINED_FUNCTION_2_3(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_78_3();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_48_5();
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v53 - v18;
  OUTLINED_FUNCTION_30_10();
  BOOL v22 = v22 && v20 == v21;
  if (!v22 && (sub_247CBE998() & 1) == 0) {
    goto LABEL_42;
  }
  uint64_t v23 = type metadata accessor for AppIntentsProtobuf_FileDescriptor(0);
  OUTLINED_FUNCTION_129_2();
  if (!v26)
  {
    if (v24) {
      goto LABEL_42;
    }
LABEL_15:
    OUTLINED_FUNCTION_128_1();
    if (v31)
    {
      if (!v30) {
        goto LABEL_42;
      }
    }
    else
    {
      OUTLINED_FUNCTION_127_2();
      if (v32) {
        goto LABEL_42;
      }
    }
    OUTLINED_FUNCTION_129_2();
    if (v35)
    {
      if (!v33) {
        goto LABEL_42;
      }
      OUTLINED_FUNCTION_56_5(v34);
      BOOL v38 = v22 && v36 == v37;
      if (!v38 && (sub_247CBE998() & 1) == 0) {
        goto LABEL_42;
      }
    }
    else if (v33)
    {
      goto LABEL_42;
    }
    sub_247CAC68C(v2 + *(int *)(v23 + 36), (uint64_t)v19, &qword_2692AAC10);
    sub_247CAC68C(v1 + *(int *)(v23 + 36), v0, &qword_2692AAC10);
    uint64_t v39 = v58;
    uint64_t v40 = OUTLINED_FUNCTION_106_3();
    sub_247CAC68C(v40, v41, &qword_2692AAC10);
    uint64_t v53 = v11;
    sub_247CAC68C(v0, v11, &qword_2692AAC10);
    OUTLINED_FUNCTION_14_17(v39);
    if (v22)
    {
      sub_247ACB4EC(v0, &qword_2692AAC10);
      uint64_t v39 = v58;
      sub_247ACB4EC((uint64_t)v19, &qword_2692AAC10);
      OUTLINED_FUNCTION_14_17(v53);
      if (v22)
      {
        sub_247ACB4EC(v39, &qword_2692AAC10);
        uint64_t v42 = v57;
        goto LABEL_39;
      }
    }
    else
    {
      sub_247CAC68C(v39, (uint64_t)v3, &qword_2692AAC10);
      uint64_t v44 = OUTLINED_FUNCTION_14_17(v53);
      if (!v43)
      {
        OUTLINED_FUNCTION_115_3(v44, v45, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
        if (MEMORY[0x24C5665C0](*v3, v3[1], *v4, v4[1]))
        {
          sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
          uint64_t v42 = v57;
          char v48 = sub_247CBDD48();
          sub_247CAC5E8((uint64_t)v4, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
          sub_247ACB4EC(v0, &qword_2692AAC10);
          sub_247ACB4EC((uint64_t)v19, &qword_2692AAC10);
          sub_247CAC5E8((uint64_t)v3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
          sub_247ACB4EC(v58, &qword_2692AAC10);
          if ((v48 & 1) == 0) {
            goto LABEL_42;
          }
LABEL_39:
          uint64_t v49 = v2 + *(int *)(v23 + 20);
          uint64_t v50 = v56;
          uint64_t v51 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 16);
          v51(v54, v49, v42);
          v51(v55, v1 + *(int *)(v23 + 20), v42);
          sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
          OUTLINED_FUNCTION_109_2();
          sub_247CBDD48();
          uint64_t v52 = *(void (**)(void))(v50 + 8);
          OUTLINED_FUNCTION_143_0();
          v52();
          OUTLINED_FUNCTION_143_0();
          v52();
          goto LABEL_42;
        }
        sub_247CAC5E8((uint64_t)v4, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
        sub_247ACB4EC(v0, &qword_2692AAC10);
        sub_247ACB4EC((uint64_t)v19, &qword_2692AAC10);
        sub_247CAC5E8((uint64_t)v3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
        uint64_t v47 = v39;
        char v46 = &qword_2692AAC10;
LABEL_41:
        sub_247ACB4EC(v47, v46);
        goto LABEL_42;
      }
      sub_247ACB4EC(v0, &qword_2692AAC10);
      sub_247ACB4EC((uint64_t)v19, &qword_2692AAC10);
      sub_247CAC5E8((uint64_t)v3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
    }
    char v46 = &qword_2692AE590;
    uint64_t v47 = v39;
    goto LABEL_41;
  }
  if (v24)
  {
    OUTLINED_FUNCTION_56_5(v25);
    BOOL v29 = v22 && v27 == v28;
    if (v29 || (sub_247CBE998() & 1) != 0) {
      goto LABEL_15;
    }
  }
LABEL_42:
  OUTLINED_FUNCTION_64();
}

unint64_t sub_247CA750C()
{
  return 0xD000000000000021;
}

uint64_t sub_247CA7528(uint64_t a1, uint64_t a2)
{
  return sub_247CA6938(a1, a2);
}

uint64_t sub_247CA7540()
{
  return sub_247CA6BBC();
}

uint64_t sub_247CA7558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE588, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_FileDescriptor);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA75D4(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DD0, (uint64_t)qword_2692C8268);
}

uint64_t sub_247CA75F8(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692ABC00, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_FileDescriptor);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA7664()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_FileDescriptor);
}

uint64_t sub_247CA76C0()
{
  sub_247CAAE6C(&qword_2692ABC00, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_FileDescriptor);
  return sub_247CBD658();
}

uint64_t sub_247CA7740()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8280);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CD1260;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "name";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "title";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "parameterDescription";
  *((void *)v12 + 1) = 20;
  v12[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA7938(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_9(a1, a2);
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 3:
        OUTLINED_FUNCTION_32_7();
        break;
      case 2:
        OUTLINED_FUNCTION_33_9();
        break;
      case 1:
        OUTLINED_FUNCTION_59_5();
        break;
    }
    OUTLINED_FUNCTION_82_2();
  }
  return result;
}

uint64_t sub_247CA79D4()
{
  OUTLINED_FUNCTION_20_10();
  if (!v1 || (uint64_t result = OUTLINED_FUNCTION_80_3(), !v0))
  {
    uint64_t result = OUTLINED_FUNCTION_81_4();
    if (!v0)
    {
      OUTLINED_FUNCTION_346_0();
      sub_247CA3E78();
      type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata(0);
      return OUTLINED_FUNCTION_18_16();
    }
  }
  return result;
}

void sub_247CA7A94()
{
  OUTLINED_FUNCTION_114_2();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_96_2();
  BOOL v7 = v7 && v5 == v6;
  if (!v7 && (sub_247CBE998() & 1) == 0) {
    goto LABEL_26;
  }
  type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata(0);
  OUTLINED_FUNCTION_129_2();
  if (!v10)
  {
    if (v8) {
      goto LABEL_26;
    }
LABEL_15:
    OUTLINED_FUNCTION_129_2();
    if (v16)
    {
      if (!v14) {
        goto LABEL_26;
      }
      OUTLINED_FUNCTION_56_5(v15);
      BOOL v19 = v7 && v17 == v18;
      if (!v19 && (sub_247CBE998() & 1) == 0) {
        goto LABEL_26;
      }
    }
    else if (v14)
    {
      goto LABEL_26;
    }
    uint64_t v20 = *(void (**)(void))(v2 + 16);
    OUTLINED_FUNCTION_49_6();
    v20();
    OUTLINED_FUNCTION_49_6();
    v20();
    sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_58_4();
    uint64_t v21 = OUTLINED_FUNCTION_157_2();
    v0(v21);
    uint64_t v22 = OUTLINED_FUNCTION_94_4();
    v0(v22);
    goto LABEL_26;
  }
  if (v8)
  {
    OUTLINED_FUNCTION_56_5(v9);
    BOOL v13 = v7 && v11 == v12;
    if (v13 || (sub_247CBE998() & 1) != 0) {
      goto LABEL_15;
    }
  }
LABEL_26:
  OUTLINED_FUNCTION_97_4();
  OUTLINED_FUNCTION_116_1();
}

unint64_t sub_247CA7C28()
{
  return 0xD00000000000002ALL;
}

uint64_t sub_247CA7C44(uint64_t a1, uint64_t a2)
{
  return sub_247CA7938(a1, a2);
}

uint64_t sub_247CA7C5C()
{
  return sub_247CA79D4();
}

uint64_t sub_247CA7C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE598, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA7CF0(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DD8, (uint64_t)qword_2692C8280);
}

uint64_t sub_247CA7D14(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAAD0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA7D80()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata);
}

uint64_t sub_247CA7DDC()
{
  sub_247CAAE6C(&qword_2692AAAD0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata);
  return sub_247CBD658();
}

uint64_t sub_247CA7E5C()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8298);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8298);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CCBD90;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "bundleIdentifier";
  *(void *)(v6 + 8) = 16;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "entityType";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA8014(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_9(a1, a2);
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      OUTLINED_FUNCTION_33_9();
    }
    else if (result == 1)
    {
      OUTLINED_FUNCTION_59_5();
    }
    OUTLINED_FUNCTION_82_2();
  }
  return result;
}

uint64_t sub_247CA8088()
{
  OUTLINED_FUNCTION_20_10();
  if (!v1 || (uint64_t result = OUTLINED_FUNCTION_80_3(), !v0))
  {
    uint64_t result = OUTLINED_FUNCTION_81_4();
    if (!v0)
    {
      type metadata accessor for AppIntentsProtobuf_NotificationTopic(0);
      return OUTLINED_FUNCTION_18_16();
    }
  }
  return result;
}

void sub_247CA8120()
{
  OUTLINED_FUNCTION_114_2();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_96_2();
  BOOL v7 = v7 && v5 == v6;
  if (!v7 && (sub_247CBE998() & 1) == 0) {
    goto LABEL_17;
  }
  type metadata accessor for AppIntentsProtobuf_NotificationTopic(0);
  OUTLINED_FUNCTION_129_2();
  if (!v10)
  {
    if (v8) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v8)
  {
    OUTLINED_FUNCTION_56_5(v9);
    BOOL v13 = v7 && v11 == v12;
    if (v13 || (sub_247CBE998() & 1) != 0)
    {
LABEL_16:
      uint64_t v14 = *(void (**)(void))(v2 + 16);
      OUTLINED_FUNCTION_49_6();
      v14();
      OUTLINED_FUNCTION_49_6();
      v14();
      sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
      OUTLINED_FUNCTION_58_4();
      uint64_t v15 = OUTLINED_FUNCTION_157_2();
      v0(v15);
      uint64_t v16 = OUTLINED_FUNCTION_94_4();
      v0(v16);
    }
  }
LABEL_17:
  OUTLINED_FUNCTION_97_4();
  OUTLINED_FUNCTION_116_1();
}

unint64_t sub_247CA8280()
{
  return 0xD000000000000024;
}

uint64_t sub_247CA829C(uint64_t a1, uint64_t a2)
{
  return sub_247CA8014(a1, a2);
}

uint64_t sub_247CA82B4()
{
  return sub_247CA8088();
}

uint64_t sub_247CA82CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE500, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_NotificationTopic);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA8348(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DE0, (uint64_t)qword_2692C8298);
}

uint64_t sub_247CA836C(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AA4E8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_NotificationTopic);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA83D8()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_NotificationTopic);
}

uint64_t sub_247CA8434()
{
  sub_247CAAE6C(&qword_2692AA4E8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_NotificationTopic);
  return sub_247CBD658();
}

uint64_t sub_247CA84B4()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C82B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C82B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CCBD90;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "identifier";
  *(void *)(v6 + 8) = 10;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "value";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA866C(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_9(a1, a2);
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      OUTLINED_FUNCTION_6_15();
      sub_247CA86D0();
    }
    else if (result == 1)
    {
      OUTLINED_FUNCTION_59_5();
    }
    OUTLINED_FUNCTION_82_2();
  }
  return result;
}

uint64_t sub_247CA86D0()
{
  return sub_247CBD5E8();
}

uint64_t sub_247CA8780()
{
  OUTLINED_FUNCTION_20_10();
  if (!v1 || (uint64_t result = OUTLINED_FUNCTION_80_3(), !v0))
  {
    uint64_t v3 = OUTLINED_FUNCTION_346_0();
    uint64_t result = sub_247CA8808(v3);
    if (!v0)
    {
      type metadata accessor for AppIntentsProtobuf_Property(0);
      return OUTLINED_FUNCTION_18_16();
    }
  }
  return result;
}

uint64_t sub_247CA8808(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
  MEMORY[0x270FA5388](v2 - 8);
  char v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppIntentsProtobuf_Value(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppIntentsProtobuf_Property(0);
  sub_247CAC68C(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_2692AA920);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_247ACB4EC((uint64_t)v4, &qword_2692AA920);
  }
  sub_247CAC504((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
  sub_247CAAE6C(&qword_2692AA988, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
  sub_247CBD728();
  return sub_247CAC5E8((uint64_t)v7, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
}

void sub_247CA89D4()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = sub_247CBD408();
  OUTLINED_FUNCTION_30_0();
  uint64_t v53 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_36_10(v11, v52[0]);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v21 = OUTLINED_FUNCTION_42_3(v13, v14, v15, v16, v17, v18, v19, v20, v52[0]);
  type metadata accessor for AppIntentsProtobuf_Value(v21);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_47_0();
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD2A0);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_20_1();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
  uint64_t v26 = OUTLINED_FUNCTION_2_3(v25);
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_78_3();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_118_2();
  MEMORY[0x270FA5388](v28);
  int v30 = (char *)v52 - v29;
  uint64_t v31 = *v7;
  uint64_t v32 = v7[1];
  uint64_t v33 = *v5;
  uint64_t v34 = v5[1];
  uint64_t v54 = v5;
  BOOL v35 = v31 == v33 && v32 == v34;
  if (!v35 && (sub_247CBE998() & 1) == 0) {
    goto LABEL_20;
  }
  v52[1] = v8;
  uint64_t v36 = type metadata accessor for AppIntentsProtobuf_Property(0);
  sub_247CAC68C((uint64_t)v7 + *(int *)(v36 + 24), (uint64_t)v30, &qword_2692AA920);
  sub_247CAC68C((uint64_t)v54 + *(int *)(v36 + 24), v0, &qword_2692AA920);
  uint64_t v37 = OUTLINED_FUNCTION_106_3();
  sub_247CAC68C(v37, v38, &qword_2692AA920);
  uint64_t v39 = OUTLINED_FUNCTION_47();
  sub_247CAC68C(v39, v40, &qword_2692AA920);
  OUTLINED_FUNCTION_14_17(v1);
  if (v35)
  {
    sub_247ACB4EC(v0, &qword_2692AA920);
    sub_247ACB4EC((uint64_t)v30, &qword_2692AA920);
    OUTLINED_FUNCTION_14_17(v23);
    if (v35)
    {
      sub_247ACB4EC(v1, &qword_2692AA920);
LABEL_17:
      uint64_t v49 = v53;
      uint64_t v50 = *(void (**)(void))(v53 + 16);
      OUTLINED_FUNCTION_18_10();
      v50();
      OUTLINED_FUNCTION_18_10();
      v50();
      sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
      OUTLINED_FUNCTION_306_0();
      sub_247CBDD48();
      uint64_t v51 = *(void (**)(void))(v49 + 8);
      OUTLINED_FUNCTION_143_0();
      v51();
      OUTLINED_FUNCTION_109_2();
      OUTLINED_FUNCTION_143_0();
      v51();
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  sub_247CAC68C(v1, (uint64_t)v2, &qword_2692AA920);
  uint64_t v42 = OUTLINED_FUNCTION_14_17(v23);
  if (v41)
  {
    OUTLINED_FUNCTION_185_0();
    sub_247ACB4EC((uint64_t)v30, &qword_2692AA920);
    sub_247CAC5E8((uint64_t)v2, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
LABEL_14:
    uint64_t v44 = &qword_2692AD2A0;
    uint64_t v45 = v1;
LABEL_19:
    sub_247ACB4EC(v45, v44);
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_115_3(v42, v43, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
  if ((MEMORY[0x24C5665C0](*v2, v2[1], *v3, v3[1]) & 1) == 0)
  {
    sub_247CAC5E8((uint64_t)v3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
    sub_247ACB4EC(v0, &qword_2692AA920);
    sub_247ACB4EC((uint64_t)v30, &qword_2692AA920);
    sub_247CAC5E8((uint64_t)v2, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
    uint64_t v45 = OUTLINED_FUNCTION_347_0();
    goto LABEL_19;
  }
  sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
  OUTLINED_FUNCTION_116_2();
  char v46 = sub_247CBDD48();
  sub_247CAC5E8((uint64_t)v3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
  OUTLINED_FUNCTION_381_0();
  sub_247ACB4EC((uint64_t)v30, &qword_2692AA920);
  uint64_t v47 = OUTLINED_FUNCTION_109_2();
  sub_247CAC5E8(v47, v48);
  sub_247ACB4EC(v1, &qword_2692AA920);
  if (v46) {
    goto LABEL_17;
  }
LABEL_20:
  OUTLINED_FUNCTION_64();
}

unint64_t sub_247CA8E48()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_247CA8E64(uint64_t a1, uint64_t a2)
{
  return sub_247CA866C(a1, a2);
}

uint64_t sub_247CA8E7C()
{
  return sub_247CA8780();
}

uint64_t sub_247CA8E94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE5A0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Property);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA8F10(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DE8, (uint64_t)qword_2692C82B0);
}

uint64_t sub_247CA8F34(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C((unint64_t *)&dword_2692AA948, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Property);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA8FA0()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_Property);
}

uint64_t sub_247CA8FFC()
{
  sub_247CAAE6C((unint64_t *)&dword_2692AA948, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Property);
  return sub_247CBD658();
}

uint64_t sub_247CA907C(uint64_t a1)
{
  return sub_247C21D6C(a1, qword_2692C82C8, (uint64_t)"identifier", 10);
}

uint64_t sub_247CA9094(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  OUTLINED_FUNCTION_20_10();
  if (!v6 || (uint64_t result = OUTLINED_FUNCTION_80_3(), !v4))
  {
    a4(0);
    return OUTLINED_FUNCTION_80_4();
  }
  return result;
}

void sub_247CA9118()
{
  OUTLINED_FUNCTION_114_2();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_96_2();
  BOOL v9 = v9 && v7 == v8;
  if (v9 || (sub_247CBE998() & 1) != 0)
  {
    v2(0);
    uint64_t v10 = *(void (**)(void))(v4 + 16);
    OUTLINED_FUNCTION_49_6();
    v10();
    OUTLINED_FUNCTION_49_6();
    v10();
    sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_58_4();
    uint64_t v11 = OUTLINED_FUNCTION_157_2();
    v0(v11);
    uint64_t v12 = OUTLINED_FUNCTION_94_4();
    v0(v12);
  }
  OUTLINED_FUNCTION_97_4();
  OUTLINED_FUNCTION_116_1();
}

uint64_t sub_247CA9240@<X0>(void *a1@<X8>)
{
  return sub_247C9A6F0(a1);
}

unint64_t sub_247CA926C()
{
  return 0xD000000000000021;
}

uint64_t sub_247CA9288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247CA9094(a1, a2, a3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
}

uint64_t sub_247CA92B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE5A8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA9330(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DF0, (uint64_t)qword_2692C82C8);
}

uint64_t sub_247CA9354(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAA88, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA93C0()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
}

uint64_t sub_247CA941C()
{
  sub_247CAAE6C(&qword_2692AAA88, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
  return sub_247CBD658();
}

uint64_t sub_247CA9498()
{
  sub_247CA9118();
  return v0 & 1;
}

uint64_t sub_247CA94C8()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C82E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C82E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CCBD90;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "p1";
  *(void *)(v6 + 8) = 2;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  BOOL v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "p2";
  *((void *)v10 + 1) = 2;
  v10[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CA9678()
{
  uint64_t result = OUTLINED_FUNCTION_19_11();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1)
      {
        OUTLINED_FUNCTION_104_3();
        sub_247CBD5D8();
      }
      uint64_t result = OUTLINED_FUNCTION_153_2();
    }
  }
  return result;
}

uint64_t sub_247CA96E8()
{
  OUTLINED_FUNCTION_219_1();
  if (!*v0 || (uint64_t result = OUTLINED_FUNCTION_131_3(*v0, 1), !v1))
  {
    uint64_t v4 = *(void *)(v2 + 8);
    if (!v4 || (uint64_t result = OUTLINED_FUNCTION_131_3(v4, 2), !v1))
    {
      type metadata accessor for AppIntentsProtobuf_UUID(0);
      return OUTLINED_FUNCTION_18_16();
    }
  }
  return result;
}

void sub_247CA9760()
{
  OUTLINED_FUNCTION_114_2();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v5);
  if (*v1 == *v0 && v1[1] == v0[1])
  {
    type metadata accessor for AppIntentsProtobuf_UUID(0);
    unint64_t v6 = *(void (**)(void))(v3 + 16);
    OUTLINED_FUNCTION_49_6();
    v6();
    OUTLINED_FUNCTION_49_6();
    v6();
    sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_58_4();
    uint64_t v7 = *(void (**)(void))(v3 + 8);
    OUTLINED_FUNCTION_79_3();
    v7();
    OUTLINED_FUNCTION_79_3();
    v7();
  }
  OUTLINED_FUNCTION_116_1();
}

unint64_t sub_247CA98AC()
{
  return 0xD000000000000017;
}

uint64_t sub_247CA98C8()
{
  return sub_247CA9678();
}

uint64_t sub_247CA98E0()
{
  return sub_247CA96E8();
}

uint64_t sub_247CA98F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE5B0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_UUID);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA9974(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9DF8, (uint64_t)qword_2692C82E0);
}

uint64_t sub_247CA9998(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAAA8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_UUID);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA9A04()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
}

uint64_t sub_247CA9A60()
{
  sub_247CAAE6C(&qword_2692AAAA8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_UUID);
  return sub_247CBD658();
}

uint64_t sub_247CA9AE0(uint64_t a1)
{
  return sub_247C21D6C(a1, qword_2692C82F8, (uint64_t)"lnValueBytes", 12);
}

uint64_t sub_247CA9AF8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = *v4;
  unint64_t v7 = v4[1];
  switch(v7 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (int)v6;
      uint64_t v10 = v6 >> 32;
      goto LABEL_6;
    case 2uLL:
      uint64_t v9 = *(void *)(v6 + 16);
      uint64_t v10 = *(void *)(v6 + 24);
LABEL_6:
      if (v9 != v10) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v7 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = sub_247CBD698();
      if (!v5)
      {
LABEL_8:
        a4(0);
        return OUTLINED_FUNCTION_80_4();
      }
      return result;
  }
}

uint64_t sub_247CA9BD8@<X0>(_OWORD *a1@<X8>)
{
  return sub_247C99EA4((void (*)(void))type metadata accessor for AppIntentsProtobuf_Value, a1);
}

unint64_t sub_247CA9C04()
{
  return 0xD000000000000018;
}

uint64_t sub_247CA9C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247CA9AF8(a1, a2, a3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
}

uint64_t sub_247CA9C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE5B8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CA9CC8(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9E00, (uint64_t)qword_2692C82F8);
}

uint64_t sub_247CA9CEC(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AA988, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CA9D58()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
}

uint64_t sub_247CA9DB4()
{
  sub_247CAAE6C(&qword_2692AA988, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
  return sub_247CBD658();
}

uint64_t sub_247CA9E30()
{
  sub_247CA9EF8();
  return v0 & 1;
}

uint64_t sub_247CA9E60(uint64_t a1)
{
  return sub_247C21D6C(a1, qword_2692C8310, (uint64_t)"lnValueTypeBytes", 16);
}

uint64_t sub_247CA9E78(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v5 || (v10 & 1) != 0) {
      break;
    }
    if (result == 1) {
      a4(v4, a2, a3);
    }
  }
  return result;
}

void sub_247CA9EF8()
{
  OUTLINED_FUNCTION_114_2();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_88_4();
  if (v6)
  {
    v1(0);
    unint64_t v7 = *(void (**)(void))(v3 + 16);
    OUTLINED_FUNCTION_49_6();
    v7();
    OUTLINED_FUNCTION_49_6();
    v7();
    sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_58_4();
    uint64_t v8 = *(void (**)(void))(v3 + 8);
    OUTLINED_FUNCTION_79_3();
    v8();
    OUTLINED_FUNCTION_79_3();
    v8();
  }
  OUTLINED_FUNCTION_116_1();
}

uint64_t sub_247CAA024@<X0>(_OWORD *a1@<X8>)
{
  return sub_247C99EA4((void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType, a1);
}

unint64_t sub_247CAA050()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_247CAA06C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247CA9AF8(a1, a2, a3, (void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
}

uint64_t sub_247CAA098(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE5C0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ValueType);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CAA114(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9E08, (uint64_t)qword_2692C8310);
}

uint64_t sub_247CAA138(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAA90, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ValueType);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CAA1A4()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_ValueType);
}

uint64_t sub_247CAA200()
{
  sub_247CAAE6C(&qword_2692AAA90, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ValueType);
  return sub_247CBD658();
}

uint64_t sub_247CAA27C()
{
  sub_247CA9EF8();
  return v0 & 1;
}

uint64_t sub_247CAA2AC()
{
  uint64_t v0 = sub_247CBD768();
  __swift_allocate_value_buffer(v0, qword_2692C8328);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692C8328);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1A8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AD1B0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CD2E80;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "viewData";
  *(void *)(v6 + 8) = 8;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_247CBD738();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 10;
  *(void *)unint64_t v10 = "containerBundleIdentifier";
  *(void *)(v10 + 8) = 25;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 11;
  *(void *)uint64_t v12 = "targetBundleIdentifier";
  *((void *)v12 + 1) = 22;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 20;
  *(void *)uint64_t v14 = "snippetModelBundleIdentifier";
  *((void *)v14 + 1) = 28;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 21;
  *(void *)uint64_t v16 = "snippetModelData";
  *((void *)v16 + 1) = 16;
  v16[16] = 2;
  v9();
  return sub_247CBD748();
}

uint64_t sub_247CAA524(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_9(a1, a2);
  while (1)
  {
    uint64_t result = sub_247CBD4B8();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 21:
        OUTLINED_FUNCTION_6_15();
        sub_247CAA608();
        break;
      case 10:
        OUTLINED_FUNCTION_33_9();
        break;
      case 11:
        OUTLINED_FUNCTION_32_7();
        break;
      case 20:
        OUTLINED_FUNCTION_71_4();
        break;
      case 1:
        OUTLINED_FUNCTION_104_3();
        sub_247CBD528();
        break;
    }
    OUTLINED_FUNCTION_82_2();
  }
  return result;
}

uint64_t sub_247CAA608()
{
  return sub_247CBD518();
}

uint64_t sub_247CAA66C()
{
  OUTLINED_FUNCTION_67_5();
  if (sub_247B0158C(*(void *)v0, *(void *)(v0 + 8)) || (uint64_t v1 = v2, result = sub_247CBD698(), !v2))
  {
    OUTLINED_FUNCTION_8_19();
    uint64_t result = sub_247CA6CD4();
    if (!v1)
    {
      OUTLINED_FUNCTION_8_19();
      sub_247CA3E78();
      OUTLINED_FUNCTION_8_19();
      sub_247CA6D98();
      OUTLINED_FUNCTION_8_19();
      sub_247CAA7AC(v4);
      type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
      return OUTLINED_FUNCTION_56_6();
    }
  }
  return result;
}

uint64_t sub_247CAA7AC(uint64_t a1)
{
  uint64_t result = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  uint64_t v3 = a1 + *(int *)(result + 36);
  unint64_t v4 = *(void *)(v3 + 8);
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *(void *)v3;
    sub_247ADF298(*(void *)v3, *(void *)(v3 + 8));
    sub_247CBD698();
    return sub_247B0AC80(v5, v4);
  }
  return result;
}

void sub_247CAA84C()
{
  OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_30_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_541();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_88_4();
  if ((v6 & 1) == 0) {
    goto LABEL_38;
  }
  uint64_t v7 = type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
  OUTLINED_FUNCTION_129_2();
  if (!v10)
  {
    if (v8) {
      goto LABEL_38;
    }
LABEL_11:
    OUTLINED_FUNCTION_129_2();
    if (v16)
    {
      if (!v14) {
        goto LABEL_38;
      }
      OUTLINED_FUNCTION_56_5(v15);
      BOOL v19 = v13 && v17 == v18;
      if (!v19 && (sub_247CBE998() & 1) == 0) {
        goto LABEL_38;
      }
    }
    else if (v14)
    {
      goto LABEL_38;
    }
    OUTLINED_FUNCTION_129_2();
    if (v22)
    {
      if (!v20) {
        goto LABEL_38;
      }
      OUTLINED_FUNCTION_56_5(v21);
      BOOL v25 = v13 && v23 == v24;
      if (!v25 && (sub_247CBE998() & 1) == 0) {
        goto LABEL_38;
      }
    }
    else if (v20)
    {
      goto LABEL_38;
    }
    uint64_t v26 = *(int *)(v7 + 36);
    unint64_t v27 = *(void *)(v1 + v26 + 8);
    uint64_t v28 = (uint64_t *)(v0 + v26);
    uint64_t v29 = *v28;
    unint64_t v30 = v28[1];
    if (v27 >> 60 == 15)
    {
      OUTLINED_FUNCTION_110_1();
      if (!(!v13 & v32)) {
        goto LABEL_35;
      }
    }
    else
    {
      OUTLINED_FUNCTION_110_1();
      if (!v13 & v32)
      {
LABEL_35:
        uint64_t v33 = v31;
        sub_247ADF284(v31, v27);
        sub_247ADF284(v29, v30);
        sub_247B0AC80(v33, v27);
        sub_247B0AC80(v29, v30);
        goto LABEL_38;
      }
      uint64_t v37 = v31;
      sub_247ADF284(v31, v27);
      sub_247ADF284(v29, v30);
      char v36 = MEMORY[0x24C5665C0](v37, v27, v29, v30);
      sub_247B0AC80(v29, v30);
      sub_247B0AC80(v37, v27);
      if ((v36 & 1) == 0) {
        goto LABEL_38;
      }
    }
    uint64_t v34 = *(void (**)(void))(v3 + 16);
    OUTLINED_FUNCTION_49_6();
    v34();
    OUTLINED_FUNCTION_49_6();
    v34();
    sub_247CAAE6C((unint64_t *)&qword_2692AD198, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_58_4();
    BOOL v35 = *(void (**)(void))(v3 + 8);
    OUTLINED_FUNCTION_76_4();
    v35();
    OUTLINED_FUNCTION_76_4();
    v35();
    goto LABEL_38;
  }
  if (v8)
  {
    OUTLINED_FUNCTION_56_5(v9);
    BOOL v13 = v13 && v11 == v12;
    if (v13 || (sub_247CBE998() & 1) != 0) {
      goto LABEL_11;
    }
  }
LABEL_38:
  OUTLINED_FUNCTION_64();
}

uint64_t sub_247CAAAD0(void (*a1)(void))
{
  sub_247CBEAC8();
  a1(0);
  OUTLINED_FUNCTION_802();
  sub_247CAAE6C(v2, v3);
  sub_247CBDD28();
  return sub_247CBEB18();
}

unint64_t sub_247CAAB58()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_247CAAB74(uint64_t a1, uint64_t a2)
{
  return sub_247CAA524(a1, a2);
}

uint64_t sub_247CAAB8C()
{
  return sub_247CAA66C();
}

uint64_t sub_247CAABA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CAAE6C(&qword_2692AE5C8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_247CAAC20(uint64_t a1, uint64_t a2)
{
  return sub_247BF1B00(a1, a2, &qword_2692A9E10, (uint64_t)qword_2692C8328);
}

uint64_t sub_247CAAC44(uint64_t a1)
{
  uint64_t v2 = sub_247CAAE6C(&qword_2692AAA80, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_247CAACB0()
{
  return sub_247CAAAD0((void (*)(void))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
}

uint64_t sub_247CAAD0C()
{
  sub_247CAAE6C(&qword_2692AAA80, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
  return sub_247CBD658();
}

uint64_t sub_247CAAD88()
{
  return sub_247CBEB18();
}

uint64_t sub_247CAADDC()
{
  return sub_247CAAE6C(&qword_2692AE340, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
}

uint64_t sub_247CAAE24()
{
  return sub_247CAAE6C(&qword_2692AAA80, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
}

uint64_t sub_247CAAE6C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247CAAEB4()
{
  return sub_247CAAE6C(&qword_2692AE348, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
}

uint64_t sub_247CAAEFC()
{
  return sub_247CAAE6C(&qword_2692AE350, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ViewSnippet);
}

uint64_t sub_247CAAF44()
{
  return sub_247CAAE6C(&qword_2692AE358, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ValueType);
}

uint64_t sub_247CAAF8C()
{
  return sub_247CAAE6C(&qword_2692AAA90, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ValueType);
}

uint64_t sub_247CAAFD4()
{
  return sub_247CAAE6C(&qword_2692AE360, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ValueType);
}

uint64_t sub_247CAB01C()
{
  return sub_247CAAE6C(&qword_2692AE368, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ValueType);
}

uint64_t sub_247CAB064()
{
  return sub_247CAAE6C(&qword_2692AE370, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
}

uint64_t sub_247CAB0AC()
{
  return sub_247CAAE6C(&qword_2692AA988, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
}

uint64_t sub_247CAB0F4()
{
  return sub_247CAAE6C(&qword_2692AE378, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
}

uint64_t sub_247CAB13C()
{
  return sub_247CAAE6C(&qword_2692AE380, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
}

uint64_t sub_247CAB184()
{
  return sub_247CAAE6C(&qword_2692AE388, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_UUID);
}

uint64_t type metadata accessor for AppIntentsProtobuf_UUID(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE660);
}

uint64_t sub_247CAB1EC()
{
  return sub_247CAAE6C(&qword_2692AAAA8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_UUID);
}

uint64_t sub_247CAB234()
{
  return sub_247CAAE6C(&qword_2692AE390, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_UUID);
}

uint64_t sub_247CAB27C()
{
  return sub_247CAAE6C(&qword_2692AE398, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_UUID);
}

uint64_t sub_247CAB2C4()
{
  return sub_247CAAE6C(&qword_2692AE3A0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
}

uint64_t type metadata accessor for AppIntentsProtobuf_SystemProtocol(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE670);
}

uint64_t sub_247CAB32C()
{
  return sub_247CAAE6C(&qword_2692AAA88, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
}

uint64_t sub_247CAB374()
{
  return sub_247CAAE6C(&qword_2692AE3A8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
}

uint64_t sub_247CAB3BC()
{
  return sub_247CAAE6C(&qword_2692AE3B0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_SystemProtocol);
}

uint64_t sub_247CAB404()
{
  return sub_247CAAE6C(&qword_2692AE3B8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Property);
}

uint64_t type metadata accessor for AppIntentsProtobuf_Property(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE680);
}

uint64_t sub_247CAB46C()
{
  return sub_247CAAE6C((unint64_t *)&dword_2692AA948, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Property);
}

uint64_t sub_247CAB4B4()
{
  return sub_247CAAE6C(&qword_2692AE3C0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Property);
}

uint64_t sub_247CAB4FC()
{
  return sub_247CAAE6C(&qword_2692AE3C8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Property);
}

uint64_t sub_247CAB544()
{
  return sub_247CAAE6C(&qword_2692AA4F0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_NotificationTopic);
}

uint64_t sub_247CAB58C()
{
  return sub_247CAAE6C(&qword_2692AA4E8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_NotificationTopic);
}

uint64_t sub_247CAB5D4()
{
  return sub_247CAAE6C(&qword_2692AE3D0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_NotificationTopic);
}

uint64_t sub_247CAB61C()
{
  return sub_247CAAE6C(&qword_2692AE3D8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata);
}

uint64_t type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE650);
}

uint64_t sub_247CAB684()
{
  return sub_247CAAE6C(&qword_2692AAAD0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata);
}

uint64_t sub_247CAB6CC()
{
  return sub_247CAAE6C(&qword_2692AE3E0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata);
}

uint64_t sub_247CAB714()
{
  return sub_247CAAE6C(&qword_2692AE3E8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_IntentParameterMetadata);
}

uint64_t sub_247CAB75C()
{
  return sub_247CAAE6C(&qword_2692AE3F0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_FileDescriptor);
}

uint64_t type metadata accessor for AppIntentsProtobuf_FileDescriptor(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE638);
}

uint64_t sub_247CAB7C4()
{
  return sub_247CAAE6C(&qword_2692ABC00, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_FileDescriptor);
}

uint64_t sub_247CAB80C()
{
  return sub_247CAAE6C(&qword_2692AE3F8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_FileDescriptor);
}

uint64_t sub_247CAB854()
{
  return sub_247CAAE6C(&qword_2692AE400, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_FileDescriptor);
}

uint64_t sub_247CAB89C()
{
  return sub_247CAAE6C(&qword_2692AE408, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Error);
}

uint64_t type metadata accessor for AppIntentsProtobuf_Error(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE628);
}

uint64_t sub_247CAB904()
{
  return sub_247CAAE6C(&qword_2692AAA68, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Error);
}

uint64_t sub_247CAB94C()
{
  return sub_247CAAE6C(&qword_2692AE410, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Error);
}

uint64_t sub_247CAB994()
{
  return sub_247CAAE6C(&qword_2692AE418, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Error);
}

uint64_t sub_247CAB9DC()
{
  return sub_247CAAE6C(&qword_2692AE420, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Environment);
}

uint64_t type metadata accessor for AppIntentsProtobuf_Environment(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE618);
}

uint64_t sub_247CABA44()
{
  return sub_247CAAE6C(&qword_2692AA980, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Environment);
}

uint64_t sub_247CABA8C()
{
  return sub_247CAAE6C(&qword_2692AE428, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Environment);
}

uint64_t sub_247CABAD4()
{
  return sub_247CAAE6C(&qword_2692AE430, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Environment);
}

uint64_t sub_247CABB1C()
{
  return sub_247CAAE6C(&qword_2692AE438, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_EntityIdentifier);
}

uint64_t type metadata accessor for AppIntentsProtobuf_EntityIdentifier(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE608);
}

uint64_t sub_247CABB84()
{
  return sub_247CAAE6C(&qword_2692AAB60, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_EntityIdentifier);
}

uint64_t sub_247CABBCC()
{
  return sub_247CAAE6C(&qword_2692AE440, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_EntityIdentifier);
}

uint64_t sub_247CABC14()
{
  return sub_247CAAE6C(&qword_2692AE448, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_EntityIdentifier);
}

uint64_t sub_247CABC5C()
{
  return sub_247CAAE6C(&qword_2692AE450, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentation);
}

uint64_t type metadata accessor for AppIntentsProtobuf_DisplayRepresentation(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE5F0);
}

uint64_t sub_247CABCC4()
{
  return sub_247CAAE6C(&qword_2692AAAC0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentation);
}

uint64_t sub_247CABD0C()
{
  return sub_247CAAE6C(&qword_2692AE458, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentation);
}

uint64_t sub_247CABD54()
{
  return sub_247CAAE6C(&qword_2692AE460, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentation);
}

uint64_t sub_247CABD9C()
{
  return sub_247CAAE6C(&qword_2692AE468, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
}

uint64_t type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE5E0);
}

uint64_t sub_247CABE04()
{
  return sub_247CAAE6C(&qword_2692AE470, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
}

uint64_t sub_247CABE4C()
{
  return sub_247CAAE6C(&qword_2692AE478, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
}

uint64_t sub_247CABE94()
{
  return sub_247CAAE6C(&qword_2692AE480, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
}

uint64_t sub_247CABEDC()
{
  return sub_247CAAE6C(&qword_2692AE488, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Dialog);
}

uint64_t sub_247CABF24()
{
  return sub_247CAAE6C(&qword_2692AAA98, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Dialog);
}

uint64_t sub_247CABF6C()
{
  return sub_247CAAE6C(&qword_2692AE490, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Dialog);
}

uint64_t sub_247CABFB4()
{
  return sub_247CAAE6C(&qword_2692AE498, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Dialog);
}

uint64_t sub_247CABFFC()
{
  return sub_247CAAE6C(&qword_2692AE4A0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
}

uint64_t sub_247CAC044()
{
  return sub_247CAAE6C(&qword_2692AAAA0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
}

uint64_t sub_247CAC08C()
{
  return sub_247CAAE6C(&qword_2692AE4A8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
}

uint64_t sub_247CAC0D4()
{
  return sub_247CAAE6C(&qword_2692AE4B0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ConfirmationActionName);
}

uint64_t sub_247CAC11C()
{
  return sub_247CAAE6C(&qword_2692AE4B8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage);
}

uint64_t type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE5D0);
}

uint64_t sub_247CAC184()
{
  return sub_247CAAE6C(&qword_2692AABB0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage);
}

uint64_t sub_247CAC1CC()
{
  return sub_247CAAE6C(&qword_2692AE4C0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage);
}

uint64_t sub_247CAC214()
{
  return sub_247CAAE6C(&qword_2692AE4C8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_AsyncSequenceElementPage);
}

uint64_t sub_247CAC25C()
{
  return sub_247CAAE6C(&qword_2692AE4D0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ActionOutput);
}

uint64_t type metadata accessor for AppIntentsProtobuf_ActionOutput(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE690);
}

uint64_t sub_247CAC2C4()
{
  return sub_247CAAE6C(&qword_2692AAA78, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ActionOutput);
}

uint64_t sub_247CAC30C()
{
  return sub_247CAAE6C(&qword_2692AE4D8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ActionOutput);
}

uint64_t sub_247CAC354()
{
  return sub_247CAAE6C(&qword_2692AE4E0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_ActionOutput);
}

uint64_t sub_247CAC39C()
{
  return sub_247CAAE6C(&qword_2692AA520, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
}

uint64_t sub_247CAC3E4()
{
  return sub_247CAAE6C(&qword_2692AA518, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
}

uint64_t sub_247CAC42C()
{
  return sub_247CAAE6C(&qword_2692AE4E8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
}

uint64_t sub_247CAC474()
{
  return sub_247CAAE6C(&qword_2692AE4F0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Action);
}

uint64_t sub_247CAC4BC()
{
  return sub_247CAAE6C(&qword_2692AE4F8, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_NotificationTopic);
}

uint64_t sub_247CAC504(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_20();
  uint64_t v4 = OUTLINED_FUNCTION_122();
  v5(v4);
  return a2;
}

uint64_t sub_247CAC558(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_66_0(a1, a2, a3);
  OUTLINED_FUNCTION_20();
  uint64_t v4 = OUTLINED_FUNCTION_77_3();
  v5(v4);
  return v3;
}

unint64_t sub_247CAC59C()
{
  unint64_t result = qword_2692AE510;
  if (!qword_2692AE510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE510);
  }
  return result;
}

uint64_t sub_247CAC5E8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_20();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_247CAC640()
{
  unint64_t result = qword_2692AE558;
  if (!qword_2692AE558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE558);
  }
  return result;
}

uint64_t sub_247CAC68C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_66_0(a1, a2, a3);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_24_3();
  v4();
  return v3;
}

void *sub_247CAC6D4(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_247CBD408();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = (_OWORD *)((char *)v4 + v13);
    uint64_t v15 = (_OWORD *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for AppIntentsProtobuf_UUID(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA08);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      *uint64_t v14 = *v15;
      v12((char *)v14 + *(int *)(v16 + 24), (char *)v15 + *(int *)(v16 + 24), v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
    }
    *((unsigned char *)v4 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  }
  return v4;
}

uint64_t sub_247CAC86C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_247CBD408();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = type metadata accessor for AppIntentsProtobuf_UUID(0);
  uint64_t result = __swift_getEnumTagSinglePayload(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = v6 + *(int *)(v7 + 24);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

void *sub_247CAC954(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = (_OWORD *)((char *)a1 + v12);
  uint64_t v14 = (_OWORD *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for AppIntentsProtobuf_UUID(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA08);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    _OWORD *v13 = *v14;
    v11((char *)v13 + *(int *)(v15 + 24), (char *)v14 + *(int *)(v15 + 24), v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  }
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  return a1;
}

void *sub_247CACA9C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  uint64_t v20 = a3;
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for AppIntentsProtobuf_UUID(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  int v17 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!EnumTagSinglePayload)
  {
    if (!v17)
    {
      *(void *)uint64_t v13 = *(void *)v14;
      *((void *)v13 + 1) = *((void *)v14 + 1);
      v11(&v13[*(int *)(v15 + 24)], &v14[*(int *)(v15 + 24)], v9);
      goto LABEL_7;
    }
    sub_247CAC5E8((uint64_t)v13, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA08);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(&v13[*(int *)(v15 + 24)], &v14[*(int *)(v15 + 24)], v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(v20 + 32)) = *((unsigned char *)a2 + *(int *)(v20 + 32));
  return a1;
}

_OWORD *sub_247CACC90(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = (_OWORD *)((char *)a1 + v11);
  uint64_t v13 = (_OWORD *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for AppIntentsProtobuf_UUID(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA08);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  }
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  return a1;
}

void *sub_247CACDD0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  uint64_t v21 = a3;
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for AppIntentsProtobuf_UUID(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v16);
  int v18 = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16);
  if (!EnumTagSinglePayload)
  {
    if (!v18)
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
      v12(&v14[*(int *)(v16 + 24)], &v15[*(int *)(v16 + 24)], v10);
      goto LABEL_7;
    }
    sub_247CAC5E8((uint64_t)v14, (void (*)(void))type metadata accessor for AppIntentsProtobuf_UUID);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA08);
    memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v14[*(int *)(v16 + 24)], &v15[*(int *)(v16 + 24)], v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(v21 + 32)) = *((unsigned char *)a2 + *(int *)(v21 + 32));
  return a1;
}

uint64_t sub_247CACFA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CACFB8);
}

uint64_t sub_247CACFB8()
{
  OUTLINED_FUNCTION_87_1();
  if (v3) {
    return OUTLINED_FUNCTION_19_5(*(void *)(v1 + 8));
  }
  OUTLINED_FUNCTION_68_3();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v5 + 84) == v0)
  {
    uint64_t v6 = *(int *)(v2 + 24);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA08);
    uint64_t v6 = *(int *)(v2 + 28);
  }
  uint64_t v7 = OUTLINED_FUNCTION_112_2(v6);
  return __swift_getEnumTagSinglePayload(v7, v8, v9);
}

uint64_t sub_247CAD048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CAD05C);
}

void sub_247CAD05C()
{
  OUTLINED_FUNCTION_38_6();
  if (v2)
  {
    OUTLINED_FUNCTION_223_1();
  }
  else
  {
    OUTLINED_FUNCTION_106_2();
    OUTLINED_FUNCTION_1_23();
    if (*(_DWORD *)(v3 + 84) == v1)
    {
      uint64_t v4 = *(int *)(v0 + 24);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA08);
      uint64_t v4 = *(int *)(v0 + 28);
    }
    uint64_t v5 = OUTLINED_FUNCTION_44_4(v4);
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

void sub_247CAD0E8()
{
  sub_247CBD408();
  if (v0 <= 0x3F)
  {
    sub_247C9CCC8(319, &qword_2692AD5E0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_UUID);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_247CAD1F0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_247CBD408();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    unint64_t v11 = *((void *)v10 + 1);
    if (v11 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    }
    else
    {
      uint64_t v13 = *(void *)v10;
      sub_247ADF298(*(void *)v10, *((void *)v10 + 1));
      *(void *)uint64_t v9 = v13;
      *((void *)v9 + 1) = v11;
    }
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)a1 + v14;
    int v17 = (char *)a2 + v14;
    *(void *)uint64_t v16 = *(void *)v17;
    v16[8] = v17[8];
    int v18 = (char *)a1 + v15;
    uint64_t v19 = (char *)a2 + v15;
    *(void *)int v18 = *(void *)v19;
    v18[8] = v19[8];
  }
  return a1;
}

uint64_t sub_247CAD328(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CBD408();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15)
  {
    uint64_t v8 = *v6;
    return sub_247B0A060(v8, v7);
  }
  return result;
}

uint64_t sub_247CAD3BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  unint64_t v10 = v9[1];
  if (v10 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  }
  else
  {
    uint64_t v11 = *v9;
    sub_247ADF298(*v9, v9[1]);
    *(void *)uint64_t v8 = v11;
    *(void *)(v8 + 8) = v10;
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  uint64_t v16 = a1 + v13;
  uint64_t v17 = a2 + v13;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  return a1;
}

uint64_t sub_247CAD4A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  unint64_t v10 = *(void *)(a2 + v7 + 8);
  if (*(void *)(a1 + v7 + 8) >> 60 != 15)
  {
    if (v10 >> 60 != 15)
    {
      uint64_t v12 = *v9;
      sub_247ADF298(v12, v10);
      uint64_t v13 = *v8;
      unint64_t v14 = v8[1];
      *uint64_t v8 = v12;
      v8[1] = v10;
      sub_247B0A060(v13, v14);
      goto LABEL_8;
    }
    sub_247C52378((uint64_t)v8);
    goto LABEL_6;
  }
  if (v10 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    goto LABEL_8;
  }
  uint64_t v11 = *v9;
  sub_247ADF298(v11, v10);
  *uint64_t v8 = v11;
  v8[1] = v10;
LABEL_8:
  uint64_t v15 = a3[6];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *v17;
  *(unsigned char *)(v16 + 8) = *((unsigned char *)v17 + 8);
  *(void *)uint64_t v16 = v18;
  uint64_t v19 = a3[7];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v22 = *v21;
  *(unsigned char *)(v20 + 8) = *((unsigned char *)v21 + 8);
  *(void *)uint64_t v20 = v22;
  return a1;
}

uint64_t sub_247CAD5D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  return a1;
}

uint64_t sub_247CAD684(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  unint64_t v10 = *(void *)(a1 + v7 + 8);
  if (v10 >> 60 != 15)
  {
    unint64_t v11 = v9[1];
    if (v11 >> 60 != 15)
    {
      uint64_t v12 = *v8;
      *uint64_t v8 = *v9;
      v8[1] = v11;
      sub_247B0A060(v12, v10);
      goto LABEL_6;
    }
    sub_247C52378((uint64_t)v8);
  }
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
LABEL_6:
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  uint64_t v17 = a1 + v14;
  uint64_t v18 = a2 + v14;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  return a1;
}

uint64_t sub_247CAD780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CAD794);
}

uint64_t sub_247CAD794()
{
  OUTLINED_FUNCTION_136_3();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v4 + 84) == v1)
  {
    return __swift_getEnumTagSinglePayload(v0, v1, v3);
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + *(int *)(v2 + 20) + 8) >> 60;
    BOOL v7 = ((4 * v6) & 0xC) == 0;
    unsigned int v8 = ((4 * v6) & 0xC | (v6 >> 2)) ^ 0xF;
    if (v7) {
      return 0;
    }
    else {
      return v8;
    }
  }
}

uint64_t sub_247CAD820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CAD834);
}

void sub_247CAD834()
{
  OUTLINED_FUNCTION_105_1();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    OUTLINED_FUNCTION_50_4();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    uint64_t v9 = (void *)(v1 + *(int *)(v2 + 20));
    *uint64_t v9 = 0;
    v9[1] = (unint64_t)((~v0 >> 2) & 3 | (4 * ~v0)) << 60;
  }
}

uint64_t sub_247CAD8B8()
{
  uint64_t result = sub_247CBD408();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_247CAD958(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_247CBD408();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    uint64_t v15 = (uint64_t *)((char *)v4 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (char *)v4 + v14;
    uint64_t v19 = (char *)a2 + v14;
    uint64_t v20 = (int *)type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, (uint64_t)v20))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA18);
      memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      v12(v18, v19, v11);
      uint64_t v23 = v20[5];
      uint64_t v24 = &v18[v23];
      BOOL v25 = &v19[v23];
      unint64_t v26 = *((void *)v25 + 1);
      if (v26 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
      }
      else
      {
        uint64_t v27 = *(void *)v25;
        sub_247ADF298(*(void *)v25, *((void *)v25 + 1));
        *(void *)uint64_t v24 = v27;
        *((void *)v24 + 1) = v26;
      }
      uint64_t v28 = v20[6];
      uint64_t v29 = &v18[v28];
      unint64_t v30 = &v19[v28];
      *(void *)uint64_t v29 = *(void *)v30;
      v29[8] = v30[8];
      uint64_t v31 = v20[7];
      char v32 = &v18[v31];
      uint64_t v33 = &v19[v31];
      v32[8] = v33[8];
      *(void *)char v32 = *(void *)v33;
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, (uint64_t)v20);
    }
  }
  return v4;
}

uint64_t sub_247CADB74(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_247CBD408();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(a2 + 32);
  uint64_t v8 = type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
  uint64_t result = __swift_getEnumTagSinglePayload(v7, 1, v8);
  if (!result)
  {
    uint64_t result = v6(v7, v5);
    unint64_t v10 = (uint64_t *)(v7 + *(int *)(v8 + 20));
    unint64_t v11 = v10[1];
    if (v11 >> 60 != 15)
    {
      uint64_t v12 = *v10;
      return sub_247B0A060(v12, v11);
    }
  }
  return result;
}

void *sub_247CADC88(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  unint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (char *)a1 + v13;
  uint64_t v18 = (char *)a2 + v13;
  uint64_t v19 = (int *)type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, (uint64_t)v19))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA18);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    v11(v17, v18, v10);
    uint64_t v21 = v19[5];
    uint64_t v22 = &v17[v21];
    uint64_t v23 = &v18[v21];
    unint64_t v24 = *((void *)v23 + 1);
    if (v24 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    }
    else
    {
      uint64_t v25 = *(void *)v23;
      sub_247ADF298(*(void *)v23, *((void *)v23 + 1));
      *(void *)uint64_t v22 = v25;
      *((void *)v22 + 1) = v24;
    }
    uint64_t v26 = v19[6];
    uint64_t v27 = &v17[v26];
    uint64_t v28 = &v18[v26];
    *(void *)uint64_t v27 = *(void *)v28;
    v27[8] = v28[8];
    uint64_t v29 = v19[7];
    unint64_t v30 = &v17[v29];
    uint64_t v31 = &v18[v29];
    v30[8] = v31[8];
    *(void *)unint64_t v30 = *(void *)v31;
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, (uint64_t)v19);
  }
  return a1;
}

void *sub_247CADE54(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  void *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = (int *)type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, (uint64_t)v18);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, (uint64_t)v18);
  if (!v8)
  {
    if (EnumTagSinglePayload)
    {
      sub_247CAC5E8((uint64_t)v16, (void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
      goto LABEL_7;
    }
    v11(v16, v17, v9);
    uint64_t v25 = v18[5];
    uint64_t v26 = (uint64_t *)&v16[v25];
    uint64_t v27 = (uint64_t *)&v17[v25];
    unint64_t v28 = *(void *)&v17[v25 + 8];
    if (*(void *)&v16[v25 + 8] >> 60 == 15)
    {
      if (v28 >> 60 != 15)
      {
        uint64_t v29 = *v27;
        sub_247ADF298(v29, v28);
        *uint64_t v26 = v29;
        v26[1] = v28;
LABEL_17:
        uint64_t v42 = v18[6];
        uint64_t v43 = &v16[v42];
        uint64_t v44 = &v17[v42];
        uint64_t v45 = *(void *)v44;
        v43[8] = v44[8];
        *(void *)uint64_t v43 = v45;
        uint64_t v46 = v18[7];
        uint64_t v47 = &v16[v46];
        char v48 = &v17[v46];
        uint64_t v49 = *(void *)v48;
        v47[8] = v48[8];
        *(void *)uint64_t v47 = v49;
        return a1;
      }
    }
    else
    {
      if (v28 >> 60 != 15)
      {
        uint64_t v39 = *v27;
        sub_247ADF298(v39, v28);
        uint64_t v40 = *v26;
        unint64_t v41 = v26[1];
        *uint64_t v26 = v39;
        v26[1] = v28;
        sub_247B0A060(v40, v41);
        goto LABEL_17;
      }
      sub_247C52378((uint64_t)v26);
    }
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    goto LABEL_17;
  }
  if (EnumTagSinglePayload)
  {
LABEL_7:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA18);
    memcpy(v16, v17, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
  uint64_t v20 = v18[5];
  uint64_t v21 = &v16[v20];
  uint64_t v22 = &v17[v20];
  unint64_t v23 = *((void *)v22 + 1);
  if (v23 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  }
  else
  {
    uint64_t v30 = *(void *)v22;
    sub_247ADF298(*(void *)v22, *((void *)v22 + 1));
    *(void *)uint64_t v21 = v30;
    *((void *)v21 + 1) = v23;
  }
  uint64_t v31 = v18[6];
  char v32 = &v16[v31];
  uint64_t v33 = &v17[v31];
  uint64_t v34 = *(void *)v33;
  v32[8] = v33[8];
  *(void *)char v32 = v34;
  uint64_t v35 = v18[7];
  char v36 = &v16[v35];
  uint64_t v37 = &v17[v35];
  uint64_t v38 = *(void *)v37;
  v36[8] = v37[8];
  *(void *)char v36 = v38;
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, (uint64_t)v18);
  return a1;
}

uint64_t sub_247CAE174(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = (int *)type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, (uint64_t)v14))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA18);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    v10((uint64_t)v12, (uint64_t)v13, v9);
    *(_OWORD *)&v12[v14[5]] = *(_OWORD *)&v13[v14[5]];
    uint64_t v16 = v14[6];
    uint64_t v17 = &v12[v16];
    uint64_t v18 = &v13[v16];
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
    uint64_t v19 = v14[7];
    uint64_t v20 = &v12[v19];
    uint64_t v21 = &v13[v19];
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, (uint64_t)v14);
  }
  return a1;
}

void *sub_247CAE2E8(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = (int *)type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage(0);
  LODWORD(v9) = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, (uint64_t)v21);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, (uint64_t)v21);
  if (!v9)
  {
    if (EnumTagSinglePayload)
    {
      sub_247CAC5E8((uint64_t)v19, (void (*)(void))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
      goto LABEL_6;
    }
    v12(v19, v20, v10);
    uint64_t v31 = v21[5];
    char v32 = (uint64_t *)&v19[v31];
    uint64_t v33 = (uint64_t *)&v20[v31];
    unint64_t v34 = *(void *)&v19[v31 + 8];
    if (v34 >> 60 != 15)
    {
      unint64_t v35 = v33[1];
      if (v35 >> 60 != 15)
      {
        uint64_t v36 = *v32;
        *char v32 = *v33;
        v32[1] = v35;
        sub_247B0A060(v36, v34);
        goto LABEL_13;
      }
      sub_247C52378((uint64_t)v32);
    }
    *(_OWORD *)char v32 = *(_OWORD *)v33;
LABEL_13:
    uint64_t v37 = v21[6];
    uint64_t v38 = &v19[v37];
    uint64_t v39 = &v20[v37];
    *(void *)uint64_t v38 = *(void *)v39;
    v38[8] = v39[8];
    uint64_t v40 = v21[7];
    unint64_t v41 = &v19[v40];
    uint64_t v42 = &v20[v40];
    v41[8] = v42[8];
    *(void *)unint64_t v41 = *(void *)v42;
    return a1;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA18);
    memcpy(v19, v20, *(void *)(*(void *)(v29 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v20, v10);
  *(_OWORD *)&v19[v21[5]] = *(_OWORD *)&v20[v21[5]];
  uint64_t v23 = v21[6];
  uint64_t v24 = &v19[v23];
  uint64_t v25 = &v20[v23];
  *(void *)uint64_t v24 = *(void *)v25;
  v24[8] = v25[8];
  uint64_t v26 = v21[7];
  uint64_t v27 = &v19[v26];
  unint64_t v28 = &v20[v26];
  *(void *)uint64_t v27 = *(void *)v28;
  v27[8] = v28[8];
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, (uint64_t)v21);
  return a1;
}

uint64_t sub_247CAE580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CAE594);
}

uint64_t sub_247CAE594()
{
  OUTLINED_FUNCTION_87_1();
  if (v3) {
    return OUTLINED_FUNCTION_19_5(*(void *)(v1 + 8));
  }
  OUTLINED_FUNCTION_68_3();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v5 + 84) == v0)
  {
    uint64_t v6 = *(int *)(v2 + 24);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA18);
    uint64_t v6 = *(int *)(v2 + 32);
  }
  uint64_t v7 = OUTLINED_FUNCTION_112_2(v6);
  return __swift_getEnumTagSinglePayload(v7, v8, v9);
}

uint64_t sub_247CAE624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CAE638);
}

void sub_247CAE638()
{
  OUTLINED_FUNCTION_38_6();
  if (v2)
  {
    OUTLINED_FUNCTION_223_1();
  }
  else
  {
    OUTLINED_FUNCTION_106_2();
    OUTLINED_FUNCTION_1_23();
    if (*(_DWORD *)(v3 + 84) == v1)
    {
      uint64_t v4 = *(int *)(v0 + 24);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA18);
      uint64_t v4 = *(int *)(v0 + 32);
    }
    uint64_t v5 = OUTLINED_FUNCTION_44_4(v4);
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

void sub_247CAE6C4()
{
  sub_247CBD408();
  if (v0 <= 0x3F)
  {
    sub_247C9CCC8(319, &qword_2692AE600, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_DisplayRepresentationImage);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_247CAE7C8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_247CBD408();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_247CAE8C0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_247CBD408();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_247CAE940(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *sub_247CAE9E8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_247CAEAA4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_247CAEB20(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_247CAEBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CAEBD0);
}

uint64_t sub_247CAEBD0()
{
  OUTLINED_FUNCTION_87_1();
  if (v2) {
    return OUTLINED_FUNCTION_19_5(*(void *)(v0 + 8));
  }
  OUTLINED_FUNCTION_68_3();
  uint64_t v4 = OUTLINED_FUNCTION_112_2(*(int *)(v1 + 24));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_247CAEC34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CAEC48);
}

void sub_247CAEC48()
{
  OUTLINED_FUNCTION_38_6();
  if (v1)
  {
    OUTLINED_FUNCTION_223_1();
  }
  else
  {
    OUTLINED_FUNCTION_329_0();
    uint64_t v2 = OUTLINED_FUNCTION_44_4(*(int *)(v0 + 24));
    __swift_storeEnumTagSinglePayload(v2, v3, v4, v5);
  }
}

uint64_t sub_247CAECA8()
{
  return sub_247CB065C();
}

uint64_t sub_247CAECC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_44Tm_0);
}

uint64_t sub_247CAECE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_45Tm_0);
}

uint64_t sub_247CAECF8()
{
  return sub_247CB0AAC();
}

uint64_t *sub_247CAED04(uint64_t *a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_1_23();
  if ((*(_DWORD *)(v4 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_118_1(*a2);
  }
  else
  {
    uint64_t v5 = *a2;
    unint64_t v6 = a2[1];
    sub_247ADF298(*a2, v6);
    *a1 = v5;
    a1[1] = v6;
    OUTLINED_FUNCTION_233_1();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_24_3();
    v7();
  }
  return a1;
}

uint64_t sub_247CAEDA0(uint64_t a1, uint64_t a2)
{
  sub_247B0A060(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_247CBD408();
  OUTLINED_FUNCTION_20();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v7(v4, v5);
}

void *sub_247CAEE14(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_79_4(a1, a2);
  *uint64_t v2 = v3;
  v2[1] = v4;
  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_24_3();
  v5();
  return v2;
}

uint64_t *sub_247CAEE74(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_79_4(a1, a2);
  uint64_t v5 = *v2;
  unint64_t v6 = v2[1];
  *uint64_t v2 = v3;
  v2[1] = v4;
  sub_247B0A060(v5, v6);
  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_20();
  uint64_t v7 = OUTLINED_FUNCTION_126_3();
  v8(v7);
  return v2;
}

uint64_t sub_247CAEED8()
{
  OUTLINED_FUNCTION_384_0();
  uint64_t v3 = *v2;
  unint64_t v4 = *(void *)(v1 + 8);
  *(_OWORD *)uint64_t v1 = *v0;
  sub_247B0A060(v3, v4);
  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_20();
  uint64_t v5 = OUTLINED_FUNCTION_77_3();
  v6(v5);
  return v1;
}

uint64_t sub_247CAEF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CAEF50);
}

uint64_t __swift_get_extra_inhabitant_index_32Tm(uint64_t a1, int a2)
{
  if (a2 == 12)
  {
    uint64_t v3 = *(void *)(a1 + 8) >> 60;
    if (((4 * v3) & 0xC) != 0) {
      return 16 - ((4 * v3) & 0xC | (v3 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    OUTLINED_FUNCTION_68_3();
    uint64_t v5 = OUTLINED_FUNCTION_112_2(*(int *)(v2 + 20));
    return __swift_getEnumTagSinglePayload(v5, v6, v7);
  }
}

uint64_t sub_247CAEFD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CAEFEC);
}

void *__swift_store_extra_inhabitant_index_33Tm(void *result, uint64_t a2, int a3)
{
  unint64_t v4 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    OUTLINED_FUNCTION_329_0();
    OUTLINED_FUNCTION_208_1();
    return (void *)__swift_storeEnumTagSinglePayload((uint64_t)v4 + v6, a2, a2, v5);
  }
  return result;
}

uint64_t *sub_247CAF06C(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_247CBD408();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (uint64_t *)((char *)v4 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (char *)v4 + v14;
    uint64_t v19 = (char *)a2 + v14;
    v18[8] = v19[8];
    *(void *)uint64_t v18 = *(void *)v19;
    uint64_t v20 = a3[8];
    uint64_t v21 = a3[9];
    uint64_t v22 = (uint64_t *)((char *)v4 + v20);
    uint64_t v23 = (uint64_t *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = (uint64_t *)((char *)v4 + v21);
    uint64_t v26 = (uint64_t *)((char *)a2 + v21);
    uint64_t v27 = type metadata accessor for AppIntentsProtobuf_Error(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC10);
      memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      uint64_t v30 = *v26;
      unint64_t v31 = v26[1];
      sub_247ADF298(*v26, v31);
      *uint64_t v25 = v30;
      v25[1] = v31;
      v12((char *)v25 + *(int *)(v27 + 20), (char *)v26 + *(int *)(v27 + 20), v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
    }
  }
  return v4;
}

uint64_t sub_247CAF250(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247CBD408();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  uint64_t v7 = type metadata accessor for AppIntentsProtobuf_Error(0);
  uint64_t result = __swift_getEnumTagSinglePayload(v6, 1, v7);
  if (!result)
  {
    sub_247B0A060(*(void *)v6, *(void *)(v6 + 8));
    uint64_t v9 = v6 + *(int *)(v7 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

void *sub_247CAF360(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (char *)a1 + v13;
  uint64_t v18 = (char *)a2 + v13;
  v17[8] = v18[8];
  *(void *)uint64_t v17 = *(void *)v18;
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)((char *)a1 + v19);
  uint64_t v22 = (void *)((char *)a2 + v19);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = (void *)((char *)a1 + v20);
  uint64_t v25 = (void *)((char *)a2 + v20);
  uint64_t v26 = type metadata accessor for AppIntentsProtobuf_Error(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC10);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    uint64_t v28 = *v25;
    unint64_t v29 = v25[1];
    sub_247ADF298(*v25, v29);
    *uint64_t v24 = v28;
    v24[1] = v29;
    v11((char *)v24 + *(int *)(v26 + 20), (char *)v25 + *(int *)(v26 + 20), v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  return a1;
}

void *sub_247CAF4F4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  void *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)v17;
  v16[8] = v17[8];
  *(void *)uint64_t v16 = v18;
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v25 = type metadata accessor for AppIntentsProtobuf_Error(0);
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, v25);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25);
  if (!v8)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v31 = *v24;
      unint64_t v32 = v24[1];
      sub_247ADF298(*v24, v32);
      uint64_t v33 = *v23;
      unint64_t v34 = v23[1];
      *uint64_t v23 = v31;
      v23[1] = v32;
      sub_247B0A060(v33, v34);
      v11((char *)v23 + *(int *)(v25 + 20), (char *)v24 + *(int *)(v25 + 20), v9);
      return a1;
    }
    sub_247CAC5E8((uint64_t)v23, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC10);
    memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
    return a1;
  }
  uint64_t v27 = *v24;
  unint64_t v28 = v24[1];
  sub_247ADF298(*v24, v28);
  *uint64_t v23 = v27;
  v23[1] = v28;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v23 + *(int *)(v25 + 20), (char *)v24 + *(int *)(v25 + 20), v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  return a1;
}

_OWORD *sub_247CAF750(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  v12[8] = v13[8];
  *(void *)uint64_t v12 = *(void *)v13;
  uint64_t v14 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  uint64_t v15 = (_OWORD *)((char *)a1 + v14);
  uint64_t v16 = (_OWORD *)((char *)a2 + v14);
  uint64_t v17 = type metadata accessor for AppIntentsProtobuf_Error(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC10);
    memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    *uint64_t v15 = *v16;
    v10((char *)v15 + *(int *)(v17 + 20), (char *)v16 + *(int *)(v17 + 20), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  }
  return a1;
}

void *sub_247CAF8A8(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v18;
  uint64_t v21 = (char *)a2 + v18;
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = (void *)((char *)a1 + v19);
  uint64_t v23 = (void *)((char *)a2 + v19);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[9];
  uint64_t v27 = (void *)((char *)a1 + v26);
  unint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = type metadata accessor for AppIntentsProtobuf_Error(0);
  LODWORD(v9) = __swift_getEnumTagSinglePayload((uint64_t)v27, 1, v29);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v28, 1, v29);
  if (!v9)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v33 = *v27;
      unint64_t v34 = v27[1];
      *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
      sub_247B0A060(v33, v34);
      v12((char *)v27 + *(int *)(v29 + 20), &v28[*(int *)(v29 + 20)], v10);
      return a1;
    }
    sub_247CAC5E8((uint64_t)v27, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Error);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC10);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))((char *)v27 + *(int *)(v29 + 20), &v28[*(int *)(v29 + 20)], v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v29);
  return a1;
}

uint64_t sub_247CAFAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CAFACC);
}

uint64_t sub_247CAFACC()
{
  OUTLINED_FUNCTION_87_1();
  if (v3) {
    return OUTLINED_FUNCTION_19_5(*(void *)(v1 + 8));
  }
  OUTLINED_FUNCTION_68_3();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v5 + 84) == v0)
  {
    uint64_t v6 = *(int *)(v2 + 20);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC10);
    uint64_t v6 = *(int *)(v2 + 36);
  }
  uint64_t v7 = OUTLINED_FUNCTION_112_2(v6);
  return __swift_getEnumTagSinglePayload(v7, v8, v9);
}

uint64_t sub_247CAFB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CAFB70);
}

void sub_247CAFB70()
{
  OUTLINED_FUNCTION_38_6();
  if (v2)
  {
    OUTLINED_FUNCTION_223_1();
  }
  else
  {
    OUTLINED_FUNCTION_106_2();
    OUTLINED_FUNCTION_1_23();
    if (*(_DWORD *)(v3 + 84) == v1)
    {
      OUTLINED_FUNCTION_208_1();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAC10);
      uint64_t v4 = *(int *)(v0 + 36);
    }
    uint64_t v5 = OUTLINED_FUNCTION_44_4(v4);
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

void sub_247CAFBF8()
{
  sub_247CBD408();
  if (v0 <= 0x3F)
  {
    sub_247C9CCC8(319, &qword_2692AE648, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Error);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_247CAFCFC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_247CBD408();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (uint64_t *)((char *)v4 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (uint64_t *)((char *)v4 + v14);
    uint64_t v19 = (uint64_t *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_247CAFE24(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_247CAFEC4(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)((char *)a1 + v13);
  uint64_t v18 = (void *)((char *)a2 + v13);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_247CAFF9C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_247CB0098(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  return a1;
}

void *sub_247CB0138(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247CB0204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_44Tm_1);
}

uint64_t sub_247CB021C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_45Tm_1);
}

uint64_t sub_247CB0234()
{
  return sub_247CB0240();
}

uint64_t sub_247CB0240()
{
  uint64_t result = sub_247CBD408();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_247CB02DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_247CBD408();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_247CB03A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  uint64_t v3 = sub_247CBD408();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

_OWORD *sub_247CB0410(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_247CB048C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *sub_247CB0510(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_247CBD408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_247CB058C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB05A0);
}

uint64_t sub_247CB05A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 24);
  uint64_t v5 = sub_247CBD408();
  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t sub_247CB05EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB0600);
}

uint64_t sub_247CB0600()
{
  sub_247CBD408();
  OUTLINED_FUNCTION_50_4();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_247CB064C()
{
  return sub_247CB065C();
}

uint64_t sub_247CB065C()
{
  uint64_t result = sub_247CBD408();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppIntentsProtobuf_Action.Kind()
{
  return &type metadata for AppIntentsProtobuf_Action.Kind;
}

void sub_247CB06FC()
{
  OUTLINED_FUNCTION_114_2();
  unint64_t v1 = v0;
  OUTLINED_FUNCTION_1_23();
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_118_1(*v2);
  }
  else
  {
    uint64_t v4 = v2[1];
    *unint64_t v1 = *v2;
    v1[1] = v4;
    sub_247CBD408();
    OUTLINED_FUNCTION_20();
    uint64_t v6 = *(void (**)(uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    uint64_t v7 = OUTLINED_FUNCTION_93_3();
    v6(v7);
  }
  OUTLINED_FUNCTION_116_1();
}

uint64_t sub_247CB0790(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_247CBD408();
  OUTLINED_FUNCTION_20();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v7(v4, v5);
}

void sub_247CB0800()
{
  OUTLINED_FUNCTION_114_2();
  uint64_t v1 = v0[1];
  *uint64_t v2 = *v0;
  v2[1] = v1;
  sub_247CBD408();
  OUTLINED_FUNCTION_20();
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t v5 = OUTLINED_FUNCTION_93_3();
  v4(v5);
  OUTLINED_FUNCTION_116_1();
}

uint64_t sub_247CB0878()
{
  OUTLINED_FUNCTION_384_0();
  *uint64_t v2 = *v1;
  *(void *)(v0 + 8) = v1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_20();
  uint64_t v3 = OUTLINED_FUNCTION_126_3();
  v4(v3);
  return v0;
}

_OWORD *sub_247CB08E8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  sub_247CBD408();
  OUTLINED_FUNCTION_20();
  (*(void (**)(char *, char *))(v7 + 32))(v5, v6);
  return a1;
}

void *sub_247CB095C()
{
  OUTLINED_FUNCTION_384_0();
  uint64_t v2 = v1[1];
  *uint64_t v0 = *v1;
  v0[1] = v2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_20();
  uint64_t v3 = OUTLINED_FUNCTION_77_3();
  v4(v3);
  return v0;
}

uint64_t sub_247CB09BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB09D0);
}

uint64_t __swift_get_extra_inhabitant_index_44Tm()
{
  OUTLINED_FUNCTION_87_1();
  if (v2) {
    return OUTLINED_FUNCTION_19_5(*(void *)(v0 + 8));
  }
  OUTLINED_FUNCTION_68_3();
  uint64_t v4 = OUTLINED_FUNCTION_112_2(*(int *)(v1 + 20));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_247CB0A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB0A4C);
}

void __swift_store_extra_inhabitant_index_45Tm()
{
  OUTLINED_FUNCTION_38_6();
  if (v0)
  {
    OUTLINED_FUNCTION_223_1();
  }
  else
  {
    OUTLINED_FUNCTION_329_0();
    OUTLINED_FUNCTION_208_1();
    uint64_t v2 = OUTLINED_FUNCTION_44_4(v1);
    __swift_storeEnumTagSinglePayload(v2, v3, v4, v5);
  }
}

uint64_t sub_247CB0AAC()
{
  uint64_t result = sub_247CBD408();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_247CB0B3C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_247CBD408();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for AppIntentsProtobuf_Value(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v19 = *v15;
      unint64_t v20 = v15[1];
      sub_247ADF298(*v15, v20);
      *uint64_t v14 = v19;
      v14[1] = v20;
      v12((char *)v14 + *(int *)(v16 + 20), (char *)v15 + *(int *)(v16 + 20), v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t sub_247CB0CD4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247CBD408();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for AppIntentsProtobuf_Value(0);
  uint64_t result = __swift_getEnumTagSinglePayload(v6, 1, v7);
  if (!result)
  {
    sub_247B0A060(*(void *)v6, *(void *)(v6 + 8));
    uint64_t v9 = v6 + *(int *)(v7 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

void *sub_247CB0DC4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for AppIntentsProtobuf_Value(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v17 = *v14;
    unint64_t v18 = v14[1];
    sub_247ADF298(*v14, v18);
    void *v13 = v17;
    v13[1] = v18;
    v11((char *)v13 + *(int *)(v15 + 20), (char *)v14 + *(int *)(v15 + 20), v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  }
  return a1;
}

void *sub_247CB0F0C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for AppIntentsProtobuf_Value(0);
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!v8)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v21 = *v14;
      unint64_t v22 = v14[1];
      sub_247ADF298(*v14, v22);
      uint64_t v23 = *v13;
      unint64_t v24 = v13[1];
      uint64_t *v13 = v21;
      v13[1] = v22;
      sub_247B0A060(v23, v24);
      v11((char *)v13 + *(int *)(v15 + 20), (char *)v14 + *(int *)(v15 + 20), v9);
      return a1;
    }
    sub_247CAC5E8((uint64_t)v13, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  uint64_t v17 = *v14;
  unint64_t v18 = v14[1];
  sub_247ADF298(*v14, v18);
  uint64_t *v13 = v17;
  v13[1] = v18;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v13 + *(int *)(v15 + 20), (char *)v14 + *(int *)(v15 + 20), v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  return a1;
}

_OWORD *sub_247CB10F4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD408();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (_OWORD *)((char *)a1 + v11);
  uint64_t v13 = (_OWORD *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for AppIntentsProtobuf_Value(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 20), (char *)v13 + *(int *)(v14 + 20), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  }
  return a1;
}

void *sub_247CB1220(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD408();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for AppIntentsProtobuf_Value(0);
  LODWORD(v9) = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16);
  if (!v9)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v20 = *v14;
      unint64_t v21 = v14[1];
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
      sub_247B0A060(v20, v21);
      v12((char *)v14 + *(int *)(v16 + 20), &v15[*(int *)(v16 + 20)], v10);
      return a1;
    }
    sub_247CAC5E8((uint64_t)v14, (void (*)(void))type metadata accessor for AppIntentsProtobuf_Value);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))((char *)v14 + *(int *)(v16 + 20), &v15[*(int *)(v16 + 20)], v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  return a1;
}

uint64_t sub_247CB13E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB13F4);
}

uint64_t sub_247CB13F4()
{
  OUTLINED_FUNCTION_87_1();
  if (v3) {
    return OUTLINED_FUNCTION_19_5(*(void *)(v1 + 8));
  }
  OUTLINED_FUNCTION_68_3();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v5 + 84) == v0)
  {
    uint64_t v6 = *(int *)(v2 + 20);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
    uint64_t v6 = *(int *)(v2 + 24);
  }
  uint64_t v7 = OUTLINED_FUNCTION_112_2(v6);
  return __swift_getEnumTagSinglePayload(v7, v8, v9);
}

uint64_t sub_247CB1484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB1498);
}

void sub_247CB1498()
{
  OUTLINED_FUNCTION_38_6();
  if (v2)
  {
    OUTLINED_FUNCTION_223_1();
  }
  else
  {
    OUTLINED_FUNCTION_106_2();
    OUTLINED_FUNCTION_1_23();
    if (*(_DWORD *)(v3 + 84) == v1)
    {
      OUTLINED_FUNCTION_208_1();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA920);
      uint64_t v4 = *(int *)(v0 + 24);
    }
    uint64_t v5 = OUTLINED_FUNCTION_44_4(v4);
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

void sub_247CB1520()
{
  sub_247CBD408();
  if (v0 <= 0x3F)
  {
    sub_247C9CCC8(319, &qword_2692AD6D0, (void (*)(uint64_t))type metadata accessor for AppIntentsProtobuf_Value);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_247CB1610(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_247CBD408();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_247CB16DC(uint64_t a1)
{
  uint64_t v2 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_247CB1750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_247CB17D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_247CB185C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_247CB18D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD408();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_247CB195C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB1970);
}

uint64_t sub_247CB1970()
{
  OUTLINED_FUNCTION_136_3();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v4 + 84) != v1) {
    return OUTLINED_FUNCTION_19_5(*(void *)(v0 + *(int *)(v2 + 20)));
  }
  return __swift_getEnumTagSinglePayload(v0, v1, v3);
}

uint64_t sub_247CB19E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB19F8);
}

void sub_247CB19F8()
{
  OUTLINED_FUNCTION_105_1();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    OUTLINED_FUNCTION_50_4();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 20)) = (v0 - 1);
  }
}

uint64_t sub_247CB1A6C()
{
  uint64_t result = sub_247CBD408();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppIntentsProtobuf_Dialog.TypeEnum()
{
  return &type metadata for AppIntentsProtobuf_Dialog.TypeEnum;
}

unint64_t sub_247CB1B18()
{
  unint64_t result = qword_2692AE6A0;
  if (!qword_2692AE6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE6A0);
  }
  return result;
}

uint64_t sub_247CB1B64()
{
  return sub_247CB1C04(&qword_2692AE6A8, &qword_2692AE6B0);
}

unint64_t sub_247CB1B90()
{
  unint64_t result = qword_2692AE6B8;
  if (!qword_2692AE6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE6B8);
  }
  return result;
}

uint64_t sub_247CB1BDC()
{
  return sub_247CB1C04(&qword_2692AE6C0, &qword_2692AE6C8);
}

uint64_t sub_247CB1C04(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_247CB1C5C()
{
  unint64_t result = qword_2692AE6D0;
  if (!qword_2692AE6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE6D0);
  }
  return result;
}

unint64_t sub_247CB1CB0()
{
  unint64_t result = qword_2692AE6D8;
  if (!qword_2692AE6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE6D8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_14_17(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_18_16()
{
  return sub_247CBD3E8();
}

uint64_t OUTLINED_FUNCTION_20_17()
{
  return type metadata accessor for AppIntentsProtobuf_ActionOutput(0);
}

uint64_t OUTLINED_FUNCTION_30_10()
{
  return *(void *)v0;
}

uint64_t OUTLINED_FUNCTION_32_7()
{
  return sub_247CA3D50();
}

uint64_t OUTLINED_FUNCTION_33_9()
{
  return sub_247CA6A40();
}

uint64_t OUTLINED_FUNCTION_35_9()
{
  return sub_247CBD408();
}

void OUTLINED_FUNCTION_36_10(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_45_7()
{
  uint64_t v2 = (void *)(v0 + *(int *)(v1 + 24));
  *uint64_t v2 = 0;
  v2[1] = 0;
  int v3 = (void *)(v0 + *(int *)(v1 + 28));
  *int v3 = 0;
  v3[1] = 0;
}

uint64_t OUTLINED_FUNCTION_56_6()
{
  return sub_247CBD3E8();
}

uint64_t OUTLINED_FUNCTION_59_5()
{
  return sub_247CBD598();
}

uint64_t OUTLINED_FUNCTION_65_2()
{
  type metadata accessor for AppIntentsProtobuf_ActionOutput._StorageClass(0);
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_70_3()
{
  return sub_247CAC68C(v0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_71_4()
{
  return sub_247CA6ACC();
}

void OUTLINED_FUNCTION_72_3(uint64_t a1@<X8>)
{
  uint64_t v2 = v1 + a1;
  *(void *)uint64_t v2 = 0;
  *(unsigned char *)(v2 + 8) = 1;
}

uint64_t OUTLINED_FUNCTION_75_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_77_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_79_4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  return sub_247ADF298(v3, v4);
}

uint64_t OUTLINED_FUNCTION_80_4()
{
  return sub_247CBD3E8();
}

uint64_t OUTLINED_FUNCTION_81_4()
{
  return sub_247CA6CD4();
}

uint64_t OUTLINED_FUNCTION_82_3(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_247CAC504(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_85_3()
{
  sub_247ADF284(v0, v1);
  sub_247ADF284(v2, v3);
  return v0;
}

void OUTLINED_FUNCTION_88_4()
{
  JUMPOUT(0x24C5665C0);
}

uint64_t OUTLINED_FUNCTION_89_3(__n128 a1)
{
  *unint64_t v1 = a1;
  return sub_247CBD3F8();
}

uint64_t OUTLINED_FUNCTION_90_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_92_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_93_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_94_4()
{
  return v0;
}

void OUTLINED_FUNCTION_95_4(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t OUTLINED_FUNCTION_97_4()
{
  return v0 & 1;
}

uint64_t OUTLINED_FUNCTION_99_4()
{
  return type metadata accessor for AppIntentsProtobuf_ViewSnippet(0);
}

uint64_t OUTLINED_FUNCTION_102_2()
{
  return sub_247CBD3F8();
}

uint64_t OUTLINED_FUNCTION_105_1()
{
  return sub_247CBD408();
}

uint64_t OUTLINED_FUNCTION_106_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_109_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_115_3(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_247CAC504(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_116_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_117_3()
{
  return sub_247CA6A80();
}

uint64_t OUTLINED_FUNCTION_120_3(uint64_t result, __int16 a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2;
  *(unsigned char *)(v2 + 9) = HIBYTE(a2) & 1;
  return result;
}

void OUTLINED_FUNCTION_122_3()
{
  uint64_t v2 = (void *)(v0 + *(int *)(v1 + 32));
  *uint64_t v2 = 0;
  v2[1] = 0;
}

uint64_t OUTLINED_FUNCTION_126_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_130_2()
{
  return sub_247CBD6B8();
}

uint64_t OUTLINED_FUNCTION_131_3(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F44DF8](a1, a2, v3, v2);
}

uint64_t OUTLINED_FUNCTION_135_3()
{
  return type metadata accessor for AppIntentsProtobuf_Action(0);
}

uint64_t OUTLINED_FUNCTION_136_3()
{
  return sub_247CBD408();
}

void sub_247CB225C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_247CB373C(a1, v25);
  uint64_t v5 = v25[0];
  uint64_t v24 = v25[1];
  int64_t v6 = v25[3];
  unint64_t v7 = v25[4];
  int64_t v26 = (unint64_t)(v25[2] + 64) >> 6;
  swift_bridgeObjectRetain();
  if (!v7) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  unint64_t v9 = v8 | (v6 << 6);
  while (1)
  {
    id v14 = *(id *)(*(void *)(v5 + 56) + 8 * v9);
    id v15 = objc_msgSend(v14, sel_entityType);
    uint64_t v16 = sub_247CBDD98();
    uint64_t v18 = v17;

    if (v16 == a2 && v18 == a3)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v20 = sub_247CBE998();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        goto LABEL_29;
      }
    }
    id v21 = objc_msgSend(v14, sel_parameters);
    sub_247ADF128(0, &qword_2692ACCA0);
    unint64_t v22 = sub_247CBDF98();

    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_247CBE848();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_32;
    }
LABEL_29:

    if (v7) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v10 >= v26) {
      goto LABEL_32;
    }
    unint64_t v11 = *(void *)(v24 + 8 * v10);
    int64_t v12 = v6 + 1;
    if (!v11)
    {
      int64_t v12 = v6 + 2;
      if (v6 + 2 >= v26) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v24 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v6 + 3;
        if (v6 + 3 >= v26) {
          goto LABEL_32;
        }
        unint64_t v11 = *(void *)(v24 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v6 + 4;
          if (v6 + 4 >= v26) {
            goto LABEL_32;
          }
          unint64_t v11 = *(void *)(v24 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v6 + 5;
            if (v6 + 5 >= v26) {
              goto LABEL_32;
            }
            unint64_t v11 = *(void *)(v24 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v6 + 6;
              while (v13 < v26)
              {
                unint64_t v11 = *(void *)(v24 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
LABEL_32:
              swift_bridgeObjectRelease();
              swift_release();
              return;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v7 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v6 = v12;
  }
  __break(1u);
}

uint64_t sub_247CB2510(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_2692AC318);
    uint64_t v1 = sub_247CBE868();
  }
  else
  {
    uint64_t v1 = MEMORY[0x263F8EE80];
  }
  uint64_t v4 = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_247CB318C(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_247CB25AC(uint64_t a1, uint64_t *a2, void (*a3)(void), uint64_t *a4)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(a2);
    uint64_t v6 = sub_247CBE868();
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE80];
  }
  uint64_t v9 = v6;
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_247CB3464(v7, 1, &v9, a3, a4);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_247CB265C()
{
  uint64_t result = v0;
  *(_DWORD *)(v0 + 16) = 0;
  uint64_t v2 = MEMORY[0x263F8EE80];
  *(void *)(v0 + 24) = MEMORY[0x263F8EE80];
  *(_DWORD *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = v2;
  *(_DWORD *)(v0 + 48) = 0;
  *(void *)(v0 + 56) = v2;
  return result;
}

void sub_247CB2684()
{
  OUTLINED_FUNCTION_1_34();
  os_unfair_lock_lock(v0 + 4);
  OUTLINED_FUNCTION_0_29();
  sub_247CB2704(v1, v2, v3, v4, v5, v6, v7);
  os_unfair_lock_unlock(v0 + 4);
}

void sub_247CB2704(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X6>, void *a7@<X8>)
{
  v51[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v13 = *a1;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_247ACEFD8(a2, a3, v13);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    uint64_t v47 = a1;
    id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F520A8]), sel_initWithOptions_, 1);
    uint64_t v17 = (void *)sub_247CBDD68();
    v51[0] = 0;
    id v18 = objc_msgSend(v16, sel_entitiesForBundleIdentifier_error_, v17, v51);

    id v19 = v51[0];
    if (!v18)
    {
      id v35 = v51[0];
      uint64_t v36 = sub_247CBD038();

LABEL_25:
      swift_willThrow();
      goto LABEL_26;
    }
    uint64_t v46 = a4;
    sub_247ADF128(0, &qword_2692AE708);
    unint64_t v20 = sub_247CBDF98();
    id v21 = v19;

    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_247CBE848();
      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v22 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v22)
      {
LABEL_7:
        uint64_t v42 = a5;
        uint64_t v43 = a2;
        uint64_t v44 = a3;
        uint64_t v45 = a6;
        v51[0] = (id)MEMORY[0x263F8EE78];
        sub_247BBC3C4();
        if (v22 < 0) {
          __break(1u);
        }
        uint64_t v23 = 0;
        uint64_t v24 = v51[0];
        unint64_t v50 = v20 & 0xC000000000000001;
        unint64_t v25 = v20;
        uint64_t v26 = v22;
        do
        {
          if (v50) {
            id v27 = (id)MEMORY[0x24C567AF0](v23, v20);
          }
          else {
            id v27 = *(id *)(v20 + 8 * v23 + 32);
          }
          id v28 = v27;
          id v29 = objc_msgSend(v27, sel_identifier);
          uint64_t v30 = sub_247CBDD98();
          uint64_t v32 = v31;

          v51[0] = v24;
          unint64_t v33 = v24[2];
          if (v33 >= v24[3] >> 1)
          {
            sub_247BBC3C4();
            uint64_t v24 = v51[0];
          }
          ++v23;
          v24[2] = v33 + 1;
          unint64_t v34 = &v24[3 * v33];
          v34[4] = v30;
          v34[5] = v32;
          v34[6] = v28;
          unint64_t v20 = v25;
        }
        while (v26 != v23);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        a3 = v44;
        a6 = v45;
        a5 = v42;
        a2 = v43;
LABEL_19:
        uint64_t v37 = sub_247CB25AC((uint64_t)v24, &qword_2692AC308, sub_247BB572C, &qword_2692AE710);
        swift_bridgeObjectRetain();
        sub_247ADDB60(v37, a2, a3);
        swift_bridgeObjectRelease();
        uint64_t v38 = *v47;
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_247ACEFD8(a2, a3, v38);
        swift_bridgeObjectRelease();
        a4 = v46;
        if (!v14) {
          goto LABEL_20;
        }
        goto LABEL_2;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v24 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
LABEL_2:
  swift_bridgeObjectRetain();
  id v15 = sub_247ACEFDC(a4, a5, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
    *a7 = v15;
    return;
  }
LABEL_20:
  id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F520A8]), sel_initWithOptions_, 1);
  char v40 = sub_247BEAAF4(a2, a3);
  uint64_t v36 = v49;

  if (!v49)
  {
    sub_247AD94D0();
    uint64_t v36 = swift_allocError();
    *(void *)uint64_t v41 = a2;
    *(void *)(v41 + 8) = a3;
    if (v40)
    {
      *(void *)(v41 + 16) = a4;
      *(void *)(v41 + 24) = a5;
      *(unsigned char *)(v41 + 32) = 4;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(void *)(v41 + 16) = 0;
      *(void *)(v41 + 24) = 0;
      *(unsigned char *)(v41 + 32) = 1;
    }
    swift_bridgeObjectRetain();
    goto LABEL_25;
  }
LABEL_26:
  *a6 = v36;
}

void sub_247CB2B6C()
{
  OUTLINED_FUNCTION_1_34();
  os_unfair_lock_lock(v0 + 12);
  OUTLINED_FUNCTION_0_29();
  sub_247CB2BEC(v1, v2, v3, v4, v5, v6, v7);
  os_unfair_lock_unlock(v0 + 12);
}

void sub_247CB2BEC(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X6>, void *a7@<X8>)
{
  uint64_t v9 = v7;
  uint64_t v14 = a1;
  v55[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v16 = *a1;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_247ACEFD8(a2, a3, v16);
  swift_bridgeObjectRelease();
  uint64_t v52 = a7;
  if (v17)
  {
    swift_bridgeObjectRetain();
    goto LABEL_3;
  }
  uint64_t v51 = v9;
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F520A8]), sel_initWithOptions_, 1);
  id v21 = (void *)sub_247CBDD68();
  v55[0] = 0;
  id v22 = objc_msgSend(v20, sel_queriesForBundleIdentifier_ofType_error_, v21, 0, v55);

  id v23 = v55[0];
  if (!v22)
  {
    id v38 = v55[0];
    uint64_t v39 = sub_247CBD038();

LABEL_26:
    swift_willThrow();
    goto LABEL_27;
  }
  uint64_t v50 = a4;
  sub_247ADF128(0, &qword_2692AE6F8);
  unint64_t v24 = sub_247CBDF98();
  id v25 = v23;

  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_247CBE848();
    swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_8;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    id v28 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_20;
  }
  uint64_t v26 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v26) {
    goto LABEL_19;
  }
LABEL_8:
  uint64_t v46 = a2;
  uint64_t v47 = a5;
  uint64_t v48 = a3;
  uint64_t v49 = a6;
  v55[0] = (id)MEMORY[0x263F8EE78];
  sub_247BBC3F4();
  if (v26 < 0) {
    __break(1u);
  }
  uint64_t v27 = 0;
  id v28 = v55[0];
  unint64_t v53 = v24 & 0xC000000000000001;
  uint64_t v54 = v14;
  unint64_t v29 = v24;
  do
  {
    if (v53) {
      id v30 = (id)MEMORY[0x24C567AF0](v27, v24);
    }
    else {
      id v30 = *(id *)(v24 + 8 * v27 + 32);
    }
    id v31 = v30;
    id v32 = objc_msgSend(v30, sel_identifier);
    uint64_t v33 = sub_247CBDD98();
    uint64_t v35 = v34;

    v55[0] = v28;
    unint64_t v36 = v28[2];
    if (v36 >= v28[3] >> 1)
    {
      sub_247BBC3F4();
      id v28 = v55[0];
    }
    ++v27;
    v28[2] = v36 + 1;
    uint64_t v37 = &v28[3 * v36];
    v37[4] = v33;
    v37[5] = v35;
    v37[6] = v31;
    uint64_t v14 = v54;
    unint64_t v24 = v29;
  }
  while (v26 != v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a3 = v48;
  a6 = v49;
  a2 = v46;
  a5 = v47;
LABEL_20:
  uint64_t v40 = sub_247CB25AC((uint64_t)v28, &qword_2692AC300, sub_247BB5738, &qword_2692AE700);
  swift_bridgeObjectRetain();
  sub_247ADDB6C(v40, a2, a3);
  swift_bridgeObjectRelease();
  uint64_t v41 = *v14;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_247ACEFD8(a2, a3, v41);
  swift_bridgeObjectRelease();
  a4 = v50;
  if (v17)
  {
    swift_bridgeObjectRetain();
LABEL_3:
    swift_bridgeObjectRetain();
    sub_247CB225C(v17, a4, a5);
    uint64_t v19 = v18;
    swift_bridgeObjectRelease_n();
    if (v19)
    {
      void *v52 = v19;
      return;
    }
    goto LABEL_24;
  }
  id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F520A8]), sel_initWithOptions_, 1);
  char v43 = sub_247BEAAF4(a2, a3);
  uint64_t v39 = v51;

  if (!v51)
  {
    if ((v43 & 1) == 0)
    {
      sub_247AD94D0();
      uint64_t v39 = swift_allocError();
      *(void *)uint64_t v45 = a2;
      *(void *)(v45 + 8) = a3;
      *(void *)(v45 + 16) = 0;
      *(void *)(v45 + 24) = 0;
      *(unsigned char *)(v45 + 32) = 1;
      goto LABEL_25;
    }
LABEL_24:
    sub_247AD94D0();
    uint64_t v39 = swift_allocError();
    *(void *)uint64_t v44 = a2;
    *(void *)(v44 + 8) = a3;
    *(void *)(v44 + 16) = a4;
    *(void *)(v44 + 24) = a5;
    *(unsigned char *)(v44 + 32) = 6;
    swift_bridgeObjectRetain();
LABEL_25:
    swift_bridgeObjectRetain();
    goto LABEL_26;
  }
LABEL_27:
  *a6 = v39;
}

uint64_t sub_247CB3080()
{
  sub_247B688B4(v0 + 16, &qword_2692AE6E0);
  sub_247B688B4(v0 + 32, &qword_2692AE6E8);
  sub_247B688B4(v0 + 48, &qword_2692AE6F0);
  return v0;
}

uint64_t sub_247CB30C8()
{
  sub_247CB3080();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for CachedLinkMetadataProvider()
{
  return self;
}

uint64_t sub_247CB3120()
{
  if (MEMORY[0x263F8EEE0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE6E0);
  }
  else {
    return OUTLINED_FUNCTION_636(MEMORY[0x263F8EE60]);
  }
}

uint64_t sub_247CB3144()
{
  if (MEMORY[0x263F8EEE0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE6E8);
  }
  else {
    return OUTLINED_FUNCTION_636(MEMORY[0x263F8EE60]);
  }
}

uint64_t sub_247CB3168()
{
  if (MEMORY[0x263F8EEE0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE6F0);
  }
  else {
    return OUTLINED_FUNCTION_636(MEMORY[0x263F8EE60]);
  }
}

void sub_247CB318C(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v5 = (id *)(swift_bridgeObjectRetain() + 48);
  while (1)
  {
    uint64_t v7 = (uint64_t)*(v5 - 2);
    uint64_t v6 = (uint64_t)*(v5 - 1);
    id v8 = *v5;
    uint64_t v9 = (void *)*a3;
    id v24 = *v5;
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_247AD96DC(v7, v6);
    uint64_t v12 = v9[2];
    BOOL v13 = (v10 & 1) == 0;
    if (__OFADD__(v12, v13))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_247CBE9F8();
      __break(1u);
      goto LABEL_20;
    }
    char v14 = v10;
    if (v9[3] < v12 + v13) {
      break;
    }
    if (a2)
    {
      if (v10) {
        goto LABEL_14;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE718);
      sub_247CBE808();
      if (v14) {
        goto LABEL_14;
      }
    }
LABEL_10:
    uint64_t v17 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v18 = (uint64_t *)(v17[6] + 16 * v11);
    *uint64_t v18 = v7;
    v18[1] = v6;
    *(void *)(v17[7] + 8 * v11) = v8;
    uint64_t v19 = v17[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_18;
    }
    v5 += 3;
    v17[2] = v21;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_247BB555C();
  unint64_t v15 = sub_247AD96DC(v7, v6);
  if ((v14 & 1) != (v16 & 1)) {
    goto LABEL_19;
  }
  unint64_t v11 = v15;
  if ((v14 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  id v22 = (void *)swift_allocError();
  swift_willThrow();
  id v23 = v22;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ACD00);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    return;
  }
LABEL_20:
  sub_247CBE638();
  sub_247CBDE68();
  sub_247CBE7E8();
  sub_247CBDE68();
  sub_247CBE838();
  __break(1u);
}

void sub_247CB3464(uint64_t a1, char a2, void *a3, void (*a4)(void), uint64_t *a5)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return;
  }
  for (i = (void **)(swift_bridgeObjectRetain() + 48); ; i += 3)
  {
    uint64_t v9 = (uint64_t)*(i - 2);
    uint64_t v8 = (uint64_t)*(i - 1);
    char v10 = *i;
    unint64_t v11 = (void *)*a3;
    swift_bridgeObjectRetain();
    id v12 = v10;
    unint64_t v14 = sub_247AD96DC(v9, v8);
    uint64_t v15 = v11[2];
    BOOL v16 = (v13 & 1) == 0;
    if (__OFADD__(v15, v16))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_247CBE9F8();
      __break(1u);
      goto LABEL_20;
    }
    char v17 = v13;
    if (v11[3] < v15 + v16) {
      break;
    }
    if (a2)
    {
      if (v13) {
        goto LABEL_14;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      sub_247CBE808();
      if (v17) {
        goto LABEL_14;
      }
    }
LABEL_10:
    BOOL v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v14 >> 6) + 64) |= 1 << v14;
    uint64_t v21 = (uint64_t *)(v20[6] + 16 * v14);
    *uint64_t v21 = v9;
    v21[1] = v8;
    *(void *)(v20[7] + 8 * v14) = v12;
    uint64_t v22 = v20[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_18;
    }
    v20[2] = v24;
    a2 = 1;
    if (!--v5)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  a4();
  unint64_t v18 = sub_247AD96DC(v9, v8);
  if ((v17 & 1) != (v19 & 1)) {
    goto LABEL_19;
  }
  unint64_t v14 = v18;
  if ((v17 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  id v25 = (void *)swift_allocError();
  swift_willThrow();
  id v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ACD00);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    return;
  }
LABEL_20:
  sub_247CBE638();
  sub_247CBDE68();
  sub_247CBE7E8();
  sub_247CBDE68();
  sub_247CBE838();
  __break(1u);
}

uint64_t sub_247CB373C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_30(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0588](v2, a2, 22, 1, 489);
}

uint64_t sub_247CB37E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t sub_247CB3800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t type metadata accessor for AppIntentsProtocol.Notifications.RestartObservingRequest(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE720);
}

uint64_t *sub_247CB383C(uint64_t *a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_1_23();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_118_1(*a2);
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    sub_247CBD248();
    OUTLINED_FUNCTION_20();
    uint64_t v9 = *(void (**)(uint64_t))(v8 + 16);
    swift_bridgeObjectRetain();
    uint64_t v10 = OUTLINED_FUNCTION_15_15();
    v9(v10);
    uint64_t v11 = *(int *)(v6 + 24);
    id v12 = (uint64_t *)((char *)a1 + v11);
    char v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *id v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = v13[3];
    v12[2] = v13[2];
    v12[3] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_247CB3910(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_247CBD248();
  OUTLINED_FUNCTION_20();
  (*(void (**)(uint64_t))(v5 + 8))(v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CB39A0()
{
  OUTLINED_FUNCTION_384_0();
  uint64_t v4 = v3[1];
  *uint64_t v5 = *v3;
  v5[1] = v4;
  sub_247CBD248();
  OUTLINED_FUNCTION_20();
  uint64_t v7 = *(void (**)(uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  uint64_t v8 = OUTLINED_FUNCTION_15_15();
  v7(v8);
  uint64_t v9 = *(int *)(v0 + 24);
  uint64_t v10 = (void *)(v2 + v9);
  uint64_t v11 = (void *)(v1 + v9);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = v11[3];
  void v10[2] = v11[2];
  v10[3] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_247CB3A50(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_247CBD248();
  OUTLINED_FUNCTION_20();
  uint64_t v6 = OUTLINED_FUNCTION_16_16();
  v7(v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)((char *)a1 + v8);
  uint64_t v10 = (void *)((char *)a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9[2] = v10[2];
  v9[3] = v10[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247CB3B30()
{
  OUTLINED_FUNCTION_384_0();
  *uint64_t v4 = *v3;
  sub_247CBD248();
  OUTLINED_FUNCTION_20();
  uint64_t v5 = OUTLINED_FUNCTION_16_16();
  v6(v5);
  uint64_t v7 = *(int *)(v0 + 24);
  uint64_t v8 = (_OWORD *)(v2 + v7);
  uint64_t v9 = (_OWORD *)(v1 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  return v2;
}

void *sub_247CB3BB8()
{
  OUTLINED_FUNCTION_384_0();
  uint64_t v4 = v3[1];
  *uint64_t v2 = *v3;
  v2[1] = v4;
  swift_bridgeObjectRelease();
  sub_247CBD248();
  OUTLINED_FUNCTION_20();
  uint64_t v5 = OUTLINED_FUNCTION_16_16();
  v6(v5);
  uint64_t v7 = *(int *)(v0 + 24);
  uint64_t v8 = (void *)((char *)v2 + v7);
  uint64_t v9 = (void *)(v1 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_247CB3C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB3C74);
}

uint64_t __swift_get_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v6 + 84) == v3)
  {
    uint64_t v7 = OUTLINED_FUNCTION_17_17();
    return __swift_getEnumTagSinglePayload(v7, v8, v9);
  }
  else
  {
    unint64_t v11 = *(void *)(v4 + *(int *)(a3 + 24) + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_247CB3CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB3D10);
}

void __swift_store_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_247CBD248();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
}

uint64_t type metadata accessor for AppIntentsProtocol.Notifications.StopObservingRequest(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE730);
}

uint64_t sub_247CB3DC8()
{
  uint64_t result = sub_247CBD248();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_165_1(result);
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247CB3E44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CBD248();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_247CB3EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB3EC4);
}

uint64_t sub_247CB3EC4()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_31();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_247CB3F00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB3F14);
}

uint64_t sub_247CB3F14()
{
  OUTLINED_FUNCTION_3_31();
  uint64_t v0 = OUTLINED_FUNCTION_56_2();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t type metadata accessor for AppIntentsProtocol.Notifications.StartObservingResponse(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE740);
}

uint64_t sub_247CB3F68()
{
  uint64_t result = sub_247CBD248();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.Notifications()
{
}

uint64_t sub_247CB4000(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CB4040(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.Notifications.StartObservingRequest()
{
}

void type metadata accessor for AppIntentsProtocol.ReleaseAsyncSequence()
{
}

uint64_t sub_247CB40A4(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CB40E4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

void type metadata accessor for AppIntentsProtocol.ReleaseAsyncSequence.Request()
{
}

uint64_t sub_247CB4130(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_247ADF278(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void sub_247CB4178(uint64_t a1)
{
}

uint64_t *sub_247CB4188(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_247CBC3C0(a1, a2, a3, (void (*)(void, void))sub_247ADF278, (void (*)(uint64_t, uint64_t))sub_247B0BC88);
}

uint64_t sub_247CB41B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_247B0BC88(v5, v6);
  return a1;
}

void type metadata accessor for AppIntentsProtocol.FetchNextAsyncIteratorResults.Response()
{
}

void type metadata accessor for AppIntentsProtocol.FetchNextAsyncIteratorResults()
{
}

uint64_t sub_247CB4214(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  char v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t sub_247CB4258(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t sub_247CB42C4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  char v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t sub_247CB4314(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 25))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CB4354(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.FetchNextAsyncIteratorResults.Request()
{
}

void type metadata accessor for AppIntentsProtocol.CreateAsyncIterator.Response()
{
}

void type metadata accessor for AppIntentsProtocol.CreateAsyncIterator()
{
}

void sub_247CB43BC(uint64_t a1)
{
  swift_bridgeObjectRelease();

  unint64_t v2 = *(void **)(a1 + 24);
}

void *sub_247CB4400(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  char v4 = (void *)a2[2];
  id v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  id v6 = v4;
  id v7 = v5;
  return a1;
}

void *sub_247CB4448(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  id v7 = (void *)a2[3];
  uint64_t v8 = (void *)a1[3];
  a1[3] = v7;
  id v9 = v7;

  return a1;
}

uint64_t sub_247CB44C0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  char v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

void type metadata accessor for AppIntentsProtocol.CreateAsyncIterator.Request()
{
}

void type metadata accessor for AppIntentsProtocol.FetchFileChunk()
{
}

uint64_t *sub_247CB4530(uint64_t *a1, uint64_t *a2, int *a3)
{
  char v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *char v4 = *a2;
    char v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    id v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_247CBD108();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v4 + v13) = *(uint64_t *)((char *)a2 + v13);
  }
  return v4;
}

uint64_t sub_247CB463C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247CBD108();
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_247CB46B4(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  id v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD108();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  return a1;
}

void *sub_247CB4770(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD108();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  return a1;
}

_OWORD *sub_247CB482C(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247CBD108();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  return a1;
}

void *sub_247CB48CC(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247CBD108();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  return a1;
}

uint64_t sub_247CB4974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB4988);
}

uint64_t sub_247CB4988(uint64_t a1, int a2)
{
  if (a2 == 2147483646) {
    return OUTLINED_FUNCTION_7_14(*(void *)(a1 + 8));
  }
  sub_247CBD108();
  uint64_t v3 = OUTLINED_FUNCTION_17_17();
  return __swift_getEnumTagSinglePayload(v3, v4, v5);
}

uint64_t sub_247CB49FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB4A10);
}

uint64_t sub_247CB4A10(uint64_t result, uint64_t a2, int a3)
{
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    sub_247CBD108();
    uint64_t v4 = OUTLINED_FUNCTION_17_17();
    return __swift_storeEnumTagSinglePayload(v4, v5, a2, v6);
  }
  return result;
}

uint64_t type metadata accessor for AppIntentsProtocol.FetchFileChunk.Request(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE750);
}

uint64_t sub_247CB4AA8()
{
  uint64_t result = sub_247CBD108();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247CB4B50(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(id *)a2;
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void sub_247CB4B98(id *a1)
{
}

uint64_t *sub_247CB4BA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_247CBC3C0(a1, a2, a3, (void (*)(void, void))j__objc_retain, (void (*)(uint64_t, uint64_t))j__objc_release);
}

uint64_t sub_247CB4BD4(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

void type metadata accessor for AppIntentsProtocol.FetchDeferredPropertyValue.Response()
{
}

void type metadata accessor for AppIntentsProtocol.FetchDeferredPropertyValue()
{
}

uint64_t sub_247CB4C2C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if ((unint64_t)(*(void *)(a1 + 24) - 1) >= 2) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CB4C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  id v5 = (_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v6 == 1 || v6 == 2)
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  else
  {
    *(void *)(a1 + 16) = *(void *)v5;
    *(void *)(a1 + 24) = v6;
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  long long v8 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain();
  v10(a1 + 48, a2 + 48, v9);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247CB4D78(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  if (v4 == 2)
  {
    if (v5 != 1 && v5 != 2) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if (v5 == 2)
  {
    sub_247B68690(a1 + 16);
    goto LABEL_12;
  }
  if (v4 != 1)
  {
    if (v5 != 1)
    {
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    sub_247ACB4EC(a1 + 16, &qword_2692AB568);
    goto LABEL_12;
  }
  if (v5 == 1)
  {
LABEL_12:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_13;
  }
LABEL_9:
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
LABEL_13:
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 48), (uint64_t *)(a2 + 48));
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t sub_247CB4ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)(a2 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 != 2)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    if (v7 == 2)
    {
      sub_247B68690(a1 + 16);
    }
    else if (v6 != 1)
    {
      if (v7 != 1)
      {
        *(void *)(a1 + 16) = *v5;
        *(void *)(a1 + 24) = v7;
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      sub_247ACB4EC(a1 + 16, &qword_2692AB568);
    }
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
LABEL_8:
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  long long v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v9;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247CB4FB8(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CB4FF8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.FetchDeferredPropertyValue.Request()
{
}

void sub_247CB5060(uint64_t a1)
{
}

uint64_t sub_247CB5074(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_247ADF4BC(*(void **)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t sub_247CB50D8(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_247ADF4BC(*(void **)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void **)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  char v12 = *(unsigned char *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  sub_247ADF380(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t sub_247CB514C(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void **)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v3;
  sub_247ADF380(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t sub_247CB5198(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CB51D8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_247CB5220(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

void type metadata accessor for AppIntentsProtocol.PerformQuery.Response()
{
}

void type metadata accessor for AppIntentsProtocol.PerformQuery()
{
}

uint64_t sub_247CB5244(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if ((unint64_t)(*(void *)(a1 + 24) - 1) >= 2) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  switch(*(unsigned char *)(a1 + 192))
  {
    case 0:
    case 1:
    case 5:
    case 6:
      goto LABEL_7;
    case 2:
    case 4:
      goto LABEL_5;
    case 3:
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(a1 + 160))
      {
LABEL_5:
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(a1 + 120);
      }
LABEL_7:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247CB5358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v6 == 1 || v6 == 2)
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  else
  {
    *(void *)(a1 + 16) = *(void *)v5;
    *(void *)(a1 + 24) = v6;
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v9 = *(unsigned __int8 *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  switch(v9)
  {
    case 1:
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      char v20 = 1;
      goto LABEL_17;
    case 2:
      uint64_t v12 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = v12;
      uint64_t v13 = *(void *)(a2 + 96);
      uint64_t v14 = *(void *)(a2 + 104);
      *(void *)(a1 + 96) = v13;
      *(void *)(a1 + 104) = v14;
      char v15 = 2;
      goto LABEL_11;
    case 3:
      uint64_t v16 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = v16;
      char v17 = *(unsigned char *)(a2 + 160);
      swift_bridgeObjectRetain();
      if (v17)
      {
        uint64_t v18 = *(void *)(a2 + 104);
        *(void *)(a1 + 96) = *(void *)(a2 + 96);
        *(void *)(a1 + 104) = v18;
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v25 = *(void *)(a2 + 104);
        *(void *)(a1 + 96) = *(void *)(a2 + 96);
        *(void *)(a1 + 104) = v25;
        *(void *)(a1 + 112) = *(void *)(a2 + 112);
        long long v26 = *(_OWORD *)(a2 + 144);
        *(_OWORD *)(a1 + 144) = v26;
        uint64_t v27 = v26;
        id v28 = **(void (***)(uint64_t, uint64_t, uint64_t))(v26 - 8);
        swift_bridgeObjectRetain();
        v28(a1 + 120, a2 + 120, v27);
      }
      *(unsigned char *)(a1 + 160) = v17;
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      char v20 = 3;
      goto LABEL_17;
    case 4:
      uint64_t v19 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = v19;
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      char v15 = 4;
LABEL_11:
      *(unsigned char *)(a1 + 192) = v15;
      swift_bridgeObjectRetain();
      break;
    case 5:
      uint64_t v21 = *(void *)(a2 + 80);
      uint64_t v22 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = v21;
      *(void *)(a1 + 88) = v22;
      char v20 = 5;
      goto LABEL_17;
    case 6:
      uint64_t v23 = *(void *)(a2 + 80);
      uint64_t v24 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = v23;
      *(void *)(a1 + 88) = v24;
      char v20 = 6;
LABEL_17:
      *(unsigned char *)(a1 + 192) = v20;
      break;
    default:
      uint64_t v10 = *(void *)(a2 + 80);
      uint64_t v11 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = v10;
      *(void *)(a1 + 88) = v11;
      *(unsigned char *)(a1 + 192) = 0;
      break;
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247CB5570(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  if (v4 == 2)
  {
    if (v5 != 1 && v5 != 2) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if (v5 == 2)
  {
    sub_247B68690(a1 + 16);
LABEL_12:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_13;
  }
  if (v4 == 1)
  {
    if (v5 != 1)
    {
LABEL_9:
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v5 == 1)
  {
    sub_247ACB4EC(a1 + 16, &qword_2692AB568);
    goto LABEL_12;
  }
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_13:
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  if (a1 != a2)
  {
    sub_247B0B558(a1 + 80);
    switch(*(unsigned char *)(a2 + 192))
    {
      case 1:
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        char v7 = 1;
        goto LABEL_27;
      case 2:
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = *(void *)(a2 + 88);
        *(void *)(a1 + 96) = *(void *)(a2 + 96);
        *(void *)(a1 + 104) = *(void *)(a2 + 104);
        char v6 = 2;
        goto LABEL_18;
      case 3:
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = *(void *)(a2 + 88);
        char v8 = *(unsigned char *)(a2 + 160);
        swift_bridgeObjectRetain();
        *(void *)(a1 + 96) = *(void *)(a2 + 96);
        *(void *)(a1 + 104) = *(void *)(a2 + 104);
        if (v8)
        {
          swift_bridgeObjectRetain();
        }
        else
        {
          *(void *)(a1 + 112) = *(void *)(a2 + 112);
          uint64_t v9 = *(void *)(a2 + 144);
          *(void *)(a1 + 144) = v9;
          *(void *)(a1 + 152) = *(void *)(a2 + 152);
          uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
          swift_bridgeObjectRetain();
          v10(a1 + 120, a2 + 120, v9);
        }
        *(unsigned char *)(a1 + 160) = v8;
        uint64_t v11 = *(void *)(a2 + 168);
        *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
        *(void *)(a1 + 168) = v11;
        *(void *)(a1 + 184) = *(void *)(a2 + 184);
        char v7 = 3;
        goto LABEL_27;
      case 4:
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = *(void *)(a2 + 88);
        *(void *)(a1 + 96) = *(void *)(a2 + 96);
        char v6 = 4;
LABEL_18:
        *(unsigned char *)(a1 + 192) = v6;
        swift_bridgeObjectRetain();
        break;
      case 5:
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = *(void *)(a2 + 88);
        char v7 = 5;
        goto LABEL_27;
      case 6:
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = *(void *)(a2 + 88);
        char v7 = 6;
LABEL_27:
        *(unsigned char *)(a1 + 192) = v7;
        break;
      default:
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = *(void *)(a2 + 88);
        *(unsigned char *)(a1 + 192) = 0;
        break;
    }
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *__swift_memcpy193_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC1uLL);
}

uint64_t sub_247CB58A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = (_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 == 2) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 24);
  if (v7 == 2)
  {
    sub_247B68690(a1 + 16);
LABEL_7:
    *(_OWORD *)(a1 + 16) = *v5;
    goto LABEL_8;
  }
  if (v6 == 1) {
    goto LABEL_7;
  }
  if (v7 == 1)
  {
    sub_247ACB4EC(a1 + 16, &qword_2692AB568);
    goto LABEL_7;
  }
  *(void *)(a1 + 16) = *(void *)v5;
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  if (a1 != a2)
  {
    sub_247B0B558(a1 + 80);
    memcpy((void *)(a1 + 80), (const void *)(a2 + 80), 0x71uLL);
  }
  return a1;
}

uint64_t sub_247CB59A0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 193))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CB59E0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 184) = 0;
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
    *(unsigned char *)(result + 192) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 193) = 1;
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
    *(unsigned char *)(result + 193) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.PerformQuery.Request()
{
}

uint64_t *sub_247CB5A60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_247CBD248();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void **)v10;
    LOBYTE(v10) = v10[8];
    *(void *)uint64_t v9 = v11;
    v9[8] = (char)v10;
    id v12 = v11;
  }
  return a1;
}

void sub_247CB5B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_247CB5BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)v9;
  LOBYTE(v9) = *(unsigned char *)(v9 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = v9;
  id v11 = v10;
  return a1;
}

uint64_t sub_247CB5C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)v9;
  LOBYTE(v9) = *(unsigned char *)(v9 + 8);
  id v11 = *(void **)v8;
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = v9;
  id v12 = v10;

  return a1;
}

uint64_t sub_247CB5CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  id v11 = *(void **)v8;
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;

  return a1;
}

uint64_t sub_247CB5D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_19Tm_0);
}

uint64_t sub_247CB5D8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_20Tm_0);
}

uint64_t type metadata accessor for AppIntentsProtocol.PerformAction.NeedsValueResponse(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE760);
}

uint64_t sub_247CB5DC4()
{
  return sub_247CB6BB8();
}

uint64_t *sub_247CB5DD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a3;
    uint64_t v7 = sub_247CBD248();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    id v11 = *(id *)v10;
    LOBYTE(v6) = v10[8];
    sub_247B9C72C(*(id *)v10, v6);
    *(void *)uint64_t v9 = v11;
    v9[8] = v6;
  }
  return a1;
}

void sub_247CB5EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = *(void **)v5;
  unsigned __int8 v7 = *(unsigned char *)(v5 + 8);
  sub_247B0B108(v6, v7);
}

uint64_t sub_247CB5F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  id v10 = *(id *)v9;
  LOBYTE(a2) = *(unsigned char *)(v9 + 8);
  sub_247B9C72C(*(id *)v9, a2);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = a2;
  return a1;
}

uint64_t sub_247CB5FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  id v10 = *(id *)v9;
  LOBYTE(a2) = *(unsigned char *)(v9 + 8);
  sub_247B9C72C(*(id *)v9, a2);
  id v11 = *(void **)v8;
  *(void *)uint64_t v8 = v10;
  unsigned __int8 v12 = *(unsigned char *)(v8 + 8);
  *(unsigned char *)(v8 + 8) = a2;
  sub_247B0B108(v11, v12);
  return a1;
}

uint64_t sub_247CB6070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  id v11 = *(void **)v8;
  *(void *)uint64_t v8 = v10;
  unsigned __int8 v12 = *(unsigned char *)(v8 + 8);
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  sub_247B0B108(v11, v12);
  return a1;
}

uint64_t sub_247CB6108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB611C);
}

uint64_t sub_247CB611C()
{
  OUTLINED_FUNCTION_9_20();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v1 + 84) == v0)
  {
    uint64_t v2 = OUTLINED_FUNCTION_13_16();
    return __swift_getEnumTagSinglePayload(v2, v3, v4);
  }
  else
  {
    OUTLINED_FUNCTION_20_18();
    if (v7 > 2) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_247CB6188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB619C);
}

void sub_247CB619C(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v4 + 84) == a3)
  {
    uint64_t v5 = OUTLINED_FUNCTION_56_2();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    OUTLINED_FUNCTION_21_15();
  }
}

uint64_t type metadata accessor for AppIntentsProtocol.PerformAction.DisambiguationResponse(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE770);
}

uint64_t sub_247CB6228()
{
  return sub_247CB6BB8();
}

uint64_t *sub_247CB6234(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_247CBD248();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

uint64_t sub_247CB6304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t sub_247CB6384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  id v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = v9;

  return a1;
}

uint64_t sub_247CB640C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t sub_247CB6490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB64A4);
}

uint64_t sub_247CB64A4()
{
  OUTLINED_FUNCTION_9_20();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v3 + 84) != v1) {
    return OUTLINED_FUNCTION_7_14(*(void *)(v0 + *(int *)(v2 + 20)));
  }
  uint64_t v4 = OUTLINED_FUNCTION_13_16();
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_247CB6510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB6524);
}

void sub_247CB6524(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = OUTLINED_FUNCTION_56_2();
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(v5 + *(int *)(a4 + 20)) = v4;
  }
}

uint64_t type metadata accessor for AppIntentsProtocol.PerformAction.ContinueInAppResponse(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE780);
}

uint64_t sub_247CB65B8()
{
  return sub_247CB6BB8();
}

uint64_t sub_247CB65C4(uint64_t a1, uint64_t *a2)
{
  return sub_247CB66B8(a1, a2);
}

uint64_t sub_247CB65DC(uint64_t a1, uint64_t a2)
{
  return sub_247CB677C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))sub_247B0C32C);
}

uint64_t sub_247CB65F4()
{
  return sub_247CB681C();
}

uint64_t sub_247CB660C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247CB68D4(a1, a2, a3, (void (*)(uint64_t))sub_247CBCC34, (void (*)(uint64_t, uint64_t))sub_247B0C32C);
}

uint64_t sub_247CB6638()
{
  return sub_247CB6A0C();
}

uint64_t sub_247CB6650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_19Tm_0_0);
}

uint64_t sub_247CB6668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_20Tm_0_0);
}

uint64_t type metadata accessor for AppIntentsProtocol.PerformAction.ConfirmationResponse(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE790);
}

uint64_t sub_247CB66A0(uint64_t a1, uint64_t *a2)
{
  return sub_247CB66B8(a1, a2);
}

uint64_t sub_247CB66B8(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_1_23();
  if ((*(_DWORD *)(v6 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_118_1(*a2);
  }
  else
  {
    uint64_t v7 = v5;
    uint64_t v8 = v4;
    sub_247CBD248();
    OUTLINED_FUNCTION_20();
    (*(void (**)(uint64_t, uint64_t *))(v9 + 16))(a1, a2);
    uint64_t v10 = *(int *)(v8 + 20);
    uint64_t v11 = a1 + v10;
    uint64_t v12 = OUTLINED_FUNCTION_14_18((uint64_t)a2 + v10);
    v7(v12);
    *(void *)uint64_t v11 = a2;
    *(unsigned char *)(v11 + 8) = v8;
  }
  return a1;
}

uint64_t sub_247CB6764(uint64_t a1, uint64_t a2)
{
  return sub_247CB677C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))sub_247B0B058);
}

uint64_t sub_247CB677C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  sub_247CBD248();
  OUTLINED_FUNCTION_20();
  (*(void (**)(uint64_t))(v5 + 8))(a1);
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  uint64_t v7 = *v6;
  uint64_t v8 = *((unsigned __int8 *)v6 + 8);
  return a3(v7, v8);
}

uint64_t sub_247CB6804()
{
  return sub_247CB681C();
}

uint64_t sub_247CB681C()
{
  OUTLINED_FUNCTION_19_17();
  OUTLINED_FUNCTION_20();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v3, v2);
  uint64_t v5 = *(int *)(v1 + 20);
  uint64_t v6 = v3 + v5;
  uint64_t v7 = (uint64_t *)(v2 + v5);
  uint64_t v8 = *v7;
  unsigned __int8 v9 = *((unsigned char *)v7 + 8);
  v0(*v7, v9);
  *(void *)uint64_t v6 = v8;
  *(unsigned char *)(v6 + 8) = v9;
  return v3;
}

uint64_t sub_247CB68A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247CB68D4(a1, a2, a3, (void (*)(uint64_t))sub_247B9C798, (void (*)(uint64_t, uint64_t))sub_247B0B058);
}

uint64_t sub_247CB68D4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), void (*a5)(uint64_t, uint64_t))
{
  sub_247CBD248();
  OUTLINED_FUNCTION_20();
  (*(void (**)(uint64_t, uint64_t))(v10 + 24))(a1, a2);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (uint64_t *)(a1 + v11);
  uint64_t v13 = OUTLINED_FUNCTION_14_18(a2 + v11);
  a4(v13);
  uint64_t v14 = *v12;
  uint64_t v15 = *((unsigned __int8 *)v12 + 8);
  *uint64_t v12 = a3;
  *((unsigned char *)v12 + 8) = a2;
  a5(v14, v15);
  return a1;
}

uint64_t sub_247CB6978()
{
  OUTLINED_FUNCTION_384_0();
  sub_247CBD248();
  OUTLINED_FUNCTION_20();
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v1);
  uint64_t v4 = *(int *)(v0 + 20);
  uint64_t v5 = v2 + v4;
  uint64_t v6 = v1 + v4;
  *(void *)uint64_t v5 = *(void *)v6;
  *(unsigned char *)(v5 + 8) = *(unsigned char *)(v6 + 8);
  return v2;
}

uint64_t sub_247CB69F4()
{
  return sub_247CB6A0C();
}

uint64_t sub_247CB6A0C()
{
  OUTLINED_FUNCTION_19_17();
  OUTLINED_FUNCTION_20();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v3, v2);
  uint64_t v5 = *(int *)(v1 + 20);
  uint64_t v6 = (uint64_t *)(v3 + v5);
  uint64_t v7 = (uint64_t *)(v2 + v5);
  uint64_t v8 = *v7;
  LOBYTE(v7) = *((unsigned char *)v7 + 8);
  uint64_t v9 = *v6;
  uint64_t v10 = *((unsigned __int8 *)v6 + 8);
  *uint64_t v6 = v8;
  *((unsigned char *)v6 + 8) = (_BYTE)v7;
  v0(v9, v10);
  return v3;
}

uint64_t sub_247CB6A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247CB6AA4);
}

uint64_t __swift_get_extra_inhabitant_index_19Tm_0()
{
  OUTLINED_FUNCTION_9_20();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v1 + 84) == v0)
  {
    uint64_t v2 = OUTLINED_FUNCTION_13_16();
    return __swift_getEnumTagSinglePayload(v2, v3, v4);
  }
  else
  {
    OUTLINED_FUNCTION_20_18();
    if (v7 > 1) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_247CB6B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247CB6B28);
}

void __swift_store_extra_inhabitant_index_20Tm_0(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_23();
  if (*(_DWORD *)(v4 + 84) == a3)
  {
    uint64_t v5 = OUTLINED_FUNCTION_56_2();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    OUTLINED_FUNCTION_21_15();
  }
}

uint64_t type metadata accessor for AppIntentsProtocol.PerformAction.ActionConfirmationResponse(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE7A0);
}

uint64_t sub_247CB6BB8()
{
  uint64_t result = sub_247CBD248();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_165_1(result);
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_247CB6C24(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *(void *)a1 = *a2;
    a1 = &v8[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v9 = *a2;
        *(void *)a1 = *a2;
        uint64_t v10 = v9;
        break;
      case 2u:
        uint64_t v11 = sub_247CBD248();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
        uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF50) + 28);
        uint64_t v13 = &a1[v12];
        uint64_t v14 = (uint64_t)a2 + v12;
        uint64_t v15 = *(void *)(v14 + 24);
        if (v15)
        {
          uint64_t v16 = *(void *)(v14 + 32);
          *((void *)v13 + 3) = v15;
          *((void *)v13 + 4) = v16;
          (**(void (***)(char *, uint64_t))(v15 - 8))(v13, v14);
        }
        else
        {
          long long v48 = *(_OWORD *)(v14 + 16);
          *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
          *((_OWORD *)v13 + 1) = v48;
          *((void *)v13 + 4) = *(void *)(v14 + 32);
        }
        uint64_t v49 = v13 + 40;
        uint64_t v50 = (_OWORD *)(v14 + 40);
        uint64_t v51 = *(void *)(v14 + 64);
        if (v51)
        {
          uint64_t v52 = *(void *)(v14 + 72);
          *((void *)v13 + 8) = v51;
          *((void *)v13 + 9) = v52;
          (**(void (***)(_OWORD *, _OWORD *))(v51 - 8))(v49, v50);
        }
        else
        {
          long long v72 = *(_OWORD *)(v14 + 56);
          *uint64_t v49 = *v50;
          *(_OWORD *)(v13 + 56) = v72;
          *((void *)v13 + 9) = *(void *)(v14 + 72);
        }
        uint64_t v73 = v13 + 80;
        uint64_t v74 = (_OWORD *)(v14 + 80);
        uint64_t v75 = *(void *)(v14 + 104);
        if (v75)
        {
          uint64_t v76 = *(void *)(v14 + 112);
          *((void *)v13 + 13) = v75;
          *((void *)v13 + 14) = v76;
          (**(void (***)(_OWORD *, _OWORD *))(v75 - 8))(v73, v74);
        }
        else
        {
          long long v87 = *(_OWORD *)(v14 + 96);
          *uint64_t v73 = *v74;
          *((_OWORD *)v13 + 6) = v87;
          *((void *)v13 + 14) = *(void *)(v14 + 112);
        }
        v13[120] = *(unsigned char *)(v14 + 120);
        break;
      case 3u:
        uint64_t v17 = sub_247CBD248();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
        uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA28) + 28);
        uint64_t v19 = &a1[v18];
        uint64_t v20 = (uint64_t)a2 + v18;
        uint64_t v21 = *(void *)(v20 + 24);
        if (v21)
        {
          uint64_t v22 = *(void *)(v20 + 32);
          *((void *)v19 + 3) = v21;
          *((void *)v19 + 4) = v22;
          (**(void (***)(char *, uint64_t))(v21 - 8))(v19, v20);
        }
        else
        {
          long long v53 = *(_OWORD *)(v20 + 16);
          *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
          *((_OWORD *)v19 + 1) = v53;
          *((void *)v19 + 4) = *(void *)(v20 + 32);
        }
        long long v54 = *(_OWORD *)(v20 + 64);
        *((_OWORD *)v19 + 4) = v54;
        (**(void (***)(uint64_t, uint64_t))(v54 - 8))((uint64_t)(v19 + 40), v20 + 40);
        uint64_t v55 = v19 + 80;
        uint64_t v56 = (_OWORD *)(v20 + 80);
        uint64_t v57 = *(void *)(v20 + 104);
        if (v57)
        {
          uint64_t v58 = *(void *)(v20 + 112);
          *((void *)v19 + 13) = v57;
          *((void *)v19 + 14) = v58;
          (**(void (***)(_OWORD *, _OWORD *))(v57 - 8))(v55, v56);
        }
        else
        {
          long long v77 = *(_OWORD *)(v20 + 96);
          _OWORD *v55 = *v56;
          *((_OWORD *)v19 + 6) = v77;
          *((void *)v19 + 14) = *(void *)(v20 + 112);
        }
        uint64_t v78 = v19 + 120;
        uint64_t v79 = (_OWORD *)(v20 + 120);
        uint64_t v80 = *(void *)(v20 + 144);
        if (v80)
        {
          uint64_t v81 = *(void *)(v20 + 152);
          *((void *)v19 + 18) = v80;
          *((void *)v19 + 19) = v81;
          (**(void (***)(_OWORD *, _OWORD *))(v80 - 8))(v78, v79);
        }
        else
        {
          long long v88 = *(_OWORD *)(v20 + 136);
          *uint64_t v78 = *v79;
          *(_OWORD *)(v19 + 136) = v88;
          *((void *)v19 + 19) = *(void *)(v20 + 152);
        }
        break;
      case 4u:
        uint64_t v23 = sub_247CBD248();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v23 - 8) + 16))(a1, a2, v23);
        uint64_t v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA38) + 28);
        uint64_t v25 = &a1[v24];
        uint64_t v26 = (uint64_t)a2 + v24;
        uint64_t v27 = *(void *)(v26 + 24);
        if (v27)
        {
          uint64_t v28 = *(void *)(v26 + 32);
          *((void *)v25 + 3) = v27;
          *((void *)v25 + 4) = v28;
          (**(void (***)(char *, uint64_t))(v27 - 8))(v25, v26);
        }
        else
        {
          long long v59 = *(_OWORD *)(v26 + 16);
          *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
          *((_OWORD *)v25 + 1) = v59;
          *((void *)v25 + 4) = *(void *)(v26 + 32);
        }
        *((_WORD *)v25 + 20) = *(_WORD *)(v26 + 40);
        *((void *)v25 + 6) = *(void *)(v26 + 48);
        break;
      case 5u:
        uint64_t v29 = sub_247CBD248();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v29 - 8) + 16))(a1, a2, v29);
        uint64_t v30 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692ABF90) + 28);
        id v31 = &a1[v30];
        uint64_t v32 = (uint64_t)a2 + v30;
        uint64_t v33 = *(void *)(v32 + 24);
        if (v33)
        {
          uint64_t v34 = *(void *)(v32 + 32);
          *((void *)v31 + 3) = v33;
          *((void *)v31 + 4) = v34;
          (**(void (***)(char *, uint64_t))(v33 - 8))(v31, v32);
        }
        else
        {
          long long v60 = *(_OWORD *)(v32 + 16);
          *(_OWORD *)id v31 = *(_OWORD *)v32;
          *((_OWORD *)v31 + 1) = v60;
          *((void *)v31 + 4) = *(void *)(v32 + 32);
        }
        long long v61 = *(_OWORD *)(v32 + 64);
        *((_OWORD *)v31 + 4) = v61;
        (**(void (***)(uint64_t, uint64_t))(v61 - 8))((uint64_t)(v31 + 40), v32 + 40);
        *((void *)v31 + 10) = *(void *)(v32 + 80);
        swift_bridgeObjectRetain();
        break;
      case 6u:
        uint64_t v35 = sub_247CBD248();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v35 - 8) + 16))(a1, a2, v35);
        uint64_t v36 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF80) + 28);
        uint64_t v37 = &a1[v36];
        uint64_t v38 = (uint64_t)a2 + v36;
        uint64_t v39 = *(uint64_t *)((char *)a2 + v36 + 8);
        *(void *)uint64_t v37 = *(char **)((char *)a2 + v36);
        *((void *)v37 + 1) = v39;
        uint64_t v40 = &a1[v36 + 16];
        uint64_t v41 = *(void *)(v38 + 40);
        swift_bridgeObjectRetain();
        if (v41)
        {
          uint64_t v42 = *(void *)(v38 + 48);
          *((void *)v37 + 5) = v41;
          *((void *)v37 + 6) = v42;
          (**(void (***)(uint64_t, uint64_t, uint64_t))(v41 - 8))((uint64_t)(v37 + 16), v38 + 16, v41);
        }
        else
        {
          long long v62 = *(_OWORD *)(v38 + 32);
          *(_OWORD *)uint64_t v40 = *(_OWORD *)(v38 + 16);
          *((_OWORD *)v37 + 2) = v62;
          *((void *)v37 + 6) = *(void *)(v38 + 48);
        }
        long long v63 = *(_OWORD *)(v38 + 80);
        *((_OWORD *)v37 + 5) = v63;
        (**(void (***)(uint64_t, uint64_t))(v63 - 8))((uint64_t)(v37 + 56), v38 + 56);
        uint64_t v64 = *(void **)(v38 + 96);
        uint64_t v65 = *(void *)(v38 + 104);
        *((void *)v37 + 12) = v64;
        *((void *)v37 + 13) = v65;
        *((void *)v37 + 14) = *(void *)(v38 + 112);
        id v66 = v64;
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = a2[3];
        if (v6)
        {
          uint64_t v7 = a2[4];
          *((void *)a1 + 3) = v6;
          *((void *)a1 + 4) = v7;
          (**((void (***)(char *, char **))v6 - 1))(a1, a2);
        }
        else
        {
          long long v43 = *((_OWORD *)a2 + 1);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *((_OWORD *)a1 + 1) = v43;
          *((void *)a1 + 4) = a2[4];
        }
        uint64_t v44 = a1 + 40;
        uint64_t v45 = a2 + 5;
        uint64_t v46 = a2[8];
        if (v46)
        {
          uint64_t v47 = a2[9];
          *((void *)a1 + 8) = v46;
          *((void *)a1 + 9) = v47;
          (**((void (***)(_OWORD *, _OWORD *))v46 - 1))(v44, v45);
        }
        else
        {
          long long v67 = *(_OWORD *)(a2 + 7);
          _OWORD *v44 = *v45;
          *(_OWORD *)(a1 + 56) = v67;
          *((void *)a1 + 9) = a2[9];
        }
        char v68 = a1 + 80;
        char v69 = a2 + 10;
        uint64_t v70 = a2[13];
        if (v70)
        {
          uint64_t v71 = a2[14];
          *((void *)a1 + 13) = v70;
          *((void *)a1 + 14) = v71;
          (**((void (***)(_OWORD *, _OWORD *))v70 - 1))(v68, v69);
        }
        else
        {
          long long v82 = *((_OWORD *)a2 + 6);
          *char v68 = *v69;
          *((_OWORD *)a1 + 6) = v82;
          *((void *)a1 + 14) = a2[14];
        }
        a1[120] = *((unsigned char *)a2 + 120);
        char v83 = a1 + 128;
        char v84 = a2 + 16;
        uint64_t v85 = a2[19];
        if (v85)
        {
          uint64_t v86 = a2[20];
          *((void *)a1 + 19) = v85;
          *((void *)a1 + 20) = v86;
          (**((void (***)(_OWORD *, _OWORD *))v85 - 1))(v83, v84);
        }
        else
        {
          long long v89 = *((_OWORD *)a2 + 9);
          *char v83 = *v84;
          *((_OWORD *)a1 + 9) = v89;
          *((void *)a1 + 20) = a2[20];
        }
        *((void *)a1 + 21) = a2[21];
        uint64_t v90 = a1 + 176;
        int v91 = a2 + 22;
        uint64_t v92 = a2[25];
        if (v92)
        {
          uint64_t v93 = a2[26];
          *((void *)a1 + 25) = v92;
          *((void *)a1 + 26) = v93;
          (**((void (***)(_OWORD *, _OWORD *))v92 - 1))(v90, v91);
        }
        else
        {
          long long v94 = *((_OWORD *)a2 + 12);
          *uint64_t v90 = *v91;
          *((_OWORD *)a1 + 12) = v94;
          *((void *)a1 + 26) = a2[26];
        }
        uint64_t v95 = a2[27];
        uint64_t v96 = a2[28];
        *((void *)a1 + 27) = v95;
        *((void *)a1 + 28) = v96;
        *((void *)a1 + 29) = a2[29];
        uint64_t v97 = v95;
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_247CB74F4(uint64_t a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      if (*(void *)(a1 + 24)) {
        __swift_destroy_boxed_opaque_existential_1(a1);
      }
      if (*(void *)(a1 + 64)) {
        __swift_destroy_boxed_opaque_existential_1(a1 + 40);
      }
      if (*(void *)(a1 + 104)) {
        __swift_destroy_boxed_opaque_existential_1(a1 + 80);
      }
      if (*(void *)(a1 + 152)) {
        __swift_destroy_boxed_opaque_existential_1(a1 + 128);
      }
      if (*(void *)(a1 + 200)) {
        __swift_destroy_boxed_opaque_existential_1(a1 + 176);
      }

      goto LABEL_39;
    case 1u:
      uint64_t v2 = *(void **)a1;

      return;
    case 2u:
      uint64_t v3 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      uint64_t v4 = (void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF50) + 28));
      if (v4[3]) {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
      }
      if (v4[8]) {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)(v4 + 5));
      }
      if (!v4[13]) {
        return;
      }
      uint64_t v5 = (uint64_t)(v4 + 10);
      goto LABEL_29;
    case 3u:
      uint64_t v6 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
      uint64_t v7 = (void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA28) + 28));
      if (v7[3]) {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v7 + 5));
      if (v7[13]) {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)(v7 + 10));
      }
      if (!v7[18]) {
        return;
      }
      uint64_t v5 = (uint64_t)(v7 + 15);
LABEL_29:
      __swift_destroy_boxed_opaque_existential_1(v5);
      break;
    case 4u:
      uint64_t v8 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
      uint64_t v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA38) + 28);
      if (*(void *)(v5 + 24)) {
        goto LABEL_29;
      }
      return;
    case 5u:
      uint64_t v9 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
      uint64_t v10 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692ABF90) + 28);
      if (*(void *)(v10 + 24)) {
        __swift_destroy_boxed_opaque_existential_1(v10);
      }
      __swift_destroy_boxed_opaque_existential_1(v10 + 40);
      goto LABEL_39;
    case 6u:
      uint64_t v11 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
      uint64_t v12 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF80) + 28);
      swift_bridgeObjectRelease();
      if (*(void *)(v12 + 40)) {
        __swift_destroy_boxed_opaque_existential_1(v12 + 16);
      }
      __swift_destroy_boxed_opaque_existential_1(v12 + 56);

LABEL_39:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_247CB7850(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      id v7 = v6;
      break;
    case 2u:
      uint64_t v8 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF50) + 28);
      uint64_t v10 = a1 + v9;
      uint64_t v11 = a2 + v9;
      uint64_t v12 = *(void *)(v11 + 24);
      if (v12)
      {
        uint64_t v13 = *(void *)(v11 + 32);
        *(void *)(v10 + 24) = v12;
        *(void *)(v10 + 32) = v13;
        (**(void (***)(uint64_t, uint64_t))(v12 - 8))(v10, v11);
      }
      else
      {
        long long v45 = *(_OWORD *)(v11 + 16);
        *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
        *(_OWORD *)(v10 + 16) = v45;
        *(void *)(v10 + 32) = *(void *)(v11 + 32);
      }
      uint64_t v46 = (_OWORD *)(v10 + 40);
      uint64_t v47 = (_OWORD *)(v11 + 40);
      uint64_t v48 = *(void *)(v11 + 64);
      if (v48)
      {
        uint64_t v49 = *(void *)(v11 + 72);
        *(void *)(v10 + 64) = v48;
        *(void *)(v10 + 72) = v49;
        (**(void (***)(_OWORD *, _OWORD *))(v48 - 8))(v46, v47);
      }
      else
      {
        long long v69 = *(_OWORD *)(v11 + 56);
        *uint64_t v46 = *v47;
        *(_OWORD *)(v10 + 56) = v69;
        *(void *)(v10 + 72) = *(void *)(v11 + 72);
      }
      uint64_t v70 = (_OWORD *)(v10 + 80);
      uint64_t v71 = (_OWORD *)(v11 + 80);
      uint64_t v72 = *(void *)(v11 + 104);
      if (v72)
      {
        uint64_t v73 = *(void *)(v11 + 112);
        *(void *)(v10 + 104) = v72;
        *(void *)(v10 + 112) = v73;
        (**(void (***)(_OWORD *, _OWORD *))(v72 - 8))(v70, v71);
      }
      else
      {
        long long v84 = *(_OWORD *)(v11 + 96);
        *uint64_t v70 = *v71;
        *(_OWORD *)(v10 + 96) = v84;
        *(void *)(v10 + 112) = *(void *)(v11 + 112);
      }
      *(unsigned char *)(v10 + 120) = *(unsigned char *)(v11 + 120);
      break;
    case 3u:
      uint64_t v14 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
      uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA28) + 28);
      uint64_t v16 = a1 + v15;
      uint64_t v17 = a2 + v15;
      uint64_t v18 = *(void *)(v17 + 24);
      if (v18)
      {
        uint64_t v19 = *(void *)(v17 + 32);
        *(void *)(v16 + 24) = v18;
        *(void *)(v16 + 32) = v19;
        (**(void (***)(uint64_t, uint64_t))(v18 - 8))(v16, v17);
      }
      else
      {
        long long v50 = *(_OWORD *)(v17 + 16);
        *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
        *(_OWORD *)(v16 + 16) = v50;
        *(void *)(v16 + 32) = *(void *)(v17 + 32);
      }
      long long v51 = *(_OWORD *)(v17 + 64);
      *(_OWORD *)(v16 + 64) = v51;
      (**(void (***)(uint64_t, uint64_t))(v51 - 8))(v16 + 40, v17 + 40);
      uint64_t v52 = (_OWORD *)(v16 + 80);
      long long v53 = (_OWORD *)(v17 + 80);
      uint64_t v54 = *(void *)(v17 + 104);
      if (v54)
      {
        uint64_t v55 = *(void *)(v17 + 112);
        *(void *)(v16 + 104) = v54;
        *(void *)(v16 + 112) = v55;
        (**(void (***)(_OWORD *, _OWORD *))(v54 - 8))(v52, v53);
      }
      else
      {
        long long v74 = *(_OWORD *)(v17 + 96);
        _OWORD *v52 = *v53;
        *(_OWORD *)(v16 + 96) = v74;
        *(void *)(v16 + 112) = *(void *)(v17 + 112);
      }
      uint64_t v75 = (_OWORD *)(v16 + 120);
      uint64_t v76 = (_OWORD *)(v17 + 120);
      uint64_t v77 = *(void *)(v17 + 144);
      if (v77)
      {
        uint64_t v78 = *(void *)(v17 + 152);
        *(void *)(v16 + 144) = v77;
        *(void *)(v16 + 152) = v78;
        (**(void (***)(_OWORD *, _OWORD *))(v77 - 8))(v75, v76);
      }
      else
      {
        long long v85 = *(_OWORD *)(v17 + 136);
        *uint64_t v75 = *v76;
        *(_OWORD *)(v16 + 136) = v85;
        *(void *)(v16 + 152) = *(void *)(v17 + 152);
      }
      break;
    case 4u:
      uint64_t v20 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(a1, a2, v20);
      uint64_t v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA38) + 28);
      uint64_t v22 = a1 + v21;
      uint64_t v23 = a2 + v21;
      uint64_t v24 = *(void *)(v23 + 24);
      if (v24)
      {
        uint64_t v25 = *(void *)(v23 + 32);
        *(void *)(v22 + 24) = v24;
        *(void *)(v22 + 32) = v25;
        (**(void (***)(uint64_t, uint64_t))(v24 - 8))(v22, v23);
      }
      else
      {
        long long v56 = *(_OWORD *)(v23 + 16);
        *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
        *(_OWORD *)(v22 + 16) = v56;
        *(void *)(v22 + 32) = *(void *)(v23 + 32);
      }
      *(_WORD *)(v22 + 40) = *(_WORD *)(v23 + 40);
      *(void *)(v22 + 48) = *(void *)(v23 + 48);
      break;
    case 5u:
      uint64_t v26 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(a1, a2, v26);
      uint64_t v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692ABF90) + 28);
      uint64_t v28 = a1 + v27;
      uint64_t v29 = a2 + v27;
      uint64_t v30 = *(void *)(v29 + 24);
      if (v30)
      {
        uint64_t v31 = *(void *)(v29 + 32);
        *(void *)(v28 + 24) = v30;
        *(void *)(v28 + 32) = v31;
        (**(void (***)(uint64_t, uint64_t))(v30 - 8))(v28, v29);
      }
      else
      {
        long long v57 = *(_OWORD *)(v29 + 16);
        *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
        *(_OWORD *)(v28 + 16) = v57;
        *(void *)(v28 + 32) = *(void *)(v29 + 32);
      }
      long long v58 = *(_OWORD *)(v29 + 64);
      *(_OWORD *)(v28 + 64) = v58;
      (**(void (***)(uint64_t, uint64_t))(v58 - 8))(v28 + 40, v29 + 40);
      *(void *)(v28 + 80) = *(void *)(v29 + 80);
      swift_bridgeObjectRetain();
      break;
    case 6u:
      uint64_t v32 = sub_247CBD248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 16))(a1, a2, v32);
      uint64_t v33 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF80) + 28);
      uint64_t v34 = a1 + v33;
      uint64_t v35 = a2 + v33;
      uint64_t v36 = *(void *)(a2 + v33 + 8);
      *(void *)uint64_t v34 = *(void *)(a2 + v33);
      *(void *)(v34 + 8) = v36;
      uint64_t v37 = (_OWORD *)(a1 + v33 + 16);
      uint64_t v38 = *(void *)(v35 + 40);
      swift_bridgeObjectRetain();
      if (v38)
      {
        uint64_t v39 = *(void *)(v35 + 48);
        *(void *)(v34 + 40) = v38;
        *(void *)(v34 + 48) = v39;
        (**(void (***)(uint64_t, uint64_t, uint64_t))(v38 - 8))(v34 + 16, v35 + 16, v38);
      }
      else
      {
        long long v59 = *(_OWORD *)(v35 + 32);
        *uint64_t v37 = *(_OWORD *)(v35 + 16);
        *(_OWORD *)(v34 + 32) = v59;
        *(void *)(v34 + 48) = *(void *)(v35 + 48);
      }
      long long v60 = *(_OWORD *)(v35 + 80);
      *(_OWORD *)(v34 + 80) = v60;
      (**(void (***)(uint64_t, uint64_t))(v60 - 8))(v34 + 56, v35 + 56);
      long long v61 = *(void **)(v35 + 96);
      uint64_t v62 = *(void *)(v35 + 104);
      *(void *)(v34 + 96) = v61;
      *(void *)(v34 + 104) = v62;
      *(void *)(v34 + 112) = *(void *)(v35 + 112);
      id v63 = v61;
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = *(void *)(a2 + 24);
      if (v4)
      {
        uint64_t v5 = *(void *)(a2 + 32);
        *(void *)(a1 + 24) = v4;
        *(void *)(a1 + 32) = v5;
        (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
      }
      else
      {
        long long v40 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v40;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
      }
      uint64_t v41 = (_OWORD *)(a1 + 40);
      uint64_t v42 = (_OWORD *)(a2 + 40);
      uint64_t v43 = *(void *)(a2 + 64);
      if (v43)
      {
        uint64_t v44 = *(void *)(a2 + 72);
        *(void *)(a1 + 64) = v43;
        *(void *)(a1 + 72) = v44;
        (**(void (***)(_OWORD *, _OWORD *))(v43 - 8))(v41, v42);
      }
      else
      {
        long long v64 = *(_OWORD *)(a2 + 56);
        *uint64_t v41 = *v42;
        *(_OWORD *)(a1 + 56) = v64;
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
      }
      uint64_t v65 = (_OWORD *)(a1 + 80);
      id v66 = (_OWORD *)(a2 + 80);
      uint64_t v67 = *(void *)(a2 + 104);
      if (v67)
      {
        uint64_t v68 = *(void *)(a2 + 112);
        *(void *)(a1 + 104) = v67;
        *(void *)(a1 + 112) = v68;
        (**(void (***)(_OWORD *, _OWORD *))(v67 - 8))(v65, v66);
      }
      else
      {
        long long v79 = *(_OWORD *)(a2 + 96);
        *uint64_t v65 = *v66;
        *(_OWORD *)(a1 + 96) = v79;
        *(void *)(a1 + 112) = *(void *)(a2 + 112);
      }
      *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
      uint64_t v80 = (_OWORD *)(a1 + 128);
      uint64_t v81 = (_OWORD *)(a2 + 128);
      uint64_t v82 = *(void *)(a2 + 152);
      if (v82)
      {
        uint64_t v83 = *(void *)(a2 + 160);
        *(void *)(a1 + 152) = v82;
        *(void *)(a1 + 160) = v83;
        (**(void (***)(_OWORD *, _OWORD *))(v82 - 8))(v80, v81);
      }
      else
      {
        long long v86 = *(_OWORD *)(a2 + 144);
        *uint64_t v80 = *v81;
        *(_OWORD *)(a1 + 144) = v86;
        *(void *)(a1 + 160) = *(void *)(a2 + 160);
      }
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      long long v87 = (_OWORD *)(a1 + 176);
      long long v88 = (_OWORD *)(a2 + 176);
      uint64_t v89 = *(void *)(a2 + 200);
      if (v89)
      {
        uint64_t v90 = *(void *)(a2 + 208);
        *(void *)(a1 + 200) = v89;
        *(void *)(a1 + 208) = v90;
        (**(void (***)(_OWORD *, _OWORD *))(v89 - 8))(v87, v88);
      }
      else
      {
        long long v91 = *(_OWORD *)(a2 + 192);
        *long long v87 = *v88;
        *(_OWORD *)(a1 + 192) = v91;
        *(void *)(a1 + 208) = *(void *)(a2 + 208);
      }
      uint64_t v92 = *(void **)(a2 + 216);
      uint64_t v93 = *(void *)(a2 + 224);
      *(void *)(a1 + 216) = v92;
      *(void *)(a1 + 224) = v93;
      *(void *)(a1 + 232) = *(void *)(a2 + 232);
      id v94 = v92;
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_247CB80D0(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    sub_247B9C10C(a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v5 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        id v6 = v5;
        goto LABEL_53;
      case 2u:
        uint64_t v7 = sub_247CBD248();
        (*(void (**)(uint64_t, long long *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF50) + 28);
        uint64_t v9 = a1 + v8;
        uint64_t v10 = (long long *)((char *)a2 + v8);
        uint64_t v11 = *((void *)v10 + 3);
        if (v11)
        {
          *(void *)(v9 + 24) = v11;
          *(void *)(v9 + 32) = *((void *)v10 + 4);
          (**(void (***)(uint64_t, long long *))(v11 - 8))(v9, v10);
        }
        else
        {
          long long v38 = *v10;
          long long v39 = v10[1];
          *(void *)(v9 + 32) = *((void *)v10 + 4);
          *(_OWORD *)uint64_t v9 = v38;
          *(_OWORD *)(v9 + 16) = v39;
        }
        long long v40 = (_OWORD *)(v9 + 40);
        uint64_t v41 = (long long *)((char *)v10 + 40);
        uint64_t v42 = *((void *)v10 + 8);
        if (v42)
        {
          *(void *)(v9 + 64) = v42;
          *(void *)(v9 + 72) = *((void *)v10 + 9);
          (**(void (***)(_OWORD *, long long *))(v42 - 8))(v40, v41);
        }
        else
        {
          long long v63 = *v41;
          long long v64 = *(long long *)((char *)v10 + 56);
          *(void *)(v9 + 72) = *((void *)v10 + 9);
          *long long v40 = v63;
          *(_OWORD *)(v9 + 56) = v64;
        }
        uint64_t v65 = (_OWORD *)(v9 + 80);
        id v66 = v10 + 5;
        uint64_t v67 = *((void *)v10 + 13);
        if (v67)
        {
          *(void *)(v9 + 104) = v67;
          *(void *)(v9 + 112) = *((void *)v10 + 14);
          (**(void (***)(_OWORD *, long long *))(v67 - 8))(v65, v66);
        }
        else
        {
          long long v78 = *v66;
          long long v79 = v10[6];
          *(void *)(v9 + 112) = *((void *)v10 + 14);
          *uint64_t v65 = v78;
          *(_OWORD *)(v9 + 96) = v79;
        }
        *(unsigned char *)(v9 + 120) = *((unsigned char *)v10 + 120);
        goto LABEL_53;
      case 3u:
        uint64_t v12 = sub_247CBD248();
        (*(void (**)(uint64_t, long long *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA28) + 28);
        uint64_t v14 = a1 + v13;
        uint64_t v15 = (long long *)((char *)a2 + v13);
        uint64_t v16 = *((void *)v15 + 3);
        if (v16)
        {
          *(void *)(v14 + 24) = v16;
          *(void *)(v14 + 32) = *((void *)v15 + 4);
          (**(void (***)(uint64_t, long long *))(v16 - 8))(v14, v15);
        }
        else
        {
          long long v43 = *v15;
          long long v44 = v15[1];
          *(void *)(v14 + 32) = *((void *)v15 + 4);
          *(_OWORD *)uint64_t v14 = v43;
          *(_OWORD *)(v14 + 16) = v44;
        }
        uint64_t v45 = *((void *)v15 + 8);
        *(void *)(v14 + 64) = v45;
        *(void *)(v14 + 72) = *((void *)v15 + 9);
        (**(void (***)(uint64_t, uint64_t))(v45 - 8))(v14 + 40, (uint64_t)v15 + 40);
        uint64_t v46 = (_OWORD *)(v14 + 80);
        uint64_t v47 = v15 + 5;
        uint64_t v48 = *((void *)v15 + 13);
        if (v48)
        {
          *(void *)(v14 + 104) = v48;
          *(void *)(v14 + 112) = *((void *)v15 + 14);
          (**(void (***)(_OWORD *, long long *))(v48 - 8))(v46, v47);
        }
        else
        {
          long long v68 = *v47;
          long long v69 = v15[6];
          *(void *)(v14 + 112) = *((void *)v15 + 14);
          *uint64_t v46 = v68;
          *(_OWORD *)(v14 + 96) = v69;
        }
        uint64_t v70 = (_OWORD *)(v14 + 120);
        uint64_t v71 = (long long *)((char *)v15 + 120);
        uint64_t v72 = *((void *)v15 + 18);
        if (v72)
        {
          *(void *)(v14 + 144) = v72;
          *(void *)(v14 + 152) = *((void *)v15 + 19);
          (**(void (***)(_OWORD *, long long *))(v72 - 8))(v70, v71);
        }
        else
        {
          long long v80 = *v71;
          long long v81 = *(long long *)((char *)v15 + 136);
          *(void *)(v14 + 152) = *((void *)v15 + 19);
          *uint64_t v70 = v80;
          *(_OWORD *)(v14 + 136) = v81;
        }
        goto LABEL_53;
      case 4u:
        uint64_t v17 = sub_247CBD248();
        (*(void (**)(uint64_t, long long *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
        uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA38) + 28);
        uint64_t v19 = a1 + v18;
        uint64_t v20 = (long long *)((char *)a2 + v18);
        uint64_t v21 = *((void *)v20 + 3);
        if (v21)
        {
          *(void *)(v19 + 24) = v21;
          *(void *)(v19 + 32) = *((void *)v20 + 4);
          (**(void (***)(uint64_t, long long *))(v21 - 8))(v19, v20);
        }
        else
        {
          long long v49 = *v20;
          long long v50 = v20[1];
          *(void *)(v19 + 32) = *((void *)v20 + 4);
          *(_OWORD *)uint64_t v19 = v49;
          *(_OWORD *)(v19 + 16) = v50;
        }
        *(unsigned char *)(v19 + 40) = *((unsigned char *)v20 + 40);
        *(unsigned char *)(v19 + 41) = *((unsigned char *)v20 + 41);
        *(void *)(v19 + 48) = *((void *)v20 + 6);
        goto LABEL_53;
      case 5u:
        uint64_t v22 = sub_247CBD248();
        (*(void (**)(uint64_t, long long *, uint64_t))(*(void *)(v22 - 8) + 16))(a1, a2, v22);
        uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692ABF90) + 28);
        uint64_t v24 = a1 + v23;
        uint64_t v25 = (long long *)((char *)a2 + v23);
        uint64_t v26 = *((void *)v25 + 3);
        if (v26)
        {
          *(void *)(v24 + 24) = v26;
          *(void *)(v24 + 32) = *((void *)v25 + 4);
          (**(void (***)(uint64_t, long long *))(v26 - 8))(v24, v25);
        }
        else
        {
          long long v51 = *v25;
          long long v52 = v25[1];
          *(void *)(v24 + 32) = *((void *)v25 + 4);
          *(_OWORD *)uint64_t v24 = v51;
          *(_OWORD *)(v24 + 16) = v52;
        }
        uint64_t v53 = *((void *)v25 + 8);
        *(void *)(v24 + 64) = v53;
        *(void *)(v24 + 72) = *((void *)v25 + 9);
        (**(void (***)(uint64_t, uint64_t))(v53 - 8))(v24 + 40, (uint64_t)v25 + 40);
        *(void *)(v24 + 80) = *((void *)v25 + 10);
        goto LABEL_52;
      case 6u:
        uint64_t v27 = sub_247CBD248();
        (*(void (**)(uint64_t, long long *, uint64_t))(*(void *)(v27 - 8) + 16))(a1, a2, v27);
        uint64_t v28 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF80) + 28);
        uint64_t v29 = a1 + v28;
        uint64_t v30 = (uint64_t)a2 + v28;
        *(void *)uint64_t v29 = *(void *)((char *)a2 + v28);
        *(void *)(v29 + 8) = *(void *)((char *)a2 + v28 + 8);
        uint64_t v31 = (_OWORD *)(a1 + v28 + 16);
        uint64_t v32 = *(void *)(v30 + 40);
        swift_bridgeObjectRetain();
        if (v32)
        {
          *(void *)(v29 + 40) = v32;
          *(void *)(v29 + 48) = *(void *)(v30 + 48);
          (**(void (***)(uint64_t, uint64_t, uint64_t))(v32 - 8))(v29 + 16, v30 + 16, v32);
        }
        else
        {
          long long v54 = *(_OWORD *)(v30 + 16);
          long long v55 = *(_OWORD *)(v30 + 32);
          *(void *)(v29 + 48) = *(void *)(v30 + 48);
          _OWORD *v31 = v54;
          *(_OWORD *)(v29 + 32) = v55;
        }
        uint64_t v56 = *(void *)(v30 + 80);
        *(void *)(v29 + 80) = v56;
        *(void *)(v29 + 88) = *(void *)(v30 + 88);
        (**(void (***)(uint64_t, uint64_t))(v56 - 8))(v29 + 56, v30 + 56);
        long long v57 = *(void **)(v30 + 96);
        *(void *)(v29 + 96) = v57;
        *(void *)(v29 + 104) = *(void *)(v30 + 104);
        *(void *)(v29 + 112) = *(void *)(v30 + 112);
        goto LABEL_51;
      default:
        uint64_t v4 = *((void *)a2 + 3);
        if (v4)
        {
          *(void *)(a1 + 24) = v4;
          *(void *)(a1 + 32) = *((void *)a2 + 4);
          (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
        }
        else
        {
          long long v33 = *a2;
          long long v34 = a2[1];
          *(void *)(a1 + 32) = *((void *)a2 + 4);
          *(_OWORD *)a1 = v33;
          *(_OWORD *)(a1 + 16) = v34;
        }
        uint64_t v35 = (_OWORD *)(a1 + 40);
        uint64_t v36 = (long long *)((char *)a2 + 40);
        uint64_t v37 = *((void *)a2 + 8);
        if (v37)
        {
          *(void *)(a1 + 64) = v37;
          *(void *)(a1 + 72) = *((void *)a2 + 9);
          (**(void (***)(_OWORD *, long long *))(v37 - 8))(v35, v36);
        }
        else
        {
          long long v58 = *v36;
          long long v59 = *(long long *)((char *)a2 + 56);
          *(void *)(a1 + 72) = *((void *)a2 + 9);
          _OWORD *v35 = v58;
          *(_OWORD *)(a1 + 56) = v59;
        }
        long long v60 = (_OWORD *)(a1 + 80);
        long long v61 = a2 + 5;
        uint64_t v62 = *((void *)a2 + 13);
        if (v62)
        {
          *(void *)(a1 + 104) = v62;
          *(void *)(a1 + 112) = *((void *)a2 + 14);
          (**(void (***)(_OWORD *, long long *))(v62 - 8))(v60, v61);
        }
        else
        {
          long long v73 = *v61;
          long long v74 = a2[6];
          *(void *)(a1 + 112) = *((void *)a2 + 14);
          *long long v60 = v73;
          *(_OWORD *)(a1 + 96) = v74;
        }
        *(unsigned char *)(a1 + 120) = *((unsigned char *)a2 + 120);
        uint64_t v75 = (_OWORD *)(a1 + 128);
        uint64_t v76 = a2 + 8;
        uint64_t v77 = *((void *)a2 + 19);
        if (v77)
        {
          *(void *)(a1 + 152) = v77;
          *(void *)(a1 + 160) = *((void *)a2 + 20);
          (**(void (***)(_OWORD *, long long *))(v77 - 8))(v75, v76);
        }
        else
        {
          long long v82 = *v76;
          long long v83 = a2[9];
          *(void *)(a1 + 160) = *((void *)a2 + 20);
          *uint64_t v75 = v82;
          *(_OWORD *)(a1 + 144) = v83;
        }
        *(void *)(a1 + 168) = *((void *)a2 + 21);
        long long v84 = (_OWORD *)(a1 + 176);
        long long v85 = a2 + 11;
        uint64_t v86 = *((void *)a2 + 25);
        if (v86)
        {
          *(void *)(a1 + 200) = v86;
          *(void *)(a1 + 208) = *((void *)a2 + 26);
          (**(void (***)(_OWORD *, long long *))(v86 - 8))(v84, v85);
        }
        else
        {
          long long v87 = *v85;
          long long v88 = a2[12];
          *(void *)(a1 + 208) = *((void *)a2 + 26);
          *long long v84 = v87;
          *(_OWORD *)(a1 + 192) = v88;
        }
        long long v57 = (void *)*((void *)a2 + 27);
        *(void *)(a1 + 216) = v57;
        *(void *)(a1 + 224) = *((void *)a2 + 28);
        *(void *)(a1 + 232) = *((void *)a2 + 29);
LABEL_51:
        id v89 = v57;
LABEL_52:
        swift_bridgeObjectRetain();
LABEL_53:
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
  return a1;
}

uint64_t type metadata accessor for AppIntentsProtocol.PerformAction.Response(uint64_t a1)
{
  return sub_247B89100(a1, (uint64_t *)&unk_2692AE7B0);
}

char *sub_247CB8990(char *a1, char *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      uint64_t v6 = sub_247CBD248();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF50);
      memcpy(&a1[*(int *)(v7 + 28)], &a2[*(int *)(v7 + 28)], 0x79uLL);
      goto LABEL_8;
    case 3u:
      uint64_t v8 = sub_247CBD248();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA28);
      memcpy(&a1[*(int *)(v9 + 28)], &a2[*(int *)(v9 + 28)], 0xA0uLL);
      goto LABEL_8;
    case 4u:
      uint64_t v10 = sub_247CBD248();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
      uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA38) + 28);
      uint64_t v12 = &a1[v11];
      uint64_t v13 = &a2[v11];
      long long v14 = *((_OWORD *)v13 + 1);
      *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
      *((_OWORD *)v12 + 1) = v14;
      *((_OWORD *)v12 + 2) = *((_OWORD *)v13 + 2);
      *((void *)v12 + 6) = *((void *)v13 + 6);
      goto LABEL_8;
    case 5u:
      uint64_t v15 = sub_247CBD248();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692ABF90);
      memcpy(&a1[*(int *)(v16 + 28)], &a2[*(int *)(v16 + 28)], 0x58uLL);
      goto LABEL_8;
    case 6u:
      uint64_t v17 = sub_247CBD248();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(a1, a2, v17);
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF80);
      memcpy(&a1[*(int *)(v18 + 28)], &a2[*(int *)(v18 + 28)], 0x78uLL);
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

char *sub_247CB8C60(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_247B9C10C((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
        uint64_t v6 = sub_247CBD248();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF50);
        memcpy(&a1[*(int *)(v7 + 28)], &a2[*(int *)(v7 + 28)], 0x79uLL);
        goto LABEL_9;
      case 3u:
        uint64_t v8 = sub_247CBD248();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA28);
        memcpy(&a1[*(int *)(v9 + 28)], &a2[*(int *)(v9 + 28)], 0xA0uLL);
        goto LABEL_9;
      case 4u:
        uint64_t v10 = sub_247CBD248();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
        uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA38) + 28);
        uint64_t v12 = &a1[v11];
        uint64_t v13 = &a2[v11];
        long long v14 = *((_OWORD *)v13 + 1);
        *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
        *((_OWORD *)v12 + 1) = v14;
        *((_OWORD *)v12 + 2) = *((_OWORD *)v13 + 2);
        *((void *)v12 + 6) = *((void *)v13 + 6);
        goto LABEL_9;
      case 5u:
        uint64_t v15 = sub_247CBD248();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692ABF90);
        memcpy(&a1[*(int *)(v16 + 28)], &a2[*(int *)(v16 + 28)], 0x58uLL);
        goto LABEL_9;
      case 6u:
        uint64_t v17 = sub_247CBD248();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(a1, a2, v17);
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692ABF80);
        memcpy(&a1[*(int *)(v18 + 28)], &a2[*(int *)(v18 + 28)], 0x78uLL);
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void sub_247CB8F40()
{
  sub_247CB9138(319, &qword_2692AE7C0);
  if (v0 <= 0x3F)
  {
    sub_247CB9138(319, &qword_2692AE7C8);
    if (v1 <= 0x3F)
    {
      sub_247CB9138(319, &qword_2692AE7D0);
      if (v2 <= 0x3F)
      {
        sub_247CB9138(319, &qword_2692AE7D8);
        if (v3 <= 0x3F)
        {
          sub_247CB9138(319, qword_2692AE7E0);
          if (v4 <= 0x3F) {
            swift_initEnumMetadataMultiPayload();
          }
        }
      }
    }
  }
}

uint64_t type metadata accessor for AppIntentsProtocol.PerformAction.ExecutionIdentifiable()
{
  return __swift_instantiateGenericMetadata();
}

void sub_247CB9138(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for AppIntentsProtocol.PerformAction.ExecutionIdentifiable();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_247CB9180(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);

  return swift_bridgeObjectRelease();
}

uint64_t sub_247CB91DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  uint64_t v6 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v7 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v7;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8))(a1 + 16, v5, v6);
  }
  else
  {
    long long v8 = *(_OWORD *)(v5 + 16);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
    *(_OWORD *)(a1 + 32) = v8;
    *(void *)(a1 + 48) = *(void *)(v5 + 32);
  }
  long long v9 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 56, a2 + 56);
  uint64_t v10 = *(void **)(a2 + 96);
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = v10;
  *(void *)(a1 + 104) = v11;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  id v12 = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247CB92D8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v4)
    {
      *(void *)(a1 + 40) = v4;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 16);
    long long v6 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 32) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  uint64_t v7 = *(void **)(a2 + 96);
  long long v8 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = v7;
  id v9 = v7;

  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t sub_247CB93F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v6 = *(void *)(a2 + 96);
  uint64_t v7 = *(void **)(a1 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;

  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247CB9490(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 120))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CB94D0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.PerformAction.NeedsValueRequest()
{
}

void type metadata accessor for AppIntentsProtocol.PerformAction.DisambiguationRequest()
{
}

uint64_t sub_247CB9544()
{
  uint64_t result = sub_247CBD248();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_247CB9610(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v7 + 64) + v10;
  int v13 = *(_DWORD *)(v7 + 80) | v10;
  uint64_t v14 = v13;
  int v15 = v13 & 0x100000;
  if (v14 > 7
    || v15 != 0
    || (v12 & (unint64_t)~v11) + *(void *)(*(void *)(v8 - 8) + 64) > 0x18)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  else
  {
    uint64_t v19 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v12) & v19, ((unint64_t)a2 + v12) & v19, v8);
  }
  return a1;
}

uint64_t sub_247CB9774(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247CBD248();
  uint64_t v5 = *(void *)(v4 - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v5)(a1, v4);
  uint64_t v6 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t))(v6 + 8);
  unint64_t v8 = (*(void *)(v5 + 56) + a1 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  return v7(v8);
}

uint64_t sub_247CB9824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  uint64_t v7 = *(void *)(v6 - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 16))((*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_247CB98DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  uint64_t v7 = *(void *)(v6 - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))((*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_247CB9994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  uint64_t v7 = *(void *)(v6 - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))((*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_247CB9A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  uint64_t v7 = *(void *)(v6 - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 40))((*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_247CB9B04(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = sub_247CBD248();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  uint64_t v10 = *(unsigned int *)(v8 + 84);
  if (v10 <= v9) {
    unsigned int v11 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = *(void *)(v8 + 64);
  if (!a2) {
    return 0;
  }
  uint64_t v14 = v6;
  uint64_t v15 = *(void *)(*(void *)(v6 - 8) + 64) + v12;
  if (a2 <= v11) {
    goto LABEL_24;
  }
  uint64_t v16 = (v15 & ~v12) + v13;
  char v17 = 8 * v16;
  if (v16 <= 3)
  {
    unsigned int v19 = ((a2 - v11 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      int v18 = *(_DWORD *)((char *)a1 + v16);
      if (!v18) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v19 > 0xFF)
    {
      int v18 = *(unsigned __int16 *)((char *)a1 + v16);
      if (!*(unsigned __int16 *)((char *)a1 + v16)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v19 < 2)
    {
LABEL_24:
      if (v11)
      {
        if (v9 >= v10)
        {
          uint64_t v23 = (uint64_t)a1;
          uint64_t v7 = v14;
        }
        else
        {
          uint64_t v23 = ((unint64_t)a1 + v15) & ~v12;
          uint64_t v9 = v10;
        }
        return __swift_getEnumTagSinglePayload(v23, v9, v7);
      }
      return 0;
    }
  }
  int v18 = *((unsigned __int8 *)a1 + v16);
  if (!*((unsigned char *)a1 + v16)) {
    goto LABEL_24;
  }
LABEL_14:
  int v20 = (v18 - 1) << v17;
  if (v16 > 3) {
    int v20 = 0;
  }
  if (v16)
  {
    if (v16 <= 3) {
      int v21 = v16;
    }
    else {
      int v21 = 4;
    }
    switch(v21)
    {
      case 2:
        int v22 = *a1;
        break;
      case 3:
        int v22 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)a1;
        break;
      default:
        int v22 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  return v11 + (v22 | v20) + 1;
}

void sub_247CB9D2C(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = sub_247CBD248();
  uint64_t v9 = *(unsigned int *)(*(void *)(v8 - 8) + 84);
  uint64_t v10 = *(void *)(a4 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  if (v12 <= v9) {
    unsigned int v13 = *(_DWORD *)(*(void *)(v8 - 8) + 84);
  }
  else {
    unsigned int v13 = *(_DWORD *)(v11 + 84);
  }
  uint64_t v14 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = *(void *)(*(void *)(v8 - 8) + 64) + v14;
  size_t v16 = (v15 & ~v14) + *(void *)(v11 + 64);
  char v17 = 8 * v16;
  if (a3 <= v13)
  {
    int v18 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v21 = ((a3 - v13 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v21))
    {
      int v18 = 4;
    }
    else if (v21 >= 0x100)
    {
      int v18 = 2;
    }
    else
    {
      int v18 = v21 > 1;
    }
  }
  else
  {
    int v18 = 1;
  }
  if (v13 < a2)
  {
    unsigned int v19 = ~v13 + a2;
    if (v16 < 4)
    {
      int v20 = (v19 >> v17) + 1;
      if (v16)
      {
        int v22 = v19 & ~(-1 << v17);
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v22;
          a1[2] = BYTE2(v22);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v22;
        }
        else
        {
          *a1 = v22;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v19;
      int v20 = 1;
    }
    switch(v18)
    {
      case 1:
        a1[v16] = v20;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v20;
        return;
      case 3:
        goto LABEL_40;
      case 4:
        *(_DWORD *)&a1[v16] = v20;
        return;
      default:
        return;
    }
  }
  switch(v18)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_40:
      __break(1u);
      JUMPOUT(0x247CB9FCCLL);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v9 >= v12)
        {
          uint64_t v23 = (uint64_t)a1;
          uint64_t v24 = a2;
          uint64_t v10 = v8;
        }
        else
        {
          uint64_t v23 = (unint64_t)&a1[v15] & ~v14;
          uint64_t v24 = a2;
          uint64_t v9 = v12;
        }
        __swift_storeEnumTagSinglePayload(v23, v24, v9, v10);
      }
      return;
  }
}

void type metadata accessor for AppIntentsProtocol()
{
}

void type metadata accessor for AppIntentsProtocol.PerformAction()
{
}

uint64_t sub_247CBA00C(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CBA05C(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  *(_WORD *)(a1 + 96) = *(_WORD *)(a2 + 96);
  *(unsigned char *)(a1 + 98) = *(unsigned char *)(a2 + 98);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_WORD *)(a1 + 128) = *(_WORD *)(a2 + 128);
  *(unsigned char *)(a1 + 130) = *(unsigned char *)(a2 + 130);
  *(unsigned char *)(a1 + 131) = *(unsigned char *)(a2 + 131);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  uint64_t v7 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v7;
  uint64_t v8 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v8;
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(unsigned char *)(a1 + 185) = *(unsigned char *)(a2 + 185);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247CBA19C(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __int16 v4 = *(_WORD *)(a2 + 96);
  *(unsigned char *)(a1 + 98) = *(unsigned char *)(a2 + 98);
  *(_WORD *)(a1 + 96) = v4;
  uint64_t v5 = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 104) = v5;
  uint64_t v6 = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = v6;
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  *(unsigned char *)(a1 + 130) = *(unsigned char *)(a2 + 130);
  *(unsigned char *)(a1 + 131) = *(unsigned char *)(a2 + 131);
  uint64_t v7 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v7;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(unsigned char *)(a1 + 185) = *(unsigned char *)(a2 + 185);
  return a1;
}

void *__swift_memcpy186_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xBAuLL);
}

uint64_t sub_247CBA2AC(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 96) = *(_WORD *)(a2 + 96);
  *(unsigned char *)(a1 + 98) = *(unsigned char *)(a2 + 98);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  uint64_t v5 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(unsigned char *)(a1 + 185) = *(unsigned char *)(a2 + 185);
  return a1;
}

uint64_t sub_247CBA388(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 186))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CBA3C8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
    *(_WORD *)(result + 184) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 186) = 1;
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
    *(unsigned char *)(result + 186) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.PerformAction.Request()
{
}

uint64_t sub_247CBA444(int a1, id a2)
{
  unsigned int v3 = a1 & 0x10000;
  if ((a1 & 0x10000) == 0) {
    objc_msgSend(a2, sel_setSource_, (unsigned __int16)a1);
  }

  return HIWORD(v3);
}

uint64_t sub_247CBA498(uint64_t a1, char a2, id a3)
{
  uint64_t v4 = a2 & 1;
  if ((a2 & 1) == 0) {
    objc_msgSend(a3, sel_setKind_, a1);
  }

  return v4;
}

uint64_t sub_247CBA4EC(uint64_t a1, char a2, id a3)
{
  uint64_t v4 = a2 & 1;
  if ((a2 & 1) == 0) {
    objc_msgSend(a3, sel_setInteractionMode_, a1);
  }

  return v4;
}

BOOL sub_247CBA540(unsigned __int8 a1, id a2, uint64_t a3, SEL *a4)
{
  int v5 = a1;
  if (a1 != 2) {
    objc_msgSend(a2, *a4, a1 & 1);
  }

  return v5 == 2;
}

uint64_t sub_247CBA59C(uint64_t a1, char a2, id a3)
{
  uint64_t v4 = a2 & 1;
  if ((a2 & 1) == 0) {
    objc_msgSend(a3, sel_setConnectionOperationTimeout_, *(double *)&a1);
  }

  return v4;
}

uint64_t sub_247CBA5F0(uint64_t a1, char a2)
{
  return sub_247CBA658(a1, a2, &qword_2692AA3B8, (void (*)(unsigned char *, unsigned char *))sub_247AD94B8, (uint64_t (*)(unsigned char *, void))sub_247AD7628);
}

uint64_t sub_247CBA624(uint64_t a1, char a2)
{
  return sub_247CBA658(a1, a2, (uint64_t *)&unk_2692ABF30, (void (*)(unsigned char *, unsigned char *))sub_247AD94B8, (uint64_t (*)(unsigned char *, void))sub_247AD74D0);
}

uint64_t sub_247CBA658(uint64_t a1, char a2, uint64_t *a3, void (*a4)(unsigned char *, unsigned char *), uint64_t (*a5)(unsigned char *, void))
{
  sub_247ACB718(a1, (uint64_t)v11, a3);
  if (!v12) {
    return 7104878;
  }
  a4(v11, v10);
  uint64_t v8 = a5(v10, a2 & 1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

uint64_t sub_247CBA6EC(uint64_t a1, char a2)
{
  sub_247ACB718(a1, (uint64_t)&v9, &qword_2692AA9D0);
  if (!*((void *)&v10 + 1)) {
    return 7104878;
  }
  v7[0] = v9;
  v7[1] = v10;
  uint64_t v8 = v11;
  v6[3] = &type metadata for AppIntentSpecification;
  v6[4] = sub_247B5DEF4();
  v6[0] = swift_allocObject();
  sub_247B56E64((uint64_t)v7, v6[0] + 16);
  __swift_project_boxed_opaque_existential_1(v6, (uint64_t)&type metadata for AppIntentSpecification);
  char v5 = a2 & 1;
  uint64_t v3 = sub_247C8261C(&v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  sub_247AC7860((uint64_t)v7);
  return v3;
}

uint64_t sub_247CBA7D0(uint64_t a1, char a2)
{
  return sub_247CBA658(a1, a2, (uint64_t *)&unk_2692ABF40, (void (*)(unsigned char *, unsigned char *))sub_247AD94B8, (uint64_t (*)(unsigned char *, void))sub_247AD74BC);
}

uint64_t sub_247CBA804(char a1)
{
  uint64_t v2 = v1;
  char v3 = a1 & 1;
  sub_247CBE638();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA30);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692AE8A0);
  sub_247CBDDE8();
  OUTLINED_FUNCTION_32_4();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  uint64_t v4 = *(void **)(v1 + 216);
  if (v4)
  {
    id v5 = v4;
    sub_247AD763C(v5, v3);
  }
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  sub_247CBA658(v2, v3, &qword_2692AA3B8, (void (*)(unsigned char *, unsigned char *))sub_247AD94B8, (uint64_t (*)(unsigned char *, void))sub_247AD7628);
  OUTLINED_FUNCTION_32_4();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  sub_247CBA658(v2 + 40, v3, (uint64_t *)&unk_2692ABF30, (void (*)(unsigned char *, unsigned char *))sub_247AD94B8, (uint64_t (*)(unsigned char *, void))sub_247AD74D0);
  OUTLINED_FUNCTION_32_4();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  sub_247CBA6EC(v2 + 80, v3);
  OUTLINED_FUNCTION_32_4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31_5();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31_5();
  sub_247CBA6EC(v2 + 128, v3);
  OUTLINED_FUNCTION_32_4();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  type metadata accessor for LNShowOutputActionOptions(0);
  sub_247CBE7E8();
  sub_247CBDE68();
  sub_247CBA658(v2 + 176, v3, (uint64_t *)&unk_2692ABF40, (void (*)(unsigned char *, unsigned char *))sub_247AD94B8, (uint64_t (*)(unsigned char *, void))sub_247AD74BC);
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27_0();
  return 0;
}

id sub_247CBAB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)v2;
  uint64_t v3 = *(void *)(v2 + 8);
  int v5 = *(unsigned __int16 *)(v2 + 16);
  int v6 = *(unsigned __int8 *)(v2 + 18);
  uint64_t v7 = *(void *)(v2 + 24);
  char v8 = *(unsigned char *)(v2 + 32);
  char v9 = *(unsigned char *)(v2 + 48);
  char v30 = *(unsigned char *)(v2 + 49);
  unsigned __int8 v24 = *(unsigned char *)(v2 + 50);
  unsigned __int8 v25 = *(unsigned char *)(v2 + 51);
  uint64_t v27 = *(void *)(v2 + 56);
  char v26 = *(unsigned char *)(v2 + 64);
  uint64_t v10 = *(void *)(v2 + 96);
  uint64_t v22 = *(void *)(v2 + 88);
  uint64_t v23 = *(void *)(v2 + 40);
  unsigned __int8 v28 = *(unsigned char *)(v2 + 104);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F51EB8]), sel_init);
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_247C6CB58(v4, v3, v11);
    swift_bridgeObjectRelease();
  }
  id v12 = v11;
  sub_247CBA444(v5 | (v6 << 16), v12);
  id v13 = v12;
  sub_247CBA498(v7, v8, v13);
  id v14 = v13;
  sub_247CBA4EC(v23, v9, v14);
  id v15 = v14;
  sub_247CBA540(v24, v15, (uint64_t)v34, (SEL *)&selRef_setRequestUnlockIfNeeded_);
  id v16 = v15;
  sub_247CBA540(v25, v16, (uint64_t)v33, (SEL *)&selRef_setAllowsPrepareBeforePerform_);
  id v17 = v16;
  sub_247CBA59C(v27, v26, v17);
  if (v10)
  {
    sub_247ADF128(0, &qword_2692AABE0);
    swift_bridgeObjectRetain_n();
    int v18 = (void *)sub_247CBE2C8();
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F52058]), sel_initWithContentType_preferredExtractionType_, v18, 1);

    objc_msgSend(v17, sel_setExportedContentConfiguration_, v19);
    swift_bridgeObjectRelease();
  }
  id v20 = v17;
  sub_247CBA540(v28, v20, (uint64_t)v32, (SEL *)&selRef_setConvertArrayResultToAsyncSequence_);
  if (a1) {
    objc_msgSend(v20, sel_setEnvironment_);
  }
  if (a2) {
    objc_msgSend(v20, sel_setSystemContext_);
  }
  objc_msgSend(v20, sel_setDonateToTranscript_, v30 & 1, v22);
  return v20;
}

void *sub_247CBADC8()
{
  uint64_t v1 = *(void **)(v0 + 80);
  id v2 = v1;
  return v1;
}

uint64_t sub_247CBADF0(unsigned char *a1, uint64_t a2, void *a3, unint64_t a4)
{
  if (*a1 == 1)
  {
    if (a4 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_247CBE848();
      swift_bridgeObjectRelease();
    }
    sub_247CBE958();
    OUTLINED_FUNCTION_32_4();
    swift_bridgeObjectRelease();
    sub_247CBDE68();
  }
  else
  {
    uint64_t v5 = sub_247ADF128(0, (unint64_t *)&qword_2692A9F98);
    uint64_t v6 = swift_bridgeObjectRetain();
    MEMORY[0x24C567420](v6, v5);
    swift_bridgeObjectRelease();
  }
  sub_247CBE638();
  sub_247CBDE68();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  id v7 = a3;
  id v8 = objc_msgSend(v7, sel_description);
  sub_247CBDD98();

  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27_0();
  return 0;
}

uint64_t sub_247CBB038(unsigned char *a1)
{
  return sub_247CBADF0(a1, *v1, *((void **)v1 + 1), *((void *)v1 + 2));
}

uint64_t sub_247CBB044()
{
  return sub_247B8C5E8();
}

uint64_t sub_247CBB050(char *a1)
{
  uint64_t v2 = v1;
  char v3 = *a1;
  unint64_t v21 = 0xE000000000000000;
  sub_247CBE638();
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  OUTLINED_FUNCTION_43_2();
  sub_247CBDE68();
  unsigned __int8 v24 = &type metadata for AppIntentSpecification;
  unint64_t v25 = sub_247B5DEF4();
  uint64_t v20 = swift_allocObject();
  sub_247B56E64(v1, v20 + 16);
  __swift_project_boxed_opaque_existential_1(&v20, (uint64_t)&type metadata for AppIntentSpecification);
  char v37 = v3;
  sub_247C8261C(&v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_23();
  unint64_t v4 = *(void *)(v1 + 88);
  __int16 v5 = *(_WORD *)(v2 + 96);
  char v6 = *(unsigned char *)(v2 + 98);
  id v7 = *(ValueMetadata **)(v2 + 104);
  char v8 = *(unsigned char *)(v2 + 112);
  uint64_t v9 = *(void *)(v2 + 120);
  char v10 = *(unsigned char *)(v2 + 128);
  __int16 v11 = *(_WORD *)(v2 + 129);
  char v12 = *(unsigned char *)(v2 + 131);
  uint64_t v13 = *(void *)(v2 + 136);
  char v14 = *(unsigned char *)(v2 + 144);
  uint64_t v15 = *(void *)(v2 + 152);
  uint64_t v16 = *(void *)(v2 + 176);
  char v17 = *(unsigned char *)(v2 + 184);
  char v18 = *(unsigned char *)(v2 + 185);
  uint64_t v20 = *(void *)(v2 + 80);
  unint64_t v21 = v4;
  __int16 v22 = v5;
  char v23 = v6;
  unsigned __int8 v24 = v7;
  LOBYTE(v25) = v8;
  uint64_t v26 = v9;
  char v27 = v10;
  __int16 v28 = v11;
  char v29 = v12;
  uint64_t v30 = v13;
  char v31 = v14;
  uint64_t v32 = v15;
  long long v33 = *(_OWORD *)(v2 + 160);
  uint64_t v34 = v16;
  char v35 = v17;
  char v36 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_247CBDDE8();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  sub_247ADF5B4(v2 + 40, (uint64_t)&v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AE890);
  sub_247CBDDE8();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27_0();
  return v38;
}

uint64_t sub_247CBB260(char *a1)
{
  uint64_t v2 = v1;
  type metadata accessor for AppIntentsProtocol.PerformAction.Response(0);
  OUTLINED_FUNCTION_20();
  MEMORY[0x270FA5388](v4);
  char v6 = (id *)((char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v7 = *a1;
  sub_247B9C0A8(v2, (uint64_t)v6);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:

      uint64_t v9 = 0x726F7272652ELL;
      break;
    case 2u:
      sub_247B9C10C((uint64_t)v6);
      OUTLINED_FUNCTION_23_13();
      uint64_t v9 = v10 + 7;
      break;
    case 3u:
      sub_247B9C10C((uint64_t)v6);
      OUTLINED_FUNCTION_23_13();
      uint64_t v9 = v11 + 1;
      break;
    case 4u:
      sub_247B9C10C((uint64_t)v6);
      OUTLINED_FUNCTION_23_13();
      uint64_t v9 = v12 | 2;
      break;
    case 5u:
      sub_247B9C10C((uint64_t)v6);
      OUTLINED_FUNCTION_23_13();
      uint64_t v9 = v13 + 3;
      break;
    case 6u:
      sub_247B9C10C((uint64_t)v6);
      uint64_t v9 = 0x6156736465656E2ELL;
      break;
    default:
      memcpy(v22, v6, sizeof(v22));
      uint64_t v16 = 0;
      unint64_t v17 = 0xE000000000000000;
      sub_247CBE638();
      uint64_t v20 = v16;
      unint64_t v21 = v17;
      OUTLINED_FUNCTION_43_2();
      sub_247CBDE68();
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692AAA30);
      uint64_t v18 = v8;
      unint64_t v19 = sub_247CBBB74();
      uint64_t v16 = swift_allocObject();
      sub_247ACB718((uint64_t)v22, v16 + 16, &qword_2692AAA30);
      __swift_project_boxed_opaque_existential_1(&v16, v8);
      sub_247CBA804(v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
      sub_247CBDE68();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_43_2();
      sub_247CBDE68();
      sub_247CBDE68();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_27_0();
      uint64_t v9 = v20;
      sub_247ACB4EC((uint64_t)v22, &qword_2692AAA30);
      break;
  }
  return v9;
}

uint64_t sub_247CBB540(char *a1)
{
  uint64_t v2 = v1;
  char v3 = *a1;
  uint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_247CBE638();
  uint64_t v15 = 0;
  unint64_t v16 = 0xE000000000000000;
  OUTLINED_FUNCTION_43_2();
  sub_247CBDE68();
  unint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v10 = *v2;
  unint64_t v11 = v4;
  if (v5 == 2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    v9[0] = 32;
    v9[1] = 0xE100000000000000;
    swift_bridgeObjectRetain();
    sub_247AD8F24(v6, v5);
    sub_247CBDDE8();
    sub_247CBDE68();
    swift_bridgeObjectRelease();
    sub_247CBDE68();
    swift_bridgeObjectRelease();
  }
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_23();
  uint64_t v7 = v2[8];
  unint64_t v11 = v2[7];
  uint64_t v12 = v7;
  swift_bridgeObjectRetain();
  sub_247CBDDE8();
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  uint64_t v13 = &unk_26FBFD070;
  unint64_t v14 = sub_247BE4748();
  uint64_t v10 = swift_allocObject();
  sub_247B0B49C((uint64_t)(v2 + 10), v10 + 16);
  __swift_project_boxed_opaque_existential_1(&v10, (uint64_t)&unk_26FBFD070);
  LOBYTE(v9[0]) = v3;
  sub_247BE1EA4((char *)v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27_0();
  return v15;
}

uint64_t sub_247CBB738(char *a1)
{
  if (*(unsigned char *)(v1 + 32)) {
    return 0x726F7272652ELL;
  }
  unint64_t v4 = *(void **)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 8);
  char v6 = *a1;
  id v7 = *(id *)v1;
  sub_247ADF524(v5, v4);
  sub_247CBE638();
  swift_bridgeObjectRelease();
  uint64_t v10 = 0x737365636375732ELL;
  unint64_t v11 = 0xE900000000000028;
  sub_247AD7770(v7, v6);
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  sub_247CBDE68();
  if (v4)
  {
    char v9 = v6;
    id v8 = v4;
    swift_bridgeObjectRetain();
    sub_247CBADF0(&v9, v5 & 1, v8, v3);
    swift_bridgeObjectRelease();
  }
  sub_247CBDE68();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27_0();
  sub_247ADF3E8(v5, v4);

  return v10;
}

uint64_t sub_247CBB8BC()
{
  sub_247ADF428(v0, (uint64_t)v2);
  return sub_247B8C660();
}

unint64_t sub_247CBB8F4(uint64_t a1)
{
  unint64_t result = sub_247CBB91C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247CBB91C()
{
  unint64_t result = qword_2692AE868;
  if (!qword_2692AE868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE868);
  }
  return result;
}

unint64_t sub_247CBB968(uint64_t a1)
{
  unint64_t result = sub_247CBB990();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247CBB990()
{
  unint64_t result = qword_2692AE870;
  if (!qword_2692AE870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE870);
  }
  return result;
}

unint64_t sub_247CBB9DC(uint64_t a1)
{
  unint64_t result = sub_247CBBA04();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247CBBA04()
{
  unint64_t result = qword_2692AE878;
  if (!qword_2692AE878)
  {
    type metadata accessor for AppIntentsProtocol.PerformAction.Response(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE878);
  }
  return result;
}

unint64_t sub_247CBBA54(uint64_t a1)
{
  unint64_t result = sub_247CBBA7C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247CBBA7C()
{
  unint64_t result = qword_2692AE880;
  if (!qword_2692AE880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE880);
  }
  return result;
}

unint64_t sub_247CBBAC8(uint64_t a1)
{
  unint64_t result = sub_247CBBAF0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247CBBAF0()
{
  unint64_t result = qword_2692AE888;
  if (!qword_2692AE888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE888);
  }
  return result;
}

uint64_t sub_247CBBB3C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

unint64_t sub_247CBBB74()
{
  unint64_t result = qword_2692AE898;
  if (!qword_2692AE898)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692AAA30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692AE898);
  }
  return result;
}

uint64_t sub_247CBBBC8()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  if (*(void *)(v0 + 80)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  }
  if (*(void *)(v0 + 120)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  }
  if (*(void *)(v0 + 168)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  }
  if (*(void *)(v0 + 216)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 192);
  }

  return MEMORY[0x270FA0238](v0, 240, 7);
}

uint64_t sub_247CBBC50()
{
  switch(*(unsigned char *)(v0 + 128))
  {
    case 0:
    case 1:
    case 5:
    case 6:
      goto LABEL_5;
    case 2:
    case 4:
      goto LABEL_3;
    case 3:
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v0 + 96))
      {
LABEL_3:
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      }
LABEL_5:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  return MEMORY[0x270FA0238](v0, 129, 7);
}

uint64_t sub_247CBBD34(uint64_t a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CBBD70(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  unint64_t v3 = *(void **)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247CBBDB0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247CBBE14(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for AppIntentsProtocol.AsyncSequenceElementPage()
{
}

uint64_t sub_247CBBE68(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247CBBEA8(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t sub_247CBBF08(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t sub_247CBBF50(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CBBFA4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.PerformQuery.Request.Options()
{
}

uint64_t sub_247CBC008(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

void sub_247CBC040(id *a1)
{
}

uint64_t sub_247CBC048(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t sub_247CBC088(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

void type metadata accessor for AppIntentsProtocol.PerformAction.NeedsValueResponse.Value()
{
}

uint64_t sub_247CBC0D0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_247B9C72C(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void sub_247CBC118(uint64_t a1)
{
}

uint64_t sub_247CBC128(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_247B9C72C(*(id *)a2, v4);
  id v5 = *(void **)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_247B0B108(v5, v6);
  return a1;
}

uint64_t sub_247CBC17C(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_247B0B108(v4, v5);
  return a1;
}

uint64_t sub_247CBC1BC(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CBC1FC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_247CBC240(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_247CBC248(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

void type metadata accessor for AppIntentsProtocol.PerformAction.DisambiguationResponse.Value()
{
}

void **sub_247CBC25C(void **a1, void **a2)
{
  unsigned int v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void **sub_247CBC28C(void **a1, void **a2)
{
  unsigned int v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void **sub_247CBC2C4(void **a1, void **a2)
{
  unsigned int v3 = *a1;
  *a1 = *a2;

  return a1;
}

void type metadata accessor for AppIntentsProtocol.PerformAction.ContinueInAppResponse.Value()
{
}

uint64_t *sub_247CBC304(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_247CBC3C0(a1, a2, a3, (void (*)(void, void))sub_247CBCC34, (void (*)(uint64_t, uint64_t))sub_247B0C32C);
}

void type metadata accessor for AppIntentsProtocol.PerformAction.ConfirmationResponse.Value()
{
}

uint64_t sub_247CBC33C(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_247B9C798(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void sub_247CBC384(uint64_t a1)
{
}

uint64_t *sub_247CBC394(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_247CBC3C0(a1, a2, a3, (void (*)(void, void))sub_247B9C798, (void (*)(uint64_t, uint64_t))sub_247B0B058);
}

uint64_t *sub_247CBC3C0(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, void), void (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  unsigned __int8 v8 = *((unsigned char *)a2 + 8);
  a4(*a2, v8);
  uint64_t v9 = *a1;
  uint64_t v10 = *((unsigned __int8 *)a1 + 8);
  *a1 = v7;
  *((unsigned char *)a1 + 8) = v8;
  a5(v9, v10);
  return a1;
}

uint64_t sub_247CBC420(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  id v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_247B0B058(v5, v6);
  return a1;
}

uint64_t sub_247CBC460(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CBC4A0(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_247CBC4E4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

void type metadata accessor for AppIntentsProtocol.PerformAction.ActionConfirmationResponse.Value()
{
}

void sub_247CBC4FC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  int v2 = *(void **)(a1 + 80);
}

uint64_t sub_247CBC558(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = a2[4];
  char v6 = a2 + 5;
  uint64_t v7 = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = v8;
    (**(void (***)(uint64_t, void *, uint64_t))(v7 - 8))(a1 + 40, v6, v7);
  }
  else
  {
    long long v9 = *((_OWORD *)v6 + 1);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v6;
    *(_OWORD *)(a1 + 56) = v9;
    *(void *)(a1 + 72) = v6[4];
  }
  uint64_t v10 = (void *)a2[10];
  uint64_t v11 = a2[11];
  *(void *)(a1 + 80) = v10;
  *(void *)(a1 + 88) = v11;
  id v12 = v10;
  return a1;
}

uint64_t sub_247CBC630(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 64);
  if (!*(void *)(a1 + 64))
  {
    if (v4)
    {
      *(void *)(a1 + 64) = v4;
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 40, a2 + 40);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 40);
    long long v6 = *(_OWORD *)(a2 + 56);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(_OWORD *)(a1 + 40) = v5;
    *(_OWORD *)(a1 + 56) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
LABEL_8:
  uint64_t v7 = *(void **)(a1 + 80);
  uint64_t v8 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v8;
  id v9 = v8;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t sub_247CBC760(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  long long v6 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v8 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v7;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t sub_247CBC7FC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 96))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CBC83C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.PerformAction.DisambiguationRequest.ProvidedValue()
{
}

uint64_t sub_247CBC8A0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CBC8E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  *(unsigned char *)(a1 + 51) = *(unsigned char *)(a2 + 51);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v4;
  uint64_t v5 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v5;
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247CBC99C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __int16 v4 = *(_WORD *)(a2 + 16);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(_WORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  *(unsigned char *)(a1 + 51) = *(unsigned char *)(a2 + 51);
  uint64_t v7 = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  return a1;
}

void *__swift_memcpy106_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x6AuLL);
}

uint64_t sub_247CBCA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  return a1;
}

uint64_t sub_247CBCB44(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 106))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247CBCB98(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 104) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 106) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 106) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for AppIntentsProtocol.PerformAction.Request.Options()
{
}

uint64_t OUTLINED_FUNCTION_3_31()
{
  return sub_247CBD248();
}

uint64_t OUTLINED_FUNCTION_6_23()
{
  return sub_247CBDE68();
}

uint64_t OUTLINED_FUNCTION_7_14@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  int v1 = a1 - 1;
  if (v1 < 0) {
    int v1 = -1;
  }
  return (v1 + 1);
}

uint64_t OUTLINED_FUNCTION_9_20()
{
  return sub_247CBD248();
}

uint64_t OUTLINED_FUNCTION_13_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_18@<X0>(uint64_t a1@<X8>)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_15_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_17()
{
  return v0 + *(int *)(v1 + 20);
}

uint64_t OUTLINED_FUNCTION_19_17()
{
  return sub_247CBD248();
}

void OUTLINED_FUNCTION_21_15()
{
  *(unsigned char *)(v1 + *(int *)(v2 + 20) + 8) = -v0;
}

uint64_t sub_247CBCD90(uint64_t a1)
{
  return sub_247CBCF28(a1, qword_2692C8340);
}

uint64_t sub_247CBCDBC(uint64_t a1)
{
  return sub_247CBCF28(a1, qword_2692C8358);
}

uint64_t sub_247CBCDD8(uint64_t a1)
{
  return sub_247CBCF28(a1, qword_2692C8370);
}

uint64_t sub_247CBCDF8(uint64_t a1)
{
  return sub_247CBCF28(a1, qword_2692C8388);
}

uint64_t sub_247CBCE24(uint64_t a1)
{
  return sub_247CBCF28(a1, qword_2692C83A0);
}

uint64_t sub_247CBCE48(uint64_t a1)
{
  return sub_247CBCF28(a1, qword_26B136FB8);
}

uint64_t sub_247CBCE74(uint64_t a1)
{
  return sub_247CBCF28(a1, qword_2692C83B8);
}

uint64_t sub_247CBCE9C(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_30(a1, qword_2692C83D0);
}

uint64_t sub_247CBCEC4(uint64_t a1)
{
  return sub_247CBCF28(a1, qword_2692C83E8);
}

uint64_t sub_247CBCEE8(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_30(a1, qword_2692C8400);
}

uint64_t sub_247CBCF10(uint64_t a1)
{
  return sub_247CBCF28(a1, qword_2692C8418);
}

uint64_t sub_247CBCF28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_247CBD878();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_247CBD868();
}

uint64_t OUTLINED_FUNCTION_0_30(uint64_t a1, uint64_t *a2)
{
  return sub_247CBCF28(a1, a2);
}

uint64_t sub_247CBCFA8()
{
  return MEMORY[0x270EEE068]();
}

uint64_t sub_247CBCFB8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_247CBCFC8()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_247CBCFD8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_247CBCFE8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_247CBCFF8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_247CBD008()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_247CBD018()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_247CBD028()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_247CBD038()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_247CBD048()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_247CBD058()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_247CBD068()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_247CBD078()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_247CBD088()
{
  return MEMORY[0x270EEFE08]();
}

uint64_t sub_247CBD098()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_247CBD0A8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_247CBD0B8()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t sub_247CBD0C8()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_247CBD0D8()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_247CBD0E8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_247CBD0F8()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_247CBD108()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_247CBD128()
{
  return MEMORY[0x270EF00E8]();
}

uint64_t sub_247CBD138()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_247CBD148()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_247CBD158()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_247CBD168()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_247CBD178()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_247CBD188()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_247CBD198()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_247CBD1A8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_247CBD1B8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_247CBD1C8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_247CBD1D8()
{
  return MEMORY[0x270EF0C70]();
}

uint64_t sub_247CBD1E8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_247CBD1F8()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_247CBD208()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_247CBD218()
{
  return MEMORY[0x270EF0CC8]();
}

uint64_t sub_247CBD228()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_247CBD238()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_247CBD248()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_247CBD268()
{
  return MEMORY[0x270EF1218]();
}

uint64_t sub_247CBD278()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_247CBD288()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_247CBD298()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_247CBD2A8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_247CBD2B8()
{
  return MEMORY[0x270FA0FC0]();
}

uint64_t sub_247CBD2C8()
{
  return MEMORY[0x270FA0FC8]();
}

uint64_t sub_247CBD2D8()
{
  return MEMORY[0x270FA0FD0]();
}

uint64_t sub_247CBD2E8()
{
  return MEMORY[0x270FA0FD8]();
}

uint64_t sub_247CBD2F8()
{
  return MEMORY[0x270FA0FE0]();
}

uint64_t sub_247CBD308()
{
  return MEMORY[0x270EF7090]();
}

uint64_t sub_247CBD318()
{
  return MEMORY[0x270EF7098]();
}

uint64_t sub_247CBD328()
{
  return MEMORY[0x270FA0FE8]();
}

uint64_t sub_247CBD348()
{
  return MEMORY[0x270FA0FF8]();
}

uint64_t sub_247CBD358()
{
  return MEMORY[0x270FA1000]();
}

uint64_t sub_247CBD368()
{
  return MEMORY[0x270FA1008]();
}

uint64_t sub_247CBD378()
{
  return MEMORY[0x270FA1010]();
}

uint64_t sub_247CBD388()
{
  return MEMORY[0x270FA1018]();
}

uint64_t sub_247CBD398()
{
  return MEMORY[0x270FA1020]();
}

uint64_t sub_247CBD3A8()
{
  return MEMORY[0x270FA1028]();
}

uint64_t sub_247CBD3B8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_247CBD3C8()
{
  return MEMORY[0x270FA14F8]();
}

uint64_t sub_247CBD3D8()
{
  return MEMORY[0x270FA1500]();
}

uint64_t sub_247CBD3E8()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_247CBD3F8()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_247CBD408()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_247CBD418()
{
  return MEMORY[0x270F44A70]();
}

uint64_t sub_247CBD428()
{
  return MEMORY[0x270F44A78]();
}

uint64_t sub_247CBD438()
{
  return MEMORY[0x270F44A80]();
}

uint64_t sub_247CBD448()
{
  return MEMORY[0x270F44A90]();
}

uint64_t sub_247CBD458()
{
  return MEMORY[0x270F44A98]();
}

uint64_t sub_247CBD468()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_247CBD478()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_247CBD488()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_247CBD4B8()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_247CBD4C8()
{
  return MEMORY[0x270F44B20]();
}

uint64_t sub_247CBD4D8()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_247CBD4E8()
{
  return MEMORY[0x270F44B40]();
}

uint64_t sub_247CBD4F8()
{
  return MEMORY[0x270F44B48]();
}

uint64_t sub_247CBD508()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_247CBD518()
{
  return MEMORY[0x270F44B78]();
}

uint64_t sub_247CBD528()
{
  return MEMORY[0x270F44B80]();
}

uint64_t sub_247CBD538()
{
  return MEMORY[0x270F44BA8]();
}

uint64_t sub_247CBD548()
{
  return MEMORY[0x270F44BB0]();
}

uint64_t sub_247CBD558()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_247CBD568()
{
  return MEMORY[0x270F44BD8]();
}

uint64_t sub_247CBD578()
{
  return MEMORY[0x270F44BE8]();
}

uint64_t sub_247CBD588()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_247CBD598()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_247CBD5A8()
{
  return MEMORY[0x270F44C10]();
}

uint64_t sub_247CBD5C8()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_247CBD5D8()
{
  return MEMORY[0x270F44C30]();
}

uint64_t sub_247CBD5E8()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_247CBD5F8()
{
  return MEMORY[0x270F44C70]();
}

uint64_t sub_247CBD608()
{
  return MEMORY[0x270F44C78]();
}

uint64_t sub_247CBD618()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_247CBD628()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_247CBD638()
{
  return MEMORY[0x270F44CB8]();
}

uint64_t sub_247CBD658()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_247CBD668()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_247CBD678()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_247CBD688()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_247CBD698()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_247CBD6A8()
{
  return MEMORY[0x270F44DA0]();
}

uint64_t sub_247CBD6B8()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_247CBD6C8()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_247CBD6D8()
{
  return MEMORY[0x270F44DD0]();
}

uint64_t sub_247CBD6E8()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_247CBD6F8()
{
  return MEMORY[0x270F44DE8]();
}

uint64_t sub_247CBD728()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_247CBD738()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_247CBD748()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_247CBD758()
{
  return MEMORY[0x270F44E20]();
}

uint64_t sub_247CBD768()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_247CBD778()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_247CBD788()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_247CBD798()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_247CBD7A8()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_247CBD7B8()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_247CBD7C8()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_247CBD7D8()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_247CBD7E8()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_247CBD7F8()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_247CBD808()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_247CBD818()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_247CBD828()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_247CBD838()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_247CBD848()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_247CBD858()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247CBD868()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247CBD878()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247CBD888()
{
  return MEMORY[0x270EF70A8]();
}

uint64_t sub_247CBD898()
{
  return MEMORY[0x270EF70B0]();
}

uint64_t sub_247CBD8A8()
{
  return MEMORY[0x270EF70B8]();
}

uint64_t sub_247CBD8B8()
{
  return MEMORY[0x270EF70D0]();
}

uint64_t sub_247CBD8C8()
{
  return MEMORY[0x270EF70D8]();
}

uint64_t sub_247CBD8D8()
{
  return MEMORY[0x270EF70E0]();
}

uint64_t sub_247CBD8E8()
{
  return MEMORY[0x270EF70E8]();
}

uint64_t sub_247CBD8F8()
{
  return MEMORY[0x270EF70F0]();
}

uint64_t sub_247CBD908()
{
  return MEMORY[0x270EF70F8]();
}

uint64_t sub_247CBD918()
{
  return MEMORY[0x270EF7108]();
}

uint64_t sub_247CBD928()
{
  return MEMORY[0x270EF7170]();
}

uint64_t sub_247CBD938()
{
  return MEMORY[0x270EF7178]();
}

uint64_t sub_247CBD948()
{
  return MEMORY[0x270EF7180]();
}

uint64_t sub_247CBD958()
{
  return MEMORY[0x270EF7188]();
}

uint64_t sub_247CBD968()
{
  return MEMORY[0x270EF71E0]();
}

uint64_t sub_247CBD978()
{
  return MEMORY[0x270EF71F8]();
}

uint64_t sub_247CBD988()
{
  return MEMORY[0x270EF7258]();
}

uint64_t sub_247CBD998()
{
  return MEMORY[0x270EF72A0]();
}

uint64_t sub_247CBD9A8()
{
  return MEMORY[0x270EF72B0]();
}

uint64_t sub_247CBD9B8()
{
  return MEMORY[0x270EF72B8]();
}

uint64_t sub_247CBD9C8()
{
  return MEMORY[0x270EF72C0]();
}

uint64_t sub_247CBD9D8()
{
  return MEMORY[0x270EF72D8]();
}

uint64_t sub_247CBD9E8()
{
  return MEMORY[0x270EF7510]();
}

uint64_t sub_247CBD9F8()
{
  return MEMORY[0x270EF7518]();
}

uint64_t sub_247CBDA28()
{
  return MEMORY[0x270EF7530]();
}

uint64_t sub_247CBDA38()
{
  return MEMORY[0x270EF7538]();
}

uint64_t sub_247CBDA48()
{
  return MEMORY[0x270EF7540]();
}

uint64_t sub_247CBDA58()
{
  return MEMORY[0x270EF7548]();
}

uint64_t sub_247CBDA78()
{
  return MEMORY[0x270EF7558]();
}

uint64_t sub_247CBDA88()
{
  return MEMORY[0x270EF7560]();
}

uint64_t sub_247CBDA98()
{
  return MEMORY[0x270EF7568]();
}

uint64_t sub_247CBDAA8()
{
  return MEMORY[0x270EF7678]();
}

uint64_t sub_247CBDAB8()
{
  return MEMORY[0x270EF7680]();
}

uint64_t sub_247CBDAC8()
{
  return MEMORY[0x270EF7688]();
}

uint64_t sub_247CBDAD8()
{
  return MEMORY[0x270EF7708]();
}

uint64_t sub_247CBDAE8()
{
  return MEMORY[0x270EF7730]();
}

uint64_t sub_247CBDAF8()
{
  return MEMORY[0x270EF7738]();
}

uint64_t sub_247CBDB08()
{
  return MEMORY[0x270EF7740]();
}

uint64_t sub_247CBDB18()
{
  return MEMORY[0x270EF7748]();
}

uint64_t sub_247CBDB28()
{
  return MEMORY[0x270EF7750]();
}

uint64_t sub_247CBDB38()
{
  return MEMORY[0x270EF7758]();
}

uint64_t sub_247CBDB48()
{
  return MEMORY[0x270EF77E0]();
}

uint64_t sub_247CBDB68()
{
  return MEMORY[0x270EF77F0]();
}

uint64_t sub_247CBDB78()
{
  return MEMORY[0x270EF7838]();
}

uint64_t sub_247CBDB88()
{
  return MEMORY[0x270EF7840]();
}

uint64_t sub_247CBDB98()
{
  return MEMORY[0x270EF7848]();
}

uint64_t sub_247CBDBA8()
{
  return MEMORY[0x270EF7850]();
}

uint64_t sub_247CBDBB8()
{
  return MEMORY[0x270EF7858]();
}

uint64_t sub_247CBDBC8()
{
  return MEMORY[0x270EF7860]();
}

uint64_t sub_247CBDBD8()
{
  return MEMORY[0x270EF7868]();
}

uint64_t sub_247CBDBE8()
{
  return MEMORY[0x270EF7870]();
}

uint64_t sub_247CBDBF8()
{
  return MEMORY[0x270EF7878]();
}

uint64_t sub_247CBDC08()
{
  return MEMORY[0x270EF78A0]();
}

uint64_t sub_247CBDC18()
{
  return MEMORY[0x270EF78B0]();
}

uint64_t sub_247CBDC28()
{
  return MEMORY[0x270EF78B8]();
}

uint64_t sub_247CBDC38()
{
  return MEMORY[0x270EF78C0]();
}

uint64_t sub_247CBDC48()
{
  return MEMORY[0x270FA0998]();
}

uint64_t sub_247CBDC58()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_247CBDC68()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_247CBDC78()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_247CBDC88()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_247CBDC98()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_247CBDCA8()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_247CBDCB8()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_247CBDCC8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_247CBDCD8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_247CBDCE8()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_247CBDCF8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_247CBDD08()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_247CBDD18()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_247CBDD28()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_247CBDD38()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_247CBDD48()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247CBDD58()
{
  return MEMORY[0x270EF18A8]();
}

uint64_t sub_247CBDD68()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247CBDD78()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_247CBDD88()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_247CBDD98()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247CBDDA8()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_247CBDDB8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_247CBDDC8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_247CBDDD8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_247CBDDE8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_247CBDDF8()
{
  return MEMORY[0x270F9D5E8]();
}

uint64_t sub_247CBDE08()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_247CBDE18()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_247CBDE28()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_247CBDE38()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247CBDE48()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_247CBDE58()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_247CBDE68()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247CBDE78()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247CBDE88()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_247CBDE98()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_247CBDEB8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_247CBDEC8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_247CBDED8()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_247CBDEE8()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_247CBDEF8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_247CBDF08()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_247CBDF18()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_247CBDF28()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_247CBDF38()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_247CBDF48()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_247CBDF58()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_247CBDF68()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_247CBDF78()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_247CBDF88()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_247CBDF98()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_247CBDFA8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_247CBDFB8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_247CBDFC8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_247CBDFD8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_247CBDFE8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_247CBDFF8()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_247CBE008()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_247CBE018()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_247CBE028()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_247CBE038()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_247CBE048()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_247CBE058()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_247CBE068()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_247CBE078()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_247CBE088()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_247CBE098()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_247CBE0A8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_247CBE0B8()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_247CBE0C8()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_247CBE0D8()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_247CBE0E8()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_247CBE108()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_247CBE128()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_247CBE138()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_247CBE148()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t sub_247CBE158()
{
  return MEMORY[0x270FA20B8]();
}

uint64_t sub_247CBE168()
{
  return MEMORY[0x270FA20C8]();
}

uint64_t sub_247CBE178()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_247CBE188()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_247CBE198()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t sub_247CBE1A8()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_247CBE1C8()
{
  return MEMORY[0x270FA2108]();
}

uint64_t sub_247CBE1D8()
{
  return MEMORY[0x270FA2118]();
}

uint64_t sub_247CBE1E8()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_247CBE1F8()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_247CBE208()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_247CBE218()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_247CBE228()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t sub_247CBE238()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_247CBE248()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_247CBE258()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_247CBE268()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_247CBE278()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_247CBE288()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_247CBE298()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_247CBE2A8()
{
  return MEMORY[0x270EF1E30]();
}

uint64_t sub_247CBE2B8()
{
  return MEMORY[0x270EF1E60]();
}

uint64_t sub_247CBE2C8()
{
  return MEMORY[0x270F47588]();
}

uint64_t sub_247CBE2D8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_247CBE2E8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_247CBE2F8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247CBE308()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_247CBE318()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_247CBE328()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_247CBE338()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_247CBE348()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_247CBE358()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_247CBE368()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_247CBE378()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_247CBE388()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_247CBE398()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_247CBE3A8()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_247CBE3B8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_247CBE3C8()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_247CBE3D8()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_247CBE3E8()
{
  return MEMORY[0x270F475C0]();
}

uint64_t sub_247CBE3F8()
{
  return MEMORY[0x270F475C8]();
}

uint64_t sub_247CBE408()
{
  return MEMORY[0x270F475D0]();
}

uint64_t sub_247CBE418()
{
  return MEMORY[0x270F47620]();
}

uint64_t sub_247CBE428()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_247CBE438()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_247CBE448()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_247CBE458()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_247CBE468()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_247CBE478()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_247CBE488()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247CBE498()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247CBE4A8()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_247CBE4C8()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_247CBE4D8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_247CBE4F8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_247CBE508()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_247CBE518()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_247CBE528()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_247CBE538()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_247CBE548()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_247CBE558()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_247CBE568()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_247CBE578()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_247CBE588()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_247CBE598()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_247CBE5A8()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_247CBE5B8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_247CBE5C8()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_247CBE5D8()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_247CBE5E8()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_247CBE5F8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_247CBE608()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_247CBE618()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_247CBE628()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_247CBE638()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_247CBE648()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247CBE658()
{
  return MEMORY[0x270F9E9C8]();
}

uint64_t sub_247CBE668()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_247CBE678()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_247CBE688()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_247CBE698()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_247CBE6A8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_247CBE6B8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247CBE6C8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_247CBE6D8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_247CBE6E8()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_247CBE6F8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_247CBE708()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_247CBE718()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_247CBE728()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_247CBE738()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_247CBE748()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_247CBE758()
{
  return MEMORY[0x270FA2168]();
}

uint64_t sub_247CBE768()
{
  return MEMORY[0x270FA2198]();
}

uint64_t sub_247CBE778()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_247CBE788()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_247CBE798()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_247CBE7A8()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_247CBE7B8()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_247CBE7C8()
{
  return MEMORY[0x270F9ED48]();
}

uint64_t sub_247CBE7D8()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_247CBE7E8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_247CBE7F8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_247CBE808()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_247CBE818()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_247CBE828()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247CBE838()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_247CBE848()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_247CBE858()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247CBE868()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247CBE878()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247CBE888()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_247CBE8A8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_247CBE8C8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_247CBE8D8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_247CBE8E8()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_247CBE8F8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_247CBE908()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_247CBE928()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_247CBE938()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_247CBE948()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_247CBE958()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_247CBE978()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_247CBE988()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_247CBE998()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247CBE9A8()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_247CBE9B8()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_247CBE9D8()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_247CBE9E8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_247CBE9F8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_247CBEA08()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_247CBEA48()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_247CBEA58()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_247CBEA68()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_247CBEA78()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_247CBEA88()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_247CBEA98()
{
  return MEMORY[0x270EF26D8]();
}

uint64_t sub_247CBEAA8()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_247CBEAB8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_247CBEAC8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247CBEAD8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247CBEAE8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_247CBEAF8()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_247CBEB08()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_247CBEB18()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247CBEB28()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_247CBEB38()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_247CBEB48()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_247CBEB58()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_247CBEB68()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_247CBEB78()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247CBEB88()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_247CBEB98()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_247CBEBA8()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_247CBEBB8()
{
  return MEMORY[0x270F9FFA8]();
}

uint64_t sub_247CBEBC8()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_247CBEBF8()
{
  return MEMORY[0x270FA23A8]();
}

uint64_t sub_247CBEC08()
{
  return MEMORY[0x270FA23B8]();
}

uint64_t sub_247CBEC28()
{
  return MEMORY[0x270FA0128]();
}

uint64_t DRTailspinRequest()
{
  return MEMORY[0x270F26088]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x270F55168]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x270F55170]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x270ED90F8]();
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

nw_browse_descriptor_t nw_browse_descriptor_create_application_service(const char *application_service_name)
{
  return (nw_browse_descriptor_t)MEMORY[0x270EF7AA0](application_service_name);
}

uint64_t nw_browse_descriptor_set_browse_scope()
{
  return MEMORY[0x270EF7AB0]();
}

nw_parameters_t nw_parameters_create_application_service(void)
{
  return (nw_parameters_t)MEMORY[0x270EF8528]();
}

uint64_t nw_parameters_set_application_id()
{
  return MEMORY[0x270EF85F8]();
}

uint64_t nw_parameters_set_companion_proxy_required_interface_type()
{
  return MEMORY[0x270EF8608]();
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x270EF8728]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_conformsToProtocol()
{
  return MEMORY[0x270FA0210]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_distributedActor_remote_initialize()
{
  return MEMORY[0x270FA2430]();
}

uint64_t swift_distributed_actor_is_remote()
{
  return MEMORY[0x270FA2438]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_task_localValuePop()
{
  return MEMORY[0x270FA2480]();
}

uint64_t swift_task_localValuePush()
{
  return MEMORY[0x270FA2488]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}