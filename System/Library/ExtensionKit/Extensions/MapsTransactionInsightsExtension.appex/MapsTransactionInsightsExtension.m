unint64_t sub_1000051F8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  long long v17;

  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007084(&qword_10000C188);
  v2 = sub_1000075E0();
  v3 = (void *)v2;
  v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1000070E0(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_100006540(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_100007148(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
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

uint64_t sub_100005324(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_100007490();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  uint64_t v4 = sub_1000073A0();
  v2[9] = v4;
  v2[10] = *(void *)(v4 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v5 = sub_100007410();
  v2[12] = v5;
  v2[13] = *(void *)(v5 - 8);
  v2[14] = swift_task_alloc();
  uint64_t v6 = sub_100007520();
  v2[15] = v6;
  v2[16] = *(void *)(v6 - 8);
  v2[17] = swift_task_alloc();
  return _swift_task_switch(sub_1000054F8, 0, 0);
}

uint64_t sub_1000054F8()
{
  v53 = v0;
  uint64_t v1 = v0;
  v2 = v0 + 4;
  sub_100007500();
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_100007510();
  os_log_type_t v4 = sub_100007570();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v42 = v4;
    uint64_t v5 = *v2;
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    v43 = v6;
    *(_DWORD *)uint64_t v6 = 136315138;
    int64_t v7 = *(void *)(v5 + 16);
    uint64_t v8 = &_swiftEmptyArrayStorage;
    v49 = v1;
    if (v7)
    {
      v41 = v3;
      uint64_t v9 = v1[13];
      uint64_t v10 = v1[10];
      uint64_t v11 = v1[7];
      uint64_t v12 = v1[4];
      v52 = &_swiftEmptyArrayStorage;
      sub_10000669C(0, v7, 0);
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
      v9 += 16;
      uint64_t v14 = v12 + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
      uint64_t v47 = *(void *)(v9 + 56);
      v48 = v13;
      v45 = (void (**)(uint64_t, uint64_t))(v10 + 8);
      v46 = (void (**)(uint64_t, uint64_t))(v11 + 8);
      v44 = (void (**)(uint64_t, uint64_t))(v9 - 8);
      uint64_t v8 = &_swiftEmptyArrayStorage;
      do
      {
        uint64_t v15 = v1[14];
        uint64_t v16 = v1[11];
        uint64_t v17 = v1[12];
        uint64_t v19 = v1[8];
        uint64_t v18 = v1[9];
        uint64_t v20 = v1[6];
        v48(v15, v14, v17);
        sub_100007400();
        sub_100007390();
        uint64_t v21 = sub_100007480();
        uint64_t v50 = v22;
        (*v46)(v19, v20);
        (*v45)(v16, v18);
        (*v44)(v15, v17);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10000669C(0, v8[2] + 1, 1);
          uint64_t v8 = v52;
        }
        unint64_t v24 = v8[2];
        unint64_t v23 = v8[3];
        uint64_t v1 = v49;
        if (v24 >= v23 >> 1)
        {
          sub_10000669C(v23 > 1, v24 + 1, 1);
          uint64_t v8 = v52;
        }
        v8[2] = v24 + 1;
        v25 = (char *)&v8[2 * v24];
        *((void *)v25 + 4) = v21;
        *((void *)v25 + 5) = v50;
        v14 += v47;
        --v7;
      }
      while (v7);
      uint64_t v3 = v41;
    }
    uint64_t v29 = v1[16];
    uint64_t v30 = v1[17];
    uint64_t v31 = v1[15];
    v1[2] = v8;
    sub_100007084(&qword_10000C1A0);
    sub_10000719C();
    uint64_t v32 = sub_100007530();
    unint64_t v34 = v33;
    swift_bridgeObjectRelease();
    v49[3] = sub_100005EE8(v32, v34, &v51);
    sub_100007590();
    uint64_t v1 = v49;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v3, v42, "Classifying transactions: %s", v43, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
  }
  else
  {
    uint64_t v26 = v1[16];
    uint64_t v27 = v1[17];
    uint64_t v28 = v1[15];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v28);
  }
  v35 = (void *)v1[5];
  uint64_t v36 = v35[5];
  uint64_t v37 = v35[6];
  sub_100007158(v35 + 2, v36);
  v38 = (void *)swift_task_alloc();
  v1[18] = v38;
  void *v38 = v1;
  v38[1] = sub_100005960;
  uint64_t v39 = v1[4];
  return dispatch thunk of MapsTransactionClassifying.classifyTransactions(_:)(v39, v36, v37);
}

uint64_t sub_100005960(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100005ADC()
{
  sub_1000072A0(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_100005B14(uint64_t a1)
{
  uint64_t v2 = sub_100005EA8(&qword_10000C170);

  return MapsInsightsExtension.configuration.getter(a1, v2);
}

uint64_t sub_100005B7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006828();
  *a1 = result;
  return result;
}

uint64_t sub_100005BA4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005C3C;
  return sub_100005324(a1);
}

uint64_t sub_100005C3C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for MapsTransactionInsightsExtensionImplementation()
{
  return self;
}

uint64_t sub_100005DD4()
{
  return sub_100005EA8(&qword_10000C0B8);
}

uint64_t sub_100005E08()
{
  return sub_100005EA8(&qword_10000C168);
}

uint64_t sub_100005E3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005EA8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MapsTransactionInsightsExtensionImplementation();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005EE8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005FBC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007240((uint64_t)v12, *a3);
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
      sub_100007240((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000072A0((uint64_t)v12);
  return v7;
}

uint64_t sub_100005FBC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000075A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006178(a5, a6);
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
  uint64_t v8 = sub_1000075C0();
  if (!v8)
  {
    sub_1000075D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000075F0();
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

uint64_t sub_100006178(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006210(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000063F0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000063F0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006210(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006388(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000075B0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000075D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007560();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000075F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000075D0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006388(uint64_t a1, uint64_t a2)
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
  sub_100007084(&qword_10000C1B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000063F0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007084(&qword_10000C1B0);
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
  uint64_t result = sub_1000075F0();
  __break(1u);
  return result;
}

unint64_t sub_100006540(uint64_t a1, uint64_t a2)
{
  sub_100007610();
  sub_100007550();
  Swift::Int v4 = sub_100007620();

  return sub_1000065B8(a1, a2, v4);
}

unint64_t sub_1000065B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100007600() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100007600() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000669C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000066BC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000066BC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007084(&qword_10000C1B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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
  uint64_t result = sub_1000075F0();
  __break(1u);
  return result;
}

uint64_t sub_100006828()
{
  uint64_t v36 = sub_100007520();
  v35[2] = *(void *)(v36 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v35[1] = (char *)v35 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007470();
  ((void (*)(void))__chkstk_darwin)();
  v40 = (char *)v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007450();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v39 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1000073F0();
  uint64_t v3 = *(void *)(v37 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v38 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)v35 - v6;
  uint64_t v8 = sub_100007360();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  int64_t v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100007300();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000072F0();
  uint64_t v45 = v12;
  v46 = &protocol witness table for FinanceTrialProvider;
  uint64_t v16 = sub_100007020((uint64_t *)&v44);
  (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 16))(v16, v15, v12);
  uint64_t v17 = sub_100007440();
  swift_allocObject();
  uint64_t v18 = sub_100007430();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v45 = v17;
  v46 = &protocol witness table for PIIRedactionRegexCollectionProvider;
  *(void *)&long long v44 = v18;
  uint64_t v19 = sub_100007380();
  swift_allocObject();
  uint64_t v20 = sub_100007370();
  sub_100007084(&qword_10000C178);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000078E0;
  *(void *)(inited + 32) = sub_100007540();
  *(void *)(inited + 40) = v22;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 80) = sub_100007540();
  *(void *)(inited + 88) = v23;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for XPCMachService.coreDataStore(_:), v8);
  uint64_t v24 = sub_100007350();
  uint64_t v26 = v25;
  uint64_t v27 = v8;
  uint64_t v28 = v37;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v27);
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v24;
  *(void *)(inited + 104) = v26;
  sub_1000051F8(inited);
  sub_1000073E0();
  sub_100007420();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v7, enum case for CoreDataStoreConfiguration.client(_:), v28);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v38, v7, v28);
  sub_100007340();
  swift_allocObject();
  sub_100007330();
  sub_1000073C0();
  swift_allocObject();
  sub_1000073B0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v28);
  uint64_t v45 = v19;
  v46 = &protocol witness table for PIIStringProcessor;
  *(void *)&long long v44 = v20;
  uint64_t v29 = sub_1000074E0();
  swift_allocObject();
  swift_retain();
  swift_retain();
  uint64_t v30 = sub_1000074D0();
  v43 = &protocol witness table for MerchantLookupRequestExecutor;
  uint64_t v42 = v29;
  uint64_t v41 = v30;
  sub_100007460();
  sub_100007320();
  sub_100007310();
  uint64_t v31 = sub_1000074B0();
  swift_allocObject();
  uint64_t v32 = sub_1000074A0();
  swift_release();
  swift_release();
  uint64_t v45 = v31;
  v46 = &protocol witness table for MapsTransactionClassifier;
  *(void *)&long long v44 = v32;
  type metadata accessor for MapsTransactionInsightsExtensionImplementation();
  uint64_t v33 = swift_allocObject();
  sub_1000070C8(&v44, v33 + 16);
  return v33;
}

uint64_t *sub_100007020(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100007084(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000070C8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000070E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007084(&qword_10000C190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100007148(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_100007158(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000719C()
{
  unint64_t result = qword_10000C1A8;
  if (!qword_10000C1A8)
  {
    sub_1000071F8(&qword_10000C1A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1A8);
  }
  return result;
}

uint64_t sub_1000071F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007240(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000072A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000072F0()
{
  return FinanceTrialProvider.init()();
}

uint64_t sub_100007300()
{
  return type metadata accessor for FinanceTrialProvider();
}

uint64_t sub_100007310()
{
  return static FinanceStore.shared.getter();
}

uint64_t sub_100007320()
{
  return type metadata accessor for FinanceStore();
}

uint64_t sub_100007330()
{
  return CoreDataStore.init(configuration:)();
}

uint64_t sub_100007340()
{
  return type metadata accessor for CoreDataStore();
}

uint64_t sub_100007350()
{
  return XPCMachService.rawValue.getter();
}

uint64_t sub_100007360()
{
  return type metadata accessor for XPCMachService();
}

uint64_t sub_100007370()
{
  return PIIStringProcessor.init(regexCollectionProvider:)();
}

uint64_t sub_100007380()
{
  return type metadata accessor for PIIStringProcessor();
}

uint64_t sub_100007390()
{
  return InternalTransaction.id.getter();
}

uint64_t sub_1000073A0()
{
  return type metadata accessor for InternalTransaction();
}

uint64_t sub_1000073B0()
{
  return NetworkEventRecorder.init(coreDataStore:)();
}

uint64_t sub_1000073C0()
{
  return type metadata accessor for NetworkEventRecorder();
}

uint64_t sub_1000073E0()
{
  return static CoreDataStoreConfiguration.localStoreUrl.getter();
}

uint64_t sub_1000073F0()
{
  return type metadata accessor for CoreDataStoreConfiguration();
}

uint64_t sub_100007400()
{
  return MapsTransactionInsightInput.transaction.getter();
}

uint64_t sub_100007410()
{
  return type metadata accessor for MapsTransactionInsightInput();
}

uint64_t sub_100007420()
{
  return CoreDataStoreClientConfiguration.init(url:options:)();
}

uint64_t sub_100007430()
{
  return PIIRedactionRegexCollectionProvider.init(trialProvider:)();
}

uint64_t sub_100007440()
{
  return type metadata accessor for PIIRedactionRegexCollectionProvider();
}

uint64_t sub_100007450()
{
  return type metadata accessor for URL();
}

uint64_t sub_100007460()
{
  return static Date.now.getter();
}

uint64_t sub_100007470()
{
  return type metadata accessor for Date();
}

uint64_t sub_100007480()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100007490()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000074A0()
{
  return MapsTransactionClassifier.init(lookupRequestExecutor:updateTime:financeStore:piiProcessor:networkEventRecorder:)();
}

uint64_t sub_1000074B0()
{
  return type metadata accessor for MapsTransactionClassifier();
}

uint64_t sub_1000074D0()
{
  return MerchantLookupRequestExecutor.init()();
}

uint64_t sub_1000074E0()
{
  return type metadata accessor for MerchantLookupRequestExecutor();
}

uint64_t sub_1000074F0()
{
  return static AppExtension.main()();
}

uint64_t sub_100007500()
{
  return static Logger.bankConnect.getter();
}

uint64_t sub_100007510()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007520()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100007530()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100007540()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100007550()
{
  return String.hash(into:)();
}

Swift::Int sub_100007560()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100007570()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100007580()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100007590()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000075A0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000075B0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000075C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000075D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000075E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000075F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100007600()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007610()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100007620()
{
  return Hasher._finalize()();
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

uint64_t self
{
  return _self;
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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