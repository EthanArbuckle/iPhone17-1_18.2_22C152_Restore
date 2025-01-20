uint64_t sub_250C3093C()
{
  uint64_t v1;

  v1 = sub_250C35270();
  __swift_allocate_value_buffer(v1, qword_269AFCDB0);
  __swift_project_value_buffer(v1, (uint64_t)qword_269AFCDB0);
  sub_250C35310();
  sub_250C35310();
  return sub_250C35260();
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_250C30AEC()
{
  if (qword_269AFCB20 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_250C35270();
  return __swift_project_value_buffer(v0, (uint64_t)qword_269AFCDB0);
}

uint64_t sub_250C30B5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_250C30AEC();
  uint64_t v1 = sub_250C35270();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t static HeadphoneUITestDeviceProvider.== infix(_:_:)()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v1 = sub_250C35320();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

void *HeadphoneUITestDeviceProvider.hash(into:)(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v6 = v1;
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = *(void *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_endAccess();
  v5[0] = v3;
  v5[1] = v4;
  sub_250C35460();
  result = v5;
  sub_250C30D70();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_250C30D70()
{
}

HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional __swiftcall HeadphoneUITestDeviceProvider.DeviceType.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 8212)
  {
    char v3 = 0;
    return (HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional)(v3 & 1);
  }
  if (rawValue == 8214)
  {
    char v3 = 1;
    return (HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional)(v3 & 1);
  }
  return (HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional)2;
}

uint64_t HeadphoneUITestDeviceProvider.DeviceType.rawValue.getter(char a1)
{
  if (a1) {
    return 8214;
  }
  else {
    return 8212;
  }
}

uint64_t sub_250C30E54()
{
  return sub_250C35450() & 1;
}

uint64_t sub_250C30EA0()
{
  return sub_250C35370();
}

uint64_t sub_250C30EE0()
{
  return sub_250C35390();
}

uint64_t sub_250C30F28()
{
  return sub_250C35380();
}

HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional sub_250C30F70@<W0>(Swift::Int *a1@<X0>, HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional *a2@<X8>)
{
  result.value = HeadphoneUITestDeviceProvider.DeviceType.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_250C30FA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HeadphoneUITestDeviceProvider.DeviceType.rawValue.getter(*v1 & 1);
  *a1 = result;
  return result;
}

uint64_t sub_250C30FD4()
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v0 + 16);
  swift_retain();
  swift_endAccess();
  if (v5) {
    return v5;
  }
  sub_250C35240();
  uint64_t v2 = sub_250C35230();
  swift_retain();
  swift_beginAccess();
  *(void *)(v4 + 16) = v2;
  swift_release();
  swift_endAccess();
  return v2;
}

uint64_t sub_250C310C8(uint64_t a1)
{
  swift_retain();
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_250C3113C(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_250C30FD4();
  return sub_250C3118C;
}

uint64_t sub_250C3118C(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_250C310C8(*a1);
  }
  uint64_t v3 = *a1;
  swift_retain();
  sub_250C310C8(v3);
  return swift_release();
}

uint64_t variable initialization expression of HeadphoneUITestDeviceProvider.$__lazy_storage_$_replayData()
{
  return 0;
}

uint64_t variable initialization expression of HeadphoneUITestDeviceProvider.deviceType()
{
  return 2;
}

uint64_t sub_250C3120C()
{
  swift_beginAccess();
  unsigned int v2 = *(unsigned __int8 *)(v0 + 24);
  swift_endAccess();
  return v2;
}

uint64_t sub_250C31258(char a1)
{
  swift_beginAccess();
  *(unsigned char *)(v1 + 24) = a1;
  return swift_endAccess();
}

uint64_t (*sub_250C312A4())()
{
  return sub_250C31300;
}

uint64_t sub_250C31300()
{
  return swift_endAccess();
}

id variable initialization expression of HeadphoneUITestDeviceProvider.defaults()
{
  sub_250C31424();
  uint64_t v0 = sub_250C35310();
  id v4 = sub_250C3148C(v0, v1);
  if (v4) {
    return v4;
  }
  sub_250C35430();
  __break(1u);
  return (id)v3;
}

unint64_t sub_250C31424()
{
  uint64_t v2 = qword_269AFCA60;
  if (!qword_269AFCA60)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_269AFCA60);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_250C3148C(uint64_t a1, uint64_t a2)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_250C34618(a1, a2);
}

void *sub_250C314D4()
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v0 + 32);
  id v1 = v3;
  swift_endAccess();
  return v3;
}

void sub_250C31524(void *a1)
{
  id v2 = a1;
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;

  swift_endAccess();
}

uint64_t (*sub_250C31584())()
{
  return sub_250C31300;
}

uint64_t variable initialization expression of HeadphoneUITestDeviceProvider.randomHexAddress()
{
  sub_250C35310();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCA68);
  sub_250C35440();
  id v4 = v0;
  arc4random();
  uint64_t v2 = MEMORY[0x263F8D6C8];
  v4[3] = MEMORY[0x263F8D6C8];
  uint64_t v3 = MEMORY[0x263F8D750];
  v4[4] = MEMORY[0x263F8D750];
  sub_250C317D4();
  sub_250C31850();
  sub_250C318CC();
  sub_250C353A0();
  arc4random();
  v4[8] = v2;
  v4[9] = v3;
  sub_250C353A0();
  sub_250C31948();
  uint64_t v5 = sub_250C35300();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

unint64_t sub_250C317D4()
{
  uint64_t v2 = qword_269AFCA70;
  if (!qword_269AFCA70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCA70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_250C31850()
{
  uint64_t v2 = qword_269AFCA78;
  if (!qword_269AFCA78)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCA78);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_250C318CC()
{
  uint64_t v2 = qword_269AFCA80;
  if (!qword_269AFCA80)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCA80);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_250C31948()
{
}

uint64_t sub_250C3198C()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_250C319E8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_250C31A58())()
{
  return sub_250C31300;
}

uint64_t HeadphoneUITestDeviceProvider.__allocating_init(withBaseDeviceType:)(char a1)
{
  return HeadphoneUITestDeviceProvider.init(withBaseDeviceType:)(a1 & 1);
}

uint64_t HeadphoneUITestDeviceProvider.init(withBaseDeviceType:)(char a1)
{
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 24) = 2;
  sub_250C31424();
  uint64_t v2 = sub_250C35310();
  id v14 = sub_250C3148C(v2, v3);
  if (v14)
  {
    *(void *)(v13 + 32) = v14;
    sub_250C35310();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCA68);
    sub_250C35440();
    v9 = v4;
    arc4random();
    uint64_t v7 = MEMORY[0x263F8D6C8];
    v9[3] = MEMORY[0x263F8D6C8];
    uint64_t v8 = MEMORY[0x263F8D750];
    v9[4] = MEMORY[0x263F8D750];
    sub_250C317D4();
    sub_250C31850();
    sub_250C318CC();
    sub_250C353A0();
    arc4random();
    v9[8] = v7;
    v9[9] = v8;
    sub_250C353A0();
    sub_250C31948();
    uint64_t v10 = sub_250C35300();
    uint64_t v11 = v5;
    swift_bridgeObjectRelease();
    *(void *)(v13 + 40) = v10;
    *(void *)(v13 + 48) = v11;
    swift_beginAccess();
    *(unsigned char *)(v13 + 24) = a1 & 1;
    swift_endAccess();
    sub_250C30FD4();
    HeadphoneUITestDeviceProvider.DeviceType.rawValue.getter(a1 & 1);
    sub_250C35220();
    swift_release();
    return v13;
  }
  else
  {
    uint64_t result = sub_250C35430();
    __break(1u);
  }
  return result;
}

uint64_t HeadphoneUITestDeviceProvider.applyDeviceColor(_:)()
{
  sub_250C30FD4();
  sub_250C31EE0();
  sub_250C31F5C();
  sub_250C31FD8();
  sub_250C35360();
  sub_250C35190();
  swift_release();
  swift_retain();
  return v1;
}

unint64_t sub_250C31EE0()
{
  uint64_t v2 = qword_269AFCA88;
  if (!qword_269AFCA88)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCA88);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_250C31F5C()
{
  uint64_t v2 = qword_269AFCA90;
  if (!qword_269AFCA90)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCA90);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_250C31FD8()
{
  uint64_t v2 = qword_269AFCA98;
  if (!qword_269AFCA98)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCA98);
    return WitnessTable;
  }
  return v2;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryChargingCase(_:)()
{
  sub_250C30FD4();
  sub_250C351D0();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryChargingLeft(_:)()
{
  sub_250C30FD4();
  sub_250C351E0();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryChargingRight(_:)()
{
  sub_250C30FD4();
  sub_250C35210();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryChargingMain(_:)()
{
  sub_250C30FD4();
  sub_250C351F0();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryLevelCase(_:)()
{
  sub_250C30FD4();
  sub_250C351A0();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryLevelLeft(_:)()
{
  sub_250C30FD4();
  sub_250C351B0();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryLevelRight(_:)()
{
  sub_250C30FD4();
  sub_250C35200();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryLevelMain(_:)()
{
  sub_250C30FD4();
  sub_250C351C0();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyName(_:)()
{
  sub_250C30FD4();
  swift_bridgeObjectRetain();
  sub_250C35180();
  swift_release();
  swift_retain();
  return v1;
}

Swift::Void __swiftcall HeadphoneUITestDeviceProvider.apply()()
{
  sub_250C35170();
  sub_250C35160();
  sub_250C30FD4();
  sub_250C35240();
  sub_250C327A0();
  uint64_t v9 = sub_250C35150();
  unint64_t v10 = v0;
  swift_release();
  swift_release();
  if ((v10 & 0xF000000000000000) != 0xF000000000000000)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAA8);
    sub_250C35440();
    uint64_t v5 = v1;
    swift_beginAccess();
    uint64_t v3 = v8[5];
    uint64_t v4 = v8[6];
    swift_bridgeObjectRetain();
    swift_endAccess();
    void *v5 = v3;
    v5[1] = v4;
    sub_250C32824(v9, v10);
    void v5[2] = v9;
    v5[3] = v10;
    sub_250C31948();
    uint64_t v7 = sub_250C352A0();
    swift_beginAccess();
    id v6 = (id)v8[4];
    id v2 = v6;
    swift_endAccess();
    (*(void (**)(uint64_t, void, void, id))(*v8 + 320))(v7, 0, 0, v6);

    swift_bridgeObjectRelease();
    sub_250C328B0(v9, v10);
  }
}

unint64_t sub_250C327A0()
{
  uint64_t v2 = qword_269AFCAA0;
  if (!qword_269AFCAA0)
  {
    sub_250C35240();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCAA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_250C32824(uint64_t a1, unint64_t a2)
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

uint64_t sub_250C328B0(uint64_t a1, unint64_t a2)
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

void HeadphoneUITestDeviceProvider.apply(withAction:)(void (*a1)(void))
{
  sub_250C35170();
  sub_250C35160();
  sub_250C30FD4();
  sub_250C35240();
  sub_250C327A0();
  uint64_t v13 = sub_250C35150();
  unint64_t v14 = v1;
  swift_release();
  swift_release();
  if ((v14 & 0xF000000000000000) != 0xF000000000000000)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAA8);
    sub_250C35440();
    id v6 = v2;
    swift_beginAccess();
    uint64_t v4 = v12[5];
    uint64_t v5 = v12[6];
    swift_bridgeObjectRetain();
    swift_endAccess();
    *id v6 = v4;
    v6[1] = v5;
    sub_250C32824(v13, v14);
    v6[2] = v13;
    v6[3] = v14;
    sub_250C31948();
    uint64_t v7 = sub_250C352A0();
    (*(void (**)(uint64_t, void, void))(*v12 + 320))(v7, 0, 0);
    swift_bridgeObjectRelease();
    sub_250C35440();
    unint64_t v10 = v3;
    swift_beginAccess();
    uint64_t v8 = v12[5];
    uint64_t v9 = v12[6];
    swift_bridgeObjectRetain();
    swift_endAccess();
    *unint64_t v10 = v8;
    v10[1] = v9;
    sub_250C32824(v13, v14);
    v10[2] = v13;
    v10[3] = v14;
    sub_250C31948();
    sub_250C352A0();
    a1();
    swift_bridgeObjectRelease();
    sub_250C328B0(v13, v14);
  }
}

void HeadphoneUITestDeviceProvider.apply(_:applicator:defaults:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, void *a4)
{
  sub_250C32E6C((uint64_t)a2);
  if (a2)
  {
    swift_bridgeObjectRetain();
    a2(a1);
    swift_bridgeObjectRelease();
    swift_release();
  }
  id v4 = a4;
  if (a4)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_250C35290();
    swift_bridgeObjectRelease();
    sub_250C35310();
    id v5 = (id)sub_250C352F0();
    swift_bridgeObjectRelease();
    objc_msgSend(a4, sel_setObject_forKey_, v6, v5);

    swift_unknownObjectRelease();
  }
}

uint64_t sub_250C32E6C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t HeadphoneUITestDeviceProvider.applyReturnData()()
{
  uint64_t v65 = 0;
  v57 = sub_250C34784;
  uint64_t v82 = 0;
  uint64_t v73 = 0;
  unint64_t v74 = 0;
  uint64_t v58 = sub_250C35270();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = v58 - 8;
  unint64_t v61 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  v62 = (char *)v18 - v61;
  uint64_t v82 = v0;
  sub_250C35170();
  uint64_t v64 = sub_250C35160();
  uint64_t v1 = sub_250C30FD4();
  v67 = &v81;
  uint64_t v81 = v1;
  uint64_t v66 = sub_250C35240();
  sub_250C327A0();
  uint64_t v2 = sub_250C35150();
  uint64_t v68 = 0;
  uint64_t v69 = v2;
  unint64_t v70 = v3;
  uint64_t v71 = 0;
  unint64_t v53 = v3;
  uint64_t v52 = v2;
  swift_release();
  swift_release();
  uint64_t v54 = v52;
  unint64_t v55 = v53;
  uint64_t v56 = v68;
  uint64_t v49 = v68;
  unint64_t v50 = v53;
  uint64_t v51 = v52;
  if ((v53 & 0xF000000000000000) == 0xF000000000000000)
  {
    uint64_t v11 = v62;
    uint64_t v12 = sub_250C30AEC();
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v11, v12, v58);
    v35 = sub_250C35250();
    int v34 = sub_250C353D0();
    v32 = &v79;
    uint64_t v79 = 2;
    unint64_t v30 = sub_250C31EE0();
    unint64_t v31 = sub_250C31F5C();
    sub_250C31FD8();
    sub_250C35360();
    uint32_t v33 = v80;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAB0);
    uint64_t v36 = sub_250C35440();
    if (os_log_type_enabled(v35, (os_log_type_t)v34))
    {
      uint64_t v13 = v49;
      v20 = (uint8_t *)sub_250C35410();
      v18[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAB8);
      uint64_t v19 = 0;
      uint64_t v21 = sub_250C346C8(0);
      uint64_t v22 = sub_250C346C8(v19);
      v26 = &v78;
      v78 = v20;
      v27 = &v77;
      uint64_t v77 = v21;
      v24 = &v76;
      uint64_t v76 = v22;
      unsigned int v23 = 0;
      sub_250C34724(0, &v78);
      sub_250C34724(v23, v26);
      uint64_t v75 = v36;
      v25 = v18;
      MEMORY[0x270FA5388](v18);
      unint64_t v14 = v27;
      v15 = &v18[-6];
      v28 = &v18[-6];
      v15[2] = v26;
      v15[3] = v14;
      v15[4] = v16;
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAC0);
      sub_250C347B4();
      sub_250C35350();
      if (v13)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_250C2F000, v35, (os_log_type_t)v34, "HeadphoneManager-Replay: applyReturnData encode data failed!", v20, v33);
        v18[5] = 0;
        sub_250C348B0(v21);
        sub_250C348B0(v22);
        sub_250C353F0();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v59 + 8))(v62, v58);
    return sub_250C35280();
  }
  else
  {
    uint64_t v47 = v51;
    unint64_t v48 = v50;
    unint64_t v43 = v50;
    uint64_t v44 = v51;
    uint64_t v73 = v51;
    unint64_t v74 = v50;
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAA8);
    uint64_t v41 = sub_250C35440();
    v40 = v4;
    v37 = &v72;
    swift_beginAccess();
    uint64_t v38 = *(void *)(v63 + 40);
    uint64_t v39 = *(void *)(v63 + 48);
    swift_bridgeObjectRetain();
    swift_endAccess();
    uint64_t v5 = v39;
    uint64_t v6 = v40;
    uint64_t v7 = v44;
    unint64_t v8 = v43;
    void *v40 = v38;
    v6[1] = v5;
    sub_250C32824(v7, v8);
    uint64_t v9 = v40;
    unint64_t v10 = v43;
    v40[2] = v44;
    v9[3] = v10;
    sub_250C31948();
    uint64_t v45 = sub_250C352A0();
    sub_250C328B0(v44, v43);
    return v45;
  }
}

uint64_t HeadphoneUITestDeviceProvider.store(in:)()
{
  return swift_release();
}

void HeadphoneUITestDeviceProvider.applyAll(inSet:applicator:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  unint64_t v10 = *(void **)(v3 + 32);
  id v4 = v10;
  swift_endAccess();
  if (v10)
  {
    uint64_t v5 = *a1;
    swift_bridgeObjectRetain();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)v9 + 352))(v5, v10, a2, a3);
    swift_bridgeObjectRelease();
  }
}

uint64_t HeadphoneUITestDeviceProvider.apply(valuesForContainer:defaults:applicator:)(uint64_t a1, void *a2, void (*a3)())
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAD8);
  sub_250C34920();
  sub_250C35330();
  sub_250C35280();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAE8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAF0);
  sub_250C349A4();
  sub_250C35340();
  sub_250C34A28();
  sub_250C352C0();
  uint64_t v5 = sub_250C352B0();
  swift_bridgeObjectRelease();
  if (v5 > 0)
  {
    id v3 = a2;
    (*(void (**)(uint64_t, void, void, void *))(*(void *)v8 + 320))(v9, 0, 0, a2);

    sub_250C32E6C((uint64_t)a3);
    if (a3)
    {
      swift_bridgeObjectRetain();
      a3();
      swift_bridgeObjectRelease();
      swift_release();
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_250C33AD0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v64 = a2;
  uint64_t v66 = a1;
  uint64_t v74 = 0;
  uint64_t v65 = sub_250C34784;
  uint64_t v92 = 0;
  uint64_t v83 = 0;
  unint64_t v84 = 0;
  uint64_t v67 = sub_250C35270();
  uint64_t v68 = *(void *)(v67 - 8);
  uint64_t v69 = v67 - 8;
  unint64_t v70 = (*(void *)(v68 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v71 = (char *)&v20 - v70;
  uint64_t v72 = *v2;
  uint64_t v92 = v72;
  sub_250C35170();
  uint64_t v73 = sub_250C35160();
  uint64_t v3 = sub_250C30FD4();
  uint64_t v77 = &v91;
  uint64_t v91 = v3;
  uint64_t v75 = sub_250C35240();
  sub_250C327A0();
  id v4 = v76;
  uint64_t v5 = sub_250C35150();
  uint64_t v78 = (uint64_t)v4;
  uint64_t v79 = v5;
  unint64_t v80 = v6;
  uint64_t v81 = v4;
  if (v4)
  {
    id v21 = v81;
    uint64_t v22 = 0;
    unint64_t v23 = 0xF000000000000000;
    uint64_t v24 = 0;
    swift_release();
    swift_release();

    uint64_t v61 = v22;
    unint64_t v62 = v23;
    uint64_t v63 = v24;
  }
  else
  {
    unint64_t v60 = v80;
    uint64_t v59 = v79;
    swift_release();
    swift_release();
    uint64_t v61 = v59;
    unint64_t v62 = v60;
    uint64_t v63 = v78;
  }
  uint64_t v56 = v63;
  unint64_t v57 = v62;
  uint64_t v58 = v61;
  if ((v62 & 0xF000000000000000) == 0xF000000000000000)
  {
    uint64_t v7 = v71;
    uint64_t v8 = sub_250C30AEC();
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v7, v8, v67);
    uint64_t v52 = sub_250C35250();
    int v51 = sub_250C353E0();
    uint64_t v49 = &v89;
    uint64_t v89 = 2;
    unint64_t v47 = sub_250C31EE0();
    unint64_t v48 = sub_250C31F5C();
    sub_250C31FD8();
    sub_250C35360();
    uint32_t v50 = v90;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAB0);
    uint64_t v53 = sub_250C35440();
    if (os_log_type_enabled(v52, (os_log_type_t)v51))
    {
      unint64_t v30 = (uint8_t *)sub_250C35410();
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAB8);
      uint64_t v29 = 0;
      uint64_t v31 = sub_250C346C8(0);
      uint64_t v32 = sub_250C346C8(v29);
      uint64_t v36 = &v88;
      v88 = v30;
      v37 = &v87;
      uint64_t v87 = v31;
      int v34 = &v86;
      uint64_t v86 = v32;
      unsigned int v33 = 0;
      sub_250C34724(0, &v88);
      sub_250C34724(v33, v36);
      uint64_t v85 = v53;
      v35 = &v20;
      MEMORY[0x270FA5388](&v20);
      v15 = v37;
      uint64_t v16 = &v20 - 6;
      uint64_t v38 = &v20 - 6;
      v16[2] = (uint64_t)v36;
      v16[3] = (uint64_t)v15;
      v16[4] = v17;
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAC0);
      sub_250C347B4();
      uint64_t v18 = v56;
      sub_250C35350();
      uint64_t v40 = v18;
      if (v18)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_250C2F000, v52, (os_log_type_t)v51, "HeadphoneManager-Replay: apply valuesForContainer encode data failed!", v30, v50);
        uint64_t v26 = 0;
        sub_250C348B0(v31);
        sub_250C348B0(v32);
        sub_250C353F0();
        swift_bridgeObjectRelease();
        uint64_t v27 = v40;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v27 = v56;
    }
    uint64_t v25 = v27;

    (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v67);
    uint64_t v19 = v64;
    uint64_t result = v25;
    *uint64_t v64 = 0;
    v19[1] = 0;
    v19[2] = 0;
    v19[3] = 0;
    uint64_t v46 = result;
  }
  else
  {
    uint64_t v54 = v58;
    unint64_t v55 = v57;
    unint64_t v45 = v57;
    uint64_t v44 = v58;
    uint64_t v83 = v58;
    unint64_t v84 = v57;
    sub_250C32824(v58, v57);
    uint64_t v41 = &v82;
    swift_beginAccess();
    uint64_t v42 = *(void *)(v72 + 40);
    uint64_t v43 = *(void *)(v72 + 48);
    swift_bridgeObjectRetain();
    swift_endAccess();
    uint64_t v9 = v42;
    unint64_t v10 = v64;
    uint64_t v11 = v43;
    uint64_t v12 = v44;
    unint64_t v13 = v45;
    *uint64_t v64 = v44;
    v10[1] = v13;
    v10[2] = v9;
    v10[3] = v11;
    sub_250C328B0(v12, v13);
    uint64_t result = v56;
    uint64_t v46 = v56;
  }
  return result;
}

uint64_t sub_250C34220(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  sub_250C32824(v3, *((unint64_t *)&v3 + 1));
  swift_bridgeObjectRetain();
  sub_250C32824(v3, *((unint64_t *)&v3 + 1));
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AFCAF0);
  sub_250C352D0();
  swift_bridgeObjectRelease();
  return sub_250C328B0(v3, *((unint64_t *)&v3 + 1));
}

Swift::Void __swiftcall HeadphoneUITestDeviceProvider.resetAll()()
{
  swift_beginAccess();
  id v4 = *(void **)(v0 + 32);
  id v1 = v4;
  swift_endAccess();
  if (v4)
  {
    long long v3 = v4;
  }
  else
  {
    sub_250C35430();
    __break(1u);
  }
  sub_250C35310();
  id v2 = (id)sub_250C352F0();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_removeObjectForKey_, v2);
}

uint64_t HeadphoneUITestDeviceProvider.deinit()
{
  sub_250C34A54();
  sub_250C34A80((id *)(v0 + 32));
  sub_250C30D70();
  return v2;
}

uint64_t HeadphoneUITestDeviceProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t HeadphoneUITestDeviceProvider.hashValue.getter()
{
  return sub_250C35420();
}

uint64_t sub_250C34544()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 368))();
}

uint64_t sub_250C34594()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

uint64_t sub_250C345DC()
{
  return sub_250C352E0();
}

uint64_t sub_250C345F4()
{
  return static HeadphoneUITestDeviceProvider.== infix(_:_:)() & 1;
}

id sub_250C34618(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v6 = sub_250C352F0();
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v7, sel_initWithSuiteName_, v6);
  }
  else
  {
    id v2 = objc_msgSend(v7, sel_initWithSuiteName_, 0);
  }
  id v5 = v2;

  return v5;
}

uint64_t sub_250C346C8(uint64_t a1)
{
  if (a1) {
    return sub_250C35410();
  }
  else {
    return 0;
  }
}

uint64_t sub_250C34724(uint64_t result, unsigned char **a2)
{
  id v2 = *a2;
  *id v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_250C34738(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_250C34784(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_250C34738(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_250C347B4()
{
  uint64_t v2 = qword_269AFCAC8;
  if (!qword_269AFCAC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269AFCAC0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCAC8);
    return WitnessTable;
  }
  return v2;
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

uint64_t sub_250C348B0(uint64_t result)
{
  if (result)
  {
    sub_250C35400();
    return sub_250C353F0();
  }
  return result;
}

unint64_t sub_250C34920()
{
  uint64_t v2 = qword_269AFCAE0;
  if (!qword_269AFCAE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269AFCAD0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCAE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_250C349A4()
{
  uint64_t v2 = qword_269AFCAF8;
  if (!qword_269AFCAF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269AFCAE8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCAF8);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_250C34A28()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_250C34A54()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_250C34A80(id *a1)
{
}

uint64_t type metadata accessor for HeadphoneUITestDeviceProvider()
{
  return self;
}

unint64_t sub_250C34AD4()
{
  uint64_t v2 = qword_269AFCB00;
  if (!qword_269AFCB00)
  {
    type metadata accessor for HeadphoneUITestDeviceProvider();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCB00);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_250C34B58()
{
  return sub_250C34B70();
}

unint64_t sub_250C34B70()
{
  uint64_t v2 = qword_269AFCB08;
  if (!qword_269AFCB08)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCB08);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_250C34BF0()
{
  return sub_250C34C08();
}

unint64_t sub_250C34C08()
{
  uint64_t v2 = qword_269AFCB10;
  if (!qword_269AFCB10)
  {
    type metadata accessor for HeadphoneUITestDeviceProvider();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCB10);
    return WitnessTable;
  }
  return v2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HeadphoneUITestDeviceProvider.DeviceType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HeadphoneUITestDeviceProvider.DeviceType(unsigned char *result, unsigned int a2, unsigned int a3)
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

uint64_t sub_250C35090(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_250C350A0(unsigned char *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HeadphoneUITestDeviceProvider.DeviceType()
{
  return &type metadata for HeadphoneUITestDeviceProvider.DeviceType;
}

unint64_t sub_250C350C4()
{
  uint64_t v2 = qword_269AFCB18;
  if (!qword_269AFCB18)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_269AFCB18);
    return WitnessTable;
  }
  return v2;
}

void sub_250C35144()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_250C35150()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_250C35160()
{
  return MEMORY[0x270EEDF10]();
}

uint64_t sub_250C35170()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_250C35180()
{
  return MEMORY[0x270F30B20]();
}

uint64_t sub_250C35190()
{
  return MEMORY[0x270F30B28]();
}

uint64_t sub_250C351A0()
{
  return MEMORY[0x270F30B30]();
}

uint64_t sub_250C351B0()
{
  return MEMORY[0x270F30B38]();
}

uint64_t sub_250C351C0()
{
  return MEMORY[0x270F30B40]();
}

uint64_t sub_250C351D0()
{
  return MEMORY[0x270F30B48]();
}

uint64_t sub_250C351E0()
{
  return MEMORY[0x270F30B50]();
}

uint64_t sub_250C351F0()
{
  return MEMORY[0x270F30B58]();
}

uint64_t sub_250C35200()
{
  return MEMORY[0x270F30B60]();
}

uint64_t sub_250C35210()
{
  return MEMORY[0x270F30B68]();
}

uint64_t sub_250C35220()
{
  return MEMORY[0x270F30B70]();
}

uint64_t sub_250C35230()
{
  return MEMORY[0x270F30B78]();
}

uint64_t sub_250C35240()
{
  return MEMORY[0x270F30B80]();
}

uint64_t sub_250C35250()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_250C35260()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_250C35270()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_250C35280()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_250C35290()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_250C352A0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_250C352B0()
{
  return MEMORY[0x270F9D140]();
}

uint64_t sub_250C352C0()
{
  return MEMORY[0x270F9D160]();
}

uint64_t sub_250C352D0()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_250C352E0()
{
  return MEMORY[0x270F9D330]();
}

uint64_t sub_250C352F0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_250C35300()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_250C35310()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_250C35320()
{
  return MEMORY[0x270F9D6E8]();
}

uint64_t sub_250C35330()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_250C35340()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_250C35350()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_250C35360()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t sub_250C35370()
{
  return MEMORY[0x270F9DAE8]();
}

uint64_t sub_250C35380()
{
  return MEMORY[0x270F9DAF0]();
}

uint64_t sub_250C35390()
{
  return MEMORY[0x270F9DAF8]();
}

uint64_t sub_250C353A0()
{
  return MEMORY[0x270F9DB98]();
}

uint64_t sub_250C353B0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_250C353C0()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_250C353D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_250C353E0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_250C353F0()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_250C35400()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_250C35410()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_250C35420()
{
  return MEMORY[0x270F9E898]();
}

uint64_t sub_250C35430()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_250C35440()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t sub_250C35450()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_250C35460()
{
  return MEMORY[0x270F9FC58]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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