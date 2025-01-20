void *__Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_246D2993C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)(v13 - 72));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void type metadata accessor for Dataclass(uint64_t a1)
{
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
}

uint64_t sub_246D29CE0(uint64_t a1)
{
  return sub_246D29D18(a1, qword_26B121D08);
}

uint64_t sub_246D29CF8(uint64_t a1)
{
  return sub_246D29D18(a1, qword_26B121D20);
}

uint64_t sub_246D29D18(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_246D3E008();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_246D3DFF8();
}

uint64_t sub_246D29DA0(uint64_t a1, uint64_t a2)
{
  return sub_246D2A0C4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_246D29DB8(uint64_t a1, id *a2)
{
  uint64_t result = sub_246D3E078();
  *a2 = 0;
  return result;
}

uint64_t sub_246D29E30(uint64_t a1, id *a2)
{
  char v3 = sub_246D3E088();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_246D29EB0@<X0>(uint64_t *a1@<X8>)
{
  sub_246D3E098();
  uint64_t v2 = sub_246D3E068();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_246D29EF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_246D3E068();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_246D29F3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_246D3E098();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_246D29F68(uint64_t a1)
{
  uint64_t v2 = sub_246D2A068(&qword_2691E2880);
  uint64_t v3 = sub_246D2A068(&qword_2691E2888);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_246D2A000()
{
  return sub_246D2A068(&qword_2691E2868);
}

uint64_t sub_246D2A034()
{
  return sub_246D2A068(&qword_2691E2870);
}

uint64_t sub_246D2A068(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Dataclass(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246D2A0AC(uint64_t a1, uint64_t a2)
{
  return sub_246D2A0C4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_246D2A0C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_246D3E098();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_246D2A108()
{
  sub_246D3E098();
  sub_246D3E0E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246D2A15C()
{
  sub_246D3E098();
  sub_246D3E438();
  sub_246D3E0E8();
  uint64_t v0 = sub_246D3E458();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_246D2A1D0()
{
  uint64_t v0 = sub_246D3E098();
  uint64_t v2 = v1;
  if (v0 == sub_246D3E098() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_246D3E398();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_246D2A25C()
{
  return sub_246D2A068(&qword_2691E2878);
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

void type metadata accessor for CFError(uint64_t a1)
{
}

void sub_246D2A340(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t ACSEError.nsError.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  uint64_t v6 = sub_246D3E378();
  if (v6)
  {
    v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  uint64_t v9 = sub_246D3DE48();

  return v9;
}

uint64_t ACSEError.errorCode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

unint64_t ACSEError.userInfo.getter(uint64_t a1, uint64_t (**a2)(void, void))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2898);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246D3EEB0;
  *(void *)(inited + 32) = sub_246D3E098();
  *(void *)(inited + 40) = v5;
  uint64_t v6 = a2[3](a1, a2);
  uint64_t v7 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v8;
  *(void *)(inited + 80) = sub_246D3E098();
  *(void *)(inited + 88) = v9;
  uint64_t v10 = a2[4](a1, a2);
  *(void *)(inited + 120) = v7;
  *(void *)(inited + 96) = v10;
  *(void *)(inited + 104) = v11;
  *(void *)(inited + 128) = sub_246D3E098();
  *(void *)(inited + 136) = v12;
  uint64_t v13 = a2[5](a1, a2);
  *(void *)(inited + 168) = v7;
  *(void *)(inited + 144) = v13;
  *(void *)(inited + 152) = v14;
  return sub_246D2A650(inited);
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

unint64_t sub_246D2A650(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CF0);
  uint64_t v2 = sub_246D3E328();
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
    sub_246D2ADC8(v6, (uint64_t)&v15, &qword_2691E28C0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_246D2D76C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_246D2ADB8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_246D2A788(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E28B0);
  uint64_t v2 = sub_246D3E328();
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
    sub_246D2ADC8(v6, (uint64_t)v15, &qword_2691E28B8);
    unint64_t result = sub_246D2DAAC((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_246D2ADB8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_246D2A8CC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E28A8);
  uint64_t v2 = (void *)sub_246D3E328();
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
    unint64_t result = sub_246D2D76C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v10 = (uint64_t *)(v2[6] + 16 * result);
    *long long v10 = v5;
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

uint64_t ACSEError.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_246D3E1F8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v23 - v10;
  id v12 = objc_msgSend(a1, sel_domain);
  uint64_t v13 = sub_246D3E098();
  uint64_t v15 = v14;

  if (v13 == sub_246D3DE28() && v15 == v16)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v18 = sub_246D3E398();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {

      uint64_t v19 = *(void *)(a2 - 8);
      goto LABEL_10;
    }
  }
  (*(void (**)(id, uint64_t, uint64_t))(a3 + 64))(objc_msgSend(a1, sel_code), a2, a3);

  uint64_t v19 = *(void *)(a2 - 8);
  uint64_t v20 = v19;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v11, 1, a2))
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(a4, v11, a2);
    uint64_t v21 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(a4, v21, 1, a2);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
LABEL_10:
  uint64_t v20 = v19;
  uint64_t v21 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(a4, v21, 1, a2);
}

uint64_t dispatch thunk of ACSEError.errorDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ACSEError.failureReason.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ACSEError.recoverySuggestion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ACSEError.nsError.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ACSEError.rawValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ACSEError.init(rawValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_246D2ACD0()
{
  char v6 = *v0;
  sub_246D2AD64();
  uint64_t v1 = sub_246D3E378();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
  }
  else
  {
    uint64_t v2 = (void *)swift_allocError();
    *uint64_t v3 = v6;
  }
  uint64_t v4 = sub_246D3DE48();

  return v4;
}

unint64_t sub_246D2AD64()
{
  unint64_t result = qword_2691E28A0;
  if (!qword_2691E28A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691E28A0);
  }
  return result;
}

_OWORD *sub_246D2ADB8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_246D2ADC8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_246D2AE2C()
{
  unk_2691E28D7 = -18;
}

char *sub_246D2AE5C()
{
  unint64_t result = sub_246D2AE80();
  qword_2691E28D8 = (uint64_t)result;
  unk_2691E28E0 = v1;
  return result;
}

char *sub_246D2AE80()
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_246D3DF58();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t v22 = 37;
  uint64_t v4 = sub_246D3E128();
  *(void *)(v4 + 16) = 37;
  *(_OWORD *)(v4 + 48) = 0u;
  *(void *)(v4 + 61) = 0;
  *(_OWORD *)(v4 + 32) = 0u;
  int v5 = sysctlbyname("kern.bootsessionuuid", (void *)(v4 + 32), &v22, 0, 0);
  if (!v5)
  {
    uint64_t v20 = sub_246D2B3BC(v4, v6);
    swift_bridgeObjectRelease();
    return (char *)v20;
  }
  int v7 = v5;
  int v8 = MEMORY[0x24C5476A0]();
  unint64_t result = strerror(v8);
  if (result)
  {
    uint64_t v10 = sub_246D3E058();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    if (v12) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 0x6E776F6E6B6E55;
    }
    if (v12) {
      unint64_t v14 = v12;
    }
    else {
      unint64_t v14 = 0xE700000000000000;
    }
    if (qword_26B121CC0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_246D3E008();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B121D08);
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_246D3DFE8();
    os_log_type_t v17 = sub_246D3E1C8();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v23[0] = v19;
      *(_DWORD *)uint64_t v18 = 67109378;
      LODWORD(v21) = v7;
      sub_246D3E208();
      *(_WORD *)(v18 + 8) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_246D2D114(v13, v14, v23);
      sub_246D3E208();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246D27000, v16, v17, "Failed to fetch current boot session UUID with error: %d -> %s", (uint8_t *)v18, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v19, -1, -1);
      MEMORY[0x24C548150](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_246D3DF48();
    uint64_t v20 = sub_246D3DF38();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return (char *)v20;
  }
  __break(1u);
  return result;
}

uint64_t static SystemProperties.bootSessionUUID.getter()
{
  if (qword_2691E2850 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2691E28D8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static SystemProperties.getDeviceID()()
{
  if (qword_2691E2848 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)sub_246D3E068();
  uint64_t v1 = MGCopyAnswer();

  if (v1 && (swift_dynamicCast() & 1) != 0) {
    return v7;
  }
  if (qword_26B121CC0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_246D3E008();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B121D08);
  uint64_t v4 = sub_246D3DFE8();
  os_log_type_t v5 = sub_246D3E1C8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_246D27000, v4, v5, "Failed to fetch unique device ID.", v6, 2u);
    MEMORY[0x24C548150](v6, -1, -1);
  }

  return 0;
}

ValueMetadata *type metadata accessor for SystemProperties()
{
  return &type metadata for SystemProperties;
}

uint64_t sub_246D2B3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
LABEL_9:
    __break(1u);
    return MEMORY[0x270F9D6B0](a1, a2);
  }
  uint64_t v3 = a1;
  int v4 = *(unsigned __int8 *)(a1 + 32);
  a1 += 32;
  if (v4)
  {
    a2 = 0;
    uint64_t v5 = v2 - 1;
    uint64_t v6 = v3 + 33;
    while (v5 != a2)
    {
      if (!*(unsigned __int8 *)(v6 + a2++)) {
        return MEMORY[0x270F9D6B0](a1, a2);
      }
    }
    __break(1u);
    goto LABEL_9;
  }
  a2 = 0;
  return MEMORY[0x270F9D6B0](a1, a2);
}

uint64_t sub_246D2B404(uint64_t a1, void *a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  uint64_t v10 = a2[4];
  void *v7 = v3;
  v7[1] = sub_246D2B4BC;
  return MEMORY[0x270FA1FA8](a1, v6, v8, v9, v10);
}

uint64_t sub_246D2B4BC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t TaskLimiter.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE80];
  return v0;
}

uint64_t TaskLimiter.init()()
{
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE80];
  return v0;
}

uint64_t sub_246D2B620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[43] = a6;
  v7[44] = v6;
  v7[41] = a4;
  v7[42] = a5;
  v7[39] = a2;
  v7[40] = a3;
  v7[38] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD8);
  v7[45] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_246D2B6C0, v6, 0);
}

uint64_t sub_246D2B6C0()
{
  uint64_t v73 = v0;
  uint64_t v1 = (_OWORD *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 352) + 112;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  if (!*(void *)(*(void *)v2 + 16))
  {
    *(void *)(v0 + 128) = 0;
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_246D2EFCC(v0 + 96, &qword_26B121CD0);
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_246D2D76C(v5, v4);
  if (v7)
  {
    sub_246D2DA0C(*(void *)(v3 + 56) + 40 * v6, v0 + 96);
  }
  else
  {
    *(void *)(v0 + 128) = 0;
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 120)) {
    goto LABEL_12;
  }
  sub_246D2DA70((long long *)(v0 + 96), v0 + 16);
  sub_246D2DA0C(v0 + 16, v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2900);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B121CF8);
  sub_246D3E198();
  if (swift_dynamicCast())
  {
    uint64_t v9 = *(void *)(v0 + 288);
    *(void *)(v0 + 368) = v9;
    if (qword_26B121CC0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_246D3E008();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B121D08);
    swift_bridgeObjectRetain_n();
    unint64_t v11 = sub_246D3DFE8();
    os_log_type_t v12 = sub_246D3E1B8();
    BOOL v13 = os_log_type_enabled(v11, v12);
    unint64_t v14 = *(void *)(v0 + 320);
    if (v13)
    {
      uint64_t v15 = *(void *)(v0 + 312);
      uint64_t v71 = v9;
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v72[0] = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 296) = sub_246D2D114(v15, v14, v72);
      sub_246D3E208();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246D27000, v11, v12, "TaskLimiter: reusing existing task for identifier %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v17, -1, -1);
      uint64_t v18 = v16;
      uint64_t v9 = v71;
      MEMORY[0x24C548150](v18, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v66 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v66;
    void *v66 = v0;
    v66[1] = sub_246D2C08C;
    uint64_t v61 = *(void *)(v0 + 344);
    uint64_t v62 = *(void *)(v0 + 304);
    uint64_t v63 = MEMORY[0x263F8E4E0];
    uint64_t v64 = v9;
    uint64_t v65 = v8;
    goto LABEL_32;
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
LABEL_14:
  if (qword_26B121CC0 != -1) {
    swift_once();
  }
  uint64_t v68 = v0 + 176;
  uint64_t v19 = sub_246D3E008();
  __swift_project_value_buffer(v19, (uint64_t)qword_26B121D08);
  swift_bridgeObjectRetain_n();
  uint64_t v20 = sub_246D3DFE8();
  os_log_type_t v21 = sub_246D3E1B8();
  BOOL v22 = os_log_type_enabled(v20, v21);
  unint64_t v23 = *(void *)(v0 + 320);
  if (v22)
  {
    uint64_t v69 = *(void *)(v0 + 312);
    v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v72[0] = v25;
    *(_DWORD *)v24 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 272) = sub_246D2D114(v69, v23, v72);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v20, v21, "TaskLimiter: creating new task for identifier %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v25, -1, -1);
    MEMORY[0x24C548150](v24, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v26 = (_OWORD *)(v0 + 136);
  uint64_t v27 = *(void *)v2;
  if (*(void *)(*(void *)v2 + 16))
  {
    uint64_t v29 = *(void *)(v0 + 312);
    uint64_t v28 = *(void *)(v0 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v30 = sub_246D2D76C(v29, v28);
    if (v31)
    {
      sub_246D2DA0C(*(void *)(v27 + 56) + 40 * v30, v0 + 136);
    }
    else
    {
      *(void *)(v0 + 168) = 0;
      _OWORD *v26 = 0u;
      *(_OWORD *)(v0 + 152) = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(v0 + 168) = 0;
    _OWORD *v26 = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  uint64_t v32 = *(void *)(v0 + 360);
  uint64_t v34 = *(void *)(v0 + 336);
  uint64_t v33 = *(void *)(v0 + 344);
  uint64_t v35 = *(void *)(v0 + 328);
  uint64_t v36 = sub_246D3E178();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v32, 1, 1, v36);
  sub_246D2D7E4(v0 + 136, v68);
  v37 = (void *)swift_allocObject();
  v37[2] = 0;
  v37[3] = 0;
  v37[4] = v33;
  sub_246D2D89C(v68, (uint64_t)(v37 + 5));
  v37[10] = v35;
  v37[11] = v34;
  swift_retain();
  uint64_t v38 = sub_246D2CCEC(v32, (uint64_t)&unk_2691E28F8, (uint64_t)v37);
  *(void *)(v0 + 392) = v38;
  swift_bridgeObjectRetain_n();
  v39 = sub_246D3DFE8();
  os_log_type_t v40 = sub_246D3E1B8();
  BOOL v41 = os_log_type_enabled(v39, v40);
  unint64_t v42 = *(void *)(v0 + 320);
  if (v41)
  {
    uint64_t v43 = v38;
    uint64_t v44 = *(void *)(v0 + 312);
    v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v72[0] = v46;
    *(_DWORD *)v45 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v47 = v44;
    uint64_t v38 = v43;
    *(void *)(v0 + 264) = sub_246D2D114(v47, v42, v72);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v39, v40, "TaskLimiter: storing task for identifier %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v46, -1, -1);
    MEMORY[0x24C548150](v45, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v49 = *(void *)(v0 + 312);
  uint64_t v48 = *(void *)(v0 + 320);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B121CF8);
  v72[3] = sub_246D3E198();
  v72[4] = swift_getWitnessTable();
  v72[0] = v38;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_246D2CE70((uint64_t)v72, v49, v48);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  v51 = sub_246D3DFE8();
  os_log_type_t v52 = sub_246D3E1B8();
  BOOL v53 = os_log_type_enabled(v51, v52);
  unint64_t v54 = *(void *)(v0 + 320);
  if (v53)
  {
    uint64_t v70 = v50;
    uint64_t v55 = v38;
    uint64_t v56 = *(void *)(v0 + 312);
    v57 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    v72[0] = v58;
    *(_DWORD *)v57 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v59 = v56;
    uint64_t v38 = v55;
    uint64_t v50 = v70;
    *(void *)(v0 + 280) = sub_246D2D114(v59, v54, v72);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v51, v52, "TaskLimiter: performing task operation for identifier %s", v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v58, -1, -1);
    MEMORY[0x24C548150](v57, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v60 = (void *)swift_task_alloc();
  *(void *)(v0 + 400) = v60;
  void *v60 = v0;
  v60[1] = sub_246D2C230;
  uint64_t v61 = *(void *)(v0 + 344);
  uint64_t v62 = *(void *)(v0 + 304);
  uint64_t v63 = MEMORY[0x263F8E4E0];
  uint64_t v64 = v38;
  uint64_t v65 = v50;
LABEL_32:
  return MEMORY[0x270FA1FA8](v62, v64, v61, v65, v63);
}

uint64_t sub_246D2C08C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 384) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 352);
  if (v0) {
    uint64_t v4 = sub_246D2C3FC;
  }
  else {
    uint64_t v4 = sub_246D2C1B8;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_246D2C1B8()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246D2C230()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 408) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 352);
  if (v0) {
    uint64_t v4 = sub_246D2C474;
  }
  else {
    uint64_t v4 = sub_246D2C35C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_246D2C35C()
{
  uint64_t v2 = v0[39];
  unint64_t v1 = v0[40];
  swift_release();
  sub_246D2EFCC((uint64_t)(v0 + 17), &qword_26B121CD0);
  sub_246D2C514(v2, v1);
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_246D2C3FC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246D2C474()
{
  uint64_t v2 = v0[39];
  unint64_t v1 = v0[40];
  swift_release();
  sub_246D2EFCC((uint64_t)(v0 + 17), &qword_26B121CD0);
  sub_246D2C514(v2, v1);
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_246D2C514(uint64_t a1, unint64_t a2)
{
  if (qword_26B121CC0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_246D3E008();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B121D08);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_246D3DFE8();
  os_log_type_t v6 = sub_246D3E1B8();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(void *)&v10[0] = v8;
    *(_DWORD *)char v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_246D2D114(a1, a2, (uint64_t *)v10);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v5, v6, "TaskLimiter: cleaning up task for identifier %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v8, -1, -1);
    MEMORY[0x24C548150](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_246D2CE70((uint64_t)v10, a1, a2);
  return swift_endAccess();
}

uint64_t sub_246D2C70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  return MEMORY[0x270FA2498](sub_246D2C730, 0, 0);
}

uint64_t sub_246D2C730()
{
  sub_246D2D7E4(*(void *)(v0 + 96), v0 + 16);
  uint64_t v1 = *(void *)(v0 + 40);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
    uint64_t v3 = *(int **)(v2 + 16);
    *(void *)(v0 + 80) = swift_getAssociatedTypeWitness();
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 56));
    uint64_t v10 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t))((char *)v3 + *v3);
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_246D2C97C;
    return v10(boxed_opaque_existential_0, v1, v2);
  }
  else
  {
    sub_246D2EFCC(v0 + 16, &qword_26B121CD0);
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    char v7 = *(int **)(v0 + 104);
    sub_246D2EFCC(v0 + 56, &qword_26B121D00);
    uint64_t v11 = (uint64_t (*)(uint64_t))((char *)v7 + *v7);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_246D2CB88;
    uint64_t v9 = *(void *)(v0 + 88);
    return v11(v9);
  }
}

uint64_t sub_246D2C97C()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_246D2CC7C;
  }
  else {
    uint64_t v2 = sub_246D2CA90;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_246D2CA90()
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  uint64_t v1 = (int *)v0[13];
  sub_246D2EFCC((uint64_t)(v0 + 7), &qword_26B121D00);
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[17] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_246D2CB88;
  uint64_t v3 = v0[11];
  return v5(v3);
}

uint64_t sub_246D2CB88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_246D2CC7C()
{
  __swift_deallocate_boxed_opaque_existential_0(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246D2CCEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_246D3E178();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_246D3E168();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_246D2EFCC(a1, &qword_26B121CD8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_246D3E138();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_246D2CE70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_246D2DA70((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_246D2E5D4(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_246D2EFCC(a1, &qword_26B121CD0);
    sub_246D2DC9C(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_246D2EFCC((uint64_t)v9, &qword_26B121CD0);
  }
}

uint64_t TaskLimiter.deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t TaskLimiter.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_246D2CF80()
{
  return v0;
}

uint64_t TaskLimiters.limiter(key:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + 112);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 112);
  if (!*(void *)(v6 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_246D2D76C(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    type metadata accessor for TaskLimiter();
    uint64_t v9 = swift_allocObject();
    swift_defaultActor_initialize();
    *(void *)(v9 + 112) = MEMORY[0x263F8EE80];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    sub_246D2E72C(v9, a1, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v5 = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return v9;
  }
  uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t _s14ACSEFoundation11TaskLimiterCfD_0()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_246D2D114(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_246D2D1E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_246D2EF6C((uint64_t)v12, *a3);
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
      sub_246D2EF6C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_246D2D1E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_246D3E218();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_246D2D3A4(a5, a6);
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
  uint64_t v8 = sub_246D3E288();
  if (!v8)
  {
    sub_246D3E2E8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_246D3E338();
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

uint64_t sub_246D2D3A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_246D2D43C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_246D2D61C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_246D2D61C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246D2D43C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_246D2D5B4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_246D3E268();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_246D3E2E8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_246D3E108();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_246D3E338();
    __break(1u);
LABEL_14:
    uint64_t result = sub_246D3E2E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_246D2D5B4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2920);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_246D2D61C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2920);
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
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_246D3E338();
  __break(1u);
  return result;
}

unint64_t sub_246D2D76C(uint64_t a1, uint64_t a2)
{
  sub_246D3E438();
  sub_246D3E0E8();
  uint64_t v4 = sub_246D3E458();
  return sub_246D2DAF0(a1, a2, v4);
}

uint64_t sub_246D2D7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246D2D84C()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 64)) {
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 40);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_246D2D89C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246D2D904(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 80);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_246D2F12C;
  *(_OWORD *)(v4 + 104) = v5;
  *(void *)(v4 + 88) = a1;
  *(void *)(v4 + 96) = v1 + 40;
  return MEMORY[0x270FA2498](sub_246D2C730, 0, 0);
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

uint64_t sub_246D2DA0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_246D2DA70(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for TaskLimiter()
{
  return self;
}

unint64_t sub_246D2DAAC(uint64_t a1)
{
  uint64_t v2 = sub_246D3E238();
  return sub_246D2DBD4(a1, v2);
}

unint64_t sub_246D2DAF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_246D3E398() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_246D3E398() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_246D2DBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_246D2EA58(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C5478D0](v9, a1);
      sub_246D2EAB4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_246D2DC9C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_246D2D76C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_246D2EB78();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_246D2DA70((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_246D2E3E8(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_246D2DDA8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CE8);
  char v37 = a2;
  uint64_t v6 = sub_246D3E318();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    BOOL v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_246D2DA70(v25, (uint64_t)v38);
    }
    else
    {
      sub_246D2DA0C((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_246D3E438();
    sub_246D3E0E8();
    uint64_t result = sub_246D3E458();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *uint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_246D2DA70(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_246D2E0D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2918);
  char v36 = a2;
  uint64_t v6 = sub_246D3E318();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    BOOL v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_246D3E438();
    sub_246D3E0E8();
    uint64_t result = sub_246D3E458();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  BOOL v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *BOOL v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_246D2E3E8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_246D3E228();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_246D3E438();
        swift_bridgeObjectRetain();
        sub_246D3E0E8();
        uint64_t v11 = sub_246D3E458();
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
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          unint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *uint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          int64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
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

uint64_t sub_246D2E5D4(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_246D2D76C(a2, a3);
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
      sub_246D2EB78();
      goto LABEL_7;
    }
    sub_246D2DDA8(v15, a4 & 1);
    unint64_t v21 = sub_246D2D76C(a2, a3);
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
    uint64_t result = sub_246D3E3B8();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 40 * v12;
    __swift_destroy_boxed_opaque_existential_1Tm(v19);
    return sub_246D2DA70(a1, v19);
  }
LABEL_13:
  sub_246D2EB08(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_246D2E72C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_246D2D76C(a2, a3);
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
    sub_246D2ED64();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_246D2E0D0(v15, a4 & 1);
  unint64_t v21 = sub_246D2D76C(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_246D3E3B8();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  BOOL v23 = (uint64_t *)(v18[6] + 16 * v12);
  *BOOL v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for TaskLimiter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TaskLimiter);
}

uint64_t dispatch thunk of TaskLimiter.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of TaskLimiter.perform<A>(identifier:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v6 + 128)
                                                                                     + **(int **)(*(void *)v6 + 128));
  BOOL v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v14;
  *BOOL v14 = v7;
  v14[1] = sub_246D2B4BC;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t type metadata accessor for TaskLimiters()
{
  return self;
}

uint64_t method lookup function for TaskLimiters(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TaskLimiters);
}

uint64_t dispatch thunk of TaskLimiters.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_246D2EA58(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_246D2EAB4(uint64_t a1)
{
  return a1;
}

uint64_t sub_246D2EB08(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_246D2DA70(a4, a5[7] + 40 * a1);
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

void *sub_246D2EB78()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246D3E308();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v25 = v1;
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
    uint64_t v20 = 40 * v15;
    sub_246D2DA0C(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_246D2DA70(v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
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

void *sub_246D2ED64()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2918);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246D3E308();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_246D2EF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_246D2EFCC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

uint64_t __swift_deallocate_boxed_opaque_existential_0(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x24C548150);
  }
  return result;
}

void sub_246D2F13C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_246D3DF78();
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  MEMORY[0x270FA5388](v2);
  unint64_t v42 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246D3DFA8();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246D3DF28();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_246D3DFD8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v1, sel_aa_addClientInfoHeaders);
  objc_msgSend(v1, sel_aa_addMultiUserDeviceHeaderIfEnabled);
  unint64_t v15 = (void *)sub_246D3E068();
  objc_msgSend(v1, sel_aa_addContentTypeHeaders_, v15);

  objc_msgSend(v1, sel_ak_addDeviceUDIDHeader);
  id v16 = objc_msgSend(self, sel_systemTimeZone);
  sub_246D3DFC8();

  sub_246D3DF18();
  sub_246D3DFB8();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v18)
  {
    uint64_t v19 = (void *)sub_246D3E068();
    swift_bridgeObjectRelease();
    uint64_t v20 = (void *)sub_246D3E068();
    objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v19, v20);
  }
  id v21 = objc_msgSend(self, sel_currentInfo);
  if (!v21)
  {
    __break(1u);
    goto LABEL_8;
  }
  int64_t v22 = v21;
  id v23 = objc_msgSend(v21, sel_udid);

  int64_t v24 = (void *)sub_246D3E068();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v23, v24);

  id v25 = objc_msgSend(self, sel_currentLocale);
  sub_246D3DF98();

  uint64_t v26 = v42;
  sub_246D3DF88();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v41);
  sub_246D3DF68();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v26, v44);
  BOOL v27 = (void *)sub_246D3E068();
  swift_bridgeObjectRelease();
  uint64_t v28 = (void *)sub_246D3E068();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v27, v28);

  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v29, sel_setDateStyle_, 3);
  objc_msgSend(v29, sel_setTimeStyle_, 3);
  id v30 = objc_msgSend(v29, sel_dateFormat);
  if (!v30)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v31 = v30;
  sub_246D3E098();

  uint64_t v32 = (void *)sub_246D3E068();
  swift_bridgeObjectRelease();
  uint64_t v33 = (void *)sub_246D3E068();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v32, v33);

  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v34, sel_setDateStyle_, 1);
  objc_msgSend(v34, sel_setTimeStyle_, 1);
  id v35 = objc_msgSend(v34, sel_dateFormat);
  if (v35)
  {
    char v36 = v35;
    sub_246D3E098();

    char v37 = (void *)sub_246D3E068();
    swift_bridgeObjectRelease();
    uint64_t v38 = (void *)sub_246D3E068();
    objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v37, v38);

    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_246D2F798(uint64_t a1)
{
  *(void *)(v2 + 136) = a1;
  *(void *)(v2 + 144) = v1;
  return MEMORY[0x270FA2498](sub_246D2F7B8, 0, 0);
}

uint64_t sub_246D2F7B8()
{
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = (void *)v0[18];
  objc_msgSend(v1, sel_aa_needsEmailConfiguration);
  uint64_t v3 = (void *)sub_246D3E068();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_246D3E068();
  objc_msgSend(v2, sel_setValue_forHTTPHeaderField_, v3, v4);

  objc_msgSend(v1, sel_isEnabledForDataclass_, *MEMORY[0x263EFAC20]);
  uint64_t v5 = (void *)sub_246D3E068();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_246D3E068();
  objc_msgSend(v2, sel_setValue_forHTTPHeaderField_, v5, v6);

  objc_msgSend(v1, sel_isEnabledForDataclass_, *MEMORY[0x263EFAC58]);
  uint64_t v7 = (void *)sub_246D3E068();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_246D3E068();
  objc_msgSend(v2, sel_setValue_forHTTPHeaderField_, v7, v8);

  id v9 = objc_msgSend(self, sel_mainBundle);
  id v10 = objc_msgSend(v9, sel_bundleIdentifier);

  if (v10)
  {
    uint64_t v11 = sub_246D3E098();
    uint64_t v13 = v12;

    if (v11 == 0xD000000000000015 && v13 == 0x8000000246D3F730)
    {
      swift_bridgeObjectRelease();
LABEL_6:
      unint64_t v15 = (void *)sub_246D3E068();
      id v16 = objc_msgSend(self, sel_containerWithIdentifier_, v15);
      v0[19] = v16;

      v0[2] = v0;
      v0[7] = v0 + 15;
      v0[3] = sub_246D2FC64;
      uint64_t v17 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_246D301CC;
      v0[13] = &block_descriptor;
      v0[14] = v17;
      objc_msgSend(v16, sel_fetchCurrentDeviceIDWithCompletionHandler_, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    char v14 = sub_246D3E398();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_6;
    }
  }
  if (qword_26B121CC8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_246D3E008();
  __swift_project_value_buffer(v18, (uint64_t)qword_26B121D20);
  uint64_t v19 = sub_246D3DFE8();
  os_log_type_t v20 = sub_246D3E1C8();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v21 = 0;
    _os_log_impl(&dword_246D27000, v19, v20, "Caller is not running on Settings process. Bailing.", v21, 2u);
    MEMORY[0x24C548150](v21, -1, -1);
  }

  int64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_246D2FC64()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_246D2FFB0;
  }
  else {
    uint64_t v2 = sub_246D2FD74;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_246D2FD74()
{
  unint64_t v15 = v0;
  uint64_t v2 = v0[15];
  unint64_t v1 = v0[16];
  if (qword_26B121CC8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_246D3E008();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B121D20);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_246D3DFE8();
  os_log_type_t v5 = sub_246D3E1B8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v14 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_bridgeObjectRetain();
    v0[10] = sub_246D2D114(v2, v1, &v14);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v4, v5, "iCloud backup device id: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v7, -1, -1);
    MEMORY[0x24C548150](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v8 = (void *)v0[18];
  id v9 = (void *)v0[19];
  id v10 = (void *)sub_246D3E068();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_246D3E068();
  objc_msgSend(v8, sel_setValue_forHTTPHeaderField_, v10, v11);

  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_246D2FFB0()
{
  swift_willThrow();
  if (qword_26B121CC8 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void **)(v0 + 160);
  uint64_t v2 = sub_246D3E008();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B121D20);
  id v3 = v1;
  id v4 = v1;
  os_log_type_t v5 = sub_246D3DFE8();
  os_log_type_t v6 = sub_246D3E1C8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 160);
  if (v7)
  {
    unint64_t v15 = *(void **)(v0 + 152);
    id v9 = (uint8_t *)swift_slowAlloc();
    id v10 = (void *)swift_slowAlloc();
    *(_DWORD *)id v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v12;
    sub_246D3E208();
    *id v10 = v12;

    _os_log_impl(&dword_246D27000, v5, v6, "Failed to fetch iCloud backup device id w/ error: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2930);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v10, -1, -1);
    MEMORY[0x24C548150](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_246D301CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CF8);
    uint64_t v5 = swift_allocError();
    *os_log_type_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    uint64_t v8 = sub_246D3E098();
    id v9 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *id v9 = v8;
    v9[1] = v10;
    return MEMORY[0x270FA2408](v3);
  }
}

void sub_246D30288(void *a1)
{
  if (a1 && objc_msgSend(a1, sel_signURLRequest_isUserInitiated_, v1, 1))
  {
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_246D3E008();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B121D20);
    oslog = sub_246D3DFE8();
    os_log_type_t v3 = sub_246D3E1D8();
    if (os_log_type_enabled(oslog, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      uint64_t v5 = "GS Request signed successfully!";
LABEL_11:
      _os_log_impl(&dword_246D27000, oslog, v3, v5, v4, 2u);
      MEMORY[0x24C548150](v4, -1, -1);
    }
  }
  else
  {
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_246D3E008();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B121D20);
    oslog = sub_246D3DFE8();
    os_log_type_t v3 = sub_246D3E1C8();
    if (os_log_type_enabled(oslog, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      uint64_t v5 = "Unable to sign grandslam request";
      goto LABEL_11;
    }
  }
}

uint64_t sub_246D3041C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_aa_personID);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_246D3E098();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  uint64_t result = (uint64_t)objc_msgSend(self, sel_defaultStore);
  if (result)
  {
    id v7 = (void *)result;
    id v8 = objc_msgSend((id)result, sel_aa_primaryAppleAccount);

    uint64_t v9 = 0x65736C6166;
    if (v8)
    {
      id v10 = objc_msgSend(v8, sel_aa_personID);

      if (v10)
      {
        uint64_t v11 = sub_246D3E098();
        uint64_t v13 = v12;

        if (v5)
        {
          if (v11 != v3 || v5 != v13)
          {
            char v15 = sub_246D3E398();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v15) {
              return 1702195828;
            }
            return v9;
          }
          swift_bridgeObjectRelease();
          uint64_t v9 = 1702195828;
        }
      }
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

unint64_t sub_246D305A0(unsigned __int8 a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2898);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246D3EEB0;
  *(void *)(inited + 32) = sub_246D3E098();
  *(void *)(inited + 40) = v3;
  unint64_t v4 = 0xD000000000000012;
  unint64_t v5 = 0xD000000000000014;
  unint64_t v6 = 0x8000000246D3FB50;
  unint64_t v7 = 0x8000000246D3FAB0;
  unint64_t v8 = 0x8000000246D3F9A0;
  uint64_t v9 = a1;
  unint64_t v10 = 0xD000000000000015;
  switch(v9)
  {
    case 1:
      unint64_t v5 = 0xD000000000000018;
      unint64_t v10 = 0xD000000000000019;
      unint64_t v4 = 0xD000000000000022;
      unint64_t v6 = 0x8000000246D3FB30;
      unint64_t v7 = 0x8000000246D3FA90;
      uint64_t v11 = "Unable to retrieve BAA certificate";
      goto LABEL_8;
    case 2:
      unint64_t v5 = 0xD000000000000018;
      unint64_t v10 = 0xD00000000000001ALL;
      unint64_t v4 = 0xD000000000000020;
      unint64_t v6 = 0x8000000246D3FB30;
      unint64_t v7 = 0x8000000246D3FA70;
      uint64_t v11 = "Unable to retrieve reference key";
      goto LABEL_8;
    case 3:
      unint64_t v10 = 0xD000000000000022;
      unint64_t v7 = 0x8000000246D3FA40;
      unint64_t v8 = 0x8000000246D3F920;
      unint64_t v6 = 0xEC00000072616461;
      unint64_t v5 = 0x72206120656C6966;
      unint64_t v4 = 0xD000000000000015;
      break;
    case 4:
      unint64_t v10 = 0xD00000000000001ELL;
      unint64_t v4 = 0xD000000000000026;
      unint64_t v6 = 0x8000000246D3FB10;
      unint64_t v7 = 0x8000000246D3FA20;
      unint64_t v8 = 0x8000000246D3F8F0;
      unint64_t v5 = 0xD000000000000015;
      break;
    case 5:
      unint64_t v10 = 0xD00000000000001CLL;
      unint64_t v4 = 0xD00000000000001ELL;
      unint64_t v6 = 0x8000000246D3FAF0;
      unint64_t v7 = 0x8000000246D3FA00;
      unint64_t v8 = 0x8000000246D3F8D0;
      unint64_t v5 = 0xD00000000000001CLL;
      break;
    case 6:
      unint64_t v5 = 0xD00000000000001FLL;
      unint64_t v4 = 0xD00000000000002ELL;
      unint64_t v10 = 0xD000000000000038;
      unint64_t v6 = 0x8000000246D3FAD0;
      unint64_t v7 = 0x8000000246D3F9C0;
      uint64_t v11 = "This platform is not supported for BAA signing";
LABEL_8:
      unint64_t v8 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  uint64_t v12 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v8;
  *(void *)(inited + 80) = sub_246D3E098();
  *(void *)(inited + 88) = v13;
  *(void *)(inited + 120) = v12;
  *(void *)(inited + 96) = v10;
  *(void *)(inited + 104) = v7;
  *(void *)(inited + 128) = sub_246D3E098();
  *(void *)(inited + 136) = v14;
  *(void *)(inited + 168) = v12;
  *(void *)(inited + 144) = v5;
  *(void *)(inited + 152) = v6;
  return sub_246D2A650(inited);
}

uint64_t sub_246D30864(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  unint64_t v6 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  if (a3) {
    uint64_t v7 = sub_246D3E118();
  }
  else {
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v6(a2, v7, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t BAARequestSigner.date.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_246D2ADC8(v1 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_date, a1, &qword_2691E2938);
}

id BAARequestSigner.__allocating_init(date:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2938);
  MEMORY[0x270FA5388]();
  unint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone(v1);
  sub_246D2ADC8(a1, (uint64_t)v4, &qword_2691E2938);
  unint64_t v5 = (objc_class *)type metadata accessor for BAARequestSigner();
  memset(v9, 0, sizeof(v9));
  uint64_t v10 = 0;
  id v6 = objc_allocWithZone(v5);
  id v7 = sub_246D30ED0((uint64_t)v4, (uint64_t)v9);
  sub_246D2EFCC(a1, &qword_2691E2938);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

id BAARequestSigner.init(date:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2938);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246D2ADC8(a1, (uint64_t)v3, &qword_2691E2938);
  unint64_t v4 = (objc_class *)type metadata accessor for BAARequestSigner();
  memset(v8, 0, sizeof(v8));
  uint64_t v9 = 0;
  id v5 = objc_allocWithZone(v4);
  id v6 = sub_246D30ED0((uint64_t)v3, (uint64_t)v8);
  sub_246D2EFCC(a1, &qword_2691E2938);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

uint64_t type metadata accessor for BAARequestSigner()
{
  uint64_t result = qword_2691E2990;
  if (!qword_2691E2990) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_246D30ED0(uint64_t a1, uint64_t a2)
{
  sub_246D2ADC8(a1, (uint64_t)v2 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_date, &qword_2691E2938);
  sub_246D2ADC8(a2, (uint64_t)&v10, &qword_2691E2A30);
  if (v11)
  {
    sub_246D2DA70(&v10, (uint64_t)&v12);
    id v5 = v2;
  }
  else
  {
    uint64_t v13 = &type metadata for DeviceIdentityCertificateFetcher;
    uint64_t v14 = &off_26FB3F220;
    id v6 = v2;
    sub_246D2EFCC((uint64_t)&v10, &qword_2691E2A30);
  }
  sub_246D2DA70(&v12, (uint64_t)v2 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_baaCertificateFetcher);

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for BAARequestSigner();
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  sub_246D2EFCC(a2, &qword_2691E2A30);
  sub_246D2EFCC(a1, &qword_2691E2938);
  return v7;
}

uint64_t sub_246D30FD0(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CB0);
  v3[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_246D31068, 0, 0);
}

uint64_t sub_246D31068()
{
  uint64_t v1 = v0[11];
  sub_246D3DDF8();
  uint64_t v2 = sub_246D3DE88();
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[11];
  if (v4 == 1)
  {
    sub_246D2EFCC(v0[11], &qword_26B121CB0);
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_246D3E008();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B121D20);
    id v7 = sub_246D3DFE8();
    os_log_type_t v8 = sub_246D3E1C8();
    if (os_log_type_enabled(v7, v8))
    {
      objc_super v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl(&dword_246D27000, v7, v8, "Attempted to BAA sign request with no path", v9, 2u);
      MEMORY[0x24C548150](v9, -1, -1);
    }

    sub_246D2AD64();
    swift_allocError();
    *long long v10 = 0;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
  else
  {
    uint64_t v14 = v0[8];
    uint64_t v13 = v0[9];
    uint64_t v15 = sub_246D3DE68();
    uint64_t v17 = v16;
    v0[12] = v16;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v18 = sub_246D3DE18();
    v0[13] = v18;
    uint64_t v19 = *(void *)(v18 - 8);
    v0[14] = v19;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v14, v13, v18);
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_246D3E008();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B121D20);
    id v21 = sub_246D3DFE8();
    os_log_type_t v22 = sub_246D3E1B8();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v23 = 0;
      _os_log_impl(&dword_246D27000, v21, v22, "Fetching BAA signing credentials", v23, 2u);
      MEMORY[0x24C548150](v23, -1, -1);
    }
    uint64_t v24 = v0[10];

    uint64_t v25 = v24 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_date;
    uint64_t v26 = v24 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_baaCertificateFetcher;
    BOOL v27 = (void *)swift_task_alloc();
    v0[15] = v27;
    v27[2] = v26;
    v27[3] = v25;
    v27[4] = v15;
    v27[5] = v17;
    uint64_t v28 = (void *)swift_task_alloc();
    v0[16] = v28;
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2950);
    *uint64_t v28 = v0;
    v28[1] = sub_246D31478;
    return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD00000000000002ELL, 0x8000000246D3F840, sub_246D337BC, v27, v29);
  }
}

uint64_t sub_246D31478()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_246D31794;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_246D31594;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_246D31594()
{
  swift_bridgeObjectRelease();
  unint64_t v15 = v0[3];
  uint64_t v16 = v0[2];
  unint64_t v13 = v0[5];
  uint64_t v14 = v0[4];
  uint64_t v1 = (__SecCertificate *)v0[6];
  uint64_t v2 = (__SecCertificate *)v0[7];
  sub_246D3DEA8();
  sub_246D3DE08();
  swift_bridgeObjectRelease();
  sub_246D3DEA8();
  sub_246D3DE08();
  swift_bridgeObjectRelease();
  CFDataRef v3 = SecCertificateCopyData(v1);
  uint64_t v4 = sub_246D3DEB8();
  unint64_t v6 = v5;

  uint64_t v17 = v4;
  unint64_t v18 = v6;
  CFDataRef v7 = SecCertificateCopyData(v2);
  uint64_t v8 = sub_246D3DEB8();
  unint64_t v10 = v9;

  sub_246D3DEC8();
  sub_246D337C8(v17, v18);
  sub_246D3DEA8();
  sub_246D33820(v17, v18);
  sub_246D3DE08();
  swift_bridgeObjectRelease();
  sub_246D33820(v8, v10);

  sub_246D33820(v14, v13);
  sub_246D33820(v16, v15);
  sub_246D33820(v17, v18);
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_246D31794()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[8];
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_246D319AC(uint64_t a1, const void *a2, void *a3)
{
  v3[2] = a3;
  uint64_t v6 = sub_246D3DE18();
  v3[3] = v6;
  v3[4] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v3[5] = v7;
  uint64_t v8 = swift_task_alloc();
  v3[6] = v8;
  v3[7] = _Block_copy(a2);
  sub_246D3DDE8();
  a3;
  unint64_t v9 = (void *)swift_task_alloc();
  v3[8] = v9;
  *unint64_t v9 = v3;
  v9[1] = sub_246D31AFC;
  return sub_246D30FD0(v8, v7);
}

uint64_t sub_246D31AFC()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void *)(*v1 + 32);
  uint64_t v5 = *(void *)(*v1 + 24);
  uint64_t v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v8(v3, v5);

  if (v0)
  {
    uint64_t v9 = sub_246D3DE48();

    uint64_t v10 = 0;
    uint64_t v11 = (void *)v9;
  }
  else
  {
    uint64_t v12 = v2[6];
    uint64_t v13 = v2[3];
    uint64_t v10 = sub_246D3DDD8();
    v8(v12, v13);
    uint64_t v9 = 0;
    uint64_t v11 = (void *)v10;
  }
  uint64_t v14 = (void (**)(void, void, void))v2[7];
  v14[2](v14, v10, v9);

  _Block_release(v14);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v15 = *(uint64_t (**)(void))(v7 + 8);
  return v15();
}

void sub_246D31D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  uint64_t v40 = a3;
  uint64_t v37 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2938);
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v38 = *(void *)(v39 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v36 = (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
  uint64_t v7 = *(void *)(v35 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v35);
  id v34 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246D3E028();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246D3EEB0;
  uint64_t v43 = sub_246D3E098();
  uint64_t v44 = v14;
  uint64_t v15 = MEMORY[0x263F8D310];
  sub_246D3E258();
  *(void *)(inited + 96) = v15;
  *(void *)(inited + 72) = 4608835;
  *(void *)(inited + 80) = 0xE300000000000000;
  uint64_t v43 = sub_246D3E098();
  uint64_t v44 = v16;
  sub_246D3E258();
  *(void *)(inited + 168) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 144) = 129600;
  uint64_t v43 = sub_246D3E098();
  uint64_t v44 = v17;
  sub_246D3E258();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A10);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_246D3F000;
  *(void *)(v18 + 32) = sub_246D3E098();
  *(void *)(v18 + 40) = v19;
  *(void *)(v18 + 48) = sub_246D3E098();
  *(void *)(v18 + 56) = v20;
  *(void *)(inited + 240) = __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A18);
  *(void *)(inited + 216) = v18;
  unint64_t v33 = sub_246D2A788(inited);
  sub_246D34884();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F8F080], v9);
  id v21 = (void *)sub_246D3E1E8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  os_log_type_t v22 = v34;
  uint64_t v23 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v34, v37, v35);
  uint64_t v24 = v36;
  sub_246D2ADC8(v40, v36, &qword_2691E2938);
  unint64_t v25 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v26 = (v8 + *(unsigned __int8 *)(v39 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  unint64_t v27 = (v38 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v28 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v28 + v25, v22, v23);
  sub_246D34A84(v24, v28 + v26);
  uint64_t v29 = (void *)(v28 + v27);
  uint64_t v30 = v42;
  *uint64_t v29 = v41;
  v29[1] = v30;
  swift_bridgeObjectRetain();
  uint64_t v31 = (void *)sub_246D3E038();
  uint64_t v47 = sub_246D34AEC;
  uint64_t v48 = v28;
  uint64_t v43 = MEMORY[0x263EF8330];
  uint64_t v44 = 1107296256;
  v45 = sub_246D30864;
  uint64_t v46 = &block_descriptor_1;
  uint64_t v32 = _Block_copy(&v43);
  swift_retain();
  swift_release();
  DeviceIdentityIssueClientCertificateWithCompletion();
  _Block_release(v32);
  swift_release();

  swift_bridgeObjectRelease();
}

void sub_246D3220C(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, __SecKey *a6, __SecKey *a7)
{
  v106[2] = a7;
  v106[1] = a6;
  uint64_t v109 = a4;
  error[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  uint64_t v11 = sub_246D3E0C8();
  v107 = *(uint8_t **)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = sub_246D3DF28();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  CFDataRef Signature = (CFDataRef)((char *)v106 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2938);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v108 = a1;
  if (a1)
  {
    if (a3)
    {
      id v21 = v108;
      id v22 = v108;
      id v23 = a3;
      if (qword_26B121CC8 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_246D3E008();
      __swift_project_value_buffer(v24, (uint64_t)qword_26B121D20);
      id v25 = a3;
      id v26 = a3;
      unint64_t v27 = sub_246D3DFE8();
      os_log_type_t v28 = sub_246D3E1C8();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        uint64_t v111 = v30;
        *(_DWORD *)uint64_t v29 = 136315138;
        swift_getErrorValue();
        uint64_t v31 = sub_246D3E3E8();
        error[0] = (CFErrorRef)sub_246D2D114(v31, v32, &v111);
        sub_246D3E208();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_246D27000, v27, v28, "Unable to get BAA certificates. Error: %s", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C548150](v30, -1, -1);
        MEMORY[0x24C548150](v29, -1, -1);
      }
      else
      {
      }
      sub_246D2AD64();
      uint64_t v47 = swift_allocError();
      *uint64_t v48 = 1;
      uint64_t v111 = v47;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
      sub_246D3E148();

      goto LABEL_32;
    }
    if (!a2)
    {
      id v57 = v108;
      goto LABEL_27;
    }
    uint64_t v43 = (__SecKey *)v108;
    unint64_t v44 = sub_246D330C8(a2);
    if (!v44)
    {
LABEL_27:
      if (qword_26B121CC8 != -1) {
        swift_once();
      }
      uint64_t v58 = sub_246D3E008();
      __swift_project_value_buffer(v58, (uint64_t)qword_26B121D20);
      uint64_t v59 = sub_246D3DFE8();
      os_log_type_t v60 = sub_246D3E1C8();
      BOOL v61 = os_log_type_enabled(v59, v60);
      id v21 = v108;
      if (v61)
      {
        uint64_t v62 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v62 = 0;
        _os_log_impl(&dword_246D27000, v59, v60, "Unable to get BAA certificates. Unknown error.", v62, 2u);
        MEMORY[0x24C548150](v62, -1, -1);
      }

      sub_246D2AD64();
      uint64_t v63 = swift_allocError();
      *uint64_t v64 = 1;
      uint64_t v111 = v63;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
      sub_246D3E148();
      goto LABEL_32;
    }
    unint64_t v45 = v44;
    v106[0] = v43;
    uint64_t v46 = v44 & 0xFFFFFFFFFFFFFF8;
    if (v44 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_246D3E2F8();
      swift_bridgeObjectRelease();
      if (v65 < 2) {
        goto LABEL_16;
      }
    }
    else if (*(uint64_t *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2)
    {
LABEL_16:
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    sub_246D2ADC8(a5, (uint64_t)v20, &qword_2691E2938);
    if ((*(unsigned int (**)(char *, uint64_t, unint64_t))(v15 + 48))(v20, 1, v14) == 1)
    {
      sub_246D2EFCC((uint64_t)v20, &qword_2691E2938);
      sub_246D3DF08();
      uint64_t v20 = (char *)Signature;
    }
    sub_246D3DEE8();
    double v67 = v66;
    uint64_t v69 = *(void (**)(char *, unint64_t))(v15 + 8);
    uint64_t v68 = v15 + 8;
    v69(v20, v14);
    double v70 = v67 * 1000.0;
    if ((~COERCE__INT64(v67 * 1000.0) & 0x7FF0000000000000) != 0)
    {
      if (v70 > -1.0)
      {
        if (v70 < 1.84467441e19)
        {
          uint64_t v111 = (unint64_t)v70;
          uint64_t v111 = sub_246D3E358();
          unint64_t v112 = v71;
          swift_bridgeObjectRetain();
          sub_246D3E0F8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_246D3E0F8();
          swift_bridgeObjectRelease();
          sub_246D3E0B8();
          uint64_t v68 = sub_246D3E0A8();
          unint64_t v14 = v72;
          swift_bridgeObjectRelease();
          (*((void (**)(char *, uint64_t))v107 + 1))(v13, v11);
          if (v14 >> 60 == 15)
          {
            swift_bridgeObjectRelease();
            sub_246D2AD64();
            uint64_t v73 = swift_allocError();
            *uint64_t v74 = 4;
            uint64_t v111 = v73;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
            sub_246D3E148();
            SecKeyRef v75 = v106[0];

            return;
          }
          error[0] = 0;
          CFStringRef v76 = (const __CFString *)*MEMORY[0x263F172E8];
          CFDataRef v77 = (const __CFData *)sub_246D3DE98();
          CFDataRef Signature = SecKeyCreateSignature(v106[0], v76, v77, error);

          if (!Signature)
          {
            swift_bridgeObjectRelease();
            CFErrorRef v83 = error[0];
            if (!error[0])
            {
              if (qword_26B121CC8 != -1) {
                swift_once();
              }
              uint64_t v98 = sub_246D3E008();
              __swift_project_value_buffer(v98, (uint64_t)qword_26B121D20);
              v99 = sub_246D3DFE8();
              os_log_type_t v100 = sub_246D3E1C8();
              if (os_log_type_enabled(v99, v100))
              {
                v101 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v101 = 0;
                _os_log_impl(&dword_246D27000, v99, v100, "BAA signature was empty", v101, 2u);
                MEMORY[0x24C548150](v101, -1, -1);
              }

              sub_246D2AD64();
              uint64_t v102 = swift_allocError();
              unsigned char *v103 = 3;
              uint64_t v111 = v102;
              __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
              sub_246D3E148();
              sub_246D34C28(v68, v14);
              id v21 = v108;
              goto LABEL_32;
            }
            if (qword_26B121CC8 == -1) {
              goto LABEL_52;
            }
            goto LABEL_69;
          }
          if (qword_26B121CC8 == -1)
          {
LABEL_43:
            uint64_t v78 = sub_246D3E008();
            __swift_project_value_buffer(v78, (uint64_t)qword_26B121D20);
            v79 = sub_246D3DFE8();
            os_log_type_t v80 = sub_246D3E1B8();
            if (os_log_type_enabled(v79, v80))
            {
              v81 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v81 = 0;
              _os_log_impl(&dword_246D27000, v79, v80, "Successfully fetched BAA signing credentials", v81, 2u);
              MEMORY[0x24C548150](v81, -1, -1);
            }

            sub_246D34C94(v68, v14);
            CFDataRef v82 = Signature;
            CFErrorRef v83 = (CFErrorRef)sub_246D3DEB8();
            uint64_t v85 = v84;

            if ((v45 & 0xC000000000000001) != 0)
            {
              id v88 = (id)MEMORY[0x24C547900](0, v45);
              id v89 = (id)MEMORY[0x24C547900](1, v45);
              goto LABEL_49;
            }
            uint64_t v86 = *(void *)(v46 + 16);
            if (v86)
            {
              if (v86 != 1)
              {
                v87 = *(void **)(v45 + 40);
                id v88 = *(id *)(v45 + 32);
                id v89 = v87;
LABEL_49:
                id v90 = v89;
                swift_bridgeObjectRelease();
                uint64_t v111 = v68;
                unint64_t v112 = v14;
                CFErrorRef v113 = v83;
                uint64_t v114 = v85;
                id v115 = v88;
                id v116 = v90;
                __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
                sub_246D3E158();
LABEL_61:
                sub_246D34C28(v68, v14);

                id v21 = v108;
LABEL_32:

                return;
              }
            }
            else
            {
              __break(1u);
            }
            __break(1u);
LABEL_69:
            swift_once();
LABEL_52:
            uint64_t v91 = sub_246D3E008();
            __swift_project_value_buffer(v91, (uint64_t)qword_26B121D20);
            CFDataRef v82 = v83;
            v92 = sub_246D3DFE8();
            os_log_type_t v93 = sub_246D3E1C8();
            if (os_log_type_enabled(v92, v93))
            {
              v94 = (uint8_t *)swift_slowAlloc();
              uint64_t v95 = swift_slowAlloc();
              uint64_t v111 = v95;
              *(_DWORD *)v94 = 136315138;
              v107 = v94 + 4;
              uint64_t v110 = (uint64_t)v82;
              type metadata accessor for CFError(0);
              sub_246D34C3C();
              uint64_t v96 = sub_246D3E3E8();
              uint64_t v110 = sub_246D2D114(v96, v97, &v111);
              sub_246D3E208();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_246D27000, v92, v93, "Unable to create BAA signature: %s", v94, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x24C548150](v95, -1, -1);
              MEMORY[0x24C548150](v94, -1, -1);
            }
            else
            {
            }
            sub_246D2AD64();
            uint64_t v104 = swift_allocError();
            unsigned char *v105 = 5;
            uint64_t v111 = v104;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
            sub_246D3E148();
            goto LABEL_61;
          }
LABEL_65:
          swift_once();
          goto LABEL_43;
        }
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_64;
  }
  if (a3)
  {
    id v33 = a3;
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_246D3E008();
    __swift_project_value_buffer(v34, (uint64_t)qword_26B121D20);
    id v35 = a3;
    id v36 = a3;
    uint64_t v37 = sub_246D3DFE8();
    os_log_type_t v38 = sub_246D3E1C8();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v111 = v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      swift_getErrorValue();
      uint64_t v41 = sub_246D3E3E8();
      error[0] = (CFErrorRef)sub_246D2D114(v41, v42, &v111);
      sub_246D3E208();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_246D27000, v37, v38, "Unable to get BAA signing keys. Error: %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v40, -1, -1);
      MEMORY[0x24C548150](v39, -1, -1);
    }
    else
    {
    }
    sub_246D2AD64();
    uint64_t v55 = swift_allocError();
    *uint64_t v56 = 2;
    uint64_t v111 = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
    sub_246D3E148();
  }
  else
  {
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_246D3E008();
    __swift_project_value_buffer(v49, (uint64_t)qword_26B121D20);
    uint64_t v50 = sub_246D3DFE8();
    os_log_type_t v51 = sub_246D3E1C8();
    if (os_log_type_enabled(v50, v51))
    {
      os_log_type_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v52 = 0;
      _os_log_impl(&dword_246D27000, v50, v51, "Unable to get BAA signing keys. Unknown error.", v52, 2u);
      MEMORY[0x24C548150](v52, -1, -1);
    }

    sub_246D2AD64();
    uint64_t v53 = swift_allocError();
    *unint64_t v54 = 2;
    uint64_t v111 = v53;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
    sub_246D3E148();
  }
}

uint64_t sub_246D330C8(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_246D3E2B8();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_246D2EF6C(i, (uint64_t)v5);
    type metadata accessor for SecCertificate(0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_246D3E298();
    sub_246D3E2C8();
    sub_246D3E2D8();
    sub_246D3E2A8();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

id BAARequestSigner.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void BAARequestSigner.init()()
{
}

id BAARequestSigner.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BAARequestSigner();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246D332E4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_246D2B4BC;
  return sub_246D30FD0(a1, a2);
}

unint64_t RequestSigningError.errorDescription.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000022;
      break;
    case 2:
      unint64_t result = 0xD000000000000020;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0xD000000000000026;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 6:
      unint64_t result = 0xD00000000000002ELL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t RequestSigningError.failureReason.getter()
{
  unint64_t result = 0xD000000000000015;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 3:
      unint64_t result = 0xD000000000000022;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 5:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 6:
      unint64_t result = 0xD000000000000038;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t RequestSigningError.recoverySuggestion.getter()
{
  unint64_t result = 0xD000000000000014;
  switch(*v0)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0x72206120656C6966;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 6:
      unint64_t result = 0xD00000000000001FLL;
      break;
    default:
      return result;
  }
  return result;
}

ACSEFoundation::RequestSigningError_optional __swiftcall RequestSigningError.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 7;
  if ((unint64_t)rawValue < 7) {
    char v2 = rawValue;
  }
  *id v1 = v2;
  return (ACSEFoundation::RequestSigningError_optional)rawValue;
}

void *static RequestSigningError.allCases.getter()
{
  return &unk_26FB3EF30;
}

uint64_t RequestSigningError.rawValue.getter()
{
  return *v0;
}

BOOL sub_246D33608(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_246D3361C()
{
  return sub_246D3E458();
}

uint64_t sub_246D33664()
{
  return sub_246D3E448();
}

uint64_t sub_246D33690()
{
  return sub_246D3E458();
}

ACSEFoundation::RequestSigningError_optional sub_246D336D4(Swift::Int *a1)
{
  return RequestSigningError.init(rawValue:)(*a1);
}

void sub_246D336DC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_246D336F4()
{
  return *v0;
}

unint64_t sub_246D33704()
{
  return sub_246D305A0(*v0);
}

void sub_246D3370C(void *a1@<X8>)
{
  *a1 = &unk_26FB3EF30;
}

uint64_t sub_246D3371C(uint64_t a1)
{
  unint64_t v2 = sub_246D33900();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_246D33758(uint64_t a1)
{
  unint64_t v2 = sub_246D33900();
  unint64_t v3 = sub_246D347DC();
  unint64_t v4 = sub_246D34830();
  return MEMORY[0x270EF2658](a1, v2, v3, v4);
}

void sub_246D337BC(uint64_t a1)
{
  sub_246D31D04(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_246D337C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_246D33820(uint64_t a1, unint64_t a2)
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

unint64_t sub_246D3387C()
{
  unint64_t result = qword_2691E2960;
  if (!qword_2691E2960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691E2960);
  }
  return result;
}

unint64_t sub_246D338D0(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_246D33900();
  unint64_t result = sub_246D33954();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_246D33900()
{
  unint64_t result = qword_2691E2968;
  if (!qword_2691E2968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691E2968);
  }
  return result;
}

unint64_t sub_246D33954()
{
  unint64_t result = qword_2691E2970;
  if (!qword_2691E2970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691E2970);
  }
  return result;
}

unint64_t sub_246D339B0()
{
  unint64_t result = qword_2691E2978;
  if (!qword_2691E2978)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2691E2980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691E2978);
  }
  return result;
}

uint64_t dispatch thunk of RequestSigning.sign(request:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_246D2B4BC;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_246D33B1C()
{
  return type metadata accessor for BAARequestSigner();
}

void sub_246D33B24()
{
  sub_246D33CF4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for BAARequestSigner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BAARequestSigner);
}

uint64_t dispatch thunk of BAARequestSigner.sign(request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x68);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_246D2F12C;
  return v9(a1, a2);
}

void sub_246D33CF4()
{
  if (!qword_2691E29A8)
  {
    sub_246D3DF28();
    unint64_t v0 = sub_246D3E1F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2691E29A8);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequestSigningError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RequestSigningError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x246D33EB8);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_246D33EE0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_246D33EEC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RequestSigningError()
{
  return &type metadata for RequestSigningError;
}

uint64_t sub_246D33F04()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246D33F4C()
{
  uint64_t v2 = v0[2];
  int v3 = (const void *)v0[3];
  unsigned int v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_246D2B4BC;
  unsigned int v6 = (uint64_t (*)(uint64_t, const void *, void *))((char *)&dword_2691E29B0 + dword_2691E29B0);
  return v6(v2, v3, v4);
}

uint64_t sub_246D34000(uint64_t a1, uint64_t a2, int *a3)
{
  unsigned int v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *unsigned int v4 = v3;
  v4[1] = sub_246D2F12C;
  return v6();
}

uint64_t sub_246D340D0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unsigned int v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_246D2F12C;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2691E29C0 + dword_2691E29C0);
  return v6(v2, v3, v4);
}

uint64_t sub_246D34190(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_246D2F12C;
  return v7();
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_246D342A0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_246D2F12C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2691E29D0 + dword_2691E29D0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_246D3436C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246D3E178();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_246D3E168();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246D2EFCC(a1, &qword_26B121CD8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_246D3E138();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_246D34518(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_246D345F4;
  return v6(a1);
}

uint64_t sub_246D345F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_246D346EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246D34724(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_246D2F12C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2691E29E0 + dword_2691E29E0);
  return v6(a1, v4);
}

unint64_t sub_246D347DC()
{
  unint64_t result = qword_2691E29F0;
  if (!qword_2691E29F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691E29F0);
  }
  return result;
}

unint64_t sub_246D34830()
{
  unint64_t result = qword_2691E29F8;
  if (!qword_2691E29F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691E29F8);
  }
  return result;
}

unint64_t sub_246D34884()
{
  unint64_t result = qword_2691E2A20;
  if (!qword_2691E2A20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2691E2A20);
  }
  return result;
}

uint64_t sub_246D348C4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2691E2938) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v10 = sub_246D3DF28();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v0 + v8, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0 + v8, v10);
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v9 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v3 | v7 | 7);
}

uint64_t sub_246D34A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2938);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_246D34AEC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A00) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2691E2938) - 8);
  unint64_t v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v3 + v11;
  uint64_t v13 = (__SecKey **)(v3 + ((*(void *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  sub_246D3220C(a1, a2, a3, v3 + v8, v12, v14, v15);
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

uint64_t sub_246D34C28(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_246D33820(a1, a2);
  }
  return a1;
}

unint64_t sub_246D34C3C()
{
  unint64_t result = qword_2691E2A28;
  if (!qword_2691E2A28)
  {
    type metadata accessor for CFError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691E2A28);
  }
  return result;
}

uint64_t sub_246D34C94(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_246D337C8(a1, a2);
  }
  return a1;
}

ValueMetadata *type metadata accessor for DeviceIdentityCertificateFetcher()
{
  return &type metadata for DeviceIdentityCertificateFetcher;
}

char *initializeBufferWithCopyOfBuffer for NetworkError(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v8 = *a2;
    *(void *)a1 = *a2;
    a1 = &v8[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
        uint64_t v10 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v10;
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v9 = sub_246D3DE18();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        break;
      default:
        uint64_t v6 = *a2;
        *(void *)a1 = *a2;
        uint64_t v7 = v6;
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for NetworkError(void **a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v2 = *a1;

      break;
    case 1u:
    case 2u:
      swift_bridgeObjectRelease();
      break;
    case 3u:
      uint64_t v3 = sub_246D3DE18();
      uint64_t v4 = *(void (**)(void **, uint64_t))(*(void *)(v3 - 8) + 8);
      v4(a1, v3);
      break;
    default:
      return;
  }
}

void *initializeWithCopy for NetworkError(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
      break;
    case 3u:
      uint64_t v6 = sub_246D3DE18();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      break;
    default:
      uint64_t v4 = (void *)*a2;
      *a1 = *a2;
      id v5 = v4;
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for NetworkError(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_246D3515C((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v6 = sub_246D3DE18();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        break;
      default:
        uint64_t v4 = (void *)*a2;
        *a1 = *a2;
        id v5 = v4;
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_246D3515C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkError();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for NetworkError()
{
  uint64_t result = qword_2691E2A38;
  if (!qword_2691E2A38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *initializeWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    uint64_t v6 = sub_246D3DE18();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_246D3515C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v6 = sub_246D3DE18();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_246D353D8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_246D353E8()
{
  uint64_t result = sub_246D3DE18();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_246D35488()
{
  id v0 = objc_allocWithZone(NSString);
  unint64_t v1 = (void *)sub_246D3E068();
  id v2 = objc_msgSend(v0, sel_initWithString_, v1);

  sub_246D3E098();
  uint64_t v3 = sub_246D3E068();

  uint64_t result = swift_bridgeObjectRelease();
  qword_26B121CB8 = v3;
  return result;
}

id ACAccountDataclassQuota.getter()
{
  if (qword_26B121C08 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26B121CB8;
  return v0;
}

id sub_246D3557C()
{
  unint64_t v1 = (void *)v0[3];
  id v2 = v1;
  if (v1 == (void *)1)
  {
    id v2 = sub_246D355D0(v0);
    v0[3] = v2;
    id v3 = v2;
  }
  sub_246D39274(v1);
  return v2;
}

id sub_246D355D0(void *a1)
{
  id v2 = self;
  id v3 = objc_msgSend(v2, sel_defaultStore);
  id result = objc_msgSend(v2, sel_defaultStore);
  if (result)
  {
    id v5 = result;
    id v6 = objc_msgSend(result, sel_aida_accountForiCloudAccount_, *a1);

    id v7 = objc_allocWithZone(MEMORY[0x263F25878]);
    unint64_t v8 = (void *)sub_246D3E068();
    id v9 = objc_msgSend(v7, sel_initWithAccountStore_grandSlamAccount_appTokenID_, v3, v6, v8);

    if (v9) {
      objc_msgSend(v9, sel_setUseAltDSID_, 1);
    }
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t NetworkController.init(account:accountDataclass:urlSession:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  a4[3] = 1;
  return result;
}

uint64_t NetworkController.fetchData(forURLKey:additionalHeaders:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[2] = a3;
  v4[3] = v3;
  uint64_t v7 = sub_246D3DE88();
  v4[4] = v7;
  v4[5] = *(void *)(v7 - 8);
  uint64_t v8 = swift_task_alloc();
  v4[6] = v8;
  id v9 = (void *)swift_task_alloc();
  v4[7] = v9;
  *id v9 = v4;
  v9[1] = sub_246D357F8;
  return NetworkController.fetchURL(forKey:)(v8, a1, a2);
}

uint64_t sub_246D357F8()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_246D35C20;
  }
  else {
    id v2 = sub_246D3590C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_246D3590C()
{
  uint64_t v1 = v0[2];
  id v2 = objc_allocWithZone(MEMORY[0x263F089E0]);
  uint64_t v3 = (void *)sub_246D3DE58();
  id v4 = objc_msgSend(v2, sel_initWithURL_cachePolicy_timeoutInterval_, v3, 1, 30.0);
  v0[9] = v4;

  if (v1)
  {
    *(void *)(swift_task_alloc() + 16) = v4;
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_246D38D58(v5, sub_246D37C78);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  id v6 = (void *)swift_task_alloc();
  v0[10] = v6;
  *id v6 = v0;
  v6[1] = sub_246D35A48;
  return NetworkController.fetchData(forURLRequest:)((uint64_t)v4);
}

uint64_t sub_246D35A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void **)v4;
  *(void *)(*(void *)v4 + 88) = v3;
  swift_task_dealloc();
  if (v3)
  {
    id v9 = sub_246D35C84;
  }
  else
  {
    v8[12] = a3;
    v8[13] = a2;
    v8[14] = a1;
    id v9 = sub_246D35B84;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_246D35B84()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 32);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v7 = *(void *)(v0 + 96);
  return v4(v5, v6, v7);
}

uint64_t sub_246D35C20()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246D35C84()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 32);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t NetworkController.fetchURL(forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CB0);
  v4[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_246D35DB0, 0, 0);
}

uint64_t sub_246D35DB0()
{
  uint64_t v72 = v0;
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void **)(v1 + 8);
  *(void *)(v0 + 136) = v3;
  id v4 = objc_msgSend(v2, sel_propertiesForDataclass_, v3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_246D3E048();

    unint64_t v7 = sub_246D37C80(v6);
    swift_bridgeObjectRelease();
    if (v7)
    {
      id v8 = v3;
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(**(id **)(v0 + 120), sel_propertiesForDataclass_, *(void *)(*(void *)(v0 + 120) + 8));
      if (!v9
        || (uint64_t v10 = v9,
            uint64_t v11 = sub_246D3E048(),
            v10,
            unint64_t v12 = sub_246D37C80(v11),
            swift_bridgeObjectRelease(),
            !v12))
      {
        if (qword_26B121CC8 != -1) {
          swift_once();
        }
        uint64_t v29 = *(void **)(v0 + 136);
        uint64_t v30 = sub_246D3E008();
        __swift_project_value_buffer(v30, (uint64_t)qword_26B121D20);
        id v31 = v29;
        unint64_t v32 = sub_246D3DFE8();
        os_log_type_t v33 = sub_246D3E1C8();
        BOOL v34 = os_log_type_enabled(v32, v33);
        id v35 = *(void **)(v0 + 136);
        if (v34)
        {
          id v36 = (uint8_t *)swift_slowAlloc();
          uint64_t v37 = swift_slowAlloc();
          v71[0] = v37;
          *(_DWORD *)id v36 = 136315138;
          uint64_t v38 = sub_246D3E098();
          *(void *)(v0 + 64) = sub_246D2D114(v38, v39, v71);
          sub_246D3E208();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_246D27000, v32, v33, "Still not able to fetch properties for dataclass: %s. Bailing.", v36, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C548150](v37, -1, -1);
          MEMORY[0x24C548150](v36, -1, -1);
        }
        else
        {
        }
        uint64_t v40 = *(void **)(v0 + 136);
        uint64_t v41 = *(void *)(v0 + 120);
        type metadata accessor for NetworkError();
        sub_246D38F20();
        swift_allocError();
        unint64_t v42 = *(void **)(v41 + 8);
        *uint64_t v43 = v42;
        swift_storeEnumTagMultiPayload();
        id v44 = v42;
        goto LABEL_39;
      }
      uint64_t v13 = (_OWORD *)(v0 + 16);
      if (*(void *)(v12 + 16))
      {
        uint64_t v15 = *(void *)(v0 + 104);
        uint64_t v14 = *(void *)(v0 + 112);
        swift_bridgeObjectRetain();
        unint64_t v16 = sub_246D2D76C(v15, v14);
        if (v17)
        {
          sub_246D2EF6C(*(void *)(v12 + 56) + 32 * v16, v0 + 16);
        }
        else
        {
          *uint64_t v13 = 0u;
          *(_OWORD *)(v0 + 32) = 0u;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        *uint64_t v13 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
      }
      swift_bridgeObjectRelease();
      if (*(void *)(v0 + 40))
      {
        if (swift_dynamicCast())
        {
          uint64_t v45 = *(void *)(v0 + 128);
          uint64_t v47 = *(void *)(v0 + 48);
          unint64_t v46 = *(void *)(v0 + 56);
          sub_246D3DE78();
          uint64_t v48 = sub_246D3DE88();
          uint64_t v49 = *(void *)(v48 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v45, 1, v48) != 1)
          {
            uint64_t v67 = *(void *)(v0 + 128);
            uint64_t v68 = *(void *)(v0 + 96);

            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 32))(v68, v67, v48);
            swift_task_dealloc();
            double v66 = *(uint64_t (**)(void))(v0 + 8);
            goto LABEL_40;
          }
          sub_246D2EFCC(*(void *)(v0 + 128), &qword_26B121CB0);
          if (qword_26B121CC8 != -1) {
            swift_once();
          }
          uint64_t v50 = sub_246D3E008();
          __swift_project_value_buffer(v50, (uint64_t)qword_26B121D20);
          swift_bridgeObjectRetain_n();
          os_log_type_t v51 = sub_246D3DFE8();
          os_log_type_t v52 = sub_246D3E1C8();
          if (os_log_type_enabled(v51, v52))
          {
            uint64_t v53 = (uint8_t *)swift_slowAlloc();
            uint64_t v54 = swift_slowAlloc();
            *(_DWORD *)uint64_t v53 = 136315138;
            v71[0] = v54;
            swift_bridgeObjectRetain();
            *(void *)(v0 + 80) = sub_246D2D114(v47, v46, v71);
            sub_246D3E208();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_246D27000, v51, v52, "Failed to create URL from string: %s", v53, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C548150](v54, -1, -1);
            MEMORY[0x24C548150](v53, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }

          uint64_t v40 = *(void **)(v0 + 136);
          type metadata accessor for NetworkError();
          sub_246D38F20();
          swift_allocError();
          *uint64_t v69 = v47;
          v69[1] = v46;
          swift_storeEnumTagMultiPayload();
LABEL_39:
          swift_willThrow();

          swift_task_dealloc();
          double v66 = *(uint64_t (**)(void))(v0 + 8);
LABEL_40:
          return v66();
        }
      }
      else
      {
        sub_246D2EFCC(v0 + 16, &qword_2691E2A70);
      }
      if (qword_26B121CC8 != -1) {
        swift_once();
      }
      uint64_t v55 = sub_246D3E008();
      __swift_project_value_buffer(v55, (uint64_t)qword_26B121D20);
      swift_bridgeObjectRetain_n();
      uint64_t v56 = sub_246D3DFE8();
      os_log_type_t v57 = sub_246D3E1C8();
      BOOL v58 = os_log_type_enabled(v56, v57);
      unint64_t v59 = *(void *)(v0 + 112);
      if (v58)
      {
        uint64_t v60 = *(void *)(v0 + 104);
        BOOL v61 = (uint8_t *)swift_slowAlloc();
        uint64_t v62 = swift_slowAlloc();
        v71[0] = v62;
        *(_DWORD *)BOOL v61 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 72) = sub_246D2D114(v60, v59, v71);
        sub_246D3E208();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_246D27000, v56, v57, "Failed to fetch URL for key: %s", v61, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C548150](v62, -1, -1);
        MEMORY[0x24C548150](v61, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v40 = *(void **)(v0 + 136);
      uint64_t v64 = *(void *)(v0 + 104);
      uint64_t v63 = *(void *)(v0 + 112);
      type metadata accessor for NetworkError();
      sub_246D38F20();
      swift_allocError();
      *uint64_t v65 = v64;
      v65[1] = v63;
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRetain();
      goto LABEL_39;
    }
  }
  uint64_t v18 = qword_26B121CC8;
  id v19 = v3;
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_246D3E008();
  __swift_project_value_buffer(v20, (uint64_t)qword_26B121D20);
  id v21 = v19;
  id v22 = sub_246D3DFE8();
  os_log_type_t v23 = sub_246D3E1C8();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v71[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    uint64_t v26 = sub_246D3E098();
    *(void *)(v0 + 88) = sub_246D2D114(v26, v27, v71);
    sub_246D3E208();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_246D27000, v22, v23, "Failed to fetch properties for dataclass: %s. Trying to renew credentials.", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v25, -1, -1);
    MEMORY[0x24C548150](v24, -1, -1);
  }
  else
  {
  }
  os_log_type_t v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v28;
  *os_log_type_t v28 = v0;
  v28[1] = sub_246D36794;
  v28[26] = *(void *)(v0 + 120);
  return MEMORY[0x270FA2498](sub_246D38074, 0, 0);
}

uint64_t sub_246D36794()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_246D3701C;
  }
  else {
    uint64_t v2 = sub_246D368A8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_246D368A8()
{
  uint64_t v53 = v0;
  id v1 = objc_msgSend(**(id **)(v0 + 120), sel_propertiesForDataclass_, *(void *)(*(void *)(v0 + 120) + 8));
  if (!v1
    || (v2 = v1, uint64_t v3 = sub_246D3E048(), v2, v4 = sub_246D37C80(v3), swift_bridgeObjectRelease(), !v4))
  {
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v10 = *(void **)(v0 + 136);
    uint64_t v11 = sub_246D3E008();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B121D20);
    id v12 = v10;
    uint64_t v13 = sub_246D3DFE8();
    os_log_type_t v14 = sub_246D3E1C8();
    BOOL v15 = os_log_type_enabled(v13, v14);
    unint64_t v16 = *(void **)(v0 + 136);
    if (v15)
    {
      char v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v52[0] = v18;
      *(_DWORD *)char v17 = 136315138;
      uint64_t v19 = sub_246D3E098();
      *(void *)(v0 + 64) = sub_246D2D114(v19, v20, v52);
      sub_246D3E208();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_246D27000, v13, v14, "Still not able to fetch properties for dataclass: %s. Bailing.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v18, -1, -1);
      MEMORY[0x24C548150](v17, -1, -1);
    }
    else
    {
    }
    id v21 = *(void **)(v0 + 136);
    uint64_t v22 = *(void *)(v0 + 120);
    type metadata accessor for NetworkError();
    sub_246D38F20();
    swift_allocError();
    os_log_type_t v23 = *(void **)(v22 + 8);
    void *v24 = v23;
    swift_storeEnumTagMultiPayload();
    id v25 = v23;
    goto LABEL_29;
  }
  uint64_t v5 = (_OWORD *)(v0 + 16);
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = *(void *)(v0 + 104);
    uint64_t v6 = *(void *)(v0 + 112);
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_246D2D76C(v7, v6);
    if (v9)
    {
      sub_246D2EF6C(*(void *)(v4 + 56) + 32 * v8, v0 + 16);
    }
    else
    {
      *uint64_t v5 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    *uint64_t v5 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 40))
  {
    sub_246D2EFCC(v0 + 16, &qword_2691E2A70);
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_23:
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_246D3E008();
    __swift_project_value_buffer(v36, (uint64_t)qword_26B121D20);
    swift_bridgeObjectRetain_n();
    uint64_t v37 = sub_246D3DFE8();
    os_log_type_t v38 = sub_246D3E1C8();
    BOOL v39 = os_log_type_enabled(v37, v38);
    unint64_t v40 = *(void *)(v0 + 112);
    if (v39)
    {
      uint64_t v41 = *(void *)(v0 + 104);
      unint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      v52[0] = v43;
      *(_DWORD *)unint64_t v42 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 72) = sub_246D2D114(v41, v40, v52);
      sub_246D3E208();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246D27000, v37, v38, "Failed to fetch URL for key: %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v43, -1, -1);
      MEMORY[0x24C548150](v42, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v21 = *(void **)(v0 + 136);
    uint64_t v45 = *(void *)(v0 + 104);
    uint64_t v44 = *(void *)(v0 + 112);
    type metadata accessor for NetworkError();
    sub_246D38F20();
    swift_allocError();
    *unint64_t v46 = v45;
    v46[1] = v44;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    goto LABEL_29;
  }
  uint64_t v26 = *(void *)(v0 + 128);
  uint64_t v28 = *(void *)(v0 + 48);
  unint64_t v27 = *(void *)(v0 + 56);
  sub_246D3DE78();
  uint64_t v29 = sub_246D3DE88();
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v26, 1, v29) == 1)
  {
    sub_246D2EFCC(*(void *)(v0 + 128), &qword_26B121CB0);
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_246D3E008();
    __swift_project_value_buffer(v31, (uint64_t)qword_26B121D20);
    swift_bridgeObjectRetain_n();
    unint64_t v32 = sub_246D3DFE8();
    os_log_type_t v33 = sub_246D3E1C8();
    if (os_log_type_enabled(v32, v33))
    {
      BOOL v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      v52[0] = v35;
      *(_DWORD *)BOOL v34 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 80) = sub_246D2D114(v28, v27, v52);
      sub_246D3E208();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246D27000, v32, v33, "Failed to create URL from string: %s", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v35, -1, -1);
      MEMORY[0x24C548150](v34, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v21 = *(void **)(v0 + 136);
    type metadata accessor for NetworkError();
    sub_246D38F20();
    swift_allocError();
    uint64_t *v51 = v28;
    v51[1] = v27;
    swift_storeEnumTagMultiPayload();
LABEL_29:
    swift_willThrow();

    swift_task_dealloc();
    uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_30;
  }
  uint64_t v49 = *(void *)(v0 + 128);
  uint64_t v50 = *(void *)(v0 + 96);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v50, v49, v29);
  swift_task_dealloc();
  uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
LABEL_30:
  return v47();
}

uint64_t sub_246D3701C()
{
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_246D37088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (void *)sub_246D3E068();
  id v7 = (id)sub_246D3E068();
  objc_msgSend(a5, sel_setValue_forHTTPHeaderField_, v6, v7);
}

uint64_t NetworkController.fetchData(forURLRequest:)(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_246D3DE18();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_246D371E0, 0, 0);
}

uint64_t sub_246D371E0()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = (id *)v0[5];
  sub_246D2F13C();
  id v3 = *v2;
  id v4 = objc_msgSend(*v2, sel_aa_personID);
  uint64_t v5 = (void *)sub_246D3E068();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v4, v5);

  objc_msgSend(v1, sel_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_, v3, 0);
  objc_msgSend(v1, sel_ak_addAnisetteHeaders);
  sub_246D3041C(v3);
  uint64_t v6 = (void *)sub_246D3E068();
  swift_bridgeObjectRelease();
  id v7 = (void *)sub_246D3E068();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v6, v7);

  if (objc_msgSend(v3, sel_isProvisionedForDataclass_, *MEMORY[0x263EFACB8])
    && (objc_msgSend(v3, sel_aa_isManagedAppleID) & 1) == 0)
  {
    char v9 = sub_246D3557C();
    sub_246D30288(v9);
  }
  else
  {
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_246D3E008();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B121D20);
    char v9 = sub_246D3DFE8();
    os_log_type_t v10 = sub_246D3E1D8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      MEMORY[0x24C548150](v11, -1, -1);
    }
  }
  id v12 = (uint64_t *)v0[5];

  uint64_t v13 = *v12;
  os_log_type_t v14 = (void *)swift_task_alloc();
  v0[10] = v14;
  *os_log_type_t v14 = v0;
  v14[1] = sub_246D3747C;
  return sub_246D2F798(v13);
}

uint64_t sub_246D3747C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_246D37578, 0, 0);
}

uint64_t sub_246D37578()
{
  sub_246D3DDE8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_246D37624;
  uint64_t v2 = *(void *)(v0 + 72);
  return MEMORY[0x270EF1EB0](v2, 0);
}

uint64_t sub_246D37624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  uint64_t v6 = (void *)*v4;
  v6[12] = a1;
  v6[13] = a2;
  v6[14] = a3;
  v6[15] = v3;
  swift_task_dealloc();
  (*(void (**)(void, void))(v5[7] + 8))(v5[9], v5[6]);
  if (v3) {
    id v7 = sub_246D37C0C;
  }
  else {
    id v7 = sub_246D37798;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_246D37798()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  uint64_t v2 = qword_26B121CC8;
  if (v1)
  {
    uint64_t v3 = v1;
    id v4 = *(id *)(v0 + 112);
    if (v2 != -1) {
      swift_once();
    }
    uint64_t v5 = *(void **)(v0 + 32);
    uint64_t v6 = sub_246D3E008();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B121D20);
    id v7 = v5;
    uint64_t v8 = sub_246D3DFE8();
    os_log_type_t v9 = sub_246D3E1B8();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = *(NSObject **)(v0 + 32);
    if (v10)
    {
      os_log_type_t v38 = *(NSObject **)(v0 + 112);
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = (void *)swift_slowAlloc();
      *(_DWORD *)id v12 = 138412290;
      *(void *)(v0 + 24) = v11;
      uint64_t v13 = v11;
      sub_246D3E208();
      void *v37 = v11;

      os_log_type_t v14 = v38;
      _os_log_impl(&dword_246D27000, v8, v9, "Successfully fetched response for request: %@", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2930);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v37, -1, -1);
      MEMORY[0x24C548150](v12, -1, -1);
      uint64_t v11 = v8;
    }
    else
    {

      os_log_type_t v14 = v8;
    }

    swift_task_dealloc();
    swift_task_dealloc();
    id v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
    uint64_t v26 = *(void *)(v0 + 96);
    uint64_t v27 = *(void *)(v0 + 104);
    return v25(v26, v27, v3);
  }
  else
  {
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    BOOL v15 = *(void **)(v0 + 32);
    uint64_t v16 = sub_246D3E008();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B121D20);
    id v17 = v15;
    uint64_t v18 = sub_246D3DFE8();
    os_log_type_t v19 = sub_246D3E1C8();
    BOOL v20 = os_log_type_enabled(v18, v19);
    id v21 = *(void **)(v0 + 32);
    if (v20)
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v23 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412290;
      *(void *)(v0 + 16) = v21;
      id v24 = v21;
      sub_246D3E208();
      *os_log_type_t v23 = v21;

      _os_log_impl(&dword_246D27000, v18, v19, "Failed to fetch response for request: %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2930);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v23, -1, -1);
      MEMORY[0x24C548150](v22, -1, -1);
    }
    else
    {
    }
    uint64_t v29 = *(void **)(v0 + 112);
    unint64_t v39 = *(void *)(v0 + 104);
    uint64_t v30 = *(void *)(v0 + 96);
    uint64_t v31 = *(void *)(v0 + 56);
    uint64_t v32 = *(void *)(v0 + 64);
    uint64_t v33 = *(void *)(v0 + 48);
    type metadata accessor for NetworkError();
    sub_246D38F20();
    swift_allocError();
    uint64_t v35 = v34;
    sub_246D3DDE8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v35, v32, v33);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    sub_246D33820(v30, v39);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
    return v36();
  }
}

uint64_t sub_246D37C0C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_246D37C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_246D37088(a1, a2, a3, a4, *(void **)(v4 + 16));
}

unint64_t sub_246D37C80(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CF0);
    uint64_t v2 = (void *)sub_246D3E328();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_246D39284();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_246D2EA58(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_246D2EF6C(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_246D2EA58((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_246D2EFCC((uint64_t)v30, &qword_26B121CE0);
      swift_bridgeObjectRelease();
      sub_246D39284();
      swift_release();
      return 0;
    }
    sub_246D2EF6C((uint64_t)v31 + 8, (uint64_t)v25);
    sub_246D2EFCC((uint64_t)v30, &qword_26B121CE0);
    sub_246D2ADB8(v25, v26);
    long long v27 = v24;
    sub_246D2ADB8(v26, v28);
    long long v16 = v27;
    sub_246D2ADB8(v28, v29);
    sub_246D2ADB8(v29, &v27);
    unint64_t result = sub_246D2D76C(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      uint64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v8 = v16;
      os_log_type_t v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
      unint64_t result = (unint64_t)sub_246D2ADB8(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_246D2ADB8(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_246D38054()
{
  *(void *)(v1 + 208) = v0;
  return MEMORY[0x270FA2498](sub_246D38074, 0, 0);
}

uint64_t sub_246D38074()
{
  uint64_t v1 = **(void ***)(v0 + 208);
  id v2 = objc_msgSend(v1, sel_aa_altDSID);
  *(void *)(v0 + 216) = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2A80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_246D3F000;
    *(void *)(inited + 32) = sub_246D3E098();
    *(void *)(inited + 40) = v5;
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 56) = sub_246D3E098();
    *(void *)(inited + 64) = v6;
    *(unsigned char *)(inited + 72) = 1;
    unint64_t v7 = sub_246D2A8CC(inited);
    uint64_t v8 = self;
    *(void *)(v0 + 224) = v8;
    id v9 = objc_msgSend(v8, sel_defaultStore);
    *(void *)(v0 + 232) = v9;
    if (v9)
    {
      uint64_t v10 = v9;
      sub_246D388F8(v7);
      swift_bridgeObjectRelease();
      uint64_t v11 = sub_246D3E038();
      *(void *)(v0 + 240) = v11;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 200;
      *(void *)(v0 + 24) = sub_246D3838C;
      uint64_t v12 = swift_continuation_init();
      *(void *)(v0 + 160) = MEMORY[0x263EF8330];
      *(void *)(v0 + 168) = 0x40000000;
      *(void *)(v0 + 176) = sub_246D38CA4;
      *(void *)(v0 + 184) = &block_descriptor_0;
      *(void *)(v0 + 192) = v12;
      objc_msgSend(v10, sel_renewCredentialsForAccount_options_completion_, v1, v11, v0 + 160);
      uint64_t v13 = v0 + 16;
    }
    else
    {

      __break(1u);
    }
    return MEMORY[0x270FA23F0](v13);
  }
  else
  {
    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_246D3E008();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B121D20);
    int64_t v15 = sub_246D3DFE8();
    os_log_type_t v16 = sub_246D3E1C8();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_246D27000, v15, v16, "Renew credentials failed, missing id", v17, 2u);
      MEMORY[0x24C548150](v17, -1, -1);
    }

    char v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
}

uint64_t sub_246D3838C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 248) = v2;
  if (v2)
  {

    uint64_t v3 = sub_246D38880;
  }
  else
  {
    uint64_t v3 = sub_246D384A4;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

void sub_246D384A4()
{
  uint64_t v1 = *(void **)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 200);

  if (v2 == 2)
  {

    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_246D3E008();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B121D20);
    uint64_t v14 = sub_246D3DFE8();
    os_log_type_t v15 = sub_246D3E1C8();
    if (!os_log_type_enabled(v14, v15)) {
      goto LABEL_26;
    }
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v16 = 0;
    unint64_t v17 = "Renew credentials failed.";
    goto LABEL_25;
  }
  if (v2 == 1)
  {

    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_246D3E008();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B121D20);
    uint64_t v14 = sub_246D3DFE8();
    os_log_type_t v15 = sub_246D3E1C8();
    if (!os_log_type_enabled(v14, v15)) {
      goto LABEL_26;
    }
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v16 = 0;
    unint64_t v17 = "Renew credentials rejected.";
    goto LABEL_25;
  }
  if (v2)
  {

    if (qword_26B121CC8 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_246D3E008();
    __swift_project_value_buffer(v19, (uint64_t)qword_26B121D20);
    uint64_t v14 = sub_246D3DFE8();
    os_log_type_t v15 = sub_246D3E1C8();
    if (!os_log_type_enabled(v14, v15)) {
      goto LABEL_26;
    }
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v16 = 0;
    unint64_t v17 = "Renew credentials failed w/ unknown reason.";
    goto LABEL_25;
  }
  if (qword_26B121CC8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_246D3E008();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B121D20);
  uint64_t v4 = sub_246D3DFE8();
  os_log_type_t v5 = sub_246D3E1D8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_246D27000, v4, v5, "Successfully renewed credentials.", v6, 2u);
    MEMORY[0x24C548150](v6, -1, -1);
  }
  unint64_t v7 = *(void **)(v0 + 224);

  id v8 = objc_msgSend(v7, sel_defaultStore);
  id v9 = *(void **)(v0 + 216);
  if (!v8)
  {

    __break(1u);
    return;
  }
  uint64_t v10 = v8;
  id v11 = objc_msgSend(v8, sel_aa_appleAccountWithAltDSID_, *(void *)(v0 + 216));

  if (!v11)
  {
    uint64_t v14 = sub_246D3DFE8();
    os_log_type_t v15 = sub_246D3E1C8();
    if (!os_log_type_enabled(v14, v15))
    {
LABEL_26:

      goto LABEL_27;
    }
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v16 = 0;
    unint64_t v17 = "Renew credentials failed, missing account";
LABEL_25:
    _os_log_impl(&dword_246D27000, v14, v15, v17, v16, 2u);
    MEMORY[0x24C548150](v16, -1, -1);
    goto LABEL_26;
  }
  uint64_t v12 = *(id **)(v0 + 208);

  id *v12 = v11;
LABEL_27:
  uint64_t v20 = *(void (**)(void))(v0 + 8);
  v20();
}

uint64_t sub_246D38880()
{
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = (void *)v0[29];
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_246D388F8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2691E28B0);
    uint64_t v2 = sub_246D3E328();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
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
    unint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_246D2ADB8(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_246D2ADB8(v35, v36);
    sub_246D2ADB8(v36, &v32);
    uint64_t result = sub_246D3E238();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_246D2ADB8(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_246D39284();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
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
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_246D38CA4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CF8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_246D38D58(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v22 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v7) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v22 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v20 = *(void *)(v22 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v20 = *(void *)(v22 + 8 * v9);
        if (!v20)
        {
          int64_t v9 = v19 + 3;
          if (v19 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v20 = *(void *)(v22 + 8 * v9);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v20 - 1) & v20;
    unint64_t v11 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = 16 * v11;
    int64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    int64_t v16 = (uint64_t *)(*(void *)(a1 + 56) + v12);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v14, v15, v17, v18);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v21 = v19 + 4;
  if (v21 >= v7) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v22 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v22 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_246D38F20()
{
  unint64_t result = qword_2691E2A68;
  if (!qword_2691E2A68)
  {
    type metadata accessor for NetworkError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691E2A68);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for NetworkController(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for NetworkController(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2 != (void *)1)
  {
  }
}

void *initializeWithCopy for NetworkController(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  unint64_t v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 24);
  a1[2] = v6;
  id v7 = v3;
  id v8 = v4;
  id v9 = v6;
  if (v5 != (void *)1) {
    id v10 = v5;
  }
  a1[3] = v5;
  return a1;
}

uint64_t assignWithCopy for NetworkController(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  id v10 = *(void **)(a2 + 16);
  unint64_t v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  int64_t v13 = (void *)(a1 + 24);
  uint64_t v14 = *(void **)(a1 + 24);
  uint64_t v15 = *(void **)(a2 + 24);
  if (v14 != (void *)1)
  {
    if (v15 != (void *)1)
    {
      *int64_t v13 = v15;
      id v17 = v15;

      return a1;
    }
    sub_246D2EFCC(a1 + 24, &qword_2691E2A78);
    uint64_t v15 = *(void **)(a2 + 24);
    goto LABEL_6;
  }
  if (v15 == (void *)1)
  {
LABEL_6:
    *int64_t v13 = v15;
    return a1;
  }
  *int64_t v13 = v15;
  id v16 = v15;
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

uint64_t assignWithTake for NetworkController(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  id v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  id v8 = (uint64_t *)(a1 + 24);
  id v7 = *(void **)(a1 + 24);
  uint64_t v9 = a2[3];
  if (v7 != (void *)1)
  {
    if (v9 != 1)
    {
      *id v8 = v9;

      return a1;
    }
    sub_246D2EFCC(a1 + 24, &qword_2691E2A78);
    uint64_t v9 = 1;
  }
  *id v8 = v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkController(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkController(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkController()
{
  return &type metadata for NetworkController;
}

id sub_246D39274(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_246D39284()
{
  return swift_release();
}

uint64_t sub_246D3928C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[42] = a5;
  v6[43] = v5;
  v6[40] = a3;
  v6[41] = a4;
  v6[38] = a1;
  v6[39] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD8);
  v6[44] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_246D39328, v5, 0);
}

uint64_t sub_246D39328()
{
  uint64_t v69 = v0;
  uint64_t v1 = (_OWORD *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 344) + 112;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  if (!*(void *)(*(void *)v2 + 16))
  {
    *(void *)(v0 + 128) = 0;
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_246D2EFCC(v0 + 96, &qword_26B121CD0);
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_246D2D76C(v5, v4);
  if (v7)
  {
    sub_246D2DA0C(*(void *)(v3 + 56) + 40 * v6, v0 + 96);
  }
  else
  {
    *(void *)(v0 + 128) = 0;
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 120)) {
    goto LABEL_12;
  }
  sub_246D2DA70((long long *)(v0 + 96), v0 + 16);
  sub_246D2DA0C(v0 + 16, v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2900);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2B38);
  if (swift_dynamicCast())
  {
    uint64_t v8 = *(void *)(v0 + 288);
    *(void *)(v0 + 360) = v8;
    if (qword_26B121CC0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_246D3E008();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B121D08);
    swift_bridgeObjectRetain_n();
    id v10 = sub_246D3DFE8();
    os_log_type_t v11 = sub_246D3E1B8();
    BOOL v12 = os_log_type_enabled(v10, v11);
    unint64_t v13 = *(void *)(v0 + 320);
    uint64_t v14 = MEMORY[0x263F8EE58];
    if (v12)
    {
      uint64_t v15 = *(void *)(v0 + 312);
      id v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v68[0] = v17;
      *(_DWORD *)id v16 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 296) = sub_246D2D114(v15, v13, v68);
      uint64_t v14 = MEMORY[0x263F8EE58];
      sub_246D3E208();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246D27000, v10, v11, "TaskLimiter: reusing existing task for identifier %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v17, -1, -1);
      MEMORY[0x24C548150](v16, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v64 = (void *)swift_task_alloc();
    *(void *)(v0 + 368) = v64;
    uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CF8);
    *uint64_t v64 = v0;
    v64[1] = sub_246D39CDC;
    uint64_t v60 = *(void *)(v0 + 304);
    uint64_t v61 = v14 + 8;
    uint64_t v62 = MEMORY[0x263F8E4E0];
    uint64_t v63 = v8;
    goto LABEL_32;
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
LABEL_14:
  if (qword_26B121CC0 != -1) {
    swift_once();
  }
  uint64_t v18 = v0 + 176;
  uint64_t v19 = sub_246D3E008();
  __swift_project_value_buffer(v19, (uint64_t)qword_26B121D08);
  swift_bridgeObjectRetain_n();
  unint64_t v20 = sub_246D3DFE8();
  os_log_type_t v21 = sub_246D3E1B8();
  BOOL v22 = os_log_type_enabled(v20, v21);
  unint64_t v23 = *(void *)(v0 + 320);
  if (v22)
  {
    uint64_t v67 = *(void *)(v0 + 312);
    BOOL v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v68[0] = v25;
    *(_DWORD *)BOOL v24 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 272) = sub_246D2D114(v67, v23, v68);
    uint64_t v18 = v0 + 176;
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v20, v21, "TaskLimiter: creating new task for identifier %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v25, -1, -1);
    MEMORY[0x24C548150](v24, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  int64_t v26 = (_OWORD *)(v0 + 136);
  uint64_t v27 = *(void *)v2;
  if (*(void *)(*(void *)v2 + 16))
  {
    uint64_t v29 = *(void *)(v0 + 312);
    uint64_t v28 = *(void *)(v0 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v30 = sub_246D2D76C(v29, v28);
    if (v31)
    {
      sub_246D2DA0C(*(void *)(v27 + 56) + 40 * v30, v0 + 136);
    }
    else
    {
      *(void *)(v0 + 168) = 0;
      _OWORD *v26 = 0u;
      *(_OWORD *)(v0 + 152) = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(v0 + 168) = 0;
    _OWORD *v26 = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  uint64_t v32 = *(void *)(v0 + 352);
  uint64_t v34 = *(void *)(v0 + 328);
  uint64_t v33 = *(void *)(v0 + 336);
  uint64_t v35 = sub_246D3E178();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v32, 1, 1, v35);
  sub_246D2ADC8(v0 + 136, v18, &qword_26B121CD0);
  uint64_t v36 = (void *)swift_allocObject();
  v36[2] = 0;
  _OWORD v36[3] = 0;
  sub_246D2D89C(v18, (uint64_t)(v36 + 4));
  v36[9] = v34;
  v36[10] = v33;
  swift_retain();
  uint64_t v37 = sub_246D2CCEC(v32, (uint64_t)&unk_2691E2B30, (uint64_t)v36);
  *(void *)(v0 + 384) = v37;
  swift_bridgeObjectRetain_n();
  os_log_type_t v38 = sub_246D3DFE8();
  os_log_type_t v39 = sub_246D3E1B8();
  BOOL v40 = os_log_type_enabled(v38, v39);
  unint64_t v41 = *(void *)(v0 + 320);
  if (v40)
  {
    uint64_t v66 = v37;
    uint64_t v42 = *(void *)(v0 + 312);
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    v68[0] = v44;
    *(_DWORD *)uint64_t v43 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v45 = v42;
    uint64_t v37 = v66;
    *(void *)(v0 + 264) = sub_246D2D114(v45, v41, v68);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v38, v39, "TaskLimiter: storing task for identifier %s", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v44, -1, -1);
    MEMORY[0x24C548150](v43, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v47 = *(void *)(v0 + 312);
  uint64_t v46 = *(void *)(v0 + 320);
  v68[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2B38);
  v68[4] = sub_246D3DBF8(&qword_2691E2B40, &qword_2691E2B38);
  v68[0] = v37;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_246D2CE70((uint64_t)v68, v47, v46);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  uint64_t v48 = sub_246D3DFE8();
  os_log_type_t v49 = sub_246D3E1B8();
  BOOL v50 = os_log_type_enabled(v48, v49);
  unint64_t v51 = *(void *)(v0 + 320);
  if (v50)
  {
    uint64_t v52 = v37;
    uint64_t v53 = *(void *)(v0 + 312);
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    v68[0] = v55;
    *(_DWORD *)uint64_t v54 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v56 = v53;
    uint64_t v37 = v52;
    *(void *)(v0 + 280) = sub_246D2D114(v56, v51, v68);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v48, v49, "TaskLimiter: performing task operation for identifier %s", v54, 0xCu);
    uint64_t v57 = MEMORY[0x263F8EE58];
    swift_arrayDestroy();
    MEMORY[0x24C548150](v55, -1, -1);
    MEMORY[0x24C548150](v54, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v57 = MEMORY[0x263F8EE58];
  }
  BOOL v58 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v58;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CF8);
  *BOOL v58 = v0;
  v58[1] = sub_246D39EF8;
  uint64_t v60 = *(void *)(v0 + 304);
  uint64_t v61 = v57 + 8;
  uint64_t v62 = MEMORY[0x263F8E4E0];
  uint64_t v63 = v37;
LABEL_32:
  return MEMORY[0x270FA1FA8](v60, v63, v61, v59, v62);
}

uint64_t sub_246D39CDC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 344);
  if (v0) {
    uint64_t v4 = sub_246D39E80;
  }
  else {
    uint64_t v4 = sub_246D39E08;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_246D39E08()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246D39E80()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246D39EF8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 400) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 344);
  if (v0) {
    uint64_t v4 = sub_246D3A0C4;
  }
  else {
    uint64_t v4 = sub_246D3A024;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_246D3A024()
{
  uint64_t v2 = v0[39];
  unint64_t v1 = v0[40];
  swift_release();
  sub_246D2EFCC((uint64_t)(v0 + 17), &qword_26B121CD0);
  sub_246D2C514(v2, v1);
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_246D3A0C4()
{
  uint64_t v2 = v0[39];
  unint64_t v1 = v0[40];
  swift_release();
  sub_246D2EFCC((uint64_t)(v0 + 17), &qword_26B121CD0);
  sub_246D2C514(v2, v1);
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_246D3A164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[42] = a5;
  v6[43] = v5;
  v6[40] = a3;
  v6[41] = a4;
  v6[38] = a1;
  v6[39] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD8);
  v6[44] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_246D3A200, v5, 0);
}

uint64_t sub_246D3A200()
{
  uint64_t v69 = v0;
  unint64_t v1 = (_OWORD *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 344) + 112;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  if (!*(void *)(*(void *)v2 + 16))
  {
    *(void *)(v0 + 128) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_246D2EFCC(v0 + 96, &qword_26B121CD0);
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_246D2D76C(v5, v4);
  if (v7)
  {
    sub_246D2DA0C(*(void *)(v3 + 56) + 40 * v6, v0 + 96);
  }
  else
  {
    *(void *)(v0 + 128) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 120)) {
    goto LABEL_12;
  }
  sub_246D2DA70((long long *)(v0 + 96), v0 + 16);
  sub_246D2DA0C(v0 + 16, v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2900);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2AE8);
  if (swift_dynamicCast())
  {
    uint64_t v8 = *(void *)(v0 + 288);
    *(void *)(v0 + 360) = v8;
    if (qword_26B121CC0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_246D3E008();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B121D08);
    swift_bridgeObjectRetain_n();
    id v10 = sub_246D3DFE8();
    os_log_type_t v11 = sub_246D3E1B8();
    BOOL v12 = os_log_type_enabled(v10, v11);
    unint64_t v13 = *(void *)(v0 + 320);
    if (v12)
    {
      uint64_t v14 = *(void *)(v0 + 312);
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v68[0] = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 296) = sub_246D2D114(v14, v13, v68);
      sub_246D3E208();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246D27000, v10, v11, "TaskLimiter: reusing existing task for identifier %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C548150](v16, -1, -1);
      MEMORY[0x24C548150](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v65 = (void *)swift_task_alloc();
    *(void *)(v0 + 368) = v65;
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CF8);
    *uint64_t v65 = v0;
    v65[1] = sub_246D3ABAC;
    uint64_t v61 = *(void *)(v0 + 304);
    uint64_t v62 = MEMORY[0x263F8EE60] + 8;
    uint64_t v63 = MEMORY[0x263F8E4E0];
    uint64_t v64 = v8;
    goto LABEL_32;
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
LABEL_14:
  if (qword_26B121CC0 != -1) {
    swift_once();
  }
  uint64_t v67 = v0 + 176;
  uint64_t v17 = sub_246D3E008();
  __swift_project_value_buffer(v17, (uint64_t)qword_26B121D08);
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_246D3DFE8();
  os_log_type_t v19 = sub_246D3E1B8();
  BOOL v20 = os_log_type_enabled(v18, v19);
  unint64_t v21 = *(void *)(v0 + 320);
  if (v20)
  {
    uint64_t v22 = *(void *)(v0 + 312);
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = v2;
    uint64_t v25 = swift_slowAlloc();
    v68[0] = v25;
    *(_DWORD *)unint64_t v23 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 272) = sub_246D2D114(v22, v21, v68);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v18, v19, "TaskLimiter: creating new task for identifier %s", v23, 0xCu);
    swift_arrayDestroy();
    uint64_t v26 = v25;
    uint64_t v2 = v24;
    MEMORY[0x24C548150](v26, -1, -1);
    MEMORY[0x24C548150](v23, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v27 = (_OWORD *)(v0 + 136);
  uint64_t v28 = *(void *)v2;
  if (*(void *)(*(void *)v2 + 16))
  {
    uint64_t v30 = *(void *)(v0 + 312);
    uint64_t v29 = *(void *)(v0 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v31 = sub_246D2D76C(v30, v29);
    if (v32)
    {
      sub_246D2DA0C(*(void *)(v28 + 56) + 40 * v31, v0 + 136);
    }
    else
    {
      *(void *)(v0 + 168) = 0;
      *uint64_t v27 = 0u;
      *(_OWORD *)(v0 + 152) = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(v0 + 168) = 0;
    *uint64_t v27 = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  uint64_t v33 = *(void *)(v0 + 352);
  uint64_t v35 = *(void *)(v0 + 328);
  uint64_t v34 = *(void *)(v0 + 336);
  uint64_t v36 = sub_246D3E178();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v33, 1, 1, v36);
  sub_246D2ADC8(v0 + 136, v67, &qword_26B121CD0);
  uint64_t v37 = (void *)swift_allocObject();
  v37[2] = 0;
  v37[3] = 0;
  sub_246D2D89C(v67, (uint64_t)(v37 + 4));
  v37[9] = v35;
  v37[10] = v34;
  swift_retain();
  uint64_t v38 = sub_246D2CCEC(v33, (uint64_t)&unk_2691E2AE0, (uint64_t)v37);
  *(void *)(v0 + 384) = v38;
  swift_bridgeObjectRetain_n();
  os_log_type_t v39 = sub_246D3DFE8();
  os_log_type_t v40 = sub_246D3E1B8();
  BOOL v41 = os_log_type_enabled(v39, v40);
  unint64_t v42 = *(void *)(v0 + 320);
  if (v41)
  {
    uint64_t v43 = v38;
    uint64_t v44 = *(void *)(v0 + 312);
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v68[0] = v46;
    *(_DWORD *)uint64_t v45 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v47 = v44;
    uint64_t v38 = v43;
    *(void *)(v0 + 264) = sub_246D2D114(v47, v42, v68);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v39, v40, "TaskLimiter: storing task for identifier %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v46, -1, -1);
    MEMORY[0x24C548150](v45, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v49 = *(void *)(v0 + 312);
  uint64_t v48 = *(void *)(v0 + 320);
  v68[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2AE8);
  v68[4] = sub_246D3DBF8(&qword_2691E2AF0, &qword_2691E2AE8);
  v68[0] = v38;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_246D2CE70((uint64_t)v68, v49, v48);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  BOOL v50 = sub_246D3DFE8();
  os_log_type_t v51 = sub_246D3E1B8();
  BOOL v52 = os_log_type_enabled(v50, v51);
  unint64_t v53 = *(void *)(v0 + 320);
  if (v52)
  {
    uint64_t v54 = v38;
    uint64_t v55 = *(void *)(v0 + 312);
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    v68[0] = v57;
    *(_DWORD *)uint64_t v56 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v58 = v55;
    uint64_t v38 = v54;
    *(void *)(v0 + 280) = sub_246D2D114(v58, v53, v68);
    sub_246D3E208();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D27000, v50, v51, "TaskLimiter: performing task operation for identifier %s", v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C548150](v57, -1, -1);
    MEMORY[0x24C548150](v56, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v59 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v59;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CF8);
  *uint64_t v59 = v0;
  v59[1] = sub_246D3ACD8;
  uint64_t v61 = *(void *)(v0 + 304);
  uint64_t v62 = MEMORY[0x263F8EE60] + 8;
  uint64_t v63 = MEMORY[0x263F8E4E0];
  uint64_t v64 = v38;
LABEL_32:
  return MEMORY[0x270FA1FA8](v61, v64, v62, v60, v63);
}

uint64_t sub_246D3ABAC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 344);
  if (v0) {
    uint64_t v4 = sub_246D3DDA8;
  }
  else {
    uint64_t v4 = sub_246D3DDAC;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_246D3ACD8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 400) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 344);
  if (v0) {
    uint64_t v4 = sub_246D3DDCC;
  }
  else {
    uint64_t v4 = sub_246D3DDD4;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_246D3AE04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  return MEMORY[0x270FA2498](sub_246D3AE28, 0, 0);
}

uint64_t sub_246D3AE28()
{
  sub_246D2ADC8(*(void *)(v0 + 96), v0 + 16, &qword_26B121CD0);
  uint64_t v1 = *(void *)(v0 + 40);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
    uint64_t v3 = *(int **)(v2 + 16);
    *(void *)(v0 + 80) = swift_getAssociatedTypeWitness();
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 56));
    id v10 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t))((char *)v3 + *v3);
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_246D2C97C;
    return v10(boxed_opaque_existential_0, v1, v2);
  }
  else
  {
    sub_246D2EFCC(v0 + 16, &qword_26B121CD0);
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    char v7 = *(int **)(v0 + 104);
    sub_246D2EFCC(v0 + 56, &qword_26B121D00);
    os_log_type_t v11 = (uint64_t (*)(uint64_t))((char *)v7 + *v7);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_246D2CB88;
    uint64_t v9 = *(void *)(v0 + 88);
    return v11(v9);
  }
}

uint64_t sub_246D3B07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  return MEMORY[0x270FA2498](sub_246D3B0A0, 0, 0);
}

uint64_t sub_246D3B0A0()
{
  sub_246D2ADC8(*(void *)(v0 + 96), v0 + 16, &qword_26B121CD0);
  uint64_t v1 = *(void *)(v0 + 40);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
    uint64_t v3 = *(int **)(v2 + 16);
    *(void *)(v0 + 80) = swift_getAssociatedTypeWitness();
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 56));
    id v10 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t))((char *)v3 + *v3);
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_246D3B2F4;
    return v10(boxed_opaque_existential_0, v1, v2);
  }
  else
  {
    sub_246D2EFCC(v0 + 16, &qword_26B121CD0);
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    char v7 = *(int **)(v0 + 104);
    sub_246D2EFCC(v0 + 56, &qword_26B121D00);
    os_log_type_t v11 = (uint64_t (*)(uint64_t))((char *)v7 + *v7);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_246D3DDC4;
    uint64_t v9 = *(void *)(v0 + 88);
    return v11(v9);
  }
}

uint64_t sub_246D3B2F4()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_246D3DDB0;
  }
  else {
    uint64_t v2 = sub_246D3B408;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_246D3B408()
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  uint64_t v1 = (int *)v0[13];
  sub_246D2EFCC((uint64_t)(v0 + 7), &qword_26B121D00);
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[17] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_246D3DDC4;
  uint64_t v3 = v0[11];
  return v5(v3);
}

uint64_t sub_246D3B500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_246D3E178();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v6;
  v17[5] = a1;
  v17[6] = a2;
  v17[7] = a3;
  v17[8] = a4;
  v17[9] = a5;
  v17[10] = a6;
  id v18 = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_246D3BFCC((uint64_t)v15, (uint64_t)&unk_2691E2A90, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_246D3B64C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[29] = v10;
  v8[30] = v11;
  v8[27] = a7;
  v8[28] = a8;
  v8[25] = a5;
  v8[26] = a6;
  v8[24] = a4;
  return MEMORY[0x270FA2498](sub_246D3B680, 0, 0);
}

uint64_t sub_246D3B680()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 192) + OBJC_IVAR____TtC14ACSEFoundation16TaskLimitersObjC_taskLimiters);
  *(void *)(v0 + 248) = v1;
  return MEMORY[0x270FA2498](sub_246D3B6AC, v1, 0);
}

uint64_t sub_246D3B6AC()
{
  v0[32] = TaskLimiters.limiter(key:)(v0[25], v0[26]);
  return MEMORY[0x270FA2498](sub_246D3B71C, 0, 0);
}

uint64_t sub_246D3B71C()
{
  uint64_t v2 = v0[27];
  uint64_t v1 = v0[28];
  uint64_t v3 = (void *)v0[24];
  uint64_t v4 = (void *)swift_allocObject();
  v0[33] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  uint64_t v10 = (char *)&dword_2691E2B20 + dword_2691E2B20;
  id v5 = v3;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[34] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_246D3B838;
  uint64_t v7 = v0[25];
  uint64_t v8 = v0[26];
  return ((uint64_t (*)(void *, uint64_t, uint64_t, void *, void *))v10)(v0 + 12, v7, v8, &unk_2691E2B18, v4);
}

uint64_t sub_246D3B838()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_246D3BA1C;
  }
  else {
    uint64_t v2 = sub_246D3B968;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_246D3B968()
{
  uint64_t v1 = *(void (**)(uint64_t, void))(v0 + 232);
  sub_246D2EF6C(v0 + 96, v0 + 160);
  v1(v0 + 160, 0);
  swift_release();
  sub_246D2EFCC(v0 + 160, &qword_2691E2A70);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_246D3BA1C()
{
  id v18 = *(id *)(v0 + 280);
  uint64_t v17 = *(void (**)(uint64_t, id))(v0 + 232);
  uint64_t v1 = (void *)sub_246D3DE48();
  id v2 = objc_msgSend(v1, sel_domain);
  sub_246D3E098();

  id v3 = objc_msgSend(v1, sel_code);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2898);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246D3F350;
  *(void *)(inited + 32) = sub_246D3E098();
  *(void *)(inited + 40) = v5;
  id v6 = objc_msgSend(v1, sel_localizedDescription);
  uint64_t v7 = sub_246D3E098();
  uint64_t v9 = v8;

  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = v9;
  sub_246D2A650(inited);
  id v10 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v11 = (void *)sub_246D3E068();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_246D3E038();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_initWithDomain_code_userInfo_, v11, v3, v12);

  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  id v14 = v13;
  v17(v0 + 128, v13);
  swift_release();

  sub_246D2EFCC(v0 + 128, &qword_2691E2A70);
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_246D3BC48()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  long long v7 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_246D2F12C;
  *(void *)(v5 + 240) = v4;
  *(_OWORD *)(v5 + 208) = v6;
  *(_OWORD *)(v5 + 224) = v7;
  *(void *)(v5 + 192) = v2;
  *(void *)(v5 + 200) = v3;
  return MEMORY[0x270FA2498](sub_246D3B680, 0, 0);
}

uint64_t sub_246D3BD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_246D3BD30, 0, 0);
}

uint64_t sub_246D3BD30()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_246D3BE2C;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = MEMORY[0x263F8EE58] + 8;
  return MEMORY[0x270FA2360](v3, 0, 0, 0x286D726F66726570, 0xEE00293A6B736174, sub_246D3DC48, v1, v4);
}

uint64_t sub_246D3BE2C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_246D3BF68, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_246D3BF68()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246D3BFCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246D3E178();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_246D3E168();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246D2EFCC(a1, &qword_26B121CD8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_246D3E138();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_246D3C358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_246D3C414;
  v7[3] = &block_descriptor_32;
  uint64_t v4 = _Block_copy(v7);
  uint64_t v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_246D3C414(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(long long *, void *))(a1 + 32);
  if (a2)
  {
    *((void *)&v9 + 1) = swift_getObjectType();
    *(void *)&long long v8 = a2;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(&v8, a3);

  swift_release();
  return sub_246D2EFCC((uint64_t)&v8, &qword_2691E2A70);
}

uint64_t sub_246D3C4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_246D2ADC8(a1, (uint64_t)v12, &qword_2691E2A70);
  uint64_t v5 = v13;
  if (v13)
  {
    id v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v6);
    long long v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = sub_246D3E388();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  }
  else
  {
    uint64_t v10 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v10, a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_246D3C604(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(void *)&v6[0] = a2;
    id v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2B48);
    return sub_246D3E148();
  }
  else
  {
    sub_246D2ADC8(a1, (uint64_t)&v4, &qword_2691E2A70);
    if (v5)
    {
      sub_246D2ADB8(&v4, v6);
      sub_246D2EF6C((uint64_t)v6, (uint64_t)&v4);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2B48);
      sub_246D3E158();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
    }
    else
    {
      return sub_246D2EFCC((uint64_t)&v4, &qword_2691E2A70);
    }
  }
}

uint64_t sub_246D3C6B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_246D3E178();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v6;
  v17[5] = a1;
  v17[6] = a2;
  v17[7] = a3;
  v17[8] = a4;
  v17[9] = a5;
  v17[10] = a6;
  id v18 = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_246D2CCEC((uint64_t)v15, (uint64_t)&unk_2691E2AA0, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_246D3C810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = v10;
  v8[8] = v11;
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  _OWORD v8[2] = a4;
  return MEMORY[0x270FA2498](sub_246D3C844, 0, 0);
}

uint64_t sub_246D3C844()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC14ACSEFoundation16TaskLimitersObjC_taskLimiters);
  *(void *)(v0 + 72) = v1;
  return MEMORY[0x270FA2498](sub_246D3C870, v1, 0);
}

uint64_t sub_246D3C870()
{
  v0[10] = TaskLimiters.limiter(key:)(v0[3], v0[4]);
  return MEMORY[0x270FA2498](sub_246D3C8E0, 0, 0);
}

uint64_t sub_246D3C8E0()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = swift_allocObject();
  v0[11] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2691E2AD0 + dword_2691E2AD0);
  swift_retain();
  long long v4 = (void *)swift_task_alloc();
  v0[12] = v4;
  *long long v4 = v0;
  v4[1] = sub_246D3C9D8;
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  return v8((uint64_t)v8, v5, v6, (uint64_t)&unk_2691E2AC8, v3);
}

uint64_t sub_246D3C9D8()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_246D3CB7C;
  }
  else {
    uint64_t v2 = sub_246D3CB08;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_246D3CB08()
{
  (*(void (**)(void))(v0 + 56))();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246D3CB7C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_246D3CBE4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  long long v7 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_246D2F12C;
  *(void *)(v5 + 64) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v5 + 48) = v7;
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v3;
  return MEMORY[0x270FA2498](sub_246D3C844, 0, 0);
}

uint64_t sub_246D3CCA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_246D3CCCC, 0, 0);
}

uint64_t sub_246D3CCCC()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_246D3CDC0;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2318](v3, 0, 0, 0xD000000000000033, 0x8000000246D3FD80, sub_246D3D880, v1, v4);
}

uint64_t sub_246D3CDC0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_246D3CED4(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  a2(a6, v13);
  return swift_release();
}

uint64_t sub_246D3D204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_246D3D2C0;
  v7[3] = &block_descriptor_2;
  uint64_t v4 = _Block_copy(v7);
  uint64_t v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_246D3D2C0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id TaskLimitersObjC.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id TaskLimitersObjC.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC14ACSEFoundation16TaskLimitersObjC_taskLimiters;
  type metadata accessor for TaskLimiters();
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v0;
  swift_defaultActor_initialize();
  *(void *)(v2 + 112) = MEMORY[0x263F8EE80];
  *(void *)&v0[v1] = v2;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for TaskLimitersObjC();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for TaskLimitersObjC()
{
  return self;
}

id TaskLimitersObjC.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TaskLimitersObjC();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TaskLimitersObjC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TaskLimitersObjC);
}

uint64_t dispatch thunk of TaskLimitersObjC.perform(identifier:task:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TaskLimitersObjC.performClosureNoParams(identifier:task:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t sub_246D3D534(uint64_t a1, uint64_t a2)
{
  return sub_246D3D204(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_246D3D53C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246D3D574()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
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

uint64_t sub_246D3D5A0(uint64_t a1, uint64_t a2)
{
  return sub_246D3C358(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_246D3D5A8(uint64_t a1, uint64_t a2)
{
  return sub_246D3C4B0(a1, a2, *(void *)(v2 + 16));
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_246D3D60C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  long long v7 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_246D2B4BC;
  *(void *)(v5 + 240) = v4;
  *(_OWORD *)(v5 + 208) = v6;
  *(_OWORD *)(v5 + 224) = v7;
  *(void *)(v5 + 192) = v2;
  *(void *)(v5 + 200) = v3;
  return MEMORY[0x270FA2498](sub_246D3B680, 0, 0);
}

uint64_t sub_246D3D6D0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246D3D708(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_246D2F12C;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_246D3CCCC, 0, 0);
}

uint64_t sub_246D3D7C0(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 72);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_246D2F12C;
  *(_OWORD *)(v4 + 104) = v5;
  *(void *)(v4 + 88) = a1;
  *(void *)(v4 + 96) = v1 + 32;
  return MEMORY[0x270FA2498](sub_246D3B0A0, 0, 0);
}

uint64_t sub_246D3D880(uint64_t a1)
{
  return sub_246D3CED4(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), &qword_2691E2AF8, (uint64_t)&unk_26FB3F4A8, (uint64_t)sub_246D3D8D0);
}

uint64_t sub_246D3D8C4()
{
  return objectdestroy_51Tm(&qword_2691E2AF8);
}

uint64_t sub_246D3D8D0()
{
  return sub_246D3E158();
}

uint64_t sub_246D3D938(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *long long v5 = v2;
  v5[1] = sub_246D2F12C;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2691E2B00 + dword_2691E2B00);
  return v6(a1, v4);
}

uint64_t sub_246D3D9F0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246D3DA30(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 24);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_246D2F12C;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_246D3BD30, 0, 0);
}

uint64_t objectdestroy_40Tm()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 56)) {
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_246D3DB38(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 72);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_246D2B4BC;
  *(_OWORD *)(v4 + 104) = v5;
  *(void *)(v4 + 88) = a1;
  *(void *)(v4 + 96) = v1 + 32;
  return MEMORY[0x270FA2498](sub_246D3AE28, 0, 0);
}

uint64_t sub_246D3DBF8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_246D3DC48(uint64_t a1)
{
  return sub_246D3CED4(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), &qword_2691E2B48, (uint64_t)&unk_26FB3F548, (uint64_t)sub_246D3DD24);
}

uint64_t sub_246D3DC8C()
{
  return objectdestroy_51Tm(&qword_2691E2B48);
}

uint64_t objectdestroy_51Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_246D3DD24(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2B48);
  return sub_246D3C604(a1, a2);
}

uint64_t sub_246D3DDD8()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_246D3DDE8()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_246D3DDF8()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_246D3DE08()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_246D3DE18()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_246D3DE28()
{
  return MEMORY[0x270EEE420]();
}

uint64_t sub_246D3DE38()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_246D3DE48()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_246D3DE58()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_246D3DE68()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_246D3DE78()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_246D3DE88()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_246D3DE98()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_246D3DEA8()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_246D3DEB8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_246D3DEC8()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_246D3DED8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_246D3DEE8()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_246D3DEF8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_246D3DF08()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_246D3DF18()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_246D3DF28()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_246D3DF38()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_246D3DF48()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_246D3DF58()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_246D3DF68()
{
  return MEMORY[0x270EF0E10]();
}

uint64_t sub_246D3DF78()
{
  return MEMORY[0x270EF0E20]();
}

uint64_t sub_246D3DF88()
{
  return MEMORY[0x270EF0E48]();
}

uint64_t sub_246D3DF98()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_246D3DFA8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_246D3DFB8()
{
  return MEMORY[0x270EF1588]();
}

uint64_t sub_246D3DFC8()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_246D3DFD8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_246D3DFE8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_246D3DFF8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_246D3E008()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_246D3E018()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_246D3E028()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_246D3E038()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_246D3E048()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_246D3E058()
{
  return MEMORY[0x270EF1890]();
}

uint64_t sub_246D3E068()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_246D3E078()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_246D3E088()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_246D3E098()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_246D3E0A8()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_246D3E0B8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_246D3E0C8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_246D3E0E8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_246D3E0F8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_246D3E108()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_246D3E118()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_246D3E128()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_246D3E138()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_246D3E148()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_246D3E158()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_246D3E168()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_246D3E178()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_246D3E198()
{
  return MEMORY[0x270FA1FC0]();
}

uint64_t sub_246D3E1B8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_246D3E1C8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_246D3E1D8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_246D3E1E8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_246D3E1F8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_246D3E208()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_246D3E218()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_246D3E228()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_246D3E238()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_246D3E248()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_246D3E258()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_246D3E268()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_246D3E278()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_246D3E288()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_246D3E298()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_246D3E2A8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_246D3E2B8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_246D3E2C8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_246D3E2D8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_246D3E2E8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_246D3E2F8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_246D3E308()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_246D3E318()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_246D3E328()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_246D3E338()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_246D3E358()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_246D3E378()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_246D3E388()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_246D3E398()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_246D3E3B8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_246D3E3E8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_246D3E3F8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_246D3E408()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_246D3E418()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_246D3E428()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_246D3E438()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_246D3E448()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_246D3E458()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x270F25E68]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}