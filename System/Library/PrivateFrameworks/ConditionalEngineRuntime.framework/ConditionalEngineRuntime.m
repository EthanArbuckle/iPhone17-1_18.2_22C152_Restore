uint64_t sub_24A6F8C48()
{
  return swift_initClassMetadata2();
}

id *sub_24A6F8CB8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_release();

  return v0;
}

uint64_t sub_24A6F8D08()
{
  sub_24A6F8CB8();
  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t type metadata accessor for BiomeSourceListener()
{
  return sub_24A6F8D70();
}

uint64_t sub_24A6F8D54()
{
  return swift_getWitnessTable();
}

uint64_t sub_24A6F8D70()
{
  return swift_getGenericMetadata();
}

void static ConditionalEngineStartup.start()()
{
  uint64_t v0 = sub_24A6F9DC0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697B2B70 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24A6F9D90();
  sub_24A6F9334(v4, (uint64_t)qword_2697B2E50);
  v5 = sub_24A6F9D70();
  os_log_type_t v6 = sub_24A6F9DF0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_24A6F7000, v5, v6, "conditional engine ignition", v7, 2u);
    MEMORY[0x24C5CD2F0](v7, -1, -1);
  }

  sub_24A6F936C();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F080], v0);
  v8 = sub_24A6F9E00();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  aBlock[4] = sub_24A6F8FDC;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A6F92D4;
  aBlock[3] = &unk_26FE387F0;
  v9 = _Block_copy(aBlock);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v8, v9);
  _Block_release(v9);
}

uint64_t sub_24A6F8FDC(void *a1)
{
  uint64_t v2 = MEMORY[0x24C5CD330]();
  uint64_t result = sub_24A6F9DB0();
  if (v2 == result)
  {
    uint64_t v4 = MEMORY[0x24C5CD100]();
    sub_24A6F905C(a1);
    return MEMORY[0x270F9A3C0](v4);
  }
  return result;
}

void sub_24A6F905C(void *a1)
{
  uint64_t v2 = (const char *)sub_24A6F9DA0();
  if (xpc_dictionary_get_string(a1, v2))
  {
    uint64_t v3 = sub_24A6F9DD0();
    unint64_t v5 = v4;
    if (qword_2697B2B70 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24A6F9D90();
    sub_24A6F9334(v6, (uint64_t)qword_2697B2E50);
    swift_bridgeObjectRetain_n();
    v7 = sub_24A6F9D70();
    os_log_type_t v8 = sub_24A6F9DF0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v13 = v10;
      *(_DWORD *)v9 = 136315138;
      swift_bridgeObjectRetain();
      sub_24A6F93D4(v3, v5, &v13);
      sub_24A6F9E10();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A6F7000, v7, v8, "%s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CD2F0](v10, -1, -1);
      MEMORY[0x24C5CD2F0](v9, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (v3 == 0xD00000000000001FLL && v5 == 0x800000024A6FA3C0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_24A6F9E70();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0) {
        return;
      }
    }
    id v12 = objc_msgSend(self, sel_defaultCenter);
    objc_msgSend(v12, sel_postNotificationName_object_, *MEMORY[0x263F04AD8], 0);
  }
}

uint64_t sub_24A6F92D4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24A6F9334(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24A6F936C()
{
  unint64_t result = qword_2697B2D20;
  if (!qword_2697B2D20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697B2D20);
  }
  return result;
}

uint64_t sub_24A6F93AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24A6F93BC()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for ConditionalEngineStartup()
{
  return &type metadata for ConditionalEngineStartup;
}

uint64_t sub_24A6F93D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24A6F94A8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24A6F9A7C((uint64_t)v12, *a3);
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
      sub_24A6F9A7C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_24A6F9A2C((uint64_t)v12);
  return v7;
}

uint64_t sub_24A6F94A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24A6F9E20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24A6F9664(a5, a6);
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
  uint64_t v8 = sub_24A6F9E40();
  if (!v8)
  {
    sub_24A6F9E50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24A6F9E60();
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

uint64_t sub_24A6F9664(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24A6F96FC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24A6F98DC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24A6F98DC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A6F96FC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24A6F9874(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24A6F9E30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24A6F9E50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24A6F9DE0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24A6F9E60();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24A6F9E50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24A6F9874(uint64_t a1, uint64_t a2)
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
  sub_24A6F9AD8(&qword_2697B2D28);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A6F98DC(char a1, int64_t a2, char a3, char *a4)
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
    sub_24A6F9AD8(&qword_2697B2D28);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
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
  uint64_t result = sub_24A6F9E60();
  __break(1u);
  return result;
}

uint64_t sub_24A6F9A2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24A6F9A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24A6F9AD8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A6F9B20()
{
  swift_release();

  sub_24A6F9C3C(v0 + 40);
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for EventKitSourceListener()
{
  return self;
}

unint64_t sub_24A6F9B98()
{
  unint64_t result = qword_2697B2D30;
  if (!qword_2697B2D30)
  {
    sub_24A6F9BF4(&qword_2697B2D38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B2D30);
  }
  return result;
}

uint64_t sub_24A6F9BF4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A6F9C3C(uint64_t a1)
{
  uint64_t v2 = sub_24A6F9AD8((uint64_t *)&unk_2697B2D40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A6F9C9C()
{
  uint64_t v0 = sub_24A6F9D90();
  sub_24A6F9D0C(v0, qword_2697B2E50);
  sub_24A6F9334(v0, (uint64_t)qword_2697B2E50);
  return sub_24A6F9D80();
}

uint64_t *sub_24A6F9D0C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_24A6F9D70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A6F9D80()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24A6F9D90()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A6F9DA0()
{
  return MEMORY[0x270FA1A28]();
}

uint64_t sub_24A6F9DB0()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_24A6F9DC0()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24A6F9DD0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24A6F9DE0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A6F9DF0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24A6F9E00()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24A6F9E10()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24A6F9E20()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24A6F9E30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24A6F9E40()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A6F9E50()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24A6F9E60()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24A6F9E70()
{
  return MEMORY[0x270F9F7D0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}