id DSLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  uint64_t vars8;

  v1 = a1;
  if (!v1)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    v6 = [NSString stringWithUTF8String:"NSString * _Nonnull DSLocalizedStringForKey(NSString * _Nonnull __strong)"];
    [v5 handleFailureInFunction:v6, @"DSLocalization.m", 33, @"Invalid parameter not satisfying: %@", @"key" file lineNumber description];
  }
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:v1 value:0 table:0];

  return v3;
}

id DSLocalizedStringWithFormatKey(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  if (!v9)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString * _Nonnull DSLocalizedStringWithFormatKey(NSString * _Nonnull __strong, ...)");
    [v14 handleFailureInFunction:v15, @"DSLocalization.m", 39, @"Invalid parameter not satisfying: %@", @"formatKey" file lineNumber description];
  }
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:v9 value:0 table:0];

  v12 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
  return v12;
}

uint64_t sub_24CC627B0()
{
  id v1 = objc_msgSend(v0, sel_availableOutputDevices);
  sub_24CC62E58();
  uint64_t v2 = sub_24CCBBF10();

  return v2;
}

id sub_24CC62808()
{
  return objc_msgSend(v0, sel_discoveryMode);
}

id sub_24CC62818(uint64_t a1)
{
  return objc_msgSend(v1, sel_setDiscoveryMode_, a1);
}

id (*sub_24CC6282C(void *a1))(uint64_t a1)
{
  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_discoveryMode);
  return sub_24CC62880;
}

id sub_24CC62880(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setDiscoveryMode_, *(void *)a1);
}

uint64_t dispatch thunk of ViewMirroringOutputDeviceDiscoveryCoordinating.availableOutputDevices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ViewMirroringOutputDeviceDiscoveryCoordinating.discoveryMode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ViewMirroringOutputDeviceDiscoveryCoordinating.discoveryMode.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ViewMirroringOutputDeviceDiscoveryCoordinating.discoveryMode.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void type metadata accessor for CFUserNotification(uint64_t a1)
{
}

void type metadata accessor for DSSGuestUserModeAppUnavailable(uint64_t a1)
{
}

void type metadata accessor for AVOutputContextSetOutputDeviceOptionsKey(uint64_t a1)
{
}

void sub_24CC62920(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24CC62968(uint64_t a1, uint64_t a2)
{
  return sub_24CC62AD4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24CC62980(uint64_t a1, id *a2)
{
  uint64_t result = sub_24CCBBE30();
  *a2 = 0;
  return result;
}

uint64_t sub_24CC629F8(uint64_t a1, id *a2)
{
  char v3 = sub_24CCBBE40();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24CC62A78@<X0>(uint64_t *a1@<X8>)
{
  sub_24CCBBE50();
  uint64_t v2 = sub_24CCBBE20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24CC62ABC(uint64_t a1, uint64_t a2)
{
  return sub_24CC62AD4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24CC62AD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24CCBBE50();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24CC62B18()
{
  sub_24CCBBE50();
  sub_24CCBBEA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC62B6C()
{
  sub_24CCBBE50();
  sub_24CCBC540();
  sub_24CCBBEA0();
  uint64_t v0 = sub_24CCBC570();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24CC62BE0()
{
  uint64_t v0 = sub_24CCBBE50();
  uint64_t v2 = v1;
  if (v0 == sub_24CCBBE50() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24CCBC480();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24CC62C6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24CCBBE20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24CC62CB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CCBBE50();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CC62CE0(uint64_t a1)
{
  uint64_t v2 = sub_24CC62DE0((unint64_t *)&qword_269821B10);
  uint64_t v3 = sub_24CC62DE0(&qword_269821B18);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24CC62D78()
{
  return sub_24CC62DE0(&qword_269821AF8);
}

uint64_t sub_24CC62DAC()
{
  return sub_24CC62DE0(&qword_269821B00);
}

uint64_t sub_24CC62DE0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AVOutputContextSetOutputDeviceOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CC62E24()
{
  return sub_24CC62DE0(&qword_269821B08);
}

unint64_t sub_24CC62E58()
{
  unint64_t result = qword_269821B20;
  if (!qword_269821B20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269821B20);
  }
  return result;
}

uint64_t sub_24CC62E98()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id static NSBundle.deviceSharingFramework.getter()
{
  _s30DeviceSharingFrameworkSentinelCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  return v1;
}

uint64_t _s30DeviceSharingFrameworkSentinelCMa()
{
  return self;
}

uint64_t sub_24CC62F28()
{
  if (qword_269821AD0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_269822EE0;
  id v1 = (void *)sub_24CCBBE20();
  LOBYTE(v0) = objc_msgSend((id)v0, sel_BOOLForKey_, v1);

  if (v0)
  {
    return MEMORY[0x270EF77F8]();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269821B98);
    sub_24CCBBC40();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_24CCBD340;
    sub_24CCBBC30();
    sub_24CCBBC20();
    sub_24CC6355C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269821BA8);
    sub_24CC635B4();
    return sub_24CCBC170();
  }
}

uint64_t sub_24CC630E4()
{
  uint64_t v31 = sub_24CCBBC90();
  uint64_t v29 = *(void *)(v31 - 8);
  uint64_t v0 = MEMORY[0x270FA5388](v31);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (uint64_t *)((char *)&v25 - v2);
  uint64_t v28 = sub_24CCBBC40();
  uint64_t v25 = *(void *)(v28 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v28);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v25 - v7;
  uint64_t v9 = sub_24CCBBC70();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v15 = (char *)&v25 - v14;
  if (qword_269821AD0 != -1) {
    swift_once();
  }
  v16 = (void *)qword_269822EE0;
  v17 = (void *)sub_24CCBBE20();
  LODWORD(v16) = objc_msgSend(v16, sel_BOOLForKey_, v17);

  if (v16) {
    sub_24CCBBC50();
  }
  else {
    sub_24CCBBC30();
  }
  v26 = v15;
  sub_24CC62F28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821B90);
  *uint64_t v3 = 0xD000000000000025;
  v3[1] = 0x800000024CCBE840;
  v18 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v27 = v9;
  v18(v13, v15, v9);
  uint64_t v19 = v25;
  uint64_t v20 = v28;
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v6, v8, v28);
  sub_24CCBBC80();
  uint64_t v21 = v29;
  uint64_t v22 = v31;
  (*(void (**)(void *, void, uint64_t))(v29 + 104))(v3, *MEMORY[0x263F14368], v31);
  sub_24CCBBB10();
  sub_24CCBBAD0();
  sub_24CCBBAB0();
  (*(void (**)(char *, void *, uint64_t))(v21 + 16))(v30, v3, v22);
  swift_allocObject();
  uint64_t v23 = sub_24CCBBCD0();
  (*(void (**)(void *, uint64_t))(v21 + 8))(v3, v22);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v26, v27);
  return v23;
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

unint64_t sub_24CC6355C()
{
  unint64_t result = qword_269821BA0;
  if (!qword_269821BA0)
  {
    sub_24CCBBC40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269821BA0);
  }
  return result;
}

unint64_t sub_24CC635B4()
{
  unint64_t result = qword_269821BB0;
  if (!qword_269821BB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269821BA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269821BB0);
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

uint64_t SharingInteractionControllerProtocol.hasPairedDevice()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC63748;
  return v7(a1, a2);
}

uint64_t sub_24CC63748(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4(0);
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24CC63880, 0, 0);
  }
}

uint64_t sub_24CC63880()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if ((v1 & 0xC000000000000001) != 0) {
    uint64_t v2 = sub_24CCBC200();
  }
  else {
    uint64_t v2 = *(void *)(v1 + 16);
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v3(v2 > 0);
}

uint64_t SharingInteractionController.unownedExecutor.getter()
{
  return sub_24CCBC0D0();
}

id *SharingInteractionController.__allocating_init()()
{
  return SharingInteractionController.init()();
}

id *SharingInteractionController.init()()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_24CCBC080();
  uint64_t v32 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_24CCBC0B0();
  MEMORY[0x270FA5388]();
  uint64_t v31 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CCBBD80();
  MEMORY[0x270FA5388]();
  uint64_t v29 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24CCBB890();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[4] = MEMORY[0x263F8EE80];
  uint64_t v12 = qword_269821AB0;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v8, (uint64_t)qword_269824828);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v13, v8);
  uint64_t v14 = sub_24CCBB870();
  os_log_type_t v15 = sub_24CCBC060();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v35 = v26;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v25 = v16 + 4;
    uint64_t v17 = sub_24CCBC5E0();
    uint64_t v28 = v3;
    uint64_t v33 = sub_24CC692DC(v17, v18, &v35);
    uint64_t v27 = v5;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    uint64_t v33 = sub_24CC692DC(0x292874696E69, 0xE600000000000000, &v35);
    uint64_t v5 = v27;
    uint64_t v3 = v28;
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v14, v15, "%s: %s", (uint8_t *)v16, 0x16u);
    uint64_t v19 = v26;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v19, -1, -1);
    MEMORY[0x2533103A0](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_24CC6C9EC(0, (unint64_t *)&qword_269821BC8);
  sub_24CCBBD50();
  uint64_t v35 = MEMORY[0x263F8EE78];
  sub_24CC69934(&qword_269821BD0, 255, MEMORY[0x263F8F198]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821BD8);
  sub_24CC69280();
  sub_24CCBC170();
  (*(void (**)(char *, void, uint64_t))(v32 + 104))(v5, *MEMORY[0x263F8F138], v3);
  uint64_t v20 = (void *)sub_24CCBC0C0();
  v1[3] = v20;
  id v21 = objc_allocWithZone(MEMORY[0x263F6C1D0]);
  id v22 = v20;
  v1[2] = objc_msgSend(v21, sel_initWithQueue_, v22);
  swift_release();
  v34.receiver = v1;
  v34.super_class = ObjectType;
  uint64_t v23 = (id *)objc_msgSendSuper2(&v34, sel_init);
  objc_msgSend(v23[2], sel_setDelegate_, v23);

  return v23;
}

uint64_t SharingInteractionController.isRemoteUnlockSupported()()
{
  *(void *)(v1 + 16) = v0;
  swift_getObjectType();
  sub_24CC69934(&qword_269821BF0, v2, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v4 = sub_24CCBBF40();
  return MEMORY[0x270FA2498](sub_24CC63F74, v4, v3);
}

uint64_t sub_24CC63F74()
{
  id v1 = objc_msgSend(*(id *)(*(void *)(v0 + 16) + 16), sel_isSupportedForType_, 11);
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t SharingInteractionController.unlock(withDeviceID:)(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = swift_getObjectType();
  sub_24CC69934(&qword_269821BF0, v4, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v6 = sub_24CCBBF40();
  v3[8] = v6;
  v3[9] = v5;
  return MEMORY[0x270FA2498](sub_24CC640A4, v6, v5);
}

uint64_t sub_24CC640A4()
{
  uint64_t v16 = v0;
  if (qword_269821AB0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824828);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v14 = v0[4];
    unint64_t v4 = v0[5];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    uint64_t v7 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v7, v8, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_24CC692DC(v14, v4, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CC60000, v2, v3, "%s: unlock(withDeviceID: %s)", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v6, -1, -1);
    MEMORY[0x2533103A0](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = v0[4];
  uint64_t v9 = v0[5];
  uint64_t v11 = swift_task_alloc();
  v0[10] = v11;
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[11] = v12;
  void *v12 = v0;
  v12[1] = sub_24CC64340;
  return sub_24CC64544((uint64_t)sub_24CC699A0, v11);
}

uint64_t sub_24CC64340()
{
  uint64_t v2 = (void *)*v1;
  v2[12] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[8];
    uint64_t v4 = v2[9];
    return MEMORY[0x270FA2498](sub_24CC6CAE0, v3, v4);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

void sub_24CC64478(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C1D8]), sel_init);
  uint64_t v3 = (void *)sub_24CCBBE20();
  objc_msgSend(v2, sel_setIdsDeviceID_, v3);

  id v4 = objc_msgSend(a1, sel_authenticateForType_withOptions_, 11, v2);
  sub_24CCBB500();
}

uint64_t sub_24CC64544(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v3[6] = swift_getObjectType();
  v3[7] = sub_24CC69934(&qword_269821BF0, v4, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v6 = sub_24CCBBF40();
  v3[8] = v6;
  v3[9] = v5;
  return MEMORY[0x270FA2498](sub_24CC64608, v6, v5);
}

uint64_t sub_24CC64608()
{
  uint64_t v13 = v0;
  if (qword_269821AB0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824828);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v12 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v6 = sub_24CCBC5E0();
    *(void *)(v0 + 16) = sub_24CC692DC(v6, v7, &v12);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v2, v3, "%s: Performing authentication manager request", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 80) = v8;
  long long v9 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v8 + 16) = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v8 + 32) = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v10;
  void *v10 = v0;
  v10[1] = sub_24CC64864;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_24CC64864()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_24CC64998;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_24CC64980;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_24CC64980()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24CC64998()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t SharingInteractionController.canAuthenticate(withDeviceID:)(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = swift_getObjectType();
  sub_24CC69934(&qword_269821BF0, v4, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v6 = sub_24CCBBF40();
  v3[8] = v6;
  v3[9] = v5;
  return MEMORY[0x270FA2498](sub_24CC64ABC, v6, v5);
}

uint64_t sub_24CC64ABC()
{
  uint64_t v16 = v0;
  if (qword_269821AB0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824828);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v14 = v0[4];
    unint64_t v4 = v0[5];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    uint64_t v7 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v7, v8, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_24CC692DC(v14, v4, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CC60000, v2, v3, "%s: canAuthenticate(withDeviceID: %s)", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v6, -1, -1);
    MEMORY[0x2533103A0](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = v0[4];
  uint64_t v9 = v0[5];
  uint64_t v11 = swift_task_alloc();
  v0[10] = v11;
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[11] = v12;
  void *v12 = v0;
  v12[1] = sub_24CC64D58;
  return sub_24CC64544((uint64_t)sub_24CC699A8, v11);
}

uint64_t sub_24CC64D58()
{
  uint64_t v2 = (void *)*v1;
  v2[12] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[8];
    uint64_t v4 = v2[9];
    return MEMORY[0x270FA2498](sub_24CC64998, v3, v4);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

void sub_24CC64E90(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C1D8]), sel_init);
  uint64_t v3 = (void *)sub_24CCBBE20();
  objc_msgSend(v2, sel_setIdsDeviceID_, v3);

  uint64_t v4 = (void *)sub_24CCBBE20();
  id v5 = objc_msgSend(a1, sel_canAuthenticateForType_withIDSDeviceID_, 11, v4);

  sub_24CCBB500();
}

uint64_t SharingInteractionController.listDevices()()
{
  v1[13] = v0;
  v1[14] = swift_getObjectType();
  id v2 = (void *)swift_task_alloc();
  v1[15] = v2;
  *id v2 = v1;
  v2[1] = sub_24CC65010;
  return sub_24CC65A40();
}

uint64_t sub_24CC65010(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(*v2 + 128) = a1;
  swift_task_dealloc();
  if (v1)
  {
    id v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v3 + 136) = v7;
    *uint64_t v7 = v4;
    v7[1] = sub_24CC65184;
    return SharingInteractionController.listPairedDevices()();
  }
}

uint64_t sub_24CC65184(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 144) = a1;
  *(void *)(v3 + 152) = v1;
  swift_task_dealloc();
  sub_24CC69934(&qword_269821BF0, v4, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v6 = sub_24CCBBF40();
  if (v1) {
    uint64_t v7 = sub_24CC659DC;
  }
  else {
    uint64_t v7 = sub_24CC65314;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

void sub_24CC65314()
{
  v69 = v0;
  uint64_t v1 = v0[18];
  unint64_t v2 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0) {
    uint64_t v3 = sub_24CCBC200();
  }
  else {
    uint64_t v3 = *(void *)(v1 + 16);
  }
  v64 = v0;
  if (v3)
  {
    v68 = (void *)MEMORY[0x263F8EE78];
    sub_24CC6A71C(0, v3 & ~(v3 >> 63), 0);
    if (v2)
    {
      uint64_t v4 = (void *)sub_24CCBC1A0();
      char v6 = 1;
    }
    else
    {
      uint64_t v4 = (void *)sub_24CC6B0B0(v0[18]);
      char v6 = v8 & 1;
    }
    id v65 = v4;
    uint64_t v66 = v5;
    char v67 = v6;
    if (v3 < 0)
    {
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
      return;
    }
    uint64_t v9 = v0 + 7;
    uint64_t v10 = &qword_269821C30;
    do
    {
      while (1)
      {
        sub_24CC6ADD8((uint64_t)v65, v66, v67, v0[18], v10);
        uint64_t v19 = v18;
        id v20 = objc_msgSend(v18, sel_uniqueIdentifier);
        uint64_t v21 = sub_24CCBBE50();
        uint64_t v23 = v22;

        v24 = v68;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24CC6A71C(0, v68[2] + 1, 1);
          v24 = v68;
        }
        unint64_t v26 = v24[2];
        unint64_t v25 = v24[3];
        if (v26 >= v25 >> 1)
        {
          sub_24CC6A71C(v25 > 1, v26 + 1, 1);
          v24 = v68;
        }
        v24[2] = v26 + 1;
        uint64_t v27 = &v24[2 * v26];
        v27[4] = v21;
        v27[5] = v23;
        if (v2) {
          break;
        }
        uint64_t v11 = (void *)sub_24CC6ACE0((int64_t)v65, v66, v67, v0[18]);
        uint64_t v13 = v12;
        uint64_t v14 = v10;
        char v16 = v15;
        sub_24CC6B048((uint64_t)v65, v66, v67);
        id v65 = v11;
        uint64_t v66 = v13;
        char v17 = v16 & 1;
        uint64_t v10 = v14;
        uint64_t v0 = v64;
        char v67 = v17;
        if (!--v3) {
          goto LABEL_21;
        }
      }
      if ((v67 & 1) == 0) {
        goto LABEL_80;
      }
      if (sub_24CCBC1C0()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269821C28);
      uint64_t v28 = (void (*)(void *, void))sub_24CCBC020();
      sub_24CCBC250();
      v28(v9, 0);
      --v3;
    }
    while (v3);
LABEL_21:
    sub_24CC6B048((uint64_t)v65, v66, v67);
    uint64_t v7 = v68;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v29 = v0[16];
  v68 = (void *)v0[18];
  v59 = v7;
  if ((v29 & 0xC000000000000001) != 0)
  {
    sub_24CCBC1B0();
    sub_24CC6C9EC(0, &qword_269821C30);
    sub_24CC6B054(&qword_269821C38, &qword_269821C30);
    uint64_t v0 = v64;
    sub_24CCBC030();
    uint64_t v29 = v64[2];
    uint64_t v63 = v64[3];
    uint64_t v30 = v64[4];
    uint64_t v31 = v64[5];
    unint64_t v32 = v64[6];
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v33 = -1 << *(unsigned char *)(v29 + 32);
    uint64_t v63 = v29 + 56;
    uint64_t v34 = ~v33;
    uint64_t v35 = -v33;
    if (v35 < 64) {
      uint64_t v36 = ~(-1 << v35);
    }
    else {
      uint64_t v36 = -1;
    }
    unint64_t v32 = v36 & *(void *)(v29 + 56);
    uint64_t v30 = v34;
  }
  v60 = v0 + 12;
  v61 = (id *)(v0 + 11);
  int64_t v62 = (unint64_t)(v30 + 64) >> 6;
  v58 = v7 + 9;
  if ((v29 & 0x8000000000000000) == 0) {
    goto LABEL_32;
  }
LABEL_50:
  v37 = v0;
  uint64_t v45 = sub_24CCBC230();
  if (v45)
  {
    uint64_t *v60 = v45;
    sub_24CC6C9EC(0, &qword_269821C30);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v44 = *v61;
    swift_unknownObjectRelease();
    uint64_t v40 = v31;
    uint64_t v38 = v32;
    if (v44)
    {
      while (1)
      {
        uint64_t v46 = v29;
        id v47 = objc_msgSend(v44, sel_uniqueIdentifier);
        uint64_t v48 = sub_24CCBBE50();
        uint64_t v50 = v49;

        uint64_t v51 = v7[2];
        if (!v51) {
          goto LABEL_30;
        }
        if ((v7[4] != v48 || v7[5] != v50) && (sub_24CCBC480() & 1) == 0)
        {
          if (v51 == 1) {
            goto LABEL_30;
          }
          if ((v7[6] != v48 || v7[7] != v50) && (sub_24CCBC480() & 1) == 0) {
            break;
          }
        }
        swift_bridgeObjectRelease();

LABEL_31:
        uint64_t v31 = v40;
        unint64_t v32 = v38;
        uint64_t v0 = v64;
        uint64_t v29 = v46;
        if (v46 < 0) {
          goto LABEL_50;
        }
LABEL_32:
        if (v32)
        {
          v37 = v0;
          uint64_t v38 = (v32 - 1) & v32;
          unint64_t v39 = __clz(__rbit64(v32)) | (v31 << 6);
          uint64_t v40 = v31;
        }
        else
        {
          int64_t v41 = v31 + 1;
          if (__OFADD__(v31, 1))
          {
            __break(1u);
LABEL_78:
            __break(1u);
            goto LABEL_79;
          }
          v37 = v0;
          if (v41 >= v62) {
            goto LABEL_74;
          }
          unint64_t v42 = *(void *)(v63 + 8 * v41);
          uint64_t v40 = v31 + 1;
          if (!v42)
          {
            uint64_t v40 = v31 + 2;
            if (v31 + 2 >= v62) {
              goto LABEL_74;
            }
            unint64_t v42 = *(void *)(v63 + 8 * v40);
            if (!v42)
            {
              uint64_t v40 = v31 + 3;
              if (v31 + 3 >= v62) {
                goto LABEL_74;
              }
              unint64_t v42 = *(void *)(v63 + 8 * v40);
              if (!v42)
              {
                uint64_t v40 = v31 + 4;
                if (v31 + 4 >= v62) {
                  goto LABEL_74;
                }
                unint64_t v42 = *(void *)(v63 + 8 * v40);
                if (!v42)
                {
                  uint64_t v43 = v31 + 5;
                  while (v62 != v43)
                  {
                    unint64_t v42 = *(void *)(v63 + 8 * v43++);
                    if (v42)
                    {
                      uint64_t v40 = v43 - 1;
                      goto LABEL_47;
                    }
                  }
                  goto LABEL_74;
                }
              }
            }
          }
LABEL_47:
          uint64_t v38 = (v42 - 1) & v42;
          unint64_t v39 = __clz(__rbit64(v42)) + (v40 << 6);
        }
        id v44 = *(id *)(*(void *)(v29 + 48) + 8 * v39);
        if (!v44) {
          goto LABEL_74;
        }
      }
      if (v51 != 2)
      {
        v52 = v58;
        uint64_t v53 = 2;
        do
        {
          uint64_t v54 = v53 + 1;
          if (__OFADD__(v53, 1)) {
            goto LABEL_78;
          }
          BOOL v55 = *(v52 - 1) == v48 && *v52 == v50;
          if (v55 || (sub_24CCBC480() & 1) != 0)
          {
            swift_bridgeObjectRelease();

            uint64_t v31 = v40;
            unint64_t v32 = v38;
            uint64_t v0 = v64;
            uint64_t v7 = v59;
            uint64_t v29 = v46;
            if ((v46 & 0x8000000000000000) == 0) {
              goto LABEL_32;
            }
            goto LABEL_50;
          }
          ++v53;
          v52 += 2;
          BOOL v55 = v54 == v51;
          uint64_t v7 = v59;
        }
        while (!v55);
      }
LABEL_30:
      swift_bridgeObjectRelease();
      sub_24CC699B0(&v65, v44);

      goto LABEL_31;
    }
  }
LABEL_74:
  sub_24CC6B0A4();
  swift_bridgeObjectRelease();
  v56 = v68;
  v57 = (void (*)(void *))v37[1];
  v57(v56);
}

uint64_t sub_24CC659DC()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC65A40()
{
  v1[16] = v0;
  swift_getObjectType();
  sub_24CC69934(&qword_269821BF0, v2, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v4 = sub_24CCBBF40();
  v1[17] = v4;
  v1[18] = v3;
  return MEMORY[0x270FA2498](sub_24CC65AF8, v4, v3);
}

uint64_t sub_24CC65AF8()
{
  uint64_t v1 = *(void **)(v0[16] + 16);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24CC65BFC;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24CC66834;
  v0[13] = &block_descriptor_37;
  v0[14] = v2;
  objc_msgSend(v1, sel_listCandidateDevicesForType_completionHandler_, 9, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24CC65BFC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 152) = v2;
  uint64_t v3 = *(void *)(v1 + 144);
  uint64_t v4 = *(void *)(v1 + 136);
  if (v2) {
    uint64_t v5 = sub_24CC6CB1C;
  }
  else {
    uint64_t v5 = sub_24CC65D2C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

id sub_24CC65D2C()
{
  uint64_t v1 = *(void *)(v0 + 120);
  unint64_t v28 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_24CCBC200();
    if (!v2) {
      goto LABEL_18;
    }
    uint64_t v3 = v2;
    unint64_t v29 = MEMORY[0x263F8EE78];
    sub_24CCBC340();
    uint64_t v30 = sub_24CCBC1A0();
    uint64_t v31 = v4;
    char v32 = 1;
    if ((v3 & 0x8000000000000000) == 0) {
      goto LABEL_7;
    }
    __break(1u);
  }
  uint64_t v3 = *(void *)(v1 + 16);
  if (!v3)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    unint64_t v23 = MEMORY[0x263F8EE78];
LABEL_19:
    uint64_t v24 = sub_24CC6B138(v23);
    swift_bridgeObjectRelease();
    unint64_t v25 = *(uint64_t (**)(uint64_t))(v26 + 8);
    return (id)v25(v24);
  }
  unint64_t v29 = MEMORY[0x263F8EE78];
  sub_24CCBC340();
  uint64_t v30 = sub_24CC6B0B0(v1);
  uint64_t v31 = v5;
  char v32 = v6 & 1;
LABEL_7:
  uint64_t v27 = v1;
  while (1)
  {
    sub_24CC6ADD8(v30, v31, v32, v1, &qword_269821D58);
    uint64_t v13 = v12;
    id result = objc_msgSend(v12, sel_uniqueID);
    if (!result) {
      break;
    }
    char v15 = result;
    sub_24CCBBE50();

    id result = objc_msgSend(v13, sel_name);
    if (!result) {
      goto LABEL_23;
    }
    char v16 = result;
    sub_24CCBBE50();

    id result = objc_msgSend(v13, sel_modelIdentifier);
    if (!result) {
      goto LABEL_24;
    }
    char v17 = result;
    sub_24CCBBE50();

    id v18 = objc_allocWithZone(MEMORY[0x263F39FF8]);
    uint64_t v19 = (void *)sub_24CCBBE20();
    swift_bridgeObjectRelease();
    id v20 = (void *)sub_24CCBBE20();
    swift_bridgeObjectRelease();
    uint64_t v21 = (void *)sub_24CCBBE20();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_initWithUniqueIdentifier_name_modelIdentifier_isPaired_, v19, v20, v21, 0);

    sub_24CCBC320();
    sub_24CCBC350();
    sub_24CCBC360();
    id result = (id)sub_24CCBC330();
    if (v28)
    {
      uint64_t v1 = v27;
      if ((v32 & 1) == 0) {
        goto LABEL_25;
      }
      if (sub_24CCBC1C0()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269821C40);
      uint64_t v22 = (void (*)(uint64_t, void))sub_24CCBC020();
      sub_24CCBC250();
      v22(v26 + 80, 0);
      if (!--v3)
      {
LABEL_17:
        sub_24CC6B048(v30, v31, v32);
        unint64_t v23 = v29;
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v1 = v27;
      int64_t v7 = sub_24CC6ACE0(v30, v31, v32, v27);
      uint64_t v9 = v8;
      char v11 = v10;
      sub_24CC6B048(v30, v31, v32);
      uint64_t v30 = v7;
      uint64_t v31 = v9;
      char v32 = v11 & 1;
      if (!--v3) {
        goto LABEL_17;
      }
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t SharingInteractionController.listPairedDevices()()
{
  v1[16] = v0;
  swift_getObjectType();
  sub_24CC69934(&qword_269821BF0, v2, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v4 = sub_24CCBBF40();
  v1[17] = v4;
  v1[18] = v3;
  return MEMORY[0x270FA2498](sub_24CC661BC, v4, v3);
}

uint64_t sub_24CC661BC()
{
  uint64_t v1 = *(void **)(v0[16] + 16);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24CC662C0;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24CC66834;
  v0[13] = &block_descriptor;
  v0[14] = v2;
  objc_msgSend(v1, sel_listCandidateDevicesForType_completionHandler_, 11, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24CC662C0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 152) = v2;
  uint64_t v3 = *(void *)(v1 + 144);
  uint64_t v4 = *(void *)(v1 + 136);
  if (v2) {
    uint64_t v5 = sub_24CC667C8;
  }
  else {
    uint64_t v5 = sub_24CC663F0;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

id sub_24CC663F0()
{
  uint64_t v1 = *(void *)(v0 + 120);
  unint64_t v28 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_24CCBC200();
    if (!v2) {
      goto LABEL_18;
    }
    uint64_t v3 = v2;
    unint64_t v29 = MEMORY[0x263F8EE78];
    sub_24CCBC340();
    uint64_t v30 = sub_24CCBC1A0();
    uint64_t v31 = v4;
    char v32 = 1;
    if ((v3 & 0x8000000000000000) == 0) {
      goto LABEL_7;
    }
    __break(1u);
  }
  uint64_t v3 = *(void *)(v1 + 16);
  if (!v3)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    unint64_t v23 = MEMORY[0x263F8EE78];
LABEL_19:
    uint64_t v24 = sub_24CC6B138(v23);
    swift_bridgeObjectRelease();
    unint64_t v25 = *(uint64_t (**)(uint64_t))(v26 + 8);
    return (id)v25(v24);
  }
  unint64_t v29 = MEMORY[0x263F8EE78];
  sub_24CCBC340();
  uint64_t v30 = sub_24CC6B0B0(v1);
  uint64_t v31 = v5;
  char v32 = v6 & 1;
LABEL_7:
  uint64_t v27 = v1;
  while (1)
  {
    sub_24CC6ADD8(v30, v31, v32, v1, &qword_269821D58);
    uint64_t v13 = v12;
    id result = objc_msgSend(v12, sel_uniqueID);
    if (!result) {
      break;
    }
    char v15 = result;
    sub_24CCBBE50();

    id result = objc_msgSend(v13, sel_name);
    if (!result) {
      goto LABEL_23;
    }
    char v16 = result;
    sub_24CCBBE50();

    id result = objc_msgSend(v13, sel_modelIdentifier);
    if (!result) {
      goto LABEL_24;
    }
    char v17 = result;
    sub_24CCBBE50();

    id v18 = objc_allocWithZone(MEMORY[0x263F39FF8]);
    uint64_t v19 = (void *)sub_24CCBBE20();
    swift_bridgeObjectRelease();
    id v20 = (void *)sub_24CCBBE20();
    swift_bridgeObjectRelease();
    uint64_t v21 = (void *)sub_24CCBBE20();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_initWithUniqueIdentifier_name_modelIdentifier_isPaired_, v19, v20, v21, 1);

    sub_24CCBC320();
    sub_24CCBC350();
    sub_24CCBC360();
    id result = (id)sub_24CCBC330();
    if (v28)
    {
      uint64_t v1 = v27;
      if ((v32 & 1) == 0) {
        goto LABEL_25;
      }
      if (sub_24CCBC1C0()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269821C40);
      uint64_t v22 = (void (*)(uint64_t, void))sub_24CCBC020();
      sub_24CCBC250();
      v22(v26 + 80, 0);
      if (!--v3)
      {
LABEL_17:
        sub_24CC6B048(v30, v31, v32);
        unint64_t v23 = v29;
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v1 = v27;
      int64_t v7 = sub_24CC6ACE0(v30, v31, v32, v27);
      uint64_t v9 = v8;
      char v11 = v10;
      sub_24CC6B048(v30, v31, v32);
      uint64_t v30 = v7;
      uint64_t v31 = v9;
      char v32 = v11 & 1;
      if (!--v3) {
        goto LABEL_17;
      }
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24CC667C8()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC66834(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269821D68);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    sub_24CC6C9EC(0, &qword_269821D58);
    sub_24CC6B054(&qword_269821D60, &qword_269821D58);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_24CCBC000();
    return swift_continuation_throwingResume();
  }
}

uint64_t SharingInteractionController.pair(withDeviceID:)(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = swift_getObjectType();
  sub_24CC69934(&qword_269821BF0, v4, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v6 = sub_24CCBBF40();
  v3[8] = v6;
  v3[9] = v5;
  return MEMORY[0x270FA2498](sub_24CC66A00, v6, v5);
}

uint64_t sub_24CC66A00()
{
  char v16 = v0;
  if (qword_269821AB0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824828);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v14 = v0[4];
    unint64_t v4 = v0[5];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    uint64_t v7 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v7, v8, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_24CC692DC(v14, v4, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CC60000, v2, v3, "%s: pair(withDeviceID: %s)", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v6, -1, -1);
    MEMORY[0x2533103A0](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = v0[4];
  uint64_t v9 = v0[5];
  uint64_t v11 = swift_task_alloc();
  v0[10] = v11;
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[11] = v12;
  void *v12 = v0;
  v12[1] = sub_24CC64340;
  return sub_24CC64544((uint64_t)sub_24CC6B2AC, v11);
}

void sub_24CC66C9C(void *a1)
{
  uint64_t v2 = (void *)sub_24CCBBE20();
  os_log_type_t v3 = (void *)sub_24CCBBE20();
  id v4 = objc_msgSend(a1, sel_enableForType_withIDSDeviceID_passcode_, 11, v2, v3);

  sub_24CCBB500();
}

uint64_t SharingInteractionController.unpair(withDeviceID:)(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = swift_getObjectType();
  sub_24CC69934(&qword_269821BF0, v4, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v6 = sub_24CCBBF40();
  v3[11] = v6;
  v3[12] = v5;
  return MEMORY[0x270FA2498](sub_24CC66E00, v6, v5);
}

uint64_t sub_24CC66E00()
{
  char v16 = v0;
  if (qword_269821AB0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  v0[13] = __swift_project_value_buffer(v1, (uint64_t)qword_269824828);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v14 = v0[7];
    unint64_t v4 = v0[8];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    uint64_t v7 = sub_24CCBC5E0();
    v0[5] = sub_24CC692DC(v7, v8, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[6] = sub_24CC692DC(v14, v4, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CC60000, v2, v3, "%s: unpair(withDeviceID: %s)", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v6, -1, -1);
    MEMORY[0x2533103A0](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = v0[7];
  uint64_t v9 = v0[8];
  uint64_t v11 = swift_task_alloc();
  v0[14] = v11;
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[15] = v12;
  void *v12 = v0;
  v12[1] = sub_24CC670A0;
  return sub_24CC64544((uint64_t)sub_24CC6B2B4, v11);
}

uint64_t sub_24CC670A0()
{
  uint64_t v2 = (void *)*v1;
  v2[16] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[11];
    uint64_t v4 = v2[12];
    return MEMORY[0x270FA2498](sub_24CC671D8, v3, v4);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_24CC671D8()
{
  id v20 = v0;
  uint64_t v1 = (void *)v0[16];
  swift_task_dealloc();
  swift_bridgeObjectRetain();
  id v2 = v1;
  swift_bridgeObjectRetain();
  id v3 = v1;
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC060();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[16];
    unint64_t v7 = v0[8];
    uint64_t v16 = v0[7];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v8 = 136315650;
    uint64_t v9 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v9, v10, &v19);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_24CC692DC(v16, v7, &v19);
    sub_24CCBC120();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 22) = 2112;
    id v11 = v6;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v12;
    sub_24CCBC120();
    void *v17 = v12;

    _os_log_impl(&dword_24CC60000, v4, v5, "%s: error while unpairing deviceID %s: %@", (uint8_t *)v8, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v18, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);
  }
  else
  {
    uint64_t v13 = (void *)v0[16];

    swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

void sub_24CC6749C(void *a1)
{
  id v2 = (void *)sub_24CCBBE20();
  id v3 = objc_msgSend(a1, sel_disableForType_withIDSDeviceID_, 11, v2);

  sub_24CCBB500();
}

uint64_t sub_24CC67528(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v39 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D48);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v40 = &v33[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_24CCBB520();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v38 = &v33[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v33[-v12];
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v33[-v14];
  a2(*(void *)(a4 + 16));
  if (qword_269821AB0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_24CCBB890();
  __swift_project_value_buffer(v16, (uint64_t)qword_269824828);
  v37 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16);
  v37(v13, v15, v7);
  uint64_t v17 = sub_24CCBB870();
  os_log_type_t v18 = sub_24CCBC060();
  int v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v36 = a4;
    uint64_t v21 = v20;
    uint64_t v35 = swift_slowAlloc();
    v42[0] = v35;
    *(_DWORD *)uint64_t v21 = 136315394;
    int v34 = v19;
    uint64_t v22 = sub_24CCBC5E0();
    uint64_t v41 = sub_24CC692DC(v22, v23, v42);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    sub_24CC69934(&qword_269821D40, 255, MEMORY[0x263F07508]);
    uint64_t v24 = sub_24CCBC460();
    uint64_t v41 = sub_24CC692DC(v24, v25, v42);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v26(v13, v7);
    _os_log_impl(&dword_24CC60000, v17, (os_log_type_t)v34, "%s: Performed authentication manager request with ID %s", (uint8_t *)v21, 0x16u);
    uint64_t v27 = v35;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v27, -1, -1);
    MEMORY[0x2533103A0](v21, -1, -1);
  }
  else
  {
    uint64_t v26 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v26(v13, v7);
  }

  uint64_t v28 = (uint64_t)v38;
  v37(v38, v15, v7);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D50);
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = (uint64_t)v40;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v30 + 16))(v40, v39, v29);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 56))(v31, 0, 1, v29);
  swift_beginAccess();
  sub_24CC9E8FC(v31, v28);
  swift_endAccess();
  return ((uint64_t (*)(unsigned char *, uint64_t))v26)(v15, v7);
}

void sub_24CC6799C(uint64_t a1, void *a2)
{
  id v69 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = sub_24CCBB520();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v68 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v68 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D48);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D50);
  uint64_t v72 = *(void *)(v17 - 8);
  uint64_t v73 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v71 = (char *)&v68 - v21;
  swift_beginAccess();
  uint64_t v22 = *(void *)(v2 + 32);
  if (*(void *)(v22 + 16) && (unint64_t v23 = sub_24CC9F244(a1), (v24 & 1) != 0))
  {
    uint64_t v25 = *(void *)(v22 + 56);
    uint64_t v27 = v72;
    uint64_t v26 = v73;
    (*(void (**)(char *, unint64_t, uint64_t))(v72 + 16))(v20, v25 + *(void *)(v72 + 72) * v23, v73);
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v71, v20, v26);
    swift_endAccess();
    swift_beginAccess();
    sub_24CC6AB08(a1, (uint64_t)v16);
    swift_endAccess();
    sub_24CC6C920((uint64_t)v16);
    id v28 = v69;
    if (v69)
    {
      id v29 = v69;
      if (qword_269821AB0 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_24CCBB890();
      __swift_project_value_buffer(v30, (uint64_t)qword_269824828);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, a1, v4);
      id v31 = v28;
      id v32 = v28;
      uint64_t v33 = sub_24CCBB870();
      os_log_type_t v34 = sub_24CCBC040();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = v4;
        uint64_t v36 = swift_slowAlloc();
        v68 = (void *)swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        v75[0] = v37;
        *(_DWORD *)uint64_t v36 = 136315650;
        uint64_t v38 = sub_24CCBC5E0();
        uint64_t v74 = sub_24CC692DC(v38, v39, v75);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2080;
        sub_24CC69934(&qword_269821D40, 255, MEMORY[0x263F07508]);
        uint64_t v40 = sub_24CCBC460();
        uint64_t v74 = sub_24CC692DC(v40, v41, v75);
        id v28 = v69;
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v35);
        *(_WORD *)(v36 + 22) = 2112;
        id v42 = v28;
        uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v74 = v43;
        sub_24CCBC120();
        id v44 = v68;
        void *v68 = v43;

        _os_log_impl(&dword_24CC60000, v33, v34, "%s: Resuming authentication manager request for %s with error %@", (uint8_t *)v36, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v44, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v37, -1, -1);
        MEMORY[0x2533103A0](v36, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      }
      v75[0] = (uint64_t)v28;
      uint64_t v66 = v73;
      char v67 = v71;
      sub_24CCBBF50();
    }
    else
    {
      if (qword_269821AB0 != -1) {
        swift_once();
      }
      uint64_t v56 = sub_24CCBB890();
      __swift_project_value_buffer(v56, (uint64_t)qword_269824828);
      uint64_t v57 = v4;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, a1, v4);
      v58 = sub_24CCBB870();
      os_log_type_t v59 = sub_24CCBC060();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        v75[0] = v61;
        *(_DWORD *)uint64_t v60 = 136315394;
        uint64_t v62 = sub_24CCBC5E0();
        uint64_t v74 = sub_24CC692DC(v62, v63, v75);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v60 + 12) = 2080;
        sub_24CC69934(&qword_269821D40, 255, MEMORY[0x263F07508]);
        uint64_t v64 = sub_24CCBC460();
        uint64_t v74 = sub_24CC692DC(v64, v65, v75);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v57);
        _os_log_impl(&dword_24CC60000, v58, v59, "%s: Resuming authentication manager request for %s", (uint8_t *)v60, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v61, -1, -1);
        MEMORY[0x2533103A0](v60, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v57);
      }

      uint64_t v66 = v73;
      char v67 = v71;
      sub_24CCBBF60();
    }
    (*(void (**)(char *, uint64_t))(v72 + 8))(v67, v66);
  }
  else
  {
    swift_endAccess();
    if (qword_269821AB0 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_24CCBB890();
    __swift_project_value_buffer(v45, (uint64_t)qword_269824828);
    uint64_t v46 = a1;
    uint64_t v47 = v4;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v46, v4);
    uint64_t v48 = sub_24CCBB870();
    os_log_type_t v49 = sub_24CCBC040();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      v75[0] = v51;
      *(_DWORD *)uint64_t v50 = 136315394;
      uint64_t v52 = sub_24CCBC5E0();
      uint64_t v74 = sub_24CC692DC(v52, v53, v75);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2080;
      sub_24CC69934(&qword_269821D40, 255, MEMORY[0x263F07508]);
      uint64_t v54 = sub_24CCBC460();
      uint64_t v74 = sub_24CC692DC(v54, v55, v75);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v47);
      _os_log_impl(&dword_24CC60000, v48, v49, "%s: Unable to resume request; no continuation found for %s",
        (uint8_t *)v50,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v51, -1, -1);
      MEMORY[0x2533103A0](v50, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v47);
    }
  }
}

uint64_t SharingInteractionController.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SharingInteractionController.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_24CC68410()
{
  return sub_24CCBC0D0();
}

uint64_t sub_24CC68434(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return SharingInteractionController.unlock(withDeviceID:)(a1, a2);
}

uint64_t sub_24CC684DC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC68584;
  return SharingInteractionController.canAuthenticate(withDeviceID:)(a1, a2);
}

uint64_t sub_24CC68584()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CC68678()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC68708;
  return SharingInteractionController.listDevices()();
}

uint64_t sub_24CC68708(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_24CC68808()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB18;
  return SharingInteractionController.listPairedDevices()();
}

uint64_t sub_24CC68898(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return SharingInteractionController.pair(withDeviceID:)(a1, a2);
}

uint64_t sub_24CC68940(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return SharingInteractionController.unpair(withDeviceID:)(a1, a2);
}

uint64_t sub_24CC689E8(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 16) = *v2;
  sub_24CC69934(&qword_269821BF0, a2, (void (*)(uint64_t))type metadata accessor for SharingInteractionController);
  uint64_t v5 = sub_24CCBBF40();
  return MEMORY[0x270FA2498](sub_24CC63F74, v5, v4);
}

void SharingInteractionController.manager(_:didStartAuthenticationForSessionWith:)(uint64_t a1, uint64_t a2)
{
}

uint64_t SharingInteractionController.manager(_:didCompleteAuthenticationForSessionWith:)(uint64_t a1, uint64_t a2)
{
  return sub_24CC6B678(a2, "[%s] Did complete authentication for session %s)", (uint64_t)sub_24CC6CAE4, 181);
}

uint64_t sub_24CC68BE0(uint64_t a1, uint64_t a2)
{
  swift_getObjectType();
  sub_24CCBC0D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_24CC6C894;
  *(void *)(v7 + 24) = v6;
  swift_retain();
  v10[0] = v2;
  sub_24CC6C8F4(v10);
  if (v3)
  {
    swift_release();
    return swift_release();
  }
  swift_release();
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    sub_24CCBC2C0();
    sub_24CCBBEC0();
    v10[3] = v2;
    sub_24CCBC3B0();
    sub_24CCBBEC0();
    uint64_t result = sub_24CCBC3D0();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CC68DEC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = sub_24CCBB520();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CCBB500();
  id v15 = a3;
  swift_retain();
  sub_24CC6B678((uint64_t)v14, a5, a6, a7);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t SharingInteractionController.manager(_:didFailAuthenticationForSessionWith:error:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_24CC6BA90(a2, a3, "[%s] Did fail authentication for session %s) with error %@", (uint64_t)sub_24CC6CAFC, 189);
}

uint64_t SharingInteractionController.manager(_:didEnableAuthenticationForSessionWith:)(uint64_t a1, uint64_t a2)
{
  return sub_24CC6B678(a2, "[%s] Did enable authentication for session %s)", (uint64_t)sub_24CC6C9B4, 197);
}

uint64_t SharingInteractionController.manager(_:didFailToEnableDeviceForSessionWith:error:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_24CC6BA90(a2, a3, "[%s] Did fail to enable device for session %s) with error %@", (uint64_t)sub_24CC6C980, 205);
}

uint64_t sub_24CC69044(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, const char *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = sub_24CCBB520();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CCBB500();
  id v17 = a3;
  id v18 = a5;
  swift_retain();
  sub_24CC6BA90((uint64_t)v16, v18, a6, a7, a8);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t SharingInteractionController.manager(_:didDisableAuthenticationForSessionWith:)(uint64_t a1, uint64_t a2)
{
  return sub_24CC6B678(a2, "[%s] Did disable authentication for session %s)", (uint64_t)sub_24CC6CAE4, 213);
}

uint64_t SharingInteractionController.manager(_:didFailToDisableDeviceForSessionWith:error:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_24CC6BA90(a2, a3, "[%s] Did fail to disable device for session %s) with error %@", (uint64_t)sub_24CC6CAFC, 221);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24CC69280()
{
  unint64_t result = qword_269821BE0;
  if (!qword_269821BE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269821BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269821BE0);
  }
  return result;
}

uint64_t sub_24CC692DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CC693B0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CC6CA84((uint64_t)v12, *a3);
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
      sub_24CC6CA84((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24CC693B0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CCBC130();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CC6956C(a5, a6);
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
  uint64_t v8 = sub_24CCBC310();
  if (!v8)
  {
    sub_24CCBC3C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CCBC420();
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

uint64_t sub_24CC6956C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CC69604(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CC697E4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CC697E4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CC69604(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CC6977C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CCBC2D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CCBC3C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CCBBEE0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CCBC420();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CCBC3C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24CC6977C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269821D80);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CC697E4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269821D80);
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
  uint64_t result = sub_24CCBC420();
  __break(1u);
  return result;
}

uint64_t sub_24CC69934(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t type metadata accessor for SharingInteractionController()
{
  return self;
}

void sub_24CC699A0(void *a1)
{
}

void sub_24CC699A8(void *a1)
{
}

uint64_t sub_24CC699B0(void *a1, void *a2)
{
  unint64_t v3 = v2;
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
    uint64_t v9 = sub_24CCBC210();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_24CC6C9EC(0, &qword_269821C30);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_24CCBC200();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_24CC69C50(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_24CC69E48();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_24CC6A0E8((uint64_t)v8, v22);
    *unint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_24CCBC0F0();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_24CC6C9EC(0, &qword_269821C30);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_24CCBC100();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
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
        char v18 = sub_24CCBC100();

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
    sub_24CC6A16C((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_24CC69C50(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269821D70);
    uint64_t v2 = sub_24CCBC2A0();
    uint64_t v14 = v2;
    sub_24CCBC1B0();
    if (sub_24CCBC230())
    {
      sub_24CC6C9EC(0, &qword_269821C30);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_24CC69E48();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_24CCBC0F0();
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
      while (sub_24CCBC230());
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

uint64_t sub_24CC69E48()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D70);
  uint64_t v3 = sub_24CCBC290();
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
                  void *v6 = -1 << v27;
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
      uint64_t result = sub_24CCBC0F0();
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

unint64_t sub_24CC6A0E8(uint64_t a1, uint64_t a2)
{
  sub_24CCBC0F0();
  unint64_t result = sub_24CCBC190();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_24CC6A16C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_24CC69E48();
  }
  else
  {
    if (v7 > v6)
    {
      sub_24CC6A2F4();
      goto LABEL_14;
    }
    sub_24CC6A4A0();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_24CCBC0F0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_24CC6C9EC(0, &qword_269821C30);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_24CCBC100();

    if (v12)
    {
LABEL_13:
      sub_24CCBC4A0();
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
        char v15 = sub_24CCBC100();

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

id sub_24CC6A2F4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D70);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CCBC280();
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

uint64_t sub_24CC6A4A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D70);
  uint64_t v3 = sub_24CCBC290();
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
    uint64_t result = sub_24CCBC0F0();
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

uint64_t sub_24CC6A71C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CC6A75C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24CC6A73C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CC6A8C8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24CC6A75C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269821D78);
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
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_24CCBC420();
  __break(1u);
  return result;
}

uint64_t sub_24CC6A8C8(char a1, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D38);
  uint64_t v10 = *(void *)(type metadata accessor for NearbyDevice(0) - 8);
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
  uint64_t v16 = *(void *)(type metadata accessor for NearbyDevice(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  int64_t v18 = (char *)v13 + v17;
  id v19 = (char *)a4 + v17;
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
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_24CCBC420();
  __break(1u);
  return result;
}

uint64_t sub_24CC6AB08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24CC9F244(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24CC9FE84();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_24CCBB520();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D50);
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_24CC9F460(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    size_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D50);
    size_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

int64_t sub_24CC6ACE0(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_24CC6ADC4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_24CC6ADD8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v8 = a4;
      }
      else {
        uint64_t v8 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x25330F840](a1, a2, v8);
      sub_24CC6C9EC(0, a5);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_24CCBC1E0() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_24CCBC1F0();
  sub_24CC6C9EC(0, a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a5 = v18;
  swift_unknownObjectRelease();
  uint64_t v9 = sub_24CCBC0F0();
  uint64_t v10 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v7 = v9 & ~v10;
  if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v11 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
  char v12 = sub_24CCBC100();

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = ~v10;
    do
    {
      unint64_t v7 = (v7 + 1) & v13;
      if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_26;
      }
      id v14 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
      char v15 = sub_24CCBC100();
    }
    while ((v15 & 1) == 0);
  }

LABEL_20:
  uint64_t v16 = *(void **)(*(void *)(a4 + 48) + 8 * v7);
  id v17 = v16;
}

uint64_t sub_24CC6B048(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24CC6B054(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24CC6C9EC(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CC6B0A4()
{
  return swift_release();
}

uint64_t sub_24CC6B0B0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
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
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_24CC6B138(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24CCBC3E0();
    swift_bridgeObjectRelease();
  }
  sub_24CC6C9EC(0, &qword_269821C30);
  sub_24CC6B054(&qword_269821C38, &qword_269821C30);
  uint64_t result = sub_24CCBC010();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24CCBC3E0();
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
        unsigned int v6 = (void *)MEMORY[0x25330F910](i, a1);
        sub_24CC699B0(&v9, v6);
      }
    }
    else
    {
      unint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_24CC699B0(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

void sub_24CC6B2AC(void *a1)
{
}

void sub_24CC6B2B4(void *a1)
{
}

void sub_24CC6B2BC(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_24CCBB520();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24CCBBD90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (uint64_t *)((char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v12 = *(void **)(v2 + 24);
  void *v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F0E0], v8);
  id v13 = v12;
  LOBYTE(v12) = sub_24CCBBDA0();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    if (qword_269821AB0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v14 = sub_24CCBB890();
  __swift_project_value_buffer(v14, (uint64_t)qword_269824828);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  char v15 = sub_24CCBB870();
  os_log_type_t v16 = sub_24CCBC060();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v24 = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v19 = sub_24CCBC5E0();
    uint64_t v23 = sub_24CC692DC(v19, v20, &v24);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    sub_24CC69934(&qword_269821D40, 255, MEMORY[0x263F07508]);
    uint64_t v21 = sub_24CCBC460();
    uint64_t v23 = sub_24CC692DC(v21, v22, &v24);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_24CC60000, v15, v16, "[%s] Did start authentication for session %s)", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v18, -1, -1);
    MEMORY[0x2533103A0](v17, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24CC6B678(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a3;
  uint64_t v34 = a1;
  id v31 = a2;
  uint64_t v6 = v4;
  swift_getObjectType();
  uint64_t v7 = sub_24CCBB520();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24CCBBD90();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t *)((char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v15 = *(void **)(v6 + 24);
  void *v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F8F0E0], v11);
  id v16 = v15;
  LOBYTE(v15) = sub_24CCBBDA0();
  (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if (v15)
  {
    uint64_t v32 = v6;
    if (qword_269821AB0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v17 = sub_24CCBB890();
  __swift_project_value_buffer(v17, (uint64_t)qword_269824828);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v34, v7);
  uint64_t v18 = sub_24CCBB870();
  os_log_type_t v19 = sub_24CCBC060();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v30 = a4;
    uint64_t v21 = v20;
    uint64_t v22 = swift_slowAlloc();
    v36[0] = v22;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v23 = sub_24CCBC5E0();
    uint64_t v35 = sub_24CC692DC(v23, v24, v36);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    sub_24CC69934(&qword_269821D40, 255, MEMORY[0x263F07508]);
    uint64_t v25 = sub_24CCBC460();
    uint64_t v35 = sub_24CC692DC(v25, v26, v36);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    _os_log_impl(&dword_24CC60000, v18, v19, v31, (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v22, -1, -1);
    MEMORY[0x2533103A0](v21, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  MEMORY[0x270FA5388](v27);
  uint64_t v28 = v33;
  *(&v30 - 2) = v34;
  return sub_24CC68BE0(v28, (uint64_t)(&v30 - 4));
}

uint64_t sub_24CC6BA90(uint64_t a1, void *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v44 = a4;
  uint64_t v45 = a1;
  id v42 = a3;
  uint64_t v7 = v5;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = sub_24CCBB520();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24CCBBD90();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v16 = (uint64_t *)((char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void **)(v7 + 24);
  void *v16 = v17;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F8F0E0], v13);
  id v18 = v17;
  LOBYTE(v17) = sub_24CCBBDA0();
  (*(void (**)(void *, uint64_t))(v14 + 8))(v16, v13);
  if (v17)
  {
    uint64_t v43 = v7;
    if (qword_269821AB0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v19 = sub_24CCBB890();
  __swift_project_value_buffer(v19, (uint64_t)qword_269824828);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v45, v9);
  id v20 = a2;
  id v21 = a2;
  uint64_t v22 = sub_24CCBB870();
  os_log_type_t v23 = sub_24CCBC040();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v40 = a5;
    uint64_t v25 = v24;
    uint64_t v38 = (void *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v47[0] = v39;
    *(_DWORD *)uint64_t v25 = 136315650;
    uint64_t v26 = sub_24CCBC5E0();
    uint64_t v46 = sub_24CC692DC(v26, v27, v47);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    sub_24CC69934(&qword_269821D40, 255, MEMORY[0x263F07508]);
    uint64_t v28 = sub_24CCBC460();
    uint64_t v46 = sub_24CC692DC(v28, v29, v47);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    *(_WORD *)(v25 + 22) = 2112;
    id v30 = a2;
    uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v46 = v31;
    sub_24CCBC120();
    uint64_t v32 = v38;
    *uint64_t v38 = v31;

    _os_log_impl(&dword_24CC60000, v22, v23, v42, (uint8_t *)v25, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v32, -1, -1);
    uint64_t v33 = v39;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v33, -1, -1);
    MEMORY[0x2533103A0](v25, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  MEMORY[0x270FA5388](v34);
  uint64_t v35 = v44;
  *(&v37 - 2) = v45;
  *(&v37 - 1) = (uint64_t)a2;
  return sub_24CC68BE0(v35, (uint64_t)(&v37 - 4));
}

uint64_t dispatch thunk of SharingInteractionControllerProtocol.unlock(withDeviceID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24CC6CB14;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of SharingInteractionControllerProtocol.canAuthenticate(withDeviceID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24CC68584;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of SharingInteractionControllerProtocol.listDevices()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6C264;
  return v7(a1, a2);
}

uint64_t sub_24CC6C264(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of SharingInteractionControllerProtocol.listPairedDevices()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB20;
  return v7(a1, a2);
}

uint64_t dispatch thunk of SharingInteractionControllerProtocol.pair(withDeviceID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 40) + **(int **)(a4 + 40));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24CC6CB14;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of SharingInteractionControllerProtocol.unpair(withDeviceID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 48) + **(int **)(a4 + 48));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24CC6CB14;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of SharingInteractionControllerProtocol.isRemoteUnlockSupported()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 56) + **(int **)(a2 + 56));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6C758;
  return v7(a1, a2);
}

uint64_t sub_24CC6C758(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t method lookup function for SharingInteractionController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SharingInteractionController);
}

uint64_t dispatch thunk of SharingInteractionController.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_24CC6C884()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CC6C894()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24CC6C8BC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CC6C8F4(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_24CC6C920(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24CC6C980()
{
  sub_24CC6799C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_24CC6C9B4()
{
  sub_24CC6799C(*(void *)(v0 + 16), 0);
}

uint64_t sub_24CC6C9EC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24CC6CA28(uint64_t a1)
{
  return sub_24CC67528(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
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

uint64_t sub_24CC6CA84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_24CC6CAE4()
{
}

void sub_24CC6CAFC()
{
}

uint64_t PeerConnection.transportDispatchService.getter()
{
  sub_24CC735F4();
  return swift_retain();
}

uint64_t sub_24CC6CB4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CC74734(a1, (uint64_t)v4, &qword_269821D90);
  return sub_24CC6CBF8((uint64_t)v4);
}

uint64_t sub_24CC6CBE4@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC6CE68(&qword_269824780, &qword_269821D90, a1);
}

uint64_t sub_24CC6CBF8(uint64_t a1)
{
  return sub_24CC6CEDC(a1, &qword_269824780, &qword_269821D90);
}

uint64_t (*sub_24CC6CC0C())()
{
  return j__swift_endAccess;
}

uint64_t sub_24CC6CC6C()
{
  uint64_t v1 = sub_24CCBB520();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v0 + qword_269824780;
  swift_beginAccess();
  sub_24CC74734(v8, (uint64_t)v7, &qword_269821D90);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1))
  {
    sub_24CC744B8((uint64_t)v7, &qword_269821D90);
    return 0x4449206F4ELL;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
    sub_24CC744B8((uint64_t)v7, &qword_269821D90);
    uint64_t v9 = sub_24CCBB4F0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v9;
}

unint64_t sub_24CC6CE3C(uint64_t a1)
{
  unint64_t v2 = *(void *)(v1 + qword_269821DD8);
  *(void *)(v1 + qword_269821DD8) = a1;
  return sub_24CC736F4(v2);
}

uint64_t sub_24CC6CE54@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC6CE68(&qword_269821DC0, &qword_269821DE8, a1);
}

uint64_t sub_24CC6CE68@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess();
  return sub_24CC74734(v6, a3, a2);
}

uint64_t sub_24CC6CEC8(uint64_t a1)
{
  return sub_24CC6CEDC(a1, &qword_269821DC0, &qword_269821DE8);
}

uint64_t sub_24CC6CEDC(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = v3 + *a2;
  swift_beginAccess();
  sub_24CC746D0(a1, v6, a3);
  return swift_endAccess();
}

uint64_t PeerConnection.__allocating_init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = sub_24CCBB8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CCBB168();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  sub_24CCBBA90();
  swift_allocObject();
  swift_retain();
  uint64_t v6 = sub_24CCBBA30();
  uint64_t v7 = swift_allocObject();
  PeerConnection.init(nwConnection:)(v6);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v7;
}

uint64_t PeerConnection.__allocating_init(nwConnection:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  PeerConnection.init(nwConnection:)(a1);
  return v2;
}

void *PeerConnection.init(nwConnection:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  uint64_t v20 = a1;
  uint64_t v21 = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v19 = (uint64_t)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CCBC080();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24CCBC070();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = sub_24CCBBD80();
  MEMORY[0x270FA5388](v11 - 8);
  sub_24CC735FC();
  sub_24CCBBD60();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_24CC74BC8((unint64_t *)&qword_269821DA0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821DA8);
  sub_24CC7363C();
  sub_24CCBC170();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F130], v6);
  v1[3] = sub_24CCBC090();
  uint64_t v12 = (char *)v1 + qword_269824780;
  uint64_t v13 = sub_24CCBB520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  sub_24CCBB600();
  uint64_t v14 = (char *)v2 + qword_269821DC0;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821DC8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(void *)((char *)v2 + qword_269821DD0) = v20;
  *(void *)((char *)v2 + qword_269821DD8) = 0;
  sub_24CCBB860();
  swift_retain();
  v2[2] = sub_24CCBB850();
  uint64_t v16 = v19;
  sub_24CC6D4C4(v19);
  swift_release();
  uint64_t v17 = (uint64_t)v2 + qword_269824780;
  swift_beginAccess();
  sub_24CC746D0(v16, v17, &qword_269821D90);
  swift_endAccess();
  return v2;
}

uint64_t sub_24CC6D4C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CCBB8F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CCBBA80();
  sub_24CCBB8E0();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (!v10) {
    goto LABEL_4;
  }
  sub_24CCBB4E0();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24CCBB520();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v4, 1, v11) == 1)
  {
    sub_24CC744B8((uint64_t)v4, &qword_269821D90);
LABEL_4:
    uint64_t v13 = sub_24CCBB520();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 1, 1, v13);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v4, v11);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
}

uint64_t sub_24CC6D704()
{
  v1[4] = v0;
  v1[5] = *v0;
  uint64_t v2 = sub_24CCBB890();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC6D7EC, 0, 0);
}

uint64_t sub_24CC6D7EC()
{
  unint64_t v29 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_269824810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC060();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v10 = v0[6];
  if (v7)
  {
    uint64_t v27 = v0[6];
    os_log_type_t type = v6;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v28 = v25;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v12 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0x6574617669746361, 0xEA00000000002928);
    v0[2] = sub_24CC692DC(v12, v13, &v28);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v14 = sub_24CC6CC6C();
    v0[3] = sub_24CC692DC(v14, v15, &v28);
    sub_24CCBC120();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v5, type, "%{public}s [%s]", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v25, -1, -1);
    MEMORY[0x2533103A0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v27);
  }
  else
  {

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  if (*(void *)(v0[4] + qword_269821DD8))
  {
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
  else
  {
    uint64_t v18 = v0[5];
    uint64_t v19 = swift_allocObject();
    swift_weakInit();
    uint64_t v20 = (void *)swift_allocObject();
    v20[2] = *(void *)(v18 + 80);
    v20[3] = *(void *)(v18 + 88);
    v20[4] = v19;
    sub_24CC736DC(0);
    swift_retain();
    sub_24CCBBA20();
    swift_release();
    sub_24CCBBA60();
    uint64_t v21 = os_transaction_create();
    v0[9] = v21;
    if (v21)
    {
      uint64_t v22 = v0[4];
      unint64_t v23 = *(void *)(v22 + qword_269821DD8);
      *(void *)(v22 + qword_269821DD8) = v21;
      swift_unknownObjectRetain();
      sub_24CC736F4(v23);
      uint64_t v24 = (void *)swift_task_alloc();
      v0[10] = v24;
      void *v24 = v0;
      v24[1] = sub_24CC6DC48;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2318]();
  }
}

uint64_t sub_24CC6DC48()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CC6DD44, 0, 0);
}

uint64_t sub_24CC6DD44()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC6DDAC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CC6E0F0(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_24CC6DE0C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821DE8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821DC8);
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  return sub_24CC6CEC8((uint64_t)v4);
}

unint64_t sub_24CC6DF10()
{
  uint64_t v1 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824810);
  uint64_t v3 = sub_24CCBB870();
  os_log_type_t v4 = sub_24CCBC060();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = sub_24CCBC5E0();
    sub_24CC692DC(v7, v8, &v11);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v3, v4, "%s Invalidating peer connection.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v6, -1, -1);
    MEMORY[0x2533103A0](v5, -1, -1);
  }

  unint64_t v9 = *(void *)(v1 + qword_269821DD8);
  if (v9 == 1) {
    return sub_24CC736DC(1uLL);
  }
  *(void *)(v1 + qword_269821DD8) = 1;
  sub_24CC736F4(v9);
  return sub_24CCBBA70();
}

void sub_24CC6E0F0(uint64_t a1)
{
  v156.Class isa = v1->isa;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821DE8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  v145 = (char *)&v144 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v146 = (uint64_t)&v144 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821DC8);
  uint64_t v148 = *(void *)(v7 - 8);
  uint64_t v149 = v7;
  MEMORY[0x270FA5388](v7);
  v147 = (char *)&v144 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24CCBBC00();
  uint64_t v157 = *(void *)(v9 - 8);
  uint64_t v158 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v152 = (char *)&v144 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v153 = (char *)&v144 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v154 = ((char *)&v144 - v15);
  MEMORY[0x270FA5388](v14);
  os_log_t v155 = (os_log_t)((char *)&v144 - v16);
  os_log_t v17 = (os_log_t)sub_24CCBBA50();
  Class isa = v17[-1].isa;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v144 = (char *)&v144 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v150 = (char **)((char *)&v144 - v22);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  os_log_t v151 = (os_log_t)((char *)&v144 - v24);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v144 - v25;
  uint64_t v27 = sub_24CCBBD90();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char **)((char *)&v144 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  os_log_t v159 = v1;
  uint64_t v31 = v1[3].isa;
  void *v30 = v31;
  (*(void (**)(void *, void, uint64_t))(v28 + 104))(v30, *MEMORY[0x263F8F0E0], v27);
  uint64_t v32 = v31;
  char v33 = sub_24CCBBDA0();
  (*(void (**)(void *, uint64_t))(v28 + 8))(v30, v27);
  if ((v33 & 1) == 0)
  {
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v34 = (void (*)(char *, uint64_t, os_log_t))*((void *)isa + 2);
  v34(v26, a1, v17);
  int v35 = (*((uint64_t (**)(char *, os_log_t))isa + 11))(v26, v17);
  os_log_t v36 = v17;
  Class v37 = isa;
  if (v35 == *MEMORY[0x263F14218])
  {
    (*((void (**)(char *, os_log_t))isa + 12))(v26, v17);
    uint64_t v31 = (void *)v157;
    a1 = v158;
    os_log_t v17 = v155;
    (*(void (**)(os_log_t, char *, uint64_t))(v157 + 32))(v155, v26, v158);
    if (qword_269821AA8 == -1)
    {
LABEL_4:
      uint64_t v38 = sub_24CCBB890();
      __swift_project_value_buffer(v38, (uint64_t)qword_269824810);
      uint64_t v39 = (void (*)(NSObject *, os_log_t, uint64_t))v31[2];
      uint64_t v40 = v154;
      v39(v154, v17, a1);
      swift_retain_n();
      unint64_t v41 = sub_24CCBB870();
      os_log_type_t v42 = sub_24CCBC040();
      int v43 = v42;
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v44 = swift_slowAlloc();
        LODWORD(v152) = v43;
        uint64_t v45 = v44;
        v150 = (void *)swift_slowAlloc();
        v153 = (char *)swift_slowAlloc();
        v162[0] = (uint64_t)v153;
        *(_DWORD *)uint64_t v45 = 136315650;
        os_log_t v151 = v41;
        uint64_t v46 = sub_24CCBC5E0();
        uint64_t v161 = sub_24CC692DC(v46, v47, v162);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2080;
        uint64_t v48 = sub_24CC6CC6C();
        uint64_t v161 = sub_24CC692DC(v48, v49, v162);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        swift_release_n();
        *(_WORD *)(v45 + 22) = 2112;
        sub_24CC74BC8(&qword_269822030, MEMORY[0x263F14320]);
        swift_allocError();
        v39(v50, v40, a1);
        uint64_t v51 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v161 = v51;
        sub_24CCBC120();
        uint64_t v52 = v150;
        void *v150 = v51;
        unint64_t v53 = (void (*)(NSObject *, uint64_t))v31[1];
        v53(v40, a1);
        os_log_t v54 = v151;
        _os_log_impl(&dword_24CC60000, v151, (os_log_type_t)v152, "%s [%s] connection waiting with %@", (uint8_t *)v45, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v52, -1, -1);
        unint64_t v55 = v153;
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v55, -1, -1);
        MEMORY[0x2533103A0](v45, -1, -1);
      }
      else
      {
        swift_release_n();
        unint64_t v53 = (void (*)(NSObject *, uint64_t))v31[1];
        v53(v40, a1);
      }
      MEMORY[0x270FA5388](v56);
      *(&v144 - 2) = (char *)v17;
      sub_24CC6F8E4();
      v53(v17, a1);
      return;
    }
LABEL_49:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v57 = v157;
  if (v35 == *MEMORY[0x263F14210])
  {
    (*((void (**)(char *, os_log_t))isa + 12))(v26, v17);
    v58 = v153;
    uint64_t v59 = v158;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v153, v26, v158);
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v60 = sub_24CCBB890();
    __swift_project_value_buffer(v60, (uint64_t)qword_269824810);
    uint64_t v61 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
    uint64_t v62 = v152;
    v61(v152, v58, v59);
    swift_retain_n();
    unint64_t v63 = sub_24CCBB870();
    os_log_type_t v64 = sub_24CCBC040();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = swift_slowAlloc();
      v154 = swift_slowAlloc();
      os_log_t v155 = (os_log_t)swift_slowAlloc();
      v162[0] = (uint64_t)v155;
      *(_DWORD *)uint64_t v65 = 136315650;
      uint64_t v66 = sub_24CCBC5E0();
      char v67 = v62;
      uint64_t v68 = v57;
      uint64_t v161 = sub_24CC692DC(v66, v69, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v65 + 12) = 2080;
      uint64_t v70 = sub_24CC6CC6C();
      uint64_t v161 = sub_24CC692DC(v70, v71, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v65 + 22) = 2112;
      sub_24CC74BC8(&qword_269822030, MEMORY[0x263F14320]);
      swift_allocError();
      v61(v72, v67, v158);
      uint64_t v73 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v161 = v73;
      sub_24CCBC120();
      uint64_t v74 = v154;
      v154->Class isa = (Class)v73;
      v75 = *(void (**)(char *, uint64_t))(v68 + 8);
      v75(v67, v158);
      _os_log_impl(&dword_24CC60000, v63, v64, "%s [%s] connection failed with %@", (uint8_t *)v65, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
      swift_arrayDestroy();
      uint64_t v59 = v158;
      MEMORY[0x2533103A0](v74, -1, -1);
      os_log_t v76 = v155;
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v76, -1, -1);
      uint64_t v77 = v65;
      v58 = v153;
      MEMORY[0x2533103A0](v77, -1, -1);
    }
    else
    {
      swift_release_n();
      v75 = *(void (**)(char *, uint64_t))(v57 + 8);
      v75(v62, v59);
    }

    MEMORY[0x270FA5388](v90);
    *(&v144 - 2) = v58;
    sub_24CC6F8E4();
    v75(v58, v59);
  }
  else if (v35 == *MEMORY[0x263F14208] || v35 == *MEMORY[0x263F14228])
  {
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v91 = sub_24CCBB890();
    __swift_project_value_buffer(v91, (uint64_t)qword_269824810);
    os_log_t v92 = v151;
    v34((char *)v151, a1, v36);
    swift_retain_n();
    v93 = sub_24CCBB870();
    os_log_type_t v94 = sub_24CCBC060();
    int v95 = v94;
    if (os_log_type_enabled(v93, v94))
    {
      uint64_t v96 = swift_slowAlloc();
      uint64_t v158 = swift_slowAlloc();
      v162[0] = v158;
      *(_DWORD *)uint64_t v96 = 136315650;
      LODWORD(v157) = v95;
      uint64_t v97 = sub_24CCBC5E0();
      uint64_t v161 = sub_24CC692DC(v97, v98, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v96 + 12) = 2080;
      uint64_t v99 = sub_24CC6CC6C();
      uint64_t v161 = sub_24CC692DC(v99, v100, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v96 + 22) = 2080;
      os_log_t v159 = v93;
      os_log_t v101 = v151;
      v34((char *)v150, (uint64_t)v151, v36);
      uint64_t v102 = sub_24CCBBE70();
      uint64_t v161 = sub_24CC692DC(v102, v103, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      (*((void (**)(os_log_t, os_log_t))v37 + 1))(v101, v36);
      v93 = v159;
      _os_log_impl(&dword_24CC60000, v159, (os_log_type_t)v157, "%s [%s] connection state %s", (uint8_t *)v96, 0x20u);
      uint64_t v104 = v158;
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v104, -1, -1);
      MEMORY[0x2533103A0](v96, -1, -1);
    }
    else
    {
      swift_release_n();
      (*((void (**)(os_log_t, os_log_t))v37 + 1))(v92, v36);
    }
  }
  else if (v35 == *MEMORY[0x263F14200])
  {
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v78 = sub_24CCBB890();
    __swift_project_value_buffer(v78, (uint64_t)qword_269824810);
    os_log_t v79 = v159;
    swift_retain_n();
    v80 = sub_24CCBB870();
    os_log_type_t v81 = sub_24CCBC060();
    BOOL v82 = os_log_type_enabled(v80, v81);
    uint64_t v83 = v148;
    if (v82)
    {
      uint64_t v84 = swift_slowAlloc();
      uint64_t v85 = swift_slowAlloc();
      v162[0] = v85;
      *(_DWORD *)uint64_t v84 = 136315394;
      uint64_t v86 = sub_24CCBC5E0();
      uint64_t v161 = sub_24CC692DC(v86, v87, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v84 + 12) = 2080;
      uint64_t v88 = sub_24CC6CC6C();
      uint64_t v161 = sub_24CC692DC(v88, v89, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24CC60000, v80, v81, "%s [%s] connection established", (uint8_t *)v84, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v85, -1, -1);
      MEMORY[0x2533103A0](v84, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v114 = v149;
    sub_24CC6F8E4();
    sub_24CC6FD10();
    v115 = (char *)v79 + qword_269821DC0;
    swift_beginAccess();
    uint64_t v116 = (uint64_t)v115;
    uint64_t v117 = v146;
    sub_24CC74734(v116, v146, &qword_269821DE8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v83 + 48))(v117, 1, v114) == 1)
    {
      sub_24CC744B8(v117, &qword_269821DE8);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v83 + 32))(v147, v117, v114);
      swift_retain_n();
      v134 = sub_24CCBB870();
      os_log_type_t v135 = sub_24CCBC060();
      if (os_log_type_enabled(v134, v135))
      {
        uint64_t v136 = swift_slowAlloc();
        uint64_t v137 = swift_slowAlloc();
        uint64_t v161 = v137;
        *(_DWORD *)uint64_t v136 = 136315394;
        uint64_t v138 = sub_24CCBC5E0();
        uint64_t v160 = sub_24CC692DC(v138, v139, &v161);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v136 + 12) = 2080;
        uint64_t v140 = sub_24CC6CC6C();
        uint64_t v160 = sub_24CC692DC(v140, v141, &v161);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_24CC60000, v134, v135, "%s [%s] resuming activate(), connection is ready", (uint8_t *)v136, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v137, -1, -1);
        MEMORY[0x2533103A0](v136, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      v142 = v147;
      sub_24CCBBF60();
      uint64_t v143 = (uint64_t)v145;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v83 + 56))(v145, 1, 1, v114);
      sub_24CC6CEC8(v143);
      (*(void (**)(char *, uint64_t))(v83 + 8))(v142, v114);
    }
  }
  else if (v35 == *MEMORY[0x263F14220])
  {
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v105 = sub_24CCBB890();
    __swift_project_value_buffer(v105, (uint64_t)qword_269824810);
    swift_retain_n();
    v106 = sub_24CCBB870();
    os_log_type_t v107 = sub_24CCBC060();
    if (os_log_type_enabled(v106, v107))
    {
      uint64_t v108 = swift_slowAlloc();
      uint64_t v109 = swift_slowAlloc();
      v162[0] = v109;
      *(_DWORD *)uint64_t v108 = 136315394;
      uint64_t v110 = sub_24CCBC5E0();
      uint64_t v161 = sub_24CC692DC(v110, v111, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v108 + 12) = 2080;
      uint64_t v112 = sub_24CC6CC6C();
      uint64_t v161 = sub_24CC692DC(v112, v113, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24CC60000, v106, v107, "%s [%s] connection state cancelled", (uint8_t *)v108, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v109, -1, -1);
      MEMORY[0x2533103A0](v108, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    sub_24CC6F8E4();
  }
  else
  {
    uint64_t v158 = (uint64_t)isa;
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v118 = sub_24CCBB890();
    __swift_project_value_buffer(v118, (uint64_t)qword_269824810);
    v119 = v144;
    v34(v144, a1, v36);
    swift_retain_n();
    v120 = sub_24CCBB870();
    os_log_type_t v121 = sub_24CCBC050();
    int v122 = v121;
    if (os_log_type_enabled(v120, v121))
    {
      v123 = v119;
      uint64_t v124 = swift_slowAlloc();
      uint64_t v157 = swift_slowAlloc();
      v162[0] = v157;
      *(_DWORD *)uint64_t v124 = 136315650;
      uint64_t v125 = sub_24CCBC5E0();
      LODWORD(v156.isa) = v122;
      uint64_t v161 = sub_24CC692DC(v125, v126, v162);
      os_log_t v155 = v120;
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v124 + 12) = 2080;
      uint64_t v127 = sub_24CC6CC6C();
      uint64_t v161 = sub_24CC692DC(v127, v128, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v124 + 22) = 2080;
      v34((char *)v150, (uint64_t)v123, v36);
      uint64_t v129 = sub_24CCBBE70();
      uint64_t v161 = sub_24CC692DC(v129, v130, v162);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      v131 = *(void (**)(char *, os_log_t))(v158 + 8);
      v131(v123, v36);
      os_log_t v132 = v155;
      _os_log_impl(&dword_24CC60000, v155, (os_log_type_t)v156.isa, "%s [%s] unexpected connection state %s", (uint8_t *)v124, 0x20u);
      uint64_t v133 = v157;
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v133, -1, -1);
      MEMORY[0x2533103A0](v124, -1, -1);
    }
    else
    {
      swift_release_n();
      v131 = *(void (**)(char *, os_log_t))(v158 + 8);
      v131(v119, v36);
    }
    v131(v26, v36);
  }
}

void sub_24CC6F7E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_24CCBBC00();
  sub_24CC74BC8(&qword_269822030, MEMORY[0x263F14320]);
  uint64_t v7 = (void *)swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v8, a3, v6);
  (*(void (**)(void *, uint64_t, uint64_t))(a2 + 8))(v7, ObjectType, a2);
}

uint64_t sub_24CC6F8E4()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_269824810);
  swift_retain_n();
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v9 = v4;
    *(_DWORD *)uint64_t v3 = 136315650;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v9);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24CC692DC(0xD000000000000013, 0x800000024CCBEEE0, &v9);
    sub_24CCBC120();
    *(_WORD *)(v3 + 22) = 2048;
    sub_24CCBB5A0();
    swift_release();
    sub_24CCBC120();
    swift_release();
    _os_log_impl(&dword_24CC60000, v1, v2, "%s %s: observerCount:%ld", (uint8_t *)v3, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }
  else
  {

    uint64_t v7 = swift_release_n();
  }
  MEMORY[0x270FA5388](v7);
  return sub_24CCBB5D0();
}

uint64_t sub_24CC6FB90(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(ObjectType, a2);
}

void sub_24CC6FBD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_24CCBBC00();
  sub_24CC74BC8(&qword_269822030, MEMORY[0x263F14320]);
  uint64_t v7 = (void *)swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v8, a3, v6);
  (*(void (**)(void *, uint64_t, uint64_t))(a2 + 24))(v7, ObjectType, a2);
}

uint64_t sub_24CC6FCD0(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(ObjectType, a2);
}

uint64_t sub_24CC6FD10()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_24CCBBD90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = (void *)v0[3];
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F0E0], v2);
  id v7 = v6;
  LOBYTE(v6) = sub_24CCBBDA0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    uint64_t v9 = swift_allocObject();
    swift_weakInit();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = *(void *)(v1 + 80);
    v10[3] = *(void *)(v1 + 88);
    void v10[4] = v9;
    swift_retain();
    sub_24CCBBA10();
    swift_release();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24CC6FED0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CC74144(a1, a2, a3, a5);
    return swift_release();
  }
  return result;
}

uint64_t sub_24CC6FF5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a4;
  v8[7] = a6;
  uint64_t v13 = sub_24CCBB890();
  v8[10] = v13;
  v8[11] = *(void *)(v13 - 8);
  v8[12] = swift_task_alloc();
  uint64_t v14 = swift_task_alloc();
  v8[13] = v14;
  *(void *)uint64_t v14 = v8;
  *(void *)(v14 + 8) = sub_24CC70088;
  *(void *)(v14 + 40) = a7;
  *(void *)(v14 + 48) = a4;
  *(void *)(v14 + 32) = a6;
  *(_DWORD *)(v14 + 64) = a5;
  return MEMORY[0x270FA2498](sub_24CC71090, 0, 0);
}

uint64_t sub_24CC70088(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 112) = v2;
  swift_task_dealloc();
  if (v2)
  {
    return MEMORY[0x270FA2498](sub_24CC701F8, 0, 0);
  }
  else
  {
    sub_24CC73704(a1, a2);
    swift_task_dealloc();
    id v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
}

uint64_t sub_24CC701F8()
{
  os_log_type_t v42 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[14];
  uint64_t v3 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v4 = v0[10];
  uint64_t v6 = v0[7];
  unint64_t v5 = v0[8];
  uint64_t v7 = __swift_project_value_buffer(v4, (uint64_t)qword_269824810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v7, v4);
  id v8 = v1;
  swift_retain();
  sub_24CC7464C(v6, v5);
  id v9 = v1;
  swift_retain();
  sub_24CC7464C(v6, v5);
  uint64_t v10 = sub_24CCBB870();
  os_log_type_t v11 = sub_24CCBC040();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v37 = v11;
    log = v10;
    unint64_t v35 = v0[8];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v38 = (void *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v41 = v39;
    *(_DWORD *)uint64_t v12 = 136315906;
    uint64_t v13 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v13, v14, &v41);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v15 = sub_24CC6CC6C();
    v0[3] = sub_24CC692DC(v15, v16, &v41);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v12 + 22) = 2080;
    if (v35 >> 60 == 15)
    {
      unint64_t v17 = 0xE300000000000000;
      uint64_t v18 = 7104878;
    }
    else
    {
      uint64_t v18 = sub_24CCBB490();
      unint64_t v17 = v25;
    }
    uint64_t v26 = (void *)v0[14];
    uint64_t v27 = v0[11];
    uint64_t v34 = v0[10];
    uint64_t v36 = v0[12];
    uint64_t v29 = v0[7];
    unint64_t v28 = v0[8];
    v0[4] = sub_24CC692DC(v18, v17, &v41);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    sub_24CC73704(v29, v28);
    sub_24CC73704(v29, v28);
    *(_WORD *)(v12 + 32) = 2112;
    id v30 = v26;
    uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v31;
    sub_24CCBC120();
    *uint64_t v38 = v31;

    _os_log_impl(&dword_24CC60000, log, v37, "%s [%s] failed to parse message: %s; error: %@", (uint8_t *)v12, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v38, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v39, -1, -1);
    MEMORY[0x2533103A0](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v36, v34);
  }
  else
  {
    uint64_t v19 = (void *)v0[14];
    uint64_t v20 = v0[11];
    uint64_t v21 = v0[12];
    uint64_t v22 = v0[10];
    uint64_t v24 = v0[7];
    unint64_t v23 = v0[8];

    swift_release_n();
    sub_24CC73704(v24, v23);
    sub_24CC73704(v24, v23);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
  }
  swift_task_dealloc();
  uint64_t v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t PeerConnection.deinit()
{
  uint64_t v1 = v0;
  sub_24CCBBA70();
  swift_release();

  sub_24CC744B8(v0 + qword_269824780, &qword_269821D90);
  swift_release();
  uint64_t v2 = v0 + qword_269821DB8;
  uint64_t v3 = sub_24CCBB610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  sub_24CC736F4(*(void *)(v1 + qword_269821DD8));
  sub_24CC744B8(v1 + qword_269821DC0, &qword_269821DE8);
  return v1;
}

uint64_t PeerConnection.__deallocating_deinit()
{
  PeerConnection.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24CC7075C(int a1)
{
  *(void *)(v2 + 32) = v1;
  *(_DWORD *)(v2 + 72) = a1;
  uint64_t v3 = sub_24CCBB890();
  *(void *)(v2 + 40) = v3;
  *(void *)(v2 + 48) = *(void *)(v3 - 8);
  *(void *)(v2 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC70820, 0, 0);
}

uint64_t sub_24CC70820()
{
  uint64_t v24 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_269824810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC060();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = *(void *)(v0 + 48);
  uint64_t v8 = *(void *)(v0 + 56);
  uint64_t v10 = *(void *)(v0 + 40);
  if (v7)
  {
    uint64_t v21 = *(void *)(v0 + 40);
    os_log_type_t type = v6;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v23 = v19;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v12 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0x726F70736E617274, 0xED0000293A5F2874);
    *(void *)(v0 + 16) = sub_24CC692DC(v12, v13, &v23);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v14 = sub_24CC6CC6C();
    *(void *)(v0 + 24) = sub_24CC692DC(v14, v15, &v23);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24CC60000, v5, type, "%{public}s [%s]", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v19, -1, -1);
    MEMORY[0x2533103A0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v21);
  }
  else
  {
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v22 = (uint64_t (*)(uint64_t, void, unint64_t))((int)*MEMORY[0x263F3A050] + MEMORY[0x263F3A050]);
  unint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v16;
  void *v16 = v0;
  v16[1] = sub_24CC70B3C;
  uint64_t v17 = *(unsigned int *)(v0 + 72);
  return v22(v17, 0, 0xF000000000000000);
}

uint64_t sub_24CC70B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  uint64_t v7 = swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2;
  }
  return v9(v7, v8);
}

uint64_t sub_24CC70C78(uint64_t a1, uint64_t a2, int a3, const void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = a1;
  uint64_t v12 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  unint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269822060;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269822068;
  v14[5] = v13;
  swift_retain();
  sub_24CCAB624((uint64_t)v9, (uint64_t)&unk_269822070, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_24CC70DF4(int a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v3[4] = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_24CC70EB0;
  return sub_24CC7075C(a1);
}

uint64_t sub_24CC70EB0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *v3;
  uint64_t v8 = *v3;
  swift_task_dealloc();
  swift_release();
  if (v4)
  {
    uint64_t v9 = sub_24CCBB480();

    uint64_t v10 = 0;
    uint64_t v11 = (void *)v9;
  }
  else if (a2 >> 60 == 15)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_24CCBB4B0();
    sub_24CC73704(a1, a2);
    uint64_t v9 = 0;
    uint64_t v11 = (void *)v10;
  }
  uint64_t v12 = *(void (***)(void, void, void))(v7 + 24);
  v12[2](v12, v10, v9);

  _Block_release(v12);
  unint64_t v13 = *(uint64_t (**)(void))(v8 + 8);
  return v13();
}

uint64_t sub_24CC71068(int a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 40) = a3;
  *(void *)(v4 + 48) = v3;
  *(void *)(v4 + 32) = a2;
  *(_DWORD *)(v4 + 64) = a1;
  return MEMORY[0x270FA2498](sub_24CC71090, 0, 0);
}

uint64_t sub_24CC71090()
{
  uint64_t v17 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  swift_retain_n();
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v16 = v5;
    *(_DWORD *)uint64_t v4 = 136446466;
    uint64_t v6 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0xD000000000000012, 0x800000024CCBED90);
    *(void *)(v0 + 16) = sub_24CC692DC(v6, v7, &v16);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    uint64_t v8 = sub_24CC6CC6C();
    *(void *)(v0 + 24) = sub_24CC692DC(v8, v9, &v16);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24CC60000, v2, v3, "%{public}s [%s]", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F3A050] + MEMORY[0x263F3A050]);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v10;
  void *v10 = v0;
  v10[1] = sub_24CC7133C;
  uint64_t v11 = *(void *)(v0 + 32);
  uint64_t v12 = *(void *)(v0 + 40);
  uint64_t v13 = *(unsigned int *)(v0 + 64);
  return v15(v13, v11, v12);
}

uint64_t sub_24CC7133C(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_24CC7144C(uint64_t a1, uint64_t a2, int a3, void *a4, const void *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = a1;
  uint64_t v14 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269822040;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269822048;
  v16[5] = v15;
  id v17 = a4;
  swift_retain();
  sub_24CCAB624((uint64_t)v11, (uint64_t)&unk_269822050, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_24CC715D4(int a1, void *a2, void *aBlock, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  if (a2)
  {
    id v8 = a2;
    swift_retain();
    a2 = (void *)sub_24CCBB4C0();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  v4[4] = a2;
  v4[5] = v10;
  uint64_t v11 = swift_task_alloc();
  v4[6] = v11;
  *(void *)uint64_t v11 = v4;
  *(void *)(v11 + 8) = sub_24CC716EC;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = a4;
  *(void *)(v11 + 32) = a2;
  *(_DWORD *)(v11 + 64) = a1;
  return MEMORY[0x270FA2498](sub_24CC71090, 0, 0);
}

uint64_t sub_24CC716EC(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *v3;
  unint64_t v8 = *(void *)(*v3 + 40);
  uint64_t v9 = *(void *)(*v3 + 32);
  uint64_t v10 = *v3;
  swift_task_dealloc();
  swift_release();
  sub_24CC73704(v9, v8);
  if (v4)
  {
    uint64_t v11 = sub_24CCBB480();

    uint64_t v12 = 0;
    uint64_t v13 = (void *)v11;
  }
  else if (a2 >> 60 == 15)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = sub_24CCBB4B0();
    sub_24CC73704(a1, a2);
    uint64_t v11 = 0;
    uint64_t v13 = (void *)v12;
  }
  uint64_t v14 = *(void (***)(void, void, void))(v7 + 24);
  v14[2](v14, v12, v11);

  _Block_release(v14);
  uint64_t v15 = *(uint64_t (**)(void))(v10 + 8);
  return v15();
}

uint64_t PeerConnection.send(_:)(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  v2[6] = *v1;
  uint64_t v3 = sub_24CCBBA00();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_24CCBB890();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC71A24, 0, 0);
}

uint64_t sub_24CC71A24()
{
  uint64_t v26 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_269824810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC060();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v9 = *(void *)(v0 + 96);
  uint64_t v10 = *(void *)(v0 + 80);
  if (v7)
  {
    uint64_t v11 = swift_slowAlloc();
    v25[0] = swift_slowAlloc();
    uint64_t v22 = v25[0];
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v12 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0x293A5F28646E6573, 0xE800000000000000);
    *(void *)(v0 + 16) = sub_24CC692DC(v12, v13, v25);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v14 = sub_24CC6CC6C();
    *(void *)(v0 + 24) = sub_24CC692DC(v14, v15, v25);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24CC60000, v5, v6, "%{public}s [%s]", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v22, -1, -1);
    MEMORY[0x2533103A0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  }
  else
  {
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  }
  sub_24CCBBB60();
  sub_24CCBC2E0();
  int v16 = *(_DWORD *)(v0 + 104);
  if (qword_269821A70 != -1) {
    swift_once();
  }
  uint64_t v17 = *(void *)(v0 + 64);
  uint64_t v24 = *(void *)(v0 + 72);
  uint64_t v23 = *(void *)(v0 + 56);
  swift_retain();
  uint64_t v18 = sub_24CCBBB50();
  v25[3] = MEMORY[0x263F8E8F8];
  LODWORD(v25[0]) = v16;
  sub_24CCBBB80();
  sub_24CCBC2E0();
  *(_DWORD *)(v0 + 112) = *(_DWORD *)(v0 + 108);
  sub_24CCBC460();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821E08);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_24CCBD450;
  *(void *)(v19 + 32) = v18;
  v25[0] = v19;
  sub_24CCBBF20();
  sub_24CCBB9F0();
  swift_allocObject();
  swift_retain();
  sub_24CCBB9D0();
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v24, *MEMORY[0x263F141D8], v23);
  sub_24CCBBA40();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v24, v23);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t PeerConnection.send<A>(_:)()
{
  return MEMORY[0x270FA2498](sub_24CC74C44, 0, 0);
}

{
  return MEMORY[0x270FA2498](sub_24CC74C44, 0, 0);
}

uint64_t PeerConnection.send<A>(_:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  v5[9] = *v4;
  uint64_t v6 = sub_24CCBBA00();
  v5[10] = v6;
  v5[11] = *(void *)(v6 - 8);
  v5[12] = swift_task_alloc();
  uint64_t v7 = sub_24CCBC110();
  v5[13] = v7;
  v5[14] = *(void *)(v7 - 8);
  v5[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC72070, 0, 0);
}

uint64_t sub_24CC72070()
{
  uint64_t v27 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  swift_retain_n();
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    v26[0] = v5;
    *(_DWORD *)uint64_t v4 = 136446466;
    uint64_t v6 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0xD000000000000010, 0x800000024CCBEDD0);
    *(void *)(v0 + 16) = sub_24CC692DC(v6, v7, v26);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    uint64_t v8 = sub_24CC6CC6C();
    *(void *)(v0 + 24) = sub_24CC692DC(v8, v9, v26);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24CC60000, v2, v3, "%{public}s [%s]", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v10 = (void *)(v0 + 104);
  uint64_t v11 = *(void *)(v0 + 120);
  uint64_t v12 = *(void *)(v0 + 48);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 112) + 16))(v11, *(void *)(v0 + 40), *(void *)(v0 + 104));
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    uint64_t v14 = 0;
    uint64_t v13 = *(void *)(v0 + 112);
    unint64_t v15 = 0xF000000000000000;
  }
  else
  {
    uint64_t v14 = sub_24CCBB840();
    unint64_t v15 = v16;
    uint64_t v10 = (void *)(v0 + 48);
  }
  uint64_t v25 = v14;
  (*(void (**)(void, void))(v13 + 8))(*(void *)(v0 + 120), *v10);
  sub_24CC72608(v14, v15);
  sub_24CCBBB60();
  sub_24CCBC2E0();
  int v17 = *(_DWORD *)(v0 + 128);
  if (qword_269821A70 != -1) {
    swift_once();
  }
  uint64_t v18 = *(void *)(v0 + 88);
  uint64_t v24 = *(void *)(v0 + 96);
  uint64_t v23 = *(void *)(v0 + 80);
  swift_retain();
  uint64_t v19 = sub_24CCBBB50();
  v26[3] = MEMORY[0x263F8E8F8];
  LODWORD(v26[0]) = v17;
  sub_24CCBBB80();
  sub_24CCBC2E0();
  *(_DWORD *)(v0 + 136) = *(_DWORD *)(v0 + 132);
  sub_24CCBC460();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821E08);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_24CCBD450;
  *(void *)(v20 + 32) = v19;
  v26[0] = v20;
  sub_24CCBBF20();
  sub_24CCBB9F0();
  swift_allocObject();
  swift_retain();
  sub_24CCBB9D0();
  (*(void (**)(uint64_t, void, uint64_t))(v18 + 104))(v24, *MEMORY[0x263F141D8], v23);
  sub_24CCBBA40();
  swift_release();
  sub_24CC73704(v25, v15);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v24, v23);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

void sub_24CC72608(uint64_t a1, unint64_t a2)
{
  uint64_t v33 = a1;
  uint64_t v3 = sub_24CCBB460();
  uint64_t v31 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CCBB440();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24CCBB470();
  uint64_t v32 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AD0 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)qword_269822EE0;
  uint64_t v14 = (void *)sub_24CCBBE20();
  LODWORD(v13) = objc_msgSend(v13, sel_BOOLForKey_, v14);

  if (v13)
  {
    if (a2 >> 60 == 15)
    {
      unint64_t v15 = 0xE400000000000000;
      uint64_t v16 = 1701736302;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = v33;
      switch(a2 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v33), v33))
          {
            __break(1u);
LABEL_20:
            __break(1u);
            JUMPOUT(0x24CC72C00);
          }
          uint64_t v17 = HIDWORD(v33) - (int)v33;
LABEL_11:
          sub_24CC74660(v33, a2);
LABEL_12:
          uint64_t v35 = v17;
          (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F069D8], v6);
          sub_24CCBB450();
          sub_24CCBB410();
          (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v3);
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
          sub_24CC74B74();
          sub_24CC74BC8((unint64_t *)&unk_269822080, MEMORY[0x263F069E8]);
          sub_24CCBC150();
          sub_24CC73704(v18, a2);
          (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v10);
          uint64_t v16 = v34[0];
          unint64_t v15 = v34[1];
          break;
        case 2uLL:
          uint64_t v20 = *(void *)(v33 + 16);
          uint64_t v19 = *(void *)(v33 + 24);
          uint64_t v17 = v19 - v20;
          if (!__OFSUB__(v19, v20)) {
            goto LABEL_11;
          }
          goto LABEL_20;
        case 3uLL:
          goto LABEL_12;
        default:
          uint64_t v17 = BYTE6(a2);
          goto LABEL_12;
      }
    }
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_24CCBB890();
    __swift_project_value_buffer(v21, (uint64_t)qword_269824810);
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_24CCBB870();
    os_log_type_t v23 = sub_24CCBC060();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v34[0] = v25;
      *(_DWORD *)uint64_t v24 = 136446722;
      uint64_t v33 = v16;
      uint64_t v26 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0xD00000000000001BLL, 0x800000024CCBEF00);
      uint64_t v35 = sub_24CC692DC(v26, v27, v34);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      uint64_t v28 = sub_24CC6CC6C();
      uint64_t v35 = sub_24CC692DC(v28, v29, v34);
      sub_24CCBC120();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_24CC692DC(v33, v15, v34);
      sub_24CCBC120();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24CC60000, v22, v23, "%{public}s [%s] Payload size: %s", (uint8_t *)v24, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v25, -1, -1);
      MEMORY[0x2533103A0](v24, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
  }
}

uint64_t PeerConnection.send<A, B>(_:payload:)()
{
  return MEMORY[0x270FA2498](sub_24CC74C44, 0, 0);
}

{
  return MEMORY[0x270FA2498](sub_24CC72C48, 0, 0);
}

uint64_t sub_24CC72C48()
{
  uint64_t v1 = sub_24CCBB810();
  sub_24CC74BC8((unint64_t *)&qword_269822CD0, MEMORY[0x263F3A030]);
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v1 - 8) + 104))(v2, *MEMORY[0x263F3A020], v1);
  swift_willThrow();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24CC72D48()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return sub_24CC6D704();
}

unint64_t sub_24CC72DD8()
{
  return sub_24CC6DF10();
}

uint64_t sub_24CC72DFC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  return PeerConnection.send(_:)(a1);
}

uint64_t sub_24CC72E94()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CC74C44, 0, 0);
}

uint64_t sub_24CC72F38()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CC74C44, 0, 0);
}

uint64_t sub_24CC72FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_24CC6CB14;
  return PeerConnection.send<A>(_:payload:)(a1, a2, a3, a4);
}

uint64_t sub_24CC7309C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC68584;
  return MEMORY[0x270FA2498](sub_24CC74C44, 0, 0);
}

uint64_t sub_24CC73144()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CC72C48, 0, 0);
}

uint64_t sub_24CC731EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24CCBB890();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_269824810);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_unknownObjectRetain_n();
  uint64_t v11 = sub_24CCBB870();
  os_log_type_t v12 = sub_24CCBC060();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = a2;
    uint64_t v14 = v13;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v14 = 136315650;
    uint64_t v23 = v3;
    uint64_t v15 = sub_24CCBC5E0();
    uint64_t v24 = sub_24CC692DC(v15, v16, &v26);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v24 = sub_24CC692DC(0x726573624F646461, 0xEF293A5F28726576, &v26);
    sub_24CCBC120();
    *(_WORD *)(v14 + 22) = 2080;
    uint64_t v24 = a1;
    uint64_t v25 = v21;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822000);
    uint64_t v17 = sub_24CCBBE70();
    uint64_t v24 = sub_24CC692DC(v17, v18, &v26);
    sub_24CCBC120();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v11, v12, "%s %s: %s", (uint8_t *)v14, 0x20u);
    uint64_t v19 = v22;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v19, -1, -1);
    MEMORY[0x2533103A0](v14, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return sub_24CCBB5B0();
}

uint64_t sub_24CC73544(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  swift_unknownObjectRetain();
  swift_getObjectType();
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6) {
    a2(v6, v5);
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_24CC735C0()
{
  sub_24CC735F4();
  return swift_retain();
}

uint64_t sub_24CC735F4()
{
  return *(void *)(v0 + 16);
}

unint64_t sub_24CC735FC()
{
  unint64_t result = qword_269821D98;
  if (!qword_269821D98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269821D98);
  }
  return result;
}

unint64_t sub_24CC7363C()
{
  unint64_t result = qword_269821DB0;
  if (!qword_269821DB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269821DA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269821DB0);
  }
  return result;
}

uint64_t sub_24CC73698()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CC736D0(uint64_t a1)
{
  return sub_24CC6DDAC(a1);
}

unint64_t sub_24CC736DC(unint64_t result)
{
  if (result >= 2) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_24CC736EC(uint64_t a1)
{
  return sub_24CC6DE0C(a1);
}

unint64_t sub_24CC736F4(unint64_t result)
{
  if (result >= 2) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24CC73704(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CC73718(a1, a2);
  }
  return a1;
}

uint64_t sub_24CC73718(uint64_t a1, unint64_t a2)
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

uint64_t sub_24CC73770(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_24CC73778@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC6CBE4(a1);
}

uint64_t sub_24CC737A0()
{
  return 16;
}

__n128 sub_24CC737AC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

void sub_24CC737BC()
{
  sub_24CC73DE8();
  if (v0 <= 0x3F)
  {
    sub_24CCBB610();
    if (v1 <= 0x3F)
    {
      sub_24CC73E40();
      if (v2 <= 0x3F) {
        swift_initClassMetadata2();
      }
    }
  }
}

uint64_t type metadata accessor for PeerConnection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PeerConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PeerConnection);
}

uint64_t dispatch thunk of PeerConnection.identifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of PeerConnection.identifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of PeerConnection.identifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of PeerConnection.__allocating_init(nwConnection:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of PeerConnection.activate()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 240) + **(int **)(*(void *)v0 + 240));
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  return v4();
}

uint64_t dispatch thunk of PeerConnection.invalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of PeerConnection.transport(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 288) + **(int **)(*(void *)v1 + 288));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CC74C50;
  return v6(a1);
}

uint64_t dispatch thunk of PeerConnection.transport(_:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 296)
                                                          + **(int **)(*(void *)v3 + 296));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24CC73CDC;
  return v10(a1, a2, a3);
}

uint64_t sub_24CC73CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

void sub_24CC73DE8()
{
  if (!qword_269821F10)
  {
    sub_24CCBB520();
    unint64_t v0 = sub_24CCBC110();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269821F10);
    }
  }
}

void sub_24CC73E40()
{
  if (!qword_269821F18[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269821DC8);
    unint64_t v0 = sub_24CCBC110();
    if (!v1) {
      atomic_store(v0, qword_269821F18);
    }
  }
}

uint64_t sub_24CC73E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t *sub_24CC73EA4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_unknownObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t sub_24CC73EE0(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_unknownObjectRelease();
  }
  return result;
}

unint64_t *sub_24CC73EF8(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_unknownObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_unknownObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *sub_24CC73F98(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_unknownObjectRelease();
LABEL_6:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_24CC73FFC(uint64_t *a1, unsigned int a2)
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

uint64_t sub_24CC74050(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_24CC740AC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24CC740C8(void *result, int a2)
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

uint64_t type metadata accessor for PeerConnection.TransactionState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CC74100()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CC74138(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24CC6FED0(a1, a2, a3, a4, a5);
}

uint64_t sub_24CC74144(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5 = v4;
  uint64_t v24 = *v5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v10 - 8);
  os_log_type_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24CCBBD90();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (uint64_t *)((char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = (void *)v5[3];
  void *v16 = v17;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F8F0E0], v13);
  id v18 = v17;
  LOBYTE(v17) = sub_24CCBBDA0();
  (*(void (**)(void *, uint64_t))(v14 + 8))(v16, v13);
  if ((v17 & 1) == 0)
  {
    __break(1u);
LABEL_15:
    swift_once();
    goto LABEL_4;
  }
  if (!a3) {
    goto LABEL_11;
  }
  if (qword_269821A70 != -1) {
    goto LABEL_15;
  }
LABEL_4:
  if (sub_24CCBB9E0())
  {
    sub_24CCBBB60();
    if (swift_dynamicCastClass())
    {
      sub_24CCBBB70();
      if (v27)
      {
        if (swift_dynamicCast())
        {
          int v19 = v25;
          uint64_t v20 = sub_24CCBBFA0();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 1, 1, v20);
          uint64_t v21 = swift_allocObject();
          *(void *)(v21 + 16) = 0;
          *(void *)(v21 + 24) = 0;
          *(void *)(v21 + 32) = v5;
          *(_DWORD *)(v21 + 40) = v19;
          *(void *)(v21 + 48) = a1;
          *(void *)(v21 + 56) = a2;
          *(void *)(v21 + 64) = v24;
          swift_retain();
          sub_24CC7464C(a1, a2);
          sub_24CC88D24((uint64_t)v12, (uint64_t)&unk_269822020, v21);
          swift_release();
        }
      }
      else
      {
        sub_24CC744B8((uint64_t)v26, &qword_269822010);
      }
    }
    swift_release();
  }
LABEL_11:
  uint64_t v22 = sub_24CCBBC00();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(a4, 1, v22);
  if (result == 1) {
    return sub_24CC6FD10();
  }
  return result;
}

uint64_t sub_24CC744B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CC74514()
{
  swift_unknownObjectRelease();
  swift_release();
  unint64_t v1 = *(void *)(v0 + 56);
  if (v1 >> 60 != 15) {
    sub_24CC73718(*(void *)(v0 + 48), v1);
  }
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24CC7456C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  int v7 = *(_DWORD *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  uint64_t v10 = *(void *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_24CC68584;
  return sub_24CC6FF5C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24CC7464C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CC74660(a1, a2);
  }
  return a1;
}

uint64_t sub_24CC74660(uint64_t a1, unint64_t a2)
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

void sub_24CC746B8(uint64_t a1, uint64_t a2)
{
  sub_24CC6FBD0(a1, a2, *(void *)(v2 + 16));
}

void sub_24CC746C0(uint64_t a1, uint64_t a2)
{
  sub_24CC6F7E4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_24CC746C8(uint64_t a1)
{
  return sub_24CC73544(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_24CC746D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CC74734(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CC74798()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CC747E0()
{
  int v2 = *(_DWORD *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_24CC6CB14;
  int v7 = (uint64_t (*)(int, void *, void *, uint64_t))((char *)&dword_269822038 + dword_269822038);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_24CC748A8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24CC6CB14;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_269822E70 + dword_269822E70);
  return v6(v2, v3, v4);
}

uint64_t sub_24CC7496C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  int v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *int v7 = v2;
  v7[1] = sub_24CC6CB14;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_269822E80 + dword_269822E80);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24CC74A38()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CC74A78()
{
  int v2 = *(_DWORD *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24CC6CB14;
  uint64_t v6 = (uint64_t (*)(int, void *, uint64_t))((char *)&dword_269822058 + dword_269822058);
  return v6(v2, v4, v3);
}

uint64_t objectdestroy_28Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_24CC74B74()
{
  unint64_t result = qword_269822078;
  if (!qword_269822078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269822078);
  }
  return result;
}

uint64_t sub_24CC74BC8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24CC74C54()
{
  type metadata accessor for PeerProtocolFramer();
  sub_24CC75544();
  sub_24CCBBB30();
  swift_allocObject();
  uint64_t result = sub_24CCBBB20();
  qword_269824788 = result;
  return result;
}

uint64_t type metadata accessor for PeerProtocolFramer()
{
  return self;
}

uint64_t sub_24CC74CD4()
{
  uint64_t v0 = qword_269822090;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_24CC74D0C()
{
  swift_release();
  type metadata accessor for PeerProtocolFramer();
  return swift_allocObject();
}

uint64_t sub_24CC74D40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F14288];
  uint64_t v3 = sub_24CCBBB40();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_24CC74DBC()
{
  return 1;
}

uint64_t sub_24CC74DC4()
{
  return qword_269822C48;
}

void sub_24CC74F40(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  sub_24CCBBB70();
  if (v21)
  {
    if (swift_dynamicCast())
    {
      if ((a3 & 0x8000000000000000) != 0 || HIDWORD(a3))
      {
        sub_24CCBC3C0();
        __break(1u);
      }
      else
      {
        int v17 = a3;
        uint64_t v19 = sub_24CCA83D4(&__src, 4);
        unint64_t v20 = v4;
        uint64_t v5 = sub_24CCA83D4(&v17, 4);
        unint64_t v7 = v6;
        sub_24CCBB4D0();
        sub_24CC73718(v5, v7);
        uint64_t v8 = v19;
        unint64_t v9 = v20;
        sub_24CCBBBC0();
        sub_24CC73718(v8, v9);
        sub_24CCBBBD0();
      }
      return;
    }
  }
  else
  {
    sub_24CC754D8((uint64_t)&v19);
  }
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24CCBB890();
  __swift_project_value_buffer(v10, (uint64_t)qword_269824810);
  swift_retain_n();
  uint64_t v11 = sub_24CCBB870();
  os_log_type_t v12 = sub_24CCBC040();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v19 = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    sub_24CC692DC(0xD000000000000036, 0x800000024CCBEFC0, &v19);
    sub_24CCBC120();
    *(_WORD *)(v13 + 12) = 2080;
    sub_24CCBBB60();
    swift_retain();
    uint64_t v15 = sub_24CCBBE70();
    uint64_t __src = sub_24CC692DC(v15, v16, &v19);
    sub_24CCBC120();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v11, v12, "%s invalid message transport item %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v14, -1, -1);
    MEMORY[0x2533103A0](v13, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_24CC754D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822010);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CC75538(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_24CC88C28(a1, a2, a3 & 1, a4, *(void *)(v4 + 16));
}

unint64_t sub_24CC75544()
{
  unint64_t result = qword_2698220A0;
  if (!qword_2698220A0)
  {
    type metadata accessor for PeerProtocolFramer();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698220A0);
  }
  return result;
}

void AVOutputContext.setOutputDevice(_:completionHandler:)(uint64_t a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698220A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CCBD620;
  uint64_t v8 = (void *)*MEMORY[0x263EF9FB8];
  *(void *)(inited + 32) = *MEMORY[0x263EF9FB8];
  *(void *)(inited + 64) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 40) = 1;
  id v9 = v8;
  sub_24CC756FC(inited);
  type metadata accessor for AVOutputContextSetOutputDeviceOptionsKey(0);
  sub_24CC7582C();
  uint64_t v10 = (void *)sub_24CCBBDB0();
  swift_bridgeObjectRelease();
  if (a2)
  {
    aBlock[4] = a2;
    aBlock[5] = a3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24CC759BC;
    aBlock[3] = &block_descriptor_1;
    a2 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v3, sel_setOutputDevice_options_completionHandler_, a1, v10, a2);
  _Block_release(a2);
}

unint64_t sub_24CC756FC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698220F8);
  uint64_t v2 = sub_24CCBC410();
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
    sub_24CC74734(v6, (uint64_t)&v13, (uint64_t *)&unk_269822100);
    uint64_t v7 = v13;
    unint64_t result = sub_24CC9F2C8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_24CC761F4(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_24CC7582C()
{
  unint64_t result = qword_269821B10;
  if (!qword_269821B10)
  {
    type metadata accessor for AVOutputContextSetOutputDeviceOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269821B10);
  }
  return result;
}

unint64_t sub_24CC75884(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698220E8);
  uint64_t v2 = sub_24CCBC410();
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
    sub_24CC74734(v6, (uint64_t)&v15, &qword_2698220F0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24CC9F3A0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24CC761F4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

void sub_24CC759BC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
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

uint64_t AVOutputContext.setOutputDevice(_:)(uint64_t a1)
{
  *(void *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = v1;
  return MEMORY[0x270FA2498](sub_24CC75A5C, 0, 0);
}

uint64_t sub_24CC75A5C()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = (void *)v0[26];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698220A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CCBD620;
  id v4 = (void *)*MEMORY[0x263EF9FB8];
  *(void *)(inited + 32) = *MEMORY[0x263EF9FB8];
  *(void *)(inited + 64) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 40) = 1;
  id v5 = v4;
  sub_24CC756FC(inited);
  type metadata accessor for AVOutputContextSetOutputDeviceOptionsKey(0);
  sub_24CC7582C();
  uint64_t v6 = sub_24CCBBDB0();
  v0[27] = v6;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 24;
  v0[3] = sub_24CC75C0C;
  uint64_t v7 = swift_continuation_init();
  v0[19] = MEMORY[0x263EF8330];
  v0[20] = 0x40000000;
  v0[21] = sub_24CC75D54;
  v0[22] = &block_descriptor_1;
  v0[23] = v7;
  objc_msgSend(v2, sel_setOutputDevice_options_completionHandler_, v1, v6, v0 + 19);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24CC75C0C()
{
  return MEMORY[0x270FA2498](sub_24CC75CEC, 0, 0);
}

uint64_t sub_24CC75CEC()
{
  uint64_t v1 = *(void *)(v0 + 192);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24CC75D54(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;
  return MEMORY[0x270FA2400](v2);
}

id sub_24CC75DA8()
{
  id v1 = objc_msgSend(*v0, sel_outputDevice);
  return v1;
}

void sub_24CC75DE0(uint64_t a1, void *a2, uint64_t a3)
{
}

uint64_t sub_24CC75E04(uint64_t a1)
{
  uint64_t v4 = *v1;
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_24CC7621C;
  v5[25] = a1;
  v5[26] = v4;
  return MEMORY[0x270FA2498](sub_24CC75A5C, 0, 0);
}

uint64_t dispatch thunk of ViewMirroringOutputCoordinating.outputDevice.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ViewMirroringOutputCoordinating.setOutputDevice(_:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of ViewMirroringOutputCoordinating.setOutputDevice(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24CC6C758;
  return v9(a1, a2, a3);
}

unint64_t sub_24CC75FE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698220D8);
    uint64_t v3 = (void *)sub_24CCBC410();
    for (uint64_t i = a1 + 32; ; i += 48)
    {
      sub_24CC74734(i, (uint64_t)&v11, &qword_2698220E0);
      uint64_t v5 = v11;
      unint64_t result = sub_24CC9F35C(v11);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      unint64_t result = sub_24CC76204(&v12, v3[7] + 40 * result);
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

unint64_t sub_24CC760F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698220C8);
    uint64_t v3 = (void *)sub_24CCBC410();
    for (uint64_t i = a1 + 32; ; i += 40)
    {
      sub_24CC74734(i, (uint64_t)&v11, &qword_2698220D0);
      unsigned int v5 = v11;
      unint64_t result = sub_24CC9F418(v11);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
      unint64_t result = (unint64_t)sub_24CC761F4(&v12, (_OWORD *)(v3[7] + 32 * result));
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

_OWORD *sub_24CC761F4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24CC76204(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

BOOL sub_24CC76220(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24CC76230()
{
  return sub_24CCBC550();
}

uint64_t sub_24CC76258()
{
  return sub_24CCBC570();
}

uint64_t sub_24CC762A0@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = type metadata accessor for PeerConnectionServiceCoordinator.State();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, v1 + 112, v3);
}

uint64_t sub_24CC76350(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = type metadata accessor for PeerConnectionServiceCoordinator.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(v1 + 112, a1, v3);
  return swift_endAccess();
}

uint64_t sub_24CC76408()
{
  return *(void *)(v0 + 168);
}

uint64_t sub_24CC76410(uint64_t result)
{
  *(void *)(v1 + 168) = result;
  return result;
}

BOOL sub_24CC76418(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24CC76220(*a1, *a2);
}

uint64_t sub_24CC76424()
{
  return sub_24CC76258();
}

uint64_t sub_24CC7642C()
{
  return sub_24CC76230();
}

uint64_t sub_24CC76434()
{
  return sub_24CCBC570();
}

uint64_t PeerConnectionServiceCoordinator.__allocating_init(nearbyDeviceProviding:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_OWORD *)(v4 + 144) = 0u;
  *(_OWORD *)(v4 + 160) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_OWORD *)(v4 + 128) = 0u;
  *(void *)(v4 + 192) = 0;
  *(void *)(v4 + 200) = 0;
  *(void *)(v4 + 176) = a1;
  *(void *)(v4 + 184) = a2;
  return v4;
}

uint64_t PeerConnectionServiceCoordinator.init(nearbyDeviceProviding:)(uint64_t a1, uint64_t a2)
{
  swift_defaultActor_initialize();
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(void *)(v2 + 192) = 0;
  *(void *)(v2 + 200) = 0;
  *(void *)(v2 + 176) = a1;
  *(void *)(v2 + 184) = a2;
  return v2;
}

uint64_t sub_24CC7651C(char a1)
{
  *(void *)(v2 + 192) = v1;
  *(unsigned char *)(v2 + 344) = a1;
  *(void *)(v2 + 200) = *v1;
  *(void *)(v2 + 208) = *v1;
  return MEMORY[0x270FA2498](sub_24CC76590, v1, 0);
}

uint64_t sub_24CC76590()
{
  uint64_t v25 = v0;
  sub_24CC762A0(v0 + 16);
  if (*(void *)(v0 + 24))
  {
    swift_release();
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_24CC76AE0;
    uint64_t v2 = *(void **)(v0 + 192);
    v1[14] = v2;
    v1[15] = *v2;
    return MEMORY[0x270FA2498](sub_24CC77D4C, v2, 0);
  }
  else if (*(unsigned char *)(v0 + 344))
  {
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24CCBB890();
    __swift_project_value_buffer(v15, (uint64_t)qword_269824810);
    uint64_t v16 = sub_24CCBB870();
    os_log_type_t v17 = sub_24CCBC060();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v24[0] = v19;
      *(_DWORD *)id v18 = 136315138;
      uint64_t v20 = sub_24CCBC5E0();
      *(void *)(v0 + 176) = sub_24CC692DC(v20, v21, v24);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v16, v17, "[%s] Initializing listener", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v19, -1, -1);
      MEMORY[0x2533103A0](v18, -1, -1);
    }

    type metadata accessor for PeerListener();
    *(void *)(v0 + 264) = sub_24CC96950();
    sub_24CC96988();
    uint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_24CC772B4;
    return sub_24CC96ED4();
  }
  else
  {
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24CCBB890();
    __swift_project_value_buffer(v3, (uint64_t)qword_269824810);
    uint64_t v4 = sub_24CCBB870();
    os_log_type_t v5 = sub_24CCBC060();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      v24[0] = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      uint64_t v8 = sub_24CCBC5E0();
      *(void *)(v0 + 184) = sub_24CC692DC(v8, v9, v24);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v4, v5, "[%s] Initializing browser", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v7, -1, -1);
      MEMORY[0x2533103A0](v6, -1, -1);
    }

    uint64_t v10 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v10 + 176);
    uint64_t v12 = *(void *)(v10 + 184);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 24))(ObjectType, v12);
    type metadata accessor for PeerBrowser();
    *(void *)(v0 + 232) = PeerBrowser.__allocating_init(nearbyDeviceProvider:)(v11, v12);
    swift_unknownObjectRetain();
    sub_24CC99D14();
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v14;
    void *v14 = v0;
    v14[1] = sub_24CC770A0;
    return sub_24CC9A084();
  }
}

uint64_t sub_24CC76AE0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 224) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 192);
  if (v0) {
    uint64_t v4 = sub_24CC77B50;
  }
  else {
    uint64_t v4 = sub_24CC76C0C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24CC76C0C()
{
  uint64_t v25 = v0;
  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  if (*(unsigned char *)(v0 + 344))
  {
    uint64_t v14 = *(void *)(v0 + 224);
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24CCBB890();
    __swift_project_value_buffer(v15, (uint64_t)qword_269824810);
    uint64_t v16 = sub_24CCBB870();
    os_log_type_t v17 = sub_24CCBC060();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v24[0] = v19;
      *(_DWORD *)id v18 = 136315138;
      uint64_t v20 = sub_24CCBC5E0();
      *(void *)(v0 + 176) = sub_24CC692DC(v20, v21, v24);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v16, v17, "[%s] Initializing listener", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v19, -1, -1);
      MEMORY[0x2533103A0](v18, -1, -1);
    }

    type metadata accessor for PeerListener();
    *(void *)(v0 + 264) = sub_24CC96950();
    sub_24CC96988();
    if (v14)
    {
      swift_release();
      uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
      return v22();
    }
    else
    {
      uint64_t v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 272) = v23;
      *uint64_t v23 = v0;
      v23[1] = sub_24CC772B4;
      return sub_24CC96ED4();
    }
  }
  else
  {
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_24CCBB890();
    __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
    uint64_t v2 = sub_24CCBB870();
    os_log_type_t v3 = sub_24CCBC060();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      v24[0] = v5;
      *(_DWORD *)uint64_t v4 = 136315138;
      uint64_t v6 = sub_24CCBC5E0();
      *(void *)(v0 + 184) = sub_24CC692DC(v6, v7, v24);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v2, v3, "[%s] Initializing browser", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v5, -1, -1);
      MEMORY[0x2533103A0](v4, -1, -1);
    }

    uint64_t v8 = *(void *)(v0 + 192);
    uint64_t v9 = *(void *)(v8 + 176);
    uint64_t v10 = *(void *)(v8 + 184);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v10 + 24))(ObjectType, v10);
    type metadata accessor for PeerBrowser();
    *(void *)(v0 + 232) = PeerBrowser.__allocating_init(nearbyDeviceProvider:)(v9, v10);
    swift_unknownObjectRetain();
    sub_24CC99D14();
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v12;
    void *v12 = v0;
    v12[1] = sub_24CC770A0;
    return sub_24CC9A084();
  }
}

uint64_t sub_24CC770A0(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[31] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[24];
  if (v1)
  {
    uint64_t v6 = sub_24CC77BB4;
  }
  else
  {
    v4[32] = a1;
    uint64_t v6 = sub_24CC771DC;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24CC771DC()
{
  uint64_t v1 = v0[24];
  swift_retain();
  sub_24CC731EC(v1, (uint64_t)&off_26FF2B210);
  swift_release();
  sub_24CC9AAC8();
  v0[37] = v0[32];
  swift_release();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[38] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24CC774C8;
  return sub_24CC6D704();
}

uint64_t sub_24CC772B4(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[35] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[24];
  if (v1)
  {
    uint64_t v6 = sub_24CC77C18;
  }
  else
  {
    v4[36] = a1;
    uint64_t v6 = sub_24CC773F0;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24CC773F0()
{
  uint64_t v1 = v0[24];
  swift_retain();
  sub_24CC731EC(v1, (uint64_t)&off_26FF2B210);
  swift_release();
  sub_24CC974D0();
  v0[37] = v0[36];
  swift_release();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[38] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24CC774C8;
  return sub_24CC6D704();
}

uint64_t sub_24CC774C8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 192);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CC775D8, v1, 0);
}

uint64_t sub_24CC775D8()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0[24];
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 192);
  v0[39] = v2;
  v0[40] = *(void *)(v1 + 200);
  if (v2)
  {
    uint64_t v3 = v0[37];
    sub_24CC7B4A8((uint64_t)v2);
    v2(v3);
    uint64_t v4 = v0[19];
    uint64_t v5 = v0[20];
    __swift_project_boxed_opaque_existential_1(v0 + 16, v4);
    id v18 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v5 + 8) + **(int **)(v5 + 8));
    uint64_t v6 = (void *)swift_task_alloc();
    v0[41] = v6;
    void *v6 = v0;
    v6[1] = sub_24CC7795C;
    return v18(v4, v5);
  }
  else
  {
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24CCBB890();
    __swift_project_value_buffer(v8, (uint64_t)qword_269824810);
    uint64_t v9 = sub_24CCBB870();
    os_log_type_t v10 = sub_24CCBC050();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v19 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = sub_24CCBC5E0();
      v0[21] = sub_24CC692DC(v13, v14, &v19);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v9, v10, "[%s] Peer connection service provider not set", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v12, -1, -1);
      MEMORY[0x2533103A0](v11, -1, -1);
    }

    uint64_t v15 = sub_24CCBB810();
    sub_24CC7B948((unint64_t *)&qword_269822CD0, MEMORY[0x263F3A030]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v15 - 8) + 104))(v16, *MEMORY[0x263F3A028], v15);
    swift_willThrow();
    swift_release();
    os_log_type_t v17 = (uint64_t (*)(void))v0[1];
    return v17();
  }
}

uint64_t sub_24CC7795C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 336) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 192);
  if (v0) {
    uint64_t v4 = sub_24CC77C7C;
  }
  else {
    uint64_t v4 = sub_24CC77A88;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24CC77A88()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 296);
  *(unsigned char *)(v0 + 72) = *(unsigned char *)(v0 + 344) & 1;
  *(void *)(v0 + 80) = v2;
  sub_24CC7B4B8(v0 + 128, v0 + 88);
  swift_retain();
  sub_24CC76350(v0 + 72);
  swift_release();
  sub_24CC7A854(v1);
  __swift_destroy_boxed_opaque_existential_0(v0 + 128);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24CC77B50()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC77BB4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC77C18()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC77C7C()
{
  uint64_t v1 = *(void *)(v0 + 312);
  swift_release();
  sub_24CC7A854(v1);
  __swift_destroy_boxed_opaque_existential_0(v0 + 128);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24CC77D04()
{
  *(void *)(v1 + 112) = v0;
  *(void *)(v1 + 120) = *v0;
  return MEMORY[0x270FA2498](sub_24CC77D4C, v0, 0);
}

uint64_t sub_24CC77D4C()
{
  uint64_t v11 = v0;
  sub_24CC762A0(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 128) = v1;
  if (v1)
  {
    sub_24CC76204((long long *)(v0 + 32), v0 + 72);
    uint64_t v2 = *(void *)(v0 + 96);
    uint64_t v3 = *(void *)(v0 + 104);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 72), v2);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_24CC77F0C;
    return v8(v2, v3);
  }
  else
  {
    uint64_t v6 = type metadata accessor for PeerConnectionServiceCoordinator.State();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + 16, v6);
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    sub_24CC76350((uint64_t)v9);
    unint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_24CC77F0C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 112);
  if (v0) {
    uint64_t v4 = sub_24CC780C4;
  }
  else {
    uint64_t v4 = sub_24CC78038;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24CC78038()
{
  uint64_t v5 = v0;
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 72);
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  sub_24CC76350((uint64_t)v3);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC780C4()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 72);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC78134()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_269822110 + dword_269822110);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return v3();
}

void sub_24CC781D4()
{
  *(void *)(v0 + 168) = 0;
}

uint64_t PeerConnectionServiceCoordinator.deinit()
{
  uint64_t v1 = type metadata accessor for PeerConnectionServiceCoordinator.State();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + 112, v1);
  swift_unknownObjectRelease();
  sub_24CC7A854(*(void *)(v0 + 192));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t PeerConnectionServiceCoordinator.__deallocating_deinit()
{
  PeerConnectionServiceCoordinator.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t PeerConnectionServiceCoordinator.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24CC782B4()
{
  return PeerConnectionServiceCoordinator.unownedExecutor.getter();
}

uint64_t sub_24CC782D0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CCBBFA0();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  _OWORD v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  int v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  swift_retain();
  id v11 = a1;
  if (v10 == 1)
  {
    sub_24CC7B8E8((uint64_t)v6);
  }
  else
  {
    sub_24CCBBF90();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_24CCBBF40();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      if (v14 | v12)
      {
        v16[0] = 0;
        v16[1] = 0;
        v16[2] = v12;
        v16[3] = v14;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24CC78500()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_269822110 + dword_269822110);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return v3();
}

uint64_t sub_24CC785A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CCBB890();
  __swift_project_value_buffer(v5, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000074, 0x800000024CCBF120, 0xD00000000000001CLL, 0x800000024CCBF1A0);
  uint64_t v6 = sub_24CCBB870();
  os_log_type_t v7 = sub_24CCBC060();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_24CCBC5E0();
    uint64_t v15 = sub_24CC692DC(v10, v11, &v16);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v9, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);
  }

  uint64_t v12 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v1;
  swift_retain();
  sub_24CC88D24((uint64_t)v4, (uint64_t)&unk_269822278, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_24CC78860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24CC78880, a4, 0);
}

uint64_t sub_24CC78880()
{
  *(void *)(*(void *)(v0 + 16) + 168) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24CC7889C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24CCBB890();
  __swift_project_value_buffer(v7, (uint64_t)qword_269824810);
  uint64_t v8 = sub_24CCBB870();
  os_log_type_t v9 = sub_24CCBC060();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v19 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v12 = sub_24CCBC5E0();
    uint64_t v18 = sub_24CC692DC(v12, v13, &v19);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v8, v9, "%s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v11, -1, -1);
    MEMORY[0x2533103A0](v10, -1, -1);
  }

  uint64_t v14 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v2;
  v15[5] = a1;
  swift_retain();
  id v16 = a1;
  sub_24CCA5444((uint64_t)v6, (uint64_t)&unk_269822268, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_24CC78B2C()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_269822110 + dword_269822110);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC68584;
  return v3();
}

uint64_t sub_24CC78BD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CCBB890();
  __swift_project_value_buffer(v5, (uint64_t)qword_269824810);
  uint64_t v6 = sub_24CCBB870();
  os_log_type_t v7 = sub_24CCBC060();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_24CCBC5E0();
    uint64_t v15 = sub_24CC692DC(v10, v11, &v16);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v9, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);
  }

  uint64_t v12 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  unint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v1;
  swift_retain();
  sub_24CCA5444((uint64_t)v4, (uint64_t)&unk_269822258, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_24CC78E54(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  void *v6 = v4;
  v6[1] = sub_24CC6CB14;
  v6[14] = a4;
  v6[15] = *a4;
  return MEMORY[0x270FA2498](sub_24CC77D4C, a4, 0);
}

uint64_t sub_24CC78F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_24CCBC370();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_24CC7903C, 0, 0);
}

uint64_t sub_24CC7903C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_24CCBC390();
  uint64_t v5 = sub_24CC7B948(&qword_269822298, MEMORY[0x263F8F710]);
  sub_24CCBC4C0();
  sub_24CC7B948(qword_2698222A0, MEMORY[0x263F8F6D8]);
  sub_24CCBC3A0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  os_log_type_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *os_log_type_t v7 = v0;
  v7[1] = sub_24CC791DC;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_24CC791DC()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CC79398, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24CC79398()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC79404()
{
  v1[17] = v0;
  v1[18] = *v0;
  v1[19] = *v0;
  uint64_t v2 = sub_24CCBC390();
  v1[20] = v2;
  v1[21] = *(void *)(v2 - 8);
  v1[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC79514, v0, 0);
}

uint64_t sub_24CC79514()
{
  uint64_t v32 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = sub_24CCBB890();
  *(void *)(v0 + 184) = __swift_project_value_buffer(v2, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000074, 0x800000024CCBF120, 0xD000000000000019, 0x800000024CCBF1C0);
  if (*(uint64_t *)(v1 + 168) > 4)
  {
    os_log_type_t v17 = sub_24CCBB870();
    os_log_type_t v18 = sub_24CCBC060();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v31 = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v21 = sub_24CCBC5E0();
      *(void *)(v0 + 72) = sub_24CC692DC(v21, v22, &v31);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v17, v18, "%s max reconnect retry count; not reconnecting", v19, 0xCu);
      swift_arrayDestroy();
      uint64_t v23 = v20;
LABEL_16:
      MEMORY[0x2533103A0](v23, -1, -1);
      MEMORY[0x2533103A0](v19, -1, -1);
    }
  }
  else
  {
    sub_24CC762A0(v0 + 16);
    if (*(void *)(v0 + 24))
    {
      char v3 = *(unsigned char *)(v0 + 16);
      *(unsigned char *)(v0 + 240) = v3;
      swift_release();
      __swift_destroy_boxed_opaque_existential_0(v0 + 32);
      if ((v3 & 1) == 0)
      {
        uint64_t v4 = *(void *)(v1 + 168);
        uint64_t v5 = 1000000000000000000 * v4;
        uint64_t v6 = ((v4 >> 63) & 0xF21F494C589C0000)
           + (((unint64_t)v4 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
        os_log_type_t v7 = sub_24CCBB870();
        os_log_type_t v8 = sub_24CCBC060();
        if (os_log_type_enabled(v7, v8))
        {
          uint64_t v9 = swift_slowAlloc();
          uint64_t v10 = swift_slowAlloc();
          uint64_t v31 = v10;
          *(_DWORD *)uint64_t v9 = 136315394;
          uint64_t v11 = sub_24CCBC5E0();
          *(void *)(v0 + 120) = sub_24CC692DC(v11, v12, &v31);
          sub_24CCBC120();
          swift_bridgeObjectRelease();
          *(_WORD *)(v9 + 12) = 2080;
          uint64_t v13 = sub_24CCBC5B0();
          *(void *)(v0 + 128) = sub_24CC692DC(v13, v14, &v31);
          sub_24CCBC120();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24CC60000, v7, v8, "%s will attempt to reconnect; retry delay %s", (uint8_t *)v9, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2533103A0](v10, -1, -1);
          MEMORY[0x2533103A0](v9, -1, -1);
        }

        sub_24CCBC380();
        uint64_t v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_269822290
                                                                               + dword_269822290);
        uint64_t v15 = (void *)swift_task_alloc();
        *(void *)(v0 + 192) = v15;
        void *v15 = v0;
        v15[1] = sub_24CC79AA4;
        return v30(v5, v6, 0, 0, 1);
      }
    }
    else
    {
      uint64_t v24 = type metadata accessor for PeerConnectionServiceCoordinator.State();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v0 + 16, v24);
    }
    os_log_type_t v17 = sub_24CCBB870();
    os_log_type_t v25 = sub_24CCBC060();
    if (os_log_type_enabled(v17, v25))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v31 = v26;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v27 = sub_24CCBC5E0();
      *(void *)(v0 + 80) = sub_24CC692DC(v27, v28, &v31);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v17, v25, "%s not initiator; not reconnecting", v19, 0xCu);
      swift_arrayDestroy();
      uint64_t v23 = v26;
      goto LABEL_16;
    }
  }

  swift_task_dealloc();
  unint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
  return v29();
}

uint64_t sub_24CC79AA4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 176);
  uint64_t v4 = *(void *)(*v1 + 168);
  uint64_t v5 = *(void *)(*v1 + 160);
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 136);
  if (v0) {
    os_log_type_t v7 = sub_24CC79C2C;
  }
  else {
    os_log_type_t v7 = sub_24CC79E6C;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

uint64_t sub_24CC79C2C()
{
  uint64_t v16 = v0;
  uint64_t v1 = (void *)v0[25];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC060();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    os_log_type_t v7 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = v14;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v8 = sub_24CCBC5E0();
    v0[11] = sub_24CC692DC(v8, v9, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2112;
    id v10 = v1;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v11;
    sub_24CCBC120();
    *os_log_type_t v7 = v11;

    _os_log_impl(&dword_24CC60000, v4, v5, "%s failed to reconnect with error %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v14, -1, -1);
    MEMORY[0x2533103A0](v6, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  unint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_24CC79E6C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = v3;
  uint64_t v4 = (uint64_t (*)())v3[17];
  uint64_t v5 = *((void *)v4 + 21);
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *((void *)v4 + 21) = v7;
    swift_retain_n();
    uint64_t v8 = sub_24CCBB870();
    os_log_type_t v9 = sub_24CCBC060();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = v3[17];
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v18 = v12;
      *(_DWORD *)uint64_t v11 = 136315394;
      uint64_t v13 = sub_24CCBC5E0();
      v3[13] = sub_24CC692DC(v13, v14, &v18);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2048;
      uint64_t v15 = *(void *)(v10 + 168);
      swift_release();
      v3[14] = v15;
      sub_24CCBC120();
      swift_release();
      _os_log_impl(&dword_24CC60000, v8, v9, "%s attempting to reconnect; retry count %ld", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v12, -1, -1);
      MEMORY[0x2533103A0](v11, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    uint64_t v16 = (void *)swift_task_alloc();
    v3[26] = v16;
    void *v16 = v3;
    v16[1] = sub_24CC7A0C8;
    a2 = (void *)v3[17];
    v16[14] = a2;
    v16[15] = *a2;
    uint64_t v4 = sub_24CC77D4C;
    a3 = 0;
  }
  return MEMORY[0x270FA2498](v4, a2, a3);
}

uint64_t sub_24CC7A0C8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 216) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v3 = *(void **)(v2 + 136);
    uint64_t v4 = sub_24CC7A3BC;
  }
  else
  {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 240);
    uint64_t v6 = swift_task_alloc();
    *(void *)(v2 + 224) = v6;
    *(void *)uint64_t v6 = v2;
    *(void *)(v6 + 8) = sub_24CC7A280;
    id v3 = *(void **)(v2 + 136);
    *(void *)(v6 + 192) = v3;
    *(unsigned char *)(v6 + 344) = v5;
    *(void *)(v6 + 200) = *v3;
    *(void *)(v6 + 208) = *v3;
    uint64_t v4 = sub_24CC76590;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24CC7A280()
{
  uint64_t v2 = (void *)*v1;
  v2[29] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[17];
    return MEMORY[0x270FA2498](sub_24CC7A5FC, v3, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_24CC7A3BC()
{
  uint64_t v16 = v0;
  uint64_t v1 = (void *)v0[27];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC060();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = v14;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v8 = sub_24CCBC5E0();
    v0[11] = sub_24CC692DC(v8, v9, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2112;
    id v10 = v1;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v11;
    sub_24CCBC120();
    *uint64_t v7 = v11;

    _os_log_impl(&dword_24CC60000, v4, v5, "%s failed to reconnect with error %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v14, -1, -1);
    MEMORY[0x2533103A0](v6, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_24CC7A5FC()
{
  uint64_t v16 = v0;
  uint64_t v1 = (void *)v0[29];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC060();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = v14;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v8 = sub_24CCBC5E0();
    v0[11] = sub_24CC692DC(v8, v9, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2112;
    id v10 = v1;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v11;
    sub_24CCBC120();
    *uint64_t v7 = v11;

    _os_log_impl(&dword_24CC60000, v4, v5, "%s failed to reconnect with error %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v14, -1, -1);
    MEMORY[0x2533103A0](v6, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t type metadata accessor for PeerConnectionServiceCoordinator.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CC7A854(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t dispatch thunk of PeerConnectionService.activate()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return v7(a1, a2);
}

uint64_t dispatch thunk of PeerConnectionService.invalidate()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_24CC68584;
  return v7(a1, a2);
}

uint64_t dispatch thunk of PeerConnectionService.sendHeartbeat()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return v7(a1, a2);
}

uint64_t dispatch thunk of PeerConnectionService.peerIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PeerConnectionBrokering.activate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PeerConnectionBrokering.peerConnection()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_24CC6C264;
  return v7(a1, a2);
}

uint64_t dispatch thunk of PeerConnectionBrokering.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_24CC7AC74()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PeerConnectionServiceCoordinator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PeerConnectionServiceCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PeerConnectionServiceCoordinator);
}

uint64_t dispatch thunk of PeerConnectionServiceCoordinator.__allocating_init(nearbyDeviceProviding:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of PeerConnectionServiceCoordinator.reconnectIfNeeded(error:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 256) + **(int **)(*(void *)v1 + 256));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CC6CB14;
  return v6(a1);
}

uint64_t sub_24CC7AE34(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

unint64_t sub_24CC7AE68(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_release();
    return __swift_destroy_boxed_opaque_existential_0(a1 + 16);
  }
  return result;
}

uint64_t sub_24CC7AEBC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v4 = a2 + 16;
    long long v5 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 40) = v5;
    uint64_t v6 = v5;
    uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
    swift_retain();
    v7(a1 + 16, v4, v6);
  }
  return a1;
}

uint64_t sub_24CC7AF74(uint64_t a1, long long *a2)
{
  unint64_t v4 = *((void *)a2 + 1);
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      long long v5 = a2 + 1;
      uint64_t v6 = *((void *)a2 + 5);
      *(void *)(a1 + 40) = v6;
      *(void *)(a1 + 48) = *((void *)a2 + 6);
      uint64_t v7 = **(void (***)(uint64_t, long long *, uint64_t))(v6 - 8);
      swift_retain();
      v7(a1 + 16, v5, v6);
      return a1;
    }
LABEL_7:
    long long v8 = *a2;
    long long v9 = a2[1];
    long long v10 = a2[2];
    *(void *)(a1 + 48) = *((void *)a2 + 6);
    *(_OWORD *)(a1 + 16) = v9;
    *(_OWORD *)(a1 + 32) = v10;
    *(_OWORD *)a1 = v8;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_0(a1 + 16);
    goto LABEL_7;
  }
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)a2 + 2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *unint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
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

uint64_t sub_24CC7B2DC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_0(a1 + 16);
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_6;
  }
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
LABEL_6:
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t sub_24CC7B36C(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
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

uint64_t sub_24CC7B3BC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_24CC7B41C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

double sub_24CC7B434(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(void *)(a1 + 8) = (a2 - 1);
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

uint64_t sub_24CC7B4A8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24CC7B4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24CC7B520(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  long long v6 = (void *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24CC6CB14;
  return sub_24CC78E54(a1, v4, v5, v6);
}

uint64_t sub_24CC7B5D8()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_269822110 + dword_269822110);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC68584;
  return v4();
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CC7B708()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC68584;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24CC78880, v2, 0);
}

uint64_t objectdestroy_20Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CC7B7FC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_269822110 + dword_269822110);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  return v4();
}

uint64_t sub_24CC7B8E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CC7B948(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PeerProtocolHeader.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_24CC7BA30(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC7BAFCLL);
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

uint64_t sub_24CC7BB24(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CC7BB2C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t type metadata accessor for PeerConnectionServiceCoordinator.Role()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CC7BB50()
{
  return swift_getWitnessTable();
}

uint64_t dispatch thunk of GuestUserAccessResponseControllingObserver.guestUserAccessResponseController(_:didReceiveRequest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of GuestUserAccessResponseControllingObserver.guestUserAccessResponseControllerShouldCancelRequest(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of GuestUserAccessResponseControllingObserver.guestUserAccessResponseControllerShouldStartLiveActivity(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of GuestUserAccessResponseControllingObserver.guestUserAccessResponseControllerShouldStopLiveActivity(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of GuestUserAccessResponseControllingObserver.guestUserAccessResponseControllerShouldPerformRemoteUnlock(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of GuestUserAccessResponseControllingObserver.guestUserAccessResponseController(_:didEncounterRemoteUnlockError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of GuestUserAccessResponseControllingObserver.postNotification(payload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 56) + **(int **)(a3 + 56));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_24CC6CB14;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of GuestUserAccessResponseControllingObserver.peerConnectionDidFail(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.activate()(uint64_t a1, uint64_t a2)
{
  BOOL v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.invalidate()(uint64_t a1, uint64_t a2)
{
  BOOL v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.sendGuestUserAccessResponse(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_24CC6CB14;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.startViewMirroring(device:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 32) + **(int **)(a3 + 32));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_24CC6CB14;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.endGuestUserAccess()(uint64_t a1, uint64_t a2)
{
  BOOL v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 40) + **(int **)(a2 + 40));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.unlockPeerDevice()(uint64_t a1, uint64_t a2)
{
  BOOL v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 48) + **(int **)(a2 + 48));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.sendRemoteUnlockError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 56) + **(int **)(a3 + 56));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_24CC6CB14;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.replayRequest(requestConfiguration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.dismissRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.addObserver(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 80) + **(int **)(a4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24CC6CB14;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.removeObserver(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 88) + **(int **)(a4 + 88));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24CC6CB14;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of GuestUserAccessResponseControlling.postNotification(payload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 96) + **(int **)(a3 + 96));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_24CC6CB14;
  return v9(a1, a2, a3);
}

uint64_t sub_24CC7C70C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  sub_24CC860B4(v2 + 112, (uint64_t)v17);
  if (v17[1])
  {
    swift_release();
    return sub_24CC76204(&v18, a1);
  }
  else
  {
    sub_24CC744B8((uint64_t)v17, &qword_269822448);
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24CCBB890();
    __swift_project_value_buffer(v5, (uint64_t)qword_269824810);
    swift_retain_n();
    unsigned int v6 = sub_24CCBB870();
    os_log_type_t v7 = sub_24CCBC040();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v16 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      uint64_t v10 = sub_24CCBC5E0();
      v17[0] = sub_24CC692DC(v10, v11, &v16);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2080;
      sub_24CC860B4(v2 + 112, (uint64_t)v17);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269822448);
      uint64_t v12 = sub_24CCBBE70();
      v17[0] = sub_24CC692DC(v12, v13, &v16);
      sub_24CCBC120();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v6, v7, "[%s] Peer Connection state is %s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v9, -1, -1);
      MEMORY[0x2533103A0](v8, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    uint64_t v14 = sub_24CCBB810();
    sub_24CC88A90((unint64_t *)&qword_269822CD0, MEMORY[0x263F3A030]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v15, *MEMORY[0x263F3A018], v14);
    return swift_willThrow();
  }
}

uint64_t sub_24CC7CA34()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CCBB890();
  __swift_project_value_buffer(v5, (uint64_t)qword_2698247F8);
  unsigned int v6 = sub_24CCBB870();
  os_log_type_t v7 = sub_24CCBC060();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v15 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v14 = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v15);
    sub_24CCBC120();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v14 = sub_24CC692DC(0xD000000000000010, 0x800000024CCBF500, &v15);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v6, v7, "[%s] %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v9, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);
  }

  uint64_t v10 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  uint64_t v12[3] = 0;
  v12[4] = v11;
  *(void *)(v1 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_heartBeatTask) = sub_24CCA5444((uint64_t)v4, (uint64_t)&unk_269822498, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_24CC7CCF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 48) = a4;
  return MEMORY[0x270FA2498](sub_24CC7CD18, 0, 0);
}

uint64_t sub_24CC7CD18()
{
  uint64_t v9 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v1 = sub_24CCBB890();
  *(void *)(v0 + 56) = __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v4 + 4) = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v8);
    _os_log_impl(&dword_24CC60000, v2, v3, "[%s] Waiting to send heartbeat...", (uint8_t *)v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v6;
  void *v6 = v0;
  v6[1] = sub_24CC7CF00;
  return MEMORY[0x270FA1FF0](5000000000);
}

uint64_t sub_24CC7CF00()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CC7D50C;
  }
  else {
    uint64_t v2 = sub_24CC7D014;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC7D014()
{
  uint64_t v26 = v0;
  uint64_t v1 = (void *)v0[9];
  sub_24CCBBFD0();
  if (v1)
  {
    id v2 = v1;
    id v3 = v1;
    uint64_t v4 = sub_24CCBB870();
    os_log_type_t v5 = sub_24CCBC040();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      os_log_type_t v7 = (void *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      v25[0] = v8;
      *(_DWORD *)uint64_t v6 = 136315394;
      *(void *)(v6 + 4) = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, v25);
      *(_WORD *)(v6 + 12) = 2112;
      id v9 = v1;
      uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v6 + 14) = v10;
      *os_log_type_t v7 = v10;

      _os_log_impl(&dword_24CC60000, v4, v5, "[%s] Error sending heartbeat: %@", (uint8_t *)v6, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v7, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v8, -1, -1);
      MEMORY[0x2533103A0](v6, -1, -1);
    }
    else
    {
    }
LABEL_9:
    if (sub_24CCBBFC0())
    {
      uint64_t v14 = sub_24CCBB870();
      os_log_type_t v15 = sub_24CCBC060();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        v25[0] = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        v0[5] = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, v25);
        sub_24CCBC120();
        _os_log_impl(&dword_24CC60000, v14, v15, "[%s] Heartbeat cancelled", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v17, -1, -1);
        MEMORY[0x2533103A0](v16, -1, -1);
      }

      long long v18 = (uint64_t (*)(void))v0[1];
      return v18();
    }
    else
    {
      uint64_t v19 = sub_24CCBB890();
      v0[7] = __swift_project_value_buffer(v19, (uint64_t)qword_2698247F8);
      uint64_t v20 = sub_24CCBB870();
      os_log_type_t v21 = sub_24CCBC060();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        v25[0] = v23;
        *(_DWORD *)uint64_t v22 = 136315138;
        *(void *)(v22 + 4) = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, v25);
        _os_log_impl(&dword_24CC60000, v20, v21, "[%s] Waiting to send heartbeat...", (uint8_t *)v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v23, -1, -1);
        MEMORY[0x2533103A0](v22, -1, -1);
      }

      uint64_t v24 = (void *)swift_task_alloc();
      v0[8] = v24;
      void *v24 = v0;
      v24[1] = sub_24CC7CF00;
      return MEMORY[0x270FA1FF0](5000000000);
    }
  }
  uint64_t Strong = swift_weakLoadStrong();
  v0[10] = Strong;
  if (!Strong) {
    goto LABEL_9;
  }
  uint64_t v12 = (void *)swift_task_alloc();
  v0[11] = v12;
  void *v12 = v0;
  v12[1] = sub_24CC7D978;
  return sub_24CC8022C();
}

uint64_t sub_24CC7D50C()
{
  uint64_t v24 = v0;
  uint64_t v1 = (void *)v0[9];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC040();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    os_log_type_t v7 = (void *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v23 = v8;
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v23);
    *(_WORD *)(v6 + 12) = 2112;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v6 + 14) = v10;
    *os_log_type_t v7 = v10;

    _os_log_impl(&dword_24CC60000, v4, v5, "[%s] Error sending heartbeat: %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v8, -1, -1);
    MEMORY[0x2533103A0](v6, -1, -1);

    if ((sub_24CCBBFC0() & 1) == 0)
    {
LABEL_3:
      uint64_t v11 = sub_24CCBB890();
      v0[7] = __swift_project_value_buffer(v11, (uint64_t)qword_2698247F8);
      uint64_t v12 = sub_24CCBB870();
      os_log_type_t v13 = sub_24CCBC060();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v15 = swift_slowAlloc();
        uint64_t v23 = v15;
        *(_DWORD *)uint64_t v14 = 136315138;
        *(void *)(v14 + 4) = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v23);
        _os_log_impl(&dword_24CC60000, v12, v13, "[%s] Waiting to send heartbeat...", (uint8_t *)v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v15, -1, -1);
        MEMORY[0x2533103A0](v14, -1, -1);
      }

      uint64_t v16 = (void *)swift_task_alloc();
      v0[8] = v16;
      void *v16 = v0;
      v16[1] = sub_24CC7CF00;
      return MEMORY[0x270FA1FF0](5000000000);
    }
  }
  else
  {

    if ((sub_24CCBBFC0() & 1) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = sub_24CCBB870();
  os_log_type_t v18 = sub_24CCBC060();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v23 = v20;
    *(_DWORD *)uint64_t v19 = 136315138;
    v0[5] = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v23);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v17, v18, "[%s] Heartbeat cancelled", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v20, -1, -1);
    MEMORY[0x2533103A0](v19, -1, -1);
  }

  os_log_type_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_24CC7D978()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_24CC7DD7C;
  }
  else
  {
    swift_release();
    id v2 = sub_24CC7DA94;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC7DA94()
{
  uint64_t v14 = v0;
  if (sub_24CCBBFC0())
  {
    uint64_t v1 = sub_24CCBB870();
    os_log_type_t v2 = sub_24CCBC060();
    if (os_log_type_enabled(v1, v2))
    {
      id v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v4 = swift_slowAlloc();
      uint64_t v13 = v4;
      *(_DWORD *)id v3 = 136315138;
      v0[5] = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v13);
      sub_24CCBC120();
      _os_log_impl(&dword_24CC60000, v1, v2, "[%s] Heartbeat cancelled", v3, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v4, -1, -1);
      MEMORY[0x2533103A0](v3, -1, -1);
    }

    os_log_type_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    uint64_t v7 = sub_24CCBB890();
    v0[7] = __swift_project_value_buffer(v7, (uint64_t)&unk_2698247F8);
    uint64_t v8 = sub_24CCBB870();
    os_log_type_t v9 = sub_24CCBC060();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v13 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v13);
      _os_log_impl(&dword_24CC60000, v8, v9, "[%s] Waiting to send heartbeat...", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v11, -1, -1);
      MEMORY[0x2533103A0](v10, -1, -1);
    }

    uint64_t v12 = (void *)swift_task_alloc();
    v0[8] = v12;
    void *v12 = v0;
    v12[1] = sub_24CC7CF00;
    return MEMORY[0x270FA1FF0](5000000000);
  }
}

uint64_t sub_24CC7DD7C()
{
  uint64_t v24 = v0;
  swift_release();
  uint64_t v1 = (void *)v0[12];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC040();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v23 = v8;
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v23);
    *(_WORD *)(v6 + 12) = 2112;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v6 + 14) = v10;
    *uint64_t v7 = v10;

    _os_log_impl(&dword_24CC60000, v4, v5, "[%s] Error sending heartbeat: %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v8, -1, -1);
    MEMORY[0x2533103A0](v6, -1, -1);

    if ((sub_24CCBBFC0() & 1) == 0)
    {
LABEL_3:
      uint64_t v11 = sub_24CCBB890();
      v0[7] = __swift_project_value_buffer(v11, (uint64_t)&unk_2698247F8);
      uint64_t v12 = sub_24CCBB870();
      os_log_type_t v13 = sub_24CCBC060();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v15 = swift_slowAlloc();
        uint64_t v23 = v15;
        *(_DWORD *)uint64_t v14 = 136315138;
        *(void *)(v14 + 4) = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v23);
        _os_log_impl(&dword_24CC60000, v12, v13, "[%s] Waiting to send heartbeat...", (uint8_t *)v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v15, -1, -1);
        MEMORY[0x2533103A0](v14, -1, -1);
      }

      uint64_t v16 = (void *)swift_task_alloc();
      v0[8] = v16;
      void *v16 = v0;
      v16[1] = sub_24CC7CF00;
      return MEMORY[0x270FA1FF0](5000000000);
    }
  }
  else
  {

    if ((sub_24CCBBFC0() & 1) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = sub_24CCBB870();
  os_log_type_t v18 = sub_24CCBC060();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v23 = v20;
    *(_DWORD *)uint64_t v19 = 136315138;
    v0[5] = sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v23);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v17, v18, "[%s] Heartbeat cancelled", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v20, -1, -1);
    MEMORY[0x2533103A0](v19, -1, -1);
  }

  os_log_type_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_24CC7E1F0()
{
  uint64_t v1 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_2698247F8);
  id v3 = sub_24CCBB870();
  os_log_type_t v4 = sub_24CCBC060();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_24CC692DC(0xD000000000000021, 0x800000024CCBD8D0, &v9);
    sub_24CCBC120();
    *(_WORD *)(v5 + 12) = 2080;
    sub_24CC692DC(0x72616548706F7473, 0xEF29287461654274, &v9);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v3, v4, "[%s] %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v6, -1, -1);
    MEMORY[0x2533103A0](v5, -1, -1);
  }

  uint64_t v7 = OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_heartBeatTask;
  if (*(void *)(v1 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_heartBeatTask))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269821D68);
    sub_24CCBBFB0();
    swift_release();
  }
  *(void *)(v1 + v7) = 0;
  return swift_release();
}

uint64_t sub_24CC7E418()
{
  uint64_t v1 = sub_24CCBB6D0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  os_log_type_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_heartBeatTask) = 0;
  sub_24CCBB600();
  *(void *)(v0 + 16) = sub_24CCA1B58();
  sub_24CCA1B90((uint64_t)v7);
  sub_24CC76204(v7, v0 + 24);
  sub_24CCA1E6C((uint64_t)v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v0 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_airPlayReceiverCoordinator, v4, v1);
  *(void *)(v0 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_liveActivityCoordinator) = sub_24CCA2248();
  *(void *)(v0 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_guestUserHandOverSetupCoordinator) = sub_24CCA228C();
  *(void *)(v0 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_notificationController) = sub_24CCA22D0();
  sub_24CC88A90((unint64_t *)&unk_269822510, (void (*)(uint64_t))type metadata accessor for GuestUserAccessResponseController);
  swift_retain();
  swift_retain();
  sub_24CCBB730();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

void *sub_24CC7E5D8(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24CCBB890();
  __swift_project_value_buffer(v4, (uint64_t)qword_2698247F8);
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC060();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_24CCBC5E0();
    sub_24CC692DC(v9, v10, &v14);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    sub_24CC692DC(0xD00000000000002ALL, 0x800000024CCBF6D0, &v14);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v5, v6, "[%s] %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v8, -1, -1);
    MEMORY[0x2533103A0](v7, -1, -1);
  }

  type metadata accessor for GuestUserAccessResponsePeerConnectionService();
  uint64_t v11 = (void *)swift_allocObject();
  swift_retain();
  sub_24CCBB600();
  v11[2] = a1;
  swift_retain();
  uint64_t v12 = swift_retain();
  sub_24CC862C8(v12, a1);
  swift_release();
  swift_release();
  sub_24CC8661C(v2, v11);
  return v11;
}

uint64_t sub_24CC7E84C()
{
  *(void *)(v1 + 80) = v0;
  *(void *)(v1 + 88) = *v0;
  return MEMORY[0x270FA2498](sub_24CC7E894, 0, 0);
}

uint64_t sub_24CC7E894()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 80) + 16);
  *(void *)(v0 + 96) = v1;
  return MEMORY[0x270FA2498](sub_24CC7E8B8, v1, 0);
}

uint64_t sub_24CC7E8B8()
{
  sub_24CC7C70C(v0 + 16);
  *(void *)(v0 + 104) = 0;
  return MEMORY[0x270FA2498](sub_24CC7E948, 0, 0);
}

uint64_t sub_24CC7E948()
{
  uint64_t v14 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822438);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822440);
  if (swift_dynamicCast())
  {
    uint64_t v1 = v0[7];
    uint64_t v2 = v0[8];
    uint64_t v3 = v0[9];
    if (qword_269821AA0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24CCBB890();
    __swift_project_value_buffer(v4, (uint64_t)qword_2698247F8);
    uint64_t v5 = sub_24CCBB870();
    os_log_type_t v6 = sub_24CCBC060();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315394;
      uint64_t v13 = v8;
      uint64_t v9 = sub_24CCBC5E0();
      v0[2] = sub_24CC692DC(v9, v10, &v13);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2080;
      v0[2] = sub_24CC692DC(0xD000000000000017, 0x800000024CCBF460, &v13);
      sub_24CCBC120();
      _os_log_impl(&dword_24CC60000, v5, v6, "[%s] %s", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v8, -1, -1);
      MEMORY[0x2533103A0](v7, -1, -1);
    }

    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
    return v11(v1, v2, v3);
  }
  else
  {
    sub_24CCBC2C0();
    swift_bridgeObjectRelease();
    sub_24CCBC5E0();
    sub_24CCBBEC0();
    swift_bridgeObjectRelease();
    return sub_24CCBC3D0();
  }
}

uint64_t sub_24CC7EC5C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24CC7EC74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24CCBB890();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_2698247F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_unknownObjectRetain_n();
  uint64_t v11 = sub_24CCBB870();
  os_log_type_t v12 = sub_24CCBC060();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = a2;
    uint64_t v14 = v13;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v14 = 136315650;
    uint64_t v23 = v3;
    uint64_t v15 = sub_24CCBC5E0();
    uint64_t v24 = sub_24CC692DC(v15, v16, &v26);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v24 = sub_24CC692DC(0x726573624F646461, 0xEF293A5F28726576, &v26);
    sub_24CCBC120();
    *(_WORD *)(v14 + 22) = 2080;
    uint64_t v24 = a1;
    uint64_t v25 = v21;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822418);
    uint64_t v17 = sub_24CCBBE70();
    uint64_t v24 = sub_24CC692DC(v17, v18, &v26);
    sub_24CCBC120();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v11, v12, "[%s] %s — %s", (uint8_t *)v14, 0x20u);
    uint64_t v19 = v22;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v19, -1, -1);
    MEMORY[0x2533103A0](v14, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return sub_24CCBB5B0();
}

uint64_t sub_24CC7EFCC()
{
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247F8);
  swift_unknownObjectRetain_n();
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v10 = v4;
    *(_DWORD *)uint64_t v3 = 136315650;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v10);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24CC692DC(0xD000000000000012, 0x800000024CCBF360, &v10);
    sub_24CCBC120();
    *(_WORD *)(v3 + 22) = 2080;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822418);
    uint64_t v7 = sub_24CCBBE70();
    sub_24CC692DC(v7, v8, &v10);
    sub_24CCBC120();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] %s — %s", (uint8_t *)v3, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  return sub_24CCBB5C0();
}

uint64_t sub_24CC7F260()
{
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247F8);
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v9 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v9);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24CC692DC(0xD000000000000013, 0x800000024CCBEEE0, &v9);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }

  MEMORY[0x270FA5388](v7);
  return sub_24CCBB5D0();
}

uint64_t sub_24CC7F4A0(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  swift_unknownObjectRetain();
  swift_getObjectType();
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6) {
    a2(v6, v5);
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_24CC7F51C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24CCBB890();
  __swift_project_value_buffer(v6, (uint64_t)qword_2698247F8);
  uint64_t v7 = sub_24CCBB870();
  os_log_type_t v8 = sub_24CCBC040();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v11 = sub_24CCBC5E0();
    uint64_t v16 = sub_24CC692DC(v11, v12, &v17);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v16 = sub_24CC692DC(0xD000000000000013, 0x800000024CCBF630, &v17);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v7, v8, "[%s] %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v10, -1, -1);
    MEMORY[0x2533103A0](v9, -1, -1);
  }

  uint64_t v13 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v1;
  v14[5] = v2;
  swift_retain();
  sub_24CC88D24((uint64_t)v5, (uint64_t)&unk_2698224F0, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_24CC7F7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 32) = a5;
  return MEMORY[0x270FA2498](sub_24CC7F800, 0, 0);
}

uint64_t sub_24CC7F800()
{
  *(void *)(v0 + 40) = *(void *)(*(void *)(v0 + 24)
                                   + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_liveActivityCoordinator);
  sub_24CCBB690();
  sub_24CC88A90(&qword_2698224C0, MEMORY[0x263F39F00]);
  uint64_t v2 = sub_24CCBBF40();
  return MEMORY[0x270FA2498](sub_24CC7F8C8, v2, v1);
}

uint64_t sub_24CC7F8C8()
{
  sub_24CCBB670();
  *(void *)(v0 + 48) = 0;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC7F978()
{
  uint64_t v19 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_2698247F8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC040();
  BOOL v7 = os_log_type_enabled(v5, v6);
  os_log_type_t v8 = (void *)v0[6];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = v17;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v11 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v11, v12, &v18);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v13 = v8;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v14;
    sub_24CCBC120();
    void *v10 = v14;

    _os_log_impl(&dword_24CC60000, v5, v6, "[%s] Unable to start Live Activity - %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v17, -1, -1);
    MEMORY[0x2533103A0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24CC7FBFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CCBBFA0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  BOOL v7 = (void *)swift_allocObject();
  long long v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_24CC744B8((uint64_t)v4, &qword_269822008);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_24CCBBF90();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_24CCBBF40();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_2698224B0;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24CC7FE40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24CC7FE60, 0, 0);
}

uint64_t sub_24CC7FE60()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_24CC7E1F0();
  *(void *)(v0 + 24) = *(void *)(v1
                                   + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_liveActivityCoordinator);
  sub_24CCBB690();
  sub_24CC88A90(&qword_2698224C0, MEMORY[0x263F39F00]);
  uint64_t v3 = sub_24CCBBF40();
  return MEMORY[0x270FA2498](sub_24CC7FF2C, v3, v2);
}

uint64_t sub_24CC7FF2C()
{
  sub_24CCBB660();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC7FF8C()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  uint64_t v1 = v0 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_airPlayReceiverCoordinator;
  uint64_t v2 = sub_24CCBB6D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();

  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_observers;
  uint64_t v4 = sub_24CCBB610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_24CC80084()
{
  sub_24CC7FF8C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24CC800DC()
{
  return type metadata accessor for GuestUserAccessResponseController();
}

uint64_t type metadata accessor for GuestUserAccessResponseController()
{
  uint64_t result = qword_2698223A8;
  if (!qword_2698223A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC80130()
{
  uint64_t result = sub_24CCBB6D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24CCBB610();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_24CC8022C()
{
  v1[5] = v0;
  v1[6] = *v0;
  uint64_t v2 = sub_24CCBB890();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC80314, 0, 0);
}

uint64_t sub_24CC80314()
{
  uint64_t v20 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2698247F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC060();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[8];
  uint64_t v8 = v0[9];
  uint64_t v10 = v0[7];
  if (v7)
  {
    uint64_t v18 = v0[7];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v13 = sub_24CCBC5E0();
    v0[3] = sub_24CC692DC(v13, v14, &v19);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v0[4] = sub_24CC692DC(0x72616548646E6573, 0xEF29287461656274, &v19);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v5, v6, "[%s] %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v12, -1, -1);
    MEMORY[0x2533103A0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v18);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v15 = (void *)swift_task_alloc();
  v0[10] = v15;
  void *v15 = v0;
  v15[1] = sub_24CC805E8;
  uint64_t v16 = (void *)v0[5];
  v15[10] = v16;
  v15[11] = *v16;
  return MEMORY[0x270FA2498](sub_24CC7E894, 0, 0);
}

uint64_t sub_24CC805E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (void *)*v4;
  v7[11] = a1;
  swift_task_dealloc();
  if (v3)
  {
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v7[1];
    return v8();
  }
  else
  {
    uint64_t ObjectType = swift_getObjectType();
    long long v7[2] = a1;
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
    uint64_t v11 = (void *)swift_task_alloc();
    v7[12] = v11;
    void *v11 = v7;
    v11[1] = sub_24CC807DC;
    return v12(ObjectType, a3);
  }
}

uint64_t sub_24CC807DC()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CC80960;
  }
  else {
    uint64_t v2 = sub_24CC808F0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC808F0()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC80960()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC809CC()
{
  v1[4] = v0;
  v1[5] = *v0;
  uint64_t v2 = sub_24CCBB890();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC80AB4, 0, 0);
}

uint64_t sub_24CC80AB4()
{
  uint64_t v19 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2698247F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC060();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v10 = v0[6];
  if (v7)
  {
    uint64_t v17 = v0[6];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v13 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v13, v14, &v18);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v0[3] = sub_24CC692DC(0x6574617669746361, 0xEA00000000002928, &v18);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v5, v6, "[%s] %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v12, -1, -1);
    MEMORY[0x2533103A0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v17);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  sub_24CC7CA34();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24CC80D1C()
{
  v1[4] = v0;
  v1[5] = *v0;
  uint64_t v2 = sub_24CCBB890();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC80E04, 0, 0);
}

uint64_t sub_24CC80E04()
{
  uint64_t v19 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2698247F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC060();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v10 = v0[6];
  if (v7)
  {
    uint64_t v17 = v0[6];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v13 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v13, v14, &v18);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v0[3] = sub_24CC692DC(0x6164696C61766E69, 0xEC00000029286574, &v18);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v5, v6, "[%s] %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v12, -1, -1);
    MEMORY[0x2533103A0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v17);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  sub_24CC7E1F0();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24CC81070(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_24CCBB620();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC81140, 0, 0);
}

uint64_t sub_24CC81140()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  sub_24CCBB630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v2, v3);
  if (v5 == *MEMORY[0x263F39EC8])
  {
    os_log_type_t v6 = (uint64_t *)v0[6];
    (*(void (**)(uint64_t *, void))(v0[5] + 96))(v6, v0[4]);
    uint64_t v7 = *v6;
    uint64_t v8 = (void *)swift_task_alloc();
    v0[8] = v8;
    void *v8 = v0;
    v8[1] = sub_24CC8136C;
    return NotificationController.postGuestUserModeUnavailableNotification(with:)(v7);
  }
  else if (v5 == *MEMORY[0x263F39ED0])
  {
    uint64_t v10 = (void *)swift_task_alloc();
    v0[9] = v10;
    void *v10 = v0;
    v10[1] = sub_24CC814F0;
    return NotificationController.postUnableToPlayProtectedContent()();
  }
  else
  {
    return sub_24CCBC3D0();
  }
}

uint64_t sub_24CC8136C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CC81468, 0, 0);
}

uint64_t sub_24CC81468()
{
  (*(void (**)(void, void))(v0[5] + 8))(v0[7], v0[4]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CC814F0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CC88AE0, 0, 0);
}

uint64_t sub_24CC815EC(uint64_t a1)
{
  v2[10] = a1;
  v2[11] = v1;
  v2[12] = *v1;
  uint64_t v3 = sub_24CCBB760();
  v2[13] = v3;
  v2[14] = *(void *)(v3 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  sub_24CCBB710();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC81720, 0, 0);
}

uint64_t sub_24CC81720()
{
  uint64_t v45 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = sub_24CCBB890();
  __swift_project_value_buffer(v3, (uint64_t)qword_2698247F8);
  sub_24CC8611C(v1, v2);
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC060();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void *)(v0 + 144);
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v44 = v43;
    *(_DWORD *)uint64_t v8 = 136315650;
    uint64_t v9 = sub_24CCBC5E0();
    *(void *)(v0 + 56) = sub_24CC692DC(v9, v10, &v44);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    *(void *)(v0 + 64) = sub_24CC692DC(0xD00000000000001FLL, 0x800000024CCBF4E0, &v44);
    sub_24CCBC120();
    *(_WORD *)(v8 + 22) = 2080;
    uint64_t v11 = sub_24CCBB700();
    *(void *)(v0 + 72) = sub_24CC692DC(v11, v12, &v44);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    sub_24CC86180(v7);
    _os_log_impl(&dword_24CC60000, v4, v5, "[%s] %s — %s", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v43, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);
  }
  else
  {
    sub_24CC86180(*(void *)(v0 + 144));
  }

  uint64_t v13 = *(void *)(v0 + 120);
  uint64_t v14 = *(void *)(v0 + 104);
  uint64_t v15 = *(void *)(v0 + 112);
  *(void *)(v0 + 152) = OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_guestUserHandOverSetupCoordinator;
  swift_retain();
  sub_24CCBB740();
  swift_release();
  *(_DWORD *)(v0 + 232) = *MEMORY[0x263F39FB8];
  uint64_t v16 = *(void (**)(uint64_t))(v15 + 104);
  *(void *)(v0 + 160) = v16;
  *(void *)(v0 + 168) = (v15 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v16(v13);
  sub_24CC88A90(&qword_269822478, MEMORY[0x263F39FC0]);
  char v17 = sub_24CCBBDF0();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  *(void *)(v0 + 176) = v18;
  *(void *)(v0 + 184) = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v18(v13, v14);
  if (v17)
  {
    uint64_t v19 = sub_24CCBB870();
    os_log_type_t v20 = sub_24CCBC060();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v44 = v22;
      *(_DWORD *)uint64_t v21 = 136315394;
      uint64_t v23 = sub_24CCBC5E0();
      *(void *)(v0 + 40) = sub_24CC692DC(v23, v24, &v44);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      *(void *)(v0 + 48) = sub_24CC692DC(0xD00000000000001FLL, 0x800000024CCBF4E0, &v44);
      sub_24CCBC120();
      _os_log_impl(&dword_24CC60000, v19, v20, "[%s] %s Prox card request was already fulfilled", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v22, -1, -1);
      MEMORY[0x2533103A0](v21, -1, -1);
    }

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    uint64_t v26 = *(void *)(v0 + 128);
    uint64_t v27 = *(void *)(v0 + 120);
    uint64_t v28 = *(void *)(v0 + 104);
    (*(void (**)(uint64_t, void, uint64_t))(v0 + 160))(v27, *(unsigned int *)(v0 + 232), v28);
    swift_retain();
    sub_24CCBB750();
    swift_release();
    v25(v27, v28);
    v25(v26, v28);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29();
  }
  else
  {
    sub_24CC8611C(*(void *)(v0 + 80), *(void *)(v0 + 136));
    uint64_t v31 = sub_24CCBB870();
    os_log_type_t v32 = sub_24CCBC060();
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v34 = *(void *)(v0 + 136);
    if (v33)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v44 = v36;
      *(_DWORD *)uint64_t v35 = 136315650;
      uint64_t v37 = sub_24CCBC5E0();
      *(void *)(v0 + 16) = sub_24CC692DC(v37, v38, &v44);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      *(void *)(v0 + 24) = sub_24CC692DC(0xD00000000000001FLL, 0x800000024CCBF4E0, &v44);
      sub_24CCBC120();
      *(_WORD *)(v35 + 22) = 2080;
      uint64_t v39 = sub_24CCBB700();
      *(void *)(v0 + 32) = sub_24CC692DC(v39, v40, &v44);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      sub_24CC86180(v34);
      _os_log_impl(&dword_24CC60000, v31, v32, "[%s] %s Sending guest user access response: %s", (uint8_t *)v35, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v36, -1, -1);
      MEMORY[0x2533103A0](v35, -1, -1);
    }
    else
    {
      sub_24CC86180(*(void *)(v0 + 136));
    }

    uint64_t v41 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v41;
    *uint64_t v41 = v0;
    v41[1] = sub_24CC81EAC;
    os_log_type_t v42 = *(void **)(v0 + 88);
    v41[10] = v42;
    v41[11] = *v42;
    return MEMORY[0x270FA2498](sub_24CC7E894, 0, 0);
  }
}

uint64_t sub_24CC81EAC(uint64_t a1, uint64_t a2)
{
  os_log_type_t v5 = (void *)*v3;
  BOOL v6 = (void *)*v3;
  v5[25] = a1;
  v5[26] = v2;
  swift_task_dealloc();
  if (v2)
  {
    return MEMORY[0x270FA2498](sub_24CC822CC, 0, 0);
  }
  else
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
    uint64_t v8 = (void *)swift_task_alloc();
    v5[27] = v8;
    void *v8 = v6;
    v8[1] = sub_24CC820B4;
    uint64_t v9 = v5[10];
    return v11(v9, ObjectType, a2);
  }
}

uint64_t sub_24CC820B4()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_unknownObjectRelease();
    uint64_t v2 = sub_24CC82370;
  }
  else
  {
    uint64_t v2 = sub_24CC821D0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC821D0()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 104);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 160))(v3, *(unsigned int *)(v0 + 232), v4);
  swift_retain();
  sub_24CCBB750();
  swift_release();
  v1(v3, v4);
  v1(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24CC822CC()
{
  (*(void (**)(void, void))(v0 + 176))(*(void *)(v0 + 128), *(void *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC82370()
{
  (*(void (**)(void, void))(v0 + 176))(*(void *)(v0 + 128), *(void *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC82414(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  v2[7] = *v1;
  uint64_t v3 = sub_24CCBB560();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC824FC, 0, 0);
}

uint64_t sub_24CC824FC()
{
  uint64_t v23 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v4 = v0[8];
  uint64_t v5 = sub_24CCBB890();
  __swift_project_value_buffer(v5, (uint64_t)qword_2698247F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  BOOL v6 = sub_24CCBB870();
  os_log_type_t v7 = sub_24CCBC060();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[9];
  uint64_t v9 = v0[10];
  uint64_t v11 = v0[8];
  if (v8)
  {
    os_log_type_t type = v7;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v12 = 136315650;
    uint64_t v13 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v13, v14, &v22);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v0[3] = sub_24CC692DC(0xD00000000000001BLL, 0x800000024CCBF4C0, &v22);
    sub_24CCBC120();
    *(_WORD *)(v12 + 22) = 2080;
    sub_24CC88A90(&qword_269822468, MEMORY[0x263F39EA0]);
    uint64_t v15 = sub_24CCBC460();
    v0[4] = sub_24CC692DC(v15, v16, &v22);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _os_log_impl(&dword_24CC60000, v6, type, "[%s] %s — %s", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v21, -1, -1);
    MEMORY[0x2533103A0](v12, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 8))(v0[10], v0[8]);
  }

  char v17 = (void *)swift_task_alloc();
  v0[11] = v17;
  void *v17 = v0;
  v17[1] = sub_24CC82864;
  uint64_t v18 = (void *)v0[6];
  v17[10] = v18;
  v17[11] = *v18;
  return MEMORY[0x270FA2498](sub_24CC7E894, 0, 0);
}

uint64_t sub_24CC82864(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v3;
  uint64_t v6 = *v3;
  *(void *)(*v3 + 96) = a1;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    os_log_type_t v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
  else
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v5 + 104) = v10;
    void *v10 = v6;
    v10[1] = sub_24CC82A6C;
    uint64_t v11 = *(void *)(v5 + 40);
    return v12(v11, ObjectType, a2);
  }
}

uint64_t sub_24CC82A6C()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CC82BF0;
  }
  else {
    uint64_t v2 = sub_24CC82B80;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC82B80()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC82BF0()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC82C5C()
{
  *(void *)(v1 + 32) = v0;
  *(void *)(v1 + 40) = *v0;
  return MEMORY[0x270FA2498](sub_24CC82CA4, 0, 0);
}

uint64_t sub_24CC82CA4()
{
  uint64_t v12 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v6, v7, &v11);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    v0[3] = sub_24CC692DC(0xD000000000000014, 0x800000024CCBF4A0, &v11);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v2, v3, "[%s] %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  BOOL v8 = (void *)swift_task_alloc();
  v0[6] = v8;
  void *v8 = v0;
  v8[1] = sub_24CC82F1C;
  uint64_t v9 = (void *)v0[4];
  v8[10] = v9;
  v8[11] = *v9;
  return MEMORY[0x270FA2498](sub_24CC7E894, 0, 0);
}

uint64_t sub_24CC82F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v3;
  uint64_t v6 = *v3;
  *(void *)(*v3 + 56) = a1;
  swift_task_dealloc();
  if (v2)
  {
    unint64_t v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
  else
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 40) + **(int **)(a2 + 40));
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v5 + 64) = v10;
    void *v10 = v6;
    v10[1] = sub_24CC83114;
    return v11(ObjectType, a2);
  }
}

uint64_t sub_24CC83114()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CC8328C;
  }
  else {
    uint64_t v2 = sub_24CC83228;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC83228()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC8328C()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC832F0()
{
  v1[5] = v0;
  v1[6] = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  v1[7] = swift_task_alloc();
  uint64_t v2 = sub_24CCBB520();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC83408, 0, 0);
}

uint64_t sub_24CC83408()
{
  uint64_t v12 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  v0[11] = __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = sub_24CCBC5E0();
    v0[3] = sub_24CC692DC(v6, v7, &v11);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    v0[4] = sub_24CC692DC(0xD000000000000012, 0x800000024CCBF480, &v11);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v2, v3, "[%s] %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  BOOL v8 = (void *)swift_task_alloc();
  v0[12] = v8;
  void *v8 = v0;
  v8[1] = sub_24CC83684;
  uint64_t v9 = (void *)v0[5];
  v8[10] = v9;
  v8[11] = *v9;
  return MEMORY[0x270FA2498](sub_24CC7E894, 0, 0);
}

uint64_t sub_24CC83684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v4;
  *(void *)(*v4 + 104) = v3;
  swift_task_dealloc();
  if (v3)
  {
    BOOL v8 = sub_24CC83BF4;
  }
  else
  {
    *(void *)(v7 + 112) = a3;
    *(void *)(v7 + 120) = a1;
    BOOL v8 = sub_24CC837B8;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_24CC837B8()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[7];
  uint64_t ObjectType = swift_getObjectType();
  v0[2] = v1;
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(ObjectType, v2);
  swift_unknownObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
  {
    sub_24CC744B8(v0[7], &qword_269821D90);
    uint64_t v7 = sub_24CCBB870();
    os_log_type_t v8 = sub_24CCBC040();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_24CC60000, v7, v8, "No peerIdentifier to unlock with", v9, 2u);
      MEMORY[0x2533103A0](v9, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = (void *)v0[5];
    (*(void (**)(void, void, void))(v0[9] + 32))(v0[10], v0[7], v0[8]);
    uint64_t v13 = v12 + 3;
    uint64_t v14 = v12[6];
    uint64_t v15 = v12[7];
    __swift_project_boxed_opaque_existential_1(v13, v14);
    uint64_t v16 = sub_24CCBB4F0();
    uint64_t v18 = v17;
    v0[16] = v17;
    os_log_type_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 + 8) + **(int **)(v15 + 8));
    uint64_t v19 = (void *)swift_task_alloc();
    v0[17] = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_24CC83A3C;
    return v20(v16, v18, v14, v15);
  }
}

uint64_t sub_24CC83A3C()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_24CC83C64;
  }
  else {
    uint64_t v2 = sub_24CC83B6C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC83B6C()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CC83BF4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC83C64()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CC83CEC(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  v2[7] = *v1;
  uint64_t v3 = sub_24CCBB650();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC83DD4, 0, 0);
}

uint64_t sub_24CC83DD4()
{
  uint64_t v25 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v4 = v0[8];
  uint64_t v5 = sub_24CCBB890();
  __swift_project_value_buffer(v5, (uint64_t)qword_2698247F8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v2, v1, v4);
  uint64_t v7 = sub_24CCBB870();
  os_log_type_t v8 = sub_24CCBC060();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[9];
  uint64_t v11 = v0[8];
  if (v9)
  {
    uint64_t v20 = v0[10];
    os_log_type_t type = v8;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = v23;
    *(_DWORD *)uint64_t v12 = 136315650;
    uint64_t v13 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v13, v14, &v24);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v0[3] = sub_24CC692DC(0xD000000000000019, 0x800000024CCBF3D0, &v24);
    sub_24CCBC120();
    *(_WORD *)(v12 + 22) = 2112;
    sub_24CC88A90(&qword_269822430, MEMORY[0x263F39EF0]);
    swift_allocError();
    v6(v15, v20, v11);
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v16;
    sub_24CCBC120();
    *uint64_t v21 = v16;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v20, v11);
    _os_log_impl(&dword_24CC60000, v7, type, "[%s] %s — %@", (uint8_t *)v12, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v23, -1, -1);
    MEMORY[0x2533103A0](v12, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 8))(v0[10], v0[8]);
  }

  uint64_t v17 = (void *)swift_task_alloc();
  v0[11] = v17;
  void *v17 = v0;
  v17[1] = sub_24CC841AC;
  uint64_t v18 = (void *)v0[6];
  v17[10] = v18;
  v17[11] = *v18;
  return MEMORY[0x270FA2498](sub_24CC7E894, 0, 0);
}

uint64_t sub_24CC841AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v3;
  uint64_t v6 = *v3;
  *(void *)(*v3 + 96) = a1;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
  else
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 56) + **(int **)(a2 + 56));
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v5 + 104) = v10;
    void *v10 = v6;
    v10[1] = sub_24CC843B4;
    uint64_t v11 = *(void *)(v5 + 40);
    return v12(v11, ObjectType, a2);
  }
}

uint64_t sub_24CC843B4()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CC88ADC;
  }
  else {
    uint64_t v2 = sub_24CC88AD8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC844C8()
{
  uint64_t v0 = sub_24CCBB760();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F39FB0], v0);
  swift_retain();
  sub_24CCBB750();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24CCBB890();
  __swift_project_value_buffer(v4, (uint64_t)qword_2698247F8);
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC060();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_24CCBC5E0();
    uint64_t v12 = sub_24CC692DC(v9, v10, &v13);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v12 = sub_24CC692DC(0xD000000000000024, 0x800000024CCBF3A0, &v13);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v5, v6, "[%s] %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v8, -1, -1);
    MEMORY[0x2533103A0](v7, -1, -1);
  }

  swift_retain();
  sub_24CCBB780();
  return swift_release();
}

uint64_t sub_24CC847B8()
{
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247F8);
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v8 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v8);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24CC692DC(0xD000000000000010, 0x800000024CCBF380, &v8);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }

  swift_retain();
  sub_24CCBB720();
  return swift_release();
}

uint64_t sub_24CC849C0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return sub_24CC809CC();
}

uint64_t sub_24CC84A4C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return sub_24CC80D1C();
}

uint64_t sub_24CC84AD8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  return sub_24CC815EC(a1);
}

uint64_t sub_24CC84B6C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  return sub_24CC82414(a1);
}

uint64_t sub_24CC84C00()
{
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *os_log_type_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[4] = v0;
  v2[5] = *v0;
  return MEMORY[0x270FA2498](sub_24CC82CA4, 0, 0);
}

uint64_t sub_24CC84CD0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return sub_24CC832F0();
}

uint64_t sub_24CC84D5C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  return sub_24CC83CEC(a1);
}

uint64_t sub_24CC84DF8(uint64_t a1, uint64_t a2)
{
  sub_24CC7EC74(a1, a2);
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
  return sub_24CC860A8(v3);
}

uint64_t sub_24CC84E78()
{
  sub_24CC7EFCC();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return sub_24CC860A8(v1);
}

uint64_t sub_24CC84EF8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  return sub_24CC81070(a1);
}

uint64_t sub_24CC84F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  uint64_t v6 = sub_24CCBB560();
  v5[10] = v6;
  v5[11] = *(void *)(v6 - 8);
  v5[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC8504C, 0, 0);
}

uint64_t sub_24CC8504C()
{
  uint64_t v11 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  v0[13] = __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v10 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v6 = sub_24CCBC5E0();
    v0[7] = sub_24CC692DC(v6, v7, &v10);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v2, v3, "[%s] Triggering remote unlock", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  uint64_t v8 = (void *)swift_task_alloc();
  v0[14] = v8;
  void *v8 = v0;
  v8[1] = sub_24CC85244;
  return sub_24CC832F0();
}

uint64_t sub_24CC85244()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CC855E0;
  }
  else {
    uint64_t v2 = sub_24CC85358;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC85358()
{
  swift_beginAccess();
  sub_24CCBB6A0();
  swift_endAccess();
  sub_24CCBB550();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC85438;
  uint64_t v2 = *(void *)(v0 + 96);
  return sub_24CC82414(v2);
}

uint64_t sub_24CC85438()
{
  uint64_t v2 = *(void *)(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = *v1;
  *(void *)(v5 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CC8581C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24CC855E0()
{
  uint64_t v16 = v0;
  uint64_t v1 = (void *)v0[15];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC040();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    unint64_t v7 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = v14;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v8 = sub_24CCBC5E0();
    v0[5] = sub_24CC692DC(v8, v9, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2112;
    id v10 = v1;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v11;
    sub_24CCBC120();
    *unint64_t v7 = v11;

    _os_log_impl(&dword_24CC60000, v4, v5, "[%s] Encountered error while performing remote unlock %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v14, -1, -1);
    MEMORY[0x2533103A0](v6, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_24CC8581C()
{
  uint64_t v16 = v0;
  uint64_t v1 = (void *)v0[17];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC040();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    unint64_t v7 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = v14;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v8 = sub_24CCBC5E0();
    v0[5] = sub_24CC692DC(v8, v9, &v15);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2112;
    id v10 = v1;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v11;
    sub_24CCBC120();
    *unint64_t v7 = v11;

    _os_log_impl(&dword_24CC60000, v4, v5, "[%s] Encountered error while performing remote unlock %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v14, -1, -1);
    MEMORY[0x2533103A0](v6, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_24CC85A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_24CC85A7C, 0, 0);
}

uint64_t sub_24CC85A7C()
{
  uint64_t v11 = v0;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  id v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v10 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v6 = sub_24CCBC5E0();
    *(void *)(v0 + 16) = sub_24CC692DC(v6, v7, &v10);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v2, v3, "[%s] Presenting remote unlock error via ProxCard set up flow", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  sub_24CC7E1F0();
  swift_retain();
  sub_24CCBB770();
  swift_release();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_24CC85C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CC86C2C(a3);
}

uint64_t sub_24CC85C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CC87C0C(a3);
}

uint64_t sub_24CC85C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *unint64_t v7 = v5;
  v7[1] = sub_24CC68584;
  return sub_24CC815EC(a5);
}

uint64_t sub_24CC85D38(uint64_t a1)
{
  uint64_t v3 = sub_24CCBB710();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_24CC8611C(a1, (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v1;
  sub_24CC8890C((uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v11 + v10);
  swift_retain();
  sub_24CCA5444((uint64_t)v8, (uint64_t)&unk_269822508, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_24CC85ED4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CC85FB0;
  return v6(a1);
}

uint64_t sub_24CC85FB0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CC860A8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24CC860B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC8611C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CCBB710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC86180(uint64_t a1)
{
  uint64_t v2 = sub_24CCBB710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CC861DC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CC86214()
{
  return objectdestroy_52Tm(40);
}

uint64_t sub_24CC8621C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC68584;
  v3[6] = v2;
  return MEMORY[0x270FA2498](sub_24CC7CD18, 0, 0);
}

uint64_t sub_24CC862C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CCBB890();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_269824810);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_unknownObjectRetain_n();
  uint64_t v9 = sub_24CCBB870();
  os_log_type_t v10 = sub_24CCBC060();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v21 = a2;
    uint64_t v12 = v11;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v24 = v20;
    *(_DWORD *)uint64_t v12 = 136315650;
    uint64_t v13 = sub_24CCBC5E0();
    uint64_t v22 = sub_24CC692DC(v13, v14, &v24);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v22 = sub_24CC692DC(0x726573624F646461, 0xEF293A5F28726576, &v24);
    sub_24CCBC120();
    *(_WORD *)(v12 + 22) = 2080;
    uint64_t v22 = a1;
    uint64_t v23 = &off_26FF2C218;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822000);
    uint64_t v15 = sub_24CCBBE70();
    uint64_t v22 = sub_24CC692DC(v15, v16, &v24);
    sub_24CCBC120();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v9, v10, "%s %s: %s", (uint8_t *)v12, 0x20u);
    uint64_t v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v17, -1, -1);
    MEMORY[0x2533103A0](v12, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_24CCBB5B0();
}

uint64_t sub_24CC8661C(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = sub_24CCBB890();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_2698247F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  swift_unknownObjectRetain_n();
  os_log_type_t v10 = sub_24CCBB870();
  os_log_type_t v11 = sub_24CCBC060();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = a2;
    uint64_t v13 = v12;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v25 = v21;
    *(_DWORD *)uint64_t v13 = 136315650;
    nullsub_1(v4);
    uint64_t v14 = sub_24CCBC5E0();
    uint64_t v23 = sub_24CC692DC(v14, v15, &v25);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v23 = sub_24CC692DC(0x726573624F646461, 0xEF293A5F28726576, &v25);
    sub_24CCBC120();
    *(_WORD *)(v13 + 22) = 2080;
    uint64_t v23 = a1;
    uint64_t v24 = &off_26FF2B470;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822418);
    uint64_t v16 = sub_24CCBBE70();
    uint64_t v23 = sub_24CC692DC(v16, v17, &v25);
    sub_24CCBC120();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v10, v11, "%s %s: %s", (uint8_t *)v13, 0x20u);
    uint64_t v18 = v21;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v18, -1, -1);
    MEMORY[0x2533103A0](v13, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return sub_24CCBB5B0();
}

uint64_t sub_24CC86974()
{
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247F8);
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v8 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v8);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] Peer Connection failed. Stopping Live activity and invalidating the prox card.", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }

  sub_24CC7FBFC();
  swift_retain();
  sub_24CCBB720();
  return swift_release();
}

uint64_t sub_24CC86B44()
{
  return objectdestroy_52Tm(40);
}

uint64_t sub_24CC86B4C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24CC7FE60, 0, 0);
}

uint64_t sub_24CC86BF4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CC86C2C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = sub_24CCBB7B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24CCBB890();
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2698247F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  uint64_t v33 = v10;
  os_log_type_t v11 = sub_24CCBB870();
  os_log_type_t v12 = sub_24CCBC060();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v32 = v4;
  if (v13)
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v31 = a1;
    uint64_t v15 = v14;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v35 = v30;
    *(_DWORD *)uint64_t v15 = 136315650;
    uint64_t v16 = sub_24CCBC5E0();
    uint64_t v34 = sub_24CC692DC(v16, v17, &v35);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v34 = sub_24CC692DC(0xD000000000000037, 0x800000024CCBF690, &v35);
    sub_24CCBC120();
    *(_WORD *)(v15 + 22) = 2080;
    sub_24CC88A90(&qword_2698224F8, MEMORY[0x263F39FE0]);
    uint64_t v18 = sub_24CCBC460();
    uint64_t v34 = sub_24CC692DC(v18, v19, &v35);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    _os_log_impl(&dword_24CC60000, v11, v12, "[%s] %s — %s", (uint8_t *)v15, 0x20u);
    uint64_t v20 = v30;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v20, -1, -1);
    uint64_t v21 = v15;
    a1 = v31;
    MEMORY[0x2533103A0](v21, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  MEMORY[0x270FA5388](v22);
  *(&v30 - 2) = (uint64_t)v2;
  *(&v30 - 1) = a1;
  sub_24CC7F260();
  uint64_t v23 = sub_24CCBB870();
  os_log_type_t v24 = sub_24CCBC060();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v35 = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    uint64_t v27 = sub_24CCBC5E0();
    uint64_t v34 = sub_24CC692DC(v27, v28, &v35);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v23, v24, "[%s] Presenting ProxCard set up flow", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v26, -1, -1);
    MEMORY[0x2533103A0](v25, -1, -1);
  }

  swift_retain();
  sub_24CCBB780();
  return swift_release();
}

uint64_t sub_24CC870E8()
{
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247F8);
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v14 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v14);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24CC692DC(0xD000000000000038, 0x800000024CCBF650, &v14);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }

  sub_24CC7F260();
  uint64_t v7 = sub_24CCBB870();
  os_log_type_t v8 = sub_24CCBC060();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v11 = sub_24CCBC5E0();
    sub_24CC692DC(v11, v12, &v14);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v7, v8, "[%s] Dismissing ProxCard set up flow", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v10, -1, -1);
    MEMORY[0x2533103A0](v9, -1, -1);
  }

  swift_retain();
  sub_24CCBB720();
  swift_release();
  return sub_24CC7E1F0();
}

uint64_t sub_24CC87424()
{
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247F8);
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v8 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v8);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24CC692DC(0xD00000000000003CLL, 0x800000024CCBF5F0, &v8);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }

  sub_24CC7F260();
  return sub_24CC7F51C();
}

uint64_t sub_24CC87630()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CCBB6D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24CCBB890();
  __swift_project_value_buffer(v6, (uint64_t)qword_2698247F8);
  uint64_t v7 = sub_24CCBB870();
  os_log_type_t v8 = sub_24CCBC060();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v18 = v2;
    uint64_t v10 = v9;
    uint64_t v11 = swift_slowAlloc();
    v20[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v12 = sub_24CCBC5E0();
    uint64_t v19 = sub_24CC692DC(v12, v13, v20);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v19 = sub_24CC692DC(0xD00000000000003BLL, 0x800000024CCBF5B0, v20);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v7, v8, "[%s] %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v11, -1, -1);
    uint64_t v14 = v10;
    uint64_t v2 = v18;
    MEMORY[0x2533103A0](v14, -1, -1);
  }

  sub_24CC7F260();
  uint64_t v15 = v1 + OBJC_IVAR____TtC13DeviceSharing33GuestUserAccessResponseController_airPlayReceiverCoordinator;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
  sub_24CCBB6B0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_24CC7FBFC();
}

uint64_t sub_24CC87928()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24CCBB890();
  __swift_project_value_buffer(v6, (uint64_t)qword_2698247F8);
  uint64_t v7 = sub_24CCBB870();
  os_log_type_t v8 = sub_24CCBC060();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v11 = sub_24CCBC5E0();
    uint64_t v16 = sub_24CC692DC(v11, v12, &v17);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v16 = sub_24CC692DC(0xD00000000000003ELL, 0x800000024CCBF570, &v17);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v7, v8, "[%s] %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v10, -1, -1);
    MEMORY[0x2533103A0](v9, -1, -1);
  }

  sub_24CC7F260();
  uint64_t v13 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  void v14[4] = v1;
  v14[5] = v2;
  swift_retain();
  sub_24CC88D24((uint64_t)v5, (uint64_t)&unk_2698224E0, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_24CC87C0C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v34[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_24CCBB650();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v41 = v11;
  os_log_type_t v42 = &v34[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = &v34[-v12];
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24CCBB890();
  __swift_project_value_buffer(v14, (uint64_t)qword_2698247F8);
  uint64_t v43 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16);
  v43(v13, a1, v8);
  uint64_t v15 = sub_24CCBB870();
  os_log_type_t v16 = sub_24CCBC060();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = a1;
    uint64_t v19 = v18;
    uint64_t v36 = (void *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v45 = v37;
    *(_DWORD *)uint64_t v19 = 136315650;
    int v35 = v17;
    uint64_t v20 = sub_24CCBC5E0();
    uint64_t v40 = v4;
    uint64_t v44 = sub_24CC692DC(v20, v21, &v45);
    uint64_t v39 = v7;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v44 = sub_24CC692DC(0xD000000000000043, 0x800000024CCBF520, &v45);
    sub_24CCBC120();
    *(_WORD *)(v19 + 22) = 2112;
    sub_24CC88A90(&qword_269822430, MEMORY[0x263F39EF0]);
    swift_allocError();
    v43(v22, (uint64_t)v13, v8);
    uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v44 = v23;
    uint64_t v7 = v39;
    sub_24CCBC120();
    os_log_type_t v24 = v36;
    *uint64_t v36 = v23;
    uint64_t v4 = v40;
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v13, v8);
    _os_log_impl(&dword_24CC60000, v15, (os_log_type_t)v35, "[%s] %s — %@", (uint8_t *)v19, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v24, -1, -1);
    uint64_t v25 = v37;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v25, -1, -1);
    uint64_t v26 = v19;
    a1 = v38;
    MEMORY[0x2533103A0](v26, -1, -1);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v13, v8);
  }

  MEMORY[0x270FA5388](v27);
  *(void *)&v34[-16] = v2;
  *(void *)&v34[-8] = a1;
  sub_24CC7F260();
  uint64_t v28 = sub_24CCBBFA0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v7, 1, 1, v28);
  unint64_t v29 = v42;
  v43(v42, a1, v8);
  unint64_t v30 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v31 = (v41 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v32 = (char *)swift_allocObject();
  *((void *)v32 + 2) = 0;
  *((void *)v32 + 3) = 0;
  *((void *)v32 + 4) = v2;
  (*(void (**)(char *, unsigned char *, uint64_t))(v9 + 32))(&v32[v30], v29, v8);
  *(void *)&v32[v31] = v4;
  swift_retain();
  sub_24CCA5444((uint64_t)v7, (uint64_t)&unk_2698224D0, (uint64_t)v32);
  return swift_release();
}

uint64_t sub_24CC8816C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(a2 + 48))(v5, &off_26FF2B4B8, v4, ObjectType, a2);
}

uint64_t sub_24CC881D0()
{
  uint64_t v1 = sub_24CCBB650();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24CC882B0()
{
  uint64_t v2 = *(void *)(sub_24CCBB650() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24CC6CB14;
  v7[4] = v5;
  v7[5] = v6;
  v7[3] = v4;
  return MEMORY[0x270FA2498](sub_24CC85A7C, 0, 0);
}

uint64_t sub_24CC883D0(uint64_t a1)
{
  return sub_24CC7F4A0(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_24CC883D8(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a2 + 40))(v2, &off_26FF2B4B8, ObjectType, a2);
}

uint64_t sub_24CC88434()
{
  return objectdestroy_52Tm(48);
}

uint64_t sub_24CC8843C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24CC68584;
  return sub_24CC84F8C(a1, v4, v5, v7, v6);
}

uint64_t sub_24CC884FC(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a2 + 32))(v2, &off_26FF2B4B8, ObjectType, a2);
}

uint64_t sub_24CC88558(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a2 + 24))(v2, &off_26FF2B4B8, ObjectType, a2);
}

uint64_t sub_24CC885B4()
{
  return objectdestroy_52Tm(48);
}

uint64_t objectdestroy_52Tm(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24CC88608()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_24CC6CB14;
  *(_OWORD *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_24CC7F800, 0, 0);
}

uint64_t sub_24CC886B4(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a2 + 16))(v2, &off_26FF2B4B8, ObjectType, a2);
}

uint64_t sub_24CC88710(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(a2 + 8))(v5, &off_26FF2B4B8, v4, ObjectType, a2);
}

uint64_t sub_24CC88774()
{
  uint64_t v1 = *(void *)(sub_24CCBB710() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24CCBB6E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    uint64_t v6 = sub_24CCBB650();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v3, v6);
    }
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24CC8890C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CCBB710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC88970()
{
  uint64_t v2 = *(void *)(sub_24CCBB710() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24CC6CB14;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24CC68584;
  return sub_24CC815EC(v3);
}

uint64_t sub_24CC88A90(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t NWProtocolFramer.Message.transportItem.getter()
{
  sub_24CCBBB70();
  if (v6)
  {
    int v0 = swift_dynamicCast();
    uint64_t v1 = v4;
    unsigned __int8 v2 = v0 ^ 1;
    if (!v0) {
      uint64_t v1 = 0;
    }
  }
  else
  {
    sub_24CC754D8((uint64_t)v5);
    uint64_t v1 = 0;
    unsigned __int8 v2 = 1;
  }
  return v1 | ((unint64_t)v2 << 32);
}

uint64_t NWProtocolFramer.Message.init(transportItem:)()
{
  if (qword_269821A70 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v0 = sub_24CCBBB50();
  swift_retain();
  sub_24CCBBB80();
  swift_release();
  return v0;
}

uint64_t sub_24CC88C28(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a3) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v7 = a2 - a1;
  if (!a1) {
    uint64_t v7 = 0;
  }
  if (v7 >= qword_269822C48)
  {
    if (a1)
    {
      sub_24CCBC120();
      sub_24CCBC120();
    }
    *(void *)a5 = 0;
    *(unsigned char *)(a5 + 8) = a1 == 0;
    return qword_269822C48;
  }
  return result;
}

uint64_t sub_24CC88D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CCBBFA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CCBBF90();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CC7B8E8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CCBBF40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_24CC88EC8(void **a1, void *a2)
{
  unsigned __int8 v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR___DSNotificationController_activeNotification);
  swift_beginAccess();
  unsigned int v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

void *sub_24CC88F2C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___DSNotificationController_activeNotification);
  swift_beginAccess();
  unsigned __int8 v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_24CC88F7C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___DSNotificationController_activeNotification);
  swift_beginAccess();
  unsigned int v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_24CC88FD0())()
{
  return j__swift_endAccess;
}

uint64_t sub_24CC8902C()
{
  uint64_t v1 = v0 + OBJC_IVAR___DSNotificationController_delegate;
  swift_beginAccess();
  return MEMORY[0x253310490](v1);
}

uint64_t sub_24CC8907C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR___DSNotificationController_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_24CC890E8(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___DSNotificationController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x253310490](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  _OWORD v3[3] = v6;
  v3[4] = v7;
  return sub_24CC89170;
}

void sub_24CC89170(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_24CC891F8(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v4 + 80) = a2;
  *(void *)(v4 + 88) = v3;
  *(void *)(v4 + 72) = a1;
  *(double *)(v4 + 64) = a3;
  *(void *)(v4 + 96) = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  *(void *)(v4 + 104) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC892CC, 0, 0);
}

uint64_t sub_24CC892CC()
{
  uint64_t v31 = v0;
  v30[1] = *MEMORY[0x263EF8340];
  if (qword_269821A80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824798);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    v30[0] = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = sub_24CCBC5E0();
    *(void *)(v0 + 48) = sub_24CC692DC(v6, v7, v30);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    *(void *)(v0 + 56) = sub_24CC692DC(0xD00000000000002FLL, 0x800000024CCBF870, v30);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v2, v3, "%s %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  CFOptionFlags v8 = *(void *)(v0 + 80);
  CFTimeInterval v9 = *(double *)(v0 + 64);
  objc_msgSend(*(id *)(v0 + 88), sel_cancelNotificationIfNecessary);
  *(_DWORD *)(v0 + 136) = 0;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v11 = (const __CFDictionary *)sub_24CCBBDB0();
  CFUserNotificationRef v12 = CFUserNotificationCreate(v10, v9, v8, (SInt32 *)(v0 + 136), v11);
  *(void *)(v0 + 112) = v12;

  if (!v12 || *(_DWORD *)(v0 + 136))
  {
    uint64_t v22 = sub_24CCBB870();
    os_log_type_t v23 = sub_24CCBC040();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v30[0] = v25;
      *(_DWORD *)uint64_t v24 = 136315394;
      uint64_t v26 = sub_24CCBC5E0();
      *(void *)(v0 + 40) = sub_24CC692DC(v26, v27, v30);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 1024;
      swift_beginAccess();
      *(_DWORD *)(v0 + 140) = *(_DWORD *)(v0 + 136);
      sub_24CCBC120();
      _os_log_impl(&dword_24CC60000, v22, v23, "%s error creating CFUserNotification: %d", (uint8_t *)v24, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v25, -1, -1);
      MEMORY[0x2533103A0](v24, -1, -1);
    }
    else
    {
    }
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28(0);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 104);
    uint64_t v14 = *(void **)(v0 + 88);
    uint64_t v15 = sub_24CCBBFA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
    sub_24CCBBF80();
    os_log_type_t v16 = v12;
    id v17 = v14;
    uint64_t v18 = sub_24CCBBF70();
    uint64_t v19 = (void *)swift_allocObject();
    uint64_t v20 = MEMORY[0x263F8F500];
    v19[2] = v18;
    v19[3] = v20;
    v19[4] = v17;
    v19[5] = v16;
    sub_24CC88D24(v13, (uint64_t)&unk_2698225F0, (uint64_t)v19);
    swift_release();
    unint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v21;
    *unint64_t v21 = v0;
    v21[1] = sub_24CC8982C;
    return MEMORY[0x270F25FC8]();
  }
}

uint64_t sub_24CC8982C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 128) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CC89958, 0, 0);
}

uint64_t sub_24CC89958()
{
  uint64_t v1 = (void *)v0[14];

  uint64_t v2 = v0[16];
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_24CC899F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  sub_24CCBBF80();
  v5[10] = sub_24CCBBF70();
  uint64_t v7 = sub_24CCBBF40();
  return MEMORY[0x270FA2498](sub_24CC89A90, v7, v6);
}

uint64_t sub_24CC89A90()
{
  uint64_t v1 = (void *)v0[9];
  uint64_t v2 = v0[8];
  swift_release();
  uint64_t v3 = (void **)(v2 + OBJC_IVAR___DSNotificationController_activeNotification);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v1;
  id v5 = v1;

  uint64_t v6 = v2 + OBJC_IVAR___DSNotificationController_delegate;
  swift_beginAccess();
  if (MEMORY[0x253310490](v6))
  {
    uint64_t v8 = v0[8];
    uint64_t v7 = v0[9];
    uint64_t v9 = *(void *)(v6 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(v8, v7, ObjectType, v9);
    swift_unknownObjectRelease();
  }
  CFDictionaryRef v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t NotificationController.postGuestUserModeUnavailableNotification(with:)(uint64_t a1)
{
  v2[50] = a1;
  v2[51] = v1;
  v2[52] = swift_getObjectType();
  sub_24CCBB540();
  v2[53] = swift_task_alloc();
  sub_24CCBBE10();
  v2[54] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC89C6C, 0, 0);
}

uint64_t sub_24CC89C6C()
{
  uint64_t v40 = v0;
  if (qword_269821A80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824798);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v39 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = sub_24CCBC5E0();
    *(void *)(v0 + 384) = sub_24CC692DC(v6, v7, &v39);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    *(void *)(v0 + 392) = sub_24CC692DC(0xD00000000000002FLL, 0x800000024CCBF770, &v39);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v2, v3, "%s %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_269822538);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CCBD9B0;
  uint64_t result = *MEMORY[0x263EFFFC8];
  if (!*MEMORY[0x263EFFFC8])
  {
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = 0x6E776F6E6B6E55;
  uint64_t v11 = *(void *)(v0 + 400);
  *(void *)(inited + 32) = sub_24CCBBE50();
  *(void *)(inited + 40) = v12;
  if (v11)
  {
    unint64_t v13 = 0xE700000000000000;
    uint64_t v14 = 0x6E776F6E6B6E55;
  }
  else
  {
    sub_24CCBBE00();
    sub_24CC8BFC4();
    sub_24CCBC0E0();
    sub_24CCBB530();
    uint64_t v14 = sub_24CCBBE60();
  }
  uint64_t v15 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v14;
  *(void *)(inited + 56) = v13;
  uint64_t result = *MEMORY[0x263EFFFD8];
  if (!*MEMORY[0x263EFFFD8]) {
    goto LABEL_21;
  }
  *(void *)(inited + 80) = sub_24CCBBE50();
  *(void *)(inited + 88) = v16;
  if (v11)
  {
    unint64_t v17 = 0xE700000000000000;
  }
  else
  {
    sub_24CCBBE00();
    sub_24CC8BFC4();
    sub_24CCBC0E0();
    sub_24CCBB530();
    uint64_t v10 = sub_24CCBBE60();
  }
  *(void *)(inited + 120) = v15;
  *(void *)(inited + 96) = v10;
  *(void *)(inited + 104) = v17;
  uint64_t result = *MEMORY[0x263EFFFE0];
  if (!*MEMORY[0x263EFFFE0]) {
    goto LABEL_22;
  }
  *(void *)(inited + 128) = sub_24CCBBE50();
  *(void *)(inited + 136) = v18;
  uint64_t v19 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 168) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 144) = 1;
  unint64_t v20 = sub_24CC75884(inited);
  uint64_t result = *MEMORY[0x263F79618];
  if (!*MEMORY[0x263F79618])
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v21 = sub_24CCBBE50();
  uint64_t v23 = v22;
  *(void *)(v0 + 216) = v19;
  *(unsigned char *)(v0 + 192) = 1;
  sub_24CC761F4((_OWORD *)(v0 + 192), (_OWORD *)(v0 + 224));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v39 = v20;
  sub_24CC8BE70((_OWORD *)(v0 + 224), v21, v23, isUniquelyReferenced_nonNull_native);
  uint64_t v25 = v39;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *MEMORY[0x263F79640];
  if (!*MEMORY[0x263F79640])
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v26 = sub_24CCBBE50();
  uint64_t v28 = v27;
  *(void *)(v0 + 280) = v19;
  *(unsigned char *)(v0 + 256) = 1;
  sub_24CC761F4((_OWORD *)(v0 + 256), (_OWORD *)(v0 + 288));
  char v29 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v39 = v25;
  sub_24CC8BE70((_OWORD *)(v0 + 288), v26, v28, v29);
  uint64_t v30 = v39;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *MEMORY[0x263F00000];
  if (!*MEMORY[0x263F00000])
  {
LABEL_25:
    __break(1u);
    return result;
  }
  uint64_t v31 = sub_24CCBBE50();
  uint64_t v33 = v32;
  sub_24CCBBE00();
  sub_24CC8BFC4();
  sub_24CCBC0E0();
  sub_24CCBB530();
  uint64_t v34 = sub_24CCBBE60();
  *(void *)(v0 + 344) = MEMORY[0x263F8D310];
  *(void *)(v0 + 320) = v34;
  *(void *)(v0 + 328) = v35;
  sub_24CC761F4((_OWORD *)(v0 + 320), (_OWORD *)(v0 + 352));
  char v36 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v39 = v30;
  sub_24CC8BE70((_OWORD *)(v0 + 352), v31, v33, v36);
  uint64_t v37 = v39;
  *(void *)(v0 + 440) = v39;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v38 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v38;
  *uint64_t v38 = v0;
  v38[1] = sub_24CC8A268;
  return sub_24CC891F8(v37, 3, 0.0);
}

uint64_t sub_24CC8A268(uint64_t a1)
{
  *(void *)(*(void *)v1 + 456) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24CC8A388, 0, 0);
}

uint64_t sub_24CC8A388()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 456);
  return v1(v2);
}

uint64_t NotificationController.postUnableToPlayProtectedContent()()
{
  v1[48] = v0;
  v1[49] = swift_getObjectType();
  sub_24CCBB540();
  v1[50] = swift_task_alloc();
  sub_24CCBBE10();
  v1[51] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC8A4BC, 0, 0);
}

uint64_t sub_24CC8A4BC()
{
  uint64_t v35 = v0;
  if (qword_269821A80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824798);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v34 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = sub_24CCBC5E0();
    *(void *)(v0 + 368) = sub_24CC692DC(v6, v7, &v34);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    *(void *)(v0 + 376) = sub_24CC692DC(0xD000000000000022, 0x800000024CCBF7E0, &v34);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v2, v3, "%s %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_269822538);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CCBD9C0;
  uint64_t result = *MEMORY[0x263EFFFC8];
  if (!*MEMORY[0x263EFFFC8])
  {
    __break(1u);
    goto LABEL_15;
  }
  *(void *)(inited + 32) = sub_24CCBBE50();
  *(void *)(inited + 40) = v10;
  sub_24CCBBE00();
  sub_24CC8BFC4();
  sub_24CCBC0E0();
  sub_24CCBB530();
  uint64_t v11 = sub_24CCBBE60();
  uint64_t v12 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v11;
  *(void *)(inited + 56) = v13;
  uint64_t result = *MEMORY[0x263EFFFD8];
  if (!*MEMORY[0x263EFFFD8])
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(void *)(inited + 80) = sub_24CCBBE50();
  *(void *)(inited + 88) = v14;
  sub_24CCBBE00();
  sub_24CCBC0E0();
  sub_24CCBB530();
  uint64_t v15 = sub_24CCBBE60();
  *(void *)(inited + 120) = v12;
  *(void *)(inited + 96) = v15;
  *(void *)(inited + 104) = v16;
  uint64_t result = *MEMORY[0x263F00000];
  if (!*MEMORY[0x263F00000])
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  *(void *)(inited + 128) = sub_24CCBBE50();
  *(void *)(inited + 136) = v17;
  sub_24CCBBE00();
  sub_24CCBC0E0();
  sub_24CCBB530();
  uint64_t v18 = sub_24CCBBE60();
  *(void *)(inited + 168) = v12;
  *(void *)(inited + 144) = v18;
  *(void *)(inited + 152) = v19;
  uint64_t result = *MEMORY[0x263EFFFE0];
  if (!*MEMORY[0x263EFFFE0])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  *(void *)(inited + 176) = sub_24CCBBE50();
  *(void *)(inited + 184) = v20;
  uint64_t v21 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 216) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 192) = 1;
  unint64_t v22 = sub_24CC75884(inited);
  uint64_t result = *MEMORY[0x263F79618];
  if (!*MEMORY[0x263F79618])
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v23 = sub_24CCBBE50();
  uint64_t v25 = v24;
  *(void *)(v0 + 264) = v21;
  *(unsigned char *)(v0 + 240) = 1;
  sub_24CC761F4((_OWORD *)(v0 + 240), (_OWORD *)(v0 + 272));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v34 = v22;
  sub_24CC8BE70((_OWORD *)(v0 + 272), v23, v25, isUniquelyReferenced_nonNull_native);
  uint64_t v27 = v34;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *MEMORY[0x263F79640];
  if (!*MEMORY[0x263F79640])
  {
LABEL_19:
    __break(1u);
    return result;
  }
  uint64_t v28 = sub_24CCBBE50();
  uint64_t v30 = v29;
  *(void *)(v0 + 328) = v21;
  *(unsigned char *)(v0 + 304) = 1;
  sub_24CC761F4((_OWORD *)(v0 + 304), (_OWORD *)(v0 + 336));
  char v31 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v34 = v27;
  sub_24CC8BE70((_OWORD *)(v0 + 336), v28, v30, v31);
  uint64_t v32 = v34;
  *(void *)(v0 + 416) = v34;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v33 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v33;
  *uint64_t v33 = v0;
  v33[1] = sub_24CC8AA00;
  return sub_24CC891F8(v32, 3, 0.0);
}

uint64_t sub_24CC8AA00(uint64_t a1)
{
  *(void *)(*(void *)v1 + 432) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24CC8AB20, 0, 0);
}

uint64_t sub_24CC8AB20()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 432);
  return v1(v2);
}

id NotificationController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id NotificationController.init()()
{
  *(void *)&v0[OBJC_IVAR___DSNotificationController_activeNotification] = 0;
  *(void *)&v0[OBJC_IVAR___DSNotificationController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationController();
  return objc_msgSendSuper2(&v2, sel_init);
}

id NotificationController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall NotificationController.cancelNotificationIfNecessary()()
{
  id v1 = v0;
  swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821A80 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CCBB890();
  __swift_project_value_buffer(v5, (uint64_t)qword_269824798);
  uint64_t v6 = sub_24CCBB870();
  os_log_type_t v7 = sub_24CCBC060();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v18 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v10 = sub_24CCBC5E0();
    uint64_t v17 = sub_24CC692DC(v10, v11, &v18);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v17 = sub_24CC692DC(0xD00000000000001FLL, 0x800000024CCBF810, &v18);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v6, v7, "%s %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v9, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);
  }

  uint64_t v12 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  sub_24CCBBF80();
  id v13 = v1;
  uint64_t v14 = sub_24CCBBF70();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  sub_24CC88D24((uint64_t)v4, (uint64_t)&unk_269822568, (uint64_t)v15);
  swift_release();
}

uint64_t sub_24CC8AFBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  sub_24CCBBF80();
  *(void *)(v4 + 48) = sub_24CCBBF70();
  uint64_t v6 = sub_24CCBBF40();
  return MEMORY[0x270FA2498](sub_24CC8B054, v6, v5);
}

uint64_t sub_24CC8B054()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  uint64_t v2 = (id *)(v1 + OBJC_IVAR___DSNotificationController_activeNotification);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = (__CFUserNotification *)*v2;
    CFUserNotificationCancel(v3);
    id v4 = *v2;
    *uint64_t v2 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t DSSGuestUserModeAppUnavailable.description.getter(uint64_t a1)
{
  uint64_t v1 = 0x616E6F73726550;
  uint64_t v2 = 0x6E776F6E6B6E55;
  if (a1 == 2) {
    uint64_t v2 = 0x656D697465636146;
  }
  if (a1 != 1) {
    uint64_t v1 = v2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 42;
  }
}

uint64_t sub_24CC8B1B8()
{
  return DSSGuestUserModeAppUnavailable.description.getter(*v0);
}

uint64_t sub_24CC8B1C0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D50);
  uint64_t v5 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388]();
  os_log_t v54 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CCBB520();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698225F8);
  int v51 = a2;
  uint64_t v12 = sub_24CCBC400();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v53 = v7;
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v45 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v43 = v2;
  int64_t v44 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v46 = v5 + 16;
  unint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v50 = v5;
  uint64_t v52 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  uint64_t v48 = v11;
  uint64_t v49 = v8;
  while (1)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v44) {
      break;
    }
    uint64_t v26 = v45;
    unint64_t v27 = v45[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v44) {
        goto LABEL_34;
      }
      unint64_t v27 = v45[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v43;
          if ((v51 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v44) {
              goto LABEL_34;
            }
            unint64_t v27 = v45[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v8 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v51)
    {
      (*v18)(v10, v30, v53);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v50 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v50 + 32))(v54, v31 + v32 * v24, v55);
    }
    else
    {
      (*v47)(v10, v30, v53);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v50 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))(v54, v33 + v32 * v24, v55);
    }
    sub_24CC8C8D8();
    uint64_t result = sub_24CCBBDD0();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v8 = v49;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      uint64_t v8 = v49;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v53);
    uint64_t result = (*v52)(*(void *)(v13 + 56) + v32 * v22, v54, v55);
    ++*(void *)(v13 + 16);
    uint64_t v11 = v48;
  }
  swift_release();
  uint64_t v3 = v43;
  uint64_t v26 = v45;
  if ((v51 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_24CC8B6A0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698220E8);
  uint64_t v6 = sub_24CCBC400();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_24CC761F4(v24, v35);
      }
      else
      {
        sub_24CC6CA84((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_24CCBC540();
      sub_24CCBBEA0();
      uint64_t result = sub_24CCBC570();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_24CC761F4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24CC8B9A0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698220D8);
  uint64_t result = sub_24CCBC400();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    BOOL v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_34;
        }
        unint64_t v18 = v30[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_34;
          }
          unint64_t v18 = v30[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_34:
              if (a2)
              {
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 >= 64) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v18 = v30[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v12) {
                  goto LABEL_34;
                }
                unint64_t v18 = v30[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(*(void *)(v5 + 48) + 8 * v16);
      int64_t v21 = (long long *)(*(void *)(v5 + 56) + 40 * v16);
      if (a2) {
        sub_24CC76204(v21, (uint64_t)v31);
      }
      else {
        sub_24CC7B4B8((uint64_t)v21, (uint64_t)v31);
      }
      uint64_t result = sub_24CCBC530();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(void *)(*(void *)(v7 + 48) + 8 * v14) = v20;
      uint64_t result = sub_24CC76204(v31, *(void *)(v7 + 56) + 40 * v14);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24CC8BC68(uint64_t a1, uint64_t a2, char a3)
{
  id v4 = (void **)v3;
  uint64_t v8 = sub_24CCBB520();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v12 = (void *)*v3;
  unint64_t v14 = sub_24CC9F244(a2);
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
      sub_24CC9FE84();
      goto LABEL_7;
    }
    sub_24CC8B1C0(v17, a3 & 1);
    unint64_t v28 = sub_24CC9F244(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_24CC8C510(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_24CCBC4B0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D50);
  uint64_t v23 = *(void *)(v22 - 8);
  unint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;
  return v24(v26, a1, v25);
}

_OWORD *sub_24CC8BE70(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24CC9F3A0(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24CCA0230();
      goto LABEL_7;
    }
    sub_24CC8B6A0(v15, a4 & 1);
    unint64_t v21 = sub_24CC9F3A0(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_24CCBC4B0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_24CC761F4(a1, v19);
  }
LABEL_13:
  sub_24CC8C608(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

unint64_t sub_24CC8BFC4()
{
  unint64_t result = qword_269822540;
  if (!qword_269822540)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_269822540);
  }
  return result;
}

uint64_t type metadata accessor for NotificationController()
{
  return self;
}

uint64_t sub_24CC8C028()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CC8C068(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24CC6CB14;
  return sub_24CC8AFBC(a1, v4, v5, v6);
}

id sub_24CC8C11C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR___DSNotificationController_activeNotification);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_24CC8C184@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___DSNotificationController_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x253310490](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_24CC8C1E0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR___DSNotificationController_delegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of NotificationControllerDelegate.notificationControllerDidPostNotification(_:activeNotification:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t method lookup function for NotificationController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NotificationController);
}

uint64_t dispatch thunk of NotificationController.activeNotification.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of NotificationController.activeNotification.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of NotificationController.activeNotification.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of NotificationController.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of NotificationController.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of NotificationController.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t sub_24CC8C3A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CC8C3D0(long long *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_24CC9F35C(a2);
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
      sub_24CCA0418();
      goto LABEL_7;
    }
    sub_24CC8B9A0(v13, a3 & 1);
    unint64_t v19 = sub_24CC9F35C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      char v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24CCBC4B0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7] + 40 * v10;
    __swift_destroy_boxed_opaque_existential_0(v17);
    return sub_24CC76204(a1, v17);
  }
LABEL_13:
  return sub_24CC8C674(v10, a2, a1, v16);
}

uint64_t sub_24CC8C510(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_24CCBB520();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D50);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
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

_OWORD *sub_24CC8C608(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_24CC761F4(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_24CC8C674(unint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_24CC76204(a3, a4[7] + 40 * a1);
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

uint64_t sub_24CC8C6E0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CC8C718(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC68584;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698224B8 + dword_2698224B8);
  return v6(a1, v4);
}

uint64_t sub_24CC8C7D0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CC8C818(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24CC68584;
  return sub_24CC899F8(a1, v4, v5, v7, v6);
}

unint64_t sub_24CC8C8D8()
{
  unint64_t result = qword_269822600;
  if (!qword_269822600)
  {
    sub_24CCBB520();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269822600);
  }
  return result;
}

void *sub_24CC8C930()
{
  type metadata accessor for NearbyDeviceActor();
  swift_allocObject();
  unint64_t result = (void *)sub_24CC8C9A8();
  off_269822610 = result;
  return result;
}

uint64_t sub_24CC8C970()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_24CC8C9A8()
{
  uint64_t v1 = sub_24CCBC080();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CCBC0B0();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_24CCBBD80();
  MEMORY[0x270FA5388](v6 - 8);
  sub_24CC961D0();
  sub_24CCBBD70();
  v8[1] = MEMORY[0x263F8EE78];
  sub_24CC93520(&qword_269821BD0, MEMORY[0x263F8F198]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821BD8);
  sub_24CC69280();
  sub_24CCBC170();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F138], v1);
  *(void *)(v0 + 16) = sub_24CCBC0C0();
  return v0;
}

uint64_t sub_24CC8CBDC()
{
  return sub_24CCBC0D0();
}

uint64_t sub_24CC8CC00()
{
  if (qword_269821A78 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_24CC8CC5C()
{
  return MEMORY[0x270FA2150](v0);
}

uint64_t NearbyDevice.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NearbyDevice.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NearbyDevice.endpoint.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NearbyDevice(0) + 24);
  uint64_t v4 = sub_24CCBB8F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for NearbyDevice(uint64_t a1)
{
  return sub_24CC94B14(a1, (uint64_t *)&unk_269822630);
}

uint64_t NearbyDevice.init(name:identifier:endpoint:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  uint64_t v7 = (char *)a6 + *(int *)(type metadata accessor for NearbyDevice(0) + 24);
  uint64_t v8 = sub_24CCBB8F0();
  BOOL v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
  return v9(v7, a5, v8);
}

uint64_t NearbyDevice.hash(into:)()
{
  if (*(void *)(v0 + 8))
  {
    sub_24CCBC560();
    swift_bridgeObjectRetain();
    sub_24CCBBEA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24CCBC560();
  }
  swift_bridgeObjectRetain();
  sub_24CCBBEA0();
  swift_bridgeObjectRelease();
  type metadata accessor for NearbyDevice(0);
  sub_24CCBB8F0();
  sub_24CC93520(&qword_269822618, MEMORY[0x263F14120]);
  return sub_24CCBBDE0();
}

uint64_t NearbyDevice.hashValue.getter()
{
  sub_24CCBC540();
  if (*(void *)(v0 + 8))
  {
    sub_24CCBC560();
    swift_bridgeObjectRetain();
    sub_24CCBBEA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24CCBC560();
  }
  swift_bridgeObjectRetain();
  sub_24CCBBEA0();
  swift_bridgeObjectRelease();
  type metadata accessor for NearbyDevice(0);
  sub_24CCBB8F0();
  sub_24CC93520(&qword_269822618, MEMORY[0x263F14120]);
  sub_24CCBBDE0();
  return sub_24CCBC570();
}

uint64_t sub_24CC8CFF4()
{
  if (*(void *)(v0 + 8))
  {
    sub_24CCBC560();
    swift_bridgeObjectRetain();
    sub_24CCBBEA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24CCBC560();
  }
  swift_bridgeObjectRetain();
  sub_24CCBBEA0();
  swift_bridgeObjectRelease();
  sub_24CCBB8F0();
  sub_24CC93520(&qword_269822618, MEMORY[0x263F14120]);
  return sub_24CCBBDE0();
}

uint64_t sub_24CC8D0F0()
{
  sub_24CCBC540();
  if (*(void *)(v0 + 8))
  {
    sub_24CCBC560();
    swift_bridgeObjectRetain();
    sub_24CCBBEA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24CCBC560();
  }
  swift_bridgeObjectRetain();
  sub_24CCBBEA0();
  swift_bridgeObjectRelease();
  sub_24CCBB8F0();
  sub_24CC93520(&qword_269822618, MEMORY[0x263F14120]);
  sub_24CCBBDE0();
  return sub_24CCBC570();
}

uint64_t static NearbyDevice.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24)) {
    return 1;
  }
  else {
    return sub_24CCBC480();
  }
}

uint64_t sub_24CC8D230(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24)) {
    return 1;
  }
  else {
    return sub_24CCBC480();
  }
}

uint64_t NearbyDevice.description.getter()
{
  return 0;
}

uint64_t static NearbyDeviceProvidingError.== infix(_:_:)()
{
  return 1;
}

uint64_t NearbyDeviceProvidingError.hash(into:)()
{
  return sub_24CCBC550();
}

uint64_t NearbyDeviceProvidingError.hashValue.getter()
{
  return sub_24CCBC570();
}

uint64_t sub_24CC8D440()
{
  return sub_24CCBC570();
}

uint64_t sub_24CC8D484()
{
  return sub_24CCBC550();
}

uint64_t sub_24CC8D4AC()
{
  return sub_24CCBC570();
}

uint64_t sub_24CC8D4FC@<X0>(void *a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v3 = sub_24CCBBCE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  BOOL v27 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822708);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822710);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v28 = (uint64_t)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  BOOL v14 = (char *)&v27 - v13;
  MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v27 - v15;
  char v29 = a1;
  if (*a1)
  {
    sub_24CCBBD00();
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v17(v16, 0, 1, v3);
  }
  else
  {
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v17((char *)&v27 - v15, 1, 1, v3);
  }
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v14, *MEMORY[0x263F143A0], v3);
  v17(v14, 0, 1, v3);
  uint64_t v18 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_24CC74734((uint64_t)v16, (uint64_t)v8, &qword_269822710);
  sub_24CC74734((uint64_t)v14, v18, &qword_269822710);
  unint64_t v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v19((uint64_t)v8, 1, v3) != 1)
  {
    uint64_t v21 = v28;
    sub_24CC74734((uint64_t)v8, v28, &qword_269822710);
    if (v19(v18, 1, v3) != 1)
    {
      uint64_t v22 = v21;
      uint64_t v23 = v27;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v27, v18, v3);
      sub_24CC93520(&qword_269822718, MEMORY[0x263F143A8]);
      char v24 = sub_24CCBBDF0();
      uint64_t v25 = *(void (**)(char *, uint64_t))(v4 + 8);
      v25(v23, v3);
      sub_24CC744B8((uint64_t)v14, &qword_269822710);
      sub_24CC744B8((uint64_t)v16, &qword_269822710);
      v25((char *)v22, v3);
      uint64_t result = sub_24CC744B8((uint64_t)v8, &qword_269822710);
      if (v24) {
        goto LABEL_11;
      }
LABEL_12:
      BOOL v26 = *v29 == 0;
      goto LABEL_13;
    }
    sub_24CC744B8((uint64_t)v14, &qword_269822710);
    sub_24CC744B8((uint64_t)v16, &qword_269822710);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v21, v3);
LABEL_9:
    uint64_t result = sub_24CC744B8((uint64_t)v8, &qword_269822708);
    goto LABEL_12;
  }
  sub_24CC744B8((uint64_t)v14, &qword_269822710);
  sub_24CC744B8((uint64_t)v16, &qword_269822710);
  if (v19(v18, 1, v3) != 1) {
    goto LABEL_9;
  }
  uint64_t result = sub_24CC744B8((uint64_t)v8, &qword_269822710);
LABEL_11:
  BOOL v26 = 1;
LABEL_13:
  BOOL *v30 = v26;
  return result;
}

uint64_t sub_24CC8D95C()
{
  return sub_24CC630E4();
}

void sub_24CC8D988()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = *v0;
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24CCBB890();
  __swift_project_value_buffer(v3, (uint64_t)qword_2698247C8);
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC060();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = sub_24CCBC5E0();
    sub_24CC692DC(v8, v9, &v12);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v4, v5, "[%s] Start browsing for nearby devices", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v7, -1, -1);
    MEMORY[0x2533103A0](v6, -1, -1);
  }

  uint64_t v10 = (os_unfair_lock_s *)(v1 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822698);
  sub_24CC8DB78((uint64_t *)((char *)v10 + *(int *)(v11 + 28)), v1, v2);
  os_unfair_lock_unlock(v10);
}

uint64_t sub_24CC8DB78(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a3;
  uint64_t v6 = sub_24CCBBCE0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(a2 + 16))(v8);
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24CCBB890();
  __swift_project_value_buffer(v12, (uint64_t)qword_2698247C8);
  uint64_t v13 = sub_24CCBB870();
  os_log_type_t v14 = sub_24CCBC060();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v30 = v3;
    uint64_t v15 = swift_slowAlloc();
    char v29 = a1;
    char v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = v6;
    uint64_t v18 = v17;
    uint64_t v33 = v17;
    uint64_t v27 = v7;
    *(_DWORD *)char v16 = 136315138;
    v26[1] = v16 + 4;
    uint64_t v19 = sub_24CCBC5E0();
    uint64_t v32 = sub_24CC692DC(v19, v20, &v33);
    uint64_t v7 = v27;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v13, v14, "[%s] Clearing previous browsing state and results", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v21 = v18;
    uint64_t v6 = v28;
    MEMORY[0x2533103A0](v21, -1, -1);
    uint64_t v22 = v16;
    a1 = v29;
    MEMORY[0x2533103A0](v22, -1, -1);
  }

  sub_24CCBBD00();
  sub_24CC90408((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  uint64_t v23 = sub_24CCBBCA0();
  sub_24CC91434(v23);
  swift_bridgeObjectRelease();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  sub_24CC7B4A8((uint64_t)sub_24CC968E0);
  sub_24CCBBCB0();
  swift_release_n();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  sub_24CC7B4A8((uint64_t)sub_24CC968E8);
  sub_24CCBBCC0();
  swift_release_n();
  if (qword_269821A78 != -1) {
    swift_once();
  }
  id v24 = *((id *)off_269822610 + 2);
  sub_24CCBBCF0();

  uint64_t result = swift_release();
  *a1 = v11;
  return result;
}

uint64_t sub_24CC8DF30(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CC90408(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_24CC8DF90(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CC91434(a1);
    return swift_release();
  }
  return result;
}

void sub_24CC8DFF0()
{
  uint64_t v1 = v0;
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_2698247C8);
  uint64_t v3 = sub_24CCBB870();
  os_log_type_t v4 = sub_24CCBC060();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)os_log_type_t v5 = 136315138;
    uint64_t v7 = sub_24CCBC5E0();
    sub_24CC692DC(v7, v8, &v11);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v3, v4, "[%s] Stop browsing for nearby devices", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v6, -1, -1);
    MEMORY[0x2533103A0](v5, -1, -1);
  }

  uint64_t v9 = (os_unfair_lock_s *)(v1 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state);
  os_unfair_lock_lock(v9);
  uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269822698) + 28);
  if (*(void *)((char *)&v9->_os_unfair_lock_opaque + v10))
  {
    sub_24CC7B4A8(0);
    sub_24CCBBCB0();
    sub_24CC7B4A8(0);
    sub_24CCBBCC0();
    sub_24CCBBD30();
    swift_release();
  }
  *(void *)((char *)&v9->_os_unfair_lock_opaque + v10) = 0;
  os_unfair_lock_unlock(v9);
}

uint64_t sub_24CC8E20C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v35 = type metadata accessor for NearbyDeviceProvider.State(0);
  MEMORY[0x270FA5388](v35);
  unint64_t v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24CCBB890();
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2698247C8);
  swift_unknownObjectRetain_n();
  uint64_t v11 = sub_24CCBB870();
  os_log_type_t v12 = sub_24CCBC060();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v36 = a2;
  v34[1] = v6;
  if (v13)
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v34[0] = v10;
    uint64_t v16 = v15;
    uint64_t v38 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v17 = sub_24CCBC5E0();
    v37[0] = sub_24CC692DC(v17, v18, &v38);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v37[0] = a1;
    v37[1] = a2;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822700);
    uint64_t v19 = sub_24CCBBE70();
    v37[0] = sub_24CC692DC(v19, v20, &v38);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_24CC60000, v11, v12, "[%s] Add observer %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v16, -1, -1);
    MEMORY[0x2533103A0](v14, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  if (sub_24CCBB590())
  {
    uint64_t v21 = (os_unfair_lock_s *)((char *)v3 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state);
    os_unfair_lock_lock((os_unfair_lock_t)((char *)v3 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state));
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822698);
    sub_24CC8D4FC((uint32_t *)((char *)&v21->_os_unfair_lock_opaque + *(int *)(v22 + 28)), (BOOL *)v37);
    os_unfair_lock_unlock(v21);
    int v23 = LOBYTE(v37[0]);
  }
  else
  {
    int v23 = 1;
  }
  uint64_t ObjectType = swift_getObjectType();
  sub_24CCBB5B0();
  if (v23) {
    sub_24CC8D988();
  }
  uint64_t v25 = (os_unfair_lock_s *)((char *)v3 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state);
  os_unfair_lock_lock((os_unfair_lock_t)((char *)v3 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state));
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822698);
  sub_24CC96838((uint64_t)v25 + *(int *)(v26 + 28), (uint64_t)v8, type metadata accessor for NearbyDeviceProvider.State);
  os_unfair_lock_unlock(v25);
  uint64_t v27 = sub_24CCBB870();
  os_log_type_t v28 = sub_24CCBC060();
  if (os_log_type_enabled(v27, v28))
  {
    v34[0] = v8;
    char v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v37[0] = v30;
    *(_DWORD *)char v29 = 136315138;
    uint64_t v31 = sub_24CCBC5E0();
    uint64_t v38 = sub_24CC692DC(v31, v32, v37);
    sub_24CCBC120();
    unint64_t v8 = (char *)v34[0];
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v27, v28, "[%s] Deliverying current state to observer", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v30, -1, -1);
    MEMORY[0x2533103A0](v29, -1, -1);
  }

  (*(void (**)(void *, _UNKNOWN **, char *, uint64_t))(v36 + 8))(v3, &off_26FF2B790, &v8[*(int *)(v35 + 24)], ObjectType);
  return sub_24CC957B8((uint64_t)v8, type metadata accessor for NearbyDeviceProvider.State);
}

void sub_24CC8E6C4()
{
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247C8);
  swift_unknownObjectRetain_n();
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v9 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v9);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822700);
    uint64_t v7 = sub_24CCBBE70();
    sub_24CC692DC(v7, v8, &v9);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] Remove observer %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  sub_24CCBB5C0();
  if ((sub_24CCBB590() & 1) == 0) {
    sub_24CC8DFF0();
  }
}

uint64_t sub_24CC8E920()
{
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247C8);
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v9 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v9);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] Notifying observers", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }

  MEMORY[0x270FA5388](v7);
  return sub_24CCBB5D0();
}

uint64_t sub_24CC8EB20(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  swift_unknownObjectRetain();
  swift_getObjectType();
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6) {
    a2(v6, v5);
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_24CC8EB9C(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v3[8] = *v2;
  uint64_t v4 = type metadata accessor for NearbyDevice(0);
  v3[9] = v4;
  v3[10] = *(void *)(v4 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC8EC98, 0, 0);
}

uint64_t sub_24CC8EC98()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = v1[7];
  uint64_t v3 = v1[8];
  __swift_project_boxed_opaque_existential_1(v1 + 4, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 32) + **(int **)(v3 + 32));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CC8ED9C;
  return v6(v2, v3);
}

uint64_t sub_24CC8ED9C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 112) = a1;
    return MEMORY[0x270FA2498](sub_24CC8EEF0, 0, 0);
  }
}

uint64_t sub_24CC8EEF0()
{
  os_log_t v54 = v0;
  uint64_t v1 = (void *)sub_24CC8F5C8(v0[14]);
  swift_bridgeObjectRelease();
  if (!v1)
  {
    if (qword_269821A90 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24CCBB890();
    __swift_project_value_buffer(v10, (uint64_t)qword_2698247C8);
    uint64_t v11 = sub_24CCBB870();
    os_log_type_t v12 = sub_24CCBC040();
    if (os_log_type_enabled(v11, v12))
    {
      BOOL v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v53[0] = v14;
      *(_DWORD *)BOOL v13 = 136315138;
      uint64_t v15 = sub_24CCBC5E0();
      v0[2] = sub_24CC692DC(v15, v16, v53);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v11, v12, "[%s] Trusted device is not paired", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v14, -1, -1);
      MEMORY[0x2533103A0](v13, -1, -1);
    }

    sub_24CC967E4();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(void))v0[1];
    goto LABEL_33;
  }
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_2698247C8);
  id v3 = v1;
  uint64_t v4 = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC060();
  id v52 = v3;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v48 = (void *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    v53[0] = v50;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v7 = sub_24CCBC5E0();
    v0[3] = sub_24CC692DC(v7, v8, v53);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2112;
    v0[4] = v3;
    id v9 = v3;
    sub_24CCBC120();
    *uint64_t v48 = v1;

    id v3 = v52;
    _os_log_impl(&dword_24CC60000, v4, v5, "[%s] Trusted device is paired: %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v48, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v50, -1, -1);
    MEMORY[0x2533103A0](v6, -1, -1);
  }
  else
  {
  }
  uint64_t v18 = v0[6];
  uint64_t v19 = *(void *)(v18 + 16);
  if (!v19) {
    goto LABEL_31;
  }
  uint64_t v49 = v0[11];
  uint64_t v51 = v0[12];
  uint64_t v20 = v0[10];
  uint64_t v21 = v18 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  uint64_t v22 = *(void *)(v20 + 72);
  swift_bridgeObjectRetain();
  do
  {
    id v24 = (uint64_t *)v0[12];
    sub_24CC96838(v21, (uint64_t)v24, type metadata accessor for NearbyDevice);
    uint64_t v25 = *v24;
    uint64_t v26 = *(void *)(v51 + 8);
    swift_bridgeObjectRetain();
    id v27 = objc_msgSend(v3, sel_name);
    uint64_t v28 = sub_24CCBBE50();
    uint64_t v30 = v29;

    if (!v26)
    {
      uint64_t v36 = v0[11];
      uint64_t v35 = v0[12];
      swift_bridgeObjectRelease();
      sub_24CC96838(v35, v36, type metadata accessor for NearbyDevice);
LABEL_24:
      sub_24CC957B8(v0[11], type metadata accessor for NearbyDevice);
      id v3 = v52;
      goto LABEL_15;
    }
    uint64_t v32 = v0[11];
    uint64_t v31 = v0[12];
    if (v25 == v28 && v26 == v30)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24CC96838(v31, v32, type metadata accessor for NearbyDevice);
    }
    else
    {
      char v34 = sub_24CCBC480();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24CC96838(v31, v32, type metadata accessor for NearbyDevice);
      if ((v34 & 1) == 0) {
        goto LABEL_24;
      }
    }
    uint64_t v38 = *(void *)(v49 + 16);
    uint64_t v37 = *(void *)(v49 + 24);
    id v3 = v52;
    id v39 = objc_msgSend(v52, sel_uniqueIdentifier, v49);
    uint64_t v40 = sub_24CCBBE50();
    uint64_t v42 = v41;

    uint64_t v43 = v0[11];
    if (v38 == v40 && v37 == v42)
    {
      swift_bridgeObjectRelease();
      sub_24CC957B8(v43, type metadata accessor for NearbyDevice);
LABEL_29:
      uint64_t v44 = v0[12];
      uint64_t v45 = v0[5];
      swift_bridgeObjectRelease();
      sub_24CC965F8(v44, v45, type metadata accessor for NearbyDevice);
      uint64_t v46 = 0;
      goto LABEL_32;
    }
    char v23 = sub_24CCBC480();
    swift_bridgeObjectRelease();
    sub_24CC957B8(v43, type metadata accessor for NearbyDevice);
    if (v23) {
      goto LABEL_29;
    }
LABEL_15:
    sub_24CC957B8(v0[12], type metadata accessor for NearbyDevice);
    v21 += v22;
    --v19;
  }
  while (v19);
  swift_bridgeObjectRelease();
LABEL_31:
  uint64_t v46 = 1;
LABEL_32:
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[10] + 56))(v0[5], v46, 1, v0[9]);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
LABEL_33:
  return v17();
}

uint64_t sub_24CC8F5C8(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_24CCBC1A0();
    uint64_t v5 = v4;
    uint64_t v6 = sub_24CCBC240();
    char v8 = MEMORY[0x25330F7F0](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_24CC6B048(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_24CC6ADC4(v3, v5, v2 != 0, a1);
    uint64_t v9 = v13;
    sub_24CC6B048(v3, v5, v2 != 0);
    return v9;
  }
  uint64_t result = sub_24CC6B0AC(a1);
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

uint64_t sub_24CC8F6D8(uint64_t a1, uint64_t a2)
{
  _OWORD v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_24CCBBC00();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  uint64_t v5 = sub_24CCBB520();
  v3[8] = v5;
  v3[9] = *(void *)(v5 - 8);
  v3[10] = swift_task_alloc();
  uint64_t v6 = sub_24CCBB8F0();
  v3[11] = v6;
  v3[12] = *(void *)(v6 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  uint64_t v7 = sub_24CCBBD20();
  v3[15] = v7;
  v3[16] = *(void *)(v7 - 8);
  v3[17] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for NearbyDevice(0);
  v3[18] = v8;
  v3[19] = *(void *)(v8 - 8);
  v3[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  v3[21] = swift_task_alloc();
  uint64_t v9 = sub_24CCBBCE0();
  v3[22] = v9;
  v3[23] = *(void *)(v9 - 8);
  v3[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC8F9A8, 0, 0);
}

uint64_t sub_24CC8F9A8()
{
  uint64_t v2 = v0[23];
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[22];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, v0[3], v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x263F14390])
  {
    uint64_t v5 = v0[24];
    uint64_t v7 = v0[6];
    uint64_t v6 = v0[7];
    uint64_t v8 = v0[5];
    uint64_t v9 = (uint64_t *)v0[2];
    (*(void (**)(uint64_t, void))(v0[23] + 96))(v5, v0[22]);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
    v10(v6, v5, v8);
    sub_24CC93520(&qword_269822030, MEMORY[0x263F14320]);
    uint64_t v11 = swift_allocError();
    v10(v12, v6, v8);
    *uint64_t v9 = v11;
    uint64_t v13 = type metadata accessor for NearbyDeviceProviderState(0);
LABEL_7:
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
LABEL_8:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
LABEL_9:
    return v15();
  }
  int v14 = v4;
  if (v4 == *MEMORY[0x263F14398])
  {
    (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[22]);
LABEL_6:
    uint64_t v9 = (uint64_t *)v0[2];
    uint64_t v13 = type metadata accessor for NearbyDeviceProviderState(0);
    goto LABEL_7;
  }
  if (v4 == *MEMORY[0x263F14388]) {
    goto LABEL_6;
  }
  if (v4 != *MEMORY[0x263F14380])
  {
    int v46 = *MEMORY[0x263F143A0];
    uint64_t v47 = type metadata accessor for NearbyDeviceProviderState(0);
    if (v14 == v46)
    {
      uint64_t v48 = v0[2];
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v48, 0, 1, v47);
    }
    else
    {
      uint64_t v50 = v0[23];
      uint64_t v49 = v0[24];
      uint64_t v51 = v0[22];
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v0[2], 1, 1, v47);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
    }
    goto LABEL_8;
  }
  uint64_t v17 = (os_unfair_lock_s *)(v0[4] + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state);
  os_unfair_lock_lock(v17);
  uint64_t v18 = *(void *)((char *)&v17->_os_unfair_lock_opaque
                  + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269822698) + 28));
  v0[25] = v18;
  swift_retain();
  os_unfair_lock_unlock(v17);
  if (!v18)
  {
    sub_24CC96728();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    goto LABEL_9;
  }
  uint64_t v19 = sub_24CCBBCA0();
  size_t v20 = sub_24CC92A68(v19);
  swift_bridgeObjectRelease();
  int64_t v21 = *(void *)(v20 + 16);
  if (v21)
  {
    uint64_t v59 = v0[19];
    uint64_t v60 = (void *)v0[20];
    uint64_t v22 = v0[16];
    uint64_t v23 = v0[12];
    uint64_t v24 = v0[9];
    uint64_t v63 = MEMORY[0x263F8EE78];
    sub_24CC6A73C(0, v21, 0);
    uint64_t v25 = *(void (**)(void, size_t, void))(v22 + 16);
    v22 += 16;
    size_t v26 = v20 + ((*(unsigned __int8 *)(v22 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 64));
    uint64_t v57 = *(void *)(v22 + 56);
    v58 = v25;
    os_log_t v54 = (void (**)(uint64_t, uint64_t))(v24 + 8);
    uint64_t v55 = (void (**)(uint64_t, uint64_t))(v22 - 8);
    uint64_t v56 = (void (**)(uint64_t, uint64_t))(v23 + 8);
    do
    {
      uint64_t v27 = v0[14];
      uint64_t v28 = v0[13];
      uint64_t v29 = v0[11];
      v58(v0[17], v26, v0[15]);
      sub_24CCBBD10();
      uint64_t v30 = sub_24CCBB8B0();
      uint64_t v61 = v31;
      uint64_t v62 = v30;
      uint64_t v32 = *v56;
      (*v56)(v27, v29);
      sub_24CCBBD10();
      uint64_t v33 = sub_24CCBB8E0();
      uint64_t v35 = v34;
      v32(v28, v29);
      if (!v35)
      {
        uint64_t v36 = v0[10];
        uint64_t v37 = v0[8];
        sub_24CCBB510();
        uint64_t v33 = sub_24CCBB4F0();
        uint64_t v35 = v38;
        (*v54)(v36, v37);
      }
      id v39 = (uint64_t *)v0[20];
      uint64_t v40 = v0[17];
      uint64_t v41 = v0[15];
      sub_24CCBBD10();
      *id v39 = v62;
      v60[1] = v61;
      v60[2] = v33;
      v60[3] = v35;
      (*v55)(v40, v41);
      uint64_t v42 = v63;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24CC6A73C(0, *(void *)(v63 + 16) + 1, 1);
        uint64_t v42 = v63;
      }
      unint64_t v44 = *(void *)(v42 + 16);
      unint64_t v43 = *(void *)(v42 + 24);
      if (v44 >= v43 >> 1)
      {
        sub_24CC6A73C(v43 > 1, v44 + 1, 1);
        uint64_t v42 = v63;
      }
      uint64_t v45 = v0[20];
      *(void *)(v42 + 16) = v44 + 1;
      sub_24CC965F8(v45, v42+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(void *)(v59 + 72) * v44, type metadata accessor for NearbyDevice);
      v26 += v57;
      --v21;
    }
    while (v21);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v42 = MEMORY[0x263F8EE78];
  }
  v0[26] = v42;
  id v52 = (void *)swift_task_alloc();
  v0[27] = v52;
  void *v52 = v0;
  v52[1] = sub_24CC900D0;
  uint64_t v53 = v0[21];
  return sub_24CC8EB9C(v53, v42);
}

uint64_t sub_24CC900D0()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_24CC90338;
  }
  else {
    uint64_t v2 = sub_24CC90200;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CC90200()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[2];
  swift_release();
  sub_24CC9677C(v1, v2);
  uint64_t v3 = type metadata accessor for NearbyDeviceProviderState(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 0, 1, v3);
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

uint64_t sub_24CC90338()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CC90408(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v40 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CCBBCE0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v35 - v12;
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24CCBB890();
  __swift_project_value_buffer(v14, (uint64_t)qword_2698247C8);
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v42(v13, a1, v7);
  uint64_t v15 = sub_24CCBB870();
  os_log_type_t v16 = sub_24CCBC060();
  int v39 = v16;
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v41 = v4;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v2;
    uint64_t v19 = v18;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v44 = v35;
    *(_DWORD *)uint64_t v19 = 136315394;
    uint64_t v36 = a1;
    uint64_t v20 = sub_24CCBC5E0();
    uint64_t v43 = sub_24CC692DC(v20, v21, &v44);
    uint64_t v37 = v9;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    v42(v11, (uint64_t)v13, v7);
    uint64_t v22 = sub_24CCBBE70();
    uint64_t v43 = sub_24CC692DC(v22, v23, &v44);
    uint64_t v9 = v37;
    sub_24CCBC120();
    a1 = v36;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    _os_log_impl(&dword_24CC60000, v15, (os_log_type_t)v39, "[%s] Handle browser state update: %s", (uint8_t *)v19, 0x16u);
    uint64_t v24 = v35;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v24, -1, -1);
    uint64_t v25 = v19;
    uint64_t v2 = v38;
    MEMORY[0x2533103A0](v25, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }

  uint64_t v26 = sub_24CCBBFA0();
  uint64_t v27 = (uint64_t)v40;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v40, 1, 1, v26);
  v42(v11, a1, v7);
  uint64_t v28 = qword_269821A78;
  swift_retain();
  uint64_t v29 = v11;
  if (v28 != -1) {
    swift_once();
  }
  uint64_t v30 = off_269822610;
  uint64_t v31 = sub_24CC93520(&qword_2698226B0, (void (*)(uint64_t))type metadata accessor for NearbyDeviceActor);
  unint64_t v32 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v33 = (char *)swift_allocObject();
  *((void *)v33 + 2) = v30;
  *((void *)v33 + 3) = v31;
  *((void *)v33 + 4) = v2;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v33[v32], v29, v7);
  *(void *)&v33[(v9 + v32 + 7) & 0xFFFFFFFFFFFFFFF8] = v41;
  swift_retain();
  sub_24CC88D24(v27, (uint64_t)&unk_2698226E0, (uint64_t)v33);
  return swift_release();
}

uint64_t sub_24CC908E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a4;
  v6[5] = a6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698226E8);
  uint64_t v8 = swift_task_alloc();
  v6[6] = v8;
  uint64_t v9 = type metadata accessor for NearbyDeviceProviderState(0);
  v6[7] = v9;
  v6[8] = *(void *)(v9 - 8);
  v6[9] = swift_task_alloc();
  v6[10] = swift_task_alloc();
  if (qword_269821A78 != -1) {
    swift_once();
  }
  v6[11] = off_269822610;
  swift_retain();
  uint64_t v10 = (void *)swift_task_alloc();
  v6[12] = v10;
  void *v10 = v6;
  v10[1] = sub_24CC90A78;
  return sub_24CC8F6D8(v8, a5);
}

uint64_t sub_24CC90A78()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  type metadata accessor for NearbyDeviceActor();
  sub_24CC93520(&qword_2698226B0, (void (*)(uint64_t))type metadata accessor for NearbyDeviceActor);
  uint64_t v3 = sub_24CCBBF40();
  if (v0) {
    uint64_t v4 = sub_24CC90DEC;
  }
  else {
    uint64_t v4 = sub_24CC90BFC;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

void sub_24CC90BFC()
{
  uint64_t v15 = v0;
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[6];
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24CC744B8(v0[6], &qword_2698226E8);
  }
  else
  {
    uint64_t v4 = v0[13];
    uint64_t v5 = v0[9];
    uint64_t v6 = v0[10];
    uint64_t v7 = v0[4];
    sub_24CC965F8(v0[6], v6, type metadata accessor for NearbyDeviceProviderState);
    sub_24CC96838(v6, v5, type metadata accessor for NearbyDeviceProviderState);
    uint64_t v8 = (os_unfair_lock_s *)(v7 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state);
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state));
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822698);
    sub_24CC91098((uint64_t)v8 + *(int *)(v9 + 28), v5, v14);
    os_unfair_lock_unlock(v8);
    if (v4) {
      return;
    }
    sub_24CC957B8(v0[9], type metadata accessor for NearbyDeviceProviderState);
    if (v14[0])
    {
      uint64_t v10 = v0[10];
      uint64_t v11 = v0[4];
      uint64_t v12 = swift_task_alloc();
      *(void *)(v12 + 16) = v11;
      *(void *)(v12 + 24) = v10;
      sub_24CC8E920();
      swift_task_dealloc();
    }
    sub_24CC957B8(v0[10], type metadata accessor for NearbyDeviceProviderState);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (void (*)(void))v0[1];
  v13();
}

uint64_t sub_24CC90DEC()
{
  uint64_t v19 = v0;
  swift_release();
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_2698247C8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC040();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[13];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v11;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v12 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v12, v13, &v18);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v14 = v8;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v15;
    sub_24CCBC120();
    void *v10 = v15;

    _os_log_impl(&dword_24CC60000, v5, v6, "[%s] Error while handling browser state update: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v11, -1, -1);
    MEMORY[0x2533103A0](v9, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

void sub_24CC91098(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v7 = type metadata accessor for NearbyDeviceProviderState(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a1 + *(int *)(type metadata accessor for NearbyDeviceProvider.State(0) + 24);
  sub_24CC96838(v10, (uint64_t)v9, type metadata accessor for NearbyDeviceProviderState);
  char v11 = _s13DeviceSharing06NearbyA13ProviderStateO2eeoiySbAC_ACtFZ_0(a2, (uint64_t)v9);
  sub_24CC957B8((uint64_t)v9, type metadata accessor for NearbyDeviceProviderState);
  if (v11)
  {
    if (qword_269821A90 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_24CCBB890();
    __swift_project_value_buffer(v12, (uint64_t)qword_2698247C8);
    unint64_t v13 = sub_24CCBB870();
    os_log_type_t v14 = sub_24CCBC060();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v34 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v17 = sub_24CCBC5E0();
      uint64_t v33 = sub_24CC692DC(v17, v18, &v34);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v13, v14, "[%s] Browser state unchanged", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v16, -1, -1);
      MEMORY[0x2533103A0](v15, -1, -1);
    }

    char v19 = 0;
  }
  else
  {
    if (qword_269821A90 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24CCBB890();
    __swift_project_value_buffer(v20, (uint64_t)qword_2698247C8);
    unint64_t v21 = sub_24CCBB870();
    os_log_type_t v22 = sub_24CCBC060();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v31 = a3;
      uint64_t v24 = (uint8_t *)v23;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v32 = v3;
      uint64_t v26 = v25;
      uint64_t v34 = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v27 = sub_24CCBC5E0();
      uint64_t v33 = sub_24CC692DC(v27, v28, &v34);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v21, v22, "[%s] Browser state changed", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v26, -1, -1);
      uint64_t v29 = v24;
      a3 = v31;
      MEMORY[0x2533103A0](v29, -1, -1);
    }

    sub_24CC966C4(a2, v10);
    char v19 = 1;
  }
  *a3 = v19;
}

uint64_t sub_24CC91434(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24CCBB890();
  __swift_project_value_buffer(v8, (uint64_t)qword_2698247C8);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_24CCBB870();
  os_log_type_t v10 = sub_24CCBC060();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v24 = v4;
  if (v11)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v26 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v14 = sub_24CCBC5E0();
    uint64_t v25 = sub_24CC692DC(v14, v15, &v26);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2048;
    uint64_t v16 = *(void *)(a1 + 16);
    swift_bridgeObjectRelease();
    uint64_t v25 = v16;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v9, v10, "[%s] Handle browser results: count %ld", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v13, -1, -1);
    MEMORY[0x2533103A0](v12, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v17 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 1, 1, v17);
  uint64_t v18 = qword_269821A78;
  swift_bridgeObjectRetain();
  swift_retain();
  if (v18 != -1) {
    swift_once();
  }
  char v19 = off_269822610;
  uint64_t v20 = sub_24CC93520(&qword_2698226B0, (void (*)(uint64_t))type metadata accessor for NearbyDeviceActor);
  unint64_t v21 = (void *)swift_allocObject();
  v21[2] = v19;
  v21[3] = v20;
  v21[4] = a1;
  v21[5] = v2;
  v21[6] = v24;
  swift_retain();
  sub_24CC88D24((uint64_t)v7, (uint64_t)&unk_2698226C0, (uint64_t)v21);
  return swift_release();
}

uint64_t sub_24CC91798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = sub_24CCBB520();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  uint64_t v8 = sub_24CCBB8F0();
  v6[10] = v8;
  v6[11] = *(void *)(v8 - 8);
  v6[12] = swift_task_alloc();
  v6[13] = swift_task_alloc();
  uint64_t v9 = sub_24CCBBD20();
  v6[14] = v9;
  v6[15] = *(void *)(v9 - 8);
  v6[16] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for NearbyDevice(0);
  v6[17] = v10;
  v6[18] = *(void *)(v10 - 8);
  v6[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  if (qword_269821A78 != -1) {
    swift_once();
  }
  v6[22] = off_269822610;
  type metadata accessor for NearbyDeviceActor();
  sub_24CC93520(&qword_2698226B0, (void (*)(uint64_t))type metadata accessor for NearbyDeviceActor);
  swift_retain();
  uint64_t v12 = sub_24CCBBF40();
  v6[23] = v12;
  v6[24] = v11;
  return MEMORY[0x270FA2498](sub_24CC91A64, v12, v11);
}

uint64_t sub_24CC91A64()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  size_t v2 = sub_24CC92A68(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v36 = v0[18];
    uint64_t v37 = (void *)v0[19];
    uint64_t v4 = v0[15];
    uint64_t v5 = v0[11];
    uint64_t v6 = v0[8];
    uint64_t v40 = MEMORY[0x263F8EE78];
    sub_24CC6A73C(0, v3, 0);
    uint64_t v7 = *(void (**)(void, size_t, void))(v4 + 16);
    v4 += 16;
    size_t v8 = v2 + ((*(unsigned __int8 *)(v4 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 64));
    uint64_t v34 = *(void *)(v4 + 56);
    uint64_t v35 = v7;
    uint64_t v31 = (void (**)(uint64_t, uint64_t))(v6 + 8);
    uint64_t v32 = (void (**)(uint64_t, uint64_t))(v4 - 8);
    uint64_t v33 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    do
    {
      uint64_t v9 = v0[13];
      uint64_t v10 = v0[12];
      uint64_t v11 = v0[10];
      v35(v0[16], v8, v0[14]);
      sub_24CCBBD10();
      uint64_t v12 = sub_24CCBB8B0();
      uint64_t v38 = v13;
      uint64_t v39 = v12;
      uint64_t v14 = *v33;
      (*v33)(v9, v11);
      sub_24CCBBD10();
      uint64_t v15 = sub_24CCBB8E0();
      uint64_t v17 = v16;
      v14(v10, v11);
      if (!v17)
      {
        uint64_t v18 = v0[9];
        uint64_t v19 = v0[7];
        sub_24CCBB510();
        uint64_t v15 = sub_24CCBB4F0();
        uint64_t v17 = v20;
        (*v31)(v18, v19);
      }
      unint64_t v21 = (uint64_t *)v0[19];
      uint64_t v22 = v0[16];
      uint64_t v23 = v0[14];
      sub_24CCBBD10();
      *unint64_t v21 = v39;
      v37[1] = v38;
      v37[2] = v15;
      uint64_t v37[3] = v17;
      (*v32)(v22, v23);
      uint64_t v24 = v40;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24CC6A73C(0, *(void *)(v40 + 16) + 1, 1);
        uint64_t v24 = v40;
      }
      unint64_t v26 = *(void *)(v24 + 16);
      unint64_t v25 = *(void *)(v24 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_24CC6A73C(v25 > 1, v26 + 1, 1);
        uint64_t v24 = v40;
      }
      uint64_t v27 = v0[19];
      *(void *)(v24 + 16) = v26 + 1;
      sub_24CC965F8(v27, v24+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(void *)(v36 + 72) * v26, type metadata accessor for NearbyDevice);
      v8 += v34;
      --v3;
    }
    while (v3);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v24 = MEMORY[0x263F8EE78];
  }
  v0[25] = v24;
  unint64_t v28 = (void *)swift_task_alloc();
  v0[26] = v28;
  *unint64_t v28 = v0;
  v28[1] = sub_24CC91D9C;
  uint64_t v29 = v0[21];
  return sub_24CC8EB9C(v29, v24);
}

uint64_t sub_24CC91D9C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 216) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 192);
  uint64_t v4 = *(void *)(v2 + 184);
  if (v0) {
    uint64_t v5 = sub_24CC92094;
  }
  else {
    uint64_t v5 = sub_24CC91EF0;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

void sub_24CC91EF0()
{
  uint64_t v13 = v0;
  uint64_t v1 = v0[27];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[20];
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  swift_release();
  sub_24CC74734(v2, v3, &qword_269822640);
  uint64_t v6 = (os_unfair_lock_s *)(v5 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state);
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822698);
  sub_24CC9236C((uint64_t)v6 + *(int *)(v7 + 28), v3, v4, v12);
  os_unfair_lock_unlock(v6);
  if (!v1)
  {
    sub_24CC744B8(v0[20], &qword_269822640);
    if (v12[0])
    {
      uint64_t v8 = v0[21];
      uint64_t v9 = v0[5];
      uint64_t v10 = swift_task_alloc();
      *(void *)(v10 + 16) = v9;
      *(void *)(v10 + 24) = v8;
      sub_24CC8E920();
      swift_task_dealloc();
    }
    sub_24CC744B8(v0[21], &qword_269822640);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (void (*)(void))v0[1];
    v11();
  }
}

uint64_t sub_24CC92094()
{
  uint64_t v19 = v0;
  swift_release();
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[27];
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_2698247C8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC040();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[27];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v11;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v12 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v12, v13, &v18);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v14 = v8;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v15;
    sub_24CCBC120();
    void *v10 = v15;

    _os_log_impl(&dword_24CC60000, v5, v6, "[%s] Error while handling browser results: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v11, -1, -1);
    MEMORY[0x2533103A0](v9, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

void sub_24CC9236C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v43 = a4;
  v41[1] = a3;
  uint64_t v6 = type metadata accessor for NearbyDevice(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v41[0] = (uint64_t)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698226C8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v41 - v17;
  uint64_t v19 = a1 + *(int *)(type metadata accessor for NearbyDeviceProvider.State(0) + 20);
  sub_24CC74734(v19, (uint64_t)v18, &qword_269822640);
  uint64_t v20 = (uint64_t)&v12[*(int *)(v10 + 56)];
  uint64_t v42 = a2;
  sub_24CC74734(a2, (uint64_t)v12, &qword_269822640);
  sub_24CC74734((uint64_t)v18, v20, &qword_269822640);
  unint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (v21((uint64_t)v12, 1, v6) == 1)
  {
    sub_24CC744B8((uint64_t)v18, &qword_269822640);
    if (v21(v20, 1, v6) == 1) {
      goto LABEL_19;
    }
    goto LABEL_6;
  }
  sub_24CC74734((uint64_t)v12, (uint64_t)v16, &qword_269822640);
  if (v21(v20, 1, v6) == 1)
  {
    sub_24CC744B8((uint64_t)v18, &qword_269822640);
    sub_24CC957B8((uint64_t)v16, type metadata accessor for NearbyDevice);
LABEL_6:
    sub_24CC744B8((uint64_t)v12, &qword_2698226C8);
    goto LABEL_7;
  }
  uint64_t v31 = v41[0];
  sub_24CC965F8(v20, v41[0], type metadata accessor for NearbyDevice);
  if (*((void *)v16 + 2) == *(void *)(v31 + 16) && *((void *)v16 + 3) == *(void *)(v31 + 24))
  {
    sub_24CC957B8(v31, type metadata accessor for NearbyDevice);
    sub_24CC744B8((uint64_t)v18, &qword_269822640);
    sub_24CC957B8((uint64_t)v16, type metadata accessor for NearbyDevice);
LABEL_19:
    sub_24CC744B8((uint64_t)v12, &qword_269822640);
LABEL_20:
    if (qword_269821A90 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_24CCBB890();
    __swift_project_value_buffer(v34, (uint64_t)qword_2698247C8);
    uint64_t v35 = sub_24CCBB870();
    os_log_type_t v36 = sub_24CCBC060();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v45 = v38;
      *(_DWORD *)uint64_t v37 = 136315138;
      uint64_t v39 = sub_24CCBC5E0();
      uint64_t v44 = sub_24CC692DC(v39, v40, &v45);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v35, v36, "[%s] Trusted device unchanged", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v38, -1, -1);
      MEMORY[0x2533103A0](v37, -1, -1);
    }

    char v30 = 0;
    uint64_t v29 = v43;
    goto LABEL_25;
  }
  char v33 = sub_24CCBC480();
  sub_24CC957B8(v31, type metadata accessor for NearbyDevice);
  sub_24CC744B8((uint64_t)v18, &qword_269822640);
  sub_24CC957B8((uint64_t)v16, type metadata accessor for NearbyDevice);
  sub_24CC744B8((uint64_t)v12, &qword_269822640);
  if (v33) {
    goto LABEL_20;
  }
LABEL_7:
  if (qword_269821A90 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_24CCBB890();
  __swift_project_value_buffer(v22, (uint64_t)qword_2698247C8);
  uint64_t v23 = sub_24CCBB870();
  os_log_type_t v24 = sub_24CCBC060();
  if (os_log_type_enabled(v23, v24))
  {
    unint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v45 = v26;
    *(_DWORD *)unint64_t v25 = 136315138;
    uint64_t v27 = sub_24CCBC5E0();
    uint64_t v44 = sub_24CC692DC(v27, v28, &v45);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v23, v24, "[%s] Trusted device changed", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v26, -1, -1);
    MEMORY[0x2533103A0](v25, -1, -1);
  }

  uint64_t v29 = v43;
  sub_24CC96384(v42, v19);
  char v30 = 1;
LABEL_25:
  *uint64_t v29 = v30;
}

uint64_t sub_24CC92994()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  uint64_t v1 = v0 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_observers;
  uint64_t v2 = sub_24CCBB610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24CC744B8(v0 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state, &qword_269822698);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

size_t sub_24CC92A68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698226D0);
  uint64_t v3 = *(void *)(sub_24CCBBD20() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_24CC92BBC(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_24CC6B0A4();
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

uint64_t sub_24CC92BBC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_24CCBBD20();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 56);
  uint64_t v15 = a4 + 56;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 24);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 24);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  uint64_t v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    unint64_t v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v42, *(void *)(v43 + 48) + v29 * v24, v8);
    char v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v8);
    a3 = v40;
    if (v21 == v40) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    a3 = v21;
LABEL_37:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t _s13DeviceSharing06NearbyA13ProviderStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NearbyDevice(0);
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v36 = (uint64_t)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698226C8);
  MEMORY[0x270FA5388](v6);
  uint64_t v41 = (uint64_t)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v37 = (uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v36 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v38 = (uint64_t)&v36 - v14;
  uint64_t v15 = type metadata accessor for NearbyDeviceProviderState(0);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (id *)((char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v16);
  int64_t v20 = (char *)&v36 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(qword_269822720);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  unint64_t v24 = (char *)&v36 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v25 = (id *)&v24[*(int *)(v22 + 56)];
  sub_24CC96838(a1, (uint64_t)v24, type metadata accessor for NearbyDeviceProviderState);
  sub_24CC96838(a2, (uint64_t)v25, type metadata accessor for NearbyDeviceProviderState);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24CC96838((uint64_t)v24, (uint64_t)v18, type metadata accessor for NearbyDeviceProviderState);

      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_9;
      }

      goto LABEL_7;
    case 2u:
      if (swift_getEnumCaseMultiPayload() == 2) {
        goto LABEL_7;
      }
      goto LABEL_9;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_9;
      }
LABEL_7:
      sub_24CC957B8((uint64_t)v24, type metadata accessor for NearbyDeviceProviderState);
      char v26 = 1;
      break;
    default:
      sub_24CC96838((uint64_t)v24, (uint64_t)v20, type metadata accessor for NearbyDeviceProviderState);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_24CC744B8((uint64_t)v20, &qword_269822640);
LABEL_9:
        sub_24CC744B8((uint64_t)v24, qword_269822720);
        char v26 = 0;
      }
      else
      {
        uint64_t v28 = v38;
        sub_24CC9677C((uint64_t)v20, v38);
        sub_24CC9677C((uint64_t)v25, (uint64_t)v13);
        uint64_t v29 = v41;
        uint64_t v30 = v41 + *(int *)(v6 + 48);
        uint64_t v31 = &qword_269822640;
        sub_24CC74734(v28, v41, &qword_269822640);
        sub_24CC74734((uint64_t)v13, v30, &qword_269822640);
        uint64_t v32 = v40;
        int64_t v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
        if (v33(v29, 1, v40) == 1)
        {
          sub_24CC744B8((uint64_t)v13, &qword_269822640);
          sub_24CC744B8(v28, &qword_269822640);
          if (v33(v30, 1, v32) == 1)
          {
            char v26 = -1;
          }
          else
          {
            uint64_t v31 = &qword_2698226C8;
            char v26 = 0;
          }
        }
        else
        {
          uint64_t v34 = v37;
          sub_24CC74734(v29, v37, &qword_269822640);
          if (v33(v30, 1, v32) == 1)
          {
            sub_24CC744B8((uint64_t)v13, &qword_269822640);
            sub_24CC744B8(v28, &qword_269822640);
            sub_24CC957B8(v34, type metadata accessor for NearbyDevice);
            char v26 = 0;
            uint64_t v31 = &qword_2698226C8;
          }
          else
          {
            uint64_t v35 = v36;
            sub_24CC965F8(v30, v36, type metadata accessor for NearbyDevice);
            if (*(void *)(v34 + 16) == *(void *)(v35 + 16) && *(void *)(v34 + 24) == *(void *)(v35 + 24)) {
              char v26 = 1;
            }
            else {
              char v26 = sub_24CCBC480();
            }
            sub_24CC957B8(v35, type metadata accessor for NearbyDevice);
            uint64_t v31 = &qword_269822640;
            sub_24CC744B8((uint64_t)v13, &qword_269822640);
            sub_24CC744B8(v28, &qword_269822640);
            sub_24CC957B8(v34, type metadata accessor for NearbyDevice);
          }
        }
        sub_24CC744B8(v29, v31);
        sub_24CC957B8((uint64_t)v24, type metadata accessor for NearbyDeviceProviderState);
      }
      break;
  }
  return v26 & 1;
}

uint64_t sub_24CC934D8()
{
  return sub_24CC93520(&qword_269822620, (void (*)(uint64_t))type metadata accessor for NearbyDevice);
}

uint64_t sub_24CC93520(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24CC9356C()
{
  unint64_t result = qword_269822628;
  if (!qword_269822628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269822628);
  }
  return result;
}

uint64_t type metadata accessor for NearbyDeviceActor()
{
  return self;
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyDevice(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v10 = sub_24CCBB8F0();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for NearbyDevice(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24CCBB8F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for NearbyDevice(void *a1, void *a2, uint64_t a3)
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
  uint64_t v9 = sub_24CCBB8F0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *assignWithCopy for NearbyDevice(void *a1, void *a2, uint64_t a3)
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
  uint64_t v9 = sub_24CCBB8F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for NearbyDevice(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24CCBB8F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for NearbyDevice(void *a1, void *a2, uint64_t a3)
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
  uint64_t v11 = sub_24CCBB8F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyDevice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC939EC);
}

uint64_t sub_24CC939EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24CCBB8F0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NearbyDevice(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC93AB0);
}

uint64_t sub_24CC93AB0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24CCBB8F0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24CC93B58()
{
  uint64_t result = sub_24CCBB8F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for NearbyDeviceProviderState(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = &v11[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v12 = *a2;
      uint64_t v13 = v12;
      *(void *)a1 = v12;
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = type metadata accessor for NearbyDevice(0);
      uint64_t v9 = *(void *)(v8 - 8);
      if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        uint64_t v14 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v14;
        uint64_t v15 = a2[3];
        *((void *)a1 + 2) = a2[2];
        *((void *)a1 + 3) = v15;
        uint64_t v16 = *(int *)(v8 + 24);
        uint64_t v17 = &a1[v16];
        uint64_t v21 = (char *)a2 + v16;
        uint64_t v18 = sub_24CCBB8F0();
        uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v19(v17, v21, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      }
      goto LABEL_10;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

void destroy for NearbyDeviceProviderState(void **a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    unint64_t v4 = *a1;
  }
  else if (!EnumCaseMultiPayload)
  {
    uint64_t v3 = type metadata accessor for NearbyDevice(0);
    if (!(*(unsigned int (**)(void **, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(a1, 1, v3))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v5 = (char *)a1 + *(int *)(v3 + 24);
      uint64_t v6 = sub_24CCBB8F0();
      uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
      v7(v5, v6);
    }
  }
}

void **initializeWithCopy for NearbyDeviceProviderState(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = *a2;
    id v11 = v10;
    *a1 = v10;
LABEL_8:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = type metadata accessor for NearbyDevice(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      uint64_t v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      uint64_t v14 = *(int *)(v7 + 24);
      uint64_t v15 = (char *)a1 + v14;
      uint64_t v19 = (char *)a2 + v14;
      uint64_t v16 = sub_24CCBB8F0();
      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v17(v15, v19, v16);
      (*(void (**)(void **, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void **assignWithCopy for NearbyDeviceProviderState(void **a1, void **a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CC957B8((uint64_t)a1, type metadata accessor for NearbyDeviceProviderState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = *a2;
      id v11 = v10;
      *a1 = v10;
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = type metadata accessor for NearbyDevice(0);
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        uint64_t v12 = *(int *)(v7 + 24);
        uint64_t v13 = (char *)a1 + v12;
        uint64_t v17 = (char *)a2 + v12;
        uint64_t v14 = sub_24CCBB8F0();
        uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v15(v13, v17, v14);
        (*(void (**)(void **, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t type metadata accessor for NearbyDeviceProviderState(uint64_t a1)
{
  return sub_24CC94B14(a1, (uint64_t *)&unk_269822648);
}

_OWORD *initializeWithTake for NearbyDeviceProviderState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for NearbyDevice(0);
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      long long v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      uint64_t v10 = *(int *)(v6 + 24);
      id v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = sub_24CCBB8F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for NearbyDeviceProviderState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CC957B8((uint64_t)a1, type metadata accessor for NearbyDeviceProviderState);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for NearbyDevice(0);
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        long long v9 = a2[1];
        *a1 = *a2;
        a1[1] = v9;
        uint64_t v10 = *(int *)(v6 + 24);
        id v11 = (char *)a1 + v10;
        uint64_t v12 = (char *)a2 + v10;
        uint64_t v13 = sub_24CCBB8F0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyDeviceProviderState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for NearbyDeviceProviderState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24CC946F4()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_24CC94704()
{
  sub_24CC94A90(319, &qword_269822658, type metadata accessor for NearbyDevice, MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_initEnumMetadataMultiPayload();
  }
}

uint64_t getEnumTagSinglePayload for NearbyDeviceProvidingError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for NearbyDeviceProvidingError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CC948B4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24CC948DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for NearbyDeviceProvidingError()
{
  return &type metadata for NearbyDeviceProvidingError;
}

uint64_t dispatch thunk of NearbyDeviceProvidingObserver.nearbyDeviceProvider(_:didUpdateState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of NearbyDeviceProvidingObserver.nearbyDeviceProvider(_:didUpdateNearbyTrustedDevice:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of NearbyDeviceProviding.addObserver(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of NearbyDeviceProviding.removeObserver(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of NearbyDeviceProviding.startBrowsing()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24CC94958()
{
  return type metadata accessor for NearbyDeviceProvider(0);
}

uint64_t type metadata accessor for NearbyDeviceProvider(uint64_t a1)
{
  return sub_24CC94B14(a1, (uint64_t *)&unk_269822670);
}

void sub_24CC94980()
{
  sub_24CCBB610();
  if (v0 <= 0x3F)
  {
    sub_24CC94A90(319, &qword_269822690, type metadata accessor for NearbyDeviceProvider.State, MEMORY[0x263F8F2D8]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_24CC94A90(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t type metadata accessor for NearbyDeviceProvider.State(uint64_t a1)
{
  return sub_24CC94B14(a1, (uint64_t *)&unk_2698226A0);
}

uint64_t sub_24CC94B14(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC94B4C()
{
  if (MEMORY[0x263F8EEE0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_269822698);
  }
  else {
    return MEMORY[0x263F8EE60] + 8;
  }
}

uint64_t *sub_24CC94B74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = type metadata accessor for NearbyDevice(0);
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    if (v13((char *)v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v15 = v10[1];
      *uint64_t v9 = *v10;
      v9[1] = v15;
      uint64_t v37 = v12;
      uint64_t v16 = v10[3];
      v9[2] = v10[2];
      _OWORD v9[3] = v16;
      uint64_t v17 = *(int *)(v11 + 24);
      uint64_t v34 = (char *)v10 + v17;
      uint64_t v35 = (char *)v9 + v17;
      uint64_t v18 = sub_24CCBB8F0();
      int64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
      swift_bridgeObjectRetain();
      uint64_t v12 = v37;
      swift_bridgeObjectRetain();
      v33(v35, v34, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v37 + 56))(v9, 0, 1, v11);
    }
    uint64_t v19 = *(int *)(a3 + 24);
    int64_t v20 = (uint64_t *)((char *)v7 + v19);
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = type metadata accessor for NearbyDeviceProviderState(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      id v25 = *(id *)v21;
      id v26 = *(id *)v21;
      *int64_t v20 = v25;
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return v7;
    }
    if (!EnumCaseMultiPayload)
    {
      if (v13(v21, 1, v11))
      {
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
        memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        uint64_t v27 = *((void *)v21 + 1);
        *int64_t v20 = *(void *)v21;
        v20[1] = v27;
        uint64_t v28 = *((void *)v21 + 3);
        v20[2] = *((void *)v21 + 2);
        uint64_t v20[3] = v28;
        uint64_t v29 = *(int *)(v11 + 24);
        uint64_t v36 = &v21[v29];
        uint64_t v38 = (char *)v20 + v29;
        uint64_t v30 = sub_24CCBB8F0();
        uint64_t v31 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v31(v38, v36, v30);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
      }
      goto LABEL_13;
    }
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  return v7;
}

void sub_24CC94EDC(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for NearbyDevice(0);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  if (!v6(v4, 1, v5))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = v4 + *(int *)(v5 + 24);
    uint64_t v8 = sub_24CCBB8F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  uint64_t v9 = (void **)(a1 + *(int *)(a2 + 24));
  type metadata accessor for NearbyDeviceProviderState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v11 = *v9;
  }
  else if (!EnumCaseMultiPayload && !v6((uint64_t)v9, 1, v5))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v12 = (char *)v9 + *(int *)(v5 + 24);
    uint64_t v13 = sub_24CCBB8F0();
    uint64_t v14 = *(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8);
    v14(v12, v13);
  }
}

void *sub_24CC95090(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for NearbyDevice(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(void, void, void))(v10 + 48);
  swift_retain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = v8[1];
    *uint64_t v7 = *v8;
    v7[1] = v13;
    uint64_t v37 = v10;
    uint64_t v14 = v8[3];
    long long v7[2] = v8[2];
    v7[3] = v14;
    uint64_t v15 = *(int *)(v9 + 24);
    int64_t v33 = (char *)v8 + v15;
    uint64_t v34 = (char *)v7 + v15;
    uint64_t v35 = v11;
    uint64_t v16 = sub_24CCBB8F0();
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    swift_bridgeObjectRetain();
    uint64_t v10 = v37;
    swift_bridgeObjectRetain();
    uint64_t v17 = v16;
    uint64_t v11 = v35;
    v32(v34, v33, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v37 + 56))(v7, 0, 1, v9);
  }
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = (void *)((char *)a1 + v18);
  int64_t v20 = (char *)a2 + v18;
  uint64_t v21 = type metadata accessor for NearbyDeviceProviderState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    id v24 = *(id *)v20;
    id v25 = *(id *)v20;
    *uint64_t v19 = v24;
LABEL_11:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    if (v11(v20, 1, v9))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      uint64_t v26 = *((void *)v20 + 1);
      *uint64_t v19 = *(void *)v20;
      v19[1] = v26;
      uint64_t v27 = *((void *)v20 + 3);
      v19[2] = *((void *)v20 + 2);
      v19[3] = v27;
      uint64_t v28 = *(int *)(v9 + 24);
      uint64_t v36 = &v20[v28];
      uint64_t v38 = (char *)v19 + v28;
      uint64_t v29 = sub_24CCBB8F0();
      uint64_t v30 = *(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v30(v38, v36, v29);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
    }
    goto LABEL_11;
  }
  memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  return a1;
}

void *sub_24CC95390(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for NearbyDevice(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      *uint64_t v7 = *v8;
      v7[1] = v8[1];
      long long v7[2] = v8[2];
      v7[3] = v8[3];
      uint64_t v14 = *(int *)(v9 + 24);
      uint64_t v35 = (char *)v8 + v14;
      uint64_t v36 = (char *)v7 + v14;
      uint64_t v37 = v11;
      uint64_t v15 = sub_24CCBB8F0();
      uint64_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v16 = v15;
      uint64_t v11 = v37;
      v34(v36, v35, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      if (a1 == a2) {
        return a1;
      }
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
    memcpy(v7, v8, *(void *)(*(void *)(v17 - 8) + 64));
    if (a1 == a2) {
      return a1;
    }
    goto LABEL_8;
  }
  if (v13)
  {
    sub_24CC957B8((uint64_t)v7, type metadata accessor for NearbyDevice);
    goto LABEL_7;
  }
  *uint64_t v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v7[2] = v8[2];
  v7[3] = v8[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = *(int *)(v9 + 24);
  uint64_t v27 = (char *)v7 + v26;
  uint64_t v28 = (char *)v8 + v26;
  uint64_t v29 = sub_24CCBB8F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 24))(v27, v28, v29);
  if (a1 == a2) {
    return a1;
  }
LABEL_8:
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = (void *)((char *)a1 + v18);
  int64_t v20 = (char *)a2 + v18;
  sub_24CC957B8((uint64_t)a1 + v18, type metadata accessor for NearbyDeviceProviderState);
  uint64_t v21 = type metadata accessor for NearbyDeviceProviderState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    id v24 = *(id *)v20;
    id v25 = *(id *)v20;
    *uint64_t v19 = v24;
LABEL_17:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    if (v11(v20, 1, v9))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      *uint64_t v19 = *(void *)v20;
      v19[1] = *((void *)v20 + 1);
      v19[2] = *((void *)v20 + 2);
      v19[3] = *((void *)v20 + 3);
      uint64_t v30 = *(int *)(v9 + 24);
      uint64_t v38 = &v20[v30];
      uint64_t v39 = (char *)v19 + v30;
      uint64_t v31 = sub_24CCBB8F0();
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v32(v39, v38, v31);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
    }
    goto LABEL_17;
  }
  memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  return a1;
}

uint64_t sub_24CC957B8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_24CC95818(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (_OWORD *)((char *)a1 + v6);
  uint64_t v8 = (_OWORD *)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for NearbyDevice(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    long long v13 = v8[1];
    *uint64_t v7 = *v8;
    v7[1] = v13;
    uint64_t v14 = *(int *)(v9 + 24);
    uint64_t v15 = (char *)v7 + v14;
    uint64_t v16 = (char *)v8 + v14;
    uint64_t v17 = sub_24CCBB8F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = (_OWORD *)((char *)a1 + v18);
  int64_t v20 = (_OWORD *)((char *)a2 + v18);
  uint64_t v21 = type metadata accessor for NearbyDeviceProviderState(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    if (v11(v20, 1, v9))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
      memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      long long v23 = v20[1];
      *uint64_t v19 = *v20;
      v19[1] = v23;
      uint64_t v24 = *(int *)(v9 + 24);
      id v25 = (char *)v19 + v24;
      uint64_t v26 = (char *)v20 + v24;
      uint64_t v27 = sub_24CCBB8F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24CC95A90(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for NearbyDevice(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      long long v14 = *((_OWORD *)v8 + 1);
      *(_OWORD *)uint64_t v7 = *(_OWORD *)v8;
      *((_OWORD *)v7 + 1) = v14;
      uint64_t v15 = *(int *)(v9 + 24);
      uint64_t v16 = (char *)v7 + v15;
      uint64_t v17 = (char *)v8 + v15;
      uint64_t v18 = sub_24CCBB8F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      if (a1 == a2) {
        return a1;
      }
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
    memcpy(v7, v8, *(void *)(*(void *)(v19 - 8) + 64));
    if (a1 == a2) {
      return a1;
    }
    goto LABEL_8;
  }
  if (v13)
  {
    sub_24CC957B8((uint64_t)v7, type metadata accessor for NearbyDevice);
    goto LABEL_7;
  }
  uint64_t v25 = v8[1];
  *uint64_t v7 = *v8;
  v7[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v26 = v8[3];
  long long v7[2] = v8[2];
  v7[3] = v26;
  swift_bridgeObjectRelease();
  uint64_t v27 = *(int *)(v9 + 24);
  uint64_t v28 = (char *)v7 + v27;
  uint64_t v29 = (char *)v8 + v27;
  uint64_t v30 = sub_24CCBB8F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 40))(v28, v29, v30);
  if (a1 == a2) {
    return a1;
  }
LABEL_8:
  uint64_t v20 = *(int *)(a3 + 24);
  uint64_t v21 = (_OWORD *)((char *)a1 + v20);
  uint64_t v22 = (_OWORD *)((char *)a2 + v20);
  sub_24CC957B8((uint64_t)a1 + v20, type metadata accessor for NearbyDeviceProviderState);
  uint64_t v23 = type metadata accessor for NearbyDeviceProviderState(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    if (v11(v22, 1, v9))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
      memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      long long v31 = v22[1];
      *uint64_t v21 = *v22;
      v21[1] = v31;
      uint64_t v32 = *(int *)(v9 + 24);
      int64_t v33 = (char *)v21 + v32;
      uint64_t v34 = (char *)v22 + v32;
      uint64_t v35 = sub_24CCBB8F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v10 + 56))(v21, 0, 1, v9);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24CC95DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC95E04);
}

uint64_t sub_24CC95E04(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      int v12 = (char *)a1 + *(int *)(a3 + 20);
      int v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = type metadata accessor for NearbyDeviceProviderState(0);
      uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = (char *)a1 + *(int *)(a3 + 24);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t sub_24CC95F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC95F54);
}

void *sub_24CC95F54(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for NearbyDeviceProviderState(0);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_24CC96084()
{
  sub_24CC94A90(319, &qword_269822658, type metadata accessor for NearbyDevice, MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for NearbyDeviceProviderState(319);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_24CC96188()
{
  return sub_24CC93520(&qword_2698226B0, (void (*)(uint64_t))type metadata accessor for NearbyDeviceActor);
}

unint64_t sub_24CC961D0()
{
  unint64_t result = qword_269821BC8;
  if (!qword_269821BC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269821BC8);
  }
  return result;
}

uint64_t sub_24CC96210()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CC96258(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24CC68584;
  return sub_24CC91798(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_24CC96320(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(a2 + 16))(v5, &off_26FF2B790, v4, ObjectType, a2);
}

uint64_t sub_24CC96384(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC963EC()
{
  uint64_t v1 = sub_24CCBBCE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24CC964CC(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24CCBBCE0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_24CC6CB14;
  return sub_24CC908E8(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_24CC965F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CC96660(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(a2 + 8))(v5, &off_26FF2B790, v4, ObjectType, a2);
}

uint64_t sub_24CC966C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NearbyDeviceProviderState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CC96728()
{
  unint64_t result = qword_2698226F0;
  if (!qword_2698226F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698226F0);
  }
  return result;
}

uint64_t sub_24CC9677C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CC967E4()
{
  unint64_t result = qword_2698226F8;
  if (!qword_2698226F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698226F8);
  }
  return result;
}

uint64_t sub_24CC96838(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CC968A0(uint64_t a1)
{
  return sub_24CC8EB20(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_24CC968A8()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CC968E0(uint64_t a1)
{
  return sub_24CC8DF30(a1);
}

uint64_t sub_24CC968E8(uint64_t a1)
{
  return sub_24CC8DF90(a1);
}

ValueMetadata *type metadata accessor for NearbyDeviceProvider.BrowserSomehowReadyButNotSet()
{
  return &type metadata for NearbyDeviceProvider.BrowserSomehowReadyButNotSet;
}

uint64_t sub_24CC96900()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24CC96950()
{
  uint64_t v0 = swift_allocObject();
  sub_24CC994D4();
  return v0;
}

void sub_24CC96988()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822858);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24CCBB8D0();
  MEMORY[0x270FA5388](v8 - 8);
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24CCBB890();
  __swift_project_value_buffer(v9, (uint64_t)qword_269824810);
  uint64_t v10 = sub_24CCBB870();
  os_log_type_t v11 = sub_24CCBC060();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v34 = v4;
  if (v12)
  {
    uint64_t v32 = v3;
    uint64_t v13 = swift_slowAlloc();
    int64_t v33 = v7;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v36 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v16 = sub_24CCBC5E0();
    uint64_t v35 = sub_24CC692DC(v16, v17, &v36);
    uint64_t v2 = v1;
    uint64_t v3 = v32;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v10, v11, "[%s] Activate", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v15, -1, -1);
    uint64_t v18 = v14;
    uint64_t v7 = v33;
    MEMORY[0x2533103A0](v18, -1, -1);
  }

  int v19 = *((unsigned __int8 *)v3 + 32);
  if ((v19 & 0xC0) == 0x80 && v19 == 128 && !v3[3])
  {
    sub_24CCBB168();
    swift_retain();
    sub_24CCBB8C0();
    sub_24CCBB9A0();
    swift_allocObject();
    uint64_t v20 = sub_24CCBB950();
    if (v2)
    {
      swift_release();
    }
    else
    {
      uint64_t v21 = v20;
      sub_24CCBB970();
      uint64_t v22 = sub_24CCBB980();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v7, 0, 1, v22);
      sub_24CCBB990();
      int64_t v33 = 0;
      uint64_t v23 = swift_allocObject();
      swift_weakInit();
      uint64_t v24 = (void *)swift_allocObject();
      uint64_t v25 = v34;
      uint64_t v26 = *(void *)(v34 + 80);
      uint64_t v24[2] = v26;
      uint64_t v27 = *(void *)(v25 + 88);
      v24[3] = v27;
      v24[4] = v23;
      swift_retain();
      sub_24CC7B4A8((uint64_t)sub_24CC998EC);
      sub_24CCBB900();
      swift_release();
      swift_release();
      uint64_t v28 = swift_allocObject();
      swift_weakInit();
      uint64_t v29 = (void *)swift_allocObject();
      v29[2] = v26;
      v29[3] = v27;
      v29[4] = v28;
      swift_retain();
      sub_24CC7B4A8((uint64_t)sub_24CC99930);
      sub_24CCBB910();
      swift_release();
      swift_release();
      sub_24CCBB940();
      swift_release();
      uint64_t v30 = (void *)v3[3];
      _OWORD v3[3] = v21;
      unsigned __int8 v31 = *((unsigned char *)v3 + 32);
      *((unsigned char *)v3 + 32) = 0;
      sub_24CC992E0(v30, v31);
    }
  }
}

uint64_t sub_24CC96E14(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CC97728(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_24CC96E74(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CC98DF0(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_24CC96ED4()
{
  v1[7] = v0;
  v1[8] = *v0;
  v1[9] = *v0;
  return MEMORY[0x270FA2498](sub_24CC96F44, 0, 0);
}

uint64_t sub_24CC96F44()
{
  uint64_t v27 = v0;
  uint64_t v1 = sub_24CC9747C(*(void *)(v0 + 56));
  int v3 = ~v2;
  sub_24CC99854(v1, v2);
  if (v3)
  {
    uint64_t v4 = sub_24CC9747C(*(void *)(v0 + 56));
    if (v5 == -1)
    {
      if (qword_269821AC0 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_24CCBB890();
      __swift_project_value_buffer(v11, (uint64_t)qword_269824858);
      swift_retain_n();
      BOOL v12 = sub_24CCBB870();
      os_log_type_t v13 = sub_24CCBC040();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = *(void *)(v0 + 56);
        uint64_t v15 = swift_slowAlloc();
        uint64_t v16 = swift_slowAlloc();
        v26[0] = v16;
        *(_DWORD *)uint64_t v15 = 136315394;
        uint64_t v17 = sub_24CCBC5E0();
        *(void *)(v0 + 32) = sub_24CC692DC(v17, v18, v26);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 12) = 2080;
        int v19 = *(void **)(v14 + 24);
        unsigned __int8 v20 = *(unsigned char *)(v14 + 32);
        *(void *)(v0 + 16) = v19;
        *(unsigned char *)(v0 + 24) = v20;
        sub_24CC992A0(v19, v20);
        type metadata accessor for PeerListener.State();
        uint64_t v21 = sub_24CCBBE70();
        *(void *)(v0 + 40) = sub_24CC692DC(v21, v22, v26);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_24CC60000, v12, v13, "[%s] Peer Listener expected result in state %s", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v16, -1, -1);
        MEMORY[0x2533103A0](v15, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      uint64_t v23 = sub_24CCBB810();
      sub_24CC9986C((unint64_t *)&qword_269822CD0, MEMORY[0x263F3A030]);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v24, *MEMORY[0x263F3A010], v23);
      swift_willThrow();
    }
    else
    {
      uint64_t v6 = (uint64_t)v4;
      if ((v5 & 1) == 0)
      {
        type metadata accessor for PeerConnection();
        uint64_t v7 = PeerConnection.__allocating_init(nwConnection:)(v6);
        uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
        return v8(v7);
      }
      *(void *)(v0 + 48) = v4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269821D68);
      swift_willThrowTypedImpl();
    }
    uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25();
  }
  else
  {
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v10;
    void *v10 = v0;
    v10[1] = sub_24CC97380;
    return MEMORY[0x270FA2000]();
  }
}

uint64_t sub_24CC97380()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CC99944, 0, 0);
}

void *sub_24CC9747C(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 32);
  if ((v1 & 0xC0) != 0x40) {
    return 0;
  }
  unsigned __int8 v2 = *(void **)(a1 + 24);
  sub_24CC992C4(v2, v1 & 1);
  return v2;
}

void sub_24CC974D0()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 <= 0x3F)
  {
    unsigned __int8 v2 = *(void **)(v0 + 24);
    swift_retain();
    sub_24CC97548();
    sub_24CC992E0(v2, v1);
    LOBYTE(v1) = *(unsigned char *)(v0 + 32);
  }
  int v3 = *(void **)(v0 + 24);
  *(void *)(v0 + 24) = 1;
  *(unsigned char *)(v0 + 32) = 0x80;
  sub_24CC992E0(v3, v1);
}

uint64_t sub_24CC97548()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_269824810);
  unsigned int v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v8 = v4;
    *(_DWORD *)int v3 = 136315138;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v8);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] Cleaning up listener", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }

  sub_24CC7B4A8(0);
  sub_24CCBB900();
  sub_24CC7B4A8(0);
  sub_24CCBB910();
  return sub_24CCBB960();
}

void sub_24CC97728(uint64_t a1)
{
  uint64_t v129 = *v1;
  uint64_t v3 = sub_24CCBBC00();
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v130 = (void (*)(void, void, void))v3;
  uint64_t v131 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v125 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v124 = (char *)&v118 - v8;
  MEMORY[0x270FA5388](v7);
  unint64_t v128 = (char *)&v118 - v9;
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822838);
  uint64_t v10 = MEMORY[0x270FA5388](v121);
  uint64_t v120 = (uint64_t)&v118 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  int v122 = (char *)&v118 - v13;
  MEMORY[0x270FA5388](v12);
  v123 = (char *)&v118 - v14;
  uint64_t v15 = sub_24CCBB930();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  int v19 = (char *)&v118 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  unint64_t v126 = (char *)&v118 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v119 = (char *)&v118 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v118 - v24;
  uint64_t v26 = sub_24CCBBD90();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (uint64_t *)((char *)&v118 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v127 = v1;
  uint64_t v30 = (void *)v1[2];
  *uint64_t v29 = v30;
  (*(void (**)(void *, void, uint64_t))(v27 + 104))(v29, *MEMORY[0x263F8F0E0], v26);
  id v31 = v30;
  uint64_t v32 = sub_24CCBBDA0();
  (*(void (**)(void *, uint64_t))(v27 + 8))(v29, v26);
  if ((v32 & 1) == 0)
  {
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v32 = *(void *)(v16 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v32)(v25, a1, v15);
  int v33 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v25, v15);
  uint64_t v26 = v16;
  if (v33 == *MEMORY[0x263F14150])
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v25, v15);
    goto LABEL_13;
  }
  if (v33 == *MEMORY[0x263F14148])
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v25, v15);
    uint64_t v34 = v130;
    uint64_t v35 = v128;
    (*(void (**)(char *, char *, void))(v131 + 32))(v128, v25, v130);
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_24CCBB890();
    __swift_project_value_buffer(v36, (uint64_t)qword_269824810);
    uint64_t v37 = sub_24CCBB870();
    os_log_type_t v38 = sub_24CCBC040();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v133 = (char *)v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v41 = sub_24CCBC5E0();
      uint64_t v132 = sub_24CC692DC(v41, v42, (uint64_t *)&v133);
      uint64_t v34 = v130;
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v37, v38, " %s !!! PEER LISTENER FAILED !!!", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v40, -1, -1);
      uint64_t v43 = v39;
      uint64_t v35 = v128;
      MEMORY[0x2533103A0](v43, -1, -1);
    }

    uint64_t v44 = v125;
    char v45 = sub_24CC989F4();
    int v46 = *(void (**)(char *, char *, void))(v131 + 16);
    if (v45)
    {
      uint64_t v47 = v124;
      v46(v124, v35, v34);
      uint64_t v48 = sub_24CCBB870();
      os_log_type_t v49 = sub_24CCBC040();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = swift_slowAlloc();
        uint64_t v51 = v47;
        id v52 = (void *)swift_slowAlloc();
        unint64_t v126 = (char *)swift_slowAlloc();
        uint64_t v133 = v126;
        *(_DWORD *)uint64_t v50 = 136315394;
        uint64_t v53 = sub_24CCBC5E0();
        uint64_t v132 = sub_24CC692DC(v53, v54, (uint64_t *)&v133);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v50 + 12) = 2112;
        sub_24CC9986C(&qword_269822030, MEMORY[0x263F14320]);
        swift_allocError();
        v46(v55, v51, v130);
        uint64_t v56 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v132 = v56;
        sub_24CCBC120();
        void *v52 = v56;
        uint64_t v34 = v130;
        uint64_t v57 = *(void (**)(void, void))(v131 + 8);
        v57(v51, v130);
        _os_log_impl(&dword_24CC60000, v48, v49, "%s listener failed with %@; restarting", (uint8_t *)v50, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v52, -1, -1);
        v58 = v126;
        swift_arrayDestroy();
        uint64_t v59 = v58;
        uint64_t v35 = v128;
        MEMORY[0x2533103A0](v59, -1, -1);
        MEMORY[0x2533103A0](v50, -1, -1);
      }
      else
      {
        uint64_t v57 = *(void (**)(void, void))(v131 + 8);
        v57(v47, v34);
      }

      sub_24CC98F4C();
    }
    else
    {
      v46(v44, v35, v34);
      unint64_t v71 = sub_24CCBB870();
      os_log_type_t v72 = sub_24CCBC040();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v73 = swift_slowAlloc();
        uint64_t v74 = v44;
        v75 = (void *)swift_slowAlloc();
        unint64_t v126 = (char *)swift_slowAlloc();
        uint64_t v133 = v126;
        *(_DWORD *)uint64_t v73 = 136315394;
        uint64_t v76 = sub_24CCBC5E0();
        uint64_t v132 = sub_24CC692DC(v76, v77, (uint64_t *)&v133);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v73 + 12) = 2112;
        sub_24CC9986C(&qword_269822030, MEMORY[0x263F14320]);
        swift_allocError();
        v46(v78, v74, v130);
        uint64_t v79 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v132 = v79;
        sub_24CCBC120();
        void *v75 = v79;
        uint64_t v34 = v130;
        uint64_t v57 = *(void (**)(void, void))(v131 + 8);
        v57(v74, v130);
        _os_log_impl(&dword_24CC60000, v71, v72, "%s listener failed with %@; stopping", (uint8_t *)v73, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v75, -1, -1);
        v80 = v126;
        swift_arrayDestroy();
        os_log_type_t v81 = v80;
        uint64_t v35 = v128;
        MEMORY[0x2533103A0](v81, -1, -1);
        MEMORY[0x2533103A0](v73, -1, -1);
      }
      else
      {
        uint64_t v57 = *(void (**)(void, void))(v131 + 8);
        v57(v44, v34);
      }

      uint64_t v85 = v127;
      sub_24CC9986C(&qword_269822030, MEMORY[0x263F14320]);
      uint64_t v86 = swift_allocError();
      v46(v87, v35, v34);
      uint64_t v88 = (void *)v85[3];
      v85[3] = v86;
      unsigned __int8 v89 = *((unsigned char *)v85 + 32);
      *((unsigned char *)v85 + 32) = 65;
      sub_24CC992E0(v88, v89);
      sub_24CC974D0();
    }
    v57(v35, v34);
  }
  else
  {
    if (v33 == *MEMORY[0x263F14140])
    {
LABEL_13:
      if (qword_269821AA8 == -1)
      {
LABEL_14:
        uint64_t v60 = sub_24CCBB890();
        __swift_project_value_buffer(v60, (uint64_t)qword_269824810);
        ((void (*)(char *, uint64_t, uint64_t))v32)(v19, a1, v15);
        uint64_t v61 = sub_24CCBB870();
        os_log_type_t v62 = sub_24CCBC060();
        int v63 = v62;
        if (os_log_type_enabled(v61, v62))
        {
          uint64_t v64 = swift_slowAlloc();
          LODWORD(v130) = v63;
          uint64_t v65 = v64;
          uint64_t v131 = swift_slowAlloc();
          uint64_t v133 = (char *)v131;
          *(_DWORD *)uint64_t v65 = 136315394;
          uint64_t v66 = sub_24CCBC5E0();
          uint64_t v132 = sub_24CC692DC(v66, v67, (uint64_t *)&v133);
          sub_24CCBC120();
          swift_bridgeObjectRelease();
          *(_WORD *)(v65 + 12) = 2080;
          ((void (*)(char *, char *, uint64_t))v32)(v126, v19, v15);
          uint64_t v68 = sub_24CCBBE70();
          uint64_t v132 = sub_24CC692DC(v68, v69, (uint64_t *)&v133);
          sub_24CCBC120();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v15);
          _os_log_impl(&dword_24CC60000, v61, (os_log_type_t)v130, "%s listener state %s", (uint8_t *)v65, 0x16u);
          uint64_t v70 = v131;
          swift_arrayDestroy();
          MEMORY[0x2533103A0](v70, -1, -1);
          MEMORY[0x2533103A0](v65, -1, -1);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v15);
        }

        return;
      }
LABEL_48:
      swift_once();
      goto LABEL_14;
    }
    if (v33 == *MEMORY[0x263F14138])
    {
      unsigned int v82 = *((unsigned __int8 *)v127 + 32);
      if (v82 > 0x3F)
      {
        uint64_t v100 = sub_24CCBB8D0();
        uint64_t v84 = (uint64_t)v123;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v123, 1, 1, v100);
      }
      else
      {
        uint64_t v83 = (void *)v127[3];
        swift_retain();
        uint64_t v84 = (uint64_t)v123;
        sub_24CCBB920();
        sub_24CC992E0(v83, v82);
      }
      uint64_t v101 = (uint64_t)v122;
      if (qword_269821AA8 != -1) {
        swift_once();
      }
      uint64_t v102 = sub_24CCBB890();
      __swift_project_value_buffer(v102, (uint64_t)qword_269824810);
      sub_24CC74734(v84, v101, &qword_269822838);
      unint64_t v103 = sub_24CCBB870();
      os_log_type_t v104 = sub_24CCBC060();
      if (os_log_type_enabled(v103, v104))
      {
        uint64_t v105 = swift_slowAlloc();
        uint64_t v106 = swift_slowAlloc();
        uint64_t v133 = (char *)v106;
        *(_DWORD *)uint64_t v105 = 136315394;
        uint64_t v107 = sub_24CCBC5E0();
        uint64_t v132 = sub_24CC692DC(v107, v108, (uint64_t *)&v133);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v105 + 12) = 2080;
        sub_24CC74734(v101, v120, &qword_269822838);
        uint64_t v109 = sub_24CCBBE70();
        uint64_t v132 = sub_24CC692DC(v109, v110, (uint64_t *)&v133);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        sub_24CC744B8(v101, &qword_269822838);
        _os_log_impl(&dword_24CC60000, v103, v104, "%s listener state ready on port %s", (uint8_t *)v105, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v106, -1, -1);
        MEMORY[0x2533103A0](v105, -1, -1);
      }
      else
      {

        sub_24CC744B8(v101, &qword_269822838);
      }
      sub_24CC744B8(v84, &qword_269822838);
    }
    else if (v33 == *MEMORY[0x263F14158])
    {
      if (qword_269821AA8 != -1) {
        swift_once();
      }
      uint64_t v90 = sub_24CCBB890();
      __swift_project_value_buffer(v90, (uint64_t)qword_269824810);
      uint64_t v91 = v119;
      ((void (*)(char *, uint64_t, uint64_t))v32)(v119, a1, v15);
      os_log_t v92 = sub_24CCBB870();
      os_log_type_t v93 = sub_24CCBC060();
      if (os_log_type_enabled(v92, v93))
      {
        uint64_t v94 = swift_slowAlloc();
        uint64_t v131 = swift_slowAlloc();
        uint64_t v133 = (char *)v131;
        *(_DWORD *)uint64_t v94 = 136315394;
        unint64_t v130 = (void (*)(void, void, void))v32;
        uint64_t v95 = sub_24CCBC5E0();
        uint64_t v132 = sub_24CC692DC(v95, v96, (uint64_t *)&v133);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v94 + 12) = 2080;
        v130(v126, v91, v15);
        uint64_t v97 = sub_24CCBBE70();
        uint64_t v132 = sub_24CC692DC(v97, v98, (uint64_t *)&v133);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v91, v15);
        _os_log_impl(&dword_24CC60000, v92, v93, "%s listener state %s; invalidating", (uint8_t *)v94, 0x16u);
        uint64_t v99 = v131;
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v99, -1, -1);
        MEMORY[0x2533103A0](v94, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v91, v15);
      }

      sub_24CC974D0();
    }
    else
    {
      if (qword_269821AA8 != -1) {
        swift_once();
      }
      uint64_t v111 = sub_24CCBB890();
      __swift_project_value_buffer(v111, (uint64_t)qword_269824810);
      uint64_t v112 = sub_24CCBB870();
      os_log_type_t v113 = sub_24CCBC050();
      if (os_log_type_enabled(v112, v113))
      {
        uint64_t v114 = (uint8_t *)swift_slowAlloc();
        uint64_t v115 = swift_slowAlloc();
        uint64_t v133 = (char *)v115;
        *(_DWORD *)uint64_t v114 = 136315138;
        uint64_t v116 = sub_24CCBC5E0();
        uint64_t v132 = sub_24CC692DC(v116, v117, (uint64_t *)&v133);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24CC60000, v112, v113, "%s found unexpected NWListener.State type", v114, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v115, -1, -1);
        MEMORY[0x2533103A0](v114, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v15);
    }
  }
}

uint64_t sub_24CC989F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CCBBC00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822840);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822848);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v28 = (uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v27 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v27 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v27 - v16, v1, v2);
  uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
  v18(v17, 0, 1, v2);
  *(_DWORD *)uint64_t v15 = -65569;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v15, *MEMORY[0x263F14310], v2);
  v18(v15, 0, 1, v2);
  uint64_t v19 = (uint64_t)&v9[*(int *)(v7 + 56)];
  sub_24CC74734((uint64_t)v17, (uint64_t)v9, &qword_269822848);
  sub_24CC74734((uint64_t)v15, v19, &qword_269822848);
  uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v20((uint64_t)v9, 1, v2) == 1)
  {
    sub_24CC744B8((uint64_t)v15, &qword_269822848);
    int v21 = v20(v19, 1, v2);
    if (v21 == 1) {
      uint64_t v22 = &qword_269822848;
    }
    else {
      uint64_t v22 = &qword_269822840;
    }
    if (v21 == 1) {
      char v23 = -1;
    }
    else {
      char v23 = 0;
    }
  }
  else
  {
    uint64_t v24 = v28;
    sub_24CC74734((uint64_t)v9, v28, &qword_269822848);
    if (v20(v19, 1, v2) == 1)
    {
      sub_24CC744B8((uint64_t)v15, &qword_269822848);
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v24, v2);
      char v23 = 0;
      uint64_t v22 = &qword_269822840;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v5, v19, v2);
      sub_24CC9986C((unint64_t *)&qword_269822850, MEMORY[0x263F14320]);
      char v23 = sub_24CCBBDF0();
      uint64_t v25 = *(void (**)(char *, uint64_t))(v3 + 8);
      v25(v5, v2);
      uint64_t v22 = &qword_269822848;
      sub_24CC744B8((uint64_t)v15, &qword_269822848);
      v25((char *)v24, v2);
    }
  }
  sub_24CC744B8((uint64_t)v9, v22);
  sub_24CC744B8((uint64_t)v17, &qword_269822848);
  return v23 & 1;
}

void sub_24CC98DF0(uint64_t a1)
{
  uint64_t v3 = sub_24CCBBD90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *(void **)(v1 + 16);
  void *v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F0E0], v3);
  id v8 = v7;
  LOBYTE(v7) = sub_24CCBBDA0();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if (v7)
  {
    unsigned int v9 = *(unsigned __int8 *)(v1 + 32);
    if (v9 <= 0x3F)
    {
      uint64_t v10 = *(void **)(v1 + 24);
      swift_retain();
      sub_24CC97548();
      sub_24CC992E0(v10, v9);
      LOBYTE(v9) = *(unsigned char *)(v1 + 32);
    }
    uint64_t v11 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = a1;
    *(unsigned char *)(v1 + 32) = 64;
    swift_retain();
    sub_24CC992E0(v11, v9);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24CC98F4C()
{
  sub_24CC974D0();
  uint64_t v1 = *(void **)(v0 + 24);
  *(void *)(v0 + 24) = 0;
  unsigned __int8 v2 = *(unsigned char *)(v0 + 32);
  *(unsigned char *)(v0 + 32) = 0x80;
  sub_24CC992E0(v1, v2);
  return sub_24CC96988();
}

uint64_t sub_24CC991DC()
{
  sub_24CC974D0();

  sub_24CC992E0(*(void **)(v0 + 24), *(unsigned char *)(v0 + 32));
  return v0;
}

uint64_t sub_24CC9920C()
{
  sub_24CC991DC();
  return MEMORY[0x270FA0228](v0, 33, 7);
}

uint64_t type metadata accessor for PeerListener()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CC99258(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_24CC992A0(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id sub_24CC992A0(id result, unsigned __int8 a2)
{
  if (a2 >> 6 == 1) {
    return sub_24CC992C4(result, a2 & 1);
  }
  if (!(a2 >> 6)) {
    return (id)swift_retain();
  }
  return result;
}

id sub_24CC992C4(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void sub_24CC992D0(uint64_t a1)
{
}

void sub_24CC992E0(void *a1, unsigned __int8 a2)
{
  if (a2 >> 6 == 1)
  {
    sub_24CC99304(a1, a2 & 1);
  }
  else if (!(a2 >> 6))
  {
    swift_release();
  }
}

void sub_24CC99304(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_24CC99310(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_24CC992A0(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_24CC992E0(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t sub_24CC99378(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_24CC992E0(v4, v5);
  return a1;
}

uint64_t sub_24CC993B8(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 8) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 8) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t sub_24CC9940C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(unsigned char *)(result + 8) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_24CC99460(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 8);
  int v2 = (char)v1;
  unsigned int v3 = v1 >> 6;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24CC99480(uint64_t result)
{
  *(unsigned char *)(result + 8) &= 0x3Fu;
  return result;
}

uint64_t sub_24CC99490(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(unsigned char *)(result + 8) = *(unsigned char *)(result + 8) & 1 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(void *)uint64_t result = a2 - 2;
    *(unsigned char *)(result + 8) = 0x80;
  }
  return result;
}

uint64_t type metadata accessor for PeerListener.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CC994D4()
{
  uint64_t v1 = sub_24CCBC080();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unsigned __int8 v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CCBC070();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_24CCBBD80();
  MEMORY[0x270FA5388](v6 - 8);
  sub_24CC735FC();
  sub_24CCBBD60();
  v8[1] = MEMORY[0x263F8EE78];
  sub_24CC9986C((unint64_t *)&qword_269821DA0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821DA8);
  sub_24CC7363C();
  sub_24CCBC170();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v1);
  *(void *)(v0 + 16) = sub_24CCBC090();
  *(void *)(v0 + 24) = 0;
  *(unsigned char *)(v0 + 32) = 0x80;
  return v0;
}

void sub_24CC99710()
{
}

uint64_t sub_24CC99734()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC68708;
  v3[7] = v2;
  v3[8] = *v2;
  v3[9] = *v2;
  return MEMORY[0x270FA2498](sub_24CC96F44, 0, 0);
}

void sub_24CC99830()
{
}

void sub_24CC99854(void *a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_24CC99304(a1, a2 & 1);
  }
}

uint64_t sub_24CC9986C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC998B4()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CC998EC(uint64_t a1)
{
  return sub_24CC96E14(a1);
}

uint64_t sub_24CC998F8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CC99930(uint64_t a1)
{
  return sub_24CC96E74(a1);
}

void *PeerBrowser.__allocating_init(nearbyDeviceProvider:)(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = (void *)swift_allocObject();
  uint64_t v5 = (char *)v4 + *(void *)(*v4 + 104);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 3, v6);
  v4[2] = a1;
  v4[3] = a2;
  return v4;
}

uint64_t sub_24CC999EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 104);
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for PeerBrowser.State();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_24CC99AB0(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 104);
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for PeerBrowser.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

void *PeerBrowser.init(nearbyDeviceProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)v2 + *(void *)(*v2 + 104);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 3, v6);
  v2[2] = a1;
  v2[3] = a2;
  return v2;
}

uint64_t PeerBrowser.deinit()
{
  sub_24CC9AAC8();
  swift_unknownObjectRelease();
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t v2 = type metadata accessor for PeerBrowser.State();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PeerBrowser.__deallocating_deinit()
{
  PeerBrowser.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24CC99D14()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PeerBrowser.State();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v24 - v7;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24CCBB890();
  __swift_project_value_buffer(v9, (uint64_t)qword_269824810);
  uint64_t v10 = sub_24CCBB870();
  os_log_type_t v11 = sub_24CCBC060();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v24 = v2;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v25 = v6;
    uint64_t v14 = v13;
    uint64_t v27 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v15 = sub_24CCBC5E0();
    uint64_t v26 = sub_24CC692DC(v15, v16, &v27);
    sub_24CCBC120();
    uint64_t v2 = v24;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v10, v11, "[%s] Activate", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v14;
    uint64_t v6 = v25;
    MEMORY[0x2533103A0](v17, -1, -1);
    MEMORY[0x2533103A0](v12, -1, -1);
  }

  sub_24CC999EC((uint64_t)v8);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  uint64_t v19 = *(void *)(v18 - 8);
  int v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v8, 3, v18);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  if (v20 == 1)
  {
    uint64_t v22 = *(void *)(v1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v22 + 8))(v1, &protocol witness table for PeerBrowser<A>, ObjectType, v22);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v6, 2, 3, v18);
    return sub_24CC99AB0((uint64_t)v6);
  }
  return result;
}

uint64_t sub_24CC9A084()
{
  v1[5] = v0;
  v1[6] = *v0;
  uint64_t v2 = *v0;
  v1[7] = *(void *)(*v0 + 80);
  v1[8] = *(void *)(v2 + 88);
  v1[9] = type metadata accessor for PeerBrowser.State();
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_24CCBB8F0();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = type metadata accessor for NearbyDevice(0);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822870);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC9A250, 0, 0);
}

uint64_t sub_24CC9A250()
{
  int v33 = v0;
  uint64_t v1 = v0[18];
  sub_24CC9A8FC(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  int v4 = v3(v1, 1, v2);
  uint64_t v5 = v0[18];
  if (v4 == 1)
  {
    sub_24CC744B8(v5, &qword_269822870);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[19] = v6;
    void *v6 = v0;
    v6[1] = sub_24CC9A800;
    return MEMORY[0x270FA2000]();
  }
  uint64_t v7 = v0[17];
  sub_24CC744B8(v5, &qword_269822870);
  sub_24CC9A8FC(v7);
  int v8 = v3(v7, 1, v2);
  uint64_t v9 = (void *)v0[17];
  if (v8 == 1)
  {
    sub_24CC744B8(v0[17], &qword_269822870);
    if (qword_269821AC0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24CCBB890();
    __swift_project_value_buffer(v10, (uint64_t)qword_269824858);
    swift_retain_n();
    os_log_type_t v11 = sub_24CCBB870();
    os_log_type_t v12 = sub_24CCBC040();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = v0[10];
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v32[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      uint64_t v16 = sub_24CCBC5E0();
      v0[2] = sub_24CC692DC(v16, v17, v32);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      sub_24CC999EC(v13);
      uint64_t v18 = sub_24CCBBE70();
      v0[3] = sub_24CC692DC(v18, v19, v32);
      sub_24CCBC120();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v11, v12, "[%s] Peer Browser expected result in state is %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v15, -1, -1);
      MEMORY[0x2533103A0](v14, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    uint64_t v20 = sub_24CCBB810();
    sub_24CC9B724();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, *MEMORY[0x263F3A010], v20);
    swift_willThrow();
    goto LABEL_15;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v0[4] = *v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269821D68);
    swift_willThrowTypedImpl();
LABEL_15:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v28 = (uint64_t (*)(void))v0[1];
    return v28();
  }
  uint64_t v22 = v0[15];
  uint64_t v23 = v0[16];
  uint64_t v24 = v0[13];
  uint64_t v25 = v0[14];
  uint64_t v26 = v0[11];
  uint64_t v27 = v0[12];
  sub_24CC9B77C((uint64_t)v9, v22);
  sub_24CC9B77C(v22, v23);
  type metadata accessor for PeerConnection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v24, v23 + *(int *)(v25 + 24), v26);
  uint64_t v29 = PeerConnection.__allocating_init(endpoint:)(v24);
  sub_24CC9DE28(v0[16], type metadata accessor for NearbyDevice);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v30 = (uint64_t (*)(uint64_t))v0[1];
  return v30(v29);
}

uint64_t sub_24CC9A800()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CC9E15C, 0, 0);
}

uint64_t sub_24CC9A8FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PeerBrowser.State();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - v4;
  sub_24CC999EC((uint64_t)&v10 - v4);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 3, v6))
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 1, 1, v7);
  }
  else
  {
    sub_24CC9E0F8((uint64_t)v5, a1, qword_269822878);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 0, 1, v9);
  }
}

uint64_t sub_24CC9AAC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PeerBrowser.State();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v15 - v7;
  sub_24CC999EC((uint64_t)&v15 - v7);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  uint64_t v10 = *(void *)(v9 - 8);
  int v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 3, v9);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  if (v11 == 2)
  {
    uint64_t v12 = *(void *)(v1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v12 + 16))(v1, &protocol witness table for PeerBrowser<A>, ObjectType, v12);
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v6, 3, 3, v9);
  return sub_24CC99AB0((uint64_t)v6);
}

uint64_t type metadata accessor for PeerBrowser.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CC9ACC8()
{
  uint64_t v0 = type metadata accessor for PeerBrowser.State();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v5 - v1;
  sub_24CC9AAC8();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 3, v3);
  sub_24CC99AB0((uint64_t)v2);
  return sub_24CC99D14();
}

uint64_t sub_24CC9ADA8(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  v2[7] = *v1;
  uint64_t v3 = type metadata accessor for PeerBrowser.State();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  v2[12] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for NearbyDevice(0);
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC9AF68, 0, 0);
}

uint64_t sub_24CC9AF68()
{
  os_log_type_t v38 = v0;
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[12];
  sub_24CC9DC30(v0[5], v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    sub_24CC744B8(v0[12], &qword_269822640);
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24CCBB890();
    __swift_project_value_buffer(v4, (uint64_t)qword_269824810);
    uint64_t v5 = sub_24CCBB870();
    os_log_type_t v6 = sub_24CCBC060();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v37 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      uint64_t v9 = sub_24CCBC5E0();
      v0[2] = sub_24CC692DC(v9, v10, &v37);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v5, v6, "[%s] Device not available", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v8, -1, -1);
      MEMORY[0x2533103A0](v7, -1, -1);
    }
  }
  else
  {
    sub_24CC9B77C(v0[12], v0[16]);
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v12 = v0[15];
    uint64_t v11 = v0[16];
    uint64_t v13 = sub_24CCBB890();
    __swift_project_value_buffer(v13, (uint64_t)qword_269824810);
    sub_24CC9DDC0(v11, v12, type metadata accessor for NearbyDevice);
    uint64_t v14 = sub_24CCBB870();
    os_log_type_t v15 = sub_24CCBC060();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v17 = v0[15];
    if (v16)
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v37 = v19;
      *(_DWORD *)uint64_t v18 = 136315394;
      uint64_t v20 = sub_24CCBC5E0();
      v0[3] = sub_24CC692DC(v20, v21, &v37);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v22 = NearbyDevice.description.getter();
      v0[4] = sub_24CC692DC(v22, v23, &v37);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      sub_24CC9DE28(v17, type metadata accessor for NearbyDevice);
      _os_log_impl(&dword_24CC60000, v14, v15, "[%s] Connecting to %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v19, -1, -1);
      MEMORY[0x2533103A0](v18, -1, -1);
    }
    else
    {
      sub_24CC9DE28(v0[15], type metadata accessor for NearbyDevice);
    }

    uint64_t v24 = v0[11];
    uint64_t v25 = v0[8];
    uint64_t v26 = v0[9];
    sub_24CC999EC(v24);
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
    uint64_t v28 = *(void *)(v27 - 8);
    int v29 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v24, 3, v27);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
    if (v29 == 2)
    {
      uint64_t v30 = v0[6];
      uint64_t v31 = *(void *)(v30 + 24);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v31 + 16))(v30, &protocol witness table for PeerBrowser<A>, ObjectType, v31);
    }
    uint64_t v33 = v0[16];
    uint64_t v34 = v0[10];
    sub_24CC9DDC0(v33, v34, type metadata accessor for NearbyDevice);
    __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v34, 0, 3, v27);
    sub_24CC99AB0(v34);
    sub_24CC9DE28(v33, type metadata accessor for NearbyDevice);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = (uint64_t (*)(void))v0[1];
  return v35();
}

uint64_t sub_24CC9B4EC()
{
  return sub_24CC99D14();
}

uint64_t sub_24CC9B518()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC68708;
  return sub_24CC9A084();
}

uint64_t sub_24CC9B5A8()
{
  return sub_24CC9AAC8();
}

void PeerBrowser.nearbyDeviceProvider(_:didUpdateState:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_24CC9B5D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_24CC6CB14;
  return sub_24CC9ADA8(a5);
}

uint64_t PeerBrowser.nearbyDeviceProvider(_:didUpdateNearbyTrustedDevice:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CC9C6F0(a3);
}

uint64_t sub_24CC9B678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_24CC68584;
  return sub_24CC9ADA8(a5);
}

void sub_24CC9B714(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_24CC9B71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CC9C6F0(a3);
}

unint64_t sub_24CC9B724()
{
  unint64_t result = qword_269822CD0;
  if (!qword_269822CD0)
  {
    sub_24CCBB810();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269822CD0);
  }
  return result;
}

uint64_t sub_24CC9B77C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NearbyDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24CC9B7E0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v105 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v4 + 80);
  uint64_t v103 = *(void *)(v4 + 88);
  uint64_t v104 = v7;
  uint64_t v8 = type metadata accessor for PeerBrowser.State();
  uint64_t v109 = *(void *)(v8 - 8);
  uint64_t v110 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v106 = (uint64_t *)((char *)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v95 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  uint64_t v100 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v101 = v15;
  uint64_t v102 = (uint64_t)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v95 - v16;
  uint64_t v18 = type metadata accessor for NearbyDeviceProviderState(0);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  unint64_t v21 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (void **)((char *)&v95 - v23);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v112 = (uint64_t)&v95 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v95 - v27;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v107 = sub_24CCBB890();
  uint64_t v29 = __swift_project_value_buffer(v107, (uint64_t)qword_269824810);
  sub_24CC9DDC0(a1, (uint64_t)v28, type metadata accessor for NearbyDeviceProviderState);
  uint64_t v113 = v29;
  uint64_t v30 = sub_24CCBB870();
  os_log_type_t v31 = sub_24CCBC060();
  LODWORD(v111) = v31;
  BOOL v32 = os_log_type_enabled(v30, v31);
  unint64_t v108 = v12;
  if (v32)
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v97 = v24;
    uint64_t v34 = v33;
    uint64_t v96 = swift_slowAlloc();
    v116[0] = v96;
    *(_DWORD *)uint64_t v34 = 136315394;
    uint64_t v35 = sub_24CCBC5E0();
    uint64_t v99 = v2;
    uint64_t v115 = sub_24CC692DC(v35, v36, v116);
    uint64_t v98 = a1;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    uint64_t v95 = v34 + 14;
    sub_24CC9DDC0((uint64_t)v28, v112, type metadata accessor for NearbyDeviceProviderState);
    uint64_t v37 = sub_24CCBBE70();
    uint64_t v115 = sub_24CC692DC(v37, v38, v116);
    a1 = v98;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    uint64_t v2 = v99;
    sub_24CC9DE28((uint64_t)v28, type metadata accessor for NearbyDeviceProviderState);
    _os_log_impl(&dword_24CC60000, v30, (os_log_type_t)v111, "[%s] Nearby device provider state update %s", (uint8_t *)v34, 0x16u);
    uint64_t v39 = v96;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v39, -1, -1);
    uint64_t v40 = v34;
    uint64_t v24 = v97;
    MEMORY[0x2533103A0](v40, -1, -1);
  }
  else
  {
    sub_24CC9DE28((uint64_t)v28, type metadata accessor for NearbyDeviceProviderState);
  }

  sub_24CC9DDC0(a1, (uint64_t)v24, type metadata accessor for NearbyDeviceProviderState);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v57 = *v24;
      swift_getErrorValue();
      char v58 = sub_24CCAD2C0(v114);
      id v59 = v57;
      id v60 = v57;
      uint64_t v61 = sub_24CCBB870();
      os_log_type_t v62 = sub_24CCBC040();
      BOOL v63 = os_log_type_enabled(v61, v62);
      if (v58)
      {
        if (v63)
        {
          uint64_t v64 = swift_slowAlloc();
          uint64_t v65 = (void *)swift_slowAlloc();
          uint64_t v66 = swift_slowAlloc();
          v116[0] = v66;
          *(_DWORD *)uint64_t v64 = 136315394;
          uint64_t v67 = sub_24CCBC5E0();
          uint64_t v115 = sub_24CC692DC(v67, v68, v116);
          sub_24CCBC120();
          swift_bridgeObjectRelease();
          *(_WORD *)(v64 + 12) = 2112;
          id v69 = v57;
          uint64_t v70 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v115 = v70;
          sub_24CCBC120();
          *uint64_t v65 = v70;

          _os_log_impl(&dword_24CC60000, v61, v62, "[%s] Browser failed with %@; restarting", (uint8_t *)v64, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
          swift_arrayDestroy();
          MEMORY[0x2533103A0](v65, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x2533103A0](v66, -1, -1);
          MEMORY[0x2533103A0](v64, -1, -1);
        }
        else
        {
        }
        sub_24CC9ACC8();
      }
      else
      {
        if (v63)
        {
          uint64_t v85 = swift_slowAlloc();
          uint64_t v86 = (void *)swift_slowAlloc();
          uint64_t v87 = swift_slowAlloc();
          v116[0] = v87;
          *(_DWORD *)uint64_t v85 = 136315394;
          uint64_t v88 = sub_24CCBC5E0();
          uint64_t v115 = sub_24CC692DC(v88, v89, v116);
          sub_24CCBC120();
          swift_bridgeObjectRelease();
          *(_WORD *)(v85 + 12) = 2112;
          id v90 = v57;
          uint64_t v91 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v115 = v91;
          sub_24CCBC120();
          *uint64_t v86 = v91;

          _os_log_impl(&dword_24CC60000, v61, v62, "[%s] Browser failed with %@; stopping", (uint8_t *)v85, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
          swift_arrayDestroy();
          MEMORY[0x2533103A0](v86, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x2533103A0](v87, -1, -1);
          MEMORY[0x2533103A0](v85, -1, -1);
        }
        else
        {
        }
        uint64_t v92 = (uint64_t)v106;
        void *v106 = v57;
        __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
        swift_storeEnumTagMultiPayload();
        uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v92, 0, 3, v93);
        id v94 = v57;
        sub_24CC99AB0(v92);
        sub_24CC9AAC8();
      }

      break;
    case 2u:
      if (qword_269821AB8 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v107, (uint64_t)qword_269824840);
      unint64_t v71 = sub_24CCBB870();
      os_log_type_t v72 = sub_24CCBC060();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v73 = (uint8_t *)swift_slowAlloc();
        uint64_t v74 = swift_slowAlloc();
        v116[0] = v74;
        *(_DWORD *)uint64_t v73 = 136315138;
        uint64_t v75 = sub_24CCBC5E0();
        uint64_t v115 = sub_24CC692DC(v75, v76, v116);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24CC60000, v71, v72, "[%s] Nearby device provider is not started yet", v73, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v74, -1, -1);
        MEMORY[0x2533103A0](v73, -1, -1);
      }

      break;
    case 3u:
      uint64_t v111 = v18;
      sub_24CC9DDC0(a1, (uint64_t)v21, type metadata accessor for NearbyDeviceProviderState);
      unint64_t v77 = sub_24CCBB870();
      os_log_type_t v78 = sub_24CCBC060();
      if (os_log_type_enabled(v77, v78))
      {
        uint64_t v79 = swift_slowAlloc();
        uint64_t v80 = swift_slowAlloc();
        v116[0] = v80;
        *(_DWORD *)uint64_t v79 = 136315394;
        uint64_t v81 = sub_24CCBC5E0();
        uint64_t v115 = sub_24CC692DC(v81, v82, v116);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v79 + 12) = 2080;
        sub_24CC9DDC0((uint64_t)v21, v112, type metadata accessor for NearbyDeviceProviderState);
        uint64_t v83 = sub_24CCBBE70();
        uint64_t v115 = sub_24CC692DC(v83, v84, v116);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        sub_24CC9DE28((uint64_t)v21, type metadata accessor for NearbyDeviceProviderState);
        _os_log_impl(&dword_24CC60000, v77, v78, "[%s] Browser state %s; invalidating", (uint8_t *)v79, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v80, -1, -1);
        MEMORY[0x2533103A0](v79, -1, -1);
      }
      else
      {
        sub_24CC9DE28((uint64_t)v21, type metadata accessor for NearbyDeviceProviderState);
      }

      sub_24CC9AAC8();
      break;
    default:
      sub_24CC9E0F8((uint64_t)v24, (uint64_t)v17, &qword_269822640);
      uint64_t v41 = sub_24CCBB870();
      os_log_type_t v42 = sub_24CCBC060();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        uint64_t v44 = v17;
        uint64_t v45 = swift_slowAlloc();
        v116[0] = v45;
        *(_DWORD *)uint64_t v43 = 136315138;
        uint64_t v46 = sub_24CCBC5E0();
        uint64_t v115 = sub_24CC692DC(v46, v47, v116);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24CC60000, v41, v42, "[%s] Browser state ready", v43, 0xCu);
        swift_arrayDestroy();
        uint64_t v48 = v45;
        uint64_t v17 = v44;
        MEMORY[0x2533103A0](v48, -1, -1);
        MEMORY[0x2533103A0](v43, -1, -1);
      }

      uint64_t v49 = (uint64_t)v108;
      sub_24CC999EC((uint64_t)v108);
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 48))(v49, 3, v50) == 2)
      {
        (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v49, v110);
        uint64_t v51 = sub_24CCBBFA0();
        uint64_t v52 = (uint64_t)v105;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v105, 1, 1, v51);
        uint64_t v53 = v102;
        sub_24CC9DC30((uint64_t)v17, v102);
        unint64_t v54 = (*(unsigned __int8 *)(v100 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80);
        uint64_t v55 = (void *)swift_allocObject();
        v55[2] = 0;
        v55[3] = 0;
        uint64_t v56 = v103;
        v55[4] = v104;
        v55[5] = v56;
        v55[6] = v2;
        sub_24CC9E0F8(v53, (uint64_t)v55 + v54, &qword_269822640);
        swift_retain();
        sub_24CCA5444(v52, (uint64_t)&unk_2698229B8, (uint64_t)v55);
        swift_release();
        sub_24CC744B8((uint64_t)v17, &qword_269822640);
      }
      else
      {
        sub_24CC744B8((uint64_t)v17, &qword_269822640);
        (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v49, v110);
      }
      break;
  }
}

uint64_t sub_24CC9C6F0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  uint64_t v8 = *(void *)(v36 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v36);
  uint64_t v11 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v31 - v12;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24CCBB890();
  __swift_project_value_buffer(v14, (uint64_t)qword_269824810);
  sub_24CC9DC30(a1, (uint64_t)v13);
  uint64_t v15 = sub_24CCBB870();
  os_log_type_t v16 = sub_24CCBC060();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v31 = v8;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v34 = v7;
    uint64_t v20 = v19;
    uint64_t v38 = v19;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v35 = v2;
    uint64_t v21 = sub_24CCBC5E0();
    uint64_t v33 = v4;
    uint64_t v37 = sub_24CC692DC(v21, v22, &v38);
    uint64_t v32 = a1;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    sub_24CC9DC30((uint64_t)v13, (uint64_t)v11);
    uint64_t v23 = sub_24CCBBE70();
    uint64_t v37 = sub_24CC692DC(v23, v24, &v38);
    a1 = v32;
    uint64_t v2 = v35;
    sub_24CCBC120();
    uint64_t v4 = v33;
    swift_bridgeObjectRelease();
    sub_24CC744B8((uint64_t)v13, &qword_269822640);
    _os_log_impl(&dword_24CC60000, v15, v16, "[%s] Did update nearby trusted device: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    uint64_t v7 = v34;
    MEMORY[0x2533103A0](v25, -1, -1);
    uint64_t v26 = v18;
    uint64_t v8 = v31;
    MEMORY[0x2533103A0](v26, -1, -1);
  }
  else
  {
    sub_24CC744B8((uint64_t)v13, &qword_269822640);
  }

  uint64_t v27 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v7, 1, 1, v27);
  sub_24CC9DC30(a1, (uint64_t)v11);
  unint64_t v28 = (*(unsigned __int8 *)(v8 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v29 = (void *)swift_allocObject();
  v29[2] = 0;
  v29[3] = 0;
  v29[4] = *(void *)(v4 + 80);
  v29[5] = *(void *)(v4 + 88);
  v29[6] = v2;
  sub_24CC9E0F8((uint64_t)v11, (uint64_t)v29 + v28, &qword_269822640);
  swift_retain();
  sub_24CCA5444((uint64_t)v7, (uint64_t)&unk_2698229A8, (uint64_t)v29);
  return swift_release();
}

uint64_t sub_24CC9CAF0()
{
  uint64_t result = type metadata accessor for PeerBrowser.State();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for PeerBrowser()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PeerBrowser(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PeerBrowser);
}

uint64_t dispatch thunk of PeerBrowser.__allocating_init(nearbyDeviceProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of PeerBrowser.activate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of PeerBrowser.peerConnection()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 152) + **(int **)(*(void *)v0 + 152));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6C264;
  return v4();
}

uint64_t dispatch thunk of PeerBrowser.invalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

void sub_24CC9CD10()
{
  sub_24CC9DBBC();
  if (v0 <= 0x3F) {
    swift_initEnumMetadataSinglePayload();
  }
}

char *sub_24CC9CD88(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = &v9[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v10 = *a2;
        uint64_t v11 = v10;
        *(void *)a1 = v10;
      }
      else
      {
        uint64_t v12 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v12;
        uint64_t v13 = a2[3];
        *((void *)a1 + 2) = a2[2];
        *((void *)a1 + 3) = v13;
        uint64_t v14 = *(int *)(type metadata accessor for NearbyDevice(0) + 24);
        uint64_t v15 = &a1[v14];
        uint64_t v19 = (char *)a2 + v14;
        uint64_t v16 = sub_24CCBB8F0();
        uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v17(v15, v19, v16);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

void sub_24CC9CF94(void **a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  if (!(*(unsigned int (**)(void **, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 3, v2))
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v3 = *a1;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = (char *)a1 + *(int *)(type metadata accessor for NearbyDevice(0) + 24);
      uint64_t v5 = sub_24CCBB8F0();
      uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
      v6(v4, v5);
    }
  }
}

void **sub_24CC9D0A8(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = *a2;
      id v9 = v8;
      *a1 = v8;
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      uint64_t v12 = *(int *)(type metadata accessor for NearbyDevice(0) + 24);
      uint64_t v13 = (char *)a1 + v12;
      uint64_t v17 = (char *)a2 + v12;
      uint64_t v14 = sub_24CCBB8F0();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15(v13, v17, v14);
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void **, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void **sub_24CC9D278(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (v9)
  {
    if (!v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v11 = *a2;
        id v12 = v11;
        *a1 = v11;
      }
      else
      {
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        uint64_t v15 = *(int *)(type metadata accessor for NearbyDevice(0) + 24);
        uint64_t v16 = (char *)a1 + v15;
        uint64_t v25 = (char *)a2 + v15;
        uint64_t v17 = sub_24CCBB8F0();
        uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v18(v16, v25, v17);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(void **, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
      return a1;
    }
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_24CC744B8((uint64_t)a1, &qword_269822860);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_24CC744B8((uint64_t)a1, qword_269822878);
    __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = *a2;
      id v14 = v13;
      *a1 = v13;
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      uint64_t v20 = *(int *)(type metadata accessor for NearbyDevice(0) + 24);
      uint64_t v21 = (char *)a1 + v20;
      unint64_t v22 = (char *)a2 + v20;
      uint64_t v23 = sub_24CCBB8F0();
      unint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v24(v21, v22, v23);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_24CC9D584(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      long long v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      uint64_t v10 = *(int *)(type metadata accessor for NearbyDevice(0) + 24);
      uint64_t v11 = (char *)a1 + v10;
      id v12 = (char *)a2 + v10;
      uint64_t v13 = sub_24CCBB8F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

_OWORD *sub_24CC9D724(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      if (a1 == a2) {
        return a1;
      }
      sub_24CC744B8((uint64_t)a1, qword_269822878);
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
      if (!swift_getEnumCaseMultiPayload())
      {
        long long v20 = a2[1];
        *a1 = *a2;
        a1[1] = v20;
        uint64_t v21 = *(int *)(type metadata accessor for NearbyDevice(0) + 24);
        unint64_t v22 = (char *)a1 + v21;
        uint64_t v23 = (char *)a2 + v21;
        uint64_t v24 = sub_24CCBB8F0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      size_t v12 = *(void *)(*(void *)(v13 - 8) + 64);
      goto LABEL_8;
    }
    sub_24CC744B8((uint64_t)a1, &qword_269822860);
LABEL_7:
    size_t v12 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v12);
    return a1;
  }
  if (v10) {
    goto LABEL_7;
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_269822878);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    long long v14 = a2[1];
    *a1 = *a2;
    a1[1] = v14;
    uint64_t v15 = *(int *)(type metadata accessor for NearbyDevice(0) + 24);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_24CCBB8F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t sub_24CC9D9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC9D9D0);
}

uint64_t sub_24CC9D9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t sub_24CC9DA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC9DA54);
}

uint64_t sub_24CC9DA54(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_24CC9DADC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 3, v2);
}

uint64_t sub_24CC9DB48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822860);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 3, v4);
}

void sub_24CC9DBBC()
{
  if (!qword_269822998)
  {
    type metadata accessor for NearbyDevice(255);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269821D68);
    unint64_t v0 = sub_24CCBC580();
    if (!v1) {
      atomic_store(v0, &qword_269822998);
    }
  }
}

uint64_t sub_24CC9DC30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC9DC9C()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269822640) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24CC68584;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24CC68584;
  return sub_24CC9ADA8(v3);
}

uint64_t sub_24CC9DDC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CC9DE28(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269822640) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = type metadata accessor for NearbyDevice(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = v0 + v3 + *(int *)(v5 + 24);
    uint64_t v7 = sub_24CCBB8F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24CC9DFD4()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269822640) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24CC6CB14;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24CC6CB14;
  return sub_24CC9ADA8(v3);
}

uint64_t sub_24CC9E0F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CC9E160(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_24CC9E8A8();
  uint64_t v8 = sub_24CCBC140();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v10 = v8 + 16 * v9;
    a1 = *(void *)(v10 + 16);
    a2 = *(void *)(v10 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_24CC9E7B8(46, 0xE100000000000000, a1, a2);
  uint64_t v11 = sub_24CCBBF00();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  MEMORY[0x25330F4B0](v11, v13, v15, v17);
  swift_bridgeObjectRelease();
  sub_24CC9E7B8(40, 0xE100000000000000, a3, a4);
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_24CCBBF00();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  MEMORY[0x25330F4B0](v18, v20, v22, v24);
  swift_bridgeObjectRelease();
  uint64_t v25 = pthread_self();
  pthread_mach_thread_np(v25);
  sub_24CCBC460();
  sub_24CCBBEC0();
  swift_bridgeObjectRelease();
  sub_24CCBBEC0();
  sub_24CCBBEC0();
  swift_bridgeObjectRelease();
  sub_24CCBBEC0();
  sub_24CCBBEC0();
  swift_bridgeObjectRelease();
  return 91;
}

void sub_24CC9E3E8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = sub_24CC9E160(a1, a2, a3, a4);
  unint64_t v6 = v5;
  swift_bridgeObjectRetain();
  oslog = sub_24CCBB870();
  os_log_type_t v7 = sub_24CCBC060();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v11 = v9;
    *(_DWORD *)uint64_t v8 = 136446210;
    swift_bridgeObjectRetain();
    sub_24CC692DC(v4, v6, &v11);
    sub_24CCBC120();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CC60000, oslog, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v9, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_24CC9E574(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_269824798);
}

uint64_t sub_24CC9E5A0(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_2698247B0);
}

uint64_t sub_24CC9E5C8(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_2698247C8);
}

uint64_t sub_24CC9E5E8(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_2698247E0);
}

uint64_t sub_24CC9E604(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_2698247F8);
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

uint64_t sub_24CC9E688(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_269824810);
}

uint64_t sub_24CC9E6B4(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_269824828);
}

uint64_t sub_24CC9E6DC(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_269824840);
}

uint64_t sub_24CC9E704(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_269824858);
}

uint64_t sub_24CC9E71C(uint64_t a1)
{
  return sub_24CC9E740(a1, qword_269824870);
}

uint64_t sub_24CC9E740(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24CCBB890();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24CCBB880();
}

unint64_t sub_24CC9E7B8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_24CCBBEF0() != a1 || v9 != a2)
  {
    char v10 = sub_24CCBC480();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_24CCBBEB0();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_24CC9E8A8()
{
  unint64_t result = qword_2698229C0;
  if (!qword_2698229C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698229C0);
  }
  return result;
}

uint64_t sub_24CC9E8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D48);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D50);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) == 1)
  {
    sub_24CC744B8(a1, &qword_269821D48);
    sub_24CC6AB08(a2, (uint64_t)v7);
    uint64_t v12 = sub_24CCBB520();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a2, v12);
    return sub_24CC744B8((uint64_t)v7, &qword_269821D48);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v11, a1, v8);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24CC8BC68((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v17;
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_24CCBB520();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a2, v15);
  }
}

uint64_t sub_24CC9EB2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (*(void *)(a1 + 24))
  {
    sub_24CC76204((long long *)a1, (uint64_t)v14);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_24CC8C3D0(v14, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24CC744B8(a1, &qword_2698229C8);
    unint64_t v7 = sub_24CC9F35C(a2);
    if (v8)
    {
      unint64_t v9 = v7;
      char v10 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = *v2;
      uint64_t v13 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((v10 & 1) == 0)
      {
        sub_24CCA0418();
        uint64_t v11 = v13;
      }
      sub_24CC76204((long long *)(*(void *)(v11 + 56) + 40 * v9), (uint64_t)v14);
      sub_24CC9F798(v9, v11);
      *uint64_t v3 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
      memset(v14, 0, sizeof(v14));
    }
    return sub_24CC744B8((uint64_t)v14, &qword_2698229C8);
  }
}

uint64_t static Dependencies.DependenciesError.== infix(_:_:)()
{
  return 1;
}

uint64_t Dependencies.DependenciesError.hash(into:)()
{
  return sub_24CCBC550();
}

uint64_t Dependencies.DependenciesError.hashValue.getter()
{
  return sub_24CCBC570();
}

uint64_t Dependencies.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_24CC75FE0(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t Dependencies.init()()
{
  *(void *)(v0 + 16) = sub_24CC75FE0(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t sub_24CC9ED28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v3 + 16))(v5);
  _OWORD v9[3] = type metadata accessor for Dependencies.Dependency();
  v9[4] = swift_getWitnessTable();
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v9);
  (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v3 + 32))(boxed_opaque_existential_1Tm, v5, a2);
  swift_beginAccess();
  sub_24CC9EB2C((uint64_t)v9, a2);
  return swift_endAccess();
}

uint64_t sub_24CC9EE60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_24CCBC110();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v23 - v7;
  swift_beginAccess();
  uint64_t v9 = *(void *)(v2 + 16);
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_24CC9F35C(a1), (v11 & 1) != 0))
  {
    sub_24CC7B4B8(*(void *)(v9 + 56) + 40 * v10, (uint64_t)&v27);
    uint64_t v12 = *((void *)&v28 + 1);
    if (*((void *)&v28 + 1))
    {
      uint64_t v13 = v29;
      uint64_t v14 = __swift_project_boxed_opaque_existential_1(&v27, *((uint64_t *)&v28 + 1));
      uint64_t v26 = &v23;
      uint64_t v15 = *(void *)(v12 - 8);
      uint64_t v32 = a2;
      uint64_t v16 = v15;
      MEMORY[0x270FA5388](v14);
      uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v16 + 16))(v18);
      sub_24CC744B8((uint64_t)&v27, &qword_2698229C8);
      uint64_t v24 = v13;
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v13 + 16);
      *((void *)&v31 + 1) = swift_getAssociatedTypeWitness();
      __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v30);
      v25(v12, v24);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v12);
      a2 = v32;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
  }
  sub_24CC744B8((uint64_t)&v27, &qword_2698229C8);
  long long v30 = 0u;
  long long v31 = 0u;
LABEL_7:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822010);
  char v19 = swift_dynamicCast();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56);
  if (v19)
  {
    uint64_t v21 = *(void *)(a1 - 8);
    v20(v8, 0, 1, a1);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v21 + 32))(a2, v8, a1);
  }
  else
  {
    v20(v8, 1, 1, a1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_24CCA05F8();
    swift_allocError();
    return swift_willThrow();
  }
}

uint64_t Dependencies.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Dependencies.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_24CC9F210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

unint64_t sub_24CC9F244(uint64_t a1)
{
  sub_24CCBB520();
  sub_24CCA0ED8((unint64_t *)&qword_269822600);
  uint64_t v2 = sub_24CCBBDD0();
  return sub_24CC9F944(a1, v2);
}

unint64_t sub_24CC9F2C8(uint64_t a1)
{
  sub_24CCBBE50();
  sub_24CCBC540();
  sub_24CCBBEA0();
  uint64_t v2 = sub_24CCBC570();
  swift_bridgeObjectRelease();
  return sub_24CC9FAF0(a1, v2);
}

unint64_t sub_24CC9F35C(uint64_t a1)
{
  uint64_t v2 = sub_24CCBC530();
  return sub_24CC9FC68(a1, v2);
}

unint64_t sub_24CC9F3A0(uint64_t a1, uint64_t a2)
{
  sub_24CCBC540();
  sub_24CCBBEA0();
  uint64_t v4 = sub_24CCBC570();
  return sub_24CC9FD04(a1, a2, v4);
}

unint64_t sub_24CC9F418(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x25330FB40](*(void *)(v1 + 40), a1, 4);
  return sub_24CC9FDE8(a1, v3);
}

unint64_t sub_24CC9F460(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CCBB520();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388]();
  char v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_24CCBC180();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_24CCA0ED8((unint64_t *)&qword_269822600);
        uint64_t v19 = sub_24CCBBDD0();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269821D50) - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *uint64_t v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_24CC9F798(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_24CCBC180();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (void *)(v11 + 8 * v6);
        unint64_t result = sub_24CCBC530();
        unint64_t v13 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 >= v8 && v3 >= (uint64_t)v13)
          {
LABEL_16:
            uint64_t v16 = (void *)(v11 + 8 * v3);
            if (v3 != v6 || v16 >= v12 + 1) {
              void *v16 = *v12;
            }
            uint64_t v17 = *(void *)(a2 + 56);
            unint64_t v18 = v17 + 40 * v3;
            uint64_t v19 = (long long *)(v17 + 40 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v18 >= (unint64_t)v19 + 40))
            {
              long long v9 = *v19;
              long long v10 = v19[1];
              *(void *)(v18 + 32) = *((void *)v19 + 4);
              *(_OWORD *)unint64_t v18 = v9;
              *(_OWORD *)(v18 + 16) = v10;
              int64_t v3 = v6;
            }
          }
        }
        else if (v13 >= v8 || v3 >= (uint64_t)v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_24CC9F944(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24CCBB520();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    unint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24CCA0ED8(&qword_269822A60);
      char v15 = sub_24CCBBDF0();
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

unint64_t sub_24CC9FAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24CCBBE50();
    uint64_t v8 = v7;
    if (v6 == sub_24CCBBE50() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24CCBC480();
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
          uint64_t v13 = sub_24CCBBE50();
          uint64_t v15 = v14;
          if (v13 == sub_24CCBBE50() && v15 == v16) {
            break;
          }
          char v18 = sub_24CCBC480();
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

unint64_t sub_24CC9FC68(uint64_t a1, uint64_t a2)
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

unint64_t sub_24CC9FD04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24CCBC480() & 1) == 0)
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
      while (!v14 && (sub_24CCBC480() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24CC9FDE8(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_24CC9FE84()
{
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D50);
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_24CCBB520();
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698225F8);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_24CCBC3F0();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v46 = v4;
  if (!v5)
  {
    unint64_t result = (void *)swift_release();
    uint64_t v31 = v46;
    uint64_t v30 = v32;
LABEL_25:
    uint64_t *v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  unint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    unint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v46;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v11 = -1;
  uint64_t v43 = v3;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v45;
  uint64_t v14 = v44;
  uint64_t v37 = v45 + 16;
  uint64_t v38 = v44 + 16;
  uint64_t v35 = v45 + 32;
  uint64_t v36 = v44 + 32;
  uint64_t v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  uint64_t v18 = v46;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v47 = v9;
      unint64_t v20 = v19 | (v9 << 6);
      uint64_t v21 = v43;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v21 = v43;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    int64_t v28 = v9 + 1;
    if (!v27)
    {
      int64_t v28 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v28);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    int64_t v47 = v28;
    unint64_t v20 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v14 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v21 + 48) + v22, v16);
    unint64_t v23 = *(void *)(v13 + 72) * v20;
    unint64_t v24 = *(void *)(v21 + 56) + v23;
    uint64_t v25 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v41, v24, v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v18 + 48) + v22, v15, v16);
    unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v18 + 56) + v23, v25, v17);
    int64_t v9 = v47;
  }
  int64_t v29 = v26 + 2;
  if (v29 >= v34)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    uint64_t v30 = v32;
    uint64_t v31 = v46;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24CCA0230()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698220E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CCBC3F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_24CC6CA84(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_24CC761F4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24CCA0418()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698220D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CCBC3F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 40 * v15;
    sub_24CC7B4B8(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    unint64_t result = (void *)sub_24CC76204(v22, *(void *)(v4 + 56) + v18);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for Dependencies.Dependency()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_24CCA05F8()
{
  unint64_t result = qword_2698229D0;
  if (!qword_2698229D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698229D0);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1Tm(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_24CCA06B4()
{
  unint64_t result = qword_2698229D8[0];
  if (!qword_2698229D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698229D8);
  }
  return result;
}

uint64_t type metadata accessor for Dependencies()
{
  return self;
}

uint64_t method lookup function for Dependencies(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Dependencies);
}

uint64_t dispatch thunk of Dependencies.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of Dependencies.register<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of Dependencies.throwingResolve<A>()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

unsigned char *storeEnumTagSinglePayload for Dependencies.DependenciesError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CCA0850);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Dependencies.DependenciesError()
{
  return &type metadata for Dependencies.DependenciesError;
}

uint64_t sub_24CCA0888()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24CCA0918(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_24CCA09D0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_24CCA09FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24CCA0A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24CCA0A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24CCA0AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24CCA0B3C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_24CCA0C98(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x24CCA0EB0);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t sub_24CCA0ED8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24CCBB520();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CCA0F1C(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_24CC9F35C(v2), (v5 & 1) != 0))
  {
    sub_24CC7B4B8(*(void *)(v3 + 56) + 40 * v4, (uint64_t)&v14);
    uint64_t v6 = *((void *)&v15 + 1);
    if (*((void *)&v15 + 1))
    {
      uint64_t v7 = v16;
      size_t v8 = __swift_project_boxed_opaque_existential_1(&v14, *((uint64_t *)&v15 + 1));
      uint64_t v9 = *(void *)(v6 - 8);
      MEMORY[0x270FA5388](v8);
      int v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v9 + 16))(v11);
      sub_24CC744B8((uint64_t)&v14, &qword_2698229C8);
      unsigned int v12 = *(void (**)(uint64_t, uint64_t))(v7 + 16);
      *((void *)&v18 + 1) = swift_getAssociatedTypeWitness();
      __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v17);
      v12(v6, v7);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_24CC744B8((uint64_t)&v14, &qword_2698229C8);
  long long v17 = 0u;
  long long v18 = 0u;
LABEL_7:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822010);
  if (swift_dynamicCast()) {
    return v14;
  }
  sub_24CCA05F8();
  swift_allocError();
  return swift_willThrow();
}

uint64_t sub_24CCA115C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822B68);
  MEMORY[0x270FA5388](v3 - 8);
  char v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CCBB6D0();
  swift_beginAccess();
  uint64_t v7 = *(void *)(v1 + 16);
  if (*(void *)(v7 + 16) && (unint64_t v8 = sub_24CC9F35C(v6), (v9 & 1) != 0))
  {
    sub_24CC7B4B8(*(void *)(v7 + 56) + 40 * v8, (uint64_t)&v22);
    uint64_t v10 = *((void *)&v23 + 1);
    if (*((void *)&v23 + 1))
    {
      uint64_t v11 = v24;
      unsigned int v12 = __swift_project_boxed_opaque_existential_1(&v22, *((uint64_t *)&v23 + 1));
      v21[1] = v21;
      uint64_t v13 = *(void *)(v10 - 8);
      MEMORY[0x270FA5388](v12);
      long long v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v13 + 16))(v15);
      sub_24CC744B8((uint64_t)&v22, &qword_2698229C8);
      uint64_t v27 = a1;
      uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 16);
      *((void *)&v26 + 1) = swift_getAssociatedTypeWitness();
      __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v25);
      v16(v10, v11);
      a1 = v27;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v10);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
  }
  sub_24CC744B8((uint64_t)&v22, &qword_2698229C8);
  long long v25 = 0u;
  long long v26 = 0u;
LABEL_7:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822010);
  char v17 = swift_dynamicCast();
  long long v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  if (v17)
  {
    uint64_t v19 = *(void *)(v6 - 8);
    v18(v5, 0, 1, v6);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a1, v5, v6);
  }
  else
  {
    v18(v5, 1, 1, v6);
    sub_24CC744B8((uint64_t)v5, &qword_269822B68);
    sub_24CCA05F8();
    swift_allocError();
    return swift_willThrow();
  }
}

uint64_t sub_24CCA1484@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AD0);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_24CC9F35C(v3), (v6 & 1) != 0))
  {
    sub_24CC7B4B8(*(void *)(v4 + 56) + 40 * v5, (uint64_t)&v15);
    uint64_t v7 = *((void *)&v16 + 1);
    if (*((void *)&v16 + 1))
    {
      uint64_t v8 = v17;
      char v9 = __swift_project_boxed_opaque_existential_1(&v15, *((uint64_t *)&v16 + 1));
      unint64_t v20 = &v15;
      uint64_t v10 = *(void *)(v7 - 8);
      MEMORY[0x270FA5388](v9);
      unsigned int v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v10 + 16))(v12);
      sub_24CC744B8((uint64_t)&v15, &qword_2698229C8);
      uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v8 + 16);
      *((void *)&v19 + 1) = swift_getAssociatedTypeWitness();
      __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v18);
      v13(v7, v8);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v7);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
  }
  sub_24CC744B8((uint64_t)&v15, &qword_2698229C8);
  long long v18 = 0u;
  long long v19 = 0u;
LABEL_7:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822010);
  if (swift_dynamicCast()) {
    return sub_24CC76204(&v15, a1);
  }
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  sub_24CC744B8((uint64_t)&v15, qword_269822B70);
  sub_24CCA05F8();
  swift_allocError();
  return swift_willThrow();
}

uint64_t sub_24CCA16F0(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_24CC9F35C(v2), (v5 & 1) != 0))
  {
    sub_24CC7B4B8(*(void *)(v3 + 56) + 40 * v4, (uint64_t)&v14);
    uint64_t v6 = *((void *)&v15 + 1);
    if (*((void *)&v15 + 1))
    {
      uint64_t v7 = v16;
      uint64_t v8 = __swift_project_boxed_opaque_existential_1(&v14, *((uint64_t *)&v15 + 1));
      uint64_t v9 = *(void *)(v6 - 8);
      MEMORY[0x270FA5388](v8);
      uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v9 + 16))(v11);
      sub_24CC744B8((uint64_t)&v14, &qword_2698229C8);
      unsigned int v12 = *(void (**)(uint64_t, uint64_t))(v7 + 16);
      *((void *)&v18 + 1) = swift_getAssociatedTypeWitness();
      __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v17);
      v12(v6, v7);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_24CC744B8((uint64_t)&v14, &qword_2698229C8);
  long long v17 = 0u;
  long long v18 = 0u;
LABEL_7:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822010);
  if (swift_dynamicCast()) {
    return v14;
  }
  sub_24CCA05F8();
  swift_allocError();
  return swift_willThrow();
}

uint64_t sub_24CCA1924(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_24CC9F35C(v2), (v5 & 1) != 0))
  {
    sub_24CC7B4B8(*(void *)(v3 + 56) + 40 * v4, (uint64_t)&v14);
    uint64_t v6 = *((void *)&v15 + 1);
    if (*((void *)&v15 + 1))
    {
      uint64_t v7 = v16;
      uint64_t v8 = __swift_project_boxed_opaque_existential_1(&v14, *((uint64_t *)&v15 + 1));
      uint64_t v9 = *(void *)(v6 - 8);
      MEMORY[0x270FA5388](v8);
      uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v9 + 16))(v11);
      sub_24CC744B8((uint64_t)&v14, &qword_2698229C8);
      unsigned int v12 = *(void (**)(uint64_t, uint64_t))(v7 + 16);
      *((void *)&v18 + 1) = swift_getAssociatedTypeWitness();
      __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v17);
      v12(v6, v7);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_24CC744B8((uint64_t)&v14, &qword_2698229C8);
  long long v17 = 0u;
  long long v18 = 0u;
LABEL_7:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822010);
  if (swift_dynamicCast()) {
    return v14;
  }
  sub_24CCA05F8();
  swift_allocError();
  return swift_willThrow();
}

uint64_t sub_24CCA1B58()
{
  return sub_24CCA2314((uint64_t)&unk_269822AA0, (uint64_t (*)(void))sub_24CCA1924);
}

uint64_t sub_24CCA1B90@<X0>(uint64_t a1@<X8>)
{
  sub_24CCA1484((uint64_t)&v3);
  return sub_24CC76204(&v3, a1);
}

uint64_t sub_24CCA1E6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822B68);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CCA115C((uint64_t)v4);
  uint64_t v5 = sub_24CCBB6D0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
}

uint64_t sub_24CCA2248()
{
  return sub_24CCA2314(MEMORY[0x263F39F00], (uint64_t (*)(void))sub_24CCA0F1C);
}

uint64_t sub_24CCA228C()
{
  return sub_24CCA2314(MEMORY[0x263F39FD0], (uint64_t (*)(void))sub_24CCA0F1C);
}

uint64_t sub_24CCA22D0()
{
  return sub_24CCA2314((uint64_t)type metadata accessor for NotificationController, (uint64_t (*)(void))sub_24CCA0F1C);
}

uint64_t sub_24CCA2314(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_24CCA25B0(uint64_t *a1)
{
  return sub_24CCA16F0(a1);
}

uint64_t Daemon.bundleIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

__n128 Daemon.init()@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24CCA3E54();
  Daemon.init(dependencies:)(v2, &v4);
  __n128 result = v5;
  *(void *)a1 = v4;
  *(__n128 *)(a1 + 8) = result;
  return result;
}

uint64_t Daemon.init(dependencies:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_24CCA2314((uint64_t)&qword_269822A70, (uint64_t (*)(void))sub_24CCA1924);
  uint64_t v15 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822A68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CCBD9B0;
  uint64_t v6 = type metadata accessor for GuestUserHandoverServer();
  uint64_t v7 = (void *)swift_allocObject();
  swift_retain();
  long long v7[2] = sub_24CCA2314((uint64_t)&qword_269822A70, (uint64_t (*)(void))sub_24CCA1924);
  uint64_t v8 = sub_24CCA25B0(&qword_269822AA8);
  uint64_t v10 = v9;
  swift_release();
  v7[3] = v8;
  v7[4] = v10;
  *(void *)(inited + 56) = v6;
  *(void *)(inited + 64) = &off_26FF2C388;
  *(void *)(inited + 32) = v7;
  *(void *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_269822A70);
  *(void *)(inited + 104) = &protocol witness table for XPCServer<A>;
  *(void *)(inited + 72) = v4;
  swift_retain();
  swift_retain();
  uint64_t v11 = sub_24CCA48EC(a1);
  uint64_t v13 = v12;
  swift_release();
  *(void *)(inited + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_269822A78);
  *(void *)(inited + 144) = &off_26FF2BD88;
  *(void *)(inited + 112) = v11;
  *(void *)(inited + 120) = v13;
  sub_24CCA31C8(inited);
  swift_release();
  uint64_t result = swift_release();
  *a2 = 0xD000000000000018;
  a2[1] = 0x800000024CCBFA30;
  a2[2] = v15;
  return result;
}

uint64_t Daemon.activate()()
{
  *(void *)(v1 + 56) = *(void *)(v0 + 16);
  return MEMORY[0x270FA2498](sub_24CCA2AFC, 0, 0);
}

uint64_t sub_24CCA2AFC()
{
  if (qword_269821A98 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_2698247E0);
  sub_24CC9E3E8(0xD000000000000055, 0x800000024CCBFA50, 0x6574617669746361, 0xEA00000000002928);
  if (qword_269821AD0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  objc_msgSend((id)qword_269822EE0, sel_ds_log);
  uint64_t v3 = *(void *)(v2 + 16);
  v0[8] = v3;
  if (v3)
  {
    uint64_t v4 = v0[7];
    v0[9] = 0;
    uint64_t v5 = v4 + 32;
    swift_bridgeObjectRetain();
    sub_24CC7B4B8(v5, (uint64_t)(v0 + 2));
    uint64_t v6 = v0[5];
    uint64_t v7 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v6);
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v7 + 8) + **(int **)(v7 + 8));
    uint64_t v8 = (void *)swift_task_alloc();
    v0[10] = v8;
    void *v8 = v0;
    v8[1] = sub_24CCA2D20;
    return v11(v6, v7);
  }
  else
  {
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

uint64_t sub_24CCA2D20()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CCA2E1C, 0, 0);
}

uint64_t sub_24CCA2E1C()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9] + 1;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t v5 = v0[9] + 1;
    v0[9] = v5;
    sub_24CC7B4B8(v0[7] + 40 * v5 + 32, (uint64_t)(v0 + 2));
    uint64_t v6 = v0[5];
    uint64_t v7 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v6);
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v7 + 8) + **(int **)(v7 + 8));
    uint64_t v8 = (void *)swift_task_alloc();
    v0[10] = v8;
    void *v8 = v0;
    v8[1] = sub_24CCA2D20;
    return v9(v6, v7);
  }
}

uint64_t sub_24CCA2F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24CCA2FB8, 0, 0);
}

uint64_t sub_24CCA2FB8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return MEMORY[0x270FA2498](sub_24CCA3024, v1, 0);
}

uint64_t sub_24CCA3024()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = *(void *)(v2 + 192);
  *(void *)(v2 + 192) = sub_24CCA5248;
  *(void *)(v2 + 200) = v1;
  sub_24CC7A854(v3);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[4] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCA30D4;
  return sub_24CC809CC();
}

uint64_t sub_24CCA30D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CCA31C8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_24CCA3C34(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[5 * v9 + 4];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822A98);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_24CCBC420();
  __break(1u);
  return result;
}

Swift::Void __swiftcall Daemon.bootstrapSandbox()()
{
  uint64_t v0 = sub_24CCBBF30();
  *(void *)(v0 + 16) = 1024;
  bzero((void *)(v0 + 32), 0x400uLL);
  sub_24CCBBE80();
  swift_bridgeObjectRetain();
  int v1 = _set_user_dir_suffix();
  uint64_t v2 = swift_release();
  if (!v1)
  {
    int v7 = MEMORY[0x25330EEC0](v2);
    if (strerror(v7)) {
      goto LABEL_20;
    }
    __break(1u);
    goto LABEL_16;
  }
  size_t v3 = *(void *)(v0 + 16);
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v0 = (uint64_t)sub_24CCA3D58(0, *(void *)(v0 + 16), 0, (char *)v0);
  }
  if (!confstr(65537, (char *)(v0 + 32), v3))
  {
LABEL_16:
    int v8 = MEMORY[0x25330EEC0]();
    if (strerror(v8))
    {
      sub_24CCBBED0();
      uint64_t v21 = 0;
      unint64_t v22 = 0xE000000000000000;
      sub_24CCBC2C0();
      sub_24CCBBEC0();
      swift_bridgeObjectRetain();
      sub_24CCBBEC0();
      swift_bridgeObjectRelease();
      uint64_t v14 = sub_24CCBBEC0();
      MEMORY[0x25330EEC0](v14);
      sub_24CCBC460();
      sub_24CCBBEC0();
      swift_bridgeObjectRelease();
      sub_24CCBBEC0();
      sub_24CCBBEC0();
      if (qword_269821A98 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_24CCBB890();
      __swift_project_value_buffer(v15, (uint64_t)qword_2698247E0);
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_24CCBB870();
      os_log_type_t v13 = sub_24CCBC040();
      if (os_log_type_enabled(v12, v13)) {
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    __break(1u);
    goto LABEL_18;
  }
  if (!mkdir((const char *)(v0 + 32), 0x2BCu) && MEMORY[0x25330EEC0]() != 17)
  {
LABEL_18:
    int v9 = MEMORY[0x25330EEC0]();
    if (strerror(v9))
    {
      sub_24CCBBED0();
      uint64_t v21 = 0;
      unint64_t v22 = 0xE000000000000000;
      sub_24CCBC2C0();
      sub_24CCBBEC0();
      swift_bridgeObjectRetain();
      sub_24CCBBEC0();
      swift_bridgeObjectRelease();
      uint64_t v16 = sub_24CCBBEC0();
      MEMORY[0x25330EEC0](v16);
      sub_24CCBC460();
      sub_24CCBBEC0();
      swift_bridgeObjectRelease();
      sub_24CCBBEC0();
      sub_24CCBBEC0();
      if (qword_269821A98 != -1) {
        swift_once();
      }
      uint64_t v17 = sub_24CCBB890();
      __swift_project_value_buffer(v17, (uint64_t)qword_2698247E0);
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_24CCBB870();
      os_log_type_t v13 = sub_24CCBC040();
      if (os_log_type_enabled(v12, v13)) {
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    __break(1u);
LABEL_20:
    sub_24CCBBED0();
    uint64_t v21 = 0;
    unint64_t v22 = 0xE000000000000000;
    sub_24CCBC2C0();
    sub_24CCBBEC0();
    swift_bridgeObjectRetain();
    sub_24CCBBEC0();
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_24CCBBEC0();
    MEMORY[0x25330EEC0](v10);
    sub_24CCBC460();
    sub_24CCBBEC0();
    swift_bridgeObjectRelease();
    sub_24CCBBEC0();
    sub_24CCBBEC0();
    if (qword_269821A98 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24CCBB890();
    __swift_project_value_buffer(v11, (uint64_t)qword_2698247E0);
    swift_bridgeObjectRetain_n();
    uint64_t v12 = sub_24CCBB870();
    os_log_type_t v13 = sub_24CCBC040();
    if (os_log_type_enabled(v12, v13))
    {
LABEL_33:
      long long v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v21 = v19;
      *(_DWORD *)long long v18 = 136446210;
      swift_bridgeObjectRetain();
      sub_24CC692DC(0, 0xE000000000000000, &v21);
      sub_24CCBC120();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24CC60000, v12, v13, "Sandbox bootstrap error: %{public}s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v19, -1, -1);
      MEMORY[0x2533103A0](v18, -1, -1);

LABEL_35:
      sub_24CCBC3D0();
      __break(1u);
      return;
    }
LABEL_34:

    swift_bridgeObjectRelease_n();
    goto LABEL_35;
  }
  swift_bridgeObjectRelease();
  if (qword_269821A98 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24CCBB890();
  __swift_project_value_buffer(v4, (uint64_t)qword_2698247E0);
  oslog = sub_24CCBB870();
  os_log_type_t v5 = sub_24CCBC060();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_24CC60000, oslog, v5, "Sandbox bootstrapped successfully", v6, 2u);
    MEMORY[0x2533103A0](v6, -1, -1);
  }
}

void *sub_24CCA3C34(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269822A68);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
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
    sub_24CCA4E24(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_24CCA3D58(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269822A90);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24CCA4F34(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CCA3E54()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v0 - 8);
  char v58 = (char *)&v52 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24CCBB6D0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v60 = v2;
  uint64_t v61 = v3;
  MEMORY[0x270FA5388](v2);
  id v59 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for NearbyDeviceProvider.State(0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  unint64_t v54 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Dependencies();
  uint64_t v53 = swift_allocObject();
  *(void *)(v53 + 16) = sub_24CC75FE0(MEMORY[0x263F8EE78]);
  int64_t v8 = (objc_class *)type metadata accessor for NotificationController();
  id v9 = objc_msgSend(objc_allocWithZone(v8), sel_init);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AB0);
  uint64_t v52 = &unk_24CCBE0C0;
  uint64_t v66 = (_UNKNOWN **)sub_24CCA5110(&qword_269822AB8, &qword_269822AB0);
  *(void *)&long long v64 = v9;
  swift_beginAccess();
  id v57 = v9;
  sub_24CC9EB2C((uint64_t)&v64, (uint64_t)v8);
  swift_endAccess();
  sub_24CCBB580();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D78);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24CCBD620;
  *(void *)(v10 + 32) = sub_24CCBB570();
  *(void *)(v10 + 40) = v11;
  id v12 = objc_allocWithZone(MEMORY[0x263F08D88]);
  swift_bridgeObjectRetain();
  os_log_type_t v13 = (void *)sub_24CCBBE20();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithMachServiceName_, v13);

  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822A70);
  uint64_t v16 = (void *)swift_allocObject();
  swift_bridgeObjectRetain();
  sub_24CCBB600();
  uint64_t v17 = (objc_class *)type metadata accessor for ServerListener();
  long long v18 = (char *)objc_allocWithZone(v17);
  *(void *)&v18[OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v18[OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_xpcListener] = v14;
  v63.receiver = v18;
  v63.super_class = v17;
  id v19 = v14;
  unint64_t v20 = (char *)objc_msgSendSuper2(&v63, sel_init);
  v16[3] = v20;
  void v16[4] = v10;
  sub_24CCBB860();
  v16[2] = sub_24CCBB850();
  *(void *)&v20[OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_delegate + 8] = &off_26FF2BF20;
  uint64_t v56 = v16;
  swift_unknownObjectWeakAssign();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AC0);
  uint64_t v66 = (_UNKNOWN **)sub_24CCA5110(&qword_269822AC8, &qword_269822AC0);
  *(void *)&long long v64 = v16;
  swift_beginAccess();
  swift_retain();
  sub_24CC9EB2C((uint64_t)&v64, v15);
  swift_endAccess();
  uint64_t v21 = type metadata accessor for SharingInteractionController();
  swift_allocObject();
  unint64_t v22 = SharingInteractionController.init()();
  uint64_t v65 = v21;
  uint64_t v66 = &protocol witness table for SharingInteractionController;
  *(void *)&long long v64 = v22;
  uint64_t v55 = v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AD0);
  v62[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AD8);
  v62[4] = sub_24CCA5110(&qword_269822AE0, &qword_269822AD8);
  v62[0] = swift_allocObject();
  sub_24CC7B4B8((uint64_t)&v64, v62[0] + 16);
  swift_beginAccess();
  swift_retain();
  sub_24CC9EB2C((uint64_t)v62, v23);
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v64);
  uint64_t v24 = v53;
  swift_retain();
  sub_24CCA1B90((uint64_t)&v64);
  type metadata accessor for NearbyDeviceProvider(0);
  uint64_t v25 = swift_allocObject();
  sub_24CCBB600();
  long long v26 = (_DWORD *)(v25 + OBJC_IVAR____TtC13DeviceSharing20NearbyDeviceProvider_state);
  uint64_t v27 = v54;
  int64_t v28 = &v54[*(int *)(v6 + 28)];
  uint64_t v29 = type metadata accessor for NearbyDevice(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 1, 1, v29);
  type metadata accessor for NearbyDeviceProviderState(0);
  swift_storeEnumTagMultiPayload();
  *uint64_t v27 = 0;
  _DWORD *v26 = 0;
  uint64_t v30 = (char *)v26 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269822698) + 28);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AE8);
  bzero(v30, *(void *)(*(void *)(v31 - 8) + 64));
  sub_24CCA50AC((uint64_t)v27, (uint64_t)v30);
  *(void *)(v25 + 16) = sub_24CC8D95C;
  *(void *)(v25 + 24) = 0;
  sub_24CC76204(&v64, v25 + 32);
  swift_release();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AF8);
  uint64_t v66 = (_UNKNOWN **)sub_24CCA5110(&qword_269822B00, &qword_269822AF8);
  *(void *)&long long v64 = v25;
  *((void *)&v64 + 1) = &off_26FF2B790;
  swift_beginAccess();
  swift_retain();
  sub_24CC9EB2C((uint64_t)&v64, v32);
  swift_endAccess();
  swift_retain();
  uint64_t v33 = sub_24CCA25B0(&qword_269822AF0);
  uint64_t v35 = v34;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AA0);
  uint64_t v37 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_OWORD *)(v37 + 144) = 0u;
  *(_OWORD *)(v37 + 160) = 0u;
  *(_OWORD *)(v37 + 112) = 0u;
  *(_OWORD *)(v37 + 128) = 0u;
  *(void *)(v37 + 192) = 0;
  *(void *)(v37 + 200) = 0;
  *(void *)(v37 + 176) = v33;
  *(void *)(v37 + 184) = v35;
  swift_release();
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822B08);
  uint64_t v66 = (_UNKNOWN **)sub_24CCA5110(&qword_269822B10, &qword_269822B08);
  *(void *)&long long v64 = v37;
  swift_beginAccess();
  swift_retain();
  sub_24CC9EB2C((uint64_t)&v64, v36);
  swift_endAccess();
  uint64_t v38 = sub_24CCBB690();
  uint64_t v39 = sub_24CCBB680();
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822B18);
  uint64_t v66 = (_UNKNOWN **)sub_24CCA5110(&qword_269822B20, &qword_269822B18);
  *(void *)&long long v64 = v39;
  swift_beginAccess();
  swift_retain();
  sub_24CC9EB2C((uint64_t)&v64, v38);
  swift_endAccess();
  uint64_t v40 = v59;
  sub_24CCBB6C0();
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822B28);
  uint64_t v66 = (_UNKNOWN **)sub_24CCA5110(&qword_269822B30, &qword_269822B28);
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v64);
  uint64_t v42 = v60;
  (*(void (**)(uint64_t *, char *, uint64_t))(v61 + 16))(boxed_opaque_existential_1Tm, v40, v60);
  swift_beginAccess();
  sub_24CC9EB2C((uint64_t)&v64, v42);
  swift_endAccess();
  uint64_t v43 = sub_24CCBB7A0();
  swift_allocObject();
  uint64_t v44 = sub_24CCBB790();
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822B38);
  uint64_t v66 = (_UNKNOWN **)sub_24CCA5110(&qword_269822B40, &qword_269822B38);
  *(void *)&long long v64 = v44;
  swift_beginAccess();
  swift_retain();
  sub_24CC9EB2C((uint64_t)&v64, v43);
  swift_endAccess();
  type metadata accessor for GuestUserAccessResponseController();
  swift_allocObject();
  swift_retain();
  uint64_t v45 = v24;
  uint64_t v46 = sub_24CC7E418();
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822AA8);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822B48);
  uint64_t v66 = (_UNKNOWN **)sub_24CCA5110(&qword_269822B50, &qword_269822B48);
  *(void *)&long long v64 = v46;
  *((void *)&v64 + 1) = &off_26FF2B4B8;
  swift_beginAccess();
  swift_retain();
  sub_24CC9EB2C((uint64_t)&v64, v47);
  swift_endAccess();
  uint64_t v48 = sub_24CCBBFA0();
  uint64_t v49 = (uint64_t)v58;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v58, 1, 1, v48);
  uint64_t v50 = (void *)swift_allocObject();
  v50[2] = 0;
  v50[3] = 0;
  v50[4] = v37;
  v50[5] = v46;
  swift_retain();
  swift_retain();
  sub_24CCA5444(v49, (uint64_t)&unk_269822B60, (uint64_t)v50);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v59, v60);
  return v45;
}

uint64_t sub_24CCA48EC(uint64_t a1)
{
  v8[0] = a1;
  uint64_t v1 = sub_24CCBC080();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CCBC070();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_24CCBBD80();
  MEMORY[0x270FA5388](v6 - 8);
  sub_24CC735FC();
  sub_24CCBBD60();
  v8[1] = MEMORY[0x263F8EE78];
  sub_24CCA501C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821DA8);
  sub_24CCA5110((unint64_t *)&qword_269821DB0, &qword_269821DA8);
  sub_24CCBC170();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v1);
  sub_24CCBC090();
  return sub_24CCA2314((uint64_t)&unk_269822AA0, (uint64_t (*)(void))sub_24CCA1924);
}

uint64_t dispatch thunk of DaemonServer.activate()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC68584;
  return v7(a1, a2);
}

uint64_t destroy for Daemon()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s13DeviceSharing6DaemonVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Daemon(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Daemon(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Daemon(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Daemon(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Daemon()
{
  return &type metadata for Daemon;
}

uint64_t sub_24CCA4E24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269822A98);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24CCBC420();
  __break(1u);
  return result;
}

char *sub_24CCA4F34(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_24CCBC420();
  __break(1u);
  return result;
}

unint64_t sub_24CCA501C()
{
  unint64_t result = qword_269821DA0;
  if (!qword_269821DA0)
  {
    sub_24CCBC070();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269821DA0);
  }
  return result;
}

uint64_t sub_24CCA5074()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CCA50AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NearbyDeviceProvider.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CCA5110(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24CCA5154()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CCA519C()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_24CC68584;
  *(_OWORD *)(v2 + 16) = v3;
  return MEMORY[0x270FA2498](sub_24CCA2FB8, 0, 0);
}

uint64_t sub_24CCA5248@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  long long v3 = sub_24CC7E5D8(a1);
  uint64_t v5 = v4;
  uint64_t result = swift_getObjectType();
  a2[3] = result;
  a2[4] = v5;
  *a2 = v3;
  return result;
}

uint64_t sub_24CCA5288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

void *sub_24CCA5290(void *a1, void *a2)
{
  long long v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  id v4 = v3;
  return a1;
}

void sub_24CCA52C4(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 8);
}

void *sub_24CCA5300(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  id v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24CCA5368(uint64_t a1, _OWORD *a2)
{
  swift_release();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t sub_24CCA53A8(uint64_t *a1, int a2)
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

uint64_t sub_24CCA53F0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for XPCEventServer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CCA5444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24CCBBFA0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24CCBBF90();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24CC7B8E8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CCBBF40();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_24CCA55C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[10] = a3;
  v4[11] = a4;
  v4[8] = a1;
  v4[9] = a2;
  return MEMORY[0x270FA2498](sub_24CCA55E8, 0, 0);
}

uint64_t sub_24CCA55E8()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v4 = v0[8];
  long long v3 = v0[9];
  uint64_t v5 = sub_24CCBB890();
  __swift_project_value_buffer(v5, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD000000000000061, 0x800000024CCBFDB0, 0x6574617669746361, 0xEA00000000002928);
  v0[6] = sub_24CCA5760(v4, v3, v2, v1);
  v0[7] = v6;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24CCA5C14;
  v0[5] = &block_descriptor_2;
  uint64_t v7 = _Block_copy(v0 + 2);
  swift_release();
  xpc_set_event_stream_handler("com.apple.rapport.matching", v3, v7);
  _Block_release(v7);
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t (*sub_24CCA5760(uint64_t a1, void *a2, uint64_t a3, uint64_t a4))(void *a1)
{
  uint64_t v8 = (void *)swift_allocObject();
  void v8[2] = a3;
  v8[3] = a4;
  v8[4] = a1;
  v8[5] = a2;
  swift_retain();
  id v9 = a2;
  return sub_24CCA6530;
}

uint64_t sub_24CCA57E4(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v41 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24CCBBD90();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  void *v15 = a3;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F8F0E0], v12);
  id v16 = a3;
  LOBYTE(a3) = sub_24CCBBDA0();
  (*(void (**)(void *, uint64_t))(v13 + 8))(v15, v12);
  if (a3)
  {
    if (qword_269821AC0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v17 = sub_24CCBB890();
  __swift_project_value_buffer(v17, (uint64_t)qword_269824858);
  swift_unknownObjectRetain_n();
  long long v18 = sub_24CCBB870();
  os_log_type_t v19 = sub_24CCBC060();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    uint64_t v43 = v38;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v40 = a2;
    type metadata accessor for XPCEventServer();
    uint64_t v22 = sub_24CCBC5E0();
    uint64_t v39 = a5;
    uint64_t v42 = sub_24CC692DC(v22, v23, &v43);
    int v37 = v20;
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    id v24 = objc_msgSend(a1, sel_description, v21 + 14);
    uint64_t v25 = sub_24CCBBE50();
    id v26 = v16;
    uint64_t v27 = v11;
    unint64_t v29 = v28;

    a5 = v39;
    uint64_t v42 = sub_24CC692DC(v25, v29, &v43);
    a2 = v40;
    sub_24CCBC120();
    swift_unknownObjectRelease_n();
    uint64_t v11 = v27;
    id v16 = v26;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v18, (os_log_type_t)v37, "%s received Rapport XPC event %s", (uint8_t *)v21, 0x16u);
    uint64_t v30 = v38;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v30, -1, -1);
    MEMORY[0x2533103A0](v21, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  uint64_t v31 = v41;
  sub_24CCA5C74(a1, a2, v16);
  uint64_t v32 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v11, 1, 1, v32);
  uint64_t v33 = (void *)swift_allocObject();
  v33[2] = 0;
  v33[3] = 0;
  v33[4] = v31;
  v33[5] = a5;
  v33[6] = a2;
  v33[7] = v16;
  id v34 = v16;
  swift_retain();
  sub_24CCA5444((uint64_t)v11, (uint64_t)&unk_269822C10, (uint64_t)v33);
  return swift_release();
}

uint64_t sub_24CCA5C14(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_24CCA5C74(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_24CCBBD90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  void *v8 = a3;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F0E0], v5);
  id v9 = a3;
  LOBYTE(a3) = sub_24CCBBDA0();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if ((a3 & 1) == 0)
  {
    __break(1u);
LABEL_20:
    swift_once();
    goto LABEL_9;
  }
  if (xpc_dictionary_get_BOOL(a1, "replyRequired"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a1);
    if (reply)
    {
      uint64_t v11 = reply;
      xpc_dictionary_send_reply();
      if (qword_269821AC0 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_24CCBB890();
      __swift_project_value_buffer(v12, (uint64_t)qword_269824858);
      swift_unknownObjectRetain_n();
      swift_unknownObjectRetain_n();
      uint64_t v13 = sub_24CCBB870();
      os_log_type_t v14 = sub_24CCBC060();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        uint64_t v49 = v47;
        *(_DWORD *)uint64_t v15 = 136315650;
        type metadata accessor for XPCEventServer();
        uint64_t v16 = sub_24CCBC5E0();
        uint64_t v48 = sub_24CC692DC(v16, v17, &v49);
        sub_24CCBC120();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 12) = 2080;
        id v18 = objc_msgSend(a1, sel_description);
        uint64_t v19 = sub_24CCBBE50();
        unint64_t v21 = v20;

        uint64_t v48 = sub_24CC692DC(v19, v21, &v49);
        sub_24CCBC120();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 22) = 2080;
        id v22 = objc_msgSend(v11, sel_description);
        uint64_t v23 = sub_24CCBBE50();
        unint64_t v25 = v24;

        uint64_t v48 = sub_24CC692DC(v23, v25, &v49);
        sub_24CCBC120();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24CC60000, v13, v14, "%s consumed XPC event %s with reply %s", (uint8_t *)v15, 0x20u);
        uint64_t v26 = v47;
        swift_arrayDestroy();
        MEMORY[0x2533103A0](v26, -1, -1);
        MEMORY[0x2533103A0](v15, -1, -1);
        swift_unknownObjectRelease();

        return;
      }

      swift_unknownObjectRelease_n();
      goto LABEL_18;
    }
    if (qword_269821AC0 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_24CCBB890();
    __swift_project_value_buffer(v39, (uint64_t)qword_269824858);
    swift_unknownObjectRetain_n();
    unint64_t v28 = sub_24CCBB870();
    os_log_type_t v29 = sub_24CCBC040();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v49 = v31;
      *(_DWORD *)uint64_t v30 = 136315394;
      type metadata accessor for XPCEventServer();
      uint64_t v40 = sub_24CCBC5E0();
      uint64_t v48 = sub_24CC692DC(v40, v41, &v49);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      id v42 = objc_msgSend(a1, sel_description);
      uint64_t v43 = sub_24CCBBE50();
      unint64_t v45 = v44;

      uint64_t v48 = sub_24CC692DC(v43, v45, &v49);
      sub_24CCBC120();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v38 = "%s failed to consume XPC event %s";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (qword_269821AC0 != -1) {
    goto LABEL_20;
  }
LABEL_9:
  uint64_t v27 = sub_24CCBB890();
  __swift_project_value_buffer(v27, (uint64_t)qword_269824858);
  swift_unknownObjectRetain_n();
  unint64_t v28 = sub_24CCBB870();
  os_log_type_t v29 = sub_24CCBC060();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v49 = v31;
    *(_DWORD *)uint64_t v30 = 136315394;
    type metadata accessor for XPCEventServer();
    uint64_t v32 = sub_24CCBC5E0();
    uint64_t v48 = sub_24CC692DC(v32, v33, &v49);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    id v34 = objc_msgSend(a1, sel_description);
    uint64_t v35 = sub_24CCBBE50();
    unint64_t v37 = v36;

    uint64_t v48 = sub_24CC692DC(v35, v37, &v49);
    sub_24CCBC120();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v38 = "%s consumed XPC event %s";
LABEL_15:
    _os_log_impl(&dword_24CC60000, v28, v29, v38, (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v31, -1, -1);
    MEMORY[0x2533103A0](v30, -1, -1);

    return;
  }
LABEL_16:

LABEL_18:
  swift_unknownObjectRelease_n();
}

uint64_t sub_24CCA6390()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC68584;
  return sub_24CC7651C(1);
}

uint64_t sub_24CCA6424(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  long long v5 = *(_OWORD *)(a1 + 16);
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_24CC68584;
  *(_OWORD *)(v4 + 64) = *v1;
  *(_OWORD *)(v4 + 80) = v5;
  return MEMORY[0x270FA2498](sub_24CCA55E8, 0, 0);
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

uint64_t sub_24CCA64F0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CCA6530(void *a1)
{
  return sub_24CCA57E4(a1, *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24CCA653C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24CCA6584()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC68584;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC68584;
  return sub_24CC7651C(1);
}

uint64_t LocalAuthenticator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  LocalAuthenticator.init()();
  return v0;
}

uint64_t LocalAuthenticator.init()()
{
  uint64_t v1 = v0;
  swift_defaultActor_initialize();
  *(unsigned char *)(v0 + 112) = 0;
  if (qword_269821AC8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824870);
  uint64_t v3 = sub_24CCBB870();
  os_log_type_t v4 = sub_24CCBC060();
  if (os_log_type_enabled(v3, v4))
  {
    long long v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)long long v5 = 136315138;
    uint64_t v7 = sub_24CCBC5E0();
    sub_24CC692DC(v7, v8, &v10);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v3, v4, "[%s] Initialized", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v6, -1, -1);
    MEMORY[0x2533103A0](v5, -1, -1);
  }

  return v1;
}

uint64_t sub_24CCA6850()
{
  *(void *)(v1 + 40) = v0;
  *(void *)(v1 + 48) = *v0;
  return MEMORY[0x270FA2498](sub_24CCA6898, v0, 0);
}

uint64_t sub_24CCA6898()
{
  uint64_t v19 = v0;
  if (qword_269821AC8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  v0[7] = __swift_project_value_buffer(v1, (uint64_t)qword_269824870);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v18 = v5;
    *(_DWORD *)os_log_type_t v4 = 136315138;
    uint64_t v6 = sub_24CCBC5E0();
    v0[4] = sub_24CC692DC(v6, v7, &v18);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v2, v3, "[%s] Authenticating", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  uint64_t v8 = v0[5];
  if (*(unsigned char *)(v8 + 112))
  {
    id v9 = sub_24CCBB870();
    os_log_type_t v10 = sub_24CCBC060();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v18 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = sub_24CCBC5E0();
      v0[3] = sub_24CC692DC(v13, v14, &v18);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CC60000, v9, v10, "[%s] Authentication already in progress; ignoring request", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v12, -1, -1);
      MEMORY[0x2533103A0](v11, -1, -1);
    }

    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  else
  {
    *(unsigned char *)(v8 + 112) = 1;
    unint64_t v17 = (void *)swift_task_alloc();
    v0[8] = v17;
    void *v17 = v0;
    v17[1] = sub_24CCA6BE0;
    return sub_24CCA73B0();
  }
}

uint64_t sub_24CCA6BE0()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = *(void *)(v2 + 40);
    return MEMORY[0x270FA2498](sub_24CCA6D24, v6, 0);
  }
}

uint64_t sub_24CCA6D24()
{
  os_log_type_t v10 = v0;
  *(unsigned char *)(v0[5] + 112) = 0;
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v9 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v5 = sub_24CCBC5E0();
    v0[2] = sub_24CC692DC(v5, v6, &v9);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v1, v2, "[%s] Authentication successful!", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }

  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24CCA6EA0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822C40);
    uint64_t v2 = sub_24CCBC410();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v26 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v25 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v25) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v25) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v26 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v25) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v26 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v25) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v26 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    int v17 = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v12);
    sub_24CC6CA84(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v38 + 8);
    LODWORD(v38[0]) = v17;
    v36[0] = v38[0];
    v36[1] = v38[1];
    uint64_t v37 = v39;
    LODWORD(v35[0]) = v17;
    swift_dynamicCast();
    sub_24CC761F4((_OWORD *)((char *)v36 + 8), v30);
    long long v31 = v27;
    long long v32 = v28;
    uint64_t v33 = v29;
    sub_24CC761F4(v30, v34);
    long long v27 = v31;
    long long v28 = v32;
    uint64_t v29 = v33;
    sub_24CC761F4(v34, v35);
    sub_24CC761F4(v35, &v31);
    uint64_t result = sub_24CCBC260();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v23 = v20 == v22;
        if (v20 == v22) {
          unint64_t v20 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v6 + 8 * v20);
      }
      while (v24 == -1);
      unint64_t v9 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v27;
    *(_OWORD *)(v10 + 16) = v28;
    *(void *)(v10 + 32) = v29;
    uint64_t result = (uint64_t)sub_24CC761F4(&v31, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v25)
  {
LABEL_37:
    swift_release();
    sub_24CC6B0A4();
    return v2;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v25) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24CCA7258(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269821D68);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2) {
      uint64_t v8 = sub_24CCBBDC0();
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_24CCA7B5C((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t LocalAuthenticator.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LocalAuthenticator.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t LocalAuthenticator.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24CCA73A4()
{
  return v0;
}

uint64_t sub_24CCA73B0()
{
  sub_24CCBB540();
  *(void *)(v0 + 360) = swift_task_alloc();
  sub_24CCBBE10();
  *(void *)(v0 + 368) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCA7468, 0, 0);
}

uint64_t sub_24CCA7468()
{
  uint64_t v1 = v0;
  unint64_t v19 = v0 + 2;
  unint64_t v20 = v0 + 44;
  sub_24CCBBE00();
  _s30DeviceSharingFrameworkSentinelCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24CCBB530();
  uint64_t v5 = sub_24CCBBE60();
  uint64_t v7 = v6;
  sub_24CCBBE00();
  id v8 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24CCBB530();
  uint64_t v9 = sub_24CCBBE60();
  uint64_t v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822C30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CCBE140;
  *(_DWORD *)(inited + 32) = 1030;
  uint64_t v13 = MEMORY[0x263F8D310];
  *(void *)(inited + 64) = MEMORY[0x263F8D310];
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 48) = v7;
  *(_DWORD *)(inited + 72) = 2;
  *(void *)(inited + 104) = v13;
  *(void *)(inited + 80) = v9;
  *(void *)(inited + 88) = v11;
  *(_DWORD *)(inited + 112) = 1001;
  *(void *)(inited + 144) = MEMORY[0x263F8D538];
  *(void *)(inited + 120) = 0x404E000000000000;
  *(_DWORD *)(inited + 152) = 1034;
  *(void *)(inited + 184) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 160) = 1;
  *(_DWORD *)(inited + 192) = 1033;
  *(void *)(inited + 224) = MEMORY[0x263F8E548];
  *(_DWORD *)(inited + 200) = 1;
  unint64_t v14 = sub_24CC760F0(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698220D0);
  swift_arrayDestroy();
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10468]), sel_init);
  v1[47] = v15;
  sub_24CCA6EA0(v14);
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_24CCBBDB0();
  v1[48] = v16;
  swift_bridgeObjectRelease();
  v1[2] = v1;
  v1[7] = v20;
  v1[3] = sub_24CCA77E4;
  uint64_t v17 = swift_continuation_init();
  v1[39] = MEMORY[0x263EF8330];
  v1[40] = 0x40000000;
  v1[41] = sub_24CCA7258;
  v1[42] = &block_descriptor_0;
  v1[43] = v17;
  objc_msgSend(v15, sel_evaluatePolicy_options_reply_, 1013, v16);
  return MEMORY[0x270FA23F0](v19);
}

uint64_t sub_24CCA77E4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 392) = v1;
  if (v1) {
    uint64_t v2 = sub_24CCA7984;
  }
  else {
    uint64_t v2 = sub_24CCA78F4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CCA78F4()
{
  uint64_t v1 = *(void **)(v0 + 384);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24CCA7984()
{
  uint64_t v1 = (void *)v0[48];
  uint64_t v2 = (void *)v0[47];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t type metadata accessor for LocalAuthenticator()
{
  return self;
}

uint64_t method lookup function for LocalAuthenticator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocalAuthenticator);
}

uint64_t dispatch thunk of LocalAuthenticator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of LocalAuthenticator.authenticate()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 128) + **(int **)(*(void *)v0 + 128));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC68584;
  return v4();
}

uint64_t sub_24CCA7B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822C38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t PeerProtocolHeader.init(transportItem:length:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  if ((a2 & 0x8000000000000000) != 0 || HIDWORD(a2))
  {
    uint64_t result = sub_24CCBC3C0();
    __break(1u);
  }
  else
  {
    *a3 = result;
    a3[1] = a2;
  }
  return result;
}

uint64_t PeerProtocolHeader.transportData.getter()
{
  v9[2] = *MEMORY[0x263EF8340];
  int v1 = *v0;
  int v7 = v0[1];
  int __src = v1;
  v9[0] = sub_24CCA8310(&__src, v9);
  v9[1] = v2 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v3 = sub_24CCA8310(&v7, &__src);
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFLL;
  sub_24CCBB4D0();
  sub_24CC73718(v3, v5);
  return v9[0];
}

uint64_t PeerProtocolHeader.init(buffer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (result)
  {
    sub_24CCBC120();
    uint64_t result = sub_24CCBC120();
  }
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = v2 == 0;
  return result;
}

uint64_t sub_24CCA7DE4(char a1)
{
  if (a1) {
    return 0x6874676E656CLL;
  }
  else {
    return 0x726F70736E617274;
  }
}

BOOL sub_24CCA7E24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24CCA7E3C()
{
  return sub_24CCBC570();
}

uint64_t sub_24CCA7E84()
{
  return sub_24CCBC550();
}

uint64_t sub_24CCA7EB0()
{
  return sub_24CCBC570();
}

uint64_t sub_24CCA7EF4()
{
  return sub_24CCA7DE4(*v0);
}

uint64_t sub_24CCA7EFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCA874C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CCA7F24()
{
  return 0;
}

void sub_24CCA7F30(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24CCA7F3C(uint64_t a1)
{
  unint64_t v2 = sub_24CCA8488();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCA7F78(uint64_t a1)
{
  unint64_t v2 = sub_24CCA8488();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PeerProtocolHeader.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822C50);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = *(_DWORD *)(v1 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCA8488();
  sub_24CCBC5A0();
  char v12 = 0;
  sub_24CCBC450();
  if (!v2)
  {
    char v11 = 1;
    sub_24CCBC450();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t PeerProtocolHeader.init(from:)@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822C60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCA8488();
  sub_24CCBC590();
  if (!v2)
  {
    char v14 = 0;
    int v9 = sub_24CCBC440();
    char v13 = 1;
    int v10 = sub_24CCBC440();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_24CCA82B8@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return PeerProtocolHeader.init(from:)(a1, a2);
}

uint64_t sub_24CCA82D0(void *a1)
{
  return PeerProtocolHeader.encode(to:)(a1);
}

BOOL static PeerProtocolHeader.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL sub_24CCA82FC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24CCA8310(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_24CCA83D4(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_24CCA8310(__src, &__src[a2]);
  }
  sub_24CCBB430();
  swift_allocObject();
  sub_24CCBB420();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_24CCBB4A0();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

unint64_t sub_24CCA8488()
{
  unint64_t result = qword_269822C58;
  if (!qword_269822C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269822C58);
  }
  return result;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PeerProtocolHeader(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PeerProtocolHeader(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PeerProtocolHeader()
{
  return &type metadata for PeerProtocolHeader;
}

unsigned char *storeEnumTagSinglePayload for PeerProtocolHeader.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCA860CLL);
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

ValueMetadata *type metadata accessor for PeerProtocolHeader.CodingKeys()
{
  return &type metadata for PeerProtocolHeader.CodingKeys;
}

unint64_t sub_24CCA8648()
{
  unint64_t result = qword_269822C68;
  if (!qword_269822C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269822C68);
  }
  return result;
}

unint64_t sub_24CCA86A0()
{
  unint64_t result = qword_269822C70;
  if (!qword_269822C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269822C70);
  }
  return result;
}

unint64_t sub_24CCA86F8()
{
  unint64_t result = qword_269822C78;
  if (!qword_269822C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269822C78);
  }
  return result;
}

uint64_t sub_24CCA874C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726F70736E617274 && a2 == 0xED00006D65744974;
  if (v3 || (sub_24CCBC480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6874676E656CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CCBC480();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void *static XPCServer.makeDaemonServer(machServiceName:requiredEntitlements:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for XPCServer();
  id v4 = objc_allocWithZone(MEMORY[0x263F08D88]);
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_24CCBBE20();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithMachServiceName_, v5);

  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24CCAB8B0(v6, a3);

  return v7;
}

uint64_t type metadata accessor for XPCServer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t XPCServer.transportDispatchService.getter()
{
  sub_24CC735F4();
  return swift_retain();
}

void *XPCServer.__allocating_init(listener:requiredEntitlements:)(void *a1, uint64_t a2)
{
  BOOL v3 = sub_24CCAB8B0(a1, a2);

  return v3;
}

void *XPCServer.init(listener:requiredEntitlements:)(void *a1, uint64_t a2)
{
  BOOL v3 = sub_24CCAB7D0(a1, a2);

  return v3;
}

uint64_t XPCServer.deinit()
{
  sub_24CCA8B9C();
  swift_release();

  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + qword_269822C80;
  uint64_t v2 = sub_24CCBB610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t XPCServer.__deallocating_deinit()
{
  XPCServer.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24CCA8A74()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24CCA8A94, 0, 0);
}

uint64_t sub_24CCA8A94()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000005CLL, 0x800000024CCBFF50, 0x6574617669746361, 0xEA00000000002928);
  BOOL v3 = *(void **)(*(void *)(v1 + 24)
                + OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_xpcListener);
  objc_msgSend(v3, sel_setDelegate_);
  objc_msgSend(v3, sel_activate);
  id v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id sub_24CCA8B9C()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000005CLL, 0x800000024CCBFF50, 0x6164696C61766E69, 0xEC00000029286574);
  sub_24CCBB5F0();
  uint64_t v2 = *(void **)(*(void *)(v0 + 24)
                + OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_xpcListener);
  objc_msgSend(v2, sel_setDelegate_, 0);
  return objc_msgSend(v2, sel_invalidate);
}

uint64_t sub_24CCA8C8C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24CCBB890();
  __swift_project_value_buffer(v4, (uint64_t)qword_269824858);
  id v5 = a1;
  uint64_t v6 = sub_24CCBB870();
  os_log_type_t v7 = sub_24CCBC060();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v26 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t aBlock = v27;
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v9 = sub_24CC9E160(0xD00000000000005CLL, 0x800000024CCBFF50, 0xD000000000000014, 0x800000024CCC00E0);
    sub_24CC692DC(v9, v10, &aBlock);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2112;
    id v11 = v5;
    sub_24CCBC120();
    void *v26 = v5;

    _os_log_impl(&dword_24CC60000, v6, v7, "%s Accepting new connection: %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v26, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v27, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);
  }
  else
  {
  }
  sub_24CCBB800();
  id v12 = v5;
  uint64_t v13 = sub_24CCBB7C0();
  sub_24CCA94D4(v13);
  sub_24CCBB7F0();
  char v14 = self;
  id v15 = objc_msgSend(v14, sel_interfaceWithProtocol_, &unk_26FF30178);
  objc_msgSend(v12, sel_setRemoteObjectInterface_, v15);

  id v16 = objc_msgSend(v14, sel_interfaceWithProtocol_, &unk_26FF30178);
  objc_msgSend(v12, sel_setExportedInterface_, v16);

  objc_msgSend(v12, sel_setExportedObject_, v2);
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v12;
  v18[3] = v17;
  v18[4] = v13;
  long long v32 = sub_24CCABF3C;
  uint64_t v33 = v18;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v29 = 1107296256;
  uint64_t v30 = sub_24CCA9194;
  long long v31 = &block_descriptor_3;
  unint64_t v19 = _Block_copy(&aBlock);
  id v20 = v12;
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_setInterruptionHandler_, v19);
  _Block_release(v19);
  uint64_t v21 = swift_allocObject();
  swift_weakInit();
  unint64_t v22 = (void *)swift_allocObject();
  long long v22[2] = v20;
  v22[3] = v21;
  v22[4] = v13;
  long long v32 = sub_24CCABFC8;
  uint64_t v33 = v22;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v29 = 1107296256;
  uint64_t v30 = sub_24CCA9194;
  long long v31 = &block_descriptor_32;
  BOOL v23 = _Block_copy(&aBlock);
  id v24 = v20;
  swift_retain();
  swift_release();
  objc_msgSend(v24, sel_setInvalidationHandler_, v23);
  _Block_release(v23);
  objc_msgSend(v24, sel_activate);
  return swift_release();
}

uint64_t sub_24CCA9194(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24CCA91D8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v8 = sub_24CCBB890();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a2 + 16;
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v8, (uint64_t)qword_269824858);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v13, v8);
  id v14 = a1;
  id v15 = sub_24CCBB870();
  os_log_type_t v16 = sub_24CCBC040();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v26 = a4;
    uint64_t v27 = v12;
    uint64_t v28 = a3;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v30[0] = v25;
    *(_DWORD *)uint64_t v17 = 136446210;
    id v18 = objc_msgSend(v14, sel_serviceName);
    if (v18)
    {
      unint64_t v19 = v18;
      uint64_t v20 = sub_24CCBBE50();
      unint64_t v22 = v21;
    }
    else
    {
      unint64_t v22 = 0xEB00000000646569;
      uint64_t v20 = 0x6669636570736E75;
    }
    uint64_t v29 = sub_24CC692DC(v20, v22, v30);
    sub_24CCBC120();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v15, v16, v26, v17, 0xCu);
    uint64_t v23 = v25;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v23, -1, -1);
    MEMORY[0x2533103A0](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    a3 = v28;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CCA950C(a3);
    return swift_release();
  }
  return result;
}

uint64_t sub_24CCA94D4(uint64_t a1)
{
  return sub_24CCA953C(a1, 0x6976726553646461, 0xEE00293A5F286563, MEMORY[0x263F39EB0]);
}

uint64_t sub_24CCA950C(uint64_t a1)
{
  return sub_24CCA953C(a1, 0xD000000000000011, 0x800000024CCC00C0, MEMORY[0x263F39EB8]);
}

uint64_t sub_24CCA953C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(uint64_t))
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24CCBB890();
  __swift_project_value_buffer(v8, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000005CLL, 0x800000024CCBFF50, a2, a3);
  return a4(a1);
}

uint64_t sub_24CCA9600(uint64_t a1, uint64_t a2)
{
  _OWORD v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = *v2;
  return MEMORY[0x270FA2498](sub_24CCA964C, 0, 0);
}

uint64_t sub_24CCA964C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  long long v3 = *(_OWORD *)(v0 + 16);
  *(void *)(v2 + 16) = *(void *)(v1 + 80);
  *(void *)(v2 + 24) = *(void *)(v1 + 88);
  *(_OWORD *)(v2 + 32) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCA9734;
  return MEMORY[0x270F25ED8](&unk_269822ED0, v2);
}

uint64_t sub_24CCA9734()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCA9870, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24CCA9870()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCA98D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24CCA98FC, 0, 0);
}

uint64_t sub_24CCA98FC()
{
  sub_24CCBB800();
  swift_unknownObjectRetain();
  uint64_t v1 = swift_dynamicCastClass();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v6 = (uint64_t (*)(uint64_t))(v0[3] + *(int *)v0[3]);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[7] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24CCA9A40;
    return v6(v2);
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_24CCA9A40()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CCA9BB8;
  }
  else {
    uint64_t v2 = sub_24CCA9B54;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CCA9B54()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCA9BB8()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCA9C1C(int a1)
{
  *(void *)(v2 + 16) = v1;
  *(_DWORD *)(v2 + 32) = a1;
  return MEMORY[0x270FA2498](sub_24CCA9C40, 0, 0);
}

uint64_t sub_24CCA9C40()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000005CLL, 0x800000024CCBFF50, 0x726F70736E617274, 0xED0000293A5F2874);
  uint64_t v5 = (uint64_t (*)(uint64_t, void, unint64_t))((int)*MEMORY[0x263F3A050] + MEMORY[0x263F3A050]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24CCA9D80;
  uint64_t v3 = *(unsigned int *)(v0 + 32);
  return v5(v3, 0, 0xF000000000000000);
}

uint64_t sub_24CCA9D80(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_24CCA9E90(uint64_t a1, uint64_t a2, int a3, const void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = a1;
  uint64_t v12 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269822EA8;
  v13[5] = v11;
  id v14 = (void *)swift_allocObject();
  long long v14[2] = 0;
  v14[3] = 0;
  void v14[4] = &unk_269822EB0;
  v14[5] = v13;
  swift_retain();
  sub_24CCAB624((uint64_t)v9, (uint64_t)&unk_269822EB8, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_24CCAA00C(int a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  _OWORD v3[3] = _Block_copy(aBlock);
  swift_retain();
  uint64_t v6 = swift_task_alloc();
  v3[4] = v6;
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + 8) = sub_24CC70EB0;
  *(void *)(v6 + 16) = a3;
  *(_DWORD *)(v6 + 32) = a1;
  return MEMORY[0x270FA2498](sub_24CCA9C40, 0, 0);
}

uint64_t sub_24CCAA0E0(int a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 16) = a2;
  *(_DWORD *)(v4 + 48) = a1;
  return MEMORY[0x270FA2498](sub_24CCAA108, 0, 0);
}

uint64_t sub_24CCAA108()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000005CLL, 0x800000024CCBFF50, 0xD000000000000012, 0x800000024CCBED90);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F3A050] + MEMORY[0x263F3A050]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24CCAA240;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(unsigned int *)(v0 + 48);
  return v7(v5, v3, v4);
}

uint64_t sub_24CCAA240(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_24CCAA350(uint64_t a1, uint64_t a2, int a3, void *a4, const void *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = a1;
  uint64_t v14 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269822E68;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  void v16[4] = &unk_269822048;
  v16[5] = v15;
  id v17 = a4;
  swift_retain();
  sub_24CCAB624((uint64_t)v11, (uint64_t)&unk_269822050, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_24CCAA4D8(int a1, void *a2, void *aBlock, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  if (a2)
  {
    id v8 = a2;
    swift_retain();
    a2 = (void *)sub_24CCBB4C0();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  v4[4] = a2;
  v4[5] = v10;
  uint64_t v11 = swift_task_alloc();
  v4[6] = v11;
  *(void *)uint64_t v11 = v4;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = a4;
  *(void *)(v11 + 8) = sub_24CC716EC;
  *(void *)(v11 + 16) = a2;
  *(_DWORD *)(v11 + 48) = a1;
  return MEMORY[0x270FA2498](sub_24CCAA108, 0, 0);
}

uint64_t sub_24CCAA5EC()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24CCA8A94, 0, 0);
}

id sub_24CCAA694()
{
  return sub_24CCA8B9C();
}

uint64_t sub_24CCAA6B8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCAA788, 0, 0);
}

uint64_t XPCServer.send(_:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24CCAA788, 0, 0);
}

uint64_t sub_24CCAA788()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[4] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24CCAA888;
  uint64_t v4 = (void *)v0[3];
  _OWORD v3[3] = v2;
  v3[4] = v4;
  v3[2] = &unk_269822CB8;
  v3[5] = *v4;
  return MEMORY[0x270FA2498](sub_24CCA964C, 0, 0);
}

uint64_t sub_24CCAA888()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCAA9C4, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24CCAA9C4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCAAA28()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCAC7A8, 0, 0);
}

uint64_t XPCServer.send<A>(_:)()
{
  return MEMORY[0x270FA2498](sub_24CCAC7A8, 0, 0);
}

{
  return MEMORY[0x270FA2498](sub_24CCAC7A8, 0, 0);
}

uint64_t sub_24CCAAAE8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCAC7A8, 0, 0);
}

uint64_t sub_24CCAABA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *v4;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[5] = a4;
  v11[6] = v10;
  v11[3] = a2;
  v11[4] = a3;
  v11[1] = sub_24CC6CB14;
  v11[2] = a1;
  return MEMORY[0x270FA2498](sub_24CCAACA0, 0, 0);
}

uint64_t XPCServer.send<A>(_:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24CCAACA0, 0, 0);
}

uint64_t sub_24CCAACA0()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  long long v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 + 32) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24CCAADA0;
  uint64_t v4 = *(void **)(v0 + 48);
  _OWORD v3[3] = v1;
  v3[4] = v4;
  v3[2] = &unk_269822CF0;
  v3[5] = *v4;
  return MEMORY[0x270FA2498](sub_24CCA964C, 0, 0);
}

uint64_t sub_24CCAADA0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCAAEDC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24CCAAEDC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCAAF40()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCAC7A8, 0, 0);
}

uint64_t XPCServer.send<A, B>(_:payload:)()
{
  return MEMORY[0x270FA2498](sub_24CCAC7A8, 0, 0);
}

{
  return MEMORY[0x270FA2498](sub_24CCAB0C8, 0, 0);
}

uint64_t sub_24CCAB004()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCAB0C8, 0, 0);
}

uint64_t sub_24CCAB0C8()
{
  uint64_t v1 = sub_24CCBB810();
  sub_24CC9B724();
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v1 - 8) + 104))(v2, *MEMORY[0x263F3A020], v1);
  swift_willThrow();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

id sub_24CCAB298()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServerListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24CCAB31C(uint64_t a1, void *a2)
{
  return sub_24CCAC63C(a2);
}

uint64_t sub_24CCAB324(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CC6CB14;
  return MEMORY[0x270F25FF8](a2);
}

uint64_t sub_24CCAB3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  void *v10 = v5;
  v10[1] = sub_24CC68584;
  return MEMORY[0x270F25FF0](a2, a3, a4, a5);
}

uint64_t sub_24CCAB48C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24CC6CB14;
  return v6();
}

uint64_t sub_24CCAB558(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24CC6CB14;
  return v7();
}

uint64_t sub_24CCAB624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CCBBFA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CCBBF90();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CC744B8(a1, &qword_269822008);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CCBBF40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void *sub_24CCAB7D0(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_24CCBB600();
  uint64_t v6 = (objc_class *)type metadata accessor for ServerListener();
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v7[OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_xpcListener] = a1;
  v11.receiver = v7;
  v11.super_class = v6;
  id v8 = a1;
  unint64_t v9 = (char *)objc_msgSendSuper2(&v11, sel_init);
  _OWORD v3[3] = v9;
  v3[4] = a2;
  sub_24CCBB860();
  v3[2] = sub_24CCBB850();
  *(void *)&v9[OBJC_IVAR____TtC13DeviceSharingP33_49212DB15AC1BF3DB4C737D3A7547CBB14ServerListener_delegate + 8] = &off_26FF2BF20;
  swift_unknownObjectWeakAssign();
  return v3;
}

void *sub_24CCAB8B0(void *a1, uint64_t a2)
{
  return sub_24CCAB7D0(a1, a2);
}

uint64_t sub_24CCAB904(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return sub_24CCAB324(a1, v4);
}

uint64_t sub_24CCAB9A0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24CC6CB14;
  return sub_24CCAB3C4(a1, v7, v6, v4, v5);
}

uint64_t sub_24CCABA5C(uint64_t a1)
{
  *(void *)(a1 + 16) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_24CCABABC()
{
  uint64_t result = sub_24CCBB610();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for XPCServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCServer);
}

uint64_t dispatch thunk of XPCServer.__allocating_init(listener:requiredEntitlements:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of XPCServer.activate()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 136) + **(int **)(*(void *)v0 + 136));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC68584;
  return v4();
}

uint64_t dispatch thunk of XPCServer.invalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of XPCServer.transport(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 192) + **(int **)(*(void *)v1 + 192));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CC74C50;
  return v6(a1);
}

uint64_t dispatch thunk of XPCServer.transport(_:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 200)
                                                          + **(int **)(*(void *)v3 + 200));
  id v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24CC73CDC;
  return v10(a1, a2, a3);
}

uint64_t type metadata accessor for ServerListener()
{
  return self;
}

uint64_t sub_24CCABF00()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CCABF3C()
{
  return sub_24CCA91D8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), "XPC server connection (%{public}s) interrupted");
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

uint64_t objectdestroy_24Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CCABFC8()
{
  return sub_24CCA91D8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), "XPC server connection (%{public}s) invalidated");
}

uint64_t sub_24CCABFF0()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CCAC038()
{
  int v2 = *(_DWORD *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_24CC6CB14;
  uint64_t v7 = (uint64_t (*)(int, void *, void *, uint64_t))((char *)&dword_269822E60 + dword_269822E60);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_24CCAC104()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CCAC13C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269822E90 + dword_269822E90);
  return v6(a1, v4);
}

uint64_t sub_24CCAC1F4()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CCAC234()
{
  int v2 = *(_DWORD *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24CC6CB14;
  uint64_t v6 = (uint64_t (*)(int, void *, uint64_t))((char *)&dword_269822EA0 + dword_269822EA0);
  return v6(v2, v4, v3);
}

uint64_t sub_24CCAC2F0(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  swift_bridgeObjectRetain();
  for (uint64_t i = (unint64_t *)(a2 + 40); ; i += 2)
  {
    uint64_t v7 = *(i - 1);
    unint64_t v6 = *i;
    swift_bridgeObjectRetain();
    uint64_t v8 = (void *)sub_24CCBBE20();
    id v9 = objc_msgSend(a1, sel_valueForEntitlement_, v8);

    if (v9)
    {
      sub_24CCBC160();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v21, 0, sizeof(v21));
    }
    sub_24CCAC680((uint64_t)v21, (uint64_t)v22);
    if (!v22[3]) {
      break;
    }
    if ((swift_dynamicCast() & 1) == 0 || (v20 & 1) == 0) {
      goto LABEL_13;
    }
    swift_bridgeObjectRelease();
    if (!--v2)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  sub_24CC744B8((uint64_t)v22, &qword_269822010);
LABEL_13:
  swift_bridgeObjectRelease();
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24CCBB890();
  __swift_project_value_buffer(v11, (uint64_t)qword_269824858);
  id v12 = a1;
  swift_bridgeObjectRetain();
  id v13 = v12;
  uint64_t v14 = sub_24CCBB870();
  os_log_type_t v15 = sub_24CCBC040();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    id v18 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    v22[0] = v19;
    *(_DWORD *)uint64_t v16 = 138412546;
    *(void *)&v21[0] = v13;
    id v17 = v13;
    sub_24CCBC120();
    *id v18 = v13;

    *(_WORD *)(v16 + 12) = 2082;
    swift_bridgeObjectRetain();
    *(void *)&v21[0] = sub_24CC692DC(v7, v6, v22);
    sub_24CCBC120();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CC60000, v14, v15, "Rejecting connection %@ due to missing entitlement: %{public}s", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269822E50);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v19, -1, -1);
    MEMORY[0x2533103A0](v16, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_24CCAC63C(void *a1)
{
  char v3 = sub_24CCAC2F0(a1, *(void *)(v1 + 32));
  if (v3) {
    sub_24CCA8C8C(a1);
  }
  return v3 & 1;
}

uint64_t sub_24CCAC680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CCAC6E8(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 16);
  long long v5 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_24CC68584;
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24CCA98FC, 0, 0);
}

void sub_24CCAC7AC()
{
  sub_24CCAC7CC();
  qword_269822EE0 = v0;
}

void sub_24CCAC7CC()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  id v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    uint64_t v2 = sub_24CCBBE50();
    uint64_t v4 = v3;

    if (v2 == 0xD000000000000018 && v4 == 0x800000024CCBFA30)
    {
      swift_bridgeObjectRelease();
LABEL_6:
      id v6 = objc_msgSend(self, sel_standardUserDefaults);
      id v7 = v6;
      return;
    }
    char v5 = sub_24CCBC480();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_6;
    }
  }
  id v8 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v9 = (void *)sub_24CCBBE20();
  id v10 = objc_msgSend(v8, sel_initWithSuiteName_, v9);

  if (!v10) {
    __break(1u);
  }
}

id static NSUserDefaults.deviceSharingd.getter()
{
  if (qword_269821AD0 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_269822EE0;
  return v0;
}

id sub_24CCAC99C()
{
  if (qword_269821AD0 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_269822EE0;
  return v0;
}

Swift::Void __swiftcall NSUserDefaults.log()()
{
  unint64_t v46 = 0xD000000000000028;
  unint64_t v47 = 0x800000024CCC0100;
  id v1 = objc_msgSend(v0, sel_dictionaryRepresentation);
  uint64_t v2 = sub_24CCBBDC0();

  int64_t v3 = 0;
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v38 = v2 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & v4;
  int64_t v39 = (unint64_t)(v5 + 63) >> 6;
  if ((v6 & v4) == 0) {
    goto LABEL_9;
  }
LABEL_7:
  unint64_t v8 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  unint64_t v9 = v8 | (v3 << 6);
  while (2)
  {
    uint64_t v10 = *(void *)(v2 + 56);
    uint64_t v11 = (void *)(*(void *)(v2 + 48) + 16 * v9);
    uint64_t v12 = v11[1];
    *(void *)&long long v40 = *v11;
    *((void *)&v40 + 1) = v12;
    sub_24CC6CA84(v10 + 32 * v9, (uint64_t)v41);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_24CCACF68((uint64_t)&v40, (uint64_t)&v43);
      uint64_t v16 = v44;
      if (!v44)
      {
        swift_release();
        if (qword_269821A88 == -1) {
          goto LABEL_48;
        }
        goto LABEL_52;
      }
      uint64_t v17 = v43;
      sub_24CC761F4(&v45, v42);
      if (qword_269821AD8 != -1) {
        swift_once();
      }
      id v18 = off_269822EE8;
      if (!*((void *)off_269822EE8 + 2)) {
        goto LABEL_6;
      }
      sub_24CCBC540();
      sub_24CCBBEA0();
      uint64_t v19 = sub_24CCBC570();
      uint64_t v20 = -1 << v18[32];
      unint64_t v21 = v19 & ~v20;
      unint64_t v22 = v18 + 56;
      if (((*(void *)&v18[((v21 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v21) & 1) == 0) {
        goto LABEL_6;
      }
      uint64_t v23 = *((void *)v18 + 6);
      id v24 = (void *)(v23 + 16 * v21);
      BOOL v25 = *v24 == v17 && v24[1] == v16;
      if (!v25 && (sub_24CCBC480() & 1) == 0)
      {
        uint64_t v26 = ~v20;
        for (unint64_t i = v21 + 1; ; unint64_t i = v28 + 1)
        {
          uint64_t v28 = i & v26;
          if (((*(void *)&v22[((i & v26) >> 3) & 0xFFFFFFFFFFFFFF8] >> (i & v26)) & 1) == 0) {
            break;
          }
          uint64_t v29 = (void *)(v23 + 16 * v28);
          BOOL v30 = *v29 == v17 && v29[1] == v16;
          if (v30 || (sub_24CCBC480() & 1) != 0) {
            goto LABEL_37;
          }
        }
LABEL_6:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v42);
        swift_bridgeObjectRelease();
        if (v7) {
          goto LABEL_7;
        }
        goto LABEL_9;
      }
LABEL_37:
      *(void *)&long long v40 = 0;
      *((void *)&v40 + 1) = 0xE000000000000000;
      sub_24CCBBEC0();
      sub_24CCBBEC0();
      swift_bridgeObjectRelease();
      sub_24CCBBEC0();
      sub_24CCBC3B0();
      sub_24CCBBEC0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v42);
      if (v7) {
        goto LABEL_7;
      }
LABEL_9:
      int64_t v13 = v3 + 1;
      if (__OFADD__(v3, 1))
      {
        __break(1u);
LABEL_52:
        swift_once();
LABEL_48:
        uint64_t v31 = sub_24CCBB890();
        __swift_project_value_buffer(v31, (uint64_t)qword_2698247B0);
        uint64_t v33 = v46;
        unint64_t v32 = v47;
        swift_bridgeObjectRetain();
        id v34 = sub_24CCBB870();
        os_log_type_t v35 = sub_24CCBC060();
        if (os_log_type_enabled(v34, v35))
        {
          unint64_t v36 = (uint8_t *)swift_slowAlloc();
          uint64_t v37 = swift_slowAlloc();
          *(void *)&long long v40 = v37;
          *(_DWORD *)unint64_t v36 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v43 = sub_24CC692DC(v33, v32, (uint64_t *)&v40);
          sub_24CCBC120();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24CC60000, v34, v35, "%s", v36, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2533103A0](v37, -1, -1);
          MEMORY[0x2533103A0](v36, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        return;
      }
      if (v13 < v39)
      {
        unint64_t v14 = *(void *)(v38 + 8 * v13);
        if (v14) {
          goto LABEL_12;
        }
        int64_t v15 = v3 + 2;
        ++v3;
        if (v13 + 1 < v39)
        {
          unint64_t v14 = *(void *)(v38 + 8 * v15);
          if (v14) {
            goto LABEL_15;
          }
          int64_t v3 = v13 + 1;
          if (v13 + 2 < v39)
          {
            unint64_t v14 = *(void *)(v38 + 8 * (v13 + 2));
            if (v14)
            {
              v13 += 2;
              goto LABEL_12;
            }
            int64_t v15 = v13 + 3;
            int64_t v3 = v13 + 2;
            if (v13 + 3 < v39) {
              break;
            }
          }
        }
      }
LABEL_26:
      unint64_t v7 = 0;
      memset(v41, 0, 32);
      long long v40 = 0u;
    }
    unint64_t v14 = *(void *)(v38 + 8 * v15);
    if (v14)
    {
LABEL_15:
      int64_t v13 = v15;
LABEL_12:
      unint64_t v7 = (v14 - 1) & v14;
      unint64_t v9 = __clz(__rbit64(v14)) + (v13 << 6);
      int64_t v3 = v13;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v39)
    {
      int64_t v3 = v39 - 1;
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v38 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_12;
    }
  }
  __break(1u);
}

uint64_t sub_24CCACF68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822EF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24CCACFD0(void *a1)
{
  id v1 = a1;
  NSUserDefaults.log()();
}

uint64_t sub_24CCAD018()
{
  id v0 = (void *)sub_24CCAD11C((uint64_t)&unk_26FF2AD60);
  uint64_t result = swift_arrayDestroy();
  off_269822EE8 = v0;
  return result;
}

unint64_t static DSDUserDefaultsKey.shouldBypassPeerBrowserDeviceTypesRestriction.getter()
{
  return 0xD00000000000002DLL;
}

unint64_t static DSDUserDefaultsKey.shouldBypassPeerBrowserScopeRestriction.getter()
{
  return 0xD000000000000027;
}

unint64_t static DSDUserDefaultsKey.logPeerConnectionPayloadSize.getter()
{
  return 0xD00000000000001CLL;
}

unint64_t static DSDUserDefaultsKey.guestUserWithNearbyDevice.getter()
{
  return 0xD000000000000019;
}

unint64_t static DSDUserDefaultsKey.guestUserHasSeenHandoverPromotion.getter()
{
  return 0xD000000000000021;
}

unint64_t static DSDUserDefaultsKey.recentlySharedApplications.getter()
{
  return 0xD00000000000001ALL;
}

ValueMetadata *type metadata accessor for DSDUserDefaultsKey()
{
  return &type metadata for DSDUserDefaultsKey;
}

uint64_t sub_24CCAD11C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822EF8);
    uint64_t v3 = sub_24CCBC2B0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_24CCBC540();
      swift_bridgeObjectRetain();
      sub_24CCBBEA0();
      uint64_t result = sub_24CCBC570();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_24CCBC480(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_24CCBC480();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      unint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *unint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_24CCAD2C0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24CCBBC00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822840);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822848);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v33 = (uint64_t)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  BOOL v17 = (char *)&v32 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v32 - v19;
  MEMORY[0x270FA5388](v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))((char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  int v23 = swift_dynamicCast();
  uint64_t v24 = *(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56);
  v24(v20, v23 ^ 1u, 1, v4);
  *(_DWORD *)BOOL v17 = -65569;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v17, *MEMORY[0x263F14310], v4);
  v24(v17, 0, 1, v4);
  uint64_t v25 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_24CCAD700((uint64_t)v20, (uint64_t)v11);
  sub_24CCAD700((uint64_t)v17, v25);
  uint64_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v26((uint64_t)v11, 1, v4) == 1)
  {
    uint64_t v27 = &qword_269822848;
    sub_24CC744B8((uint64_t)v17, &qword_269822848);
    if (v26(v25, 1, v4) == 1)
    {
      char v28 = -1;
    }
    else
    {
      uint64_t v27 = &qword_269822840;
      char v28 = 0;
    }
  }
  else
  {
    uint64_t v29 = v33;
    sub_24CCAD700((uint64_t)v11, v33);
    if (v26(v25, 1, v4) == 1)
    {
      sub_24CC744B8((uint64_t)v17, &qword_269822848);
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v29, v4);
      char v28 = 0;
      uint64_t v27 = &qword_269822840;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v25, v4);
      sub_24CCAD768();
      char v28 = sub_24CCBBDF0();
      BOOL v30 = *(void (**)(char *, uint64_t))(v5 + 8);
      v30(v7, v4);
      uint64_t v27 = &qword_269822848;
      sub_24CC744B8((uint64_t)v17, &qword_269822848);
      v30((char *)v29, v4);
    }
  }
  sub_24CC744B8((uint64_t)v11, v27);
  sub_24CC744B8((uint64_t)v20, &qword_269822848);
  return v28 & 1;
}

uint64_t sub_24CCAD700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822848);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CCAD768()
{
  unint64_t result = qword_269822850;
  if (!qword_269822850)
  {
    sub_24CCBBC00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269822850);
  }
  return result;
}

unint64_t sub_24CCAD7C0()
{
  uint64_t v1 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824810);
  uint64_t v3 = sub_24CCBB870();
  os_log_type_t v4 = sub_24CCBC060();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = sub_24CCBC5E0();
    sub_24CC692DC(v7, v8, &v10);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v3, v4, "%s Invalidating peer connection.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v6, -1, -1);
    MEMORY[0x2533103A0](v5, -1, -1);
  }

  unint64_t result = *(void *)(v1 + qword_269821DD8);
  if (result != 1)
  {
    *(void *)(v1 + qword_269821DD8) = 1;
    sub_24CC736F4(result);
    return sub_24CCBBA70();
  }
  return result;
}

uint64_t sub_24CCAD998(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = sub_24CCBBA00();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v4 = sub_24CCBB520();
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  v2[15] = swift_task_alloc();
  uint64_t v5 = sub_24CCBB890();
  v2[16] = v5;
  v2[17] = *(void *)(v5 - 8);
  v2[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCADB40, 0, 0);
}

uint64_t sub_24CCADB40()
{
  uint64_t v40 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_269824810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC060();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v32 = v6;
    uint64_t v7 = *(void *)(v0 + 120);
    uint64_t v8 = *(void *)(v0 + 104);
    uint64_t v35 = *(void *)(v0 + 96);
    uint64_t v33 = *(void *)(v0 + 64);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    v39[0] = v38;
    *(_DWORD *)uint64_t v9 = 136446466;
    uint64_t v10 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0x293A5F28646E6573, 0xE800000000000000);
    *(void *)(v0 + 40) = sub_24CC692DC(v10, v11, v39);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v12 = v33 + qword_269824780;
    swift_beginAccess();
    sub_24CC74734(v12, v7, &qword_269821D90);
    int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v7, 1, v35);
    uint64_t v14 = *(void *)(v0 + 120);
    if (v13)
    {
      sub_24CC744B8(*(void *)(v0 + 120), &qword_269821D90);
      unint64_t v15 = 0xE500000000000000;
      uint64_t v16 = 0x4449206F4ELL;
    }
    else
    {
      uint64_t v21 = *(void *)(v0 + 104);
      uint64_t v20 = *(void *)(v0 + 112);
      uint64_t v22 = *(void *)(v0 + 96);
      (*(void (**)(uint64_t, void, uint64_t))(v21 + 16))(v20, *(void *)(v0 + 120), v22);
      sub_24CC744B8(v14, &qword_269821D90);
      uint64_t v16 = sub_24CCBB4F0();
      unint64_t v15 = v23;
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    }
    uint64_t v24 = *(void *)(v0 + 136);
    uint64_t v36 = *(void *)(v0 + 144);
    uint64_t v25 = *(void *)(v0 + 128);
    *(void *)(v0 + 48) = sub_24CC692DC(v16, v15, v39);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24CC60000, v5, v32, "%{public}s [%s]", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v38, -1, -1);
    MEMORY[0x2533103A0](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v36, v25);
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 136);
    uint64_t v17 = *(void *)(v0 + 144);
    uint64_t v19 = *(void *)(v0 + 128);
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  sub_24CCBBB60();
  sub_24CCBB6F0();
  sub_24CCB691C(&qword_269822FE8, MEMORY[0x263F39F90]);
  sub_24CCBC2E0();
  int v26 = *(_DWORD *)(v0 + 152);
  if (qword_269821A70 != -1) {
    swift_once();
  }
  uint64_t v27 = *(void *)(v0 + 80);
  uint64_t v34 = *(void *)(v0 + 72);
  uint64_t v37 = *(void *)(v0 + 88);
  swift_retain();
  uint64_t v28 = sub_24CCBBB50();
  v39[3] = MEMORY[0x263F8E8F8];
  LODWORD(v39[0]) = v26;
  sub_24CCBBB80();
  sub_24CCBC2E0();
  *(_DWORD *)(v0 + 160) = *(_DWORD *)(v0 + 156);
  sub_24CCBC460();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821E08);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_24CCBD450;
  *(void *)(v29 + 32) = v28;
  v39[0] = v29;
  sub_24CCBBF20();
  sub_24CCBB9F0();
  swift_allocObject();
  swift_retain();
  sub_24CCBB9D0();
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v37, *MEMORY[0x263F141D8], v34);
  sub_24CCBBA40();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v37, v34);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t sub_24CCAE170(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = sub_24CCBBA00();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269823020);
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_24CCBB520();
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  v3[17] = swift_task_alloc();
  uint64_t v6 = sub_24CCBB890();
  v3[18] = v6;
  v3[19] = *(void *)(v6 - 8);
  v3[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCAE34C, 0, 0);
}

uint64_t sub_24CCAE34C()
{
  uint64_t v45 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_269824810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v43 = sub_24CCBC060();
  if (os_log_type_enabled(v5, v43))
  {
    uint64_t v6 = *(void *)(v0 + 136);
    uint64_t v7 = *(void *)(v0 + 120);
    uint64_t v40 = *(void *)(v0 + 112);
    uint64_t v38 = *(void *)(v0 + 72);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v44[0] = v42;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v9 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0xD000000000000010, 0x800000024CCBEDD0);
    *(void *)(v0 + 40) = sub_24CC692DC(v9, v10, v44);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v11 = v38 + qword_269824780;
    swift_beginAccess();
    sub_24CC74734(v11, v6, &qword_269821D90);
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v40);
    uint64_t v13 = *(void *)(v0 + 136);
    if (v12)
    {
      sub_24CC744B8(*(void *)(v0 + 136), &qword_269821D90);
      unint64_t v14 = 0xE500000000000000;
      uint64_t v15 = 0x4449206F4ELL;
    }
    else
    {
      uint64_t v19 = *(void *)(v0 + 120);
      uint64_t v20 = *(void *)(v0 + 128);
      uint64_t v21 = *(void *)(v0 + 112);
      (*(void (**)(uint64_t, void, uint64_t))(v19 + 16))(v20, *(void *)(v0 + 136), v21);
      sub_24CC744B8(v13, &qword_269821D90);
      uint64_t v15 = sub_24CCBB4F0();
      unint64_t v14 = v22;
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    }
    uint64_t v23 = *(void *)(v0 + 152);
    uint64_t v41 = *(void *)(v0 + 160);
    uint64_t v24 = *(void *)(v0 + 144);
    *(void *)(v0 + 48) = sub_24CC692DC(v15, v14, v44);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24CC60000, v5, v43, "%{public}s [%s]", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v42, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v41, v24);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 152);
    uint64_t v16 = *(void *)(v0 + 160);
    uint64_t v18 = *(void *)(v0 + 144);
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  uint64_t v25 = *(void *)(v0 + 104);
  sub_24CC74734(*(void *)(v0 + 64), v25, &qword_269823020);
  uint64_t v26 = sub_24CCBB710();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v25, 1, v26) == 1)
  {
    sub_24CC744B8(*(void *)(v0 + 104), &qword_269823020);
    uint64_t v27 = 0;
    unint64_t v28 = 0xF000000000000000;
  }
  else
  {
    sub_24CCB691C(&qword_269823030, MEMORY[0x263F39FA8]);
    uint64_t v27 = sub_24CCBB840();
    unint64_t v28 = v29;
    sub_24CC86180(*(void *)(v0 + 104));
  }
  unint64_t v39 = v28;
  sub_24CCAFE0C(v27, v28);
  sub_24CCBBB60();
  sub_24CCBB6F0();
  sub_24CCB691C(&qword_269822FE8, MEMORY[0x263F39F90]);
  sub_24CCBC2E0();
  int v30 = *(_DWORD *)(v0 + 168);
  if (qword_269821A70 != -1) {
    swift_once();
  }
  uint64_t v31 = *(void *)(v0 + 88);
  uint64_t v36 = *(void *)(v0 + 80);
  uint64_t v37 = *(void *)(v0 + 96);
  swift_retain();
  uint64_t v32 = sub_24CCBBB50();
  v44[3] = MEMORY[0x263F8E8F8];
  LODWORD(v44[0]) = v30;
  sub_24CCBBB80();
  sub_24CCBC2E0();
  *(_DWORD *)(v0 + 176) = *(_DWORD *)(v0 + 172);
  sub_24CCBC460();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821E08);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_24CCBD450;
  *(void *)(v33 + 32) = v32;
  v44[0] = v33;
  sub_24CCBBF20();
  sub_24CCBB9F0();
  swift_allocObject();
  swift_retain();
  sub_24CCBB9D0();
  (*(void (**)(uint64_t, void, uint64_t))(v31 + 104))(v37, *MEMORY[0x263F141D8], v36);
  sub_24CCBBA40();
  swift_release();
  sub_24CC73704(v27, v39);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v37, v36);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
  return v34();
}

uint64_t sub_24CCAEAD4(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = sub_24CCBBA00();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269823008);
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_24CCBB520();
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  v3[17] = swift_task_alloc();
  uint64_t v6 = sub_24CCBB890();
  v3[18] = v6;
  v3[19] = *(void *)(v6 - 8);
  v3[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCAECB0, 0, 0);
}

uint64_t sub_24CCAECB0()
{
  uint64_t v45 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_269824810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v43 = sub_24CCBC060();
  if (os_log_type_enabled(v5, v43))
  {
    uint64_t v6 = *(void *)(v0 + 136);
    uint64_t v7 = *(void *)(v0 + 120);
    uint64_t v40 = *(void *)(v0 + 112);
    uint64_t v39 = *(void *)(v0 + 72);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v44[0] = v42;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v9 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0xD000000000000010, 0x800000024CCBEDD0);
    *(void *)(v0 + 40) = sub_24CC692DC(v9, v10, v44);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v11 = v39 + qword_269824780;
    swift_beginAccess();
    sub_24CC74734(v11, v6, &qword_269821D90);
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v40);
    uint64_t v13 = *(void *)(v0 + 136);
    if (v12)
    {
      sub_24CC744B8(*(void *)(v0 + 136), &qword_269821D90);
      unint64_t v14 = 0xE500000000000000;
      uint64_t v15 = 0x4449206F4ELL;
    }
    else
    {
      uint64_t v19 = *(void *)(v0 + 120);
      uint64_t v20 = *(void *)(v0 + 128);
      uint64_t v21 = *(void *)(v0 + 112);
      (*(void (**)(uint64_t, void, uint64_t))(v19 + 16))(v20, *(void *)(v0 + 136), v21);
      sub_24CC744B8(v13, &qword_269821D90);
      uint64_t v15 = sub_24CCBB4F0();
      unint64_t v14 = v22;
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    }
    uint64_t v23 = *(void *)(v0 + 152);
    uint64_t v41 = *(void *)(v0 + 160);
    uint64_t v24 = *(void *)(v0 + 144);
    *(void *)(v0 + 48) = sub_24CC692DC(v15, v14, v44);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24CC60000, v5, v43, "%{public}s [%s]", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v42, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v41, v24);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 152);
    uint64_t v16 = *(void *)(v0 + 160);
    uint64_t v18 = *(void *)(v0 + 144);
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  uint64_t v25 = *(void *)(v0 + 104);
  sub_24CC74734(*(void *)(v0 + 64), v25, &qword_269823008);
  uint64_t v26 = sub_24CCBB560();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
  {
    sub_24CC744B8(*(void *)(v0 + 104), &qword_269823008);
    uint64_t v28 = 0;
    unint64_t v29 = 0xF000000000000000;
  }
  else
  {
    sub_24CCB691C(&qword_269823018, MEMORY[0x263F39EA0]);
    uint64_t v28 = sub_24CCBB840();
    unint64_t v29 = v30;
    (*(void (**)(void, uint64_t))(v27 + 8))(*(void *)(v0 + 104), v26);
  }
  sub_24CCAFE0C(v28, v29);
  sub_24CCBBB60();
  sub_24CCBB6F0();
  sub_24CCB691C(&qword_269822FE8, MEMORY[0x263F39F90]);
  sub_24CCBC2E0();
  int v31 = *(_DWORD *)(v0 + 168);
  if (qword_269821A70 != -1) {
    swift_once();
  }
  uint64_t v32 = *(void *)(v0 + 88);
  uint64_t v37 = *(void *)(v0 + 80);
  uint64_t v38 = *(void *)(v0 + 96);
  swift_retain();
  uint64_t v33 = sub_24CCBBB50();
  v44[3] = MEMORY[0x263F8E8F8];
  LODWORD(v44[0]) = v31;
  sub_24CCBBB80();
  sub_24CCBC2E0();
  *(_DWORD *)(v0 + 176) = *(_DWORD *)(v0 + 172);
  sub_24CCBC460();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821E08);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_24CCBD450;
  *(void *)(v34 + 32) = v33;
  v44[0] = v34;
  sub_24CCBBF20();
  sub_24CCBB9F0();
  swift_allocObject();
  swift_retain();
  sub_24CCBB9D0();
  (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))(v38, *MEMORY[0x263F141D8], v37);
  sub_24CCBBA40();
  swift_release();
  sub_24CC73704(v28, v29);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v38, v37);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_24CCAF470(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = sub_24CCBBA00();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822FF0);
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_24CCBB520();
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  v3[17] = swift_task_alloc();
  uint64_t v6 = sub_24CCBB890();
  v3[18] = v6;
  v3[19] = *(void *)(v6 - 8);
  v3[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCAF64C, 0, 0);
}

uint64_t sub_24CCAF64C()
{
  uint64_t v45 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_269824810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v43 = sub_24CCBC060();
  if (os_log_type_enabled(v5, v43))
  {
    uint64_t v6 = *(void *)(v0 + 136);
    uint64_t v7 = *(void *)(v0 + 120);
    uint64_t v40 = *(void *)(v0 + 112);
    uint64_t v39 = *(void *)(v0 + 72);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v44[0] = v42;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v9 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0xD000000000000010, 0x800000024CCBEDD0);
    *(void *)(v0 + 40) = sub_24CC692DC(v9, v10, v44);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v11 = v39 + qword_269824780;
    swift_beginAccess();
    sub_24CC74734(v11, v6, &qword_269821D90);
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v40);
    uint64_t v13 = *(void *)(v0 + 136);
    if (v12)
    {
      sub_24CC744B8(*(void *)(v0 + 136), &qword_269821D90);
      unint64_t v14 = 0xE500000000000000;
      uint64_t v15 = 0x4449206F4ELL;
    }
    else
    {
      uint64_t v19 = *(void *)(v0 + 120);
      uint64_t v20 = *(void *)(v0 + 128);
      uint64_t v21 = *(void *)(v0 + 112);
      (*(void (**)(uint64_t, void, uint64_t))(v19 + 16))(v20, *(void *)(v0 + 136), v21);
      sub_24CC744B8(v13, &qword_269821D90);
      uint64_t v15 = sub_24CCBB4F0();
      unint64_t v14 = v22;
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    }
    uint64_t v23 = *(void *)(v0 + 152);
    uint64_t v41 = *(void *)(v0 + 160);
    uint64_t v24 = *(void *)(v0 + 144);
    *(void *)(v0 + 48) = sub_24CC692DC(v15, v14, v44);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24CC60000, v5, v43, "%{public}s [%s]", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v42, -1, -1);
    MEMORY[0x2533103A0](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v41, v24);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 152);
    uint64_t v16 = *(void *)(v0 + 160);
    uint64_t v18 = *(void *)(v0 + 144);
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  uint64_t v25 = *(void *)(v0 + 104);
  sub_24CC74734(*(void *)(v0 + 64), v25, &qword_269822FF0);
  uint64_t v26 = sub_24CCBB650();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
  {
    sub_24CC744B8(*(void *)(v0 + 104), &qword_269822FF0);
    uint64_t v28 = 0;
    unint64_t v29 = 0xF000000000000000;
  }
  else
  {
    sub_24CCB691C(&qword_269823000, MEMORY[0x263F39EF0]);
    uint64_t v28 = sub_24CCBB840();
    unint64_t v29 = v30;
    (*(void (**)(void, uint64_t))(v27 + 8))(*(void *)(v0 + 104), v26);
  }
  sub_24CCAFE0C(v28, v29);
  sub_24CCBBB60();
  sub_24CCBB6F0();
  sub_24CCB691C(&qword_269822FE8, MEMORY[0x263F39F90]);
  sub_24CCBC2E0();
  int v31 = *(_DWORD *)(v0 + 168);
  if (qword_269821A70 != -1) {
    swift_once();
  }
  uint64_t v32 = *(void *)(v0 + 88);
  uint64_t v37 = *(void *)(v0 + 80);
  uint64_t v38 = *(void *)(v0 + 96);
  swift_retain();
  uint64_t v33 = sub_24CCBBB50();
  v44[3] = MEMORY[0x263F8E8F8];
  LODWORD(v44[0]) = v31;
  sub_24CCBBB80();
  sub_24CCBC2E0();
  *(_DWORD *)(v0 + 176) = *(_DWORD *)(v0 + 172);
  sub_24CCBC460();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821E08);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_24CCBD450;
  *(void *)(v34 + 32) = v33;
  v44[0] = v34;
  sub_24CCBBF20();
  sub_24CCBB9F0();
  swift_allocObject();
  swift_retain();
  sub_24CCBB9D0();
  (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))(v38, *MEMORY[0x263F141D8], v37);
  sub_24CCBBA40();
  swift_release();
  sub_24CC73704(v28, v29);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v38, v37);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

void sub_24CCAFE0C(uint64_t a1, unint64_t a2)
{
  unint64_t v57 = a2;
  uint64_t v54 = a1;
  uint64_t v2 = sub_24CCBB520();
  uint64_t v52 = *(void *)(v2 - 8);
  uint64_t v53 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v49 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v51 = (uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CCBB890();
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v56 = v6;
  MEMORY[0x270FA5388](v6);
  id v59 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24CCBB460();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24CCBB440();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24CCBB470();
  uint64_t v50 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AD0 != -1) {
    swift_once();
  }
  uint64_t v19 = (void *)qword_269822EE0;
  uint64_t v20 = (void *)sub_24CCBBE20();
  LODWORD(v19) = objc_msgSend(v19, sel_BOOLForKey_, v20);

  if (v19)
  {
    unint64_t v21 = v57;
    if (v57 >> 60 == 15)
    {
      unint64_t v22 = 0xE400000000000000;
      uint64_t v23 = 1701736302;
    }
    else
    {
      uint64_t v24 = 0;
      switch(v57 >> 62)
      {
        case 1uLL:
          uint64_t v25 = v54;
          if (__OFSUB__(HIDWORD(v54), v54))
          {
            __break(1u);
LABEL_23:
            __break(1u);
            JUMPOUT(0x24CCB067CLL);
          }
          uint64_t v24 = HIDWORD(v54) - (int)v54;
LABEL_11:
          sub_24CC74660(v25, v57);
          unint64_t v21 = v57;
LABEL_12:
          uint64_t v63 = v24;
          (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F069D8], v12);
          sub_24CCBB450();
          sub_24CCBB410();
          (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
          (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
          sub_24CC74B74();
          sub_24CCB691C((unint64_t *)&unk_269822080, MEMORY[0x263F069E8]);
          sub_24CCBC150();
          sub_24CC73704(v54, v21);
          (*(void (**)(char *, uint64_t))(v50 + 8))(v18, v16);
          uint64_t v23 = v61;
          unint64_t v22 = v62;
          break;
        case 2uLL:
          uint64_t v25 = v54;
          uint64_t v27 = *(void *)(v54 + 16);
          uint64_t v26 = *(void *)(v54 + 24);
          uint64_t v24 = v26 - v27;
          if (!__OFSUB__(v26, v27)) {
            goto LABEL_11;
          }
          goto LABEL_23;
        case 3uLL:
          goto LABEL_12;
        default:
          uint64_t v24 = BYTE6(v57);
          goto LABEL_12;
      }
    }
    uint64_t v29 = v58;
    uint64_t v28 = v59;
    uint64_t v31 = v55;
    uint64_t v30 = v56;
    if (qword_269821AA8 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v30, (uint64_t)qword_269824810);
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v28, v32, v30);
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_24CCBB870();
    int v34 = sub_24CCBC060();
    if (os_log_type_enabled(v33, (os_log_type_t)v34))
    {
      LODWORD(v57) = v34;
      uint64_t v35 = swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v63 = v54;
      *(_DWORD *)uint64_t v35 = 136446722;
      uint64_t v36 = sub_24CC9E160(0xD000000000000062, 0x800000024CCBED20, 0xD00000000000001BLL, 0x800000024CCBEF00);
      uint64_t v61 = sub_24CC692DC(v36, v37, &v63);
      sub_24CCBC120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      uint64_t v38 = v29 + qword_269824780;
      swift_beginAccess();
      uint64_t v39 = v51;
      sub_24CC74734(v38, v51, &qword_269821D90);
      uint64_t v41 = v52;
      uint64_t v40 = v53;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v39, 1, v53))
      {
        sub_24CC744B8(v39, &qword_269821D90);
        unint64_t v42 = 0xE500000000000000;
        uint64_t v43 = 0x4449206F4ELL;
      }
      else
      {
        uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 16);
        uint64_t v50 = v23;
        uint64_t v45 = v49;
        v44(v49, v39, v40);
        sub_24CC744B8(v39, &qword_269821D90);
        uint64_t v43 = sub_24CCBB4F0();
        unint64_t v42 = v46;
        unint64_t v47 = v45;
        uint64_t v23 = v50;
        (*(void (**)(char *, uint64_t))(v41 + 8))(v47, v40);
      }
      uint64_t v60 = sub_24CC692DC(v43, v42, &v63);
      sub_24CCBC120();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_24CC692DC(v23, v22, &v63);
      sub_24CCBC120();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24CC60000, v33, (os_log_type_t)v57, "%{public}s [%s] Payload size: %s", (uint8_t *)v35, 0x20u);
      uint64_t v48 = v54;
      swift_arrayDestroy();
      MEMORY[0x2533103A0](v48, -1, -1);
      MEMORY[0x2533103A0](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v59, v30);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v30);
    }
  }
}

uint64_t sub_24CCB068C()
{
  v1[10] = v0;
  uint64_t v2 = sub_24CCBB6F0();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCB074C, 0, 0);
}

uint64_t sub_24CCB074C()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v5 = sub_24CCBB890();
  __swift_project_value_buffer(v5, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0x6574617669746361, 0xEA00000000002928);
  uint64_t v6 = *(void *)(v4 + 16);
  v0[14] = v6;
  v0[2] = v6;
  uint64_t v7 = *MEMORY[0x263F39F10];
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
  v0[15] = v8;
  v0[16] = (v2 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v8(v1, v7, v3);
  swift_retain();
  swift_retain();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[17] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269823048);
  v0[18] = v10;
  uint64_t v11 = sub_24CCBB7B0();
  unint64_t v12 = sub_24CCB6584();
  v0[19] = v12;
  uint64_t v13 = sub_24CCB691C(&qword_269823058, MEMORY[0x263F39FE0]);
  *uint64_t v9 = v0;
  v9[1] = sub_24CCB0954;
  uint64_t v14 = v0[13];
  uint64_t v15 = v0[10];
  return MEMORY[0x270F26018](v14, &unk_269823040, v15, v10, v11, v12, v13);
}

uint64_t sub_24CCB0954()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 104);
  uint64_t v3 = *(void *)(*v0 + 96);
  uint64_t v4 = *(void *)(*v0 + 88);
  swift_task_dealloc();
  swift_release();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v1 + 160) = v5;
  *(void *)(v1 + 168) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v2, v4);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB0AFC, 0, 0);
}

uint64_t sub_24CCB0AFC()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[3] = v0[14];
  v1(v2, *MEMORY[0x263F39F20], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[22] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB0BF0;
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[10];
  return MEMORY[0x270F26020](v7, &unk_269823068, v8, v5, v6);
}

uint64_t sub_24CCB0BF0()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB0D98, 0, 0);
}

uint64_t sub_24CCB0D98()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[4] = v0[14];
  v1(v2, *MEMORY[0x263F39F60], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[23] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB0E8C;
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[10];
  return MEMORY[0x270F26020](v7, &unk_269823078, v8, v5, v6);
}

uint64_t sub_24CCB0E8C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB1034, 0, 0);
}

uint64_t sub_24CCB1034()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[5] = v0[14];
  v1(v2, *MEMORY[0x263F39F58], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[24] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB1128;
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[10];
  return MEMORY[0x270F26020](v7, &unk_269823088, v8, v5, v6);
}

uint64_t sub_24CCB1128()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB12D0, 0, 0);
}

uint64_t sub_24CCB12D0()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[6] = v0[14];
  v1(v2, *MEMORY[0x263F39F28], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[25] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB13C4;
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[10];
  return MEMORY[0x270F26020](v7, &unk_269823098, v8, v5, v6);
}

uint64_t sub_24CCB13C4()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB156C, 0, 0);
}

uint64_t sub_24CCB156C()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[7] = v0[14];
  v1(v2, *MEMORY[0x263F39F88], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[26] = v4;
  uint64_t v5 = sub_24CCBB640();
  uint64_t v6 = sub_24CCB691C(&qword_2698230B0, MEMORY[0x263F39EE0]);
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB16A8;
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[13];
  uint64_t v10 = v0[10];
  return MEMORY[0x270F26018](v9, &unk_2698230A8, v10, v7, v5, v8, v6);
}

uint64_t sub_24CCB16A8()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB1850, 0, 0);
}

uint64_t sub_24CCB1850()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  v0[8] = v0[14];
  v1(v2, *MEMORY[0x263F39F80], v3);
  uint64_t v5 = swift_allocObject();
  v0[27] = v5;
  *(void *)(v5 + 16) = &unk_2698230C0;
  *(void *)(v5 + 24) = v4;
  swift_retain();
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[28] = v6;
  void *v6 = v0;
  v6[1] = sub_24CCB198C;
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[13];
  uint64_t v10 = MEMORY[0x263F8D310];
  uint64_t v11 = MEMORY[0x263F3A058];
  return MEMORY[0x270F26018](v9, &unk_2698230D0, v5, v7, v10, v8, v11);
}

uint64_t sub_24CCB198C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB1B34, 0, 0);
}

uint64_t sub_24CCB1B34()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[9] = v0[14];
  v1(v2, *MEMORY[0x263F39F30], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[29] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB1C28;
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[10];
  return MEMORY[0x270F26020](v7, &unk_2698230E0, v8, v5, v6);
}

uint64_t sub_24CCB1C28()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*v0 + 160);
  uint64_t v2 = *(void *)(*v0 + 104);
  uint64_t v3 = *(void *)(*v0 + 88);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_24CCB1DD0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24CCB1DF0, 0, 0);
}

uint64_t sub_24CCB1DF0()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  int8x16_t v6 = *(int8x16_t *)(v0 + 16);
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000021, 0x800000024CCC0340);
  uint64_t v2 = (int8x16_t *)swift_task_alloc();
  v2[1] = vextq_s8(v6, v6, 8uLL);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000013, 0x800000024CCBEEE0);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = sub_24CCB6D0C;
  *(void *)(v3 + 24) = v2;
  sub_24CCBB5D0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24CCB1FD0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24CCB1FF0, 0, 0);
}

uint64_t sub_24CCB1FF0()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD00000000000001ELL, 0x800000024CCC0320);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 16);
  __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000013, 0x800000024CCBEEE0);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = sub_24CCB6CB0;
  *(void *)(v3 + 24) = v2;
  sub_24CCBB5D0();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24CCB21A0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24CCB21C0, 0, 0);
}

uint64_t sub_24CCB21C0()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD00000000000001ALL, 0x800000024CCC0300);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 16);
  __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000013, 0x800000024CCBEEE0);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = sub_24CCB6C54;
  *(void *)(v3 + 24) = v2;
  sub_24CCBB5D0();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24CCB2370(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24CCB2390, 0, 0);
}

uint64_t sub_24CCB2390()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000019, 0x800000024CCC02E0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 16);
  __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000013, 0x800000024CCBEEE0);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = sub_24CCB6BF8;
  *(void *)(v3 + 24) = v2;
  sub_24CCBB5D0();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24CCB2540(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24CCB2560, 0, 0);
}

uint64_t sub_24CCB2560()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD00000000000001CLL, 0x800000024CCC02C0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 16);
  __swift_project_value_buffer(v1, (uint64_t)qword_2698247F8);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000013, 0x800000024CCBEEE0);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = sub_24CCB6B9C;
  *(void *)(v3 + 24) = v2;
  sub_24CCBB5D0();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24CCB2710(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24CCB2730, 0, 0);
}

uint64_t sub_24CCB2730()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD00000000000001ALL, 0x800000024CCC0280);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v1;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_2698247F8);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000013, 0x800000024CCBEEE0);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = sub_24CCB6D74;
  *(void *)(v4 + 24) = v3;
  sub_24CCBB5D0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24CCB28FC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return sub_24CCB44C0(a1, a2);
}

uint64_t sub_24CCB29A4(uint64_t *a1, int *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return v7(v3, v4);
}

uint64_t sub_24CCB2A84()
{
  return MEMORY[0x270FA2498](sub_24CCB2AA0, 0, 0);
}

uint64_t sub_24CCB2AA0()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24CC60000, v2, v3, "Received heartbeat.", v4, 2u);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24CCB2BB8()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24CCB2BD8, 0, 0);
}

uint64_t sub_24CCB2BD8()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0x6164696C61766E69, 0xEC00000029286574);
  sub_24CCAD7C0();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24CCB2CC0()
{
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247F8);
  swift_unknownObjectRetain_n();
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v10 = v4;
    *(_DWORD *)uint64_t v3 = 136315650;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v10);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24CC692DC(0xD000000000000012, 0x800000024CCBF360, &v10);
    sub_24CCBC120();
    *(_WORD *)(v3 + 22) = 2080;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822418);
    uint64_t v7 = sub_24CCBBE70();
    sub_24CC692DC(v7, v8, &v10);
    sub_24CCBC120();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v1, v2, "%s %s: %s", (uint8_t *)v3, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  return sub_24CCBB5C0();
}

uint64_t sub_24CCB2F54(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  swift_unknownObjectRetain();
  swift_getObjectType();
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6) {
    a2(v6, v5);
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_24CCB2FD0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269823020);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_24CCBB6F0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCB30C0, 0, 0);
}

uint64_t sub_24CCB30C0()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = sub_24CCBB890();
  __swift_project_value_buffer(v6, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD00000000000001FLL, 0x800000024CCBF4E0);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F39F18], v4);
  sub_24CC8611C(v5, v3);
  uint64_t v7 = sub_24CCBB710();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 0, 1, v7);
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269823028 + dword_269823028);
  unint64_t v8 = (void *)swift_task_alloc();
  v0[8] = v8;
  void *v8 = v0;
  v8[1] = sub_24CCB3284;
  uint64_t v9 = v0[7];
  uint64_t v10 = v0[4];
  return v12(v9, v10);
}

uint64_t sub_24CCB3284()
{
  uint64_t v2 = *(void *)(*v1 + 56);
  uint64_t v3 = *(void *)(*v1 + 48);
  uint64_t v4 = *(void *)(*v1 + 40);
  uint64_t v5 = *(void *)(*v1 + 32);
  uint64_t v6 = *v1;
  *(void *)(v6 + 72) = v0;
  swift_task_dealloc();
  sub_24CC744B8(v5, &qword_269823020);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCB3460, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
}

uint64_t sub_24CCB3460()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCB34D0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269823008);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_24CCBB6F0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCB35C0, 0, 0);
}

uint64_t sub_24CCB35C0()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = sub_24CCBB890();
  __swift_project_value_buffer(v6, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD00000000000001BLL, 0x800000024CCBF4C0);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F39F70], v4);
  uint64_t v7 = sub_24CCBB560();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v5, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v3, 0, 1, v7);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269823010 + dword_269823010);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[8] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24CCB37B0;
  uint64_t v10 = v0[7];
  uint64_t v11 = v0[4];
  return v13(v10, v11);
}

uint64_t sub_24CCB37B0()
{
  uint64_t v2 = *(void *)(*v1 + 56);
  uint64_t v3 = *(void *)(*v1 + 48);
  uint64_t v4 = *(void *)(*v1 + 40);
  uint64_t v5 = *(void *)(*v1 + 32);
  uint64_t v6 = *v1;
  *(void *)(v6 + 72) = v0;
  swift_task_dealloc();
  sub_24CC744B8(v5, &qword_269823008);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCB6D7C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
}

uint64_t sub_24CCB398C()
{
  v1[2] = v0;
  uint64_t v2 = sub_24CCBB6F0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCB3A4C, 0, 0);
}

uint64_t sub_24CCB3A4C()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = sub_24CCBB890();
  __swift_project_value_buffer(v4, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000014, 0x800000024CCBF4A0);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F39F78], v3);
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)&dword_269822FE0 + dword_269822FE0);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[6] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCB3BB4;
  uint64_t v6 = v0[5];
  return v8(v6);
}

uint64_t sub_24CCB3BB4()
{
  uint64_t v2 = *(void *)(*v1 + 40);
  uint64_t v3 = *(void *)(*v1 + 32);
  uint64_t v4 = *(void *)(*v1 + 24);
  uint64_t v5 = *v1;
  *(void *)(v5 + 56) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCB3D5C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24CCB3D5C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCB3DC0()
{
  *(void *)(v1 + 24) = *v0;
  return MEMORY[0x270FA2498](sub_24CCB3E04, 0, 0);
}

uint64_t sub_24CCB3E04()
{
  uint64_t v11 = v0;
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC050();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v10 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = sub_24CCBC5E0();
    *(void *)(v0 + 16) = sub_24CC692DC(v6, v7, &v10);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    *(void *)(v0 + 16) = sub_24CC692DC(0xD000000000000012, 0x800000024CCBF480, &v10);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v2, v3, "[%s] %s should not be sent over peer connection", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_24CCB4004(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269822FF0);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_24CCBB6F0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCB40F4, 0, 0);
}

uint64_t sub_24CCB40F4()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = sub_24CCBB890();
  __swift_project_value_buffer(v6, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000019, 0x800000024CCBF3D0);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F39F68], v4);
  uint64_t v7 = sub_24CCBB650();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v5, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v3, 0, 1, v7);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269822FF8 + dword_269822FF8);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[8] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24CCB42E4;
  uint64_t v10 = v0[7];
  uint64_t v11 = v0[4];
  return v13(v10, v11);
}

uint64_t sub_24CCB42E4()
{
  uint64_t v2 = *(void *)(*v1 + 56);
  uint64_t v3 = *(void *)(*v1 + 48);
  uint64_t v4 = *(void *)(*v1 + 40);
  uint64_t v5 = *(void *)(*v1 + 32);
  uint64_t v6 = *v1;
  *(void *)(v6 + 72) = v0;
  swift_task_dealloc();
  sub_24CC744B8(v5, &qword_269822FF0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCB6D7C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
}

uint64_t sub_24CCB44C0(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  uint64_t v4 = sub_24CCBB520();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCB45C4, 0, 0);
}

uint64_t sub_24CCB45C4()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_24CCBB890();
  __swift_project_value_buffer(v4, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000019, 0x800000024CCC02A0);
  sub_24CCBB4E0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24CC744B8(v0[9], &qword_269821D90);
    uint64_t v5 = sub_24CCBB870();
    os_log_type_t v6 = sub_24CCBC040();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24CC60000, v5, v6, "Peer identifier is not a valid UUID", v7, 2u);
      MEMORY[0x2533103A0](v7, -1, -1);
    }
  }
  else
  {
    uint64_t v9 = v0[11];
    uint64_t v8 = v0[12];
    uint64_t v10 = v0[10];
    uint64_t v12 = v0[7];
    uint64_t v11 = v0[8];
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 32))(v8, v0[9], v10);
    uint64_t v13 = *(void *)(v12 + 16);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v11, v8, v10);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v11, 0, 1, v10);
    uint64_t v14 = v13 + qword_269824780;
    swift_beginAccess();
    sub_24CCB6470(v11, v14);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24CCB4850()
{
  v1[2] = v0;
  uint64_t v2 = sub_24CCBB6F0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCB4910, 0, 0);
}

uint64_t sub_24CCB4910()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824810);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC060();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24CC60000, v2, v3, "Peer Connection Service sending heartbeat", v4, 2u);
    MEMORY[0x2533103A0](v4, -1, -1);
  }
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = v0[3];

  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x263F39F48], v7);
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)&dword_269822FE0 + dword_269822FE0);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[6] = v8;
  void *v8 = v0;
  v8[1] = sub_24CCB4AAC;
  uint64_t v9 = v0[5];
  return v11(v9);
}

uint64_t sub_24CCB4AAC()
{
  uint64_t v2 = *(void *)(*v1 + 40);
  uint64_t v3 = *(void *)(*v1 + 32);
  uint64_t v4 = *(void *)(*v1 + 24);
  uint64_t v5 = *v1;
  *(void *)(v5 + 56) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCB6D70, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24CCB4C54(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24CCB4C74, 0, 0);
}

uint64_t sub_24CCB4C74()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD00000000000001ALL, 0x800000024CCC0280);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v1;
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_2698247F8);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000013, 0x800000024CCBEEE0);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = sub_24CCB6294;
  *(void *)(v4 + 24) = v3;
  sub_24CCBB5D0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24CCB4E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CCBB640();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822008);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24CCBBFA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = a1;
  *((void *)v14 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v14[v13], (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_unknownObjectRetain();
  sub_24CCA5444((uint64_t)v11, (uint64_t)&unk_269822FD8, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_24CCB5020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 56) + **(int **)(a5 + 56));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v10;
  void *v10 = v6;
  v10[1] = sub_24CC68584;
  return v12(a6, ObjectType, a5);
}

uint64_t sub_24CCB5134()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13DeviceSharing44GuestUserAccessResponsePeerConnectionService_observers;
  uint64_t v2 = sub_24CCBB610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24CCB51DC()
{
  return type metadata accessor for GuestUserAccessResponsePeerConnectionService();
}

uint64_t type metadata accessor for GuestUserAccessResponsePeerConnectionService()
{
  uint64_t result = qword_269822F08;
  if (!qword_269822F08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CCB5230()
{
  uint64_t result = sub_24CCBB610();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24CCB52D0()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_24CC85FB0;
  return sub_24CCB068C();
}

uint64_t sub_24CCB535C()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24CCB2BD8, 0, 0);
}

uint64_t sub_24CCB5400(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  return sub_24CCB2FD0(a1);
}

uint64_t sub_24CCB5494(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  return sub_24CCB34D0(a1);
}

uint64_t sub_24CCB5528()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return sub_24CCB398C();
}

uint64_t sub_24CCB55B4()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[3] = *v0;
  return MEMORY[0x270FA2498](sub_24CCB3E04, 0, 0);
}

uint64_t sub_24CCB5680(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  return sub_24CCB4004(a1);
}

uint64_t sub_24CCB5714(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  sub_24CCB5C50(a1, v2, ObjectType, a2);
  uint64_t v7 = *(uint64_t (**)(void))(v3 + 8);
  return sub_24CC860A8(v7);
}

uint64_t sub_24CCB57B8()
{
  sub_24CCB2CC0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return sub_24CC860A8(v1);
}

uint64_t sub_24CCB5838(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCB4C74, 0, 0);
}

uint64_t sub_24CCB58E4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CCB6D80;
  return sub_24CCB068C();
}

uint64_t sub_24CCB5974()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24CCB2BD8, 0, 0);
}

uint64_t sub_24CCB5A1C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return sub_24CCB4850();
}

uint64_t sub_24CCB5AAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 16) + qword_269824780;
  swift_beginAccess();
  return sub_24CC74734(v3, a1, &qword_269821D90);
}

void sub_24CCB5B14()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD00000000000001FLL, 0x800000024CCC0260);
}

void sub_24CCB5BB0()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_269824810);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD00000000000001CLL, 0x800000024CCBF1A0);
}

uint64_t sub_24CCB5C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_24CCBB890();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AA0 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)qword_2698247F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  swift_unknownObjectRetain_n();
  uint64_t v12 = sub_24CCBB870();
  os_log_type_t v13 = sub_24CCBC060();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = a4;
    uint64_t v15 = v14;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v15 = 136315650;
    uint64_t v24 = a2;
    uint64_t v16 = sub_24CCBC5E0();
    uint64_t v25 = sub_24CC692DC(v16, v17, &v27);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v25 = sub_24CC692DC(0x726573624F646461, 0xEF293A5F28726576, &v27);
    sub_24CCBC120();
    *(_WORD *)(v15 + 22) = 2080;
    uint64_t v25 = a1;
    uint64_t v26 = v22;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269822418);
    uint64_t v18 = sub_24CCBBE70();
    uint64_t v25 = sub_24CC692DC(v18, v19, &v27);
    sub_24CCBC120();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v12, v13, "%s %s: %s", (uint8_t *)v15, 0x20u);
    uint64_t v20 = v23;
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v20, -1, -1);
    MEMORY[0x2533103A0](v15, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_24CCBB5B0();
}

uint64_t sub_24CCB5FA8()
{
  if (qword_269821AA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_269824810);
  uint64_t v1 = sub_24CCBB870();
  os_log_type_t v2 = sub_24CCBC060();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v9 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v5 = sub_24CCBC5E0();
    sub_24CC692DC(v5, v6, &v9);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CC60000, v1, v2, "%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v4, -1, -1);
    MEMORY[0x2533103A0](v3, -1, -1);
  }

  if (qword_269821AA0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_2698247F8);
  sub_24CC9E3E8(0xD000000000000093, 0x800000024CCC01C0, 0xD000000000000013, 0x800000024CCBEEE0);
  MEMORY[0x270FA5388](v7);
  return sub_24CCBB5D0();
}

uint64_t sub_24CCB6230(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a2 + 64))(v2, &off_26FF2C268, ObjectType, a2);
}

uint64_t sub_24CCB628C(uint64_t a1)
{
  return sub_24CCB2F54(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_24CCB6294(uint64_t a1, uint64_t a2)
{
  return sub_24CCB4E40(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_24CCB629C()
{
  uint64_t v1 = sub_24CCBB640();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24CCB6370(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24CCBB640() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_24CC68584;
  return sub_24CCB5020(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_24CCB6470(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269821D90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CCB64D8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCB1DF0, 0, 0);
}

unint64_t sub_24CCB6584()
{
  unint64_t result = qword_269823050;
  if (!qword_269823050)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269823048);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269823050);
  }
  return result;
}

uint64_t sub_24CCB65E0()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24CCB1FF0, 0, 0);
}

uint64_t sub_24CCB6684()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24CCB21C0, 0, 0);
}

uint64_t sub_24CCB6728()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24CCB2390, 0, 0);
}

uint64_t sub_24CCB67CC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24CCB2560, 0, 0);
}

uint64_t sub_24CCB6870(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCB2730, 0, 0);
}

uint64_t sub_24CCB691C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CCB6964(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  return sub_24CCB28FC(a1, a2);
}

uint64_t sub_24CCB6A0C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CCB6A44(uint64_t *a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  uint64_t v6 = (uint64_t (*)(uint64_t *, int *))((char *)&dword_2698230C8 + dword_2698230C8);
  return v6(a1, v4);
}

uint64_t sub_24CCB6AF8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCB2AA0, 0, 0);
}

uint64_t sub_24CCB6B9C(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a2 + 40))(v2, &off_26FF2C268, ObjectType, a2);
}

uint64_t sub_24CCB6BF8(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a2 + 32))(v2, &off_26FF2C268, ObjectType, a2);
}

uint64_t sub_24CCB6C54(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a2 + 24))(v2, &off_26FF2C268, ObjectType, a2);
}

uint64_t sub_24CCB6CB0(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a2 + 16))(v2, &off_26FF2C268, ObjectType, a2);
}

uint64_t sub_24CCB6D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(a2 + 8))(v5, &off_26FF2C268, v4, ObjectType, a2);
}

uint64_t sub_24CCB6D84()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for GuestUserHandoverServer()
{
  return self;
}

uint64_t sub_24CCB6DE8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC68584;
  return sub_24CCB6E78();
}

uint64_t sub_24CCB6E78()
{
  v1[10] = v0;
  uint64_t v2 = sub_24CCBB6F0();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCB6F38, 0, 0);
}

uint64_t sub_24CCB6F38()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v5 = sub_24CCBB890();
  __swift_project_value_buffer(v5, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0x6574617669746361, 0xEA00000000002928);
  uint64_t v6 = *(void *)(v4 + 16);
  v0[14] = v6;
  v0[2] = v6;
  uint64_t v7 = *MEMORY[0x263F39F18];
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
  v0[15] = v8;
  v0[16] = (v2 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v8(v1, v7, v3);
  swift_retain();
  swift_retain();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[17] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269822A70);
  v0[18] = v10;
  uint64_t v11 = sub_24CCBB710();
  unint64_t v12 = sub_24CCBA44C();
  v0[19] = v12;
  uint64_t v13 = sub_24CCBA980(&qword_269823030, MEMORY[0x263F39FA8]);
  *uint64_t v9 = v0;
  v9[1] = sub_24CCB7140;
  uint64_t v14 = v0[13];
  uint64_t v15 = v0[10];
  return MEMORY[0x270F26018](v14, &unk_269823150, v15, v10, v11, v12, v13);
}

uint64_t sub_24CCB7140()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 104);
  uint64_t v3 = *(void *)(*v0 + 96);
  uint64_t v4 = *(void *)(*v0 + 88);
  swift_task_dealloc();
  swift_release();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v1 + 160) = v5;
  *(void *)(v1 + 168) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v2, v4);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB72E8, 0, 0);
}

uint64_t sub_24CCB72E8()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[3] = v0[14];
  v1(v2, *MEMORY[0x263F39F70], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[22] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB73DC;
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[10];
  return MEMORY[0x270F26020](v7, &unk_269823168, v8, v5, v6);
}

uint64_t sub_24CCB73DC()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB7584, 0, 0);
}

uint64_t sub_24CCB7584()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[4] = v0[14];
  v1(v2, *MEMORY[0x263F39F78], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[23] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB7678;
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[10];
  return MEMORY[0x270F26020](v7, &unk_269823178, v8, v5, v6);
}

uint64_t sub_24CCB7678()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB7820, 0, 0);
}

uint64_t sub_24CCB7820()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[5] = v0[14];
  v1(v2, *MEMORY[0x263F39F38], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[24] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB7914;
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[10];
  return MEMORY[0x270F26020](v7, &unk_269823188, v8, v5, v6);
}

uint64_t sub_24CCB7914()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB7ABC, 0, 0);
}

uint64_t sub_24CCB7ABC()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[6] = v0[14];
  v1(v2, *MEMORY[0x263F39F68], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[25] = v4;
  uint64_t v5 = sub_24CCBB650();
  uint64_t v6 = sub_24CCBA980(&qword_269823000, MEMORY[0x263F39EF0]);
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB7BF8;
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[13];
  uint64_t v10 = v0[10];
  return MEMORY[0x270F26018](v9, &unk_269823198, v10, v7, v5, v8, v6);
}

uint64_t sub_24CCB7BF8()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB7DA0, 0, 0);
}

uint64_t sub_24CCB7DA0()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  v0[7] = v0[14];
  v1(v2, *MEMORY[0x263F39F40], v3);
  uint64_t v5 = swift_allocObject();
  v0[26] = v5;
  *(void *)(v5 + 16) = sub_24CCBA72C;
  *(void *)(v5 + 24) = v4;
  swift_retain();
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[27] = v6;
  uint64_t v7 = sub_24CCBB7B0();
  uint64_t v8 = sub_24CCBA980(&qword_269823058, MEMORY[0x263F39FE0]);
  void *v6 = v0;
  v6[1] = sub_24CCB7F14;
  uint64_t v9 = v0[18];
  uint64_t v10 = v0[19];
  uint64_t v11 = v0[13];
  return MEMORY[0x270F26018](v11, &unk_2698231A8, v5, v9, v7, v10, v8);
}

uint64_t sub_24CCB7F14()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB80BC, 0, 0);
}

uint64_t sub_24CCB80BC()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  v0[8] = v0[14];
  v1(v2, *MEMORY[0x263F39F50], v3);
  uint64_t v5 = swift_allocObject();
  v0[28] = v5;
  *(void *)(v5 + 16) = sub_24CCBA820;
  *(void *)(v5 + 24) = v4;
  swift_retain();
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[29] = v6;
  void *v6 = v0;
  v6[1] = sub_24CCB81E8;
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[13];
  return MEMORY[0x270F26020](v9, &unk_2698231B8, v5, v7, v8);
}

uint64_t sub_24CCB81E8()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 104);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_24CCB8390, 0, 0);
}

uint64_t sub_24CCB8390()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  v0[9] = v0[14];
  v1(v2, *MEMORY[0x263F39F88], v3);
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[30] = v4;
  uint64_t v5 = sub_24CCBB640();
  uint64_t v6 = sub_24CCBA980(&qword_2698230B0, MEMORY[0x263F39EE0]);
  *uint64_t v4 = v0;
  v4[1] = sub_24CCB84CC;
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[13];
  uint64_t v10 = v0[10];
  return MEMORY[0x270F26018](v9, &unk_2698231C8, v10, v7, v5, v8, v6);
}

uint64_t sub_24CCB84CC()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(*v0 + 160);
  uint64_t v2 = *(void *)(*v0 + 104);
  uint64_t v3 = *(void *)(*v0 + 88);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();
  v1(v2, v3);
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_24CCB8674(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24CCB8694, 0, 0);
}

uint64_t sub_24CCB8694()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD00000000000001FLL, 0x800000024CCBF4E0);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 24) + **(int **)(v3 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[4] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCBAE78;
  uint64_t v6 = v0[2];
  return v8(v6, ObjectType, v3);
}

uint64_t sub_24CCB881C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24CCB883C, 0, 0);
}

uint64_t sub_24CCB883C()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD00000000000001FLL, 0x800000024CCBF4E0);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 24) + **(int **)(v3 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[4] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCA30D4;
  uint64_t v6 = v0[2];
  return v8(v6, ObjectType, v3);
}

uint64_t sub_24CCB89C4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC68584;
  return sub_24CCB8A54();
}

uint64_t sub_24CCB8A54()
{
  v1[2] = v0;
  uint64_t v2 = sub_24CCBB560();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCB8B14, 0, 0);
}

uint64_t sub_24CCB8B14()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[2];
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD00000000000001ALL, 0x800000024CCC0460);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  sub_24CCBB550();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 32) + **(int **)(v3 + 32));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[6] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCB3BB4;
  uint64_t v6 = v0[5];
  return v8(v6, ObjectType, v3);
}

uint64_t sub_24CCB8CB4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24CCB8CD4, 0, 0);
}

uint64_t sub_24CCB8CD4()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD000000000000014, 0x800000024CCBF4A0);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 40) + **(int **)(v3 + 40));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCBAE70;
  return v7(ObjectType, v3);
}

uint64_t sub_24CCB8E58()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24CCB8CD4, 0, 0);
}

uint64_t sub_24CCB8E78(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24CCB8E98, 0, 0);
}

uint64_t sub_24CCB8E98()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD000000000000012, 0x800000024CCBF480);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 48) + **(int **)(v3 + 48));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCBAE70;
  return v7(ObjectType, v3);
}

uint64_t sub_24CCB901C()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24CCB903C, 0, 0);
}

uint64_t sub_24CCB903C()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD000000000000012, 0x800000024CCBF480);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 48) + **(int **)(v3 + 48));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCB91C0;
  return v7(ObjectType, v3);
}

uint64_t sub_24CCB91C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CCB92B4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24CCB92D4, 0, 0);
}

uint64_t sub_24CCB92D4()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD000000000000019, 0x800000024CCBF3D0);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 56) + **(int **)(v3 + 56));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[4] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCBAE78;
  uint64_t v6 = v0[2];
  return v8(v6, ObjectType, v3);
}

uint64_t sub_24CCB945C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24CCB92D4, 0, 0);
}

uint64_t sub_24CCB947C(uint64_t a1, uint64_t a2)
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24CCBB890();
  __swift_project_value_buffer(v4, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD000000000000024, 0x800000024CCBF3A0);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 64))(a1, ObjectType, v5);
}

uint64_t sub_24CCB9558(uint64_t a1, void (*a2)(void))
{
  a2();
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
  return sub_24CC860A8(v3);
}

uint64_t sub_24CCB95E0(uint64_t a1)
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD000000000000010, 0x800000024CCBF380);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 72))(ObjectType, v3);
}

uint64_t sub_24CCB96A8(void (*a1)(void))
{
  a1();
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return sub_24CC860A8(v2);
}

uint64_t sub_24CCB9730(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24CCB9750, 0, 0);
}

uint64_t sub_24CCB9750()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD00000000000001ALL, 0x800000024CCC0280);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 96) + **(int **)(v3 + 96));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[4] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCBAE78;
  uint64_t v6 = v0[2];
  return v8(v6, ObjectType, v3);
}

uint64_t sub_24CCB98DC()
{
  *(void *)(v1 + 24) = *v0;
  return MEMORY[0x270FA2498](sub_24CCB9920, 0, 0);
}

uint64_t sub_24CCB9920()
{
  uint64_t v11 = v0;
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824858);
  uint64_t v2 = sub_24CCBB870();
  os_log_type_t v3 = sub_24CCBC050();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v10 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = sub_24CCBC5E0();
    *(void *)(v0 + 16) = sub_24CC692DC(v6, v7, &v10);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    *(void *)(v0 + 16) = sub_24CC692DC(0xD00000000000001BLL, 0x800000024CCBF4C0, &v10);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v2, v3, "[%s] %s is not available", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v5, -1, -1);
    MEMORY[0x2533103A0](v4, -1, -1);
  }

  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_24CCB9B20()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC85FB0;
  return sub_24CCB6E78();
}

uint64_t sub_24CCB9BAC()
{
  return sub_24CC860A8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24CCB9BE4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCB883C, 0, 0);
}

uint64_t sub_24CCB9C90()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[3] = *v0;
  return MEMORY[0x270FA2498](sub_24CCB9920, 0, 0);
}

uint64_t sub_24CCB9D5C()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24CCB8CD4, 0, 0);
}

uint64_t sub_24CCB9E00()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24CCB903C, 0, 0);
}

uint64_t sub_24CCB9EA4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCB92D4, 0, 0);
}

uint64_t sub_24CCB9F50(uint64_t a1)
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24CCBB890();
  __swift_project_value_buffer(v3, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD000000000000024, 0x800000024CCBF3A0);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 64))(a1, ObjectType, v4);
}

uint64_t sub_24CCBA02C()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCBB890();
  __swift_project_value_buffer(v1, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD000000000000010, 0x800000024CCBF380);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(ObjectType, v2);
}

uint64_t sub_24CCBA0F4()
{
  sub_24CCBA9C8();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return sub_24CC860A8(v1);
}

uint64_t sub_24CCBA174()
{
  sub_24CCBAC64();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return sub_24CC860A8(v1);
}

uint64_t sub_24CCBA1F4(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24CCBA214, 0, 0);
}

uint64_t sub_24CCBA214()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_24CCBB890();
  __swift_project_value_buffer(v2, (uint64_t)qword_269824858);
  sub_24CC9E3E8(0xD00000000000007ELL, 0x800000024CCC03E0, 0xD00000000000001ALL, 0x800000024CCC0280);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 96) + **(int **)(v3 + 96));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[4] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CCA30D4;
  uint64_t v6 = v0[2];
  return v8(v6, ObjectType, v3);
}

uint64_t sub_24CCBA3A0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCB8694, 0, 0);
}

unint64_t sub_24CCBA44C()
{
  unint64_t result = qword_269823158;
  if (!qword_269823158)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269822A70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269823158);
  }
  return result;
}

uint64_t sub_24CCBA4A8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CC6CB14;
  return sub_24CCB89C4();
}

uint64_t sub_24CCBA538()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24CCB8CD4, 0, 0);
}

uint64_t sub_24CCBA5DC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24CC6CB14;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24CCB8E98, 0, 0);
}

uint64_t sub_24CCBA680(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_24CC68584;
  return MEMORY[0x270FA2498](sub_24CCB92D4, 0, 0);
}

uint64_t sub_24CCBA72C(uint64_t a1)
{
  return sub_24CCB947C(a1, v1);
}

uint64_t sub_24CCBA734()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CCBA76C(uint64_t a1)
{
  uint64_t v4 = *(void (**)(void))(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CC6CB14;
  uint64_t v6 = (uint64_t (*)(uint64_t, void (*)(void)))((char *)&dword_2698231A0 + dword_2698231A0);
  return v6(a1, v4);
}

uint64_t sub_24CCBA820()
{
  return sub_24CCB95E0(v0);
}

uint64_t sub_24CCBA828()
{
  uint64_t v2 = *(void (**)(void))(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24CC6CB14;
  uint64_t v4 = (uint64_t (*)(void (*)(void)))((char *)&dword_2698231B0 + dword_2698231B0);
  return v4(v2);
}

uint64_t sub_24CCBA8D4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_24CC6CB14;
  return MEMORY[0x270FA2498](sub_24CCB9750, 0, 0);
}

uint64_t sub_24CCBA980(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CCBA9C8()
{
  uint64_t v0 = sub_24CCBB890();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_269824858);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_24CCBB870();
  os_log_type_t v6 = sub_24CCBC050();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_24CCBC5E0();
    uint64_t v12 = sub_24CC692DC(v9, v10, &v13);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v12 = sub_24CC692DC(0x726573624F646461, 0xEF293A5F28726576, &v13);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, v5, v6, "[%s] %s is not available", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v8, -1, -1);
    MEMORY[0x2533103A0](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_24CCBAC64()
{
  if (qword_269821AC0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCBB890();
  __swift_project_value_buffer(v0, (uint64_t)qword_269824858);
  oslog = sub_24CCBB870();
  os_log_type_t v1 = sub_24CCBC050();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v7 = v3;
    *(_DWORD *)uint64_t v2 = 136315394;
    uint64_t v4 = sub_24CCBC5E0();
    sub_24CC692DC(v4, v5, &v7);
    sub_24CCBC120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v2 + 12) = 2080;
    sub_24CC692DC(0xD000000000000012, 0x800000024CCBF360, &v7);
    sub_24CCBC120();
    _os_log_impl(&dword_24CC60000, oslog, v1, "[%s] %s is not available", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533103A0](v3, -1, -1);
    MEMORY[0x2533103A0](v2, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_24CCBAE7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    unint64_t v7 = *v4;
    if (!(*v4 >> 62))
    {
      if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_24CCBC3E0();
  swift_bridgeObjectRelease();
  if (v23 < v5) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v9 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v8 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24CCBC3E0();
    swift_bridgeObjectRelease();
    uint64_t v11 = v10 + v8;
    if (!__OFADD__(v10, v8)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_24CCBC3E0();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  unint64_t v7 = *v4;
  if (*v4 >> 62) {
    goto LABEL_36;
  }
  uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v11 = v10 + v8;
  if (__OFADD__(v10, v8)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v7 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v7;
  uint64_t v10 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v11 <= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v10 = 1;
  }
  if (v7 >> 62) {
    goto LABEL_39;
  }
  uint64_t v14 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v11) {
    uint64_t v14 = v11;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = MEMORY[0x25330F920](v10, v14, 1, v7);
  swift_bridgeObjectRelease();
  *uint64_t v4 = v7;
  uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v15 = (void *)(v13 + 32 + 8 * v6);
  sub_24CCBBBF0();
  swift_arrayDestroy();
  if (v8)
  {
    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_24CCBC3E0();
      swift_bridgeObjectRelease();
      uint64_t v17 = v24 - v5;
      if (!__OFSUB__(v24, v5))
      {
LABEL_21:
        if (v17 < 0)
        {
LABEL_46:
          uint64_t result = sub_24CCBC420();
          __break(1u);
          return result;
        }
        uint64_t v18 = (char *)(v15 + 1);
        unint64_t v19 = (char *)(v13 + 32 + 8 * v5);
        if (v15 + 1 != (void *)v19 || v18 >= &v19[8 * v17]) {
          memmove(v18, v19, 8 * v17);
        }
        if (!(v7 >> 62))
        {
          uint64_t v20 = *(void *)(v13 + 16);
          uint64_t v21 = v20 + v8;
          if (!__OFADD__(v20, v8))
          {
LABEL_27:
            *(void *)(v13 + 16) = v21;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_24CCBC3E0();
        swift_bridgeObjectRelease();
        uint64_t v21 = v25 + v8;
        if (!__OFADD__(v25, v8)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v16 = *(void *)(v13 + 16);
      uint64_t v17 = v16 - v5;
      if (!__OFSUB__(v16, v5)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  void *v15 = v3;
  return sub_24CCBBF20();
}

uint64_t sub_24CCBB168()
{
  uint64_t v16 = sub_24CCBB9C0();
  uint64_t v0 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24CCBB9B0();
  uint64_t v3 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CCBBB10();
  uint64_t v6 = sub_24CCBBAD0();
  sub_24CCBBAE0();
  if (qword_269821A70 != -1) {
    swift_once();
  }
  sub_24CCBBBA0();
  swift_allocObject();
  swift_retain();
  uint64_t v7 = sub_24CCBBB90();
  uint64_t v9 = (void (*)(unsigned char *, void))sub_24CCBBAC0();
  uint64_t v10 = *v8;
  if (!((unint64_t)*v8 >> 62)) {
    goto LABEL_4;
  }
  uint64_t v12 = v10 & 0xFFFFFFFFFFFFFF8;
  if (v10 < 0) {
    uint64_t v12 = *v8;
  }
  uint64_t v14 = v12;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_24CCBC3E0();
  swift_bridgeObjectRelease();
  if (v14 < 0)
  {
    __break(1u);
    return sub_24CCBB410();
  }
  else
  {
LABEL_4:
    sub_24CCBAE7C(0, 0, v7);
    v9(v17, 0);
    swift_release();
    sub_24CCBBAA0();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F14198], v15);
    sub_24CCBBAF0();
    (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263F141B8], v16);
    sub_24CCBBB00();
    return v6;
  }
}

uint64_t sub_24CCBB410()
{
  return MEMORY[0x270EEDCD0]();
}

uint64_t sub_24CCBB420()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24CCBB430()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24CCBB440()
{
  return MEMORY[0x270EEF2C8]();
}

uint64_t sub_24CCBB450()
{
  return MEMORY[0x270EEF2D0]();
}

uint64_t sub_24CCBB460()
{
  return MEMORY[0x270EEF2E0]();
}

uint64_t sub_24CCBB470()
{
  return MEMORY[0x270EEF2E8]();
}

uint64_t sub_24CCBB480()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24CCBB490()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_24CCBB4A0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24CCBB4B0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24CCBB4C0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24CCBB4D0()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_24CCBB4E0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24CCBB4F0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24CCBB500()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24CCBB510()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24CCBB520()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24CCBB530()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_24CCBB540()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24CCBB550()
{
  return MEMORY[0x270F25E90]();
}

uint64_t sub_24CCBB560()
{
  return MEMORY[0x270F25E98]();
}

uint64_t sub_24CCBB570()
{
  return MEMORY[0x270F25EA0]();
}

uint64_t sub_24CCBB580()
{
  return MEMORY[0x270F25EA8]();
}

uint64_t sub_24CCBB590()
{
  return MEMORY[0x270F25EB0]();
}

uint64_t sub_24CCBB5A0()
{
  return MEMORY[0x270F25EB8]();
}

uint64_t sub_24CCBB5B0()
{
  return MEMORY[0x270F25EC0]();
}

uint64_t sub_24CCBB5C0()
{
  return MEMORY[0x270F25EC8]();
}

uint64_t sub_24CCBB5D0()
{
  return MEMORY[0x270F25ED0]();
}

uint64_t sub_24CCBB5F0()
{
  return MEMORY[0x270F25EE0]();
}

uint64_t sub_24CCBB600()
{
  return MEMORY[0x270F25EE8]();
}

uint64_t sub_24CCBB610()
{
  return MEMORY[0x270F25EF0]();
}

uint64_t sub_24CCBB620()
{
  return MEMORY[0x270F25EF8]();
}

uint64_t sub_24CCBB630()
{
  return MEMORY[0x270F25F00]();
}

uint64_t sub_24CCBB640()
{
  return MEMORY[0x270F25F08]();
}

uint64_t sub_24CCBB650()
{
  return MEMORY[0x270F25F10]();
}

uint64_t sub_24CCBB660()
{
  return MEMORY[0x270F25F18]();
}

uint64_t sub_24CCBB670()
{
  return MEMORY[0x270F25F20]();
}

uint64_t sub_24CCBB680()
{
  return MEMORY[0x270F25F28]();
}

uint64_t sub_24CCBB690()
{
  return MEMORY[0x270F25F30]();
}

uint64_t sub_24CCBB6A0()
{
  return MEMORY[0x270F25F38]();
}

uint64_t sub_24CCBB6B0()
{
  return MEMORY[0x270F25F40]();
}

uint64_t sub_24CCBB6C0()
{
  return MEMORY[0x270F25F48]();
}

uint64_t sub_24CCBB6D0()
{
  return MEMORY[0x270F25F50]();
}

uint64_t sub_24CCBB6E0()
{
  return MEMORY[0x270F25F58]();
}

uint64_t sub_24CCBB6F0()
{
  return MEMORY[0x270F25F60]();
}

uint64_t sub_24CCBB700()
{
  return MEMORY[0x270F25F68]();
}

uint64_t sub_24CCBB710()
{
  return MEMORY[0x270F25F70]();
}

uint64_t sub_24CCBB720()
{
  return MEMORY[0x270F25F78]();
}

uint64_t sub_24CCBB730()
{
  return MEMORY[0x270F25F80]();
}

uint64_t sub_24CCBB740()
{
  return MEMORY[0x270F25F88]();
}

uint64_t sub_24CCBB750()
{
  return MEMORY[0x270F25F90]();
}

uint64_t sub_24CCBB760()
{
  return MEMORY[0x270F25F98]();
}

uint64_t sub_24CCBB770()
{
  return MEMORY[0x270F25FA0]();
}

uint64_t sub_24CCBB780()
{
  return MEMORY[0x270F25FA8]();
}

uint64_t sub_24CCBB790()
{
  return MEMORY[0x270F25FB0]();
}

uint64_t sub_24CCBB7A0()
{
  return MEMORY[0x270F25FB8]();
}

uint64_t sub_24CCBB7B0()
{
  return MEMORY[0x270F25FC0]();
}

uint64_t sub_24CCBB7C0()
{
  return MEMORY[0x270F25FD8]();
}

uint64_t sub_24CCBB7F0()
{
  return MEMORY[0x270F26000]();
}

uint64_t sub_24CCBB800()
{
  return MEMORY[0x270F26008]();
}

uint64_t sub_24CCBB810()
{
  return MEMORY[0x270F26010]();
}

uint64_t sub_24CCBB840()
{
  return MEMORY[0x270F26028]();
}

uint64_t sub_24CCBB850()
{
  return MEMORY[0x270F26040]();
}

uint64_t sub_24CCBB860()
{
  return MEMORY[0x270F26048]();
}

uint64_t sub_24CCBB870()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CCBB880()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CCBB890()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CCBB8A0()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_24CCBB8B0()
{
  return MEMORY[0x270EF70F0]();
}

uint64_t sub_24CCBB8C0()
{
  return MEMORY[0x270EF7148]();
}

uint64_t sub_24CCBB8D0()
{
  return MEMORY[0x270EF7160]();
}

uint64_t sub_24CCBB8E0()
{
  return MEMORY[0x270EF7170]();
}

uint64_t sub_24CCBB8F0()
{
  return MEMORY[0x270EF7188]();
}

uint64_t sub_24CCBB900()
{
  return MEMORY[0x270EF71A0]();
}

uint64_t sub_24CCBB910()
{
  return MEMORY[0x270EF71A8]();
}

uint64_t sub_24CCBB920()
{
  return MEMORY[0x270EF71B8]();
}

uint64_t sub_24CCBB930()
{
  return MEMORY[0x270EF71C0]();
}

uint64_t sub_24CCBB940()
{
  return MEMORY[0x270EF71C8]();
}

uint64_t sub_24CCBB950()
{
  return MEMORY[0x270EF71D0]();
}

uint64_t sub_24CCBB960()
{
  return MEMORY[0x270EF71D8]();
}

uint64_t sub_24CCBB970()
{
  return MEMORY[0x270EF71E0]();
}

uint64_t sub_24CCBB980()
{
  return MEMORY[0x270EF71F8]();
}

uint64_t sub_24CCBB990()
{
  return MEMORY[0x270EF7208]();
}

uint64_t sub_24CCBB9A0()
{
  return MEMORY[0x270EF7210]();
}

uint64_t sub_24CCBB9B0()
{
  return MEMORY[0x270EF7260]();
}

uint64_t sub_24CCBB9C0()
{
  return MEMORY[0x270EF7268]();
}

uint64_t sub_24CCBB9D0()
{
  return MEMORY[0x270EF7308]();
}

uint64_t sub_24CCBB9E0()
{
  return MEMORY[0x270EF7320]();
}

uint64_t sub_24CCBB9F0()
{
  return MEMORY[0x270EF7340]();
}

uint64_t sub_24CCBBA00()
{
  return MEMORY[0x270EF7348]();
}

uint64_t sub_24CCBBA10()
{
  return MEMORY[0x270EF7350]();
}

uint64_t sub_24CCBBA20()
{
  return MEMORY[0x270EF7360]();
}

uint64_t sub_24CCBBA30()
{
  return MEMORY[0x270EF7430]();
}

uint64_t sub_24CCBBA40()
{
  return MEMORY[0x270EF7438]();
}

uint64_t sub_24CCBBA50()
{
  return MEMORY[0x270EF7448]();
}

uint64_t sub_24CCBBA60()
{
  return MEMORY[0x270EF7450]();
}

uint64_t sub_24CCBBA70()
{
  return MEMORY[0x270EF7460]();
}

uint64_t sub_24CCBBA80()
{
  return MEMORY[0x270EF7470]();
}

uint64_t sub_24CCBBA90()
{
  return MEMORY[0x270EF7488]();
}

uint64_t sub_24CCBBAA0()
{
  return MEMORY[0x270EF7498]();
}

uint64_t sub_24CCBBAB0()
{
  return MEMORY[0x270EF74A0]();
}

uint64_t sub_24CCBBAC0()
{
  return MEMORY[0x270EF74B8]();
}

uint64_t sub_24CCBBAD0()
{
  return MEMORY[0x270EF74C0]();
}

uint64_t sub_24CCBBAE0()
{
  return MEMORY[0x270EF74C8]();
}

uint64_t sub_24CCBBAF0()
{
  return MEMORY[0x270EF74D0]();
}

uint64_t sub_24CCBBB00()
{
  return MEMORY[0x270EF74E0]();
}

uint64_t sub_24CCBBB10()
{
  return MEMORY[0x270EF7510]();
}

uint64_t sub_24CCBBB20()
{
  return MEMORY[0x270EF7690]();
}

uint64_t sub_24CCBBB30()
{
  return MEMORY[0x270EF7698]();
}

uint64_t sub_24CCBBB40()
{
  return MEMORY[0x270EF76A0]();
}

uint64_t sub_24CCBBB50()
{
  return MEMORY[0x270EF76A8]();
}

uint64_t sub_24CCBBB60()
{
  return MEMORY[0x270EF76B8]();
}

uint64_t sub_24CCBBB70()
{
  return MEMORY[0x270EF76C0]();
}

uint64_t sub_24CCBBB80()
{
  return MEMORY[0x270EF76C8]();
}

uint64_t sub_24CCBBB90()
{
  return MEMORY[0x270EF76D0]();
}

uint64_t sub_24CCBBBA0()
{
  return MEMORY[0x270EF76D8]();
}

uint64_t sub_24CCBBBB0()
{
  return MEMORY[0x270EF76E0]();
}

uint64_t sub_24CCBBBC0()
{
  return MEMORY[0x270EF76E8]();
}

uint64_t sub_24CCBBBD0()
{
  return MEMORY[0x270EF76F0]();
}

uint64_t sub_24CCBBBE0()
{
  return MEMORY[0x270EF76F8]();
}

uint64_t sub_24CCBBBF0()
{
  return MEMORY[0x270EF7700]();
}

uint64_t sub_24CCBBC00()
{
  return MEMORY[0x270EF77E0]();
}

uint64_t sub_24CCBBC20()
{
  return MEMORY[0x270EF7800]();
}

uint64_t sub_24CCBBC30()
{
  return MEMORY[0x270EF7808]();
}

uint64_t sub_24CCBBC40()
{
  return MEMORY[0x270EF7810]();
}

uint64_t sub_24CCBBC50()
{
  return MEMORY[0x270EF7818]();
}

uint64_t sub_24CCBBC60()
{
  return MEMORY[0x270EF7820]();
}

uint64_t sub_24CCBBC70()
{
  return MEMORY[0x270EF7828]();
}

uint64_t sub_24CCBBC80()
{
  return MEMORY[0x270EF7830]();
}

uint64_t sub_24CCBBC90()
{
  return MEMORY[0x270EF7838]();
}

uint64_t sub_24CCBBCA0()
{
  return MEMORY[0x270EF7848]();
}

uint64_t sub_24CCBBCB0()
{
  return MEMORY[0x270EF7850]();
}

uint64_t sub_24CCBBCC0()
{
  return MEMORY[0x270EF7858]();
}

uint64_t sub_24CCBBCD0()
{
  return MEMORY[0x270EF7860]();
}

uint64_t sub_24CCBBCE0()
{
  return MEMORY[0x270EF7868]();
}

uint64_t sub_24CCBBCF0()
{
  return MEMORY[0x270EF7870]();
}

uint64_t sub_24CCBBD00()
{
  return MEMORY[0x270EF7878]();
}

uint64_t sub_24CCBBD10()
{
  return MEMORY[0x270EF78A0]();
}

uint64_t sub_24CCBBD20()
{
  return MEMORY[0x270EF78B0]();
}

uint64_t sub_24CCBBD30()
{
  return MEMORY[0x270EF78B8]();
}

uint64_t sub_24CCBBD40()
{
  return MEMORY[0x270EF78C0]();
}

uint64_t sub_24CCBBD50()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24CCBBD60()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_24CCBBD70()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_24CCBBD80()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24CCBBD90()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_24CCBBDA0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_24CCBBDB0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24CCBBDC0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24CCBBDD0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24CCBBDE0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24CCBBDF0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24CCBBE00()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24CCBBE10()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24CCBBE20()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CCBBE30()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24CCBBE40()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24CCBBE50()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CCBBE60()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_24CCBBE70()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CCBBE80()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24CCBBE90()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24CCBBEA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24CCBBEB0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24CCBBEC0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CCBBED0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24CCBBEE0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CCBBEF0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24CCBBF00()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24CCBBF10()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CCBBF20()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CCBBF30()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24CCBBF40()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CCBBF50()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24CCBBF60()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24CCBBF70()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24CCBBF80()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24CCBBF90()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CCBBFA0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CCBBFB0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24CCBBFC0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24CCBBFD0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24CCBC000()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24CCBC010()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24CCBC020()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_24CCBC030()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24CCBC040()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CCBC050()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24CCBC060()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CCBC070()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24CCBC080()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24CCBC090()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24CCBC0B0()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_24CCBC0C0()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_24CCBC0D0()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_24CCBC0E0()
{
  return MEMORY[0x270F25FD0]();
}

uint64_t sub_24CCBC0F0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24CCBC100()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24CCBC110()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CCBC120()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CCBC130()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CCBC140()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_24CCBC150()
{
  return MEMORY[0x270EF25E8]();
}

uint64_t sub_24CCBC160()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24CCBC170()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24CCBC180()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24CCBC190()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24CCBC1A0()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_24CCBC1B0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24CCBC1C0()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_24CCBC1D0()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_24CCBC1E0()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_24CCBC1F0()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_24CCBC200()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24CCBC210()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_24CCBC220()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_24CCBC230()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24CCBC240()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_24CCBC250()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_24CCBC260()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24CCBC280()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24CCBC290()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24CCBC2A0()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_24CCBC2B0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24CCBC2C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24CCBC2D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CCBC2E0()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_24CCBC2F0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CCBC300()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24CCBC310()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CCBC320()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24CCBC330()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24CCBC340()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24CCBC350()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24CCBC360()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24CCBC370()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24CCBC380()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24CCBC390()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24CCBC3A0()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24CCBC3B0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24CCBC3C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CCBC3D0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CCBC3E0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CCBC3F0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24CCBC400()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CCBC410()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24CCBC420()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CCBC440()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_24CCBC450()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_24CCBC460()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CCBC480()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CCBC4A0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24CCBC4B0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CCBC4C0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24CCBC4E0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CCBC4F0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CCBC500()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CCBC510()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CCBC520()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_24CCBC530()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_24CCBC540()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CCBC550()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CCBC560()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24CCBC570()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CCBC580()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_24CCBC590()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24CCBC5A0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24CCBC5B0()
{
  return MEMORY[0x270F9FF78]();
}

uint64_t sub_24CCBC5E0()
{
  return MEMORY[0x270FA0128]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
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

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
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

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x270ED8F50](*(void *)&a1, a2, a3);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x270EDC0D8]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}