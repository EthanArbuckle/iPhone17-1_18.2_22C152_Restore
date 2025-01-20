int64_t sub_10001853C(id a1, NSArray *a2, NSArray *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  v6 = [location[0] firstObject];
  v5 = [v8 firstObject];
  v7 = objc_msgSend(v6, "compare:");

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return (int64_t)v7;
}

uint64_t sub_100022540(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100024004(&qword_100032698);
    v2 = (void *)sub_1000256C0();
  }
  else
  {
    v2 = &_swiftEmptyDictionarySingleton;
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
  v6 = (char *)(v2 + 8);
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
    v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1000240A0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100024678(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_100024678(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_100024678(v36, v37);
    sub_100024678(v37, &v33);
    uint64_t result = sub_100025660(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_100024678(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_100024688();
    return (uint64_t)v2;
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

unint64_t sub_100022908(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100024004(&qword_100032688);
  uint64_t v2 = sub_1000256C0();
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
    sub_100024610(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100023308(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100024678(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100022A34()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for PFLAMDODMLTaskRunner()
{
  return self;
}

void sub_100022A90()
{
}

uint64_t sub_100022AA8()
{
  return sub_100024690(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 1);
}

uint64_t sub_100022AE0(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100032680 + dword_100032680);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100022B90;
  return v5(a1);
}

uint64_t sub_100022B90(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100022C90()
{
  return sub_100023DC8();
}

uint64_t sub_100022CA8()
{
  return 0;
}

uint64_t sub_100022CB0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100022D84(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000240A0((uint64_t)v12, *a3);
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
      sub_1000240A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100024150((uint64_t)v12);
  return v7;
}

uint64_t sub_100022D84(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100025640();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100022F40(a5, a6);
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
  uint64_t v8 = sub_1000256A0();
  if (!v8)
  {
    sub_1000256B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000256D0();
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

uint64_t sub_100022F40(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100022FD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000231B8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000231B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100022FD8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100023150(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100025690();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000256B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100025600();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000256D0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000256B0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100023150(uint64_t a1, uint64_t a2)
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
  sub_100024004(&qword_100032678);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000231B8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100024004(&qword_100032678);
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
  uint64_t result = sub_1000256D0();
  __break(1u);
  return result;
}

unint64_t sub_100023308(uint64_t a1, uint64_t a2)
{
  sub_1000256F0();
  sub_1000255E0();
  Swift::Int v4 = sub_100025700();

  return sub_1000233C4(a1, a2, v4);
}

unint64_t sub_100023380(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100025660(*(void *)(v2 + 40));

  return sub_1000234A8(a1, v4);
}

unint64_t sub_1000233C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000256E0() & 1) == 0)
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
      while (!v14 && (sub_1000256E0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000234A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000241A4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100025670();
      sub_1000240FC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100023570()
{
  uint64_t v52 = sub_100025580();
  uint64_t v0 = *(void *)(v52 - 8);
  uint64_t v1 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v1);
  char v6 = (char *)&v50 - v5;
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v50 - v8;
  __chkstk_darwin(v7);
  BOOL v11 = (char *)&v50 - v10;
  sub_1000255C0();
  id v12 = objc_allocWithZone((Class)AMDClientRequestEvent);
  NSString v13 = sub_1000255B0();
  NSString v14 = sub_1000255B0();
  swift_bridgeObjectRelease();
  id v15 = [v12 initWithFeatureName:v13 withAccountDSID:0 andAccountStoreFrontId:0 inDomain:v14 withCustomDescriptor:0 andSchemaVersion:0];

  if (!v15)
  {
    sub_1000254A0();
    unint64_t v22 = sub_100025570();
    os_log_type_t v23 = sub_100025620();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to create AMDClientRequestEvent", v24, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v0 + 8))(v3, v52);
    goto LABEL_20;
  }
  id v16 = [objc_allocWithZone((Class)AMDClient) init];
  id v17 = [v16 getFeature:v15];

  if (!v17) {
    goto LABEL_17;
  }
  uint64_t v18 = sub_1000255A0();

  uint64_t v53 = sub_1000255C0();
  unint64_t v54 = v19;
  sub_100025680();
  if (*(void *)(v18 + 16) && (unint64_t v20 = sub_100023380((uint64_t)v55), (v21 & 1) != 0))
  {
    sub_1000240A0(*(void *)(v18 + 56) + 32 * v20, (uint64_t)&v56);
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  sub_1000240FC((uint64_t)v55);
  if (!*((void *)&v57 + 1))
  {
    swift_bridgeObjectRelease();
    sub_100023FA4((uint64_t)&v56);
LABEL_17:
    sub_1000254A0();
    uint64_t v28 = sub_100025570();
    os_log_type_t v29 = sub_100025620();
    if (os_log_type_enabled(v28, v29))
    {
      long long v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to get feature contains_arcade_plays from AMDClient", v30, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v0 + 8))(v6, v52);
    goto LABEL_20;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  uint64_t v26 = v53;
  unint64_t v25 = v54;
  if (v26 != sub_1000255C0() || v25 != v27)
  {
    char v33 = sub_1000256E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v33) {
      goto LABEL_23;
    }
    uint64_t v53 = sub_1000255C0();
    unint64_t v54 = v42;
    sub_100025680();
    if (*(void *)(v18 + 16) && (unint64_t v43 = sub_100023380((uint64_t)v55), (v44 & 1) != 0))
    {
      sub_1000240A0(*(void *)(v18 + 56) + 32 * v43, (uint64_t)&v56);
    }
    else
    {
      long long v56 = 0u;
      long long v57 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_1000240FC((uint64_t)v55);
    if (*((void *)&v57 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v46 = v53;
        unint64_t v45 = v54;
LABEL_46:
        sub_1000254A0();
        swift_bridgeObjectRetain();
        v47 = sub_100025570();
        os_log_type_t v48 = sub_100025620();
        if (os_log_type_enabled(v47, v48))
        {
          uint64_t v51 = v46;
          v49 = (uint8_t *)swift_slowAlloc();
          v55[0] = swift_slowAlloc();
          *(_DWORD *)v49 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)&long long v56 = sub_100022CB0(v51, v45, v55);
          sub_100025630();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "Failed to get feature contains_arcade_plays from AMDClient with error %s", v49, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }

        (*(void (**)(char *, uint64_t))(v0 + 8))(v9, v52);
LABEL_20:
        char v31 = 0;
        return v31 & 1;
      }
    }
    else
    {
      sub_100023FA4((uint64_t)&v56);
    }
    unint64_t v45 = 0xE700000000000000;
    uint64_t v46 = 0x6E776F6E6B6E75;
    goto LABEL_46;
  }
  swift_bridgeObjectRelease_n();
LABEL_23:
  uint64_t v53 = sub_1000255C0();
  unint64_t v54 = v34;
  sub_100025680();
  if (*(void *)(v18 + 16) && (unint64_t v35 = sub_100023380((uint64_t)v55), (v36 & 1) != 0))
  {
    sub_1000240A0(*(void *)(v18 + 56) + 32 * v35, (uint64_t)&v56);
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1000240FC((uint64_t)v55);
  if (!*((void *)&v57 + 1))
  {
    sub_100023FA4((uint64_t)&v56);
    goto LABEL_33;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_33:
    sub_1000254A0();
    v37 = sub_100025570();
    os_log_type_t v38 = sub_100025620();
    if (os_log_type_enabled(v37, v38))
    {
      long long v39 = (uint8_t *)swift_slowAlloc();
      v55[0] = swift_slowAlloc();
      *(_DWORD *)long long v39 = 136315138;
      uint64_t v40 = sub_1000255C0();
      *(void *)&long long v56 = sub_100022CB0(v40, v41, v55);
      sub_100025630();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "No %s returned from AMDClient", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v0 + 8))(v11, v52);
    goto LABEL_20;
  }
  if (v53 == 1702195828 && v54 == 0xE400000000000000)
  {

    swift_bridgeObjectRelease();
    char v31 = 1;
  }
  else
  {
    char v31 = sub_1000256E0();

    swift_bridgeObjectRelease();
  }
  return v31 & 1;
}

uint64_t sub_100023DC8()
{
  uint64_t v0 = sub_100025530();
  if (!*(void *)(v0 + 16) || (unint64_t v1 = sub_100023308(0xD000000000000010, 0x800000010002AFB0), (v2 & 1) == 0))
  {
    long long v9 = 0u;
    long long v10 = 0u;
    swift_bridgeObjectRelease();
    return sub_100023FA4((uint64_t)&v9);
  }
  sub_1000240A0(*(void *)(v0 + 56) + 32 * v1, (uint64_t)&v9);
  swift_bridgeObjectRelease();
  if (!*((void *)&v10 + 1)) {
    return sub_100023FA4((uint64_t)&v9);
  }
  sub_100024004(&qword_100032668);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    return result;
  }
  if (*(void *)(v8 + 16) && (unint64_t v4 = sub_100023308(0xD000000000000015, 0x800000010002AFD0), (v5 & 1) != 0))
  {
    sub_1000240A0(*(void *)(v8 + 56) + 32 * v4, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v10 + 1)) {
    return sub_100023FA4((uint64_t)&v9);
  }
  uint64_t result = swift_dynamicCast();
  if result && (v8)
  {
    uint64_t v6 = sub_100025540();
    sub_100024048();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for PFLError.dataNotAvailable(_:), v6);
    if (sub_100023570()) {
      return swift_errorRelease();
    }
    else {
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_100023FA4(uint64_t a1)
{
  uint64_t v2 = sub_100024004(&qword_100032660);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100024004(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100024048()
{
  unint64_t result = qword_100032670;
  if (!qword_100032670)
  {
    sub_100025540();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032670);
  }
  return result;
}

uint64_t sub_1000240A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000240FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100024150(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000241A4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100024200(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return _swift_task_switch(sub_100024290, 0, 0);
}

uint64_t sub_100024290()
{
  id v1 = objc_allocWithZone((Class)AMDDODMLTask);
  swift_bridgeObjectRetain();
  NSString v2 = sub_1000255B0();
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithErrorDomain:v2];

  uint64_t v4 = sub_100025530();
  sub_100022540(v4);
  swift_bridgeObjectRelease();
  id v5 = objc_allocWithZone((Class)MLRTaskParameters);
  Class isa = sub_100025590().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithParametersDict:isa];

  sub_100025520();
  id v8 = objc_allocWithZone((Class)MLRTaskAttachments);
  sub_100025420();
  Class v9 = sub_100025610().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [v8 initWithURLs:v9];

  id v11 = [objc_allocWithZone((Class)MLRTask) initWithParameters:v7 attachments:v10];
  *(void *)(v0 + 16) = 0;
  id v12 = [v3 performTask:v11 error:v0 + 16];
  NSString v13 = *(void **)(v0 + 16);
  if (v12)
  {
    NSString v14 = v12;
    id v15 = v13;
    id v16 = [v14 JSONResult];
    if (v16)
    {
      id v17 = v16;
      sub_1000255A0();
    }
    else
    {
      sub_100022908((uint64_t)&_swiftEmptyArrayStorage);
    }
    id v21 = [v14 vector];
    if (v21)
    {
      unint64_t v22 = v21;
      sub_100025430();
    }
    sub_1000254C0();
    swift_allocObject();
    uint64_t v23 = sub_1000254B0();

    unint64_t v24 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v24(v23);
  }
  else
  {
    id v18 = v13;
    sub_100025410();

    swift_willThrow();
    unint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
}

uint64_t sub_100024610(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100024004(&qword_100032690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100024678(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100024688()
{
  return swift_release();
}

uint64_t sub_100024690(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_1000246A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_10002540C;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100024750(uint64_t a1)
{
  id v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000326C8 + dword_1000326C8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000247F8;
  return v5(a1);
}

uint64_t sub_1000247F8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000248F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *id v15 = v7;
  v15[1] = sub_1000249D8;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000249D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100024ACC(uint64_t a1)
{
  unint64_t v2 = sub_100024C34();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100024B78()
{
  unint64_t result = qword_1000326A0[0];
  if (!qword_1000326A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000326A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PFLASLArcadeRetention()
{
  return &type metadata for PFLASLArcadeRetention;
}

uint64_t sub_100024BE0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100024C34()
{
  unint64_t result = qword_1000326C0;
  if (!qword_1000326C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000326C0);
  }
  return result;
}

uint64_t sub_100024C88(uint64_t a1)
{
  v1[9] = a1;
  uint64_t v2 = sub_1000254E0();
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  uint64_t v3 = sub_100025510();
  v1[13] = v3;
  v1[14] = *(void *)(v3 - 8);
  v1[15] = swift_task_alloc();
  return _swift_task_switch(sub_100024DA4, 0, 0);
}

uint64_t sub_100024DA4()
{
  id v1 = [self mainBundle];
  id v2 = [v1 bundleIdentifier];

  if (v2)
  {
    uint64_t v3 = v0[12];
    uint64_t v4 = v0[11];
    uint64_t v18 = v0[10];
    uint64_t v5 = sub_1000255C0();
    uint64_t v7 = v6;

    v0[7] = &type metadata for PFLASLArcadeRetention;
    sub_100024004(&qword_1000326D0);
    sub_1000255D0();
    sub_100024004(&qword_1000326D8);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1000283E0;
    swift_bridgeObjectRetain();
    sub_100025500();
    sub_1000254F0();
    v0[8] = v8;
    sub_100025374(&qword_1000326E0, (void (*)(uint64_t))&type metadata accessor for PFLPluginConsent);
    sub_100024004(&qword_1000326E8);
    sub_1000252D0();
    sub_100025650();
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for PFLTaskSource.DodMLProd(_:), v18);
    sub_100025560();
    swift_allocObject();
    v0[16] = sub_100025550();
    v21._countAndFlagsBits = 0x6F44726F7272452ELL;
    v21._object = (void *)0xEC0000006E69616DLL;
    sub_1000255F0(v21);
    uint64_t v9 = type metadata accessor for PFLAMDODMLTaskRunner();
    uint64_t v10 = swift_allocObject();
    v0[17] = v10;
    *(void *)(v10 + 16) = v5;
    *(void *)(v10 + 24) = v7;
    v0[5] = v9;
    uint64_t v11 = sub_100025374(&qword_1000326F8, (void (*)(uint64_t))type metadata accessor for PFLAMDODMLTaskRunner);
    v0[2] = v10;
    v0[6] = v11;
    unint64_t v19 = (char *)&async function pointer to dispatch thunk of PFLPlugin.run(context:runner:)
        + async function pointer to dispatch thunk of PFLPlugin.run(context:runner:);
    swift_retain();
    id v12 = (void *)swift_task_alloc();
    v0[18] = v12;
    *id v12 = v0;
    v12[1] = sub_100025140;
    uint64_t v13 = v0[9];
    return ((uint64_t (*)(uint64_t, void *))v19)(v13, v0 + 2);
  }
  else
  {
    id v15 = objc_allocWithZone((Class)sub_100025460());
    uint64_t v16 = sub_100025450();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
    return v17(v16);
  }
}

uint64_t sub_100025140(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  sub_1000253BC(v2);
  return _swift_task_switch(sub_10002524C, 0, 0);
}

uint64_t sub_10002524C()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 152);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

unint64_t sub_1000252D0()
{
  unint64_t result = qword_1000326F0;
  if (!qword_1000326F0)
  {
    sub_10002532C(&qword_1000326E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000326F0);
  }
  return result;
}

uint64_t sub_10002532C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100025374(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000253BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100025410()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100025420()
{
  return type metadata accessor for URL();
}

uint64_t sub_100025430()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100025440()
{
  return static AppExtension.main()();
}

uint64_t sub_100025450()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100025460()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_1000254A0()
{
  return static PFLLogging.plugin.getter();
}

uint64_t sub_1000254B0()
{
  return PFLTaskResult.init(json:vector:)();
}

uint64_t sub_1000254C0()
{
  return type metadata accessor for PFLTaskResult();
}

void sub_1000254D0()
{
}

uint64_t sub_1000254E0()
{
  return type metadata accessor for PFLTaskSource();
}

uint64_t sub_1000254F0()
{
  return static PFLPluginConsent.PrivacyBudget.getter();
}

uint64_t sub_100025500()
{
  return static PFLPluginConsent.DNU.getter();
}

uint64_t sub_100025510()
{
  return type metadata accessor for PFLPluginConsent();
}

uint64_t sub_100025520()
{
  return dispatch thunk of PFLTask.attachments.getter();
}

uint64_t sub_100025530()
{
  return dispatch thunk of PFLTask.recipe.getter();
}

uint64_t sub_100025540()
{
  return type metadata accessor for PFLError();
}

uint64_t sub_100025550()
{
  return PFLPlugin.init(plugin:useCase:consent:taskSource:)();
}

uint64_t sub_100025560()
{
  return type metadata accessor for PFLPlugin();
}

uint64_t sub_100025570()
{
  return Logger.logObject.getter();
}

uint64_t sub_100025580()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100025590()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000255A0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000255B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000255C0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000255D0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000255E0()
{
  return String.hash(into:)();
}

void sub_1000255F0(Swift::String a1)
{
}

Swift::Int sub_100025600()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100025610()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100025620()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100025630()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100025640()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100025650()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_100025660(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100025670()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100025680()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100025690()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000256A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000256B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000256C0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000256D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000256E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000256F0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100025700()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint64_t espresso_context_destroy()
{
  return _espresso_context_destroy();
}

uint64_t espresso_create_context()
{
  return _espresso_create_context();
}

uint64_t espresso_create_plan()
{
  return _espresso_create_plan();
}

uint64_t espresso_network_bind_buffer()
{
  return _espresso_network_bind_buffer();
}

uint64_t espresso_network_bind_buffer_to_global()
{
  return _espresso_network_bind_buffer_to_global();
}

uint64_t espresso_network_declare_output()
{
  return _espresso_network_declare_output();
}

uint64_t espresso_network_set_function_name()
{
  return _espresso_network_set_function_name();
}

uint64_t espresso_network_unbind_buffer_to_global()
{
  return _espresso_network_unbind_buffer_to_global();
}

uint64_t espresso_plan_add_network()
{
  return _espresso_plan_add_network();
}

uint64_t espresso_plan_build()
{
  return _espresso_plan_build();
}

uint64_t espresso_plan_destroy()
{
  return _espresso_plan_destroy();
}

uint64_t espresso_plan_execute_sync()
{
  return _espresso_plan_execute_sync();
}

uint64_t get_main_function_name()
{
  return _get_main_function_name();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_JSONResult(void *a1, const char *a2, ...)
{
  return _[a1 JSONResult];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__bindBuffers_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bindBuffers:errorDomain:");
}

id objc_msgSend__buildPlan_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildPlan:errorDomain:");
}

id objc_msgSend__flattenedWeightsBeforeTraining(void *a1, const char *a2, ...)
{
  return _[a1 _flattenedWeightsBeforeTraining];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_aggregateArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateArray:error:errorDomain:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentURLsForBasename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentURLsForBasename:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _[a1 attachments];
}

id objc_msgSend_batchSize(void *a1, const char *a2, ...)
{
  return _[a1 batchSize];
}

id objc_msgSend_bindDataToInputsDirectly_batchSize_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDataToInputsDirectly:batchSize:error:errorDomain:");
}

id objc_msgSend_bindToBuffer_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindToBuffer:error:errorDomain:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_callAMDClient_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callAMDClient:error:");
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return _[a1 callStackReturnAddresses];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return _[a1 callStackSymbols];
}

id objc_msgSend_checkIfArrayEmptyAndThrowError_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkIfArrayEmptyAndThrowError:error:errorDomain:");
}

id objc_msgSend_combineArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineArray:error:errorDomain:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computeAndGetMetrics_programTrainer_numIterationsToTrain_error_errorDomain_dataProvider_localTrainingStage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:");
}

id objc_msgSend_constantValueMathFunction_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constantValueMathFunction:error:errorDomain:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyCurrentTrainingDelta(void *a1, const char *a2, ...)
{
  return _[a1 copyCurrentTrainingDelta];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createBufferDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBufferDictionary:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_destroyArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyArray:error:errorDomain:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_doubleMultiArrayWithShape_valueArray_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleMultiArrayWithShape:valueArray:error:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downSampleData_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downSampleData:error:errorDomain:");
}

id objc_msgSend_downSampleDictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downSampleDictionaryForKey:");
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return _[a1 errorDomain];
}

id objc_msgSend_evaluateUsingTestData_evaluationMetricNames_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateUsingTestData:evaluationMetricNames:error:");
}

id objc_msgSend_evaluationMetrics(void *a1, const char *a2, ...)
{
  return _[a1 evaluationMetrics];
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:");
}

id objc_msgSend_featureValueForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueForName:");
}

id objc_msgSend_featuresAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featuresAtIndex:");
}

id objc_msgSend_fetchData_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchData:error:errorDomain:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filterArrayOnNumber_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterArrayOnNumber:error:errorDomain:");
}

id objc_msgSend_finishInitializeManually_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishInitializeManually:errorDomain:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flattenedModelUpdate(void *a1, const char *a2, ...)
{
  return _[a1 flattenedModelUpdate];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_floatValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValueForKey:defaultValue:");
}

id objc_msgSend_generateHashFromInputs_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateHashFromInputs:error:errorDomain:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getCurrentTime_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentTime:error:errorDomain:");
}

id objc_msgSend_getDictionaryValueDataType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDictionaryValueDataType:error:");
}

id objc_msgSend_getElementsInSampleDictionary(void *a1, const char *a2, ...)
{
  return _[a1 getElementsInSampleDictionary];
}

id objc_msgSend_getFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFeature:");
}

id objc_msgSend_getFeatureStub_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFeatureStub:");
}

id objc_msgSend_getInputDictionary(void *a1, const char *a2, ...)
{
  return _[a1 getInputDictionary];
}

id objc_msgSend_getInputSize(void *a1, const char *a2, ...)
{
  return _[a1 getInputSize];
}

id objc_msgSend_getNewDeltasContainer_withError_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNewDeltasContainer:withError:errorDomain:");
}

id objc_msgSend_getOperationsArray(void *a1, const char *a2, ...)
{
  return _[a1 getOperationsArray];
}

id objc_msgSend_getURLFromURLArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getURLFromURLArray:error:errorDomain:");
}

id objc_msgSend_hashAdamIdsToIndices_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashAdamIdsToIndices:error:errorDomain:");
}

id objc_msgSend_hashFromCoreDictionary_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashFromCoreDictionary:error:errorDomain:");
}

id objc_msgSend_hashMapForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashMapForKey:");
}

id objc_msgSend_ifStatement_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ifStatement:error:errorDomain:");
}

id objc_msgSend_initModelMetadata_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initModelMetadata:error:errorDomain:");
}

id objc_msgSend_initWithActionArray_withAttachmentProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionArray:withAttachmentProcessor:");
}

id objc_msgSend_initWithAttachmentURLs_withInstructions_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttachmentURLs:withInstructions:error:errorDomain:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithFeatureName_withAccountDSID_andAccountStoreFrontId_inDomain_withCustomDescriptor_andSchemaVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:");
}

id objc_msgSend_initWithFeatureProviderArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeatureProviderArray:");
}

id objc_msgSend_initWithInputs_featureSizeMap_inputDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputs:featureSizeMap:inputDictionary:");
}

id objc_msgSend_initWithJSONResult_unprivatizedVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJSONResult:unprivatizedVector:");
}

id objc_msgSend_initWithModelMetadata_withAttachmentProcessor_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithModelMetadata:withAttachmentProcessor:error:errorDomain:");
}

id objc_msgSend_initWithProgram_learningRate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProgram:learningRate:error:");
}

id objc_msgSend_initializationFunctionName(void *a1, const char *a2, ...)
{
  return _[a1 initializationFunctionName];
}

id objc_msgSend_initializeManually(void *a1, const char *a2, ...)
{
  return _[a1 initializeManually];
}

id objc_msgSend_initializeManually_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeManually:errorDomain:");
}

id objc_msgSend_inputNames(void *a1, const char *a2, ...)
{
  return _[a1 inputNames];
}

id objc_msgSend_insertArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertArray:error:errorDomain:");
}

id objc_msgSend_insertRawArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertRawArray:error:errorDomain:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_learningRate(void *a1, const char *a2, ...)
{
  return _[a1 learningRate];
}

id objc_msgSend_learningRateBufferName(void *a1, const char *a2, ...)
{
  return _[a1 learningRateBufferName];
}

id objc_msgSend_learningRateSchedule(void *a1, const char *a2, ...)
{
  return _[a1 learningRateSchedule];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_loss(void *a1, const char *a2, ...)
{
  return _[a1 loss];
}

id objc_msgSend_lossName(void *a1, const char *a2, ...)
{
  return _[a1 lossName];
}

id objc_msgSend_metricsNames(void *a1, const char *a2, ...)
{
  return _[a1 metricsNames];
}

id objc_msgSend_modelPath(void *a1, const char *a2, ...)
{
  return _[a1 modelPath];
}

id objc_msgSend_modelWithContentsOfURL_configuration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelWithContentsOfURL:configuration:error:");
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return _[a1 multiArrayValue];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_negSampleArrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "negSampleArrayForKey:");
}

id objc_msgSend_numEpochs(void *a1, const char *a2, ...)
{
  return _[a1 numEpochs];
}

id objc_msgSend_numLocalIterations(void *a1, const char *a2, ...)
{
  return _[a1 numLocalIterations];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfIterationsPerEpoch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfIterationsPerEpoch:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_outputNames(void *a1, const char *a2, ...)
{
  return _[a1 outputNames];
}

id objc_msgSend_padArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "padArray:error:errorDomain:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_parseAndCall_withInputs_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseAndCall:withInputs:error:errorDomain:");
}

id objc_msgSend_parseData_withArray_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseData:withArray:error:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performOperation_onArray_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performOperation:onArray:error:");
}

id objc_msgSend_postProc_withDirections_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postProc:withDirections:error:");
}

id objc_msgSend_processForLoop_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processForLoop:error:errorDomain:");
}

id objc_msgSend_processForLoopHelper_withNumber_withDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processForLoopHelper:withNumber:withDictionary:");
}

id objc_msgSend_processRecipe_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processRecipe:errorDomain:");
}

id objc_msgSend_program(void *a1, const char *a2, ...)
{
  return _[a1 program];
}

id objc_msgSend_randomizeArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomizeArray:error:errorDomain:");
}

id objc_msgSend_readDownSampleDictionary_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDownSampleDictionary:withAttachments:error:errorDomain:");
}

id objc_msgSend_readDownSampleDictionaryBytes_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDownSampleDictionaryBytes:withAttachments:error:errorDomain:");
}

id objc_msgSend_readHashMapDictionary_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readHashMapDictionary:withAttachments:error:errorDomain:");
}

id objc_msgSend_readHashMapDictionaryBytes_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readHashMapDictionaryBytes:withAttachments:error:errorDomain:");
}

id objc_msgSend_readNegativeSampleArray_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readNegativeSampleArray:withAttachments:error:errorDomain:");
}

id objc_msgSend_readNegativeSampleArrayBytes_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readNegativeSampleArrayBytes:withAttachments:error:errorDomain:");
}

id objc_msgSend_readWeightsArrayBytes_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readWeightsArrayBytes:withAttachments:error:errorDomain:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_replaceBytesInRange_withBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceBytesInRange:withBytes:");
}

id objc_msgSend_replicateArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replicateArray:error:errorDomain:");
}

id objc_msgSend_requestData_withUseStubs_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestData:withUseStubs:error:errorDomain:");
}

id objc_msgSend_runTask_error_errorDomain_dataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTask:error:errorDomain:dataProvider:");
}

id objc_msgSend_runTask_error_errorDomain_dataProvider_attachmentProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTask:error:errorDomain:dataProvider:attachmentProcessor:");
}

id objc_msgSend_sampleFromDistribution_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sampleFromDistribution:error:errorDomain:");
}

id objc_msgSend_setBatchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatchSize:");
}

id objc_msgSend_setComputeUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComputeUnits:");
}

id objc_msgSend_setElementInCoreDictionary_withKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementInCoreDictionary:withKey:");
}

id objc_msgSend_setErrorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorDomain:");
}

id objc_msgSend_setHashMap_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHashMap:forKey:");
}

id objc_msgSend_setInitializationFunctionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializationFunctionName:");
}

id objc_msgSend_setInitializeManually_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializeManually:");
}

id objc_msgSend_setInputNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputNames:");
}

id objc_msgSend_setLearningRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLearningRate:");
}

id objc_msgSend_setLearningRateBufferName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLearningRateBufferName:");
}

id objc_msgSend_setLearningRateSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLearningRateSchedule:");
}

id objc_msgSend_setLossName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLossName:");
}

id objc_msgSend_setMetricsNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsNames:");
}

id objc_msgSend_setModelPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModelPath:");
}

id objc_msgSend_setNumEpochs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumEpochs:");
}

id objc_msgSend_setNumLocalIterations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumLocalIterations:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setOutputNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputNames:");
}

id objc_msgSend_setShortenedEmbeddingMappingKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingMappingKeys:");
}

id objc_msgSend_setShortenedEmbeddingNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingNames:");
}

id objc_msgSend_setShortenedEmbeddingNumberVectorsAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingNumberVectorsAfter:");
}

id objc_msgSend_setShortenedEmbeddingNumberVectorsBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingNumberVectorsBefore:");
}

id objc_msgSend_setShortenedEmbeddingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingSize:");
}

id objc_msgSend_setTrainingModeBufferName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrainingModeBufferName:");
}

id objc_msgSend_setUseCoreMLTrainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseCoreMLTrainer:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWeightNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeightNames:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_shortenedEmbeddingMappingKeys(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingMappingKeys];
}

id objc_msgSend_shortenedEmbeddingNames(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingNames];
}

id objc_msgSend_shortenedEmbeddingNumberVectorsAfter(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingNumberVectorsAfter];
}

id objc_msgSend_shortenedEmbeddingNumberVectorsBefore(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingNumberVectorsBefore];
}

id objc_msgSend_shortenedEmbeddingSize(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingSize];
}

id objc_msgSend_sortArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortArray:error:errorDomain:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_spliceArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spliceArray:error:errorDomain:");
}

id objc_msgSend_strideCopyAndSplitArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strideCopyAndSplitArray:error:errorDomain:");
}

id objc_msgSend_strideCopyArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strideCopyArray:error:errorDomain:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValueForKey:defaultValue:");
}

id objc_msgSend_stringWithContentsOfURL_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithContentsOfURL:encoding:error:");
}

id objc_msgSend_taskResultFromDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskResultFromDict:");
}

id objc_msgSend_trainOnData_numLocalIterations_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainOnData:numLocalIterations:error:errorDomain:");
}

id objc_msgSend_trainUsingTrainingData_evaluationMetricNames_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainUsingTrainingData:evaluationMetricNames:error:");
}

id objc_msgSend_trainingModeBufferName(void *a1, const char *a2, ...)
{
  return _[a1 trainingModeBufferName];
}

id objc_msgSend_twoArrayMathFunction_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "twoArrayMathFunction:error:errorDomain:");
}

id objc_msgSend_unsignedIntegerValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValueForKey:defaultValue:");
}

id objc_msgSend_useCoreMLTrainer(void *a1, const char *a2, ...)
{
  return _[a1 useCoreMLTrainer];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_weightNames(void *a1, const char *a2, ...)
{
  return _[a1 weightNames];
}

id objc_msgSend_weightsArray(void *a1, const char *a2, ...)
{
  return _[a1 weightsArray];
}

id objc_msgSend_windowFunction_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowFunction:error:errorDomain:");
}