_TtC17HoverTextServices16HoverTextService *HoverTextObjc()
{
  return +[HoverTextService sharedInstance];
}

uint64_t HoverTextError.message.getter(uint64_t a1)
{
  return a1;
}

unint64_t HoverTextError.description.getter()
{
  return 0xD000000000000010;
}

unint64_t sub_1CFDC9A04()
{
  return HoverTextError.description.getter();
}

void *initializeBufferWithCopyOfBuffer for HoverTextError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HoverTextError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for HoverTextError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for HoverTextError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HoverTextError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HoverTextError()
{
  return &type metadata for HoverTextError;
}

uint64_t sub_1CFDC9B60(uint64_t a1)
{
  return sub_1CFDC9BFC(a1, HTLog);
}

uint64_t HTLog.unsafeMutableAddressor()
{
  return sub_1CFDC9C98(&qword_1EB9F1308, (uint64_t)HTLog);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1CFDC9BDC(uint64_t a1)
{
  return sub_1CFDC9BFC(a1, HTLogEvent);
}

uint64_t sub_1CFDC9BFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1CFDCDD70();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1CFDCDD60();
}

uint64_t HTLogEvent.unsafeMutableAddressor()
{
  return sub_1CFDC9C98(&qword_1EA622150, (uint64_t)HTLogEvent);
}

uint64_t sub_1CFDC9C98(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1CFDCDD70();
  return __swift_project_value_buffer(v3, a2);
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

uint64_t sub_1CFDC9D50(void *a1)
{
  id v2 = a1;
  sub_1CFDCDDC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F1300);
  sub_1CFDCDE90();

  return 0;
}

uint64_t sub_1CFDC9DE4()
{
  return sub_1CFDC9D50(*v0);
}

uint64_t sub_1CFDC9DF8(uint64_t result, void *a2, void (*a3)(void *, uint64_t))
{
  if (a3)
  {
    if (a2)
    {
      sub_1CFDCA03C((uint64_t)a3);
      id v5 = a2;
      a3(a2, 1);

      return sub_1CFDCA02C((uint64_t)a3);
    }
    else
    {
      unint64_t v6 = result;
      if (result)
      {
        swift_retain();
        unint64_t v7 = v6;
      }
      else
      {
        swift_retain();
        unint64_t v7 = sub_1CFDC9EFC(MEMORY[0x1E4FBC860]);
      }
      swift_bridgeObjectRetain();
      a3((void *)v7, 0);
      sub_1CFDCA02C((uint64_t)a3);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

unint64_t sub_1CFDC9EFC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA622158);
  uint64_t v2 = sub_1CFDCDEB0();
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
    sub_1CFDCA0D4(v6, (uint64_t)v15);
    unint64_t result = sub_1CFDCA090((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_1CFDCA13C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1CFDCA02C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1CFDCA03C(uint64_t result)
{
  if (result) {
    return swift_retain();
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

unint64_t sub_1CFDCA090(uint64_t a1)
{
  uint64_t v2 = sub_1CFDCDE30();
  return sub_1CFDCA14C(a1, v2);
}

uint64_t sub_1CFDCA0D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA622160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1CFDCA13C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1CFDCA14C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1CFDCA214(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1D25DEA80](v9, a1);
      sub_1CFDCA270((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1CFDCA214(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1CFDCA270(uint64_t a1)
{
  return a1;
}

void *initializeBufferWithCopyOfBuffer for AXUIError(void *a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for AXUIError(id *a1)
{
}

void **assignWithCopy for AXUIError(void **a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for AXUIError(void **a1, void **a2)
{
  id v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for AXUIError(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXUIError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1CFDCA400()
{
  return 0;
}

ValueMetadata *type metadata accessor for AXUIError()
{
  return &type metadata for AXUIError;
}

unint64_t sub_1CFDCA420()
{
  unint64_t result = qword_1EA622168;
  if (!qword_1EA622168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA622168);
  }
  return result;
}

uint64_t sub_1CFDCA478(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_1CFDCDD90();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t HoverTextAXUIServiceMessageID.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL sub_1CFDCA534(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1CFDCA548()
{
  return sub_1CFDCDF50();
}

uint64_t sub_1CFDCA590()
{
  return sub_1CFDCDF40();
}

uint64_t sub_1CFDCA5C0()
{
  return sub_1CFDCDF50();
}

uint64_t sub_1CFDCA604@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s17HoverTextServices0aB20AXUIServiceMessageIDO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_1CFDCA630(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

id sub_1CFDCA6A4()
{
  uint64_t v1 = OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client];
  if (v2)
  {
    objc_msgSend(v2, sel_setDelegate_, 0);
    id v3 = *(void **)&v0[v1];
  }
  else
  {
    id v3 = 0;
  }
  *(void *)&v0[v1] = 0;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for HoverTextServiceAXUIService();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

id sub_1CFDCA74C()
{
  uint64_t v1 = OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client);
LABEL_6:
    id v13 = v2;
    return v3;
  }
  uint64_t v4 = v0;
  id v5 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v5, sel_processIdentifier);

  sub_1CFDCDED0();
  sub_1CFDCDDC0();
  swift_bridgeObjectRelease();
  id v6 = objc_allocWithZone(MEMORY[0x1E4F49028]);
  char v7 = (void *)sub_1CFDCDDA0();
  swift_bridgeObjectRelease();
  char v8 = (void *)sub_1CFDCDDA0();
  id v9 = objc_msgSend(v6, sel_initWithIdentifier_serviceBundleName_, v7, v8);

  long long v10 = *(void **)(v4 + v1);
  *(void *)(v4 + v1) = v9;

  id result = *(id *)(v4 + v1);
  if (result)
  {
    id result = objc_msgSend(result, sel_setDelegate_, v4);
    uint64_t v12 = *(void **)(v4 + v1);
    if (v12)
    {
      id v3 = v12;
      uint64_t v2 = 0;
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

void sub_1CFDCA8D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1CFDCDD70();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB9F1308 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  char v7 = sub_1CFDCDD50();
  os_log_type_t v8 = sub_1CFDCDE00();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1CFDC7000, v7, v8, "Client requesting HoverText start", v9, 2u);
    MEMORY[0x1D25DEEF0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = sub_1CFDCA74C();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1CFDCD244;
  *(void *)(v12 + 24) = v11;
  aBlock[4] = sub_1CFDCD2F0;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CFDCA478;
  aBlock[3] = &block_descriptor_56;
  id v13 = _Block_copy(aBlock);
  id v14 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 1, 0, v13);
  _Block_release(v13);
  swift_release();
}

void sub_1CFDCAB8C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1CFDCDD70();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  os_log_type_t v8 = (char *)&aBlock[-1] - v7;
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextEnabled))
  {
    if (qword_1EB9F1308 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
    id v10 = sub_1CFDCDD50();
    os_log_type_t v11 = sub_1CFDCDE00();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1CFDC7000, v10, v11, "Client requesting HoverText stop", v12, 2u);
      MEMORY[0x1D25DEEF0](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    id v13 = sub_1CFDCA74C();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v1;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_1CFDCD204;
    *(void *)(v15 + 24) = v14;
    aBlock[4] = sub_1CFDCD2F0;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFDCA478;
    aBlock[3] = &block_descriptor_46;
    uint64_t v16 = _Block_copy(aBlock);
    id v17 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 2, 0, v16);
    _Block_release(v16);
    swift_release();
  }
  else
  {
    if (qword_1EB9F1308 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v18, v2);
    v19 = sub_1CFDCDD50();
    os_log_type_t v20 = sub_1CFDCDDE0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1CFDC7000, v19, v20, "HoverText was never started, no need to stop", v21, 2u);
      MEMORY[0x1D25DEEF0](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

void sub_1CFDCAF68(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1CFDCDD70();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB9F1308 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)HTLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  os_log_type_t v11 = sub_1CFDCDD50();
  os_log_type_t v12 = sub_1CFDCDE00();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v23 = v3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = a1;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t aBlock = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1CFDCC744(v24, a2, &aBlock);
    sub_1CFDCDE10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CFDC7000, v11, v12, "Client sending alert to HoverText: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D25DEEF0](v15, -1, -1);
    uint64_t v16 = v14;
    a1 = v24;
    MEMORY[0x1D25DEEF0](v16, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v17 = sub_1CFDCA74C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA622218);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFDCE550;
  uint64_t aBlock = 1954047348;
  unint64_t v27 = 0xE400000000000000;
  uint64_t v19 = MEMORY[0x1E4FBB1A0];
  sub_1CFDCDE50();
  *(void *)(inited + 96) = v19;
  *(void *)(inited + 72) = a1;
  *(void *)(inited + 80) = a2;
  swift_bridgeObjectRetain();
  sub_1CFDC9EFC(inited);
  os_log_type_t v20 = (void *)sub_1CFDCDD80();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = nullsub_1;
  *(void *)(v21 + 24) = 0;
  v30 = sub_1CFDCD2F0;
  uint64_t v31 = v21;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  unint64_t v27 = 1107296256;
  v28 = sub_1CFDCA478;
  v29 = &block_descriptor_36;
  v22 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v17, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, v20, 3, 0, v22);

  _Block_release(v22);
  swift_bridgeObjectRelease();
}

void sub_1CFDCB37C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1CFDCDD70();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB9F1308 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_1CFDCDD50();
  os_log_type_t v8 = sub_1CFDCDE00();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1CFDC7000, v7, v8, "Client requesting HoverText Typing start", v9, 2u);
    MEMORY[0x1D25DEEF0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = sub_1CFDCA74C();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1CFDCD1C0;
  *(void *)(v12 + 24) = v11;
  aBlock[4] = sub_1CFDCD2F0;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CFDCA478;
  aBlock[3] = &block_descriptor_29;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 4, 0, v13);
  _Block_release(v13);
  swift_release();
}

void sub_1CFDCB634()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1CFDCDD70();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  os_log_type_t v8 = (char *)&aBlock[-1] - v7;
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextTypingEnabled))
  {
    if (qword_1EB9F1308 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
    id v10 = sub_1CFDCDD50();
    os_log_type_t v11 = sub_1CFDCDE00();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1CFDC7000, v10, v11, "Client requesting HoverText Typing stop", v12, 2u);
      MEMORY[0x1D25DEEF0](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    id v13 = sub_1CFDCA74C();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v1;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_1CFDCD154;
    *(void *)(v15 + 24) = v14;
    aBlock[4] = sub_1CFDCD194;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFDCA478;
    aBlock[3] = &block_descriptor;
    uint64_t v16 = _Block_copy(aBlock);
    id v17 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 5, 0, v16);
    _Block_release(v16);
    swift_release();
  }
  else
  {
    if (qword_1EB9F1308 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v18, v2);
    uint64_t v19 = sub_1CFDCDD50();
    os_log_type_t v20 = sub_1CFDCDDE0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1CFDC7000, v19, v20, "HoverText Typing was never started, no need to stop", v21, 2u);
      MEMORY[0x1D25DEEF0](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

uint64_t sub_1CFDCBA10(void *a1, char a2, uint64_t a3, const char *a4, const char *a5, void *a6, char a7)
{
  v37 = a5;
  uint64_t v13 = sub_1CFDCDD70();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  id v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v36 - v18;
  if (a2)
  {
    id v25 = a1;
    if (qword_1EB9F1308 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v13, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v26, v13);
    id v27 = a1;
    id v28 = a1;
    v29 = sub_1CFDCDD50();
    os_log_type_t v30 = sub_1CFDCDDF0();
    if (os_log_type_enabled(v29, v30))
    {
      v37 = a4;
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 138412290;
      v36 = v31 + 4;
      sub_1CFDCA420();
      swift_allocError();
      void *v33 = a1;
      id v34 = a1;
      uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v38 = v35;
      sub_1CFDCDE10();
      void *v32 = v35;
      sub_1CFDCD1B4(a1, 1);
      sub_1CFDCD1B4(a1, 1);
      _os_log_impl(&dword_1CFDC7000, v29, v30, v37, v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA622210);
      swift_arrayDestroy();
      MEMORY[0x1D25DEEF0](v32, -1, -1);
      MEMORY[0x1D25DEEF0](v31, -1, -1);

      sub_1CFDCD1B4(a1, 1);
    }
    else
    {
      sub_1CFDCD1B4(a1, 1);
      sub_1CFDCD1B4(a1, 1);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  else
  {
    if (qword_1EB9F1308 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v13, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v19, v20, v13);
    uint64_t v21 = sub_1CFDCDD50();
    os_log_type_t v22 = sub_1CFDCDE00();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1CFDC7000, v21, v22, v37, v23, 2u);
      MEMORY[0x1D25DEEF0](v23, -1, -1);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    *(unsigned char *)(a3 + *a6) = a7;
  }
  return result;
}

void sub_1CFDCBE5C(uint64_t a1)
{
  uint64_t v3 = sub_1CFDCDD70();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  id v10 = &v36[-v9];
  MEMORY[0x1F4188790](v8);
  uint64_t v14 = &v36[-v13];
  uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client);
  if (a1)
  {
    if (v15) {
      BOOL v16 = a1 == v15;
    }
    else {
      BOOL v16 = 0;
    }
    if (!v16) {
      return;
    }
  }
  else if (v15)
  {
    return;
  }
  v37 = v12;
  uint64_t v38 = v11;
  uint64_t v39 = v1;
  if (qword_1EB9F1308 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v3, (uint64_t)HTLog);
  swift_beginAccess();
  v41 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v42 = v17;
  v41(v14, v17, v3);
  uint64_t v18 = sub_1CFDCDD50();
  os_log_type_t v19 = sub_1CFDCDDF0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = v4;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_1CFDC7000, v18, v19, "Connection to HoverText UI Service was interrupted", v21, 2u);
    os_log_type_t v22 = v21;
    uint64_t v4 = v20;
    MEMORY[0x1D25DEEF0](v22, -1, -1);
  }

  uint64_t v23 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
  uint64_t v40 = v4 + 8;
  v23(v14, v3);
  uint64_t v24 = self;
  id v25 = objc_msgSend(v24, sel_sharedInstance);
  unsigned int v26 = objc_msgSend(v25, sel_hoverTextEnabled);

  if (v26)
  {
    v41(v10, v42, v3);
    id v27 = sub_1CFDCDD50();
    os_log_type_t v28 = sub_1CFDCDDE0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1CFDC7000, v27, v28, "HoverText still enabled. Will attempt to relaunch", v29, 2u);
      MEMORY[0x1D25DEEF0](v29, -1, -1);
    }

    v23(v10, v3);
    sub_1CFDCA8D4();
  }
  id v30 = objc_msgSend(v24, sel_sharedInstance);
  unsigned int v31 = objc_msgSend(v30, sel_hoverTextTypingEnabled);

  v32 = v37;
  if (v31)
  {
    v41(v37, v42, v3);
    v33 = sub_1CFDCDD50();
    os_log_type_t v34 = sub_1CFDCDDE0();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_1CFDC7000, v33, v34, "HoverText Typing still enabled. Will attempt to relaunch", v35, 2u);
      MEMORY[0x1D25DEEF0](v35, -1, -1);
    }

    v23(v32, v3);
    sub_1CFDCB37C();
  }
}

void sub_1CFDCC690()
{
}

void sub_1CFDCC6B4()
{
}

void sub_1CFDCC6D8(uint64_t a1, unint64_t a2)
{
}

void sub_1CFDCC6FC()
{
}

void sub_1CFDCC720()
{
}

uint64_t sub_1CFDCC744(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1CFDCC818(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1CFDCD0BC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1CFDCD0BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1CFDCC818(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1CFDCDE20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1CFDCC9D4(a5, a6);
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
  uint64_t v8 = sub_1CFDCDE80();
  if (!v8)
  {
    sub_1CFDCDEA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1CFDCDEC0();
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

uint64_t sub_1CFDCC9D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1CFDCCA6C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1CFDCCC4C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1CFDCCC4C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1CFDCCA6C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1CFDCCBE4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1CFDCDE70();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1CFDCDEA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1CFDCDDD0();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1CFDCDEC0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1CFDCDEA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1CFDCCBE4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA622200);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1CFDCCC4C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA622200);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
  uint64_t result = sub_1CFDCDEC0();
  __break(1u);
  return result;
}

uint64_t _s17HoverTextServices0aB20AXUIServiceMessageIDO8rawValueACSgSi_tcfC_0(unint64_t a1)
{
  if (a1 >= 6) {
    return 5;
  }
  else {
    return (0x40302010005uLL >> (8 * a1));
  }
}

unint64_t sub_1CFDCCDC4()
{
  unint64_t result = qword_1EA622170;
  if (!qword_1EA622170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA622170);
  }
  return result;
}

unint64_t sub_1CFDCCE18(uint64_t a1)
{
  unint64_t result = sub_1CFDCCE40();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CFDCCE40()
{
  unint64_t result = qword_1EB9F12F8;
  if (!qword_1EB9F12F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9F12F8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HoverTextAXUIServiceMessageID(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HoverTextAXUIServiceMessageID(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1CFDCD000);
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

uint64_t sub_1CFDCD028(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1CFDCD030(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HoverTextAXUIServiceMessageID()
{
  return &type metadata for HoverTextAXUIServiceMessageID;
}

uint64_t type metadata accessor for HoverTextServiceAXUIService()
{
  return self;
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

uint64_t sub_1CFDCD0BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CFDCD11C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1CFDCD154(void *a1, char a2)
{
  return sub_1CFDCBA10(a1, a2 & 1, *(void *)(v2 + 16), "Failed to stop HoverText Typing: %@", "Client received HoverText Typing stop success callback", &OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextTypingEnabled, 0);
}

uint64_t sub_1CFDCD194(uint64_t a1, void *a2)
{
  return sub_1CFDC9DF8(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
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

void sub_1CFDCD1B4(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1CFDCD1C0(void *a1, char a2)
{
  return sub_1CFDCBA10(a1, a2 & 1, *(void *)(v2 + 16), "Failed to start HoverText Typing: %@", "Client received HoverText Typing start success callback", &OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextTypingEnabled, 1);
}

uint64_t sub_1CFDCD204(void *a1, char a2)
{
  return sub_1CFDCBA10(a1, a2 & 1, *(void *)(v2 + 16), "Failed to stop HoverText: %@", "Client received HoverText stop success callback", &OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextEnabled, 0);
}

uint64_t sub_1CFDCD244(void *a1, char a2)
{
  return sub_1CFDCBA10(a1, a2 & 1, *(void *)(v2 + 16), "Failed to start HoverText: %@", "Client received HoverText start success callback", &OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextEnabled, 1);
}

uint64_t objectdestroy_18Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id HoverText.getter()
{
  if (qword_1EB9F1290 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static HoverTextService.sharedInstance;
  return v0;
}

uint64_t *HoverTextService.sharedInstance.unsafeMutableAddressor()
{
  if (qword_1EB9F1290 != -1) {
    swift_once();
  }
  return &static HoverTextService.sharedInstance;
}

id sub_1CFDCD39C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HoverTextService()), sel_init);
  static HoverTextService.sharedInstance = (uint64_t)result;
  return result;
}

id static HoverTextService.sharedInstance.getter()
{
  if (qword_1EB9F1290 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static HoverTextService.sharedInstance;
  return v0;
}

id HoverTextService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextService.startHoverText()()
{
  sub_1CFDCD5F0(v0 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v3);
  uint64_t v1 = v4;
  uint64_t v2 = v5;
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

uint64_t sub_1CFDCD5F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextService.stopHoverText()()
{
  sub_1CFDCD5F0(v0 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v3);
  uint64_t v1 = v4;
  uint64_t v2 = v5;
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

Swift::Void __swiftcall HoverTextService.showAlert(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  sub_1CFDCD5F0(v1 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v6);
  uint64_t v4 = v7;
  uint64_t v5 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v5 + 24))(countAndFlagsBits, object, v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextService.startHoverTextTyping()()
{
  sub_1CFDCD5F0(v0 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v3);
  uint64_t v1 = v4;
  uint64_t v2 = v5;
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextService.stopHoverTextTyping()()
{
  sub_1CFDCD5F0(v0 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v3);
  uint64_t v1 = v4;
  uint64_t v2 = v5;
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

uint64_t type metadata accessor for HoverTextService()
{
  return self;
}

uint64_t sub_1CFDCDD10()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1CFDCDD20()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1CFDCDD30()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1CFDCDD40()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1CFDCDD50()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1CFDCDD60()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1CFDCDD70()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1CFDCDD80()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1CFDCDD90()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1CFDCDDA0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1CFDCDDB0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1CFDCDDC0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1CFDCDDD0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1CFDCDDE0()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1CFDCDDF0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1CFDCDE00()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1CFDCDE10()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1CFDCDE20()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1CFDCDE30()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1CFDCDE40()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1CFDCDE50()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1CFDCDE60()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1CFDCDE70()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1CFDCDE80()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1CFDCDE90()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1CFDCDEA0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1CFDCDEB0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1CFDCDEC0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1CFDCDED0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1CFDCDEE0()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1CFDCDEF0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1CFDCDF00()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1CFDCDF10()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1CFDCDF20()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1CFDCDF30()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1CFDCDF40()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1CFDCDF50()
{
  return MEMORY[0x1F4185EF8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}