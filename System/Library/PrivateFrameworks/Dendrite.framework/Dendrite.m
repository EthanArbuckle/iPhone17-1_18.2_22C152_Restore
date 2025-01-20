uint64_t sub_24CA48BD8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DarwinNotificationPublisher()
{
  return self;
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24CA48C30(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CA48C50(uint64_t result, int a2, int a3)
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

void type metadata accessor for os_activity_scope_state_s(uint64_t a1)
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_24CA48CA0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[24]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_24CA48CF4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for data_frame_header_t(uint64_t a1)
{
}

void type metadata accessor for WireTypes(uint64_t a1)
{
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for DataFrameStreamSegment(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_24CA48DB4(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[32]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_24CA48E08(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for data_frame_stream_segment_header_t(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_24CA48E74(uint64_t a1, uint64_t a2)
{
  return sub_24CA49558(a1, a2, MEMORY[0x263F07B58]);
}

BOOL sub_24CA48E98(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_24CA48EAC@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_24CA48EBC(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24CA48ED0(uint64_t a1, id *a2)
{
  uint64_t result = sub_24CA86240();
  *a2 = 0;
  return result;
}

uint64_t sub_24CA48F48(uint64_t a1, id *a2)
{
  char v3 = sub_24CA86250();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24CA48FC8@<X0>(uint64_t *a1@<X8>)
{
  sub_24CA86260();
  uint64_t v2 = sub_24CA86230();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24CA4900C(uint64_t a1, uint64_t a2)
{
  return sub_24CA49558(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24CA49028()
{
  uint64_t v0 = sub_24CA86260();
  uint64_t v2 = v1;
  if (v0 == sub_24CA86260() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24CA866A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24CA490B8(uint64_t a1)
{
  uint64_t v2 = sub_24CA493F0(&qword_269807728, type metadata accessor for FileProtectionType);
  uint64_t v3 = sub_24CA493F0(&qword_269807730, type metadata accessor for FileProtectionType);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24CA49174(uint64_t a1)
{
  uint64_t v2 = sub_24CA493F0(&qword_26B180A98, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_24CA493F0((unint64_t *)&unk_269807760, type metadata accessor for FileAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24CA49230@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24CA86230();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24CA49278@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA86260();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CA492A4(uint64_t a1)
{
  uint64_t v2 = sub_24CA493F0(&qword_269807738, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_24CA493F0((unint64_t *)&unk_269807740, type metadata accessor for URLResourceKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24CA49360()
{
  return sub_24CA493F0(&qword_2698076F8, type metadata accessor for URLResourceKey);
}

uint64_t sub_24CA493A8()
{
  return sub_24CA493F0(&qword_269807700, type metadata accessor for URLResourceKey);
}

uint64_t sub_24CA493F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CA49438()
{
  return sub_24CA493F0(&qword_269807708, type metadata accessor for URLResourceKey);
}

uint64_t sub_24CA49480()
{
  return sub_24CA493F0(&qword_269807710, type metadata accessor for FileProtectionType);
}

uint64_t sub_24CA494C8()
{
  return sub_24CA493F0(&qword_269807718, type metadata accessor for FileProtectionType);
}

uint64_t sub_24CA49510()
{
  return sub_24CA493F0(&qword_269807720, type metadata accessor for FileProtectionType);
}

uint64_t sub_24CA49558(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24CA86260();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24CA4959C()
{
  sub_24CA86260();
  sub_24CA862F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA495F0()
{
  sub_24CA86260();
  sub_24CA86720();
  sub_24CA862F0();
  uint64_t v0 = sub_24CA86760();
  swift_bridgeObjectRelease();
  return v0;
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void sub_24CA49678(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24CA496C0()
{
  return sub_24CA493F0(&qword_269807750, type metadata accessor for FileAttributeKey);
}

uint64_t sub_24CA49708()
{
  return sub_24CA493F0(&qword_269807758, type metadata accessor for FileAttributeKey);
}

uint64_t sub_24CA49750()
{
  return sub_24CA493F0(&qword_26B180AA0, type metadata accessor for FileAttributeKey);
}

uint64_t StagingEntry.id.getter()
{
  return *(void *)v0;
}

uint64_t StagingEntry.payload.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_24CA497DC(v1, *(void *)(v0 + 16));
  return v1;
}

uint64_t sub_24CA497DC(uint64_t a1, unint64_t a2)
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

uint64_t StagingEntry.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_24CA4986C(*(void *)(v2 + 8), *(void *)(v2 + 16));
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t sub_24CA4986C(uint64_t a1, unint64_t a2)
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

uint64_t (*StagingEntry.payload.modify())()
{
  return nullsub_1;
}

uint64_t StagingEntry.init(id:payload:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t static DEStagingEntry.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall DEStagingEntry.encode(with:)(NSCoder with)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
  uint64_t v4 = (void *)sub_24CA86230();
  [(objc_class *)with.super.isa encodeInt64:v3 forKey:v4];

  uint64_t v5 = (void *)sub_24CA86080();
  id v6 = (id)sub_24CA86230();
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];
}

id DEStagingEntry.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DEStagingEntry.init(coder:)(a1);
}

id DEStagingEntry.init(coder:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_24CA4CF74(0, &qword_2698077E0);
  uint64_t v4 = v1;
  uint64_t v5 = sub_24CA864F0();
  if (v5)
  {
    id v6 = (void *)v5;
    sub_24CA4CF74(0, &qword_2698077E8);
    v7 = (void *)sub_24CA864F0();
    if (v7)
    {
      v8 = v7;
      id v9 = objc_msgSend(v7, sel_longLongValue);
      *(void *)&v4[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id] = v9;
      id v10 = v6;
      uint64_t v11 = sub_24CA86090();
      uint64_t v13 = v12;

      v14 = (uint64_t *)&v4[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
      uint64_t *v14 = v11;
      v14[1] = v13;

      v18.receiver = v4;
      v18.super_class = ObjectType;
      id v15 = objc_msgSendSuper2(&v18, sel_init);

      return v15;
    }
  }
  if (qword_2698075A0 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v16, (uint64_t)qword_26980A130);
  sub_24CA5A180(0xD00000000000001DLL, 0x800000024CA89360, 0xD000000000000054, 0x800000024CA89380, 0x646F632874696E69, 0xEC000000293A7265);

  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t DEStagingEntry.id.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
}

uint64_t DEStagingEntry.payload.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload);
  sub_24CA497DC(v1, *(void *)(v0 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload + 8));
  return v1;
}

id DEStagingEntry.__allocating_init(id:payload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id] = a1;
  v8 = &v7[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
  *(void *)v8 = a2;
  *((void *)v8 + 1) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id DEStagingEntry.init(id:payload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v3[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id] = a1;
  v8 = &v3[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
  *(void *)v8 = a2;
  *((void *)v8 + 1) = a3;
  v10.receiver = v3;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

id DEStagingEntry.__allocating_init(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = (char *)objc_allocWithZone(v1);
  *(void *)&v5[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id] = v2;
  id v6 = &v5[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
  *(void *)id v6 = v3;
  *((void *)v6 + 1) = v4;
  v8.receiver = v5;
  v8.super_class = v1;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t DEStagingEntry.toSwift.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload);
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload + 8);
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
  a1[1] = v2;
  a1[2] = v3;
  return sub_24CA497DC(v2, v3);
}

id DEStagingEntry.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void DEStagingEntry.init()()
{
}

id DEStagingEntry.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24CA4A0DC@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA4A128(&OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir, 6583651, 0xE300000000000000, a1);
}

uint64_t sub_24CA4A0F4@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA4A128(&OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir, 1702259052, 0xE400000000000000, a1);
}

uint64_t sub_24CA4A10C@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA4A128(&OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir, 0x6D75636563, 0xE500000000000000, a1);
}

uint64_t sub_24CA4A128@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v7 = sub_24CA85F80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  objc_super v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180870);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v21 - v15;
  uint64_t v17 = v4 + *a1;
  swift_beginAccess();
  sub_24CA4EE40(v17, (uint64_t)v16);
  uint64_t v18 = sub_24CA86020();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a4, v16, v18);
  }
  sub_24CA4D98C((uint64_t)v16);
  uint64_t v23 = v21;
  uint64_t v24 = v22;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F06E50], v7);
  sub_24CA4D0C8();
  sub_24CA86010();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v14, a4, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v14, 0, 1, v18);
  swift_beginAccess();
  sub_24CA4EEA8((uint64_t)v14, v17);
  return swift_endAccess();
}

BOOL sub_24CA4A3F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24CA4A404()
{
  return sub_24CA86760();
}

uint64_t sub_24CA4A44C()
{
  return sub_24CA86730();
}

uint64_t sub_24CA4A478()
{
  return sub_24CA86760();
}

uint64_t PersistentStorage.__allocating_init(internal:)(char *a1)
{
  uint64_t v2 = swift_allocObject();
  PersistentStorage.init(internal:)(a1);
  return v2;
}

uint64_t PersistentStorage.init(internal:)(char *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24CA85F80();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v33 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CA86020();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  objc_super v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v34 = (char *)&v29 - v11;
  uint64_t v12 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_WORD *)(v2 + 120) = 0;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v15(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir, 1, 1, v6);
  v15(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir, 1, 1, v6);
  v15(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir, 1, 1, v6);
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v12, (uint64_t)qword_26980A118);
  sub_24CA4CFB0(v16, (uint64_t)v14);
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  uint64_t v37 = 0xD000000000000011;
  unint64_t v38 = 0x800000024CA89400;
  sub_24CA4D014();
  uint64_t v30 = v6;
  v31 = a1;
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168(v37, v38, 0xD000000000000054, 0x800000024CA89380, 0x746E692874696E69, 0xEF293A6C616E7265);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v14);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage_url, a1, v6);
  uint64_t v37 = 1702259052;
  unint64_t v38 = 0xE400000000000000;
  uint64_t v17 = *MEMORY[0x263F06E50];
  uint64_t v32 = v2;
  uint64_t v19 = v35;
  uint64_t v18 = v36;
  uint64_t v29 = v7;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 104);
  uint64_t v21 = v33;
  v20(v33, v17, v36);
  sub_24CA4D0C8();
  sub_24CA86010();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v21, v18);
  swift_bridgeObjectRelease();
  uint64_t v37 = 0x65746972646E6564;
  unint64_t v38 = 0xEB0000000062642ELL;
  v20(v21, v17, v18);
  uint64_t v23 = (uint64_t)v34;
  sub_24CA86010();
  v22(v21, v18);
  swift_bridgeObjectRelease();
  uint64_t v24 = v30;
  v25 = *(void (**)(char *, uint64_t))(v29 + 8);
  v25(v10, v30);
  v26 = (void *)*MEMORY[0x263F08098];
  type metadata accessor for SQLiteStorage();
  swift_allocObject();
  v27 = sub_24CA76FEC(v23, (uint64_t)v26);
  v25(v31, v24);
  uint64_t result = v32;
  *(void *)(v32 + 112) = v27;
  return result;
}

uint64_t PersistentStorage.__allocating_init(ingestion:)(char *a1)
{
  uint64_t v2 = swift_allocObject();
  PersistentStorage.init(ingestion:)(a1);
  return v2;
}

uint64_t PersistentStorage.init(ingestion:)(char *a1)
{
  uint64_t v2 = v1;
  uint64_t v38 = sub_24CA85F80();
  uint64_t v36 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CA86020();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v35 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v37 = (char *)&v29 - v10;
  uint64_t v11 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_WORD *)(v2 + 120) = 0;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v14(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir, 1, 1, v6);
  v14(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir, 1, 1, v6);
  v14(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir, 1, 1, v6);
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_26980A118);
  sub_24CA4CFB0(v15, (uint64_t)v13);
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  uint64_t v39 = 0xD000000000000012;
  unint64_t v40 = 0x800000024CA89420;
  sub_24CA4D014();
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168(v39, v40, 0xD000000000000054, 0x800000024CA89380, 0xD000000000000010, 0x800000024CA89440);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage_url, a1, v6);
  uint64_t v39 = 6583651;
  unint64_t v40 = 0xE300000000000000;
  uint64_t v16 = *MEMORY[0x263F06E50];
  uint64_t v32 = v6;
  v33 = a1;
  uint64_t v17 = v36;
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 104);
  uint64_t v31 = v7;
  uint64_t v18 = v5;
  uint64_t v19 = v5;
  uint64_t v20 = v38;
  v30(v19, v16, v38);
  sub_24CA4D0C8();
  uint64_t v21 = v35;
  sub_24CA86010();
  uint64_t v34 = v2;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v17 + 8);
  v22(v18, v20);
  swift_bridgeObjectRelease();
  uint64_t v39 = 0x65746972646E6564;
  unint64_t v40 = 0xEB0000000062642ELL;
  v30(v18, v16, v20);
  uint64_t v23 = (uint64_t)v37;
  sub_24CA86010();
  v22(v18, v20);
  swift_bridgeObjectRelease();
  uint64_t v24 = v32;
  v25 = *(void (**)(char *, uint64_t))(v31 + 8);
  v25(v21, v32);
  v26 = (void *)*MEMORY[0x263F08098];
  type metadata accessor for SQLiteStorage();
  swift_allocObject();
  v27 = sub_24CA76FEC(v23, (uint64_t)v26);
  v25(v33, v24);
  uint64_t result = v34;
  *(void *)(v34 + 112) = v27;
  return result;
}

uint64_t sub_24CA4AF18(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v4, (uint64_t)qword_26980A118);
  sub_24CA4CFB0(v7, (uint64_t)v6);
  uint64_t v13 = 0x20657461657243;
  unint64_t v14 = 0xE700000000000000;
  sub_24CA86060();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168(v13, v14, 0xD000000000000054, 0x800000024CA89380, 0x5F28657461657263, 0xEA0000000000293ALL);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807820);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CA877D0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_retain();
  sub_24CA497DC(a1, a2);
  sub_24CA4D160(inited);
  uint64_t v10 = v9;
  swift_release();
  swift_setDeallocating();
  swift_arrayDestroy();
  return v10;
}

uint64_t sub_24CA4B108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_24CA4B12C, v3, 0);
}

uint64_t sub_24CA4B12C()
{
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v3, (uint64_t)qword_26980A118);
  sub_24CA5A168(0x7320657461657243, 0xEF65636E65757165, 0xD000000000000054, 0x800000024CA89380, 0x5F28657461657263, 0xEA0000000000293ALL);
  swift_retain();
  sub_24CA77E54(v2, v1);
  uint64_t v5 = v4;
  swift_release();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

uint64_t sub_24CA4B27C(sqlite3_int64 a1)
{
  uint64_t v2 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)qword_26980A118);
  sub_24CA4CFB0(v5, (uint64_t)v4);
  uint64_t v8 = 0x206574656C6544;
  unint64_t v9 = 0xE700000000000000;
  v7[1] = a1;
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168(v8, v9, 0xD000000000000054, 0x800000024CA89380, 0x69286574656C6564, 0xEB00000000293A64);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v4);
  swift_retain();
  sub_24CA796BC(a1);
  return swift_release();
}

uint64_t sub_24CA4B414(sqlite3_int64 a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v6, (uint64_t)qword_26980A118);
  sub_24CA4CFB0(v9, (uint64_t)v8);
  uint64_t v12 = 0x20657461647055;
  unint64_t v13 = 0xE700000000000000;
  v11[1] = a1;
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA86320();
  sub_24CA86060();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168(v12, v13, 0xD000000000000054, 0x800000024CA89380, 0xD000000000000013, 0x800000024CA89460);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v8);
  swift_retain();
  sub_24CA787A4(a1, a2, a3);
  return swift_release();
}

uint64_t sub_24CA4B5EC@<X0>(sqlite3_int64 a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v5, (uint64_t)qword_26980A118);
  sub_24CA4CFB0(v8, (uint64_t)v7);
  uint64_t v18 = 0x206863746546;
  unint64_t v19 = 0xE600000000000000;
  sqlite3_int64 v20 = a1;
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168(v18, v19, 0xD000000000000054, 0x800000024CA89380, 0x6469286863746566, 0xEA0000000000293ALL);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v7);
  swift_retain();
  uint64_t v9 = sub_24CA78C6C(a1);
  uint64_t v11 = v10;
  unint64_t v13 = v12;
  uint64_t result = swift_release();
  if (!v2)
  {
    if (v13 >> 60 == 15) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = v9;
    }
    if (v13 >> 60 == 15) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v11;
    }
    unint64_t v17 = 0xF000000000000000;
    if (v13 >> 60 != 15) {
      unint64_t v17 = v13;
    }
    *a2 = v15;
    a2[1] = v16;
    a2[2] = v17;
  }
  return result;
}

uint64_t sub_24CA4B7BC(uint64_t a1, char a2, uint64_t a3, char a4)
{
  *(void *)(v5 + 64) = a3;
  *(void *)(v5 + 72) = v4;
  *(unsigned char *)(v5 + 26) = a4;
  *(unsigned char *)(v5 + 25) = a2;
  *(void *)(v5 + 56) = a1;
  *(void *)(v5 + 80) = type metadata accessor for InternalLogger();
  *(void *)(v5 + 88) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CA4B85C, v4, 0);
}

uint64_t sub_24CA4B85C()
{
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 26);
  char v4 = *(unsigned char *)(v0 + 25);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = __swift_project_value_buffer(*(void *)(v0 + 80), (uint64_t)qword_26980A118);
  sub_24CA4CFB0(v6, v1);
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v5;
  *(unsigned char *)(v0 + 24) = v4 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807838);
  sub_24CA862B0();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA86320();
  *(void *)(v0 + 32) = v2;
  *(unsigned char *)(v0 + 40) = v3 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807840);
  sub_24CA862B0();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168(0x205D5B6863746546, 0xEB00000000207461, 0xD000000000000054, 0x800000024CA89380, 0xD000000000000010, 0x800000024CA89480);
  swift_bridgeObjectRelease();
  uint64_t result = sub_24CA4D06C(v1);
  uint64_t v8 = 0;
  if (v3) {
    goto LABEL_7;
  }
  uint64_t v9 = *(void *)(v0 + 64);
  if (v9 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v9 > 0x7FFFFFFF)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v8 = *(void *)(v0 + 64);
LABEL_7:
  char v10 = *(unsigned char *)(v0 + 26);
  sqlite3_int64 v11 = *(void *)(v0 + 56);
  char v12 = *(unsigned char *)(v0 + 25) & 1;
  swift_retain();
  sub_24CA78E88(v11, v12, v8 | ((unint64_t)(v10 & 1) << 32));
  uint64_t v14 = v13;
  swift_release();
  uint64_t v15 = sub_24CA4BB60(v14);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v16(v15);
}

uint64_t sub_24CA4BB60(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    sub_24CA74768(0, v1, 0);
    uint64_t v2 = v12;
    char v4 = (unint64_t *)(a1 + 48);
    do
    {
      uint64_t v6 = *(v4 - 2);
      uint64_t v5 = *(v4 - 1);
      unint64_t v7 = *v4;
      sub_24CA497DC(v5, *v4);
      unint64_t v9 = *(void *)(v12 + 16);
      unint64_t v8 = *(void *)(v12 + 24);
      if (v9 >= v8 >> 1) {
        sub_24CA74768(v8 > 1, v9 + 1, 1);
      }
      v4 += 3;
      *(void *)(v12 + 16) = v9 + 1;
      char v10 = (void *)(v12 + 24 * v9);
      v10[4] = v6;
      v10[5] = v5;
      v10[6] = v7;
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_24CA4BC50()
{
  uint64_t v2 = v0;
  v21[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = sub_24CA86020();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v7, (uint64_t)qword_26980A118);
  sub_24CA5A198(0xD000000000000012, 0x800000024CA894A0, 0xD000000000000054, 0x800000024CA89380, 0xD000000000000012, 0x800000024CA894C0);
  if (*(unsigned char *)(v0 + 120) == 1)
  {
    sub_24CA4D938();
    swift_allocError();
    *(void *)uint64_t v8 = 0xD000000000000019;
    *(void *)(v8 + 8) = 0x800000024CA894E0;
    *(unsigned char *)(v8 + 16) = 0;
  }
  else
  {
    v20[1] = v1;
    unint64_t v9 = self;
    id v10 = objc_msgSend(v9, sel_defaultManager);
    sub_24CA4A0DC((uint64_t)v6);
    sub_24CA86000();
    sqlite3_int64 v11 = *(void (**)(char *, uint64_t))(v4 + 8);
    v11(v6, v3);
    uint64_t v12 = (void *)sub_24CA86230();
    swift_bridgeObjectRelease();
    unsigned int v13 = objc_msgSend(v10, sel_fileExistsAtPath_, v12);

    if (v13) {
      *(unsigned char *)(v2 + 120) = 1;
    }
    swift_retain();
    sub_24CA798BC();
    swift_release();
    id v14 = objc_msgSend(v9, sel_defaultManager);
    sub_24CA4A0F4((uint64_t)v6);
    uint64_t v15 = (void *)sub_24CA85FD0();
    v11(v6, v3);
    sub_24CA4A0DC((uint64_t)v6);
    uint64_t v16 = (void *)sub_24CA85FD0();
    v11(v6, v3);
    v21[0] = 0;
    unsigned __int8 v17 = objc_msgSend(v14, sel_moveItemAtURL_toURL_error_, v15, v16, v21);

    id result = v21[0];
    if (v17)
    {
      *(unsigned char *)(v2 + 120) = 1;
      return result;
    }
    unint64_t v19 = result;
    sub_24CA85F70();
  }
  return (id)swift_willThrow();
}

id sub_24CA4BFC4()
{
  uint64_t v1 = v0;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_24CA86020();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v6, (uint64_t)qword_26980A118);
  sub_24CA5A198(0xD000000000000017, 0x800000024CA89500, 0xD000000000000054, 0x800000024CA89380, 0xD000000000000017, 0x800000024CA89520);
  if (*(unsigned char *)(v0 + 120) != 1)
  {
    sub_24CA4D938();
    swift_allocError();
    *(void *)uint64_t v14 = 0xD000000000000019;
    *(void *)(v14 + 8) = 0x800000024CA89540;
    *(unsigned char *)(v14 + 16) = 0;
    return (id)swift_willThrow();
  }
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_defaultManager);
  sub_24CA4A0DC((uint64_t)v5);
  sub_24CA86000();
  v25 = *(void (**)(char *, uint64_t))(v3 + 8);
  v25(v5, v2);
  unint64_t v9 = (void *)sub_24CA86230();
  swift_bridgeObjectRelease();
  unsigned __int8 v10 = objc_msgSend(v8, sel_fileExistsAtPath_, v9);

  if ((v10 & 1) == 0)
  {
    id v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    id v26 = (id)0xD00000000000001FLL;
    unint64_t v27 = 0x800000024CA89560;
    sub_24CA4A0DC((uint64_t)v5);
    goto LABEL_9;
  }
  id v11 = objc_msgSend(v7, sel_defaultManager);
  sub_24CA4A10C((uint64_t)v5);
  sub_24CA86000();
  v25(v5, v2);
  uint64_t v12 = (void *)sub_24CA86230();
  swift_bridgeObjectRelease();
  unsigned int v13 = objc_msgSend(v11, sel_fileExistsAtPath_, v12);

  if (v13)
  {
    id v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    id v26 = (id)0xD000000000000028;
    unint64_t v27 = 0x800000024CA89580;
    sub_24CA4A10C((uint64_t)v5);
LABEL_9:
    sub_24CA4D014();
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    v25(v5, v2);
    id v15 = v26;
    unint64_t v16 = v27;
    sub_24CA4D938();
    swift_allocError();
    *(void *)uint64_t v17 = v15;
    *(void *)(v17 + 8) = v16;
    *(unsigned char *)(v17 + 16) = 1;
    return (id)swift_willThrow();
  }
  id v19 = objc_msgSend(v7, sel_defaultManager);
  sub_24CA4A0DC((uint64_t)v5);
  sqlite3_int64 v20 = (void *)sub_24CA85FD0();
  uint64_t v21 = v25;
  v25(v5, v2);
  sub_24CA4A10C((uint64_t)v5);
  uint64_t v22 = (void *)sub_24CA85FD0();
  v21(v5, v2);
  id v26 = 0;
  unsigned __int8 v23 = objc_msgSend(v19, sel_moveItemAtURL_toURL_error_, v20, v22, &v26);

  id result = v26;
  if ((v23 & 1) == 0)
  {
    uint64_t v24 = result;
    sub_24CA85F70();

    return (id)swift_willThrow();
  }
  *(unsigned char *)(v1 + 120) = 2;
  return result;
}

id sub_24CA4C4B0()
{
  uint64_t v1 = v0;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_24CA86020();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269807598 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v6, (uint64_t)qword_26980A118);
  sub_24CA5A198(0xD000000000000010, 0x800000024CA895B0, 0xD000000000000054, 0x800000024CA89380, 0xD000000000000011, 0x800000024CA895D0);
  if (*(unsigned char *)(v0 + 120) == 2)
  {
    uint64_t v7 = self;
    id v8 = objc_msgSend(v7, sel_defaultManager);
    sub_24CA4A10C((uint64_t)v5);
    sub_24CA86000();
    sqlite3_int64 v20 = *(void (**)(char *, uint64_t))(v3 + 8);
    v20(v5, v2);
    unint64_t v9 = (void *)sub_24CA86230();
    swift_bridgeObjectRelease();
    unsigned __int8 v10 = objc_msgSend(v8, sel_fileExistsAtPath_, v9);

    if (v10)
    {
      id v11 = objc_msgSend(v7, sel_defaultManager);
      sub_24CA4A0DC((uint64_t)v5);
      uint64_t v12 = (void *)sub_24CA85FD0();
      v20(v5, v2);
      id v21 = 0;
      unsigned __int8 v13 = objc_msgSend(v11, sel_removeItemAtURL_error_, v12, &v21);

      id result = v21;
      if (v13)
      {
        *(unsigned char *)(v1 + 120) = 0;
        return result;
      }
      id v19 = result;
      sub_24CA85F70();
    }
    else
    {
      id v21 = 0;
      unint64_t v22 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      id v21 = (id)0xD000000000000021;
      unint64_t v22 = 0x800000024CA89610;
      sub_24CA4A10C((uint64_t)v5);
      sub_24CA4D014();
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      v20(v5, v2);
      id v16 = v21;
      unint64_t v17 = v22;
      sub_24CA4D938();
      swift_allocError();
      *(void *)uint64_t v18 = v16;
      *(void *)(v18 + 8) = v17;
      *(unsigned char *)(v18 + 16) = 1;
    }
  }
  else
  {
    sub_24CA4D938();
    swift_allocError();
    *(void *)uint64_t v15 = 0xD00000000000001BLL;
    *(void *)(v15 + 8) = 0x800000024CA895F0;
    *(unsigned char *)(v15 + 16) = 0;
  }
  return (id)swift_willThrow();
}

uint64_t PersistentStorage.deinit()
{
  uint64_t v1 = v0;
  swift_retain();
  sub_24CA798BC();
  swift_release();
  swift_release();
  uint64_t v2 = v0 + OBJC_IVAR____TtC8Dendrite17PersistentStorage_url;
  uint64_t v3 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  sub_24CA4D98C(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir);
  sub_24CA4D98C(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir);
  sub_24CA4D98C(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir);
  swift_defaultActor_destroy();
  return v1;
}

uint64_t PersistentStorage.__deallocating_deinit()
{
  uint64_t v1 = v0;
  swift_retain();
  sub_24CA798BC();
  swift_release();
  swift_release();
  uint64_t v2 = v0 + OBJC_IVAR____TtC8Dendrite17PersistentStorage_url;
  uint64_t v3 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  sub_24CA4D98C(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir);
  sub_24CA4D98C(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir);
  sub_24CA4D98C(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir);
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v1);
}

uint64_t PersistentStorage.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24CA4CA24()
{
  return v0;
}

uint64_t sub_24CA4CA30(uint64_t a1, uint64_t a2)
{
  v3[2] = a1;
  v3[3] = a2;
  uint64_t v4 = *v2;
  v3[4] = *v2;
  return MEMORY[0x270FA2498](sub_24CA4CA54, v4, 0);
}

uint64_t sub_24CA4CA54()
{
  uint64_t v1 = sub_24CA4AF18(v0[2], v0[3]);
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_24CA4CAD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[4] = a3;
  v9[5] = v8;
  v9[2] = a1;
  v9[3] = a2;
  v9[1] = sub_24CA4EF14;
  return MEMORY[0x270FA2498](sub_24CA4B12C, v8, 0);
}

uint64_t sub_24CA4CB98(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_24CA4CBB8, v3, 0);
}

uint64_t sub_24CA4CBB8()
{
  sub_24CA4B27C(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CA4CC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_24CA4CC58, v5, 0);
}

uint64_t sub_24CA4CC58()
{
  sub_24CA4B414(v0[2], v0[3], v0[4]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CA4CCD8(uint64_t a1, uint64_t a2)
{
  v3[2] = a1;
  v3[3] = a2;
  uint64_t v4 = *v2;
  v3[4] = *v2;
  return MEMORY[0x270FA2498](sub_24CA4CCFC, v4, 0);
}

uint64_t sub_24CA4CCFC()
{
  sub_24CA4B5EC(*(void *)(v0 + 24), *(uint64_t **)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CA4CD7C(uint64_t a1, char a2, uint64_t a3, char a4)
{
  char v7 = a2 & 1;
  char v8 = a4 & 1;
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_24CA4CE3C;
  return sub_24CA4B7BC(a1, v7, a3, v8);
}

uint64_t sub_24CA4CE3C(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24CA4CF74(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24CA4CFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CA4D014()
{
  unint64_t result = qword_26B180898;
  if (!qword_26B180898)
  {
    sub_24CA86020();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B180898);
  }
  return result;
}

uint64_t sub_24CA4D06C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CA4D0C8()
{
  unint64_t result = qword_26B180A88;
  if (!qword_26B180A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B180A88);
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

void sub_24CA4D160(uint64_t a1)
{
  uint64_t v3 = v1;
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  uint64_t v5 = (sqlite3 **)(v1 + 16);
  swift_beginAccess();
  uint64_t v6 = *(sqlite3 **)(v1 + 16);
  if (!v6)
  {
    sub_24CA77260();
    if (v2) {
      return;
    }
    uint64_t v6 = *v5;
  }
  unsigned int v7 = sqlite3_exec(v6, "BEGIN;", 0, 0, 0);
  sub_24CA77B54(v7, 0x657475636578655FLL, 0xEE00293A6C717328);
  if (v2) {
    return;
  }
  ppStmt[0] = 0;
  v49 = (sqlite3 **)(v1 + 16);
  uint64_t v8 = *v5;
  if (qword_2698075E0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24CA86300();
  uint64_t v10 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_50;
  }
  if (v10 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
  }
  if (v10 > 0x7FFFFFFF) {
    goto LABEL_51;
  }
  uint64_t v11 = sub_24CA862C0();
  unsigned int v12 = sqlite3_prepare_v2(v8, (const char *)(v11 + 32), v10, ppStmt, 0);
  swift_release();
  sub_24CA77B54(v12, 0xD000000000000011, 0x800000024CA897B0);
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    uint64_t v50 = OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_STATIC;
    uint64_t v14 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    while (2)
    {
      uint64_t v16 = *(v14 - 1);
      unint64_t v15 = *v14;
      v51 = v14 + 2;
      switch(*v14 >> 62)
      {
        case 1uLL:
          if (v16 >> 32 < (int)v16) {
            goto LABEL_54;
          }
          swift_retain();
          sub_24CA497DC(v16, v15);
          uint64_t v21 = sub_24CA85F00();
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = sub_24CA85F30();
            if (__OFSUB__((int)v16, v23)) {
              goto LABEL_58;
            }
            uint64_t v24 = (const void *)(v22 + (int)v16 - v23);
          }
          else
          {
            uint64_t v24 = 0;
          }
          uint64_t v40 = sub_24CA85F20();
          if (v40 >= (v16 >> 32) - (int)v16) {
            uint64_t v41 = (v16 >> 32) - (int)v16;
          }
          else {
            uint64_t v41 = v40;
          }
          if (v24)
          {
            if (v41 < (uint64_t)0xFFFFFFFF80000000) {
              goto LABEL_52;
            }
            if (v41 > 0x7FFFFFFF) {
              goto LABEL_53;
            }
          }
          else
          {
            LODWORD(v41) = 0;
          }
          v42 = ppStmt[0];
          unsigned int v43 = sqlite3_bind_blob(ppStmt[0], 1, v24, v41, *(void (__cdecl **)(void *))(v3 + v50));
          sub_24CA77B54(v43, 0xD000000000000011, 0x800000024CA897B0);
          unsigned int v44 = sqlite3_step(v42);
          sub_24CA77B54(v44, 0xD000000000000011, 0x800000024CA897B0);
          unsigned int v45 = sqlite3_reset(v42);
          sub_24CA77B54(v45, 0xD000000000000011, 0x800000024CA897B0);
          sub_24CA4986C(v16, v15);
LABEL_15:
          sub_24CA4986C(v16, v15);
LABEL_16:
          --v13;
          uint64_t v14 = v51;
          if (v13) {
            continue;
          }
          swift_bridgeObjectRelease();
          break;
        case 2uLL:
          uint64_t v25 = *(void *)(v16 + 16);
          uint64_t v48 = *(void *)(v16 + 24);
          sub_24CA497DC(v16, v15);
          swift_retain();
          swift_retain();
          id v26 = (char *)sub_24CA85F00();
          if (!v26) {
            goto LABEL_26;
          }
          uint64_t v27 = sub_24CA85F30();
          if (__OFSUB__(v25, v27)) {
            goto LABEL_59;
          }
          v26 += v25 - v27;
LABEL_26:
          BOOL v28 = __OFSUB__(v48, v25);
          uint64_t v29 = v48 - v25;
          if (v28) {
            goto LABEL_55;
          }
          uint64_t v30 = sub_24CA85F20();
          if (v30 >= v29) {
            uint64_t v31 = v29;
          }
          else {
            uint64_t v31 = v30;
          }
          if (v26) {
            uint64_t v32 = v31;
          }
          else {
            uint64_t v32 = 0;
          }
          if (v32 < (uint64_t)0xFFFFFFFF80000000) {
            goto LABEL_56;
          }
          if (v32 > 0x7FFFFFFF) {
            goto LABEL_57;
          }
          v33 = ppStmt[0];
          unsigned int v34 = sqlite3_bind_blob(ppStmt[0], 1, v26, v32, *(void (__cdecl **)(void *))(v3 + v50));
          sub_24CA77B54(v34, 0xD000000000000011, 0x800000024CA897B0);
          unsigned int v35 = sqlite3_step(v33);
          sub_24CA77B54(v35, 0xD000000000000011, 0x800000024CA897B0);
          unsigned int v36 = sqlite3_reset(v33);
          sub_24CA77B54(v36, 0xD000000000000011, 0x800000024CA897B0);
          swift_release();
          swift_release();
          sub_24CA4986C(v16, v15);
          goto LABEL_16;
        case 3uLL:
          memset(v52, 0, 14);
          uint64_t v37 = ppStmt[0];
          unsigned int v38 = sqlite3_bind_blob(ppStmt[0], 1, v52, 0, *(void (__cdecl **)(void *))(v3 + v50));
          sub_24CA77B54(v38, 0xD000000000000011, 0x800000024CA897B0);
          unsigned int v39 = sqlite3_step(v37);
          sub_24CA77B54(v39, 0xD000000000000011, 0x800000024CA897B0);
          unsigned int v20 = sqlite3_reset(v37);
          goto LABEL_14;
        default:
          v52[0] = *(v14 - 1);
          LOWORD(v52[1]) = v15;
          BYTE2(v52[1]) = BYTE2(v15);
          BYTE3(v52[1]) = BYTE3(v15);
          BYTE4(v52[1]) = BYTE4(v15);
          BYTE5(v52[1]) = BYTE5(v15);
          unint64_t v17 = ppStmt[0];
          unsigned int v18 = sqlite3_bind_blob(ppStmt[0], 1, v52, BYTE6(v15), *(void (__cdecl **)(void *))(v3 + v50));
          sub_24CA77B54(v18, 0xD000000000000011, 0x800000024CA897B0);
          unsigned int v19 = sqlite3_step(v17);
          sub_24CA77B54(v19, 0xD000000000000011, 0x800000024CA897B0);
          unsigned int v20 = sqlite3_reset(v17);
LABEL_14:
          sub_24CA77B54(v20, 0xD000000000000011, 0x800000024CA897B0);
          goto LABEL_15;
      }
      break;
    }
  }
  unsigned int v46 = sqlite3_exec(*(sqlite3 **)(v3 + 16), "COMMIT;", 0, 0, 0);
  sub_24CA77B54(v46, 0x657475636578655FLL, 0xEE00293A6C717328);
  unsigned int v47 = sqlite3_finalize(ppStmt[0]);
  sub_24CA77B54(v47, 0xD000000000000011, 0x800000024CA897B0);
  sqlite3_last_insert_rowid(*v49);
}

unint64_t sub_24CA4D938()
{
  unint64_t result = qword_269807848;
  if (!qword_269807848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807848);
  }
  return result;
}

uint64_t sub_24CA4D98C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180870);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for StagingEntry(uint64_t a1)
{
  return sub_24CA4986C(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

void *_s8Dendrite12StagingEntryVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  unint64_t v4 = a2[2];
  sub_24CA497DC(v3, v4);
  a1[1] = v3;
  a1[2] = v4;
  return a1;
}

void *assignWithCopy for StagingEntry(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  unint64_t v4 = a2[2];
  sub_24CA497DC(v3, v4);
  uint64_t v5 = a1[1];
  unint64_t v6 = a1[2];
  a1[1] = v3;
  a1[2] = v4;
  sub_24CA4986C(v5, v6);
  return a1;
}

uint64_t assignWithTake for StagingEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  sub_24CA4986C(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for StagingEntry(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for StagingEntry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StagingEntry()
{
  return &type metadata for StagingEntry;
}

uint64_t type metadata accessor for DEStagingEntry()
{
  return self;
}

uint64_t method lookup function for DEStagingEntry(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DEStagingEntry);
}

uint64_t dispatch thunk of DEStagingEntry.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of DEStagingEntry.__allocating_init(id:payload:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of StagingStorage.create(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24CA4EF18;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of StagingStorage.create<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 16) + **(int **)(a5 + 16));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24CA4EF18;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of StagingStorage.delete(id:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_24CA4EF10;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StagingStorage.update(id:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 32) + **(int **)(a5 + 32));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24CA4EF10;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of StagingStorage.fetch(id:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 40) + **(int **)(a4 + 40));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24CA4E148;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_24CA4E148()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of StagingStorage.fetch(at:limit:)(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  unint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 48)
                                                                                     + **(int **)(a6 + 48));
  uint64_t v11 = a2 & 1;
  uint64_t v12 = a4 & 1;
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_24CA4E360;
  return v15(a1, v11, a3, v12, a5, a6);
}

uint64_t sub_24CA4E360(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_24CA4E460()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for PersistentStorageError()
{
  return sub_24CA4E478();
}

uint64_t sub_24CA4E478()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s8Dendrite22PersistentStorageErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24CA4E460();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PersistentStorageError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24CA4E460();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_24CA4E478();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PersistentStorageError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24CA4E478();
  return a1;
}

uint64_t getEnumTagSinglePayload for PersistentStorageError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
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

uint64_t storeEnumTagSinglePayload for PersistentStorageError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CA4E60C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24CA4E614(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PersistentStorageError()
{
  return &type metadata for PersistentStorageError;
}

uint64_t sub_24CA4E630()
{
  return type metadata accessor for PersistentStorage();
}

uint64_t type metadata accessor for PersistentStorage()
{
  uint64_t result = qword_269807928;
  if (!qword_269807928) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24CA4E684()
{
  sub_24CA86020();
  if (v0 <= 0x3F)
  {
    sub_24CA4EBE0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for PersistentStorage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PersistentStorage);
}

uint64_t dispatch thunk of PersistentStorage.__allocating_init(internal:)()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of PersistentStorage.__allocating_init(ingestion:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of PersistentStorage.create(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of PersistentStorage.create<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 312)
                                                          + **(int **)(*(void *)v3 + 312));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24CA4EF18;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of PersistentStorage.delete(id:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of PersistentStorage.update(id:payload:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of PersistentStorage.fetch(id:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of PersistentStorage.fetch(at:limit:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 344)
                                                                   + **(int **)(*(void *)v4 + 344));
  uint64_t v8 = a2 & 1;
  uint64_t v9 = a4 & 1;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_24CA4EF18;
  return v12(a1, v8, a3, v9);
}

uint64_t dispatch thunk of PersistentStorage.prepareForIngest()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of PersistentStorage.prepareForSyndication()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of PersistentStorage.syndicationDone()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

void sub_24CA4EBE0()
{
  if (!qword_26B180A28)
  {
    sub_24CA86020();
    unint64_t v0 = sub_24CA86520();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B180A28);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PersistentStorage.State(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PersistentStorage.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA4EDA0);
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

uint64_t sub_24CA4EDC8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CA4EDD0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PersistentStorage.State()
{
  return &type metadata for PersistentStorage.State;
}

unint64_t sub_24CA4EDEC()
{
  unint64_t result = qword_269807950;
  if (!qword_269807950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807950);
  }
  return result;
}

uint64_t sub_24CA4EE40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA4EEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of DataFrameStreamWriter.append(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of DataFrameStreamWriter.prune(each:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DataFrameStreamWriter.vacuum()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of DataFrameStreamReader.frameData(forIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t Set<>.difference(protoData:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_24CA4EFEC(a1, a2, a3, 0);
}

uint64_t Set<>.intersection(protoData:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_24CA4EFEC(a1, a2, a3, 1u);
}

uint64_t sub_24CA4EFEC(uint64_t a1, unint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  unsigned __int8 v7 = a4;
  uint64_t result = sub_24CA516E8(&v7, a3, a1, a2);
  if (v4) {
    return v6;
  }
  return result;
}

uint64_t WireTypes.description.getter()
{
  return 0x4E574F4E4B4E55;
}

uint64_t sub_24CA4F148()
{
  return WireTypes.description.getter();
}

void sub_24CA4F150(unsigned __int8 *a1, uint64_t a2, void *a3, char **a4, uint64_t a5, uint64_t (*a6)(void, void), uint64_t a7)
{
  uint64_t v9 = v8;
  uint64_t v10 = v7;
  uint64_t v51 = a5;
  uint64_t v52 = a7;
  uint64_t v61 = a2;
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v57 = type metadata accessor for InternalLogger();
  uint64_t v15 = MEMORY[0x270FA5388](v57);
  uint64_t v53 = (uint64_t)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v62 = (uint64_t)v45 - v17;
  int v58 = *a1;
  v56 = *a4;
  if (!objc_msgSend(v10, sel_hasMoreData)) {
    return;
  }
  unint64_t v50 = (unint64_t)"LENGTH_DELIMITED";
  uint64_t v48 = a3;
  unint64_t v49 = (unint64_t)"Swift/Integers.swift";
  unint64_t v54 = 0x800000024CA899E0;
  uint64_t v55 = 0x800000024CA89800;
  long long v47 = xmmword_24CA877D0;
  v45[2] = 0x800000024CA89A30;
  v45[1] = ")";
  v59 = a6;
  while (1)
  {
    uint64_t v22 = (char *)objc_msgSend(v10, sel_position);
    LODWORD(v66) = 0;
    LOBYTE(v64) = 0;
    objc_msgSend(v10, sel_readTag_type_, &v66, &v64);
    if (objc_msgSend(v10, sel_hasError))
    {
      if (qword_26B180878 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v57, (uint64_t)qword_26B181220);
      sub_24CA5A180(0x2064616572206270, 0xEE002E726F727265, 0xD000000000000060, v50 | 0x8000000000000000, 0xD000000000000016, 0x800000024CA89900);
      goto LABEL_40;
    }
    uint64_t v23 = v64;
    uint64_t v24 = v66;
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v57, (uint64_t)qword_26B181220);
    sub_24CA4CFB0(v25, v62);
    LODWORD(v64) = v24;
    uint64_t v66 = sub_24CA86680();
    unint64_t v67 = v26;
    sub_24CA86320();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA86320();
    v64 = v22;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    uint64_t v60 = 0xD000000000000040;
    uint64_t v27 = v62;
    sub_24CA5A168(v66, v67, 0xD000000000000060, v55, 0xD000000000000040, v54);
    swift_bridgeObjectRelease();
    sub_24CA4D06C(v27);
    if (a6)
    {
      swift_retain();
      char v28 = a6(v24, v23);
      sub_24CA51D18((uint64_t)a6);
      if (v28) {
        return;
      }
    }
    uint64_t v29 = v56;
    if (v56)
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v29 = sub_24CA82610(0, *((void *)v56 + 2) + 1, 1, v56);
      }
      unint64_t v31 = *((void *)v29 + 2);
      unint64_t v30 = *((void *)v29 + 3);
      if (v31 >= v30 >> 1) {
        uint64_t v29 = sub_24CA82610((char *)(v30 > 1), v31 + 1, 1, v29);
      }
      *((void *)v29 + 2) = v31 + 1;
      uint64_t v32 = &v29[4 * v31 + 32];
      a6 = v59;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F630);
      uint64_t v29 = (char *)swift_allocObject();
      *((_OWORD *)v29 + 1) = v47;
      uint64_t v32 = v29 + 32;
    }
    *(_DWORD *)uint64_t v32 = v24;
    if ((sub_24CA507A8((uint64_t)v29, v61) & 1) == 0)
    {
      if (!v58) {
        goto LABEL_21;
      }
LABEL_3:
      uint64_t v18 = v9;
      uint64_t v19 = v53;
      sub_24CA4CFB0(v25, v53);
      uint64_t v66 = 0x3A676E696E757250;
      unint64_t v67 = 0xE900000000000020;
      v64 = v29;
      ProtoTagPath.description.getter();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v20 = v60;
      sub_24CA5A168(v66, v67, 0xD000000000000060, v50 | 0x8000000000000000, v60, v49 | 0x8000000000000000);
      a6 = v59;
      swift_bridgeObjectRelease();
      uint64_t v21 = v19;
      uint64_t v9 = v18;
      sub_24CA4D06C(v21);
      if (objc_msgSend(v10, sel_skipValueWithTag_type_, v24, v23)) {
        goto LABEL_4;
      }
      sub_24CA4CFB0(v25, v53);
      uint64_t v66 = 0;
      unint64_t v67 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      uint64_t v66 = 0x6F6E20646C756F43;
      unint64_t v67 = 0xEF2070696B732074;
      LODWORD(v64) = v24;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA86320();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      uint64_t v43 = v53;
      sub_24CA5A180(v66, v67, 0xD000000000000060, v50 | 0x8000000000000000, v20, v49 | 0x8000000000000000);
      swift_bridgeObjectRelease();
      sub_24CA4D06C(v43);
LABEL_40:
      sub_24CA5191C();
      swift_allocError();
      *(_DWORD *)uint64_t v44 = 0;
      *(unsigned char *)(v44 + 4) = 1;
      swift_willThrow();
      return;
    }
    swift_bridgeObjectRetain();
    sub_24CA62A64(&v66, (uint64_t)v29);
    swift_bridgeObjectRelease();
    if ((v58 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_21:
    if (v23 == 3)
    {
      int v33 = 0;
    }
    else
    {
      if (v23 != 2) {
        goto LABEL_29;
      }
      int v33 = 1;
    }
    swift_bridgeObjectRetain();
    char v34 = sub_24CA5156C(v61, (uint64_t)v29);
    swift_bridgeObjectRelease();
    if ((v34 & 1) == 0)
    {
LABEL_29:
      swift_bridgeObjectRelease();
      uint64_t v41 = v48;
      goto LABEL_30;
    }
    uint64_t v46 = v9;
    uint64_t v35 = v53;
    sub_24CA4CFB0(v25, v53);
    uint64_t v66 = 0;
    unint64_t v67 = 0xE000000000000000;
    sub_24CA865B0();
    v64 = v29;
    uint64_t v36 = ProtoTagPath.description.getter();
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    uint64_t v66 = v36;
    unint64_t v67 = v38;
    sub_24CA86320();
    sub_24CA5A168(v66, v67, 0xD000000000000060, v50 | 0x8000000000000000, v60, v49 | 0x8000000000000000);
    swift_bridgeObjectRelease();
    sub_24CA4D06C(v35);
    if (!v33) {
      break;
    }
    uint64_t v66 = 0;
    unint64_t v67 = 0;
    objc_msgSend(v10, sel_mark_, &v66);
    v64 = 0;
    unsigned int v39 = v48;
    PBDataWriterPlaceMark();
    char v63 = v58;
    v65 = v29;
    uint64_t v40 = v46;
    sub_24CA4F150(&v63, v61, v39, &v65, v51, 0, 0);
    uint64_t v9 = v40;
    a6 = v59;
    if (v40) {
      goto LABEL_43;
    }
    swift_bridgeObjectRelease();
    PBDataWriterRecallMark();
    objc_msgSend(v10, sel_recall_, &v66);
LABEL_4:
    if ((objc_msgSend(v10, sel_hasMoreData) & 1) == 0) {
      return;
    }
  }
  uint64_t v9 = v46;
  a6 = v59;
  uint64_t v41 = v48;
  if (v23 != 3)
  {
LABEL_35:
    swift_bridgeObjectRelease();
LABEL_30:
    sub_24CA50914(v24, v23, v23, v41);
    if (v9) {
      return;
    }
    goto LABEL_4;
  }
  LOBYTE(v64) = v58;
  uint64_t v66 = (uint64_t)v29;
  uint64_t v42 = swift_allocObject();
  *(_DWORD *)(v42 + 16) = v24;
  sub_24CA4F150(&v64, v61, v41, &v66, v51, sub_24CA51DB0, v42);
  if (!v9)
  {
    swift_release();
    goto LABEL_35;
  }
  swift_release();
LABEL_43:
  swift_bridgeObjectRelease();
}

void static PBDataReader.pluck(tagPath:data:)(uint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v7 = *a1;
  id v8 = objc_allocWithZone(MEMORY[0x263F62228]);
  sub_24CA497DC(a2, a3);
  uint64_t v9 = (void *)sub_24CA86080();
  sub_24CA4986C(a2, a3);
  id v10 = objc_msgSend(v8, sel_initWithData_, v9);

  if (v10)
  {
    uint64_t v13 = v7;
    uint64_t v12 = 0;
    sub_24CA4FD7C(&v13, &v12, 0, 0, a4);
  }
  else
  {
    sub_24CA5191C();
    swift_allocError();
    *(_DWORD *)uint64_t v11 = 0;
    *(unsigned char *)(v11 + 4) = 1;
    swift_willThrow();
  }
}

void sub_24CA4FD7C(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t)@<X2>, uint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  uint64_t v40 = a5;
  uint64_t v6 = v5;
  uint64_t v44 = a4;
  unint64_t v49 = a3;
  v54[1] = *MEMORY[0x263EF8340];
  uint64_t v50 = type metadata accessor for InternalLogger();
  uint64_t v9 = MEMORY[0x270FA5388](v50);
  uint64_t v38 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v38 - v11;
  uint64_t v13 = *a1;
  uint64_t v14 = *a2;
  unint64_t v41 = (unint64_t)"LENGTH_DELIMITED";
  unint64_t v39 = (unint64_t)"otoTagTree.swift";
  unint64_t v47 = 0x800000024CA89870;
  uint64_t v48 = 0x800000024CA89800;
  long long v43 = xmmword_24CA877D0;
  uint64_t v42 = ")";
  while (1)
  {
    if (!objc_msgSend(v6, sel_hasMoreData))
    {
LABEL_19:
      unint64_t v26 = v40;
      *uint64_t v40 = xmmword_24CA87A40;
      *((unsigned char *)v26 + 16) = 1;
      return;
    }
    id v15 = objc_msgSend(v6, sel_position);
    LODWORD(v51) = 0;
    LOBYTE(v54[0]) = 0;
    objc_msgSend(v6, sel_readTag_type_, &v51, v54);
    if (objc_msgSend(v6, sel_hasError))
    {
      if (qword_26B180878 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v50, (uint64_t)qword_26B181220);
      sub_24CA5A180(0x2064616572206270, 0xEE002E726F727265, 0xD000000000000060, v41 | 0x8000000000000000, 0xD000000000000016, 0x800000024CA89900);
      goto LABEL_33;
    }
    uint64_t v16 = LOBYTE(v54[0]);
    uint64_t v17 = v51;
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v18 = v13;
    uint64_t v45 = __swift_project_value_buffer(v50, (uint64_t)qword_26B181220);
    sub_24CA4CFB0(v45, (uint64_t)v12);
    LODWORD(v54[0]) = v17;
    uint64_t v51 = sub_24CA86680();
    unint64_t v52 = v19;
    sub_24CA86320();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA86320();
    v54[0] = v15;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    uint64_t v46 = 0xD000000000000027;
    sub_24CA5A168(v51, v52, 0xD000000000000060, v48, 0xD000000000000027, v47);
    swift_bridgeObjectRelease();
    sub_24CA4D06C((uint64_t)v12);
    uint64_t v20 = v49;
    if (v49)
    {
      swift_retain();
      char v21 = v20(v17, v16);
      sub_24CA51D18((uint64_t)v20);
      if (v21) {
        goto LABEL_19;
      }
    }
    if (v14)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v22 = (uint64_t)sub_24CA82610(0, *(void *)(v14 + 16) + 1, 1, (char *)v14);
      }
      unint64_t v24 = *(void *)(v22 + 16);
      unint64_t v23 = *(void *)(v22 + 24);
      if (v24 >= v23 >> 1) {
        uint64_t v22 = (uint64_t)sub_24CA82610((char *)(v23 > 1), v24 + 1, 1, (char *)v22);
      }
      *(void *)(v22 + 16) = v24 + 1;
      uint64_t v25 = (_DWORD *)(v22 + 4 * v24 + 32);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F630);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = v43;
      uint64_t v25 = (_DWORD *)(v22 + 32);
    }
    uint64_t v13 = v18;
    *uint64_t v25 = v17;
    if (sub_24CA806F0(v18, v22))
    {
      swift_bridgeObjectRelease();
      sub_24CA51010(v17, v16, (uint64_t)v40);
      return;
    }
    if (sub_24CA8228C(v22, v18)) {
      break;
    }
    swift_bridgeObjectRelease();
    if ((objc_msgSend(v6, sel_skipValueWithTag_type_, v17, v16) & 1) == 0)
    {
      uint64_t v31 = v38;
      sub_24CA4CFB0(v45, v38);
      uint64_t v51 = 0;
      unint64_t v52 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      uint64_t v51 = 0x6F6E20646C756F43;
      unint64_t v52 = 0xEF2070696B732074;
      LODWORD(v54[0]) = v17;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA86320();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA5A180(v51, v52, 0xD000000000000060, v41 | 0x8000000000000000, v46, v39 | 0x8000000000000000);
      swift_bridgeObjectRelease();
      uint64_t v36 = v31;
LABEL_32:
      sub_24CA4D06C(v36);
      goto LABEL_33;
    }
  }
  uint64_t v27 = v38;
  sub_24CA4CFB0(v45, v38);
  uint64_t v51 = 0;
  unint64_t v52 = 0xE000000000000000;
  sub_24CA865B0();
  v54[0] = v22;
  uint64_t v28 = ProtoTagPath.description.getter();
  unint64_t v30 = v29;
  swift_bridgeObjectRelease();
  uint64_t v51 = v28;
  unint64_t v52 = v30;
  sub_24CA86320();
  sub_24CA5A168(v51, v52, 0xD000000000000060, v41 | 0x8000000000000000, v46, v39 | 0x8000000000000000);
  swift_bridgeObjectRelease();
  sub_24CA4D06C(v27);
  if (v16 == 3)
  {
    uint64_t v51 = v13;
    v54[0] = v22;
    uint64_t v32 = swift_allocObject();
    *(_DWORD *)(v32 + 16) = v17;
    sub_24CA4FD7C(&v51, v54, sub_24CA51D04, v32);
    swift_release();
    goto LABEL_29;
  }
  if (v16 != 2)
  {
    sub_24CA4CFB0(v45, v27);
    uint64_t v51 = 0;
    unint64_t v52 = 0xE000000000000000;
    sub_24CA865B0();
    v54[0] = v22;
    uint64_t v33 = ProtoTagPath.description.getter();
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v51 = v33;
    unint64_t v52 = v35;
    sub_24CA86320();
    LODWORD(v54[0]) = v17;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA5A180(v51, v52, 0xD000000000000060, v41 | 0x8000000000000000, v46, v39 | 0x8000000000000000);
    swift_bridgeObjectRelease();
    uint64_t v36 = v27;
    goto LABEL_32;
  }
  uint64_t v51 = 0;
  unint64_t v52 = 0;
  if (objc_msgSend(v6, sel_mark_, &v51))
  {
    uint64_t v53 = v22;
    v54[0] = v13;
    sub_24CA4FD7C(v54, &v53, 0, 0);
LABEL_29:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRelease();
LABEL_33:
  sub_24CA5191C();
  swift_allocError();
  *(_DWORD *)uint64_t v37 = 0;
  *(unsigned char *)(v37 + 4) = 1;
  swift_willThrow();
}

uint64_t sub_24CA507A8(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_24CA86720();
  uint64_t v4 = *(void *)(a1 + 16);
  sub_24CA86730();
  if (v4)
  {
    uint64_t v5 = a1 + 32;
    uint64_t v6 = v4;
    do
    {
      v5 += 4;
      sub_24CA86750();
      --v6;
    }
    while (v6);
  }
  uint64_t result = sub_24CA86760();
  uint64_t v8 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v9 = result & ~v8;
  if (((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
    return 0;
  }
  uint64_t v10 = ~v8;
  while (1)
  {
    uint64_t v11 = *(void *)(*(void *)(a2 + 48) + 8 * v9);
    if (*(void *)(v11 + 16) == v4)
    {
      if (!v4 || v11 == a1) {
        return 1;
      }
      if (*(_DWORD *)(v11 + 32) == *(_DWORD *)(a1 + 32))
      {
        if (v4 == 1) {
          return 1;
        }
        if (*(_DWORD *)(v11 + 36) == *(_DWORD *)(a1 + 36)) {
          break;
        }
      }
    }
LABEL_7:
    unint64_t v9 = (v9 + 1) & v10;
    if (((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
      return 0;
    }
  }
  if (v4 == 2) {
    return 1;
  }
  uint64_t v12 = (_DWORD *)(v11 + 40);
  uint64_t v13 = (unsigned int *)(a1 + 40);
  uint64_t v14 = v4 - 2;
  while (v14)
  {
    uint64_t result = *v13;
    if (*v12 != result) {
      goto LABEL_7;
    }
    ++v12;
    ++v13;
    if (!--v14) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

void sub_24CA50914(uint64_t a1, int a2, unsigned __int8 a3, void *a4)
{
  uint64_t v9 = type metadata accessor for InternalLogger();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2)
  {
    case 0:
      objc_msgSend(a4, sel_writeTag_andType_, a1, a3);
      unint64_t v13 = (unint64_t)objc_msgSend(v4, sel_readVarInt);
      if ((v13 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
      objc_msgSend(a4, sel_writeBareVarint_, v13);
      break;
    case 1:
      objc_msgSend(a4, sel_writeFixed64_forTag_, objc_msgSend(v4, sel_readFixed64), a1);
      return;
    case 2:
      id v15 = objc_msgSend(v4, sel_readBytes_, objc_msgSend(v4, sel_readUint32));
      if (v15)
      {
        uint64_t v16 = sub_24CA86090();
        unint64_t v18 = v17;

        sub_24CA497DC(v16, v18);
        id v15 = (id)sub_24CA86080();
        sub_24CA4986C(v16, v18);
      }
      else
      {
        uint64_t v16 = 0;
        unint64_t v18 = 0xF000000000000000;
      }
      objc_msgSend(a4, sel_writeData_forTag_, v15, a1);

      sub_24CA51D8C(v16, v18);
      return;
    case 3:
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = v4;
      *(_DWORD *)(v19 + 24) = a1;
      *(void *)(v19 + 32) = a4;
      uint64_t v20 = (objc_class *)type metadata accessor for BlockShimForPBCodable();
      char v21 = (char *)objc_allocWithZone(v20);
      *(void *)&v21[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error] = 0;
      uint64_t v22 = (uint64_t (**)())&v21[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_block];
      *uint64_t v22 = sub_24CA51D68;
      v22[1] = (uint64_t (*)())v19;
      v31.receiver = v21;
      v31.super_class = v20;
      id v23 = v4;
      id v24 = a4;
      swift_retain();
      uint64_t v25 = (char *)objc_msgSendSuper2(&v31, sel_init);
      if (!v25)
      {
        __break(1u);
LABEL_19:
        sub_24CA865F0();
        __break(1u);
        JUMPOUT(0x24CA50E0CLL);
      }
      unint64_t v26 = v25;
      PBDataWriterWriteSubgroup();
      uint64_t v27 = *(void **)&v26[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error];
      if (v27)
      {
        id v28 = v27;
        swift_willThrow();
        swift_release();
      }
      else
      {
        swift_release();
      }
      break;
    case 5:
      objc_msgSend(a4, sel_writeFixed32_forTag_, objc_msgSend(v4, sel_readFixed32), a1);
      return;
    default:
      if (qword_26B180878 != -1)
      {
        uint64_t v30 = v10;
        swift_once();
        uint64_t v10 = v30;
      }
      uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_26B181220);
      sub_24CA4CFB0(v14, (uint64_t)v12);
      uint64_t v32 = 0;
      unint64_t v33 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      uint64_t v32 = 0xD000000000000012;
      unint64_t v33 = 0x800000024CA89920;
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA5A180(v32, v33, 0xD000000000000060, 0x800000024CA89800, 0xD000000000000021, 0x800000024CA89960);
      swift_bridgeObjectRelease();
      sub_24CA4D06C((uint64_t)v12);
      sub_24CA5191C();
      swift_allocError();
      *(_DWORD *)uint64_t v29 = a2;
      *(unsigned char *)(v29 + 4) = 0;
      swift_willThrow();
      return;
  }
}

uint64_t sub_24CA50E40(id a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  while (1)
  {
    uint64_t result = (uint64_t)objc_msgSend(a1, sel_hasMoreData);
    if (!result) {
      break;
    }
    unsigned int v9 = 0;
    char v8 = 0;
    objc_msgSend(a1, sel_readTag_type_, &v9, &v8);
    if (objc_msgSend(a1, sel_hasError))
    {
      if (qword_26B180878 != -1) {
        swift_once();
      }
      uint64_t v6 = type metadata accessor for InternalLogger();
      __swift_project_value_buffer(v6, (uint64_t)qword_26B181220);
      sub_24CA5A180(0x2064616572206270, 0xEE002E726F727265, 0xD000000000000060, 0x800000024CA89800, 0xD000000000000016, 0x800000024CA89900);
      sub_24CA5191C();
      swift_allocError();
      *(_DWORD *)uint64_t v7 = 0;
      *(unsigned char *)(v7 + 4) = 1;
      return swift_willThrow();
    }
    uint64_t result = v9;
    if (v9 != a2 || v8 != 4)
    {
      uint64_t result = sub_24CA50914();
      if (!v2) {
        continue;
      }
    }
    return result;
  }
  return result;
}

void sub_24CA51010(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v8 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2)
  {
    case 0:
      uint64_t v11 = (uint64_t)objc_msgSend(v3, sel_readVarInt);
      uint64_t v12 = 0;
      char v13 = 0;
      goto LABEL_20;
    case 1:
      uint64_t v11 = (uint64_t)objc_msgSend(v3, sel_readFixed64);
      char v13 = 0;
      uint64_t v12 = 0x2000000000000000;
      goto LABEL_20;
    case 2:
      id v14 = objc_msgSend(v3, sel_readBytes_, objc_msgSend(v3, sel_readUint32));
      if (!v14)
      {
        __break(1u);
LABEL_27:
        __break(1u);
        JUMPOUT(0x24CA51538);
      }
      id v15 = v14;
      uint64_t v11 = sub_24CA86090();
      uint64_t v17 = v16;

      char v13 = 0;
      uint64_t v12 = v17 | 0x3000000000000000;
      goto LABEL_20;
    case 3:
      id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62230]), sel_init);
      if (!v19) {
        goto LABEL_27;
      }
      uint64_t v20 = v19;
      break;
    case 5:
      unsigned int v24 = objc_msgSend(v3, sel_readFixed32);
      char v13 = 0;
      uint64_t v11 = v24;
      goto LABEL_19;
    default:
      if (qword_26B180878 != -1) {
        swift_once();
      }
      uint64_t v18 = __swift_project_value_buffer(v8, (uint64_t)qword_26B181220);
      sub_24CA4CFB0(v18, (uint64_t)v10);
      uint64_t v28 = 0;
      unint64_t v29 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      uint64_t v28 = 0xD000000000000012;
      unint64_t v29 = 0x800000024CA89920;
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA5A180(v28, v29, 0xD000000000000060, 0x800000024CA89800, 0xD00000000000001FLL, 0x800000024CA89940);
      swift_bridgeObjectRelease();
      sub_24CA4D06C((uint64_t)v10);
      sub_24CA5191C();
      swift_allocError();
      *(_DWORD *)uint64_t v26 = a2;
      *(unsigned char *)(v26 + 4) = 0;
      swift_willThrow();
      return;
  }
  while (objc_msgSend(v3, sel_hasMoreData))
  {
    LODWORD(v28) = 0;
    HIBYTE(v27) = 0;
    objc_msgSend(v3, sel_readTag_type_, &v28, (char *)&v27 + 7);
    if (objc_msgSend(v3, sel_hasError))
    {
      if (qword_26B180878 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v8, (uint64_t)qword_26B181220);
      sub_24CA5A180(0x2064616572206270, 0xEE002E726F727265, 0xD000000000000060, 0x800000024CA89800, 0xD000000000000016, 0x800000024CA89900);
      sub_24CA5191C();
      swift_allocError();
      *(_DWORD *)uint64_t v25 = 0;
      *(unsigned char *)(v25 + 4) = 1;
      swift_willThrow();
LABEL_24:

      return;
    }
    if (v28 == a1 && HIBYTE(v27) == 4) {
      break;
    }
    sub_24CA50914(v28, HIBYTE(v27), HIBYTE(v27), v20);
    if (v4) {
      goto LABEL_24;
    }
  }
  id v21 = objc_msgSend(v20, sel_immutableData);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v11 = sub_24CA86090();
    uint64_t v12 = v23;

    char v13 = 1;
  }
  else
  {

    uint64_t v11 = 0;
    char v13 = 1;
LABEL_19:
    uint64_t v12 = 0x1000000000000000;
  }
LABEL_20:
  *(void *)a3 = v11;
  *(void *)(a3 + 8) = v12;
  *(unsigned char *)(a3 + 16) = v13;
}

uint64_t sub_24CA5156C(uint64_t result, uint64_t a2)
{
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
LABEL_4:
  while (v6)
  {
    unint64_t v8 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v9 = v8 | (v2 << 6);
LABEL_22:
    uint64_t v13 = *(void *)(*(void *)(result + 48) + 8 * v9);
    unint64_t v14 = *(void *)(v13 + 16);
    unint64_t v15 = *(void *)(a2 + 16);
    if (v14)
    {
      if (!v15) {
        return 1;
      }
      if (*(_DWORD *)(v13 + 32) == *(_DWORD *)(a2 + 32))
      {
        uint64_t v16 = (int *)(v13 + 36);
        unint64_t v17 = v15 - 1;
        unint64_t v18 = v14 - 1;
        id v19 = (int *)(a2 + 36);
        while (v18)
        {
          if (!v17) {
            return 1;
          }
          int v21 = *v16++;
          int v20 = v21;
          int v22 = *v19++;
          --v17;
          --v18;
          if (v20 != v22) {
            goto LABEL_4;
          }
        }
        goto LABEL_30;
      }
    }
    else
    {
LABEL_30:
      if (v14 == v15) {
        return 1;
      }
      if (v14 >= v15)
      {
        __break(1u);
        return 1;
      }
    }
  }
  int64_t v10 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    goto LABEL_36;
  }
  if (v10 >= v7) {
    return 0;
  }
  unint64_t v11 = *(void *)(v3 + 8 * v10);
  ++v2;
  if (v11) {
    goto LABEL_21;
  }
  int64_t v2 = v10 + 1;
  if (v10 + 1 >= v7) {
    return 0;
  }
  unint64_t v11 = *(void *)(v3 + 8 * v2);
  if (v11) {
    goto LABEL_21;
  }
  int64_t v2 = v10 + 2;
  if (v10 + 2 >= v7) {
    return 0;
  }
  unint64_t v11 = *(void *)(v3 + 8 * v2);
  if (v11) {
    goto LABEL_21;
  }
  int64_t v2 = v10 + 3;
  if (v10 + 3 >= v7) {
    return 0;
  }
  unint64_t v11 = *(void *)(v3 + 8 * v2);
  if (v11)
  {
LABEL_21:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
    goto LABEL_22;
  }
  int64_t v12 = v10 + 4;
  if (v12 >= v7) {
    return 0;
  }
  unint64_t v11 = *(void *)(v3 + 8 * v12);
  if (v11)
  {
    int64_t v2 = v12;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v2 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v2 >= v7) {
      return 0;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v2);
    ++v12;
    if (v11) {
      goto LABEL_21;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_24CA516E8(unsigned __int8 *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unsigned __int8 v8 = *a1;
  id v9 = objc_allocWithZone(MEMORY[0x263F62228]);
  sub_24CA497DC(a3, a4);
  int64_t v10 = (void *)sub_24CA86080();
  sub_24CA4986C(a3, a4);
  id v11 = objc_msgSend(v9, sel_initWithData_, v10);

  if (v11)
  {
    uint64_t v12 = 0;
    switch(a4 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(a3), a3))
        {
          __break(1u);
LABEL_15:
          __break(1u);
        }
        else
        {
          uint64_t v12 = HIDWORD(a3) - (int)a3;
LABEL_8:
          id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62230]), sel_initWithInitialCapacity_, v12);
          if (v16)
          {
            unint64_t v17 = v16;
            uint64_t v23 = MEMORY[0x263F8EE88];
            a2 = Set<>.optimized(for:)((uint64_t)&v21, a2);
            unsigned __int8 v22 = v8;
            int v21 = 0;
            sub_24CA4F150(&v22, a2, v17, &v21, (uint64_t)&v23, 0, 0);
            if (v4)
            {
              swift_bridgeObjectRelease();

              swift_bridgeObjectRelease();
              return a2;
            }
            swift_bridgeObjectRelease();
            id v18 = objc_msgSend(v17, sel_immutableData);
            if (v18)
            {
              id v19 = v18;
              a2 = sub_24CA86090();

              return a2;
            }
LABEL_17:
            __break(1u);
            JUMPOUT(0x24CA5190CLL);
          }
        }
        __break(1u);
        goto LABEL_17;
      case 2uLL:
        uint64_t v15 = *(void *)(a3 + 16);
        uint64_t v14 = *(void *)(a3 + 24);
        uint64_t v12 = v14 - v15;
        if (!__OFSUB__(v14, v15)) {
          goto LABEL_8;
        }
        goto LABEL_15;
      case 3uLL:
        goto LABEL_8;
      default:
        uint64_t v12 = BYTE6(a4);
        goto LABEL_8;
    }
  }
  sub_24CA5191C();
  swift_allocError();
  *(_DWORD *)uint64_t v13 = 0;
  *(unsigned char *)(v13 + 4) = 1;
  swift_willThrow();
  return a2;
}

unint64_t sub_24CA5191C()
{
  unint64_t result = qword_2698079C0;
  if (!qword_2698079C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698079C0);
  }
  return result;
}

uint64_t destroy for WireValue(uint64_t a1)
{
  return sub_24CA519AC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), sub_24CA4986C);
}

uint64_t sub_24CA519AC(uint64_t result, unint64_t a2, char a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  if (a3) {
    int v4 = 4;
  }
  else {
    int v4 = 0;
  }
  int v5 = (a2 >> 60) & 3 | v4;
  if (v5 != 4)
  {
    if (v5 != 3) {
      return result;
    }
    a2 &= 0xCFFFFFFFFFFFFFFFLL;
  }
  return a4(result, a2);
}

uint64_t _s8Dendrite9WireValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24CA519AC(*(void *)a2, v4, v5, sub_24CA497DC);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for WireValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24CA519AC(*(void *)a2, v4, v5, sub_24CA497DC);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_24CA519AC(v6, v7, v8, sub_24CA4986C);
  return a1;
}

uint64_t assignWithTake for WireValue(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24CA519AC(v4, v5, v6, sub_24CA4986C);
  return a1;
}

uint64_t getEnumTagSinglePayload for WireValue(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3FB && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1019);
  }
  unsigned int v3 = ((*(void *)(a1 + 8) >> 60) & 3 | (4 * *(unsigned __int8 *)(a1 + 16))) ^ 0x3FF;
  if (v3 >= 0x3FA) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for WireValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FA)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 1019;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3FB) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FB) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = (-a2 & 3) << 60;
      *(unsigned char *)(result + 16) = -a2 >> 2;
    }
  }
  return result;
}

uint64_t sub_24CA51BC0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    int v1 = 4;
  }
  else {
    int v1 = 0;
  }
  unsigned int v2 = (*(void *)(a1 + 8) >> 60) & 3 | v1;
  if (v2 <= 4) {
    return v2;
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_24CA51BF0(uint64_t result)
{
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_24CA51C00(uint64_t result, unsigned int a2)
{
  if (a2 < 5)
  {
    *(void *)(result + 8) = *(void *)(result + 8) & 0xCFFFFFFFFFFFFFFFLL | ((unint64_t)(a2 & 3) << 60);
    *(unsigned char *)(result + 16) = (a2 & 4) != 0;
  }
  else
  {
    *(void *)unint64_t result = a2 - 5;
    *(void *)(result + 8) = 0x1000000000000000;
    *(unsigned char *)(result + 16) = 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for WireValue()
{
  return &type metadata for WireValue;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProtoTagTreeOperationError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ProtoTagTreeOperationError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_24CA51CA8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CA51CC4(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProtoTagTreeOperationError()
{
  return &type metadata for ProtoTagTreeOperationError;
}

uint64_t sub_24CA51CF4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

BOOL sub_24CA51D04(int a1, int a2)
{
  return a2 == 4 && *(_DWORD *)(v2 + 16) == a1;
}

uint64_t sub_24CA51D18(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24CA51D28()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CA51D68()
{
  return sub_24CA50E40(*(id *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

uint64_t sub_24CA51D8C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CA4986C(a1, a2);
  }
  return a1;
}

uint64_t sub_24CA51DA0()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t DataFrameStreamTypedIterator.Element.index.getter()
{
  return *v0;
}

uint64_t DataFrameStreamTypedIterator.Element.identifier.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t DataFrameStreamTypedIterator.Element.element.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 40));
}

uint64_t sub_24CA51DFC@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_DWORD *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  uint64_t v7 = a5 + *(int *)(type metadata accessor for DataFrameStreamTypedIterator.Element() + 40);
  char v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32);
  return v8(v7, a3, a4);
}

uint64_t DataFrameStreamTypedIterator.__allocating_init(stream:reversed:ignoreConversionErrors:)(uint64_t a1, char a2, char a3)
{
  uint64_t v6 = swift_allocObject();
  *(unsigned char *)(v6 + 16) = a3;
  type metadata accessor for DataFrameStream.Iterator();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 40) = 0;
  *(void *)(v7 + 48) = 0;
  *(void *)(v7 + 32) = 0;
  *(_DWORD *)(v7 + 56) = 0;
  *(void *)(v7 + 16) = a1;
  *(unsigned char *)(v7 + 24) = a2;
  *(void *)(v6 + 24) = v7;
  return v6;
}

uint64_t DataFrameStreamTypedIterator.init(stream:reversed:ignoreConversionErrors:)(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(v3 + 16) = a3;
  type metadata accessor for DataFrameStream.Iterator();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 40) = 0;
  *(void *)(v6 + 48) = 0;
  *(void *)(v6 + 32) = 0;
  *(_DWORD *)(v6 + 56) = 0;
  *(void *)(v6 + 16) = a1;
  *(unsigned char *)(v6 + 24) = a2;
  *(void *)(v3 + 24) = v6;
  return v3;
}

uint64_t sub_24CA51F60()
{
  return swift_retain();
}

uint64_t sub_24CA51F68@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v33 = *v1;
  uint64_t v2 = *(void *)(v33 + 80);
  uint64_t v29 = sub_24CA86520();
  uint64_t v3 = MEMORY[0x270FA5388](v29);
  unint64_t v5 = (char *)&v24 - v4;
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v25 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unsigned int v24 = (char *)&v24 - v8;
  uint64_t v32 = v1[3];
  uint64_t v26 = v9;
  uint64_t v30 = v1;
  objc_super v31 = (unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  uint64_t v28 = (void (**)(char *, uint64_t))(v10 + 8);
  while (1)
  {
    sub_24CA57684(v34);
    unint64_t v11 = v36;
    uint64_t v12 = *(void *)(v33 + 88);
    if (v36 >> 60 == 15)
    {
LABEL_5:
      uint64_t v17 = type metadata accessor for DataFrameStreamTypedIterator.Element();
      return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v27, 1, 1, v17);
    }
    uint64_t v14 = v34[0];
    uint64_t v13 = v34[1];
    uint64_t v15 = v35;
    id v16 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v12 + 16);
    sub_24CA497DC(v35, v36);
    v16(v15, v11, v2, v12);
    sub_24CA52660(v14, v13, v15, v11);
    if ((*v31)(v5, 1, v2) != 1) {
      break;
    }
    sub_24CA52660(v14, v13, v15, v11);
    (*v28)(v5, v29);
    if ((v30[2] & 1) == 0) {
      goto LABEL_5;
    }
  }
  id v19 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  int v20 = v24;
  v19(v24, v5, v2);
  sub_24CA52660(v14, v13, v15, v11);
  int v21 = v25;
  v19(v25, v20, v2);
  unsigned __int8 v22 = v27;
  _DWORD *v27 = v14;
  *((void *)v22 + 1) = v13;
  uint64_t v23 = type metadata accessor for DataFrameStreamTypedIterator.Element();
  v19((char *)v22 + *(int *)(v23 + 40), v21, v2);
  return (*(uint64_t (**)(_DWORD *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 0, 1, v23);
}

uint64_t DataFrameStreamTypedIterator.deinit()
{
  swift_release();
  return v0;
}

uint64_t DataFrameStreamTypedIterator.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24CA5248C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)v1 + 120))();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24CA524EC()
{
  return 0;
}

uint64_t sub_24CA524F4()
{
  return 2;
}

uint64_t sub_24CA524FC()
{
  type metadata accessor for DataFrameStreamTypedIterator();
  uint64_t v0 = sub_24CA58D70();
  swift_release();
  return v0;
}

void sub_24CA52548()
{
  type metadata accessor for DataFrameStreamTypedIterator();
  JUMPOUT(0x253306080);
}

uint64_t sub_24CA525B4()
{
  return sub_24CA863E0();
}

uint64_t sub_24CA52624@<X0>(_DWORD *a1@<X8>)
{
  return sub_24CA51F68(a1);
}

uint64_t type metadata accessor for DataFrameStreamTypedIterator.Element()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CA52660(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4 >> 60 != 15) {
    return sub_24CA4986C(a3, a4);
  }
  return result;
}

uint64_t sub_24CA5267C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24CA5269C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for DataFrameStreamTypedIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for DataFrameStreamTypedIterator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DataFrameStreamTypedIterator);
}

uint64_t dispatch thunk of DataFrameStreamTypedIterator.__allocating_init(stream:reversed:ignoreConversionErrors:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of DataFrameStreamTypedIterator.makeIterator()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of DataFrameStreamTypedIterator.next()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_24CA52778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_24CA52780()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24CA5282C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v5 + 16) & (unint64_t)~v5) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) > 0x18)
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 & 0xF8 ^ 0x1F8) & (v5 + 16)));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v9 = (void *)(((unint64_t)a1 + 11) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v10 = (void *)(((unint64_t)a2 + 11) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v9 = *v10;
    (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)v9 + v5 + 8) & ~v5, ((unint64_t)v10 + v5 + 8) & ~v5);
  }
  return v3;
}

uint64_t sub_24CA52928(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((((a1 + 11) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
}

_DWORD *sub_24CA5296C(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (void *)(((unint64_t)a1 + 11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (void *)(((unint64_t)a2 + 11) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 16))(((unint64_t)v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_DWORD *sub_24CA529F0(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (void *)(((unint64_t)a1 + 11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (void *)(((unint64_t)a2 + 11) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_DWORD *sub_24CA52A74(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (void *)(((unint64_t)a1 + 11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (void *)(((unint64_t)a2 + 11) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 32))(((unint64_t)v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_DWORD *sub_24CA52AF8(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (void *)(((unint64_t)a1 + 11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (void *)(((unint64_t)a2 + 11) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_24CA52B7C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  uint64_t v8 = ((v6 + 16) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v9 = 8 * v8;
  if (v8 <= 3)
  {
    unsigned int v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (!*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((((unint64_t)a1 + 11) & 0xFFFFFFFFFFFFFFF8)
      }
                                                                      + v6
                                                                      + 8) & ~v6);
      return 0;
    }
  }
  int v10 = *((unsigned __int8 *)a1 + v8);
  if (!*((unsigned char *)a1 + v8)) {
    goto LABEL_19;
  }
LABEL_11:
  int v12 = (v10 - 1) << v9;
  if (v8 > 3) {
    int v12 = 0;
  }
  if (v8)
  {
    if (v8 > 3) {
      LODWORD(v8) = 4;
    }
    switch((int)v8)
    {
      case 2:
        LODWORD(v8) = *a1;
        break;
      case 3:
        LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v8) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v8) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v8 | v12) + 1;
}

void sub_24CA52D00(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  size_t v9 = ((v8 + 16) & ~v8) + *(void *)(v6 + 64);
  BOOL v10 = a3 >= v7;
  unsigned int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v9 <= 3)
    {
      unsigned int v15 = ((v11 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v15))
      {
        int v12 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v15 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v13 = ~v7 + a2;
    if (v9 < 4)
    {
      int v14 = (v13 >> (8 * v9)) + 1;
      if (v9)
      {
        int v16 = v13 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if (v9 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v9 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v13;
      int v14 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v9] = v14;
        return;
      case 2:
        *(_WORD *)&a1[v9] = v14;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v9] = v14;
        return;
      default:
        return;
    }
  }
  switch(v12)
  {
    case 1:
      a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x24CA52F3CLL);
    case 4:
      *(_DWORD *)&a1[v9] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        unint64_t v17 = (((unint64_t)(a1 + 11) & 0xFFFFFFFFFFFFFFF8) + v8 + 8) & ~v8;
        id v18 = *(void (**)(unint64_t))(v6 + 56);
        v18(v17);
      }
      return;
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void *sub_24CA52F94(void *result, uint64_t a2)
{
  v2[5] = a2;
  uint64_t v3 = a2 + 24;
  if (__OFADD__(a2, 24))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v3 < a2)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v4 = result;
  uint64_t v5 = result[4];
  BOOL v6 = result[3] > a2 || v5 < a2;
  if (v6 || v5 < v3) {
    goto LABEL_8;
  }
  uint64_t v7 = result[2] + a2;
  v2[2] = v7;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B17F988);
  uint64_t result = (void *)swift_allocObject();
  result[2] = v7;
  v2[4] = result;
  uint64_t v8 = *(unsigned int *)(v7 + 4);
  BOOL v9 = __OFADD__(v3, v8);
  uint64_t v10 = v3 + v8;
  if (v9) {
    goto LABEL_17;
  }
  if (v10 >= v3)
  {
    if (v5 >= v10)
    {
      uint64_t v11 = v4[2];
      swift_release();
      v2[3] = v11 + v3;
      return v2;
    }
    swift_release();
LABEL_8:
    swift_release();
    type metadata accessor for DataFrameReader();
    swift_deallocPartialClassInstance();
    return 0;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_24CA53098()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DataFrameReader()
{
  return self;
}

uint64_t sub_24CA530F4(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, unsigned char *a5, uint64_t a6, unsigned int a7, uint64_t a8)
{
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(v14 + 16);
  swift_retain();
  BOOL v16 = 0;
  BOOL v17 = 0;
  while (1)
  {
    if (!v17)
    {
      char v18 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(v15 + 8), (unsigned __int8 *)&v18, 1u, memory_order_relaxed, memory_order_relaxed);
      BOOL v17 = v18 == 0;
      goto LABEL_3;
    }
    if (v16) {
      break;
    }
    BOOL v17 = 1;
LABEL_3:
    BOOL v16 = *(unsigned char *)(v15 + 9) == 0;
  }
  *(unsigned char *)(v15 + 8) = 2;
  uint64_t v19 = sub_24CA6F4F4(*(unsigned char **)(a1 + 24), *(unsigned int *)(*(void *)(v14 + 16) + 4));
  unint64_t v21 = v20;
  swift_retain();
  sub_24CA6E208(v19, v21, a2, a3, a4, a5, a6, a7, a8);
  sub_24CA4986C(v19, v21);
  *(unsigned char *)(v15 + 8) = 0;
  swift_release();
  sub_24CA5355C(a6);
  swift_release();
  return 1;
}

uint64_t sub_24CA53238(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, unsigned char *a5, uint64_t (*a6)(uint64_t, unint64_t), uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
  BOOL v14 = 0;
  BOOL v15 = 0;
  uint64_t v16 = *(void *)(a1 + 32);
  for (i = *(void *)(v16 + 16); ; BOOL v14 = *(unsigned char *)(i + 9) == 0)
  {
    if (!v15)
    {
      char v18 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(i + 8), (unsigned __int8 *)&v18, 1u, memory_order_relaxed, memory_order_relaxed);
      BOOL v15 = v18 == 0;
      continue;
    }
    if (v14) {
      break;
    }
    BOOL v15 = 1;
  }
  *(unsigned char *)(i + 8) = 2;
  uint64_t v19 = sub_24CA6F4F4(*(unsigned char **)(a1 + 24), *(unsigned int *)(*(void *)(v16 + 16) + 4));
  unint64_t v21 = v20;
  sub_24CA6E8A0(v19, v20, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  sub_24CA4986C(v19, v21);
  *(unsigned char *)(i + 8) = 0;
  return 1;
}

uint64_t sub_24CA5334C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned char *a5, uint64_t a6, unsigned int a7, unint64_t *a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 16);
  swift_retain();
  sub_24CA497DC(a10, a11);
  BOOL v17 = 0;
  BOOL v18 = 0;
  while (1)
  {
    if (!v18)
    {
      char v19 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(v16 + 8), (unsigned __int8 *)&v19, 1u, memory_order_relaxed, memory_order_relaxed);
      BOOL v18 = v19 == 0;
      goto LABEL_3;
    }
    if (v17) {
      break;
    }
    BOOL v18 = 1;
LABEL_3:
    BOOL v17 = *(unsigned char *)(v16 + 9) == 0;
  }
  *(unsigned char *)(v16 + 8) = 2;
  swift_retain();
  sub_24CA497DC(a10, a11);
  sub_24CA6F5A8(a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  sub_24CA4986C(a10, a11);
  swift_release();
  *(unsigned char *)(v16 + 8) = 0;
  swift_release();
  sub_24CA4986C(a3, a4);
  sub_24CA5355C(a6);
  swift_release();
  return sub_24CA4986C(a10, a11);
}

unint64_t sub_24CA534AC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned char *a5, uint64_t (*a6)(void), uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
  BOOL v10 = 0;
  BOOL v11 = 0;
  for (i = *(void *)(*(void *)(a1 + 32) + 16); ; BOOL v10 = *(unsigned char *)(i + 9) == 0)
  {
    if (!v11)
    {
      char v13 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(i + 8), (unsigned __int8 *)&v13, 1u, memory_order_relaxed, memory_order_relaxed);
      BOOL v11 = v13 == 0;
      continue;
    }
    if (v10) {
      break;
    }
    BOOL v11 = 1;
  }
  *(unsigned char *)(i + 8) = 2;
  unint64_t result = sub_24CA6EE8C(a2, a3, a4, a5, a6, a7, a8, a9, a10);
  *(unsigned char *)(i + 8) = 0;
  return result;
}

uint64_t sub_24CA5355C(uint64_t a1)
{
  return a1;
}

void **sub_24CA535AC(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    BOOL v9 = (char *)a1 + v8;
    BOOL v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24CA86020();
    int v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    char v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = *(int *)(type metadata accessor for StorageContainer() + 20);
    BOOL v15 = *(void **)&v10[v14];
    *(void *)&v9[v14] = v15;
    uint64_t v16 = *(int *)(a3 + 24);
    BOOL v17 = (char *)v7 + v16;
    BOOL v18 = (char *)a2 + v16;
    v17[4] = v18[4];
    *(_DWORD *)BOOL v17 = *(_DWORD *)v18;
    id v19 = v15;
  }
  return v7;
}

void sub_24CA536D0(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24CA86020();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  BOOL v6 = *(void **)&v4[*(int *)(type metadata accessor for StorageContainer() + 20)];
}

void **sub_24CA5375C(void **a1, void **a2, uint64_t a3)
{
  BOOL v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  BOOL v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24CA86020();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = *(int *)(type metadata accessor for StorageContainer() + 20);
  uint64_t v14 = *(void **)&v9[v13];
  *(void *)&v8[v13] = v14;
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (char *)a1 + v15;
  BOOL v17 = (char *)a2 + v15;
  v16[4] = v17[4];
  *(_DWORD *)uint64_t v16 = *(_DWORD *)v17;
  id v18 = v14;
  return a1;
}

void **sub_24CA53834(void **a1, void **a2, uint64_t a3)
{
  BOOL v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_24CA86020();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = *(int *)(type metadata accessor for StorageContainer() + 20);
  uint64_t v14 = *(void **)&v11[v13];
  uint64_t v15 = *(void **)&v10[v13];
  *(void *)&v10[v13] = v14;
  id v16 = v14;

  uint64_t v17 = *(int *)(a3 + 24);
  id v18 = (char *)a1 + v17;
  id v19 = (char *)a2 + v17;
  int v20 = *(_DWORD *)v19;
  v18[4] = v19[4];
  *(_DWORD *)id v18 = v20;
  return a1;
}

void *sub_24CA53908(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24CA86020();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = type metadata accessor for StorageContainer();
  *(void *)&v7[*(int *)(v10 + 20)] = *(void *)&v8[*(int *)(v10 + 20)];
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  v12[4] = v13[4];
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  return a1;
}

void **sub_24CA539C4(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24CA86020();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(type metadata accessor for StorageContainer() + 20);
  uint64_t v12 = *(void **)&v8[v11];
  *(void *)&v8[v11] = *(void *)&v9[v11];

  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(_DWORD *)uint64_t v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  return a1;
}

uint64_t sub_24CA53A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CA53AA4);
}

uint64_t sub_24CA53AA4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for StorageContainer();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24CA53B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CA53B68);
}

void *sub_24CA53B68(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for StorageContainer();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for DataFrameStreamContainer()
{
  uint64_t result = qword_26B180C50;
  if (!qword_26B180C50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA53C5C()
{
  uint64_t result = type metadata accessor for StorageContainer();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CA53D00()
{
  v60[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_24CA85F80();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CA86020();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v53 - v10;
  uint64_t v12 = *(int *)(type metadata accessor for DataFrameStreamContainer() + 24);
  uint64_t v13 = *(unsigned int *)(v0 + v12);
  uint64_t v14 = v13 | ((uint64_t)*(char *)(v0 + v12 + 4) << 32);
  if ((v14 & 0x8000000000000000) == 0) {
    return v13;
  }
  uint64_t v55 = v9;
  v56 = v11;
  uint64_t v53 = v12;
  uint64_t v54 = v6;
  uint64_t v57 = v5;
  uint64_t v58 = v13;
  type metadata accessor for StorageContainer();
  if (!_s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0())
  {
    uint64_t v13 = v58;
    if ((v14 & 0x100000000) != 0)
    {
      sub_24CA56D20();
      swift_allocError();
      unsigned char *v27 = 1;
      swift_willThrow();
    }
    return v13;
  }
  uint64_t v15 = v0;
  v60[0] = 0x6769666E6F63;
  v60[1] = 0xE600000000000000;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F06E50], v1);
  sub_24CA4D0C8();
  id v16 = v56;
  sub_24CA86010();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(self, sel_defaultManager);
  LOBYTE(v60[0]) = 0;
  sub_24CA86000();
  id v18 = (void *)sub_24CA86230();
  swift_bridgeObjectRelease();
  unsigned int v19 = objc_msgSend(v17, sel_fileExistsAtPath_isDirectory_, v18, v60);

  if (v19)
  {
    LODWORD(v21) = v58;
    uint64_t v20 = v59;
    unsigned __int8 v22 = v55;
    if ((v60[0] & 1) == 0)
    {
      uint64_t v23 = sub_24CA86030();
      if (!v20)
      {
        uint64_t v25 = v23;
        unint64_t v26 = v24;
        sub_24CA85EA0();
        swift_allocObject();
        sub_24CA85E90();
        sub_24CA56DC8();
        sub_24CA85E80();
        swift_release();
        sub_24CA4986C(v25, v26);
        if ((v14 & 0x100000000) != 0 || LODWORD(v60[0]) == v58)
        {
          uint64_t v44 = *(void (**)(char *, uint64_t))(v54 + 8);
          uint64_t v58 = LODWORD(v60[0]);
        }
        else
        {
          uint64_t v41 = v15;
          uint64_t v42 = v55;
          sub_24CA85FF0();
          char v43 = _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0();
          uint64_t v44 = *(void (**)(char *, uint64_t))(v54 + 8);
          uint64_t v45 = v42;
          uint64_t v46 = v16;
          uint64_t v47 = v57;
          v44(v45, v57);
          if ((v43 & 1) == 0)
          {
            sub_24CA56D20();
            swift_allocError();
            *unint64_t v49 = 0;
            swift_willThrow();
            v44(v46, v47);
            return v13;
          }
          sub_24CA85ED0();
          swift_allocObject();
          sub_24CA85EC0();
          LODWORD(v60[0]) = v58;
          sub_24CA56D74();
          uint64_t v50 = sub_24CA85EB0();
          unint64_t v52 = v51;
          swift_release();
          id v16 = v56;
          sub_24CA860A0();
          sub_24CA4986C(v50, v52);
          uint64_t v15 = v41;
        }
        v44(v16, v57);
        goto LABEL_27;
      }
      (*(void (**)(char *, uint64_t))(v54 + 8))(v16, v57);
      return v13;
    }
  }
  else
  {
    LODWORD(v21) = v58;
    uint64_t v20 = v59;
    unsigned __int8 v22 = v55;
  }
  uint64_t v59 = v15;
  if ((v14 & 0x100000000) != 0) {
    uint64_t v21 = 0x100000;
  }
  else {
    uint64_t v21 = v21;
  }
  sub_24CA85FF0();
  char v28 = _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v54 + 8);
  uint64_t v30 = v16;
  uint64_t v31 = v57;
  v29(v22, v57);
  if (v28)
  {
    sub_24CA85ED0();
    swift_allocObject();
    sub_24CA85EC0();
    LODWORD(v60[0]) = v21;
    sub_24CA56D74();
    uint64_t v32 = sub_24CA85EB0();
    if (!v20)
    {
      uint64_t v35 = v32;
      unint64_t v36 = v33;
      uint64_t v58 = v21;
      swift_release();
      uint64_t v37 = v56;
      sub_24CA860A0();
      sub_24CA4986C(v35, v36);
      v29(v37, v57);
      uint64_t v15 = v59;
LABEL_27:
      uint64_t v48 = v15 + v53;
      *(unsigned char *)(v48 + 4) = 0;
      uint64_t v13 = v58;
      *(_DWORD *)uint64_t v48 = v58;
      return v13;
    }
    swift_release();
    uint64_t v38 = v56;
    uint64_t v39 = v57;
  }
  else
  {
    sub_24CA56D20();
    swift_allocError();
    unsigned char *v34 = 0;
    swift_willThrow();
    uint64_t v38 = v30;
    uint64_t v39 = v31;
  }
  v29(v38, v39);
  return v13;
}

void sub_24CA543E4(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24CA85F80();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DataFrameStreamContainer();
  v9[0] = 47;
  v9[1] = 0xE100000000000000;
  sub_24CA86320();
  sub_24CA86320();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F06E50], v3);
  sub_24CA4D0C8();
  sub_24CA86010();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  static Storage.ensureFileExists(fileURL:)((unsigned __int8 *)v9);
  if (v1) {
    goto LABEL_5;
  }
  if (LOBYTE(v9[0]) != 2 && (v9[0] & 1) == 0)
  {
    sub_24CA56E20();
    swift_allocError();
    *(void *)uint64_t v7 = 0;
    *(void *)(v7 + 8) = 0;
    *(unsigned char *)(v7 + 16) = 2;
    swift_willThrow();
LABEL_5:
    uint64_t v8 = sub_24CA86020();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  }
}

void *sub_24CA54600()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180870);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24CA86020();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  type metadata accessor for DataFrameStreamContainer();
  sub_24CA75B48();
  uint64_t v12 = v10;
  uint64_t v37 = v9;
  uint64_t v30 = v7;
  if (!v10) {
    return 0;
  }
  uint64_t v28 = 0;
  uint64_t v39 = (void *)MEMORY[0x263F8EE78];
  uint64_t v36 = *(void *)(v10 + 16);
  if (v36)
  {
    unint64_t v13 = 0;
    uint64_t v32 = v2;
    uint64_t v33 = v4 + 48;
    uint64_t v38 = (void (**)(char *, char *, uint64_t))(v4 + 32);
    uint64_t v29 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v34 = v4 + 56;
    uint64_t v35 = v4 + 16;
    unint64_t v27 = (v4 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v14 = v30;
    uint64_t v15 = v37;
    uint64_t v31 = v10;
    while (1)
    {
      if (v13 >= *(void *)(v12 + 16))
      {
        __break(1u);
        goto LABEL_24;
      }
      unint64_t v16 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      uint64_t v17 = *(void *)(v4 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v2, v12 + v16 + v17 * v13, v3);
      id v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
      v18(v2, 0, 1, v3);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
        goto LABEL_21;
      }
      unsigned int v19 = *v38;
      (*v38)(v15, v2, v3);
      if (sub_24CA85F90() == 0x746E656D676573 && v20 == 0xE700000000000000) {
        break;
      }
      char v21 = sub_24CA866A0();
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_14;
      }
      uint64_t v15 = v37;
      (*v29)(v37, v3);
LABEL_7:
      ++v13;
      uint64_t v12 = v31;
      uint64_t v2 = v32;
      if (v36 == v13) {
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
LABEL_14:
    v19(v14, v37, v3);
    unsigned __int8 v22 = v39;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_24CA74788(0, v22[2] + 1, 1);
      unsigned __int8 v22 = v39;
    }
    unint64_t v24 = v22[2];
    unint64_t v23 = v22[3];
    if (v24 >= v23 >> 1)
    {
      sub_24CA74788(v23 > 1, v24 + 1, 1);
      unsigned __int8 v22 = v39;
    }
    v22[2] = v24 + 1;
    uint64_t v25 = (char *)v22 + v16 + v24 * v17;
    uint64_t v14 = v30;
    v19(v25, v30, v3);
    uint64_t v39 = v22;
    uint64_t v15 = v37;
    goto LABEL_7;
  }
  id v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
LABEL_20:
  v18(v2, 1, 1, v3);
LABEL_21:
  swift_bridgeObjectRelease();
  sub_24CA4D98C((uint64_t)v2);
  swift_retain();
  uint64_t v26 = v28;
  sub_24CA5521C(&v39);
  if (v26)
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    __break(1u);
  }
  else
  {
    swift_release();
    return v39;
  }
  return result;
}

void *sub_24CA54A18()
{
  uint64_t v0 = sub_24CA86020();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v35 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v34 = (char *)v25 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180870);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24CA54600();
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8[2];
  if (v9)
  {
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    uint64_t v10 = v1 + 16;
    uint64_t v33 = v11;
    uint64_t v12 = (char *)v8 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
    uint64_t v13 = *(void *)(v10 + 56);
    uint64_t v31 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 32);
    unint64_t v27 = (void (**)(char *, char *, uint64_t))(v10 + 16);
    uint64_t v28 = v13;
    v25[2] = v8;
    uint64_t v26 = (void (**)(char *, uint64_t))(v10 - 8);
    uint64_t v14 = (void *)MEMORY[0x263F8EE78];
    uint64_t v32 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 40);
    v25[1] = (v10 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v29 = v7;
    uint64_t v30 = v10;
    uint64_t v15 = v34;
    while (1)
    {
      v33(v7, v12, v0);
      unint64_t v16 = *v32;
      (*v32)(v7, 0, 1, v0);
      if ((*v31)(v7, 1, v0) == 1) {
        break;
      }
      (*v27)(v15, v7, v0);
      uint64_t v17 = v35;
      sub_24CA85FE0();
      uint64_t v36 = sub_24CA85FC0();
      uint64_t v19 = v18;
      uint64_t v20 = *v26;
      (*v26)(v17, v0);
      v20(v15, v0);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = sub_24CA82720(0, v14[2] + 1, 1, v14);
      }
      unint64_t v22 = v14[2];
      unint64_t v21 = v14[3];
      if (v22 >= v21 >> 1) {
        uint64_t v14 = sub_24CA82720((void *)(v21 > 1), v22 + 1, 1, v14);
      }
      v14[2] = v22 + 1;
      unint64_t v23 = &v14[2 * v22];
      v23[4] = v36;
      v23[5] = v19;
      uint64_t v7 = v29;
      v12 += v28;
      if (!--v9)
      {
        v16(v29, 1, 1, v0);
        break;
      }
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x263F8EE78];
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v7, 1, 1, v0);
  }
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_24CA54D50()
{
  uint64_t v1 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CA85F80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_24CA86020();
  uint64_t v8 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DataFrameStreamContainer();
  uint64_t v28 = 1801678700;
  unint64_t v29 = 0xE400000000000000;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06E50], v4);
  sub_24CA4D0C8();
  sub_24CA86010();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v11 = v5 + 8;
  v12(v7, v4);
  swift_bridgeObjectRelease();
  uint64_t v13 = *v0;
  sub_24CA86000();
  uint64_t v14 = (void *)sub_24CA86230();
  swift_bridgeObjectRelease();
  unsigned __int8 v15 = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  if ((v15 & 1) == 0)
  {
    sub_24CA86000();
    uint64_t v17 = (void *)sub_24CA86230();
    swift_bridgeObjectRelease();
    unsigned __int8 v18 = objc_msgSend(v13, sel_createFileAtPath_contents_attributes_, v17, 0, 0);

    if ((v18 & 1) == 0)
    {
      if (qword_26B180878 != -1) {
        swift_once();
      }
      uint64_t v22 = __swift_project_value_buffer(v1, (uint64_t)qword_26B181220);
      sub_24CA4CFB0(v22, (uint64_t)v3);
      uint64_t v28 = 0;
      unint64_t v29 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      uint64_t v28 = 0xD00000000000001FLL;
      unint64_t v29 = 0x800000024CA89C40;
      sub_24CA86000();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA5A180(v28, v29, 0xD00000000000006BLL, 0x800000024CA89C60, 0xD000000000000015, 0x800000024CA89CD0);
      swift_bridgeObjectRelease();
      sub_24CA4D06C((uint64_t)v3);
      uint64_t v23 = sub_24CA86000();
      uint64_t v11 = v24;
      sub_24CA56E20();
      swift_allocError();
      *(void *)uint64_t v25 = v23;
      *(void *)(v25 + 8) = v11;
      *(unsigned char *)(v25 + 16) = 0;
      swift_willThrow();
      goto LABEL_11;
    }
  }
  if (qword_26B1808C8 != -1) {
    uint64_t v16 = swift_once();
  }
  uint64_t v19 = qword_26B181238;
  MEMORY[0x270FA5388](v16);
  v27[-2] = v10;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v19 + 24));
  uint64_t v20 = v27[1];
  sub_24CA56E74((uint64_t *)(v19 + 16), &v28);
  unint64_t v21 = (os_unfair_lock_s *)(v19 + 24);
  if (v20)
  {
    os_unfair_lock_unlock(v21);
    swift_release();
LABEL_11:
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v30);
    return v11;
  }
  os_unfair_lock_unlock(v21);
  uint64_t v11 = v28;
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v30);
  return v11;
}

uint64_t sub_24CA5521C(void **a1)
{
  uint64_t v2 = *(void *)(sub_24CA86020() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_24CA56D0C(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_24CA552C4(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_24CA552C4(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24CA86020();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v153 = (char *)&v145 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v165 = (char *)&v145 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v168 = (char *)&v145 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v167 = (char *)&v145 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v148 = (char *)&v145 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v155 = (char *)&v145 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v151 = (char *)&v145 - v19;
  MEMORY[0x270FA5388](v18);
  v150 = (char *)&v145 - v20;
  v170 = a1;
  uint64_t v21 = a1[1];
  uint64_t result = sub_24CA86670();
  if (result >= v21)
  {
    if (v21 < 0) {
      goto LABEL_151;
    }
    if (v21) {
      return sub_24CA55FD8(0, v21, 1, v170);
    }
    return result;
  }
  if (v21 >= 0) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = v21 + 1;
  }
  if (v21 < -1) {
    goto LABEL_159;
  }
  uint64_t v146 = result;
  if (v21 < 2)
  {
    uint64_t v26 = v5;
    uint64_t v28 = (char *)MEMORY[0x263F8EE78];
    unint64_t v156 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v145 = MEMORY[0x263F8EE78];
    if (v21 != 1)
    {
      unint64_t v30 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_117:
      if (v30 >= 2)
      {
        uint64_t v136 = *v170;
        do
        {
          unint64_t v137 = v30 - 2;
          if (v30 < 2) {
            goto LABEL_146;
          }
          if (!v136) {
            goto LABEL_158;
          }
          v138 = v28;
          v139 = v28 + 32;
          uint64_t v140 = *(void *)&v28[16 * v137 + 32];
          uint64_t v141 = *(void *)&v28[16 * v30 + 24];
          uint64_t v142 = v26;
          sub_24CA56324(v136 + *(void *)(v26 + 72) * v140, v136 + *(void *)(v26 + 72) * *(void *)&v139[16 * v30 - 16], v136 + *(void *)(v26 + 72) * v141, v156);
          if (v2) {
            break;
          }
          if (v141 < v140) {
            goto LABEL_147;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v138 = sub_24CA56CE4((uint64_t)v138);
          }
          if (v137 >= *((void *)v138 + 2)) {
            goto LABEL_148;
          }
          v143 = &v138[16 * v137 + 32];
          *(void *)v143 = v140;
          *((void *)v143 + 1) = v141;
          unint64_t v144 = *((void *)v138 + 2);
          if (v30 > v144) {
            goto LABEL_149;
          }
          uint64_t v28 = v138;
          memmove(&v138[16 * v30 + 16], &v138[16 * v30 + 32], 16 * (v144 - v30));
          *((void *)v138 + 2) = v144 - 1;
          unint64_t v30 = v144 - 1;
          uint64_t v26 = v142;
        }
        while (v144 > 2);
      }
LABEL_128:
      swift_bridgeObjectRelease();
      *(void *)(v145 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v24 = v23 >> 1;
    uint64_t v25 = sub_24CA86420();
    *(void *)(v25 + 16) = v24;
    uint64_t v26 = v5;
    unint64_t v27 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v145 = v25;
    unint64_t v156 = v25 + v27;
  }
  uint64_t v29 = 0;
  uint64_t v161 = v26 + 16;
  v162 = (void (**)(char *, uint64_t))(v26 + 8);
  v166 = (char **)(v26 + 32);
  uint64_t v28 = (char *)MEMORY[0x263F8EE78];
  uint64_t v157 = v26;
  uint64_t v164 = v4;
  while (1)
  {
    uint64_t v31 = v29;
    uint64_t v32 = v29 + 1;
    uint64_t v154 = v29;
    if (v29 + 1 >= v21)
    {
      uint64_t v40 = v29 + 1;
      goto LABEL_69;
    }
    uint64_t v163 = v21;
    v149 = v28;
    uint64_t v33 = *v170;
    uint64_t v34 = *(void *)(v26 + 72);
    uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
    v35(v150, *v170 + v34 * v32, v4);
    v158 = (char *)v33;
    uint64_t v169 = v34;
    v35(v151, v33 + v34 * v31, v4);
    uint64_t v36 = sub_24CA85FC0();
    uint64_t v38 = v37;
    if (v36 != sub_24CA85FC0()) {
      goto LABEL_20;
    }
    if (v38 == v39) {
      LODWORD(v160) = 0;
    }
    else {
LABEL_20:
    }
      LODWORD(v160) = sub_24CA866A0();
    uint64_t v41 = v148;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v42 = *v162;
    uint64_t v43 = v164;
    (*v162)(v151, v164);
    v42(v150, v43);
    uint64_t v40 = v154 + 2;
    if (v154 + 2 >= v163)
    {
      uint64_t v55 = v157;
    }
    else
    {
      uint64_t v147 = v2;
      uint64_t v159 = v169 * v32;
      uint64_t v44 = v158;
      uint64_t v45 = v169 * v40;
      while (1)
      {
        uint64_t v46 = v40;
        uint64_t v47 = v164;
        v35(v155, (uint64_t)&v44[v45], v164);
        v35(v41, (uint64_t)&v44[v159], v47);
        uint64_t v48 = sub_24CA85FC0();
        uint64_t v50 = v49;
        if (v48 == sub_24CA85FC0() && v50 == v51) {
          int v52 = 0;
        }
        else {
          int v52 = sub_24CA866A0();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v53 = v164;
        v42(v41, v164);
        v42(v155, v53);
        if ((v160 ^ v52)) {
          break;
        }
        uint64_t v40 = v46 + 1;
        v44 += v169;
        if (v163 == v46 + 1)
        {
          uint64_t v54 = v163;
          uint64_t v40 = v163;
          uint64_t v2 = v147;
          uint64_t v55 = v157;
          goto LABEL_33;
        }
      }
      uint64_t v2 = v147;
      uint64_t v55 = v157;
      uint64_t v40 = v46;
    }
    uint64_t v54 = v163;
LABEL_33:
    uint64_t v28 = v149;
    uint64_t v31 = v154;
    v56 = v158;
    if ((v160 & 1) == 0) {
      break;
    }
    if (v40 < v154) {
      goto LABEL_152;
    }
    if (v154 >= v40) {
      break;
    }
    uint64_t v147 = v2;
    uint64_t v57 = 0;
    uint64_t v58 = v169 * (v40 - 1);
    uint64_t v59 = v40 * v169;
    uint64_t v60 = v154;
    uint64_t v61 = v154 * v169;
    do
    {
      if (v60 != v40 + v57 - 1)
      {
        if (!v56) {
          goto LABEL_157;
        }
        char v63 = &v56[v58];
        v160 = *v166;
        ((void (*)(char *, char *, uint64_t))v160)(v153, &v56[v61], v164);
        if (v61 < v58 || &v56[v61] >= &v56[v59])
        {
          uint64_t v62 = v164;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v62 = v164;
          if (v61 != v58) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        ((void (*)(char *, char *, uint64_t))v160)(v63, v153, v62);
        uint64_t v55 = v157;
        v56 = v158;
      }
      ++v60;
      --v57;
      v58 -= v169;
      v59 -= v169;
      v61 += v169;
    }
    while (v60 < v40 + v57);
    uint64_t v2 = v147;
    uint64_t v54 = v163;
    uint64_t v64 = v164;
    uint64_t v28 = v149;
    uint64_t v31 = v154;
    if (v40 < v163) {
      goto LABEL_49;
    }
LABEL_69:
    if (v40 < v31) {
      goto LABEL_145;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v28 = sub_24CA569EC(0, *((void *)v28 + 2) + 1, 1, v28);
    }
    unint64_t v85 = *((void *)v28 + 2);
    unint64_t v84 = *((void *)v28 + 3);
    unint64_t v30 = v85 + 1;
    uint64_t v26 = v157;
    uint64_t v163 = v40;
    if (v85 >= v84 >> 1)
    {
      v135 = sub_24CA569EC((char *)(v84 > 1), v85 + 1, 1, v28);
      uint64_t v26 = v157;
      uint64_t v28 = v135;
    }
    *((void *)v28 + 2) = v30;
    v86 = v28 + 32;
    v87 = &v28[16 * v85 + 32];
    uint64_t v88 = v163;
    *(void *)v87 = v31;
    *((void *)v87 + 1) = v88;
    if (v85)
    {
      while (1)
      {
        unint64_t v89 = v30 - 1;
        if (v30 >= 4)
        {
          v94 = &v86[16 * v30];
          uint64_t v95 = *((void *)v94 - 8);
          uint64_t v96 = *((void *)v94 - 7);
          BOOL v100 = __OFSUB__(v96, v95);
          uint64_t v97 = v96 - v95;
          if (v100) {
            goto LABEL_134;
          }
          uint64_t v99 = *((void *)v94 - 6);
          uint64_t v98 = *((void *)v94 - 5);
          BOOL v100 = __OFSUB__(v98, v99);
          uint64_t v92 = v98 - v99;
          char v93 = v100;
          if (v100) {
            goto LABEL_135;
          }
          unint64_t v101 = v30 - 2;
          v102 = &v86[16 * v30 - 32];
          uint64_t v104 = *(void *)v102;
          uint64_t v103 = *((void *)v102 + 1);
          BOOL v100 = __OFSUB__(v103, v104);
          uint64_t v105 = v103 - v104;
          if (v100) {
            goto LABEL_137;
          }
          BOOL v100 = __OFADD__(v92, v105);
          uint64_t v106 = v92 + v105;
          if (v100) {
            goto LABEL_140;
          }
          if (v106 >= v97)
          {
            v124 = &v86[16 * v89];
            uint64_t v126 = *(void *)v124;
            uint64_t v125 = *((void *)v124 + 1);
            BOOL v100 = __OFSUB__(v125, v126);
            uint64_t v127 = v125 - v126;
            if (v100) {
              goto LABEL_144;
            }
            BOOL v117 = v92 < v127;
            goto LABEL_106;
          }
        }
        else
        {
          if (v30 != 3)
          {
            uint64_t v118 = *((void *)v28 + 4);
            uint64_t v119 = *((void *)v28 + 5);
            BOOL v100 = __OFSUB__(v119, v118);
            uint64_t v111 = v119 - v118;
            char v112 = v100;
            goto LABEL_100;
          }
          uint64_t v91 = *((void *)v28 + 4);
          uint64_t v90 = *((void *)v28 + 5);
          BOOL v100 = __OFSUB__(v90, v91);
          uint64_t v92 = v90 - v91;
          char v93 = v100;
        }
        if (v93) {
          goto LABEL_136;
        }
        unint64_t v101 = v30 - 2;
        v107 = &v86[16 * v30 - 32];
        uint64_t v109 = *(void *)v107;
        uint64_t v108 = *((void *)v107 + 1);
        BOOL v110 = __OFSUB__(v108, v109);
        uint64_t v111 = v108 - v109;
        char v112 = v110;
        if (v110) {
          goto LABEL_139;
        }
        v113 = &v86[16 * v89];
        uint64_t v115 = *(void *)v113;
        uint64_t v114 = *((void *)v113 + 1);
        BOOL v100 = __OFSUB__(v114, v115);
        uint64_t v116 = v114 - v115;
        if (v100) {
          goto LABEL_142;
        }
        if (__OFADD__(v111, v116)) {
          goto LABEL_143;
        }
        if (v111 + v116 >= v92)
        {
          BOOL v117 = v92 < v116;
LABEL_106:
          if (v117) {
            unint64_t v89 = v101;
          }
          goto LABEL_108;
        }
LABEL_100:
        if (v112) {
          goto LABEL_138;
        }
        v120 = &v86[16 * v89];
        uint64_t v122 = *(void *)v120;
        uint64_t v121 = *((void *)v120 + 1);
        BOOL v100 = __OFSUB__(v121, v122);
        uint64_t v123 = v121 - v122;
        if (v100) {
          goto LABEL_141;
        }
        if (v123 < v111) {
          goto LABEL_14;
        }
LABEL_108:
        unint64_t v128 = v89 - 1;
        if (v89 - 1 >= v30)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
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
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!*v170) {
          goto LABEL_156;
        }
        v129 = v28;
        v130 = &v86[16 * v128];
        uint64_t v131 = *(void *)v130;
        v132 = &v86[16 * v89];
        uint64_t v133 = *((void *)v132 + 1);
        sub_24CA56324(*v170 + *(void *)(v26 + 72) * *(void *)v130, *v170 + *(void *)(v26 + 72) * *(void *)v132, *v170 + *(void *)(v26 + 72) * v133, v156);
        if (v2) {
          goto LABEL_128;
        }
        if (v133 < v131) {
          goto LABEL_131;
        }
        if (v89 > *((void *)v129 + 2)) {
          goto LABEL_132;
        }
        *(void *)v130 = v131;
        *(void *)&v86[16 * v128 + 8] = v133;
        unint64_t v134 = *((void *)v129 + 2);
        if (v89 >= v134) {
          goto LABEL_133;
        }
        uint64_t v28 = v129;
        unint64_t v30 = v134 - 1;
        memmove(&v86[16 * v89], v132 + 16, 16 * (v134 - 1 - v89));
        *((void *)v129 + 2) = v134 - 1;
        uint64_t v26 = v157;
        if (v134 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v30 = 1;
LABEL_14:
    uint64_t v21 = v170[1];
    uint64_t v29 = v163;
    uint64_t v4 = v164;
    if (v163 >= v21) {
      goto LABEL_117;
    }
  }
  uint64_t v64 = v164;
  if (v40 >= v54) {
    goto LABEL_69;
  }
LABEL_49:
  if (__OFSUB__(v40, v31)) {
    goto LABEL_150;
  }
  if (v40 - v31 >= v146) {
    goto LABEL_69;
  }
  if (__OFADD__(v31, v146)) {
    goto LABEL_153;
  }
  if (v31 + v146 >= v54) {
    uint64_t v65 = v54;
  }
  else {
    uint64_t v65 = v31 + v146;
  }
  if (v65 >= v31)
  {
    if (v40 != v65)
    {
      v149 = v28;
      uint64_t v147 = v2;
      uint64_t v66 = *(void *)(v55 + 72);
      v158 = *(char **)(v55 + 16);
      uint64_t v159 = v66;
      uint64_t v169 = v66 * (v40 - 1);
      unint64_t v67 = (char *)(v40 * v66);
      uint64_t v152 = v65;
      do
      {
        uint64_t v70 = 0;
        uint64_t v71 = v31;
        uint64_t v163 = v40;
        v160 = v67;
        while (1)
        {
          uint64_t v72 = *v170;
          uint64_t v73 = (uint64_t)&v67[v70 + *v170];
          v74 = v158;
          ((void (*)(char *, uint64_t, uint64_t))v158)(v167, v73, v64);
          ((void (*)(char *, uint64_t, uint64_t))v74)(v168, v169 + v70 + v72, v64);
          uint64_t v75 = sub_24CA85FC0();
          uint64_t v77 = v76;
          if (v75 == sub_24CA85FC0() && v77 == v78) {
            break;
          }
          char v79 = sub_24CA866A0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v80 = *v162;
          uint64_t v64 = v164;
          (*v162)(v168, v164);
          v80(v167, v64);
          if ((v79 & 1) == 0) {
            goto LABEL_59;
          }
          uint64_t v81 = *v170;
          unint64_t v67 = v160;
          if (!*v170) {
            goto LABEL_155;
          }
          uint64_t v82 = v81 + v169 + v70;
          v83 = *v166;
          ((void (*)(char *, char *, uint64_t))*v166)(v165, &v160[v81 + v70], v64);
          swift_arrayInitWithTakeFrontToBack();
          ((void (*)(uint64_t, char *, uint64_t))v83)(v82, v165, v64);
          v70 -= v159;
          ++v71;
          uint64_t v69 = v163;
          if (v163 == v71) {
            goto LABEL_60;
          }
        }
        swift_bridgeObjectRelease_n();
        uint64_t v68 = *v162;
        uint64_t v64 = v164;
        (*v162)(v168, v164);
        v68(v167, v64);
LABEL_59:
        uint64_t v69 = v163;
        unint64_t v67 = v160;
LABEL_60:
        uint64_t v40 = v69 + 1;
        v169 += v159;
        v67 += v159;
        uint64_t v31 = v154;
      }
      while (v40 != v152);
      uint64_t v40 = v152;
      uint64_t v2 = v147;
      uint64_t v28 = v149;
    }
    goto LABEL_69;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  uint64_t result = sub_24CA865F0();
  __break(1u);
  return result;
}

uint64_t sub_24CA55FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v46 = a4;
  uint64_t v34 = a1;
  uint64_t v6 = sub_24CA86020();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v44 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v48 = (char *)&v32 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v47 = (char *)&v32 - v13;
  uint64_t v42 = a3;
  uint64_t v33 = a2;
  if (a3 != a2)
  {
    uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v38 = v12 + 16;
    uint64_t v14 = *(void *)(v12 + 72);
    uint64_t v35 = (void (**)(char *, uint64_t))(v12 + 8);
    uint64_t v36 = v6;
    uint64_t v43 = (void (**)(char *, uint64_t, uint64_t))(v12 + 32);
    uint64_t v15 = v14 * (v42 - 1);
    uint64_t v39 = v14;
    uint64_t v16 = v14 * v42;
LABEL_6:
    uint64_t v18 = 0;
    uint64_t v19 = v34;
    uint64_t v40 = v16;
    uint64_t v41 = v15;
    while (1)
    {
      uint64_t v20 = *v46;
      uint64_t v45 = v16 + v18;
      uint64_t v21 = v16 + v18 + v20;
      uint64_t v22 = v37;
      v37(v47, v21, v6);
      v22(v48, v15 + v18 + v20, v6);
      uint64_t v23 = sub_24CA85FC0();
      uint64_t v25 = v24;
      if (v23 == sub_24CA85FC0() && v25 == v26)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v6 = v36;
        uint64_t v17 = *v35;
        (*v35)(v48, v36);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v17)(v47, v6);
        uint64_t v16 = v40;
        uint64_t v15 = v41;
LABEL_5:
        v15 += v39;
        v16 += v39;
        if (++v42 == v33) {
          return result;
        }
        goto LABEL_6;
      }
      char v27 = sub_24CA866A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v36;
      uint64_t v28 = *v35;
      (*v35)(v48, v36);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v28)(v47, v6);
      uint64_t v16 = v40;
      uint64_t v15 = v41;
      if ((v27 & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v29 = *v46;
      if (!*v46) {
        break;
      }
      uint64_t v30 = v29 + v41 + v18;
      uint64_t v31 = *v43;
      (*v43)(v44, v29 + v40 + v18, v6);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v31)(v30, v44, v6);
      v18 -= v39;
      if (v42 == ++v19) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24CA56324(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v66 = sub_24CA86020();
  uint64_t v8 = *(void *)(v66 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v66);
  uint64_t v64 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  char v63 = (char *)&v58 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v62 = (char *)&v58 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v58 - v15;
  uint64_t v65 = *(void *)(v17 + 72);
  if (!v65)
  {
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  if (a2 - a1 == 0x8000000000000000 && v65 == -1) {
    goto LABEL_69;
  }
  int64_t v18 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v65 == -1) {
    goto LABEL_70;
  }
  uint64_t v19 = (uint64_t)(a2 - a1) / v65;
  unint64_t v69 = a1;
  unint64_t v68 = a4;
  uint64_t v20 = v18 / v65;
  if (v19 >= v18 / v65)
  {
    if ((v20 & 0x8000000000000000) == 0)
    {
      uint64_t v22 = v20 * v65;
      if (a4 < a2 || a2 + v22 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v40 = a4 + v22;
      unint64_t v67 = a4 + v22;
      unint64_t v69 = a2;
      uint64_t v62 = (char *)a1;
      if (v22 >= 1 && a1 < a2)
      {
        uint64_t v42 = -v65;
        uint64_t v65 = *(void *)(v8 + 16);
        unint64_t v60 = a4;
        uint64_t v61 = v8 + 16;
        uint64_t v59 = (void (**)(char *, uint64_t))(v8 + 8);
        do
        {
          unint64_t v43 = a3;
          uint64_t v44 = (void (*)(char *, unint64_t, uint64_t))v65;
          uint64_t v45 = v66;
          ((void (*)(char *, unint64_t, uint64_t))v65)(v63, v40 + v42, v66);
          unint64_t v46 = a2 + v42;
          v44(v64, a2 + v42, v45);
          uint64_t v47 = sub_24CA85FC0();
          uint64_t v49 = v48;
          if (v47 == sub_24CA85FC0() && v49 == v50) {
            char v51 = 0;
          }
          else {
            char v51 = sub_24CA866A0();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v52 = v43 + v42;
          uint64_t v53 = *v59;
          uint64_t v54 = v66;
          (*v59)(v64, v66);
          v53(v63, v54);
          unint64_t v55 = v60;
          if (v51)
          {
            if (v43 < a2 || v52 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v43 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v69 += v42;
          }
          else
          {
            unint64_t v56 = v67;
            v67 += v42;
            if (v43 < v56 || v52 >= v56)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v43 != v56)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v46 = a2;
          }
          unint64_t v40 = v67;
          if (v67 <= v55) {
            break;
          }
          a2 = v46;
          a3 = v43 + v42;
        }
        while (v46 > (unint64_t)v62);
      }
LABEL_67:
      sub_24CA56BA4(&v69, &v68, (uint64_t *)&v67);
      return 1;
    }
  }
  else if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t v21 = v19 * v65;
    if (a4 < a1 || a1 + v21 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v64 = (char *)(a4 + v21);
    unint64_t v67 = a4 + v21;
    if (v21 >= 1 && a2 < a3)
    {
      char v63 = *(char **)(v8 + 16);
      uint64_t v61 = v8 + 16;
      uint64_t v24 = (void (**)(char *, uint64_t))(v8 + 8);
      while (1)
      {
        unint64_t v25 = a3;
        uint64_t v26 = v66;
        char v27 = (void (*)(char *, unint64_t, uint64_t))v63;
        ((void (*)(char *, unint64_t, uint64_t))v63)(v16, a2, v66);
        v27(v62, a4, v26);
        uint64_t v28 = sub_24CA85FC0();
        uint64_t v30 = v29;
        if (v28 == sub_24CA85FC0() && v30 == v31) {
          break;
        }
        char v34 = sub_24CA866A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v35 = *v24;
        uint64_t v36 = v66;
        (*v24)(v62, v66);
        v35(v16, v36);
        if ((v34 & 1) == 0) {
          goto LABEL_31;
        }
        unint64_t v37 = v69;
        unint64_t v38 = a2 + v65;
        if (v69 < a2 || v69 >= v38)
        {
          swift_arrayInitWithTakeFrontToBack();
          a3 = v25;
        }
        else
        {
          a3 = v25;
          if (v69 == a2) {
            unint64_t v37 = a2;
          }
          else {
            swift_arrayInitWithTakeBackToFront();
          }
        }
LABEL_37:
        unint64_t v69 = v37 + v65;
        a4 = v68;
        if (v68 < (unint64_t)v64)
        {
          a2 = v38;
          if (v38 < a3) {
            continue;
          }
        }
        goto LABEL_67;
      }
      swift_bridgeObjectRelease_n();
      uint64_t v32 = *v24;
      uint64_t v33 = v66;
      (*v24)(v62, v66);
      v32(v16, v33);
LABEL_31:
      unint64_t v37 = v69;
      unint64_t v39 = v68 + v65;
      if (v69 < v68 || v69 >= v39)
      {
        swift_arrayInitWithTakeFrontToBack();
        a3 = v25;
      }
      else
      {
        a3 = v25;
        if (v69 != v68) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v68 = v39;
      unint64_t v38 = a2;
      goto LABEL_37;
    }
    goto LABEL_67;
  }
LABEL_71:
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

char *sub_24CA569EC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698079D8);
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
  uint64_t v14 = a4 + 32;
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

char *sub_24CA56AE8(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_24CA86630();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

uint64_t sub_24CA56BA4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_24CA86020();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_24CA86630();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_24CA56CE4(uint64_t a1)
{
  return sub_24CA569EC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24CA56CF8(uint64_t a1)
{
  return sub_24CA74C84(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24CA56D0C(void *a1)
{
  return sub_24CA74DF0(0, a1[2], 0, a1);
}

unint64_t sub_24CA56D20()
{
  unint64_t result = qword_2698079D0;
  if (!qword_2698079D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698079D0);
  }
  return result;
}

unint64_t sub_24CA56D74()
{
  unint64_t result = qword_26B17F788;
  if (!qword_26B17F788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17F788);
  }
  return result;
}

unint64_t sub_24CA56DC8()
{
  unint64_t result = qword_26B180A68;
  if (!qword_26B180A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B180A68);
  }
  return result;
}

unint64_t sub_24CA56E20()
{
  unint64_t result = qword_2698079E0;
  if (!qword_2698079E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698079E0);
  }
  return result;
}

void sub_24CA56E74(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24CA7BC74(a1, *(void *)(v2 + 16), a2);
}

uint64_t getEnumTagSinglePayload for DataFrameStreamContainer.ConfigurationState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7F && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 127);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 4) >> 7) & 0xFFFFFF81 | (2 * ((*(unsigned __int8 *)(a1 + 4) >> 1) & 0x3F))) ^ 0x7F;
  if (v3 >= 0x7E) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DataFrameStreamContainer.ConfigurationState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 127;
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2)
    {
      *(_DWORD *)unint64_t result = 0;
      *(unsigned char *)(result + 4) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_24CA56F38(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4) >> 7;
}

uint64_t sub_24CA56F44(uint64_t result)
{
  *(unsigned char *)(result + 4) &= ~0x80u;
  return result;
}

unsigned int *sub_24CA56F5C(unsigned int *result, uint64_t a2)
{
  *((unsigned char *)result + 4) = ((*result | ((unint64_t)*((unsigned __int8 *)result + 4) << 32)) & 0x1FFFFFFFFLL | (a2 << 39)) >> 32;
  return result;
}

ValueMetadata *type metadata accessor for DataFrameStreamContainer.ConfigurationState()
{
  return &type metadata for DataFrameStreamContainer.ConfigurationState;
}

uint64_t DataFrameStream.Iterator.Element.index.getter()
{
  return *v0;
}

uint64_t DataFrameStream.Iterator.Element.identifier.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t DataFrameStream.Iterator.Element.data.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_24CA497DC(v1, *(void *)(v0 + 24));
  return v1;
}

void sub_24CA56FD0()
{
  uint64_t v50 = sub_24CA86020();
  *(void *)&long long v43 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  *(void *)&long long v42 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  uint64_t v10 = (void *)(v9 + 16);
  int64_t v11 = (os_unfair_lock_s *)(v9 + 32);
  swift_retain();
  os_unfair_lock_lock(v11);
  sub_24CA583D0(v10, &v44);
  if (v1) {
    goto LABEL_29;
  }
  os_unfair_lock_unlock(v11);
  uint64_t v12 = v44;
  swift_release();
  if (v12)
  {
    uint64_t v13 = *(void *)(v0 + 48);
    if (!v13 || (uint64_t v14 = sub_24CA5759C(*(void *)(v0 + 40), v13, v12), (v15 & 1) != 0))
    {
      uint64_t v20 = v12[2];
      if (*(unsigned char *)(v0 + 24) == 1)
      {
        if (v20)
        {
          uint64_t v21 = &v12[2 * v20];
          int64_t v18 = v21 + 2;
          uint64_t v19 = v21 + 3;
          goto LABEL_14;
        }
      }
      else if (v20)
      {
        LODWORD(v50) = 0;
        int64_t v18 = v12 + 4;
        uint64_t v19 = v12 + 5;
        goto LABEL_23;
      }
    }
    else if (*(unsigned char *)(v0 + 24) == 1)
    {
      if (v14)
      {
        unint64_t v16 = v14 - 1;
        if (__OFSUB__(v14, 1))
        {
          __break(1u);
        }
        else if ((v16 & 0x8000000000000000) == 0)
        {
          if (v16 < v12[2])
          {
            uint64_t v17 = &v12[2 * v16];
            int64_t v18 = v17 + 4;
            uint64_t v19 = v17 + 5;
LABEL_14:
            LODWORD(v50) = 1;
LABEL_23:
            uint64_t v30 = *v19;
            uint64_t v31 = *v18;
            swift_bridgeObjectRetain();
            uint64_t v32 = swift_bridgeObjectRelease();
            uint64_t v33 = *(void *)(v0 + 16);
            MEMORY[0x270FA5388](v32);
            uint64_t v34 = v0;
            *((void *)&v42 - 4) = v33;
            *((void *)&v42 - 3) = v31;
            uint64_t v36 = (uint64_t)&v35[4];
            unint64_t v37 = v35 + 8;
            *((void *)&v42 - 2) = v30;
            swift_retain();
            os_unfair_lock_lock(v37);
            sub_24CA583EC(v36, &v44);
            os_unfair_lock_unlock(v37);
            swift_release();
            unint64_t v38 = v44;
            int v39 = v47;
            long long v42 = v46;
            long long v43 = v45;
            uint64_t v40 = v46;
            *(void *)(v34 + 40) = v31;
            *(void *)(v34 + 48) = v30;
            swift_bridgeObjectRelease();
            type metadata accessor for DataFrameStreamSegment.Iterator();
            uint64_t v41 = swift_allocObject();
            *(_DWORD *)(v41 + 76) = 0;
            *(unsigned char *)(v41 + 80) = 1;
            *(void *)(v41 + 24) = *(void *)(*(void *)(v40 + 16) + 24);
            *(void *)(v41 + 32) = v38;
            *(_OWORD *)(v41 + 40) = v43;
            *(_OWORD *)(v41 + 56) = v42;
            *(_DWORD *)(v41 + 72) = v39;
            *(unsigned char *)(v41 + 16) = v50;
            return;
          }
          goto LABEL_27;
        }
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        os_unfair_lock_unlock(v11);
        __break(1u);
        return;
      }
    }
    else
    {
      unint64_t v28 = v12[2];
      if (v14 < (uint64_t)(v28 - 1))
      {
        if (v14 + 1 < v28)
        {
          LODWORD(v50) = 0;
          uint64_t v29 = &v12[2 * v14 + 2];
          int64_t v18 = v29 + 4;
          uint64_t v19 = v29 + 5;
          goto LABEL_23;
        }
        goto LABEL_28;
      }
    }
    swift_bridgeObjectRelease();
    return;
  }
  if (qword_26B180878 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v6, (uint64_t)qword_26B181220);
  sub_24CA58040(v22, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InternalLogger);
  uint64_t v44 = 0;
  *(void *)&long long v45 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  uint64_t v48 = 0xD000000000000016;
  unint64_t v49 = 0x800000024CA89E10;
  uint64_t v23 = *(void *)(v0 + 16) + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA58040(v23, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  uint64_t v24 = &v5[*(int *)(v3 + 20)];
  uint64_t v25 = v43;
  uint64_t v26 = v42;
  uint64_t v27 = v50;
  (*(void (**)(void, char *, uint64_t))(v43 + 16))(v42, v24, v50);
  sub_24CA580A8((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  sub_24CA58174((unint64_t *)&qword_26B180898, 255, MEMORY[0x263F06EA8]);
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
  sub_24CA5A168(v48, v49, 0xD00000000000006BLL, 0x800000024CA89D10, 0x6D6765537478656ELL, 0xED00002928746E65);
  swift_bridgeObjectRelease();
  sub_24CA580A8((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InternalLogger);
}

uint64_t sub_24CA5759C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_24CA866A0() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = sub_24CA866A0();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

uint64_t sub_24CA57684@<X0>(void *a1@<X8>)
{
  uint64_t v3 = sub_24CA86020();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v40 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v1 + 16) + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA58040(v12, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  LOBYTE(v12) = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_24CA580A8((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  if (v12)
  {
    uint64_t v35 = v6;
    uint64_t v36 = v4;
    uint64_t v37 = v3;
    unint64_t v38 = v8;
    int v39 = a1;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    unint64_t v16 = 0xF000000000000000;
    uint64_t v17 = *(void *)(v1 + 32);
    if (!v17) {
      goto LABEL_4;
    }
LABEL_3:
    uint64_t v18 = v17;
    while (1)
    {
      *(void *)(v1 + 32) = v18;
      swift_retain();
      swift_release();
      if (!*(void *)(v1 + 32))
      {
        uint64_t result = sub_24CA52660(v13, v14, v15, v16);
        goto LABEL_15;
      }
      swift_retain();
      sub_24CA7EF90(&v41);
      sub_24CA52660(v13, v14, v15, v16);
      uint64_t v14 = v42;
      uint64_t v15 = v43;
      unint64_t v16 = v44;
      if (v44 >> 60 != 15) {
        break;
      }
      uint64_t v13 = v41;
      *(void *)(v1 + 32) = 0;
      swift_release();
      swift_release();
      uint64_t v17 = *(void *)(v1 + 32);
      if (v17) {
        goto LABEL_3;
      }
LABEL_4:
      sub_24CA56FD0();
    }
    uint64_t result = swift_release();
    uint64_t v23 = *(unsigned int *)(v1 + 56);
    uint64_t v24 = v39;
    *int v39 = v23;
    v24[1] = v14;
    v24[2] = v15;
    v24[3] = v16;
    BOOL v25 = __CFADD__(v23, 1);
    int v26 = v23 + 1;
    if (!v25)
    {
      *(_DWORD *)(v1 + 56) = v26;
      return result;
    }
    __break(1u);
    swift_once();
    uint64_t v27 = __swift_project_value_buffer(v35, (uint64_t)qword_26B181220);
    uint64_t v28 = (uint64_t)v38;
    sub_24CA58040(v27, (uint64_t)v38, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v41 = 0;
    unint64_t v42 = 0xE000000000000000;
    sub_24CA865B0();
    uint64_t v46 = v41;
    unint64_t v47 = v42;
    sub_24CA86320();
    uint64_t v29 = *(void *)(v1 + 16) + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
    swift_beginAccess();
    sub_24CA58040(v29, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    uint64_t v31 = v36;
    uint64_t v30 = v37;
    uint64_t v32 = v40;
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v40, &v11[*(int *)(v9 + 20)], v37);
    sub_24CA580A8((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA58174((unint64_t *)&qword_26B180898, 255, MEMORY[0x263F06EA8]);
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v30);
    sub_24CA86320();
    uint64_t v45 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698079C8);
    sub_24CA865E0();
    sub_24CA5A180(v46, v47, 0xD00000000000006BLL, 0x800000024CA89D10, 0x29287478656ELL, 0xE600000000000000);
    swift_bridgeObjectRelease();

    uint64_t result = sub_24CA580A8(v28, (uint64_t (*)(void))type metadata accessor for InternalLogger);
LABEL_15:
    uint64_t v33 = v39;
    *int v39 = 0;
    v33[1] = 0;
    v33[2] = 0;
    v33[3] = 0xF000000000000000;
  }
  else
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v6, (uint64_t)qword_26B181220);
    sub_24CA58040(v19, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v41 = 0;
    unint64_t v42 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v46 = 0xD000000000000018;
    unint64_t v47 = 0x800000024CA89CF0;
    uint64_t v20 = *(void *)(v1 + 16) + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
    swift_beginAccess();
    sub_24CA58040(v20, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    uint64_t v21 = v40;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v40, &v11[*(int *)(v9 + 20)], v3);
    sub_24CA580A8((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA58174((unint64_t *)&qword_26B180898, 255, MEMORY[0x263F06EA8]);
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v21, v3);
    sub_24CA5A180(v46, v47, 0xD00000000000006BLL, 0x800000024CA89D10, 0x29287478656ELL, 0xE600000000000000);
    swift_bridgeObjectRelease();
    uint64_t result = sub_24CA580A8((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    a1[3] = 0xF000000000000000;
  }
  return result;
}

uint64_t DataFrameStream.Iterator.deinit()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DataFrameStream.Iterator.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_24CA57E30(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_24CA57E3C()
{
  uint64_t v1 = sub_24CA7F638(*v0);
  swift_release();
  return v1;
}

void *sub_24CA57E74(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CA7EDA4(a1, a2, a3);
}

uint64_t sub_24CA57E98()
{
  return sub_24CA863E0();
}

uint64_t sub_24CA57F00@<X0>(void *a1@<X8>)
{
  return sub_24CA57684(a1);
}

uint64_t DataFrameStream.makeIterator()()
{
  type metadata accessor for DataFrameStream.Iterator();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 32) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(void *)(v1 + 16) = v0;
  *(unsigned char *)(v1 + 24) = 0;
  swift_retain();
  return v1;
}

uint64_t sub_24CA57F74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  type metadata accessor for DataFrameStream.Iterator();
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = 0;
  *(void *)(result + 48) = 0;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 56) = 0;
  *(void *)(result + 16) = v3;
  *(unsigned char *)(result + 24) = 0;
  *a1 = result;
  return result;
}

uint64_t sub_24CA57FC0()
{
  uint64_t v1 = sub_24CA7F658(*v0);
  swift_release();
  return v1;
}

uint64_t sub_24CA57FF8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CA7EDBC(a1, a2, a3);
}

uint64_t sub_24CA5801C()
{
  return sub_24CA863E0();
}

uint64_t sub_24CA58040(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CA580A8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for DataFrameStream.Iterator()
{
  return self;
}

uint64_t sub_24CA5812C(uint64_t a1, uint64_t a2)
{
  return sub_24CA58174(&qword_2698079E8, a2, (void (*)(uint64_t))type metadata accessor for DataFrameStream.Iterator);
}

uint64_t sub_24CA58174(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for DataFrameStream.Iterator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DataFrameStream.Iterator);
}

uint64_t dispatch thunk of DataFrameStream.Iterator.makeIterator()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of DataFrameStream.Iterator.next()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t _s8IteratorC7ElementVwxx(uint64_t a1)
{
  return sub_24CA4986C(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t _s8IteratorC7ElementVwcp(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 24);
  sub_24CA497DC(v3, v4);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  return a1;
}

uint64_t _s8IteratorC7ElementVwca(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  unint64_t v4 = *(void *)(a2 + 24);
  sub_24CA497DC(v3, v4);
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  sub_24CA4986C(v5, v6);
  return a1;
}

uint64_t _s8IteratorC7ElementVwta(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  sub_24CA4986C(v4, v5);
  return a1;
}

uint64_t _s8IteratorC7ElementVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 24) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 24) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s8IteratorC7ElementVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DataFrameStream.Iterator.Element()
{
  return &type metadata for DataFrameStream.Iterator.Element;
}

uint64_t sub_24CA583D0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_24CA60428(a1, v2, a2);
}

uint64_t sub_24CA583EC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_24CA5ED74(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_24CA5840C(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_24CA58440(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t TypedStream.__allocating_init(containerURL:segmentSize:protection:)(char *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for StorageContainer();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24CA86020();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v14(v13, a1, v10);
  v14(v9, v13, v10);
  *(void *)&v9[*(int *)(v7 + 28)] = a3;
  type metadata accessor for DataFrameStream();
  swift_allocObject();
  uint64_t v15 = DataFrameStream.init(storageContainer:segmentSize:)((uint64_t)v9, a2 | ((HIDWORD(a2) & 1) << 32));
  unint64_t v16 = *(void (**)(char *, uint64_t))(v11 + 8);
  v16(v13, v10);
  v16(a1, v10);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v15;
  return result;
}

void TypedStream.append(_:)()
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(*(void *)v0 + 88) + 8))(*(void *)(*(void *)v0 + 80));
  if (!v1)
  {
    uint64_t v4 = v2;
    unint64_t v5 = v3;
    MEMORY[0x270FA5388](v2);
    uint64_t v7 = (uint64_t *)&v6[4];
    uint64_t v8 = v6 + 10;
    os_unfair_lock_lock(v6 + 10);
    sub_24CA58CBC(v7, &v9);
    os_unfair_lock_unlock(v8);
    if (v9) {
      sub_24CA5FB94(v4, v5);
    }
    sub_24CA4986C(v4, v5);
  }
}

void TypedStream.fetch(byIdentifier:)(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t v7 = *(void *)(*v2 + 80);
  uint64_t v8 = sub_24CA86520();
  uint64_t v19 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v18 - v9;
  DataFrameStream.frameData(forIdentifier:)(a1);
  if (!v3)
  {
    unint64_t v13 = v12;
    if (v12 >> 60 == 15)
    {
      uint64_t v14 = *(void *)(v7 - 8);
    }
    else
    {
      uint64_t v17 = v11;
      (*(void (**)(void))(*(void *)(v6 + 88) + 16))();
      sub_24CA51D8C(v17, v13);
      uint64_t v14 = *(void *)(v7 - 8);
      uint64_t v15 = v14;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v7) != 1)
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(a2, v10, v7);
        uint64_t v16 = 0;
        goto LABEL_5;
      }
      (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v8);
    }
    uint64_t v15 = v14;
    uint64_t v16 = 1;
LABEL_5:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(a2, v16, 1, v7);
  }
}

uint64_t TypedStream.set(forIdentifier:message:)(unint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void, void))(*(void *)(*(void *)v1 + 88) + 8))(*(void *)(*(void *)v1 + 80), *(void *)(*(void *)v1 + 88));
  if (!v2)
  {
    uint64_t v6 = result;
    unint64_t v7 = v5;
    DataFrameStream.setFrame(forIdentifier:mutated:)(a1, result, v5, &v9);
    sub_24CA4986C(v6, v7);
    if (v9) {
      unint64_t v8 = a1;
    }
    else {
      unint64_t v8 = 0;
    }
    if (v10) {
      return v8;
    }
    else {
      return v9;
    }
  }
  return result;
}

uint64_t TypedStream.makeIterator()()
{
  type metadata accessor for DataFrameStreamTypedIterator();
  uint64_t v1 = DataFrameStreamTypedIterator.__allocating_init(stream:reversed:ignoreConversionErrors:)(*(void *)(v0 + 16), 0, 1);
  swift_retain();
  return v1;
}

uint64_t TypedStream.pruner(reversed:)(int a1)
{
  return DataFrameStream.pruner<A>(reversed:)(a1, *(void *)(*(void *)v1 + 80), *(void *)(*(void *)v1 + 88));
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TypedStream.vacuum()()
{
}

uint64_t TypedStream.deinit()
{
  swift_release();
  return v0;
}

uint64_t TypedStream.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24CA58C3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = TypedStream.makeIterator()();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t sub_24CA58C7C()
{
  uint64_t v0 = sub_24CA58D70();
  swift_release();
  return v0;
}

uint64_t sub_24CA58CBC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return sub_24CA60128(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_24CA58CDC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24CA58CF8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for TypedStream()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for TypedStream(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TypedStream);
}

uint64_t sub_24CA58D74(int a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  uint64_t v22 = &type metadata for EmbeddedDeviceLockState;
  uint64_t v23 = (uint64_t (*)())&off_26FF14300;
  if (a2) {
    LODWORD(aBlock) = MKBGetDeviceLockState();
  }
  else {
    LODWORD(aBlock) = a1;
  }
  sub_24CA59200((uint64_t)v27);
  sub_24CA59260((uint64_t)&aBlock, (uint64_t)v27);
  sub_24CA592C8((uint64_t)v27, (uint64_t)&aBlock);
  if (v22)
  {
    v19[2] = a3;
    sub_24CA59330(&aBlock, (uint64_t)v26);
    sub_24CA59348((uint64_t)v26, (uint64_t)v25);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a4;
    *(void *)(v8 + 24) = a5;
    sub_24CA59330(v25, v8 + 32);
    uint64_t v23 = sub_24CA5943C;
    uint64_t v24 = v8;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v21 = sub_24CA590E4;
    uint64_t v22 = (ValueMetadata *)&block_descriptor;
    uint64_t v9 = _Block_copy(&aBlock);
    uint64_t v10 = sub_24CA861D0();
    v19[1] = v19;
    uint64_t v11 = *(void *)(v10 - 8);
    MEMORY[0x270FA5388](v10);
    unint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    sub_24CA861B0();
    uint64_t v14 = sub_24CA861A0();
    uint64_t v15 = *(void *)(v14 - 8);
    MEMORY[0x270FA5388](v14);
    uint64_t v17 = (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19[3] = MEMORY[0x263F8EE78];
    sub_24CA59484();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269807A00);
    sub_24CA594D0();
    sub_24CA86560();
    MEMORY[0x253306160](0, v13, v17, v9);
    _Block_release(v9);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    sub_24CA59200((uint64_t)v27);
    return swift_release();
  }
  else
  {
    sub_24CA59200((uint64_t)v27);
    return sub_24CA59200((uint64_t)&aBlock);
  }
}

uint64_t sub_24CA590E4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24CA59128()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + 56) + 136);
  uint64_t v2 = swift_retain();
  atomic_store(1u, (unsigned __int8 *)v1(v2));
  swift_release();
  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeviceLockStateNotificationObserver()
{
  return self;
}

uint64_t sub_24CA59200(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698079F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CA59260(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698079F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA592C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698079F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA59330(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24CA59348(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24CA593AC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return MEMORY[0x270FA0238](v0, 72, 7);
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

uint64_t sub_24CA5943C()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 16))(v0 + 32);
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

unint64_t sub_24CA59484()
{
  unint64_t result = qword_2698079F8;
  if (!qword_2698079F8)
  {
    sub_24CA861A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698079F8);
  }
  return result;
}

unint64_t sub_24CA594D0()
{
  unint64_t result = qword_269807A08;
  if (!qword_269807A08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269807A00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807A08);
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

uint64_t DataFrameStream.pruner<A>(reversed:)(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v23[0] = a2;
  v23[1] = a3;
  int v24 = a1;
  uint64_t v29 = sub_24CA86020();
  uint64_t v26 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v7);
  uint64_t v25 = (uint64_t)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA58040(v12, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  BOOL v13 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_24CA580A8((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  if (v13)
  {
    type metadata accessor for DataFrameStreamPruner();
    *(void *)(swift_allocObject() + 32) = 0;
    uint64_t v14 = DataFrameStreamTypedIterator.init(stream:reversed:ignoreConversionErrors:)(v4, v24 & 1, 1);
    swift_retain();
  }
  else
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v7, (uint64_t)qword_26B181220);
    uint64_t v16 = v25;
    sub_24CA58040(v15, v25, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v27 = 0;
    unint64_t v28 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v27 = 0xD000000000000018;
    unint64_t v28 = 0x800000024CA89CF0;
    sub_24CA58040(v12, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    uint64_t v17 = &v11[*(int *)(v9 + 20)];
    uint64_t v18 = v26;
    uint64_t v19 = v29;
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v6, v17, v29);
    sub_24CA580A8((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA4D014();
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v19);
    sub_24CA5A180(v27, v28, 0xD000000000000068, 0x800000024CA89E70, 0xD000000000000011, 0x800000024CA89EE0);
    swift_bridgeObjectRelease();
    sub_24CA580A8(v16, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    sub_24CA59B64();
    uint64_t v20 = swift_allocError();
    *uint64_t v21 = 1;
    uint64_t v14 = v20;
    swift_willThrow();
  }
  return v14;
}

uint64_t sub_24CA59964()
{
  swift_beginAccess();
  return *(void *)(v0 + 32);
}

uint64_t sub_24CA59998(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*sub_24CA599D8())()
{
  return j__swift_endAccess;
}

uint64_t sub_24CA59A30()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + 32);
  if (!v1 || (*(unsigned char *)(v1 + 80) & 1) != 0 || !DataFrameStreamSegment.deleteFrame(index:)(*(_DWORD *)(v1 + 76))) {
    return 0;
  }
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *(void *)(v0 + 32);
  BOOL v4 = __CFADD__(v3, 1);
  uint64_t v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0 + 32) = v5;
    return 1;
  }
  return result;
}

uint64_t DataFrameStreamPruner.__allocating_init(stream:reversed:ignoreConversionErrors:)(uint64_t a1, char a2, char a3)
{
  *(void *)(swift_allocObject() + 32) = 0;
  return DataFrameStreamTypedIterator.init(stream:reversed:ignoreConversionErrors:)(a1, a2, a3);
}

uint64_t DataFrameStreamPruner.init(stream:reversed:ignoreConversionErrors:)(uint64_t a1, char a2, char a3)
{
  *(void *)(v3 + 32) = 0;
  return DataFrameStreamTypedIterator.init(stream:reversed:ignoreConversionErrors:)(a1, a2, a3);
}

uint64_t DataFrameStreamPruner.__deallocating_deinit()
{
  DataFrameStreamTypedIterator.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_24CA59B64()
{
  unint64_t result = qword_269807A10;
  if (!qword_269807A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807A10);
  }
  return result;
}

uint64_t type metadata accessor for DataFrameStreamPruner()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CA59BD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA59964();
  *a1 = result;
  return result;
}

uint64_t sub_24CA59BFC(uint64_t *a1)
{
  return sub_24CA59998(*a1);
}

uint64_t sub_24CA59C24()
{
  return 16;
}

__n128 sub_24CA59C30(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24CA59C3C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for DataFrameStreamPruner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DataFrameStreamPruner);
}

uint64_t dispatch thunk of DataFrameStreamPruner.prunedCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of DataFrameStreamPruner.prunedCount.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of DataFrameStreamPruner.prunedCount.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of DataFrameStreamPruner.pruneElement()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t sub_24CA59D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86160();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_24CA59D98(uint64_t a1)
{
  uint64_t v2 = sub_24CA86160();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_24CA59DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86160();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CA59E60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86160();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CA59EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86160();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CA59F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86160();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CA59F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CA59FA0);
}

uint64_t sub_24CA59FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86160();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_24CA5A00C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CA5A020);
}

uint64_t sub_24CA5A020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86160();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for InternalLogger()
{
  uint64_t result = qword_26B180C00;
  if (!qword_26B180C00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA5A0DC()
{
  uint64_t result = sub_24CA86160();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CA5A168(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_24CA5A1B0(a1, a2, a3, a4, a5, a6, MEMORY[0x263F90278]);
}

uint64_t sub_24CA5A180(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_24CA5A1B0(a1, a2, a3, a4, a5, a6, MEMORY[0x263F90280]);
}

uint64_t sub_24CA5A198(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_24CA5A1B0(a1, a2, a3, a4, a5, a6, MEMORY[0x263F90270]);
}

uint64_t sub_24CA5A1B0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v35 = a5;
  uint64_t v36 = a1;
  uint64_t v32 = a3;
  uint64_t v11 = sub_24CA86020();
  uint64_t v33 = *(void *)(v11 - 8);
  uint64_t v34 = v11;
  MEMORY[0x270FA5388]();
  BOOL v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24CA86160();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v7, v14);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_24CA86150();
  os_log_type_t v19 = a7();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    unint64_t v29 = a2;
    uint64_t v22 = v21;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v38 = v31;
    *(_DWORD *)uint64_t v22 = 136315650;
    sub_24CA85FB0();
    int v30 = v20;
    uint64_t v23 = sub_24CA85FC0();
    uint64_t v32 = v14;
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v34);
    uint64_t v37 = sub_24CA5AA78(v23, v25, &v38);
    sub_24CA86540();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_24CA5AA78(v35, a6, &v38);
    sub_24CA86540();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 22) = 2080;
    unint64_t v26 = v29;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_24CA5AA78(v36, v26, &v38);
    sub_24CA86540();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CA47000, v18, (os_log_type_t)v30, "[%s: %s] %s", (uint8_t *)v22, 0x20u);
    uint64_t v27 = v31;
    swift_arrayDestroy();
    MEMORY[0x253306CA0](v27, -1, -1);
    MEMORY[0x253306CA0](v22, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_24CA5A564(uint64_t a1)
{
  return sub_24CA5A6D0(a1, qword_26980A100, &qword_2698075B0, (id *)&qword_269807A18);
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

uint64_t sub_24CA5A5F4(uint64_t a1)
{
  return sub_24CA5A6D0(a1, qword_26980A118, &qword_2698075B8, (id *)&qword_269807A20);
}

uint64_t sub_24CA5A620(uint64_t a1)
{
  return sub_24CA5A6D0(a1, qword_26980A130, &qword_2698075C0, (id *)&qword_269807A28);
}

uint64_t sub_24CA5A64C(uint64_t a1)
{
  return sub_24CA5A6D0(a1, qword_26B181220, &qword_26B1808A8, (id *)&qword_26B1808A0);
}

uint64_t sub_24CA5A678(uint64_t a1)
{
  return sub_24CA5A6D0(a1, qword_26B181248, &qword_26B180A80, (id *)&qword_26B180A78);
}

uint64_t sub_24CA5A6A4(uint64_t a1)
{
  return sub_24CA5A6D0(a1, qword_26980A148, &qword_2698075C8, (id *)&qword_269807A30);
}

uint64_t sub_24CA5A6D0(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_24CA86160();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for InternalLogger();
  __swift_allocate_value_buffer(v11, a2);
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v13 = *a4;
  sub_24CA86170();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v12, v10, v7);
}

uint64_t sub_24CA5A7FC()
{
  sub_24CA5A850();
  uint64_t result = sub_24CA86510();
  qword_269807A18 = result;
  return result;
}

unint64_t sub_24CA5A850()
{
  unint64_t result = qword_26B1808B0[0];
  if (!qword_26B1808B0[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_26B1808B0);
  }
  return result;
}

uint64_t sub_24CA5A890()
{
  sub_24CA5A850();
  uint64_t result = sub_24CA86510();
  qword_269807A20 = result;
  return result;
}

uint64_t sub_24CA5A8FC()
{
  sub_24CA5A850();
  uint64_t result = sub_24CA86510();
  qword_269807A28 = result;
  return result;
}

uint64_t sub_24CA5A954()
{
  sub_24CA5A850();
  uint64_t result = sub_24CA86510();
  qword_26B1808A0 = result;
  return result;
}

uint64_t sub_24CA5A9B4()
{
  sub_24CA5A850();
  uint64_t result = sub_24CA86510();
  qword_26B180A78 = result;
  return result;
}

uint64_t sub_24CA5AA1C()
{
  sub_24CA5A850();
  uint64_t result = sub_24CA86510();
  qword_269807A30 = result;
  return result;
}

uint64_t sub_24CA5AA78(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CA5AB4C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CA5B068((uint64_t)v12, *a3);
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
      sub_24CA5B068((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24CA5AB4C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CA86550();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CA5AD08(a5, a6);
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
  uint64_t v8 = sub_24CA865D0();
  if (!v8)
  {
    sub_24CA865F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CA86630();
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

uint64_t sub_24CA5AD08(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CA5ADA0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CA5AF18(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CA5AF18(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CA5ADA0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CA80F60(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CA865C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CA865F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CA86330();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CA86630();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CA865F0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_24CA5AF18(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269807A38);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA5B068(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t DataFrameStream.__allocating_init(containerURL:segmentSize:protection:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for StorageContainer();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24CA86020();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  *(void *)&v9[*(int *)(v7 + 28)] = a3;
  uint64_t v12 = swift_allocObject();
  DataFrameStream.init(storageContainer:segmentSize:)((uint64_t)v9, a2 | ((HIDWORD(a2) & 1) << 32));
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v12;
}

void DataFrameStream.append(data:)(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  uint64_t v7 = (uint64_t *)&v6[4];
  uint64_t v8 = v6 + 10;
  os_unfair_lock_lock(v6 + 10);
  sub_24CA58CBC(v7, &v9);
  os_unfair_lock_unlock(v8);
  if (v3) {
    __break(1u);
  }
  else {
    sub_24CA5FB94(a1, a2);
  }
}

void DataFrameStream.frameData(forIdentifier:)(unint64_t a1)
{
  unint64_t v38 = a1;
  uint64_t v39 = sub_24CA86020();
  uint64_t v37 = *(os_unfair_lock_s **)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v3 = (char *)v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v4);
  uint64_t v35 = (os_unfair_lock_s *)((char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA65B28(v9, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  BOOL v10 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  if (v10)
  {
    uint64_t v11 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
    uint64_t v12 = v11 + 4;
    id v13 = v11 + 8;
    os_unfair_lock_lock(v11 + 8);
    uint64_t v37 = v12;
    uint64_t v14 = v46;
    sub_24CA658BC(v12, &v40);
    if (v14)
    {
      os_unfair_lock_unlock(v13);
      __break(1u);
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = v1;
      os_unfair_lock_unlock(v13);
      uint64_t v17 = v40;
      if (v40)
      {
        uint64_t v18 = *(void *)(v40 + 16);
        if (v18)
        {
          v34[1] = v40;
          uint64_t v35 = v13;
          os_log_type_t v19 = (uint64_t *)(v40 + 40);
          uint64_t v36 = v1;
          while (1)
          {
            uint64_t v20 = *v19;
            MEMORY[0x270FA5388](v17);
            v34[-4] = v16;
            v34[-3] = v21;
            v34[-2] = v20;
            swift_bridgeObjectRetain();
            os_unfair_lock_lock(v13);
            sub_24CA6675C((uint64_t)v37, &v40);
            os_unfair_lock_unlock(v13);
            swift_bridgeObjectRelease();
            if (v15) {
              break;
            }
            uint64_t v46 = 0;
            uint64_t v22 = v40;
            uint64_t v24 = v42;
            uint64_t v23 = v43;
            uint64_t v25 = v44;
            int v26 = v45;
            uint64_t v39 = v41;
            uint64_t v27 = sub_24CA6C93C(v38);
            unint64_t v29 = (void *)v27;
            if (v28 == 1)
            {
              unint64_t v38 = v27;
            }
            else if (v28 != 2)
            {
              swift_bridgeObjectRelease();
              uint64_t v40 = v22;
              uint64_t v41 = v39;
              uint64_t v42 = v24;
              uint64_t v43 = v23;
              uint64_t v44 = v25;
              int v45 = v26;
              DataFrameStreamSegment.frameData(forSegmentIndex:)(v29);
              swift_release();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              return;
            }
            v19 += 2;
            swift_release();
            swift_release();
            swift_release();
            uint64_t v17 = swift_bridgeObjectRelease();
            --v18;
            uint64_t v15 = v46;
            id v13 = v35;
            uint64_t v16 = v36;
            if (!v18) {
              goto LABEL_16;
            }
          }
          swift_bridgeObjectRelease();
        }
        else
        {
LABEL_16:
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  else
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v4, (uint64_t)qword_26B181220);
    uint64_t v31 = (uint64_t)v35;
    sub_24CA65B28(v30, (uint64_t)v35, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v40 = 0;
    uint64_t v41 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v40 = 0xD000000000000018;
    uint64_t v41 = 0x800000024CA89CF0;
    sub_24CA65B28(v9, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    uint64_t v32 = (uint64_t)v37;
    uint64_t v33 = v39;
    (*(void (**)(char *, char *, uint64_t))&v37[4]._os_unfair_lock_opaque)(v3, &v8[*(int *)(v6 + 20)], v39);
    sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA66450((unint64_t *)&qword_26B180898, MEMORY[0x263F06EA8]);
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v3, v33);
    sub_24CA5A180(v40, v41, 0xD000000000000062, 0x800000024CA8A140, 0xD000000000000019, 0x800000024CA8A1B0);
    swift_bridgeObjectRelease();
    sub_24CA65BF4(v31, (uint64_t (*)(void))type metadata accessor for InternalLogger);
  }
}

void DataFrameStream.setFrame(forIdentifier:mutated:)(unint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v43 = a2;
  unint64_t v44 = a3;
  unint64_t v50 = a1;
  uint64_t v46 = a4;
  p_os_unfair_lock_opaque = (void *)sub_24CA86020();
  unint64_t v47 = (os_unfair_lock_s *)*(p_os_unfair_lock_opaque - 1);
  MEMORY[0x270FA5388](p_os_unfair_lock_opaque);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v7);
  uint64_t v45 = (uint64_t)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA65B28(v12, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  BOOL v13 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_24CA65BF4((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  if (!v13)
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v36 = __swift_project_value_buffer(v7, (uint64_t)qword_26B181220);
    uint64_t v37 = v45;
    sub_24CA65B28(v36, v45, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    *(void *)&long long v51 = 0;
    *((void *)&v51 + 1) = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    *(void *)&long long v51 = 0xD000000000000018;
    *((void *)&v51 + 1) = 0x800000024CA89CF0;
    sub_24CA65B28(v12, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    unint64_t v38 = &v11[*(int *)(v9 + 20)];
    uint64_t v39 = v47;
    uint64_t v40 = (uint64_t)p_os_unfair_lock_opaque;
    (*(void (**)(char *, char *, void *))&v47[4]._os_unfair_lock_opaque)(v6, v38, p_os_unfair_lock_opaque);
    sub_24CA65BF4((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA66450((unint64_t *)&qword_26B180898, MEMORY[0x263F06EA8]);
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))&v39[2]._os_unfair_lock_opaque)(v6, v40);
    sub_24CA5A180(v51, *((unint64_t *)&v51 + 1), 0xD000000000000062, 0x800000024CA8A140, 0xD000000000000020, 0x800000024CA8A1D0);
    swift_bridgeObjectRelease();
    sub_24CA65BF4(v37, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    goto LABEL_16;
  }
  uint64_t v14 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  uint64_t v15 = v14 + 4;
  uint64_t v16 = v14 + 8;
  os_unfair_lock_lock(v14 + 8);
  p_os_unfair_lock_opaque = &v15->_os_unfair_lock_opaque;
  uint64_t v17 = v56;
  sub_24CA658BC(v15, &v51);
  if (v17)
  {
    os_unfair_lock_unlock(v16);
    __break(1u);
    return;
  }
  uint64_t v18 = v4;
  os_unfair_lock_unlock(v16);
  if (!(void)v51)
  {
LABEL_16:
    uint64_t v41 = v46;
    *uint64_t v46 = 0;
    *((unsigned char *)v41 + 8) = 1;
    return;
  }
  uint64_t v56 = 0;
  uint64_t v20 = *(void *)(v51 + 16);
  uint64_t v45 = v51;
  if (!v20)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  uint64_t v21 = (uint64_t *)(v51 + 40);
  unint64_t v47 = v16;
  uint64_t v48 = v4;
  while (1)
  {
    uint64_t v22 = *v21;
    MEMORY[0x270FA5388](v19);
    *(&v42 - 4) = v18;
    *(&v42 - 3) = v23;
    *(&v42 - 2) = v22;
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v16);
    uint64_t v24 = v56;
    sub_24CA658D8((uint64_t)p_os_unfair_lock_opaque, &v51);
    os_unfair_lock_unlock(v16);
    swift_bridgeObjectRelease();
    uint64_t v56 = v24;
    if (v24) {
      break;
    }
    long long v25 = v51;
    uint64_t v26 = v52;
    uint64_t v27 = v53;
    uint64_t v28 = v54;
    int v29 = v55;
    uint64_t v30 = sub_24CA6C93C(v50);
    unsigned int v32 = v30;
    if (v31 == 1)
    {
      unint64_t v50 = v30;
    }
    else if (v31 != 2)
    {
      swift_bridgeObjectRelease();
      long long v51 = v25;
      uint64_t v52 = v26;
      uint64_t v53 = v27;
      uint64_t v54 = v28;
      int v55 = v29;
      uint64_t v33 = v48;
      swift_retain();
      uint64_t v35 = v43;
      unint64_t v34 = v44;
      sub_24CA497DC(v43, v44);
      sub_24CA6D228(v32, v35, v34, &v51, v33, v35, v34, (uint64_t)v46);
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return;
    }
    v21 += 2;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v19 = swift_bridgeObjectRelease();
    --v20;
    uint64_t v16 = v47;
    uint64_t v18 = v48;
    if (!v20) {
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DataFrameStream.vacuum()()
{
  uint64_t v59 = sub_24CA86020();
  uint64_t v1 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v3 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v4);
  uint64_t v57 = (uint64_t)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = v0;
  uint64_t v9 = v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  uint64_t v53 = v9;
  sub_24CA65B28(v9, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  BOOL v10 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  if (v10)
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for InternalLogger;
    uint64_t v50 = __swift_project_value_buffer(v4, (uint64_t)qword_26B181220);
    uint64_t v12 = v57;
    sub_24CA65B28(v50, v57, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    sub_24CA65B28(v53, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    uint64_t v13 = v59;
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v3, &v8[*(int *)(v6 + 20)], v59);
    sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA66450((unint64_t *)&qword_26B180898, MEMORY[0x263F06EA8]);
    uint64_t v14 = sub_24CA86680();
    unint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v13);
    sub_24CA5A168(v14, v16, 0xD000000000000062, 0x800000024CA8A140, 0x29286D7575636176, 0xE800000000000000);
    swift_bridgeObjectRelease();
    sub_24CA65BF4(v12, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v17 = *(os_unfair_lock_s **)(v58 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
    uint64_t v18 = v17 + 4;
    uint64_t v19 = v17 + 8;
    os_unfair_lock_lock(v17 + 8);
    uint64_t v20 = v60;
    sub_24CA658BC(v18, v62);
    if (!v20)
    {
      uint64_t v21 = 0;
      os_unfair_lock_unlock(v19);
      uint64_t v22 = v62[0];
      if (!v62[0]) {
        return;
      }
      uint64_t v63 = MEMORY[0x263F8EE88];
      uint64_t v23 = *(void *)(v62[0] + 16);
      int v55 = v18;
      if (v23)
      {
        uint64_t v48 = v62[0];
        uint64_t v24 = (uint64_t *)(v62[0] + 40);
        uint64_t v49 = 0x800000024CA8A140;
        uint64_t v54 = v19;
        do
        {
          uint64_t v27 = *(v24 - 1);
          uint64_t v28 = *v24;
          MEMORY[0x270FA5388](v22);
          *(&v48 - 4) = v58;
          *(&v48 - 3) = v27;
          *(&v48 - 2) = v28;
          swift_bridgeObjectRetain();
          os_unfair_lock_lock(v19);
          sub_24CA6675C((uint64_t)v18, v62);
          if (v21)
          {
            os_unfair_lock_unlock(v19);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_31;
          }
          uint64_t v59 = v28;
          unint64_t v60 = 0;
          os_unfair_lock_unlock(v19);
          uint64_t v29 = v62[1];
          uint64_t v30 = v62[2];
          uint64_t v31 = *(void *)(v62[3] + 16);
          unsigned int v32 = *(_DWORD *)(v31 + 16);
          unsigned int v33 = *(_DWORD *)(v31 + 20);
          swift_bridgeObjectRetain();
          swift_retain();
          swift_retain();
          swift_retain();
          if (v32 < v33)
          {
            unint64_t v60 = type metadata accessor for InternalLogger;
            uint64_t v38 = v57;
            sub_24CA65B28(v50, v57, (uint64_t (*)(void))type metadata accessor for InternalLogger);
            v62[0] = 0;
            v62[1] = 0xE000000000000000;
            uint64_t v52 = v29;
            sub_24CA865B0();
            sub_24CA86320();
            unsigned int v61 = v32;
            sub_24CA86680();
            sub_24CA86320();
            swift_bridgeObjectRelease();
            sub_24CA86320();
            unsigned int v61 = v33;
            sub_24CA86680();
            sub_24CA86320();
            swift_bridgeObjectRelease();
            sub_24CA5A180(v62[0], v62[1], 0xD000000000000069, 0x800000024CA8A230, 0xD000000000000011, 0x800000024CA8A2A0);
            swift_bridgeObjectRelease();
            sub_24CA65BF4(v38, (uint64_t (*)(void))v60);
            sub_24CA65A80();
            swift_allocError();
            *uint64_t v39 = 2;
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_release_n();
            swift_release_n();
            swift_release_n();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            goto LABEL_31;
          }
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          if (v32 && (uint64_t v56 = v30, v32 == v33))
          {
            long long v51 = type metadata accessor for InternalLogger;
            uint64_t v25 = v57;
            sub_24CA65B28(v50, v57, (uint64_t (*)(void))type metadata accessor for InternalLogger);
            v62[0] = 0;
            v62[1] = 0xE000000000000000;
            uint64_t v52 = v29;
            sub_24CA865B0();
            swift_bridgeObjectRelease();
            strcpy((char *)v62, "segment dead: ");
            HIBYTE(v62[1]) = -18;
            uint64_t v26 = v59;
            sub_24CA86320();
            sub_24CA5A168(v62[0], v62[1], 0xD000000000000062, v49, 0x29286D7575636176, 0xE800000000000000);
            swift_bridgeObjectRelease();
            sub_24CA65BF4(v25, (uint64_t (*)(void))v51);
            sub_24CA62C60(v62, v27, v26);
            swift_release();
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_release();
            swift_release();
            swift_release();
          }
          uint64_t v22 = swift_bridgeObjectRelease();
          v24 += 2;
          --v23;
          uint64_t v21 = v60;
          uint64_t v19 = v54;
          uint64_t v18 = v55;
        }
        while (v23);
        swift_bridgeObjectRelease();
        uint64_t v37 = v63;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v37 = MEMORY[0x263F8EE88];
      }
      uint64_t v40 = v53;
      if (!*(void *)(v37 + 16)) {
        goto LABEL_31;
      }
      uint64_t v11 = (uint64_t (*)())v19;
      swift_beginAccess();
      uint64_t v41 = sub_24CA54D50();
      if (v21)
      {
        swift_endAccess();
LABEL_31:
        swift_bridgeObjectRelease();
        return;
      }
      uint64_t v19 = (os_unfair_lock_s *)v41;
      os_unfair_lock_lock((os_unfair_lock_t)v11);
      uint64_t v42 = v55;
      if (!*(void *)&v55->_os_unfair_lock_opaque)
      {
LABEL_28:
        uint64_t v45 = swift_bridgeObjectRetain();
        sub_24CA60EC4(v45, v40, (uint64_t)v42);
        swift_bridgeObjectRelease();
        os_unfair_lock_unlock((os_unfair_lock_t)v11);
        if (qword_26B1808C8 != -1) {
          swift_once();
        }
        uint64_t v46 = (uint64_t *)(qword_26B181238 + 16);
        unint64_t v47 = (os_unfair_lock_s *)(qword_26B181238 + 24);
        swift_retain();
        os_unfair_lock_lock(v47);
        sub_24CA65A64(v46);
        os_unfair_lock_unlock(v47);
        swift_release();
        swift_release();
        swift_endAccess();
        goto LABEL_31;
      }
      uint64_t v43 = sub_24CA654B8((uint64_t)v55, &v63);
      int64_t v44 = *(void *)(*(void *)&v42->_os_unfair_lock_opaque + 16);
      if (v44 >= v43)
      {
        sub_24CA658F8(v43, v44);
        goto LABEL_28;
      }
      __break(1u);
    }
    os_unfair_lock_unlock(v19);
    __break(1u);
    os_unfair_lock_unlock((os_unfair_lock_t)v11);
    __break(1u);
    return;
  }
  if (qword_26B180878 != -1) {
    swift_once();
  }
  uint64_t v34 = __swift_project_value_buffer(v4, (uint64_t)qword_26B181220);
  uint64_t v35 = v57;
  sub_24CA65B28(v34, v57, (uint64_t (*)(void))type metadata accessor for InternalLogger);
  v62[0] = 0;
  v62[1] = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  v62[0] = 0xD000000000000018;
  v62[1] = 0x800000024CA89CF0;
  sub_24CA65B28(v53, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  uint64_t v36 = v59;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v3, &v8[*(int *)(v6 + 20)], v59);
  sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  sub_24CA66450((unint64_t *)&qword_26B180898, MEMORY[0x263F06EA8]);
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v36);
  sub_24CA5A180(v62[0], v62[1], 0xD000000000000062, 0x800000024CA8A140, 0x29286D7575636176, 0xE800000000000000);
  swift_bridgeObjectRelease();
  sub_24CA65BF4(v35, (uint64_t (*)(void))type metadata accessor for InternalLogger);
}

BOOL sub_24CA5C918(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DataFrameStream.__allocating_init(containerURL:segmentSize:protection:)(char *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v27 = a3;
  uint64_t v28 = a1;
  uint64_t v26 = type metadata accessor for StorageContainer();
  MEMORY[0x270FA5388](v26);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CA86020();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (HIDWORD(a2))
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v10, (uint64_t)qword_26B181220);
    sub_24CA65B28(v13, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    v30[0] = 0;
    v30[1] = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    strcpy((char *)v30, "segmentSize: ");
    HIWORD(v30[1]) = -4864;
    id v32 = (id)a2;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA86320();
    sub_24CA5A180(v30[0], v30[1], 0xD000000000000062, 0x800000024CA8A140, 0xD00000000000002ALL, 0x800000024CA8A2E0);
    swift_bridgeObjectRelease();
    sub_24CA65BF4((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    unsigned __int8 v14 = 0;
    a2 = 0xFFFFFFFFLL;
  }
  else if (a2 <= 0x40)
  {
    sub_24CA65AD4();
    unint64_t v15 = (void *)swift_allocError();
    *unint64_t v16 = 0;
    swift_willThrow();
    id v32 = v15;
    id v17 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698079C8);
    if ((swift_dynamicCast() & 1) != 0 && (v31 & 1) == 0)
    {

      if (qword_26B180878 != -1) {
        swift_once();
      }
      uint64_t v19 = __swift_project_value_buffer(v10, (uint64_t)qword_26B181220);
      sub_24CA65B28(v19, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for InternalLogger);
      v30[0] = 0;
      v30[1] = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      unint64_t v29 = a2;
      strcpy((char *)v30, "segmentSize: ");
      HIWORD(v30[1]) = -4864;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA86320();
      sub_24CA5A180(v30[0], v30[1], 0xD000000000000062, 0x800000024CA8A140, 0xD00000000000002ALL, 0x800000024CA8A2E0);
      swift_bridgeObjectRelease();
      sub_24CA65BF4((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    }
    else
    {

      if (qword_26B180878 != -1) {
        swift_once();
      }
      uint64_t v18 = __swift_project_value_buffer(v10, (uint64_t)qword_26B181220);
      uint64_t v25 = type metadata accessor for InternalLogger;
      sub_24CA65B28(v18, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for InternalLogger);
      v30[0] = 0;
      v30[1] = 0xE000000000000000;
      sub_24CA865B0();
      sub_24CA86320();
      id v32 = (id)a2;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA86320();
      id v32 = v15;
      sub_24CA865E0();
      sub_24CA5A180(v30[0], v30[1], 0xD000000000000062, 0x800000024CA8A140, 0xD00000000000002ALL, 0x800000024CA8A2E0);
      swift_bridgeObjectRelease();

      sub_24CA65BF4((uint64_t)v12, (uint64_t (*)(void))v25);
    }
    a2 = 0;
    unsigned __int8 v14 = 1;
  }
  else
  {
    unsigned __int8 v14 = 0;
  }
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  uint64_t v21 = v28;
  v20(v9, v28, v6);
  v20(v5, v9, v6);
  *(void *)&v5[*(int *)(v26 + 20)] = v27;
  uint64_t v22 = swift_allocObject();
  LOBYTE(v30[0]) = v14;
  DataFrameStream.init(storageContainer:segmentSize:)((uint64_t)v5, a2 | ((unint64_t)v14 << 32));
  uint64_t v23 = *(void (**)(char *, uint64_t))(v7 + 8);
  v23(v9, v6);
  v23(v21, v6);
  return v22;
}

uint64_t DataFrameStream.__allocating_init(storageContainer:segmentSize:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  DataFrameStream.init(storageContainer:segmentSize:)(a1, a2 | ((HIDWORD(a2) & 1) << 32));
  return v4;
}

uint64_t DataFrameStream.init(storageContainer:segmentSize:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DataFrameStreamContainer();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unsigned __int8 v14 = (uint64_t *)((char *)&v32 - v13);
  if ((a2 & 0x100000000) != 0)
  {
    uint64_t v15 = 0x100000000;
  }
  else if (a2 <= 0x40)
  {
    uint64_t v35 = a1;
    sub_24CA65AD4();
    unint64_t v16 = (void *)swift_allocError();
    *id v17 = 0;
    swift_willThrow();
    uint64_t v34 = 0;
    id v38 = v16;
    id v18 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698079C8);
    if ((swift_dynamicCast() & 1) != 0 && (v37 & 1) == 0)
    {

      if (qword_26B180878 != -1) {
        swift_once();
      }
      uint64_t v20 = __swift_project_value_buffer(v6, (uint64_t)qword_26B181220);
      sub_24CA65B28(v20, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InternalLogger);
      v39[0] = 0;
      v39[1] = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      strcpy((char *)v39, "segmentSize: ");
      HIWORD(v39[1]) = -4864;
      int v36 = a2;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA86320();
      sub_24CA5A180(v39[0], v39[1], 0xD000000000000062, 0x800000024CA8A140, 0xD000000000000023, 0x800000024CA8A310);
      swift_bridgeObjectRelease();
      sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    }
    else
    {

      if (qword_26B180878 != -1) {
        swift_once();
      }
      uint64_t v19 = __swift_project_value_buffer(v6, (uint64_t)qword_26B181220);
      unsigned int v33 = type metadata accessor for InternalLogger;
      sub_24CA65B28(v19, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InternalLogger);
      v39[0] = 0;
      v39[1] = 0xE000000000000000;
      sub_24CA865B0();
      sub_24CA86320();
      LODWORD(v38) = a2;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA86320();
      id v38 = v16;
      sub_24CA865E0();
      sub_24CA5A180(v39[0], v39[1], 0xD000000000000062, 0x800000024CA8A140, 0xD000000000000023, 0x800000024CA8A310);
      swift_bridgeObjectRelease();

      sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))v33);
    }
    LODWORD(a2) = 0;
    uint64_t v15 = 0x100000000;
    a1 = v35;
  }
  else
  {
    uint64_t v15 = 0;
  }
  sub_24CA65B28(a1, (uint64_t)v14 + *(int *)(v9 + 20), (uint64_t (*)(void))type metadata accessor for StorageContainer);
  void *v14 = objc_msgSend(self, sel_defaultManager);
  uint64_t v21 = (char *)v14 + *(int *)(v9 + 24);
  v21[4] = (v15 | 0x8000000000uLL) >> 32;
  *(_DWORD *)uint64_t v21 = v15 | a2;
  sub_24CA65B90((uint64_t)v14, v3 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180C48);
  uint64_t v22 = swift_allocObject();
  *(_DWORD *)(v22 + 32) = 0;
  uint64_t v23 = MEMORY[0x263F8EE80];
  *(void *)(v22 + 16) = 0;
  *(void *)(v22 + 24) = v23;
  *(void *)(v3 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180C60);
  uint64_t v24 = swift_allocObject();
  *(_DWORD *)(v24 + 40) = 0;
  uint64_t v25 = MEMORY[0x263F8EE78];
  *(void *)(v24 + 16) = 0;
  *(void *)(v24 + 24) = v25;
  *(void *)(v24 + 32) = v25;
  *(void *)(v3 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites) = v24;
  uint64_t v26 = v3 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA65B28(v26, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  if (_s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0())
  {
    char v27 = _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0();
    sub_24CA65BF4((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    if (v27)
    {
      uint64_t v28 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
      unint64_t v29 = v28 + 4;
      uint64_t v30 = v28 + 8;
      os_unfair_lock_lock(v28 + 8);
      sub_24CA65C54(v29);
      os_unfair_lock_unlock(v30);
    }
  }
  else
  {
    sub_24CA65BF4((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  }
  sub_24CA65BF4(a1, (uint64_t (*)(void))type metadata accessor for StorageContainer);
  return v3;
}

uint64_t sub_24CA5D6A8(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA65B28(v7, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  uint64_t v8 = sub_24CA54A18();
  sub_24CA65BF4((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

void sub_24CA5D798(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A38);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  if (*a1 && (uint64_t v11 = *(void *)(v10 + 16)) != 0)
  {
    uint64_t v12 = v10 + 16 * v11;
    uint64_t v13 = *(void *)(v12 + 16);
    uint64_t v14 = *(void *)(v12 + 24);
    uint64_t v15 = type metadata accessor for DataFrameStreamContainer();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
    swift_bridgeObjectRetain();
    sub_24CA5DD68(v13, v14, (uint64_t)a1, (uint64_t)v9, (void *)a3);
    sub_24CA66680((uint64_t)v9, &qword_26B180A38);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v16 = (void (*)(void))(a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container);
    swift_beginAccess();
    sub_24CA54D50();
    if (!v3)
    {
      sub_24CA5D9E4(v16, a1, a2, &v21);
      if (qword_26B1808C8 != -1) {
        swift_once();
      }
      id v17 = (uint64_t *)(qword_26B181238 + 16);
      id v18 = (os_unfair_lock_s *)(qword_26B181238 + 24);
      swift_retain();
      os_unfair_lock_lock(v18);
      sub_24CA65A64(v17);
      os_unfair_lock_unlock(v18);
      swift_release();
      swift_release();
      int v19 = v24;
      *(void *)a3 = v21;
      *(_OWORD *)(a3 + 8) = v22;
      *(_OWORD *)(a3 + 24) = v23;
      *(_DWORD *)(a3 + 40) = v19;
    }
    swift_endAccess();
  }
}

uint64_t sub_24CA5D9E4@<X0>(void (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  v24[3] = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A38);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a2 = (uint64_t)sub_24CA54A18();
  swift_bridgeObjectRelease();
  uint64_t v14 = *a2;
  if (*a2 && (uint64_t v15 = *(void *)(v14 + 16)) != 0)
  {
    v23[0] = a4;
    v23[1] = v4;
    uint64_t v16 = v14 + 16 * v15;
    uint64_t v18 = *(void *)(v16 + 16);
    uint64_t v17 = *(void *)(v16 + 24);
    uint64_t v19 = qword_26B180878;
    swift_bridgeObjectRetain();
    if (v19 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v11, (uint64_t)qword_26B181220);
    sub_24CA65B28(v20, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    v24[0] = 0;
    v24[1] = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    strcpy((char *)v24, "last segment: ");
    HIBYTE(v24[1]) = -18;
    sub_24CA86320();
    sub_24CA5A168(v24[0], v24[1], 0xD000000000000062, 0x800000024CA8A140, 0x655374736574616CLL, 0xEF2928746E656D67);
    swift_bridgeObjectRelease();
    sub_24CA65BF4((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    sub_24CA65B28((uint64_t)a1, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    uint64_t v21 = type metadata accessor for DataFrameStreamContainer();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v10, 0, 1, v21);
    sub_24CA5DD68(v18, v17, (uint64_t)a2, (uint64_t)v10, v23[0]);
    sub_24CA66680((uint64_t)v10, &qword_26B180A38);
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v11, (uint64_t)qword_26B181220);
    sub_24CA5A168(0xD000000000000010, 0x800000024CA8A4A0, 0xD000000000000062, 0x800000024CA8A140, 0x655374736574616CLL, 0xEF2928746E656D67);
    return sub_24CA5E3D8(a1, (uint64_t)a2, a4);
  }
}

double sub_24CA5DD68@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v60 = a4;
  uint64_t v61 = a3;
  uint64_t v62 = a1;
  uint64_t v63 = a2;
  int v55 = a5;
  uint64_t v5 = sub_24CA85F80();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_24CA86020();
  uint64_t v57 = *(void *)(v58 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v58);
  uint64_t v54 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v54 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v64 = (char *)&v54 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A38);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DataFrameStreamContainer();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA666DC(v60, (uint64_t)v17, &qword_26B180A38);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    uint64_t v22 = v56 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
    swift_beginAccess();
    sub_24CA65B28(v22, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA66680((uint64_t)v17, &qword_26B180A38);
  }
  else
  {
    sub_24CA65B90((uint64_t)v17, (uint64_t)v21);
  }
  *(void *)&long long v65 = 47;
  *((void *)&v65 + 1) = 0xE100000000000000;
  sub_24CA86320();
  sub_24CA86320();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F06E50], v5);
  sub_24CA4D0C8();
  uint64_t v23 = (uint64_t)v64;
  sub_24CA86010();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)(v61 + 8);
  if (*(void *)(v24 + 16) && (unint64_t v25 = sub_24CA75224(v23), (v26 & 1) != 0))
  {
    uint64_t v27 = *(void *)(v24 + 56) + 48 * v25;
    uint64_t v29 = *(void *)v27;
    uint64_t v28 = *(void *)(v27 + 8);
    uint64_t v30 = *(void *)(v27 + 16);
    uint64_t v31 = *(void *)(v27 + 24);
    uint64_t v32 = *(void *)(v27 + 32);
    uint64_t v33 = v23;
    int v34 = *(_DWORD *)(v27 + 40);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    v35(v33, v58);
    sub_24CA65BF4((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    char v37 = v55;
    *int v55 = v29;
    v37[1] = v28;
    v37[2] = v30;
    v37[3] = v31;
    v37[4] = v32;
    *((_DWORD *)v37 + 10) = v34;
  }
  else
  {
    uint64_t v38 = v57;
    uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
    uint64_t v40 = (uint64_t)v21;
    uint64_t v41 = v58;
    v39(v13, v23, v58);
    uint64_t v42 = v59;
    unsigned int v43 = sub_24CA53D00();
    if (v42)
    {
      int64_t v44 = *(void (**)(char *, uint64_t))(v38 + 8);
      v44(v13, v41);
      v44((char *)v23, v41);
      sub_24CA65BF4(v40, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    }
    else
    {
      unsigned int v45 = v43;
      uint64_t v60 = v40;
      char v69 = 1;
      uint64_t v46 = v63;
      swift_bridgeObjectRetain();
      DataFrameStreamSegment.init(name:filePath:byteSize:access:)(v62, v46, (uint64_t)v13, v45, &v69, (uint64_t)&v65);
      long long v67 = v65;
      v68[0] = v66[0];
      *(_OWORD *)((char *)v68 + 12) = *(_OWORD *)((char *)v66 + 12);
      uint64_t v47 = (uint64_t)v54;
      uint64_t v48 = v64;
      v39(v54, (uint64_t)v64, v41);
      sub_24CA663A0((uint64_t)&v67);
      uint64_t v49 = v61;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v65 = *(void *)(v49 + 8);
      *(void *)(v49 + 8) = 0x8000000000000000;
      sub_24CA64984(&v67, v47, isUniquelyReferenced_nonNull_native);
      *(void *)(v49 + 8) = v65;
      swift_bridgeObjectRelease();
      long long v51 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
      v51(v47, v41);
      v51((uint64_t)v48, v41);
      sub_24CA65BF4(v60, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
      long long v52 = v68[0];
      uint64_t v53 = v55;
      *(_OWORD *)int v55 = v67;
      *((_OWORD *)v53 + 1) = v52;
      double result = *(double *)((char *)v68 + 12);
      *(_OWORD *)((char *)v53 + 28) = *(_OWORD *)((char *)v68 + 12);
    }
  }
  return result;
}

uint64_t sub_24CA5E3D8@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v33 = a2;
  int v34 = a1;
  uint64_t v5 = sub_24CA86020();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v32 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v29 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v29 - v12;
  if (qword_26B180878 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B181220);
  sub_24CA5A168(0, 0xE000000000000000, 0xD000000000000062, 0x800000024CA8A140, 0xD00000000000001ELL, 0x800000024CA8A480);
  CFAbsoluteTimeGetCurrent();
  uint64_t v15 = sub_24CA86470();
  uint64_t v17 = v16;
  sub_24CA543E4((uint64_t)v13);
  if (v3) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v30 = a3;
  uint64_t v19 = (uint64_t)v11;
  uint64_t v20 = v13;
  uint64_t v21 = *(void (**)(void))(v6 + 16);
  uint64_t v31 = v19;
  v21();
  unsigned int v22 = sub_24CA53D00();
  int v34 = v21;
  char v39 = 1;
  DataFrameStreamSegment.init(name:filePath:byteSize:access:)(v15, v17, v31, v22, &v39, (uint64_t)&v35);
  long long v37 = v35;
  v38[0] = v36[0];
  *(_OWORD *)((char *)v38 + 12) = *(_OWORD *)((char *)v36 + 12);
  uint64_t v23 = (uint64_t)v32;
  ((void (*)(char *, char *, uint64_t))v34)(v32, v20, v5);
  sub_24CA663A0((uint64_t)&v37);
  uint64_t v24 = v33;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v35 = *(void *)(v24 + 8);
  *(void *)(v24 + 8) = 0x8000000000000000;
  sub_24CA64984(&v37, v23, isUniquelyReferenced_nonNull_native);
  *(void *)(v24 + 8) = v35;
  swift_bridgeObjectRelease();
  char v26 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v26(v23, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v26)(v20, v5);
  long long v27 = v38[0];
  uint64_t v28 = v30;
  *uint64_t v30 = v37;
  v28[1] = v27;
  *(_OWORD *)((char *)v28 + 28) = *(_OWORD *)((char *)v38 + 12);
  return result;
}

void sub_24CA5E724(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v30 = a3;
  uint64_t v35 = a4;
  uint64_t v28 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A38);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DataFrameStreamContainer();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void (*)(void))(a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container);
  swift_beginAccess();
  sub_24CA65B28((uint64_t)v14, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  uint64_t v15 = sub_24CA54A18();
  sub_24CA65BF4((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  swift_bridgeObjectRelease();
  *a1 = (uint64_t)v15;
  if (v15 && (uint64_t v16 = v15[2]) != 0)
  {
    uint64_t v17 = &v15[2 * v16];
    uint64_t v18 = v17[2];
    uint64_t v19 = v17[3];
    BOOL v20 = v18 == v30 && v19 == v35;
    if (v20 || (sub_24CA866A0() & 1) != 0)
    {
      swift_beginAccess();
      uint64_t v21 = v29;
      sub_24CA54D50();
      if (!v21)
      {
        sub_24CA5EA8C(v14, a1, v30, v35, &v31);
        if (qword_26B1808C8 != -1) {
          swift_once();
        }
        uint64_t v23 = (uint64_t *)(qword_26B181238 + 16);
        uint64_t v24 = (os_unfair_lock_s *)(qword_26B181238 + 24);
        swift_retain();
        os_unfair_lock_lock(v24);
        sub_24CA65A64(v23);
        os_unfair_lock_unlock(v24);
        swift_release();
        swift_release();
        int v25 = v34;
        char v26 = v28;
        *uint64_t v28 = v31;
        *(_OWORD *)(v26 + 1) = v32;
        *(_OWORD *)(v26 + 3) = v33;
        *((_DWORD *)v26 + 10) = v25;
      }
      swift_endAccess();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      swift_bridgeObjectRetain();
      sub_24CA5DD68(v18, v19, (uint64_t)a1, (uint64_t)v9, v28);
      sub_24CA66680((uint64_t)v9, &qword_26B180A38);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_24CA59B64();
    swift_allocError();
    *unsigned int v22 = 0;
    swift_willThrow();
  }
}

uint64_t sub_24CA5EA8C@<X0>(void (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A38);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a2 = (uint64_t)sub_24CA54A18();
  swift_bridgeObjectRelease();
  uint64_t v14 = *a2;
  if (!*a2 || (uint64_t v15 = *(void *)(v14 + 16)) == 0)
  {
    sub_24CA59B64();
    swift_allocError();
    *BOOL v20 = 0;
    return swift_willThrow();
  }
  uint64_t v40 = a5;
  uint64_t v16 = v14 + 16 * v15;
  uint64_t v17 = *(void *)(v16 + 24);
  uint64_t v46 = *(void *)(v16 + 16);
  sub_24CA65B28((uint64_t)a1, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  uint64_t v18 = type metadata accessor for DataFrameStreamContainer();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v13, 0, 1, v18);
  swift_bridgeObjectRetain();
  sub_24CA5DD68(a3, a4, (uint64_t)a2, (uint64_t)v13, &v41);
  sub_24CA66680((uint64_t)v13, &qword_26B180A38);
  if (v5) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v21 = *((void *)&v42 + 1);
  uint64_t v39 = v42;
  uint64_t v23 = v43;
  uint64_t v22 = v44;
  if (v46 == a3 && v17 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v37 = v41;
    int v38 = v45;
    char v25 = sub_24CA866A0();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v25 & 1) == 0)
    {
      char v26 = v40;
      uint64_t v27 = v39;
      *uint64_t v40 = v37;
      v26[1] = v27;
      v26[2] = v21;
      v26[3] = v23;
      v26[4] = v22;
      *((_DWORD *)v26 + 10) = v38;
      return result;
    }
  }
  uint64_t result = sub_24CA5E3D8(a1, (uint64_t)a2, &v41);
  uint64_t v28 = v40;
  uint64_t v29 = *(void *)(v23 + 16);
  uint64_t v30 = *(void *)(v29 + 24);
  uint64_t v31 = *(unsigned int *)(v29 + 16);
  BOOL v32 = __CFADD__(v30, v31);
  unint64_t v33 = v30 + v31;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    uint64_t v34 = v43;
    atomic_store(v33, (unint64_t *)(*(void *)(v43 + 16) + 24));
    swift_release();
    swift_release();
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v35 = v44;
    int v36 = v45;
    *uint64_t v28 = v41;
    *(_OWORD *)(v28 + 1) = v42;
    v28[3] = v34;
    v28[4] = v35;
    *((_DWORD *)v28 + 10) = v36;
  }
  return result;
}

uint64_t sub_24CA5ED74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  return sub_24CA60850(a1, a2, a3, a4);
}

uint64_t sub_24CA5ED8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a4;
  uint64_t v5 = sub_24CA86020();
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = type metadata accessor for InternalLogger();
  v4[13] = swift_task_alloc();
  v4[14] = type metadata accessor for DataFrameStreamContainer();
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CA5EEC8, 0, 0);
}

uint64_t sub_24CA5EEC8()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[18] = Strong;
  if (Strong)
  {
    uint64_t v2 = Strong;
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v3 = v0[17];
    v0[19] = __swift_project_value_buffer(v0[12], (uint64_t)qword_26B181220);
    sub_24CA5A168(0xD000000000000020, 0x800000024CA8A4F0, 0xD000000000000062, 0x800000024CA8A140, 0xD000000000000023, 0x800000024CA8A520);
    uint64_t v4 = OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
    v0[20] = OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
    uint64_t v5 = v2 + v4;
    swift_beginAccess();
    sub_24CA65B28(v5, v3, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    v0[21] = type metadata accessor for StorageContainer();
    uint64_t v6 = sub_24CA86260();
    uint64_t v8 = v7;
    if (v6 == sub_24CA86260() && v8 == v9)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v11 = sub_24CA866A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_24CA65BF4(v0[17], (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
        return MEMORY[0x270FA2498](sub_24CA5F310, 0, 0);
      }
    }
    uint64_t v15 = (uint64_t (__cdecl *)())((char *)&dword_269807CA0 + dword_269807CA0);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[22] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_24CA5F1E4;
    return v15();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_24CA5F1E4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  sub_24CA65BF4(*(void *)(v1 + 136), (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  return MEMORY[0x270FA2498](sub_24CA5F310, 0, 0);
}

uint64_t sub_24CA5F310()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[18] + v0[20];
  sub_24CA5A168(0xD000000000000016, 0x800000024CA8A550, 0xD000000000000062, 0x800000024CA8A140, 0xD000000000000023, 0x800000024CA8A520);
  sub_24CA65B28(v2, v1, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  BOOL v3 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  uint64_t v4 = v0[16];
  if (v3)
  {
    char v5 = _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0();
    sub_24CA65BF4(v4, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    if (v5)
    {
      uint64_t v6 = *(void *)(v0[18] + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
      swift_retain();
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 40));
      sub_24CA66740((void *)(v6 + 16));
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 40));
      swift_release();
      swift_release();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24CA65BF4(v0[16], (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  }
  uint64_t v7 = v0[14];
  uint64_t v8 = v0[15];
  uint64_t v9 = v0[13];
  uint64_t v11 = v0[10];
  uint64_t v10 = v0[11];
  uint64_t v12 = v0[9];
  uint64_t v13 = v0[18] + v0[20];
  sub_24CA65B28(v0[19], v9, (uint64_t (*)(void))type metadata accessor for InternalLogger);
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  sub_24CA65B28(v13, v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v8 + *(int *)(v7 + 20), v12);
  sub_24CA65BF4(v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  sub_24CA66450((unint64_t *)&qword_26B180898, MEMORY[0x263F06EA8]);
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  sub_24CA5A180(0xD00000000000001ELL, 0x800000024CA8A570, 0xD000000000000062, 0x800000024CA8A140, 0xD000000000000023, 0x800000024CA8A520);
  swift_bridgeObjectRelease();
  swift_release();
  sub_24CA65BF4(v9, (uint64_t (*)(void))type metadata accessor for InternalLogger);
LABEL_6:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24CA5F6F0(void *a1, uint64_t a2)
{
  uint64_t v34 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269807A70);
  uint64_t v29 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B180878 != -1) {
    swift_once();
  }
  uint64_t v27 = v4;
  uint64_t v28 = v6;
  uint64_t v32 = __swift_project_value_buffer(v7, (uint64_t)qword_26B181220);
  sub_24CA65B28(v32, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for InternalLogger);
  uint64_t v35 = 0;
  unint64_t v36 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  uint64_t v35 = 0x676E696873756C46;
  unint64_t v36 = 0xE900000000000020;
  uint64_t v37 = *(void *)(a1[1] + 16);
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA86320();
  unint64_t v30 = 0x800000024CA8A520;
  uint64_t v31 = 0x800000024CA8A140;
  sub_24CA5A168(v35, v36, 0xD000000000000062, 0x800000024CA8A140, 0xD000000000000023, 0x800000024CA8A520);
  swift_bridgeObjectRelease();
  uint64_t v10 = (uint64_t)v9;
  sub_24CA65BF4((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for InternalLogger);
  uint64_t v11 = a1[1];
  uint64_t v12 = *(void *)(v11 + 16);
  unint64_t v33 = a1;
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = (unint64_t *)(v11 + 40);
    while (1)
    {
      uint64_t v15 = *(v13 - 1);
      unint64_t v14 = *v13;
      sub_24CA497DC(v15, *v13);
      sub_24CA5FB94(v15, v14);
      if (v2) {
        break;
      }
      v13 += 2;
      sub_24CA4986C(v15, v14);
      if (!--v12)
      {
        swift_bridgeObjectRelease();
        a1 = v33;
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    return sub_24CA4986C(v15, v14);
  }
  else
  {
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v16 = MEMORY[0x263F8EE78];
    a1[1] = MEMORY[0x263F8EE78];
    sub_24CA65B28(v32, v10, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v35 = 0;
    unint64_t v36 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v35 = 0x676E696D75736552;
    unint64_t v36 = 0xE900000000000020;
    uint64_t v37 = *(void *)(a1[2] + 16);
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA86320();
    sub_24CA5A168(v35, v36, 0xD000000000000062, v31, 0xD000000000000023, v30);
    swift_bridgeObjectRelease();
    sub_24CA65BF4(v10, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v17 = a1[2];
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18)
    {
      uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
      uint64_t v20 = v17 + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80));
      uint64_t v21 = *(void *)(v29 + 72);
      uint64_t v22 = (void (**)(char *, uint64_t))(v29 + 8);
      uint64_t v34 = v17;
      swift_bridgeObjectRetain();
      uint64_t v24 = v27;
      uint64_t v23 = v28;
      do
      {
        v19(v23, v20, v24);
        sub_24CA86440();
        (*v22)(v23, v24);
        v20 += v21;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
      char v25 = v33;
      uint64_t v16 = MEMORY[0x263F8EE78];
    }
    else
    {
      char v25 = v33;
    }
    swift_bridgeObjectRelease();
    long long v25[2] = v16;
    uint64_t result = swift_release();
    *char v25 = 0;
  }
  return result;
}

int64_t sub_24CA5FB94(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  uint64_t v10 = v9 + 8;
  uint64_t v11 = (uint64_t *)&v9[4];
  os_unfair_lock_lock(v9 + 8);
  sub_24CA66518(v11, (uint64_t)&v15);
  if (v3)
  {
    os_unfair_lock_unlock(v10);
  }
  else
  {
    v13[6] = v8;
    v13[7] = v10;
    v13[8] = v6;
    uint64_t v14 = a1;
    v13[3] = 0x800000024CA8A140;
    v13[4] = 0x800000024CA8A440;
    v13[1] = a2;
    v13[2] = 0x800000024CA8A460;
    v13[5] = v11;
    os_unfair_lock_unlock(v10);
    int64_t v2 = DataFrameStreamSegment.append(data:compressed:)(v14, a2, 0);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_24CA5FF58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA666DC(a1, (uint64_t)v7, &qword_26B1808D0);
  uint64_t v8 = sub_24CA86460();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_24CA66680((uint64_t)v7, &qword_26B1808D0);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  else
  {
    sub_24CA86450();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v10 = sub_24CA86430();
  uint64_t v12 = v11;
  swift_unknownObjectRelease();
  if (v12 | v10)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v10;
    v14[3] = v12;
  }
  return swift_task_create();
}

uint64_t sub_24CA60128@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v28 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1) {
    goto LABEL_5;
  }
  uint64_t v27 = v5;
  uint64_t v16 = a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA65B28(v16, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  LOBYTE(v16) = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  uint64_t result = sub_24CA65BF4((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  if ((v16 & 1) == 0)
  {
    type metadata accessor for OSTransaction();
    swift_allocObject();
    uint64_t v18 = sub_24CA667E8("com.apple.dendrite.pending-writes", 33, 2);
    swift_release();
    *a1 = v18;
    uint64_t v19 = sub_24CA86460();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v12, 1, 1, v19);
    uint64_t v20 = swift_allocObject();
    swift_weakInit();
    uint64_t v21 = (void *)swift_allocObject();
    id v21[2] = 0;
    v21[3] = 0;
    v21[4] = v20;
    sub_24CA5FF58((uint64_t)v12, (uint64_t)&unk_269807A80, (uint64_t)v21);
    swift_release();
    uint64_t result = sub_24CA66680((uint64_t)v12, &qword_26B1808D0);
  }
  if (*a1)
  {
LABEL_5:
    uint64_t v22 = (void *)a1[1];
    sub_24CA497DC(a3, a4);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_24CA82AA0(0, v22[2] + 1, 1, v22);
      uint64_t v22 = (void *)result;
    }
    unint64_t v24 = v22[2];
    unint64_t v23 = v22[3];
    if (v24 >= v23 >> 1)
    {
      uint64_t result = (uint64_t)sub_24CA82AA0((void *)(v23 > 1), v24 + 1, 1, v22);
      uint64_t v22 = (void *)result;
    }
    char v25 = 0;
    v22[2] = v24 + 1;
    char v26 = &v22[2 * v24];
    v26[4] = a3;
    v26[5] = a4;
    a1[1] = (uint64_t)v22;
  }
  else
  {
    char v25 = 1;
  }
  *uint64_t v28 = v25;
  return result;
}

uint64_t sub_24CA60428@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_24CA60750(a1, a2, a3);
}

uint64_t DataFrameStream.prune(each:)(uint64_t (*a1)(uint64_t, void, void, unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807A50);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = 0;
  *(unsigned char *)(inited + 16) = 1;
  type metadata accessor for DataFrameStream.Iterator();
  uint64_t v4 = swift_initStackObject();
  *(void *)(v4 + 32) = 0;
  uint64_t v16 = (uint64_t *)(v4 + 32);
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 48) = 0;
  *(_DWORD *)(v4 + 56) = 0;
  *(void *)(v4 + 16) = v1;
  *(unsigned char *)(v4 + 24) = 0;
  *(void *)(inited + 24) = v4;
  swift_retain();
  swift_retain();
  uint64_t v15 = (void *)(inited + 32);
  swift_beginAccess();
  do
  {
    sub_24CA57684(&v17);
    unint64_t v5 = v19;
    if ((unint64_t)v19 >> 60 == 15) {
      break;
    }
    long long v6 = v18;
    uint64_t v7 = v17;
    uint64_t v8 = v17;
    sub_24CA497DC(*((uint64_t *)&v18 + 1), v19);
    __int16 v9 = a1(v7, v6, *((void *)&v6 + 1), v5);
    sub_24CA52660(v8, v6, *((uint64_t *)&v6 + 1), v5);
    if (v9)
    {
      uint64_t v10 = *v16;
      if (*v16)
      {
        if ((*(unsigned char *)(v10 + 80) & 1) == 0)
        {
          int v12 = *(_DWORD *)(v10 + 72);
          Swift::UInt32 v11 = *(_DWORD *)(v10 + 76);
          uint64_t v17 = *(void *)(v10 + 32);
          long long v13 = *(_OWORD *)(v10 + 56);
          long long v18 = *(_OWORD *)(v10 + 40);
          long long v19 = v13;
          int v20 = v12;
          if (DataFrameStreamSegment.deleteFrame(index:)(v11))
          {
            if (*v15 == -1)
            {
              __break(1u);
              break;
            }
            ++*v15;
          }
        }
      }
    }
    sub_24CA52660(v8, v6, *((uint64_t *)&v6 + 1), v5);
  }
  while ((v9 & 0x100) != 0);
  swift_release();
  return swift_release();
}

uint64_t sub_24CA60750@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA65B28(v9, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  uint64_t v10 = sub_24CA54A18();
  sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  swift_bridgeObjectRelease();
  *a1 = v10;
  *a3 = v10;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CA60850@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A38);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DataFrameStreamContainer();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_24CA5DD68(a2, a3, a1, (uint64_t)v10, a4);
  return sub_24CA66680((uint64_t)v10, &qword_26B180A38);
}

uint64_t sub_24CA60960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v19[1] = a3;
  uint64_t v20 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (uint64_t)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = sub_24CA85F80();
  uint64_t v5 = *(void *)(v19[0] - 8);
  MEMORY[0x270FA5388](v19[0]);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24CA86020();
  uint64_t v26 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA65B28(a2, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  uint64_t v24 = 47;
  uint64_t v25 = 0xE100000000000000;
  sub_24CA86320();
  sub_24CA86320();
  uint64_t v13 = v19[0];
  (*(void (**)(char *, void, void))(v5 + 104))(v7, *MEMORY[0x263F06E50], v19[0]);
  sub_24CA4D0C8();
  sub_24CA86010();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v13);
  swift_bridgeObjectRelease();
  sub_24CA65BF4((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  sub_24CA7C4F8((uint64_t)v12, (uint64_t)&v24);
  sub_24CA664B4(v24, v25);
  if (qword_26B180878 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v20, (uint64_t)qword_26B181220);
  uint64_t v15 = v22;
  sub_24CA65B28(v14, v22, (uint64_t (*)(void))type metadata accessor for InternalLogger);
  uint64_t v24 = 0;
  uint64_t v25 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  uint64_t v24 = 0xD000000000000017;
  uint64_t v25 = 0x800000024CA8A400;
  sub_24CA66450((unint64_t *)&qword_26B180898, MEMORY[0x263F06EA8]);
  uint64_t v16 = v21;
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168(v24, v25, 0xD000000000000062, 0x800000024CA8A140, 0x29286D7575636176, 0xE800000000000000);
  swift_bridgeObjectRelease();
  sub_24CA65BF4(v15, (uint64_t (*)(void))type metadata accessor for InternalLogger);
  uint64_t v17 = v23;
  sub_24CA761F0();
  if (v17)
  {
    sub_24CA65B28(v14, v15, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v24 = 0;
    uint64_t v25 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v24 = 0xD00000000000001FLL;
    uint64_t v25 = 0x800000024CA8A420;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA5A180(v24, v25, 0xD000000000000062, 0x800000024CA8A140, 0x29286D7575636176, 0xE800000000000000);
    swift_bridgeObjectRelease();

    sub_24CA65BF4(v15, (uint64_t (*)(void))type metadata accessor for InternalLogger);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v12, v16);
}

uint64_t sub_24CA60EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = a1 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a1 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v13 = 0;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    long long v19 = (void *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v20 = v19[1];
    v22[0] = *v19;
    v22[1] = v20;
    swift_bridgeObjectRetain();
    sub_24CA60960((uint64_t)v22, a2, a3);
    if (v3)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v13++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v11) {
      return swift_release();
    }
    unint64_t v17 = *(void *)(v7 + 8 * v13);
    if (!v17)
    {
      int64_t v18 = v13 + 1;
      if (v13 + 1 >= v11) {
        return swift_release();
      }
      unint64_t v17 = *(void *)(v7 + 8 * v18);
      if (v17) {
        goto LABEL_14;
      }
      int64_t v18 = v13 + 2;
      if (v13 + 2 >= v11) {
        return swift_release();
      }
      unint64_t v17 = *(void *)(v7 + 8 * v18);
      if (v17) {
        goto LABEL_14;
      }
      int64_t v18 = v13 + 3;
      if (v13 + 3 >= v11) {
        return swift_release();
      }
      unint64_t v17 = *(void *)(v7 + 8 * v18);
      if (v17)
      {
LABEL_14:
        int64_t v13 = v18;
        goto LABEL_15;
      }
      int64_t v21 = v13 + 4;
      if (v13 + 4 >= v11) {
        return swift_release();
      }
      unint64_t v17 = *(void *)(v7 + 8 * v21);
      v13 += 4;
      if (!v17) {
        break;
      }
    }
LABEL_15:
    unint64_t v10 = (v17 - 1) & v17;
  }
  while (1)
  {
    int64_t v13 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v13 >= v11) {
      return swift_release();
    }
    unint64_t v17 = *(void *)(v7 + 8 * v13);
    ++v21;
    if (v17) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DataFrameStream.deleteFrame(forIdentifier:)(Swift::UInt64 forIdentifier)
{
  Swift::UInt64 v40 = forIdentifier;
  uint64_t v41 = sub_24CA86020();
  uint64_t v39 = *(os_unfair_lock_s **)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v3 = (char *)v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (os_unfair_lock_s *)((char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA65B28(v9, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  BOOL v10 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  if (!v10)
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v31 = __swift_project_value_buffer(v4, (uint64_t)qword_26B181220);
    uint64_t v32 = (uint64_t)v37;
    sub_24CA65B28(v31, (uint64_t)v37, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v42 = 0;
    uint64_t v43 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v42 = 0xD000000000000018;
    uint64_t v43 = 0x800000024CA89CF0;
    sub_24CA65B28(v9, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    uint64_t v33 = (uint64_t)v39;
    uint64_t v34 = v41;
    (*(void (**)(char *, char *, uint64_t))&v39[4]._os_unfair_lock_opaque)(v3, &v8[*(int *)(v6 + 20)], v41);
    sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA66450((unint64_t *)&qword_26B180898, MEMORY[0x263F06EA8]);
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v3, v34);
    sub_24CA5A180(v42, v43, 0xD000000000000062, 0x800000024CA8A140, 0xD00000000000001BLL, 0x800000024CA8A360);
    swift_bridgeObjectRelease();
    sub_24CA65BF4(v32, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    LOBYTE(v21) = 0;
    return v21 & 1;
  }
  int64_t v11 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  uint64_t v12 = v11 + 4;
  int64_t v13 = v11 + 8;
  os_unfair_lock_lock(v11 + 8);
  uint64_t v39 = v12;
  uint64_t v14 = v48;
  sub_24CA658BC(v12, &v42);
  if (!v14)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v1;
    os_unfair_lock_unlock(v13);
    uint64_t v17 = v42;
    if (v42)
    {
      uint64_t v18 = *(void *)(v42 + 16);
      if (v18)
      {
        v36[1] = v42;
        uint64_t v37 = v13;
        long long v19 = (uint64_t *)(v42 + 40);
        uint64_t v38 = v1;
        while (1)
        {
          uint64_t v20 = *v19;
          MEMORY[0x270FA5388](v17);
          int64_t v21 = &v36[-6];
          v36[-4] = v16;
          v36[-3] = v22;
          v36[-2] = v20;
          swift_bridgeObjectRetain();
          os_unfair_lock_lock(v13);
          sub_24CA6675C((uint64_t)v39, &v42);
          os_unfair_lock_unlock(v13);
          swift_bridgeObjectRelease();
          if (v15) {
            break;
          }
          uint64_t v48 = 0;
          uint64_t v23 = v42;
          uint64_t v25 = v44;
          uint64_t v24 = v45;
          uint64_t v26 = v46;
          int v27 = v47;
          uint64_t v41 = v43;
          uint64_t v28 = sub_24CA6C93C(v40);
          Swift::UInt32 v30 = v28;
          if (v29 == 1)
          {
            Swift::UInt64 v40 = v28;
          }
          else if (v29 != 2)
          {
            swift_bridgeObjectRelease();
            uint64_t v42 = v23;
            uint64_t v43 = v41;
            uint64_t v44 = v25;
            uint64_t v45 = v24;
            uint64_t v46 = v26;
            int v47 = v27;
            LOBYTE(v21) = DataFrameStreamSegment.deleteFrame(index:)(v30);
            swift_release();
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
            return v21 & 1;
          }
          v19 += 2;
          swift_release();
          swift_release();
          swift_release();
          uint64_t v17 = swift_bridgeObjectRelease();
          --v18;
          uint64_t v15 = v48;
          int64_t v13 = v37;
          uint64_t v16 = v38;
          if (!v18) {
            goto LABEL_16;
          }
        }
        swift_bridgeObjectRelease();
        return v21 & 1;
      }
LABEL_16:
      swift_bridgeObjectRelease();
    }
    LOBYTE(v21) = 0;
    return v21 & 1;
  }
  os_unfair_lock_unlock(v13);
  __break(1u);
  return result;
}

void DataFrameStream.mutateFrame(forIdentifier:_:)(unint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  Swift::UInt64 v40 = a2;
  uint64_t v41 = a3;
  unint64_t v47 = a1;
  uint64_t v43 = a4;
  p_os_unfair_lock_opaque = (void *)sub_24CA86020();
  uint64_t v42 = *(p_os_unfair_lock_opaque - 1);
  MEMORY[0x270FA5388](p_os_unfair_lock_opaque);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v7);
  uint64_t v44 = (os_unfair_lock_s *)((char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v9);
  int64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA65B28(v12, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  BOOL v13 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_24CA65BF4((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  if (!v13)
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v7, (uint64_t)qword_26B181220);
    uint64_t v34 = (uint64_t)v44;
    sub_24CA65B28(v33, (uint64_t)v44, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    *(void *)&long long v48 = 0;
    *((void *)&v48 + 1) = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    *(void *)&long long v48 = 0xD000000000000018;
    *((void *)&v48 + 1) = 0x800000024CA89CF0;
    sub_24CA65B28(v12, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    uint64_t v35 = &v11[*(int *)(v9 + 20)];
    uint64_t v36 = v42;
    uint64_t v37 = (uint64_t)p_os_unfair_lock_opaque;
    (*(void (**)(char *, char *, void *))(v42 + 16))(v6, v35, p_os_unfair_lock_opaque);
    sub_24CA65BF4((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA66450((unint64_t *)&qword_26B180898, MEMORY[0x263F06EA8]);
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v37);
    sub_24CA5A180(v48, *((unint64_t *)&v48 + 1), 0xD000000000000062, 0x800000024CA8A140, 0xD00000000000001DLL, 0x800000024CA8A380);
    swift_bridgeObjectRelease();
    sub_24CA65BF4(v34, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    goto LABEL_16;
  }
  uint64_t v14 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  uint64_t v15 = v14 + 4;
  uint64_t v16 = v14 + 8;
  os_unfair_lock_lock(v14 + 8);
  p_os_unfair_lock_opaque = &v15->_os_unfair_lock_opaque;
  uint64_t v17 = v53;
  sub_24CA658BC(v15, &v48);
  if (v17)
  {
    os_unfair_lock_unlock(v16);
    __break(1u);
    return;
  }
  uint64_t v18 = v4;
  os_unfair_lock_unlock(v16);
  if (!(void)v48)
  {
LABEL_16:
    uint64_t v38 = v43;
    *uint64_t v43 = 0;
    *((unsigned char *)v38 + 8) = 1;
    return;
  }
  uint64_t v53 = 0;
  uint64_t v20 = *(void *)(v48 + 16);
  uint64_t v42 = v48;
  if (!v20)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  int64_t v21 = (uint64_t *)(v48 + 40);
  uint64_t v44 = v16;
  uint64_t v45 = v4;
  while (1)
  {
    uint64_t v22 = *v21;
    MEMORY[0x270FA5388](v19);
    *(&v39 - 4) = v18;
    *(&v39 - 3) = v23;
    *(&v39 - 2) = v22;
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v16);
    uint64_t v24 = v53;
    sub_24CA6675C((uint64_t)p_os_unfair_lock_opaque, &v48);
    os_unfair_lock_unlock(v16);
    swift_bridgeObjectRelease();
    uint64_t v53 = v24;
    if (v24) {
      break;
    }
    long long v25 = v48;
    uint64_t v26 = v49;
    uint64_t v27 = v50;
    uint64_t v28 = v51;
    int v29 = v52;
    uint64_t v30 = sub_24CA6C93C(v47);
    unsigned int v32 = v30;
    if (v31 == 1)
    {
      unint64_t v47 = v30;
    }
    else if (v31 != 2)
    {
      swift_bridgeObjectRelease();
      long long v48 = v25;
      uint64_t v49 = v26;
      uint64_t v50 = v27;
      uint64_t v51 = v28;
      int v52 = v29;
      swift_retain();
      sub_24CA6CF04(v32, v40, v41, &v48, (uint64_t)v43);
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return;
    }
    v21 += 2;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v19 = swift_bridgeObjectRelease();
    --v20;
    uint64_t v16 = v44;
    uint64_t v18 = v45;
    if (!v20) {
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
}

void sub_24CA61B7C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(os_unfair_lock_s **)(a3 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  uint64_t v7 = (uint64_t *)&v6[4];
  uint64_t v8 = v6 + 10;
  os_unfair_lock_lock(v6 + 10);
  sub_24CA66774(v7, &v9);
  os_unfair_lock_unlock(v8);
  if (v3) {
    __break(1u);
  }
  else {
    sub_24CA5FB94(a1, a2);
  }
}

void sub_24CA61C58(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *(os_unfair_lock_s **)(a1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  uint64_t v7 = (uint64_t *)&v6[4];
  uint64_t v8 = v6 + 10;
  os_unfair_lock_lock(v6 + 10);
  sub_24CA66774(v7, &v9);
  os_unfair_lock_unlock(v8);
  if (v3) {
    __break(1u);
  }
  else {
    sub_24CA5FB94(a2, a3);
  }
}

uint64_t DataFrameStream.dataAvailable()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24CA61D54, 0, 0);
}

uint64_t sub_24CA61D54()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_24CA61E30;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24CA61E30()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CA61F2C, 0, 0);
}

uint64_t sub_24CA61F2C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_24CA61F40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(os_unfair_lock_s **)(a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  uint64_t v3 = v2 + 4;
  uint64_t v4 = v2 + 10;
  os_unfair_lock_lock(v2 + 10);
  sub_24CA66498(v3);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_24CA61FA4(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269807A70);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*a1) {
    return sub_24CA86440();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  unint64_t v8 = a1[2];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v8 = sub_24CA82830(0, *(void *)(v8 + 16) + 1, 1, v8);
  }
  unint64_t v10 = *(void *)(v8 + 16);
  unint64_t v9 = *(void *)(v8 + 24);
  if (v10 >= v9 >> 1) {
    unint64_t v8 = sub_24CA82830(v9 > 1, v10 + 1, 1, v8);
  }
  *(void *)(v8 + 16) = v10 + 1;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v10, v7, v4);
  a1[2] = v8;
  return result;
}

unint64_t DataFrameStream.frameCount.getter()
{
  uint64_t v1 = sub_24CA86020();
  uint64_t v42 = *(char **)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v39);
  uint64_t v5 = (uint64_t *)((char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (os_unfair_lock_s *)((char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_24CA65B28(v9, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  BOOL v10 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  if (!v10)
  {
    if (qword_26B180878 != -1) {
LABEL_23:
    }
      swift_once();
    uint64_t v29 = __swift_project_value_buffer(v39, (uint64_t)qword_26B181220);
    sub_24CA65B28(v29, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    uint64_t v44 = 0;
    uint64_t v45 = (os_unfair_lock_s *)0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v44 = 0xD000000000000018;
    uint64_t v45 = (os_unfair_lock_s *)0x800000024CA89CF0;
    sub_24CA65B28(v9, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    uint64_t v30 = v42;
    (*((void (**)(char *, char *, uint64_t))v42 + 2))(v3, (char *)v8 + *(int *)(v6 + 20), v1);
    sub_24CA65BF4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
    sub_24CA66450((unint64_t *)&qword_26B180898, MEMORY[0x263F06EA8]);
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    (*((void (**)(char *, uint64_t))v30 + 1))(v3, v1);
    sub_24CA5A180(v44, (unint64_t)v45, 0xD000000000000062, 0x800000024CA8A140, 0x756F43656D617266, 0xEA0000000000746ELL);
    swift_bridgeObjectRelease();
    sub_24CA65BF4((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for InternalLogger);
    goto LABEL_13;
  }
  int64_t v11 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  uint64_t v12 = v11 + 4;
  BOOL v13 = v11 + 8;
  os_unfair_lock_lock(v11 + 8);
  uint64_t v41 = v12;
  uint64_t v14 = 0;
  sub_24CA658BC(v12, &v44);
  os_unfair_lock_t v40 = v13;
  os_unfair_lock_unlock(v13);
  uint64_t v15 = v44;
  if (v44)
  {
    uint64_t v16 = *(void *)(v44 + 16);
    if (v16)
    {
      uint64_t v17 = v0;
      uint64_t v37 = v5;
      uint64_t v38 = v44;
      LODWORD(v18) = 0;
      uint64_t v5 = (void *)(v44 + 40);
      while (1)
      {
        uint64_t v19 = *v5;
        MEMORY[0x270FA5388](v15);
        *(&v36 - 4) = v17;
        *(&v36 - 3) = v20;
        *(&v36 - 2) = v19;
        swift_bridgeObjectRetain();
        int64_t v21 = v40;
        os_unfair_lock_lock(v40);
        sub_24CA6675C((uint64_t)v41, &v44);
        os_unfair_lock_unlock(v21);
        swift_bridgeObjectRelease();
        if (v14)
        {
          swift_bridgeObjectRelease();

          goto LABEL_13;
        }
        uint64_t v42 = 0;
        uint64_t v6 = v16;
        uint64_t v1 = v17;
        unint64_t v8 = v45;
        uint64_t v22 = v46;
        uint64_t v9 = v47;
        uint64_t v3 = v48;
        uint64_t v23 = *(void *)(v47 + 16);
        unsigned int v24 = *(_DWORD *)(v23 + 16);
        unsigned int v25 = *(_DWORD *)(v23 + 20);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
        swift_retain();
        unsigned int v26 = v25;
        BOOL v27 = v24 >= v25;
        unsigned int v28 = v24 - v25;
        if (!v27) {
          break;
        }
        swift_release_n();
        swift_release_n();
        swift_release_n();
        uint64_t v15 = swift_bridgeObjectRelease_n();
        BOOL v27 = __CFADD__(v18, v28);
        uint64_t v18 = v18 + v28;
        if (v27)
        {
          __break(1u);
          goto LABEL_23;
        }
        v5 += 2;
        uint64_t v16 = v6 - 1;
        uint64_t v17 = v1;
        uint64_t v14 = v42;
        if (v6 == 1)
        {
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
      }
      unsigned int v33 = v26;
      uint64_t v41 = v8;
      uint64_t v42 = v3;
      os_unfair_lock_t v40 = v22;
      if (qword_26B180878 != -1) {
        swift_once();
      }
      uint64_t v34 = __swift_project_value_buffer(v39, (uint64_t)qword_26B181220);
      uint64_t v35 = (uint64_t)v37;
      sub_24CA65B28(v34, (uint64_t)v37, (uint64_t (*)(void))type metadata accessor for InternalLogger);
      uint64_t v44 = 0;
      uint64_t v45 = (os_unfair_lock_s *)0xE000000000000000;
      sub_24CA865B0();
      sub_24CA86320();
      unsigned int v43 = v24;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA86320();
      unsigned int v43 = v33;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA5A180(v44, (unint64_t)v45, 0xD000000000000069, 0x800000024CA8A230, 0xD000000000000011, 0x800000024CA8A2A0);
      swift_bridgeObjectRelease();
      sub_24CA65BF4(v35, (uint64_t (*)(void))type metadata accessor for InternalLogger);
      swift_bridgeObjectRelease();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_bridgeObjectRelease_n();
LABEL_13:
      uint64_t v18 = 0;
      unsigned __int8 v31 = 1;
      goto LABEL_17;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v18 = 0;
LABEL_16:
  unsigned __int8 v31 = 0;
LABEL_17:
  LOBYTE(v44) = v31;
  return v18 | ((unint64_t)v31 << 32);
}

uint64_t DataFrameStream.deinit()
{
  sub_24CA65BF4(v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  swift_release();
  swift_release();
  return v0;
}

uint64_t DataFrameStream.__deallocating_deinit()
{
  sub_24CA65BF4(v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container, (uint64_t (*)(void))type metadata accessor for DataFrameStreamContainer);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

void sub_24CA6291C(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = *(os_unfair_lock_s **)(*v2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  uint64_t v7 = (uint64_t *)&v6[4];
  unint64_t v8 = v6 + 10;
  os_unfair_lock_lock(v6 + 10);
  sub_24CA66774(v7, &v9);
  os_unfair_lock_unlock(v8);
  if (v3) {
    __break(1u);
  }
  else {
    sub_24CA5FB94(a1, a2);
  }
}

uint64_t sub_24CA629F8(uint64_t (*a1)(uint64_t, void, void, unint64_t))
{
  return DataFrameStream.prune(each:)(a1);
}

void sub_24CA62A1C()
{
}

void sub_24CA62A40(unint64_t a1)
{
}

uint64_t sub_24CA62A64(void *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_24CA86720();
  uint64_t v6 = *(void *)(a2 + 16);
  sub_24CA86730();
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7)
  {
    uint64_t v8 = a2 + 32;
    do
    {
      v8 += 4;
      sub_24CA86750();
      --v7;
    }
    while (v7);
  }
  uint64_t result = sub_24CA86760();
  uint64_t v10 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v11 = result & ~v10;
  if ((*(void *)(v5 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v12 = ~v10;
    uint64_t v13 = v6 - 2;
    while (1)
    {
      uint64_t v14 = *(void *)(*(void *)(v5 + 48) + 8 * v11);
      if (*(void *)(v14 + 16) == v6)
      {
        if (!v6 || v14 == a2) {
          goto LABEL_22;
        }
        unint64_t v15 = *(void *)(a2 + 16);
        if (!v15) {
          goto LABEL_26;
        }
        if (*(_DWORD *)(v14 + 32) == *(_DWORD *)(a2 + 32))
        {
          if (v6 == 1) {
            goto LABEL_22;
          }
          BOOL v16 = v15 >= 2;
          unint64_t v17 = v15 - 2;
          if (!v16) {
            goto LABEL_27;
          }
          if (*(_DWORD *)(v14 + 36) == *(_DWORD *)(a2 + 36)) {
            break;
          }
        }
      }
LABEL_6:
      unint64_t v11 = (v11 + 1) & v12;
      if (((*(void *)(v5 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_23;
      }
    }
    if (v6 == 2)
    {
LABEL_22:
      swift_bridgeObjectRelease();
      *a1 = *(void *)(*(void *)(*v2 + 48) + 8 * v11);
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v18 = 0;
    uint64_t v19 = v14 + 40;
    while (v13 != v18)
    {
      if (v17 == v18) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(v19 + 4 * v18) != *(_DWORD *)(a2 + 4 * v18 + 40)) {
        goto LABEL_6;
      }
      if (v13 == ++v18) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
LABEL_23:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    uint64_t v21 = swift_bridgeObjectRetain();
    sub_24CA633F0(v21, v11, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v22;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  return result;
}

uint64_t sub_24CA62C60(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24CA86720();
  swift_bridgeObjectRetain();
  sub_24CA862F0();
  uint64_t v8 = sub_24CA86760();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24CA866A0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24CA866A0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24CA63604(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24CA62E10()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807A88);
  uint64_t result = sub_24CA86590();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    unsigned int v28 = (void *)(v2 + 56);
    uint64_t v6 = 1 << *(unsigned char *)(v2 + 32);
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v27 = (unint64_t)(v6 + 63) >> 6;
    uint64_t v9 = result + 56;
    while (1)
    {
      if (v8)
      {
        unint64_t v11 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v12 = v11 | (v5 << 6);
      }
      else
      {
        int64_t v13 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v13 >= v27) {
          goto LABEL_36;
        }
        unint64_t v14 = v28[v13];
        ++v5;
        if (!v14)
        {
          int64_t v5 = v13 + 1;
          if (v13 + 1 >= v27) {
            goto LABEL_36;
          }
          unint64_t v14 = v28[v5];
          if (!v14)
          {
            int64_t v5 = v13 + 2;
            if (v13 + 2 >= v27) {
              goto LABEL_36;
            }
            unint64_t v14 = v28[v5];
            if (!v14)
            {
              int64_t v15 = v13 + 3;
              if (v15 >= v27)
              {
LABEL_36:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v28, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unsigned int v28 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v14 = v28[v15];
              if (!v14)
              {
                while (1)
                {
                  int64_t v5 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_42;
                  }
                  if (v5 >= v27) {
                    goto LABEL_36;
                  }
                  unint64_t v14 = v28[v5];
                  ++v15;
                  if (v14) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v15;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
      }
      uint64_t v16 = *(void *)(*(void *)(v2 + 48) + 8 * v12);
      sub_24CA86720();
      sub_24CA86730();
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        uint64_t v18 = v16 + 32;
        do
        {
          v18 += 4;
          sub_24CA86750();
          --v17;
        }
        while (v17);
      }
      uint64_t result = sub_24CA86760();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v10 = __clz(__rbit64((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v9 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v10 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v9 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
      *(void *)(*(void *)(v4 + 48) + 8 * v10) = v16;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_24CA63110()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B17FA18);
  uint64_t v3 = sub_24CA86590();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24CA86720();
      sub_24CA862F0();
      uint64_t result = sub_24CA86760();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_24CA633F0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_24CA62E10();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (uint64_t)sub_24CA637A0();
        goto LABEL_30;
      }
      sub_24CA63B00();
    }
    uint64_t v8 = *v3;
    sub_24CA86720();
    uint64_t v9 = *(void *)(v5 + 16);
    sub_24CA86730();
    uint64_t v10 = *(void *)(v5 + 16);
    if (v10)
    {
      uint64_t v11 = v5 + 32;
      do
      {
        v11 += 4;
        sub_24CA86750();
        --v10;
      }
      while (v10);
    }
    uint64_t result = sub_24CA86760();
    uint64_t v12 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v12;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v13 = ~v12;
      while (1)
      {
        uint64_t v14 = *(void *)(*(void *)(v8 + 48) + 8 * a2);
        if (*(void *)(v14 + 16) == v9)
        {
          if (!v9 || v14 == v5) {
            goto LABEL_29;
          }
          unint64_t v15 = *(void *)(v5 + 16);
          if (!v15) {
            goto LABEL_34;
          }
          if (*(_DWORD *)(v14 + 32) == *(_DWORD *)(v5 + 32))
          {
            if (v9 == 1) {
              goto LABEL_29;
            }
            BOOL v16 = v15 >= 2;
            unint64_t v17 = v15 - 2;
            if (!v16) {
              goto LABEL_35;
            }
            if (*(_DWORD *)(v14 + 36) == *(_DWORD *)(v5 + 36)) {
              break;
            }
          }
        }
LABEL_13:
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_30;
        }
      }
      if (v9 == 2)
      {
LABEL_29:
        uint64_t result = sub_24CA866C0();
        __break(1u);
        goto LABEL_30;
      }
      int64_t v18 = (_DWORD *)(v14 + 40);
      uint64_t v19 = (unsigned int *)(v5 + 40);
      uint64_t v20 = v9 - 2;
      while (v20)
      {
        if (!v17) {
          goto LABEL_33;
        }
        uint64_t result = *v19;
        if (*v18 != result) {
          goto LABEL_13;
        }
        --v17;
        ++v18;
        ++v19;
        if (!--v20) {
          goto LABEL_29;
        }
      }
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
LABEL_30:
  uint64_t v21 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v21 + 48) + 8 * a2) = v5;
  uint64_t v22 = *(void *)(v21 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (!v23)
  {
    *(void *)(v21 + 16) = v24;
    return result;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_24CA63604(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24CA63110();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24CA6394C();
      goto LABEL_22;
    }
    sub_24CA63DD0();
  }
  uint64_t v11 = *v4;
  sub_24CA86720();
  sub_24CA862F0();
  uint64_t result = sub_24CA86760();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24CA866A0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24CA866C0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24CA866A0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_24CA637A0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807A88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CA86580();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24CA6394C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B17FA18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CA86580();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24CA63B00()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807A88);
  uint64_t result = sub_24CA86590();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_37:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v26 = v2 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(v2 + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = result + 56;
  while (1)
  {
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_23;
    }
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v27) {
        goto LABEL_35;
      }
      unint64_t v14 = *(void *)(v26 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v27) {
          goto LABEL_35;
        }
        unint64_t v14 = *(void *)(v26 + 8 * v5);
        if (!v14)
        {
          int64_t v15 = v13 + 3;
          if (v15 >= v27)
          {
LABEL_35:
            uint64_t result = swift_release();
            uint64_t v1 = v0;
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v26 + 8 * v15);
          int64_t v5 = v15;
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_23:
    uint64_t v16 = *(void *)(*(void *)(v2 + 48) + 8 * v12);
    sub_24CA86720();
    sub_24CA86730();
    uint64_t v17 = *(void *)(v16 + 16);
    if (v17)
    {
      uint64_t v18 = v16 + 32;
      do
      {
        v18 += 4;
        sub_24CA86750();
        --v17;
      }
      while (v17);
    }
    uint64_t result = sub_24CA86760();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v9 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v10 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v9 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    *(void *)(*(void *)(v4 + 48) + 8 * v10) = v16;
    ++*(void *)(v4 + 16);
    uint64_t result = swift_bridgeObjectRetain();
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_22;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24CA63DD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B17FA18);
  uint64_t v3 = sub_24CA86590();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24CA86720();
    swift_bridgeObjectRetain();
    sub_24CA862F0();
    uint64_t result = sub_24CA86760();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24CA64080(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_24CA86020();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v55 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A08);
  int v54 = a2;
  uint64_t v9 = sub_24CA86620();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v49 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v47 = v2;
  int64_t v48 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v50 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v56 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  uint64_t v51 = v6;
  uint64_t v52 = v8;
  uint64_t v61 = v5;
  int64_t v18 = v55;
  uint64_t v53 = v10;
  while (1)
  {
    if (v14)
    {
      unint64_t v22 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v23 = v22 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v48) {
      break;
    }
    char v25 = v49;
    unint64_t v26 = v49[v24];
    ++v17;
    if (!v26)
    {
      int64_t v17 = v24 + 1;
      if (v24 + 1 >= v48) {
        goto LABEL_34;
      }
      unint64_t v26 = v49[v17];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v48)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v47;
          if ((v54 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v49[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v17 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v48) {
              goto LABEL_34;
            }
            unint64_t v26 = v49[v17];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v27;
      }
    }
LABEL_21:
    unint64_t v14 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v17 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v6 + 72);
    unint64_t v29 = *(void *)(v8 + 48) + v28 * v23;
    uint64_t v30 = 48 * v23;
    int64_t v60 = v17;
    if (v54)
    {
      (*v56)(v18, v29, v61);
      uint64_t v31 = *(void *)(v8 + 56) + v30;
      uint64_t v32 = *(void *)v31;
      uint64_t v33 = *(void *)(v31 + 16);
      uint64_t v58 = *(void *)(v31 + 8);
      uint64_t v59 = v32;
      uint64_t v35 = *(void *)(v31 + 24);
      uint64_t v34 = *(void *)(v31 + 32);
      int v57 = *(_DWORD *)(v31 + 40);
    }
    else
    {
      (*v50)(v18, v29, v61);
      uint64_t v36 = *(void *)(v8 + 56) + v30;
      uint64_t v37 = *(void *)v36;
      uint64_t v58 = *(void *)(v36 + 8);
      uint64_t v59 = v37;
      uint64_t v33 = *(void *)(v36 + 16);
      uint64_t v35 = *(void *)(v36 + 24);
      uint64_t v34 = *(void *)(v36 + 32);
      int v57 = *(_DWORD *)(v36 + 40);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
    }
    uint64_t v10 = v53;
    sub_24CA66450(&qword_26B180A18, MEMORY[0x263F06EA8]);
    uint64_t result = sub_24CA861F0();
    uint64_t v38 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v39 = result & ~v38;
    unint64_t v40 = v39 >> 6;
    if (((-1 << v39) & ~*(void *)(v15 + 8 * (v39 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v39) & ~*(void *)(v15 + 8 * (v39 >> 6)))) | v39 & 0x7FFFFFFFFFFFFFC0;
      int64_t v18 = v55;
    }
    else
    {
      char v41 = 0;
      unint64_t v42 = (unint64_t)(63 - v38) >> 6;
      int64_t v18 = v55;
      do
      {
        if (++v40 == v42 && (v41 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v43 = v40 == v42;
        if (v40 == v42) {
          unint64_t v40 = 0;
        }
        v41 |= v43;
        uint64_t v44 = *(void *)(v15 + 8 * v40);
      }
      while (v44 == -1);
      unint64_t v19 = __clz(__rbit64(~v44)) + (v40 << 6);
    }
    *(void *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v56)(*(void *)(v10 + 48) + v28 * v19, v18, v61);
    uint64_t v20 = *(void *)(v10 + 56) + 48 * v19;
    int64_t v17 = v60;
    uint64_t v21 = v58;
    *(void *)uint64_t v20 = v59;
    *(void *)(v20 + 8) = v21;
    *(void *)(v20 + 16) = v33;
    *(void *)(v20 + 24) = v35;
    *(void *)(v20 + 32) = v34;
    *(_DWORD *)(v20 + 40) = v57;
    ++*(void *)(v10 + 16);
    uint64_t v6 = v51;
    uint64_t v8 = v52;
  }
  swift_release();
  uint64_t v3 = v47;
  char v25 = v49;
  if ((v54 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v45 = 1 << *(unsigned char *)(v8 + 32);
  if (v45 >= 64) {
    bzero(v25, ((unint64_t)(v45 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v25 = -1 << v45;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_24CA64538(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_24CA86020();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180AC8);
  int v47 = a2;
  uint64_t v10 = sub_24CA86620();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v49 = v8;
  uint64_t v50 = v5;
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  BOOL v43 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  char v41 = v2;
  int64_t v42 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v44 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  int64_t v48 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  uint64_t v45 = v9;
  uint64_t v46 = v6;
  while (1)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v42) {
      break;
    }
    int64_t v24 = v43;
    unint64_t v25 = v43[v23];
    ++v18;
    if (!v25)
    {
      int64_t v18 = v23 + 1;
      if (v23 + 1 >= v42) {
        goto LABEL_34;
      }
      unint64_t v25 = v43[v18];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v42)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v41;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v43[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v18 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v42) {
              goto LABEL_34;
            }
            unint64_t v25 = v43[v18];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v6 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v47)
    {
      (*v48)(v49, v28, v50);
      uint64_t v29 = *(void *)(v9 + 56) + 16 * v22;
      int v30 = *(_DWORD *)v29;
      uint64_t v31 = *(void *)(v29 + 8);
    }
    else
    {
      (*v44)(v49, v28, v50);
      uint64_t v32 = *(void *)(v9 + 56) + 16 * v22;
      int v30 = *(_DWORD *)v32;
      uint64_t v31 = *(void *)(v32 + 8);
      swift_retain();
    }
    sub_24CA66450(&qword_26B180A18, MEMORY[0x263F06EA8]);
    uint64_t result = sub_24CA861F0();
    uint64_t v33 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v6 = v46;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      uint64_t v6 = v46;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v16 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v19 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v48)(*(void *)(v11 + 48) + v27 * v19, v49, v50);
    uint64_t v20 = *(void *)(v11 + 56) + 16 * v19;
    *(_DWORD *)uint64_t v20 = v30;
    *(void *)(v20 + 8) = v31;
    ++*(void *)(v11 + 16);
    uint64_t v9 = v45;
  }
  swift_release();
  uint64_t v3 = v41;
  int64_t v24 = v43;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v9 + 32);
  if (v40 >= 64) {
    bzero(v24, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v40;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_24CA64984(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_24CA86020();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_24CA75224(a2);
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
      sub_24CA64EA0();
      goto LABEL_7;
    }
    sub_24CA64080(v17, a3 & 1);
    unint64_t v23 = sub_24CA75224(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_24CA64D10(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_24CA866D0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7] + 48 * v14;
  return sub_24CA663F4((uint64_t)a1, v21);
}

uint64_t sub_24CA64B54(int a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v27 = a2;
  uint64_t v9 = sub_24CA86020();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = (void *)*v4;
  unint64_t v15 = sub_24CA75224(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v21 = *v5;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7] + 16 * v15;
      uint64_t result = swift_release();
      *(_DWORD *)uint64_t v22 = a1;
      *(void *)(v22 + 8) = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_24CA651D8();
    goto LABEL_7;
  }
  sub_24CA64538(v18, a4 & 1);
  unint64_t v24 = sub_24CA75224(a3);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    uint64_t result = sub_24CA866D0();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  uint64_t v21 = *v5;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  return sub_24CA64DDC(v15, (uint64_t)v12, a1, v27, v21);
}

uint64_t sub_24CA64D10(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_24CA86020();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v11 = (_OWORD *)(a4[7] + 48 * a1);
  *(_OWORD *)((char *)v11 + 28) = *(_OWORD *)((char *)a3 + 28);
  long long v12 = a3[1];
  *uint64_t v11 = *a3;
  v11[1] = v12;
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

uint64_t sub_24CA64DDC(unint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = a5[6];
  uint64_t v11 = sub_24CA86020();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a2, v11);
  uint64_t v13 = a5[7] + 16 * a1;
  *(_DWORD *)uint64_t v13 = a3;
  *(void *)(v13 + 8) = a4;
  uint64_t v14 = a5[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a5[2] = v16;
  }
  return result;
}

char *sub_24CA64EA0()
{
  uint64_t v40 = sub_24CA86020();
  uint64_t v42 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v39 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A08);
  unint64_t v34 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CA86610();
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v43 = v3;
  if (!v4)
  {
    uint64_t result = (char *)swift_release();
    uint64_t v33 = v43;
    uint64_t v32 = v34;
LABEL_25:
    *uint64_t v32 = v33;
    return result;
  }
  uint64_t v5 = v3;
  uint64_t result = (char *)(v3 + 64);
  uint64_t v7 = (char *)(v2 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  uint64_t v35 = v2 + 64;
  if (v5 != v2 || result >= &v7[8 * v8])
  {
    uint64_t result = (char *)memmove(result, v7, 8 * v8);
    uint64_t v5 = v43;
  }
  int64_t v9 = 0;
  *(void *)(v5 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v41 = v2;
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  uint64_t v13 = v43;
  uint64_t v38 = v42 + 16;
  int64_t v36 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v37 = v42 + 32;
  uint64_t v14 = v42;
  uint64_t v16 = v39;
  uint64_t v15 = v40;
  while (1)
  {
    if (v12)
    {
      uint64_t v44 = (v12 - 1) & v12;
      int64_t v45 = v9;
      unint64_t v17 = __clz(__rbit64(v12)) | (v9 << 6);
      uint64_t v18 = v41;
      goto LABEL_9;
    }
    int64_t v28 = v9 + 1;
    uint64_t v18 = v41;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v28 >= v36) {
      goto LABEL_23;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v28);
    int64_t v30 = v9 + 1;
    if (!v29)
    {
      int64_t v30 = v9 + 2;
      if (v9 + 2 >= v36) {
        goto LABEL_23;
      }
      unint64_t v29 = *(void *)(v35 + 8 * v30);
      if (!v29) {
        break;
      }
    }
LABEL_22:
    uint64_t v44 = (v29 - 1) & v29;
    int64_t v45 = v30;
    unint64_t v17 = __clz(__rbit64(v29)) + (v30 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v14 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v16, *(void *)(v18 + 48) + v19, v15);
    uint64_t v20 = *(void *)(v18 + 56);
    uint64_t v21 = 48 * v17;
    uint64_t v22 = (uint64_t *)(v20 + 48 * v17);
    uint64_t v23 = v22[1];
    uint64_t v47 = *v22;
    uint64_t v24 = v22[2];
    uint64_t v25 = v22[3];
    uint64_t v26 = v22[4];
    int v46 = *((_DWORD *)v22 + 10);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v13 + 48) + v19, v16, v15);
    uint64_t v27 = *(void *)(v13 + 56) + v21;
    *(void *)uint64_t v27 = v47;
    *(void *)(v27 + 8) = v23;
    *(void *)(v27 + 16) = v24;
    *(void *)(v27 + 24) = v25;
    *(void *)(v27 + 32) = v26;
    *(_DWORD *)(v27 + 40) = v46;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t result = (char *)swift_retain();
    unint64_t v12 = v44;
    int64_t v9 = v45;
  }
  uint64_t v31 = v9 + 3;
  if (v9 + 3 >= v36)
  {
LABEL_23:
    uint64_t result = (char *)swift_release();
    uint64_t v32 = v34;
    uint64_t v33 = v43;
    goto LABEL_25;
  }
  unint64_t v29 = *(void *)(v35 + 8 * v31);
  if (v29)
  {
    int64_t v30 = v9 + 3;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v30 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v30 >= v36) {
      goto LABEL_23;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v30);
    ++v31;
    if (v29) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24CA651D8()
{
  uint64_t v38 = sub_24CA86020();
  uint64_t v1 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180AC8);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_24CA86610();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v40 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v30 = v40;
    unint64_t v29 = v32;
LABEL_25:
    *unint64_t v29 = v30;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v40;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v39 = v3;
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v35 = v1 + 32;
  uint64_t v36 = v1 + 16;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v15 = v40;
  while (1)
  {
    if (v12)
    {
      unint64_t v16 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v17 = v16 | (v9 << 6);
      uint64_t v18 = v39;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v18 = v39;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v17 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v14, *(void *)(v18 + 48) + v19, v13);
    uint64_t v20 = *(void *)(v18 + 56);
    uint64_t v21 = 16 * v17;
    uint64_t v22 = (int *)(v20 + 16 * v17);
    int v23 = *v22;
    uint64_t v24 = *((void *)v22 + 1);
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v15 + 48) + v19, v14, v13);
    uint64_t v25 = *(void *)(v15 + 56) + v21;
    *(_DWORD *)uint64_t v25 = v23;
    *(void *)(v25 + 8) = v24;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v34)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    unint64_t v29 = v32;
    uint64_t v30 = v40;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24CA654B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (v3)
  {
    int64_t v45 = v2 + 4;
    swift_bridgeObjectRetain();
    unint64_t v4 = 0;
    int64_t v48 = v2;
    while (1)
    {
      uint64_t v5 = *a2;
      if (!*(void *)(*a2 + 16)) {
        goto LABEL_4;
      }
      uint64_t v6 = &v45[2 * v4];
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_24CA86720();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24CA862F0();
      uint64_t v9 = sub_24CA86760();
      uint64_t v10 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v11 = v9 & ~v10;
      uint64_t v12 = v5 + 56;
      if ((*(void *)(v5 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11)) {
        break;
      }
LABEL_3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v2 = v48;
LABEL_4:
      if (++v4 == v3)
      {
        swift_bridgeObjectRelease();
        return v2[2];
      }
    }
    uint64_t v13 = *(void *)(v5 + 48);
    uint64_t v14 = (void *)(v13 + 16 * v11);
    BOOL v15 = *v14 == v8 && v14[1] == v7;
    if (!v15 && (sub_24CA866A0() & 1) == 0)
    {
      uint64_t v10 = ~v10;
      do
      {
        unint64_t v11 = (v11 + 1) & v10;
        if (((*(void *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
          goto LABEL_3;
        }
        unint64_t v16 = (void *)(v13 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
      }
      while (!v17 && (sub_24CA866A0() & 1) == 0);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = v48;
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v20 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_22;
    }
    while (1)
    {
      while (1)
      {
        unint64_t v23 = v18[2];
        if (v20 == v23) {
          return v4;
        }
        if (v20 >= v23)
        {
          __break(1u);
LABEL_57:
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
LABEL_61:
          __break(1u);
LABEL_62:
          __break(1u);
          return result;
        }
        uint64_t v24 = v18 + 4;
        uint64_t v25 = &v18[2 * v20 + 4];
        uint64_t v26 = *a2;
        if (*(void *)(*a2 + 16)) {
          break;
        }
LABEL_45:
        if (v4 != v20)
        {
          if ((v4 & 0x8000000000000000) != 0) {
            goto LABEL_59;
          }
          unint64_t v38 = v18[2];
          if (v4 >= v38) {
            goto LABEL_60;
          }
          if (v20 >= v38) {
            goto LABEL_61;
          }
          uint64_t v39 = &v24[2 * v4];
          uint64_t v10 = *v39;
          uint64_t v12 = v39[1];
          uint64_t v40 = *v25;
          uint64_t v41 = v25[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v18 = sub_24CA658A8(v18);
          }
          unint64_t v11 = (unint64_t)(v18 + 4);
          uint64_t v42 = &v18[2 * v4 + 4];
          void *v42 = v40;
          v42[1] = v41;
          uint64_t result = swift_bridgeObjectRelease();
          if (v20 >= v18[2]) {
            goto LABEL_62;
          }
LABEL_22:
          uint64_t v21 = (uint64_t *)(v11 + 16 * v20);
          *uint64_t v21 = v10;
          v21[1] = v12;
          uint64_t result = swift_bridgeObjectRelease();
          *(void *)a1 = v18;
        }
        BOOL v22 = __OFADD__(v4++, 1);
        if (v22) {
          goto LABEL_58;
        }
        BOOL v22 = __OFADD__(v20++, 1);
        if (v22) {
          goto LABEL_57;
        }
      }
      int v46 = v18 + 4;
      uint64_t v49 = v18;
      uint64_t v28 = *v25;
      uint64_t v27 = v25[1];
      sub_24CA86720();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24CA862F0();
      uint64_t v29 = sub_24CA86760();
      uint64_t v30 = -1 << *(unsigned char *)(v26 + 32);
      unint64_t v31 = v29 & ~v30;
      uint64_t v32 = v26 + 56;
      if (((*(void *)(v26 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31) & 1) == 0) {
        goto LABEL_44;
      }
      uint64_t v44 = *(void *)(v26 + 48);
      uint64_t v33 = (void *)(v44 + 16 * v31);
      BOOL v34 = *v33 == v28 && v33[1] == v27;
      if (!v34 && (sub_24CA866A0() & 1) == 0) {
        break;
      }
LABEL_34:
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v18 = v49;
      BOOL v22 = __OFADD__(v20++, 1);
      if (v22) {
        goto LABEL_57;
      }
    }
    for (unint64_t i = (v31 + 1) & ~v30; ((*(void *)(v32 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & ~v30)
    {
      uint64_t v36 = (void *)(v44 + 16 * i);
      BOOL v37 = *v36 == v28 && v36[1] == v27;
      if (v37 || (sub_24CA866A0() & 1) != 0) {
        goto LABEL_34;
      }
    }
LABEL_44:
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v18 = v49;
    uint64_t v24 = v46;
    goto LABEL_45;
  }
  return 0;
}

void *sub_24CA658A8(void *a1)
{
  return sub_24CA82720(0, a1[2], 0, a1);
}

uint64_t sub_24CA658BC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_24CA60750(a1, v2, a2);
}

uint64_t sub_24CA658D8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_24CA60850(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_24CA658F8(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_24CA82720(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    unint64_t v16 = (char *)&v4[2 * a2 + 4];
    if (a1 != a2 || &v4[2 * a1 + 4] >= (void *)&v16[16 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[2 * a1 + 4], v16, 16 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

unint64_t sub_24CA65A64(uint64_t *a1)
{
  return sub_24CA7C274(a1, v1);
}

unint64_t sub_24CA65A80()
{
  unint64_t result = qword_269807A40;
  if (!qword_269807A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807A40);
  }
  return result;
}

unint64_t sub_24CA65AD4()
{
  unint64_t result = qword_269807A48;
  if (!qword_269807A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807A48);
  }
  return result;
}

uint64_t sub_24CA65B28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CA65B90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DataFrameStreamContainer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA65BF4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CA65C54(void *a1)
{
  return sub_24CA5D6A8(a1, v1);
}

void sub_24CA65C70(uint64_t a1)
{
  sub_24CA61F40(a1, v1);
}

uint64_t sub_24CA65C78(uint64_t a1)
{
  uint64_t result = sub_24CA66450(&qword_269807A60, (void (*)(uint64_t))type metadata accessor for DataFrameStream);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for DataFrameStream()
{
  uint64_t result = qword_26B180C10;
  if (!qword_26B180C10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA65D1C()
{
  return type metadata accessor for DataFrameStream();
}

uint64_t sub_24CA65D24()
{
  uint64_t result = type metadata accessor for DataFrameStreamContainer();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DataFrameStream(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DataFrameStream);
}

uint64_t dispatch thunk of DataFrameStream.__allocating_init(storageContainer:segmentSize:)(uint64_t a1, unint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, unint64_t))(v2 + 104))(a1, a2 | ((HIDWORD(a2) & 1) << 32));
}

uint64_t destroy for DataFrameStreamPendingWrites()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s8Dendrite28DataFrameStreamPendingWritesVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DataFrameStreamPendingWrites(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DataFrameStreamPendingWrites(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamPendingWrites(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DataFrameStreamPendingWrites(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DataFrameStreamPendingWrites()
{
  return &type metadata for DataFrameStreamPendingWrites;
}

uint64_t destroy for DataFrameStreamSegments()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s8Dendrite23DataFrameStreamSegmentsVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DataFrameStreamSegments(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for DataFrameStreamSegments(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamSegments(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DataFrameStreamSegments(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DataFrameStreamSegments()
{
  return &type metadata for DataFrameStreamSegments;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DataFrameStreamError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA66304);
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

unsigned char *sub_24CA6632C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DataFrameStreamError()
{
  return &type metadata for DataFrameStreamError;
}

unint64_t sub_24CA6634C()
{
  unint64_t result = qword_269807A68;
  if (!qword_269807A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807A68);
  }
  return result;
}

uint64_t sub_24CA663A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CA663F4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24CA66450(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CA66498(void *a1)
{
  return sub_24CA61FA4(a1, *(void *)(v1 + 16));
}

uint64_t sub_24CA664B4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_24CA66518(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CA5D798(a1, v2, a2);
}

void sub_24CA66534(uint64_t *a1@<X0>, void *a2@<X8>)
{
  sub_24CA5E724(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_24CA66554()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CA6658C()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CA665CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24CA4E148;
  return sub_24CA5ED8C(a1, v4, v5, v6);
}

uint64_t sub_24CA66680(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CA666DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CA66740(void *a1)
{
  return sub_24CA5F6F0(a1, v1);
}

uint64_t sub_24CA6675C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_24CA658D8(a1, a2);
}

uint64_t sub_24CA66774@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return sub_24CA58CBC(a1, a2);
}

uint64_t sub_24CA6678C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SegmentOffsetTable()
{
  return self;
}

uint64_t sub_24CA667E8(char *a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_24CA86130();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = (char *)&v28 - v12;
  int v29 = a3;
  uint64_t v28 = a2;
  if (a3)
  {
    unint64_t v12 = (unint64_t)a1 >> 32;
    if (!((unint64_t)a1 >> 32))
    {
      if (a1 >> 11 != 27)
      {
        LODWORD(v12) = a1 >> 16;
        if (a1 >> 16 > 0x10)
        {
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
        if ((a1 & 0xFFFFFF80) != 0)
        {
LABEL_16:
          int v23 = (a1 & 0x3F) << 8;
          unsigned int v24 = (v23 | (a1 >> 6)) + 33217;
          unsigned int v25 = (v23 | (a1 >> 6) & 0x3F) << 8;
          unsigned int v26 = (((v25 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
          unsigned int v27 = (v25 | (a1 >> 12)) + 8487393;
          if (v12) {
            unsigned int v14 = v26;
          }
          else {
            unsigned int v14 = v27;
          }
          if (a1 < 0x800) {
            unsigned int v14 = v24;
          }
          goto LABEL_10;
        }
        if (a1 <= 0xFF)
        {
          unsigned int v14 = ((_BYTE)a1 + 1);
LABEL_10:
          uint64_t v30 = (v14 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v14) >> 3)) & 7)));
          goto LABEL_11;
        }
        __break(1u);
      }
      __break(1u);
      goto LABEL_24;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v30 = sub_24CA862D0();
  uint64_t v31 = v15;
  swift_bridgeObjectRetain();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  uint64_t v16 = v30;
  uint64_t v17 = v31;
  sub_24CA86120();
  sub_24CA860F0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  uint64_t v30 = v16;
  uint64_t v31 = v17;
  swift_bridgeObjectRetain();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = v30;
  uint64_t v18 = v31;
  v4[2] = v30;
  v4[3] = v18;
  swift_bridgeObjectRetain();
  sub_24CA86490();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807A90);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_24CA877D0;
  *(void *)(v20 + 56) = MEMORY[0x263F8D310];
  *(void *)(v20 + 64) = sub_24CA66E34();
  *(void *)(v20 + 32) = v19;
  *(void *)(v20 + 40) = v18;
  sub_24CA5A850();
  swift_bridgeObjectRetain();
  uint64_t v21 = (void *)sub_24CA86500();
  sub_24CA86140();
  swift_bridgeObjectRelease();

  sub_24CA862C0();
  swift_bridgeObjectRelease();
  uint64_t v22 = os_transaction_create();
  uint64_t result = swift_release();
  if (v22)
  {
    v4[4] = v22;
    type metadata accessor for OSActivity();
    swift_allocObject();
    v4[5] = sub_24CA697CC(a1, v28, v29);
    return (uint64_t)v4;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_24CA66B58()
{
  uint64_t v1 = v0;
  sub_24CA86490();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807A90);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24CA877D0;
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  *(void *)(v2 + 64) = sub_24CA66E34();
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v3;
  sub_24CA5A850();
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_24CA86500();
  sub_24CA86140();
  swift_bridgeObjectRelease();

  uint64_t v6 = (os_activity_scope_state_s *)(*(void *)(v1 + 40) + 24);
  swift_beginAccess();
  os_activity_scope_leave(v6);
  return swift_endAccess();
}

uint64_t OSTransaction.deinit()
{
  sub_24CA66B58();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t OSTransaction.__deallocating_deinit()
{
  sub_24CA66B58();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t static OSTransaction.named(_:block:)(char *a1, uint64_t a2, int a3, void (*a4)(uint64_t))
{
  swift_initStackObject();
  uint64_t v8 = sub_24CA667E8(a1, a2, a3);
  a4(v8);
  return swift_release();
}

{
  uint64_t v8;
  uint64_t vars8;

  uint64_t v8 = swift_allocObject();
  sub_24CA667E8(a1, a2, a3);
  a4(v8);
  return swift_release();
}

uint64_t type metadata accessor for OSTransaction()
{
  return self;
}

uint64_t method lookup function for OSTransaction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for OSTransaction);
}

unint64_t sub_24CA66E34()
{
  unint64_t result = qword_269807A98[0];
  if (!qword_269807A98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269807A98);
  }
  return result;
}

uint64_t sub_24CA66E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for SegmentLayout()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *storeEnumTagSinglePayload for SegmentLayoutError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA66F74);
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

ValueMetadata *type metadata accessor for SegmentLayoutError()
{
  return &type metadata for SegmentLayoutError;
}

unint64_t sub_24CA66FB0()
{
  unint64_t result = qword_269807B20;
  if (!qword_269807B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807B20);
  }
  return result;
}

uint64_t static SegmentedDataRegion.from<A, B>(tuple:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v45 = a6;
  uint64_t v49 = a5;
  int v46 = a2;
  uint64_t v47 = a7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v48 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v52 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (uint64_t *)((char *)&v38 - v14);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (uint64_t *)((char *)&v38 - v17);
  uint64_t v19 = (char *)&v38 + *(int *)(v16 + 48) - v17;
  uint64_t v51 = *(void *)(a3 - 8);
  uint64_t v42 = *(void (**)(void))(v51 + 16);
  uint64_t v20 = a1;
  uint64_t v21 = a3;
  ((void (*)(char *, uint64_t, uint64_t))v42)((char *)&v38 - v17, v20, a3);
  uint64_t v50 = a4;
  uint64_t v44 = *(void *)(a4 - 8);
  uint64_t v41 = *(void (**)(char *, uint64_t *, uint64_t))(v44 + 16);
  uint64_t v22 = v19;
  uint64_t v40 = v19;
  v41(v19, v46, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807B28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CA88290;
  int v46 = (uint64_t *)(inited + 32);
  uint64_t v24 = *(int *)(TupleTypeMetadata2 + 48);
  unsigned int v25 = v15;
  uint64_t v39 = v15;
  unsigned int v26 = (char *)v15 + v24;
  uint64_t v43 = v26;
  unsigned int v27 = v42;
  ((void (*)(uint64_t *, uint64_t *, uint64_t))v42)(v25, v18, v21);
  uint64_t v28 = v22;
  int v29 = (void (*)(char *, char *, uint64_t))v41;
  v41(v26, (uint64_t *)v28, v50);
  uint64_t v30 = v49;
  *(void *)(inited + 56) = v21;
  *(void *)(inited + 64) = v30;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v46);
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v51 + 32))(boxed_opaque_existential_1, v39, v21);
  uint64_t v39 = (uint64_t *)(inited + 72);
  uint64_t v49 = TupleTypeMetadata2;
  uint64_t v32 = &v52[*(int *)(TupleTypeMetadata2 + 48)];
  int v46 = v18;
  v27();
  uint64_t v33 = v50;
  v29(v32, v40, v50);
  uint64_t v34 = v45;
  *(void *)(inited + 96) = v33;
  *(void *)(inited + 104) = v34;
  uint64_t v35 = __swift_allocate_boxed_opaque_existential_1(v39);
  uint64_t v36 = v44;
  (*(void (**)(uint64_t *, char *, uint64_t))(v44 + 32))(v35, v32, v33);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v21);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v43, v33);
  SegmentedDataRegion.init(representables:)(inited, v47);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v48 + 8))(v46, v49);
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

uint64_t static SegmentedDataRegion.from<A, B, C>(tuple:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  uint64_t v72 = a8;
  unint64_t v68 = a7;
  long long v67 = a3;
  uint64_t v85 = a1;
  uint64_t v70 = a9;
  uint64_t v69 = a10;
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  uint64_t v71 = *(void *)(TupleTypeMetadata3 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](TupleTypeMetadata3);
  uint64_t v81 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v80 = (char *)&v61 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v61 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  v74 = (char *)&v61 + *(int *)(v22 + 48) - v23;
  uint64_t v24 = v74;
  uint64_t v73 = (char *)&v61 + *(int *)(v22 + 64) - v23;
  unsigned int v25 = v73;
  v86 = (char *)&v61 - v23;
  uint64_t v83 = a4;
  uint64_t v82 = *(void *)(a4 - 8);
  unsigned int v26 = *(void (**)(void))(v82 + 16);
  uint64_t v75 = v82 + 16;
  unint64_t v84 = v26;
  ((void (*)(char *, uint64_t, uint64_t))v26)((char *)&v61 - v23, v85, a4);
  uint64_t v78 = a5;
  uint64_t v85 = *(void *)(a5 - 8);
  uint64_t v77 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 16);
  uint64_t v79 = v85 + 16;
  v77(v24, a2, a5);
  uint64_t v66 = *(void *)(a6 - 8);
  uint64_t v27 = v66 + 16;
  uint64_t v76 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  v76(v25, v67, a6);
  uint64_t v63 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807B28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CA882A0;
  uint64_t v62 = (uint64_t *)(inited + 32);
  long long v67 = &v21[*(int *)(TupleTypeMetadata3 + 48)];
  int v29 = v67;
  long long v65 = &v21[*(int *)(TupleTypeMetadata3 + 64)];
  uint64_t v30 = v65;
  uint64_t v31 = v83;
  ((void (*)(char *, char *, uint64_t))v84)(v21, v86, v83);
  uint64_t v32 = v29;
  uint64_t v33 = v74;
  v77(v32, (uint64_t)v74, v78);
  uint64_t v34 = v30;
  uint64_t v35 = v73;
  uint64_t v64 = a6;
  v76(v34, v73, a6);
  uint64_t v36 = v68;
  *(void *)(inited + 56) = v31;
  *(void *)(inited + 64) = v36;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v62);
  (*(void (**)(uint64_t *, char *, uint64_t))(v82 + 32))(boxed_opaque_existential_1, v21, v31);
  uint64_t v62 = (uint64_t *)(inited + 72);
  uint64_t v38 = &v80[*(int *)(TupleTypeMetadata3 + 48)];
  unint64_t v68 = &v80[*(int *)(TupleTypeMetadata3 + 64)];
  uint64_t v39 = v68;
  v84();
  uint64_t v40 = v33;
  uint64_t v41 = v78;
  uint64_t v42 = (void (*)(uint64_t *, char *, uint64_t))v77;
  v77(v38, (uint64_t)v40, v78);
  uint64_t v43 = v35;
  uint64_t v44 = v76;
  v76(v39, v43, a6);
  uint64_t v45 = v41;
  uint64_t v46 = v72;
  *(void *)(inited + 96) = v41;
  *(void *)(inited + 104) = v46;
  uint64_t v47 = __swift_allocate_boxed_opaque_existential_1(v62);
  (*(void (**)(uint64_t *, char *, uint64_t))(v85 + 32))(v47, v38, v41);
  uint64_t v62 = (uint64_t *)&v81[*(int *)(TupleTypeMetadata3 + 48)];
  uint64_t v48 = v62;
  uint64_t v72 = TupleTypeMetadata3;
  uint64_t v49 = &v81[*(int *)(TupleTypeMetadata3 + 64)];
  v84();
  uint64_t v50 = v48;
  uint64_t v51 = v45;
  v42(v50, v74, v45);
  uint64_t v52 = v64;
  v44(v49, v73, v64);
  uint64_t v53 = v69;
  *(void *)(inited + 136) = v52;
  *(void *)(inited + 144) = v53;
  int v54 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 112));
  uint64_t v55 = v66;
  (*(void (**)(uint64_t *, char *, uint64_t))(v66 + 32))(v54, v49, v52);
  uint64_t v56 = *(void (**)(uint64_t *, uint64_t))(v85 + 8);
  v85 += 8;
  v56(v62, v51);
  int v57 = *(void (**)(char *, uint64_t))(v82 + 8);
  uint64_t v58 = v83;
  v57(v81, v83);
  uint64_t v59 = *(void (**)(char *, uint64_t))(v55 + 8);
  v59(v68, v52);
  v57(v80, v58);
  v59(v65, v52);
  v56((uint64_t *)v67, v51);
  SegmentedDataRegion.init(representables:)(inited, v70);
  return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v86, v72);
}

uint64_t static SegmentedDataRegion.from<A, B, C, D>(tuple:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(char *, char *, uint64_t)@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, char *a10, char *a11, int *a12, uint64_t a13)
{
  uint64_t v91 = a4;
  char v112 = a3;
  uint64_t v115 = a2;
  uint64_t v116 = a1;
  uint64_t v95 = a9;
  uint64_t v93 = a13;
  uint64_t v92 = a12;
  unint64_t v89 = a11;
  v86 = a10;
  uint64_t v117 = a5;
  uint64_t v118 = a6;
  uint64_t v119 = a7;
  uint64_t v120 = a8;
  TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  uint64_t v94 = *((void *)TupleTypeMetadata - 1);
  uint64_t v18 = MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v98 = (char *)&v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v97 = (char *)&v81 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v96 = (char *)&v81 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  unsigned int v26 = (char *)&v81 - v25;
  uint64_t v27 = (int *)MEMORY[0x270FA5388](v24);
  uint64_t v104 = (char *)&v81 + v27[12] - v28;
  int v29 = v104;
  uint64_t v103 = (char *)&v81 + v27[16] - v28;
  uint64_t v30 = v103;
  v113 = (char *)&v81 + v27[20] - v28;
  uint64_t v31 = v113;
  uint64_t v121 = (char *)&v81 - v28;
  uint64_t v101 = a5;
  uint64_t v99 = *(void *)(a5 - 8);
  uint64_t v32 = *(void (**)(void))(v99 + 16);
  uint64_t v102 = v99 + 16;
  uint64_t v105 = v32;
  ((void (*)(char *, uint64_t, uint64_t))v32)((char *)&v81 - v28, v116, a5);
  uint64_t v100 = a6;
  uint64_t v116 = *(void *)(a6 - 8);
  uint64_t v111 = *(void (**)(char *, uint64_t, uint64_t))(v116 + 16);
  uint64_t v108 = v116 + 16;
  v111(v29, v115, a6);
  uint64_t v114 = a7;
  uint64_t v115 = *(void *)(a7 - 8);
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v115 + 16);
  uint64_t v110 = v115 + 16;
  v107 = v33;
  v33(v30, (char *)v112, a7);
  uint64_t v87 = *(void *)(a8 - 8);
  char v112 = *(void (**)(char *, char *, uint64_t))(v87 + 16);
  uint64_t v109 = v87 + 16;
  uint64_t v106 = a8;
  v112(v31, v91, a8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807B28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CA882B0;
  uint64_t v85 = (uint64_t *)(inited + 32);
  uint64_t v91 = &v26[TupleTypeMetadata[12]];
  uint64_t v35 = v91;
  uint64_t v90 = &v26[TupleTypeMetadata[16]];
  uint64_t v36 = v90;
  uint64_t v88 = &v26[TupleTypeMetadata[20]];
  BOOL v37 = v88;
  uint64_t v38 = v101;
  ((void (*)(char *, char *, uint64_t))v105)(v26, v121, v101);
  uint64_t v39 = v35;
  uint64_t v40 = v100;
  v111(v39, (uint64_t)v104, v100);
  v107(v36, v103, v114);
  v112(v37, v113, a8);
  uint64_t v41 = v86;
  *(void *)(inited + 56) = v38;
  *(void *)(inited + 64) = v41;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v85);
  (*(void (**)(uint64_t *, char *, uint64_t))(v99 + 32))(boxed_opaque_existential_1, v26, v38);
  unint64_t v84 = (uint64_t *)(inited + 72);
  uint64_t v43 = &v96[TupleTypeMetadata[12]];
  v86 = &v96[TupleTypeMetadata[16]];
  uint64_t v44 = v86;
  uint64_t v85 = (uint64_t *)&v96[TupleTypeMetadata[20]];
  uint64_t v45 = v85;
  uint64_t v46 = v105;
  v105();
  uint64_t v47 = v43;
  uint64_t v48 = v43;
  uint64_t v49 = v104;
  v111(v47, (uint64_t)v104, v40);
  uint64_t v50 = v103;
  v107(v44, v103, v114);
  v112((char *)v45, v113, v106);
  uint64_t v51 = v89;
  *(void *)(inited + 96) = v40;
  *(void *)(inited + 104) = v51;
  uint64_t v52 = __swift_allocate_boxed_opaque_existential_1(v84);
  uint64_t v53 = v48;
  uint64_t v54 = v40;
  (*(void (**)(uint64_t *, char *, uint64_t))(v116 + 32))(v52, v53, v40);
  uint64_t v82 = (uint64_t *)(inited + 112);
  unint64_t v89 = &v97[TupleTypeMetadata[12]];
  uint64_t v55 = v89;
  uint64_t v81 = (uint64_t *)&v97[TupleTypeMetadata[16]];
  unint64_t v84 = (uint64_t *)&v97[TupleTypeMetadata[20]];
  uint64_t v56 = v84;
  v46();
  v111(v55, (uint64_t)v49, v54);
  int v57 = v81;
  uint64_t v58 = v50;
  uint64_t v59 = v114;
  int64_t v60 = v107;
  v107((char *)v81, v58, v114);
  v112((char *)v56, v113, v106);
  uint64_t v61 = v92;
  *(void *)(inited + 136) = v59;
  *(void *)(inited + 144) = v61;
  uint64_t v62 = __swift_allocate_boxed_opaque_existential_1(v82);
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v115 + 32))(v62, v57, v59);
  uint64_t v81 = (uint64_t *)(inited + 152);
  uint64_t v82 = (uint64_t *)&v98[TupleTypeMetadata[12]];
  uint64_t v63 = v82;
  uint64_t v64 = &v98[TupleTypeMetadata[16]];
  uint64_t v92 = TupleTypeMetadata;
  long long v65 = &v98[TupleTypeMetadata[20]];
  v105();
  uint64_t v66 = v100;
  v111((char *)v63, (uint64_t)v104, v100);
  v60(v64, v103, v59);
  uint64_t v67 = v106;
  v112(v65, v113, v106);
  uint64_t v83 = inited;
  uint64_t v68 = v93;
  *(void *)(inited + 176) = v67;
  *(void *)(inited + 184) = v68;
  uint64_t v69 = __swift_allocate_boxed_opaque_existential_1(v81);
  uint64_t v70 = v87;
  (*(void (**)(uint64_t *, char *, uint64_t))(v87 + 32))(v69, v65, v67);
  uint64_t v71 = *(char **)(v115 + 8);
  v115 += 8;
  v113 = v71;
  ((void (*)(char *, uint64_t))v71)(v64, v59);
  uint64_t v73 = v116 + 8;
  uint64_t v72 = *(void (**)(uint64_t *, uint64_t))(v116 + 8);
  v72(v82, v66);
  char v112 = (void (*)(char *, char *, uint64_t))v72;
  uint64_t v116 = v73;
  v74 = *(void (**)(char *, uint64_t))(v99 + 8);
  uint64_t v75 = v101;
  v74(v98, v101);
  uint64_t v76 = *(void (**)(uint64_t *, uint64_t))(v70 + 8);
  v76(v84, v67);
  v72((uint64_t *)v89, v66);
  uint64_t v77 = v75;
  v74(v97, v75);
  v76(v85, v67);
  uint64_t v78 = v114;
  uint64_t v79 = (void (*)(char *, uint64_t))v113;
  ((void (*)(char *, uint64_t))v113)(v86, v114);
  v74(v96, v77);
  v76((uint64_t *)v88, v67);
  v79(v90, v78);
  ((void (*)(char *, uint64_t))v112)(v91, v100);
  SegmentedDataRegion.init(representables:)(v83, v95);
  return (*(uint64_t (**)(char *, int *))(v94 + 8))(v121, v92);
}

uint64_t SegmentedDataRegion.toTuple<A, B>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(char *, char *, uint64_t)@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v33 = a4;
  uint64_t v35 = a3;
  uint64_t v36 = a5;
  uint64_t v8 = sub_24CA86520();
  uint64_t v31 = *(void *)(v8 - 8);
  uint64_t v32 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t v34 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v30 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24CA86520();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v30 - v16;
  uint64_t v18 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *v5;
  uint64_t v37 = *v5;
  SegmentedDataRegion.subscript.getter(0, a1, (uint64_t)v35, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v17, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
LABEL_5:
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 56))(v36, 1, 1, TupleTypeMetadata2);
  }
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v22(v20, v17, a1);
  uint64_t v37 = v21;
  SegmentedDataRegion.subscript.getter(1, a2, v33, (uint64_t)v11);
  uint64_t v23 = v34;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v11, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, a1);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
    goto LABEL_5;
  }
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
  unsigned int v26 = v30;
  v35(v30, v11, a2);
  uint64_t v27 = swift_getTupleTypeMetadata2();
  uint64_t v28 = v36;
  int v29 = &v36[*(int *)(v27 + 48)];
  v22(v36, v20, a1);
  v35(v29, v26, a2);
  return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v28, 0, 1, v27);
}

uint64_t SegmentedDataRegion.toTuple<A, B, C>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, char *, uint64_t)@<X3>, void (*a5)(char *, char *, uint64_t)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v48 = a6;
  uint64_t v51 = a5;
  uint64_t v54 = a4;
  uint64_t v55 = a7;
  uint64_t v11 = sub_24CA86520();
  uint64_t v44 = *(void *)(v11 - 8);
  uint64_t v45 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v49 = (uint64_t)&v42 - v13;
  uint64_t v56 = a3;
  uint64_t v52 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v43 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24CA86520();
  uint64_t v46 = *(void *)(v15 - 8);
  uint64_t v47 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v42 - v17;
  uint64_t v53 = *(void (**)(uint64_t, char *, uint64_t))(a2 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v50 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_24CA86520();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v42 - v23;
  uint64_t v25 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v42 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = *v7;
  uint64_t v57 = *v7;
  SegmentedDataRegion.subscript.getter(0, a1, (uint64_t)v54, (uint64_t)v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v24, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  }
  else
  {
    int v29 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v29(v27, v24, a1);
    uint64_t v57 = v28;
    SegmentedDataRegion.subscript.getter(1, a2, (uint64_t)v51, (uint64_t)v18);
    if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v53 + 6))(v18, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, a1);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v18, v47);
    }
    else
    {
      uint64_t v54 = (void (*)(uint64_t, char *, uint64_t))v29;
      uint64_t v30 = v50;
      uint64_t v51 = (void (*)(char *, char *, uint64_t))*((void *)v53 + 4);
      v51(v50, v18, a2);
      uint64_t v57 = v28;
      uint64_t v31 = v49;
      uint64_t v32 = v56;
      SegmentedDataRegion.subscript.getter(2, v56, v48, v49);
      uint64_t v33 = v52;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v31, 1, v32) != 1)
      {
        uint64_t v36 = *(void (**)(uint64_t, char *, uint64_t))(v33 + 32);
        uint64_t v52 = v33 + 32;
        uint64_t v53 = v36;
        uint64_t v37 = v43;
        v36((uint64_t)v43, (char *)v31, v32);
        TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
        uint64_t v39 = v55;
        uint64_t v40 = (char *)(v55 + *(int *)(TupleTypeMetadata3 + 48));
        uint64_t v41 = v55 + *(int *)(TupleTypeMetadata3 + 64);
        v54(v55, v27, a1);
        v51(v40, v50, a2);
        v53(v41, v37, v56);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata3 - 8) + 56))(v39, 0, 1, TupleTypeMetadata3);
      }
      (*((void (**)(char *, uint64_t))v53 + 1))(v30, a2);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, a1);
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v31, v45);
    }
  }
  uint64_t v34 = swift_getTupleTypeMetadata3();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v55, 1, 1, v34);
}

uint64_t SegmentedDataRegion.toTuple<A, B, C, D>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v63 = a8;
  uint64_t v70 = a7;
  uint64_t v73 = a6;
  uint64_t v75 = a5;
  uint64_t v76 = a9;
  uint64_t v59 = sub_24CA86520();
  uint64_t v58 = *(void *)(v59 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v59);
  uint64_t v64 = (uint64_t)&v58 - v15;
  uint64_t v78 = a4;
  uint64_t v71 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v14);
  long long v65 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_24CA86520();
  uint64_t v60 = *(void *)(v61 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v61);
  uint64_t v68 = (uint64_t *)((char *)&v58 - v18);
  uint64_t v77 = a3;
  uint64_t v69 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v62 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_24CA86520();
  uint64_t v66 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 - 8);
  uint64_t v67 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v58 - v22;
  v74 = *(unsigned int (***)(char *, uint64_t, uint64_t))(a2 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v72 = (char *)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_24CA86520();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  int v29 = (char *)&v58 - v28;
  uint64_t v30 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v58 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = *v9;
  uint64_t v79 = *v9;
  SegmentedDataRegion.subscript.getter(0, a1, v75, (uint64_t)v29);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v29, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
LABEL_6:
    uint64_t v44 = v77;
    uint64_t v38 = v78;
    goto LABEL_7;
  }
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
  v34(v32, v29, a1);
  uint64_t v79 = v33;
  SegmentedDataRegion.subscript.getter(1, a2, (uint64_t)v73, (uint64_t)v23);
  uint64_t v35 = v74;
  BOOL v36 = v74[6](v23, 1, a2) == 1;
  uint64_t v37 = (uint64_t)v32;
  if (v36)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v32, a1);
    (*((void (**)(char *, uint64_t))v66 + 1))(v23, v67);
    goto LABEL_6;
  }
  uint64_t v41 = v35;
  uint64_t v73 = (void (*)(uint64_t, uint64_t, uint64_t))v34;
  uint64_t v75 = v37;
  uint64_t v42 = v72;
  uint64_t v66 = v35[4];
  uint64_t v67 = (uint64_t)(v35 + 4);
  v66(v72, (uint64_t)v23, a2);
  uint64_t v79 = v33;
  uint64_t v43 = (void (*)(void, void, void))v68;
  uint64_t v44 = v77;
  SegmentedDataRegion.subscript.getter(2, v77, v70, (uint64_t)v68);
  uint64_t v45 = v43;
  uint64_t v46 = v69;
  if ((*(unsigned int (**)(void, uint64_t, uint64_t))(v69 + 48))(v45, 1, v44) == 1)
  {
    ((void (*)(char *, uint64_t))v41[1])(v42, a2);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v75, a1);
    (*(void (**)(void (*)(void, void, void), uint64_t))(v60 + 8))(v45, v61);
    uint64_t v38 = v78;
  }
  else
  {
    uint64_t v70 = a2;
    uint64_t v47 = v62;
    uint64_t v68 = *(void **)(v46 + 32);
    ((void (*)(char *, void, uint64_t))v68)(v62, v45, v44);
    uint64_t v79 = v33;
    uint64_t v48 = v64;
    uint64_t v49 = v46;
    uint64_t v38 = v78;
    SegmentedDataRegion.subscript.getter(3, v78, v63, v64);
    uint64_t v50 = v71;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v48, 1, v38) != 1)
    {
      uint64_t v51 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v50 + 32);
      uint64_t v71 = v50 + 32;
      v74 = v51;
      ((void (*)(char *, uint64_t, uint64_t))v51)(v65, v48, v38);
      uint64_t v52 = v70;
      uint64_t v79 = a1;
      uint64_t v80 = v70;
      uint64_t v81 = v44;
      uint64_t v82 = v38;
      TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
      uint64_t v54 = v76;
      uint64_t v55 = (char *)(v76 + TupleTypeMetadata[12]);
      uint64_t v56 = v76 + TupleTypeMetadata[16];
      uint64_t v57 = v76 + TupleTypeMetadata[20];
      v73(v76, v75, a1);
      v66(v55, (uint64_t)v72, v52);
      ((void (*)(uint64_t, char *, uint64_t))v68)(v56, v47, v77);
      ((void (*)(uint64_t, char *, uint64_t))v74)(v57, v65, v78);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(*((void *)TupleTypeMetadata - 1) + 56))(v54, 0, 1, TupleTypeMetadata);
    }
    (*(void (**)(char *, uint64_t))(v49 + 8))(v47, v44);
    a2 = v70;
    ((void (*)(char *, uint64_t))v74[1])(v72, v70);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v75, a1);
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v48, v59);
  }
LABEL_7:
  uint64_t v79 = a1;
  uint64_t v80 = a2;
  uint64_t v81 = v44;
  uint64_t v82 = v38;
  uint64_t v39 = swift_getTupleTypeMetadata();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v76, 1, 1, v39);
}

Swift::Void __swiftcall OSActivity.close()()
{
  swift_beginAccess();
  os_activity_scope_leave((os_activity_scope_state_t)(v0 + 24));
  swift_endAccess();
}

uint64_t sub_24CA697CC(char *a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 32) = 0;
  if (a3)
  {
    if ((unint64_t)a1 >> 32)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    unsigned int v8 = a1 >> 11;
    if (a1 >> 11 == 27)
    {
      __break(1u);
    }
    else
    {
      unsigned int v8 = a1 >> 16;
      if (a1 >> 16 > 0x10)
      {
        __break(1u);
      }
      else if ((a1 & 0xFFFFFF80) == 0)
      {
        if (a1 > 0xFF)
        {
          __break(1u);
          goto LABEL_21;
        }
        unsigned int v9 = ((_BYTE)a1 + 1);
LABEL_11:
        *(void *)description = (v9 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << ((32 - (__clz(v9) & 0x38)) & 0x38));
        if (qword_2698075D0 == -1)
        {
LABEL_12:
          unsigned int v6 = qword_269807B30;
          BOOL v7 = description;
          goto LABEL_13;
        }
LABEL_21:
        swift_once();
        goto LABEL_12;
      }
      int v3 = (a1 & 0x3F) << 8;
      if (a1 < 0x800)
      {
        unsigned int v9 = (v3 | (a1 >> 6)) + 33217;
        goto LABEL_11;
      }
    }
    unsigned int v12 = (v3 | (a1 >> 6) & 0x3F) << 8;
    unsigned int v13 = (((v12 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    unsigned int v14 = (v12 | (a1 >> 12)) + 8487393;
    if (v8) {
      unsigned int v9 = v13;
    }
    else {
      unsigned int v9 = v14;
    }
    goto LABEL_11;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (qword_2698075D0 != -1) {
LABEL_16:
  }
    swift_once();
  unsigned int v6 = qword_269807B30;
  BOOL v7 = a1;
LABEL_13:
  *(void *)(v4 + 16) = _os_activity_create(&dword_24CA47000, v7, v6, OS_ACTIVITY_FLAG_DEFAULT);
  swift_beginAccess();
  uint64_t v10 = swift_unknownObjectRetain();
  os_activity_scope_enter(v10, (os_activity_scope_state_t)(v4 + 24));
  swift_endAccess();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_24CA699C4()
{
  qword_269807B30 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");
  return swift_unknownObjectRetain();
}

uint64_t OSActivity.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t OSActivity.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OSActivity()
{
  return self;
}

uint64_t method lookup function for OSActivity(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for OSActivity);
}

uint64_t sub_24CA69A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a4;
  return MEMORY[0x270FA2498](sub_24CA69AB4, 0, 0);
}

uint64_t sub_24CA69AB4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    type metadata accessor for FirstUnlockObserver();
    sub_24CA6AC98();
    uint64_t v3 = sub_24CA86430();
    return MEMORY[0x270FA2498](sub_24CA69BA0, v3, v2);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_24CA69BA0()
{
  sub_24CA69E24();
  swift_release();
  return MEMORY[0x270FA2498](sub_24CA69C10, 0, 0);
}

uint64_t sub_24CA69C10()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24CA69C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D0);
  MEMORY[0x270FA5388](v6 - 8);
  unsigned int v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA6AEE8(a1, (uint64_t)v8);
  uint64_t v9 = sub_24CA86460();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_24CA6AE88((uint64_t)v8);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_24CA86430();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24CA86450();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807B68);
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_24CA69E24()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269807A70);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v0 + 48) & 1) == 0)
  {
    *(unsigned char *)(v0 + 48) = 1;
    if (qword_2698075A8 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for InternalLogger();
    __swift_project_value_buffer(v7, (uint64_t)qword_26980A148);
    sub_24CA5A168(0xD000000000000016, 0x800000024CA8A7D0, 0xD000000000000058, 0x800000024CA8A7F0, 0x5574737269466E6FLL, 0xEF29286B636F6C6ELL);
    uint64_t v8 = *(void *)(v0 + 32);
    if (v8)
    {
      uint64_t v9 = *(uint64_t (**)(uint64_t))(**(void **)(v8 + 56) + 136);
      swift_retain();
      uint64_t v10 = swift_retain();
      atomic_store(1u, (unsigned __int8 *)v9(v10));
      swift_release();
      swift_beginAccess();
      notify_cancel(*(_DWORD *)(v8 + 48));
      swift_release();
    }
    *(void *)(v0 + 32) = 0;
    swift_release();
    uint64_t v11 = *(void *)(v0 + 40);
    if (v11)
    {
      uint64_t v12 = *(uint64_t (**)(uint64_t))(**(void **)(v11 + 56) + 136);
      swift_retain();
      uint64_t v13 = swift_retain();
      atomic_store(1u, (unsigned __int8 *)v12(v13));
      swift_release();
      swift_beginAccess();
      notify_cancel(*(_DWORD *)(v11 + 48));
      swift_release();
    }
    *(void *)(v0 + 40) = 0;
    swift_release();
    uint64_t v14 = (void *)(v0 + 24);
    swift_beginAccess();
    uint64_t v15 = *(void *)(v1 + 24);
    uint64_t v16 = *(void *)(v15 + 16);
    if (v16)
    {
      uint64_t v22 = v14;
      uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      uint64_t v17 = v3 + 16;
      uint64_t v18 = v19;
      uint64_t v20 = v15 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
      uint64_t v21 = *(void *)(v17 + 56);
      swift_bridgeObjectRetain();
      do
      {
        v18(v6, v20, v2);
        sub_24CA86440();
        (*(void (**)(char *, uint64_t))(v17 - 8))(v6, v2);
        v20 += v21;
        --v16;
      }
      while (v16);
      swift_bridgeObjectRelease();
      uint64_t v14 = v22;
    }
    void *v14 = MEMORY[0x263F8EE78];
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_24CA6A160()
{
  if (!v0[4])
  {
    uint64_t v1 = v0;
    if (!v0[5])
    {
      uint64_t v2 = (void *)v0[2];
      uint64_t v3 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for DarwinNotificationObserver();
      swift_allocObject();
      id v4 = v2;
      v1[4] = sub_24CA70C40(0xD000000000000025, 0x800000024CA8A770, v4, (uint64_t)sub_24CA6AD2C, v3);
      swift_release();
      uint64_t v5 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for DeviceLockStateNotificationObserver();
      swift_allocObject();
      uint64_t v6 = (void *)swift_allocObject();
      uint64_t v6[2] = v4;
      v6[3] = sub_24CA6AD38;
      v6[4] = v5;
      id v7 = v4;
      swift_retain();
      uint64_t v8 = sub_24CA70C40(0xD000000000000024, 0x800000024CA8A7A0, v7, (uint64_t)sub_24CA6AD80, (uint64_t)v6);
      swift_release();
      v1[5] = v8;
      swift_release();
    }
  }
}

uint64_t sub_24CA6A328()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B180C30 != -1) {
    swift_once();
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)qword_26B181278 + 136);
  uint64_t v4 = swift_retain();
  LOBYTE(v3) = *(unsigned char *)v3(v4);
  swift_release();
  if ((v3 & 1) == 0)
  {
    uint64_t result = MKBDeviceUnlockedSinceBoot();
    if (result != 1) {
      return result;
    }
    uint64_t v6 = *(uint64_t (**)(uint64_t))(*(void *)qword_26B181278 + 136);
    uint64_t v7 = swift_retain();
    *(unsigned char *)v6(v7) = 1;
    swift_release();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = sub_24CA86460();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
    uint64_t v9 = swift_allocObject();
    swift_weakInit();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v9;
    sub_24CA69C38((uint64_t)v2, (uint64_t)&unk_269807B70, (uint64_t)v10);
    swift_release();
    sub_24CA6AE88((uint64_t)v2);
    return swift_release();
  }
  return result;
}

uint64_t sub_24CA6A544(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  if (result)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v8 = sub_24CA86460();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 1, 1, v8);
      uint64_t v9 = swift_allocObject();
      swift_weakInit();
      uint64_t v10 = (void *)swift_allocObject();
      v10[2] = 0;
      v10[3] = 0;
      v10[4] = v9;
      sub_24CA69C38((uint64_t)v4, (uint64_t)&unk_269807B50, (uint64_t)v10);
      swift_release();
      sub_24CA6AE88((uint64_t)v4);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24CA6A6D8()
{
  v1[2] = v0;
  type metadata accessor for FirstUnlockObserver();
  v1[3] = sub_24CA6AC98();
  uint64_t v3 = sub_24CA86430();
  v1[4] = v3;
  v1[5] = v2;
  return MEMORY[0x270FA2498](sub_24CA6A760, v3, v2);
}

uint64_t sub_24CA6A760()
{
  if (qword_26B180C30 != -1) {
    swift_once();
  }
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)qword_26B181278 + 136);
  uint64_t v2 = swift_retain();
  LOBYTE(v1) = *(unsigned char *)v1(v2);
  swift_release();
  if (v1) {
    goto LABEL_6;
  }
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)qword_26B181278 + 136);
    uint64_t v4 = swift_retain();
    *(unsigned char *)v3(v4) = 1;
    swift_release();
LABEL_6:
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  sub_24CA6A160();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v7;
  void *v7 = v0;
  v7[1] = sub_24CA6A940;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24CA6A940()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_24CA61F2C, v3, v2);
}

uint64_t sub_24CA6AA60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269807A70);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = (unint64_t *)(a2 + 24);
  swift_beginAccess();
  unint64_t v9 = *(void *)(a2 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 24) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v9 = sub_24CA82830(0, *(void *)(v9 + 16) + 1, 1, v9);
    unint64_t *v8 = v9;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    unint64_t v9 = sub_24CA82830(v11 > 1, v12 + 1, 1, v9);
    unint64_t *v8 = v9;
  }
  *(void *)(v9 + 16) = v12 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v12, v7, v4);
  return swift_endAccess();
}

uint64_t sub_24CA6AC00()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FirstUnlockObserver()
{
  return self;
}

uint64_t sub_24CA6AC74()
{
  return sub_24CA864E0();
}

unint64_t sub_24CA6AC98()
{
  unint64_t result = qword_269807B40;
  if (!qword_269807B40)
  {
    type metadata accessor for FirstUnlockObserver();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269807B40);
  }
  return result;
}

uint64_t sub_24CA6ACEC(uint64_t a1)
{
  return sub_24CA6AA60(a1, v1);
}

uint64_t sub_24CA6ACF4()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CA6AD2C()
{
  return sub_24CA6A328();
}

uint64_t sub_24CA6AD38(void *a1)
{
  return sub_24CA6A544(a1);
}

uint64_t sub_24CA6AD40()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CA6AD80(int a1, char a2)
{
  return sub_24CA58D74(a1, a2 & 1, v2[2], v2[3], v2[4]);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24CA6ADD8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CA4EF10;
  v5[5] = a1;
  v5[6] = v4;
  return MEMORY[0x270FA2498](sub_24CA69AB4, 0, 0);
}

uint64_t sub_24CA6AE88(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CA6AEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA6AF50(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24CA6B030;
  return v5(v2 + 32);
}

uint64_t sub_24CA6B030()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24CA6B144()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CA6B17C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CA4E148;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269807B58 + dword_269807B58);
  return v6(a1, v4);
}

uint64_t objectdestroy_23Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CA6B278(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CA4E148;
  v5[5] = a1;
  v5[6] = v4;
  return MEMORY[0x270FA2498](sub_24CA69AB4, 0, 0);
}

uint64_t sub_24CA6B328()
{
  return 1;
}

uint64_t sub_24CA6B330()
{
  return sub_24CA86760();
}

uint64_t sub_24CA6B374()
{
  return sub_24CA86730();
}

uint64_t sub_24CA6B39C()
{
  return sub_24CA86760();
}

uint64_t sub_24CA6B3DC()
{
  return 0x53746E656D676573;
}

uint64_t sub_24CA6B3FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x53746E656D676573 && a2 == 0xEB00000000657A69)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24CA866A0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24CA6B4AC()
{
  return 0;
}

void sub_24CA6B4B8(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24CA6B4C4(uint64_t a1)
{
  unint64_t v2 = sub_24CA6BA88();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CA6B500(uint64_t a1)
{
  unint64_t v2 = sub_24CA6BA88();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CA6B53C@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_26B180AD0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CA6BA88();
  sub_24CA86770();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  int v9 = sub_24CA86650();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v9;
  return result;
}

uint64_t sub_24CA6B698(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B17F7A0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CA6BA88();
  sub_24CA86780();
  sub_24CA86660();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24CA6B7CC()
{
  sub_24CA85ED0();
  swift_allocObject();
  sub_24CA85EC0();
  sub_24CA56D74();
  uint64_t v0 = sub_24CA85EB0();
  swift_release();
  return v0;
}

uint64_t sub_24CA6B860@<X0>(uint64_t a1@<X8>)
{
  sub_24CA85EA0();
  swift_allocObject();
  sub_24CA85E90();
  sub_24CA56DC8();
  sub_24CA85E80();
  uint64_t result = swift_release();
  if (!v1)
  {
    *(_DWORD *)a1 = v4;
    *(unsigned char *)(a1 + 4) = 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DataFrameStreamConfigurationError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA6B9E8);
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

ValueMetadata *type metadata accessor for DataFrameStreamConfigurationError()
{
  return &type metadata for DataFrameStreamConfigurationError;
}

ValueMetadata *type metadata accessor for DataFrameStreamConfiguration()
{
  return &type metadata for DataFrameStreamConfiguration;
}

unint64_t sub_24CA6BA34()
{
  unint64_t result = qword_269807B78;
  if (!qword_269807B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807B78);
  }
  return result;
}

unint64_t sub_24CA6BA88()
{
  unint64_t result = qword_26B180A50;
  if (!qword_26B180A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B180A50);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamConfiguration.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for DataFrameStreamConfiguration.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CA6BBCCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24CA6BBF4()
{
  return 0;
}

ValueMetadata *type metadata accessor for DataFrameStreamConfiguration.CodingKeys()
{
  return &type metadata for DataFrameStreamConfiguration.CodingKeys;
}

unint64_t sub_24CA6BC10()
{
  unint64_t result = qword_269807B80;
  if (!qword_269807B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807B80);
  }
  return result;
}

unint64_t sub_24CA6BC68()
{
  unint64_t result = qword_26B180A60;
  if (!qword_26B180A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B180A60);
  }
  return result;
}

unint64_t sub_24CA6BCC0()
{
  unint64_t result = qword_26B180A58;
  if (!qword_26B180A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B180A58);
  }
  return result;
}

Swift::Bool __swiftcall DataFrameStreamSegment.deleteFrame(index:)(Swift::UInt32 index)
{
  uint64_t v2 = *(void *)&index;
  uint64_t v3 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)v1;
  uint64_t v7 = *(void *)(v1 + 8);
  int v9 = *(void **)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v10 = *(void *)(v1 + 32);
  int v11 = *(_DWORD *)(v1 + 40);
  if (*(_DWORD *)(*(void *)(v8 + 16) + 16) <= v2) {
    goto LABEL_20;
  }
  uint64_t v12 = 8 * v2 + 8;
  uint64_t v13 = *(void *)(v10 + 16);
  uint64_t v14 = *(void *)(v13 + 32);
  BOOL v15 = __OFSUB__(v14, v12);
  uint64_t v16 = v14 - v12;
  if (v15)
  {
    __break(1u);
    goto LABEL_30;
  }
  unsigned int v17 = atomic_load((unsigned __int8 *)(*(void *)(v13 + 16) + v16 + 4));
  if (v17 > 5)
  {
LABEL_20:
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v35 = __swift_project_value_buffer(v3, (uint64_t)qword_26B181220);
    sub_24CA4CFB0(v35, (uint64_t)v5);
    v39[0] = 0;
    v39[1] = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    BOOL v36 = "Unknown frame index: ";
    uint64_t v37 = 0xD000000000000015;
    goto LABEL_23;
  }
  int v18 = 1 << v17;
  if ((v18 & 0x26) == 0)
  {
    if ((v18 & 0x18) != 0)
    {
      if (qword_26B180878 == -1)
      {
LABEL_19:
        uint64_t v34 = __swift_project_value_buffer(v3, (uint64_t)qword_26B181220);
        sub_24CA4CFB0(v34, (uint64_t)v5);
        v39[0] = 0;
        v39[1] = 0xE000000000000000;
        sub_24CA865B0();
        swift_bridgeObjectRelease();
        strcpy((char *)v39, "Frame index: ");
        HIWORD(v39[1]) = -4864;
        int v41 = v2;
        sub_24CA86680();
        sub_24CA86320();
        swift_bridgeObjectRelease();
        sub_24CA86320();
        sub_24CA5A168(v39[0], v39[1], 0xD000000000000069, 0x800000024CA8A230, 0xD000000000000013, 0x800000024CA8A870);
        swift_bridgeObjectRelease();
        sub_24CA4D06C((uint64_t)v5);
        return 1;
      }
LABEL_31:
      swift_once();
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  uint64_t v19 = *(void *)(v10 + 16);
  uint64_t v20 = *(void *)(v19 + 32);
  BOOL v15 = __OFSUB__(v20, v12);
  uint64_t v21 = v20 - v12;
  if (v15)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  atomic_exchange((atomic_uchar *volatile)(*(void *)(v19 + 16) + v21 + 4), 3u);
  v39[0] = v6;
  v39[1] = v7;
  uint64_t v39[2] = (uint64_t)v9;
  v39[3] = v8;
  v39[4] = v10;
  int v40 = v11;
  uint64_t v22 = sub_24CA6E0F4(v2);
  if ((v24 & 1) == 0)
  {
    uint64_t v25 = v23;
    BOOL v26 = v23 < v22;
    size_t v27 = v23 - v22;
    if (!v26)
    {
      uint64_t v28 = v9[3];
      if (v22 < v28 || (uint64_t v29 = v9[4], v22 > v29) || v25 < v28 || v29 < v25)
      {
        if (qword_26B180878 == -1)
        {
LABEL_28:
          __swift_project_value_buffer(v3, (uint64_t)qword_26B181220);
          sub_24CA5A180(0xD000000000000027, 0x800000024CA8A8C0, 0xD000000000000069, 0x800000024CA8A230, 0xD000000000000013, 0x800000024CA8A870);
          return 0;
        }
      }
      else
      {
        if ((v27 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else
        {
          if (v25 != v22) {
            bzero((void *)(v9[2] + v22), v27);
          }
          uint64_t v30 = *(void *)(v10 + 16);
          uint64_t v31 = *(void *)(v30 + 32);
          BOOL v15 = __OFSUB__(v31, v12);
          uint64_t v32 = v31 - v12;
          if (!v15)
          {
            atomic_exchange((atomic_uchar *volatile)(*(void *)(v30 + 16) + v32 + 4), 4u);
            Swift::Bool result = 1;
            atomic_fetch_add((atomic_uint *volatile)(*(void *)(v8 + 16) + 20), 1u);
            return result;
          }
        }
        __break(1u);
      }
      swift_once();
      goto LABEL_28;
    }
    __break(1u);
    goto LABEL_33;
  }
  if (qword_26B180878 != -1) {
LABEL_33:
  }
    swift_once();
  uint64_t v38 = __swift_project_value_buffer(v3, (uint64_t)qword_26B181220);
  sub_24CA4CFB0(v38, (uint64_t)v5);
  v39[0] = 0;
  v39[1] = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  BOOL v36 = "unable to retrieve data region for ";
  uint64_t v37 = 0xD000000000000023;
LABEL_23:
  v39[0] = v37;
  v39[1] = (unint64_t)(v36 - 32) | 0x8000000000000000;
  int v41 = v2;
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A180(v39[0], v39[1], 0xD000000000000069, 0x800000024CA8A230, 0xD000000000000013, 0x800000024CA8A870);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v5);
  return 0;
}

uint64_t DataFrameStreamSegment.identifierSeed.getter()
{
  return *(void *)(*(void *)(*(void *)(v0 + 24) + 16) + 24);
}

uint64_t DataFrameStreamSegment.writtenFrameCount.getter()
{
  return *(unsigned int *)(*(void *)(*(void *)(v0 + 24) + 16) + 16);
}

unint64_t DataFrameStreamSegment.identifierSeed.setter(unint64_t result)
{
  atomic_store(result, (unint64_t *)(*(void *)(*(void *)(v1 + 24) + 16) + 24));
  return result;
}

uint64_t DataFrameStreamSegment.init(name:filePath:byteSize:access:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W3>, char *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v12 = sub_24CA86020();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  BOOL v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4 < 0x41)
  {
    sub_24CA65AD4();
    swift_allocError();
    *uint64_t v22 = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
    goto LABEL_5;
  }
  char v16 = *a5;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a3, v12);
  char v26 = v16;
  type metadata accessor for MemoryMappedRegion();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v17 = MemoryMappedRegion.init(filePath:requestedByteSize:minimumByteSize:access:)((uint64_t)v15, a4, 1088, &v26);
  if (v6)
  {
LABEL_5:
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v18 = v17;
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
  uint64_t v19 = *(void *)(v18 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A30);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  type metadata accessor for SegmentOffsetTable();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v18;
  swift_retain();
  *(void *)a6 = v25;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = v18;
  *(void *)(a6 + 24) = v20;
  *(void *)(a6 + 32) = v21;
  *(_DWORD *)(a6 + 40) = a4;
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

int64_t DataFrameStreamSegment.append(data:compressed:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v8 = type metadata accessor for InternalLogger();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  int v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)v3;
  unint64_t v13 = *(void *)(v3 + 8);
  uint64_t v14 = *(void *)(v3 + 16);
  uint64_t v15 = *(void *)(v3 + 24);
  uint64_t v16 = *(void *)(v3 + 32);
  unint64_t v17 = a2 >> 62;
  unsigned int v18 = *(_DWORD *)(v3 + 40);
  uint64_t v19 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v19) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_35;
      }
      uint64_t v19 = (int)v19;
LABEL_6:
      if (v18 < 0x40)
      {
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      if (v19 > v18 - 64)
      {
        sub_24CA65A80();
        swift_allocError();
        *uint64_t v23 = 3;
        return swift_willThrow();
      }
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      switch((int)v17)
      {
        case 1:
          if (__OFSUB__(HIDWORD(a1), a1)) {
            goto LABEL_37;
          }
          unint64_t v26 = HIDWORD(a1) - (int)a1;
LABEL_14:
          if ((v26 & 0x8000000000000000) != 0 || HIDWORD(v26)) {
            goto LABEL_44;
          }
          if (v17 != 2) {
            goto LABEL_20;
          }
          uint64_t v30 = *(void *)(a1 + 16);
          uint64_t v29 = *(void *)(a1 + 24);
          BOOL v22 = __OFSUB__(v29, v30);
          uint64_t v25 = v29 - v30;
          if (!v22) {
            goto LABEL_22;
          }
          __break(1u);
LABEL_20:
          if (__OFSUB__(HIDWORD(a1), a1)) {
            goto LABEL_39;
          }
          uint64_t v25 = HIDWORD(a1) - (int)a1;
LABEL_22:
          uint64_t v31 = v25 + 24;
          if (__OFADD__(v25, 24)) {
            goto LABEL_34;
          }
          unint64_t v50 = a2;
          uint64_t v51 = a3;
          uint64_t v52 = v9;
          uint64_t v53 = v11;
          uint64_t v54 = v12;
          unint64_t v55 = v13;
          uint64_t v56 = v14;
          uint64_t v57 = v15;
          uint64_t v58 = v16;
          unsigned int v59 = v18;
          int64_t result = sub_24CA6DB24(v25 + 24);
          if (v4) {
            return result;
          }
          uint64_t v48 = v16;
          uint64_t v49 = v31;
          uint64_t v47 = v15;
          if (v33)
          {
            if (qword_26B180878 == -1)
            {
LABEL_32:
              uint64_t v44 = __swift_project_value_buffer(v52, (uint64_t)qword_26B181220);
              uint64_t v45 = (uint64_t)v53;
              sub_24CA4CFB0(v44, (uint64_t)v53);
              uint64_t v54 = 0;
              unint64_t v55 = 0xE000000000000000;
              sub_24CA865B0();
              swift_bridgeObjectRelease();
              uint64_t v54 = 0xD000000000000024;
              unint64_t v55 = 0x800000024CA8A910;
              uint64_t v60 = v49;
              sub_24CA86680();
              sub_24CA86320();
              swift_bridgeObjectRelease();
              sub_24CA5A180(v54, v55, 0xD000000000000069, 0x800000024CA8A230, 0xD000000000000018, 0x800000024CA8A940);
              swift_bridgeObjectRelease();
              sub_24CA4D06C(v45);
              return 0;
            }
LABEL_41:
            swift_once();
            goto LABEL_32;
          }
          uint64_t v34 = v32;
          unsigned int v35 = result;
          sub_24CA6DCA8(v51 & 1 | (v26 << 32), 0, 0, v32);
          if (__OFADD__(v34, 24)) {
            goto LABEL_40;
          }
          MemoryMappedRegion.write(data:at:)(a1, v50, v34 + 24);
          uint64_t v36 = 8 * v35 + 8;
          uint64_t v37 = *(void *)(v48 + 16);
          uint64_t v38 = *(void *)(v37 + 32);
          BOOL v22 = __OFSUB__(v38, v36);
          uint64_t v39 = v38 - v36;
          if (v22)
          {
            __break(1u);
LABEL_43:
            __break(1u);
LABEL_44:
            sub_24CA865F0();
            __break(1u);
            JUMPOUT(0x24CA6C91CLL);
          }
          int v40 = (atomic_uchar *)(*(void *)(v37 + 16) + v39 + 4);
          uint64_t v41 = v47;
          do
          {
            int v42 = 1;
            atomic_compare_exchange_strong(v40, (unsigned __int8 *)&v42, 2u);
          }
          while (v42 != 1);
          uint64_t v43 = *(void *)(*(void *)(v41 + 16) + 24);
          int64_t result = v43 + v35;
          if (__CFADD__(v43, v35)) {
            goto LABEL_43;
          }
          return result;
        case 2:
          uint64_t v28 = *(void *)(a1 + 16);
          uint64_t v27 = *(void *)(a1 + 24);
          unint64_t v26 = v27 - v28;
          if (!__OFSUB__(v27, v28)) {
            goto LABEL_14;
          }
          goto LABEL_38;
        case 3:
          goto LABEL_22;
        default:
          uint64_t v25 = BYTE6(a2);
          unint64_t v26 = BYTE6(a2);
          goto LABEL_22;
      }
    case 2uLL:
      uint64_t v21 = *(void *)(a1 + 16);
      uint64_t v20 = *(void *)(a1 + 24);
      BOOL v22 = __OFSUB__(v20, v21);
      uint64_t v19 = v20 - v21;
      if (!v22) {
        goto LABEL_6;
      }
      goto LABEL_36;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v19 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24CA6C93C(unint64_t a1)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)v1;
  unint64_t v9 = *(void *)(v1 + 8);
  uint64_t v11 = *(void *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t v12 = *(void *)(v1 + 32);
  int v13 = *(_DWORD *)(v1 + 40);
  uint64_t v14 = *(void *)(v10 + 16);
  unint64_t v15 = *(void *)(v14 + 24);
  uint64_t v16 = *(unsigned int *)(v14 + 16);
  unint64_t v17 = v15 + v16;
  if (__CFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v17 < v15)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v2 = (void *)(a1 - v15);
  if (a1 < v15) {
    return 0;
  }
  if (v17 <= a1) {
    return 1;
  }
  unint64_t v18 = (a1 - v15);
  uint64_t v19 = 8 * v2 + 8;
  uint64_t v20 = *(void *)(v12 + 16);
  uint64_t v21 = *(void *)(v20 + 32);
  BOOL v22 = __OFSUB__(v21, v19);
  uint64_t v23 = v21 - v19;
  if (v22) {
    goto LABEL_25;
  }
  int v24 = atomic_load((unsigned __int8 *)(*(void *)(v20 + 16) + v23 + 4));
  if ((v24 - 1) < 2) {
    return v18;
  }
  if ((v24 - 3) < 2) {
    return 2;
  }
  if (v24 != 5)
  {
    if (qword_26B180878 == -1)
    {
LABEL_19:
      uint64_t v27 = __swift_project_value_buffer(v5, (uint64_t)qword_26B181220);
      sub_24CA4CFB0(v27, (uint64_t)v7);
      uint64_t v32 = 0;
      unint64_t v33 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      uint64_t v32 = 0xD000000000000022;
      unint64_t v33 = 0x800000024CA8AC00;
      int v38 = (int)v2;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA5A180(v32, v33, 0xD000000000000069, 0x800000024CA8A230, 0xD00000000000001BLL, 0x800000024CA8AC30);
      swift_bridgeObjectRelease();
      sub_24CA4D06C((uint64_t)v7);
      return 3;
    }
LABEL_26:
    uint64_t v29 = v5;
    swift_once();
    uint64_t v5 = v29;
    goto LABEL_19;
  }
  uint64_t v31 = *(void *)v1;
  uint64_t v32 = v8;
  unint64_t v25 = v9;
  unint64_t v33 = v9;
  uint64_t v34 = v11;
  uint64_t v35 = v10;
  uint64_t v36 = v12;
  int v37 = v13;
  unint64_t v26 = sub_24CA6E174(v2);
  if (!v26) {
    return 2;
  }
  unint64_t v18 = *(void *)(*(void *)(v26[4] + 16) + 16);
  if (!v18)
  {
    swift_release();
    return 2;
  }
  if (v18 < v15 || v18 >= v17)
  {
    swift_release();
  }
  else
  {
    uint64_t v32 = v31;
    unint64_t v33 = v25;
    uint64_t v34 = v11;
    uint64_t v35 = v10;
    uint64_t v36 = v12;
    int v37 = v13;
    unint64_t v18 = sub_24CA6C93C(v18);
    swift_release();
  }
  return v18;
}

uint64_t DataFrameStreamSegment.frameData(forSegmentIndex:)(void *a1)
{
  uint64_t v3 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = *(_DWORD *)(v1 + 40);
  uint64_t v16 = *(void *)v1;
  long long v17 = *(_OWORD *)(v1 + 8);
  long long v18 = *(_OWORD *)(v1 + 24);
  int v19 = v6;
  uint64_t v7 = sub_24CA6E174(a1);
  if (v7)
  {
    uint64_t v8 = v7[4];
    uint64_t v9 = *(void *)(v8 + 16);
    if (*(unsigned char *)(v9 + 8))
    {
      uint64_t v10 = 1023;
      while (*(unsigned char *)(v9 + 8))
      {
        if (!--v10)
        {
          if (qword_26B180878 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v3, (uint64_t)qword_26B181220);
          sub_24CA5A180(0xD000000000000025, 0x800000024CA8A9B0, 0xD000000000000062, 0x800000024CA8A9E0, 0xD000000000000019, 0x800000024CA8AA50);
          swift_release();
          return 0;
        }
      }
    }
    uint64_t v11 = (atomic_uchar *)(v9 + 9);
    atomic_fetch_add_explicit((atomic_uchar *volatile)(v9 + 9), 1u, memory_order_relaxed);
    uint64_t v12 = sub_24CA6F4F4((unsigned char *)v7[3], *(unsigned int *)(*(void *)(v8 + 16) + 4));
    atomic_fetch_add_explicit(v11, 0xFFu, memory_order_relaxed);
    swift_release();
  }
  else
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v3, (uint64_t)qword_26B181220);
    sub_24CA4CFB0(v13, (uint64_t)v5);
    uint64_t v16 = 0;
    *(void *)&long long v17 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v16 = 0xD000000000000023;
    *(void *)&long long v17 = 0x800000024CA8A890;
    v15[3] = a1;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA5A180(v16, v17, 0xD000000000000069, 0x800000024CA8A230, 0xD00000000000001BLL, 0x800000024CA8A990);
    swift_bridgeObjectRelease();
    sub_24CA4D06C((uint64_t)v5);
    return 0;
  }
  return v12;
}

uint64_t sub_24CA6CF04@<X0>(unsigned int a1@<W0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, long long *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  long long v11 = *(long long *)((char *)a4 + 28);
  long long v12 = a4[1];
  long long v27 = *a4;
  *(_OWORD *)uint64_t v28 = v12;
  *(_OWORD *)&v28[12] = v11;
  unsigned int v13 = *(_DWORD *)(*(void *)(*(void *)&v28[8] + 16) + 16);
  uint64_t result = swift_retain();
  if (v13 <= a1) {
    goto LABEL_8;
  }
  uint64_t v15 = 8 * a1 + 8;
  uint64_t v16 = *(void *)(*(void *)&v28[16] + 16);
  uint64_t v17 = *(void *)(v16 + 32);
  BOOL v18 = __OFSUB__(v17, v15);
  uint64_t v19 = v17 - v15;
  if (v18)
  {
    __break(1u);
    return result;
  }
  uint64_t v20 = *(unsigned int *)(*(void *)(v16 + 16) + v19);
  type metadata accessor for DataFrameReader();
  swift_allocObject();
  uint64_t v21 = (void *)swift_retain();
  BOOL v22 = sub_24CA52F94(v21, v20);
  if (!v22)
  {
LABEL_8:
    uint64_t result = swift_release_n();
LABEL_9:
    *(void *)a5 = 0;
    *(unsigned char *)(a5 + 8) = 1;
    return result;
  }
  uint64_t v23 = (uint64_t)v22;
  uint64_t v25 = 0;
  char v26 = 1;
  char v24 = 0;
  swift_retain();
  swift_retain();
  sub_24CA663A0((uint64_t)&v27);
  sub_24CA530F4(v23, a2, a3, v23, &v24, (uint64_t)&v27, a1, (uint64_t)&v25);
  swift_release();
  uint64_t result = swift_release_n();
  if (v6) {
    return result;
  }
  if ((v24 & 1) == 0) {
    goto LABEL_9;
  }
  if (v26)
  {
    *(void *)a5 = 1;
    *(unsigned char *)(a5 + 8) = 1;
  }
  else
  {
    *(void *)a5 = v25;
    *(unsigned char *)(a5 + 8) = 0;
  }
  return result;
}

uint64_t DataFrameStreamSegment.mutateFrame(frameSegmentIndex:mutate:supersede:)@<X0>(uint64_t result@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t, unint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  long long v9 = *(long long *)((char *)v6 + 28);
  long long v10 = v6[1];
  long long v26 = *v6;
  *(_OWORD *)long long v27 = v10;
  *(_OWORD *)&v27[12] = v9;
  if (*(_DWORD *)(*(void *)(*(void *)&v27[8] + 16) + 16) <= result) {
    goto LABEL_8;
  }
  unsigned int v11 = result;
  uint64_t v12 = 8 * result + 8;
  uint64_t v13 = *(void *)(*(void *)&v27[16] + 16);
  uint64_t v14 = *(void *)(v13 + 32);
  BOOL v15 = __OFSUB__(v14, v12);
  uint64_t v16 = v14 - v12;
  if (v15)
  {
    __break(1u);
    return result;
  }
  uint64_t v21 = *(unsigned int *)(*(void *)(v13 + 16) + v16);
  type metadata accessor for DataFrameReader();
  swift_allocObject();
  BOOL v22 = (void *)swift_retain();
  uint64_t result = (uint64_t)sub_24CA52F94(v22, v21);
  if (!result) {
    goto LABEL_8;
  }
  uint64_t v23 = result;
  uint64_t v24 = 0;
  char v25 = 1;
  char v28 = 0;
  sub_24CA663A0((uint64_t)&v26);
  sub_24CA53238(v23, a2, a3, v23, &v28, a4, a5, (uint64_t)&v26, v11, (uint64_t)&v24);
  sub_24CA5355C((uint64_t)&v26);
  uint64_t result = swift_release();
  if (v7) {
    return result;
  }
  if (v28)
  {
    if (v25)
    {
      *(void *)a6 = 1;
      *(unsigned char *)(a6 + 8) = 1;
    }
    else
    {
      *(void *)a6 = v24;
      *(unsigned char *)(a6 + 8) = 0;
    }
  }
  else
  {
LABEL_8:
    *(void *)a6 = 0;
    *(unsigned char *)(a6 + 8) = 1;
  }
  return result;
}

uint64_t sub_24CA6D228@<X0>(unsigned int a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X2>, long long *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X8>)
{
  long long v16 = *(long long *)((char *)a4 + 28);
  long long v17 = a4[1];
  long long v33 = *a4;
  *(_OWORD *)uint64_t v34 = v17;
  *(_OWORD *)&v34[12] = v16;
  uint64_t v18 = *(void *)(*(void *)&v34[8] + 16);
  swift_retain();
  uint64_t result = sub_24CA497DC(a6, a7);
  if (*(_DWORD *)(v18 + 16) <= a1) {
    goto LABEL_8;
  }
  uint64_t v20 = 8 * a1 + 8;
  uint64_t v21 = *(void *)(*(void *)&v34[16] + 16);
  uint64_t v22 = *(void *)(v21 + 32);
  BOOL v23 = __OFSUB__(v22, v20);
  uint64_t v24 = v22 - v20;
  if (!v23)
  {
    uint64_t v25 = a2;
    unint64_t v26 = a3;
    uint64_t v27 = *(unsigned int *)(*(void *)(v21 + 16) + v24);
    type metadata accessor for DataFrameReader();
    swift_allocObject();
    char v28 = (void *)swift_retain();
    uint64_t v29 = sub_24CA52F94(v28, v27);
    if (v29)
    {
      uint64_t v30 = (uint64_t)v29;
      unint64_t v31 = 0;
      char v32 = 1;
      char v35 = 0;
      swift_retain();
      sub_24CA497DC(a6, a7);
      swift_retain();
      sub_24CA497DC(v25, v26);
      sub_24CA663A0((uint64_t)&v33);
      sub_24CA5334C(v30, v30, v25, v26, &v35, (uint64_t)&v33, a1, &v31, a5, a6, a7);
      sub_24CA4986C(a6, a7);
      swift_release();
      swift_release_n();
      sub_24CA4986C(a6, a7);
      swift_release();
      if (v8) {
        return sub_24CA4986C(a6, a7);
      }
      if (v35)
      {
        if (v32)
        {
          *(void *)a8 = 1;
          *(unsigned char *)(a8 + 8) = 1;
        }
        else
        {
          *(void *)a8 = v31;
          *(unsigned char *)(a8 + 8) = 0;
        }
        return sub_24CA4986C(a6, a7);
      }
LABEL_9:
      *(void *)a8 = 0;
      *(unsigned char *)(a8 + 8) = 1;
      return sub_24CA4986C(a6, a7);
    }
LABEL_8:
    swift_release();
    sub_24CA4986C(a6, a7);
    swift_release();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t DataFrameStreamSegment.setFrame(frameSegmentIndex:mutated:supersede:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  long long v9 = *(long long *)((char *)v6 + 28);
  long long v10 = v6[1];
  long long v26 = *v6;
  *(_OWORD *)uint64_t v27 = v10;
  *(_OWORD *)&v27[12] = v9;
  if (*(_DWORD *)(*(void *)(*(void *)&v27[8] + 16) + 16) <= result) {
    goto LABEL_8;
  }
  unsigned int v11 = result;
  uint64_t v12 = 8 * result + 8;
  uint64_t v13 = *(void *)(*(void *)&v27[16] + 16);
  uint64_t v14 = *(void *)(v13 + 32);
  BOOL v15 = __OFSUB__(v14, v12);
  uint64_t v16 = v14 - v12;
  if (v15)
  {
    __break(1u);
    return result;
  }
  uint64_t v21 = *(unsigned int *)(*(void *)(v13 + 16) + v16);
  type metadata accessor for DataFrameReader();
  swift_allocObject();
  uint64_t v22 = (void *)swift_retain();
  uint64_t result = (uint64_t)sub_24CA52F94(v22, v21);
  if (!result) {
    goto LABEL_8;
  }
  uint64_t v23 = result;
  uint64_t v24 = 0;
  char v25 = 1;
  char v28 = 0;
  sub_24CA497DC(a2, a3);
  sub_24CA663A0((uint64_t)&v26);
  sub_24CA534AC(v23, v23, a2, a3, &v28, a4, a5, (uint64_t)&v26, v11, (uint64_t)&v24);
  sub_24CA5355C((uint64_t)&v26);
  sub_24CA4986C(a2, a3);
  uint64_t result = swift_release();
  if (v7) {
    return result;
  }
  if (v28)
  {
    if (v25)
    {
      *(void *)a6 = 1;
      *(unsigned char *)(a6 + 8) = 1;
    }
    else
    {
      *(void *)a6 = v24;
      *(unsigned char *)(a6 + 8) = 0;
    }
  }
  else
  {
LABEL_8:
    *(void *)a6 = 0;
    *(unsigned char *)(a6 + 8) = 1;
  }
  return result;
}

uint64_t DataFrameMutationResult.succeeded.getter()
{
  return (*(void *)v0 != 0) | ((*(unsigned char *)(v0 + 8) & 1) == 0);
}

unint64_t *(*DataFrameStreamSegment.identifierSeed.modify(void *a1))(unint64_t *result)
{
  a1[1] = v1;
  *a1 = *(void *)(*(void *)(*(void *)(v1 + 24) + 16) + 24);
  return sub_24CA6D648;
}

unint64_t *sub_24CA6D648(unint64_t *result)
{
  return result;
}

int64_t sub_24CA6D660(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v6 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v9 = *a2;
  uint64_t v10 = *(void *)(v2 + 32);
  uint64_t v11 = *(void *)(*(void *)(v2 + 24) + 16);
  unint64_t v12 = atomic_load((unint64_t *)(v11 + 8));
  while (1)
  {
    int64_t v13 = v12;
    if (v9)
    {
      if (v9 == 1) {
        uint64_t v14 = 4;
      }
      else {
        uint64_t v14 = 8;
      }
      unint64_t v15 = v12 + v14;
      if (__OFADD__(v12, v14)) {
        goto LABEL_36;
      }
      BOOL v16 = __OFSUB__(v15, 1);
      int64_t v17 = v15 - 1;
      if (v16) {
        goto LABEL_37;
      }
      uint64_t v18 = v17 / v14;
      int64_t v13 = v18 * v14;
      if ((unsigned __int128)(v18 * (__int128)v14) >> 64 != (v18 * v14) >> 63) {
        goto LABEL_38;
      }
    }
    if (!v12)
    {
      BOOL v16 = __OFADD__(v13, 32);
      v13 += 32;
      if (v16) {
        goto LABEL_42;
      }
    }
    int64_t v19 = v13 + a1;
    if (__OFADD__(v13, a1))
    {
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (v9)
    {
      if (v9 == 1) {
        uint64_t v20 = 4;
      }
      else {
        uint64_t v20 = 8;
      }
      int64_t v21 = v19 + v20;
      if (__OFADD__(v19, v20)) {
        goto LABEL_39;
      }
      BOOL v16 = __OFSUB__(v21, 1);
      int64_t v22 = v21 - 1;
      if (v16) {
        goto LABEL_40;
      }
      uint64_t v23 = v22 / v20;
      int64_t v19 = v23 * v20;
      if ((unsigned __int128)(v23 * (__int128)v20) >> 64 != (v23 * v20) >> 63) {
        goto LABEL_41;
      }
    }
    if (v19 < v13) {
      goto LABEL_34;
    }
    unsigned int v24 = atomic_load((unsigned int *)(v11 + 16));
    uint64_t v25 = 8 * v24 + 8;
    uint64_t v26 = *(void *)(*(void *)(v10 + 16) + 32);
    int64_t v3 = v26 - v25;
    if (__OFSUB__(v26, v25)) {
      goto LABEL_35;
    }
    if (v13 >= v3)
    {
      if (qword_26B180878 == -1)
      {
LABEL_27:
        uint64_t v29 = __swift_project_value_buffer(v6, (uint64_t)qword_26B181220);
        sub_24CA4CFB0(v29, (uint64_t)v8);
        unint64_t v38 = 0;
        unint64_t v39 = 0xE000000000000000;
        sub_24CA865B0();
        swift_bridgeObjectRelease();
        unint64_t v38 = 0xD000000000000016;
        unint64_t v39 = 0x800000024CA8AB50;
        int64_t v35 = v13;
        sub_24CA86680();
        sub_24CA86320();
        swift_bridgeObjectRelease();
        sub_24CA86320();
        int64_t v35 = v3;
        sub_24CA86680();
        sub_24CA86320();
        swift_bridgeObjectRelease();
        uint64_t v30 = v38;
        int64_t v13 = v39;
        goto LABEL_31;
      }
LABEL_43:
      swift_once();
      goto LABEL_27;
    }
    if (v19 > v3) {
      break;
    }
    unint64_t v27 = v12;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(v11 + 8), &v27, v19);
    BOOL v28 = v27 == v12;
    unint64_t v12 = v27;
    if (v28) {
      return v13;
    }
  }
  if (qword_26B180878 != -1) {
    swift_once();
  }
  uint64_t v31 = __swift_project_value_buffer(v6, (uint64_t)qword_26B181220);
  sub_24CA4CFB0(v31, (uint64_t)v8);
  unint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_24CA865B0();
  sub_24CA86320();
  int64_t v40 = v13;
  unint64_t v36 = 0xE000000000000000;
  int64_t v37 = v19;
  int64_t v35 = 0;
  sub_24CA865E0();
  sub_24CA86320();
  sub_24CA865E0();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA86320();
  int64_t v40 = v13;
  unint64_t v36 = 0xE000000000000000;
  int64_t v37 = v3;
  int64_t v35 = 0;
  sub_24CA865E0();
  sub_24CA86320();
  sub_24CA865E0();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  uint64_t v30 = v38;
  int64_t v13 = v39;
LABEL_31:
  sub_24CA5A168(v30, v13, 0xD000000000000069, 0x800000024CA8A230, 0xD000000000000019, 0x800000024CA8AB90);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v8);
  sub_24CA65A80();
  swift_allocError();
  *char v32 = 0;
  swift_willThrow();
  return v13;
}

int64_t sub_24CA6DB24(uint64_t a1)
{
  uint64_t v3 = *v1;
  long long v4 = *(_OWORD *)(v1 + 1);
  uint64_t v6 = v1[3];
  uint64_t v5 = v1[4];
  int v7 = *((_DWORD *)v1 + 10);
  uint64_t v8 = *(atomic_uchar **)(v6 + 16);
  do
  {
    char v9 = 0;
    atomic_compare_exchange_strong(v8, (unsigned __int8 *)&v9, 1u);
  }
  while (v9);
  uint64_t v21 = v3;
  long long v22 = v4;
  uint64_t v23 = v6;
  uint64_t v24 = v5;
  int v25 = v7;
  unsigned __int8 v20 = 2;
  int64_t result = sub_24CA6D660(a1, &v20);
  if (v2) {
    goto LABEL_4;
  }
  if (v11)
  {
    int64_t result = 0;
    goto LABEL_4;
  }
  unint64_t v12 = result;
  unsigned int v13 = atomic_fetch_add((atomic_uint *volatile)(*(void *)(v6 + 16) + 16), 1u) + 1;
  int64_t result = v13 - 1;
  if (v13)
  {
    if ((v12 & 0x8000000000000000) != 0 || HIDWORD(v12)) {
      goto LABEL_14;
    }
    uint64_t v14 = 8 * (v13 - 1) + 8;
    uint64_t v15 = *(void *)(v5 + 16);
    uint64_t v16 = *(void *)(v15 + 32);
    BOOL v17 = __OFSUB__(v16, v14);
    uint64_t v18 = v16 - v14;
    if (!v17)
    {
      uint64_t v19 = *(void *)(v15 + 16) + v18;
      *(_DWORD *)uint64_t v19 = v12;
      *(unsigned char *)(v19 + 4) = 1;
LABEL_4:
      atomic_store(0, (unsigned __int8 *)v8);
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_14:
  int64_t result = sub_24CA865F0();
  __break(1u);
  return result;
}

uint64_t sub_24CA6DCA8(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v11);
  unsigned int v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = a4 + 24;
  if (__OFADD__(a4, 24))
  {
    __break(1u);
    goto LABEL_20;
  }
  if (result < a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    swift_once();
    goto LABEL_18;
  }
  uint64_t v5 = v4[3];
  uint64_t v6 = v4[4];
  BOOL v16 = v5 <= a4 && v6 >= a4;
  if (result >= v5 && v6 >= result && v16)
  {
    uint64_t v19 = v4[2] + a4;
    *(unsigned char *)uint64_t v19 = a1 & 1;
    *(_DWORD *)(v19 + 4) = HIDWORD(a1);
    *(_WORD *)(v19 + 8) = a2;
    *(void *)(v19 + 16) = a3;
    return result;
  }
  if (qword_26B180878 != -1) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v20 = __swift_project_value_buffer(v11, (uint64_t)qword_26B181220);
  sub_24CA4CFB0(v20, (uint64_t)v13);
  uint64_t v22 = 0;
  unint64_t v23 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  uint64_t v22 = 0xD000000000000011;
  unint64_t v23 = 0x800000024CA8AAB0;
  id v21[2] = v6;
  v21[3] = v5;
  v21[0] = 0;
  v21[1] = 0xE000000000000000;
  sub_24CA865E0();
  sub_24CA86320();
  sub_24CA865E0();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A180(v22, v23, 0xD00000000000005FLL, 0x800000024CA8AAD0, 0xD000000000000019, 0x800000024CA8AB30);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v13);
  return 0;
}

uint64_t DataFrameStreamSegment.iterate(reversed:each:)(int a1, uint64_t (*a2)(uint64_t, void, uint64_t, unint64_t))
{
  int v22 = a1;
  uint64_t v5 = v2[1];
  uint64_t v18 = *v2;
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  int v9 = *((_DWORD *)v2 + 10);
  type metadata accessor for DataFrameStreamSegment.Iterator();
  uint64_t inited = swift_initStackObject();
  *(_DWORD *)(inited + 76) = 0;
  *(unsigned char *)(inited + 80) = 1;
  *(void *)(inited + 24) = *(void *)(*(void *)(v7 + 16) + 24);
  *(void *)(inited + 32) = v18;
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v7;
  *(void *)(inited + 64) = v8;
  *(_DWORD *)(inited + 72) = v9;
  *(unsigned char *)(inited + 16) = v22;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  while (1)
  {
    sub_24CA7EF90(v19);
    unint64_t v11 = v21;
    if (v21 >> 60 == 15)
    {
LABEL_5:
      swift_release();
      swift_setDeallocating();
      swift_release();
      swift_release();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t v12 = v19[0];
    uint64_t v13 = v19[1];
    uint64_t v14 = v20;
    sub_24CA497DC(v20, v21);
    char v15 = a2(v12, 0, v14, v11);
    if (v3) {
      break;
    }
    char v16 = v15;
    sub_24CA52660(v12, v13, v14, v11);
    sub_24CA52660(v12, v13, v14, v11);
    if ((v16 & 1) == 0) {
      goto LABEL_5;
    }
  }
  swift_release();
  swift_setDeallocating();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24CA52660(v12, v13, v14, v11);
  return sub_24CA52660(v12, v13, v14, v11);
}

uint64_t sub_24CA6E0F4(uint64_t result)
{
  uint64_t v2 = v1[2];
  if (*(_DWORD *)(*(void *)(v1[3] + 16) + 16) <= result) {
    return 0;
  }
  uint64_t v3 = 8 * result + 8;
  uint64_t v4 = *(void *)(v1[4] + 16);
  uint64_t v5 = *(void *)(v4 + 32);
  BOOL v6 = __OFSUB__(v5, v3);
  uint64_t v7 = v5 - v3;
  if (v6)
  {
    __break(1u);
    return result;
  }
  uint64_t v8 = *(unsigned int *)(*(void *)(v4 + 16) + v7);
  uint64_t result = v8 + 24;
  uint64_t v9 = *(void *)(v2 + 24);
  uint64_t v10 = *(void *)(v2 + 32);
  BOOL v11 = v9 > v8 || v10 < v8;
  BOOL v12 = v11 || v10 < result;
  if (v12 || result < v9) {
    return 0;
  }
  return result;
}

void *sub_24CA6E174(void *result)
{
  if (*(_DWORD *)(*(void *)(*(void *)(v1 + 24) + 16) + 16) <= result) {
    return 0;
  }
  uint64_t v2 = 8 * result + 8;
  uint64_t v3 = *(void *)(*(void *)(v1 + 32) + 16);
  uint64_t v4 = *(void *)(v3 + 32);
  BOOL v5 = __OFSUB__(v4, v2);
  uint64_t v6 = v4 - v2;
  if (v5)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = *(unsigned int *)(*(void *)(v3 + 16) + v6);
    type metadata accessor for DataFrameReader();
    swift_allocObject();
    uint64_t v8 = (void *)swift_retain();
    return sub_24CA52F94(v8, v7);
  }
  return result;
}

uint64_t sub_24CA6E208(uint64_t a1, unint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, unsigned char *a6, uint64_t a7, unsigned int a8, uint64_t a9)
{
  uint64_t v16 = a3();
  if (!v9)
  {
    unsigned int v57 = a8;
    uint64_t v55 = a7;
    uint64_t v56 = a6;
    uint64_t v18 = a9;
    uint64_t v19 = *(void **)(a5 + 24);
    uint64_t v20 = a2 >> 62;
    unint64_t v21 = v17;
    switch(a2 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(a1), a1)) {
          goto LABEL_48;
        }
        size_t v22 = HIDWORD(a1) - (int)a1;
LABEL_7:
        if ((v22 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
        }
        else
        {
LABEL_8:
          if (v22)
          {
            uint64_t v25 = a5;
            uint64_t v26 = v16;
            bzero(v19, v22);
            uint64_t v18 = a9;
            uint64_t v16 = v26;
            a5 = v25;
            a6 = v56;
          }
LABEL_10:
          unint64_t v27 = v21 >> 62;
          uint64_t v28 = 0;
          switch(v21 >> 62)
          {
            case 1uLL:
              LODWORD(v28) = HIDWORD(v16) - v16;
              if (__OFSUB__(HIDWORD(v16), v16)) {
                goto LABEL_50;
              }
              uint64_t v28 = (int)v28;
              break;
            case 2uLL:
              uint64_t v30 = *(void *)(v16 + 16);
              uint64_t v29 = *(void *)(v16 + 24);
              BOOL v31 = __OFSUB__(v29, v30);
              uint64_t v28 = v29 - v30;
              if (!v31) {
                break;
              }
              goto LABEL_51;
            case 3uLL:
              break;
            default:
              uint64_t v28 = BYTE6(v21);
              break;
          }
          switch((int)v20)
          {
            case 1:
              LODWORD(v32) = HIDWORD(a1) - a1;
              if (__OFSUB__(HIDWORD(a1), a1)) {
                goto LABEL_52;
              }
              uint64_t v32 = (int)v32;
LABEL_25:
              if (v32 >= v28) {
                break;
              }
              goto LABEL_21;
            case 2:
              uint64_t v34 = *(void *)(a1 + 16);
              uint64_t v33 = *(void *)(a1 + 24);
              BOOL v31 = __OFSUB__(v33, v34);
              uint64_t v32 = v33 - v34;
              if (!v31) {
                goto LABEL_25;
              }
              __break(1u);
LABEL_20:
              if (v28 > 0)
              {
LABEL_21:
                uint64_t v54 = v18;
                uint64_t v20 = MEMORY[0x270FA5388](v16);
                unint64_t v36 = (uint64_t *)&v35[4];
                int64_t v37 = v35 + 10;
                os_unfair_lock_lock(v35 + 10);
                sub_24CA58CBC(v36, &v64);
                os_unfair_lock_unlock(v37);
                if (v64 & 1) == 0 || (a1 = v20, unint64_t v38 = sub_24CA5FB94(v20, v21), (v39))
                {
                  sub_24CA4986C(v20, v21);
                  return swift_release();
                }
                uint64_t v48 = 8 * v57 + 8;
                uint64_t v49 = *(void *)(*(void *)(v55 + 32) + 16);
                uint64_t v50 = *(void *)(v49 + 32);
                BOOL v31 = __OFSUB__(v50, v48);
                uint64_t v51 = v50 - v48;
                if (!v31)
                {
                  unint64_t v52 = v38;
                  atomic_exchange((atomic_uchar *volatile)(*(void *)(v49 + 16) + v51 + 4), 5u);
                  atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(v55 + 24) + 16) + 20), 1u);
                  atomic_store(v38, (unint64_t *)(*(void *)(*(void *)(a5 + 32) + 16) + 16));
                  sub_24CA4986C(v20, v21);
                  unsigned char *v56 = 1;
                  *(void *)uint64_t v54 = v52;
                  *(unsigned char *)(v54 + 8) = 0;
                  return swift_release();
                }
                goto LABEL_55;
              }
              break;
            case 3:
              goto LABEL_20;
            default:
              uint64_t v32 = BYTE6(a2);
              goto LABEL_25;
          }
          uint64_t v40 = *(void *)(*(void *)(a5 + 32) + 16);
          switch((int)v27)
          {
            case 1:
              LODWORD(v44) = HIDWORD(v16) - v16;
              if (__OFSUB__(HIDWORD(v16), v16)) {
                goto LABEL_53;
              }
              unint64_t v44 = (int)v44;
LABEL_35:
              if ((v44 & 0x8000000000000000) != 0) {
                goto LABEL_56;
              }
              if (HIDWORD(v44))
              {
                swift_release();
                goto LABEL_58;
              }
              atomic_store(v44, (unsigned int *)(v40 + 4));
              if (v27 == 2)
              {
                uint64_t v45 = *(void *)(v16 + 16);
                uint64_t v46 = *(void *)(v16 + 24);
                uint64_t v41 = v16;
                swift_retain();
                sub_24CA497DC(v41, v21);
                swift_retain();
                sub_24CA497DC(v41, v21);
                swift_retain();
                swift_retain();
                sub_24CA6F41C(v45, v46, v21 & 0x3FFFFFFFFFFFFFFFLL, a5, v41, v21);
                swift_release();
                swift_release();
LABEL_41:
                sub_24CA4986C(v41, v21);
                swift_release();
                sub_24CA4986C(v41, v21);
                *a6 = 1;
                return swift_release();
              }
              uint64_t v47 = (int)v16;
              a1 = v16 >> 32;
              if (v16 >> 32 >= (int)v16)
              {
                uint64_t v41 = v16;
                swift_retain();
                sub_24CA497DC(v41, v21);
                swift_retain();
                sub_24CA497DC(v41, v21);
                sub_24CA6F41C(v47, a1, v21 & 0x3FFFFFFFFFFFFFFFLL, a5, v41, v21);
                goto LABEL_41;
              }
              break;
            case 2:
              uint64_t v43 = *(void *)(v16 + 16);
              uint64_t v42 = *(void *)(v16 + 24);
              BOOL v31 = __OFSUB__(v42, v43);
              unint64_t v44 = v42 - v43;
              if (!v31) {
                goto LABEL_35;
              }
              __break(1u);
LABEL_31:
              atomic_store(0, (unsigned int *)(v40 + 4));
              uint64_t v41 = v16;
LABEL_32:
              swift_retain();
              sub_24CA4986C(v41, v21);
              goto LABEL_41;
            case 3:
              goto LABEL_31;
            default:
              atomic_store(BYTE6(v21), (unsigned int *)(v40 + 4));
              uint64_t __src = v16;
              __int16 v59 = v21;
              char v60 = BYTE2(v21);
              char v61 = BYTE3(v21);
              char v62 = BYTE4(v21);
              char v63 = BYTE5(v21);
              uint64_t v41 = v16;
              memcpy(v19, &__src, BYTE6(v21));
              goto LABEL_32;
          }
        }
        __break(1u);
LABEL_55:
        __break(1u);
        os_unfair_lock_unlock((os_unfair_lock_t)a1);
        __break(1u);
LABEL_56:
        swift_release();
LABEL_58:
        sub_24CA865F0();
        __break(1u);
        swift_release();
        sub_24CA4986C(v20, v21);
        swift_release();
        swift_release();
        __break(1u);
        swift_release();
        sub_24CA4986C(v20, v21);
        __break(1u);
        JUMPOUT(0x24CA6E860);
      case 2uLL:
        uint64_t v24 = *(void *)(a1 + 16);
        uint64_t v23 = *(void *)(a1 + 24);
        size_t v22 = v23 - v24;
        if (!__OFSUB__(v23, v24)) {
          goto LABEL_7;
        }
        goto LABEL_49;
      case 3uLL:
        goto LABEL_10;
      default:
        size_t v22 = BYTE6(a2);
        goto LABEL_8;
    }
  }
  return swift_release();
}

uint64_t sub_24CA6E8A0(uint64_t a1, unint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, unsigned char *a6, uint64_t (*a7)(uint64_t, unint64_t), uint64_t a8, uint64_t a9, unsigned int a10, uint64_t a11)
{
  uint64_t result = a3();
  if (!v11)
  {
    uint64_t v19 = result;
    uint64_t v56 = a6;
    uint64_t v20 = a9;
    uint64_t v49 = a5;
    unint64_t v21 = *(void **)(a5 + 24);
    unint64_t v22 = v18;
    switch(a2 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(a1), a1)) {
          goto LABEL_46;
        }
        size_t v23 = HIDWORD(a1) - (int)a1;
LABEL_7:
        if ((v23 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
        }
        else
        {
LABEL_8:
          if (v23)
          {
            uint64_t v26 = v21;
            bzero(v21, v23);
            unint64_t v21 = v26;
            uint64_t v20 = a9;
          }
LABEL_10:
          unint64_t v27 = v22 >> 62;
          uint64_t v28 = 0;
          switch(v22 >> 62)
          {
            case 1uLL:
              LODWORD(v28) = HIDWORD(v19) - v19;
              if (__OFSUB__(HIDWORD(v19), v19)) {
                goto LABEL_48;
              }
              uint64_t v28 = (int)v28;
              break;
            case 2uLL:
              uint64_t v30 = *(void *)(v19 + 16);
              uint64_t v29 = *(void *)(v19 + 24);
              BOOL v31 = __OFSUB__(v29, v30);
              uint64_t v28 = v29 - v30;
              if (!v31) {
                break;
              }
              goto LABEL_49;
            case 3uLL:
              break;
            default:
              uint64_t v28 = BYTE6(v22);
              break;
          }
          switch(a2 >> 62)
          {
            case 1uLL:
              if (__OFSUB__(HIDWORD(a1), a1)) {
                goto LABEL_51;
              }
              if (HIDWORD(a1) - (int)a1 < v28) {
                goto LABEL_23;
              }
              goto LABEL_20;
            case 2uLL:
              uint64_t v33 = *(void *)(a1 + 16);
              uint64_t v32 = *(void *)(a1 + 24);
              BOOL v31 = __OFSUB__(v32, v33);
              uint64_t v34 = v32 - v33;
              if (v31) {
                goto LABEL_50;
              }
              if (v34 < v28)
              {
LABEL_23:
                unint64_t v37 = a7(v19, v22);
                if (v38) {
                  return sub_24CA4986C(v19, v22);
                }
                uint64_t v39 = 8 * a10 + 8;
                uint64_t v40 = *(void *)(*(void *)(v20 + 32) + 16);
                uint64_t v41 = *(void *)(v40 + 32);
                BOOL v31 = __OFSUB__(v41, v39);
                uint64_t v42 = v41 - v39;
                if (!v31)
                {
                  unint64_t v43 = v37;
                  atomic_exchange((atomic_uchar *volatile)(*(void *)(v40 + 16) + v42 + 4), 5u);
                  atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(v20 + 24) + 16) + 20), 1u);
                  atomic_store(v37, (unint64_t *)(*(void *)(*(void *)(v49 + 32) + 16) + 16));
                  uint64_t result = sub_24CA4986C(v19, v22);
                  unsigned char *v56 = 1;
                  *(void *)a11 = v43;
                  *(unsigned char *)(a11 + 8) = 0;
                  return result;
                }
LABEL_54:
                __break(1u);
LABEL_55:
                sub_24CA865F0();
                __break(1u);
                swift_release();
                sub_24CA4986C(v19, v22);
                swift_release();
                swift_release();
                __break(1u);
                swift_release();
                sub_24CA4986C(v19, v22);
                __break(1u);
                JUMPOUT(0x24CA6EE4CLL);
              }
LABEL_20:
              uint64_t v35 = *(void *)(*(void *)(v49 + 32) + 16);
              unint64_t v36 = v56;
              switch((int)v27)
              {
                case 1:
                  LODWORD(v46) = HIDWORD(v19) - v19;
                  if (__OFSUB__(HIDWORD(v19), v19)) {
                    goto LABEL_52;
                  }
                  unint64_t v46 = (int)v46;
LABEL_37:
                  if ((v46 & 0x8000000000000000) != 0 || HIDWORD(v46)) {
                    goto LABEL_55;
                  }
                  atomic_store(v46, (unsigned int *)(v35 + 4));
                  if (v27 == 2)
                  {
                    uint64_t v47 = *(void *)(v19 + 16);
                    uint64_t v48 = *(void *)(v19 + 24);
                    swift_retain();
                    sub_24CA497DC(v19, v22);
                    swift_retain();
                    sub_24CA497DC(v19, v22);
                    swift_retain();
                    swift_retain();
                    sub_24CA6F41C(v47, v48, v22 & 0x3FFFFFFFFFFFFFFFLL, v49, v19, v22);
                    swift_release();
                    swift_release();
LABEL_43:
                    sub_24CA4986C(v19, v22);
                    swift_release();
                    uint64_t result = sub_24CA4986C(v19, v22);
                    *unint64_t v36 = 1;
                    return result;
                  }
                  if (v19 >> 32 >= (int)v19)
                  {
                    swift_retain();
                    sub_24CA497DC(v19, v22);
                    swift_retain();
                    sub_24CA497DC(v19, v22);
                    sub_24CA6F41C((int)v19, v19 >> 32, v22 & 0x3FFFFFFFFFFFFFFFLL, v49, v19, v22);
                    goto LABEL_43;
                  }
                  break;
                case 2:
                  uint64_t v45 = *(void *)(v19 + 16);
                  uint64_t v44 = *(void *)(v19 + 24);
                  BOOL v31 = __OFSUB__(v44, v45);
                  unint64_t v46 = v44 - v45;
                  if (!v31) {
                    goto LABEL_37;
                  }
                  __break(1u);
LABEL_33:
                  atomic_store(0, (unsigned int *)(v35 + 4));
LABEL_34:
                  swift_retain();
                  sub_24CA4986C(v19, v22);
                  goto LABEL_43;
                case 3:
                  goto LABEL_33;
                default:
                  atomic_store(BYTE6(v22), (unsigned int *)(v35 + 4));
                  uint64_t __src = v19;
                  __int16 v51 = v22;
                  char v52 = BYTE2(v22);
                  char v53 = BYTE3(v22);
                  char v54 = BYTE4(v22);
                  char v55 = BYTE5(v22);
                  memcpy(v21, &__src, BYTE6(v22));
                  goto LABEL_34;
              }
              break;
            case 3uLL:
              if (v28 > 0) {
                goto LABEL_23;
              }
              goto LABEL_20;
            default:
              if (BYTE6(a2) < v28) {
                goto LABEL_23;
              }
              goto LABEL_20;
          }
        }
        __break(1u);
        goto LABEL_54;
      case 2uLL:
        uint64_t v25 = *(void *)(a1 + 16);
        uint64_t v24 = *(void *)(a1 + 24);
        size_t v23 = v24 - v25;
        if (!__OFSUB__(v24, v25)) {
          goto LABEL_7;
        }
        goto LABEL_47;
      case 3uLL:
        goto LABEL_10;
      default:
        size_t v23 = BYTE6(a2);
        goto LABEL_8;
    }
  }
  return result;
}

unint64_t sub_24CA6EE8C(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4, uint64_t (*a5)(void), uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9)
{
  char v15 = *(void **)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  int64_t v17 = atomic_load((unsigned int *)(*(void *)(v16 + 16) + 4));
  if (v17) {
    bzero(*(void **)(a1 + 24), v17);
  }
  unint64_t v18 = a3 >> 62;
  switch(a3 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a2), a2)) {
        goto LABEL_33;
      }
      if (HIDWORD(a2) - (int)a2 <= v17) {
        goto LABEL_5;
      }
      goto LABEL_11;
    case 2uLL:
      uint64_t v22 = *(void *)(a2 + 16);
      uint64_t v21 = *(void *)(a2 + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      int64_t v24 = v21 - v22;
      if (v23)
      {
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      if (v24 <= v17)
      {
LABEL_5:
        uint64_t v19 = *(void *)(v16 + 16);
        if (v18)
        {
          if (v18 == 1)
          {
            LODWORD(v20) = HIDWORD(a2) - a2;
            if (__OFSUB__(HIDWORD(a2), a2))
            {
LABEL_35:
              __break(1u);
              goto LABEL_36;
            }
            unint64_t v20 = (int)v20;
          }
          else
          {
            uint64_t v32 = *(void *)(a2 + 16);
            uint64_t v31 = *(void *)(a2 + 24);
            BOOL v23 = __OFSUB__(v31, v32);
            unint64_t v20 = v31 - v32;
            if (v23)
            {
LABEL_36:
              __break(1u);
              goto LABEL_37;
            }
          }
          if ((v20 & 0x8000000000000000) != 0 || HIDWORD(v20)) {
            goto LABEL_38;
          }
          atomic_store(v20, (unsigned int *)(v19 + 4));
          if (v18 == 2)
          {
            uint64_t v33 = *(void *)(a2 + 16);
            uint64_t v34 = *(void *)(a2 + 24);
            sub_24CA497DC(a2, a3);
            swift_retain();
            sub_24CA497DC(a2, a3);
            swift_retain();
            swift_retain();
            swift_retain();
            sub_24CA6F41C(v33, v34, a3 & 0x3FFFFFFFFFFFFFFFLL, a1, a2, a3);
            if (v43)
            {
LABEL_39:
              swift_release();
              sub_24CA4986C(a2, a3);
              swift_release();
              swift_release();
              __break(1u);
              goto LABEL_40;
            }
            swift_release();
            swift_release();
          }
          else
          {
            if (a2 >> 32 < (int)a2)
            {
LABEL_37:
              __break(1u);
LABEL_38:
              sub_24CA865F0();
              __break(1u);
              goto LABEL_39;
            }
            sub_24CA497DC(a2, a3);
            swift_retain();
            sub_24CA497DC(a2, a3);
            swift_retain();
            sub_24CA6F41C((int)a2, a2 >> 32, a3 & 0x3FFFFFFFFFFFFFFFLL, a1, a2, a3);
            if (v43)
            {
LABEL_40:
              swift_release();
              sub_24CA4986C(a2, a3);
              __break(1u);
              JUMPOUT(0x24CA6F2E4);
            }
          }
          swift_release();
        }
        else
        {
          atomic_store(BYTE6(a3), (unsigned int *)(v19 + 4));
          uint64_t __src = a2;
          __int16 v38 = a3;
          char v39 = BYTE2(a3);
          char v40 = BYTE3(a3);
          char v41 = BYTE4(a3);
          char v42 = BYTE5(a3);
          memcpy(v15, &__src, BYTE6(a3));
LABEL_20:
          swift_retain();
          sub_24CA4986C(a2, a3);
          swift_release();
        }
        unint64_t result = sub_24CA4986C(a2, a3);
        *a4 = 1;
      }
      else
      {
LABEL_11:
        a2 = a6;
        unint64_t result = a5();
        if (!v43 && (v26 & 1) == 0)
        {
          uint64_t v27 = 8 * a8 + 8;
          uint64_t v28 = *(void *)(*(void *)(a7 + 32) + 16);
          uint64_t v29 = *(void *)(v28 + 32);
          BOOL v23 = __OFSUB__(v29, v27);
          uint64_t v30 = v29 - v27;
          if (!v23)
          {
            atomic_exchange((atomic_uchar *volatile)(*(void *)(v28 + 16) + v30 + 4), 5u);
            atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a7 + 24) + 16) + 20), 1u);
            atomic_store(result, (unint64_t *)(*(void *)(v16 + 16) + 16));
            *a4 = 1;
            *(void *)a9 = result;
            *(unsigned char *)(a9 + 8) = 0;
            return result;
          }
          goto LABEL_34;
        }
      }
      return result;
    case 3uLL:
      atomic_store(0, (unsigned int *)(*(void *)(v16 + 16) + 4));
      goto LABEL_20;
    default:
      if (BYTE6(a3) <= v17) {
        goto LABEL_5;
      }
      goto LABEL_11;
  }
}

void *sub_24CA6F2F4(void *__src, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (!__src)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = *(void **)(a3 + 24);
  size_t v7 = 0;
  switch(a5 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a4), a4))
      {
        __break(1u);
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
      size_t v7 = HIDWORD(a4) - (int)a4;
LABEL_7:
      if ((v7 & 0x8000000000000000) != 0)
      {
LABEL_14:
        sub_24CA86630();
        __break(1u);
        JUMPOUT(0x24CA6F3D8);
      }
LABEL_8:
      return memmove(v6, __src, v7);
    case 2uLL:
      uint64_t v9 = *(void *)(a4 + 16);
      uint64_t v8 = *(void *)(a4 + 24);
      size_t v7 = v8 - v9;
      if (!__OFSUB__(v8, v9)) {
        goto LABEL_7;
      }
      goto LABEL_12;
    case 3uLL:
      goto LABEL_8;
    default:
      size_t v7 = BYTE6(a5);
      goto LABEL_8;
  }
}

Swift::Void __swiftcall DataFrameStreamSegment.sync()()
{
  Swift::Int v1 = atomic_load((unint64_t *)(*(void *)(*(void *)(v0 + 24) + 16) + 8));
  MemoryMappedRegion.sync(used:)(v1);
}

uint64_t sub_24CA6F41C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t result = sub_24CA85F00();
  BOOL v12 = (char *)result;
  if (result)
  {
    uint64_t result = sub_24CA85F30();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v12 += a1 - result;
  }
  BOOL v13 = __OFSUB__(a2, a1);
  uint64_t v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v15 = sub_24CA85F20();
  if (v15 >= v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v15;
  }
  int64_t v17 = &v12[v16];
  if (v12) {
    uint64_t v18 = (uint64_t)v17;
  }
  else {
    uint64_t v18 = 0;
  }
  sub_24CA6F2F4(v12, v18, a4, a5, a6);
  swift_release();
  return sub_24CA4986C(a5, a6);
}

uint64_t sub_24CA6F4F4(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_24CA7EB30(__src, &__src[a2]);
  }
  sub_24CA85F40();
  swift_allocObject();
  sub_24CA85EF0();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_24CA86070();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

void sub_24CA6F5A8(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6, unint64_t *a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  uint64_t v48 = a7;
  uint64_t v49 = a6;
  uint64_t v50 = a5;
  __int16 v51 = a4;
  uint64_t v15 = *(void **)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  int64_t v17 = atomic_load((unsigned int *)(*(void *)(v16 + 16) + 4));
  if (v17) {
    bzero(*(void **)(a1 + 24), v17);
  }
  uint64_t v19 = a9;
  unint64_t v18 = a10;
  unint64_t v20 = a3 >> 62;
  switch(a3 >> 62)
  {
    case 1uLL:
      LODWORD(v21) = HIDWORD(a2) - a2;
      if (__OFSUB__(HIDWORD(a2), a2))
      {
        __break(1u);
        goto LABEL_34;
      }
      int64_t v21 = (int)v21;
LABEL_11:
      if (v21 <= v17)
      {
        uint64_t v37 = *(void *)(v16 + 16);
        if (!v20)
        {
          atomic_store(BYTE6(a3), (unsigned int *)(v37 + 4));
          uint64_t __src = a2;
          __int16 v53 = a3;
          char v54 = BYTE2(a3);
          char v55 = BYTE3(a3);
          char v56 = BYTE4(a3);
          char v57 = BYTE5(a3);
          memcpy(v15, &__src, BYTE6(a3));
LABEL_22:
          sub_24CA4986C(a2, a3);
LABEL_31:
          sub_24CA4986C(a2, a3);
          unsigned char *v51 = 1;
          return;
        }
        if (v20 != 1)
        {
          uint64_t v40 = *(void *)(a2 + 16);
          uint64_t v39 = *(void *)(a2 + 24);
          BOOL v24 = __OFSUB__(v39, v40);
          unint64_t v38 = v39 - v40;
          if (!v24)
          {
LABEL_24:
            if ((v38 & 0x8000000000000000) != 0)
            {
LABEL_39:
              unint64_t v43 = v18;
              swift_release();
              sub_24CA4986C(v19, v43);
              LODWORD(v47) = 0;
              uint64_t v46 = 3451;
              LOBYTE(v45) = 2;
LABEL_41:
              sub_24CA865F0();
              __break(1u);
              goto LABEL_42;
            }
            if (HIDWORD(v38))
            {
              swift_release();
              sub_24CA4986C(a9, a10);
              LODWORD(v47) = 0;
              uint64_t v46 = 3455;
              LOBYTE(v45) = 2;
              goto LABEL_41;
            }
            atomic_store(v38, (unsigned int *)(v37 + 4));
            if (v20 == 2)
            {
              uint64_t v41 = *(void *)(a2 + 16);
              uint64_t v42 = *(void *)(a2 + 24);
              sub_24CA497DC(a2, a3);
              sub_24CA497DC(a2, a3);
              swift_retain();
              swift_retain();
              swift_retain();
              sub_24CA6F41C(v41, v42, a3 & 0x3FFFFFFFFFFFFFFFLL, a1, a2, a3);
              if (v10)
              {
LABEL_42:
                sub_24CA4986C(a2, a3);
                swift_release();
                swift_release();
                __break(1u);
                goto LABEL_43;
              }
              swift_release();
              swift_release();
              goto LABEL_31;
            }
            uint64_t v19 = (int)a2;
            if (a2 >> 32 >= (int)a2)
            {
              sub_24CA497DC(a2, a3);
              sub_24CA497DC(a2, a3);
              swift_retain();
              sub_24CA6F41C((int)a2, a2 >> 32, a3 & 0x3FFFFFFFFFFFFFFFLL, a1, a2, a3);
              if (v10)
              {
LABEL_43:
                sub_24CA4986C(a2, a3);
                __break(1u);
                JUMPOUT(0x24CA6FA7CLL);
              }
              goto LABEL_31;
            }
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
        LODWORD(v38) = HIDWORD(a2) - a2;
        if (!__OFSUB__(HIDWORD(a2), a2))
        {
          unint64_t v38 = (int)v38;
          goto LABEL_24;
        }
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      MEMORY[0x270FA5388](a1);
      a2 = (uint64_t)&v44;
      uint64_t v45 = a8;
      uint64_t v46 = a9;
      char v26 = (uint64_t *)&v25[4];
      a3 = (unint64_t)&v25[10];
      unint64_t v28 = v27;
      unint64_t v47 = v27;
      os_unfair_lock_lock(v25 + 10);
      sub_24CA66774(v26, &v58);
      if (v10)
      {
LABEL_38:
        os_unfair_lock_unlock((os_unfair_lock_t)a3);
        __break(1u);
        goto LABEL_39;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)a3);
      if (v58)
      {
        a2 = a8;
        unint64_t v29 = sub_24CA5FB94(a9, v28);
        if ((v30 & 1) == 0)
        {
          uint64_t v31 = v50;
          uint64_t v32 = 8 * v49 + 8;
          uint64_t v33 = *(void *)(*(void *)(v50 + 32) + 16);
          uint64_t v34 = *(void *)(v33 + 32);
          BOOL v24 = __OFSUB__(v34, v32);
          uint64_t v35 = v34 - v32;
          if (!v24)
          {
            atomic_exchange((atomic_uchar *volatile)(*(void *)(v33 + 16) + v35 + 4), 5u);
            atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(v31 + 24) + 16) + 20), 1u);
            atomic_store(v29, (unint64_t *)(*(void *)(v16 + 16) + 16));
            unsigned char *v51 = 1;
            unint64_t v36 = v48;
            *uint64_t v48 = v29;
            *((unsigned char *)v36 + 8) = 0;
            return;
          }
          goto LABEL_37;
        }
      }
      return;
    case 2uLL:
      uint64_t v23 = *(void *)(a2 + 16);
      uint64_t v22 = *(void *)(a2 + 24);
      BOOL v24 = __OFSUB__(v22, v23);
      int64_t v21 = v22 - v23;
      if (!v24) {
        goto LABEL_11;
      }
      __break(1u);
LABEL_8:
      atomic_store(0, (unsigned int *)(*(void *)(v16 + 16) + 4));
      goto LABEL_22;
    case 3uLL:
      goto LABEL_8;
    default:
      int64_t v21 = BYTE6(a3);
      goto LABEL_11;
  }
}

uint64_t sub_24CA6FA8C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*(void *)(*(void *)(result + 24) + 16) + 24);
  return result;
}

unint64_t *sub_24CA6FAA0(unint64_t *result, uint64_t a2)
{
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DataFrameMutationResult(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DataFrameMutationResult(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_24CA6FB1C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CA6FB38(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DataFrameMutationResult()
{
  return &type metadata for DataFrameMutationResult;
}

uint64_t destroy for DataFrameStreamSegment()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for DataFrameStreamSegment(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DataFrameStreamSegment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy44_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 28) = *(_OWORD *)(a2 + 28);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DataFrameStreamSegment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamSegment(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 44)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataFrameStreamSegment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 44) = 1;
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
    *(unsigned char *)(result + 44) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DataFrameStreamSegment()
{
  return &type metadata for DataFrameStreamSegment;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamSegmentError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DataFrameStreamSegmentError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA6FF38);
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

ValueMetadata *type metadata accessor for DataFrameStreamSegmentError()
{
  return &type metadata for DataFrameStreamSegmentError;
}

unint64_t sub_24CA6FF74()
{
  unint64_t result = qword_269807B88;
  if (!qword_269807B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807B88);
  }
  return result;
}

uint64_t StorageContainer.init(url:protection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for StorageContainer();
  *(void *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for StorageContainer()
{
  uint64_t result = qword_26B180C20;
  if (!qword_26B180C20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t StorageContainer.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24CA86020();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

id StorageContainer.protection.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StorageContainer() + 20));
  return v1;
}

uint64_t *initializeBufferWithCopyOfBuffer for StorageContainer(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24CA86020();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void destroy for StorageContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t initializeWithTake for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CA7048C);
}

uint64_t sub_24CA7048C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CA86020();
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

uint64_t storeEnumTagSinglePayload for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CA70560);
}

uint64_t sub_24CA70560(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24CA86020();
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

uint64_t sub_24CA7061C()
{
  uint64_t result = sub_24CA86020();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t MultiStreamContainer.init(storageContainer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CA706B8(a1, a2);
}

uint64_t sub_24CA706B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorageContainer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for MultiStreamContainer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for StorageContainer();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_24CA86020();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void destroy for MultiStreamContainer(uint64_t a1)
{
  uint64_t v2 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = *(void **)(a1 + *(int *)(type metadata accessor for StorageContainer() + 20));
}

uint64_t initializeWithCopy for MultiStreamContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for StorageContainer() + 20);
  uint64_t v6 = *(void **)(a2 + v5);
  *(void *)(a1 + v5) = v6;
  id v7 = v6;
  return a1;
}

uint64_t assignWithCopy for MultiStreamContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for StorageContainer() + 20);
  uint64_t v6 = *(void **)(a2 + v5);
  id v7 = *(void **)(a1 + v5);
  *(void *)(a1 + v5) = v6;
  id v8 = v6;

  return a1;
}

uint64_t initializeWithTake for MultiStreamContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = type metadata accessor for StorageContainer();
  *(void *)(a1 + *(int *)(v5 + 20)) = *(void *)(a2 + *(int *)(v5 + 20));
  return a1;
}

uint64_t assignWithTake for MultiStreamContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for StorageContainer() + 20);
  uint64_t v6 = *(void **)(a1 + v5);
  *(void *)(a1 + v5) = *(void *)(a2 + v5);

  return a1;
}

uint64_t getEnumTagSinglePayload for MultiStreamContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CA70A78);
}

uint64_t sub_24CA70A78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorageContainer();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MultiStreamContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CA70AF8);
}

uint64_t sub_24CA70AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorageContainer();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MultiStreamContainer()
{
  uint64_t result = qword_269807B90;
  if (!qword_269807B90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA70BB4()
{
  uint64_t result = type metadata accessor for StorageContainer();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CA70C40(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  id v24 = a3;
  uint64_t v11 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v11);
  BOOL v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_DWORD *)(v6 + 48) = -1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180BF8);
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 0;
  *(void *)(v6 + 56) = v14;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 40) = a5;
  uint64_t v15 = qword_2698075A8;
  swift_bridgeObjectRetain();
  uint64_t v25 = a5;
  swift_retain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v11, (uint64_t)qword_26980A148);
  sub_24CA4CFB0(v23, (uint64_t)v13);
  uint64_t aBlock = 0;
  unint64_t v27 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0xD000000000000013;
  unint64_t v27 = 0x800000024CA8ACA0;
  sub_24CA86320();
  uint64_t v22 = 0x800000024CA8ACC0;
  sub_24CA5A168(aBlock, v27, 0xD00000000000005FLL, 0x800000024CA8ACC0, 0xD00000000000001ALL, 0x800000024CA8AD20);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v13);
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_bridgeObjectRetain();
  swift_unownedRetain();
  uint64_t v16 = v24;
  swift_unownedRelease();
  swift_unownedRelease();
  swift_unownedRetain();
  swift_release();
  int64_t v17 = (void *)swift_allocObject();
  v17[2] = a1;
  v17[3] = a2;
  v17[4] = v6;
  char v30 = sub_24CA71670;
  uint64_t v31 = v17;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v27 = 1107296256;
  unint64_t v28 = sub_24CA715B8;
  unint64_t v29 = &block_descriptor_0;
  unint64_t v18 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v19 = (const char *)(sub_24CA862C0() + 32);
  swift_beginAccess();
  uint32_t v20 = notify_register_dispatch(v19, (int *)(v6 + 48), v16, v18);
  swift_endAccess();
  swift_release();
  _Block_release(v18);

  if (v20)
  {
    sub_24CA4CFB0(v23, (uint64_t)v13);
    uint64_t aBlock = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t aBlock = 0xD000000000000017;
    unint64_t v27 = 0x800000024CA8AD50;
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA5A180(aBlock, v27, 0xD00000000000005FLL, v22, 0xD00000000000001ALL, 0x800000024CA8AD20);

    swift_release();
    swift_bridgeObjectRelease();
    sub_24CA4D06C((uint64_t)v13);
    swift_release();
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();

    swift_release();
  }
  return v6;
}

uint64_t sub_24CA7100C()
{
  uint64_t v1 = v0;
  state64[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  state64[0] = 0;
  swift_beginAccess();
  if (!notify_get_state(*(_DWORD *)(v1 + 48), state64)) {
    return state64[0];
  }
  if (qword_2698075A8 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)qword_26980A148);
  sub_24CA4CFB0(v5, (uint64_t)v4);
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  uint64_t v8 = 0xD000000000000020;
  unint64_t v9 = 0x800000024CA8ADB0;
  swift_bridgeObjectRetain();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A180(v8, v9, 0xD00000000000005FLL, 0x800000024CA8ACC0, 0x53746E6572727563, 0xEC00000065746174);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v4);
  return 0;
}

uint64_t sub_24CA711EC()
{
  uint64_t v1 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + 56) + 136);
  uint64_t v5 = swift_retain();
  LOBYTE(v4) = atomic_load((unsigned __int8 *)v4(v5));
  uint64_t result = swift_release();
  if ((v4 & 1) == 0)
  {
    uint64_t v7 = sub_24CA7100C();
    uint64_t v9 = v8 & 1;
    if (qword_2698075A8 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v1, (uint64_t)qword_26980A148);
    sub_24CA4CFB0(v10, (uint64_t)v3);
    uint64_t v13 = 0;
    unint64_t v14 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v13 = 0x6E69796669746F4ELL;
    unint64_t v14 = 0xEF3A656D616E2067;
    swift_bridgeObjectRetain();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA86320();
    uint64_t v11 = v7;
    BOOL v12 = v9 != 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269807BA0);
    sub_24CA862B0();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA5A168(v13, v14, 0xD00000000000005FLL, 0x800000024CA8ACC0, 0xD000000000000014, 0x800000024CA8AD90);
    swift_bridgeObjectRelease();
    sub_24CA4D06C((uint64_t)v3);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32))(v7, v9);
  }
  return result;
}

uint64_t sub_24CA71438()
{
  uint64_t v0 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2698075A8 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_project_value_buffer(v0, (uint64_t)qword_26980A148);
  sub_24CA4CFB0(v3, (uint64_t)v2);
  uint64_t v5 = 0;
  unint64_t v6 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  uint64_t v5 = 0xD00000000000001ALL;
  unint64_t v6 = 0x800000024CA8AD70;
  sub_24CA86320();
  sub_24CA5A168(v5, v6, 0xD00000000000005FLL, 0x800000024CA8ACC0, 0xD00000000000001ALL, 0x800000024CA8AD20);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v2);
  swift_unownedRetainStrong();
  sub_24CA711EC();
  return swift_release();
}

uint64_t sub_24CA715B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t type metadata accessor for DarwinNotificationObserver()
{
  return self;
}

uint64_t sub_24CA71630()
{
  swift_bridgeObjectRelease();
  swift_unownedRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CA71670()
{
  return sub_24CA71438();
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

Dendrite::MemoryAlignment_optional __swiftcall MemoryAlignment.init(rawValue:)(Dendrite::MemoryAlignment_optional rawValue)
{
  Dendrite::MemoryAlignment value = rawValue.value;
  if (rawValue.value)
  {
    if (rawValue.value == 8) {
      char v3 = 2;
    }
    else {
      char v3 = 3;
    }
    if (rawValue.value == 4) {
      Dendrite::MemoryAlignment value = Dendrite_MemoryAlignment_fourByte;
    }
    else {
      Dendrite::MemoryAlignment value = v3;
    }
  }
  Dendrite::MemoryAlignment *v1 = value;
  return rawValue;
}

uint64_t MemoryAlignment.rawValue.getter()
{
  return 4 * *v0;
}

unint64_t sub_24CA716D0()
{
  unint64_t result = qword_269807BA8;
  if (!qword_269807BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807BA8);
  }
  return result;
}

uint64_t sub_24CA71724()
{
  return sub_24CA86760();
}

uint64_t sub_24CA7176C()
{
  return sub_24CA86740();
}

uint64_t sub_24CA7179C()
{
  return sub_24CA86760();
}

Dendrite::MemoryAlignment_optional sub_24CA717E0(Swift::UInt8 *a1)
{
  return MemoryAlignment.init(rawValue:)(*a1);
}

void sub_24CA717E8(unsigned char *a1@<X8>)
{
  *a1 = 4 * *v1;
}

unsigned char *storeEnumTagSinglePayload for MemoryAlignment(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA718C4);
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

ValueMetadata *type metadata accessor for MemoryAlignment()
{
  return &type metadata for MemoryAlignment;
}

uint64_t static DataRepresentableError.== infix(_:_:)()
{
  return 1;
}

uint64_t DataRepresentableError.hash(into:)()
{
  return sub_24CA86730();
}

uint64_t DataRepresentableError.hashValue.getter()
{
  return sub_24CA86760();
}

uint64_t UUID.serialize()()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t __src = sub_24CA86110();
  char v10 = v0;
  char v11 = v1;
  char v12 = v2;
  char v13 = v3;
  char v14 = v4;
  char v15 = v5;
  char v16 = v6;
  char v17 = v7;
  return sub_24CA6F4F4(&__src, 16);
}

uint64_t static UUID.deserialize(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180838);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
      uint64_t v10 = (int)v10;
LABEL_6:
      if (v10 == 16)
      {
        if (!v9)
        {
          sub_24CA86100();
          goto LABEL_20;
        }
        if (v9 != 1)
        {
          uint64_t v17 = *(void *)(a1 + 16);
          swift_retain();
          swift_retain();
          if (!sub_24CA85F00())
          {
LABEL_27:
            sub_24CA85F20();
            __break(1u);
            JUMPOUT(0x24CA71D60);
          }
          if (!__OFSUB__(v17, sub_24CA85F30()))
          {
            sub_24CA85F20();
            sub_24CA86100();
            swift_release();
            swift_release();
            goto LABEL_20;
          }
          goto LABEL_24;
        }
        if ((int)a1 <= a1 >> 32)
        {
          sub_24CA497DC(a1, a2);
          if (!sub_24CA85F00())
          {
LABEL_26:
            sub_24CA85F20();
            __break(1u);
            goto LABEL_27;
          }
          if (!__OFSUB__((int)a1, sub_24CA85F30()))
          {
            sub_24CA85F20();
            sub_24CA86100();
            sub_24CA4986C(a1, a2);
LABEL_20:
            uint64_t v18 = sub_24CA86130();
            (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 0, 1, v18);
            return sub_24CA72264((uint64_t)v8, a3);
          }
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
LABEL_13:
      uint64_t v14 = sub_24CA86130();
      char v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
      return v15(a3, 1, 1, v14);
    case 2uLL:
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v11 = *(void *)(a1 + 24);
      BOOL v13 = __OFSUB__(v11, v12);
      uint64_t v10 = v11 - v12;
      if (!v13) {
        goto LABEL_6;
      }
      goto LABEL_22;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v10 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24CA71D70()
{
  return UUID.serialize()();
}

uint64_t sub_24CA71D98@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static UUID.deserialize(data:)(a1, a2, a3);
}

uint64_t String.serialize()()
{
  uint64_t v0 = sub_24CA862A0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA86290();
  uint64_t v4 = sub_24CA86270();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
  {
    sub_24CA722CC();
    swift_allocError();
    swift_willThrow();
  }
  return v4;
}

uint64_t static String.deserialize(data:)()
{
  uint64_t v0 = sub_24CA862A0();
  MEMORY[0x270FA5388](v0 - 8);
  sub_24CA86290();
  sub_24CA72320();
  return sub_24CA86280();
}

uint64_t sub_24CA71F90()
{
  uint64_t v0 = sub_24CA862A0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA86290();
  uint64_t v4 = sub_24CA86270();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
  {
    sub_24CA722CC();
    swift_allocError();
    swift_willThrow();
  }
  return v4;
}

uint64_t sub_24CA720BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24CA862A0();
  MEMORY[0x270FA5388](v2 - 8);
  sub_24CA86290();
  sub_24CA72320();
  uint64_t result = sub_24CA86280();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t Data.serialize()(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t static Data.deserialize(data:)(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_24CA721F4()
{
  uint64_t v1 = *(void *)v0;
  sub_24CA497DC(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t sub_24CA72238@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return sub_24CA497DC(a1, a2);
}

uint64_t sub_24CA72264(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CA722CC()
{
  unint64_t result = qword_269807BB0;
  if (!qword_269807BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807BB0);
  }
  return result;
}

unint64_t sub_24CA72320()
{
  unint64_t result = qword_269807BB8;
  if (!qword_269807BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807BB8);
  }
  return result;
}

unint64_t sub_24CA72378()
{
  unint64_t result = qword_269807BC0;
  if (!qword_269807BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807BC0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DataRepresentableError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CA72468);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DataRepresentableError()
{
  return &type metadata for DataRepresentableError;
}

uint64_t dispatch thunk of DataRepresentable.serialize()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static DataRepresentable.deserialize(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_24CA724F0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

BOOL sub_24CA72504()
{
  return *v0 == 0;
}

ValueMetadata *type metadata accessor for EmbeddedDeviceLockState()
{
  return &type metadata for EmbeddedDeviceLockState;
}

uint64_t SegmentedDataRegion.init(representables:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint32_t v20 = a2;
    uint64_t v5 = a1 + 32;
    unint64_t v6 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      sub_24CA59348(v5, (uint64_t)v17);
      uint64_t v7 = v18;
      uint64_t v8 = v19;
      __swift_project_boxed_opaque_existential_1(v17, v18);
      uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
      if (v2) {
        break;
      }
      uint64_t v11 = v9;
      uint64_t v12 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v6 = sub_24CA82AA0(0, v6[2] + 1, 1, v6);
      }
      unint64_t v14 = v6[2];
      unint64_t v13 = v6[3];
      if (v14 >= v13 >> 1) {
        unint64_t v6 = sub_24CA82AA0((void *)(v13 > 1), v14 + 1, 1, v6);
      }
      uint64_t v6[2] = v14 + 1;
      char v15 = &v6[2 * v14];
      _DWORD v15[4] = v11;
      v15[5] = v12;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
      v5 += 40;
      if (!--v4)
      {
        uint64_t result = swift_bridgeObjectRelease();
        *uint32_t v20 = v6;
        return result;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t SegmentedDataRegion.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 < 0 || *(void *)(*(void *)v4 + 16) <= a1)
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v9, (uint64_t)qword_26B181220);
    sub_24CA4CFB0(v16, (uint64_t)v11);
    uint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    uint64_t v19 = 0xD000000000000014;
    unint64_t v20 = 0x800000024CA8ADE0;
    v18[1] = a1;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA5A180(v19, v20, 0xD000000000000066, 0x800000024CA8AE00, 0x7069726373627573, 0xED0000293A5F2874);
    swift_bridgeObjectRelease();
    sub_24CA4D06C((uint64_t)v11);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a4, 1, 1, a2);
  }
  else
  {
    uint64_t v12 = *(void *)v4 + 16 * a1;
    uint64_t v13 = *(void *)(v12 + 32);
    unint64_t v14 = *(void *)(v12 + 40);
    char v15 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a3 + 16);
    sub_24CA497DC(v13, v14);
    v15(v13, v14, a2, a3);
    return sub_24CA4986C(v13, v14);
  }
}

uint64_t SegmentedDataRegion.serialize()()
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v1 = *v0;
  long long v59 = xmmword_24CA88A50;
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
  while (2)
  {
    uint64_t v7 = *(v3 - 1);
    unint64_t v6 = *v3;
    unint64_t v8 = *v3 >> 62;
    v3 += 2;
    switch(v8)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v7), v7)) {
          goto LABEL_63;
        }
        unint64_t v9 = HIDWORD(v7) - (int)v7;
LABEL_9:
        sub_24CA497DC(v7, v6);
        if ((v9 & 0x8000000000000000) != 0 || HIDWORD(v9))
        {
          sub_24CA865F0();
          __break(1u);
          JUMPOUT(0x24CA72FD4);
        }
        return result;
      case 2uLL:
        uint64_t v11 = *(void *)(v7 + 16);
        uint64_t v10 = *(void *)(v7 + 24);
        unint64_t v9 = v10 - v11;
        if (!__OFSUB__(v10, v11)) {
          goto LABEL_9;
        }
        goto LABEL_64;
      default:
        break;
    }
    sub_24CA860B0();
    sub_24CA860B0();
    unsigned __int8 v13 = BYTE14(v59);
    uint64_t v12 = v59;
    uint64_t v14 = *((void *)&v59 + 1) >> 62;
    switch(*((void *)&v59 + 1) >> 62)
    {
      case 1:
        if (__OFSUB__(DWORD1(v59), v59)) {
          goto LABEL_66;
        }
        int64_t v15 = DWORD1(v59) - (int)v59;
LABEL_21:
        int64_t v18 = NSRoundUpToMultipleOfPageSize(v15);
        if (v15 < v18) {
          goto LABEL_22;
        }
        goto LABEL_3;
      case 2:
        uint64_t v17 = *(void *)(v59 + 16);
        uint64_t v16 = *(void *)(v59 + 24);
        if (__OFSUB__(v16, v17)) {
          goto LABEL_65;
        }
        int64_t v18 = NSRoundUpToMultipleOfPageSize(v16 - v17);
        uint64_t v20 = *(void *)(v12 + 16);
        uint64_t v19 = *(void *)(v12 + 24);
        if (__OFSUB__(v19, v20)) {
          goto LABEL_67;
        }
        if (v19 - v20 >= v18)
        {
LABEL_3:
          uint64_t v4 = v7;
          unint64_t v5 = v6;
        }
        else
        {
LABEL_22:
          if (v14)
          {
            if (v14 == 1)
            {
              LODWORD(v21) = HIDWORD(v12) - v12;
              if (__OFSUB__(HIDWORD(v12), v12)) {
                goto LABEL_69;
              }
              uint64_t v21 = (int)v21;
            }
            else
            {
              uint64_t v23 = *(void *)(v12 + 16);
              uint64_t v22 = *(void *)(v12 + 24);
              BOOL v24 = __OFSUB__(v22, v23);
              uint64_t v21 = v22 - v23;
              if (v24) {
                goto LABEL_70;
              }
            }
          }
          else
          {
            uint64_t v21 = v13;
          }
LABEL_28:
          int64_t v25 = v18 - v21;
          if (__OFSUB__(v18, v21))
          {
            __break(1u);
LABEL_63:
            __break(1u);
LABEL_64:
            __break(1u);
LABEL_65:
            __break(1u);
LABEL_66:
            __break(1u);
LABEL_67:
            __break(1u);
LABEL_68:
            __break(1u);
LABEL_69:
            __break(1u);
LABEL_70:
            __break(1u);
LABEL_71:
            __break(1u);
LABEL_72:
            __break(1u);
LABEL_73:
            __break(1u);
LABEL_74:
            __break(1u);
LABEL_75:
            __break(1u);
LABEL_76:
            __break(1u);
LABEL_77:
            __break(1u);
LABEL_78:
            __break(1u);
          }
          if (v25)
          {
            if (v25 < 15)
            {
              if (v25 < 0) {
                goto LABEL_68;
              }
              memset(v57, 0, sizeof(v57));
              unsigned __int8 v58 = v18 - v21;
              bzero(v57, v25);
              uint64_t v36 = *(void *)v57;
              unint64_t v37 = *(unsigned int *)&v57[8] | ((unint64_t)v57[12] << 32) | ((unint64_t)v57[13] << 40) | ((unint64_t)v58 << 48);
            }
            else
            {
              sub_24CA85F40();
              swift_allocObject();
              uint64_t v26 = sub_24CA85F10();
              if ((unint64_t)v25 > 0x7FFFFFFE)
              {
                sub_24CA86070();
                uint64_t v38 = v26;
                uint64_t v36 = swift_allocObject();
                *(void *)(v36 + 16) = 0;
                *(void *)(v36 + 24) = v25;
                uint64_t v56 = v38;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  uint64_t v39 = *(void *)(v36 + 16);
                  uint64_t v54 = *(void *)(v36 + 24);
                  if (sub_24CA85F00() && __OFSUB__(v39, sub_24CA85F30())) {
                    goto LABEL_76;
                  }
                  if (__OFSUB__(v54, v39)) {
                    goto LABEL_74;
                  }
                  swift_allocObject();
                  uint64_t v40 = sub_24CA85EE0();
                  swift_release();
                  uint64_t v56 = v40;
                }
                char v55 = v3;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  uint64_t v41 = *(void *)(v36 + 16);
                  uint64_t v42 = *(void *)(v36 + 24);
                  uint64_t v43 = swift_allocObject();
                  *(void *)(v43 + 16) = v41;
                  *(void *)(v43 + 24) = v42;
                  swift_release();
                  uint64_t v36 = v43;
                }
                uint64_t v44 = *(void *)(v36 + 16);
                uint64_t v45 = *(void *)(v36 + 24);
                uint64_t v46 = sub_24CA85F00();
                if (!v46) {
                  goto LABEL_78;
                }
                uint64_t v47 = v46;
                uint64_t v48 = sub_24CA85F30();
                uint64_t v49 = v44 - v48;
                if (__OFSUB__(v44, v48)) {
                  goto LABEL_72;
                }
                BOOL v24 = __OFSUB__(v45, v44);
                int64_t v50 = v45 - v44;
                if (v24) {
                  goto LABEL_73;
                }
                uint64_t v51 = sub_24CA85F20();
                if (v51 >= v50) {
                  size_t v52 = v50;
                }
                else {
                  size_t v52 = v51;
                }
                bzero((void *)(v47 + v49), v52);
                unint64_t v37 = v56 | 0x8000000000000000;
                int v3 = v55;
              }
              else
              {
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  if (sub_24CA85F00() && __OFSUB__(0, sub_24CA85F30())) {
                    goto LABEL_75;
                  }
                  swift_allocObject();
                  uint64_t v27 = sub_24CA85EE0();
                  swift_release();
                  uint64_t v26 = v27;
                }
                unint64_t v28 = v3;
                uint64_t v29 = sub_24CA85F00();
                if (!v29) {
                  goto LABEL_77;
                }
                uint64_t v30 = v29;
                uint64_t v31 = sub_24CA85F30();
                uint64_t v32 = -v31;
                if (__OFSUB__(0, v31)) {
                  goto LABEL_71;
                }
                uint64_t v33 = sub_24CA85F20();
                if (v33 >= v25) {
                  size_t v34 = v25;
                }
                else {
                  size_t v34 = v33;
                }
                bzero((void *)(v30 + v32), v34);
                uint64_t v35 = v26;
                uint64_t v36 = v25 << 32;
                unint64_t v37 = v35 | 0x4000000000000000;
                int v3 = v28;
              }
            }
          }
          else
          {
            uint64_t v36 = 0;
            unint64_t v37 = 0xC000000000000000;
          }
          sub_24CA860B0();
          sub_24CA4986C(v7, v6);
          uint64_t v4 = v36;
          unint64_t v5 = v37;
        }
        sub_24CA4986C(v4, v5);
        if (--v2) {
          continue;
        }
        swift_bridgeObjectRelease();
        uint64_t result = v59;
        break;
      case 3:
        int64_t v18 = NSRoundUpToMultipleOfPageSize(0);
        if (v18 <= 0) {
          goto LABEL_3;
        }
        uint64_t v21 = 0;
        goto LABEL_28;
      default:
        int64_t v15 = BYTE14(v59);
        goto LABEL_21;
    }
    return result;
  }
}

uint64_t static SegmentedDataRegion.deserialize(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  v12[1] = *MEMORY[0x263EF8340];
  v12[0] = 0;
  uint64_t v11 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_24CA497DC(a1, a2);
      sub_24CA73684((int)a1, a1 >> 32, v12, a1, a2, &v11, a3);
      return swift_bridgeObjectRelease();
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      sub_24CA497DC(a1, a2);
      swift_retain();
      swift_retain();
      sub_24CA73684(v7, v8, v12, a1, a2, &v11, a3);
      if (v3) {
        goto LABEL_13;
      }
      swift_release();
      swift_release();
      break;
    case 3uLL:
      memset(v10, 0, 14);
      goto LABEL_6;
    default:
      v10[0] = a1;
      LOWORD(v10[1]) = a2;
      BYTE2(v10[1]) = BYTE2(a2);
      BYTE3(v10[1]) = BYTE3(a2);
      BYTE4(v10[1]) = BYTE4(a2);
      BYTE5(v10[1]) = BYTE5(a2);
LABEL_6:
      sub_24CA73270((uint64_t)v10, v12, a1, a2, &v11, a3);
      if (v3)
      {
        sub_24CA4986C(a1, a2);
        sub_24CA4986C(a1, a2);
        __break(1u);
LABEL_13:
        swift_release();
        swift_release();
        __break(1u);
        JUMPOUT(0x24CA73260);
      }
      sub_24CA4986C(a1, a2);
      sub_24CA4986C(a1, a2);
      break;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA73270@<X0>(uint64_t result@<X0>, int64_t *a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X4>, void **a5@<X5>, void *a6@<X8>)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (!result)
  {
    *a6 = 0;
    return result;
  }
  uint64_t v8 = result;
  BOOL v9 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v35 = v9;
  int64_t v34 = HIDWORD(a3) - (int)a3;
  int64_t v37 = BYTE6(a4);
  unint64_t v10 = a4 >> 62;
  while (2)
  {
    int64_t v11 = *a2;
    int64_t v12 = v37;
    switch(v10)
    {
      case 1uLL:
        int64_t v12 = v34;
        if (!v35) {
          goto LABEL_10;
        }
        goto LABEL_43;
      case 2uLL:
        uint64_t v14 = *(void *)(a3 + 16);
        uint64_t v13 = *(void *)(a3 + 24);
        BOOL v15 = __OFSUB__(v13, v14);
        int64_t v12 = v13 - v14;
        if (!v15) {
          goto LABEL_10;
        }
        goto LABEL_44;
      case 3uLL:
        if (v11 < 0) {
          goto LABEL_13;
        }
        goto LABEL_39;
      default:
LABEL_10:
        if (v11 >= v12) {
          goto LABEL_39;
        }
LABEL_13:
        int64_t v16 = v11 + 4;
        if (__OFADD__(v11, 4))
        {
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
          goto LABEL_47;
        }
        size_t v17 = *(unsigned int *)(v8 + v11);
        *a2 = v16;
        int64_t v18 = 0;
        switch(v10)
        {
          case 1uLL:
            int64_t v18 = v34;
            if (v35) {
              goto LABEL_45;
            }
            break;
          case 2uLL:
            uint64_t v20 = *(void *)(a3 + 16);
            uint64_t v19 = *(void *)(a3 + 24);
            BOOL v15 = __OFSUB__(v19, v20);
            int64_t v18 = v19 - v20;
            if (v15) {
              goto LABEL_46;
            }
            break;
          case 3uLL:
            break;
          default:
            int64_t v18 = v37;
            break;
        }
        if (__OFADD__(v16, v17)) {
          goto LABEL_41;
        }
        if (v18 >= (uint64_t)(v16 + v17))
        {
          if (v17)
          {
            if (v17 <= 0xE)
            {
              memset(__dst, 0, sizeof(__dst));
              unsigned __int8 v39 = v17;
              memcpy(__dst, (const void *)(v8 + v16), v17);
              uint64_t v23 = *(void *)__dst;
              unint64_t v24 = *(unsigned int *)&__dst[8] | ((unint64_t)__dst[12] << 32) | ((unint64_t)__dst[13] << 40) | ((unint64_t)v39 << 48);
            }
            else
            {
              sub_24CA85F40();
              swift_allocObject();
              uint64_t v21 = sub_24CA85EF0();
              uint64_t v22 = v21;
              if (v17 >= 0x7FFFFFFF)
              {
                sub_24CA86070();
                uint64_t v23 = swift_allocObject();
                *(void *)(v23 + 16) = 0;
                *(void *)(v23 + 24) = v17;
                unint64_t v24 = v22 | 0x8000000000000000;
              }
              else
              {
                uint64_t v23 = v17 << 32;
                unint64_t v24 = v21 | 0x4000000000000000;
              }
            }
          }
          else
          {
            uint64_t v23 = 0;
            unint64_t v24 = 0xC000000000000000;
          }
          NSUInteger v25 = *a2 + v17;
          if (__OFADD__(*a2, v17)) {
            goto LABEL_42;
          }
          *a2 = v25;
          int64_t v26 = NSRoundUpToMultipleOfPageSize(v25);
          if (*a2 < v26) {
            *a2 = v26;
          }
          uint64_t v27 = *a5;
          sub_24CA497DC(v23, v24);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *a5 = v27;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            uint64_t v27 = sub_24CA82AA0(0, v27[2] + 1, 1, v27);
            *a5 = v27;
          }
          unint64_t v30 = v27[2];
          unint64_t v29 = v27[3];
          if (v30 >= v29 >> 1) {
            uint64_t v27 = sub_24CA82AA0((void *)(v29 > 1), v30 + 1, 1, v27);
          }
          void v27[2] = v30 + 1;
          uint64_t v31 = &v27[2 * v30];
          v31[4] = v23;
          v31[5] = v24;
          *a5 = v27;
          sub_24CA4986C(v23, v24);
          continue;
        }
        if (qword_26B180878 != -1) {
LABEL_47:
        }
          swift_once();
        uint64_t v32 = type metadata accessor for InternalLogger();
        __swift_project_value_buffer(v32, (uint64_t)qword_26B181220);
        sub_24CA5A180(0xD00000000000003ELL, 0x800000024CA8AE90, 0xD000000000000066, 0x800000024CA8AE00, 0xD000000000000012, 0x800000024CA8AED0);
LABEL_39:
        *a6 = *a5;
        return swift_bridgeObjectRetain();
    }
  }
}

uint64_t sub_24CA73654()
{
  return SegmentedDataRegion.serialize()();
}

uint64_t sub_24CA7366C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  return static SegmentedDataRegion.deserialize(data:)(a1, a2, a3);
}

uint64_t sub_24CA73684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X3>, uint64_t a4@<X4>, unint64_t a5@<X5>, void **a6@<X6>, void *a7@<X8>)
{
  uint64_t result = sub_24CA85F00();
  uint64_t v15 = result;
  if (result)
  {
    uint64_t result = sub_24CA85F30();
    if (__OFSUB__(a1, result)) {
      goto LABEL_7;
    }
    v15 += a1 - result;
  }
  if (!__OFSUB__(a2, a1))
  {
    sub_24CA85F20();
    sub_24CA73270(v15, a3, a4, a5, a6, a7);
    return sub_24CA4986C(a4, a5);
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SegmentedDataRegion()
{
  return &type metadata for SegmentedDataRegion;
}

void static Storage.ensureFileExists(fileURL:)(unsigned __int8 *a1@<X8>)
{
  v18[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_24CA86020();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_defaultManager);
  sub_24CA86000();
  uint64_t v7 = (void *)sub_24CA86230();
  swift_bridgeObjectRelease();
  unsigned int v8 = objc_msgSend(v6, sel_fileExistsAtPath_, v7);

  if (v8)
  {

    *a1 = 2;
    return;
  }
  sub_24CA85FF0();
  sub_24CA86000();
  BOOL v9 = (void *)sub_24CA86230();
  swift_bridgeObjectRelease();
  int v10 = objc_msgSend(v6, sel_fileExistsAtPath_, v9);

  if (v10) {
    goto LABEL_6;
  }
  int64_t v11 = (void *)sub_24CA85FD0();
  v18[0] = 0;
  unsigned int v12 = objc_msgSend(v6, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v11, 1, 0, v18);

  if (v12)
  {
    id v13 = v18[0];
LABEL_6:
    sub_24CA86000();
    uint64_t v14 = (void *)sub_24CA86230();
    swift_bridgeObjectRelease();
    unsigned __int8 v15 = objc_msgSend(v6, sel_createFileAtPath_contents_attributes_, v14, 0, 0);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *a1 = v15;
    return;
  }
  id v16 = v18[0];
  sub_24CA85F70();

  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void static Storage.listFiles(directoryURL:)()
{
}

void static Storage.delete(url:)()
{
}

uint64_t static Storage.available(for:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24CA73A64, 0, 0);
}

uint64_t sub_24CA73A64()
{
  uint64_t v1 = sub_24CA86260();
  uint64_t v3 = v2;
  if (v1 == sub_24CA86260() && v3 == v4)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v6 = sub_24CA866A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
      return v7();
    }
  }
  int v10 = (uint64_t (__cdecl *)())((char *)&dword_269807CA0 + dword_269807CA0);
  BOOL v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v9;
  *BOOL v9 = v0;
  v9[1] = sub_24CA73BB0;
  return v10();
}

uint64_t sub_24CA73BB0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void static Storage.listDirectories(directoryURL:)()
{
  v60[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v50 = sub_24CA85F60();
  uint64_t v0 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  char v55 = (char *)v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180870);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v56 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CA86020();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v49 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unsigned __int8 v58 = (char *)v38 - v8;
  id v9 = objc_msgSend(self, sel_defaultManager);
  int v10 = (void *)sub_24CA85FD0();
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B180888);
  uint64_t v11 = swift_allocObject();
  long long v53 = xmmword_24CA877D0;
  *(_OWORD *)(v11 + 16) = xmmword_24CA877D0;
  unsigned int v12 = (void *)*MEMORY[0x263EFF6A8];
  *(void *)(v11 + 32) = *MEMORY[0x263EFF6A8];
  type metadata accessor for URLResourceKey(0);
  uint64_t v14 = v13;
  id v51 = v12;
  uint64_t v52 = v14;
  unsigned __int8 v15 = (void *)sub_24CA86400();
  id v16 = v9;
  swift_bridgeObjectRelease();
  v60[0] = 0;
  id v17 = objc_msgSend(v9, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v10, v15, 0, v60);

  id v18 = v60[0];
  if (v17)
  {
    uint64_t v19 = sub_24CA86410();
    id v20 = v18;

    v60[0] = (id)MEMORY[0x263F8EE78];
    uint64_t v21 = v4;
    uint64_t v45 = *(void *)(v19 + 16);
    if (v45)
    {
      id v39 = v9;
      unint64_t v22 = 0;
      uint64_t v48 = v5 + 16;
      uint64_t v46 = v5 + 48;
      char v57 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
      uint64_t v42 = (void (**)(char *, uint64_t))(v0 + 8);
      uint64_t v40 = (void (**)(char *, uint64_t))(v5 + 8);
      uint64_t v47 = v5 + 56;
      v38[1] = (v5 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v23 = (uint64_t)v56;
      uint64_t v43 = v5;
      uint64_t v44 = v19;
      do
      {
        if (v22 >= *(void *)(v19 + 16))
        {
          __break(1u);
LABEL_23:
          __break(1u);
        }
        unint64_t v24 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
        uint64_t v25 = *(void *)(v5 + 72);
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(v23, v19 + v24 + v25 * v22, v21);
        uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
        v41(v23, 0, 1, v21);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v23, 1, v21) == 1)
        {
          id v16 = v39;
          goto LABEL_21;
        }
        int64_t v26 = *v57;
        (*v57)(v58, v23, v21);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v53;
        unint64_t v28 = v51;
        *(void *)(inited + 32) = v51;
        id v29 = v28;
        sub_24CA75918(inited);
        swift_setDeallocating();
        unint64_t v30 = v55;
        swift_arrayDestroy();
        uint64_t v31 = v59;
        sub_24CA85FA0();
        uint64_t v59 = v31;
        if (v31)
        {
          swift_bridgeObjectRelease();
          (*v40)(v58, v21);
          swift_bridgeObjectRelease();

          swift_release();
          return;
        }
        swift_bridgeObjectRelease();
        char v32 = sub_24CA85F50();
        if (v32 == 2) {
          goto LABEL_23;
        }
        char v33 = v32;
        (*v42)(v30, v50);
        if (v33)
        {
          v26(v49, (uint64_t)v58, v21);
          int64_t v34 = (char *)v60[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_24CA74788(0, *((void *)v34 + 2) + 1, 1);
            int64_t v34 = (char *)v60[0];
          }
          unint64_t v36 = *((void *)v34 + 2);
          unint64_t v35 = *((void *)v34 + 3);
          if (v36 >= v35 >> 1)
          {
            sub_24CA74788(v35 > 1, v36 + 1, 1);
            int64_t v34 = (char *)v60[0];
          }
          *((void *)v34 + 2) = v36 + 1;
          v26(&v34[v24 + v36 * v25], (uint64_t)v49, v21);
          v60[0] = v34;
        }
        else
        {
          (*v40)(v58, v21);
        }
        uint64_t v19 = v44;
        ++v22;
        uint64_t v23 = (uint64_t)v56;
        uint64_t v5 = v43;
      }
      while (v45 != v22);
      id v16 = v39;
      v41((uint64_t)v56, 1, 1, v21);
    }
    else
    {
      uint64_t v23 = (uint64_t)v56;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v56, 1, 1, v4);
    }
LABEL_21:
    swift_bridgeObjectRelease();
    sub_24CA66680(v23, &qword_26B180870);
  }
  else
  {
    id v37 = v60[0];
    sub_24CA85F70();

    swift_willThrow();
  }
}

uint64_t static Storage.pathURLExists(pathURL:andIsDirectory:)(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(self, sel_defaultManager);
  unsigned __int8 v7 = 0;
  sub_24CA86000();
  uint64_t v4 = (void *)sub_24CA86230();
  swift_bridgeObjectRelease();
  unsigned int v5 = objc_msgSend(v3, sel_fileExistsAtPath_isDirectory_, v4, &v7);

  return v5 & (v7 ^ a2 ^ 1);
}

BOOL static MemoryAccess.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MemoryAccess.hash(into:)()
{
  return sub_24CA86730();
}

uint64_t MemoryAccess.hashValue.getter()
{
  return sub_24CA86760();
}

void static Storage.truncate(_:size:)(uint64_t a1, unsigned int a2)
{
  sub_24CA86000();
  id v3 = (void *)sub_24CA86230();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(self, sel_fileHandleForUpdatingAtPath_, v3);

  if (v4)
  {
    sub_24CA76608(v4, a2);
  }
  else
  {
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for InternalLogger();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B181220);
    sub_24CA5A180(0xD000000000000019, 0x800000024CA8AEF0, 0xD000000000000062, 0x800000024CA8AF10, 0xD000000000000011, 0x800000024CA8AF80);
    sub_24CA56E20();
    swift_allocError();
    *(void *)uint64_t v6 = 0;
    *(void *)(v6 + 8) = 0;
    *(unsigned char *)(v6 + 16) = 2;
    swift_willThrow();
  }
}

uint64_t static Storage.truncate(_:size:)(void *a1, unsigned int a2)
{
  return sub_24CA76608(a1, a2);
}

void static Storage.fileSize(pathURL:)()
{
}

id static Storage.fileHandle(url:forAccess:)(uint64_t a1, unsigned char *a2)
{
  return sub_24CA762D8(a1, a2);
}

void *static Storage.sharedResourcesDirectory.getter()
{
  uint64_t result = (void *)CPSharedResourcesDirectory();
  if (result)
  {
    id v1 = result;
    sub_24CA86260();

    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA86320();
    sub_24CA85FB0();
    return (void *)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24CA74728(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CA747E8(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_24CA74748(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CA74954(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_24CA74768(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CA74AFC(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_24CA74788(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CA74DF0(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_24CA747A8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CA75030(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_24CA747C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CA74C84(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_24CA747E8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D8);
    int v10 = (char *)swift_allocObject();
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
    int v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA74954(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269807BD8);
    int v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269807BE0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA74AFC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269807BF0);
    int v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA74C84(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F620);
    int v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA74DF0(char a1, int64_t a2, char a3, void *a4)
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A10);
  uint64_t v10 = *(void *)(sub_24CA86020() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(sub_24CA86020() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  id v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
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
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA75030(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F630);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

unint64_t sub_24CA75190(uint64_t a1)
{
  sub_24CA86260();
  sub_24CA86720();
  sub_24CA862F0();
  uint64_t v2 = sub_24CA86760();
  swift_bridgeObjectRelease();
  return sub_24CA752BC(a1, v2);
}

unint64_t sub_24CA75224(uint64_t a1)
{
  sub_24CA86020();
  sub_24CA76D4C(&qword_26B180A18, MEMORY[0x263F06EA8]);
  uint64_t v2 = sub_24CA861F0();
  return sub_24CA75434(a1, v2);
}

unint64_t sub_24CA752BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24CA86260();
    uint64_t v8 = v7;
    if (v6 == sub_24CA86260() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24CA866A0();
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
          uint64_t v13 = sub_24CA86260();
          uint64_t v15 = v14;
          if (v13 == sub_24CA86260() && v15 == v16) {
            break;
          }
          char v18 = sub_24CA866A0();
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

unint64_t sub_24CA75434(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24CA86020();
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
    char v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24CA76D4C(&qword_26B180A20, MEMORY[0x263F06EA8]);
      char v15 = sub_24CA86210();
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

BOOL _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0()
{
  uint64_t v0 = sub_24CA86260();
  uint64_t v2 = v1;
  if (v0 == sub_24CA86260() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v5 = sub_24CA866A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
    {
      uint64_t v6 = sub_24CA86260();
      uint64_t v8 = v7;
      if (v6 == sub_24CA86260() && v8 == v9)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v11 = sub_24CA866A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v11 & 1) == 0) {
          return 1;
        }
      }
      return MKBGetDeviceLockState() == 0;
    }
  }
  if (qword_26B180C30 != -1) {
    swift_once();
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t))(*(void *)qword_26B181278 + 136);
  uint64_t v13 = swift_retain();
  LOBYTE(v12) = *(unsigned char *)v12(v13);
  swift_release();
  if (v12) {
    return 1;
  }
  if (MKBDeviceUnlockedSinceBoot() != 1) {
    return 0;
  }
  uint64_t v14 = *(uint64_t (**)(uint64_t))(*(void *)qword_26B181278 + 136);
  uint64_t v15 = swift_retain();
  uint64_t v16 = (unsigned char *)v14(v15);
  uint64_t v17 = 1;
  *uint64_t v16 = 1;
  swift_release();
  return v17;
}

uint64_t _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_defaultManager);
  sub_24CA86000();
  uint64_t v1 = (void *)sub_24CA86230();
  swift_bridgeObjectRelease();
  unsigned int v2 = objc_msgSend(v0, sel_fileExistsAtPath_, v1);

  if (v2) {
    goto LABEL_4;
  }
  uint64_t v3 = (void *)sub_24CA85FD0();
  v9[0] = 0;
  unsigned int v4 = objc_msgSend(v0, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v3, 1, 0, v9);

  if (v4)
  {
    id v5 = v9[0];
LABEL_4:

    return 1;
  }
  id v7 = v9[0];
  uint64_t v8 = (void *)sub_24CA85F70();

  swift_willThrow();
  return 0;
}

uint64_t sub_24CA75918(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B180A00);
    uint64_t v3 = sub_24CA865A0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_24CA86260();
      sub_24CA86720();
      id v7 = v6;
      sub_24CA862F0();
      uint64_t v8 = sub_24CA86760();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_24CA86260();
        uint64_t v17 = v16;
        if (v15 == sub_24CA86260() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_24CA866A0();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_24CA86260();
          uint64_t v24 = v23;
          if (v22 == sub_24CA86260() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_24CA866A0();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void sub_24CA75B48()
{
  v60[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v50 = sub_24CA85F60();
  uint64_t v0 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  char v55 = (char *)v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180870);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v56 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CA86020();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v49 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unsigned __int8 v58 = (char *)v38 - v8;
  id v9 = objc_msgSend(self, sel_defaultManager);
  uint64_t v10 = (void *)sub_24CA85FD0();
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B180888);
  uint64_t v11 = swift_allocObject();
  long long v53 = xmmword_24CA877D0;
  *(_OWORD *)(v11 + 16) = xmmword_24CA877D0;
  unint64_t v12 = (void *)*MEMORY[0x263EFF6A8];
  *(void *)(v11 + 32) = *MEMORY[0x263EFF6A8];
  type metadata accessor for URLResourceKey(0);
  uint64_t v14 = v13;
  id v51 = v12;
  uint64_t v52 = v14;
  uint64_t v15 = (void *)sub_24CA86400();
  id v16 = v9;
  swift_bridgeObjectRelease();
  v60[0] = 0;
  id v17 = objc_msgSend(v9, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v10, v15, 0, v60);

  id v18 = v60[0];
  if (v17)
  {
    uint64_t v19 = sub_24CA86410();
    id v20 = v18;

    v60[0] = (id)MEMORY[0x263F8EE78];
    uint64_t v21 = v4;
    uint64_t v45 = *(void *)(v19 + 16);
    if (v45)
    {
      id v39 = v9;
      unint64_t v22 = 0;
      uint64_t v48 = v5 + 16;
      uint64_t v46 = v5 + 48;
      char v57 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
      uint64_t v42 = (void (**)(char *, uint64_t))(v0 + 8);
      uint64_t v40 = (void (**)(char *, uint64_t))(v5 + 8);
      uint64_t v47 = v5 + 56;
      v38[1] = (v5 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v23 = (uint64_t)v56;
      uint64_t v43 = v5;
      uint64_t v44 = v19;
      do
      {
        if (v22 >= *(void *)(v19 + 16))
        {
          __break(1u);
LABEL_23:
          __break(1u);
        }
        unint64_t v24 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
        uint64_t v25 = *(void *)(v5 + 72);
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(v23, v19 + v24 + v25 * v22, v21);
        uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
        v41(v23, 0, 1, v21);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v23, 1, v21) == 1)
        {
          id v16 = v39;
          goto LABEL_21;
        }
        int64_t v26 = *v57;
        (*v57)(v58, v23, v21);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v53;
        uint64_t v28 = v51;
        *(void *)(inited + 32) = v51;
        id v29 = v28;
        sub_24CA75918(inited);
        swift_setDeallocating();
        uint64_t v30 = v55;
        swift_arrayDestroy();
        uint64_t v31 = v59;
        sub_24CA85FA0();
        uint64_t v59 = v31;
        if (v31)
        {
          swift_bridgeObjectRelease();
          (*v40)(v58, v21);
          swift_bridgeObjectRelease();

          swift_release();
          return;
        }
        swift_bridgeObjectRelease();
        char v32 = sub_24CA85F50();
        if (v32 == 2) {
          goto LABEL_23;
        }
        char v33 = v32;
        (*v42)(v30, v50);
        if (v33)
        {
          (*v40)(v58, v21);
        }
        else
        {
          v26(v49, (uint64_t)v58, v21);
          int64_t v34 = (char *)v60[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_24CA74788(0, *((void *)v34 + 2) + 1, 1);
            int64_t v34 = (char *)v60[0];
          }
          unint64_t v36 = *((void *)v34 + 2);
          unint64_t v35 = *((void *)v34 + 3);
          if (v36 >= v35 >> 1)
          {
            sub_24CA74788(v35 > 1, v36 + 1, 1);
            int64_t v34 = (char *)v60[0];
          }
          *((void *)v34 + 2) = v36 + 1;
          v26(&v34[v24 + v36 * v25], (uint64_t)v49, v21);
          v60[0] = v34;
        }
        uint64_t v19 = v44;
        ++v22;
        uint64_t v23 = (uint64_t)v56;
        uint64_t v5 = v43;
      }
      while (v45 != v22);
      id v16 = v39;
      v41((uint64_t)v56, 1, 1, v21);
    }
    else
    {
      uint64_t v23 = (uint64_t)v56;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v56, 1, 1, v4);
    }
LABEL_21:
    swift_bridgeObjectRelease();
    sub_24CA66680(v23, &qword_26B180870);
  }
  else
  {
    id v37 = v60[0];
    sub_24CA85F70();

    swift_willThrow();
  }
}

void sub_24CA761F0()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_defaultManager);
  uint64_t v1 = (void *)sub_24CA85FD0();
  v5[0] = 0;
  unsigned __int8 v2 = objc_msgSend(v0, sel_removeItemAtURL_error_, v1, v5);

  if (v2)
  {
    id v3 = v5[0];
  }
  else
  {
    id v4 = v5[0];
    sub_24CA85F70();

    swift_willThrow();
  }
}

id sub_24CA762D8(uint64_t a1, unsigned char *a2)
{
  if (*a2)
  {
    if (*a2 == 1)
    {
      sub_24CA86000();
      unsigned __int8 v2 = (void *)sub_24CA86230();
      id v3 = &selRef_fileHandleForUpdatingAtPath_;
    }
    else
    {
      sub_24CA86000();
      unsigned __int8 v2 = (void *)sub_24CA86230();
      id v3 = &selRef_fileHandleForWritingAtPath_;
    }
  }
  else
  {
    sub_24CA86000();
    unsigned __int8 v2 = (void *)sub_24CA86230();
    id v3 = &selRef_fileHandleForReadingAtPath_;
  }
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(self, *v3, v2);

  return v4;
}

void sub_24CA763A4()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_defaultManager);
  sub_24CA86000();
  uint64_t v1 = (void *)sub_24CA86230();
  unsigned int v2 = objc_msgSend(v0, sel_fileExistsAtPath_, v1);

  if (v2)
  {
    id v3 = (void *)sub_24CA86230();
    swift_bridgeObjectRelease();
    id v13 = 0;
    id v4 = objc_msgSend(v0, sel_attributesOfItemAtPath_error_, v3, &v13);

    id v5 = v13;
    if (v4)
    {
      type metadata accessor for FileAttributeKey(0);
      sub_24CA76D4C(&qword_26B180A98, type metadata accessor for FileAttributeKey);
      uint64_t v6 = sub_24CA861E0();
      id v7 = v5;

      uint64_t v8 = (void *)*MEMORY[0x263F080B8];
      if (*(void *)(v6 + 16))
      {
        unint64_t v9 = sub_24CA75190((uint64_t)v8);
        if (v10)
        {
          sub_24CA5B068(*(void *)(v6 + 56) + 32 * v9, (uint64_t)&v14);
        }
        else
        {
          long long v14 = 0u;
          long long v15 = 0u;
        }
      }
      else
      {
        long long v14 = 0u;
        long long v15 = 0u;
        id v12 = v8;
      }

      swift_bridgeObjectRelease();
      if (*((void *)&v15 + 1)) {
        swift_dynamicCast();
      }
      else {
        sub_24CA66680((uint64_t)&v14, &qword_269807BE8);
      }
    }
    else
    {
      id v11 = v13;
      sub_24CA85F70();

      swift_willThrow();
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24CA76608(void *a1, unsigned int a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = ftruncate((int)objc_msgSend(a1, sel_fileDescriptor), a2);
  if (result)
  {
    unsigned int v8 = result;
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v4, (uint64_t)qword_26B181220);
    sub_24CA4CFB0(v9, (uint64_t)v6);
    uint64_t v11 = 0x7461636E75727466;
    unint64_t v12 = 0xEB00000000203A65;
    unsigned int v13 = v8;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA5A180(v11, v12, 0xD000000000000062, 0x800000024CA8AF10, 0xD000000000000011, 0x800000024CA8AF80);
    swift_bridgeObjectRelease();
    sub_24CA4D06C((uint64_t)v6);
    sub_24CA56E20();
    swift_allocError();
    *(void *)uint64_t v10 = v8;
    *(void *)(v10 + 8) = 0;
    *(unsigned char *)(v10 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_24CA767E0()
{
  unint64_t result = qword_269807BD0;
  if (!qword_269807BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807BD0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MemoryAccess(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA76900);
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

ValueMetadata *type metadata accessor for MemoryAccess()
{
  return &type metadata for MemoryAccess;
}

ValueMetadata *type metadata accessor for Storage()
{
  return &type metadata for Storage;
}

uint64_t getEnumTagSinglePayload for Storage.EnsureExistsResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE)
  {
    unsigned int v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 2;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24CA76A04);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 2;
  unsigned int v9 = (v7 + 2147483646) & 0x7FFFFFFF;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for Storage.EnsureExistsResult(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFE) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v7 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x24CA76AECLL);
      case 4:
        *(_DWORD *)(result + 1) = v7;
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
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_24CA76B14(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

unsigned char *sub_24CA76B30(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for Storage.EnsureExistsResult()
{
  return &type metadata for Storage.EnsureExistsResult;
}

uint64_t sub_24CA76B5C(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for StorageError(uint64_t a1)
{
  return sub_24CA76B80(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24CA76B80(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s8Dendrite12StorageErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24CA76B5C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for StorageError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24CA76B5C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24CA76B80(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for StorageError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24CA76B80(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorageError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StorageError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 254;
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

uint64_t sub_24CA76D0C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24CA76D24(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StorageError()
{
  return &type metadata for StorageError;
}

uint64_t sub_24CA76D4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CA76D94()
{
  sub_24CA865B0();
  uint64_t result = swift_bridgeObjectRelease();
  qword_269807BF8 = 0xD000000000000041;
  unk_269807C00 = 0x800000024CA8B0F0;
  return result;
}

uint64_t sub_24CA76DF8()
{
  sub_24CA865B0();
  uint64_t result = swift_bridgeObjectRelease();
  qword_269807C08 = 0xD00000000000002ELL;
  unk_269807C10 = 0x800000024CA8B300;
  return result;
}

uint64_t sub_24CA76E5C()
{
  sub_24CA865B0();
  uint64_t result = swift_bridgeObjectRelease();
  qword_269807C18 = 0xD000000000000033;
  unk_269807C20 = 0x800000024CA8B250;
  return result;
}

uint64_t sub_24CA76EC0()
{
  sub_24CA865B0();
  uint64_t result = swift_bridgeObjectRelease();
  qword_269807C28 = 0xD000000000000025;
  unk_269807C30 = 0x800000024CA8B220;
  return result;
}

uint64_t sub_24CA76F24()
{
  sub_24CA865B0();
  uint64_t result = swift_bridgeObjectRelease();
  qword_269807C38 = 0xD000000000000032;
  unk_269807C40 = 0x800000024CA8B290;
  return result;
}

uint64_t sub_24CA76F88()
{
  sub_24CA865B0();
  uint64_t result = swift_bridgeObjectRelease();
  qword_269807C48 = 0xD000000000000027;
  unk_269807C50 = 0x800000024CA8B2D0;
  return result;
}

void *sub_24CA76FEC(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = v2;
  uint64_t v6 = sub_24CA86020();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388]();
  unint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3[2] = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_STATIC) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_TRANSIENT) = -1;
  if (qword_269807590 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v10, (uint64_t)qword_26980A100);
  sub_24CA4CFB0(v13, (uint64_t)v12);
  uint64_t v16 = 0x7461702074696E49;
  unint64_t v17 = 0xEA00000000002068;
  sub_24CA86000();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168(v16, v17, 0xD000000000000056, 0x800000024CA8B050, 0xD00000000000001ALL, 0x800000024CA8B330);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v12);
  v3[3] = sub_24CA86000();
  v3[4] = v14;
  sub_24CA85FF0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))((uint64_t)v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_folderUrl, v9, v6);
  *(void *)((char *)v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_protectionType) = a2;
  return v3;
}

void sub_24CA77260()
{
  uint64_t v2 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v2);
  sub_24CA79D1C();
  if (!v1)
  {
    int v3 = sub_24CA77580() | 6;
    int v4 = (const char *)(sub_24CA862C0() + 32);
    swift_beginAccess();
    unsigned int v5 = sqlite3_open_v2(v4, (sqlite3 **)(v0 + 16), v3, 0);
    swift_endAccess();
    swift_release();
    sub_24CA77B54(v5, 0x7243724F6E65706FLL, 0xEE00292865746165);
    sub_24CA7776C();
    sub_24CA77930();
  }
}

uint64_t sub_24CA77580()
{
  uint64_t v0 = sub_24CA86260();
  uint64_t v2 = v1;
  if (v0 == sub_24CA86260() && v2 == v3)
  {
    uint64_t v6 = 0x100000;
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v6;
  }
  char v5 = sub_24CA866A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = sub_24CA86260();
    uint64_t v10 = v9;
    if (v8 == sub_24CA86260() && v10 == v11)
    {
      uint64_t v6 = 0x200000;
    }
    else
    {
      char v13 = sub_24CA866A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v13) {
        return 0x200000;
      }
      uint64_t v14 = sub_24CA86260();
      uint64_t v16 = v15;
      if (v14 == sub_24CA86260() && v16 == v17)
      {
        uint64_t v6 = 3145728;
      }
      else
      {
        char v18 = sub_24CA866A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v18) {
          return 3145728;
        }
        uint64_t v19 = sub_24CA86260();
        uint64_t v21 = v20;
        uint64_t v6 = 0x400000;
        if (v19 != sub_24CA86260() || v21 != v22)
        {
          if (sub_24CA866A0()) {
            uint64_t v6 = 0x400000;
          }
          else {
            uint64_t v6 = 0;
          }
        }
      }
    }
    goto LABEL_8;
  }
  return 0x100000;
}

const char *sub_24CA7776C()
{
  swift_beginAccess();
  uint64_t v2 = *(sqlite3 **)(v0 + 16);
  if (v2)
  {
LABEL_2:
    unsigned int v3 = sqlite3_exec(v2, "PRAGMA journal_mode=WAL", 0, 0, 0);
    uint64_t result = sub_24CA77B54(v3, 0x657475636578655FLL, 0xEE00293A6C717328);
    if (!v1) {
      return result;
    }
    goto LABEL_5;
  }
  sub_24CA77260();
  if (!v1)
  {
    uint64_t v2 = *(sqlite3 **)(v0 + 16);
    goto LABEL_2;
  }
LABEL_5:
  if (qword_269807590 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v5, (uint64_t)qword_26980A100);
  sub_24CA865B0();
  sub_24CA86320();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698079C8);
  sub_24CA865E0();
  sub_24CA5A168(0, 0xE000000000000000, 0xD000000000000056, 0x800000024CA8B050, 0xD000000000000019, 0x800000024CA8B160);
  swift_bridgeObjectRelease();
  return (const char *)swift_willThrow();
}

const char *sub_24CA77930()
{
  if (qword_2698075D8 != -1) {
    swift_once();
  }
  uint64_t v2 = swift_beginAccess();
  unsigned int v3 = *(sqlite3 **)(v0 + 16);
  if (v3)
  {
LABEL_4:
    uint64_t v4 = sub_24CA862C0();
    unsigned int v5 = sqlite3_exec(v3, (const char *)(v4 + 32), 0, 0, 0);
    swift_release();
    uint64_t result = sub_24CA77B54(v5, 0x657475636578655FLL, 0xEE00293A6C717328);
    if (!v1) {
      return result;
    }
    goto LABEL_7;
  }
  sub_24CA77260(v2);
  if (!v1)
  {
    unsigned int v3 = *(sqlite3 **)(v0 + 16);
    goto LABEL_4;
  }
LABEL_7:
  if (qword_269807590 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v7, (uint64_t)qword_26980A100);
  sub_24CA865B0();
  sub_24CA86320();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698079C8);
  sub_24CA865E0();
  sub_24CA5A168(0, 0xE000000000000000, 0xD000000000000056, 0x800000024CA8B050, 0x286574617267696DLL, 0xE900000000000029);
  swift_bridgeObjectRelease();
  return (const char *)swift_willThrow();
}

const char *sub_24CA77B54(unsigned int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = type metadata accessor for InternalLogger();
  uint64_t result = (const char *)MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (dword_26FF13B90 != a1 && unk_26FF13B94 != a1 && dword_26FF13B98 != a1)
  {
    swift_beginAccess();
    uint64_t v13 = sqlite3_extended_errcode(*(sqlite3 **)(v3 + 16));
    uint64_t result = sqlite3_errstr(a1);
    if (result)
    {
      uint64_t v14 = sub_24CA86220();
      uint64_t v16 = v15;
      sub_24CA798BC();
      if (qword_269807590 != -1) {
        swift_once();
      }
      uint64_t v17 = __swift_project_value_buffer(v7, (uint64_t)qword_26980A100);
      sub_24CA4CFB0(v17, (uint64_t)v10);
      uint64_t v20 = 0;
      unint64_t v21 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v20 = a2;
      unint64_t v21 = a3;
      sub_24CA86320();
      unsigned int v22 = a1;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA86320();
      unsigned int v22 = v13;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA86320();
      swift_bridgeObjectRetain();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA5A180(v20, v21, 0xD000000000000056, 0x800000024CA8B050, 0xD000000000000018, 0x800000024CA8B0B0);
      swift_bridgeObjectRelease();
      sub_24CA4D06C((uint64_t)v10);
      sub_24CA79BFC();
      swift_allocError();
      *(void *)uint64_t v18 = a1 | (unint64_t)(v13 << 32);
      *(void *)(v18 + 8) = v14;
      *(void *)(v18 + 24) = 0;
      *(void *)(v18 + 32) = 0;
      *(void *)(v18 + 16) = v16;
      *(unsigned char *)(v18 + 40) = 0;
      return (const char *)swift_willThrow();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_24CA77E54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v62 = a1;
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  uint64_t AssociatedConformanceWitness = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = (char *)&v55 - v10;
  char v63 = (sqlite3 **)(v2 + 16);
  swift_beginAccess();
  unint64_t v12 = *(sqlite3 **)(v2 + 16);
  if (!v12)
  {
    sub_24CA77260();
    if (v3) {
      return;
    }
    unint64_t v12 = *v63;
  }
  unsigned int v13 = sqlite3_exec(v12, "BEGIN;", 0, 0, 0);
  sub_24CA77B54(v13, 0x657475636578655FLL, 0xEE00293A6C717328);
  if (!v3)
  {
    uint64_t v59 = AssociatedTypeWitness;
    uint64_t v60 = v11;
    uint64_t v58 = v9;
    ppStmt[0] = 0;
    uint64_t v14 = *v63;
    if (qword_2698075E0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24CA86300();
    uint64_t v16 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
    }
    else if (v16 >= (uint64_t)0xFFFFFFFF80000000)
    {
      if (v16 <= 0x7FFFFFFF)
      {
        uint64_t v17 = sub_24CA862C0();
        unsigned int v18 = sqlite3_prepare_v2(v14, (const char *)(v17 + 32), v16, ppStmt, 0);
        swift_release();
        sub_24CA77B54(v18, 0xD000000000000011, 0x800000024CA897B0);
        (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v7, v62, a2);
        sub_24CA863C0();
        uint64_t v62 = OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_STATIC;
        uint64_t v20 = v59;
        uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        sub_24CA86530();
        unint64_t v21 = *((void *)&v64 + 1);
        if (*((void *)&v64 + 1) >> 60 == 15)
        {
LABEL_13:
          (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v20);
          unsigned int v22 = sqlite3_exec(*(sqlite3 **)(v4 + 16), "COMMIT;", 0, 0, 0);
          sub_24CA77B54(v22, 0x657475636578655FLL, 0xEE00293A6C717328);
          unsigned int v23 = sqlite3_finalize(ppStmt[0]);
          sub_24CA77B54(v23, 0xD000000000000011, 0x800000024CA897B0);
          sqlite3_last_insert_rowid(*v63);
          return;
        }
        uint64_t v24 = v64;
        unint64_t v56 = 0x800000024CA897B0;
        while (1)
        {
          switch(v21 >> 62)
          {
            case 1uLL:
              if (v24 >> 32 < (int)v24) {
                goto LABEL_53;
              }
              sub_24CA497DC(v24, v21);
              uint64_t v29 = sub_24CA85F00();
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = sub_24CA85F30();
                if (__OFSUB__((int)v24, v31)) {
                  goto LABEL_58;
                }
                char v32 = (const void *)(v30 + (int)v24 - v31);
              }
              else
              {
                char v32 = 0;
              }
              uint64_t v49 = sub_24CA85F20();
              if (v49 >= (v24 >> 32) - (int)v24) {
                uint64_t v50 = (v24 >> 32) - (int)v24;
              }
              else {
                uint64_t v50 = v49;
              }
              if (v32)
              {
                if (v50 < (uint64_t)0xFFFFFFFF80000000)
                {
                  __break(1u);
                  swift_release();
                  swift_release();
                  (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v59);
                  sub_24CA51D8C(v24, v21);
                  unsigned int v19 = sqlite3_exec(*(sqlite3 **)(v4 + 16), "ROLLBACK;", 0, 0, 0);
                  sub_24CA77B54(v19, 0x657475636578655FLL, 0xEE00293A6C717328);
                  sub_24CA798BC();
                  swift_willThrow();
                  return;
                }
                if (v50 > 0x7FFFFFFF) {
                  goto LABEL_59;
                }
              }
              else
              {
                LODWORD(v50) = 0;
              }
              id v51 = ppStmt[0];
              unsigned int v52 = sqlite3_bind_blob(ppStmt[0], 1, v32, v50, *(void (__cdecl **)(void *))(v4 + v62));
              sub_24CA77B54(v52, 0xD000000000000011, 0x800000024CA897B0);
              unsigned int v53 = sqlite3_step(v51);
              sub_24CA77B54(v53, 0xD000000000000011, 0x800000024CA897B0);
              uint64_t v20 = v59;
              unsigned int v54 = sqlite3_reset(v51);
              sub_24CA77B54(v54, 0xD000000000000011, 0x800000024CA897B0);
              sub_24CA51D8C(v24, v21);
LABEL_46:
              sub_24CA51D8C(v24, v21);
LABEL_47:
              sub_24CA86530();
              unint64_t v21 = *((void *)&v64 + 1);
              uint64_t v24 = v64;
              if (*((void *)&v64 + 1) >> 60 == 15) {
                goto LABEL_13;
              }
              break;
            case 2uLL:
              uint64_t v33 = *(void *)(v24 + 16);
              uint64_t v34 = *(void *)(v24 + 24);
              swift_retain();
              swift_retain();
              unint64_t v35 = (char *)sub_24CA85F00();
              uint64_t v57 = v21 & 0x3FFFFFFFFFFFFFFFLL;
              if (!v35) {
                goto LABEL_24;
              }
              uint64_t v36 = sub_24CA85F30();
              if (__OFSUB__(v33, v36)) {
                goto LABEL_57;
              }
              v35 += v33 - v36;
LABEL_24:
              BOOL v37 = __OFSUB__(v34, v33);
              uint64_t v38 = v34 - v33;
              if (v37) {
                goto LABEL_54;
              }
              uint64_t v39 = sub_24CA85F20();
              if (v39 >= v38) {
                uint64_t v40 = v38;
              }
              else {
                uint64_t v40 = v39;
              }
              if (v35) {
                uint64_t v41 = v40;
              }
              else {
                uint64_t v41 = 0;
              }
              if (v41 < (uint64_t)0xFFFFFFFF80000000) {
                goto LABEL_55;
              }
              if (v41 > 0x7FFFFFFF) {
                goto LABEL_56;
              }
              uint64_t v42 = ppStmt[0];
              unsigned int v43 = sqlite3_bind_blob(ppStmt[0], 1, v35, v41, *(void (__cdecl **)(void *))(v4 + v62));
              sub_24CA77B54(v43, 0xD000000000000011, 0x800000024CA897B0);
              unsigned int v44 = sqlite3_step(v42);
              sub_24CA77B54(v44, 0xD000000000000011, 0x800000024CA897B0);
              unsigned int v45 = sqlite3_reset(v42);
              sub_24CA77B54(v45, 0xD000000000000011, 0x800000024CA897B0);
              swift_release();
              swift_release();
              sub_24CA51D8C(v24, v21);
              uint64_t v20 = v59;
              goto LABEL_47;
            case 3uLL:
              *(void *)((char *)&v64 + 6) = 0;
              *(void *)&long long v64 = 0;
              uint64_t v46 = ppStmt[0];
              unsigned int v47 = sqlite3_bind_blob(ppStmt[0], 1, &v64, 0, *(void (__cdecl **)(void *))(v4 + v62));
              sub_24CA77B54(v47, 0xD000000000000011, 0x800000024CA897B0);
              unsigned int v48 = sqlite3_step(v46);
              sub_24CA77B54(v48, 0xD000000000000011, 0x800000024CA897B0);
              unsigned int v28 = sqlite3_reset(v46);
              goto LABEL_35;
            default:
              *(void *)&long long v64 = v24;
              WORD4(v64) = v21;
              BYTE10(v64) = BYTE2(v21);
              BYTE11(v64) = BYTE3(v21);
              BYTE12(v64) = BYTE4(v21);
              BYTE13(v64) = BYTE5(v21);
              uint64_t v25 = ppStmt[0];
              unsigned int v26 = sqlite3_bind_blob(ppStmt[0], 1, &v64, BYTE6(v21), *(void (__cdecl **)(void *))(v4 + v62));
              sub_24CA77B54(v26, 0xD000000000000011, v56);
              unsigned int v27 = sqlite3_step(v25);
              sub_24CA77B54(v27, 0xD000000000000011, 0x800000024CA897B0);
              unsigned int v28 = sqlite3_reset(v25);
LABEL_35:
              sub_24CA77B54(v28, 0xD000000000000011, 0x800000024CA897B0);
              goto LABEL_46;
          }
        }
      }
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
    }
    __break(1u);
    goto LABEL_52;
  }
}

void sub_24CA787A4(sqlite3_int64 a1, uint64_t a2, unint64_t a3)
{
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  swift_beginAccess();
  uint64_t v8 = *(sqlite3 **)(v3 + 16);
  if (!v8)
  {
    sub_24CA77260();
    if (v4) {
      return;
    }
    uint64_t v8 = *(sqlite3 **)(v3 + 16);
  }
  ppStmt[0] = 0;
  if (qword_2698075F8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24CA86300();
  uint64_t v10 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v10 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v10 > 0x7FFFFFFF)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  uint64_t v11 = sub_24CA862C0();
  unsigned int v12 = sqlite3_prepare_v2(v8, (const char *)(v11 + 32), v10, ppStmt, 0);
  swift_release();
  sub_24CA77B54(v12, 0xD000000000000013, 0x800000024CA89460);
  if (v4)
  {
    sub_24CA798BC();
    swift_willThrow();
  }
  else
  {
    unsigned int v13 = ppStmt[0];
    unsigned int v14 = sqlite3_bind_int64(ppStmt[0], 2, a1);
    sub_24CA77B54(v14, 0xD000000000000013, 0x800000024CA89460);
    switch(a3 >> 62)
    {
      case 1uLL:
        if (a2 >> 32 < (int)a2) {
          goto LABEL_24;
        }
        swift_retain();
        sub_24CA497DC(a2, a3);
        sub_24CA79C50((int)a2, a2 >> 32, a3 & 0x3FFFFFFFFFFFFFFFLL, v3, ppStmt, 1);
        sub_24CA4986C(a2, a3);
        break;
      case 2uLL:
        uint64_t v19 = *(void *)(a2 + 16);
        uint64_t v20 = *(void *)(a2 + 24);
        swift_retain();
        swift_retain();
        swift_retain();
        sub_24CA79C50(v19, v20, a3 & 0x3FFFFFFFFFFFFFFFLL, v3, ppStmt, 1);
        swift_release();
        goto LABEL_19;
      case 3uLL:
        memset(v24, 0, 14);
        unint64_t v21 = *(void (__cdecl **)(void *))(v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_STATIC);
        swift_retain();
        uint64_t v16 = v13;
        int v17 = 0;
        unsigned int v18 = v21;
        goto LABEL_16;
      default:
        v24[0] = a2;
        LOWORD(v24[1]) = a3;
        BYTE2(v24[1]) = BYTE2(a3);
        BYTE3(v24[1]) = BYTE3(a3);
        BYTE4(v24[1]) = BYTE4(a3);
        BYTE5(v24[1]) = BYTE5(a3);
        uint64_t v15 = *(void (__cdecl **)(void *))(v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_STATIC);
        swift_retain();
        uint64_t v16 = v13;
        int v17 = BYTE6(a3);
        unsigned int v18 = v15;
LABEL_16:
        unsigned int v22 = sqlite3_bind_blob(v16, 1, v24, v17, v18);
        sub_24CA77B54(v22, 0xD000000000000013, 0x800000024CA89460);
        unsigned int v23 = sqlite3_step(v13);
        sub_24CA77B54(v23, 0xD000000000000013, 0x800000024CA89460);
LABEL_19:
        swift_release();
        break;
    }
    sqlite3_finalize(v13);
  }
}

const char *sub_24CA78BA0(const char *result, uint64_t a2, uint64_t a3, sqlite3_stmt **a4, int a5)
{
  if (result) {
    uint64_t v7 = a2 - (void)result;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v7 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v7 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  unsigned int v8 = sqlite3_bind_blob(*a4, a5, result, v7, *(void (__cdecl **)(void *))(a3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_STATIC));
  uint64_t result = sub_24CA77B54(v8, 0xD000000000000013, 0x800000024CA89460);
  if (!v5)
  {
    unsigned int v9 = sqlite3_step(*a4);
    return sub_24CA77B54(v9, 0xD000000000000013, 0x800000024CA89460);
  }
  return result;
}

uint64_t sub_24CA78C6C(sqlite3_int64 a1)
{
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  swift_beginAccess();
  uint64_t v4 = *(sqlite3 **)(v1 + 16);
  if (!v4)
  {
    sub_24CA77260();
    if (v2) {
      return v1;
    }
    uint64_t v4 = *(sqlite3 **)(v1 + 16);
  }
  ppStmt[0] = 0;
  if (qword_2698075E8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CA86300();
  uint64_t v6 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v6 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  if (v6 > 0x7FFFFFFF) {
    goto LABEL_17;
  }
  uint64_t v7 = sub_24CA862C0();
  unsigned int v8 = sqlite3_prepare_v2(v4, (const char *)(v7 + 32), v6, ppStmt, 0);
  swift_release();
  sub_24CA77B54(v8, 0x6469286863746566, 0xEA0000000000293ALL);
  if (!v2)
  {
    unsigned int v9 = ppStmt[0];
    unsigned int v10 = sqlite3_bind_int64(ppStmt[0], 1, a1);
    sub_24CA77B54(v10, 0x6469286863746566, 0xEA0000000000293ALL);
    uint64_t v11 = (void *)sub_24CA79198(v9);
    if (v11[2])
    {
      uint64_t v1 = v11[4];
      sub_24CA497DC(v11[5], v11[6]);
    }
    else
    {
      uint64_t v1 = 0;
    }
    swift_bridgeObjectRelease();
  }
  return v1;
}

void sub_24CA78E88(sqlite3_int64 a1, char a2, uint64_t a3)
{
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  unsigned int v8 = (sqlite3 **)(v3 + 16);
  swift_beginAccess();
  if (*(void *)(v3 + 16) || (sub_24CA77260(), !v4))
  {
    sqlite3_int64 v24 = a1;
    *(void *)uint64_t v25 = a3;
    if (a2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 0x4F20455245485720;
    }
    if (a2) {
      unint64_t v10 = 0xE000000000000000;
    }
    else {
      unint64_t v10 = 0xEF3F203D3E204449;
    }
    if ((a3 & 0x100000000) != 0) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 0x3F2054494D494CLL;
    }
    if ((a3 & 0x100000000) != 0) {
      unint64_t v12 = 0xE000000000000000;
    }
    else {
      unint64_t v12 = 0xE700000000000000;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D8);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_24CA882B0;
    if (qword_2698075F0 != -1) {
      swift_once();
    }
    uint64_t v14 = unk_269807C30;
    *(void *)(v13 + 32) = qword_269807C28;
    *(void *)(v13 + 40) = v14;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v10;
    *(void *)(v13 + 64) = v11;
    *(void *)(v13 + 72) = v12;
    *(void *)(v13 + 80) = 59;
    *(void *)(v13 + 88) = 0xE100000000000000;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F790);
    sub_24CA79FD4();
    sub_24CA86200();
    swift_bridgeObjectRelease();
    ppStmt[0] = 0;
    uint64_t v15 = *v8;
    uint64_t v16 = sub_24CA86300();
    uint64_t v17 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
    }
    else if (v17 >= (uint64_t)0xFFFFFFFF80000000)
    {
      if (v17 <= 0x7FFFFFFF)
      {
        uint64_t v18 = sub_24CA862C0();
        swift_bridgeObjectRelease();
        unsigned int v19 = sqlite3_prepare_v2(v15, (const char *)(v18 + 32), v17, ppStmt, 0);
        swift_release();
        sub_24CA77B54(v19, 0xD00000000000001BLL, 0x800000024CA8B200);
        if (v4) {
          return;
        }
        if (a2)
        {
          int v22 = 1;
          int v21 = v25[0];
          if ((*(void *)v25 & 0x100000000) != 0)
          {
LABEL_27:
            sub_24CA79198(ppStmt[0]);
            return;
          }
        }
        else
        {
          unsigned int v20 = sqlite3_bind_int64(ppStmt[0], 1, v24);
          sub_24CA77B54(v20, 0xD00000000000001BLL, 0x800000024CA8B200);
          int v21 = v25[0];
          int v22 = 2;
          if ((*(void *)v25 & 0x100000000) != 0) {
            goto LABEL_27;
          }
        }
        unsigned int v23 = sqlite3_bind_int(ppStmt[0], v22, v21);
        sub_24CA77B54(v23, 0xD00000000000001BLL, 0x800000024CA8B200);
        goto LABEL_27;
      }
LABEL_31:
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
}

uint64_t sub_24CA79198(sqlite3_stmt *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v5 = sqlite3_step(a1);
  uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  if (v5 == 100)
  {
    uint64_t v26 = 0x800000024CA8B050;
    unint64_t v27 = 0x800000024CA8B030;
    unint64_t v25 = 0x800000024CA8B010;
    long long v24 = xmmword_24CA88BB0;
    do
    {
      sqlite3_int64 v8 = sqlite3_column_int64(a1, 0);
      uint64_t v9 = sqlite3_column_blob(a1, 1);
      if (v9)
      {
        unint64_t v10 = v9;
        int v11 = sqlite3_column_bytes(a1, 1);
        if (v11)
        {
          uint64_t v12 = v11;
          if (v11 <= 14)
          {
            *(void *)((char *)&__dst + 6) = 0;
            *(void *)&long long __dst = 0;
            BYTE14(__dst) = v11;
            memcpy(&__dst, v10, v11);
            uint64_t v14 = __dst;
            unint64_t v15 = DWORD2(__dst) | ((unint64_t)BYTE12(__dst) << 32) | ((unint64_t)BYTE13(__dst) << 40) | ((unint64_t)BYTE14(__dst) << 48);
          }
          else
          {
            sub_24CA85F40();
            swift_allocObject();
            if (v12 == 0x7FFFFFFF)
            {
              uint64_t v13 = sub_24CA85EF0();
              sub_24CA86070();
              uint64_t v14 = swift_allocObject();
              *(_OWORD *)(v14 + 16) = v24;
              unint64_t v15 = v13 | 0x8000000000000000;
            }
            else
            {
              uint64_t v14 = v12 << 32;
              unint64_t v15 = sub_24CA85EF0() | 0x4000000000000000;
            }
          }
        }
        else
        {
          uint64_t v14 = 0;
          unint64_t v15 = 0xC000000000000000;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_24CA823D8(0, v6[2] + 1, 1, v6);
        }
        unint64_t v18 = v6[2];
        unint64_t v17 = v6[3];
        if (v18 >= v17 >> 1) {
          uint64_t v6 = sub_24CA823D8((void *)(v17 > 1), v18 + 1, 1, v6);
        }
        uint64_t v6[2] = v18 + 1;
        uint64_t v7 = &v6[3 * v18];
        v7[4] = v8;
        v7[5] = v14;
        v7[6] = v15;
      }
      else
      {
        if (qword_269807590 != -1) {
          swift_once();
        }
        uint64_t v16 = __swift_project_value_buffer(v2, (uint64_t)qword_26980A100);
        sub_24CA4CFB0(v16, (uint64_t)v4);
        *(void *)&long long __dst = 0;
        *((void *)&__dst + 1) = 0xE000000000000000;
        sub_24CA865B0();
        swift_bridgeObjectRelease();
        *(void *)&long long __dst = 0xD000000000000014;
        *((void *)&__dst + 1) = v27;
        sqlite3_int64 v28 = v8;
        sub_24CA86680();
        sub_24CA86320();
        swift_bridgeObjectRelease();
        sub_24CA5A168(__dst, *((unint64_t *)&__dst + 1), 0xD000000000000056, v26, 0xD000000000000013, v25);
        swift_bridgeObjectRelease();
        sub_24CA4D06C((uint64_t)v4);
      }
    }
    while (sqlite3_step(a1) == 100);
  }
  unsigned int v19 = sqlite3_finalize(a1);
  uint64_t v20 = v23[0];
  uint64_t v21 = v23[1];
  sub_24CA77B54(v19, 0xD000000000000013, 0x800000024CA8B010);
  if (!v21) {
    uint64_t v20 = sub_24CA79570((uint64_t)v6);
  }
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_24CA79570(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    sub_24CA74748(0, v1, 0);
    uint64_t v2 = v12;
    uint64_t v4 = (unint64_t *)(a1 + 48);
    do
    {
      sub_24CA497DC(*(v4 - 1), *v4);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269807C88);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269807BE0);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24CA74748(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v12;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_24CA74748(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v12;
      }
      v4 += 3;
      *(void *)(v2 + 16) = v6 + 1;
      uint64_t v7 = (void *)(v2 + 24 * v6);
      v7[4] = v9;
      v7[5] = v10;
      v7[6] = v11;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_24CA796BC(sqlite3_int64 a1)
{
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  swift_beginAccess();
  uint64_t v4 = *(sqlite3 **)(v1 + 16);
  if (!v4)
  {
    sub_24CA77260();
    if (v2) {
      return;
    }
    uint64_t v4 = *(sqlite3 **)(v1 + 16);
  }
  ppStmt[0] = 0;
  if (qword_269807600 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CA86300();
  uint64_t v6 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v6 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  if (v6 > 0x7FFFFFFF) {
    goto LABEL_14;
  }
  uint64_t v7 = sub_24CA862C0();
  unsigned int v8 = sqlite3_prepare_v2(v4, (const char *)(v7 + 32), v6, ppStmt, 0);
  swift_release();
  sub_24CA77B54(v8, 0x69286574656C6564, 0xEB00000000293A64);
  if (!v2)
  {
    uint64_t v9 = ppStmt[0];
    unsigned int v10 = sqlite3_bind_int64(ppStmt[0], 1, a1);
    sub_24CA77B54(v10, 0x69286574656C6564, 0xEB00000000293A64);
    unsigned int v11 = sqlite3_step(v9);
    sub_24CA77B54(v11, 0x69286574656C6564, 0xEB00000000293A64);
    sqlite3_finalize(v9);
  }
}

uint64_t sub_24CA798BC()
{
  uint64_t v1 = (sqlite3 **)(v0 + 16);
  swift_beginAccess();
  if (*(void *)(v0 + 16))
  {
    if (qword_269807590 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for InternalLogger();
    __swift_project_value_buffer(v2, (uint64_t)qword_26980A100);
    sub_24CA5A198(0x20676E69736F6C43, 0xEA00000000006264, 0xD000000000000056, 0x800000024CA8B050, 0x292865736F6C63, 0xE700000000000000);
    uint64_t result = sqlite3_close_v2(*v1);
    void *v1 = 0;
  }
  else
  {
    if (qword_269807590 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for InternalLogger();
    __swift_project_value_buffer(v4, (uint64_t)qword_26980A100);
    return sub_24CA5A198(0x20676E69736F6C43, 0xED0000706F2D6F6ELL, 0xD000000000000056, 0x800000024CA8B050, 0x292865736F6C63, 0xE700000000000000);
  }
  return result;
}

uint64_t sub_24CA79A2C()
{
  sub_24CA798BC();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_folderUrl;
  uint64_t v2 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_24CA79AE8()
{
  return type metadata accessor for SQLiteStorage();
}

uint64_t type metadata accessor for SQLiteStorage()
{
  uint64_t result = qword_269807C78;
  if (!qword_269807C78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA79B3C()
{
  uint64_t result = sub_24CA86020();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_24CA79BFC()
{
  unint64_t result = qword_269807C90;
  if (!qword_269807C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807C90);
  }
  return result;
}

uint64_t sub_24CA79C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, sqlite3_stmt **a5, int a6)
{
  uint64_t result = sub_24CA85F00();
  uint64_t v12 = (const char *)result;
  if (result)
  {
    uint64_t result = sub_24CA85F30();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v12 += a1 - result;
  }
  BOOL v13 = __OFSUB__(a2, a1);
  uint64_t v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v15 = sub_24CA85F20();
  if (v15 >= v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v15;
  }
  unint64_t v17 = &v12[v16];
  if (v12) {
    uint64_t v18 = (uint64_t)v17;
  }
  else {
    uint64_t v18 = 0;
  }
  sub_24CA78BA0(v12, v18, a4, a5, a6);
  return swift_release();
}

id sub_24CA79D1C()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v0 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269807590 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_project_value_buffer(v0, (uint64_t)qword_26980A100);
  sub_24CA4CFB0(v3, (uint64_t)v2);
  id v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_24CA865B0();
  swift_bridgeObjectRelease();
  id v10 = (id)0xD000000000000010;
  unint64_t v11 = 0x800000024CA8B1C0;
  sub_24CA86020();
  sub_24CA4D014();
  sub_24CA86680();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA5A168((uint64_t)v10, v11, 0xD000000000000056, 0x800000024CA8B050, 0xD000000000000011, 0x800000024CA8B1E0);
  swift_bridgeObjectRelease();
  sub_24CA4D06C((uint64_t)v2);
  id v4 = objc_msgSend(self, sel_defaultManager);
  uint64_t v5 = (void *)sub_24CA85FD0();
  id v10 = 0;
  unsigned __int8 v6 = objc_msgSend(v4, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v5, 1, 0, &v10);

  if (v6) {
    return v10;
  }
  id v8 = v10;
  sub_24CA85F70();

  return (id)swift_willThrow();
}

uint64_t sub_24CA79F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6 && a6 != 2)
  {
    if (a6 != 1) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_24CA79FD4()
{
  unint64_t result = qword_26B17F798;
  if (!qword_26B17F798)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B17F790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17F798);
  }
  return result;
}

uint64_t sub_24CA7A030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6 && a6 != 2)
  {
    if (a6 != 1) {
      return result;
    }
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t destroy for SQLiteError(uint64_t a1)
{
  return sub_24CA79F64(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t initializeWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_24CA7A030(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_24CA7A030(*(void *)a2, v4, v5, v6, v7, v8);
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
  sub_24CA79F64(v9, v10, v11, v12, v13, v14);
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

uint64_t assignWithTake for SQLiteError(uint64_t a1, uint64_t a2)
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
  sub_24CA79F64(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CA7A2B4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_24CA7A2BC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteError()
{
  return &type metadata for SQLiteError;
}

uint64_t sub_24CA7A2D4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24CA7A31C()
{
  return v0;
}

uint64_t sub_24CA7A324()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AtomicRegion()
{
  return __swift_instantiateGenericMetadata();
}

void DataFrameStream.append(_:)(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  if (!v1)
  {
    uint64_t v6 = v4;
    unint64_t v7 = v5;
    MEMORY[0x270FA5388](v4);
    uint64_t v9 = (uint64_t *)&v8[4];
    long long v10 = v8 + 10;
    os_unfair_lock_lock(v8 + 10);
    sub_24CA58CBC(v9, &v11);
    os_unfair_lock_unlock(v10);
    if (v11) {
      sub_24CA5FB94(v6, v7);
    }
    sub_24CA4986C(v6, v7);
  }
}

uint64_t DataFrameStream.iterate<A>(ignoreConversionFailures:reversed:each:)(uint64_t a1, char a2, uint64_t (*a3)(uint64_t, uint64_t, char *), uint64_t a4, uint64_t a5)
{
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  char v9 = a1;
  uint64_t v10 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  sqlite3_int64 v28 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DataFrameStreamTypedIterator.Element();
  uint64_t v13 = sub_24CA86520();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (unsigned int *)((char *)v26 - v14);
  uint64_t v31 = a5;
  type metadata accessor for DataFrameStreamTypedIterator();
  uint64_t v16 = DataFrameStreamTypedIterator.__allocating_init(stream:reversed:ignoreConversionErrors:)(v5, a2, v9);
  unint64_t v17 = *(uint64_t (**)(void))(*(void *)v16 + 120);
  v26[1] = v16;
  uint64_t v33 = v17();
  uint64_t v32 = v12 - 8;
  unint64_t v27 = (void (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v18 = (void (**)(char *, uint64_t))(v10 + 8);
  swift_retain();
  unsigned int v19 = v28;
  uint64_t v20 = v31;
  do
  {
    sub_24CA51F68(v15);
    uint64_t v21 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(unsigned int *, uint64_t, uint64_t))(v21 + 48))(v15, 1, v12) == 1) {
      break;
    }
    uint64_t v22 = *v15;
    uint64_t v23 = *((void *)v15 + 1);
    (*v27)(v19, (char *)v15 + *(int *)(v12 + 40), v20);
    (*(void (**)(unsigned int *, uint64_t))(v21 + 8))(v15, v12);
    char v24 = v29(v22, v23, v19);
    (*v18)(v19, v20);
    if (v6) {
      break;
    }
  }
  while ((v24 & 1) != 0);
  swift_release();
  return swift_release();
}

void DataFrameStream.message<A>(forIdentifier:)(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  DataFrameStream.frameData(forIdentifier:)(a1);
  if (!v4)
  {
    unint64_t v10 = v9;
    if (v9 >> 60 == 15)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a4, 1, 1, a2);
    }
    else
    {
      uint64_t v11 = v8;
      (*(void (**)(void))(a3 + 16))();
      sub_24CA51D8C(v11, v10);
    }
  }
}

void DataFrameStream.mutateMessage<A, B>(forIdentifier:_:)(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  v8[2] = a4;
  v8[3] = a5;
  v8[4] = a6;
  v8[5] = a7;
  v8[6] = a2;
  v8[7] = a3;
  DataFrameStream.mutateFrame(forIdentifier:_:)(a1, (uint64_t (*)(void))sub_24CA7AAC0, (uint64_t)v8, a8);
}

uint64_t sub_24CA7A884(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v26 = a3;
  uint64_t v27 = a8;
  uint64_t v28 = a6;
  uint64_t v24 = *(void *)(a6 - 8);
  uint64_t v25 = a4;
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24CA86520();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v22 - v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 16))(a1, a2, a5, a7);
  if (!v8)
  {
    uint64_t v23 = v15;
    uint64_t v19 = v24;
    v26(v18);
    uint64_t v20 = v28;
    a5 = (*(uint64_t (**)(uint64_t))(v27 + 8))(v28);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v23);
  }
  return a5;
}

uint64_t sub_24CA7AAC0(uint64_t a1, uint64_t a2)
{
  return sub_24CA7A884(a1, a2, *(void (**)(char *))(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t DataFrameStream.prune<A>(ignoreConversionFailures:each:)(char a1, uint64_t (*a2)(uint64_t, uint64_t, char *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807A50);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = 0;
  *(unsigned char *)(inited + 16) = 1;
  type metadata accessor for DataFrameStream.Iterator();
  uint64_t v9 = swift_initStackObject();
  *(void *)(v9 + 32) = 0;
  uint64_t v22 = (uint64_t *)(v9 + 32);
  *(void *)(v9 + 40) = 0;
  *(void *)(v9 + 48) = 0;
  *(_DWORD *)(v9 + 56) = 0;
  *(void *)(v9 + 16) = v5;
  *(unsigned char *)(v9 + 24) = 0;
  *(void *)(inited + 24) = v9;
  swift_retain();
  swift_retain();
  uint64_t v21 = (void *)(inited + 32);
  swift_beginAccess();
  int v10 = a1 & 1;
  do
  {
    sub_24CA57684(&v26);
    unint64_t v11 = v28;
    if ((unint64_t)v28 >> 60 == 15) {
      break;
    }
    long long v12 = v27;
    unsigned int v13 = v26;
    uint64_t v14 = v26;
    sub_24CA497DC(*((uint64_t *)&v27 + 1), v28);
    __int16 v15 = sub_24CA7AE10(v13, v12, *((uint64_t *)&v12 + 1), v11, v10, a2, a3, a4, a5);
    sub_24CA52660(v14, v12, *((uint64_t *)&v12 + 1), v11);
    if (v15)
    {
      uint64_t v16 = *v22;
      if (*v22)
      {
        if (*(unsigned char *)(v16 + 80) != 1)
        {
          int v18 = *(_DWORD *)(v16 + 72);
          Swift::UInt32 v17 = *(_DWORD *)(v16 + 76);
          uint64_t v26 = *(void *)(v16 + 32);
          long long v19 = *(_OWORD *)(v16 + 56);
          long long v27 = *(_OWORD *)(v16 + 40);
          long long v28 = v19;
          int v29 = v18;
          if (DataFrameStreamSegment.deleteFrame(index:)(v17))
          {
            if (*v21 == -1)
            {
              __break(1u);
              break;
            }
            ++*v21;
          }
        }
      }
    }
    sub_24CA52660(v14, v12, *((uint64_t *)&v12 + 1), v11);
  }
  while ((v15 & 0x100) != 0);
  swift_release();
  return swift_release();
}

uint64_t sub_24CA7AE10(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t (*a6)(uint64_t, uint64_t, char *), uint64_t a7, uint64_t a8, uint64_t a9)
{
  v28[1] = a7;
  uint64_t v30 = a6;
  int v29 = a5;
  uint64_t v33 = a2;
  unsigned int v32 = a1;
  uint64_t v13 = sub_24CA86520();
  uint64_t v31 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v28 - v15;
  uint64_t v17 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](v14);
  long long v19 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 16))(a3, a4, a8, a9);
  if (!v9)
  {
    uint64_t v21 = v31;
    uint64_t v22 = v32;
    uint64_t v23 = v33;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, a8) == 1)
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v13);
      int v24 = 0;
      LOBYTE(v25) = v29;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v16, a8);
      unsigned int v26 = v30(v22, v23, v19);
      int v24 = v26 & 1;
      int v25 = (v26 >> 8) & 1;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, a8);
    }
    if (v25) {
      int v27 = 256;
    }
    else {
      int v27 = 0;
    }
    return v27 | v24;
  }
  return result;
}

uint64_t DataFrameStream.last<A>(ignoreConversionFailures:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24CA7B094(a1, a2, a3);
}

uint64_t DataFrameStream.first<A>(ignoreConversionFailures:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24CA7B094(a1, a2, a3);
}

uint64_t sub_24CA7B094@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  int v23 = a1;
  uint64_t v7 = type metadata accessor for DataFrameStreamTypedIterator.Element();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v21 = (char *)&v20 - v9;
  uint64_t v10 = sub_24CA86520();
  MEMORY[0x270FA5388](v10 - 8);
  long long v12 = (_DWORD *)((char *)&v20 - v11);
  uint64_t v13 = *(void *)(a2 - 8);
  uint64_t v14 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56);
  uint64_t v22 = a3;
  uint64_t v20 = v14;
  v14(a3, 1, 1, a2);
  type metadata accessor for DataFrameStreamTypedIterator();
  uint64_t v15 = DataFrameStreamTypedIterator.__allocating_init(stream:reversed:ignoreConversionErrors:)(v4, 1, v23);
  (*(void (**)(void))(*(void *)v15 + 120))();
  swift_retain();
  sub_24CA51F68(v12);
  swift_release();
  swift_release();
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7);
  if (result != 1)
  {
    uint64_t v17 = sub_24CA86520();
    uint64_t v18 = v22;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v22, v17);
    long long v19 = v21;
    (*(void (**)(char *, _DWORD *, uint64_t))(v8 + 32))(v21, v12, v7);
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v18, &v19[*(int *)(v7 + 40)], a2);
    return v20(v18, 0, 1, a2);
  }
  return result;
}

uint64_t static Device.firstUnlock()()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_269807CA0 + dword_269807CA0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_24CA4E148;
  return v3();
}

uint64_t sub_24CA7B3E8()
{
  sub_24CA7B948();
  uint64_t v0 = sub_24CA861D0();
  MEMORY[0x270FA5388](v0 - 8);
  sub_24CA861C0();
  uint64_t v1 = sub_24CA864A0();
  MEMORY[0x270FA5388](v1);
  (*(void (**)(char *, void))(v3 + 104))((char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F140]);
  uint64_t v4 = sub_24CA864C0();
  MEMORY[0x270FA5388](v4);
  v6[1] = MEMORY[0x263F8EE78];
  sub_24CA7B988();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807CB8);
  sub_24CA7B9D4();
  sub_24CA86560();
  uint64_t result = sub_24CA864D0();
  qword_26980A160 = result;
  return result;
}

uint64_t sub_24CA7B5DC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180BF8);
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 0;
  qword_26B181278 = result;
  return result;
}

uint64_t sub_24CA7B614()
{
  return MEMORY[0x270FA2498](sub_24CA7B630, 0, 0);
}

uint64_t sub_24CA7B630()
{
  if (qword_26B180C30 != -1) {
    swift_once();
  }
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)qword_26B181278 + 136);
  uint64_t v2 = swift_retain();
  LOBYTE(v1) = *(unsigned char *)v1(v2);
  swift_release();
  if (v1) {
    goto LABEL_6;
  }
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)qword_26B181278 + 136);
    uint64_t v4 = swift_retain();
    *(unsigned char *)v3(v4) = 1;
    swift_release();
LABEL_6:
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  if (qword_269807608 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_26980A160;
  type metadata accessor for FirstUnlockObserver();
  uint64_t v8 = swift_allocObject();
  v0[2] = v8;
  uint64_t v9 = MEMORY[0x263F8EE78];
  *(void *)(v8 + 32) = 0;
  *(void *)(v8 + 40) = 0;
  *(unsigned char *)(v8 + 48) = 0;
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v9;
  id v10 = v7;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[3] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24CA7B828;
  return sub_24CA6A6D8();
}

uint64_t sub_24CA7B828()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

ValueMetadata *type metadata accessor for Device()
{
  return &type metadata for Device;
}

unint64_t sub_24CA7B948()
{
  unint64_t result = qword_269807CA8;
  if (!qword_269807CA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269807CA8);
  }
  return result;
}

unint64_t sub_24CA7B988()
{
  unint64_t result = qword_269807CB0;
  if (!qword_269807CB0)
  {
    sub_24CA864C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807CB0);
  }
  return result;
}

unint64_t sub_24CA7B9D4()
{
  unint64_t result = qword_269807CC0;
  if (!qword_269807CC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269807CB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807CC0);
  }
  return result;
}

uint64_t sub_24CA7BA30()
{
  if (qword_26B1808C8 != -1) {
    swift_once();
  }
  uint64_t v1 = (uint64_t *)(qword_26B181238 + 16);
  uint64_t v2 = (os_unfair_lock_s *)(qword_26B181238 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  sub_24CA65A64(v1);
  os_unfair_lock_unlock(v2);
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC8Dendrite26GlobalFileLockRegistration_lockedURL;
  uint64_t v4 = sub_24CA86020();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_24CA7BB4C()
{
  return type metadata accessor for GlobalFileLockRegistration();
}

uint64_t type metadata accessor for GlobalFileLockRegistration()
{
  uint64_t result = qword_26B180A40;
  if (!qword_26B180A40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA7BBA0()
{
  uint64_t result = sub_24CA86020();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24CA7BC30()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B180AC0);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = MEMORY[0x263F8EE80];
  qword_26B181238 = result;
  return result;
}

void sub_24CA7BC74(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unsigned int v44 = a3;
  uint64_t v6 = sub_24CA86020();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v43 = a1;
  uint64_t v13 = *a1;
  if (*(void *)(v13 + 16) && (unint64_t v14 = sub_24CA75224(a2), (v15 & 1) != 0))
  {
    uint64_t v42 = v3;
    uint64_t v16 = *(void *)(v13 + 56) + 16 * v14;
    int v17 = *(_DWORD *)v16;
    uint64_t v18 = *(void *)(v16 + 8);
    long long v19 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v19(v9, a2, v6);
    if (v17 == -1)
    {
      __break(1u);
    }
    else
    {
      swift_retain_n();
      unsigned int v47 = v19;
      uint64_t v20 = v7;
      uint64_t v21 = v43;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v45 = *v21;
      *uint64_t v21 = 0x8000000000000000;
      sub_24CA64B54(v17 + 1, v18, (uint64_t)v9, isUniquelyReferenced_nonNull_native);
      *uint64_t v21 = v45;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v6);
      swift_release();
      v47(v9, a2, v6);
      type metadata accessor for GlobalFileLockRegistration();
      uint64_t v23 = swift_allocObject();
      (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v23 + OBJC_IVAR____TtC8Dendrite26GlobalFileLockRegistration_lockedURL, v9, v6);
LABEL_14:
      *unsigned int v44 = v23;
    }
  }
  else
  {
    unsigned int v47 = (void (*)(char *, uint64_t, uint64_t))a2;
    if (qword_26B180A70 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v10, (uint64_t)qword_26B181248);
    sub_24CA4CFB0(v24, (uint64_t)v12);
    uint64_t v45 = 0;
    unint64_t v46 = 0xE000000000000000;
    sub_24CA865B0();
    sub_24CA86320();
    sub_24CA7CD48((unint64_t *)&qword_26B180898);
    int v25 = v47;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA86320();
    sub_24CA5A168(v45, v46, 0xD000000000000058, 0x800000024CA8B3E0, 0x7265747369676572, 0xEE00293A726F6628);
    swift_bridgeObjectRelease();
    sub_24CA4D06C((uint64_t)v12);
    uint64_t v41 = *(void (**)(char *, void, uint64_t))(v7 + 16);
    v41(v9, v25, v6);
    type metadata accessor for FileLock();
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + OBJC_IVAR____TtC8Dendrite8FileLock_handle) = 0;
    uint64_t v27 = OBJC_IVAR____TtC8Dendrite8FileLock_fm;
    *(void *)(v26 + v27) = objc_msgSend(self, sel_defaultManager);
    uint64_t v28 = v26 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL;
    int v29 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
    v29(v26 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL, v9, v6);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v28, 0, 1, v6);
    uint64_t v30 = (void *)sub_24CA848C4();
    if (v3)
    {
      swift_release();
    }
    else
    {
      uint64_t v40 = v29;
      uint64_t v42 = 0;
      id v31 = v30;
      for (int i = objc_msgSend(v31, sel_fileDescriptor);
            ;
            int i = objc_msgSend(v31, sel_fileDescriptor))
      {
        if (!flock(i, 2))
        {

          uint64_t v33 = v47;
          v41(v9, v47, v6);
          swift_retain();
          uint64_t v34 = v7;
          unint64_t v35 = v43;
          char v36 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v45 = *v35;
          *unint64_t v35 = 0x8000000000000000;
          sub_24CA64B54(1, v26, (uint64_t)v9, v36);
          *unint64_t v35 = v45;
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v6);
          swift_release();
          v41(v9, v33, v6);
          type metadata accessor for GlobalFileLockRegistration();
          uint64_t v23 = swift_allocObject();
          v40(v23 + OBJC_IVAR____TtC8Dendrite26GlobalFileLockRegistration_lockedURL, v9, v6);
          goto LABEL_14;
        }
        if (MEMORY[0x253305E40]() == 4) {
          break;
        }
      }
      int v37 = MEMORY[0x253305E40]();
      sub_24CA7CD8C();
      swift_allocError();
      *(_DWORD *)uint64_t v38 = v37;
      *(unsigned char *)(v38 + 4) = 0;
      swift_willThrow();
      swift_release();
    }
  }
}

unint64_t sub_24CA7C274(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  if (*(void *)(*a1 + 16))
  {
    uint64_t v9 = a2 + OBJC_IVAR____TtC8Dendrite26GlobalFileLockRegistration_lockedURL;
    unint64_t result = sub_24CA75224(v9);
    if (v10)
    {
      uint64_t v11 = *(void *)(v8 + 56) + 16 * result;
      uint64_t v12 = *(void *)(v11 + 8);
      int v13 = *(_DWORD *)v11 - 1;
      if (*(_DWORD *)v11 == 1)
      {
        uint64_t v14 = qword_26B180A70;
        swift_retain();
        if (v14 != -1) {
          swift_once();
        }
        uint64_t v15 = __swift_project_value_buffer(v4, (uint64_t)qword_26B181248);
        sub_24CA4CFB0(v15, (uint64_t)v7);
        uint64_t v17 = 0;
        unint64_t v18 = 0xE000000000000000;
        sub_24CA865B0();
        swift_bridgeObjectRelease();
        uint64_t v17 = 0xD00000000000001FLL;
        unint64_t v18 = 0x800000024CA8B3C0;
        sub_24CA86020();
        sub_24CA7CD48((unint64_t *)&qword_26B180898);
        sub_24CA86680();
        sub_24CA86320();
        swift_bridgeObjectRelease();
        sub_24CA5A168(v17, v18, 0xD000000000000058, 0x800000024CA8B3E0, 0xD000000000000015, 0x800000024CA8B440);
        swift_bridgeObjectRelease();
        sub_24CA4D06C((uint64_t)v7);
        sub_24CA7C644(v9);
        swift_release();
        return swift_release();
      }
      else if (*(_DWORD *)v11)
      {
        swift_retain_n();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v17 = *a1;
        *a1 = 0x8000000000000000;
        sub_24CA64B54(v13, v12, v9, isUniquelyReferenced_nonNull_native);
        *a1 = v17;
        swift_release();
        return swift_bridgeObjectRelease();
      }
      else
      {
        __break(1u);
      }
    }
  }
  return result;
}

double sub_24CA7C4F8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24CA75224(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v15 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24CA64EA0();
      uint64_t v9 = v15;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_24CA86020();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56) + 48 * v6;
    int v13 = *(_DWORD *)(v12 + 40);
    *(void *)a2 = *(void *)v12;
    *(_OWORD *)(a2 + 8) = *(_OWORD *)(v12 + 8);
    *(_OWORD *)(a2 + 24) = *(_OWORD *)(v12 + 24);
    *(_DWORD *)(a2 + 40) = v13;
    sub_24CA7C754(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)(a2 + 28) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_24CA7C644(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_24CA75224(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24CA651D8();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_24CA86020();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(unsigned int *)(*(void *)(v7 + 56) + 16 * v4);
  sub_24CA7CA64(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_24CA7C754(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86020();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_24CA86570();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      int v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v38 = v14;
      uint64_t v16 = v15;
      do
      {
        uint64_t v17 = v9;
        uint64_t v18 = v16;
        int64_t v19 = v16 * v11;
        v38(v8, *(void *)(a2 + 48) + v16 * v11, v4);
        sub_24CA7CD48(&qword_26B180A18);
        uint64_t v20 = sub_24CA861F0();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v21 = v20 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v21 >= v39 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            uint64_t v24 = *(void *)(a2 + 48);
            uint64_t v16 = v18;
            unint64_t result = v24 + v18 * a1;
            if (v18 * a1 < v19 || result >= v24 + v19 + v18)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              uint64_t v9 = v17;
            }
            else
            {
              BOOL v25 = v18 * a1 == v19;
              uint64_t v9 = v17;
              if (!v25) {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
              }
            }
            uint64_t v26 = *(void *)(a2 + 56);
            uint64_t v27 = (long long *)(v26 + 48 * a1);
            uint64_t v28 = (long long *)(v26 + 48 * v11);
            if (48 * a1 < (uint64_t)(48 * v11) || v27 >= v28 + 3 || (BOOL v25 = a1 == v11, a1 = v11, !v25))
            {
              long long v29 = *v28;
              long long v30 = v28[2];
              v27[1] = v28[1];
              void v27[2] = v30;
              long long *v27 = v29;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v39 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v17;
        uint64_t v16 = v18;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    id v31 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v31;
    uint64_t v33 = (-1 << a1) - 1;
  }
  else
  {
    id v31 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v33 = *v31;
    uint64_t v32 = (-1 << a1) - 1;
  }
  uint64_t *v31 = v33 & v32;
  uint64_t v34 = *(void *)(a2 + 16);
  BOOL v35 = __OFSUB__(v34, 1);
  uint64_t v36 = v34 - 1;
  if (v35)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v36;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_24CA7CA64(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA86020();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_24CA86570();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_24CA7CD48(&qword_26B180A18);
        uint64_t v17 = sub_24CA861F0();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (_OWORD *)(v22 + 16 * a1);
            uint64_t v24 = (_OWORD *)(v22 + 16 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *uint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    BOOL v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *BOOL v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24CA7CD48(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24CA86020();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24CA7CD8C()
{
  unint64_t result = qword_269807CC8;
  if (!qword_269807CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807CC8);
  }
  return result;
}

uint64_t MemoryMappedRegion.__allocating_init(filePath:requestedByteSize:minimumByteSize:access:)(uint64_t a1, int a2, int a3, unsigned char *a4)
{
  uint64_t v8 = swift_allocObject();
  MemoryMappedRegion.init(filePath:requestedByteSize:minimumByteSize:access:)(a1, a2, a3, a4);
  return v8;
}

uint64_t MemoryMappedRegion.write<A>(structInstance:at:)(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a3 - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = a2 + v13;
  if (__OFADD__(a2, v13))
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v14 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  BOOL v16 = v4 <= a2 && v5 >= a2;
  if (v14 < v4 || v5 < v14 || !v16)
  {
    if (qword_26B180878 == -1)
    {
LABEL_19:
      uint64_t v20 = __swift_project_value_buffer(v9, (uint64_t)qword_26B181220);
      sub_24CA4CFB0(v20, (uint64_t)v11);
      uint64_t v23 = 0;
      unint64_t v24 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      uint64_t v23 = 0xD000000000000011;
      unint64_t v24 = 0x800000024CA8AAB0;
      void v22[2] = v5;
      v22[3] = v4;
      v22[0] = 0;
      v22[1] = 0xE000000000000000;
      sub_24CA865E0();
      sub_24CA86320();
      sub_24CA865E0();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA5A180(v23, v24, 0xD00000000000005FLL, 0x800000024CA8AAD0, 0xD000000000000019, 0x800000024CA8AB30);
      swift_bridgeObjectRelease();
      sub_24CA4D06C((uint64_t)v11);
      return 0;
    }
LABEL_24:
    swift_once();
    goto LABEL_19;
  }
  size_t v19 = *(void *)(v12 + 64);
  if ((v19 & 0x8000000000000000) != 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  memcpy((void *)(v3[2] + a2), a1, v19);
  return v14;
}

uint64_t MemoryMappedRegion.write(data:at:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v9 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        sub_24CA85F20();
        __break(1u);
LABEL_48:
        sub_24CA85F20();
        __break(1u);
LABEL_49:
        sub_24CA86630();
        __break(1u);
        JUMPOUT(0x24CA7D54CLL);
      }
      uint64_t v12 = (int)v12;
LABEL_6:
      uint64_t v16 = a3 + v12;
      if (__OFADD__(a3, v12))
      {
        __break(1u);
        goto LABEL_38;
      }
      if (v16 < a3)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
      uint64_t v4 = v3[3];
      uint64_t v5 = v3[4];
      BOOL v18 = v4 <= a3 && v5 >= a3;
      if (v16 < v4 || v5 < v16 || !v18)
      {
        if (qword_26B180878 == -1)
        {
LABEL_24:
          uint64_t v22 = __swift_project_value_buffer(v9, (uint64_t)qword_26B181220);
          sub_24CA4CFB0(v22, (uint64_t)v11);
          uint64_t __src = 0;
          unint64_t v39 = 0xE000000000000000;
          sub_24CA865B0();
          swift_bridgeObjectRelease();
          uint64_t __src = 0xD000000000000011;
          unint64_t v39 = 0x800000024CA8AAB0;
          v37[2] = v5;
          v37[3] = v4;
          v37[0] = 0;
          v37[1] = 0xE000000000000000;
          sub_24CA865E0();
          sub_24CA86320();
          sub_24CA865E0();
          sub_24CA86320();
          swift_bridgeObjectRelease();
          sub_24CA5A180(__src, v39, 0xD00000000000005FLL, 0x800000024CA8AAD0, 0x6164286574697277, 0xEF293A74613A6174);
          swift_bridgeObjectRelease();
          sub_24CA4D06C((uint64_t)v11);
          return 0;
        }
LABEL_39:
        swift_once();
        goto LABEL_24;
      }
      uint64_t v21 = (void *)(v3[2] + a3);
      switch(a2 >> 62)
      {
        case 1uLL:
          if ((int)a1 > a1 >> 32) {
            goto LABEL_42;
          }
          sub_24CA497DC(a1, a2);
          uint64_t v24 = sub_24CA85F00();
          if (!v24) {
            goto LABEL_48;
          }
          uint64_t v25 = v24;
          uint64_t v26 = sub_24CA85F30();
          uint64_t v27 = (int)a1 - v26;
          if (__OFSUB__((int)a1, v26)) {
            goto LABEL_44;
          }
          sub_24CA85F20();
          size_t v28 = (HIDWORD(a1) - a1);
          if (__OFSUB__(HIDWORD(a1), a1)) {
            goto LABEL_46;
          }
          if ((v28 & 0x80000000) != 0) {
            goto LABEL_49;
          }
          memmove(v21, (const void *)(v25 + v27), v28);
          sub_24CA4986C(a1, a2);
          break;
        case 2uLL:
          uint64_t v29 = *(void *)(a1 + 16);
          swift_retain();
          swift_retain();
          uint64_t v30 = sub_24CA85F00();
          if (!v30) {
            goto LABEL_47;
          }
          uint64_t v31 = v30;
          uint64_t v32 = sub_24CA85F30();
          BOOL v15 = __OFSUB__(v29, v32);
          uint64_t v33 = v29 - v32;
          if (v15) {
            goto LABEL_43;
          }
          sub_24CA85F20();
          uint64_t v35 = *(void *)(a1 + 16);
          uint64_t v34 = *(void *)(a1 + 24);
          size_t v36 = v34 - v35;
          if (__OFSUB__(v34, v35)) {
            goto LABEL_45;
          }
          if ((v36 & 0x8000000000000000) != 0) {
            goto LABEL_49;
          }
          memmove(v21, (const void *)(v31 + v33), v36);
          swift_release();
          swift_release();
          return v16;
        case 3uLL:
          return v16;
        default:
          uint64_t __src = a1;
          LOWORD(v39) = a2;
          BYTE2(v39) = BYTE2(a2);
          BYTE3(v39) = BYTE3(a2);
          BYTE4(v39) = BYTE4(a2);
          BYTE5(v39) = BYTE5(a2);
          memcpy(v21, &__src, BYTE6(a2));
          return v16;
      }
      return v16;
    case 2uLL:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      BOOL v15 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v15) {
        goto LABEL_6;
      }
      goto LABEL_41;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v12 = BYTE6(a2);
      goto LABEL_6;
  }
}

Swift::Void __swiftcall MemoryMappedRegion.sync(used:)(Swift::Int used)
{
  uint64_t v3 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = msync(*(void **)(v1 + 16), used, 1);
  if (v6)
  {
    int v7 = v6;
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_26B181220);
    sub_24CA4CFB0(v8, (uint64_t)v5);
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_24CA865B0();
    swift_bridgeObjectRelease();
    strcpy((char *)v12, "msync return: ");
    HIBYTE(v12[1]) = -18;
    int v11 = v7;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_24CA86320();
    int v11 = MEMORY[0x253305E40](v9);
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA5A180(v12[0], v12[1], 0xD00000000000005FLL, 0x800000024CA8AAD0, 0x65737528636E7973, 0xEB00000000293A64);
    swift_bridgeObjectRelease();
    sub_24CA4D06C((uint64_t)v5);
  }
}

uint64_t MemoryMappedRegion.init(filePath:requestedByteSize:minimumByteSize:access:)(uint64_t a1, int a2, int a3, unsigned char *a4)
{
  int v6 = v4;
  uint64_t v74 = *v6;
  uint64_t v11 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (char)*a4;
  LOBYTE(v78) = *a4;
  id v15 = sub_24CA762D8(a1, &v78);
  if (v5)
  {
LABEL_21:
    uint64_t v26 = sub_24CA86020();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(a1, v26);
LABEL_22:
    swift_deallocPartialClassInstance();
    return (uint64_t)v6;
  }
  uint64_t v16 = v15;
  LODWORD(v73) = a2;
  LODWORD(v72) = a3;
  if (!v15)
  {
LABEL_18:
    if (qword_26B180878 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v11, (uint64_t)qword_26B181220);
    sub_24CA5A180(0xD000000000000019, 0x800000024CA8AEF0, 0xD00000000000005FLL, 0x800000024CA8AAD0, 0xD000000000000038, 0x800000024CA8B4B0);
    sub_24CA7EBF4();
    swift_allocError();
    *(_DWORD *)uint64_t v25 = 0;
    *(unsigned char *)(v25 + 4) = 1;
    swift_willThrow();
    goto LABEL_21;
  }
  sub_24CA763A4();
  if (v18)
  {

    goto LABEL_18;
  }
  uint64_t v19 = v17;
  NSUInteger v20 = NSRoundUpToMultipleOfPageSize(v73);
  if ((v20 & 0x8000000000000000) == 0 && !HIDWORD(v20))
  {
    id v71 = v16;
    if (v19)
    {
      if (v19 >= v20)
      {
LABEL_13:
        if (v20 >= v72)
        {
          v6[3] = 0;
          v6[4] = v20;
          size_t v73 = v20;
          if (qword_26B180878 != -1) {
            swift_once();
          }
          uint64_t v72 = __swift_project_value_buffer(v11, (uint64_t)qword_26B181220);
          sub_24CA4CFB0(v72, (uint64_t)v13);
          uint64_t v78 = 0;
          unint64_t v79 = 0xE000000000000000;
          sub_24CA865B0();
          swift_bridgeObjectRelease();
          uint64_t v78 = 0xD000000000000016;
          unint64_t v79 = 0x800000024CA8B4F0;
          LODWORD(v75) = objc_msgSend(v71, sel_fileDescriptor);
          sub_24CA86680();
          sub_24CA86320();
          swift_bridgeObjectRelease();
          sub_24CA86320();
          uint64_t v39 = v6[4];
          uint64_t v80 = v6[3];
          unint64_t v76 = 0xE000000000000000;
          uint64_t v77 = v39;
          uint64_t v75 = 0;
          sub_24CA865E0();
          sub_24CA86320();
          sub_24CA865E0();
          sub_24CA86320();
          swift_bridgeObjectRelease();
          id v69 = (id)0x800000024CA8AAD0;
          uint64_t v70 = 0xD00000000000005FLL;
          sub_24CA5A168(v78, v79, 0xD00000000000005FLL, 0x800000024CA8AAD0, 0xD000000000000038, 0x800000024CA8B4B0);
          swift_bridgeObjectRelease();
          sub_24CA4D06C((uint64_t)v13);
          int v40 = dword_24CA88DAC[v14];
          int v41 = objc_msgSend(v71, sel_fileDescriptor);
          uint64_t v42 = mmap(0, v73, v40, 1, v41, 0);
          if (v42)
          {
            unsigned int v43 = v42;
            uint64_t v44 = sub_24CA86180();
            if (!v44 || v43 != (void *)v44)
            {

              uint64_t v50 = sub_24CA86020();
              (*(void (**)(uint64_t, uint64_t))(*(void *)(v50 - 8) + 8))(a1, v50);
              void v6[2] = (uint64_t)v43;
              return (uint64_t)v6;
            }
          }
          LODWORD(v78) = MEMORY[0x253305E40]();
          uint64_t v45 = sub_24CA86680();
          sub_24CA5A180(v45, v46, v70, (uint64_t)v69, 0xD000000000000038, 0x800000024CA8B4B0);
          uint64_t v47 = swift_bridgeObjectRelease();
          int v48 = MEMORY[0x253305E40](v47);
          sub_24CA7EBF4();
          swift_allocError();
          *(_DWORD *)uint64_t v49 = v48;
          *(unsigned char *)(v49 + 4) = 0;
        }
        else
        {
          int v22 = v20;
          if (qword_26B180878 != -1) {
            swift_once();
          }
          uint64_t v23 = __swift_project_value_buffer(v11, (uint64_t)qword_26B181220);
          sub_24CA4CFB0(v23, (uint64_t)v13);
          uint64_t v78 = 0;
          unint64_t v79 = 0xE000000000000000;
          sub_24CA865B0();
          sub_24CA86320();
          LODWORD(v75) = v22;
          sub_24CA86680();
          sub_24CA86320();
          swift_bridgeObjectRelease();
          sub_24CA86320();
          LODWORD(v75) = v73;
          sub_24CA86680();
          sub_24CA86320();
          swift_bridgeObjectRelease();
          sub_24CA86320();
          LODWORD(v75) = v72;
          sub_24CA86680();
          sub_24CA86320();
          swift_bridgeObjectRelease();
          sub_24CA5A168(v78, v79, 0xD00000000000005FLL, 0x800000024CA8AAD0, 0xD000000000000038, 0x800000024CA8B4B0);
          swift_bridgeObjectRelease();
          sub_24CA4D06C((uint64_t)v13);
          sub_24CA7EBF4();
          swift_allocError();
          *(_DWORD *)uint64_t v24 = 1;
          *(unsigned char *)(v24 + 4) = 1;
        }
        swift_willThrow();

        goto LABEL_21;
      }
    }
    else
    {
      NSUInteger v67 = v20;
      type metadata accessor for FileLock();
      size_t v28 = v16;
      uint64_t v29 = swift_allocObject();
      uint64_t v30 = OBJC_IVAR____TtC8Dendrite8FileLock_handle;
      *(void *)(v29 + OBJC_IVAR____TtC8Dendrite8FileLock_handle) = 0;
      uint64_t v70 = OBJC_IVAR____TtC8Dendrite8FileLock_fm;
      id v69 = self;
      id v68 = v28;
      id v31 = objc_msgSend(v69, sel_defaultManager);
      *(void *)(v29 + v70) = v31;
      uint64_t v32 = *(void **)(v29 + v30);
      *(void *)(v29 + v30) = v28;

      uint64_t v33 = v29 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL;
      uint64_t v34 = (void *)sub_24CA86020();
      uint64_t v35 = *(v34 - 1);
      size_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 56);
      id v69 = v34;
      v36(v33, 1, 1);
      uint64_t v70 = v29;
      id v37 = (id)sub_24CA848C4();
      for (int i = objc_msgSend(v37, sel_fileDescriptor);
            flock(i, 2);
            int i = objc_msgSend(v37, sel_fileDescriptor))
      {
        if (MEMORY[0x253305E40]() == 4)
        {
          int v53 = MEMORY[0x253305E40]();
          sub_24CA7CD8C();
          swift_allocError();
          *(_DWORD *)uint64_t v54 = v53;
          *(unsigned char *)(v54 + 4) = 0;
          swift_willThrow();

          (*(void (**)(uint64_t, id))(v35 + 8))(a1, v69);
          uint64_t v55 = v70;
          swift_setDeallocating();
          id v56 = (id)sub_24CA848C4();
          flock((int)objc_msgSend(v56, sel_fileDescriptor), 8);

          sub_24CA4D98C(v55 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL);
          swift_deallocClassInstance();
          goto LABEL_22;
        }
      }

      sub_24CA763A4();
      if (v52)
      {
        sub_24CA7EBF4();
        swift_allocError();
        *(_DWORD *)uint64_t v58 = 0;
        *(unsigned char *)(v58 + 4) = 1;
        swift_willThrow();
        uint64_t v59 = v70;
        swift_setDeallocating();
        id v61 = (id)sub_24CA848C4();
        flock((int)objc_msgSend(v61, sel_fileDescriptor), 8);

        uint64_t v62 = v68;
        id v63 = v69;
        sub_24CA4D98C(v59 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL);

        swift_deallocClassInstance();
        (*(void (**)(uint64_t, id))(v35 + 8))(a1, v63);
        goto LABEL_22;
      }
      if (v51)
      {
        uint64_t v66 = v51;
      }
      else
      {
        unsigned int v60 = v67;
        sub_24CA76608(v68, v67);
        uint64_t v66 = v60;
      }
      uint64_t v57 = v70;
      id v64 = (id)sub_24CA848C4();
      flock((int)objc_msgSend(v64, sel_fileDescriptor), 8);

      swift_setDeallocating();
      id v65 = (id)sub_24CA848C4();
      flock((int)objc_msgSend(v65, sel_fileDescriptor), 8);

      sub_24CA4D98C(v57 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL);
      swift_deallocClassInstance();
      uint64_t v19 = v66;
      LODWORD(v20) = v67;
      if (v66 >= v67) {
        goto LABEL_13;
      }
    }
    if (qword_26B180878 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer(v11, (uint64_t)qword_26B181220);
    sub_24CA4CFB0(v21, (uint64_t)v13);
    uint64_t v78 = 0;
    unint64_t v79 = 0xE000000000000000;
    sub_24CA865B0();
    sub_24CA86320();
    LODWORD(v75) = v73;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA86320();
    uint64_t v75 = v19;
    sub_24CA86680();
    sub_24CA86320();
    swift_bridgeObjectRelease();
    sub_24CA5A168(v78, v79, 0xD00000000000005FLL, 0x800000024CA8AAD0, 0xD000000000000038, 0x800000024CA8B4B0);
    swift_bridgeObjectRelease();
    sub_24CA4D06C((uint64_t)v13);
    if ((v19 & 0x8000000000000000) == 0 && !HIDWORD(v19))
    {
      LODWORD(v20) = v19;
      goto LABEL_13;
    }
  }
  uint64_t result = sub_24CA865F0();
  __break(1u);
  return result;
}

uint64_t MemoryMappedRegion.read(at:count:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24CA86050();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__OFADD__(a1, a2))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v10 = v2[3];
  uint64_t v11 = v2[4];
  BOOL v12 = __OFSUB__(v11, v10);
  uint64_t v13 = v11 - v10;
  if (v12)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (a1 + a2 >= v13) {
    return 0;
  }
  uint64_t v14 = v2[2] + a1;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x263F06F00], v5);
  sub_24CA86040();
  if (a2)
  {
    sub_24CA85F40();
    swift_allocObject();
    swift_retain();
    uint64_t v15 = sub_24CA85EE0();
    uint64_t v16 = sub_24CA7EC48(v15, a2);
    swift_release();
  }
  else
  {
    uint64_t v17 = (void (*)(uint64_t, void))sub_24CA86040();
    v17(v14, 0);
    swift_release();
    swift_release();
    uint64_t v16 = 0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v16;
}

uint64_t MemoryMappedRegion.deinit()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(v2 + 32);
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_7;
  }
  int v8 = munmap(*(void **)(v2 + 16), v7 - v6);
  if (v8)
  {
    int v1 = v8;
    if (qword_26B180878 == -1)
    {
LABEL_4:
      uint64_t v9 = __swift_project_value_buffer(v3, (uint64_t)qword_26B181220);
      sub_24CA4CFB0(v9, (uint64_t)v5);
      uint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
      sub_24CA865B0();
      swift_bridgeObjectRelease();
      uint64_t v14 = 0x722070616D6E756DLL;
      unint64_t v15 = 0xEF203A6E72757465;
      int v13 = v1;
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_24CA86320();
      int v13 = MEMORY[0x253305E40](v10);
      sub_24CA86680();
      sub_24CA86320();
      swift_bridgeObjectRelease();
      sub_24CA5A180(v14, v15, 0xD00000000000005FLL, 0x800000024CA8AAD0, 0x74696E696564, 0xE600000000000000);
      swift_bridgeObjectRelease();
      sub_24CA4D06C((uint64_t)v5);
      return v2;
    }
LABEL_7:
    swift_once();
    goto LABEL_4;
  }
  return v2;
}

uint64_t MemoryMappedRegion.__deallocating_deinit()
{
  MemoryMappedRegion.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24CA7EB30(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

unint64_t sub_24CA7EBF4()
{
  unint64_t result = qword_269807CD0;
  if (!qword_269807CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807CD0);
  }
  return result;
}

uint64_t sub_24CA7EC48(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF) {
      return a2 << 32;
    }
    sub_24CA86070();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = (unsigned char *)sub_24CA85F00();
    if (!v4)
    {
LABEL_10:
      uint64_t v5 = sub_24CA85F20();
      if (v5 >= a2) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = v5;
      }
      uint64_t v7 = &v4[v6];
      if (v4) {
        int v8 = v7;
      }
      else {
        int v8 = 0;
      }
      uint64_t v3 = sub_24CA7EB30(v4, v8);
      swift_release();
      return v3;
    }
    unint64_t result = sub_24CA85F30();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for MemoryMappingError()
{
  return &type metadata for MemoryMappingError;
}

uint64_t type metadata accessor for MemoryMappedRegion()
{
  return self;
}

uint64_t method lookup function for MemoryMappedRegion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MemoryMappedRegion);
}

uint64_t dispatch thunk of MemoryMappedRegion.__allocating_init(filePath:requestedByteSize:minimumByteSize:access:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void *sub_24CA7EDA4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CA7EEB4(a1, a2, a3, (void *(*)(uint64_t *__return_ptr))sub_24CA57684);
}

uint64_t sub_24CA7EDBC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  type metadata accessor for DataFrameStream.Iterator();
  uint64_t result = swift_allocObject();
  uint64_t v9 = result;
  uint64_t v10 = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 48) = 0;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 56) = 0;
  *(void *)(result + 16) = v4;
  *(unsigned char *)(result + 24) = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *a1 = v9;
    return v10;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_24CA57684(&v13);
    unint64_t v11 = v15;
    if (v15 >> 60 == 15)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      while (1)
      {
        long long v12 = v14;
        *(_DWORD *)a2 = v13;
        *(_OWORD *)(a2 + 8) = v12;
        *(void *)(a2 + 24) = v11;
        if (a3 - 1 == v10) {
          break;
        }
        sub_24CA57684(&v13);
        unint64_t v11 = v15;
        a2 += 32;
        ++v10;
        if (v15 >> 60 == 15) {
          goto LABEL_11;
        }
      }
      uint64_t v10 = a3;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

void *sub_24CA7EEB4(void *result, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr))
{
  uint64_t v5 = result;
  uint64_t v6 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *uint64_t v5 = v4;
    return (void *)v6;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = a2;
    uint64_t v10 = a4(&v13);
    unint64_t v11 = v15;
    if (v15 >> 60 == 15)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      while (1)
      {
        long long v12 = v14;
        *(_DWORD *)uint64_t v9 = v13;
        *(_OWORD *)(v9 + 8) = v12;
        *(void *)(v9 + 24) = v11;
        if (a3 - 1 == v6) {
          break;
        }
        uint64_t v10 = ((void *(*)(uint64_t *__return_ptr, void *))a4)(&v13, v10);
        unint64_t v11 = v15;
        v9 += 32;
        ++v6;
        if (v15 >> 60 == 15) {
          goto LABEL_11;
        }
      }
      uint64_t v6 = a3;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

void sub_24CA7EF90(void *a1@<X8>)
{
  int v26 = *(_DWORD *)(*(void *)(*(void *)(v1 + 56) + 16) + 16);
  if (v26)
  {
    uint64_t v2 = v1;
    uint64_t v3 = 0;
    int v27 = *(unsigned __int8 *)(v1 + 16);
LABEL_4:
    unint64_t v4 = 0xF000000000000000;
    do
    {
      if (v27)
      {
        int v5 = v26;
        if ((*(unsigned char *)(v2 + 80) & 1) == 0)
        {
          int v5 = *(_DWORD *)(v2 + 76);
          if (!v5) {
            goto LABEL_19;
          }
        }
        unint64_t v6 = (v5 - 1);
        *(_DWORD *)(v2 + 76) = v6;
        *(unsigned char *)(v2 + 80) = 0;
      }
      else
      {
        if (*(unsigned char *)(v2 + 80))
        {
          unint64_t v6 = 0;
        }
        else
        {
          int v7 = *(_DWORD *)(v2 + 76);
          unint64_t v6 = (v7 + 1);
          if (v7 == -1) {
            goto LABEL_25;
          }
        }
        *(_DWORD *)(v2 + 76) = v6;
        *(unsigned char *)(v2 + 80) = 0;
        if (v6 >= *(_DWORD *)(*(void *)(*(void *)(v2 + 56) + 16) + 16))
        {
LABEL_19:
          uint64_t v19 = v3;
          unint64_t v20 = v4;
          goto LABEL_20;
        }
      }
      uint64_t v8 = *(void *)(v2 + 64);
      unsigned int v9 = *(_DWORD *)(*(void *)(*(void *)(v2 + 56) + 16) + 16);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      if (v6 >= v9) {
        goto LABEL_3;
      }
      uint64_t v10 = 8 * v6 + 8;
      uint64_t v11 = *(void *)(v8 + 16);
      uint64_t v12 = *(void *)(v11 + 32);
      BOOL v13 = __OFSUB__(v12, v10);
      uint64_t v14 = v12 - v10;
      if (v13)
      {
        __break(1u);
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
      int v15 = atomic_load((unsigned __int8 *)(*(void *)(v11 + 16) + v14 + 4));
      if (v15 != 2)
      {
LABEL_3:
        sub_24CA51D8C(v3, v4);
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v3 = 0;
        goto LABEL_4;
      }
      uint64_t v16 = DataFrameStreamSegment.frameData(forSegmentIndex:)((void *)v6);
      unint64_t v18 = v17;
      sub_24CA51D8C(v3, v4);
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v3 = v16;
      unint64_t v4 = v18;
    }
    while (v18 >> 60 == 15);
    if (*(unsigned char *)(v2 + 80))
    {
      uint64_t v19 = v16;
      unint64_t v20 = v18;
LABEL_20:
      sub_24CA51D8C(v19, v20);
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
      a1[3] = 0xF000000000000000;
      return;
    }
    uint64_t v21 = *(unsigned int *)(v2 + 76);
    uint64_t v22 = *(void *)(v2 + 24);
    BOOL v23 = __CFADD__(v22, v21);
    uint64_t v24 = v22 + v21;
    if (!v23)
    {
      *a1 = v21;
      a1[1] = v24;
      a1[2] = v16;
      a1[3] = v18;
      return;
    }
LABEL_26:
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    a1[3] = 0xF000000000000000;
  }
}

uint64_t DataFrameStreamSegment.Iterator.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DataFrameStreamSegment.Iterator.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void *sub_24CA7F294()
{
  uint64_t v1 = sub_24CA7F840(*v0, (void *(*)(uint64_t *__return_ptr, uint64_t))sub_24CA7EF90, &qword_269807CE0);
  swift_release();
  return v1;
}

void *sub_24CA7F2E8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CA7EEB4(a1, a2, a3, (void *(*)(uint64_t *__return_ptr))sub_24CA7EF90);
}

uint64_t sub_24CA7F320()
{
  return sub_24CA863E0();
}

void sub_24CA7F388(void *a1@<X8>)
{
}

uint64_t DataFrameStreamSegment.makeIterator()()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  int v6 = *((_DWORD *)v0 + 10);
  type metadata accessor for DataFrameStreamSegment.Iterator();
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 72) = v6;
  *(_DWORD *)(v7 + 76) = 0;
  *(unsigned char *)(v7 + 80) = 1;
  *(void *)(v7 + 24) = *(void *)(*(void *)(v4 + 16) + 24);
  *(void *)(v7 + 32) = v2;
  *(void *)(v7 + 40) = v1;
  *(void *)(v7 + 48) = v3;
  *(void *)(v7 + 56) = v4;
  *(void *)(v7 + 64) = v5;
  *(unsigned char *)(v7 + 16) = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return v7;
}

uint64_t type metadata accessor for DataFrameStreamSegment.Iterator()
{
  return self;
}

unint64_t sub_24CA7F474()
{
  unint64_t result = qword_269807CD8;
  if (!qword_269807CD8)
  {
    type metadata accessor for DataFrameStreamSegment.Iterator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807CD8);
  }
  return result;
}

__n128 sub_24CA7F4C8@<Q0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  int v4 = *((_DWORD *)v1 + 10);
  type metadata accessor for DataFrameStreamSegment.Iterator();
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 76) = 0;
  *(unsigned char *)(v5 + 80) = 1;
  __n128 result = *(__n128 *)(v1 + 1);
  long long v7 = *(_OWORD *)(v1 + 3);
  *(void *)(v5 + 24) = *(void *)(*(void *)(v1[3] + 16) + 24);
  *(void *)(v5 + 32) = v3;
  *(__n128 *)(v5 + 40) = result;
  *(_OWORD *)(v5 + 56) = v7;
  *(_DWORD *)(v5 + 72) = v4;
  *(unsigned char *)(v5 + 16) = 0;
  *a1 = v5;
  return result;
}

uint64_t sub_24CA7F540()
{
  long long v1 = v0[1];
  long long v5 = *v0;
  v6[0] = v1;
  *(_OWORD *)((char *)v6 + 12) = *(long long *)((char *)v0 + 28);
  sub_24CA7F9EC((uint64_t)&v5);
  uint64_t v3 = v2;
  sub_24CA5355C((uint64_t)&v5);
  return v3;
}

uint64_t sub_24CA7F58C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CA7FBD0(a1, a2, a3);
}

uint64_t method lookup function for DataFrameStreamSegment.Iterator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DataFrameStreamSegment.Iterator);
}

uint64_t dispatch thunk of DataFrameStreamSegment.Iterator.makeIterator()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of DataFrameStreamSegment.Iterator.next()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

ValueMetadata *type metadata accessor for DataFrameStreamSegment.Iterator.Element()
{
  return &type metadata for DataFrameStreamSegment.Iterator.Element;
}

void *sub_24CA7F638(uint64_t a1)
{
  return sub_24CA7F840(a1, (void *(*)(uint64_t *__return_ptr, uint64_t))sub_24CA57684, &qword_269807CE8);
}

uint64_t sub_24CA7F658(uint64_t a1)
{
  type metadata accessor for DataFrameStream.Iterator();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 40) = 0;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 32) = 0;
  *(_DWORD *)(inited + 56) = 0;
  *(void *)(inited + 16) = a1;
  *(unsigned char *)(inited + 24) = 0;
  swift_retain();
  uint64_t result = sub_24CA57684(&v25);
  unint64_t v4 = v27;
  long long v5 = (void *)MEMORY[0x263F8EE78];
  if (v27 >> 60 == 15)
  {
    uint64_t v6 = 0;
LABEL_22:
    swift_setDeallocating();
    swift_release();
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v21 = v5[3];
    if (v21 < 2) {
      return (uint64_t)v5;
    }
    unint64_t v22 = v21 >> 1;
    BOOL v20 = __OFSUB__(v22, v6);
    uint64_t v23 = v22 - v6;
    if (!v20)
    {
      id v5[2] = v23;
      return (uint64_t)v5;
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = MEMORY[0x263F8EE78] + 32;
    long long v8 = v26;
    while (1)
    {
      int v9 = v25;
      if (!v6)
      {
        unint64_t v10 = v5[3];
        if ((uint64_t)((v10 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_27;
        }
        long long v24 = v8;
        int64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
        if (v11 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v11;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269807CE8);
        BOOL v13 = (void *)swift_allocObject();
        int64_t v14 = _swift_stdlib_malloc_size(v13);
        uint64_t v15 = v14 - 32;
        if (v14 < 32) {
          uint64_t v15 = v14 - 1;
        }
        uint64_t v16 = v15 >> 5;
        v13[2] = v12;
        v13[3] = 2 * (v15 >> 5);
        unint64_t v17 = (unint64_t)(v13 + 4);
        uint64_t v18 = v5[3] >> 1;
        if (v5[2])
        {
          if (v13 != v5 || v17 >= (unint64_t)&v5[4 * v18 + 4]) {
            memmove(v13 + 4, v5 + 4, 32 * v18);
          }
          id v5[2] = 0;
        }
        uint64_t v7 = v17 + 32 * v18;
        uint64_t v6 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - v18;
        uint64_t result = swift_release();
        long long v5 = v13;
        long long v8 = v24;
      }
      BOOL v20 = __OFSUB__(v6--, 1);
      if (v20) {
        break;
      }
      *(_DWORD *)uint64_t v7 = v9;
      *(void *)(v7 + 24) = v4;
      *(_OWORD *)(v7 + 8) = v8;
      uint64_t result = sub_24CA57684(&v25);
      long long v8 = v26;
      unint64_t v4 = v27;
      v7 += 32;
      if (v27 >> 60 == 15) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_24CA7F840(uint64_t a1, void *(*a2)(uint64_t *__return_ptr, uint64_t), uint64_t *a3)
{
  uint64_t v4 = swift_retain();
  uint64_t result = a2(&v28, v4);
  unint64_t v6 = v30;
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  if (v30 >> 60 == 15)
  {
    uint64_t v8 = 0;
LABEL_22:
    uint64_t result = (void *)swift_release();
    unint64_t v23 = v7[3];
    if (v23 < 2) {
      return v7;
    }
    unint64_t v24 = v23 >> 1;
    BOOL v22 = __OFSUB__(v24, v8);
    uint64_t v25 = v24 - v8;
    if (!v22)
    {
      void v7[2] = v25;
      return v7;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x263F8EE78] + 32;
    long long v10 = v29;
    while (1)
    {
      int v11 = v28;
      if (!v8)
      {
        unint64_t v12 = v7[3];
        if ((uint64_t)((v12 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_27;
        }
        long long v27 = v10;
        int64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
        if (v13 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v13;
        }
        __swift_instantiateConcreteTypeFromMangledName(a3);
        uint64_t v15 = (void *)swift_allocObject();
        int64_t v16 = _swift_stdlib_malloc_size(v15);
        uint64_t v17 = v16 - 32;
        if (v16 < 32) {
          uint64_t v17 = v16 - 1;
        }
        uint64_t v18 = v17 >> 5;
        v15[2] = v14;
        v15[3] = 2 * (v17 >> 5);
        unint64_t v19 = (unint64_t)(v15 + 4);
        uint64_t v20 = v7[3] >> 1;
        if (v7[2])
        {
          if (v15 != v7 || v19 >= (unint64_t)&v7[4 * v20 + 4]) {
            memmove(v15 + 4, v7 + 4, 32 * v20);
          }
          void v7[2] = 0;
        }
        uint64_t v9 = v19 + 32 * v20;
        uint64_t v8 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - v20;
        uint64_t result = (void *)swift_release();
        uint64_t v7 = v15;
        long long v10 = v27;
      }
      BOOL v22 = __OFSUB__(v8--, 1);
      if (v22) {
        break;
      }
      *(_DWORD *)uint64_t v9 = v11;
      *(void *)(v9 + 24) = v6;
      *(_OWORD *)(v9 + 8) = v10;
      uint64_t result = a2(&v28, (uint64_t)result);
      long long v10 = v29;
      unint64_t v6 = v30;
      v9 += 32;
      if (v30 >> 60 == 15) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_24CA7F9EC(uint64_t a1)
{
  type metadata accessor for DataFrameStreamSegment.Iterator();
  uint64_t inited = swift_initStackObject();
  *(_DWORD *)(inited + 76) = 0;
  *(unsigned char *)(inited + 80) = 1;
  uint64_t v3 = *(void *)(*(void *)(a1 + 24) + 16);
  sub_24CA663A0(a1);
  *(void *)(inited + 24) = *(void *)(v3 + 24);
  long long v4 = *(_OWORD *)a1;
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(inited + 60) = *(_OWORD *)(a1 + 28);
  *(_OWORD *)(inited + 32) = v4;
  *(_OWORD *)(inited + 48) = v5;
  *(unsigned char *)(inited + 16) = 0;
  sub_24CA7EF90(&v27);
  unint64_t v6 = v29;
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  if (v29 >> 60 != 15)
  {
    uint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x263F8EE78] + 32;
    long long v10 = v28;
    while (1)
    {
      int v11 = v27;
      if (!v8)
      {
        unint64_t v12 = v7[3];
        if ((uint64_t)((v12 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_27;
        }
        long long v26 = v10;
        int64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
        if (v13 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v13;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269807CE0);
        uint64_t v15 = (void *)swift_allocObject();
        int64_t v16 = _swift_stdlib_malloc_size(v15);
        uint64_t v17 = v16 - 32;
        if (v16 < 32) {
          uint64_t v17 = v16 - 1;
        }
        uint64_t v18 = v17 >> 5;
        v15[2] = v14;
        v15[3] = 2 * (v17 >> 5);
        unint64_t v19 = (unint64_t)(v15 + 4);
        uint64_t v20 = v7[3] >> 1;
        if (v7[2])
        {
          if (v15 != v7 || v19 >= (unint64_t)&v7[4 * v20 + 4]) {
            memmove(v15 + 4, v7 + 4, 32 * v20);
          }
          void v7[2] = 0;
        }
        uint64_t v9 = v19 + 32 * v20;
        uint64_t v8 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - v20;
        swift_release();
        uint64_t v7 = v15;
        long long v10 = v26;
      }
      BOOL v22 = __OFSUB__(v8--, 1);
      if (v22) {
        break;
      }
      *(_DWORD *)uint64_t v9 = v11;
      *(void *)(v9 + 24) = v6;
      *(_OWORD *)(v9 + 8) = v10;
      sub_24CA7EF90(&v27);
      long long v10 = v28;
      unint64_t v6 = v29;
      v9 += 32;
      if (v29 >> 60 == 15) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v8 = 0;
LABEL_22:
  sub_24CA5355C(a1);
  unint64_t v23 = v7[3];
  if (v23 >= 2)
  {
    unint64_t v24 = v23 >> 1;
    BOOL v22 = __OFSUB__(v24, v8);
    uint64_t v25 = v24 - v8;
    if (!v22)
    {
      void v7[2] = v25;
      return;
    }
LABEL_28:
    __break(1u);
  }
}

uint64_t sub_24CA7FBD0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  type metadata accessor for DataFrameStreamSegment.Iterator();
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 76) = 0;
  *(unsigned char *)(v8 + 80) = 1;
  uint64_t v9 = *(void *)(*(void *)(v4 + 24) + 16);
  sub_24CA663A0(v4);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  long long v10 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)v4;
  *(_OWORD *)(v8 + 48) = v10;
  *(_OWORD *)(v8 + 60) = *(_OWORD *)(v4 + 28);
  *(unsigned char *)(v8 + 16) = 0;
  uint64_t result = sub_24CA5355C(v4);
  uint64_t v12 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *a1 = v8;
    return v12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_24CA7EF90(&v15);
    unint64_t v13 = v17;
    if (v17 >> 60 == 15)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      while (1)
      {
        long long v14 = v16;
        *(_DWORD *)a2 = v15;
        *(_OWORD *)(a2 + 8) = v14;
        *(void *)(a2 + 24) = v13;
        if (a3 - 1 == v12) {
          break;
        }
        sub_24CA7EF90(&v15);
        unint64_t v13 = v17;
        a2 += 32;
        ++v12;
        if (v17 >> 60 == 15) {
          goto LABEL_11;
        }
      }
      uint64_t v12 = a3;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CA7FCF0(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  long long v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *long long v5 = a4;
    v5[1] = v6;
    id v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    *int v11 = *(void *)(*(void *)(a4 + 48) + 8 * v16);
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24CA7FEEC()
{
  sub_24CA80140(v0 + OBJC_IVAR____TtC8Dendrite22RollingStreamContainer_storageContainer);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CA8019C(v0 + OBJC_IVAR____TtC8Dendrite22RollingStreamContainer__currentContainerId);
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24CA7FF90()
{
  return type metadata accessor for RollingStreamContainer();
}

uint64_t type metadata accessor for RollingStreamContainer()
{
  uint64_t result = qword_269807D20;
  if (!qword_269807D20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24CA7FFE4()
{
  type metadata accessor for StorageContainer();
  if (v0 <= 0x3F)
  {
    sub_24CA800E8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_24CA800E8()
{
  if (!qword_269807D30[0])
  {
    sub_24CA86130();
    unint64_t v0 = sub_24CA86520();
    if (!v1) {
      atomic_store(v0, qword_269807D30);
    }
  }
}

uint64_t sub_24CA80140(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StorageContainer();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CA8019C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180838);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for FrameStorageLayout()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t ProtoTagPath.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

{
  *a2 = result;
  return result;
}

BOOL static ProtoTagPath.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_24CA806F0(*a1, *a2);
}

BOOL static ProtoTagPath.FormatError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ProtoTagPath.FormatError.hash(into:)()
{
  return sub_24CA86730();
}

uint64_t ProtoTagPath.FormatError.hashValue.getter()
{
  return sub_24CA86760();
}

uint64_t ProtoTagPath.init(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  v26[0] = 46;
  unint64_t v24 = v26;
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_24CA80960(0x7FFFFFFFFFFFFFFFLL, 1, sub_24CA818A4, (uint64_t)v23, a1, a2);
  swift_bridgeObjectRelease();
  int64_t v7 = v6[2];
  if (v7)
  {
    uint64_t v27 = MEMORY[0x263F8EE78];
    sub_24CA747A8(0, v7, 0);
    unint64_t v9 = v6[4];
    uint64_t v8 = v6[5];
    unint64_t v10 = v6[7];
    if ((v8 ^ v9) < 0x4000)
    {
LABEL_22:
      swift_bridgeObjectRetain();
LABEL_23:
      sub_24CA818FC();
      swift_allocError();
      *unint64_t v21 = 0;
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_release();
    }
    else
    {
      BOOL v22 = a3;
      int64_t v11 = v7 - 1;
      for (uint64_t i = 6; ; i += 4)
      {
        uint64_t v13 = &v6[i];
        unint64_t v14 = v6[i];
        swift_bridgeObjectRetain();
        if ((v10 & 0x1000000000000000) != 0)
        {
          swift_bridgeObjectRetain();
          uint64_t v8 = sub_24CA81044(v9, v8, v14, v10, 10);
          swift_bridgeObjectRelease();
          if ((v8 & 0x100000000) != 0) {
            goto LABEL_23;
          }
        }
        else
        {
          if ((v10 & 0x2000000000000000) != 0)
          {
            v26[0] = v14;
            v26[1] = v10 & 0xFFFFFFFFFFFFFFLL;
            unint64_t v15 = v26;
          }
          else if ((v14 & 0x1000000000000000) != 0)
          {
            unint64_t v15 = (void *)((v10 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else
          {
            unint64_t v15 = (void *)sub_24CA865D0();
          }
          uint64_t v16 = sub_24CA819D8((uint64_t)v15, v9, v8, v14, v10, 10);
          LODWORD(v8) = v16;
          char v25 = BYTE4(v16) & 1;
          if ((v16 & 0x100000000) != 0) {
            goto LABEL_23;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v17 = v27;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24CA747A8(0, *(void *)(v17 + 16) + 1, 1);
          uint64_t v17 = v27;
        }
        unint64_t v19 = *(void *)(v17 + 16);
        unint64_t v18 = *(void *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_24CA747A8(v18 > 1, v19 + 1, 1);
          uint64_t v17 = v27;
        }
        *(void *)(v17 + 16) = v19 + 1;
        *(_DWORD *)(v17 + 4 * v19 + 32) = v8;
        if (!v11) {
          break;
        }
        unint64_t v9 = v13[2];
        uint64_t v8 = v13[3];
        unint64_t v10 = v13[5];
        if ((v8 ^ v9) < 0x4000) {
          goto LABEL_22;
        }
        --v11;
      }
      uint64_t result = swift_bridgeObjectRelease();
      *BOOL v22 = v17;
    }
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *a3 = MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t ProtoTagPath.description.getter()
{
  int64_t v1 = *(void *)(*(void *)v0 + 16);
  if (v1)
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24CA74728(0, v1, 0);
    uint64_t v2 = 0;
    do
    {
      uint64_t v3 = sub_24CA86680();
      uint64_t v5 = v4;
      unint64_t v7 = *(void *)(v10 + 16);
      unint64_t v6 = *(void *)(v10 + 24);
      if (v7 >= v6 >> 1) {
        sub_24CA74728(v6 > 1, v7 + 1, 1);
      }
      ++v2;
      *(void *)(v10 + 16) = v7 + 1;
      uint64_t v8 = v10 + 16 * v7;
      *(void *)(v8 + 32) = v3;
      *(void *)(v8 + 40) = v5;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F790);
  sub_24CA79FD4();
  sub_24CA86200();
  swift_bridgeObjectRelease();
  sub_24CA86320();
  swift_bridgeObjectRelease();
  sub_24CA86320();
  return 8315;
}

BOOL sub_24CA806F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (int *)(a1 + 36);
  unint64_t v6 = (int *)(a2 + 36);
  do
  {
    int v8 = *v5++;
    int v7 = v8;
    int v10 = *v6++;
    int v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t ProtoTagPath.hash(into:)()
{
  uint64_t v1 = *v0;
  uint64_t result = sub_24CA86730();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v1 + 32;
    do
    {
      v4 += 4;
      uint64_t result = sub_24CA86750();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t ProtoTagPath.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_24CA86720();
  sub_24CA86730();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 4;
      sub_24CA86750();
      --v2;
    }
    while (v2);
  }
  return sub_24CA86760();
}

uint64_t sub_24CA80830()
{
  uint64_t v1 = *v0;
  sub_24CA86720();
  uint64_t v2 = *(void *)(v1 + 16);
  sub_24CA86730();
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 4;
      sub_24CA86750();
      --v2;
    }
    while (v2);
  }
  return sub_24CA86760();
}

BOOL sub_24CA808A4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = v2;
  return (_s8Dendrite12ProtoTagPathV1loiySbAC_ACtFZ_0(&v4, &v5) & 1) == 0;
}

BOOL sub_24CA808E0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = v2;
  return (_s8Dendrite12ProtoTagPathV1loiySbAC_ACtFZ_0(&v5, &v4) & 1) == 0;
}

unint64_t sub_24CA8091C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = v2;
  return (unint64_t)_s8Dendrite12ProtoTagPathV1loiySbAC_ACtFZ_0(&v4, &v5) & 1;
}

BOOL sub_24CA80954(uint64_t *a1, uint64_t *a2)
{
  return sub_24CA806F0(*a1, *a2);
}

uint64_t sub_24CA80960(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_24CA80E04(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_24CA86390();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_24CA86310();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_24CA86310();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_24CA863B0();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_24CA82BB0(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_24CA82BB0((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  long long v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_24CA86310();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_24CA863B0();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_24CA82BB0(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_24CA82BB0((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    int v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_24CA865F0();
  __break(1u);
LABEL_42:
  uint64_t result = sub_24CA865F0();
  __break(1u);
  return result;
}

uint64_t sub_24CA80E04(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_24CA863B0();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_24CA82BB0(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_24CA82BB0((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    char v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_24CA865F0();
  __break(1u);
  return result;
}

void *sub_24CA80F60(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807A38);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CA80FC8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_24CA86380();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x253306000](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_24CA81044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_24CA81FC4();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24CA863A0();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_24CA813B8();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)sub_24CA865D0();
  }
LABEL_7:
  unint64_t v13 = sub_24CA81138(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 | ((((unint64_t)v13 >> 32) & 1) << 32);
}

unsigned __int8 *sub_24CA81138(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24CA813B8()
{
  unint64_t v0 = sub_24CA863B0();
  uint64_t v4 = sub_24CA81438(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24CA81438(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_24CA81590(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_24CA80F60(v9, 0);
      unint64_t v12 = sub_24CA81690((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_24CA865D0();
LABEL_4:
        JUMPOUT(0x253305F90);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x253305F90](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x253305F90]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_24CA81590(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    uint64_t result = sub_24CA80FC8(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_24CA80FC8(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  return sub_24CA86360();
}

unint64_t sub_24CA81690(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    id v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_24CA80FC8(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_24CA86370();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_24CA865D0();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_24CA80FC8(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_24CA86340();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_24CA818A4(void *a1)
{
  unint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_24CA866A0() & 1;
  }
}

unint64_t sub_24CA818FC()
{
  unint64_t result = qword_269807DB8;
  if (!qword_269807DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807DB8);
  }
  return result;
}

uint64_t *_s8Dendrite12ProtoTagPathV1loiySbAC_ACtFZ_0(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = *a2;
  unint64_t v4 = *(void *)(*result + 16);
  unint64_t v5 = *(void *)(*a2 + 16);
  if (v5 >= v4) {
    uint64_t v6 = *(void *)(*result + 16);
  }
  else {
    uint64_t v6 = *(void *)(*a2 + 16);
  }
  if (!v6) {
    return (uint64_t *)(v4 < v5);
  }
  unsigned int v7 = *(_DWORD *)(v2 + 32);
  unsigned int v8 = *(_DWORD *)(v3 + 32);
  if (v7 == v8)
  {
    unint64_t v9 = 0;
    uint64_t v10 = v2 + 36;
    uint64_t v11 = v3 + 36;
    uint64_t v12 = v6 - 1;
    while (v12 != v9)
    {
      unsigned int v7 = *(_DWORD *)(v10 + 4 * v9);
      unsigned int v8 = *(_DWORD *)(v11 + 4 * v9++);
      if (v7 != v8) {
        goto LABEL_12;
      }
    }
    return (uint64_t *)(v4 < v5);
  }
  unint64_t v9 = 0;
LABEL_12:
  if (v9 < v4) {
    return (uint64_t *)(v7 < v8);
  }
  __break(1u);
  return result;
}

uint64_t sub_24CA819D8(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    unint64_t result = sub_24CA80FC8(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v15 = a2 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(a5) & 0xF;
  }
  if (v16 < a2 >> 16) {
    goto LABEL_104;
  }
  unint64_t result = sub_24CA86360();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    unint64_t result = sub_24CA80FC8(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    unint64_t result = sub_24CA80FC8(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    unint64_t result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v17 < v10 >> 16) {
    goto LABEL_100;
  }
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  unint64_t result = sub_24CA86360();
LABEL_21:
  int64_t v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  char v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    char v19 = 0;
  }
  int v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v33 = a6 + 87;
        if (a6 > 10)
        {
          unsigned __int8 v34 = a6 + 55;
        }
        else
        {
          unsigned __int8 v33 = 97;
          unsigned __int8 v34 = 65;
        }
        if (a6 <= 10) {
          unsigned __int8 v35 = a6 + 48;
        }
        else {
          unsigned __int8 v35 = 58;
        }
        if (v19)
        {
          unsigned int v24 = 0;
          uint64_t v36 = v19 + 1;
          uint64_t v37 = result - 1;
          do
          {
            unsigned int v38 = *v36;
            if (v38 < 0x30 || v38 >= v35)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                unsigned int v29 = 0;
                unsigned __int8 v30 = 1;
                if (v38 < 0x61 || v38 >= v33) {
                  return v29 | ((unint64_t)v30 << 32);
                }
                char v39 = -87;
              }
              else
              {
                char v39 = -55;
              }
            }
            else
            {
              char v39 = -48;
            }
            unint64_t v40 = v24 * (unint64_t)a6;
            if ((v40 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_96;
            }
            unsigned __int8 v41 = v38 + v39;
            unsigned int v24 = v40 + v41;
            if (__CFADD__(v40, v41)) {
              goto LABEL_96;
            }
            ++v36;
            --v37;
          }
          while (v37);
LABEL_94:
          unsigned __int8 v30 = 0;
          unsigned int v29 = v24;
          return v29 | ((unint64_t)v30 << 32);
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      unsigned __int8 v42 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v43 = a6 + 55;
      }
      else
      {
        unsigned __int8 v42 = 97;
        unsigned __int8 v43 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v44 = a6 + 48;
      }
      else {
        unsigned __int8 v44 = 58;
      }
      if (v19)
      {
        unsigned int v24 = 0;
        while (1)
        {
          unsigned int v45 = *v19;
          if (v45 < 0x30 || v45 >= v44)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              unsigned int v29 = 0;
              unsigned __int8 v30 = 1;
              if (v45 < 0x61 || v45 >= v42) {
                return v29 | ((unint64_t)v30 << 32);
              }
              char v46 = -87;
            }
            else
            {
              char v46 = -55;
            }
          }
          else
          {
            char v46 = -48;
          }
          unint64_t v47 = v24 * (unint64_t)a6;
          if ((v47 & 0xFFFFFFFF00000000) != 0) {
            goto LABEL_96;
          }
          unsigned __int8 v48 = v45 + v46;
          unsigned int v24 = v47 + v48;
          if (__CFADD__(v47, v48)) {
            goto LABEL_96;
          }
          ++v19;
          if (!--result) {
            goto LABEL_94;
          }
        }
      }
      goto LABEL_95;
    }
LABEL_96:
    unsigned int v29 = 0;
    unsigned __int8 v30 = 1;
    return v29 | ((unint64_t)v30 << 32);
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v21 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v22 = a6 + 55;
      }
      else
      {
        unsigned __int8 v21 = 97;
        unsigned __int8 v22 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v23 = a6 + 48;
      }
      else {
        unsigned __int8 v23 = 58;
      }
      if (v19)
      {
        unsigned int v24 = 0;
        unsigned __int8 v25 = v19 + 1;
        uint64_t v26 = result - 1;
        while (1)
        {
          unsigned int v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              unsigned int v29 = 0;
              unsigned __int8 v30 = 1;
              if (v27 < 0x61 || v27 >= v21) {
                return v29 | ((unint64_t)v30 << 32);
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          unint64_t v31 = v24 * (unint64_t)a6;
          if ((v31 & 0xFFFFFFFF00000000) != 0) {
            goto LABEL_96;
          }
          unsigned __int8 v32 = v27 + v28;
          unsigned int v24 = v31 - v32;
          if (v31 < v32) {
            goto LABEL_96;
          }
          ++v25;
          if (!--v26) {
            goto LABEL_94;
          }
        }
      }
LABEL_95:
      unsigned int v29 = 0;
      unsigned __int8 v30 = 0;
      return v29 | ((unint64_t)v30 << 32);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

unint64_t sub_24CA81E04()
{
  unint64_t result = qword_269807DC0;
  if (!qword_269807DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807DC0);
  }
  return result;
}

unint64_t sub_24CA81E5C()
{
  unint64_t result = qword_26B17F618;
  if (!qword_26B17F618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17F618);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProtoTagPath()
{
  return &type metadata for ProtoTagPath;
}

unsigned char *storeEnumTagSinglePayload for ProtoTagPath.FormatError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA81F8CLL);
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

ValueMetadata *type metadata accessor for ProtoTagPath.FormatError()
{
  return &type metadata for ProtoTagPath.FormatError;
}

unint64_t sub_24CA81FC4()
{
  unint64_t result = qword_269807DC8;
  if (!qword_269807DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807DC8);
  }
  return result;
}

uint64_t sub_24CA82018()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CA82050()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t Set<>.optimized(for:)(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  int v3 = sub_24CA82D2C(a2);
  swift_bridgeObjectRelease();
  unsigned __int8 v22 = v3;
  sub_24CA82CC0((uint64_t *)&v22);
  uint64_t v4 = v22[2];
  if (v4)
  {
    uint64_t v5 = v22 + 4;
    swift_retain();
    uint64_t v6 = 0;
    unsigned int v7 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v10 = v5[v6];
      uint64_t v11 = v7[2];
      if (!v11)
      {
        swift_bridgeObjectRetain_n();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          int64_t v19 = 1;
LABEL_26:
          unsigned int v7 = sub_24CA82500(0, v19, 1, v7);
        }
LABEL_4:
        unint64_t v9 = v7[2];
        unint64_t v8 = v7[3];
        if (v9 >= v8 >> 1) {
          unsigned int v7 = sub_24CA82500((void *)(v8 > 1), v9 + 1, 1, v7);
        }
        void v7[2] = v9 + 1;
        v7[v9 + 4] = v10;
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      uint64_t v12 = v7[v11 + 3];
      unint64_t v13 = *(void *)(v10 + 16);
      if (v13)
      {
        unint64_t v14 = *(void *)(v12 + 16);
        if (!v14) {
          goto LABEL_7;
        }
        if (*(_DWORD *)(v10 + 32) != *(_DWORD *)(v12 + 32)) {
          goto LABEL_23;
        }
        if (v13 != 1)
        {
          if (v14 == 1) {
            goto LABEL_7;
          }
          if (*(_DWORD *)(v10 + 36) != *(_DWORD *)(v12 + 36)) {
            goto LABEL_23;
          }
          uint64_t v15 = 0;
          uint64_t v16 = v12 + 40;
          while (v13 - 2 != v15)
          {
            if (v14 - 2 == v15) {
              goto LABEL_7;
            }
            int v17 = *(_DWORD *)(v10 + 40 + 4 * v15);
            int v18 = *(_DWORD *)(v16 + 4 * v15++);
            if (v17 != v18) {
              goto LABEL_23;
            }
          }
        }
      }
      else
      {
        unint64_t v14 = *(void *)(v12 + 16);
      }
      if (v13 != v14)
      {
        if (v13 >= v14)
        {
          __break(1u);
          uint64_t result = swift_release();
          __break(1u);
          return result;
        }
LABEL_23:
        swift_bridgeObjectRetain_n();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          int64_t v19 = v11 + 1;
          goto LABEL_26;
        }
        goto LABEL_4;
      }
LABEL_7:
      if (++v6 == v4)
      {
        swift_release_n();
        goto LABEL_29;
      }
    }
  }
  swift_release();
  unsigned int v7 = (void *)MEMORY[0x263F8EE78];
LABEL_29:
  uint64_t v20 = sub_24CA83BD4((uint64_t)v7);
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_24CA8228C(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    unint64_t v3 = *(void *)(result + 16);
    if (!v3) {
      return 1;
    }
    if (*(_DWORD *)(a2 + 32) != *(_DWORD *)(result + 32)) {
      return 0;
    }
    uint64_t v4 = 0;
    uint64_t v5 = result + 36;
    unint64_t v6 = v3 - 1;
    while (v2 - 1 != v4)
    {
      uint64_t result = v6 == v4;
      if (v6 != v4)
      {
        int v7 = *(_DWORD *)(a2 + 36 + 4 * v4);
        int v8 = *(_DWORD *)(v5 + 4 * v4++);
        if (v7 == v8) {
          continue;
        }
      }
      return result;
    }
  }
  else
  {
    unint64_t v3 = *(void *)(result + 16);
  }
  if (v2 == v3) {
    return 1;
  }
  if (v2 < v3) {
    return 0;
  }
  __break(1u);
  return result;
}

BOOL static ProtoTagTreeOperation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ProtoTagTreeOperation.hash(into:)()
{
  return sub_24CA86730();
}

uint64_t ProtoTagTreeOperation.hashValue.getter()
{
  return sub_24CA86760();
}

uint64_t Set<>.init(tagPaths:)(uint64_t a1)
{
  return sub_24CA84180(a1);
}

{
  return sub_24CA84180(a1);
}

void *sub_24CA823D8(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269807DD8);
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
    sub_24CA83AC4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24CA82500(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F620);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24CA83C5C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_24CA82610(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F630);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      unint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_24CA83D50(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24CA82720(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1808D8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24CA83E3C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CA82830(char a1, int64_t a2, char a3, unint64_t a4)
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269807DE0);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269807A70) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24CA865F0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269807A70) - 8);
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
    sub_24CA83F30(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_24CA82AA0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269807820);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24CA839D0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24CA82BB0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F628);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24CA8408C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CA82CC0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CA56CF8(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_24CA82E14(v5);
  *a1 = v2;
  return result;
}

void *sub_24CA82D2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17F620);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  uint64_t v6 = sub_24CA7FCF0((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24CA84584();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_24CA82E14(uint64_t *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_24CA86670();
  if (result < v3)
  {
    uint64_t v114 = result;
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_190;
    }
    uint64_t v118 = v1;
    if (v3 < 2)
    {
      uint64_t v8 = MEMORY[0x263F8EE78];
      long long __dst = (char *)(MEMORY[0x263F8EE78] + 32);
      if (v3 != 1)
      {
        unint64_t v56 = *(void *)(MEMORY[0x263F8EE78] + 16);
        int64_t v11 = (char *)MEMORY[0x263F8EE78];
        goto LABEL_145;
      }
      uint64_t v113 = MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v6 = v5 >> 1;
      uint64_t v7 = sub_24CA86420();
      *(void *)(v7 + 16) = v6;
      uint64_t v113 = v7;
      long long __dst = (char *)(v7 + 32);
    }
    uint64_t v9 = 0;
    char v112 = v2;
    uint64_t v10 = *v2;
    int64_t v11 = (char *)MEMORY[0x263F8EE78];
    uint64_t v115 = v3;
    while (1)
    {
      uint64_t v12 = v9 + 1;
      if (v9 + 1 >= v3) {
        goto LABEL_63;
      }
      uint64_t v13 = *(void *)(v10 + 8 * v12);
      uint64_t v14 = v10 + 8 * v9;
      uint64_t v15 = *(void *)v14;
      unint64_t v16 = *(void *)(v13 + 16);
      unint64_t v17 = *(void *)(*(void *)v14 + 16);
      if (v17 >= v16) {
        uint64_t v18 = *(void *)(v13 + 16);
      }
      else {
        uint64_t v18 = *(void *)(*(void *)v14 + 16);
      }
      if (v18)
      {
        unsigned int v19 = *(_DWORD *)(v13 + 32);
        unsigned int v20 = *(_DWORD *)(v15 + 32);
        if (v19 != v20)
        {
          unint64_t v21 = 0;
LABEL_26:
          if (v21 >= v16) {
            goto LABEL_185;
          }
          BOOL v24 = v19 >= v20;
          goto LABEL_28;
        }
        unint64_t v21 = 0;
        uint64_t v22 = v15 + 36;
        uint64_t v23 = v18 - 1;
        while (v23 != v21)
        {
          unsigned int v19 = *(_DWORD *)(v13 + 36 + 4 * v21);
          unsigned int v20 = *(_DWORD *)(v22 + 4 * v21++);
          if (v19 != v20) {
            goto LABEL_26;
          }
        }
      }
      BOOL v24 = v16 >= v17;
LABEL_28:
      int v25 = !v24;
      uint64_t v12 = v9 + 2;
      if (v9 + 2 < v3)
      {
        while (1)
        {
          uint64_t v26 = *(void *)(v10 + 8 * v12);
          unint64_t v27 = *(void *)(v26 + 16);
          if (v16 >= v27) {
            unint64_t v28 = *(void *)(v26 + 16);
          }
          else {
            unint64_t v28 = v16;
          }
          if (v28)
          {
            unsigned int v29 = *(_DWORD *)(v26 + 32);
            unsigned int v30 = *(_DWORD *)(v13 + 32);
            if (v29 != v30)
            {
              unint64_t v31 = 0;
LABEL_47:
              if (v31 >= v27) {
                goto LABEL_174;
              }
              BOOL v36 = v29 >= v30;
              goto LABEL_49;
            }
            unint64_t v31 = 0;
            if ((uint64_t)v16 <= 1) {
              uint64_t v32 = 1;
            }
            else {
              uint64_t v32 = v16;
            }
            uint64_t v33 = v32 - 1;
            uint64_t v34 = v13 + 36;
            unint64_t v35 = v28 - 1;
            while (v35 != v31)
            {
              if (v33 == v31) {
                goto LABEL_158;
              }
              unsigned int v29 = *(_DWORD *)(v26 + 36 + 4 * v31);
              unsigned int v30 = *(_DWORD *)(v34 + 4 * v31++);
              if (v29 != v30) {
                goto LABEL_47;
              }
            }
          }
          BOOL v36 = v27 >= v16;
LABEL_49:
          int v37 = !v36;
          if (v25 != v37) {
            break;
          }
          ++v12;
          unint64_t v16 = *(void *)(v26 + 16);
          uint64_t v13 = v26;
          if (v12 == v3)
          {
            uint64_t v12 = v3;
            break;
          }
        }
      }
      if (v25)
      {
        if (v12 < v9) {
          goto LABEL_184;
        }
        if (v9 < v12)
        {
          unsigned int v38 = (void *)(v10 - 8 + 8 * v12);
          uint64_t v39 = v12;
          uint64_t v40 = v9;
          do
          {
            if (v40 != --v39)
            {
              if (!v10) {
                goto LABEL_188;
              }
              uint64_t v41 = *(void *)v14;
              *(void *)uint64_t v14 = *v38;
              *unsigned int v38 = v41;
            }
            ++v40;
            --v38;
            v14 += 8;
          }
          while (v40 < v39);
        }
      }
LABEL_63:
      if (v12 >= v3) {
        goto LABEL_92;
      }
      if (__OFSUB__(v12, v9)) {
        goto LABEL_180;
      }
      if (v12 - v9 >= v114) {
        goto LABEL_92;
      }
      uint64_t v42 = v9 + v114;
      if (__OFADD__(v9, v114)) {
        goto LABEL_182;
      }
      if (v42 >= v3) {
        uint64_t v42 = v3;
      }
      if (v42 < v9)
      {
LABEL_183:
        __break(1u);
LABEL_184:
        __break(1u);
LABEL_185:
        __break(1u);
LABEL_186:
        __break(1u);
LABEL_187:
        __break(1u);
LABEL_188:
        __break(1u);
LABEL_189:
        __break(1u);
LABEL_190:
        uint64_t result = sub_24CA865F0();
        __break(1u);
        return result;
      }
      if (v12 != v42)
      {
        while (1)
        {
          uint64_t v43 = *(void *)(v10 + 8 * v12);
          uint64_t v44 = v12;
          do
          {
            uint64_t v45 = v44 - 1;
            uint64_t v46 = *(void *)(v10 + 8 * (v44 - 1));
            unint64_t v47 = *(void *)(v43 + 16);
            unint64_t v48 = *(void *)(v46 + 16);
            if (v48 >= v47) {
              uint64_t v49 = *(void *)(v43 + 16);
            }
            else {
              uint64_t v49 = *(void *)(v46 + 16);
            }
            if (!v49) {
              goto LABEL_83;
            }
            unsigned int v50 = *(_DWORD *)(v43 + 32);
            unsigned int v51 = *(_DWORD *)(v46 + 32);
            if (v50 == v51)
            {
              unint64_t v52 = 0;
              uint64_t v53 = v49 - 1;
              while (v53 != v52)
              {
                unsigned int v50 = *(_DWORD *)(v43 + 36 + 4 * v52);
                unsigned int v51 = *(_DWORD *)(v46 + 36 + 4 * v52++);
                if (v50 != v51) {
                  goto LABEL_86;
                }
              }
LABEL_83:
              if (v47 >= v48) {
                break;
              }
              goto LABEL_88;
            }
            unint64_t v52 = 0;
LABEL_86:
            if (v52 >= v47)
            {
              __break(1u);
LABEL_158:
              __break(1u);
LABEL_159:
              __break(1u);
LABEL_160:
              __break(1u);
LABEL_161:
              __break(1u);
LABEL_162:
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
LABEL_166:
              __break(1u);
LABEL_167:
              __break(1u);
LABEL_168:
              __break(1u);
LABEL_169:
              __break(1u);
LABEL_170:
              __break(1u);
LABEL_171:
              __break(1u);
LABEL_172:
              __break(1u);
LABEL_173:
              __break(1u);
LABEL_174:
              __break(1u);
LABEL_175:
              __break(1u);
LABEL_176:
              __break(1u);
LABEL_177:
              __break(1u);
LABEL_178:
              __break(1u);
LABEL_179:
              __break(1u);
LABEL_180:
              __break(1u);
LABEL_181:
              __break(1u);
LABEL_182:
              __break(1u);
              goto LABEL_183;
            }
            if (v50 >= v51) {
              break;
            }
LABEL_88:
            if (!v10) {
              goto LABEL_186;
            }
            *(void *)(v10 + 8 * v44) = v46;
            *(void *)(v10 + 8 * v45) = v43;
            --v44;
          }
          while (v45 != v9);
          if (++v12 == v42)
          {
            uint64_t v12 = v42;
            break;
          }
        }
      }
LABEL_92:
      if (v12 < v9) {
        goto LABEL_176;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v11 = sub_24CA569EC(0, *((void *)v11 + 2) + 1, 1, v11);
      }
      unint64_t v55 = *((void *)v11 + 2);
      unint64_t v54 = *((void *)v11 + 3);
      unint64_t v56 = v55 + 1;
      if (v55 >= v54 >> 1) {
        int64_t v11 = sub_24CA569EC((char *)(v54 > 1), v55 + 1, 1, v11);
      }
      *((void *)v11 + 2) = v56;
      uint64_t v57 = v11 + 32;
      uint64_t v58 = &v11[16 * v55 + 32];
      *(void *)uint64_t v58 = v9;
      *((void *)v58 + 1) = v12;
      uint64_t v116 = v12;
      if (v55)
      {
        while (1)
        {
          unint64_t v59 = v56 - 1;
          if (v56 >= 4)
          {
            id v64 = &v57[16 * v56];
            uint64_t v65 = *((void *)v64 - 8);
            uint64_t v66 = *((void *)v64 - 7);
            BOOL v70 = __OFSUB__(v66, v65);
            uint64_t v67 = v66 - v65;
            if (v70) {
              goto LABEL_163;
            }
            uint64_t v69 = *((void *)v64 - 6);
            uint64_t v68 = *((void *)v64 - 5);
            BOOL v70 = __OFSUB__(v68, v69);
            uint64_t v62 = v68 - v69;
            char v63 = v70;
            if (v70) {
              goto LABEL_164;
            }
            unint64_t v71 = v56 - 2;
            uint64_t v72 = &v57[16 * v56 - 32];
            uint64_t v74 = *(void *)v72;
            uint64_t v73 = *((void *)v72 + 1);
            BOOL v70 = __OFSUB__(v73, v74);
            uint64_t v75 = v73 - v74;
            if (v70) {
              goto LABEL_166;
            }
            BOOL v70 = __OFADD__(v62, v75);
            uint64_t v76 = v62 + v75;
            if (v70) {
              goto LABEL_169;
            }
            if (v76 >= v67)
            {
              uint64_t v94 = &v57[16 * v59];
              uint64_t v96 = *(void *)v94;
              uint64_t v95 = *((void *)v94 + 1);
              BOOL v70 = __OFSUB__(v95, v96);
              uint64_t v97 = v95 - v96;
              if (v70) {
                goto LABEL_173;
              }
              BOOL v87 = v62 < v97;
              goto LABEL_129;
            }
          }
          else
          {
            if (v56 != 3)
            {
              uint64_t v88 = *((void *)v11 + 4);
              uint64_t v89 = *((void *)v11 + 5);
              BOOL v70 = __OFSUB__(v89, v88);
              uint64_t v81 = v89 - v88;
              char v82 = v70;
              goto LABEL_123;
            }
            uint64_t v61 = *((void *)v11 + 4);
            uint64_t v60 = *((void *)v11 + 5);
            BOOL v70 = __OFSUB__(v60, v61);
            uint64_t v62 = v60 - v61;
            char v63 = v70;
          }
          if (v63) {
            goto LABEL_165;
          }
          unint64_t v71 = v56 - 2;
          uint64_t v77 = &v57[16 * v56 - 32];
          uint64_t v79 = *(void *)v77;
          uint64_t v78 = *((void *)v77 + 1);
          BOOL v80 = __OFSUB__(v78, v79);
          uint64_t v81 = v78 - v79;
          char v82 = v80;
          if (v80) {
            goto LABEL_168;
          }
          uint64_t v83 = &v57[16 * v59];
          uint64_t v85 = *(void *)v83;
          uint64_t v84 = *((void *)v83 + 1);
          BOOL v70 = __OFSUB__(v84, v85);
          uint64_t v86 = v84 - v85;
          if (v70) {
            goto LABEL_171;
          }
          if (__OFADD__(v81, v86)) {
            goto LABEL_172;
          }
          if (v81 + v86 >= v62)
          {
            BOOL v87 = v62 < v86;
LABEL_129:
            if (v87) {
              unint64_t v59 = v71;
            }
            goto LABEL_131;
          }
LABEL_123:
          if (v82) {
            goto LABEL_167;
          }
          uint64_t v90 = &v57[16 * v59];
          uint64_t v92 = *(void *)v90;
          uint64_t v91 = *((void *)v90 + 1);
          BOOL v70 = __OFSUB__(v91, v92);
          uint64_t v93 = v91 - v92;
          if (v70) {
            goto LABEL_170;
          }
          if (v93 < v81) {
            goto LABEL_140;
          }
LABEL_131:
          unint64_t v98 = v59 - 1;
          if (v59 - 1 >= v56) {
            goto LABEL_159;
          }
          if (!v10) {
            goto LABEL_187;
          }
          uint64_t v99 = &v57[16 * v98];
          uint64_t v100 = *(void *)v99;
          uint64_t v101 = &v57[16 * v59];
          uint64_t v102 = *((void *)v101 + 1);
          sub_24CA83680((char *)(v10 + 8 * *(void *)v99), (char *)(v10 + 8 * *(void *)v101), (char *)(v10 + 8 * v102), __dst);
          if (v118) {
            goto LABEL_156;
          }
          if (v102 < v100) {
            goto LABEL_160;
          }
          if (v59 > *((void *)v11 + 2)) {
            goto LABEL_161;
          }
          *(void *)uint64_t v99 = v100;
          *(void *)&v57[16 * v98 + 8] = v102;
          unint64_t v103 = *((void *)v11 + 2);
          if (v59 >= v103) {
            goto LABEL_162;
          }
          unint64_t v56 = v103 - 1;
          memmove(&v57[16 * v59], v101 + 16, 16 * (v103 - 1 - v59));
          *((void *)v11 + 2) = v103 - 1;
          if (v103 <= 2) {
            goto LABEL_140;
          }
        }
      }
      unint64_t v56 = 1;
LABEL_140:
      uint64_t v3 = v115;
      uint64_t v9 = v116;
      if (v116 >= v115)
      {
        uint64_t v8 = v113;
        uint64_t v2 = v112;
LABEL_145:
        uint64_t v113 = v8;
        if (v56 >= 2)
        {
          uint64_t v104 = *v2;
          do
          {
            unint64_t v105 = v56 - 2;
            if (v56 < 2) {
              goto LABEL_175;
            }
            if (!v104) {
              goto LABEL_189;
            }
            uint64_t v106 = v11;
            v107 = v11 + 32;
            uint64_t v108 = *(void *)&v11[16 * v105 + 32];
            uint64_t v109 = *(void *)&v107[16 * v56 - 8];
            sub_24CA83680((char *)(v104 + 8 * v108), (char *)(v104 + 8 * *(void *)&v107[16 * v56 - 16]), (char *)(v104 + 8 * v109), __dst);
            if (v118) {
              break;
            }
            if (v109 < v108) {
              goto LABEL_177;
            }
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v106 = sub_24CA56CE4((uint64_t)v106);
            }
            if (v105 >= *((void *)v106 + 2)) {
              goto LABEL_178;
            }
            uint64_t v110 = &v106[16 * v105 + 32];
            *(void *)uint64_t v110 = v108;
            *((void *)v110 + 1) = v109;
            unint64_t v111 = *((void *)v106 + 2);
            if (v56 > v111) {
              goto LABEL_179;
            }
            memmove(&v106[16 * v56 + 16], &v106[16 * v56 + 32], 16 * (v111 - v56));
            int64_t v11 = v106;
            *((void *)v106 + 2) = v111 - 1;
            unint64_t v56 = v111 - 1;
          }
          while (v111 > 2);
        }
LABEL_156:
        swift_bridgeObjectRelease();
        *(void *)(v113 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
    }
  }
  if (v3 < 0) {
    goto LABEL_181;
  }
  if (v3) {
    return sub_24CA835B4(0, v3, 1, v2);
  }
  return result;
}

uint64_t sub_24CA835B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 == a2) {
    return result;
  }
  uint64_t v4 = *a4;
LABEL_5:
  uint64_t v5 = *(void *)(v4 + 8 * a3);
  uint64_t v6 = a3;
  while (1)
  {
    uint64_t v7 = v6 - 1;
    uint64_t v8 = *(void *)(v4 + 8 * (v6 - 1));
    unint64_t v9 = *(void *)(v5 + 16);
    unint64_t v10 = *(void *)(v8 + 16);
    if (v10 >= v9) {
      uint64_t v11 = *(void *)(v5 + 16);
    }
    else {
      uint64_t v11 = *(void *)(v8 + 16);
    }
    if (!v11) {
      goto LABEL_15;
    }
    unsigned int v12 = *(_DWORD *)(v5 + 32);
    unsigned int v13 = *(_DWORD *)(v8 + 32);
    if (v12 != v13) {
      break;
    }
    unint64_t v14 = 0;
    uint64_t v15 = v11 - 1;
    while (v15 != v14)
    {
      unsigned int v12 = *(_DWORD *)(v5 + 36 + 4 * v14);
      unsigned int v13 = *(_DWORD *)(v8 + 36 + 4 * v14++);
      if (v12 != v13) {
        goto LABEL_18;
      }
    }
LABEL_15:
    if (v9 >= v10) {
      goto LABEL_4;
    }
LABEL_20:
    if (!v4) {
      goto LABEL_24;
    }
    *(void *)(v4 + 8 * v6) = v8;
    *(void *)(v4 + 8 * v7) = v5;
    --v6;
    if (v7 == result)
    {
LABEL_4:
      if (++a3 == a2) {
        return result;
      }
      goto LABEL_5;
    }
  }
  unint64_t v14 = 0;
LABEL_18:
  if (v14 < v9)
  {
    if (v12 >= v13) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_24CA83680(char *__src, char *a2, char *a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - a2;
  uint64_t v12 = a3 - a2 + 7;
  if (a3 - a2 >= 0) {
    uint64_t v12 = a3 - a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v41 = __src;
  uint64_t v40 = __dst;
  if (v10 < v12 >> 3)
  {
    if (v8 < -7) {
      goto LABEL_69;
    }
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    unint64_t v14 = &v4[8 * v10];
    uint64_t v39 = v14;
    if (v6 < v5 && v8 >= 8)
    {
      while (1)
      {
        uint64_t v15 = *(void *)v6;
        uint64_t v16 = *(void *)v4;
        unint64_t v17 = *(void *)(*(void *)v6 + 16);
        unint64_t v18 = *(void *)(*(void *)v4 + 16);
        if (v18 >= v17) {
          uint64_t v19 = *(void *)(*(void *)v6 + 16);
        }
        else {
          uint64_t v19 = *(void *)(*(void *)v4 + 16);
        }
        if (!v19) {
          goto LABEL_21;
        }
        unsigned int v20 = *(_DWORD *)(v15 + 32);
        unsigned int v21 = *(_DWORD *)(v16 + 32);
        if (v20 == v21) {
          break;
        }
        unint64_t v22 = 0;
LABEL_27:
        if (v22 >= v17) {
          goto LABEL_68;
        }
        if (v20 < v21)
        {
LABEL_22:
          BOOL v24 = v6 + 8;
          if (v7 < v6 || v7 >= v24 || v7 != v6) {
            *(void *)uint64_t v7 = v15;
          }
          goto LABEL_32;
        }
LABEL_29:
        if (v7 != v4) {
          *(void *)uint64_t v7 = v16;
        }
        v4 += 8;
        uint64_t v40 = v4;
        BOOL v24 = v6;
LABEL_32:
        v7 += 8;
        if (v4 < v14)
        {
          uint64_t v6 = v24;
          if (v24 < v5) {
            continue;
          }
        }
        uint64_t v41 = v7;
        goto LABEL_66;
      }
      unint64_t v22 = 0;
      uint64_t v23 = v19 - 1;
      while (v23 != v22)
      {
        unsigned int v20 = *(_DWORD *)(v15 + 36 + 4 * v22);
        unsigned int v21 = *(_DWORD *)(v16 + 36 + 4 * v22++);
        if (v20 != v21) {
          goto LABEL_27;
        }
      }
LABEL_21:
      if (v17 < v18) {
        goto LABEL_22;
      }
      goto LABEL_29;
    }
LABEL_66:
    sub_24CA56AE8((void **)&v41, (const void **)&v40, &v39);
    return 1;
  }
  if (v11 < -7) {
    goto LABEL_69;
  }
  if (__dst != a2 || &a2[8 * v13] <= __dst) {
    memmove(__dst, a2, 8 * v13);
  }
  int v25 = &v4[8 * v13];
  uint64_t v39 = v25;
  uint64_t v41 = v6;
  if (v7 >= v6 || v11 < 8) {
    goto LABEL_66;
  }
  while (1)
  {
    uint64_t v26 = *((void *)v25 - 1);
    unint64_t v27 = v6 - 8;
    uint64_t v28 = *((void *)v6 - 1);
    unint64_t v29 = *(void *)(v26 + 16);
    unint64_t v30 = *(void *)(v28 + 16);
    if (v30 >= v29) {
      uint64_t v31 = *(void *)(v26 + 16);
    }
    else {
      uint64_t v31 = *(void *)(v28 + 16);
    }
    if (!v31) {
      goto LABEL_54;
    }
    unsigned int v32 = *(_DWORD *)(v26 + 32);
    unsigned int v33 = *(_DWORD *)(v28 + 32);
    if (v32 == v33)
    {
      unint64_t v34 = 0;
      uint64_t v35 = v26 + 36;
      uint64_t v36 = v31 - 1;
      while (v36 != v34)
      {
        unsigned int v32 = *(_DWORD *)(v35 + 4 * v34);
        unsigned int v33 = *(_DWORD *)(v28 + 36 + 4 * v34++);
        if (v32 != v33) {
          goto LABEL_59;
        }
      }
LABEL_54:
      int v37 = v5 - 8;
      if (v29 >= v30) {
        goto LABEL_61;
      }
      goto LABEL_55;
    }
    unint64_t v34 = 0;
LABEL_59:
    if (v34 >= v29) {
      break;
    }
    int v37 = v5 - 8;
    if (v32 >= v33)
    {
LABEL_61:
      uint64_t v39 = v25 - 8;
      if (v5 < v25 || v37 >= v25 || v5 != v25) {
        *(void *)int v37 = *((void *)v25 - 1);
      }
      v25 -= 8;
      if (v6 <= v7) {
        goto LABEL_66;
      }
      goto LABEL_44;
    }
LABEL_55:
    if (v5 != v6 || v37 >= v6) {
      *(void *)int v37 = v28;
    }
    uint64_t v41 = v6 - 8;
    v6 -= 8;
    if (v27 <= v7) {
      goto LABEL_66;
    }
LABEL_44:
    uint64_t v5 = v37;
    if (v25 <= v4) {
      goto LABEL_66;
    }
  }
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA839D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA83AC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269807C88);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA83BD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_24CA84530();
  uint64_t result = sub_24CA86480();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      swift_bridgeObjectRetain();
      sub_24CA62A64(&v6, v5);
      swift_bridgeObjectRelease();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_24CA83C5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

char *sub_24CA83D50(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA83E3C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA83F30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269807A70) - 8);
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
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA8408C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24CA86630();
  __break(1u);
  return result;
}

uint64_t sub_24CA84180(uint64_t a1)
{
  int64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_24CA747C8(0, v3, 0);
    uint64_t v4 = v14;
    unint64_t v5 = (unint64_t *)(a1 + 40);
    while (1)
    {
      uint64_t v7 = *(v5 - 1);
      unint64_t v6 = *v5;
      swift_bridgeObjectRetain_n();
      ProtoTagPath.init(_:)(v7, v6, &v13);
      if (v1) {
        break;
      }
      swift_bridgeObjectRelease();
      uint64_t v8 = v13;
      uint64_t v14 = v4;
      unint64_t v10 = *(void *)(v4 + 16);
      unint64_t v9 = *(void *)(v4 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_24CA747C8(v9 > 1, v10 + 1, 1);
        uint64_t v4 = v14;
      }
      v5 += 2;
      *(void *)(v4 + 16) = v10 + 1;
      *(void *)(v4 + 8 * v10 + 32) = v8;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_10:
    uint64_t v12 = sub_24CA83BD4(v4);
    swift_bridgeObjectRelease();
    return v12;
  }
}

uint64_t _sSh8DendriteAA12ProtoTagPathVRszrlE8tagPathsShyACGSaySays6UInt32VGG_tcfC_0(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
    sub_24CA747C8(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = v10;
    do
    {
      uint64_t v5 = *(void *)(a1 + 8 * v3 + 32);
      unint64_t v6 = *(void *)(v10 + 16);
      unint64_t v7 = *(void *)(v10 + 24);
      swift_bridgeObjectRetain();
      if (v6 >= v7 >> 1) {
        sub_24CA747C8(v7 > 1, v6 + 1, 1);
      }
      ++v3;
      *(void *)(v10 + 16) = v6 + 1;
      *(void *)(v10 + 8 * v6 + 32) = v5;
    }
    while (v2 != v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  uint64_t v8 = sub_24CA83BD4(v4);
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_24CA843D8()
{
  unint64_t result = qword_269807DD0;
  if (!qword_269807DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807DD0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ProtoTagTreeOperation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA844F8);
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

ValueMetadata *type metadata accessor for ProtoTagTreeOperation()
{
  return &type metadata for ProtoTagTreeOperation;
}

unint64_t sub_24CA84530()
{
  unint64_t result = qword_26B17F610;
  if (!qword_26B17F610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17F610);
  }
  return result;
}

uint64_t sub_24CA84584()
{
  return swift_release();
}

id sub_24CA8458C(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  int64_t v2 = (void *)sub_24CA85FD0();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForUpdatingURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_24CA86020();
    unsigned int v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_24CA85F70();

    swift_willThrow();
    uint64_t v9 = sub_24CA86020();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_24CA846E4()
{
  id v1 = (id)sub_24CA848C4();
  flock((int)objc_msgSend(v1, sel_fileDescriptor), 8);

  sub_24CA4D98C(v0 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL);
  return swift_deallocClassInstance();
}

uint64_t sub_24CA847B8()
{
  return type metadata accessor for FileLock();
}

uint64_t type metadata accessor for FileLock()
{
  uint64_t result = qword_26B1808E0;
  if (!qword_26B1808E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24CA8480C()
{
  sub_24CA4EBE0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

ValueMetadata *type metadata accessor for FileLockError()
{
  return &type metadata for FileLockError;
}

uint64_t sub_24CA848C4()
{
  uint64_t v2 = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180870);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CA86020();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = OBJC_IVAR____TtC8Dendrite8FileLock_handle;
  uint64_t result = *(void *)(v2 + OBJC_IVAR____TtC8Dendrite8FileLock_handle);
  if (!result)
  {
    sub_24CA4EE40(v2 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL, (uint64_t)v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    {
      sub_24CA4D98C((uint64_t)v5);
      sub_24CA7CD8C();
      swift_allocError();
      *(_DWORD *)uint64_t v15 = 0;
      *(unsigned char *)(v15 + 4) = 1;
      return swift_willThrow();
    }
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    sub_24CA84B54();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    id v16 = sub_24CA8458C((uint64_t)v10);
    if (v1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
    else
    {
      id v17 = v16;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      unint64_t v18 = *(void **)(v2 + v13);
      *(void *)(v2 + v13) = v17;

      uint64_t result = *(void *)(v2 + v13);
      if (!result)
      {
        sub_24CA7CD8C();
        swift_allocError();
        *(_DWORD *)uint64_t v19 = 0;
        *(unsigned char *)(v19 + 4) = 1;
        return swift_willThrow();
      }
    }
  }
  return result;
}

unint64_t sub_24CA84B54()
{
  unint64_t result = qword_26B180A90;
  if (!qword_26B180A90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B180A90);
  }
  return result;
}

void PBDataWriter.writeSubgroup(tag:writeData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (objc_class *)type metadata accessor for BlockShimForPBCodable();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error] = 0;
  uint64_t v7 = &v6[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_block];
  *(void *)uint64_t v7 = a2;
  *((void *)v7 + 1) = a3;
  v12.receiver = v6;
  v12.super_class = v5;
  swift_retain();
  uint64_t v8 = (char *)objc_msgSendSuper2(&v12, sel_init);
  if (v8)
  {
    uint64_t v9 = v8;
    PBDataWriterWriteSubgroup();
    uint64_t v10 = *(void **)&v9[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error];
    if (v10)
    {
      id v11 = v10;
      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for BlockShimForPBCodable()
{
  return self;
}

void ProtoCodable.serialize()(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62230]), sel_init);
  if (v5)
  {
    uint64_t v6 = v5;
    (*(void (**)(id, uint64_t, uint64_t))(a2 + 16))(v5, a1, a2);
    if (v2)
    {
    }
    else
    {
      id v8 = objc_msgSend(v6, sel_immutableData);
      if (v8)
      {
        uint64_t v9 = v8;
        sub_24CA86090();
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    sub_24CA84DAC();
    swift_allocError();
    void *v7 = 0xD000000000000017;
    v7[1] = 0x800000024CA8B8D0;
    swift_willThrow();
  }
}

unint64_t sub_24CA84DAC()
{
  unint64_t result = qword_269807DF8;
  if (!qword_269807DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269807DF8);
  }
  return result;
}

void static ProtoCodable.deserialize(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v11 = objc_allocWithZone(MEMORY[0x263F62228]);
  sub_24CA497DC(a1, a2);
  objc_super v12 = (void *)sub_24CA86080();
  sub_24CA4986C(a1, a2);
  id v13 = objc_msgSend(v11, sel_initWithData_, v12);

  if (v13)
  {
    (*(void (**)(id, uint64_t, uint64_t))(a4 + 24))(v13, a3, a4);
    if (!v5) {
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a5, 0, 1, a3);
    }
  }
  else
  {
    sub_24CA84DAC();
    swift_allocError();
    void *v14 = 0xD000000000000017;
    v14[1] = 0x800000024CA8B8F0;
    swift_willThrow();
  }
}

id sub_24CA850EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlockShimForPBCodable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t PBDataWriter.writeSubmessage(tag:writeData:)(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = PBDataWriterPlaceMark();
  uint64_t result = a2(v4);
  if (!v2) {
    return PBDataWriterRecallMark();
  }
  return result;
}

uint64_t PBDataWriter.write(submessage:forTag:)(void *a1)
{
  uint64_t v3 = v1;
  PBDataWriterPlaceMark();
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v3, v5, v6);
  if (!v2) {
    return PBDataWriterRecallMark();
  }
  return result;
}

uint64_t PBDataWriter.write(_:forTag:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t __src = sub_24CA86110();
  char v19 = v5;
  char v20 = v6;
  char v21 = v7;
  char v22 = v8;
  char v23 = v9;
  char v24 = v10;
  char v25 = v11;
  char v26 = v12;
  uint64_t v13 = sub_24CA6F4F4(&__src, 16);
  unint64_t v15 = v14;
  id v16 = (void *)sub_24CA86080();
  objc_msgSend(v3, sel_writeData_forTag_, v16, a2);

  return sub_24CA4986C(v13, v15);
}

id PBDataWriter.write(_:forTag:)(uint64_t a1, uint64_t a2)
{
  sub_24CA860D0();
  return objc_msgSend(v2, sel_writeDouble_forTag_, a2);
}

uint64_t PBDataReader.readUUID()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B180838);
  MEMORY[0x270FA5388](v3 - 8);
  char v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v1, sel_readData);
  if (v6)
  {
    char v7 = v6;
    uint64_t v8 = sub_24CA86090();
    unint64_t v10 = v9;

    unint64_t v11 = v10 >> 62;
    switch(v10 >> 62)
    {
      case 1uLL:
        LODWORD(v12) = HIDWORD(v8) - v8;
        if (__OFSUB__(HIDWORD(v8), v8))
        {
          __break(1u);
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
        uint64_t v12 = (int)v12;
LABEL_7:
        if (v12 == 16)
        {
          if (!v11)
          {
            sub_24CA86100();
            goto LABEL_22;
          }
          if (v11 != 1)
          {
            uint64_t v19 = *(void *)(v8 + 16);
            swift_retain();
            swift_retain();
            if (!sub_24CA85F00())
            {
LABEL_29:
              sub_24CA85F20();
              __break(1u);
              JUMPOUT(0x24CA857C0);
            }
            if (!__OFSUB__(v19, sub_24CA85F30()))
            {
              sub_24CA85F20();
              sub_24CA86100();
              swift_release();
              swift_release();
              goto LABEL_22;
            }
            goto LABEL_26;
          }
          if ((int)v8 <= v8 >> 32)
          {
            sub_24CA497DC(v8, v10);
            if (!sub_24CA85F00())
            {
LABEL_28:
              sub_24CA85F20();
              __break(1u);
              goto LABEL_29;
            }
            if (!__OFSUB__((int)v8, sub_24CA85F30()))
            {
              sub_24CA85F20();
              sub_24CA86100();
              sub_24CA4986C(v8, v10);
LABEL_22:
              sub_24CA4986C(v8, v10);
              uint64_t v20 = sub_24CA86130();
              (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v5, 0, 1, v20);
              return sub_24CA72264((uint64_t)v5, a1);
            }
LABEL_27:
            __break(1u);
            goto LABEL_28;
          }
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
LABEL_14:
        sub_24CA4986C(v8, v10);
        break;
      case 2uLL:
        uint64_t v14 = *(void *)(v8 + 16);
        uint64_t v13 = *(void *)(v8 + 24);
        BOOL v15 = __OFSUB__(v13, v14);
        uint64_t v12 = v13 - v14;
        if (!v15) {
          goto LABEL_7;
        }
        goto LABEL_24;
      case 3uLL:
        goto LABEL_14;
      default:
        uint64_t v12 = BYTE6(v10);
        goto LABEL_7;
    }
  }
  uint64_t v16 = sub_24CA86130();
  id v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  return v17(a1, 1, 1, v16);
}

uint64_t PBDataReader.readDate()@<X0>(uint64_t a1@<X8>)
{
  objc_msgSend(v1, sel_readDouble);
  sub_24CA860C0();
  uint64_t v3 = sub_24CA860E0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(a1, 0, 1, v3);
}

uint64_t PBDataReader.readFields<A>(each:)(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = v4;
  uint64_t v21 = a2;
  uint64_t v22 = a4;
  uint64_t v20 = a1;
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v8 = sub_24CA86520();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v10);
  BOOL v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (uint64_t)objc_msgSend(v6, sel_hasMoreData);
  if (result)
  {
    uint64_t v18 = v9;
    uint64_t v19 = v8;
    while (1)
    {
      int v25 = 0;
      char v24 = 0;
      objc_msgSend(v6, sel_readTag_type_, &v25, &v24, v18, v19);
      uint64_t result = (uint64_t)objc_msgSend(v6, sel_hasError);
      if (result) {
        break;
      }
      if (v24 == 4) {
        return result;
      }
      int v23 = v25;
      sub_24CA863F0();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, a3) == 1)
      {
        (*(void (**)(char *, uint64_t))(v18 + 8))(v12, v19);
        break;
      }
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, a3);
      v20(v15);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, a3);
      if (!v5)
      {
        uint64_t result = (uint64_t)objc_msgSend(v6, sel_hasMoreData);
        if (result) {
          continue;
        }
      }
      return result;
    }
    sub_24CA84DAC();
    swift_allocError();
    *id v17 = 0;
    v17[1] = 0;
    return swift_willThrow();
  }
  return result;
}

id PBDataReader.readSubmessage(readBody:)(uint64_t (*a1)(id))
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0;
  v4[1] = 0;
  id result = (id)a1(objc_msgSend(v1, sel_mark_, v4));
  if (!v2) {
    return objc_msgSend(v1, sel_recall_, v4);
  }
  return result;
}

id PBDataReader.readSubmessage<A>(ofType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v8[2] = *MEMORY[0x263EF8340];
  v8[0] = 0;
  v8[1] = 0;
  objc_msgSend(v4, sel_mark_, v8);
  (*(void (**)(void *, uint64_t, uint64_t))(a3 + 24))(v4, a2, a3);
  return objc_msgSend(v4, sel_recall_, v8);
}

void *initializeBufferWithCopyOfBuffer for ProtoCodableError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ProtoCodableError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ProtoCodableError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ProtoCodableError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProtoCodableError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ProtoCodableError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)id result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)id result = a2 - 0x7FFFFFFF;
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
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_24CA85DE4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24CA85DFC(void *result, int a2)
{
  if (a2 < 0)
  {
    *id result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProtoCodableError()
{
  return &type metadata for ProtoCodableError;
}

uint64_t dispatch thunk of ProtoCodable.write(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static ProtoCodable.read(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_24CA85E80()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24CA85E90()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24CA85EA0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24CA85EB0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24CA85EC0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24CA85ED0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24CA85EE0()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_24CA85EF0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24CA85F00()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24CA85F10()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_24CA85F20()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24CA85F30()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24CA85F40()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24CA85F50()
{
  return MEMORY[0x270EEEEF0]();
}

uint64_t sub_24CA85F60()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_24CA85F70()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24CA85F80()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_24CA85F90()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_24CA85FA0()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_24CA85FB0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_24CA85FC0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_24CA85FD0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24CA85FE0()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t sub_24CA85FF0()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_24CA86000()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_24CA86010()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_24CA86020()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24CA86030()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_24CA86040()
{
  return MEMORY[0x270EEFFE0]();
}

uint64_t sub_24CA86050()
{
  return MEMORY[0x270EEFFE8]();
}

uint64_t sub_24CA86060()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_24CA86070()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24CA86080()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24CA86090()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24CA860A0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_24CA860B0()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_24CA860C0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_24CA860D0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_24CA860E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24CA860F0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24CA86100()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_24CA86110()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_24CA86120()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24CA86130()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24CA86140()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24CA86150()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CA86160()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CA86170()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_24CA86180()
{
  return MEMORY[0x270FA08A8]();
}

uint64_t sub_24CA86190()
{
  return MEMORY[0x270FA2C28]();
}

uint64_t sub_24CA861A0()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_24CA861B0()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_24CA861C0()
{
  return MEMORY[0x270FA0A30]();
}

uint64_t sub_24CA861D0()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_24CA861E0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24CA861F0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24CA86200()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24CA86210()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24CA86220()
{
  return MEMORY[0x270EF1890]();
}

uint64_t sub_24CA86230()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CA86240()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24CA86250()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24CA86260()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CA86270()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_24CA86280()
{
  return MEMORY[0x270EF1A18]();
}

uint64_t sub_24CA86290()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24CA862A0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24CA862B0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CA862C0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24CA862D0()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_24CA862E0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24CA862F0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24CA86300()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24CA86310()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24CA86320()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CA86330()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CA86340()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24CA86350()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24CA86360()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_24CA86370()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24CA86380()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24CA86390()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24CA863A0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24CA863B0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24CA863C0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24CA863D0()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_24CA863E0()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_24CA863F0()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_24CA86400()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24CA86410()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CA86420()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24CA86430()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CA86440()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24CA86450()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CA86460()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CA86470()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_24CA86480()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24CA86490()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CA864A0()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_24CA864B0()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_24CA864C0()
{
  return MEMORY[0x270FA0F38]();
}

uint64_t sub_24CA864D0()
{
  return MEMORY[0x270FA0F40]();
}

uint64_t sub_24CA864E0()
{
  return MEMORY[0x270FA0FA0]();
}

uint64_t sub_24CA864F0()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_24CA86500()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_24CA86510()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24CA86520()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CA86530()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24CA86540()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CA86550()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CA86560()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24CA86570()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24CA86580()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24CA86590()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24CA865A0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24CA865B0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24CA865C0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CA865D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CA865E0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24CA865F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CA86600()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CA86610()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24CA86620()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CA86630()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CA86650()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_24CA86660()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_24CA86670()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24CA86680()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CA866A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CA866B0()
{
  return MEMORY[0x270F9FA28]();
}

uint64_t sub_24CA866C0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24CA866D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CA866E0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CA866F0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CA86700()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CA86710()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CA86720()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CA86730()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CA86740()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24CA86750()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24CA86760()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CA86770()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24CA86780()
{
  return MEMORY[0x270F9FD98]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4280]();
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE18]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE48]();
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x270EF2BD0](bytes);
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x270F58528]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x270F58530]();
}

uint64_t PBDataWriterWriteSubgroup()
{
  return MEMORY[0x270F58598]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9640](__handle, __symbol);
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED99A0](*(void *)&a1, *(void *)&a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B38](*(void *)&a1, a2);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA5A0](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5D8](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F0](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x270F9B6D0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
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

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_unownedRelease()
{
  return MEMORY[0x270FA0610]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x270FA0618]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x270FA0620]();
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