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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t initializeBufferWithCopyOfBuffer for ButtonModel(uint64_t *a1, uint64_t *a2)
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

uint64_t getEnumTagSinglePayload for Color(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Color(uint64_t result, int a2, int a3)
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

void type metadata accessor for State(uint64_t a1)
{
}

void type metadata accessor for WFStaccatoActionSectionIdentifier(uint64_t a1)
{
}

void type metadata accessor for ABDeviceSceneParameter(uint64_t a1)
{
}

void sub_2473CC310()
{
  qword_26924CD30 = 0xC014000000000000;
}

void sub_2473CC320()
{
  qword_26924CD38 = 0x4014000000000000;
}

void sub_2473CC330()
{
  qword_26924CD40 = 0x4020000000000000;
}

void sub_2473CC340()
{
  qword_26924CD48 = 0x4030000000000000;
}

uint64_t sub_2473CC350(uint64_t a1, uint64_t a2)
{
  return sub_2473CC664(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2473CC37C(uint64_t a1, id *a2)
{
  uint64_t result = sub_24740DCD0();
  *a2 = 0;
  return result;
}

uint64_t sub_2473CC3F4(uint64_t a1, id *a2)
{
  char v3 = sub_24740DCE0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2473CC474@<X0>(uint64_t *a1@<X8>)
{
  sub_24740DCF0();
  uint64_t v2 = sub_24740DCC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_2473CC4B8(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_2473CC4C0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_2473CC4D4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_2473CC4E8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_2473CC4FC(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_2473CC52C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2473CC558@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_2473CC57C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_2473CC590(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_2473CC5A4(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_2473CC5B8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2473CC5CC(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_2473CC5E0(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_2473CC5F4(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_2473CC608()
{
  return *v0 == 0;
}

uint64_t sub_2473CC618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_2473CC630(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_2473CC64C(uint64_t a1, uint64_t a2)
{
  return sub_2473CC664(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2473CC664(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24740DCF0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2473CC6A8()
{
  sub_24740DCF0();
  sub_24740DD10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473CC6FC()
{
  sub_24740DCF0();
  sub_24740E630();
  sub_24740DD10();
  uint64_t v0 = sub_24740E650();
  swift_bridgeObjectRelease();
  return v0;
}

void *sub_2473CC770@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2473CC780(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_2473CC78C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2473CC7A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_2473CD1B8(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_2473CC7E0()
{
  uint64_t v0 = sub_24740DCF0();
  uint64_t v2 = v1;
  if (v0 == sub_24740DCF0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24740E5A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_2473CC86C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2473CC878(uint64_t a1)
{
  uint64_t v2 = sub_2473CCBB0((unint64_t *)&qword_26B12BB58, type metadata accessor for WFStaccatoActionSectionIdentifier);
  uint64_t v3 = sub_2473CCBB0((unint64_t *)&unk_26924BB90, type metadata accessor for WFStaccatoActionSectionIdentifier);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2473CC934@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24740DCF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2473CC960(uint64_t a1)
{
  uint64_t v2 = sub_2473CCBB0((unint64_t *)&qword_26924BBE0, type metadata accessor for Key);
  uint64_t v3 = sub_2473CCBB0(&qword_26924BBE8, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2473CCA1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24740DCC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2473CCA64(uint64_t a1)
{
  uint64_t v2 = sub_2473CCBB0(&qword_26924BE90, type metadata accessor for ABDeviceSceneParameter);
  uint64_t v3 = sub_2473CCBB0(&qword_26924BBA0, type metadata accessor for ABDeviceSceneParameter);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2473CCB20()
{
  return sub_2473CCBB0(&qword_26924BB38, type metadata accessor for ABDeviceSceneParameter);
}

uint64_t sub_2473CCB68()
{
  return sub_2473CCBB0(&qword_26924BB40, type metadata accessor for ABDeviceSceneParameter);
}

uint64_t sub_2473CCBB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2473CCBF8()
{
  return sub_2473CCBB0(&qword_26924BB48, type metadata accessor for WFStaccatoActionSectionIdentifier);
}

uint64_t sub_2473CCC40()
{
  return sub_2473CCBB0((unint64_t *)&unk_26924BB50, type metadata accessor for WFStaccatoActionSectionIdentifier);
}

uint64_t sub_2473CCC88()
{
  return sub_2473CCBB0(&qword_26B12BB68, type metadata accessor for WFStaccatoActionSectionIdentifier);
}

uint64_t sub_2473CCCD0()
{
  return sub_2473CCBB0(&qword_26924BB60, type metadata accessor for State);
}

uint64_t sub_2473CCD18()
{
  return sub_2473CCBB0(&qword_26924BB68, type metadata accessor for State);
}

uint64_t sub_2473CCD60()
{
  return sub_2473CCBB0(&qword_26924BB70, type metadata accessor for State);
}

uint64_t sub_2473CCDA8()
{
  return sub_2473CCBB0(&qword_26924BB78, type metadata accessor for State);
}

uint64_t sub_2473CCDF0()
{
  return sub_2473CCBB0((unint64_t *)&unk_26924BB80, type metadata accessor for ABDeviceSceneParameter);
}

id sub_2473CCE38(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_traitCollectionWithPreferredContentSizeCategory_, *MEMORY[0x263F83468]);
  id v3 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_, a1, v2);
  uint64_t v4 = self;
  objc_msgSend(v3, sel_pointSize);
  id v5 = objc_msgSend(v4, sel_systemFontOfSize_weight_);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82770]), sel_initForTextStyle_, a1);
  id v7 = objc_msgSend(v6, sel_scaledFontForFont_, v5);

  return v7;
}

id sub_2473CCF64()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  id v1 = objc_msgSend(self, sel_whiteColor);
  objc_msgSend(v0, sel_setTextColor_, v1);

  id v2 = sub_2473CCE38(*MEMORY[0x263F83610]);
  objc_msgSend(v0, sel_setFont_, v2);

  objc_msgSend(v0, sel_setNumberOfLines_, 2);
  objc_msgSend(v0, sel_setLineBreakMode_, 4);
  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v0, sel_setAdjustsFontSizeToFitWidth_, 1);
  objc_msgSend(v0, sel_setMinimumScaleFactor_, 0.95);
  return v0;
}

id sub_2473CD090()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 1.0, 0.6);
  objc_msgSend(v0, sel_setTextColor_, v1);

  id v2 = sub_2473CCE38(*MEMORY[0x263F835F0]);
  objc_msgSend(v0, sel_setFont_, v2);

  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  id v3 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v3, sel_setCompositingFilter_, *MEMORY[0x263F15D58]);

  return v0;
}

uint64_t sub_2473CD1B8(uint64_t a1)
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

void type metadata accessor for Key(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2473CD210(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2473CD230(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for CHSControlType(uint64_t a1)
{
}

void sub_2473CD294(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2473CD2DC()
{
  return sub_2473CCBB0(&qword_26924BBC8, type metadata accessor for Key);
}

uint64_t sub_2473CD324()
{
  return sub_2473CCBB0(&qword_26924BBD0, type metadata accessor for Key);
}

uint64_t sub_2473CD36C()
{
  return sub_2473CCBB0(&qword_26924BBD8, type metadata accessor for Key);
}

id sub_2473CD414()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FindClass()
{
  return self;
}

id sub_2473CD470()
{
  type metadata accessor for FindClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26924CD50 = (uint64_t)result;
  return result;
}

BOOL sub_2473CD4C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2473CD4DC()
{
  return sub_24740E650();
}

uint64_t sub_2473CD524()
{
  return sub_24740E640();
}

uint64_t sub_2473CD550()
{
  return sub_24740E650();
}

void sub_2473CD5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  uint64_t v5 = qword_26B12B950;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24740D560();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B12B938);
  id v7 = sub_24740D540();
  os_log_type_t v8 = sub_24740DEB0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2473C9000, v7, v8, "Fetching actions...", v9, 2u);
    MEMORY[0x24C5554B0](v9, -1, -1);
  }

  id v10 = objc_msgSend(self, sel_standardClient);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_2473CE0B4;
  *(void *)(v11 + 24) = v4;
  v13[4] = sub_2473CF39C;
  v13[5] = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_2473CDCD4;
  v13[3] = &block_descriptor_18;
  v12 = _Block_copy(v13);
  swift_release();
  objc_msgSend(v10, sel_fetchAvailableStaccatoActions_, v12);
  _Block_release(v12);
}

void sub_2473CD788(uint64_t a1, void *a2, void (*a3)(unint64_t, uint64_t))
{
  if (a1)
  {
    uint64_t v4 = swift_bridgeObjectRetain();
    unint64_t v5 = sub_2473CDB64(v4);
    swift_bridgeObjectRelease();
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24740D560();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B12B938);
    swift_bridgeObjectRetain_n();
    id v7 = sub_24740D540();
    os_log_type_t v8 = sub_24740DEB0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v9 = 134217984;
      if (v5 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24740E4A0();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24740E220();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2473C9000, v7, v8, "Successfully fetched %ld actions", v9, 0xCu);
      MEMORY[0x24C5554B0](v9, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    a3(v5, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24740D560();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B12B938);
    id v12 = a2;
    id v13 = a2;
    v14 = sub_24740D540();
    os_log_type_t v15 = sub_24740DEB0();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = (void *)swift_slowAlloc();
      *(_DWORD *)v16 = 138412290;
      if (a2)
      {
        id v18 = a2;
        uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
        sub_24740E220();
      }
      else
      {
        sub_24740E220();
        uint64_t v19 = 0;
      }
      void *v17 = v19;

      _os_log_impl(&dword_2473C9000, v14, v15, "Failed to fetch actions: %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v17, -1, -1);
      MEMORY[0x24C5554B0](v16, -1, -1);
    }
    else
    {
    }
    v20 = a2;
    if (!a2)
    {
      sub_2473CF1F4();
      v20 = (void *)swift_allocError();
      unsigned char *v21 = 0;
    }
    id v22 = a2;
    a3((unint64_t)v20, 1);
  }
}

uint64_t sub_2473CDB64(uint64_t a1)
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
    uint64_t result = sub_2473F9380(v8);
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

uint64_t sub_2473CDCD4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  int64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for WFStaccatoActionSectionIdentifier(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB00);
    sub_2473CF3A4();
    uint64_t v4 = sub_24740DC80();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_2473CDD88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = qword_26B12B950;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24740D560();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B12B938);
  id v9 = a3;
  uint64_t v10 = sub_24740D540();
  os_log_type_t v11 = sub_24740DEB0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = v6;
    uint64_t v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    id v14 = objc_msgSend(v9, sel_actionIdentifier);
    uint64_t v15 = sub_24740DCF0();
    unint64_t v17 = v16;

    sub_2474096F8(v15, v17, aBlock);
    sub_24740E220();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2473C9000, v10, v11, "Fetching values for parameter %s...", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v13;
    uint64_t v6 = v23;
    MEMORY[0x24C5554B0](v18, -1, -1);
    MEMORY[0x24C5554B0](v12, -1, -1);
  }
  else
  {
  }
  id v19 = objc_msgSend(self, sel_standardClient);
  v20 = (void *)swift_allocObject();
  v20[2] = v9;
  v20[3] = sub_2473CE0B4;
  v20[4] = v6;
  aBlock[4] = (uint64_t)sub_2473CF1E8;
  aBlock[5] = (uint64_t)v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2473CE770;
  aBlock[3] = (uint64_t)&block_descriptor;
  v21 = _Block_copy(aBlock);
  id v22 = v9;
  swift_release();
  objc_msgSend(v19, sel_fetchAllValueSectionsForStaccatoParameter_completion_, v22, v21);
  _Block_release(v21);
}

uint64_t sub_2473CE07C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2473CE0B8(unint64_t a1, void *a2, void *a3, void (*a4)(void *, uint64_t))
{
  v51[1] = *MEMORY[0x263EF8340];
  if (!a1)
  {
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24740D560();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B12B938);
    id v21 = a3;
    id v22 = a2;
    id v23 = v21;
    id v24 = a2;
    v25 = sub_24740D540();
    os_log_type_t v26 = sub_24740DEB0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      v28 = (void *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      v51[0] = v48;
      *(_DWORD *)uint64_t v27 = 136315394;
      id v29 = objc_msgSend(v23, sel_actionIdentifier);
      uint64_t v30 = sub_24740DCF0();
      unint64_t v32 = v31;

      sub_2474096F8(v30, v32, v51);
      sub_24740E220();

      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2112;
      if (a2)
      {
        id v33 = a2;
        uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
        sub_24740E220();
      }
      else
      {
        sub_24740E220();
        uint64_t v34 = 0;
      }
      void *v28 = v34;

      _os_log_impl(&dword_2473C9000, v25, v26, "Failed to fetch parameter values for %s: %@", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v28, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v48, -1, -1);
      MEMORY[0x24C5554B0](v27, -1, -1);

      v36 = a2;
      if (a2) {
        goto LABEL_31;
      }
    }
    else
    {

      v36 = a2;
      if (a2)
      {
LABEL_31:
        id v42 = a2;
        a4(v36, 1);

        return;
      }
    }
    sub_2473CF1F4();
    v36 = (void *)swift_allocError();
    unsigned char *v41 = 1;
    goto LABEL_31;
  }
  if (qword_26B12B950 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24740D560();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B12B938);
  id v8 = a3;
  swift_bridgeObjectRetain_n();
  id v9 = v8;
  uint64_t v10 = sub_24740D540();
  os_log_type_t v11 = sub_24740DEB0();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v45 = v11;
    v47 = v9;
    uint64_t v12 = (_DWORD *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    v51[0] = v44;
    _DWORD *v12 = 134218242;
    unint64_t v50 = MEMORY[0x263F8EE78];
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_24740E4A0();
    }
    else
    {
      uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v49 = a4;
    v46 = v12;
    if (v13)
    {
      v43 = v10;
      if (v13 < 1) {
        __break(1u);
      }
      uint64_t v14 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v15 = (id)MEMORY[0x24C554A50](v14, a1);
        }
        else {
          id v15 = *(id *)(a1 + 8 * v14 + 32);
        }
        unint64_t v16 = v15;
        ++v14;
        id v17 = objc_msgSend(v15, sel_values, v43);
        sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
        unint64_t v18 = sub_24740DD70();

        sub_2473F9398(v18);
      }
      while (v13 != v14);
      swift_bridgeObjectRelease();
      unint64_t v35 = v50;
      uint64_t v10 = v43;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v35 = MEMORY[0x263F8EE78];
    }
    if (v35 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_24740E4A0();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24740E220();
    swift_bridgeObjectRelease();
    *((_WORD *)v46 + 6) = 2080;
    id v37 = objc_msgSend(v47, sel_actionIdentifier);
    uint64_t v38 = sub_24740DCF0();
    unint64_t v40 = v39;

    sub_2474096F8(v38, v40, v51);
    sub_24740E220();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2473C9000, v10, v45, "Successfully fetched %ld parameter values for %s", (uint8_t *)v46, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v44, -1, -1);
    MEMORY[0x24C5554B0](v46, -1, -1);

    a4 = v49;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  a4((void *)a1, 0);
}

uint64_t sub_2473CE770(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  int64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2473CF248(0, &qword_26B12BB80);
    uint64_t v4 = sub_24740DD70();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_2473CE814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  uint64_t v5 = qword_26B12B950;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24740D560();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B12B938);
  uint64_t v7 = sub_24740D540();
  os_log_type_t v8 = sub_24740DEB0();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_2473C9000, v7, v8, "Fetching default action...", v9, 2u);
    MEMORY[0x24C5554B0](v9, -1, -1);
  }

  id v10 = objc_msgSend(self, sel_standardClient);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_2473CE0B4;
  *(void *)(v11 + 24) = v4;
  v13[4] = sub_2473CF43C;
  v13[5] = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_2473CEE10;
  v13[3] = &block_descriptor_27;
  uint64_t v12 = _Block_copy(v13);
  swift_release();
  objc_msgSend(v10, sel_defaultStaccatoActionWithCompletion_, v12);
  _Block_release(v12);
}

void sub_2473CE9F8(void *a1, void *a2, void (*a3)(void *, uint64_t))
{
  if (a1 && (self, (uint64_t v6 = swift_dynamicCastObjCClass()) != 0))
  {
    if (!a2)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = qword_26B12B950;
      id v9 = a1;
      if (v8 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_24740D560();
      __swift_project_value_buffer(v10, (uint64_t)qword_26B12B938);
      id v11 = v9;
      uint64_t v12 = sub_24740D540();
      os_log_type_t v13 = sub_24740DEB0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        uint64_t v34 = v33;
        *(_DWORD *)uint64_t v14 = 136315138;
        buf = v14;
        id v15 = objc_msgSend(v7, sel_sectionIdentifier);
        uint64_t v16 = sub_24740DCF0();
        unint64_t v18 = v17;

        sub_2474096F8(v16, v18, &v34);
        sub_24740E220();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2473C9000, v12, v13, "Fetched %s", buf, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5554B0](v33, -1, -1);
        MEMORY[0x24C5554B0](buf, -1, -1);
      }
      else
      {
      }
      id v31 = v11;
      a3(v7, 0);

      return;
    }
  }
  else if (!a2)
  {
    sub_2473CF1F4();
    id v19 = (void *)swift_allocError();
    unsigned char *v20 = 2;
    goto LABEL_11;
  }
  id v19 = a2;
LABEL_11:
  id v21 = a2;
  if (qword_26B12B950 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_24740D560();
  __swift_project_value_buffer(v22, (uint64_t)qword_26B12B938);
  id v23 = v19;
  id v24 = v19;
  v25 = sub_24740D540();
  os_log_type_t v26 = sub_24740DEB0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 138412290;
    id v29 = v19;
    uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
    sub_24740E220();
    void *v28 = v34;

    _os_log_impl(&dword_2473C9000, v25, v26, "Failed to fetch default action %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v28, -1, -1);
    MEMORY[0x24C5554B0](v27, -1, -1);
  }
  else
  {
  }
  id v30 = v19;
  a3(v19, 1);
}

void sub_2473CEE10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_2473CEE9C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC60);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
  id v9 = (void *)sub_24740DC70();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_2473CF318;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2473CEE10;
  aBlock[3] = &block_descriptor_9;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_configuredStaccatoActionFromTemplate_valuesByParameterKey_completion_, a3, v9, v12);
  _Block_release(v12);
}

uint64_t sub_2473CF098(void *a1, id a2)
{
  if (a1 && (self, swift_dynamicCastObjCClass()))
  {
    id v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC60);
    return sub_24740DDF0();
  }
  else
  {
    if (a2)
    {
      id v6 = a2;
    }
    else
    {
      sub_24740DCF0();
      id v7 = objc_allocWithZone(MEMORY[0x263F087E8]);
      uint64_t v8 = (void *)sub_24740DCC0();
      swift_bridgeObjectRelease();
      objc_msgSend(v7, sel_initWithDomain_code_userInfo_, v8, 0, 0);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC60);
    return sub_24740DDE0();
  }
}

uint64_t sub_2473CF1A8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2473CF1E8(unint64_t a1, void *a2)
{
  sub_2473CE0B8(a1, a2, *(void **)(v2 + 16), *(void (**)(void *, uint64_t))(v2 + 24));
}

unint64_t sub_2473CF1F4()
{
  unint64_t result = qword_26924BC50;
  if (!qword_26924BC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BC50);
  }
  return result;
}

uint64_t sub_2473CF248(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2473CF284()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC60);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2473CF318(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC60);
  return sub_2473CF098(a1, a2);
}

void sub_2473CF39C(uint64_t a1, void *a2)
{
  sub_2473CD788(a1, a2, *(void (**)(unint64_t, uint64_t))(v2 + 16));
}

unint64_t sub_2473CF3A4()
{
  unint64_t result = qword_26B12BB58;
  if (!qword_26B12BB58)
  {
    type metadata accessor for WFStaccatoActionSectionIdentifier(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B12BB58);
  }
  return result;
}

uint64_t sub_2473CF3FC(uint64_t a1, char a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

void sub_2473CF43C(void *a1, void *a2)
{
  sub_2473CE9F8(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s6ErrorsOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s6ErrorsOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2473CF5ACLL);
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

uint64_t sub_2473CF5D4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2473CF5E0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *_s6ErrorsOMa()
{
  return &_s6ErrorsON;
}

unint64_t sub_2473CF5FC()
{
  unint64_t result = qword_26924BC68;
  if (!qword_26924BC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BC68);
  }
  return result;
}

uint64_t sub_2473CF670(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *(void *)a1 = *a2;
    a1 = v13 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    unsigned int v6 = (void *)a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = a2[6];
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    uint64_t v8 = *(int *)(a3 + 32);
    id v9 = (void *)(a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    *(void *)(a1 + 48) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v11 = v6;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_24740D8F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2473CF7DC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24740D8F0();
    unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_2473CF8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (void *)(a2 + v7);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = v5;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24740D8F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v9, v11);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_2473CF9C8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a1[3];
  uint64_t v7 = (void *)a2[3];
  a1[3] = v7;
  id v8 = v7;

  a1[4] = a2[4];
  swift_retain();
  swift_release();
  uint64_t v9 = a2[6];
  a1[5] = a2[5];
  a1[6] = v9;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 32);
    uint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    sub_2473D34E0((uint64_t)a1 + v10, &qword_26924BF40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_24740D8F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2473CFB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_24740D8F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2473CFC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 32);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_2473D34E0(a1 + v8, &qword_26924BF40);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_24740D8F0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2473CFD48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2473CFD5C);
}

uint64_t sub_2473CFD5C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC70);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2473CFE10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2473CFE24);
}

uint64_t sub_2473CFE24(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC70);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for GroupedParameterConfigurationView()
{
  uint64_t result = qword_26924BC78;
  if (!qword_26924BC78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2473CFF1C()
{
  sub_2473CFFD8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2473CFFD8()
{
  if (!qword_26924BC88)
  {
    sub_24740D8F0();
    unint64_t v0 = sub_24740D8D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26924BC88);
    }
  }
}

uint64_t sub_2473D0030()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2473D004C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v23 = sub_24740D9A0();
  uint64_t v3 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BCB0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BCA8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BCD0);
  sub_2473D2658(&qword_26924BCD8, &qword_26924BCD0, (void (*)(void))sub_2473D2414);
  sub_24740DA40();
  uint64_t v14 = a1[1];
  uint64_t v26 = *a1;
  uint64_t v27 = v14;
  uint64_t v15 = sub_2473D3668(&qword_26924BCB8, &qword_26924BCB0);
  unint64_t v16 = sub_2473D23B8();
  uint64_t v17 = MEMORY[0x263F8D310];
  sub_24740DAD0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v18 = v23;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F19698], v23);
  uint64_t v26 = v6;
  uint64_t v27 = v17;
  uint64_t v28 = v15;
  unint64_t v29 = v16;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = v21;
  sub_24740DAF0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v13, v19);
}

uint64_t sub_2473D0388(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GroupedParameterConfigurationView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v8[1] = *(void *)(a1 + 16);
  swift_getKeyPath();
  sub_2473D27D8(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_2473D2840((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BCE8);
  sub_2473D3668(&qword_26924BD80, &qword_26924BD78);
  sub_2473D28BC();
  sub_2473D2414();
  return sub_24740DBC0();
}

void sub_2473D0530(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_title);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_24740DCF0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_2473D0598(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_24740DCC0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setTitle_);
}

uint64_t sub_2473D0608@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v51 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD90);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v50 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_24740D8B0();
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  v43 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BCF0);
  uint64_t v46 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  id v42 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD98);
  uint64_t v48 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  v41 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v52 = a2;
  v53 = v10;
  uint64_t v11 = sub_24740D9B0();
  sub_2473D0D2C(v10, (uint64_t)&v54);
  long long v40 = v54;
  long long v39 = *(_OWORD *)v55;
  long long v38 = *(_OWORD *)&v55[16];
  long long v37 = *(_OWORD *)&v55[32];
  uint64_t v12 = *(void *)&v55[48];
  uint64_t v13 = v56;
  char v14 = BYTE8(v56);
  uint64_t v15 = v57;
  uint64_t v16 = v58;
  char v17 = v59;
  uint64_t v18 = v60;
  char v67 = 1;
  char v66 = v59;
  uint64_t v19 = sub_24740DB30();
  uint64_t KeyPath = swift_getKeyPath();
  long long v54 = (unint64_t)v11;
  v55[0] = 1;
  *(_OWORD *)&v55[8] = v40;
  *(_OWORD *)&v55[24] = v39;
  *(_OWORD *)&v55[40] = v38;
  long long v56 = v37;
  uint64_t v57 = v12;
  uint64_t v58 = v13;
  char v59 = v14;
  uint64_t v60 = v15;
  uint64_t v61 = v16;
  char v62 = v17;
  uint64_t v63 = v18;
  uint64_t v64 = KeyPath;
  uint64_t v65 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD38);
  sub_2473D2594();
  sub_2473D2658(&qword_26924BD30, &qword_26924BD38, (void (*)(void))sub_2473D26D0);
  uint64_t v21 = v42;
  sub_24740DBD0();
  uint64_t v22 = v45;
  uint64_t v23 = v43;
  uint64_t v24 = v47;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v43, *MEMORY[0x263F18440], v47);
  sub_2473D24E8();
  v25 = v41;
  uint64_t v26 = v44;
  sub_24740DAE0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v21, v26);
  uint64_t v27 = sub_24740DA70();
  uint64_t v28 = (uint64_t)v50;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v50, 1, 1, v27);
  uint64_t v29 = swift_getKeyPath();
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BCE8);
  uint64_t v31 = v51;
  unint64_t v32 = (uint64_t *)(v51 + *(int *)(v30 + 36));
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD70);
  sub_2473D353C(v28, (uint64_t)v32 + *(int *)(v33 + 28), &qword_26924BD90);
  *unint64_t v32 = v29;
  uint64_t v34 = v48;
  uint64_t v35 = v49;
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 16))(v31, v25, v49);
  sub_2473D34E0(v28, &qword_26924BD90);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v25, v35);
}

uint64_t sub_2473D0B58(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for GroupedParameterConfigurationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  id v7 = objc_msgSend(a2, sel_values);
  sub_2473D2D24();
  uint64_t v8 = sub_24740DD70();

  v12[1] = v8;
  swift_getKeyPath();
  sub_2473D27D8(a1, (uint64_t)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  sub_2473D2840((uint64_t)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD48);
  sub_2473D3668(&qword_26924BDA0, &qword_26B12BB18);
  sub_2473D26D0();
  return sub_24740DBC0();
}

uint64_t sub_2473D0D2C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_image);
  uint64_t v5 = 0;
  if (v4
    && (uint64_t v6 = v4, v7 = objc_msgSend(v4, sel_platformImage), v6, v7))
  {
    id v8 = v7;
    uint64_t v43 = sub_24740DB40();
    sub_24740DBF0();
    uint64_t v5 = v9;
    uint64_t v11 = v10;
    unsigned __int8 v12 = sub_24740DA10();
    sub_24740D8A0();
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;

    uint64_t v41 = 0x3FF6666666666666;
    uint64_t v42 = v12;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    uint64_t v41 = 0;
    uint64_t v11 = 0;
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    uint64_t v20 = 0;
  }
  id v21 = objc_msgSend(a1, sel_title);
  if (v21)
  {
    uint64_t v22 = v21;
    sub_24740DCF0();
  }
  sub_2473D23B8();
  uint64_t v23 = sub_24740DA90();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  sub_24740DA30();
  uint64_t v28 = sub_24740DA80();
  uint64_t v30 = v29;
  char v32 = v31;
  swift_release();
  sub_2473D2D04(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_24740DA20();
  uint64_t v33 = sub_24740DA50();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  char v39 = v38 & 1;
  sub_2473D2D04(v28, v30, v32 & 1);
  swift_bridgeObjectRelease();
  *(void *)a2 = v43;
  *(void *)(a2 + 8) = v41;
  *(void *)(a2 + 16) = v41;
  *(void *)(a2 + 24) = v5;
  *(void *)(a2 + 32) = v11;
  *(void *)(a2 + 40) = v42;
  *(void *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v16;
  *(void *)(a2 + 64) = v18;
  *(void *)(a2 + 72) = v20;
  *(unsigned char *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = v33;
  *(void *)(a2 + 96) = v35;
  *(unsigned char *)(a2 + 104) = v39;
  *(void *)(a2 + 112) = v37;
  swift_retain();
  sub_2473D2D14(v33, v35, v39);
  swift_bridgeObjectRetain();
  sub_2473D2D04(v33, v35, v39);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_2473D0FC0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_identifier);
  uint64_t v4 = sub_24740DCF0();
  uint64_t v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

uint64_t sub_2473D1018@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for GroupedParameterConfigurationView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD58);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unsigned __int8 v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = *a1;
  sub_2473D27D8(a2, (uint64_t)&v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = swift_allocObject();
  sub_2473D2840((uint64_t)&v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v15 + v14);
  *(void *)(v15 + ((v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = v13;
  id v21 = v13;
  uint64_t v22 = a2;
  id v16 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BDA8);
  sub_2473D3668(&qword_26924BDB0, &qword_26924BDA8);
  sub_24740DBB0();
  uint64_t v17 = sub_24740D9C0();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v10 + 16))(a3, v12, v9);
  uint64_t v18 = (uint64_t *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26924BD48) + 36));
  *uint64_t v18 = v17;
  v18[1] = (uint64_t)sub_2473D208C;
  v18[2] = 0;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_2473D1290(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_24740D8F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = *(_OWORD *)(a1 + 24);
  v10[1] = a2;
  id v8 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BDF0);
  sub_24740DBA0();
  (*(void (**)(void *))(a1 + 40))(a2);
  type metadata accessor for GroupedParameterConfigurationView();
  sub_2473D2930((uint64_t)v7);
  sub_24740D8E0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2473D13B8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_24740D9B0();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BDB8);
  return sub_2473D1418(a1, a2, a3 + *(int *)(v6 + 44));
}

uint64_t sub_2473D1418@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X8>)
{
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BDC0);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v85 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v82 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BDC8);
  uint64_t v97 = *(void *)(v10 - 8);
  uint64_t v98 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v84 = (char *)&v82 - v14;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BDD0);
  MEMORY[0x270FA5388](v95);
  uint64_t v96 = (uint64_t)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BDD8);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v101 = (uint64_t)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v100 = (uint64_t)&v82 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BDE0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v82 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v23 = objc_msgSend(a1, sel_image);
  if (v23
    && (uint64_t v24 = v23, v25 = objc_msgSend(v23, sel_UIImage), v24, v25))
  {
    unint64_t v90 = sub_24740D9D0();
    id v89 = v25;
    sub_24740DB40();
    v93 = v13;
    v94 = v9;
    uint64_t v26 = *MEMORY[0x263F1B510];
    uint64_t v27 = sub_24740DB70();
    uint64_t v28 = *(void *)(v27 - 8);
    v91 = a1;
    uint64_t v29 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 104))(v22, v26, v27);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v22, 0, 1, v27);
    uint64_t v88 = sub_24740DB60();
    swift_release();
    sub_2473D34E0((uint64_t)v22, &qword_26924BDE0);
    uint64_t v87 = sub_24740DB10();
    uint64_t KeyPath = swift_getKeyPath();
    sub_24740DBF0();
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    sub_24740DBE0();
    sub_24740D920();
    uint64_t v34 = v138;
    uint64_t v35 = v140;
    uint64_t v36 = v142;
    uint64_t v37 = v144;
    uint64_t v92 = a2;
    uint64_t v38 = v146;
    uint64_t v39 = v148;
    uint64_t v40 = v150;
    uint64_t v83 = v151;
    v108[0] = 1;
    char v107 = v139;
    char v106 = v141;
    char v105 = v143;
    char v104 = v145;
    char v103 = v147;
    char v102 = v149;
    LOBYTE(v27) = sub_24740DA10();
    sub_24740D8A0();
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    uint64_t v48 = v47;

    LOBYTE(v109[0]) = 0;
    long long v110 = v90;
    unsigned __int8 v111 = v108[0];
    uint64_t v112 = v88;
    uint64_t v113 = KeyPath;
    uint64_t v114 = v87;
    int64x2_t v115 = vdupq_n_s64(0x3FF6666666666666uLL);
    uint64_t v116 = v31;
    uint64_t v117 = v33;
    uint64_t v118 = v34;
    char v119 = v107;
    uint64_t v120 = v35;
    char v121 = v106;
    uint64_t v122 = v36;
    char v123 = v105;
    uint64_t v124 = v37;
    uint64_t v13 = v93;
    uint64_t v9 = v94;
    char v125 = v104;
    uint64_t v126 = v38;
    char v127 = v103;
    uint64_t v128 = v39;
    char v129 = v102;
    uint64_t v130 = v40;
    a1 = v91;
    a2 = v92;
    uint64_t v131 = v83;
    char v132 = v27;
    uint64_t v133 = v42;
    uint64_t v134 = v44;
    uint64_t v135 = v46;
    uint64_t v136 = v48;
    char v137 = 0;
    nullsub_1(&v110);
  }
  else
  {
    sub_2473D31A8(&v110);
  }
  sub_2473D31D0((uint64_t)&v110, (uint64_t)v152, &qword_26924BDE8);
  unint64_t v90 = a3;
  uint64_t v87 = a3 + 256;
  uint64_t KeyPath = sub_24740D9D0();
  sub_2473D1E58(a1, (uint64_t)&v110);
  id v89 = (id)*((void *)&v110 + 1);
  uint64_t v49 = v110;
  LODWORD(v88) = v111;
  v93 = (char *)v114;
  v94 = (char *)v113;
  v91 = (void *)v112;
  uint64_t v50 = v115.i64[1];
  uint64_t v92 = v115.i64[0];
  id v51 = objc_msgSend(a1, sel_identifier);
  uint64_t v52 = sub_24740DCF0();
  uint64_t v54 = v53;

  long long v110 = *(_OWORD *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BDF0);
  sub_24740DB90();
  id v55 = v109[0];
  if (!v109[0])
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  id v56 = objc_msgSend(v109[0], sel_identifier);

  uint64_t v57 = sub_24740DCF0();
  uint64_t v59 = v58;

  if (v52 != v57 || v54 != v59)
  {
    char v60 = sub_24740E5A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v60) {
      goto LABEL_11;
    }
LABEL_12:
    *(void *)&long long v110 = sub_24740DB50();
    uint64_t v67 = MEMORY[0x263F1B570];
    uint64_t v68 = MEMORY[0x263F1B558];
    sub_24740DB00();
    swift_release();
    uint64_t v69 = v97;
    uint64_t v70 = v98;
    uint64_t v71 = (uint64_t)v85;
    (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v85, v13, v98);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v13, v70);
    sub_2473D31D0(v71, (uint64_t)v9, &qword_26924BDC0);
    sub_2473D353C((uint64_t)v9, v96, &qword_26924BDC0);
    swift_storeEnumTagMultiPayload();
    *(void *)&long long v110 = v67;
    *((void *)&v110 + 1) = v68;
    swift_getOpaqueTypeConformance2();
    sub_2473D3234();
    uint64_t v66 = v100;
    sub_24740D9F0();
    sub_2473D34E0((uint64_t)v9, &qword_26924BDC0);
    goto LABEL_13;
  }
  swift_bridgeObjectRelease_n();
LABEL_11:
  *(void *)&long long v110 = sub_24740DB50();
  uint64_t v61 = MEMORY[0x263F1B570];
  uint64_t v62 = MEMORY[0x263F1B558];
  uint64_t v63 = v84;
  sub_24740DB00();
  swift_release();
  uint64_t v64 = v97;
  uint64_t v65 = v98;
  (*(void (**)(uint64_t, char *, uint64_t))(v97 + 16))(v96, v63, v98);
  swift_storeEnumTagMultiPayload();
  *(void *)&long long v110 = v61;
  *((void *)&v110 + 1) = v62;
  swift_getOpaqueTypeConformance2();
  sub_2473D3234();
  uint64_t v66 = v100;
  sub_24740D9F0();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v63, v65);
LABEL_13:
  sub_2473D31D0((uint64_t)v152, (uint64_t)v108, &qword_26924BDE8);
  sub_2473D353C(v66, v101, &qword_26924BDD8);
  sub_2473D31D0((uint64_t)v108, (uint64_t)v109, &qword_26924BDE8);
  v72 = (void *)v90;
  sub_2473D31D0((uint64_t)v109, v90, &qword_26924BDE8);
  v73 = (unsigned char *)v87;
  v72[30] = KeyPath;
  v72[31] = 0;
  unsigned char *v73 = 1;
  uint64_t v74 = (uint64_t)v89;
  v72[33] = v49;
  v72[34] = v74;
  char v75 = v88;
  v73[24] = v88;
  uint64_t v76 = v92;
  uint64_t v78 = (uint64_t)v93;
  uint64_t v77 = (uint64_t)v94;
  v72[36] = v91;
  v72[37] = v77;
  v72[38] = v78;
  v72[39] = v76;
  v72[40] = v50;
  v72[41] = 0;
  v73[80] = 1;
  uint64_t v79 = (uint64_t)v72 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26924BE08) + 80);
  uint64_t v80 = v101;
  sub_2473D353C(v101, v79, &qword_26924BDD8);
  sub_2473D340C((uint64_t)v109, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2473D3334);
  sub_2473D2D14(v49, v74, v75);
  swift_bridgeObjectRetain();
  sub_2473D3384(v77, v78, v76, v50);
  sub_2473D34E0(v100, &qword_26924BDD8);
  sub_2473D34E0(v80, &qword_26924BDD8);
  sub_2473D2D04(v49, v74, v75);
  swift_bridgeObjectRelease();
  sub_2473D33C8(v77, v78, v76, v50);
  sub_2473D31D0((uint64_t)v108, (uint64_t)&v110, &qword_26924BDE8);
  return sub_2473D340C((uint64_t)&v110, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2473D3490);
}

uint64_t sub_2473D1E58@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_localizedTitle);
  sub_24740DCF0();

  sub_2473D23B8();
  uint64_t v5 = sub_24740DA90();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  sub_24740DB30();
  uint64_t v10 = sub_24740DA60();
  uint64_t v33 = v11;
  char v32 = v12;
  uint64_t v14 = v13;
  swift_release();
  sub_2473D2D04(v5, v7, v9);
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(a1, sel_localizedSubtitle);
  if (v15)
  {
    sub_24740DCF0();

    uint64_t v16 = sub_24740DA90();
    uint64_t v18 = v17;
    uint64_t v31 = v14;
    char v20 = v19 & 1;
    sub_24740DB20();
    uint64_t v21 = sub_24740DA60();
    id v15 = v22;
    uint64_t v23 = v10;
    char v25 = v24;
    uint64_t v27 = v26;
    swift_release();
    uint64_t v28 = v25 & 1;
    uint64_t v10 = v23;
    char v29 = v20;
    uint64_t v14 = v31;
    sub_2473D2D04(v16, v18, v29);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v28 = 0;
    uint64_t v27 = 0;
  }
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v33;
  *(unsigned char *)(a2 + 16) = v32 & 1;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v21;
  *(void *)(a2 + 40) = v15;
  *(void *)(a2 + 48) = v28;
  *(void *)(a2 + 56) = v27;
  sub_2473D2D14(v10, v33, v32 & 1);
  swift_bridgeObjectRetain();
  sub_2473D3384(v21, (uint64_t)v15, v28, v27);
  sub_2473D33C8(v21, (uint64_t)v15, v28, v27);
  sub_2473D2D04(v10, v33, v32 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473D208C()
{
  uint64_t v0 = sub_24740D9D0();
  return MEMORY[0x24C554020](v0);
}

uint64_t sub_2473D20BC()
{
  return sub_24740DAC0();
}

uint64_t sub_2473D20D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC90);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC98);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BCA0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BCA8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BCB0);
  uint64_t v12 = sub_2473D3668(&qword_26924BCB8, &qword_26924BCB0);
  unint64_t v13 = sub_2473D23B8();
  uint64_t v22 = v11;
  uint64_t v23 = MEMORY[0x263F8D310];
  uint64_t v24 = v12;
  unint64_t v25 = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v22 = v10;
  uint64_t v23 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_24740D900();
  uint64_t v15 = *MEMORY[0x263F184F8];
  uint64_t v16 = sub_24740D8C0();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v17 + 104))(v5, v15, v16);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v17 + 56))(v5, 0, 1, v16);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BCC8);
  sub_2473D353C((uint64_t)v5, a1 + *(int *)(v18 + 36), &qword_26924BC90);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v7 + 16))(a1, v9, v6);
  sub_2473D34E0((uint64_t)v5, &qword_26924BC90);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_2473D23B0@<X0>(uint64_t a1@<X8>)
{
  return sub_2473D004C(*(void **)(v1 + 16), a1);
}

unint64_t sub_2473D23B8()
{
  unint64_t result = qword_26924BCC0;
  if (!qword_26924BCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BCC0);
  }
  return result;
}

uint64_t sub_2473D240C()
{
  return sub_2473D0388(*(void *)(v0 + 16));
}

unint64_t sub_2473D2414()
{
  unint64_t result = qword_26924BCE0;
  if (!qword_26924BCE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BCE8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BCF0);
    sub_2473D24E8();
    swift_getOpaqueTypeConformance2();
    sub_2473D3668(&qword_26924BD68, &qword_26924BD70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BCE0);
  }
  return result;
}

unint64_t sub_2473D24E8()
{
  unint64_t result = qword_26924BCF8;
  if (!qword_26924BCF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BCF0);
    sub_2473D2594();
    sub_2473D2658(&qword_26924BD30, &qword_26924BD38, (void (*)(void))sub_2473D26D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BCF8);
  }
  return result;
}

unint64_t sub_2473D2594()
{
  unint64_t result = qword_26924BD00;
  if (!qword_26924BD00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BD08);
    sub_2473D3668(&qword_26924BD10, &qword_26924BD18);
    sub_2473D3668(&qword_26924BD20, &qword_26924BD28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BD00);
  }
  return result;
}

uint64_t sub_2473D2658(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_2473D26D0()
{
  unint64_t result = qword_26924BD40;
  if (!qword_26924BD40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BD48);
    sub_2473D3668(&qword_26924BD50, &qword_26924BD58);
    sub_2473D2770();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BD40);
  }
  return result;
}

unint64_t sub_2473D2770()
{
  unint64_t result = qword_26924BD60;
  if (!qword_26924BD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BD60);
  }
  return result;
}

char *keypath_get_selector_title()
{
  return sel_title;
}

uint64_t sub_2473D27D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupedParameterConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473D2840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupedParameterConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473D28A4(uint64_t a1)
{
  return sub_2473D2F2C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2473D0608);
}

unint64_t sub_2473D28BC()
{
  unint64_t result = qword_26924BD88;
  if (!qword_26924BD88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26924C130);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BD88);
  }
  return result;
}

uint64_t sub_2473D2928()
{
  return sub_2473D0B58(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2473D2930@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24740D990();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
  MEMORY[0x270FA5388]();
  char v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473D353C(v2, (uint64_t)v9, &qword_26924BF40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_24740D8F0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    os_log_type_t v12 = sub_24740DEA0();
    unint64_t v13 = sub_24740DA00();
    os_log_type_t v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v17 = v16;
      uint64_t v19 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      v18[2] = sub_2474096F8(0x417373696D736944, 0xED00006E6F697463, &v19);
      sub_24740E220();
      _os_log_impl(&dword_2473C9000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v17, -1, -1);
      MEMORY[0x24C5554B0](v15, -1, -1);
    }

    sub_24740D980();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2473D2BF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD90);
  MEMORY[0x270FA5388](v2 - 8);
  sub_2473D353C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26924BD90);
  return sub_24740D970();
}

uint64_t sub_2473D2C84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24740D930();
  *a1 = result;
  return result;
}

uint64_t sub_2473D2CB0()
{
  return sub_24740D940();
}

uint64_t sub_2473D2CDC()
{
  return sub_24740D960();
}

uint64_t sub_2473D2D04(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2473D2D14(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_2473D2D24()
{
  unint64_t result = qword_26B12BB78;
  if (!qword_26B12BB78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B12BB78);
  }
  return result;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_2473D2D74(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  id v3 = (id)sub_24740DCC0();
  objc_msgSend(v2, sel_setIdentifier_, v3);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for GroupedParameterConfigurationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24740D8F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2473D2F14(uint64_t a1)
{
  return sub_2473D2F2C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2473D1018);
}

uint64_t sub_2473D2F2C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for GroupedParameterConfigurationView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

uint64_t sub_2473D2FC0()
{
  uint64_t v1 = (int *)(type metadata accessor for GroupedParameterConfigurationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24740D8F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = v7 + 8;

  return MEMORY[0x270FA0238](v0, v8, v2 | 7);
}

uint64_t sub_2473D3114()
{
  uint64_t v1 = *(void *)(type metadata accessor for GroupedParameterConfigurationView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void **)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_2473D1290(v0 + v2, v3);
}

uint64_t sub_2473D31A0@<X0>(uint64_t a1@<X8>)
{
  return sub_2473D13B8(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

double sub_2473D31A8(_OWORD *a1)
{
  double result = 0.0;
  *(_OWORD *)((char *)a1 + 217) = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_2473D31D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_2473D3234()
{
  unint64_t result = qword_26924BDF8;
  if (!qword_26924BDF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BDC0);
    swift_getOpaqueTypeConformance2();
    sub_2473D32E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BDF8);
  }
  return result;
}

unint64_t sub_2473D32E0()
{
  unint64_t result = qword_26924BE00;
  if (!qword_26924BE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BE00);
  }
  return result;
}

uint64_t sub_2473D3334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2473D3384(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2473D2D14(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2473D33C8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2473D2D04(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2473D340C(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 232);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    v4);
  return a1;
}

uint64_t sub_2473D3490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2473D34E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2473D353C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_2473D35A4()
{
  unint64_t result = qword_26924BE10;
  if (!qword_26924BE10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BCC8);
    sub_2473D3668(&qword_26924BE18, &qword_26924BC98);
    sub_2473D3668(&qword_26924BE20, &qword_26924BE28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BE10);
  }
  return result;
}

uint64_t sub_2473D3668(unint64_t *a1, uint64_t *a2)
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

BOOL ConfigurationViewController.Mode.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

uint64_t sub_2473D36D0()
{
  return sub_24740E650();
}

uint64_t sub_2473D3718()
{
  return sub_24740E640();
}

uint64_t sub_2473D3744()
{
  return sub_24740E650();
}

void *sub_2473D3788@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

id ConfigurationViewController.__allocating_init(mode:dismissHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return ConfigurationViewController.init(mode:dismissHandler:)(a1, a2, a3);
}

id ConfigurationViewController.init(mode:dismissHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR___BCConfigurationViewController_viewModel] = 0;
  *(void *)&v3[OBJC_IVAR___BCConfigurationViewController_selectorViewController] = 0;
  *(void *)&v3[OBJC_IVAR___BCConfigurationViewController_welcomeView] = 0;
  *(void *)&v3[OBJC_IVAR___BCConfigurationViewController_actionDetailsView] = 0;
  *(_OWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides] = xmmword_24740FD40;
  *(void *)&v3[OBJC_IVAR___BCConfigurationViewController_cancellableBag] = MEMORY[0x263F8EE88];
  *(void *)&v3[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController] = 0;
  *(void *)&v3[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor] = 0;
  v3[OBJC_IVAR___BCConfigurationViewController_isAppeared] = 0;
  *(void *)&v3[OBJC_IVAR___BCConfigurationViewController_mode] = a1;
  char v4 = &v3[OBJC_IVAR___BCConfigurationViewController_dismissHandler];
  *char v4 = a2;
  v4[1] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ConfigurationViewController();
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for ConfigurationViewController()
{
  return self;
}

void sub_2473D3994()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v8, sel_viewDidLoad);
  sub_2473D431C();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829A8]), sel_init);
  objc_msgSend(v1, sel_configureWithTransparentBackground);
  id v2 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v2, sel_setStandardAppearance_, v1);

  id v3 = objc_msgSend(v0, sel_view);
  if (v3)
  {
    char v4 = v3;
    id v5 = objc_msgSend(self, sel_blackColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    objc_msgSend(v0, sel_setOverrideUserInterfaceStyle_, 2);
    id v6 = objc_msgSend(v0, sel_view);
    if (v6)
    {
      id v7 = v6;
      objc_msgSend(v6, sel_setAccessibilityIgnoresInvertColors_, 1);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_2473D3B34(char a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v11, sel_viewWillAppear_, a1 & 1);
  if (!*(void *)&v1[OBJC_IVAR___BCConfigurationViewController_mode])
  {
    id v3 = objc_msgSend(v1, sel_navigationController);
    id v4 = v3;
    if (v3)
    {
      id v5 = objc_msgSend(v3, sel_navigationBar);

      id v4 = objc_msgSend(v5, sel_tintColor);
    }
    id v6 = *(void **)&v1[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor];
    *(void *)&v1[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor] = v4;

    id v7 = objc_msgSend(v1, sel_navigationController);
    if (v7)
    {
      objc_super v8 = v7;
      id v9 = objc_msgSend(v7, sel_navigationBar);

      id v10 = objc_msgSend(self, sel_whiteColor);
      objc_msgSend(v9, sel_setTintColor_, v10);
    }
  }
}

void sub_2473D3CD4(char a1)
{
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v9, sel_viewWillDisappear_, a1 & 1);
  if (!*(void *)&v1[OBJC_IVAR___BCConfigurationViewController_mode])
  {
    id v3 = objc_msgSend(v1, sel_navigationController);
    if (v3)
    {
      id v4 = v3;
      id v5 = objc_msgSend(v3, sel_navigationBar);

      id v6 = *(void **)&v1[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor];
      if (v6)
      {
        id v7 = *(id *)&v1[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor];
      }
      else
      {
        id v7 = objc_msgSend(self, sel_systemBlueColor);
        id v6 = 0;
      }
      id v8 = v6;
      objc_msgSend(v5, sel_setTintColor_, v7);
    }
  }
}

void sub_2473D3E20(char a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v10, sel_viewDidAppear_, a1 & 1);
  v1[OBJC_IVAR___BCConfigurationViewController_isAppeared] = 1;
  id v3 = *(void **)&v1[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController];
  if (v3) {
    objc_msgSend(v3, sel_loadViewIfNeeded);
  }
  if (!*(void *)&v1[OBJC_IVAR___BCConfigurationViewController_mode])
  {
    id v4 = objc_msgSend(v1, sel_navigationController);
    if (v4)
    {
      id v5 = v4;
      id v6 = objc_msgSend(v4, sel_navigationBar);

      id v7 = objc_msgSend(self, sel_whiteColor);
      objc_msgSend(v6, sel_setTintColor_, v7);
    }
    id v8 = objc_msgSend(v1, sel_view);
    if (v8)
    {
      objc_super v9 = v8;
      objc_msgSend(v8, sel_setNeedsLayout);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_2473D3FAC()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v5, sel_viewDidLayoutSubviews);
  if (!*(void *)&v0[OBJC_IVAR___BCConfigurationViewController_mode])
  {
    id v1 = objc_msgSend(v0, sel_navigationController);
    if (v1)
    {
      id v2 = v1;
      id v3 = objc_msgSend(v1, sel_navigationBar);

      id v4 = objc_msgSend(self, sel_whiteColor);
      objc_msgSend(v3, sel_setTintColor_, v4);
    }
  }
}

void sub_2473D40C4(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  id v4 = (uint64_t *)(v1 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides);
  *id v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2473D5EA4(v5);
  id v6 = *(void **)(v1 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
  if (!v6) {
    return;
  }
  uint64_t v7 = *v4;
  if (*v4 == 1) {
    return;
  }
  if (!v4[1])
  {
    id v12 = v6;
    sub_2473D5EE8(v7);
    objc_super v10 = 0;
    if (v7) {
      goto LABEL_6;
    }
LABEL_8:
    sub_2473D5EA4(0);
    id v13 = 0;
    goto LABEL_9;
  }
  id v8 = v6;
  sub_2473D5EE8(v7);
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_2473D71B0(v9);
  swift_bridgeObjectRelease();
  type metadata accessor for ABDeviceSceneParameter(0);
  sub_2473CF248(0, &qword_26924BE88);
  sub_2473D8048(&qword_26924BE90, type metadata accessor for ABDeviceSceneParameter);
  objc_super v10 = (void *)sub_24740DC70();
  swift_release();
  if (!v7) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v11 = swift_bridgeObjectRetain();
  sub_2473D71B0(v11);
  swift_bridgeObjectRelease();
  sub_2473D5EA4(v7);
  type metadata accessor for ABDeviceSceneParameter(0);
  sub_2473CF248(0, &qword_26924BE88);
  sub_2473D8048(&qword_26924BE90, type metadata accessor for ABDeviceSceneParameter);
  id v13 = (id)sub_24740DC70();
  swift_release();
LABEL_9:
  objc_msgSend(v6, sel_overrideSceneParamsWithZoomedOutParams_zoomedInParams_, v10, v13, v13);
}

uint64_t sub_2473D431C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF68);
  uint64_t v45 = *(void *)(v1 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v43 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v44 = (char *)&v42 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF70);
  uint64_t v46 = *(void *)(v5 - 8);
  uint64_t v47 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF78);
  uint64_t v49 = *(void *)(v8 - 8);
  uint64_t v50 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v48 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF80);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)&v0[OBJC_IVAR___BCConfigurationViewController_mode];
  char v15 = v14 != 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  uint64_t v16 = (void **)MEMORY[0x263F87B98];
  if (v14 != 1) {
    uint64_t v16 = (void **)MEMORY[0x263F87B90];
  }
  uint64_t v17 = *v16;
  uint64_t v18 = (objc_class *)type metadata accessor for ShortcutsConfigurationViewController();
  id v19 = v17;
  id v20 = objc_allocWithZone(v18);
  uint64_t v21 = v0;
  id v22 = objc_msgSend(v20, sel_initWithConfigurationContext_, v19);

  uint64_t v23 = *(void **)&v21[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController];
  *(void *)&v21[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController] = v22;

  sub_2473D7B7C((uint64_t)v53, (uint64_t)v54);
  v53[3] = &type metadata for ConfigurationViewController.Router;
  v53[4] = &off_26FB87FA8;
  v53[0] = swift_allocObject();
  sub_2473D7B68();
  type metadata accessor for ConfigurationViewModel();
  uint64_t v24 = swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v53, (uint64_t)&type metadata for ConfigurationViewController.Router);
  swift_unknownObjectWeakCopyInit();
  unint64_t v25 = sub_2473D73C8(v15, (uint64_t)v52, v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  sub_2473D8378((uint64_t)v54);
  uint64_t v26 = OBJC_IVAR___BCConfigurationViewController_viewModel;
  *(void *)&v21[OBJC_IVAR___BCConfigurationViewController_viewModel] = v25;
  uint64_t result = swift_release();
  uint64_t v28 = *(void *)&v21[v26];
  if (!v28)
  {
    __break(1u);
    goto LABEL_10;
  }
  *(void *)&v21[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel] = v28;
  swift_retain_n();
  swift_release();
  sub_2473FEEB4();
  uint64_t result = swift_release();
  uint64_t v51 = v26;
  uint64_t v29 = *(void *)&v21[v26];
  if (!v29)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v53[0] = *(void *)(*(void *)(v29 + 144) + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF88);
  sub_2473D3668(&qword_26924BF90, &qword_26924BF88);
  v53[0] = sub_24740D730();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF98);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFA0);
  sub_2473D3668(&qword_26924BFA8, &qword_26924BF98);
  sub_24740D740();
  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2473D3668(&qword_26924BFB0, &qword_26924BF80);
  sub_24740D880();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  uint64_t result = swift_release();
  uint64_t v30 = v51;
  uint64_t v31 = *(void *)&v21[v51];
  if (!v31)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v53[0] = *(void *)(*(void *)(v31 + 152) + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFB8);
  sub_2473D3668(&qword_26924BFC0, &qword_26924BFB8);
  v53[0] = sub_24740D730();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFC8);
  sub_2473D3668(&qword_26924BFD0, &qword_26924BFC8);
  sub_24740D740();
  swift_release();
  sub_2473D3668(&qword_26924BFD8, &qword_26924BF70);
  uint64_t v32 = v47;
  uint64_t v33 = v48;
  sub_24740D840();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v32);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2473D3668(&qword_26924BFE0, &qword_26924BF78);
  uint64_t v34 = v50;
  sub_24740D880();
  swift_release();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v33, v34);
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  uint64_t result = swift_release();
  uint64_t v35 = *(void *)&v21[v30];
  if (!v35)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v53[0] = *(void *)(*(void *)(v35 + 16) + 24);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFE8);
  uint64_t v49 = sub_2473D3668(&qword_26924BFF0, &qword_26924BFE8);
  uint64_t v50 = v36;
  v53[0] = sub_24740D730();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFF8);
  sub_2473D3668(&qword_26924C000, &qword_26924BFF8);
  uint64_t v38 = v44;
  uint64_t v48 = (char *)v37;
  sub_24740D840();
  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2473D3668(&qword_26924C008, &qword_26924BF68);
  sub_24740D880();
  swift_release();
  uint64_t v39 = *(void (**)(char *, uint64_t))(v45 + 8);
  v39(v38, v1);
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  uint64_t result = swift_release();
  uint64_t v40 = *(void *)&v21[v51];
  if (v40)
  {
    v53[0] = *(void *)(*(void *)(v40 + 168) + 24);
    v53[0] = sub_24740D730();
    uint64_t v41 = v43;
    sub_24740D840();
    swift_release();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_24740D880();
    swift_release();
    v39(v41, v1);
    swift_beginAccess();
    sub_24740D670();
    swift_endAccess();
    return swift_release();
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_2473D4D5C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

void sub_2473D4D68(unint64_t *a1, uint64_t a2)
{
  unint64_t v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x24C5555B0](v3);
  if (v4)
  {
    uint64_t v5 = (unsigned char *)v4;
    uint64_t v6 = *(void **)(v4 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    if (v6 && (uint64_t v7 = *(char **)(v4 + OBJC_IVAR___BCConfigurationViewController_actionDetailsView)) != 0)
    {
      id v8 = v6;
      uint64_t v9 = v7;
      swift_bridgeObjectRetain();
      if (v2 >> 62)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF58);
        sub_24740E490();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_24740E5B0();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF58);
      uint64_t v10 = (void *)sub_24740DD60();
      swift_bridgeObjectRelease();
      if (v5[OBJC_IVAR___BCConfigurationViewController_isAppeared] == 1)
      {
        uint64_t v11 = *(void *)&v5[OBJC_IVAR___BCConfigurationViewController_viewModel];
        if (!v11)
        {
LABEL_22:
          __break(1u);
          return;
        }
        uint64_t v12 = *(unsigned __int8 *)(*(void *)(v11 + 168) + 16);
      }
      else
      {
        uint64_t v12 = 0;
      }
      objc_msgSend(v6, sel_updateActionItems_animated_, v10, v12);

      uint64_t v15 = sub_2473D4F78(v2);
      *(void *)&v7[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions] = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v16 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl;
      uint64_t v17 = *(void **)&v7[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
      if (v17)
      {
        uint64_t v18 = *(void *)(v15 + 16);
        objc_msgSend(v17, sel_setNumberOfPages_, v18);
        id v19 = *(void **)&v7[v16];
        if (v19)
        {
          objc_msgSend(v19, sel__setPreferredNumberOfVisibleIndicators_, v18);

          swift_bridgeObjectRelease();
LABEL_16:

          return;
        }
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v13 = *(void *)(v4 + OBJC_IVAR___BCConfigurationViewController_viewModel);
      if (v13)
      {
        uint64_t v14 = *(void *)(v13 + 152);
        if ((*(unsigned char *)(v14 + 24) & 1) == 0) {
          sub_2473D55A8(v2, *(void *)(v14 + 16));
        }
        goto LABEL_16;
      }
      __break(1u);
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
}

uint64_t sub_2473D4F78(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24740E4A0();
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
  uint64_t v35 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2473F9584(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v35;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = MEMORY[0x24C554A50](v5, a1);
        uint64_t v7 = type metadata accessor for ActionSelectorItem();
        uint64_t v33 = v7;
        uint64_t v34 = &off_26FB886F8;
        v32[0] = v6;
        uint64_t v35 = v3;
        unint64_t v9 = *(void *)(v3 + 16);
        unint64_t v8 = *(void *)(v3 + 24);
        uint64_t v10 = v7;
        if (v9 >= v8 >> 1)
        {
          sub_2473F9584(v8 > 1, v9 + 1, 1);
          uint64_t v10 = v33;
        }
        ++v5;
        uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v10);
        MEMORY[0x270FA5388](v11);
        uint64_t v13 = (uint64_t *)((char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
        (*(void (**)(uint64_t *))(v14 + 16))(v13);
        uint64_t v15 = *v13;
        uint64_t v30 = v7;
        uint64_t v31 = &off_26FB886F8;
        *(void *)&long long v29 = v15;
        uint64_t v3 = v35;
        *(void *)(v35 + 16) = v9 + 1;
        sub_2473D8200(&v29, v3 + 40 * v9 + 32);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v16 = (void **)(a1 + 32);
      uint64_t v17 = type metadata accessor for ActionSelectorItem();
      do
      {
        uint64_t v18 = *v16;
        uint64_t v33 = v17;
        uint64_t v34 = &off_26FB886F8;
        v32[0] = v18;
        uint64_t v35 = v3;
        unint64_t v20 = *(void *)(v3 + 16);
        unint64_t v19 = *(void *)(v3 + 24);
        id v21 = v18;
        uint64_t v22 = v17;
        if (v20 >= v19 >> 1)
        {
          sub_2473F9584(v19 > 1, v20 + 1, 1);
          uint64_t v22 = v33;
        }
        uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v22);
        MEMORY[0x270FA5388](v23);
        unint64_t v25 = (uint64_t *)((char *)&v28 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
        (*(void (**)(uint64_t *))(v26 + 16))(v25);
        uint64_t v27 = *v25;
        uint64_t v30 = v17;
        uint64_t v31 = &off_26FB886F8;
        *(void *)&long long v29 = v27;
        uint64_t v3 = v35;
        *(void *)(v35 + 16) = v20 + 1;
        sub_2473D8200(&v29, v3 + 40 * v20 + 32);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
        ++v16;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2473D52B8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

void sub_2473D52CC(void **a1, uint64_t a2)
{
  id v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x24C5555B0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = *(void **)(v4 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    if (v6 && (uint64_t v7 = *(void **)(v4 + OBJC_IVAR___BCConfigurationViewController_actionDetailsView)) != 0)
    {
      if (*(unsigned char *)(v4 + OBJC_IVAR___BCConfigurationViewController_isAppeared) == 1)
      {
        uint64_t v8 = *(void *)(v4 + OBJC_IVAR___BCConfigurationViewController_viewModel);
        if (!v8)
        {
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
        uint64_t v9 = *(unsigned __int8 *)(*(void *)(v8 + 168) + 16);
      }
      else
      {
        uint64_t v9 = 0;
      }
      id v12 = v6;
      uint64_t v13 = v7;
      objc_msgSend(v12, sel_selectActionItemWithIndex_animated_, v2, v9);
      uint64_t v14 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl;
      uint64_t v15 = *(void **)&v13[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
      if (v15)
      {
        if (objc_msgSend(v15, sel_currentPage) == v2)
        {
LABEL_15:

LABEL_16:
          return;
        }
        uint64_t v16 = *(void **)&v13[v14];
        if (v16)
        {
          objc_msgSend(v16, sel_setCurrentPage_, v2);
          objc_msgSend(v13, sel_setNeedsLayout);
          goto LABEL_15;
        }
LABEL_21:
        __break(1u);
        return;
      }
    }
    else
    {
      uint64_t v10 = *(void *)(v4 + OBJC_IVAR___BCConfigurationViewController_viewModel);
      if (v10)
      {
        if (*(void *)(*(void *)(v10 + 144) + 16))
        {
          unint64_t v11 = swift_bridgeObjectRetain();
          sub_2473D55A8(v11, (uint64_t)v2);
          swift_bridgeObjectRelease();
        }
        goto LABEL_16;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_20;
  }
}

void sub_2473D5448(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x24C5555B0](v2);
  if (v3)
  {
    uint64_t v4 = (char *)v3;
    uint64_t v5 = *(void **)(v3 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    if (v5)
    {
      uint64_t v6 = *(void *)&v4[OBJC_IVAR___BCConfigurationViewController_viewModel];
      if (!v6)
      {
        __break(1u);
        return;
      }
      if (*(unsigned char *)(*(void *)(v6 + 16) + 16)) {
        uint64_t v7 = &selRef_resumeSceneUpdates;
      }
      else {
        uint64_t v7 = &selRef_pauseSceneUpdates;
      }
      [v5 *v7];
    }
  }
}

void sub_2473D54E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x24C5555B0](v2);
  if (v3)
  {
    uint64_t v4 = (char *)v3;
    uint64_t v5 = *(void **)(v3 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = (char *)objc_msgSend(v6, sel_view);
      if (v7)
      {
        uint64_t v8 = *(void *)&v4[OBJC_IVAR___BCConfigurationViewController_viewModel];
        if (v8)
        {
          uint64_t v9 = v7;
          objc_msgSend(v7, sel_setUserInteractionEnabled_, *(unsigned __int8 *)(*(void *)(v8 + 168) + 16));

          uint64_t v4 = v9;
          goto LABEL_6;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return;
    }
LABEL_6:
  }
}

void sub_2473D55A8(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = OBJC_IVAR___BCConfigurationViewController_viewModel;
  uint64_t v4 = *(void **)&v2[OBJC_IVAR___BCConfigurationViewController_viewModel];
  if (!v4)
  {
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v5 = v4[15];
  if (!v5) {
    return;
  }
  uint64_t v6 = v4[16];
  if (!v6) {
    return;
  }
  uint64_t v7 = v4[17];
  if (!v7) {
    return;
  }
  uint64_t v8 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v11 = sub_2473D4F78(a1);
  uint64_t v12 = *(void *)&v2[v3];
  if (!v12) {
    goto LABEL_47;
  }
  uint64_t v13 = v11;
  uint64_t v14 = *(void *)(v12 + 112);
  objc_allocWithZone((Class)type metadata accessor for ActionDetailsView());
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v15 = sub_24740A958(v13, a2, v14, v5, v6, v7);
  uint64_t v16 = OBJC_IVAR___BCConfigurationViewController_actionDetailsView;
  uint64_t v17 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_actionDetailsView];
  *(void *)&v8[OBJC_IVAR___BCConfigurationViewController_actionDetailsView] = v15;

  uint64_t v18 = *(void *)&v8[OBJC_IVAR___BCConfigurationViewController_mode];
  if (v18 == 1)
  {
    swift_bridgeObjectRetain();
    if (a1 >> 62)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF58);
      sub_24740E490();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24740E5B0();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF58);
    uint64_t v30 = (void *)sub_24740DD60();
    swift_bridgeObjectRelease();
    uint64_t v31 = *(void *)&v8[v16];
    if (!v31) {
      goto LABEL_53;
    }
    id v32 = objc_msgSend(self, sel_settingsSelectorWithActionItems_selectedIndex_detailsView_, v30, a2, v31);

    long long v29 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController];
    *(void *)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController] = v32;
    goto LABEL_20;
  }
  if (v18) {
    goto LABEL_21;
  }
  uint64_t v19 = *(void *)&v8[v3];
  if (!v19)
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  uint64_t v20 = *(void *)(v19 + 96);
  if (v20)
  {
    uint64_t v21 = *(void *)(v19 + 104);
    if (v21)
    {
      objc_allocWithZone((Class)type metadata accessor for WelcomeView());
      swift_retain_n();
      swift_retain_n();
      id v22 = sub_2473E40B0(v20, v21);
      uint64_t v23 = OBJC_IVAR___BCConfigurationViewController_welcomeView;
      uint64_t v24 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_welcomeView];
      *(void *)&v8[OBJC_IVAR___BCConfigurationViewController_welcomeView] = v22;

      swift_bridgeObjectRetain();
      if (a1 >> 62)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF58);
        sub_24740E490();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_24740E5B0();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF58);
      unint64_t v25 = (void *)sub_24740DD60();
      swift_bridgeObjectRelease();
      uint64_t v26 = *(void *)&v8[v23];
      if (!v26) {
        goto LABEL_57;
      }
      uint64_t v27 = *(void *)&v8[v16];
      if (!v27)
      {
LABEL_58:
        __break(1u);
        return;
      }
      id v28 = objc_msgSend(self, sel_assistantSelectorWithActionItems_selectedIndex_welcomeView_detailsView_, v25, a2, v26, v27);

      long long v29 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController];
      *(void *)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController] = v28;
      swift_release();
      swift_release();
LABEL_20:

LABEL_21:
      uint64_t v33 = OBJC_IVAR___BCConfigurationViewController_selectorViewController;
      uint64_t v34 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController];
      if (!v34) {
        goto LABEL_36;
      }
      id v35 = v34;
      objc_msgSend(v8, sel_addChildViewController_, v35);
      id v36 = objc_msgSend(v35, sel_view);
      if (v36)
      {
        uint64_t v37 = v36;
        id v38 = objc_msgSend(v8, sel_view);
        if (v38)
        {
          uint64_t v39 = v38;
          objc_msgSend(v38, sel_frame);
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          double v47 = v46;

          objc_msgSend(v37, sel_setFrame_, v41, v43, v45, v47);
          id v48 = objc_msgSend(v8, sel_view);
          if (v48)
          {
            uint64_t v49 = v48;
            id v50 = objc_msgSend(v35, sel_view);
            if (v50)
            {
              uint64_t v51 = v50;
              objc_msgSend(v49, sel_addSubview_, v50);

              objc_msgSend(v35, sel_didMoveToParentViewController_, v8);
              sub_2473D5C70();
              uint64_t v52 = *(void **)&v8[v33];
              if (!v52)
              {
LABEL_35:
                objc_msgSend(v35, sel_setDelegate_, v8);

LABEL_36:
                swift_release();
                swift_release();
                swift_release();
                uint64_t v60 = *(void *)&v8[v16];
                if (v60)
                {
                  uint64_t v61 = swift_allocObject();
                  swift_unknownObjectWeakInit();
                  uint64_t v62 = (void (**)(uint64_t))(v60
                                                      + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler);
                  uint64_t v63 = *(void *)(v60
                                  + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler);
                  *uint64_t v62 = sub_2473D8198;
                  v62[1] = (void (*)(uint64_t))v61;
                  sub_2473D81A0(v63);
                }
                return;
              }
              uint64_t v53 = *(void *)&v8[v3];
              if (v53)
              {
                if (*(unsigned char *)(*(void *)(v53 + 16) + 16)) {
                  uint64_t v54 = &selRef_resumeSceneUpdates;
                }
                else {
                  uint64_t v54 = &selRef_pauseSceneUpdates;
                }
                [v52 *v54];
                id v55 = *(void **)&v8[v33];
                if (!v55) {
                  goto LABEL_35;
                }
                id v56 = v55;
                id v57 = objc_msgSend(v56, sel_view);
                if (v57)
                {
                  uint64_t v58 = *(void *)&v8[v3];
                  if (v58)
                  {
                    uint64_t v59 = v57;
                    objc_msgSend(v57, sel_setUserInteractionEnabled_, *(unsigned __int8 *)(*(void *)(v58 + 168) + 16));

                    goto LABEL_35;
                  }
                  goto LABEL_56;
                }
LABEL_55:
                __break(1u);
LABEL_56:
                __break(1u);
LABEL_57:
                __break(1u);
                goto LABEL_58;
              }
LABEL_54:
              __break(1u);
              goto LABEL_55;
            }
            goto LABEL_51;
          }
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
LABEL_49:
        __break(1u);
        goto LABEL_50;
      }
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }
  }
  swift_release();
  swift_release();
  swift_release();
}

void sub_2473D5BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x24C5555B0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = *(void **)(v4 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    id v7 = v6;

    if (v6)
    {
      objc_msgSend(v7, sel_selectActionItemWithIndex_animated_, a1, 1);
    }
  }
}

void sub_2473D5C70()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
  if (!v1) {
    return;
  }
  uint64_t v2 = v0 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides;
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides);
  if (v3 == 1) {
    return;
  }
  if (!*(void *)(v2 + 8))
  {
    id v8 = v1;
    sub_2473D5EE8(v3);
    uint64_t v6 = 0;
    if (v3) {
      goto LABEL_6;
    }
LABEL_8:
    sub_2473D5EA4(0);
    id v9 = 0;
    goto LABEL_9;
  }
  id v4 = v1;
  sub_2473D5EE8(v3);
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_2473D71B0(v5);
  swift_bridgeObjectRelease();
  type metadata accessor for ABDeviceSceneParameter(0);
  sub_2473CF248(0, &qword_26924BE88);
  sub_2473D8048(&qword_26924BE90, type metadata accessor for ABDeviceSceneParameter);
  uint64_t v6 = (void *)sub_24740DC70();
  swift_release();
  if (!v3) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_2473D71B0(v7);
  swift_bridgeObjectRelease();
  sub_2473D5EA4(v3);
  type metadata accessor for ABDeviceSceneParameter(0);
  sub_2473CF248(0, &qword_26924BE88);
  sub_2473D8048(&qword_26924BE90, type metadata accessor for ABDeviceSceneParameter);
  id v9 = (id)sub_24740DC70();
  swift_release();
LABEL_9:
  objc_msgSend(v1, sel_overrideSceneParamsWithZoomedOutParams_zoomedInParams_, v6, v9, v9);
}

uint64_t sub_2473D5EA4(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2473D5EE8(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2473D5F30(uint64_t a1, unint64_t a2)
{
  return sub_2473D7718(a2);
}

uint64_t sub_2473D5FA4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  v27[0] = a1;
  uint64_t v13 = type metadata accessor for GroupedParameterConfigurationView();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v27 - v17;
  uint64_t result = MEMORY[0x24C5555B0](v7);
  if (result)
  {
    uint64_t v20 = (void *)result;
    sub_2473D7B68();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a5;
    *(void *)(v21 + 24) = a6;
    sub_2473D7B7C((uint64_t)v29, v21 + 32);
    *(void *)&v18[*(int *)(v13 + 32)] = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF40);
    swift_storeEnumTagMultiPayload();
    *(void *)uint64_t v18 = v27[0];
    *((void *)v18 + 1) = a2;
    *((void *)v18 + 2) = a4;
    v27[1] = a3;
    id v22 = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF48);
    sub_24740DB80();
    *(_OWORD *)(v18 + 24) = v28;
    *((void *)v18 + 5) = sub_2473D8490;
    *((void *)v18 + 6) = v21;
    sub_2473D27D8((uint64_t)v18, (uint64_t)v16);
    id v23 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26924BF50));
    uint64_t v24 = (void *)sub_24740D9E0();
    objc_msgSend(v24, sel_setOverrideUserInterfaceStyle_, 2);
    id v25 = objc_msgSend(v24, sel_presentationController);
    if (v25)
    {
      uint64_t v26 = v25;
      objc_msgSend(v25, sel_setDelegate_, v20);
    }
    objc_msgSend(v20, sel_presentViewController_animated_completion_, v24, 1, 0, v27[0]);

    return sub_2473D8104((uint64_t)v18);
  }
  return result;
}

void sub_2473D61F0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = sub_24740D580();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v32[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v32[3] = &type metadata for Features;
  v32[4] = sub_2473D7BAC();
  char v14 = sub_24740D4F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  if (v14)
  {
    uint64_t v15 = MEMORY[0x24C5555B0](v5);
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      sub_2473D7B68();
      uint64_t v17 = (void *)swift_allocObject();
      v17[2] = a2;
      v17[3] = a3;
      sub_2473D7B7C((uint64_t)v32, (uint64_t)(v17 + 4));
      v17[5] = a4;
      v17[6] = a5;
      objc_allocWithZone((Class)type metadata accessor for ControlPickerViewController());
      swift_retain();
      swift_retain();
      id v18 = sub_2473DE9EC((uint64_t)sub_2473D7C48, (uint64_t)v17);
      objc_msgSend(v18, sel_setOverrideUserInterfaceStyle_, 2);
      id v19 = v18;
      if (a1)
      {
        id v20 = a1;
        id v21 = objc_msgSend(v20, sel_controlType);
        id v22 = objc_msgSend(v21, sel_unsignedIntegerValue);

        id v23 = objc_allocWithZone(MEMORY[0x263F33CF0]);
        id v24 = sub_2473DA1C0();
      }
      objc_msgSend(v18, sel_setSelectedControl_, 0);

      id v25 = objc_msgSend(v18, sel_sheetPresentationController);
      if (v25)
      {
        id v26 = v25;
        MEMORY[0x24C5546E0]();
        sub_24740D570();
        MEMORY[0x24C5546F0](v13);

        sub_24740DFF0();
        objc_msgSend(v26, sel_setPrefersGrabberVisible_, 1);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF18);
        uint64_t v27 = swift_allocObject();
        *(_OWORD *)(v27 + 16) = xmmword_24740FD50;
        sub_2473CF248(0, &qword_26924BF20);
        *(void *)(v27 + 32) = sub_24740E010();
        v32[0] = v27;
        sub_24740DD90();
        long long v28 = (void *)sub_24740DD60();
        swift_bridgeObjectRelease();
        objc_msgSend(v26, sel_setDetents_, v28);
      }
      id v29 = objc_msgSend(v18, sel_presentationController);
      if (v29)
      {
        uint64_t v30 = v29;
        objc_msgSend(v29, sel_setDelegate_, v16);
      }
      objc_msgSend(v16, sel_presentViewController_animated_completion_, v18, 1, 0);
    }
  }
}

double sub_2473D6574(void *a1)
{
  objc_msgSend(a1, sel_maximumDetentValue);
  return v1 * 0.83;
}

void sub_2473D65A8(void *a1, long long *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = MEMORY[0x24C5555B0](v5);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    long long v22 = *a2;
    sub_2473D7AD4((uint64_t)(a2 + 1), (uint64_t)v21);
    sub_2473D7AD4((uint64_t)(a2 + 2), (uint64_t)v20);
    objc_allocWithZone((Class)type metadata accessor for ControlConfigurationViewController());
    id v12 = a1;
    sub_2473D7B3C((uint64_t)&v22);
    sub_2473D7B3C((uint64_t)v21);
    sub_2473D7B3C((uint64_t)v20);
    uint64_t v13 = (char *)sub_2473DE060(v12, a2);
    objc_msgSend(v13, sel_setOverrideUserInterfaceStyle_, 2);
    sub_2473D7B68();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a3;
    *(void *)(v14 + 24) = a4;
    sub_2473D7B7C((uint64_t)v19, v14 + 32);
    uint64_t v15 = (uint64_t (**)(void *))&v13[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler];
    uint64_t v16 = *(void *)&v13[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler];
    *uint64_t v15 = sub_2473D7B8C;
    v15[1] = (uint64_t (*)(void *))v14;
    swift_retain();
    sub_2473D81A0(v16);
    id v17 = objc_msgSend(v13, sel_presentationController);
    if (v17)
    {
      id v18 = v17;
      objc_msgSend(v17, sel_setDelegate_, v11);
    }
    objc_msgSend(v11, sel_presentViewController_animated_completion_, v13, 1, 0);
  }
}

uint64_t sub_2473D6744(void *a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    id v6 = a1;
    a2();
  }
  uint64_t result = MEMORY[0x24C5555B0](a4);
  if (result)
  {
    id v8 = (char *)result;
    uint64_t v9 = OBJC_IVAR___BCConfigurationViewController_viewModel;
    if (*(void *)(result + OBJC_IVAR___BCConfigurationViewController_viewModel))
    {
      swift_retain();
      sub_24740D680();
      uint64_t result = swift_release();
      if (*(void *)&v8[v9])
      {
        swift_retain();
        sub_24740D680();

        return swift_release();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_2473D680C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  id v8 = (char *)MEMORY[0x24C5555B0](v4);
  if (v8)
  {
    uint64_t v9 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController];
    if (v9)
    {
      id v16 = v8;
      uint64_t v10 = v9;
      objc_msgSend(v10, sel_setModalPresentationStyle_, 2);
      swift_unknownObjectWeakAssign();
      objc_msgSend(v10, sel_setSelectedAction_, a1);
      sub_2473D7B68();
      uint64_t v11 = swift_allocObject();
      sub_2473D7B7C((uint64_t)v18, v11 + 16);
      *(void *)(v11 + 24) = a2;
      *(void *)(v11 + 32) = a3;
      id v12 = (void (**)(void *, char))&v10[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler];
      uint64_t v13 = *(void *)&v10[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler];
      unsigned char *v12 = sub_2473D7FF8;
      v12[1] = (void (*)(void *, char))v11;
      swift_retain();
      sub_2473D81A0(v13);
      id v14 = objc_msgSend(v10, sel_presentationController);
      if (v14)
      {
        uint64_t v15 = v14;
        objc_msgSend(v14, sel_setDelegate_, v16);
      }
      objc_msgSend(v16, sel_presentViewController_animated_completion_, v10, 1, 0, v16);
    }
    else
    {
    }
  }
}

void sub_2473D69A8(void *a1, char a2, uint64_t a3, void (*a4)(char *, uint64_t))
{
  id v32 = a4;
  uint64_t v33 = sub_24740DC00();
  uint64_t v36 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  id v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24740DC30();
  uint64_t v34 = *(void *)(v9 - 8);
  uint64_t v35 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24740DC50();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  id v18 = (char *)v31 - v17;
  uint64_t v37 = a3;
  uint64_t v19 = MEMORY[0x24C5555B0](a3);
  if (v19)
  {
    id v20 = (void *)v19;
    if (a2)
    {
      sub_2473CF248(0, (unint64_t *)&qword_26B12BB40);
      v31[0] = sub_24740DF30();
      sub_24740DC40();
      MEMORY[0x24C554370](v16, 0.01);
      long long v22 = *(void (**)(char *, uint64_t))(v13 + 8);
      v31[1] = v13 + 8;
      id v32 = v22;
      v22(v16, v12);
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = v20;
      aBlock[4] = sub_2473D8040;
      aBlock[5] = v23;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2473D6EC8;
      aBlock[3] = &block_descriptor_0;
      id v24 = _Block_copy(aBlock);
      id v25 = v20;
      swift_release();
      sub_24740DC20();
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_2473D8048(&qword_26924BF28, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF30);
      sub_2473D3668(&qword_26924BF38, &qword_26924BF30);
      uint64_t v26 = v33;
      sub_24740E260();
      uint64_t v27 = (void *)v31[0];
      MEMORY[0x24C5545F0](v18, v11, v8, v24);
      _Block_release(v24);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v26);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v35);
      v32(v18, v12);
    }
    else
    {
      id v21 = a1;
      ((void (*)(id))v32)(v21);
      sub_2473D8090(a1);
    }
    uint64_t v28 = MEMORY[0x24C5555B0](v37);
    if (v28)
    {
      id v29 = (char *)v28;
      uint64_t v30 = OBJC_IVAR___BCConfigurationViewController_viewModel;
      if (*(void *)(v28 + OBJC_IVAR___BCConfigurationViewController_viewModel))
      {
        swift_retain();
        sub_24740D680();
        swift_release();
        if (*(void *)&v29[v30])
        {
          swift_retain();
          sub_24740D680();

          swift_release();
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    else
    {
    }
  }
}

void sub_2473D6E2C(uint64_t a1)
{
  if (*(void *)(a1 + OBJC_IVAR___BCConfigurationViewController_mode) == 1) {
    uint64_t v2 = (id *)MEMORY[0x263F87B98];
  }
  else {
    uint64_t v2 = (id *)MEMORY[0x263F87B90];
  }
  id v3 = *v2;
  id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ShortcutsConfigurationViewController()), sel_initWithConfigurationContext_, v3);

  uint64_t v5 = *(void **)(a1 + OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController);
  *(void *)(a1 + OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController) = v4;
}

uint64_t sub_2473D6EC8(uint64_t a1)
{
  double v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id ConfigurationViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void ConfigurationViewController.init(nibName:bundle:)()
{
}

void sub_2473D6FE8()
{
  swift_release();
  swift_release();

  sub_2473D5EA4(*(void *)(v0 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides));
  swift_bridgeObjectRelease();

  double v1 = *(void **)(v0 + OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor);
}

id ConfigurationViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t DeviceSceneParameters.zoomedInParameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DeviceSceneParameters.zoomedOutParameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DeviceSceneParameters.init(zoomedInParameters:zoomedOutParameters:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

void *sub_2473D71B0(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF60);
  uint64_t result = (void *)sub_24740E4B0();
  id v3 = result;
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v22 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v23 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = (char *)(result + 8);
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    uint64_t v15 = *(void **)(*(void *)(a1 + 48) + 8 * i);
    double v16 = *(double *)(*(void *)(a1 + 56) + 8 * i);
    id v17 = objc_allocWithZone(NSNumber);
    id v18 = v15;
    uint64_t result = objc_msgSend(v17, sel_initWithDouble_, v16);
    *(void *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    *(void *)(v3[6] + 8 * i) = v18;
    *(void *)(v3[7] + 8 * i) = result;
    uint64_t v19 = v3[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v21;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v23) {
      return v3;
    }
    unint64_t v13 = *(void *)(v22 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v23) {
        return v3;
      }
      unint64_t v13 = *(void *)(v22 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v23) {
          return v3;
        }
        unint64_t v13 = *(void *)(v22 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v23) {
    return v3;
  }
  unint64_t v13 = *(void *)(v22 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v23) {
      return v3;
    }
    unint64_t v13 = *(void *)(v22 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_2473D73C8(char a1, uint64_t a2, uint64_t a3)
{
  char v5 = a1 & 1;
  v15[3] = &type metadata for ConfigurationViewController.Router;
  v15[4] = &off_26FB87FA8;
  v15[0] = swift_allocObject();
  sub_2473D7B7C(a2, v15[0] + 16);
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C010);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF88);
  swift_allocObject();
  swift_retain();
  *(void *)(v6 + 24) = sub_24740D6B0();
  *(void *)(a3 + 144) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C018);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(unsigned char *)(v7 + 24) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFB8);
  swift_allocObject();
  *(void *)(v7 + 32) = sub_24740D6B0();
  *(void *)(a3 + 152) = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C020);
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFE8);
  swift_allocObject();
  *(void *)(v8 + 24) = sub_24740D6B0();
  *(void *)(a3 + 160) = v8;
  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = 0;
  swift_allocObject();
  *(void *)(v9 + 24) = sub_24740D6B0();
  *(void *)(a3 + 168) = v9;
  *(void *)(a3 + 240) = MEMORY[0x263F8EE88];
  *(unsigned char *)(a3 + 176) = v5;
  sub_2473D83C0((uint64_t)v15, a3 + 184);
  type metadata accessor for ControlAttributesStore();
  unint64_t v10 = (_OWORD *)swift_allocObject();
  v10[1] = 0u;
  void v10[2] = 0u;
  v10[3] = 0u;
  v10[4] = 0u;
  *(void *)(a3 + 232) = v10;
  type metadata accessor for ActionStore();
  swift_allocObject();
  uint64_t v11 = swift_retain();
  uint64_t v12 = sub_2473FD00C(v11, v5);
  swift_release();
  *(void *)(a3 + 224) = v12;
  swift_release();
  unint64_t v13 = sub_2473E9E18();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v13;
}

void sub_2473D7634()
{
  *(void *)&v0[OBJC_IVAR___BCConfigurationViewController_viewModel] = 0;
  *(void *)&v0[OBJC_IVAR___BCConfigurationViewController_selectorViewController] = 0;
  *(void *)&v0[OBJC_IVAR___BCConfigurationViewController_welcomeView] = 0;
  *(void *)&v0[OBJC_IVAR___BCConfigurationViewController_actionDetailsView] = 0;
  *(_OWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides] = xmmword_24740FD40;
  *(void *)&v0[OBJC_IVAR___BCConfigurationViewController_cancellableBag] = MEMORY[0x263F8EE88];
  *(void *)&v0[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController] = 0;
  *(void *)&v0[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor] = 0;
  v0[OBJC_IVAR___BCConfigurationViewController_isAppeared] = 0;

  sub_24740E480();
  __break(1u);
}

unint64_t sub_2473D7718(unint64_t result)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___BCConfigurationViewController_viewModel);
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v3 = *(void *)(*(void *)(*(void *)(v2 + 224) + 16) + 16);
  if (!v3) {
    return result;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)(v3 + 16) <= result)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v4 = v3 + 24 * result;
  char v5 = *(void **)(v4 + 32);
  uint64_t v6 = *(void *)(v4 + 40);
  char v7 = *(unsigned char *)(v4 + 48);
  swift_retain();
  sub_2473D8260(v5, v6, v7);
  sub_2473F2C5C(v5, v6, v7, 1);
  sub_2473D82EC(v5, v6, v7);
  return swift_release();
}

unint64_t sub_2473D77F8()
{
  unint64_t result = qword_26924BE98;
  if (!qword_26924BE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BE98);
  }
  return result;
}

uint64_t method lookup function for ConfigurationViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConfigurationViewController);
}

uint64_t dispatch thunk of ConfigurationViewController.__allocating_init(mode:dismissHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t dispatch thunk of ConfigurationViewController.updateSceneParameterOverrides(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of ConfigurationViewController.actionSelectorViewController(_:didSelectItemAt:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

ValueMetadata *type metadata accessor for ConfigurationViewController.Mode()
{
  return &type metadata for ConfigurationViewController.Mode;
}

uint64_t destroy for DeviceSceneParameters()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s27ActionButtonConfigurationUI21DeviceSceneParametersVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DeviceSceneParameters(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for DeviceSceneParameters(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceSceneParameters(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for DeviceSceneParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceSceneParameters()
{
  return &type metadata for DeviceSceneParameters;
}

uint64_t sub_2473D7AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C130);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473D7B3C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2473D7B68()
{
  return swift_unknownObjectWeakCopyInit();
}

uint64_t sub_2473D7B7C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0608](a2, a1);
}

uint64_t sub_2473D7B8C(void *a1)
{
  return sub_2473D6744(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), v1 + 32);
}

unint64_t sub_2473D7BAC()
{
  unint64_t result = qword_26924BF10;
  if (!qword_26924BF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BF10);
  }
  return result;
}

uint64_t sub_2473D7C00()
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

char *sub_2473D7C48(void *a1, char a2)
{
  uint64_t v3 = sub_2473D7C8C(a1, a2 & 1, *(void (**)(id))(v2 + 16), *(void *)(v2 + 24), v2 + 32, *(void *)(v2 + 40));
  sub_2473D7FA8((uint64_t)v3);
  return v3;
}

char *sub_2473D7C8C(id a1, char a2, void (*a3)(id), uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    id v9 = a1;
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24740D560();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B12B938);
    id v11 = a1;
    id v12 = a1;
    unint64_t v13 = sub_24740D540();
    os_log_type_t v14 = sub_24740DE90();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      double v16 = (void *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v23 = v21;
      *(_DWORD *)uint64_t v15 = 136315394;
      sub_2474096F8(0xD00000000000001BLL, 0x80000002474116D0, &v23);
      sub_24740E220();
      *(_WORD *)(v15 + 12) = 2112;
      id v17 = a1;
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
      sub_24740E220();
      void *v16 = v22;
      sub_2473D8090(a1);
      sub_2473D8090(a1);
      _os_log_impl(&dword_2473C9000, v13, v14, "%s finished with error: %@", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v16, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v21, -1, -1);
      MEMORY[0x24C5554B0](v15, -1, -1);

      sub_2473D8090(a1);
    }
    else
    {
      sub_2473D8090(a1);
      sub_2473D8090(a1);
    }
  }
  else if (a1)
  {
    a3(a1);
    sub_2473D8090(a1);
  }
  unint64_t result = (char *)MEMORY[0x24C5555B0](a5);
  if (!result) {
    return (char *)a6;
  }
  uint64_t v19 = result;
  uint64_t v20 = OBJC_IVAR___BCConfigurationViewController_viewModel;
  if (*(void *)&result[OBJC_IVAR___BCConfigurationViewController_viewModel])
  {
    swift_retain();
    sub_24740D680();
    unint64_t result = (char *)swift_release();
    if (*(void *)&v19[v20])
    {
      swift_retain();
      sub_24740D680();

      swift_release();
      return (char *)a6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2473D7FA8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2473D7FB8()
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2473D7FF8(void *a1, char a2)
{
  sub_2473D69A8(a1, a2 & 1, v2 + 16, *(void (**)(char *, uint64_t))(v2 + 24));
}

uint64_t sub_2473D8008()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2473D8040()
{
  sub_2473D6E2C(*(void *)(v0 + 16));
}

uint64_t sub_2473D8048(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2473D8090(id a1)
{
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2473D80E0()
{
  return sub_24740D950();
}

uint64_t sub_2473D8104(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GroupedParameterConfigurationView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2473D8160()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2473D8198(uint64_t a1)
{
  sub_2473D5BE0(a1, v1);
}

uint64_t sub_2473D81A0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
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

uint64_t sub_2473D8200(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2473D8218()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473D8250()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

id sub_2473D8260(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u)
  {
    uint64_t v3 = a3;
    if (a3 > 3uLL) {
      uint64_t v3 = 0;
    }
    return ((id (*)(id))((char *)&loc_2473D8284 + (int)funcs_2473D828C[v3]))(result);
  }
  return result;
}

id sub_2473D8290(id a1)
{
  return a1;
}

uint64_t sub_2473D82A4(void *a1)
{
  id v1 = a1;
  return swift_bridgeObjectRetain();
}

void sub_2473D82EC(id a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u)
  {
    uint64_t v3 = a3;
    if (a3 > 3uLL) {
      uint64_t v3 = 0;
    }
    ((void (*)(id))((char *)&loc_2473D8310 + (int)funcs_2473D8318[v3]))(a1);
  }
}

void sub_2473D831C(id a1)
{
}

uint64_t sub_2473D8330(void *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473D8378(uint64_t a1)
{
  return a1;
}

void sub_2473D83A0(unint64_t *a1)
{
  sub_2473D4D68(a1, v1);
}

void sub_2473D83A8(void **a1)
{
  sub_2473D52CC(a1, v1);
}

void sub_2473D83B0(uint64_t a1)
{
  sub_2473D5448(a1, v1);
}

void sub_2473D83B8(uint64_t a1)
{
  sub_2473D54E4(a1, v1);
}

uint64_t sub_2473D83C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t assignWithCopy for ConfigurationViewController.Router()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t initializeWithTake for ConfigurationViewController.Router(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0608](a1, a2);
}

uint64_t assignWithTake for ConfigurationViewController.Router()
{
  return MEMORY[0x270FA0600]();
}

uint64_t getEnumTagSinglePayload for ConfigurationViewController.Router(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ConfigurationViewController.Router(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationViewController.Router()
{
  return &type metadata for ConfigurationViewController.Router;
}

uint64_t sub_2473D8498()
{
  uint64_t v0 = sub_24740D470();
  MEMORY[0x270FA5388](v0 - 8);
  sub_24740D460();
  uint64_t result = sub_24740DD00();
  qword_26924C030 = result;
  *(void *)algn_26924C038 = v2;
  return result;
}

uint64_t sub_2473D852C(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  void v8[2] = v5;
  return sub_2473D9E1C(v7, v8) & 1;
}

uint64_t sub_2473D8574(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  sub_2473D9DDC();
  return sub_24740E040() & (v2 == v3);
}

uint64_t sub_2473D85C8()
{
  if (*(void *)(v0 + 72))
  {
    uint64_t v1 = *(void *)(v0 + 72);
  }
  else
  {
    uint64_t v2 = v0;
    if (qword_26924BAC8 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C110);
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_24740D6B0();
    *(void *)(v2 + 72) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_2473D86A8(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v2 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v4 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v6 = v1[7];
  sub_2473D31D0(a1, (uint64_t)(v1 + 2), &qword_26924C120);
  sub_2473D9FC4(v3, v2);
  sub_2473DA014(v3, v2);
  uint64_t v8 = v1[3];
  if (v8)
  {
    uint64_t v9 = v1[2];
    uint64_t v10 = v1[4];
    uint64_t v11 = v1[5];
    uint64_t v12 = v1[6];
    uint64_t v13 = v1[7];
    if (v2)
    {
      v19[0] = v3;
      v19[1] = v2;
      v19[2] = v5;
      v19[3] = v4;
      v19[4] = v7;
      v19[5] = v6;
      uint64_t v17 = v9;
      v18[0] = v9;
      v18[1] = v8;
      v18[2] = v10;
      void v18[3] = v11;
      v18[4] = v12;
      v18[5] = v13;
      if (sub_2473D9E1C(v18, v19)) {
        goto LABEL_4;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v16 = v17;
    }
    else
    {
      uint64_t v15 = v1[2];
      sub_2473D9FC4(v9, v8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v16 = v15;
      sub_2473DA014(v15, v8);
      sub_2473DA014(v3, 0);
    }
    sub_2473D85C8();
    sub_24740D6A0();
    swift_release();
    sub_2473DA014(v16, v8);
    return sub_2473DA014(v3, v2);
  }
LABEL_4:
  return sub_2473DA014(v3, v2);
}

uint64_t sub_2473D88E8(void *a1, uint64_t a2)
{
  uint64_t v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C0D0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C0D8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a1;
  v13[4] = v18;
  v13[5] = v11;
  id v14 = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C0E0);
  sub_2473D3668(&qword_26924C0E8, &qword_26924C0E0);
  sub_24740D720();
  sub_2473D3668(&qword_26924C0F0, &qword_26924C0D0);
  swift_retain_n();
  sub_24740D750();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_2473D3668(&qword_26924C0F8, &qword_26924C0D8);
  uint64_t v15 = sub_24740D730();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  return v15;
}

uint64_t sub_2473D8C18@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C100);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t v10 = sub_2473D8EA0(a1, a2);
    uint64_t v11 = *(void **)&v10[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance];
    sub_2473D9288(v15);
    v18[0] = v15[0];
    v18[1] = v15[1];
    long long v19 = v16;
    long long v20 = v17;
    sub_2473D86A8((uint64_t)v18);
    if ((v10[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] & 1) == 0)
    {
      v10[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] = 1;
      objc_msgSend(v11, sel_registerObserver_, v10);
      objc_msgSend(v11, sel_activate);
    }
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    v14[1] = sub_2473D85C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C110);
    sub_2473D3668(&qword_26924C118, &qword_26924C110);
    uint64_t v12 = sub_24740D730();
    swift_release();

    uint64_t result = swift_release();
  }
  else
  {
    sub_24740D700();
    sub_2473D3668(&qword_26924C108, &qword_26924C100);
    uint64_t v12 = sub_24740D730();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  *a3 = v12;
  return result;
}

char *sub_2473D8EA0(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(char **)(v2 + 64);
  if (v6)
  {
    uint64_t v7 = *(void **)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_control];
    uint64_t v8 = *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_control
                      + 8];
    sub_2473D9DDC();
    uint64_t v9 = v6;
    id v10 = v7;
    char v11 = sub_24740E040();

    if ((v11 & 1) != 0 && v8 == a2) {
      return v9;
    }

    uint64_t v13 = *(void *)(v3 + 64);
    if (v13
      && *(unsigned char *)(v13
                  + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) == 1)
    {
      *(unsigned char *)(v13
               + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) = 0;
      objc_msgSend(*(id *)(v13+ OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance), sel_unregisterObserver_);
    }
  }
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  id v15 = objc_allocWithZone((Class)type metadata accessor for ControlObserver());
  id v16 = a1;
  id v17 = sub_2473DA06C(v16, a2, (uint64_t)sub_2473DA064, v14);

  swift_release();
  uint64_t v18 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v17;

  uint64_t result = *(char **)(v3 + 64);
  if (result)
  {
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2473D901C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x24C5555B0](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (*(unsigned char *)(v3
                  + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) == 1)
    {
      *(unsigned char *)(v3
               + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) = 0;
      objc_msgSend(*(id *)(v3+ OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance), sel_unregisterObserver_, v3);
    }
  }
}

void sub_2473D90A0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C5555B0](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    if (*(unsigned char *)(v2
                  + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) == 1)
    {
      *(unsigned char *)(v2
               + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) = 0;
      objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance), sel_unregisterObserver_, v2);
    }
  }
}

uint64_t sub_2473D9124(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = (uint64_t)(a1 + 4);
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    v14[0] = v2;
    v14[1] = v3;
    void v14[2] = v5;
    v14[3] = v6;
    v14[4] = v8;
    v14[5] = v9;
    long long v13 = *(_OWORD *)a1;
    sub_2473D31D0(v4, (uint64_t)v12, (uint64_t *)&unk_26924C130);
    sub_2473D31D0(v7, (uint64_t)v11, (uint64_t *)&unk_26924C130);
    sub_2473D7B3C((uint64_t)&v13);
    sub_2473D7B3C((uint64_t)v12);
    sub_2473D7B3C((uint64_t)v11);
    sub_2473D86A8((uint64_t)v14);
    return swift_release();
  }
  return result;
}

uint64_t sub_2473D9214()
{
  sub_2473DA014(*(void *)(v0 + 16), *(void *)(v0 + 24));

  swift_release();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t type metadata accessor for ControlAttributesStore()
{
  return self;
}

void sub_2473D9288(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2473D99C0();
  uint64_t v6 = v5;
  id v7 = objc_msgSend(v2, sel_descriptor);
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(v7, sel_displayName);

    if (v9)
    {
      uint64_t v8 = (void *)sub_24740DCF0();
      uint64_t v11 = v10;

      goto LABEL_6;
    }
    uint64_t v8 = 0;
  }
  uint64_t v11 = 0;
LABEL_6:
  id v12 = objc_msgSend(v2, sel_descriptor);
  long long v13 = v12;
  if (!v12)
  {
LABEL_10:
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  id v14 = objc_msgSend(v12, sel_widgetDescription);

  if (!v14)
  {
    long long v13 = 0;
    goto LABEL_10;
  }
  long long v13 = (void *)sub_24740DCF0();
  uint64_t v16 = v15;

LABEL_11:
  *a1 = v4;
  a1[1] = v6;
  a1[2] = (uint64_t)v8;
  a1[3] = v11;
  a1[4] = (uint64_t)v13;
  a1[5] = v16;
}

id sub_2473D93A0()
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (v0[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] == 1)
  {
    v0[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] = 0;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance], sel_unregisterObserver_, v0);
  }
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ControlObserver()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for Control(void *a1, uint64_t a2)
{
  objc_super v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for Control(id *a1)
{
}

uint64_t assignWithCopy for Control(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for Control(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for Control(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Control(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Control()
{
  return &type metadata for Control;
}

uint64_t destroy for ControlAttributes()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ControlAttributes(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ControlAttributes(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

void *assignWithTake for ControlAttributes(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MenuItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MenuItem(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlAttributes()
{
  return &type metadata for ControlAttributes;
}

uint64_t sub_2473D99C0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C128);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = sub_2473D9C94();
  if (v5 && (id v6 = objc_msgSend(v5, sel_title), swift_unknownObjectRelease(), v6)
    || (id v7 = objc_msgSend(v0, sel_descriptor)) != 0
    && (v8 = v7, id v6 = objc_msgSend(v7, sel_displayName), v8, v6))
  {
    uint64_t v9 = sub_24740DCF0();
  }
  else
  {
    id v10 = objc_msgSend(v0, sel_control);
    uint64_t v11 = (char *)objc_msgSend(v10, sel_extensionIdentity);

    id v12 = &v11[*MEMORY[0x263F31DA8]];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v12, v1);

    sub_24740D510();
    id v13 = objc_allocWithZone(MEMORY[0x263F01858]);
    id v14 = sub_2473D9D10();
    id v15 = objc_msgSend(v14, sel_containingBundleRecord);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    if (v15)
    {
      id v16 = objc_msgSend(v15, sel_localizedName);

      uint64_t v9 = sub_24740DCF0();
    }
    else
    {
      if (qword_26924BAC8 != -1) {
        swift_once();
      }
      uint64_t v9 = qword_26924C030;
      swift_bridgeObjectRetain();
    }
  }
  return v9;
}

id sub_2473D9C94()
{
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result) {
    return objc_msgSend(result, sel_viewModel);
  }
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result) {
    return objc_msgSend(result, sel_viewModel);
  }
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result) {
    return objc_msgSend(result, sel_viewModel);
  }
  return result;
}

id sub_2473D9D10()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_24740D450();

    swift_willThrow();
  }
  return v2;
}

unint64_t sub_2473D9DDC()
{
  unint64_t result = qword_26924C0C8;
  if (!qword_26924C0C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26924C0C8);
  }
  return result;
}

uint64_t sub_2473D9E1C(void *a1, void *a2)
{
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    char v5 = sub_24740E5A0();
    uint64_t result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  uint64_t v7 = a1[3];
  uint64_t v8 = a2[3];
  if (!v7)
  {
    if (v8) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v8) {
    return 0;
  }
  BOOL v9 = a1[2] == a2[2] && v7 == v8;
  if (v9 || (v10 = sub_24740E5A0(), uint64_t result = 0, (v10 & 1) != 0))
  {
LABEL_15:
    uint64_t v11 = a1[5];
    uint64_t v12 = a2[5];
    if (v11)
    {
      if (v12 && (a1[4] == a2[4] && v11 == v12 || (sub_24740E5A0() & 1) != 0)) {
        return 1;
      }
    }
    else if (!v12)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_2473D9EF0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473D9F28()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473D9F60()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2473D9FA8@<X0>(uint64_t *a1@<X8>)
{
  return sub_2473D8C18(*(void **)(v1 + 24), *(void *)(v1 + 32), a1);
}

void sub_2473D9FB4(uint64_t a1)
{
  sub_2473D901C(a1, v1);
}

void sub_2473D9FBC()
{
  sub_2473D90A0(v0);
}

uint64_t sub_2473D9FC4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2473DA014(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2473DA064(uint64_t *a1)
{
  return sub_2473D9124(a1);
}

id sub_2473DA06C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v5[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] = 0;
  uint64_t v11 = &v5[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_control];
  *uint64_t v11 = a1;
  v11[1] = a2;
  id v12 = objc_allocWithZone(MEMORY[0x263F31E00]);
  id v13 = v5;
  id v14 = objc_msgSend(v12, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, a1, 1, 0, 0);
  id v15 = objc_msgSend(self, sel_instanceOfType_instanceIdentity_, a2, v14);

  *(void *)&v13[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance] = v15;
  id v16 = &v13[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_updateHandler];
  *(void *)id v16 = a3;
  *((void *)v16 + 1) = a4;
  swift_retain();

  v18.receiver = v13;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t sub_2473DA190(uint64_t a1)
{
  return a1;
}

id sub_2473DA1C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C350);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C128);
  MEMORY[0x270FA5388](v5 - 8);
  id v6 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  sub_24740DCF0();

  sub_24740D500();
  id v7 = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (!v7)
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C360);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 1, 1, v11);
    goto LABEL_5;
  }

  id result = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (result)
  {
    BOOL v9 = result;
    sub_24740DCF0();

    sub_24740D500();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C360);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 0, 1, v10);
LABEL_5:
    sub_24740DF70();
    id v12 = (void *)sub_24740DF60();
    id v13 = objc_msgSend(v1, sel_kind);
    sub_24740DCF0();

    id v14 = objc_msgSend(v1, sel_intent);
    id v15 = objc_allocWithZone(MEMORY[0x263F31DF8]);
    id v16 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v15, sel_initWithExtensionIdentity_kind_intent_, v12, v16, v14);

    return v17;
  }
  __break(1u);
  return result;
}

id sub_2473DA474(void *a1)
{
  id v2 = objc_msgSend(a1, sel_identity);
  id v3 = objc_msgSend(v2, sel_intentReference);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v3, sel_intent);
  }
  else
  {
    id v5 = 0;
  }
  id v6 = (void *)sub_24740DCC0();
  id v7 = objc_msgSend(v2, sel_extensionIdentity);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C128);
  sub_24740D510();
  uint64_t v8 = (void *)sub_24740DCC0();
  swift_endAccess();
  swift_bridgeObjectRelease();

  BOOL v9 = (char *)objc_msgSend(v2, sel_extensionIdentity);
  uint64_t v10 = &v9[*MEMORY[0x263F31DA0]];
  swift_beginAccess();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C360);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
  {
    swift_endAccess();

    id v12 = 0;
  }
  else
  {
    sub_24740D510();
    swift_endAccess();

    id v12 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
  }
  id v13 = objc_msgSend(v2, sel_kind);
  if (!v13)
  {
    sub_24740DCF0();
    id v13 = (id)sub_24740DCC0();
    swift_bridgeObjectRelease();
  }
  id v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v15 = objc_msgSend(a1, sel_type);
  id v16 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, v15);
  id v17 = objc_msgSend(v14, sel_initWithIntent_named_extensionBundleIdentifier_containerBundleIdentifier_kind_controlType_, v5, v6, v8, v12, v13, v16);

  return v17;
}

id sub_2473DA730(void *a1)
{
  id v2 = v1;
  id v4 = objc_msgSend(v1, sel_name);
  uint64_t v24 = sub_24740DCF0();
  uint64_t v6 = v5;

  id v7 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  uint64_t v8 = sub_24740DCF0();
  uint64_t v10 = v9;

  id v11 = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = sub_24740DCF0();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  id v16 = objc_msgSend(v1, sel_kind);
  uint64_t v17 = sub_24740DCF0();
  uint64_t v19 = v18;

  id v20 = objc_msgSend(v2, sel_controlType);
  id v21 = objc_allocWithZone(MEMORY[0x263F851E0]);
  id v22 = a1;
  return sub_2473DA898(a1, v24, v6, v8, v10, v13, v15, v17, v19, v20);
}

id sub_2473DA898(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v12 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  if (a7)
  {
    uint64_t v14 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v18, sel_initWithIntent_named_extensionBundleIdentifier_containerBundleIdentifier_kind_controlType_, a1, v12, v13, v14, v15, a10);

  return v16;
}

id sub_2473DA9B4(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  id v5 = objc_msgSend(v2, sel_intent);
  swift_bridgeObjectRetain();
  id v6 = objc_msgSend(v2, sel_extensionBundleIdentifier);
  uint64_t v7 = sub_24740DCF0();
  uint64_t v9 = v8;

  id v10 = objc_msgSend(v2, sel_containerBundleIdentifier);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = sub_24740DCF0();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  id v15 = objc_msgSend(v2, sel_kind);
  uint64_t v16 = sub_24740DCF0();
  uint64_t v18 = v17;

  id v19 = objc_msgSend(v3, sel_controlType);
  id v20 = objc_allocWithZone(MEMORY[0x263F851E0]);
  return sub_2473DA898(v5, a1, a2, v7, v9, v12, v14, v16, v18, v19);
}

uint64_t sub_2473DAB14(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = (void *)a1[2];
  uint64_t v4 = *((unsigned __int8 *)a1 + 24);
  int v5 = *((unsigned __int8 *)a1 + 25);
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    BOOL v10 = v5 == 0;
    id v11 = *(void **)(result + 16);
    uint64_t v12 = 256;
    if (v10) {
      uint64_t v12 = 0;
    }
    uint64_t v16 = v11[3];
    uint64_t v17 = v11[2];
    id v15 = (void *)v11[4];
    v11[2] = v2;
    v11[3] = v1;
    v11[4] = v3;
    v11[5] = v12 | v4;
    v11[6] = v6;
    v11[7] = v7;
    v11[8] = v8;
    id v13 = v3;
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    id v14 = v13;
    swift_retain();
    sub_2473DAFA4(v17, v16, v15);
    swift_retain();
    sub_24740D6A0();
    swift_release();
    swift_release();
    swift_release_n();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease_n();
    return swift_release();
  }
  return result;
}

uint64_t sub_2473DAC9C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for ButtonViewModel()
{
  return self;
}

uint64_t destroy for ButtonModel(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for ButtonModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  id v6 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ButtonModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_retain();
  swift_release();
  return a1;
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

uint64_t assignWithTake for ButtonModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonModel(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonModel()
{
  return &type metadata for ButtonModel;
}

void sub_2473DAFA4(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
}

uint64_t sub_2473DB008(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C140);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24740E1C0();
  uint64_t v10 = swift_allocBox();
  uint64_t v12 = v11;
  sub_24740E1D0();
  uint64_t v13 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v9) == 1)
  {
    sub_2473DB3A8((uint64_t)v8);
    swift_deallocBox();
    uint64_t result = sub_24740E480();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v12, v8, v9);
    uint64_t v19 = *(void *)(*(void *)(a1 + 16) + 72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C150);
    sub_2473D3668(&qword_26924C158, &qword_26924C150);
    uint64_t v19 = sub_24740D730();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C160);
    sub_2473D3668(&qword_26924C168, &qword_26924C160);
    sub_24740D740();
    swift_release();
    uint64_t v14 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    *(void *)(v15 + 24) = v10;
    sub_2473D3668(&qword_26924C170, &qword_26924C140);
    swift_retain();
    uint64_t v16 = sub_24740D880();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_release();
    return v16;
  }
  return result;
}

uint64_t sub_2473DB3A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2473DB408@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = (uint64_t)v4;
  a2[3] = v5;
  a2[4] = v6;
  a2[5] = v7;
  a2[6] = v8;
  return sub_2473DBAA8(v3, v2, v4);
}

uint64_t sub_2473DB430()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2473DB468(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(a1 + 16);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 24);
  int v9 = *(unsigned __int8 *)(a1 + 25);
  uint64_t v10 = a2 + 16;
  uint64_t v47 = *(void *)(a1 + 32);
  uint64_t v11 = sub_24740E1C0();
  uint64_t v12 = swift_projectBox();
  swift_beginAccess();
  uint64_t v13 = MEMORY[0x24C5555B0](v10);
  if (!v13) {
    return;
  }
  id v14 = (id)v13;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24740E1A0();
  id v15 = v7;
  sub_24740E170();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v16 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v6, v12, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v6, 0, 1, v11);
  sub_24740E1E0();
  objc_msgSend(v14, sel_setEnabled_, v8);
  if (!v9)
  {
    swift_beginAccess();
    id v19 = v14;
    sub_24740E190();
    uint64_t v21 = v20;
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (!v21) {
      goto LABEL_10;
    }
    swift_beginAccess();
    uint64_t v22 = sub_24740E190();
    unint64_t v24 = v23;
    swift_endAccess();
    if (!v24)
    {
      __break(1u);
      return;
    }
    swift_bridgeObjectRelease();
    uint64_t v25 = HIBYTE(v24) & 0xF;
    if ((v24 & 0x2000000000000000) == 0) {
      uint64_t v25 = v22 & 0xFFFFFFFFFFFFLL;
    }
    if (!v25)
    {
LABEL_10:
      swift_beginAccess();
      uint64_t v26 = (void *)sub_24740E160();
      swift_endAccess();
      if (!v26) {
        goto LABEL_4;
      }
    }
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  id v17 = v14;
LABEL_4:
  uint64_t v18 = 1;
LABEL_13:
  uint64_t v27 = v47;
  objc_msgSend(v14, sel_setHidden_, v18);

  uint64_t v28 = *(void *)(v27 + 16);
  if (v28)
  {
    id v46 = v14;
    uint64_t v51 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24740E390();
    uint64_t v49 = sub_2473CF248(0, (unint64_t *)&qword_26924C178);
    id v29 = (void *)(v27 + 72);
    long long v48 = xmmword_24740FD50;
    uint64_t v45 = v28;
    do
    {
      uint64_t v30 = *(v29 - 5);
      uint64_t v31 = *(v29 - 4);
      id v32 = (void *)*(v29 - 3);
      char v33 = *((unsigned char *)v29 - 16);
      int v34 = *((unsigned __int8 *)v29 - 15);
      uint64_t v36 = *(v29 - 1);
      uint64_t v35 = *v29;
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = v30;
      *(void *)(v37 + 24) = v31;
      *(void *)(v37 + 32) = v32;
      *(unsigned char *)(v37 + 40) = v33;
      *(unsigned char *)(v37 + 41) = v34;
      *(_DWORD *)(v37 + 42) = v52;
      *(_WORD *)(v37 + 46) = v53;
      *(void *)(v37 + 48) = v36;
      *(void *)(v37 + 56) = v35;
      id v38 = v32;
      swift_bridgeObjectRetain_n();
      id v39 = v38;
      swift_retain_n();
      id v40 = v39;
      uint64_t v41 = sub_24740E050();
      if (v34 == 1)
      {
        sub_2473CF248(0, &qword_26924C180);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF18);
        uint64_t v42 = swift_allocObject();
        *(_OWORD *)(v42 + 16) = v48;
        *(void *)(v42 + 32) = v41;
        uint64_t v50 = v42;
        sub_24740DD90();
        sub_24740E020();
      }

      swift_bridgeObjectRelease();
      swift_release();
      sub_24740E370();
      sub_24740E3A0();
      sub_24740E3B0();
      sub_24740E380();
      v29 += 6;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
    sub_2473CF248(0, &qword_26924C180);
    double v43 = (void *)sub_24740E020();
    id v14 = v46;
    objc_msgSend(v46, sel_setMenu_, v43);

    uint64_t v28 = v45;
  }
  else
  {
    objc_msgSend(v14, sel_setMenu_, 0);
  }
  objc_msgSend(v14, sel_setShowsMenuAsPrimaryAction_, v28 != 0);
  objc_msgSend(v14, sel_setPreferredMenuElementOrder_, 2);
  objc_msgSend(v14, sel_setNeedsUpdateConfiguration);
}

uint64_t sub_2473DB9F0()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2473DBA30(uint64_t a1)
{
  sub_2473DB468(a1, *(void *)(v1 + 16));
}

uint64_t sub_2473DBA38()
{
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2473DBA80()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_2473DBAA8(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    id v3 = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for MenuItem(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for MenuItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRetain();
  id v6 = v4;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MenuItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for MenuItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for MenuItem()
{
  return &type metadata for MenuItem;
}

uint64_t getEnumTagSinglePayload for Features(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for Features(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2473DBDA0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2473DBDC8()
{
  return 0;
}

ValueMetadata *type metadata accessor for Features()
{
  return &type metadata for Features;
}

unint64_t sub_2473DBDE4()
{
  unint64_t result = qword_26924C188;
  if (!qword_26924C188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C188);
  }
  return result;
}

uint64_t sub_2473DBE38()
{
  return 1;
}

uint64_t sub_2473DBE40()
{
  return sub_24740E650();
}

uint64_t sub_2473DBE84()
{
  return sub_24740E640();
}

uint64_t sub_2473DBEAC()
{
  return sub_24740E650();
}

const char *sub_2473DBEEC()
{
  return "SpringBoard";
}

const char *sub_2473DBF00()
{
  return "ActionButtonControls";
}

uint64_t sub_2473DBF14(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v39 = a5;
  id v40 = a4;
  id v38 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C190);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C198);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  id v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v37 - v16;
  uint64_t v18 = sub_24740E1C0();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24740E1D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1) {
    return sub_2473DB3A8((uint64_t)v17);
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
  id v23 = a2;
  sub_24740E120();
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = v38;
  *(void *)(v25 + 16) = v24;
  *(void *)(v25 + 24) = v26;
  id v27 = v26;
  sub_24740D5F0();
  uint64_t v28 = sub_24740D5E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v11, 0, 1, v28);
  id v29 = (void (*)(char *, void))sub_24740E070();
  sub_24740D5B0();
  v29(v41, 0);
  uint64_t v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v31 = (void *)swift_allocObject();
  void v31[2] = v30;
  id v32 = v39;
  char v33 = v40;
  v31[3] = v40;
  v31[4] = v32;
  id v34 = v32;
  id v35 = v33;
  sub_24740D610();
  uint64_t v36 = sub_24740D600();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v8, 0, 1, v36);
  sub_24740E140();
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v15, v21, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v15, 0, 1, v18);
  sub_24740E1E0();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
}

id sub_2473DC348(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = (void *)MEMORY[0x24C5555B0](v4);
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = objc_msgSend(v5, sel_isEnabled);

    if (a3) {
      int v8 = v7;
    }
    else {
      int v8 = 1;
    }
    uint64_t v9 = a1;
    if (!v8) {
      uint64_t v9 = a3;
    }
  }
  else
  {
    uint64_t v9 = a1;
  }
  return v9;
}

uint64_t sub_2473DC3E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_24740D430();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x24C5555B0](a2 + 16);
  id v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  if (!v14) {
    return v15(a5, a1, v10);
  }
  uint64_t v16 = (void *)v14;
  v15((uint64_t)v13, a1, v10);
  uint64_t KeyPath = swift_getKeyPath();
  *(&v20 - 2) = (void *)MEMORY[0x270FA5388](KeyPath);
  swift_getKeyPath();
  if (!objc_msgSend(v16, sel_isEnabled)) {
    a3 = a4;
  }
  uint64_t v20 = a3;
  sub_2473DCD58();
  id v18 = a3;
  sub_24740D420();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, v10);
}

void sub_2473DC5B8(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_2473DC620()
{
  qword_26924CD58 = 0x4038000000000000;
}

void sub_2473DC630()
{
  qword_26924CD60 = 0x4014000000000000;
}

void sub_2473DC640()
{
  qword_26924CD68 = 0x4049000000000000;
}

void sub_2473DC650()
{
  qword_26924CD70 = 0x4014000000000000;
}

id sub_2473DC660(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v49 = a4;
  uint64_t v50 = a6;
  uint64_t v47 = a5;
  long long v48 = a3;
  v42[1] = a2;
  v42[2] = a1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v51 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24740E0A0();
  uint64_t v44 = *(void *)(v12 - 8);
  uint64_t v45 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_24740E150();
  uint64_t v15 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  id v17 = (char *)v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_24740E1C0();
  uint64_t v18 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v20 = (char *)v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for HighlightAnimatingMenuButton();
  sub_2473DCB80();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a7;
  *(void *)(v21 + 24) = a8;
  swift_retain();
  sub_24740E050();
  uint64_t v22 = (void *)sub_24740E1F0();
  objc_msgSend(v22, sel_setRole_, 1);
  LODWORD(v23) = 1148846080;
  objc_msgSend(v22, sel_setContentHuggingPriority_forAxis_, 1, v23);
  sub_24740E1B0();
  swift_bridgeObjectRetain();
  sub_24740E1A0();
  uint64_t v24 = (void (*)(void *, void))sub_24740E070();
  sub_24740D590();
  v24(aBlock, 0);
  id v25 = objc_msgSend(self, sel_effectWithStyle_, 10);
  uint64_t v26 = (void (*)(void *, void))sub_24740E070();
  sub_24740D5A0();
  v26(aBlock, 0);
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F821F0], v43);
  sub_24740E090();
  (*(void (**)(char *, void, uint64_t))(v44 + 104))(v14, *MEMORY[0x263F82198], v45);
  sub_24740E0B0();
  sub_24740E110();
  id v27 = (void *)swift_allocObject();
  id v29 = v47;
  uint64_t v28 = v48;
  uint64_t v30 = v49;
  uint64_t v31 = v50;
  void v27[2] = v47;
  v27[3] = v31;
  v27[4] = v28;
  v27[5] = v30;
  aBlock[4] = sub_2473DCC70;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2473DC5B8;
  aBlock[3] = &block_descriptor_1;
  id v32 = _Block_copy(aBlock);
  id v33 = v30;
  id v34 = v22;
  id v35 = v29;
  id v36 = v31;
  id v37 = v28;
  swift_release();
  objc_msgSend(v34, sel_setConfigurationUpdateHandler_, v32);
  _Block_release(v32);

  id v38 = v51;
  uint64_t v39 = v46;
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v51, v20, v46);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v38, 0, 1, v39);
  id v40 = v34;
  sub_24740E1E0();

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v39);
  return v40;
}

unint64_t sub_2473DCB80()
{
  unint64_t result = qword_26924C178;
  if (!qword_26924C178)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26924C178);
  }
  return result;
}

uint64_t sub_2473DCBC0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2473DCBF8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2473DCC20()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2473DCC70(uint64_t a1)
{
  return sub_2473DBF14(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_2473DCC7C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473DCCB4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_2473DCCF4(void *a1)
{
  return sub_2473DC348(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2473DCCFC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2473DCD44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2473DC3E4(a1, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32), a2);
}

unint64_t sub_2473DCD58()
{
  unint64_t result = qword_26924C1A0;
  if (!qword_26924C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C1A0);
  }
  return result;
}

uint64_t sub_2473DCDB0()
{
  return 8;
}

uint64_t sub_2473DCDBC()
{
  return swift_release();
}

uint64_t sub_2473DCDC4(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_2473DCDD8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

id sub_2473DCDE4()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  objc_msgSendSuper2(&v8, sel_setNeedsLayout);
  uint64_t v1 = OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker;
  id result = *(id *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker];
  if (result) {
    return objc_msgSend(result, sel_setNeedsLayout);
  }
  type metadata accessor for CommitTrackingView();
  int v3 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v0, sel_addSubview_, v3);
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v5 = (void (**)())&v3[OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler];
  uint64_t v6 = *(void *)&v3[OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler];
  *uint64_t v5 = sub_2473DE04C;
  v5[1] = (void (*)())v4;
  sub_2473D81A0(v6);
  unsigned int v7 = *(void **)&v0[v1];
  *(void *)&v0[v1] = v3;

  id result = *(id *)&v0[v1];
  if (result) {
    return objc_msgSend(result, sel_setNeedsLayout);
  }
  __break(1u);
  return result;
}

void sub_2473DCEE0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C5555B0](v1);
  if (v2)
  {
    int v3 = (void *)v2;
    sub_2473DCF7C();
  }
}

id sub_2473DCF7C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  MEMORY[0x270FA5388](v1 - 8);
  int v3 = (char *)&aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2473DD260())
  {
    v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating] = 1;
    if (objc_msgSend(v0, sel_state) == (id)1) {
      double v4 = 0.17;
    }
    else {
      double v4 = 0.3;
    }
    uint64_t v5 = self;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v0;
    id v25 = sub_2473DDF9C;
    uint64_t v26 = v6;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v22 = 1107296256;
    double v23 = sub_2473D6EC8;
    uint64_t v24 = &block_descriptor_2;
    unsigned int v7 = _Block_copy(&aBlock);
    objc_super v8 = v0;
    swift_release();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    id v25 = sub_2473DDFE0;
    uint64_t v26 = v9;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v22 = 1107296256;
    double v23 = sub_2473E6360;
    uint64_t v24 = &block_descriptor_26;
    uint64_t v10 = _Block_copy(&aBlock);
    uint64_t v11 = v8;
    swift_release();
    objc_msgSend(v5, sel_transitionWithView_duration_options_animations_completion_, v11, 5242880, v7, v10, v4);
    _Block_release(v10);
    _Block_release(v7);
  }
  else if (v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating] == 1)
  {
    v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_hasPendingLayout] = 1;
  }
  else
  {
    uint64_t v12 = (objc_class *)type metadata accessor for HighlightAnimatingMenuButton();
    v27.receiver = v0;
    v27.super_class = v12;
    objc_msgSendSuper2(&v27, sel_layoutSubviews);
  }
  id v13 = objc_msgSend(v0, sel_state);
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousState] = v13;
  sub_24740E1D0();
  uint64_t v14 = (uint64_t)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration];
  swift_beginAccess();
  sub_2473DDEFC((uint64_t)v3, v14);
  swift_endAccess();
  id result = objc_msgSend(v0, sel_bounds);
  uint64_t v16 = &v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds];
  void *v16 = v17;
  v16[1] = v18;
  v16[2] = v19;
  v16[3] = v20;
  return result;
}

uint64_t sub_2473DD260()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  double v4 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v53 - v5;
  uint64_t v7 = sub_24740E1C0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v53 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v53 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v53 - v18;
  if (v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating]) {
    return 0;
  }
  BOOL v20 = (*(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousState] & 1) == 0;
  if ((v20 ^ objc_msgSend(v0, sel_state))) {
    return 0;
  }
  CGFloat v21 = *(double *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds];
  CGFloat v22 = *(double *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds + 8];
  CGFloat v23 = *(double *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds + 16];
  CGFloat v24 = *(double *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds + 24];
  objc_msgSend(v0, sel_bounds);
  v57.origin.x = v25;
  v57.origin.y = v26;
  v57.size.width = v27;
  v57.size.height = v28;
  v56.origin.x = v21;
  v56.origin.y = v22;
  v56.size.width = v23;
  v56.size.height = v24;
  uint64_t result = CGRectEqualToRect(v56, v57);
  if (!result) {
    return result;
  }
  uint64_t v30 = (uint64_t)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration];
  swift_beginAccess();
  sub_2473DDE54(v30, (uint64_t)v6);
  uint64_t v55 = v8;
  uint64_t v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v31(v6, 1, v7) == 1)
  {
    uint64_t v32 = (uint64_t)v6;
LABEL_8:
    sub_2473DB3A8(v32);
    return 0;
  }
  uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
  v54(v19, v6, v7);
  sub_24740E1D0();
  if (v31(v4, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v55 + 8))(v19, v7);
    uint64_t v32 = (uint64_t)v4;
    goto LABEL_8;
  }
  uint64_t v33 = v55;
  v54(v17, v4, v7);
  uint64_t v34 = sub_24740E190();
  uint64_t v36 = v35;
  uint64_t v37 = sub_24740E190();
  if (!v36)
  {
    if (!v38) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!v38)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    id v40 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
    v40(v14, v19, v7);
    v40(v11, v17, v7);
    goto LABEL_19;
  }
  if (v34 == v37 && v36 == v38)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_17:
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
    v39(v14, v19, v7);
    v39(v11, v17, v7);
    goto LABEL_21;
  }
  char v42 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
  v43(v14, v19, v7);
  v43(v11, v17, v7);
  if ((v42 & 1) == 0)
  {
LABEL_19:
    uint64_t v41 = *(void (**)(char *, uint64_t))(v33 + 8);
    v41(v11, v7);
    v41(v14, v7);
    v41(v17, v7);
    v41(v19, v7);
    return 0;
  }
LABEL_21:
  uint64_t v44 = (void *)sub_24740E160();
  uint64_t v45 = sub_24740E160();
  uint64_t v46 = (void *)v45;
  if (!v44)
  {
    uint64_t v50 = *(void (**)(char *, uint64_t))(v33 + 8);
    v50(v11, v7);
    v50(v14, v7);
    v50(v17, v7);
    v50(v19, v7);
    if (v46)
    {

      return 0;
    }
    return 1;
  }
  if (!v45)
  {
    uint64_t v51 = *(void (**)(char *, uint64_t))(v33 + 8);
    id v52 = v44;
    v51(v11, v7);
    v51(v14, v7);
    v51(v17, v7);
    v51(v19, v7);

    return 0;
  }
  sub_2473DDEBC();
  id v47 = v44;
  char v48 = sub_24740E040();
  uint64_t v49 = *(void (**)(char *, uint64_t))(v33 + 8);
  v49(v11, v7);
  v49(v14, v7);
  v49(v17, v7);
  v49(v19, v7);

  return (v48 & 1) != 0;
}

id sub_2473DD978(void *a1)
{
  v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating] = 0;
  v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_hasPendingLayout] = 0;
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousState] = 0;
  uint64_t v3 = &v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration];
  uint64_t v4 = sub_24740E1C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = &v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds];
  *uint64_t v5 = 0u;
  v5[1] = 0u;
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker] = 0;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

void sub_2473DDA8C()
{
  sub_2473DB3A8(v0 + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration);
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker);
}

id sub_2473DDACC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2473DDB50()
{
  return type metadata accessor for HighlightAnimatingMenuButton();
}

uint64_t type metadata accessor for HighlightAnimatingMenuButton()
{
  uint64_t result = qword_26924C1D8;
  if (!qword_26924C1D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2473DDBA4()
{
  sub_2473DDC64();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2473DDC64()
{
  if (!qword_26924C1E8)
  {
    sub_24740E1C0();
    unint64_t v0 = sub_24740E210();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26924C1E8);
    }
  }
}

uint64_t type metadata accessor for CommitTrackingView()
{
  return self;
}

uint64_t sub_2473DDE54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2473DDEBC()
{
  unint64_t result = qword_26924C1F8;
  if (!qword_26924C1F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26924C1F8);
  }
  return result;
}

uint64_t sub_2473DDEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473DDF64()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2473DDF9C()
{
  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

unsigned char *sub_2473DDFE0()
{
  unint64_t result = *(unsigned char **)(v0 + 16);
  result[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating] = 0;
  if (result[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_hasPendingLayout] == 1) {
    return objc_msgSend(result, sel_setNeedsLayout);
  }
  return result;
}

uint64_t sub_2473DE014()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2473DE04C()
{
  sub_2473DCEE0(v0);
}

id sub_2473DE060(void *a1, long long *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = &v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion] = 0;
  *(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_configuredAction] = a1;
  id v7 = objc_allocWithZone(MEMORY[0x263F87B80]);
  id v8 = a1;
  id v9 = objc_msgSend(v7, sel_init);
  id v10 = objc_msgSend(v8, sel_intent);
  objc_msgSend(v9, sel_setIntent_, v10);

  objc_msgSend(v9, sel_setWidgetConfigurationType_, 1);
  if (*((void *)a2 + 3))
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  objc_msgSend(v9, sel_setWidgetDisplayName_, v11);

  if (*((void *)a2 + 5))
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)sub_24740DCC0();
    long long v16 = *a2;
    sub_2473DA190((uint64_t)&v16);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    long long v16 = *a2;
    sub_2473DA190((uint64_t)&v16);
    uint64_t v12 = 0;
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setWidgetDescription_, v12);

  v15.receiver = v2;
  v15.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v15, sel_initWithOptions_, v9);
  objc_msgSend(v13, sel_setDelegate_, v13);

  return v13;
}

id sub_2473DE2D8()
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v2 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion];
  if (v2) {
    objc_msgSend(v2, sel_invalidate);
  }
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

void sub_2473DE410(char a1)
{
  v15.receiver = v1;
  v15.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v15, sel_viewIsAppearing_, a1 & 1);
  uint64_t v3 = OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion;
  if (!*(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion])
  {
    id v4 = objc_msgSend(v1, sel_view);
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = objc_msgSend(v4, sel_window);

      if (v6)
      {
        id v7 = objc_msgSend(v6, sel__rootSheetPresentationController);

        if (v7)
        {
          objc_msgSend(v7, sel__setShouldScaleDownBehindDescendantSheets_, 0);
          uint64_t v8 = swift_allocObject();
          swift_unknownObjectWeakInit();
          id v9 = objc_allocWithZone(MEMORY[0x263F29CD8]);
          swift_retain();
          id v10 = (void *)sub_24740DCC0();
          uint64_t v11 = (void *)sub_24740DCC0();
          v14[4] = sub_2473DE9E4;
          v14[5] = v8;
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 1107296256;
          void v14[2] = sub_2473DC5B8;
          v14[3] = &block_descriptor_3;
          uint64_t v12 = _Block_copy(v14);
          id v13 = objc_msgSend(v9, sel_initWithIdentifier_forReason_invalidationBlock_, v10, v11, v12);

          _Block_release(v12);
          swift_release();

          swift_release();
          *(void *)&v1[v3] = v13;
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_2473DE638(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x24C5555B0](v2);
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel__setShouldScaleDownBehindDescendantSheets_, 1);
  }
}

uint64_t sub_2473DE6EC(char a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_viewDidDisappear_, a1 & 1);
  uint64_t v3 = OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion;
  id v4 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion];
  if (v4) {
    objc_msgSend(v4, sel_invalidate);
  }
  *(void *)&v1[v3] = 0;
  return swift_unknownObjectRelease();
}

void sub_2473DE7B0(void *a1, id a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(a2, sel__indexingHash);
  uint64_t v7 = OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_configuredAction;
  id v8 = objc_msgSend(*(id *)(v3+ OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_configuredAction), sel_intent);
  if (v8 && (v9 = v8, id v10 = objc_msgSend(v8, sel__indexingHash), v9, v6 == v10))
  {
    id v13 = 0;
  }
  else
  {
    id v11 = *(id *)(v3 + v7);
    id v13 = sub_2473DA730(a2);
  }
  uint64_t v12 = *(void (**)(id))(v3
                                  + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler);
  if (v12)
  {
    swift_retain();
    v12(v13);
    sub_2473D81A0((uint64_t)v12);
  }
  objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

uint64_t type metadata accessor for ControlConfigurationViewController()
{
  return self;
}

uint64_t sub_2473DE9AC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2473DE9E4(uint64_t a1)
{
  sub_2473DE638(a1, v1);
}

id sub_2473DE9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C350);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C128);
  MEMORY[0x270FA5388](v10 - 8);
  id v11 = &v3[OBJC_IVAR____TtC27ActionButtonConfigurationUI27ControlPickerViewController_completionHandler];
  *(void *)id v11 = a1;
  *((void *)v11 + 1) = a2;
  id v12 = objc_allocWithZone(MEMORY[0x263F33CF8]);
  swift_retain();
  id v13 = objc_msgSend(v12, sel_init);
  sub_24740E000();
  if (sub_2473DF0A8())
  {
    sub_2473CF248(0, &qword_26924C370);
    uint64_t v14 = (void *)sub_24740DD60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  objc_msgSend(v13, sel_setDisallowedControlIdentities_, v14);

  sub_24740DF70();
  sub_24740D500();
  sub_24740D500();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C360);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 0, 1, v15);
  uint64_t v16 = sub_24740DF60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF18);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_24740FD50;
  *(void *)(v17 + 32) = v16;
  uint64_t v24 = v17;
  sub_24740DD90();
  uint64_t v18 = (void *)sub_24740DD60();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setDisallowedExtensionIdentities_, v18);

  if (sub_2473E00C4())
  {
    sub_24740DFC0();
    uint64_t v19 = (void *)sub_24740DD60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = 0;
  }
  objc_msgSend(v13, sel_setSuggestedControls_, v19);

  v23.receiver = v3;
  v23.super_class = ObjectType;
  id v20 = objc_msgSendSuper2(&v23, sel_initWithConfiguration_, v13);
  objc_msgSend(v20, sel_setDelegate_, v20);

  swift_release();
  return v20;
}

void sub_2473DED30(void *a1, void *a2, id a3)
{
  uint64_t v4 = v3;
  if (a3)
  {
    unsigned int v7 = 0;
    id v8 = a3;
  }
  else if (a2)
  {
    sub_2473CF248(0, &qword_26924C378);
    id v10 = a2;
    id v8 = sub_2473DA474(objc_msgSend(v10, sel_control));
    unsigned int v7 = objc_msgSend(v10, sel_promptsForUserConfiguration);
  }
  else
  {
    unsigned int v7 = 0;
    id v8 = 0;
  }
  id v11 = *(uint64_t (**)(id, BOOL))(v4
                                           + OBJC_IVAR____TtC27ActionButtonConfigurationUI27ControlPickerViewController_completionHandler);
  id v12 = a3;
  swift_retain();
  uint64_t v13 = v11(v8, a3 != 0);
  uint64_t v15 = v14;
  swift_release();
  if (v7)
  {
    sub_2473D7FA8(v13);
    uint64_t v16 = v13;
    uint64_t v17 = v15;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  id v18 = objc_msgSend(a1, sel_presentingViewController);
  if (v18)
  {
    uint64_t v19 = v18;
    if (v16)
    {
      v21[4] = v16;
      v21[5] = v17;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 1107296256;
      v21[2] = sub_2473D6EC8;
      v21[3] = &block_descriptor_4;
      id v20 = _Block_copy(v21);
      swift_retain();
      swift_release();
    }
    else
    {
      id v20 = 0;
    }
    objc_msgSend(v19, sel_dismissViewControllerAnimated_completion_, 1, v20);
    sub_2473D8090(v8);
    sub_2473D81A0(v13);
    sub_2473D81A0(v16);
    _Block_release(v20);
  }
  else
  {
    sub_2473D8090(v8);
    sub_2473D81A0(v13);
    sub_2473D81A0(v16);
  }
}

uint64_t type metadata accessor for ControlPickerViewController()
{
  return self;
}

uint64_t sub_2473DF0A8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C128);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C350);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v71 - v5;
  uint64_t v84 = MEMORY[0x263F8EE78];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C360);
  uint64_t v8 = *(void *)(v7 - 8);
  id v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  unint64_t v10 = v8 + 56;
  v9(v6, 1, 1, v7);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v9(v4, 0, 1, v7);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  uint64_t v11 = sub_24740DF70();
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  uint64_t v83 = v11;
  id v12 = (void *)sub_24740DF60();
  id v13 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v14 = (void *)sub_24740DCC0();
  id v15 = objc_msgSend(v13, sel_initWithExtensionIdentity_kind_intent_, v12, v14, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v16 = v15;
  MEMORY[0x24C554460]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v79 = v16;
  sub_24740DDC0();
  sub_24740DD90();
  v9(v6, 1, 1, v7);
  unint64_t v78 = 0xD000000000000010;
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v9(v4, 0, 1, v7);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  uint64_t v17 = (void *)sub_24740DF60();
  id v18 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v19 = (void *)sub_24740DCC0();
  id v20 = objc_msgSend(v18, sel_initWithExtensionIdentity_kind_intent_, v17, v19, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v21 = v20;
  MEMORY[0x24C554460]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v77 = v21;
  sub_24740DDC0();
  sub_24740DD90();
  v9(v6, 1, 1, v7);
  unint64_t v22 = v10;
  unint64_t v80 = 0xD000000000000015;
  id v75 = (id)0x8000000247412050;
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v9(v4, 0, 1, v7);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  v81 = v9;
  uint64_t v82 = v7;
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  objc_super v23 = (void *)sub_24740DF60();
  id v24 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  CGFloat v25 = (void *)sub_24740DCC0();
  id v26 = objc_msgSend(v24, sel_initWithExtensionIdentity_kind_intent_, v23, v25, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v27 = v26;
  MEMORY[0x24C554460]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v76 = v27;
  sub_24740DDC0();
  sub_24740DD90();
  CGFloat v28 = v81;
  uint64_t v29 = v82;
  v81(v6, 1, 1, v82);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v28(v4, 0, 1, v29);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  uint64_t v30 = (void *)sub_24740DF60();
  id v31 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v32 = (void *)sub_24740DCC0();
  id v33 = objc_msgSend(v31, sel_initWithExtensionIdentity_kind_intent_, v30, v32, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v34 = v33;
  MEMORY[0x24C554460]();
  unint64_t v35 = v22;
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v75 = v34;
  sub_24740DDC0();
  sub_24740DD90();
  uint64_t v37 = v81;
  uint64_t v36 = v82;
  v81(v6, 1, 1, v82);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v37(v4, 0, 1, v36);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  uint64_t v38 = (void *)sub_24740DF60();
  id v39 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  id v40 = (void *)sub_24740DCC0();
  id v41 = objc_msgSend(v39, sel_initWithExtensionIdentity_kind_intent_, v38, v40, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v42 = v41;
  MEMORY[0x24C554460]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v74 = v42;
  sub_24740DDC0();
  sub_24740DD90();
  v37(v6, 1, 1, v36);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v37(v4, 0, 1, v36);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  uint64_t v43 = (void *)sub_24740DF60();
  id v44 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v45 = (void *)sub_24740DCC0();
  id v46 = objc_msgSend(v44, sel_initWithExtensionIdentity_kind_intent_, v43, v45, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v47 = v46;
  MEMORY[0x24C554460]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v73 = v47;
  sub_24740DDC0();
  sub_24740DD90();
  v37(v6, 1, 1, v36);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v37(v4, 0, 1, v36);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  char v48 = (void *)sub_24740DF60();
  id v49 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v50 = (void *)sub_24740DCC0();
  id v51 = objc_msgSend(v49, sel_initWithExtensionIdentity_kind_intent_, v48, v50, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v52 = v51;
  MEMORY[0x24C554460]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v72 = v52;
  sub_24740DDC0();
  sub_24740DD90();
  v37(v6, 1, 1, v36);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v37(v4, 0, 1, v36);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  unint64_t v80 = v35;
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  uint64_t v53 = (void *)sub_24740DF60();
  id v54 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v55 = (void *)sub_24740DCC0();
  id v56 = objc_msgSend(v54, sel_initWithExtensionIdentity_kind_intent_, v53, v55, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v57 = v56;
  MEMORY[0x24C554460]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v71 = v57;
  sub_24740DDC0();
  sub_24740DD90();
  uint64_t v58 = v82;
  v37(v6, 1, 1, v82);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v37(v4, 0, 1, v58);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  uint64_t v59 = (void *)sub_24740DF60();
  id v60 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v61 = (void *)sub_24740DCC0();
  id v62 = objc_msgSend(v60, sel_initWithExtensionIdentity_kind_intent_, v59, v61, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v63 = v62;
  MEMORY[0x24C554460]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  sub_24740DDC0();
  sub_24740DD90();
  uint64_t v64 = v82;
  v37(v6, 1, 1, v82);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v6);
  v37(v4, 0, 1, v64);
  sub_2473E0E08((uint64_t)v4, (uint64_t)v6);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v6, (uint64_t)v4);
  uint64_t v65 = (void *)sub_24740DF60();
  id v66 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v67 = (void *)sub_24740DCC0();
  id v68 = objc_msgSend(v66, sel_initWithExtensionIdentity_kind_intent_, v65, v67, 0);

  sub_2473E0DA8((uint64_t)v6);
  id v69 = v68;
  MEMORY[0x24C554460]();
  if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  sub_24740DDC0();
  sub_24740DD90();

  return v84;
}

uint64_t sub_2473E00C4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C128);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v60 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C350);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  id v6 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v60 - v7;
  uint64_t v71 = MEMORY[0x263F8EE78];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C360);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v12 = v10 + 56;
  v11(v8, 1, 1, v9);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v8);
  v11(v6, 0, 1, v9);
  sub_2473E0E08((uint64_t)v6, (uint64_t)v8);
  uint64_t v13 = sub_24740DF70();
  sub_24740D500();
  sub_2473E0E70((uint64_t)v8, (uint64_t)v6);
  uint64_t v70 = v13;
  uint64_t v14 = (void *)sub_24740DF60();
  id v15 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  id v16 = (void *)sub_24740DCC0();
  id v17 = objc_msgSend(v15, sel_initWithExtensionIdentity_kind_intent_, v14, v16, 0);

  sub_2473E0DA8((uint64_t)v8);
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33CF0]), sel_initWithIdentity_type_size_, v17, 0, 0);

  id v19 = v18;
  MEMORY[0x24C554460]();
  if (*(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v67 = v19;
  sub_24740DDC0();
  sub_24740DD90();
  v11(v8, 1, 1, v9);
  uint64_t v64 = "timer.WorldClockWidget";
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v8);
  v11(v6, 0, 1, v9);
  sub_2473E0E08((uint64_t)v6, (uint64_t)v8);
  id v63 = "ator.CalculatorWidget.control";
  uint64_t v68 = v12;
  sub_24740D500();
  sub_2473E0E70((uint64_t)v8, (uint64_t)v6);
  id v20 = (void *)sub_24740DF60();
  id v21 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  id v69 = v2;
  unint64_t v22 = v11;
  id v23 = v21;
  id v24 = (void *)sub_24740DCC0();
  id v25 = objc_msgSend(v23, sel_initWithExtensionIdentity_kind_intent_, v20, v24, 0);

  sub_2473E0DA8((uint64_t)v8);
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33CF0]), sel_initWithIdentity_type_size_, v25, 0, 0);

  id v27 = v26;
  MEMORY[0x24C554460]();
  if (*(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v66 = v27;
  sub_24740DDC0();
  sub_24740DD90();
  v22(v8, 1, 1, v9);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v8);
  v22(v6, 0, 1, v9);
  sub_2473E0E08((uint64_t)v6, (uint64_t)v8);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v8, (uint64_t)v6);
  CGFloat v28 = (void *)sub_24740DF60();
  id v29 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v30 = (void *)sub_24740DCC0();
  id v31 = objc_msgSend(v29, sel_initWithExtensionIdentity_kind_intent_, v28, v30, 0);

  sub_2473E0DA8((uint64_t)v8);
  id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33CF0]), sel_initWithIdentity_type_size_, v31, 0, 0);

  id v33 = v32;
  MEMORY[0x24C554460]();
  if (*(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v65 = v33;
  sub_24740DDC0();
  sub_24740DD90();
  v22(v8, 1, 1, v9);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v8);
  v22(v6, 0, 1, v9);
  sub_2473E0E08((uint64_t)v6, (uint64_t)v8);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v8, (uint64_t)v6);
  id v34 = (void *)sub_24740DF60();
  id v35 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v36 = (void *)sub_24740DCC0();
  id v37 = objc_msgSend(v35, sel_initWithExtensionIdentity_kind_intent_, v34, v36, 0);

  sub_2473E0DA8((uint64_t)v8);
  id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33CF0]), sel_initWithIdentity_type_size_, v37, 0, 0);

  id v39 = v22;
  id v40 = v38;
  MEMORY[0x24C554460]();
  if (*(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v62 = v40;
  sub_24740DDC0();
  sub_24740DD90();
  v39(v8, 1, 1, v9);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v8);
  v39(v6, 0, 1, v9);
  sub_2473E0E08((uint64_t)v6, (uint64_t)v8);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v8, (uint64_t)v6);
  id v41 = (void *)sub_24740DF60();
  id v42 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v43 = (void *)sub_24740DCC0();
  id v44 = objc_msgSend(v42, sel_initWithExtensionIdentity_kind_intent_, v41, v43, 0);

  sub_2473E0DA8((uint64_t)v8);
  id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33CF0]), sel_initWithIdentity_type_size_, v44, 0, 0);

  id v46 = v45;
  MEMORY[0x24C554460]();
  if (*(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  id v61 = v46;
  sub_24740DDC0();
  sub_24740DD90();
  v39(v8, 1, 1, v9);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v8);
  v39(v6, 0, 1, v9);
  sub_2473E0E08((uint64_t)v6, (uint64_t)v8);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v8, (uint64_t)v6);
  id v47 = (void *)sub_24740DF60();
  id v48 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  id v49 = (void *)sub_24740DCC0();
  id v50 = objc_msgSend(v48, sel_initWithExtensionIdentity_kind_intent_, v47, v49, 0);

  sub_2473E0DA8((uint64_t)v8);
  id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33CF0]), sel_initWithIdentity_type_size_, v50, 0, 0);

  id v52 = v51;
  MEMORY[0x24C554460]();
  if (*(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  sub_24740DDC0();
  sub_24740DD90();
  v39(v8, 1, 1, v9);
  sub_24740D500();
  sub_2473E0DA8((uint64_t)v8);
  v39(v6, 0, 1, v9);
  sub_2473E0E08((uint64_t)v6, (uint64_t)v8);
  sub_24740D500();
  sub_2473E0E70((uint64_t)v8, (uint64_t)v6);
  uint64_t v53 = (void *)sub_24740DF60();
  id v54 = objc_allocWithZone(MEMORY[0x263F31DF8]);
  uint64_t v55 = (void *)sub_24740DCC0();
  id v56 = objc_msgSend(v54, sel_initWithExtensionIdentity_kind_intent_, v53, v55, 0);

  sub_2473E0DA8((uint64_t)v8);
  id v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33CF0]), sel_initWithIdentity_type_size_, v56, 0, 0);

  id v58 = v57;
  MEMORY[0x24C554460]();
  if (*(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24740DDA0();
  }
  sub_24740DDC0();
  sub_24740DD90();

  return v71;
}

uint64_t sub_2473E0DA8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C350);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2473E0E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C350);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473E0E70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C350);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2473E0FA8()
{
  swift_getObjectType();
  sub_2473E1274();
  if (!v1)
  {
    id v15 = (objc_class *)MEMORY[0x263F827E8];
LABEL_12:
    id v16 = objc_allocWithZone(v15);
    objc_msgSend(v16, sel_init);
    return;
  }
  uint64_t v2 = sub_24740DCF0();
  uint64_t v4 = v3;
  if (v2 == sub_24740DCF0() && v4 == v5)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v7 = sub_24740E5A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
    {
      uint64_t v8 = (void *)sub_24740DCC0();
      uint64_t v9 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured);
      uint64_t v10 = self;
      id v11 = objc_msgSend(v10, sel__systemImageNamed_shape_fill_, v8, 0, v9);

      if (v11
        || (swift_bridgeObjectRetain(),
            uint64_t v12 = (void *)sub_24740DCC0(),
            swift_bridgeObjectRelease(),
            id v11 = objc_msgSend(v10, sel__systemImageNamed_, v12),
            v12,
            v11))
      {
        swift_bridgeObjectRelease();
LABEL_10:
        id v13 = v11;
        uint64_t v14 = (void *)sub_24740DCC0();
        objc_msgSend(v13, sel_setAccessibilityLabel_, v14);

        return;
      }
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v20 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
      id v21 = (void *)sub_24740DCC0();
      swift_bridgeObjectRelease();
      id v11 = objc_msgSend(v10, sel_imageNamed_inBundle_withConfiguration_, v21, v20, 0);

      if (v11) {
        goto LABEL_10;
      }
      id v15 = (objc_class *)MEMORY[0x263F827E8];
      goto LABEL_12;
    }
  }
  id v17 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(self, sel__systemImageNamed_, v17);

  if (!v18) {
    __break(1u);
  }
}

uint64_t sub_2473E1274()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier);
  uint64_t v2 = sub_24740DCF0();
  uint64_t v4 = v3;
  if (v2 == sub_24740DCF0() && v4 == v5)
  {
    id v19 = v1;
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  char v7 = sub_24740E5A0();
  id v8 = v1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_15:

    return 0x616C732E6C6C6562;
  }
  uint64_t v9 = sub_24740DCF0();
  uint64_t v11 = v10;
  if (v9 == sub_24740DCF0() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v14 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
LABEL_18:

    return 0x6D726F6665766177;
  }
  uint64_t v15 = sub_24740DCF0();
  uint64_t v17 = v16;
  if (v15 == sub_24740DCF0() && v17 == v18)
  {
    swift_bridgeObjectRelease_n();
LABEL_20:

    return 1852796781;
  }
  char v22 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_20;
  }
  uint64_t v23 = sub_24740DCF0();
  uint64_t v25 = v24;
  if (v23 == sub_24740DCF0() && v25 == v26)
  {
    swift_bridgeObjectRelease_n();
LABEL_25:

    return 0x6172656D6163;
  }
  char v27 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v27) {
    goto LABEL_25;
  }
  uint64_t v28 = sub_24740DCF0();
  uint64_t v30 = v29;
  if (v28 == sub_24740DCF0() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_30:

    return 0x67696C6873616C66;
  }
  char v32 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v32) {
    goto LABEL_30;
  }
  uint64_t v33 = sub_24740DCF0();
  uint64_t v35 = v34;
  if (v33 == sub_24740DCF0() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
LABEL_35:

    return 0x6269737365636361;
  }
  char v37 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v37) {
    goto LABEL_35;
  }
  uint64_t v38 = sub_24740DCF0();
  uint64_t v40 = v39;
  if (v38 == sub_24740DCF0() && v40 == v41)
  {
    swift_bridgeObjectRelease_n();
LABEL_40:

    return 0x74616C736E617274;
  }
  char v42 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v42) {
    goto LABEL_40;
  }
  uint64_t v43 = sub_24740DCF0();
  uint64_t v45 = v44;
  if (v43 == sub_24740DCF0() && v45 == v46)
  {
    swift_bridgeObjectRelease_n();
LABEL_45:
    unint64_t v20 = 0xD000000000000014;

    return v20;
  }
  char v47 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v47) {
    goto LABEL_45;
  }
  uint64_t v48 = sub_24740DCF0();
  uint64_t v50 = v49;
  if (v48 == sub_24740DCF0() && v50 == v51)
  {
    swift_bridgeObjectRelease_n();
LABEL_51:

    return 0x322E686374697773;
  }
  char v52 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v52) {
    goto LABEL_51;
  }
  uint64_t v53 = sub_24740DCF0();
  uint64_t v55 = v54;
  if (v53 == sub_24740DCF0() && v55 == v56)
  {
    swift_bridgeObjectRelease_n();
LABEL_56:

    return 0x74732E322E707061;
  }
  char v57 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v57) {
    goto LABEL_56;
  }
  uint64_t v58 = sub_24740DCF0();
  uint64_t v60 = v59;
  if (v58 == sub_24740DCF0() && v60 == v61)
  {
    swift_bridgeObjectRelease_n();
LABEL_61:

    return 0x732E656C63726963;
  }
  char v62 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v62) {
    goto LABEL_61;
  }
  uint64_t v63 = sub_24740DCF0();
  uint64_t v65 = v64;
  if (v63 == sub_24740DCF0() && v65 == v66)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v67 = sub_24740E5A0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v67 & 1) == 0) {
      return 0;
    }
  }
  return 0xD000000000000017;
}

unint64_t sub_2473E1A08(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C746974;
      break;
    case 2:
      unint64_t result = 0x656C746974627573;
      break;
    case 3:
      unint64_t result = 0x6769666E6F437369;
      break;
    case 4:
      unint64_t result = 0x6F6C6F43746E6974;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2473E1ACC()
{
  return sub_2473E1A08(*v0);
}

uint64_t sub_2473E1AD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2473E2E94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2473E1AFC()
{
  return 0;
}

void sub_2473E1B08(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2473E1B14(uint64_t a1)
{
  unint64_t v2 = sub_2473E38C0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2473E1B50(uint64_t a1)
{
  unint64_t v2 = sub_2473E38C0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2473E1BF0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C458);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2473E38C0();
  sub_24740E670();
  *(void *)&v11[0] = *(void *)(v3
                                 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier);
  char v12 = 0;
  type metadata accessor for WFStaccatoActionSectionIdentifier(0);
  sub_2473E3968(&qword_26924C460);
  sub_24740E580();
  if (!v2)
  {
    LOBYTE(v11[0]) = 1;
    sub_24740E550();
    LOBYTE(v11[0]) = 2;
    sub_24740E550();
    LOBYTE(v11[0]) = 3;
    sub_24740E560();
    long long v9 = *(_OWORD *)(v3 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor + 16);
    v11[0] = *(_OWORD *)(v3 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor);
    v11[1] = v9;
    char v12 = 4;
    sub_2473E39AC();
    sub_24740E580();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_2473E1E50(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C438);
  uint64_t v4 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v7 = sub_2473E38C0();
  id v8 = v1;
  sub_24740E660();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v9 = v4;
    type metadata accessor for WFStaccatoActionSectionIdentifier(0);
    char v24 = 0;
    sub_2473E3968(&qword_26924C448);
    uint64_t v10 = v19;
    sub_24740E540();
    *(void *)&v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier] = v22;
    LOBYTE(v22) = 1;
    uint64_t v12 = sub_24740E510();
    id v13 = (uint64_t *)&v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_title];
    *id v13 = v12;
    v13[1] = v14;
    LOBYTE(v22) = 2;
    uint64_t v15 = sub_24740E510();
    uint64_t v16 = (uint64_t *)&v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_subtitle];
    uint64_t *v16 = v15;
    v16[1] = v17;
    LOBYTE(v22) = 3;
    v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured] = sub_24740E520() & 1;
    char v24 = 4;
    sub_2473E3914();
    sub_24740E540();
    uint64_t v18 = &v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor];
    *(_OWORD *)uint64_t v18 = v22;
    *((_OWORD *)v18 + 1) = v23;

    v21.receiver = v8;
    v21.super_class = ObjectType;
    unint64_t v7 = (unint64_t)objc_msgSendSuper2(&v21, sel_init);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_2473E2220@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24740DCF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2473E2258@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  unint64_t result = sub_2473E1E50(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2473E22A8(void *a1)
{
  return sub_2473E1BF0(a1);
}

uint64_t sub_2473E22CC(char a1)
{
  return qword_2474106A0[a1];
}

uint64_t sub_2473E22EC(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C488);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2473E3A00();
  sub_24740E670();
  double v18 = a2;
  char v17 = 0;
  sub_2473E3AA8();
  sub_24740E580();
  if (!v5)
  {
    double v18 = a3;
    char v17 = 1;
    sub_24740E580();
    double v18 = a4;
    char v17 = 2;
    sub_24740E580();
    double v18 = a5;
    char v17 = 3;
    sub_24740E580();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_2473E2500()
{
  return sub_2473E22CC(*v0);
}

uint64_t sub_2473E2508@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2473E30A8(a1, a2);
  *a3 = result;
  return result;
}

void sub_2473E2530(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2473E253C(uint64_t a1)
{
  unint64_t v2 = sub_2473E3A00();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2473E2578(uint64_t a1)
{
  unint64_t v2 = sub_2473E3A00();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_2473E25B4(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = sub_2473E321C(a1);
  if (!v2)
  {
    *(double *)a2 = v4;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(void *)(a2 + 24) = v7;
  }
}

uint64_t sub_2473E25E4(void *a1)
{
  return sub_2473E22EC(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_2473E2614@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_24740E500();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2473E2668@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2473E347C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2473E2694@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_24740E500();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2473E26EC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2473E26F8(uint64_t a1)
{
  unint64_t v2 = sub_2473E3650();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2473E2734(uint64_t a1)
{
  unint64_t v2 = sub_2473E3650();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WFStaccatoActionSectionIdentifier.init(from:)(void *a1)
{
  return sub_2473E3494(a1);
}

uint64_t WFStaccatoActionSectionIdentifier.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C380);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2473E3650();
  sub_24740E670();
  sub_24740DCF0();
  sub_24740E550();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473E28C4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2473E3494(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2473E28F0(void *a1)
{
  return WFStaccatoActionSectionIdentifier.encode(to:)(a1);
}

uint64_t sub_2473E290C()
{
  return sub_24740E650();
}

uint64_t sub_2473E295C()
{
  return sub_24740E650();
}

uint64_t sub_2473E29B0()
{
  return sub_24740DD10();
}

double sub_2473E29C8(void *a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v2 = 0;
  objc_msgSend(a1, sel_getRed_green_blue_alpha_, v5, &v4, &v3, &v2);
  return *(double *)v5;
}

id sub_2473E2A44(void *a1, uint64_t a2, char a3, char a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  switch(a3)
  {
    case 1:
      uint64_t v13 = v4;
      uint64_t v12 = @"Shortcuts";
      goto LABEL_4;
    case 2:
    case 3:
      uint64_t v15 = v4;
      uint64_t v12 = (__CFString *)objc_msgSend(a1, sel_sectionIdentifier);
      break;
    default:
      uint64_t v11 = v4;
      uint64_t v12 = @"Controls";
LABEL_4:
      uint64_t v14 = v12;
      break;
  }
  *(void *)&v5[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier] = v12;
  uint64_t v16 = sub_247407248(a1, a2, a3);
  char v17 = (uint64_t *)&v5[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_title];
  uint64_t *v17 = v16;
  v17[1] = v18;
  uint64_t v19 = sub_247407494(a1, a2, a3);
  unint64_t v20 = (uint64_t *)&v5[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_subtitle];
  uint64_t *v20 = v19;
  v20[1] = v21;
  id v22 = sub_2474076C4(a1, a2, a3);
  id v23 = objc_msgSend(v22, sel_UIColor);

  double v24 = sub_2473E29C8(v23);
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;

  uint64_t v31 = (double *)&v5[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor];
  *uint64_t v31 = v24;
  *((void *)v31 + 1) = v26;
  *((void *)v31 + 2) = v28;
  *((void *)v31 + 3) = v30;
  v5[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured] = a4 & 1;

  if (qword_26B12B950 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_24740D560();
  __swift_project_value_buffer(v32, (uint64_t)qword_26B12B938);
  sub_2473D8260(a1, a2, a3);
  sub_2473D8260(a1, a2, a3);
  uint64_t v33 = sub_24740D540();
  os_log_type_t v34 = sub_24740DEB0();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v44 = v42;
    *(_DWORD *)uint64_t v35 = 136315394;
    os_log_type_t v43 = v34;
    switch(a3)
    {
      case 1:
        uint64_t v36 = @"Shortcuts";
        goto LABEL_13;
      case 2:
      case 3:
        uint64_t v36 = (__CFString *)objc_msgSend(a1, sel_sectionIdentifier);
        break;
      default:
        uint64_t v36 = @"Controls";
LABEL_13:
        char v37 = v36;
        break;
    }
    uint64_t v38 = sub_24740DCF0();
    unint64_t v40 = v39;

    sub_2474096F8(v38, v40, &v44);
    sub_24740E220();
    swift_bridgeObjectRelease();
    sub_2473D82EC(a1, a2, a3);
    sub_2473D82EC(a1, a2, a3);
    *(_WORD *)(v35 + 12) = 1024;
    sub_24740E220();
    _os_log_impl(&dword_2473C9000, v33, v43, "Creating item for %s, isConfigured: %{BOOL}d", (uint8_t *)v35, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v42, -1, -1);
    MEMORY[0x24C5554B0](v35, -1, -1);
  }
  else
  {
    sub_2473D82EC(a1, a2, a3);
    sub_2473D82EC(a1, a2, a3);
  }
  v45.receiver = v5;
  v45.super_class = ObjectType;
  return objc_msgSendSuper2(&v45, sel_init);
}

uint64_t sub_2473E2E94(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000002474125B0 || (sub_24740E5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_24740E5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000 || (sub_24740E5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6769666E6F437369 && a2 == 0xEC00000064657275 || (sub_24740E5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6F6C6F43746E6974 && a2 == 0xE900000000000072)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_24740E5A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_2473E30A8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 6579570 && a2 == 0xE300000000000000;
  if (v3 || (sub_24740E5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65657267 && a2 == 0xE500000000000000 || (sub_24740E5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1702194274 && a2 == 0xE400000000000000 || (sub_24740E5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6168706C61 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24740E5A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

double sub_2473E321C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C470);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2473E3A00();
  sub_24740E660();
  HIBYTE(v8) = 0;
  sub_2473E3A54();
  sub_24740E540();
  double v6 = v9;
  HIBYTE(v8) = 1;
  sub_24740E540();
  HIBYTE(v8) = 2;
  sub_24740E540();
  HIBYTE(v8) = 3;
  sub_24740E540();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

uint64_t sub_2473E347C()
{
  return 0x65756C6156776172;
}

uint64_t sub_2473E3494(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C498);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  double v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2473E3650();
  sub_24740E660();
  if (!v1)
  {
    sub_24740E510();
    uint64_t v7 = sub_24740DCC0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2473E3650()
{
  unint64_t result = qword_26924C388;
  if (!qword_26924C388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C388);
  }
  return result;
}

uint64_t type metadata accessor for ActionSelectorItem()
{
  return self;
}

ValueMetadata *type metadata accessor for Color()
{
  return &type metadata for Color;
}

unsigned char *_s10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2473E3774);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

unint64_t sub_2473E37B0()
{
  unint64_t result = qword_26924C420;
  if (!qword_26924C420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C420);
  }
  return result;
}

uint64_t sub_2473E3804()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_2473E3814()
{
  unint64_t result = qword_26924C428;
  if (!qword_26924C428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C428);
  }
  return result;
}

unint64_t sub_2473E386C()
{
  unint64_t result = qword_26924C430;
  if (!qword_26924C430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C430);
  }
  return result;
}

unint64_t sub_2473E38C0()
{
  unint64_t result = qword_26924C440;
  if (!qword_26924C440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C440);
  }
  return result;
}

unint64_t sub_2473E3914()
{
  unint64_t result = qword_26924C450;
  if (!qword_26924C450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C450);
  }
  return result;
}

uint64_t sub_2473E3968(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for WFStaccatoActionSectionIdentifier(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2473E39AC()
{
  unint64_t result = qword_26924C468;
  if (!qword_26924C468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C468);
  }
  return result;
}

unint64_t sub_2473E3A00()
{
  unint64_t result = qword_26924C478;
  if (!qword_26924C478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C478);
  }
  return result;
}

unint64_t sub_2473E3A54()
{
  unint64_t result = qword_26924C480;
  if (!qword_26924C480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C480);
  }
  return result;
}

unint64_t sub_2473E3AA8()
{
  unint64_t result = qword_26924C490;
  if (!qword_26924C490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C490);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Color.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Color.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2473E3C58);
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

ValueMetadata *type metadata accessor for Color.CodingKeys()
{
  return &type metadata for Color.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ActionSelectorItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ActionSelectorItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2473E3DECLL);
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

ValueMetadata *type metadata accessor for ActionSelectorItem.CodingKeys()
{
  return &type metadata for ActionSelectorItem.CodingKeys;
}

unint64_t sub_2473E3E28()
{
  unint64_t result = qword_26924C4A0;
  if (!qword_26924C4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C4A0);
  }
  return result;
}

unint64_t sub_2473E3E80()
{
  unint64_t result = qword_26924C4A8;
  if (!qword_26924C4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C4A8);
  }
  return result;
}

unint64_t sub_2473E3ED8()
{
  unint64_t result = qword_26924C4B0;
  if (!qword_26924C4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C4B0);
  }
  return result;
}

unint64_t sub_2473E3F30()
{
  unint64_t result = qword_26924C4B8;
  if (!qword_26924C4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C4B8);
  }
  return result;
}

unint64_t sub_2473E3F88()
{
  unint64_t result = qword_26924C4C0;
  if (!qword_26924C4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C4C0);
  }
  return result;
}

unint64_t sub_2473E3FE0()
{
  unint64_t result = qword_26924C4C8;
  if (!qword_26924C4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C4C8);
  }
  return result;
}

uint64_t sub_2473E4044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2473E5D78(a1, a2, a3, &qword_26924C528);
}

uint64_t sub_2473E4050(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_26924C528);
}

void sub_2473E405C()
{
}

void sub_2473E4084()
{
}

void sub_2473E40A0()
{
  qword_26924C4D0 = 0x4041000000000000;
}

id sub_2473E40B0(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint] = 0;
  *(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancellableBag] = MEMORY[0x263F8EE88];
  *(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_customizeButtonViewModel] = a1;
  *(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancelButtonViewModel] = a2;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  swift_retain();
  swift_retain();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  sub_2473E41A8();

  swift_release();
  swift_release();
  return v6;
}

void sub_2473E41A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  MEMORY[0x270FA5388](v2 - 8);
  v171 = (char *)&v163 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C190);
  MEMORY[0x270FA5388](v4 - 8);
  v170 = (char *)&v163 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = sub_24740E1C0();
  uint64_t v174 = *(void *)(v172 - 8);
  MEMORY[0x270FA5388](v172);
  v177 = (char *)&v163 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = sub_2473CCF64();
  if (qword_26924BAC0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_26924CD50;
  v178 = "igurationUI/WelcomeView.swift";
  sub_24740D410();

  if (qword_26924BAA0 != -1) {
    swift_once();
  }
  double v9 = *(double *)&qword_26924CD30;
  id v10 = objc_allocWithZone(MEMORY[0x263F089B8]);
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_initWithString_, v11);

  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), sel_init);
  objc_msgSend(v13, sel_setLineSpacing_, v9);
  objc_msgSend(v13, sel_setAlignment_, 1);
  objc_msgSend(v13, sel_setLineBreakStrategy_, 1);
  uint64_t v14 = *MEMORY[0x263F81540];
  id v15 = v13;
  objc_msgSend(v12, sel_addAttribute_value_range_, v14, v15, 0, objc_msgSend(v12, sel_length));

  id v173 = v7;
  objc_msgSend(v7, sel_setAttributedText_, v12);
  swift_bridgeObjectRelease();

  id v176 = sub_2473CD090();
  id v16 = (id)qword_26924CD50;
  sub_24740D410();

  if (qword_26924BAA8 != -1) {
    swift_once();
  }
  double v17 = *(double *)&qword_26924CD38;
  id v18 = objc_allocWithZone(MEMORY[0x263F089B8]);
  swift_bridgeObjectRetain();
  uint64_t v19 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v18, sel_initWithString_, v19);

  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), sel_init);
  objc_msgSend(v21, sel_setLineSpacing_, v17);
  objc_msgSend(v21, sel_setAlignment_, 1);
  objc_msgSend(v21, sel_setLineBreakStrategy_, 1);
  id v22 = v21;
  objc_msgSend(v20, sel_addAttribute_value_range_, v14, v22, 0, objc_msgSend(v20, sel_length));

  objc_msgSend(v176, sel_setAttributedText_, v20);
  swift_bridgeObjectRelease();

  id v23 = sub_2473CD090();
  id v24 = (id)qword_26924CD50;
  sub_24740D410();

  double v25 = *(double *)&qword_26924CD38;
  id v26 = objc_allocWithZone(MEMORY[0x263F089B8]);
  swift_bridgeObjectRetain();
  uint64_t v27 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v26, sel_initWithString_, v27);

  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), (SEL)&selRef_addChildViewController_);
  objc_msgSend(v29, sel_setLineSpacing_, v25);
  objc_msgSend(v29, sel_setAlignment_, 1);
  objc_msgSend(v29, sel_setLineBreakStrategy_, 1);
  id v30 = v29;
  objc_msgSend(v28, sel_addAttribute_value_range_, v14, v30, 0, objc_msgSend(v28, sel_length));

  objc_msgSend(v23, sel_setAttributedText_, v28);
  swift_bridgeObjectRelease();

  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), (SEL)&selRef_addChildViewController_);
  id v32 = objc_msgSend(v31, sel_heightAnchor);
  id v33 = objc_msgSend(v32, sel_constraintEqualToConstant_, 0.0);

  uint64_t v34 = OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint;
  uint64_t v35 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint];
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint] = v33;

  uint64_t v36 = *(void **)&v1[v34];
  if (!v36)
  {
    __break(1u);
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  objc_msgSend(v36, sel_setActive_, 1);
  v178 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_26924BF18);
  uint64_t v37 = swift_allocObject();
  long long v175 = xmmword_2474106E0;
  *(_OWORD *)(v37 + 16) = xmmword_2474106E0;
  uint64_t v38 = v173;
  *(void *)(v37 + 32) = v31;
  *(void *)(v37 + 40) = v38;
  id v39 = v176;
  *(void *)(v37 + 48) = v176;
  *(void *)(v37 + 56) = v23;
  uint64_t v179 = v37;
  sub_24740DD90();
  id v40 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  uint64_t v41 = sub_2473CF248(0, &qword_26924C510);
  id v169 = v31;
  id v42 = v38;
  id v43 = v39;
  id v44 = v23;
  objc_super v45 = (void *)sub_24740DD60();
  swift_bridgeObjectRelease();
  id v46 = objc_msgSend(v40, sel_initWithArrangedSubviews_, v45);

  objc_msgSend(v46, sel_setAxis_, 1);
  if (qword_26924BAB0 != -1) {
    swift_once();
  }
  objc_msgSend(v46, sel_setCustomSpacing_afterView_, v42, *(double *)&qword_26924CD40);
  objc_msgSend(v46, sel_setSpacing_, 18.0);
  objc_msgSend(v46, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v47 = objc_msgSend(v46, sel_layer);
  objc_msgSend(v47, sel_setAllowsGroupOpacity_, 0);

  id v48 = objc_msgSend(v46, sel_layer);
  objc_msgSend(v48, sel_setAllowsGroupBlending_, 0);

  id v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v50 = OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView;
  uint64_t v51 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView];
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView] = v49;

  char v52 = *(void **)&v1[v50];
  if (!v52) {
    goto LABEL_61;
  }
  objc_msgSend(v52, sel_addSubview_, v46);
  uint64_t v53 = *(void **)&v1[v50];
  if (!v53)
  {
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  uint64_t v54 = v46;
  objc_msgSend(v53, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v55 = objc_msgSend(v1, sel_traitCollection);
  id v56 = objc_msgSend(v55, sel_preferredContentSizeCategory);

  LOBYTE(v55) = sub_24740DFB0();
  if (v55) {
    double v57 = 32.0;
  }
  else {
    double v57 = 44.0;
  }
  if (qword_26924BAD0 != -1) {
    swift_once();
  }
  id v168 = v42;
  double v58 = *(double *)&qword_26924CD58;
  uint64_t v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = v175;
  id v60 = objc_msgSend(v46, sel_topAnchor);
  uint64_t v61 = *(void **)&v1[v50];
  if (!v61) {
    goto LABEL_63;
  }
  id v167 = v44;
  id v173 = (id)v41;
  id v62 = objc_msgSend(v61, sel_topAnchor);
  id v63 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v62);

  *(void *)(v59 + 32) = v63;
  id v64 = objc_msgSend(v54, sel_leadingAnchor);
  uint64_t v65 = *(void **)&v1[v50];
  if (!v65)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  double v66 = v57 - v58;
  id v67 = objc_msgSend(v65, sel_leadingAnchor);
  id v68 = objc_msgSend(v64, sel_constraintEqualToAnchor_constant_, v67, v66);

  *(void *)(v59 + 40) = v68;
  id v69 = objc_msgSend(v54, sel_trailingAnchor);
  uint64_t v70 = *(void **)&v1[v50];
  if (!v70)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  id v71 = objc_msgSend(v70, sel_trailingAnchor);
  id v72 = objc_msgSend(v69, sel_constraintEqualToAnchor_constant_, v71, -v66);

  *(void *)(v59 + 48) = v72;
  id v166 = v54;
  id v73 = objc_msgSend(v54, sel_bottomAnchor);
  id v74 = *(void **)&v1[v50];
  if (!v74)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  id v75 = v73;
  id v76 = self;
  id v77 = objc_msgSend(v74, sel_bottomAnchor);
  id v78 = objc_msgSend(v75, sel_constraintEqualToAnchor_, v77);

  *(void *)(v59 + 56) = v78;
  uint64_t v179 = v59;
  sub_24740DD90();
  id v176 = (id)sub_2473CF248(0, &qword_26924C518);
  id v79 = (void *)sub_24740DD60();
  swift_bridgeObjectRelease();
  objc_msgSend(v76, sel_activateConstraints_, v79);

  id v80 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82B88]), sel_init);
  uint64_t v81 = OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView;
  uint64_t v82 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView];
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView] = v80;

  uint64_t v83 = *(void **)&v1[v81];
  if (!v83)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (!*(void *)&v1[v50])
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  objc_msgSend(v83, sel_addSubview_);
  uint64_t v84 = *(void **)&v1[v81];
  if (!v84)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  objc_msgSend(v84, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = v175;
  v86 = *(void **)&v1[v50];
  if (!v86)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  id v87 = objc_msgSend(v86, sel_topAnchor);
  uint64_t v88 = *(void **)&v1[v81];
  if (!v88)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  id v89 = objc_msgSend(v88, sel_topAnchor);
  id v90 = objc_msgSend(v87, sel_constraintEqualToAnchor_, v89);

  *(void *)(v85 + 32) = v90;
  v91 = *(void **)&v1[v50];
  if (!v91)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  id v92 = objc_msgSend(v91, sel_leftAnchor);
  v93 = *(void **)&v1[v81];
  if (!v93)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  id v94 = objc_msgSend(v93, sel_leftAnchor);
  id v95 = objc_msgSend(v92, sel_constraintEqualToAnchor_, v94);

  *(void *)(v85 + 40) = v95;
  uint64_t v96 = *(void **)&v1[v50];
  if (!v96)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  id v97 = objc_msgSend(v96, sel_widthAnchor);
  uint64_t v98 = *(void **)&v1[v81];
  if (!v98)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  id v99 = objc_msgSend(v98, sel_widthAnchor);
  id v100 = objc_msgSend(v97, sel_constraintEqualToAnchor_, v99);

  *(void *)(v85 + 48) = v100;
  uint64_t v101 = *(void **)&v1[v50];
  if (!v101)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  id v102 = objc_msgSend(v101, sel_bottomAnchor);
  char v103 = *(void **)&v1[v81];
  if (!v103)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  id v104 = objc_msgSend(v103, sel_bottomAnchor);
  if (qword_26924BAB8 != -1) {
    swift_once();
  }
  id v105 = objc_msgSend(v102, sel_constraintEqualToAnchor_constant_, v104, -*(double *)&qword_26924CD48);

  *(void *)(v85 + 56) = v105;
  uint64_t v179 = v85;
  sub_24740DD90();
  char v106 = (void *)sub_24740DD60();
  swift_bridgeObjectRelease();
  objc_msgSend(v76, sel_activateConstraints_, v106);

  uint64_t v107 = *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_customizeButtonViewModel];
  uint64_t v108 = *(void *)(v107 + 16);
  uint64_t v109 = *(void *)(v108 + 24);
  id v165 = v43;
  id v164 = v76;
  if (v109)
  {
    uint64_t v110 = *(void *)(v108 + 16);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v110 = 0;
    uint64_t v109 = 0xE000000000000000;
  }
  uint64_t v111 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  id v112 = sub_2473DC660(v110, v109, 0, 0, 0, 0, (uint64_t)sub_2473E61BC, v111);
  swift_bridgeObjectRelease();
  swift_release_n();
  sub_2473DB008(v107);
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  swift_release();
  type metadata accessor for HighlightAnimatingMenuButton();
  sub_2473CF248(0, (unint64_t *)&qword_26924C178);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_24740E050();
  uint64_t v113 = (void *)sub_24740E1F0();
  LODWORD(v114) = 1148846080;
  objc_msgSend(v113, sel_setContentHuggingPriority_forAxis_, 1, v114);
  LODWORD(v115) = 1148846080;
  objc_msgSend(v113, sel_setContentCompressionResistancePriority_forAxis_, 1, v115);
  sub_24740E180();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v116 = v170;
  sub_24740D610();
  uint64_t v117 = sub_24740D600();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v117 - 8) + 56))(v116, 0, 1, v117);
  sub_24740E140();
  uint64_t v118 = *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancelButtonViewModel];
  if (*(void *)(*(void *)(v118 + 16) + 24)) {
    swift_bridgeObjectRetain();
  }
  char v119 = v177;
  sub_24740E1A0();
  uint64_t v120 = v174;
  char v121 = v171;
  uint64_t v122 = v119;
  uint64_t v123 = v172;
  (*(void (**)(char *, char *, uint64_t))(v174 + 16))(v171, v122, v172);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v120 + 56))(v121, 0, 1, v123);
  id v124 = v113;
  sub_24740E1E0();

  sub_2473DB008(v118);
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  swift_release();
  uint64_t v125 = swift_allocObject();
  *(_OWORD *)(v125 + 16) = xmmword_2474106F0;
  uint64_t v126 = *(void **)&v1[v81];
  if (!v126) {
    goto LABEL_78;
  }
  *(void *)(v125 + 32) = v126;
  *(void *)(v125 + 40) = v112;
  *(void *)(v125 + 48) = v124;
  uint64_t v179 = v125;
  sub_24740DD90();
  id v127 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  *(void *)&long long v175 = v124;
  id v128 = v112;
  id v129 = v126;
  uint64_t v130 = (SEL *)sub_24740DD60();
  swift_bridgeObjectRelease();
  id v131 = objc_msgSend(v127, sel_initWithArrangedSubviews_, v130);

  uint64_t v132 = OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView;
  uint64_t v133 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView];
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView] = v131;

  if (!*(void *)&v1[v132])
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  objc_msgSend(v1, sel_addSubview_);
  uint64_t v134 = *(void **)&v1[v132];
  if (!v134)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  objc_msgSend(v134, sel_setAxis_, 1);
  uint64_t v135 = *(void **)&v1[v132];
  if (!v135)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  uint64_t v136 = qword_26924BAF0;
  id v137 = v135;
  if (v136 == -1)
  {
    if (*(void *)&v1[v50]) {
      goto LABEL_45;
    }
  }
  else
  {
    swift_once();
    if (*(void *)&v1[v50])
    {
LABEL_45:
      uint64_t v130 = (SEL *)&off_265212000;
      objc_msgSend(v137, sel_setCustomSpacing_afterView_, *(double *)&qword_26924C4D0);

      uint64_t v138 = *(void **)&v1[v132];
      if (v138)
      {
        uint64_t v139 = qword_26924BAE8;
        id v137 = v138;
        if (v139 == -1) {
          goto LABEL_47;
        }
        goto LABEL_59;
      }
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
  }
  __break(1u);
LABEL_59:
  swift_once();
LABEL_47:
  objc_msgSend(v137, v130[296], v128, *(double *)&qword_26924CD70);

  uint64_t v140 = *(void **)&v1[v132];
  if (!v140)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  objc_msgSend(v140, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v141 = swift_allocObject();
  *(_OWORD *)(v141 + 16) = xmmword_247410700;
  uint64_t v142 = *(void **)&v1[v132];
  if (!v142)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  id v143 = objc_msgSend(v142, sel_topAnchor);
  id v144 = objc_msgSend(v1, sel_topAnchor);
  id v145 = objc_msgSend(v143, sel_constraintEqualToAnchor_, v144);

  *(void *)(v141 + 32) = v145;
  uint64_t v146 = *(void **)&v1[v132];
  if (!v146)
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  id v147 = objc_msgSend(v146, sel_leadingAnchor);
  id v148 = objc_msgSend(v1, sel_leadingAnchor);
  id v149 = objc_msgSend(v147, sel_constraintEqualToAnchor_constant_, v148, *(double *)&qword_26924CD58);

  *(void *)(v141 + 40) = v149;
  uint64_t v150 = *(void **)&v1[v132];
  if (!v150)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  id v151 = objc_msgSend(v150, sel_trailingAnchor);
  id v152 = objc_msgSend(v1, sel_trailingAnchor);
  id v153 = objc_msgSend(v151, sel_constraintEqualToAnchor_constant_, v152, -*(double *)&qword_26924CD58);

  *(void *)(v141 + 48) = v153;
  v154 = *(void **)&v1[v132];
  if (!v154)
  {
LABEL_87:
    __break(1u);
    return;
  }
  id v155 = objc_msgSend(v154, sel_bottomAnchor);
  id v156 = objc_msgSend(v1, sel_safeAreaLayoutGuide);
  id v157 = objc_msgSend(v156, sel_bottomAnchor);

  if (qword_26924BAD8 != -1) {
    swift_once();
  }
  id v158 = objc_msgSend(v155, sel_constraintEqualToAnchor_constant_, v157, -*(double *)&qword_26924CD60);

  *(void *)(v141 + 56) = v158;
  v159 = (void *)v175;
  id v160 = objc_msgSend((id)v175, sel_heightAnchor);
  if (qword_26924BAE0 != -1) {
    swift_once();
  }
  id v161 = objc_msgSend(v160, sel_constraintEqualToConstant_, *(double *)&qword_26924CD68);

  *(void *)(v141 + 64) = v161;
  uint64_t v179 = v141;
  sub_24740DD90();
  v162 = (void *)sub_24740DD60();
  swift_bridgeObjectRelease();
  objc_msgSend(v164, sel_activateConstraints_, v162);

  (*(void (**)(char *, uint64_t))(v174 + 8))(v177, v123);
}

uint64_t sub_2473E5900(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x24C5555B0](v1);
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = *(void *)(result + OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_customizeButtonViewModel);
    swift_retain();

    uint64_t v5 = *(void **)(v4 + 16);
    uint64_t v6 = v5[2];
    uint64_t v7 = v5[3];
    id v8 = (void *)v5[4];
    double v9 = (void (*)(void))v5[7];
    sub_2473DBAA8(v6, v7, v8);
    uint64_t result = swift_release();
    if (v7)
    {
      swift_retain();
      sub_2473DAFA4(v6, v7, v8);
      v9();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2473E59F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x24C5555B0](v2);
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = *(void *)(result + OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancelButtonViewModel);
    swift_retain();

    uint64_t v6 = *(void **)(v5 + 16);
    uint64_t v7 = v6[2];
    uint64_t v8 = v6[3];
    double v9 = (void *)v6[4];
    id v10 = (void (*)(void))v6[7];
    sub_2473DBAA8(v7, v8, v9);
    uint64_t result = swift_release();
    if (v8)
    {
      swift_retain();
      sub_2473DAFA4(v7, v8, v9);
      v10();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2473E5AE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24740D430();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x24C5555B0](a2 + 16);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  if (!v10) {
    return v11(a3, a1, v6);
  }
  id v12 = (void *)v10;
  v11((uint64_t)v9, a1, v6);
  uint64_t KeyPath = swift_getKeyPath();
  *(&v20 - 2) = (id)MEMORY[0x270FA5388](KeyPath);
  swift_getKeyPath();
  id v20 = sub_2473CCE38(*MEMORY[0x263F83570]);
  sub_2473E61F4();
  sub_24740D420();
  uint64_t v14 = swift_getKeyPath();
  *(&v20 - 2) = (id)MEMORY[0x270FA5388](v14);
  swift_getKeyPath();
  id v15 = objc_msgSend(self, sel_whiteColor);
  unsigned int v16 = objc_msgSend(v12, sel_isHighlighted);
  double v17 = 1.0;
  if (v16) {
    double v17 = 0.5;
  }
  id v18 = objc_msgSend(v15, sel_colorWithAlphaComponent_, v17);

  id v20 = v18;
  sub_2473DCD58();
  sub_24740D420();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
}

uint64_t sub_2473E5D6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2473E5D78(a1, a2, a3, &qword_26924C530);
}

uint64_t sub_2473E5D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_24740DCB0() & 1;
}

uint64_t sub_2473E5DD0(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_26924C530);
}

uint64_t keypath_hashTm(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_24740DCA0();
}

void sub_2473E5E20()
{
}

void sub_2473E5E48()
{
}

void sub_2473E5E64()
{
  v10.receiver = v0;
  v10.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v10, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView];
  if (!v1)
  {
    __break(1u);
    goto LABEL_11;
  }
  objc_msgSend(v1, sel_layoutIfNeeded);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint];
  if (!v2)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView];
  if (!v3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v4 = v2;
  objc_msgSend(v3, sel_frame);
  double Height = CGRectGetHeight(v11);
  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView];
  if (!v6)
  {
LABEL_13:
    __break(1u);
    return;
  }
  double v7 = Height;
  objc_msgSend(v6, sel_frame);
  double v8 = CGRectGetHeight(v12);
  if (qword_26924BAF0 != -1) {
    swift_once();
  }
  double v9 = v7 - v8 - *(double *)&qword_26924C4D0;
  if (v9 <= 0.0) {
    double v9 = 0.0;
  }
  objc_msgSend(v4, sel_setConstant_, v9);
}

uint64_t type metadata accessor for WelcomeView()
{
  return self;
}

void sub_2473E60D8()
{
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancellableBag] = MEMORY[0x263F8EE88];

  sub_24740E480();
  __break(1u);
}

uint64_t sub_2473E6184()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473E61BC()
{
  return sub_2473E5900(v0);
}

uint64_t sub_2473E61C4(uint64_t a1)
{
  return sub_2473E59F4(a1, v1);
}

uint64_t sub_2473E61CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2473E5AE8(a1, v2, a2);
}

void sub_2473E61D4()
{
}

unint64_t sub_2473E61F4()
{
  unint64_t result = qword_26924C520;
  if (!qword_26924C520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C520);
  }
  return result;
}

void sub_2473E6248()
{
}

uint64_t sub_2473E6270()
{
  return 8;
}

uint64_t sub_2473E627C()
{
  return swift_release();
}

uint64_t sub_2473E6284(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_2473E6290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2473E5D78(a1, a2, a3, &qword_26924C530) & 1;
}

uint64_t sub_2473E62B4(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_26924C530);
}

void *sub_2473E62C0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_2473E62CC()
{
}

void sub_2473E62EC()
{
}

uint64_t sub_2473E6314()
{
  return 8;
}

uint64_t sub_2473E6320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2473E5D78(a1, a2, a3, &qword_26924C528) & 1;
}

uint64_t sub_2473E6344(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_26924C528);
}

uint64_t sub_2473E6360(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_2473E63B4()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Preloader()), sel_init);
  qword_26B12B930 = (uint64_t)result;
  return result;
}

id static Preloader.shared.getter()
{
  if (qword_26B12B838 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B12B930;
  return v0;
}

uint64_t sub_2473E6504(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (a1)
  {
    uint64_t v10 = a1;
    uint64_t v11 = a2;
    *(void *)&long long v8 = MEMORY[0x263EF8330];
    *((void *)&v8 + 1) = 1107296256;
    *(void *)&long long v9 = sub_2473E6360;
    *((void *)&v9 + 1) = &block_descriptor_5;
    id v4 = _Block_copy(&v8);
    swift_retain();
    swift_release();
  }
  else
  {
    id v4 = 0;
  }
  id v5 = (id)ABLoadResourcesWithCompletion();
  _Block_release(v4);
  if (v5)
  {
    sub_24740E240();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  uint64_t v6 = v3 + OBJC_IVAR___BCPreloader_resourceLoadToken;
  swift_beginAccess();
  sub_2473E66FC((uint64_t)&v8, v6);
  swift_endAccess();
  if (qword_26B12B928 != -1) {
    swift_once();
  }
  *(void *)&long long v8 = sub_2473EB9CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA80);
  sub_2473E6AA4();
  sub_24740D790();
  swift_release();
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2473E66FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12BBE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473E6820()
{
  memset(v4, 0, sizeof(v4));
  uint64_t v1 = v0 + OBJC_IVAR___BCPreloader_resourceLoadToken;
  swift_beginAccess();
  sub_2473E66FC((uint64_t)v4, v1);
  swift_endAccess();
  uint64_t v2 = (void *)(v0 + OBJC_IVAR___BCPreloader_cancellableBag);
  swift_beginAccess();
  *uint64_t v2 = MEMORY[0x263F8EE88];
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473E68B4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  memset(v9, 0, sizeof(v9));
  uint64_t v4 = v0 + OBJC_IVAR___BCPreloader_resourceLoadToken;
  swift_beginAccess();
  sub_2473E66FC((uint64_t)v9, v4);
  swift_endAccess();
  id v5 = (void *)(v0 + OBJC_IVAR___BCPreloader_cancellableBag);
  swift_beginAccess();
  *id v5 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRelease();
  ABReleaseResources();
  uint64_t v6 = sub_24740D4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  sub_2473EB344(0xD000000000000013, 0x8000000247412910, (uint64_t)v3);
  return sub_2473D34E0((uint64_t)v3, qword_26924C548);
}

id Preloader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Preloader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2473E6AA4()
{
  unint64_t result = qword_26B12BA78;
  if (!qword_26B12BA78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B12BA80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B12BA78);
  }
  return result;
}

uint64_t type metadata accessor for Preloader()
{
  return self;
}

uint64_t method lookup function for Preloader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Preloader);
}

uint64_t dispatch thunk of Preloader.preloadResources(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of Preloader.cancelPreload()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of Preloader.clearCache()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t sub_2473E6BD8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473E6C10(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_2473E6C2C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2473E6CCC()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  swift_release();
  return v0;
}

uint64_t sub_2473E6D58()
{
  sub_2473E6CCC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for PublishedValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

char *sub_2473E6DF8(int a1, uint64_t a2, uint64_t a3)
{
  int v42 = a1;
  int v39 = a1 & 1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  MEMORY[0x270FA5388](v5 - 8);
  double v7 = &v38[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C198);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = &v38[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C190);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = &v38[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v41 = sub_24740E1C0();
  uint64_t v14 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  unsigned int v16 = &v38[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for ConfigureButton();
  sub_2473CF248(0, (unint64_t *)&qword_26924C178);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  swift_retain();
  sub_24740E050();
  id v18 = (char *)sub_24740E1F0();
  id v19 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v19, sel_setAllowsGroupOpacity_, 0);

  id v20 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v20, sel_setAllowsGroupBlending_, 0);

  sub_24740E180();
  id v21 = sub_2473CCE38(*MEMORY[0x263F835B8]);
  id v22 = objc_msgSend(self, sel_configurationWithFont_, v21);

  sub_24740E060();
  sub_24740E100();
  id v23 = objc_msgSend(v18, sel_traitCollection);
  id v24 = objc_msgSend(v23, sel_preferredContentSizeCategory);

  sub_24740DFB0();
  sub_24740E110();
  objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView], sel_bounds);
  CGRectGetWidth(v43);
  sub_24740E0F0();
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v25;
  LOBYTE(v17) = v39;
  *(unsigned char *)(v26 + 24) = v39;
  uint64_t v27 = v40;
  *(void *)(v26 + 32) = v40;
  sub_24740D610();
  uint64_t v28 = sub_24740D600();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v13, 0, 1, v28);
  sub_24740E140();
  uint64_t v29 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v29;
  *(unsigned char *)(v30 + 24) = v17;
  *(void *)(v30 + 32) = v27;
  sub_24740D5F0();
  uint64_t v31 = sub_24740D5E0();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v10, 0, 1, v31);
  uint64_t v32 = v41;
  sub_24740E130();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v14 + 16))(v7, v16, v32);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v7, 0, 1, v32);
  id v33 = v18;
  sub_24740E1E0();

  if ((v42 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = (char *)objc_msgSend(v33, sel_titleLabel);
  if (result)
  {
    uint64_t v35 = result;
    id v36 = objc_msgSend(result, sel_layer);

    objc_msgSend(v36, sel_setCompositingFilter_, *MEMORY[0x263F15D58]);
    char v37 = v33[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron];
    v33[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron] = 1;
    if ((v37 & 1) == 0) {
      sub_2473E7EC0();
    }
LABEL_5:
    (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v16, v32);
    return v33;
  }
  __break(1u);
  return result;
}

void sub_2473E7404(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a2 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x24C5555B0](v7);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = sub_24740D430();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a4, a1, v10);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    swift_getKeyPath();
    uint64_t v12 = (uint64_t *)MEMORY[0x263F83570];
    int v13 = a3 & 1;
    if (v13) {
      uint64_t v12 = (uint64_t *)MEMORY[0x263F835F0];
    }
    id v16 = sub_2473CCE38(*v12);
    sub_2473E61F4();
    sub_24740D420();
    uint64_t v14 = swift_getKeyPath();
    MEMORY[0x270FA5388](v14);
    swift_getKeyPath();
    sub_2473E8D94(v13, (char)objc_msgSend(v9, sel_isHighlighted, v16));
    sub_2473DCD58();
    sub_24740D420();
  }
  else
  {
    uint64_t v15 = sub_24740D430();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(a4, a1, v15);
  }
}

id sub_2473E75FC(void *a1, uint64_t a2, char a3)
{
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = (void *)MEMORY[0x24C5555B0](v4);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = sub_2473E8D94(a3 & 1, (char)objc_msgSend(v5, sel_isHighlighted));

    return v7;
  }
  else
  {
    return a1;
  }
}

void sub_2473E76FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v54 - v6;
  uint64_t v8 = sub_24740E1C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24740E1D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_2473DB3A8((uint64_t)v7);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  uint64_t v12 = sub_24740E160();
  if (v12)
  {
    int v13 = (void *)v12;
    id v56 = sub_2473CCE38(*MEMORY[0x263F835B8]);
    int v55 = MEMORY[0x24C554E50](v13);
    id v14 = objc_msgSend(v0, sel__imageView);
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = objc_msgSend(v14, sel_layer);
      if (v55)
      {
        sub_24740DCF0();
        uint64_t v17 = sub_24740DCC0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v17 = 0;
      }
      objc_msgSend(v16, sel_setCompositingFilter_, v17);

      swift_unknownObjectRelease();
    }
    id v54 = v15;
    int v18 = MEMORY[0x24C554E50](v13);
    BOOL v19 = v18 == 0;
    if (v18) {
      uint64_t v20 = 32;
    }
    else {
      uint64_t v20 = 8552674;
    }
    if (v19) {
      uint64_t v21 = 0xA300000000000000;
    }
    else {
      uint64_t v21 = 0xE100000000000000;
    }
    double v22 = sub_2473E83F4(v20, v21);
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    swift_bridgeObjectRelease();
    v59.origin.x = v22;
    v59.origin.y = v24;
    v59.size.width = v26;
    v59.size.height = v28;
    double v29 = ceil(CGRectGetWidth(v59));
    sub_24740E0C0();
    if (v29 == v30)
    {
      if (v55)
      {
LABEL_17:
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

LABEL_30:
        return;
      }
    }
    else
    {
      int v31 = MEMORY[0x24C554E50](v13);
      BOOL v32 = v31 == 0;
      if (v31) {
        uint64_t v33 = 32;
      }
      else {
        uint64_t v33 = 8552674;
      }
      if (v32) {
        uint64_t v34 = 0xA300000000000000;
      }
      else {
        uint64_t v34 = 0xE100000000000000;
      }
      double v35 = sub_2473E83F4(v33, v34);
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      swift_bridgeObjectRelease();
      v60.origin.x = v35;
      v60.origin.y = v37;
      v60.size.width = v39;
      v60.size.height = v41;
      CGRectGetWidth(v60);
      sub_24740E0D0();
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v11, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
      sub_24740E1E0();
      if (v55) {
        goto LABEL_17;
      }
    }
    id v42 = v56;
    objc_msgSend(v56, sel_lineHeight);
    double v44 = v43;
    uint64_t v45 = sub_24740E190();
    if (!v46)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      goto LABEL_29;
    }
    uint64_t v47 = v45;
    uint64_t v48 = v46;
    double v49 = round(v44 * 1.15);
    objc_msgSend(v13, sel_size);
    if (v50 == v49)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      swift_bridgeObjectRelease();
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v57 = v47;
    uint64_t v58 = v48;
    sub_24740DE60();
    sub_24740DD20();
    swift_bridgeObjectRelease();
    uint64_t v51 = v57;
    uint64_t v52 = v58;
    uint64_t v53 = (uint64_t *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_iconCache];
    swift_beginAccess();
    sub_2473E7C5C(v53, v51, v52, v49, v49);
    swift_endAccess();
    swift_bridgeObjectRelease();
    sub_24740E170();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v11, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
    sub_24740E1E0();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_2473E7C5C(uint64_t *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *a1;
  if (*(void *)(*a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_247409310(a2, a3);
    if (v14)
    {
      id v15 = *(id *)(*(void *)(v12 + 56) + 8 * v13);
      swift_bridgeObjectRelease();
      return (uint64_t)v15;
    }
    swift_bridgeObjectRelease();
  }
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827A0]), sel_initWithSize_, a4, a5);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v6;
  *(double *)(v18 + 24) = a4;
  *(double *)(v18 + 32) = a5;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_2473E8C78;
  *(void *)(v19 + 24) = v18;
  v25[4] = sub_2473E8CA4;
  v25[5] = v19;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 1107296256;
  v25[2] = sub_2473E8B9C;
  v25[3] = &block_descriptor_6;
  uint64_t v20 = _Block_copy(v25);
  id v21 = v6;
  swift_retain();
  swift_release();
  id v22 = objc_msgSend(v17, sel_imageWithActions_, v20);

  _Block_release(v20);
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v17)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    id v23 = v22;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25[0] = *a1;
    *a1 = 0x8000000000000000;
    sub_2473FAC8C((uint64_t)v23, a2, a3, isUniquelyReferenced_nonNull_native);
    *a1 = v25[0];
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v23;
  }
  return result;
}

uint64_t sub_2473E7EC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v54 - v6;
  uint64_t v8 = sub_24740E1C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24740E1D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_2473DB3A8((uint64_t)v7);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  unint64_t v13 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView];
  id v14 = objc_msgSend(v13, sel_image);
  if (v14)
  {
    id v15 = v14;
    id v16 = objc_msgSend(v13, sel_superview);

    if (!v16) {
      objc_msgSend(v1, sel_addSubview_, v13);
    }
    if ((objc_msgSend(v1, sel_isHidden) & 1) != 0 || !objc_msgSend(v1, sel_isEnabled)) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron];
    }
    objc_msgSend(v13, sel_setHidden_, v17);
    id v18 = objc_msgSend(self, sel_whiteColor);
    unsigned int v19 = objc_msgSend(v1, sel_isHighlighted);
    double v20 = 0.35;
    if (v19) {
      double v20 = 0.25;
    }
    id v21 = objc_msgSend(v18, sel_colorWithAlphaComponent_, v20);

    objc_msgSend(v13, sel_setTintColor_, v21);
    sub_24740E0E0();
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = 0.0;
    if ((objc_msgSend(v13, sel_isHidden) & 1) == 0)
    {
      objc_msgSend(v13, sel_bounds);
      double Width = CGRectGetWidth(v55);
      id v30 = sub_2473CCE38(*MEMORY[0x263F835B8]);
      int v31 = MEMORY[0x24C554E50](v15);
      BOOL v32 = v31 == 0;
      if (v31) {
        uint64_t v33 = 32;
      }
      else {
        uint64_t v33 = 8552674;
      }
      if (v32) {
        uint64_t v34 = 0xA300000000000000;
      }
      else {
        uint64_t v34 = 0xE100000000000000;
      }
      double v35 = sub_2473E83F4(v33, v34);
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      swift_bridgeObjectRelease();
      v56.origin.x = v35;
      v56.origin.y = v37;
      v56.size.width = v39;
      v56.size.height = v41;
      double v42 = CGRectGetWidth(v56);

      double v28 = Width + ceil(v42);
    }
    sub_24740E0E0();
    if (v46 != v23 || v43 != v25 || v44 != v27 || v45 != v28)
    {
      sub_24740E0F0();
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v11, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
      sub_24740E1E0();
    }
    objc_msgSend(v13, sel_sizeToFit);
    id v47 = objc_msgSend(v1, sel_traitCollection);
    id v48 = objc_msgSend(v47, sel_layoutDirection);

    double v49 = 0.0;
    if (v48 != (id)1)
    {
      objc_msgSend(v1, sel_bounds);
      double v50 = CGRectGetWidth(v57);
      objc_msgSend(v13, sel_bounds);
      double v49 = v50 - CGRectGetWidth(v58);
    }
    objc_msgSend(v1, sel_bounds);
    double Height = CGRectGetHeight(v59);
    objc_msgSend(v13, sel_bounds);
    double v52 = (Height - CGRectGetHeight(v60)) * 0.5;
    objc_msgSend(v13, sel_bounds);
    double v53 = CGRectGetWidth(v61);
    objc_msgSend(v13, sel_bounds);
    objc_msgSend(v13, sel_setFrame_, v49, v52, v53, CGRectGetHeight(v62));
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

double sub_2473E83F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  sub_24740DD20();
  id v4 = objc_msgSend(v2, sel_fontName);
  sub_24740DCF0();

  sub_24740DD20();
  swift_bridgeObjectRelease();
  sub_24740DD20();
  objc_msgSend(v2, sel_pointSize);
  sub_24740DE60();
  sub_24740DD20();
  swift_bridgeObjectRelease();
  if (qword_26924BB00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = qword_26924CD78;
  if (!*(void *)(qword_26924CD78 + 16)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_247409310(a1, a2);
  if ((v7 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_endAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C5E8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247410870;
    uint64_t v10 = (void *)*MEMORY[0x263F814F0];
    *(void *)(inited + 32) = *MEMORY[0x263F814F0];
    *(void *)(inited + 64) = sub_2473CF248(0, (unint64_t *)&unk_26924C5F0);
    *(void *)(inited + 40) = v3;
    swift_bridgeObjectRetain();
    id v11 = v10;
    id v12 = v3;
    sub_2473F1E98(inited);
    id v13 = objc_allocWithZone(MEMORY[0x263F086A0]);
    id v14 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_2473E8BE8();
    id v15 = (void *)sub_24740DC70();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v13, sel_initWithString_attributes_, v14, v15);

    objc_msgSend(v16, sel_boundingRectWithSize_options_context_, 3, 0, 1.79769313e308, 1.79769313e308);
    double v8 = v17;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = qword_26924CD78;
    qword_26924CD78 = 0x8000000000000000;
    sub_2473FAAFC(a1, a2, isUniquelyReferenced_nonNull_native, v8, v19, v21, v23);
    qword_26924CD78 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();

    return v8;
  }
  double v8 = *(double *)(*(void *)(v5 + 56) + 32 * v6);
  swift_endAccess();
  swift_bridgeObjectRelease_n();
  return v8;
}

id sub_2473E8740(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView;
  uint64_t v10 = *MEMORY[0x263F83580];
  id v11 = v4;
  id v12 = sub_2473CCE38(v10);
  id v13 = objc_msgSend(self, sel_configurationWithFont_, v12);

  id v14 = (void *)sub_24740DCC0();
  id v15 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v14, v13);

  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v15);
  *(void *)&v4[v9] = v16;
  v11[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron] = 0;
  uint64_t v17 = OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_iconCache;
  *(void *)&v11[v17] = sub_2473F1FB4(MEMORY[0x263F8EE78]);

  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for ConfigureButton();
  return objc_msgSendSuper2(&v19, sel_initWithFrame_, a1, a2, a3, a4);
}

id sub_2473E88F0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView;
  uint64_t v4 = *MEMORY[0x263F83580];
  uint64_t v5 = v1;
  id v6 = sub_2473CCE38(v4);
  id v7 = objc_msgSend(self, sel_configurationWithFont_, v6);

  double v8 = (void *)sub_24740DCC0();
  id v9 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v8, v7);

  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v9);
  *(void *)&v1[v3] = v10;
  v5[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron] = 0;
  uint64_t v11 = OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_iconCache;
  *(void *)&v5[v11] = sub_2473F1FB4(MEMORY[0x263F8EE78]);

  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for ConfigureButton();
  id v12 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);

  return v12;
}

uint64_t sub_2473E8A90()
{
  return swift_bridgeObjectRelease();
}

id sub_2473E8AD0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigureButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConfigureButton()
{
  return self;
}

unint64_t sub_2473E8B74()
{
  unint64_t result = sub_2473F1D70(MEMORY[0x263F8EE78]);
  qword_26924CD78 = result;
  return result;
}

void sub_2473E8B9C(uint64_t a1, void *a2)
{
  objc_super v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

unint64_t sub_2473E8BE8()
{
  unint64_t result = qword_26924BBE0;
  if (!qword_26924BBE0)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924BBE0);
  }
  return result;
}

uint64_t sub_2473E8C40()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_2473E8C78()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_2473E8C94()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2473E8CA4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2473E8CCC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2473E8D04()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473E8D3C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2473E8D74(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2473E7404(a1, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), a2);
}

id sub_2473E8D84(void *a1)
{
  return sub_2473E75FC(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

id sub_2473E8D94(char a1, char a2)
{
  double v2 = 0.6;
  if ((a1 & 1) == 0) {
    double v2 = 1.0;
  }
  if (a2) {
    double v3 = v2 * 0.5;
  }
  else {
    double v3 = v2;
  }
  id v4 = objc_msgSend(self, sel_systemGray5Color);
  id v5 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v6 = objc_msgSend(v4, sel_resolvedColorWithTraitCollection_, v5);

  id v7 = objc_msgSend(v6, sel_colorWithAlphaComponent_, v3);
  return v7;
}

uint64_t sub_2473E8E90()
{
  return 8;
}

uint64_t sub_2473E8E9C()
{
  return swift_release();
}

uint64_t sub_2473E8EA4(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_2473E8EB8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2473E8ED0()
{
  return 8;
}

uint64_t sub_2473E8EF4(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel) = a1;
  swift_retain();
  uint64_t v3 = swift_release();
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 408))(v3);
}

void sub_2473E8F74(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_2473E8F80(void *a1)
{
  double v2 = v1;
  if (objc_msgSend(a1, sel_presentationStyle))
  {
    if (*(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
    {
      swift_retain();
      sub_24740D680();
      swift_release();
    }
    id v4 = objc_msgSend(a1, sel_presentedViewController);
    id v5 = objc_msgSend(v4, sel_transitionCoordinator);

    if (v5)
    {
      uint64_t v6 = swift_allocObject();
      *(void *)(v6 + 16) = v2;
      v9[4] = sub_2473EA8F4;
      v9[5] = v6;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 1107296256;
      _OWORD v9[2] = sub_2473EA2EC;
      v9[3] = &block_descriptor_7;
      id v7 = _Block_copy(v9);
      id v8 = v2;
      swift_release();
      objc_msgSend(v5, sel_animateAlongsideTransition_completion_, 0, v7);
      _Block_release(v7);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_2473E90DC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C668);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v72 = v1;
  uint64_t v73 = v2;
  MEMORY[0x270FA5388](v1);
  id v71 = (char *)v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_24740DF80();
  uint64_t v61 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  CGRect v56 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C670);
  uint64_t v5 = MEMORY[0x270FA5388](v68);
  CGRect v62 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  CGRect v55 = (char *)v48 - v7;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C678);
  uint64_t v67 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  CGRect v60 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C680);
  uint64_t v69 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  CGRect v59 = (char *)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C688);
  uint64_t v64 = *(void *)(v70 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v70);
  id v63 = (char *)v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  CGRect v57 = (char *)v48 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C690);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v48[3] = (char *)v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  v48[0] = (char *)v48 - v18;
  MEMORY[0x270FA5388](v17);
  v48[1] = (char *)v48 - v19;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C698);
  uint64_t v50 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  double v21 = (char *)v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C6A0);
  uint64_t v53 = *(void *)(v54 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v54);
  double v52 = (char *)v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = v0[3];
  id v74 = (char *)v48 - v25;
  uint64_t v75 = v24;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C6A8);
  sub_2473D3668(&qword_26924C6B0, &qword_26924C6A8);
  sub_24740D780();
  swift_release();
  uint64_t v75 = v0[6];
  swift_retain();
  sub_24740D780();
  swift_release();
  uint64_t v26 = v0[9];
  uint64_t v51 = v0;
  uint64_t v75 = v26;
  swift_retain();
  sub_24740D780();
  swift_release();
  uint64_t v75 = v0[8];
  swift_retain();
  sub_24740D780();
  swift_release();
  v48[2] = MEMORY[0x263EFDB30];
  sub_2473D3668(&qword_26924C6B8, &qword_26924C690);
  sub_24740D650();
  sub_2473D3668(&qword_26924C6C0, &qword_26924C698);
  uint64_t v27 = v49;
  sub_24740D840();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v21, v27);
  double v28 = self;
  id v29 = objc_msgSend(v28, sel_defaultCenter);
  id v30 = v56;
  sub_24740DF90();

  sub_2473EAA10();
  uint64_t v31 = v58;
  sub_24740D780();
  BOOL v32 = *(void (**)(char *, uint64_t))(v61 + 8);
  v32(v30, v31);
  id v33 = objc_msgSend(v28, sel_defaultCenter);
  sub_24740DF90();

  sub_24740D780();
  v32(v30, v31);
  sub_2473D3668(&qword_26924C6D0, &qword_26924C670);
  uint64_t v34 = v60;
  sub_24740D640();
  sub_2473D3668(&qword_26924C6D8, &qword_26924C678);
  double v35 = v59;
  uint64_t v36 = v65;
  sub_24740D7F0();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v34, v36);
  sub_2473D3668(&qword_26924C6E0, &qword_26924C680);
  CGFloat v37 = v57;
  uint64_t v38 = v66;
  sub_24740D840();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v35, v38);
  uint64_t v39 = v53;
  uint64_t v40 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v52, v74, v54);
  uint64_t v41 = v64;
  uint64_t v42 = v70;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v63, v37, v70);
  sub_2473D3668(&qword_26924C6E8, &qword_26924C6A0);
  sub_2473D3668(&qword_26924C6F0, &qword_26924C688);
  double v43 = v71;
  sub_24740D620();
  uint64_t v44 = swift_allocObject();
  swift_weakInit();
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = sub_2473EAAA0;
  *(void *)(v45 + 24) = v44;
  sub_2473D3668(&qword_26924C6F8, &qword_26924C668);
  uint64_t v46 = v72;
  sub_24740D880();
  swift_release();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v43, v46);
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v37, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v74, v40);
}

void sub_2473E9CD0(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_2473E9CD8(char a1, char a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(unsigned char *)(*(void *)(result + 16) + 16) = a1 & a2 & 1;
    swift_retain();
    swift_retain();
    sub_24740D6A0();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t ScreenViewModel.deinit()
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
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ScreenViewModel.__deallocating_deinit()
{
  ScreenViewModel.deinit();
  return MEMORY[0x270FA0228](v0, 96, 7);
}

void *sub_2473E9E18()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C020);
  uint64_t v1 = swift_allocObject();
  *(unsigned char *)(v1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFE8);
  swift_allocObject();
  *(void *)(v1 + 24) = sub_24740D6B0();
  v0[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C6A8);
  swift_allocObject();
  v0[3] = sub_24740D690();
  swift_allocObject();
  v0[4] = sub_24740D690();
  swift_allocObject();
  v0[5] = sub_24740D690();
  swift_allocObject();
  v0[6] = sub_24740D690();
  swift_allocObject();
  v0[7] = sub_24740D690();
  swift_allocObject();
  v0[8] = sub_24740D690();
  swift_allocObject();
  v0[9] = sub_24740D690();
  swift_allocObject();
  uint64_t v2 = sub_24740D690();
  uint64_t v3 = MEMORY[0x263F8EE88];
  v0[10] = v2;
  v0[11] = v3;
  return v0;
}

id sub_2473E9F90(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  id result = objc_msgSendSuper2(&v4, sel_viewIsAppearing_, a1 & 1);
  if (*(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
  {
    swift_retain();
    sub_24740D680();
    return (id)swift_release();
  }
  return result;
}

id sub_2473EA050(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  id result = objc_msgSendSuper2(&v4, sel_viewDidAppear_, a1 & 1);
  if (*(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
  {
    swift_retain();
    sub_24740D680();
    return (id)swift_release();
  }
  return result;
}

id sub_2473EA110(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  id result = objc_msgSendSuper2(&v4, sel_viewWillDisappear_, a1 & 1);
  if (*(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
  {
    swift_retain();
    sub_24740D680();
    return (id)swift_release();
  }
  return result;
}

id sub_2473EA1D0(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  id result = objc_msgSendSuper2(&v4, sel_viewDidDisappear_, a1 & 1);
  if (*(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
  {
    swift_retain();
    sub_24740D680();
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_2473EA290(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel))
  {
    swift_retain();
    sub_24740D680();
    return swift_release();
  }
  return result;
}

uint64_t sub_2473EA2EC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id sub_2473EA3D0(void *a1, uint64_t a2)
{
  id result = objc_msgSend(a1, sel_isCancelled);
  uint64_t v4 = *(void *)(a2 + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel);
  if (result)
  {
    if (!v4) {
      return result;
    }
  }
  else if (!v4)
  {
    return result;
  }
  swift_retain();
  sub_24740D680();
  return (id)swift_release();
}

id ScreenViewModelTrackingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id ScreenViewModelTrackingViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel] = 0;
  if (a2)
  {
    uint64_t v5 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

id ScreenViewModelTrackingViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ScreenViewModelTrackingViewController.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ScreenViewModelTrackingViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2473EA7AC(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = v2;
    if (*(void *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
    {
      swift_retain();
      sub_24740D680();
      swift_release();
    }
    if (a2)
    {
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = v2;
      v8[4] = sub_2473EAB14;
      v8[5] = v5;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 1107296256;
      void v8[2] = sub_2473EA2EC;
      _OWORD v8[3] = &block_descriptor_50;
      id v6 = _Block_copy(v8);
      id v7 = v3;
      swift_release();
      objc_msgSend(a2, sel_animateAlongsideTransition_completion_, 0, v6);
      _Block_release(v6);
    }
  }
}

uint64_t sub_2473EA8BC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2473EA8F4(void *a1)
{
  return sub_2473EA3D0(a1, *(void *)(v1 + 16));
}

uint64_t type metadata accessor for ScreenViewModelTrackingViewController()
{
  return self;
}

uint64_t type metadata accessor for ScreenViewModel()
{
  return self;
}

uint64_t method lookup function for ScreenViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ScreenViewModel);
}

uint64_t method lookup function for ScreenViewModelTrackingViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ScreenViewModelTrackingViewController);
}

uint64_t dispatch thunk of ScreenViewModelTrackingViewController.bind(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ScreenViewModelTrackingViewController.presentationController(_:willPresentWithAdaptiveStyle:transitionCoordinator:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ScreenViewModelTrackingViewController.presentationControllerWillDismiss(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

unint64_t sub_2473EAA10()
{
  unint64_t result = qword_26924C6C8;
  if (!qword_26924C6C8)
  {
    sub_24740DF80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C6C8);
  }
  return result;
}

uint64_t sub_2473EAA68()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473EAAA0(char a1, char a2)
{
  return sub_2473E9CD8(a1, a2);
}

uint64_t sub_2473EAAA8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2473EAAE0(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_2473EAB14(uint64_t a1)
{
  return sub_2473EA290(a1, *(void *)(v1 + 16));
}

void *sub_2473EAB28(uint64_t a1, uint64_t a2)
{
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for MenuButton();
  id v5 = objc_msgSendSuper2(&v10, sel__contextMenuInteraction_styleForMenuWithConfiguration_, a1, a2);
  id v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, sel_setPreferredEdgeInsets_, 0.0, 0.0, 140.0, 0.0);
    objc_msgSend(v6, sel_setPreferredAttachmentEdge_, 0);
    id v7 = objc_msgSend(self, sel_blackColor);
    id v8 = objc_msgSend(v7, sel_colorWithAlphaComponent_, 0.35);

    objc_msgSend(v6, sel_setPreferredBackgroundColor_, v8);
  }
  return v6;
}

id sub_2473EAD5C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MenuButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MenuButton()
{
  return self;
}

uint64_t sub_2473EADB4()
{
  uint64_t v11 = sub_24740DF20();
  uint64_t v0 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  objc_super v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24740DED0();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = sub_24740DC30();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_24740DC10();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473EB758();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F080], v5);
  v10[1] = sub_24740DF50();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_24740DC20();
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_2473EB798();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C710);
  sub_2473EB7F0();
  sub_24740E260();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263F8F130], v11);
  uint64_t result = sub_24740DF40();
  qword_26924C700 = result;
  return result;
}

uint64_t sub_2473EB080@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = sub_24740D4A0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473EB2DC(a1, (uint64_t)v7);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v14(v7, 1, v10) == 1)
  {
    sub_2473EB5C4((uint64_t)v9);
    sub_2473EB6F8((uint64_t)v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v9, v7, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  }
  if (v14(v9, 1, v10) == 1)
  {
    sub_2473EB6F8((uint64_t)v9);
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    sub_24740D490();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v15 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a2, v15, 1, v10);
}

uint64_t sub_2473EB2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2473EB344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v18[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24740D4A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473EB080(a3, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2473EB6F8((uint64_t)v6);
    sub_2473EB84C();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    id v12 = objc_msgSend(self, sel_defaultManager);
    uint64_t v13 = (void *)sub_24740D480();
    v18[0] = 0;
    unsigned __int8 v14 = objc_msgSend(v12, sel_removeItemAtURL_error_, v13, v18);

    if (v14)
    {
      uint64_t v15 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
      id v16 = v18[0];
      return v15(v10, v7);
    }
    else
    {
      id v17 = v18[0];
      sub_24740D450();

      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
}

uint64_t sub_2473EB5C4@<X0>(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend(self, sel_defaultManager);
  uint64_t v3 = 1;
  id v4 = objc_msgSend(v2, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v5 = sub_24740D4A0();
  uint64_t v6 = sub_24740DD70();

  uint64_t v7 = *(void *)(v5 - 8);
  if (*(void *)(v6 + 16))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, v6+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v3 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, v3, 1, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2473EB6F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2473EB758()
{
  unint64_t result = qword_26B12BB40;
  if (!qword_26B12BB40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B12BB40);
  }
  return result;
}

unint64_t sub_2473EB798()
{
  unint64_t result = qword_26924C708;
  if (!qword_26924C708)
  {
    sub_24740DED0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C708);
  }
  return result;
}

unint64_t sub_2473EB7F0()
{
  unint64_t result = qword_26924C718;
  if (!qword_26924C718)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924C710);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C718);
  }
  return result;
}

unint64_t sub_2473EB84C()
{
  unint64_t result = qword_26924C720;
  if (!qword_26924C720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C720);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Persistence.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2473EB93CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Persistence.Errors()
{
  return &type metadata for Persistence.Errors;
}

unint64_t sub_2473EB978()
{
  unint64_t result = qword_26924C728;
  if (!qword_26924C728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C728);
  }
  return result;
}

uint64_t sub_2473EB9CC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAD8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unsigned int v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA10);
  uint64_t v18 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B980);
  uint64_t v19 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v15 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = 1;
  *(void *)(v8 + 24) = v0;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B970);
  sub_2473D3668(&qword_26B12B968, &qword_26B12B970);
  sub_24740D720();
  sub_2473D3668(&qword_26B12BAD0, &qword_26B12BAD8);
  uint64_t v9 = sub_24740D730();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v20 = v9;
  swift_retain();
  sub_24740D660();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAE0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA00);
  sub_2473D3668(&qword_26B12BA58, &qword_26B12BA60);
  sub_2473D3668(&qword_26B12B9F8, &qword_26B12BA00);
  sub_24740D7E0();
  swift_release();
  swift_release();
  sub_2473D3668(&qword_26B12BA08, &qword_26B12BA10);
  uint64_t v11 = v15;
  uint64_t v10 = v16;
  sub_24740D760();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v10);
  sub_2473D3668(&qword_26B12B978, &qword_26B12B980);
  uint64_t v12 = v17;
  uint64_t v13 = sub_24740D730();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v12);
  return v13;
}

void sub_2473EBE00()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_24740DCC0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_26924C730 = (uint64_t)v2;
}

unint64_t sub_2473EBE70()
{
  type metadata accessor for StaccatoStorage();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  unint64_t result = sub_2473F1C44(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 24) = result;
  qword_26B12BD70 = v0;
  return result;
}

uint64_t sub_2473EBEBC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C770);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C778);
  sub_2473D3668(&qword_26924C780, &qword_26924C778);
  sub_24740D720();
  sub_2473D3668(&qword_26924C788, &qword_26924C770);
  uint64_t v6 = sub_24740D730();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t sub_2473EC06C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C790);
  uint64_t v61 = *(void *)(v2 - 8);
  uint64_t v62 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C798);
  uint64_t v58 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C7A0);
  uint64_t v59 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB28);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v53 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C7A8);
  uint64_t v54 = *(void *)(v13 - 8);
  uint64_t v55 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v51 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C7B0);
  uint64_t v56 = *(void *)(v15 - 8);
  uint64_t v57 = v15;
  MEMORY[0x270FA5388](v15);
  double v52 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B12B950 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_24740D560();
  __swift_project_value_buffer(v17, (uint64_t)qword_26B12B938);
  uint64_t v18 = sub_24740D540();
  os_log_type_t v19 = sub_24740DEB0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_2473C9000, v18, v19, "Loading action data...", v20, 2u);
    MEMORY[0x24C5554B0](v20, -1, -1);
  }

  if (qword_26924BB10 != -1) {
    swift_once();
  }
  if (qword_26924C730)
  {
    uint64_t v50 = v8;
    CGRect v60 = a1;
    id v21 = (id)qword_26924C730;
    id v22 = sub_247406A1C(v21);
    char v37 = v23;
    uint64_t v38 = v21;
    if (v23 == -1)
    {
      id v42 = objc_msgSend(self, sel_standardClient);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924C7C0);
      swift_allocObject();
      id v63 = (id)sub_24740D710();
      sub_2473D3668(&qword_26924C7C8, &qword_26924C7C0);
      double v43 = (void *)sub_24740D730();

      swift_release();
      id v63 = v43;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924C7D0);
      sub_2473D3668(&qword_26924C7D8, &qword_26924C7D0);
      uint64_t v44 = v51;
      sub_24740D780();
      swift_release();
      sub_2473CF248(0, (unint64_t *)&qword_26B12BB40);
      id v63 = (id)sub_24740DF30();
      uint64_t v45 = sub_24740DEF0();
      uint64_t v46 = (uint64_t)v53;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v53, 1, 1, v45);
      sub_2473D3668(&qword_26924C7E0, &qword_26924C7A8);
      sub_2473F1744((unint64_t *)&qword_26B12BB30, (unint64_t *)&qword_26B12BB40);
      id v47 = v52;
      uint64_t v48 = v55;
      sub_24740D800();
      sub_2473F0634(v46);

      (*(void (**)(char *, uint64_t))(v54 + 8))(v44, v48);
      sub_2473D3668(&qword_26924C7E8, &qword_26924C7B0);
      uint64_t v49 = v57;
      uint64_t v35 = sub_24740D730();

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v47, v49);
    }
    else
    {
      uint64_t v39 = v22;
      id v63 = v22;
      char v64 = v23 & 1;
      id v40 = v22;
      sub_24740D6F0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD8);
      sub_24740D6E0();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v7, v5);
      sub_2473D3668(&qword_26924C7F0, &qword_26924C7A0);
      uint64_t v41 = v50;
      uint64_t v35 = sub_24740D730();

      sub_2473F17FC(v39, v37);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v10, v41);
    }
    a1 = v60;
  }
  else
  {
    sub_2473F16F0();
    uint64_t v24 = (void *)swift_allocError();
    swift_willThrow();
    id v25 = v24;
    id v26 = v24;
    uint64_t v27 = sub_24740D540();
    os_log_type_t v28 = sub_24740DEB0();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      id v30 = (void *)swift_slowAlloc();
      *(_DWORD *)id v29 = 138412290;
      id v31 = v24;
      BOOL v32 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v63 = v32;
      sub_24740E220();
      *id v30 = v32;

      _os_log_impl(&dword_2473C9000, v27, v28, "Failed to load action data: %@", v29, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v30, -1, -1);
      MEMORY[0x24C5554B0](v29, -1, -1);
    }
    else
    {
    }
    id v63 = v24;
    id v33 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD8);
    sub_24740D6C0();
    sub_2473D3668(&qword_26924C7B8, &qword_26924C790);
    uint64_t v34 = v62;
    uint64_t v35 = sub_24740D730();

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v4, v34);
  }
  *a1 = v35;
  return result;
}

id sub_2473EC9FC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *a1;
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = 0;
  return v2;
}

uint64_t sub_2473ECA0C@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB28);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v75 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B9E0);
  uint64_t v76 = *(void *)(v8 - 8);
  uint64_t v77 = v8;
  MEMORY[0x270FA5388](v8);
  id v74 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA30);
  uint64_t v79 = *(void *)(v10 - 8);
  uint64_t v80 = v10;
  MEMORY[0x270FA5388](v10);
  id v78 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA90);
  uint64_t v66 = *(void *)(v12 - 8);
  uint64_t v67 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v65 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBA0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  char v64 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  os_log_type_t v19 = (char *)&v58 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B9A0);
  uint64_t v69 = *(void *)(v20 - 8);
  uint64_t v70 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v68 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B9D0);
  uint64_t v72 = *(void *)(v22 - 8);
  uint64_t v73 = v22;
  MEMORY[0x270FA5388](v22);
  id v71 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_24740D560();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v58 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v28 = 0;
  if ((a1 & 1) == 0)
  {
    os_log_type_t v28 = *(void **)(a2 + 16);
    swift_bridgeObjectRetain();
  }
  if (qword_26B12B950 != -1) {
    swift_once();
  }
  uint64_t v29 = __swift_project_value_buffer(v24, (uint64_t)qword_26B12B938);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, v29, v24);
  swift_bridgeObjectRetain_n();
  id v30 = sub_24740D540();
  os_log_type_t v31 = sub_24740DEB0();
  uint64_t v63 = v24;
  os_log_type_t v32 = v31;
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v60 = v14;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v59 = v15;
    uint64_t v34 = (uint8_t *)v33;
    uint64_t v35 = (void *)swift_slowAlloc();
    uint64_t v61 = a2;
    uint64_t v36 = v35;
    uint64_t v58 = v19;
    *(_DWORD *)uint64_t v34 = 136315138;
    v82[0] = v35;
    if (v28) {
      uint64_t v37 = 0x676E697375;
    }
    else {
      uint64_t v37 = 0x2074756F68746977;
    }
    uint64_t v62 = a3;
    if (v28) {
      unint64_t v38 = 0xE500000000000000;
    }
    else {
      unint64_t v38 = 0xED0000676E697375;
    }
    uint64_t v81 = sub_2474096F8(v37, v38, (uint64_t *)v82);
    uint64_t v14 = v60;
    os_log_type_t v19 = v58;
    sub_24740E220();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2473C9000, v30, v32, "Loading actions %s cache", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v36, -1, -1);
    uint64_t v39 = v34;
    uint64_t v15 = v59;
    MEMORY[0x24C5554B0](v39, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v63);
  v82[0] = v28;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB10);
  id v40 = v65;
  sub_24740D6F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB00);
  uint64_t v41 = v64;
  uint64_t v42 = v67;
  sub_24740D6D0();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v40, v42);
  sub_24740E200();
  double v43 = v28;
  uint64_t v44 = *(void (**)(char *, uint64_t))(v15 + 8);
  v44(v41, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD8);
  sub_2473D3668(&qword_26B12BB98, &qword_26B12BBA0);
  uint64_t v45 = v68;
  sub_24740D870();
  v44(v19, v14);
  id v46 = objc_msgSend(self, sel_standardClient);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAA8);
  swift_allocObject();
  v82[0] = (id)sub_24740D710();
  sub_2473D3668(&qword_26B12BAA0, &qword_26B12BAA8);
  id v47 = (void *)sub_24740D730();

  swift_release();
  v82[0] = v47;
  *(void *)(swift_allocObject() + 16) = v43;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA60);
  sub_2473D3668(&qword_26B12BA58, &qword_26B12BA60);
  uint64_t v48 = v74;
  sub_24740D7C0();
  swift_release();
  swift_release();
  sub_2473CF248(0, (unint64_t *)&qword_26B12BB40);
  v82[0] = (id)sub_24740DF30();
  uint64_t v49 = sub_24740DEF0();
  uint64_t v50 = (uint64_t)v75;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v75, 1, 1, v49);
  sub_2473D3668(&qword_26B12B9D8, &qword_26B12B9E0);
  sub_2473F1744((unint64_t *)&qword_26B12BB30, (unint64_t *)&qword_26B12BB40);
  uint64_t v51 = v77;
  double v52 = v78;
  sub_24740D800();
  sub_2473F0634(v50);

  (*(void (**)(char *, uint64_t))(v76 + 8))(v48, v51);
  sub_2473D3668(&qword_26B12B998, &qword_26B12B9A0);
  sub_2473D3668(&qword_26B12BA28, &qword_26B12BA30);
  uint64_t v54 = v70;
  uint64_t v53 = v71;
  uint64_t v55 = v80;
  sub_24740D7A0();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v52, v55);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v45, v54);
  swift_allocObject();
  swift_weakInit();
  sub_2473D3668(&qword_26B12B9C8, &qword_26B12B9D0);
  uint64_t v56 = v73;
  sub_24740D750();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v53, v56);
}

BOOL sub_2473ED570(void *a1)
{
  if (*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_24740E4A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v1 != 0;
}

uint64_t sub_2473ED5D4(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  unint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_2473F0988(v2);
  swift_bridgeObjectRelease();
  unint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_2473F0988(v4);
  swift_bridgeObjectRelease();
  sub_2473EF35C(v3, v5);
  unsigned __int8 v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v7 ^ 1) & 1;
}

uint64_t sub_2473ED66C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(void *)(result + 16) = v1;
    swift_bridgeObjectRetain();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2473ED6E4(void *a1, int a2)
{
  int v21 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA98);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned __int8 v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAC8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v12 = objc_msgSend(a1, sel_parameters);
  sub_2473CF248(0, &qword_26B12BB70);
  unint64_t v13 = sub_24740DD70();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_24740E4A0();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAE0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD8);
    sub_24740D700();
    sub_2473D3668(&qword_26924C738, &qword_26B12BA98);
    sub_24740D730();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v13 & 0xC000000000000001) != 0)
  {
    id v14 = (id)MEMORY[0x24C554A50](0, v13);
    goto LABEL_6;
  }
  if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v14 = *(id *)(v13 + 32);
LABEL_6:
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v16 = swift_allocObject();
    *(unsigned char *)(v16 + 16) = v21 & 1;
    *(void *)(v16 + 24) = v2;
    *(void *)(v16 + 32) = a1;
    *(void *)(v16 + 40) = v15;
    swift_retain();
    id v17 = a1;
    id v18 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B960);
    sub_2473D3668(&qword_26B12B958, &qword_26B12B960);
    sub_24740D720();
    sub_2473D3668(&qword_26B12BAC0, &qword_26B12BAC8);
    sub_24740D730();

    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
    return;
  }
  __break(1u);
}

uint64_t sub_2473EDA80@<X0>(char a1@<W0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  id v94 = a4;
  uint64_t v111 = a5;
  uint64_t v112 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB28);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v110 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B9B0);
  uint64_t v96 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  id v95 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B9F0);
  uint64_t v103 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  uint64_t v101 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA40);
  uint64_t v108 = *(void *)(v11 - 8);
  uint64_t v109 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v107 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA88);
  uint64_t v92 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  v91 = (char *)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB90);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  id v90 = (char *)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v82 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B990);
  uint64_t v99 = *(void *)(v21 - 8);
  uint64_t v100 = v21;
  MEMORY[0x270FA5388](v21);
  id v97 = (char *)&v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B9C0);
  uint64_t v104 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  id v102 = (char *)&v82 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_24740D560();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v82 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v28 = 0;
  if ((a1 & 1) == 0)
  {
    uint64_t v29 = v112;
    swift_beginAccess();
    uint64_t v30 = *(void *)(v29 + 24);
    if (*(void *)(v30 + 16))
    {
      id v89 = v27;
      uint64_t v31 = v25;
      os_log_type_t v32 = v20;
      id v33 = a3;
      unint64_t v34 = sub_2474092C0((uint64_t)v33);
      if (v35)
      {
        os_log_type_t v28 = *(void **)(*(void *)(v30 + 56) + 8 * v34);
        swift_bridgeObjectRetain();
      }
      else
      {
        os_log_type_t v28 = 0;
      }

      uint64_t v20 = v32;
      uint64_t v25 = v31;
      uint64_t v27 = v89;
    }
    else
    {
      os_log_type_t v28 = 0;
    }
    swift_endAccess();
  }
  if (qword_26B12B950 != -1) {
    swift_once();
  }
  uint64_t v36 = __swift_project_value_buffer(v24, (uint64_t)qword_26B12B938);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, v36, v24);
  swift_bridgeObjectRetain_n();
  id v37 = a3;
  uint64_t v38 = v25;
  id v39 = v37;
  id v40 = sub_24740D540();
  os_log_type_t v41 = sub_24740DEB0();
  int v88 = v41;
  BOOL v42 = os_log_type_enabled(v40, v41);
  id v93 = v39;
  if (v42)
  {
    uint64_t v43 = swift_slowAlloc();
    uint64_t v87 = v15;
    uint64_t v44 = v43;
    uint64_t v83 = (void *)swift_slowAlloc();
    id v114 = v83;
    *(_DWORD *)uint64_t v44 = 136315394;
    id v45 = objc_msgSend(v39, sel_sectionIdentifier, v44 + 4);
    uint64_t v85 = v38;
    id v89 = v27;
    id v46 = v45;
    uint64_t v47 = sub_24740DCF0();
    uint64_t v86 = v13;
    uint64_t v48 = v47;
    uint64_t v84 = v24;
    uint64_t v49 = v16;
    unint64_t v51 = v50;

    uint64_t v113 = sub_2474096F8(v48, v51, (uint64_t *)&v114);
    sub_24740E220();

    uint64_t v16 = v49;
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    if (v28) {
      uint64_t v52 = 0x676E697375;
    }
    else {
      uint64_t v52 = 0x2074756F68746977;
    }
    if (v28) {
      unint64_t v53 = 0xE500000000000000;
    }
    else {
      unint64_t v53 = 0xED0000676E697375;
    }
    uint64_t v113 = sub_2474096F8(v52, v53, (uint64_t *)&v114);
    uint64_t v13 = v86;
    sub_24740E220();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2473C9000, v40, (os_log_type_t)v88, "Loading parameter values for %s %s cache", (uint8_t *)v44, 0x16u);
    uint64_t v54 = v83;
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v54, -1, -1);
    uint64_t v55 = v44;
    uint64_t v15 = v87;
    MEMORY[0x24C5554B0](v55, -1, -1);

    (*(void (**)(char *, uint64_t))(v85 + 8))(v89, v84);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v24);
  }
  id v114 = v28;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAE8);
  uint64_t v56 = v91;
  sub_24740D6F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAE0);
  uint64_t v57 = v90;
  sub_24740D6D0();
  (*(void (**)(char *, uint64_t))(v92 + 8))(v56, v13);
  sub_24740E200();
  uint64_t v58 = *(void (**)(char *, uint64_t))(v16 + 8);
  v58(v57, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD8);
  sub_2473D3668(&qword_26B12BB88, &qword_26B12BB90);
  uint64_t v59 = v97;
  sub_24740D870();
  v58(v20, v15);
  id v60 = objc_msgSend(self, sel_standardClient);
  uint64_t v61 = swift_allocObject();
  uint64_t v62 = v94;
  *(void *)(v61 + 16) = v94;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAB8);
  swift_allocObject();
  id v63 = v62;
  id v114 = (id)sub_24740D710();
  sub_2473D3668(&qword_26B12BAB0, &qword_26B12BAB8);
  char v64 = (void *)sub_24740D730();

  swift_release();
  id v114 = v64;
  *(void *)(swift_allocObject() + 16) = v63;
  id v65 = v63;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA70);
  sub_2473D3668(&qword_26B12BA68, &qword_26B12BA70);
  uint64_t v66 = v95;
  sub_24740D780();
  swift_release();
  swift_release();
  *(void *)(swift_allocObject() + 16) = v28;
  sub_2473D3668(&qword_26B12B9A8, &qword_26B12B9B0);
  uint64_t v67 = v101;
  uint64_t v68 = v98;
  sub_24740D7C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v96 + 8))(v66, v68);
  sub_2473CF248(0, (unint64_t *)&qword_26B12BB40);
  id v114 = (id)sub_24740DF30();
  uint64_t v69 = sub_24740DEF0();
  uint64_t v70 = (uint64_t)v110;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v110, 1, 1, v69);
  sub_2473D3668(&qword_26B12B9E8, &qword_26B12B9F0);
  sub_2473F1744((unint64_t *)&qword_26B12BB30, (unint64_t *)&qword_26B12BB40);
  id v71 = v107;
  uint64_t v72 = v105;
  sub_24740D800();
  sub_2473F0634(v70);

  (*(void (**)(char *, uint64_t))(v103 + 8))(v67, v72);
  sub_2473D3668(&qword_26B12B988, &qword_26B12B990);
  sub_2473D3668(&qword_26B12BA38, &qword_26B12BA40);
  uint64_t v73 = v102;
  uint64_t v74 = v100;
  uint64_t v75 = v109;
  sub_24740D7A0();
  (*(void (**)(char *, uint64_t))(v108 + 8))(v71, v75);
  (*(void (**)(char *, uint64_t))(v99 + 8))(v59, v74);
  uint64_t v76 = swift_allocObject();
  swift_weakInit();
  uint64_t v77 = swift_allocObject();
  id v78 = v93;
  *(void *)(v77 + 16) = v76;
  *(void *)(v77 + 24) = v78;
  sub_2473D3668(&qword_26B12B9B8, &qword_26B12B9C0);
  id v79 = v78;
  uint64_t v80 = v106;
  sub_24740D750();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v104 + 8))(v73, v80);
}

BOOL sub_2473EE8D8(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 16) != 0;
}

unint64_t sub_2473EE8EC@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBC8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247410870;
  *(void *)(inited + 32) = a2;
  *(void *)(inited + 40) = v5;
  id v7 = a2;
  swift_bridgeObjectRetain();
  unint64_t result = sub_2473F1FC0(inited);
  *a3 = result;
  return result;
}

uint64_t sub_2473EE964(uint64_t *a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t v3 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_247408B20(v3, a2);
  unsigned __int8 v5 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v5 ^ 1) & 1;
}

uint64_t sub_2473EE9DC(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = result;
    swift_beginAccess();
    id v7 = a3;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *(void *)(v6 + 24);
    *(void *)(v6 + 24) = 0x8000000000000000;
    sub_2473FAE0C(v4, v7, isUniquelyReferenced_nonNull_native);
    *(void *)(v6 + 24) = v9;

    swift_bridgeObjectRelease();
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_2473EEAB0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA20);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = *a1;
  unint64_t v20 = MEMORY[0x263F8EE78];
  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    unint64_t v16 = MEMORY[0x263F8EE78];
LABEL_15:
    swift_retain();
    uint64_t v17 = sub_2473F0848(v16);
    swift_release();
    swift_release();
    unint64_t v20 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAF0);
    sub_2473D3668(&qword_26B12BAF8, &qword_26B12BAF0);
    sub_24740DD40();
    swift_bridgeObjectRelease();
    sub_24740D660();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA50);
    sub_2473D3668(&qword_26B12BA18, &qword_26B12BA20);
    sub_2473D3668(&qword_26B12BA48, &qword_26B12BA50);
    sub_24740D890();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24740E4A0();
  uint64_t v9 = result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v9 >= 1)
  {
    v18[1] = a2;
    uint64_t v19 = v4;
    for (uint64_t i = 0; i != v9; ++i)
    {
      if ((v8 & 0xC000000000000001) != 0) {
        id v12 = (id)MEMORY[0x24C554A50](i, v8);
      }
      else {
        id v12 = *(id *)(v8 + 8 * i + 32);
      }
      uint64_t v13 = v12;
      sub_2473EEDC8();
      uint64_t v15 = v14;
      swift_bridgeObjectRelease();
      if (v15)
      {
        sub_24740E370();
        sub_24740E3A0();
        sub_24740E3B0();
        sub_24740E380();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v16 = v20;
    uint64_t v4 = v19;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_2473EEDC8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBC0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247410B40;
  *(void *)(inited + 32) = @"Focus";
  *(void *)(inited + 40) = 0xD000000000000031;
  *(void *)(inited + 48) = 0x8000000247412D10;
  *(void *)(inited + 56) = @"Camera";
  *(void *)(inited + 64) = 0x746F685072616572;
  *(void *)(inited + 72) = 0xE90000000000006FLL;
  uint64_t v3 = @"Focus";
  uint64_t v4 = @"Camera";
  unint64_t v5 = sub_2473F20F8(inited);
  id v6 = objc_msgSend(v1, sel_sectionIdentifier);
  id v7 = v6;
  if (*(void *)(v5 + 16) && (unint64_t v8 = sub_24740922C((uint64_t)v6), (v9 & 1) != 0))
  {
    uint64_t v10 = *(void *)(*(void *)(v5 + 56) + 16 * v8);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v10 = 0;
  }

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2473EEEE0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_2473EEEEC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for StaccatoStorage()
{
  return self;
}

id sub_2473EEF50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v38 = a3 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 64);
  int64_t v39 = (unint64_t)(v6 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v44 = v3;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    int64_t v40 = v10;
    unint64_t v16 = *(void *)(*(void *)(v3 + 56) + 8 * i);
    if (v16 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v17 = sub_24740E4A0();
      id result = (id)swift_bridgeObjectRelease();
      if (v17)
      {
LABEL_21:
        unint64_t v18 = 0;
        unint64_t v19 = v16 & 0xC000000000000001;
        unint64_t v36 = v16 + 32;
        uint64_t v37 = v16 & 0xFFFFFFFFFFFFFF8;
        uint64_t v42 = v17;
        unint64_t v43 = v8;
        unint64_t v45 = v16;
        unint64_t v41 = v16 & 0xC000000000000001;
        while (1)
        {
          if (v19)
          {
            id result = (id)MEMORY[0x24C554A50](v18, v16);
          }
          else
          {
            if (v18 >= *(void *)(v37 + 16)) {
              goto LABEL_54;
            }
            id result = *(id *)(v36 + 8 * v18);
          }
          id v20 = result;
          BOOL v21 = __OFADD__(v18, 1);
          unint64_t v22 = v18 + 1;
          if (v21) {
            break;
          }
          id v23 = objc_msgSend(result, sel_values);
          sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
          unint64_t v24 = sub_24740DD70();

          unint64_t v46 = v22;
          uint64_t v47 = v20;
          if (v24 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v25 = sub_24740E4A0();
            swift_bridgeObjectRelease();
            if (v25)
            {
LABEL_30:
              uint64_t v26 = 4;
              while (1)
              {
                id result = (v24 & 0xC000000000000001) != 0
                       ? (id)MEMORY[0x24C554A50](v26 - 4, v24)
                       : *(id *)(v24 + 8 * v26);
                uint64_t v27 = result;
                uint64_t v28 = v26 - 3;
                if (__OFADD__(v26 - 4, 1)) {
                  break;
                }
                uint64_t v29 = a2;
                id v30 = objc_msgSend(result, sel_identifier);
                uint64_t v31 = sub_24740DCF0();
                uint64_t v33 = v32;

                a2 = v29;
                if (v31 == a1 && v33 == v29)
                {
                  swift_bridgeObjectRelease();

                  swift_bridgeObjectRelease();
LABEL_49:
                  swift_release();
                  swift_bridgeObjectRelease();
                  return v27;
                }
                char v35 = sub_24740E5A0();
                swift_bridgeObjectRelease();
                if (v35)
                {
                  swift_bridgeObjectRelease();

                  goto LABEL_49;
                }

                ++v26;
                if (v28 == v25) {
                  goto LABEL_22;
                }
              }
              __break(1u);
              break;
            }
          }
          else
          {
            uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v25) {
              goto LABEL_30;
            }
          }
LABEL_22:

          id result = (id)swift_bridgeObjectRelease();
          unint64_t v8 = v43;
          unint64_t v16 = v45;
          unint64_t v18 = v46;
          unint64_t v19 = v41;
          if (v46 == v42) {
            goto LABEL_45;
          }
        }
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
        return result;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (v17) {
        goto LABEL_21;
      }
    }
LABEL_45:
    id result = (id)swift_bridgeObjectRelease();
    uint64_t v3 = v44;
    int64_t v10 = v40;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_55;
    }
    if (v13 >= v39) {
      goto LABEL_51;
    }
    unint64_t v14 = *(void *)(v38 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v39) {
        goto LABEL_51;
      }
      unint64_t v14 = *(void *)(v38 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v39) {
          goto LABEL_51;
        }
        unint64_t v14 = *(void *)(v38 + 8 * v10);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 < v39)
  {
    unint64_t v14 = *(void *)(v38 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v10 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_56;
        }
        if (v10 >= v39) {
          goto LABEL_51;
        }
        unint64_t v14 = *(void *)(v38 + 8 * v10);
        ++v15;
        if (v14) {
          goto LABEL_18;
        }
      }
    }
    int64_t v10 = v15;
    goto LABEL_18;
  }
LABEL_51:
  swift_release();
  return 0;
}

void sub_2473EF35C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0) {
      uint64_t v5 = a1;
    }
    else {
      uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    if (v4)
    {
      if (a2 < 0) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = a2 & 0xFFFFFFFFFFFFFF8;
      }
      goto LABEL_57;
    }
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    goto LABEL_18;
  }
  if (v4)
  {
    if (a2 < 0) {
      uint64_t v7 = a2;
    }
    else {
      uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t v8 = a1;
LABEL_18:
    sub_2473EF694(v7, v8);
    return;
  }
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  uint64_t v28 = a1 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(a1 + 56);
  uint64_t v6 = sub_2473CF248(0, (unint64_t *)&unk_26B12BB48);
  int64_t v12 = 0;
  int64_t v29 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = a2 + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_46;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_56;
    }
    if (v16 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v29) {
        return;
      }
      unint64_t v17 = *(void *)(v28 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v29) {
          return;
        }
        unint64_t v17 = *(void *)(v28 + 8 * v12);
        if (!v17)
        {
          int64_t v12 = v16 + 3;
          if (v16 + 3 >= v29) {
            return;
          }
          unint64_t v17 = *(void *)(v28 + 8 * v12);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_45:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_46:
    id v19 = *(id *)(*(void *)(a1 + 48) + 8 * v15);
    uint64_t v20 = sub_24740E030();
    uint64_t v21 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v22 = v20 & ~v21;
    if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
      goto LABEL_53;
    }
    int64_t v30 = v12;
    id v23 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
    char v24 = sub_24740E040();

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = ~v21;
      while (1)
      {
        unint64_t v22 = (v22 + 1) & v25;
        if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
          break;
        }
        id v26 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
        char v27 = sub_24740E040();

        if (v27) {
          goto LABEL_27;
        }
      }
LABEL_53:

      return;
    }
LABEL_27:

    int64_t v12 = v30;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v29) {
    return;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_45;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_45;
    }
  }
LABEL_56:
  __break(1u);
LABEL_57:
  MEMORY[0x270F9E868](v6, v5);
}

void sub_2473EF694(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 != sub_24740E2A0()) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a2 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_6:
    id v12 = *(id *)(*(void *)(a2 + 48) + 8 * v11);
    char v13 = sub_24740E2E0();

    if ((v13 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v14);
  ++v4;
  if (v15) {
    goto LABEL_19;
  }
  int64_t v4 = v14 + 1;
  if (v14 + 1 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  int64_t v16 = v14 + 2;
  if (v16 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v4 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v4);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_2473EF7E8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_24740E2B0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_2473CF248(0, (unint64_t *)&unk_26B12BB48);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_24740E2A0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_2473EFA88(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_2473EFC80();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_2473EFF20((uint64_t)v8, v22);
    *uint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_24740E030();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_2473CF248(0, (unint64_t *)&unk_26B12BB48);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_24740E040();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        id v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_24740E040();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_2473EFFA4((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_2473EFA88(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C768);
    uint64_t v2 = sub_24740E310();
    uint64_t v14 = v2;
    sub_24740E290();
    if (sub_24740E2D0())
    {
      sub_2473CF248(0, (unint64_t *)&unk_26B12BB48);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_2473EFC80();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_24740E030();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_24740E2D0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_2473EFC80()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C768);
  uint64_t v3 = sub_24740E300();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_24740E030();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_2473EFF20(uint64_t a1, uint64_t a2)
{
  sub_24740E030();
  unint64_t result = sub_24740E280();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_2473EFFA4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_2473EFC80();
  }
  else
  {
    if (v7 > v6)
    {
      sub_2473F012C();
      goto LABEL_14;
    }
    sub_2473F02D8();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_24740E030();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_2473CF248(0, (unint64_t *)&unk_26B12BB48);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_24740E040();

    if (v12)
    {
LABEL_13:
      sub_24740E5D0();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_24740E040();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_2473F012C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C768);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24740E2F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2473F02D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C768);
  uint64_t v3 = sub_24740E300();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_24740E030();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2473F0554()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2473F059C@<X0>(uint64_t a1@<X8>)
{
  return sub_2473EDA80(*(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40), a1);
}

uint64_t sub_2473F05AC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2473F05E4(uint64_t a1, uint64_t a2)
{
  sub_2473CDD88(a1, a2, *(void **)(v2 + 16));
}

unint64_t sub_2473F05EC@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  return sub_2473EE8EC(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_2473F05F4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473F062C(uint64_t *a1)
{
  return sub_2473EE964(a1, *(void *)(v1 + 16));
}

uint64_t sub_2473F0634(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2473F0694()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473F06CC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2473F070C(uint64_t *a1)
{
  return sub_2473EE9DC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

void sub_2473F0714(void *a1)
{
  if (qword_26924BB10 != -1) {
    swift_once();
  }
  if (qword_26924C730)
  {
    id v3 = (id)qword_26924C730;
    sub_24740623C(v3, a1, 1);

    if (!v1)
    {
      id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851C0]), sel_init);
      if (qword_26924C730)
      {
        id v5 = (id)qword_26924C730;
        sub_24740623C(v5, v4, 0);
      }
      else
      {
        sub_2473F16F0();
        swift_allocError();
        swift_willThrow();
      }
    }
  }
  else
  {
    sub_2473F16F0();
    swift_allocError();
    swift_willThrow();
  }
}

uint64_t sub_2473F0848(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v2) {
      break;
    }
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24740E390();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x24C554A50](v4, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      ++v4;
      sub_2473ED6E4(v5, 1);

      sub_24740E370();
      sub_24740E3A0();
      sub_24740E3B0();
      sub_24740E380();
      if (v2 == v4) {
        return v7;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24740E4A0();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2473F0988(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24740E4A0();
    swift_bridgeObjectRelease();
  }
  sub_2473CF248(0, (unint64_t *)&unk_26B12BB48);
  sub_2473F1744(&qword_26924C760, (unint64_t *)&unk_26B12BB48);
  uint64_t result = sub_24740DE70();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24740E4A0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x24C554A50](i, a1);
        sub_2473EF7E8(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_2473EF7E8(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2473F0B10(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = a2;
  return MEMORY[0x270FA2498](sub_2473F0B30, 0, 0);
}

uint64_t sub_2473F0B30()
{
  uint64_t v83 = v0;
  if (qword_26B12B950 != -1) {
LABEL_55:
  }
    swift_once();
  uint64_t v1 = (void *)*((void *)v0 + 9);
  uint64_t v2 = sub_24740D560();
  *((void *)v0 + 11) = __swift_project_value_buffer(v2, (uint64_t)qword_26B12B938);
  id v3 = v1;
  swift_bridgeObjectRetain_n();
  id v4 = v3;
  id v5 = sub_24740D540();
  os_log_type_t v6 = sub_24740DEB0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = (void *)*((void *)v0 + 9);
  uint64_t v77 = v0;
  if (v7)
  {
    loga = v5;
    id v9 = v0 + 56;
    uint64_t v10 = (uint64_t *)(v0 + 64);
    os_log_type_t typea = v6;
    uint64_t v11 = swift_slowAlloc();
    int64_t v12 = (void *)swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    uint64_t v82 = (void *)v80;
    *(_DWORD *)uint64_t v11 = 138412546;
    void *v9 = v8;
    id v13 = v8;
    sub_24740E220();
    void *v12 = v8;
    unint64_t v14 = v12;

    *(_WORD *)(v11 + 12) = 2080;
    sub_2473CF248(0, &qword_26B12BB70);
    sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
    sub_2473F1744(&qword_26924C758, &qword_26B12BB70);
    swift_bridgeObjectRetain();
    uint64_t v0 = v77;
    uint64_t v15 = sub_24740DC90();
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    *uint64_t v10 = sub_2474096F8(v15, v17, (uint64_t *)&v82);
    sub_24740E220();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    id v5 = loga;
    _os_log_impl(&dword_2473C9000, loga, typea, "Configuring %@ with %s...", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v80, -1, -1);
    MEMORY[0x24C5554B0](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  unint64_t v18 = *((void *)v0 + 10);
  id v19 = (void *)sub_2473F2210(MEMORY[0x263F8EE78]);
  uint64_t v20 = *((void *)v0 + 10);
  if ((v18 & 0xC000000000000001) != 0)
  {
    uint64_t v21 = sub_24740E3D0();
    *(void *)type = 0;
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    unint64_t v18 = v21 | 0x8000000000000000;
  }
  else
  {
    *(void *)type = v20 + 64;
    uint64_t v24 = -1 << *(unsigned char *)(v20 + 32);
    uint64_t v22 = ~v24;
    uint64_t v25 = -v24;
    if (v25 < 64) {
      uint64_t v26 = ~(-1 << v25);
    }
    else {
      uint64_t v26 = -1;
    }
    unint64_t v23 = v26 & *(void *)(v20 + 64);
  }
  uint64_t v72 = (uint64_t *)(v0 + 32);
  uint64_t v73 = (id *)(v0 + 24);
  uint64_t v70 = v0 + 48;
  id v71 = (id *)(v0 + 40);
  uint64_t v69 = v22;
  int64_t v74 = (unint64_t)(v22 + 64) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v27 = 0;
  for (log = (os_log_t)v18; ; unint64_t v18 = (unint64_t)log)
  {
    *((void *)v0 + 12) = v19;
    uint64_t v81 = (uint64_t)v19;
    if ((v18 & 0x8000000000000000) == 0) {
      break;
    }
    uint64_t v33 = sub_24740E450();
    if (!v33) {
      goto LABEL_49;
    }
    uint64_t v35 = v34;
    uint64_t *v72 = v33;
    sub_2473CF248(0, &qword_26B12BB70);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v36 = *v73;
    swift_unknownObjectRelease();
    *uint64_t v70 = v35;
    sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v37 = *v71;
    swift_unknownObjectRelease();
    uint64_t v32 = v27;
    uint64_t v30 = v23;
    if (!v36) {
      goto LABEL_49;
    }
LABEL_35:
    uint64_t v0 = v32;
    unint64_t v43 = v36;
    id v44 = objc_msgSend(v36, sel_key, v69);
    uint64_t v45 = sub_24740DCF0();
    uint64_t v47 = v46;

    id v48 = v37;
    id v19 = (void *)v81;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v82 = (void *)v81;
    unint64_t v51 = sub_247409310(v45, v47);
    uint64_t v52 = *(void *)(v81 + 16);
    BOOL v53 = (v50 & 1) == 0;
    uint64_t v54 = v52 + v53;
    if (__OFADD__(v52, v53))
    {
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    char v55 = v50;
    if (*(void *)(v81 + 24) >= v54)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v50) {
          goto LABEL_12;
        }
      }
      else
      {
        sub_2473FB448();
        id v19 = v82;
        if (v55) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      sub_2473FA208(v54, isUniquelyReferenced_nonNull_native);
      uint64_t v56 = (uint64_t)v82;
      unint64_t v57 = sub_247409310(v45, v47);
      if ((v55 & 1) != (v58 & 1))
      {
        return sub_24740E5E0();
      }
      unint64_t v51 = v57;
      id v19 = (void *)v56;
      if (v55)
      {
LABEL_12:
        uint64_t v28 = v19;
        uint64_t v29 = v19[7];

        *(void *)(v29 + 8 * v51) = v48;
        id v19 = v28;
        goto LABEL_13;
      }
    }
    v19[(v51 >> 6) + 8] |= 1 << v51;
    uint64_t v59 = (uint64_t *)(v19[6] + 16 * v51);
    *uint64_t v59 = v45;
    v59[1] = v47;
    *(void *)(v19[7] + 8 * v51) = v48;
    uint64_t v60 = v19[2];
    BOOL v61 = __OFADD__(v60, 1);
    uint64_t v62 = v60 + 1;
    if (v61) {
      goto LABEL_53;
    }
    v19[2] = v62;
    swift_bridgeObjectRetain();
LABEL_13:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v27 = v0;
    unint64_t v23 = v30;
    uint64_t v0 = v77;
  }
  if (v23)
  {
    uint64_t v30 = (v23 - 1) & v23;
    unint64_t v31 = __clz(__rbit64(v23)) | ((void)v27 << 6);
    uint64_t v32 = v27;
    goto LABEL_34;
  }
  int64_t v38 = (int64_t)(v27 + 1);
  if (__OFADD__(v27, 1)) {
    goto LABEL_54;
  }
  if (v38 >= v74) {
    goto LABEL_49;
  }
  unint64_t v39 = *(void *)(*(void *)type + 8 * v38);
  uint64_t v32 = v27 + 1;
  if (v39) {
    goto LABEL_33;
  }
  uint64_t v32 = v27 + 2;
  if ((uint64_t)(v27 + 2) >= v74) {
    goto LABEL_49;
  }
  unint64_t v39 = *(void *)(*(void *)type + 8 * (void)v32);
  if (v39) {
    goto LABEL_33;
  }
  uint64_t v32 = v27 + 3;
  if ((uint64_t)(v27 + 3) >= v74) {
    goto LABEL_49;
  }
  unint64_t v39 = *(void *)(*(void *)type + 8 * (void)v32);
  if (v39) {
    goto LABEL_33;
  }
  uint64_t v32 = v27 + 4;
  if ((uint64_t)(v27 + 4) >= v74) {
    goto LABEL_49;
  }
  unint64_t v39 = *(void *)(*(void *)type + 8 * (void)v32);
  if (v39)
  {
LABEL_33:
    uint64_t v30 = (v39 - 1) & v39;
    unint64_t v31 = __clz(__rbit64(v39)) + ((void)v32 << 6);
LABEL_34:
    uint64_t v41 = 8 * v31;
    uint64_t v42 = *(void **)(*(void *)(v18 + 56) + v41);
    id v36 = *(id *)(*(void *)(v18 + 48) + v41);
    id v37 = v42;
    if (!v36) {
      goto LABEL_49;
    }
    goto LABEL_35;
  }
  int64_t v40 = v27 + 5;
  while ((char *)v74 != v40)
  {
    unint64_t v39 = *(void *)(*(void *)type + 8 * (void)v40++);
    if (v39)
    {
      uint64_t v32 = v40 - 1;
      goto LABEL_33;
    }
  }
LABEL_49:
  uint64_t v64 = *((void *)v0 + 9);
  sub_2473F16DC();
  id v65 = objc_msgSend(self, sel_standardClient);
  *((void *)v0 + 13) = v65;
  uint64_t v66 = (void *)swift_task_alloc();
  *((void *)v0 + 14) = v66;
  v66[2] = v65;
  v66[3] = v64;
  v66[4] = v81;
  uint64_t v67 = (void *)swift_task_alloc();
  *((void *)v0 + 15) = v67;
  uint64_t v68 = sub_2473CF248(0, &qword_26924C748);
  *uint64_t v67 = v0;
  v67[1] = sub_2473F13B4;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD00000000000003FLL, 0x8000000247412D50, sub_2473F16E4, v66, v68);
}

uint64_t sub_2473F13B4()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2473F1668;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2473F14D0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2473F14D0()
{
  uint64_t v1 = (void *)v0[13];
  swift_bridgeObjectRelease();

  uint64_t v2 = (void *)v0[2];
  id v3 = sub_24740D540();
  os_log_type_t v4 = sub_24740DEB0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2473C9000, v3, v4, "Successfully configured template action", v5, 2u);
    MEMORY[0x24C5554B0](v5, -1, -1);
  }

  if (sub_24740DE50())
  {

LABEL_5:
    os_log_type_t v6 = (uint64_t (*)(void))v0[1];
    goto LABEL_13;
  }
  if (qword_26924BB10 != -1) {
    swift_once();
  }
  if (qword_26924C730)
  {
    uint64_t v7 = v0[16];
    id v8 = (id)qword_26924C730;
    sub_24740623C(v8, v2, 0);

    if (!v7) {
      goto LABEL_5;
    }
  }
  else
  {
    sub_2473F16F0();
    swift_allocError();
    swift_willThrow();
  }
  os_log_type_t v6 = (uint64_t (*)(void))v0[1];
LABEL_13:
  return v6();
}

uint64_t sub_2473F1668()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2473F16DC()
{
  return swift_release();
}

void sub_2473F16E4(uint64_t a1)
{
  sub_2473CEE9C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_2473F16F0()
{
  unint64_t result = qword_26924C750;
  if (!qword_26924C750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C750);
  }
  return result;
}

uint64_t sub_2473F1744(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2473CF248(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2473F1788()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2473F17C0@<X0>(uint64_t a1@<X8>)
{
  return sub_2473ECA0C(*(unsigned char *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_2473F17CC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2473EEAB0(a1, a2);
}

uint64_t sub_2473F17D4(uint64_t a1)
{
  return sub_2473ED5D4(a1, *(void *)(v1 + 16));
}

uint64_t sub_2473F17DC(uint64_t *a1)
{
  return sub_2473ED66C(a1);
}

uint64_t sub_2473F17E4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2473F17F4@<X0>(uint64_t *a1@<X8>)
{
  return sub_2473EC06C(a1);
}

void sub_2473F17FC(id a1, char a2)
{
  if (a2 != -1) {
}
  }

unsigned char *storeEnumTagSinglePayload for StaccatoStorage.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2473F18ACLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StaccatoStorage.Errors()
{
  return &type metadata for StaccatoStorage.Errors;
}

unint64_t sub_2473F18E8()
{
  unint64_t result = qword_26924C7F8;
  if (!qword_26924C7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C7F8);
  }
  return result;
}

uint64_t sub_2473F1948(unint64_t a1)
{
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_24740E4A0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C554A50](i - 4, a1) : *(id *)(a1 + 8 * i);
      uint64_t v5 = v4;
      uint64_t v6 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v7 = objc_msgSend(v4, sel_values);
      sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
      unint64_t v8 = sub_24740DD70();

      sub_2473F93B0(v8, (uint64_t (*)(uint64_t, void, unint64_t))sub_2473FCB90);
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2473F1AC0(uint64_t a1)
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
    uint64_t result = sub_2473F93B0(v8, (uint64_t (*)(uint64_t, void, unint64_t))sub_2473FCDC4);
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

unint64_t sub_2473F1C44(uint64_t a1)
{
  return sub_2473F1FE0(a1, &qword_26B12BBA8, (uint64_t (*)(id))sub_2474092C0);
}

unint64_t sub_2473F1C64(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C890);
  uint64_t v2 = (void *)sub_24740E4D0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_retain();
    unint64_t result = sub_24740922C((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
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

unint64_t sub_2473F1D70(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8E8);
  uint64_t v2 = (void *)sub_24740E4D0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 72);
  while (1)
  {
    uint64_t v5 = *(v4 - 5);
    uint64_t v6 = *(v4 - 4);
    uint64_t v7 = *(v4 - 3);
    uint64_t v8 = *(v4 - 2);
    uint64_t v9 = *(v4 - 1);
    uint64_t v10 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_247409310(v5, v6);
    if (v12) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v13 = (uint64_t *)(v2[6] + 16 * result);
    *id v13 = v5;
    v13[1] = v6;
    unint64_t v14 = (void *)(v2[7] + 32 * result);
    void *v14 = v7;
    v14[1] = v8;
    void v14[2] = v9;
    v14[3] = v10;
    uint64_t v15 = v2[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v2[2] = v17;
    v4 += 6;
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

unint64_t sub_2473F1E98(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8F0);
  uint64_t v2 = sub_24740E4D0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2473FD7EC(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_24740922C(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_2473FD854(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

unint64_t sub_2473F1FB4(uint64_t a1)
{
  return sub_2473F221C(a1, &qword_26924C900);
}

unint64_t sub_2473F1FC0(uint64_t a1)
{
  return sub_2473F1FE0(a1, &qword_26B12BBB8, (uint64_t (*)(id))sub_2474091DC);
}

unint64_t sub_2473F1FE0(uint64_t a1, uint64_t *a2, uint64_t (*a3)(id))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v5 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = (void *)sub_24740E4D0();
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v5;
  }
  swift_retain();
  uint64_t v7 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v8 = *v7;
    id v9 = (id)*(v7 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = a3(v9);
    if (v11) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = 8 * result;
    *(void *)(v5[6] + v12) = v9;
    *(void *)(v5[7] + v12) = v8;
    uint64_t v13 = v5[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    void v5[2] = v15;
    v7 += 2;
    if (!--v6)
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

unint64_t sub_2473F20F8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBB0);
  uint64_t v2 = (void *)sub_24740E4D0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    id v7 = (id)*(v4 - 2);
    swift_bridgeObjectRetain();
    unint64_t result = sub_24740922C((uint64_t)v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v7;
    uint64_t v10 = (void *)(v2[7] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_2473F2210(uint64_t a1)
{
  return sub_2473F221C(a1, &qword_26924C8D0);
}

unint64_t sub_2473F221C(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_24740E4D0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_247409310(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v12 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
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

unint64_t sub_2473F2334(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C810);
  uint64_t v2 = (void *)sub_24740E4D0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_2474091DC((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

BOOL sub_2473F2440(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2473F2458()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB28);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v41 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24740DF10();
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v48 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24740DF80();
  uint64_t v41 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C948);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v43 = v9;
  uint64_t v44 = v10;
  MEMORY[0x270FA5388](v9);
  BOOL v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C950);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v45 = v13;
  uint64_t v46 = v14;
  MEMORY[0x270FA5388](v13);
  BOOL v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C958);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v49 = v17;
  uint64_t v50 = v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C960);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v51 = v21;
  uint64_t v52 = v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C968);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v53 = v25;
  uint64_t v54 = v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v42 = (char *)&v41 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v28 = objc_msgSend(self, sel_defaultCenter);
  sub_24740DF90();

  sub_24740DF00();
  sub_2473CF248(0, (unint64_t *)&qword_26B12BB40);
  id v55 = (id)sub_24740DF30();
  uint64_t v29 = sub_24740DEF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v2, 1, 1, v29);
  sub_2473EAA10();
  sub_2473FD864();
  sub_24740D810();
  sub_2473D34E0((uint64_t)v2, &qword_26B12BB28);

  (*(void (**)(char *, uint64_t))(v47 + 8))(v5, v48);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v6);
  sub_2473D3668(&qword_26924C970, &qword_26924C948);
  uint64_t v30 = v43;
  sub_24740D780();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v12, v30);
  sub_2473D3668(&qword_26924C978, &qword_26924C950);
  uint64_t v31 = v45;
  sub_24740D7F0();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v16, v31);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C980);
  sub_2473D3668(&qword_26924C988, &qword_26924C958);
  uint64_t v32 = v49;
  sub_24740D780();
  swift_release();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v20, v32);
  uint64_t v33 = sub_2473D3668(&qword_26924C990, &qword_26924C960);
  uint64_t v34 = sub_2473D3668(&qword_26924C998, &qword_26924C980);
  uint64_t v35 = v42;
  uint64_t v36 = v51;
  MEMORY[0x24C553F60](v51, v33, v34);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v24, v36);
  uint64_t v37 = swift_allocObject();
  swift_weakInit();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = sub_2473FD8D4;
  *(void *)(v38 + 24) = v37;
  sub_2473D3668(&qword_26924C9A0, &qword_26924C968);
  uint64_t v39 = v53;
  sub_24740D880();
  swift_release();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v35, v39);
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  return swift_release();
}

void sub_2473F2C5C(void *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(v4 + 16) + 16);
  if (!v6) {
    return;
  }
  switch(a3)
  {
    case 1:
      swift_bridgeObjectRetain();
      uint64_t v13 = @"Shortcuts";
      BOOL v12 = @"Shortcuts";
      break;
    case 2:
    case 3:
      swift_bridgeObjectRetain();
      BOOL v12 = (__CFString *)objc_msgSend(a1, sel_sectionIdentifier);
      break;
    default:
      swift_bridgeObjectRetain();
      uint64_t v11 = @"Controls";
      BOOL v12 = @"Controls";
      break;
  }
  uint64_t v14 = *(void *)(*(void *)(v5 + 16) + 16);
  if (v14)
  {
    uint64_t v15 = v12;
    uint64_t v16 = swift_bridgeObjectRetain();
    unint64_t v17 = sub_2473FD22C(v16);
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();

    if ((v19 & 1) == 0)
    {
      if ((v17 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else
      {
        char v46 = a4;
        if (v17 < *(void *)(v6 + 16))
        {
          a4 = 24 * v17;
          uint64_t v20 = v6 + 24 * v17;
          uint64_t v21 = *(void **)(v20 + 32);
          uint64_t v22 = *(void *)(v20 + 40);
          char v23 = *(unsigned char *)(v20 + 48);
          sub_2473D8260(v21, v22, v23);
          swift_bridgeObjectRelease();
          sub_247409D50(v21, v22, v23, a1, a2, a3);
          char v25 = v24;
          sub_2473D82EC(v21, v22, v23);
          if (v25)
          {
LABEL_15:
            uint64_t v31 = a2;
            uint64_t v32 = a1;
            if ((v46 & 1) == 0)
            {
              switch(a3)
              {
                case 1:
                  uint64_t v33 = @"Shortcuts";
                  goto LABEL_25;
                case 2:
                case 3:
                  uint64_t v33 = (__CFString *)objc_msgSend(a1, sel_sectionIdentifier);
                  goto LABEL_27;
                default:
                  uint64_t v33 = @"Controls";
LABEL_25:
                  uint64_t v34 = v33;
LABEL_27:
                  uint64_t v35 = *(void *)(v5 + 24);
                  int v36 = *(unsigned __int8 *)(v35 + 32);
                  uint64_t v37 = *(void **)(v35 + 16);
                  uint64_t v38 = @"Controls";
                  switch(v36)
                  {
                    case 0:
                      goto LABEL_29;
                    case 1:
                      uint64_t v38 = @"Shortcuts";
LABEL_29:
                      uint64_t v39 = v38;
                      goto LABEL_32;
                    case 2:
                    case 3:
                      uint64_t v39 = (__CFString *)objc_msgSend(v37, sel_sectionIdentifier);
LABEL_32:
                      int64_t v40 = v39;
                      uint64_t v41 = sub_24740DCF0();
                      uint64_t v43 = v42;
                      if (v41 == sub_24740DCF0() && v43 == v44)
                      {

                        swift_bridgeObjectRelease_n();
                        goto LABEL_36;
                      }
                      char v45 = sub_24740E5A0();

                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      if (v45) {
                        goto LABEL_36;
                      }
                      return;
                    default:

                      return;
                  }
              }
            }
LABEL_36:
            sub_2473F5928(v32, v31, a3);
            return;
          }
          uint64_t v14 = *(void *)(v5 + 16);
          uint64_t v15 = *(__CFString **)(v14 + 16);
          if (!v15)
          {
LABEL_42:
            __break(1u);
            JUMPOUT(0x2473F30F8);
          }
          swift_retain();
          swift_bridgeObjectRetain();
          uint64_t v19 = a1;
          if (swift_isUniquelyReferenced_nonNull_native())
          {
LABEL_13:
            if ((char *)v17 < v15->data)
            {
              uint64_t v26 = (void **)((char *)&v15->isa + a4);
              uint64_t v27 = *(void **)((char *)&v15[1].isa + a4);
              uint64_t v28 = *(uint64_t *)((char *)&v15[1].info + a4);
              v26[4] = v19;
              v26[5] = a2;
              uint64_t v29 = v19;
              unsigned __int8 v30 = *((unsigned char *)&v15[1].data + a4);
              *((unsigned char *)v26 + 48) = a3;
              sub_2473D8260(v29, a2, a3);
              sub_2473D82EC(v27, v28, v30);
              *(void *)(v14 + 16) = v15;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_retain();
              sub_24740D6A0();
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              goto LABEL_15;
            }
            __break(1u);
            goto LABEL_42;
          }
LABEL_40:
          uint64_t v15 = (__CFString *)sub_2473FB7AC(v15);
          goto LABEL_13;
        }
      }
      __break(1u);
      goto LABEL_40;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v47 = v12;
    swift_bridgeObjectRelease();
  }
}

void sub_2473F3128(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(*(void *)(v2 + 16) + 16);
  if (!v4) {
    return;
  }
  swift_bridgeObjectRetain();
  id v7 = objc_msgSend(a1, sel_sectionIdentifier);
  unint64_t v8 = *(void *)(*(void *)(v3 + 16) + 16);
  if (!v8)
  {
    id v65 = v7;
    swift_bridgeObjectRelease();
LABEL_48:

    return;
  }
  id v9 = v7;
  uint64_t v10 = swift_bridgeObjectRetain();
  unint64_t v11 = sub_2473FD22C(v10);
  char v13 = v12;
  swift_bridgeObjectRelease();

  if ((v13 & 1) == 0)
  {
    if ((v11 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v11 < *(void *)(v4 + 16))
    {
      uint64_t v14 = v4 + 24 * v11;
      unint64_t v11 = *(void *)(v14 + 32);
      uint64_t v15 = *(void *)(v14 + 40);
      uint64_t v16 = *(unsigned __int8 *)(v14 + 48);
      sub_2473D8260((id)v11, v15, *(unsigned char *)(v14 + 48));
      swift_bridgeObjectRelease();
      switch(v16)
      {
        case 1:
          sub_2473D82EC((id)v11, v15, 1u);
          sub_2473F2C5C(a1, 0, 1, a2 & 1);
          return;
        case 2:
          swift_bridgeObjectRelease();
          id v33 = objc_msgSend((id)v11, sel_parameters);
          sub_2473CF248(0, &qword_26B12BB70);
          unint64_t v8 = sub_24740DD70();

          if (v8 >> 62) {
            goto LABEL_44;
          }
          if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_25;
          }
          goto LABEL_45;
        case 3:
          id v53 = (id)v11;
          sub_2473F2C5C(v11, v15, 3, a2 & 1);
          sub_2473D82EC((id)v11, v15, 3u);
          sub_2473D82EC((id)v11, v15, 3u);
          return;
        default:
          sub_2473D82EC((id)v11, v15, 0);
          self;
          uint64_t v17 = swift_dynamicCastObjCClass();
          if (v17)
          {
            id v18 = (id)v17;
            id v19 = a1;
            if (a2)
            {
              id v20 = v19;
              id v21 = objc_msgSend(v18, sel_controlType);
              id v22 = objc_msgSend(v21, sel_unsignedIntegerValue);

              id v23 = sub_2473DA1C0();
              char v24 = *(void **)(v3 + 80);
              uint64_t v25 = v24[8];
              if (v25)
              {
                uint64_t v26 = v25
                    + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_control;
                uint64_t v27 = *(void **)v26;
                id v28 = *(id *)(v26 + 8);
                sub_2473CF248(0, (unint64_t *)&qword_26924C0C8);
                id v29 = v27;
                char v30 = sub_24740E040();

                if ((v30 & 1) == 0) {
                  goto LABEL_15;
                }
                if (v22 != v28) {
                  goto LABEL_15;
                }
                uint64_t v31 = v24[3];
                if (!v31) {
                  goto LABEL_15;
                }
                uint64_t v32 = v24[2];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                id v18 = sub_2473DA9B4(v32, v31);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                id v23 = v20;
              }
            }
LABEL_15:
            id v65 = v18;
            sub_2473F2C5C(v18, 0, 0, a2 & 1);

            goto LABEL_48;
          }
          if (qword_26B12B950 == -1) {
            goto LABEL_36;
          }
          goto LABEL_53;
      }
    }
    __break(1u);
LABEL_44:
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_24740E4A0();
    swift_bridgeObjectRelease();
    if (v63)
    {
LABEL_25:
      if ((v8 & 0xC000000000000001) != 0)
      {
        id v34 = (id)MEMORY[0x24C554A50](0, v8);
      }
      else
      {
        if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_53:
          swift_once();
LABEL_36:
          uint64_t v54 = sub_24740D560();
          __swift_project_value_buffer(v54, (uint64_t)qword_26B12B938);
          id v65 = a1;
          id v55 = sub_24740D540();
          os_log_type_t v56 = sub_24740DE90();
          if (os_log_type_enabled(v55, v56))
          {
            uint64_t v57 = swift_slowAlloc();
            char v58 = (void *)swift_slowAlloc();
            uint64_t v59 = swift_slowAlloc();
            uint64_t v66 = v59;
            *(_DWORD *)uint64_t v57 = 136315394;
            sub_2473CF248(0, &qword_26924C378);
            uint64_t v60 = sub_24740E6A0();
            sub_2474096F8(v60, v61, &v66);
            sub_24740E220();
            swift_bridgeObjectRelease();
            *(_WORD *)(v57 + 12) = 2112;
            id v62 = v65;
            sub_24740E220();
            *char v58 = v65;

            _os_log_impl(&dword_2473C9000, v55, v56, "Invalid action type. Expected: %s, got: %@", (uint8_t *)v57, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
            swift_arrayDestroy();
            MEMORY[0x24C5554B0](v58, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x24C5554B0](v59, -1, -1);
            MEMORY[0x24C5554B0](v57, -1, -1);

            return;
          }

          goto LABEL_47;
        }
        id v34 = *(id *)(v8 + 32);
      }
      uint64_t v35 = v34;
      swift_bridgeObjectRelease();
      self;
      uint64_t v36 = swift_dynamicCastObjCClass();
      if (v36)
      {
        uint64_t v37 = (void *)v36;
        id v38 = a1;
        id v39 = objc_msgSend(v37, sel_templateParameterValues);
        sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
        uint64_t v40 = sub_24740DC80();

        id v41 = objc_msgSend(v35, sel_key);
        uint64_t v42 = sub_24740DCF0();
        uint64_t v44 = v43;

        if (*(void *)(v40 + 16))
        {
          unint64_t v45 = sub_247409310(v42, v44);
          if (v46)
          {
            id v47 = *(id *)(*(void *)(v40 + 56) + 8 * v45);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            __swift_instantiateConcreteTypeFromMangledName(&qword_26924C808);
            uint64_t inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_247410870;
            *(void *)(inited + 32) = v35;
            *(void *)(inited + 40) = v47;
            id v49 = v47;
            id v50 = (id)v11;
            id v51 = v35;
            unint64_t v52 = sub_2473F2334(inited);
            sub_2473F2C5C(v11, v52, 2, a2 & 1);

            swift_bridgeObjectRelease();
            return;
          }
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
      }
    }
    else
    {
LABEL_45:
      swift_bridgeObjectRelease();
    }
    id v65 = (id)v11;
    unint64_t v64 = sub_2473F2334(MEMORY[0x263F8EE78]);
    sub_2473F2C5C(v11, v64, 2, a2 & 1);
    swift_bridgeObjectRelease();
LABEL_47:

    goto LABEL_48;
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_2473F3978@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v46 = a3;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C9B0);
  uint64_t v40 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  id v39 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C9B8);
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  id v41 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v43 = (char *)&v34 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAD8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C9C0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C9C8);
  uint64_t v37 = *(void *)(v17 - 8);
  uint64_t v38 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v35 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  id v21 = (char *)&v34 - v20;
  char v22 = *a1;
  if (qword_26B12B928 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_26B12BD70;
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = v22;
  *(void *)(v24 + 24) = v23;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B970);
  sub_2473D3668(&qword_26B12B968, &qword_26B12B970);
  sub_24740D720();
  sub_2473D3668(&qword_26B12BAD0, &qword_26B12BAD8);
  uint64_t v25 = sub_24740D730();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v47 = v25;
  uint64_t v49 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA60);
  sub_2473D3668(&qword_26B12BA58, &qword_26B12BA60);
  sub_24740D770();
  swift_release();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C9D0);
  sub_2473D3668(&qword_26924C9D8, &qword_26924C9C0);
  sub_24740D780();
  swift_release();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v47 = sub_2473EBEBC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C778);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C9E0);
  sub_2473D3668(&qword_26924C780, &qword_26924C778);
  uint64_t v26 = v39;
  sub_24740D780();
  swift_release();
  uint64_t v47 = 0;
  char v48 = -1;
  sub_2473D3668(&qword_26924C9E8, &qword_26924C9B0);
  uint64_t v27 = v42;
  id v28 = v43;
  sub_24740D770();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v27);
  uint64_t v30 = v37;
  uint64_t v29 = v38;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v35, v21, v38);
  uint64_t v32 = v44;
  uint64_t v31 = v45;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v41, v28, v45);
  sub_2473D3668(&qword_26924C9F0, &qword_26924C9C8);
  sub_2473D3668(&qword_26924C9F8, &qword_26924C9B8);
  sub_24740D620();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v28, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v21, v29);
}

uint64_t sub_2473F4060@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  if ((unint64_t)*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24740E4A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v7 = (uint64_t *)MEMORY[0x263F8EE78];
  if (v6)
  {
    v35[0] = MEMORY[0x263F8EE78];
    uint64_t v7 = v35;
    sub_2473F95A4(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0)
    {
      __break(1u);
LABEL_31:
      uint64_t v7 = sub_2473F925C(0, v7[2] + 1, 1, v7);
      goto LABEL_19;
    }
    uint64_t v33 = a2;
    uint64_t v34 = a3;
    uint64_t v7 = (uint64_t *)v35[0];
    if ((v5 & 0xC000000000000001) != 0)
    {
      uint64_t v8 = 0;
      uint64_t v9 = MEMORY[0x263F8EE80];
      do
      {
        uint64_t v10 = MEMORY[0x24C554A50](v8, v5);
        v35[0] = (uint64_t)v7;
        unint64_t v12 = v7[2];
        unint64_t v11 = v7[3];
        if (v12 >= v11 >> 1)
        {
          sub_2473F95A4(v11 > 1, v12 + 1, 1);
          uint64_t v7 = (uint64_t *)v35[0];
        }
        ++v8;
        v7[2] = v12 + 1;
        uint64_t v13 = &v7[3 * v12];
        v13[4] = v10;
        v13[5] = v9;
        *((unsigned char *)v13 + 48) = 2;
      }
      while (v6 != v8);
    }
    else
    {
      uint64_t v14 = (void **)(v5 + 32);
      uint64_t v15 = MEMORY[0x263F8EE80];
      do
      {
        uint64_t v16 = *v14;
        v35[0] = (uint64_t)v7;
        unint64_t v17 = v7[2];
        unint64_t v18 = v7[3];
        id v19 = v16;
        if (v17 >= v18 >> 1)
        {
          sub_2473F95A4(v18 > 1, v17 + 1, 1);
          uint64_t v7 = (uint64_t *)v35[0];
        }
        v7[2] = v17 + 1;
        uint64_t v20 = &v7[3 * v17];
        v20[4] = (uint64_t)v19;
        v20[5] = v15;
        *((unsigned char *)v20 + 48) = 2;
        ++v14;
        --v6;
      }
      while (v6);
    }
    a2 = v33;
    a3 = v34;
  }
  v35[3] = (uint64_t)&type metadata for Features;
  v35[4] = sub_2473D7BAC();
  char v21 = sub_24740D4F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  if ((v21 & 1) == 0 || *(unsigned char *)(a2 + 96) != 1) {
    goto LABEL_22;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_31;
  }
LABEL_19:
  unint64_t v23 = v7[2];
  unint64_t v22 = v7[3];
  if (v23 >= v22 >> 1) {
    uint64_t v7 = sub_2473F925C((void *)(v22 > 1), v23 + 1, 1, v7);
  }
  v7[2] = v23 + 1;
  uint64_t v24 = &v7[3 * v23];
  v24[4] = 0;
  v24[5] = 0;
  *((unsigned char *)v24 + 48) = 0;
LABEL_22:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v7 = sub_2473F925C(0, v7[2] + 1, 1, v7);
  }
  unint64_t v26 = v7[2];
  unint64_t v25 = v7[3];
  if (v26 >= v25 >> 1) {
    uint64_t v7 = sub_2473F925C((void *)(v25 > 1), v26 + 1, 1, v7);
  }
  v7[2] = v26 + 1;
  uint64_t v27 = &v7[3 * v26];
  v27[4] = 0;
  v27[5] = 0;
  *((unsigned char *)v27 + 48) = 1;
  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851C0]), sel_init);
  unint64_t v30 = v7[2];
  unint64_t v29 = v7[3];
  if (v30 >= v29 >> 1) {
    uint64_t v7 = sub_2473F925C((void *)(v29 > 1), v30 + 1, 1, v7);
  }
  v7[2] = v30 + 1;
  uint64_t v31 = &v7[3 * v30];
  v31[4] = (uint64_t)v28;
  v31[5] = 0;
  *((unsigned char *)v31 + 48) = 3;
  v35[0] = (uint64_t)v7;
  swift_bridgeObjectRetain();
  sub_2473FB7C0(v35);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v35[0];
  return result;
}

id sub_2473F43D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void **)a1;
  char v3 = *(unsigned char *)(a1 + 8);
  *(void *)a2 = *(void *)a1;
  *(unsigned char *)(a2 + 8) = v3;
  return v2;
}

uint64_t sub_2473F43E4(uint64_t a1, __CFString **a2, int a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2473F4460(a1, a2, a3);
    return swift_release();
  }
  return result;
}

uint64_t sub_2473F4460(uint64_t a1, __CFString **a2, int a3)
{
  uint64_t v4 = v3;
  LODWORD(v5) = a3;
  uint64_t v170 = a1;
  uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C818);
  id v176 = *(char **)(v165 - 8);
  MEMORY[0x270FA5388](v165);
  id v164 = (char *)&v153 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA20);
  uint64_t v156 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  v154 = (char *)&v153 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA00);
  uint64_t v158 = *(void *)(v159 - 8);
  MEMORY[0x270FA5388](v159);
  id v155 = (char *)&v153 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B12B950 != -1) {
    goto LABEL_124;
  }
LABEL_2:
  uint64_t v10 = sub_24740D560();
  uint64_t v169 = __swift_project_value_buffer(v10, (uint64_t)qword_26B12B938);
  unint64_t v11 = sub_24740D540();
  os_log_type_t v12 = sub_24740DEB0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_2473C9000, v11, v12, "Resetting the store", v13, 2u);
    MEMORY[0x24C5554B0](v13, -1, -1);
  }

  uint64_t v14 = v4[5];
  LOBYTE(v186) = 1;
  *(unsigned char *)(v14 + 16) = 1;
  swift_retain();
  swift_retain();
  sub_24740D6A0();
  swift_release();
  swift_release();
  uint64_t v15 = v4[4];
  uint64_t v186 = MEMORY[0x263F8EE80];
  *(void *)(v15 + 16) = MEMORY[0x263F8EE80];
  swift_retain();
  swift_bridgeObjectRelease();
  swift_retain();
  sub_24740D6A0();
  swift_release();
  swift_release();
  uint64_t v16 = v4[2];
  uint64_t v186 = v170;
  *(void *)(v16 + 16) = v170;
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_bridgeObjectRelease();
  swift_retain();
  sub_24740D6A0();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v171 = v4;
  unint64_t v17 = (void *)v4[11];
  if (!v17 || (unint64_t v18 = *(void *)(v171[2] + 16)) == 0 || (v19 = *(void *)(v18 + 16)) == 0)
  {
LABEL_22:
    if ((_BYTE)v5 == 0xFF) {
      goto LABEL_48;
    }
    if (v5)
    {
      uint64_t v37 = *(unsigned __int8 **)(v171[2] + 16);
      if (!v37) {
        goto LABEL_48;
      }
      uint64_t v38 = *((void *)v37 + 2);
      if (!v38) {
        goto LABEL_48;
      }
      swift_bridgeObjectRetain();
      LODWORD(v175) = v5;
      sub_2473FD98C(a2, (char)v5);
      swift_bridgeObjectRetain();
      uint64_t v174 = v37;
      id v39 = v37 + 48;
      while (1)
      {
        uint64_t v40 = (void *)*((void *)v39 - 2);
        uint64_t v41 = *((void *)v39 - 1);
        int v43 = *v39;
        v39 += 24;
        char v42 = v43;
        switch(v43)
        {
          case 1:
            sub_2473D8260(v40, v41, 1u);
            uint64_t v44 = @"Shortcuts";
            goto LABEL_31;
          case 2:
            id v46 = v40;
            swift_bridgeObjectRetain();
            id v47 = objc_msgSend(v46, sel_sectionIdentifier);
            goto LABEL_34;
          case 3:
            id v47 = objc_msgSend(v40, sel_sectionIdentifier);
LABEL_34:
            uint64_t v44 = (__CFString *)v47;
            break;
          default:
            sub_2473D8260(v40, v41, 0);
            uint64_t v44 = @"Controls";
LABEL_31:
            uint64_t v45 = v44;
            break;
        }
        uint64_t v48 = sub_24740DCF0();
        uint64_t v50 = v49;
        if (v48 == sub_24740DCF0() && v50 == v51) {
          break;
        }
        char v53 = sub_24740E5A0();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v53) {
          goto LABEL_45;
        }
        sub_2473D82EC(v40, v41, v42);
        if (!--v38)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v35 = a2;
          goto LABEL_46;
        }
      }
      swift_bridgeObjectRelease_n();

LABEL_45:
      swift_bridgeObjectRelease_n();
      sub_2473F2C5C(v40, v41, v42, 1);
      sub_2473D82EC(v40, v41, v42);
      uint64_t v35 = a2;
LABEL_46:
      char v36 = (char)v175;
    }
    else
    {
      sub_2473F3128(a2, 1);
      uint64_t v35 = a2;
      char v36 = (char)v5;
    }
    sub_2473F17FC(v35, v36);
    goto LABEL_48;
  }
  uint64_t v172 = a2;
  LODWORD(v175) = v5;
  swift_bridgeObjectRetain_n();
  uint64_t v174 = v17;
  unint64_t v173 = v18;
  uint64_t v20 = (unsigned __int8 *)(v18 + 48);
  while (1)
  {
    char v21 = (void *)*((void *)v20 - 2);
    uint64_t v22 = *((void *)v20 - 1);
    int v24 = *v20;
    v20 += 24;
    char v23 = v24;
    switch(v24)
    {
      case 1:
        sub_2473D8260(v21, v22, 1u);
        unint64_t v25 = @"Shortcuts";
        goto LABEL_11;
      case 2:
        id v27 = v21;
        swift_bridgeObjectRetain();
        id v28 = objc_msgSend(v27, sel_sectionIdentifier);
        goto LABEL_14;
      case 3:
        id v28 = objc_msgSend(v21, sel_sectionIdentifier);
LABEL_14:
        unint64_t v25 = (__CFString *)v28;
        break;
      default:
        sub_2473D8260(v21, v22, 0);
        unint64_t v25 = @"Controls";
LABEL_11:
        unint64_t v26 = v25;
        break;
    }
    uint64_t v29 = sub_24740DCF0();
    uint64_t v31 = v30;
    if (v29 == sub_24740DCF0() && v31 == v32) {
      break;
    }
    char v34 = sub_24740E5A0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v34) {
      goto LABEL_43;
    }
    sub_2473D82EC(v21, v22, v23);
    if (!--v19)
    {

      swift_bridgeObjectRelease_n();
      LODWORD(v5) = v175;
      a2 = v172;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease_n();

LABEL_43:
  swift_bridgeObjectRelease_n();
  uint64_t v54 = v171;
  sub_2473F5928(v21, v22, v23);

  sub_2473D82EC(v21, v22, v23);
  id v55 = (void *)v54[11];
  v54[11] = 0;

LABEL_48:
  os_log_type_t v56 = v171;
  uint64_t v57 = v171[3];
  switch(*(unsigned char *)(v57 + 32))
  {
    case 0:
      char v58 = @"Controls";
      goto LABEL_51;
    case 1:
      char v58 = @"Shortcuts";
LABEL_51:
      uint64_t v59 = v58;
      goto LABEL_53;
    case 2:
    case 3:
      char v58 = (__CFString *)objc_msgSend(*(id *)(v57 + 16), sel_sectionIdentifier);
LABEL_53:
      uint64_t v60 = *(unsigned __int8 **)(v56[2] + 16);
      if (v60 && (uint64_t v61 = *((void *)v60 + 2)) != 0)
      {
        swift_bridgeObjectRetain_n();
        long long v175 = v60;
        id v62 = v60 + 48;
        do
        {
          uint64_t v63 = (void *)*((void *)v62 - 2);
          uint64_t v64 = *((void *)v62 - 1);
          int v66 = *v62;
          v62 += 24;
          unsigned __int8 v65 = v66;
          switch(v66)
          {
            case 1:
              sub_2473D8260(v63, v64, 1u);
              uint64_t v67 = @"Shortcuts";
              goto LABEL_59;
            case 2:
              id v69 = v63;
              swift_bridgeObjectRetain();
              id v70 = objc_msgSend(v69, sel_sectionIdentifier);
              goto LABEL_62;
            case 3:
              id v70 = objc_msgSend(v63, sel_sectionIdentifier);
LABEL_62:
              uint64_t v67 = (__CFString *)v70;
              break;
            default:
              sub_2473D8260(v63, v64, 0);
              uint64_t v67 = @"Controls";
LABEL_59:
              uint64_t v68 = v67;
              break;
          }
          uint64_t v71 = sub_24740DCF0();
          uint64_t v73 = v72;
          if (v71 == sub_24740DCF0() && v73 == v74)
          {
            swift_bridgeObjectRelease_n();

LABEL_92:
            swift_bridgeObjectRelease_n();

            sub_2473D82EC(v63, v64, v65);
            goto LABEL_95;
          }
          char v76 = sub_24740E5A0();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v76) {
            goto LABEL_92;
          }
          sub_2473D82EC(v63, v64, v65);
          --v61;
        }
        while (v61);

        swift_bridgeObjectRelease_n();
        os_log_type_t v56 = v171;
      }
      else
      {
      }
LABEL_71:
      uint64_t v77 = *(void *)(v56[2] + 16);
      if (v77 && (uint64_t v78 = *(void *)(v77 + 16)) != 0)
      {
        swift_bridgeObjectRetain_n();
        id v79 = (unsigned __int8 *)(v77 + 48);
        while (1)
        {
          uint64_t v80 = (void *)*((void *)v79 - 2);
          uint64_t v81 = *((void *)v79 - 1);
          int v83 = *v79;
          v79 += 24;
          char v82 = v83;
          switch(v83)
          {
            case 1:
              sub_2473D8260(v80, v81, 1u);
              uint64_t v84 = @"Shortcuts";
              goto LABEL_77;
            case 2:
              id v86 = v80;
              swift_bridgeObjectRetain();
              id v87 = objc_msgSend(v86, sel_sectionIdentifier);
              goto LABEL_80;
            case 3:
              id v87 = objc_msgSend(v80, sel_sectionIdentifier);
LABEL_80:
              uint64_t v84 = (__CFString *)v87;
              break;
            default:
              sub_2473D8260(v80, v81, 0);
              uint64_t v84 = @"Controls";
LABEL_77:
              uint64_t v85 = v84;
              break;
          }
          uint64_t v88 = sub_24740DCF0();
          uint64_t v90 = v89;
          if (v88 == sub_24740DCF0() && v90 == v91) {
            break;
          }
          char v93 = sub_24740E5A0();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v93) {
            goto LABEL_93;
          }
          sub_2473D82EC(v80, v81, v82);
          if (!--v78)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_88;
          }
        }
        swift_bridgeObjectRelease_n();

LABEL_93:
        swift_bridgeObjectRelease_n();
      }
      else
      {
LABEL_88:
        if (!*(void *)(v170 + 16))
        {
          __break(1u);
          JUMPOUT(0x2473F58D8);
        }
        uint64_t v80 = *(void **)(v170 + 32);
        uint64_t v81 = *(void *)(v170 + 40);
        char v82 = *(unsigned char *)(v170 + 48);
        sub_2473D8260(v80, v81, v82);
      }
      sub_2473F5928(v80, v81, v82);
      sub_2473D82EC(v80, v81, v82);
LABEL_95:
      swift_weakInit();
      uint64_t v94 = MEMORY[0x263F8EE78];
      uint64_t v187 = MEMORY[0x263F8EE78];
      a2 = *(__CFString ***)(v170 + 16);
      if (!a2) {
        goto LABEL_119;
      }
      uint64_t v95 = v170;
      swift_bridgeObjectRetain();
      swift_beginAccess();
      v162 = &v178;
      uint64_t v172 = &v179;
      uint64_t v163 = (void (**)(char *, uint64_t))(v176 + 8);
      uint64_t v4 = (void *)(v95 + 48);
      *(void *)&long long v96 = 136315138;
      long long v161 = v96;
      uint64_t v160 = MEMORY[0x263F8EE58] + 8;
      unint64_t v173 = 0x8000000247412D10;
      break;
    default:
      goto LABEL_71;
  }
  do
  {
    id v97 = (void *)*(v4 - 2);
    uint64_t v98 = (unsigned __int8 *)*(v4 - 1);
    int v99 = *(unsigned __int8 *)v4;
    if (swift_weakLoadStrong())
    {
      if (v99 == 2)
      {
        sub_2473D8260(v97, (uint64_t)v98, 2u);
        uint64_t v100 = v97;
        id v101 = objc_msgSend(v100, sel_parameters);
        sub_2473CF248(0, &qword_26B12BB70);
        unint64_t v102 = sub_24740DD70();

        long long v175 = (unsigned __int8 *)v97;
        uint64_t v174 = v98;
        if (v102 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v103 = sub_24740E4A0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v103 = *(void *)((v102 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        id v176 = v100;
        if (v103 >= 2)
        {
          uint64_t v104 = v100;
          uint64_t v105 = sub_24740D540();
          os_log_type_t v106 = sub_24740DE90();
          int v107 = v106;
          if (os_log_type_enabled(v105, v106))
          {
            uint64_t v108 = swift_slowAlloc();
            int v168 = v107;
            uint64_t v109 = (uint8_t *)v108;
            uint64_t v110 = swift_slowAlloc();
            uint64_t v178 = v110;
            id v167 = v109;
            *(_DWORD *)uint64_t v109 = v161;
            id v166 = v109 + 4;
            id v111 = objc_msgSend(v104, sel_actionIdentifier);
            uint64_t v112 = sub_24740DCF0();
            unint64_t v114 = v113;

            uint64_t v177 = sub_2474096F8(v112, v114, &v178);
            sub_24740E220();

            swift_bridgeObjectRelease();
            double v115 = v167;
            _os_log_impl(&dword_2473C9000, v105, (os_log_type_t)v168, "%s has multiple parameters; will only displaying first parameter",
              v167,
              0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C5554B0](v110, -1, -1);
            MEMORY[0x24C5554B0](v115, -1, -1);
          }
          else
          {
          }
        }
        uint64_t v5 = @"Focus";
        uint64_t v179 = @"Focus";
        unint64_t v180 = 0xD000000000000031;
        unint64_t v181 = v173;
        v182 = @"Camera";
        uint64_t v183 = 0x746F685072616572;
        unint64_t v184 = 0xE90000000000006FLL;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBB0);
        uint64_t v116 = (__CFString *)sub_24740E4D0();
        uint64_t v117 = v179;
        unint64_t v118 = v180;
        unint64_t v119 = v181;
        uint64_t v120 = @"Focus";
        char v121 = @"Camera";
        uint64_t v122 = v117;
        swift_bridgeObjectRetain();
        unint64_t v123 = sub_24740922C((uint64_t)v122);
        if (v124)
        {
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          swift_once();
          goto LABEL_2;
        }
        uint64_t v5 = v116 + 2;
        *(void **)((char *)&v116[2].isa + ((v123 >> 3) & 0x1FFFFFFFFFFFFFF8)) = (void *)(*(uint64_t *)((char *)&v116[2].isa + ((v123 >> 3) & 0x1FFFFFFFFFFFFFF8)) | (1 << v123));
        *(void *)&v116[1].data[8 * v123] = v122;
        uint64_t v125 = (unint64_t *)(v116[1].length + 16 * v123);
        *uint64_t v125 = v118;
        v125[1] = v119;
        data = v116->data;
        BOOL v127 = __OFADD__(data, 1);
        id v128 = data + 1;
        if (v127) {
          goto LABEL_121;
        }
        v116->data = v128;
        uint64_t v129 = v183;
        unint64_t v130 = v184;
        id v131 = v182;
        swift_bridgeObjectRetain();
        unint64_t v132 = sub_24740922C((uint64_t)v131);
        if (v133) {
          goto LABEL_122;
        }
        *(void **)((char *)&v5->isa + ((v132 >> 3) & 0x1FFFFFFFFFFFFFF8)) = (void *)(*(uint64_t *)((char *)&v5->isa
                                                                                                  + ((v132 >> 3) & 0x1FFFFFFFFFFFFFF8)) | (1 << v132));
        *(void *)&v116[1].data[8 * v132] = v131;
        uint64_t v134 = (uint64_t *)(v116[1].length + 16 * v132);
        *uint64_t v134 = v129;
        v134[1] = v130;
        uint64_t v135 = v116->data;
        BOOL v127 = __OFADD__(v135, 1);
        uint64_t v136 = v135 + 1;
        if (v127) {
          goto LABEL_123;
        }
        v116->data = v136;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26924C9A8);
        swift_arrayDestroy();
        id v137 = v176;
        id v138 = objc_msgSend(v176, sel_sectionIdentifier);
        uint64_t v139 = v138;
        if (v116->data && (sub_24740922C((uint64_t)v138), (v140 & 1) != 0))
        {

          swift_release();
          uint64_t v141 = swift_allocObject();
          swift_weakInit();
          uint64_t v142 = swift_allocObject();
          *(void *)(v142 + 16) = v141;
          *(void *)(v142 + 24) = v137;
          id v143 = v137;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA50);
          sub_2473D3668(&qword_26B12BA48, &qword_26B12BA50);
          id v144 = v164;
          sub_24740D720();
          sub_2473D3668(&qword_26924C820, &qword_26924C818);
          uint64_t v145 = v165;
          sub_24740D730();
          (*v163)(v144, v145);

          swift_release();
          sub_2473D82EC(v175, (uint64_t)v174, 2u);
          MEMORY[0x24C554460]();
          if (*(void *)(v187 + 16) >= *(void *)(v187 + 24) >> 1) {
            sub_24740DDA0();
          }
          sub_24740DDC0();
          sub_24740DD90();
        }
        else
        {

          swift_release();
          swift_release();

          sub_2473D82EC(v175, (uint64_t)v174, 2u);
        }
      }
      else
      {
        swift_release();
      }
    }
    v4 += 3;
    a2 = (__CFString **)((char *)a2 - 1);
  }
  while (a2);
  swift_bridgeObjectRelease();
  uint64_t v94 = v187;
LABEL_119:
  swift_weakDestroy();
  uint64_t v185 = v94;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAF0);
  sub_2473D3668(&qword_26B12BAF8, &qword_26B12BAF0);
  uint64_t v146 = v154;
  sub_24740DD40();
  swift_bridgeObjectRelease();
  sub_24740D660();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA50);
  sub_2473D3668(&qword_26B12BA18, &qword_26B12BA20);
  sub_2473D3668(&qword_26B12BA48, &qword_26B12BA50);
  id v147 = v155;
  uint64_t v148 = v157;
  sub_24740D890();
  (*(void (**)(char *, uint64_t))(v156 + 8))(v146, v148);
  sub_2473D3668(&qword_26B12B9F8, &qword_26B12BA00);
  uint64_t v149 = v159;
  sub_24740D790();
  (*(void (**)(char *, uint64_t))(v158 + 8))(v147, v149);
  uint64_t v150 = v171;
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  swift_release();
  uint64_t v151 = v150[5];
  LOBYTE(v185) = 0;
  *(unsigned char *)(v151 + 16) = 0;
  swift_retain();
  swift_retain();
  sub_24740D6A0();
  swift_release();
  return swift_release();
}

void sub_2473F5928(void *a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C818);
  char v58 = *(void (***)(char *, uint64_t))(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v3 + 24);
  int v12 = *(unsigned __int8 *)(v11 + 32);
  if (v12 != 255)
  {
    uint64_t v14 = *(void **)(v11 + 16);
    uint64_t v13 = *(void *)(v11 + 24);
    sub_2473D8260(a1, a2, a3);
    sub_2473FD504(v14, v13, v12);
    sub_247409D50(v14, v13, v12, a1, a2, a3);
    char v16 = v15;
    sub_2473D82EC(a1, a2, a3);
    sub_2473FD518(v14, v13, v12);
    if (v16) {
      return;
    }
    uint64_t v11 = *(void *)(v4 + 24);
    int v12 = *(unsigned __int8 *)(v11 + 32);
  }
  unint64_t v18 = *(void **)(v11 + 16);
  uint64_t v17 = *(void *)(v11 + 24);
  uint64_t v60 = (uint64_t)a1;
  uint64_t v61 = a2;
  char v62 = a3;
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  *(unsigned char *)(v11 + 32) = a3;
  sub_2473D8260(a1, a2, a3);
  sub_2473D8260(a1, a2, a3);
  sub_2473D8260(a1, a2, a3);
  swift_retain();
  sub_2473FD504(v18, v17, v12);
  int v59 = v12;
  sub_2473FD518(v18, v17, v12);
  swift_retain();
  sub_24740D6A0();
  swift_release();
  sub_2473D82EC(a1, a2, a3);
  sub_2473D82EC(a1, a2, a3);
  swift_release();
  uint64_t v19 = *(void *)(v4 + 24);
  uint64_t v20 = *(void **)(v19 + 16);
  uint64_t v21 = *(void *)(v19 + 24);
  int v22 = *(unsigned __int8 *)(v19 + 32);
  if (v22)
  {
    if (v22 == 2)
    {
      unint64_t v52 = v10;
      uint64_t v23 = v8;
      id v24 = v20;
      id v54 = v20;
      sub_2473FD504(v20, v21, 2u);
      id v53 = v24;
      unint64_t v25 = (void (**)(char *, uint64_t))objc_msgSend(v24, sel_sectionIdentifier);
      id v55 = v18;
      os_log_type_t v56 = v25;
      uint64_t v57 = v17;
      unint64_t v26 = @"Controls";
      uint64_t v27 = v23;
      uint64_t v51 = v21;
      switch(v59)
      {
        case 0:
          goto LABEL_8;
        case 1:
          unint64_t v26 = @"Shortcuts";
LABEL_8:
          id v28 = v26;
          goto LABEL_21;
        case 2:
        case 3:
          id v28 = (__CFString *)objc_msgSend(v18, (SEL)&selRef__setPreferredNumberOfVisibleIndicators_);
LABEL_21:
          uint64_t v40 = v28;
          id v39 = v52;
          uint64_t v41 = sub_24740DCF0();
          uint64_t v43 = v42;
          if (v41 == sub_24740DCF0() && v43 == v44)
          {

            swift_bridgeObjectRelease_n();
            uint64_t v21 = v51;
LABEL_25:

            sub_2473FD518(v54, v21, 2u);
            goto LABEL_27;
          }
          char v45 = sub_24740E5A0();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v21 = v51;
          if (v45) {
            goto LABEL_25;
          }
LABEL_26:
          uint64_t v46 = swift_allocObject();
          swift_weakInit();
          uint64_t v47 = swift_allocObject();
          id v48 = v53;
          *(void *)(v47 + 16) = v46;
          *(void *)(v47 + 24) = v48;
          os_log_type_t v56 = (void (**)(char *, uint64_t))v48;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA50);
          sub_2473D3668(&qword_26B12BA48, &qword_26B12BA50);
          sub_24740D720();
          sub_2473D3668(&qword_26924C820, &qword_26924C818);
          uint64_t v49 = sub_24740D730();
          v58[1](v39, v27);
          uint64_t v60 = v49;
          uint64_t v50 = sub_24740D790();

          sub_2473FD518(v54, v21, 2u);
          swift_release();
          *(void *)(v4 + 72) = v50;
          swift_release();
LABEL_27:
          unint64_t v18 = v55;
          break;
        default:

          uint64_t v27 = v23;
          id v39 = v52;
          goto LABEL_26;
      }
      goto LABEL_28;
    }
    *(void *)(v4 + 72) = 0;
    swift_release();
LABEL_29:
    sub_2473F844C(a1, a2, a3);
    unsigned __int8 v37 = v59;
    goto LABEL_30;
  }
  if (!v20) {
    goto LABEL_29;
  }
  uint64_t v57 = v17;
  if (v59)
  {
    sub_2473FD504(v20, v21, 0);
    sub_2473D8260(v20, v21, 0);
    sub_2473D8260(v20, v21, 0);
LABEL_17:
    uint64_t v29 = v20;
LABEL_18:
    uint64_t v60 = sub_2473F8130(v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C0E0);
    sub_2473D3668(&qword_26924C0E8, &qword_26924C0E0);
    uint64_t v38 = sub_24740D790();
    sub_2473FD518(v29, v21, 0);
    sub_2473FD518(v29, v21, 0);
    sub_2473D82EC(v29, v21, 0);
    swift_release();
    *(void *)(v4 + 72) = v38;
    swift_release();
LABEL_28:
    uint64_t v17 = v57;
    goto LABEL_29;
  }
  if (!v18)
  {
    sub_2473FD504(v20, v21, 0);
    sub_2473FD504(v20, v21, 0);
    sub_2473FD504(0, v17, 0);
    sub_2473FD504(v20, v21, 0);
    goto LABEL_17;
  }
  sub_2473FD504(v20, v21, 0);
  sub_2473FD504(v20, v21, 0);
  sub_2473FD504(v18, v17, 0);
  sub_2473FD504(v20, v21, 0);
  uint64_t v29 = v20;
  id v30 = objc_msgSend(v20, sel_controlType);
  char v58 = (void (**)(char *, uint64_t))objc_msgSend(v30, sel_unsignedIntegerValue);

  id v31 = sub_2473DA1C0();
  uint64_t v51 = v21;
  uint64_t v32 = v18;
  uint64_t v33 = v31;
  id v34 = objc_msgSend(v32, sel_controlType);
  os_log_type_t v56 = (void (**)(char *, uint64_t))objc_msgSend(v34, sel_unsignedIntegerValue);

  id v35 = sub_2473DA1C0();
  sub_2473CF248(0, (unint64_t *)&qword_26924C0C8);
  id v36 = v33;
  LOBYTE(v34) = sub_24740E040();
  sub_2473FD518(v32, v17, 0);

  unint64_t v18 = v32;
  uint64_t v21 = v51;

  if ((v34 & 1) == 0 || v58 != v56) {
    goto LABEL_18;
  }
  sub_2473FD518(v29, v21, 0);
  sub_2473FD518(v29, v21, 0);
  sub_2473D82EC(v29, v21, 0);
  unsigned __int8 v37 = 0;
  uint64_t v17 = v57;
LABEL_30:
  sub_2473FD518(v18, v17, v37);
}

void sub_2473F6160(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA98);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C828);
  uint64_t v93 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v90 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C830);
  uint64_t isa = (uint64_t)v9[-1].isa;
  os_log_t v101 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v98 = (uint8_t *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C838);
  uint64_t v94 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v91 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C840);
  uint64_t v96 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  uint64_t v92 = (char *)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C848);
  uint64_t v87 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v15 = (char *)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C850);
  uint64_t v88 = *(uint8_t **)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  uint64_t v17 = (char *)&v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    goto LABEL_13;
  }
  uint64_t v19 = (void *)Strong;
  unint64_t v102 = a2;
  id v20 = objc_msgSend(a1, sel_parameters);
  sub_2473CF248(0, &qword_26B12BB70);
  unint64_t v21 = sub_24740DD70();

  if (v21 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_24740E4A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v22)
  {
    swift_release();
    a2 = v102;
LABEL_13:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAE0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD8);
    sub_24740D700();
    sub_2473D3668(&qword_26924C738, &qword_26B12BA98);
    uint64_t v42 = sub_24740D730();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_34;
  }
  uint64_t v23 = *(void *)(v19[4] + 16);
  if (*(void *)(v23 + 16))
  {
    id v24 = a1;
    swift_bridgeObjectRetain();
    unint64_t v25 = sub_2474092C0((uint64_t)v24);
    if (v26)
    {
      uint64_t v27 = *(void *)(*(void *)(v23 + 56) + 8 * v25);
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease();
      if (*(void *)(v27 + 16))
      {
        if (qword_26B12B950 != -1) {
          swift_once();
        }
        uint64_t v28 = sub_24740D560();
        __swift_project_value_buffer(v28, (uint64_t)qword_26B12B938);
        id v29 = v24;
        id v30 = sub_24740D540();
        os_log_type_t v31 = sub_24740DEB0();
        int v32 = v31;
        if (os_log_type_enabled(v30, v31))
        {
          os_log_t v101 = v30;
          uint64_t v33 = swift_slowAlloc();
          LODWORD(v99) = v32;
          id v34 = (uint8_t *)v33;
          uint64_t isa = swift_slowAlloc();
          v104[0] = isa;
          *(_DWORD *)id v34 = 136315138;
          uint64_t v97 = (uint64_t)(v34 + 4);
          uint64_t v98 = v34;
          id v35 = objc_msgSend(v29, sel_sectionIdentifier);
          uint64_t v36 = sub_24740DCF0();
          unint64_t v38 = v37;

          uint64_t v103 = sub_2474096F8(v36, v38, v104);
          sub_24740E220();

          swift_bridgeObjectRelease();
          os_log_t v39 = v101;
          uint64_t v40 = v98;
          _os_log_impl(&dword_2473C9000, v101, (os_log_type_t)v99, "Already have cached sections for %s", v98, 0xCu);
          uint64_t v41 = isa;
          swift_arrayDestroy();
          MEMORY[0x24C5554B0](v41, -1, -1);
          MEMORY[0x24C5554B0](v40, -1, -1);
        }
        else
        {
        }
        a2 = v102;
        v104[0] = v27;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BAE0);
        sub_24740D6F0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD8);
        sub_24740D6E0();
        (*(void (**)(char *, uint64_t))(v87 + 8))(v15, v13);
        sub_2473D3668(&qword_26924C888, &qword_26924C850);
        uint64_t v86 = v89;
        uint64_t v42 = sub_24740D730();
        swift_release();
        (*((void (**)(char *, uint64_t))v88 + 1))(v17, v86);
        goto LABEL_34;
      }
    }
    else
    {
    }
    swift_bridgeObjectRelease();
  }
  id v43 = objc_msgSend(a1, sel_sectionIdentifier);
  swift_beginAccess();
  uint64_t v44 = v19[8];
  if (*(void *)(v44 + 16) && (unint64_t v45 = sub_24740922C((uint64_t)v43), (v46 & 1) != 0))
  {
    uint64_t v42 = *(void *)(*(void *)(v44 + 56) + 8 * v45);
    swift_endAccess();
    swift_retain();

    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_24740D560();
    __swift_project_value_buffer(v47, (uint64_t)qword_26B12B938);
    id v48 = a1;
    uint64_t v49 = sub_24740D540();
    os_log_type_t v50 = sub_24740DEB0();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      os_log_t v101 = (os_log_t)swift_slowAlloc();
      v104[0] = (uint64_t)v101;
      *(_DWORD *)uint64_t v51 = 136315138;
      uint64_t isa = (uint64_t)(v51 + 4);
      id v52 = objc_msgSend(v48, sel_sectionIdentifier);
      uint64_t v53 = sub_24740DCF0();
      unint64_t v55 = v54;

      uint64_t v103 = sub_2474096F8(v53, v55, v104);
      sub_24740E220();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2473C9000, v49, v50, "Section request for %s is still running", v51, 0xCu);
      os_log_t v56 = v101;
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v56, -1, -1);
      MEMORY[0x24C5554B0](v51, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
    a2 = v102;
  }
  else
  {

    swift_endAccess();
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v57 = sub_24740D560();
    __swift_project_value_buffer(v57, (uint64_t)qword_26B12B938);
    id v58 = a1;
    int v59 = sub_24740D540();
    os_log_type_t v60 = sub_24740DEB0();
    BOOL v61 = os_log_type_enabled(v59, v60);
    uint64_t v89 = (uint64_t)(v19 + 8);
    if (v61)
    {
      char v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      v104[0] = v63;
      *(_DWORD *)char v62 = 136315138;
      uint64_t v88 = v62 + 4;
      id v64 = objc_msgSend(v58, sel_sectionIdentifier);
      uint64_t v65 = sub_24740DCF0();
      unint64_t v67 = v66;

      uint64_t v103 = sub_2474096F8(v65, v67, v104);
      sub_24740E220();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2473C9000, v59, v60, "Starting section request for %s", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v63, -1, -1);
      MEMORY[0x24C5554B0](v62, -1, -1);
    }
    else
    {
    }
    a2 = v102;
    if (qword_26B12B928 != -1) {
      swift_once();
    }
    sub_2473ED6E4(v58, 0);
    v104[0] = v68;
    uint64_t v69 = swift_allocObject();
    swift_weakInit();
    uint64_t v70 = swift_allocObject();
    *(void *)(v70 + 16) = v69;
    *(void *)(v70 + 24) = v58;
    uint64_t v71 = swift_allocObject();
    swift_weakInit();
    uint64_t v72 = swift_allocObject();
    *(void *)(v72 + 16) = v71;
    *(void *)(v72 + 24) = v58;
    uint64_t v73 = swift_allocObject();
    swift_weakInit();
    uint64_t v74 = swift_allocObject();
    *(void *)(v74 + 16) = v73;
    *(void *)(v74 + 24) = v58;
    unint64_t v102 = (uint64_t *)v58;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BA50);
    sub_2473D3668(&qword_26B12BA48, &qword_26B12BA50);
    uint64_t v75 = v91;
    sub_24740D750();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v104[0] = *(void *)(v19[5] + 24);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFE8);
    sub_2473D3668(&qword_26924BFF0, &qword_26924BFE8);
    v104[0] = sub_24740D730();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFF8);
    sub_2473D3668(&qword_26924C000, &qword_26924BFF8);
    char v76 = v90;
    sub_24740D820();
    swift_release();
    sub_2473D3668(&qword_26924C858, &qword_26924C828);
    uint64_t v77 = v98;
    uint64_t v78 = v95;
    sub_24740D7C0();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v76, v78);
    sub_2473D3668(&qword_26924C860, &qword_26924C838);
    sub_2473D3668(&qword_26924C868, &qword_26924C830);
    id v79 = v92;
    uint64_t v80 = v97;
    os_log_t v81 = v101;
    sub_24740D7D0();
    (*(void (**)(uint8_t *, os_log_t))(isa + 8))(v77, v81);
    (*(void (**)(char *, uint64_t))(v94 + 8))(v75, v80);
    sub_2473D3668(&qword_26924C870, &qword_26924C840);
    uint64_t v82 = v99;
    uint64_t v83 = sub_24740D7B0();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v79, v82);
    v104[0] = v83;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C878);
    sub_2473D3668(&qword_26924C880, &qword_26924C878);
    uint64_t v42 = sub_24740D730();
    swift_release();
    id v84 = objc_msgSend(v102, sel_sectionIdentifier);
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v103 = v19[8];
    char v19[8] = 0x8000000000000000;
    sub_2473FAF80(v42, v84, isUniquelyReferenced_nonNull_native);
    char v19[8] = v103;

    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
  }
LABEL_34:
  *a2 = v42;
}

void sub_2473F7214(id *a1, uint64_t a2, void *a3)
{
  id v5 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = Strong;
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24740D560();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B12B938);
    id v9 = a3;
    swift_bridgeObjectRetain_n();
    id v10 = v9;
    uint64_t v11 = sub_24740D540();
    int v12 = sub_24740DEB0();
    if (!os_log_type_enabled(v11, (os_log_type_t)v12))
    {

      swift_bridgeObjectRelease_n();
LABEL_23:
      uint64_t v35 = *(void *)(v7 + 32);
      uint64_t v36 = *(void *)(v35 + 16);
      id v37 = v10;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v97 = v36;
      sub_2473FAE0C((uint64_t)v5, v37, isUniquelyReferenced_nonNull_native);
      uint64_t v39 = v97;

      swift_bridgeObjectRelease();
      uint64_t v97 = v39;
      *(void *)(v35 + 16) = v39;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_retain();
      sub_24740D6A0();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v40 = sub_2473EEDC8();
      if (!v41 || (id v42 = sub_2473EEF50(v40, v41, (uint64_t)v5), swift_bridgeObjectRelease(), (v91 = v42) == 0))
      {
        swift_release();
        return;
      }
      id v43 = objc_msgSend(v37, sel_sectionIdentifier);
      uint64_t v44 = *(void *)(*(void *)(v7 + 16) + 16);
      if (!v44 || (uint64_t v45 = *(void *)(v44 + 16)) == 0)
      {
        swift_release();

LABEL_44:
        return;
      }
      swift_bridgeObjectRetain_n();
      char v46 = (unsigned __int8 *)(v44 + 48);
      while (1)
      {
        uint64_t v47 = (void *)*((void *)v46 - 2);
        uint64_t v48 = *((void *)v46 - 1);
        int v49 = *v46;
        v46 += 24;
        char loga = v49;
        switch(v49)
        {
          case 1:
            os_log_type_t v50 = v47;
            uint64_t v19 = v48;
            sub_2473D8260(v47, v48, 1u);
            uint64_t v51 = @"Shortcuts";
            goto LABEL_31;
          case 2:
            os_log_type_t v50 = v47;
            id v53 = v47;
            uint64_t v19 = v48;
            swift_bridgeObjectRetain();
            id v54 = objc_msgSend(v53, sel_sectionIdentifier);
            goto LABEL_34;
          case 3:
            uint64_t v19 = v48;
            os_log_type_t v50 = v47;
            id v54 = objc_msgSend(v47, sel_sectionIdentifier);
LABEL_34:
            uint64_t v51 = (__CFString *)v54;
            break;
          default:
            os_log_type_t v50 = v47;
            uint64_t v19 = v48;
            sub_2473D8260(v47, v48, 0);
            uint64_t v51 = @"Controls";
LABEL_31:
            id v52 = v51;
            break;
        }
        uint64_t v55 = sub_24740DCF0();
        uint64_t v57 = v56;
        id v58 = v43;
        if (v55 == sub_24740DCF0() && v57 == v59) {
          break;
        }
        char v61 = sub_24740E5A0();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v61) {
          goto LABEL_47;
        }
        sub_2473D82EC(v50, v19, loga);
        if (!--v45)
        {
          swift_release();

          swift_bridgeObjectRelease_n();
          goto LABEL_44;
        }
      }
      swift_bridgeObjectRelease_n();

LABEL_47:
      uint64_t v3 = v19;
      swift_bridgeObjectRelease_n();

      uint64_t v62 = v19;
      LOBYTE(v19) = loga;
      if (sub_247407DBC(v50, v62, loga))
      {
        swift_release();
        sub_2473D82EC(v50, v3, loga);
        goto LABEL_44;
      }
      uint64_t v89 = v50;
      id v63 = v37;
      id v64 = v91;
      uint64_t v13 = v63;
      id v5 = v64;
      uint64_t v65 = sub_24740D540();
      os_log_type_t v66 = sub_24740DEB0();
      if (os_log_type_enabled(v65, v66))
      {
        uint64_t v67 = swift_slowAlloc();
        uint64_t v92 = swift_slowAlloc();
        uint64_t v97 = v92;
        *(_DWORD *)uint64_t v67 = 136315394;
        uint64_t v93 = v3;
        id v68 = objc_msgSend(v13, sel_sectionIdentifier);
        uint64_t v69 = sub_24740DCF0();
        uint64_t v19 = (uint64_t)v5;
        unint64_t v71 = v70;

        sub_2474096F8(v69, v71, &v97);
        sub_24740E220();

        swift_bridgeObjectRelease();
        *(_WORD *)(v67 + 12) = 2080;
        id v72 = objc_msgSend((id)v19, sel_identifier);
        uint64_t v73 = sub_24740DCF0();
        uint64_t v74 = v13;
        unint64_t v76 = v75;

        id v5 = (id)v19;
        uint64_t v77 = v73;
        uint64_t v3 = v93;
        LOBYTE(v19) = loga;
        sub_2474096F8(v77, v76, &v97);
        sub_24740E220();

        uint64_t v13 = v74;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2473C9000, v65, v66, "Pre-configuring %s with %s", (uint8_t *)v67, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24C5554B0](v92, -1, -1);
        MEMORY[0x24C5554B0](v67, -1, -1);
      }
      else
      {
      }
      id v78 = objc_msgSend(v13, sel_parameters);
      sub_2473CF248(0, &qword_26B12BB70);
      unint64_t v18 = sub_24740DD70();

      if (!(v18 >> 62))
      {
        if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_54:
          if ((v18 & 0xC000000000000001) != 0)
          {
            id v79 = (id)MEMORY[0x24C554A50](0, v18);
          }
          else
          {
            if (!*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              JUMPOUT(0x2473F7C68);
            }
            id v79 = *(id *)(v18 + 32);
          }
          uint64_t v80 = v79;
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26924C808);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_247410870;
          *(void *)(inited + 32) = v80;
          *(void *)(inited + 40) = v5;
          uint64_t v82 = v13;
          id v83 = v5;
          id v84 = v80;
          unint64_t v85 = sub_2473F2334(inited);
          sub_2473F2C5C(v82, v85, 2, 0);
          swift_release();

          swift_bridgeObjectRelease();
          goto LABEL_61;
        }
LABEL_60:
        swift_release();
        swift_bridgeObjectRelease();
LABEL_61:
        sub_2473D82EC(v89, v3, v19);

        return;
      }
LABEL_59:
      swift_bridgeObjectRetain();
      uint64_t v86 = sub_24740E4A0();
      swift_bridgeObjectRelease();
      if (v86) {
        goto LABEL_54;
      }
      goto LABEL_60;
    }
    LODWORD(v89) = v12;
    os_log_t log = v11;
    uint64_t v13 = (_WORD *)swift_slowAlloc();
    uint64_t v88 = swift_slowAlloc();
    uint64_t v97 = v88;
    *(_DWORD *)uint64_t v13 = 136315394;
    id v14 = objc_msgSend(v10, sel_sectionIdentifier);
    uint64_t v15 = sub_24740DCF0();
    unint64_t v17 = v16;

    sub_2474096F8(v15, v17, &v97);
    sub_24740E220();

    swift_bridgeObjectRelease();
    uint64_t v90 = (uint8_t *)v13;
    void v13[6] = 2080;
    unint64_t v18 = sub_2473F1AC0((uint64_t)v5);
    uint64_t v19 = sub_2473F1948(v18);
    swift_bridgeObjectRelease();
    if ((unint64_t)v19 >> 62)
    {
      if (v19 < 0) {
        unint64_t v18 = v19;
      }
      else {
        unint64_t v18 = v19 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_24740E4A0();
      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v20)
      {
LABEL_7:
        id v87 = v10;
        uint64_t v96 = MEMORY[0x263F8EE78];
        sub_2473F95C4(0, v20 & ~(v20 >> 63), 0);
        if (v20 < 0)
        {
          __break(1u);
          goto LABEL_59;
        }
        uint64_t v21 = 0;
        uint64_t v22 = v96;
        do
        {
          if ((v19 & 0xC000000000000001) != 0) {
            id v23 = (id)MEMORY[0x24C554A50](v21, v19);
          }
          else {
            id v23 = *(id *)(v19 + 8 * v21 + 32);
          }
          id v24 = v23;
          id v25 = objc_msgSend(v23, sel_identifier);
          uint64_t v26 = sub_24740DCF0();
          uint64_t v28 = v27;

          unint64_t v30 = *(void *)(v96 + 16);
          unint64_t v29 = *(void *)(v96 + 24);
          if (v30 >= v29 >> 1) {
            sub_2473F95C4(v29 > 1, v30 + 1, 1);
          }
          ++v21;
          *(void *)(v96 + 16) = v30 + 1;
          uint64_t v31 = v96 + 16 * v30;
          *(void *)(v31 + 32) = v26;
          *(void *)(v31 + 40) = v28;
        }
        while (v20 != v21);
        swift_bridgeObjectRelease();
        id v10 = v87;
        goto LABEL_22;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v22 = MEMORY[0x263F8EE78];
LABEL_22:
    uint64_t v32 = MEMORY[0x24C554490](v22, MEMORY[0x263F8D310]);
    unint64_t v34 = v33;
    swift_bridgeObjectRelease();
    sub_2474096F8(v32, v34, &v97);
    sub_24740E220();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2473C9000, log, (os_log_type_t)v89, "Caching sections for %s: %s", v90, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v88, -1, -1);
    MEMORY[0x24C5554B0](v90, -1, -1);

    goto LABEL_23;
  }
}

uint64_t sub_2473F7C78(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24740D560();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B12B938);
    id v6 = a3;
    uint64_t v7 = sub_24740D540();
    os_log_type_t v8 = sub_24740DEB0();
    id v9 = &off_265212000;
    if (os_log_type_enabled(v7, v8))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      v17[0] = v11;
      *(_DWORD *)id v10 = 136315138;
      id v12 = objc_msgSend(v6, sel_sectionIdentifier);
      uint64_t v13 = sub_24740DCF0();
      unint64_t v15 = v14;

      id v9 = &off_265212000;
      sub_2474096F8(v13, v15, v17);
      sub_24740E220();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2473C9000, v7, v8, "Completing section request for %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v11, -1, -1);
      MEMORY[0x24C5554B0](v10, -1, -1);
    }
    else
    {
    }
    id v16 = [v6 (SEL)v9[149]];
    swift_beginAccess();
    sub_2473FA840((uint64_t)v16);
    swift_endAccess();
    swift_release();

    return swift_release();
  }
  return result;
}

uint64_t sub_2473F7ED4(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24740D560();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B12B938);
    id v5 = a2;
    id v6 = sub_24740D540();
    os_log_type_t v7 = sub_24740DEB0();
    os_log_type_t v8 = &off_265212000;
    if (os_log_type_enabled(v6, v7))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      v16[0] = v10;
      *(_DWORD *)id v9 = 136315138;
      id v11 = objc_msgSend(v5, sel_sectionIdentifier);
      uint64_t v12 = sub_24740DCF0();
      unint64_t v14 = v13;

      os_log_type_t v8 = &off_265212000;
      sub_2474096F8(v12, v14, v16);
      sub_24740E220();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2473C9000, v6, v7, "Cancelling section request for %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v10, -1, -1);
      MEMORY[0x24C5554B0](v9, -1, -1);
    }
    else
    {
    }
    id v15 = [v5 (SEL)v8[149]];
    swift_beginAccess();
    sub_2473FA840((uint64_t)v15);
    swift_endAccess();
    swift_release();

    return swift_release();
  }
  return result;
}

uint64_t sub_2473F8130(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8A8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(a1, sel_controlType);
  id v7 = objc_msgSend(v6, sel_unsignedIntegerValue);

  id v8 = sub_2473DA1C0();
  v11[1] = sub_2473D88E8(v8, (uint64_t)v7);
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C0E0);
  sub_2473D3668(&qword_26924C0E8, &qword_26924C0E0);
  sub_24740D750();
  swift_release();
  swift_release();
  sub_2473D3668(&qword_26924C8B0, &qword_26924C8A8);
  uint64_t v9 = sub_24740D730();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v9;
}

void sub_2473F8348(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = *(void *)(Strong + 24);
    if (*(unsigned char *)(v4 + 32))
    {
LABEL_3:
      swift_release();
      return;
    }
    id v6 = *(void **)(v4 + 16);
    uint64_t v5 = *(void *)(v4 + 24);
    if (!v6)
    {
      sub_2473FD504(0, *(void *)(v4 + 24), 0);
      goto LABEL_3;
    }
    sub_2473FD504(*(id *)(v4 + 16), *(void *)(v4 + 24), 0);
    sub_2473FD504(v6, v5, 0);
    id v7 = sub_2473DA9B4(v1, v2);
    sub_2473F3128(v7, 0);

    swift_release();
    sub_2473FD518(v6, v5, 0);
    sub_2473FD518(v6, v5, 0);
  }
}

void sub_2473F844C(void *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8B8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B12B928 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_26B12BD70;
  uint64_t v11 = (uint64_t)a1;
  if (a3 >= 2u)
  {
    if (a3 != 2)
    {
      uint64_t v19 = qword_26924BB10;
      id v20 = a1;
      if (v19 != -1) {
        swift_once();
      }
      if (qword_26924C730)
      {
        id v21 = (id)qword_26924C730;
        sub_24740623C(v21, a1, 0);

        uint64_t v45 = a1;
        uint64_t v46 = a2;
        unsigned __int8 v47 = 3;
        goto LABEL_52;
      }
      sub_2473F16F0();
      uint64_t v27 = (void *)swift_allocError();
      swift_willThrow();
      uint64_t v28 = a1;
      uint64_t v29 = a2;
      unsigned __int8 v30 = 3;
      goto LABEL_43;
    }
    id v15 = a1;
    id v16 = objc_msgSend(v15, sel_parameters);
    sub_2473CF248(0, &qword_26B12BB70);
    unint64_t v17 = sub_24740DD70();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_24740E4A0();

      swift_bridgeObjectRelease_n();
      if (!v48) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();

      if (!v18) {
        goto LABEL_31;
      }
    }
    if ((a2 & 0xC000000000000001) != 0) {
      uint64_t v11 = sub_24740E2A0();
    }
    else {
      uint64_t v11 = *(void *)(a2 + 16);
    }
  }
  if (v11)
  {
    if (!a3)
    {
      if (!a1) {
        return;
      }
      uint64_t v23 = qword_26924BB10;
      id v24 = a1;
      if (v23 != -1) {
        swift_once();
      }
      if (qword_26924C730)
      {
        id v25 = (id)qword_26924C730;
        sub_24740623C(v25, a1, 0);

        uint64_t v45 = a1;
        uint64_t v46 = a2;
        unsigned __int8 v47 = 0;
        goto LABEL_52;
      }
      sub_2473F16F0();
      uint64_t v27 = (void *)swift_allocError();
      swift_willThrow();
      uint64_t v28 = a1;
      uint64_t v29 = a2;
      unsigned __int8 v30 = 0;
LABEL_43:
      sub_2473D82EC(v28, v29, v30);
      if (qword_26B12B950 != -1) {
        swift_once();
      }
      uint64_t v36 = sub_24740D560();
      __swift_project_value_buffer(v36, (uint64_t)qword_26B12B938);
      id v37 = v27;
      id v38 = v27;
      os_log_type_t v50 = sub_24740D540();
      os_log_type_t v39 = sub_24740DE90();
      if (os_log_type_enabled(v50, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        uint64_t v41 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 138412290;
        id v42 = v27;
        uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v51 = v43;
        sub_24740E220();
        void *v41 = v43;

        _os_log_impl(&dword_2473C9000, v50, v39, "Failed to save action: %@", v40, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
        swift_arrayDestroy();
        MEMORY[0x24C5554B0](v41, -1, -1);
        MEMORY[0x24C5554B0](v40, -1, -1);

        return;
      }

      goto LABEL_49;
    }
    if (a3 == 1)
    {
      if (!a1) {
        return;
      }
      uint64_t v12 = qword_26924BB10;
      id v13 = a1;
      if (v12 != -1) {
        swift_once();
      }
      if (qword_26924C730)
      {
        id v14 = (id)qword_26924C730;
        sub_24740623C(v14, a1, 0);

        uint64_t v45 = a1;
        uint64_t v46 = a2;
        unsigned __int8 v47 = 1;
LABEL_52:
        sub_2473D82EC(v45, v46, v47);
        return;
      }
      sub_2473F16F0();
      uint64_t v27 = (void *)swift_allocError();
      swift_willThrow();
      uint64_t v28 = a1;
      uint64_t v29 = a2;
      unsigned __int8 v30 = 1;
      goto LABEL_43;
    }
    id v15 = a1;
LABEL_31:
    if (*(void *)(v3 + 56))
    {
      id v26 = v15;
      swift_bridgeObjectRetain();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD8);
      sub_24740DE40();
      swift_release();
    }
    else
    {
      id v31 = v15;
      swift_bridgeObjectRetain();
    }
    uint64_t v32 = sub_24740DE30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v9, 1, 1, v32);
    uint64_t v33 = swift_allocObject();
    swift_weakInit();
    unint64_t v34 = (void *)swift_allocObject();
    v34[2] = 0;
    v34[3] = 0;
    v34[4] = v10;
    v34[5] = v15;
    v34[6] = a2;
    v34[7] = v33;
    swift_retain();
    *(void *)(v3 + 56) = sub_2473F8E1C((uint64_t)v9, (uint64_t)&unk_26924C8C8, (uint64_t)v34);
    swift_release();
    return;
  }
  if (a3)
  {
    if (a3 != 1)
    {
      os_log_type_t v50 = objc_msgSend(a1, sel_sectionIdentifier);
      goto LABEL_39;
    }
    uint64_t v22 = @"Shortcuts";
  }
  else
  {
    uint64_t v22 = @"Controls";
  }
  os_log_type_t v50 = v22;
  uint64_t v35 = v22;
LABEL_39:
  sub_2473F0714(v50);
LABEL_49:
  uint64_t v44 = v50;
}

uint64_t sub_2473F8B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 40) = a7;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26924C740 + dword_26924C740);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v7 + 48) = v10;
  *uint64_t v10 = v7;
  v10[1] = sub_2473F8C54;
  return v12(a5, a6);
}

uint64_t sub_2473F8C54()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2473F8D84, 0, 0);
  }
}

uint64_t sub_2473F8D84()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(Strong + 56) = 0;
    swift_release();
    swift_release();
  }
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2473F8E1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24740DE30();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24740DE20();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2473D34E0(a1, &qword_26924C8B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24740DDD0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2473F8FA4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return v0;
}

uint64_t sub_2473F900C()
{
  sub_2473F8FA4();
  return MEMORY[0x270FA0228](v0, 97, 7);
}

uint64_t type metadata accessor for ActionStore()
{
  return self;
}

uint64_t getEnumTagSinglePayload for ConfigurationViewModel.ConfigurationMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ActionStore.ConfigurationMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2473F91C0);
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

unsigned char *sub_2473F91E8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ActionStore.ConfigurationMode()
{
  return &type metadata for ActionStore.ConfigurationMode;
}

unint64_t sub_2473F9208()
{
  unint64_t result = qword_26924C800;
  if (!qword_26924C800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924C800);
  }
  return result;
}

void *sub_2473F925C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8D8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2473FD40C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2473F9380(unint64_t a1)
{
  return sub_2473F93B0(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_2473FC95C);
}

uint64_t sub_2473F9398(unint64_t a1)
{
  return sub_2473F93B0(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_2473FCB90);
}

uint64_t sub_2473F93B0(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24740E4A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24740E4A0();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v6 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *int v2 = v6;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v7 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8) {
      uint64_t v11 = v8;
    }
    swift_bridgeObjectRetain();
    unint64_t v6 = MEMORY[0x24C554A60](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *int v2 = v6;
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_24740E4A0();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  swift_bridgeObjectRelease();
  return sub_24740DD90();
}

uint64_t sub_2473F9584(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2473F9604(a1, a2, a3, (void *)*v3);
  *int v3 = result;
  return result;
}

uint64_t sub_2473F95A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2473F97A8(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_2473F95C4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2473F9924(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_2473F95E4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2473F9A90(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_2473F9604(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C908);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C910);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

uint64_t sub_2473F97A8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8D8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

uint64_t sub_2473F9924(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C898);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
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
  unint64_t v13 = v10 + 32;
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
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

uint64_t sub_2473F9A90(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8E0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[48 * v8] || v12 >= &v13[48 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

uint64_t sub_2473F9C18(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8E8);
  char v38 = a2;
  uint64_t v6 = sub_24740E4C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
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
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11) {
      break;
    }
    id v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v23);
    ++v14;
    if (!v25)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v14);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          int v3 = v36;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v14 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v37 + 8 * v14);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    id v31 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v22);
    uint64_t v33 = *v31;
    uint64_t v32 = v31[1];
    unint64_t v34 = (long long *)(*(void *)(v5 + 56) + 32 * v22);
    long long v39 = *v34;
    long long v40 = v34[1];
    if ((v38 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_24740E630();
    sub_24740DD10();
    uint64_t result = sub_24740E650();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v17 == v28;
        if (v17 == v28) {
          unint64_t v17 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      unint64_t v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *uint64_t v19 = v33;
    v19[1] = v32;
    id v20 = (_OWORD *)(*(void *)(v7 + 56) + 32 * v18);
    _OWORD *v20 = v39;
    v20[1] = v40;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int v3 = v36;
  id v24 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v24 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

uint64_t sub_2473F9F30(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBA8);
  uint64_t v6 = sub_24740E4C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          int v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    id v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_24740E030();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int v3 = v35;
  int64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

uint64_t sub_2473FA208(uint64_t a1, char a2)
{
  return sub_2473FA214(a1, a2, &qword_26924C8D0);
}

uint64_t sub_2473FA214(uint64_t a1, char a2, uint64_t *a3)
{
  unsigned int v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_24740E4C0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    int64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          unsigned int v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    id v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_24740E630();
    sub_24740DD10();
    uint64_t result = sub_24740E650();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unsigned int v4 = v36;
  int64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unsigned int v4 = v8;
  return result;
}

uint64_t sub_2473FA520(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C890);
  char v37 = a2;
  uint64_t v6 = sub_24740E4C0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    id v34 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35) {
          goto LABEL_33;
        }
        unint64_t v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v23 = v36[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              int v3 = v34;
              if (v37)
              {
                uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v36 = -1 << v33;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v23 = v36[v13];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v24;
          }
        }
LABEL_30:
        unint64_t v10 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = 8 * v21;
      uint64_t v30 = *(void **)(*(void *)(v5 + 48) + v29);
      uint64_t v31 = *(void *)(*(void *)(v5 + 56) + v29);
      if ((v37 & 1) == 0)
      {
        id v32 = v30;
        swift_retain();
      }
      sub_24740DCF0();
      sub_24740E630();
      sub_24740DD10();
      uint64_t v14 = sub_24740E650();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v16 = v14 & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v27 = v17 == v26;
          if (v17 == v26) {
            unint64_t v17 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v17);
        }
        while (v28 == -1);
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v7 + 48) + v19) = v30;
      *(void *)(*(void *)(v7 + 56) + v19) = v31;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

uint64_t sub_2473FA840(uint64_t a1)
{
  int v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_24740922C(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v10 = *v2;
  *int v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2473FB600();
    uint64_t v7 = v10;
  }

  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_2473FA908(v4, v7);
  *int v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_2473FA908(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24740E270();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        sub_24740DCF0();
        sub_24740E630();
        id v10 = v9;
        sub_24740DD10();
        uint64_t v11 = sub_24740E650();

        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            void *v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = (void *)(v16 + 8 * v3);
          unint64_t v18 = (void *)(v16 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= v18 + 1))
          {
            void *v17 = *v18;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
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

uint64_t sub_2473FAAFC(uint64_t a1, uint64_t a2, char a3, double a4, double a5, double a6, double a7)
{
  unint64_t v8 = v7;
  uint64_t v16 = *v7;
  unint64_t v18 = sub_247409310(a1, a2);
  uint64_t v19 = *(void *)(v16 + 16);
  BOOL v20 = (v17 & 1) == 0;
  uint64_t result = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v22 = v17;
  uint64_t v23 = *(void *)(v16 + 24);
  if (v23 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v23 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2473FB0E4();
LABEL_7:
    uint64_t v24 = (void *)*v8;
    if (v22)
    {
LABEL_8:
      char v25 = (double *)(v24[7] + 32 * v18);
      double *v25 = a4;
      v25[1] = a5;
      v25[2] = a6;
      v25[3] = a7;
      return result;
    }
    goto LABEL_11;
  }
  sub_2473F9C18(result, a3 & 1);
  uint64_t result = sub_247409310(a1, a2);
  if ((v22 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = sub_24740E5E0();
    __break(1u);
    return result;
  }
  unint64_t v18 = result;
  uint64_t v24 = (void *)*v8;
  if (v22) {
    goto LABEL_8;
  }
LABEL_11:
  v24[(v18 >> 6) + 8] |= 1 << v18;
  BOOL v27 = (uint64_t *)(v24[6] + 16 * v18);
  *BOOL v27 = a1;
  v27[1] = a2;
  uint64_t v28 = (double *)(v24[7] + 32 * v18);
  double *v28 = a4;
  v28[1] = a5;
  v28[2] = a6;
  v28[3] = a7;
  uint64_t v29 = v24[2];
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v24[2] = v31;
  return swift_bridgeObjectRetain();
}

void sub_2473FAC8C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_247409310(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2473FB454(&qword_26924C900);
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2473FA214(v15, a4 & 1, &qword_26924C900);
  unint64_t v20 = sub_247409310(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_24740E5E0();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  *char v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v25;
  swift_bridgeObjectRetain();
}

id sub_2473FAE0C(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_2474092C0((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_2473FB29C();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_bridgeObjectRelease();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2473F9F30(v12, a3 & 1);
  unint64_t v18 = sub_2474092C0((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_2473CF248(0, (unint64_t *)&unk_26B12BB48);
    id result = (id)sub_24740E5E0();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v15[2] = v23;
  return a2;
}

id sub_2473FAF80(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_24740922C((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_2473FB600();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_release();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2473FA520(v12, a3 & 1);
  unint64_t v18 = sub_24740922C((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    type metadata accessor for WFStaccatoActionSectionIdentifier(0);
    id result = (id)sub_24740E5E0();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v15[2] = v23;
  return a2;
}

void *sub_2473FB0E4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24740E4B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = (long long *)(*(void *)(v2 + 56) + v20);
    BOOL v22 = (void *)(*(void *)(v4 + 48) + v16);
    long long v23 = *v21;
    long long v24 = v21[1];
    *BOOL v22 = v19;
    v22[1] = v18;
    uint64_t v25 = (_OWORD *)(*(void *)(v4 + 56) + v20);
    _OWORD *v25 = v23;
    v25[1] = v24;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2473FB29C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24740E4B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = (void *)swift_bridgeObjectRetain();
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

id sub_2473FB448()
{
  return sub_2473FB454(&qword_26924C8D0);
}

id sub_2473FB454(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_24740E4B0();
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
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    unint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *int64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2473FB600()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C890);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24740E4B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = (void *)swift_retain();
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

void *sub_2473FB7AC(void *a1)
{
  return sub_2473F925C(0, a1[2], 0, a1);
}

void sub_2473FB7C0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2473FCFF8(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v4[0] = v2 + 32;
  v4[1] = v3;
  sub_2473FB82C(v4);
  *a1 = v2;
}

void sub_2473FB82C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_24740E590();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_131;
    }
    if (v3) {
      sub_2473FC058(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_139;
  }
  uint64_t v112 = v4;
  uint64_t v110 = a1;
  if (v3 < 2)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v120 = (void **)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v10 = *(void *)(MEMORY[0x263F8EE78] + 16);
      int64_t v9 = (char *)MEMORY[0x263F8EE78];
LABEL_98:
      uint64_t v115 = v7;
      if (v10 >= 2)
      {
        uint64_t v102 = *v110;
        do
        {
          unint64_t v103 = v10 - 2;
          if (v10 < 2) {
            goto LABEL_126;
          }
          if (!v102) {
            goto LABEL_138;
          }
          uint64_t v104 = v9;
          uint64_t v105 = v9 + 32;
          uint64_t v106 = *(void *)&v9[16 * v103 + 32];
          uint64_t v107 = *(void *)&v9[16 * v10 + 24];
          sub_2473FC1B4((void **)(v102 + 24 * v106), (void **)(v102 + 24 * *(void *)&v105[16 * v10 - 16]), v102 + 24 * v107, v120);
          if (v1) {
            break;
          }
          if (v107 < v106) {
            goto LABEL_127;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v104 = sub_2473FC72C((uint64_t)v104);
          }
          if (v103 >= *((void *)v104 + 2)) {
            goto LABEL_128;
          }
          uint64_t v108 = &v104[16 * v103 + 32];
          *(void *)uint64_t v108 = v106;
          *((void *)v108 + 1) = v107;
          unint64_t v109 = *((void *)v104 + 2);
          if (v10 > v109) {
            goto LABEL_129;
          }
          int64_t v9 = v104;
          memmove(&v104[16 * v10 + 16], &v104[16 * v10 + 32], 16 * (v109 - v10));
          *((void *)v104 + 2) = v109 - 1;
          unint64_t v10 = v109 - 1;
        }
        while (v109 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(void *)(v115 + 16) = 0;
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_24740DDB0();
    *(void *)(v7 + 16) = v6;
    uint64_t v120 = (void **)(v7 + 32);
  }
  uint64_t v115 = v7;
  uint64_t v8 = 0;
  uint64_t v123 = *a1;
  uint64_t v111 = *a1 + 64;
  int64_t v9 = (char *)MEMORY[0x263F8EE78];
  uint64_t v118 = v3;
  while (1)
  {
    uint64_t v11 = v8 + 1;
    uint64_t v117 = v8;
    if (v8 + 1 >= v3)
    {
      uint64_t v12 = v123;
    }
    else
    {
      unint64_t v113 = v9;
      uint64_t v12 = v123;
      uint64_t v13 = v123 + 24 * v11;
      id v15 = *(id *)v13;
      uint64_t v14 = *(void *)(v13 + 8);
      uint64_t v16 = v123 + 24 * v8;
      uint64_t v17 = *(void **)v16;
      uint64_t v18 = *(void *)(v16 + 8);
      unsigned __int8 v19 = *(unsigned char *)(v13 + 16);
      unsigned __int8 v20 = *(unsigned char *)(v16 + 16);
      sub_2473D8260(*(id *)v13, v14, v19);
      sub_2473D8260(v17, v18, v20);
      BOOL v124 = sub_24740A00C(v15, v14, v19, v17, v18, v20);
      sub_2473D82EC(v17, v18, v20);
      uint64_t v21 = v14;
      uint64_t v3 = v118;
      sub_2473D82EC(v15, v21, v19);
      uint64_t v11 = v8 + 2;
      if (v8 + 2 < v118)
      {
        int64_t v22 = (unsigned __int8 *)(v111 + 24 * v8);
        while (1)
        {
          uint64_t v23 = v11;
          unint64_t v24 = (void *)*((void *)v22 - 2);
          uint64_t v25 = *((void *)v22 - 1);
          int64_t v26 = (void *)*((void *)v22 - 5);
          uint64_t v27 = *((void *)v22 - 4);
          unsigned __int8 v28 = *v22;
          unsigned __int8 v29 = *(v22 - 24);
          sub_2473D8260(v24, v25, *v22);
          sub_2473D8260(v26, v27, v29);
          BOOL v30 = sub_24740A00C(v24, v25, v28, v26, v27, v29);
          sub_2473D82EC(v26, v27, v29);
          sub_2473D82EC(v24, v25, v28);
          if ((v124 ^ v30)) {
            break;
          }
          v22 += 24;
          uint64_t v11 = v23 + 1;
          uint64_t v3 = v118;
          if (v118 == v23 + 1)
          {
            uint64_t v11 = v118;
            uint64_t v12 = v123;
            goto LABEL_23;
          }
        }
        uint64_t v3 = v118;
        uint64_t v12 = v123;
        uint64_t v11 = v23;
LABEL_23:
        uint64_t v8 = v117;
      }
      int64_t v9 = v113;
      if (v124)
      {
        if (v11 < v8) {
          goto LABEL_132;
        }
        if (v8 < v11)
        {
          uint64_t v31 = 24 * v11;
          uint64_t v32 = 24 * v8;
          uint64_t v33 = v11;
          uint64_t v34 = v8;
          do
          {
            if (v34 != --v33)
            {
              if (!v12) {
                goto LABEL_137;
              }
              uint64_t v35 = v12 + v32;
              uint64_t v36 = v12 + v31;
              char v37 = *(unsigned char *)(v12 + v32 + 16);
              long long v38 = *(_OWORD *)(v12 + v32);
              uint64_t v39 = *(void *)(v12 + v31 - 8);
              *(_OWORD *)uint64_t v35 = *(_OWORD *)(v12 + v31 - 24);
              *(void *)(v35 + 16) = v39;
              *(_OWORD *)(v36 - 24) = v38;
              *(unsigned char *)(v36 - 8) = v37;
            }
            ++v34;
            v31 -= 24;
            v32 += 24;
          }
          while (v34 < v33);
        }
      }
    }
    if (v11 < v3)
    {
      if (__OFSUB__(v11, v8)) {
        goto LABEL_130;
      }
      if (v11 - v8 < v112) {
        break;
      }
    }
LABEL_49:
    if (v11 < v8) {
      goto LABEL_125;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v9 = sub_2473FC564(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v53 = *((void *)v9 + 2);
    unint64_t v52 = *((void *)v9 + 3);
    unint64_t v10 = v53 + 1;
    if (v53 >= v52 >> 1) {
      int64_t v9 = sub_2473FC564((char *)(v52 > 1), v53 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v10;
    id v54 = v9 + 32;
    uint64_t v55 = &v9[16 * v53 + 32];
    *(void *)uint64_t v55 = v8;
    *((void *)v55 + 1) = v11;
    uint64_t v122 = v11;
    if (v53)
    {
      while (1)
      {
        unint64_t v56 = v10 - 1;
        if (v10 >= 4)
        {
          char v61 = &v54[16 * v10];
          uint64_t v62 = *((void *)v61 - 8);
          uint64_t v63 = *((void *)v61 - 7);
          BOOL v67 = __OFSUB__(v63, v62);
          uint64_t v64 = v63 - v62;
          if (v67) {
            goto LABEL_114;
          }
          uint64_t v66 = *((void *)v61 - 6);
          uint64_t v65 = *((void *)v61 - 5);
          BOOL v67 = __OFSUB__(v65, v66);
          uint64_t v59 = v65 - v66;
          char v60 = v67;
          if (v67) {
            goto LABEL_115;
          }
          unint64_t v68 = v10 - 2;
          uint64_t v69 = &v54[16 * v10 - 32];
          uint64_t v71 = *(void *)v69;
          uint64_t v70 = *((void *)v69 + 1);
          BOOL v67 = __OFSUB__(v70, v71);
          uint64_t v72 = v70 - v71;
          if (v67) {
            goto LABEL_117;
          }
          BOOL v67 = __OFADD__(v59, v72);
          uint64_t v73 = v59 + v72;
          if (v67) {
            goto LABEL_120;
          }
          if (v73 >= v64)
          {
            uint64_t v91 = &v54[16 * v56];
            uint64_t v93 = *(void *)v91;
            uint64_t v92 = *((void *)v91 + 1);
            BOOL v67 = __OFSUB__(v92, v93);
            uint64_t v94 = v92 - v93;
            if (v67) {
              goto LABEL_124;
            }
            BOOL v84 = v59 < v94;
            goto LABEL_86;
          }
        }
        else
        {
          if (v10 != 3)
          {
            uint64_t v85 = *((void *)v9 + 4);
            uint64_t v86 = *((void *)v9 + 5);
            BOOL v67 = __OFSUB__(v86, v85);
            uint64_t v78 = v86 - v85;
            char v79 = v67;
            goto LABEL_80;
          }
          uint64_t v58 = *((void *)v9 + 4);
          uint64_t v57 = *((void *)v9 + 5);
          BOOL v67 = __OFSUB__(v57, v58);
          uint64_t v59 = v57 - v58;
          char v60 = v67;
        }
        if (v60) {
          goto LABEL_116;
        }
        unint64_t v68 = v10 - 2;
        uint64_t v74 = &v54[16 * v10 - 32];
        uint64_t v76 = *(void *)v74;
        uint64_t v75 = *((void *)v74 + 1);
        BOOL v77 = __OFSUB__(v75, v76);
        uint64_t v78 = v75 - v76;
        char v79 = v77;
        if (v77) {
          goto LABEL_119;
        }
        uint64_t v80 = &v54[16 * v56];
        uint64_t v82 = *(void *)v80;
        uint64_t v81 = *((void *)v80 + 1);
        BOOL v67 = __OFSUB__(v81, v82);
        uint64_t v83 = v81 - v82;
        if (v67) {
          goto LABEL_122;
        }
        if (__OFADD__(v78, v83)) {
          goto LABEL_123;
        }
        if (v78 + v83 >= v59)
        {
          BOOL v84 = v59 < v83;
LABEL_86:
          if (v84) {
            unint64_t v56 = v68;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v79) {
          goto LABEL_118;
        }
        id v87 = &v54[16 * v56];
        uint64_t v89 = *(void *)v87;
        uint64_t v88 = *((void *)v87 + 1);
        BOOL v67 = __OFSUB__(v88, v89);
        uint64_t v90 = v88 - v89;
        if (v67) {
          goto LABEL_121;
        }
        if (v90 < v78) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v95 = v56 - 1;
        if (v56 - 1 >= v10)
        {
          __break(1u);
LABEL_111:
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
          goto LABEL_134;
        }
        if (!v123) {
          goto LABEL_136;
        }
        uint64_t v96 = v9;
        uint64_t v97 = &v54[16 * v95];
        uint64_t v98 = *(void *)v97;
        uint64_t v99 = &v54[16 * v56];
        uint64_t v100 = *((void *)v99 + 1);
        sub_2473FC1B4((void **)(v123 + 24 * *(void *)v97), (void **)(v123 + 24 * *(void *)v99), v123 + 24 * v100, v120);
        if (v1) {
          goto LABEL_109;
        }
        if (v100 < v98) {
          goto LABEL_111;
        }
        if (v56 > *((void *)v96 + 2)) {
          goto LABEL_112;
        }
        *(void *)uint64_t v97 = v98;
        *(void *)&v54[16 * v95 + 8] = v100;
        unint64_t v101 = *((void *)v96 + 2);
        if (v56 >= v101) {
          goto LABEL_113;
        }
        int64_t v9 = v96;
        unint64_t v10 = v101 - 1;
        memmove(&v54[16 * v56], v99 + 16, 16 * (v101 - 1 - v56));
        *((void *)v96 + 2) = v101 - 1;
        if (v101 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v10 = 1;
LABEL_14:
    uint64_t v3 = v118;
    uint64_t v8 = v122;
    uint64_t v7 = v115;
    if (v122 >= v118) {
      goto LABEL_98;
    }
  }
  uint64_t v40 = v8 + v112;
  if (__OFADD__(v8, v112)) {
    goto LABEL_133;
  }
  if (v40 >= v3) {
    uint64_t v40 = v3;
  }
  if (v40 >= v8)
  {
    if (v11 != v40)
    {
      unint64_t v114 = v9;
      uint64_t v41 = v12 + 24 * v11;
      uint64_t v116 = v40;
      do
      {
        uint64_t v119 = v41;
        uint64_t v43 = v41;
        uint64_t v121 = v11;
        while (1)
        {
          id v44 = *(id *)v41;
          uint64_t v45 = *(void *)(v41 + 8);
          uint64_t v46 = *(void **)(v43 - 24);
          v43 -= 24;
          uint64_t v47 = *(void *)(v41 - 16);
          unsigned __int8 v48 = *(unsigned char *)(v41 + 16);
          unsigned __int8 v49 = *(unsigned char *)(v41 - 8);
          sub_2473D8260(*(id *)v41, v45, v48);
          sub_2473D8260(v46, v47, v49);
          BOOL v125 = sub_24740A00C(v44, v45, v48, v46, v47, v49);
          sub_2473D82EC(v46, v47, v49);
          sub_2473D82EC(v44, v45, v48);
          if (!v125) {
            break;
          }
          uint64_t v42 = v121;
          if (!v123) {
            goto LABEL_135;
          }
          char v50 = *(unsigned char *)(v41 + 16);
          long long v51 = *(_OWORD *)v41;
          *(_OWORD *)uint64_t v41 = *(_OWORD *)v43;
          *(void *)(v41 + 16) = *(void *)(v43 + 16);
          *(_OWORD *)(v41 - 24) = v51;
          *(unsigned char *)(v41 - 8) = v50;
          ++v8;
          uint64_t v41 = v43;
          if (v121 == v8) {
            goto LABEL_42;
          }
        }
        uint64_t v42 = v121;
LABEL_42:
        uint64_t v11 = v42 + 1;
        uint64_t v41 = v119 + 24;
        uint64_t v8 = v117;
      }
      while (v11 != v116);
      uint64_t v11 = v116;
      int64_t v9 = v114;
    }
    goto LABEL_49;
  }
LABEL_134:
  __break(1u);
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  sub_24740E470();
  __break(1u);
}

void sub_2473FC058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v19 = a3;
  if (a3 != a2)
  {
    uint64_t v18 = *a4;
    uint64_t v4 = *a4 + 24 * a3;
LABEL_5:
    uint64_t v5 = a1;
    uint64_t v17 = v4;
    uint64_t v6 = v4;
    while (1)
    {
      id v7 = *(id *)v4;
      uint64_t v8 = *(void *)(v4 + 8);
      int64_t v9 = *(void **)(v6 - 24);
      v6 -= 24;
      uint64_t v10 = *(void *)(v4 - 16);
      unsigned __int8 v11 = *(unsigned char *)(v4 + 16);
      unsigned __int8 v12 = *(unsigned char *)(v4 - 8);
      sub_2473D8260(*(id *)v4, v8, v11);
      sub_2473D8260(v9, v10, v12);
      BOOL v20 = sub_24740A00C(v7, v8, v11, v9, v10, v12);
      sub_2473D82EC(v9, v10, v12);
      sub_2473D82EC(v7, v8, v11);
      if (!v20)
      {
LABEL_4:
        uint64_t v4 = v17 + 24;
        if (++v19 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v18) {
        break;
      }
      char v13 = *(unsigned char *)(v4 + 16);
      long long v14 = *(_OWORD *)v4;
      *(_OWORD *)uint64_t v4 = *(_OWORD *)v6;
      *(void *)(v4 + 16) = *(void *)(v6 + 16);
      *(_OWORD *)(v4 - 24) = v14;
      *(unsigned char *)(v4 - 8) = v13;
      ++v5;
      uint64_t v4 = v6;
      if (v19 == v5) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_2473FC1B4(void **__src, void **a2, unint64_t a3, void **__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = ((char *)a2 - (char *)__src) / 24;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = (uint64_t)(a3 - (void)a2) / 24;
  uint64_t v46 = __src;
  uint64_t v45 = __dst;
  if (v8 >= v10)
  {
    if (v9 >= -23)
    {
      uint64_t v22 = 3 * v10;
      if (__dst != a2 || &a2[v22] <= __dst) {
        memmove(__dst, a2, 24 * v10);
      }
      uint64_t v35 = v4;
      uint64_t v36 = v6;
      uint64_t v23 = (char *)&v4[v22];
      id v44 = &v4[v22];
      uint64_t v46 = v5;
      if (v6 < v5 && v9 >= 24)
      {
        unint64_t v24 = a3 - 24;
        uint64_t v25 = v5;
        do
        {
          uint64_t v43 = v5;
          uint64_t v39 = v23;
          uint64_t v41 = (void **)(v24 + 24);
          int64_t v26 = (void *)*((void *)v23 - 3);
          uint64_t v27 = *((void *)v23 - 2);
          v23 -= 24;
          unsigned __int8 v28 = *(v25 - 3);
          uint64_t v29 = (uint64_t)*(v25 - 2);
          v25 -= 3;
          unsigned __int8 v30 = v23[16];
          unsigned __int8 v31 = *((unsigned char *)v25 + 16);
          sub_2473D8260(v26, v27, v30);
          sub_2473D8260(v28, v29, v31);
          BOOL v37 = sub_24740A00C(v26, v27, v30, v28, v29, v31);
          sub_2473D82EC(v28, v29, v31);
          sub_2473D82EC(v26, v27, v30);
          if (v37)
          {
            uint64_t v23 = v39;
            if (v41 != v43 || v24 >= (unint64_t)v43)
            {
              long long v32 = *(_OWORD *)v25;
              *(void *)(v24 + 16) = v25[2];
              *(_OWORD *)unint64_t v24 = v32;
            }
            uint64_t v46 = v25;
          }
          else
          {
            id v44 = (void **)v23;
            uint64_t v25 = v43;
            if (v41 < (void **)v39 || v24 >= (unint64_t)v39 || v41 != (void **)v39)
            {
              long long v33 = *(_OWORD *)v23;
              *(void *)(v24 + 16) = *((void *)v23 + 2);
              *(_OWORD *)unint64_t v24 = v33;
            }
          }
          if (v25 <= v36) {
            break;
          }
          v24 -= 24;
          uint64_t v5 = v25;
        }
        while (v23 > (char *)v35);
      }
      goto LABEL_37;
    }
  }
  else if (v7 >= -23)
  {
    size_t v11 = 3 * v8;
    if (__dst != __src || &__src[v11] <= __dst) {
      memmove(__dst, __src, v11 * 8);
    }
    long long v38 = &v4[v11];
    id v44 = &v4[v11];
    if ((unint64_t)v5 < a3 && v7 >= 24)
    {
      do
      {
        uint64_t v42 = v5;
        unsigned __int8 v12 = *v5;
        uint64_t v13 = (uint64_t)v5[1];
        long long v14 = *v4;
        uint64_t v15 = (uint64_t)v4[1];
        unsigned __int8 v16 = *((unsigned char *)v5 + 16);
        unsigned __int8 v17 = *((unsigned char *)v4 + 16);
        sub_2473D8260(v12, v13, v16);
        sub_2473D8260(v14, v15, v17);
        BOOL v18 = sub_24740A00C(v12, v13, v16, v14, v15, v17);
        sub_2473D82EC(v14, v15, v17);
        sub_2473D82EC(v12, v13, v16);
        if (v18)
        {
          uint64_t v19 = v42 + 3;
          if (v6 < v42 || v6 >= v19 || v6 != v42)
          {
            long long v20 = *(_OWORD *)v42;
            id v6[2] = v42[2];
            *(_OWORD *)uint64_t v6 = v20;
          }
        }
        else
        {
          if (v6 != v4)
          {
            long long v21 = *(_OWORD *)v4;
            id v6[2] = v4[2];
            *(_OWORD *)uint64_t v6 = v21;
          }
          v4 += 3;
          uint64_t v45 = v4;
          uint64_t v19 = v42;
        }
        v6 += 3;
        if (v4 >= v38) {
          break;
        }
        uint64_t v5 = v19;
      }
      while ((unint64_t)v19 < a3);
      uint64_t v46 = v6;
    }
LABEL_37:
    sub_2473FC660((void **)&v46, (const void **)&v45, &v44);
    return 1;
  }
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

char *sub_2473FC564(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924CA00);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
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
  long long v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2473FC660(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -24)
  {
    uint64_t result = (char *)sub_24740E4E0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    size_t v6 = 24 * (v4 / 24);
    if (result != v3 || result >= &v3[v6])
    {
      return (char *)memmove(result, v3, v6);
    }
  }
  return result;
}

char *sub_2473FC72C(uint64_t a1)
{
  return sub_2473FC564(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t (*sub_2473FC740(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  size_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2473FC85C(v6, a2, a3);
  return sub_2473FC7A8;
}

uint64_t (*sub_2473FC7AC(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  size_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2473FC8DC(v6, a2, a3);
  return sub_2473FC7A8;
}

void sub_2473FC814(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2473FC85C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x24C554A50](a2, a3);
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
    *(void *)uint64_t v3 = v4;
    return destroy for Control;
  }
  __break(1u);
  return result;
}

void (*sub_2473FC8DC(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x24C554A50](a2, a3);
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
    *(void *)uint64_t v3 = v4;
    return j__s27ActionButtonConfigurationUI7ControlVwxx;
  }
  __break(1u);
  return result;
}

uint64_t sub_2473FC95C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24740E4A0();
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
    uint64_t v10 = sub_24740E4A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2473D3668(&qword_26B12BB08, &qword_26B12BB00);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB00);
          uint64_t v12 = sub_2473FC740(v16, i, a3);
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
    sub_2473CF248(0, (unint64_t *)&unk_26B12BB48);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

uint64_t sub_2473FCB90(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24740E4A0();
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
    uint64_t v10 = sub_24740E4A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2473D3668(&qword_26B12BB20, &qword_26B12BB18);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB18);
          uint64_t v12 = sub_2473FC7AC(v16, i, a3);
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
    sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

uint64_t sub_2473FCDC4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24740E4A0();
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
    uint64_t v10 = sub_24740E4A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2473D3668(&qword_26924C8A0, &qword_26924BD78);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26924BD78);
          uint64_t v12 = sub_2473FC7AC(v16, i, a3);
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
    sub_2473CF248(0, &qword_26B12BB80);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

uint64_t sub_2473FCFF8(uint64_t a1)
{
  return sub_2473F97A8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2473FD00C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  char v6 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C918);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C920);
  swift_allocObject();
  *(void *)(v7 + 24) = sub_24740D6B0();
  *(void *)(v2 + 16) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C928);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(unsigned char *)(v8 + 32) = -1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C930);
  swift_allocObject();
  *(void *)(v8 + 40) = sub_24740D6B0();
  *(void *)(v2 + 24) = v8;
  uint64_t v9 = MEMORY[0x263F8EE78];
  unint64_t v10 = sub_2473F1FE0(MEMORY[0x263F8EE78], &qword_26B12BBA8, (uint64_t (*)(id))sub_2474092C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C938);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C940);
  swift_allocObject();
  swift_bridgeObjectRetain();
  *(void *)(v11 + 24) = sub_24740D6B0();
  *(void *)(v3 + 32) = v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924C020);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFE8);
  swift_allocObject();
  *(void *)(v12 + 24) = sub_24740D6B0();
  uint64_t v13 = MEMORY[0x263F8EE88];
  *(void *)(v3 + 40) = v12;
  *(void *)(v3 + 48) = v13;
  *(void *)(v3 + 56) = 0;
  id v14 = 0;
  *(void *)(v3 + 64) = sub_2473F1C64(v9);
  *(void *)(v3 + 72) = 0;
  *(void *)(v3 + 80) = a1;
  if ((a2 & 1) == 0)
  {
    id v14 = @"SilentMode";
    uint64_t v15 = @"SilentMode";
  }
  *(void *)(v3 + 88) = v14;
  *(unsigned char *)(v3 + 96) = v6;
  swift_retain();
  sub_2473F2458();
  return v3;
}

uint64_t sub_2473FD22C(uint64_t a1)
{
  uint64_t v18 = *(void *)(a1 + 16);
  if (!v18) {
    return 0;
  }
  uint64_t v1 = 0;
  uint64_t v2 = (unsigned __int8 *)(a1 + 48);
  while (1)
  {
    uint64_t v3 = (void *)*((void *)v2 - 2);
    uint64_t v4 = *((void *)v2 - 1);
    int v6 = *v2;
    v2 += 24;
    unsigned __int8 v5 = v6;
    switch(v6)
    {
      case 1:
        sub_2473D8260(v3, v4, 1u);
        uint64_t v7 = @"Shortcuts";
        goto LABEL_6;
      case 2:
        id v9 = v3;
        swift_bridgeObjectRetain();
        id v10 = objc_msgSend(v9, sel_sectionIdentifier);
        goto LABEL_9;
      case 3:
        id v10 = objc_msgSend(v3, sel_sectionIdentifier);
LABEL_9:
        uint64_t v7 = (__CFString *)v10;
        break;
      default:
        sub_2473D8260(v3, v4, 0);
        uint64_t v7 = @"Controls";
LABEL_6:
        uint64_t v8 = v7;
        break;
    }
    uint64_t v11 = sub_24740DCF0();
    uint64_t v13 = v12;
    if (v11 == sub_24740DCF0() && v13 == v14) {
      break;
    }
    char v16 = sub_24740E5A0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2473D82EC(v3, v4, v5);
    if (v16) {
      return v1;
    }
    if (v18 == ++v1) {
      return 0;
    }
  }

  swift_bridgeObjectRelease_n();
  sub_2473D82EC(v3, v4, v5);
  return v1;
}

uint64_t sub_2473FD40C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

id sub_2473FD504(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    return sub_2473D8260(result, a2, a3);
  }
  return result;
}

void sub_2473FD518(id a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    sub_2473D82EC(a1, a2, a3);
  }
}

uint64_t sub_2473FD52C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2473FD568(uint64_t *a1@<X8>)
{
  sub_2473F6160(*(void **)(v1 + 24), a1);
}

void sub_2473FD574(id *a1)
{
  sub_2473F7214(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2473FD580(uint64_t a1)
{
  return sub_2473F7C78(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2473FD58C()
{
  return sub_2473F7ED4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_2473FD594(uint64_t *a1)
{
}

uint64_t sub_2473FD59C()
{
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2473FD5F4()
{
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *unint64_t v5 = v1;
  v5[1] = sub_2473FD6F8;
  v5[5] = v4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26924C740 + dword_26924C740);
  unint64_t v6 = (void *)swift_task_alloc();
  v5[6] = v6;
  *unint64_t v6 = v5;
  v6[1] = sub_2473F8C54;
  return v8(v2, v3);
}

uint64_t sub_2473FD6F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2473FD7EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C8F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2473FD854(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2473FD864()
{
  unint64_t result = qword_26B12BB30;
  if (!qword_26B12BB30)
  {
    sub_2473CF248(255, (unint64_t *)&qword_26B12BB40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B12BB30);
  }
  return result;
}

uint64_t sub_2473FD8CC@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2473F3978(a1, v2, a2);
}

uint64_t sub_2473FD8D4(uint64_t a1, __CFString **a2, int a3)
{
  return sub_2473F43E4(a1, a2, a3);
}

uint64_t sub_2473FD8DC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2473FD914(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

uint64_t objectdestroy_10Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_2473FD98C(id result, char a2)
{
  if (a2 != -1) {
    return result;
  }
  return result;
}

uint64_t sub_2473FD9A0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_2473F4060(a1, v2, a2);
}

uint64_t static Logger.subsystem.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_26924CA08;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static Logger.subsystem.setter(uint64_t a1, void *a2)
{
  qword_26924CA08 = a1;
  off_26924CA10 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static Logger.subsystem.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_2473FDAC0()
{
  uint64_t v0 = sub_24740D560();
  __swift_allocate_value_buffer(v0, qword_26B12B938);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B12B938);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  return sub_24740D550();
}

uint64_t static Logger.general.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B12B950 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24740D560();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B12B938);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

id sub_2473FDC0C(void *a1)
{
  swift_unknownObjectWeakInit();
  uint64_t v3 = &v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler];
  uint64_t v4 = (objc_class *)type metadata accessor for ShortcutsConfigurationViewController();
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v7.receiver = v1;
  v7.super_class = v4;
  id v5 = objc_msgSendSuper2(&v7, sel_initWithConfigurationContext_, a1);
  objc_msgSend(v5, sel_setDelegate_, v5);

  return v5;
}

void sub_2473FDD6C(char a1)
{
  uint64_t v2 = v1;
  v15.receiver = v2;
  v15.super_class = (Class)type metadata accessor for ShortcutsConfigurationViewController();
  objc_msgSendSuper2(&v15, sel_viewWillAppear_, a1 & 1);
  uint64_t v4 = (void *)MEMORY[0x24C5555B0](&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_presenter]);
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v4, sel_view);

    if (!v6)
    {
      __break(1u);
      return;
    }
    id v7 = objc_msgSend(v6, sel_window);

    id v8 = objc_msgSend(v7, sel__rootSheetPresentationController);
  }
  else
  {
    id v8 = 0;
  }
  objc_msgSend(v8, sel__setShouldScaleDownBehindDescendantSheets_, 1);

  objc_msgSend(v2, sel_setOverrideUserInterfaceStyle_, 2);
  id v9 = objc_msgSend(v2, sel_sheetPresentationController);
  if (v9)
  {
    id v10 = v9;
    sub_24740DFF0();
  }
  id v11 = objc_msgSend(v2, sel_sheetPresentationController);
  if (v11)
  {
    uint64_t v12 = v11;
    objc_msgSend(v11, sel__setGrabberTopSpacing_, 10.0);
  }
  id v13 = objc_msgSend(v2, sel_sheetPresentationController);
  if (v13)
  {
    uint64_t v14 = v13;
    objc_msgSend(v13, sel__setAdditionalMinimumTopInset_, -6.0);
  }
}

void sub_2473FDF50(char a1)
{
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ShortcutsConfigurationViewController();
  objc_msgSendSuper2(&v8, sel_viewDidDisappear_, a1 & 1);
  uint64_t v3 = (void *)MEMORY[0x24C5555B0](&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_presenter]);
  if (!v3)
  {
    id v7 = 0;
    goto LABEL_5;
  }
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_view);

  if (v5)
  {
    id v6 = objc_msgSend(v5, sel_window);

    id v7 = objc_msgSend(v6, sel__rootSheetPresentationController);
LABEL_5:
    objc_msgSend(v7, sel__setShouldScaleDownBehindDescendantSheets_, 0);

    return;
  }
  __break(1u);
}

id sub_2473FE114()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShortcutsConfigurationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ShortcutsConfigurationViewController()
{
  return self;
}

void sub_2473FE1BC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *(void (**)(void *, uint64_t))(v2
                                              + OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler);
  if (a1)
  {
    if (v4)
    {
      id v6 = a1;
      sub_2473D7FA8((uint64_t)v4);
      v4(a1, 0);
      sub_2473D81A0((uint64_t)v4);
    }
  }
  else if (v4)
  {
    if (a2)
    {
      objc_super v8 = a2;
    }
    else
    {
      sub_2473FE318();
      objc_super v8 = (void *)swift_allocError();
    }
    sub_2473D7FA8((uint64_t)v4);
    id v9 = a2;
    v4(v8, 1);
    sub_2473D81A0((uint64_t)v4);
  }
  id v10 = (void *)MEMORY[0x24C5555B0](v3 + OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_presenter);
  if (v10)
  {
    id v11 = v10;
    objc_msgSend(v10, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

unint64_t sub_2473FE318()
{
  unint64_t result = qword_26924CA88;
  if (!qword_26924CA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CA88);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ShortcutsConfigurationViewController.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2473FE408);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShortcutsConfigurationViewController.Errors()
{
  return &type metadata for ShortcutsConfigurationViewController.Errors;
}

unint64_t sub_2473FE444()
{
  unint64_t result = qword_26924CA90;
  if (!qword_26924CA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CA90);
  }
  return result;
}

void *sub_2473FE498(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_2474091DC((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_24740E430();

  if (!v4) {
    return 0;
  }
  sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_2473FE570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  uint64_t v31 = a1;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BB28);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CBE0);
  uint64_t v37 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CBE8);
  uint64_t v38 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v34 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473EB2DC(a6, (uint64_t)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v20 = (*(unsigned __int8 *)(v15 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  long long v21 = (void *)swift_allocObject();
  v21[2] = v31;
  v21[3] = a2;
  uint64_t v22 = v33;
  v21[4] = v32;
  v21[5] = v22;
  void v21[6] = a5;
  sub_247404AFC((uint64_t)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v21 + v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924CBF0);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = (void *)sub_24740D710();
  uint64_t v39 = a7;
  id v40 = v23;
  uint64_t v24 = sub_24740DEF0();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
  v25(v13, 1, 1, v24);
  sub_2473CF248(0, (unint64_t *)&qword_26B12BB40);
  sub_2473D3668(&qword_26924CBF8, &qword_26924CBF0);
  sub_2473F1744((unint64_t *)&qword_26B12BB30, (unint64_t *)&qword_26B12BB40);
  sub_24740D830();
  sub_2473D34E0((uint64_t)v13, &qword_26B12BB28);
  swift_release();
  id v40 = (id)sub_24740DF30();
  v25(v13, 1, 1, v24);
  sub_2473D3668(&qword_26924CC00, &qword_26924CBE0);
  uint64_t v27 = v34;
  uint64_t v26 = v35;
  sub_24740D800();
  sub_2473D34E0((uint64_t)v13, &qword_26B12BB28);

  (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v26);
  sub_2473D3668(&qword_26924CC08, &qword_26924CBE8);
  uint64_t v28 = v36;
  uint64_t v29 = sub_24740D730();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v28);
  return v29;
}

void sub_2473FEA34(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v26[0] = a1;
  v26[1] = a2;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24740D4A0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  uint64_t v29 = a5;
  sub_2473EB080(a8, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_2473D34E0((uint64_t)v14, qword_26924C548);
    sub_2473EB84C();
    uint64_t v19 = (void *)swift_allocError();
    swift_willThrow();
    unint64_t v20 = (void (*)(void **))v26[0];
    uint64_t v27 = v19;
    LOBYTE(v28) = 1;
    id v25 = v19;
    v20(&v27);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    sub_24740D3E0();
    swift_allocObject();
    sub_24740D3D0();
    sub_247404BF4();
    uint64_t v21 = sub_24740D3C0();
    unint64_t v23 = v22;
    swift_release();
    sub_24740D4E0();
    uint64_t v24 = (void (*)(void **))v26[0];
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    sub_247404974(v21, v23);
    uint64_t v27 = 0;
    LOBYTE(v28) = 0;
    v24(&v27);
  }
}

uint64_t sub_2473FED34(uint64_t a1)
{
  uint64_t result = sub_24740422C(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = (void *)sub_247404E60(result, v3, 0, a1);
  id v6 = v5;
  return (uint64_t)v5;
}

uint64_t sub_2473FEDA4(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_24740E3C0();
    uint64_t v5 = v4;
    uint64_t v6 = sub_24740E460();
    char v8 = MEMORY[0x24C554B00](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_247405998(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_247404060(v3, v5, v2 != 0, a1);
    uint64_t v9 = v13;
    sub_247405998(v3, v5, v2 != 0);
    return v9;
  }
  uint64_t result = sub_24740422C(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v5 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2473FEEB4()
{
  uint64_t v176 = *v0;
  uint64_t v156 = sub_24740DF80();
  uint64_t v155 = *(void *)(v156 - 8);
  MEMORY[0x270FA5388](v156);
  v154 = (char *)&v126 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAA0);
  MEMORY[0x270FA5388](v158);
  uint64_t v157 = (char *)&v126 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAA8);
  uint64_t v162 = *(void *)(v163 - 8);
  MEMORY[0x270FA5388](v163);
  uint64_t v159 = (char *)&v126 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAB0);
  uint64_t v166 = *(void *)(v168 - 8);
  MEMORY[0x270FA5388](v168);
  long long v161 = (char *)&v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAB8);
  uint64_t v165 = *(void *)(v167 - 8);
  MEMORY[0x270FA5388](v167);
  uint64_t v160 = (char *)&v126 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAC0);
  uint64_t v169 = *(void *)(v170 - 8);
  MEMORY[0x270FA5388](v170);
  id v164 = (char *)&v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAC8);
  uint64_t v130 = *(void *)(v131 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v131);
  uint64_t v129 = (char *)&v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v128 = (char *)&v126 - v10;
  MEMORY[0x270FA5388](v9);
  BOOL v127 = (char *)&v126 - v11;
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAD0);
  uint64_t v147 = *(void *)(v146 - 8);
  MEMORY[0x270FA5388](v146);
  id v143 = (char *)&v126 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAD8);
  id v152 = *(void (***)(char *, uint64_t))(v150 - 8);
  MEMORY[0x270FA5388](v150);
  id v144 = (char *)&v126 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_26924CAE0);
  uint64_t v149 = *(v151 - 1);
  uint64_t v14 = MEMORY[0x270FA5388](v151);
  uint64_t v148 = (char *)&v126 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v145 = (char *)&v126 - v16;
  uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAE8);
  uint64_t v185 = *(void *)(v181 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v181);
  uint64_t v174 = (char *)&v126 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  unint64_t v180 = (char *)&v126 - v19;
  uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAF0);
  uint64_t v141 = *(void *)(v142 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v142);
  char v140 = (char *)&v126 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v139 = (char *)&v126 - v22;
  uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CAF8);
  uint64_t v184 = *(void *)(v179 - 8);
  MEMORY[0x270FA5388](v179);
  v182 = (char *)&v126 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CB00);
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v126 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2473E90DC();
  uint64_t v187 = v0[28];
  uint64_t v188 = *(void *)(*(void *)(v187 + 16) + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C920);
  uint64_t v138 = MEMORY[0x263EFDDA8];
  sub_2473D3668(&qword_26924CB08, &qword_26924C920);
  uint64_t v188 = sub_24740D730();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924CB10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C9D0);
  uint64_t v137 = MEMORY[0x263EFDCF8];
  sub_2473D3668(&qword_26924CB18, &qword_26924CB10);
  sub_24740D740();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  uint64_t v175 = MEMORY[0x263EFDA38];
  sub_2473D3668(&qword_26924CB20, &qword_26924CB00);
  sub_24740D880();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  swift_release();
  uint64_t v188 = *(void *)(*(void *)(v187 + 24) + 40);
  uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C930);
  uint64_t v177 = sub_2473D3668(&qword_26924CB28, &qword_26924C930);
  uint64_t v188 = sub_24740D730();
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CB30);
  uint64_t v29 = sub_2473D3668(&qword_26924CB38, &qword_26924CB30);
  unsigned __int8 v30 = v182;
  uint64_t v178 = v28;
  uint64_t v31 = v29;
  sub_24740D740();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  uint64_t v136 = sub_2473D3668(&qword_26924CB40, &qword_26924CAF8);
  uint64_t v32 = v179;
  sub_24740D880();
  swift_release();
  uint64_t v33 = v184 + 8;
  uint64_t v34 = *(void (**)(char *, uint64_t))(v184 + 8);
  v34(v30, v32);
  uint64_t v172 = v34;
  uint64_t v184 = v33;
  swift_beginAccess();
  uint64_t v153 = v0 + 30;
  sub_24740D670();
  swift_endAccess();
  swift_release();
  uint64_t v188 = *(void *)(*(void *)(v187 + 24) + 40);
  uint64_t v186 = v0;
  uint64_t v188 = sub_24740D730();
  uint64_t v173 = v31;
  sub_24740D740();
  swift_release();
  uint64_t v35 = swift_allocObject();
  swift_weakInit();
  uint64_t v36 = swift_allocObject();
  uint64_t v37 = v176;
  *(void *)(v36 + 16) = v35;
  *(void *)(v36 + 24) = v37;
  uint64_t v38 = v180;
  sub_24740D630();
  swift_release();
  v34(v30, v32);
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CB48);
  uint64_t v39 = swift_allocObject();
  long long v134 = xmmword_247410870;
  *(_OWORD *)(v39 + 16) = xmmword_247410870;
  *(void *)(v39 + 32) = 0;
  *(void *)(v39 + 40) = 0xE000000000000000;
  *(void *)(v39 + 48) = 0;
  uint64_t v40 = MEMORY[0x263F8EE78];
  *(_WORD *)(v39 + 56) = 256;
  char v133 = nullsub_1;
  *(void *)(v39 + 64) = v40;
  *(void *)(v39 + 72) = nullsub_1;
  *(void *)(v39 + 80) = 0;
  sub_2473D3668(&qword_26924CB50, &qword_26924CAE8);
  uint64_t v41 = v139;
  uint64_t v42 = v181;
  sub_24740D7F0();
  swift_bridgeObjectRelease();
  uint64_t v43 = v185 + 8;
  v171 = *(void (**)(char *, uint64_t))(v185 + 8);
  v171(v38, v42);
  uint64_t v44 = type metadata accessor for ButtonViewModel();
  uint64_t v45 = swift_allocObject();
  uint64_t v46 = v141;
  uint64_t v47 = (uint64_t)v140;
  uint64_t v48 = v142;
  (*(void (**)(char *, char *, uint64_t))(v141 + 16))(v140, v41, v142);
  uint64_t v132 = MEMORY[0x263EFDA68];
  uint64_t v49 = sub_247403D74(v47, v45, &qword_26924CAF0, &qword_26924CC30, MEMORY[0x263EFDA68], (uint64_t)sub_247404918);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v48);
  char v50 = v186;
  v186[15] = v49;
  swift_release();
  uint64_t v51 = v187;
  uint64_t v188 = *(void *)(*(void *)(v187 + 24) + 40);
  uint64_t v188 = sub_24740D730();
  sub_24740D740();
  swift_release();
  uint64_t v188 = *(void *)(*(void *)(v51 + 32) + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C940);
  sub_2473D3668(&qword_26924CB58, &qword_26924C940);
  uint64_t v188 = sub_24740D730();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924CB60);
  sub_2473D3668(&qword_26924CB68, &qword_26924CB60);
  unint64_t v52 = v143;
  sub_24740D620();
  uint64_t v53 = swift_allocObject();
  swift_weakInit();
  uint64_t v54 = swift_allocObject();
  uint64_t v55 = v176;
  *(void *)(v54 + 16) = v53;
  *(void *)(v54 + 24) = v55;
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = sub_247403F7C;
  *(void *)(v56 + 24) = v54;
  sub_2473D3668(&qword_26924CB70, &qword_26924CAD0);
  uint64_t v57 = v144;
  uint64_t v58 = v146;
  sub_24740D780();
  swift_release();
  (*(void (**)(char *, uint64_t))(v147 + 8))(v52, v58);
  uint64_t v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = v134;
  *(void *)(v59 + 32) = 0;
  *(void *)(v59 + 40) = 0xE000000000000000;
  *(void *)(v59 + 48) = 0;
  *(_WORD *)(v59 + 56) = 256;
  char v60 = v133;
  *(void *)(v59 + 64) = MEMORY[0x263F8EE78];
  *(void *)(v59 + 72) = v60;
  *(void *)(v59 + 80) = 0;
  sub_2473D3668(&qword_26924CB78, &qword_26924CAD8);
  char v61 = v145;
  uint64_t v62 = v150;
  sub_24740D7F0();
  swift_bridgeObjectRelease();
  v152[1](v57, v62);
  uint64_t v63 = swift_allocObject();
  uint64_t v64 = v149;
  uint64_t v65 = (uint64_t)v148;
  uint64_t v66 = v151;
  (*(void (**)(char *, char *, void *))(v149 + 16))(v148, v61, v151);
  uint64_t v67 = sub_247403D74(v65, v63, &qword_26924CAE0, &qword_26924CC28, v132, (uint64_t)sub_247404918);
  (*(void (**)(char *, void *))(v64 + 8))(v61, v66);
  v50[16] = v67;
  swift_release();
  uint64_t v188 = *(void *)(*(void *)(v187 + 24) + 40);
  uint64_t v188 = sub_24740D730();
  unint64_t v68 = v182;
  sub_24740D740();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  uint64_t v70 = v179;
  uint64_t v69 = v180;
  sub_24740D630();
  swift_release();
  v172(v68, v70);
  uint64_t v71 = swift_allocObject();
  uint64_t v72 = *(void (***)(char *, uint64_t))(v185 + 16);
  uint64_t v73 = (uint64_t)v174;
  uint64_t v74 = v181;
  v185 += 16;
  ((void (*)(char *, char *, uint64_t))v72)(v174, v69, v181);
  uint64_t v75 = sub_247403D74(v73, v71, &qword_26924CAE8, &qword_26924CB50, v175, (uint64_t)sub_247404918);
  uint64_t v176 = v43;
  v171(v69, v74);
  v50[17] = v75;
  swift_release();
  int v76 = *((unsigned __int8 *)v50 + 176);
  if ((v76 & 1) == 0)
  {
    id v152 = v72;
    LODWORD(v175) = v76;
    if (qword_26924BAC0 != -1) {
      swift_once();
    }
    id v77 = (id)qword_26924CD50;
    uint64_t v78 = sub_24740D410();
    uint64_t v80 = v79;

    uint64_t v81 = swift_allocObject();
    uint64_t v82 = v186;
    swift_weakInit();
    uint64_t v188 = v78;
    uint64_t v189 = v80;
    uint64_t v190 = 0;
    __int16 v191 = 1;
    uint64_t v192 = MEMORY[0x263F8EE78];
    v193 = sub_2474048EC;
    uint64_t v194 = v81;
    uint64_t v83 = v127;
    sub_24740D6F0();
    uint64_t v126 = v44;
    uint64_t v84 = swift_allocObject();
    uint64_t v85 = v130;
    uint64_t v151 = *(void **)(v130 + 16);
    uint64_t v86 = (uint64_t)v128;
    uint64_t v87 = v131;
    ((void (*)(char *, char *, uint64_t))v151)(v128, v83, v131);
    uint64_t v88 = MEMORY[0x263EFDE00];
    uint64_t v150 = (uint64_t)sub_247404918;
    uint64_t v89 = sub_247403D74(v86, v84, &qword_26924CAC8, &qword_26924CBC0, MEMORY[0x263EFDE00], (uint64_t)sub_247404918);
    uint64_t v90 = *(void (**)(char *, uint64_t))(v85 + 8);
    v90(v83, v87);
    v82[12] = v89;
    swift_release();
    id v91 = (id)qword_26924CD50;
    uint64_t v92 = sub_24740D410();
    uint64_t v94 = v93;

    uint64_t v95 = swift_allocObject();
    swift_weakInit();
    uint64_t v188 = v92;
    uint64_t v189 = v94;
    uint64_t v190 = 0;
    __int16 v191 = 1;
    uint64_t v192 = MEMORY[0x263F8EE78];
    v193 = sub_2474048F4;
    uint64_t v194 = v95;
    uint64_t v96 = v129;
    sub_24740D6F0();
    uint64_t v97 = swift_allocObject();
    ((void (*)(uint64_t, char *, uint64_t))v151)(v86, v96, v87);
    uint64_t v98 = sub_247403D74(v86, v97, &qword_26924CAC8, &qword_26924CBC0, v88, v150);
    v90(v96, v87);
    v82[13] = v98;
    swift_release();
    uint64_t v188 = *(void *)(*(void *)(v187 + 24) + 40);
    uint64_t v188 = sub_24740D730();
    uint64_t v99 = v182;
    sub_24740D740();
    swift_release();
    swift_allocObject();
    swift_weakInit();
    uint64_t v101 = v179;
    uint64_t v100 = v180;
    sub_24740D630();
    swift_release();
    v172(v99, v101);
    uint64_t v102 = swift_allocObject();
    uint64_t v103 = (uint64_t)v174;
    uint64_t v104 = v181;
    ((void (*)(char *, char *, uint64_t))v152)(v174, v100, v181);
    uint64_t v105 = sub_247403D74(v103, v102, &qword_26924CAE8, &qword_26924CB50, MEMORY[0x263EFDA38], (uint64_t)sub_247404918);
    v171(v100, v104);
    v82[14] = v105;
    swift_release();
    int v76 = v175;
  }
  id v106 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v107 = v154;
  sub_24740DF90();

  sub_247405F44((unint64_t *)&qword_26924C6C8, MEMORY[0x263F07CB0]);
  uint64_t v108 = v156;
  sub_24740D780();
  (*(void (**)(char *, uint64_t))(v155 + 8))(v107, v108);
  uint64_t v188 = v186[5];
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C6A8);
  sub_2473D3668(&qword_26924CB80, &qword_26924CAA0);
  sub_2473D3668(&qword_26924C6B0, &qword_26924C6A8);
  unint64_t v109 = v159;
  sub_24740D640();
  uint64_t v110 = swift_allocObject();
  swift_weakInit();
  uint64_t v111 = swift_allocObject();
  *(void *)(v111 + 16) = sub_247404028;
  *(void *)(v111 + 24) = v110;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924CB88);
  sub_2473D3668(&qword_26924CB90, &qword_26924CAA8);
  uint64_t v112 = v161;
  uint64_t v113 = v163;
  sub_24740D740();
  swift_release();
  (*(void (**)(char *, uint64_t))(v162 + 8))(v109, v113);
  sub_2473D3668(&qword_26924CB98, &qword_26924CAB0);
  sub_2473D3668(&qword_26924CBA0, &qword_26924CB88);
  unint64_t v114 = v160;
  uint64_t v115 = v168;
  sub_24740D860();
  (*(void (**)(char *, uint64_t))(v166 + 8))(v112, v115);
  sub_2473D3668(&qword_26924CBA8, &qword_26924CAB8);
  uint64_t v116 = v164;
  uint64_t v117 = v167;
  sub_24740D760();
  (*(void (**)(char *, uint64_t))(v165 + 8))(v114, v117);
  sub_2473D3668(&qword_26924CBB0, &qword_26924CAC0);
  uint64_t v118 = v170;
  sub_24740D790();
  (*(void (**)(char *, uint64_t))(v169 + 8))(v116, v118);
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  uint64_t result = swift_release();
  if (v76 && (!*(void *)(v186[18] + 16) || *(unsigned char *)(v186[19] + 24) == 1))
  {
    uint64_t result = sub_2474042DC();
    if (v120)
    {
      uint64_t v122 = v121;
      uint64_t v123 = v186;
      uint64_t v124 = v186[18];
      uint64_t v188 = v120;
      *(void *)(v124 + 16) = v120;
      swift_bridgeObjectRetain_n();
      swift_retain();
      swift_bridgeObjectRelease();
      swift_retain();
      sub_24740D6A0();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v125 = v123[19];
      uint64_t v188 = v122;
      LOBYTE(v189) = 0;
      *(void *)(v125 + 16) = v122;
      *(unsigned char *)(v125 + 24) = 0;
      swift_retain();
      swift_retain();
      sub_24740D6A0();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_247400CB0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (!v4) {
    goto LABEL_29;
  }
  uint64_t v29 = result;
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_24740E390();
  uint64_t v6 = (unsigned __int8 *)(v1 + 48);
  do
  {
    uint64_t v9 = (void *)*((void *)v6 - 2);
    uint64_t v10 = *((void *)v6 - 1);
    int v12 = *v6;
    v6 += 24;
    int v11 = v12;
    switch(v12)
    {
      case 1:
        sub_2473D8260(v9, v10, 1u);
        sub_2473D8260(v9, v10, 1u);
        uint64_t v13 = @"Shortcuts";
        goto LABEL_9;
      case 2:
        sub_2473D8260(v9, v10, 2u);
        id v15 = v9;
        swift_bridgeObjectRetain();
        id v16 = objc_msgSend(v15, sel_sectionIdentifier);
        goto LABEL_12;
      case 3:
        id v16 = objc_msgSend(v9, sel_sectionIdentifier);
LABEL_12:
        uint64_t v13 = (__CFString *)v16;
        break;
      default:
        sub_2473D8260(v9, v10, 0);
        sub_2473D8260(v9, v10, 0);
        uint64_t v13 = @"Controls";
LABEL_9:
        uint64_t v14 = v13;
        break;
    }
    uint64_t v17 = sub_24740DCF0();
    uint64_t v19 = v18;
    if (v17 == sub_24740DCF0() && v19 == v20)
    {

      swift_bridgeObjectRelease_n();
      char v7 = 0;
      goto LABEL_5;
    }
    char v22 = sub_24740E5A0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v7 = 0;
    if ((v22 & 1) == 0)
    {
      char v7 = 1;
      switch(v11)
      {
        case 2:
          id v23 = v9;
          id v24 = objc_msgSend(v23, sel_parameters);
          sub_2473CF248(0, &qword_26B12BB70);
          unint64_t v25 = sub_24740DD70();

          if (v25 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v28 = sub_24740E4A0();

            swift_bridgeObjectRelease_n();
            if (!v28)
            {
LABEL_27:
              char v7 = 1;
              break;
            }
          }
          else
          {
            uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRelease();

            if (!v26) {
              goto LABEL_27;
            }
          }
          if ((v10 & 0xC000000000000001) != 0) {
            uint64_t v27 = sub_24740E2A0();
          }
          else {
            uint64_t v27 = *(void *)(v10 + 16);
          }
          char v7 = v27 != 0;
          break;
        case 3:
          break;
        default:
          char v7 = v9 != 0;
          break;
      }
    }
LABEL_5:
    id v8 = objc_allocWithZone((Class)type metadata accessor for ActionSelectorItem());
    sub_2473E2A44(v9, v10, v11, v7);
    sub_2473D82EC(v9, v10, v11);
    sub_2473D82EC(v9, v10, v11);
    sub_24740E370();
    sub_24740E3A0();
    sub_24740E3B0();
    sub_24740E380();
    --v4;
  }
  while (v4);
  uint64_t v3 = v29;
  uint64_t v5 = v30;
LABEL_29:
  *(void *)(*(void *)(v3 + 144) + 16) = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_retain();
  sub_24740D6A0();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2474010B8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  unsigned __int8 v3 = *(unsigned char *)(a1 + 16);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(*(void *)(*(void *)(result + 224) + 16) + 16);
    if (v6)
    {
      swift_bridgeObjectRetain();
      sub_2473D8260(v1, v2, v3);
      uint64_t v7 = sub_247404EB0(v6, v1, v2, v3);
      char v9 = v8;
      sub_2473D82EC(v1, v2, v3);
      swift_bridgeObjectRelease();
      if (v9) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v7;
      }
      uint64_t v11 = *(void *)(v5 + 152);
      *(void *)(v11 + 16) = v10;
      *(unsigned char *)(v11 + 24) = 0;
      swift_retain();
      swift_retain();
      sub_24740D6A0();
      swift_release();
      swift_release();
      *(unsigned char *)(*(void *)(v5 + 168) + 16) = 1;
      swift_retain();
      swift_retain();
      sub_24740D6A0();
      swift_release();
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_247401218@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v3 = *(void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  unsigned int v5 = *(unsigned __int8 *)(a1 + 16);
  if (v5 >= 2)
  {
    if (v5 != 2) {
      goto LABEL_6;
    }
    id v6 = v3;
    id v7 = objc_msgSend(v6, sel_parameters);
    sub_2473CF248(0, &qword_26B12BB70);
    unint64_t v8 = sub_24740DD70();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_24740E4A0();

      swift_bridgeObjectRelease_n();
      if (!v17) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();

      if (!v9) {
        goto LABEL_6;
      }
    }
  }
  if (!sub_247407DBC(v3, v4, v5))
  {
    char v10 = sub_247405120(v3, v4, v5);
    goto LABEL_8;
  }
LABEL_6:
  char v10 = 1;
LABEL_8:
  uint64_t v11 = sub_247405344(v3, v4, v5);
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  uint64_t result = swift_release();
  *(void *)a2 = v11;
  *(void *)(a2 + 8) = v13;
  *(void *)(a2 + 16) = 0;
  *(unsigned char *)(a2 + 24) = 1;
  uint64_t v16 = MEMORY[0x263F8EE78];
  *(unsigned char *)(a2 + 25) = v10 & 1;
  *(void *)(a2 + 32) = v16;
  *(void *)(a2 + 40) = sub_24740530C;
  *(void *)(a2 + 48) = v14;
  return result;
}

void sub_2474013E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v2 + 24);
  int v4 = *(unsigned __int8 *)(v3 + 32);
  if (v4 == 255) {
    return;
  }
  id v6 = *(void **)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  sub_2473FD504(v6, v5, *(unsigned char *)(v3 + 32));
  if ((sub_247405120(v6, v5, v4) & 1) == 0)
  {
    switch(v4)
    {
      case 1:
        __swift_project_boxed_opaque_existential_1((void *)(v1 + 184), *(void *)(v1 + 208));
        uint64_t v12 = swift_allocObject();
        swift_weakInit();
        sub_2473FD504(v6, v5, 1u);
        swift_retain();
        sub_2473D680C((uint64_t)v6, (uint64_t)sub_247404C78, v12);
        sub_2473FD518(v6, v5, 1u);
        swift_release_n();
        id v7 = v6;
        uint64_t v8 = v5;
        unsigned __int8 v9 = 1;
        goto LABEL_4;
      case 2:
        uint64_t v13 = *(void *)(*(void *)(v2 + 32) + 16);
        uint64_t v14 = *(void *)(v13 + 16);
        id v15 = v6;
        uint64_t v16 = v15;
        if (!v14) {
          goto LABEL_19;
        }
        id v17 = v15;
        swift_bridgeObjectRetain();
        unint64_t v18 = sub_2474092C0((uint64_t)v17);
        if (v19)
        {
          uint64_t v20 = *(void *)(*(void *)(v13 + 56) + 8 * v18);
          swift_bridgeObjectRetain();

          swift_bridgeObjectRelease();
          sub_2473D8260(v6, v5, 2u);
          swift_bridgeObjectRelease();
          if (*(void *)(v20 + 16))
          {
            uint64_t v21 = sub_2473FED34(v20);
            if (v21)
            {
              char v22 = (void *)v21;
              sub_2473D83C0(v1 + 184, (uint64_t)v54);
              __swift_project_boxed_opaque_existential_1(v54, v54[3]);
              uint64_t v51 = sub_247407248(v6, v5, 2);
              uint64_t v24 = v23;
              id v25 = v22;
              uint64_t v26 = sub_2473FE498(v25, v5);
              if (*(void *)(v20 + 16))
              {
                uint64_t v27 = v26;
                unint64_t v28 = sub_2474091DC((uint64_t)v25);
                if (v29)
                {
                  uint64_t v30 = *(void *)(*(void *)(v20 + 56) + 8 * v28);
                  swift_bridgeObjectRetain();

                  swift_bridgeObjectRelease();
                  uint64_t v31 = swift_allocObject();
                  swift_weakInit();
                  uint64_t v32 = swift_allocObject();
                  *(void *)(v32 + 16) = v31;
                  *(void *)(v32 + 24) = v17;
                  id v33 = v17;
                  swift_retain();
                  sub_2473D5FA4(v51, v24, v27, v30, (uint64_t)sub_247405990, v32);
                  swift_bridgeObjectRelease();

                  sub_2473FD518(v6, v5, 2u);
                  swift_bridgeObjectRelease();
                  swift_release();
                  swift_release();
                  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
                  return;
                }
              }

              swift_bridgeObjectRelease();
              __break(1u);
            }
            __break(1u);
            JUMPOUT(0x247401B98);
          }
          swift_bridgeObjectRelease();
          if (qword_26B12B950 != -1) {
            swift_once();
          }
          uint64_t v43 = sub_24740D560();
          __swift_project_value_buffer(v43, (uint64_t)qword_26B12B938);
          id v35 = v17;
          uint64_t v44 = sub_24740D540();
          os_log_type_t v45 = sub_24740DE90();
          if (os_log_type_enabled(v44, v45))
          {
            uint64_t v46 = (uint8_t *)swift_slowAlloc();
            uint64_t v53 = swift_slowAlloc();
            v54[0] = v53;
            *(_DWORD *)uint64_t v46 = 136315138;
            id v47 = objc_msgSend(v35, sel_sectionIdentifier);
            uint64_t v48 = sub_24740DCF0();
            unint64_t v50 = v49;

            uint64_t v55 = sub_2474096F8(v48, v50, v54);
            sub_24740E220();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2473C9000, v44, v45, "Template for %s has no parameters; this should never happen",
              v46,
              0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C5554B0](v53, -1, -1);
            MEMORY[0x24C5554B0](v46, -1, -1);

            sub_2473FD518(v6, v5, 2u);
            goto LABEL_23;
          }
        }
        else
        {

          swift_bridgeObjectRelease();
LABEL_19:
          if (qword_26B12B950 != -1) {
            swift_once();
          }
          uint64_t v34 = sub_24740D560();
          __swift_project_value_buffer(v34, (uint64_t)qword_26B12B938);
          id v35 = v16;
          uint64_t v36 = sub_24740D540();
          os_log_type_t v37 = sub_24740DE90();
          if (os_log_type_enabled(v36, v37))
          {
            uint64_t v38 = (uint8_t *)swift_slowAlloc();
            uint64_t v52 = swift_slowAlloc();
            v54[0] = v52;
            *(_DWORD *)uint64_t v38 = 136315138;
            id v39 = objc_msgSend(v35, sel_sectionIdentifier);
            uint64_t v40 = sub_24740DCF0();
            unint64_t v42 = v41;

            uint64_t v55 = sub_2474096F8(v40, v42, v54);
            sub_24740E220();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2473C9000, v36, v37, "No parameter value sections for %s", v38, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C5554B0](v52, -1, -1);
            MEMORY[0x24C5554B0](v38, -1, -1);

            sub_2473FD518(v6, v5, 2u);
LABEL_23:

            return;
          }
        }
        id v7 = v6;
        uint64_t v8 = v5;
        unsigned __int8 v9 = 2;
        goto LABEL_4;
      case 3:
        id v7 = v6;
        uint64_t v8 = v5;
        unsigned __int8 v9 = 3;
        goto LABEL_4;
      default:
        __swift_project_boxed_opaque_existential_1((void *)(v1 + 184), *(void *)(v1 + 208));
        uint64_t v10 = swift_allocObject();
        swift_weakInit();
        uint64_t v11 = swift_allocObject();
        swift_weakInit();
        sub_2473FD504(v6, v5, 0);
        swift_retain();
        swift_retain();
        sub_2473D61F0(v6, (uint64_t)sub_247404C78, v10, (uint64_t)sub_247404C48, v11);
        sub_2473FD518(v6, v5, 0);
        swift_release_n();
        swift_release_n();
        id v7 = v6;
        uint64_t v8 = v5;
        unsigned __int8 v9 = 0;
        goto LABEL_4;
    }
  }
  id v7 = v6;
  uint64_t v8 = v5;
  unsigned __int8 v9 = v4;
LABEL_4:
  sub_2473FD518(v7, v8, v9);
}

uint64_t sub_247401BA8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 a3@<W2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v10 = sub_247405120(a1, a2, a3);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    swift_retain();
    uint64_t v12 = sub_247405628(a1, a2, a3, a4, (uint64_t)sub_24740533C, v11);
    swift_release_n();
  }
  else
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
  }
  uint64_t v13 = sub_247407EF8(a1, a2, a3);
  unint64_t v15 = v14;
  uint64_t v28 = sub_2474080C8(a1, a2, a3);
  uint64_t v16 = *(void *)(v12 + 16);
  if (a3 < 2u) {
    goto LABEL_9;
  }
  if (a3 != 2) {
    goto LABEL_10;
  }
  uint64_t v26 = v13;
  char v27 = v10;
  id v25 = a1;
  id v17 = objc_msgSend(v25, sel_parameters);
  sub_2473CF248(0, &qword_26B12BB70);
  unint64_t v18 = sub_24740DD70();

  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_24740E4A0();

    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v24 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
  }
  char v10 = v27;
  uint64_t v13 = v26;
  if (v24) {
LABEL_9:
  }
    BOOL v19 = !sub_247407DBC(a1, a2, a3);
  else {
LABEL_10:
  }
    BOOL v19 = 1;
  if (v15) {
    unint64_t v20 = v15;
  }
  else {
    unint64_t v20 = 0xE000000000000000;
  }
  if (!v15) {
    uint64_t v13 = 0;
  }
  char v21 = (v16 != 0) | ~v10;
  uint64_t v22 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  uint64_t result = swift_release();
  *(void *)a5 = v13;
  *(void *)(a5 + 8) = v20;
  *(void *)(a5 + 16) = v28;
  *(unsigned char *)(a5 + 24) = v21 & 1;
  *(unsigned char *)(a5 + 25) = v19;
  *(void *)(a5 + 32) = v12;
  *(void *)(a5 + 40) = sub_24740530C;
  *(void *)(a5 + 48) = v22;
  return result;
}

void sub_247401E6C(void *a1, void *a2)
{
  swift_beginAccess();
  if (!swift_weakLoadStrong()) {
    return;
  }
  swift_retain();
  swift_release();
  id v4 = objc_msgSend(a1, sel_parameters);
  sub_2473CF248(0, &qword_26B12BB70);
  unint64_t v5 = sub_24740DD70();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_24740E4A0();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_4;
    }
LABEL_9:
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x24C554A50](0, v5);
    goto LABEL_7;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v6 = *(id *)(v5 + 32);
LABEL_7:
    id v7 = v6;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C808);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247410870;
    *(void *)(inited + 32) = v7;
    *(void *)(inited + 40) = a2;
    id v9 = a1;
    id v10 = v7;
    id v11 = a2;
    unint64_t v12 = sub_2473F2334(inited);
    sub_2473F2C5C(v9, v12, 2, 1);
    swift_release();

    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

uint64_t sub_247402030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  int v5 = *(unsigned __int8 *)(a1 + 16);
  if (qword_26924BAC0 != -1) {
    swift_once();
  }
  id v6 = (id)qword_26924CD50;
  uint64_t v7 = sub_24740D410();
  uint64_t v9 = v8;

  if (v5)
  {
    BOOL v10 = 1;
    goto LABEL_15;
  }
  BOOL v10 = 1;
  if (v4)
  {
    id v11 = v4;
    id v12 = objc_msgSend(v11, sel_intent, 0x80000002474132C0);
    if (v12)
    {
      uint64_t v13 = v12;
      self;
      uint64_t v14 = swift_dynamicCastObjCClass();

      if (v14)
      {
        sub_2473D82EC(v4, v3, 0);
LABEL_11:
        BOOL v10 = !sub_247407DBC(v4, v3, 0);
        goto LABEL_15;
      }
    }
    id v15 = objc_msgSend(v11, sel_intent);
    if (v15
      && (uint64_t v16 = v15,
          id v17 = objc_msgSend(v15, sel__codableDescription),
          v16,
          id v18 = objc_msgSend(v17, sel_attributes),
          v17,
          v18))
    {
      sub_2473CF248(0, &qword_26924BE88);
      sub_2473CF248(0, &qword_26924CC18);
      sub_2473F1744(&qword_26924CC20, &qword_26924BE88);
      unint64_t v19 = sub_24740DC80();

      sub_247403ACC(v19);
      char v21 = v20;
      sub_2473D82EC(v4, v3, 0);
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_11;
      }
    }
    else
    {
      sub_2473D82EC(v4, v3, 0);
    }
    BOOL v10 = 1;
  }
LABEL_15:
  uint64_t v22 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  uint64_t result = swift_release();
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = 0;
  *(unsigned char *)(a2 + 24) = 1;
  uint64_t v24 = MEMORY[0x263F8EE78];
  *(unsigned char *)(a2 + 25) = v10;
  *(void *)(a2 + 32) = v24;
  *(void *)(a2 + 40) = sub_247404C48;
  *(void *)(a2 + 48) = v22;
  return result;
}

void sub_247402368()
{
  uint64_t v1 = *(void *)(v0[28] + 24);
  if (*(unsigned char *)(v1 + 32)) {
    return;
  }
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v2 = *(void *)(v1 + 24);
  if (v3)
  {
    sub_2473D8260(*(id *)(v1 + 16), *(void *)(v1 + 24), 0);
    id v4 = v3;
    id v5 = objc_msgSend(v4, sel_intent);
    if (v5)
    {
      id v6 = v5;
      self;
      uint64_t v7 = swift_dynamicCastObjCClass();

      if (v7)
      {
        sub_2473FD518(v3, v2, 0);
        goto LABEL_9;
      }
    }
    id v8 = objc_msgSend(v4, sel_intent);
    if (v8
      && (uint64_t v9 = v8,
          id v10 = objc_msgSend(v8, sel__codableDescription),
          v9,
          id v11 = objc_msgSend(v10, sel_attributes),
          v10,
          v11))
    {
      sub_2473CF248(0, &qword_26924BE88);
      sub_2473CF248(0, &qword_26924CC18);
      sub_2473F1744(&qword_26924CC20, &qword_26924BE88);
      unint64_t v12 = sub_24740DC80();

      sub_247403ACC(v12);
      char v14 = v13;
      sub_2473FD518(v3, v2, 0);
      swift_bridgeObjectRelease();
      if (v14)
      {
LABEL_9:
        id v15 = (void *)v0[29];
        uint64_t v16 = v15[3];
        if (v16)
        {
          uint64_t v17 = v15[6];
          uint64_t v18 = v15[4];
          uint64_t v20 = v15[5];
          uint64_t v21 = v15[7];
          *(void *)&long long v22 = v15[2];
          *((void *)&v22 + 1) = v16;
          uint64_t v23 = v18;
          uint64_t v24 = v20;
          uint64_t v25 = v17;
          uint64_t v26 = v21;
          __swift_project_boxed_opaque_existential_1(v0 + 23, v0[26]);
          uint64_t v19 = swift_allocObject();
          swift_weakInit();
          sub_2473FD504(v3, v2, 0);
          sub_2473FD504(v3, v2, 0);
          sub_2473D9FC4(v22, v16);
          swift_retain();
          sub_2473D65A8(v4, &v22, (uint64_t)sub_247404C78, v19);
          sub_2473FD518(v3, v2, 0);
          sub_2473FD518(v3, v2, 0);
          swift_bridgeObjectRelease();
          swift_release_n();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
    }
    else
    {
      sub_2473FD518(v3, v2, 0);
    }
  }
  sub_2473FD518(v3, v2, 0);
}

uint64_t sub_247402698()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2473D83C0(result + 184, (uint64_t)v5);
    swift_release();
    uint64_t v1 = __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    uint64_t v2 = MEMORY[0x24C5555B0](v1);
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      id v4 = *(id *)(v2 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);

      objc_msgSend(v4, sel_zoomIn);
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  return result;
}

id sub_247402744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  *(void *)a2 = *(void *)a1;
  *(void *)(a2 + 8) = v2;
  unsigned __int8 v4 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a2 + 16) = v4;
  return sub_2473FD504(v3, v2, v4);
}

uint64_t sub_24740275C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  if (qword_26924BAC0 != -1) {
    swift_once();
  }
  id v6 = (id)qword_26924CD50;
  uint64_t v7 = sub_24740D410();
  uint64_t v9 = v8;

  BOOL v10 = sub_247407DBC(v3, v4, v5);
  uint64_t v11 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  uint64_t result = swift_release();
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = 0;
  *(unsigned char *)(a2 + 24) = v10;
  uint64_t v13 = MEMORY[0x263F8EE78];
  *(unsigned char *)(a2 + 25) = 0;
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = sub_2474048F4;
  *(void *)(a2 + 48) = v11;
  return result;
}

uint64_t sub_2474028EC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2473D83C0(result + 184, (uint64_t)v5);
    swift_release();
    uint64_t v1 = __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    uint64_t v2 = MEMORY[0x24C5555B0](v1);
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v4 = *(void (**)(void))(v2 + OBJC_IVAR___BCConfigurationViewController_dismissHandler);
      swift_retain();

      v4();
      swift_release();
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  return result;
}

uint64_t sub_2474029A0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CBD0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return 0;
  }
  uint64_t v8 = *(void *)(*(void *)(Strong + 144) + 16);
  if (!v8 || (uint64_t v9 = *(void *)(Strong + 152), (*(unsigned char *)(v9 + 24) & 1) != 0))
  {
    swift_release();
    return 0;
  }
  uint64_t v12 = *(void *)(v9 + 16);
  uint64_t v13 = sub_24740D4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v2, 1, 1, v13);
  uint64_t v14 = qword_26924BB08;
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  id v15 = (id)qword_26924C700;
  uint64_t v16 = sub_2473FE570(1, v8, v12, 0xD000000000000013, 0x8000000247412910, (uint64_t)v2, (uint64_t)v15);

  sub_2473D34E0((uint64_t)v2, qword_26924C548);
  uint64_t v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924CB88);
  sub_2473D3668(&qword_26924CBA0, &qword_26924CB88);
  sub_24740D750();
  swift_release();
  sub_2473D3668(&qword_26924CBD8, &qword_26924CBD0);
  uint64_t v10 = sub_24740D730();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_release();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_247402CBC(uint64_t a1, void (*a2)(void))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    a2();
    return swift_release();
  }
  return result;
}

void sub_247402D1C(void *a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  if (!swift_weakLoadStrong()) {
    return;
  }
  id v5 = objc_msgSend(a3, sel_parameters);
  sub_2473CF248(0, &qword_26B12BB70);
  unint64_t v6 = sub_24740DD70();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_24740E4A0();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_4;
    }
LABEL_9:
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v7 = (id)MEMORY[0x24C554A50](0, v6);
    goto LABEL_7;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v6 + 32);
LABEL_7:
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924C808);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247410870;
    *(void *)(inited + 32) = v8;
    *(void *)(inited + 40) = a1;
    id v10 = a3;
    id v11 = v8;
    id v12 = a1;
    unint64_t v13 = sub_2473F2334(inited);
    sub_2473F2C5C(v10, v13, 2, 1);
    swift_release();

    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

id sub_247402ECC@<X0>(id *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>)
{
  id v10 = *a1;
  id v11 = objc_msgSend(*a1, sel_localizedTitle);
  uint64_t v12 = sub_24740DCF0();
  uint64_t v37 = v13;

  id v14 = objc_msgSend(v10, sel_image);
  if (v14)
  {
    id v15 = v14;
    id v36 = objc_msgSend(v14, sel_UIImage);
  }
  else
  {
    id v36 = 0;
  }
  uint64_t v33 = v12;
  uint64_t v34 = a3;
  if (a2)
  {
    uint64_t v16 = a5;
    id v17 = objc_msgSend(v10, sel_identifier);
    uint64_t v18 = sub_24740DCF0();
    uint64_t v20 = v19;

    id v21 = objc_msgSend(a2, sel_identifier);
    uint64_t v22 = sub_24740DCF0();
    uint64_t v24 = v23;

    if (v18 == v22 && v20 == v24) {
      LOBYTE(a2) = 1;
    }
    else {
      LOBYTE(a2) = sub_24740E5A0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = a5;
  }
  id v25 = objc_msgSend(v10, sel_identifier);
  uint64_t v26 = sub_24740DCF0();
  uint64_t v28 = v27;

  if (v26 == 0xD000000000000031 && v28 == 0x8000000247412D10)
  {
    swift_bridgeObjectRelease();
    char v29 = 1;
  }
  else
  {
    char v29 = sub_24740E5A0();
    swift_bridgeObjectRelease();
  }
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = v34;
  v30[3] = a4;
  v30[4] = v16;
  v30[5] = v10;
  *(void *)a6 = v33;
  *(void *)(a6 + 8) = v37;
  *(void *)(a6 + 16) = v36;
  *(unsigned char *)(a6 + 24) = a2 & 1;
  *(unsigned char *)(a6 + 25) = v29 & 1;
  *(void *)(a6 + 32) = sub_247405920;
  *(void *)(a6 + 40) = v30;
  swift_retain();
  id v31 = v16;
  return v10;
}

uint64_t sub_247403144(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2473F3128(a1, 1);
    return swift_release();
  }
  return result;
}

uint64_t sub_2474031A8()
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
  __swift_destroy_boxed_opaque_existential_1(v0 + 184);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247403238()
{
  uint64_t v0 = ScreenViewModel.deinit();
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
  __swift_destroy_boxed_opaque_existential_1(v0 + 184);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2474032D0()
{
  uint64_t v0 = sub_247403238();
  return MEMORY[0x270FA0228](v0, 248, 7);
}

uint64_t type metadata accessor for ConfigurationViewModel()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for ConfigurationViewModel.ConfigurationMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2474033F0);
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

ValueMetadata *type metadata accessor for ConfigurationViewModel.ConfigurationMode()
{
  return &type metadata for ConfigurationViewModel.ConfigurationMode;
}

unint64_t sub_24740342C()
{
  unint64_t result = qword_26924CA98;
  if (!qword_26924CA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CA98);
  }
  return result;
}

uint64_t sub_247403480()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2474034B8(uint64_t *a1)
{
  return sub_247400CB0(a1);
}

uint64_t sub_2474034C0(uint64_t a1)
{
  return sub_2474010B8(a1);
}

uint64_t sub_2474034C8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247403500@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247401218(a1, a2);
}

void sub_247403508(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    id v2 = v1;
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24740D560();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B12B938);
    id v4 = v1;
    id v5 = v1;
    osos_log_t log = sub_24740D540();
    os_log_type_t v6 = sub_24740DE90();
    if (os_log_type_enabled(oslog, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)id v7 = 138412290;
      id v9 = v1;
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      sub_24740E220();
      *uint64_t v8 = v14;

      _os_log_impl(&dword_2473C9000, oslog, v6, "Failed to save placeholder data: %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v8, -1, -1);
      MEMORY[0x24C5554B0](v7, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24740D560();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B12B938);
    osos_log_t log = sub_24740D540();
    os_log_type_t v11 = sub_24740DEB0();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_2473C9000, oslog, v11, "Successfully saved placeholder data", v12, 2u);
      MEMORY[0x24C5554B0](v12, -1, -1);
    }
  }
}

uint64_t sub_2474037B4(char a1)
{
  return *(void *)&aVersion_0[8 * a1];
}

uint64_t sub_2474037D4(void *a1, uint64_t a2, uint64_t a3)
{
  v10[0] = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CC58);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247405EF0();
  sub_24740E670();
  char v13 = 0;
  sub_24740E570();
  if (!v3)
  {
    v10[1] = v10[0];
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFA0);
    sub_247405F8C(&qword_26924CC60, &qword_26924CC68);
    sub_24740E580();
    char v11 = 2;
    sub_24740E570();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2474039C8()
{
  return sub_2474037B4(*v0);
}

uint64_t sub_2474039D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247405B2C(a1, a2);
  *a3 = result;
  return result;
}

void sub_2474039F8(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_247403A04(uint64_t a1)
{
  unint64_t v2 = sub_247405EF0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247403A40(uint64_t a1)
{
  unint64_t v2 = sub_247405EF0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247403A7C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_247405C9C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_247403AAC(void *a1)
{
  return sub_2474037D4(a1, *v1, v1[1]);
}

void sub_247403ACC(unint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    unint64_t v17 = 0;
    uint64_t v1 = 0;
    unint64_t v2 = 0;
    unint64_t v3 = sub_24740E3D0() | 0x8000000000000000;
  }
  else
  {
    uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v1 = ~v4;
    unint64_t v17 = a1 + 64;
    uint64_t v5 = -v4;
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v2 = v6 & *(void *)(a1 + 64);
    unint64_t v3 = a1;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  int64_t v16 = (unint64_t)(v1 + 64) >> 6;
  while (1)
  {
    uint64_t v12 = v7;
    if ((v3 & 0x8000000000000000) == 0) {
      break;
    }
    if (!sub_24740E450()) {
      goto LABEL_31;
    }
    swift_unknownObjectRelease();
    sub_2473CF248(0, &qword_26924CC18);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v10 = v18;
    swift_unknownObjectRelease();
    if (!v18) {
      goto LABEL_31;
    }
LABEL_10:
    unsigned int v11 = objc_msgSend(v10, sel_isConfigurable);

    if (v11) {
      goto LABEL_31;
    }
  }
  if (v2)
  {
    unint64_t v8 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    unint64_t v9 = v8 | (v7 << 6);
LABEL_9:
    id v10 = *(id *)(*(void *)(v3 + 56) + 8 * v9);
    if (!v10) {
      goto LABEL_31;
    }
    goto LABEL_10;
  }
  int64_t v13 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v13 >= v16) {
      goto LABEL_31;
    }
    unint64_t v14 = *(void *)(v17 + 8 * v13);
    ++v7;
    if (!v14)
    {
      uint64_t v7 = v12 + 2;
      if (v12 + 2 >= v16) {
        goto LABEL_31;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v7);
      if (!v14)
      {
        uint64_t v7 = v12 + 3;
        if (v12 + 3 >= v16) {
          goto LABEL_31;
        }
        unint64_t v14 = *(void *)(v17 + 8 * v7);
        if (!v14)
        {
          uint64_t v7 = v12 + 4;
          if (v12 + 4 >= v16) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v17 + 8 * v7);
          if (!v14)
          {
            uint64_t v7 = v12 + 5;
            if (v12 + 5 >= v16) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v17 + 8 * v7);
            if (!v14)
            {
              uint64_t v15 = v12 + 6;
              while (v16 != v15)
              {
                unint64_t v14 = *(void *)(v17 + 8 * v15++);
                if (v14)
                {
                  uint64_t v7 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_2473F16DC();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v2 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v7 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_247403D74(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  v16[1] = a6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  int64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, a1, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924CBB8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = 0u;
  *(_OWORD *)(v14 + 32) = 0u;
  *(_OWORD *)(v14 + 48) = 0u;
  *(void *)(v14 + 64) = 0;
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924C150);
  swift_allocObject();
  *(void *)(v14 + 72) = sub_24740D6B0();
  *(void *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = MEMORY[0x263F8EE88];
  swift_allocObject();
  swift_weakInit();
  sub_2473D3668(a4, a3);
  sub_24740D880();
  swift_release();
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return a2;
}

uint64_t sub_247403F7C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 a3@<W2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_247401BA8(a1, a2, a3, a4, a5);
}

uint64_t sub_247403F84()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double sub_247403FBC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(_OWORD *__return_ptr, void, void, void, void))(v2 + 16))(v6, *(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(void *)(a1 + 24));
  long long v4 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v4;
  double result = *(double *)&v7;
  *(_OWORD *)(a2 + 32) = v7;
  *(void *)(a2 + 48) = v8;
  return result;
}

uint64_t sub_247404020@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247402030(a1, a2);
}

uint64_t sub_247404028()
{
  return sub_2474029A0();
}

uint64_t sub_247404030@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

void sub_247404060(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_24740E3E0();
      sub_2473CF248(0, &qword_26B12BB70);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_19;
  }
  if (a3)
  {
LABEL_10:
    if (sub_24740E400() == *(_DWORD *)(a4 + 36))
    {
      sub_24740E410();
      sub_2473CF248(0, &qword_26B12BB70);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      unint64_t v5 = sub_2474091DC((uint64_t)v10);
      char v7 = v6;

      if (v7) {
        goto LABEL_12;
      }
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
      return;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 64) >> a1) & 1) == 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  uint64_t v8 = *(void **)(*(void *)(a4 + 48) + 8 * v5);
  id v9 = v8;
}

uint64_t sub_24740422C(uint64_t a1)
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
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4) {
    unint64_t v7 = 4;
  }
  unint64_t v8 = v7 - 4;
  id v9 = (unint64_t *)(a1 + 96);
  uint64_t v2 = 192;
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

uint64_t sub_2474042DC()
{
  uint64_t v0 = sub_24740D4A0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  unint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v33 - v8;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))((char *)&v33 - v8, 1, 1, v0);
  sub_2473EB080((uint64_t)v9, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v7, 1, v0) == 1)
  {
    sub_2473D34E0((uint64_t)v7, qword_26924C548);
    sub_2473EB84C();
    unint64_t v10 = (void *)swift_allocError();
    swift_willThrow();
    sub_2473D34E0((uint64_t)v9, qword_26924C548);
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24740D560();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B12B938);
    id v12 = v10;
    id v13 = v10;
    uint64_t v14 = sub_24740D540();
    os_log_type_t v15 = sub_24740DE90();
    if (os_log_type_enabled(v14, v15))
    {
      int64_t v16 = (uint8_t *)swift_slowAlloc();
      long long v17 = (void *)swift_slowAlloc();
      *(_DWORD *)int64_t v16 = 138412290;
      id v18 = v10;
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v34 = v19;
      sub_24740E220();
      void *v17 = v19;

      _os_log_impl(&dword_2473C9000, v14, v15, "Failed to load placeholder data: %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v17, -1, -1);
      MEMORY[0x24C5554B0](v16, -1, -1);

      return 0;
    }

LABEL_12:
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v7, v0);
  uint64_t v24 = sub_24740D4B0();
  unint64_t v26 = v25;
  sub_24740D3B0();
  swift_allocObject();
  sub_24740D3A0();
  sub_247404920();
  sub_24740D390();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_release();
  sub_247404974(v24, v26);
  uint64_t v27 = v34;
  uint64_t v28 = v35;
  sub_2473D34E0((uint64_t)v9, qword_26924C548);
  if (!v28)
  {
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24740D560();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B12B938);
    uint64_t v14 = sub_24740D540();
    os_log_type_t v21 = sub_24740DE80();
    if (os_log_type_enabled(v14, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_2473C9000, v14, v21, "No placeholder data found", v22, 2u);
      MEMORY[0x24C5554B0](v22, -1, -1);
    }
    goto LABEL_12;
  }
  if (qword_26B12B950 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_24740D560();
  __swift_project_value_buffer(v29, (uint64_t)qword_26B12B938);
  uint64_t v30 = sub_24740D540();
  os_log_type_t v31 = sub_24740DEB0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl(&dword_2473C9000, v30, v31, "Successfully loaded placeholder data", v32, 2u);
    MEMORY[0x24C5554B0](v32, -1, -1);
  }

  return v27;
}

uint64_t sub_2474048EC()
{
  return sub_247402698();
}

uint64_t sub_2474048F4()
{
  return sub_2474028EC();
}

uint64_t sub_247404910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24740275C(a1, a2);
}

uint64_t sub_247404918(uint64_t *a1)
{
  return sub_2473DAB14(a1);
}

unint64_t sub_247404920()
{
  unint64_t result = qword_26924CBC8;
  if (!qword_26924CBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CBC8);
  }
  return result;
}

uint64_t sub_247404974(uint64_t a1, unint64_t a2)
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

uint64_t sub_2474049CC()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26924C548) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_24740D4A0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_247404AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26924C548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_247404B64(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26924C548) - 8);
  uint64_t v6 = v2[5];
  uint64_t v7 = v2[6];
  uint64_t v8 = (uint64_t)v2 + ((*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  id v9 = (void *)v2[2];
  uint64_t v10 = v2[3];
  uint64_t v11 = v2[4];
  sub_2473FEA34(a1, a2, v9, v10, v11, v6, v7, v8);
}

unint64_t sub_247404BF4()
{
  unint64_t result = qword_26924CC10;
  if (!qword_26924CC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CC10);
  }
  return result;
}

uint64_t sub_247404C48()
{
  return sub_247402CBC(v0, sub_247402368);
}

uint64_t sub_247404C78(void *a1)
{
  return sub_247403144(a1);
}

uint64_t sub_247404C94(unint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  unint64_t v7 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    if (!v8) {
      return v9;
    }
    uint64_t v36 = MEMORY[0x263F8EE78];
    uint64_t result = sub_2473F95E4(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0) {
      break;
    }
    uint64_t v11 = 0;
    uint64_t v9 = v36;
    unint64_t v25 = v7;
    unint64_t v26 = v7 & 0xC000000000000001;
    uint64_t v24 = v8;
    while (v8 != v11)
    {
      if (v26) {
        id v12 = (id)MEMORY[0x24C554A50](v11, v7);
      }
      else {
        id v12 = *(id *)(v7 + 8 * v11 + 32);
      }
      id v13 = v12;
      id v31 = v12;
      sub_247402ECC(&v31, a2, a3, a4, a5, (uint64_t)v32);
      if (v6)
      {
        swift_release();

        return v9;
      }

      uint64_t v14 = v32[0];
      uint64_t v15 = v32[1];
      uint64_t v16 = v32[2];
      char v17 = v33;
      char v18 = v34;
      long long v19 = v35;
      uint64_t v36 = v9;
      unint64_t v21 = *(void *)(v9 + 16);
      unint64_t v20 = *(void *)(v9 + 24);
      if (v21 >= v20 >> 1)
      {
        long long v23 = v35;
        sub_2473F95E4(v20 > 1, v21 + 1, 1);
        long long v19 = v23;
        uint64_t v9 = v36;
      }
      ++v11;
      *(void *)(v9 + 16) = v21 + 1;
      uint64_t v22 = v9 + 48 * v21;
      *(void *)(v22 + 32) = v14;
      *(void *)(v22 + 40) = v15;
      *(void *)(v22 + 48) = v16;
      *(unsigned char *)(v22 + 56) = v17;
      *(unsigned char *)(v22 + 57) = v18;
      *(_OWORD *)(v22 + 64) = v19;
      uint64_t v8 = v24;
      unint64_t v7 = v25;
      uint64_t v6 = 0;
      if (v24 == v11) {
        return v9;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_24740E4A0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_247404E60(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 8 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_247404EB0(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = (unsigned __int8 *)(a1 + 48);
  uint64_t v25 = a4;
  while (1)
  {
    uint64_t v6 = (void *)*((void *)v5 - 2);
    uint64_t v7 = *((void *)v5 - 1);
    int v9 = *v5;
    v5 += 24;
    unsigned __int8 v8 = v9;
    unint64_t v26 = v6;
    switch(v9)
    {
      case 1:
        sub_2473D8260(v6, v7, 1u);
        uint64_t v10 = @"Shortcuts";
        goto LABEL_6;
      case 2:
        id v12 = v6;
        swift_bridgeObjectRetain();
        id v13 = objc_msgSend(v12, sel_sectionIdentifier);
        goto LABEL_9;
      case 3:
        id v13 = objc_msgSend(v6, sel_sectionIdentifier);
LABEL_9:
        uint64_t v10 = (__CFString *)v13;
        break;
      default:
        sub_2473D8260(v6, v7, 0);
        uint64_t v10 = @"Controls";
LABEL_6:
        uint64_t v11 = v10;
        break;
    }
    switch(v25)
    {
      case 1:
        uint64_t v14 = @"Shortcuts";
        goto LABEL_13;
      case 2:
      case 3:
        uint64_t v14 = (__CFString *)objc_msgSend(a2, sel_sectionIdentifier);
        break;
      default:
        uint64_t v14 = @"Controls";
LABEL_13:
        uint64_t v15 = v14;
        break;
    }
    uint64_t v16 = sub_24740DCF0();
    uint64_t v18 = v17;
    if (v16 == sub_24740DCF0() && v18 == v19) {
      break;
    }
    char v21 = sub_24740E5A0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2473D82EC(v26, v7, v8);
    if (v21) {
      return v4;
    }
    if (v24 == ++v4) {
      return 0;
    }
  }

  swift_bridgeObjectRelease_n();
  sub_2473D82EC(v26, v7, v8);
  return v4;
}

uint64_t sub_247405120(void *a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = @"Shortcuts";
      goto LABEL_5;
    case 2:
    case 3:
      uint64_t v3 = (__CFString *)objc_msgSend(a1, sel_sectionIdentifier);
      break;
    default:
      uint64_t v3 = @"Controls";
LABEL_5:
      uint64_t v4 = v3;
      break;
  }
  uint64_t v5 = sub_24740DCF0();
  uint64_t v7 = v6;
  if (v5 == sub_24740DCF0() && v7 == v8) {
    goto LABEL_19;
  }
  char v10 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10)
  {
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v11 = sub_24740DCF0();
  uint64_t v13 = v12;
  if (v11 == sub_24740DCF0() && v13 == v14)
  {
LABEL_19:
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
  char v16 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16) {
    goto LABEL_20;
  }
  uint64_t v17 = sub_24740DCF0();
  uint64_t v19 = v18;
  if (v17 != sub_24740DCF0() || v19 != v20)
  {
    char v23 = sub_24740E5A0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v21 = v23 ^ 1;
    return v21 & 1;
  }

  swift_bridgeObjectRelease_n();
LABEL_21:
  char v21 = 0;
  return v21 & 1;
}

uint64_t sub_24740530C()
{
  return sub_247402CBC(v0, sub_2474013E8);
}

void sub_24740533C(void *a1, void *a2)
{
}

uint64_t sub_247405344(void *a1, uint64_t a2, char a3)
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 1:
      if (qword_26924BAC0 != -1) {
        goto LABEL_18;
      }
      goto LABEL_5;
    case 2:
      id v4 = a1;
      id v5 = objc_msgSend(v4, sel_sectionIdentifier);
      uint64_t v6 = sub_24740DCF0();
      uint64_t v8 = v7;
      if (v6 == sub_24740DCF0() && v8 == v9)
      {

        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v11 = sub_24740E5A0();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v11 & 1) == 0)
        {

          return 0;
        }
      }
      if (qword_26924BAC0 != -1) {
        swift_once();
      }
      id v12 = (id)qword_26924CD50;
      uint64_t v3 = sub_24740D410();

LABEL_16:
      return v3;
    case 3:
      return v3;
    default:
      if (qword_26924BAC0 != -1) {
LABEL_18:
      }
        swift_once();
LABEL_5:
      id v4 = (id)qword_26924CD50;
      uint64_t v3 = sub_24740D410();
      goto LABEL_16;
  }
}

uint64_t sub_247405628(void *a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a3 != 2) {
    return MEMORY[0x263F8EE78];
  }
  id v10 = a1;
  swift_bridgeObjectRetain();
  id v11 = objc_msgSend(v10, sel_parameters);
  sub_2473CF248(0, &qword_26B12BB70);
  unint64_t v12 = sub_24740DD70();

  if (!(v12 >> 62))
  {
    uint64_t v13 = *(void **)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13) {
      goto LABEL_4;
    }
LABEL_16:

    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_24740E4A0();
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_16;
  }
LABEL_4:
  if ((v12 & 0xC000000000000001) != 0)
  {
    id v14 = (id)MEMORY[0x24C554A50](0, v12);
  }
  else
  {
    if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_22;
    }
    id v14 = *(id *)(v12 + 32);
  }
  uint64_t v13 = v14;
  swift_bridgeObjectRelease();
  if (*(void *)(a4 + 16))
  {
    unint64_t v12 = (unint64_t)v10;
    unint64_t v15 = sub_2474092C0(v12);
    if (v16)
    {
      uint64_t v17 = *(void *)(*(void *)(a4 + 56) + 8 * v15);
      swift_bridgeObjectRetain();

      unint64_t v18 = sub_2473F1AC0(v17);
      a4 = sub_2473F1948(v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!(a4 >> 62))
      {
        if (*(uint64_t *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 1)
        {
LABEL_11:

          swift_bridgeObjectRelease();
LABEL_17:
          swift_bridgeObjectRelease();
          return MEMORY[0x263F8EE78];
        }
LABEL_23:
        id v22 = v13;
        char v23 = sub_2473FE498(v22, a2);

        swift_bridgeObjectRelease();
        id v24 = v23;
        swift_retain();
        id v25 = (id)v12;
        uint64_t v19 = sub_247404C94(a4, v23, a5, a6, v25);
        swift_bridgeObjectRelease();

        swift_release();
        return v19;
      }
LABEL_22:
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_24740E4A0();
      swift_bridgeObjectRelease();
      if (v21 <= 1) {
        goto LABEL_11;
      }
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();

    uint64_t v13 = (void *)v12;
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  return MEMORY[0x263F8EE78];
}

uint64_t sub_2474058D8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_247405920()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_247405950()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_247405990(void *a1)
{
  sub_247402D1C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_247405998(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t destroy for ActionPlaceholders()
{
  return swift_bridgeObjectRelease();
}

void *_s27ActionButtonConfigurationUI18ActionPlaceholdersVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ActionPlaceholders(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for ActionPlaceholders(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionPlaceholders(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ActionPlaceholders(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ActionPlaceholders()
{
  return &type metadata for ActionPlaceholders;
}

uint64_t sub_247405B2C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v3 || (sub_24740E5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74496E6F69746361 && a2 == 0xEB00000000736D65 || (sub_24740E5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64657463656C6573 && a2 == 0xED00007865646E49)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24740E5A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_247405C9C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924CC38);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_247405EF0();
  sub_24740E660();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v9[31] = 0;
    uint64_t v7 = sub_24740E530();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BFA0);
    v9[15] = 1;
    sub_247405F8C(&qword_26924CC48, &qword_26924CC50);
    sub_24740E540();
    v9[14] = 2;
    swift_bridgeObjectRetain();
    sub_24740E530();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_247405EF0()
{
  unint64_t result = qword_26924CC40;
  if (!qword_26924CC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CC40);
  }
  return result;
}

uint64_t sub_247405F44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247405F8C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26924BFA0);
    sub_247405F44(a2, (void (*)(uint64_t))type metadata accessor for ActionSelectorItem);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ActionPlaceholders.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2474060ECLL);
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

ValueMetadata *type metadata accessor for ActionPlaceholders.CodingKeys()
{
  return &type metadata for ActionPlaceholders.CodingKeys;
}

unint64_t sub_247406128()
{
  unint64_t result = qword_26924CC70;
  if (!qword_26924CC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CC70);
  }
  return result;
}

unint64_t sub_247406180()
{
  unint64_t result = qword_26924CC78;
  if (!qword_26924CC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CC78);
  }
  return result;
}

unint64_t sub_2474061D8()
{
  unint64_t result = qword_26924CC80;
  if (!qword_26924CC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CC80);
  }
  return result;
}

void sub_24740623C(void *a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = qword_26B12B950;
  uint64_t v9 = a2;
  if (a3)
  {
    if (v8 != -1) {
      swift_once();
    }
    id v36 = a1;
    uint64_t v17 = sub_24740D560();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B12B938);
    id v11 = v9;
    unint64_t v18 = sub_24740D540();
    os_log_type_t v19 = sub_24740DEB0();
    if (os_log_type_enabled(v18, v19))
    {
      char v33 = v9;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v37 = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v22 = sub_24740DCF0();
      sub_2474096F8(v22, v23, (uint64_t *)&v37);
      sub_24740E220();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2473C9000, v18, v19, "Saving %s...", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v21, -1, -1);
      id v24 = v20;
      uint64_t v9 = v33;
      MEMORY[0x24C5554B0](v24, -1, -1);
    }
    else
    {
    }
    sub_24740DCF0();
    uint64_t v30 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
    id v31 = (void *)sub_24740DCC0();
    objc_msgSend(v36, sel_setObject_forKey_, v30, v31);

    unint64_t v26 = sub_24740D540();
    os_log_type_t v27 = sub_24740DEB0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      uint64_t v29 = "Successfully saved section identifier";
      goto LABEL_17;
    }
LABEL_18:
    uint64_t v9 = v26;
    goto LABEL_19;
  }
  char v34 = a2;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24740D560();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B12B938);
  id v11 = v9;
  unint64_t v12 = sub_24740D540();
  os_log_type_t v13 = sub_24740DEB0();
  if (os_log_type_enabled(v12, v13))
  {
    id v35 = a1;
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    *(_DWORD *)id v14 = 138412290;
    uint64_t v37 = v11;
    unint64_t v15 = v11;
    sub_24740E220();
    *uint64_t v32 = v34;

    uint64_t v4 = v3;
    _os_log_impl(&dword_2473C9000, v12, v13, "Saving %@...", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v32, -1, -1);
    char v16 = v14;
    a1 = v35;
    MEMORY[0x24C5554B0](v16, -1, -1);
  }
  else
  {
  }
  sub_2474068E0(a1);
  if (!v4)
  {
    id v25 = (void *)sub_24740DCC0();
    objc_msgSend(a1, sel_setURL_forKey_, 0, v25);

    unint64_t v26 = sub_24740D540();
    os_log_type_t v27 = sub_24740DEB0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      uint64_t v29 = "Successfully saved configured action";
LABEL_17:
      _os_log_impl(&dword_2473C9000, v26, v27, v29, v28, 2u);
      MEMORY[0x24C5554B0](v28, -1, -1);
      id v11 = v26;
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_18;
  }
LABEL_20:
}

uint64_t sub_247406718(void *a1)
{
  uint64_t v3 = (void *)sub_24740DCC0();
  id v4 = objc_msgSend(a1, sel_objectForKey_, v3);

  if (v4)
  {
    sub_24740E240();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_247406DEC((uint64_t)v9, (uint64_t)v10);
  if (!v11) {
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  sub_2473CF248(0, &qword_26924CC88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924CC90);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247410870;
  *(void *)(v5 + 32) = sub_2473CF248(0, &qword_26924C748);
  sub_24740DEC0();
  sub_247404974(v7, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v1) {
    return result;
  }
  if (!v11)
  {
LABEL_11:
    sub_247406E54((uint64_t)v10);
    return 0;
  }
  if (swift_dynamicCast()) {
    return *(void *)&v9[0];
  }
  else {
    return 0;
  }
}

uint64_t sub_2474068E0(void *a1)
{
  uint64_t v2 = v1;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  v13[0] = 0;
  id v4 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v2, 1, v13);
  id v5 = v13[0];
  if (v4)
  {
    uint64_t v6 = sub_24740D4D0();
    unint64_t v8 = v7;

    uint64_t v9 = (void *)sub_24740D4C0();
    uint64_t v10 = (void *)sub_24740DCC0();
    objc_msgSend(a1, sel_setObject_forKey_, v9, v10);

    return sub_247404974(v6, v8);
  }
  else
  {
    unint64_t v12 = v5;
    sub_24740D450();

    return swift_willThrow();
  }
}

id sub_247406A1C(void *a1)
{
  uint64_t v3 = (void *)sub_24740DCC0();
  id v4 = objc_msgSend(a1, sel_stringForKey_, v3);

  if (v4)
  {
    uint64_t v5 = sub_24740DCF0();
    unint64_t v7 = v6;
    if (qword_26B12B950 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24740D560();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B12B938);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24740D540();
    os_log_type_t v10 = sub_24740DEB0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v22 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      swift_bridgeObjectRetain();
      sub_2474096F8(v5, v7, &v22);
      sub_24740E220();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2473C9000, v9, v10, "Successfully loaded section identifier %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5554B0](v12, -1, -1);
      MEMORY[0x24C5554B0](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    sub_2473CF248(0, &qword_26924C748);
    uint64_t v13 = sub_247406718(a1);
    if (!v1)
    {
      id v4 = (id)v13;
      if (v13)
      {
        if (qword_26B12B950 != -1) {
          swift_once();
        }
        uint64_t v15 = sub_24740D560();
        __swift_project_value_buffer(v15, (uint64_t)qword_26B12B938);
        id v16 = v4;
        uint64_t v17 = sub_24740D540();
        os_log_type_t v18 = sub_24740DEB0();
        if (os_log_type_enabled(v17, v18))
        {
          os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
          uint64_t v20 = (void *)swift_slowAlloc();
          *(_DWORD *)os_log_type_t v19 = 138412290;
          uint64_t v22 = (uint64_t)v16;
          id v21 = v16;
          sub_24740E220();
          void *v20 = v4;

          _os_log_impl(&dword_2473C9000, v17, v18, "Successfully loaded configured acton %@", v19, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26924BC58);
          swift_arrayDestroy();
          MEMORY[0x24C5554B0](v20, -1, -1);
          MEMORY[0x24C5554B0](v19, -1, -1);
        }
        else
        {
        }
      }
    }
  }
  return v4;
}

uint64_t sub_247406DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12BBE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247406E54(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12BBE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for PersistentActionData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for PersistentActionData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for PersistentActionData(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for PersistentActionData(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PersistentActionData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
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

uint64_t sub_247407008(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_247407010(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PersistentActionData()
{
  return &type metadata for PersistentActionData;
}

void destroy for Action(uint64_t a1)
{
}

uint64_t _s27ActionButtonConfigurationUI6ActionOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_2473D8260(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Action(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_2473D8260(*(id *)a2, v4, v5);
  id v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_2473D82EC(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Action(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_2473D82EC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Action(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Action(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
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

uint64_t sub_2474071D0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2474071D8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Action()
{
  return &type metadata for Action;
}

unint64_t sub_2474071F4()
{
  unint64_t result = qword_26924CC98;
  if (!qword_26924CC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924CC98);
  }
  return result;
}

uint64_t sub_247407248(void *a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 1:
      if (qword_26924BAC0 != -1) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 2:
      id v7 = a1;
      id v8 = objc_msgSend(v7, sel_localizedTitle);
      uint64_t v9 = sub_24740DCF0();

      uint64_t result = v9;
      break;
    case 3:
      id v11 = objc_msgSend(a1, sel_name);
      uint64_t v12 = sub_24740DCF0();

      sub_2473D82EC(a1, a2, 3u);
      uint64_t result = v12;
      break;
    default:
      if (qword_26924BAC0 != -1) {
LABEL_9:
      }
        swift_once();
LABEL_5:
      id v4 = (id)qword_26924CD50;
      uint64_t v5 = sub_24740D410();

      uint64_t result = v5;
      break;
  }
  return result;
}

uint64_t sub_247407494(void *a1, uint64_t a2, char a3)
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 1:
      if (qword_26924BAC0 != -1) {
        goto LABEL_10;
      }
      goto LABEL_5;
    case 2:
      id v7 = a1;
      id v8 = objc_msgSend(v7, sel_localizedDescription);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v3 = sub_24740DCF0();
      }
      else
      {
        sub_24740E320();
        swift_bridgeObjectRelease();
        sub_247407248(a1, a2, 2);
        sub_24740DD20();

        swift_bridgeObjectRelease();
        uint64_t v3 = 0xD000000000000019;
      }
      break;
    case 3:
      return v3;
    default:
      if (qword_26924BAC0 != -1) {
LABEL_10:
      }
        swift_once();
LABEL_5:
      id v4 = (id)qword_26924CD50;
      uint64_t v3 = sub_24740D410();

      break;
  }
  return v3;
}

id sub_2474076C4(void *a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 1:
      id v3 = objc_allocWithZone(MEMORY[0x263F851A8]);
      id v4 = sel_initWithRed_green_blue_alpha_;
      double v5 = 0.2061;
      double v6 = 0.2728;
      double v7 = 0.4523;
      goto LABEL_4;
    case 2:
      id v10 = a1;
      id v11 = objc_msgSend(v10, sel_sectionIdentifier);
      uint64_t v12 = sub_24740DCF0();
      uint64_t v14 = v13;
      if (v12 == sub_24740DCF0() && v14 == v15)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_24;
      }
      char v17 = sub_24740E5A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17)
      {
LABEL_24:

        id v28 = objc_allocWithZone(MEMORY[0x263F851A8]);
        double v29 = 0.9533;
        double v30 = 0.4296;
        double v31 = 0.0542;
LABEL_25:
        id v32 = objc_msgSend(v28, sel_initWithRed_green_blue_alpha_, v29, v30, v31, 1.0);
        goto LABEL_26;
      }
      uint64_t v18 = sub_24740DCF0();
      uint64_t v20 = v19;
      if (v18 == sub_24740DCF0() && v20 == v21)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_28;
      }
      char v23 = sub_24740E5A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v23)
      {
LABEL_28:

        id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithSystemColor_, 10);
        goto LABEL_26;
      }
      uint64_t v24 = sub_24740DCF0();
      uint64_t v26 = v25;
      if (v24 != sub_24740DCF0() || v26 != v27)
      {
        char v34 = sub_24740E5A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v34) {
          goto LABEL_31;
        }
        uint64_t v35 = sub_24740DCF0();
        uint64_t v37 = v36;
        if (v35 == sub_24740DCF0() && v37 == v38)
        {
          swift_bridgeObjectRelease_n();
LABEL_36:

          id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithRed_green_blue_alpha_, 0.8, 0.64, 0.0, 1.0);
          goto LABEL_26;
        }
        char v39 = sub_24740E5A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v39) {
          goto LABEL_36;
        }
        uint64_t v40 = sub_24740DCF0();
        uint64_t v42 = v41;
        if (v40 == sub_24740DCF0() && v42 == v43)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v44 = sub_24740E5A0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v44 & 1) == 0)
          {
            uint64_t v45 = sub_24740DCF0();
            uint64_t v47 = v46;
            if (v45 == sub_24740DCF0() && v47 == v48)
            {
              swift_bridgeObjectRelease_n();
            }
            else
            {
              char v49 = sub_24740E5A0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v49 & 1) == 0)
              {
                uint64_t v50 = sub_24740DCF0();
                uint64_t v52 = v51;
                if (v50 == sub_24740DCF0() && v52 == v53)
                {
                  swift_bridgeObjectRelease_n();
                }
                else
                {
                  char v54 = sub_24740E5A0();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v54 & 1) == 0)
                  {
                    uint64_t v55 = sub_24740DCF0();
                    uint64_t v57 = v56;
                    if (v55 == sub_24740DCF0() && v57 == v58)
                    {
                      swift_bridgeObjectRelease_n();
                    }
                    else
                    {
                      char v59 = sub_24740E5A0();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      if ((v59 & 1) == 0)
                      {
                        uint64_t v60 = sub_24740DCF0();
                        uint64_t v62 = v61;
                        if (v60 == sub_24740DCF0() && v62 == v63)
                        {

                          swift_bridgeObjectRelease_n();
                        }
                        else
                        {
                          char v64 = sub_24740E5A0();

                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          if ((v64 & 1) == 0)
                          {
                            id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithWhite_alpha_, 0.0, 0.0);
                            goto LABEL_26;
                          }
                        }
                        id v28 = objc_allocWithZone(MEMORY[0x263F851A8]);
                        double v30 = 0.5007;
                        double v31 = 0.9938;
                        goto LABEL_42;
                      }
                    }

                    id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithSystemColor_, 4);
                    goto LABEL_26;
                  }
                }

                id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithRed_green_blue_alpha_, 0.5018, 0.5292, 0.5813, 1.0);
                goto LABEL_26;
              }
            }

            id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithRed_green_blue_alpha_, 0.8, 0.0, 0.0581, 1.0);
            goto LABEL_26;
          }
        }

        id v28 = objc_allocWithZone(MEMORY[0x263F851A8]);
        double v30 = 0.5525;
        double v31 = 0.65;
LABEL_42:
        double v29 = 0.0;
        goto LABEL_25;
      }
      swift_bridgeObjectRelease_n();
LABEL_31:

      id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithRed_green_blue_alpha_, 0.4236, 0.4618, 0.6515, 1.0);
LABEL_26:
      id v33 = v32;

      return v33;
    case 3:
      id v3 = objc_allocWithZone(MEMORY[0x263F851A8]);
      id v4 = sel_initWithWhite_alpha_;
      double v5 = 0.0;
      double v6 = 0.0;
      return objc_msgSend(v3, v4, v5, v6, v7, v8);
    default:
      id v3 = objc_allocWithZone(MEMORY[0x263F851A8]);
      id v4 = sel_initWithRed_green_blue_alpha_;
      double v5 = 0.5018;
      double v6 = 0.5292;
      double v7 = 0.5813;
LABEL_4:
      double v8 = 1.0;
      return objc_msgSend(v3, v4, v5, v6, v7, v8);
  }
}

BOOL sub_247407DBC(void *a1, uint64_t a2, char a3)
{
  BOOL result = 1;
  switch(a3)
  {
    case 2:
      id v7 = a1;
      id v8 = objc_msgSend(v7, sel_parameters);
      sub_2473CF248(0, &qword_26B12BB70);
      unint64_t v9 = sub_24740DD70();

      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = sub_24740E4A0();

        swift_bridgeObjectRelease_n();
        if (v12) {
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRelease();

        if (v10)
        {
LABEL_5:
          if ((a2 & 0xC000000000000001) != 0) {
            uint64_t v11 = sub_24740E2A0();
          }
          else {
            uint64_t v11 = *(void *)(a2 + 16);
          }
          BOOL v5 = v11 == 0;
          return !v5;
        }
      }
      return 1;
    case 3:
      return result;
    default:
      BOOL v5 = a1 == 0;
      return !v5;
  }
}

uint64_t sub_247407EF8(void *a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 1:
      if (!a1) {
        return 0;
      }
      id v5 = objc_msgSend(a1, sel_name);
      uint64_t v6 = sub_24740DCF0();
      id v7 = a1;
      uint64_t v8 = a2;
      unsigned __int8 v9 = 1;
      goto LABEL_6;
    case 2:
      if ((a2 & 0xC000000000000001) != 0)
      {
        if (sub_24740E2A0()) {
          goto LABEL_9;
        }
        return 0;
      }
      if (!*(void *)(a2 + 16)) {
        return 0;
      }
LABEL_9:
      uint64_t v10 = swift_bridgeObjectRetain();
      uint64_t v11 = (void *)sub_2473FEDA4(v10);
      swift_bridgeObjectRelease();
      if (!v11)
      {
        __break(1u);
        goto LABEL_17;
      }
      uint64_t v12 = sub_2473FE498(v11, a2);

      if (!v12)
      {
LABEL_17:
        __break(1u);
        JUMPOUT(0x2474080B8);
      }
      id v13 = objc_msgSend(v12, sel_localizedTitle);

      uint64_t v6 = sub_24740DCF0();
      return v6;
    case 3:
      id v14 = objc_msgSend(a1, sel_name);
      uint64_t v6 = sub_24740DCF0();

      sub_2473D82EC(a1, a2, 3u);
      return v6;
    default:
      if (!a1) {
        return 0;
      }
      id v5 = objc_msgSend(a1, sel_name);
      uint64_t v6 = sub_24740DCF0();
      id v7 = a1;
      uint64_t v8 = a2;
      unsigned __int8 v9 = 0;
LABEL_6:
      sub_2473D82EC(v7, v8, v9);

      return v6;
  }
}

uint64_t sub_2474080C8(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    if (a1)
    {
      id v6 = objc_msgSend(a1, sel_previewIcon);
      if (v6)
      {
        id v7 = v6;
        self;
        uint64_t v8 = swift_dynamicCastObjCClass();
        if (!v8)
        {
          self;
          uint64_t v18 = swift_dynamicCastObjCClass();
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            id v7 = v7;
            id v20 = objc_msgSend(v19, sel_image);
            id v21 = objc_msgSend(v20, sel_UIImage);
          }
          else
          {
            self;
            uint64_t v22 = swift_dynamicCastObjCClass();
            if (!v22)
            {
              self;
              id v4 = (id)swift_dynamicCastObjCClass();
              if (v4)
              {
                uint64_t v25 = sub_24740DE10();
                MEMORY[0x270FA5388](v25);
                void v27[2] = v4;
                id v26 = v7;
                id v4 = (id)sub_2474084D4((uint64_t)sub_24740A8A4, (uint64_t)v27, (uint64_t)"ActionButtonConfigurationUI/Action.swift", 40);
                sub_2473D82EC(a1, a2, 1u);

                return (uint64_t)v4;
              }
              sub_2473D82EC(a1, a2, 1u);
              goto LABEL_22;
            }
            char v23 = (void *)v22;
            id v7 = v7;
            id v24 = objc_msgSend(v23, sel_bundleIdentifier);
            if (!v24)
            {
              sub_24740DCF0();
              id v24 = (id)sub_24740DCC0();
              swift_bridgeObjectRelease();
            }
            id v20 = objc_msgSend(self, sel_applicationIconImageForBundleIdentifier_, v24);

            if (!v20)
            {
              sub_2473D82EC(a1, a2, 1u);

              return 0;
            }
            id v21 = objc_msgSend(v20, sel_UIImage);
          }
          id v4 = v21;
          sub_2473D82EC(a1, a2, 1u);

          goto LABEL_22;
        }
        unsigned __int8 v9 = (void *)v8;
        id v10 = v7;
        id v11 = objc_msgSend(v9, sel_symbolName);
        sub_24740DCF0();

        uint64_t v12 = (void *)sub_24740DCC0();
        swift_bridgeObjectRelease();
        id v4 = objc_msgSend(self, sel__systemImageNamed_, v12);

        sub_2473D82EC(a1, a2, 1u);
        return (uint64_t)v4;
      }
      char v17 = a1;
    }
    else
    {
      char v17 = 0;
    }
    sub_2473D82EC(v17, a2, 1u);
    return 0;
  }
  id v4 = 0;
  if (a3 != 2) {
    return (uint64_t)v4;
  }
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(uint64_t *)(a2 + 16) >= 1) {
      goto LABEL_11;
    }
    return 0;
  }
  if (sub_24740E2A0() < 1) {
    return 0;
  }
LABEL_11:
  uint64_t v13 = swift_bridgeObjectRetain();
  id v14 = (void *)sub_2473FEDA4(v13);
  uint64_t result = swift_bridgeObjectRelease();
  if (v14)
  {
    id v16 = sub_2473FE498(v14, a2);

    if (!v16) {
      return 0;
    }
    id v7 = objc_msgSend(v16, sel_image);

    if (!v7) {
      return 0;
    }
    id v4 = objc_msgSend(v7, sel_UIImage);
LABEL_22:

    return (uint64_t)v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_2474084D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24740DE00();
  swift_release();
  swift_task_getMainExecutor();
  if (swift_task_isCurrentExecutor())
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    sub_24740A914(v11);
    if (v4)
    {
      swift_release();
      return a4;
    }
    a4 = v11[0];
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return a4;
    }
    __break(1u);
  }
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_24740E320();
  sub_24740DD20();
  sub_24740E6A0();
  sub_24740DD20();
  swift_bridgeObjectRelease();
  sub_24740DD20();
  uint64_t result = sub_24740E480();
  __break(1u);
  return result;
}

uint64_t sub_247408664(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_24740DCF0();
  uint64_t v5 = v4;
  if (v3 == sub_24740DCF0() && v5 == v6)
  {
    uint64_t v9 = 0;
LABEL_17:
    swift_bridgeObjectRelease_n();
    return v9;
  }
  char v8 = sub_24740E5A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = 0;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = v2 - 1;
    while (1)
    {
      if (v10 == v9) {
        return 0;
      }
      uint64_t v11 = sub_24740DCF0();
      uint64_t v13 = v12;
      if (v11 == sub_24740DCF0() && v13 == v14) {
        break;
      }
      char v16 = sub_24740E5A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v9;
      if (v16) {
        return v9;
      }
    }
    ++v9;
    goto LABEL_17;
  }
  return v9;
}

uint64_t sub_2474087B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2474087E0(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_247409D50);
}

uint64_t sub_2474087C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2474087E0(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_24740A00C);
}

uint64_t sub_2474087E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void))
{
  return a5(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 16));
}

BOOL sub_247408804(uint64_t a1, uint64_t a2)
{
  return !sub_24740A00C(*(void **)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16), *(void **)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

BOOL sub_24740883C(uint64_t a1, uint64_t a2)
{
  return !sub_24740A00C(*(void **)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void **)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

BOOL sub_247408874(uint64_t a1, uint64_t a2)
{
  return sub_24740A00C(*(void **)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16), *(void **)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

void sub_247408890(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0) {
      a2 = a1;
    }
    else {
      a2 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    if (v4)
    {
      if (v2 < 0) {
        a1 = v2;
      }
      else {
        a1 = v2 & 0xFFFFFFFFFFFFFF8;
      }
      goto LABEL_52;
    }
    uint64_t v5 = a2;
    uint64_t v6 = v2;
    goto LABEL_18;
  }
  if (v4)
  {
    if (a2 < 0) {
      uint64_t v5 = a2;
    }
    else {
      uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t v6 = v3;
LABEL_18:
    sub_247408FF8(v5, v6);
    return;
  }
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  int64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a1 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v7 << 6);
      goto LABEL_44;
    }
    int64_t v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_51;
    }
    if (v15 >= v12) {
      return;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v15);
    ++v7;
    if (!v16)
    {
      int64_t v7 = v15 + 1;
      if (v15 + 1 >= v12) {
        return;
      }
      unint64_t v16 = *(void *)(v8 + 8 * v7);
      if (!v16)
      {
        int64_t v7 = v15 + 2;
        if (v15 + 2 >= v12) {
          return;
        }
        unint64_t v16 = *(void *)(v8 + 8 * v7);
        if (!v16)
        {
          int64_t v7 = v15 + 3;
          if (v15 + 3 >= v12) {
            return;
          }
          unint64_t v16 = *(void *)(v8 + 8 * v7);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_43:
    unint64_t v11 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
LABEL_44:
    uint64_t v18 = 8 * v14;
    uint64_t v19 = *(void **)(*(void *)(v3 + 56) + v18);
    id v20 = *(id *)(*(void *)(v3 + 48) + v18);
    id v21 = v19;
    unint64_t v22 = sub_2474091DC((uint64_t)v20);
    char v24 = v23;

    if ((v24 & 1) == 0)
    {

      return;
    }
    sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
    id v25 = *(id *)(*(void *)(v2 + 56) + 8 * v22);
    char v26 = sub_24740E040();

    if ((v26 & 1) == 0) {
      return;
    }
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v12) {
    return;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16)
  {
    int64_t v7 = v17;
    goto LABEL_43;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v12) {
      return;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_43;
    }
  }
LABEL_51:
  __break(1u);
LABEL_52:
  MEMORY[0x270F9E868](a1, a2);
}

void sub_247408B20(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return;
  }
  uint64_t v2 = a2;
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  int64_t v3 = 0;
  uint64_t v44 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v45 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v46 = a1;
  while (1)
  {
    if (v6)
    {
      unint64_t v7 = __clz(__rbit64(v6));
      uint64_t v8 = (v6 - 1) & v6;
      unint64_t v9 = v7 | (v3 << 6);
    }
    else
    {
      int64_t v10 = v3 + 1;
      if (__OFADD__(v3, 1))
      {
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
        goto LABEL_84;
      }
      if (v10 >= v45) {
        return;
      }
      unint64_t v11 = *(void *)(v44 + 8 * v10);
      ++v3;
      if (!v11)
      {
        int64_t v3 = v10 + 1;
        if (v10 + 1 >= v45) {
          return;
        }
        unint64_t v11 = *(void *)(v44 + 8 * v3);
        if (!v11)
        {
          int64_t v3 = v10 + 2;
          if (v10 + 2 >= v45) {
            return;
          }
          unint64_t v11 = *(void *)(v44 + 8 * v3);
          if (!v11)
          {
            int64_t v3 = v10 + 3;
            if (v10 + 3 >= v45) {
              return;
            }
            unint64_t v11 = *(void *)(v44 + 8 * v3);
            if (!v11)
            {
              int64_t v12 = v10 + 4;
              if (v12 >= v45) {
                return;
              }
              unint64_t v11 = *(void *)(v44 + 8 * v12);
              if (!v11)
              {
                while (1)
                {
                  int64_t v3 = v12 + 1;
                  if (__OFADD__(v12, 1)) {
                    goto LABEL_86;
                  }
                  if (v3 >= v45) {
                    return;
                  }
                  unint64_t v11 = *(void *)(v44 + 8 * v3);
                  ++v12;
                  if (v11) {
                    goto LABEL_24;
                  }
                }
              }
              int64_t v3 = v12;
            }
          }
        }
      }
LABEL_24:
      uint64_t v8 = (v11 - 1) & v11;
      unint64_t v9 = __clz(__rbit64(v11)) + (v3 << 6);
    }
    uint64_t v13 = 8 * v9;
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + v13);
    id v15 = *(id *)(*(void *)(a1 + 48) + v13);
    swift_bridgeObjectRetain();
    unint64_t v16 = sub_2474091DC((uint64_t)v15);
    char v18 = v17;

    if ((v18 & 1) == 0) {
      goto LABEL_75;
    }
    uint64_t v19 = *(void *)(*(void *)(v2 + 56) + 8 * v16);
    int64_t v49 = v3;
    if ((unint64_t)v19 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v20 = sub_24740E4A0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    unint64_t v48 = v8;
    if ((unint64_t)v14 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_24740E4A0();
      swift_bridgeObjectRelease();
      if (v20 != v43) {
        goto LABEL_74;
      }
    }
    else if (v20 != *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_74;
    }
    if (v20)
    {
      uint64_t v21 = v19 & 0xFFFFFFFFFFFFFF8;
      uint64_t v22 = (v19 & 0xFFFFFFFFFFFFFF8) + 32;
      if (v19 < 0) {
        uint64_t v21 = v19;
      }
      if ((unint64_t)v19 >> 62) {
        uint64_t v22 = v21;
      }
      uint64_t v23 = v14 & 0xFFFFFFFFFFFFFF8;
      uint64_t v24 = (v14 & 0xFFFFFFFFFFFFFF8) + 32;
      if (v14 < 0) {
        uint64_t v23 = v14;
      }
      if ((unint64_t)v14 >> 62) {
        uint64_t v24 = v23;
      }
      if (v22 != v24)
      {
        if (v20 < 0) {
          goto LABEL_81;
        }
        unint64_t v25 = v19 & 0xC000000000000001;
        if ((v19 & 0xC000000000000001) != 0)
        {
          id v26 = (id)MEMORY[0x24C554A50](0, v19);
        }
        else
        {
          if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_82;
          }
          id v26 = *(id *)(v19 + 32);
        }
        uint64_t v27 = v26;
        unint64_t v28 = v14 & 0xC000000000000001;
        if ((v14 & 0xC000000000000001) != 0)
        {
          id v29 = (id)MEMORY[0x24C554A50](0, v14);
        }
        else
        {
          if (!*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_83;
          }
          id v29 = *(id *)(v14 + 32);
        }
        double v30 = v29;
        sub_2473CF248(0, &qword_26B12BB80);
        char v31 = sub_24740E040();

        if ((v31 & 1) == 0) {
          goto LABEL_74;
        }
        if (v20 != 1) {
          break;
        }
      }
    }
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v46;
    uint64_t v2 = a2;
    unint64_t v6 = v48;
    int64_t v3 = v49;
  }
  if (!v25)
  {
    if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      id v32 = *(id *)(v19 + 40);
      if (!v28) {
        goto LABEL_54;
      }
LABEL_51:
      id v33 = (id)MEMORY[0x24C554A50](1, v14);
LABEL_56:
      char v34 = v33;
      char v35 = sub_24740E040();

      if ((v35 & 1) == 0)
      {
LABEL_74:
        swift_bridgeObjectRelease();
LABEL_75:
        swift_bridgeObjectRelease();
        return;
      }
      uint64_t v36 = 2 - v20;
      uint64_t v37 = 6;
      while (1)
      {
        if (v36 + v37 == 6) {
          goto LABEL_6;
        }
        unint64_t v41 = v37 - 4;
        if (v25)
        {
          id v42 = (id)MEMORY[0x24C554A50](v37 - 4, v19);
          if (v28) {
            goto LABEL_58;
          }
        }
        else
        {
          if (v41 >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_79:
            __break(1u);
            goto LABEL_80;
          }
          id v42 = *(id *)(v19 + 8 * v37);
          if (v28)
          {
LABEL_58:
            id v38 = (id)MEMORY[0x24C554A50](v37 - 4, v14);
            goto LABEL_59;
          }
        }
        if (v41 >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_79;
        }
        id v38 = *(id *)(v14 + 8 * v37);
LABEL_59:
        char v39 = v38;
        char v40 = sub_24740E040();

        ++v37;
        if ((v40 & 1) == 0) {
          goto LABEL_74;
        }
      }
    }
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  id v32 = (id)MEMORY[0x24C554A50](1, v19);
  if (v28) {
    goto LABEL_51;
  }
LABEL_54:
  if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    id v33 = *(id *)(v14 + 40);
    goto LABEL_56;
  }
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
}

void sub_247408FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 != sub_24740E2A0()) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_19;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v12 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13) {
        break;
      }
    }
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_19:
    uint64_t v15 = 8 * v11;
    unint64_t v16 = *(void **)(*(void *)(a2 + 56) + v15);
    id v17 = *(id *)(*(void *)(a2 + 48) + v15);
    id v18 = v16;
    uint64_t v19 = sub_24740E430();

    if (!v19)
    {

      return;
    }
    sub_2473CF248(0, (unint64_t *)&qword_26B12BB78);
    swift_dynamicCast();
    char v20 = sub_24740E040();

    if ((v20 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v12 + 2;
  if (v14 >= v9) {
    return;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_26:
  __break(1u);
}

unint64_t sub_2474091DC(uint64_t a1)
{
  uint64_t v2 = sub_24740E030();
  return sub_247409500(a1, v2, &qword_26B12BB70);
}

unint64_t sub_24740922C(uint64_t a1)
{
  sub_24740DCF0();
  sub_24740E630();
  sub_24740DD10();
  uint64_t v2 = sub_24740E650();
  swift_bridgeObjectRelease();
  return sub_247409388(a1, v2);
}

unint64_t sub_2474092C0(uint64_t a1)
{
  uint64_t v2 = sub_24740E030();
  return sub_247409500(a1, v2, (unint64_t *)&unk_26B12BB48);
}

unint64_t sub_247409310(uint64_t a1, uint64_t a2)
{
  sub_24740E630();
  sub_24740DD10();
  uint64_t v4 = sub_24740E650();
  return sub_247409614(a1, a2, v4);
}

unint64_t sub_247409388(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24740DCF0();
    uint64_t v8 = v7;
    if (v6 == sub_24740DCF0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24740E5A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_24740DCF0();
          uint64_t v15 = v14;
          if (v13 == sub_24740DCF0() && v15 == v16) {
            break;
          }
          char v18 = sub_24740E5A0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_247409500(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a2 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_2473CF248(0, a3);
    id v7 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    char v8 = sub_24740E040();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v5;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * i);
        char v11 = sub_24740E040();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_247409614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24740E5A0() & 1) == 0)
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
      while (!v14 && (sub_24740E5A0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2474096F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2474097CC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24740A848((uint64_t)v12, *a3);
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
      sub_24740A848((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2474097CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24740E230();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_247409988(a5, a6);
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
  uint64_t v8 = sub_24740E360();
  if (!v8)
  {
    sub_24740E470();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24740E4E0();
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

uint64_t sub_247409988(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_247409A20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_247409C00(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_247409C00(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247409A20(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_247409B98(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24740E330();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24740E470();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24740DD30();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24740E4E0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24740E470();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_247409B98(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247409C00(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B12BBD0);
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
  uint64_t result = sub_24740E4E0();
  __break(1u);
  return result;
}

void sub_247409D50(void *a1, uint64_t a2, char a3, void *a4, uint64_t a5, char a6)
{
  switch(a3)
  {
    case 1:
      if (a6 == 1)
      {
        if (a1)
        {
          if (a4)
          {
            sub_2473CF248(0, &qword_26924C748);
            sub_2473D8260(a4, a5, 1u);
            sub_2473D8260(a1, a2, 1u);
            sub_24740E040();
            sub_2473D82EC(a4, a5, 1u);
            sub_2473D82EC(a1, a2, 1u);
          }
        }
        else if (a4)
        {
          unsigned __int8 v13 = 1;
          goto LABEL_21;
        }
      }
      break;
    case 2:
      if (a6 == 2)
      {
        sub_2473CF248(0, (unint64_t *)&qword_26924C0C8);
        id v10 = a1;
        id v11 = a4;
        char v12 = sub_24740E040();

        if (v12)
        {
          sub_247408890(a2, a5);
        }
      }
      break;
    case 3:
      if (a6 == 3)
      {
        sub_2473CF248(0, (unint64_t *)&qword_26924C0C8);
        sub_2473D8260(a4, a5, 3u);
        sub_2473D8260(a1, a2, 3u);
        sub_24740E040();
        sub_2473D82EC(a4, a5, 3u);
        sub_2473D82EC(a1, a2, 3u);
      }
      break;
    default:
      if (!a6)
      {
        if (a1)
        {
          if (a4)
          {
            sub_2473CF248(0, &qword_26924C378);
            sub_2473D8260(a4, a5, 0);
            sub_2473D8260(a1, a2, 0);
            sub_24740E040();
            sub_2473D82EC(a4, a5, 0);
            sub_2473D82EC(a1, a2, 0);
          }
        }
        else if (a4)
        {
          unsigned __int8 v13 = 0;
LABEL_21:
          sub_2473D82EC(0, a2, v13);
        }
      }
      break;
  }
}

BOOL sub_24740A00C(void *a1, uint64_t a2, unsigned __int8 a3, void *a4, uint64_t a5, unsigned __int8 a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26924CCA0);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = @"SilentMode";
  *(_OWORD *)(inited + 16) = xmmword_247411210;
  *(void *)(inited + 40) = @"Focus";
  *(void *)(inited + 48) = @"Camera";
  *(void *)(inited + 56) = @"Flashlight";
  *(void *)(inited + 64) = @"VoiceMemos";
  *(void *)(inited + 72) = @"MusicRecognition";
  *(void *)(inited + 80) = @"Translate";
  *(void *)(inited + 88) = @"Magnifier";
  *(void *)(inited + 96) = @"Controls";
  *(void *)(inited + 104) = @"Shortcuts";
  *(void *)(inited + 112) = @"Accessibility";
  *(void *)(inited + 120) = @"Nothing";
  uint64_t v13 = inited;
  id v77 = a4;
  unsigned __int8 v78 = a6;
  switch(a3)
  {
    case 1u:
      BOOL v14 = @"Shortcuts";
      id v26 = @"Shortcuts";
      uint64_t v27 = @"Controls";
      unint64_t v28 = @"SilentMode";
      id v29 = @"Focus";
      double v30 = @"Camera";
      char v31 = @"Flashlight";
      id v32 = @"VoiceMemos";
      id v33 = @"MusicRecognition";
      char v34 = @"Translate";
      char v35 = @"Magnifier";
      uint64_t v36 = @"Shortcuts";
      goto LABEL_4;
    case 2u:
    case 3u:
      char v39 = @"Controls";
      char v40 = @"SilentMode";
      unint64_t v41 = @"Focus";
      id v42 = @"Camera";
      uint64_t v43 = @"Flashlight";
      uint64_t v44 = @"VoiceMemos";
      int64_t v45 = @"MusicRecognition";
      uint64_t v46 = @"Translate";
      uint64_t v47 = @"Magnifier";
      unint64_t v48 = @"Shortcuts";
      int64_t v49 = @"Accessibility";
      uint64_t v50 = @"Nothing";
      BOOL v14 = (__CFString *)objc_msgSend(a1, sel_sectionIdentifier);
      break;
    default:
      BOOL v14 = @"Controls";
      uint64_t v15 = @"Controls";
      uint64_t v16 = @"Controls";
      id v17 = @"SilentMode";
      char v18 = @"Focus";
      uint64_t v19 = @"Camera";
      char v20 = @"Flashlight";
      uint64_t v21 = @"VoiceMemos";
      uint64_t v22 = @"MusicRecognition";
      uint64_t v23 = @"Translate";
      uint64_t v24 = @"Magnifier";
      unint64_t v25 = @"Shortcuts";
LABEL_4:
      uint64_t v37 = @"Accessibility";
      id v38 = @"Nothing";
      break;
  }
  uint64_t v51 = a2;
  uint64_t v52 = sub_247408664((uint64_t)v14, v13);
  char v54 = v53;

  if (v54)
  {
    swift_setDeallocating();
    type metadata accessor for WFStaccatoActionSectionIdentifier(0);
    swift_arrayDestroy();
  }
  else
  {
    switch(v78)
    {
      case 1u:
        uint64_t v55 = @"Shortcuts";
        goto LABEL_11;
      case 2u:
      case 3u:
        uint64_t v55 = (__CFString *)objc_msgSend(v77, sel_sectionIdentifier);
        break;
      default:
        uint64_t v55 = @"Controls";
LABEL_11:
        uint64_t v56 = v55;
        break;
    }
    uint64_t v57 = sub_247408664((uint64_t)v55, v13);
    char v59 = v58;

    swift_setDeallocating();
    type metadata accessor for WFStaccatoActionSectionIdentifier(0);
    swift_arrayDestroy();
    if ((v59 & 1) == 0) {
      return v52 < v57;
    }
  }
  if (qword_26B12B950 != -1) {
    swift_once();
  }
  uint64_t v61 = sub_24740D560();
  __swift_project_value_buffer(v61, (uint64_t)qword_26B12B938);
  sub_2473D8260(a1, v51, a3);
  sub_2473D8260(v77, a5, v78);
  sub_2473D8260(a1, v51, a3);
  sub_2473D8260(v77, a5, v78);
  uint64_t v62 = sub_24740D540();
  os_log_type_t v63 = sub_24740DE90();
  if (os_log_type_enabled(v62, v63))
  {
    uint64_t v64 = swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    uint64_t v79 = v75;
    *(_DWORD *)uint64_t v64 = 136315394;
    uint64_t v76 = a5;
    switch(a3)
    {
      case 1u:
        uint64_t v65 = @"Shortcuts";
        goto LABEL_22;
      case 2u:
      case 3u:
        uint64_t v65 = (__CFString *)objc_msgSend(a1, sel_sectionIdentifier);
        break;
      default:
        uint64_t v65 = @"Controls";
LABEL_22:
        uint64_t v66 = v65;
        break;
    }
    uint64_t v67 = sub_24740DCF0();
    unint64_t v69 = v68;

    sub_2474096F8(v67, v69, &v79);
    sub_24740E220();
    swift_bridgeObjectRelease();
    sub_2473D82EC(a1, v51, a3);
    sub_2473D82EC(a1, v51, a3);
    *(_WORD *)(v64 + 12) = 2080;
    switch(v78)
    {
      case 1u:
        uint64_t v70 = @"Shortcuts";
        goto LABEL_27;
      case 2u:
      case 3u:
        uint64_t v70 = (__CFString *)objc_msgSend(v77, sel_sectionIdentifier);
        break;
      default:
        uint64_t v70 = @"Controls";
LABEL_27:
        uint64_t v71 = v70;
        break;
    }
    uint64_t v72 = sub_24740DCF0();
    unint64_t v74 = v73;

    sub_2474096F8(v72, v74, &v79);
    sub_24740E220();
    swift_bridgeObjectRelease();
    sub_2473D82EC(v77, v76, v78);
    sub_2473D82EC(v77, v76, v78);
    _os_log_impl(&dword_2473C9000, v62, v63, "Can't order section identifiers: %s, %s", (uint8_t *)v64, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5554B0](v75, -1, -1);
    MEMORY[0x24C5554B0](v64, -1, -1);
  }
  else
  {
    sub_2473D82EC(a1, v51, a3);
    sub_2473D82EC(a1, v51, a3);
    sub_2473D82EC(v77, a5, v78);
    sub_2473D82EC(v77, a5, v78);
  }

  return 0;
}

uint64_t sub_24740A848(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24740A8A4@<X0>(uint64_t *a1@<X8>)
{
  sub_24740D530();
  uint64_t result = sub_24740D520();
  *a1 = result;
  return result;
}

uint64_t sub_24740A904()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void *sub_24740A914@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

id sub_24740A958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  BOOL v14 = &v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler];
  *(void *)BOOL v14 = 0;
  *((void *)v14 + 1) = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl] = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel] = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel] = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton] = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton] = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton] = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView] = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer] = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton] = 0;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_cancellableBag] = MEMORY[0x263F8EE88];
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions] = a1;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_initialIndex] = a2;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButtonViewModel] = a3;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButtonViewModel] = a4;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButtonViewModel] = a5;
  *(void *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButtonViewModel] = a6;
  v19.receiver = v6;
  v19.super_class = ObjectType;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v15 = objc_msgSendSuper2(&v19, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  uint64_t v16 = *MEMORY[0x263F83430];
  id v17 = v15;
  objc_msgSend(v17, sel_setMaximumContentSizeCategory_, v16, v19.receiver, v19.super_class);
  sub_24740AB2C();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v17;
}

void sub_24740AB2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C148);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)v179 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924C190);
  MEMORY[0x270FA5388](v5 - 8);
  int64_t v7 = (char *)v179 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24740D5D0();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_24740E1C0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)v179 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829F0]), sel_init);
  uint64_t v14 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl;
  id v15 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl] = v13;

  if (!*(void *)&v0[v14])
  {
    __break(1u);
    goto LABEL_74;
  }
  objc_msgSend(v0, sel_addSubview_);
  uint64_t v16 = *(void **)&v0[v14];
  if (!v16)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  uint64_t v17 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions;
  objc_msgSend(v16, sel_setNumberOfPages_, *(void *)(*(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions] + 16));
  char v18 = *(void **)&v1[v14];
  if (!v18)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  objc_msgSend(v18, sel__setPreferredNumberOfVisibleIndicators_, *(void *)(*(void *)&v1[v17] + 16));
  objc_super v19 = *(void **)&v1[v14];
  if (!v19)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  objc_msgSend(v19, sel_setCurrentPage_, *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_initialIndex]);
  char v20 = *(void **)&v1[v14];
  if (!v20)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  objc_msgSend(v20, sel_setBackgroundStyle_, 2);
  uint64_t v21 = *(void **)&v1[v14];
  if (!v21)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  uint64_t v183 = (uint64_t)v4;
  objc_msgSend(v21, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v181 = v14;
  uint64_t v22 = *(void **)&v1[v14];
  if (!v22)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  objc_msgSend(v22, sel_addTarget_action_forControlEvents_, v1, sel_pageControlValueChanged, 4096);
  id v23 = sub_2473CCF64();
  uint64_t v24 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel];
  uint64_t v184 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel;
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel] = v23;

  id v25 = sub_2473CD090();
  id v26 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel];
  *(void *)&long long v182 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel;
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel] = v25;

  uint64_t v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for HighlightAnimatingMenuButton();
  sub_2473CF248(0, (unint64_t *)&qword_26924C178);
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_24740D238;
  *(void *)(v28 + 24) = v27;
  swift_retain_n();
  sub_24740E050();
  id v29 = (void *)sub_24740E1F0();
  sub_24740E1B0();
  sub_24740E110();
  sub_24740E0F0();
  sub_24740D5C0();
  sub_24740E080();
  double v30 = (void (*)(uint64_t *, void))sub_24740E070();
  sub_24740D590();
  v30(v185, 0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_24740D610();
  uint64_t v31 = sub_24740D600();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v7, 0, 1, v31);
  sub_24740E140();
  uint64_t v32 = v183;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v183, v12, v9);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
  id v33 = v29;
  sub_24740E1E0();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release_n();
  uint64_t v34 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton;
  char v35 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton];
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton] = v29;

  uint64_t v37 = *(void **)&v1[v34];
  if (!v37)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  LODWORD(v36) = 1148846080;
  objc_msgSend(v37, sel_setContentHuggingPriority_forAxis_, 1, v36);
  id v38 = *(void **)&v1[v34];
  if (!v38)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  uint64_t v39 = *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButtonViewModel];
  id v40 = v38;
  sub_2473DB008(v39);

  unint64_t v41 = &v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_cancellableBag];
  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  swift_release();
  type metadata accessor for ConfigureButton();
  uint64_t v42 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v43 = sub_2473E6DF8(0, (uint64_t)sub_24740D29C, v42);
  swift_release_n();
  uint64_t v44 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton;
  int64_t v45 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton];
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton] = v43;

  uint64_t v47 = *(void **)&v1[v44];
  if (!v47)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  LODWORD(v46) = 1148846080;
  objc_msgSend(v47, sel_setContentHuggingPriority_forAxis_, 1, v46);
  unint64_t v48 = *(void **)&v1[v44];
  if (!v48)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  uint64_t v49 = *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButtonViewModel];
  id v50 = v48;
  sub_2473DB008(v49);

  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  swift_release();
  uint64_t v51 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v52 = sub_2473E6DF8(1, (uint64_t)sub_24740D2C0, v51);
  swift_release_n();
  uint64_t v53 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton;
  char v54 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton];
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton] = v52;

  uint64_t v56 = *(void **)&v1[v53];
  if (!v56)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  LODWORD(v55) = 1148846080;
  objc_msgSend(v56, sel_setContentHuggingPriority_forAxis_, 1, v55);
  uint64_t v57 = *(void **)&v1[v53];
  if (!v57)
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  uint64_t v58 = *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButtonViewModel];
  id v59 = v57;
  sub_2473DB008(v58);

  swift_beginAccess();
  sub_24740D670();
  swift_endAccess();
  swift_release();
  id v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  LODWORD(v61) = 1132068864;
  objc_msgSend(v60, sel_setContentHuggingPriority_forAxis_, 1, v61);
  uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF18);
  uint64_t v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_2474112B0;
  os_log_type_t v63 = *(void **)&v1[v184];
  if (!v63)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  v179[1] = v41;
  *(void *)(v62 + 32) = v63;
  uint64_t v64 = *(void **)&v1[v182];
  if (!v64)
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  *(void *)(v62 + 40) = v64;
  uint64_t v65 = *(void **)&v1[v34];
  if (!v65)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  *(void *)(v62 + 48) = v65;
  uint64_t v66 = *(void **)&v1[v44];
  if (!v66)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  long long v182 = xmmword_2474112B0;
  *(void *)(v62 + 56) = v66;
  uint64_t v67 = *(void **)&v1[v53];
  if (!v67)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  *(void *)(v62 + 64) = v67;
  *(void *)(v62 + 72) = v60;
  v185[0] = v62;
  sub_24740DD90();
  id v68 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  sub_2473CF248(0, &qword_26924C510);
  id v180 = v60;
  id v69 = v63;
  id v70 = v64;
  id v71 = v65;
  id v72 = v66;
  id v73 = v67;
  unint64_t v74 = (void *)sub_24740DD60();
  swift_bridgeObjectRelease();
  id v75 = objc_msgSend(v68, sel_initWithArrangedSubviews_, v74);

  uint64_t v76 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView;
  id v77 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView];
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView] = v75;

  unsigned __int8 v78 = *(void **)&v1[v76];
  if (!v78)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  objc_msgSend(v78, sel_setAxis_, 1);
  uint64_t v79 = *(void **)&v1[v76];
  uint64_t v80 = v181;
  if (!v79)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  objc_msgSend(v79, sel_setAlignment_, 3);
  uint64_t v81 = *(void **)&v1[v76];
  if (!v81)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  objc_msgSend(v81, sel_setSpacing_, 24.0);
  uint64_t v82 = *(void **)&v1[v76];
  if (!v82)
  {
LABEL_94:
    __break(1u);
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  uint64_t v83 = qword_26924BAB0;
  id v84 = v82;
  if (v83 != -1) {
    swift_once();
  }
  if (!*(void *)&v1[v184]) {
    goto LABEL_95;
  }
  objc_msgSend(v84, sel_setCustomSpacing_afterView_, *(double *)&qword_26924CD40);

  uint64_t v85 = *(void **)&v1[v76];
  if (!v85)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  objc_msgSend(v85, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v86 = *(void **)&v1[v76];
  if (!v86)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  id v87 = objc_msgSend(v86, sel_layer);
  objc_msgSend(v87, sel_setAllowsGroupOpacity_, 0);

  uint64_t v88 = *(void **)&v1[v76];
  if (!v88)
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  id v89 = objc_msgSend(v88, sel_layer);
  objc_msgSend(v89, sel_setAllowsGroupBlending_, 0);

  id v90 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82B88]), sel_init);
  uint64_t v91 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer;
  uint64_t v92 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer];
  *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer] = v90;

  uint64_t v93 = *(void **)&v1[v91];
  if (!v93)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  objc_msgSend(v93, sel_setUserInteractionEnabled_, 1);
  uint64_t v94 = *(void **)&v1[v91];
  if (!v94)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  objc_msgSend(v94, sel_setDirectionalLockEnabled_, 1);
  uint64_t v95 = *(void **)&v1[v91];
  if (!v95)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  objc_msgSend(v95, sel_setShowsVerticalScrollIndicator_, 0);
  uint64_t v96 = *(void **)&v1[v91];
  if (!v96)
  {
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  if (!*(void *)&v1[v76])
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  objc_msgSend(v96, sel_addSubview_);
  uint64_t v97 = *(void **)&v1[v91];
  if (!v97)
  {
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  objc_msgSend(v97, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  if (!*(void *)&v1[v91])
  {
LABEL_105:
    __break(1u);
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  objc_msgSend(v1, sel_addSubview_);
  id v98 = objc_msgSend(v1, sel_traitCollection);
  id v99 = objc_msgSend(v98, sel_preferredContentSizeCategory);

  uint64_t v100 = *MEMORY[0x263F83450];
  LOBYTE(v98) = sub_24740DFB0();

  if (v98) {
    double v101 = 32.0;
  }
  else {
    double v101 = 44.0;
  }
  uint64_t v102 = swift_allocObject();
  *(_OWORD *)(v102 + 16) = v182;
  uint64_t v103 = *(void **)&v1[v80];
  if (!v103) {
    goto LABEL_106;
  }
  id v104 = objc_msgSend(v103, sel_topAnchor);
  id v105 = objc_msgSend(v1, sel_topAnchor);
  id v106 = objc_msgSend(v104, sel_constraintEqualToAnchor_, v105);

  *(void *)(v102 + 32) = v106;
  uint64_t v107 = *(void **)&v1[v80];
  if (!v107)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  uint64_t v184 = v100;
  id v108 = objc_msgSend(v107, sel_centerXAnchor);
  id v109 = objc_msgSend(v1, sel_centerXAnchor);
  id v110 = objc_msgSend(v108, sel_constraintEqualToAnchor_, v109);

  *(void *)(v102 + 40) = v110;
  uint64_t v111 = *(void **)&v1[v91];
  if (!v111)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  id v112 = objc_msgSend(v111, sel_leadingAnchor);
  id v113 = objc_msgSend(v1, sel_leadingAnchor);
  id v114 = objc_msgSend(v112, sel_constraintEqualToAnchor_constant_, v113, v101);

  *(void *)(v102 + 48) = v114;
  uint64_t v115 = *(void **)&v1[v91];
  if (!v115)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  id v116 = objc_msgSend(v115, sel_trailingAnchor);
  id v117 = objc_msgSend(v1, sel_trailingAnchor);
  id v118 = objc_msgSend(v116, sel_constraintEqualToAnchor_constant_, v117, -v101);

  *(void *)(v102 + 56) = v118;
  uint64_t v119 = *(void **)&v1[v91];
  if (!v119)
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  id v120 = objc_msgSend(v119, sel_topAnchor);
  uint64_t v121 = *(void **)&v1[v80];
  if (!v121)
  {
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  id v122 = objc_msgSend(v121, sel_bottomAnchor);
  id v123 = objc_msgSend(v120, sel_constraintEqualToAnchor_constant_, v122, 24.0);

  *(void *)(v102 + 64) = v123;
  uint64_t v124 = *(void **)&v1[v76];
  if (!v124)
  {
LABEL_112:
    __break(1u);
    goto LABEL_113;
  }
  id v125 = objc_msgSend(v124, sel_widthAnchor);
  uint64_t v126 = *(void **)&v1[v91];
  if (!v126)
  {
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }
  BOOL v127 = v125;
  id v128 = self;
  id v129 = objc_msgSend(v126, sel_widthAnchor);
  id v130 = objc_msgSend(v127, sel_constraintEqualToAnchor_, v129);

  *(void *)(v102 + 72) = v130;
  v185[0] = v102;
  sub_24740DD90();
  uint64_t v131 = sub_2473CF248(0, &qword_26924C518);
  uint64_t v132 = (void *)sub_24740DD60();
  swift_bridgeObjectRelease();
  objc_msgSend(v128, sel_activateConstraints_, v132);

  uint64_t v133 = *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButtonViewModel];
  if (v133)
  {
    uint64_t v134 = *(void *)(v133 + 16);
    uint64_t v135 = *(void *)(v134 + 24);
    uint64_t v181 = v131;
    *(void *)&long long v182 = v128;
    if (v135)
    {
      uint64_t v136 = *(void *)(v134 + 16);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v136 = 0;
      uint64_t v135 = 0xE000000000000000;
    }
    id v143 = self;
    swift_retain();
    id v144 = objc_msgSend(v143, sel_whiteColor);
    id v145 = objc_msgSend(v143, sel_grayColor);
    id v146 = objc_msgSend(v143, sel_systemBlueColor);
    id v147 = objc_msgSend(v143, sel_grayColor);
    id v148 = objc_msgSend(v147, sel_colorWithAlphaComponent_, 0.1);

    uint64_t v149 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    id v150 = sub_2473DC660(v136, v135, v144, v145, v146, v148, (uint64_t)sub_24740D2E4, v149);
    swift_bridgeObjectRelease();

    swift_release_n();
    uint64_t v151 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton;
    id v152 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton];
    *(void *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton] = v150;

    uint64_t v153 = *(void **)&v1[v151];
    if (v153)
    {
      objc_msgSend(v153, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      if (*(void *)&v1[v151])
      {
        objc_msgSend(v1, sel_addSubview_);
        id v154 = objc_msgSend(v1, sel_traitCollection);
        id v155 = objc_msgSend(v154, sel_preferredContentSizeCategory);

        LOBYTE(v154) = sub_24740DFA0();
        double v156 = 0.0;
        if (v154)
        {
          if (qword_26924BAE0 != -1) {
            swift_once();
          }
          double v157 = *(double *)&qword_26924CD68;
          if (qword_26924BAE8 != -1) {
            swift_once();
          }
          double v156 = v157 + *(double *)&qword_26924CD70;
        }
        uint64_t v158 = swift_allocObject();
        *(_OWORD *)(v158 + 16) = xmmword_2474106E0;
        uint64_t v159 = *(void **)&v1[v91];
        if (v159)
        {
          id v160 = objc_msgSend(v159, sel_bottomAnchor);
          long long v161 = *(void **)&v1[v151];
          if (v161)
          {
            id v162 = objc_msgSend(v161, sel_topAnchor);
            id v163 = objc_msgSend(v160, sel_constraintEqualToAnchor_, v162);

            *(void *)(v158 + 32) = v163;
            id v164 = *(void **)&v1[v151];
            if (v164)
            {
              id v165 = objc_msgSend(v164, sel_leadingAnchor);
              id v166 = objc_msgSend(v1, sel_leadingAnchor);
              if (qword_26924BAD0 != -1) {
                swift_once();
              }
              id v167 = objc_msgSend(v165, sel_constraintEqualToAnchor_constant_, v166, *(double *)&qword_26924CD58);

              *(void *)(v158 + 40) = v167;
              uint64_t v168 = *(void **)&v1[v151];
              if (v168)
              {
                id v169 = objc_msgSend(v168, sel_trailingAnchor);
                id v170 = objc_msgSend(v1, sel_trailingAnchor);
                id v171 = objc_msgSend(v169, sel_constraintEqualToAnchor_constant_, v170, -*(double *)&qword_26924CD58);

                *(void *)(v158 + 48) = v171;
                uint64_t v172 = *(void **)&v1[v151];
                if (v172)
                {
                  id v173 = objc_msgSend(v172, sel_bottomAnchor);
                  id v174 = objc_msgSend(v1, sel_bottomAnchor);
                  if (qword_26924BAD8 != -1) {
                    swift_once();
                  }
                  id v175 = objc_msgSend(v173, sel_constraintEqualToAnchor_constant_, v174, -(v156 + *(double *)&qword_26924CD60));

                  *(void *)(v158 + 56) = v175;
                  v185[0] = v158;
                  sub_24740DD90();
                  uint64_t v176 = (void *)sub_24740DD60();
                  swift_bridgeObjectRelease();
                  objc_msgSend((id)v182, sel_activateConstraints_, v176);

                  uint64_t v177 = *(void **)&v1[v151];
                  if (v177)
                  {
                    id v178 = v177;
                    sub_2473DB008(v133);

                    swift_beginAccess();
                    sub_24740D670();
                    swift_endAccess();
                    swift_release();
                    swift_release();
                    goto LABEL_72;
                  }
                  goto LABEL_121;
                }
LABEL_120:
                __break(1u);
LABEL_121:
                __break(1u);
                goto LABEL_122;
              }
LABEL_119:
              __break(1u);
              goto LABEL_120;
            }
LABEL_118:
            __break(1u);
            goto LABEL_119;
          }
LABEL_117:
          __break(1u);
          goto LABEL_118;
        }
LABEL_116:
        __break(1u);
        goto LABEL_117;
      }
LABEL_115:
      __break(1u);
      goto LABEL_116;
    }
LABEL_114:
    __break(1u);
    goto LABEL_115;
  }
  uint64_t v137 = swift_allocObject();
  *(_OWORD *)(v137 + 16) = xmmword_24740FD50;
  uint64_t v138 = *(void **)&v1[v91];
  if (v138)
  {
    id v139 = objc_msgSend(v138, sel_bottomAnchor);
    id v140 = objc_msgSend(v1, sel_bottomAnchor);
    id v141 = objc_msgSend(v139, sel_constraintEqualToAnchor_, v140);

    *(void *)(v137 + 32) = v141;
    v185[0] = v137;
    sub_24740DD90();
    uint64_t v142 = (void *)sub_24740DD60();
    swift_bridgeObjectRelease();
    objc_msgSend(v128, sel_activateConstraints_, v142);

LABEL_72:
    return;
  }
LABEL_122:
  __break(1u);
}

uint64_t sub_24740C054(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x24C5555B0](v3);
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = *(void *)(result + *a2);
    swift_retain();

    int64_t v7 = *(void **)(v6 + 16);
    uint64_t v8 = v7[2];
    uint64_t v9 = v7[3];
    uint64_t v10 = (void *)v7[4];
    uint64_t v11 = (void (*)(void))v7[7];
    sub_2473DBAA8(v8, v9, v10);
    uint64_t result = swift_release();
    if (v9)
    {
      swift_retain();
      sub_2473DAFA4(v8, v9, v10);
      v11();
      return swift_release();
    }
  }
  return result;
}

void sub_24740C148(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C5555B0](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButtonViewModel);
    swift_retain();

    if (v4)
    {
      uint64_t v5 = *(void **)(v4 + 16);
      uint64_t v6 = v5[2];
      uint64_t v7 = v5[3];
      uint64_t v8 = (void *)v5[4];
      uint64_t v9 = (void (*)(void))v5[7];
      sub_2473DBAA8(v6, v7, v8);
      swift_release();
      if (v7)
      {
        swift_retain();
        sub_2473DAFA4(v6, v7, v8);
        v9();
        swift_release();
      }
    }
  }
}

void sub_24740C240()
{
  v50.receiver = v0;
  v50.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v50, sel_layoutSubviews);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
  if (!v2)
  {
    __break(1u);
    goto LABEL_33;
  }
  unint64_t v3 = (unint64_t)objc_msgSend(v2, sel_currentPage);
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions];
    if (v3 < *(void *)(v4 + 16))
    {
      sub_2473D83C0(v4 + 40 * v3 + 32, (uint64_t)v48);
      uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel];
      if (v5)
      {
        __swift_project_boxed_opaque_existential_1(v48, v49);
        uint64_t v6 = qword_26924BAA0;
        swift_bridgeObjectRetain();
        id v1 = v5;
        if (v6 == -1) {
          goto LABEL_6;
        }
        goto LABEL_31;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_31:
  swift_once();
LABEL_6:
  double v7 = *(double *)&qword_26924CD30;
  id v8 = objc_allocWithZone(MEMORY[0x263F089B8]);
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithString_, v9);

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), sel_init);
  objc_msgSend(v11, sel_setLineSpacing_, v7);
  objc_msgSend(v11, sel_setAlignment_, 1);
  objc_msgSend(v11, sel_setLineBreakStrategy_, 1);
  uint64_t v12 = *MEMORY[0x263F81540];
  id v13 = v11;
  objc_msgSend(v10, sel_addAttribute_value_range_, v12, v13, 0, objc_msgSend(v10, sel_length));

  objc_msgSend(v1, sel_setAttributedText_, v10);
  swift_bridgeObjectRelease();

  uint64_t v14 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel];
  if (!v14)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  __swift_project_boxed_opaque_existential_1(v48, v49);
  uint64_t v15 = qword_26924BAA8;
  swift_bridgeObjectRetain();
  id v16 = v14;
  if (v15 != -1) {
    swift_once();
  }
  double v17 = *(double *)&qword_26924CD38;
  id v18 = objc_allocWithZone(MEMORY[0x263F089B8]);
  swift_bridgeObjectRetain();
  objc_super v19 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v18, sel_initWithString_, v19);

  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), sel_init);
  objc_msgSend(v21, sel_setLineSpacing_, v17);
  objc_msgSend(v21, sel_setAlignment_, 1);
  objc_msgSend(v21, sel_setLineBreakStrategy_, 1);
  id v22 = v21;
  objc_msgSend(v20, sel_addAttribute_value_range_, v12, v22, 0, objc_msgSend(v20, sel_length));

  objc_msgSend(v16, sel_setAttributedText_, v20);
  swift_bridgeObjectRelease();

  uint64_t v23 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView;
  uint64_t v24 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView];
  if (!v24) {
    goto LABEL_35;
  }
  objc_msgSend(v24, sel_layoutSubviews);
  uint64_t v25 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer;
  id v26 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer];
  if (!v26)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v27 = *(void **)&v0[v23];
  if (!v27)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  id v28 = v26;
  objc_msgSend(v27, sel_bounds);
  double Width = CGRectGetWidth(v51);
  double v30 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton];
  if (!v30)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  double v31 = Width;
  objc_msgSend(v30, sel_frame);
  double MaxY = CGRectGetMaxY(v52);
  id v33 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton];
  if (!v33)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  double v34 = MaxY;
  objc_msgSend(v33, sel_frame);
  double v35 = CGRectGetMaxY(v53);
  double v36 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton];
  if (!v36)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  double v37 = v35;
  objc_msgSend(v36, sel_frame);
  double v38 = CGRectGetMaxY(v54);
  if (v37 > v38) {
    double v38 = v37;
  }
  if (v34 <= v38) {
    double v34 = v38;
  }
  if (qword_26924BAB8 != -1) {
    swift_once();
  }
  objc_msgSend(v28, sel_setContentSize_, v31, v34 + *(double *)&qword_26924CD48);

  uint64_t v39 = *(void **)&v0[v25];
  if (!v39) {
    goto LABEL_41;
  }
  id v40 = v39;
  objc_msgSend(v40, sel_contentSize);
  uint64_t v42 = *(void **)&v0[v25];
  if (!v42)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  double v43 = v41;
  objc_msgSend(v42, sel_bounds);
  objc_msgSend(v40, sel_setScrollEnabled_, CGRectGetHeight(v55) < v43);

  uint64_t v44 = *(void **)&v0[v25];
  if (!v44)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  id v45 = v44;
  objc_msgSend(v45, sel_setShowsVerticalScrollIndicator_, objc_msgSend(v45, sel_isScrollEnabled));

  double v46 = *(void **)&v0[v25];
  if (!v46)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (!objc_msgSend(v46, sel_isScrollEnabled))
  {
LABEL_28:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    return;
  }
  uint64_t v47 = *(void **)&v0[v25];
  if (v47)
  {
    objc_msgSend(v47, sel_flashScrollIndicators);
    goto LABEL_28;
  }
LABEL_45:
  __break(1u);
}

void sub_24740C8C0()
{
  id v1 = *(void (**)(id))&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler];
  if (!v1) {
    return;
  }
  uint64_t v2 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl;
  unint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
  if (!v3)
  {
    __break(1u);
    goto LABEL_11;
  }
  swift_retain();
  if (objc_msgSend(v3, sel_interactionState))
  {
    uint64_t v4 = *(void **)&v0[v2];
    if (v4)
    {
      v1(objc_msgSend(v4, sel_currentPage));
      objc_msgSend(v0, sel_setNeedsLayout);
      goto LABEL_6;
    }
LABEL_11:
    __break(1u);
    return;
  }
LABEL_6:
  sub_2473D81A0((uint64_t)v1);
}

uint64_t sub_24740C9DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24740D430();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x24C5555B0](a2 + 16);
  id v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  if (!v10) {
    return v11(a3, a1, v6);
  }
  uint64_t v12 = (void *)v10;
  v11((uint64_t)v9, a1, v6);
  uint64_t KeyPath = swift_getKeyPath();
  *(&v20 - 2) = (id)MEMORY[0x270FA5388](KeyPath);
  swift_getKeyPath();
  id v20 = sub_2473CCE38(*MEMORY[0x263F83570]);
  sub_2473E61F4();
  sub_24740D420();
  uint64_t v14 = swift_getKeyPath();
  *(&v20 - 2) = (id)MEMORY[0x270FA5388](v14);
  swift_getKeyPath();
  id v15 = objc_msgSend(self, sel_whiteColor);
  unsigned int v16 = objc_msgSend(v12, sel_isHighlighted);
  double v17 = 1.0;
  if (v16) {
    double v17 = 0.5;
  }
  id v18 = objc_msgSend(v15, sel_colorWithAlphaComponent_, v17);

  id v20 = v18;
  sub_2473DCD58();
  sub_24740D420();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
}

uint64_t type metadata accessor for ActionDetailsView()
{
  return self;
}

void sub_24740CDE4()
{
  id v1 = &v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_cancellableBag] = MEMORY[0x263F8EE88];

  sub_24740E480();
  __break(1u);
}

_OWORD *sub_24740CEDC(double a1, double a2)
{
  if (objc_msgSend(v2, sel_isUserInteractionEnabled))
  {
    objc_msgSend(v2, sel_convertPoint_toView_, 0, a1, a2);
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924BF18);
    uint64_t result = (_OWORD *)swift_allocObject();
    result[1] = xmmword_247410700;
    uint64_t v10 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton];
    if (!v10)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    *((void *)result + 4) = v10;
    id v11 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton];
    if (!v11)
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    *((void *)result + 5) = v11;
    uint64_t v12 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton];
    if (!v12)
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    *((void *)result + 6) = v12;
    id v13 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
    if (!v13)
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    *((void *)result + 7) = v13;
    uint64_t v14 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer];
    if (!v14)
    {
LABEL_33:
      __break(1u);
      return result;
    }
    *((void *)result + 8) = v14;
    unint64_t v42 = (unint64_t)result;
    sub_24740DD90();
    unint64_t v15 = v42;
    unsigned int v16 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton];
    if (v16)
    {
      id v17 = v16;
      id v18 = v10;
      id v19 = v11;
      id v20 = v12;
      id v21 = v13;
      id v22 = v14;
      unint64_t v15 = (unint64_t)v17;
      MEMORY[0x24C554460]();
      if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_27:
      }
        sub_24740DDA0();
      sub_24740DDC0();
      sub_24740DD90();

      unint64_t v15 = v42;
      if (!(v42 >> 62))
      {
LABEL_10:
        uint64_t v23 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v23) {
          goto LABEL_11;
        }
LABEL_19:
        swift_bridgeObjectRelease_n();
        return 0;
      }
    }
    else
    {
      id v37 = v10;
      id v38 = v11;
      id v39 = v12;
      id v40 = v13;
      id v41 = v14;
      if (!(v42 >> 62)) {
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_24740E4A0();
    if (v23)
    {
LABEL_11:
      uint64_t v24 = 4;
      while (1)
      {
        if ((v15 & 0xC000000000000001) != 0) {
          id v25 = (id)MEMORY[0x24C554A50](v24 - 4, v15);
        }
        else {
          id v25 = *(id *)(v15 + 8 * v24);
        }
        id v26 = v25;
        uint64_t v27 = v24 - 3;
        if (__OFADD__(v24 - 4, 1))
        {
          __break(1u);
          goto LABEL_27;
        }
        uint64_t result = objc_msgSend(v25, sel_superview);
        if (!result) {
          break;
        }
        id v28 = result;
        objc_msgSend(v26, sel_frame);
        objc_msgSend(v28, sel_convertRect_toView_, 0);
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v34 = v33;
        CGFloat v36 = v35;

        v44.origin.x = v30;
        v44.origin.y = v32;
        v44.size.width = v34;
        v44.size.height = v36;
        v43.x = v6;
        v43.y = v8;
        if (CGRectContainsPoint(v44, v43))
        {
          swift_bridgeObjectRelease_n();
          return v26;
        }

        ++v24;
        if (v27 == v23) {
          goto LABEL_19;
        }
      }
      __break(1u);
      goto LABEL_29;
    }
    goto LABEL_19;
  }
  return 0;
}

uint64_t sub_24740D200()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24740D238()
{
  return sub_24740C054(v0, &OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButtonViewModel);
}

uint64_t sub_24740D25C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24740D294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24740C9DC(a1, v2, a2);
}

uint64_t sub_24740D29C()
{
  return sub_24740C054(v0, &OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButtonViewModel);
}

uint64_t sub_24740D2C0()
{
  return sub_24740C054(v0, &OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButtonViewModel);
}

void sub_24740D2E4()
{
  sub_24740C148(v0);
}

uint64_t sub_24740D2F8()
{
  return 8;
}

uint64_t sub_24740D304()
{
  return swift_release();
}

uint64_t sub_24740D30C(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_24740D320(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24740D338()
{
  return 8;
}

uint64_t sub_24740D35C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24740D390()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24740D3A0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24740D3B0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24740D3C0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24740D3D0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24740D3E0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24740D3F0()
{
  return MEMORY[0x270F816B0]();
}

uint64_t sub_24740D400()
{
  return MEMORY[0x270F816C0]();
}

uint64_t sub_24740D410()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_24740D420()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_24740D430()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_24740D440()
{
  return MEMORY[0x270F816D8]();
}

uint64_t sub_24740D450()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24740D460()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_24740D470()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_24740D480()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24740D490()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_24740D4A0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24740D4B0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_24740D4C0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24740D4D0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24740D4E0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_24740D4F0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24740D500()
{
  return MEMORY[0x270F16668]();
}

uint64_t sub_24740D510()
{
  return MEMORY[0x270F16670]();
}

uint64_t sub_24740D520()
{
  return MEMORY[0x270F868D8]();
}

uint64_t sub_24740D530()
{
  return MEMORY[0x270F868E0]();
}

uint64_t sub_24740D540()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24740D550()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24740D560()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24740D570()
{
  return MEMORY[0x270F819F8]();
}

uint64_t sub_24740D580()
{
  return MEMORY[0x270F81B08]();
}

uint64_t sub_24740D590()
{
  return MEMORY[0x270F81CB0]();
}

uint64_t sub_24740D5A0()
{
  return MEMORY[0x270F81CB8]();
}

uint64_t sub_24740D5B0()
{
  return MEMORY[0x270F81CF0]();
}

uint64_t sub_24740D5C0()
{
  return MEMORY[0x270F81CF8]();
}

uint64_t sub_24740D5D0()
{
  return MEMORY[0x270F81D10]();
}

uint64_t sub_24740D5E0()
{
  return MEMORY[0x270F821D0]();
}

uint64_t sub_24740D5F0()
{
  return MEMORY[0x270F821D8]();
}

uint64_t sub_24740D600()
{
  return MEMORY[0x270F823E0]();
}

uint64_t sub_24740D610()
{
  return MEMORY[0x270F823F8]();
}

uint64_t sub_24740D620()
{
  return MEMORY[0x270EE3848]();
}

uint64_t sub_24740D630()
{
  return MEMORY[0x270EE3878]();
}

uint64_t sub_24740D640()
{
  return MEMORY[0x270EE39B0]();
}

uint64_t sub_24740D650()
{
  return MEMORY[0x270EE39F8]();
}

uint64_t sub_24740D660()
{
  return MEMORY[0x270EE3B50]();
}

uint64_t sub_24740D670()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_24740D680()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_24740D690()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_24740D6A0()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_24740D6B0()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_24740D6C0()
{
  return MEMORY[0x270EE3D00]();
}

uint64_t sub_24740D6D0()
{
  return MEMORY[0x270EE3D10]();
}

uint64_t sub_24740D6E0()
{
  return MEMORY[0x270EE3D18]();
}

uint64_t sub_24740D6F0()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_24740D700()
{
  return MEMORY[0x270EE3D50]();
}

uint64_t sub_24740D710()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t sub_24740D720()
{
  return MEMORY[0x270EE3D98]();
}

uint64_t sub_24740D730()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_24740D740()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_24740D750()
{
  return MEMORY[0x270EE3E20]();
}

uint64_t sub_24740D760()
{
  return MEMORY[0x270EE3E28]();
}

uint64_t sub_24740D770()
{
  return MEMORY[0x270EE3E38]();
}

uint64_t sub_24740D780()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_24740D790()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t sub_24740D7A0()
{
  return MEMORY[0x270EE3EC0]();
}

uint64_t sub_24740D7B0()
{
  return MEMORY[0x270EE3EF8]();
}

uint64_t sub_24740D7C0()
{
  return MEMORY[0x270EE3F18]();
}

uint64_t sub_24740D7D0()
{
  return MEMORY[0x270EE3F20]();
}

uint64_t sub_24740D7E0()
{
  return MEMORY[0x270EE3F60]();
}

uint64_t sub_24740D7F0()
{
  return MEMORY[0x270EE3F68]();
}

uint64_t sub_24740D800()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_24740D810()
{
  return MEMORY[0x270EE3F90]();
}

uint64_t sub_24740D820()
{
  return MEMORY[0x270EE3FB0]();
}

uint64_t sub_24740D830()
{
  return MEMORY[0x270EE3FC0]();
}

uint64_t sub_24740D840()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_24740D850()
{
  return MEMORY[0x270EE3FE0]();
}

uint64_t sub_24740D860()
{
  return MEMORY[0x270EE3FE8]();
}

uint64_t sub_24740D870()
{
  return MEMORY[0x270EE3FF0]();
}

uint64_t sub_24740D880()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24740D890()
{
  return MEMORY[0x270EE4028]();
}

uint64_t sub_24740D8A0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24740D8B0()
{
  return MEMORY[0x270EFEDC8]();
}

uint64_t sub_24740D8C0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_24740D8D0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24740D8E0()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_24740D8F0()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_24740D900()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_24740D910()
{
  return MEMORY[0x270EFFD68]();
}

uint64_t sub_24740D920()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24740D930()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_24740D940()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_24740D950()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_24740D960()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_24740D970()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_24740D980()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24740D990()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24740D9A0()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_24740D9B0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24740D9C0()
{
  return MEMORY[0x270F014E8]();
}

uint64_t sub_24740D9D0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24740D9E0()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_24740D9F0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24740DA00()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24740DA10()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_24740DA20()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_24740DA30()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_24740DA40()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_24740DA50()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_24740DA60()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_24740DA70()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_24740DA80()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24740DA90()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24740DAA0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24740DAB0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24740DAC0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24740DAD0()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_24740DAE0()
{
  return MEMORY[0x270F03870]();
}

uint64_t sub_24740DAF0()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_24740DB00()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_24740DB10()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_24740DB20()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_24740DB30()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24740DB40()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_24740DB50()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24740DB60()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_24740DB70()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_24740DB80()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24740DB90()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24740DBA0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24740DBB0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24740DBC0()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24740DBD0()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_24740DBE0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24740DBF0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_24740DC00()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24740DC10()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24740DC20()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24740DC30()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24740DC40()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24740DC50()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24740DC60()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_24740DC70()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24740DC80()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24740DC90()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24740DCA0()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24740DCB0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24740DCC0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24740DCD0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24740DCE0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24740DCF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24740DD00()
{
  return MEMORY[0x270EF1B10]();
}

uint64_t sub_24740DD10()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24740DD20()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24740DD30()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24740DD40()
{
  return MEMORY[0x270EE4040]();
}

uint64_t sub_24740DD50()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24740DD60()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24740DD70()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24740DD80()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24740DD90()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24740DDA0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24740DDB0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24740DDC0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24740DDD0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24740DDE0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24740DDF0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24740DE00()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24740DE10()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24740DE20()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24740DE30()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24740DE40()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24740DE50()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24740DE60()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_24740DE70()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24740DE80()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24740DE90()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24740DEA0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24740DEB0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24740DEC0()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_24740DED0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24740DEE0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_24740DEF0()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_24740DF00()
{
  return MEMORY[0x270FA0CF0]();
}

uint64_t sub_24740DF10()
{
  return MEMORY[0x270FA0D20]();
}

uint64_t sub_24740DF20()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24740DF30()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24740DF40()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24740DF50()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24740DF60()
{
  return MEMORY[0x270F166A0]();
}

uint64_t sub_24740DF70()
{
  return MEMORY[0x270F166A8]();
}

uint64_t sub_24740DF80()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_24740DF90()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_24740DFA0()
{
  return MEMORY[0x270F826A8]();
}

uint64_t sub_24740DFB0()
{
  return MEMORY[0x270F826B0]();
}

uint64_t sub_24740DFC0()
{
  return MEMORY[0x270F188D0]();
}

uint64_t sub_24740DFD0()
{
  return MEMORY[0x270F826F0]();
}

uint64_t sub_24740DFE0()
{
  return MEMORY[0x270F826F8]();
}

uint64_t sub_24740DFF0()
{
  return MEMORY[0x270F82730]();
}

uint64_t sub_24740E000()
{
  return MEMORY[0x270F188D8]();
}

uint64_t sub_24740E010()
{
  return MEMORY[0x270F82868]();
}

uint64_t sub_24740E020()
{
  return MEMORY[0x270F828A8]();
}

uint64_t sub_24740E030()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24740E040()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24740E050()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_24740E060()
{
  return MEMORY[0x270F82978]();
}

uint64_t sub_24740E070()
{
  return MEMORY[0x270F82980]();
}

uint64_t sub_24740E080()
{
  return MEMORY[0x270F82988]();
}

uint64_t sub_24740E090()
{
  return MEMORY[0x270F82998]();
}

uint64_t sub_24740E0A0()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_24740E0B0()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_24740E0C0()
{
  return MEMORY[0x270F829C8]();
}

uint64_t sub_24740E0D0()
{
  return MEMORY[0x270F829D8]();
}

uint64_t sub_24740E0E0()
{
  return MEMORY[0x270F829F0]();
}

uint64_t sub_24740E0F0()
{
  return MEMORY[0x270F829F8]();
}

uint64_t sub_24740E100()
{
  return MEMORY[0x270F82A10]();
}

uint64_t sub_24740E110()
{
  return MEMORY[0x270F82A58]();
}

uint64_t sub_24740E120()
{
  return MEMORY[0x270F82A68]();
}

uint64_t sub_24740E130()
{
  return MEMORY[0x270F82A80]();
}

uint64_t sub_24740E140()
{
  return MEMORY[0x270F82AB0]();
}

uint64_t sub_24740E150()
{
  return MEMORY[0x270F82AD0]();
}

uint64_t sub_24740E160()
{
  return MEMORY[0x270F82AE8]();
}

uint64_t sub_24740E170()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_24740E180()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_24740E190()
{
  return MEMORY[0x270F82B10]();
}

uint64_t sub_24740E1A0()
{
  return MEMORY[0x270F82B18]();
}

uint64_t sub_24740E1B0()
{
  return MEMORY[0x270F82B28]();
}

uint64_t sub_24740E1C0()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_24740E1D0()
{
  return MEMORY[0x270F82B78]();
}

uint64_t sub_24740E1E0()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_24740E1F0()
{
  return MEMORY[0x270F82B90]();
}

uint64_t sub_24740E200()
{
  return MEMORY[0x270EE4050]();
}

uint64_t sub_24740E210()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24740E220()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24740E230()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24740E240()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24740E260()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24740E270()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24740E280()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24740E290()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24740E2A0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24740E2B0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_24740E2D0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24740E2E0()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_24740E2F0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24740E300()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24740E310()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_24740E320()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24740E330()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24740E340()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24740E350()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24740E360()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24740E370()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24740E380()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24740E390()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24740E3A0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24740E3B0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24740E3C0()
{
  return MEMORY[0x270F9EF48]();
}

uint64_t sub_24740E3D0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_24740E3E0()
{
  return MEMORY[0x270F9EF58]();
}

uint64_t sub_24740E3F0()
{
  return MEMORY[0x270F9EF70]();
}

uint64_t sub_24740E400()
{
  return MEMORY[0x270F9EF78]();
}

uint64_t sub_24740E410()
{
  return MEMORY[0x270F9EF80]();
}

uint64_t sub_24740E420()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_24740E430()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_24740E440()
{
  return MEMORY[0x270F9EFB8]();
}

uint64_t sub_24740E450()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_24740E460()
{
  return MEMORY[0x270F9EFD8]();
}

uint64_t sub_24740E470()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24740E480()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24740E490()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_24740E4A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24740E4B0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24740E4C0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24740E4D0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24740E4E0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24740E500()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24740E510()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24740E520()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24740E530()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24740E540()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24740E550()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24740E560()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24740E570()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24740E580()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24740E590()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24740E5A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24740E5B0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_24740E5D0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24740E5E0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24740E5F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24740E600()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24740E610()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24740E620()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24740E630()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24740E640()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24740E650()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24740E660()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24740E670()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24740E6A0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t ABLoadResourcesWithCompletion()
{
  return MEMORY[0x270F0A588]();
}

uint64_t ABReleaseResources()
{
  return MEMORY[0x270F0A590]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIImageIsSystemSymbol()
{
  return MEMORY[0x270F82FA8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

uint64_t swift_deallocBox()
{
  return MEMORY[0x270FA0220]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x270FA2468]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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