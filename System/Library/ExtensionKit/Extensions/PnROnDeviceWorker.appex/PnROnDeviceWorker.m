uint64_t sub_100003560()
{
  uint64_t v0;

  v0 = sub_100007140();
  sub_100003EB4(v0, qword_10000C2E0);
  sub_100003E7C(v0, (uint64_t)qword_10000C2E0);
  return sub_1000070B0();
}

unint64_t *sub_1000035AC(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v4 = a2(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v19 - v6;
  int64_t v8 = *(void *)(a1 + 16);
  v9 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v8)
  {
    v24 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100004570(0, v8, 0);
    v9 = v24;
    v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v10 = v5 + 16;
    v11 = v12;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
    uint64_t v19 = *(void *)(v10 + 56);
    do
    {
      v11(v7, v13, v4);
      v24 = v9;
      unint64_t v15 = v9[2];
      unint64_t v14 = v9[3];
      if (v15 >= v14 >> 1) {
        sub_100004570(v14 > 1, v15 + 1, 1);
      }
      uint64_t v22 = v4;
      uint64_t v23 = v20;
      v16 = sub_100006CA8((uint64_t *)&v21);
      v11((char *)v16, (uint64_t)v7, v4);
      v17 = v24;
      v24[2] = v15 + 1;
      sub_100006D0C(&v21, (uint64_t)&v17[5 * v15 + 4]);
      (*(void (**)(char *, uint64_t))(v10 - 8))(v7, v4);
      v9 = v24;
      v13 += v19;
      --v8;
    }
    while (v8);
  }
  return v9;
}

uint64_t sub_100003778()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100003788()
{
  return _swift_task_switch(sub_1000037A4, 0, 0);
}

uint64_t sub_1000037A4()
{
  objc_allocWithZone((Class)sub_100006E60());
  uint64_t v1 = sub_100006E40();
  v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100003818(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C170 + dword_10000C170);
  v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1000038C0;
  return v5(a1);
}

uint64_t sub_1000038C0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000039BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *unint64_t v15 = v7;
  v15[1] = sub_100003AA0;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100003AA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003B94()
{
  uint64_t v0 = type metadata accessor for PnROnDeviceWorker();
  uint64_t v1 = sub_100003E3C(&qword_10000C168);

  return MLHostExtension.configuration.getter(v0, v1);
}

void sub_100003C00(uint64_t *a1@<X8>)
{
  type metadata accessor for PnROnDeviceWorker();
  uint64_t v2 = swift_allocObject();
  if (qword_10000C1D0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100007140();
  sub_100003E7C(v3, (uint64_t)qword_10000C2E0);
  uint64_t v4 = sub_100007130();
  os_log_type_t v5 = sub_100007180();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "PnROnDeviceWorker init", v6, 2u);
    swift_slowDealloc();
  }

  *a1 = v2;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for PnROnDeviceWorker()
{
  return self;
}

uint64_t sub_100003D98()
{
  return sub_100003E3C(&qword_10000C090);
}

uint64_t sub_100003DCC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100003E3C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PnROnDeviceWorker();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100003E7C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100003EB4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100003F18(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100003FEC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006DD4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100006DD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006D84((uint64_t)v12);
  return v7;
}

uint64_t sub_100003FEC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000071B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000041A8(a5, a6);
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
  uint64_t v8 = sub_1000071E0();
  if (!v8)
  {
    sub_1000071F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100007210();
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

uint64_t sub_1000041A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100004240(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100004420(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100004420(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100004240(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000043B8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000071C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000071F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007150();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100007210();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000071F0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000043B8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100006BFC((uint64_t *)&unk_10000C1C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100004420(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006BFC((uint64_t *)&unk_10000C1C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_100007210();
  __break(1u);
  return result;
}

uint64_t sub_100004570(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100004590(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100004590(char a1, int64_t a2, char a3, void *a4)
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
    sub_100006BFC(&qword_10000C1A0);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
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
    sub_100006BFC(&qword_10000C1A8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100007210();
  __break(1u);
  return result;
}

uint64_t sub_100004734(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_100006FB0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  sub_100006BFC(&qword_10000C1B0);
  v1[9] = swift_task_alloc();
  sub_100006BFC(&qword_10000C1B8);
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_100006EE0();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  uint64_t v4 = sub_1000070A0();
  v1[15] = v4;
  v1[16] = *(void *)(v4 - 8);
  v1[17] = swift_task_alloc();
  return _swift_task_switch(sub_10000491C, 0, 0);
}

uint64_t sub_10000491C()
{
  uint64_t v19 = v0;
  if (sub_100007160())
  {
    if (qword_10000C1D0 != -1) {
      swift_once();
    }
    uint64_t v1 = (void *)v0[5];
    uint64_t v2 = sub_100007140();
    sub_100003E7C(v2, (uint64_t)qword_10000C2E0);
    id v3 = v1;
    uint64_t v4 = sub_100007130();
    os_log_type_t v5 = sub_100007170();
    BOOL v6 = os_log_type_enabled(v4, v5);
    int64_t v7 = (void *)v0[5];
    if (v6)
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315394;
      uint64_t v9 = sub_100006EA0();
      v0[3] = sub_100003F18(v9, v10, &v18);
      sub_1000071A0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v8 + 12) = 2080;
      uint64_t v11 = sub_100006EB0();
      v0[4] = sub_100003F18(v11, v12, &v18);
      sub_1000071A0();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v4, v5, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v14 = objc_allocWithZone((Class)sub_100006E60());
    uint64_t v15 = sub_100006E40();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v16 = (uint64_t (*)(uint64_t))v0[1];
    return v16(v15);
  }
  else
  {
    sub_100006F60();
    sub_100007080();
    unint64_t v13 = (void *)swift_task_alloc();
    v0[18] = v13;
    *unint64_t v13 = v0;
    v13[1] = sub_100004C50;
    return SELFProcessedStreamTurnReader.read()();
  }
}

uint64_t sub_100004C50(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 136);
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_100004DB0, 0, 0);
}

uint64_t sub_100004DB0()
{
  v62 = v0;
  uint64_t v1 = v0[19];
  if (!v1)
  {
    if (qword_10000C1D0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_100007140();
    sub_100003E7C(v8, (uint64_t)qword_10000C2E0);
    uint64_t v9 = sub_100007130();
    os_log_type_t v10 = sub_100007180();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "No turn sequence to extract Siri latencies", v11, 2u);
      swift_slowDealloc();
    }

    id v12 = objc_allocWithZone((Class)sub_100006E60());
    goto LABEL_30;
  }
  if (qword_10000C1D0 != -1) {
    goto LABEL_37;
  }
  while (1)
  {
    uint64_t v2 = sub_100007140();
    sub_100003E7C(v2, (uint64_t)qword_10000C2E0);
    swift_bridgeObjectRetain_n();
    uint64_t v3 = sub_100007130();
    os_log_type_t v4 = sub_100007180();
    if (os_log_type_enabled(v3, v4))
    {
      unint64_t v5 = v0[19];
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 134217984;
      if (v5 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v7 = sub_100007200();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v0[2] = v7;
      sub_1000071A0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received the turnSequence, count is %ld", v6, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    unint64_t v13 = v0[19];
    if (v13 >> 62) {
      break;
    }
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v14) {
      goto LABEL_29;
    }
LABEL_15:
    uint64_t v15 = 0;
    uint64_t v16 = v0[12];
    v56 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
    unint64_t v57 = v0[19] & 0xC000000000000001;
    v53 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
    v54 = (void (**)(uint64_t, void, uint64_t))(v16 + 32);
    v60 = (void (**)(uint64_t, uint64_t))(v16 + 8);
    uint64_t v55 = v1;
    uint64_t v52 = v14;
    while (1)
    {
      id v17 = v57 ? (id)sub_1000071D0() : *(id *)(v1 + 8 * v15 + 32);
      if (__OFADD__(v15, 1)) {
        break;
      }
      uint64_t v18 = v0[9];
      id v19 = v17;
      sub_100006FD0();
      uint64_t v20 = sub_100006FE0();
      uint64_t v21 = *(void *)(v20 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v18, 1, v20) == 1)
      {
        sub_100006D28(v0[9], &qword_10000C1B0);
        (*(void (**)(void, uint64_t, uint64_t, void))(v0[12] + 56))(v0[10], 1, 1, v0[11]);
LABEL_32:
        uint64_t v43 = v0[10];
        uint64_t v45 = v0[7];
        uint64_t v44 = v0[8];
        uint64_t v46 = v0[6];
        swift_bridgeObjectRelease();
        sub_100006D28(v43, &qword_10000C1B8);
        uint64_t v47 = enum case for ReliabilityCategory.PnROnDeviceWorkerIssues.doWorkSiriMetricsFailed(_:);
        uint64_t v48 = sub_100006F90();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 104))(v44, v47, v48);
        (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))(v44, enum case for ReliabilityCategory.pnrOnDeviceWorkerIssues(_:), v46);
        sub_100007120();
        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
        sub_1000070C0();
        sub_100006EF0();
        sub_100006F80();
        sub_100006F00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v49 = objc_allocWithZone((Class)sub_100006E60());
        uint64_t v42 = sub_100006E40();

        goto LABEL_33;
      }
      sub_100006FC0();
      uint64_t v23 = v0[10];
      uint64_t v22 = v0[11];
      (*(void (**)(void, uint64_t))(v21 + 8))(v0[9], v20);
      if ((*v56)(v23, 1, v22) == 1) {
        goto LABEL_32;
      }
      v59 = v19;
      uint64_t v25 = v0[13];
      uint64_t v24 = v0[14];
      uint64_t v26 = v0[11];
      (*v54)(v24, v0[10], v26);
      (*v53)(v25, v24, v26);
      v27 = sub_100007130();
      os_log_type_t v28 = sub_100007180();
      BOOL v29 = os_log_type_enabled(v27, v28);
      uint64_t v30 = v0[13];
      uint64_t v31 = v0[11];
      if (v29)
      {
        uint64_t v32 = swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        *(_DWORD *)uint64_t v32 = 136315138;
        uint64_t v33 = sub_100006ED0();
        *(void *)(v32 + 4) = sub_100003F18(v33, v34, &v61);
        swift_bridgeObjectRelease();
        v35 = *v60;
        (*v60)(v30, v31);
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "siriTurnGrainRecord is %s", (uint8_t *)v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v35 = *v60;
        (*v60)(v0[13], v0[11]);
      }

      sub_100006F50();
      swift_allocObject();
      sub_100006F40();
      sub_100006F30();
      v58 = v35;
      uint64_t v36 = v15 + 1;
      swift_release();
      v37 = sub_100007130();
      os_log_type_t v38 = sub_100007180();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "About to do uploadSiriTurnGrainLatency", v39, 2u);
        swift_slowDealloc();
      }

      swift_allocObject();
      sub_100006F40();
      sub_100006F20();
      v58(v0[14], v0[11]);

      swift_release();
      ++v15;
      BOOL v40 = v36 == v52;
      uint64_t v1 = v55;
      if (v40) {
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_37:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100007200();
  swift_bridgeObjectRelease();
  if (v14) {
    goto LABEL_15;
  }
LABEL_29:
  swift_bridgeObjectRelease();
  id v41 = objc_allocWithZone((Class)sub_100006E60());
LABEL_30:
  uint64_t v42 = sub_100006E40();
LABEL_33:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v50 = (uint64_t (*)(uint64_t))v0[1];
  return v50(v42);
}

uint64_t sub_100005954()
{
  uint64_t v1 = sub_100006FB0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = sub_1000070D0();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  sub_100006BFC(&qword_10000C190);
  v0[8] = swift_task_alloc();
  v0[9] = swift_task_alloc();
  return _swift_task_switch(sub_100005AAC, 0, 0);
}

uint64_t sub_100005AAC()
{
  if (qword_10000C1D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100007140();
  v0[10] = sub_100003E7C(v1, (uint64_t)qword_10000C2E0);
  uint64_t v2 = sub_100007130();
  os_log_type_t v3 = sub_100007190();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Use platform managed bookmark with unique PnRMetricsWorker domain", v4, 2u);
    swift_slowDealloc();
  }

  sub_100007110();
  swift_allocObject();
  sub_100007100();
  sub_100006EC0();
  v0[11] = sub_1000070F0();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v5 = sub_100007130();
  os_log_type_t v6 = sub_100007190();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "PnROnDeviceWorker retrieving sessionized data for IE metrics", v7, 2u);
    swift_slowDealloc();
  }

  sub_100006BFC(&qword_10000C198);
  uint64_t v8 = sub_1000070E0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  v0[12] = v12;
  *(_OWORD *)(v12 + 16) = xmmword_100007560;
  unint64_t v13 = v12 + v11;
  uint64_t v14 = *(void (**)(unint64_t, void, uint64_t))(v9 + 104);
  v14(v13, enum case for JoinableStreams.IE_TRANSCRIPT(_:), v8);
  v14(v13 + v10, enum case for JoinableStreams.IE_TELEMETRY(_:), v8);
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of BiomeSessionBuilder.buildSessionView(streams:)
                                                 + async function pointer to dispatch thunk of BiomeSessionBuilder.buildSessionView(streams:));
  uint64_t v15 = (void *)swift_task_alloc();
  v0[13] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_100005DBC;
  uint64_t v16 = v0[9];
  return v18(v16, v12);
}

uint64_t sub_100005DBC()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100005ED4, 0, 0);
}

uint64_t sub_100005ED4()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  sub_100006C40(v0[9], v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_100006D28(v0[8], &qword_10000C190);
    uint64_t v4 = sub_100007130();
    os_log_type_t v5 = sub_100007180();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "No Session objects buildable from Biome", v6, 2u);
      swift_slowDealloc();
    }

    id v7 = objc_allocWithZone((Class)sub_100006E60());
    uint64_t v8 = sub_100006E40();
    swift_release();
  }
  else
  {
    (*(void (**)(void, void, void))(v0[6] + 32))(v0[7], v0[8], v0[5]);
    sub_100007040();
    swift_allocObject();
    sub_100007030();
    uint64_t v9 = sub_100007020();
    swift_release();
    uint64_t v10 = sub_1000035AC(v9, (uint64_t (*)(void))&type metadata accessor for IERequestGrainMetricsRecord, (uint64_t)&protocol witness table for IERequestGrainMetricsRecord);
    swift_bridgeObjectRelease();
    sub_100006F50();
    swift_allocObject();
    sub_100006F40();
    v11._rawValue = v10;
    sub_100006F10(v11);
    swift_bridgeObjectRelease();
    swift_release();
    sub_100007010();
    swift_allocObject();
    sub_100007000();
    uint64_t v12 = sub_100006FF0();
    swift_release();
    unint64_t v13 = sub_1000035AC(v12, (uint64_t (*)(void))&type metadata accessor for IEPlannerGrainMetricsRecord, (uint64_t)&protocol witness table for IEPlannerGrainMetricsRecord);
    swift_bridgeObjectRelease();
    swift_allocObject();
    sub_100006F40();
    v14._rawValue = v13;
    sub_100006F10(v14);
    swift_bridgeObjectRelease();
    swift_release();
    sub_100007070();
    swift_allocObject();
    sub_100007060();
    uint64_t v15 = sub_100007050();
    swift_release();
    uint64_t v16 = sub_1000035AC(v15, (uint64_t (*)(void))&type metadata accessor for IEExecutionGrainMetricsRecord, (uint64_t)&protocol witness table for IEExecutionGrainMetricsRecord);
    swift_bridgeObjectRelease();
    swift_allocObject();
    sub_100006F40();
    v17._rawValue = v16;
    sub_100006F10(v17);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v19 = v0[6];
    uint64_t v18 = v0[7];
    uint64_t v20 = v0[5];
    id v21 = objc_allocWithZone((Class)sub_100006E60());
    uint64_t v8 = sub_100006E40();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  sub_100006D28(v0[9], &qword_10000C190);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(uint64_t))v0[1];
  return v22(v8);
}

uint64_t sub_100006520(uint64_t a1)
{
  *(void *)(v1 + 56) = a1;
  return _swift_task_switch(sub_100006540, 0, 0);
}

uint64_t sub_100006540()
{
  if (qword_10000C1D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100007140();
  v0[8] = sub_100003E7C(v1, (uint64_t)qword_10000C2E0);
  uint64_t v2 = sub_100007130();
  os_log_type_t v3 = sub_100007190();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "PnROnDeviceWorker doWork start", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)&dword_10000C178 + dword_10000C178);
  os_log_type_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *os_log_type_t v5 = v0;
  v5[1] = sub_1000066A8;
  uint64_t v6 = v0[7];
  return v8(v6);
}

uint64_t sub_1000066A8(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v6 = *v1;
  *(void *)(v2 + 80) = a1;
  swift_task_dealloc();
  os_log_type_t v5 = (uint64_t (__cdecl *)())((char *)&dword_10000C180 + dword_10000C180);
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 88) = v3;
  void *v3 = v6;
  v3[1] = sub_1000067E8;
  return v5();
}

uint64_t sub_1000067E8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000068E8, 0, 0);
}

uint64_t sub_1000068E8()
{
  sub_100006E50();
  uint64_t v1 = sub_100006E90();
  if (v1 != sub_100006E90() || (sub_100006E50(), uint64_t v2 = sub_100006E90(), v2 != sub_100006E90()))
  {
    sub_100006E50();
    uint64_t v3 = sub_100006E90();
    if (v3 != sub_100006E90())
    {
      sub_100006E50();
      uint64_t v4 = sub_100006E90();
      if (v4 != sub_100006E90())
      {
        sub_100006E50();
        uint64_t v5 = sub_100006E90();
        if (v5 != sub_100006E90())
        {
          sub_100006E50();
          uint64_t v6 = sub_100006E90();
          if (v6 != sub_100006E90())
          {
            sub_100006E50();
            uint64_t v7 = sub_100006E90();
            if (v7 != sub_100006E90())
            {
              sub_100006E50();
              sub_100006E90();
              sub_100006E90();
            }
          }
        }
      }
    }
  }
  id v8 = objc_allocWithZone((Class)sub_100006E60());
  uint64_t v9 = (void *)sub_100006E40();
  v0[5] = v9;
  id v10 = v9;
  Swift::OpaquePointer v11 = sub_100007130();
  os_log_type_t v12 = sub_100007190();
  BOOL v13 = os_log_type_enabled(v11, v12);
  Swift::OpaquePointer v14 = (void *)v0[12];
  uint64_t v15 = (void *)v0[10];
  if (v13)
  {
    uint64_t v24 = (void *)v0[10];
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    Swift::OpaquePointer v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 138412290;
    v0[6] = v10;
    log = v11;
    uint64_t v18 = v14;
    id v19 = v10;
    sub_1000071A0();
    void *v17 = v10;

    Swift::OpaquePointer v14 = v18;
    Swift::OpaquePointer v11 = log;
    _os_log_impl((void *)&_mh_execute_header, log, v12, "PnROnDeviceWorker doWork end %@", v16, 0xCu);
    sub_100006BFC(&qword_10000C188);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v15 = v24;
    swift_slowDealloc();
  }
  else
  {
  }
  swift_beginAccess();
  uint64_t v20 = v0[5];
  id v21 = (uint64_t (*)(uint64_t))v0[1];
  return v21(v20);
}

uint64_t sub_100006BFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006C40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006BFC(&qword_10000C190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100006CA8(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100006D0C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100006D28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006BFC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006D84(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006E30()
{
  return static AppExtension.main()();
}

uint64_t sub_100006E40()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100006E50()
{
  return MLHostResult.status.getter();
}

uint64_t sub_100006E60()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100006E90()
{
  return MLHostResultStatus.rawValue.getter();
}

uint64_t sub_100006EA0()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_100006EB0()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_100006EC0()
{
  return static PnRConstants.dataWorkerBundleID.getter();
}

uint64_t sub_100006ED0()
{
  return PnRSiriTurnGrainSummary.description.getter();
}

uint64_t sub_100006EE0()
{
  return type metadata accessor for PnRSiriTurnGrainSummary();
}

uint64_t sub_100006EF0()
{
  return static ErrorSubType.PnROnDeviceWorker.getter();
}

uint64_t sub_100006F00()
{
  return static FileRadarUtils.autoBugCapture(errorType:errorSubType:subTypeContext:)();
}

void sub_100006F10(Swift::OpaquePointer a1)
{
}

uint64_t sub_100006F20()
{
  return SELFPnREmitter.uploadSiriTurnGrainLatency(for:)();
}

uint64_t sub_100006F30()
{
  return SELFPnREmitter.uploadProvisionalSiriTurnGrainLatency(for:)();
}

uint64_t sub_100006F40()
{
  return SELFPnREmitter.init()();
}

uint64_t sub_100006F50()
{
  return type metadata accessor for SELFPnREmitter();
}

uint64_t sub_100006F60()
{
  return static StreamIdentifier.SELFProcessedStreamIdentifier.getter();
}

uint64_t sub_100006F70()
{
  return static ErrorSubTypeContext.PnROnDeviceUploadException.getter();
}

uint64_t sub_100006F80()
{
  return static ErrorSubTypeContext.PnROnDeviceWorkerException.getter();
}

uint64_t sub_100006F90()
{
  return type metadata accessor for ReliabilityCategory.PnROnDeviceWorkerIssues();
}

uint64_t sub_100006FA0()
{
  return type metadata accessor for ReliabilityCategory.SELFUploadIssues();
}

uint64_t sub_100006FB0()
{
  return type metadata accessor for ReliabilityCategory();
}

uint64_t sub_100006FC0()
{
  return SiriTurnGrainCalculator.extractLatencies()();
}

uint64_t sub_100006FD0()
{
  return SiriTurnGrainCalculator.init(from:)();
}

uint64_t sub_100006FE0()
{
  return type metadata accessor for SiriTurnGrainCalculator();
}

uint64_t sub_100006FF0()
{
  return dispatch thunk of IEPlannerGrainCalculator.extractMetrics(from:)();
}

uint64_t sub_100007000()
{
  return IEPlannerGrainCalculator.init()();
}

uint64_t sub_100007010()
{
  return type metadata accessor for IEPlannerGrainCalculator();
}

uint64_t sub_100007020()
{
  return dispatch thunk of IERequestGrainCalculator.extractMetrics(from:)();
}

uint64_t sub_100007030()
{
  return IERequestGrainCalculator.init()();
}

uint64_t sub_100007040()
{
  return type metadata accessor for IERequestGrainCalculator();
}

uint64_t sub_100007050()
{
  return dispatch thunk of IEExecutionGrainCalculator.extractMetrics(from:)();
}

uint64_t sub_100007060()
{
  return IEExecutionGrainCalculator.init()();
}

uint64_t sub_100007070()
{
  return type metadata accessor for IEExecutionGrainCalculator();
}

uint64_t sub_100007080()
{
  return SELFProcessedStreamTurnReader.init(streamIdentifier:domain:)();
}

uint64_t sub_1000070A0()
{
  return type metadata accessor for SELFProcessedStreamTurnReader();
}

uint64_t sub_1000070B0()
{
  return static Logger.pnrworker.getter();
}

uint64_t sub_1000070C0()
{
  return static ErrorType.fatal.getter();
}

uint64_t sub_1000070D0()
{
  return type metadata accessor for SessionView();
}

uint64_t sub_1000070E0()
{
  return type metadata accessor for JoinableStreams();
}

uint64_t sub_1000070F0()
{
  return dispatch thunk of BiomeSessionBuilder.useManagedBookmarkFor(clientApplicationDomain:)();
}

uint64_t sub_100007100()
{
  return BiomeSessionBuilder.init()();
}

uint64_t sub_100007110()
{
  return type metadata accessor for BiomeSessionBuilder();
}

uint64_t sub_100007120()
{
  return Logger.error(_:_:)();
}

uint64_t sub_100007130()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007140()
{
  return type metadata accessor for Logger();
}

Swift::Int sub_100007150()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100007160()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_100007170()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100007180()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100007190()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000071A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000071B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000071C0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000071D0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000071E0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000071F0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007200()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100007210()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}