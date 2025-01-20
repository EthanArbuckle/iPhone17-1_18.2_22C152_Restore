uint64_t APKDeviceLockState.description.getter()
{
  unsigned char *v0;

  if (*v0) {
    return 0x656B636F6C6E752ELL;
  }
  else {
    return 0x64656B636F6C2ELL;
  }
}

BOOL static APKDeviceLockState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t APKDeviceLockState.hash(into:)()
{
  return sub_247438940();
}

BOOL sub_247436C0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_247436C28()
{
  return sub_247438940();
}

uint64_t sub_247436C58()
{
  if (*v0) {
    return 0x64656B636F6C6E75;
  }
  else {
    return 0x64656B636F6CLL;
  }
}

uint64_t sub_247436C90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247438788(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247436CB8()
{
  return 0;
}

void sub_247436CC4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_247436CD0(uint64_t a1)
{
  unint64_t v2 = sub_2474371AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247436D0C(uint64_t a1)
{
  unint64_t v2 = sub_2474371AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247436D48()
{
  return 0;
}

uint64_t sub_247436D54@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_247436D84(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_247436D90(uint64_t a1)
{
  unint64_t v2 = sub_247437254();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247436DCC(uint64_t a1)
{
  unint64_t v2 = sub_247437254();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247436E08(uint64_t a1)
{
  unint64_t v2 = sub_247437200();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247436E44(uint64_t a1)
{
  unint64_t v2 = sub_247437200();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t APKDeviceLockState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924FA28);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924FA30);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924FA38);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2474371AC();
  sub_247438970();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_247437200();
    v14 = v18;
    sub_247438910();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_247437254();
    sub_247438910();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
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

unint64_t sub_2474371AC()
{
  unint64_t result = qword_26924FA80;
  if (!qword_26924FA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924FA80);
  }
  return result;
}

unint64_t sub_247437200()
{
  unint64_t result = qword_26924FA88;
  if (!qword_26924FA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924FA88);
  }
  return result;
}

unint64_t sub_247437254()
{
  unint64_t result = qword_26924FA90[0];
  if (!qword_26924FA90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26924FA90);
  }
  return result;
}

uint64_t APKDeviceLockState.hashValue.getter()
{
  return sub_247438950();
}

uint64_t APKDeviceLockState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924FA40);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924FA48);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924FA50);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2474371AC();
  v11 = v32;
  sub_247438960();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  v14 = v10;
  uint64_t v15 = sub_247438900();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_2474388C0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26924FA58);
    *char v22 = &type metadata for APKDeviceLockState;
    sub_2474388F0();
    sub_2474388B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_247437200();
    v18 = v14;
    sub_2474388E0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_247437254();
    sub_2474388E0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_247437748@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return APKDeviceLockState.init(from:)(a1, a2);
}

uint64_t sub_247437760(void *a1)
{
  return APKDeviceLockState.encode(to:)(a1);
}

uint64_t sub_247437778()
{
  return sub_247438950();
}

uint64_t sub_2474377C0()
{
  return sub_247438950();
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

uint64_t sub_247437854()
{
  if (*v0) {
    return 0x656B636F6C6E752ELL;
  }
  else {
    return 0x64656B636F6C2ELL;
  }
}

uint64_t sub_247437894@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x24C555F60](v4);
  uint64_t v6 = *(void *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_2474378F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_24743794C()
{
  swift_beginAccess();
  return MEMORY[0x24C555F60](v0 + 16);
}

uint64_t sub_247437994(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_2474379F8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x24C555F60](v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_247437A78;
}

void sub_247437A78(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 24) = *(void *)(*(void *)a1 + 32);
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

unint64_t sub_247437AFC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26924FA70);
  uint64_t v2 = (void *)sub_2474388D0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_24743862C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
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

void sub_247437C10(unsigned char *a1@<X8>)
{
  uint64_t v2 = (void *)sub_247438880();
  unsigned int v3 = MKBGetDeviceLockState();

  unint64_t v4 = 0x100000001000001uLL >> (8 * v3);
  if (v3 >= 8) {
    LOBYTE(v4) = 0;
  }
  *a1 = v4;
}

uint64_t APKLockStateMonitor.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  APKLockStateMonitor.init()();
  return v0;
}

uint64_t APKLockStateMonitor.init()()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_DWORD *)(v0 + 32) = 0;
  uint64_t v2 = (int *)(v0 + 32);
  *(void *)(v0 + 40) = sub_247437AFC((uint64_t)&unk_26FB8EAC0);
  sub_247437DFC();
  unsigned int v3 = sub_2474388A0();
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  v7[4] = sub_247437E74;
  v7[5] = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_247437F4C;
  v7[3] = &block_descriptor;
  uint64_t v5 = _Block_copy(v7);
  swift_release();
  swift_beginAccess();
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", v2, v3, v5);
  swift_endAccess();
  _Block_release(v5);

  return v1;
}

unint64_t sub_247437DFC()
{
  unint64_t result = qword_26924FA60;
  if (!qword_26924FA60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26924FA60);
  }
  return result;
}

uint64_t sub_247437E3C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247437E74()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = result + 16;
    swift_beginAccess();
    if (MEMORY[0x24C555F60](v2))
    {
      uint64_t v3 = *(void *)(v1 + 24);
      uint64_t ObjectType = swift_getObjectType();
      sub_247437C10(&v6);
      char v5 = v6;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 8))(&v5, ObjectType, v3);
      swift_unknownObjectRelease();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_247437F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
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

uint64_t APKLockStateMonitor.deinit()
{
  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 32));
  sub_247438004(v0 + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_247438004(uint64_t a1)
{
  return a1;
}

uint64_t APKLockStateMonitor.__deallocating_deinit()
{
  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 32));
  sub_247438004(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_247438088()
{
  unint64_t result = qword_26924FA68;
  if (!qword_26924FA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26924FA68);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for APKDeviceLockState()
{
  return &type metadata for APKDeviceLockState;
}

uint64_t dispatch thunk of APKLockStateMonitorDelegate.lockStateChanged(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for APKLockStateMonitor()
{
  return self;
}

uint64_t method lookup function for APKLockStateMonitor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for APKLockStateMonitor);
}

uint64_t dispatch thunk of APKLockStateMonitor.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of APKLockStateMonitor.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of APKLockStateMonitor.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of APKLockStateMonitor.lockState.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of APKLockStateMonitor.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t _s19ActivityProgressKit18APKDeviceLockStateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s19ActivityProgressKit18APKDeviceLockStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247438358);
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

uint64_t sub_247438380(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_247438388(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for APKDeviceLockState.CodingKeys()
{
  return &type metadata for APKDeviceLockState.CodingKeys;
}

ValueMetadata *type metadata accessor for APKDeviceLockState.LockedCodingKeys()
{
  return &type metadata for APKDeviceLockState.LockedCodingKeys;
}

ValueMetadata *type metadata accessor for APKDeviceLockState.UnlockedCodingKeys()
{
  return &type metadata for APKDeviceLockState.UnlockedCodingKeys;
}

unint64_t sub_2474383C8()
{
  unint64_t result = qword_269250020[0];
  if (!qword_269250020[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269250020);
  }
  return result;
}

unint64_t sub_247438420()
{
  unint64_t result = qword_269250130;
  if (!qword_269250130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269250130);
  }
  return result;
}

unint64_t sub_247438478()
{
  unint64_t result = qword_269250138[0];
  if (!qword_269250138[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269250138);
  }
  return result;
}

unint64_t sub_2474384D0()
{
  unint64_t result = qword_2692501C0;
  if (!qword_2692501C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692501C0);
  }
  return result;
}

unint64_t sub_247438528()
{
  unint64_t result = qword_2692501C8[0];
  if (!qword_2692501C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2692501C8);
  }
  return result;
}

unint64_t sub_247438580()
{
  unint64_t result = qword_269250250;
  if (!qword_269250250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269250250);
  }
  return result;
}

unint64_t sub_2474385D8()
{
  unint64_t result = qword_269250258[0];
  if (!qword_269250258[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269250258);
  }
  return result;
}

unint64_t sub_24743862C(uint64_t a1, uint64_t a2)
{
  sub_247438930();
  sub_247438890();
  uint64_t v4 = sub_247438950();
  return sub_2474386A4(a1, a2, v4);
}

unint64_t sub_2474386A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_247438920() & 1) == 0)
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
      while (!v14 && (sub_247438920() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_247438788(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64656B636F6CLL && a2 == 0xE600000000000000;
  if (v2 || (sub_247438920() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64656B636F6C6E75 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_247438920();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_247438880()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_247438890()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2474388A0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2474388B0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2474388C0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2474388D0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2474388E0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2474388F0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_247438900()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_247438910()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_247438920()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247438930()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247438940()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247438950()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247438960()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247438970()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
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