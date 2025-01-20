id DSSTelemetryLog()
{
  void *v0;
  uint64_t vars8;

  if (DSSTelemetryLog_onceToken != -1) {
    dispatch_once(&DSSTelemetryLog_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)DSSTelemetryLog_log;
  return v0;
}

uint64_t __DSSTelemetryLog_block_invoke()
{
  DSSTelemetryLog_log = (uint64_t)os_log_create((const char *)DSSGuestUserModeLoggingSubsystem, "Telemetry");
  return MEMORY[0x270F9A758]();
}

__CFString *NSStringFromDSSGuestUserModeState(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown DSSGuestUserModeState (%ld)", a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = off_2652F59D8[a1];
  }
  return v1;
}

BOOL DSSGuestUserModeAppRestrictionStateIsRestrictedState(uint64_t a1)
{
  return a1 != 0;
}

__CFString *NSStringFromDSSGuestUserModeAppRestrictionState(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      v2 = @"Open Apps Enabled (restricted)";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown App Restriction State (%ld)", a1);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v2 = @"All Apps Enabled (unrestricted)";
  }
  return v2;
}

id _DSSGuestUserCreateCopy(void *a1, void *a2, uint64_t a3)
{
  v5 = a1;
  if (v5)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "__kindof DSSGuestUser *_DSSGuestUserCreateCopy(__kindof DSSGuestUser *__strong, __unsafe_unretained Class, NSZone * _Nullable)");
    [v8 handleFailureInFunction:v9, @"DSSGuestUser.m", 28, @"Invalid parameter not satisfying: %@", @"self" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
  }
  v10 = [MEMORY[0x263F08690] currentHandler];
  v11 = objc_msgSend(NSString, "stringWithUTF8String:", "__kindof DSSGuestUser *_DSSGuestUserCreateCopy(__kindof DSSGuestUser *__strong, __unsafe_unretained Class, NSZone * _Nullable)");
  [v10 handleFailureInFunction:v11, @"DSSGuestUser.m", 29, @"Invalid parameter not satisfying: %@", @"klass" file lineNumber description];

LABEL_3:
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v6 + 8), v5[1]);
  objc_storeStrong((id *)(v6 + 16), v5[2]);
  objc_storeStrong((id *)(v6 + 24), v5[3]);
  *(unsigned char *)(v6 + 32) = *((unsigned char *)v5 + 32);
  *(unsigned char *)(v6 + 33) = *((unsigned char *)v5 + 33);
  *(unsigned char *)(v6 + 34) = *((unsigned char *)v5 + 34);

  return (id)v6;
}

uint64_t ViewMirroringDevice.deviceName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ViewMirroringDevice.deviceID.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

DeviceSharingServices::ViewMirroringDevice __swiftcall ViewMirroringDevice.init(deviceName:deviceID:)(Swift::String deviceName, Swift::String_optional deviceID)
{
  v2->value = deviceName;
  v2[1] = deviceID;
  result.deviceID = deviceID;
  result.deviceName = deviceName;
  return result;
}

unint64_t ViewMirroringDevice.description.getter()
{
  return 0xD000000000000014;
}

void static ViewMirroringDevice.localDevice.getter(uint64_t a1@<X8>)
{
  id v2 = (id)MobileGestalt_get_current_device();
  if (!v2)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  v3 = v2;
  id v4 = (id)MobileGestalt_copy_userAssignedDeviceName_obj();

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = sub_24CCEC330();
  uint64_t v7 = v6;

  APSCopyPairingIdentity();
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)(a1 + 16) = 0uLL;
}

uint64_t sub_24CCCFA20(char a1)
{
  if (a1) {
    return 0x4449656369766564;
  }
  else {
    return 0x614E656369766564;
  }
}

BOOL sub_24CCCFA5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24CCCFA74()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCCFABC()
{
  return sub_24CCEC860();
}

uint64_t sub_24CCCFAE8()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCCFB2C()
{
  return sub_24CCCFA20(*v0);
}

uint64_t sub_24CCCFB34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCD01BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CCCFB5C()
{
  return 0;
}

void sub_24CCCFB68(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24CCCFB74(uint64_t a1)
{
  unint64_t v2 = sub_24CCCFDF0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCCFBB0(uint64_t a1)
{
  unint64_t v2 = sub_24CCCFDF0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ViewMirroringDevice.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824AC8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  v10[1] = *(void *)(v1 + 24);
  v10[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCCFDF0();
  sub_24CCEC8A0();
  char v12 = 0;
  uint64_t v8 = v10[3];
  sub_24CCEC770();
  if (!v8)
  {
    char v11 = 1;
    sub_24CCEC750();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24CCCFDF0()
{
  unint64_t result = qword_269824AD0;
  if (!qword_269824AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824AD0);
  }
  return result;
}

uint64_t ViewMirroringDevice.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824AD8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCCFDF0();
  sub_24CCEC890();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v20 = 0;
  uint64_t v9 = sub_24CCEC700();
  uint64_t v11 = v10;
  char v19 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_24CCEC6E0();
  uint64_t v14 = v13;
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v12;
  v15(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v18;
  a2[3] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
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

uint64_t sub_24CCD0098@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ViewMirroringDevice.init(from:)(a1, a2);
}

uint64_t sub_24CCD00B0(void *a1)
{
  return ViewMirroringDevice.encode(to:)(a1);
}

uint64_t sub_24CCD00D0()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCD0124()
{
  return sub_24CCEC2C0();
}

void *sub_24CCD01A0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24CCD01B0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24CCD01BC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x614E656369766564 && a2 == 0xEA0000000000656DLL;
  if (v3 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4449656369766564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t _s21DeviceSharingServices013ViewMirroringA0V2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v5 = a2[2];
  uint64_t v4 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_24CCEC7D0(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v3)
    {
      if (v4)
      {
        BOOL v9 = v2 == v5 && v3 == v4;
        if (v9 || (sub_24CCEC7D0() & 1) != 0) {
          return 1;
        }
      }
    }
    else if (!v4)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ViewMirroringDevice(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ViewMirroringDevice()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ViewMirroringDevice(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ViewMirroringDevice(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

void *assignWithTake for ViewMirroringDevice(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewMirroringDevice(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ViewMirroringDevice(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ViewMirroringDevice()
{
  return &type metadata for ViewMirroringDevice;
}

void type metadata accessor for DSSGuestUserModeAppUnavailable(uint64_t a1)
{
}

void type metadata accessor for DSSGuestUserModeState(uint64_t a1)
{
}

void type metadata accessor for DSSGuestUserModeUnavailableReason(uint64_t a1)
{
}

void type metadata accessor for CFUserNotification(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for DSSGuestUserModeAppRestrictionState(uint64_t a1)
{
}

void sub_24CCD05D4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ViewMirroringDevice.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ViewMirroringDevice.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCD0788);
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

uint64_t sub_24CCD07B0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CCD07BC(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ViewMirroringDevice.CodingKeys()
{
  return &type metadata for ViewMirroringDevice.CodingKeys;
}

unint64_t sub_24CCD07DC()
{
  unint64_t result = qword_269824B10;
  if (!qword_269824B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B10);
  }
  return result;
}

unint64_t sub_24CCD0834()
{
  unint64_t result = qword_269824B18;
  if (!qword_269824B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B18);
  }
  return result;
}

unint64_t sub_24CCD088C()
{
  unint64_t result = qword_269824B20;
  if (!qword_269824B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B20);
  }
  return result;
}

unint64_t sub_24CCD08E0()
{
  unint64_t result = qword_269824B28;
  if (!qword_269824B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B28);
  }
  return result;
}

unint64_t sub_24CCD0934()
{
  unint64_t result = qword_269824B30;
  if (!qword_269824B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B30);
  }
  return result;
}

uint64_t LiveActivityCoordinator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(unsigned char *)(v0 + 112) = 0;
  return v0;
}

uint64_t LiveActivityCoordinator.init()()
{
  swift_defaultActor_initialize();
  *(unsigned char *)(v0 + 112) = 0;
  return v0;
}

void sub_24CCD09F0()
{
  int v2 = v1;
  int v3 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_24CCEC1C0();
  uint64_t v62 = *(void *)(v5 - 8);
  uint64_t v63 = v5;
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824B38);
  MEMORY[0x270FA5388]();
  v64 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824B40);
  uint64_t v60 = *(void *)(v9 - 8);
  uint64_t v61 = v9;
  MEMORY[0x270FA5388]();
  v66 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269824AA8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24CCEC2F0();
  uint64_t v67 = __swift_project_value_buffer(v11, (uint64_t)qword_26982AD28);
  uint64_t v12 = sub_24CCEC2D0();
  os_log_type_t v13 = sub_24CCEC500();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v65 = v4;
  if (v14)
  {
    uint64_t v15 = swift_slowAlloc();
    v59 = v1;
    v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v69 = v17;
    *(_DWORD *)v16 = 136315138;
    uint64_t v18 = sub_24CCEC8D0();
    uint64_t v68 = sub_24CCD1BE4(v18, v19, &v69);
    sub_24CCEC510();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CCCB000, v12, v13, "[%s] Starting Live Activity", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253311440](v17, -1, -1);
    char v20 = v16;
    int v2 = v59;
    MEMORY[0x253311440](v20, -1, -1);
  }

  if (v3[14])
  {
    v21 = sub_24CCEC2D0();
    os_log_type_t v22 = sub_24CCEC500();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v69 = v24;
      *(_DWORD *)v23 = 136315138;
      uint64_t v25 = sub_24CCEC8D0();
      uint64_t v68 = sub_24CCD1BE4(v25, v26, &v69);
      sub_24CCEC510();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CCCB000, v21, v22, "[%s] Live Activity is already active", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253311440](v24, -1, -1);
      MEMORY[0x253311440](v23, -1, -1);
    }
  }
  else
  {
    uint64_t v27 = sub_24CCEC130();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v64, 1, 1, v27);
    sub_24CCD1AE8();
    sub_24CCD1B3C();
    sub_24CCD1B90();
    sub_24CCEC1D0();
    sub_24CCEC1A0();
    sub_24CCEC1B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824B60);
    sub_24CCEC170();
    if (v2)
    {
      v64 = v7;
      id v28 = v2;
      id v29 = v2;
      v30 = sub_24CCEC2D0();
      os_log_type_t v31 = sub_24CCEC4F0();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        v33 = (void *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        v59 = v3;
        uint64_t v35 = v34;
        uint64_t v69 = v34;
        *(_DWORD *)uint64_t v32 = 136315394;
        uint64_t v36 = sub_24CCEC8D0();
        uint64_t v68 = sub_24CCD1BE4(v36, v37, &v69);
        sub_24CCEC510();
        swift_bridgeObjectRelease();
        *(_WORD *)(v32 + 12) = 2112;
        id v38 = v2;
        uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v68 = v39;
        sub_24CCEC510();
        void *v33 = v39;

        _os_log_impl(&dword_24CCCB000, v30, v31, "[%s] Failed to start Live Activity: %@", (uint8_t *)v32, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269824EF0);
        swift_arrayDestroy();
        MEMORY[0x253311440](v33, -1, -1);
        swift_arrayDestroy();
        uint64_t v40 = v35;
        int v3 = v59;
        MEMORY[0x253311440](v40, -1, -1);
        MEMORY[0x253311440](v32, -1, -1);
      }
      else
      {
      }
      *((unsigned char *)v3 + 112) = 0;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v63);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v66, v61);
    }
    else
    {
      v59 = v3;
      sub_24CCEC150();
      *(void *)(swift_allocObject() + 16) = v65;
      id v41 = objc_allocWithZone((Class)sub_24CCEC250());
      v42 = (void *)sub_24CCEC240();
      swift_retain_n();
      id v43 = v42;
      v44 = sub_24CCEC2D0();
      os_log_type_t v45 = sub_24CCEC500();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = swift_slowAlloc();
        v64 = v7;
        uint64_t v47 = v46;
        v58 = (void *)swift_slowAlloc();
        uint64_t v67 = swift_slowAlloc();
        uint64_t v69 = v67;
        *(_DWORD *)uint64_t v47 = 136315650;
        os_log_t v57 = v44;
        uint64_t v48 = sub_24CCEC8D0();
        os_log_type_t v49 = v45;
        uint64_t v68 = sub_24CCD1BE4(v48, v50, &v69);
        sub_24CCEC510();
        swift_bridgeObjectRelease();
        *(_WORD *)(v47 + 12) = 2080;
        uint64_t v51 = sub_24CCEC150();
        uint64_t v68 = sub_24CCD1BE4(v51, v52, &v69);
        sub_24CCEC510();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v47 + 22) = 2112;
        uint64_t v68 = (uint64_t)v43;
        id v53 = v43;
        sub_24CCEC510();
        v54 = v58;
        void *v58 = v43;

        os_log_t v55 = v57;
        _os_log_impl(&dword_24CCCB000, v57, v49, "[%s] Started Live Activity %s; assertion %@", (uint8_t *)v47, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269824EF0);
        swift_arrayDestroy();
        MEMORY[0x253311440](v54, -1, -1);
        uint64_t v56 = v67;
        swift_arrayDestroy();
        MEMORY[0x253311440](v56, -1, -1);
        MEMORY[0x253311440](v47, -1, -1);
        swift_release();

        (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v63);
      }
      else
      {
        swift_release_n();

        (*(void (**)(char *, uint64_t))(v62 + 8))(v7, v63);
      }
      (*(void (**)(char *, uint64_t))(v60 + 8))(v66, v61);
      v59[112] = 1;
    }
  }
}

void sub_24CCD13E4(void *a1, void *a2)
{
  if (qword_269824AA8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24CCEC2F0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26982AD28);
  id v5 = a1;
  id v6 = a2;
  id v7 = v5;
  id v8 = a2;
  oslog = sub_24CCEC2D0();
  os_log_type_t v9 = sub_24CCEC500();
  if (os_log_type_enabled(oslog, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v19 = v16;
    *(_DWORD *)uint64_t v10 = 136315650;
    uint64_t v12 = sub_24CCEC8D0();
    sub_24CCD1BE4(v12, v13, &v19);
    sub_24CCEC510();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    id v14 = v7;
    sub_24CCEC510();
    void *v11 = v7;

    *(_WORD *)(v10 + 22) = 2112;
    id v15 = a2;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    sub_24CCEC510();
    v11[1] = v18;

    _os_log_impl(&dword_24CCCB000, oslog, v9, "[%s] Invalidated assertion %@; error %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824EF0);
    swift_arrayDestroy();
    MEMORY[0x253311440](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253311440](v16, -1, -1);
    MEMORY[0x253311440](v10, -1, -1);
  }
  else
  {
  }
}

unint64_t sub_24CCD16A8()
{
  uint64_t v0 = sub_24CCEC190();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  int v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824B68);
  MEMORY[0x270FA5388]();
  id v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269824AA8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24CCEC2F0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26982AD28);
  id v7 = sub_24CCEC2D0();
  os_log_type_t v8 = sub_24CCEC500();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    v20[0] = v1;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v21 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v12 = sub_24CCEC8D0();
    v20[2] = sub_24CCD1BE4(v12, v13, &v21);
    sub_24CCEC510();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CCCB000, v7, v8, "[%s] Stopping Live Activity", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253311440](v11, -1, -1);
    id v14 = v10;
    uint64_t v1 = v20[0];
    MEMORY[0x253311440](v14, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_269824B60);
  unint64_t result = sub_24CCEC140();
  unint64_t v16 = result;
  if (!(result >> 62))
  {
    uint64_t v17 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v17) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t result = swift_bridgeObjectRelease();
    *(unsigned char *)(v20[1] + 112) = 0;
    return result;
  }
  unint64_t result = sub_24CCEC660();
  uint64_t v17 = result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_7:
  if (v17 >= 1)
  {
    uint64_t v18 = 0;
    do
    {
      if ((v16 & 0xC000000000000001) != 0) {
        MEMORY[0x2533109F0](v18, v16);
      }
      else {
        swift_retain();
      }
      ++v18;
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824B40);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 1, 1, v19);
      sub_24CCEC180();
      sub_24CCEC160();
      swift_release();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      sub_24CCD2254((uint64_t)v5);
    }
    while (v17 != v18);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t LiveActivityCoordinator.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LiveActivityCoordinator.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t LiveActivityCoordinator.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24CCD1AA4()
{
  return v0;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24CCD1AE8()
{
  unint64_t result = qword_269824B48;
  if (!qword_269824B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B48);
  }
  return result;
}

unint64_t sub_24CCD1B3C()
{
  unint64_t result = qword_269824B50;
  if (!qword_269824B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B50);
  }
  return result;
}

unint64_t sub_24CCD1B90()
{
  unint64_t result = qword_269824B58;
  if (!qword_269824B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B58);
  }
  return result;
}

uint64_t sub_24CCD1BE4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CCD1CB8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CCD2360((uint64_t)v12, *a3);
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
      sub_24CCD2360((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24CCD1CB8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CCEC520();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CCD1E74(a5, a6);
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
  uint64_t v8 = sub_24CCEC5F0();
  if (!v8)
  {
    sub_24CCEC650();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CCEC6A0();
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

uint64_t sub_24CCD1E74(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CCD1F0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CCD20EC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CCD20EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CCD1F0C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CCD2084(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CCEC5B0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CCEC650();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CCEC390();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CCEC6A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CCEC650();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24CCD2084(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824B70);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CCD20EC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824B70);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_24CCEC6A0();
  __break(1u);
  return result;
}

uint64_t sub_24CCD223C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24CCD224C(void *a1, void *a2)
{
}

uint64_t sub_24CCD2254(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824B68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for LiveActivityCoordinator()
{
  return self;
}

uint64_t method lookup function for LiveActivityCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LiveActivityCoordinator);
}

uint64_t dispatch thunk of LiveActivityCoordinator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of LiveActivityCoordinator.start()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of LiveActivityCoordinator.stop()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t sub_24CCD2360(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t GuestUserAccessTransportItem.id.getter()
{
  return dword_24CCEDCC4[*v0];
}

uint64_t GuestUserAccessTransportItem.rawValue.getter()
{
  return dword_24CCEDCC4[*v0];
}

DeviceSharingServices::GuestUserAccessTransportItem_optional __swiftcall GuestUserAccessTransportItem.init(rawValue:)(Swift::UInt32 rawValue)
{
  char v2 = 0;
  char v3 = 6;
  switch(rawValue)
  {
    case 0xC9u:
      goto LABEL_7;
    case 0xCAu:
      char v2 = 1;
      goto LABEL_7;
    case 0xCBu:
      char v2 = 2;
      goto LABEL_7;
    case 0xCCu:
      char v2 = 3;
      goto LABEL_7;
    case 0xCDu:
      char v2 = 4;
      goto LABEL_7;
    case 0xCEu:
      char v2 = 5;
LABEL_7:
      char v3 = v2;
      goto LABEL_8;
    case 0xCFu:
LABEL_8:
      char *v1 = v3;
      break;
    case 0xD0u:
      char *v1 = 7;
      break;
    case 0xD1u:
      char *v1 = 8;
      break;
    case 0xD2u:
      char *v1 = 9;
      break;
    case 0xD3u:
      char *v1 = 10;
      break;
    case 0xD4u:
      char *v1 = 11;
      break;
    case 0xD5u:
      char *v1 = 12;
      break;
    case 0xD6u:
      char *v1 = 13;
      break;
    case 0xD7u:
      char *v1 = 14;
      break;
    case 0xD8u:
      char *v1 = 15;
      break;
    case 0x12Du:
      char *v1 = 16;
      break;
    case 0x12Eu:
      char *v1 = 17;
      break;
    case 0x12Fu:
      char *v1 = 18;
      break;
    case 0x130u:
      char *v1 = 19;
      break;
    case 0x131u:
      char *v1 = 20;
      break;
    case 0x132u:
      char *v1 = 21;
      break;
    case 0x133u:
      char *v1 = 22;
      break;
    case 0x134u:
      char *v1 = 23;
      break;
    default:
      char *v1 = 24;
      break;
  }
  return (DeviceSharingServices::GuestUserAccessTransportItem_optional)rawValue;
}

BOOL sub_24CCD26D4(char *a1, char *a2)
{
  return dword_24CCEDCC4[*a1] == dword_24CCEDCC4[*a2];
}

unint64_t sub_24CCD26FC()
{
  unint64_t result = qword_269824B78;
  if (!qword_269824B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B78);
  }
  return result;
}

uint64_t sub_24CCD2750()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCD27A0()
{
  return sub_24CCEC870();
}

uint64_t sub_24CCD27D8()
{
  return sub_24CCEC880();
}

DeviceSharingServices::GuestUserAccessTransportItem_optional sub_24CCD2824(Swift::UInt32 *a1)
{
  return GuestUserAccessTransportItem.init(rawValue:)(*a1);
}

void sub_24CCD282C(_DWORD *a1@<X8>)
{
  *a1 = dword_24CCEDCC4[*v1];
}

unint64_t sub_24CCD2848()
{
  unint64_t result = qword_269824B80;
  if (!qword_269824B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B80);
  }
  return result;
}

unint64_t sub_24CCD28A0()
{
  unint64_t result = qword_269824B88;
  if (!qword_269824B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B88);
  }
  return result;
}

unint64_t sub_24CCD28F8()
{
  unint64_t result = qword_269824B90;
  if (!qword_269824B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B90);
  }
  return result;
}

unint64_t sub_24CCD2950()
{
  unint64_t result = qword_269824B98;
  if (!qword_269824B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824B98);
  }
  return result;
}

uint64_t sub_24CCD29A4()
{
  return MEMORY[0x263F8E908];
}

uint64_t sub_24CCD29B0()
{
  return sub_24CCEC430();
}

uint64_t sub_24CCD2A10()
{
  return sub_24CCEC400();
}

uint64_t getEnumTagSinglePayload for GuestUserAccessTransportItem(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE9) {
    goto LABEL_17;
  }
  if (a2 + 23 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 23) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 23;
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
      return (*a1 | (v4 << 8)) - 23;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 23;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x18;
  int v8 = v6 - 24;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GuestUserAccessTransportItem(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 23 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 23) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE8)
  {
    unsigned int v6 = ((a2 - 233) >> 8) + 1;
    *unint64_t result = a2 + 23;
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
        JUMPOUT(0x24CCD2BBCLL);
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
          *unint64_t result = a2 + 23;
        break;
    }
  }
  return result;
}

unsigned char *sub_24CCD2BE4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GuestUserAccessTransportItem()
{
  return &type metadata for GuestUserAccessTransportItem;
}

unint64_t sub_24CCD2BFC()
{
  unint64_t result = qword_269824BA0;
  if (!qword_269824BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BA0);
  }
  return result;
}

uint64_t sub_24CCD2C50()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id static NSBundle.deviceSharingServices.getter()
{
  _s29deviceSharingServicesSentinelCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  return v1;
}

uint64_t _s29deviceSharingServicesSentinelCMa()
{
  return self;
}

ValueMetadata *type metadata accessor for LiveActivityAttributes()
{
  return &type metadata for LiveActivityAttributes;
}

ValueMetadata *type metadata accessor for LiveActivityAttributes.ContentState()
{
  return &type metadata for LiveActivityAttributes.ContentState;
}

uint64_t sub_24CCD2D00()
{
  return 0;
}

void sub_24CCD2D0C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24CCD2D18(uint64_t a1)
{
  unint64_t v2 = sub_24CCD3180();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD2D54(uint64_t a1)
{
  unint64_t v2 = sub_24CCD3180();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CCD2D90(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_24CCD2DB8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CCD2F4C(a1, a2, a3, &qword_269824BC0, (void (*)(void))sub_24CCD3180);
}

uint64_t sub_24CCD2DF4()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCD2E2C()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCD2E60()
{
  return 1;
}

uint64_t sub_24CCD2E68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24CCD2E98(uint64_t a1)
{
  unint64_t v2 = sub_24CCD31D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD2ED4(uint64_t a1)
{
  unint64_t v2 = sub_24CCD31D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CCD2F10(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CCD2F4C(a1, a2, a3, &qword_269824BD0, (void (*)(void))sub_24CCD31D4);
}

uint64_t sub_24CCD2F4C(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a5();
  sub_24CCEC8A0();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_24CCD3070()
{
  unint64_t result = qword_269824BA8;
  if (!qword_269824BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BA8);
  }
  return result;
}

unint64_t sub_24CCD30C8()
{
  unint64_t result = qword_269824BB0;
  if (!qword_269824BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BB0);
  }
  return result;
}

unint64_t sub_24CCD312C()
{
  unint64_t result = qword_269824BB8;
  if (!qword_269824BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BB8);
  }
  return result;
}

unint64_t sub_24CCD3180()
{
  unint64_t result = qword_269824BC8;
  if (!qword_269824BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BC8);
  }
  return result;
}

unint64_t sub_24CCD31D4()
{
  unint64_t result = qword_269824BD8;
  if (!qword_269824BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BD8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityAttributes.CodingKeys()
{
  return &type metadata for LiveActivityAttributes.CodingKeys;
}

ValueMetadata *type metadata accessor for LiveActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for LiveActivityAttributes.ContentState.CodingKeys;
}

unint64_t sub_24CCD324C()
{
  unint64_t result = qword_269824BE0;
  if (!qword_269824BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BE0);
  }
  return result;
}

unint64_t sub_24CCD32A4()
{
  unint64_t result = qword_269824BE8;
  if (!qword_269824BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BE8);
  }
  return result;
}

unint64_t sub_24CCD32FC()
{
  unint64_t result = qword_269824BF0;
  if (!qword_269824BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BF0);
  }
  return result;
}

unint64_t sub_24CCD3354()
{
  unint64_t result = qword_269824BF8;
  if (!qword_269824BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824BF8);
  }
  return result;
}

uint64_t GuestUserHandoverService.init()@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824C00);
  uint64_t result = sub_24CCEC270();
  *a1 = result;
  return result;
}

uint64_t GuestUserHandoverService.init(xpcTransport:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t GuestUserHandoverService.activate()()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_24CCD3428, 0, 0);
}

uint64_t sub_24CCD3428()
{
  sub_24CCEC2A0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

Swift::Void __swiftcall GuestUserHandoverService.invalidate()()
{
}

uint64_t GuestUserHandoverService.postNotification(notificationType:destination:)(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v3 = *a1;
  __int16 v4 = *((unsigned __int8 *)a1 + 8);
  *(unsigned char *)(v2 + 26) = 12;
  __int16 v5 = v4 | (*a2 << 8);
  *(void *)(v2 + 16) = v3;
  *(_WORD *)(v2 + 24) = v5;
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v6;
  unint64_t v7 = sub_24CCD36D8();
  *unsigned int v6 = v2;
  v6[1] = sub_24CCD358C;
  return MEMORY[0x270F25FF0](v2 + 26, v2 + 16, &type metadata for NotificationPayload, v7);
}

uint64_t sub_24CCD358C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCD36C0, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24CCD36C0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_24CCD36D8()
{
  unint64_t result = qword_269824C18;
  if (!qword_269824C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824C18);
  }
  return result;
}

uint64_t GuestUserHandoverService.sendGuestUserAccessResponse(_:)(uint64_t a1)
{
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 72) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 88) = v3;
  *(_OWORD *)(v2 + 104) = *(_OWORD *)(a1 + 32);
  *(unsigned char *)(v2 + 66) = *(unsigned char *)(a1 + 48);
  *(void *)(v2 + 120) = *v1;
  return MEMORY[0x270FA2498](sub_24CCD376C, 0, 0);
}

uint64_t sub_24CCD376C()
{
  if (qword_269824AB8 != -1) {
    swift_once();
  }
  char v11 = *(unsigned char *)(v0 + 66);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 80);
  uint64_t v7 = sub_24CCEC2F0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26982AD58);
  sub_24CCDBB04(0xD00000000000008ALL, 0x800000024CCF0E70, 0xD00000000000001FLL, 0x800000024CCF0F00);
  *(unsigned char *)(v0 + 65) = 16;
  *(void *)(v0 + 16) = v6;
  *(void *)(v0 + 24) = v5;
  *(void *)(v0 + 32) = v4;
  *(void *)(v0 + 40) = v3;
  *(void *)(v0 + 48) = v2;
  *(void *)(v0 + 56) = v1;
  *(unsigned char *)(v0 + 64) = v11;
  sub_24CCD4730(v6, v5, v4, v3, v2, v1, v11);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v8;
  unint64_t v9 = sub_24CCD4780();
  void *v8 = v0;
  v8[1] = sub_24CCD3914;
  return MEMORY[0x270F25FF0](v0 + 65, v0 + 16, &type metadata for GuestUserRemoteUnlockResponse, v9);
}

uint64_t sub_24CCD3914()
{
  char v2 = *(unsigned char *)(*v1 + 66);
  uint64_t v3 = *(void *)(*v1 + 112);
  uint64_t v4 = *(void *)(*v1 + 104);
  uint64_t v5 = *(void *)(*v1 + 96);
  uint64_t v6 = *(void *)(*v1 + 88);
  uint64_t v7 = *(void *)(*v1 + 80);
  uint64_t v8 = *(void *)(*v1 + 72);
  uint64_t v9 = *v1;
  *(void *)(v9 + 136) = v0;
  swift_task_dealloc();
  sub_24CCD47D4(v8, v7, v6, v5, v4, v3, v2);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCD3B08, 0, 0);
  }
  else
  {
    uint64_t v10 = *(uint64_t (**)(void))(v9 + 8);
    return v10();
  }
}

uint64_t sub_24CCD3B08()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t GuestUserHandoverService.requestViewMirroring()()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_24CCD3B44, 0, 0);
}

uint64_t sub_24CCD3B44()
{
  if (qword_269824AB8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCEC2F0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26982AD58);
  sub_24CCDBB04(0xD00000000000008ALL, 0x800000024CCF0E70, 0xD000000000000016, 0x800000024CCF0F20);
  *(unsigned char *)(v0 + 40) = 17;
  char v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  void *v2 = v0;
  v2[1] = sub_24CCD3C68;
  return MEMORY[0x270F25FF8](v0 + 40);
}

uint64_t sub_24CCD3C68()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCD48DC, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t GuestUserHandoverService.endGuestUserMode()()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_24CCD3DC0, 0, 0);
}

uint64_t sub_24CCD3DC0()
{
  if (qword_269824AB8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCEC2F0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26982AD58);
  sub_24CCDBB04(0xD00000000000008ALL, 0x800000024CCF0E70, 0xD000000000000012, 0x800000024CCF0F40);
  *(unsigned char *)(v0 + 40) = 18;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  void *v2 = v0;
  v2[1] = sub_24CCD3C68;
  return MEMORY[0x270F25FF8](v0 + 40);
}

uint64_t GuestUserHandoverService.unlockPeerDevice()()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_24CCD3F08, 0, 0);
}

uint64_t sub_24CCD3F08()
{
  if (qword_269824AB8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCEC2F0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26982AD58);
  sub_24CCDBB04(0xD00000000000008ALL, 0x800000024CCF0E70, 0xD000000000000012, 0x800000024CCF0F60);
  *(unsigned char *)(v0 + 40) = 19;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  void *v2 = v0;
  v2[1] = sub_24CCD402C;
  return MEMORY[0x270F25FF8](v0 + 40);
}

uint64_t sub_24CCD402C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCD4160, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24CCD4160()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t GuestUserHandoverService.transportError(_:)(unsigned char *a1)
{
  *(unsigned char *)(v2 + 42) = *a1;
  *(void *)(v2 + 16) = *v1;
  return MEMORY[0x270FA2498](sub_24CCD41A4, 0, 0);
}

uint64_t sub_24CCD41A4()
{
  if (qword_269824AB8 != -1) {
    swift_once();
  }
  char v1 = *(unsigned char *)(v0 + 42);
  uint64_t v2 = sub_24CCEC2F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26982AD58);
  sub_24CCDBB04(0xD00000000000008ALL, 0x800000024CCF0E70, 0xD000000000000012, 0x800000024CCF0F80);
  *(unsigned char *)(v0 + 40) = 20;
  *(unsigned char *)(v0 + 41) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v3;
  unint64_t v4 = sub_24CCD4824();
  void *v3 = v0;
  v3[1] = sub_24CCD402C;
  return MEMORY[0x270F25FF0](v0 + 40, v0 + 41, &type metadata for GuestUserAccessError, v4);
}

uint64_t GuestUserHandoverService.replayRequest(requestConfiguration:)(void *a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 24) = *a1;
  *(void *)(v2 + 32) = v3;
  return MEMORY[0x270FA2498](sub_24CCD431C, 0, 0);
}

uint64_t sub_24CCD431C()
{
  if (qword_269824AB8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = sub_24CCEC2F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26982AD58);
  sub_24CCDBB04(0xD00000000000008ALL, 0x800000024CCF0E70, 0xD000000000000024, 0x800000024CCF0FA0);
  *(unsigned char *)(v0 + 56) = 21;
  *(void *)(v0 + 16) = v1;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v3;
  unint64_t v4 = sub_24CCD4878();
  void *v3 = v0;
  v3[1] = sub_24CCD4480;
  return MEMORY[0x270F25FF0](v0 + 56, v0 + 16, &type metadata for GuestUserRemoteUnlockRequestConfiguration, v4);
}

uint64_t sub_24CCD4480()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CCD45D0, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24CCD45D0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t GuestUserHandoverService.dismissRequest()()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_24CCD460C, 0, 0);
}

uint64_t sub_24CCD460C()
{
  if (qword_269824AB8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCEC2F0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26982AD58);
  sub_24CCDBB04(0xD00000000000008ALL, 0x800000024CCF0E70, 0xD000000000000010, 0x800000024CCF0FD0);
  *(unsigned char *)(v0 + 40) = 22;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  void *v2 = v0;
  v2[1] = sub_24CCD3C68;
  return MEMORY[0x270F25FF8](v0 + 40);
}

uint64_t sub_24CCD4730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_24CCD4780()
{
  unint64_t result = qword_269824C28;
  if (!qword_269824C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824C28);
  }
  return result;
}

uint64_t sub_24CCD47D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_24CCD4824()
{
  unint64_t result = qword_269824ED0;
  if (!qword_269824ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824ED0);
  }
  return result;
}

unint64_t sub_24CCD4878()
{
  unint64_t result = qword_269824EA0;
  if (!qword_269824EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824EA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for GuestUserHandoverService()
{
  return &type metadata for GuestUserHandoverService;
}

uint64_t sub_24CCD48E0()
{
  return sub_24CCEC420();
}

uint64_t sub_24CCD495C()
{
  return sub_24CCEC3F0();
}

uint64_t sub_24CCD49C8()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCD4A54()
{
  return sub_24CCEC2C0();
}

uint64_t sub_24CCD4B08(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DSSGuestUserModeAppRestrictionState(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t GuestUserModeConfiguration.viewMirroringDevice.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v3 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t GuestUserModeConfiguration.appRestrictionState.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t GuestUserModeConfiguration.allowedApplicationBundleIds.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 GuestUserModeConfiguration.init(viewMirroringDevice:appRestrictionState:allowedApplicationBundleIds:)@<Q0>(__n128 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, __n128 *a4@<X8>)
{
  unint64_t v4 = a1->n128_u64[1];
  a4->n128_u64[0] = a1->n128_u64[0];
  a4->n128_u64[1] = v4;
  __n128 result = a1[1];
  a4[1] = result;
  a4[2].n128_u64[0] = a2;
  a4[2].n128_u64[1] = a3;
  return result;
}

unint64_t sub_24CCD4BB8(unsigned __int8 a1)
{
  unint64_t result = 0xD000000000000013;
  if (a1 >= 2u) {
    return 0xD00000000000001BLL;
  }
  return result;
}

BOOL sub_24CCD4C14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24CCD4C28()
{
  return sub_24CCD4BB8(*v0);
}

uint64_t sub_24CCD4C30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCD5FB8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CCD4C58(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24CCD4C64(uint64_t a1)
{
  unint64_t v2 = sub_24CCD4F1C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD4CA0(uint64_t a1)
{
  unint64_t v2 = sub_24CCD4F1C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GuestUserModeConfiguration.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824C78);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v15 = *v1;
  uint64_t v8 = *((void *)v1 + 2);
  uint64_t v7 = *((void *)v1 + 3);
  uint64_t v9 = *((void *)v1 + 4);
  uint64_t v13 = *((void *)v1 + 5);
  uint64_t v14 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCD4F1C();
  sub_24CCEC8A0();
  long long v17 = v15;
  uint64_t v18 = v8;
  uint64_t v19 = v7;
  char v20 = 0;
  sub_24CCD0934();
  uint64_t v10 = v16;
  sub_24CCEC790();
  if (!v10)
  {
    uint64_t v11 = v13;
    *(void *)&long long v17 = v14;
    char v20 = 1;
    type metadata accessor for DSSGuestUserModeAppRestrictionState(0);
    sub_24CCD4B08(&qword_269824C68);
    sub_24CCEC790();
    *(void *)&long long v17 = v11;
    char v20 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824C88);
    sub_24CCD52AC(&qword_269824C90);
    sub_24CCEC790();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24CCD4F1C()
{
  unint64_t result = qword_269824C80;
  if (!qword_269824C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824C80);
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

uint64_t GuestUserModeConfiguration.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824C98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCD4F1C();
  sub_24CCEC890();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v21 = 0;
  sub_24CCD08E0();
  sub_24CCEC720();
  uint64_t v9 = v18;
  uint64_t v10 = v20;
  uint64_t v15 = v19;
  uint64_t v16 = v17;
  type metadata accessor for DSSGuestUserModeAppRestrictionState(0);
  char v21 = 1;
  sub_24CCD4B08(&qword_269824C60);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24CCEC720();
  uint64_t v14 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824C88);
  char v21 = 2;
  sub_24CCD52AC(&qword_269824CA0);
  sub_24CCEC720();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = v17;
  *a2 = v16;
  a2[1] = v9;
  a2[2] = v15;
  a2[3] = v10;
  a2[4] = v14;
  a2[5] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CCD52AC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269824C88);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CCD5310@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return GuestUserModeConfiguration.init(from:)(a1, a2);
}

uint64_t sub_24CCD5328(void *a1)
{
  return GuestUserModeConfiguration.encode(to:)(a1);
}

uint64_t sub_24CCD5344(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_24CCEC850();
    swift_bridgeObjectRetain();
    sub_24CCEC360();
    uint64_t v18 = sub_24CCEC880();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    os_log_type_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_24CCEC7D0() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_24CCEC7D0() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_24CCD55EC()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCD5640()
{
  return sub_24CCEC2C0();
}

unint64_t GuestUserModeConfiguration.description.getter()
{
  return 0xD00000000000001DLL;
}

uint64_t _s21DeviceSharingServices26GuestUserModeConfigurationV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v9 = a2[4];
  uint64_t v8 = a2[5];
  if ((*a1 != *a2 || a1[1] != a2[1]) && (sub_24CCEC7D0() & 1) == 0) {
    return 0;
  }
  if (v3)
  {
    if (!v6 || (v2 != v7 || v3 != v6) && (sub_24CCEC7D0() & 1) == 0) {
      return 0;
    }
  }
  else if (v6)
  {
    return 0;
  }
  if (v4 != v9) {
    return 0;
  }
  return sub_24CCD5344(v5, v8);
}

unint64_t sub_24CCD5A30()
{
  unint64_t result = qword_269824CA8;
  if (!qword_269824CA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269824C88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824CA8);
  }
  return result;
}

unint64_t sub_24CCD5A8C()
{
  unint64_t result = qword_269824CB0;
  if (!qword_269824CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824CB0);
  }
  return result;
}

uint64_t destroy for GuestUserModeConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for GuestUserModeConfiguration(void *a1, void *a2)
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

void *assignWithCopy for GuestUserModeConfiguration(void *a1, void *a2)
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

void *assignWithTake for GuestUserModeConfiguration(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for GuestUserModeConfiguration(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GuestUserModeConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GuestUserModeConfiguration()
{
  return &type metadata for GuestUserModeConfiguration;
}

uint64_t getEnumTagSinglePayload for GuestUserModeConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GuestUserModeConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCD5E78);
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

ValueMetadata *type metadata accessor for GuestUserModeConfiguration.CodingKeys()
{
  return &type metadata for GuestUserModeConfiguration.CodingKeys;
}

unint64_t sub_24CCD5EB4()
{
  unint64_t result = qword_269824CB8;
  if (!qword_269824CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824CB8);
  }
  return result;
}

unint64_t sub_24CCD5F0C()
{
  unint64_t result = qword_269824CC0;
  if (!qword_269824CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824CC0);
  }
  return result;
}

unint64_t sub_24CCD5F64()
{
  unint64_t result = qword_269824CC8;
  if (!qword_269824CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824CC8);
  }
  return result;
}

uint64_t sub_24CCD5FB8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000024CCF1070 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024CCF1090 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000024CCF10B0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_24CCD60F8()
{
  unint64_t result = qword_269824CD0;
  if (!qword_269824CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824CD0);
  }
  return result;
}

unint64_t sub_24CCD614C()
{
  unint64_t result = qword_269824CD8;
  if (!qword_269824CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824CD8);
  }
  return result;
}

uint64_t sub_24CCD61A0(char a1)
{
  if (a1) {
    return 0x6465776F6C6C61;
  }
  else {
    return 0x64656E696C636564;
  }
}

uint64_t sub_24CCD61DC()
{
  return sub_24CCEC860();
}

uint64_t sub_24CCD620C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCD7D1C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CCD6238(uint64_t a1)
{
  unint64_t v2 = sub_24CCD67F4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD6274(uint64_t a1)
{
  unint64_t v2 = sub_24CCD67F4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CCD62B0()
{
  return sub_24CCD61A0(*v0);
}

uint64_t sub_24CCD62B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCD7C30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CCD62E0(uint64_t a1)
{
  unint64_t v2 = sub_24CCD67A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD631C(uint64_t a1)
{
  unint64_t v2 = sub_24CCD67A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CCD6358()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCD639C()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCD63DC(uint64_t a1)
{
  unint64_t v2 = sub_24CCD6848();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD6418(uint64_t a1)
{
  unint64_t v2 = sub_24CCD6848();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GuestUserRemoteUnlockResponse.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824CE0);
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  MEMORY[0x270FA5388]();
  char v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824CE8);
  uint64_t v24 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824CF0);
  uint64_t v29 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = *v1;
  uint64_t v12 = v1[1];
  uint64_t v22 = v1[2];
  uint64_t v23 = v12;
  uint64_t v13 = v1[3];
  uint64_t v20 = v1[4];
  uint64_t v21 = v13;
  uint64_t v19 = v1[5];
  char v14 = *((unsigned char *)v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCD67A0();
  sub_24CCEC8A0();
  if (v14)
  {
    LOBYTE(v30) = 1;
    sub_24CCD67F4();
    sub_24CCEC740();
    uint64_t v30 = v28;
    uint64_t v31 = v23;
    uint64_t v32 = v22;
    uint64_t v33 = v21;
    uint64_t v34 = v20;
    uint64_t v35 = v19;
    sub_24CCD614C();
    uint64_t v15 = v27;
    sub_24CCEC790();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v15);
  }
  else
  {
    LOBYTE(v30) = 0;
    sub_24CCD6848();
    sub_24CCEC740();
    LOBYTE(v30) = v28;
    sub_24CCD689C();
    uint64_t v16 = v25;
    sub_24CCEC760();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v16);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v11, v9);
}

unint64_t sub_24CCD67A0()
{
  unint64_t result = qword_269824CF8;
  if (!qword_269824CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824CF8);
  }
  return result;
}

unint64_t sub_24CCD67F4()
{
  unint64_t result = qword_269824D00;
  if (!qword_269824D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D00);
  }
  return result;
}

unint64_t sub_24CCD6848()
{
  unint64_t result = qword_269824D08;
  if (!qword_269824D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D08);
  }
  return result;
}

unint64_t sub_24CCD689C()
{
  unint64_t result = qword_269824EE0;
  if (!qword_269824EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824EE0);
  }
  return result;
}

uint64_t GuestUserRemoteUnlockResponse.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824D10);
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = &v27[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824D18);
  uint64_t v31 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v27[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824D20);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v11 = &v27[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = a1[3];
  uint64_t v33 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_24CCD67A0();
  uint64_t v13 = v39;
  sub_24CCEC890();
  if (!v13)
  {
    uint64_t v14 = v32;
    uint64_t v39 = v9;
    uint64_t v15 = sub_24CCEC730();
    if (*(void *)(v15 + 16) == 1)
    {
      int v28 = *(unsigned __int8 *)(v15 + 32);
      if (v28)
      {
        LOBYTE(v34) = 1;
        sub_24CCD67F4();
        sub_24CCEC6C0();
        sub_24CCD60F8();
        sub_24CCEC720();
        (*(void (**)(unsigned char *, uint64_t))(v30 + 8))(v4, v14);
        swift_bridgeObjectRelease();
        (*(void (**)(unsigned char *, uint64_t))(v39 + 8))(v11, v8);
        uint64_t v17 = v34;
        uint64_t v16 = v35;
        long long v18 = v36;
        uint64_t v19 = v37;
        uint64_t v20 = v38;
      }
      else
      {
        LOBYTE(v34) = 0;
        sub_24CCD6848();
        sub_24CCEC6C0();
        sub_24CCD6E0C();
        sub_24CCEC6F0();
        uint64_t v25 = v39;
        (*(void (**)(unsigned char *, uint64_t))(v31 + 8))(v7, v5);
        swift_bridgeObjectRelease();
        (*(void (**)(unsigned char *, uint64_t))(v25 + 8))(v11, v8);
        uint64_t v16 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        uint64_t v17 = v34;
        long long v18 = 0uLL;
      }
      uint64_t v26 = v29;
      *uint64_t v29 = v17;
      v26[1] = v16;
      *((_OWORD *)v26 + 1) = v18;
      v26[4] = v19;
      v26[5] = v20;
      *((unsigned char *)v26 + 48) = v28;
    }
    else
    {
      uint64_t v21 = sub_24CCEC5E0();
      swift_allocError();
      uint64_t v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269824D28);
      void *v23 = &type metadata for GuestUserRemoteUnlockResponse;
      sub_24CCEC6D0();
      sub_24CCEC5D0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v39 + 8))(v11, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
}

unint64_t sub_24CCD6E0C()
{
  unint64_t result = qword_269824D30;
  if (!qword_269824D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D30);
  }
  return result;
}

uint64_t sub_24CCD6E60@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return GuestUserRemoteUnlockResponse.init(from:)(a1, a2);
}

uint64_t sub_24CCD6E78(void *a1)
{
  return GuestUserRemoteUnlockResponse.encode(to:)(a1);
}

uint64_t sub_24CCD6E98()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCD6EEC()
{
  return sub_24CCEC2C0();
}

unint64_t GuestUserRemoteUnlockResponse.description.getter()
{
  unint64_t v1 = 0xD000000000000027;
  if (*(unsigned char *)(v0 + 48) == 1)
  {
    sub_24CCEC5A0();
    swift_bridgeObjectRelease();
    GuestUserModeConfiguration.description.getter();
    sub_24CCEC380();
    swift_bridgeObjectRelease();
    return 0xD00000000000003BLL;
  }
  return v1;
}

uint64_t _s21DeviceSharingServices29GuestUserRemoteUnlockResponseO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v38 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  uint64_t v9 = *(void *)a2;
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v11 = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  uint64_t v13 = *(void *)(a2 + 40);
  char v14 = *(unsigned char *)(a2 + 48);
  uint64_t v36 = v6;
  uint64_t v37 = v3;
  if ((v7 & 1) == 0)
  {
    uint64_t v24 = *(void *)(a1 + 8);
    uint64_t v35 = *(void *)(a1 + 16);
    if ((*(unsigned char *)(a2 + 48) & 1) == 0)
    {
      uint64_t v25 = *(void *)(a2 + 32);
      uint64_t v26 = *(void *)(a2 + 8);
      sub_24CCD47D4(v38, v2, v4, v3, v6, v5, 0);
      sub_24CCD47D4(v9, v26, v10, v11, v25, v13, 0);
      if (v38 == 3)
      {
        if (v9 != 3)
        {
LABEL_10:
          char v23 = 0;
          return v23 & 1;
        }
      }
      else if (v9 == 3 || v9 != v38)
      {
        goto LABEL_10;
      }
      char v23 = 1;
      return v23 & 1;
    }
LABEL_9:
    uint64_t v29 = v8;
    sub_24CCD4730(v9, v8, v10, v11, v12, v13, v14);
    sub_24CCD47D4(v38, v24, v35, v37, v36, v5, v7);
    sub_24CCD47D4(v9, v29, v10, v11, v12, v13, v14);
    goto LABEL_10;
  }
  uint64_t v34 = *(void *)a2;
  if ((*(unsigned char *)(a2 + 48) & 1) == 0)
  {
    uint64_t v35 = *(void *)(a1 + 16);
    uint64_t v27 = *(void *)(a2 + 8);
    uint64_t v28 = *(void *)(a1 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v24 = v28;
    swift_bridgeObjectRetain();
    uint64_t v8 = v27;
    uint64_t v9 = v34;
    goto LABEL_9;
  }
  v40[0] = *(void *)a1;
  v40[1] = v2;
  v40[2] = v4;
  v40[3] = v3;
  v40[4] = v6;
  v40[5] = v5;
  v39[0] = v9;
  v39[1] = v8;
  v39[2] = v10;
  v39[3] = v11;
  v39[4] = v12;
  v39[5] = v13;
  uint64_t v15 = v4;
  uint64_t v16 = v11;
  uint64_t v17 = v3;
  uint64_t v32 = v8;
  uint64_t v33 = v16;
  uint64_t v18 = v6;
  uint64_t v31 = v12;
  uint64_t v19 = v12;
  uint64_t v20 = v8;
  uint64_t v21 = v2;
  sub_24CCD4730(v9, v8, v10, v16, v19, v13, 1);
  sub_24CCD4730(v38, v21, v15, v17, v18, v5, 1);
  sub_24CCD4730(v9, v20, v10, v16, v31, v13, 1);
  uint64_t v22 = v18;
  sub_24CCD4730(v38, v21, v15, v37, v18, v5, 1);
  char v23 = _s21DeviceSharingServices26GuestUserModeConfigurationV2eeoiySbAC_ACtFZ_0(v40, v39);
  sub_24CCD47D4(v38, v21, v15, v37, v22, v5, 1);
  sub_24CCD47D4(v9, v32, v10, v33, v31, v13, 1);
  sub_24CCD47D4(v9, v32, v10, v33, v31, v13, 1);
  sub_24CCD47D4(v38, v21, v15, v37, v36, v5, 1);
  return v23 & 1;
}

uint64_t destroy for GuestUserRemoteUnlockResponse(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 48);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)result + 2;
  }
  if (v1 == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for GuestUserRemoteUnlockResponse(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 48);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v5;
    uint64_t v6 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v7 = 1;
  }
  else
  {
    char v7 = 0;
    *(unsigned char *)a1 = *(unsigned char *)a2;
  }
  *(unsigned char *)(a1 + 48) = v7;
  return a1;
}

uint64_t assignWithCopy for GuestUserRemoteUnlockResponse(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 48);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 48);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(unsigned char *)(a1 + 48) = 1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 48) = 0;
    }
  }
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for GuestUserRemoteUnlockResponse(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 48);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 48);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    }
    else
    {
      LOBYTE(v5) = 0;
      *(unsigned char *)a1 = *(unsigned char *)a2;
    }
    *(unsigned char *)(a1 + 48) = v5;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for GuestUserRemoteUnlockResponse(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GuestUserRemoteUnlockResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CCD766C(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 48);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_24CCD7688(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for GuestUserRemoteUnlockResponse()
{
  return &type metadata for GuestUserRemoteUnlockResponse;
}

unsigned char *storeEnumTagSinglePayload for GuestUserRemoteUnlockResponse.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCD778CLL);
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

ValueMetadata *type metadata accessor for GuestUserRemoteUnlockResponse.CodingKeys()
{
  return &type metadata for GuestUserRemoteUnlockResponse.CodingKeys;
}

uint64_t sub_24CCD77D0()
{
  return 0;
}

ValueMetadata *type metadata accessor for GuestUserRemoteUnlockResponse.DeclinedCodingKeys()
{
  return &type metadata for GuestUserRemoteUnlockResponse.DeclinedCodingKeys;
}

uint64_t getEnumTagSinglePayload for NotificationType.GuestUserModeUnavailableCodingKeys(unsigned int *a1, int a2)
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

unsigned char *_s21DeviceSharingServices29GuestUserRemoteUnlockResponseO18DeclinedCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CCD78D4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for GuestUserRemoteUnlockResponse.AllowedCodingKeys()
{
  return &type metadata for GuestUserRemoteUnlockResponse.AllowedCodingKeys;
}

unint64_t sub_24CCD7910()
{
  unint64_t result = qword_269824D38;
  if (!qword_269824D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D38);
  }
  return result;
}

unint64_t sub_24CCD7968()
{
  unint64_t result = qword_269824D40;
  if (!qword_269824D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D40);
  }
  return result;
}

unint64_t sub_24CCD79C0()
{
  unint64_t result = qword_269824D48;
  if (!qword_269824D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D48);
  }
  return result;
}

unint64_t sub_24CCD7A18()
{
  unint64_t result = qword_269824D50;
  if (!qword_269824D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D50);
  }
  return result;
}

unint64_t sub_24CCD7A70()
{
  unint64_t result = qword_269824D58;
  if (!qword_269824D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D58);
  }
  return result;
}

unint64_t sub_24CCD7AC8()
{
  unint64_t result = qword_269824D60;
  if (!qword_269824D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D60);
  }
  return result;
}

unint64_t sub_24CCD7B20()
{
  unint64_t result = qword_269824D68;
  if (!qword_269824D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D68);
  }
  return result;
}

unint64_t sub_24CCD7B78()
{
  unint64_t result = qword_269824D70;
  if (!qword_269824D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D70);
  }
  return result;
}

unint64_t sub_24CCD7BD0()
{
  unint64_t result = qword_269824D78;
  if (!qword_269824D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D78);
  }
  return result;
}

uint64_t sub_24CCD7C24()
{
  return 12383;
}

uint64_t sub_24CCD7C30(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64656E696C636564 && a2 == 0xE800000000000000;
  if (v3 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465776F6C6C61 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CCD7D1C(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

unint64_t sub_24CCD7D8C()
{
  unint64_t result = qword_269824D80;
  if (!qword_269824D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D80);
  }
  return result;
}

unint64_t sub_24CCD7DE0()
{
  unint64_t result = qword_269824D88;
  if (!qword_269824D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824D88);
  }
  return result;
}

BOOL static GuestUserAccessError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t GuestUserAccessError.hash(into:)()
{
  return sub_24CCEC860();
}

uint64_t sub_24CCD7E7C(char a1)
{
  uint64_t result = 0xD000000000000012;
  if (a1)
  {
    if (a1 == 1) {
      return 0x536B736944776F6CLL;
    }
    else {
      return 0xD000000000000014;
    }
  }
  return result;
}

uint64_t sub_24CCD7EEC()
{
  return sub_24CCD7E7C(*v0);
}

uint64_t sub_24CCD7EF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCD917C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CCD7F1C(uint64_t a1)
{
  unint64_t v2 = sub_24CCD84B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD7F58(uint64_t a1)
{
  unint64_t v2 = sub_24CCD84B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CCD7F94(uint64_t a1)
{
  unint64_t v2 = sub_24CCD8560();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD7FD0(uint64_t a1)
{
  unint64_t v2 = sub_24CCD8560();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CCD800C(uint64_t a1)
{
  unint64_t v2 = sub_24CCD850C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD8048(uint64_t a1)
{
  unint64_t v2 = sub_24CCD850C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CCD8084(uint64_t a1)
{
  unint64_t v2 = sub_24CCD85B4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCD80C0(uint64_t a1)
{
  unint64_t v2 = sub_24CCD85B4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GuestUserAccessError.hashValue.getter()
{
  return sub_24CCEC880();
}

uint64_t GuestUserAccessError.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824D90);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388]();
  char v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824D98);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824DA0);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824DA8);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCD84B8();
  sub_24CCEC8A0();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_24CCD8560();
      sub_24CCEC740();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_24CCD850C();
      uint64_t v17 = v23;
      sub_24CCEC740();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_24CCD85B4();
    sub_24CCEC740();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_24CCD84B8()
{
  unint64_t result = qword_269824DB0;
  if (!qword_269824DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824DB0);
  }
  return result;
}

unint64_t sub_24CCD850C()
{
  unint64_t result = qword_269824DB8;
  if (!qword_269824DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824DB8);
  }
  return result;
}

unint64_t sub_24CCD8560()
{
  unint64_t result = qword_269824DC0;
  if (!qword_269824DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824DC0);
  }
  return result;
}

unint64_t sub_24CCD85B4()
{
  unint64_t result = qword_269824DC8;
  if (!qword_269824DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824DC8);
  }
  return result;
}

uint64_t GuestUserAccessError.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824DD0);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824DD8);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824DE0);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269824DE8);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCD84B8();
  uint64_t v12 = (uint64_t)v39;
  sub_24CCEC890();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v39 = a1;
  uint64_t v15 = v11;
  uint64_t v16 = sub_24CCEC730();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_24CCEC5E0();
    swift_allocError();
    char v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824D28);
    void *v23 = &type metadata for GuestUserAccessError;
    sub_24CCEC6D0();
    sub_24CCEC5D0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v9);
    a1 = v39;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  int v17 = *(unsigned __int8 *)(v16 + 32);
  if (*(unsigned char *)(v16 + 32))
  {
    if (v17 == 1)
    {
      char v41 = 1;
      sub_24CCD8560();
      uint64_t v18 = v30;
      sub_24CCEC6C0();
      uint64_t v20 = v35;
      uint64_t v19 = v36;
      uint64_t v30 = v18;
      if (v18)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
LABEL_12:
        a1 = v39;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
      (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
    }
    else
    {
      char v42 = 2;
      sub_24CCD850C();
      uint64_t v25 = v30;
      sub_24CCEC6C0();
      uint64_t v20 = v35;
      uint64_t v26 = v36;
      uint64_t v30 = v25;
      if (v25)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v13);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    }
  }
  else
  {
    char v40 = 0;
    sub_24CCD85B4();
    uint64_t v24 = v30;
    sub_24CCEC6C0();
    uint64_t v30 = v24;
    if (v24)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
    uint64_t v20 = v35;
  }
  *uint64_t v20 = v17;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
}

unint64_t sub_24CCD8BC4()
{
  unint64_t result = qword_269824DF0;
  if (!qword_269824DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824DF0);
  }
  return result;
}

uint64_t sub_24CCD8C18@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return GuestUserAccessError.init(from:)(a1, a2);
}

uint64_t sub_24CCD8C30(void *a1)
{
  return GuestUserAccessError.encode(to:)(a1);
}

uint64_t sub_24CCD8C48()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCD8C9C()
{
  return sub_24CCEC2C0();
}

ValueMetadata *type metadata accessor for GuestUserAccessError()
{
  return &type metadata for GuestUserAccessError;
}

unsigned char *_s21DeviceSharingServices20GuestUserAccessErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCD8DFCLL);
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

ValueMetadata *type metadata accessor for GuestUserAccessError.CodingKeys()
{
  return &type metadata for GuestUserAccessError.CodingKeys;
}

ValueMetadata *type metadata accessor for GuestUserAccessError.RemoteUnlockFailedCodingKeys()
{
  return &type metadata for GuestUserAccessError.RemoteUnlockFailedCodingKeys;
}

ValueMetadata *type metadata accessor for GuestUserAccessError.LowDiskSpaceCodingKeys()
{
  return &type metadata for GuestUserAccessError.LowDiskSpaceCodingKeys;
}

ValueMetadata *type metadata accessor for GuestUserAccessError.PeerConnectionFailedCodingKeys()
{
  return &type metadata for GuestUserAccessError.PeerConnectionFailedCodingKeys;
}

unint64_t sub_24CCD8E68()
{
  unint64_t result = qword_269824DF8;
  if (!qword_269824DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824DF8);
  }
  return result;
}

unint64_t sub_24CCD8EC0()
{
  unint64_t result = qword_269824E00;
  if (!qword_269824E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824E00);
  }
  return result;
}

unint64_t sub_24CCD8F18()
{
  unint64_t result = qword_269824E08;
  if (!qword_269824E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824E08);
  }
  return result;
}

unint64_t sub_24CCD8F70()
{
  unint64_t result = qword_269824E10;
  if (!qword_269824E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824E10);
  }
  return result;
}

unint64_t sub_24CCD8FC8()
{
  unint64_t result = qword_269824E18;
  if (!qword_269824E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824E18);
  }
  return result;
}

unint64_t sub_24CCD9020()
{
  unint64_t result = qword_269824E20;
  if (!qword_269824E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824E20);
  }
  return result;
}

unint64_t sub_24CCD9078()
{
  unint64_t result = qword_269824E28;
  if (!qword_269824E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824E28);
  }
  return result;
}

unint64_t sub_24CCD90D0()
{
  unint64_t result = qword_269824E30;
  if (!qword_269824E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824E30);
  }
  return result;
}

unint64_t sub_24CCD9128()
{
  unint64_t result = qword_269824E38;
  if (!qword_269824E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824E38);
  }
  return result;
}

uint64_t sub_24CCD917C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000024CCF1170 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x536B736944776F6CLL && a2 == 0xEC00000065636170 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024CCF1190)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t ObserversTable.observerCount.getter()
{
  uint64_t v1 = (uint64_t)&(*v0)[4];
  unint64_t v2 = *v0 + 6;
  os_unfair_lock_lock(v2);
  sub_24CCD933C(v1, &v4);
  os_unfair_lock_unlock(v2);
  return v4;
}

uint64_t sub_24CCD933C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*(void *)result + 16);
  return result;
}

BOOL ObserversTable.hasObservers.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (uint64_t)&(*v0)[4];
  swift_retain();
  os_unfair_lock_lock(v1 + 6);
  sub_24CCD933C(v2, &v5);
  os_unfair_lock_unlock(v1 + 6);
  uint64_t v3 = v5;
  swift_release();
  return v3 > 0;
}

uint64_t ObserversTable.init()@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824E90);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = MEMORY[0x263F8EE80];
  *a1 = result;
  return result;
}

void ObserversTable.add(_:)()
{
  uint64_t v1 = *v0 + 6;
  os_unfair_lock_lock(v1);
  sub_24CCD94B8();
  os_unfair_lock_unlock(v1);
}

uint64_t sub_24CCD946C(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakInit();
  v4[8] = 0;
  return sub_24CCD950C((uint64_t)v4, a2);
}

uint64_t sub_24CCD94B8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_unknownObjectWeakInit();
  v3[8] = 0;
  return sub_24CCD950C((uint64_t)v3, v1);
}

uint64_t sub_24CCD950C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (*(unsigned char *)(a1 + 8))
  {
    sub_24CCDBA74(a1, (uint64_t *)&unk_269824E70);
    unint64_t v5 = sub_24CCDE19C(a2);
    char v7 = v6;
    if (v6)
    {
      unint64_t v8 = v5;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v10 = *v2;
      uint64_t v13 = *v3;
      uint64_t *v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24CCDF140();
        uint64_t v10 = v13;
      }
      sub_24CCDAAA8(*(void *)(v10 + 56) + 8 * v8, (uint64_t)&v15);
      sub_24CCDB324(v8, v10);
      uint64_t *v3 = v10;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
    }
    BOOL v16 = (v7 & 1) == 0;
    return sub_24CCDBA74((uint64_t)&v15, (uint64_t *)&unk_269824E70);
  }
  else
  {
    sub_24CCDAAA8(a1, (uint64_t)&v15);
    char v11 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_24CCDE868((uint64_t)&v15, a2, v11);
    uint64_t *v2 = v14;
    return swift_bridgeObjectRelease();
  }
}

void ObserversTable.remove(_:)()
{
  uint64_t v1 = (uint64_t *)&(*v0)[4];
  uint64_t v2 = *v0 + 6;
  os_unfair_lock_lock(v2);
  sub_24CCD9758(v1);
  os_unfair_lock_unlock(v2);
}

uint64_t sub_24CCD9688(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = sub_24CCDE19C(a2);
  char v5 = v4;
  if (v4)
  {
    unint64_t v6 = v3;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *a1;
    uint64_t v12 = *a1;
    *a1 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_24CCDF140();
      uint64_t v8 = v12;
    }
    sub_24CCDAAA8(*(void *)(v8 + 56) + 8 * v6, (uint64_t)&v10);
    sub_24CCDB324(v6, v8);
    *a1 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  BOOL v11 = (v5 & 1) == 0;
  return sub_24CCDBA74((uint64_t)&v10, (uint64_t *)&unk_269824E70);
}

uint64_t sub_24CCD9758(uint64_t *a1)
{
  return sub_24CCD9688(a1, *(void *)(v1 + 16));
}

Swift::Void __swiftcall ObserversTable.removeAll()()
{
  uint64_t v1 = *v0 + 4;
  uint64_t v2 = *v0 + 6;
  os_unfair_lock_lock(v2);
  sub_24CCD97D8(v1);
  os_unfair_lock_unlock(v2);
}

uint64_t sub_24CCD97D8(void *a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = MEMORY[0x263F8EE80];
  return result;
}

void sub_24CCD9814(os_unfair_lock_s **a1)
{
  uint64_t v1 = *a1 + 4;
  uint64_t v2 = *a1 + 6;
  os_unfair_lock_lock(v2);
  uint64_t v25 = (uint64_t)v1;
  sub_24CCD9F00(v1, &v29);
  uint64_t v26 = v2;
  os_unfair_lock_unlock(v2);
  int64_t v3 = 0;
  uint64_t v4 = v29;
  uint64_t v27 = v29 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v29 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v29 + 64);
  int64_t v28 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
LABEL_8:
      uint64_t v11 = *(void *)(v4 + 56);
      uint64_t v29 = *(void *)(*(void *)(v4 + 48) + 8 * v10);
      sub_24CCD9F20(v11 + 8 * v10, (uint64_t)v30);
      goto LABEL_27;
    }
    int64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_46;
    }
    if (v12 < v28)
    {
      unint64_t v13 = *(void *)(v27 + 8 * v12);
      if (v13) {
        goto LABEL_12;
      }
      int64_t v14 = v3 + 2;
      ++v3;
      if (v12 + 1 < v28)
      {
        unint64_t v13 = *(void *)(v27 + 8 * v14);
        if (v13) {
          goto LABEL_15;
        }
        int64_t v3 = v12 + 1;
        if (v12 + 2 < v28)
        {
          unint64_t v13 = *(void *)(v27 + 8 * (v12 + 2));
          if (v13)
          {
            v12 += 2;
            goto LABEL_12;
          }
          int64_t v14 = v12 + 3;
          int64_t v3 = v12 + 2;
          if (v12 + 3 < v28)
          {
            unint64_t v13 = *(void *)(v27 + 8 * v14);
            if (v13)
            {
LABEL_15:
              int64_t v12 = v14;
LABEL_12:
              unint64_t v7 = (v13 - 1) & v13;
              unint64_t v10 = __clz(__rbit64(v13)) + (v12 << 6);
              int64_t v3 = v12;
              goto LABEL_8;
            }
            while (1)
            {
              int64_t v12 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                break;
              }
              if (v12 >= v28)
              {
                int64_t v3 = v28 - 1;
                goto LABEL_26;
              }
              unint64_t v13 = *(void *)(v27 + 8 * v12);
              ++v14;
              if (v13) {
                goto LABEL_12;
              }
            }
LABEL_46:
            __break(1u);
            return;
          }
        }
      }
    }
LABEL_26:
    unint64_t v7 = 0;
    uint64_t v29 = 0;
    *(void *)&v30[0] = 0;
LABEL_27:
    sub_24CCDB924((uint64_t)&v29, (uint64_t)&v32, &qword_269824E40);
    uint64_t v15 = v32;
    if (!v32) {
      break;
    }
    sub_24CCDAAA8((uint64_t)&v33, (uint64_t)v31);
    uint64_t v16 = MEMORY[0x253311510](v31);
    if (v16)
    {
      uint64_t v17 = v16;
      swift_unknownObjectRetain();
      swift_getObjectType();
      uint64_t v18 = swift_conformsToProtocol2();
      if (v18) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = 0;
      }
      if (v18) {
        uint64_t v20 = v17;
      }
      else {
        uint64_t v20 = 0;
      }
      if (v20)
      {
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v29 = 3;
        memset(v30, 0, 41);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v19 + 8))(&v29, ObjectType, v19);
      }
      swift_unknownObjectRelease_n();
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_24CCDAFB0(0, v8[2] + 1, 1, v8);
      }
      unint64_t v23 = v8[2];
      unint64_t v22 = v8[3];
      if (v23 >= v22 >> 1) {
        uint64_t v8 = sub_24CCDAFB0((void *)(v22 > 1), v23 + 1, 1, v8);
      }
      v8[2] = v23 + 1;
      v8[v23 + 4] = v15;
    }
    sub_24CCDB0C0((uint64_t)v31);
  }
  uint64_t v24 = swift_release();
  if (v8[2])
  {
    MEMORY[0x270FA5388](v24);
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v26);
    sub_24CCDBAEC(v25);
    os_unfair_lock_unlock(v26);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void ObserversTable.enumerate(_:)(void (*a1)(void))
{
  int64_t v3 = *v1;
  uint64_t v4 = *v1 + 4;
  uint64_t v5 = v3 + 6;
  os_unfair_lock_lock(v3 + 6);
  sub_24CCD9F00(v4, &v27);
  unint64_t v22 = v5;
  os_unfair_lock_unlock(v5);
  int64_t v6 = 0;
  uint64_t v7 = v27;
  uint64_t v23 = v27 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(v27 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v27 + 64);
  int64_t v24 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
LABEL_8:
      uint64_t v14 = *(void *)(v7 + 56);
      uint64_t v25 = *(void *)(*(void *)(v7 + 48) + 8 * v13);
      sub_24CCD9F20(v14 + 8 * v13, (uint64_t)&v26);
      goto LABEL_27;
    }
    int64_t v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v15 < v24)
    {
      unint64_t v16 = *(void *)(v23 + 8 * v15);
      if (v16) {
        goto LABEL_12;
      }
      int64_t v17 = v6 + 2;
      ++v6;
      if (v15 + 1 < v24)
      {
        unint64_t v16 = *(void *)(v23 + 8 * v17);
        if (v16) {
          goto LABEL_15;
        }
        int64_t v6 = v15 + 1;
        if (v15 + 2 < v24)
        {
          unint64_t v16 = *(void *)(v23 + 8 * (v15 + 2));
          if (v16)
          {
            v15 += 2;
            goto LABEL_12;
          }
          int64_t v17 = v15 + 3;
          int64_t v6 = v15 + 2;
          if (v15 + 3 < v24)
          {
            unint64_t v16 = *(void *)(v23 + 8 * v17);
            if (v16)
            {
LABEL_15:
              int64_t v15 = v17;
LABEL_12:
              unint64_t v10 = (v16 - 1) & v16;
              unint64_t v13 = __clz(__rbit64(v16)) + (v15 << 6);
              int64_t v6 = v15;
              goto LABEL_8;
            }
            while (1)
            {
              int64_t v15 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                break;
              }
              if (v15 >= v24)
              {
                int64_t v6 = v24 - 1;
                goto LABEL_26;
              }
              unint64_t v16 = *(void *)(v23 + 8 * v15);
              ++v17;
              if (v16) {
                goto LABEL_12;
              }
            }
LABEL_38:
            __break(1u);
            return;
          }
        }
      }
    }
LABEL_26:
    unint64_t v10 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
LABEL_27:
    sub_24CCDB924((uint64_t)&v25, (uint64_t)&v27, &qword_269824E40);
    uint64_t v18 = v27;
    if (!v27) {
      break;
    }
    sub_24CCDAAA8((uint64_t)&v28, (uint64_t)&v25);
    if (MEMORY[0x253311510](&v25))
    {
      a1();
      swift_unknownObjectRelease();
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v11 = sub_24CCDAFB0(0, v11[2] + 1, 1, v11);
      }
      unint64_t v20 = v11[2];
      unint64_t v19 = v11[3];
      if (v20 >= v19 >> 1) {
        uint64_t v11 = sub_24CCDAFB0((void *)(v19 > 1), v20 + 1, 1, v11);
      }
      v11[2] = v20 + 1;
      v11[v20 + 4] = v18;
    }
    sub_24CCDB0C0((uint64_t)&v25);
  }
  uint64_t v21 = swift_release();
  if (v11[2])
  {
    MEMORY[0x270FA5388](v21);
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v22);
    sub_24CCDAA8C((uint64_t)v4);
    os_unfair_lock_unlock(v22);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24CCD9F00@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CCD9F20(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA05E0](a2, a1);
}

uint64_t ObserversTable.enumerate(_:)(uint64_t a1, uint64_t a2)
{
  v3[7] = a1;
  v3[8] = a2;
  v3[9] = *v2;
  return MEMORY[0x270FA2498](sub_24CCD9F58, 0, 0);
}

void sub_24CCD9F58()
{
  uint64_t v34 = v0;
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 72);
  uint64_t v2 = v1 + 4;
  int64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_24CCDBAD4(v2, &v33);
  os_unfair_lock_unlock(v3);
  int64_t v4 = 0;
  uint64_t v5 = (void *)(v0 + 32);
  uint64_t v6 = v33;
  *(void *)(v0 + 80) = v33;
  char v7 = *(unsigned char *)(v6 + 32);
  *(unsigned char *)(v0 + 136) = v7;
  uint64_t v8 = 1 << v7;
  uint64_t v9 = *(void *)(v6 + 64);
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  unint64_t v12 = (void *)MEMORY[0x263F8EE78];
  *(void *)(v0 + 88) = MEMORY[0x263F8EE78];
  if (!v11) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v13 = (v11 - 1) & v11;
  unint64_t v14 = __clz(__rbit64(v11)) | (v4 << 6);
  uint64_t v15 = *(void *)(v0 + 80);
  while (2)
  {
    uint64_t v16 = 8 * v14;
    void *v5 = *(void *)(*(void *)(v15 + 48) + v16);
    sub_24CCD9F20(*(void *)(v15 + 56) + v16, v0 + 40);
    while (1)
    {
      *(void *)(v0 + 96) = v4;
      *(void *)(v0 + 104) = v13;
      sub_24CCDB924(v0 + 32, v0 + 16, &qword_269824E40);
      uint64_t v22 = *(void *)(v0 + 16);
      if (!v22)
      {
        swift_release();
        if (v12[2])
        {
          uint64_t v26 = *(os_unfair_lock_s **)(v0 + 72);
          uint64_t v27 = v26 + 6;
          uint64_t v28 = (uint64_t)&v26[4];
          *(void *)(swift_task_alloc() + 16) = v12;
          swift_bridgeObjectRetain();
          os_unfair_lock_lock(v27);
          sub_24CCDBAEC(v28);
          os_unfair_lock_unlock(v27);
          swift_bridgeObjectRelease_n();
          swift_task_dealloc();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v31 = *(void (**)(void))(v0 + 8);
        v31();
        return;
      }
      sub_24CCDAAA8(v0 + 24, v0 + 48);
      uint64_t v23 = MEMORY[0x253311510](v0 + 48);
      *(void *)(v0 + 112) = v23;
      if (v23)
      {
        uint64_t v29 = v23;
        uint64_t v32 = (void (*)(uint64_t))(*(void *)(v0 + 56) + **(int **)(v0 + 56));
        uint64_t v30 = (void *)swift_task_alloc();
        *(void *)(v0 + 120) = v30;
        void *v30 = v0;
        v30[1] = sub_24CCDA384;
        v32(v29);
        return;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v12 = sub_24CCDAFB0(0, v12[2] + 1, 1, v12);
      }
      unint64_t v25 = v12[2];
      unint64_t v24 = v12[3];
      if (v25 >= v24 >> 1) {
        unint64_t v12 = sub_24CCDAFB0((void *)(v24 > 1), v25 + 1, 1, v12);
      }
      v12[2] = v25 + 1;
      v12[v25 + 4] = v22;
      sub_24CCDB0C0(v0 + 48);
      int64_t v4 = *(void *)(v0 + 96);
      unint64_t v11 = *(void *)(v0 + 104);
      *(void *)(v0 + 88) = v12;
      if (v11) {
        goto LABEL_5;
      }
LABEL_7:
      int64_t v17 = v4 + 1;
      if (__OFADD__(v4, 1))
      {
        __break(1u);
        goto LABEL_43;
      }
      int64_t v18 = (unint64_t)((1 << *(unsigned char *)(v0 + 136)) + 63) >> 6;
      if (v17 < v18)
      {
        uint64_t v15 = *(void *)(v0 + 80);
        uint64_t v19 = v15 + 64;
        unint64_t v20 = *(void *)(v15 + 64 + 8 * v17);
        if (v20) {
          goto LABEL_10;
        }
        int64_t v21 = v4 + 2;
        ++v4;
        if (v17 + 1 < v18)
        {
          unint64_t v20 = *(void *)(v19 + 8 * v21);
          if (v20) {
            goto LABEL_13;
          }
          int64_t v4 = v17 + 1;
          if (v17 + 2 < v18)
          {
            unint64_t v20 = *(void *)(v19 + 8 * (v17 + 2));
            if (v20)
            {
              v17 += 2;
              goto LABEL_10;
            }
            int64_t v21 = v17 + 3;
            int64_t v4 = v17 + 2;
            if (v17 + 3 < v18) {
              break;
            }
          }
        }
      }
LABEL_24:
      uint64_t v13 = 0;
      void *v5 = 0;
      *(void *)(v0 + 40) = 0;
    }
    unint64_t v20 = *(void *)(v19 + 8 * v21);
    if (v20)
    {
LABEL_13:
      int64_t v17 = v21;
LABEL_10:
      uint64_t v13 = (v20 - 1) & v20;
      unint64_t v14 = __clz(__rbit64(v20)) + (v17 << 6);
      int64_t v4 = v17;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v17 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v17 >= v18)
    {
      int64_t v4 = v18 - 1;
      goto LABEL_24;
    }
    unint64_t v20 = *(void *)(v19 + 8 * v17);
    ++v21;
    if (v20) {
      goto LABEL_10;
    }
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_24CCDA384()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CCDA860;
  }
  else {
    uint64_t v2 = sub_24CCDA498;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_24CCDA498()
{
  uint64_t v1 = (void *)(v0 + 32);
  swift_unknownObjectRelease();
  uint64_t v24 = *(void *)(v0 + 128);
  for (unint64_t i = *(void **)(v0 + 88); ; i[v17 + 4] = v14)
  {
    sub_24CCDB0C0(v0 + 48);
    int64_t v4 = *(void *)(v0 + 96);
    unint64_t v3 = *(void *)(v0 + 104);
    *(void *)(v0 + 88) = i;
    if (v3)
    {
      uint64_t v5 = (v3 - 1) & v3;
      unint64_t v6 = __clz(__rbit64(v3)) | (v4 << 6);
      uint64_t v7 = *(void *)(v0 + 80);
LABEL_4:
      uint64_t v8 = 8 * v6;
      void *v1 = *(void *)(*(void *)(v7 + 48) + v8);
      sub_24CCD9F20(*(void *)(v7 + 56) + v8, v0 + 40);
      goto LABEL_23;
    }
    int64_t v9 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_42;
    }
    int64_t v10 = (unint64_t)((1 << *(unsigned char *)(v0 + 136)) + 63) >> 6;
    if (v9 < v10)
    {
      uint64_t v7 = *(void *)(v0 + 80);
      uint64_t v11 = v7 + 64;
      unint64_t v12 = *(void *)(v7 + 64 + 8 * v9);
      if (v12) {
        goto LABEL_8;
      }
      int64_t v13 = v4 + 2;
      ++v4;
      if (v9 + 1 < v10)
      {
        unint64_t v12 = *(void *)(v11 + 8 * v13);
        if (v12) {
          goto LABEL_11;
        }
        int64_t v4 = v9 + 1;
        if (v9 + 2 < v10)
        {
          unint64_t v12 = *(void *)(v11 + 8 * (v9 + 2));
          if (v12)
          {
            v9 += 2;
            goto LABEL_8;
          }
          int64_t v13 = v9 + 3;
          int64_t v4 = v9 + 2;
          if (v9 + 3 < v10)
          {
            unint64_t v12 = *(void *)(v11 + 8 * v13);
            if (v12)
            {
LABEL_11:
              int64_t v9 = v13;
LABEL_8:
              uint64_t v5 = (v12 - 1) & v12;
              unint64_t v6 = __clz(__rbit64(v12)) + (v9 << 6);
              int64_t v4 = v9;
              goto LABEL_4;
            }
            while (1)
            {
              int64_t v9 = v13 + 1;
              if (__OFADD__(v13, 1)) {
                break;
              }
              if (v9 >= v10)
              {
                int64_t v4 = v10 - 1;
                goto LABEL_22;
              }
              unint64_t v12 = *(void *)(v11 + 8 * v9);
              ++v13;
              if (v12) {
                goto LABEL_8;
              }
            }
LABEL_42:
            __break(1u);
            return;
          }
        }
      }
    }
LABEL_22:
    uint64_t v5 = 0;
    void *v1 = 0;
    *(void *)(v0 + 40) = 0;
LABEL_23:
    *(void *)(v0 + 96) = v4;
    *(void *)(v0 + 104) = v5;
    sub_24CCDB924(v0 + 32, v0 + 16, &qword_269824E40);
    uint64_t v14 = *(void *)(v0 + 16);
    if (!v14) {
      break;
    }
    sub_24CCDAAA8(v0 + 24, v0 + 48);
    uint64_t v15 = MEMORY[0x253311510](v0 + 48);
    *(void *)(v0 + 112) = v15;
    if (v15)
    {
      uint64_t v21 = v15;
      unint64_t v25 = (void (*)(uint64_t))(*(void *)(v0 + 56) + **(int **)(v0 + 56));
      uint64_t v22 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v22;
      *uint64_t v22 = v0;
      v22[1] = sub_24CCDA384;
      v25(v21);
      return;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t i = sub_24CCDAFB0(0, i[2] + 1, 1, i);
    }
    unint64_t v17 = i[2];
    unint64_t v16 = i[3];
    if (v17 >= v16 >> 1) {
      unint64_t i = sub_24CCDAFB0((void *)(v16 > 1), v17 + 1, 1, i);
    }
    i[2] = v17 + 1;
  }
  swift_release();
  if (i[2])
  {
    int64_t v18 = *(os_unfair_lock_s **)(v0 + 72);
    uint64_t v19 = v18 + 6;
    uint64_t v20 = (uint64_t)&v18[4];
    *(void *)(swift_task_alloc() + 16) = i;
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v19);
    sub_24CCDBAEC(v20);
    os_unfair_lock_unlock(v19);
    if (v24) {
      return;
    }
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v23 = *(void (**)(void))(v0 + 8);
  v23();
}

uint64_t sub_24CCDA860()
{
  uint64_t v1 = v0[11];
  swift_unknownObjectRelease();
  sub_24CCDB0C0((uint64_t)(v0 + 6));
  swift_release();
  if (*(void *)(v1 + 16))
  {
    unint64_t v3 = (os_unfair_lock_s *)v0[9];
    int64_t v4 = v3 + 6;
    uint64_t v5 = (uint64_t)&v3[4];
    uint64_t v2 = v0[11];
    *(void *)(swift_task_alloc() + 16) = v2;
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v4);
    sub_24CCDBAEC(v5);
    os_unfair_lock_unlock(v4);
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  unint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24CCDA974(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    int64_t v4 = (uint64_t *)result;
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v2; ++i)
    {
      unint64_t v6 = sub_24CCDE19C(*(void *)(a2 + 8 * i + 32));
      char v8 = v7;
      if (v7)
      {
        unint64_t v9 = v6;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v11 = *v4;
        uint64_t v14 = *v4;
        *int64_t v4 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_24CCDF140();
          uint64_t v11 = v14;
        }
        sub_24CCDAAA8(*(void *)(v11 + 56) + 8 * v9, (uint64_t)&v12);
        sub_24CCDB324(v9, v11);
        *int64_t v4 = v11;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v12 = 0;
      }
      BOOL v13 = (v8 & 1) == 0;
      sub_24CCDBA74((uint64_t)&v12, (uint64_t *)&unk_269824E70);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24CCDAA8C(uint64_t a1)
{
  return sub_24CCDA974(a1, *(void *)(v1 + 16));
}

uint64_t sub_24CCDAAA8(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0608](a2, a1);
}

void ObserversTable.Iterator.next()()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  if ((unint64_t)*v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24CCEC660();
    swift_bridgeObjectRelease();
    if (v1 >= v3) {
      return;
    }
  }
  else if (v1 >= *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return;
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2533109F0](v1, v2);
    goto LABEL_7;
  }
  if (v1 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v1 < *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_unknownObjectRetain();
LABEL_7:
    v0[1] = v1 + 1;
    return;
  }
  __break(1u);
}

void sub_24CCDAB78(void *a1@<X8>)
{
  ObserversTable.Iterator.next()();
  *a1 = v2;
}

DeviceSharingServices::ObserversTable::Iterator __swiftcall ObserversTable.makeIterator()()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1 + 6;
  os_unfair_lock_lock(v3);
  sub_24CCDAC08(&v7);
  os_unfair_lock_unlock(v3);
  void *v2 = v7;
  v2[1] = 0;
  result.currentIndex = v5;
  result.observers._rawValue = v4;
  return result;
}

uint64_t sub_24CCDAC08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_24CCDAC58(v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_24CCDAC58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v16 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v23 = MEMORY[0x263F8EE78];
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & v2;
  int64_t v17 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (v5)
  {
    unint64_t v8 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    unint64_t v9 = v8 | (v7 << 6);
LABEL_23:
    uint64_t v13 = 8 * v9;
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + v13);
    sub_24CCD9F20(*(void *)(a1 + 56) + v13, (uint64_t)&v22);
    uint64_t v21 = v14;
    sub_24CCDB924((uint64_t)&v21, (uint64_t)&v19, &qword_269824E60);
    sub_24CCD9F20((uint64_t)&v20, (uint64_t)&v18);
    uint64_t v15 = MEMORY[0x253311510](&v18);
    sub_24CCDB0C0((uint64_t)&v18);
    uint64_t result = sub_24CCDBA74((uint64_t)&v19, &qword_269824E60);
    if (v15)
    {
      MEMORY[0x253310870](result);
      if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24CCEC470();
      }
      sub_24CCEC490();
      uint64_t result = sub_24CCEC460();
    }
  }
  int64_t v10 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v10 >= v17) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void *)(v16 + 8 * v10);
  ++v7;
  if (v11) {
    goto LABEL_22;
  }
  int64_t v7 = v10 + 1;
  if (v10 + 1 >= v17) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void *)(v16 + 8 * v7);
  if (v11) {
    goto LABEL_22;
  }
  int64_t v7 = v10 + 2;
  if (v10 + 2 >= v17) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void *)(v16 + 8 * v7);
  if (v11) {
    goto LABEL_22;
  }
  int64_t v7 = v10 + 3;
  if (v10 + 3 >= v17) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void *)(v16 + 8 * v7);
  if (v11)
  {
LABEL_22:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v7 << 6);
    goto LABEL_23;
  }
  int64_t v12 = v10 + 4;
  if (v12 >= v17)
  {
LABEL_27:
    swift_release();
    return v23;
  }
  unint64_t v11 = *(void *)(v16 + 8 * v12);
  if (v11)
  {
    int64_t v7 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v7 >= v17) {
      goto LABEL_27;
    }
    unint64_t v11 = *(void *)(v16 + 8 * v7);
    ++v12;
    if (v11) {
      goto LABEL_22;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_24CCDAEC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  os_unfair_lock_lock(*v1 + 6);
  sub_24CCDAC08(&v6);
  os_unfair_lock_unlock(v3 + 6);
  uint64_t v4 = v6;
  uint64_t result = swift_release();
  *a1 = v4;
  a1[1] = 0;
  return result;
}

uint64_t sub_24CCDAF3C()
{
  return 0;
}

uint64_t sub_24CCDAF44()
{
  return 2;
}

uint64_t sub_24CCDAF4C()
{
  uint64_t v1 = sub_24CCDB4E4(*v0);
  swift_release();
  return v1;
}

uint64_t sub_24CCDAF84(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_24CCDB750(a1, a2, a3, *v3);
}

uint64_t sub_24CCDAF8C()
{
  return sub_24CCEC3C0();
}

void *sub_24CCDAFB0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269824E68);
      int64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_24CCDB988(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CCDB0C0(uint64_t a1)
{
  return a1;
}

unint64_t sub_24CCDB0EC()
{
  unint64_t result = qword_269824E50;
  if (!qword_269824E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824E50);
  }
  return result;
}

ValueMetadata *type metadata accessor for ObserversTable()
{
  return &type metadata for ObserversTable;
}

void *initializeBufferWithCopyOfBuffer for ObserversTable.Iterator(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ObserversTable.Iterator()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ObserversTable.Iterator(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ObserversTable.Iterator(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ObserversTable.Iterator(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ObserversTable.Iterator(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ObserversTable.Iterator()
{
  return &type metadata for ObserversTable.Iterator;
}

uint64_t initializeWithCopy for ObserversTable.Observation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA05E0](a1, a2);
}

uint64_t assignWithCopy for ObserversTable.Observation()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t initializeWithTake for ObserversTable.Observation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0608](a1, a2);
}

uint64_t assignWithTake for ObserversTable.Observation()
{
  return MEMORY[0x270FA0600]();
}

uint64_t getEnumTagSinglePayload for ObserversTable.Observation(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ObserversTable.Observation(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ObserversTable.Observation()
{
  return &type metadata for ObserversTable.Observation;
}

unint64_t sub_24CCDB324(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    __n128 result = sub_24CCEC540();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        int64_t v10 = (void *)(v9 + 8 * v6);
        __n128 result = sub_24CCEC840();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11) {
            goto LABEL_6;
          }
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        uint64_t v14 = (void *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          *uint64_t v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        __n128 result = v15 + 8 * v3;
        if (v3 < (uint64_t)v6 || result >= v15 + 8 * v6 + 8)
        {
          __n128 result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          BOOL v16 = v3 == v6;
          int64_t v3 = v6;
          if (v16) {
            goto LABEL_6;
          }
          __n128 result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *int64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24CCDB4E4(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1 + 6;
  swift_retain();
  os_unfair_lock_lock(v1);
  sub_24CCDAC08((uint64_t *)&v29);
  os_unfair_lock_unlock(v1);
  unint64_t v2 = v29;
  swift_release();
  if (v2 >> 62) {
    goto LABEL_31;
  }
  uint64_t v28 = v2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_33;
  }
  while (2)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = (void *)MEMORY[0x263F8EE78];
    if (v3 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v3;
    }
    unint64_t v8 = (uint64_t *)(MEMORY[0x263F8EE78] + 32);
    uint64_t v27 = v7;
    while ((v2 & 0xC000000000000001) != 0)
    {
      uint64_t v9 = MEMORY[0x2533109F0](v5, v2);
      if (!v4) {
        goto LABEL_14;
      }
LABEL_9:
      BOOL v10 = __OFSUB__(v4--, 1);
      if (v10) {
        goto LABEL_28;
      }
LABEL_26:
      ++v5;
      *v8++ = v9;
      if (v7 == v5) {
        goto LABEL_34;
      }
    }
    if (v5 >= *(void *)(v28 + 16)) {
      goto LABEL_29;
    }
    uint64_t v9 = *(void *)(v2 + 8 * v5 + 32);
    swift_unknownObjectRetain();
    if (v4) {
      goto LABEL_9;
    }
LABEL_14:
    unint64_t v11 = v6[3];
    if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0) {
      goto LABEL_30;
    }
    int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
    if (v12 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824E58);
    uint64_t v14 = (void *)swift_allocObject();
    int64_t v15 = _swift_stdlib_malloc_size(v14);
    uint64_t v16 = v15 - 32;
    if (v15 < 32) {
      uint64_t v16 = v15 - 25;
    }
    uint64_t v17 = v16 >> 3;
    v14[2] = v13;
    v14[3] = (2 * (v16 >> 3)) | 1;
    unint64_t v18 = (unint64_t)(v14 + 4);
    uint64_t v19 = v6[3] >> 1;
    if (v6[2])
    {
      uint64_t v20 = v6 + 4;
      if (v14 != v6 || v18 >= (unint64_t)v20 + 8 * v19) {
        memmove(v14 + 4, v20, 8 * v19);
      }
      v6[2] = 0;
    }
    unint64_t v8 = (uint64_t *)(v18 + 8 * v19);
    uint64_t v21 = (v17 & 0x7FFFFFFFFFFFFFFFLL) - v19;
    swift_release();
    unint64_t v6 = v14;
    uint64_t v7 = v27;
    BOOL v10 = __OFSUB__(v21, 1);
    uint64_t v4 = v21 - 1;
    if (!v10) {
      goto LABEL_26;
    }
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    uint64_t v28 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_24CCEC660();
    swift_bridgeObjectRelease();
    if (v22 >= 1)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_24CCEC660();
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
LABEL_33:
  uint64_t v4 = 0;
  unint64_t v6 = (void *)MEMORY[0x263F8EE78];
LABEL_34:
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v24 = v6[3];
  if (v24 < 2) {
    return (uint64_t)v6;
  }
  unint64_t v25 = v24 >> 1;
  BOOL v10 = __OFSUB__(v25, v4);
  uint64_t v26 = v25 - v4;
  if (!v10)
  {
    v6[2] = v26;
    return (uint64_t)v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CCDB750(unint64_t *a1, uint64_t *a2, uint64_t a3, os_unfair_lock_s *a4)
{
  unint64_t v8 = a4 + 6;
  os_unfair_lock_lock(a4 + 6);
  sub_24CCDAC08((uint64_t *)&v18);
  os_unfair_lock_unlock(v8);
  unint64_t v9 = v18;
  uint64_t result = swift_release();
  if (!a2) {
    goto LABEL_28;
  }
  if (!a3)
  {
LABEL_29:
    *a1 = v9;
    a1[1] = a3;
    return a3;
  }
  if (a3 < 0) {
    goto LABEL_26;
  }
  unint64_t v4 = v9 >> 62;
  if (v9 >> 62) {
    goto LABEL_27;
  }
  if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
  {
LABEL_28:
    a3 = 0;
    goto LABEL_29;
  }
  while (1)
  {
    if ((v9 & 0xC000000000000001) != 0)
    {
      uint64_t v11 = MEMORY[0x2533109F0](0, v9);
      goto LABEL_9;
    }
    if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      break;
    }
    uint64_t v11 = swift_unknownObjectRetain();
LABEL_9:
    *a2 = v11;
    uint64_t v12 = a3 - 1;
    if (a3 == 1) {
      goto LABEL_29;
    }
    if (v4)
    {
      unint64_t v4 = v9 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_24CCEC660();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v4 = v9 & 0xFFFFFFFFFFFFFF8;
      uint64_t v13 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v14 = 0;
    if (v13 <= 1) {
      uint64_t v13 = 1;
    }
    ++a2;
    while (v12 != v14)
    {
      if (v13 - 1 == v14)
      {
        a3 = v13;
        goto LABEL_29;
      }
      unint64_t v16 = v14 + 1;
      if ((v9 & 0xC000000000000001) != 0)
      {
        uint64_t v15 = MEMORY[0x2533109F0](v16, v9);
      }
      else
      {
        if (v16 >= *(void *)(v4 + 16)) {
          goto LABEL_25;
        }
        uint64_t v15 = swift_unknownObjectRetain();
      }
      a2[v14++] = v15;
      if (v12 == v14) {
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_24CCEC660();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17 < 1) {
      goto LABEL_28;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24CCDB924(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

char *sub_24CCDB988(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_24CCEC6A0();
  __break(1u);
  return result;
}

uint64_t sub_24CCDBA74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CCDBAD4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_24CCD9F00(a1, a2);
}

uint64_t sub_24CCDBAEC(uint64_t a1)
{
  return sub_24CCDAA8C(a1);
}

void sub_24CCDBB04(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = sub_24CCDBE3C(a1, a2, a3, a4);
  unint64_t v6 = v5;
  swift_bridgeObjectRetain();
  oslog = sub_24CCEC2D0();
  os_log_type_t v7 = sub_24CCEC500();
  if (os_log_type_enabled(oslog, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v11 = v9;
    *(_DWORD *)unint64_t v8 = 136446210;
    swift_bridgeObjectRetain();
    sub_24CCD1BE4(v4, v6, &v11);
    sub_24CCEC510();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CCCB000, oslog, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253311440](v9, -1, -1);
    MEMORY[0x253311440](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_24CCDBC90(uint64_t a1)
{
  return sub_24CCDBDC4(a1, qword_26982ACE0);
}

uint64_t sub_24CCDBCB4(uint64_t a1)
{
  return sub_24CCDBDC4(a1, qword_26982ACF8);
}

uint64_t sub_24CCDBCD8(uint64_t a1)
{
  return sub_24CCDBDC4(a1, qword_26982AD10);
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

uint64_t sub_24CCDBD68(uint64_t a1)
{
  return sub_24CCDBDC4(a1, qword_26982AD28);
}

uint64_t sub_24CCDBD90(uint64_t a1)
{
  return sub_24CCDBDC4(a1, qword_26982AD40);
}

uint64_t sub_24CCDBDAC(uint64_t a1)
{
  return sub_24CCDBDC4(a1, qword_26982AD58);
}

uint64_t sub_24CCDBDC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24CCEC2F0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24CCEC2E0();
}

uint64_t sub_24CCDBE3C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_24CCD5A8C();
  uint64_t v8 = sub_24CCEC530();
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
  sub_24CCDC0C4(46, 0xE100000000000000, a1, a2);
  uint64_t v11 = sub_24CCEC3B0();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  MEMORY[0x253310780](v11, v13, v15, v17);
  swift_bridgeObjectRelease();
  sub_24CCDC0C4(40, 0xE100000000000000, a3, a4);
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_24CCEC3B0();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  MEMORY[0x253310780](v18, v20, v22, v24);
  swift_bridgeObjectRelease();
  unint64_t v25 = pthread_self();
  pthread_mach_thread_np(v25);
  sub_24CCEC7C0();
  sub_24CCEC380();
  swift_bridgeObjectRelease();
  sub_24CCEC380();
  sub_24CCEC380();
  swift_bridgeObjectRelease();
  sub_24CCEC380();
  sub_24CCEC380();
  swift_bridgeObjectRelease();
  return 91;
}

unint64_t sub_24CCDC0C4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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
  while (sub_24CCEC3A0() != a1 || v9 != a2)
  {
    char v10 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_24CCEC370();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

void sub_24CCDC1B4(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  if (qword_269824A98 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24CCEC2F0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26982ACF8);
  unint64_t v5 = sub_24CCEC2D0();
  os_log_type_t v6 = sub_24CCEC500();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_24CCEC8D0();
    sub_24CCD1BE4(v9, v10, &v12);
    sub_24CCEC510();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    sub_24CCD1BE4(0xD000000000000022, 0x800000024CCF14A0, &v12);
    sub_24CCEC510();
    _os_log_impl(&dword_24CCCB000, v5, v6, "[%s] %s Remote Alert Deactivated.", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253311440](v8, -1, -1);
    MEMORY[0x253311440](v7, -1, -1);
  }

  uint64_t v11 = *(void (**)(uint64_t))(v2
                                       + OBJC_IVAR____TtC21DeviceSharingServicesP33_DCC69EBB8BA68A324D11B2F382DAF43C25RemoteAlertHandleObserver_onRemoteAlertHandleDidDeactivate);
  if (v11)
  {
    swift_retain();
    v11(a1);
    sub_24CCDE124((uint64_t)v11);
  }
  else
  {
    __break(1u);
  }
}

id sub_24CCDC48C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GuestUserHandoverSetupCoordinator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(unsigned char *)(v0 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824E90);
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 24) = 0;
  *(void *)(v1 + 16) = MEMORY[0x263F8EE80];
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 24) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for RemoteAlertHandleObserver()), sel_init);
  return v0;
}

uint64_t GuestUserHandoverSetupCoordinator.init()()
{
  *(unsigned char *)(v0 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824E90);
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 24) = 0;
  *(void *)(v1 + 16) = MEMORY[0x263F8EE80];
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 24) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for RemoteAlertHandleObserver()), sel_init);
  return v0;
}

uint64_t type metadata accessor for RemoteAlertHandleObserver()
{
  return self;
}

void sub_24CCDC61C()
{
  qword_269824E80 = 0x6769727465527369;
  *(void *)algn_269824E88 = 0xEB00000000726567;
}

uint64_t static GuestUserHandoverSetupCoordinator.Constants.isRetriggerKey.getter()
{
  if (qword_269824AC0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_269824E80;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t static GuestUserHandoverSetupCoordinator.Constants.requestConfigurationKey.getter()
{
  return 0xD000000000000014;
}

unint64_t static GuestUserHandoverSetupCoordinator.Constants.activationContextErrorKey.getter()
{
  return 0xD000000000000016;
}

BOOL static GuestUserHandoverSetupCoordinator.ProxCardCompletionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t GuestUserHandoverSetupCoordinator.ProxCardCompletionState.hash(into:)()
{
  return sub_24CCEC860();
}

uint64_t GuestUserHandoverSetupCoordinator.ProxCardCompletionState.hashValue.getter()
{
  return sub_24CCEC880();
}

uint64_t GuestUserHandoverSetupCoordinator.proxCardState.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 16);
  return result;
}

Swift::Void __swiftcall GuestUserHandoverSetupCoordinator.setProxCardState(state:)(DeviceSharingServices::GuestUserHandoverSetupCoordinator::ProxCardCompletionState state)
{
  char v2 = *(unsigned char *)state;
  swift_beginAccess();
  *(unsigned char *)(v1 + 16) = v2;
  if (qword_269824A98 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24CCEC2F0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26982ACF8);
  uint64_t v4 = sub_24CCEC2D0();
  os_log_type_t v5 = sub_24CCEC500();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_24CCCB000, v4, v5, "[ProxCardState] Changed state.", v6, 2u);
    MEMORY[0x253311440](v6, -1, -1);
  }
}

void GuestUserHandoverSetupCoordinator.present(requestConfiguration:isRetrigger:)(uint64_t *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v31 = *a1;
  swift_beginAccess();
  *(unsigned char *)(v2 + 16) = 0;
  if (qword_269824A98 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CCEC2F0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26982ACF8);
  sub_24CCDBB04(0xD0000000000000A1, 0x800000024CCF1270, 0xD00000000000002ALL, 0x800000024CCF1320);
  os_log_type_t v6 = sub_24CCEC2D0();
  os_log_type_t v7 = sub_24CCEC500();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(void *)&long long v33 = v9;
    *(_DWORD *)uint64_t v8 = 136315650;
    uint64_t v10 = sub_24CCEC8D0();
    sub_24CCD1BE4(v10, v11, (uint64_t *)&v33);
    sub_24CCEC510();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    DWORD1(v32[0]) = (unint64_t)sub_24CCD1BE4(0xD00000000000002ALL, 0x800000024CCF1320, (uint64_t *)&v33) >> 32;
    sub_24CCEC510();
    *(_WORD *)(v8 + 22) = 1024;
    LODWORD(v32[0]) = a2 & 1;
    sub_24CCEC510();
    _os_log_impl(&dword_24CCCB000, v6, v7, "[%s] %s isRetrigger: %{BOOL}d.", (uint8_t *)v8, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x253311440](v9, -1, -1);
    MEMORY[0x253311440](v8, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_269824E98);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CCEED10;
  if (qword_269824AC0 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void *)algn_269824E88;
  *(void *)(inited + 32) = qword_269824E80;
  *(void *)(inited + 40) = v13;
  *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = a2 & 1;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_24CCDCE38(inited);
  *(void *)&long long v33 = v31;
  sub_24CCD4878();
  sub_24CCDE074();
  sub_24CCDE0C8();
  uint64_t v15 = sub_24CCEC2B0();
  unint64_t v17 = v16;
  uint64_t v34 = MEMORY[0x263F06F78];
  *(void *)&long long v33 = v15;
  *((void *)&v33 + 1) = v16;
  sub_24CCDE134(&v33, v32);
  sub_24CCDE144(v15, v17);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_24CCDE998(v32, 0xD000000000000014, 0x800000024CCF1230, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_24CCDEAEC(v15, v17);
  uint64_t v19 = (void *)sub_24CCEC310();
  id v20 = objc_msgSend(self, sel_identityForApplicationJobLabel_, v19);

  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F79410]), sel_initWithSceneProvidingProcess_configurationIdentifier_, v20, 0);
  id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F79408]), sel_init);
  sub_24CCDD0B4(v14);
  swift_bridgeObjectRelease();
  uint64_t v23 = (void *)sub_24CCEC300();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setUserInfo_, v23);

  id v24 = objc_msgSend(self, sel_newHandleWithDefinition_configurationContext_, v21, v22);
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F793F8]), sel_init);
  objc_msgSend(v24, sel_activateWithContext_, v25);
  uint64_t v26 = *(void *)(v3 + 24);
  uint64_t v27 = *(void **)(v26
                 + OBJC_IVAR____TtC21DeviceSharingServicesP33_DCC69EBB8BA68A324D11B2F382DAF43C25RemoteAlertHandleObserver_remoteAlertHandle);
  *(void *)(v26
            + OBJC_IVAR____TtC21DeviceSharingServicesP33_DCC69EBB8BA68A324D11B2F382DAF43C25RemoteAlertHandleObserver_remoteAlertHandle) = v24;
  swift_retain();

  uint64_t v28 = (void (**)(uint64_t))(v26
                                      + OBJC_IVAR____TtC21DeviceSharingServicesP33_DCC69EBB8BA68A324D11B2F382DAF43C25RemoteAlertHandleObserver_onRemoteAlertHandleDidDeactivate);
  uint64_t v29 = *(void *)(v26
                  + OBJC_IVAR____TtC21DeviceSharingServicesP33_DCC69EBB8BA68A324D11B2F382DAF43C25RemoteAlertHandleObserver_onRemoteAlertHandleDidDeactivate);
  *uint64_t v28 = sub_24CCDE11C;
  v28[1] = (void (*)(uint64_t))v3;
  id v30 = v24;
  sub_24CCDE124(v29);
  objc_msgSend(v30, sel_registerObserver_, v26);
}

unint64_t sub_24CCDCE38(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824F80);
  uint64_t v2 = sub_24CCEC690();
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
    sub_24CCDF4F0(v6, (uint64_t)&v15, &qword_269824F88);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24CCDE224(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24CCDE134(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_24CCDCF70(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824F70);
  uint64_t v2 = sub_24CCEC690();
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
    sub_24CCDF4F0(v6, (uint64_t)v15, &qword_269824F78);
    unint64_t result = sub_24CCDE1E0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_24CCDE134(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

uint64_t sub_24CCDD0B4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824F70);
    uint64_t v2 = sub_24CCEC690();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
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
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_24CCD2360(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_24CCDE134(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_24CCDE134(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_24CCDE134(v36, v37);
    sub_24CCDE134(v37, &v33);
    uint64_t result = sub_24CCEC550();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_24CCDE134(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_24CCDF4E8();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
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
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_24CCDD47C(uint64_t a1, uint64_t a2)
{
  if (qword_269824A98 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24CCEC2F0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26982ACF8);
  uint64_t v4 = sub_24CCEC2D0();
  os_log_type_t v5 = sub_24CCEC500();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_24CCCB000, v4, v5, "Remote Alert Handle did deactivate handler.", v6, 2u);
    MEMORY[0x253311440](v6, -1, -1);
  }

  sub_24CCDBB04(0xD0000000000000A1, 0x800000024CCF1270, 0xD000000000000013, 0x800000024CCF14D0);
  uint64_t v7 = *(os_unfair_lock_s **)(a2 + 32);
  sub_24CCD9814(&v7);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> GuestUserHandoverSetupCoordinator.update(with:)(DeviceSharingServices::GuestUserAccessError with)
{
  if (qword_269824A98 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CCEC2F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26982ACF8);
  sub_24CCDBB04(0xD0000000000000A1, 0x800000024CCF1270, 0x7728657461647075, 0xED0000293A687469);
  uint64_t v3 = (void *)sub_24CCEC310();
  id v4 = objc_msgSend(self, sel_identityForApplicationJobLabel_, v3);

  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F79410]), sel_initWithSceneProvidingProcess_configurationIdentifier_, v4, 0);
  id v6 = objc_msgSend(self, sel_lookupHandlesForDefinition_, v5);
  sub_24CCDEB44();
  unint64_t v7 = sub_24CCEC450();

  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F793F8]), sel_init);
  sub_24CCD4824();
  sub_24CCD6E0C();
  sub_24CCD689C();
  uint64_t v9 = sub_24CCEC2B0();
  if (v1)
  {

    swift_bridgeObjectRelease();
LABEL_15:

    return;
  }
  uint64_t v11 = v9;
  unint64_t v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824EE8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CCEED10;
  unint64_t v20 = 0xD000000000000016;
  unint64_t v21 = 0x800000024CCF1250;
  sub_24CCEC570();
  *(void *)(inited + 96) = MEMORY[0x263F06F78];
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = v12;
  sub_24CCDE144(v11, v12);
  sub_24CCDCF70(inited);
  unint64_t v14 = (void *)sub_24CCEC300();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setUserInfo_, v14);

  uint64_t v19 = v11;
  if (!(v7 >> 62))
  {
    uint64_t v15 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v15) {
      goto LABEL_7;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    sub_24CCDEAEC(v19, v12);

    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_24CCEC660();
  swift_bridgeObjectRelease();
  if (!v15) {
    goto LABEL_14;
  }
LABEL_7:
  if (v15 >= 1)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if ((v7 & 0xC000000000000001) != 0) {
        id v17 = (id)MEMORY[0x2533109F0](i, v7);
      }
      else {
        id v17 = *(id *)(v7 + 8 * i + 32);
      }
      uint64_t v18 = v17;
      objc_msgSend(v17, sel_activateWithContext_, v8, v19, v20, v21);
    }
    goto LABEL_14;
  }
  __break(1u);
}

Swift::Void __swiftcall GuestUserHandoverSetupCoordinator.invalidate()()
{
  if (qword_269824A98 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CCEC2F0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26982ACF8);
  sub_24CCDBB04(0xD0000000000000A1, 0x800000024CCF1270, 0x6164696C61766E69, 0xEC00000029286574);
  uint64_t v1 = (void *)sub_24CCEC310();
  id v2 = objc_msgSend(self, sel_identityForApplicationJobLabel_, v1);

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F79410]), sel_initWithSceneProvidingProcess_configurationIdentifier_, v2, 0);
  unint64_t v21 = v3;
  id v4 = objc_msgSend(self, sel_lookupHandlesForDefinition_, v3);
  sub_24CCDEB44();
  unint64_t v5 = sub_24CCEC450();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24CCEC660();
    swift_bridgeObjectRelease();
    if (!v6) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v6) {
      goto LABEL_15;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v7 = 0;
  unint64_t v8 = v5 & 0xC000000000000001;
  uint64_t v9 = &selRef_setHasSeenGuestSafetyNotice_;
  uint64_t v22 = v6;
  do
  {
    if (v8) {
      id v11 = (id)MEMORY[0x2533109F0](v7, v5);
    }
    else {
      id v11 = *(id *)(v5 + 8 * v7 + 32);
    }
    unint64_t v12 = v11;
    unint64_t v10 = sub_24CCEC2D0();
    os_log_type_t v13 = sub_24CCEC500();
    if (os_log_type_enabled(v10, v13))
    {
      unint64_t v14 = v5;
      uint64_t v15 = v9;
      uint64_t v16 = swift_slowAlloc();
      unint64_t v17 = v8;
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      *(void *)(v16 + 4) = v12;
      *uint64_t v18 = v12;
      _os_log_impl(&dword_24CCCB000, v10, v13, "Invalidating alert handler: %@", (uint8_t *)v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269824EF0);
      swift_arrayDestroy();
      uint64_t v19 = v18;
      unint64_t v8 = v17;
      MEMORY[0x253311440](v19, -1, -1);
      uint64_t v20 = v16;
      uint64_t v9 = v15;
      unint64_t v5 = v14;
      uint64_t v6 = v22;
      MEMORY[0x253311440](v20, -1, -1);
    }
    else
    {

      unint64_t v10 = v12;
    }
    ++v7;

    [v12 v9[17]];
  }
  while (v6 != v7);
LABEL_15:

  swift_bridgeObjectRelease();
}

uint64_t GuestUserHandoverSetupCoordinator.addObserver(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24CCEC2F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269824A98 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_26982ACF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_unknownObjectRetain_n();
  id v11 = sub_24CCEC2D0();
  os_log_type_t v12 = sub_24CCEC500();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = v3;
    uint64_t v14 = v13;
    uint64_t v26 = swift_slowAlloc();
    v30[0] = v26;
    *(_DWORD *)uint64_t v14 = 136315650;
    uint64_t v25 = a2;
    uint64_t v15 = sub_24CCEC8D0();
    uint64_t v28 = sub_24CCD1BE4(v15, v16, v30);
    sub_24CCEC510();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v28 = sub_24CCD1BE4(0x726573624F646461, 0xEF293A5F28726576, v30);
    sub_24CCEC510();
    *(_WORD *)(v14 + 22) = 2080;
    uint64_t v28 = a1;
    uint64_t v29 = v25;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824EF8);
    uint64_t v17 = sub_24CCEC340();
    uint64_t v28 = sub_24CCD1BE4(v17, v18, v30);
    sub_24CCEC510();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CCCB000, v11, v12, "[%s] %s — %s", (uint8_t *)v14, 0x20u);
    uint64_t v19 = v26;
    swift_arrayDestroy();
    MEMORY[0x253311440](v19, -1, -1);
    uint64_t v20 = v14;
    uint64_t v3 = v27;
    MEMORY[0x253311440](v20, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v22 = *(os_unfair_lock_s **)(v3 + 32);
  MEMORY[0x270FA5388](v21);
  *(&v24 - 2) = a1;
  swift_retain();
  os_unfair_lock_lock(v22 + 6);
  sub_24CCDEB84((uint64_t)&v22[4]);
  os_unfair_lock_unlock(v22 + 6);
  return swift_release();
}

uint64_t GuestUserHandoverSetupCoordinator.deinit()
{
  swift_release();
  return v0;
}

uint64_t GuestUserHandoverSetupCoordinator.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

unint64_t sub_24CCDE074()
{
  unint64_t result = qword_269824EA8;
  if (!qword_269824EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824EA8);
  }
  return result;
}

unint64_t sub_24CCDE0C8()
{
  unint64_t result = qword_269824EB0;
  if (!qword_269824EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824EB0);
  }
  return result;
}

void sub_24CCDE11C(uint64_t a1)
{
  sub_24CCDD47C(a1, v1);
}

uint64_t sub_24CCDE124(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

_OWORD *sub_24CCDE134(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24CCDE144(uint64_t a1, unint64_t a2)
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

unint64_t sub_24CCDE19C(uint64_t a1)
{
  uint64_t v2 = sub_24CCEC840();
  return sub_24CCDEE48(a1, v2);
}

unint64_t sub_24CCDE1E0(uint64_t a1)
{
  uint64_t v2 = sub_24CCEC550();
  return sub_24CCDEEE4(a1, v2);
}

unint64_t sub_24CCDE224(uint64_t a1, uint64_t a2)
{
  sub_24CCEC850();
  sub_24CCEC360();
  uint64_t v4 = sub_24CCEC880();
  return sub_24CCDF05C(a1, a2, v4);
}

uint64_t sub_24CCDE29C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269824F90);
  uint64_t result = sub_24CCEC680();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    long long v33 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
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
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_34;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_34;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v33;
                goto LABEL_41;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v9 = -1 << v32;
              }
              uint64_t v3 = v33;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_43;
                }
                if (v8 >= v13) {
                  goto LABEL_34;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(v5 + 56) + v22;
      if (a2) {
        sub_24CCDAAA8(v24, (uint64_t)v34);
      }
      else {
        sub_24CCD9F20(v24, (uint64_t)v34);
      }
      uint64_t result = sub_24CCEC840();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_42;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      uint64_t result = sub_24CCDAAA8((uint64_t)v34, *(void *)(v7 + 56) + v16);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_24CCDE568(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824F80);
  uint64_t v6 = sub_24CCEC680();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v34 = (void *)(v5 + 64);
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
                  *long long v34 = -1 << v32;
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
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_24CCDE134(v24, v35);
      }
      else
      {
        sub_24CCD2360((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_24CCEC850();
      sub_24CCEC360();
      uint64_t result = sub_24CCEC880();
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
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_24CCDE134(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_24CCDE868(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_24CCDE19C(a2);
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
      sub_24CCDF140();
      goto LABEL_7;
    }
    sub_24CCDE29C(v13, a3 & 1);
    unint64_t v19 = sub_24CCDE19C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24CCEC7F0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7] + 8 * v10;
    return sub_24CCDF554(a1, v17);
  }
LABEL_13:
  return sub_24CCDED70(v10, a2, a1, v16);
}

_OWORD *sub_24CCDE998(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24CCDE224(a2, a3);
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
      sub_24CCDF300();
      goto LABEL_7;
    }
    sub_24CCDE568(v15, a4 & 1);
    unint64_t v21 = sub_24CCDE224(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_24CCEC7F0();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_24CCDE134(a1, v19);
  }
LABEL_13:
  sub_24CCDEDDC(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_24CCDEAEC(uint64_t a1, unint64_t a2)
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

unint64_t sub_24CCDEB44()
{
  unint64_t result = qword_269824EC8;
  if (!qword_269824EC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269824EC8);
  }
  return result;
}

uint64_t sub_24CCDEB84(uint64_t a1)
{
  return sub_24CCD946C(a1, *(void *)(v1 + 16));
}

unint64_t sub_24CCDEBA4()
{
  unint64_t result = qword_269824F00;
  if (!qword_269824F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269824F00);
  }
  return result;
}

uint64_t dispatch thunk of GuestUserHandoverSetupCoordinatorObserver.shouldSendGuestUserModeResponse(response:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for GuestUserHandoverSetupCoordinator()
{
  return self;
}

uint64_t method lookup function for GuestUserHandoverSetupCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GuestUserHandoverSetupCoordinator);
}

uint64_t dispatch thunk of GuestUserHandoverSetupCoordinator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for GuestUserHandoverSetupCoordinator.Constants()
{
  return &type metadata for GuestUserHandoverSetupCoordinator.Constants;
}

unsigned char *storeEnumTagSinglePayload for GuestUserHandoverSetupCoordinator.ProxCardCompletionState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCDED38);
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

ValueMetadata *type metadata accessor for GuestUserHandoverSetupCoordinator.ProxCardCompletionState()
{
  return &type metadata for GuestUserHandoverSetupCoordinator.ProxCardCompletionState;
}

uint64_t sub_24CCDED70(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_24CCDAAA8(a3, a4[7] + 8 * a1);
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

_OWORD *sub_24CCDEDDC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_24CCDE134(a4, (_OWORD *)(a5[7] + 32 * a1));
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

unint64_t sub_24CCDEE48(uint64_t a1, uint64_t a2)
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

unint64_t sub_24CCDEEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24CCDEFAC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x253310990](v9, a1);
      sub_24CCDF008((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_24CCDEFAC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24CCDF008(uint64_t a1)
{
  return a1;
}

unint64_t sub_24CCDF05C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24CCEC7D0() & 1) == 0)
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
      while (!v14 && (sub_24CCEC7D0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_24CCDF140()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269824F90);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CCEC670();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    sub_24CCD9F20(*(void *)(v2 + 56) + 8 * v15, (uint64_t)v21);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    unint64_t result = (void *)sub_24CCDAAA8((uint64_t)v21, *(void *)(v4 + 56) + v16);
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

void *sub_24CCDF300()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824F80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CCEC670();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
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
    sub_24CCD2360(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_24CCDE134(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

uint64_t sub_24CCDF4E8()
{
  return swift_release();
}

uint64_t sub_24CCDF4F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CCDF554(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24CCDF5B0()
{
  v16[3] = *MEMORY[0x263EF8340];
  swift_getObjectType();
  responseFlags[0] = 0;
  if (qword_269824AB0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CCEC2F0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26982AD40);
  uint64_t v2 = sub_24CCEC2D0();
  os_log_type_t v3 = sub_24CCEC500();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    v16[0] = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = sub_24CCEC8D0();
    responseFlags[1] = sub_24CCD1BE4(v6, v7, v16);
    sub_24CCEC510();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2048;
    swift_beginAccess();
    sub_24CCEC510();
    _os_log_impl(&dword_24CCCB000, v2, v3, "[%s] Waiting for response for notification: %lu", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253311440](v5, -1, -1);
    MEMORY[0x253311440](v4, -1, -1);
  }

  swift_beginAccess();
  CFUserNotificationReceiveResponse(v0, 0.0, responseFlags);
  swift_endAccess();
  uint64_t v8 = sub_24CCEC2D0();
  os_log_type_t v9 = sub_24CCEC500();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v16[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v12 = sub_24CCEC8D0();
    sub_24CCD1BE4(v12, v13, v16);
    sub_24CCEC510();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2048;
    sub_24CCEC510();
    _os_log_impl(&dword_24CCCB000, v8, v9, "[%s] Received response for notification: %lu", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253311440](v11, -1, -1);
    MEMORY[0x253311440](v10, -1, -1);
  }

  return responseFlags[0] & 3;
}

uint64_t CFUserNotificationRef.userResponse()()
{
  *(void *)(v1 + 24) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269825008);
  *(void *)(v1 + 32) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCDF994, 0, 0);
}

uint64_t sub_24CCDF994()
{
  uint64_t v2 = (void *)v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = sub_24CCEC4C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 1, 1, v3);
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v2;
  id v5 = v2;
  uint64_t v6 = sub_24CCDFEA8(v1, (uint64_t)&unk_269825018, (uint64_t)v4);
  v0[5] = v6;
  unint64_t v7 = (void *)swift_task_alloc();
  v0[6] = v7;
  *unint64_t v7 = v0;
  v7[1] = sub_24CCDFAD4;
  uint64_t v8 = MEMORY[0x263F8D9D0];
  return MEMORY[0x270FA1FD0](v0 + 2, v6, v8);
}

uint64_t sub_24CCDFAD4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CCDFBD0, 0, 0);
}

uint64_t sub_24CCDFBD0()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24CCDFC40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_24CCDFC60, 0, 0);
}

uint64_t sub_24CCDFC60()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  uint64_t *v1 = sub_24CCDF5B0();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24CCDFCC4()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CCDFD04(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_24CCDFDB4;
  return MEMORY[0x270FA2498](sub_24CCDFC60, 0, 0);
}

uint64_t sub_24CCDFDB4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CCDFEA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CCEC4C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CCEC4B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CCE0048(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CCEC4A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24CCE0048(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825008);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CCE00A8(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  id v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  void *v3 = v2;
  v3[1] = sub_24CCE0188;
  return v5(v2 + 16);
}

uint64_t sub_24CCE0188()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  void *v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24CCE02B8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CCE02F0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24CCDFDB4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269825020 + dword_269825020);
  return v6(a1, v4);
}

uint64_t NotificationPayload.init(notificationType:destination:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v3 = *(unsigned char *)(result + 8);
  char v4 = *a2;
  *(void *)a3 = *(void *)result;
  *(unsigned char *)(a3 + 8) = v3;
  *(unsigned char *)(a3 + 9) = v4;
  return result;
}

unint64_t sub_24CCE03C4()
{
  if (*v0) {
    return 0xD00000000000001CLL;
  }
  else {
    return 0xD000000000000018;
  }
}

uint64_t sub_24CCE0404@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCE22FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CCE042C(uint64_t a1)
{
  unint64_t v2 = sub_24CCE08D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCE0468(uint64_t a1)
{
  unint64_t v2 = sub_24CCE08D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CCE04A4(uint64_t a1)
{
  unint64_t v2 = sub_24CCE097C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCE04E0(uint64_t a1)
{
  unint64_t v2 = sub_24CCE097C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CCE051C(uint64_t a1)
{
  unint64_t v2 = sub_24CCE0928();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCE0558(uint64_t a1)
{
  unint64_t v2 = sub_24CCE0928();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NotificationType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825030);
  uint64_t v18 = *(void *)(v3 - 8);
  uint64_t v19 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825038);
  uint64_t v20 = *(void *)(v6 - 8);
  uint64_t v21 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825040);
  uint64_t v9 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *v1;
  char v12 = *((unsigned char *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCE08D4();
  sub_24CCEC8A0();
  if (v12)
  {
    char v25 = 1;
    sub_24CCE0928();
    uint64_t v13 = v22;
    sub_24CCEC740();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v13);
  }
  else
  {
    char v24 = 0;
    sub_24CCE097C();
    uint64_t v15 = v22;
    sub_24CCEC740();
    uint64_t v23 = v17;
    type metadata accessor for DSSGuestUserModeUnavailableReason(0);
    sub_24CCE24E8(&qword_269825060, type metadata accessor for DSSGuestUserModeUnavailableReason);
    uint64_t v16 = v21;
    sub_24CCEC790();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v15);
  }
}

unint64_t sub_24CCE08D4()
{
  unint64_t result = qword_269825048;
  if (!qword_269825048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825048);
  }
  return result;
}

unint64_t sub_24CCE0928()
{
  unint64_t result = qword_269825050;
  if (!qword_269825050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825050);
  }
  return result;
}

unint64_t sub_24CCE097C()
{
  unint64_t result = qword_269825058;
  if (!qword_269825058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825058);
  }
  return result;
}

uint64_t NotificationType.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t v27 = a2;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825068);
  uint64_t v28 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825070);
  uint64_t v26 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825078);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  unint64_t v29 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_24CCE08D4();
  uint64_t v13 = v30;
  sub_24CCEC890();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  uint64_t v14 = v28;
  uint64_t v30 = v9;
  uint64_t v15 = sub_24CCEC730();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v18 = sub_24CCEC5E0();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824D28);
    *uint64_t v20 = &type metadata for NotificationType;
    sub_24CCEC6D0();
    sub_24CCEC5D0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCB0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  uint64_t v24 = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v33 = 1;
    sub_24CCE0928();
    sub_24CCEC6C0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
    uint64_t v17 = 0;
  }
  else
  {
    char v32 = 0;
    sub_24CCE097C();
    sub_24CCEC6C0();
    type metadata accessor for DSSGuestUserModeUnavailableReason(0);
    sub_24CCE24E8(&qword_269825080, type metadata accessor for DSSGuestUserModeUnavailableReason);
    sub_24CCEC720();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
    uint64_t v17 = v31;
  }
  uint64_t v22 = (uint64_t)v29;
  uint64_t v23 = v27;
  *unint64_t v27 = v17;
  *((unsigned char *)v23 + 8) = v16;
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t sub_24CCE0EA4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return NotificationType.init(from:)(a1, a2);
}

uint64_t sub_24CCE0EBC(void *a1)
{
  return NotificationType.encode(to:)(a1);
}

uint64_t sub_24CCE0ED4()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCE0F28()
{
  return sub_24CCEC2C0();
}

DeviceSharingServices::NotificationDestination_optional __swiftcall NotificationDestination.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_24CCEC6B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t NotificationDestination.rawValue.getter()
{
  return *(void *)&aLocal_1[8 * *v0];
}

uint64_t sub_24CCE1024(char *a1, char *a2)
{
  return sub_24CCEB608(*a1, *a2);
}

uint64_t sub_24CCE1030()
{
  return sub_24CCEB708();
}

uint64_t sub_24CCE1038()
{
  return sub_24CCEB7E4();
}

uint64_t sub_24CCE1040()
{
  return sub_24CCEB8F4();
}

DeviceSharingServices::NotificationDestination_optional sub_24CCE1048(Swift::String *a1)
{
  return NotificationDestination.init(rawValue:)(*a1);
}

uint64_t sub_24CCE1054@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NotificationDestination.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CCE107C()
{
  return sub_24CCEC410();
}

uint64_t sub_24CCE10DC()
{
  return sub_24CCEC3E0();
}

void NotificationPayload.notificationType.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v2;
}

void NotificationPayload.destination.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 9);
}

uint64_t sub_24CCE114C(char a1)
{
  if (a1) {
    return 0x74616E6974736564;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_24CCE1190()
{
  return sub_24CCE114C(*v0);
}

uint64_t sub_24CCE1198@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCE23E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CCE11C0(uint64_t a1)
{
  unint64_t v2 = sub_24CCE13DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCE11FC(uint64_t a1)
{
  unint64_t v2 = sub_24CCE13DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NotificationPayload.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825088);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  char v8 = *((unsigned char *)v1 + 8);
  int v13 = *((unsigned __int8 *)v1 + 9);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCE13DC();
  sub_24CCEC8A0();
  v11[2] = v7;
  char v12 = v8;
  char v16 = 0;
  sub_24CCE1430();
  uint64_t v9 = v11[1];
  sub_24CCEC790();
  if (!v9)
  {
    char v15 = v13;
    char v14 = 1;
    sub_24CCE1484();
    sub_24CCEC790();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24CCE13DC()
{
  unint64_t result = qword_269825090;
  if (!qword_269825090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825090);
  }
  return result;
}

unint64_t sub_24CCE1430()
{
  unint64_t result = qword_269825098;
  if (!qword_269825098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825098);
  }
  return result;
}

unint64_t sub_24CCE1484()
{
  unint64_t result = qword_2698250A0;
  if (!qword_2698250A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250A0);
  }
  return result;
}

uint64_t NotificationPayload.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698250A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCE13DC();
  sub_24CCEC890();
  if (!v2)
  {
    char v17 = 0;
    sub_24CCE16B4();
    sub_24CCEC720();
    uint64_t v9 = v13;
    char v10 = v14;
    char v15 = 1;
    sub_24CCE1708();
    sub_24CCEC720();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v11 = v16;
    *(void *)a2 = v9;
    *(unsigned char *)(a2 + 8) = v10;
    *(unsigned char *)(a2 + 9) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24CCE16B4()
{
  unint64_t result = qword_2698250B0;
  if (!qword_2698250B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250B0);
  }
  return result;
}

unint64_t sub_24CCE1708()
{
  unint64_t result = qword_2698250B8;
  if (!qword_2698250B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250B8);
  }
  return result;
}

unint64_t sub_24CCE1760()
{
  unint64_t result = qword_2698250C0;
  if (!qword_2698250C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250C0);
  }
  return result;
}

uint64_t sub_24CCE17B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NotificationPayload.init(from:)(a1, a2);
}

uint64_t sub_24CCE17CC(void *a1)
{
  return NotificationPayload.encode(to:)(a1);
}

uint64_t sub_24CCE17E4()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCE1838()
{
  return sub_24CCEC2C0();
}

uint64_t sub_24CCE18B4()
{
  return sub_24CCEC420();
}

uint64_t sub_24CCE1944()
{
  return sub_24CCEC3F0();
}

uint64_t sub_24CCE19C4()
{
  return sub_24CCEC420();
}

uint64_t sub_24CCE1A54()
{
  return sub_24CCEC3F0();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for NotificationType(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NotificationType(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_24CCE1B38(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CCE1B54(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationType()
{
  return &type metadata for NotificationType;
}

unsigned char *storeEnumTagSinglePayload for NotificationDestination(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCE1C50);
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

ValueMetadata *type metadata accessor for NotificationDestination()
{
  return &type metadata for NotificationDestination;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for NotificationPayload(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 10)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 9);
  BOOL v4 = v3 >= 3;
  int v5 = v3 - 3;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for NotificationPayload(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 9) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationPayload()
{
  return &type metadata for NotificationPayload;
}

ValueMetadata *type metadata accessor for NotificationPayload.CodingKeys()
{
  return &type metadata for NotificationPayload.CodingKeys;
}

unsigned char *_s21DeviceSharingServices19NotificationPayloadV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCE1E18);
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

ValueMetadata *type metadata accessor for NotificationType.CodingKeys()
{
  return &type metadata for NotificationType.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for NotificationType.GuestUserModeUnavailableCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CCE1EECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationType.GuestUserModeUnavailableCodingKeys()
{
  return &type metadata for NotificationType.GuestUserModeUnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for NotificationType.UnableToPlayProtectedContentCodingKeys()
{
  return &type metadata for NotificationType.UnableToPlayProtectedContentCodingKeys;
}

unint64_t sub_24CCE1F38()
{
  unint64_t result = qword_2698250C8;
  if (!qword_2698250C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250C8);
  }
  return result;
}

unint64_t sub_24CCE1F90()
{
  unint64_t result = qword_2698250D0;
  if (!qword_2698250D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250D0);
  }
  return result;
}

unint64_t sub_24CCE1FE8()
{
  unint64_t result = qword_2698250D8;
  if (!qword_2698250D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250D8);
  }
  return result;
}

unint64_t sub_24CCE2040()
{
  unint64_t result = qword_2698250E0;
  if (!qword_2698250E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250E0);
  }
  return result;
}

unint64_t sub_24CCE2098()
{
  unint64_t result = qword_2698250E8;
  if (!qword_2698250E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250E8);
  }
  return result;
}

unint64_t sub_24CCE20F0()
{
  unint64_t result = qword_2698250F0;
  if (!qword_2698250F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250F0);
  }
  return result;
}

unint64_t sub_24CCE2148()
{
  unint64_t result = qword_2698250F8;
  if (!qword_2698250F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698250F8);
  }
  return result;
}

unint64_t sub_24CCE21A0()
{
  unint64_t result = qword_269825100;
  if (!qword_269825100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825100);
  }
  return result;
}

unint64_t sub_24CCE21F8()
{
  unint64_t result = qword_269825108;
  if (!qword_269825108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825108);
  }
  return result;
}

unint64_t sub_24CCE2250()
{
  unint64_t result = qword_269825110;
  if (!qword_269825110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825110);
  }
  return result;
}

unint64_t sub_24CCE22A8()
{
  unint64_t result = qword_269825118;
  if (!qword_269825118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825118);
  }
  return result;
}

uint64_t sub_24CCE22FC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000018 && a2 == 0x800000024CCF14F0 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000024CCF1510)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CCE23E8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024CCF1530 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616E6974736564 && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CCE24E8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24CCE2530()
{
  unint64_t result = qword_269825130;
  if (!qword_269825130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825130);
  }
  return result;
}

unint64_t sub_24CCE2584()
{
  unint64_t result = qword_269825138;
  if (!qword_269825138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825138);
  }
  return result;
}

unint64_t sub_24CCE25D8()
{
  unint64_t result = qword_269825140;
  if (!qword_269825140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825140);
  }
  return result;
}

uint64_t Application.localizedTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Application.bundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Application.isNativeVisionApp.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t Application.appIconImageData.getter()
{
  swift_getKeyPath();
  uint64_t v3 = v0;
  sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1F0();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 56);
  sub_24CCE2940(v1, *(void *)(v3 + 64));
  return v1;
}

uint64_t sub_24CCE2768@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1F0();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 56);
  unint64_t v5 = *(void *)(v3 + 64);
  *a2 = v4;
  a2[1] = v5;
  return sub_24CCE2940(v4, v5);
}

uint64_t sub_24CCE282C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  swift_getKeyPath();
  sub_24CCE2940(v1, v2);
  sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1E0();
  sub_24CCE2AD8(v1, v2);
  return swift_release();
}

uint64_t type metadata accessor for Application(uint64_t a1)
{
  return sub_24CCE865C(a1, (uint64_t *)&unk_2698251D8);
}

uint64_t sub_24CCE2940(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CCDE144(a1, a2);
  }
  return a1;
}

uint64_t Application.appIconImageData.setter(uint64_t a1, unint64_t a2)
{
  return swift_release();
}

uint64_t sub_24CCE2A3C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  swift_beginAccess();
  uint64_t v6 = *(void *)(a1 + 56);
  unint64_t v7 = *(void *)(a1 + 64);
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 64) = a3;
  sub_24CCE2940(a2, a3);
  return sub_24CCE2AD8(v6, v7);
}

uint64_t sub_24CCE2AB8()
{
  return sub_24CCE2A3C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_24CCE2AD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CCDEAEC(a1, a2);
  }
  return a1;
}

void (*Application.appIconImageData.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC21DeviceSharingServices11Application___observationRegistrar;
  void *v3 = v1;
  v3[5] = sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1F0();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_24CCEC210();
  swift_release();
  swift_beginAccess();
  return sub_24CCE2C14;
}

void sub_24CCE2C14(void **a1)
{
}

uint64_t Application.isSelectedToShare.getter()
{
  swift_getKeyPath();
  sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1F0();
  swift_release();
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t sub_24CCE2CD4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1F0();
  swift_release();
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 72);
  return result;
}

uint64_t sub_24CCE2D94()
{
  return swift_release();
}

uint64_t Application.isSelectedToShare.setter()
{
  return swift_release();
}

uint64_t sub_24CCE2F38()
{
  return sub_24CCE8DD8();
}

void (*Application.isSelectedToShare.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC21DeviceSharingServices11Application___observationRegistrar;
  void *v3 = v1;
  v3[5] = sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1F0();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_24CCEC210();
  swift_release();
  swift_beginAccess();
  return sub_24CCE3078;
}

void sub_24CCE3078(void **a1)
{
}

void sub_24CCE3084(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  void *v1 = v1[3];
  swift_getKeyPath();
  sub_24CCEC200();
  swift_release();
  free(v1);
}

uint64_t Application.__allocating_init(localizedTitle:bundleIdentifier:isNativeVisionApp:isSelectedToShare:appIconImageData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, uint64_t a7, unint64_t a8)
{
  uint64_t v16 = swift_allocObject();
  Application.init(localizedTitle:bundleIdentifier:isNativeVisionApp:isSelectedToShare:appIconImageData:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return v16;
}

uint64_t Application.init(localizedTitle:bundleIdentifier:isNativeVisionApp:isSelectedToShare:appIconImageData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, uint64_t a7, unint64_t a8)
{
  uint64_t v9 = v8;
  *(_OWORD *)(v9 + 56) = xmmword_24CCEF5F0;
  sub_24CCEC220();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  *(void *)(v9 + 32) = a3;
  *(void *)(v9 + 40) = a4;
  *(unsigned char *)(v9 + 48) = a5;
  *(unsigned char *)(v9 + 72) = a6;
  swift_getKeyPath();
  sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1E0();
  sub_24CCE2AD8(a7, a8);
  swift_release();
  return v9;
}

const __CFData *Application.appIconImage.getter()
{
  swift_getKeyPath();
  unint64_t v7 = v0;
  sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1F0();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = v0[7];
  unint64_t v2 = v0[8];
  uint64_t v3 = v0[4];
  unint64_t v4 = v7[5];
  sub_24CCE2940(v1, v2);
  CFDataRef v5 = sub_24CCE33F4(v1, v2, v3, v4);
  sub_24CCE2AD8(v1, v2);
  return v5;
}

CFDataRef sub_24CCE33F4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (qword_269824A90 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24CCEC2F0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26982ACE0);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_24CCEC2D0();
  os_log_type_t v10 = sub_24CCEC500();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v25 = v22;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v12 = sub_24CCEC8D0();
    sub_24CCD1BE4(v12, v13, &v25);
    sub_24CCEC510();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_24CCD1BE4(a3, a4, &v25);
    sub_24CCEC510();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CCCB000, v9, v10, "%s decoding image for %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253311440](v22, -1, -1);
    MEMORY[0x253311440](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (a2 >> 60 == 15)
  {
    swift_bridgeObjectRetain_n();
    char v14 = sub_24CCEC2D0();
    os_log_type_t v15 = sub_24CCEC4F0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v25 = v17;
      *(_DWORD *)uint64_t v16 = 136315394;
      uint64_t v18 = sub_24CCEC8D0();
      sub_24CCD1BE4(v18, v19, &v25);
      sub_24CCEC510();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_24CCD1BE4(a3, a4, &v25);
      sub_24CCEC510();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24CCCB000, v14, v15, "%s missing icon data for %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253311440](v17, -1, -1);
      MEMORY[0x253311440](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  else
  {
    sub_24CCE2940(a1, a2);
    CFDataRef v20 = sub_24CCEBE1C(a1, a2, &v23);
    sub_24CCE2AD8(a1, a2);
  }
  return v20;
}

unint64_t sub_24CCE39C8(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000012;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      unint64_t result = 0x657A696C61636F6CLL;
      break;
  }
  return result;
}

unint64_t sub_24CCE3A98()
{
  return sub_24CCE39C8(*v0);
}

uint64_t sub_24CCE3AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCE8058(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CCE3AC8(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_24CCE3AD4(uint64_t a1)
{
  unint64_t v2 = sub_24CCE3F14();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCE3B10(uint64_t a1)
{
  unint64_t v2 = sub_24CCE3F14();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Application.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CCE2AD8(*(void *)(v0 + 56), *(void *)(v0 + 64));
  uint64_t v1 = v0 + OBJC_IVAR____TtC21DeviceSharingServices11Application___observationRegistrar;
  uint64_t v2 = sub_24CCEC230();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t Application.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CCE2AD8(*(void *)(v0 + 56), *(void *)(v0 + 64));
  uint64_t v1 = v0 + OBJC_IVAR____TtC21DeviceSharingServices11Application___observationRegistrar;
  uint64_t v2 = sub_24CCEC230();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t Application.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825158);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCE3F14();
  sub_24CCEC8A0();
  char v12 = 0;
  sub_24CCEC770();
  if (!v2)
  {
    char v12 = 1;
    sub_24CCEC770();
    char v12 = 2;
    sub_24CCEC780();
    swift_beginAccess();
    long long v10 = *(_OWORD *)(v3 + 56);
    char v11 = 3;
    sub_24CCE3F68();
    sub_24CCEC760();
    swift_beginAccess();
    char v11 = 4;
    sub_24CCEC780();
    char v11 = 5;
    sub_24CCEC230();
    sub_24CCE3FBC(&qword_269825170, MEMORY[0x263F8F210]);
    sub_24CCEC790();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24CCE3F14()
{
  unint64_t result = qword_269825160;
  if (!qword_269825160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825160);
  }
  return result;
}

unint64_t sub_24CCE3F68()
{
  unint64_t result = qword_269825168;
  if (!qword_269825168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825168);
  }
  return result;
}

uint64_t sub_24CCE3FBC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t Application.__allocating_init(from:)(uint64_t a1)
{
  return sub_24CCE594C(a1, (void (*)(uint64_t))Application.init(from:));
}

uint64_t *Application.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v24 = *v1;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825178);
  uint64_t v5 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v1 + 7) = xmmword_24CCEF5F0;
  uint64_t v20 = (uint64_t)v1 + OBJC_IVAR____TtC21DeviceSharingServices11Application___observationRegistrar;
  sub_24CCEC220();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCE3F14();
  sub_24CCEC890();
  if (v2)
  {
    uint64_t v9 = v20;
    sub_24CCE2AD8(v1[7], v1[8]);
    uint64_t v10 = sub_24CCEC230();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v21 = 0;
    v1[2] = sub_24CCEC700();
    v1[3] = v8;
    char v21 = 1;
    v1[4] = sub_24CCEC700();
    v1[5] = v12;
    char v21 = 2;
    *((unsigned char *)v1 + 48) = sub_24CCEC710() & 1;
    char v21 = 3;
    sub_24CCE43B8();
    sub_24CCEC6F0();
    uint64_t v13 = v22;
    uint64_t v14 = v23;
    swift_beginAccess();
    uint64_t v15 = v3[7];
    unint64_t v16 = v3[8];
    v3[7] = v13;
    v3[8] = v14;
    uint64_t v17 = v19;
    sub_24CCE2AD8(v15, v16);
    LOBYTE(v22) = 4;
    LOBYTE(v13) = sub_24CCEC710();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
    *((unsigned char *)v3 + 72) = v13 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

unint64_t sub_24CCE43B8()
{
  unint64_t result = qword_269825180;
  if (!qword_269825180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825180);
  }
  return result;
}

uint64_t sub_24CCE440C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24CCE5C58(a1, (uint64_t (*)(uint64_t))Application.init(from:), a2);
}

uint64_t sub_24CCE4438(void *a1)
{
  return Application.encode(to:)(a1);
}

uint64_t sub_24CCE445C()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCE450C()
{
  return sub_24CCEC2C0();
}

uint64_t sub_24CCE45D8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 40);
  *a1 = *(void *)(*(void *)v1 + 32);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CCE45EC(uint64_t *a1, uint64_t *a2)
{
  return _s21DeviceSharingServices11ApplicationC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t Application.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24CCEC360();
  return swift_bridgeObjectRelease();
}

uint64_t Application.hashValue.getter()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCE46AC()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCE470C()
{
  swift_bridgeObjectRetain();
  sub_24CCEC360();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CCE4768()
{
  return sub_24CCEC880();
}

uint64_t Application.description.getter()
{
  uint64_t v1 = sub_24CCEC8D0();
  sub_24CCEC380();
  swift_bridgeObjectRetain();
  sub_24CCEC380();
  swift_bridgeObjectRelease();
  sub_24CCEC380();
  swift_bridgeObjectRetain();
  sub_24CCEC380();
  swift_bridgeObjectRelease();
  sub_24CCEC380();
  sub_24CCEC380();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24CCEC380();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
  sub_24CCEC1F0();
  swift_release();
  swift_beginAccess();
  sub_24CCEC380();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24CCEC380();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_24CCE4A54()
{
  return Application.description.getter();
}

uint64_t ApplicationLibrary.applications.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ApplicationLibrary.areAllApplicationsSelectedToShare.getter()
{
  unint64_t v1 = *(void *)(v0 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  unint64_t v2 = v1 >> 62;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24CCEC660();
    uint64_t v3 = result;
    if (!result) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_17;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  if ((v1 & 0xC000000000000001) == 0)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v8 = *(void *)(v1 + 8 * i + 32);
      swift_getKeyPath();
      sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
      swift_retain();
      sub_24CCEC1F0();
      swift_release();
      swift_beginAccess();
      if (*(unsigned char *)(v8 + 72) == 1)
      {
        sub_24CCEC600();
        sub_24CCEC620();
        sub_24CCEC630();
        sub_24CCEC610();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v2 = v1 >> 62;
    goto LABEL_18;
  }
  for (uint64_t j = 0; j != v3; ++j)
  {
    uint64_t v6 = MEMORY[0x2533109F0](j, v1);
    swift_getKeyPath();
    sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
    sub_24CCEC1F0();
    swift_release();
    swift_beginAccess();
    if (*(unsigned char *)(v6 + 72) == 1)
    {
      sub_24CCEC600();
      sub_24CCEC620();
      sub_24CCEC630();
      sub_24CCEC610();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
LABEL_17:
  swift_bridgeObjectRelease();
LABEL_18:
  if (v11 < 0 || (v11 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24CCEC660();
    swift_release();
  }
  else
  {
    uint64_t v9 = *(void *)(v11 + 16);
  }
  swift_release();
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24CCEC660();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v9 == v10;
}

uint64_t ApplicationLibrary.selectedApplications.getter()
{
  unint64_t v1 = *(void *)(v0 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return v8;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24CCEC660();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        uint64_t v5 = MEMORY[0x2533109F0](i, v1);
        swift_getKeyPath();
        sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
        sub_24CCEC1F0();
        swift_release();
        swift_beginAccess();
        if (*(unsigned char *)(v5 + 72) == 1)
        {
          sub_24CCEC600();
          sub_24CCEC620();
          sub_24CCEC630();
          sub_24CCEC610();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      for (uint64_t j = 0; j != v2; ++j)
      {
        uint64_t v7 = *(void *)(v1 + 8 * j + 32);
        swift_getKeyPath();
        sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
        swift_retain();
        sub_24CCEC1F0();
        swift_release();
        swift_beginAccess();
        if (*(unsigned char *)(v7 + 72) == 1)
        {
          sub_24CCEC600();
          sub_24CCEC620();
          sub_24CCEC630();
          sub_24CCEC610();
        }
        else
        {
          swift_release();
        }
      }
    }
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t ApplicationLibrary.selectedApplicationBundleIds.getter()
{
  unint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (!(v1 >> 62))
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24CCEC660();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_34;
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v6 = MEMORY[0x2533109F0](i, v1);
      swift_getKeyPath();
      sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
      sub_24CCEC1F0();
      swift_release();
      swift_beginAccess();
      if (*(unsigned char *)(v6 + 72) == 1)
      {
        sub_24CCEC600();
        sub_24CCEC620();
        sub_24CCEC630();
        sub_24CCEC610();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    goto LABEL_17;
  }
  for (uint64_t j = 0; j != v3; ++j)
  {
    uint64_t v8 = *(void *)(v1 + 8 * j + 32);
    swift_getKeyPath();
    sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
    swift_retain();
    sub_24CCEC1F0();
    swift_release();
    swift_beginAccess();
    if (*(unsigned char *)(v8 + 72) == 1)
    {
      sub_24CCEC600();
      sub_24CCEC620();
      sub_24CCEC630();
      sub_24CCEC610();
    }
    else
    {
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v2 = MEMORY[0x263F8EE78];
LABEL_18:
  if ((v19 & 0x8000000000000000) == 0 && (v19 & 0x4000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(v19 + 16);
    if (v9) {
      goto LABEL_21;
    }
LABEL_31:
    swift_release();
    uint64_t v11 = MEMORY[0x263F8EE78];
LABEL_32:
    uint64_t v18 = sub_24CCE82B8(v11);
    swift_bridgeObjectRelease();
    return v18;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_24CCEC660();
  swift_release();
  if (!v9) {
    goto LABEL_31;
  }
LABEL_21:
  uint64_t result = sub_24CCE6318(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v2;
    do
    {
      if ((v19 & 0xC000000000000001) != 0)
      {
        uint64_t v12 = MEMORY[0x2533109F0](v10, v19);
      }
      else
      {
        uint64_t v12 = *(void *)(v19 + 8 * v10 + 32);
        swift_retain();
      }
      uint64_t v14 = *(void *)(v12 + 32);
      uint64_t v13 = *(void *)(v12 + 40);
      swift_bridgeObjectRetain();
      swift_release();
      unint64_t v16 = *(void *)(v11 + 16);
      unint64_t v15 = *(void *)(v11 + 24);
      if (v16 >= v15 >> 1) {
        sub_24CCE6318(v15 > 1, v16 + 1, 1);
      }
      ++v10;
      *(void *)(v11 + 16) = v16 + 1;
      uint64_t v17 = v11 + 16 * v16;
      *(void *)(v17 + 32) = v14;
      *(void *)(v17 + 40) = v13;
    }
    while (v9 != v10);
    swift_release();
    goto LABEL_32;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t ApplicationLibrary.__allocating_init(applications:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_24CCEC220();
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v5 = swift_bridgeObjectRetain();
    uint64_t v3 = (uint64_t)sub_24CCE6220(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v6 = v3;
  sub_24CCE6F34(&v6);
  swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = v6;
  return v2;
}

uint64_t ApplicationLibrary.init(applications:)(uint64_t a1)
{
  uint64_t v1 = sub_24CCE8350(a1);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_24CCE5510(char a1)
{
  if (a1) {
    return 0xD000000000000016;
  }
  else {
    return 0x746163696C707061;
  }
}

uint64_t sub_24CCE5554()
{
  return sub_24CCE5510(*v0);
}

uint64_t sub_24CCE555C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCE8C30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CCE5584(uint64_t a1)
{
  unint64_t v2 = sub_24CCE83E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCE55C0(uint64_t a1)
{
  unint64_t v2 = sub_24CCE83E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ApplicationLibrary.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC21DeviceSharingServices18ApplicationLibrary___observationRegistrar;
  uint64_t v2 = sub_24CCEC230();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ApplicationLibrary.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC21DeviceSharingServices18ApplicationLibrary___observationRegistrar;
  uint64_t v2 = sub_24CCEC230();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t ApplicationLibrary.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825190);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCE83E8();
  sub_24CCEC8A0();
  uint64_t v11 = *(void *)(v3 + 16);
  v10[7] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698251A0);
  sub_24CCE843C(&qword_2698251A8, &qword_2698251B0);
  sub_24CCEC790();
  if (!v2)
  {
    v10[6] = 1;
    sub_24CCEC230();
    sub_24CCE3FBC(&qword_269825170, MEMORY[0x263F8F210]);
    sub_24CCEC790();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ApplicationLibrary.__allocating_init(from:)(uint64_t a1)
{
  return sub_24CCE594C(a1, (void (*)(uint64_t))ApplicationLibrary.init(from:));
}

uint64_t sub_24CCE594C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4 = swift_allocObject();
  a2(a1);
  return v4;
}

uint64_t *ApplicationLibrary.init(from:)(void *a1)
{
  uint64_t v13 = *v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698251B8);
  uint64_t v12 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)v1 + OBJC_IVAR____TtC21DeviceSharingServices18ApplicationLibrary___observationRegistrar;
  sub_24CCEC220();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCE83E8();
  sub_24CCEC890();
  if (v2)
  {
    uint64_t v9 = sub_24CCEC230();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v7, v9);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v8 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698251A0);
    char v14 = 0;
    sub_24CCE843C(&qword_2698251C0, &qword_2698251C8);
    sub_24CCEC720();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v4);
    v1[2] = v15;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_24CCE5C2C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24CCE5C58(a1, (uint64_t (*)(uint64_t))ApplicationLibrary.init(from:), a2);
}

uint64_t sub_24CCE5C58@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v7 = swift_allocObject();
  uint64_t result = a2(a1);
  if (!v3) {
    *a3 = v7;
  }
  return result;
}

uint64_t sub_24CCE5CC0(void *a1)
{
  return ApplicationLibrary.encode(to:)(a1);
}

uint64_t sub_24CCE5CE4()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCE5D94()
{
  return sub_24CCEC2C0();
}

uint64_t static ApplicationLibrary.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_24CCE5E6C(*(void *)(a1 + 16), *(void *)(a2 + 16));
}

uint64_t sub_24CCE5E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62) {
    goto LABEL_47;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24CCEC660();
    swift_bridgeObjectRelease();
    if (v5 == v6) {
      goto LABEL_5;
    }
LABEL_43:
    char v16 = 0;
    return v16 & 1;
  }
  uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5 != v6) {
    goto LABEL_43;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_40;
  }
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  if (v4) {
    uint64_t v8 = v7;
  }
  uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v10 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  uint64_t v17 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v10 = v9;
  }
  if (v8 == v10)
  {
LABEL_40:
    char v16 = 1;
    return v16 & 1;
  }
  if (v5 < 0)
  {
    __break(1u);
    goto LABEL_51;
  }
  unint64_t v21 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
LABEL_51:
    uint64_t result = MEMORY[0x2533109F0](0, a1);
    uint64_t v6 = result;
    goto LABEL_19;
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_53;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = swift_retain();
LABEL_19:
  unint64_t v19 = a2 & 0xC000000000000001;
  if ((a2 & 0xC000000000000001) != 0)
  {
LABEL_53:
    uint64_t v4 = MEMORY[0x2533109F0](0, a2);
    goto LABEL_22;
  }
  if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v4 = *(void *)(a2 + 32);
    swift_retain();
LABEL_22:
    if (*(void *)(v6 + 32) == *(void *)(v4 + 32) && *(void *)(v6 + 40) == *(void *)(v4 + 40)
      || (sub_24CCEC7D0() & 1) != 0)
    {
      uint64_t v18 = a2;
      uint64_t v20 = 1 - v5;
      for (uint64_t i = 5; ; ++i)
      {
        swift_getKeyPath();
        sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
        sub_24CCEC1F0();
        swift_release();
        swift_beginAccess();
        int v13 = *(unsigned __int8 *)(v6 + 72);
        swift_getKeyPath();
        sub_24CCEC1F0();
        swift_release();
        swift_beginAccess();
        int v14 = *(unsigned __int8 *)(v4 + 72);
        swift_release();
        swift_release();
        if (((v13 ^ v14) & 1) != 0 || v20 + i == 5)
        {
          char v16 = v13 ^ v14 ^ 1;
          return v16 & 1;
        }
        unint64_t v15 = i - 4;
        a2 = v18;
        if (v21)
        {
          uint64_t v6 = MEMORY[0x2533109F0](i - 4, a1);
          if (v19) {
            goto LABEL_32;
          }
        }
        else
        {
          if (v15 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            swift_bridgeObjectRetain();
            uint64_t v5 = sub_24CCEC660();
            swift_bridgeObjectRelease();
            goto LABEL_3;
          }
          uint64_t v6 = *(void *)(a1 + 8 * i);
          swift_retain();
          if (v19)
          {
LABEL_32:
            uint64_t v4 = MEMORY[0x2533109F0](i - 4, v18);
            goto LABEL_37;
          }
        }
        if (v15 >= *(void *)(v17 + 16)) {
          goto LABEL_46;
        }
        uint64_t v4 = *(void *)(v18 + 8 * i);
        swift_retain();
LABEL_37:
        if ((*(void *)(v6 + 32) != *(void *)(v4 + 32) || *(void *)(v6 + 40) != *(void *)(v4 + 40))
          && (sub_24CCEC7D0() & 1) == 0)
        {
          break;
        }
      }
    }
    swift_release();
    swift_release();
    goto LABEL_43;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CCE620C(uint64_t a1, uint64_t a2)
{
  return sub_24CCE5E6C(*(void *)(*(void *)a1 + 16), *(void *)(*(void *)a2 + 16));
}

void *sub_24CCE6220(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269824E58);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_24CCE7CF4((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24CCEC660();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t sub_24CCE6318(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CCE6338(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_24CCE6338(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269825250);
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
  int v13 = v10 + 32;
  int v14 = a4 + 32;
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
  uint64_t result = sub_24CCEC6A0();
  __break(1u);
  return result;
}

uint64_t sub_24CCE64A4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24CCEC850();
  swift_bridgeObjectRetain();
  sub_24CCEC360();
  uint64_t v8 = sub_24CCEC880();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24CCEC7D0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_24CCEC7D0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24CCE6934(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24CCE6654()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269825248);
  uint64_t v3 = sub_24CCEC590();
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
                unint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24CCEC850();
      sub_24CCEC360();
      uint64_t result = sub_24CCEC880();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_24CCE6934(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24CCE6654();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24CCE6AD0();
      goto LABEL_22;
    }
    sub_24CCE6C84();
  }
  uint64_t v11 = *v4;
  sub_24CCEC850();
  sub_24CCEC360();
  uint64_t result = sub_24CCEC880();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24CCEC7D0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24CCEC7E0();
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
          uint64_t result = sub_24CCEC7D0();
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
  uint64_t *v21 = v8;
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

void *sub_24CCE6AD0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269825248);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CCEC580();
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
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

uint64_t sub_24CCE6C84()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269825248);
  uint64_t v3 = sub_24CCEC590();
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24CCEC850();
    swift_bridgeObjectRetain();
    sub_24CCEC360();
    uint64_t result = sub_24CCEC880();
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
    unint64_t v1 = v0;
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

uint64_t sub_24CCE6F34(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_24CCE7EF8();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_24CCE6FB0(v6);
  return sub_24CCEC610();
}

uint64_t sub_24CCE6FB0(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1[1];
  uint64_t result = sub_24CCEC7B0();
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_150;
    }
    if (v4) {
      return sub_24CCE7684(0, v4, 1, a1);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_158;
  }
  uint64_t v7 = result;
  v95 = a1;
  if (v4 < 2)
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
    uint64_t v101 = MEMORY[0x263F8EE78];
    __dst = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_116:
      v87 = v10;
      if (v13 >= 2)
      {
        uint64_t v88 = *v95;
        do
        {
          unint64_t v89 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_145;
          }
          if (!v88) {
            goto LABEL_157;
          }
          v90 = v87;
          uint64_t v91 = *(void *)&v87[16 * v89 + 32];
          uint64_t v92 = *(void *)&v87[16 * v13 + 24];
          sub_24CCE7744((char *)(v88 + 8 * v91), (char *)(v88 + 8 * *(void *)&v87[16 * v13 + 16]), v88 + 8 * v92, __dst);
          if (v2) {
            break;
          }
          if (v92 < v91) {
            goto LABEL_146;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v90 = sub_24CCE7BA8((uint64_t)v90);
          }
          if (v89 >= *((void *)v90 + 2)) {
            goto LABEL_147;
          }
          v93 = &v90[16 * v89 + 32];
          *(void *)v93 = v91;
          *((void *)v93 + 1) = v92;
          unint64_t v94 = *((void *)v90 + 2);
          if (v13 > v94) {
            goto LABEL_148;
          }
          memmove(&v90[16 * v13 + 16], &v90[16 * v13 + 32], 16 * (v94 - v13));
          v87 = v90;
          *((void *)v90 + 2) = v94 - 1;
          unint64_t v13 = v94 - 1;
        }
        while (v94 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease();
      *(void *)((v101 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_24CCEC460();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    type metadata accessor for Application(0);
    uint64_t v9 = sub_24CCEC480();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    __dst = (char *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v101 = v9;
  }
  uint64_t v11 = 0;
  uint64_t v12 = *a1;
  uint64_t v96 = v12 - 8;
  uint64_t v97 = v7;
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  uint64_t v98 = v4;
  uint64_t v99 = v12;
  while (1)
  {
    uint64_t v14 = v11++;
    if (v11 < v4)
    {
      uint64_t v15 = *(void *)(v12 + 8 * v11);
      uint64_t v16 = *(void *)(v12 + 8 * v14);
      if (*(void *)(v15 + 16) == *(void *)(v16 + 16) && *(void *)(v15 + 24) == *(void *)(v16 + 24))
      {
        uint64_t v19 = v14 + 2;
        if (v14 + 2 >= v4) {
          goto LABEL_43;
        }
        int v18 = 0;
        do
        {
LABEL_26:
          uint64_t v21 = *(void *)(v12 + 8 * v19);
          uint64_t v22 = *(void *)(v12 + 8 * v11);
          if (*(void *)(v21 + 16) == *(void *)(v22 + 16) && *(void *)(v21 + 24) == *(void *)(v22 + 24))
          {
            if (v18) {
              goto LABEL_35;
            }
          }
          else if ((v18 ^ sub_24CCEC7D0()))
          {
            goto LABEL_34;
          }
          uint64_t v20 = v19 + 1;
          uint64_t v11 = v19;
          uint64_t v19 = v20;
        }
        while (v20 < v4);
        uint64_t v19 = v20;
      }
      else
      {
        int v18 = sub_24CCEC7D0();
        uint64_t v19 = v14 + 2;
        if (v14 + 2 < v4) {
          goto LABEL_26;
        }
      }
LABEL_34:
      uint64_t v11 = v19;
      if (v18)
      {
LABEL_35:
        if (v19 < v14) {
          goto LABEL_153;
        }
        if (v14 < v19)
        {
          unint64_t v24 = (uint64_t *)(v96 + 8 * v19);
          uint64_t v25 = v19;
          uint64_t v26 = v14;
          BOOL v27 = (uint64_t *)(v12 + 8 * v14);
          do
          {
            if (v26 != --v25)
            {
              if (!v12) {
                goto LABEL_156;
              }
              uint64_t v28 = *v27;
              *BOOL v27 = *v24;
              *unint64_t v24 = v28;
            }
            ++v26;
            --v24;
            ++v27;
          }
          while (v26 < v25);
        }
LABEL_43:
        uint64_t v11 = v19;
      }
    }
    if (v11 < v4)
    {
      if (__OFSUB__(v11, v14)) {
        goto LABEL_149;
      }
      if (v11 - v14 < v97) {
        break;
      }
    }
LABEL_65:
    if (v11 < v14) {
      goto LABEL_144;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_24CCE79F0(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v37 = *((void *)v10 + 2);
    unint64_t v36 = *((void *)v10 + 3);
    unint64_t v13 = v37 + 1;
    if (v37 >= v36 >> 1) {
      uint64_t v10 = sub_24CCE79F0((char *)(v36 > 1), v37 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v13;
    uint64_t v38 = v10 + 32;
    long long v39 = &v10[16 * v37 + 32];
    *(void *)long long v39 = v14;
    *((void *)v39 + 1) = v11;
    if (v37)
    {
      uint64_t v12 = v99;
      while (1)
      {
        unint64_t v40 = v13 - 1;
        if (v13 >= 4)
        {
          os_log_type_t v45 = &v38[16 * v13];
          uint64_t v46 = *((void *)v45 - 8);
          uint64_t v47 = *((void *)v45 - 7);
          BOOL v51 = __OFSUB__(v47, v46);
          uint64_t v48 = v47 - v46;
          if (v51) {
            goto LABEL_133;
          }
          uint64_t v50 = *((void *)v45 - 6);
          uint64_t v49 = *((void *)v45 - 5);
          BOOL v51 = __OFSUB__(v49, v50);
          uint64_t v43 = v49 - v50;
          char v44 = v51;
          if (v51) {
            goto LABEL_134;
          }
          unint64_t v52 = v13 - 2;
          id v53 = &v38[16 * v13 - 32];
          uint64_t v55 = *(void *)v53;
          uint64_t v54 = *((void *)v53 + 1);
          BOOL v51 = __OFSUB__(v54, v55);
          uint64_t v56 = v54 - v55;
          if (v51) {
            goto LABEL_136;
          }
          BOOL v51 = __OFADD__(v43, v56);
          uint64_t v57 = v43 + v56;
          if (v51) {
            goto LABEL_139;
          }
          if (v57 >= v48)
          {
            v75 = &v38[16 * v40];
            uint64_t v77 = *(void *)v75;
            uint64_t v76 = *((void *)v75 + 1);
            BOOL v51 = __OFSUB__(v76, v77);
            uint64_t v78 = v76 - v77;
            if (v51) {
              goto LABEL_143;
            }
            BOOL v68 = v43 < v78;
            goto LABEL_103;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v69 = *((void *)v10 + 4);
            uint64_t v70 = *((void *)v10 + 5);
            BOOL v51 = __OFSUB__(v70, v69);
            uint64_t v62 = v70 - v69;
            char v63 = v51;
            goto LABEL_97;
          }
          uint64_t v42 = *((void *)v10 + 4);
          uint64_t v41 = *((void *)v10 + 5);
          BOOL v51 = __OFSUB__(v41, v42);
          uint64_t v43 = v41 - v42;
          char v44 = v51;
        }
        if (v44) {
          goto LABEL_135;
        }
        unint64_t v52 = v13 - 2;
        v58 = &v38[16 * v13 - 32];
        uint64_t v60 = *(void *)v58;
        uint64_t v59 = *((void *)v58 + 1);
        BOOL v61 = __OFSUB__(v59, v60);
        uint64_t v62 = v59 - v60;
        char v63 = v61;
        if (v61) {
          goto LABEL_138;
        }
        v64 = &v38[16 * v40];
        uint64_t v66 = *(void *)v64;
        uint64_t v65 = *((void *)v64 + 1);
        BOOL v51 = __OFSUB__(v65, v66);
        uint64_t v67 = v65 - v66;
        if (v51) {
          goto LABEL_141;
        }
        if (__OFADD__(v62, v67)) {
          goto LABEL_142;
        }
        if (v62 + v67 >= v43)
        {
          BOOL v68 = v43 < v67;
LABEL_103:
          if (v68) {
            unint64_t v40 = v52;
          }
          goto LABEL_105;
        }
LABEL_97:
        if (v63) {
          goto LABEL_137;
        }
        v71 = &v38[16 * v40];
        uint64_t v73 = *(void *)v71;
        uint64_t v72 = *((void *)v71 + 1);
        BOOL v51 = __OFSUB__(v72, v73);
        uint64_t v74 = v72 - v73;
        if (v51) {
          goto LABEL_140;
        }
        if (v74 < v62) {
          goto LABEL_14;
        }
LABEL_105:
        unint64_t v79 = v40 - 1;
        if (v40 - 1 >= v13)
        {
          __break(1u);
LABEL_130:
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
          goto LABEL_152;
        }
        if (!v12) {
          goto LABEL_155;
        }
        v80 = v10;
        uint64_t v81 = v12;
        v82 = &v38[16 * v79];
        uint64_t v83 = *(void *)v82;
        v84 = &v38[16 * v40];
        uint64_t v85 = *((void *)v84 + 1);
        sub_24CCE7744((char *)(v81 + 8 * *(void *)v82), (char *)(v81 + 8 * *(void *)v84), v81 + 8 * v85, __dst);
        if (v1) {
          goto LABEL_113;
        }
        if (v85 < v83) {
          goto LABEL_130;
        }
        if (v40 > *((void *)v80 + 2)) {
          goto LABEL_131;
        }
        *(void *)v82 = v83;
        *(void *)&v38[16 * v79 + 8] = v85;
        unint64_t v86 = *((void *)v80 + 2);
        if (v40 >= v86) {
          goto LABEL_132;
        }
        uint64_t v10 = v80;
        unint64_t v13 = v86 - 1;
        memmove(&v38[16 * v40], v84 + 16, 16 * (v86 - 1 - v40));
        *((void *)v80 + 2) = v86 - 1;
        BOOL v68 = v86 > 2;
        uint64_t v12 = v99;
        if (!v68) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
    uint64_t v12 = v99;
LABEL_14:
    uint64_t v4 = v98;
    if (v11 >= v98)
    {
      uint64_t v2 = v1;
      goto LABEL_116;
    }
  }
  if (__OFADD__(v14, v97)) {
    goto LABEL_151;
  }
  if (v14 + v97 >= v4) {
    uint64_t v29 = v4;
  }
  else {
    uint64_t v29 = v14 + v97;
  }
  if (v29 >= v14)
  {
    if (v11 != v29)
    {
      uint64_t v30 = (void *)(v96 + 8 * v11);
      do
      {
        uint64_t v31 = *(void *)(v12 + 8 * v11);
        uint64_t v32 = v14;
        char v33 = v30;
        do
        {
          BOOL v34 = *(void *)(v31 + 16) == *(void *)(*v33 + 16) && *(void *)(v31 + 24) == *(void *)(*v33 + 24);
          if (v34 || (sub_24CCEC7D0() & 1) == 0) {
            break;
          }
          if (!v12) {
            goto LABEL_154;
          }
          uint64_t v35 = *v33;
          uint64_t v31 = v33[1];
          void *v33 = v31;
          v33[1] = v35;
          --v33;
          ++v32;
        }
        while (v11 != v32);
        ++v11;
        ++v30;
      }
      while (v11 != v29);
      uint64_t v11 = v29;
    }
    goto LABEL_65;
  }
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  uint64_t result = sub_24CCEC650();
  __break(1u);
  return result;
}

uint64_t sub_24CCE7684(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v9 = *(void *)(v7 + 8 * v4);
    uint64_t v10 = v6;
    uint64_t v11 = (void *)v8;
    while (1)
    {
      uint64_t result = *(void *)(v9 + 16);
      BOOL v12 = result == *(void *)(*v11 + 16) && *(void *)(v9 + 24) == *(void *)(*v11 + 24);
      if (v12 || (uint64_t result = sub_24CCEC7D0(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 8;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t v13 = *v11;
      uint64_t v9 = v11[1];
      void *v11 = v9;
      v11[1] = v13;
      --v11;
      if (v4 == ++v10) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24CCE7744(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v28 = __src;
  BOOL v27 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      unint64_t v17 = &v4[8 * v13];
      uint64_t v26 = v17;
      uint64_t v28 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        int v18 = (char *)(a3 - 8);
        uint64_t v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 8;
          uint64_t v21 = *((void *)v17 - 1);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 8;
          uint64_t v23 = *(void *)(v22 + 24);
          BOOL v24 = *(void *)(v21 + 16) == *(void *)(v22 + 16) && *(void *)(v21 + 24) == v23;
          if (v24 || (sub_24CCEC7D0() & 1) == 0)
          {
            uint64_t v26 = v17 - 8;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(void *)int v18 = *((void *)v17 - 1);
            }
            uint64_t v19 = v6;
            v17 -= 8;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(void *)int v18 = *(void *)v19;
            }
            uint64_t v28 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 8;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[8 * v10];
    uint64_t v26 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        BOOL v15 = *(void *)(*(void *)v6 + 16) == *(void *)(*(void *)v4 + 16)
           && *(void *)(*(void *)v6 + 24) == *(void *)(*(void *)v4 + 24);
        if (v15 || (sub_24CCEC7D0() & 1) == 0)
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          BOOL v27 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 8;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v28 = v7;
    }
LABEL_50:
    sub_24CCE7AEC((void **)&v28, &v27, &v26);
    return 1;
  }
  uint64_t result = sub_24CCEC6A0();
  __break(1u);
  return result;
}

char *sub_24CCE79F0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269825240);
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

char *sub_24CCE7AEC(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_24CCEC6A0();
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

char *sub_24CCE7BA8(uint64_t a1)
{
  return sub_24CCE79F0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_24CCE7BBC(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24CCE7C6C(v6, a2, a3);
  return sub_24CCE7C24;
}

void sub_24CCE7C24(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_24CCE7C6C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x2533109F0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    uint64_t *v3 = v4;
    return sub_24CCE7CEC;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CCE7CEC()
{
  return swift_release();
}

uint64_t sub_24CCE7CF4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24CCEC660();
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
    uint64_t v10 = sub_24CCEC660();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24CCE8D28();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2698251A0);
          uint64_t v12 = sub_24CCE7BBC(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
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
    type metadata accessor for Application(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24CCEC6A0();
  __break(1u);
  return result;
}

void sub_24CCE7EF8()
{
}

uint64_t _s21DeviceSharingServices11ApplicationC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40);
  if (v4 || (v5 = sub_24CCEC7D0(), char v6 = 0, (v5 & 1) != 0))
  {
    swift_getKeyPath();
    sub_24CCE3FBC(&qword_269825150, (void (*)(uint64_t))type metadata accessor for Application);
    sub_24CCEC1F0();
    swift_release();
    swift_beginAccess();
    char v7 = *(unsigned char *)(a1 + 72);
    swift_getKeyPath();
    sub_24CCEC1F0();
    swift_release();
    swift_beginAccess();
    char v6 = v7 ^ *(unsigned char *)(a2 + 72) ^ 1;
  }
  return v6 & 1;
}

uint64_t sub_24CCE8058(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x657A696C61636F6CLL && a2 == 0xEE00656C74695464;
  if (v3 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024CCF15A0 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024CCF15C0 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024CCF15E0 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024CCF1600 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024CCF1620)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_24CCE82B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24CCEC4E0();
  uint64_t v8 = result;
  if (v2)
  {
    BOOL v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24CCE64A4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24CCE8350(uint64_t a1)
{
  sub_24CCEC220();
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v5 = swift_bridgeObjectRetain();
    uint64_t v3 = (uint64_t)sub_24CCE6220(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v6 = v3;
  sub_24CCE6F34(&v6);
  *(void *)(v1 + 16) = v6;
  return v1;
}

unint64_t sub_24CCE83E8()
{
  unint64_t result = qword_269825198;
  if (!qword_269825198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825198);
  }
  return result;
}

uint64_t sub_24CCE843C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698251A0);
    sub_24CCE3FBC(a2, (void (*)(uint64_t))type metadata accessor for Application);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CCE84D0()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_24CCE84DC()
{
  return sub_24CCE3FBC(&qword_2698251D0, (void (*)(uint64_t))type metadata accessor for Application);
}

uint64_t sub_24CCE8524()
{
  return type metadata accessor for Application(0);
}

uint64_t sub_24CCE852C()
{
  uint64_t result = sub_24CCEC230();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for Application(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Application);
}

uint64_t dispatch thunk of Application.__allocating_init(localizedTitle:bundleIdentifier:isNativeVisionApp:isSelectedToShare:appIconImageData:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of Application.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_24CCE8634()
{
  return type metadata accessor for ApplicationLibrary(0);
}

uint64_t type metadata accessor for ApplicationLibrary(uint64_t a1)
{
  return sub_24CCE865C(a1, (uint64_t *)&unk_2698251E8);
}

uint64_t sub_24CCE865C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CCE8694()
{
  uint64_t result = sub_24CCEC230();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ApplicationLibrary(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ApplicationLibrary);
}

uint64_t dispatch thunk of ApplicationLibrary.__allocating_init(applications:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ApplicationLibrary.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

unsigned char *storeEnumTagSinglePayload for ApplicationLibrary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCE8854);
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

ValueMetadata *type metadata accessor for ApplicationLibrary.CodingKeys()
{
  return &type metadata for ApplicationLibrary.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Application.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Application.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x24CCE89E8);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Application.CodingKeys()
{
  return &type metadata for Application.CodingKeys;
}

unint64_t sub_24CCE8A24()
{
  unint64_t result = qword_2698251F8;
  if (!qword_2698251F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698251F8);
  }
  return result;
}

unint64_t sub_24CCE8A7C()
{
  unint64_t result = qword_269825200;
  if (!qword_269825200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825200);
  }
  return result;
}

unint64_t sub_24CCE8AD4()
{
  unint64_t result = qword_269825208;
  if (!qword_269825208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825208);
  }
  return result;
}

unint64_t sub_24CCE8B2C()
{
  unint64_t result = qword_269825210;
  if (!qword_269825210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825210);
  }
  return result;
}

unint64_t sub_24CCE8B84()
{
  unint64_t result = qword_269825218;
  if (!qword_269825218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825218);
  }
  return result;
}

unint64_t sub_24CCE8BDC()
{
  unint64_t result = qword_269825220;
  if (!qword_269825220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825220);
  }
  return result;
}

uint64_t sub_24CCE8C30(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746163696C707061 && a2 == 0xEC000000736E6F69;
  if (v3 || (sub_24CCEC7D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024CCF1620)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_24CCE8D28()
{
  unint64_t result = qword_269825238;
  if (!qword_269825238)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698251A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825238);
  }
  return result;
}

unint64_t sub_24CCE8D84()
{
  unint64_t result = qword_269825258;
  if (!qword_269825258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825258);
  }
  return result;
}

uint64_t sub_24CCE8DD8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 72) = v2;
  return result;
}

uint64_t sub_24CCE8E30()
{
  return sub_24CCE2AB8();
}

uint64_t sub_24CCE8E48()
{
  return sub_24CCEC420();
}

uint64_t sub_24CCE8EC4()
{
  return sub_24CCEC3F0();
}

uint64_t sub_24CCE8F30()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCE8FBC()
{
  return sub_24CCEC2C0();
}

uint64_t GuestUserModeStateWrapper.guestUserModeState.getter()
{
  return *(void *)v0;
}

uint64_t GuestUserModeStateWrapper.init(guestUserModeState:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

unint64_t sub_24CCE9080()
{
  return 0xD000000000000012;
}

uint64_t sub_24CCE909C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCE97A0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CCE90C8(uint64_t a1)
{
  unint64_t v2 = sub_24CCE92AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCE9104(uint64_t a1)
{
  unint64_t v2 = sub_24CCE92AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GuestUserModeStateWrapper.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825260);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCE92AC();
  sub_24CCEC8A0();
  v9[1] = v7;
  type metadata accessor for DSSGuestUserModeState(0);
  sub_24CCE98D0(&qword_269825270);
  sub_24CCEC790();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24CCE92AC()
{
  unint64_t result = qword_269825268;
  if (!qword_269825268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825268);
  }
  return result;
}

uint64_t GuestUserModeStateWrapper.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269825278);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCE92AC();
  sub_24CCEC890();
  if (!v2)
  {
    type metadata accessor for DSSGuestUserModeState(0);
    sub_24CCE98D0(&qword_269825280);
    sub_24CCEC720();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24CCE948C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return GuestUserModeStateWrapper.init(from:)(a1, a2);
}

uint64_t sub_24CCE94A4(void *a1)
{
  return GuestUserModeStateWrapper.encode(to:)(a1);
}

BOOL static GuestUserModeStateWrapper.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL sub_24CCE94D0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24CCE94E4()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCE9538()
{
  return sub_24CCEC2C0();
}

ValueMetadata *type metadata accessor for GuestUserModeStateWrapper()
{
  return &type metadata for GuestUserModeStateWrapper;
}

unsigned char *storeEnumTagSinglePayload for GuestUserModeStateWrapper.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CCE9660);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for GuestUserModeStateWrapper.CodingKeys()
{
  return &type metadata for GuestUserModeStateWrapper.CodingKeys;
}

unint64_t sub_24CCE969C()
{
  unint64_t result = qword_269825288;
  if (!qword_269825288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825288);
  }
  return result;
}

unint64_t sub_24CCE96F4()
{
  unint64_t result = qword_269825290;
  if (!qword_269825290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825290);
  }
  return result;
}

unint64_t sub_24CCE974C()
{
  unint64_t result = qword_269825298;
  if (!qword_269825298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825298);
  }
  return result;
}

uint64_t sub_24CCE97A0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000024CCF1710)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_24CCE9828()
{
  unint64_t result = qword_2698252A0;
  if (!qword_2698252A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698252A0);
  }
  return result;
}

unint64_t sub_24CCE987C()
{
  unint64_t result = qword_2698252A8;
  if (!qword_2698252A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698252A8);
  }
  return result;
}

uint64_t sub_24CCE98D0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DSSGuestUserModeState(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

DeviceSharingServices::AirPlayReceiverCoordinator __swiftcall AirPlayReceiverCoordinator.init()()
{
  unsigned char *v0 = 0;
  return result;
}

unint64_t static AirPlayReceiverCoordinator.applicationBundleIdentifier.getter()
{
  return 0xD000000000000019;
}

unint64_t static AirPlayReceiverCoordinator.requestViewMirroringLaunchURLString.getter()
{
  return 0xD00000000000003FLL;
}

Swift::Void __swiftcall AirPlayReceiverCoordinator.enableAirPlayReceiver()()
{
  uint64_t v1 = self;
  if (objc_msgSend(v1, sel_listeningForAlternateBonjourBrowsing))
  {
    unsigned char *v0 = 1;
    if (qword_269824AA0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_24CCEC2F0();
    __swift_project_value_buffer(v2, (uint64_t)qword_26982AD10);
    oslog = sub_24CCEC2D0();
    os_log_type_t v3 = sub_24CCEC500();
    if (os_log_type_enabled(oslog, v3))
    {
      unsigned int v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl(&dword_24CCCB000, oslog, v3, "AirPlayReceiver has already been enabled!", v4, 2u);
      MEMORY[0x253311440](v4, -1, -1);
    }
  }
  else
  {
    objc_msgSend(v1, sel_setListeningForAlternateBonjourBrowsing_, 1);
    if (qword_269824AA0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24CCEC2F0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26982AD10);
    oslog = sub_24CCEC2D0();
    os_log_type_t v6 = sub_24CCEC500();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v10 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_24CCD1BE4(0xD00000000000001ALL, 0x800000024CCEFDF0, &v10);
      sub_24CCEC510();
      _os_log_impl(&dword_24CCCB000, oslog, v6, "%s successfully enabled AirPlayReceiver", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253311440](v8, -1, -1);
      MEMORY[0x253311440](v7, -1, -1);

      return;
    }
  }
}

Swift::Void __swiftcall AirPlayReceiverCoordinator.disableAirPlayReceiver()()
{
  if ((*v0 & 1) == 0)
  {
    objc_msgSend(self, sel_setListeningForAlternateBonjourBrowsing_, 0);
    if (qword_269824AA0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_24CCEC2F0();
    __swift_project_value_buffer(v1, (uint64_t)qword_26982AD10);
    oslog = sub_24CCEC2D0();
    os_log_type_t v2 = sub_24CCEC500();
    if (os_log_type_enabled(oslog, v2))
    {
      os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v4 = swift_slowAlloc();
      uint64_t v6 = v4;
      *(_DWORD *)os_log_type_t v3 = 136315138;
      sub_24CCD1BE4(0xD00000000000001ALL, 0x800000024CCEFDF0, &v6);
      sub_24CCEC510();
      _os_log_impl(&dword_24CCCB000, oslog, v2, "%s successfully disabled AirPlayReceiver", v3, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253311440](v4, -1, -1);
      MEMORY[0x253311440](v3, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t AirPlayReceiverCoordinator.launchAirPlayReceiver()()
{
  return MEMORY[0x270FA2498](sub_24CCE9DCC, 0, 0);
}

uint64_t sub_24CCE9DCC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269824EE8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CCEFE00;
  v0[24] = sub_24CCEC330();
  v0[25] = v2;
  sub_24CCEC570();
  *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 72) = 1;
  v0[26] = sub_24CCEC330();
  v0[27] = v3;
  sub_24CCEC570();
  *(void *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_2698252C0);
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 144));
  sub_24CCEC110();
  sub_24CCDCF70(inited);
  uint64_t v4 = (void *)sub_24CCEC300();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_optionsWithDictionary_, v4);
  v0[28] = v5;

  uint64_t v6 = (void *)swift_task_alloc();
  v0[29] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24CCE9FDC;
  v6[16] = v5;
  return MEMORY[0x270FA2498](sub_24CCEA158, 0, 0);
}

uint64_t sub_24CCE9FDC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CCEA0D8, 0, 0);
}

uint64_t sub_24CCEA0D8()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCEA138(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return MEMORY[0x270FA2498](sub_24CCEA158, 0, 0);
}

uint64_t sub_24CCEA158()
{
  uint64_t v14 = v0;
  id v1 = objc_msgSend(self, sel_serviceWithDefaultShellEndpoint);
  v0[17] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = v0[16];
    uint64_t v4 = sub_24CCEC310();
    v0[18] = v4;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_24CCEA438;
    uint64_t v5 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_24CCEA9BC;
    v0[13] = &block_descriptor;
    v0[14] = v5;
    objc_msgSend(v2, sel_openApplication_withOptions_completion_, v4, v3, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    if (qword_269824AA0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24CCEC2F0();
    __swift_project_value_buffer(v6, (uint64_t)qword_26982AD10);
    uint64_t v7 = sub_24CCEC2D0();
    os_log_type_t v8 = sub_24CCEC4F0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v13 = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      v0[10] = sub_24CCD1BE4(0xD00000000000001ALL, 0x800000024CCEFDF0, &v13);
      sub_24CCEC510();
      _os_log_impl(&dword_24CCCB000, v7, v8, "%s failed to launch AirPlayReceiver; unable to create FBSOpenApplicationService",
        v9,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x253311440](v10, -1, -1);
      MEMORY[0x253311440](v9, -1, -1);
    }

    int64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t sub_24CCEA438()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_24CCEA718;
  }
  else {
    uint64_t v2 = sub_24CCEA548;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CCEA548()
{
  uint64_t v12 = v0;
  uint64_t v1 = *(void **)(v0 + 144);

  if (qword_269824AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CCEC2F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26982AD10);
  uint64_t v3 = sub_24CCEC2D0();
  os_log_type_t v4 = sub_24CCEC500();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = *(void **)(v0 + 136);
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v11 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v0 + 80) = sub_24CCD1BE4(0xD00000000000001ALL, 0x800000024CCEFDF0, &v11);
    sub_24CCEC510();
    _os_log_impl(&dword_24CCCB000, v3, v4, "%s successfully launched AirPlayReceiver", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253311440](v8, -1, -1);
    MEMORY[0x253311440](v7, -1, -1);
  }

  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_24CCEA718()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();

  if (qword_269824AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void **)(v0 + 152);
  uint64_t v3 = sub_24CCEC2F0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26982AD10);
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_24CCEC2D0();
  os_log_type_t v7 = sub_24CCEC4F0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void **)(v0 + 152);
  if (v8)
  {
    unint64_t v17 = *(void **)(v0 + 136);
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v18 = v16;
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v0 + 80) = sub_24CCD1BE4(0xD00000000000001ALL, 0x800000024CCEFDF0, &v18);
    sub_24CCEC510();
    *(_WORD *)(v10 + 12) = 2112;
    id v12 = v9;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v13;
    sub_24CCEC510();
    void *v11 = v13;

    _os_log_impl(&dword_24CCCB000, v6, v7, "%s failed to launch AirPlayReceiver with error %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269824EF0);
    swift_arrayDestroy();
    MEMORY[0x253311440](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253311440](v16, -1, -1);
    MEMORY[0x253311440](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_24CCEA9BC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698252D0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t getEnumTagSinglePayload for AirPlayReceiverCoordinator(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AirPlayReceiverCoordinator(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *DeviceSharingServices::AirPlayReceiverCoordinator result = a2 + 1;
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
        JUMPOUT(0x24CCEAC4CLL);
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
          *DeviceSharingServices::AirPlayReceiverCoordinator result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AirPlayReceiverCoordinator()
{
  return &type metadata for AirPlayReceiverCoordinator;
}

unint64_t static XPCConstants.daemonMachServiceName.getter()
{
  return 0xD000000000000018;
}

unint64_t static XPCConstants.daemonEntitlement.getter()
{
  return 0xD00000000000001FLL;
}

ValueMetadata *type metadata accessor for XPCConstants()
{
  return &type metadata for XPCConstants;
}

uint64_t GuestUserRemoteUnlockRequestConfiguration.applicationLibrary.getter()
{
  return swift_retain();
}

uint64_t GuestUserRemoteUnlockRequestConfiguration.init(applicationLibrary:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static GuestUserRemoteUnlockRequestConfiguration.emptyConfiguration.getter@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ApplicationLibrary(0);
  uint64_t v2 = swift_allocObject();
  sub_24CCEC220();
  int v3 = (void *)MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0) {
    int v3 = sub_24CCE6220(MEMORY[0x263F8EE78]);
  }
  uint64_t v5 = v3;
  sub_24CCE6F34((uint64_t *)&v5);
  uint64_t result = (uint64_t)v5;
  *(void *)(v2 + 16) = v5;
  *a1 = v2;
  return result;
}

unint64_t sub_24CCEAD74()
{
  return 0xD000000000000012;
}

uint64_t sub_24CCEAD90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCEB580(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CCEADBC(uint64_t a1)
{
  unint64_t v2 = sub_24CCEB2FC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CCEADF8(uint64_t a1)
{
  unint64_t v2 = sub_24CCEB2FC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GuestUserRemoteUnlockRequestConfiguration.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698252D8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCEB2FC();
  sub_24CCEC8A0();
  v9[1] = v7;
  type metadata accessor for ApplicationLibrary(0);
  sub_24CCEB350(&qword_269825230);
  sub_24CCEC790();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t GuestUserRemoteUnlockRequestConfiguration.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698252E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CCEB2FC();
  sub_24CCEC890();
  if (!v2)
  {
    type metadata accessor for ApplicationLibrary(0);
    sub_24CCEB350(&qword_269825228);
    sub_24CCEC720();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24CCEB12C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return GuestUserRemoteUnlockRequestConfiguration.init(from:)(a1, a2);
}

uint64_t sub_24CCEB144(void *a1)
{
  return GuestUserRemoteUnlockRequestConfiguration.encode(to:)(a1);
}

uint64_t static GuestUserRemoteUnlockRequestConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_24CCE5E6C(*(void *)(*(void *)a1 + 16), *(void *)(*(void *)a2 + 16));
}

uint64_t sub_24CCEB170()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCEB1C4()
{
  return sub_24CCEC2C0();
}

uint64_t GuestUserRemoteUnlockRequestConfiguration.description.getter()
{
  return 0;
}

unint64_t sub_24CCEB2FC()
{
  unint64_t result = qword_2698252E0;
  if (!qword_2698252E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698252E0);
  }
  return result;
}

uint64_t sub_24CCEB350(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ApplicationLibrary(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for GuestUserRemoteUnlockRequestConfiguration()
{
  return &type metadata for GuestUserRemoteUnlockRequestConfiguration;
}

unsigned char *storeEnumTagSinglePayload for GuestUserRemoteUnlockRequestConfiguration.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CCEB440);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for GuestUserRemoteUnlockRequestConfiguration.CodingKeys()
{
  return &type metadata for GuestUserRemoteUnlockRequestConfiguration.CodingKeys;
}

unint64_t sub_24CCEB47C()
{
  unint64_t result = qword_2698252F0;
  if (!qword_2698252F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698252F0);
  }
  return result;
}

unint64_t sub_24CCEB4D4()
{
  unint64_t result = qword_2698252F8;
  if (!qword_2698252F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698252F8);
  }
  return result;
}

unint64_t sub_24CCEB52C()
{
  unint64_t result = qword_269825300;
  if (!qword_269825300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825300);
  }
  return result;
}

uint64_t sub_24CCEB580(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000024CCF1800)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24CCEC7D0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_24CCEB608(char a1, char a2)
{
  if (*(void *)&aLocal_2[8 * a1] == *(void *)&aLocal_2[8 * a2]
    && *(void *)&aLocaland_0[8 * a1 + 8] == *(void *)&aLocaland_0[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_24CCEC7D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24CCEB690(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x72656E776FLL;
  }
  else {
    uint64_t v2 = 0x7473657567;
  }
  if (a2) {
    uint64_t v3 = 0x72656E776FLL;
  }
  else {
    uint64_t v3 = 0x7473657567;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_24CCEC7D0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_24CCEB708()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCEB774()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCEB7E4()
{
  sub_24CCEC360();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CCEB838()
{
  sub_24CCEC360();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CCEB888()
{
  return sub_24CCEC880();
}

uint64_t sub_24CCEB8F4()
{
  return sub_24CCEC880();
}

DeviceSharingServices::ViewMirroringInitiator_optional __swiftcall ViewMirroringInitiator.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_24CCEC6B0();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  char *v2 = v5;
  return result;
}

uint64_t ViewMirroringInitiator.rawValue.getter()
{
  if (*v0) {
    return 0x72656E776FLL;
  }
  else {
    return 0x7473657567;
  }
}

unint64_t sub_24CCEB9F0()
{
  unint64_t result = qword_269825308;
  if (!qword_269825308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825308);
  }
  return result;
}

uint64_t sub_24CCEBA44()
{
  return sub_24CCEB774();
}

uint64_t sub_24CCEBA4C()
{
  return sub_24CCEB838();
}

uint64_t sub_24CCEBA54()
{
  return sub_24CCEB888();
}

DeviceSharingServices::ViewMirroringInitiator_optional sub_24CCEBA5C(Swift::String *a1)
{
  return ViewMirroringInitiator.init(rawValue:)(*a1);
}

uint64_t sub_24CCEBA68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ViewMirroringInitiator.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CCEBA90()
{
  return sub_24CCEC410();
}

uint64_t sub_24CCEBAF0()
{
  return sub_24CCEC3E0();
}

uint64_t sub_24CCEBB40(char *a1, char *a2)
{
  return sub_24CCEB690(*a1, *a2);
}

uint64_t sub_24CCEBB4C()
{
  return sub_24CCEC2B0();
}

uint64_t sub_24CCEBBA0()
{
  return sub_24CCEC2C0();
}

unsigned char *storeEnumTagSinglePayload for ViewMirroringInitiator(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCEBCE8);
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

ValueMetadata *type metadata accessor for ViewMirroringInitiator()
{
  return &type metadata for ViewMirroringInitiator;
}

unint64_t sub_24CCEBD20()
{
  unint64_t result = qword_269825310;
  if (!qword_269825310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825310);
  }
  return result;
}

unint64_t sub_24CCEBD74()
{
  unint64_t result = qword_269825318;
  if (!qword_269825318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825318);
  }
  return result;
}

unint64_t sub_24CCEBDC8()
{
  unint64_t result = qword_269825320;
  if (!qword_269825320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825320);
  }
  return result;
}

CFDataRef sub_24CCEBE1C(uint64_t a1, uint64_t a2, BOOL *a3)
{
  CFDataRef v4 = (const __CFData *)sub_24CCEC120();
  uint64_t v5 = CGDataProviderCreateWithCFData(v4);

  if (!v5)
  {
    sub_24CCE8D84();
    swift_willThrowTypedImpl();
LABEL_6:
    *a3 = v5 != 0;
    return v4;
  }
  CGImageRef v6 = CGImageCreateWithPNGDataProvider(v5, 0, 0, kCGRenderingIntentDefault);
  if (!v6)
  {
    sub_24CCE8D84();
    swift_willThrowTypedImpl();

    goto LABEL_6;
  }
  CFDataRef v4 = v6;

  return v4;
}

unsigned char *storeEnumTagSinglePayload for ImageDecodingError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CCEBFB4);
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

ValueMetadata *type metadata accessor for ImageDecodingError()
{
  return &type metadata for ImageDecodingError;
}

unint64_t sub_24CCEBFF0()
{
  unint64_t result = qword_269825328;
  if (!qword_269825328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269825328);
  }
  return result;
}

uint64_t sub_24CCEC110()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24CCEC120()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24CCEC130()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24CCEC140()
{
  return MEMORY[0x270EE06B0]();
}

uint64_t sub_24CCEC150()
{
  return MEMORY[0x270EE06E8]();
}

uint64_t sub_24CCEC160()
{
  return MEMORY[0x270EE06F8]();
}

uint64_t sub_24CCEC170()
{
  return MEMORY[0x270EE0700]();
}

uint64_t sub_24CCEC180()
{
  return MEMORY[0x270EE0790]();
}

uint64_t sub_24CCEC190()
{
  return MEMORY[0x270EE0798]();
}

uint64_t sub_24CCEC1A0()
{
  return MEMORY[0x270EE07A0]();
}

uint64_t sub_24CCEC1B0()
{
  return MEMORY[0x270EE07B0]();
}

uint64_t sub_24CCEC1C0()
{
  return MEMORY[0x270EE07C8]();
}

uint64_t sub_24CCEC1D0()
{
  return MEMORY[0x270EE0828]();
}

uint64_t sub_24CCEC1E0()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_24CCEC1F0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_24CCEC200()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_24CCEC210()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_24CCEC220()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_24CCEC230()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_24CCEC240()
{
  return MEMORY[0x270F5D018]();
}

uint64_t sub_24CCEC250()
{
  return MEMORY[0x270F5D020]();
}

uint64_t sub_24CCEC260()
{
  return MEMORY[0x270F25FE0]();
}

uint64_t sub_24CCEC270()
{
  return MEMORY[0x270F25FE8]();
}

uint64_t sub_24CCEC2A0()
{
  return MEMORY[0x270F26000]();
}

uint64_t sub_24CCEC2B0()
{
  return MEMORY[0x270F26030]();
}

uint64_t sub_24CCEC2C0()
{
  return MEMORY[0x270F26038]();
}

uint64_t sub_24CCEC2D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CCEC2E0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CCEC2F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CCEC300()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24CCEC310()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CCEC320()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24CCEC330()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CCEC340()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CCEC350()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24CCEC360()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24CCEC370()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24CCEC380()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CCEC390()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CCEC3A0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24CCEC3B0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24CCEC3C0()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_24CCEC3D0()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_24CCEC3E0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24CCEC3F0()
{
  return MEMORY[0x270F9DAA0]();
}

uint64_t sub_24CCEC400()
{
  return MEMORY[0x270F9DAD8]();
}

uint64_t sub_24CCEC410()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24CCEC420()
{
  return MEMORY[0x270F9DB20]();
}

uint64_t sub_24CCEC430()
{
  return MEMORY[0x270F9DB58]();
}

uint64_t sub_24CCEC440()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24CCEC450()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CCEC460()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CCEC470()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24CCEC480()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24CCEC490()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24CCEC4A0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CCEC4B0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CCEC4C0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CCEC4E0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24CCEC4F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CCEC500()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CCEC510()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CCEC520()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CCEC530()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_24CCEC540()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24CCEC550()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24CCEC560()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24CCEC570()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24CCEC580()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24CCEC590()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24CCEC5A0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24CCEC5B0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CCEC5C0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CCEC5D0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24CCEC5E0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24CCEC5F0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CCEC600()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24CCEC610()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24CCEC620()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24CCEC630()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24CCEC640()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24CCEC650()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CCEC660()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CCEC670()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24CCEC680()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CCEC690()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24CCEC6A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CCEC6B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24CCEC6C0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24CCEC6D0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24CCEC6E0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24CCEC6F0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24CCEC700()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24CCEC710()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24CCEC720()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24CCEC730()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24CCEC740()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24CCEC750()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24CCEC760()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24CCEC770()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24CCEC780()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24CCEC790()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24CCEC7A0()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_24CCEC7B0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24CCEC7C0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CCEC7D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CCEC7E0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24CCEC7F0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CCEC800()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CCEC810()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CCEC820()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CCEC830()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CCEC840()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_24CCEC850()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CCEC860()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CCEC870()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24CCEC880()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CCEC890()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24CCEC8A0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24CCEC8D0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t APSCopyPairingIdentity()
{
  return MEMORY[0x270F0BC18]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x270EE2200](inFileURL, outSystemSoundID);
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x270EE2210](*(void *)&inSystemSoundID);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6770](source, decode, shouldInterpolate, *(void *)&intent);
}

uint64_t MobileGestalt_copy_userAssignedDeviceName_obj()
{
  return MEMORY[0x270F960C0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_exception_throw(id exception)
{
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

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}