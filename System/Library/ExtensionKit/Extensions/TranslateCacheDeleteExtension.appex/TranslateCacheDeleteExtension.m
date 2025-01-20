uint64_t sub_100004608()
{
  uint64_t v0;

  v0 = sub_100006E80();
  sub_100006DBC(v0, qword_10000C5A8);
  sub_100005450(v0, (uint64_t)qword_10000C5A8);
  return sub_100006E70();
}

void sub_10000468C(uint64_t a1)
{
  id v1 = [self serviceInfoWithExtensionContext:a1];
  if (v1)
  {
    v2 = v1;
    if (qword_10000C5A0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_100006E80();
    sub_100005450(v3, (uint64_t)qword_10000C5A8);
    v4 = sub_100006E60();
    os_log_type_t v5 = sub_100006F30();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Registering for cache delete extension callbacks", v6, 2u);
      swift_slowDealloc();
    }

    NSString v7 = sub_100006EC0();
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v22 = sub_1000054C0;
    uint64_t v23 = v8;
    aBlock = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    v20 = sub_100004C00;
    v21 = &unk_100008430;
    v9 = _Block_copy(&aBlock);
    swift_release();
    v22 = sub_100004C68;
    uint64_t v23 = 0;
    aBlock = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    v20 = sub_100004C00;
    v21 = &unk_100008458;
    v10 = _Block_copy(&aBlock);
    v22 = sub_100004EE0;
    uint64_t v23 = 0;
    aBlock = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    v20 = sub_100004FC8;
    v21 = &unk_100008480;
    v11 = _Block_copy(&aBlock);
    v22 = sub_10000500C;
    uint64_t v23 = 0;
    aBlock = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    v20 = sub_100004C00;
    v21 = &unk_1000084A8;
    v12 = _Block_copy(&aBlock);
    v22 = sub_100005174;
    uint64_t v23 = 0;
    aBlock = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    v20 = sub_10000525C;
    v21 = &unk_1000084D0;
    v13 = _Block_copy(&aBlock);
    CacheDeleteRegisterExtensionCallbacks();
    _Block_release(v13);
    _Block_release(v12);
    _Block_release(v11);
    _Block_release(v10);
    _Block_release(v9);
  }
  else
  {
    if (qword_10000C5A0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100006E80();
    sub_100005450(v14, (uint64_t)qword_10000C5A8);
    oslog = sub_100006E60();
    os_log_type_t v15 = sub_100006F20();
    if (os_log_type_enabled(oslog, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Failed to acquire service info", v16, 2u);
      swift_slowDealloc();
    }
  }
}

unint64_t sub_100004AE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006C74(&qword_10000C538);
  v2 = (void *)sub_100006FD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_100005C58(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

uint64_t sub_100004C00(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, id))(a1 + 32);
  swift_retain();
  id v6 = a3;
  uint64_t v7 = v5(a2, v6);
  swift_release();

  return v7;
}

uint64_t sub_100004C68(int a1, void *a2)
{
  if (qword_10000C5A0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100006E80();
  sub_100005450(v4, (uint64_t)qword_10000C5A8);
  uint64_t v5 = sub_100006E60();
  os_log_type_t v6 = sub_100006F30();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    LODWORD(aBlock[0]) = a1;
    sub_100006F60();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "PURGE request with urgency: %d", v7, 8u);
    swift_slowDealloc();
  }

  if ((a1 - 3) <= 1)
  {
    uint64_t v8 = self;
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100004E74;
    aBlock[3] = &unk_1000084F8;
    char v9 = _Block_copy(aBlock);
    [v8 _purgeAllAssetsExcludingConfig:1 completion:v9];
    _Block_release(v9);
  }
  [a2 mutableCopy];
  sub_100006F90();
  swift_unknownObjectRelease();
  sub_1000055C0();
  swift_dynamicCast();
  return aBlock[6];
}

void sub_100004E74(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_100004EE0()
{
  if (qword_10000C5A0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100006E80();
  sub_100005450(v0, (uint64_t)qword_10000C5A8);
  oslog = sub_100006E60();
  os_log_type_t v1 = sub_100006F30();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "CANCEL cache delete", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100004FC8(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000500C(uint64_t a1, void *a2)
{
  if (qword_10000C5A0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100006E80();
  sub_100005450(v3, (uint64_t)qword_10000C5A8);
  id v4 = sub_100006E60();
  os_log_type_t v5 = sub_100006F30();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v6 = 67109120;
    sub_100006F60();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "PERIODIC request with urgency: %d", v6, 8u);
    swift_slowDealloc();
  }

  [a2 mutableCopy];
  sub_100006F90();
  swift_unknownObjectRelease();
  sub_1000055C0();
  swift_dynamicCast();
  return v8;
}

void sub_100005174()
{
  if (qword_10000C5A0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100006E80();
  sub_100005450(v0, (uint64_t)qword_10000C5A8);
  oslog = sub_100006E60();
  os_log_type_t v1 = sub_100006F30();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "NOTIFICATIONS request; doing nothing", v2, 2u);
    swift_slowDealloc();
  }
}

void sub_10000525C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10000532C(uint64_t a1, void *a2, void *a3)
{
  os_log_type_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_1000053F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CacheDeleteHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CacheDeleteHandler()
{
  return self;
}

uint64_t sub_100005450(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005488()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

id sub_1000054C0(int a1)
{
  sub_100006EA0();
  unint64_t v2 = sub_100004AE4((uint64_t)&_swiftEmptyArrayStorage);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    os_log_type_t v5 = sub_100006548(a1, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return [objc_allocWithZone((Class)NSDictionary) init];
  }
  return v5;
}

uint64_t sub_1000055A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000055B8()
{
  return swift_release();
}

unint64_t sub_1000055C0()
{
  unint64_t result = qword_10000C518;
  if (!qword_10000C518)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C518);
  }
  return result;
}

uint64_t sub_100005600(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000056D4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006D5C((uint64_t)v12, *a3);
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
      sub_100006D5C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006D0C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000056D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006F70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005890(a5, a6);
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
  uint64_t v8 = sub_100006FB0();
  if (!v8)
  {
    sub_100006FC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006FE0();
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

uint64_t sub_100005890(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005928(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005B08(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005B08(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005928(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005AA0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006FA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006FC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006F00();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006FE0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006FC0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005AA0(uint64_t a1, uint64_t a2)
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
  sub_100006C74(&qword_10000C530);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005B08(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006C74(&qword_10000C530);
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
  uint64_t result = sub_100006FE0();
  __break(1u);
  return result;
}

unint64_t sub_100005C58(uint64_t a1, uint64_t a2)
{
  sub_100007010();
  sub_100006EF0();
  Swift::Int v4 = sub_100007020();

  return sub_100005CD0(a1, a2, v4);
}

unint64_t sub_100005CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100006FF0() & 1) == 0)
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
      while (!v14 && (sub_100006FF0() & 1) == 0);
    }
  }
  return v6;
}

BOOL sub_100005DB4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v46 = a2;
  uint64_t v5 = sub_100006EE0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  int64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10000C5A0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100006E80();
  uint64_t v10 = sub_100005450(v9, (uint64_t)qword_10000C5A8);
  swift_bridgeObjectRetain_n();
  BOOL v11 = sub_100006E60();
  os_log_type_t v12 = sub_100006F10();
  if (os_log_type_enabled(v11, v12))
  {
    v44 = v8;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v45 = v5;
    BOOL v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    unint64_t v43 = v10;
    *(void *)&v53.f_bsize = v15;
    *(_DWORD *)BOOL v14 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&v49[0] = sub_100005600(v46, a3, (uint64_t *)&v53);
    int64_t v8 = v44;
    sub_100006F60();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Verfying volume match for: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v45;
    swift_slowDealloc();

    if (!*(void *)(a1 + 16)) {
      goto LABEL_15;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!*(void *)(a1 + 16))
    {
LABEL_15:
      swift_bridgeObjectRetain_n();
      v26 = sub_100006E60();
      os_log_type_t v29 = sub_100006F20();
      if (!os_log_type_enabled(v26, v29))
      {

        swift_bridgeObjectRelease_n();
        return 0;
      }
      v30 = (uint8_t *)swift_slowAlloc();
      *(void *)&v53.f_bsize = swift_slowAlloc();
      *(_DWORD *)v30 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_100006EB0();
      unint64_t v33 = v32;
      swift_bridgeObjectRelease();
      *(void *)&v49[0] = sub_100005600(v31, v33, (uint64_t *)&v53);
      sub_100006F60();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v29, "Volume key not found: %s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_17;
    }
  }
  unint64_t v16 = sub_100005C58(0xD000000000000013, 0x80000001000075F0);
  if ((v17 & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v52 = *(void *)(*(void *)(a1 + 56) + 8 * v16);
  swift_unknownObjectRetain();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_15;
  }
  v18 = v50;
  uint64_t v45 = v51;
  bzero(&v53, 0x878uLL);
  *(void *)&v49[0] = v46;
  *((void *)&v49[0] + 1) = a3;
  sub_100006ED0();
  unint64_t v19 = sub_100006CB8();
  uint64_t v20 = sub_100006F80();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v22 = v6 + 8;
  v21 = v23;
  v23(v8, v5);
  if (v20) {
    v24 = (const char *)(v20 + 32);
  }
  else {
    v24 = 0;
  }
  int v25 = statfs(v24, &v53);
  swift_bridgeObjectRelease();
  if (v25)
  {
    swift_bridgeObjectRelease();
    v26 = sub_100006E60();
    os_log_type_t v27 = sub_100006F20();
    if (!os_log_type_enabled(v26, v27))
    {
LABEL_18:

      return 0;
    }
    v28 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v28 = 67109120;
    LODWORD(v49[0]) = v25;
    sub_100006F60();
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Volume statfs failed: %d", v28, 8u);
LABEL_17:
    swift_slowDealloc();
    goto LABEL_18;
  }
  v42 = v21;
  unint64_t v43 = v19;
  v44 = v18;
  uint64_t v46 = v22;
  v35 = sub_100006E60();
  int v36 = sub_100006F10();
  if (os_log_type_enabled(v35, (os_log_type_t)v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v36, "Volume statfs read", v37, 2u);
    swift_slowDealloc();
  }

  v49[0] = *(_OWORD *)v53.f_mntonname;
  v49[1] = *(_OWORD *)&v53.f_mntonname[16];
  v49[2] = *(_OWORD *)&v53.f_mntonname[32];
  v49[3] = *(_OWORD *)&v53.f_mntonname[48];
  v49[4] = *(_OWORD *)&v53.f_mntonname[64];
  v49[5] = *(_OWORD *)&v53.f_mntonname[80];
  v49[6] = *(_OWORD *)&v53.f_mntonname[96];
  v49[7] = *(_OWORD *)&v53.f_mntonname[112];
  v49[8] = *(_OWORD *)&v53.f_mntonname[128];
  v49[9] = *(_OWORD *)&v53.f_mntonname[144];
  v49[10] = *(_OWORD *)&v53.f_mntonname[160];
  v49[11] = *(_OWORD *)&v53.f_mntonname[176];
  v49[12] = *(_OWORD *)&v53.f_mntonname[192];
  v49[13] = *(_OWORD *)&v53.f_mntonname[208];
  v49[14] = *(_OWORD *)&v53.f_mntonname[224];
  v49[15] = *(_OWORD *)&v53.f_mntonname[240];
  v49[16] = *(_OWORD *)&v53.f_mntonname[256];
  v49[17] = *(_OWORD *)&v53.f_mntonname[272];
  v49[18] = *(_OWORD *)&v53.f_mntonname[288];
  v49[19] = *(_OWORD *)&v53.f_mntonname[304];
  v49[20] = *(_OWORD *)&v53.f_mntonname[320];
  v49[21] = *(_OWORD *)&v53.f_mntonname[336];
  v49[22] = *(_OWORD *)&v53.f_mntonname[352];
  v49[23] = *(_OWORD *)&v53.f_mntonname[368];
  v49[24] = *(_OWORD *)&v53.f_mntonname[384];
  v49[25] = *(_OWORD *)&v53.f_mntonname[400];
  v49[26] = *(_OWORD *)&v53.f_mntonname[416];
  v49[27] = *(_OWORD *)&v53.f_mntonname[432];
  v49[28] = *(_OWORD *)&v53.f_mntonname[448];
  v49[29] = *(_OWORD *)&v53.f_mntonname[464];
  v49[30] = *(_OWORD *)&v53.f_mntonname[480];
  v49[31] = *(_OWORD *)&v53.f_mntonname[496];
  v49[32] = *(_OWORD *)&v53.f_mntonname[512];
  v49[33] = *(_OWORD *)&v53.f_mntonname[528];
  v49[34] = *(_OWORD *)&v53.f_mntonname[544];
  v49[35] = *(_OWORD *)&v53.f_mntonname[560];
  v49[36] = *(_OWORD *)&v53.f_mntonname[576];
  v49[37] = *(_OWORD *)&v53.f_mntonname[592];
  v49[38] = *(_OWORD *)&v53.f_mntonname[608];
  v49[39] = *(_OWORD *)&v53.f_mntonname[624];
  v49[40] = *(_OWORD *)&v53.f_mntonname[640];
  v49[41] = *(_OWORD *)&v53.f_mntonname[656];
  v49[42] = *(_OWORD *)&v53.f_mntonname[672];
  v49[43] = *(_OWORD *)&v53.f_mntonname[688];
  v49[44] = *(_OWORD *)&v53.f_mntonname[704];
  v49[45] = *(_OWORD *)&v53.f_mntonname[720];
  v49[46] = *(_OWORD *)&v53.f_mntonname[736];
  v49[47] = *(_OWORD *)&v53.f_mntonname[752];
  v49[48] = *(_OWORD *)&v53.f_mntonname[768];
  v49[49] = *(_OWORD *)&v53.f_mntonname[784];
  v49[50] = *(_OWORD *)&v53.f_mntonname[800];
  v49[51] = *(_OWORD *)&v53.f_mntonname[816];
  v49[52] = *(_OWORD *)&v53.f_mntonname[832];
  v49[53] = *(_OWORD *)&v53.f_mntonname[848];
  v49[54] = *(_OWORD *)&v53.f_mntonname[864];
  v49[55] = *(_OWORD *)&v53.f_mntonname[880];
  v49[56] = *(_OWORD *)&v53.f_mntonname[896];
  v49[57] = *(_OWORD *)&v53.f_mntonname[912];
  v49[58] = *(_OWORD *)&v53.f_mntonname[928];
  v49[59] = *(_OWORD *)&v53.f_mntonname[944];
  v49[60] = *(_OWORD *)&v53.f_mntonname[960];
  v49[61] = *(_OWORD *)&v53.f_mntonname[976];
  v49[62] = *(_OWORD *)&v53.f_mntonname[992];
  v49[63] = *(_OWORD *)&v53.f_mntonname[1008];
  v47 = v44;
  uint64_t v48 = v45;
  sub_100006ED0();
  uint64_t v38 = sub_100006F80();
  v42(v8, v5);
  if (v38) {
    v39 = (const char *)(v38 + 32);
  }
  else {
    v39 = 0;
  }
  int v40 = strcmp(v39, (const char *)v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v40 == 0;
}

void *sub_100006548(int a1, uint64_t a2)
{
  if (qword_10000C5A0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100006E80();
  sub_100005450(v4, (uint64_t)qword_10000C5A8);
  uint64_t v5 = sub_100006E60();
  os_log_type_t v6 = sub_100006F30();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    LODWORD(aBlock[0]) = a1;
    sub_100006F60();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "PURGEABLE request with urgency: %d", v7, 8u);
    swift_slowDealloc();
  }

  Class isa = sub_100006E90().super.isa;
  [(objc_class *)isa mutableCopy];

  sub_100006F90();
  swift_unknownObjectRelease();
  sub_1000055C0();
  swift_dynamicCast();
  uint64_t v9 = (void *)aBlock[6];
  BOOL v10 = sub_100005DB4(a2, 0xD000000000000019, 0x8000000100007590);
  BOOL v11 = sub_100006E60();
  os_log_type_t v12 = sub_100006F10();
  BOOL v13 = os_log_type_enabled(v11, v12);
  if (v10)
  {
    if (v13)
    {
      BOOL v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "PURGEABLE Request asset size", v14, 2u);
      swift_slowDealloc();
    }

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    unint64_t v16 = self;
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v9;
    *(void *)(v17 + 24) = v15;
    aBlock[4] = sub_1000068E0;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000532C;
    aBlock[3] = &unk_100008548;
    v18 = _Block_copy(aBlock);
    id v19 = v9;
    BOOL v11 = v15;
    swift_release();
    [v16 _getAssetSize:v18];
    _Block_release(v18);
    sub_100006F40();
  }
  else if (v13)
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Skipping request due to no volume mismatch", v20, 2u);
    swift_slowDealloc();
  }

  return v9;
}

uint64_t sub_1000068A0()
{
  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_1000068E0(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 16);
  if (qword_10000C5A0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100006E80();
  sub_100005450(v6, (uint64_t)qword_10000C5A8);
  uint64_t v7 = sub_100006E60();
  os_log_type_t v8 = sub_100006F10();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "PURGEABLE Response asset size", v9, 2u);
    swift_slowDealloc();
  }

  if (a2)
  {
    swift_errorRetain();
    BOOL v10 = sub_100006E60();
    os_log_type_t v11 = sub_100006F20();
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
      BOOL v13 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v12 = 138412290;
      uint64_t v21 = sub_100006E50();
      sub_100006F60();
      void *v13 = v21;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "PURGEABLE Failed to get asset size: %@", v12, 0xCu);
      sub_100006C74(&qword_10000C520);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
  }
  else
  {
    id v14 = a1;
    dispatch_semaphore_t v15 = sub_100006E60();
    os_log_type_t v16 = sub_100006F10();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      if (a1) {
        id v19 = v14;
      }
      sub_100006F60();
      void *v18 = a1;

      _os_log_impl((void *)&_mh_execute_header, v15, v16, "PURGEABLE asset size: %@", v17, 0xCu);
      sub_100006C74(&qword_10000C520);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    objc_msgSend(v5, "__swift_setObject:forKeyedSubscript:", v14, sub_100007000());
    swift_unknownObjectRelease();
  }
  return sub_100006F50();
}

uint64_t sub_100006C74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006CB8()
{
  unint64_t result = qword_10000C528;
  if (!qword_10000C528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C528);
  }
  return result;
}

uint64_t sub_100006D0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100006DBC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006E50()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100006E60()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006E70()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006E80()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100006E90()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100006EA0()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100006EB0()
{
  return Dictionary.description.getter();
}

NSString sub_100006EC0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006ED0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100006EE0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100006EF0()
{
  return String.hash(into:)();
}

Swift::Int sub_100006F00()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006F10()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006F20()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006F30()
{
  return static os_log_type_t.default.getter();
}

void sub_100006F40()
{
}

Swift::Int sub_100006F50()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_100006F60()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006F70()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006F80()
{
  return StringProtocol.cString(using:)();
}

uint64_t sub_100006F90()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100006FA0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006FB0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006FC0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006FD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100006FE0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006FF0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007000()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_100007010()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100007020()
{
  return Hasher._finalize()();
}

uint64_t CacheDeleteRegisterExtensionCallbacks()
{
  return _CacheDeleteRegisterExtensionCallbacks();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}