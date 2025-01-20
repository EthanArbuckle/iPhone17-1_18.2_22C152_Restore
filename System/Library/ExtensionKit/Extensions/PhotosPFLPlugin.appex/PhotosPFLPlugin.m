uint64_t sub_100004840()
{
  return 1;
}

Swift::Int sub_100004848()
{
  return sub_1000074B0();
}

void sub_10000488C()
{
}

Swift::Int sub_1000048B4()
{
  return sub_1000074B0();
}

uint64_t sub_100004908(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100006890(&qword_10000C1D0);
    v2 = (void *)sub_100007430();
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
    sub_100006930(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000069F4(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1000069F4(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1000069F4(v36, v37);
    sub_1000069F4(v37, &v33);
    uint64_t result = sub_100007420(v2[5]);
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
    uint64_t result = (uint64_t)sub_1000069F4(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1000069EC();
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

uint64_t sub_100004CD0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v6 = a2;
  v7 = *(void (**)(void *, unint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    v6 = (void *)sub_100007270();
    unint64_t v10 = v9;

    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  swift_retain();
  unint64_t v10 = 0xF000000000000000;
  if (a3) {
LABEL_3:
  }
    a3 = sub_1000073C0();
LABEL_4:
  id v11 = a4;
  v7(v6, v10, a3, a4);

  swift_bridgeObjectRelease();
  sub_100006A04((uint64_t)v6, v10);

  return swift_release();
}

unint64_t sub_100004DC4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100006890(&qword_10000C1B8);
    v2 = (void *)sub_100007430();
  }
  else
  {
    v2 = &_swiftEmptyDictionarySingleton;
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
        sub_1000069EC();
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
    sub_1000068D4(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_100006930(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_1000068D4((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_10000698C((uint64_t)v30);
      swift_bridgeObjectRelease();
      sub_1000069EC();
      swift_release();
      return 0;
    }
    sub_100006930((uint64_t)v31 + 8, (uint64_t)v25);
    sub_10000698C((uint64_t)v30);
    sub_1000069F4(v25, v26);
    long long v27 = v24;
    sub_1000069F4(v26, v28);
    long long v16 = v27;
    sub_1000069F4(v28, v29);
    sub_1000069F4(v29, &v27);
    unint64_t result = sub_100005A04(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      id v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v8 = v16;
      unint64_t v9 = (_OWORD *)(v2[7] + 32 * v17);
      sub_100007050((uint64_t)v9);
      unint64_t result = (unint64_t)sub_1000069F4(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_1000069F4(&v27, (_OWORD *)(v2[7] + 32 * result));
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

uint64_t sub_100005188()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

void sub_100005198()
{
}

uint64_t sub_1000051B0()
{
  return sub_100006A18(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 1);
}

uint64_t sub_1000051E8(uint64_t a1)
{
  unint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C1A8 + dword_10000C1A8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005290;
  return v5(a1);
}

uint64_t sub_100005290(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100005390()
{
  return 0;
}

uint64_t sub_100005398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100007224;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100005448(uint64_t a1)
{
  unint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C1D8 + dword_10000C1D8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000054F0;
  return v5(a1);
}

uint64_t sub_1000054F0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000055EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *int64_t v15 = v7;
  v15[1] = sub_1000056D0;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000056D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000057C4(uint64_t a1)
{
  unint64_t v2 = sub_10000594C();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000586C()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t type metadata accessor for PhotosPFLTaskRunner()
{
  return self;
}

ValueMetadata *type metadata accessor for PhotosPFLPlugin()
{
  return &type metadata for PhotosPFLPlugin;
}

uint64_t sub_1000058F8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_10000594C()
{
  unint64_t result = qword_10000C1A0;
  if (!qword_10000C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1A0);
  }
  return result;
}

uint64_t sub_1000059A0(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v5 = *(void (**)(uint64_t, double))(a1 + 32);
  swift_retain();
  v5(a2, a3);

  return swift_release();
}

unint64_t sub_100005A04(uint64_t a1, uint64_t a2)
{
  sub_100007490();
  sub_1000073D0();
  Swift::Int v4 = sub_1000074B0();

  return sub_100005A7C(a1, a2, v4);
}

unint64_t sub_100005A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100007440() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100007440() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100005B60(void *a1)
{
  uint64_t v2 = sub_1000073A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_beginAccess();
  if (*a1)
  {
    swift_errorRetain();
    sub_1000072C0();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v7 = sub_100007380();
    os_log_type_t v8 = sub_100007400();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      swift_errorRetain();
      uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v9 + 4) = v11;
      *uint64_t v10 = v11;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@", (uint8_t *)v9, 0xCu);
      sub_100006890(&qword_10000C1C8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_100005D6C(uint64_t a1)
{
  v1[21] = a1;
  uint64_t v2 = sub_100007260();
  v1[22] = v2;
  v1[23] = *(void *)(v2 - 8);
  v1[24] = swift_task_alloc();
  uint64_t v3 = sub_1000073A0();
  v1[25] = v3;
  v1[26] = *(void *)(v3 - 8);
  v1[27] = swift_task_alloc();
  return _swift_task_switch(sub_100005EB4, 0, 0);
}

uint64_t sub_100005EB4()
{
  uint64_t v2 = v0[23];
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[22];
  sub_100007390();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100007790;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 0;
  id v6 = [self systemPhotoLibraryURL];
  sub_100007250();

  id v7 = objc_allocWithZone((Class)PHPhotoLibrary);
  sub_100007240(v8);
  uint64_t v10 = v9;
  id v11 = [v7 initWithPhotoLibraryURL:v9];

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[20] = 0;
  v48 = v11;
  unsigned int v12 = [v11 openAndWaitWithUpgrade:0 error:v0 + 20];
  int64_t v13 = (void *)v0[20];
  if (v12)
  {
    uint64_t v14 = v4;
    id v15 = objc_allocWithZone((Class)PHAPrivateFederatedLearningFacade);
    v0[6] = nullsub_1;
    v0[7] = 0;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_1000059A0;
    v0[5] = &unk_100008600;
    long long v16 = _Block_copy(v0 + 2);
    id v17 = v13;
    id v46 = [v15 initWithPhotosLibrary:v11 graphManagerProgress:v16];
    char v18 = v16;
    uint64_t v19 = v14;
    _Block_release(v18);
    swift_release();
    sub_100007340();
    Class isa = sub_1000073E0().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_100007350();
    sub_100004908(v21);
    swift_bridgeObjectRelease();
    Class v22 = sub_1000073B0().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v23 = (void *)swift_allocObject();
    v23[2] = v14;
    v23[3] = v5;
    v23[4] = v47;
    v0[12] = sub_1000066DC;
    v0[13] = v23;
    v0[8] = _NSConcreteStackBlock;
    v0[9] = 1107296256;
    v0[10] = sub_100004CD0;
    v0[11] = &unk_100008650;
    long long v24 = _Block_copy(v0 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    [v46 runPFLWithAttachments:isa recipeUserInfo:v22 resultBlock:v24];
    _Block_release(v24);

    sub_100005B60((void *)(v47 + 16));
    swift_beginAccess();
    if (*(void *)(v5 + 16))
    {
      uint64_t v31 = swift_bridgeObjectRetain();
      unint64_t v32 = sub_100004DC4(v31);
      swift_bridgeObjectRelease();
      if (v32)
      {
        long long v33 = sub_100007380();
        os_log_type_t v34 = sub_1000073F0();
        if (os_log_type_enabled(v33, v34))
        {
          uint64_t v35 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v35 = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "Successfully submitted results", v35, 2u);
          swift_slowDealloc();
        }
        uint64_t v37 = v0[26];
        uint64_t v36 = v0[27];
        uint64_t v38 = v0[25];

        swift_beginAccess();
        uint64_t v39 = *(void *)(v19 + 16);
        unint64_t v40 = *(void *)(v19 + 24);
        sub_1000072E0();
        swift_allocObject();
        sub_100006824(v39, v40);
        uint64_t v41 = sub_1000072D0();

        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
        swift_release();
        swift_release();
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
        v42 = (uint64_t (*)(uint64_t))v0[1];
        return v42(v41);
      }
    }
    uint64_t v44 = v0[26];
    uint64_t v43 = v0[27];
    uint64_t v45 = v0[25];
    sub_1000067D0();
    swift_allocError();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
  }
  else
  {
    uint64_t v26 = v0[26];
    uint64_t v25 = v0[27];
    uint64_t v27 = v0[25];
    id v28 = v13;
    sub_100007230();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
  }
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

uint64_t sub_10000656C()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    sub_1000065B4(*(void *)(v0 + 16), v1);
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000065B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000660C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006644()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000667C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000668C()
{
  return swift_release();
}

uint64_t sub_100006694()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000066DC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = v4[2];
  uint64_t v10 = v4[3];
  uint64_t v14 = (void *)(v4[4] + 16);
  swift_beginAccess();
  uint64_t v11 = *(void *)(v9 + 16);
  unint64_t v12 = *(void *)(v9 + 24);
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  sub_100006824(a1, a2);
  sub_100006A04(v11, v12);
  swift_beginAccess();
  *(void *)(v10 + 16) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *uint64_t v14 = a4;
  swift_errorRetain();
  return swift_errorRelease();
}

unint64_t sub_1000067D0()
{
  unint64_t result = qword_10000C1B0;
  if (!qword_10000C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1B0);
  }
  return result;
}

uint64_t sub_100006824(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100006838(a1, a2);
  }
  return a1;
}

uint64_t sub_100006838(uint64_t a1, unint64_t a2)
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

uint64_t sub_100006890(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000068D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100006930(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000698C(uint64_t a1)
{
  uint64_t v2 = sub_100006890(&qword_10000C1C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000069EC()
{
  return swift_release();
}

_OWORD *sub_1000069F4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006A04(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000065B4(a1, a2);
  }
  return a1;
}

uint64_t sub_100006A18(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_100006A28(uint64_t a1)
{
  v1[8] = a1;
  uint64_t v2 = sub_100007300();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = sub_100007330();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_100006B44, 0, 0);
}

uint64_t sub_100006B44()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  sub_100006890(&qword_10000C1E0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000077A0;
  sub_100007320();
  sub_100007310();
  v0[7] = v4;
  sub_100007008(&qword_10000C1E8, 255, (void (*)(uint64_t))&type metadata accessor for PFLPluginConsent);
  sub_100006890(&qword_10000C1F0);
  sub_100006F64();
  sub_100007410();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for PFLTaskSource.CKProd(_:), v2);
  sub_100007370();
  swift_allocObject();
  v0[15] = sub_100007360();
  uint64_t v5 = type metadata accessor for PhotosPFLTaskRunner();
  uint64_t v6 = swift_allocObject();
  v0[16] = v6;
  v0[5] = v5;
  uint64_t v8 = sub_100007008(&qword_10000C200, v7, (void (*)(uint64_t))type metadata accessor for PhotosPFLTaskRunner);
  v0[2] = v6;
  v0[6] = v8;
  unint64_t v12 = (char *)&async function pointer to dispatch thunk of PFLPlugin.run(context:runner:)
      + async function pointer to dispatch thunk of PFLPlugin.run(context:runner:);
  swift_retain();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[17] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_100006DCC;
  uint64_t v10 = v0[8];
  return ((uint64_t (*)(uint64_t, void *))v12)(v10, v0 + 2);
}

uint64_t sub_100006DCC(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 144) = a1;
  swift_task_dealloc();
  sub_100007050(v2);
  return _swift_task_switch(sub_100006ED8, 0, 0);
}

uint64_t sub_100006ED8()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 144);
  return v1(v2);
}

unint64_t sub_100006F64()
{
  unint64_t result = qword_10000C1F8;
  if (!qword_10000C1F8)
  {
    sub_100006FC0(&qword_10000C1F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1F8);
  }
  return result;
}

uint64_t sub_100006FC0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007008(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007050(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t getEnumTagSinglePayload for PhotosPFLPluginError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for PhotosPFLPluginError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100007194);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosPFLPluginError()
{
  return &type metadata for PhotosPFLPluginError;
}

unint64_t sub_1000071D0()
{
  unint64_t result = qword_10000C208;
  if (!qword_10000C208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C208);
  }
  return result;
}

uint64_t sub_100007230()
{
  return _convertNSErrorToError(_:)();
}

void sub_100007240(NSURL *retstr@<X8>)
{
}

uint64_t sub_100007250()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100007260()
{
  return type metadata accessor for URL();
}

uint64_t sub_100007270()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100007280()
{
  return static AppExtension.main()();
}

uint64_t sub_1000072C0()
{
  return static PFLLogging.framework.getter();
}

uint64_t sub_1000072D0()
{
  return PFLTaskResult.init(json:vector:)();
}

uint64_t sub_1000072E0()
{
  return type metadata accessor for PFLTaskResult();
}

void sub_1000072F0()
{
}

uint64_t sub_100007300()
{
  return type metadata accessor for PFLTaskSource();
}

uint64_t sub_100007310()
{
  return static PFLPluginConsent.PrivacyBudget.getter();
}

uint64_t sub_100007320()
{
  return static PFLPluginConsent.DNU.getter();
}

uint64_t sub_100007330()
{
  return type metadata accessor for PFLPluginConsent();
}

uint64_t sub_100007340()
{
  return dispatch thunk of PFLTask.attachments.getter();
}

uint64_t sub_100007350()
{
  return dispatch thunk of PFLTask.recipe.getter();
}

uint64_t sub_100007360()
{
  return PFLPlugin.init(plugin:useCase:consent:taskSource:)();
}

uint64_t sub_100007370()
{
  return type metadata accessor for PFLPlugin();
}

uint64_t sub_100007380()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007390()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000073A0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_1000073B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000073C0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000073D0()
{
  return String.hash(into:)();
}

NSArray sub_1000073E0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000073F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100007400()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100007410()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_100007420(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100007430()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100007440()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007450()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100007460()
{
  return Error._code.getter();
}

uint64_t sub_100007470()
{
  return Error._domain.getter();
}

uint64_t sub_100007480()
{
  return Error._userInfo.getter();
}

uint64_t sub_100007490()
{
  return Hasher.init(_seed:)();
}

void sub_1000074A0(Swift::UInt a1)
{
}

Swift::Int sub_1000074B0()
{
  return Hasher._finalize()();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
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

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}