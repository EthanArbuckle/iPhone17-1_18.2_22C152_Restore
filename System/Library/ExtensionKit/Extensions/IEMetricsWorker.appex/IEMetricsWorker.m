uint64_t sub_1000045F8()
{
  uint64_t v0;

  v0 = sub_100007310();
  sub_1000057F8(v0, qword_10000C420);
  sub_1000057C0(v0, (uint64_t)qword_10000C420);
  sub_10000585C();
  sub_100007360();
  return sub_100007320();
}

void *sub_100004690()
{
  v1 = (void *)v0;
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  if (qword_10000C310 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007310();
  sub_1000057C0(v2, (uint64_t)qword_10000C420);
  v3 = sub_100007300();
  os_log_type_t v4 = sub_100007350();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Use platform managed bookmark with unique IEMetricsWorker domain", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = sub_1000071D0();
  swift_allocObject();
  sub_1000071C0();
  sub_100007180();
  uint64_t v7 = sub_1000071B0();
  swift_release();
  swift_bridgeObjectRelease();
  v1[20] = v6;
  v1[21] = &protocol witness table for BiomeSessionBuilder;
  v1[17] = v7;
  return v1;
}

void *sub_1000047E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v17 - v5;
  int64_t v7 = *(void *)(a1 + 16);
  v8 = &_swiftEmptyArrayStorage;
  if (v7)
  {
    v19 = &_swiftEmptyArrayStorage;
    sub_100005BA0(0, v7, 0);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v9 = v4 + 16;
    v10 = v11;
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
    uint64_t v13 = *(void *)(v9 + 56);
    do
    {
      v10(v6, v12, v3);
      sub_100006E5C(&qword_10000C2C0);
      swift_dynamicCast();
      v8 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100005BA0(0, v8[2] + 1, 1);
        v8 = v19;
      }
      unint64_t v15 = v8[2];
      unint64_t v14 = v8[3];
      if (v15 >= v14 >> 1)
      {
        sub_100005BA0(v14 > 1, v15 + 1, 1);
        v8 = v19;
      }
      v8[2] = v15 + 1;
      sub_100006FB4(v18, &v8[8 * v15 + 4]);
      v12 += v13;
      --v7;
    }
    while (v7);
  }
  return v8;
}

void *sub_1000049A4(uint64_t a1, void (*a2)(BOOL, uint64_t, uint64_t), uint64_t *a3, void (*a4)(char *, void *))
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = &_swiftEmptyArrayStorage;
  if (v4)
  {
    v16 = &_swiftEmptyArrayStorage;
    a2(0, v4, 0);
    uint64_t v10 = a1 + 32;
    uint64_t v5 = &_swiftEmptyArrayStorage;
    do
    {
      sub_100006F4C(v10, (uint64_t)&v14);
      sub_100006E5C(&qword_10000C2C0);
      sub_100006E5C(a3);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        a2(0, v5[2] + 1, 1);
        uint64_t v5 = v16;
      }
      unint64_t v12 = v5[2];
      unint64_t v11 = v5[3];
      if (v12 >= v11 >> 1)
      {
        a2(v11 > 1, v12 + 1, 1);
        uint64_t v5 = v16;
      }
      v5[2] = v12 + 1;
      a4(v15, &v5[5 * v12 + 4]);
      v10 += 64;
      --v4;
    }
    while (v4);
  }
  return v5;
}

void sub_100004AFC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v13 = v2;
  if (v2)
  {
    uint64_t v15 = v1 + 96;
    uint64_t v3 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    while (1)
    {
      sub_100006FCC(v3, (uint64_t)v21);
      sub_100006EA0(v21, v22);
      if (sub_100007230())
      {
        if (__OFADD__(v4++, 1))
        {
          __break(1u);
LABEL_20:
          swift_once();
LABEL_14:
          uint64_t v9 = sub_100007310();
          sub_1000057C0(v9, (uint64_t)qword_10000C420);
          swift_bridgeObjectRetain();
          uint64_t v10 = sub_100007300();
          os_log_type_t v11 = sub_100007350();
          if (os_log_type_enabled(v10, v11))
          {
            uint64_t v12 = swift_slowAlloc();
            *(_DWORD *)uint64_t v12 = 134218496;
            v21[0] = v4;
            sub_100007370();
            *(_WORD *)(v12 + 12) = 2048;
            v21[0] = v13;
            sub_100007370();
            *(_WORD *)(v12 + 22) = 2048;
            if (__OFSUB__(v13, v4))
            {
              __break(1u);
            }
            else
            {
              v21[0] = v13 - v4;
              sub_100007370();
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v10, v11, "Emitted %ld CoreAnalytics events out of %ld latency events. %ld events culled.", (uint8_t *)v12, 0x20u);
              swift_slowDealloc();
            }
          }
          else
          {

            swift_bridgeObjectRelease();
          }
          return;
        }
        sub_100007030(v15, (uint64_t)&v16, &qword_10000C308);
        if (v17)
        {
          sub_100006F34(&v16, (uint64_t)v18);
        }
        else
        {
          uint64_t v5 = sub_1000071F0();
          uint64_t v6 = sub_1000071E0();
          uint64_t v19 = v5;
          v20 = &protocol witness table for CoreAnalyticsEmitter;
          v18[0] = v6;
          sub_100007094((uint64_t)&v16, &qword_10000C308);
        }
        sub_100006EA0(v18, v19);
        sub_100006EA0(v21, v22);
        swift_getDynamicType();
        sub_100007250();
        sub_100006EA0(v21, v22);
        sub_100007240();
        sub_100007260();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100006EE4((uint64_t)v18);
      }
      sub_100006EE4((uint64_t)v21);
      v3 += 40;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v14;
        goto LABEL_12;
      }
    }
  }
  uint64_t v4 = 0;
LABEL_12:
  sub_100007030(v1 + 96, (uint64_t)v21, &qword_10000C308);
  uint64_t v8 = v22;
  sub_100007094((uint64_t)v21, &qword_10000C308);
  if (!v8)
  {
    if (qword_10000C310 != -1) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
}

void sub_100004E54(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v14 = v3;
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (1)
    {
      sub_100006FCC(v4, (uint64_t)v20);
      sub_100006EA0(v20, v21);
      if (sub_1000071A0())
      {
        sub_100007030(v2 + 56, (uint64_t)&v15, &qword_10000C300);
        if (v16)
        {
          sub_100006F34(&v15, (uint64_t)v17);
        }
        else
        {
          uint64_t v7 = sub_100007160();
          uint64_t v8 = sub_100007150();
          uint64_t v18 = v7;
          uint64_t v19 = &protocol witness table for SELFPnREmitter;
          v17[0] = v8;
          sub_100007094((uint64_t)&v15, &qword_10000C300);
        }
        sub_100006EA0(v17, v18);
        sub_100007220();
        sub_100006EE4((uint64_t)v17);
        if (__OFADD__(v5++, 1)) {
          break;
        }
      }
      sub_100006EE4((uint64_t)v20);
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_19:
    swift_once();
LABEL_13:
    uint64_t v10 = sub_100007310();
    sub_1000057C0(v10, (uint64_t)qword_10000C420);
    swift_bridgeObjectRetain();
    os_log_type_t v11 = sub_100007300();
    os_log_type_t v12 = sub_100007340();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 134218496;
      v20[0] = v5;
      sub_100007370();
      *(_WORD *)(v13 + 12) = 2048;
      v20[0] = v14;
      sub_100007370();
      *(_WORD *)(v13 + 22) = 2048;
      if (__OFSUB__(v14, v5))
      {
        __break(1u);
      }
      else
      {
        v20[0] = v14 - v5;
        sub_100007370();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Emitted %ld SELF events out of %ld latency events. %ld events culled.", (uint8_t *)v13, 0x20u);
        swift_slowDealloc();
      }
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return;
  }
  uint64_t v5 = 0;
LABEL_11:
  sub_100007030(v2 + 56, (uint64_t)v20, &qword_10000C300);
  uint64_t v9 = v21;
  sub_100007094((uint64_t)v20, &qword_10000C300);
  if (!v9)
  {
    if (qword_10000C310 == -1) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }
}

uint64_t sub_100005128()
{
  sub_100007094(v0 + 16, &qword_10000C2B0);
  sub_100007094(v0 + 56, &qword_10000C300);
  sub_100007094(v0 + 96, &qword_10000C308);
  sub_100006EE4(v0 + 136);

  return _swift_deallocClassInstance(v0, 176, 7);
}

uint64_t sub_100005190()
{
  return _swift_task_switch(sub_1000051AC, 0, 0);
}

uint64_t sub_1000051AC()
{
  objc_allocWithZone((Class)sub_100007110());
  uint64_t v1 = sub_100007100();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100005220()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C2A0 + dword_10000C2A0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000052C4;
  return v3();
}

uint64_t sub_1000052C4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000053C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  long long v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *long long v15 = v7;
  v15[1] = sub_1000054A4;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000054A4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005598()
{
  uint64_t v0 = type metadata accessor for IEMetricsWorker();
  uint64_t v1 = sub_100005780(&qword_10000C290);

  return MLHostExtension.configuration.getter(v0, v1);
}

void *sub_100005604@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for IEMetricsWorker();
  uint64_t v2 = swift_allocObject();
  result = sub_100004690();
  *a1 = v2;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for IEMetricsWorker()
{
  return self;
}

uint64_t sub_1000056DC()
{
  return sub_100005780(&qword_10000C128);
}

uint64_t sub_100005710()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005780(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for IEMetricsWorker();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000057C0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000057F8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10000585C()
{
  unint64_t result = qword_10000C298;
  if (!qword_10000C298)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C298);
  }
  return result;
}

char *sub_10000589C(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006E5C(&qword_10000C2F8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 6);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[64 * v8 + 32]) {
          memmove(v13, a4 + 32, v8 << 6);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100005EF4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000059AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_10000589C(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[64 * v8 + 32];
  if (a1 + 32 < v9 + (v2 << 6) && v9 < a1 + 32 + (v2 << 6)) {
    goto LABEL_24;
  }
  sub_100006E5C(&qword_10000C2C0);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_100007380();
  __break(1u);
  return result;
}

uint64_t sub_100005B10(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005BC0(a1, a2, a3, (void *)*v3, &qword_10000C2D0, &qword_10000C2C8);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100005B40(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005BC0(a1, a2, a3, (void *)*v3, &qword_10000C2E0, &qword_10000C2D8);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100005B70(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005BC0(a1, a2, a3, (void *)*v3, &qword_10000C2F0, &qword_10000C2E8);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100005BA0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005D68(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100005BC0(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_100006E5C(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    sub_100006E5C(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_100007380();
  __break(1u);
  return result;
}

uint64_t sub_100005D68(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006E5C(&qword_10000C2F8);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 6);
  }
  else
  {
    int64_t v10 = &_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 4;
  size_t v14 = a4 + 4;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v10 + 4, a4 + 4, v8 << 6);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    sub_100006E5C(&qword_10000C2C0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100007380();
  __break(1u);
  return result;
}

uint64_t sub_100005EF4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      sub_100006E5C(&qword_10000C2C0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100007380();
  __break(1u);
  return result;
}

void sub_100006000(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = v1;
    while (1)
    {
      sub_100006FCC(v2, (uint64_t)v10);
      sub_100006EA0(v10, v11);
      if (sub_100007210())
      {
        sub_100006EA0(v10, v11);
        sub_100007200();
        if (__OFADD__(v3++, 1)) {
          break;
        }
      }
      sub_100006EE4((uint64_t)v10);
      v2 += 40;
      if (!--v4) {
        goto LABEL_8;
      }
    }
    __break(1u);
LABEL_8:
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (qword_10000C310 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100007310();
  sub_1000057C0(v6, (uint64_t)qword_10000C420);
  swift_bridgeObjectRetain();
  int64_t v7 = sub_100007300();
  os_log_type_t v8 = sub_100007350();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134218496;
    v10[0] = v3;
    sub_100007370();
    *(_WORD *)(v9 + 12) = 2048;
    v10[0] = v1;
    sub_100007370();
    *(_WORD *)(v9 + 22) = 2048;
    if (__OFSUB__(v1, v3))
    {
      __break(1u);
    }
    else
    {
      v10[0] = v1 - v3;
      sub_100007370();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Emitted %ld signpost events out of %ld latency events. %ld events culled.", (uint8_t *)v9, 0x20u);
      swift_slowDealloc();
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100006224()
{
  v1[12] = v0;
  uint64_t v2 = sub_100007140();
  v1[13] = v2;
  v1[14] = *(void *)(v2 - 8);
  v1[15] = swift_task_alloc();
  sub_100006E5C(&qword_10000C2A8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  return _swift_task_switch(sub_100006324, 0, 0);
}

uint64_t sub_100006324()
{
  if (qword_10000C310 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100007310();
  *(void *)(v0 + 144) = sub_1000057C0(v1, (uint64_t)qword_10000C420);
  uint64_t v2 = sub_100007300();
  os_log_type_t v3 = sub_100007350();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IEMetricsWorker doing work", v4, 2u);
    swift_slowDealloc();
  }

  unint64_t v5 = sub_100007300();
  os_log_type_t v6 = sub_100007350();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "IEMetricsWorker retrieving sesssionized data", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v8 = *(void *)(v0 + 96);

  sub_100007030(v8 + 16, v0 + 56, &qword_10000C2B0);
  if (*(void *)(v0 + 80))
  {
    sub_100006F34((long long *)(v0 + 56), v0 + 16);
  }
  else
  {
    uint64_t v9 = sub_1000071D0();
    swift_allocObject();
    uint64_t v10 = sub_1000071C0();
    *(void *)(v0 + 40) = v9;
    *(void *)(v0 + 48) = &protocol witness table for BiomeSessionBuilder;
    *(void *)(v0 + 16) = v10;
    sub_100007094(v0 + 56, &qword_10000C2B0);
  }
  uint64_t v11 = *(void *)(v0 + 40);
  uint64_t v12 = *(void *)(v0 + 48);
  sub_100006EA0((void *)(v0 + 16), v11);
  sub_100006E5C(&qword_10000C2B8);
  uint64_t v13 = sub_100007190();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v0 + 152) = v17;
  *(_OWORD *)(v17 + 16) = xmmword_1000075F0;
  unint64_t v18 = v17 + v16;
  uint64_t v19 = *(void (**)(unint64_t, void, uint64_t))(v14 + 104);
  v19(v18, enum case for JoinableStreams.IE_TRANSCRIPT(_:), v13);
  v19(v18 + v15, enum case for JoinableStreams.IE_TELEMETRY(_:), v13);
  v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v20;
  void *v20 = v0;
  v20[1] = sub_100006670;
  uint64_t v21 = *(void *)(v0 + 136);
  return dispatch thunk of SessionBuilder.buildSessionView(streams:)(v21, v17, v11, v12);
}

uint64_t sub_100006670()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100006788, 0, 0);
}

uint64_t sub_100006788()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[14];
  sub_100006EE4((uint64_t)(v0 + 2));
  sub_100007030(v2, v1, &qword_10000C2A8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3) == 1)
  {
    sub_100007094(v0[16], &qword_10000C2A8);
    unint64_t v5 = sub_100007300();
    os_log_type_t v6 = sub_100007340();
    if (os_log_type_enabled(v5, v6))
    {
      int64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "No Session objects buildable from Biome", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v8 = v0[17];

    id v9 = objc_allocWithZone((Class)sub_100007110());
    uint64_t v10 = sub_100007100();
  }
  else
  {
    (*(void (**)(void, void, void))(v0[14] + 32))(v0[15], v0[16], v0[13]);
    uint64_t v11 = sub_100007300();
    os_log_type_t v12 = sub_100007350();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "IEMetricsWorker calculating latency records", v13, 2u);
      swift_slowDealloc();
    }

    sub_1000072C0();
    swift_allocObject();
    sub_1000072B0();
    uint64_t v14 = sub_1000072A0();
    swift_release();
    uint64_t v15 = sub_1000047E4(v14, (uint64_t (*)(void))&type metadata accessor for RequestGrainLatency);
    swift_bridgeObjectRelease();
    uint64_t v46 = (uint64_t)v15;
    sub_100007290();
    swift_allocObject();
    sub_100007280();
    uint64_t v16 = sub_100007270();
    swift_release();
    uint64_t v17 = sub_1000047E4(v16, (uint64_t (*)(void))&type metadata accessor for PlannerGrainLatency);
    swift_bridgeObjectRelease();
    sub_1000059AC((uint64_t)v17);
    sub_1000072F0();
    swift_allocObject();
    sub_1000072E0();
    uint64_t v18 = sub_1000072D0();
    swift_release();
    uint64_t v19 = sub_1000047E4(v18, (uint64_t (*)(void))&type metadata accessor for ExecutionGrainLatency);
    swift_bridgeObjectRelease();
    sub_1000059AC((uint64_t)v19);
    v20 = sub_100007300();
    os_log_type_t v21 = sub_100007350();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "IEMetricsWorker emitting latency records as CoreAnaltyics events", v22, 2u);
      swift_slowDealloc();
    }

    uint64_t v23 = swift_bridgeObjectRetain();
    v24 = sub_1000049A4(v23, (void (*)(BOOL, uint64_t, uint64_t))sub_100005B70, &qword_10000C2E8, (void (*)(char *, void *))sub_100006F34);
    swift_bridgeObjectRelease();
    sub_100004AFC((uint64_t)v24);
    swift_bridgeObjectRelease();
    v25 = sub_100007300();
    os_log_type_t v26 = sub_100007350();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "IEMetricsWorker emitting latency records as Provisional SELF events", v27, 2u);
      swift_slowDealloc();
    }

    uint64_t v28 = swift_bridgeObjectRetain();
    v29 = sub_1000049A4(v28, (void (*)(BOOL, uint64_t, uint64_t))sub_100005B40, &qword_10000C2D8, (void (*)(char *, void *))sub_100006F34);
    swift_bridgeObjectRelease();
    sub_100004E54((uint64_t)v29);
    swift_bridgeObjectRelease();
    id v30 = [self standardUserDefaults];
    NSString v31 = sub_100007330();
    unsigned int v32 = [v30 BOOLForKey:v31];

    if (v32)
    {
      v33 = sub_100007300();
      os_log_type_t v34 = sub_100007350();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "IEMetricsWorker emitting latency records as signpost events", v35, 2u);
        swift_slowDealloc();
      }

      v36 = sub_1000049A4(v46, (void (*)(BOOL, uint64_t, uint64_t))sub_100005B10, &qword_10000C2C8, (void (*)(char *, void *))sub_100006F34);
      swift_bridgeObjectRelease();
      sub_100006000((uint64_t)v36);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v37 = sub_100007300();
      os_log_type_t v38 = sub_100007350();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "IEMetricsWorker signpost logging not enabled.", v39, 2u);
        swift_slowDealloc();
      }
    }
    uint64_t v8 = v0[17];
    uint64_t v41 = v0[14];
    uint64_t v40 = v0[15];
    uint64_t v42 = v0[13];
    id v43 = objc_allocWithZone((Class)sub_100007110());
    uint64_t v10 = sub_100007100();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
  }
  sub_100007094(v8, &qword_10000C2A8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v44 = (uint64_t (*)(uint64_t))v0[1];
  return v44(v10);
}

uint64_t sub_100006E5C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100006EA0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006EE4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006F34(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100006F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_100006FB4(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  long long v4 = a1[3];
  a2[2] = a1[2];
  a2[3] = v4;
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_100006FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100007030(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006E5C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007094(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006E5C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000070F0()
{
  return static AppExtension.main()();
}

uint64_t sub_100007100()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100007110()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100007140()
{
  return type metadata accessor for SessionView();
}

uint64_t sub_100007150()
{
  return static SELFPnREmitter.instance.getter();
}

uint64_t sub_100007160()
{
  return type metadata accessor for SELFPnREmitter();
}

uint64_t sub_100007180()
{
  return static CollectionConst.ieMetricsWorkerBundleID.getter();
}

uint64_t sub_100007190()
{
  return type metadata accessor for JoinableStreams();
}

uint64_t sub_1000071A0()
{
  return dispatch thunk of IELatencySELFEvent.SELFShouldEmit.getter();
}

uint64_t sub_1000071B0()
{
  return dispatch thunk of BiomeSessionBuilder.useManagedBookmarkFor(clientApplicationDomain:)();
}

uint64_t sub_1000071C0()
{
  return BiomeSessionBuilder.init()();
}

uint64_t sub_1000071D0()
{
  return type metadata accessor for BiomeSessionBuilder();
}

uint64_t sub_1000071E0()
{
  return static CoreAnalyticsEmitter.instance.getter();
}

uint64_t sub_1000071F0()
{
  return type metadata accessor for CoreAnalyticsEmitter();
}

uint64_t sub_100007200()
{
  return dispatch thunk of IELatencySignpostEvent.emitSignpost()();
}

uint64_t sub_100007210()
{
  return dispatch thunk of IELatencySignpostEvent.signpostShouldEmit.getter();
}

uint64_t sub_100007220()
{
  return dispatch thunk of SELFPnREmitterInterface.uploadProvisionalPnRLatency(for:)();
}

uint64_t sub_100007230()
{
  return dispatch thunk of IELatencyCoreAnalyticsEvent.coreAnalyticsShouldEmit.getter();
}

uint64_t sub_100007240()
{
  return dispatch thunk of IELatencyCoreAnalyticsEvent.coreAnalyticsEventDictionary.getter();
}

uint64_t sub_100007250()
{
  return dispatch thunk of static IELatencyCoreAnalyticsEvent.coreAnalyticsEventName.getter();
}

uint64_t sub_100007260()
{
  return dispatch thunk of CoreAnalyticsEmitterInterface.sendCoreAnalytics(eventName:eventPayload:)();
}

uint64_t sub_100007270()
{
  return dispatch thunk of PlannerGrainLatencyCalculator.extractLatencies(from:)();
}

uint64_t sub_100007280()
{
  return PlannerGrainLatencyCalculator.init()();
}

uint64_t sub_100007290()
{
  return type metadata accessor for PlannerGrainLatencyCalculator();
}

uint64_t sub_1000072A0()
{
  return dispatch thunk of RequestGrainLatencyCalculator.extractLatencies(from:)();
}

uint64_t sub_1000072B0()
{
  return RequestGrainLatencyCalculator.init()();
}

uint64_t sub_1000072C0()
{
  return type metadata accessor for RequestGrainLatencyCalculator();
}

uint64_t sub_1000072D0()
{
  return dispatch thunk of ExecutionGrainLatencyCalculator.extractLatencies(from:)();
}

uint64_t sub_1000072E0()
{
  return ExecutionGrainLatencyCalculator.init()();
}

uint64_t sub_1000072F0()
{
  return type metadata accessor for ExecutionGrainLatencyCalculator();
}

uint64_t sub_100007300()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007310()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100007320()
{
  return Logger.init(_:)();
}

NSString sub_100007330()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100007340()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100007350()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100007360()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100007370()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007380()
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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