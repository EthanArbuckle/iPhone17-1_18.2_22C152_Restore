uint64_t sub_100005010()
{
  uint64_t v0;

  v0 = sub_1000074A0();
  sub_10000733C(v0, qword_10000C058);
  sub_1000071F4(v0, (uint64_t)qword_10000C058);
  return sub_100007490();
}

uint64_t sub_10000508C(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C020 + dword_10000C020);
  v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100005134;
  return v5(a1);
}

uint64_t sub_100005134()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005228(uint64_t a1)
{
  unint64_t v2 = sub_100005390();

  return IngestionExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000052D4()
{
  unint64_t result = qword_10000C008;
  if (!qword_10000C008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C008);
  }
  return result;
}

ValueMetadata *type metadata accessor for IFTranscriptSELFIngestorExtension()
{
  return &type metadata for IFTranscriptSELFIngestorExtension;
}

uint64_t sub_10000533C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100005390()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

char *sub_1000053E4(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000071B0(&qword_10000C040);
      v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      v10 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100005B4C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000054F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000055C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000072DC((uint64_t)v12, *a3);
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
      sub_1000072DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000728C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000055C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100007500();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005784(a5, a6);
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
  uint64_t v8 = sub_100007520();
  if (!v8)
  {
    sub_100007530();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100007540();
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

uint64_t sub_100005784(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000581C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000059FC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000059FC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000581C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005994(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100007510();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100007530();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000074C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100007540();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100007530();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005994(uint64_t a1, uint64_t a2)
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
  sub_1000071B0(&qword_10000C038);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000059FC(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000071B0(&qword_10000C038);
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
  v13 = a4 + 32;
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
  uint64_t result = sub_100007540();
  __break(1u);
  return result;
}

uint64_t sub_100005B4C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_1000071B0(&qword_10000C048);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100007540();
  __break(1u);
  return result;
}

uint64_t sub_100005C58(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_100007470();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  sub_1000071B0(&qword_10000C028);
  v1[9] = swift_task_alloc();
  uint64_t v3 = sub_100007440();
  v1[10] = v3;
  v1[11] = *(void *)(v3 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  return _swift_task_switch(sub_100005DB4, 0, 0);
}

uint64_t sub_100005DB4()
{
  sub_1000073D0();
  swift_allocObject();
  v0[14] = sub_1000073C0();
  if (qword_10000C050 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000074A0();
  v0[15] = sub_1000071F4(v1, (uint64_t)qword_10000C058);
  uint64_t v2 = sub_100007480();
  os_log_type_t v3 = sub_1000074D0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Begin ingesting", v4, 2u);
    swift_slowDealloc();
  }

  sub_100007410();
  swift_retain();
  v0[16] = sub_100007400();
  int64_t v7 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of ObjCSELFMapper.loadBiomeEvent()
                         + async function pointer to dispatch thunk of ObjCSELFMapper.loadBiomeEvent());
  uint64_t v5 = (void *)swift_task_alloc();
  v0[17] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100005F78;
  return v7();
}

uint64_t sub_100005F78(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  *(void *)(v3 + 144) = a1;
  swift_task_dealloc();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 152) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000060D0;
  return IFTranscriptSELFMapper.adaptToSELF(events:)(a1);
}

uint64_t sub_1000060D0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 160) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000061F0, 0, 0);
}

uint64_t sub_1000061F0()
{
  v45 = v0;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_100007480();
  os_log_type_t v2 = sub_1000074D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[20];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    v0[4] = *(void *)(v3 + 16);
    sub_1000074F0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "SELF message count: %ld", v4, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  uint64_t v5 = v0[20];
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    v36 = v0 + 3;
    uint64_t v7 = v0[11];
    uint64_t v10 = *(void (**)(void, uint64_t, void))(v7 + 16);
    uint64_t v9 = v7 + 16;
    uint64_t v8 = v10;
    uint64_t v11 = v5 + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
    uint64_t v12 = (void (**)(uint64_t, uint64_t))(v9 - 8);
    uint64_t v40 = *(void *)(v9 + 56);
    v37 = (void (**)(uint64_t, uint64_t))(v9 - 8);
    v41 = v10;
    do
    {
      v8(v0[13], v11, v0[10]);
      sub_100007420();
      v14 = (void *)sub_100007430();
      sub_1000073A0();
      v0[21] = 0;
      uint64_t v16 = v0[12];
      uint64_t v15 = v0[13];
      uint64_t v17 = v0[10];
      sub_10000722C(v0[9]);

      uint64_t v18 = v17;
      uint64_t v8 = v41;
      v41(v16, v15, v18);
      v19 = sub_100007480();
      os_log_type_t v20 = sub_1000074D0();
      BOOL v21 = os_log_type_enabled(v19, v20);
      uint64_t v22 = v0[12];
      uint64_t v23 = v0[13];
      uint64_t v42 = v0[10];
      if (v21)
      {
        uint64_t v39 = v0[13];
        uint64_t v24 = swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 136315138;
        v25 = (void *)sub_100007430();
        os_log_type_t type = v20;
        uint64_t v26 = v6;
        uint64_t v27 = v9;
        id v28 = objc_msgSend(v25, "qualifiedMessageName", v36);

        uint64_t v29 = sub_1000074B0();
        unint64_t v31 = v30;

        uint64_t v9 = v27;
        uint64_t v6 = v26;
        uint64_t v32 = v29;
        uint64_t v12 = v37;
        *(void *)(v24 + 4) = sub_1000054F4(v32, v31, &v44);
        swift_bridgeObjectRelease();
        v33 = *v37;
        (*v37)(v22, v42);
        _os_log_impl((void *)&_mh_execute_header, v19, type, "appended %s to SELF staging pool", (uint8_t *)v24, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v33(v39, v42);
        uint64_t v8 = v41;
      }
      else
      {

        v13 = *v12;
        (*v12)(v22, v42);
        v13(v23, v42);
      }
      v11 += v40;
      --v6;
    }
    while (v6);
  }
  swift_bridgeObjectRelease();
  v43 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of OLEStreamTelemetry.emit()
                          + async function pointer to dispatch thunk of OLEStreamTelemetry.emit());
  v34 = (void *)swift_task_alloc();
  v0[22] = v34;
  void *v34 = v0;
  v34[1] = sub_100006808;
  return v43();
}

uint64_t sub_100006808()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100006904, 0, 0);
}

uint64_t sub_100006904()
{
  swift_release();
  v0[23] = &_swiftEmptyArrayStorage;
  uint64_t v1 = sub_100007480();
  os_log_type_t v2 = sub_1000074D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "IF RequestLinks: begin ingesting", v3, 2u);
    swift_slowDealloc();
  }

  sub_100007450();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[24] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100006A50;
  uint64_t v5 = v0[5];
  return IFRequestTelemetryRequestLinkMapper.ingest(dataPool:)(v5);
}

uint64_t sub_100006A50()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_100006ED0;
  }
  else {
    os_log_type_t v2 = sub_100006B64;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006B64()
{
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  if (*(void *)(v0[23] + 16))
  {
    swift_errorRetain();
    swift_bridgeObjectRelease();
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100006C8C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100006D88, 0, 0);
}

uint64_t sub_100006D88()
{
  swift_errorRelease();
  v0[23] = v0[26];
  uint64_t v1 = sub_100007480();
  os_log_type_t v2 = sub_1000074D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "IF RequestLinks: begin ingesting", v3, 2u);
    swift_slowDealloc();
  }

  sub_100007450();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[24] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100006A50;
  uint64_t v5 = v0[5];
  return IFRequestTelemetryRequestLinkMapper.ingest(dataPool:)(v5);
}

uint64_t sub_100006ED0()
{
  (*(void (**)(void, void))(*(void *)(v0 + 56) + 8))(*(void *)(v0 + 64), *(void *)(v0 + 48));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100007480();
  os_log_type_t v2 = sub_1000074E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v5;
    sub_1000074F0();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error ingesting IF RequestLinks: %@", v3, 0xCu);
    sub_1000071B0(&qword_10000C030);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_errorRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *(char **)(v0 + 184);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v7 = sub_1000053E4(0, *((void *)v7 + 2) + 1, 1, *(char **)(v0 + 184));
  }
  unint64_t v9 = *((void *)v7 + 2);
  unint64_t v8 = *((void *)v7 + 3);
  if (v9 >= v8 >> 1) {
    uint64_t v7 = sub_1000053E4((char *)(v8 > 1), v9 + 1, 1, v7);
  }
  uint64_t v10 = *(void *)(v0 + 200);
  *((void *)v7 + 2) = v9 + 1;
  *(void *)&v7[8 * v9 + 32] = v10;
  swift_errorRelease();
  if (*((void *)v7 + 2))
  {
    swift_errorRetain();
    swift_bridgeObjectRelease();
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_1000071B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000071F4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000722C(uint64_t a1)
{
  uint64_t v2 = sub_1000071B0(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000728C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000072DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_10000733C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000073A0()
{
  return StagingPool.add(timestamp:message:)();
}

uint64_t sub_1000073C0()
{
  return OLEStreamTelemetry.init()();
}

uint64_t sub_1000073D0()
{
  return type metadata accessor for OLEStreamTelemetry();
}

uint64_t sub_1000073E0()
{
  return static AppExtension.main()();
}

uint64_t sub_100007400()
{
  return IFTranscriptSELFMapper.__allocating_init(bookmarkSuite:selfTelemetry:)();
}

uint64_t sub_100007410()
{
  return type metadata accessor for IFTranscriptSELFMapper();
}

uint64_t sub_100007420()
{
  return IFSELFMessageEventWrapper.monotonicTimeStampForSELF.getter();
}

uint64_t sub_100007430()
{
  return IFSELFMessageEventWrapper.message.getter();
}

uint64_t sub_100007440()
{
  return type metadata accessor for IFSELFMessageEventWrapper();
}

uint64_t sub_100007450()
{
  return IFRequestTelemetryRequestLinkMapper.init(bookmarkSuite:)();
}

uint64_t sub_100007470()
{
  return type metadata accessor for IFRequestTelemetryRequestLinkMapper();
}

uint64_t sub_100007480()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007490()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000074A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000074B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_1000074C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000074D0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000074E0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000074F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007500()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100007510()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100007520()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007530()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007540()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}