int main(int argc, const char **argv, const char **envp)
{
  id v3;

  qword_1000087A0 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for TranslateAppRemovalServiceListenerDelegate()) init];
  v3 = [self serviceListener];
  qword_1000087A8 = (uint64_t)v3;
  [v3 setDelegate:qword_1000087A0];
  [v3 resume];
  return 0;
}

uint64_t type metadata accessor for TranslateAppRemovalServiceListenerDelegate()
{
  return self;
}

id sub_100001EDC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TranslateAppRemovalServiceListenerDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100001F10()
{
  uint64_t v0 = sub_100003420();
  sub_100003384(v0, qword_1000087B0);
  sub_10000321C(v0, (uint64_t)qword_1000087B0);
  return sub_100003410();
}

void sub_100001F84(uint64_t a1, void (*a2)(uint64_t))
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100008600 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100003420();
    sub_10000321C(v4, (uint64_t)qword_1000087B0);
    swift_errorRetain();
    v5 = sub_100003400();
    os_log_type_t v6 = sub_100003460();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (void *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v15[0] = sub_1000033F0();
      sub_1000034A0();
      void *v8 = v15[0];
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to purge assets: %@", v7, 0xCu);
      sub_100003304(&qword_100008778);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      goto LABEL_12;
    }
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    if (qword_100008600 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_100003420();
    sub_10000321C(v9, (uint64_t)qword_1000087B0);
    v5 = sub_100003400();
    os_log_type_t v10 = sub_100003470();
    if (os_log_type_enabled(v5, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v10, "Successfully completed deletion of assets", v11, 2u);
      swift_slowDealloc();
    }
  }

LABEL_12:
  NSString v12 = sub_100003440();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  v15[4] = sub_1000032FC;
  v15[5] = v13;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_1000025D8;
  v15[3] = &unk_100004390;
  v14 = _Block_copy(v15);
  swift_errorRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v14);

  if (a2) {
    a2(a1);
  }
  else {
    __break(1u);
  }
}

id sub_1000022D4(uint64_t a1)
{
  unint64_t v2 = sub_1000024BC((uint64_t)&_swiftEmptyArrayStorage);
  if (!a1)
  {
    sub_100003348(0, &qword_100008788);
    Class isa = sub_100003480(0).super.super.isa;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100002C10((uint64_t)isa, 0x726F727245736168, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
    unint64_t v11 = v2;
    goto LABEL_5;
  }
  v3 = (void *)sub_1000033F0();
  id result = [v3 domain];
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    char v6 = swift_isUniquelyReferenced_nonNull_native();
    sub_100002C10(v5, 0x6D6F44726F727265, 0xEB000000006E6961, v6);
    swift_bridgeObjectRelease();
    sub_100003348(0, &qword_100008788);
    Class v7 = sub_100003490((Swift::Int)[v3 code]).super.super.isa;
    char v8 = swift_isUniquelyReferenced_nonNull_native();
    sub_100002C10((uint64_t)v7, 0x646F43726F727265, 0xE900000000000065, v8);
    swift_bridgeObjectRelease();
    Class v9 = sub_100003480(1).super.super.isa;
    char v10 = swift_isUniquelyReferenced_nonNull_native();
    sub_100002C10((uint64_t)v9, 0x726F727245736168, 0xE800000000000000, v10);
    unint64_t v11 = v2;

LABEL_5:
    swift_bridgeObjectRelease();
    return (id)v11;
  }
  __break(1u);
  return result;
}

unint64_t sub_1000024BC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003304((uint64_t *)&unk_100008790);
  unint64_t v2 = (void *)sub_1000034D0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    Class v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100002888(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

Class sub_1000025D8(uint64_t a1)
{
  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_100003348(0, &qword_100008780);
    v4.super.Class isa = sub_100003430().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }
  return v4.super.isa;
}

void sub_100002674(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10000278C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1000033F0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id sub_100002830()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TranslateAppDeletionService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TranslateAppDeletionService()
{
  return self;
}

unint64_t sub_100002888(uint64_t a1, uint64_t a2)
{
  sub_100003500();
  sub_100003450();
  Swift::Int v4 = sub_100003510();
  return sub_100002D80(a1, a2, v4);
}

uint64_t sub_100002900(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003304((uint64_t *)&unk_100008790);
  char v38 = a2;
  uint64_t v6 = sub_1000034C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_100003500();
    sub_100003450();
    uint64_t result = sub_100003510();
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
    v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void sub_100002C10(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100002888(a2, a3);
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
    sub_100002E64();
LABEL_7:
    v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_100002900(v15, a4 & 1);
  unint64_t v20 = sub_100002888(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_1000034F0();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

unint64_t sub_100002D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000034E0() & 1) == 0)
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
      while (!v14 && (sub_1000034E0() & 1) == 0);
    }
  }
  return v6;
}

id sub_100002E64()
{
  v1 = v0;
  sub_100003304((uint64_t *)&unk_100008790);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000034B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

void sub_100003018(uint64_t a1, uint64_t a2)
{
  if (qword_100008600 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100003420();
  sub_10000321C(v4, (uint64_t)qword_1000087B0);
  uint64_t v5 = sub_100003400();
  os_log_type_t v6 = sub_100003470();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Starting app removal service", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  v11[4] = sub_100003294;
  v11[5] = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100002674;
  v11[3] = &unk_100004340;
  uint64_t v10 = _Block_copy(v11);
  sub_1000032B4(a1);
  swift_release();
  [v8 _purgeAllAssetsExcludingConfig:1 completion:v10];
  _Block_release(v10);
}

uint64_t sub_1000031CC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000031DC()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100003214(uint64_t a1)
{
  sub_10000278C(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000321C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003254()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100003294(uint64_t a1)
{
  sub_100001F84(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_10000329C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000032AC()
{
  return swift_release();
}

uint64_t sub_1000032B4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000032C4()
{
  swift_errorRelease();
  return _swift_deallocObject(v0, 24, 7);
}

id sub_1000032FC()
{
  return sub_1000022D4(*(void *)(v0 + 16));
}

uint64_t sub_100003304(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003348(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t *sub_100003384(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000033F0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100003400()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003410()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003420()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100003430()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_100003440()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100003450()
{
  return String.hash(into:)();
}

uint64_t sub_100003460()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100003470()
{
  return static os_log_type_t.default.getter();
}

NSNumber sub_100003480(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_100003490(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_1000034A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000034B0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000034C0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000034D0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000034E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000034F0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100003500()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100003510()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _LSAppRemovalServiceXPCInterface()
{
  return __LSAppRemovalServiceXPCInterface();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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