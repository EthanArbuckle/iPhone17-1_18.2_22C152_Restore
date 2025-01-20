uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t TypeByMangledNameInContext2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

id static EnergyWindowsCache.fetchRequest()()
{
  return sub_24D228DBC();
}

id sub_24D228DBC()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_24D229438();
}

char *keypath_get_selector_energyWindows()
{
  return sel_energyWindows;
}

void sub_24D228E1C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_energyWindows);
  *a2 = sub_24D2904E8();
  a2[1] = v3;
}

uint64_t sub_24D228E94(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v9);
  uint64_t v7 = v9[0];
  unint64_t v8 = v9[1];
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D2904C8();
  objc_msgSend(v5, sel_setEnergyWindows_);

  return sub_24D2293AC(v7, v8);
}

char *keypath_get_selector_gridID()
{
  return sel_gridID;
}

void sub_24D228F38(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_gridID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D228FB0(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setGridID_);

  return swift_bridgeObjectRelease();
}

char *keypath_get_selector_insertTime()
{
  return sel_insertTime;
}

void sub_24D229050(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_insertTime);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D22915C(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setInsertTime_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void *sub_24D229294(void *a1, void *a2)
{
  *a2 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  result = a2;
  a2[1] = v4;
  return result;
}

uint64_t *sub_24D2292D4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  sub_24D229320(*a1, v4);
  result = a2;
  *a2 = v3;
  a2[1] = v4;
  return result;
}

uint64_t sub_24D229320(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_retain();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_24D2293AC(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_release();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

id sub_24D229438()
{
  id v2 = (id)sub_24D290B78();
  id v3 = objc_msgSend(v1, sel_initWithEntityName_);

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24D229498()
{
  uint64_t v1 = sub_24D290AC8();
  __swift_allocate_value_buffer(v1, qword_26985EFB0);
  __swift_project_value_buffer(v1, (uint64_t)qword_26985EFB0);
  sub_24D290C08();
  sub_24D290C08();
  return sub_24D290AB8();
}

uint64_t sub_24D229540()
{
  if (qword_26985D4D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24D290AC8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26985EFB0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_24D229614()
{
  return sub_24D290C08();
}

BOOL sub_24D229648(uint64_t a1)
{
  return a1 != 0;
}

uint64_t sub_24D229690()
{
  return 0;
}

uint64_t sub_24D22969C()
{
  return sub_24D290FB8() & 1;
}

unint64_t sub_24D2296E8()
{
  uint64_t v2 = qword_26985D0D8;
  if (!qword_26985D0D8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D0D8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D229768()
{
  return sub_24D290C78();
}

uint64_t sub_24D2297A8()
{
  return sub_24D290C98();
}

uint64_t sub_24D2297F0()
{
  return sub_24D290C88();
}

BOOL sub_24D229838@<W0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_24D229648(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_24D229870@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24D229690();
  *a1 = result;
  return result;
}

uint64_t sub_24D22989C()
{
  return sub_24D229614();
}

uint64_t sub_24D2298B4(uint64_t a1)
{
  uint64_t v3 = a1;
  uint64_t v11 = 0;
  uint64_t v8 = sub_24D290AC8();
  uint64_t v4 = *(void *)(v8 - 8);
  uint64_t v5 = v8 - 8;
  unint64_t v2 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v7 = (char *)&v2 - v2;
  uint64_t v11 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = sub_24D229540();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v3, v8);
  id v9 = &v10;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v6, v7, v8);
  return swift_endAccess();
}

uint64_t sub_24D2299E0()
{
  return 0;
}

uint64_t sub_24D2299EC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    uint64_t v4 = sub_24D229540();
    swift_beginAccess();
    uint64_t v6 = sub_24D290AC8();
    uint64_t v5 = *(void *)(v6 - 8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, v4);
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v6);
  }
  else
  {
    uint64_t v2 = sub_24D290AC8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a2, 1);
  }
}

unint64_t sub_24D229B18()
{
  return sub_24D229B30();
}

unint64_t sub_24D229B30()
{
  uint64_t v2 = qword_26985D0E0;
  if (!qword_26985D0E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D0E0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D229BB8(unsigned __int8 *a1, int a2)
{
  if (a2)
  {
    int v6 = 1;
    if ((a2 + 1) >= 0x100)
    {
      if ((a2 + 1) >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v6 = v2;
    }
    if (v6 == 1)
    {
      int v5 = *a1;
    }
    else if (v6 == 2)
    {
      int v5 = *(unsigned __int16 *)a1;
    }
    else
    {
      int v5 = *(_DWORD *)a1;
    }
    if (v5) {
      int v4 = v5 - 1;
    }
    else {
      int v4 = -1;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

unsigned char *sub_24D229D4C(unsigned char *result, int a2, int a3)
{
  int v5 = 0;
  if (a3)
  {
    int v4 = 1;
    if ((a3 + 1) >= 0x100)
    {
      if ((a3 + 1) >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v4 = v3;
    }
    int v5 = v4;
  }
  if (a2)
  {
    if (v5)
    {
      if (v5 == 1)
      {
        uint64_t *result = a2;
      }
      else if (v5 == 2)
      {
        *(_WORD *)uint64_t result = a2;
      }
      else
      {
        *(_DWORD *)uint64_t result = a2;
      }
    }
  }
  else if (v5)
  {
    if (v5 == 1)
    {
      uint64_t *result = 0;
    }
    else if (v5 == 2)
    {
      *(_WORD *)uint64_t result = 0;
    }
    else
    {
      *(_DWORD *)uint64_t result = 0;
    }
  }
  return result;
}

uint64_t sub_24D229F5C()
{
  return 0;
}

void *type metadata accessor for Logging()
{
  return &unk_26FF7DA70;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  int v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_24D22A020()
{
  uint64_t result = sub_24D290C08();
  qword_26B18C098 = result;
  qword_26B18C0A0 = v1;
  return result;
}

uint64_t *sub_24D22A064()
{
  if (qword_26B18C0B0 != -1) {
    swift_once();
  }
  return &qword_26B18C098;
}

uint64_t static EnergyKitConstants.siteAddedKey.getter()
{
  uint64_t v1 = *sub_24D22A064();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D22A104()
{
  uint64_t result = sub_24D290C08();
  qword_26985D6F0 = result;
  qword_26985D6F8 = v1;
  return result;
}

uint64_t *sub_24D22A148()
{
  if (qword_26985D6E8 != -1) {
    swift_once();
  }
  return &qword_26985D6F0;
}

uint64_t static EnergyKitConstants.siteDeletedKey.getter()
{
  uint64_t v1 = *sub_24D22A148();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D22A1E8()
{
  uint64_t result = sub_24D290C08();
  qword_26B18C2D8 = result;
  qword_26B18C2E0 = v1;
  return result;
}

uint64_t *sub_24D22A22C()
{
  if (qword_26B18C2F0 != -1) {
    swift_once();
  }
  return &qword_26B18C2D8;
}

uint64_t static EnergyKitConstants.siteDistributedNotification.getter()
{
  uint64_t v1 = *sub_24D22A22C();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D22A2CC()
{
  uint64_t result = sub_24D290C08();
  qword_26B18C300 = result;
  qword_26B18C308 = v1;
  return result;
}

uint64_t *sub_24D22A310()
{
  if (qword_26B18C198 != -1) {
    swift_once();
  }
  return &qword_26B18C300;
}

uint64_t static EnergyKitConstants.gridForecastDistributedNotification.getter()
{
  uint64_t v1 = *sub_24D22A310();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D22A3B0()
{
  uint64_t result = sub_24D290C08();
  qword_26B18C2C8 = result;
  qword_26B18C2D0 = v1;
  return result;
}

uint64_t *sub_24D22A3F4()
{
  if (qword_26B18C180 != -1) {
    swift_once();
  }
  return &qword_26B18C2C8;
}

uint64_t static EnergyKitConstants.windowsUpdatedKey.getter()
{
  uint64_t v1 = *sub_24D22A3F4();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D22A494()
{
  uint64_t result = sub_24D290C08();
  qword_26B18C2B0 = result;
  qword_26B18C2B8 = v1;
  return result;
}

uint64_t *sub_24D22A4D8()
{
  if (qword_26B18C178 != -1) {
    swift_once();
  }
  return &qword_26B18C2B0;
}

uint64_t static EnergyKitConstants.locationUpdateKey.getter()
{
  uint64_t v1 = *sub_24D22A4D8();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D22A578()
{
  uint64_t result = sub_24D290C08();
  qword_26B18BC88 = result;
  qword_26B18BC90 = v1;
  return result;
}

uint64_t *sub_24D22A5BC()
{
  if (qword_26B18BCA0 != -1) {
    swift_once();
  }
  return &qword_26B18BC88;
}

uint64_t static EnergyKitConstants.energyDataRefreshNotification.getter()
{
  uint64_t v1 = *sub_24D22A5BC();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D22A65C()
{
  uint64_t result = sub_24D290C08();
  qword_26B18BCB0 = result;
  qword_26B18BCB8 = v1;
  return result;
}

uint64_t *sub_24D22A6A0()
{
  if (qword_26B18BCC8 != -1) {
    swift_once();
  }
  return &qword_26B18BCB0;
}

uint64_t static EnergyKitConstants.currentLocationUpdatedNotification.getter()
{
  uint64_t v1 = *sub_24D22A6A0();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D22A740()
{
  uint64_t result = sub_24D290C08();
  qword_26985D708 = result;
  qword_26985D710 = v1;
  return result;
}

uint64_t *sub_24D22A784()
{
  if (qword_26985D700 != -1) {
    swift_once();
  }
  return &qword_26985D708;
}

uint64_t static EnergyKitConstants.electricityDataDistributedNotification.getter()
{
  uint64_t v1 = *sub_24D22A784();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D22A824()
{
  sub_24D290C08();
  sub_24D290BD8();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  unsigned int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = has_internal_diagnostics;
  byte_26B18BC80 = has_internal_diagnostics & 1;
  return result;
}

char *sub_24D22A8BC()
{
  if (qword_26B18BC78 != -1) {
    swift_once();
  }
  return &byte_26B18BC80;
}

uint64_t static EnergyKitConstants.isInternalVariant.getter()
{
  return *sub_24D22A8BC() & 1;
}

id sub_24D22A940()
{
  sub_24D22A990();
  sub_24D290C08();
  id result = sub_24D22A9F8();
  qword_26B18C0C0 = (uint64_t)result;
  return result;
}

unint64_t sub_24D22A990()
{
  uint64_t v2 = qword_26B18BA60;
  if (!qword_26B18BA60)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26B18BA60);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_24D22A9F8()
{
  id v1 = (id)sub_24D290B78();
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleWithIdentifier_, v1);

  swift_bridgeObjectRelease();
  return v2;
}

uint64_t *sub_24D22AA64()
{
  if (qword_26B18C0B8 != -1) {
    swift_once();
  }
  return &qword_26B18C0C0;
}

void *static EnergyKitConstants.ekfBundle.getter()
{
  id v2 = (void *)*sub_24D22AA64();
  id v0 = v2;
  return v2;
}

uint64_t sub_24D22AAF8()
{
  uint64_t result = sub_24D290C08();
  qword_26985D720 = result;
  qword_26985D728 = v1;
  return result;
}

uint64_t *sub_24D22AB3C()
{
  if (qword_26985D718 != -1) {
    swift_once();
  }
  return &qword_26985D720;
}

uint64_t static EnergyKitConstants.dismissedConnectAccountBannerKey.getter()
{
  uint64_t v1 = *sub_24D22AB3C();
  swift_bridgeObjectRetain();
  return v1;
}

EnergyKitFoundation::EnergySiteSubscriptionErrorState_optional __swiftcall EnergySiteSubscriptionErrorState.init(rawValue:)(Swift::String rawValue)
{
  int v4 = v1;
  sub_24D290FA8();
  *(void *)uint64_t v2 = "expired";
  *(void *)(v2 + 8) = 7;
  *(unsigned char *)(v2 + 16) = 2;
  *(void *)(v2 + 24) = "disconnected";
  *(void *)(v2 + 32) = 12;
  *(unsigned char *)(v2 + 40) = 2;
  *(void *)(v2 + 48) = "loading";
  *(void *)(v2 + 56) = 7;
  *(unsigned char *)(v2 + 64) = 2;
  sub_24D22AD58();
  uint64_t v5 = sub_24D290EE8();
  swift_bridgeObjectRelease();
  if (v5)
  {
    if (v5 == 1)
    {
      char v6 = 1;
    }
    else
    {
      if (v5 != 2)
      {
        result.value = swift_bridgeObjectRelease();
        *int v4 = 3;
        return result;
      }
      char v6 = 2;
    }
  }
  else
  {
    char v6 = 0;
  }
  *int v4 = v6;
  return (EnergyKitFoundation::EnergySiteSubscriptionErrorState_optional)swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_24D22AD58()
{
}

uint64_t EnergySiteSubscriptionErrorState.rawValue.getter()
{
  return sub_24D290C08();
}

uint64_t sub_24D22AE70()
{
  return sub_24D290FB8() & 1;
}

unint64_t sub_24D22AEBC()
{
  uint64_t v2 = qword_26985D0E8;
  if (!qword_26985D0E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D0E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D22AF3C()
{
  return sub_24D290C78();
}

uint64_t sub_24D22AF7C()
{
  return sub_24D290C98();
}

uint64_t sub_24D22AFC4()
{
  return sub_24D290C88();
}

EnergyKitFoundation::EnergySiteSubscriptionErrorState_optional sub_24D22B00C(Swift::String *a1)
{
  return EnergySiteSubscriptionErrorState.init(rawValue:)(*a1);
}

uint64_t sub_24D22B030@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnergySiteSubscriptionErrorState.rawValue.getter();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_24D22B060()
{
  return sub_24D22B078();
}

unint64_t sub_24D22B078()
{
  uint64_t v2 = qword_26985D0F0;
  if (!qword_26985D0F0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D0F0);
    return WitnessTable;
  }
  return v2;
}

ValueMetadata *type metadata accessor for EnergyKitConstants()
{
  return &type metadata for EnergyKitConstants;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  uint64_t *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EnergySiteSubscriptionErrorState(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFD) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 2) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 3;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for EnergySiteSubscriptionErrorState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFD)
  {
    unsigned int v5 = ((a3 + 2) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFD)
  {
    unsigned int v4 = ((a2 - 254) >> 8) + 1;
    uint64_t *result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      uint64_t *result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_24D22B50C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24D22B514(unsigned char *result, char a2)
{
  uint64_t *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for EnergySiteSubscriptionErrorState()
{
  return &type metadata for EnergySiteSubscriptionErrorState;
}

void sub_24D22B530()
{
  *id v0 = *v0;
}

id static TOUPeaks.fetchRequest()()
{
  return sub_24D228DBC();
}

char *keypath_get_selector_tariffProfileID()
{
  return sel_tariffProfileID;
}

void sub_24D22B5C0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_tariffProfileID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D22B638(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setTariffProfileID_);

  return swift_bridgeObjectRelease();
}

char *keypath_get_selector_start()
{
  return sel_start;
}

void sub_24D22B6D8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  char v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_start);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D22B7E4(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setStart_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

char *keypath_get_selector_end()
{
  return sel_end;
}

void sub_24D22B928(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_end);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D22BA34(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setEnd_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

char *keypath_get_selector_peaks()
{
  return sel_peaks;
}

void sub_24D22BB78(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_peaks);
  *a2 = sub_24D2904E8();
  a2[1] = v3;
}

uint64_t sub_24D22BBF0(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v9);
  uint64_t v7 = v9[0];
  unint64_t v8 = v9[1];
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D2904C8();
  objc_msgSend(v5, sel_setPeaks_);

  return sub_24D2293AC(v7, v8);
}

char *keypath_get_selector_utilityID()
{
  return sel_utilityID;
}

void sub_24D22BC94(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_utilityID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D22BD0C(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setUtilityID_);

  return swift_bridgeObjectRelease();
}

char *keypath_get_selector_descriptor()
{
  return sel_descriptor;
}

void sub_24D22BDAC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_descriptor);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D22BE24(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setDescriptor_);

  return swift_bridgeObjectRelease();
}

id static EnergySiteRecords.fetchRequest()()
{
  return sub_24D228DBC();
}

char *keypath_get_selector_siteID()
{
  return sel_siteID;
}

void sub_24D22BF3C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_siteID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D22BFB4(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setSiteID_);

  return swift_bridgeObjectRelease();
}

char *keypath_get_selector_zoneName()
{
  return sel_zoneName;
}

void sub_24D22C054(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_zoneName);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D22C0CC(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setZoneName_);

  return swift_bridgeObjectRelease();
}

char *keypath_get_selector_metadata()
{
  return sel_metadata;
}

void sub_24D22C16C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_metadata);
  *a2 = sub_24D2904E8();
  a2[1] = v3;
}

uint64_t sub_24D22C1E4(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v9);
  uint64_t v7 = v9[0];
  unint64_t v8 = v9[1];
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D2904C8();
  objc_msgSend(v5, sel_setMetadata_);

  return sub_24D2293AC(v7, v8);
}

char *keypath_get_selector_creationDate()
{
  return sel_creationDate;
}

void sub_24D22C288(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_creationDate);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D22C394(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setCreationDate_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

id static UsageSummaryRecords.fetchRequest()()
{
  return sub_24D228DBC();
}

void sub_24D22C544(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  objc_msgSend(v4, sel_billLastPeriod);
  *a2 = v3;
}

void sub_24D22C59C(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setBillLastPeriod_, v4);
}

void sub_24D22C5F4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_creationDate);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D22C700(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setCreationDate_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D22C838(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_currency);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D22C8B0(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setCurrency_);

  return swift_bridgeObjectRelease();
}

void sub_24D22C944(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_end);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D22CA50(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setEnd_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D22CB88(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_items);
  *a2 = sub_24D2904E8();
  a2[1] = v3;
}

uint64_t sub_24D22CC00(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v9);
  uint64_t v7 = v9[0];
  unint64_t v8 = v9[1];
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D2904C8();
  objc_msgSend(v5, sel_setItems_);

  return sub_24D2293AC(v7, v8);
}

void sub_24D22CC98(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_recordID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D22CD10(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setRecordID_);

  return swift_bridgeObjectRelease();
}

void sub_24D22CDA4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_sourceTime);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D22CEB0(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setSourceTime_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D22CFE8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_start);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D22D0F4(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setStart_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D22D22C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_subscriptionID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D22D2A4(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setSubscriptionID_);

  return swift_bridgeObjectRelease();
}

void sub_24D22D338(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  objc_msgSend(v4, sel_totalConsumptionValue);
  *a2 = v3;
}

void sub_24D22D390(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setTotalConsumptionValue_, v4);
}

void sub_24D22D3E8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_usageSummaryID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D22D460(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setUsageSummaryID_);

  return swift_bridgeObjectRelease();
}

uint64_t UsageSummaryRecords.totalConsumptionUnitAsInt.getter()
{
  objc_msgSend(v0, sel_totalConsumptionUnit);
  sub_24D22D584();
  sub_24D22D600();
  sub_24D22D67C();
  sub_24D290CA8();
  return v2;
}

unint64_t sub_24D22D584()
{
  uint64_t v2 = qword_26985D0F8;
  if (!qword_26985D0F8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D0F8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D22D600()
{
  uint64_t v2 = qword_26985D100;
  if (!qword_26985D100)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D100);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D22D67C()
{
  uint64_t v2 = qword_26985D108;
  if (!qword_26985D108)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D108);
    return WitnessTable;
  }
  return v2;
}

void sub_24D22D6F8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = UsageSummaryRecords.totalConsumptionUnitAsInt.getter();
}

void sub_24D22D754(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  UsageSummaryRecords.totalConsumptionUnitAsInt.setter();
}

id UsageSummaryRecords.totalConsumptionUnitAsInt.setter()
{
  sub_24D22D844();
  sub_24D22D8C0();
  sub_24D22D93C();
  sub_24D290CA8();
  return objc_msgSend(v1, sel_setTotalConsumptionUnit_, v2);
}

unint64_t sub_24D22D844()
{
  uint64_t v2 = qword_26985D110;
  if (!qword_26985D110)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D110);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D22D8C0()
{
  uint64_t v2 = qword_26985D118;
  if (!qword_26985D118)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D118);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D22D93C()
{
  uint64_t v2 = qword_26985D120;
  if (!qword_26985D120)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D120);
    return WitnessTable;
  }
  return v2;
}

id (*UsageSummaryRecords.totalConsumptionUnitAsInt.modify(uint64_t *a1))()
{
  a1[1] = v1;
  *a1 = UsageSummaryRecords.totalConsumptionUnitAsInt.getter();
  return sub_24D22DA14;
}

id sub_24D22DA14()
{
  return UsageSummaryRecords.totalConsumptionUnitAsInt.setter();
}

char *keypath_get_selector_billLastPeriod()
{
  return sel_billLastPeriod;
}

char *keypath_get_selector_currency()
{
  return sel_currency;
}

char *keypath_get_selector_items()
{
  return sel_items;
}

char *keypath_get_selector_recordID()
{
  return sel_recordID;
}

char *keypath_get_selector_sourceTime()
{
  return sel_sourceTime;
}

char *keypath_get_selector_subscriptionID()
{
  return sel_subscriptionID;
}

char *keypath_get_selector_totalConsumptionValue()
{
  return sel_totalConsumptionValue;
}

char *keypath_get_selector_usageSummaryID()
{
  return sel_usageSummaryID;
}

id UsagePointRecords.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id UsagePointRecords.init(entity:insertInto:)(void *a1, void *a2)
{
  id v10 = 0;
  id v9 = a1;
  id v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for UsagePointRecords();
  id v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  id v2 = v6;
  id v10 = v6;

  return v6;
}

uint64_t type metadata accessor for UsagePointRecords()
{
  return self;
}

id UsagePointRecords.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UsagePointRecords();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void String.ekISO8601Date(timezone:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v13 = a4;
  uint64_t v47 = a1;
  uint64_t v55 = a2;
  uint64_t v56 = a3;
  v64 = 0;
  uint64_t v63 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  id v60 = 0;
  uint64_t v25 = 0;
  uint64_t v14 = sub_24D290638();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = v14 - 8;
  unint64_t v17 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  v18 = (char *)v12 - v17;
  unint64_t v19 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25);
  v20 = (char *)v12 - v19;
  uint64_t v52 = sub_24D290838();
  uint64_t v50 = *(void *)(v52 - 8);
  uint64_t v51 = v52 - 8;
  unint64_t v21 = (*(void *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25);
  v53 = (char *)v12 - v21;
  uint64_t v35 = sub_24D2906E8();
  uint64_t v32 = *(void *)(v35 - 8);
  uint64_t v33 = v35 - 8;
  unint64_t v22 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25);
  v34 = (char *)v12 - v22;
  uint64_t v39 = sub_24D290818();
  uint64_t v37 = *(void *)(v39 - 8);
  uint64_t v38 = v39 - 8;
  unint64_t v23 = (*(void *)(v37 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v25);
  v40 = (char *)v12 - v23;
  unint64_t v24 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  v36 = (char *)v12 - v24;
  v64 = (char *)v12 - v24;
  uint64_t v29 = sub_24D2906D8();
  uint64_t v27 = *(void *)(v29 - 8);
  uint64_t v28 = v29 - 8;
  unint64_t v26 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25);
  v30 = (char *)v12 - v26;
  uint64_t v63 = v6;
  uint64_t v61 = v7;
  uint64_t v62 = v8;
  sub_24D22E4A4();
  id v57 = sub_24D22E50C();
  id v60 = v57;
  int v44 = 1;
  sub_24D290C08();
  sub_24D2906B8();
  id v31 = (id)sub_24D2906C8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v29);
  objc_msgSend(v57, sel_setLocale_, v31);

  (*(void (**)(char *, void, uint64_t))(v32 + 104))(v34, *MEMORY[0x263F07740], v35);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v35);
  v49 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
  uint64_t v48 = v50 + 16;
  v49(v53, v47, v52);
  sub_24D2907E8();
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v40, v36, v39);
  id v9 = (void *)sub_24D290778();
  id v10 = v53;
  id v43 = v9;
  v41 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v42 = v37 + 8;
  v41(v40, v39);
  objc_msgSend(v57, sel_setCalendar_, v43);

  sub_24D290C08();
  uint64_t v45 = v11;
  id v46 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v57, sel_setDateFormat_, v46);

  v49(v10, v47, v52);
  id v54 = (id)sub_24D290828();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v52);
  objc_msgSend(v57, sel_setTimeZone_, v54);

  swift_bridgeObjectRetain();
  id v58 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  id v59 = objc_msgSend(v57, sel_dateFromString_, v58);

  if (v59)
  {
    v12[1] = v59;
    v12[0] = v59;
    sub_24D2905F8();
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v18, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v20, 0, 1, v14);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v20, 1, 1, v14);
  }
  sub_24D22E53C(v20, v13);
  v41(v36, v39);
}

unint64_t sub_24D22E4A4()
{
  uint64_t v2 = qword_26985D128;
  if (!qword_26985D128)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26985D128);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_24D22E50C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_24D22E664();
}

void *sub_24D22E53C(const void *a1, void *a2)
{
  uint64_t v6 = sub_24D290638();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

id sub_24D22E664()
{
  return objc_msgSend(v0, sel_init);
}

id LocalLoadEvents.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id LocalLoadEvents.init(entity:insertInto:)(void *a1, void *a2)
{
  id v10 = 0;
  id v9 = a1;
  uint64_t v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for LocalLoadEvents();
  id v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  id v2 = v6;
  id v10 = v6;

  return v6;
}

uint64_t type metadata accessor for LocalLoadEvents()
{
  return self;
}

id LocalLoadEvents.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocalLoadEvents();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_24D22E844()
{
  sub_24D22E888();
  id result = sub_24D22E8F0();
  qword_26985D8B8 = (uint64_t)result;
  return result;
}

unint64_t sub_24D22E888()
{
  uint64_t v2 = qword_26B18BC20;
  if (!qword_26B18BC20)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26B18BC20);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_24D22E8F0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_24D22F43C();
}

uint64_t *sub_24D22E938()
{
  if (qword_26985D8B0 != -1) {
    swift_once();
  }
  return &qword_26985D8B8;
}

void *static EKLocation.sanFrancisco.getter()
{
  uint64_t v2 = (void *)*sub_24D22E938();
  id v0 = v2;
  return v2;
}

id sub_24D22E9CC()
{
  sub_24D22E888();
  id result = sub_24D22E8F0();
  qword_26985D8C8 = (uint64_t)result;
  return result;
}

uint64_t *sub_24D22EA10()
{
  if (qword_26985D8C0 != -1) {
    swift_once();
  }
  return &qword_26985D8C8;
}

void *static EKLocation.applePark.getter()
{
  uint64_t v2 = (void *)*sub_24D22EA10();
  id v0 = v2;
  return v2;
}

id sub_24D22EAA4()
{
  sub_24D22E888();
  id result = sub_24D22E8F0();
  qword_26985D8D8 = (uint64_t)result;
  return result;
}

uint64_t *sub_24D22EAE8()
{
  if (qword_26985D8D0 != -1) {
    swift_once();
  }
  return &qword_26985D8D8;
}

void *static EKLocation.losAngeles.getter()
{
  uint64_t v2 = (void *)*sub_24D22EAE8();
  id v0 = v2;
  return v2;
}

id sub_24D22EB7C()
{
  sub_24D22E888();
  id result = sub_24D22E8F0();
  qword_26985D8E8 = (uint64_t)result;
  return result;
}

uint64_t *sub_24D22EBC0()
{
  if (qword_26985D8E0 != -1) {
    swift_once();
  }
  return &qword_26985D8E8;
}

void *static EKLocation.newYork.getter()
{
  uint64_t v2 = (void *)*sub_24D22EBC0();
  id v0 = v2;
  return v2;
}

id sub_24D22EC54()
{
  sub_24D22E888();
  id result = sub_24D22E8F0();
  qword_26985D8F8 = (uint64_t)result;
  return result;
}

uint64_t *sub_24D22EC98()
{
  if (qword_26985D8F0 != -1) {
    swift_once();
  }
  return &qword_26985D8F8;
}

void *static EKLocation.washingtonDC.getter()
{
  uint64_t v2 = (void *)*sub_24D22EC98();
  id v0 = v2;
  return v2;
}

id sub_24D22ED2C()
{
  sub_24D22E888();
  id result = sub_24D22E8F0();
  qword_26985D908 = (uint64_t)result;
  return result;
}

uint64_t *sub_24D22ED70()
{
  if (qword_26985D900 != -1) {
    swift_once();
  }
  return &qword_26985D908;
}

void *static EKLocation.westLafayette.getter()
{
  uint64_t v2 = (void *)*sub_24D22ED70();
  id v0 = v2;
  return v2;
}

uint64_t sub_24D22EE04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985D130);
  uint64_t v21 = sub_24D290FA8();
  unint64_t v19 = v0;
  *id v0 = sub_24D290C08();
  v19[1] = v1;
  uint64_t v14 = (void *)*sub_24D22E938();
  id v2 = v14;
  v19[2] = (uint64_t)v14;
  v19[3] = sub_24D290C08();
  v19[4] = v3;
  uint64_t v15 = (void *)*sub_24D22EA10();
  id v4 = v15;
  v19[5] = (uint64_t)v15;
  v19[6] = sub_24D290C08();
  v19[7] = v5;
  uint64_t v16 = (void *)*sub_24D22EAE8();
  id v6 = v16;
  v19[8] = (uint64_t)v16;
  v19[9] = sub_24D290C08();
  v19[10] = v7;
  unint64_t v17 = (void *)*sub_24D22EBC0();
  id v8 = v17;
  v19[11] = (uint64_t)v17;
  v19[12] = sub_24D290C08();
  v19[13] = v9;
  v18 = (void *)*sub_24D22EC98();
  id v10 = v18;
  v19[14] = (uint64_t)v18;
  v19[15] = sub_24D290C08();
  v19[16] = v11;
  v20 = (void *)*sub_24D22ED70();
  id v12 = v20;
  uint64_t result = v21;
  v19[17] = (uint64_t)v20;
  sub_24D22AD58();
  qword_26985D918 = v21;
  return result;
}

uint64_t *sub_24D22EFF8()
{
  if (qword_26985D910 != -1) {
    swift_once();
  }
  return &qword_26985D918;
}

uint64_t static EKLocation.staticLocations.getter()
{
  uint64_t v1 = *sub_24D22EFF8();
  swift_bridgeObjectRetain();
  return v1;
}

id sub_24D22F08C()
{
  sub_24D22E888();
  id result = sub_24D22E8F0();
  qword_26B18C310 = (uint64_t)result;
  return result;
}

uint64_t *sub_24D22F0D0()
{
  if (qword_26B18C188 != -1) {
    swift_once();
  }
  return &qword_26B18C310;
}

id static EKLocation.invalidLocation.getter()
{
  id v2 = (id *)sub_24D22F0D0();
  swift_beginAccess();
  id v3 = *v2;
  id v0 = *v2;
  swift_endAccess();
  return v3;
}

void static EKLocation.invalidLocation.setter(void *a1)
{
  id v3 = sub_24D22F0D0();
  id v1 = a1;
  swift_beginAccess();
  id v2 = (void *)*v3;
  *id v3 = (uint64_t)a1;

  swift_endAccess();
}

uint64_t (*static EKLocation.invalidLocation.modify())()
{
  return sub_24D22F264;
}

uint64_t sub_24D22F264()
{
  return swift_endAccess();
}

BOOL static EKLocation.isInvalid(location:)(void *a1)
{
  objc_msgSend(a1, sel_coordinate);
  return !CLLocationCoordinate2DIsValid(v2);
}

uint64_t static EKLocation.safeLog(_:)(void *a1)
{
  id v1 = a1;
  if (!a1) {
    return sub_24D290C08();
  }
  static EKLocation.isInvalid(location:)(a1);
  uint64_t v4 = sub_24D290C08();

  return v4;
}

ValueMetadata *type metadata accessor for EKLocation()
{
  return &type metadata for EKLocation;
}

id sub_24D22F43C()
{
  return objc_msgSend(v0, sel_initWithLatitude_longitude_);
}

double RankingData.total.getter()
{
  return *(double *)v0;
}

void RankingData.total.setter(double a1)
{
  *id v1 = a1;
}

void (*RankingData.total.modify())()
{
  return sub_24D22F4D8;
}

uint64_t RankingData.rankTotals.getter()
{
  uint64_t v2 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t RankingData.rankTotals.setter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  *(void *)(v1 + 8) = a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*RankingData.rankTotals.modify())()
{
  return sub_24D22F4D8;
}

EnergyKitFoundation::RankingData __swiftcall RankingData.init(total:rankTotals:)(Swift::Double total, Swift::OpaquePointer rankTotals)
{
  uint64_t v8 = v2;
  rawValue = 0;
  Swift::Double v9 = total;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  rawValue = rankTotals._rawValue;
  *(Swift::Double *)uint64_t v8 = total;
  *(Swift::OpaquePointer *)(v8 + 8) = rankTotals;
  swift_bridgeObjectRelease();
  id v3 = &v9;
  sub_24D22F624();
  result.total = v4;
  result.rankTotals._rawValue = v3;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_24D22F624()
{
}

BOOL sub_24D22F650(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t sub_24D22F6D4()
{
  return sub_24D290FF8();
}

uint64_t sub_24D22F754()
{
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v3 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v2 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    char v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_24D22F8F4()
{
  return 2;
}

uint64_t sub_24D22F90C()
{
  return sub_24D290E68();
}

unint64_t sub_24D22F968()
{
  uint64_t v2 = qword_26985D920;
  if (!qword_26985D920)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D920);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D22F9E8()
{
  return 0;
}

uint64_t sub_24D22FA0C()
{
  return sub_24D290C08();
}

BOOL sub_24D22FA98(unsigned char *a1, unsigned char *a2)
{
  return sub_24D22F650(*a1 & 1, *a2 & 1);
}

uint64_t sub_24D22FAC4()
{
  return sub_24D22F90C();
}

uint64_t sub_24D22FAE4()
{
  return sub_24D22F6D4();
}

uint64_t sub_24D22FB04()
{
  return sub_24D290B48();
}

uint64_t sub_24D22FB1C()
{
  return sub_24D22FA0C();
}

uint64_t sub_24D22FB3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24D22F754();
  *a1 = result;
  return result;
}

uint64_t sub_24D22FB68()
{
  return sub_24D22F9E8();
}

uint64_t sub_24D22FB8C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24D22F8F4();
  *a1 = result;
  return result;
}

uint64_t sub_24D22FBB8()
{
  return sub_24D291038();
}

unint64_t sub_24D22FBE8()
{
  uint64_t v2 = qword_26985D928[0];
  if (!qword_26985D928[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_26985D928);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D22FC68()
{
  return sub_24D291048();
}

uint64_t RankingData.encode(to:)(uint64_t a1)
{
  uint64_t v7 = a1;
  unint64_t v24 = 0;
  unint64_t v23 = 0;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D138);
  uint64_t v8 = *(void *)(v16 - 8);
  uint64_t v9 = v16 - 8;
  unint64_t v10 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = (char *)v5 - v10;
  unint64_t v24 = (void *)MEMORY[0x270FA5388](v7);
  uint64_t v15 = *v1;
  uint64_t v11 = v1[1];
  unint64_t v23 = v1;
  uint64_t v12 = v24[3];
  uint64_t v13 = v24[4];
  __swift_project_boxed_opaque_existential_1(v24, v12);
  sub_24D22FBE8();
  sub_24D291028();
  uint64_t v2 = v17;
  char v22 = 0;
  sub_24D290F38();
  uint64_t v18 = v2;
  uint64_t v19 = v2;
  if (v2)
  {
    v5[1] = v19;
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v14, v16);
  }
  else
  {
    swift_bridgeObjectRetain();
    v5[5] = &v21;
    uint64_t v21 = v11;
    v5[3] = &v20;
    char v20 = 1;
    v5[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D140);
    sub_24D22FF94();
    uint64_t v3 = v18;
    sub_24D290F48();
    v5[6] = v3;
    uint64_t v6 = v3;
    if (v3) {
      v5[0] = v6;
    }
    sub_24D230030();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v14, v16);
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

unint64_t sub_24D22FF94()
{
  uint64_t v2 = qword_26985D148;
  if (!qword_26985D148)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26985D140);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D148);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_24D230030()
{
}

uint64_t RankingData.init(from:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v22 = a2;
  uint64_t v23 = a1;
  uint64_t v37 = 0;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D150);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = v24 - 8;
  unint64_t v27 = (*(void *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v28 = (char *)&v9 - v27;
  uint64_t v37 = (void *)MEMORY[0x270FA5388](v23);
  uint64_t v30 = v37[3];
  uint64_t v31 = v37[4];
  __swift_project_boxed_opaque_existential_1(v37, v30);
  sub_24D22FBE8();
  uint64_t v2 = v29;
  sub_24D291018();
  uint64_t v32 = v2;
  uint64_t v33 = v2;
  if (v2)
  {
    uint64_t v11 = v33;
  }
  else
  {
    char v36 = 0;
    sub_24D290F08();
    uint64_t v19 = 0;
    uint64_t v20 = v3;
    uint64_t v21 = 0;
    uint64_t v14 = v3;
    v38[0] = v3;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D140);
    uint64_t v15 = &v34;
    char v34 = 1;
    sub_24D2303E8();
    uint64_t v4 = v19;
    sub_24D290F18();
    uint64_t v17 = v4;
    uint64_t v18 = v4;
    if (!v4)
    {
      uint64_t v12 = v35;
      uint64_t v13 = v38;
      swift_bridgeObjectRetain();
      v38[1] = v12;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
      uint64_t v5 = v22;
      uint64_t v6 = v12;
      uint64_t v7 = v23;
      *char v22 = v14;
      v5[1] = v6;
      __swift_destroy_boxed_opaque_existential_1(v7);
      uint64_t result = (uint64_t)v13;
      sub_24D22F624();
      return result;
    }
    uint64_t v10 = v18;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
    uint64_t v11 = v10;
  }
  uint64_t v9 = v11;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

unint64_t sub_24D2303E8()
{
  uint64_t v2 = qword_26985D158;
  if (!qword_26985D158)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26985D140);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D158);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D230484@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return RankingData.init(from:)(a1, a2);
}

uint64_t sub_24D2304DC(uint64_t a1)
{
  return RankingData.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for RankingData(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[1] = v4;
  return result;
}

uint64_t destroy for RankingData()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RankingData(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for RankingData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for RankingData(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v4 = *(_OWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (*(void *)(a1 + 8) < 0x100000000uLL) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for RankingData(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)__n128 result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RankingData()
{
  return &type metadata for RankingData;
}

uint64_t sub_24D230998(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_24D230B48(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    void *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      void *result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_24D230D8C(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_24D230D98(unsigned char *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

void *type metadata accessor for RankingData.CodingKeys()
{
  return &unk_26FF7DC50;
}

unint64_t sub_24D230DBC()
{
  return sub_24D230DD4();
}

unint64_t sub_24D230DD4()
{
  uint64_t v2 = qword_26985DBB0;
  if (!qword_26985DBB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985DBB0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D230E54()
{
  return sub_24D230E6C();
}

unint64_t sub_24D230E6C()
{
  uint64_t v2 = qword_26985DBB8[0];
  if (!qword_26985DBB8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_26985DBB8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D230EEC()
{
  return sub_24D230F04();
}

unint64_t sub_24D230F04()
{
  uint64_t v2 = qword_26985DC40[0];
  if (!qword_26985DC40[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_26985DC40);
    return WitnessTable;
  }
  return v2;
}

const char *EnergyKitFeatures.domain.getter()
{
  return "HomeEnergy";
}

const char *EnergyKitFeatures.feature.getter()
{
  switch(*v0)
  {
    case 1:
      uint64_t v2 = "utility2024";
      break;
    case 2:
      uint64_t v2 = "insights2024";
      break;
    case 3:
      uint64_t v2 = "gridforecast2024";
      break;
    case 4:
      uint64_t v2 = "sharing2024";
      break;
    case 5:
      uint64_t v2 = "utilityNotification2024";
      break;
    default:
      uint64_t v2 = "home2023";
      break;
  }
  return v2;
}

BOOL static EnergyKitFeatures.== infix(_:_:)(unsigned char *a1, unsigned char *a2)
{
  switch(*a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    case 4:
      uint64_t v4 = 4;
      break;
    case 5:
      uint64_t v4 = 5;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(*a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    case 4:
      uint64_t v3 = 4;
      break;
    case 5:
      uint64_t v3 = 5;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t EnergyKitFeatures.hash(into:)()
{
  return sub_24D290FF8();
}

uint64_t EnergyKitFeatures.hashValue.getter()
{
  return sub_24D290E68();
}

unint64_t sub_24D2313E8()
{
  uint64_t v2 = qword_26985D160;
  if (!qword_26985D160)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D160);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_24D231468(unsigned char *a1, unsigned char *a2)
{
  return static EnergyKitFeatures.== infix(_:_:)(a1, a2);
}

uint64_t sub_24D231484()
{
  return EnergyKitFeatures.hashValue.getter();
}

uint64_t sub_24D23149C()
{
  return EnergyKitFeatures.hash(into:)();
}

const char *sub_24D2314B4()
{
  return EnergyKitFeatures.domain.getter();
}

const char *sub_24D2314CC()
{
  return EnergyKitFeatures.feature.getter();
}

unint64_t sub_24D2314E4()
{
  return sub_24D2314FC();
}

unint64_t sub_24D2314FC()
{
  uint64_t v2 = qword_26985D168;
  if (!qword_26985D168)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D168);
    return WitnessTable;
  }
  return v2;
}

uint64_t getEnumTagSinglePayload for EnergyKitFeatures(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFA) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 5) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 250;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 6;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for EnergyKitFeatures(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFA)
  {
    unsigned int v5 = ((a3 + 5) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFA)
  {
    unsigned int v4 = ((a2 - 251) >> 8) + 1;
    void *result = a2 + 5;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      void *result = a2 + 5;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EnergyKitFeatures()
{
  return &type metadata for EnergyKitFeatures;
}

id IntervalBlocks.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id IntervalBlocks.init(entity:insertInto:)(void *a1, void *a2)
{
  id v10 = 0;
  uint64_t v9 = a1;
  int v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for IntervalBlocks();
  id v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  id v2 = v6;
  id v10 = v6;

  return v6;
}

uint64_t type metadata accessor for IntervalBlocks()
{
  return self;
}

uint64_t sub_24D231AF4()
{
  return 1;
}

uint64_t sub_24D231B34()
{
  return 1;
}

uint64_t sub_24D231B4C()
{
  return 0;
}

uint64_t sub_24D231B58()
{
  return sub_24D290C08();
}

uint64_t sub_24D231B84()
{
  return sub_24D231B58();
}

uint64_t sub_24D231B9C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24D231AF4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24D231BD0()
{
  return sub_24D231B4C();
}

uint64_t sub_24D231BEC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24D231B34();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24D231C20()
{
  return sub_24D291038();
}

unint64_t sub_24D231C50()
{
  uint64_t v2 = qword_26985DDD0[0];
  if (!qword_26985DDD0[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_26985DDD0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D231CD0()
{
  return sub_24D291048();
}

id IntervalBlocks.__deallocating_deinit()
{
  int v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntervalBlocks();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D231D4C(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v13 = 0;
  uint64_t v12 = 0;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D170);
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v5 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v10 = (char *)&v3 - v5;
  uint64_t v13 = (void *)MEMORY[0x270FA5388](v4);
  uint64_t v12 = v1;
  uint64_t v6 = v13[3];
  uint64_t v7 = v13[4];
  __swift_project_boxed_opaque_existential_1(v13, v6);
  sub_24D231C50();
  sub_24D291028();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v11);
}

uint64_t sub_24D231E6C()
{
  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x263F8EED0]) + 0x50))();
}

uint64_t method lookup function for IntervalBlocks()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IntervalBlocks.encode(to:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x50))();
}

void *type metadata accessor for IntervalBlocks.CodingKeys()
{
  return &unk_26FF7DD00;
}

unint64_t sub_24D231F88()
{
  return sub_24D231FA0();
}

unint64_t sub_24D231FA0()
{
  uint64_t v2 = qword_26985DF60;
  if (!qword_26985DF60)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985DF60);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D232020()
{
  return sub_24D232038();
}

unint64_t sub_24D232038()
{
  uint64_t v2 = qword_26985DF68[0];
  if (!qword_26985DF68[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_26985DF68);
    return WitnessTable;
  }
  return v2;
}

id EnergySiteRecords.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id EnergySiteRecords.init(entity:insertInto:)(void *a1, void *a2)
{
  id v10 = 0;
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for EnergySiteRecords();
  id v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  id v2 = v6;
  id v10 = v6;

  return v6;
}

uint64_t type metadata accessor for EnergySiteRecords()
{
  return self;
}

id EnergySiteRecords.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EnergySiteRecords();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static EnergyWindowNotifications.fetchRequest()()
{
  return sub_24D228DBC();
}

char *keypath_get_selector_url()
{
  return sel_url;
}

void sub_24D2322F8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v9 = *a1;
  id v2 = *a1;
  id v10 = objc_msgSend(v9, sel_url);
  if (v10)
  {
    uint64_t v4 = sub_24D290B88();
    uint64_t v5 = v3;

    uint64_t v6 = v4;
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;
}

void sub_24D2323CC(void *a1, id *a2)
{
  sub_24D229294(a1, v8);
  uint64_t v7 = v8[1];
  id v6 = *a2;
  id v2 = *a2;
  if (v7)
  {
    uint64_t v4 = sub_24D290B78();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setUrl_, v4);
  }
  else
  {
    objc_msgSend(v6, sel_setUrl_, 0);
  }
}

char *keypath_get_selector_recurring()
{
  return sel_recurring;
}

void sub_24D2324B8(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  objc_msgSend(v3, sel_recurring);
  *a2 = sub_24D290868() & 1;
}

void sub_24D23252C(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setRecurring_, sub_24D290858() & 1);
}

char *keypath_get_selector_lastWindowWasClean()
{
  return sel_lastWindowWasClean;
}

void sub_24D2325A4(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  objc_msgSend(v3, sel_lastWindowWasClean);
  *a2 = sub_24D290868() & 1;
}

void sub_24D232618(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setLastWindowWasClean_, sub_24D290858() & 1);
}

char *keypath_get_selector_dispatched()
{
  return sel_dispatched;
}

void sub_24D232690(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  objc_msgSend(v3, sel_dispatched);
  *a2 = sub_24D290868() & 1;
}

void sub_24D232704(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setDispatched_, sub_24D290858() & 1);
}

char *keypath_get_selector_body()
{
  return sel_body;
}

void sub_24D23277C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_body);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D2327F4(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setBody_);

  return swift_bridgeObjectRelease();
}

char *keypath_get_selector_title()
{
  return sel_title;
}

void sub_24D232894(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_title);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D23290C(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setTitle_);

  return swift_bridgeObjectRelease();
}

char *keypath_get_selector_homeID()
{
  return sel_homeID;
}

void sub_24D2329AC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v9 = *a1;
  id v2 = *a1;
  id v10 = objc_msgSend(v9, sel_homeID);
  if (v10)
  {
    uint64_t v4 = sub_24D290B88();
    uint64_t v5 = v3;

    uint64_t v6 = v4;
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;
}

void sub_24D232A80(void *a1, id *a2)
{
  sub_24D229294(a1, v8);
  uint64_t v7 = v8[1];
  id v6 = *a2;
  id v2 = *a2;
  if (v7)
  {
    uint64_t v4 = sub_24D290B78();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setHomeID_, v4);
  }
  else
  {
    objc_msgSend(v6, sel_setHomeID_, 0);
  }
}

id static EnergyWindowsTracker.fetchRequest()()
{
  return sub_24D228DBC();
}

char *keypath_get_selector_lastAccessed()
{
  return sel_lastAccessed;
}

void sub_24D232BE4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_lastAccessed);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D232CF0(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setLastAccessed_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

uint64_t static NSCoding<>.unsecureUnarchived(from:)(uint64_t a1, unint64_t a2)
{
  sub_24D229320(a1, a2);
  sub_24D290E08();
  sub_24D290848();
  sub_24D2293AC(a1, a2);
  if (v6) {
    return v3;
  }
  else {
    return v7;
  }
}

void sub_24D232F44(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  sub_24D2331B0();
  sub_24D229320(a1, a2);
  id v14 = sub_24D233218(a1, a2);
  if (!v13)
  {
    objc_msgSend(v14, sel_setRequiresSecureCoding_, 0);
    id v7 = (id)*MEMORY[0x263F081D0];
    id v3 = (id)*MEMORY[0x263F081D0];
    sub_24D290B88();
    id v8 = (id)sub_24D290DA8();
    swift_bridgeObjectRelease();

    id v4 = v14;
    id v9 = objc_msgSend(v14, sel_error);
    if (v9) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      swift_willThrow();
    }
    else
    {
      id v5 = v8;
      *a3 = v8;
    }
  }
}

void sub_24D233170(void *a1@<X8>)
{
  sub_24D232F44(*(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

unint64_t sub_24D2331B0()
{
  uint64_t v2 = qword_26985D178;
  if (!qword_26985D178)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26985D178);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_24D233218(uint64_t a1, unint64_t a2)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v8 = sub_24D2332A4(a1, a2);
  if (v6) {
    return (id)v4;
  }
  else {
    return v8;
  }
}

id sub_24D2332A4(uint64_t a1, unint64_t a2)
{
  id v8 = (void *)sub_24D2904C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985D180);
  sub_24D233440();
  sub_24D290FC8();
  id v9 = objc_msgSend(v7, sel_initForReadingFromData_error_, v8, v10);
  id v2 = 0;

  if (v9)
  {

    sub_24D2293AC(a1, a2);
    return v9;
  }
  else
  {
    sub_24D2904A8();

    swift_willThrow();
    sub_24D2293AC(a1, a2);
    return (id)v4;
  }
}

unint64_t sub_24D233440()
{
  uint64_t v2 = qword_26985D188;
  if (!qword_26985D188)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26985D180);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D188);
    return WitnessTable;
  }
  return v2;
}

void *sub_24D2334C4()
{
  return &unk_24D291DA0;
}

double static EKDateUtilities.oneMinute.getter()
{
  return 60.0;
}

void *sub_24D2334DC()
{
  return &unk_24D291DA8;
}

double static EKDateUtilities.fiveMinutes.getter()
{
  return 300.0;
}

void *sub_24D2334F4()
{
  return &unk_24D291DB0;
}

double static EKDateUtilities.fifteenMinutes.getter()
{
  return 900.0;
}

void *sub_24D23350C()
{
  return &unk_24D291DB8;
}

double static EKDateUtilities.oneHour.getter()
{
  return 3600.0;
}

void *sub_24D233524()
{
  return &unk_24D291DC0;
}

double static EKDateUtilities.sixHours.getter()
{
  return 21600.0;
}

void *sub_24D23353C()
{
  return &unk_24D291DC8;
}

double static EKDateUtilities.approximatelyOneYear.getter()
{
  return 31536000.0;
}

void *sub_24D233554()
{
  return &unk_24D291DD0;
}

double static EKDateUtilities.approximatelyOneMonth.getter()
{
  return 2592000.0;
}

void *sub_24D23356C()
{
  return &unk_24D291DD8;
}

double static EKDateUtilities.approximatelyOneWeek.getter()
{
  return 604800.0;
}

void *sub_24D233584()
{
  return &unk_24D291DE0;
}

double static EKDateUtilities.approximatelyOneDay.getter()
{
  return 86400.0;
}

uint64_t static EKDateUtilities.startOfDay(for:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v20 = a2;
  char v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v9 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v8 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  char v22 = (char *)&v7 - v8;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v10 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v16 = (char *)&v7 - v10;
  uint64_t v29 = sub_24D290818();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  uint64_t v12 = *(void *)(v25 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v16);
  unint64_t v27 = (char *)&v7 - v11;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v7 - v13;
  char v34 = (char *)&v7 - v13;
  uint64_t v33 = v24;
  uint64_t v32 = v5;
  (*(void (**)(uint64_t, void))(v14 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v27, v28, v29);
  sub_24D290708();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v25 + 8);
  uint64_t v30 = v25 + 8;
  v31(v27, v29);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v29);
}

uint64_t static EKDateUtilities.endOfDay(for:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v20 = a2;
  char v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v9 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v8 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  char v22 = (char *)&v7 - v8;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v10 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v16 = (char *)&v7 - v10;
  uint64_t v29 = sub_24D290818();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  uint64_t v12 = *(void *)(v25 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v16);
  uint64_t v27 = (uint64_t)&v7 - v11;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v7 - v13;
  char v34 = (char *)&v7 - v13;
  uint64_t v33 = v24;
  uint64_t v32 = v5;
  (*(void (**)(uint64_t, void))(v14 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v27, v28, v29);
  static EKDateUtilities.endOfDay(for:with:)(v24, v27, v23);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  uint64_t v30 = v25 + 8;
  v31(v27, v29);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v29);
}

uint64_t static EKDateUtilities.endOfDay(for:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v6[1] = a3;
  uint64_t v12 = a1;
  v6[2] = "Fatal error";
  v6[3] = "Unexpectedly found nil while unwrapping an Optional value";
  v6[4] = "EnergyKitFoundation/EKDateUtilities.swift";
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  uint64_t v8 = 0;
  uint64_t v16 = sub_24D2907F8();
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v14 = v16 - 8;
  unint64_t v7 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v16);
  uint64_t v15 = (char *)v6 - v7;
  unint64_t v9 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D190) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v19 = (char *)v6 - v9;
  uint64_t v20 = sub_24D2903C8();
  uint64_t v17 = *(void *)(v20 - 8);
  uint64_t v18 = v20 - 8;
  unint64_t v10 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v15);
  unint64_t v11 = (char *)v6 - v10;
  uint64_t v23 = (char *)v6 - v10;
  uint64_t v22 = v12;
  uint64_t v21 = a2;
  (*(void (**)(uint64_t, void))(v13 + 104))(v4, *MEMORY[0x263F07870]);
  sub_24D290718();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v19, 1, v20) == 1)
  {
    sub_24D290EB8();
    __break(1u);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v11, v19, v20);
  sub_24D290398();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v11, v20);
}

uint64_t static EKDateUtilities.startOfHour(for:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v20 = a2;
  char v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v9 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v8 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v22 = (char *)&v7 - v8;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v10 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v16 = (char *)&v7 - v10;
  uint64_t v29 = sub_24D290818();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  uint64_t v12 = *(void *)(v25 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v16);
  uint64_t v27 = (uint64_t)&v7 - v11;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v7 - v13;
  char v34 = (char *)&v7 - v13;
  uint64_t v33 = v24;
  uint64_t v32 = v5;
  (*(void (**)(uint64_t, void))(v14 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v27, v28, v29);
  static EKDateUtilities.startOfHour(for:with:)(v24, v27, v23);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  uint64_t v30 = v25 + 8;
  v31(v27, v29);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v29);
}

uint64_t static EKDateUtilities.startOfHour(for:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v6[1] = a3;
  uint64_t v12 = a1;
  v6[2] = "Fatal error";
  v6[3] = "Unexpectedly found nil while unwrapping an Optional value";
  v6[4] = "EnergyKitFoundation/EKDateUtilities.swift";
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  uint64_t v8 = 0;
  uint64_t v16 = sub_24D2907F8();
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v14 = v16 - 8;
  unint64_t v7 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v16);
  uint64_t v15 = (char *)v6 - v7;
  unint64_t v9 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D190) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v19 = (char *)v6 - v9;
  uint64_t v20 = sub_24D2903C8();
  uint64_t v17 = *(void *)(v20 - 8);
  uint64_t v18 = v20 - 8;
  unint64_t v10 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v15);
  unint64_t v11 = (char *)v6 - v10;
  uint64_t v23 = (char *)v6 - v10;
  uint64_t v22 = v12;
  uint64_t v21 = a2;
  (*(void (**)(uint64_t, void))(v13 + 104))(v4, *MEMORY[0x263F07890]);
  sub_24D290718();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v19, 1, v20) == 1)
  {
    sub_24D290EB8();
    __break(1u);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v11, v19, v20);
  sub_24D2903A8();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v11, v20);
}

uint64_t static EKDateUtilities.startOfWeek(for:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v20 = a2;
  char v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v9 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v8 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v22 = (char *)&v7 - v8;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v10 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v16 = (char *)&v7 - v10;
  uint64_t v29 = sub_24D290818();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  uint64_t v12 = *(void *)(v25 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v16);
  uint64_t v27 = (uint64_t)&v7 - v11;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v7 - v13;
  char v34 = (char *)&v7 - v13;
  uint64_t v33 = v24;
  uint64_t v32 = v5;
  (*(void (**)(uint64_t, void))(v14 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v27, v28, v29);
  static EKDateUtilities.startOfWeek(for:with:)(v24, v27, v23);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  uint64_t v30 = v25 + 8;
  v31(v27, v29);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v29);
}

uint64_t static EKDateUtilities.startOfWeek(for:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v9[0] = a3;
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  v9[1] = "Fatal error";
  uint64_t v9[2] = "Unexpectedly found nil while unwrapping an Optional value";
  v9[3] = "EnergyKitFoundation/EKDateUtilities.swift";
  uint64_t v35 = 0;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
  unint64_t v10 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v29 = (char *)v9 - v10;
  uint64_t v28 = 0;
  uint64_t v11 = sub_24D290468();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v11 - 8;
  unint64_t v14 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v28);
  uint64_t v27 = (char *)v9 - v14;
  uint64_t v35 = (char *)v9 - v14;
  uint64_t v34 = v5;
  uint64_t v33 = a2;
  uint64_t v22 = sub_24D2907F8();
  uint64_t v21 = sub_24D290FA8();
  uint64_t v18 = v6;
  uint64_t v15 = *(void *)(v22 - 8);
  uint64_t v16 = v22 - 8;
  uint64_t v20 = *(void (**)(void))(v15 + 104);
  uint64_t v19 = v15 + 104;
  v20();
  uint64_t v17 = *(void *)(v15 + 72);
  ((void (*)(uint64_t, void, uint64_t))v20)(v18 + v17, *MEMORY[0x263F07860], v22);
  ((void (*)(uint64_t, void, uint64_t))v20)(v18 + 2 * v17, *MEMORY[0x263F07830], v22);
  uint64_t v7 = v21;
  sub_24D22AD58();
  uint64_t v23 = v7;
  sub_24D23A384();
  uint64_t v26 = sub_24D290D48();
  sub_24D290748();
  swift_bridgeObjectRelease();
  sub_24D290798();
  uint64_t v30 = sub_24D290638();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = v30 - 8;
  if ((*(unsigned int (**)(char *, uint64_t))(v31 + 48))(v29, 1) == 1)
  {
    sub_24D290EB8();
    __break(1u);
  }
  (*(void (**)(void, char *, uint64_t))(v31 + 32))(v9[0], v29, v30);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v27, v11);
}

uint64_t static EKDateUtilities.startOfMondayForWeek(containing:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v20 = a2;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v9 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v8 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v22 = (char *)&v7 - v8;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v10 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v16 = (char *)&v7 - v10;
  uint64_t v29 = sub_24D290818();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  uint64_t v12 = *(void *)(v25 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v16);
  uint64_t v27 = (uint64_t)&v7 - v11;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v7 - v13;
  uint64_t v34 = (char *)&v7 - v13;
  uint64_t v33 = v24;
  uint64_t v32 = v5;
  (*(void (**)(uint64_t, void))(v14 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v27, v28, v29);
  static EKDateUtilities.startOfMondayForWeek(containing:with:)(v24, v27, v23);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  uint64_t v30 = v25 + 8;
  v31(v27, v29);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v29);
}

uint64_t static EKDateUtilities.startOfMondayForWeek(containing:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v63 = a3;
  uint64_t v110 = a1;
  uint64_t v64 = a2;
  v65 = "Assertion failed";
  v66 = "EnergyKitFoundation/EKDateUtilities.swift";
  v127 = 0;
  v126 = 0;
  v125 = 0;
  v124 = 0;
  uint64_t v123 = 0;
  uint64_t v122 = 0;
  uint64_t v97 = 0;
  uint64_t v67 = sub_24D290638();
  uint64_t v68 = *(void *)(v67 - 8);
  uint64_t v69 = v67 - 8;
  unint64_t v70 = (*(void *)(v68 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](0);
  v71 = (char *)v49 - v70;
  unint64_t v72 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  v73 = (char *)v49 - v72;
  v127 = (char *)v49 - v72;
  uint64_t v74 = sub_24D290768();
  uint64_t v75 = *(void *)(v74 - 8);
  uint64_t v76 = v74 - 8;
  unint64_t v77 = (*(void *)(v75 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v97);
  uint64_t v78 = (uint64_t)v49 - v77;
  uint64_t v79 = sub_24D290758();
  uint64_t v80 = *(void *)(v79 - 8);
  uint64_t v81 = v79 - 8;
  unint64_t v82 = (*(void *)(v80 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v97);
  v83 = (char *)v49 - v82;
  uint64_t v84 = sub_24D290728();
  uint64_t v85 = *(void *)(v84 - 8);
  uint64_t v86 = v84 - 8;
  unint64_t v87 = (*(void *)(v85 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v84);
  v88 = (char *)v49 - v87;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
  unint64_t v89 = (*(void *)(*(void *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  v90 = (char *)v49 - v89;
  unint64_t v91 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v49 - v89);
  v92 = (char *)v49 - v91;
  v126 = (char *)v49 - v91;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A0);
  unint64_t v93 = (*(void *)(*(void *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  v94 = (char *)v49 - v93;
  unint64_t v95 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v97);
  v96 = (char *)v49 - v95;
  uint64_t v98 = sub_24D290468();
  uint64_t v99 = *(void *)(v98 - 8);
  uint64_t v100 = v98 - 8;
  uint64_t v104 = *(void *)(v99 + 64);
  unint64_t v101 = (v104 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v97);
  v102 = (char *)v49 - v101;
  unint64_t v103 = (v104 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v105 = (char *)v49 - v103;
  v125 = (char *)v49 - v103;
  unint64_t v106 = (v104 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  v111 = (char *)v49 - v106;
  v124 = (char *)v49 - v106;
  uint64_t v123 = v11;
  uint64_t v122 = a2;
  uint64_t v108 = sub_24D2907F8();
  uint64_t v107 = sub_24D290FA8();
  (*(void (**)(uint64_t, void))(*(void *)(v108 - 8) + 104))(v12, *MEMORY[0x263F078E8]);
  uint64_t v13 = v107;
  sub_24D22AD58();
  uint64_t v109 = v13;
  sub_24D23A384();
  uint64_t v112 = sub_24D290D48();
  sub_24D290748();
  swift_bridgeObjectRelease();
  uint64_t v118 = sub_24D290438();
  char v119 = v14 & 1;
  uint64_t v120 = 2;
  char v121 = 0;
  if (!((v14 & 1) == 0 && (sub_24D23A5E0((uint64_t)&v118, (uint64_t)&v113), (v121 & 1) == 0) && v113 == v120))
  {
    uint64_t v56 = 0;
    uint64_t v15 = *(void (**)(char *, uint64_t))(*(void *)(sub_24D290818() - 8) + 56);
    unsigned int v61 = 1;
    v15(v96, 1);
    uint64_t v16 = sub_24D290838();
    (*(void (**)(char *, void))(*(void *)(v16 - 8) + 56))(v94, v61);
    id v57 = &v27;
    uint64_t v27 = 0;
    int v58 = 1;
    char v28 = 1;
    uint64_t v29 = 0;
    char v30 = 1;
    uint64_t v31 = 0;
    char v32 = 1;
    uint64_t v33 = 0;
    char v34 = 1;
    uint64_t v35 = 0;
    char v36 = 1;
    uint64_t v37 = 0;
    char v38 = 1;
    uint64_t v39 = 0;
    char v40 = 1;
    uint64_t v41 = 0;
    char v42 = 1;
    uint64_t v43 = 0;
    char v44 = 1;
    uint64_t v45 = 0;
    char v46 = 1;
    uint64_t v47 = 0;
    LOBYTE(v48) = 1;
    sub_24D290458();
    sub_24D290448();
    (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v102, v105, v98);
    (*(void (**)(char *, void, uint64_t))(v85 + 104))(v88, *MEMORY[0x263F07780], v84);
    (*(void (**)(char *, void, uint64_t))(v80 + 104))(v83, *MEMORY[0x263F077F0], v79);
    sub_24D235D48(v78);
    sub_24D2907D8();
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v78, v74);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v83, v79);
    (*(void (**)(char *, uint64_t))(v85 + 8))(v88, v84);
    id v59 = *(void (**)(char *, uint64_t))(v99 + 8);
    uint64_t v60 = v99 + 8;
    v59(v102, v98);
    sub_24D23A408(v92, v90);
    if ((*(unsigned int (**)(char *, void, uint64_t))(v68 + 48))(v90, v61, v67) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v73, v90, v67);
      (*(void (**)(uint64_t, char *, uint64_t))(v68 + 16))(v63, v73, v67);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v73, v67);
      sub_24D23A530((uint64_t)v92);
      v59(v105, v98);
      return ((uint64_t (*)(char *, uint64_t))v59)(v111, v98);
    }
    sub_24D23A530((uint64_t)v90);
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v71, v110, v67);
    v49[3] = 61;
    uint64_t v18 = sub_24D290F98();
    v53 = &v116;
    uint64_t v116 = v18;
    uint64_t v117 = v19;
    uint64_t v51 = "";
    v49[9] = 0;
    int v50 = 1;
    sub_24D290C08();
    v49[1] = v20;
    sub_24D290F88();
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_24D290C08();
    v49[2] = v115;
    v115[0] = v21;
    v115[1] = v22;
    v49[7] = MEMORY[0x263F8D310];
    v49[5] = MEMORY[0x263F8D378];
    v49[6] = MEMORY[0x263F8D370];
    sub_24D290F78();
    sub_24D22F624();
    sub_24D290C08();
    v49[4] = v23;
    sub_24D290F88();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_24D290628();
    v49[8] = v114;
    v114[0] = v24;
    v114[1] = v25;
    sub_24D290F78();
    sub_24D22F624();
    sub_24D290C08();
    uint64_t v52 = v26;
    sub_24D290F88();
    swift_bridgeObjectRelease();
    uint64_t v55 = v116;
    uint64_t v54 = v117;
    swift_bridgeObjectRetain();
    sub_24D22F624();
    sub_24D290BE8();
    uint64_t v47 = 159;
    int v48 = 0;
    sub_24D290EC8();
    __break(1u);
  }
  sub_24D290708();
  return (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v111, v98);
}

uint64_t sub_24D235D48@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *MEMORY[0x263F07800];
  uint64_t v1 = sub_24D290768();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t static EKDateUtilities.startOfMonth(for:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v20 = a2;
  char v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v9 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v8 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v22 = (char *)&v7 - v8;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v10 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v16 = (char *)&v7 - v10;
  uint64_t v29 = sub_24D290818();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  uint64_t v12 = *(void *)(v25 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v16);
  uint64_t v27 = (uint64_t)&v7 - v11;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  char v28 = (char *)&v7 - v13;
  char v34 = (char *)&v7 - v13;
  uint64_t v33 = v24;
  uint64_t v32 = v5;
  (*(void (**)(uint64_t, void))(v14 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v27, v28, v29);
  static EKDateUtilities.startOfMonth(for:with:)(v24, v27, v23);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  uint64_t v30 = v25 + 8;
  v31(v27, v29);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v29);
}

uint64_t static EKDateUtilities.startOfMonth(for:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a3;
  uint64_t v12 = a1;
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  uint64_t v8 = 0;
  uint64_t v16 = sub_24D2907F8();
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v14 = v16 - 8;
  unint64_t v7 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v16);
  uint64_t v15 = (char *)&v6 - v7;
  unint64_t v9 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D190) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v19 = (uint64_t)&v6 - v9;
  uint64_t v20 = sub_24D2903C8();
  uint64_t v17 = *(void *)(v20 - 8);
  uint64_t v18 = v20 - 8;
  unint64_t v10 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v15);
  unint64_t v11 = (char *)&v6 - v10;
  uint64_t v23 = (char *)&v6 - v10;
  uint64_t v22 = v12;
  uint64_t v21 = a2;
  (*(void (**)(uint64_t, void))(v13 + 104))(v4, *MEMORY[0x263F078A8]);
  sub_24D290718();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v16);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v19, 1, v20) == 1)
  {
    sub_24D23A5FC(v19);
    return sub_24D2905D8();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v11, v19, v20);
    sub_24D2903A8();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v11, v20);
  }
}

uint64_t static EKDateUtilities.endOfMonth(for:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v20 = a2;
  char v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v9 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v8 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v22 = (char *)&v7 - v8;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v10 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v16 = (char *)&v7 - v10;
  uint64_t v29 = sub_24D290818();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  uint64_t v12 = *(void *)(v25 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v16);
  uint64_t v27 = (uint64_t)&v7 - v11;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  char v28 = (char *)&v7 - v13;
  char v34 = (char *)&v7 - v13;
  uint64_t v33 = v24;
  uint64_t v32 = v5;
  (*(void (**)(uint64_t, void))(v14 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v27, v28, v29);
  static EKDateUtilities.endOfMonth(for:with:)(v24, v27, v23);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  uint64_t v30 = v25 + 8;
  v31(v27, v29);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v29);
}

uint64_t static EKDateUtilities.endOfMonth(for:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v6[1] = a3;
  uint64_t v12 = a1;
  v6[2] = "Fatal error";
  v6[3] = "Unexpectedly found nil while unwrapping an Optional value";
  v6[4] = "EnergyKitFoundation/EKDateUtilities.swift";
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  uint64_t v8 = 0;
  uint64_t v16 = sub_24D2907F8();
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v14 = v16 - 8;
  unint64_t v7 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v16);
  uint64_t v15 = (char *)v6 - v7;
  unint64_t v9 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D190) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v19 = (char *)v6 - v9;
  uint64_t v20 = sub_24D2903C8();
  uint64_t v17 = *(void *)(v20 - 8);
  uint64_t v18 = v20 - 8;
  unint64_t v10 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v15);
  unint64_t v11 = (char *)v6 - v10;
  uint64_t v23 = (char *)v6 - v10;
  uint64_t v22 = v12;
  uint64_t v21 = a2;
  (*(void (**)(uint64_t, void))(v13 + 104))(v4, *MEMORY[0x263F078A8]);
  sub_24D290718();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v19, 1, v20) == 1)
  {
    sub_24D290EB8();
    __break(1u);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v11, v19, v20);
  sub_24D290398();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v11, v20);
}

uint64_t static EKDateUtilities.endOf6Month(for:in:ignoreDay:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v23 = a4;
  uint64_t v25 = a1;
  uint64_t v20 = a2;
  int v24 = a3;
  char v36 = 0;
  uint64_t v35 = 0;
  uint64_t v34 = 0;
  char v33 = 0;
  uint64_t v10 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v9 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v22 = (char *)&v9 - v9;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v11 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v16 = (char *)&v9 - v11;
  uint64_t v30 = sub_24D290818();
  uint64_t v26 = *(void *)(v30 - 8);
  uint64_t v27 = v30 - 8;
  uint64_t v13 = *(void *)(v26 + 64);
  unint64_t v12 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v16);
  uint64_t v28 = (uint64_t)&v9 - v12;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v29 = (char *)&v9 - v6;
  char v36 = (char *)&v9 - v6;
  uint64_t v35 = v25;
  uint64_t v34 = v7;
  char v33 = v24 & 1;
  (*(void (**)(uint64_t, void))(v14 + 104))(v5, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v28, v29, v30);
  static EKDateUtilities.endOf6Month(for:with:ignoreDay:)(v25, v28, v24 & 1, v23);
  uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  uint64_t v31 = v26 + 8;
  v32(v28, v30);
  return ((uint64_t (*)(char *, uint64_t))v32)(v29, v30);
}

uint64_t static EKDateUtilities.endOf6Month(for:with:ignoreDay:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v19 = a4;
  uint64_t v12 = a1;
  uint64_t v20 = a2;
  int v21 = a3;
  char v33 = 0;
  uint64_t v32 = 0;
  uint64_t v31 = 0;
  uint64_t v30 = 0;
  char v29 = 0;
  uint64_t v10 = 0;
  uint64_t v18 = sub_24D2907F8();
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  unint64_t v11 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v17 = (uint64_t)&v10 - v11;
  uint64_t v26 = sub_24D290638();
  uint64_t v22 = *(void *)(v26 - 8);
  uint64_t v23 = v26 - 8;
  unint64_t v13 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v12);
  uint64_t v24 = (uint64_t)&v10 - v13;
  char v33 = (char *)&v10 - v13;
  unint64_t v14 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v25 = (uint64_t)&v10 - v14;
  uint64_t v32 = (char *)&v10 - v14;
  uint64_t v31 = v6;
  uint64_t v30 = v7;
  char v29 = v8 & 1;
  static EKDateUtilities.startOf6Month(for:with:ignoreDay:)(v6, v7, v8 & 1, (uint64_t)&v10 - v14);
  (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F078A8], v18);
  static EKDateUtilities.advance(date:by:interval:with:)(v25, 7, v17, v20, v24);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v18);
  static EKDateUtilities.startOf6Month(for:with:ignoreDay:)(v24, v20, v21 & 1, v19);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  uint64_t v27 = v22 + 8;
  v28(v24, v26);
  return ((uint64_t (*)(uint64_t, uint64_t))v28)(v25, v26);
}

uint64_t static EKDateUtilities.startOf6Month(for:with:ignoreDay:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v78 = a4;
  uint64_t v138 = a1;
  uint64_t v79 = a2;
  int v118 = a3;
  uint64_t v80 = "Fatal error";
  uint64_t v81 = "Unexpectedly found nil while unwrapping an Optional value";
  unint64_t v82 = "EnergyKitFoundation/EKDateUtilities.swift";
  v157 = 0;
  v156 = 0;
  v155 = 0;
  v154 = 0;
  v153 = 0;
  uint64_t v152 = 0;
  uint64_t v151 = 0;
  char v150 = 0;
  uint64_t v115 = 0;
  uint64_t v135 = sub_24D2907F8();
  uint64_t v129 = *(void *)(v135 - 8);
  uint64_t v130 = v135 - 8;
  unint64_t v83 = (*(void *)(v129 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v84 = (uint64_t)&v53 - v83;
  uint64_t v85 = sub_24D290768();
  uint64_t v86 = *(void *)(v85 - 8);
  uint64_t v87 = v85 - 8;
  unint64_t v88 = (*(void *)(v86 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v115);
  uint64_t v89 = (uint64_t)&v53 - v88;
  uint64_t v90 = sub_24D290758();
  uint64_t v91 = *(void *)(v90 - 8);
  uint64_t v92 = v90 - 8;
  unint64_t v93 = (*(void *)(v91 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v115);
  v94 = (char *)&v53 - v93;
  uint64_t v95 = sub_24D290728();
  uint64_t v96 = *(void *)(v95 - 8);
  uint64_t v97 = v95 - 8;
  unint64_t v98 = (*(void *)(v96 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v95);
  uint64_t v99 = (char *)&v53 - v98;
  unint64_t v100 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v115);
  unint64_t v101 = (char *)&v53 - v100;
  unint64_t v102 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5);
  unint64_t v103 = (char *)&v53 - v102;
  uint64_t v104 = sub_24D290638();
  uint64_t v105 = *(void *)(v104 - 8);
  uint64_t v106 = v104 - 8;
  unint64_t v107 = (*(void *)(v105 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v104);
  uint64_t v108 = (uint64_t)&v53 - v107;
  v157 = (char *)&v53 - v107;
  unint64_t v109 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v110 = (char *)&v53 - v109;
  v156 = (char *)&v53 - v109;
  unint64_t v111 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v112 = (char *)&v53 - v111;
  v155 = (char *)&v53 - v111;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A0);
  unint64_t v113 = (*(void *)(*(void *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11);
  v114 = (char *)&v53 - v113;
  unint64_t v116 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v115);
  uint64_t v117 = (char *)&v53 - v116;
  uint64_t v119 = sub_24D290468();
  uint64_t v120 = *(void *)(v119 - 8);
  uint64_t v121 = v119 - 8;
  unint64_t v122 = (*(void *)(v120 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v138);
  uint64_t v123 = (char *)&v53 - v122;
  unint64_t v124 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v125 = (char *)&v53 - v124;
  unint64_t v126 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v127 = (char *)&v53 - v126;
  v154 = (char *)&v53 - v126;
  unint64_t v128 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v139 = (char *)&v53 - v128;
  v153 = (char *)&v53 - v128;
  uint64_t v152 = v18;
  uint64_t v151 = a2;
  int v141 = 1;
  char v150 = v19 & 1;
  uint64_t v134 = sub_24D290FA8();
  uint64_t v131 = v20;
  v133 = *(void (**)(void))(v129 + 104);
  uint64_t v132 = v129 + 104;
  v133();
  ((void (*)(uint64_t, void, uint64_t))v133)(v131 + *(void *)(v129 + 72), *MEMORY[0x263F078A8], v135);
  uint64_t v21 = v134;
  sub_24D22AD58();
  uint64_t v136 = v21;
  unint64_t v137 = sub_24D23A384();
  uint64_t v140 = sub_24D290D48();
  sub_24D290748();
  swift_bridgeObjectRelease();
  uint64_t v147 = sub_24D290418();
  if (v22 & 1 & v141) {
    uint64_t v149 = 1;
  }
  else {
    uint64_t v149 = v147;
  }
  if (v149 <= 6) {
    int v76 = 0;
  }
  else {
    int v77 = 0;
  }
  sub_24D290428();
  sub_24D290448();
  uint64_t v68 = 0;
  uint64_t v23 = *(void (**)(char *, uint64_t))(*(void *)(sub_24D290818() - 8) + 56);
  unsigned int v73 = 1;
  v23(v117, 1);
  uint64_t v24 = sub_24D290838();
  (*(void (**)(char *, void))(*(void *)(v24 - 8) + 56))(v114, v73);
  uint64_t v69 = sub_24D290408();
  int v70 = v25;
  sub_24D290418();
  v71 = &v31;
  uint64_t v31 = 1;
  char v32 = 0;
  uint64_t v33 = 0;
  int v72 = 1;
  char v34 = 1;
  uint64_t v35 = 0;
  char v36 = 1;
  uint64_t v37 = 0;
  char v38 = 1;
  uint64_t v39 = 0;
  char v40 = 1;
  uint64_t v41 = 0;
  char v42 = 1;
  uint64_t v43 = 0;
  char v44 = 1;
  uint64_t v45 = 0;
  char v46 = 1;
  uint64_t v47 = 0;
  char v48 = 1;
  uint64_t v49 = 0;
  LOBYTE(v50) = 1;
  uint64_t v51 = 0;
  char v52 = 1;
  sub_24D290458();
  sub_24D290798();
  uint64_t v74 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v105 + 48);
  uint64_t v75 = v105 + 48;
  if (v74(v103, v73, v104) == 1)
  {
    LOBYTE(v49) = 2;
    uint64_t v50 = 303;
    LODWORD(v51) = 0;
    sub_24D290EB8();
    __break(1u);
  }
  uint64_t v60 = *(void (**)(char *, char *, uint64_t))(v105 + 32);
  uint64_t v61 = v105 + 32;
  v60(v112, v103, v104);
  uint64_t v62 = sub_24D290FA8();
  ((void (*)(uint64_t, void, uint64_t))v133)(v26, *MEMORY[0x263F078E8], v135);
  sub_24D22AD58();
  uint64_t v63 = sub_24D290D48();
  sub_24D290748();
  swift_bridgeObjectRelease();
  uint64_t v66 = sub_24D290438();
  int v67 = v27;
  uint64_t v64 = *(void (**)(char *, uint64_t))(v120 + 8);
  uint64_t v65 = v120 + 8;
  v64(v125, v119);
  uint64_t v143 = v66;
  char v144 = v67 & 1;
  uint64_t v145 = 2;
  char v146 = 0;
  if ((v67 & 1) == 0 && (sub_24D23A5E0((uint64_t)&v143, (uint64_t)&v142), (v146 & 1) == 0) && v142 == v145)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v105 + 16))(v78, v112, v104);
    (*(void (**)(char *, uint64_t))(v105 + 8))(v112, v104);
    v64(v127, v119);
    return ((uint64_t (*)(char *, uint64_t))v64)(v139, v119);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v123, v139, v119);
    (*(void (**)(char *, void, uint64_t))(v96 + 104))(v99, *MEMORY[0x263F07780], v95);
    (*(void (**)(char *, void, uint64_t))(v91 + 104))(v94, *MEMORY[0x263F077E0], v90);
    sub_24D235D48(v89);
    sub_24D2907D8();
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v89, v85);
    (*(void (**)(char *, uint64_t))(v91 + 8))(v94, v90);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v99, v95);
    v64(v123, v119);
    if (v74(v101, 1, v104) == 1)
    {
      LOBYTE(v49) = 2;
      uint64_t v50 = 317;
      LODWORD(v51) = 0;
      sub_24D290EB8();
      __break(1u);
    }
    v60(v110, v101, v104);
    if (v118)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v105 + 16))(v78, v110, v104);
      int v58 = *(void (**)(char *, uint64_t))(v105 + 8);
      uint64_t v57 = v105 + 8;
      v58(v110, v104);
      v58(v112, v104);
      v64(v127, v119);
      return ((uint64_t (*)(char *, uint64_t))v64)(v139, v119);
    }
    else
    {
      if (sub_24D2905C8())
      {
        ((void (*)(uint64_t, void, uint64_t))v133)(v84, *MEMORY[0x263F07870], v135);
        static EKDateUtilities.advance(date:by:interval:with:)(v138, -7, v84, v79, v108);
        (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v84, v135);
        char v30 = sub_24D2299E0();
        static EKDateUtilities.startOf6Month(for:with:ignoreDay:)(v108, v79, v30 & 1);
        uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v105 + 8);
        uint64_t v55 = v105 + 8;
        v56(v108, v104);
        v56((uint64_t)v110, v104);
        v56((uint64_t)v112, v104);
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v105 + 16))(v78, v110, v104);
        uint64_t v54 = *(void (**)(char *, uint64_t))(v105 + 8);
        uint64_t v53 = v105 + 8;
        v54(v110, v104);
        v54(v112, v104);
      }
      v64(v127, v119);
      return ((uint64_t (*)(char *, uint64_t))v64)(v139, v119);
    }
  }
}

uint64_t static EKDateUtilities.advance(date:by:interval:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v14 = a5;
  uint64_t v21 = a1;
  uint64_t v20 = a2;
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  uint64_t v15 = "Fatal error";
  uint64_t v16 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v17 = "EnergyKitFoundation/EKDateUtilities.swift";
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  unint64_t v22 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v23 = (char *)&v10 - v22;
  uint64_t v27 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = v5;
  uint64_t v25 = v6;
  uint64_t v24 = v7;
  if (v5)
  {
    sub_24D2299E0();
    HIDWORD(v10) = 1;
    sub_24D2907A8();
    uint64_t v11 = sub_24D290638();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = v11 - 8;
    if ((*(unsigned int (**)(char *, void))(v12 + 48))(v23, HIDWORD(v10)) == 1)
    {
      sub_24D290EB8();
      __break(1u);
    }
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(v14, v23, v11);
  }
  else
  {
    uint64_t v9 = sub_24D290638();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v14, v21);
  }
}

uint64_t static EKDateUtilities.startOf6Month(for:in:ignoreDay:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v23 = a4;
  uint64_t v25 = a1;
  uint64_t v20 = a2;
  int v24 = a3;
  char v36 = 0;
  uint64_t v35 = 0;
  uint64_t v34 = 0;
  char v33 = 0;
  uint64_t v10 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v9 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  unint64_t v22 = (char *)&v9 - v9;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v11 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v16 = (char *)&v9 - v11;
  uint64_t v30 = sub_24D290818();
  uint64_t v26 = *(void *)(v30 - 8);
  uint64_t v27 = v30 - 8;
  uint64_t v13 = *(void *)(v26 + 64);
  unint64_t v12 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v16);
  uint64_t v28 = (uint64_t)&v9 - v12;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  char v29 = (char *)&v9 - v6;
  char v36 = (char *)&v9 - v6;
  uint64_t v35 = v25;
  uint64_t v34 = v7;
  char v33 = v24 & 1;
  (*(void (**)(uint64_t, void))(v14 + 104))(v5, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v28, v29, v30);
  static EKDateUtilities.startOf6Month(for:with:ignoreDay:)(v25, v28, v24 & 1, v23);
  char v32 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  uint64_t v31 = v26 + 8;
  v32(v28, v30);
  return ((uint64_t (*)(char *, uint64_t))v32)(v29, v30);
}

uint64_t static EKDateUtilities.startOfYear(for:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v20 = a2;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v9 = 0;
  uint64_t v21 = sub_24D290838();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v8 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  unint64_t v22 = (char *)&v7 - v8;
  uint64_t v17 = sub_24D2906E8();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v10 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v16 = (char *)&v7 - v10;
  uint64_t v29 = sub_24D290818();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  uint64_t v12 = *(void *)(v25 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v16);
  uint64_t v27 = (uint64_t)&v7 - v11;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v28 = (char *)&v7 - v13;
  uint64_t v34 = (char *)&v7 - v13;
  uint64_t v33 = v24;
  uint64_t v32 = v5;
  (*(void (**)(uint64_t, void))(v14 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v20, v21);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v27, v28, v29);
  static EKDateUtilities.startOfYear(for:with:)(v24, v27, v23);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  uint64_t v30 = v25 + 8;
  v31(v27, v29);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v29);
}

uint64_t static EKDateUtilities.startOfYear(for:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a3;
  uint64_t v12 = a1;
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  uint64_t v8 = 0;
  uint64_t v16 = sub_24D2907F8();
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v14 = v16 - 8;
  unint64_t v7 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v16);
  uint64_t v15 = (char *)&v6 - v7;
  unint64_t v9 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D190) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v19 = (uint64_t)&v6 - v9;
  uint64_t v20 = sub_24D2903C8();
  uint64_t v17 = *(void *)(v20 - 8);
  uint64_t v18 = v20 - 8;
  unint64_t v10 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v15);
  unint64_t v11 = (char *)&v6 - v10;
  uint64_t v23 = (char *)&v6 - v10;
  uint64_t v22 = v12;
  uint64_t v21 = a2;
  (*(void (**)(uint64_t, void))(v13 + 104))(v4, *MEMORY[0x263F078A0]);
  sub_24D290718();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v16);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v19, 1, v20) == 1)
  {
    sub_24D23A5FC(v19);
    return sub_24D2905D8();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v11, v19, v20);
    sub_24D2903A8();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v11, v20);
  }
}

uint64_t static EKDateUtilities.advance(date:by:interval:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v15 = a5;
  uint64_t v30 = a1;
  uint64_t v29 = a2;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  char v42 = 0;
  uint64_t v41 = 0;
  uint64_t v40 = 0;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  uint64_t v21 = 0;
  uint64_t v16 = sub_24D290838();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = v16 - 8;
  unint64_t v19 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v20 = (char *)&v13 - v19;
  uint64_t v22 = sub_24D2906E8();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = v22 - 8;
  unint64_t v25 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v13 - v25;
  uint64_t v31 = sub_24D290818();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = v31 - 8;
  unint64_t v34 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (uint64_t)&v13 - v34;
  unint64_t v36 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v37 = (char *)&v13 - v36;
  char v42 = (char *)&v13 - v36;
  uint64_t v41 = v7;
  uint64_t v40 = v8;
  uint64_t v39 = v9;
  uint64_t v38 = v10;
  if (v8)
  {
    (*(void (**)(char *, void, uint64_t))(v23 + 104))(v26, *MEMORY[0x263F07740], v22);
    sub_24D2906F8();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v22);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v28, v16);
    sub_24D2907E8();
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 16))(v35, v37, v31);
    static EKDateUtilities.advance(date:by:interval:with:)(v30, v29, v27, v35, v15);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    uint64_t v13 = v32 + 8;
    v14(v35, v31);
    return ((uint64_t (*)(char *, uint64_t))v14)(v37, v31);
  }
  else
  {
    uint64_t v12 = sub_24D290638();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v15, v30);
  }
}

uint64_t static EKDateUtilities.group<A>(_:by:interval:startingAt:with:dateFn:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *), uint64_t a7, uint64_t a8)
{
  uint64_t v82 = a1;
  uint64_t v83 = a2;
  uint64_t v84 = a3;
  uint64_t v89 = a4;
  uint64_t v75 = a6;
  uint64_t v76 = a7;
  uint64_t v94 = a8;
  uint64_t v78 = 0;
  uint64_t v98 = MEMORY[0x263F07820];
  uint64_t v50 = MEMORY[0x263F8D4D0];
  uint64_t v119 = 0;
  int v118 = 0;
  uint64_t v117 = 0;
  unint64_t v116 = 0;
  uint64_t v115 = 0;
  v114 = 0;
  uint64_t v113 = 0;
  uint64_t v112 = 0;
  uint64_t v111 = 0;
  uint64_t v110 = 0;
  uint64_t v109 = 0;
  uint64_t v107 = 0;
  uint64_t v108 = 0;
  uint64_t v106 = 0;
  uint64_t v105 = 0;
  uint64_t v104 = 0;
  uint64_t v120 = a8;
  uint64_t v51 = 255;
  uint64_t v90 = sub_24D290638();
  uint64_t v52 = sub_24D290CF8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  unint64_t v53 = (*(void *)(*(void *)(TupleTypeMetadata2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v54 = (char *)v31 - v53;
  uint64_t v55 = *(void *)(v10 - 8);
  uint64_t v56 = v10 - 8;
  unint64_t v57 = (*(void *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  int v58 = (char *)v31 - v57;
  unint64_t v59 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v31 - v57);
  uint64_t v60 = (char *)v31 - v59;
  uint64_t v119 = (char *)v31 - v59;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
  unint64_t v61 = (*(void *)(*(void *)(v12 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v12);
  uint64_t v62 = (char *)v31 - v61;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1B0);
  uint64_t v64 = *(void *)(v63 - 8);
  uint64_t v65 = v63 - 8;
  unint64_t v66 = (*(void *)(v64 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = MEMORY[0x270FA5388](v90);
  uint64_t v99 = (char *)v31 - v66;
  int v118 = (char *)v31 - v66;
  uint64_t v87 = *(void *)(v13 - 8);
  uint64_t v88 = v13 - 8;
  unint64_t v67 = (*(void *)(v87 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  uint64_t v68 = (char *)v31 - v67;
  unint64_t v69 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = MEMORY[0x270FA5388]((char *)v31 - v67);
  int v70 = (char *)v31 - v69;
  uint64_t v117 = (char *)v31 - v69;
  unint64_t v71 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  int v72 = (char *)v31 - v71;
  unint64_t v116 = (char *)v31 - v71;
  unint64_t v73 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v17);
  uint64_t v91 = (char *)v31 - v73;
  uint64_t v115 = (char *)v31 - v73;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1B8);
  unint64_t v74 = (*(void *)(*(void *)(v19 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v19);
  uint64_t v86 = (uint64_t)v31 - v74;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1C0);
  uint64_t v95 = *(void *)(v100 - 8);
  uint64_t v96 = v100 - 8;
  uint64_t v80 = *(void *)(v95 + 64);
  unint64_t v79 = (v80 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = MEMORY[0x270FA5388](v78);
  uint64_t v85 = (char *)v31 - v79;
  unint64_t v81 = (v80 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v20);
  uint64_t v97 = (char *)v31 - v81;
  v114 = (char *)v31 - v81;
  uint64_t v113 = v82;
  uint64_t v112 = v21;
  uint64_t v111 = v22;
  uint64_t v110 = v23;
  uint64_t v109 = a5;
  uint64_t v107 = v24;
  uint64_t v108 = v25;
  uint64_t v106 = sub_24D290FA8();
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v86, 1);
  sub_24D2299E0();
  sub_24D2907B8();
  uint64_t v27 = v85;
  sub_24D23A6AC(v86);
  uint64_t v105 = 0;
  uint64_t v92 = *(void (**)(char *, uint64_t, uint64_t))(v87 + 16);
  uint64_t v93 = v87 + 16;
  v92(v91, v89, v90);
  uint64_t v104 = sub_24D290B38();
  (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v27, v97, v100);
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_24D290C48();
LABEL_2:
  swift_getAssociatedConformanceWitness();
  sub_24D290E18();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v87 + 48))(v62, 1, v90) != 1)
  {
    char v48 = *(void (**)(char *, char *, uint64_t))(v87 + 32);
    uint64_t v49 = v87 + 32;
    v48(v72, v62, v90);
    while (1)
    {
      uint64_t v47 = v105;
      uint64_t v28 = MEMORY[0x2533234C0](v82, v94);
      if (v47 >= v28) {
        break;
      }
      sub_24D290D28();
      v75(v60);
      if ((sub_24D2905C8() & 1) == 0)
      {
        uint64_t v45 = v104;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v44 = &v102;
        uint64_t v102 = v45;
        swift_getWitnessTable();
        int v46 = sub_24D290D58();
        sub_24D230030();
        swift_bridgeObjectRelease();
        if ((v46 & 1) == 0)
        {
          v92(v68, (uint64_t)v91, v90);
          uint64_t v42 = v104;
          swift_bridgeObjectRetain();
          uint64_t v41 = *(int *)(TupleTypeMetadata2 + 48);
          v48(v54, v68, v90);
          *(void *)&v54[v41] = v42;
          uint64_t v43 = 0;
          sub_24D290CF8();
          sub_24D290CE8();
          uint64_t v104 = sub_24D290FA8();
          swift_bridgeObjectRelease();
        }
        v92(v68, (uint64_t)v72, v90);
        (*(void (**)(char *, char *, uint64_t))(v87 + 40))(v91, v68, v90);
        uint64_t v40 = *(void (**)(char *, uint64_t))(v87 + 8);
        uint64_t v39 = v87 + 8;
        v40(v70, v90);
        (*(void (**)(char *, uint64_t))(v55 + 8))(v60, v94);
        v40(v72, v90);
        goto LABEL_2;
      }
      (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v58, v60, v94);
      uint64_t result = sub_24D290CE8();
      uint64_t v38 = v105 + 1;
      if (__OFADD__(v105, 1))
      {
        __break(1u);
        return result;
      }
      uint64_t v105 = v38;
      (*(void (**)(char *, uint64_t))(v87 + 8))(v70, v90);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v60, v94);
    }
    uint64_t v36 = v104;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v35 = &v103;
    uint64_t v103 = v36;
    swift_getWitnessTable();
    int v37 = sub_24D290D58();
    sub_24D230030();
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0)
    {
      v92(v68, (uint64_t)v91, v90);
      uint64_t v34 = v104;
      swift_bridgeObjectRetain();
      uint64_t v33 = *(int *)(TupleTypeMetadata2 + 48);
      v48(v54, v68, v90);
      *(void *)&v54[v33] = v34;
      sub_24D290CF8();
      sub_24D290CE8();
    }
    (*(void (**)(char *, uint64_t))(v87 + 8))(v72, v90);
  }
  (*(void (**)(char *, uint64_t))(v64 + 8))(v99, v63);
  v31[1] = &v106;
  uint64_t v32 = v106;
  swift_bridgeObjectRetain();
  sub_24D230030();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v91, v90);
  (*(void (**)(char *, uint64_t))(v95 + 8))(v97, v100);
  sub_24D230030();
  return v32;
}

uint64_t static EKDateUtilities.hoursToTimeInterval(_:)()
{
  return sub_24D290D38();
}

uint64_t sub_24D23A1C0(double a1)
{
  sub_24D290D38();
  double v4 = a1 / v1;
  if (((COERCE_UNSIGNED_INT64(a1 / v1) >> 52) & 0x7FF) == 0x7FF)
  {
    sub_24D290EB8();
    __break(1u);
  }
  if (v4 <= -9.22337204e18)
  {
    sub_24D290EB8();
    __break(1u);
  }
  if (v4 >= 9.22337204e18)
  {
    sub_24D290EB8();
    __break(1u);
  }
  return (uint64_t)v4;
}

unint64_t sub_24D23A384()
{
  uint64_t v2 = qword_26985D198;
  if (!qword_26985D198)
  {
    sub_24D2907F8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D198);
    return WitnessTable;
  }
  return v2;
}

void *sub_24D23A408(const void *a1, void *a2)
{
  uint64_t v6 = sub_24D290638();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_24D23A530(uint64_t a1)
{
  uint64_t v3 = sub_24D290638();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_24D23A5E0(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  *(void *)a2 = *(void *)a1;
  *(unsigned char *)(a2 + 8) = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_24D23A5FC(uint64_t a1)
{
  uint64_t v3 = sub_24D2903C8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_24D23A6AC(uint64_t a1)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1C8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(a1, 1))
  {
    uint64_t v2 = sub_24D290638();
    uint64_t v3 = *(void (**)(uint64_t))(*(void *)(v2 - 8) + 8);
    v3(a1);
    ((void (*)(uint64_t, uint64_t))v3)(a1 + *(int *)(v5 + 36), v2);
  }
  return a1;
}

uint64_t (**sub_24D23A794())()
{
  return &off_26FF7DD10;
}

uint64_t (*static EKDateUtilities.timeIntervalToHours.getter())(double a1)
{
  return sub_24D23A1C0;
}

uint64_t static EKDateUtilities.numDaysBetweenDates(_:_:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v24 = a2;
  uint64_t v21 = a3;
  uint64_t v38 = 0;
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  uint64_t v35 = 0;
  uint64_t v11 = 0;
  uint64_t v22 = sub_24D290838();
  uint64_t v19 = *(void *)(v22 - 8);
  uint64_t v20 = v22 - 8;
  unint64_t v10 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v23 = (char *)&v9 - v10;
  uint64_t v18 = sub_24D2906E8();
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  unint64_t v12 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11);
  uint64_t v17 = (char *)&v9 - v12;
  uint64_t v30 = sub_24D290818();
  uint64_t v26 = *(void *)(v30 - 8);
  uint64_t v27 = v30 - 8;
  uint64_t v14 = *(void *)(v26 + 64);
  unint64_t v13 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v17);
  uint64_t v28 = (uint64_t)&v9 - v13;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v29 = (char *)&v9 - v5;
  uint64_t v38 = (char *)&v9 - v5;
  uint64_t v37 = v25;
  uint64_t v36 = v6;
  uint64_t v35 = v21;
  (*(void (**)(uint64_t, void))(v15 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v23, v21, v22);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v28, v29, v30);
  uint64_t v34 = static EKDateUtilities.numDaysBetweenDates(_:_:with:)(v25, v24, v28);
  int v33 = v7;
  uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  uint64_t v31 = v26 + 8;
  v32(v28, v30);
  v32((uint64_t)v29, v30);
  return v34;
}

uint64_t static EKDateUtilities.numDaysBetweenDates(_:_:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  uint64_t v10 = 0;
  uint64_t v21 = sub_24D290468();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v11 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v20 = (char *)&v10 - v11;
  uint64_t v27 = (char *)&v10 - v11;
  uint64_t v26 = v4;
  uint64_t v25 = v5;
  uint64_t v24 = a3;
  uint64_t v13 = sub_24D2907F8();
  uint64_t v12 = sub_24D290FA8();
  (*(void (**)(uint64_t, void))(*(void *)(v13 - 8) + 104))(v6, *MEMORY[0x263F07870]);
  uint64_t v7 = v12;
  sub_24D22AD58();
  uint64_t v14 = v7;
  sub_24D23A384();
  uint64_t v17 = sub_24D290D48();
  sub_24D290738();
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_24D2903D8();
  int v22 = v8;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v21);
  return v23;
}

uint64_t static EKDateUtilities.numHoursBetweenDates(_:_:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v24 = a2;
  uint64_t v21 = a3;
  uint64_t v38 = 0;
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  uint64_t v35 = 0;
  uint64_t v11 = 0;
  uint64_t v22 = sub_24D290838();
  uint64_t v19 = *(void *)(v22 - 8);
  uint64_t v20 = v22 - 8;
  unint64_t v10 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v23 = (char *)&v9 - v10;
  uint64_t v18 = sub_24D2906E8();
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  unint64_t v12 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11);
  uint64_t v17 = (char *)&v9 - v12;
  uint64_t v30 = sub_24D290818();
  uint64_t v26 = *(void *)(v30 - 8);
  uint64_t v27 = v30 - 8;
  uint64_t v14 = *(void *)(v26 + 64);
  unint64_t v13 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v17);
  uint64_t v28 = (uint64_t)&v9 - v13;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v29 = (char *)&v9 - v5;
  uint64_t v38 = (char *)&v9 - v5;
  uint64_t v37 = v25;
  uint64_t v36 = v6;
  uint64_t v35 = v21;
  (*(void (**)(uint64_t, void))(v15 + 104))(v4, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v23, v21, v22);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v28, v29, v30);
  uint64_t v34 = static EKDateUtilities.numHoursBetweenDates(_:_:with:)(v25, v24, v28);
  int v33 = v7;
  uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  uint64_t v31 = v26 + 8;
  v32(v28, v30);
  v32((uint64_t)v29, v30);
  return v34;
}

uint64_t static EKDateUtilities.numHoursBetweenDates(_:_:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  uint64_t v10 = 0;
  uint64_t v21 = sub_24D290468();
  uint64_t v18 = *(void *)(v21 - 8);
  uint64_t v19 = v21 - 8;
  unint64_t v11 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v20 = (char *)&v10 - v11;
  uint64_t v27 = (char *)&v10 - v11;
  uint64_t v26 = v4;
  uint64_t v25 = v5;
  uint64_t v24 = a3;
  uint64_t v13 = sub_24D2907F8();
  uint64_t v12 = sub_24D290FA8();
  (*(void (**)(uint64_t, void))(*(void *)(v13 - 8) + 104))(v6, *MEMORY[0x263F07890]);
  uint64_t v7 = v12;
  sub_24D22AD58();
  uint64_t v14 = v7;
  sub_24D23A384();
  uint64_t v17 = sub_24D290D48();
  sub_24D290738();
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_24D2903E8();
  int v22 = v8;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v21);
  return v23;
}

uint64_t static EKDateUtilities.hoursInDay(on:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a1;
  uint64_t v19 = a2;
  int v33 = 0;
  uint64_t v32 = 0;
  uint64_t v31 = 0;
  uint64_t v8 = 0;
  uint64_t v20 = sub_24D290838();
  uint64_t v17 = *(void *)(v20 - 8);
  uint64_t v18 = v20 - 8;
  unint64_t v7 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v21 = (char *)&v6 - v7;
  uint64_t v16 = sub_24D2906E8();
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v14 = v16 - 8;
  unint64_t v9 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v15 = (char *)&v6 - v9;
  uint64_t v27 = sub_24D290818();
  uint64_t v23 = *(void *)(v27 - 8);
  uint64_t v24 = v27 - 8;
  uint64_t v11 = *(void *)(v23 + 64);
  unint64_t v10 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v15);
  uint64_t v25 = (uint64_t)&v6 - v10;
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v26 = (char *)&v6 - v12;
  int v33 = (char *)&v6 - v12;
  uint64_t v32 = v22;
  uint64_t v31 = v4;
  (*(void (**)(uint64_t, void))(v13 + 104))(v3, *MEMORY[0x263F07740]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v19, v20);
  sub_24D2907E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(v25, v26, v27);
  uint64_t v30 = static EKDateUtilities.hoursInDay(on:with:)(v22, v25);
  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  uint64_t v28 = v23 + 8;
  v29(v25, v27);
  v29((uint64_t)v26, v27);
  return v30;
}

uint64_t static EKDateUtilities.hoursInDay(on:with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  unint64_t v10 = "Fatal error";
  uint64_t v11 = "Unexpectedly found nil while unwrapping an Optional value";
  unint64_t v12 = "EnergyKitFoundation/EKDateUtilities.swift";
  uint64_t v13 = "Double value cannot be converted to Int because it is either infinite or NaN";
  uint64_t v14 = "Swift/IntegerTypes.swift";
  uint64_t v15 = "Double value cannot be converted to Int because the result would be less than Int.min";
  uint64_t v16 = "Double value cannot be converted to Int because the result would be greater than Int.max";
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v27 = 0;
  uint64_t v25 = sub_24D2907F8();
  uint64_t v22 = *(void *)(v25 - 8);
  uint64_t v23 = v25 - 8;
  unint64_t v17 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25);
  uint64_t v24 = (char *)&v7 - v17;
  uint64_t v19 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D190) - 8) + 64);
  unint64_t v18 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v7 - v18;
  unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v26 = (char *)&v7 - v20;
  uint64_t v34 = (char *)&v7 - v20;
  uint64_t v33 = v21;
  uint64_t v32 = a2;
  (*(void (**)(uint64_t, void))(v22 + 104))(v4, *MEMORY[0x263F07870]);
  sub_24D290718();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v25);
  sub_24D23B920(v26, v28);
  uint64_t v29 = sub_24D2903C8();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = v29 - 8;
  if ((*(unsigned int (**)(char *, uint64_t))(v30 + 48))(v28, 1) == 1)
  {
    sub_24D290EB8();
    __break(1u);
  }
  sub_24D2903B8();
  double v8 = v5;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v28, v29);
  double v9 = v8 / 3600.0;
  if (((COERCE_UNSIGNED_INT64(v8 / 3600.0) >> 52) & 0x7FF) == 0x7FF)
  {
    sub_24D290EB8();
    __break(1u);
  }
  if (v9 <= -9.22337204e18)
  {
    sub_24D290EB8();
    __break(1u);
  }
  if (v9 >= 9.22337204e18)
  {
    sub_24D290EB8();
    __break(1u);
  }
  uint64_t v7 = (uint64_t)v9;
  sub_24D23A5FC((uint64_t)v26);
  return v7;
}

void *sub_24D23B920(const void *a1, void *a2)
{
  uint64_t v6 = sub_24D2903C8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D190);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t static EKDateUtilities.getNoon(after:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v21 = a3;
  uint64_t v22 = a1;
  uint64_t v20 = a2;
  char v44 = 0;
  uint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v12 = 0;
  uint64_t v26 = sub_24D290758();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v9 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v25 = (uint64_t)&v9 - v9;
  uint64_t v30 = sub_24D290768();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v10 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v12);
  uint64_t v29 = (uint64_t)&v9 - v10;
  uint64_t v34 = sub_24D290728();
  uint64_t v31 = *(void *)(v34 - 8);
  uint64_t v32 = v34 - 8;
  unint64_t v11 = (*(void *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v12);
  uint64_t v33 = (char *)&v9 - v11;
  uint64_t v39 = sub_24D290468();
  uint64_t v35 = *(void *)(v39 - 8);
  uint64_t v36 = v39 - 8;
  uint64_t v14 = *(void *)(v35 + 64);
  unint64_t v13 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v12);
  uint64_t v37 = (char *)&v9 - v13;
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v38 = (char *)&v9 - v15;
  char v44 = (char *)&v9 - v15;
  uint64_t v43 = v5;
  uint64_t v42 = a2;
  uint64_t v17 = sub_24D2907F8();
  uint64_t v16 = sub_24D290FA8();
  (*(void (**)(uint64_t, void))(*(void *)(v17 - 8) + 104))(v6, *MEMORY[0x263F07890]);
  uint64_t v7 = v16;
  sub_24D22AD58();
  uint64_t v18 = v7;
  sub_24D23A384();
  uint64_t v19 = sub_24D290D48();
  sub_24D290748();
  swift_bridgeObjectRelease();
  sub_24D2903F8();
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v37, v38, v39);
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v33, *MEMORY[0x263F07780], v34);
  sub_24D235D48(v29);
  sub_24D23BED8(v25);
  sub_24D2907D8();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v30);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v34);
  uint64_t v41 = *(void (**)(char *, uint64_t))(v35 + 8);
  uint64_t v40 = v35 + 8;
  v41(v37, v39);
  return ((uint64_t (*)(char *, uint64_t))v41)(v38, v39);
}

uint64_t sub_24D23BED8@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *MEMORY[0x263F077E0];
  uint64_t v1 = sub_24D290758();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t static EKDateUtilities.nearestTenAM()@<X0>(void *a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v38 = 0;
  uint64_t v37 = 0;
  uint64_t v14 = 0;
  uint64_t v18 = sub_24D290758();
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  unint64_t v3 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v17 = (uint64_t)&v3 - v3;
  uint64_t v22 = sub_24D290768();
  uint64_t v19 = *(void *)(v22 - 8);
  uint64_t v20 = v22 - 8;
  unint64_t v4 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  uint64_t v21 = (uint64_t)&v3 - v4;
  uint64_t v26 = sub_24D290728();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v5 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  uint64_t v25 = (uint64_t)&v3 - v5;
  uint64_t v30 = sub_24D290638();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v6 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v30);
  uint64_t v29 = (char *)&v3 - v6;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  uint64_t v32 = (char *)&v3 - v7;
  uint64_t v38 = (char *)&v3 - v7;
  uint64_t v13 = sub_24D2906E8();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v8 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  uint64_t v12 = (char *)&v3 - v8;
  uint64_t v35 = sub_24D290818();
  uint64_t v33 = *(void *)(v35 - 8);
  uint64_t v34 = v35 - 8;
  unint64_t v9 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](v12);
  uint64_t v36 = (char *)&v3 - v9;
  uint64_t v37 = (char *)&v3 - v9;
  (*(void (**)(uint64_t, void))(v10 + 104))(v1, *MEMORY[0x263F07718]);
  sub_24D2906F8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v13);
  sub_24D290608();
  sub_24D23C428(v25);
  sub_24D235D48(v21);
  sub_24D23BED8(v17);
  sub_24D290788();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v18);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v22);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  sub_24D23A408(v32, v31);
  sub_24D23A530((uint64_t)v32);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v36, v35);
}

uint64_t sub_24D23C428@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *MEMORY[0x263F07780];
  uint64_t v1 = sub_24D290728();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t static EKDateUtilities.minuteFor(_:)(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v16 = 0;
  uint64_t v3 = 0;
  uint64_t v9 = sub_24D2907F8();
  uint64_t v7 = *(void *)(v9 - 8);
  uint64_t v8 = v9 - 8;
  unint64_t v4 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v10 = (char *)&v3 - v4;
  uint64_t v14 = sub_24D290818();
  uint64_t v11 = *(void *)(v14 - 8);
  uint64_t v12 = v14 - 8;
  unint64_t v5 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](v6);
  uint64_t v13 = (char *)&v3 - v5;
  uint64_t v16 = v1;
  sub_24D2907C8();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x263F078C0], v9);
  uint64_t v15 = sub_24D290808();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v9);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v14);
  return v15;
}

uint64_t static EKDateUtilities.roundToNextHalfHour(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v75 = a1;
  uint64_t v39 = "Fatal error";
  uint64_t v40 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v41 = "EnergyKitFoundation/EKDateUtilities.swift";
  uint64_t v76 = 0;
  uint64_t v72 = 0;
  uint64_t v42 = sub_24D290758();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = v42 - 8;
  unint64_t v45 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v46 = (uint64_t)v29 - v45;
  uint64_t v47 = sub_24D290768();
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = v47 - 8;
  unint64_t v50 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v72);
  uint64_t v51 = (uint64_t)v29 - v50;
  uint64_t v52 = sub_24D290728();
  uint64_t v53 = *(void *)(v52 - 8);
  uint64_t v54 = v52 - 8;
  unint64_t v55 = (*(void *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v52);
  uint64_t v56 = (char *)v29 - v55;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A0);
  unint64_t v57 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v74 = (char *)v29 - v57;
  unint64_t v58 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v72);
  int v70 = (char *)v29 - v58;
  uint64_t v59 = sub_24D290468();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = v59 - 8;
  unint64_t v62 = (*(void *)(v60 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v72);
  uint64_t v63 = (char *)v29 - v62;
  uint64_t v71 = sub_24D290818();
  uint64_t v68 = *(void *)(v71 - 8);
  uint64_t v69 = v71 - 8;
  unint64_t v64 = (*(void *)(v68 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v71);
  uint64_t v65 = (char *)v29 - v64;
  unint64_t v66 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v75);
  unint64_t v67 = (char *)v29 - v66;
  uint64_t v76 = v3;
  sub_24D2907C8();
  unint64_t v4 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v68 + 56);
  unsigned int v73 = 1;
  v4(v70, 1, 1, v71);
  uint64_t v5 = sub_24D290838();
  (*(void (**)(char *, void))(*(void *)(v5 - 8) + 56))(v74, v73);
  if (static EKDateUtilities.minuteFor(_:)(v75) < 30) {
    uint64_t v36 = 30;
  }
  else {
    uint64_t v36 = 0;
  }
  int v37 = 0;
  v29[1] = 1;
  unsigned int v32 = 1;
  uint64_t v30 = &v7;
  uint64_t v31 = 0;
  uint64_t v7 = 0;
  char v8 = 1;
  uint64_t v9 = 0;
  char v10 = 1;
  uint64_t v11 = v36;
  char v12 = 0;
  uint64_t v13 = 0;
  char v14 = 1;
  uint64_t v15 = 0;
  char v16 = 1;
  uint64_t v17 = 0;
  char v18 = 1;
  uint64_t v19 = 0;
  char v20 = 1;
  uint64_t v21 = 0;
  char v22 = 1;
  uint64_t v23 = 0;
  char v24 = 1;
  uint64_t v25 = 0;
  LOBYTE(v26) = 1;
  uint64_t v27 = 0;
  char v28 = 1;
  sub_24D290458();
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v56, *MEMORY[0x263F07768], v52);
  sub_24D235D48(v51);
  sub_24D23BED8(v46);
  sub_24D2907D8();
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v46, v42);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v51, v47);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v56, v52);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v63, v59);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v65, v71);
  uint64_t v33 = sub_24D290638();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = v33 - 8;
  if ((*(unsigned int (**)(char *, void))(v34 + 48))(v67, v32) == 1)
  {
    LOBYTE(v25) = 2;
    uint64_t v26 = 554;
    LODWORD(v27) = 0;
    sub_24D290EB8();
    __break(1u);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v34 + 32))(v38, v67, v33);
}

uint64_t static EKDateUtilities.nextMinuteFor(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v29[0] = a2;
  uint64_t v42 = a1;
  v29[1] = "Fatal error";
  _DWORD v29[2] = "Unexpectedly found nil while unwrapping an Optional value";
  v29[3] = "EnergyKitFoundation/EKDateUtilities.swift";
  uint64_t v69 = 0;
  uint64_t v63 = 0;
  uint64_t v46 = sub_24D290758();
  uint64_t v43 = *(void *)(v46 - 8);
  uint64_t v44 = v46 - 8;
  unint64_t v30 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v45 = (uint64_t)v29 - v30;
  uint64_t v50 = sub_24D290768();
  uint64_t v47 = *(void *)(v50 - 8);
  uint64_t v48 = v50 - 8;
  unint64_t v31 = (*(void *)(v47 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v63);
  uint64_t v49 = (uint64_t)v29 - v31;
  uint64_t v54 = sub_24D290728();
  uint64_t v51 = *(void *)(v54 - 8);
  uint64_t v52 = v54 - 8;
  unint64_t v32 = (*(void *)(v51 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)v29 - v32;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A0);
  unint64_t v33 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)v29 - v33;
  unint64_t v34 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v63);
  uint64_t v38 = (char *)v29 - v34;
  uint64_t v58 = sub_24D290468();
  uint64_t v55 = *(void *)(v58 - 8);
  uint64_t v56 = v58 - 8;
  unint64_t v35 = (*(void *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v63);
  unint64_t v57 = (char *)v29 - v35;
  uint64_t v62 = sub_24D290818();
  uint64_t v59 = *(void *)(v62 - 8);
  uint64_t v60 = v62 - 8;
  unint64_t v36 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v62);
  uint64_t v61 = (char *)v29 - v36;
  unint64_t v37 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v42);
  uint64_t v65 = (char *)v29 - v37;
  uint64_t v69 = v3;
  sub_24D2907C8();
  unint64_t v4 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56);
  unsigned int v64 = 1;
  v4(v38, 1, 1, v62);
  uint64_t v5 = sub_24D290838();
  (*(void (**)(char *, void))(*(void *)(v5 - 8) + 56))(v39, v64);
  uint64_t v40 = &v7;
  uint64_t v7 = 0;
  int v41 = 1;
  char v8 = 1;
  uint64_t v9 = 0;
  char v10 = 1;
  uint64_t v11 = 0;
  char v12 = 1;
  uint64_t v13 = 0;
  char v14 = 0;
  uint64_t v15 = 0;
  char v16 = 1;
  uint64_t v17 = 0;
  char v18 = 1;
  uint64_t v19 = 0;
  char v20 = 1;
  uint64_t v21 = 0;
  char v22 = 1;
  uint64_t v23 = 0;
  char v24 = 1;
  uint64_t v25 = 0;
  LOBYTE(v26) = 1;
  uint64_t v27 = 0;
  char v28 = 1;
  sub_24D290458();
  (*(void (**)(char *, void, uint64_t))(v51 + 104))(v53, *MEMORY[0x263F07768], v54);
  sub_24D235D48(v49);
  sub_24D23BED8(v45);
  sub_24D2907D8();
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v46);
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v49, v50);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v54);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v58);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v62);
  uint64_t v66 = sub_24D290638();
  uint64_t v67 = *(void *)(v66 - 8);
  uint64_t v68 = v66 - 8;
  if ((*(unsigned int (**)(char *, void))(v67 + 48))(v65, v64) == 1)
  {
    LOBYTE(v25) = 2;
    uint64_t v26 = 563;
    LODWORD(v27) = 0;
    sub_24D290EB8();
    __break(1u);
  }
  return (*(uint64_t (**)(void, char *, uint64_t))(v67 + 32))(v29[0], v65, v66);
}

uint64_t static EKDateUtilities.previousHourFor(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v29[0] = a2;
  uint64_t v42 = a1;
  v29[1] = "Fatal error";
  _DWORD v29[2] = "Unexpectedly found nil while unwrapping an Optional value";
  v29[3] = "EnergyKitFoundation/EKDateUtilities.swift";
  uint64_t v69 = 0;
  uint64_t v63 = 0;
  uint64_t v46 = sub_24D290758();
  uint64_t v43 = *(void *)(v46 - 8);
  uint64_t v44 = v46 - 8;
  unint64_t v30 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v45 = (uint64_t)v29 - v30;
  uint64_t v50 = sub_24D290768();
  uint64_t v47 = *(void *)(v50 - 8);
  uint64_t v48 = v50 - 8;
  unint64_t v31 = (*(void *)(v47 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v63);
  uint64_t v49 = (uint64_t)v29 - v31;
  uint64_t v54 = sub_24D290728();
  uint64_t v51 = *(void *)(v54 - 8);
  uint64_t v52 = v54 - 8;
  unint64_t v32 = (*(void *)(v51 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)v29 - v32;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A0);
  unint64_t v33 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)v29 - v33;
  unint64_t v34 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D1A8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v63);
  uint64_t v38 = (char *)v29 - v34;
  uint64_t v58 = sub_24D290468();
  uint64_t v55 = *(void *)(v58 - 8);
  uint64_t v56 = v58 - 8;
  unint64_t v35 = (*(void *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v63);
  unint64_t v57 = (char *)v29 - v35;
  uint64_t v62 = sub_24D290818();
  uint64_t v59 = *(void *)(v62 - 8);
  uint64_t v60 = v62 - 8;
  unint64_t v36 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v62);
  uint64_t v61 = (char *)v29 - v36;
  unint64_t v37 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v42);
  uint64_t v65 = (char *)v29 - v37;
  uint64_t v69 = v3;
  sub_24D2907C8();
  unint64_t v4 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56);
  unsigned int v64 = 1;
  v4(v38, 1, 1, v62);
  uint64_t v5 = sub_24D290838();
  (*(void (**)(char *, void))(*(void *)(v5 - 8) + 56))(v39, v64);
  uint64_t v40 = &v7;
  uint64_t v7 = 0;
  int v41 = 1;
  char v8 = 1;
  uint64_t v9 = 0;
  char v10 = 1;
  uint64_t v11 = 0;
  char v12 = 0;
  uint64_t v13 = 0;
  char v14 = 1;
  uint64_t v15 = 0;
  char v16 = 1;
  uint64_t v17 = 0;
  char v18 = 1;
  uint64_t v19 = 0;
  char v20 = 1;
  uint64_t v21 = 0;
  char v22 = 1;
  uint64_t v23 = 0;
  char v24 = 1;
  uint64_t v25 = 0;
  LOBYTE(v26) = 1;
  uint64_t v27 = 0;
  char v28 = 1;
  sub_24D290458();
  (*(void (**)(char *, void, uint64_t))(v51 + 104))(v53, *MEMORY[0x263F07780], v54);
  sub_24D235D48(v49);
  sub_24D23BED8(v45);
  sub_24D2907D8();
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v46);
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v49, v50);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v54);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v58);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v62);
  uint64_t v66 = sub_24D290638();
  uint64_t v67 = *(void *)(v66 - 8);
  uint64_t v68 = v66 - 8;
  if ((*(unsigned int (**)(char *, void))(v67 + 48))(v65, v64) == 1)
  {
    LOBYTE(v25) = 2;
    uint64_t v26 = 572;
    LODWORD(v27) = 0;
    sub_24D290EB8();
    __break(1u);
  }
  sub_24D290618();
  return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v65, v66);
}

id sub_24D23DC54()
{
  sub_24D23DC88();
  id result = sub_24D22E50C();
  qword_26985E048 = (uint64_t)result;
  return result;
}

unint64_t sub_24D23DC88()
{
  uint64_t v2 = qword_26985D1D0;
  if (!qword_26985D1D0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26985D1D0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t *sub_24D23DCF0()
{
  if (qword_26985E040 != -1) {
    swift_once();
  }
  return &qword_26985E048;
}

void *static EKDateUtilities.ekISO8601DateFormatter.getter()
{
  uint64_t v2 = (void *)*sub_24D23DCF0();
  id v0 = v2;
  return v2;
}

uint64_t sub_24D23DD84()
{
  uint64_t v17 = sub_24D290598();
  uint64_t v11 = *(void *)(v17 - 8);
  uint64_t v12 = v17 - 8;
  unint64_t v7 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v0 = MEMORY[0x270FA5388](v17);
  uint64_t v13 = (char *)&v6 - v7;
  unint64_t v8 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  char v14 = (char *)&v6 - v8;
  unint64_t v9 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v16 = (char *)&v6 - v9;
  char v10 = qword_26985E058;
  __swift_allocate_value_buffer(v4, qword_26985E058);
  uint64_t v15 = __swift_project_value_buffer(v17, (uint64_t)v10);
  sub_24D290498();
  sub_24D290568();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v18 = v11 + 8;
  v19(v13, v17);
  sub_24D290578();
  v19(v14, v17);
  sub_24D290548();
  return ((uint64_t (*)(char *, uint64_t))v19)(v16, v17);
}

uint64_t sub_24D23DF28()
{
  if (qword_26985E050 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24D290598();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26985E058);
}

uint64_t static EKDateUtilities.isoFormatNoTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24D23DF28();
  uint64_t v1 = sub_24D290598();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t static EKDateUtilities.isoFormatNoTime(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  uint64_t v11 = a1;
  char v20 = 0;
  uint64_t v19 = 0;
  v6[1] = 0;
  uint64_t v12 = sub_24D290838();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v7 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v13 = (char *)v6 - v7;
  uint64_t v18 = sub_24D290598();
  uint64_t v14 = *(void *)(v18 - 8);
  uint64_t v15 = v18 - 8;
  unint64_t v8 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v11);
  uint64_t v3 = (char *)v6 - v8;
  uint64_t v17 = (char *)v6 - v8;
  char v20 = (char *)v6 - v8;
  uint64_t v19 = v2;
  uint64_t v4 = sub_24D23DF28();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v3, v4, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v11, v12);
  sub_24D290588();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v16, v17, v18);
}

uint64_t sub_24D23E1B4()
{
  uint64_t v21 = sub_24D290598();
  uint64_t v14 = *(void *)(v21 - 8);
  uint64_t v15 = v21 - 8;
  unint64_t v9 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v0 = MEMORY[0x270FA5388](v21);
  uint64_t v16 = (char *)&v8 - v9;
  unint64_t v10 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v17 = (char *)&v8 - v10;
  unint64_t v11 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v18 = (char *)&v8 - v11;
  unint64_t v12 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  char v20 = (char *)&v8 - v12;
  uint64_t v13 = qword_26985E078;
  __swift_allocate_value_buffer(v6, qword_26985E078);
  uint64_t v19 = __swift_project_value_buffer(v21, (uint64_t)v13);
  sub_24D290498();
  sub_24D290568();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v22 = v14 + 8;
  v23(v16, v21);
  sub_24D290578();
  v23(v17, v21);
  sub_24D290548();
  v23(v18, v21);
  sub_24D290558();
  return ((uint64_t (*)(char *, uint64_t))v23)(v20, v21);
}

uint64_t sub_24D23E3BC()
{
  if (qword_26985E070 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24D290598();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26985E078);
}

uint64_t static EKDateUtilities.isoFormatNoZ.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24D23E3BC();
  uint64_t v1 = sub_24D290598();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t static EKDateUtilities.isoFormatNoZ(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  uint64_t v11 = a1;
  char v20 = 0;
  uint64_t v19 = 0;
  v6[1] = 0;
  uint64_t v12 = sub_24D290838();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v7 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v13 = (char *)v6 - v7;
  uint64_t v18 = sub_24D290598();
  uint64_t v14 = *(void *)(v18 - 8);
  uint64_t v15 = v18 - 8;
  unint64_t v8 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v11);
  uint64_t v3 = (char *)v6 - v8;
  uint64_t v17 = (char *)v6 - v8;
  char v20 = (char *)v6 - v8;
  uint64_t v19 = v2;
  uint64_t v4 = sub_24D23E3BC();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v3, v4, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v11, v12);
  sub_24D290588();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v16, v17, v18);
}

ValueMetadata *type metadata accessor for EKDateUtilities()
{
  return &type metadata for EKDateUtilities;
}

uint64_t EnergySitePayload.siteName.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v3;
}

uint64_t type metadata accessor for EnergySitePayload()
{
  uint64_t v1 = qword_26B18C000;
  if (!qword_26B18C000) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_24D23E764@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.siteName.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D23E810(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.siteName.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.siteName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D23E904()
{
  uint64_t v4 = type metadata accessor for EnergySitePayload();
  type metadata accessor for EnergySitePayload._StorageClass();
  if ((sub_24D290F68() & 1) == 0)
  {
    uint64_t v2 = *(void **)(v3 + *(int *)(v4 + 20));
    swift_retain();
    *(void *)(v3 + *(int *)(v4 + 20)) = sub_24D24B7C0(v2);
    swift_release();
  }
  uint64_t v1 = *(void *)(v3 + *(int *)(v4 + 20));
  swift_retain();
  return v1;
}

uint64_t type metadata accessor for EnergySitePayload._StorageClass()
{
  uint64_t v1 = qword_26B18BE20;
  if (!qword_26B18BE20) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t (*EnergySitePayload.siteName.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.siteName.getter();
  a1[1] = v2;
  return sub_24D23EABC;
}

uint64_t sub_24D23EABC(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.siteName.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.siteName.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

double EnergySitePayload.latitude.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  swift_beginAccess();
  double v3 = *(double *)(v2 + 32);
  swift_endAccess();
  swift_release();
  return v3;
}

uint64_t sub_24D23EBB8@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  unint64_t v8 = a2;
  uint64_t v6 = a1;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v6 - v7;
  sub_24D25CAB4(v2, (uint64_t)&v6 - v7);
  double v3 = EnergySitePayload.latitude.getter();
  uint64_t v4 = (uint64_t)v9;
  *unint64_t v8 = v3;
  return sub_24D25CB50(v4);
}

uint64_t sub_24D23EC5C(double *a1)
{
  return EnergySitePayload.latitude.setter(*a1);
}

uint64_t EnergySitePayload.latitude.setter(double a1)
{
  uint64_t v3 = sub_24D23E904();
  swift_beginAccess();
  *(double *)(v3 + 32) = a1;
  swift_endAccess();
  return swift_release();
}

uint64_t (*EnergySitePayload.latitude.modify(uint64_t a1))(double *a1)
{
  *(void *)(a1 + 8) = v1;
  *(double *)a1 = EnergySitePayload.latitude.getter();
  return sub_24D23ED54;
}

uint64_t sub_24D23ED54(double *a1)
{
  return EnergySitePayload.latitude.setter(*a1);
}

double EnergySitePayload.longitude.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  swift_beginAccess();
  double v3 = *(double *)(v2 + 40);
  swift_endAccess();
  swift_release();
  return v3;
}

uint64_t sub_24D23EE2C@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  unint64_t v8 = a2;
  uint64_t v6 = a1;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v6 - v7;
  sub_24D25CAB4(v2, (uint64_t)&v6 - v7);
  double v3 = EnergySitePayload.longitude.getter();
  uint64_t v4 = (uint64_t)v9;
  *unint64_t v8 = v3;
  return sub_24D25CB50(v4);
}

uint64_t sub_24D23EED0(double *a1)
{
  return EnergySitePayload.longitude.setter(*a1);
}

uint64_t EnergySitePayload.longitude.setter(double a1)
{
  uint64_t v3 = sub_24D23E904();
  swift_beginAccess();
  *(double *)(v3 + 40) = a1;
  swift_endAccess();
  return swift_release();
}

uint64_t (*EnergySitePayload.longitude.modify(uint64_t a1))(double *a1)
{
  *(void *)(a1 + 8) = v1;
  *(double *)a1 = EnergySitePayload.longitude.getter();
  return sub_24D23EFC8;
}

uint64_t sub_24D23EFC8(double *a1)
{
  return EnergySitePayload.longitude.setter(*a1);
}

uint64_t EnergySitePayload.utilityID.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v3;
}

uint64_t sub_24D23F0B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.utilityID.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D23F15C(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.utilityID.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.utilityID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v4 + 48) = a1;
  *(void *)(v4 + 56) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.utilityID.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.utilityID.getter();
  a1[1] = v2;
  return sub_24D23F2B4;
}

uint64_t sub_24D23F2B4(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.utilityID.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.utilityID.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.subscriptionID.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 64);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v3;
}

uint64_t sub_24D23F3C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.subscriptionID.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D23F46C(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.subscriptionID.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.subscriptionID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 72) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.subscriptionID.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.subscriptionID.getter();
  a1[1] = v2;
  return sub_24D23F5C4;
}

uint64_t sub_24D23F5C4(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.subscriptionID.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.subscriptionID.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.accessToken.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 80);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v3;
}

uint64_t sub_24D23F6D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.accessToken.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D23F77C(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.accessToken.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.accessToken.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v4 + 80) = a1;
  *(void *)(v4 + 88) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.accessToken.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.accessToken.getter();
  a1[1] = v2;
  return sub_24D23F8D4;
}

uint64_t sub_24D23F8D4(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.accessToken.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.accessToken.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.refreshToken.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 96);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v3;
}

uint64_t sub_24D23F9E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.refreshToken.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D23FA8C(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.refreshToken.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.refreshToken.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v4 + 96) = a1;
  *(void *)(v4 + 104) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.refreshToken.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.refreshToken.getter();
  a1[1] = v2;
  return sub_24D23FBE4;
}

uint64_t sub_24D23FBE4(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.refreshToken.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.refreshToken.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.timezone.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 112);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v3;
}

uint64_t sub_24D23FCF0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.timezone.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D23FD9C(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.timezone.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.timezone.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v4 + 112) = a1;
  *(void *)(v4 + 120) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.timezone.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.timezone.getter();
  a1[1] = v2;
  return sub_24D23FEF4;
}

uint64_t sub_24D23FEF4(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.timezone.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.timezone.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

char *EnergySitePayload.currentRatePlan.getter@<X0>(char *a1@<X8>)
{
  uint64_t v6 = a1;
  uint64_t v14 = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
  unint64_t v7 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v12 = (char *)&v5 - v7;
  uint64_t v14 = v1;
  uint64_t v11 = 0;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  unint64_t v8 = (uint64_t *)(v10
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan);
  uint64_t v9 = &v13;
  swift_beginAccess();
  sub_24D24B80C(v8, v12);
  swift_endAccess();
  swift_release();
  uint64_t v3 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  if ((*(unsigned int (**)(char *, uint64_t))(*(void *)(v3 - 8) + 48))(v12, 1) != 1) {
    return sub_24D24BAC0(v12, v6);
  }
  EnergySitePayload.CurrentRatePlan.init()(v6);
  return (char *)sub_24D24B9F0((uint64_t)v12);
}

uint64_t sub_24D2400C8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  v4[1] = 0;
  unint64_t v5 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload.CurrentRatePlan() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  unint64_t v8 = (char *)v4 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)v4 - v7;
  sub_24D25CAB4(v2, (uint64_t)v4 - v7);
  EnergySitePayload.currentRatePlan.getter(v8);
  sub_24D24BAC0(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D2401D0(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload.CurrentRatePlan() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (char *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BB5C(v1, (char *)&v3 - v5);
  return EnergySitePayload.currentRatePlan.setter(v6);
}

uint64_t EnergySitePayload.currentRatePlan.setter(char *a1)
{
  uint64_t v15 = a1;
  uint64_t v18 = 0;
  uint64_t v17 = 0;
  unint64_t v8 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8) - 8) + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v15);
  uint64_t v10 = (uint64_t *)((char *)&v7 - v8);
  unint64_t v9 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v13 = (char *)&v7 - v9;
  uint64_t v18 = v4;
  uint64_t v17 = v1;
  uint64_t v14 = sub_24D23E904();
  sub_24D24BB5C(v15, v13);
  uint64_t v5 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  (*(void (**)(char *, void, uint64_t))(*(void *)(v5 - 8) + 56))(v13, 0, 1);
  sub_24D24B80C((uint64_t *)v13, v10);
  uint64_t v11 = (void *)(v14
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan);
  uint64_t v12 = &v16;
  swift_beginAccess();
  sub_24D24BC08(v10, v11);
  swift_endAccess();
  sub_24D24B9F0((uint64_t)v13);
  swift_release();
  return sub_24D24BE88((uint64_t)v15);
}

char *EnergySitePayload.CurrentRatePlan.init()@<X0>(char *a1@<X8>)
{
  uint64_t v5 = a1;
  uint64_t v6 = 0;
  v2[1] = 0;
  uint64_t v3 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  v2[0] = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v4 = (char *)v2 - v2[0];
  uint64_t v6 = (char *)v2 - v2[0];
  type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
  *(void *)uint64_t v4 = sub_24D290FA8();
  sub_24D2908A8();
  return sub_24D24BAC0(v4, v5);
}

void (*EnergySitePayload.currentRatePlan.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(type metadata accessor for EnergySitePayload.CurrentRatePlan() - 8) + 64);
  a1[1] = malloc(__size);
  uint64_t v5 = (char *)malloc(__size);
  a1[2] = v5;
  EnergySitePayload.currentRatePlan.getter(v5);
  return sub_24D240554;
}

void sub_24D240554(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(char **)(a1 + 16);
    uint64_t v3 = *(char **)(a1 + 8);
    sub_24D24BB5C(v2, v3);
    EnergySitePayload.currentRatePlan.setter(v3);
    sub_24D24BE88((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(char **)(a1 + 16);
    uint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.currentRatePlan.setter(v4);
    free(v4);
    free(v5);
  }
}

BOOL EnergySitePayload.hasCurrentRatePlan.getter()
{
  uint64_t v14 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
  unint64_t v7 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  uint64_t v12 = (uint64_t *)((char *)&v4 - v7);
  uint64_t v14 = v0;
  uint64_t v11 = 0;
  uint64_t v10 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  unint64_t v8 = (uint64_t *)(v10
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan);
  unint64_t v9 = &v13;
  swift_beginAccess();
  sub_24D24B80C(v8, v12);
  swift_endAccess();
  swift_release();
  uint64_t v2 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  BOOL v6 = (*(uint64_t (**)(void *, uint64_t))(*(void *)(v2 - 8) + 48))(v12, 1) != 1;
  BOOL v5 = v6;
  sub_24D24B9F0((uint64_t)v12);
  return v5;
}

Swift::Void __swiftcall EnergySitePayload.clearCurrentRatePlan()()
{
  uint64_t v13 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
  unint64_t v5 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  unint64_t v7 = (uint64_t *)((char *)&v4 - v5);
  unint64_t v6 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v4 - v5);
  uint64_t v10 = (uint64_t *)((char *)&v4 - v6);
  uint64_t v13 = v0;
  uint64_t v11 = sub_24D23E904();
  uint64_t v3 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v3 - 8) + 56))(v10, 1);
  sub_24D24B80C(v10, v7);
  unint64_t v8 = (void *)(v11
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan);
  unint64_t v9 = &v12;
  swift_beginAccess();
  sub_24D24BC08(v7, v8);
  swift_endAccess();
  sub_24D24B9F0((uint64_t)v10);
  swift_release();
}

uint64_t EnergySitePayload.usagePointCustomIndex.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = v3
     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex;
  swift_beginAccess();
  uint64_t v4 = *(void *)v2;
  sub_24D229320(*(void *)v2, *(void *)(v2 + 8));
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D24095C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.usagePointCustomIndex.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D240A08(uint64_t *a1)
{
  sub_24D2292D4(a1, v2);
  return EnergySitePayload.usagePointCustomIndex.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.usagePointCustomIndex.setter(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = sub_24D23E904();
  sub_24D229320(a1, a2);
  sub_24D229320(a1, a2);
  uint64_t v5 = (uint64_t *)(v6
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex);
  swift_beginAccess();
  uint64_t v2 = *v5;
  unint64_t v3 = v5[1];
  *uint64_t v5 = a1;
  v5[1] = a2;
  sub_24D2293AC(v2, v3);
  swift_endAccess();
  sub_24D2293AC(a1, a2);
  swift_release();
  return sub_24D2293AC(a1, a2);
}

uint64_t (*EnergySitePayload.usagePointCustomIndex.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.usagePointCustomIndex.getter();
  a1[1] = v2;
  return sub_24D240B80;
}

uint64_t sub_24D240B80(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.usagePointCustomIndex.setter(*(void *)a1, *(void *)(a1 + 8));
  }
  uint64_t v3 = *(void *)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  sub_24D229320(*(void *)a1, v4);
  EnergySitePayload.usagePointCustomIndex.setter(v3, v4);
  uint64_t result = a1;
  sub_24D24BF84(a1);
  return result;
}

uint64_t EnergySitePayload.usageSummaryCustomIndex.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = v3
     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex;
  swift_beginAccess();
  uint64_t v4 = *(void *)v2;
  sub_24D229320(*(void *)v2, *(void *)(v2 + 8));
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D240C98@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.usageSummaryCustomIndex.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D240D44(uint64_t *a1)
{
  sub_24D2292D4(a1, v2);
  return EnergySitePayload.usageSummaryCustomIndex.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.usageSummaryCustomIndex.setter(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = sub_24D23E904();
  sub_24D229320(a1, a2);
  sub_24D229320(a1, a2);
  uint64_t v5 = (uint64_t *)(v6
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex);
  swift_beginAccess();
  uint64_t v2 = *v5;
  unint64_t v3 = v5[1];
  *uint64_t v5 = a1;
  v5[1] = a2;
  sub_24D2293AC(v2, v3);
  swift_endAccess();
  sub_24D2293AC(a1, a2);
  swift_release();
  return sub_24D2293AC(a1, a2);
}

uint64_t (*EnergySitePayload.usageSummaryCustomIndex.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.usageSummaryCustomIndex.getter();
  a1[1] = v2;
  return sub_24D240EBC;
}

uint64_t sub_24D240EBC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.usageSummaryCustomIndex.setter(*(void *)a1, *(void *)(a1 + 8));
  }
  uint64_t v3 = *(void *)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  sub_24D229320(*(void *)a1, v4);
  EnergySitePayload.usageSummaryCustomIndex.setter(v3, v4);
  uint64_t result = a1;
  sub_24D24BF84(a1);
  return result;
}

uint64_t EnergySitePayload.intervalBlockCustomIndex.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = v3
     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex;
  swift_beginAccess();
  uint64_t v4 = *(void *)v2;
  sub_24D229320(*(void *)v2, *(void *)(v2 + 8));
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D240FD4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.intervalBlockCustomIndex.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D241080(uint64_t *a1)
{
  sub_24D2292D4(a1, v2);
  return EnergySitePayload.intervalBlockCustomIndex.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.intervalBlockCustomIndex.setter(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = sub_24D23E904();
  sub_24D229320(a1, a2);
  sub_24D229320(a1, a2);
  uint64_t v5 = (uint64_t *)(v6
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex);
  swift_beginAccess();
  uint64_t v2 = *v5;
  unint64_t v3 = v5[1];
  *uint64_t v5 = a1;
  v5[1] = a2;
  sub_24D2293AC(v2, v3);
  swift_endAccess();
  sub_24D2293AC(a1, a2);
  swift_release();
  return sub_24D2293AC(a1, a2);
}

uint64_t (*EnergySitePayload.intervalBlockCustomIndex.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.intervalBlockCustomIndex.getter();
  a1[1] = v2;
  return sub_24D2411F8;
}

uint64_t sub_24D2411F8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.intervalBlockCustomIndex.setter(*(void *)a1, *(void *)(a1 + 8));
  }
  uint64_t v3 = *(void *)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  sub_24D229320(*(void *)a1, v4);
  EnergySitePayload.intervalBlockCustomIndex.setter(v3, v4);
  uint64_t result = a1;
  sub_24D24BF84(a1);
  return result;
}

uint64_t EnergySitePayload.ckFunctionToken.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (uint64_t *)(v3
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__ckFunctionToken);
  swift_beginAccess();
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D241310@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.ckFunctionToken.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D2413BC(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.ckFunctionToken.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.ckFunctionToken.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)(v5
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__ckFunctionToken);
  swift_beginAccess();
  *uint64_t v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.ckFunctionToken.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.ckFunctionToken.getter();
  a1[1] = v2;
  return sub_24D241520;
}

uint64_t sub_24D241520(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.ckFunctionToken.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.ckFunctionToken.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.accountName.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (uint64_t *)(v3
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountName);
  swift_beginAccess();
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D241638@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.accountName.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D2416E4(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.accountName.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.accountName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)(v5
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountName);
  swift_beginAccess();
  *uint64_t v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.accountName.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.accountName.getter();
  a1[1] = v2;
  return sub_24D241848;
}

uint64_t sub_24D241848(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.accountName.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.accountName.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.accountNumber.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (uint64_t *)(v3
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountNumber);
  swift_beginAccess();
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D241960@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.accountNumber.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D241A0C(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.accountNumber.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.accountNumber.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)(v5
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountNumber);
  swift_beginAccess();
  *uint64_t v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.accountNumber.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.accountNumber.getter();
  a1[1] = v2;
  return sub_24D241B70;
}

uint64_t sub_24D241B70(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.accountNumber.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.accountNumber.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.address.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (uint64_t *)(v3
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__address);
  swift_beginAccess();
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D241C88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.address.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D241D34(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.address.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.address.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)(v5
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__address);
  swift_beginAccess();
  *uint64_t v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.address.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.address.getter();
  a1[1] = v2;
  return sub_24D241E98;
}

uint64_t sub_24D241E98(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.address.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.address.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.serviceLocationID.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (uint64_t *)(v3
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__serviceLocationID);
  swift_beginAccess();
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D241FB0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.serviceLocationID.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D24205C(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.serviceLocationID.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.serviceLocationID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)(v5
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__serviceLocationID);
  swift_beginAccess();
  *uint64_t v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.serviceLocationID.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.serviceLocationID.getter();
  a1[1] = v2;
  return sub_24D2421C0;
}

uint64_t sub_24D2421C0(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.serviceLocationID.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.serviceLocationID.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.alternateSupplier.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (uint64_t *)(v3
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__alternateSupplier);
  swift_beginAccess();
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D2422D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.alternateSupplier.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D242384(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.alternateSupplier.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.alternateSupplier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)(v5
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__alternateSupplier);
  swift_beginAccess();
  *uint64_t v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.alternateSupplier.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.alternateSupplier.getter();
  a1[1] = v2;
  return sub_24D2424E8;
}

uint64_t sub_24D2424E8(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.alternateSupplier.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.alternateSupplier.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.accessTokenExpirationDate.getter@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v3 = (const void *)(v5
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24D2425F0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v8 = (char *)&v5 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)&v5 - v7;
  sub_24D25CAB4(v3, (uint64_t)&v5 - v7);
  EnergySitePayload.accessTokenExpirationDate.getter(v8);
  sub_24D25CBCC(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D2426F4(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BFB8(v1, (char *)&v3 - v5);
  return EnergySitePayload.accessTokenExpirationDate.setter(v6);
}

uint64_t EnergySitePayload.accessTokenExpirationDate.setter(const void *a1)
{
  uint64_t v14 = a1;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v9 = (char *)&v6 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v12 = (char *)&v6 - v8;
  uint64_t v17 = v4;
  uint64_t v16 = v1;
  uint64_t v13 = sub_24D23E904();
  sub_24D24BFB8(v14, v12);
  sub_24D24BFB8(v12, v9);
  uint64_t v10 = (void *)(v13
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate);
  uint64_t v11 = &v15;
  swift_beginAccess();
  sub_24D24C0E0(v9, v10);
  swift_endAccess();
  sub_24D24C310((uint64_t)v12);
  swift_release();
  return sub_24D24C310((uint64_t)v14);
}

void (*EnergySitePayload.accessTokenExpirationDate.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  a1[1] = malloc(__size);
  unint64_t v5 = malloc(__size);
  a1[2] = v5;
  EnergySitePayload.accessTokenExpirationDate.getter(v5);
  return sub_24D24297C;
}

void sub_24D24297C(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    uint64_t v3 = *(void **)(a1 + 8);
    sub_24D24BFB8(v2, v3);
    EnergySitePayload.accessTokenExpirationDate.setter(v3);
    sub_24D24C310((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 16);
    unint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.accessTokenExpirationDate.setter(v4);
    free(v4);
    free(v5);
  }
}

BOOL EnergySitePayload.hasAccessTokenExpirationDate.getter()
{
  uint64_t v14 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v7 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  char v12 = (char *)&v4 - v7;
  uint64_t v14 = v0;
  uint64_t v11 = 0;
  uint64_t v10 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  unint64_t v8 = (const void *)(v10
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate);
  uint64_t v9 = &v13;
  swift_beginAccess();
  sub_24D24BFB8(v8, v12);
  swift_endAccess();
  swift_release();
  uint64_t v2 = sub_24D290888();
  BOOL v6 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v2 - 8) + 48))(v12, 1) != 1;
  BOOL v5 = v6;
  sub_24D24C310((uint64_t)v12);
  return v5;
}

Swift::Void __swiftcall EnergySitePayload.clearAccessTokenExpirationDate()()
{
  uint64_t v13 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  unint64_t v7 = (char *)&v4 - v5;
  unint64_t v6 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v4 - v5);
  uint64_t v10 = (char *)&v4 - v6;
  uint64_t v13 = v0;
  uint64_t v11 = sub_24D23E904();
  uint64_t v3 = sub_24D290888();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 56))(v10, 1);
  sub_24D24BFB8(v10, v7);
  unint64_t v8 = (void *)(v11
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate);
  uint64_t v9 = &v12;
  swift_beginAccess();
  sub_24D24C0E0(v7, v8);
  swift_endAccess();
  sub_24D24C310((uint64_t)v10);
  swift_release();
}

uint64_t EnergySitePayload.utilitySupportedCheckDate.getter@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v3 = (const void *)(v5
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24D242D74@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v8 = (char *)&v5 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)&v5 - v7;
  sub_24D25CAB4(v3, (uint64_t)&v5 - v7);
  EnergySitePayload.utilitySupportedCheckDate.getter(v8);
  sub_24D25CBCC(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D242E78(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BFB8(v1, (char *)&v3 - v5);
  return EnergySitePayload.utilitySupportedCheckDate.setter(v6);
}

uint64_t EnergySitePayload.utilitySupportedCheckDate.setter(const void *a1)
{
  uint64_t v14 = a1;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v9 = (char *)&v6 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v12 = (char *)&v6 - v8;
  uint64_t v17 = v4;
  uint64_t v16 = v1;
  uint64_t v13 = sub_24D23E904();
  sub_24D24BFB8(v14, v12);
  sub_24D24BFB8(v12, v9);
  uint64_t v10 = (void *)(v13
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate);
  uint64_t v11 = &v15;
  swift_beginAccess();
  sub_24D24C0E0(v9, v10);
  swift_endAccess();
  sub_24D24C310((uint64_t)v12);
  swift_release();
  return sub_24D24C310((uint64_t)v14);
}

void (*EnergySitePayload.utilitySupportedCheckDate.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  a1[1] = malloc(__size);
  unint64_t v5 = malloc(__size);
  a1[2] = v5;
  EnergySitePayload.utilitySupportedCheckDate.getter(v5);
  return sub_24D243100;
}

void sub_24D243100(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    uint64_t v3 = *(void **)(a1 + 8);
    sub_24D24BFB8(v2, v3);
    EnergySitePayload.utilitySupportedCheckDate.setter(v3);
    sub_24D24C310((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 16);
    unint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.utilitySupportedCheckDate.setter(v4);
    free(v4);
    free(v5);
  }
}

BOOL EnergySitePayload.hasUtilitySupportedCheckDate.getter()
{
  uint64_t v14 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v7 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  char v12 = (char *)&v4 - v7;
  uint64_t v14 = v0;
  uint64_t v11 = 0;
  uint64_t v10 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  unint64_t v8 = (const void *)(v10
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate);
  uint64_t v9 = &v13;
  swift_beginAccess();
  sub_24D24BFB8(v8, v12);
  swift_endAccess();
  swift_release();
  uint64_t v2 = sub_24D290888();
  BOOL v6 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v2 - 8) + 48))(v12, 1) != 1;
  BOOL v5 = v6;
  sub_24D24C310((uint64_t)v12);
  return v5;
}

Swift::Void __swiftcall EnergySitePayload.clearUtilitySupportedCheckDate()()
{
  uint64_t v13 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  unint64_t v7 = (char *)&v4 - v5;
  unint64_t v6 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v4 - v5);
  uint64_t v10 = (char *)&v4 - v6;
  uint64_t v13 = v0;
  uint64_t v11 = sub_24D23E904();
  uint64_t v3 = sub_24D290888();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 56))(v10, 1);
  sub_24D24BFB8(v10, v7);
  unint64_t v8 = (void *)(v11
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate);
  uint64_t v9 = &v12;
  swift_beginAccess();
  sub_24D24C0E0(v7, v8);
  swift_endAccess();
  sub_24D24C310((uint64_t)v10);
  swift_release();
}

uint64_t EnergySitePayload.amiLastRefreshDate.getter@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v3 = (const void *)(v5
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24D2434F8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v8 = (char *)&v5 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)&v5 - v7;
  sub_24D25CAB4(v3, (uint64_t)&v5 - v7);
  EnergySitePayload.amiLastRefreshDate.getter(v8);
  sub_24D25CBCC(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D2435FC(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BFB8(v1, (char *)&v3 - v5);
  return EnergySitePayload.amiLastRefreshDate.setter(v6);
}

uint64_t EnergySitePayload.amiLastRefreshDate.setter(const void *a1)
{
  uint64_t v14 = a1;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v9 = (char *)&v6 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v12 = (char *)&v6 - v8;
  uint64_t v17 = v4;
  uint64_t v16 = v1;
  uint64_t v13 = sub_24D23E904();
  sub_24D24BFB8(v14, v12);
  sub_24D24BFB8(v12, v9);
  uint64_t v10 = (void *)(v13
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate);
  uint64_t v11 = &v15;
  swift_beginAccess();
  sub_24D24C0E0(v9, v10);
  swift_endAccess();
  sub_24D24C310((uint64_t)v12);
  swift_release();
  return sub_24D24C310((uint64_t)v14);
}

void (*EnergySitePayload.amiLastRefreshDate.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  a1[1] = malloc(__size);
  unint64_t v5 = malloc(__size);
  a1[2] = v5;
  EnergySitePayload.amiLastRefreshDate.getter(v5);
  return sub_24D243884;
}

void sub_24D243884(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    uint64_t v3 = *(void **)(a1 + 8);
    sub_24D24BFB8(v2, v3);
    EnergySitePayload.amiLastRefreshDate.setter(v3);
    sub_24D24C310((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 16);
    unint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.amiLastRefreshDate.setter(v4);
    free(v4);
    free(v5);
  }
}

BOOL EnergySitePayload.hasAmiLastRefreshDate.getter()
{
  uint64_t v14 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v7 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  char v12 = (char *)&v4 - v7;
  uint64_t v14 = v0;
  uint64_t v11 = 0;
  uint64_t v10 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  unint64_t v8 = (const void *)(v10
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate);
  uint64_t v9 = &v13;
  swift_beginAccess();
  sub_24D24BFB8(v8, v12);
  swift_endAccess();
  swift_release();
  uint64_t v2 = sub_24D290888();
  BOOL v6 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v2 - 8) + 48))(v12, 1) != 1;
  BOOL v5 = v6;
  sub_24D24C310((uint64_t)v12);
  return v5;
}

Swift::Void __swiftcall EnergySitePayload.clearAmiLastRefreshDate()()
{
  uint64_t v13 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  unint64_t v7 = (char *)&v4 - v5;
  unint64_t v6 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v4 - v5);
  uint64_t v10 = (char *)&v4 - v6;
  uint64_t v13 = v0;
  uint64_t v11 = sub_24D23E904();
  uint64_t v3 = sub_24D290888();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 56))(v10, 1);
  sub_24D24BFB8(v10, v7);
  unint64_t v8 = (void *)(v11
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate);
  uint64_t v9 = &v12;
  swift_beginAccess();
  sub_24D24C0E0(v7, v8);
  swift_endAccess();
  sub_24D24C310((uint64_t)v10);
  swift_release();
}

uint64_t EnergySitePayload.hasExportedEnergy_p.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (char *)(v3
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__hasExportedEnergy_p);
  swift_beginAccess();
  char v4 = *v2;
  swift_endAccess();
  swift_release();
  return v4 & 1;
}

uint64_t sub_24D243C80@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v8 = a2;
  uint64_t v6 = a1;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v6 - v7;
  sub_24D25CAB4(v2, (uint64_t)&v6 - v7);
  char v3 = EnergySitePayload.hasExportedEnergy_p.getter();
  uint64_t v4 = (uint64_t)v9;
  *unint64_t v8 = v3 & 1;
  return sub_24D25CB50(v4);
}

uint64_t sub_24D243D2C(unsigned char *a1)
{
  return EnergySitePayload.hasExportedEnergy_p.setter(*a1 & 1);
}

uint64_t EnergySitePayload.hasExportedEnergy_p.setter(char a1)
{
  char v3 = (unsigned char *)(sub_24D23E904()
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__hasExportedEnergy_p);
  swift_beginAccess();
  *char v3 = a1 & 1;
  swift_endAccess();
  return swift_release();
}

uint64_t (*EnergySitePayload.hasExportedEnergy_p.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = EnergySitePayload.hasExportedEnergy_p.getter() & 1;
  return sub_24D243E54;
}

uint64_t sub_24D243E54(uint64_t a1)
{
  return EnergySitePayload.hasExportedEnergy_p.setter(*(unsigned char *)(a1 + 8) & 1);
}

uint64_t EnergySitePayload.usagePointNextRefreshDate.getter@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  char v3 = (const void *)(v5
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24D243F40@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v8 = (char *)&v5 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)&v5 - v7;
  sub_24D25CAB4(v3, (uint64_t)&v5 - v7);
  EnergySitePayload.usagePointNextRefreshDate.getter(v8);
  sub_24D25CBCC(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D244044(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BFB8(v1, (char *)&v3 - v5);
  return EnergySitePayload.usagePointNextRefreshDate.setter(v6);
}

uint64_t EnergySitePayload.usagePointNextRefreshDate.setter(const void *a1)
{
  uint64_t v14 = a1;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v9 = (char *)&v6 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v12 = (char *)&v6 - v8;
  uint64_t v17 = v4;
  uint64_t v16 = v1;
  uint64_t v13 = sub_24D23E904();
  sub_24D24BFB8(v14, v12);
  sub_24D24BFB8(v12, v9);
  uint64_t v10 = (void *)(v13
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate);
  uint64_t v11 = &v15;
  swift_beginAccess();
  sub_24D24C0E0(v9, v10);
  swift_endAccess();
  sub_24D24C310((uint64_t)v12);
  swift_release();
  return sub_24D24C310((uint64_t)v14);
}

void (*EnergySitePayload.usagePointNextRefreshDate.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  a1[1] = malloc(__size);
  unint64_t v5 = malloc(__size);
  a1[2] = v5;
  EnergySitePayload.usagePointNextRefreshDate.getter(v5);
  return sub_24D2442CC;
}

void sub_24D2442CC(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    uint64_t v3 = *(void **)(a1 + 8);
    sub_24D24BFB8(v2, v3);
    EnergySitePayload.usagePointNextRefreshDate.setter(v3);
    sub_24D24C310((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 16);
    unint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.usagePointNextRefreshDate.setter(v4);
    free(v4);
    free(v5);
  }
}

BOOL EnergySitePayload.hasUsagePointNextRefreshDate.getter()
{
  uint64_t v14 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v7 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  char v12 = (char *)&v4 - v7;
  uint64_t v14 = v0;
  uint64_t v11 = 0;
  uint64_t v10 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  unint64_t v8 = (const void *)(v10
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate);
  uint64_t v9 = &v13;
  swift_beginAccess();
  sub_24D24BFB8(v8, v12);
  swift_endAccess();
  swift_release();
  uint64_t v2 = sub_24D290888();
  BOOL v6 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v2 - 8) + 48))(v12, 1) != 1;
  BOOL v5 = v6;
  sub_24D24C310((uint64_t)v12);
  return v5;
}

Swift::Void __swiftcall EnergySitePayload.clearUsagePointNextRefreshDate()()
{
  uint64_t v13 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  unint64_t v7 = (char *)&v4 - v5;
  unint64_t v6 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v4 - v5);
  uint64_t v10 = (char *)&v4 - v6;
  uint64_t v13 = v0;
  uint64_t v11 = sub_24D23E904();
  uint64_t v3 = sub_24D290888();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 56))(v10, 1);
  sub_24D24BFB8(v10, v7);
  unint64_t v8 = (void *)(v11
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate);
  uint64_t v9 = &v12;
  swift_beginAccess();
  sub_24D24C0E0(v7, v8);
  swift_endAccess();
  sub_24D24C310((uint64_t)v10);
  swift_release();
}

uint64_t EnergySitePayload.usageSummaryNextRefreshDate.getter@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v3 = (const void *)(v5
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24D2446C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v8 = (char *)&v5 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)&v5 - v7;
  sub_24D25CAB4(v3, (uint64_t)&v5 - v7);
  EnergySitePayload.usageSummaryNextRefreshDate.getter(v8);
  sub_24D25CBCC(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D2447C8(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BFB8(v1, (char *)&v3 - v5);
  return EnergySitePayload.usageSummaryNextRefreshDate.setter(v6);
}

uint64_t EnergySitePayload.usageSummaryNextRefreshDate.setter(const void *a1)
{
  uint64_t v14 = a1;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v9 = (char *)&v6 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v12 = (char *)&v6 - v8;
  uint64_t v17 = v4;
  uint64_t v16 = v1;
  uint64_t v13 = sub_24D23E904();
  sub_24D24BFB8(v14, v12);
  sub_24D24BFB8(v12, v9);
  uint64_t v10 = (void *)(v13
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate);
  uint64_t v11 = &v15;
  swift_beginAccess();
  sub_24D24C0E0(v9, v10);
  swift_endAccess();
  sub_24D24C310((uint64_t)v12);
  swift_release();
  return sub_24D24C310((uint64_t)v14);
}

void (*EnergySitePayload.usageSummaryNextRefreshDate.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  a1[1] = malloc(__size);
  unint64_t v5 = malloc(__size);
  a1[2] = v5;
  EnergySitePayload.usageSummaryNextRefreshDate.getter(v5);
  return sub_24D244A50;
}

void sub_24D244A50(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    uint64_t v3 = *(void **)(a1 + 8);
    sub_24D24BFB8(v2, v3);
    EnergySitePayload.usageSummaryNextRefreshDate.setter(v3);
    sub_24D24C310((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 16);
    unint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.usageSummaryNextRefreshDate.setter(v4);
    free(v4);
    free(v5);
  }
}

BOOL EnergySitePayload.hasUsageSummaryNextRefreshDate.getter()
{
  uint64_t v14 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v7 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  char v12 = (char *)&v4 - v7;
  uint64_t v14 = v0;
  uint64_t v11 = 0;
  uint64_t v10 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  unint64_t v8 = (const void *)(v10
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate);
  uint64_t v9 = &v13;
  swift_beginAccess();
  sub_24D24BFB8(v8, v12);
  swift_endAccess();
  swift_release();
  uint64_t v2 = sub_24D290888();
  BOOL v6 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v2 - 8) + 48))(v12, 1) != 1;
  BOOL v5 = v6;
  sub_24D24C310((uint64_t)v12);
  return v5;
}

Swift::Void __swiftcall EnergySitePayload.clearUsageSummaryNextRefreshDate()()
{
  uint64_t v13 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  unint64_t v7 = (char *)&v4 - v5;
  unint64_t v6 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v4 - v5);
  uint64_t v10 = (char *)&v4 - v6;
  uint64_t v13 = v0;
  uint64_t v11 = sub_24D23E904();
  uint64_t v3 = sub_24D290888();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 56))(v10, 1);
  sub_24D24BFB8(v10, v7);
  unint64_t v8 = (void *)(v11
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate);
  uint64_t v9 = &v12;
  swift_beginAccess();
  sub_24D24C0E0(v7, v8);
  swift_endAccess();
  sub_24D24C310((uint64_t)v10);
  swift_release();
}

uint64_t EnergySitePayload.intervalBlockNextRefreshDate.getter@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v3 = (const void *)(v5
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24D244E48@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v8 = (char *)&v5 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)&v5 - v7;
  sub_24D25CAB4(v3, (uint64_t)&v5 - v7);
  EnergySitePayload.intervalBlockNextRefreshDate.getter(v8);
  sub_24D25CBCC(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D244F4C(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BFB8(v1, (char *)&v3 - v5);
  return EnergySitePayload.intervalBlockNextRefreshDate.setter(v6);
}

uint64_t EnergySitePayload.intervalBlockNextRefreshDate.setter(const void *a1)
{
  uint64_t v14 = a1;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v9 = (char *)&v6 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v12 = (char *)&v6 - v8;
  uint64_t v17 = v4;
  uint64_t v16 = v1;
  uint64_t v13 = sub_24D23E904();
  sub_24D24BFB8(v14, v12);
  sub_24D24BFB8(v12, v9);
  uint64_t v10 = (void *)(v13
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate);
  uint64_t v11 = &v15;
  swift_beginAccess();
  sub_24D24C0E0(v9, v10);
  swift_endAccess();
  sub_24D24C310((uint64_t)v12);
  swift_release();
  return sub_24D24C310((uint64_t)v14);
}

void (*EnergySitePayload.intervalBlockNextRefreshDate.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  a1[1] = malloc(__size);
  unint64_t v5 = malloc(__size);
  a1[2] = v5;
  EnergySitePayload.intervalBlockNextRefreshDate.getter(v5);
  return sub_24D2451D4;
}

void sub_24D2451D4(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    uint64_t v3 = *(void **)(a1 + 8);
    sub_24D24BFB8(v2, v3);
    EnergySitePayload.intervalBlockNextRefreshDate.setter(v3);
    sub_24D24C310((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 16);
    unint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.intervalBlockNextRefreshDate.setter(v4);
    free(v4);
    free(v5);
  }
}

BOOL EnergySitePayload.hasIntervalBlockNextRefreshDate.getter()
{
  uint64_t v14 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v7 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  char v12 = (char *)&v4 - v7;
  uint64_t v14 = v0;
  uint64_t v11 = 0;
  uint64_t v10 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  unint64_t v8 = (const void *)(v10
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate);
  uint64_t v9 = &v13;
  swift_beginAccess();
  sub_24D24BFB8(v8, v12);
  swift_endAccess();
  swift_release();
  uint64_t v2 = sub_24D290888();
  BOOL v6 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v2 - 8) + 48))(v12, 1) != 1;
  BOOL v5 = v6;
  sub_24D24C310((uint64_t)v12);
  return v5;
}

Swift::Void __swiftcall EnergySitePayload.clearIntervalBlockNextRefreshDate()()
{
  uint64_t v13 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  unint64_t v7 = (char *)&v4 - v5;
  unint64_t v6 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v4 - v5);
  uint64_t v10 = (char *)&v4 - v6;
  uint64_t v13 = v0;
  uint64_t v11 = sub_24D23E904();
  uint64_t v3 = sub_24D290888();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 56))(v10, 1);
  sub_24D24BFB8(v10, v7);
  unint64_t v8 = (void *)(v11
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate);
  uint64_t v9 = &v12;
  swift_beginAccess();
  sub_24D24C0E0(v7, v8);
  swift_endAccess();
  sub_24D24C310((uint64_t)v10);
  swift_release();
}

uint64_t EnergySitePayload.subscriptionState.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (uint64_t *)(v3
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionState);
  swift_beginAccess();
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D2455DC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v9 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v9 - v10);
  uint64_t v3 = EnergySitePayload.subscriptionState.getter();
  uint64_t v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  *uint64_t v11 = v5;
  v4[1] = v7;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D245688(void *a1)
{
  sub_24D229294(a1, v2);
  return EnergySitePayload.subscriptionState.setter(v2[0], v2[1]);
}

uint64_t EnergySitePayload.subscriptionState.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)(v5
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionState);
  swift_beginAccess();
  *uint64_t v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.subscriptionState.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = EnergySitePayload.subscriptionState.getter();
  a1[1] = v2;
  return sub_24D2457EC;
}

uint64_t sub_24D2457EC(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.subscriptionState.setter(*a1, a1[1]);
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  EnergySitePayload.subscriptionState.setter(v3, v4);
  uint64_t result = (uint64_t)a1;
  sub_24D22F624();
  return result;
}

uint64_t EnergySitePayload.subscriptionCreationDate.getter@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v3 = (const void *)(v5
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionCreationDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24D2458F4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v8 = (char *)&v5 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)&v5 - v7;
  sub_24D25CAB4(v3, (uint64_t)&v5 - v7);
  EnergySitePayload.subscriptionCreationDate.getter(v8);
  sub_24D25CBCC(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D2459F8(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BFB8(v1, (char *)&v3 - v5);
  return EnergySitePayload.subscriptionCreationDate.setter(v6);
}

uint64_t EnergySitePayload.subscriptionCreationDate.setter(const void *a1)
{
  uint64_t v14 = a1;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v9 = (char *)&v6 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v12 = (char *)&v6 - v8;
  uint64_t v17 = v4;
  uint64_t v16 = v1;
  uint64_t v13 = sub_24D23E904();
  sub_24D24BFB8(v14, v12);
  sub_24D24BFB8(v12, v9);
  uint64_t v10 = (void *)(v13
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionCreationDate);
  uint64_t v11 = &v15;
  swift_beginAccess();
  sub_24D24C0E0(v9, v10);
  swift_endAccess();
  sub_24D24C310((uint64_t)v12);
  swift_release();
  return sub_24D24C310((uint64_t)v14);
}

void (*EnergySitePayload.subscriptionCreationDate.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  a1[1] = malloc(__size);
  unint64_t v5 = malloc(__size);
  a1[2] = v5;
  EnergySitePayload.subscriptionCreationDate.getter(v5);
  return sub_24D245C80;
}

void sub_24D245C80(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    uint64_t v3 = *(void **)(a1 + 8);
    sub_24D24BFB8(v2, v3);
    EnergySitePayload.subscriptionCreationDate.setter(v3);
    sub_24D24C310((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 16);
    unint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.subscriptionCreationDate.setter(v4);
    free(v4);
    free(v5);
  }
}

uint64_t EnergySitePayload.subscriptionStartDate.getter@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v3 = (const void *)(v5
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionStartDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24D245DC0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v8 = (char *)&v5 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)&v5 - v7;
  sub_24D25CAB4(v3, (uint64_t)&v5 - v7);
  EnergySitePayload.subscriptionStartDate.getter(v8);
  sub_24D25CBCC(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D245EC4(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BFB8(v1, (char *)&v3 - v5);
  return EnergySitePayload.subscriptionStartDate.setter(v6);
}

uint64_t EnergySitePayload.subscriptionStartDate.setter(const void *a1)
{
  uint64_t v14 = a1;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v9 = (char *)&v6 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v12 = (char *)&v6 - v8;
  uint64_t v17 = v4;
  uint64_t v16 = v1;
  uint64_t v13 = sub_24D23E904();
  sub_24D24BFB8(v14, v12);
  sub_24D24BFB8(v12, v9);
  uint64_t v10 = (void *)(v13
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionStartDate);
  uint64_t v11 = &v15;
  swift_beginAccess();
  sub_24D24C0E0(v9, v10);
  swift_endAccess();
  sub_24D24C310((uint64_t)v12);
  swift_release();
  return sub_24D24C310((uint64_t)v14);
}

void (*EnergySitePayload.subscriptionStartDate.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  a1[1] = malloc(__size);
  unint64_t v5 = malloc(__size);
  a1[2] = v5;
  EnergySitePayload.subscriptionStartDate.getter(v5);
  return sub_24D24614C;
}

void sub_24D24614C(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    uint64_t v3 = *(void **)(a1 + 8);
    sub_24D24BFB8(v2, v3);
    EnergySitePayload.subscriptionStartDate.setter(v3);
    sub_24D24C310((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 16);
    unint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.subscriptionStartDate.setter(v4);
    free(v4);
    free(v5);
  }
}

uint64_t EnergySitePayload.siteTombstone.getter@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v3 = (const void *)(v5
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteTombstone);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24D24628C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v6 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v5 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  unint64_t v8 = (char *)&v5 - v5;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t)&v5 - v7;
  sub_24D25CAB4(v3, (uint64_t)&v5 - v7);
  EnergySitePayload.siteTombstone.getter(v8);
  sub_24D25CBCC(v8, v9);
  return sub_24D25CB50(v10);
}

uint64_t sub_24D246390(uint64_t a1)
{
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v3 - v5;
  sub_24D24BFB8(v1, (char *)&v3 - v5);
  return EnergySitePayload.siteTombstone.setter(v6);
}

uint64_t EnergySitePayload.siteTombstone.setter(const void *a1)
{
  uint64_t v14 = a1;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v9 = (char *)&v6 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v12 = (char *)&v6 - v8;
  uint64_t v17 = v4;
  uint64_t v16 = v1;
  uint64_t v13 = sub_24D23E904();
  sub_24D24BFB8(v14, v12);
  sub_24D24BFB8(v12, v9);
  uint64_t v10 = (void *)(v13
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteTombstone);
  uint64_t v11 = &v15;
  swift_beginAccess();
  sub_24D24C0E0(v9, v10);
  swift_endAccess();
  sub_24D24C310((uint64_t)v12);
  swift_release();
  return sub_24D24C310((uint64_t)v14);
}

void (*EnergySitePayload.siteTombstone.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t __size = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  a1[1] = malloc(__size);
  unint64_t v5 = malloc(__size);
  a1[2] = v5;
  EnergySitePayload.siteTombstone.getter(v5);
  return sub_24D246618;
}

void sub_24D246618(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    uint64_t v3 = *(void **)(a1 + 8);
    sub_24D24BFB8(v2, v3);
    EnergySitePayload.siteTombstone.setter(v3);
    sub_24D24C310((uint64_t)v2);
    free(v2);
    free(v3);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 16);
    unint64_t v5 = *(void **)(a1 + 8);
    EnergySitePayload.siteTombstone.setter(v4);
    free(v4);
    free(v5);
  }
}

uint64_t EnergySitePayload.siteVersion.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (int *)(v3
             + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteVersion);
  swift_beginAccess();
  int v4 = *v2;
  char v5 = *((unsigned char *)v2 + 4);
  swift_endAccess();
  swift_release();
  LODWORD(v6) = v4;
  BYTE4(v6) = v5 & 1;
  return v6;
}

uint64_t sub_24D246778@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v9 = a1;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v8 - v10;
  sub_24D25CAB4(v2, (uint64_t)&v8 - v10);
  uint64_t v3 = EnergySitePayload.siteVersion.getter();
  int v4 = v11;
  uint64_t v5 = v3;
  uint64_t v6 = (uint64_t)v12;
  uint64_t v13 = v5;
  *uint64_t v11 = v5;
  *((unsigned char *)v4 + 4) = BYTE4(v5) & 1;
  return sub_24D25CB50(v6);
}

uint64_t sub_24D246838(uint64_t a1)
{
  LODWORD(v2) = *(_DWORD *)a1;
  BYTE4(v2) = *(unsigned char *)(a1 + 4) & 1;
  return EnergySitePayload.siteVersion.setter(v2);
}

uint64_t EnergySitePayload.siteVersion.setter(uint64_t a1)
{
  int v2 = a1;
  char v3 = BYTE4(a1);
  uint64_t v4 = sub_24D23E904()
     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteVersion;
  swift_beginAccess();
  *(_DWORD *)uint64_t v4 = v2;
  *(unsigned char *)(v4 + 4) = v3 & 1;
  swift_endAccess();
  return swift_release();
}

uint64_t (*EnergySitePayload.siteVersion.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)a1 = v1;
  uint64_t v2 = EnergySitePayload.siteVersion.getter();
  *(_DWORD *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 12) = BYTE4(v2) & 1;
  return sub_24D2469B4;
}

uint64_t sub_24D2469B4(uint64_t a1, char a2)
{
  if (a2)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 8);
    BYTE4(v3) = *(unsigned char *)(a1 + 12) & 1;
    return EnergySitePayload.siteVersion.setter(v3);
  }
  else
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 8);
    BYTE4(v4) = *(unsigned char *)(a1 + 12) & 1;
    return EnergySitePayload.siteVersion.setter(v4);
  }
}

uint64_t EnergySitePayload.generationMeters.getter()
{
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v2 = (uint64_t *)(v3
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__generationMeters);
  swift_beginAccess();
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t sub_24D246ACC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v8 = a2;
  uint64_t v6 = a1;
  unint64_t v7 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v6 - v7;
  sub_24D25CAB4(v2, (uint64_t)&v6 - v7);
  uint64_t v3 = EnergySitePayload.generationMeters.getter();
  uint64_t v4 = (uint64_t)v9;
  *uint64_t v8 = v3;
  return sub_24D25CB50(v4);
}

uint64_t sub_24D246B74(uint64_t *a1)
{
  sub_24D25CA7C(a1, &v2);
  return EnergySitePayload.generationMeters.setter(v2);
}

uint64_t EnergySitePayload.generationMeters.setter(uint64_t a1)
{
  uint64_t v3 = sub_24D23E904();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)(v3
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__generationMeters);
  swift_beginAccess();
  *uint64_t v2 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t (*EnergySitePayload.generationMeters.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = EnergySitePayload.generationMeters.getter();
  return sub_24D246CB8;
}

uint64_t sub_24D246CB8(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return EnergySitePayload.generationMeters.setter(*a1);
  }
  uint64_t v3 = *a1;
  swift_bridgeObjectRetain();
  EnergySitePayload.generationMeters.setter(v3);
  uint64_t result = (uint64_t)a1;
  sub_24D230030();
  return result;
}

uint64_t sub_24D246D24()
{
  return sub_24D2908A8();
}

uint64_t EnergySitePayload.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_24D2908B8();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v1 - 8) + 16))(a1);
}

uint64_t EnergySitePayload.unknownFields.setter(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v13 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = sub_24D2908B8();
  uint64_t v8 = *(void *)(v10 - 8);
  uint64_t v9 = v10 - 8;
  unint64_t v5 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v6 = (char *)&v4 - v5;
  uint64_t v13 = v2;
  uint64_t v12 = v1;
  (*(void (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v7, v6, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v10);
}

void (*EnergySitePayload.unknownFields.modify())()
{
  return sub_24D22F4D8;
}

uint64_t sub_24D246F08()
{
  return sub_24D290FA8();
}

uint64_t EnergySitePayload.CurrentRatePlan.ratePlan.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t EnergySitePayload.CurrentRatePlan.ratePlan.setter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  *uint64_t v1 = a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*EnergySitePayload.CurrentRatePlan.ratePlan.modify())()
{
  return sub_24D22F4D8;
}

uint64_t EnergySitePayload.CurrentRatePlan.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(int *)(type metadata accessor for EnergySitePayload.CurrentRatePlan() + 20);
  uint64_t v2 = sub_24D2908B8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t EnergySitePayload.CurrentRatePlan.unknownFields.setter(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  uint64_t v7 = 0;
  uint64_t v11 = sub_24D2908B8();
  uint64_t v9 = *(void *)(v11 - 8);
  uint64_t v10 = v11 - 8;
  unint64_t v6 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11);
  uint64_t v8 = (char *)&v5 - v6;
  uint64_t v14 = v2;
  uint64_t v13 = v1;
  (*(void (**)(void))(v9 + 16))();
  uint64_t v3 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v1 + *(int *)(v3 + 20), v8, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v12, v11);
}

void (*EnergySitePayload.CurrentRatePlan.unknownFields.modify())()
{
  return sub_24D22F4D8;
}

uint64_t sub_24D247210()
{
  return sub_24D290B28();
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.identifier.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.identifier.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  *uint64_t v2 = a1;
  v2[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*EnergySitePayload.CurrentRatePlan.RatePlan.identifier.modify())()
{
  return sub_24D22F4D8;
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.descriptor.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.descriptor.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*EnergySitePayload.CurrentRatePlan.RatePlan.descriptor.modify())()
{
  return sub_24D22F4D8;
}

uint64_t sub_24D2473FC()
{
  return sub_24D290518();
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.peaks.getter()
{
  uint64_t v2 = *(void *)(v0 + 32);
  sub_24D229320(v2, *(void *)(v0 + 40));
  return v2;
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.peaks.setter(uint64_t a1, unint64_t a2)
{
  sub_24D229320(a1, a2);
  uint64_t v3 = *(void *)(v2 + 32);
  unint64_t v4 = *(void *)(v2 + 40);
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  sub_24D2293AC(v3, v4);
  return sub_24D2293AC(a1, a2);
}

void (*EnergySitePayload.CurrentRatePlan.RatePlan.peaks.modify())()
{
  return sub_24D22F4D8;
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(int *)(type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan() + 28);
  uint64_t v2 = sub_24D2908B8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.unknownFields.setter(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  uint64_t v7 = 0;
  uint64_t v11 = sub_24D2908B8();
  uint64_t v9 = *(void *)(v11 - 8);
  uint64_t v10 = v11 - 8;
  unint64_t v6 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11);
  uint64_t v8 = (char *)&v5 - v6;
  uint64_t v14 = v2;
  uint64_t v13 = v1;
  (*(void (**)(void))(v9 + 16))();
  uint64_t v3 = type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v1 + *(int *)(v3 + 28), v8, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v12, v11);
}

void (*EnergySitePayload.CurrentRatePlan.RatePlan.unknownFields.modify())()
{
  return sub_24D22F4D8;
}

char *EnergySitePayload.CurrentRatePlan.RatePlan.init()@<X0>(char *a1@<X8>)
{
  char v15 = a1;
  uint64_t v16 = 0;
  uint64_t v13 = type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
  unint64_t v12 = (*(void *)(*(void *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = (char *)&v11 - v12;
  uint64_t v16 = (char *)&v11 - v12;
  uint64_t v1 = sub_24D290B28();
  uint64_t v2 = v14;
  *(void *)uint64_t v14 = v1;
  *((void *)v2 + 1) = v3;
  uint64_t v4 = sub_24D290B28();
  uint64_t v5 = v14;
  *((void *)v14 + 2) = v4;
  *((void *)v5 + 3) = v6;
  uint64_t v7 = sub_24D290518();
  uint64_t v8 = v14;
  *((void *)v14 + 4) = v7;
  *((void *)v8 + 5) = v9;
  sub_24D2908A8();
  return sub_24D24C3C0(v14, v15);
}

uint64_t EnergySitePayload.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v10 = a1;
  uint64_t v11 = 0;
  uint64_t v6 = type metadata accessor for EnergySitePayload();
  unint64_t v5 = (*(void *)(*(void *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = (char *)&v4 - v5;
  uint64_t v11 = (char *)&v4 - v5;
  sub_24D2908A8();
  uint64_t v8 = *(int *)(v6 + 20);
  uint64_t v9 = *sub_24D2478BC();
  swift_retain();
  uint64_t v1 = (uint64_t)v7;
  uint64_t v2 = v10;
  *(void *)&v7[v8] = v9;
  return sub_24D24C46C(v1, v2);
}

uint64_t sub_24D24788C()
{
  uint64_t v1 = *sub_24D2478BC();
  swift_retain();
  return v1;
}

uint64_t *sub_24D2478BC()
{
  if (qword_26B18BD48 != -1) {
    swift_once();
  }
  return &qword_26B18BD40;
}

uint64_t sub_24D247920()
{
  uint64_t result = sub_24D290C08();
  qword_26985E098 = result;
  qword_26985E0A0 = v1;
  return result;
}

uint64_t *sub_24D247964()
{
  if (qword_26985E090 != -1) {
    swift_once();
  }
  return &qword_26985E098;
}

uint64_t static EnergySitePayload.protoMessageName.getter()
{
  uint64_t v1 = *sub_24D247964();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D247A04()
{
  uint64_t v92 = sub_24D290A98();
  __swift_allocate_value_buffer(v92, qword_26B18BEE0);
  __swift_project_value_buffer(v92, (uint64_t)qword_26B18BEE0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8E8);
  sub_24D290FA8();
  uint64_t v96 = v0;
  uint64_t v1 = *(int *)(v98 + 48);
  *uint64_t v0 = 1;
  uint64_t v94 = (char *)v0 + v1;
  *(void *)uint64_t v94 = "siteName";
  *((void *)v94 + 1) = 8;
  v94[16] = 2;
  unsigned int v93 = *MEMORY[0x263F50718];
  uint64_t v97 = *(void (**)(void))(*(void *)(sub_24D290A78() - 8) + 104);
  ((void (*)(char *, void))v97)(v94, v93);
  uint64_t v95 = *(void *)(*(void *)(v98 - 8) + 72);
  uint64_t v2 = *(int *)(v98 + 48);
  *(void *)((char *)v96 + v95) = 2;
  uint64_t v3 = (char *)v96 + v95 + v2;
  *(void *)uint64_t v3 = "latitude";
  *((void *)v3 + 1) = 8;
  v3[16] = 2;
  v97();
  uint64_t v4 = *(int *)(v98 + 48);
  unint64_t v5 = (void *)((char *)v96 + 2 * v95);
  *unint64_t v5 = 3;
  uint64_t v6 = (char *)v5 + v4;
  *(void *)uint64_t v6 = "longitude";
  *((void *)v6 + 1) = 9;
  v6[16] = 2;
  v97();
  uint64_t v7 = *(int *)(v98 + 48);
  uint64_t v8 = (void *)((char *)v96 + 3 * v95);
  *uint64_t v8 = 4;
  uint64_t v9 = (char *)v8 + v7;
  *(void *)uint64_t v9 = "utilityID";
  *((void *)v9 + 1) = 9;
  v9[16] = 2;
  v97();
  uint64_t v10 = *(int *)(v98 + 48);
  uint64_t v11 = (void *)((char *)v96 + 4 * v95);
  *uint64_t v11 = 5;
  unint64_t v12 = (char *)v11 + v10;
  *(void *)unint64_t v12 = "subscriptionID";
  *((void *)v12 + 1) = 14;
  v12[16] = 2;
  v97();
  uint64_t v13 = *(int *)(v98 + 48);
  uint64_t v14 = (void *)((char *)v96 + 5 * v95);
  *uint64_t v14 = 6;
  char v15 = (char *)v14 + v13;
  *(void *)char v15 = "accessToken";
  *((void *)v15 + 1) = 11;
  v15[16] = 2;
  v97();
  uint64_t v16 = *(int *)(v98 + 48);
  uint64_t v17 = (void *)((char *)v96 + 6 * v95);
  *uint64_t v17 = 7;
  uint64_t v18 = (char *)v17 + v16;
  *(void *)uint64_t v18 = "refreshToken";
  *((void *)v18 + 1) = 12;
  v18[16] = 2;
  v97();
  uint64_t v19 = *(int *)(v98 + 48);
  char v20 = (void *)((char *)v96 + 7 * v95);
  void *v20 = 8;
  uint64_t v21 = (char *)v20 + v19;
  *(void *)uint64_t v21 = "timezone";
  *((void *)v21 + 1) = 8;
  v21[16] = 2;
  v97();
  uint64_t v22 = *(int *)(v98 + 48);
  uint64_t v23 = &v96[v95];
  *uint64_t v23 = 9;
  char v24 = (char *)v23 + v22;
  *(void *)char v24 = "currentRatePlan";
  *((void *)v24 + 1) = 15;
  v24[16] = 2;
  v97();
  uint64_t v25 = *(int *)(v98 + 48);
  uint64_t v26 = (void *)((char *)v96 + 9 * v95);
  *uint64_t v26 = 10;
  uint64_t v27 = (char *)v26 + v25;
  *(void *)uint64_t v27 = "usagePointCustomIndex";
  *((void *)v27 + 1) = 21;
  v27[16] = 2;
  v97();
  uint64_t v28 = *(int *)(v98 + 48);
  uint64_t v29 = (void *)((char *)v96 + 10 * v95);
  *uint64_t v29 = 11;
  unint64_t v30 = (char *)v29 + v28;
  *(void *)unint64_t v30 = "usageSummaryCustomIndex";
  *((void *)v30 + 1) = 23;
  v30[16] = 2;
  v97();
  uint64_t v31 = *(int *)(v98 + 48);
  unint64_t v32 = (void *)((char *)v96 + 11 * v95);
  *unint64_t v32 = 12;
  unint64_t v33 = (char *)v32 + v31;
  *(void *)unint64_t v33 = "intervalBlockCustomIndex";
  *((void *)v33 + 1) = 24;
  v33[16] = 2;
  v97();
  uint64_t v34 = *(int *)(v98 + 48);
  unint64_t v35 = (void *)((char *)v96 + 12 * v95);
  *unint64_t v35 = 13;
  unint64_t v36 = (char *)v35 + v34;
  *(void *)unint64_t v36 = "ckFunctionToken";
  *((void *)v36 + 1) = 15;
  v36[16] = 2;
  v97();
  uint64_t v37 = *(int *)(v98 + 48);
  uint64_t v38 = (void *)((char *)v96 + 13 * v95);
  *uint64_t v38 = 14;
  uint64_t v39 = (char *)v38 + v37;
  *(void *)uint64_t v39 = "accountName";
  *((void *)v39 + 1) = 11;
  v39[16] = 2;
  v97();
  uint64_t v40 = *(int *)(v98 + 48);
  int v41 = (void *)((char *)v96 + 14 * v95);
  *int v41 = 15;
  uint64_t v42 = (char *)v41 + v40;
  *(void *)uint64_t v42 = "accountNumber";
  *((void *)v42 + 1) = 13;
  v42[16] = 2;
  v97();
  uint64_t v43 = *(int *)(v98 + 48);
  uint64_t v44 = (void *)((char *)v96 + 15 * v95);
  *uint64_t v44 = 16;
  uint64_t v45 = (char *)v44 + v43;
  *(void *)uint64_t v45 = "address";
  *((void *)v45 + 1) = 7;
  v45[16] = 2;
  v97();
  uint64_t v46 = *(int *)(v98 + 48);
  uint64_t v47 = &v96[2 * v95];
  *uint64_t v47 = 17;
  uint64_t v48 = (char *)v47 + v46;
  *(void *)uint64_t v48 = "serviceLocationID";
  *((void *)v48 + 1) = 17;
  v48[16] = 2;
  v97();
  uint64_t v49 = *(int *)(v98 + 48);
  uint64_t v50 = (void *)((char *)v96 + 17 * v95);
  *uint64_t v50 = 18;
  uint64_t v51 = (char *)v50 + v49;
  *(void *)uint64_t v51 = "alternateSupplier";
  *((void *)v51 + 1) = 17;
  v51[16] = 2;
  v97();
  uint64_t v52 = *(int *)(v98 + 48);
  uint64_t v53 = (void *)((char *)v96 + 18 * v95);
  void *v53 = 19;
  uint64_t v54 = (char *)v53 + v52;
  *(void *)uint64_t v54 = "accessTokenExpirationDate";
  *((void *)v54 + 1) = 25;
  v54[16] = 2;
  v97();
  uint64_t v55 = *(int *)(v98 + 48);
  uint64_t v56 = (void *)((char *)v96 + 19 * v95);
  *uint64_t v56 = 20;
  unint64_t v57 = (char *)v56 + v55;
  *(void *)unint64_t v57 = "utilitySupportedCheckDate";
  *((void *)v57 + 1) = 25;
  v57[16] = 2;
  v97();
  uint64_t v58 = *(int *)(v98 + 48);
  uint64_t v59 = (void *)((char *)v96 + 20 * v95);
  *uint64_t v59 = 21;
  uint64_t v60 = (char *)v59 + v58;
  *(void *)uint64_t v60 = "amiLastRefreshDate";
  *((void *)v60 + 1) = 18;
  v60[16] = 2;
  v97();
  uint64_t v61 = *(int *)(v98 + 48);
  uint64_t v62 = (void *)((char *)v96 + 21 * v95);
  *uint64_t v62 = 22;
  uint64_t v63 = (char *)v62 + v61;
  *(void *)uint64_t v63 = "hasExportedEnergy";
  *((void *)v63 + 1) = 17;
  v63[16] = 2;
  v97();
  uint64_t v64 = *(int *)(v98 + 48);
  uint64_t v65 = (void *)((char *)v96 + 22 * v95);
  void *v65 = 23;
  uint64_t v66 = (char *)v65 + v64;
  *(void *)uint64_t v66 = "usagePointNextRefreshDate";
  *((void *)v66 + 1) = 25;
  v66[16] = 2;
  v97();
  uint64_t v67 = *(int *)(v98 + 48);
  uint64_t v68 = (void *)((char *)v96 + 23 * v95);
  *uint64_t v68 = 24;
  uint64_t v69 = (char *)v68 + v67;
  *(void *)uint64_t v69 = "usageSummaryNextRefreshDate";
  *((void *)v69 + 1) = 27;
  v69[16] = 2;
  v97();
  uint64_t v70 = *(int *)(v98 + 48);
  uint64_t v71 = &v96[3 * v95];
  void *v71 = 25;
  uint64_t v72 = (char *)v71 + v70;
  *(void *)uint64_t v72 = "intervalBlockNextRefreshDate";
  *((void *)v72 + 1) = 28;
  v72[16] = 2;
  v97();
  uint64_t v73 = *(int *)(v98 + 48);
  unint64_t v74 = (void *)((char *)v96 + 25 * v95);
  *unint64_t v74 = 26;
  uint64_t v75 = (char *)v74 + v73;
  *(void *)uint64_t v75 = "subscriptionState";
  *((void *)v75 + 1) = 17;
  v75[16] = 2;
  v97();
  uint64_t v76 = *(int *)(v98 + 48);
  int v77 = (void *)((char *)v96 + 26 * v95);
  *int v77 = 27;
  uint64_t v78 = (char *)v77 + v76;
  *(void *)uint64_t v78 = "subscriptionCreationDate";
  *((void *)v78 + 1) = 24;
  v78[16] = 2;
  v97();
  uint64_t v79 = *(int *)(v98 + 48);
  uint64_t v80 = (void *)((char *)v96 + 27 * v95);
  *uint64_t v80 = 28;
  unint64_t v81 = (char *)v80 + v79;
  *(void *)unint64_t v81 = "subscriptionStartDate";
  *((void *)v81 + 1) = 21;
  v81[16] = 2;
  v97();
  uint64_t v82 = *(int *)(v98 + 48);
  uint64_t v83 = (void *)((char *)v96 + 28 * v95);
  void *v83 = 29;
  uint64_t v84 = (char *)v83 + v82;
  *(void *)uint64_t v84 = "siteTombstone";
  *((void *)v84 + 1) = 13;
  v84[16] = 2;
  v97();
  uint64_t v85 = *(int *)(v98 + 48);
  uint64_t v86 = (void *)((char *)v96 + 29 * v95);
  *uint64_t v86 = 30;
  uint64_t v87 = (char *)v86 + v85;
  *(void *)uint64_t v87 = "siteVersion";
  *((void *)v87 + 1) = 11;
  v87[16] = 2;
  v97();
  uint64_t v88 = *(int *)(v98 + 48);
  uint64_t v89 = (void *)((char *)v96 + 30 * v95);
  *uint64_t v89 = 31;
  uint64_t v90 = (char *)v89 + v88;
  *(void *)uint64_t v90 = "generationMeters";
  *((void *)v90 + 1) = 16;
  v90[16] = 2;
  v97();
  sub_24D22AD58();
  return sub_24D290A88();
}

uint64_t sub_24D2488E0()
{
  if (qword_26B18BEF8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24D290A98();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26B18BEE0);
}

uint64_t static EnergySitePayload._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24D2488E0();
  uint64_t v1 = sub_24D290A98();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_24D2489B4()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_24D248A10(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D248A80())()
{
  return sub_24D22F264;
}

double sub_24D248ADC()
{
  swift_beginAccess();
  double v2 = *(double *)(v0 + 32);
  swift_endAccess();
  return v2;
}

uint64_t sub_24D248B28(double a1)
{
  swift_beginAccess();
  *(double *)(v1 + 32) = a1;
  return swift_endAccess();
}

uint64_t (*sub_24D248B74())()
{
  return sub_24D22F264;
}

double sub_24D248BD0()
{
  swift_beginAccess();
  double v2 = *(double *)(v0 + 40);
  swift_endAccess();
  return v2;
}

uint64_t sub_24D248C1C(double a1)
{
  swift_beginAccess();
  *(double *)(v1 + 40) = a1;
  return swift_endAccess();
}

uint64_t (*sub_24D248C68())()
{
  return sub_24D22F264;
}

uint64_t sub_24D248CC4()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_24D248D20(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D248D90())()
{
  return sub_24D22F264;
}

uint64_t sub_24D248DEC()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_24D248E48(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D248EB8())()
{
  return sub_24D22F264;
}

uint64_t sub_24D248F14()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_24D248F70(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D248FE0())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24903C()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_24D249098(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D249108())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249164()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_24D2491C0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D249230())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24928C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan);
  swift_beginAccess();
  sub_24D24B80C(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D2492E8(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8) - 8) + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (uint64_t *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (unint64_t *)((char *)&v4 - v4);
  sub_24D24B80C(v2, (unint64_t *)((char *)&v4 - v4));
  uint64_t v6 = (void *)(v1
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24BC08(v5, v6);
  swift_endAccess();
  return sub_24D24B9F0(v8);
}

uint64_t (*sub_24D2493B0())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249414()
{
  uint64_t v2 = v0
     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  sub_24D229320(*(void *)v2, *(void *)(v2 + 8));
  swift_endAccess();
  return v3;
}

uint64_t sub_24D249480(uint64_t a1, unint64_t a2)
{
  sub_24D229320(a1, a2);
  uint64_t v6 = (uint64_t *)(v2
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex);
  swift_beginAccess();
  uint64_t v3 = *v6;
  unint64_t v4 = v6[1];
  *uint64_t v6 = a1;
  v6[1] = a2;
  sub_24D2293AC(v3, v4);
  swift_endAccess();
  return sub_24D2293AC(a1, a2);
}

uint64_t (*sub_24D249504())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249568()
{
  uint64_t v2 = v0
     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  sub_24D229320(*(void *)v2, *(void *)(v2 + 8));
  swift_endAccess();
  return v3;
}

uint64_t sub_24D2495D4(uint64_t a1, unint64_t a2)
{
  sub_24D229320(a1, a2);
  uint64_t v6 = (uint64_t *)(v2
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex);
  swift_beginAccess();
  uint64_t v3 = *v6;
  unint64_t v4 = v6[1];
  *uint64_t v6 = a1;
  v6[1] = a2;
  sub_24D2293AC(v3, v4);
  swift_endAccess();
  return sub_24D2293AC(a1, a2);
}

uint64_t (*sub_24D249658())()
{
  return sub_24D22F264;
}

uint64_t sub_24D2496BC()
{
  uint64_t v2 = v0
     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  sub_24D229320(*(void *)v2, *(void *)(v2 + 8));
  swift_endAccess();
  return v3;
}

uint64_t sub_24D249728(uint64_t a1, unint64_t a2)
{
  sub_24D229320(a1, a2);
  uint64_t v6 = (uint64_t *)(v2
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex);
  swift_beginAccess();
  uint64_t v3 = *v6;
  unint64_t v4 = v6[1];
  *uint64_t v6 = a1;
  v6[1] = a2;
  sub_24D2293AC(v3, v4);
  swift_endAccess();
  return sub_24D2293AC(a1, a2);
}

uint64_t (*sub_24D2497AC())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249810()
{
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__ckFunctionToken);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D24987C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unint64_t v5 = (void *)(v2
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__ckFunctionToken);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D2498FC())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249960()
{
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountName);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D2499CC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unint64_t v5 = (void *)(v2
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountName);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D249A4C())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249AB0()
{
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountNumber);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D249B1C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unint64_t v5 = (void *)(v2
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountNumber);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D249B9C())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249C00()
{
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__address);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D249C6C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unint64_t v5 = (void *)(v2
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__address);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D249CEC())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249D50()
{
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__serviceLocationID);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D249DBC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unint64_t v5 = (void *)(v2
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__serviceLocationID);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D249E3C())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249EA0()
{
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__alternateSupplier);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D249F0C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unint64_t v5 = (void *)(v2
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__alternateSupplier);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D249F8C())()
{
  return sub_24D22F264;
}

uint64_t sub_24D249FF0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D24A04C(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (char *)&v4 - v4;
  sub_24D24BFB8(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24C0E0(v5, v6);
  swift_endAccess();
  return sub_24D24C310(v8);
}

uint64_t (*sub_24D24A114())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24A178@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D24A1D4(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (char *)&v4 - v4;
  sub_24D24BFB8(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24C0E0(v5, v6);
  swift_endAccess();
  return sub_24D24C310(v8);
}

uint64_t (*sub_24D24A29C())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24A300@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D24A35C(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (char *)&v4 - v4;
  sub_24D24BFB8(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24C0E0(v5, v6);
  swift_endAccess();
  return sub_24D24C310(v8);
}

uint64_t (*sub_24D24A424())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24A488()
{
  uint64_t v2 = (char *)(v0
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__hasExportedEnergy_p);
  swift_beginAccess();
  char v3 = *v2;
  swift_endAccess();
  return v3 & 1;
}

uint64_t sub_24D24A4E8(char a1)
{
  unint64_t v4 = (unsigned char *)(v1
               + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__hasExportedEnergy_p);
  swift_beginAccess();
  *unint64_t v4 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*sub_24D24A548())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24A5AC@<X0>(void *a1@<X8>)
{
  char v3 = (const void *)(v1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D24A608(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (char *)&v4 - v4;
  sub_24D24BFB8(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24C0E0(v5, v6);
  swift_endAccess();
  return sub_24D24C310(v8);
}

uint64_t (*sub_24D24A6D0())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24A734@<X0>(void *a1@<X8>)
{
  char v3 = (const void *)(v1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D24A790(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (char *)&v4 - v4;
  sub_24D24BFB8(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24C0E0(v5, v6);
  swift_endAccess();
  return sub_24D24C310(v8);
}

uint64_t (*sub_24D24A858())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24A8BC@<X0>(void *a1@<X8>)
{
  char v3 = (const void *)(v1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D24A918(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (char *)&v4 - v4;
  sub_24D24BFB8(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24C0E0(v5, v6);
  swift_endAccess();
  return sub_24D24C310(v8);
}

uint64_t (*sub_24D24A9E0())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24AA44()
{
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionState);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D24AAB0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unint64_t v5 = (void *)(v2
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionState);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D24AB30())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24AB94@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionCreationDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D24ABF0(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (char *)&v4 - v4;
  sub_24D24BFB8(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionCreationDate);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24C0E0(v5, v6);
  swift_endAccess();
  return sub_24D24C310(v8);
}

uint64_t (*sub_24D24ACB8())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24AD1C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionStartDate);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D24AD78(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (char *)&v4 - v4;
  sub_24D24BFB8(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionStartDate);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24C0E0(v5, v6);
  swift_endAccess();
  return sub_24D24C310(v8);
}

uint64_t (*sub_24D24AE40())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24AEA4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteTombstone);
  swift_beginAccess();
  sub_24D24BFB8(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D24AF00(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v8);
  unint64_t v5 = (char *)&v4 - v4;
  sub_24D24BFB8(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1
              + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteTombstone);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_24D24C0E0(v5, v6);
  swift_endAccess();
  return sub_24D24C310(v8);
}

uint64_t (*sub_24D24AFC8())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24B02C()
{
  uint64_t v2 = (int *)(v0
             + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteVersion);
  swift_beginAccess();
  int v3 = *v2;
  char v4 = *((unsigned char *)v2 + 4);
  swift_endAccess();
  LODWORD(v5) = v3;
  BYTE4(v5) = v4 & 1;
  return v5;
}

uint64_t sub_24D24B0A8(uint64_t a1)
{
  int v3 = a1;
  char v4 = BYTE4(a1);
  uint64_t v5 = v1
     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteVersion;
  swift_beginAccess();
  *(_DWORD *)uint64_t v5 = v3;
  *(unsigned char *)(v5 + 4) = v4 & 1;
  return swift_endAccess();
}

uint64_t (*sub_24D24B124())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24B188()
{
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__generationMeters);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D24B1E8(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__generationMeters);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D24B258())()
{
  return sub_24D22F264;
}

uint64_t sub_24D24B2BC()
{
  type metadata accessor for EnergySitePayload._StorageClass();
  uint64_t result = sub_24D24B2F0();
  qword_26B18BD40 = result;
  return result;
}

uint64_t sub_24D24B2F0()
{
  return sub_24D24B32C();
}

uint64_t sub_24D24B32C()
{
  *((void *)v0 + 2) = sub_24D290B28();
  *((void *)v0 + 3) = v1;
  *((void *)v0 + 4) = 0xC066800000000000;
  *((void *)v0 + 5) = 0xC066800000000000;
  *((void *)v0 + 6) = sub_24D290B28();
  *((void *)v0 + 7) = v2;
  *((void *)v0 + 8) = sub_24D290B28();
  *((void *)v0 + 9) = v3;
  *((void *)v0 + 10) = sub_24D290B28();
  *((void *)v0 + 11) = v4;
  *((void *)v0 + 12) = sub_24D290B28();
  *((void *)v0 + 13) = v5;
  *((void *)v0 + 14) = sub_24D290B28();
  *((void *)v0 + 15) = v6;
  uint64_t v41 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan;
  uint64_t v7 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 56))(&v0[v41], 1);
  uint64_t v42 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex;
  uint64_t v8 = sub_24D290518();
  char v9 = (uint64_t *)&v0[v42];
  *char v9 = v8;
  v9[1] = v10;
  uint64_t v43 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex;
  uint64_t v11 = sub_24D290518();
  unint64_t v12 = (uint64_t *)&v0[v43];
  *unint64_t v12 = v11;
  v12[1] = v13;
  uint64_t v44 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex;
  uint64_t v14 = sub_24D290518();
  char v15 = (uint64_t *)&v0[v44];
  *char v15 = v14;
  v15[1] = v16;
  uint64_t v45 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__ckFunctionToken;
  uint64_t v17 = sub_24D290B28();
  uint64_t v18 = (uint64_t *)&v0[v45];
  uint64_t *v18 = v17;
  v18[1] = v19;
  uint64_t v46 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountName;
  uint64_t v20 = sub_24D290B28();
  uint64_t v21 = (uint64_t *)&v0[v46];
  *uint64_t v21 = v20;
  v21[1] = v22;
  uint64_t v47 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountNumber;
  uint64_t v23 = sub_24D290B28();
  char v24 = (uint64_t *)&v0[v47];
  *char v24 = v23;
  v24[1] = v25;
  uint64_t v48 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__address;
  uint64_t v26 = sub_24D290B28();
  uint64_t v27 = (uint64_t *)&v0[v48];
  *uint64_t v27 = v26;
  v27[1] = v28;
  uint64_t v49 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__serviceLocationID;
  uint64_t v29 = sub_24D290B28();
  unint64_t v30 = (uint64_t *)&v0[v49];
  uint64_t *v30 = v29;
  v30[1] = v31;
  uint64_t v50 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__alternateSupplier;
  uint64_t v32 = sub_24D290B28();
  unint64_t v33 = (uint64_t *)&v0[v50];
  *unint64_t v33 = v32;
  v33[1] = v34;
  uint64_t v51 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate;
  uint64_t v53 = sub_24D290888();
  uint64_t v54 = *(void (**)(char *, uint64_t))(*(void *)(v53 - 8) + 56);
  v54(&v0[v51], 1);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(&v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate], 1, 1, v53);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(&v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate], 1, 1, v53);
  v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__hasExportedEnergy_p] = 0;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(&v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate], 1, 1, v53);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(&v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate], 1, 1, v53);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(&v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate], 1, 1, v53);
  uint64_t v52 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionState;
  uint64_t v35 = sub_24D290B28();
  unint64_t v36 = (uint64_t *)&v0[v52];
  uint64_t *v36 = v35;
  v36[1] = v37;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(&v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionCreationDate], 1, 1, v53);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(&v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionStartDate], 1, 1, v53);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(&v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteTombstone], 1, 1, v53);
  uint64_t v38 = &v0[OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteVersion];
  *(_DWORD *)uint64_t v38 = 2;
  v38[4] = 0;
  uint64_t v55 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__generationMeters;
  uint64_t v39 = sub_24D290FA8();
  uint64_t result = v56;
  *(void *)(v56 + v55) = v39;
  return result;
}

uint64_t sub_24D24B7C0(void *a1)
{
  return sub_24D24C4F4(a1);
}

void *sub_24D24B80C(uint64_t *a1, void *a2)
{
  uint64_t v10 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v11 + 48))(a1, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
    memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    uint64_t v5 = *a1;
    swift_bridgeObjectRetain();
    *a2 = v5;
    uint64_t v7 = (char *)a2 + *(int *)(v10 + 20);
    uint64_t v6 = (char *)a1 + *(int *)(v10 + 20);
    uint64_t v2 = sub_24D2908B8();
    (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 16))(v7, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(a2, 0, 1, v10);
  }
  return a2;
}

uint64_t type metadata accessor for EnergySitePayload.CurrentRatePlan()
{
  uint64_t v1 = qword_26B18C160;
  if (!qword_26B18C160) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_24D24B9F0(uint64_t a1)
{
  uint64_t v5 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(a1, 1))
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = a1 + *(int *)(v5 + 20);
    uint64_t v1 = sub_24D2908B8();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v3);
  }
  return a1;
}

char *sub_24D24BAC0(char *a1, char *a2)
{
  *(void *)a2 = *(void *)a1;
  uint64_t v4 = *(int *)(type metadata accessor for EnergySitePayload.CurrentRatePlan() + 20);
  uint64_t v2 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 32))(&a2[v4], &a1[v4]);
  return a2;
}

char *sub_24D24BB5C(char *a1, char *a2)
{
  uint64_t v4 = *(void *)a1;
  swift_bridgeObjectRetain();
  *(void *)a2 = v4;
  uint64_t v5 = *(int *)(type metadata accessor for EnergySitePayload.CurrentRatePlan() + 20);
  uint64_t v2 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 16))(&a2[v5], &a1[v5]);
  return a2;
}

void *sub_24D24BC08(void *a1, void *a2)
{
  uint64_t v13 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  uint64_t v14 = *(void *)(v13 - 8);
  char v15 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48);
  if (((unsigned int (*)(void *, uint64_t))v15)(a2, 1))
  {
    if (v15(a1, 1, v13))
    {
      uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
      memcpy(a2, a1, *(void *)(*(void *)(v5 - 8) + 64));
    }
    else
    {
      *a2 = *a1;
      uint64_t v8 = (char *)a2 + *(int *)(v13 + 20);
      uint64_t v7 = (char *)a1 + *(int *)(v13 + 20);
      uint64_t v4 = sub_24D2908B8();
      (*(void (**)(char *, char *))(*(void *)(v4 - 8) + 32))(v8, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
    }
  }
  else if (v15(a1, 1, v13))
  {
    sub_24D24BE88((uint64_t)a2);
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
    memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    *a2 = *a1;
    swift_bridgeObjectRelease();
    uint64_t v10 = (char *)a2 + *(int *)(v13 + 20);
    char v9 = (char *)a1 + *(int *)(v13 + 20);
    uint64_t v2 = sub_24D2908B8();
    (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 40))(v10, v9);
  }
  return a2;
}

uint64_t sub_24D24BE88(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(int *)(type metadata accessor for EnergySitePayload.CurrentRatePlan() + 20);
  uint64_t v1 = sub_24D2908B8();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

uint64_t type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan()
{
  uint64_t v1 = qword_26B18C1A0;
  if (!qword_26B18C1A0) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_24D24BF84(uint64_t a1)
{
}

void *sub_24D24BFB8(const void *a1, void *a2)
{
  uint64_t v6 = sub_24D290888();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

void *sub_24D24C0E0(const void *a1, void *a2)
{
  uint64_t v7 = sub_24D290888();
  uint64_t v8 = *(void *)(v7 - 8);
  char v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a2, 1))
  {
    if (v9(a1, 1, v7))
    {
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
      memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a2, a1, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
    }
  }
  else if (v9(a1, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a2, v7);
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a2, a1, v7);
  }
  return a2;
}

uint64_t sub_24D24C310(uint64_t a1)
{
  uint64_t v3 = sub_24D290888();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

char *sub_24D24C3C0(char *a1, char *a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *((_OWORD *)a2 + 1) = *((_OWORD *)a1 + 1);
  *((_OWORD *)a2 + 2) = *((_OWORD *)a1 + 2);
  uint64_t v4 = *(int *)(type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan() + 28);
  uint64_t v2 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 32))(&a2[v4], &a1[v4]);
  return a2;
}

uint64_t sub_24D24C46C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_24D2908B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = type metadata accessor for EnergySitePayload();
  uint64_t result = a2;
  *(void *)(a2 + *(int *)(v3 + 20)) = *(void *)(a1 + *(int *)(v3 + 20));
  return result;
}

uint64_t sub_24D24C4F4(void *a1)
{
  v279 = a1;
  uint64_t v344 = 0;
  v343 = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v85 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  v259 = (char *)&v85 - v85;
  unint64_t v86 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v279);
  unint64_t v137 = (unint64_t *)((char *)&v85 - v86);
  uint64_t v344 = v3;
  v343 = v1;
  v1[2] = sub_24D290B28();
  v1[3] = v4;
  v1[4] = 0xC066800000000000;
  v1[5] = 0xC066800000000000;
  v1[6] = sub_24D290B28();
  v1[7] = v5;
  v1[8] = sub_24D290B28();
  v1[9] = v6;
  v1[10] = sub_24D290B28();
  v1[11] = v7;
  v1[12] = sub_24D290B28();
  v1[13] = v8;
  v1[14] = sub_24D290B28();
  v1[15] = v9;
  uint64_t v136 = &unk_26B18B000;
  uint64_t v87 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan;
  uint64_t v102 = 0;
  uint64_t v10 = *(void (**)(char *, uint64_t))(*(void *)(type metadata accessor for EnergySitePayload.CurrentRatePlan()
                                                           - 8)
                                               + 56);
  unsigned int v267 = 1;
  v10((char *)v1 + v87, 1);
  uint64_t v142 = &unk_26B18B000;
  uint64_t v88 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex;
  uint64_t v11 = sub_24D290518();
  unint64_t v12 = (void *)((char *)v1 + v88);
  *unint64_t v12 = v11;
  v12[1] = v13;
  uint64_t v149 = &unk_26B18B000;
  uint64_t v89 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex;
  uint64_t v14 = sub_24D290518();
  char v15 = (void *)((char *)v1 + v89);
  *char v15 = v14;
  v15[1] = v16;
  v156 = &unk_26B18B000;
  uint64_t v90 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex;
  uint64_t v17 = sub_24D290518();
  uint64_t v18 = (void *)((char *)v1 + v90);
  uint64_t *v18 = v17;
  v18[1] = v19;
  v163 = &unk_26B18B000;
  uint64_t v91 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__ckFunctionToken;
  uint64_t v20 = sub_24D290B28();
  uint64_t v21 = (void *)((char *)v1 + v91);
  *uint64_t v21 = v20;
  v21[1] = v22;
  v170 = &unk_26B18B000;
  uint64_t v92 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountName;
  uint64_t v23 = sub_24D290B28();
  char v24 = (void *)((char *)v1 + v92);
  *char v24 = v23;
  v24[1] = v25;
  v177 = &unk_26B18B000;
  uint64_t v93 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountNumber;
  uint64_t v26 = sub_24D290B28();
  uint64_t v27 = (void *)((char *)v1 + v93);
  *uint64_t v27 = v26;
  v27[1] = v28;
  v184 = &unk_26B18B000;
  uint64_t v94 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__address;
  uint64_t v29 = sub_24D290B28();
  unint64_t v30 = (void *)((char *)v1 + v94);
  uint64_t *v30 = v29;
  v30[1] = v31;
  v191 = &unk_26B18B000;
  uint64_t v95 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__serviceLocationID;
  uint64_t v32 = sub_24D290B28();
  unint64_t v33 = (void *)((char *)v1 + v95);
  *unint64_t v33 = v32;
  v33[1] = v34;
  v198 = &unk_26B18B000;
  uint64_t v96 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__alternateSupplier;
  uint64_t v35 = sub_24D290B28();
  unint64_t v36 = (void *)((char *)v1 + v96);
  uint64_t *v36 = v35;
  v36[1] = v37;
  v205 = &unk_26B18B000;
  uint64_t v97 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate;
  uint64_t v99 = sub_24D290888();
  uint64_t v38 = *(void *)(v99 - 8);
  unint64_t v101 = *(void (**)(char *, void))(v38 + 56);
  uint64_t v100 = v38 + 56;
  v101((char *)v1 + v97, v267);
  v210 = &unk_26B18B000;
  ((void (*)(char *, void, void, uint64_t))v101)((char *)v1+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate, v267, v267, v99);
  v215 = &unk_26B18B000;
  ((void (*)(char *, void, void, uint64_t))v101)((char *)v1+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate, v267, v267, v99);
  uint64_t v39 = v99;
  uint64_t v40 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v101;
  uint64_t v41 = v267;
  v220 = &unk_26B18B000;
  *((unsigned char *)v1
  + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__hasExportedEnergy_p) = 0;
  v226 = &unk_26B18B000;
  v40((char *)v1+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate, v41, v41, v39);
  v231 = &unk_26B18B000;
  ((void (*)(char *, void, void, uint64_t))v101)((char *)v1+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate, v267, v267, v99);
  v236 = &unk_26B18B000;
  ((void (*)(char *, void, void, uint64_t))v101)((char *)v1+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate, v267, v267, v99);
  v241 = &unk_26B18B000;
  uint64_t v98 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionState;
  uint64_t v42 = sub_24D290B28();
  uint64_t v43 = v99;
  uint64_t v44 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v101;
  uint64_t v45 = v267;
  uint64_t v46 = (void *)((char *)v1 + v98);
  *uint64_t v46 = v42;
  v46[1] = v47;
  v248 = &unk_26B18B000;
  v44((char *)v1+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionCreationDate, v45, v45, v43);
  v253 = &unk_26B18B000;
  ((void (*)(char *, void, void, uint64_t))v101)((char *)v1+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionStartDate, v267, v267, v99);
  v258 = &unk_26B18B000;
  ((void (*)(char *, void, void, uint64_t))v101)((char *)v1+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteTombstone, v267, v267, v99);
  v264 = &unk_26B18B000;
  uint64_t v48 = (char *)v1
      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteVersion;
  *(_DWORD *)uint64_t v48 = 2;
  v48[4] = 0;
  v273 = &unk_26B18B000;
  uint64_t v103 = OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__generationMeters;
  *(void *)((char *)v1 + v103) = sub_24D290FA8();
  uint64_t v104 = &v342;
  uint64_t v270 = 32;
  uint64_t v275 = 0;
  swift_beginAccess();
  uint64_t v105 = v279[2];
  uint64_t v106 = v279[3];
  swift_bridgeObjectRetain();
  swift_endAccess();
  uint64_t v107 = &v341;
  uint64_t v274 = 33;
  swift_beginAccess();
  uint64_t v49 = v106;
  v1[2] = v105;
  v1[3] = v49;
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v108 = &v340;
  swift_beginAccess();
  uint64_t v109 = v279[4];
  swift_endAccess();
  uint64_t v110 = &v339;
  swift_beginAccess();
  v1[4] = v109;
  swift_endAccess();
  uint64_t v111 = &v338;
  swift_beginAccess();
  uint64_t v112 = v279[5];
  swift_endAccess();
  uint64_t v113 = &v337;
  swift_beginAccess();
  v1[5] = v112;
  swift_endAccess();
  v114 = &v336;
  swift_beginAccess();
  uint64_t v115 = v279[6];
  uint64_t v116 = v279[7];
  swift_bridgeObjectRetain();
  swift_endAccess();
  uint64_t v117 = &v335;
  swift_beginAccess();
  uint64_t v50 = v116;
  v1[6] = v115;
  v1[7] = v50;
  swift_bridgeObjectRelease();
  swift_endAccess();
  int v118 = &v334;
  swift_beginAccess();
  uint64_t v119 = v279[8];
  uint64_t v120 = v279[9];
  swift_bridgeObjectRetain();
  swift_endAccess();
  uint64_t v121 = &v333;
  swift_beginAccess();
  uint64_t v51 = v120;
  v1[8] = v119;
  v1[9] = v51;
  swift_bridgeObjectRelease();
  swift_endAccess();
  unint64_t v122 = &v332;
  swift_beginAccess();
  uint64_t v123 = v279[10];
  uint64_t v124 = v279[11];
  swift_bridgeObjectRetain();
  swift_endAccess();
  v125 = &v331;
  swift_beginAccess();
  uint64_t v52 = v124;
  v1[10] = v123;
  v1[11] = v52;
  swift_bridgeObjectRelease();
  swift_endAccess();
  unint64_t v126 = &v330;
  swift_beginAccess();
  uint64_t v127 = v279[12];
  uint64_t v128 = v279[13];
  swift_bridgeObjectRetain();
  swift_endAccess();
  uint64_t v129 = &v329;
  swift_beginAccess();
  uint64_t v53 = v128;
  v1[12] = v127;
  v1[13] = v53;
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v130 = &v328;
  swift_beginAccess();
  uint64_t v131 = v279[14];
  uint64_t v132 = v279[15];
  swift_bridgeObjectRetain();
  swift_endAccess();
  v133 = &v327;
  swift_beginAccess();
  uint64_t v54 = v132;
  v1[14] = v131;
  v1[15] = v54;
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v134 = (void *)((char *)v279 + v136[429]);
  uint64_t v135 = &v326;
  swift_beginAccess();
  sub_24D24B80C(v134, v137);
  swift_endAccess();
  uint64_t v138 = (void *)((char *)v1 + v136[429]);
  v139 = &v325;
  swift_beginAccess();
  sub_24D24BC08(v137, v138);
  swift_endAccess();
  uint64_t v140 = (void *)((char *)v279 + v142[438]);
  int v141 = &v324;
  swift_beginAccess();
  uint64_t v143 = *v140;
  unint64_t v145 = v140[1];
  sub_24D229320(v143, v145);
  swift_endAccess();
  char v144 = (void *)((char *)v1 + v142[438]);
  char v146 = &v323;
  swift_beginAccess();
  uint64_t v55 = v144;
  unint64_t v56 = v145;
  uint64_t v57 = *v144;
  unint64_t v58 = v144[1];
  *char v144 = v143;
  v55[1] = v56;
  sub_24D2293AC(v57, v58);
  swift_endAccess();
  uint64_t v147 = (void *)((char *)v279 + v149[439]);
  v148 = &v322;
  swift_beginAccess();
  uint64_t v150 = *v147;
  unint64_t v152 = v147[1];
  sub_24D229320(v150, v152);
  swift_endAccess();
  uint64_t v151 = (void *)((char *)v1 + v149[439]);
  v153 = &v321;
  swift_beginAccess();
  uint64_t v59 = v151;
  unint64_t v60 = v152;
  uint64_t v61 = *v151;
  unint64_t v62 = v151[1];
  *uint64_t v151 = v150;
  v59[1] = v60;
  sub_24D2293AC(v61, v62);
  swift_endAccess();
  v154 = (void *)((char *)v279 + v156[440]);
  v155 = &v320;
  swift_beginAccess();
  uint64_t v157 = *v154;
  unint64_t v159 = v154[1];
  sub_24D229320(v157, v159);
  swift_endAccess();
  v158 = (void *)((char *)v1 + v156[440]);
  v160 = &v319;
  swift_beginAccess();
  uint64_t v63 = v158;
  unint64_t v64 = v159;
  uint64_t v65 = *v158;
  unint64_t v66 = v158[1];
  uint64_t *v158 = v157;
  v63[1] = v64;
  sub_24D2293AC(v65, v66);
  swift_endAccess();
  v161 = (void *)((char *)v279 + v163[427]);
  v162 = &v318;
  swift_beginAccess();
  uint64_t v164 = *v161;
  uint64_t v166 = v161[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  v165 = (void *)((char *)v1 + v163[427]);
  v167 = &v317;
  swift_beginAccess();
  uint64_t v67 = v165;
  uint64_t v68 = v166;
  void *v165 = v164;
  v67[1] = v68;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v168 = (void *)((char *)v279 + v170[418]);
  v169 = &v316;
  swift_beginAccess();
  uint64_t v171 = *v168;
  uint64_t v173 = v168[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  v172 = (void *)((char *)v1 + v170[418]);
  v174 = &v315;
  swift_beginAccess();
  uint64_t v69 = v172;
  uint64_t v70 = v173;
  void *v172 = v171;
  v69[1] = v70;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v175 = (void *)((char *)v279 + v177[421]);
  v176 = &v314;
  swift_beginAccess();
  uint64_t v178 = *v175;
  uint64_t v180 = v175[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  v179 = (void *)((char *)v1 + v177[421]);
  v181 = &v313;
  swift_beginAccess();
  uint64_t v71 = v179;
  uint64_t v72 = v180;
  void *v179 = v178;
  v71[1] = v72;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v182 = (void *)((char *)v279 + v184[450]);
  v183 = &v312;
  swift_beginAccess();
  uint64_t v185 = *v182;
  uint64_t v187 = v182[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  v186 = (void *)((char *)v1 + v184[450]);
  v188 = &v311;
  swift_beginAccess();
  uint64_t v73 = v186;
  uint64_t v74 = v187;
  void *v186 = v185;
  v73[1] = v74;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v189 = (void *)((char *)v279 + v191[433]);
  v190 = &v310;
  swift_beginAccess();
  uint64_t v192 = *v189;
  uint64_t v194 = v189[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  v193 = (void *)((char *)v1 + v191[433]);
  v195 = &v309;
  swift_beginAccess();
  uint64_t v75 = v193;
  uint64_t v76 = v194;
  void *v193 = v192;
  v75[1] = v76;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v196 = (void *)((char *)v279 + v198[432]);
  v197 = &v308;
  swift_beginAccess();
  uint64_t v199 = *v196;
  uint64_t v201 = v196[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  v200 = (void *)((char *)v1 + v198[432]);
  v202 = &v307;
  swift_beginAccess();
  int v77 = v200;
  uint64_t v78 = v201;
  void *v200 = v199;
  v77[1] = v78;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v203 = (char *)v279 + v205[443];
  v204 = &v306;
  swift_beginAccess();
  sub_24D24BFB8(v203, v259);
  swift_endAccess();
  v206 = (char *)v1 + v205[443];
  v207 = &v305;
  swift_beginAccess();
  sub_24D24C0E0(v259, v206);
  swift_endAccess();
  v208 = (char *)v279 + v210[446];
  v209 = &v304;
  swift_beginAccess();
  sub_24D24BFB8(v208, v259);
  swift_endAccess();
  v211 = (char *)v1 + v210[446];
  v212 = &v303;
  swift_beginAccess();
  sub_24D24C0E0(v259, v211);
  swift_endAccess();
  v213 = (char *)v279 + v215[435];
  v214 = &v302;
  swift_beginAccess();
  sub_24D24BFB8(v213, v259);
  swift_endAccess();
  v216 = (char *)v1 + v215[435];
  v217 = &v301;
  swift_beginAccess();
  sub_24D24C0E0(v259, v216);
  swift_endAccess();
  v218 = (unsigned __int8 *)v279 + v220[416];
  v219 = &v300;
  swift_beginAccess();
  int v221 = *v218;
  swift_endAccess();
  v222 = (char *)v1 + v220[416];
  v223 = &v299;
  swift_beginAccess();
  unsigned char *v222 = v221 & v267;
  swift_endAccess();
  v224 = (char *)v279 + v226[445];
  v225 = &v298;
  swift_beginAccess();
  sub_24D24BFB8(v224, v259);
  swift_endAccess();
  v227 = (char *)v1 + v226[445];
  v228 = &v297;
  swift_beginAccess();
  sub_24D24C0E0(v259, v227);
  swift_endAccess();
  v229 = (char *)v279 + v231[448];
  v230 = &v296;
  swift_beginAccess();
  sub_24D24BFB8(v229, v259);
  swift_endAccess();
  v232 = (char *)v1 + v231[448];
  v233 = &v295;
  swift_beginAccess();
  sub_24D24C0E0(v259, v232);
  swift_endAccess();
  v234 = (char *)v279 + v236[449];
  v235 = &v294;
  swift_beginAccess();
  sub_24D24BFB8(v234, v259);
  swift_endAccess();
  v237 = (char *)v1 + v236[449];
  v238 = &v293;
  swift_beginAccess();
  sub_24D24C0E0(v259, v237);
  swift_endAccess();
  v239 = (void *)((char *)v279 + v241[434]);
  v240 = &v292;
  swift_beginAccess();
  uint64_t v242 = *v239;
  uint64_t v244 = v239[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  v243 = (void *)((char *)v1 + v241[434]);
  v245 = &v291;
  swift_beginAccess();
  uint64_t v79 = v243;
  uint64_t v80 = v244;
  void *v243 = v242;
  v79[1] = v80;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v246 = (char *)v279 + v248[441];
  v247 = &v290;
  swift_beginAccess();
  sub_24D24BFB8(v246, v259);
  swift_endAccess();
  v249 = (char *)v1 + v248[441];
  v250 = &v289;
  swift_beginAccess();
  sub_24D24C0E0(v259, v249);
  swift_endAccess();
  v251 = (char *)v279 + v253[436];
  v252 = &v288;
  swift_beginAccess();
  sub_24D24BFB8(v251, v259);
  swift_endAccess();
  v254 = (char *)v1 + v253[436];
  v255 = &v287;
  swift_beginAccess();
  sub_24D24C0E0(v259, v254);
  swift_endAccess();
  v256 = (char *)v279 + v258[423];
  v257 = &v286;
  swift_beginAccess();
  sub_24D24BFB8(v256, v259);
  swift_endAccess();
  v260 = (char *)v1 + v258[423];
  v261 = &v285;
  swift_beginAccess();
  sub_24D24C0E0(v259, v260);
  swift_endAccess();
  v262 = (char *)v279 + v264[420];
  v263 = &v284;
  swift_beginAccess();
  int v265 = *(_DWORD *)v262;
  int v266 = v262[4];
  swift_endAccess();
  v268 = (_DWORD *)((char *)v1 + v264[420]);
  v269 = &v283;
  swift_beginAccess();
  char v81 = v266;
  char v82 = v267;
  uint64_t v83 = v268;
  _DWORD *v268 = v265;
  *((unsigned char *)v83 + 4) = v81 & 1 & v82;
  swift_endAccess();
  v271 = (void *)((char *)v279 + v273[431]);
  v272 = &v282;
  swift_beginAccess();
  uint64_t v277 = *v271;
  swift_bridgeObjectRetain();
  swift_endAccess();
  v276 = (void *)((char *)v1 + v273[431]);
  v278 = &v281;
  swift_beginAccess();
  void *v276 = v277;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  return v280;
}

uint64_t sub_24D24DA54()
{
  sub_24D22F624();
  sub_24D22F624();
  sub_24D22F624();
  sub_24D22F624();
  sub_24D22F624();
  sub_24D22F624();
  sub_24D24B9F0(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan);
  sub_24D24BF84(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex);
  sub_24D24BF84(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex);
  sub_24D24BF84(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex);
  sub_24D22F624();
  sub_24D22F624();
  sub_24D22F624();
  sub_24D22F624();
  sub_24D22F624();
  sub_24D22F624();
  sub_24D24C310(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate);
  sub_24D24C310(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate);
  sub_24D24C310(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate);
  sub_24D24C310(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate);
  sub_24D24C310(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate);
  sub_24D24C310(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate);
  sub_24D22F624();
  sub_24D24C310(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionCreationDate);
  sub_24D24C310(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionStartDate);
  sub_24D24C310(v0+ OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteTombstone);
  sub_24D230030();
  return v2;
}

uint64_t sub_24D24DC18()
{
  return swift_deallocClassInstance();
}

uint64_t EnergySitePayload.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a2;
  uint64_t v22 = a1;
  uint64_t v21 = v3;
  sub_24D23E904();
  swift_release();
  uint64_t v7 = *(void *)(v6 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v20 = v7;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a1;
  uint64_t v13 = sub_24D24EB04;
  uint64_t v14 = &v15;
  uint64_t v11 = type metadata accessor for EnergySitePayload._StorageClass();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8F0);
  sub_24D25054C((uint64_t)&v20, (uint64_t (*)(uint64_t))sub_24D25051C, (uint64_t)v12, v11, v4, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E4E0], (uint64_t)&v19);
  return swift_release();
}

uint64_t sub_24D24DDFC()
{
  while (1)
  {
    uint64_t result = sub_24D290908();
    if (v2 || (v1 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 1:
        sub_24D24EB40();
        break;
      case 2:
        sub_24D24EC04();
        break;
      case 3:
        sub_24D24ECC8();
        break;
      case 4:
        sub_24D24ED8C();
        break;
      case 5:
        sub_24D24EE50();
        break;
      case 6:
        sub_24D24EF14();
        break;
      case 7:
        sub_24D24EFD8();
        break;
      case 8:
        sub_24D24F09C();
        break;
      case 9:
        sub_24D24F160();
        break;
      case 10:
        sub_24D24F244();
        break;
      case 11:
        sub_24D24F310();
        break;
      case 12:
        sub_24D24F3DC();
        break;
      case 13:
        sub_24D24F4A8();
        break;
      case 14:
        sub_24D24F574();
        break;
      case 15:
        sub_24D24F640();
        break;
      case 16:
        sub_24D24F70C();
        break;
      case 17:
        sub_24D24F7D8();
        break;
      case 18:
        sub_24D24F8A4();
        break;
      case 19:
        sub_24D24F970();
        break;
      case 20:
        sub_24D24FA54();
        break;
      case 21:
        sub_24D24FB38();
        break;
      case 22:
        sub_24D24FC1C();
        break;
      case 23:
        sub_24D24FCE8();
        break;
      case 24:
        sub_24D24FDCC();
        break;
      case 25:
        sub_24D24FEB0();
        break;
      case 26:
        sub_24D24FF94();
        break;
      case 27:
        sub_24D250060();
        break;
      case 28:
        sub_24D250144();
        break;
      case 29:
        sub_24D250228();
        break;
      case 30:
        sub_24D25030C();
        break;
      case 31:
        sub_24D2503D8();
        break;
    }
    uint64_t v2 = 0;
  }
  return result;
}

uint64_t sub_24D24EB04()
{
  return sub_24D24DDFC();
}

uint64_t sub_24D24EB40()
{
  return swift_endAccess();
}

uint64_t sub_24D24EC04()
{
  return swift_endAccess();
}

uint64_t sub_24D24ECC8()
{
  return swift_endAccess();
}

uint64_t sub_24D24ED8C()
{
  return swift_endAccess();
}

uint64_t sub_24D24EE50()
{
  return swift_endAccess();
}

uint64_t sub_24D24EF14()
{
  return swift_endAccess();
}

uint64_t sub_24D24EFD8()
{
  return swift_endAccess();
}

uint64_t sub_24D24F09C()
{
  return swift_endAccess();
}

uint64_t sub_24D24F160()
{
  return swift_endAccess();
}

uint64_t sub_24D24F244()
{
  return swift_endAccess();
}

uint64_t sub_24D24F310()
{
  return swift_endAccess();
}

uint64_t sub_24D24F3DC()
{
  return swift_endAccess();
}

uint64_t sub_24D24F4A8()
{
  return swift_endAccess();
}

uint64_t sub_24D24F574()
{
  return swift_endAccess();
}

uint64_t sub_24D24F640()
{
  return swift_endAccess();
}

uint64_t sub_24D24F70C()
{
  return swift_endAccess();
}

uint64_t sub_24D24F7D8()
{
  return swift_endAccess();
}

uint64_t sub_24D24F8A4()
{
  return swift_endAccess();
}

uint64_t sub_24D24F970()
{
  return swift_endAccess();
}

uint64_t sub_24D24FA54()
{
  return swift_endAccess();
}

uint64_t sub_24D24FB38()
{
  return swift_endAccess();
}

uint64_t sub_24D24FC1C()
{
  return swift_endAccess();
}

uint64_t sub_24D24FCE8()
{
  return swift_endAccess();
}

uint64_t sub_24D24FDCC()
{
  return swift_endAccess();
}

uint64_t sub_24D24FEB0()
{
  return swift_endAccess();
}

uint64_t sub_24D24FF94()
{
  return swift_endAccess();
}

uint64_t sub_24D250060()
{
  return swift_endAccess();
}

uint64_t sub_24D250144()
{
  return swift_endAccess();
}

uint64_t sub_24D250228()
{
  return swift_endAccess();
}

uint64_t sub_24D25030C()
{
  return swift_endAccess();
}

uint64_t sub_24D2503D8()
{
  return swift_endAccess();
}

uint64_t sub_24D2504A4(void *a1, uint64_t (*a2)(void), uint64_t a3, void *a4)
{
  uint64_t result = a2(*a1);
  if (v4) {
    *a4 = v4;
  }
  return result;
}

uint64_t sub_24D25051C(void *a1, void *a2)
{
  return sub_24D2504A4(a1, *(uint64_t (**)(void))(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_24D25054C(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v12 = a5;
  uint64_t v13 = a8;
  uint64_t v22 = a4;
  uint64_t v21 = a5;
  uint64_t v20 = a6;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = a5 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v11 - v16;
  uint64_t result = v17(v9);
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v18, v12);
  }
  return result;
}

uint64_t EnergySitePayload.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a1;
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v17 = 0;
  uint64_t v22 = sub_24D2524A8;
  uint64_t v23 = (uint64_t (*)(uint64_t))sub_24D25051C;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  uint64_t v40 = a2;
  uint64_t v11 = sub_24D2908B8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v11 - 8;
  unint64_t v14 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v15 = (char *)v9 - v14;
  uint64_t v39 = v21;
  uint64_t v38 = v3;
  uint64_t v18 = *(void *)(v16 + *(int *)(type metadata accessor for EnergySitePayload() + 20));
  swift_retain();
  uint64_t v27 = &v37;
  uint64_t v37 = v18;
  uint64_t v33 = v19;
  uint64_t v34 = v20;
  uint64_t v35 = v21;
  char v24 = &v29;
  unint64_t v30 = v22;
  uint64_t v31 = &v32;
  uint64_t v25 = type metadata accessor for EnergySitePayload._StorageClass();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8F0);
  uint64_t v5 = v26;
  sub_24D25054C((uint64_t)v27, v23, (uint64_t)v24, v25, v4, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E4E0], (uint64_t)&v36);
  uint64_t v28 = v5;
  if (v5)
  {
    uint64_t v9[2] = v36;
    return swift_release();
  }
  else
  {
    uint64_t v6 = v15;
    swift_release();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v6, v16, v11);
    uint64_t v7 = v28;
    sub_24D290898();
    void v9[4] = v7;
    uint64_t v10 = v7;
    if (v7) {
      v9[1] = v10;
    }
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
}

uint64_t sub_24D250958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v59[31] = a3;
  v59[30] = a1;
  v59[29] = a2;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v56 = sub_24D290C28();
  swift_bridgeObjectRelease();
  if (v56)
  {
    uint64_t v50 = v54;
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    sub_24D290A38();
    if (v54) {
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v50 = 0;
  }
  swift_beginAccess();
  double v49 = *(double *)(a1 + 32);
  swift_endAccess();
  if (v49 == 0.0)
  {
    uint64_t v48 = v50;
  }
  else
  {
    swift_beginAccess();
    swift_endAccess();
    uint64_t result = sub_24D290A28();
    if (v50) {
      return result;
    }
    uint64_t v48 = 0;
  }
  swift_beginAccess();
  double v47 = *(double *)(a1 + 40);
  swift_endAccess();
  if (v47 == 0.0)
  {
    uint64_t v46 = v48;
  }
  else
  {
    swift_beginAccess();
    swift_endAccess();
    uint64_t result = sub_24D290A28();
    if (v48) {
      return result;
    }
    uint64_t v46 = 0;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v45 = sub_24D290C28();
  swift_bridgeObjectRelease();
  if (v45)
  {
    uint64_t v44 = v46;
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    sub_24D290A38();
    if (v46) {
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v44 = 0;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v43 = sub_24D290C28();
  swift_bridgeObjectRelease();
  if (v43)
  {
    uint64_t v42 = v44;
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    sub_24D290A38();
    if (v44) {
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v42 = 0;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v41 = sub_24D290C28();
  swift_bridgeObjectRelease();
  if (v41)
  {
    uint64_t v40 = v42;
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    sub_24D290A38();
    if (v42) {
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v40 = 0;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v39 = sub_24D290C28();
  swift_bridgeObjectRelease();
  if (v39)
  {
    uint64_t v38 = v40;
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    sub_24D290A38();
    if (v40) {
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v38 = 0;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v37 = sub_24D290C28();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    sub_24D290A38();
    if (!v38)
    {
      swift_bridgeObjectRelease();
      uint64_t v36 = 0;
      goto LABEL_33;
    }
    return swift_bridgeObjectRelease();
  }
  uint64_t v36 = v38;
LABEL_33:
  uint64_t result = sub_24D2524E4(a1, a2, a3, a4);
  if (!v36)
  {
    char v32 = (uint64_t *)(a1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex);
    swift_beginAccess();
    uint64_t v34 = *v32;
    unint64_t v33 = v32[1];
    sub_24D229320(*v32, v33);
    swift_endAccess();
    sub_24D229320(v34, v33);
    v59[0] = v34;
    v59[1] = v33;
    sub_24D25A8E4();
    char v35 = sub_24D290D58();
    sub_24D24BF84((uint64_t)v59);
    sub_24D2293AC(v34, v33);
    if ((v35 & 1) == 0)
    {
      char v29 = (uint64_t *)(a1
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex);
      swift_beginAccess();
      uint64_t v30 = *v29;
      unint64_t v31 = v29[1];
      sub_24D229320(*v29, v31);
      swift_endAccess();
      sub_24D290A08();
      sub_24D2293AC(v30, v31);
    }
    uint64_t v25 = (uint64_t *)(a1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex);
    swift_beginAccess();
    uint64_t v27 = *v25;
    unint64_t v26 = v25[1];
    sub_24D229320(*v25, v26);
    swift_endAccess();
    sub_24D229320(v27, v26);
    v58[0] = v27;
    v58[1] = v26;
    char v28 = sub_24D290D58();
    sub_24D24BF84((uint64_t)v58);
    sub_24D2293AC(v27, v26);
    if ((v28 & 1) == 0)
    {
      uint64_t v22 = (uint64_t *)(a1
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex);
      swift_beginAccess();
      uint64_t v23 = *v22;
      unint64_t v24 = v22[1];
      sub_24D229320(*v22, v24);
      swift_endAccess();
      sub_24D290A08();
      sub_24D2293AC(v23, v24);
    }
    uint64_t v18 = (uint64_t *)(a1
                    + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex);
    swift_beginAccess();
    uint64_t v20 = *v18;
    unint64_t v19 = v18[1];
    sub_24D229320(*v18, v19);
    swift_endAccess();
    sub_24D229320(v20, v19);
    v57[0] = v20;
    v57[1] = v19;
    char v21 = sub_24D290D58();
    sub_24D24BF84((uint64_t)v57);
    sub_24D2293AC(v20, v19);
    if ((v21 & 1) == 0)
    {
      uint64_t v15 = (uint64_t *)(a1
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex);
      swift_beginAccess();
      uint64_t v16 = *v15;
      unint64_t v17 = v15[1];
      sub_24D229320(*v15, v17);
      swift_endAccess();
      sub_24D290A08();
      sub_24D2293AC(v16, v17);
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    char v14 = sub_24D290C28();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_endAccess();
      sub_24D290A38();
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    char v13 = sub_24D290C28();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_endAccess();
      sub_24D290A38();
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    char v12 = sub_24D290C28();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_endAccess();
      sub_24D290A38();
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    char v11 = sub_24D290C28();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_endAccess();
      sub_24D290A38();
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    char v10 = sub_24D290C28();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_endAccess();
      sub_24D290A38();
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    char v9 = sub_24D290C28();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_endAccess();
      sub_24D290A38();
      swift_bridgeObjectRelease();
    }
    sub_24D25271C(a1, a2, a3, a4);
    sub_24D2529CC(a1, a2, a3, a4);
    sub_24D252C7C(a1, a2, a3, a4);
    uint64_t v7 = (unsigned __int8 *)(a1
                           + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__hasExportedEnergy_p);
    swift_beginAccess();
    uint64_t v8 = *v7;
    swift_endAccess();
    if (v8)
    {
      swift_beginAccess();
      swift_endAccess();
      sub_24D2909F8();
    }
    sub_24D252F2C(a1, a2, a3, a4);
    sub_24D2531DC(a1, a2, a3, a4);
    sub_24D25348C(a1, a2, a3, a4);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    uint64_t v6 = sub_24D290C28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_endAccess();
      sub_24D290A38();
      swift_bridgeObjectRelease();
    }
    sub_24D25373C(a1, a2, a3, a4);
    sub_24D2539EC(a1, a2, a3, a4);
    sub_24D253C9C(a1, a2, a3, a4);
    sub_24D253F4C(a1);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_endAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8D8);
    sub_24D25D044();
    char v5 = sub_24D290D58();
    sub_24D230030();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_endAccess();
      sub_24D290A18();
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  return result;
}

uint64_t sub_24D2524A8(uint64_t a1)
{
  return sub_24D250958(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_24D2524E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (uint64_t *)(v5
                  + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24B80C(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24B9F0((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    sub_24D24BAC0(v25, v20);
    sub_24D25A860();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return sub_24D24BE88((uint64_t)v20);
    }
    else
    {
      sub_24D24BE88((uint64_t)v20);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D25271C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = sub_24D290888();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (const void *)(v5
                     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24BFB8(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24C310((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v25, v26);
    sub_24D25D0C8();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D2529CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = sub_24D290888();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (const void *)(v5
                     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24BFB8(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24C310((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v25, v26);
    sub_24D25D0C8();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D252C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = sub_24D290888();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (const void *)(v5
                     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24BFB8(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24C310((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v25, v26);
    sub_24D25D0C8();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D252F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = sub_24D290888();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (const void *)(v5
                     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24BFB8(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24C310((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v25, v26);
    sub_24D25D0C8();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D2531DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = sub_24D290888();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (const void *)(v5
                     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24BFB8(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24C310((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v25, v26);
    sub_24D25D0C8();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D25348C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = sub_24D290888();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (const void *)(v5
                     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24BFB8(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24C310((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v25, v26);
    sub_24D25D0C8();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D25373C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = sub_24D290888();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (const void *)(v5
                     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionCreationDate);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24BFB8(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24C310((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v25, v26);
    sub_24D25D0C8();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D2539EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = sub_24D290888();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (const void *)(v5
                     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionStartDate);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24BFB8(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24C310((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v25, v26);
    sub_24D25D0C8();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D253C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v9 - v16;
  uint64_t v26 = sub_24D290888();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v19 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v9 - v19;
  uint64_t v30 = (char *)v9 - v19;
  uint64_t v29 = v5;
  uint64_t v28 = v6;
  char v21 = (const void *)(v5
                     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteTombstone);
  uint64_t v22 = &v27;
  swift_beginAccess();
  sub_24D24BFB8(v21, v25);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v25, 1, v26) == 1)
  {
    uint64_t result = sub_24D24C310((uint64_t)v25);
    uint64_t v12 = v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v25, v26);
    sub_24D25D0C8();
    uint64_t v8 = v15;
    sub_24D290A68();
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v8)
    {
      v9[1] = v11;
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
      uint64_t result = v10;
      uint64_t v12 = v10;
    }
  }
  return result;
}

uint64_t sub_24D253F4C(uint64_t a1)
{
  uint64_t v3 = a1
     + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteVersion;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 4);
  uint64_t result = swift_endAccess();
  if ((v4 & 1) == 0)
  {
    uint64_t result = sub_24D290A48();
    if (!v2) {
      return 0;
    }
  }
  return result;
}

uint64_t static EnergySitePayload.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = a1;
  uint64_t v35 = a2;
  uint64_t v24 = 0;
  char v21 = sub_24D2544D8;
  uint64_t v22 = (uint64_t (*)(uint64_t))sub_24D257F94;
  uint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v23 = 0;
  char v39 = 0;
  uint64_t v25 = sub_24D2908B8();
  uint64_t v26 = *(void **)(v25 - 8);
  uint64_t v27 = v25 - 8;
  uint64_t v29 = v26[8];
  unint64_t v28 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](0);
  uint64_t v30 = (char *)v9 - v28;
  unint64_t v31 = v28;
  MEMORY[0x270FA5388](v2);
  char v32 = (char *)v9 - v31;
  uint64_t v43 = v3;
  uint64_t v42 = v4;
  uint64_t v34 = type metadata accessor for EnergySitePayload();
  uint64_t v37 = *(void *)(v33 + *(int *)(v34 + 20));
  swift_retain();
  uint64_t v36 = *(void *)(v35 + *(int *)(v34 + 20));
  swift_retain();
  int v38 = sub_24D290FD8();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if ((v38 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v5 = v23;
  uint64_t v15 = *(void *)(v33 + *(int *)(v34 + 20));
  swift_retain();
  uint64_t v16 = *(void *)(v35 + *(int *)(v34 + 20));
  swift_retain();
  uint64_t v20 = v40;
  v40[0] = v15;
  v40[1] = v16;
  uint64_t v17 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v6 = &v9[-4];
  uint64_t v18 = &v9[-4];
  void v6[2] = v21;
  v6[3] = 0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D1E0);
  uint64_t result = sub_24D25054C((uint64_t)v20, v22, (uint64_t)v18, v7, MEMORY[0x263F8E628], MEMORY[0x263F8D4F8], MEMORY[0x263F8E658], v19);
  if (!v5)
  {
    sub_24D257FC4();
    char v39 = v41 & 1;
    if ((v41 & 1) == 0) {
      return 0;
    }
LABEL_5:
    uint64_t v10 = (void (*)(char *, uint64_t, uint64_t))v26[2];
    v9[1] = v26 + 2;
    v10(v32, v33, v25);
    v10(v30, v35, v25);
    sub_24D254454();
    int v13 = sub_24D290B58();
    uint64_t v12 = (void (*)(char *, uint64_t))v26[1];
    uint64_t v11 = v26 + 1;
    v12(v30, v25);
    v12(v32, v25);
    return (v13 & 1) != 0;
  }
  __break(1u);
  return result;
}

unint64_t sub_24D254454()
{
  uint64_t v2 = qword_26985D1D8;
  if (!qword_26985D1D8)
  {
    sub_24D2908B8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D1D8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D2544D8(uint64_t a1)
{
  uint64_t v518 = MEMORY[0x270FA5388](a1);
  uint64_t v522 = v1;
  uint64_t v598 = 0;
  uint64_t v599 = 0;
  uint64_t v597 = 0;
  uint64_t v596 = 0;
  uint64_t v448 = 0;
  uint64_t v423 = sub_24D290888();
  uint64_t v424 = *(void *)(v423 - 8);
  uint64_t v425 = v423 - 8;
  unint64_t v426 = (*(void *)(v424 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v423);
  v427 = (char *)v83 - v426;
  uint64_t v428 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D248);
  uint64_t v429 = *(void *)(*(void *)(v428 - 8) + 64);
  unint64_t v430 = (v429 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v428);
  v431 = (char *)v83 - v430;
  unint64_t v432 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  v433 = (char *)v83 - v432;
  unint64_t v434 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v435 = (char *)v83 - v434;
  unint64_t v436 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v437 = (char *)v83 - v436;
  unint64_t v438 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v439 = (char *)v83 - v438;
  unint64_t v440 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v441 = (char *)v83 - v440;
  unint64_t v442 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v443 = (char *)v83 - v442;
  unint64_t v444 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v445 = (char *)v83 - v444;
  unint64_t v446 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v16);
  v447 = (char *)v83 - v446;
  uint64_t v449 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8) - 8) + 64);
  unint64_t v450 = (v449 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v18 = MEMORY[0x270FA5388](v448);
  v451 = (char *)v83 - v450;
  unint64_t v452 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v453 = (char *)v83 - v452;
  unint64_t v454 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v455 = (char *)v83 - v454;
  unint64_t v456 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v457 = (char *)v83 - v456;
  unint64_t v458 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v459 = (char *)v83 - v458;
  unint64_t v460 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v461 = (char *)v83 - v460;
  unint64_t v462 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v463 = (char *)v83 - v462;
  unint64_t v464 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v465 = (char *)v83 - v464;
  unint64_t v466 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v467 = (char *)v83 - v466;
  unint64_t v468 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v469 = (char *)v83 - v468;
  unint64_t v470 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v471 = (char *)v83 - v470;
  unint64_t v472 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v473 = (char *)v83 - v472;
  unint64_t v474 = (v41 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  v475 = (char *)v83 - v474;
  unint64_t v476 = (v43 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  v477 = (char *)v83 - v476;
  unint64_t v478 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v479 = (char *)v83 - v478;
  unint64_t v480 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  v481 = (char *)v83 - v480;
  unint64_t v482 = (v49 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  v483 = (char *)v83 - v482;
  unint64_t v484 = (v51 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v485 = (char *)v83 - v484;
  unint64_t v486 = (v53 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  v487 = (char *)v83 - v486;
  unint64_t v488 = (v55 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  v489 = (char *)v83 - v488;
  unint64_t v490 = (v57 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  v491 = (char *)v83 - v490;
  unint64_t v492 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v60 = MEMORY[0x270FA5388](v58);
  v493 = (char *)v83 - v492;
  unint64_t v494 = (v61 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  v495 = (char *)v83 - v494;
  unint64_t v496 = (v63 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v497 = (char *)v83 - v496;
  unint64_t v498 = (v65 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v66 = MEMORY[0x270FA5388](v64);
  v499 = (char *)v83 - v498;
  unint64_t v500 = (v67 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v68 = MEMORY[0x270FA5388](v66);
  v501 = (char *)v83 - v500;
  unint64_t v502 = (v69 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v68);
  v503 = (char *)v83 - v502;
  uint64_t v504 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  uint64_t v505 = *(void *)(v504 - 8);
  uint64_t v506 = v504 - 8;
  unint64_t v507 = (*(void *)(v505 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v504);
  v508 = (char *)v83 - v507;
  uint64_t v509 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D250);
  unint64_t v510 = (*(void *)(*(void *)(v509 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v509);
  v511 = (void *)((char *)v83 - v510);
  unint64_t v512 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8) - 8) + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v70 = MEMORY[0x270FA5388](v518);
  v513 = (void *)((char *)v83 - v512);
  unint64_t v514 = (v71 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v72 = MEMORY[0x270FA5388](v70);
  v515 = (void *)((char *)v83 - v514);
  unint64_t v516 = (v73 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v74 = MEMORY[0x270FA5388](v72);
  v517 = (void *)((char *)v83 - v516);
  uint64_t v598 = v74;
  uint64_t v599 = v75;
  swift_retain();
  swift_retain();
  uint64_t v597 = v518;
  swift_release();
  swift_retain();
  swift_retain();
  uint64_t v596 = v522;
  swift_release();
  v519 = &v595;
  uint64_t v520 = 32;
  uint64_t v521 = 0;
  swift_beginAccess();
  uint64_t v524 = *(void *)(v518 + 16);
  uint64_t v527 = *(void *)(v518 + 24);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v523 = &v594;
  swift_beginAccess();
  uint64_t v525 = *(void *)(v522 + 16);
  uint64_t v526 = *(void *)(v522 + 24);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v528 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v528 & 1) == 0) {
    goto LABEL_151;
  }
  v416 = &v593;
  uint64_t v417 = 32;
  uint64_t v418 = 0;
  swift_beginAccess();
  double v421 = *(double *)(v518 + 32);
  swift_endAccess();
  v419 = &v592;
  swift_beginAccess();
  double v420 = *(double *)(v522 + 32);
  swift_endAccess();
  if (v421 != v420) {
    goto LABEL_151;
  }
  v410 = &v591;
  uint64_t v411 = 32;
  uint64_t v412 = 0;
  swift_beginAccess();
  double v415 = *(double *)(v518 + 40);
  swift_endAccess();
  v413 = &v590;
  swift_beginAccess();
  double v414 = *(double *)(v522 + 40);
  swift_endAccess();
  if (v415 != v414) {
    goto LABEL_151;
  }
  v401 = &v589;
  uint64_t v402 = 32;
  uint64_t v403 = 0;
  swift_beginAccess();
  uint64_t v405 = *(void *)(v518 + 48);
  uint64_t v408 = *(void *)(v518 + 56);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v404 = &v588;
  swift_beginAccess();
  uint64_t v406 = *(void *)(v522 + 48);
  uint64_t v407 = *(void *)(v522 + 56);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v409 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v409 & 1) == 0) {
    goto LABEL_151;
  }
  v392 = &v587;
  uint64_t v393 = 32;
  uint64_t v394 = 0;
  swift_beginAccess();
  uint64_t v396 = *(void *)(v518 + 64);
  uint64_t v399 = *(void *)(v518 + 72);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v395 = &v586;
  swift_beginAccess();
  uint64_t v397 = *(void *)(v522 + 64);
  uint64_t v398 = *(void *)(v522 + 72);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v400 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v400 & 1) == 0) {
    goto LABEL_151;
  }
  v383 = &v585;
  uint64_t v384 = 32;
  uint64_t v385 = 0;
  swift_beginAccess();
  uint64_t v387 = *(void *)(v518 + 80);
  uint64_t v390 = *(void *)(v518 + 88);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v386 = &v584;
  swift_beginAccess();
  uint64_t v388 = *(void *)(v522 + 80);
  uint64_t v389 = *(void *)(v522 + 88);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v391 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v391 & 1) == 0) {
    goto LABEL_151;
  }
  v374 = &v583;
  uint64_t v375 = 32;
  uint64_t v376 = 0;
  swift_beginAccess();
  uint64_t v378 = *(void *)(v518 + 96);
  uint64_t v381 = *(void *)(v518 + 104);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v377 = &v582;
  swift_beginAccess();
  uint64_t v379 = *(void *)(v522 + 96);
  uint64_t v380 = *(void *)(v522 + 104);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v382 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v382 & 1) == 0) {
    goto LABEL_151;
  }
  v365 = &v581;
  uint64_t v366 = 32;
  uint64_t v367 = 0;
  swift_beginAccess();
  uint64_t v369 = *(void *)(v518 + 112);
  uint64_t v372 = *(void *)(v518 + 120);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v368 = &v580;
  swift_beginAccess();
  uint64_t v370 = *(void *)(v522 + 112);
  uint64_t v371 = *(void *)(v522 + 120);
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v373 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v373 & 1) == 0) {
    goto LABEL_151;
  }
  v357 = &unk_26B18B000;
  v355 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__currentRatePlan);
  v356 = &v579;
  uint64_t v358 = 32;
  uint64_t v359 = 0;
  swift_beginAccess();
  sub_24D24B80C(v355, v517);
  swift_endAccess();
  v360 = (uint64_t *)(v522 + v357[429]);
  v361 = &v578;
  swift_beginAccess();
  sub_24D24B80C(v360, v515);
  swift_endAccess();
  v362 = (char *)v511 + *(int *)(v509 + 48);
  sub_24D24B80C(v517, v511);
  sub_24D24B80C(v515, v362);
  v363 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v505 + 48);
  uint64_t v364 = v505 + 48;
  if (v363((char *)v511, 1, v504) == 1)
  {
    if (v363(v362, 1, v504) != 1) {
      goto LABEL_21;
    }
    sub_24D24B9F0((uint64_t)v511);
    int v354 = 1;
  }
  else
  {
    sub_24D24B80C(v511, v513);
    if (v363(v362, 1, v504) == 1)
    {
      sub_24D24BE88((uint64_t)v513);
LABEL_21:
      sub_24D25CCF4((uint64_t)v511);
      int v354 = 0;
      goto LABEL_19;
    }
    sub_24D24BAC0(v362, v508);
    BOOL v353 = static EnergySitePayload.CurrentRatePlan.== infix(_:_:)((uint64_t)v513, (uint64_t *)v508);
    sub_24D24BE88((uint64_t)v508);
    sub_24D24BE88((uint64_t)v513);
    sub_24D24B9F0((uint64_t)v511);
    int v354 = v353;
  }
LABEL_19:
  int v352 = v354;
  sub_24D24B9F0((uint64_t)v515);
  sub_24D24B9F0((uint64_t)v517);
  if ((v352 & 1) == 0) {
    goto LABEL_151;
  }
  char v342 = &unk_26B18B000;
  char v340 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointCustomIndex);
  char v341 = &v577;
  uint64_t v343 = 32;
  uint64_t v344 = 0;
  swift_beginAccess();
  uint64_t v349 = *v340;
  unint64_t v350 = v340[1];
  sub_24D229320(v349, v350);
  swift_endAccess();
  sub_24D229320(v349, v350);
  v345 = (uint64_t *)(v522 + v342[438]);
  v346 = &v576;
  swift_beginAccess();
  uint64_t v347 = *v345;
  unint64_t v348 = v345[1];
  sub_24D229320(v347, v348);
  swift_endAccess();
  sub_24D229320(v347, v348);
  int v351 = MEMORY[0x253322CD0](v349, v350, v347, v348);
  sub_24D2293AC(v347, v348);
  sub_24D2293AC(v349, v350);
  sub_24D2293AC(v347, v348);
  sub_24D2293AC(v349, v350);
  if ((v351 & 1) == 0) {
    goto LABEL_151;
  }
  uint64_t v330 = &unk_26B18B000;
  uint64_t v328 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryCustomIndex);
  uint64_t v329 = &v575;
  uint64_t v331 = 32;
  uint64_t v332 = 0;
  swift_beginAccess();
  uint64_t v337 = *v328;
  unint64_t v338 = v328[1];
  sub_24D229320(v337, v338);
  swift_endAccess();
  sub_24D229320(v337, v338);
  uint64_t v333 = (uint64_t *)(v522 + v330[439]);
  char v334 = &v574;
  swift_beginAccess();
  uint64_t v335 = *v333;
  unint64_t v336 = v333[1];
  sub_24D229320(v335, v336);
  swift_endAccess();
  sub_24D229320(v335, v336);
  int v339 = MEMORY[0x253322CD0](v337, v338, v335, v336);
  sub_24D2293AC(v335, v336);
  sub_24D2293AC(v337, v338);
  sub_24D2293AC(v335, v336);
  sub_24D2293AC(v337, v338);
  if ((v339 & 1) == 0) {
    goto LABEL_151;
  }
  uint64_t v318 = &unk_26B18B000;
  uint64_t v316 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockCustomIndex);
  uint64_t v317 = &v573;
  uint64_t v319 = 32;
  uint64_t v320 = 0;
  swift_beginAccess();
  uint64_t v325 = *v316;
  unint64_t v326 = v316[1];
  sub_24D229320(v325, v326);
  swift_endAccess();
  sub_24D229320(v325, v326);
  uint64_t v321 = (uint64_t *)(v522 + v318[440]);
  uint64_t v322 = &v572;
  swift_beginAccess();
  uint64_t v323 = *v321;
  unint64_t v324 = v321[1];
  sub_24D229320(v323, v324);
  swift_endAccess();
  sub_24D229320(v323, v324);
  int v327 = MEMORY[0x253322CD0](v325, v326, v323, v324);
  sub_24D2293AC(v323, v324);
  sub_24D2293AC(v325, v326);
  sub_24D2293AC(v323, v324);
  sub_24D2293AC(v325, v326);
  if ((v327 & 1) == 0) {
    goto LABEL_151;
  }
  uint64_t v306 = &unk_26B18B000;
  uint64_t v304 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__ckFunctionToken);
  uint64_t v305 = &v571;
  uint64_t v307 = 32;
  uint64_t v308 = 0;
  swift_beginAccess();
  uint64_t v311 = *v304;
  uint64_t v314 = v304[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  uint64_t v309 = (uint64_t *)(v522 + v306[427]);
  uint64_t v310 = &v570;
  swift_beginAccess();
  uint64_t v312 = *v309;
  uint64_t v313 = v309[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v315 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v315 & 1) == 0) {
    goto LABEL_151;
  }
  uint64_t v294 = &unk_26B18B000;
  uint64_t v292 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountName);
  uint64_t v293 = &v569;
  uint64_t v295 = 32;
  uint64_t v296 = 0;
  swift_beginAccess();
  uint64_t v299 = *v292;
  uint64_t v302 = v292[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  uint64_t v297 = (uint64_t *)(v522 + v294[418]);
  uint64_t v298 = &v568;
  swift_beginAccess();
  uint64_t v300 = *v297;
  uint64_t v301 = v297[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v303 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v303 & 1) == 0) {
    goto LABEL_151;
  }
  uint64_t v282 = &unk_26B18B000;
  uint64_t v280 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accountNumber);
  uint64_t v281 = &v567;
  uint64_t v283 = 32;
  uint64_t v284 = 0;
  swift_beginAccess();
  uint64_t v287 = *v280;
  uint64_t v290 = v280[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  uint64_t v285 = (uint64_t *)(v522 + v282[421]);
  uint64_t v286 = &v566;
  swift_beginAccess();
  uint64_t v288 = *v285;
  uint64_t v289 = v285[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v291 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v291 & 1) == 0) {
    goto LABEL_151;
  }
  uint64_t v270 = &unk_26B18B000;
  v268 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__address);
  v269 = &v565;
  uint64_t v271 = 32;
  uint64_t v272 = 0;
  swift_beginAccess();
  uint64_t v275 = *v268;
  uint64_t v278 = v268[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v273 = (uint64_t *)(v522 + v270[450]);
  uint64_t v274 = &v564;
  swift_beginAccess();
  uint64_t v276 = *v273;
  uint64_t v277 = v273[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v279 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v279 & 1) == 0) {
    goto LABEL_151;
  }
  v258 = &unk_26B18B000;
  v256 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__serviceLocationID);
  v257 = &v563;
  uint64_t v259 = 32;
  uint64_t v260 = 0;
  swift_beginAccess();
  uint64_t v263 = *v256;
  uint64_t v266 = v256[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v261 = (uint64_t *)(v522 + v258[433]);
  v262 = &v562;
  swift_beginAccess();
  uint64_t v264 = *v261;
  uint64_t v265 = v261[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v267 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v267 & 1) == 0) {
    goto LABEL_151;
  }
  v246 = &unk_26B18B000;
  uint64_t v244 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__alternateSupplier);
  v245 = &v561;
  uint64_t v247 = 32;
  uint64_t v248 = 0;
  swift_beginAccess();
  uint64_t v251 = *v244;
  uint64_t v254 = v244[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v249 = (uint64_t *)(v522 + v246[432]);
  v250 = &v560;
  swift_beginAccess();
  uint64_t v252 = *v249;
  uint64_t v253 = v249[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v255 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v255 & 1) == 0) {
    goto LABEL_151;
  }
  v236 = &unk_26B18B000;
  v234 = (const void *)(v518
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__accessTokenExpirationDate);
  v235 = &v559;
  uint64_t v237 = 32;
  uint64_t v238 = 0;
  swift_beginAccess();
  sub_24D24BFB8(v234, v503);
  swift_endAccess();
  v239 = (const void *)(v522 + v236[443]);
  v240 = &v558;
  swift_beginAccess();
  sub_24D24BFB8(v239, v501);
  swift_endAccess();
  v241 = &v447[*(int *)(v428 + 48)];
  sub_24D24BFB8(v503, v447);
  sub_24D24BFB8(v501, v241);
  uint64_t v242 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v424 + 48);
  uint64_t v243 = v424 + 48;
  if (v242(v447, 1, v423) == 1)
  {
    if (v242(v241, 1, v423) == 1)
    {
      sub_24D24C310((uint64_t)v447);
      int v233 = 1;
      goto LABEL_43;
    }
  }
  else
  {
    sub_24D24BFB8(v447, v499);
    if (v242(v241, 1, v423) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v424 + 32))(v427, v241, v423);
      sub_24D25CFC0();
      int v232 = sub_24D290B58();
      v231 = *(void (**)(char *, uint64_t))(v424 + 8);
      uint64_t v230 = v424 + 8;
      v231(v427, v423);
      v231(v499, v423);
      sub_24D24C310((uint64_t)v447);
      int v233 = v232;
      goto LABEL_43;
    }
    (*(void (**)(char *, uint64_t))(v424 + 8))(v499, v423);
  }
  sub_24D25CE70((uint64_t)v447);
  int v233 = 0;
LABEL_43:
  int v229 = v233;
  sub_24D24C310((uint64_t)v501);
  sub_24D24C310((uint64_t)v503);
  if ((v229 & 1) == 0) {
    goto LABEL_151;
  }
  v223 = &unk_26B18B000;
  int v221 = (const void *)(v518
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__utilitySupportedCheckDate);
  v222 = &v557;
  uint64_t v224 = 32;
  uint64_t v225 = 0;
  swift_beginAccess();
  sub_24D24BFB8(v221, v497);
  swift_endAccess();
  v226 = (const void *)(v522 + v223[446]);
  v227 = &v556;
  swift_beginAccess();
  sub_24D24BFB8(v226, v495);
  swift_endAccess();
  v228 = &v445[*(int *)(v428 + 48)];
  sub_24D24BFB8(v497, v445);
  sub_24D24BFB8(v495, v228);
  if (v242(v445, 1, v423) == 1)
  {
    if (v242(v228, 1, v423) == 1)
    {
      sub_24D24C310((uint64_t)v445);
      int v220 = 1;
      goto LABEL_54;
    }
  }
  else
  {
    sub_24D24BFB8(v445, v493);
    if (v242(v228, 1, v423) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v424 + 32))(v427, v228, v423);
      sub_24D25CFC0();
      int v219 = sub_24D290B58();
      v218 = *(void (**)(char *, uint64_t))(v424 + 8);
      uint64_t v217 = v424 + 8;
      v218(v427, v423);
      v218(v493, v423);
      sub_24D24C310((uint64_t)v445);
      int v220 = v219;
      goto LABEL_54;
    }
    (*(void (**)(char *, uint64_t))(v424 + 8))(v493, v423);
  }
  sub_24D25CE70((uint64_t)v445);
  int v220 = 0;
LABEL_54:
  int v216 = v220;
  sub_24D24C310((uint64_t)v495);
  sub_24D24C310((uint64_t)v497);
  if ((v216 & 1) == 0) {
    goto LABEL_151;
  }
  v210 = &unk_26B18B000;
  v208 = (const void *)(v518
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__amiLastRefreshDate);
  v209 = &v555;
  uint64_t v211 = 32;
  uint64_t v212 = 0;
  swift_beginAccess();
  sub_24D24BFB8(v208, v491);
  swift_endAccess();
  v213 = (const void *)(v522 + v210[435]);
  v214 = &v554;
  swift_beginAccess();
  sub_24D24BFB8(v213, v489);
  swift_endAccess();
  v215 = &v443[*(int *)(v428 + 48)];
  sub_24D24BFB8(v491, v443);
  sub_24D24BFB8(v489, v215);
  if (v242(v443, 1, v423) == 1)
  {
    if (v242(v215, 1, v423) != 1) {
      goto LABEL_67;
    }
    sub_24D24C310((uint64_t)v443);
    int v207 = 1;
  }
  else
  {
    sub_24D24BFB8(v443, v487);
    if (v242(v215, 1, v423) == 1)
    {
      (*(void (**)(char *, uint64_t))(v424 + 8))(v487, v423);
LABEL_67:
      sub_24D25CE70((uint64_t)v443);
      int v207 = 0;
      goto LABEL_65;
    }
    (*(void (**)(char *, char *, uint64_t))(v424 + 32))(v427, v215, v423);
    sub_24D25CFC0();
    int v206 = sub_24D290B58();
    v205 = *(void (**)(char *, uint64_t))(v424 + 8);
    uint64_t v204 = v424 + 8;
    v205(v427, v423);
    v205(v487, v423);
    sub_24D24C310((uint64_t)v443);
    int v207 = v206;
  }
LABEL_65:
  int v203 = v207;
  sub_24D24C310((uint64_t)v489);
  sub_24D24C310((uint64_t)v491);
  if ((v203 & 1) == 0) {
    goto LABEL_151;
  }
  v196 = &unk_26B18B000;
  uint64_t v194 = (unsigned __int8 *)(v518
                           + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__hasExportedEnergy_p);
  v195 = &v553;
  uint64_t v197 = 32;
  uint64_t v198 = 0;
  swift_beginAccess();
  int v201 = *v194;
  swift_endAccess();
  uint64_t v199 = (unsigned __int8 *)(v522 + v196[416]);
  v200 = &v552;
  swift_beginAccess();
  int v202 = *v199;
  swift_endAccess();
  if ((v201 & 1) != (v202 & 1)) {
    goto LABEL_151;
  }
  v188 = &unk_26B18B000;
  v186 = (const void *)(v518
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usagePointNextRefreshDate);
  uint64_t v187 = &v551;
  uint64_t v189 = 32;
  uint64_t v190 = 0;
  swift_beginAccess();
  sub_24D24BFB8(v186, v485);
  swift_endAccess();
  v191 = (const void *)(v522 + v188[445]);
  uint64_t v192 = &v550;
  swift_beginAccess();
  sub_24D24BFB8(v191, v483);
  swift_endAccess();
  v193 = &v441[*(int *)(v428 + 48)];
  sub_24D24BFB8(v485, v441);
  sub_24D24BFB8(v483, v193);
  if (v242(v441, 1, v423) == 1)
  {
    if (v242(v193, 1, v423) == 1)
    {
      sub_24D24C310((uint64_t)v441);
      int v185 = 1;
      goto LABEL_78;
    }
  }
  else
  {
    sub_24D24BFB8(v441, v481);
    if (v242(v193, 1, v423) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v424 + 32))(v427, v193, v423);
      sub_24D25CFC0();
      int v184 = sub_24D290B58();
      v183 = *(void (**)(char *, uint64_t))(v424 + 8);
      uint64_t v182 = v424 + 8;
      v183(v427, v423);
      v183(v481, v423);
      sub_24D24C310((uint64_t)v441);
      int v185 = v184;
      goto LABEL_78;
    }
    (*(void (**)(char *, uint64_t))(v424 + 8))(v481, v423);
  }
  sub_24D25CE70((uint64_t)v441);
  int v185 = 0;
LABEL_78:
  int v181 = v185;
  sub_24D24C310((uint64_t)v483);
  sub_24D24C310((uint64_t)v485);
  if ((v181 & 1) == 0) {
    goto LABEL_151;
  }
  v175 = &unk_26B18B000;
  uint64_t v173 = (const void *)(v518
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__usageSummaryNextRefreshDate);
  v174 = &v549;
  uint64_t v176 = 32;
  uint64_t v177 = 0;
  swift_beginAccess();
  sub_24D24BFB8(v173, v479);
  swift_endAccess();
  uint64_t v178 = (const void *)(v522 + v175[448]);
  v179 = &v548;
  swift_beginAccess();
  sub_24D24BFB8(v178, v477);
  swift_endAccess();
  uint64_t v180 = &v439[*(int *)(v428 + 48)];
  sub_24D24BFB8(v479, v439);
  sub_24D24BFB8(v477, v180);
  if (v242(v439, 1, v423) == 1)
  {
    if (v242(v180, 1, v423) == 1)
    {
      sub_24D24C310((uint64_t)v439);
      int v172 = 1;
      goto LABEL_89;
    }
  }
  else
  {
    sub_24D24BFB8(v439, v475);
    if (v242(v180, 1, v423) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v424 + 32))(v427, v180, v423);
      sub_24D25CFC0();
      int v171 = sub_24D290B58();
      v170 = *(void (**)(char *, uint64_t))(v424 + 8);
      uint64_t v169 = v424 + 8;
      v170(v427, v423);
      v170(v475, v423);
      sub_24D24C310((uint64_t)v439);
      int v172 = v171;
      goto LABEL_89;
    }
    (*(void (**)(char *, uint64_t))(v424 + 8))(v475, v423);
  }
  sub_24D25CE70((uint64_t)v439);
  int v172 = 0;
LABEL_89:
  int v168 = v172;
  sub_24D24C310((uint64_t)v477);
  sub_24D24C310((uint64_t)v479);
  if ((v168 & 1) == 0) {
    goto LABEL_151;
  }
  v162 = &unk_26B18B000;
  v160 = (const void *)(v518
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__intervalBlockNextRefreshDate);
  v161 = &v547;
  uint64_t v163 = 32;
  uint64_t v164 = 0;
  swift_beginAccess();
  sub_24D24BFB8(v160, v473);
  swift_endAccess();
  v165 = (const void *)(v522 + v162[449]);
  uint64_t v166 = &v546;
  swift_beginAccess();
  sub_24D24BFB8(v165, v471);
  swift_endAccess();
  v167 = &v437[*(int *)(v428 + 48)];
  sub_24D24BFB8(v473, v437);
  sub_24D24BFB8(v471, v167);
  if (v242(v437, 1, v423) == 1)
  {
    if (v242(v167, 1, v423) != 1) {
      goto LABEL_102;
    }
    sub_24D24C310((uint64_t)v437);
    int v159 = 1;
  }
  else
  {
    sub_24D24BFB8(v437, v469);
    if (v242(v167, 1, v423) == 1)
    {
      (*(void (**)(char *, uint64_t))(v424 + 8))(v469, v423);
LABEL_102:
      sub_24D25CE70((uint64_t)v437);
      int v159 = 0;
      goto LABEL_100;
    }
    (*(void (**)(char *, char *, uint64_t))(v424 + 32))(v427, v167, v423);
    sub_24D25CFC0();
    int v158 = sub_24D290B58();
    uint64_t v157 = *(void (**)(char *, uint64_t))(v424 + 8);
    uint64_t v156 = v424 + 8;
    v157(v427, v423);
    v157(v469, v423);
    sub_24D24C310((uint64_t)v437);
    int v159 = v158;
  }
LABEL_100:
  int v155 = v159;
  sub_24D24C310((uint64_t)v471);
  sub_24D24C310((uint64_t)v473);
  if ((v155 & 1) == 0) {
    goto LABEL_151;
  }
  unint64_t v145 = &unk_26B18B000;
  uint64_t v143 = (uint64_t *)(v518
                   + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionState);
  char v144 = &v545;
  uint64_t v146 = 32;
  uint64_t v147 = 0;
  swift_beginAccess();
  uint64_t v150 = *v143;
  uint64_t v153 = v143[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  v148 = (uint64_t *)(v522 + v145[434]);
  uint64_t v149 = &v544;
  swift_beginAccess();
  uint64_t v151 = *v148;
  uint64_t v152 = v148[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRetain();
  int v154 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v154 & 1) == 0) {
    goto LABEL_151;
  }
  unint64_t v137 = &unk_26B18B000;
  uint64_t v135 = (const void *)(v518
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionCreationDate);
  uint64_t v136 = &v543;
  uint64_t v138 = 32;
  uint64_t v139 = 0;
  swift_beginAccess();
  sub_24D24BFB8(v135, v467);
  swift_endAccess();
  uint64_t v140 = (const void *)(v522 + v137[441]);
  int v141 = &v542;
  swift_beginAccess();
  sub_24D24BFB8(v140, v465);
  swift_endAccess();
  uint64_t v142 = &v435[*(int *)(v428 + 48)];
  sub_24D24BFB8(v467, v435);
  sub_24D24BFB8(v465, v142);
  if (v242(v435, 1, v423) == 1)
  {
    if (v242(v142, 1, v423) == 1)
    {
      sub_24D24C310((uint64_t)v435);
      int v134 = 1;
      goto LABEL_112;
    }
  }
  else
  {
    sub_24D24BFB8(v435, v463);
    if (v242(v142, 1, v423) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v424 + 32))(v427, v142, v423);
      sub_24D25CFC0();
      int v133 = sub_24D290B58();
      uint64_t v132 = *(void (**)(char *, uint64_t))(v424 + 8);
      uint64_t v131 = v424 + 8;
      v132(v427, v423);
      v132(v463, v423);
      sub_24D24C310((uint64_t)v435);
      int v134 = v133;
      goto LABEL_112;
    }
    (*(void (**)(char *, uint64_t))(v424 + 8))(v463, v423);
  }
  sub_24D25CE70((uint64_t)v435);
  int v134 = 0;
LABEL_112:
  int v130 = v134;
  sub_24D24C310((uint64_t)v465);
  sub_24D24C310((uint64_t)v467);
  if ((v130 & 1) == 0) {
    goto LABEL_151;
  }
  uint64_t v124 = &unk_26B18B000;
  unint64_t v122 = (const void *)(v518
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__subscriptionStartDate);
  uint64_t v123 = &v541;
  uint64_t v125 = 32;
  uint64_t v126 = 0;
  swift_beginAccess();
  sub_24D24BFB8(v122, v461);
  swift_endAccess();
  uint64_t v127 = (const void *)(v522 + v124[436]);
  uint64_t v128 = &v540;
  swift_beginAccess();
  sub_24D24BFB8(v127, v459);
  swift_endAccess();
  uint64_t v129 = &v433[*(int *)(v428 + 48)];
  sub_24D24BFB8(v461, v433);
  sub_24D24BFB8(v459, v129);
  if (v242(v433, 1, v423) == 1)
  {
    if (v242(v129, 1, v423) == 1)
    {
      sub_24D24C310((uint64_t)v433);
      int v121 = 1;
      goto LABEL_123;
    }
  }
  else
  {
    sub_24D24BFB8(v433, v457);
    if (v242(v129, 1, v423) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v424 + 32))(v427, v129, v423);
      sub_24D25CFC0();
      int v120 = sub_24D290B58();
      uint64_t v119 = *(void (**)(char *, uint64_t))(v424 + 8);
      uint64_t v118 = v424 + 8;
      v119(v427, v423);
      v119(v457, v423);
      sub_24D24C310((uint64_t)v433);
      int v121 = v120;
      goto LABEL_123;
    }
    (*(void (**)(char *, uint64_t))(v424 + 8))(v457, v423);
  }
  sub_24D25CE70((uint64_t)v433);
  int v121 = 0;
LABEL_123:
  int v117 = v121;
  sub_24D24C310((uint64_t)v459);
  sub_24D24C310((uint64_t)v461);
  if ((v117 & 1) == 0) {
    goto LABEL_151;
  }
  uint64_t v111 = &unk_26B18B000;
  uint64_t v109 = (const void *)(v518
                      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteTombstone);
  uint64_t v110 = &v539;
  uint64_t v112 = 32;
  uint64_t v113 = 0;
  swift_beginAccess();
  sub_24D24BFB8(v109, v455);
  swift_endAccess();
  v114 = (const void *)(v522 + v111[423]);
  uint64_t v115 = &v538;
  swift_beginAccess();
  sub_24D24BFB8(v114, v453);
  swift_endAccess();
  uint64_t v116 = &v431[*(int *)(v428 + 48)];
  sub_24D24BFB8(v455, v431);
  sub_24D24BFB8(v453, v116);
  if (v242(v431, 1, v423) == 1)
  {
    if (v242(v116, 1, v423) == 1)
    {
      sub_24D24C310((uint64_t)v431);
      int v108 = 1;
      goto LABEL_134;
    }
  }
  else
  {
    sub_24D24BFB8(v431, v451);
    if (v242(v116, 1, v423) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v424 + 32))(v427, v116, v423);
      sub_24D25CFC0();
      int v107 = sub_24D290B58();
      uint64_t v106 = *(void (**)(char *, uint64_t))(v424 + 8);
      uint64_t v105 = v424 + 8;
      v106(v427, v423);
      v106(v451, v423);
      sub_24D24C310((uint64_t)v431);
      int v108 = v107;
      goto LABEL_134;
    }
    (*(void (**)(char *, uint64_t))(v424 + 8))(v451, v423);
  }
  sub_24D25CE70((uint64_t)v431);
  int v108 = 0;
LABEL_134:
  int v104 = v108;
  sub_24D24C310((uint64_t)v453);
  sub_24D24C310((uint64_t)v455);
  if ((v104 & 1) == 0) {
    goto LABEL_151;
  }
  uint64_t v95 = &unk_26B18B000;
  uint64_t v93 = v518
      + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__siteVersion;
  uint64_t v94 = &v537;
  uint64_t v96 = 32;
  uint64_t v97 = 0;
  swift_beginAccess();
  int v100 = *(_DWORD *)v93;
  int v101 = *(unsigned __int8 *)(v93 + 4);
  swift_endAccess();
  uint64_t v98 = (int *)(v522 + v95[420]);
  uint64_t v99 = &v536;
  swift_beginAccess();
  int v102 = *v98;
  int v103 = *((unsigned __int8 *)v98 + 4);
  swift_endAccess();
  int v532 = v100;
  char v533 = v101 & 1;
  int v534 = v102;
  char v535 = v103 & 1;
  if (v101)
  {
    if (v535)
    {
      BOOL v92 = 1;
      goto LABEL_145;
    }
    goto LABEL_147;
  }
  sub_24D25CFA4((uint64_t)&v532, (uint64_t)&v529);
  if (v535)
  {
LABEL_147:
    BOOL v92 = 0;
    goto LABEL_145;
  }
  BOOL v92 = v529 == v534;
LABEL_145:
  if (v92)
  {
    uint64_t v84 = &unk_26B18B000;
    v83[0] = v518
           + OBJC_IVAR____TtCV19EnergyKitFoundation17EnergySitePayloadP33_D6784D412C41A6893A7748F683861ABE13_StorageClass__generationMeters;
    v83[1] = &v531;
    uint64_t v85 = 32;
    uint64_t v86 = 0;
    swift_beginAccess();
    uint64_t v90 = *(void *)v83[0];
    swift_bridgeObjectRetain();
    swift_endAccess();
    swift_bridgeObjectRetain();
    uint64_t v87 = (uint64_t *)(v522 + v84[431]);
    uint64_t v88 = &v530;
    swift_beginAccess();
    uint64_t v89 = *v87;
    swift_bridgeObjectRetain();
    swift_endAccess();
    swift_bridgeObjectRetain();
    int v91 = sub_24D290D08();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v91)
    {
      swift_release();
      swift_release();
      int v422 = 1;
      return v422 & 1;
    }
  }
LABEL_151:
  swift_release();
  swift_release();
  int v422 = 0;
  return v422 & 1;
}

uint64_t sub_24D257F3C@<X0>(void *a1@<X0>, uint64_t (*a2)(void, void)@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(*a1, a1[1]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24D257F94@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_24D257F3C(a1, *(uint64_t (**)(void, void))(v2 + 16), a2);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_24D257FC4()
{
}

uint64_t EnergySitePayload.hashValue.getter()
{
  return sub_24D290E68();
}

unint64_t sub_24D258044()
{
  uint64_t v2 = qword_26985D1E8;
  if (!qword_26985D1E8)
  {
    type metadata accessor for EnergySitePayload();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D1E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D2580C8@<X0>(uint64_t a1@<X8>)
{
  return EnergySitePayload.init()(a1);
}

uint64_t sub_24D2580E0()
{
  return static EnergySitePayload.protoMessageName.getter();
}

uint64_t sub_24D2580F8()
{
  return sub_24D290998() & 1;
}

uint64_t sub_24D258114@<X0>(uint64_t a1@<X8>)
{
  return EnergySitePayload.unknownFields.getter(a1);
}

uint64_t sub_24D25812C(uint64_t a1)
{
  return EnergySitePayload.unknownFields.setter(a1);
}

void (*sub_24D258144(void *a1))(void **a1, char a2)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = EnergySitePayload.unknownFields.modify();
  return sub_24D2581AC;
}

void sub_24D2581AC(void **a1, char a2)
{
  uint64_t v2 = (void (**)(void *, uint64_t))*a1;
  if (a2) {
    v2[4](v2, 1);
  }
  else {
    v2[4](v2, 0);
  }
  free(v2);
}

uint64_t sub_24D258228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return EnergySitePayload.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_24D258274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return EnergySitePayload.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_24D2582C0()
{
  return sub_24D2909E8();
}

uint64_t sub_24D2582D8()
{
  return sub_24D2908F8() & 1;
}

unint64_t sub_24D258314()
{
  uint64_t v2 = qword_26985D1F0;
  if (!qword_26985D1F0)
  {
    type metadata accessor for EnergySitePayload();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D1F0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D258398()
{
  return sub_24D2908E8() & 1;
}

uint64_t sub_24D2583B4@<X0>(uint64_t a1@<X8>)
{
  return static EnergySitePayload._protobuf_nameMap.getter(a1);
}

uint64_t sub_24D2583CC()
{
  return sub_24D2909D8();
}

unint64_t sub_24D2583FC()
{
  uint64_t v2 = qword_26985D1F8;
  if (!qword_26985D1F8)
  {
    type metadata accessor for EnergySitePayload();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D1F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D258480()
{
  return EnergySitePayload.hashValue.getter();
}

uint64_t sub_24D258498()
{
  return sub_24D2909E8();
}

uint64_t sub_24D2584D0(uint64_t a1, uint64_t a2)
{
  return static EnergySitePayload.== infix(_:_:)(a1, a2) & 1;
}

uint64_t sub_24D2584EC()
{
  uint64_t v0 = sub_24D247964();
  uint64_t v4 = *v0;
  uint64_t v5 = v0[1];
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_24D290C08();
  uint64_t v6 = MEMORY[0x2533233F0](v4, v5, v1);
  uint64_t v7 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = v6;
  qword_26985E0B0 = v6;
  qword_26985E0B8 = v7;
  return result;
}

uint64_t *sub_24D25858C()
{
  if (qword_26985E0A8 != -1) {
    swift_once();
  }
  return &qword_26985E0B0;
}

uint64_t static EnergySitePayload.CurrentRatePlan.protoMessageName.getter()
{
  uint64_t v1 = *sub_24D25858C();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D25862C()
{
  uint64_t v4 = sub_24D290A98();
  __swift_allocate_value_buffer(v4, qword_26B18BE38);
  __swift_project_value_buffer(v4, (uint64_t)qword_26B18BE38);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8E8);
  sub_24D290FA8();
  uint64_t v0 = *(int *)(v7 + 48);
  *uint64_t v1 = 1;
  uint64_t v6 = (char *)v1 + v0;
  *(void *)uint64_t v6 = "ratePlan";
  *((void *)v6 + 1) = 8;
  v6[16] = 2;
  unsigned int v5 = *MEMORY[0x263F50718];
  uint64_t v2 = sub_24D290A78();
  (*(void (**)(char *, void))(*(void *)(v2 - 8) + 104))(v6, v5);
  sub_24D22AD58();
  return sub_24D290A88();
}

uint64_t sub_24D258744()
{
  if (qword_26B18BE50 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24D290A98();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26B18BE38);
}

uint64_t static EnergySitePayload.CurrentRatePlan._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24D258744();
  uint64_t v1 = sub_24D290A98();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t EnergySitePayload.CurrentRatePlan.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_24D290908();
    if (v2 || (v1 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_24D258964();
    }
    uint64_t v2 = 0;
  }
  return result;
}

uint64_t sub_24D258964()
{
  return sub_24D290978();
}

uint64_t EnergySitePayload.CurrentRatePlan.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v35 = a2;
  uint64_t v23 = sub_24D2908B8();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = v23 - 8;
  unint64_t v26 = (*(void *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v27 = (char *)v9 - v26;
  uint64_t v34 = MEMORY[0x270FA5388](v22);
  uint64_t v33 = v3;
  uint64_t v30 = *v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v29 = &v32;
  uint64_t v32 = v30;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8C8);
  sub_24D258CD4();
  int v31 = sub_24D290D58();
  sub_24D230030();
  swift_bridgeObjectRelease();
  if (v31)
  {
    uint64_t v13 = v21;
  }
  else
  {
    uint64_t v15 = *(void *)v20;
    swift_bridgeObjectRetain();
    uint64_t v14 = type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
    sub_24D258D58();
    uint64_t v4 = v21;
    sub_24D290A58();
    uint64_t v16 = v4;
    uint64_t v17 = v4;
    if (v4)
    {
      void v9[2] = v17;
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = v16;
  }
  unsigned int v5 = v27;
  uint64_t v10 = v13;
  uint64_t v6 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v5, &v20[*(int *)(v6 + 20)], v23);
  uint64_t v7 = v10;
  sub_24D290898();
  uint64_t v11 = v7;
  uint64_t v12 = v7;
  if (v7) {
    v9[1] = v12;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v27, v23);
}

unint64_t sub_24D258CD4()
{
  uint64_t v2 = qword_26B18B8D0;
  if (!qword_26B18B8D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B18B8C8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18B8D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D258D58()
{
  uint64_t v2 = qword_26985D200;
  if (!qword_26985D200)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D200);
    return WitnessTable;
  }
  return v2;
}

BOOL static EnergySitePayload.CurrentRatePlan.== infix(_:_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = a1;
  uint64_t v22 = a2;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v23 = 0;
  uint64_t v15 = sub_24D2908B8();
  uint64_t v16 = *(void **)(v15 - 8);
  uint64_t v17 = v15 - 8;
  unint64_t v18 = (v16[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)v8 - v18;
  unint64_t v20 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void *)MEMORY[0x270FA5388](v2);
  uint64_t v21 = (char *)v8 - v20;
  uint64_t v29 = v4;
  uint64_t v28 = v5;
  uint64_t v26 = *v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v25 = *v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v24 = type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
  sub_24D25A6D4();
  int v27 = sub_24D290D08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v27)
  {
    v8[0] = type metadata accessor for EnergySitePayload.CurrentRatePlan();
    uint64_t v6 = v14 + *(int *)(v8[0] + 20);
    uint64_t v9 = (void (*)(char *, uint64_t, uint64_t))v16[2];
    v8[1] = v16 + 2;
    v9(v21, v6, v15);
    v9(v19, (uint64_t)v22 + *(int *)(v8[0] + 20), v15);
    sub_24D254454();
    int v12 = sub_24D290B58();
    uint64_t v11 = (void (*)(char *, uint64_t))v16[1];
    uint64_t v10 = v16 + 1;
    v11(v19, v15);
    v11(v21, v15);
    return (v12 & 1) != 0;
  }
  else
  {
    return 0;
  }
}

uint64_t EnergySitePayload.CurrentRatePlan.hashValue.getter()
{
  return sub_24D290E68();
}

char *sub_24D2590BC@<X0>(char *a1@<X8>)
{
  return EnergySitePayload.CurrentRatePlan.init()(a1);
}

uint64_t sub_24D2590D4()
{
  return static EnergySitePayload.CurrentRatePlan.protoMessageName.getter();
}

uint64_t sub_24D2590EC@<X0>(uint64_t a1@<X8>)
{
  return EnergySitePayload.CurrentRatePlan.unknownFields.getter(a1);
}

uint64_t sub_24D259104(uint64_t a1)
{
  return EnergySitePayload.CurrentRatePlan.unknownFields.setter(a1);
}

void (*sub_24D25911C(void *a1))(void **a1, char a2)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = EnergySitePayload.CurrentRatePlan.unknownFields.modify();
  return sub_24D2581AC;
}

uint64_t sub_24D259184()
{
  return EnergySitePayload.CurrentRatePlan.decodeMessage<A>(decoder:)();
}

uint64_t sub_24D2591D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return EnergySitePayload.CurrentRatePlan.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_24D25921C()
{
  return sub_24D2908F8() & 1;
}

uint64_t sub_24D259258@<X0>(uint64_t a1@<X8>)
{
  return static EnergySitePayload.CurrentRatePlan._protobuf_nameMap.getter(a1);
}

uint64_t sub_24D259270()
{
  return sub_24D2909D8();
}

uint64_t sub_24D2592A0()
{
  return EnergySitePayload.CurrentRatePlan.hashValue.getter();
}

uint64_t sub_24D2592B8()
{
  return sub_24D2909E8();
}

BOOL sub_24D2592F0(uint64_t a1, uint64_t *a2)
{
  return static EnergySitePayload.CurrentRatePlan.== infix(_:_:)(a1, a2);
}

uint64_t sub_24D25930C()
{
  uint64_t v0 = sub_24D25858C();
  uint64_t v4 = *v0;
  uint64_t v5 = v0[1];
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_24D290C08();
  uint64_t v6 = MEMORY[0x2533233F0](v4, v5, v1);
  uint64_t v7 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = v6;
  qword_26985E0C8 = v6;
  qword_26985E0D0 = v7;
  return result;
}

uint64_t *sub_24D2593AC()
{
  if (qword_26985E0C0 != -1) {
    swift_once();
  }
  return &qword_26985E0C8;
}

uint64_t static EnergySitePayload.CurrentRatePlan.RatePlan.protoMessageName.getter()
{
  uint64_t v1 = *sub_24D2593AC();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D25944C()
{
  uint64_t v8 = sub_24D290A98();
  __swift_allocate_value_buffer(v8, qword_26985E0E0);
  __swift_project_value_buffer(v8, (uint64_t)qword_26985E0E0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8E8);
  sub_24D290FA8();
  int v12 = v0;
  uint64_t v1 = *(int *)(v14 + 48);
  *uint64_t v0 = 1;
  uint64_t v10 = (char *)v0 + v1;
  *(void *)uint64_t v10 = "identifier";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  unsigned int v9 = *MEMORY[0x263F50718];
  uint64_t v13 = *(void (**)(void))(*(void *)(sub_24D290A78() - 8) + 104);
  ((void (*)(char *, void))v13)(v10, v9);
  uint64_t v11 = *(void *)(*(void *)(v14 - 8) + 72);
  uint64_t v2 = *(int *)(v14 + 48);
  *(void *)((char *)v12 + v11) = 2;
  uint64_t v3 = (char *)v12 + v11 + v2;
  *(void *)uint64_t v3 = "descriptor";
  *((void *)v3 + 1) = 10;
  v3[16] = 2;
  v13();
  uint64_t v4 = *(int *)(v14 + 48);
  uint64_t v5 = (void *)((char *)v12 + 2 * v11);
  *uint64_t v5 = 3;
  uint64_t v6 = (char *)v5 + v4;
  *(void *)uint64_t v6 = "peaks";
  *((void *)v6 + 1) = 5;
  v6[16] = 2;
  v13();
  sub_24D22AD58();
  return sub_24D290A88();
}

uint64_t sub_24D259680()
{
  if (qword_26985E0D8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24D290A98();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26985E0E0);
}

uint64_t static EnergySitePayload.CurrentRatePlan.RatePlan._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24D259680();
  uint64_t v1 = sub_24D290A98();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_24D290908();
    if (v2 || (v1 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 1:
        sub_24D25996C();
        break;
      case 2:
        sub_24D2599F4();
        break;
      case 3:
        sub_24D259A7C();
        break;
    }
    uint64_t v2 = 0;
  }
  return result;
}

uint64_t sub_24D25996C()
{
  return sub_24D290958();
}

uint64_t sub_24D2599F4()
{
  return sub_24D290958();
}

uint64_t sub_24D259A7C()
{
  return sub_24D290928();
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v46 = a1;
  uint64_t v42 = a2;
  uint64_t v43 = a3;
  uint64_t v57 = 0;
  uint64_t v56 = 0;
  uint64_t v58 = a2;
  uint64_t v47 = sub_24D2908B8();
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = v47 - 8;
  unint64_t v50 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v51 = (char *)v11 - v50;
  uint64_t v57 = MEMORY[0x270FA5388](v46);
  uint64_t v56 = v3;
  uint64_t v52 = *v3;
  uint64_t v53 = v3[1];
  swift_bridgeObjectRetain();
  int v54 = sub_24D290C28();
  swift_bridgeObjectRelease();
  if (v54)
  {
    uint64_t v37 = v45;
  }
  else
  {
    uint64_t v4 = v45;
    uint64_t v38 = *(void *)v44;
    uint64_t v39 = *((void *)v44 + 1);
    swift_bridgeObjectRetain();
    sub_24D290A38();
    uint64_t v40 = v4;
    uint64_t v41 = v4;
    if (v4)
    {
      uint64_t v13 = v41;
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v14 = v13;
      return result;
    }
    swift_bridgeObjectRelease();
    uint64_t v37 = v40;
  }
  uint64_t v33 = v37;
  uint64_t v34 = *((void *)v44 + 2);
  uint64_t v35 = *((void *)v44 + 3);
  swift_bridgeObjectRetain();
  int v36 = sub_24D290C28();
  swift_bridgeObjectRelease();
  if (v36)
  {
    uint64_t v28 = v33;
  }
  else
  {
    uint64_t v5 = v33;
    uint64_t v29 = *((void *)v44 + 2);
    uint64_t v30 = *((void *)v44 + 3);
    swift_bridgeObjectRetain();
    sub_24D290A38();
    uint64_t v31 = v5;
    uint64_t v32 = v5;
    if (v5)
    {
      uint64_t v12 = v32;
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v14 = v12;
      return result;
    }
    swift_bridgeObjectRelease();
    uint64_t v28 = v31;
  }
  uint64_t v23 = v28;
  uint64_t v26 = *((void *)v44 + 4);
  unint64_t v25 = *((void *)v44 + 5);
  sub_24D229320(v26, v25);
  sub_24D229320(v26, v25);
  uint64_t v24 = v55;
  v55[0] = v26;
  v55[1] = v25;
  sub_24D25A8E4();
  int v27 = sub_24D290D58();
  sub_24D24BF84((uint64_t)v24);
  sub_24D2293AC(v26, v25);
  if (v27)
  {
    uint64_t v18 = v23;
  }
  else
  {
    uint64_t v19 = *((void *)v44 + 4);
    unint64_t v20 = *((void *)v44 + 5);
    sub_24D229320(v19, v20);
    uint64_t v6 = v23;
    sub_24D290A08();
    uint64_t v21 = v6;
    uint64_t v22 = v6;
    if (v6)
    {
      v11[1] = v22;
      return sub_24D2293AC(v19, v20);
    }
    sub_24D2293AC(v19, v20);
    uint64_t v18 = v21;
  }
  uint64_t v7 = v51;
  uint64_t v15 = v18;
  uint64_t v8 = type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v7, &v44[*(int *)(v8 + 28)], v47);
  uint64_t v9 = v15;
  sub_24D290898();
  uint64_t v16 = v9;
  uint64_t v17 = v9;
  if (v9) {
    v11[0] = v17;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v51, v47);
}

BOOL static EnergySitePayload.CurrentRatePlan.RatePlan.== infix(_:_:)(void *a1, char *a2)
{
  uint64_t v24 = a1;
  uint64_t v32 = a2;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  uint64_t v25 = sub_24D2908B8();
  uint64_t v26 = *(void **)(v25 - 8);
  uint64_t v27 = v25 - 8;
  unint64_t v28 = (v26[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)v8 - v28;
  unint64_t v30 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void *)MEMORY[0x270FA5388](v2);
  uint64_t v31 = (char *)v8 - v30;
  uint64_t v39 = v4;
  uint64_t v38 = v5;
  uint64_t v33 = *v4;
  uint64_t v36 = v4[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v34 = *(void *)v32;
  uint64_t v35 = *((void *)v32 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int v37 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v37)
  {
    uint64_t v18 = v24[2];
    uint64_t v21 = v24[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = *((void *)v32 + 2);
    uint64_t v20 = *((void *)v32 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int v22 = sub_24D290C18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v22)
    {
      uint64_t v15 = v24[4];
      unint64_t v16 = v24[5];
      sub_24D229320(v15, v16);
      sub_24D229320(v15, v16);
      uint64_t v13 = *((void *)v32 + 4);
      unint64_t v14 = *((void *)v32 + 5);
      sub_24D229320(v13, v14);
      sub_24D229320(v13, v14);
      int v17 = MEMORY[0x253322CD0](v15, v16, v13, v14);
      sub_24D2293AC(v13, v14);
      sub_24D2293AC(v15, v16);
      sub_24D2293AC(v13, v14);
      sub_24D2293AC(v15, v16);
      if (v17)
      {
        v8[0] = type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
        uint64_t v6 = (char *)v24 + *(int *)(v8[0] + 28);
        uint64_t v9 = (void (*)(char *, char *, uint64_t))v26[2];
        v8[1] = v26 + 2;
        v9(v31, v6, v25);
        v9(v29, &v32[*(int *)(v8[0] + 28)], v25);
        sub_24D254454();
        int v12 = sub_24D290B58();
        uint64_t v11 = (void (*)(char *, uint64_t))v26[1];
        uint64_t v10 = v26 + 1;
        v11(v29, v25);
        v11(v31, v25);
        return (v12 & 1) != 0;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 0;
  }
}

uint64_t EnergySitePayload.CurrentRatePlan.RatePlan.hashValue.getter()
{
  return sub_24D290E68();
}

char *sub_24D25A484@<X0>(char *a1@<X8>)
{
  return EnergySitePayload.CurrentRatePlan.RatePlan.init()(a1);
}

uint64_t sub_24D25A49C()
{
  return static EnergySitePayload.CurrentRatePlan.RatePlan.protoMessageName.getter();
}

uint64_t sub_24D25A4B4@<X0>(uint64_t a1@<X8>)
{
  return EnergySitePayload.CurrentRatePlan.RatePlan.unknownFields.getter(a1);
}

uint64_t sub_24D25A4CC(uint64_t a1)
{
  return EnergySitePayload.CurrentRatePlan.RatePlan.unknownFields.setter(a1);
}

void (*sub_24D25A4E4(void *a1))(void **a1, char a2)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = EnergySitePayload.CurrentRatePlan.RatePlan.unknownFields.modify();
  return sub_24D2581AC;
}

uint64_t sub_24D25A54C()
{
  return EnergySitePayload.CurrentRatePlan.RatePlan.decodeMessage<A>(decoder:)();
}

uint64_t sub_24D25A598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return EnergySitePayload.CurrentRatePlan.RatePlan.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_24D25A5E4()
{
  return sub_24D2908F8() & 1;
}

uint64_t sub_24D25A620@<X0>(uint64_t a1@<X8>)
{
  return static EnergySitePayload.CurrentRatePlan.RatePlan._protobuf_nameMap.getter(a1);
}

uint64_t sub_24D25A638()
{
  return sub_24D2909D8();
}

uint64_t sub_24D25A668()
{
  return EnergySitePayload.CurrentRatePlan.RatePlan.hashValue.getter();
}

uint64_t sub_24D25A680()
{
  return sub_24D2909E8();
}

BOOL sub_24D25A6B8(void *a1, char *a2)
{
  return static EnergySitePayload.CurrentRatePlan.RatePlan.== infix(_:_:)(a1, a2);
}

unint64_t sub_24D25A6D4()
{
  uint64_t v2 = qword_26985D208;
  if (!qword_26985D208)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D208);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25A758()
{
  uint64_t v2 = qword_26985D210;
  if (!qword_26985D210)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D210);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25A7DC()
{
  uint64_t v2 = qword_26985D218;
  if (!qword_26985D218)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D218);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25A860()
{
  uint64_t v2 = qword_26B18BBE0;
  if (!qword_26B18BBE0)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18BBE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25A8E4()
{
  uint64_t v2 = qword_26B18BB30;
  if (!qword_26B18BB30)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18BB30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25A960()
{
  uint64_t v2 = qword_26985D220;
  if (!qword_26985D220)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D220);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25A9E4()
{
  uint64_t v2 = qword_26985D228;
  if (!qword_26985D228)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D228);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25AA68()
{
  return sub_24D25AA80();
}

unint64_t sub_24D25AA80()
{
  uint64_t v2 = qword_26B18B830;
  if (!qword_26B18B830)
  {
    type metadata accessor for EnergySitePayload();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18B830);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25AB04()
{
  return sub_24D2583FC();
}

unint64_t sub_24D25AB1C()
{
  return sub_24D258044();
}

unint64_t sub_24D25AB34()
{
  return sub_24D25AB4C();
}

unint64_t sub_24D25AB4C()
{
  uint64_t v2 = qword_26985D230;
  if (!qword_26985D230)
  {
    type metadata accessor for EnergySitePayload();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D230);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25ABD0()
{
  return sub_24D25ABE8();
}

unint64_t sub_24D25ABE8()
{
  uint64_t v2 = qword_26B18BBF0;
  if (!qword_26B18BBF0)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18BBF0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25AC6C()
{
  return sub_24D25A860();
}

unint64_t sub_24D25AC84()
{
  return sub_24D25A758();
}

unint64_t sub_24D25AC9C()
{
  return sub_24D25ACB4();
}

unint64_t sub_24D25ACB4()
{
  uint64_t v2 = qword_26985D238;
  if (!qword_26985D238)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D238);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25AD38()
{
  return sub_24D25AD50();
}

unint64_t sub_24D25AD50()
{
  uint64_t v2 = qword_26985D240;
  if (!qword_26985D240)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan.RatePlan();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D240);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25ADD4()
{
  return sub_24D258D58();
}

unint64_t sub_24D25ADEC()
{
  return sub_24D25A960();
}

unint64_t sub_24D25AE04()
{
  return sub_24D25A6D4();
}

void *type metadata accessor for _GeneratedWithProtocGenSwiftVersion()
{
  return &unk_26FF7DD50;
}

void *type metadata accessor for _GeneratedWithProtocGenSwiftVersion._2()
{
  return &unk_26FF7DD70;
}

unint64_t initializeBufferWithCopyOfBuffer for EnergySitePayload(void *a1, uint64_t *a2, uint64_t a3)
{
  int v12 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v12 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    swift_retain();
    *a1 = v7;
    return *a1 + ((v12 + 16) & ~(unint64_t)v12);
  }
  else
  {
    uint64_t v3 = sub_24D2908B8();
    (*(void (**)(void *, uint64_t *))(*(void *)(v3 - 8) + 16))(a1, a2);
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = *(uint64_t *)((char *)a2 + v5);
    swift_retain();
    *(void *)((char *)a1 + v5) = v6;
    return (unint64_t)a1;
  }
}

uint64_t destroy for EnergySitePayload(uint64_t a1)
{
  uint64_t v1 = sub_24D2908B8();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return swift_release();
}

uint64_t initializeWithCopy for EnergySitePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, a2);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(void *)(a2 + v8);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + v8) = v9;
  return result;
}

uint64_t assignWithCopy for EnergySitePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24))(a1, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void *)(a2 + v7);
  swift_retain();
  *(void *)(a1 + v7) = v8;
  swift_release();
  return a1;
}

uint64_t initializeWithTake for EnergySitePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(a1, a2);
  uint64_t result = a1;
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return result;
}

uint64_t assignWithTake for EnergySitePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(a1, a2);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergySitePayload()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24D25B240(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = sub_24D2908B8();
  if (a2 == *(_DWORD *)(*(void *)(v9 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 20)) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 20));
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for EnergySitePayload()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24D25B38C(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24D2908B8();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_24D25B484()
{
  uint64_t v2 = sub_24D2908B8();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

unint64_t initializeBufferWithCopyOfBuffer for EnergySitePayload.CurrentRatePlan(void *a1, uint64_t *a2, uint64_t a3)
{
  int v13 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v13 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    swift_retain();
    *a1 = v8;
    return *a1 + ((v13 + 16) & ~(unint64_t)v13);
  }
  else
  {
    uint64_t v5 = *a2;
    swift_bridgeObjectRetain();
    *a1 = v5;
    uint64_t v7 = (char *)a1 + *(int *)(a3 + 20);
    uint64_t v6 = (char *)a2 + *(int *)(a3 + 20);
    uint64_t v3 = sub_24D2908B8();
    (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 16))(v7, v6);
    return (unint64_t)a1;
  }
}

uint64_t destroy for EnergySitePayload.CurrentRatePlan(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v5 = *(int *)(a2 + 20);
  uint64_t v2 = sub_24D2908B8();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v5);
}

char *initializeWithCopy for EnergySitePayload.CurrentRatePlan(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)a2;
  swift_bridgeObjectRetain();
  *(void *)a1 = v5;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 16))(&a1[v7], &a2[v7]);
  return a1;
}

char *assignWithCopy for EnergySitePayload.CurrentRatePlan(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)a2;
  swift_bridgeObjectRetain();
  *(void *)a1 = v5;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 24))(&a1[v7], &a2[v7]);
  return a1;
}

char *initializeWithTake for EnergySitePayload.CurrentRatePlan(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 32))(&a1[v5], &a2[v5]);
  return a1;
}

char *assignWithTake for EnergySitePayload.CurrentRatePlan(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 40))(&a1[v6], &a2[v6]);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergySitePayload.CurrentRatePlan()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24D25B9B0(char *a1, unsigned int a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    int v6 = -1;
    if (*(void *)a1 < 0x100000000uLL) {
      int v6 = *(void *)a1;
    }
    return (v6 + 1);
  }
  else
  {
    uint64_t v4 = sub_24D2908B8();
    if (a2 == *(_DWORD *)(*(void *)(v4 - 8) + 84)) {
      return (*(unsigned int (**)(char *, void, uint64_t))(*(void *)(v4 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v4);
    }
    else {
      __break(1u);
    }
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for EnergySitePayload.CurrentRatePlan()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_24D25BAFC(char *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = a2 - 1;
  }
  else
  {
    uint64_t result = (char *)sub_24D2908B8();
    if (a3 == *(_DWORD *)(*((void *)result - 1) + 84)) {
      return (char *)(*(uint64_t (**)(char *, void, void, char *))(*((void *)result - 1) + 56))(&v4[*(int *)(a4 + 20)], a2, a2, result);
    }
    else {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24D25BBF4()
{
  uint64_t v2 = sub_24D2908B8();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

unint64_t initializeBufferWithCopyOfBuffer for EnergySitePayload.CurrentRatePlan.RatePlan(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v16 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v16 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    swift_retain();
    *a1 = v11;
    return *a1 + ((v16 + 16) & ~(unint64_t)v16);
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = a2[1];
    swift_bridgeObjectRetain();
    a1[1] = v5;
    a1[2] = a2[2];
    uint64_t v6 = a2[3];
    swift_bridgeObjectRetain();
    a1[3] = v6;
    uint64_t v7 = a2[4];
    unint64_t v8 = a2[5];
    sub_24D229320(v7, v8);
    a1[4] = v7;
    a1[5] = v8;
    uint64_t v10 = (char *)a1 + *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + *(int *)(a3 + 28);
    uint64_t v3 = sub_24D2908B8();
    (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 16))(v10, v9);
    return (unint64_t)a1;
  }
}

uint64_t destroy for EnergySitePayload.CurrentRatePlan.RatePlan(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24D2293AC(*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v5 = *(int *)(a2 + 28);
  uint64_t v2 = sub_24D2908B8();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v5);
}

char *initializeWithCopy for EnergySitePayload.CurrentRatePlan.RatePlan(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v5 = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  *((void *)a1 + 1) = v5;
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v6 = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  *((void *)a1 + 3) = v6;
  uint64_t v7 = *((void *)a2 + 4);
  unint64_t v8 = *((void *)a2 + 5);
  sub_24D229320(v7, v8);
  *((void *)a1 + 4) = v7;
  *((void *)a1 + 5) = v8;
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 16))(&a1[v10], &a2[v10]);
  return a1;
}

char *assignWithCopy for EnergySitePayload.CurrentRatePlan.RatePlan(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v7 = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  *((void *)a1 + 1) = v7;
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v8 = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  *((void *)a1 + 3) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)a2 + 4);
  unint64_t v10 = *((void *)a2 + 5);
  sub_24D229320(v9, v10);
  uint64_t v3 = *((void *)a1 + 4);
  unint64_t v4 = *((void *)a1 + 5);
  *((void *)a1 + 4) = v9;
  *((void *)a1 + 5) = v10;
  sub_24D2293AC(v3, v4);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v5 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v5 - 8) + 24))(&a1[v12], &a2[v12]);
  return a1;
}

char *initializeWithTake for EnergySitePayload.CurrentRatePlan.RatePlan(char *a1, char *a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v3 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 32))(&a1[v5], &a2[v5]);
  return a1;
}

char *assignWithTake for EnergySitePayload.CurrentRatePlan.RatePlan(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRelease();
  uint64_t v3 = *((void *)a2 + 5);
  uint64_t v4 = *((void *)a1 + 4);
  unint64_t v5 = *((void *)a1 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v3;
  sub_24D2293AC(v4, v5);
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v6 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v6 - 8) + 40))(&a1[v9], &a2[v9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergySitePayload.CurrentRatePlan.RatePlan()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24D25C2BC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    int v6 = -1;
    if (*(void *)(a1 + 8) < 0x100000000uLL) {
      int v6 = *(void *)(a1 + 8);
    }
    return (v6 + 1);
  }
  else
  {
    uint64_t v4 = sub_24D2908B8();
    if (a2 == *(_DWORD *)(*(void *)(v4 - 8) + 84)) {
      return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v4);
    }
    else {
      __break(1u);
    }
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for EnergySitePayload.CurrentRatePlan.RatePlan()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24D25C408(uint64_t result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = a2 - 1;
  }
  else
  {
    uint64_t result = sub_24D2908B8();
    if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
      return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(v4 + *(int *)(a4 + 28), a2, a2, result);
    }
    else {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24D25C500()
{
  uint64_t v2 = sub_24D2908B8();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_24D25C5F4()
{
  return type metadata accessor for EnergySitePayload._StorageClass();
}

uint64_t sub_24D25C610()
{
  uint64_t updated = sub_24D25C894();
  if (v0 <= 0x3F)
  {
    uint64_t updated = sub_24D25C93C();
    if (v1 <= 0x3F)
    {
      uint64_t updated = swift_updateClassMetadata2();
      if (!updated) {
        return 0;
      }
    }
  }
  return updated;
}

uint64_t sub_24D25C894()
{
  uint64_t v4 = qword_26B18BB28;
  if (!qword_26B18BB28)
  {
    type metadata accessor for EnergySitePayload.CurrentRatePlan();
    unint64_t v3 = sub_24D290E08();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_26B18BB28);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_24D25C93C()
{
  uint64_t v4 = qword_26B18B8C0;
  if (!qword_26B18B8C0)
  {
    sub_24D290888();
    unint64_t v3 = sub_24D290E08();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_26B18B8C0);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_24D25C9E4()
{
  return sub_24D25C9FC();
}

unint64_t sub_24D25C9FC()
{
  uint64_t v2 = qword_26985E780[0];
  if (!qword_26985E780[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_26985E780);
    return WitnessTable;
  }
  return v2;
}

void *sub_24D25CA7C(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

uint64_t sub_24D25CAB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_24D2908B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v6 = *(int *)(type metadata accessor for EnergySitePayload() + 20);
  uint64_t v7 = *(void *)(a1 + v6);
  swift_retain();
  uint64_t result = a2;
  *(void *)(a2 + v6) = v7;
  return result;
}

uint64_t sub_24D25CB50(uint64_t a1)
{
  uint64_t v1 = sub_24D2908B8();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for EnergySitePayload();
  swift_release();
  return a1;
}

void *sub_24D25CBCC(const void *a1, void *a2)
{
  uint64_t v6 = sub_24D290888();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_24D25CCF4(uint64_t a1)
{
  uint64_t v8 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  uint64_t v9 = *(unsigned int (**)(void))(*(void *)(v8 - 8) + 48);
  if (!((unsigned int (*)(uint64_t, uint64_t))v9)(a1, 1))
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = a1 + *(int *)(v8 + 20);
    uint64_t v1 = sub_24D2908B8();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v6);
  }
  uint64_t v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D250) + 48);
  if (!v9())
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = v5 + *(int *)(v8 + 20);
    uint64_t v2 = sub_24D2908B8();
    (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(v4);
  }
  return a1;
}

uint64_t sub_24D25CE70(uint64_t a1)
{
  uint64_t v4 = sub_24D290888();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(void))(v5 + 48);
  if (!((unsigned int (*)(uint64_t, uint64_t))v6)(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v2 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D248) + 48);
  if (!v6()) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  }
  return a1;
}

uint64_t sub_24D25CFA4(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  *(_DWORD *)a2 = *(_DWORD *)a1;
  *(unsigned char *)(a2 + 4) = *(unsigned char *)(a1 + 4);
  return result;
}

unint64_t sub_24D25CFC0()
{
  uint64_t v2 = qword_26985D258;
  if (!qword_26985D258)
  {
    sub_24D290888();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D258);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25D044()
{
  uint64_t v2 = qword_26B18B8E0;
  if (!qword_26B18B8E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B18B8D8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18B8E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25D0C8()
{
  uint64_t v2 = qword_26985D260;
  if (!qword_26985D260)
  {
    sub_24D290888();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D260);
    return WitnessTable;
  }
  return v2;
}

uint64_t static UUID.from(data:)@<X0>(uint64_t a1@<X8>)
{
  if (sub_24D290508() == 16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985D268);
    return sub_24D2904B8();
  }
  else
  {
    uint64_t v2 = sub_24D2906A8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1);
  }
}

void sub_24D25D250(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v15 = a3;
  uint64_t v20 = a1;
  uint64_t v19 = a2;
  int v16 = "Fatal error";
  int v17 = "UnsafeBufferPointer with negative count";
  uint64_t v18 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  uint64_t v21 = sub_24D2906A8();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = v21 - 8;
  unint64_t v24 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v25 = (char *)&v4 - v24;
  uint64_t v27 = MEMORY[0x270FA5388](v20);
  uint64_t v28 = v3;
  if (v27)
  {
    uint64_t v14 = v20;
    uint64_t v12 = v20;
    uint64_t v13 = v20;
    if (v19) {
      uint64_t v9 = v19 - v13;
    }
    else {
      __break(1u);
    }
    uint64_t v8 = v9;
    if (v9 < 0)
    {
      sub_24D290ED8();
      __break(1u);
    }
    uint64_t v10 = v12;
    uint64_t v11 = v8;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v7 = sub_24D290B68();
  if (v7)
  {
    uint64_t v6 = v7;
    uint64_t v4 = v7;
    uint64_t v26 = v7;
    sub_24D260230();
    id v5 = sub_24D25D558(v4);
    sub_24D290668();
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v15, v25, v21);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v15, 0, 1, v21);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56))(v15, 1, 1, v21);
  }
}

id sub_24D25D558(uint64_t a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_24D25FEEC(a1);
}

uint64_t UUID.init(string:namespace:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v15 = a5;
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  int v16 = "Fatal error";
  int v17 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v18 = "EnergyKitFoundation/UUID.swift";
  uint64_t v43 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v19 = 0;
  uint64_t v37 = sub_24D290BB8();
  uint64_t v33 = *(void *)(v37 - 8);
  uint64_t v34 = v37 - 8;
  unint64_t v20 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v35 = (char *)&v12 - v20;
  uint64_t v23 = sub_24D2906A8();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = v23 - 8;
  uint64_t v27 = *(void *)(v24 + 64);
  unint64_t v26 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v31);
  uint64_t v28 = (uint64_t)&v12 - v26;
  unint64_t v29 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  unint64_t v30 = (char *)&v12 - v29;
  uint64_t v43 = (char *)&v12 - v29;
  uint64_t v41 = v6;
  uint64_t v42 = v7;
  uint64_t v39 = v8;
  uint64_t v40 = v9;
  sub_24D290BA8();
  sub_24D2299E0();
  uint64_t v36 = sub_24D290B98();
  unint64_t v38 = v10;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v37);
  if ((v38 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_24D290EB8();
    __break(1u);
  }
  else
  {
    uint64_t v13 = v36;
    unint64_t v14 = v38;
  }
  UUID.init(data:namespace:)(v13, v14, v21, v22, v28);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(v30, v28, v23);
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 16))(v15, v30, v23);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v30, v23);
}

uint64_t UUID.init(data:namespace:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v19 = a5;
  uint64_t v26 = a1;
  unint64_t v25 = a2;
  uint64_t v36 = a3;
  uint64_t v37 = a4;
  unint64_t v20 = "Fatal error";
  uint64_t v21 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v22 = "EnergyKitFoundation/UUID.swift";
  uint64_t v48 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v23 = 0;
  uint64_t v42 = sub_24D290BB8();
  uint64_t v38 = *(void *)(v42 - 8);
  uint64_t v39 = v42 - 8;
  unint64_t v24 = (*(void *)(v38 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v40 = (char *)&v17 - v24;
  uint64_t v27 = sub_24D2906A8();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = v27 - 8;
  unint64_t v30 = (*(void *)(v28 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v26);
  uint64_t v31 = (uint64_t)&v17 - v30;
  unint64_t v32 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v33 = (char *)&v17 - v32;
  uint64_t v48 = (char *)&v17 - v32;
  uint64_t v46 = v7;
  uint64_t v47 = v8;
  uint64_t v44 = v9;
  uint64_t v45 = v10;
  uint64_t v34 = sub_24D290FA8();
  uint64_t v35 = v11;
  sub_24D290BA8();
  sub_24D2299E0();
  uint64_t v41 = sub_24D290B98();
  uint64_t v43 = v12;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v42);
  if ((v43 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_24D290EB8();
    __break(1u);
  }
  else
  {
    uint64_t v17 = v41;
    uint64_t v18 = v43;
  }
  uint64_t v13 = v34;
  unint64_t v14 = v35;
  uint64_t v15 = v18;
  *uint64_t v35 = v17;
  v14[1] = v15;
  sub_24D22AD58();
  UUID.init(data:salts:)(v26, v25, v13, v31);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v33, v31, v27);
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 16))(v19, v33, v27);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v33, v27);
}

uint64_t UUID.init(uuid:namespace:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v17 = a4;
  uint64_t v20 = a1;
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v22 = sub_24D2906A8();
  uint64_t v18 = *(void *)(v22 - 8);
  uint64_t v19 = v22 - 8;
  unint64_t v12 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22);
  uint64_t v16 = (uint64_t)&v11 - v12;
  unint64_t v13 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v11 - v12);
  uint64_t v21 = (char *)&v11 - v13;
  uint64_t v28 = (char *)&v11 - v13;
  uint64_t v27 = a1;
  uint64_t v25 = v6;
  uint64_t v26 = v7;
  uint64_t v8 = UUID.data.getter();
  UUID.init(data:namespace:)(v8, v9, v14, v15, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v21, v16, v22);
  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 16))(v17, v21, v22);
  unint64_t v24 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  uint64_t v23 = v18 + 8;
  v24(v20, v22);
  return ((uint64_t (*)(char *, uint64_t))v24)(v21, v22);
}

uint64_t UUID.data.getter()
{
  uint64_t v10 = (uint64_t (*)(uint64_t))sub_24D25FDB8;
  uint64_t v20 = 0;
  uint64_t v7 = sub_24D2906A8();
  uint64_t v5 = *(void *)(v7 - 8);
  uint64_t v6 = v7 - 8;
  unint64_t v4 = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)&v4 - v4;
  uint64_t v20 = v0;
  uint64_t v17 = sub_24D290688();
  uint64_t v18 = v1;
  unint64_t v13 = v16;
  v16[0] = v17;
  v16[1] = v1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, v8, v7);
  uint64_t v11 = &v14;
  uint64_t v15 = v9;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B3A8);
  sub_24D25FDE4((uint64_t)v13, v10, (uint64_t)v11, v2, MEMORY[0x263F8E628], MEMORY[0x263F06F78], MEMORY[0x263F8E658], v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v7);
  return v19;
}

uint64_t UUID.init(uuid:namespace:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v19 = a3;
  uint64_t v23 = a1;
  uint64_t v22 = a2;
  unint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v25 = sub_24D2906A8();
  uint64_t v20 = *(void *)(v25 - 8);
  uint64_t v21 = v25 - 8;
  unint64_t v10 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25);
  uint64_t v14 = (uint64_t)&v9 - v10;
  unint64_t v11 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v9 - v10);
  uint64_t v16 = (uint64_t)&v9 - v11;
  unint64_t v12 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v9 - v11);
  unint64_t v24 = (char *)&v9 - v12;
  unint64_t v30 = (char *)&v9 - v12;
  uint64_t v29 = a1;
  uint64_t v28 = v6;
  uint64_t v15 = UUID.data.getter();
  unint64_t v13 = v7;
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  uint64_t v17 = v20 + 16;
  v18(v14, v22, v25);
  UUID.init(data:namespace:)(v15, v13, v14, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(v24, v16, v25);
  v18(v19, (uint64_t)v24, v25);
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  uint64_t v26 = v20 + 8;
  v27(v22, v25);
  v27(v23, v25);
  return ((uint64_t (*)(char *, uint64_t))v27)(v24, v25);
}

uint64_t UUID.init(data:namespace:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v22 = a1;
  unint64_t v21 = a2;
  uint64_t v27 = a3;
  uint64_t v35 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v32 = 0;
  uint64_t v29 = sub_24D2906A8();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  unint64_t v16 = (*(void *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v22);
  uint64_t v23 = (uint64_t)&v16 - v16;
  unint64_t v17 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v28 = (char *)&v16 - v17;
  uint64_t v35 = (char *)&v16 - v17;
  uint64_t v33 = v7;
  uint64_t v34 = v8;
  uint64_t v32 = a3;
  uint64_t v20 = MEMORY[0x263F06F78];
  uint64_t v19 = sub_24D290FA8();
  uint64_t v18 = v9;
  uint64_t v10 = UUID.data.getter();
  unint64_t v11 = v18;
  uint64_t v12 = v10;
  uint64_t v13 = v19;
  uint64_t *v18 = v12;
  v11[1] = v14;
  sub_24D22AD58();
  UUID.init(data:salts:)(v22, v21, v13, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 32))(v28, v23, v29);
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v24, v28, v29);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  uint64_t v30 = v25 + 8;
  v31(v27, v29);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v29);
}

uint64_t UUID.init(data:salts:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v48 = a4;
  uint64_t v73 = a1;
  unint64_t v74 = a2;
  uint64_t v65 = a3;
  uint64_t v49 = "Precondition failed";
  unint64_t v50 = "EnergyKitFoundation/UUID.swift";
  uint64_t v51 = "Assertion failed";
  uint64_t v57 = 0;
  uint64_t v52 = (uint64_t (*)(uint64_t))sub_24D260154;
  int v104 = 0;
  int v103 = 0;
  uint64_t v101 = 0;
  unint64_t v102 = 0;
  uint64_t v100 = 0;
  uint64_t v95 = 0;
  uint64_t v96 = 0;
  uint64_t v86 = 0;
  unint64_t v87 = 0;
  uint64_t v53 = 0;
  uint64_t v81 = 0;
  unint64_t v82 = 0;
  uint64_t v54 = sub_24D290AE8();
  unint64_t v55 = (*(void *)(*(void *)(v54 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v56 = (char *)&v22 - v55;
  uint64_t v58 = sub_24D290B18();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = v58 - 8;
  unint64_t v61 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v57);
  uint64_t v62 = (char *)&v22 - v61;
  unint64_t v63 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v64 = (char *)&v22 - v63;
  int v104 = (char *)&v22 - v63;
  uint64_t v66 = sub_24D2906A8();
  uint64_t v67 = *(void *)(v66 - 8);
  uint64_t v68 = v66 - 8;
  unint64_t v69 = (*(void *)(v67 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v73);
  uint64_t v70 = (char *)&v22 - v69;
  unint64_t v71 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v72 = (char *)&v22 - v71;
  int v103 = (char *)&v22 - v71;
  uint64_t v101 = v8;
  unint64_t v102 = v9;
  uint64_t v100 = v10;
  sub_24D229320(v8, v9);
  sub_24D229320(v73, v74);
  uint64_t v76 = v99;
  v99[0] = v73;
  v99[1] = v74;
  unint64_t v75 = sub_24D25A8E4();
  int v77 = sub_24D290D58();
  sub_24D24BF84((uint64_t)v76);
  if (v77)
  {
    sub_24D25FF14();
    uint64_t v20 = 73;
    int v21 = 0;
    sub_24D290EC8();
    __break(1u);
  }
  sub_24D2293AC(v73, v74);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v46 = &v98;
  uint64_t v98 = v65;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B390);
  unint64_t v45 = sub_24D25FF4C();
  int v47 = sub_24D290D58();
  sub_24D230030();
  if (v47)
  {
    sub_24D25FF14();
    uint64_t v20 = 74;
    int v21 = 0;
    sub_24D290EC8();
    __break(1u);
  }
  swift_bridgeObjectRelease();
  sub_24D290B08();
  uint64_t v41 = v97;
  v97[0] = v73;
  v97[1] = v74;
  unint64_t v40 = sub_24D25FFD0();
  unint64_t v42 = sub_24D260054();
  sub_24D290AD8();
  swift_bridgeObjectRetain();
  uint64_t v94 = v65;
  sub_24D290D68();
  for (uint64_t i = v53; ; uint64_t i = v37)
  {
    uint64_t v37 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B3A0);
    sub_24D290EA8();
    uint64_t v38 = v92;
    unint64_t v39 = v93;
    if ((v93 & 0xF000000000000000) == 0xF000000000000000) {
      break;
    }
    uint64_t v35 = v38;
    unint64_t v36 = v39;
    unint64_t v26 = v39;
    uint64_t v25 = v38;
    uint64_t v81 = v38;
    unint64_t v82 = v39;
    sub_24D229320(v38, v39);
    sub_24D229320(v25, v26);
    uint64_t v27 = v80;
    v80[0] = v25;
    v80[1] = v26;
    int v28 = sub_24D290D58();
    sub_24D24BF84((uint64_t)v27);
    if (v28)
    {
      sub_24D25FF14();
      uint64_t v20 = 84;
      int v21 = 0;
      sub_24D290EC8();
      __break(1u);
    }
    sub_24D2293AC(v25, v26);
    uint64_t v78 = v25;
    unint64_t v79 = v26;
    sub_24D290AD8();
    sub_24D2293AC(v25, v26);
  }
  sub_24D230030();
  sub_24D290698();
  uint64_t v11 = sub_24D290688();
  uint64_t v12 = v62;
  uint64_t v88 = v11;
  uint64_t v89 = v13;
  uint64_t v90 = v11;
  uint64_t v91 = v13;
  uint64_t v29 = *(void (**)(char *, uint64_t))(v67 + 8);
  uint64_t v30 = v67 + 8;
  v29(v70, v66);
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v12, v64, v58);
  sub_24D290AF8();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v59 + 8);
  uint64_t v32 = v59 + 8;
  v31(v62, v58);
  sub_24D2600D0();
  uint64_t v33 = sub_24D290528();
  unint64_t v34 = v14;
  uint64_t v86 = v33;
  unint64_t v87 = v14;
  sub_24D229320(v33, v14);
  if (sub_24D290508() <= 16)
  {
    sub_24D25FF14();
    uint64_t v20 = 91;
    int v21 = 0;
    sub_24D290EC8();
    __break(1u);
  }
  uint64_t v15 = v37;
  sub_24D2293AC(v33, v34);
  sub_24D229320(v33, v34);
  uint64_t v22 = (uint64_t)&v22;
  MEMORY[0x270FA5388](&v22);
  unint64_t v16 = &v22 - 4;
  uint64_t v23 = &v22 - 4;
  void v16[2] = v33;
  v16[3] = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B3A8);
  uint64_t result = sub_24D25FC38((uint64_t)&v90, v52, (uint64_t)v23, v18, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], v24);
  if (v15)
  {
    __break(1u);
  }
  else
  {
    sub_24D2293AC(v33, v34);
    BYTE6(v90) &= 0xFu;
    char v84 = 0;
    char v85 = 80;
    BYTE6(v90) |= 0x50u;
    LOBYTE(v91) = v91 & 0x3F;
    __int16 v83 = 0x8000;
    LOBYTE(v91) = v91 | 0x80;
    uint64_t v20 = v91;
    sub_24D290678();
    (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v72, v70, v66);
    sub_24D2293AC(v33, v34);
    v31(v64, v58);
    (*(void (**)(uint64_t, char *, uint64_t))(v67 + 16))(v48, v72, v66);
    swift_bridgeObjectRelease();
    sub_24D2293AC(v73, v74);
    return ((uint64_t (*)(char *, uint64_t))v29)(v72, v66);
  }
  return result;
}

uint64_t UUID.init(string:namespace:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = a4;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v26 = a3;
  int v21 = "Fatal error";
  uint64_t v22 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v23 = "EnergyKitFoundation/UUID.swift";
  uint64_t v48 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v45 = 0;
  uint64_t v24 = 0;
  uint64_t v43 = sub_24D290BB8();
  uint64_t v39 = *(void *)(v43 - 8);
  uint64_t v40 = v43 - 8;
  unint64_t v25 = (*(void *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v41 = (char *)&v11 - v25;
  uint64_t v27 = sub_24D2906A8();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = v27 - 8;
  uint64_t v33 = *(void *)(v28 + 64);
  unint64_t v30 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v37);
  uint64_t v31 = (uint64_t)&v11 - v30;
  unint64_t v32 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v34 = (uint64_t)&v11 - v32;
  unint64_t v35 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  unint64_t v36 = (char *)&v11 - v35;
  uint64_t v48 = (char *)&v11 - v35;
  uint64_t v46 = v6;
  uint64_t v47 = v7;
  uint64_t v45 = v8;
  sub_24D290BA8();
  sub_24D2299E0();
  uint64_t v42 = sub_24D290B98();
  unint64_t v44 = v9;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v43);
  if ((v44 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_24D290EB8();
    __break(1u);
  }
  else
  {
    uint64_t v18 = v42;
    unint64_t v19 = v44;
  }
  unint64_t v12 = v19;
  uint64_t v13 = v18;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16);
  uint64_t v14 = v28 + 16;
  v15(v31, v26, v27);
  UUID.init(data:namespace:)(v13, v12, v31, v34);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v36, v34, v27);
  v15(v20, (uint64_t)v36, v27);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
  uint64_t v16 = v28 + 8;
  v17(v26, v27);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v17)(v36, v27);
}

char *sub_24D25F564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v15 = a2;
  unint64_t v16 = a3;
  sub_24D229320(a2, a3);
  uint64_t v13 = a2;
  unint64_t v14 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B3A8);
  uint64_t result = sub_24D25F750(MEMORY[0x263F8E778], 16, (uint64_t (*)(uint64_t, char *))sub_24D260184, (uint64_t)v12, a1, v5, MEMORY[0x263F8E778], MEMORY[0x263F8E628], a4, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], v4);
  if (!v11) {
    return (char *)sub_24D2293AC(a2, a3);
  }
  __break(1u);
  return result;
}

uint64_t sub_24D25F680(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return swift_bridgeObjectRelease();
}

char *sub_24D25F750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, char *)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v21 = a9;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v25 = a5;
  uint64_t v26 = a6;
  uint64_t v27 = a8;
  uint64_t v29 = a12;
  unint64_t v30 = "Fatal error";
  uint64_t v31 = "Division results in an overflow in remainder operation";
  unint64_t v32 = "Swift/IntegerTypes.swift";
  uint64_t v33 = "Division by zero in remainder operation";
  uint64_t v34 = "self must be a properly aligned pointer for types Pointee and T";
  unint64_t v35 = "Swift/UnsafePointer.swift";
  uint64_t v46 = a6;
  uint64_t v45 = a7;
  uint64_t v44 = a8;
  uint64_t v43 = a10;
  uint64_t v36 = *(void *)(a8 - 8);
  uint64_t v37 = a8 - 8;
  unint64_t v38 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1);
  uint64_t result = (char *)&v17 - v38;
  uint64_t v39 = (char *)&v17 - v38;
  uint64_t v40 = *(void *)(v13 - 8);
  uint64_t v41 = v13 - 8;
  uint64_t v14 = *(unsigned __int8 *)(v40 + 80) + 1;
  uint64_t v42 = *(unsigned __int8 *)(v40 + 80);
  if (__OFSUB__(v14, 1))
  {
    __break(1u);
    return result;
  }
  if ((v25 & v42) == 0)
  {
    if (v22 == 1) {
      goto LABEL_23;
    }
    uint64_t v19 = *(void *)(*(void *)(v26 - 8) + 72);
    uint64_t v20 = *(void *)(v40 + 72);
    if (v20 >= v19)
    {
      if (v19)
      {
        if (v20 != 0x8000000000000000 || v19 != -1)
        {
          BOOL v18 = v20 % v19 == 0;
          goto LABEL_18;
        }
        sub_24D290EB8();
        __break(1u);
      }
      sub_24D290EB8();
      __break(1u);
    }
    if (v20)
    {
      if (v19 != 0x8000000000000000 || v20 != -1)
      {
        BOOL v18 = v19 % v20 == 0;
LABEL_18:
        if (v18) {
          goto LABEL_23;
        }
        goto LABEL_19;
      }
      sub_24D290EB8();
      __break(1u);
    }
    sub_24D290EB8();
    __break(1u);
    goto LABEL_23;
  }
LABEL_19:
  sub_24D290ED8();
  __break(1u);
LABEL_23:
  uint64_t v16 = v28;
  uint64_t result = (char *)v23(v25, v39);
  uint64_t v17 = v16;
  if (v16) {
    return (char *)(*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v29, v39, v27);
  }
  return result;
}

uint64_t sub_24D25FC38(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v12 = a5;
  uint64_t v13 = a8;
  uint64_t v22 = a4;
  uint64_t v21 = a5;
  uint64_t v20 = a6;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = a5 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388]();
  BOOL v18 = (char *)&v11 - v16;
  uint64_t result = v17(v9);
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v18, v12);
  }
  return result;
}

uint64_t sub_24D25FD40@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24D290688();
  uint64_t result = MEMORY[0x253322CF0](a1, 16);
  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t sub_24D25FDB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24D25FD40(a1, a2);
}

uint64_t sub_24D25FDE4(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v12 = a5;
  uint64_t v13 = a8;
  uint64_t v22 = a4;
  uint64_t v21 = a5;
  uint64_t v20 = a6;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = a5 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388]();
  BOOL v18 = (char *)&v11 - v16;
  uint64_t result = v17(v9);
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v18, v12);
  }
  return result;
}

id sub_24D25FEEC(uint64_t a1)
{
  return objc_msgSend(v1, sel_initWithUUIDBytes_, a1);
}

uint64_t sub_24D25FF14()
{
  return 0;
}

unint64_t sub_24D25FF4C()
{
  uint64_t v2 = qword_26B18B398;
  if (!qword_26B18B398)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B18B390);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18B398);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D25FFD0()
{
  uint64_t v2 = qword_26B18B378;
  if (!qword_26B18B378)
  {
    sub_24D290B18();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18B378);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D260054()
{
  uint64_t v2 = qword_26B18B368;
  if (!qword_26B18B368)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18B368);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D2600D0()
{
  uint64_t v2 = qword_26B18B370;
  if (!qword_26B18B370)
  {
    sub_24D290AE8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18B370);
    return WitnessTable;
  }
  return v2;
}

char *sub_24D260154@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24D25F564(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_24D260184(uint64_t a1)
{
  return sub_24D25F680(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_24D2601B4()
{
  uint64_t v2 = qword_26B18B360;
  if (!qword_26B18B360)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18B360);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D260230()
{
  uint64_t v2 = qword_26985D270;
  if (!qword_26985D270)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26985D270);
    return ObjCClassMetadata;
  }
  return v2;
}

id UsageSummaryRecords.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id UsageSummaryRecords.init(entity:insertInto:)(void *a1, void *a2)
{
  id v10 = 0;
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for UsageSummaryRecords();
  id v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  id v2 = v6;
  id v10 = v6;

  return v6;
}

uint64_t type metadata accessor for UsageSummaryRecords()
{
  return self;
}

id UsageSummaryRecords.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UsageSummaryRecords();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id EnergyWindowNotifications.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id EnergyWindowNotifications.init(entity:insertInto:)(void *a1, void *a2)
{
  id v10 = 0;
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for EnergyWindowNotifications();
  id v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  id v2 = v6;
  id v10 = v6;

  return v6;
}

uint64_t type metadata accessor for EnergyWindowNotifications()
{
  return self;
}

id EnergyWindowNotifications.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EnergyWindowNotifications();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static IntervalBlocks.fetchRequest()()
{
  return sub_24D228DBC();
}

void sub_24D260688(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_meterID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D260700(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setMeterID_);

  return swift_bridgeObjectRelease();
}

void sub_24D260794(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_start);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D2608A0(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setStart_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D2609D8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_end);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D260AE4(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setEnd_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D260C1C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_sourceTime);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D260D28(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setSourceTime_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D260E60(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_usagePointID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D260ED8(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setUsagePointID_);

  return swift_bridgeObjectRelease();
}

void sub_24D260F6C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_creationDate);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D261078(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setCreationDate_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D2611B0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_readings);
  *a2 = sub_24D2904E8();
  a2[1] = v3;
}

uint64_t sub_24D261228(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v9);
  uint64_t v7 = v9[0];
  unint64_t v8 = v9[1];
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D2904C8();
  objc_msgSend(v5, sel_setReadings_);

  return sub_24D2293AC(v7, v8);
}

void sub_24D2612C0(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  objc_msgSend(v3, sel_preprocessed);
  *a2 = sub_24D290868() & 1;
}

void sub_24D261334(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setPreprocessed_, sub_24D290858() & 1);
}

uint64_t IntervalBlocks.unitAsInt.getter()
{
  objc_msgSend(v0, sel_unit);
  sub_24D22D584();
  sub_24D22D600();
  sub_24D22D67C();
  sub_24D290CA8();
  return v2;
}

void sub_24D261430(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = IntervalBlocks.unitAsInt.getter();
}

void sub_24D26148C(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  IntervalBlocks.unitAsInt.setter();
}

id IntervalBlocks.unitAsInt.setter()
{
  sub_24D22D844();
  sub_24D22D8C0();
  sub_24D22D93C();
  sub_24D290CA8();
  return objc_msgSend(v1, sel_setUnit_, v2);
}

id (*IntervalBlocks.unitAsInt.modify(uint64_t *a1))()
{
  a1[1] = v1;
  *a1 = IntervalBlocks.unitAsInt.getter();
  return sub_24D2615D8;
}

id sub_24D2615D8()
{
  return IntervalBlocks.unitAsInt.setter();
}

uint64_t IntervalBlocks.flowDirectionAsInt.getter()
{
  objc_msgSend(v0, sel_flowDirection);
  sub_24D22D584();
  sub_24D22D600();
  sub_24D22D67C();
  sub_24D290CA8();
  return v2;
}

void sub_24D2616C0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = IntervalBlocks.flowDirectionAsInt.getter();
}

void sub_24D26171C(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  IntervalBlocks.flowDirectionAsInt.setter();
}

id IntervalBlocks.flowDirectionAsInt.setter()
{
  sub_24D22D844();
  sub_24D22D8C0();
  sub_24D22D93C();
  sub_24D290CA8();
  return objc_msgSend(v1, sel_setFlowDirection_, v2);
}

id (*IntervalBlocks.flowDirectionAsInt.modify(uint64_t *a1))()
{
  a1[1] = v1;
  *a1 = IntervalBlocks.flowDirectionAsInt.getter();
  return sub_24D261868;
}

id sub_24D261868()
{
  return IntervalBlocks.flowDirectionAsInt.setter();
}

uint64_t IntervalBlocks.commodityAsInt.getter()
{
  objc_msgSend(v0, sel_commodity);
  sub_24D22D584();
  sub_24D22D600();
  sub_24D22D67C();
  sub_24D290CA8();
  return v2;
}

void sub_24D261950(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = IntervalBlocks.commodityAsInt.getter();
}

void sub_24D2619AC(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  IntervalBlocks.commodityAsInt.setter();
}

id IntervalBlocks.commodityAsInt.setter()
{
  sub_24D22D844();
  sub_24D22D8C0();
  sub_24D22D93C();
  sub_24D290CA8();
  return objc_msgSend(v1, sel_setCommodity_, v2);
}

id (*IntervalBlocks.commodityAsInt.modify(uint64_t *a1))()
{
  a1[1] = v1;
  *a1 = IntervalBlocks.commodityAsInt.getter();
  return sub_24D261AF8;
}

id sub_24D261AF8()
{
  return IntervalBlocks.commodityAsInt.setter();
}

char *keypath_get_selector_meterID()
{
  return sel_meterID;
}

char *keypath_get_selector_usagePointID()
{
  return sel_usagePointID;
}

char *keypath_get_selector_readings()
{
  return sel_readings;
}

char *keypath_get_selector_preprocessed()
{
  return sel_preprocessed;
}

id static LocalLoadEvents.fetchRequest()()
{
  return sub_24D228DBC();
}

char *keypath_get_selector_data()
{
  return sel_data;
}

void sub_24D261C04(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_data);
  *a2 = sub_24D2904E8();
  a2[1] = v3;
}

uint64_t sub_24D261C7C(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v9);
  uint64_t v7 = v9[0];
  unint64_t v8 = v9[1];
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D2904C8();
  objc_msgSend(v5, sel_setData_);

  return sub_24D2293AC(v7, v8);
}

char *keypath_get_selector_deviceID()
{
  return sel_deviceID;
}

void sub_24D261D20(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_deviceID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D261D98(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setDeviceID_);

  return swift_bridgeObjectRelease();
}

char *keypath_get_selector_donorID()
{
  return sel_donorID;
}

void sub_24D261E38(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_donorID);
  *a2 = sub_24D290B88();
  a2[1] = v3;
}

uint64_t sub_24D261EB0(void *a1, id *a2)
{
  sub_24D229294(a1, &v7);
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D290B78();
  objc_msgSend(v5, sel_setDonorID_);

  return swift_bridgeObjectRelease();
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_24D261F50(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D2906A8();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_identifier);
  sub_24D290668();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D26205C(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D2906A8();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D290658();
  objc_msgSend(v9, sel_setIdentifier_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

char *keypath_get_selector_timestamp()
{
  return sel_timestamp;
}

void sub_24D2621A0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_timestamp);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D2622AC(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setTimestamp_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D2623E4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D2906A8();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_siteID);
  sub_24D290668();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D2624F0(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D2906A8();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D290658();
  objc_msgSend(v9, sel_setSiteID_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

id EnergyWindowsTracker.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id EnergyWindowsTracker.init(entity:insertInto:)(void *a1, void *a2)
{
  id v10 = 0;
  id v9 = a1;
  id v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for EnergyWindowsTracker();
  id v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  id v2 = v6;
  id v10 = v6;

  return v6;
}

uint64_t type metadata accessor for EnergyWindowsTracker()
{
  return self;
}

id EnergyWindowsTracker.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EnergyWindowsTracker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t EKDateRange.start.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_24D290638();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v1 - 8) + 16))(a1);
}

uint64_t EKDateRange.end.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(int *)(type metadata accessor for EKDateRange() + 20);
  uint64_t v2 = sub_24D290638();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t type metadata accessor for EKDateRange()
{
  uint64_t v1 = qword_26985E910;
  if (!qword_26985E910) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t EKDateRange.init(start:end:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v86 = a3;
  uint64_t v109 = a1;
  uint64_t v108 = a2;
  uint64_t v100 = 0;
  unint64_t v87 = sub_24D2639D0;
  uint64_t v88 = sub_24D2639D0;
  uint64_t v89 = sub_24D2641E8;
  uint64_t v90 = sub_24D265504;
  uint64_t v91 = sub_24D2641E8;
  uint64_t v92 = sub_24D265504;
  unint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  uint64_t v94 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  uint64_t v95 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  uint64_t v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  uint64_t v97 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  uint64_t v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  unint64_t v122 = 0;
  uint64_t v121 = 0;
  uint64_t v120 = 0;
  uint64_t v99 = 0;
  uint64_t v101 = sub_24D290638();
  int v103 = *(void **)(v101 - 8);
  uint64_t v102 = v101 - 8;
  int v104 = v103;
  uint64_t v105 = v103[8];
  unint64_t v106 = (v105 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  int v107 = (char *)v33 - v106;
  uint64_t v110 = type metadata accessor for EKDateRange();
  unint64_t v111 = (*(void *)(*(void *)(v110 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v109);
  uint64_t v112 = (uint64_t)v33 - v111;
  unint64_t v122 = (char *)v33 - v111;
  uint64_t v121 = v3;
  uint64_t v120 = v4;
  if (sub_24D2905B8())
  {
    int v85 = sub_24D290D78();
    uint64_t v52 = v104;
    uint64_t v56 = (void (*)(char *, uint64_t, uint64_t))v103[2];
    unint64_t v55 = v103 + 2;
    v56(v107, v109, v101);
    uint64_t v57 = *((unsigned int *)v52 + 20);
    unint64_t v53 = (v57 + 16) & ~(unint64_t)v57;
    uint64_t v72 = 7;
    uint64_t v54 = swift_allocObject();
    uint64_t v60 = (void (*)(unint64_t, char *, uint64_t))v103[4];
    uint64_t v59 = v103 + 4;
    v60(v54 + v53, v107, v101);
    swift_retain();
    uint64_t v71 = 32;
    uint64_t v5 = swift_allocObject();
    uint64_t v6 = v54;
    uint64_t v66 = v5;
    *(void *)(v5 + 16) = v87;
    *(void *)(v5 + 24) = v6;
    swift_release();
    v56(v107, v108, v101);
    unint64_t v58 = (v57 + 16) & ~(unint64_t)v57;
    uint64_t v61 = swift_allocObject();
    v60(v61 + v58, v107, v101);
    swift_retain();
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = v61;
    uint64_t v73 = v7;
    *(void *)(v7 + 16) = v88;
    *(void *)(v7 + 24) = v8;
    swift_release();
    sub_24D2643D4();
    char v84 = sub_24D290DB8();
    uint64_t v64 = &v118;
    uint64_t v118 = 22;
    unint64_t v62 = sub_24D26443C();
    unint64_t v63 = sub_24D2644B8();
    sub_24D22D93C();
    sub_24D290C68();
    uint32_t v65 = v119;
    uint64_t v69 = 17;
    uint64_t v75 = swift_allocObject();
    int v68 = 32;
    *(unsigned char *)(v75 + 16) = 32;
    uint64_t v76 = swift_allocObject();
    int v70 = 8;
    *(unsigned char *)(v76 + 16) = 8;
    uint64_t v9 = swift_allocObject();
    uint64_t v10 = v66;
    uint64_t v67 = v9;
    *(void *)(v9 + 16) = v89;
    *(void *)(v9 + 24) = v10;
    uint64_t v11 = swift_allocObject();
    uint64_t v12 = v67;
    uint64_t v77 = v11;
    *(void *)(v11 + 16) = v90;
    *(void *)(v11 + 24) = v12;
    uint64_t v78 = swift_allocObject();
    *(unsigned char *)(v78 + 16) = v68;
    uint64_t v79 = swift_allocObject();
    *(unsigned char *)(v79 + 16) = v70;
    uint64_t v13 = swift_allocObject();
    uint64_t v14 = v73;
    uint64_t v74 = v13;
    *(void *)(v13 + 16) = v91;
    *(void *)(v13 + 24) = v14;
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = v74;
    uint64_t v81 = v15;
    *(void *)(v15 + 16) = v92;
    *(void *)(v15 + 24) = v16;
    uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
    uint64_t v80 = sub_24D290FA8();
    unint64_t v82 = v17;
    swift_retain();
    uint64_t v18 = v75;
    uint64_t v19 = v82;
    *unint64_t v82 = v93;
    v19[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
    swift_retain();
    uint64_t v20 = v76;
    uint64_t v21 = v82;
    v82[2] = v94;
    v21[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
    swift_retain();
    uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v77;
    uint64_t v23 = v82;
    v82[4] = v95;
    v23[5] = v22;
    swift_retain();
    uint64_t v24 = v78;
    uint64_t v25 = v82;
    v82[6] = v96;
    v25[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v24;
    swift_retain();
    uint64_t v26 = v79;
    uint64_t v27 = v82;
    v82[8] = v97;
    v27[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v26;
    swift_retain();
    uint64_t v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v81;
    uint64_t v29 = v82;
    v82[10] = v98;
    v29[11] = v28;
    sub_24D22AD58();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v84, (os_log_type_t)v85))
    {
      uint64_t v30 = v99;
      uint64_t v44 = (uint8_t *)sub_24D290DF8();
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
      uint64_t v45 = sub_24D263F98(0);
      uint64_t v46 = sub_24D263F98(2);
      uint64_t v48 = &v117;
      int v117 = v44;
      uint64_t v49 = &v116;
      uint64_t v116 = v45;
      unint64_t v50 = &v115;
      uint64_t v115 = v46;
      unsigned int v47 = 2;
      sub_24D263FF4(2, &v117);
      sub_24D263FF4(v47, v48);
      uint64_t v113 = v93;
      uint64_t v114 = v75;
      sub_24D264008(&v113, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50);
      uint64_t v51 = v30;
      if (v30)
      {
        __break(1u);
      }
      else
      {
        uint64_t v113 = v94;
        uint64_t v114 = v76;
        sub_24D264008(&v113, (uint64_t)&v117, (uint64_t)&v116, (uint64_t)&v115);
        uint64_t v42 = 0;
        uint64_t v31 = v42;
        uint64_t v113 = v95;
        uint64_t v114 = v77;
        sub_24D264008(&v113, (uint64_t)&v117, (uint64_t)&v116, (uint64_t)&v115);
        uint64_t v41 = v31;
        uint64_t v113 = v96;
        uint64_t v114 = v78;
        sub_24D264008(&v113, (uint64_t)&v117, (uint64_t)&v116, (uint64_t)&v115);
        uint64_t v40 = 0;
        uint64_t v113 = v97;
        uint64_t v114 = v79;
        sub_24D264008(&v113, (uint64_t)&v117, (uint64_t)&v116, (uint64_t)&v115);
        uint64_t v39 = 0;
        uint64_t v113 = v98;
        uint64_t v114 = v81;
        sub_24D264008(&v113, (uint64_t)&v117, (uint64_t)&v116, (uint64_t)&v115);
        _os_log_impl(&dword_24D227000, v84, (os_log_type_t)v85, "EKDateRange ERROR start > end for start: %s end: %s) ", v44, v65);
        sub_24D264054(v45);
        sub_24D264054(v46);
        sub_24D290DC8();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
  }
  uint64_t v34 = (void (*)(char *, uint64_t, uint64_t))v103[2];
  v33[1] = v103 + 2;
  v34(v107, v109, v101);
  uint64_t v36 = (void (*)(uint64_t, char *, uint64_t))v103[4];
  unint64_t v35 = v103 + 4;
  v36(v112, v107, v101);
  v34(v107, v108, v101);
  v36(v112 + *(int *)(v110 + 20), v107, v101);
  sub_24D26375C(v112, v86);
  unint64_t v38 = (void (*)(uint64_t, uint64_t))v103[1];
  uint64_t v37 = v103 + 1;
  v38(v108, v101);
  v38(v109, v101);
  return sub_24D263808(v112);
}

uint64_t sub_24D26375C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D290638();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  v6(a2, a1);
  uint64_t v2 = type metadata accessor for EKDateRange();
  ((void (*)(uint64_t, uint64_t, uint64_t))v6)(a2 + *(int *)(v2 + 20), a1 + *(int *)(v2 + 20), v5);
  return a2;
}

uint64_t sub_24D263808(uint64_t a1)
{
  uint64_t v4 = sub_24D290638();
  uint64_t v3 = *(void (**)(uint64_t))(*(void *)(v4 - 8) + 8);
  v3(a1);
  uint64_t v1 = type metadata accessor for EKDateRange();
  ((void (*)(uint64_t, uint64_t))v3)(a1 + *(int *)(v1 + 20), v4);
  return a1;
}

uint64_t sub_24D2638A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = sub_24D290638();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
}

uint64_t sub_24D263904()
{
  uint64_t v2 = *(void *)(sub_24D290638() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_24D2639D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24D290638();
  uint64_t v3 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));
  return sub_24D2638A4(v3, a1);
}

uint64_t EKDateRange.hash(into:)(uint64_t a1)
{
  uint64_t v9 = a1;
  uint64_t v2 = v1;
  uint64_t v13 = v2;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  uint64_t v18 = sub_24D290638();
  uint64_t v10 = *(void **)(v18 - 8);
  uint64_t v11 = v18 - 8;
  unint64_t v8 = (v10[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v18);
  uint64_t v17 = (char *)&v7 - v8;
  uint64_t v22 = a1;
  uint64_t v21 = v4;
  uint64_t v15 = (void (*)(void))v10[2];
  uint64_t v14 = v10 + 2;
  v15();
  unint64_t v16 = sub_24D265634();
  sub_24D290FF8();
  uint64_t v20 = (void (*)(char *, uint64_t))v10[1];
  uint64_t v19 = v10 + 1;
  v20(v17, v18);
  uint64_t v5 = type metadata accessor for EKDateRange();
  ((void (*)(char *, uint64_t, uint64_t))v15)(v17, v13 + *(int *)(v5 + 20), v18);
  sub_24D290FF8();
  return ((uint64_t (*)(char *, uint64_t))v20)(v17, v18);
}

uint64_t static EKDateRange.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a1;
  uint64_t v29 = a2;
  uint64_t v32 = 0;
  uint64_t v31 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = type metadata accessor for EKDateRange();
  unint64_t v12 = (*(void *)(*(void *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](0);
  uint64_t v28 = &v6[-v12];
  unint64_t v13 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v27 = &v6[-v13];
  uint64_t v23 = sub_24D290638();
  uint64_t v19 = *(void **)(v23 - 8);
  uint64_t v20 = v23 - 8;
  uint64_t v15 = v19[8];
  unint64_t v14 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v23);
  uint64_t v21 = &v6[-v14];
  unint64_t v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v6[-v14]);
  uint64_t v22 = &v6[-v16];
  uint64_t v32 = v4;
  uint64_t v31 = v29;
  uint64_t v18 = (void (*)(void))v19[2];
  uint64_t v17 = v19 + 2;
  v18();
  ((void (*)(unsigned char *, uint64_t, uint64_t))v18)(v21, v29, v23);
  int v30 = sub_24D2905E8();
  uint64_t v25 = (void (*)(unsigned char *, uint64_t))v19[1];
  uint64_t v24 = v19 + 1;
  v25(v21, v23);
  v25(v22, v23);
  sub_24D26375C(v26, (uint64_t)v27);
  sub_24D26375C(v29, (uint64_t)v28);
  if (v30)
  {
    ((void (*)(unsigned char *, unsigned char *, uint64_t))v18)(v22, &v27[*(int *)(v11 + 20)], v23);
    ((void (*)(unsigned char *, unsigned char *, uint64_t))v18)(v21, &v28[*(int *)(v11 + 20)], v23);
    int v8 = sub_24D2905E8();
    v25(v21, v23);
    v25(v22, v23);
    int v9 = v8;
  }
  else
  {
    int v9 = 0;
  }
  int v7 = v9;
  sub_24D263808((uint64_t)v27);
  sub_24D263808((uint64_t)v28);
  return v7 & 1;
}

uint64_t EKDateRange.hashValue.getter()
{
  return sub_24D290E68();
}

uint64_t sub_24D263F4C()
{
  return EKDateRange.hashValue.getter();
}

uint64_t sub_24D263F64(uint64_t a1)
{
  return EKDateRange.hash(into:)(a1);
}

uint64_t sub_24D263F7C(uint64_t a1, uint64_t a2)
{
  return static EKDateRange.== infix(_:_:)(a1, a2) & 1;
}

uint64_t sub_24D263F98(uint64_t a1)
{
  if (a1) {
    return sub_24D290DF8();
  }
  else {
    return 0;
  }
}

uint64_t sub_24D263FF4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24D264008(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24D264054(uint64_t result)
{
  if (result)
  {
    sub_24D290DD8();
    return sub_24D290DC8();
  }
  return result;
}

uint64_t sub_24D2640C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a3;
  v7[1] = a4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = a3 - 8;
  v7[0] = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void (*)(void))MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v7 - v7[0];
  v4();
  uint64_t v12 = sub_24D290F58();
  uint64_t v13 = v5;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v11);
  return v12;
}

uint64_t sub_24D2641A8()
{
  return swift_deallocObject();
}

uint64_t sub_24D2641E8()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = sub_24D290638();
  unint64_t v1 = sub_24D264244();
  return sub_24D2640C4(v5, v3, v4, v1);
}

unint64_t sub_24D264244()
{
  uint64_t v2 = qword_26985D278;
  if (!qword_26985D278)
  {
    sub_24D290638();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D278);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D2642C8()
{
  uint64_t v2 = *(void *)(sub_24D290638() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_24D264394()
{
  return swift_deallocObject();
}

unint64_t sub_24D2643D4()
{
  uint64_t v2 = qword_26985D280;
  if (!qword_26985D280)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26985D280);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_24D26443C()
{
  uint64_t v2 = qword_26985D288;
  if (!qword_26985D288)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D288);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D2644B8()
{
  uint64_t v2 = qword_26985D290;
  if (!qword_26985D290)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D290);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D264534(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_24D26455C(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  sub_24D2645E0(v4, v5, a3);
  uint64_t v8 = *a1;
  sub_24D290E28();
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_24D2645E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_24D264754((uint64_t)&v17, 0, 0, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_24D265EE0((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x263F8DBE0];
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_24D265EE0((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_24D264754(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }
      else
      {
        int64_t v16 = 0;
      }
      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_24D264ACC(v21, v15, a2);
          sub_24D290E38();
          *uint64_t v17 = a2;
          uint64_t v11 = 0;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          char v22 = v13 & 1;
          char v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    uint64_t v6 = sub_24D264B0C(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  uint64_t result = sub_24D290E98();
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_24D264ACC(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_24D264B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_24D264BC0(a1, a2);
  sub_24D264D3C();
  uint64_t v4 = v6[2];
  sub_24D264DB4(v4);
  sub_24D264E38(v4, 0);
  sub_24D22B530();
  swift_retain();
  uint64_t v5 = sub_24D264EA8((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_24D264BC0(uint64_t a1, uint64_t a2)
{
  void v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = sub_24D290C38();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    return (void *)sub_24D26502C();
  }
  uint64_t v5 = sub_24D264EC0(v7, 0);
  swift_retain();
  swift_release();
  uint64_t result = (void *)sub_24D290E78();
  uint64_t v6 = result;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_24D22F624();
    if (v6 == (void *)v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24D264D3C()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_24D264EA8(*v3);
    uint64_t result = sub_24D26505C(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }
  return result;
}

uint64_t sub_24D264DB4(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24) >> 1 < result + 1)
  {
    uint64_t result = sub_24D26505C(*(void *)(*(void *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_24D264E38(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(unsigned char *)(v6 + 32 + a1) = a2;
  return swift_release();
}

uint64_t sub_24D264EA8(uint64_t a1)
{
  return sub_24D26535C(a1);
}

void *sub_24D264EC0(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985D2C0);
    uint64_t v6 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      void v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }
    else
    {
      swift_retain();
      void v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    swift_retain();
    return (void *)v3;
  }
}

uint64_t sub_24D26502C()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  swift_retain();
  return v1;
}

uint64_t sub_24D26505C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985D2C0);
    uint64_t v8 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      void v8[2] = v10;
      void v8[3] = 2 * (v6 - (void)(v8 + 4));
    }
    else
    {
      swift_retain();
      void v8[2] = v10;
      void v8[3] = 2 * v9;
    }
    swift_release();
    uint64_t v7 = (char *)v8;
  }
  else
  {
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    swift_retain();
    uint64_t v7 = v5;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_24D26539C((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_24D265364((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t sub_24D26535C(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_24D265364(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_24D26539C(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

unsigned char **sub_24D265450(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  void *result = v4 + 1;
  return result;
}

uint64_t sub_24D265464()
{
  return swift_deallocObject();
}

unsigned char **sub_24D265490(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_24D265450(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_24D265498()
{
  return swift_deallocObject();
}

uint64_t sub_24D2654C4()
{
  return swift_deallocObject();
}

uint64_t sub_24D265504()
{
  return sub_24D264534(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_24D265510()
{
  return swift_deallocObject();
}

void *sub_24D265550(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_24D26455C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_24D26555C()
{
  return swift_deallocObject();
}

uint64_t sub_24D265588()
{
  return swift_deallocObject();
}

uint64_t sub_24D2655B4()
{
  return swift_deallocObject();
}

uint64_t sub_24D2655F4()
{
  return swift_deallocObject();
}

unint64_t sub_24D265634()
{
  uint64_t v2 = qword_26985D2A8;
  if (!qword_26985D2A8)
  {
    sub_24D290638();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D2A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D2656B8()
{
  uint64_t v2 = qword_26985D2B0;
  if (!qword_26985D2B0)
  {
    type metadata accessor for EKDateRange();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D2B0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D26573C()
{
  return sub_24D265754();
}

unint64_t sub_24D265754()
{
  uint64_t v2 = qword_26985D2B8;
  if (!qword_26985D2B8)
  {
    type metadata accessor for EKDateRange();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D2B8);
    return WitnessTable;
  }
  return v2;
}

unint64_t initializeBufferWithCopyOfBuffer for EKDateRange(char *a1, char *a2, uint64_t a3)
{
  int v11 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v11 & 0x20000) != 0)
  {
    uint64_t v6 = *(void *)a2;
    swift_retain();
    *(void *)a1 = v6;
    return *(void *)a1 + ((v11 + 16) & ~(unint64_t)v11);
  }
  else
  {
    uint64_t v4 = sub_24D290638();
    uint64_t v5 = *(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16);
    ((void (*)(char *, char *))v5)(a1, a2);
    v5(&a1[*(int *)(a3 + 20)], &a2[*(int *)(a3 + 20)], v4);
    return (unint64_t)a1;
  }
}

uint64_t destroy for EKDateRange(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D290638();
  uint64_t v6 = *(void (**)(uint64_t))(*(void *)(v5 - 8) + 8);
  v6(a1);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v5);
}

uint64_t initializeWithCopy for EKDateRange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D290638();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithCopy for EKDateRange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D290638();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t initializeWithTake for EKDateRange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D290638();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithTake for EKDateRange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D290638();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for EKDateRange()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24D265C60(uint64_t a1, unsigned int a2)
{
  uint64_t v6 = sub_24D290638();
  if (a2 == *(_DWORD *)(*(void *)(v6 - 8) + 84)) {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 48))(a1, a2, v6);
  }
  else {
    __break(1u);
  }
  return v3;
}

uint64_t storeEnumTagSinglePayload for EKDateRange()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24D265D44(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = sub_24D290638();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  __break(1u);
  return result;
}

uint64_t sub_24D265E00()
{
  uint64_t v2 = sub_24D290638();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_24D265EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void *sub_24D265F78()
{
  return &unk_26985D2D0;
}

uint64_t static EKGuidance.supportsSecureCoding.getter()
{
  uint64_t v1 = (char *)sub_24D265F78();
  swift_beginAccess();
  char v2 = *v1;
  swift_endAccess();
  return v2 & 1;
}

uint64_t static EKGuidance.supportsSecureCoding.setter(char a1)
{
  unsigned int v3 = sub_24D265F78();
  swift_beginAccess();
  *unsigned int v3 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*static EKGuidance.supportsSecureCoding.modify())()
{
  return sub_24D266168;
}

uint64_t sub_24D266168()
{
  return swift_endAccess();
}

uint64_t EKGuidance.forecastIdentifier.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_forecastIdentifier);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t EKGuidance.start.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_start;
  uint64_t v2 = sub_24D290638();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

double EKGuidance.interval.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_interval);
}

uint64_t EKGuidance.signal.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_signal);
  swift_bridgeObjectRetain();
  return v2;
}

BOOL static EKGuidance.CodingKeys.== infix(_:_:)(unsigned char *a1, unsigned char *a2)
{
  switch(*a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(*a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t EKGuidance.CodingKeys.hash(into:)()
{
  return sub_24D290FF8();
}

EnergyKitFoundation::EKGuidance::CodingKeys_optional __swiftcall EKGuidance.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  uint64_t v6 = v1;
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v7 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    char v8 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24D290C08();
    swift_bridgeObjectRetain();
    char v5 = sub_24D290C18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v5)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24D290C08();
      swift_bridgeObjectRetain();
      char v4 = sub_24D290C18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v4)
      {
        swift_bridgeObjectRelease();
        char v8 = 2;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_24D290C08();
        swift_bridgeObjectRetain();
        char v3 = sub_24D290C18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          result.value = swift_bridgeObjectRelease();
          *uint64_t v6 = 4;
          return result;
        }
        swift_bridgeObjectRelease();
        char v8 = 3;
      }
    }
  }
  *uint64_t v6 = v8;
  return (EnergyKitFoundation::EKGuidance::CodingKeys_optional)swift_bridgeObjectRelease();
}

EnergyKitFoundation::EKGuidance::CodingKeys_optional __swiftcall EKGuidance.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  *uint64_t v1 = 4;
  return (EnergyKitFoundation::EKGuidance::CodingKeys_optional)intValue;
}

uint64_t EKGuidance.CodingKeys.hashValue.getter()
{
  return sub_24D290E68();
}

uint64_t EKGuidance.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t EKGuidance.CodingKeys.stringValue.getter()
{
  return sub_24D290C08();
}

BOOL sub_24D26692C(unsigned char *a1, unsigned char *a2)
{
  return static EKGuidance.CodingKeys.== infix(_:_:)(a1, a2);
}

uint64_t sub_24D266948()
{
  return EKGuidance.CodingKeys.hashValue.getter();
}

uint64_t sub_24D266960()
{
  return EKGuidance.CodingKeys.hash(into:)();
}

uint64_t sub_24D266978()
{
  return EKGuidance.CodingKeys.stringValue.getter();
}

EnergyKitFoundation::EKGuidance::CodingKeys_optional sub_24D266990(uint64_t a1, uint64_t a2)
{
  return EKGuidance.CodingKeys.init(stringValue:)(*(Swift::String *)&a1);
}

uint64_t sub_24D2669A8()
{
  return EKGuidance.CodingKeys.intValue.getter();
}

EnergyKitFoundation::EKGuidance::CodingKeys_optional sub_24D2669C4(Swift::Int a1)
{
  return EKGuidance.CodingKeys.init(intValue:)(a1);
}

uint64_t sub_24D2669DC()
{
  return sub_24D291038();
}

uint64_t sub_24D266A0C()
{
  return sub_24D291048();
}

id EKGuidance.__allocating_init(start:interval:signal:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  id v6 = objc_allocWithZone(v5);
  return EKGuidance.init(start:interval:signal:identifier:)(a1, a2, a3, a4, a5);
}

id EKGuidance.init(start:interval:signal:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v33 = a1;
  double v24 = a5;
  uint64_t v30 = a2;
  uint64_t v26 = a3;
  uint64_t v29 = a4;
  id v42 = 0;
  uint64_t v41 = 0;
  uint64_t v40 = 0;
  uint64_t v39 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v27 = 0;
  uint64_t v34 = sub_24D290638();
  uint64_t v31 = *(void *)(v34 - 8);
  uint64_t v32 = v34 - 8;
  unint64_t v22 = (*(void *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  char v23 = (char *)&v22 - v22;
  uint64_t v41 = MEMORY[0x270FA5388](v33);
  uint64_t v40 = v6;
  uint64_t v39 = v7;
  uint64_t v37 = v8;
  uint64_t v38 = v9;
  id v10 = v5;
  id v11 = v5;
  id v12 = v5;
  id v13 = v5;
  id v42 = v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v23, v33, v34);
  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))((uint64_t)v5 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_start, v23, v34);

  id v14 = v25;
  *(double *)&v25[OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_interval] = v24;

  swift_bridgeObjectRetain();
  id v15 = v25;
  *(void *)&v25[OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_signal] = v30;

  swift_bridgeObjectRetain();
  uint64_t v16 = v29;
  id v17 = v25;
  uint64_t v18 = &v25[OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_forecastIdentifier];
  *(void *)uint64_t v18 = v26;
  *((void *)v18 + 1) = v16;

  id v28 = v42;
  uint64_t v19 = (objc_class *)type metadata accessor for EKGuidance();
  v36.receiver = v28;
  v36.super_class = v19;
  id v35 = objc_msgSendSuper2(&v36, sel_init);
  id v20 = v35;
  id v42 = v35;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v34);

  return v35;
}

id EKGuidance.__allocating_init(coder:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return EKGuidance.init(coder:)(a1);
}

id EKGuidance.init(coder:)(void *a1)
{
  id v64 = a1;
  uint64_t v97 = 0;
  uint64_t v96 = 0;
  uint64_t v94 = 0;
  double v86 = 0.0;
  uint64_t v79 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v70 = 0;
  uint64_t v52 = sub_24D290638();
  uint64_t v53 = *(void *)(v52 - 8);
  uint64_t v54 = v52 - 8;
  unint64_t v55 = (*(void *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v52);
  uint64_t v56 = (char *)&v15 - v55;
  unint64_t v57 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v15 - v55);
  unint64_t v58 = (char *)&v15 - v57;
  uint64_t v97 = (char *)&v15 - v57;
  unint64_t v59 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v64);
  uint64_t v60 = (char *)&v15 - v59;
  unint64_t v61 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  unint64_t v62 = (char *)&v15 - v61;
  uint64_t v96 = (char *)&v15 - v61;
  uint64_t v94 = v5;
  id v6 = v1;
  id v95 = v1;
  char v91 = 0;
  EKGuidance.CodingKeys.stringValue.getter();
  uint64_t v63 = v7;
  id v65 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  id v66 = objc_msgSend(v64, sel_decodeObjectForKey_, v65);

  if (v66)
  {
    id v50 = v66;
    id v49 = v66;
    uint64_t v48 = &v67;
    sub_24D290E58();
    sub_24D268D7C((uint64_t)v48, (uint64_t)&v88);
    swift_unknownObjectRelease();
  }
  else
  {
    long long v88 = 0uLL;
    uint64_t v89 = 0;
    uint64_t v90 = 0;
  }
  sub_24D268CD4(&v88, &v92);
  if (v93)
  {
    if (swift_dynamicCast()) {
      (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v62, 0, 1, v52);
    }
    else {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56))(v62, 1, 1, v52);
    }
  }
  else
  {
    sub_24D268D38((uint64_t)&v92);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56))(v62, 1, 1, v52);
  }
  char v87 = 1;
  EKGuidance.CodingKeys.stringValue.getter();
  uint64_t v42 = v8;
  id v43 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v64, sel_decodeDoubleForKey_, v43);
  double v44 = v9;

  double v86 = v44;
  char v83 = 2;
  EKGuidance.CodingKeys.stringValue.getter();
  uint64_t v45 = v10;
  id v46 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  id v47 = objc_msgSend(v64, sel_decodeObjectForKey_, v46);

  if (v47)
  {
    id v41 = v47;
    id v40 = v47;
    uint64_t v39 = v68;
    sub_24D290E58();
    sub_24D268D7C((uint64_t)v39, (uint64_t)&v80);
    swift_unknownObjectRelease();
  }
  else
  {
    long long v80 = 0uLL;
    uint64_t v81 = 0;
    uint64_t v82 = 0;
  }
  sub_24D268CD4(&v80, &v84);
  if (v85)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2F8);
    if (swift_dynamicCast()) {
      uint64_t v36 = v68[4];
    }
    else {
      uint64_t v36 = 0;
    }
    uint64_t v38 = v36;
  }
  else
  {
    uint64_t v37 = 0;
    sub_24D268D38((uint64_t)&v84);
    uint64_t v38 = v37;
  }
  uint64_t v32 = v38;
  uint64_t v79 = v38;
  char v76 = 3;
  EKGuidance.CodingKeys.stringValue.getter();
  uint64_t v33 = v11;
  id v34 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  id v35 = objc_msgSend(v64, sel_decodeObjectForKey_, v34);

  if (v35)
  {
    id v31 = v35;
    id v30 = v35;
    uint64_t v29 = v69;
    sub_24D290E58();
    sub_24D268D7C((uint64_t)v29, (uint64_t)&v73);
    swift_unknownObjectRelease();
  }
  else
  {
    long long v73 = 0uLL;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
  }
  sub_24D268CD4(&v73, &v77);
  if (v78)
  {
    if (swift_dynamicCast())
    {
      uint64_t v24 = v69[4];
      uint64_t v25 = v69[5];
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v25 = 0;
    }
    uint64_t v27 = v24;
    uint64_t v28 = v25;
  }
  else
  {
    uint64_t v26 = 0;
    sub_24D268D38((uint64_t)&v77);
    uint64_t v27 = v26;
    uint64_t v28 = v26;
  }
  uint64_t v22 = v28;
  uint64_t v23 = v27;
  uint64_t v71 = v27;
  uint64_t v72 = v28;
  sub_24D23A408(v62, v60);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v60, 1, v52) == 1)
  {

    sub_24D23A530((uint64_t)v60);
LABEL_32:
    uint64_t v16 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24D23A530((uint64_t)v62);

    id v15 = v95;
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return (id)v16;
  }
  (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v58, v60, v52);
  swift_bridgeObjectRetain();
  if (!v32)
  {

    (*(void (**)(char *, uint64_t))(v53 + 8))(v58, v52);
    goto LABEL_32;
  }
  uint64_t v21 = v32;
  uint64_t v18 = v32;
  uint64_t v70 = v32;
  uint64_t ObjectType = swift_getObjectType();

  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v56, v58, v52);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v19 = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, double))(ObjectType + 112))(v56, v18, v23, v22, v44);
  id v17 = v95;
  id v13 = v19;
  id v95 = v19;
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v58, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24D23A530((uint64_t)v62);

  return v19;
}

uint64_t sub_24D267700(void *a1)
{
  id v32 = a1;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v20 = sub_24D290638();
  uint64_t v18 = *(void *)(v20 - 8);
  uint64_t v19 = v20 - 8;
  unint64_t v17 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v21 = (char *)v9 - v17;
  uint64_t v42 = MEMORY[0x270FA5388](v32);
  uint64_t v41 = v29;
  (*(void (**)(char *, uint64_t))(v18 + 16))((char *)v9 - v17, v29 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_start);
  uint64_t v24 = sub_24D2905A8();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v20);
  char v40 = 0;
  EKGuidance.CodingKeys.stringValue.getter();
  uint64_t v1 = v29;
  uint64_t v22 = v2;
  id v23 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  unint64_t v31 = 0x1F62CD000uLL;
  objc_msgSend(v32, (SEL)0x1F62CD9C5, v24, v23);

  swift_unknownObjectRelease();
  double v26 = *(double *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_interval);
  char v39 = 1;
  EKGuidance.CodingKeys.stringValue.getter();
  uint64_t v3 = v29;
  uint64_t v25 = v4;
  id v27 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v32, sel_encodeDouble_forKey_, v27, v26);

  uint64_t v28 = *(void *)(v3 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_signal);
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_24D290CB8();
  swift_bridgeObjectRelease();
  char v38 = 2;
  EKGuidance.CodingKeys.stringValue.getter();
  uint64_t v5 = v29;
  uint64_t v30 = v6;
  id v33 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v32, (SEL)(v31 + 2501), v34, v33);

  swift_unknownObjectRelease();
  uint64_t v35 = *(void *)(v5 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_forecastIdentifier);
  uint64_t v36 = *(void *)(v5 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_forecastIdentifier + 8);
  swift_bridgeObjectRetain();
  if (v36)
  {
    uint64_t v15 = v35;
    uint64_t v16 = v36;
    uint64_t v12 = v36;
    uint64_t v13 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v11 = v14;
  char v37 = 3;
  EKGuidance.CodingKeys.stringValue.getter();
  v9[1] = v7;
  id v10 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v32, sel_encodeObject_forKey_, v11, v10);

  return swift_unknownObjectRelease();
}

id EKGuidance.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t EKGuidance.init()()
{
  if (!"EnergyKitFoundation.EKGuidance")
  {
    sub_24D290EB8();
    __break(1u);
  }
  uint64_t result = sub_24D26911C((uint64_t)"EnergyKitFoundation.EKGuidance", 30, (unint64_t)"init()", 6, 2, (unint64_t)"EnergyKitFoundation/EKGuidance.swift", 36, 2, v1, 0xBuLL, 0xEuLL);
  __break(1u);
  return result;
}

id EKGuidance.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKGuidance();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D267CD0(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v48 = 0;
  uint64_t v47 = 0;
  uint64_t v37 = sub_24D290638();
  uint64_t v32 = *(void *)(v37 - 8);
  uint64_t v33 = v37 - 8;
  unint64_t v24 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v37);
  char v39 = (char *)v8 - v24;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D300);
  uint64_t v26 = *(void *)(v36 - 8);
  uint64_t v27 = v36 - 8;
  unint64_t v28 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  objc_super v2 = (void *)MEMORY[0x270FA5388](v25);
  unint64_t v31 = (char *)v8 - v28;
  uint64_t v48 = v2;
  uint64_t v47 = v1;
  uint64_t v29 = v2[3];
  uint64_t v30 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v29);
  sub_24D268BDC();
  sub_24D291028();
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v39, v34 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_start, v37);
  uint64_t v35 = &v46;
  char v46 = 0;
  sub_24D26951C();
  uint64_t v3 = v38;
  sub_24D290F48();
  uint64_t v40 = v3;
  uint64_t v41 = v3;
  if (v3)
  {
    uint64_t v10 = v41;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v39, v37);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v31, v36);
    uint64_t v11 = v10;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v32 + 8))(v39, v37);
    uint64_t v4 = v40;
    char v45 = 1;
    sub_24D290F38();
    uint64_t v22 = v4;
    uint64_t v23 = v4;
    if (v4)
    {
      uint64_t v9 = v23;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v31, v36);
      uint64_t v11 = v9;
    }
    else
    {
      uint64_t v16 = *(void *)(v34 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_signal);
      swift_bridgeObjectRetain();
      uint64_t v19 = &v44;
      uint64_t v44 = v16;
      unint64_t v17 = &v43;
      char v43 = 2;
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2F8);
      sub_24D2695A0();
      uint64_t v5 = v22;
      sub_24D290F48();
      uint64_t v20 = v5;
      uint64_t v21 = v5;
      if (v5)
      {
        v8[1] = v21;
        sub_24D230030();
        return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v31, v36);
      }
      else
      {
        sub_24D230030();
        uint64_t v6 = v20;
        uint64_t v12 = *(void *)(v34 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_forecastIdentifier);
        uint64_t v13 = *(void *)(v34 + OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_forecastIdentifier + 8);
        swift_bridgeObjectRetain();
        char v42 = 3;
        sub_24D290F28();
        uint64_t v14 = v6;
        uint64_t v15 = v6;
        if (v6) {
          v8[0] = v15;
        }
        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v31, v36);
      }
    }
  }
  return result;
}

id EKGuidance.__allocating_init(from:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  id v7 = EKGuidance.init(from:)(a1);
  if (v5) {
    return (id)v4;
  }
  else {
    return v7;
  }
}

id EKGuidance.init(from:)(void *a1)
{
  unint64_t v61 = a1;
  uint64_t v74 = 0;
  uint64_t v52 = sub_24D290638();
  uint64_t v53 = *(void *)(v52 - 8);
  uint64_t v54 = v52 - 8;
  unint64_t v55 = (*(void *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v52);
  uint64_t v56 = (char *)v26 - v55;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D318);
  uint64_t v58 = *(void *)(v57 - 8);
  uint64_t v59 = v57 - 8;
  unint64_t v60 = (*(void *)(v58 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v61);
  unint64_t v62 = (char *)v26 - v60;
  char v76 = 0;
  uint64_t v74 = v2;
  id v3 = v1;
  id v4 = v1;
  id v5 = v1;
  id v6 = v1;
  id v7 = v1;
  id v8 = v1;
  id v9 = v1;
  id v75 = v1;
  uint64_t v64 = v61[3];
  uint64_t v65 = v61[4];
  __swift_project_boxed_opaque_existential_1(v61, v64);
  sub_24D268BDC();
  uint64_t v10 = v63;
  sub_24D291018();
  uint64_t v66 = v10;
  uint64_t v67 = v10;
  if (v10)
  {
    uint64_t v31 = v67;

    uint64_t v32 = v31;
  }
  else
  {
    uint64_t v48 = &v73;
    char v73 = 0;
    sub_24D269630();
    uint64_t v11 = v66;
    sub_24D290F18();
    uint64_t v49 = v11;
    uint64_t v50 = v11;
    if (v11)
    {
      uint64_t v30 = v50;

      (*(void (**)(char *, uint64_t))(v58 + 8))(v62, v57);
      uint64_t v32 = v30;
    }
    else
    {
      char v76 = 2;
      (*(void (**)(char *, char *, uint64_t))(v53 + 32))(&v51[OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_start], v56, v52);

      uint64_t v12 = v49;
      char v72 = 1;
      sub_24D290F08();
      uint64_t v45 = v12;
      uint64_t v46 = v13;
      uint64_t v47 = v12;
      if (v12)
      {
        uint64_t v29 = v47;

        (*(void (**)(char *, uint64_t))(v58 + 8))(v62, v57);
        uint64_t v32 = v29;
      }
      else
      {
        id v14 = v51;
        *(void *)&v51[OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_interval] = v46;

        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2F8);
        uint64_t v41 = &v70;
        char v70 = 2;
        sub_24D2696B4();
        uint64_t v15 = v45;
        sub_24D290F18();
        uint64_t v43 = v15;
        uint64_t v44 = v15;
        if (v15)
        {
          uint64_t v28 = v44;

          (*(void (**)(char *, uint64_t))(v58 + 8))(v62, v57);
          uint64_t v32 = v28;
        }
        else
        {
          id v16 = v51;
          char v76 = 10;
          *(void *)&v51[OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_signal] = v71;

          uint64_t v17 = v43;
          char v69 = 3;
          uint64_t v18 = sub_24D290EF8();
          uint64_t v37 = v17;
          uint64_t v38 = v18;
          uint64_t v39 = v19;
          uint64_t v40 = v17;
          if (!v17)
          {
            uint64_t v34 = v39;
            uint64_t v33 = v38;

            uint64_t v20 = v34;
            id v21 = v51;
            uint64_t v22 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_forecastIdentifier];
            char v76 = 11;
            *(void *)uint64_t v22 = v33;
            *((void *)v22 + 1) = v20;

            id v35 = v75;
            char v76 = 31;
            uint64_t v23 = (objc_class *)type metadata accessor for EKGuidance();
            v68.receiver = v35;
            v68.super_class = v23;
            id v36 = objc_msgSendSuper2(&v68, sel_init);
            id v24 = v36;
            id v75 = v36;
            (*(void (**)(char *, uint64_t))(v58 + 8))(v62, v57);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);

            return v36;
          }
          uint64_t v27 = v40;

          (*(void (**)(char *, uint64_t))(v58 + 8))(v62, v57);
          uint64_t v32 = v27;
        }
      }
    }
  }
  v26[2] = v32;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
  if ((v76 & 2) != 0) {
    (*(void (**)(char *, uint64_t))(v53 + 8))(&v51[OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_start], v52);
  }

  if ((v76 & 8) != 0) {
    sub_24D230030();
  }

  v26[0] = v75;
  type metadata accessor for EKGuidance();
  swift_deallocPartialClassInstance();
  return (id)v26[1];
}

uint64_t sub_24D268A5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 144))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_24D268ACC()
{
  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x263F8EED0]) + 0x88))();
}

unint64_t sub_24D268B5C()
{
  uint64_t v2 = qword_26985D2E0;
  if (!qword_26985D2E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D2E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D268BDC()
{
  uint64_t v2 = qword_26985D2E8;
  if (!qword_26985D2E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D2E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for EKGuidance()
{
  uint64_t v1 = qword_26B18BC60;
  if (!qword_26B18BC60) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

_OWORD *sub_24D268CD4(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  a2[1] = a1[1];
  return a2;
}

uint64_t sub_24D268D38(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

__n128 sub_24D268D7C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_24D268D98(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_24D268DD0(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v5 = (a3 + 1);
  }
  else
  {
    int v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      int v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v5 = (v6 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }
  uint64_t v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  uint64_t v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0) {
    return a1(&v8, v4);
  }
  sub_24D290ED8();
  __break(1u);
LABEL_12:
  uint64_t result = sub_24D290EB8();
  __break(1u);
  return result;
}

uint64_t sub_24D26911C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  unint64_t v26 = a6;
  uint64_t v27 = a7;
  int v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = a11;
  uint64_t v31 = sub_24D26A350;
  uint64_t v32 = sub_24D26A394;
  uint64_t v33 = "Fatal error";
  uint64_t v34 = "Unexpectedly found nil while unwrapping an Optional value";
  id v35 = "Swift/StaticString.swift";
  id v36 = "Not enough bits to represent the passed value";
  uint64_t v37 = "Swift/Integers.swift";
  uint64_t v38 = "UnsafeBufferPointer with negative count";
  uint64_t v39 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v40 = 0;
  unint64_t v42 = a6;
  uint64_t v43 = a7;
  char v44 = a8;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  unint64_t v47 = a10;
  unint64_t v48 = a11;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        uint64_t v19 = &v18;
        uint64_t v11 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v32);
        id v16 = v31;
        uint64_t v17 = &v41;
        sub_24D268DD0(v11, (uint64_t)v14, v12);
        return (uint64_t)v19;
      }
      v14[0] = 2;
      uint64_t v15 = 148;
      LODWORD(v16) = 0;
      sub_24D290EB8();
      __break(1u);
    }
    v14[0] = 2;
    uint64_t v15 = 3455;
    LODWORD(v16) = 0;
    sub_24D290EB8();
    __break(1u);
  }
  if (v24) {
    uint64_t v49 = v24;
  }
  else {
    uint64_t v49 = 0;
  }
  uint64_t v18 = v49;
  if (!v49)
  {
    v14[0] = 2;
    uint64_t v15 = 136;
    LODWORD(v16) = 0;
    sub_24D290EB8();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_24D269F78(v18, v25, v26, v27, v28, v22, v23, v29, v21, v30);
  }
  uint64_t result = sub_24D290ED8();
  __break(1u);
  return result;
}

unint64_t sub_24D26951C()
{
  uint64_t v2 = qword_26985D308;
  if (!qword_26985D308)
  {
    sub_24D290638();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D308);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D2695A0()
{
  uint64_t v2 = qword_26985D310;
  if (!qword_26985D310)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26985D2F8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D310);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D269630()
{
  uint64_t v2 = qword_26985D320;
  if (!qword_26985D320)
  {
    sub_24D290638();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D320);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D2696B4()
{
  uint64_t v2 = qword_26985D328;
  if (!qword_26985D328)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26985D2F8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D328);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D269744()
{
  return sub_24D26975C();
}

unint64_t sub_24D26975C()
{
  uint64_t v2 = qword_26985D330;
  if (!qword_26985D330)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D330);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D2697DC()
{
  return sub_24D2697F4();
}

unint64_t sub_24D2697F4()
{
  uint64_t v2 = qword_26985D338;
  if (!qword_26985D338)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D338);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D269874()
{
  return sub_24D26988C();
}

unint64_t sub_24D26988C()
{
  uint64_t v2 = qword_26985D340;
  if (!qword_26985D340)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D340);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D26990C()
{
  return type metadata accessor for EKGuidance();
}

uint64_t sub_24D269928()
{
  uint64_t updated = sub_24D290638();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t method lookup function for EKGuidance()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKGuidance.__allocating_init(start:interval:signal:identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of EKGuidance.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of EKGuidance.encode(with:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x80))();
}

uint64_t dispatch thunk of EKGuidance.encode(to:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x88))();
}

uint64_t dispatch thunk of EKGuidance.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t getEnumTagSinglePayload for EKGuidance.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for EKGuidance.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    void *result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      void *result = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EKGuidance.CodingKeys()
{
  return &type metadata for EKGuidance.CodingKeys;
}

uint64_t sub_24D269F78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a6;
  uint64_t v27 = a7;
  unint64_t v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = sub_24D26A90C;
  uint64_t v31 = sub_24D26A394;
  uint64_t v32 = "Fatal error";
  uint64_t v33 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v34 = "Swift/StaticString.swift";
  id v35 = "Not enough bits to represent the passed value";
  id v36 = "Swift/Integers.swift";
  uint64_t v37 = "UnsafeBufferPointer with negative count";
  uint64_t v38 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v39 = 0;
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  unint64_t v45 = a8;
  unint64_t v46 = a10;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        uint64_t v19 = &v17;
        uint64_t v10 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v31);
        uint64_t v15 = v30;
        id v16 = &v40;
        sub_24D268DD0(v10, (uint64_t)v13, v11);
        return (uint64_t)v19;
      }
      v13[0] = 2;
      uint64_t v14 = 148;
      LODWORD(v15) = 0;
      sub_24D290EB8();
      __break(1u);
    }
    v13[0] = 2;
    uint64_t v14 = 3455;
    LODWORD(v15) = 0;
    sub_24D290EB8();
    __break(1u);
  }
  if (v24) {
    uint64_t v47 = v24;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v18 = v47;
  if (!v47)
  {
    v13[0] = 2;
    uint64_t v14 = 136;
    LODWORD(v15) = 0;
    sub_24D290EB8();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_24D26A3C0(v18, v25, v26, v27, v22, v23, v28, v29);
  }
  uint64_t result = sub_24D290ED8();
  __break(1u);
  return result;
}

uint64_t sub_24D26A350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24D269F78(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), a3, *(void *)(v3 + 64));
}

uint64_t sub_24D26A394(uint64_t a1, uint64_t a2)
{
  return sub_24D268D98(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_24D26A3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  if (!a3)
  {
    sub_24D290EB8();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        sub_24D290EB8();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            sub_24D290EB8();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                }
                sub_24D290EB8();
                __break(1u);
              }
              sub_24D290EB8();
              __break(1u);
            }
            sub_24D290EB8();
            __break(1u);
          }
          sub_24D290EB8();
          __break(1u);
        }
        sub_24D290EB8();
        __break(1u);
      }
      sub_24D290EB8();
      __break(1u);
    }
    sub_24D290EB8();
    __break(1u);
  }
  uint64_t result = sub_24D290EB8();
  __break(1u);
  return result;
}

uint64_t sub_24D26A90C(uint64_t a1, uint64_t a2)
{
  return sub_24D26A3C0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

id static UsagePointRecords.fetchRequest()()
{
  return sub_24D228DBC();
}

char *keypath_get_selector_tariffProfiles()
{
  return sel_tariffProfiles;
}

void sub_24D26A9AC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_tariffProfiles);
  *a2 = sub_24D2904E8();
  a2[1] = v3;
}

uint64_t sub_24D26AA24(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v9);
  uint64_t v7 = v9[0];
  unint64_t v8 = v9[1];
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D2904C8();
  objc_msgSend(v5, sel_setTariffProfiles_);

  return sub_24D2293AC(v7, v8);
}

char *keypath_get_selector_tariffRiders()
{
  return sel_tariffRiders;
}

void sub_24D26AAC8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  id v6 = objc_msgSend(v4, sel_tariffRiders);
  *a2 = sub_24D2904E8();
  a2[1] = v3;
}

uint64_t sub_24D26AB40(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v9);
  uint64_t v7 = v9[0];
  unint64_t v8 = v9[1];
  id v5 = *a2;
  id v2 = *a2;
  id v6 = (id)sub_24D2904C8();
  objc_msgSend(v5, sel_setTariffRiders_);

  return sub_24D2293AC(v7, v8);
}

void sub_24D26ABD8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_sourceTime);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D26ACE4(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setSourceTime_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

void sub_24D26AE1C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = a2;
  uint64_t v4 = a1;
  uint64_t v11 = sub_24D290638();
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (char *)&v3 - v5;
  id v6 = *(id *)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v14 = v6;
  id v13 = v6;
  id v12 = objc_msgSend(v6, sel_creationDate);
  sub_24D2905F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v9, v10, v11);
}

uint64_t sub_24D26AF28(uint64_t a1, id *a2)
{
  v4[1] = a1;
  id v6 = a2;
  uint64_t v13 = sub_24D290638();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v5 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  id v12 = (char *)v4 - v5;
  (*(void (**)(char *))(v10 + 16))((char *)v4 - v5);
  id v7 = *v6;
  id v2 = v7;
  id v14 = v7;
  id v9 = v7;
  id v8 = (id)sub_24D2905A8();
  objc_msgSend(v9, sel_setCreationDate_);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v13);
}

uint64_t sub_24D26B060()
{
  uint64_t result = sub_24D290C08();
  qword_26B18C318 = result;
  qword_26B18C320 = v1;
  return result;
}

uint64_t *sub_24D26B0A4()
{
  if (qword_26B18C328 != -1) {
    swift_once();
  }
  return &qword_26B18C318;
}

uint64_t static EKEnergySite.zoneNamePrefix.getter()
{
  uint64_t v1 = *sub_24D26B0A4();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static EKEnergySite.generateCKZoneName(siteID:)()
{
  return sub_24D290BE8();
}

Swift::String __swiftcall EKEnergySite.generateCKZoneName()()
{
  sub_24D290F98();
  sub_24D290C08();
  sub_24D290F88();
  swift_bridgeObjectRelease();
  sub_24D26B0A4();
  swift_bridgeObjectRetain();
  sub_24D290F78();
  sub_24D22F624();
  sub_24D290C08();
  sub_24D290F88();
  uint64_t v0 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x160))(v0);
  sub_24D290F78();
  sub_24D22F624();
  sub_24D290C08();
  sub_24D290F88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D22F624();
  uint64_t v1 = sub_24D290BE8();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

id EnergyWindowsCache.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id EnergyWindowsCache.init(entity:insertInto:)(void *a1, void *a2)
{
  id v10 = 0;
  id v9 = a1;
  id v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for EnergyWindowsCache();
  id v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  id v2 = v6;
  id v10 = v6;

  return v6;
}

uint64_t type metadata accessor for EnergyWindowsCache()
{
  return self;
}

id EnergyWindowsCache.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EnergyWindowsCache();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id TOUPeaks.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id TOUPeaks.init(entity:insertInto:)(void *a1, void *a2)
{
  id v10 = 0;
  id v9 = a1;
  id v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for TOUPeaks();
  id v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  id v2 = v6;
  id v10 = v6;

  return v6;
}

uint64_t type metadata accessor for TOUPeaks()
{
  return self;
}

id TOUPeaks.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TOUPeaks();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D26B840()
{
  uint64_t result = sub_24D2299E0();
  byte_26985ECA8 = result & 1;
  return result;
}

char *sub_24D26B864()
{
  if (qword_26985ECA0 != -1) {
    swift_once();
  }
  return &byte_26985ECA8;
}

uint64_t static EKUtility.isSharedIPad.getter()
{
  uint64_t v1 = sub_24D26B864();
  swift_beginAccess();
  char v2 = *v1;
  swift_endAccess();
  return v2 & 1;
}

uint64_t static EKUtility.isSharedIPad.setter(char a1)
{
  uint64_t v3 = sub_24D26B864();
  swift_beginAccess();
  *uint64_t v3 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*static EKUtility.isSharedIPad.modify())()
{
  return sub_24D266168;
}

uint64_t EKUtility.deinit()
{
  return v0;
}

uint64_t EKUtility.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_24D26BA6C()
{
  return sub_24D26BAA8();
}

uint64_t sub_24D26BAA8()
{
  return v0;
}

uint64_t type metadata accessor for EKUtility()
{
  return self;
}

uint64_t method lookup function for EKUtility()
{
  return swift_lookUpClassMethod();
}

void *sub_24D26BB20()
{
  return &unk_26985D410;
}

uint64_t static EKEnergySite.supportsSecureCoding.getter()
{
  uint64_t v1 = (char *)sub_24D26BB20();
  swift_beginAccess();
  char v2 = *v1;
  swift_endAccess();
  return v2 & 1;
}

uint64_t static EKEnergySite.supportsSecureCoding.setter(char a1)
{
  uint64_t v3 = sub_24D26BB20();
  swift_beginAccess();
  *uint64_t v3 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*static EKEnergySite.supportsSecureCoding.modify())()
{
  return sub_24D266168;
}

uint64_t sub_24D26BD10()
{
  uint64_t result = sub_24D290C08();
  qword_26B18BCD8 = result;
  qword_26B18BCE0 = v1;
  return result;
}

uint64_t *sub_24D26BD54()
{
  if (qword_26B18BCF0 != -1) {
    swift_once();
  }
  return &qword_26B18BCD8;
}

uint64_t static EKEnergySite.siteUUIDNamespace.getter()
{
  uint64_t v1 = *sub_24D26BD54();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static EKEnergySite.isEqual(lhs:rhs:)(void *a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void *))((*a1 & *MEMORY[0x263F8EED0]) + 0x160))(a1);
  (*(void (**)(void))((*a2 & *v4) + 0x160))();
  char v5 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_24D26BF10(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x160))(v2);
  a2[1] = v3;
}

void sub_24D26BFAC(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  uint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x168))(v6, v5);
}

uint64_t sub_24D26C05C()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteID);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26C0D0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteID);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26C170())()
{
  return sub_24D266168;
}

void sub_24D26C1DC(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x178))(v2);
  a2[1] = v3;
}

void sub_24D26C278(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  uint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x180))(v6, v5);
}

uint64_t sub_24D26C328()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteName);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26C39C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteName);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26C43C())()
{
  return sub_24D266168;
}

void sub_24D26C4A8(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x190))(v2);
  a2[1] = v3;
}

void sub_24D26C544(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  uint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x198))(v6, v5);
}

uint64_t sub_24D26C5F4()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_ckZoneName);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26C668(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_ckZoneName);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26C708())()
{
  return sub_24D266168;
}

void sub_24D26C774(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x1A8))(v2);
  a2[1] = v3;
}

void sub_24D26C810(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  uint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x1B0))(v6, v5);
}

uint64_t sub_24D26C8C0()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_state);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26C934(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_state);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26C9D4())()
{
  return sub_24D266168;
}

uint64_t sub_24D26CA40()
{
  return 0;
}

void sub_24D26CA48(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v3 & *MEMORY[0x263F8EED0]) + 0x1C0))(v2);
}

void sub_24D26CAE0(id *a1, id *a2)
{
  sub_24D28269C(a1, &v6);
  uint64_t v5 = v6;
  uint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x1C8))(v5);
}

id sub_24D26CB84()
{
  uint64_t v3 = (id *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_location);
  swift_beginAccess();
  id v4 = *v3;
  id v1 = *v3;
  swift_endAccess();
  return v4;
}

void sub_24D26CBEC(void *a1)
{
  id v2 = a1;
  id v4 = (void **)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_location);
  swift_beginAccess();
  uint64_t v3 = *v4;
  *id v4 = a1;

  swift_endAccess();
}

uint64_t (*sub_24D26CC6C())()
{
  return sub_24D266168;
}

uint64_t sub_24D26CCD8()
{
  return 0;
}

void sub_24D26CCE4(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x1D8))(v2);
  a2[1] = v3;
}

void sub_24D26CD80(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  id v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x1E0))(v6, v5);
}

uint64_t sub_24D26CE30()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_utilityID);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26CEA4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_utilityID);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26CF40())()
{
  return sub_24D266168;
}

void sub_24D26CFAC(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x1F0))(v2);
  a2[1] = v3;
}

void sub_24D26D048(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  id v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x1F8))(v6, v5);
}

uint64_t sub_24D26D0F8()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionID);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26D16C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionID);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26D208())()
{
  return sub_24D266168;
}

void sub_24D26D274(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x208))(v2);
  a2[1] = v3;
}

void sub_24D26D310(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  id v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x210))(v6, v5);
}

uint64_t sub_24D26D3C0()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accessToken);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26D434(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accessToken);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26D4D0())()
{
  return sub_24D266168;
}

void sub_24D26D53C(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x220))(v2);
  a2[1] = v3;
}

void sub_24D26D5D8(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  id v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x228))(v6, v5);
}

uint64_t sub_24D26D688()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_refreshToken);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26D6FC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_refreshToken);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26D798())()
{
  return sub_24D266168;
}

void sub_24D26D804(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x238))(v2);
  a2[1] = v3;
}

void sub_24D26D8A0(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  id v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x240))(v6, v5);
}

uint64_t sub_24D26D950()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_timezone);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26D9C4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_timezone);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26DA60())()
{
  return sub_24D266168;
}

uint64_t sub_24D26DACC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 56))(a1, 1);
}

void sub_24D26DB2C(uint64_t a1@<X0>, void *a2@<X8>)
{
  id v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8) - 8) + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  objc_super v7 = (uint64_t *)((char *)&v3 - v5);
  uint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  uint64_t v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x250))(v2);
  sub_24D282540(v7, v8);
}

void sub_24D26DC2C(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  objc_super v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8) - 8) + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (uint64_t *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D24B80C(v2, (uint64_t *)((char *)&v4 - v6));
  id v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x258))(v9);
}

uint64_t sub_24D26DD28@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_currentRatePlan);
  swift_beginAccess();
  sub_24D24B80C(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D26DD8C(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8) - 8) + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (unint64_t *)((char *)&v3 - v3);
  id v10 = (uint64_t *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D24B80C(v10, (unint64_t *)((char *)&v3 - v3));
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_currentRatePlan);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D24BC08(v4, v5);
  swift_endAccess();
  return sub_24D24B9F0(v7);
}

uint64_t (*sub_24D26DE68())()
{
  return sub_24D266168;
}

void sub_24D26DED4(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x268))(v2);
  a2[1] = v3;
}

void sub_24D26DF70(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  uint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x270))(v6, v5);
}

uint64_t sub_24D26E020()
{
  uint64_t v2 = v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointCustomIndex;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  sub_24D229320(*(void *)v2, *(void *)(v2 + 8));
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26E094(uint64_t a1, unint64_t a2)
{
  sub_24D229320(a1, a2);
  uint64_t v6 = (uint64_t *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointCustomIndex);
  swift_beginAccess();
  uint64_t v3 = *v6;
  unint64_t v4 = v6[1];
  *uint64_t v6 = a1;
  v6[1] = a2;
  sub_24D2293AC(v3, v4);
  swift_endAccess();
  return sub_24D2293AC(a1, a2);
}

uint64_t (*sub_24D26E130())()
{
  return sub_24D266168;
}

void sub_24D26E19C(id *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x280))(v2);
  a2[1] = v3;
}

void sub_24D26E238(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  unint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x288))(v6, v5);
}

uint64_t sub_24D26E2E8()
{
  uint64_t v2 = v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryCustomIndex;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  sub_24D229320(*(void *)v2, *(void *)(v2 + 8));
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26E35C(uint64_t a1, unint64_t a2)
{
  sub_24D229320(a1, a2);
  uint64_t v6 = (uint64_t *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryCustomIndex);
  swift_beginAccess();
  uint64_t v3 = *v6;
  unint64_t v4 = v6[1];
  *uint64_t v6 = a1;
  v6[1] = a2;
  sub_24D2293AC(v3, v4);
  swift_endAccess();
  return sub_24D2293AC(a1, a2);
}

uint64_t (*sub_24D26E3F8())()
{
  return sub_24D266168;
}

void sub_24D26E464(id *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x298))(v2);
  a2[1] = v3;
}

void sub_24D26E500(uint64_t *a1, id *a2)
{
  sub_24D2292D4(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  unint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x2A0))(v6, v5);
}

uint64_t sub_24D26E5B0()
{
  uint64_t v2 = v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockCustomIndex;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  sub_24D229320(*(void *)v2, *(void *)(v2 + 8));
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26E624(uint64_t a1, unint64_t a2)
{
  sub_24D229320(a1, a2);
  uint64_t v6 = (uint64_t *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockCustomIndex);
  swift_beginAccess();
  uint64_t v3 = *v6;
  unint64_t v4 = v6[1];
  *uint64_t v6 = a1;
  v6[1] = a2;
  sub_24D2293AC(v3, v4);
  swift_endAccess();
  return sub_24D2293AC(a1, a2);
}

uint64_t (*sub_24D26E6C0())()
{
  return sub_24D266168;
}

void sub_24D26E72C(id *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x2B0))(v2);
  a2[1] = v3;
}

void sub_24D26E7C8(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  unint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x2B8))(v6, v5);
}

uint64_t sub_24D26E878()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_ckFunctionToken);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26E8EC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_ckFunctionToken);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26E988())()
{
  return sub_24D266168;
}

void sub_24D26E9F4(id *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x2C8))(v2);
  a2[1] = v3;
}

void sub_24D26EA90(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  unint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x2D0))(v6, v5);
}

uint64_t sub_24D26EB40()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accountName);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26EBB4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accountName);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26EC50())()
{
  return sub_24D266168;
}

void sub_24D26ECBC(id *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x2E0))(v2);
  a2[1] = v3;
}

void sub_24D26ED58(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  unint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x2E8))(v6, v5);
}

uint64_t sub_24D26EE08()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accountNumber);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26EE7C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accountNumber);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26EF18())()
{
  return sub_24D266168;
}

void sub_24D26EF84(id *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x2F8))(v2);
  a2[1] = v3;
}

void sub_24D26F020(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  unint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x300))(v6, v5);
}

uint64_t sub_24D26F0D0()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_address);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26F144(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_address);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26F1E0())()
{
  return sub_24D266168;
}

void sub_24D26F24C(id *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x310))(v2);
  a2[1] = v3;
}

void sub_24D26F2E8(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  unint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x318))(v6, v5);
}

uint64_t sub_24D26F398()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_serviceLocationID);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26F40C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_serviceLocationID);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26F4A8())()
{
  return sub_24D266168;
}

void sub_24D26F514(id *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v4 & *MEMORY[0x263F8EED0]) + 0x328))(v2);
  a2[1] = v3;
}

void sub_24D26F5B0(void *a1, id *a2)
{
  sub_24D229294(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  unint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t, uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x330))(v6, v5);
}

uint64_t sub_24D26F660()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_alternateSupplier);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D26F6D4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_alternateSupplier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D26F770())()
{
  return sub_24D266168;
}

uint64_t sub_24D26F7DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_24D290638();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 56))(a1, 1);
}

void sub_24D26F83C(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  uint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  uint64_t v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x340))(v2);
  sub_24D22E53C(v7, v8);
}

void sub_24D26F93C(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D23A408(v2, (char *)&v4 - v6);
  char v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x348))(v9);
}

uint64_t sub_24D26FA38@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accessTokenExpirationDate);
  swift_beginAccess();
  sub_24D23A408(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D26FA9C(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D23A408(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accessTokenExpirationDate);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D26FB78(v4, v5);
  swift_endAccess();
  return sub_24D23A530(v7);
}

void *sub_24D26FB78(const void *a1, void *a2)
{
  uint64_t v7 = sub_24D290638();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a2, 1))
  {
    if (v9(a1, 1, v7))
    {
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
      memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a2, a1, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
    }
  }
  else if (v9(a1, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a2, v7);
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a2, a1, v7);
  }
  return a2;
}

uint64_t (*sub_24D26FDA8())()
{
  return sub_24D266168;
}

void sub_24D26FE14(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  unint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  uint64_t v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x358))(v2);
  sub_24D22E53C(v7, v8);
}

void sub_24D26FF14(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D23A408(v2, (char *)&v4 - v6);
  uint64_t v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x360))(v9);
}

uint64_t sub_24D270010@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_utilitySupportedCheckDate);
  swift_beginAccess();
  sub_24D23A408(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D270074(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D23A408(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_utilitySupportedCheckDate);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D26FB78(v4, v5);
  swift_endAccess();
  return sub_24D23A530(v7);
}

uint64_t (*sub_24D270150())()
{
  return sub_24D266168;
}

void sub_24D2701BC(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  unint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  uint64_t v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x370))(v2);
  sub_24D22E53C(v7, v8);
}

void sub_24D2702BC(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D23A408(v2, (char *)&v4 - v6);
  char v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x378))(v9);
}

uint64_t sub_24D2703B8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_amiLastRefreshDate);
  swift_beginAccess();
  sub_24D23A408(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D27041C(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D23A408(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_amiLastRefreshDate);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D26FB78(v4, v5);
  swift_endAccess();
  return sub_24D23A530(v7);
}

uint64_t (*sub_24D2704F8())()
{
  return sub_24D266168;
}

void sub_24D270564(id *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v3 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v3 & *MEMORY[0x263F8EED0]) + 0x388))(v2) & 1;
}

void sub_24D270600(char *a1, id *a2)
{
  char v4 = *a1;
  unint64_t v3 = *a2;
  id v2 = *a2;
  (*(void (**)(void))((*v3 & *MEMORY[0x263F8EED0]) + 0x390))(v4 & 1);
}

uint64_t sub_24D270698()
{
  id v2 = (char *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_hasExportedEnergy);
  swift_beginAccess();
  char v3 = *v2;
  swift_endAccess();
  return v3 & 1;
}

uint64_t sub_24D270700(char a1)
{
  char v4 = (unsigned char *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_hasExportedEnergy);
  swift_beginAccess();
  *char v4 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*sub_24D270784())()
{
  return sub_24D266168;
}

void sub_24D2707F0(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  unint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x3A0))(v2);
  sub_24D22E53C(v7, v8);
}

void sub_24D2708F0(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D23A408(v2, (char *)&v4 - v6);
  char v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x3A8))(v9);
}

uint64_t sub_24D2709EC@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointNextRefreshDate);
  swift_beginAccess();
  sub_24D23A408(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D270A50(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D23A408(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointNextRefreshDate);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D26FB78(v4, v5);
  swift_endAccess();
  return sub_24D23A530(v7);
}

uint64_t (*sub_24D270B2C())()
{
  return sub_24D266168;
}

void sub_24D270B98(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  unint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x3B8))(v2);
  sub_24D22E53C(v7, v8);
}

void sub_24D270C98(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D23A408(v2, (char *)&v4 - v6);
  char v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x3C0))(v9);
}

uint64_t sub_24D270D94@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryNextRefreshDate);
  swift_beginAccess();
  sub_24D23A408(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D270DF8(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D23A408(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryNextRefreshDate);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D26FB78(v4, v5);
  swift_endAccess();
  return sub_24D23A530(v7);
}

uint64_t (*sub_24D270ED4())()
{
  return sub_24D266168;
}

void sub_24D270F40(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  unint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x3D0))(v2);
  sub_24D22E53C(v7, v8);
}

void sub_24D271040(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D23A408(v2, (char *)&v4 - v6);
  char v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x3D8))(v9);
}

uint64_t sub_24D27113C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockNextRefreshDate);
  swift_beginAccess();
  sub_24D23A408(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D2711A0(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D23A408(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockNextRefreshDate);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D26FB78(v4, v5);
  swift_endAccess();
  return sub_24D23A530(v7);
}

uint64_t (*sub_24D27127C())()
{
  return sub_24D266168;
}

void sub_24D2712E8(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  unint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x3E8))(v2);
  sub_24D22E53C(v7, v8);
}

void sub_24D2713E8(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D23A408(v2, (char *)&v4 - v6);
  char v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x3F0))(v9);
}

uint64_t sub_24D2714E4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionCreationDate);
  swift_beginAccess();
  sub_24D23A408(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D271548(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D23A408(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionCreationDate);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D26FB78(v4, v5);
  swift_endAccess();
  return sub_24D23A530(v7);
}

uint64_t (*sub_24D271624())()
{
  return sub_24D266168;
}

void sub_24D271690(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  unint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x400))(v2);
  sub_24D22E53C(v7, v8);
}

void sub_24D271790(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D23A408(v2, (char *)&v4 - v6);
  char v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x408))(v9);
}

uint64_t sub_24D27188C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionStartDate);
  swift_beginAccess();
  sub_24D23A408(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D2718F0(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D23A408(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionStartDate);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D26FB78(v4, v5);
  swift_endAccess();
  return sub_24D23A530(v7);
}

uint64_t (*sub_24D2719CC())()
{
  return sub_24D266168;
}

void sub_24D271A38(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  unint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x418))(v2);
  sub_24D22E53C(v7, v8);
}

void sub_24D271B38(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D23A408(v2, (char *)&v4 - v6);
  char v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x420))(v9);
}

uint64_t sub_24D271C34@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteTombstone);
  swift_beginAccess();
  sub_24D23A408(v3, a1);
  return swift_endAccess();
}

uint64_t sub_24D271C98(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D23A408(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteTombstone);
  unint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D26FB78(v4, v5);
  swift_endAccess();
  return sub_24D23A530(v7);
}

uint64_t (*sub_24D271D74())()
{
  return sub_24D266168;
}

uint64_t sub_24D271DE0()
{
  return 2;
}

void sub_24D271DE8(id *a1@<X0>, _DWORD *a2@<X8>)
{
  unint64_t v3 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v3 & *MEMORY[0x263F8EED0]) + 0x430))(v2);
}

void sub_24D271E80(unsigned int *a1, id *a2)
{
  unsigned int v4 = *a1;
  unint64_t v3 = *a2;
  id v2 = *a2;
  (*(void (**)(void))((*v3 & *MEMORY[0x263F8EED0]) + 0x438))(v4);
}

uint64_t sub_24D271F14()
{
  id v2 = (unsigned int *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteVersion);
  swift_beginAccess();
  unsigned int v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t sub_24D271F78(int a1)
{
  unsigned int v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteVersion);
  swift_beginAccess();
  *unsigned int v3 = a1;
  return swift_endAccess();
}

uint64_t (*sub_24D271FE4())()
{
  return sub_24D266168;
}

void sub_24D272050(id *a1@<X0>, void *a2@<X8>)
{
  unsigned int v3 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v3 & *MEMORY[0x263F8EED0]) + 0x448))(v2);
}

void sub_24D2720E8(uint64_t *a1, id *a2)
{
  sub_24D25CA7C(a1, &v6);
  uint64_t v5 = v6;
  unsigned int v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x450))(v5);
}

uint64_t sub_24D27218C()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_generationMeters);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_24D2721F4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_generationMeters);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D272274())()
{
  return sub_24D266168;
}

uint64_t sub_24D2722E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_24D2908B8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 56))(a1, 1);
}

void sub_24D272340(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08) - 8) + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v3 - v5;
  uint64_t v6 = *(void **)MEMORY[0x270FA5388](v4);
  id v2 = v6;
  id v10 = v6;
  id v9 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x460))(v2);
  sub_24D282418(v7, v8);
}

void sub_24D272440(uint64_t a1, void **a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08) - 8) + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  id v2 = (const void *)MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v4 - v6;
  sub_24D2725A0(v2, (char *)&v4 - v6);
  char v8 = *v7;
  uint64_t v3 = v8;
  uint64_t v11 = v8;
  id v10 = v8;
  (*(void (**)(char *))((*v8 & *MEMORY[0x263F8EED0]) + 0x468))(v9);
}

uint64_t sub_24D27253C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_unknownFields);
  swift_beginAccess();
  sub_24D2725A0(v3, a1);
  return swift_endAccess();
}

void *sub_24D2725A0(const void *a1, void *a2)
{
  uint64_t v6 = sub_24D2908B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_24D2726C8(uint64_t a1)
{
  uint64_t v7 = a1;
  id v10 = 0;
  uint64_t v9 = 0;
  unint64_t v3 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08) - 8) + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)&v3 - v3;
  id v10 = (const void *)MEMORY[0x270FA5388](v7);
  uint64_t v9 = v1;
  sub_24D2725A0(v10, (char *)&v3 - v3);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_unknownFields);
  uint64_t v6 = &v8;
  swift_beginAccess();
  sub_24D2727A4(v4, v5);
  swift_endAccess();
  return sub_24D2729D4(v7);
}

void *sub_24D2727A4(const void *a1, void *a2)
{
  uint64_t v7 = sub_24D2908B8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a2, 1))
  {
    if (v9(a1, 1, v7))
    {
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08);
      memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a2, a1, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
    }
  }
  else if (v9(a1, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a2, v7);
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a2, a1, v7);
  }
  return a2;
}

uint64_t sub_24D2729D4(uint64_t a1)
{
  uint64_t v3 = sub_24D2908B8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t (*sub_24D272A84())()
{
  return sub_24D266168;
}

id EKEnergySite.__allocating_init(siteID:siteName:ckZoneName:state:location:utilityID:subscriptionID:accessToken:refreshToken:timezone:currentRatePlan:usagePointCustomIndex:usageSummaryCustomIndex:intervalBlockCustomIndex:ckFunctionToken:accountName:accountNumber:address:serviceLocationID:alternateSupplier:accessTokenExpirationDate:utilitySupportedCheckDate:amiLastRefreshDate:hasExportedEnergy:usagePointNextRefreshDate:usageSummaryNextRefreshDate:intervalBlockNextRefreshDate:subscriptionCreationDate:subscriptionStartDate:siteTombstone:siteVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t *a20,uint64_t a21,unint64_t a22,uint64_t a23,unint64_t a24,uint64_t a25,unint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,const void *a39,const void *a40,const void *a41,char a42,const void *a43,const void *a44,const void *a45,const void *a46,const void *a47,const void *a48,int a49)
{
  id v50 = objc_allocWithZone(v49);
  return EKEnergySite.init(siteID:siteName:ckZoneName:state:location:utilityID:subscriptionID:accessToken:refreshToken:timezone:currentRatePlan:usagePointCustomIndex:usageSummaryCustomIndex:intervalBlockCustomIndex:ckFunctionToken:accountName:accountNumber:address:serviceLocationID:alternateSupplier:accessTokenExpirationDate:utilitySupportedCheckDate:amiLastRefreshDate:hasExportedEnergy:usagePointNextRefreshDate:usageSummaryNextRefreshDate:intervalBlockNextRefreshDate:subscriptionCreationDate:subscriptionStartDate:siteTombstone:siteVersion:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42 & 1,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49);
}

id EKEnergySite.init(siteID:siteName:ckZoneName:state:location:utilityID:subscriptionID:accessToken:refreshToken:timezone:currentRatePlan:usagePointCustomIndex:usageSummaryCustomIndex:intervalBlockCustomIndex:ckFunctionToken:accountName:accountNumber:address:serviceLocationID:alternateSupplier:accessTokenExpirationDate:utilitySupportedCheckDate:amiLastRefreshDate:hasExportedEnergy:usagePointNextRefreshDate:usageSummaryNextRefreshDate:intervalBlockNextRefreshDate:subscriptionCreationDate:subscriptionStartDate:siteTombstone:siteVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t *a20,uint64_t a21,unint64_t a22,uint64_t a23,unint64_t a24,uint64_t a25,unint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,const void *a39,const void *a40,const void *a41,unsigned __int8 a42,const void *a43,const void *a44,const void *a45,const void *a46,const void *a47,const void *a48,int a49)
{
  uint64_t v192 = a1;
  uint64_t v329 = a2;
  uint64_t v193 = a3;
  uint64_t v328 = a4;
  uint64_t v191 = a5;
  uint64_t v327 = a6;
  uint64_t v194 = a7;
  uint64_t v326 = a8;
  id v325 = a9;
  uint64_t v199 = a10;
  uint64_t v324 = a11;
  uint64_t v203 = a12;
  uint64_t v323 = a13;
  uint64_t v207 = a14;
  uint64_t v322 = a15;
  uint64_t v211 = a16;
  uint64_t v321 = a17;
  uint64_t v215 = a18;
  uint64_t v320 = a19;
  uint64_t v319 = a20;
  uint64_t v317 = a21;
  unint64_t v318 = a22;
  uint64_t v315 = a23;
  unint64_t v316 = a24;
  uint64_t v313 = a25;
  unint64_t v314 = a26;
  uint64_t v223 = a27;
  uint64_t v312 = a28;
  uint64_t v227 = a29;
  uint64_t v311 = a30;
  uint64_t v231 = a31;
  uint64_t v310 = a32;
  uint64_t v235 = a33;
  uint64_t v309 = a34;
  uint64_t v239 = a35;
  uint64_t v308 = a36;
  uint64_t v243 = a37;
  uint64_t v307 = a38;
  uint64_t v306 = a39;
  uint64_t v305 = a40;
  uint64_t v304 = a41;
  int v256 = a42;
  int v303 = a43;
  uint64_t v302 = a44;
  uint64_t v301 = a45;
  uint64_t v300 = a46;
  uint64_t v299 = a47;
  uint64_t v298 = a48;
  int v280 = a49;
  id v407 = 0;
  uint64_t v405 = 0;
  uint64_t v406 = 0;
  uint64_t v403 = 0;
  uint64_t v404 = 0;
  uint64_t v401 = 0;
  uint64_t v402 = 0;
  uint64_t v399 = 0;
  uint64_t v400 = 0;
  id v398 = 0;
  uint64_t v396 = 0;
  uint64_t v397 = 0;
  uint64_t v394 = 0;
  uint64_t v395 = 0;
  uint64_t v392 = 0;
  uint64_t v393 = 0;
  uint64_t v390 = 0;
  uint64_t v391 = 0;
  uint64_t v388 = 0;
  uint64_t v389 = 0;
  uint64_t v387 = 0;
  uint64_t v385 = 0;
  unint64_t v386 = 0;
  uint64_t v383 = 0;
  unint64_t v384 = 0;
  uint64_t v381 = 0;
  unint64_t v382 = 0;
  uint64_t v379 = 0;
  uint64_t v380 = 0;
  uint64_t v377 = 0;
  uint64_t v378 = 0;
  uint64_t v375 = 0;
  uint64_t v376 = 0;
  uint64_t v373 = 0;
  uint64_t v374 = 0;
  uint64_t v371 = 0;
  uint64_t v372 = 0;
  uint64_t v369 = 0;
  uint64_t v370 = 0;
  v368 = 0;
  uint64_t v367 = 0;
  uint64_t v366 = 0;
  char v365 = 0;
  uint64_t v364 = 0;
  uint64_t v363 = 0;
  uint64_t v362 = 0;
  v361 = 0;
  v360 = 0;
  uint64_t v359 = 0;
  int v358 = 0;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08);
  unint64_t v182 = (*(void *)(*(void *)(v50 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v50);
  uint64_t v292 = (char *)&v182 - v182;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
  unint64_t v183 = (*(void *)(*(void *)(v51 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v51);
  uint64_t v275 = (char *)&v182 - v183;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
  MEMORY[0x270FA5388](v52);
  int v219 = (unint64_t *)((char *)&v182 - v53);
  uint64_t v405 = v192;
  uint64_t v406 = v54;
  uint64_t v403 = v55;
  uint64_t v404 = v56;
  uint64_t v401 = v57;
  uint64_t v402 = v58;
  uint64_t v399 = v59;
  uint64_t v400 = v60;
  id v398 = v325;
  uint64_t v396 = v199;
  uint64_t v397 = v324;
  uint64_t v394 = v203;
  uint64_t v395 = v323;
  uint64_t v392 = v207;
  uint64_t v393 = v322;
  uint64_t v390 = v211;
  uint64_t v391 = v321;
  uint64_t v388 = v215;
  uint64_t v389 = v320;
  uint64_t v387 = v319;
  uint64_t v385 = v317;
  unint64_t v386 = v318;
  uint64_t v383 = v315;
  unint64_t v384 = a24;
  uint64_t v381 = a25;
  unint64_t v382 = a26;
  uint64_t v379 = a27;
  uint64_t v380 = a28;
  uint64_t v377 = a29;
  uint64_t v378 = a30;
  uint64_t v375 = a31;
  uint64_t v376 = v310;
  uint64_t v373 = v235;
  uint64_t v374 = v309;
  uint64_t v371 = v239;
  uint64_t v372 = v308;
  uint64_t v369 = v243;
  uint64_t v370 = v307;
  v368 = v306;
  uint64_t v367 = v305;
  uint64_t v366 = v304;
  unsigned int v285 = 1;
  char v365 = v61 & 1;
  uint64_t v364 = v62;
  uint64_t v363 = v63;
  uint64_t v362 = v64;
  v361 = v300;
  v360 = v299;
  uint64_t v359 = v298;
  int v358 = v280;
  uint64_t v65 = v49;
  uint64_t v66 = v49;
  uint64_t v67 = v49;
  objc_super v68 = v49;
  char v69 = v49;
  char v70 = v49;
  uint64_t v71 = v49;
  char v72 = v49;
  char v73 = v49;
  uint64_t v74 = v49;
  id v75 = v49;
  char v76 = v49;
  long long v77 = v49;
  uint64_t v78 = v49;
  uint64_t v79 = v49;
  long long v80 = v49;
  uint64_t v81 = v49;
  uint64_t v82 = v49;
  char v83 = v49;
  long long v84 = v49;
  uint64_t v85 = v49;
  double v86 = v49;
  char v87 = v49;
  long long v88 = v49;
  uint64_t v89 = v49;
  uint64_t v90 = v49;
  char v91 = v49;
  long long v92 = v49;
  uint64_t v93 = v49;
  uint64_t v94 = v49;
  id v95 = v49;
  uint64_t v96 = v49;
  uint64_t v97 = v49;
  uint64_t v98 = v49;
  uint64_t v99 = v49;
  uint64_t v100 = v49;
  uint64_t v101 = v49;
  uint64_t v102 = v49;
  int v103 = v49;
  int v104 = v49;
  uint64_t v105 = v49;
  unint64_t v106 = v49;
  int v107 = v49;
  uint64_t v108 = v49;
  uint64_t v109 = v49;
  uint64_t v110 = v49;
  unint64_t v111 = v49;
  uint64_t v112 = v49;
  uint64_t v113 = v49;
  uint64_t v114 = v49;
  uint64_t v115 = v49;
  uint64_t v116 = v49;
  int v117 = v49;
  uint64_t v118 = v49;
  uint32_t v119 = v49;
  uint64_t v120 = v49;
  uint64_t v121 = v49;
  unint64_t v122 = v49;
  uint64_t v123 = v49;
  uint64_t v124 = v49;
  id v407 = v49;
  unint64_t v195 = 0x26985D000uLL;
  uint64_t v296 = 0;
  *(void *)&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_location] = 0;

  unint64_t v198 = 0x26985D000uLL;
  uint64_t v125 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_utilityID];
  *(void *)uint64_t v125 = 0;
  *((void *)v125 + 1) = 0;

  unint64_t v202 = 0x26985D000uLL;
  uint64_t v126 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionID];
  *(void *)uint64_t v126 = 0;
  *((void *)v126 + 1) = 0;

  unint64_t v206 = 0x26985D000uLL;
  uint64_t v127 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accessToken];
  *(void *)uint64_t v127 = 0;
  *((void *)v127 + 1) = 0;

  unint64_t v210 = 0x26985D000uLL;
  uint64_t v128 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_refreshToken];
  *(void *)uint64_t v128 = 0;
  *((void *)v128 + 1) = 0;

  unint64_t v214 = 0x26985D000uLL;
  uint64_t v129 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_timezone];
  *(void *)uint64_t v129 = 0;
  *((void *)v129 + 1) = 0;

  v218 = &qword_26B18C000;
  uint64_t v184 = OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_currentRatePlan;
  uint64_t v130 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  (*(void (**)(char *, void))(*(void *)(v130 - 8) + 56))(&v49[v184], v285);

  v222 = &qword_26B18C000;
  uint64_t v131 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_ckFunctionToken];
  *(void *)uint64_t v131 = 0;
  *((void *)v131 + 1) = 0;

  v226 = &qword_26B18C000;
  uint64_t v132 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accountName];
  *(void *)uint64_t v132 = 0;
  *((void *)v132 + 1) = 0;

  uint64_t v230 = &qword_26B18C000;
  int v133 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accountNumber];
  *(void *)int v133 = 0;
  *((void *)v133 + 1) = 0;

  v234 = &qword_26B18C000;
  int v134 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_address];
  *(void *)int v134 = 0;
  *((void *)v134 + 1) = 0;

  uint64_t v238 = &qword_26B18C000;
  uint64_t v135 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_serviceLocationID];
  *(void *)uint64_t v135 = 0;
  *((void *)v135 + 1) = 0;

  uint64_t v242 = &qword_26B18C000;
  uint64_t v136 = &v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_alternateSupplier];
  *(void *)uint64_t v136 = 0;
  *((void *)v136 + 1) = 0;

  v246 = &qword_26B18C000;
  uint64_t v185 = OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accessTokenExpirationDate;
  uint64_t v186 = sub_24D290638();
  uint64_t v137 = *(void *)(v186 - 8);
  v188 = *(void (**)(char *, void))(v137 + 56);
  uint64_t v187 = v137 + 56;
  v188(&v49[v185], v285);

  v249 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v188)(&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_utilitySupportedCheckDate], v285, v285, v186);

  uint64_t v252 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v188)(&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_amiLastRefreshDate], v285, v285, v186);

  int v255 = &qword_26B18C000;
  v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_hasExportedEnergy] = 0;

  uint64_t v259 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v188)(&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointNextRefreshDate], v285, v285, v186);

  v262 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v188)(&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryNextRefreshDate], v285, v285, v186);

  uint64_t v265 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v188)(&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockNextRefreshDate], v285, v285, v186);

  v268 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v188)(&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionCreationDate], v285, v285, v186);

  uint64_t v271 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v188)(&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionStartDate], v285, v285, v186);

  uint64_t v274 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v188)(&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteTombstone], v285, v285, v186);

  uint64_t v278 = &qword_26B18C000;
  *(_DWORD *)&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteVersion] = 2;

  uint64_t v282 = &qword_26B18C000;
  *(void *)&v49[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_generationMeters] = v296;

  uint64_t v289 = &qword_26B18C000;
  uint64_t v189 = OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_unknownFields;
  uint64_t v286 = sub_24D2908B8();
  uint64_t v138 = *(void *)(v286 - 8);
  uint64_t v288 = *(void (**)(char *, void))(v138 + 56);
  uint64_t v287 = v138 + 56;
  v288(&v49[v189], v285);

  uint64_t v190 = OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_encoder;
  sub_24D290488();
  uint64_t v139 = sub_24D290478();
  uint64_t v140 = v295;
  *(void *)&v295[v190] = v139;

  swift_bridgeObjectRetain();
  uint64_t v141 = v327;
  uint64_t v142 = &v140[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_ckZoneName];
  *(void *)uint64_t v142 = v191;
  *((void *)v142 + 1) = v141;

  swift_bridgeObjectRetain();
  uint64_t v143 = v329;
  char v144 = &v140[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteID];
  *(void *)char v144 = v192;
  *((void *)v144 + 1) = v143;

  swift_bridgeObjectRetain();
  uint64_t v145 = v328;
  uint64_t v146 = &v140[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteName];
  *(void *)uint64_t v146 = v193;
  *((void *)v146 + 1) = v145;

  swift_bridgeObjectRetain();
  uint64_t v147 = v326;
  v148 = &v140[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_state];
  *(void *)v148 = v194;
  *((void *)v148 + 1) = v147;

  id v149 = v325;
  v196 = (void **)&v140[*(void *)(v195 + 1080)];
  uint64_t v197 = &v357;
  uint64_t v290 = 33;
  uint64_t v291 = 0;
  swift_beginAccess();
  uint64_t v150 = *v196;
  void *v196 = v325;

  swift_endAccess();
  swift_bridgeObjectRetain();
  v200 = &v140[*(void *)(v198 + 1088)];
  int v201 = &v356;
  swift_beginAccess();
  uint64_t v151 = v200;
  uint64_t v152 = v324;
  *(void *)v200 = v199;
  *((void *)v151 + 1) = v152;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  uint64_t v204 = &v140[*(void *)(v202 + 1096)];
  v205 = &v355;
  swift_beginAccess();
  uint64_t v153 = v204;
  uint64_t v154 = v323;
  *(void *)uint64_t v204 = v203;
  *((void *)v153 + 1) = v154;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  v208 = &v140[*(void *)(v206 + 1104)];
  v209 = &v354;
  swift_beginAccess();
  int v155 = v208;
  uint64_t v156 = v322;
  *(void *)v208 = v207;
  *((void *)v155 + 1) = v156;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  uint64_t v212 = &v140[*(void *)(v210 + 1112)];
  v213 = &v353;
  swift_beginAccess();
  uint64_t v157 = v212;
  uint64_t v158 = v321;
  *(void *)uint64_t v212 = v211;
  *((void *)v157 + 1) = v158;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  int v216 = &v140[*(void *)(v214 + 1120)];
  uint64_t v217 = &v352;
  swift_beginAccess();
  int v159 = v216;
  uint64_t v160 = v320;
  *(void *)int v216 = v215;
  *((void *)v159 + 1) = v160;
  swift_bridgeObjectRelease();
  swift_endAccess();

  sub_24D24B80C(v319, v219);
  int v220 = &v140[v218[109]];
  int v221 = &v351;
  swift_beginAccess();
  sub_24D24BC08(v219, v220);
  swift_endAccess();

  sub_24D229320(v317, v318);
  unint64_t v161 = v318;
  v162 = &v140[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointCustomIndex];
  *(void *)v162 = v317;
  *((void *)v162 + 1) = v161;

  sub_24D229320(v315, v316);
  unint64_t v163 = v316;
  uint64_t v164 = &v140[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryCustomIndex];
  *(void *)uint64_t v164 = v315;
  *((void *)v164 + 1) = v163;

  sub_24D229320(v313, v314);
  unint64_t v165 = v314;
  uint64_t v166 = &v140[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockCustomIndex];
  *(void *)uint64_t v166 = v313;
  *((void *)v166 + 1) = v165;

  swift_bridgeObjectRetain();
  uint64_t v224 = &v140[v222[108]];
  uint64_t v225 = &v350;
  swift_beginAccess();
  v167 = v224;
  uint64_t v168 = v312;
  *(void *)uint64_t v224 = v223;
  *((void *)v167 + 1) = v168;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  v228 = &v140[v226[106]];
  int v229 = &v349;
  swift_beginAccess();
  uint64_t v169 = v228;
  uint64_t v170 = v311;
  *(void *)v228 = v227;
  *((void *)v169 + 1) = v170;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  int v232 = &v140[v230[107]];
  int v233 = &v348;
  swift_beginAccess();
  int v171 = v232;
  uint64_t v172 = v310;
  *(void *)int v232 = v231;
  *((void *)v171 + 1) = v172;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  v236 = &v140[v234[121]];
  uint64_t v237 = &v347;
  swift_beginAccess();
  uint64_t v173 = v236;
  uint64_t v174 = v309;
  *(void *)v236 = v235;
  *((void *)v173 + 1) = v174;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  v240 = &v140[v238[111]];
  v241 = &v346;
  swift_beginAccess();
  v175 = v240;
  uint64_t v176 = v308;
  *(void *)v240 = v239;
  *((void *)v175 + 1) = v176;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  uint64_t v244 = &v140[v242[110]];
  v245 = &v345;
  swift_beginAccess();
  uint64_t v177 = v244;
  uint64_t v178 = v307;
  *(void *)uint64_t v244 = v243;
  *((void *)v177 + 1) = v178;
  swift_bridgeObjectRelease();
  swift_endAccess();

  sub_24D23A408(v306, v275);
  uint64_t v247 = &v140[v246[116]];
  uint64_t v248 = &v344;
  swift_beginAccess();
  sub_24D26FB78(v275, v247);
  swift_endAccess();

  sub_24D23A408(v305, v275);
  v250 = &v140[v249[118]];
  uint64_t v251 = &v343;
  swift_beginAccess();
  sub_24D26FB78(v275, v250);
  swift_endAccess();

  sub_24D23A408(v304, v275);
  uint64_t v253 = &v140[v252[112]];
  uint64_t v254 = &v342;
  swift_beginAccess();
  sub_24D26FB78(v275, v253);
  swift_endAccess();

  v257 = &v140[v255[105]];
  v258 = &v341;
  swift_beginAccess();
  char *v257 = v256 & v285;
  swift_endAccess();

  sub_24D23A408(v303, v275);
  uint64_t v260 = &v140[v259[117]];
  v261 = &v340;
  swift_beginAccess();
  sub_24D26FB78(v275, v260);
  swift_endAccess();

  sub_24D23A408(v302, v275);
  uint64_t v263 = &v140[v262[119]];
  uint64_t v264 = &v339;
  swift_beginAccess();
  sub_24D26FB78(v275, v263);
  swift_endAccess();

  sub_24D23A408(v301, v275);
  uint64_t v266 = &v140[v265[120]];
  int v267 = &v338;
  swift_beginAccess();
  sub_24D26FB78(v275, v266);
  swift_endAccess();

  sub_24D23A408(v300, v275);
  v269 = &v140[v268[128]];
  uint64_t v270 = &v337;
  swift_beginAccess();
  sub_24D26FB78(v275, v269);
  swift_endAccess();

  sub_24D23A408(v299, v275);
  uint64_t v272 = &v140[v271[127]];
  v273 = &v336;
  swift_beginAccess();
  sub_24D26FB78(v275, v272);
  swift_endAccess();

  sub_24D23A408(v298, v275);
  uint64_t v276 = &v140[v274[124]];
  uint64_t v277 = &v335;
  swift_beginAccess();
  sub_24D26FB78(v275, v276);
  swift_endAccess();

  int v279 = &v140[v278[123]];
  uint64_t v281 = &v334;
  swift_beginAccess();
  *(_DWORD *)int v279 = v280;
  swift_endAccess();

  uint64_t v283 = &v140[v282[126]];
  uint64_t v284 = &v333;
  swift_beginAccess();
  *(void *)uint64_t v283 = 0;
  swift_bridgeObjectRelease();
  swift_endAccess();

  ((void (*)(char *, void, void, uint64_t))v288)(v292, v285, v285, v286);
  uint64_t v293 = &v140[v289[125]];
  uint64_t v294 = &v332;
  swift_beginAccess();
  sub_24D2727A4(v292, v293);
  swift_endAccess();

  id v297 = v407;
  v179 = (objc_class *)type metadata accessor for EKEnergySite();
  v331.receiver = v297;
  v331.super_class = v179;
  id v330 = objc_msgSendSuper2(&v331, sel_init);
  id v180 = v330;
  id v407 = v330;
  sub_24D23A530((uint64_t)v298);
  sub_24D23A530((uint64_t)v299);
  sub_24D23A530((uint64_t)v300);
  sub_24D23A530((uint64_t)v301);
  sub_24D23A530((uint64_t)v302);
  sub_24D23A530((uint64_t)v303);
  sub_24D23A530((uint64_t)v304);
  sub_24D23A530((uint64_t)v305);
  sub_24D23A530((uint64_t)v306);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24D2293AC(v313, v314);
  sub_24D2293AC(v315, v316);
  sub_24D2293AC(v317, v318);
  sub_24D24B9F0((uint64_t)v319);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v330;
}

uint64_t type metadata accessor for EKEnergySite()
{
  uint64_t v1 = qword_26B18C150;
  if (!qword_26B18C150) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_24D2745C0()
{
  return sub_24D290478();
}

id EKEnergySite.__allocating_init(siteID:siteName:ckZoneName:state:location:utilityID:subscriptionID:accessToken:refreshToken:timezone:currentRatePlan:usagePointCustomIndex:usageSummaryCustomIndex:intervalBlockCustomIndex:ckFunctionToken:accountName:accountNumber:address:serviceLocationID:alternateSupplier:accessTokenExpirationDate:utilitySupportedCheckDate:amiLastRefreshDate:hasExportedEnergy:usagePointNextRefreshDate:usageSummaryNextRefreshDate:intervalBlockNextRefreshDate:subscriptionCreationDate:subscriptionStartDate:siteTombstone:siteVersion:generationMeters:unknownFields:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t *a20,uint64_t a21,unint64_t a22,uint64_t a23,unint64_t a24,uint64_t a25,unint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,const void *a39,const void *a40,const void *a41,char a42,const void *a43,const void *a44,const void *a45,const void *a46,const void *a47,const void *a48,int a49,uint64_t a50,const void *a51)
{
  id v52 = objc_allocWithZone(v51);
  return EKEnergySite.init(siteID:siteName:ckZoneName:state:location:utilityID:subscriptionID:accessToken:refreshToken:timezone:currentRatePlan:usagePointCustomIndex:usageSummaryCustomIndex:intervalBlockCustomIndex:ckFunctionToken:accountName:accountNumber:address:serviceLocationID:alternateSupplier:accessTokenExpirationDate:utilitySupportedCheckDate:amiLastRefreshDate:hasExportedEnergy:usagePointNextRefreshDate:usageSummaryNextRefreshDate:intervalBlockNextRefreshDate:subscriptionCreationDate:subscriptionStartDate:siteTombstone:siteVersion:generationMeters:unknownFields:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42 & 1,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51);
}

id EKEnergySite.init(siteID:siteName:ckZoneName:state:location:utilityID:subscriptionID:accessToken:refreshToken:timezone:currentRatePlan:usagePointCustomIndex:usageSummaryCustomIndex:intervalBlockCustomIndex:ckFunctionToken:accountName:accountNumber:address:serviceLocationID:alternateSupplier:accessTokenExpirationDate:utilitySupportedCheckDate:amiLastRefreshDate:hasExportedEnergy:usagePointNextRefreshDate:usageSummaryNextRefreshDate:intervalBlockNextRefreshDate:subscriptionCreationDate:subscriptionStartDate:siteTombstone:siteVersion:generationMeters:unknownFields:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t *a20,uint64_t a21,unint64_t a22,uint64_t a23,unint64_t a24,uint64_t a25,unint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,const void *a39,const void *a40,const void *a41,unsigned __int8 a42,const void *a43,const void *a44,const void *a45,const void *a46,const void *a47,const void *a48,int a49,uint64_t a50,const void *a51)
{
  uint64_t v196 = a1;
  uint64_t v332 = a2;
  uint64_t v197 = a3;
  uint64_t v331 = a4;
  uint64_t v195 = a5;
  uint64_t v330 = a6;
  uint64_t v198 = a7;
  uint64_t v329 = a8;
  id v328 = a9;
  uint64_t v203 = a10;
  uint64_t v327 = a11;
  uint64_t v207 = a12;
  uint64_t v326 = a13;
  uint64_t v211 = a14;
  uint64_t v325 = a15;
  uint64_t v215 = a16;
  uint64_t v324 = a17;
  uint64_t v219 = a18;
  uint64_t v323 = a19;
  uint64_t v322 = a20;
  uint64_t v320 = a21;
  unint64_t v321 = a22;
  uint64_t v318 = a23;
  unint64_t v319 = a24;
  uint64_t v316 = a25;
  unint64_t v317 = a26;
  uint64_t v227 = a27;
  uint64_t v315 = a28;
  uint64_t v231 = a29;
  uint64_t v314 = a30;
  uint64_t v235 = a31;
  uint64_t v313 = a32;
  uint64_t v239 = a33;
  uint64_t v312 = a34;
  uint64_t v243 = a35;
  uint64_t v311 = a36;
  uint64_t v247 = a37;
  uint64_t v310 = a38;
  uint64_t v309 = a39;
  uint64_t v308 = a40;
  uint64_t v307 = a41;
  int v261 = a42;
  uint64_t v306 = a43;
  uint64_t v305 = a44;
  uint64_t v304 = a45;
  int v303 = a46;
  uint64_t v302 = a47;
  uint64_t v301 = a48;
  int v187 = a49;
  uint64_t v300 = a50;
  uint64_t v299 = a51;
  id v412 = 0;
  uint64_t v410 = 0;
  uint64_t v411 = 0;
  uint64_t v408 = 0;
  uint64_t v409 = 0;
  uint64_t v406 = 0;
  uint64_t v407 = 0;
  uint64_t v404 = 0;
  uint64_t v405 = 0;
  id v403 = 0;
  uint64_t v401 = 0;
  uint64_t v402 = 0;
  uint64_t v399 = 0;
  uint64_t v400 = 0;
  uint64_t v397 = 0;
  uint64_t v398 = 0;
  uint64_t v395 = 0;
  uint64_t v396 = 0;
  uint64_t v393 = 0;
  uint64_t v394 = 0;
  uint64_t v392 = 0;
  uint64_t v390 = 0;
  unint64_t v391 = 0;
  uint64_t v388 = 0;
  unint64_t v389 = 0;
  uint64_t v386 = 0;
  unint64_t v387 = 0;
  uint64_t v384 = 0;
  uint64_t v385 = 0;
  uint64_t v382 = 0;
  uint64_t v383 = 0;
  uint64_t v380 = 0;
  uint64_t v381 = 0;
  uint64_t v378 = 0;
  uint64_t v379 = 0;
  uint64_t v376 = 0;
  uint64_t v377 = 0;
  uint64_t v374 = 0;
  uint64_t v375 = 0;
  uint64_t v373 = 0;
  uint64_t v372 = 0;
  uint64_t v371 = 0;
  char v370 = 0;
  uint64_t v369 = 0;
  uint64_t v368 = 0;
  uint64_t v367 = 0;
  uint64_t v366 = 0;
  uint64_t v365 = 0;
  uint64_t v364 = 0;
  int v363 = 0;
  uint64_t v362 = 0;
  v361 = 0;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08);
  unint64_t v185 = (*(void *)(*(void *)(v52 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v52);
  uint64_t v293 = (char *)&v184 - v185;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
  unint64_t v186 = (*(void *)(*(void *)(v53 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v53);
  int v280 = (char *)&v184 - v186;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
  MEMORY[0x270FA5388](v54);
  uint64_t v223 = (uint64_t *)((char *)&v184 - v55);
  uint64_t v410 = v196;
  uint64_t v411 = v56;
  uint64_t v408 = v57;
  uint64_t v409 = v58;
  uint64_t v406 = v59;
  uint64_t v407 = v60;
  uint64_t v404 = v61;
  uint64_t v405 = v62;
  id v403 = v328;
  uint64_t v401 = v203;
  uint64_t v402 = v327;
  uint64_t v399 = v207;
  uint64_t v400 = v326;
  uint64_t v397 = v211;
  uint64_t v398 = v325;
  uint64_t v395 = v215;
  uint64_t v396 = v324;
  uint64_t v393 = v219;
  uint64_t v394 = v323;
  uint64_t v392 = v322;
  uint64_t v390 = v320;
  unint64_t v391 = v321;
  uint64_t v388 = v318;
  unint64_t v389 = v319;
  uint64_t v386 = v316;
  unint64_t v387 = a26;
  uint64_t v384 = a27;
  uint64_t v385 = a28;
  uint64_t v382 = a29;
  uint64_t v383 = a30;
  uint64_t v380 = a31;
  uint64_t v381 = a32;
  uint64_t v378 = a33;
  uint64_t v379 = v312;
  uint64_t v376 = v243;
  uint64_t v377 = v311;
  uint64_t v374 = v247;
  uint64_t v375 = v310;
  uint64_t v373 = v309;
  uint64_t v372 = v308;
  uint64_t v371 = v307;
  unsigned int v260 = 1;
  char v370 = v261 & 1;
  uint64_t v369 = v306;
  uint64_t v368 = v63;
  uint64_t v367 = v64;
  uint64_t v366 = v65;
  uint64_t v365 = v66;
  uint64_t v364 = v301;
  int v363 = v187;
  uint64_t v362 = v300;
  v361 = v299;
  uint64_t v67 = v51;
  objc_super v68 = v51;
  char v69 = v51;
  char v70 = v51;
  uint64_t v71 = v51;
  char v72 = v51;
  char v73 = v51;
  uint64_t v74 = v51;
  id v75 = v51;
  char v76 = v51;
  long long v77 = v51;
  uint64_t v78 = v51;
  uint64_t v79 = v51;
  long long v80 = v51;
  uint64_t v81 = v51;
  uint64_t v82 = v51;
  char v83 = v51;
  long long v84 = v51;
  uint64_t v85 = v51;
  double v86 = v51;
  char v87 = v51;
  long long v88 = v51;
  uint64_t v89 = v51;
  uint64_t v90 = v51;
  char v91 = v51;
  long long v92 = v51;
  uint64_t v93 = v51;
  uint64_t v94 = v51;
  id v95 = v51;
  uint64_t v96 = v51;
  uint64_t v97 = v51;
  uint64_t v98 = v51;
  uint64_t v99 = v51;
  uint64_t v100 = v51;
  uint64_t v101 = v51;
  uint64_t v102 = v51;
  int v103 = v51;
  int v104 = v51;
  uint64_t v105 = v51;
  unint64_t v106 = v51;
  int v107 = v51;
  uint64_t v108 = v51;
  uint64_t v109 = v51;
  uint64_t v110 = v51;
  unint64_t v111 = v51;
  uint64_t v112 = v51;
  uint64_t v113 = v51;
  uint64_t v114 = v51;
  uint64_t v115 = v51;
  uint64_t v116 = v51;
  int v117 = v51;
  uint64_t v118 = v51;
  uint32_t v119 = v51;
  uint64_t v120 = v51;
  uint64_t v121 = v51;
  unint64_t v122 = v51;
  uint64_t v123 = v51;
  uint64_t v124 = v51;
  uint64_t v125 = v51;
  uint64_t v126 = v51;
  id v412 = v51;
  unint64_t v199 = 0x26985D000uLL;
  uint64_t v297 = 0;
  *(void *)&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_location] = 0;

  unint64_t v202 = 0x26985D000uLL;
  uint64_t v127 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_utilityID];
  *(void *)uint64_t v127 = 0;
  *((void *)v127 + 1) = 0;

  unint64_t v206 = 0x26985D000uLL;
  uint64_t v128 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionID];
  *(void *)uint64_t v128 = 0;
  *((void *)v128 + 1) = 0;

  unint64_t v210 = 0x26985D000uLL;
  uint64_t v129 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accessToken];
  *(void *)uint64_t v129 = 0;
  *((void *)v129 + 1) = 0;

  unint64_t v214 = 0x26985D000uLL;
  uint64_t v130 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_refreshToken];
  *(void *)uint64_t v130 = 0;
  *((void *)v130 + 1) = 0;

  unint64_t v218 = 0x26985D000uLL;
  uint64_t v131 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_timezone];
  *(void *)uint64_t v131 = 0;
  *((void *)v131 + 1) = 0;

  v222 = &qword_26B18C000;
  uint64_t v188 = OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_currentRatePlan;
  uint64_t v132 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  (*(void (**)(char *, void))(*(void *)(v132 - 8) + 56))(&v51[v188], v260);

  v226 = &qword_26B18C000;
  int v133 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_ckFunctionToken];
  *(void *)int v133 = 0;
  *((void *)v133 + 1) = 0;

  uint64_t v230 = &qword_26B18C000;
  int v134 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accountName];
  *(void *)int v134 = 0;
  *((void *)v134 + 1) = 0;

  v234 = &qword_26B18C000;
  uint64_t v135 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accountNumber];
  *(void *)uint64_t v135 = 0;
  *((void *)v135 + 1) = 0;

  uint64_t v238 = &qword_26B18C000;
  uint64_t v136 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_address];
  *(void *)uint64_t v136 = 0;
  *((void *)v136 + 1) = 0;

  uint64_t v242 = &qword_26B18C000;
  uint64_t v137 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_serviceLocationID];
  *(void *)uint64_t v137 = 0;
  *((void *)v137 + 1) = 0;

  v246 = &qword_26B18C000;
  uint64_t v138 = &v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_alternateSupplier];
  *(void *)uint64_t v138 = 0;
  *((void *)v138 + 1) = 0;

  v250 = &qword_26B18C000;
  uint64_t v189 = OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accessTokenExpirationDate;
  uint64_t v190 = sub_24D290638();
  uint64_t v139 = *(void *)(v190 - 8);
  uint64_t v192 = *(void (**)(char *, void))(v139 + 56);
  uint64_t v191 = v139 + 56;
  v192(&v51[v189], v260);

  uint64_t v253 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v192)(&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_utilitySupportedCheckDate], v260, v260, v190);

  int v256 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v192)(&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_amiLastRefreshDate], v260, v260, v190);

  uint64_t v259 = &qword_26B18C000;
  v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_hasExportedEnergy] = 0;

  uint64_t v264 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v192)(&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointNextRefreshDate], v260, v260, v190);

  int v267 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v192)(&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryNextRefreshDate], v260, v260, v190);

  uint64_t v270 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v192)(&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockNextRefreshDate], v260, v260, v190);

  v273 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v192)(&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionCreationDate], v260, v260, v190);

  uint64_t v276 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v192)(&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionStartDate], v260, v260, v190);

  int v279 = &qword_26B18C000;
  ((void (*)(char *, void, void, uint64_t))v192)(&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteTombstone], v260, v260, v190);

  uint64_t v283 = &qword_26B18C000;
  int v285 = 2;
  *(_DWORD *)&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteVersion] = 2;

  uint64_t v287 = &qword_26B18C000;
  *(void *)&v51[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_generationMeters] = v297;

  uint64_t v290 = &qword_26B18C000;
  uint64_t v193 = OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_unknownFields;
  uint64_t v140 = sub_24D2908B8();
  (*(void (**)(char *, void))(*(void *)(v140 - 8) + 56))(&v51[v193], v260);

  uint64_t v194 = OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_encoder;
  sub_24D290488();
  uint64_t v141 = sub_24D290478();
  uint64_t v142 = v296;
  *(void *)&v296[v194] = v141;

  swift_bridgeObjectRetain();
  uint64_t v143 = v330;
  char v144 = &v142[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_ckZoneName];
  *(void *)char v144 = v195;
  *((void *)v144 + 1) = v143;

  swift_bridgeObjectRetain();
  uint64_t v145 = v332;
  uint64_t v146 = &v142[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteID];
  *(void *)uint64_t v146 = v196;
  *((void *)v146 + 1) = v145;

  swift_bridgeObjectRetain();
  uint64_t v147 = v331;
  v148 = &v142[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteName];
  *(void *)v148 = v197;
  *((void *)v148 + 1) = v147;

  swift_bridgeObjectRetain();
  uint64_t v149 = v329;
  uint64_t v150 = &v142[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_state];
  *(void *)uint64_t v150 = v198;
  *((void *)v150 + 1) = v149;

  id v151 = v328;
  v200 = (void **)&v142[*(void *)(v199 + 1080)];
  int v201 = &v360;
  uint64_t v291 = 33;
  uint64_t v292 = 0;
  swift_beginAccess();
  uint64_t v152 = *v200;
  char *v200 = v328;

  swift_endAccess();
  swift_bridgeObjectRetain();
  uint64_t v204 = &v142[*(void *)(v202 + 1088)];
  v205 = &v359;
  swift_beginAccess();
  uint64_t v153 = v204;
  uint64_t v154 = v327;
  *(void *)uint64_t v204 = v203;
  *((void *)v153 + 1) = v154;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  v208 = &v142[*(void *)(v206 + 1096)];
  v209 = &v358;
  swift_beginAccess();
  int v155 = v208;
  uint64_t v156 = v326;
  *(void *)v208 = v207;
  *((void *)v155 + 1) = v156;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  uint64_t v212 = &v142[*(void *)(v210 + 1104)];
  v213 = &v357;
  swift_beginAccess();
  uint64_t v157 = v212;
  uint64_t v158 = v325;
  *(void *)uint64_t v212 = v211;
  *((void *)v157 + 1) = v158;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  int v216 = &v142[*(void *)(v214 + 1112)];
  uint64_t v217 = &v356;
  swift_beginAccess();
  int v159 = v216;
  uint64_t v160 = v324;
  *(void *)int v216 = v215;
  *((void *)v159 + 1) = v160;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  int v220 = &v142[*(void *)(v218 + 1120)];
  int v221 = &v355;
  swift_beginAccess();
  unint64_t v161 = v220;
  uint64_t v162 = v323;
  *(void *)int v220 = v219;
  *((void *)v161 + 1) = v162;
  swift_bridgeObjectRelease();
  swift_endAccess();

  sub_24D24B80C(v322, v223);
  uint64_t v224 = &v142[v222[109]];
  uint64_t v225 = &v354;
  swift_beginAccess();
  sub_24D24BC08(v223, v224);
  swift_endAccess();

  sub_24D229320(v320, v321);
  unint64_t v163 = v321;
  uint64_t v164 = &v142[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointCustomIndex];
  *(void *)uint64_t v164 = v320;
  *((void *)v164 + 1) = v163;

  sub_24D229320(v318, v319);
  unint64_t v165 = v319;
  uint64_t v166 = &v142[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryCustomIndex];
  *(void *)uint64_t v166 = v318;
  *((void *)v166 + 1) = v165;

  sub_24D229320(v316, v317);
  unint64_t v167 = v317;
  uint64_t v168 = &v142[OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockCustomIndex];
  *(void *)uint64_t v168 = v316;
  *((void *)v168 + 1) = v167;

  swift_bridgeObjectRetain();
  v228 = &v142[v226[108]];
  int v229 = &v353;
  swift_beginAccess();
  uint64_t v169 = v228;
  uint64_t v170 = v315;
  *(void *)v228 = v227;
  *((void *)v169 + 1) = v170;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  int v232 = &v142[v230[106]];
  int v233 = &v352;
  swift_beginAccess();
  int v171 = v232;
  uint64_t v172 = v314;
  *(void *)int v232 = v231;
  *((void *)v171 + 1) = v172;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  v236 = &v142[v234[107]];
  uint64_t v237 = &v351;
  swift_beginAccess();
  uint64_t v173 = v236;
  uint64_t v174 = v313;
  *(void *)v236 = v235;
  *((void *)v173 + 1) = v174;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  v240 = &v142[v238[121]];
  v241 = &v350;
  swift_beginAccess();
  v175 = v240;
  uint64_t v176 = v312;
  *(void *)v240 = v239;
  *((void *)v175 + 1) = v176;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  uint64_t v244 = &v142[v242[111]];
  v245 = &v349;
  swift_beginAccess();
  uint64_t v177 = v244;
  uint64_t v178 = v311;
  *(void *)uint64_t v244 = v243;
  *((void *)v177 + 1) = v178;
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRetain();
  uint64_t v248 = &v142[v246[110]];
  v249 = &v348;
  swift_beginAccess();
  v179 = v248;
  uint64_t v180 = v310;
  *(void *)uint64_t v248 = v247;
  *((void *)v179 + 1) = v180;
  swift_bridgeObjectRelease();
  swift_endAccess();

  sub_24D23A408(v309, v280);
  uint64_t v251 = &v142[v250[116]];
  uint64_t v252 = &v347;
  swift_beginAccess();
  sub_24D26FB78(v280, v251);
  swift_endAccess();

  sub_24D23A408(v308, v280);
  uint64_t v254 = &v142[v253[118]];
  int v255 = &v346;
  swift_beginAccess();
  sub_24D26FB78(v280, v254);
  swift_endAccess();

  sub_24D23A408(v307, v280);
  v257 = &v142[v256[112]];
  v258 = &v345;
  swift_beginAccess();
  sub_24D26FB78(v280, v257);
  swift_endAccess();

  v262 = &v142[v259[105]];
  uint64_t v263 = &v344;
  swift_beginAccess();
  char *v262 = v261 & v260;
  swift_endAccess();

  sub_24D23A408(v306, v280);
  uint64_t v265 = &v142[v264[117]];
  uint64_t v266 = &v343;
  swift_beginAccess();
  sub_24D26FB78(v280, v265);
  swift_endAccess();

  sub_24D23A408(v305, v280);
  v268 = &v142[v267[119]];
  v269 = &v342;
  swift_beginAccess();
  sub_24D26FB78(v280, v268);
  swift_endAccess();

  sub_24D23A408(v304, v280);
  uint64_t v271 = &v142[v270[120]];
  uint64_t v272 = &v341;
  swift_beginAccess();
  sub_24D26FB78(v280, v271);
  swift_endAccess();

  sub_24D23A408(v303, v280);
  uint64_t v274 = &v142[v273[128]];
  uint64_t v275 = &v340;
  swift_beginAccess();
  sub_24D26FB78(v280, v274);
  swift_endAccess();

  sub_24D23A408(v302, v280);
  uint64_t v277 = &v142[v276[127]];
  uint64_t v278 = &v339;
  swift_beginAccess();
  sub_24D26FB78(v280, v277);
  swift_endAccess();

  sub_24D23A408(v301, v280);
  uint64_t v281 = &v142[v279[124]];
  uint64_t v282 = &v338;
  swift_beginAccess();
  sub_24D26FB78(v280, v281);
  swift_endAccess();

  uint64_t v284 = (int *)&v142[v283[123]];
  uint64_t v286 = &v337;
  swift_beginAccess();
  *uint64_t v284 = v285;
  swift_endAccess();

  swift_bridgeObjectRetain();
  uint64_t v288 = &v142[v287[126]];
  uint64_t v289 = &v336;
  swift_beginAccess();
  *(void *)uint64_t v288 = v300;
  swift_bridgeObjectRelease();
  swift_endAccess();

  sub_24D2725A0(v299, v293);
  uint64_t v294 = &v142[v290[125]];
  uint64_t v295 = &v335;
  swift_beginAccess();
  sub_24D2727A4(v293, v294);
  swift_endAccess();

  id v298 = v412;
  int v181 = (objc_class *)type metadata accessor for EKEnergySite();
  v334.receiver = v298;
  v334.super_class = v181;
  id v333 = objc_msgSendSuper2(&v334, sel_init);
  id v182 = v333;
  id v412 = v333;
  sub_24D2729D4((uint64_t)v299);
  swift_bridgeObjectRelease();
  sub_24D23A530((uint64_t)v301);
  sub_24D23A530((uint64_t)v302);
  sub_24D23A530((uint64_t)v303);
  sub_24D23A530((uint64_t)v304);
  sub_24D23A530((uint64_t)v305);
  sub_24D23A530((uint64_t)v306);
  sub_24D23A530((uint64_t)v307);
  sub_24D23A530((uint64_t)v308);
  sub_24D23A530((uint64_t)v309);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24D2293AC(v316, v317);
  sub_24D2293AC(v318, v319);
  sub_24D2293AC(v320, v321);
  sub_24D24B9F0((uint64_t)v322);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v333;
}

id EKEnergySite.__allocating_init(coder:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return EKEnergySite.init(coder:)(a1);
}

id EKEnergySite.init(coder:)(void *a1)
{
  id v430 = a1;
  id v2 = v1;
  id v3 = v430;
  id v500 = v2;
  uint64_t v501 = 0;
  v431 = sub_24D279E94;
  unint64_t v432 = "Fatal error";
  v433 = "Unexpectedly found nil while unwrapping an Optional value";
  unint64_t v434 = "EnergyKitFoundation/EKEnergySite.swift";
  v603 = 0;
  v602 = 0;
  v601 = 0;
  v600 = 0;
  uint64_t v599 = 0;
  uint64_t v598 = 0;
  uint64_t v597 = 0;
  uint64_t v596 = 0;
  char v595 = 0;
  char v594 = 0;
  id v592 = 0;
  uint64_t v590 = 0;
  uint64_t v591 = 0;
  uint64_t v588 = 0;
  uint64_t v589 = 0;
  uint64_t v586 = 0;
  uint64_t v587 = 0;
  uint64_t v584 = 0;
  uint64_t v585 = 0;
  id v583 = 0;
  uint64_t v581 = 0;
  uint64_t v582 = 0;
  uint64_t v579 = 0;
  uint64_t v580 = 0;
  uint64_t v577 = 0;
  uint64_t v578 = 0;
  uint64_t v575 = 0;
  uint64_t v576 = 0;
  uint64_t v573 = 0;
  uint64_t v574 = 0;
  v435 = 0;
  id v572 = 0;
  uint64_t v566 = 0;
  unint64_t v567 = 0;
  uint64_t v560 = 0;
  unint64_t v561 = 0;
  uint64_t v554 = 0;
  unint64_t v555 = 0;
  uint64_t v552 = 0;
  uint64_t v553 = 0;
  uint64_t v550 = 0;
  uint64_t v551 = 0;
  uint64_t v548 = 0;
  uint64_t v549 = 0;
  uint64_t v546 = 0;
  uint64_t v547 = 0;
  uint64_t v544 = 0;
  uint64_t v545 = 0;
  uint64_t v542 = 0;
  uint64_t v543 = 0;
  char v541 = 0;
  int v537 = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08);
  unint64_t v436 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  v437 = (char *)&v155 - v436;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
  unint64_t v438 = (*(void *)(*(void *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5);
  v439 = (char *)&v155 - v438;
  uint64_t v440 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64);
  unint64_t v441 = (v440 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v501);
  unint64_t v442 = (char *)&v155 - v441;
  unint64_t v443 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v444 = (char *)&v155 - v443;
  unint64_t v445 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v446 = (char *)&v155 - v445;
  unint64_t v447 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v448 = (char *)&v155 - v447;
  unint64_t v449 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v450 = (char *)&v155 - v449;
  unint64_t v451 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v452 = (char *)&v155 - v451;
  unint64_t v453 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v454 = (char *)&v155 - v453;
  unint64_t v455 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  unint64_t v456 = (char *)&v155 - v455;
  unint64_t v457 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  unint64_t v458 = (char *)&v155 - v457;
  unint64_t v459 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  unint64_t v460 = (char *)&v155 - v459;
  unint64_t v461 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  unint64_t v462 = (char *)&v155 - v461;
  v603 = (char *)&v155 - v461;
  unint64_t v463 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  unint64_t v464 = (char *)&v155 - v463;
  unint64_t v465 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  unint64_t v466 = (char *)&v155 - v465;
  v602 = (char *)&v155 - v465;
  unint64_t v467 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  unint64_t v468 = (char *)&v155 - v467;
  unint64_t v469 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  unint64_t v470 = (char *)&v155 - v469;
  v601 = (char *)&v155 - v469;
  unint64_t v471 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  unint64_t v472 = (char *)&v155 - v471;
  unint64_t v473 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  unint64_t v474 = (char *)&v155 - v473;
  v600 = (char *)&v155 - v473;
  unint64_t v475 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  unint64_t v476 = (char *)&v155 - v475;
  unint64_t v477 = (v41 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  unint64_t v478 = (char *)&v155 - v477;
  uint64_t v599 = (char *)&v155 - v477;
  unint64_t v479 = (v43 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  unint64_t v480 = (char *)&v155 - v479;
  unint64_t v481 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  unint64_t v482 = (char *)&v155 - v481;
  uint64_t v598 = (char *)&v155 - v481;
  unint64_t v483 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  unint64_t v484 = (char *)&v155 - v483;
  unint64_t v485 = (v49 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  unint64_t v486 = (char *)&v155 - v485;
  uint64_t v597 = (char *)&v155 - v485;
  unint64_t v487 = (v51 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  unint64_t v488 = (char *)&v155 - v487;
  unint64_t v489 = (v53 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  unint64_t v490 = (char *)&v155 - v489;
  uint64_t v596 = (char *)&v155 - v489;
  unint64_t v491 = (v55 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  unint64_t v492 = (char *)&v155 - v491;
  unint64_t v493 = (v57 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v56);
  unint64_t v494 = (char *)&v155 - v493;
  char v595 = (char *)&v155 - v493;
  uint64_t v495 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  uint64_t v496 = *(void *)(v495 - 8);
  uint64_t v497 = v495 - 8;
  unint64_t v498 = (*(void *)(v496 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v58 = (void *)MEMORY[0x270FA5388](v500);
  v499 = (char *)&v155 - v498;
  char v594 = (char *)&v155 - v498;
  id v592 = v3;
  id v59 = v58;
  id v593 = v500;
  unint64_t v502 = sub_24D279520();
  uint64_t v503 = sub_24D279588();
  uint64_t v504 = v60;
  uint64_t v505 = sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v505)
  {
    uint64_t v429 = (void *)v505;
  }
  else
  {
    sub_24D290EB8();
    __break(1u);
  }
  id v423 = v429;
  uint64_t v424 = sub_24D290B88();
  uint64_t v425 = v61;
  uint64_t v590 = v424;
  uint64_t v591 = v61;

  uint64_t v426 = sub_24D279588();
  uint64_t v427 = v62;
  uint64_t v428 = sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v428)
  {
    int v422 = (void *)v428;
  }
  else
  {
    sub_24D290EB8();
    __break(1u);
  }
  id v416 = v422;
  uint64_t v417 = sub_24D290B88();
  uint64_t v418 = v63;
  uint64_t v588 = v417;
  uint64_t v589 = v63;

  uint64_t v419 = sub_24D279588();
  uint64_t v420 = v64;
  uint64_t v421 = sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v421)
  {
    double v415 = (void *)v421;
  }
  else
  {
    sub_24D290EB8();
    __break(1u);
  }
  id v409 = v415;
  uint64_t v410 = sub_24D290B88();
  uint64_t v411 = v65;
  uint64_t v586 = v410;
  uint64_t v587 = v65;

  uint64_t v412 = sub_24D279588();
  uint64_t v413 = v66;
  uint64_t v414 = sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v414)
  {
    uint64_t v408 = (void *)v414;
  }
  else
  {
    sub_24D290EB8();
    __break(1u);
  }
  id v398 = v408;
  uint64_t v399 = sub_24D290B88();
  uint64_t v400 = v67;
  uint64_t v584 = v399;
  uint64_t v585 = v67;

  unint64_t v401 = sub_24D22E888();
  uint64_t v402 = sub_24D279588();
  uint64_t v403 = v68;
  id v404 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  id v583 = v404;
  uint64_t v405 = sub_24D279588();
  uint64_t v406 = v69;
  id v407 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v407)
  {
    id v397 = v407;
    id v394 = v407;
    id v70 = v407;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v507)
    {
      uint64_t v392 = v506;
      uint64_t v393 = v507;
    }
    else
    {
      uint64_t v392 = 0;
      uint64_t v393 = 0;
    }
    uint64_t v395 = v392;
    uint64_t v396 = v393;
  }
  else
  {
    uint64_t v395 = 0;
    uint64_t v396 = 0;
  }
  uint64_t v387 = v396;
  uint64_t v388 = v395;
  uint64_t v581 = v395;
  uint64_t v582 = v396;
  uint64_t v389 = sub_24D279588();
  uint64_t v390 = v71;
  id v391 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v391)
  {
    id v386 = v391;
    id v383 = v391;
    id v72 = v391;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v509)
    {
      uint64_t v381 = v508;
      uint64_t v382 = v509;
    }
    else
    {
      uint64_t v381 = 0;
      uint64_t v382 = 0;
    }
    uint64_t v384 = v381;
    uint64_t v385 = v382;
  }
  else
  {
    uint64_t v384 = 0;
    uint64_t v385 = 0;
  }
  uint64_t v376 = v385;
  uint64_t v377 = v384;
  uint64_t v579 = v384;
  uint64_t v580 = v385;
  uint64_t v378 = sub_24D279588();
  uint64_t v379 = v73;
  id v380 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v380)
  {
    id v375 = v380;
    id v372 = v380;
    id v74 = v380;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v511)
    {
      uint64_t v370 = v510;
      uint64_t v371 = v511;
    }
    else
    {
      uint64_t v370 = 0;
      uint64_t v371 = 0;
    }
    uint64_t v373 = v370;
    uint64_t v374 = v371;
  }
  else
  {
    uint64_t v373 = 0;
    uint64_t v374 = 0;
  }
  uint64_t v365 = v374;
  uint64_t v366 = v373;
  uint64_t v577 = v373;
  uint64_t v578 = v374;
  uint64_t v367 = sub_24D279588();
  uint64_t v368 = v75;
  id v369 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v369)
  {
    id v364 = v369;
    id v361 = v369;
    id v76 = v369;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v513)
    {
      uint64_t v359 = v512;
      uint64_t v360 = v513;
    }
    else
    {
      uint64_t v359 = 0;
      uint64_t v360 = 0;
    }
    uint64_t v362 = v359;
    uint64_t v363 = v360;
  }
  else
  {
    uint64_t v362 = 0;
    uint64_t v363 = 0;
  }
  uint64_t v354 = v363;
  uint64_t v355 = v362;
  uint64_t v575 = v362;
  uint64_t v576 = v363;
  uint64_t v356 = sub_24D279588();
  uint64_t v357 = v77;
  id v358 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v358)
  {
    id v353 = v358;
    id v350 = v358;
    id v78 = v358;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v515)
    {
      uint64_t v348 = v514;
      uint64_t v349 = v515;
    }
    else
    {
      uint64_t v348 = 0;
      uint64_t v349 = 0;
    }
    uint64_t v351 = v348;
    uint64_t v352 = v349;
  }
  else
  {
    uint64_t v351 = 0;
    uint64_t v352 = 0;
  }
  uint64_t v79 = v435;
  uint64_t v344 = v352;
  uint64_t v345 = v351;
  uint64_t v573 = v351;
  uint64_t v574 = v352;
  EnergySitePayload.CurrentRatePlan.init()(v499);
  id v80 = v430;
  uint64_t v346 = &v155;
  MEMORY[0x270FA5388](v431);
  sub_24D290848();
  uint64_t v347 = v79;
  if (v79)
  {
    id v156 = v347;

    id v154 = v156;
    id v572 = v156;
  }
  else
  {
  }
  unint64_t v340 = sub_24D279EC0();
  uint64_t v341 = sub_24D279588();
  uint64_t v342 = v81;
  id v343 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v343)
  {
    id v339 = v343;
    id v336 = v343;
    id v82 = v343;
    sub_24D27A1C8();
    sub_24D290FE8();

    if ((v517 & 0xF000000000000000) == 0xF000000000000000)
    {
      uint64_t v334 = 0;
      unint64_t v335 = 0xF000000000000000;
    }
    else
    {
      uint64_t v334 = v516;
      unint64_t v335 = v517;
    }
    uint64_t v337 = v334;
    unint64_t v338 = v335;
  }
  else
  {
    uint64_t v337 = 0;
    unint64_t v338 = 0xF000000000000000;
  }
  uint64_t v568 = v337;
  unint64_t v569 = v338;
  if ((v338 & 0xF000000000000000) == 0xF000000000000000)
  {
    uint64_t v570 = sub_24D290518();
    unint64_t v571 = v83;
    sub_24D279F28((uint64_t)&v568);
  }
  else
  {
    uint64_t v570 = v568;
    unint64_t v571 = v569;
  }
  uint64_t v329 = v570;
  unint64_t v330 = v571;
  uint64_t v566 = v570;
  unint64_t v567 = v571;
  uint64_t v331 = sub_24D279588();
  uint64_t v332 = v84;
  id v333 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v333)
  {
    id v328 = v333;
    id v325 = v333;
    id v85 = v333;
    sub_24D27A1C8();
    sub_24D290FE8();

    if ((v519 & 0xF000000000000000) == 0xF000000000000000)
    {
      uint64_t v323 = 0;
      unint64_t v324 = 0xF000000000000000;
    }
    else
    {
      uint64_t v323 = v518;
      unint64_t v324 = v519;
    }
    uint64_t v326 = v323;
    unint64_t v327 = v324;
  }
  else
  {
    uint64_t v326 = 0;
    unint64_t v327 = 0xF000000000000000;
  }
  uint64_t v562 = v326;
  unint64_t v563 = v327;
  if ((v327 & 0xF000000000000000) == 0xF000000000000000)
  {
    uint64_t v564 = sub_24D290518();
    unint64_t v565 = v86;
    sub_24D279F28((uint64_t)&v562);
  }
  else
  {
    uint64_t v564 = v562;
    unint64_t v565 = v563;
  }
  uint64_t v318 = v564;
  unint64_t v319 = v565;
  uint64_t v560 = v564;
  unint64_t v561 = v565;
  uint64_t v320 = sub_24D279588();
  uint64_t v321 = v87;
  id v322 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v322)
  {
    id v317 = v322;
    id v314 = v322;
    id v88 = v322;
    sub_24D27A1C8();
    sub_24D290FE8();

    if ((v521 & 0xF000000000000000) == 0xF000000000000000)
    {
      uint64_t v312 = 0;
      unint64_t v313 = 0xF000000000000000;
    }
    else
    {
      uint64_t v312 = v520;
      unint64_t v313 = v521;
    }
    uint64_t v315 = v312;
    unint64_t v316 = v313;
  }
  else
  {
    uint64_t v315 = 0;
    unint64_t v316 = 0xF000000000000000;
  }
  uint64_t v556 = v315;
  unint64_t v557 = v316;
  if ((v316 & 0xF000000000000000) == 0xF000000000000000)
  {
    uint64_t v558 = sub_24D290518();
    unint64_t v559 = v89;
    sub_24D279F28((uint64_t)&v556);
  }
  else
  {
    uint64_t v558 = v556;
    unint64_t v559 = v557;
  }
  uint64_t v307 = v558;
  unint64_t v308 = v559;
  uint64_t v554 = v558;
  unint64_t v555 = v559;
  uint64_t v309 = sub_24D279588();
  uint64_t v310 = v90;
  id v311 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v311)
  {
    id v306 = v311;
    id v303 = v311;
    id v91 = v311;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v523)
    {
      uint64_t v301 = v522;
      uint64_t v302 = v523;
    }
    else
    {
      uint64_t v301 = 0;
      uint64_t v302 = 0;
    }
    uint64_t v304 = v301;
    uint64_t v305 = v302;
  }
  else
  {
    uint64_t v304 = 0;
    uint64_t v305 = 0;
  }
  uint64_t v296 = v305;
  uint64_t v297 = v304;
  uint64_t v552 = v304;
  uint64_t v553 = v305;
  uint64_t v298 = sub_24D279588();
  uint64_t v299 = v92;
  id v300 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v300)
  {
    id v295 = v300;
    id v292 = v300;
    id v93 = v300;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v525)
    {
      uint64_t v290 = v524;
      uint64_t v291 = v525;
    }
    else
    {
      uint64_t v290 = 0;
      uint64_t v291 = 0;
    }
    uint64_t v293 = v290;
    uint64_t v294 = v291;
  }
  else
  {
    uint64_t v293 = 0;
    uint64_t v294 = 0;
  }
  uint64_t v285 = v294;
  uint64_t v286 = v293;
  uint64_t v550 = v293;
  uint64_t v551 = v294;
  uint64_t v287 = sub_24D279588();
  uint64_t v288 = v94;
  id v289 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v289)
  {
    id v284 = v289;
    id v281 = v289;
    id v95 = v289;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v527)
    {
      uint64_t v279 = v526;
      uint64_t v280 = v527;
    }
    else
    {
      uint64_t v279 = 0;
      uint64_t v280 = 0;
    }
    uint64_t v282 = v279;
    uint64_t v283 = v280;
  }
  else
  {
    uint64_t v282 = 0;
    uint64_t v283 = 0;
  }
  uint64_t v274 = v283;
  uint64_t v275 = v282;
  uint64_t v548 = v282;
  uint64_t v549 = v283;
  uint64_t v276 = sub_24D279588();
  uint64_t v277 = v96;
  id v278 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v278)
  {
    id v273 = v278;
    id v270 = v278;
    id v97 = v278;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v529)
    {
      uint64_t v268 = v528;
      uint64_t v269 = v529;
    }
    else
    {
      uint64_t v268 = 0;
      uint64_t v269 = 0;
    }
    uint64_t v271 = v268;
    uint64_t v272 = v269;
  }
  else
  {
    uint64_t v271 = 0;
    uint64_t v272 = 0;
  }
  uint64_t v263 = v272;
  uint64_t v264 = v271;
  uint64_t v546 = v271;
  uint64_t v547 = v272;
  uint64_t v265 = sub_24D279588();
  uint64_t v266 = v98;
  id v267 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v267)
  {
    id v262 = v267;
    id v259 = v267;
    id v99 = v267;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v531)
    {
      uint64_t v257 = v530;
      uint64_t v258 = v531;
    }
    else
    {
      uint64_t v257 = 0;
      uint64_t v258 = 0;
    }
    uint64_t v260 = v257;
    uint64_t v261 = v258;
  }
  else
  {
    uint64_t v260 = 0;
    uint64_t v261 = 0;
  }
  uint64_t v252 = v261;
  uint64_t v253 = v260;
  uint64_t v544 = v260;
  uint64_t v545 = v261;
  uint64_t v254 = sub_24D279588();
  uint64_t v255 = v100;
  id v256 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v256)
  {
    id v251 = v256;
    id v248 = v256;
    id v101 = v256;
    sub_24D27A14C();
    sub_24D290FE8();

    if (v533)
    {
      uint64_t v246 = v532;
      uint64_t v247 = v533;
    }
    else
    {
      uint64_t v246 = 0;
      uint64_t v247 = 0;
    }
    uint64_t v249 = v246;
    uint64_t v250 = v247;
  }
  else
  {
    uint64_t v249 = 0;
    uint64_t v250 = 0;
  }
  uint64_t v240 = v250;
  uint64_t v241 = v249;
  uint64_t v542 = v249;
  uint64_t v543 = v250;
  unint64_t v242 = sub_24D279F7C();
  uint64_t v243 = sub_24D279588();
  uint64_t v244 = v102;
  v245 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v245)
  {
    uint64_t v239 = v245;
    id v235 = v245;
    uint64_t v236 = sub_24D290638();
    id v104 = v235;
    sub_24D27A0C8();
    sub_24D290FE8();

    uint64_t v237 = *(void *)(v236 - 8);
    uint64_t v238 = v236 - 8;
    if ((*(unsigned int (**)(char *, uint64_t))(v237 + 48))(v492, 1) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v237 + 56))(v494, 1, 1, v236);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v237 + 32))(v494, v492, v236);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v237 + 56))(v494, 0, 1, v236);
    }
  }
  else
  {
    uint64_t v103 = sub_24D290638();
    (*(void (**)(char *, uint64_t))(*(void *)(v103 - 8) + 56))(v494, 1);
  }
  uint64_t v232 = sub_24D279588();
  uint64_t v233 = v106;
  v234 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v234)
  {
    uint64_t v231 = v234;
    id v227 = v234;
    uint64_t v228 = sub_24D290638();
    id v108 = v227;
    sub_24D27A0C8();
    sub_24D290FE8();

    uint64_t v229 = *(void *)(v228 - 8);
    uint64_t v230 = v228 - 8;
    if ((*(unsigned int (**)(char *, uint64_t))(v229 + 48))(v488, 1) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v229 + 56))(v490, 1, 1, v228);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v229 + 32))(v490, v488, v228);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v229 + 56))(v490, 0, 1, v228);
    }
  }
  else
  {
    uint64_t v107 = sub_24D290638();
    (*(void (**)(char *, uint64_t))(*(void *)(v107 - 8) + 56))(v490, 1);
  }
  uint64_t v224 = sub_24D279588();
  uint64_t v225 = v110;
  v226 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v226)
  {
    uint64_t v223 = v226;
    id v219 = v226;
    uint64_t v220 = sub_24D290638();
    id v112 = v219;
    sub_24D27A0C8();
    sub_24D290FE8();

    uint64_t v221 = *(void *)(v220 - 8);
    uint64_t v222 = v220 - 8;
    if ((*(unsigned int (**)(char *, uint64_t))(v221 + 48))(v484, 1) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v221 + 56))(v486, 1, 1, v220);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v221 + 32))(v486, v484, v220);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v221 + 56))(v486, 0, 1, v220);
    }
  }
  else
  {
    uint64_t v111 = sub_24D290638();
    (*(void (**)(char *, uint64_t))(*(void *)(v111 - 8) + 56))(v486, 1);
  }
  id v114 = v430;
  sub_24D279588();
  uint64_t v213 = v115;
  id v214 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  unsigned int v215 = objc_msgSend(v114, sel_decodeBoolForKey_, v214);

  char v541 = v215 & 1;
  uint64_t v216 = sub_24D279588();
  uint64_t v217 = v116;
  unint64_t v218 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v218)
  {
    uint64_t v212 = v218;
    id v208 = v218;
    uint64_t v209 = sub_24D290638();
    id v118 = v208;
    sub_24D27A0C8();
    sub_24D290FE8();

    uint64_t v210 = *(void *)(v209 - 8);
    uint64_t v211 = v209 - 8;
    if ((*(unsigned int (**)(char *, uint64_t))(v210 + 48))(v480, 1) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v210 + 56))(v482, 1, 1, v209);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v210 + 32))(v482, v480, v209);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v210 + 56))(v482, 0, 1, v209);
    }
  }
  else
  {
    uint64_t v117 = sub_24D290638();
    (*(void (**)(char *, uint64_t))(*(void *)(v117 - 8) + 56))(v482, 1);
  }
  uint64_t v205 = sub_24D279588();
  uint64_t v206 = v120;
  uint64_t v207 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v207)
  {
    uint64_t v204 = v207;
    id v200 = v207;
    uint64_t v201 = sub_24D290638();
    id v122 = v200;
    sub_24D27A0C8();
    sub_24D290FE8();

    uint64_t v202 = *(void *)(v201 - 8);
    uint64_t v203 = v201 - 8;
    if ((*(unsigned int (**)(char *, uint64_t))(v202 + 48))(v476, 1) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v202 + 56))(v478, 1, 1, v201);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v202 + 32))(v478, v476, v201);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v202 + 56))(v478, 0, 1, v201);
    }
  }
  else
  {
    uint64_t v121 = sub_24D290638();
    (*(void (**)(char *, uint64_t))(*(void *)(v121 - 8) + 56))(v478, 1);
  }
  uint64_t v197 = sub_24D279588();
  uint64_t v198 = v124;
  unint64_t v199 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v199)
  {
    uint64_t v196 = v199;
    id v192 = v199;
    uint64_t v193 = sub_24D290638();
    id v126 = v192;
    sub_24D27A0C8();
    sub_24D290FE8();

    uint64_t v194 = *(void *)(v193 - 8);
    uint64_t v195 = v193 - 8;
    if ((*(unsigned int (**)(char *, uint64_t))(v194 + 48))(v472, 1) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v194 + 56))(v474, 1, 1, v193);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v194 + 32))(v474, v472, v193);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v194 + 56))(v474, 0, 1, v193);
    }
  }
  else
  {
    uint64_t v125 = sub_24D290638();
    (*(void (**)(char *, uint64_t))(*(void *)(v125 - 8) + 56))(v474, 1);
  }
  uint64_t v189 = sub_24D279588();
  uint64_t v190 = v128;
  uint64_t v191 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v191)
  {
    uint64_t v188 = v191;
    id v184 = v191;
    uint64_t v185 = sub_24D290638();
    id v130 = v184;
    sub_24D27A0C8();
    sub_24D290FE8();

    uint64_t v186 = *(void *)(v185 - 8);
    uint64_t v187 = v185 - 8;
    if ((*(unsigned int (**)(char *, uint64_t))(v186 + 48))(v468, 1) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v186 + 56))(v470, 1, 1, v185);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v186 + 32))(v470, v468, v185);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v186 + 56))(v470, 0, 1, v185);
    }
  }
  else
  {
    uint64_t v129 = sub_24D290638();
    (*(void (**)(char *, uint64_t))(*(void *)(v129 - 8) + 56))(v470, 1);
  }
  uint64_t v181 = sub_24D279588();
  uint64_t v182 = v132;
  unint64_t v183 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v183)
  {
    uint64_t v180 = v183;
    id v176 = v183;
    uint64_t v177 = sub_24D290638();
    id v134 = v176;
    sub_24D27A0C8();
    sub_24D290FE8();

    uint64_t v178 = *(void *)(v177 - 8);
    uint64_t v179 = v177 - 8;
    if ((*(unsigned int (**)(char *, uint64_t))(v178 + 48))(v464, 1) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v178 + 56))(v466, 1, 1, v177);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v178 + 32))(v466, v464, v177);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v178 + 56))(v466, 0, 1, v177);
    }
  }
  else
  {
    uint64_t v133 = sub_24D290638();
    (*(void (**)(char *, uint64_t))(*(void *)(v133 - 8) + 56))(v466, 1);
  }
  uint64_t v173 = sub_24D279588();
  uint64_t v174 = v136;
  v175 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v175)
  {
    uint64_t v172 = v175;
    id v168 = v175;
    uint64_t v169 = sub_24D290638();
    id v138 = v168;
    sub_24D27A0C8();
    sub_24D290FE8();

    uint64_t v170 = *(void *)(v169 - 8);
    uint64_t v171 = v169 - 8;
    if ((*(unsigned int (**)(char *, uint64_t))(v170 + 48))(v460, 1) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v170 + 56))(v462, 1, 1, v169);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v170 + 32))(v462, v460, v169);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v170 + 56))(v462, 0, 1, v169);
    }
  }
  else
  {
    uint64_t v137 = sub_24D290638();
    (*(void (**)(char *, uint64_t))(*(void *)(v137 - 8) + 56))(v462, 1);
  }
  unint64_t v164 = sub_24D279FE4();
  uint64_t v165 = sub_24D279588();
  uint64_t v166 = v140;
  id v167 = (id)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v167)
  {
    id v163 = v167;
    id v161 = v167;
    id v141 = v167;
    sub_24D27A04C();
    sub_24D290FE8();

    if (v535)
    {
      uint64_t v160 = 0x100000000;
    }
    else
    {
      unsigned int v536 = v534;
      uint64_t v160 = v534;
    }
    uint64_t v162 = v160;
  }
  else
  {
    uint64_t v162 = 0x100000000;
  }
  int v538 = v162;
  char v539 = BYTE4(v162) & 1;
  if ((v162 & 0x100000000) != 0) {
    int v540 = 2;
  }
  else {
    int v540 = v538;
  }
  uint64_t v142 = v252;
  uint64_t v143 = v240;
  char v144 = v452;
  uint64_t v145 = v454;
  uint64_t v146 = v456;
  uint64_t v147 = v458;
  uint64_t v148 = v241;
  int v157 = v540;
  int v537 = v540;
  uint64_t ObjectType = swift_getObjectType();

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v150 = v404;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D24BB5C(v499, v439);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v496 + 56))(v439, 0, 1, v495);
  sub_24D229320(v329, v330);
  sub_24D229320(v318, v319);
  sub_24D229320(v307, v308);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D23A408(v494, v147);
  sub_24D23A408(v490, v146);
  sub_24D23A408(v486, v145);
  sub_24D23A408(v482, v144);
  sub_24D23A408(v478, v450);
  sub_24D23A408(v474, v448);
  sub_24D23A408(v470, v446);
  sub_24D23A408(v466, v444);
  sub_24D23A408(v462, v442);
  uint64_t v151 = sub_24D2908B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v151 - 8) + 56))(v437, 1, 1);
  id v159 = (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *, _BYTE, void *, char *, char *, char *, char *, char *, int, void, char *))(ObjectType + 1152))(v410, v411, v424, v425, v417, v418, v399, v400, v404, v388, v387, v377, v376, v366, v365, v355, v354, v345, v344,
               v439,
               v329,
               v330,
               v318,
               v319,
               v307,
               v308,
               v297,
               v296,
               v286,
               v285,
               v275,
               v274,
               v264,
               v263,
               v253,
               v142,
               v148,
               v143,
               v147,
               v146,
               v145,
               v215 & 1,
               v144,
               v450,
               v448,
               v446,
               v444,
               v442,
               v157,
               0,
               v437);
  id v158 = v593;
  id v152 = v159;
  id v593 = v159;
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  sub_24D23A530((uint64_t)v462);
  sub_24D23A530((uint64_t)v466);
  sub_24D23A530((uint64_t)v470);
  sub_24D23A530((uint64_t)v474);
  sub_24D23A530((uint64_t)v478);
  sub_24D23A530((uint64_t)v482);
  sub_24D23A530((uint64_t)v486);
  sub_24D23A530((uint64_t)v490);
  sub_24D23A530((uint64_t)v494);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24D2293AC(v307, v308);
  sub_24D2293AC(v318, v319);
  sub_24D2293AC(v329, v330);
  sub_24D24BE88((uint64_t)v499);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v159;
}

unint64_t sub_24D279520()
{
  uint64_t v2 = qword_26B18BC50;
  if (!qword_26B18BC50)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26B18BC50);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_24D279588()
{
  return sub_24D290C08();
}

void sub_24D279B3C(uint64_t a1, char *a2)
{
  uint64_t v29 = a2;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  unint64_t v40 = 0;
  uint64_t v30 = 0;
  unint64_t v27 = (*(void *)(*(void *)(sub_24D2908D8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v28 = (char *)&v7 - v27;
  uint64_t v31 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  unint64_t v32 = (*(void *)(*(void *)(v31 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v7 - v32;
  uint64_t v42 = a1;
  uint64_t v41 = v3;
  unint64_t v34 = sub_24D279EC0();
  uint64_t v35 = sub_24D279588();
  uint64_t v36 = v4;
  uint64_t v37 = (void *)sub_24D290DA8();
  swift_bridgeObjectRelease();
  if (v37)
  {
    uint64_t v25 = v37;
    id v20 = v37;
    uint64_t v21 = sub_24D2904E8();
    unint64_t v22 = v5;

    uint64_t v23 = v21;
    unint64_t v24 = v22;
  }
  else
  {
    uint64_t v23 = 0;
    unint64_t v24 = 0xF000000000000000;
  }
  unint64_t v18 = v24;
  uint64_t v19 = v23;
  if ((v24 & 0xF000000000000000) == 0xF000000000000000)
  {
    uint64_t v15 = v26;
  }
  else
  {
    uint64_t v16 = v19;
    unint64_t v17 = v18;
    unint64_t v9 = v18;
    uint64_t v8 = v19;
    uint64_t v39 = v19;
    unint64_t v40 = v18;
    sub_24D229320(v19, v18);
    uint64_t v10 = v38;
    memset(v38, 0, sizeof(v38));
    unint64_t v12 = sub_24D25A860();
    int v11 = sub_24D27A244();
    sub_24D27A25C();
    uint64_t v6 = v26;
    sub_24D2909A8();
    uint64_t v13 = v6;
    uint64_t v14 = v6;
    if (v6)
    {
      uint64_t v7 = v14;
      sub_24D2293AC(v8, v9);
    }
    else
    {
      sub_24D28276C(v33, v29);
      sub_24D2293AC(v8, v9);
      uint64_t v15 = v13;
    }
  }
}

void sub_24D279E94()
{
  sub_24D279B3C(*(void *)(v0 + 16), *(char **)(v0 + 24));
}

unint64_t sub_24D279EC0()
{
  uint64_t v2 = qword_26B18BC30;
  if (!qword_26B18BC30)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26B18BC30);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_24D279F28(uint64_t a1)
{
  if ((*(void *)(a1 + 8) & 0xF000000000000000) != 0xF000000000000000) {
    sub_24D2293AC(*(void *)a1, *(void *)(a1 + 8));
  }
  return a1;
}

unint64_t sub_24D279F7C()
{
  uint64_t v2 = qword_26B18BC38;
  if (!qword_26B18BC38)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26B18BC38);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_24D279FE4()
{
  uint64_t v2 = qword_26B18BC40;
  if (!qword_26B18BC40)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26B18BC40);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_24D27A04C()
{
  uint64_t v2 = qword_26B18BC58;
  if (!qword_26B18BC58)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18BC58);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D27A0C8()
{
  uint64_t v2 = qword_26985D470;
  if (!qword_26985D470)
  {
    sub_24D290638();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D470);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D27A14C()
{
  uint64_t v2 = qword_26B18B388;
  if (!qword_26B18B388)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18B388);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D27A1C8()
{
  uint64_t v2 = qword_26B18BB40;
  if (!qword_26B18BB40)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26B18BB40);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D27A244()
{
  return 0;
}

uint64_t sub_24D27A25C()
{
  return sub_24D2908C8();
}

void sub_24D27A2BC(void *a1)
{
  id v2 = a1;
  id v3 = v1;
  sub_24D290848();
}

uint64_t sub_24D27A37C(void *a1, void *a2)
{
  id v387 = a1;
  uint64_t v384 = a2;
  uint64_t v397 = 0;
  uint64_t v396 = 0;
  uint64_t v394 = 0;
  unint64_t v395 = 0;
  id v393 = 0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
  uint64_t v344 = *(void *)(*(void *)(v3 - 8) + 64);
  unint64_t v345 = (v344 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v3);
  uint64_t v346 = (char *)&v130 - v345;
  unint64_t v347 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v130 - v345);
  uint64_t v348 = (char *)&v130 - v347;
  unint64_t v349 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v130 - v347);
  id v350 = (char *)&v130 - v349;
  unint64_t v351 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v130 - v349);
  uint64_t v352 = (char *)&v130 - v351;
  unint64_t v353 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v130 - v351);
  uint64_t v354 = (char *)&v130 - v353;
  unint64_t v355 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v130 - v353);
  uint64_t v356 = (char *)&v130 - v355;
  unint64_t v357 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v130 - v355);
  id v358 = (char *)&v130 - v357;
  unint64_t v359 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v130 - v357);
  uint64_t v360 = (char *)&v130 - v359;
  uint64_t v361 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  uint64_t v362 = *(void *)(v361 - 8);
  uint64_t v363 = v361 - 8;
  unint64_t v364 = (*(void *)(v362 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v361);
  uint64_t v365 = (char *)&v130 - v364;
  unint64_t v366 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8) - 8) + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = MEMORY[0x270FA5388](v387);
  uint64_t v367 = (char *)&v130 - v366;
  uint64_t v397 = v11;
  uint64_t v396 = a2;
  uint64_t v12 = *a2;
  uint64_t v390 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((v12 & *MEMORY[0x263F8EED0]) + 0x178))();
  uint64_t v13 = v384;
  uint64_t v368 = v14;
  uint64_t v371 = sub_24D290B78();
  swift_bridgeObjectRelease();
  sub_24D279588();
  uint64_t v369 = v15;
  id v370 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  unint64_t v386 = 0x1F62CD000uLL;
  objc_msgSend(v387, (SEL)0x1F62CD9C5, v371, v370);

  uint64_t v16 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v13 & *v390) + 0x160))(v16);
  unint64_t v17 = v384;
  uint64_t v372 = v18;
  uint64_t v375 = sub_24D290B78();
  swift_bridgeObjectRelease();
  sub_24D279588();
  uint64_t v373 = v19;
  id v374 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, (SEL)(v386 + 2501), v375, v374);

  uint64_t v20 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v17 & *v390) + 0x190))(v20);
  uint64_t v21 = v384;
  uint64_t v376 = v22;
  uint64_t v379 = sub_24D290B78();
  swift_bridgeObjectRelease();
  sub_24D279588();
  uint64_t v377 = v23;
  id v378 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, (SEL)(v386 + 2501), v379, v378);

  uint64_t v24 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v21 & *v390) + 0x1A8))(v24);
  uint64_t v25 = v384;
  uint64_t v380 = v26;
  uint64_t v383 = sub_24D290B78();
  swift_bridgeObjectRelease();
  sub_24D279588();
  uint64_t v381 = v27;
  id v382 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, (SEL)(v386 + 2501), v383, v382);

  uint64_t v28 = swift_unknownObjectRelease();
  uint64_t v29 = (*(uint64_t (**)(uint64_t))((*v25 & *v390) + 0x1C0))(v28);
  uint64_t v30 = v384;
  uint64_t v389 = v29;
  sub_24D279588();
  uint64_t v385 = v31;
  id v388 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, (SEL)(v386 + 2501), v389, v388);

  uint64_t v32 = swift_unknownObjectRelease();
  uint64_t v391 = (*(uint64_t (**)(uint64_t))((*v30 & *v390) + 0x1D8))(v32);
  uint64_t v392 = v33;
  if (v33)
  {
    uint64_t v341 = v391;
    uint64_t v342 = v392;
    uint64_t v338 = v392;
    uint64_t v339 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v340 = v339;
  }
  else
  {
    uint64_t v340 = 0;
  }
  unint64_t v34 = v384;
  uint64_t v335 = v340;
  sub_24D279588();
  uint64_t v333 = v35;
  id v334 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v335, v334);

  uint64_t v36 = swift_unknownObjectRelease();
  uint64_t v336 = (*(uint64_t (**)(uint64_t))((*v34 & *MEMORY[0x263F8EED0]) + 0x1F0))(v36);
  uint64_t v337 = v37;
  if (v37)
  {
    uint64_t v331 = v336;
    uint64_t v332 = v337;
    uint64_t v328 = v337;
    uint64_t v329 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v330 = v329;
  }
  else
  {
    uint64_t v330 = 0;
  }
  uint64_t v38 = v384;
  uint64_t v325 = v330;
  sub_24D279588();
  uint64_t v323 = v39;
  id v324 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v325, v324);

  uint64_t v40 = swift_unknownObjectRelease();
  uint64_t v326 = (*(uint64_t (**)(uint64_t))((*v38 & *MEMORY[0x263F8EED0]) + 0x208))(v40);
  uint64_t v327 = v41;
  if (v41)
  {
    uint64_t v321 = v326;
    uint64_t v322 = v327;
    uint64_t v318 = v327;
    uint64_t v319 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v320 = v319;
  }
  else
  {
    uint64_t v320 = 0;
  }
  uint64_t v42 = v384;
  uint64_t v315 = v320;
  sub_24D279588();
  uint64_t v313 = v43;
  id v314 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v315, v314);

  uint64_t v44 = swift_unknownObjectRelease();
  uint64_t v316 = (*(uint64_t (**)(uint64_t))((*v42 & *MEMORY[0x263F8EED0]) + 0x220))(v44);
  uint64_t v317 = v45;
  if (v45)
  {
    uint64_t v311 = v316;
    uint64_t v312 = v317;
    uint64_t v308 = v317;
    uint64_t v309 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v310 = v309;
  }
  else
  {
    uint64_t v310 = 0;
  }
  uint64_t v46 = v384;
  uint64_t v305 = v310;
  sub_24D279588();
  uint64_t v303 = v47;
  id v304 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v305, v304);

  uint64_t v48 = swift_unknownObjectRelease();
  uint64_t v306 = (*(uint64_t (**)(uint64_t))((*v46 & *MEMORY[0x263F8EED0]) + 0x238))(v48);
  uint64_t v307 = v49;
  if (v49)
  {
    uint64_t v301 = v306;
    uint64_t v302 = v307;
    uint64_t v298 = v307;
    uint64_t v299 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v300 = v299;
  }
  else
  {
    uint64_t v300 = 0;
  }
  uint64_t v50 = v384;
  uint64_t v296 = v300;
  sub_24D279588();
  uint64_t v294 = v51;
  id v295 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v296, v295);

  uint64_t v52 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v50 & *MEMORY[0x263F8EED0]) + 0x250))(v52);
  if ((*(uint64_t (**)(char *, uint64_t, uint64_t))(v362 + 48))(v367, 1, v361) == 0)
  {
    sub_24D24BB5C(v367, v365);
    sub_24D24B9F0((uint64_t)v367);
    unint64_t v284 = sub_24D25A860();
    sub_24D27A244();
    uint64_t v53 = v343;
    uint64_t v54 = sub_24D2909B8();
    uint64_t v285 = (uint64_t)v53;
    uint64_t v286 = v54;
    unint64_t v287 = v55;
    uint64_t v288 = v53;
    if (v53)
    {
      id v135 = v288;
      uint64_t v136 = 0;
      sub_24D24BE88((uint64_t)v365);
      id v127 = v135;
      id v393 = v135;
      uint64_t v131 = sub_24D290518();
      unint64_t v130 = v128;
      uint64_t v134 = sub_24D2904C8();
      sub_24D2293AC(v131, v130);
      sub_24D279588();
      uint64_t v132 = v129;
      id v133 = (id)sub_24D290B78();
      swift_bridgeObjectRelease();
      objc_msgSend(v387, sel_encodeObject_forKey_, v134, v133);

      swift_unknownObjectRelease();
      uint64_t v272 = v136;
      goto LABEL_24;
    }
    unint64_t v283 = v287;
    uint64_t v282 = v286;
    sub_24D24BE88((uint64_t)v365);
    uint64_t v291 = v282;
    unint64_t v292 = v283;
    uint64_t v293 = v285;
  }
  else
  {
    uint64_t v289 = 0;
    unint64_t v290 = 0xF000000000000000;
    sub_24D24B9F0((uint64_t)v367);
    uint64_t v291 = v289;
    unint64_t v292 = v290;
    uint64_t v293 = (uint64_t)v343;
  }
  uint64_t v279 = v293;
  unint64_t v281 = v292;
  uint64_t v280 = v291;
  uint64_t v394 = v291;
  unint64_t v395 = v292;
  sub_24D2826D4(v291, v292);
  if ((v281 & 0xF000000000000000) == 0xF000000000000000)
  {
    uint64_t v276 = 0;
  }
  else
  {
    uint64_t v277 = v280;
    unint64_t v278 = v281;
    unint64_t v273 = v281;
    uint64_t v274 = v280;
    uint64_t v275 = sub_24D2904C8();
    sub_24D2293AC(v274, v273);
    uint64_t v276 = v275;
  }
  uint64_t v271 = v276;
  sub_24D279588();
  uint64_t v269 = v56;
  id v270 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v271, v270);

  swift_unknownObjectRelease();
  sub_24D282720(v280, v281);
  uint64_t v272 = v279;
LABEL_24:
  uint64_t v249 = v272;
  uint64_t v57 = *v384;
  uint64_t v266 = (void *)MEMORY[0x263F8EED0];
  uint64_t v58 = (*(uint64_t (**)(void))((v57 & *MEMORY[0x263F8EED0]) + 0x268))();
  id v59 = v384;
  uint64_t v251 = v58;
  unint64_t v250 = v60;
  uint64_t v254 = sub_24D2904C8();
  sub_24D2293AC(v251, v250);
  sub_24D279588();
  uint64_t v252 = v61;
  id v253 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  unint64_t v263 = 0x1F62CD000uLL;
  objc_msgSend(v387, (SEL)0x1F62CD9C5, v254, v253);

  uint64_t v62 = swift_unknownObjectRelease();
  uint64_t v63 = (*(uint64_t (**)(uint64_t))((*v59 & *v266) + 0x280))(v62);
  uint64_t v64 = v384;
  uint64_t v256 = v63;
  unint64_t v255 = v65;
  uint64_t v259 = sub_24D2904C8();
  sub_24D2293AC(v256, v255);
  sub_24D279588();
  uint64_t v257 = v66;
  id v258 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, (SEL)(v263 + 2501), v259, v258);

  uint64_t v67 = swift_unknownObjectRelease();
  uint64_t v68 = (*(uint64_t (**)(uint64_t))((*v64 & *v266) + 0x298))(v67);
  uint64_t v69 = v384;
  uint64_t v261 = v68;
  unint64_t v260 = v70;
  uint64_t v265 = sub_24D2904C8();
  sub_24D2293AC(v261, v260);
  sub_24D279588();
  uint64_t v262 = v71;
  id v264 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, (SEL)(v263 + 2501), v265, v264);

  uint64_t v72 = swift_unknownObjectRelease();
  uint64_t v267 = (*(uint64_t (**)(uint64_t))((*v69 & *v266) + 0x2B0))(v72);
  uint64_t v268 = v73;
  if (v73)
  {
    uint64_t v247 = v267;
    uint64_t v248 = v268;
    uint64_t v244 = v268;
    uint64_t v245 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v246 = v245;
  }
  else
  {
    uint64_t v246 = 0;
  }
  id v74 = v384;
  uint64_t v241 = v246;
  sub_24D279588();
  uint64_t v239 = v75;
  id v240 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v241, v240);

  uint64_t v76 = swift_unknownObjectRelease();
  uint64_t v242 = (*(uint64_t (**)(uint64_t))((*v74 & *MEMORY[0x263F8EED0]) + 0x2C8))(v76);
  uint64_t v243 = v77;
  if (v77)
  {
    uint64_t v237 = v242;
    uint64_t v238 = v243;
    uint64_t v234 = v243;
    uint64_t v235 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v236 = v235;
  }
  else
  {
    uint64_t v236 = 0;
  }
  id v78 = v384;
  uint64_t v231 = v236;
  sub_24D279588();
  uint64_t v229 = v79;
  id v230 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v231, v230);

  uint64_t v80 = swift_unknownObjectRelease();
  uint64_t v232 = (*(uint64_t (**)(uint64_t))((*v78 & *MEMORY[0x263F8EED0]) + 0x2E0))(v80);
  uint64_t v233 = v81;
  if (v81)
  {
    uint64_t v227 = v232;
    uint64_t v228 = v233;
    uint64_t v224 = v233;
    uint64_t v225 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v226 = v225;
  }
  else
  {
    uint64_t v226 = 0;
  }
  id v82 = v384;
  uint64_t v221 = v226;
  sub_24D279588();
  uint64_t v219 = v83;
  id v220 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v221, v220);

  uint64_t v84 = swift_unknownObjectRelease();
  uint64_t v222 = (*(uint64_t (**)(uint64_t))((*v82 & *MEMORY[0x263F8EED0]) + 0x2F8))(v84);
  uint64_t v223 = v85;
  if (v85)
  {
    uint64_t v217 = v222;
    uint64_t v218 = v223;
    uint64_t v214 = v223;
    uint64_t v215 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v216 = v215;
  }
  else
  {
    uint64_t v216 = 0;
  }
  unint64_t v86 = v384;
  uint64_t v211 = v216;
  sub_24D279588();
  uint64_t v209 = v87;
  id v210 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v211, v210);

  uint64_t v88 = swift_unknownObjectRelease();
  uint64_t v212 = (*(uint64_t (**)(uint64_t))((*v86 & *MEMORY[0x263F8EED0]) + 0x310))(v88);
  uint64_t v213 = v89;
  if (v89)
  {
    uint64_t v207 = v212;
    uint64_t v208 = v213;
    uint64_t v204 = v213;
    uint64_t v205 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v206 = v205;
  }
  else
  {
    uint64_t v206 = 0;
  }
  uint64_t v90 = v384;
  uint64_t v201 = v206;
  sub_24D279588();
  uint64_t v199 = v91;
  id v200 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v201, v200);

  uint64_t v92 = swift_unknownObjectRelease();
  uint64_t v202 = (*(uint64_t (**)(uint64_t))((*v90 & *MEMORY[0x263F8EED0]) + 0x328))(v92);
  uint64_t v203 = v93;
  if (v93)
  {
    uint64_t v197 = v202;
    uint64_t v198 = v203;
    uint64_t v194 = v203;
    uint64_t v195 = sub_24D290B78();
    swift_bridgeObjectRelease();
    uint64_t v196 = v195;
  }
  else
  {
    uint64_t v196 = 0;
  }
  uint64_t v94 = v384;
  uint64_t v188 = v196;
  sub_24D279588();
  uint64_t v186 = v95;
  id v187 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v188, v187);

  uint64_t v96 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v94 & *MEMORY[0x263F8EED0]) + 0x340))(v96);
  uint64_t v189 = sub_24D290638();
  uint64_t v190 = *(void *)(v189 - 8);
  uint64_t v191 = v189 - 8;
  id v192 = *(unsigned int (**)(char *, uint64_t))(v190 + 48);
  uint64_t v193 = v190 + 48;
  if (v192(v360, 1) == 1)
  {
    uint64_t v185 = 0;
  }
  else
  {
    uint64_t v184 = sub_24D2905A8();
    (*(void (**)(char *, uint64_t))(v190 + 8))(v360, v189);
    uint64_t v185 = v184;
  }
  id v97 = v384;
  uint64_t v183 = v185;
  sub_24D279588();
  uint64_t v181 = v98;
  id v182 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v183, v182);

  uint64_t v99 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v97 & *MEMORY[0x263F8EED0]) + 0x370))(v99);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v192)(v358, 1, v189) == 1)
  {
    uint64_t v180 = 0;
  }
  else
  {
    uint64_t v179 = sub_24D2905A8();
    (*(void (**)(char *, uint64_t))(v190 + 8))(v358, v189);
    uint64_t v180 = v179;
  }
  uint64_t v100 = v384;
  uint64_t v173 = v180;
  sub_24D279588();
  uint64_t v171 = v101;
  id v172 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v173, v172);

  uint64_t v102 = swift_unknownObjectRelease();
  uint64_t v103 = *v100;
  uint64_t v177 = (void *)MEMORY[0x263F8EED0];
  int v104 = (*(uint64_t (**)(uint64_t))((v103 & *MEMORY[0x263F8EED0]) + 0x388))(v102);
  uint64_t v105 = v384;
  int v175 = v104;
  sub_24D279588();
  uint64_t v174 = v106;
  id v176 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  unsigned int v178 = 1;
  objc_msgSend(v387, sel_encodeBool_forKey_, v175 & 1, v176);

  (*(void (**)(void))((*v105 & *v177) + 0x3A0))();
  if (((unsigned int (*)(char *, void, uint64_t))v192)(v356, v178, v189) == 1)
  {
    uint64_t v170 = 0;
  }
  else
  {
    uint64_t v169 = sub_24D2905A8();
    (*(void (**)(char *, uint64_t))(v190 + 8))(v356, v189);
    uint64_t v170 = v169;
  }
  uint64_t v107 = v384;
  uint64_t v168 = v170;
  sub_24D279588();
  uint64_t v166 = v108;
  id v167 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v168, v167);

  uint64_t v109 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v107 & *MEMORY[0x263F8EED0]) + 0x3B8))(v109);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v192)(v354, 1, v189) == 1)
  {
    uint64_t v165 = 0;
  }
  else
  {
    uint64_t v164 = sub_24D2905A8();
    (*(void (**)(char *, uint64_t))(v190 + 8))(v354, v189);
    uint64_t v165 = v164;
  }
  uint64_t v110 = v384;
  uint64_t v163 = v165;
  sub_24D279588();
  uint64_t v161 = v111;
  id v162 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v163, v162);

  uint64_t v112 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v110 & *MEMORY[0x263F8EED0]) + 0x3D0))(v112);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v192)(v352, 1, v189) == 1)
  {
    uint64_t v160 = 0;
  }
  else
  {
    uint64_t v159 = sub_24D2905A8();
    (*(void (**)(char *, uint64_t))(v190 + 8))(v352, v189);
    uint64_t v160 = v159;
  }
  uint64_t v113 = v384;
  uint64_t v158 = v160;
  sub_24D279588();
  uint64_t v156 = v114;
  id v157 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v158, v157);

  uint64_t v115 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v113 & *MEMORY[0x263F8EED0]) + 0x3E8))(v115);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v192)(v350, 1, v189) == 1)
  {
    uint64_t v155 = 0;
  }
  else
  {
    uint64_t v154 = sub_24D2905A8();
    (*(void (**)(char *, uint64_t))(v190 + 8))(v350, v189);
    uint64_t v155 = v154;
  }
  uint64_t v116 = v384;
  uint64_t v153 = v155;
  sub_24D279588();
  uint64_t v151 = v117;
  id v152 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v153, v152);

  uint64_t v118 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v116 & *MEMORY[0x263F8EED0]) + 0x400))(v118);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v192)(v348, 1, v189) == 1)
  {
    uint64_t v150 = 0;
  }
  else
  {
    uint64_t v149 = sub_24D2905A8();
    (*(void (**)(char *, uint64_t))(v190 + 8))(v348, v189);
    uint64_t v150 = v149;
  }
  uint32_t v119 = v384;
  uint64_t v148 = v150;
  sub_24D279588();
  uint64_t v146 = v120;
  id v147 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, sel_encodeObject_forKey_, v148, v147);

  uint64_t v121 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v119 & *MEMORY[0x263F8EED0]) + 0x418))(v121);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v192)(v346, 1, v189) == 1)
  {
    uint64_t v145 = 0;
  }
  else
  {
    uint64_t v144 = sub_24D2905A8();
    (*(void (**)(char *, uint64_t))(v190 + 8))(v346, v189);
    uint64_t v145 = v144;
  }
  id v122 = v384;
  uint64_t v139 = v145;
  sub_24D279588();
  uint64_t v137 = v123;
  id v138 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  unint64_t v141 = 0x1F62CD000uLL;
  objc_msgSend(v387, (SEL)0x1F62CD9C5, v139, v138);

  uint64_t v124 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((*v122 & *MEMORY[0x263F8EED0]) + 0x430))(v124);
  uint64_t v143 = sub_24D291008();
  sub_24D279588();
  uint64_t v140 = v125;
  id v142 = (id)sub_24D290B78();
  swift_bridgeObjectRelease();
  objc_msgSend(v387, (SEL)(v141 + 2501), v143, v142);

  return swift_unknownObjectRelease();
}

uint64_t sub_24D27CD7C()
{
  return sub_24D27A37C(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

BOOL sub_24D27CE00(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    case 4:
      uint64_t v4 = 4;
      break;
    case 5:
      uint64_t v4 = 5;
      break;
    case 6:
      uint64_t v4 = 6;
      break;
    case 7:
      uint64_t v4 = 7;
      break;
    case 8:
      uint64_t v4 = 8;
      break;
    case 9:
      uint64_t v4 = 9;
      break;
    case 10:
      uint64_t v4 = 10;
      break;
    case 11:
      uint64_t v4 = 11;
      break;
    case 12:
      uint64_t v4 = 12;
      break;
    case 13:
      uint64_t v4 = 13;
      break;
    case 14:
      uint64_t v4 = 14;
      break;
    case 15:
      uint64_t v4 = 15;
      break;
    case 16:
      uint64_t v4 = 16;
      break;
    case 17:
      uint64_t v4 = 17;
      break;
    case 18:
      uint64_t v4 = 18;
      break;
    case 19:
      uint64_t v4 = 19;
      break;
    case 20:
      uint64_t v4 = 20;
      break;
    case 21:
      uint64_t v4 = 21;
      break;
    case 22:
      uint64_t v4 = 22;
      break;
    case 23:
      uint64_t v4 = 23;
      break;
    case 24:
      uint64_t v4 = 24;
      break;
    case 25:
      uint64_t v4 = 25;
      break;
    case 26:
      uint64_t v4 = 26;
      break;
    case 27:
      uint64_t v4 = 27;
      break;
    case 28:
      uint64_t v4 = 28;
      break;
    case 29:
      uint64_t v4 = 29;
      break;
    case 30:
      uint64_t v4 = 30;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    case 4:
      uint64_t v3 = 4;
      break;
    case 5:
      uint64_t v3 = 5;
      break;
    case 6:
      uint64_t v3 = 6;
      break;
    case 7:
      uint64_t v3 = 7;
      break;
    case 8:
      uint64_t v3 = 8;
      break;
    case 9:
      uint64_t v3 = 9;
      break;
    case 10:
      uint64_t v3 = 10;
      break;
    case 11:
      uint64_t v3 = 11;
      break;
    case 12:
      uint64_t v3 = 12;
      break;
    case 13:
      uint64_t v3 = 13;
      break;
    case 14:
      uint64_t v3 = 14;
      break;
    case 15:
      uint64_t v3 = 15;
      break;
    case 16:
      uint64_t v3 = 16;
      break;
    case 17:
      uint64_t v3 = 17;
      break;
    case 18:
      uint64_t v3 = 18;
      break;
    case 19:
      uint64_t v3 = 19;
      break;
    case 20:
      uint64_t v3 = 20;
      break;
    case 21:
      uint64_t v3 = 21;
      break;
    case 22:
      uint64_t v3 = 22;
      break;
    case 23:
      uint64_t v3 = 23;
      break;
    case 24:
      uint64_t v3 = 24;
      break;
    case 25:
      uint64_t v3 = 25;
      break;
    case 26:
      uint64_t v3 = 26;
      break;
    case 27:
      uint64_t v3 = 27;
      break;
    case 28:
      uint64_t v3 = 28;
      break;
    case 29:
      uint64_t v3 = 29;
      break;
    case 30:
      uint64_t v3 = 30;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t sub_24D27D278()
{
  return sub_24D290FF8();
}

uint64_t sub_24D27D4F4()
{
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v32 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v32)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 0;
LABEL_64:
    swift_bridgeObjectRelease();
    return v33;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v31 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v31)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 1;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v30 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 2;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v29 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v29)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 3;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v28 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v28)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 4;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v27 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v27)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 5;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v26 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v26)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 6;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v25 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 7;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v24 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v24)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 8;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v23 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v23)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 9;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v22 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v22)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 10;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v21 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 11;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v20 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v20)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 12;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v19 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v19)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 13;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v18 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 14;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v17 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 15;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v16 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 16;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v15 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 17;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v14 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 18;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v13 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 19;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v12 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 20;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v11 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 21;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v10 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 22;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v9 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 23;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v8 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 24;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v7 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 25;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v6 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 26;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v5 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 27;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v4 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 28;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v3 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 29;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D290C08();
  swift_bridgeObjectRetain();
  char v2 = sub_24D290C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v33 = 30;
    goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 31;
}

uint64_t sub_24D27E7D0()
{
  return 31;
}

uint64_t sub_24D27E7E8()
{
  return sub_24D290E68();
}

unint64_t sub_24D27E834()
{
  uint64_t v2 = qword_26985D478;
  if (!qword_26985D478)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D478);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D27E8B4()
{
  return 0;
}

BOOL sub_24D27E8D0(char *a1, char *a2)
{
  return sub_24D27CE00(*a1, *a2);
}

uint64_t sub_24D27E8F4()
{
  return sub_24D27E7E8();
}

uint64_t sub_24D27E910()
{
  return sub_24D27D278();
}

uint64_t sub_24D27E92C()
{
  return sub_24D279588();
}

uint64_t sub_24D27E948@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24D27D4F4();
  *a1 = result;
  return result;
}

uint64_t sub_24D27E974()
{
  return sub_24D27E8B4();
}

uint64_t sub_24D27E994@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24D27E7D0();
  *a1 = result;
  return result;
}

uint64_t sub_24D27E9C0()
{
  return sub_24D291038();
}

unint64_t sub_24D27E9F0()
{
  uint64_t v2 = qword_26985D480;
  if (!qword_26985D480)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D480);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D27EA70()
{
  return sub_24D291048();
}

uint64_t sub_24D27EAA0()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_encoder);
  swift_retain();
  return v2;
}

uint64_t sub_24D27EAE0()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v14[1] = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  id v17 = 0;
  id v10 = self;
  id v0 = v12;
  v14[0] = 0;
  id v13 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v12, 1, v14);
  id v11 = v14[0];
  id v1 = v14[0];
  uint64_t v2 = v17;
  id v17 = v11;

  swift_unknownObjectRelease();
  if (v13)
  {
    uint64_t v9 = sub_24D2904E8();
    uint64_t v15 = v9;
    uint64_t v16 = v3;

    return v9;
  }
  else
  {
    id v7 = v17;
    id v8 = (id)sub_24D2904A8();

    swift_willThrow();
    id v5 = v8;
    swift_willThrow();

    return v6;
  }
}

uint64_t static EKEnergySite.unarchive(data:)(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = 0;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  sub_24D2331B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985D490);
  sub_24D290FA8();
  *uint64_t v2 = type metadata accessor for EKEnergySite();
  sub_24D22AD58();
  sub_24D290D98();
  if (v9)
  {
    swift_bridgeObjectRelease();
    id v4 = v9;
    swift_willThrow();

    return v5;
  }
  else
  {
    swift_bridgeObjectRelease();
    if (v12)
    {
      if (swift_dynamicCast()) {
        uint64_t v8 = v10;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v7 = v8;
    }
    else
    {
      sub_24D268D38((uint64_t)v11);
      uint64_t v7 = 0;
    }
    if (v7) {
      return v7;
    }
    else {
      return 0;
    }
  }
}

id EKEnergySite.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t EKEnergySite.init()()
{
  if (!"EnergyKitFoundation.EKEnergySite")
  {
    sub_24D290EB8();
    __break(1u);
  }
  uint64_t result = sub_24D26911C((uint64_t)"EnergyKitFoundation.EKEnergySite", 32, (unint64_t)"init()", 6, 2, (unint64_t)"EnergyKitFoundation/EKEnergySite.swift", 38, 2, v1, 0x11uLL, 0xEuLL);
  __break(1u);
  return result;
}

id EKEnergySite.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEnergySite();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D27F2F4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKEnergySite();
  uint64_t result = sub_24D290E88();
  *a1 = result;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_24D27F33C(id *a1)
{
}

unint64_t sub_24D27F368()
{
  return sub_24D27F380();
}

unint64_t sub_24D27F380()
{
  uint64_t v2 = qword_26985D498;
  if (!qword_26985D498)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D498);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D27F400()
{
  return sub_24D27F418();
}

unint64_t sub_24D27F418()
{
  uint64_t v2 = qword_26985D4A0;
  if (!qword_26985D4A0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D4A0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D27F498()
{
  return sub_24D27F4B0();
}

unint64_t sub_24D27F4B0()
{
  uint64_t v2 = qword_26985D4A8;
  if (!qword_26985D4A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D4A8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D27F530()
{
  return MEMORY[0x263F8D1F8];
}

uint64_t sub_24D27F53C()
{
  return type metadata accessor for EKEnergySite();
}

uint64_t sub_24D27F558()
{
  uint64_t updated = sub_24D25C894();
  if (v0 <= 0x3F)
  {
    uint64_t updated = sub_24D281EC0();
    if (v1 <= 0x3F)
    {
      uint64_t updated = sub_24D281F68();
      if (v2 <= 0x3F)
      {
        uint64_t updated = swift_updateClassMetadata2();
        if (!updated) {
          return 0;
        }
      }
    }
  }
  return updated;
}

uint64_t method lookup function for EKEnergySite()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKEnergySite.siteID.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x160))();
}

uint64_t dispatch thunk of EKEnergySite.siteID.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x168))();
}

uint64_t dispatch thunk of EKEnergySite.siteID.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x170))();
}

uint64_t dispatch thunk of EKEnergySite.siteName.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x178))();
}

uint64_t dispatch thunk of EKEnergySite.siteName.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x180))();
}

uint64_t dispatch thunk of EKEnergySite.siteName.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x188))();
}

uint64_t dispatch thunk of EKEnergySite.ckZoneName.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x190))();
}

uint64_t dispatch thunk of EKEnergySite.ckZoneName.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x198))();
}

uint64_t dispatch thunk of EKEnergySite.ckZoneName.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1A0))();
}

uint64_t dispatch thunk of EKEnergySite.state.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1A8))();
}

uint64_t dispatch thunk of EKEnergySite.state.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1B0))();
}

uint64_t dispatch thunk of EKEnergySite.state.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1B8))();
}

uint64_t dispatch thunk of EKEnergySite.location.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1C0))();
}

uint64_t dispatch thunk of EKEnergySite.location.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1C8))();
}

uint64_t dispatch thunk of EKEnergySite.location.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1D0))();
}

uint64_t dispatch thunk of EKEnergySite.utilityID.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1D8))();
}

uint64_t dispatch thunk of EKEnergySite.utilityID.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1E0))();
}

uint64_t dispatch thunk of EKEnergySite.utilityID.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1E8))();
}

uint64_t dispatch thunk of EKEnergySite.subscriptionID.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1F0))();
}

uint64_t dispatch thunk of EKEnergySite.subscriptionID.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x1F8))();
}

uint64_t dispatch thunk of EKEnergySite.subscriptionID.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x200))();
}

uint64_t dispatch thunk of EKEnergySite.accessToken.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x208))();
}

uint64_t dispatch thunk of EKEnergySite.accessToken.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x210))();
}

uint64_t dispatch thunk of EKEnergySite.accessToken.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x218))();
}

uint64_t dispatch thunk of EKEnergySite.refreshToken.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x220))();
}

uint64_t dispatch thunk of EKEnergySite.refreshToken.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x228))();
}

uint64_t dispatch thunk of EKEnergySite.refreshToken.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x230))();
}

uint64_t dispatch thunk of EKEnergySite.timezone.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x238))();
}

uint64_t dispatch thunk of EKEnergySite.timezone.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x240))();
}

uint64_t dispatch thunk of EKEnergySite.timezone.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x248))();
}

uint64_t dispatch thunk of EKEnergySite.currentRatePlan.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x250))();
}

uint64_t dispatch thunk of EKEnergySite.currentRatePlan.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x258))();
}

uint64_t dispatch thunk of EKEnergySite.currentRatePlan.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x260))();
}

uint64_t dispatch thunk of EKEnergySite.usagePointCustomIndex.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x268))();
}

uint64_t dispatch thunk of EKEnergySite.usagePointCustomIndex.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x270))();
}

uint64_t dispatch thunk of EKEnergySite.usagePointCustomIndex.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x278))();
}

uint64_t dispatch thunk of EKEnergySite.usageSummaryCustomIndex.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x280))();
}

uint64_t dispatch thunk of EKEnergySite.usageSummaryCustomIndex.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x288))();
}

uint64_t dispatch thunk of EKEnergySite.usageSummaryCustomIndex.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x290))();
}

uint64_t dispatch thunk of EKEnergySite.intervalBlockCustomIndex.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x298))();
}

uint64_t dispatch thunk of EKEnergySite.intervalBlockCustomIndex.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2A0))();
}

uint64_t dispatch thunk of EKEnergySite.intervalBlockCustomIndex.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2A8))();
}

uint64_t dispatch thunk of EKEnergySite.ckFunctionToken.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2B0))();
}

uint64_t dispatch thunk of EKEnergySite.ckFunctionToken.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2B8))();
}

uint64_t dispatch thunk of EKEnergySite.ckFunctionToken.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2C0))();
}

uint64_t dispatch thunk of EKEnergySite.accountName.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2C8))();
}

uint64_t dispatch thunk of EKEnergySite.accountName.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2D0))();
}

uint64_t dispatch thunk of EKEnergySite.accountName.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2D8))();
}

uint64_t dispatch thunk of EKEnergySite.accountNumber.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2E0))();
}

uint64_t dispatch thunk of EKEnergySite.accountNumber.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2E8))();
}

uint64_t dispatch thunk of EKEnergySite.accountNumber.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2F0))();
}

uint64_t dispatch thunk of EKEnergySite.address.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x2F8))();
}

uint64_t dispatch thunk of EKEnergySite.address.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x300))();
}

uint64_t dispatch thunk of EKEnergySite.address.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x308))();
}

uint64_t dispatch thunk of EKEnergySite.serviceLocationID.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x310))();
}

uint64_t dispatch thunk of EKEnergySite.serviceLocationID.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x318))();
}

uint64_t dispatch thunk of EKEnergySite.serviceLocationID.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x320))();
}

uint64_t dispatch thunk of EKEnergySite.alternateSupplier.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x328))();
}

uint64_t dispatch thunk of EKEnergySite.alternateSupplier.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x330))();
}

uint64_t dispatch thunk of EKEnergySite.alternateSupplier.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x338))();
}

uint64_t dispatch thunk of EKEnergySite.accessTokenExpirationDate.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x340))();
}

uint64_t dispatch thunk of EKEnergySite.accessTokenExpirationDate.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x348))();
}

uint64_t dispatch thunk of EKEnergySite.accessTokenExpirationDate.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x350))();
}

uint64_t dispatch thunk of EKEnergySite.utilitySupportedCheckDate.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x358))();
}

uint64_t dispatch thunk of EKEnergySite.utilitySupportedCheckDate.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x360))();
}

uint64_t dispatch thunk of EKEnergySite.utilitySupportedCheckDate.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x368))();
}

uint64_t dispatch thunk of EKEnergySite.amiLastRefreshDate.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x370))();
}

uint64_t dispatch thunk of EKEnergySite.amiLastRefreshDate.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x378))();
}

uint64_t dispatch thunk of EKEnergySite.amiLastRefreshDate.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x380))();
}

uint64_t dispatch thunk of EKEnergySite.hasExportedEnergy.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x388))() & 1;
}

uint64_t dispatch thunk of EKEnergySite.hasExportedEnergy.setter(char a1)
{
  return (*(uint64_t (**)(void))((*v1 & *MEMORY[0x263F8EED0]) + 0x390))(a1 & 1);
}

uint64_t dispatch thunk of EKEnergySite.hasExportedEnergy.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x398))();
}

uint64_t dispatch thunk of EKEnergySite.usagePointNextRefreshDate.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3A0))();
}

uint64_t dispatch thunk of EKEnergySite.usagePointNextRefreshDate.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3A8))();
}

uint64_t dispatch thunk of EKEnergySite.usagePointNextRefreshDate.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3B0))();
}

uint64_t dispatch thunk of EKEnergySite.usageSummaryNextRefreshDate.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3B8))();
}

uint64_t dispatch thunk of EKEnergySite.usageSummaryNextRefreshDate.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3C0))();
}

uint64_t dispatch thunk of EKEnergySite.usageSummaryNextRefreshDate.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3C8))();
}

uint64_t dispatch thunk of EKEnergySite.intervalBlockNextRefreshDate.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3D0))();
}

uint64_t dispatch thunk of EKEnergySite.intervalBlockNextRefreshDate.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3D8))();
}

uint64_t dispatch thunk of EKEnergySite.intervalBlockNextRefreshDate.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3E0))();
}

uint64_t dispatch thunk of EKEnergySite.subscriptionCreationDate.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3E8))();
}

uint64_t dispatch thunk of EKEnergySite.subscriptionCreationDate.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3F0))();
}

uint64_t dispatch thunk of EKEnergySite.subscriptionCreationDate.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x3F8))();
}

uint64_t dispatch thunk of EKEnergySite.subscriptionStartDate.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x400))();
}

uint64_t dispatch thunk of EKEnergySite.subscriptionStartDate.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x408))();
}

uint64_t dispatch thunk of EKEnergySite.subscriptionStartDate.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x410))();
}

uint64_t dispatch thunk of EKEnergySite.siteTombstone.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x418))();
}

uint64_t dispatch thunk of EKEnergySite.siteTombstone.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x420))();
}

uint64_t dispatch thunk of EKEnergySite.siteTombstone.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x428))();
}

uint64_t dispatch thunk of EKEnergySite.siteVersion.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x430))();
}

uint64_t dispatch thunk of EKEnergySite.siteVersion.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x438))();
}

uint64_t dispatch thunk of EKEnergySite.siteVersion.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x440))();
}

uint64_t dispatch thunk of EKEnergySite.generationMeters.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x448))();
}

uint64_t dispatch thunk of EKEnergySite.generationMeters.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x450))();
}

uint64_t dispatch thunk of EKEnergySite.generationMeters.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x458))();
}

uint64_t dispatch thunk of EKEnergySite.unknownFields.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x460))();
}

uint64_t dispatch thunk of EKEnergySite.unknownFields.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x468))();
}

uint64_t dispatch thunk of EKEnergySite.unknownFields.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x470))();
}

#error "24D281B44: call analysis failed (funcsize=154)"

#error "24D281DCC: call analysis failed (funcsize=162)"

uint64_t dispatch thunk of EKEnergySite.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 1160))();
}

uint64_t dispatch thunk of EKEnergySite.encode(with:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x490))();
}

uint64_t dispatch thunk of EKEnergySite.archive()()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x498))();
}

uint64_t sub_24D281EC0()
{
  uint64_t v4 = qword_26B18BB20;
  if (!qword_26B18BB20)
  {
    sub_24D290638();
    unint64_t v3 = sub_24D290E08();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_26B18BB20);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_24D281F68()
{
  uint64_t v4 = qword_26B18BC18;
  if (!qword_26B18BC18)
  {
    sub_24D2908B8();
    unint64_t v3 = sub_24D290E08();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_26B18BC18);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_24D282010(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xE1) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 30) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 225;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 31;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_24D2821C0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xE1)
  {
    unsigned int v5 = ((a3 + 30) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xE1)
  {
    unsigned int v4 = ((a2 - 226) >> 8) + 1;
    void *result = a2 + 30;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      void *result = a2 + 30;
    }
  }
  return result;
}

void *type metadata accessor for EKEnergySite.CodingKeys()
{
  return &unk_26FF7E070;
}

void *sub_24D282418(const void *a1, void *a2)
{
  uint64_t v6 = sub_24D2908B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

void *sub_24D282540(void *a1, void *a2)
{
  uint64_t v9 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v10 + 48))(a1, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
    memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    *a2 = *a1;
    uint64_t v6 = (char *)a2 + *(int *)(v9 + 20);
    unsigned int v5 = (char *)a1 + *(int *)(v9 + 20);
    uint64_t v2 = sub_24D2908B8();
    (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 32))(v6, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(a2, 0, 1, v9);
  }
  return a2;
}

void *sub_24D28269C(id *a1, void *a2)
{
  id v4 = *a1;
  id v2 = *a1;
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

uint64_t sub_24D2826D4(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_24D229320(result, a2);
  }
  return result;
}

uint64_t sub_24D282720(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_24D2293AC(result, a2);
  }
  return result;
}

char *sub_24D28276C(char *a1, char *a2)
{
  *(void *)a2 = *(void *)a1;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(int *)(type metadata accessor for EnergySitePayload.CurrentRatePlan() + 20);
  uint64_t v2 = sub_24D2908B8();
  (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 40))(&a2[v4], &a1[v4]);
  return a2;
}

uint64_t static MergeEnergySite.mergeMetaData(siteMetadata:metadata:jwt:originalJwt:logging:)(uint64_t a1, uint64_t a2, const void *a3, const void *a4, int a5)
{
  uint64_t v16 = a1;
  uint64_t v21 = a2;
  uint64_t v18 = a3;
  char v19 = a4;
  int v23 = a5;
  uint64_t v13 = 0;
  char v26 = sub_24D28CD0C;
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  uint64_t v35 = 0;
  uint64_t v34 = 0;
  char v33 = 0;
  uint64_t v32 = 0;
  unint64_t v14 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](0);
  char v25 = (char *)&v13 - v14;
  unint64_t v15 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5);
  char v24 = (char *)&v13 - v15;
  unint64_t v17 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (uint64_t)&v13 - v17;
  uint64_t v37 = v7;
  uint64_t v36 = v21;
  uint64_t v35 = v8;
  uint64_t v34 = v9;
  int v22 = 1;
  char v33 = v10 & 1;
  uint64_t v32 = v11;
  sub_24D25CAB4(v7, (uint64_t)&v13 - v17);
  sub_24D23A408(v18, v24);
  sub_24D23A408(v19, v25);
  uint64_t v27 = v20;
  uint64_t v28 = v21;
  char v29 = v23 & v22;
  char v30 = v24;
  char v31 = v25;
  sub_24D290848();
  sub_24D25CB50(v20);
  sub_24D23A530((uint64_t)v24);
  return sub_24D23A530((uint64_t)v25);
}

uint64_t sub_24D282A4C(uint64_t a1)
{
  uint64_t v1553 = MEMORY[0x270FA5388](a1);
  uint64_t v1552 = v2;
  int v1549 = v3;
  v1550 = v4;
  v1551 = v5;
  uint64_t v1310 = v1;
  uint64_t v1505 = 0;
  v1311 = sub_24D290268;
  v1312 = sub_24D28ECBC;
  v1313 = sub_24D265504;
  v1314 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1315 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1316 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1317 = sub_24D28ECBC;
  v1318 = sub_24D265504;
  v1319 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1320 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1321 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1322 = sub_24D28ECBC;
  v1323 = sub_24D265504;
  v1324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1325 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1326 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1327 = sub_24D28ECBC;
  v1328 = sub_24D265504;
  v1329 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1330 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1331 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1332 = sub_24D28ECBC;
  v1333 = sub_24D265504;
  v1334 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1335 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1336 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1337 = sub_24D28ECBC;
  v1338 = sub_24D265504;
  v1339 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1340 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1341 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1342 = sub_24D28ECBC;
  v1343 = sub_24D265504;
  v1344 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1345 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1346 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1347 = sub_24D28ECBC;
  v1348 = sub_24D265504;
  v1349 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1350 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1351 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1352 = sub_24D28ECBC;
  v1353 = sub_24D265504;
  v1354 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1355 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1356 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1357 = sub_24D28ECBC;
  v1358 = sub_24D265504;
  v1359 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1360 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1361 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1362 = sub_24D28ECBC;
  v1363 = sub_24D265504;
  v1364 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1365 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1366 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1367 = sub_24D28ECBC;
  v1368 = sub_24D265504;
  v1369 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1370 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1371 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1372 = sub_24D28ECBC;
  v1373 = sub_24D265504;
  v1374 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1375 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1376 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1377 = sub_24D28ECBC;
  v1378 = sub_24D265504;
  v1379 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1380 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1381 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1382 = sub_24D28ECBC;
  v1383 = sub_24D265504;
  v1384 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1385 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1386 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1387 = sub_24D28ECBC;
  v1388 = sub_24D265504;
  v1389 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1390 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1391 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1392 = sub_24D28ECBC;
  v1393 = sub_24D265504;
  v1394 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1395 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1396 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1397 = sub_24D28ECBC;
  v1398 = sub_24D265504;
  v1399 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1400 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1401 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1402 = sub_24D28ECBC;
  v1403 = sub_24D265504;
  v1404 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1405 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1406 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1407 = sub_24D28ECBC;
  v1408 = sub_24D265504;
  v1409 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1410 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265490;
  v1411 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D265550;
  v1743 = 0;
  v1742 = 0;
  v1741 = 0;
  v1740 = 0;
  v1739 = 0;
  v1738 = 0;
  uint64_t v1737 = 0;
  uint64_t v1736 = 0;
  char v1735 = 0;
  uint64_t v1734 = 0;
  uint64_t v1733 = 0;
  uint64_t v1731 = 0;
  uint64_t v1732 = 0;
  uint64_t v1412 = type metadata accessor for EnergySitePayload.CurrentRatePlan();
  unint64_t v1413 = (*(void *)(*(void *)(v1412 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](0);
  v1414 = (char *)&v465 - v1413;
  unint64_t v1415 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  v1416 = (char *)&v465 - v1415;
  uint64_t v1417 = sub_24D290888();
  uint64_t v1418 = *(void *)(v1417 - 8);
  uint64_t v1419 = v1417 - 8;
  unint64_t v1420 = (*(void *)(v1418 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1417);
  v1421 = (char *)&v465 - v1420;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  uint64_t v1422 = *(void *)(*(void *)(v8 - 8) + 64);
  unint64_t v1423 = (v1422 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  v1424 = (char *)&v465 - v1423;
  unint64_t v1425 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v465 - v1423);
  v1426 = (char *)&v465 - v1425;
  unint64_t v1427 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v465 - v1425);
  v1428 = (char *)&v465 - v1427;
  unint64_t v1429 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v465 - v1427);
  v1430 = (char *)&v465 - v1429;
  unint64_t v1431 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v465 - v1429);
  v1432 = (char *)&v465 - v1431;
  unint64_t v1433 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v465 - v1431);
  v1434 = (char *)&v465 - v1433;
  unint64_t v1435 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v465 - v1433);
  v1436 = (char *)&v465 - v1435;
  unint64_t v1437 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v465 - v1435);
  v1438 = (char *)&v465 - v1437;
  uint64_t v1439 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50) - 8) + 64);
  unint64_t v1440 = (v1439 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = MEMORY[0x270FA5388](v1505);
  uint64_t v1441 = (uint64_t)&v465 - v1440;
  unint64_t v1442 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v1443 = (uint64_t)&v465 - v1442;
  unint64_t v1444 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v1445 = (uint64_t)&v465 - v1444;
  unint64_t v1446 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v1447 = (uint64_t)&v465 - v1446;
  unint64_t v1448 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v1449 = (char *)&v465 - v1448;
  unint64_t v1450 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v1451 = (char *)&v465 - v1450;
  unint64_t v1452 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v1453 = (char *)&v465 - v1452;
  unint64_t v1454 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v1455 = (char *)&v465 - v1454;
  unint64_t v1456 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v1457 = (char *)&v465 - v1456;
  unint64_t v1458 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v1459 = (char *)&v465 - v1458;
  unint64_t v1460 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v1461 = (char *)&v465 - v1460;
  unint64_t v1462 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v1463 = (char *)&v465 - v1462;
  unint64_t v1464 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v1465 = (char *)&v465 - v1464;
  unint64_t v1466 = (v41 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v40);
  v1467 = (char *)&v465 - v1466;
  uint64_t v1468 = sub_24D290638();
  uint64_t v1469 = *(void *)(v1468 - 8);
  uint64_t v1470 = v1468 - 8;
  uint64_t v1471 = *(void *)(v1469 + 64);
  unint64_t v1472 = (v1471 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v42 = MEMORY[0x270FA5388](v1505);
  v1473 = (char *)&v465 - v1472;
  unint64_t v1474 = (v43 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  v1475 = (char *)&v465 - v1474;
  unint64_t v1476 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v1477 = (char *)&v465 - v1476;
  unint64_t v1478 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  v1479 = (char *)&v465 - v1478;
  unint64_t v1480 = (v49 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  v1481 = (char *)&v465 - v1480;
  unint64_t v1482 = (v51 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v1483 = (char *)&v465 - v1482;
  v1743 = (char *)&v465 - v1482;
  unint64_t v1484 = (v53 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  v1485 = (char *)&v465 - v1484;
  unint64_t v1486 = (v55 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  v1487 = (char *)&v465 - v1486;
  v1742 = (char *)&v465 - v1486;
  unint64_t v1488 = (v57 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  v1489 = (char *)&v465 - v1488;
  unint64_t v1490 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v60 = MEMORY[0x270FA5388](v58);
  v1491 = (char *)&v465 - v1490;
  unint64_t v1492 = (v61 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  v1493 = (char *)&v465 - v1492;
  v1741 = (char *)&v465 - v1492;
  unint64_t v1494 = (v63 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v1495 = (char *)&v465 - v1494;
  v1740 = (char *)&v465 - v1494;
  unint64_t v1496 = (v65 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v66 = MEMORY[0x270FA5388](v64);
  v1497 = (char *)&v465 - v1496;
  v1739 = (char *)&v465 - v1496;
  unint64_t v1498 = (v67 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v66);
  v1499 = (char *)&v465 - v1498;
  v1738 = (char *)&v465 - v1498;
  uint64_t v1500 = sub_24D2906A8();
  uint64_t v1501 = *(void *)(v1500 - 8);
  uint64_t v1502 = v1500 - 8;
  unint64_t v1503 = (*(void *)(v1501 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1500);
  v1504 = (char *)&v465 - v1503;
  uint64_t v1506 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985D4B0) - 8) + 64);
  unint64_t v1507 = (v1506 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v68 = MEMORY[0x270FA5388](v1505);
  uint64_t v1508 = (uint64_t)&v465 - v1507;
  unint64_t v1509 = (v69 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v70 = MEMORY[0x270FA5388](v68);
  uint64_t v1510 = (uint64_t)&v465 - v1509;
  unint64_t v1511 = (v71 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v72 = MEMORY[0x270FA5388](v70);
  uint64_t v1512 = (uint64_t)&v465 - v1511;
  unint64_t v1513 = (v73 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v74 = MEMORY[0x270FA5388](v72);
  uint64_t v1514 = (uint64_t)&v465 - v1513;
  unint64_t v1515 = (v75 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v76 = MEMORY[0x270FA5388](v74);
  uint64_t v1516 = (uint64_t)&v465 - v1515;
  unint64_t v1517 = (v77 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v78 = MEMORY[0x270FA5388](v76);
  uint64_t v1518 = (uint64_t)&v465 - v1517;
  unint64_t v1519 = (v79 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v80 = MEMORY[0x270FA5388](v78);
  uint64_t v1520 = (uint64_t)&v465 - v1519;
  unint64_t v1521 = (v81 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v82 = MEMORY[0x270FA5388](v80);
  uint64_t v1522 = (uint64_t)&v465 - v1521;
  unint64_t v1523 = (v83 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v84 = MEMORY[0x270FA5388](v82);
  uint64_t v1524 = (uint64_t)&v465 - v1523;
  unint64_t v1525 = (v85 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v86 = MEMORY[0x270FA5388](v84);
  uint64_t v1526 = (uint64_t)&v465 - v1525;
  unint64_t v1527 = (v87 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v88 = MEMORY[0x270FA5388](v86);
  uint64_t v1528 = (uint64_t)&v465 - v1527;
  unint64_t v1529 = (v89 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v90 = MEMORY[0x270FA5388](v88);
  uint64_t v1530 = (uint64_t)&v465 - v1529;
  unint64_t v1531 = (v91 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v92 = MEMORY[0x270FA5388](v90);
  uint64_t v1532 = (uint64_t)&v465 - v1531;
  unint64_t v1533 = (v93 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v94 = MEMORY[0x270FA5388](v92);
  uint64_t v1534 = (uint64_t)&v465 - v1533;
  unint64_t v1535 = (v95 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v96 = MEMORY[0x270FA5388](v94);
  uint64_t v1536 = (uint64_t)&v465 - v1535;
  unint64_t v1537 = (v97 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v98 = MEMORY[0x270FA5388](v96);
  uint64_t v1538 = (uint64_t)&v465 - v1537;
  unint64_t v1539 = (v99 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v100 = MEMORY[0x270FA5388](v98);
  uint64_t v1540 = (uint64_t)&v465 - v1539;
  unint64_t v1541 = (v101 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v102 = MEMORY[0x270FA5388](v100);
  uint64_t v1542 = (uint64_t)&v465 - v1541;
  unint64_t v1543 = (v103 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v104 = MEMORY[0x270FA5388](v102);
  uint64_t v1544 = (uint64_t)&v465 - v1543;
  unint64_t v1545 = (v105 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v106 = MEMORY[0x270FA5388](v104);
  uint64_t v1546 = (uint64_t)&v465 - v1545;
  unint64_t v1547 = (v107 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v106);
  uint64_t v1548 = (uint64_t)&v465 - v1547;
  uint64_t v1554 = *(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64);
  unint64_t v1555 = (v1554 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v108 = MEMORY[0x270FA5388](v1553);
  uint64_t v1556 = (uint64_t)&v465 - v1555;
  unint64_t v1557 = (v109 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v110 = MEMORY[0x270FA5388](v108);
  uint64_t v1558 = (uint64_t)&v465 - v1557;
  unint64_t v1559 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v112 = MEMORY[0x270FA5388](v110);
  uint64_t v1560 = (uint64_t)&v465 - v1559;
  unint64_t v1561 = (v113 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v114 = MEMORY[0x270FA5388](v112);
  uint64_t v1562 = (uint64_t)&v465 - v1561;
  unint64_t v1563 = (v115 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v116 = MEMORY[0x270FA5388](v114);
  uint64_t v1564 = (uint64_t)&v465 - v1563;
  unint64_t v1565 = (v117 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v118 = MEMORY[0x270FA5388](v116);
  uint64_t v1566 = (uint64_t)&v465 - v1565;
  unint64_t v1567 = (v119 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v120 = MEMORY[0x270FA5388](v118);
  uint64_t v1568 = (uint64_t)&v465 - v1567;
  unint64_t v1569 = (v121 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v122 = MEMORY[0x270FA5388](v120);
  uint64_t v1570 = (uint64_t)&v465 - v1569;
  unint64_t v1571 = (v123 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v124 = MEMORY[0x270FA5388](v122);
  uint64_t v1572 = (uint64_t)&v465 - v1571;
  uint64_t v1737 = v124;
  uint64_t v1736 = v125;
  char v1735 = v126 & 1;
  uint64_t v1734 = v127;
  uint64_t v1733 = v128;
  if (*sub_24D22A8BC())
  {
    EnergySitePayload.ckFunctionToken.getter();
    uint64_t v1308 = v129;
    int v1309 = sub_24D290C28();
    swift_bridgeObjectRelease();
    sub_24D25CAB4(v1553, v1572);
    if (v1309)
    {
      int v1307 = 0;
    }
    else
    {
      EnergySitePayload.ckFunctionToken.getter();
      uint64_t v1301 = v130;
      uint64_t v1302 = sub_24D290BC8();
      uint64_t v1303 = v131;
      swift_bridgeObjectRelease();
      v1305 = v1574;
      v1574[0] = v1302;
      v1574[1] = v1303;
      uint64_t v132 = sub_24D290C08();
      v1304 = v1573;
      v1573[0] = v132;
      v1573[1] = v133;
      sub_24D29031C();
      int v1306 = sub_24D290E48();
      sub_24D22F624();
      sub_24D22F624();
      int v1307 = v1306;
    }
    int v1300 = v1307;
    sub_24D25CB50(v1572);
    if (v1300)
    {
      int v1299 = 1;
    }
    else
    {
      EnergySitePayload.ckFunctionToken.getter();
      uint64_t v1297 = v134;
      int v1298 = sub_24D290C28();
      swift_bridgeObjectRelease();
      if (v1298)
      {
        int v1296 = 0;
      }
      else
      {
        EnergySitePayload.ckFunctionToken.getter();
        uint64_t v1290 = v135;
        uint64_t v1291 = sub_24D290BC8();
        uint64_t v1292 = v136;
        swift_bridgeObjectRelease();
        v1294 = v1576;
        v1576[0] = v1291;
        v1576[1] = v1292;
        uint64_t v137 = sub_24D290C08();
        v1293 = v1575;
        v1575[0] = v137;
        v1575[1] = v138;
        sub_24D29031C();
        int v1295 = sub_24D290E48();
        sub_24D22F624();
        sub_24D22F624();
        int v1296 = v1295;
      }
      int v1299 = v1296;
    }
    if (v1299)
    {
      unsigned int v1286 = 1;
      sub_24D2299EC(v1549 & 1, v1548);
      uint64_t v1287 = sub_24D290AC8();
      uint64_t v1288 = *(void *)(v1287 - 8);
      uint64_t v1289 = v1287 - 8;
      if ((*(unsigned int (**)(uint64_t, void))(v1288 + 48))(v1548, v1286) == 1)
      {
        sub_24D28EB34(v1548);
        uint64_t v1285 = v1310;
      }
      else
      {
        v1283 = sub_24D290AA8();
        int v1282 = sub_24D290D78();
        v1280 = &v1580;
        uint64_t v1580 = 2;
        unint64_t v1278 = sub_24D26443C();
        unint64_t v1279 = sub_24D2644B8();
        sub_24D22D93C();
        sub_24D290C68();
        uint32_t v1281 = v1581;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
        uint64_t v1284 = sub_24D290FA8();
        if (os_log_type_enabled(v1283, (os_log_type_t)v1282))
        {
          v1267 = (uint8_t *)sub_24D290DF8();
          uint64_t v1265 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
          uint64_t v1266 = 0;
          uint64_t v1268 = sub_24D263F98(0);
          uint64_t v1269 = sub_24D263F98(v1266);
          v1273 = &v1579;
          v1579 = v1267;
          v1274 = &v1578;
          uint64_t v1578 = v1268;
          v1271 = &v1577;
          uint64_t v1577 = v1269;
          unsigned int v1270 = 0;
          sub_24D263FF4(0, &v1579);
          sub_24D263FF4(v1270, v1273);
          v1576[2] = v1284;
          v1272 = &v465;
          MEMORY[0x270FA5388](&v465);
          uint64_t v139 = v1274;
          uint64_t v140 = &v465 - 6;
          v1275 = &v465 - 6;
          v140[2] = (uint64_t)v1273;
          v140[3] = (uint64_t)v139;
          v140[4] = v141;
          uint64_t v1276 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D4B8);
          sub_24D290298();
          uint64_t v142 = v1310;
          sub_24D290C58();
          uint64_t v1277 = v142;
          if (v142)
          {
            __break(1u);
          }
          else
          {
            _os_log_impl(&dword_24D227000, v1283, (os_log_type_t)v1282, "[Deduplication] WARNING: Mock Tokens used. New always wins", v1267, v1281);
            uint64_t v1263 = 0;
            sub_24D264054(v1268);
            sub_24D264054(v1269);
            sub_24D290DC8();
            swift_bridgeObjectRelease();
            uint64_t v1264 = v1277;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v1264 = v1310;
        }
        uint64_t v1262 = v1264;

        (*(void (**)(uint64_t, uint64_t))(v1288 + 8))(v1548, v1287);
        uint64_t v1285 = v1262;
      }
      uint64_t v1260 = v1285;
      sub_24D25CAB4(v1553, v1570);
      sub_24D28EBE4(v1570, v1552);
      uint64_t v1261 = v1260;
    }
    else
    {
      uint64_t v1261 = v1310;
    }
    uint64_t v1259 = v1261;
  }
  else
  {
    uint64_t v1259 = v1310;
  }
  uint64_t v1254 = v1259;
  sub_24D290698();
  uint64_t v1255 = sub_24D290648();
  uint64_t v1256 = v143;
  uint64_t v1731 = v1255;
  uint64_t v1732 = v143;
  (*(void (**)(char *, uint64_t))(v1501 + 8))(v1504, v1500);
  EnergySitePayload.accessToken.getter();
  uint64_t v1257 = v144;
  int v1258 = sub_24D290C28();
  swift_bridgeObjectRelease();
  sub_24D25CAB4(v1553, v1568);
  if (v1258)
  {
    int v1253 = 0;
  }
  else
  {
    EnergySitePayload.refreshToken.getter();
    uint64_t v1251 = v145;
    int v1252 = sub_24D290C28();
    swift_bridgeObjectRelease();
    int v1253 = v1252 ^ 1;
  }
  int v1250 = v1253;
  sub_24D25CB50(v1568);
  sub_24D25CAB4(v1553, v1566);
  if (v1250)
  {
    EnergySitePayload.ckFunctionToken.getter();
    uint64_t v1247 = v146;
    int v1248 = sub_24D290C28();
    swift_bridgeObjectRelease();
    int v1249 = v1248 ^ 1;
  }
  else
  {
    int v1249 = 0;
  }
  int v1246 = v1249;
  sub_24D25CB50(v1566);
  if (v1246)
  {
    EnergySitePayload.accessToken.getter();
    uint64_t v1243 = v147;
    int v1244 = sub_24D290C28();
    swift_bridgeObjectRelease();
    int v1245 = v1244 ^ 1;
  }
  else
  {
    int v1245 = 0;
  }
  if (v1245)
  {
    EnergySitePayload.refreshToken.getter();
    uint64_t v1240 = v148;
    int v1241 = sub_24D290C28();
    swift_bridgeObjectRelease();
    int v1242 = v1241 ^ 1;
  }
  else
  {
    int v1242 = 0;
  }
  if (v1242)
  {
    EnergySitePayload.ckFunctionToken.getter();
    uint64_t v1237 = v149;
    int v1238 = sub_24D290C28();
    swift_bridgeObjectRelease();
    int v1239 = v1238 ^ 1;
  }
  else
  {
    int v1239 = 0;
  }
  if (v1239)
  {
    unsigned int v1231 = 1;
    sub_24D2299EC(v1549 & 1, v1546);
    uint64_t v1232 = sub_24D290AC8();
    uint64_t v1233 = *(void *)(v1232 - 8);
    uint64_t v1234 = v1232 - 8;
    v1235 = *(unsigned int (**)(uint64_t, void))(v1233 + 48);
    uint64_t v1236 = v1233 + 48;
    if (v1235(v1546, v1231) == 1)
    {
      sub_24D28EB34(v1546);
      uint64_t v1230 = v1254;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v1218 = 32;
      uint64_t v1219 = 7;
      uint64_t v150 = swift_allocObject();
      uint64_t v151 = v1256;
      uint64_t v1220 = v150;
      *(void *)(v150 + 16) = v1255;
      *(void *)(v150 + 24) = v151;
      v1228 = sub_24D290AA8();
      int v1229 = sub_24D290D88();
      v1215 = &v1587;
      uint64_t v1587 = 12;
      unint64_t v1213 = sub_24D26443C();
      unint64_t v1214 = sub_24D2644B8();
      sub_24D22D93C();
      sub_24D290C68();
      uint32_t v1216 = v1588;
      uint64_t v1217 = 17;
      uint64_t v1222 = swift_allocObject();
      *(unsigned char *)(v1222 + 16) = 32;
      uint64_t v1223 = swift_allocObject();
      *(unsigned char *)(v1223 + 16) = 8;
      uint64_t v152 = swift_allocObject();
      uint64_t v153 = v1220;
      uint64_t v1221 = v152;
      *(void *)(v152 + 16) = v1362;
      *(void *)(v152 + 24) = v153;
      uint64_t v154 = swift_allocObject();
      uint64_t v155 = v1221;
      uint64_t v1225 = v154;
      *(void *)(v154 + 16) = v1363;
      *(void *)(v154 + 24) = v155;
      uint64_t v1227 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
      uint64_t v1224 = sub_24D290FA8();
      v1226 = v156;
      swift_retain();
      uint64_t v157 = v1222;
      uint64_t v158 = v1226;
      *v1226 = v1364;
      v158[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v157;
      swift_retain();
      uint64_t v159 = v1223;
      uint64_t v160 = v1226;
      v1226[2] = v1365;
      v160[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v159;
      swift_retain();
      uint64_t v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v1225;
      id v162 = v1226;
      v1226[4] = v1366;
      v162[5] = v161;
      sub_24D22AD58();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v1228, (os_log_type_t)v1229))
      {
        v1206 = (uint8_t *)sub_24D290DF8();
        uint64_t v1205 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
        uint64_t v1207 = sub_24D263F98(0);
        uint64_t v1208 = sub_24D263F98(1);
        v1209 = &v1586;
        v1586 = v1206;
        v1210 = &v1585;
        uint64_t v1585 = v1207;
        v1211 = &v1584;
        uint64_t v1584 = v1208;
        sub_24D263FF4(2, &v1586);
        sub_24D263FF4(1, v1209);
        uint64_t v163 = v1254;
        v1582 = v1364;
        uint64_t v1583 = v1222;
        sub_24D264008(&v1582, (uint64_t)v1209, (uint64_t)v1210, (uint64_t)v1211);
        uint64_t v1212 = v163;
        if (v163)
        {
          __break(1u);
        }
        else
        {
          v1582 = v1365;
          uint64_t v1583 = v1223;
          sub_24D264008(&v1582, (uint64_t)&v1586, (uint64_t)&v1585, (uint64_t)&v1584);
          uint64_t v1203 = 0;
          uint64_t v164 = v1203;
          v1582 = v1366;
          uint64_t v1583 = v1225;
          sub_24D264008(&v1582, (uint64_t)&v1586, (uint64_t)&v1585, (uint64_t)&v1584);
          uint64_t v1202 = v164;
          _os_log_impl(&dword_24D227000, v1228, (os_log_type_t)v1229, "[Deduplication] [%s] Both sites onboarded", v1206, v1216);
          sub_24D264054(v1207);
          sub_24D264054(v1208);
          sub_24D290DC8();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v1204 = v1202;
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        uint64_t v1204 = v1254;
      }
      uint64_t v1201 = v1204;

      (*(void (**)(uint64_t, uint64_t))(v1233 + 8))(v1546, v1232);
      uint64_t v1230 = v1201;
    }
    uint64_t v1198 = v1230;
    sub_24D23A408(v1550, v1467);
    v1199 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v1469 + 48);
    uint64_t v1200 = v1469 + 48;
    if (v1199(v1467, 1, v1468) == 1)
    {
      sub_24D23A530((uint64_t)v1467);
    }
    else
    {
      v1196 = *(void (**)(char *, char *, uint64_t))(v1469 + 32);
      uint64_t v1197 = v1469 + 32;
      v1196(v1499, v1467, v1468);
      sub_24D23A408(v1551, v1465);
      if (v1199(v1465, 1, v1468) == 1)
      {
        sub_24D23A530((uint64_t)v1465);
        (*(void (**)(char *, uint64_t))(v1469 + 8))(v1499, v1468);
      }
      else
      {
        v1196(v1497, v1465, v1468);
        if (sub_24D2905B8())
        {
          unsigned int v1195 = 1;
          sub_24D2299EC(v1549 & 1, v1544);
          if (((unsigned int (*)(uint64_t, void, uint64_t))v1235)(v1544, v1195, v1232) == 1)
          {
            sub_24D28EB34(v1544);
            uint64_t v1194 = v1198;
          }
          else
          {
            swift_bridgeObjectRetain();
            uint64_t v1182 = 32;
            uint64_t v1183 = 7;
            uint64_t v165 = swift_allocObject();
            uint64_t v166 = v1256;
            uint64_t v1184 = v165;
            *(void *)(v165 + 16) = v1255;
            *(void *)(v165 + 24) = v166;
            v1192 = sub_24D290AA8();
            int v1193 = sub_24D290D88();
            v1179 = &v1594;
            uint64_t v1594 = 12;
            unint64_t v1177 = sub_24D26443C();
            unint64_t v1178 = sub_24D2644B8();
            sub_24D22D93C();
            sub_24D290C68();
            uint32_t v1180 = v1595;
            uint64_t v1181 = 17;
            uint64_t v1186 = swift_allocObject();
            *(unsigned char *)(v1186 + 16) = 32;
            uint64_t v1187 = swift_allocObject();
            *(unsigned char *)(v1187 + 16) = 8;
            uint64_t v167 = swift_allocObject();
            uint64_t v168 = v1184;
            uint64_t v1185 = v167;
            *(void *)(v167 + 16) = v1402;
            *(void *)(v167 + 24) = v168;
            uint64_t v169 = swift_allocObject();
            uint64_t v170 = v1185;
            uint64_t v1189 = v169;
            *(void *)(v169 + 16) = v1403;
            *(void *)(v169 + 24) = v170;
            uint64_t v1191 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
            uint64_t v1188 = sub_24D290FA8();
            v1190 = v171;
            swift_retain();
            uint64_t v172 = v1186;
            uint64_t v173 = v1190;
            *v1190 = v1404;
            v173[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v172;
            swift_retain();
            uint64_t v174 = v1187;
            int v175 = v1190;
            v1190[2] = v1405;
            v175[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v174;
            swift_retain();
            id v176 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v1189;
            uint64_t v177 = v1190;
            v1190[4] = v1406;
            v177[5] = v176;
            sub_24D22AD58();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v1192, (os_log_type_t)v1193))
            {
              v1170 = (uint8_t *)sub_24D290DF8();
              uint64_t v1169 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
              uint64_t v1171 = sub_24D263F98(0);
              uint64_t v1172 = sub_24D263F98(1);
              v1173 = &v1593;
              v1593 = v1170;
              v1174 = &v1592;
              uint64_t v1592 = v1171;
              v1175 = &v1591;
              uint64_t v1591 = v1172;
              sub_24D263FF4(2, &v1593);
              sub_24D263FF4(1, v1173);
              uint64_t v178 = v1198;
              v1589 = v1404;
              uint64_t v1590 = v1186;
              sub_24D264008(&v1589, (uint64_t)v1173, (uint64_t)v1174, (uint64_t)v1175);
              uint64_t v1176 = v178;
              if (v178)
              {
                __break(1u);
              }
              else
              {
                v1589 = v1405;
                uint64_t v1590 = v1187;
                sub_24D264008(&v1589, (uint64_t)&v1593, (uint64_t)&v1592, (uint64_t)&v1591);
                uint64_t v1167 = 0;
                uint64_t v179 = v1167;
                v1589 = v1406;
                uint64_t v1590 = v1189;
                sub_24D264008(&v1589, (uint64_t)&v1593, (uint64_t)&v1592, (uint64_t)&v1591);
                uint64_t v1166 = v179;
                _os_log_impl(&dword_24D227000, v1192, (os_log_type_t)v1193, "[Deduplication] [%s] 1.1 Newer sites wins", v1170, v1180);
                sub_24D264054(v1171);
                sub_24D264054(v1172);
                sub_24D290DC8();
                swift_release();
                swift_release();
                swift_release();
                uint64_t v1168 = v1166;
              }
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
              uint64_t v1168 = v1198;
            }
            uint64_t v1165 = v1168;

            (*(void (**)(uint64_t, uint64_t))(v1233 + 8))(v1544, v1232);
            uint64_t v1194 = v1165;
          }
          uint64_t v1163 = v1194;
          sub_24D25CAB4(v1553, v1570);
          sub_24D28EBE4(v1570, v1552);
          v1162 = *(void (**)(char *, uint64_t))(v1469 + 8);
          uint64_t v1161 = v1469 + 8;
          v1162(v1497, v1468);
          v1162(v1499, v1468);
          uint64_t v1164 = v1163;
LABEL_202:
          uint64_t v896 = v1164;
          goto LABEL_396;
        }
        v1160 = *(void (**)(char *, uint64_t))(v1469 + 8);
        uint64_t v1159 = v1469 + 8;
        v1160(v1497, v1468);
        v1160(v1499, v1468);
      }
    }
    sub_24D23A408(v1550, v1463);
    if (v1199(v1463, 1, v1468) == 1)
    {
      sub_24D23A530((uint64_t)v1463);
      uint64_t v1158 = v1198;
    }
    else
    {
      v1156 = *(void (**)(char *, char *, uint64_t))(v1469 + 32);
      uint64_t v1157 = v1469 + 32;
      v1156(v1495, v1463, v1468);
      sub_24D23A408(v1551, v1461);
      if (v1199(v1461, 1, v1468) == 1)
      {
        sub_24D23A530((uint64_t)v1461);
        (*(void (**)(char *, uint64_t))(v1469 + 8))(v1495, v1468);
        uint64_t v1158 = v1198;
      }
      else
      {
        v1156(v1493, v1461, v1468);
        if (sub_24D2905E8())
        {
          EnergySitePayload.amiLastRefreshDate.getter(v1438);
          v1154 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v1418 + 48);
          uint64_t v1155 = v1418 + 48;
          if (v1154(v1438, 1, v1417) == 1)
          {
            sub_24D24C310((uint64_t)v1438);
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1469 + 56))(v1459, 1, 1, v1468);
          }
          else
          {
            sub_24D290878();
            (*(void (**)(char *, uint64_t))(v1418 + 8))(v1438, v1417);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v1469 + 56))(v1459, 0, 1, v1468);
          }
          if (v1199(v1459, 1, v1468) == 1)
          {
            sub_24D290538();
            sub_24D23A530((uint64_t)v1459);
          }
          else
          {
            v1156(v1491, v1459, v1468);
          }
          EnergySitePayload.amiLastRefreshDate.getter(v1436);
          if (((uint64_t (*)(char *, uint64_t, uint64_t))v1154)(v1436, 1, v1417) == 0)
          {
            (*(void (**)(char *, char *, uint64_t))(v1418 + 16))(v1421, v1436, v1417);
            sub_24D24C310((uint64_t)v1436);
            sub_24D290878();
            (*(void (**)(char *, uint64_t))(v1418 + 8))(v1421, v1417);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v1469 + 56))(v1457, 0, 1, v1468);
          }
          else
          {
            sub_24D24C310((uint64_t)v1436);
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1469 + 56))(v1457, 1, 1, v1468);
          }
          if (v1199(v1457, 1, v1468) == 1)
          {
            sub_24D290538();
            sub_24D23A530((uint64_t)v1457);
          }
          else
          {
            v1156(v1489, v1457, v1468);
          }
          int v1152 = sub_24D2905B8();
          v1151 = *(void (**)(char *, uint64_t))(v1469 + 8);
          uint64_t v1150 = v1469 + 8;
          v1151(v1489, v1468);
          v1151(v1491, v1468);
          if (v1152)
          {
            unsigned int v1149 = 1;
            sub_24D2299EC(v1549 & 1, v1542);
            if (((unsigned int (*)(uint64_t, void, uint64_t))v1235)(v1542, v1149, v1232) == 1)
            {
              sub_24D28EB34(v1542);
              uint64_t v1148 = v1198;
            }
            else
            {
              swift_bridgeObjectRetain();
              uint64_t v1136 = 32;
              uint64_t v1137 = 7;
              uint64_t v180 = swift_allocObject();
              uint64_t v181 = v1256;
              uint64_t v1138 = v180;
              *(void *)(v180 + 16) = v1255;
              *(void *)(v180 + 24) = v181;
              v1146 = sub_24D290AA8();
              int v1147 = sub_24D290D88();
              v1133 = &v1601;
              uint64_t v1601 = 12;
              unint64_t v1131 = sub_24D26443C();
              unint64_t v1132 = sub_24D2644B8();
              sub_24D22D93C();
              sub_24D290C68();
              uint32_t v1134 = v1602;
              uint64_t v1135 = 17;
              uint64_t v1140 = swift_allocObject();
              *(unsigned char *)(v1140 + 16) = 32;
              uint64_t v1141 = swift_allocObject();
              *(unsigned char *)(v1141 + 16) = 8;
              uint64_t v182 = swift_allocObject();
              uint64_t v183 = v1138;
              uint64_t v1139 = v182;
              *(void *)(v182 + 16) = v1397;
              *(void *)(v182 + 24) = v183;
              uint64_t v184 = swift_allocObject();
              uint64_t v185 = v1139;
              uint64_t v1143 = v184;
              *(void *)(v184 + 16) = v1398;
              *(void *)(v184 + 24) = v185;
              uint64_t v1145 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
              uint64_t v1142 = sub_24D290FA8();
              v1144 = v186;
              swift_retain();
              uint64_t v187 = v1140;
              uint64_t v188 = v1144;
              *v1144 = v1399;
              v188[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v187;
              swift_retain();
              uint64_t v189 = v1141;
              uint64_t v190 = v1144;
              v1144[2] = v1400;
              v190[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v189;
              swift_retain();
              uint64_t v191 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v1143;
              id v192 = v1144;
              v1144[4] = v1401;
              v192[5] = v191;
              sub_24D22AD58();
              swift_bridgeObjectRelease();
              if (os_log_type_enabled(v1146, (os_log_type_t)v1147))
              {
                v1124 = (uint8_t *)sub_24D290DF8();
                uint64_t v1123 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                uint64_t v1125 = sub_24D263F98(0);
                uint64_t v1126 = sub_24D263F98(1);
                v1127 = &v1600;
                v1600 = v1124;
                v1128 = &v1599;
                uint64_t v1599 = v1125;
                v1129 = &v1598;
                uint64_t v1598 = v1126;
                sub_24D263FF4(2, &v1600);
                sub_24D263FF4(1, v1127);
                uint64_t v193 = v1198;
                v1596 = v1399;
                uint64_t v1597 = v1140;
                sub_24D264008(&v1596, (uint64_t)v1127, (uint64_t)v1128, (uint64_t)v1129);
                uint64_t v1130 = v193;
                if (v193)
                {
                  __break(1u);
                }
                else
                {
                  v1596 = v1400;
                  uint64_t v1597 = v1141;
                  sub_24D264008(&v1596, (uint64_t)&v1600, (uint64_t)&v1599, (uint64_t)&v1598);
                  uint64_t v1121 = 0;
                  uint64_t v194 = v1121;
                  v1596 = v1401;
                  uint64_t v1597 = v1143;
                  sub_24D264008(&v1596, (uint64_t)&v1600, (uint64_t)&v1599, (uint64_t)&v1598);
                  uint64_t v1120 = v194;
                  _os_log_impl(&dword_24D227000, v1146, (os_log_type_t)v1147, "[Deduplication] [%s] 1.2.1 Newer sites wins", v1124, v1134);
                  sub_24D264054(v1125);
                  sub_24D264054(v1126);
                  sub_24D290DC8();
                  swift_release();
                  swift_release();
                  swift_release();
                  uint64_t v1122 = v1120;
                }
              }
              else
              {
                swift_release();
                swift_release();
                swift_release();
                uint64_t v1122 = v1198;
              }
              uint64_t v1119 = v1122;

              (*(void (**)(uint64_t, uint64_t))(v1233 + 8))(v1542, v1232);
              uint64_t v1148 = v1119;
            }
            uint64_t v1117 = v1148;
            sub_24D25CAB4(v1553, v1570);
            sub_24D28EBE4(v1570, v1552);
            uint64_t v1118 = v1117;
          }
          else
          {
            EnergySitePayload.subscriptionState.getter();
            uint64_t v1115 = v195;
            int v1116 = sub_24D290C28();
            swift_bridgeObjectRelease();
            sub_24D25CAB4(v1553, v1564);
            if (v1116)
            {
              EnergySitePayload.subscriptionState.getter();
              uint64_t v1112 = v196;
              int v1113 = sub_24D290C28();
              swift_bridgeObjectRelease();
              if (v1113)
              {
                uint64_t v1107 = EnergySitePayload.subscriptionState.getter();
                uint64_t v1109 = v197;
                char v1603 = 2;
                EnergySiteSubscriptionErrorState.rawValue.getter();
                uint64_t v1108 = v198;
                int v1110 = sub_24D290C18();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                int v1111 = v1110;
              }
              else
              {
                int v1111 = 0;
              }
              int v1114 = v1111;
            }
            else
            {
              int v1114 = 1;
            }
            int v1106 = v1114;
            sub_24D25CB50(v1564);
            if (v1106)
            {
              unsigned int v1105 = 1;
              sub_24D2299EC(v1549 & 1, v1540);
              if (((unsigned int (*)(uint64_t, void, uint64_t))v1235)(v1540, v1105, v1232) == 1)
              {
                sub_24D28EB34(v1540);
                uint64_t v1104 = v1198;
              }
              else
              {
                swift_bridgeObjectRetain();
                uint64_t v1092 = 32;
                uint64_t v1093 = 7;
                uint64_t v199 = swift_allocObject();
                uint64_t v200 = v1256;
                uint64_t v1094 = v199;
                *(void *)(v199 + 16) = v1255;
                *(void *)(v199 + 24) = v200;
                v1102 = sub_24D290AA8();
                int v1103 = sub_24D290D88();
                v1089 = &v1609;
                uint64_t v1609 = 12;
                unint64_t v1087 = sub_24D26443C();
                unint64_t v1088 = sub_24D2644B8();
                sub_24D22D93C();
                sub_24D290C68();
                uint32_t v1090 = v1610;
                uint64_t v1091 = 17;
                uint64_t v1096 = swift_allocObject();
                *(unsigned char *)(v1096 + 16) = 32;
                uint64_t v1097 = swift_allocObject();
                *(unsigned char *)(v1097 + 16) = 8;
                uint64_t v201 = swift_allocObject();
                uint64_t v202 = v1094;
                uint64_t v1095 = v201;
                *(void *)(v201 + 16) = v1392;
                *(void *)(v201 + 24) = v202;
                uint64_t v203 = swift_allocObject();
                uint64_t v204 = v1095;
                uint64_t v1099 = v203;
                *(void *)(v203 + 16) = v1393;
                *(void *)(v203 + 24) = v204;
                uint64_t v1101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
                uint64_t v1098 = sub_24D290FA8();
                v1100 = v205;
                swift_retain();
                uint64_t v206 = v1096;
                uint64_t v207 = v1100;
                *v1100 = v1394;
                v207[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v206;
                swift_retain();
                uint64_t v208 = v1097;
                uint64_t v209 = v1100;
                v1100[2] = v1395;
                v209[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v208;
                swift_retain();
                id v210 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v1099;
                uint64_t v211 = v1100;
                v1100[4] = v1396;
                v211[5] = v210;
                sub_24D22AD58();
                swift_bridgeObjectRelease();
                if (os_log_type_enabled(v1102, (os_log_type_t)v1103))
                {
                  v1080 = (uint8_t *)sub_24D290DF8();
                  uint64_t v1079 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                  uint64_t v1081 = sub_24D263F98(0);
                  uint64_t v1082 = sub_24D263F98(1);
                  v1083 = &v1608;
                  v1608 = v1080;
                  v1084 = &v1607;
                  uint64_t v1607 = v1081;
                  v1085 = &v1606;
                  uint64_t v1606 = v1082;
                  sub_24D263FF4(2, &v1608);
                  sub_24D263FF4(1, v1083);
                  uint64_t v212 = v1198;
                  v1604 = v1394;
                  uint64_t v1605 = v1096;
                  sub_24D264008(&v1604, (uint64_t)v1083, (uint64_t)v1084, (uint64_t)v1085);
                  uint64_t v1086 = v212;
                  if (v212)
                  {
                    __break(1u);
                  }
                  else
                  {
                    v1604 = v1395;
                    uint64_t v1605 = v1097;
                    sub_24D264008(&v1604, (uint64_t)&v1608, (uint64_t)&v1607, (uint64_t)&v1606);
                    uint64_t v1077 = 0;
                    uint64_t v213 = v1077;
                    v1604 = v1396;
                    uint64_t v1605 = v1099;
                    sub_24D264008(&v1604, (uint64_t)&v1608, (uint64_t)&v1607, (uint64_t)&v1606);
                    uint64_t v1076 = v213;
                    _os_log_impl(&dword_24D227000, v1102, (os_log_type_t)v1103, "[Deduplication] [%s] 1.2.2 Newer sites wins", v1080, v1090);
                    sub_24D264054(v1081);
                    sub_24D264054(v1082);
                    sub_24D290DC8();
                    swift_release();
                    swift_release();
                    swift_release();
                    uint64_t v1078 = v1076;
                  }
                }
                else
                {
                  swift_release();
                  swift_release();
                  swift_release();
                  uint64_t v1078 = v1198;
                }
                uint64_t v1075 = v1078;

                (*(void (**)(uint64_t, uint64_t))(v1233 + 8))(v1540, v1232);
                uint64_t v1104 = v1075;
              }
              uint64_t v1073 = v1104;
              sub_24D25CAB4(v1553, v1570);
              sub_24D28EBE4(v1570, v1552);
              uint64_t v1074 = v1073;
            }
            else
            {
              BOOL v1072 = EnergySitePayload.hasCurrentRatePlan.getter();
              sub_24D25CAB4(v1553, v1562);
              if (v1072)
              {
                EnergySitePayload.currentRatePlan.getter(v1416);
                EnergySitePayload.currentRatePlan.getter(v1414);
                sub_24D25ACB4();
                int v1070 = sub_24D290B58() ^ 1;
                sub_24D24BE88((uint64_t)v1414);
                sub_24D24BE88((uint64_t)v1416);
                int v1071 = v1070;
              }
              else
              {
                int v1071 = 0;
              }
              int v1069 = v1071;
              sub_24D25CB50(v1562);
              if (v1069)
              {
                unsigned int v1068 = 1;
                sub_24D2299EC(v1549 & 1, v1538);
                if (((unsigned int (*)(uint64_t, void, uint64_t))v1235)(v1538, v1068, v1232) == 1)
                {
                  sub_24D28EB34(v1538);
                  uint64_t v1067 = v1198;
                }
                else
                {
                  swift_bridgeObjectRetain();
                  uint64_t v1055 = 32;
                  uint64_t v1056 = 7;
                  uint64_t v214 = swift_allocObject();
                  uint64_t v215 = v1256;
                  uint64_t v1057 = v214;
                  *(void *)(v214 + 16) = v1255;
                  *(void *)(v214 + 24) = v215;
                  v1065 = sub_24D290AA8();
                  int v1066 = sub_24D290D88();
                  v1052 = &v1616;
                  uint64_t v1616 = 12;
                  unint64_t v1050 = sub_24D26443C();
                  unint64_t v1051 = sub_24D2644B8();
                  sub_24D22D93C();
                  sub_24D290C68();
                  uint32_t v1053 = v1617;
                  uint64_t v1054 = 17;
                  uint64_t v1059 = swift_allocObject();
                  *(unsigned char *)(v1059 + 16) = 32;
                  uint64_t v1060 = swift_allocObject();
                  *(unsigned char *)(v1060 + 16) = 8;
                  uint64_t v216 = swift_allocObject();
                  uint64_t v217 = v1057;
                  uint64_t v1058 = v216;
                  *(void *)(v216 + 16) = v1387;
                  *(void *)(v216 + 24) = v217;
                  uint64_t v218 = swift_allocObject();
                  uint64_t v219 = v1058;
                  uint64_t v1062 = v218;
                  *(void *)(v218 + 16) = v1388;
                  *(void *)(v218 + 24) = v219;
                  uint64_t v1064 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
                  uint64_t v1061 = sub_24D290FA8();
                  v1063 = v220;
                  swift_retain();
                  uint64_t v221 = v1059;
                  uint64_t v222 = v1063;
                  *v1063 = v1389;
                  v222[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v221;
                  swift_retain();
                  uint64_t v223 = v1060;
                  uint64_t v224 = v1063;
                  v1063[2] = v1390;
                  v224[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v223;
                  swift_retain();
                  uint64_t v225 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v1062;
                  uint64_t v226 = v1063;
                  v1063[4] = v1391;
                  v226[5] = v225;
                  sub_24D22AD58();
                  swift_bridgeObjectRelease();
                  if (os_log_type_enabled(v1065, (os_log_type_t)v1066))
                  {
                    v1043 = (uint8_t *)sub_24D290DF8();
                    uint64_t v1042 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                    uint64_t v1044 = sub_24D263F98(0);
                    uint64_t v1045 = sub_24D263F98(1);
                    v1046 = &v1615;
                    v1615 = v1043;
                    v1047 = &v1614;
                    uint64_t v1614 = v1044;
                    v1048 = &v1613;
                    uint64_t v1613 = v1045;
                    sub_24D263FF4(2, &v1615);
                    sub_24D263FF4(1, v1046);
                    uint64_t v227 = v1198;
                    v1611 = v1389;
                    uint64_t v1612 = v1059;
                    sub_24D264008(&v1611, (uint64_t)v1046, (uint64_t)v1047, (uint64_t)v1048);
                    uint64_t v1049 = v227;
                    if (v227)
                    {
                      __break(1u);
                    }
                    else
                    {
                      v1611 = v1390;
                      uint64_t v1612 = v1060;
                      sub_24D264008(&v1611, (uint64_t)&v1615, (uint64_t)&v1614, (uint64_t)&v1613);
                      uint64_t v1040 = 0;
                      uint64_t v228 = v1040;
                      v1611 = v1391;
                      uint64_t v1612 = v1062;
                      sub_24D264008(&v1611, (uint64_t)&v1615, (uint64_t)&v1614, (uint64_t)&v1613);
                      uint64_t v1039 = v228;
                      _os_log_impl(&dword_24D227000, v1065, (os_log_type_t)v1066, "[Deduplication] [%s] 1.2.3 Newer sites wins", v1043, v1053);
                      sub_24D264054(v1044);
                      sub_24D264054(v1045);
                      sub_24D290DC8();
                      swift_release();
                      swift_release();
                      swift_release();
                      uint64_t v1041 = v1039;
                    }
                  }
                  else
                  {
                    swift_release();
                    swift_release();
                    swift_release();
                    uint64_t v1041 = v1198;
                  }
                  uint64_t v1038 = v1041;

                  (*(void (**)(uint64_t, uint64_t))(v1233 + 8))(v1538, v1232);
                  uint64_t v1067 = v1038;
                }
                uint64_t v1036 = v1067;
                sub_24D25CAB4(v1553, v1570);
                sub_24D28EBE4(v1570, v1552);
                uint64_t v1037 = v1036;
              }
              else
              {
                uint64_t v1652 = EnergySitePayload.siteVersion.getter();
                int v1650 = v1652;
                char v1651 = BYTE4(v1652) & 1;
                if ((v1652 & 0x100000000) != 0) {
                  int v1653 = 1;
                }
                else {
                  int v1653 = v1650;
                }
                unsigned int v1035 = v1653;
                uint64_t v1648 = EnergySitePayload.siteVersion.getter();
                unsigned int v1646 = v1648;
                char v1647 = BYTE4(v1648) & 1;
                if ((v1648 & 0x100000000) != 0) {
                  unsigned int v1649 = 1;
                }
                else {
                  unsigned int v1649 = v1646;
                }
                if (v1649 >= v1035)
                {
                  uint64_t v998 = EnergySitePayload.generationMeters.getter();
                  uint64_t v1001 = sub_24D290CD8();
                  swift_bridgeObjectRelease();
                  uint64_t v999 = EnergySitePayload.generationMeters.getter();
                  uint64_t v1000 = sub_24D290CD8();
                  swift_bridgeObjectRelease();
                  if (v1001 == v1000)
                  {
                    if (EnergySitePayload.hasExportedEnergy_p.getter()) {
                      int v964 = EnergySitePayload.hasExportedEnergy_p.getter() ^ 1;
                    }
                    else {
                      int v964 = 0;
                    }
                    if (v964)
                    {
                      unsigned int v963 = 1;
                      sub_24D2299EC(v1549 & 1, v1532);
                      if (((unsigned int (*)(uint64_t, void, uint64_t))v1235)(v1532, v963, v1232) == 1)
                      {
                        sub_24D28EB34(v1532);
                        uint64_t v962 = v1198;
                      }
                      else
                      {
                        swift_bridgeObjectRetain();
                        uint64_t v950 = 32;
                        uint64_t v951 = 7;
                        uint64_t v259 = swift_allocObject();
                        uint64_t v260 = v1256;
                        uint64_t v952 = v259;
                        *(void *)(v259 + 16) = v1255;
                        *(void *)(v259 + 24) = v260;
                        v960 = sub_24D290AA8();
                        int v961 = sub_24D290D88();
                        v947 = &v1637;
                        uint64_t v1637 = 12;
                        unint64_t v945 = sub_24D26443C();
                        unint64_t v946 = sub_24D2644B8();
                        sub_24D22D93C();
                        sub_24D290C68();
                        uint32_t v948 = v1638;
                        uint64_t v949 = 17;
                        uint64_t v954 = swift_allocObject();
                        *(unsigned char *)(v954 + 16) = 32;
                        uint64_t v955 = swift_allocObject();
                        *(unsigned char *)(v955 + 16) = 8;
                        uint64_t v261 = swift_allocObject();
                        uint64_t v262 = v952;
                        uint64_t v953 = v261;
                        *(void *)(v261 + 16) = v1372;
                        *(void *)(v261 + 24) = v262;
                        uint64_t v263 = swift_allocObject();
                        uint64_t v264 = v953;
                        uint64_t v957 = v263;
                        *(void *)(v263 + 16) = v1373;
                        *(void *)(v263 + 24) = v264;
                        uint64_t v959 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
                        uint64_t v956 = sub_24D290FA8();
                        v958 = v265;
                        swift_retain();
                        uint64_t v266 = v954;
                        uint64_t v267 = v958;
                        *v958 = v1374;
                        v267[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v266;
                        swift_retain();
                        uint64_t v268 = v955;
                        uint64_t v269 = v958;
                        v958[2] = v1375;
                        v269[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v268;
                        swift_retain();
                        id v270 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v957;
                        uint64_t v271 = v958;
                        v958[4] = v1376;
                        v271[5] = v270;
                        sub_24D22AD58();
                        swift_bridgeObjectRelease();
                        if (os_log_type_enabled(v960, (os_log_type_t)v961))
                        {
                          v938 = (uint8_t *)sub_24D290DF8();
                          uint64_t v937 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                          uint64_t v939 = sub_24D263F98(0);
                          uint64_t v940 = sub_24D263F98(1);
                          v941 = &v1636;
                          v1636 = v938;
                          v942 = &v1635;
                          uint64_t v1635 = v939;
                          v943 = &v1634;
                          uint64_t v1634 = v940;
                          sub_24D263FF4(2, &v1636);
                          sub_24D263FF4(1, v941);
                          uint64_t v272 = v1198;
                          v1632 = v1374;
                          uint64_t v1633 = v954;
                          sub_24D264008(&v1632, (uint64_t)v941, (uint64_t)v942, (uint64_t)v943);
                          uint64_t v944 = v272;
                          if (v272)
                          {
                            __break(1u);
                          }
                          else
                          {
                            v1632 = v1375;
                            uint64_t v1633 = v955;
                            sub_24D264008(&v1632, (uint64_t)&v1636, (uint64_t)&v1635, (uint64_t)&v1634);
                            uint64_t v935 = 0;
                            uint64_t v273 = v935;
                            v1632 = v1376;
                            uint64_t v1633 = v957;
                            sub_24D264008(&v1632, (uint64_t)&v1636, (uint64_t)&v1635, (uint64_t)&v1634);
                            uint64_t v934 = v273;
                            _os_log_impl(&dword_24D227000, v960, (os_log_type_t)v961, "[Deduplication] [%s] 1.2.6 Newer sites wins", v938, v948);
                            sub_24D264054(v939);
                            sub_24D264054(v940);
                            sub_24D290DC8();
                            swift_release();
                            swift_release();
                            swift_release();
                            uint64_t v936 = v934;
                          }
                        }
                        else
                        {
                          swift_release();
                          swift_release();
                          swift_release();
                          uint64_t v936 = v1198;
                        }
                        uint64_t v933 = v936;

                        (*(void (**)(uint64_t, uint64_t))(v1233 + 8))(v1532, v1232);
                        uint64_t v962 = v933;
                      }
                      uint64_t v931 = v962;
                      sub_24D25CAB4(v1553, v1570);
                      sub_24D28EBE4(v1570, v1552);
                      uint64_t v932 = v931;
                    }
                    else
                    {
                      unsigned int v930 = 1;
                      sub_24D2299EC(v1549 & 1, v1530);
                      if (((unsigned int (*)(uint64_t, void, uint64_t))v1235)(v1530, v930, v1232) == 1)
                      {
                        sub_24D28EB34(v1530);
                        uint64_t v929 = v1198;
                      }
                      else
                      {
                        swift_bridgeObjectRetain();
                        uint64_t v917 = 32;
                        uint64_t v918 = 7;
                        uint64_t v274 = swift_allocObject();
                        uint64_t v275 = v1256;
                        uint64_t v919 = v274;
                        *(void *)(v274 + 16) = v1255;
                        *(void *)(v274 + 24) = v275;
                        v927 = sub_24D290AA8();
                        int v928 = sub_24D290D88();
                        v914 = &v1644;
                        uint64_t v1644 = 12;
                        unint64_t v912 = sub_24D26443C();
                        unint64_t v913 = sub_24D2644B8();
                        sub_24D22D93C();
                        sub_24D290C68();
                        uint32_t v915 = v1645;
                        uint64_t v916 = 17;
                        uint64_t v921 = swift_allocObject();
                        *(unsigned char *)(v921 + 16) = 32;
                        uint64_t v922 = swift_allocObject();
                        *(unsigned char *)(v922 + 16) = 8;
                        uint64_t v276 = swift_allocObject();
                        uint64_t v277 = v919;
                        uint64_t v920 = v276;
                        *(void *)(v276 + 16) = v1367;
                        *(void *)(v276 + 24) = v277;
                        uint64_t v278 = swift_allocObject();
                        uint64_t v279 = v920;
                        uint64_t v924 = v278;
                        *(void *)(v278 + 16) = v1368;
                        *(void *)(v278 + 24) = v279;
                        uint64_t v926 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
                        uint64_t v923 = sub_24D290FA8();
                        v925 = v280;
                        swift_retain();
                        uint64_t v281 = v921;
                        uint64_t v282 = v925;
                        *v925 = v1369;
                        v282[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v281;
                        swift_retain();
                        uint64_t v283 = v922;
                        unint64_t v284 = v925;
                        v925[2] = v1370;
                        v284[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v283;
                        swift_retain();
                        uint64_t v285 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v924;
                        uint64_t v286 = v925;
                        v925[4] = v1371;
                        v286[5] = v285;
                        sub_24D22AD58();
                        swift_bridgeObjectRelease();
                        if (os_log_type_enabled(v927, (os_log_type_t)v928))
                        {
                          v905 = (uint8_t *)sub_24D290DF8();
                          uint64_t v904 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                          uint64_t v906 = sub_24D263F98(0);
                          uint64_t v907 = sub_24D263F98(1);
                          v908 = &v1643;
                          v1643 = v905;
                          v909 = &v1642;
                          uint64_t v1642 = v906;
                          v910 = &v1641;
                          uint64_t v1641 = v907;
                          sub_24D263FF4(2, &v1643);
                          sub_24D263FF4(1, v908);
                          uint64_t v287 = v1198;
                          v1639 = v1369;
                          uint64_t v1640 = v921;
                          sub_24D264008(&v1639, (uint64_t)v908, (uint64_t)v909, (uint64_t)v910);
                          uint64_t v911 = v287;
                          if (v287)
                          {
                            __break(1u);
                          }
                          else
                          {
                            v1639 = v1370;
                            uint64_t v1640 = v922;
                            sub_24D264008(&v1639, (uint64_t)&v1643, (uint64_t)&v1642, (uint64_t)&v1641);
                            uint64_t v902 = 0;
                            uint64_t v288 = v902;
                            v1639 = v1371;
                            uint64_t v1640 = v924;
                            sub_24D264008(&v1639, (uint64_t)&v1643, (uint64_t)&v1642, (uint64_t)&v1641);
                            uint64_t v901 = v288;
                            _os_log_impl(&dword_24D227000, v927, (os_log_type_t)v928, "[Deduplication] [%s] 1.2.7 older sites wins", v905, v915);
                            sub_24D264054(v906);
                            sub_24D264054(v907);
                            sub_24D290DC8();
                            swift_release();
                            swift_release();
                            swift_release();
                            uint64_t v903 = v901;
                          }
                        }
                        else
                        {
                          swift_release();
                          swift_release();
                          swift_release();
                          uint64_t v903 = v1198;
                        }
                        uint64_t v900 = v903;

                        (*(void (**)(uint64_t, uint64_t))(v1233 + 8))(v1530, v1232);
                        uint64_t v929 = v900;
                      }
                      uint64_t v932 = v929;
                    }
                    uint64_t v966 = v932;
                  }
                  else
                  {
                    unsigned int v997 = 1;
                    sub_24D2299EC(v1549 & 1, v1534);
                    if (((unsigned int (*)(uint64_t, void, uint64_t))v1235)(v1534, v997, v1232) == 1)
                    {
                      sub_24D28EB34(v1534);
                      uint64_t v996 = v1198;
                    }
                    else
                    {
                      swift_bridgeObjectRetain();
                      uint64_t v984 = 32;
                      uint64_t v985 = 7;
                      uint64_t v244 = swift_allocObject();
                      uint64_t v245 = v1256;
                      uint64_t v986 = v244;
                      *(void *)(v244 + 16) = v1255;
                      *(void *)(v244 + 24) = v245;
                      v994 = sub_24D290AA8();
                      int v995 = sub_24D290D88();
                      v981 = &v1630;
                      uint64_t v1630 = 12;
                      unint64_t v979 = sub_24D26443C();
                      unint64_t v980 = sub_24D2644B8();
                      sub_24D22D93C();
                      sub_24D290C68();
                      uint32_t v982 = v1631;
                      uint64_t v983 = 17;
                      uint64_t v988 = swift_allocObject();
                      *(unsigned char *)(v988 + 16) = 32;
                      uint64_t v989 = swift_allocObject();
                      *(unsigned char *)(v989 + 16) = 8;
                      uint64_t v246 = swift_allocObject();
                      uint64_t v247 = v986;
                      uint64_t v987 = v246;
                      *(void *)(v246 + 16) = v1377;
                      *(void *)(v246 + 24) = v247;
                      uint64_t v248 = swift_allocObject();
                      uint64_t v249 = v987;
                      uint64_t v991 = v248;
                      *(void *)(v248 + 16) = v1378;
                      *(void *)(v248 + 24) = v249;
                      uint64_t v993 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
                      uint64_t v990 = sub_24D290FA8();
                      v992 = v250;
                      swift_retain();
                      uint64_t v251 = v988;
                      uint64_t v252 = v992;
                      *v992 = v1379;
                      v252[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v251;
                      swift_retain();
                      uint64_t v253 = v989;
                      uint64_t v254 = v992;
                      v992[2] = v1380;
                      v254[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v253;
                      swift_retain();
                      unint64_t v255 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v991;
                      uint64_t v256 = v992;
                      v992[4] = v1381;
                      v256[5] = v255;
                      sub_24D22AD58();
                      swift_bridgeObjectRelease();
                      if (os_log_type_enabled(v994, (os_log_type_t)v995))
                      {
                        v972 = (uint8_t *)sub_24D290DF8();
                        uint64_t v971 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                        uint64_t v973 = sub_24D263F98(0);
                        uint64_t v974 = sub_24D263F98(1);
                        v975 = &v1629;
                        v1629 = v972;
                        v976 = &v1628;
                        uint64_t v1628 = v973;
                        v977 = &v1627;
                        uint64_t v1627 = v974;
                        sub_24D263FF4(2, &v1629);
                        sub_24D263FF4(1, v975);
                        uint64_t v257 = v1198;
                        v1625 = v1379;
                        uint64_t v1626 = v988;
                        sub_24D264008(&v1625, (uint64_t)v975, (uint64_t)v976, (uint64_t)v977);
                        uint64_t v978 = v257;
                        if (v257)
                        {
                          __break(1u);
                        }
                        else
                        {
                          v1625 = v1380;
                          uint64_t v1626 = v989;
                          sub_24D264008(&v1625, (uint64_t)&v1629, (uint64_t)&v1628, (uint64_t)&v1627);
                          uint64_t v969 = 0;
                          uint64_t v258 = v969;
                          v1625 = v1381;
                          uint64_t v1626 = v991;
                          sub_24D264008(&v1625, (uint64_t)&v1629, (uint64_t)&v1628, (uint64_t)&v1627);
                          uint64_t v968 = v258;
                          _os_log_impl(&dword_24D227000, v994, (os_log_type_t)v995, "[Deduplication] [%s] 1.2.5 Newer sites wins", v972, v982);
                          sub_24D264054(v973);
                          sub_24D264054(v974);
                          sub_24D290DC8();
                          swift_release();
                          swift_release();
                          swift_release();
                          uint64_t v970 = v968;
                        }
                      }
                      else
                      {
                        swift_release();
                        swift_release();
                        swift_release();
                        uint64_t v970 = v1198;
                      }
                      uint64_t v967 = v970;

                      (*(void (**)(uint64_t, uint64_t))(v1233 + 8))(v1534, v1232);
                      uint64_t v996 = v967;
                    }
                    uint64_t v965 = v996;
                    sub_24D25CAB4(v1553, v1570);
                    sub_24D28EBE4(v1570, v1552);
                    uint64_t v966 = v965;
                  }
                  uint64_t v1003 = v966;
                }
                else
                {
                  unsigned int v1034 = 1;
                  sub_24D2299EC(v1549 & 1, v1536);
                  if (((unsigned int (*)(uint64_t, void, uint64_t))v1235)(v1536, v1034, v1232) == 1)
                  {
                    sub_24D28EB34(v1536);
                    uint64_t v1033 = v1198;
                  }
                  else
                  {
                    swift_bridgeObjectRetain();
                    uint64_t v1021 = 32;
                    uint64_t v1022 = 7;
                    uint64_t v229 = swift_allocObject();
                    uint64_t v230 = v1256;
                    uint64_t v1023 = v229;
                    *(void *)(v229 + 16) = v1255;
                    *(void *)(v229 + 24) = v230;
                    v1031 = sub_24D290AA8();
                    int v1032 = sub_24D290D88();
                    v1018 = &v1623;
                    uint64_t v1623 = 12;
                    unint64_t v1016 = sub_24D26443C();
                    unint64_t v1017 = sub_24D2644B8();
                    sub_24D22D93C();
                    sub_24D290C68();
                    uint32_t v1019 = v1624;
                    uint64_t v1020 = 17;
                    uint64_t v1025 = swift_allocObject();
                    *(unsigned char *)(v1025 + 16) = 32;
                    uint64_t v1026 = swift_allocObject();
                    *(unsigned char *)(v1026 + 16) = 8;
                    uint64_t v231 = swift_allocObject();
                    uint64_t v232 = v1023;
                    uint64_t v1024 = v231;
                    *(void *)(v231 + 16) = v1382;
                    *(void *)(v231 + 24) = v232;
                    uint64_t v233 = swift_allocObject();
                    uint64_t v234 = v1024;
                    uint64_t v1028 = v233;
                    *(void *)(v233 + 16) = v1383;
                    *(void *)(v233 + 24) = v234;
                    uint64_t v1030 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
                    uint64_t v1027 = sub_24D290FA8();
                    v1029 = v235;
                    swift_retain();
                    uint64_t v236 = v1025;
                    uint64_t v237 = v1029;
                    *v1029 = v1384;
                    v237[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v236;
                    swift_retain();
                    uint64_t v238 = v1026;
                    uint64_t v239 = v1029;
                    v1029[2] = v1385;
                    v239[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v238;
                    swift_retain();
                    id v240 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v1028;
                    uint64_t v241 = v1029;
                    v1029[4] = v1386;
                    v241[5] = v240;
                    sub_24D22AD58();
                    swift_bridgeObjectRelease();
                    if (os_log_type_enabled(v1031, (os_log_type_t)v1032))
                    {
                      v1009 = (uint8_t *)sub_24D290DF8();
                      uint64_t v1008 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                      uint64_t v1010 = sub_24D263F98(0);
                      uint64_t v1011 = sub_24D263F98(1);
                      v1012 = &v1622;
                      v1622 = v1009;
                      v1013 = &v1621;
                      uint64_t v1621 = v1010;
                      v1014 = &v1620;
                      uint64_t v1620 = v1011;
                      sub_24D263FF4(2, &v1622);
                      sub_24D263FF4(1, v1012);
                      uint64_t v242 = v1198;
                      v1618 = v1384;
                      uint64_t v1619 = v1025;
                      sub_24D264008(&v1618, (uint64_t)v1012, (uint64_t)v1013, (uint64_t)v1014);
                      uint64_t v1015 = v242;
                      if (v242)
                      {
                        __break(1u);
                      }
                      else
                      {
                        v1618 = v1385;
                        uint64_t v1619 = v1026;
                        sub_24D264008(&v1618, (uint64_t)&v1622, (uint64_t)&v1621, (uint64_t)&v1620);
                        uint64_t v1006 = 0;
                        uint64_t v243 = v1006;
                        v1618 = v1386;
                        uint64_t v1619 = v1028;
                        sub_24D264008(&v1618, (uint64_t)&v1622, (uint64_t)&v1621, (uint64_t)&v1620);
                        uint64_t v1005 = v243;
                        _os_log_impl(&dword_24D227000, v1031, (os_log_type_t)v1032, "[Deduplication] [%s] 1.2.4 Newer sites wins", v1009, v1019);
                        sub_24D264054(v1010);
                        sub_24D264054(v1011);
                        sub_24D290DC8();
                        swift_release();
                        swift_release();
                        swift_release();
                        uint64_t v1007 = v1005;
                      }
                    }
                    else
                    {
                      swift_release();
                      swift_release();
                      swift_release();
                      uint64_t v1007 = v1198;
                    }
                    uint64_t v1004 = v1007;

                    (*(void (**)(uint64_t, uint64_t))(v1233 + 8))(v1536, v1232);
                    uint64_t v1033 = v1004;
                  }
                  uint64_t v1002 = v1033;
                  sub_24D25CAB4(v1553, v1570);
                  sub_24D28EBE4(v1570, v1552);
                  uint64_t v1003 = v1002;
                }
                uint64_t v1037 = v1003;
              }
              uint64_t v1074 = v1037;
            }
            uint64_t v1118 = v1074;
          }
          uint64_t v899 = v1118;
          v1151(v1493, v1468);
          v1151(v1495, v1468);
          uint64_t v1158 = v899;
        }
        else
        {
          v898 = *(void (**)(char *, uint64_t))(v1469 + 8);
          uint64_t v897 = v1469 + 8;
          v898(v1493, v1468);
          v898(v1495, v1468);
          uint64_t v1158 = v1198;
        }
      }
    }
    uint64_t v1164 = v1158;
    goto LABEL_202;
  }
  EnergySitePayload.accessToken.getter();
  uint64_t v894 = v289;
  int v895 = sub_24D290C28();
  swift_bridgeObjectRelease();
  if (v895)
  {
    int v893 = 0;
  }
  else
  {
    EnergySitePayload.refreshToken.getter();
    uint64_t v891 = v290;
    int v892 = sub_24D290C28();
    swift_bridgeObjectRelease();
    int v893 = v892 ^ 1;
  }
  if (v893)
  {
    EnergySitePayload.ckFunctionToken.getter();
    uint64_t v888 = v291;
    int v889 = sub_24D290C28();
    swift_bridgeObjectRelease();
    int v890 = v889 ^ 1;
  }
  else
  {
    int v890 = 0;
  }
  if (v890)
  {
    unsigned int v882 = 1;
    sub_24D2299EC(v1549 & 1, v1528);
    uint64_t v883 = sub_24D290AC8();
    uint64_t v884 = *(void *)(v883 - 8);
    uint64_t v885 = v883 - 8;
    v886 = *(unsigned int (**)(uint64_t, void))(v884 + 48);
    uint64_t v887 = v884 + 48;
    if (v886(v1528, v882) == 1)
    {
      sub_24D28EB34(v1528);
      uint64_t v881 = v1254;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v869 = 32;
      uint64_t v870 = 7;
      uint64_t v292 = swift_allocObject();
      uint64_t v293 = v1256;
      uint64_t v871 = v292;
      *(void *)(v292 + 16) = v1255;
      *(void *)(v292 + 24) = v293;
      v879 = sub_24D290AA8();
      int v880 = sub_24D290D88();
      v866 = &v1659;
      uint64_t v1659 = 12;
      unint64_t v864 = sub_24D26443C();
      unint64_t v865 = sub_24D2644B8();
      sub_24D22D93C();
      sub_24D290C68();
      uint32_t v867 = v1660;
      uint64_t v868 = 17;
      uint64_t v873 = swift_allocObject();
      *(unsigned char *)(v873 + 16) = 32;
      uint64_t v874 = swift_allocObject();
      *(unsigned char *)(v874 + 16) = 8;
      uint64_t v294 = swift_allocObject();
      uint64_t v295 = v871;
      uint64_t v872 = v294;
      *(void *)(v294 + 16) = v1352;
      *(void *)(v294 + 24) = v295;
      uint64_t v296 = swift_allocObject();
      uint64_t v297 = v872;
      uint64_t v876 = v296;
      *(void *)(v296 + 16) = v1353;
      *(void *)(v296 + 24) = v297;
      uint64_t v878 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
      uint64_t v875 = sub_24D290FA8();
      v877 = v298;
      swift_retain();
      uint64_t v299 = v873;
      uint64_t v300 = v877;
      *v877 = v1354;
      v300[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v299;
      swift_retain();
      uint64_t v301 = v874;
      uint64_t v302 = v877;
      v877[2] = v1355;
      v302[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v301;
      swift_retain();
      uint64_t v303 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v876;
      id v304 = v877;
      v877[4] = v1356;
      v304[5] = v303;
      sub_24D22AD58();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v879, (os_log_type_t)v880))
      {
        v857 = (uint8_t *)sub_24D290DF8();
        uint64_t v856 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
        uint64_t v858 = sub_24D263F98(0);
        uint64_t v859 = sub_24D263F98(1);
        v860 = &v1658;
        v1658 = v857;
        v861 = &v1657;
        uint64_t v1657 = v858;
        v862 = &v1656;
        uint64_t v1656 = v859;
        sub_24D263FF4(2, &v1658);
        sub_24D263FF4(1, v860);
        uint64_t v305 = v1254;
        v1654 = v1354;
        uint64_t v1655 = v873;
        sub_24D264008(&v1654, (uint64_t)v860, (uint64_t)v861, (uint64_t)v862);
        uint64_t v863 = v305;
        if (v305)
        {
          __break(1u);
        }
        else
        {
          v1654 = v1355;
          uint64_t v1655 = v874;
          sub_24D264008(&v1654, (uint64_t)&v1658, (uint64_t)&v1657, (uint64_t)&v1656);
          uint64_t v854 = 0;
          uint64_t v306 = v854;
          v1654 = v1356;
          uint64_t v1655 = v876;
          sub_24D264008(&v1654, (uint64_t)&v1658, (uint64_t)&v1657, (uint64_t)&v1656);
          uint64_t v853 = v306;
          _os_log_impl(&dword_24D227000, v879, (os_log_type_t)v880, "[Deduplication] [%s] Old site onboarded", v857, v867);
          sub_24D264054(v858);
          sub_24D264054(v859);
          sub_24D290DC8();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v855 = v853;
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        uint64_t v855 = v1254;
      }
      uint64_t v852 = v855;

      (*(void (**)(uint64_t, uint64_t))(v884 + 8))(v1528, v883);
      uint64_t v881 = v852;
    }
    uint64_t v849 = v881;
    sub_24D23A408(v1551, v1455);
    v850 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1469 + 48);
    uint64_t v851 = v1469 + 48;
    if (v850((uint64_t)v1455, 1, v1468) == 1)
    {
      sub_24D23A530((uint64_t)v1455);
      uint64_t v848 = v849;
    }
    else
    {
      v846 = *(void (**)(char *, char *, uint64_t))(v1469 + 32);
      uint64_t v847 = v1469 + 32;
      v846(v1487, v1455, v1468);
      EnergySitePayload.siteTombstone.getter(v1434);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1418 + 48))(v1434, 1, v1417) == 1)
      {
        sub_24D24C310((uint64_t)v1434);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1469 + 56))(v1453, 1, 1, v1468);
      }
      else
      {
        sub_24D290878();
        (*(void (**)(char *, uint64_t))(v1418 + 8))(v1434, v1417);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v1469 + 56))(v1453, 0, 1, v1468);
      }
      if (v850((uint64_t)v1453, 1, v1468) == 1)
      {
        sub_24D290538();
        sub_24D23A530((uint64_t)v1453);
      }
      else
      {
        v846(v1485, v1453, v1468);
      }
      int v845 = sub_24D2905B8();
      v843 = *(void (**)(char *, uint64_t))(v1469 + 8);
      uint64_t v844 = v1469 + 8;
      v843(v1485, v1468);
      if (v845)
      {
        unsigned int v842 = 1;
        sub_24D2299EC(v1549 & 1, v1526);
        if (((unsigned int (*)(uint64_t, void, uint64_t))v886)(v1526, v842, v883) == 1)
        {
          sub_24D28EB34(v1526);
          uint64_t v841 = v849;
        }
        else
        {
          swift_bridgeObjectRetain();
          uint64_t v829 = 32;
          uint64_t v830 = 7;
          uint64_t v307 = swift_allocObject();
          uint64_t v308 = v1256;
          uint64_t v831 = v307;
          *(void *)(v307 + 16) = v1255;
          *(void *)(v307 + 24) = v308;
          v839 = sub_24D290AA8();
          int v840 = sub_24D290D88();
          v826 = &v1666;
          uint64_t v1666 = 12;
          unint64_t v824 = sub_24D26443C();
          unint64_t v825 = sub_24D2644B8();
          sub_24D22D93C();
          sub_24D290C68();
          uint32_t v827 = v1667;
          uint64_t v828 = 17;
          uint64_t v833 = swift_allocObject();
          *(unsigned char *)(v833 + 16) = 32;
          uint64_t v834 = swift_allocObject();
          *(unsigned char *)(v834 + 16) = 8;
          uint64_t v309 = swift_allocObject();
          uint64_t v310 = v831;
          uint64_t v832 = v309;
          *(void *)(v309 + 16) = v1357;
          *(void *)(v309 + 24) = v310;
          uint64_t v311 = swift_allocObject();
          uint64_t v312 = v832;
          uint64_t v836 = v311;
          *(void *)(v311 + 16) = v1358;
          *(void *)(v311 + 24) = v312;
          uint64_t v838 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
          uint64_t v835 = sub_24D290FA8();
          v837 = v313;
          swift_retain();
          uint64_t v314 = v833;
          uint64_t v315 = v837;
          *v837 = v1359;
          v315[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v314;
          swift_retain();
          uint64_t v316 = v834;
          uint64_t v317 = v837;
          v837[2] = v1360;
          v317[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v316;
          swift_retain();
          uint64_t v318 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v836;
          uint64_t v319 = v837;
          v837[4] = v1361;
          v319[5] = v318;
          sub_24D22AD58();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v839, (os_log_type_t)v840))
          {
            v817 = (uint8_t *)sub_24D290DF8();
            uint64_t v816 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
            uint64_t v818 = sub_24D263F98(0);
            uint64_t v819 = sub_24D263F98(1);
            v820 = &v1665;
            v1665 = v817;
            v821 = &v1664;
            uint64_t v1664 = v818;
            v822 = &v1663;
            uint64_t v1663 = v819;
            sub_24D263FF4(2, &v1665);
            sub_24D263FF4(1, v820);
            uint64_t v320 = v849;
            v1661 = v1359;
            uint64_t v1662 = v833;
            sub_24D264008(&v1661, (uint64_t)v820, (uint64_t)v821, (uint64_t)v822);
            uint64_t v823 = v320;
            if (v320)
            {
              __break(1u);
            }
            else
            {
              v1661 = v1360;
              uint64_t v1662 = v834;
              sub_24D264008(&v1661, (uint64_t)&v1665, (uint64_t)&v1664, (uint64_t)&v1663);
              uint64_t v814 = 0;
              uint64_t v321 = v814;
              v1661 = v1361;
              uint64_t v1662 = v836;
              sub_24D264008(&v1661, (uint64_t)&v1665, (uint64_t)&v1664, (uint64_t)&v1663);
              uint64_t v813 = v321;
              _os_log_impl(&dword_24D227000, v839, (os_log_type_t)v840, "[Deduplication] [%s] 2.1 Newer sites wins", v817, v827);
              sub_24D264054(v818);
              sub_24D264054(v819);
              sub_24D290DC8();
              swift_release();
              swift_release();
              swift_release();
              uint64_t v815 = v813;
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            uint64_t v815 = v849;
          }
          uint64_t v812 = v815;

          (*(void (**)(uint64_t, uint64_t))(v884 + 8))(v1526, v883);
          uint64_t v841 = v812;
        }
        uint64_t v811 = v841;
        sub_24D25CAB4(v1553, v1570);
        sub_24D28EBE4(v1570, v1552);
        v843(v1487, v1468);
        uint64_t v848 = v811;
      }
      else
      {
        v843(v1487, v1468);
        uint64_t v848 = v849;
      }
    }
    uint64_t v810 = v848;
  }
  else
  {
    EnergySitePayload.accessToken.getter();
    uint64_t v808 = v322;
    int v809 = sub_24D290C28();
    swift_bridgeObjectRelease();
    sub_24D25CAB4(v1553, v1560);
    if (v809)
    {
      int v807 = 0;
    }
    else
    {
      EnergySitePayload.refreshToken.getter();
      uint64_t v805 = v323;
      int v806 = sub_24D290C28();
      swift_bridgeObjectRelease();
      int v807 = v806 ^ 1;
    }
    int v804 = v807;
    sub_24D25CB50(v1560);
    sub_24D25CAB4(v1553, v1558);
    if (v804)
    {
      EnergySitePayload.ckFunctionToken.getter();
      uint64_t v801 = v324;
      int v802 = sub_24D290C28();
      swift_bridgeObjectRelease();
      int v803 = v802 ^ 1;
    }
    else
    {
      int v803 = 0;
    }
    int v800 = v803;
    sub_24D25CB50(v1558);
    if (v800)
    {
      unsigned int v794 = 1;
      sub_24D2299EC(v1549 & 1, v1524);
      uint64_t v795 = sub_24D290AC8();
      uint64_t v796 = *(void *)(v795 - 8);
      uint64_t v797 = v795 - 8;
      v798 = *(unsigned int (**)(uint64_t, void))(v796 + 48);
      uint64_t v799 = v796 + 48;
      if (v798(v1524, v794) == 1)
      {
        sub_24D28EB34(v1524);
        uint64_t v793 = v1254;
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v781 = 32;
        uint64_t v782 = 7;
        uint64_t v325 = swift_allocObject();
        uint64_t v326 = v1256;
        uint64_t v783 = v325;
        *(void *)(v325 + 16) = v1255;
        *(void *)(v325 + 24) = v326;
        v791 = sub_24D290AA8();
        int v792 = sub_24D290D88();
        v778 = &v1673;
        uint64_t v1673 = 12;
        unint64_t v776 = sub_24D26443C();
        unint64_t v777 = sub_24D2644B8();
        sub_24D22D93C();
        sub_24D290C68();
        uint32_t v779 = v1674;
        uint64_t v780 = 17;
        uint64_t v785 = swift_allocObject();
        *(unsigned char *)(v785 + 16) = 32;
        uint64_t v786 = swift_allocObject();
        *(unsigned char *)(v786 + 16) = 8;
        uint64_t v327 = swift_allocObject();
        uint64_t v328 = v783;
        uint64_t v784 = v327;
        *(void *)(v327 + 16) = v1342;
        *(void *)(v327 + 24) = v328;
        uint64_t v329 = swift_allocObject();
        uint64_t v330 = v784;
        uint64_t v788 = v329;
        *(void *)(v329 + 16) = v1343;
        *(void *)(v329 + 24) = v330;
        uint64_t v790 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
        uint64_t v787 = sub_24D290FA8();
        v789 = v331;
        swift_retain();
        uint64_t v332 = v785;
        uint64_t v333 = v789;
        *v789 = v1344;
        v333[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v332;
        swift_retain();
        uint64_t v334 = v786;
        uint64_t v335 = v789;
        v789[2] = v1345;
        v335[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v334;
        swift_retain();
        uint64_t v336 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v788;
        uint64_t v337 = v789;
        v789[4] = v1346;
        v337[5] = v336;
        sub_24D22AD58();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v791, (os_log_type_t)v792))
        {
          v769 = (uint8_t *)sub_24D290DF8();
          uint64_t v768 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
          uint64_t v770 = sub_24D263F98(0);
          uint64_t v771 = sub_24D263F98(1);
          v772 = &v1672;
          v1672 = v769;
          v773 = &v1671;
          uint64_t v1671 = v770;
          v774 = &v1670;
          uint64_t v1670 = v771;
          sub_24D263FF4(2, &v1672);
          sub_24D263FF4(1, v772);
          uint64_t v338 = v1254;
          v1668 = v1344;
          uint64_t v1669 = v785;
          sub_24D264008(&v1668, (uint64_t)v772, (uint64_t)v773, (uint64_t)v774);
          uint64_t v775 = v338;
          if (v338)
          {
            __break(1u);
          }
          else
          {
            v1668 = v1345;
            uint64_t v1669 = v786;
            sub_24D264008(&v1668, (uint64_t)&v1672, (uint64_t)&v1671, (uint64_t)&v1670);
            uint64_t v766 = 0;
            uint64_t v339 = v766;
            v1668 = v1346;
            uint64_t v1669 = v788;
            sub_24D264008(&v1668, (uint64_t)&v1672, (uint64_t)&v1671, (uint64_t)&v1670);
            uint64_t v765 = v339;
            _os_log_impl(&dword_24D227000, v791, (os_log_type_t)v792, "[Deduplication] [%s] new site onboarded", v769, v779);
            sub_24D264054(v770);
            sub_24D264054(v771);
            sub_24D290DC8();
            swift_release();
            swift_release();
            swift_release();
            uint64_t v767 = v765;
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          uint64_t v767 = v1254;
        }
        uint64_t v764 = v767;

        (*(void (**)(uint64_t, uint64_t))(v796 + 8))(v1524, v795);
        uint64_t v793 = v764;
      }
      uint64_t v761 = v793;
      sub_24D23A408(v1550, v1451);
      v762 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1469 + 48);
      uint64_t v763 = v1469 + 48;
      if (v762((uint64_t)v1451, 1, v1468) == 1)
      {
        sub_24D23A530((uint64_t)v1451);
        uint64_t v760 = v761;
      }
      else
      {
        v757 = *(void (**)(char *, char *, uint64_t))(v1469 + 32);
        uint64_t v758 = v1469 + 32;
        v757(v1483, v1451, v1468);
        EnergySitePayload.siteTombstone.getter(v1432);
        if ((*(uint64_t (**)(char *, uint64_t, uint64_t))(v1418 + 48))(v1432, 1, v1417) == 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v1418 + 16))(v1421, v1432, v1417);
          sub_24D24C310((uint64_t)v1432);
          sub_24D290878();
          (*(void (**)(char *, uint64_t))(v1418 + 8))(v1421, v1417);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v1469 + 56))(v1449, 0, 1, v1468);
        }
        else
        {
          sub_24D24C310((uint64_t)v1432);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1469 + 56))(v1449, 1, 1, v1468);
        }
        if (v762((uint64_t)v1449, 1, v1468) == 1)
        {
          sub_24D290538();
          sub_24D23A530((uint64_t)v1449);
        }
        else
        {
          v757(v1481, v1449, v1468);
        }
        int v756 = sub_24D2905C8();
        v754 = *(void (**)(char *, uint64_t))(v1469 + 8);
        uint64_t v755 = v1469 + 8;
        v754(v1481, v1468);
        if (v756)
        {
          unsigned int v753 = 1;
          sub_24D2299EC(v1549 & 1, v1522);
          if (((unsigned int (*)(uint64_t, void, uint64_t))v798)(v1522, v753, v795) == 1)
          {
            sub_24D28EB34(v1522);
            uint64_t v752 = v761;
          }
          else
          {
            swift_bridgeObjectRetain();
            uint64_t v740 = 32;
            uint64_t v741 = 7;
            uint64_t v340 = swift_allocObject();
            uint64_t v341 = v1256;
            uint64_t v742 = v340;
            *(void *)(v340 + 16) = v1255;
            *(void *)(v340 + 24) = v341;
            v750 = sub_24D290AA8();
            int v751 = sub_24D290D88();
            v737 = &v1680;
            uint64_t v1680 = 12;
            unint64_t v735 = sub_24D26443C();
            unint64_t v736 = sub_24D2644B8();
            sub_24D22D93C();
            sub_24D290C68();
            uint32_t v738 = v1681;
            uint64_t v739 = 17;
            uint64_t v744 = swift_allocObject();
            *(unsigned char *)(v744 + 16) = 32;
            uint64_t v745 = swift_allocObject();
            *(unsigned char *)(v745 + 16) = 8;
            uint64_t v342 = swift_allocObject();
            uint64_t v343 = v742;
            uint64_t v743 = v342;
            *(void *)(v342 + 16) = v1347;
            *(void *)(v342 + 24) = v343;
            uint64_t v344 = swift_allocObject();
            uint64_t v345 = v743;
            uint64_t v747 = v344;
            *(void *)(v344 + 16) = v1348;
            *(void *)(v344 + 24) = v345;
            uint64_t v749 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
            uint64_t v746 = sub_24D290FA8();
            v748 = v346;
            swift_retain();
            uint64_t v347 = v744;
            uint64_t v348 = v748;
            *v748 = v1349;
            v348[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v347;
            swift_retain();
            uint64_t v349 = v745;
            id v350 = v748;
            v748[2] = v1350;
            v350[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v349;
            swift_retain();
            unint64_t v351 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v747;
            uint64_t v352 = v748;
            v748[4] = v1351;
            v352[5] = v351;
            sub_24D22AD58();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v750, (os_log_type_t)v751))
            {
              v728 = (uint8_t *)sub_24D290DF8();
              uint64_t v727 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
              uint64_t v729 = sub_24D263F98(0);
              uint64_t v730 = sub_24D263F98(1);
              v731 = &v1679;
              v1679 = v728;
              v732 = &v1678;
              uint64_t v1678 = v729;
              v733 = &v1677;
              uint64_t v1677 = v730;
              sub_24D263FF4(2, &v1679);
              sub_24D263FF4(1, v731);
              uint64_t v353 = v761;
              v1675 = v1349;
              uint64_t v1676 = v744;
              sub_24D264008(&v1675, (uint64_t)v731, (uint64_t)v732, (uint64_t)v733);
              uint64_t v734 = v353;
              if (v353)
              {
                __break(1u);
              }
              else
              {
                v1675 = v1350;
                uint64_t v1676 = v745;
                sub_24D264008(&v1675, (uint64_t)&v1679, (uint64_t)&v1678, (uint64_t)&v1677);
                uint64_t v725 = 0;
                uint64_t v354 = v725;
                v1675 = v1351;
                uint64_t v1676 = v747;
                sub_24D264008(&v1675, (uint64_t)&v1679, (uint64_t)&v1678, (uint64_t)&v1677);
                uint64_t v724 = v354;
                _os_log_impl(&dword_24D227000, v750, (os_log_type_t)v751, "[Deduplication] [%s] 3.1 Newer sites wins", v728, v738);
                sub_24D264054(v729);
                sub_24D264054(v730);
                sub_24D290DC8();
                swift_release();
                swift_release();
                swift_release();
                uint64_t v726 = v724;
              }
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
              uint64_t v726 = v761;
            }
            uint64_t v723 = v726;

            (*(void (**)(uint64_t, uint64_t))(v796 + 8))(v1522, v795);
            uint64_t v752 = v723;
          }
          uint64_t v722 = v752;
          sub_24D25CAB4(v1553, v1570);
          sub_24D28EBE4(v1570, v1552);
          v754(v1483, v1468);
          uint64_t v760 = v722;
        }
        else
        {
          v754(v1483, v1468);
          uint64_t v760 = v761;
        }
      }
      uint64_t v721 = v760;
    }
    else
    {
      unsigned int v715 = 1;
      sub_24D2299EC(v1549 & 1, v1520);
      uint64_t v716 = sub_24D290AC8();
      uint64_t v717 = *(void *)(v716 - 8);
      uint64_t v718 = v716 - 8;
      v719 = *(unsigned int (**)(uint64_t, void))(v717 + 48);
      uint64_t v720 = v717 + 48;
      if (v719(v1520, v715) == 1)
      {
        sub_24D28EB34(v1520);
        uint64_t v714 = v1254;
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v702 = 32;
        uint64_t v703 = 7;
        uint64_t v355 = swift_allocObject();
        uint64_t v356 = v1256;
        uint64_t v704 = v355;
        *(void *)(v355 + 16) = v1255;
        *(void *)(v355 + 24) = v356;
        v712 = sub_24D290AA8();
        int v713 = sub_24D290D88();
        v699 = &v1687;
        uint64_t v1687 = 12;
        unint64_t v697 = sub_24D26443C();
        unint64_t v698 = sub_24D2644B8();
        sub_24D22D93C();
        sub_24D290C68();
        uint32_t v700 = v1688;
        uint64_t v701 = 17;
        uint64_t v706 = swift_allocObject();
        *(unsigned char *)(v706 + 16) = 32;
        uint64_t v707 = swift_allocObject();
        *(unsigned char *)(v707 + 16) = 8;
        uint64_t v357 = swift_allocObject();
        uint64_t v358 = v704;
        uint64_t v705 = v357;
        *(void *)(v357 + 16) = v1312;
        *(void *)(v357 + 24) = v358;
        uint64_t v359 = swift_allocObject();
        uint64_t v360 = v705;
        uint64_t v709 = v359;
        *(void *)(v359 + 16) = v1313;
        *(void *)(v359 + 24) = v360;
        uint64_t v711 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
        uint64_t v708 = sub_24D290FA8();
        v710 = v361;
        swift_retain();
        uint64_t v362 = v706;
        uint64_t v363 = v710;
        *v710 = v1314;
        v363[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v362;
        swift_retain();
        uint64_t v364 = v707;
        uint64_t v365 = v710;
        v710[2] = v1315;
        v365[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v364;
        swift_retain();
        unint64_t v366 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v709;
        uint64_t v367 = v710;
        v710[4] = v1316;
        v367[5] = v366;
        sub_24D22AD58();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v712, (os_log_type_t)v713))
        {
          v690 = (uint8_t *)sub_24D290DF8();
          uint64_t v689 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
          uint64_t v691 = sub_24D263F98(0);
          uint64_t v692 = sub_24D263F98(1);
          v693 = &v1686;
          v1686 = v690;
          v694 = &v1685;
          uint64_t v1685 = v691;
          v695 = &v1684;
          uint64_t v1684 = v692;
          sub_24D263FF4(2, &v1686);
          sub_24D263FF4(1, v693);
          uint64_t v368 = v1254;
          v1682 = v1314;
          uint64_t v1683 = v706;
          sub_24D264008(&v1682, (uint64_t)v693, (uint64_t)v694, (uint64_t)v695);
          uint64_t v696 = v368;
          if (v368)
          {
            __break(1u);
          }
          else
          {
            v1682 = v1315;
            uint64_t v1683 = v707;
            sub_24D264008(&v1682, (uint64_t)&v1686, (uint64_t)&v1685, (uint64_t)&v1684);
            uint64_t v687 = 0;
            uint64_t v369 = v687;
            v1682 = v1316;
            uint64_t v1683 = v709;
            sub_24D264008(&v1682, (uint64_t)&v1686, (uint64_t)&v1685, (uint64_t)&v1684);
            uint64_t v686 = v369;
            _os_log_impl(&dword_24D227000, v712, (os_log_type_t)v713, "[Deduplication] [%s] No site onboarded", v690, v700);
            sub_24D264054(v691);
            sub_24D264054(v692);
            sub_24D290DC8();
            swift_release();
            swift_release();
            swift_release();
            uint64_t v688 = v686;
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          uint64_t v688 = v1254;
        }
        uint64_t v685 = v688;

        (*(void (**)(uint64_t, uint64_t))(v717 + 8))(v1520, v716);
        uint64_t v714 = v685;
      }
      uint64_t v682 = v714;
      EnergySitePayload.siteTombstone.getter(v1430);
      v683 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v1418 + 48);
      uint64_t v684 = v1418 + 48;
      if (v683(v1430, 1, v1417) == 1)
      {
        sub_24D24C310((uint64_t)v1430);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1469 + 56))(v1447, 1, 1, v1468);
      }
      else
      {
        sub_24D290878();
        (*(void (**)(char *, uint64_t))(v1418 + 8))(v1430, v1417);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1469 + 56))(v1447, 0, 1, v1468);
      }
      v680 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1469 + 48);
      uint64_t v681 = v1469 + 48;
      if (v680(v1447, 1, v1468) == 1)
      {
        sub_24D290538();
        sub_24D23A530(v1447);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v1469 + 32))(v1479, v1447, v1468);
      }
      EnergySitePayload.siteTombstone.getter(v1428);
      if (((uint64_t (*)(char *, uint64_t, uint64_t))v683)(v1428, 1, v1417) == 0)
      {
        (*(void (**)(char *, char *, uint64_t))(v1418 + 16))(v1421, v1428, v1417);
        sub_24D24C310((uint64_t)v1428);
        sub_24D290878();
        (*(void (**)(char *, uint64_t))(v1418 + 8))(v1421, v1417);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1469 + 56))(v1445, 0, 1, v1468);
      }
      else
      {
        sub_24D24C310((uint64_t)v1428);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1469 + 56))(v1445, 1, 1, v1468);
      }
      if (v680(v1445, 1, v1468) == 1)
      {
        sub_24D290538();
        sub_24D23A530(v1445);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v1469 + 32))(v1477, v1445, v1468);
      }
      int v678 = sub_24D2905B8();
      v677 = *(void (**)(char *, uint64_t))(v1469 + 8);
      uint64_t v676 = v1469 + 8;
      v677(v1477, v1468);
      v677(v1479, v1468);
      if (v678)
      {
        unsigned int v675 = 1;
        sub_24D2299EC(v1549 & 1, v1518);
        if (((unsigned int (*)(uint64_t, void, uint64_t))v719)(v1518, v675, v716) == 1)
        {
          sub_24D28EB34(v1518);
          uint64_t v674 = v682;
        }
        else
        {
          swift_bridgeObjectRetain();
          uint64_t v662 = 32;
          uint64_t v663 = 7;
          uint64_t v370 = swift_allocObject();
          uint64_t v371 = v1256;
          uint64_t v664 = v370;
          *(void *)(v370 + 16) = v1255;
          *(void *)(v370 + 24) = v371;
          v672 = sub_24D290AA8();
          int v673 = sub_24D290D88();
          v659 = &v1694;
          uint64_t v1694 = 12;
          unint64_t v657 = sub_24D26443C();
          unint64_t v658 = sub_24D2644B8();
          sub_24D22D93C();
          sub_24D290C68();
          uint32_t v660 = v1695;
          uint64_t v661 = 17;
          uint64_t v666 = swift_allocObject();
          *(unsigned char *)(v666 + 16) = 32;
          uint64_t v667 = swift_allocObject();
          *(unsigned char *)(v667 + 16) = 8;
          uint64_t v372 = swift_allocObject();
          uint64_t v373 = v664;
          uint64_t v665 = v372;
          *(void *)(v372 + 16) = v1337;
          *(void *)(v372 + 24) = v373;
          uint64_t v374 = swift_allocObject();
          uint64_t v375 = v665;
          uint64_t v669 = v374;
          *(void *)(v374 + 16) = v1338;
          *(void *)(v374 + 24) = v375;
          uint64_t v671 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
          uint64_t v668 = sub_24D290FA8();
          v670 = v376;
          swift_retain();
          uint64_t v377 = v666;
          id v378 = v670;
          *v670 = v1339;
          v378[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v377;
          swift_retain();
          uint64_t v379 = v667;
          uint64_t v380 = v670;
          v670[2] = v1340;
          v380[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v379;
          swift_retain();
          uint64_t v381 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v669;
          id v382 = v670;
          v670[4] = v1341;
          v382[5] = v381;
          sub_24D22AD58();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v672, (os_log_type_t)v673))
          {
            v650 = (uint8_t *)sub_24D290DF8();
            uint64_t v649 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
            uint64_t v651 = sub_24D263F98(0);
            uint64_t v652 = sub_24D263F98(1);
            v653 = &v1693;
            v1693 = v650;
            v654 = &v1692;
            uint64_t v1692 = v651;
            v655 = &v1691;
            uint64_t v1691 = v652;
            sub_24D263FF4(2, &v1693);
            sub_24D263FF4(1, v653);
            uint64_t v383 = v682;
            v1689 = v1339;
            uint64_t v1690 = v666;
            sub_24D264008(&v1689, (uint64_t)v653, (uint64_t)v654, (uint64_t)v655);
            uint64_t v656 = v383;
            if (v383)
            {
              __break(1u);
            }
            else
            {
              v1689 = v1340;
              uint64_t v1690 = v667;
              sub_24D264008(&v1689, (uint64_t)&v1693, (uint64_t)&v1692, (uint64_t)&v1691);
              uint64_t v647 = 0;
              uint64_t v384 = v647;
              v1689 = v1341;
              uint64_t v1690 = v669;
              sub_24D264008(&v1689, (uint64_t)&v1693, (uint64_t)&v1692, (uint64_t)&v1691);
              uint64_t v646 = v384;
              _os_log_impl(&dword_24D227000, v672, (os_log_type_t)v673, "[Deduplication] [%s] 4.1 Newer sites wins", v650, v660);
              sub_24D264054(v651);
              sub_24D264054(v652);
              sub_24D290DC8();
              swift_release();
              swift_release();
              swift_release();
              uint64_t v648 = v646;
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            uint64_t v648 = v682;
          }
          uint64_t v645 = v648;

          (*(void (**)(uint64_t, uint64_t))(v717 + 8))(v1518, v716);
          uint64_t v674 = v645;
        }
        uint64_t v643 = v674;
        sub_24D25CAB4(v1553, v1570);
        sub_24D28EBE4(v1570, v1552);
        uint64_t v644 = v643;
      }
      else
      {
        EnergySitePayload.siteTombstone.getter(v1426);
        if (((uint64_t (*)(char *, uint64_t, uint64_t))v683)(v1426, 1, v1417) == 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v1418 + 16))(v1421, v1426, v1417);
          sub_24D24C310((uint64_t)v1426);
          sub_24D290878();
          (*(void (**)(char *, uint64_t))(v1418 + 8))(v1421, v1417);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1469 + 56))(v1443, 0, 1, v1468);
        }
        else
        {
          sub_24D24C310((uint64_t)v1426);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1469 + 56))(v1443, 1, 1, v1468);
        }
        if (v680(v1443, 1, v1468) == 1)
        {
          sub_24D290538();
          sub_24D23A530(v1443);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v1469 + 32))(v1475, v1443, v1468);
        }
        EnergySitePayload.siteTombstone.getter(v1424);
        if (v683(v1424, 1, v1417) == 1)
        {
          sub_24D24C310((uint64_t)v1424);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1469 + 56))(v1441, 1, 1, v1468);
        }
        else
        {
          sub_24D290878();
          (*(void (**)(char *, uint64_t))(v1418 + 8))(v1424, v1417);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1469 + 56))(v1441, 0, 1, v1468);
        }
        if (v680(v1441, 1, v1468) == 1)
        {
          sub_24D290538();
          sub_24D23A530(v1441);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v1469 + 32))(v1473, v1441, v1468);
        }
        int v641 = sub_24D2905B8();
        v677(v1473, v1468);
        v677(v1475, v1468);
        if (v641)
        {
          unsigned int v640 = 1;
          sub_24D2299EC(v1549 & 1, v1516);
          if (((unsigned int (*)(uint64_t, void, uint64_t))v719)(v1516, v640, v716) == 1)
          {
            sub_24D28EB34(v1516);
            uint64_t v639 = v682;
          }
          else
          {
            swift_bridgeObjectRetain();
            uint64_t v627 = 32;
            uint64_t v628 = 7;
            uint64_t v385 = swift_allocObject();
            uint64_t v386 = v1256;
            uint64_t v629 = v385;
            *(void *)(v385 + 16) = v1255;
            *(void *)(v385 + 24) = v386;
            v637 = sub_24D290AA8();
            int v638 = sub_24D290D88();
            v624 = &v1701;
            uint64_t v1701 = 12;
            unint64_t v622 = sub_24D26443C();
            unint64_t v623 = sub_24D2644B8();
            sub_24D22D93C();
            sub_24D290C68();
            uint32_t v625 = v1702;
            uint64_t v626 = 17;
            uint64_t v631 = swift_allocObject();
            *(unsigned char *)(v631 + 16) = 32;
            uint64_t v632 = swift_allocObject();
            *(unsigned char *)(v632 + 16) = 8;
            uint64_t v387 = swift_allocObject();
            uint64_t v388 = v629;
            uint64_t v630 = v387;
            *(void *)(v387 + 16) = v1332;
            *(void *)(v387 + 24) = v388;
            uint64_t v389 = swift_allocObject();
            uint64_t v390 = v630;
            uint64_t v634 = v389;
            *(void *)(v389 + 16) = v1333;
            *(void *)(v389 + 24) = v390;
            uint64_t v636 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
            uint64_t v633 = sub_24D290FA8();
            v635 = v391;
            swift_retain();
            uint64_t v392 = v631;
            id v393 = v635;
            *v635 = v1334;
            v393[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v392;
            swift_retain();
            uint64_t v394 = v632;
            unint64_t v395 = v635;
            v635[2] = v1335;
            v395[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v394;
            swift_retain();
            uint64_t v396 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v634;
            uint64_t v397 = v635;
            v635[4] = v1336;
            v397[5] = v396;
            sub_24D22AD58();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v637, (os_log_type_t)v638))
            {
              v615 = (uint8_t *)sub_24D290DF8();
              uint64_t v614 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
              uint64_t v616 = sub_24D263F98(0);
              uint64_t v617 = sub_24D263F98(1);
              v618 = &v1700;
              v1700 = v615;
              v619 = &v1699;
              uint64_t v1699 = v616;
              v620 = &v1698;
              uint64_t v1698 = v617;
              sub_24D263FF4(2, &v1700);
              sub_24D263FF4(1, v618);
              uint64_t v398 = v682;
              v1696 = v1334;
              uint64_t v1697 = v631;
              sub_24D264008(&v1696, (uint64_t)v618, (uint64_t)v619, (uint64_t)v620);
              uint64_t v621 = v398;
              if (v398)
              {
                __break(1u);
              }
              else
              {
                v1696 = v1335;
                uint64_t v1697 = v632;
                sub_24D264008(&v1696, (uint64_t)&v1700, (uint64_t)&v1699, (uint64_t)&v1698);
                uint64_t v612 = 0;
                uint64_t v399 = v612;
                v1696 = v1336;
                uint64_t v1697 = v634;
                sub_24D264008(&v1696, (uint64_t)&v1700, (uint64_t)&v1699, (uint64_t)&v1698);
                uint64_t v611 = v399;
                _os_log_impl(&dword_24D227000, v637, (os_log_type_t)v638, "[Deduplication] [%s] 4.2 Older sites wins", v615, v625);
                sub_24D264054(v616);
                sub_24D264054(v617);
                sub_24D290DC8();
                swift_release();
                swift_release();
                swift_release();
                uint64_t v613 = v611;
              }
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
              uint64_t v613 = v682;
            }
            uint64_t v610 = v613;

            (*(void (**)(uint64_t, uint64_t))(v717 + 8))(v1516, v716);
            uint64_t v639 = v610;
          }
          uint64_t v609 = v639;
        }
        else
        {
          EnergySitePayload.timezone.getter();
          uint64_t v607 = v400;
          int v608 = sub_24D290C28();
          swift_bridgeObjectRelease();
          sub_24D25CAB4(v1553, v1556);
          if (v608)
          {
            EnergySitePayload.timezone.getter();
            uint64_t v604 = v401;
            int v605 = sub_24D290C28();
            swift_bridgeObjectRelease();
            int v606 = v605 ^ 1;
          }
          else
          {
            int v606 = 0;
          }
          int v603 = v606;
          sub_24D25CB50(v1556);
          if (v603)
          {
            unsigned int v602 = 1;
            sub_24D2299EC(v1549 & 1, v1514);
            if (((unsigned int (*)(uint64_t, void, uint64_t))v719)(v1514, v602, v716) == 1)
            {
              sub_24D28EB34(v1514);
              uint64_t v601 = v682;
            }
            else
            {
              swift_bridgeObjectRetain();
              uint64_t v589 = 32;
              uint64_t v590 = 7;
              uint64_t v402 = swift_allocObject();
              uint64_t v403 = v1256;
              uint64_t v591 = v402;
              *(void *)(v402 + 16) = v1255;
              *(void *)(v402 + 24) = v403;
              uint64_t v599 = sub_24D290AA8();
              int v600 = sub_24D290D88();
              uint64_t v586 = &v1708;
              uint64_t v1708 = 12;
              unint64_t v584 = sub_24D26443C();
              unint64_t v585 = sub_24D2644B8();
              sub_24D22D93C();
              sub_24D290C68();
              uint32_t v587 = v1709;
              uint64_t v588 = 17;
              uint64_t v593 = swift_allocObject();
              *(unsigned char *)(v593 + 16) = 32;
              uint64_t v594 = swift_allocObject();
              *(unsigned char *)(v594 + 16) = 8;
              uint64_t v404 = swift_allocObject();
              uint64_t v405 = v591;
              uint64_t v592 = v404;
              *(void *)(v404 + 16) = v1327;
              *(void *)(v404 + 24) = v405;
              uint64_t v406 = swift_allocObject();
              uint64_t v407 = v592;
              uint64_t v596 = v406;
              *(void *)(v406 + 16) = v1328;
              *(void *)(v406 + 24) = v407;
              uint64_t v598 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
              uint64_t v595 = sub_24D290FA8();
              uint64_t v597 = v408;
              swift_retain();
              uint64_t v409 = v593;
              uint64_t v410 = v597;
              *uint64_t v597 = v1329;
              v410[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v409;
              swift_retain();
              uint64_t v411 = v594;
              uint64_t v412 = v597;
              v597[2] = v1330;
              v412[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v411;
              swift_retain();
              uint64_t v413 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v596;
              uint64_t v414 = v597;
              v597[4] = v1331;
              v414[5] = v413;
              sub_24D22AD58();
              swift_bridgeObjectRelease();
              if (os_log_type_enabled(v599, (os_log_type_t)v600))
              {
                uint64_t v577 = (uint8_t *)sub_24D290DF8();
                uint64_t v576 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                uint64_t v578 = sub_24D263F98(0);
                uint64_t v579 = sub_24D263F98(1);
                uint64_t v580 = &v1707;
                v1707 = v577;
                uint64_t v581 = &v1706;
                uint64_t v1706 = v578;
                uint64_t v582 = &v1705;
                uint64_t v1705 = v579;
                sub_24D263FF4(2, &v1707);
                sub_24D263FF4(1, v580);
                uint64_t v415 = v682;
                v1703 = v1329;
                uint64_t v1704 = v593;
                sub_24D264008(&v1703, (uint64_t)v580, (uint64_t)v581, (uint64_t)v582);
                uint64_t v583 = v415;
                if (v415)
                {
                  __break(1u);
                }
                else
                {
                  v1703 = v1330;
                  uint64_t v1704 = v594;
                  sub_24D264008(&v1703, (uint64_t)&v1707, (uint64_t)&v1706, (uint64_t)&v1705);
                  uint64_t v574 = 0;
                  uint64_t v416 = v574;
                  v1703 = v1331;
                  uint64_t v1704 = v596;
                  sub_24D264008(&v1703, (uint64_t)&v1707, (uint64_t)&v1706, (uint64_t)&v1705);
                  uint64_t v573 = v416;
                  _os_log_impl(&dword_24D227000, v599, (os_log_type_t)v600, "[Deduplication] [%s] 4.3 Newer sites wins", v577, v587);
                  sub_24D264054(v578);
                  sub_24D264054(v579);
                  sub_24D290DC8();
                  swift_release();
                  swift_release();
                  swift_release();
                  uint64_t v575 = v573;
                }
              }
              else
              {
                swift_release();
                swift_release();
                swift_release();
                uint64_t v575 = v682;
              }
              uint64_t v572 = v575;

              (*(void (**)(uint64_t, uint64_t))(v717 + 8))(v1514, v716);
              uint64_t v601 = v572;
            }
            uint64_t v570 = v601;
            sub_24D25CAB4(v1553, v1570);
            sub_24D28EBE4(v1570, v1552);
            uint64_t v571 = v570;
          }
          else
          {
            EnergySitePayload.timezone.getter();
            uint64_t v568 = v417;
            int v569 = sub_24D290C28();
            swift_bridgeObjectRelease();
            if (v569)
            {
              EnergySitePayload.timezone.getter();
              uint64_t v565 = v418;
              int v566 = sub_24D290C28();
              swift_bridgeObjectRelease();
              int v567 = v566 ^ 1;
            }
            else
            {
              int v567 = 0;
            }
            if (v567)
            {
              unsigned int v564 = 1;
              sub_24D2299EC(v1549 & 1, v1512);
              if (((unsigned int (*)(uint64_t, void, uint64_t))v719)(v1512, v564, v716) == 1)
              {
                sub_24D28EB34(v1512);
                uint64_t v563 = v682;
              }
              else
              {
                swift_bridgeObjectRetain();
                uint64_t v551 = 32;
                uint64_t v552 = 7;
                uint64_t v419 = swift_allocObject();
                uint64_t v420 = v1256;
                uint64_t v553 = v419;
                *(void *)(v419 + 16) = v1255;
                *(void *)(v419 + 24) = v420;
                unint64_t v561 = sub_24D290AA8();
                int v562 = sub_24D290D88();
                uint64_t v548 = &v1715;
                uint64_t v1715 = 12;
                unint64_t v546 = sub_24D26443C();
                unint64_t v547 = sub_24D2644B8();
                sub_24D22D93C();
                sub_24D290C68();
                uint32_t v549 = v1716;
                uint64_t v550 = 17;
                uint64_t v555 = swift_allocObject();
                *(unsigned char *)(v555 + 16) = 32;
                uint64_t v556 = swift_allocObject();
                *(unsigned char *)(v556 + 16) = 8;
                uint64_t v421 = swift_allocObject();
                uint64_t v422 = v553;
                uint64_t v554 = v421;
                *(void *)(v421 + 16) = v1322;
                *(void *)(v421 + 24) = v422;
                uint64_t v423 = swift_allocObject();
                uint64_t v424 = v554;
                uint64_t v558 = v423;
                *(void *)(v423 + 16) = v1323;
                *(void *)(v423 + 24) = v424;
                uint64_t v560 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
                uint64_t v557 = sub_24D290FA8();
                unint64_t v559 = v425;
                swift_retain();
                uint64_t v426 = v555;
                uint64_t v427 = v559;
                *unint64_t v559 = v1324;
                v427[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v426;
                swift_retain();
                uint64_t v428 = v556;
                uint64_t v429 = v559;
                v559[2] = v1325;
                v429[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v428;
                swift_retain();
                id v430 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v558;
                v431 = v559;
                v559[4] = v1326;
                v431[5] = v430;
                sub_24D22AD58();
                swift_bridgeObjectRelease();
                if (os_log_type_enabled(v561, (os_log_type_t)v562))
                {
                  char v539 = (uint8_t *)sub_24D290DF8();
                  uint64_t v538 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                  uint64_t v540 = sub_24D263F98(0);
                  uint64_t v541 = sub_24D263F98(1);
                  uint64_t v542 = &v1714;
                  v1714 = v539;
                  uint64_t v543 = &v1713;
                  uint64_t v1713 = v540;
                  uint64_t v544 = &v1712;
                  uint64_t v1712 = v541;
                  sub_24D263FF4(2, &v1714);
                  sub_24D263FF4(1, v542);
                  uint64_t v432 = v682;
                  v1710 = v1324;
                  uint64_t v1711 = v555;
                  sub_24D264008(&v1710, (uint64_t)v542, (uint64_t)v543, (uint64_t)v544);
                  uint64_t v545 = v432;
                  if (v432)
                  {
                    __break(1u);
                  }
                  else
                  {
                    v1710 = v1325;
                    uint64_t v1711 = v556;
                    sub_24D264008(&v1710, (uint64_t)&v1714, (uint64_t)&v1713, (uint64_t)&v1712);
                    uint64_t v536 = 0;
                    uint64_t v433 = v536;
                    v1710 = v1326;
                    uint64_t v1711 = v558;
                    sub_24D264008(&v1710, (uint64_t)&v1714, (uint64_t)&v1713, (uint64_t)&v1712);
                    uint64_t v535 = v433;
                    _os_log_impl(&dword_24D227000, v561, (os_log_type_t)v562, "[Deduplication] [%s] 4.4 Older sites wins", v539, v549);
                    sub_24D264054(v540);
                    sub_24D264054(v541);
                    sub_24D290DC8();
                    swift_release();
                    swift_release();
                    swift_release();
                    uint64_t v537 = v535;
                  }
                }
                else
                {
                  swift_release();
                  swift_release();
                  swift_release();
                  uint64_t v537 = v682;
                }
                uint64_t v534 = v537;

                (*(void (**)(uint64_t, uint64_t))(v717 + 8))(v1512, v716);
                uint64_t v563 = v534;
              }
              uint64_t v533 = v563;
            }
            else
            {
              unsigned int v532 = 1;
              sub_24D2299EC(v1549 & 1, v1510);
              if (((unsigned int (*)(uint64_t, void, uint64_t))v719)(v1510, v532, v716) == 1)
              {
                sub_24D28EB34(v1510);
                uint64_t v531 = v682;
              }
              else
              {
                swift_bridgeObjectRetain();
                uint64_t v519 = 32;
                uint64_t v520 = 7;
                uint64_t v434 = swift_allocObject();
                uint64_t v435 = v1256;
                uint64_t v521 = v434;
                *(void *)(v434 + 16) = v1255;
                *(void *)(v434 + 24) = v435;
                uint64_t v529 = sub_24D290AA8();
                int v530 = sub_24D290D88();
                uint64_t v516 = &v1722;
                uint64_t v1722 = 12;
                unint64_t v514 = sub_24D26443C();
                unint64_t v515 = sub_24D2644B8();
                sub_24D22D93C();
                sub_24D290C68();
                uint32_t v517 = v1723;
                uint64_t v518 = 17;
                uint64_t v523 = swift_allocObject();
                *(unsigned char *)(v523 + 16) = 32;
                uint64_t v524 = swift_allocObject();
                *(unsigned char *)(v524 + 16) = 8;
                uint64_t v436 = swift_allocObject();
                uint64_t v437 = v521;
                uint64_t v522 = v436;
                *(void *)(v436 + 16) = v1317;
                *(void *)(v436 + 24) = v437;
                uint64_t v438 = swift_allocObject();
                uint64_t v439 = v522;
                uint64_t v526 = v438;
                *(void *)(v438 + 16) = v1318;
                *(void *)(v438 + 24) = v439;
                uint64_t v528 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
                uint64_t v525 = sub_24D290FA8();
                uint64_t v527 = v440;
                swift_retain();
                uint64_t v441 = v523;
                unint64_t v442 = v527;
                *uint64_t v527 = v1319;
                v442[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v441;
                swift_retain();
                uint64_t v443 = v524;
                unint64_t v444 = v527;
                v527[2] = v1320;
                v444[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v443;
                swift_retain();
                unint64_t v445 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v526;
                unint64_t v446 = v527;
                v527[4] = v1321;
                v446[5] = v445;
                sub_24D22AD58();
                swift_bridgeObjectRelease();
                if (os_log_type_enabled(v529, (os_log_type_t)v530))
                {
                  uint64_t v507 = (uint8_t *)sub_24D290DF8();
                  uint64_t v506 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
                  uint64_t v508 = sub_24D263F98(0);
                  uint64_t v509 = sub_24D263F98(1);
                  uint64_t v510 = &v1721;
                  v1721 = v507;
                  uint64_t v511 = &v1720;
                  uint64_t v1720 = v508;
                  uint64_t v512 = &v1719;
                  uint64_t v1719 = v509;
                  sub_24D263FF4(2, &v1721);
                  sub_24D263FF4(1, v510);
                  uint64_t v447 = v682;
                  v1717 = v1319;
                  uint64_t v1718 = v523;
                  sub_24D264008(&v1717, (uint64_t)v510, (uint64_t)v511, (uint64_t)v512);
                  uint64_t v513 = v447;
                  if (v447)
                  {
                    __break(1u);
                  }
                  else
                  {
                    v1717 = v1320;
                    uint64_t v1718 = v524;
                    sub_24D264008(&v1717, (uint64_t)&v1721, (uint64_t)&v1720, (uint64_t)&v1719);
                    uint64_t v504 = 0;
                    uint64_t v448 = v504;
                    v1717 = v1321;
                    uint64_t v1718 = v526;
                    sub_24D264008(&v1717, (uint64_t)&v1721, (uint64_t)&v1720, (uint64_t)&v1719);
                    uint64_t v503 = v448;
                    _os_log_impl(&dword_24D227000, v529, (os_log_type_t)v530, "[Deduplication] [%s] 4.5 Default: Newer sites wins", v507, v517);
                    sub_24D264054(v508);
                    sub_24D264054(v509);
                    sub_24D290DC8();
                    swift_release();
                    swift_release();
                    swift_release();
                    uint64_t v505 = v503;
                  }
                }
                else
                {
                  swift_release();
                  swift_release();
                  swift_release();
                  uint64_t v505 = v682;
                }
                uint64_t v502 = v505;

                (*(void (**)(uint64_t, uint64_t))(v717 + 8))(v1510, v716);
                uint64_t v531 = v502;
              }
              uint64_t v501 = v531;
              sub_24D25CAB4(v1553, v1570);
              sub_24D28EBE4(v1570, v1552);
              uint64_t v533 = v501;
            }
            uint64_t v571 = v533;
          }
          uint64_t v609 = v571;
        }
        uint64_t v644 = v609;
      }
      uint64_t v721 = v644;
    }
    uint64_t v810 = v721;
  }
  uint64_t v896 = v810;
LABEL_396:
  uint64_t v496 = v896;
  unsigned int v497 = 1;
  sub_24D2299EC(v1549 & 1, v1508);
  uint64_t v498 = sub_24D290AC8();
  uint64_t v499 = *(void *)(v498 - 8);
  uint64_t v500 = v498 - 8;
  if ((*(unsigned int (**)(uint64_t, void))(v499 + 48))(v1508, v497) == 1)
  {
    sub_24D28EB34(v1508);
    uint64_t v495 = v496;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v483 = 32;
    uint64_t v484 = 7;
    uint64_t v449 = swift_allocObject();
    uint64_t v450 = v1256;
    uint64_t v485 = v449;
    *(void *)(v449 + 16) = v1255;
    *(void *)(v449 + 24) = v450;
    unint64_t v493 = sub_24D290AA8();
    int v494 = sub_24D290D88();
    unint64_t v480 = &v1729;
    uint64_t v1729 = 12;
    unint64_t v478 = sub_24D26443C();
    unint64_t v479 = sub_24D2644B8();
    sub_24D22D93C();
    sub_24D290C68();
    uint32_t v481 = v1730;
    uint64_t v482 = 17;
    uint64_t v487 = swift_allocObject();
    *(unsigned char *)(v487 + 16) = 32;
    uint64_t v488 = swift_allocObject();
    *(unsigned char *)(v488 + 16) = 8;
    uint64_t v451 = swift_allocObject();
    uint64_t v452 = v485;
    uint64_t v486 = v451;
    *(void *)(v451 + 16) = v1407;
    *(void *)(v451 + 24) = v452;
    uint64_t v453 = swift_allocObject();
    uint64_t v454 = v486;
    uint64_t v490 = v453;
    *(void *)(v453 + 16) = v1408;
    *(void *)(v453 + 24) = v454;
    uint64_t v492 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D298);
    uint64_t v489 = sub_24D290FA8();
    unint64_t v491 = v455;
    swift_retain();
    uint64_t v456 = v487;
    unint64_t v457 = v491;
    char *v491 = v1409;
    v457[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v456;
    swift_retain();
    uint64_t v458 = v488;
    unint64_t v459 = v491;
    v491[2] = v1410;
    v459[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v458;
    swift_retain();
    unint64_t v460 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v490;
    unint64_t v461 = v491;
    v491[4] = v1411;
    v461[5] = v460;
    sub_24D22AD58();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v493, (os_log_type_t)v494))
    {
      unint64_t v471 = (uint8_t *)sub_24D290DF8();
      uint64_t v470 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985D2A0);
      uint64_t v472 = sub_24D263F98(0);
      uint64_t v473 = sub_24D263F98(1);
      unint64_t v474 = &v1728;
      v1728 = v471;
      unint64_t v475 = &v1727;
      uint64_t v1727 = v472;
      unint64_t v476 = &v1726;
      uint64_t v1726 = v473;
      sub_24D263FF4(2, &v1728);
      sub_24D263FF4(1, v474);
      uint64_t v462 = v496;
      v1724 = v1409;
      uint64_t v1725 = v487;
      sub_24D264008(&v1724, (uint64_t)v474, (uint64_t)v475, (uint64_t)v476);
      uint64_t v477 = v462;
      if (v462)
      {
        __break(1u);
      }
      else
      {
        v1724 = v1410;
        uint64_t v1725 = v488;
        sub_24D264008(&v1724, (uint64_t)&v1728, (uint64_t)&v1727, (uint64_t)&v1726);
        uint64_t v468 = 0;
        uint64_t v463 = v468;
        v1724 = v1411;
        uint64_t v1725 = v490;
        sub_24D264008(&v1724, (uint64_t)&v1728, (uint64_t)&v1727, (uint64_t)&v1726);
        uint64_t v467 = v463;
        _os_log_impl(&dword_24D227000, v493, (os_log_type_t)v494, "[Deduplication] [%s] Completed", v471, v481);
        sub_24D264054(v472);
        sub_24D264054(v473);
        sub_24D290DC8();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v469 = v467;
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      uint64_t v469 = v496;
    }
    uint64_t v466 = v469;

    (*(void (**)(uint64_t, uint64_t))(v499 + 8))(v1508, v498);
    uint64_t v495 = v466;
  }
  uint64_t v465 = v495;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D28CD0C()
{
  return sub_24D282A4C(*(void *)(v0 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_24D28CD48()
{
}

uint64_t static MergeEnergySite.siteFromMetadata(siteID:metadata:zoneName:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_24D229320(a3, a4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  type metadata accessor for EKEnergySite();
  sub_24D290848();
  sub_24D2293AC(a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8) {
    return v5;
  }
  else {
    return v9;
  }
}

uint64_t sub_24D28CF08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v134 = a7;
  uint64_t v184 = a1;
  uint64_t v185 = a2;
  uint64_t v179 = a3;
  uint64_t v180 = a4;
  uint64_t v181 = a5;
  uint64_t v182 = a6;
  uint64_t v211 = 0;
  uint64_t v209 = 0;
  unint64_t v210 = 0;
  uint64_t v207 = 0;
  uint64_t v208 = 0;
  uint64_t v205 = 0;
  uint64_t v206 = 0;
  id v202 = 0;
  id v197 = 0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BC08);
  unint64_t v135 = (*(void *)(*(void *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7);
  uint64_t v136 = (char *)&v82 - v135;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18B8B8);
  uint64_t v137 = *(void *)(*(void *)(v8 - 8) + 64);
  unint64_t v138 = (v137 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v139 = (char *)&v82 - v138;
  unint64_t v140 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v138);
  uint64_t v141 = (char *)&v82 - v140;
  unint64_t v142 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v140);
  uint64_t v143 = (char *)&v82 - v142;
  unint64_t v144 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v142);
  uint64_t v145 = (char *)&v82 - v144;
  unint64_t v146 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v144);
  uint64_t v147 = (char *)&v82 - v146;
  unint64_t v148 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v146);
  uint64_t v149 = (char *)&v82 - v148;
  unint64_t v150 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v148);
  uint64_t v151 = (char *)&v82 - v150;
  unint64_t v152 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v150);
  uint64_t v153 = (char *)&v82 - v152;
  unint64_t v154 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v152);
  uint64_t v155 = (char *)&v82 - v154;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18BB50);
  uint64_t v156 = *(void *)(*(void *)(v17 - 8) + 64);
  unint64_t v157 = (v156 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v17);
  uint64_t v158 = (char *)&v82 - v157;
  unint64_t v159 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v157);
  uint64_t v160 = (char *)&v82 - v159;
  unint64_t v161 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v159);
  id v162 = (char *)&v82 - v161;
  unint64_t v163 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v161);
  uint64_t v164 = (char *)&v82 - v163;
  unint64_t v165 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v163);
  uint64_t v166 = (char *)&v82 - v165;
  unint64_t v167 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v165);
  uint64_t v168 = (char *)&v82 - v167;
  unint64_t v169 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v167);
  uint64_t v170 = (char *)&v82 - v169;
  unint64_t v171 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v169);
  uint64_t v172 = (char *)&v82 - v171;
  unint64_t v173 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v82 - v171);
  uint64_t v174 = (char *)&v82 - v173;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18BBF8);
  unint64_t v175 = (*(void *)(*(void *)(v26 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v26);
  id v176 = (char *)&v82 - v175;
  uint64_t v177 = 0;
  unint64_t v178 = (*(void *)(*(void *)(sub_24D2908D8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v177);
  uint64_t v190 = (char *)&v82 - v178;
  unint64_t v183 = (*(void *)(*(void *)(type metadata accessor for EnergySitePayload() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v27 = MEMORY[0x270FA5388](v184);
  uint64_t v186 = (uint64_t)&v82 - v183;
  uint64_t v211 = (char *)&v82 - v183;
  uint64_t v209 = v27;
  unint64_t v210 = v28;
  uint64_t v207 = v29;
  uint64_t v208 = v30;
  uint64_t v205 = v31;
  uint64_t v206 = v32;
  sub_24D229320(v27, v28);
  uint64_t v187 = v204;
  v204[0] = v184;
  v204[1] = v185;
  uint64_t v188 = v203;
  memset(v203, 0, sizeof(v203));
  unint64_t v192 = sub_24D2583FC();
  uint64_t v191 = MEMORY[0x263F06F78];
  uint64_t v193 = MEMORY[0x263F502D0];
  int v189 = sub_24D28EA38();
  sub_24D28EA54();
  uint64_t v33 = v194;
  uint64_t result = sub_24D2909C8();
  uint64_t v195 = v33;
  uint64_t v196 = v33;
  if (!v33)
  {
    uint64_t v127 = 0;
    unint64_t v91 = sub_24D22E888();
    double v92 = EnergySitePayload.latitude.getter();
    EnergySitePayload.longitude.getter();
    id v96 = sub_24D22E8F0();
    id v202 = v96;
    uint64_t v93 = type metadata accessor for EKEnergySite();
    swift_bridgeObjectRetain();
    uint64_t v94 = EnergySitePayload.siteName.getter();
    uint64_t v95 = v35;
    swift_bridgeObjectRetain();
    uint64_t v97 = EnergySitePayload.subscriptionState.getter();
    uint64_t v98 = v36;
    id v37 = v96;
    uint64_t v99 = EnergySitePayload.utilityID.getter();
    uint64_t v100 = v38;
    uint64_t v101 = EnergySitePayload.subscriptionID.getter();
    uint64_t v102 = v39;
    uint64_t v103 = EnergySitePayload.accessToken.getter();
    uint64_t v104 = v40;
    uint64_t v105 = EnergySitePayload.refreshToken.getter();
    uint64_t v106 = v41;
    uint64_t v107 = EnergySitePayload.timezone.getter();
    uint64_t v108 = v42;
    EnergySitePayload.currentRatePlan.getter(v176);
    uint64_t v43 = *(void (**)(char *, void))(*(void *)(type metadata accessor for EnergySitePayload.CurrentRatePlan()
                                                            - 8)
                                                + 56);
    unsigned int v128 = 1;
    v43(v176, 0);
    uint64_t v109 = EnergySitePayload.usagePointCustomIndex.getter();
    unint64_t v110 = v44;
    uint64_t v111 = EnergySitePayload.usageSummaryCustomIndex.getter();
    unint64_t v112 = v45;
    uint64_t v113 = EnergySitePayload.intervalBlockCustomIndex.getter();
    unint64_t v114 = v46;
    uint64_t v115 = EnergySitePayload.ckFunctionToken.getter();
    uint64_t v116 = v47;
    uint64_t v117 = EnergySitePayload.accountName.getter();
    uint64_t v118 = v48;
    uint64_t v119 = EnergySitePayload.accountNumber.getter();
    uint64_t v120 = v49;
    uint64_t v121 = EnergySitePayload.address.getter();
    uint64_t v122 = v50;
    uint64_t v123 = EnergySitePayload.serviceLocationID.getter();
    uint64_t v124 = v51;
    uint64_t v125 = EnergySitePayload.alternateSupplier.getter();
    uint64_t v126 = v52;
    EnergySitePayload.accessTokenExpirationDate.getter(v155);
    uint64_t v129 = sub_24D290888();
    uint64_t v130 = *(void *)(v129 - 8);
    uint64_t v131 = v129 - 8;
    uint64_t v132 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v130 + 48);
    uint64_t v133 = v130 + 48;
    if (((unsigned int (*)(char *, void))v132)(v155, v128) == 1)
    {
      sub_24D24C310((uint64_t)v155);
      uint64_t v53 = sub_24D290638();
      (*(void (**)(char *, uint64_t))(*(void *)(v53 - 8) + 56))(v174, 1);
    }
    else
    {
      sub_24D290878();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v155, v129);
      uint64_t v54 = sub_24D290638();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v54 - 8) + 56))(v174, 0, 1);
    }
    EnergySitePayload.utilitySupportedCheckDate.getter(v153);
    if (v132(v153, 1, v129) == 1)
    {
      sub_24D24C310((uint64_t)v153);
      uint64_t v55 = sub_24D290638();
      (*(void (**)(char *, uint64_t))(*(void *)(v55 - 8) + 56))(v172, 1);
    }
    else
    {
      sub_24D290878();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v153, v129);
      uint64_t v56 = sub_24D290638();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v56 - 8) + 56))(v172, 0, 1);
    }
    EnergySitePayload.amiLastRefreshDate.getter(v151);
    if (v132(v151, 1, v129) == 1)
    {
      sub_24D24C310((uint64_t)v151);
      uint64_t v57 = sub_24D290638();
      (*(void (**)(char *, uint64_t))(*(void *)(v57 - 8) + 56))(v170, 1);
    }
    else
    {
      sub_24D290878();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v151, v129);
      uint64_t v58 = sub_24D290638();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v58 - 8) + 56))(v170, 0, 1);
    }
    int v90 = EnergySitePayload.hasExportedEnergy_p.getter();
    EnergySitePayload.usagePointNextRefreshDate.getter(v149);
    if (v132(v149, 1, v129) == 1)
    {
      sub_24D24C310((uint64_t)v149);
      uint64_t v59 = sub_24D290638();
      (*(void (**)(char *, uint64_t))(*(void *)(v59 - 8) + 56))(v168, 1);
    }
    else
    {
      sub_24D290878();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v149, v129);
      uint64_t v60 = sub_24D290638();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v60 - 8) + 56))(v168, 0, 1);
    }
    EnergySitePayload.usageSummaryNextRefreshDate.getter(v147);
    if (v132(v147, 1, v129) == 1)
    {
      sub_24D24C310((uint64_t)v147);
      uint64_t v61 = sub_24D290638();
      (*(void (**)(char *, uint64_t))(*(void *)(v61 - 8) + 56))(v166, 1);
    }
    else
    {
      sub_24D290878();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v147, v129);
      uint64_t v62 = sub_24D290638();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v62 - 8) + 56))(v166, 0, 1);
    }
    EnergySitePayload.intervalBlockNextRefreshDate.getter(v145);
    if (v132(v145, 1, v129) == 1)
    {
      sub_24D24C310((uint64_t)v145);
      uint64_t v63 = sub_24D290638();
      (*(void (**)(char *, uint64_t))(*(void *)(v63 - 8) + 56))(v164, 1);
    }
    else
    {
      sub_24D290878();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v145, v129);
      uint64_t v64 = sub_24D290638();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v64 - 8) + 56))(v164, 0, 1);
    }
    EnergySitePayload.subscriptionCreationDate.getter(v143);
    if (v132(v143, 1, v129) == 1)
    {
      sub_24D24C310((uint64_t)v143);
      uint64_t v65 = sub_24D290638();
      (*(void (**)(char *, uint64_t))(*(void *)(v65 - 8) + 56))(v162, 1);
    }
    else
    {
      sub_24D290878();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v143, v129);
      uint64_t v66 = sub_24D290638();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v66 - 8) + 56))(v162, 0, 1);
    }
    EnergySitePayload.subscriptionStartDate.getter(v141);
    if (v132(v141, 1, v129) == 1)
    {
      sub_24D24C310((uint64_t)v141);
      uint64_t v67 = sub_24D290638();
      (*(void (**)(char *, uint64_t))(*(void *)(v67 - 8) + 56))(v160, 1);
    }
    else
    {
      sub_24D290878();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v141, v129);
      uint64_t v68 = sub_24D290638();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v68 - 8) + 56))(v160, 0, 1);
    }
    EnergySitePayload.siteTombstone.getter(v139);
    if (v132(v139, 1, v129) == 1)
    {
      sub_24D24C310((uint64_t)v139);
      uint64_t v69 = sub_24D290638();
      (*(void (**)(char *, uint64_t))(*(void *)(v69 - 8) + 56))(v158, 1);
    }
    else
    {
      sub_24D290878();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v139, v129);
      uint64_t v70 = sub_24D290638();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v70 - 8) + 56))(v158, 0, 1);
    }
    uint64_t v200 = EnergySitePayload.siteVersion.getter();
    int v198 = v200;
    char v199 = BYTE4(v200) & 1;
    if ((v200 & 0x100000000) != 0) {
      int v201 = 2;
    }
    else {
      int v201 = v198;
    }
    uint64_t v71 = v170;
    uint64_t v72 = v172;
    uint64_t v73 = v174;
    uint64_t v74 = v126;
    uint64_t v75 = v125;
    uint64_t v76 = v124;
    uint64_t v77 = v123;
    uint64_t v78 = v122;
    int v87 = v201;
    uint64_t v88 = EnergySitePayload.generationMeters.getter();
    uint64_t v85 = sub_24D2908B8();
    uint64_t v83 = *(void *)(v85 - 8);
    uint64_t v84 = v85 - 8;
    (*(void (**)(char *, uint64_t))(v83 + 16))(v136, v186);
    uint64_t v79 = *(void (**)(char *, void))(v83 + 56);
    int v86 = 1;
    v79(v136, 0);
    id v89 = EKEnergySite.__allocating_init(siteID:siteName:ckZoneName:state:location:utilityID:subscriptionID:accessToken:refreshToken:timezone:currentRatePlan:usagePointCustomIndex:usageSummaryCustomIndex:intervalBlockCustomIndex:ckFunctionToken:accountName:accountNumber:address:serviceLocationID:alternateSupplier:accessTokenExpirationDate:utilitySupportedCheckDate:amiLastRefreshDate:hasExportedEnergy:usagePointNextRefreshDate:usageSummaryNextRefreshDate:intervalBlockNextRefreshDate:subscriptionCreationDate:subscriptionStartDate:siteTombstone:siteVersion:generationMeters:unknownFields:)(v179, v180, v94, v95, v181, v182, v97, v98, v96, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108,
            (uint64_t *)v176,
            v109,
            v110,
            v111,
            v112,
            v113,
            v114,
            v115,
            v116,
            v117,
            v118,
            v119,
            v120,
            v121,
            v78,
            v77,
            v76,
            v75,
            v74,
            v73,
            v72,
            v71,
            v90 & v86,
            v168,
            v166,
            v164,
            v162,
            v160,
            v158,
            v87,
            v88,
            v136);
    id v197 = v89;
    id v80 = v89;
    id v81 = v89;
    *uint64_t v134 = v89;

    return sub_24D25CB50(v186);
  }
  return result;
}

uint64_t sub_24D28E9FC@<X0>(void *a1@<X8>)
{
  return sub_24D28CF08(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], a1);
}

uint64_t sub_24D28EA38()
{
  return 0;
}

uint64_t sub_24D28EA54()
{
  return sub_24D2908C8();
}

uint64_t MergeEnergySite.deinit()
{
  return v0;
}

uint64_t MergeEnergySite.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MergeEnergySite()
{
  return self;
}

uint64_t method lookup function for MergeEnergySite()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_24D28EB34(uint64_t a1)
{
  uint64_t v3 = sub_24D290AC8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_24D28EBE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_24D2908B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 40))(a2, a1);
  uint64_t v3 = type metadata accessor for EnergySitePayload();
  *(void *)(a2 + *(int *)(v3 + 20)) = *(void *)(a1 + *(int *)(v3 + 20));
  swift_release();
  return a2;
}

uint64_t sub_24D28EC7C()
{
  return swift_deallocObject();
}

uint64_t sub_24D28ECBC()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_24D28CD48();
  return result;
}

uint64_t sub_24D28ECC8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28ECF4()
{
  return swift_deallocObject();
}

uint64_t sub_24D28ED20()
{
  return swift_deallocObject();
}

uint64_t sub_24D28ED60()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EDA0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EDE0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EE0C()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EE38()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EE78()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EEB8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EEF8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EF24()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EF50()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EF90()
{
  return swift_deallocObject();
}

uint64_t sub_24D28EFD0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F010()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F03C()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F068()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F0A8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F0E8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F128()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F154()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F180()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F1C0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F200()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F240()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F26C()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F298()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F2D8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F318()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F358()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F384()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F3B0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F3F0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F430()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F470()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F49C()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F4C8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F508()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F548()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F588()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F5B4()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F5E0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F620()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F660()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F6A0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F6CC()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F6F8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F738()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F778()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F7B8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F7E4()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F810()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F850()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F890()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F8D0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F8FC()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F928()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F968()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F9A8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28F9E8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FA14()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FA40()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FA80()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FAC0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FB00()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FB2C()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FB58()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FB98()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FBD8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FC18()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FC44()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FC70()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FCB0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FCF0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FD30()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FD5C()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FD88()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FDC8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FE08()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FE48()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FE74()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FEA0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FEE0()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FF20()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FF60()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FF8C()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FFB8()
{
  return swift_deallocObject();
}

uint64_t sub_24D28FFF8()
{
  return swift_deallocObject();
}

uint64_t sub_24D290038()
{
  return swift_deallocObject();
}

uint64_t sub_24D290078()
{
  return swift_deallocObject();
}

uint64_t sub_24D2900A4()
{
  return swift_deallocObject();
}

uint64_t sub_24D2900D0()
{
  return swift_deallocObject();
}

uint64_t sub_24D290110()
{
  return swift_deallocObject();
}

uint64_t sub_24D290150()
{
  return swift_deallocObject();
}

uint64_t sub_24D290190()
{
  return swift_deallocObject();
}

uint64_t sub_24D2901BC()
{
  return swift_deallocObject();
}

uint64_t sub_24D2901E8()
{
  return swift_deallocObject();
}

uint64_t sub_24D290228()
{
  return swift_deallocObject();
}

uint64_t sub_24D290268(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_24D264008(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_24D290298()
{
  uint64_t v2 = qword_26985D4C0;
  if (!qword_26985D4C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26985D4B8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D4C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24D29031C()
{
  uint64_t v2 = qword_26985D4C8;
  if (!qword_26985D4C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26985D4C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24D290398()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_24D2903A8()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_24D2903B8()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_24D2903C8()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_24D2903D8()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_24D2903E8()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_24D2903F8()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_24D290408()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_24D290418()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_24D290428()
{
  return MEMORY[0x270EEE810]();
}

uint64_t sub_24D290438()
{
  return MEMORY[0x270EEE870]();
}

uint64_t sub_24D290448()
{
  return MEMORY[0x270EEE880]();
}

uint64_t sub_24D290458()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_24D290468()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_24D290478()
{
  return MEMORY[0x270EEF2A0]();
}

uint64_t sub_24D290488()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_24D290498()
{
  return MEMORY[0x270EEF310]();
}

uint64_t sub_24D2904A8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24D2904B8()
{
  return MEMORY[0x270EF00F8]();
}

uint64_t sub_24D2904C8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24D2904D8()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_24D2904E8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24D2904F8()
{
  return MEMORY[0x270EF0198]();
}

uint64_t sub_24D290508()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_24D290518()
{
  return MEMORY[0x270EF0288]();
}

uint64_t sub_24D290528()
{
  return MEMORY[0x270EF0290]();
}

uint64_t sub_24D290538()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_24D290548()
{
  return MEMORY[0x270EF0850]();
}

uint64_t sub_24D290558()
{
  return MEMORY[0x270EF0858]();
}

uint64_t sub_24D290568()
{
  return MEMORY[0x270EF0860]();
}

uint64_t sub_24D290578()
{
  return MEMORY[0x270EF0868]();
}

uint64_t sub_24D290588()
{
  return MEMORY[0x270EF0880]();
}

uint64_t sub_24D290598()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_24D2905A8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24D2905B8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_24D2905C8()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24D2905D8()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_24D2905E8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24D2905F8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24D290608()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24D290618()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_24D290628()
{
  return MEMORY[0x270EF0C10]();
}

uint64_t sub_24D290638()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24D290648()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24D290658()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24D290668()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24D290678()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_24D290688()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_24D290698()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24D2906A8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24D2906B8()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_24D2906C8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_24D2906D8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24D2906E8()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_24D2906F8()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_24D290708()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_24D290718()
{
  return MEMORY[0x270EF1110]();
}

uint64_t sub_24D290728()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_24D290738()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_24D290748()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_24D290758()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_24D290768()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_24D290778()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_24D290788()
{
  return MEMORY[0x270EF1358]();
}

uint64_t sub_24D290798()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_24D2907A8()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_24D2907B8()
{
  return MEMORY[0x270EF13A0]();
}

uint64_t sub_24D2907C8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_24D2907D8()
{
  return MEMORY[0x270EF13F0]();
}

uint64_t sub_24D2907E8()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_24D2907F8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_24D290808()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_24D290818()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24D290828()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_24D290838()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_24D290848()
{
  return MEMORY[0x270FA1120]();
}

uint64_t sub_24D290858()
{
  return MEMORY[0x270FA1128]();
}

uint64_t sub_24D290868()
{
  return MEMORY[0x270FA1138]();
}

uint64_t sub_24D290878()
{
  return MEMORY[0x270F44678]();
}

uint64_t sub_24D290888()
{
  return MEMORY[0x270F446A0]();
}

uint64_t sub_24D290898()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_24D2908A8()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_24D2908B8()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_24D2908C8()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_24D2908D8()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_24D2908E8()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_24D2908F8()
{
  return MEMORY[0x270F44AE8]();
}

uint64_t sub_24D290908()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_24D290918()
{
  return MEMORY[0x270F44B40]();
}

uint64_t sub_24D290928()
{
  return MEMORY[0x270F44B80]();
}

uint64_t sub_24D290938()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_24D290948()
{
  return MEMORY[0x270F44BE0]();
}

uint64_t sub_24D290958()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_24D290968()
{
  return MEMORY[0x270F44C00]();
}

uint64_t sub_24D290978()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_24D290988()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_24D290998()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_24D2909A8()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_24D2909B8()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_24D2909C8()
{
  return MEMORY[0x270F44CB8]();
}

uint64_t sub_24D2909D8()
{
  return MEMORY[0x270F44CC0]();
}

uint64_t sub_24D2909E8()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_24D2909F8()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_24D290A08()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_24D290A18()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_24D290A28()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_24D290A38()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_24D290A48()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_24D290A58()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_24D290A68()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_24D290A78()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_24D290A88()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_24D290A98()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_24D290AA8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24D290AB8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24D290AC8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24D290AD8()
{
  return MEMORY[0x270EEAA90]();
}

uint64_t sub_24D290AE8()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_24D290AF8()
{
  return MEMORY[0x270EEB078]();
}

uint64_t sub_24D290B08()
{
  return MEMORY[0x270EEB088]();
}

uint64_t sub_24D290B18()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_24D290B28()
{
  return MEMORY[0x270F9CFB8]();
}

uint64_t sub_24D290B38()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_24D290B48()
{
  return MEMORY[0x270F9D330]();
}

uint64_t sub_24D290B58()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24D290B68()
{
  return MEMORY[0x270F9D5A0]();
}

uint64_t sub_24D290B78()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24D290B88()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24D290B98()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_24D290BA8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24D290BB8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24D290BC8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24D290BD8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24D290BE8()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_24D290BF8()
{
  return MEMORY[0x270F9D6D0]();
}

uint64_t sub_24D290C08()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_24D290C18()
{
  return MEMORY[0x270F9D6E8]();
}

uint64_t sub_24D290C28()
{
  return MEMORY[0x270F9D7D0]();
}

uint64_t sub_24D290C38()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24D290C48()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24D290C58()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_24D290C68()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t sub_24D290C78()
{
  return MEMORY[0x270F9DAE8]();
}

uint64_t sub_24D290C88()
{
  return MEMORY[0x270F9DAF0]();
}

uint64_t sub_24D290C98()
{
  return MEMORY[0x270F9DAF8]();
}

uint64_t sub_24D290CA8()
{
  return MEMORY[0x270F9DB98]();
}

uint64_t sub_24D290CB8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24D290CC8()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24D290CD8()
{
  return MEMORY[0x270FA1428]();
}

uint64_t sub_24D290CE8()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24D290CF8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24D290D08()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_24D290D18()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_24D290D28()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_24D290D38()
{
  return MEMORY[0x270F9DDC8]();
}

uint64_t sub_24D290D48()
{
  return MEMORY[0x270F9DED0]();
}

uint64_t sub_24D290D58()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24D290D68()
{
  return MEMORY[0x270F9E1C8]();
}

uint64_t sub_24D290D78()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24D290D88()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24D290D98()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_24D290DA8()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_24D290DB8()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_24D290DC8()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_24D290DD8()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_24D290DE8()
{
  return MEMORY[0x270F9E390]();
}

uint64_t sub_24D290DF8()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_24D290E08()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24D290E18()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24D290E28()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24D290E38()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24D290E48()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24D290E58()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24D290E68()
{
  return MEMORY[0x270F9E898]();
}

uint64_t sub_24D290E78()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24D290E88()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_24D290E98()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24D290EA8()
{
  return MEMORY[0x270F9ED88]();
}

uint64_t sub_24D290EB8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24D290EC8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24D290ED8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24D290EE8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24D290EF8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24D290F08()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24D290F18()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24D290F28()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24D290F38()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24D290F48()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24D290F58()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24D290F68()
{
  return MEMORY[0x270F9F768]();
}

uint64_t sub_24D290F78()
{
  return MEMORY[0x270F9F780]();
}

uint64_t sub_24D290F88()
{
  return MEMORY[0x270F9F788]();
}

uint64_t sub_24D290F98()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_24D290FA8()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t sub_24D290FB8()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_24D290FC8()
{
  return MEMORY[0x270F9FA20]();
}

uint64_t sub_24D290FD8()
{
  return MEMORY[0x270F9FAB0]();
}

uint64_t sub_24D290FE8()
{
  return MEMORY[0x270F9FAC0]();
}

uint64_t sub_24D290FF8()
{
  return MEMORY[0x270F9FC58]();
}

uint64_t sub_24D291008()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_24D291018()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24D291028()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24D291038()
{
  return MEMORY[0x270FA00B0]();
}

uint64_t sub_24D291048()
{
  return MEMORY[0x270FA00B8]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0340]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x270FA04D0]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0580]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}