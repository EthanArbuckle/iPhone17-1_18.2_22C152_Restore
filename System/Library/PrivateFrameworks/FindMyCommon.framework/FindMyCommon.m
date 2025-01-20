uint64_t static ReferenceClock.now.getter()
{
  uint64_t vars8;

  static ReferenceClock.timeInterval.getter();
  return sub_24E28D5F0();
}

double static ReferenceClock.timeInterval.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5078);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  v3 = &v15[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24E278434(v1);
  double Current = CFAbsoluteTimeGetCurrent();
  if (qword_26B1B4CC8 != -1) {
    uint64_t v4 = swift_once();
  }
  MEMORY[0x270FA5388](v4);
  *(void *)&v15[-16] = sub_24E278700;
  *(void *)&v15[-8] = 0;
  v7 = v6 + 4;
  os_unfair_lock_lock(v6 + 4);
  sub_24E2783D8(&v16);
  os_unfair_lock_unlock(v7);
  double v9 = Current - *(double *)&v16;
  if (v9 - *((double *)&v16 + 1) > 86400.0)
  {
    MEMORY[0x270FA5388](v8);
    *(void *)&v15[-16] = sub_24E28B9EC;
    *(void *)&v15[-8] = 0;
    v11 = v10 + 4;
    os_unfair_lock_lock(v10 + 4);
    sub_24E28B9FC();
    os_unfair_lock_unlock(v11);
    uint64_t v12 = sub_24E28D7F0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 1, 1, v12);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = 0;
    *(void *)(v13 + 24) = 0;
    sub_24E28A4B4((uint64_t)v3, (uint64_t)&unk_2698C8FF8, v13);
    swift_release();
  }
  return v9;
}

double sub_24E2783D8@<D0>(_OWORD *a1@<X8>)
{
  return sub_24E2783F0(a1);
}

double sub_24E2783F0@<D0>(_OWORD *a1@<X8>)
{
  (*(void (**)(long long *__return_ptr))(v1 + 16))(&v5);
  if (!v2)
  {
    double result = *(double *)&v5;
    *a1 = v5;
  }
  return result;
}

BOOL sub_24E278434(uint64_t a1)
{
  if (qword_26B1B4CC8 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  uint64_t v2 = v1 + 4;
  os_unfair_lock_lock(v1 + 4);
  sub_24E27863C((uint64_t)&aBlock);
  os_unfair_lock_unlock(v2);
  double v3 = *(double *)&v11;
  if ((aBlock & 1) == 0)
  {
    id v4 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v5 = *MEMORY[0x263EFF5C8];
    v14 = sub_24E28BDFC;
    uint64_t v15 = 0;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v11 = 1107296256;
    uint64_t v12 = sub_24E28B5BC;
    uint64_t v13 = &block_descriptor_0;
    v6 = _Block_copy(&aBlock);
    swift_release();
    id v7 = objc_msgSend(v4, sel_addObserverForName_object_queue_usingBlock_, v5, 0, 0, v6);
    _Block_release(v6);

    swift_unknownObjectRelease();
  }
  if (qword_26B1B4CE8 != -1) {
    swift_once();
  }
  double v8 = *(double *)&qword_26B1B4CE0;
  if (*(double *)&qword_26B1B4CE0 >= v3) {
    sub_24E28ABDC(0);
  }
  return v8 < v3;
}

double sub_24E27863C@<D0>(uint64_t a1@<X8>)
{
  (*(void (**)(void *__return_ptr))(v1 + 16))(v5);
  if (!v2)
  {
    double result = *(double *)&v5[1];
    *(unsigned char *)a1 = v5[0];
    *(double *)(a1 + 8) = result;
  }
  return result;
}

double sub_24E278688@<D0>(uint64_t a1@<X8>)
{
  char v2 = byte_26B1B4CC0;
  byte_26B1B4CC0 = 1;
  *(unsigned char *)a1 = v2;
  if (qword_26B1B4CF8 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_26B1B4CF0;
  *(void *)(a1 + 8) = qword_26B1B4CF0;
  return result;
}

double sub_24E278700@<D0>(void *a1@<X8>)
{
  return sub_24E278718(a1);
}

double sub_24E278718@<D0>(void *a1@<X8>)
{
  *a1 = qword_26B1B4CD0;
  if (qword_26B1B4CF8 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_26B1B4CF0;
  a1[1] = qword_26B1B4CF0;
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

uint64_t AnalyticsEvent.name.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 16))(a1, v1 + *(void *)(*(void *)v1 + 120));
}

uint64_t AnalyticsEvent.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 128);
  uint64_t v4 = sub_24E28D660();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_24E2788A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 136);
  swift_beginAccess();
  return sub_24E27E4F0(v3, a1);
}

uint64_t sub_24E278908(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 136);
  swift_beginAccess();
  sub_24E27E930(a1, v3);
  return swift_endAccess();
}

uint64_t sub_24E278970@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 144);
  swift_beginAccess();
  return sub_24E27E4F0(v3, a1);
}

uint64_t sub_24E2789D0(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 144);
  swift_beginAccess();
  sub_24E27E930(a1, v3);
  return swift_endAccess();
}

uint64_t AnalyticsEvent.__allocating_init(name:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  AnalyticsEvent.init(name:)(a1);
  return v2;
}

uint64_t *AnalyticsEvent.init(name:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_defaultActor_initialize();
  sub_24E28D650();
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 136);
  uint64_t v5 = sub_24E28D9C0();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  v6(v4, 1, 1, v5);
  v6((uint64_t)v1 + *(void *)(*v1 + 144), 1, 1, v5);
  *(uint64_t *)((char *)v1 + *(void *)(*v1 + 152)) = MEMORY[0x263F8EE80];
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 32))((uint64_t)v1 + *(void *)(*v1 + 120), a1);
  return v1;
}

uint64_t sub_24E278BE0()
{
  return sub_24E278C10((uint64_t (*)(char *))sub_24E278908);
}

uint64_t sub_24E278BF8()
{
  return sub_24E278C10((uint64_t (*)(char *))sub_24E2789D0);
}

uint64_t sub_24E278C10(uint64_t (*a1)(char *))
{
  uint64_t v2 = sub_24E28D9E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5050);
  MEMORY[0x270FA5388](v6 - 8);
  double v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E28D9D0();
  sub_24E28D9A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = sub_24E28D9C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  return a1(v8);
}

uint64_t sub_24E278D80@<X0>(uint64_t a1@<X8>)
{
  sub_24E28D7B0();
  uint64_t v3 = (uint64_t *)(v1 + *(void *)(*(void *)v1 + 152));
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (*(void *)(v4 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_24E27C04C(v8, v9);
    if (v6)
    {
      sub_24E27D6F8(*(void *)(v4 + 56) + 48 * v5, a1);
    }
    else
    {
      *(void *)(a1 + 32) = 0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(unsigned char *)(a1 + 40) = -1;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(unsigned char *)(a1 + 40) = -1;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E278EA8(uint64_t a1, uint64_t a2)
{
  v3[22] = a2;
  v3[23] = v2;
  v3[21] = a1;
  uint64_t v4 = *v2;
  v3[24] = *v2;
  uint64_t v5 = *(void *)(v4 + 88);
  v3[25] = v5;
  v3[26] = *(void *)(v5 - 8);
  v3[27] = swift_task_alloc();
  v3[28] = swift_getTupleTypeMetadata2();
  uint64_t v6 = sub_24E28D8C0();
  v3[29] = v6;
  v3[30] = *(void *)(v6 - 8);
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E27903C, v2, 0);
}

uint64_t sub_24E27903C()
{
  uint64_t v12 = v0;
  if (qword_26B1B4F80 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B1B5360;
  sub_24E28D7B0();
  LOBYTE(v1) = sub_24E279A48(v0[14], v0[15], v1);
  swift_bridgeObjectRelease();
  if (v1)
  {
    if (qword_26B1B5020 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_24E28D690();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B1B5380);
    swift_retain_n();
    uint64_t v3 = sub_24E28D670();
    os_log_type_t v4 = sub_24E28D820();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v11 = v6;
      *(_DWORD *)uint64_t v5 = 136446210;
      sub_24E28D7B0();
      v0[20] = sub_24E27B9F4(v0[18], v0[19], &v11);
      sub_24E28D8D0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24E276000, v3, v4, "AnalyticsEvent not computing disallowed analytics event %{public}s.", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253337400](v6, -1, -1);
      MEMORY[0x253337400](v5, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    v10 = (uint64_t (*)(void))(v0[21] + *(int *)v0[21]);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[33] = v7;
    void *v7 = v0;
    v7[1] = sub_24E2793A8;
    return v10();
  }
}

uint64_t sub_24E2793A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 184);
  *(void *)(*(void *)v1 + 272) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E2794C0, v2, 0);
}

void sub_24E2794C0()
{
  int64_t v47 = 0;
  uint64_t v49 = (uint64_t)(v0 + 8);
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[26];
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v40 = v1 + 64;
  uint64_t v43 = v1;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & v3;
  uint64_t v48 = v0[28];
  uint64_t v42 = v0[26];
  v46 = (void (**)(uint64_t, uint64_t, uint64_t))(v0[30] + 32);
  v44 = (void (**)(uint64_t, uint64_t))(v2 + 8);
  v45 = (void (**)(void))(v2 + 32);
  int64_t v41 = (unint64_t)(63 - v5) >> 6;
  uint64_t v7 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v47 << 6);
LABEL_8:
      uint64_t v12 = v0[31];
      (*(void (**)(uint64_t, unint64_t, void))(v42 + 16))(v12, *(void *)(v43 + 48) + *(void *)(v42 + 72) * v11, v0[25]);
      sub_24E27D754(*(void *)(v43 + 56) + 48 * v11, v12 + *(int *)(v48 + 48));
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)(v48 - 8);
      goto LABEL_25;
    }
    int64_t v15 = v47 + 1;
    if (__OFADD__(v47, 1)) {
      goto LABEL_46;
    }
    if (v15 < v41)
    {
      unint64_t v16 = *(void *)(v40 + 8 * v15);
      if (v16) {
        goto LABEL_12;
      }
      int64_t v17 = v47 + 2;
      ++v47;
      if (v15 + 1 < v41)
      {
        unint64_t v16 = *(void *)(v40 + 8 * v17);
        if (v16)
        {
          ++v15;
LABEL_12:
          unint64_t v6 = (v16 - 1) & v16;
          unint64_t v11 = __clz(__rbit64(v16)) + (v15 << 6);
          int64_t v47 = v15;
          goto LABEL_8;
        }
        int64_t v18 = v15 + 2;
        int64_t v47 = v15 + 1;
        if (v15 + 2 < v41)
        {
          unint64_t v16 = *(void *)(v40 + 8 * v18);
          if (!v16)
          {
            while (1)
            {
              int64_t v15 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_47;
              }
              if (v15 >= v41)
              {
                int64_t v47 = v41 - 1;
                goto LABEL_24;
              }
              unint64_t v16 = *(void *)(v40 + 8 * v15);
              ++v18;
              if (v16) {
                goto LABEL_12;
              }
            }
          }
          v15 += 2;
          goto LABEL_12;
        }
      }
    }
LABEL_24:
    unint64_t v6 = 0;
    uint64_t v14 = *(void *)(v48 - 8);
    uint64_t v13 = 1;
LABEL_25:
    uint64_t v20 = v0[31];
    uint64_t v19 = v0[32];
    uint64_t v22 = v0[28];
    uint64_t v21 = v0[29];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v20, v13, 1, v22);
    (*v46)(v19, v20, v21);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v19, 1, v22) == 1) {
      break;
    }
    uint64_t v23 = v0[32] + *(int *)(v48 + 48);
    (*v45)(v0[27]);
    sub_24E27D7B0(v23, (uint64_t)(v0 + 2));
    sub_24E28D7B0();
    uint64_t v25 = v0[16];
    uint64_t v24 = v0[17];
    sub_24E27D754((uint64_t)(v0 + 2), v49);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v28 = sub_24E27C04C(v25, v24);
    uint64_t v29 = v7[2];
    BOOL v30 = (v27 & 1) == 0;
    uint64_t v31 = v29 + v30;
    if (__OFADD__(v29, v30))
    {
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
      return;
    }
    char v32 = v27;
    if (v7[3] >= v31)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v27) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_24E27D358();
        if (v32) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_24E27C5C4(v31, isUniquelyReferenced_nonNull_native);
      unint64_t v33 = sub_24E27C04C(v25, v24);
      if ((v32 & 1) != (v34 & 1))
      {
        sub_24E28DA90();
        return;
      }
      unint64_t v28 = v33;
      if (v32)
      {
LABEL_4:
        sub_24E27D860(v49, v7[7] + 48 * v28);
        goto LABEL_5;
      }
    }
    v7[(v28 >> 6) + 8] |= 1 << v28;
    v35 = (uint64_t *)(v7[6] + 16 * v28);
    uint64_t *v35 = v25;
    v35[1] = v24;
    sub_24E27D7B0(v49, v7[7] + 48 * v28);
    uint64_t v36 = v7[2];
    BOOL v37 = __OFADD__(v36, 1);
    uint64_t v38 = v36 + 1;
    if (v37) {
      goto LABEL_45;
    }
    v7[2] = v38;
    swift_bridgeObjectRetain();
LABEL_5:
    uint64_t v8 = v0[27];
    uint64_t v9 = v0[25];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24E27D80C((uint64_t)(v0 + 2));
    (*v44)(v8, v9);
  }
  swift_release();
  sub_24E279C5C((uint64_t)v7);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v39 = (void (*)(void))v0[1];
  v39();
}

uint64_t sub_24E279A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_24E28DB10();
    sub_24E28D750();
    uint64_t v6 = sub_24E28DB40();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24E28DA60() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          unint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24E28DA60() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_24E279B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned __int8 *)(a1 + 40) == 255)
  {
    sub_24E27E5AC(a1, &qword_26B1B5028);
    sub_24E27C1A8(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_24E27E5AC((uint64_t)v9, &qword_26B1B5028);
  }
  else
  {
    sub_24E27E608(a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_24E27CDF4((uint64_t)v9, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24E279C5C(uint64_t a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v128 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & v3;
  v143 = (uint64_t *)(v1 + *(void *)(*(void *)v1 + 152));
  v139 = v163;
  v140 = &v166;
  int64_t v135 = (unint64_t)(v4 + 63) >> 6;
  int64_t v122 = v135 - 1;
  int64_t v142 = 0;
  uint64_t v130 = swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_6;
  }
LABEL_4:
  while (2)
  {
    unint64_t v7 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v8 = v7 | (v142 << 6);
LABEL_5:
    uint64_t v9 = *(void *)(v2 + 56);
    uint64_t v10 = (void *)(*(void *)(v2 + 48) + 16 * v8);
    uint64_t v11 = v10[1];
    *(void *)&long long v162 = *v10;
    *((void *)&v162 + 1) = v11;
    sub_24E27D754(v9 + 48 * v8, (uint64_t)v139);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_24E27E720((uint64_t)&v162, (uint64_t)&v164);
      uint64_t v15 = v165;
      if (!v165) {
        return swift_release();
      }
      uint64_t v16 = v164;
      sub_24E27D7B0((uint64_t)v140, (uint64_t)&v162);
      BOOL v17 = (uint64_t *)(v141 + *(void *)(*(void *)v141 + 152));
      swift_beginAccess();
      uint64_t v18 = *v17;
      if (!*(void *)(v18 + 16)) {
        break;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_24E27C04C(v16, v15);
      if (v20)
      {
        sub_24E27D6F8(*(void *)(v18 + 56) + 48 * v19, (uint64_t)&v153);
      }
      else
      {
        uint64_t v155 = 0;
        long long v153 = 0u;
        long long v154 = 0u;
        unsigned __int8 v156 = -1;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v156 == 255) {
        goto LABEL_40;
      }
      sub_24E27E608((uint64_t)&v153, (uint64_t)v158);
      sub_24E27D754((uint64_t)&v162, (uint64_t)&v153);
      unint64_t v138 = v6;
      if (!v157)
      {
        sub_24E27E608((uint64_t)&v153, (uint64_t)v152);
        goto LABEL_91;
      }
      if (v157 == 1)
      {
        uint64_t v21 = v153;
        sub_24E27D6F8((uint64_t)v158, (uint64_t)&v145);
        if (v148 != 2) {
          goto LABEL_107;
        }
        uint64_t v123 = v16;
        uint64_t v126 = v21;
        sub_24E27E918(&v145, (uint64_t)v149);
        uint64_t v22 = v150;
        uint64_t v136 = v151;
        uint64_t v23 = __swift_project_boxed_opaque_existential_1(v149, v150);
        v127 = v115;
        uint64_t v137 = *(void *)(v22 - 8);
        uint64_t v24 = v137;
        uint64_t v25 = *(void *)(v137 + 64);
        MEMORY[0x270FA5388](v23);
        v26 = &v115[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
        char v27 = *(void (**)(unsigned char *))(v24 + 16);
        v27(v26);
        uint64_t v28 = sub_24E28D920();
        char v29 = v28;
        v125 = v115;
        uint64_t v133 = v25;
        unint64_t v6 = v22;
        MEMORY[0x270FA5388](v28);
        uint64_t v30 = v137;
        v129 = v26;
        v131 = v27;
        v132 = (unsigned char *)(v24 + 16);
        ((void (*)(unsigned char *, unsigned char *, uint64_t))v27)(v26, v26, v22);
        if (v29)
        {
          uint64_t v31 = sub_24E28D910();
          unint64_t v33 = *(void (**)(unsigned char *, unint64_t))(v30 + 8);
          char v32 = (unsigned char *)(v30 + 8);
          v134 = v33;
          uint64_t v34 = ((uint64_t (*)(unsigned char *, uint64_t))v33)(v26, v22);
          if (v31 > 64)
          {
            v124 = v32;
            MEMORY[0x270FA5388](v34);
            uint64_t v36 = &v115[-((v35 + 15) & 0xFFFFFFFFFFFFFFF0)];
            BOOL v37 = v129;
            ((void (*)(unsigned char *, unsigned char *, uint64_t))v131)(v36, v129, v22);
            *(void *)&long long v145 = 0x8000000000000000;
            char v38 = sub_24E28D920();
            uint64_t v2 = v130;
            if (v38)
            {
              uint64_t v39 = sub_24E28D910();
              if (v39 >= 64)
              {
                v121 = v115;
                MEMORY[0x270FA5388](v39);
                v71 = &v115[-((v70 + 15) & 0xFFFFFFFFFFFFFFF0)];
                sub_24E27E788();
                sub_24E28D8F0();
                uint64_t v1 = sub_24E28D700();
                v72 = v134;
                v134(v71, v6);
                v72(v36, v6);
                uint64_t v2 = v130;
                if (v1) {
                  goto LABEL_115;
                }
              }
              else
              {
                uint64_t v1 = sub_24E28D900();
                v134(v36, v6);
                if (v1 < (uint64_t)v145) {
                  goto LABEL_115;
                }
              }
            }
            else
            {
              v120 = v115;
              char v64 = sub_24E28D920();
              v121 = v36;
              uint64_t v65 = sub_24E28D910();
              if (v64)
              {
                if (v65 > 64)
                {
                  MEMORY[0x270FA5388](v65);
                  v67 = &v115[-((v66 + 15) & 0xFFFFFFFFFFFFFFF0)];
                  sub_24E27E788();
                  sub_24E28D8F0();
                  v68 = v121;
                  uint64_t v1 = sub_24E28D700();
                  v69 = v134;
                  v134(v67, v6);
                  v69(v68, v6);
                  uint64_t v2 = v130;
                  if (v1) {
                    goto LABEL_115;
                  }
                  goto LABEL_76;
                }
                uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
                v119 = v115;
                MEMORY[0x270FA5388](AssociatedTypeWitness);
                swift_getAssociatedConformanceWitness();
                uint64_t v76 = sub_24E28DA70();
                v117 = v115;
                uint64_t v77 = v133;
                MEMORY[0x270FA5388](v76);
                unint64_t v118 = (v77 + 15) & 0xFFFFFFFFFFFFFFF0;
                v78 = &v115[-v118];
                sub_24E28DA50();
                int v116 = sub_24E28D700();
                uint64_t v79 = ((uint64_t (*)(unsigned char *, uint64_t))v134)(v78, v22);
                v119 = v115;
                MEMORY[0x270FA5388](v79);
                uint64_t v1 = (uint64_t)&v115[-v118];
                (*(void (**)(unsigned char *, unsigned char *, unint64_t))(v137 + 32))(&v115[-v118], v121, v6);
                if (v116) {
                  goto LABEL_117;
                }
                uint64_t v80 = v145;
                uint64_t v81 = sub_24E28D900();
                v134((unsigned char *)v1, v6);
                BOOL v74 = v81 < v80;
                uint64_t v2 = v130;
              }
              else
              {
                if (v65 >= 64)
                {
                  v134(v121, v22);
                  goto LABEL_76;
                }
                v73 = v121;
                uint64_t v1 = sub_24E28D900();
                v134(v73, v6);
                BOOL v74 = v1 < (uint64_t)v145;
              }
              if (v74) {
                goto LABEL_115;
              }
            }
LABEL_76:
            uint64_t v82 = sub_24E28D910();
            v124 = v115;
            MEMORY[0x270FA5388](v82);
            v84 = &v115[-((v83 + 15) & 0xFFFFFFFFFFFFFFF0)];
            ((void (*)(unsigned char *, unsigned char *, unint64_t))v131)(v84, v37, v6);
            if (v82 >= 65)
            {
              uint64_t v85 = ((uint64_t (*)(unsigned char *, unint64_t))v134)(v84, v6);
              goto LABEL_78;
            }
            uint64_t v93 = sub_24E28D910();
            v134(v84, v6);
            if (v93 != 64 || (uint64_t v85 = sub_24E28D920(), (v85 & 1) != 0))
            {
LABEL_89:
              uint64_t v100 = sub_24E28D900();
              v134(v37, v6);
              BOOL v57 = __OFADD__(v100, v126);
              uint64_t v1 = v100 + v126;
              if (v57) {
                goto LABEL_113;
              }
              unint64_t v146 = MEMORY[0x263F8E5C0];
              unint64_t v147 = sub_24E27E788();
              *(void *)&long long v145 = v1;
              char v148 = 2;
              sub_24E27E608((uint64_t)&v145, (uint64_t)v152);
              __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v149);
              uint64_t v16 = v123;
              goto LABEL_91;
            }
LABEL_78:
            MEMORY[0x270FA5388](v85);
            v87 = &v115[-((v86 + 15) & 0xFFFFFFFFFFFFFFF0)];
            ((void (*)(unsigned char *, unsigned char *, unint64_t))v131)(v87, v37, v6);
            *(void *)&long long v145 = 0x7FFFFFFFFFFFFFFFLL;
            char v88 = sub_24E28D920();
            uint64_t v89 = sub_24E28D910();
            if (v88)
            {
              if (v89 > 64)
              {
                v132 = v115;
                MEMORY[0x270FA5388](v89);
                v91 = &v115[-((v90 + 15) & 0xFFFFFFFFFFFFFFF0)];
                sub_24E27E788();
                sub_24E28D8F0();
                uint64_t v1 = sub_24E28D700();
                v92 = v134;
                v134(v91, v6);
                v92(v87, v6);
                uint64_t v2 = v130;
                goto LABEL_88;
              }
            }
            else
            {
              uint64_t v94 = v137;
              if (v89 > 63)
              {
                v131 = v115;
                v132 = v115;
                uint64_t v144 = 0x7FFFFFFFFFFFFFFFLL;
                unint64_t v95 = v6;
                uint64_t v96 = v133;
                MEMORY[0x270FA5388](v89);
                v97 = &v115[-((v96 + 15) & 0xFFFFFFFFFFFFFFF0)];
                uint64_t v98 = (*(uint64_t (**)(unsigned char *, unsigned char *, unint64_t))(v94 + 32))(v97, v87, v95);
                v121 = v115;
                unint64_t v6 = v95;
                v99 = v134;
                MEMORY[0x270FA5388](v98);
                sub_24E27E788();
                sub_24E28D8F0();
                uint64_t v1 = sub_24E28D700();
                v99(v97, v6);
                v134 = v99;
                v99(v97, v6);
                uint64_t v2 = v130;
LABEL_88:
                BOOL v37 = v129;
                if (v1) {
                  goto LABEL_114;
                }
                goto LABEL_89;
              }
            }
            uint64_t v1 = sub_24E28D900();
            v134(v87, v6);
            BOOL v37 = v129;
            if ((uint64_t)v145 < v1) {
              goto LABEL_114;
            }
            goto LABEL_89;
          }
        }
        else
        {
          v134 = *(void (**)(unsigned char *, unint64_t))(v30 + 8);
          v134(v26, v22);
        }
        BOOL v37 = v129;
        uint64_t v2 = v130;
        goto LABEL_76;
      }
      double v59 = *(double *)&v153;
      sub_24E27D6F8((uint64_t)v158, (uint64_t)&v145);
      if (v148 != 3)
      {
LABEL_107:
        swift_bridgeObjectRelease();
        sub_24E27E7DC((uint64_t)&v145);
        sub_24E27E830();
        swift_allocError();
        swift_willThrow();
        sub_24E27E7DC((uint64_t)v158);
        sub_24E27D80C((uint64_t)&v162);
        return swift_release();
      }
      sub_24E27E918(&v145, (uint64_t)v149);
      v60 = __swift_project_boxed_opaque_existential_1(v149, v150);
      MEMORY[0x270FA5388](v60);
      (*(void (**)(unsigned char *))(v62 + 16))(&v115[-((v61 + 15) & 0xFFFFFFFFFFFFFFF0)]);
      unint64_t v63 = sub_24E27E558();
      unint64_t v6 = MEMORY[0x263F8D538];
      sub_24E28D6C0();
      unint64_t v146 = v6;
      unint64_t v147 = v63;
      *(double *)&long long v145 = v59 + *(double *)&v145;
      char v148 = 3;
      sub_24E27E608((uint64_t)&v145, (uint64_t)v152);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v149);
      uint64_t v2 = v130;
LABEL_91:
      v101 = v143;
      swift_beginAccess();
      sub_24E27D6F8((uint64_t)v152, (uint64_t)&v153);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v149[0] = *v101;
      uint64_t v1 = v149[0];
      uint64_t *v101 = 0x8000000000000000;
      unint64_t v104 = sub_24E27C04C(v16, v15);
      uint64_t v105 = *(void *)(v1 + 16);
      BOOL v106 = (v103 & 1) == 0;
      uint64_t v107 = v105 + v106;
      if (__OFADD__(v105, v106)) {
        goto LABEL_110;
      }
      unint64_t v6 = v103;
      if (*(void *)(v1 + 24) >= v107)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          v110 = (void *)v149[0];
          if ((v103 & 1) == 0) {
            goto LABEL_95;
          }
        }
        else
        {
          uint64_t v1 = (uint64_t)v149;
          sub_24E27D16C();
          v110 = (void *)v149[0];
          if ((v6 & 1) == 0) {
            goto LABEL_95;
          }
        }
      }
      else
      {
        sub_24E27C29C(v107, isUniquelyReferenced_nonNull_native);
        uint64_t v1 = v149[0];
        unint64_t v108 = sub_24E27C04C(v16, v15);
        if ((v6 & 1) != (v109 & 1)) {
          goto LABEL_118;
        }
        unint64_t v104 = v108;
        v110 = (void *)v149[0];
        if ((v6 & 1) == 0)
        {
LABEL_95:
          v110[(v104 >> 6) + 8] |= 1 << v104;
          v111 = (uint64_t *)(v110[6] + 16 * v104);
          uint64_t *v111 = v16;
          v111[1] = v15;
          sub_24E27E608((uint64_t)&v153, v110[7] + 48 * v104);
          uint64_t v112 = v110[2];
          BOOL v57 = __OFADD__(v112, 1);
          uint64_t v113 = v112 + 1;
          if (v57) {
            goto LABEL_112;
          }
          v110[2] = v113;
          swift_bridgeObjectRetain();
          goto LABEL_100;
        }
      }
      sub_24E27E664((uint64_t)&v153, v110[7] + 48 * v104);
LABEL_100:
      uint64_t v1 = *v143;
      uint64_t *v143 = (uint64_t)v110;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_24E27E7DC((uint64_t)v152);
      sub_24E27E7DC((uint64_t)v158);
      sub_24E27D80C((uint64_t)&v162);
      unint64_t v6 = v138;
      if (v138) {
        goto LABEL_4;
      }
LABEL_6:
      int64_t v12 = v142 + 1;
      if (__OFADD__(v142, 1)) {
        goto LABEL_109;
      }
      if (v12 < v135)
      {
        unint64_t v13 = *(void *)(v128 + 8 * v12);
        if (v13) {
          goto LABEL_9;
        }
        int64_t v14 = v142 + 2;
        ++v142;
        if (v12 + 1 < v135)
        {
          unint64_t v13 = *(void *)(v128 + 8 * v14);
          if (v13) {
            goto LABEL_12;
          }
          int64_t v142 = v12 + 1;
          if (v12 + 2 < v135)
          {
            unint64_t v13 = *(void *)(v128 + 8 * (v12 + 2));
            if (v13)
            {
              v12 += 2;
              goto LABEL_9;
            }
            int64_t v14 = v12 + 3;
            int64_t v142 = v12 + 2;
            if (v12 + 3 < v135)
            {
              unint64_t v13 = *(void *)(v128 + 8 * v14);
              if (!v13)
              {
                while (1)
                {
                  int64_t v12 = v14 + 1;
                  if (__OFADD__(v14, 1)) {
                    goto LABEL_116;
                  }
                  if (v12 >= v135)
                  {
                    int64_t v142 = v122;
                    goto LABEL_23;
                  }
                  unint64_t v13 = *(void *)(v128 + 8 * v12);
                  ++v14;
                  if (v13) {
                    goto LABEL_9;
                  }
                }
              }
LABEL_12:
              int64_t v12 = v14;
LABEL_9:
              unint64_t v6 = (v13 - 1) & v13;
              unint64_t v8 = __clz(__rbit64(v13)) + (v12 << 6);
              int64_t v142 = v12;
              goto LABEL_5;
            }
          }
        }
      }
LABEL_23:
      unint64_t v6 = 0;
      memset(v163, 0, 42);
      long long v162 = 0u;
    }
    uint64_t v155 = 0;
    long long v153 = 0u;
    long long v154 = 0u;
    unsigned __int8 v156 = -1;
LABEL_40:
    sub_24E27E5AC((uint64_t)&v153, &qword_26B1B5028);
    sub_24E27D754((uint64_t)&v162, (uint64_t)&v153);
    if (v157)
    {
      uint64_t v40 = v2;
      unint64_t v41 = v6;
      if (v157 == 1)
      {
        uint64_t v42 = v153;
        uint64_t v159 = MEMORY[0x263F8E5C0];
        unint64_t v160 = sub_24E27E788();
        v158[0] = v42;
        char v43 = 2;
      }
      else
      {
        uint64_t v44 = v153;
        uint64_t v159 = MEMORY[0x263F8D538];
        unint64_t v160 = sub_24E27E558();
        v158[0] = v44;
        char v43 = 3;
      }
      char v161 = v43;
    }
    else
    {
      uint64_t v40 = v2;
      unint64_t v41 = v6;
      sub_24E27E608((uint64_t)&v153, (uint64_t)v158);
    }
    v45 = v143;
    swift_beginAccess();
    sub_24E27D6F8((uint64_t)v158, (uint64_t)&v153);
    char v46 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v145 = *v45;
    uint64_t v1 = v145;
    uint64_t *v45 = 0x8000000000000000;
    unint64_t v48 = sub_24E27C04C(v16, v15);
    uint64_t v49 = *(void *)(v1 + 16);
    BOOL v50 = (v47 & 1) == 0;
    uint64_t v51 = v49 + v50;
    if (!__OFADD__(v49, v50))
    {
      unint64_t v6 = v47;
      if (*(void *)(v1 + 24) >= v51)
      {
        if (v46)
        {
          v54 = (void *)v145;
          if ((v47 & 1) == 0) {
            goto LABEL_50;
          }
        }
        else
        {
          uint64_t v1 = (uint64_t)&v145;
          sub_24E27D16C();
          v54 = (void *)v145;
          if ((v6 & 1) == 0) {
            goto LABEL_50;
          }
        }
      }
      else
      {
        sub_24E27C29C(v51, v46);
        uint64_t v1 = v145;
        unint64_t v52 = sub_24E27C04C(v16, v15);
        if ((v6 & 1) != (v53 & 1)) {
          goto LABEL_118;
        }
        unint64_t v48 = v52;
        v54 = (void *)v145;
        if ((v6 & 1) == 0)
        {
LABEL_50:
          v54[(v48 >> 6) + 8] |= 1 << v48;
          v55 = (uint64_t *)(v54[6] + 16 * v48);
          uint64_t *v55 = v16;
          v55[1] = v15;
          sub_24E27E608((uint64_t)&v153, v54[7] + 48 * v48);
          uint64_t v56 = v54[2];
          BOOL v57 = __OFADD__(v56, 1);
          uint64_t v58 = v56 + 1;
          if (v57) {
            goto LABEL_111;
          }
          v54[2] = v58;
          swift_bridgeObjectRetain();
          goto LABEL_55;
        }
      }
      sub_24E27E664((uint64_t)&v153, v54[7] + 48 * v48);
LABEL_55:
      uint64_t v1 = *v143;
      uint64_t *v143 = (uint64_t)v54;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_24E27E7DC((uint64_t)v158);
      sub_24E27D80C((uint64_t)&v162);
      unint64_t v6 = v41;
      uint64_t v2 = v40;
      if (v6) {
        continue;
      }
      goto LABEL_6;
    }
    break;
  }
  __break(1u);
LABEL_109:
  __break(1u);
LABEL_110:
  __break(1u);
LABEL_111:
  __break(1u);
LABEL_112:
  __break(1u);
LABEL_113:
  __break(1u);
LABEL_114:
  __break(1u);
LABEL_115:
  __break(1u);
LABEL_116:
  __break(1u);
LABEL_117:
  v134((unsigned char *)v1, v6);
  __break(1u);
LABEL_118:
  uint64_t result = sub_24E28DA90();
  __break(1u);
  return result;
}

uint64_t sub_24E27AFB8(uint64_t a1)
{
  swift_getErrorValue();
  uint64_t v2 = sub_24E28DAB0();
  uint64_t v4 = v3;
  uint64_t v5 = MEMORY[0x263F8D310];
  uint64_t v13 = MEMORY[0x263F8D310];
  unint64_t v6 = sub_24E27D8F4();
  unint64_t v14 = v6;
  uint64_t v11 = v2;
  uint64_t v12 = v4;
  char v15 = 1;
  swift_beginAccess();
  sub_24E279B80((uint64_t)&v11, 0x6D6F44726F727265, 0xEB000000006E6961);
  swift_endAccess();
  swift_getErrorValue();
  uint64_t v7 = sub_24E28DAA0();
  uint64_t v13 = MEMORY[0x263F8D6C8];
  unint64_t v14 = sub_24E27D948();
  uint64_t v11 = v7;
  char v15 = 2;
  swift_beginAccess();
  sub_24E279B80((uint64_t)&v11, 0x646F43726F727265, 0xE900000000000065);
  swift_endAccess();
  uint64_t v11 = a1;
  MEMORY[0x253337280](a1);
  __swift_instantiateConcreteTypeFromMangledName(qword_26B1B5088);
  uint64_t v8 = sub_24E28D730();
  uint64_t v13 = v5;
  unint64_t v14 = v6;
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  char v15 = 1;
  swift_beginAccess();
  sub_24E279B80((uint64_t)&v11, 0xD000000000000010, 0x800000024E28F060);
  return swift_endAccess();
}

uint64_t sub_24E27B180@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24E27B2E8();
  sub_24E279C5C(v4);
  swift_bridgeObjectRelease();
  sub_24E28D7B0();
  uint64_t v5 = v2 + *(void *)(*(void *)v2 + 128);
  uint64_t v6 = type metadata accessor for AnyAnalyticsEvent();
  uint64_t v7 = (char *)a1 + *(int *)(v6 + 20);
  uint64_t v8 = sub_24E28D660();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v7, v5, v8);
  uint64_t v9 = (uint64_t *)(v2 + *(void *)(*(void *)v2 + 152));
  swift_beginAccess();
  uint64_t v10 = *v9;
  *a1 = v12;
  a1[1] = v13;
  *(void *)((char *)a1 + *(int *)(v6 + 24)) = v10;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24E27B2E8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5050);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v40 = (uint64_t)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v36 - v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v36 - v6;
  uint64_t v8 = sub_24E28D9C0();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v39 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v36 - v11;
  uint64_t v13 = sub_24E28D640();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E28D630();
  uint64_t v17 = sub_24E28D610();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v44[0] = v17;
  uint64_t v18 = sub_24E28DA40();
  uint64_t v20 = v19;
  uint64_t v45 = MEMORY[0x263F8D310];
  unint64_t v46 = sub_24E27D8F4();
  v44[0] = v18;
  v44[1] = v20;
  __int16 v47 = 1;
  sub_24E27D7B0((uint64_t)v44, (uint64_t)v43);
  uint64_t v21 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v42 = v21;
  sub_24E27CF40((uint64_t)v43, 0x6D695468636F7065, 0xE900000000000065, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = v42;
  swift_bridgeObjectRelease();
  uint64_t v24 = v41;
  sub_24E2788A8((uint64_t)v7);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v25(v7, 1, v8) == 1)
  {
    sub_24E27E5AC((uint64_t)v7, &qword_26B1B5050);
  }
  else
  {
    uint64_t v37 = v23;
    v26 = *(void (**)(void))(v24 + 32);
    char v38 = v12;
    v26();
    sub_24E278970((uint64_t)v5);
    int v27 = v25(v5, 1, v8);
    sub_24E27E5AC((uint64_t)v5, &qword_26B1B5050);
    if (v27 == 1) {
      sub_24E278BF8();
    }
    uint64_t v28 = v40;
    sub_24E278970(v40);
    if (v25((char *)v28, 1, v8) == 1)
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v38, v8);
      sub_24E27E5AC(v28, &qword_26B1B5050);
      return v37;
    }
    else
    {
      char v29 = v39;
      ((void (*)(char *, uint64_t, uint64_t))v26)(v39, v28, v8);
      uint64_t v30 = v38;
      sub_24E28D9B0();
      double v31 = (double)sub_24E28DB70() / 1000.0;
      uint64_t v45 = MEMORY[0x263F8D538];
      unint64_t v46 = sub_24E27E558();
      *(double *)uint64_t v44 = v31;
      __int16 v47 = 3;
      sub_24E27D7B0((uint64_t)v44, (uint64_t)v43);
      uint64_t v32 = v37;
      char v33 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v42 = v32;
      sub_24E27CF40((uint64_t)v43, 0x6E6F697461727564, 0xE800000000000000, v33);
      uint64_t v23 = v42;
      swift_bridgeObjectRelease();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v24 + 8);
      v34(v29, v8);
      v34(v30, v8);
    }
  }
  return v23;
}

uint64_t AnalyticsEvent.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 120));
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 128);
  uint64_t v2 = sub_24E28D660();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24E27E5AC(v0 + *(void *)(*(void *)v0 + 136), &qword_26B1B5050);
  sub_24E27E5AC(v0 + *(void *)(*(void *)v0 + 144), &qword_26B1B5050);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AnalyticsEvent.__deallocating_deinit()
{
  AnalyticsEvent.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t AnalyticsEvent.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E27B8FC()
{
  return AnalyticsEvent.unownedExecutor.getter();
}

uint64_t AnyAnalyticsEvent.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnyAnalyticsEvent.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AnyAnalyticsEvent() + 20);
  uint64_t v4 = sub_24E28D660();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t AnyAnalyticsEvent.eventData.getter()
{
  type metadata accessor for AnyAnalyticsEvent();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24E27B9F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24E27BAC8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24E27E6C0((uint64_t)v12, *a3);
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
      sub_24E27E6C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_24E27BAC8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24E28D8E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24E27BC84(a5, a6);
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
  uint64_t v8 = sub_24E28D990();
  if (!v8)
  {
    sub_24E28D9F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24E28DA30();
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

uint64_t sub_24E27BC84(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24E27BD1C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24E27BEFC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24E27BEFC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24E27BD1C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24E27BE94(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24E28D980();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24E28D9F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24E28D780();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24E28DA30();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24E28D9F0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24E27BE94(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_26B1B4EB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24E27BEFC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_26B1B4EB8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
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
  uint64_t result = sub_24E28DA30();
  __break(1u);
  return result;
}

unint64_t sub_24E27C04C(uint64_t a1, uint64_t a2)
{
  sub_24E28DB10();
  sub_24E28D750();
  uint64_t v4 = sub_24E28DB40();
  return sub_24E27C0C4(a1, a2, v4);
}

unint64_t sub_24E27C0C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24E28DA60() & 1) == 0)
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
      while (!v14 && (sub_24E28DA60() & 1) == 0);
    }
  }
  return v6;
}

double sub_24E27C1A8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_24E27C04C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24E27D16C();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_24E27E608(*(void *)(v11 + 56) + 48 * v8, a3);
    sub_24E27CBFC(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(unsigned char *)(a3 + 40) = -1;
  }
  return result;
}

uint64_t sub_24E27C29C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5060);
  char v37 = a2;
  uint64_t v6 = sub_24E28DA20();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = *(void *)(v5 + 56) + 48 * v17;
    if (v37)
    {
      sub_24E27E608(v25, (uint64_t)v38);
    }
    else
    {
      sub_24E27D6F8(v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_24E28DB10();
    sub_24E28D750();
    uint64_t result = sub_24E28DB40();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *uint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_24E27E608((uint64_t)v38, *(void *)(v7 + 56) + 48 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_24E27C5C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5068);
  char v37 = a2;
  uint64_t v6 = sub_24E28DA20();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = *(void *)(v5 + 56) + 48 * v17;
    if (v37)
    {
      sub_24E27D7B0(v25, (uint64_t)v38);
    }
    else
    {
      sub_24E27D754(v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_24E28DB10();
    sub_24E28D750();
    uint64_t result = sub_24E28DB40();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *uint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_24E27D7B0((uint64_t)v38, *(void *)(v7 + 56) + 48 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_24E27C8EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5070);
  char v38 = a2;
  uint64_t v6 = sub_24E28DA20();
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
  int64_t v35 = v2;
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
    uint64_t v22 = (void *)(v5 + 64);
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
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_24E28DB10();
    sub_24E28D750();
    uint64_t result = sub_24E28DB40();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_24E27CBFC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24E28D960();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24E28DB10();
        swift_bridgeObjectRetain();
        sub_24E28D750();
        uint64_t v11 = sub_24E28DB40();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          unint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *uint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = (long long *)(v16 + 48 * v3);
          int64_t v18 = (long long *)(v16 + 48 * v6);
          if (48 * v3 < (uint64_t)(48 * v6) || v17 >= v18 + 3 || (v19 = v3 == v6, int64_t v3 = v6, !v19))
          {
            long long v9 = *v18;
            long long v10 = v18[2];
            v17[1] = v18[1];
            v17[2] = v10;
            *unint64_t v17 = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24E27CDF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_24E27C04C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24E27D16C();
      goto LABEL_7;
    }
    sub_24E27C29C(v15, a4 & 1);
    unint64_t v21 = sub_24E27C04C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24E28DA90();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 48 * v12;
    return sub_24E27E664(a1, v19);
  }
LABEL_13:
  sub_24E27D08C(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24E27CF40(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_24E27C04C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24E27D358();
      goto LABEL_7;
    }
    sub_24E27C5C4(v15, a4 & 1);
    unint64_t v21 = sub_24E27C04C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24E28DA90();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 48 * v12;
    return sub_24E27D860(a1, v19);
  }
LABEL_13:
  sub_24E27D0FC(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24E27D08C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_24E27E608(a4, a5[7] + 48 * a1);
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_24E27D0FC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_24E27D7B0(a4, a5[7] + 48 * a1);
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_24E27D16C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5060);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E28DA10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 48 * v15;
    sub_24E27D6F8(*(void *)(v2 + 56) + 48 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_24E27E608((uint64_t)v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24E27D358()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5068);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E28DA10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 48 * v15;
    sub_24E27D754(*(void *)(v2 + 56) + 48 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_24E27D7B0((uint64_t)v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

id sub_24E27D544()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5070);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E28DA10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
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

uint64_t sub_24E27D6F8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24E27D754(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24E27D7B0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24E27D80C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24E27D860(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24E27D8F4()
{
  unint64_t result = qword_26B1B5030;
  if (!qword_26B1B5030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B5030);
  }
  return result;
}

unint64_t sub_24E27D948()
{
  unint64_t result = qword_26B1B5080;
  if (!qword_26B1B5080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B5080);
  }
  return result;
}

uint64_t type metadata accessor for AnyAnalyticsEvent()
{
  uint64_t result = qword_26B1B4F70;
  if (!qword_26B1B4F70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24E27D9EC()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_24E28D660();
    if (v1 <= 0x3F)
    {
      sub_24E27DE28();
      if (v2 <= 0x3F) {
        swift_initClassMetadata2();
      }
    }
  }
}

uint64_t type metadata accessor for AnalyticsEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for AnalyticsEvent);
}

uint64_t method lookup function for AnalyticsEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnalyticsEvent);
}

uint64_t dispatch thunk of AnalyticsEvent.__allocating_init(name:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of AnalyticsEvent.startTiming()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of AnalyticsEvent.stopTiming()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of AnalyticsEvent.value(key:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of AnalyticsEvent.append(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 264) + **(int **)(*(void *)v2 + 264));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_24E27DCDC;
  return v8(a1, a2);
}

uint64_t sub_24E27DCDC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of AnalyticsEvent.append(error:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of AnalyticsEvent.anyAnalyticsEvent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

void sub_24E27DE28()
{
  if (!qword_26B1B5058)
  {
    sub_24E28D9C0();
    unint64_t v0 = sub_24E28D8C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1B5058);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for AnyAnalyticsEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24E28D660();
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AnyAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24E28D660();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AnyAnalyticsEvent(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24E28D660();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AnyAnalyticsEvent(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24E28D660();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for AnyAnalyticsEvent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24E28D660();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for AnyAnalyticsEvent(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24E28D660();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyAnalyticsEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E27E2E0);
}

uint64_t sub_24E27E2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24E28D660();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AnyAnalyticsEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E27E3A4);
}

uint64_t sub_24E27E3A4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24E28D660();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24E27E44C()
{
  uint64_t result = sub_24E28D660();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24E27E4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E27E558()
{
  unint64_t result = qword_26B1B4F88;
  if (!qword_26B1B4F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B4F88);
  }
  return result;
}

uint64_t sub_24E27E5AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E27E608(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24E27E664(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24E27E6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24E27E720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E27E788()
{
  unint64_t result = qword_2698C8F00;
  if (!qword_2698C8F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8F00);
  }
  return result;
}

uint64_t sub_24E27E7DC(uint64_t a1)
{
  return a1;
}

unint64_t sub_24E27E830()
{
  unint64_t result = qword_2698C8F08;
  if (!qword_2698C8F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8F08);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24E27E918(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24E27E930(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_26B1B4D30)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26B1B4D30);
    }
  }
}

uint64_t sub_24E27E9F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698C8F10);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_24E27C04C(a2, a3);
  if ((v12 & 1) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_24E27E6C0(*(void *)(a1 + 56) + 32 * v11, (uint64_t)&v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_9:
    unint64_t v15 = &qword_2698C8F18;
    uint64_t v16 = (char *)&v20;
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    sub_24E27ED1C();
    swift_allocError();
    *(void *)uint64_t v17 = a2;
    *(void *)(v17 + 8) = a3;
    *(unsigned char *)(v17 + 16) = 2;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  sub_24E28D5B0();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_24E28D5C0();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13) == 1)
  {
    unint64_t v15 = &qword_2698C8F10;
    uint64_t v16 = v10;
LABEL_10:
    sub_24E27E5AC((uint64_t)v16, v15);
    goto LABEL_11;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a4, v10, v13);
}

uint64_t sub_24E27EC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a1 + 16))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24E27C04C(a2, a3);
  if ((v7 & 1) == 0)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_24E27E6C0(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v11);
  swift_bridgeObjectRelease();
  if (!*((void *)&v12 + 1))
  {
LABEL_8:
    sub_24E27E5AC((uint64_t)&v11, &qword_2698C8F18);
    goto LABEL_9;
  }
  if (swift_dynamicCast()) {
    return v10;
  }
LABEL_9:
  sub_24E27ED1C();
  swift_allocError();
  *(void *)uint64_t v9 = a2;
  *(void *)(v9 + 8) = a3;
  *(unsigned char *)(v9 + 16) = 2;
  swift_bridgeObjectRetain();
  return swift_willThrow();
}

unint64_t sub_24E27ED1C()
{
  unint64_t result = qword_2698C8F20;
  if (!qword_2698C8F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8F20);
  }
  return result;
}

uint64_t SearchpartyAccount.icloudIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SearchpartyAccount.dsid.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SearchpartyAccount.token.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SearchpartyAccount.findmy_key_sharing_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 28);
  uint64_t v4 = sub_24E28D5C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for SearchpartyAccount()
{
  uint64_t result = qword_2698C8F28;
  if (!qword_2698C8F28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SearchpartyAccount.findmy_owner_device_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 32);
  uint64_t v4 = sub_24E28D5C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SearchpartyAccount.findmyservice_gateway_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 36);
  uint64_t v4 = sub_24E28D5C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SearchpartyAccount.fmadminws_gateway_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 40);
  uint64_t v4 = sub_24E28D5C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SearchpartyAccount.icloud_acsn_gateway_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 44);
  uint64_t v4 = sub_24E28D5C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SearchpartyAccount.icloud_fmip_al_service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 48);
  uint64_t v4 = sub_24E28D5C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SearchpartyAccount.init(icloudIdentifier:dsid:token:findmy_key_sharing_url:findmy_owner_device_url:findmyservice_gateway_url:fmadminws_gateway_url:icloud_acsn_gateway_url:icloud_fmip_al_service:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)a9 = a1;
  *((void *)a9 + 1) = a2;
  *((void *)a9 + 2) = a3;
  *((void *)a9 + 3) = a4;
  *((void *)a9 + 4) = a5;
  *((void *)a9 + 5) = a6;
  uint64_t v16 = (int *)type metadata accessor for SearchpartyAccount();
  uint64_t v17 = &a9[v16[7]];
  uint64_t v18 = sub_24E28D5C0();
  long long v21 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
  ((void (*)(void *__return_ptr, char *, uint64_t, uint64_t))v21)((void *)(v18 - 8), v17, a7, v18);
  v21(&a9[v16[8]], a8, v18);
  v21(&a9[v16[9]], a10, v18);
  v21(&a9[v16[10]], a11, v18);
  v21(&a9[v16[11]], a12, v18);
  uint64_t v19 = &a9[v16[12]];
  return ((uint64_t (*)(char *, uint64_t, uint64_t))v21)(v19, a13, v18);
}

char *initializeBufferWithCopyOfBuffer for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = *((void *)a2 + 3);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *((void *)a1 + 3) = v8;
    uint64_t v9 = *((void *)a2 + 5);
    uint64_t v10 = a3[7];
    uint64_t v16 = &a1[v10];
    long long v11 = &a2[v10];
    *((void *)a1 + 4) = *((void *)a2 + 4);
    *((void *)a1 + 5) = v9;
    uint64_t v12 = sub_24E28D5C0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v16, v11, v12);
    v13(&v4[a3[8]], &a2[a3[8]], v12);
    v13(&v4[a3[9]], &a2[a3[9]], v12);
    v13(&v4[a3[10]], &a2[a3[10]], v12);
    v13(&v4[a3[11]], &a2[a3[11]], v12);
    v13(&v4[a3[12]], &a2[a3[12]], v12);
  }
  return v4;
}

uint64_t destroy for SearchpartyAccount(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_24E28D5C0();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  v8(a1 + a2[8], v5);
  v8(a1 + a2[9], v5);
  v8(a1 + a2[10], v5);
  v8(a1 + a2[11], v5);
  uint64_t v6 = a1 + a2[12];
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v5);
}

char *initializeWithCopy for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  uint64_t v8 = *((void *)a2 + 5);
  uint64_t v9 = a3[7];
  uint64_t v14 = &a1[v9];
  uint64_t v10 = &a2[v9];
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v8;
  uint64_t v11 = sub_24E28D5C0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v14, v10, v11);
  v12(&a1[a3[8]], &a2[a3[8]], v11);
  v12(&a1[a3[9]], &a2[a3[9]], v11);
  v12(&a1[a3[10]], &a2[a3[10]], v11);
  v12(&a1[a3[11]], &a2[a3[11]], v11);
  v12(&a1[a3[12]], &a2[a3[12]], v11);
  return a1;
}

char *assignWithCopy for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24E28D5C0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[8]], &a2[a3[8]], v9);
  v10(&a1[a3[9]], &a2[a3[9]], v9);
  v10(&a1[a3[10]], &a2[a3[10]], v9);
  v10(&a1[a3[11]], &a2[a3[11]], v9);
  v10(&a1[a3[12]], &a2[a3[12]], v9);
  return a1;
}

char *initializeWithTake for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v7 = a3[7];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_24E28D5C0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(&a1[a3[8]], &a2[a3[8]], v10);
  v11(&a1[a3[9]], &a2[a3[9]], v10);
  v11(&a1[a3[10]], &a2[a3[10]], v10);
  v11(&a1[a3[11]], &a2[a3[11]], v10);
  v11(&a1[a3[12]], &a2[a3[12]], v10);
  return a1;
}

char *assignWithTake for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *((void *)a2 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_24E28D5C0();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40);
  v13(v10, v11, v12);
  v13(&a1[a3[8]], &a2[a3[8]], v12);
  v13(&a1[a3[9]], &a2[a3[9]], v12);
  v13(&a1[a3[10]], &a2[a3[10]], v12);
  v13(&a1[a3[11]], &a2[a3[11]], v12);
  v13(&a1[a3[12]], &a2[a3[12]], v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchpartyAccount(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E27FAD0);
}

uint64_t sub_24E27FAD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24E28D5C0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SearchpartyAccount(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E27FB94);
}

uint64_t sub_24E27FB94(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24E28D5C0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24E27FC3C()
{
  uint64_t result = sub_24E28D5C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_24E27FCE0(id a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  v73 = a3;
  uint64_t v5 = sub_24E28D5C0();
  uint64_t v68 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v67 = (uint64_t)&v56 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v56 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v56 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v56 - v18;
  MEMORY[0x270FA5388](v17);
  long long v21 = (char *)&v56 - v20;
  id v22 = objc_msgSend(a2, sel_aa_personID);
  if (!v22) {
    goto LABEL_9;
  }
  unint64_t v23 = v22;
  char v64 = v8;
  uint64_t v65 = sub_24E28D720();
  uint64_t v25 = v24;

  id v26 = objc_msgSend(a2, sel_username);
  if (!v26)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    sub_24E27ED1C();
    swift_allocError();
    long long v38 = xmmword_24E28E310;
LABEL_12:
    *(_OWORD *)uint64_t v37 = v38;
    *(unsigned char *)(v37 + 16) = 3;
    swift_willThrow();
LABEL_13:

    return;
  }
  BOOL v27 = v26;
  uint64_t v62 = sub_24E28D720();
  uint64_t v66 = v28;

  id v29 = objc_msgSend(a1, sel_credentialForAccount_, a2);
  if (!v29)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24E27ED1C();
    swift_allocError();
    long long v38 = xmmword_24E28E300;
    goto LABEL_12;
  }
  uint64_t v63 = v25;
  uint64_t v30 = v29;
  id v31 = objc_msgSend(v29, sel_credentialItemForKey_, *MEMORY[0x263EFB1D8]);
  if (!v31)
  {

    goto LABEL_11;
  }
  uint64_t v32 = v31;
  id v60 = v30;
  uint64_t v58 = v5;
  uint64_t v57 = sub_24E28D720();
  uint64_t v61 = v33;

  id v34 = objc_msgSend(a2, sel_dataclassProperties);
  if (!v34)
  {
    long long v71 = 0u;
    long long v72 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    sub_24E28056C((uint64_t)&v71);
LABEL_23:
    sub_24E27ED1C();
    swift_allocError();
    *(void *)uint64_t v45 = 0xD00000000000001FLL;
    *(void *)(v45 + 8) = 0x800000024E28F300;
    *(unsigned char *)(v45 + 16) = 1;
    swift_willThrow();
    goto LABEL_24;
  }
  int64_t v35 = v34;
  id v59 = a1;
  *(void *)&v70[0] = 0xD00000000000001FLL;
  *((void *)&v70[0] + 1) = 0x800000024E28F300;
  id v36 = objc_msgSend(v34, sel___swift_objectForKeyedSubscript_, sub_24E28DA80());
  swift_unknownObjectRelease();

  if (v36)
  {
    sub_24E28D930();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v70, 0, sizeof(v70));
  }
  sub_24E2805CC((uint64_t)v70, (uint64_t)&v71);
  a1 = v59;
  uint64_t v39 = v66;
  if (!*((void *)&v72 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698C8F38);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  uint64_t v40 = *(void *)&v70[0];
  uint64_t v41 = v61;
  uint64_t v42 = v73;
  uint64_t *v73 = v62;
  v42[1] = v39;
  uint64_t v43 = v63;
  v42[2] = v65;
  v42[3] = v43;
  v42[4] = v57;
  v42[5] = v41;
  uint64_t v65 = v40;
  uint64_t v44 = v69;
  sub_24E27E9F0(v40, 0xD000000000000016, 0x800000024E28F320, (uint64_t)v21);
  if (v44)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_24:

    goto LABEL_13;
  }
  unint64_t v46 = (int *)type metadata accessor for SearchpartyAccount();
  __int16 v47 = (char *)v73 + v46[7];
  unint64_t v48 = v21;
  uint64_t v49 = v58;
  v69 = *(void (**)(void, void, void))(v68 + 32);
  v69(v47, v48, v58);
  sub_24E27E9F0(v65, 0xD000000000000017, 0x800000024E28F340, (uint64_t)v19);
  v69((char *)v73 + v46[8], v19, v49);
  uint64_t v50 = v65;
  uint64_t v62 = 0;
  sub_24E27E9F0(v65, 0xD000000000000019, 0x800000024E28F360, (uint64_t)v16);
  v69((char *)v73 + v46[9], v16, v49);
  sub_24E27E9F0(v50, 0xD000000000000015, 0x800000024E28F380, (uint64_t)v13);
  uint64_t v51 = v50;
  unint64_t v52 = v46;
  v69((char *)v73 + v46[10], v13, v49);
  uint64_t v53 = v67;
  sub_24E27E9F0(v51, 0xD000000000000017, 0x800000024E28F3A0, v67);
  v54 = v73;
  v69((char *)v73 + v52[11], v53, v58);
  uint64_t v55 = (uint64_t)v64;
  sub_24E27E9F0(v51, 0xD000000000000016, 0x800000024E28F3C0, (uint64_t)v64);
  swift_bridgeObjectRelease();

  v69((char *)v54 + v52[12], v55, v58);
}

uint64_t sub_24E28056C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698C8F18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E2805CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698C8F18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E280634()
{
  uint64_t v0 = sub_24E28D690();
  __swift_allocate_value_buffer(v0, qword_2698C9068);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2698C9068);
  if (qword_2698C8ED8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2698C8F40);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t static AppleAccount.fmipAccount.getter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E28078C;
  return sub_24E281194();
}

uint64_t sub_24E28078C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[4] = a1;
  v4[5] = a2;
  v4[6] = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24E2808C4, 0, 0);
  }
}

uint64_t sub_24E2808C4()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 48);
    sub_24E2820FC(v1, *(void **)(v0 + 32), (uint64_t *)&v12);
    if (v2)
    {
      uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_7;
    }
    uint64_t v5 = *(void *)(v0 + 16);
    uint64_t v6 = v13;
    uint64_t v7 = v14;
    uint64_t v8 = v17;
    uint64_t v9 = v18;
    *(_OWORD *)uint64_t v5 = v12;
    *(void *)(v5 + 16) = v6;
    *(void *)(v5 + 24) = v7;
    long long v10 = v16;
    *(_OWORD *)(v5 + 32) = v15;
    *(_OWORD *)(v5 + 48) = v10;
    *(void *)(v5 + 64) = v8;
    *(void *)(v5 + 72) = v9;
  }
  else
  {
    uint64_t v4 = *(_OWORD **)(v0 + 16);

    v4[3] = 0u;
    v4[4] = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    *uint64_t v4 = 0u;
  }
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
LABEL_7:
  return v3();
}

uint64_t static AppleAccount.searchpartyAccount.getter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E280A2C;
  return sub_24E281194();
}

uint64_t sub_24E280A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[4] = a1;
  v4[5] = a2;
  v4[6] = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24E280B64, 0, 0);
  }
}

uint64_t sub_24E280B64()
{
  uint64_t v1 = (void *)v0[5];
  if (v1)
  {
    uint64_t v2 = v0[6];
    uint64_t v3 = (void *)v0[4];
    uint64_t v4 = (uint64_t *)v0[2];
    id v5 = v1;
    sub_24E27FCE0(v3, v5, v4);
    if (!v2)
    {
      uint64_t v8 = v0[2];
      uint64_t v9 = type metadata accessor for SearchpartyAccount();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
    }
  }
  else
  {
    id v5 = (id)v0[4];
    uint64_t v6 = v0[2];
    uint64_t v7 = type metadata accessor for SearchpartyAccount();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  }

  long long v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

unint64_t AppleAccount.Error.description.getter()
{
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
      sub_24E28D970();
      swift_bridgeObjectRelease();
      unint64_t v1 = 0xD000000000000012;
      goto LABEL_5;
    case 2:
      sub_24E28D970();
      swift_bridgeObjectRelease();
      unint64_t v1 = 0xD00000000000001ALL;
      goto LABEL_5;
    case 3:
      unint64_t result = 0xD000000000000016;
      switch(*(void *)v0)
      {
        case 1:
        case 3:
        case 4:
          unint64_t result = 0xD000000000000013;
          break;
        case 2:
          unint64_t result = 0xD00000000000001BLL;
          break;
        default:
          return result;
      }
      return result;
    default:
      sub_24E28D970();
      swift_bridgeObjectRelease();
      unint64_t v1 = 0xD000000000000014;
LABEL_5:
      unint64_t v3 = v1;
      sub_24E28D760();
      sub_24E28D760();
      return v3;
  }
}

uint64_t sub_24E280E78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_26B1B5088);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    uint64_t v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_24E282030((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_24E280F3C()
{
  uint64_t v0 = sub_24E28D690();
  __swift_allocate_value_buffer(v0, qword_2698C8F40);
  __swift_project_value_buffer(v0, (uint64_t)qword_2698C8F40);
  return sub_24E28D680();
}

uint64_t sub_24E280FBC()
{
  uint64_t v0 = ".framework.FindMyCommon";
  sub_24E28D580();
  if (!v6)
  {
    sub_24E28056C((uint64_t)v5);
LABEL_10:
    sub_24E27ED1C();
    swift_allocError();
    unint64_t v3 = 0xD00000000000002ALL;
LABEL_11:
    *(void *)uint64_t v2 = v3;
LABEL_12:
    *(void *)(v2 + 8) = (unint64_t)v0 | 0x8000000000000000;
    *(unsigned char *)(v2 + 16) = 0;
    return swift_willThrow();
  }
  if ((swift_dynamicCast() & 1) == 0 || (v4 & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v0 = "ts.appleaccount.fullaccess";
  sub_24E28D580();
  if ((swift_dynamicCast() & 1) == 0 || (v4 & 1) == 0)
  {
    sub_24E27ED1C();
    swift_allocError();
    unint64_t v3 = 0xD000000000000022;
    goto LABEL_11;
  }
  uint64_t v0 = "ts.idms.fullaccess";
  sub_24E28D580();
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0 || (v4 & 1) == 0)
  {
    sub_24E27ED1C();
    swift_allocError();
    *(void *)uint64_t v2 = 0xD000000000000020;
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_24E281194()
{
  uint64_t v1 = sub_24E28DB90();
  v0[17] = v1;
  v0[18] = *(void *)(v1 - 8);
  v0[19] = swift_task_alloc();
  uint64_t v2 = sub_24E28D9C0();
  v0[20] = v2;
  v0[21] = *(void *)(v2 - 8);
  v0[22] = swift_task_alloc();
  v0[23] = swift_task_alloc();
  v0[24] = swift_task_alloc();
  uint64_t v3 = sub_24E28D9E0();
  v0[25] = v3;
  v0[26] = *(void *)(v3 - 8);
  v0[27] = swift_task_alloc();
  v0[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E281334, 0, 0);
}

uint64_t sub_24E281334()
{
  if (MEMORY[0x2533367E0]())
  {
    uint64_t v1 = sub_24E28D530();
    sub_24E281FE8(&qword_2698C8F70, MEMORY[0x263F3C9B0]);
    swift_allocError();
    *uint64_t v2 = 0xD00000000000001ELL;
    v2[1] = 0x800000024E28F500;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v2, *MEMORY[0x263F3C9A8], v1);
    swift_willThrow();
LABEL_4:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  sub_24E280FBC();
  sub_24E28D9D0();
  if (qword_2698C8ED0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24E28D690();
  v0[29] = __swift_project_value_buffer(v5, (uint64_t)qword_2698C9068);
  uint64_t v6 = sub_24E28D670();
  os_log_type_t v7 = sub_24E28D860();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_24E276000, v6, v7, "Retrieving aa_primaryAppleAccount...", v8, 2u);
    MEMORY[0x253337400](v8, -1, -1);
  }

  sub_24E28D9A0();
  id v9 = objc_msgSend(self, sel_defaultStore);
  v0[30] = v9;
  if (!v9)
  {
    uint64_t v12 = v0[28];
    uint64_t v13 = v0[25];
    uint64_t v14 = v0[26];
    uint64_t v15 = v0[24];
    uint64_t v16 = v0[20];
    uint64_t v17 = v0[21];
    sub_24E27ED1C();
    swift_allocError();
    *(void *)uint64_t v18 = 0;
    *(void *)(v18 + 8) = 0;
    *(unsigned char *)(v18 + 16) = 3;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    goto LABEL_4;
  }
  long long v10 = v9;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24E281708;
  uint64_t v11 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24E280E78;
  v0[13] = &block_descriptor;
  v0[14] = v11;
  objc_msgSend(v10, sel_aa_primaryAppleAccountWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24E281708()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 248) = v1;
  if (v1) {
    uint64_t v2 = sub_24E281CC0;
  }
  else {
    uint64_t v2 = sub_24E281818;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E281818()
{
  uint64_t v49 = v0;
  uint64_t v47 = *(void *)(v0 + 120);
  if (v47)
  {
    uint64_t v1 = *(void *)(v0 + 224);
    uint64_t v3 = *(void *)(v0 + 208);
    uint64_t v2 = *(void *)(v0 + 216);
    uint64_t v4 = *(void *)(v0 + 200);
    (*(void (**)(void, void, void))(*(void *)(v0 + 168) + 16))(*(void *)(v0 + 184), *(void *)(v0 + 192), *(void *)(v0 + 160));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
    uint64_t v5 = sub_24E28D670();
    os_log_type_t v6 = sub_24E28D860();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v9 = *(void *)(v0 + 216);
    uint64_t v8 = *(void *)(v0 + 224);
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v10 = *(void *)(v0 + 208);
    uint64_t v12 = *(void *)(v0 + 184);
    uint64_t v46 = *(void *)(v0 + 192);
    if (v7)
    {
      log = v5;
      uint64_t v45 = *(void *)(v0 + 224);
      uint64_t v13 = *(void *)(v0 + 176);
      uint64_t v38 = *(void *)(v0 + 136);
      uint64_t v39 = *(void *)(v0 + 168);
      uint64_t v14 = *(void *)(v0 + 152);
      uint64_t v37 = *(void *)(v0 + 160);
      uint64_t v15 = *(void *)(v0 + 144);
      os_log_type_t type = v6;
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v48 = v42;
      buf = v16;
      *(_DWORD *)uint64_t v16 = 136315138;
      uint64_t v40 = v9;
      sub_24E28D9A0();
      sub_24E28DB80();
      sub_24E281FE8(&qword_26B1B4EA8, MEMORY[0x263F8F6D8]);
      uint64_t v17 = sub_24E28DB60();
      unint64_t v19 = v18;
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v38);
      uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
      v20(v13, v37);
      *(void *)(v0 + 128) = sub_24E27B9F4(v17, v19, &v48);
      sub_24E28D8D0();
      swift_bridgeObjectRelease();
      v20(v12, v37);
      long long v21 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v21(v40, v11);
      _os_log_impl(&dword_24E276000, log, type, "aa_primaryAppleAccount fetch duration: %s", buf, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253337400](v42, -1, -1);
      MEMORY[0x253337400](buf, -1, -1);

      v20(v46, v37);
      v21(v45, v11);
    }
    else
    {
      uint64_t v32 = *(void *)(v0 + 160);
      uint64_t v31 = *(void *)(v0 + 168);

      uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
      v33(v12, v32);
      id v34 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v34(v9, v11);
      v33(v46, v32);
      v34(v8, v11);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int64_t v35 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    uint64_t v36 = *(void *)(v0 + 240);
    return v35(v36, v47);
  }
  else
  {

    uint64_t v22 = *(void *)(v0 + 224);
    uint64_t v23 = *(void *)(v0 + 200);
    uint64_t v24 = *(void *)(v0 + 208);
    uint64_t v25 = *(void *)(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 160);
    uint64_t v27 = *(void *)(v0 + 168);
    sub_24E27ED1C();
    swift_allocError();
    *(void *)uint64_t v28 = 0;
    *(void *)(v28 + 8) = 0;
    *(unsigned char *)(v28 + 16) = 3;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29();
  }
}

uint64_t sub_24E281CC0()
{
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = v0[20];
  uint64_t v7 = v0[21];
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

ValueMetadata *type metadata accessor for AppleAccount()
{
  return &type metadata for AppleAccount;
}

uint64_t sub_24E281DD8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for AppleAccount.Error(uint64_t a1)
{
  return sub_24E281E00(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24E281E00(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s12FindMyCommon12AppleAccountO5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24E281DD8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AppleAccount.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24E281DD8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24E281E00(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppleAccount.Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24E281E00(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleAccount.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleAccount.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24E281FA4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_24E281FC0(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppleAccount.Error()
{
  return &type metadata for AppleAccount.Error;
}

uint64_t sub_24E281FE8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E282030(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698C8F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

void sub_24E2820FC(id a1@<X1>, void *a2@<X0>, uint64_t *a3@<X8>)
{
  id v7 = objc_msgSend(a1, sel_aa_personID);
  if (!v7) {
    goto LABEL_7;
  }
  unsigned __int8 v8 = v7;
  uint64_t v9 = sub_24E28D720();
  uint64_t v11 = v10;

  id v12 = objc_msgSend(a1, sel_username);
  if (!v12)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_24E27ED1C();
    swift_allocError();
    long long v20 = xmmword_24E28E310;
LABEL_8:
    *(_OWORD *)uint64_t v19 = v20;
    char v21 = 3;
LABEL_21:
    *(unsigned char *)(v19 + 16) = v21;
    swift_willThrow();
LABEL_22:

    return;
  }
  uint64_t v13 = v12;
  uint64_t v44 = v9;
  uint64_t v48 = a3;
  uint64_t v43 = sub_24E28D720();
  uint64_t v15 = v14;

  id v16 = objc_msgSend(a1, sel_dataclassProperties);
  if (!v16)
  {
    long long v46 = 0u;
    long long v47 = 0u;
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24E28056C((uint64_t)&v46);
LABEL_20:
    sub_24E27ED1C();
    swift_allocError();
    *(void *)uint64_t v19 = 0xD000000000000021;
    *(void *)(v19 + 8) = 0x800000024E28F5E0;
    char v21 = 1;
    goto LABEL_21;
  }
  uint64_t v17 = v16;
  *(void *)&v45[0] = 0xD000000000000021;
  *((void *)&v45[0] + 1) = 0x800000024E28F5E0;
  id v18 = objc_msgSend(v16, sel___swift_objectForKeyedSubscript_, sub_24E28DA80());
  swift_unknownObjectRelease();

  if (v18)
  {
    sub_24E28D930();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v45, 0, sizeof(v45));
  }
  sub_24E2805CC((uint64_t)v45, (uint64_t)&v46);
  if (!*((void *)&v47 + 1)) {
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698C8F38);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  uint64_t v22 = *(void *)&v45[0];
  id v23 = objc_msgSend(a1, sel_aa_fmipAccount);
  if (!v23)
  {
LABEL_26:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24E27ED1C();
    swift_allocError();
    long long v20 = xmmword_24E28E300;
    goto LABEL_8;
  }
  uint64_t v24 = v23;
  id v25 = objc_msgSend(a2, sel_credentialForAccount_, v23);
  if (!v25)
  {
    uint64_t v26 = v24;
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v26 = v25;
  id v27 = objc_msgSend(v25, sel_credentialItemForKey_, *MEMORY[0x263EFB0A8]);
  if (!v27)
  {

    goto LABEL_25;
  }
  uint64_t v28 = v27;
  uint64_t v42 = v26;
  uint64_t v41 = sub_24E28D720();
  uint64_t v30 = v29;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v31 = objc_msgSend(a1, sel_aa_authToken);
  if (v31)
  {
    uint64_t v38 = v30;
    uint64_t v40 = sub_24E28D720();
    uint64_t v33 = v32;

    id v31 = v33;
    uint64_t v30 = v38;
  }
  else
  {
    uint64_t v40 = 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_24E27EC04(v22, 0x6E74736F48707061, 0xEB00000000656D61);
  if (v3)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    goto LABEL_22;
  }
  uint64_t v39 = v34;
  uint64_t v36 = v35;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  uint64_t v37 = v48;
  *uint64_t v48 = v43;
  v37[1] = v15;
  v37[2] = v44;
  v37[3] = v11;
  v37[4] = v40;
  v37[5] = (uint64_t)v31;
  v37[6] = v41;
  v37[7] = v30;
  v37[8] = v39;
  v37[9] = v36;
}

uint64_t FMIPAccount.icloudIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMIPAccount.dsid.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMIPAccount.authToken.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMIPAccount.appToken.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMIPAccount.appHostName.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t initializeBufferWithCopyOfBuffer for Analytics.DiscreteType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FMIPAccount()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for FMIPAccount(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FMIPAccount(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

void *assignWithTake for FMIPAccount(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FMIPAccount(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FMIPAccount(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMIPAccount()
{
  return &type metadata for FMIPAccount;
}

uint64_t sub_24E2829C4()
{
  uint64_t v0 = sub_24E28D690();
  __swift_allocate_value_buffer(v0, qword_26B1B5368);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5368);
  if (qword_26B1B5020 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5380);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_24E282A8C()
{
  uint64_t result = sub_24E28D810();
  qword_26B1B5360 = result;
  return result;
}

void static AnalyticsPublisher.publish(event:)(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for AnyAnalyticsEvent();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (uint64_t *)((char *)&v35 - v7);
  if (MEMORY[0x2533367E0](v6))
  {
    if (qword_26B1B5018 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_24E28D690();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B1B5368);
    os_log_t v36 = (os_log_t)sub_24E28D670();
    os_log_type_t v10 = sub_24E28D860();
    if (os_log_type_enabled(v36, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_24E276000, v36, v10, "AnalyticsPublisher not submitting analytics during unit tests.", v11, 2u);
      MEMORY[0x253337400](v11, -1, -1);
    }
    os_log_t v12 = v36;
  }
  else
  {
    if (qword_26B1B4F80 != -1) {
      swift_once();
    }
    uint64_t v13 = qword_26B1B5360;
    uint64_t v14 = *a1;
    uint64_t v15 = a1[1];
    swift_bridgeObjectRetain();
    LOBYTE(v13) = sub_24E279A48(v14, v15, v13);
    swift_bridgeObjectRelease();
    if (v13)
    {
      if (qword_26B1B5018 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_24E28D690();
      __swift_project_value_buffer(v16, (uint64_t)qword_26B1B5368);
      sub_24E284720((uint64_t)a1, (uint64_t)v5);
      uint64_t v17 = sub_24E28D670();
      os_log_type_t v18 = sub_24E28D820();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        uint64_t v38 = v20;
        *(_DWORD *)uint64_t v19 = 136446210;
        uint64_t v21 = *v5;
        unint64_t v22 = v5[1];
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_24E27B9F4(v21, v22, &v38);
        sub_24E28D8D0();
        swift_bridgeObjectRelease();
        sub_24E284784((uint64_t)v5);
        _os_log_impl(&dword_24E276000, v17, v18, "AnalyticsPublisher not submitting disallowed analytics event %{public}s to CA.", v19, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253337400](v20, -1, -1);
        MEMORY[0x253337400](v19, -1, -1);
      }
      else
      {
        sub_24E284784((uint64_t)v5);
      }
    }
    else
    {
      sub_24E283110(*(uint64_t *)((char *)a1 + *(int *)(v2 + 24)));
      if (qword_26B1B5018 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_24E28D690();
      __swift_project_value_buffer(v23, (uint64_t)qword_26B1B5368);
      sub_24E284720((uint64_t)a1, (uint64_t)v8);
      swift_bridgeObjectRetain_n();
      uint64_t v24 = sub_24E28D670();
      os_log_type_t v25 = sub_24E28D820();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        uint64_t v38 = v27;
        *(_DWORD *)uint64_t v26 = 136446466;
        uint64_t v28 = *v8;
        unint64_t v29 = v8[1];
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_24E27B9F4(v28, v29, &v38);
        sub_24E28D8D0();
        swift_bridgeObjectRelease();
        sub_24E284784((uint64_t)v8);
        *(_WORD *)(v26 + 12) = 2082;
        sub_24E2847E0();
        swift_bridgeObjectRetain();
        uint64_t v30 = sub_24E28D6E0();
        unint64_t v32 = v31;
        swift_bridgeObjectRelease();
        uint64_t v37 = sub_24E27B9F4(v30, v32, &v38);
        sub_24E28D8D0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E276000, v24, v25, "Analytics: %{public}s, %{public}s.", (uint8_t *)v26, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253337400](v27, -1, -1);
        MEMORY[0x253337400](v26, -1, -1);
      }
      else
      {
        sub_24E284784((uint64_t)v8);

        swift_bridgeObjectRelease_n();
      }
      uint64_t v33 = (void *)sub_24E28D710();
      sub_24E2847E0();
      uint64_t v34 = (void *)sub_24E28D6D0();
      swift_bridgeObjectRelease();
      AnalyticsSendEvent();
    }
  }
}

uint64_t sub_24E28308C()
{
  uint64_t v0 = sub_24E28D690();
  __swift_allocate_value_buffer(v0, qword_26B1B5380);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5380);
  return sub_24E28D680();
}

void *sub_24E283110(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v151 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & v4;
  unint64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v159 = v168;
  char v161 = &v171;
  unint64_t v141 = v8 - 1;
  unint64_t v9 = 0;
  int64_t v158 = v8;
  unint64_t v143 = v8 - 5;
  uint64_t v160 = swift_bridgeObjectRetain();
  uint64_t v142 = v160 + 104;
  os_log_type_t v10 = (void *)MEMORY[0x263F8EE80];
  if (!v7) {
    goto LABEL_10;
  }
LABEL_8:
  unint64_t v12 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  unint64_t v13 = v12 | (v9 << 6);
LABEL_9:
  uint64_t v14 = *(void *)(v160 + 56);
  uint64_t v15 = (void *)(*(void *)(v160 + 48) + 16 * v13);
  uint64_t v16 = v15[1];
  *(void *)&long long v167 = *v15;
  *((void *)&v167 + 1) = v16;
  sub_24E27D6F8(v14 + 48 * v13, (uint64_t)v159);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_24E284830((uint64_t)&v167, (uint64_t)&v169);
    uint64_t v20 = v170;
    if (!v170) {
      break;
    }
    uint64_t v21 = v169;
    sub_24E27E608((uint64_t)v161, (uint64_t)&v167);
    switch(BYTE8(v168[1]))
    {
      case 1:
        sub_24E27E918(&v167, (uint64_t)&v164);
        uint64_t v3 = v21;
        uint64_t v49 = __swift_project_boxed_opaque_existential_1(&v164, v165);
        MEMORY[0x270FA5388](v49);
        (*(void (**)(char *))(v51 + 16))((char *)&v135 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0));
        sub_24E28D7A0();
        uint64_t v41 = sub_24E28D710();
        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v162[0] = v10;
        uint64_t v1 = (uint64_t)v10;
        unint64_t v2 = sub_24E27C04C(v21, v20);
        uint64_t v54 = v10[2];
        BOOL v55 = (v53 & 1) == 0;
        uint64_t v56 = v54 + v55;
        if (__OFADD__(v54, v55)) {
          goto LABEL_122;
        }
        uint64_t v3 = v53;
        if (v10[3] >= v56)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            uint64_t v1 = (uint64_t)v162;
            sub_24E27D544();
          }
        }
        else
        {
          sub_24E27C8EC(v56, isUniquelyReferenced_nonNull_native);
          uint64_t v1 = v162[0];
          unint64_t v57 = sub_24E27C04C(v21, v20);
          if ((v3 & 1) != (v58 & 1)) {
            goto LABEL_133;
          }
          unint64_t v2 = v57;
        }
        os_log_type_t v10 = (void *)v162[0];
        if (v3)
        {
LABEL_5:
          uint64_t v11 = v10[7];
          uint64_t v1 = 8 * v2;

          *(void *)(v11 + 8 * v2) = v41;
        }
        else
        {
          *(void *)(v162[0] + 8 * (v2 >> 6) + 64) |= 1 << v2;
          uint64_t v82 = (uint64_t *)(v10[6] + 16 * v2);
          *uint64_t v82 = v21;
          v82[1] = v20;
          *(void *)(v10[7] + 8 * v2) = v41;
          uint64_t v83 = v10[2];
          BOOL v79 = __OFADD__(v83, 1);
          uint64_t v80 = v83 + 1;
          if (v79) {
            goto LABEL_126;
          }
LABEL_55:
          v10[2] = v80;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_7;
      case 2:
        unint64_t v157 = v9;
        sub_24E27E918(&v167, (uint64_t)&v164);
        sub_24E284898((uint64_t)&v164, (uint64_t)v162);
        __swift_instantiateConcreteTypeFromMangledName(qword_26B1B4F90);
        if (swift_dynamicCast())
        {
          uint64_t v30 = sub_24E28DB50();
          char v31 = swift_isUniquelyReferenced_nonNull_native();
          v162[0] = v10;
          uint64_t v1 = (uint64_t)v10;
          unint64_t v2 = sub_24E27C04C(v21, v20);
          uint64_t v33 = v10[2];
          BOOL v34 = (v32 & 1) == 0;
          uint64_t v35 = v33 + v34;
          if (__OFADD__(v33, v34)) {
            goto LABEL_123;
          }
          uint64_t v3 = v32;
          if (v10[3] >= v35)
          {
            if ((v31 & 1) == 0)
            {
              uint64_t v1 = (uint64_t)v162;
              sub_24E27D544();
            }
          }
          else
          {
            sub_24E27C8EC(v35, v31);
            uint64_t v1 = v162[0];
            unint64_t v36 = sub_24E27C04C(v21, v20);
            if ((v3 & 1) != (v37 & 1)) {
              goto LABEL_133;
            }
            unint64_t v2 = v36;
          }
          os_log_type_t v10 = (void *)v162[0];
          if (v3) {
            goto LABEL_108;
          }
          *(void *)(v162[0] + 8 * (v2 >> 6) + 64) |= 1 << v2;
          v87 = (uint64_t *)(v10[6] + 16 * v2);
          uint64_t *v87 = v21;
          v87[1] = v20;
          *(void *)(v10[7] + 8 * v2) = v30;
          uint64_t v88 = v10[2];
          BOOL v79 = __OFADD__(v88, 1);
          uint64_t v89 = v88 + 1;
          if (v79) {
            goto LABEL_129;
          }
          goto LABEL_110;
        }
        char v148 = (char **)v20;
        unint64_t v150 = v7;
        uint64_t v147 = v21;
        uint64_t v3 = v165;
        uint64_t v59 = v166;
        id v60 = __swift_project_boxed_opaque_existential_1(&v164, v165);
        unint64_t v146 = &v135;
        uint64_t v61 = *(void **)(v3 - 8);
        uint64_t v62 = v61[8];
        MEMORY[0x270FA5388](v60);
        unint64_t v63 = (v62 + 15) & 0xFFFFFFFFFFFFFFF0;
        char v64 = (char **)v61[2];
        ((void (*)(char *))v64)((char *)&v135 - v63);
        uint64_t v149 = v59;
        uint64_t v65 = sub_24E28D920();
        LOBYTE(v59) = v65;
        long long v145 = &v135;
        uint64_t v155 = v62;
        MEMORY[0x270FA5388](v65);
        uint64_t v66 = (char *)&v135 - v63;
        unsigned __int8 v156 = (char *)&v135 - v63;
        v152 = (char **)(v61 + 2);
        long long v154 = v64;
        ((void (*)(char *, char *, uint64_t))v64)((char *)&v135 - v63, (char *)&v135 - v63, v3);
        long long v153 = v61;
        if ((v59 & 1) == 0)
        {
          unint64_t v2 = v61[1];
          ((void (*)(char *, uint64_t))v2)((char *)&v135 - v63, v3);
LABEL_64:
          unint64_t v7 = v150;
          uint64_t v75 = (uint64_t)v148;
          goto LABEL_88;
        }
        uint64_t v67 = v149;
        uint64_t v68 = sub_24E28D910();
        uint64_t v70 = (uint64_t (*)(char *, uint64_t))v61[1];
        v69 = (char **)(v61 + 1);
        unint64_t v2 = (unint64_t)v70;
        uint64_t v71 = v70(v66, v3);
        if (v68 <= 64) {
          goto LABEL_64;
        }
        MEMORY[0x270FA5388](v71);
        v73 = (char *)&v135 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
        ((void (*)(char *, char *, uint64_t))v154)(v73, v156, v3);
        v162[0] = 0x8000000000000000;
        char v74 = sub_24E28D920();
        unint64_t v7 = v150;
        uint64_t v75 = (uint64_t)v148;
        if (v74)
        {
          uint64_t v76 = sub_24E28D910();
          if (v76 >= 64)
          {
            uint64_t v144 = v69;
            v140 = &v135;
            MEMORY[0x270FA5388](v76);
            v97 = v73;
            uint64_t v98 = (char *)&v135 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
            sub_24E27E788();
            sub_24E28D8F0();
            uint64_t v1 = sub_24E28D700();
            ((void (*)(char *, uint64_t))v2)(v98, v3);
            ((void (*)(char *, uint64_t))v2)(v97, v3);
            if (v1) {
              goto LABEL_131;
            }
          }
          else
          {
            uint64_t v1 = sub_24E28D900();
            ((void (*)(char *, uint64_t))v2)(v73, v3);
            if (v1 < v162[0]) {
              goto LABEL_131;
            }
          }
        }
        else
        {
          v140 = &v135;
          uint64_t v90 = v73;
          char v91 = sub_24E28D920();
          v92 = v90;
          uint64_t v93 = sub_24E28D910();
          if (v91)
          {
            uint64_t v144 = v69;
            if (v93 > 64)
            {
              v139 = &v135;
              MEMORY[0x270FA5388](v93);
              unint64_t v95 = (char *)&v135 - ((v94 + 15) & 0xFFFFFFFFFFFFFFF0);
              sub_24E27E788();
              sub_24E28D8F0();
              uint64_t v1 = sub_24E28D700();
              ((void (*)(char *, uint64_t))v2)(v95, v3);
              ((void (*)(char *, uint64_t))v2)(v92, v3);
              if (v1) {
                goto LABEL_131;
              }
              goto LABEL_88;
            }
            uint64_t v136 = *(void *)(*(void *)(v67 + 24) + 16);
            uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
            v139 = &v135;
            MEMORY[0x270FA5388](AssociatedTypeWitness);
            swift_getAssociatedConformanceWitness();
            uint64_t v101 = sub_24E28DA70();
            uint64_t v137 = &v135;
            uint64_t v102 = v155;
            MEMORY[0x270FA5388](v101);
            int64_t v138 = (v102 + 15) & 0xFFFFFFFFFFFFFFF0;
            unint64_t v103 = (char *)&v135 - v138;
            sub_24E28DA50();
            int64_t v135 = v90;
            LODWORD(v136) = sub_24E28D700();
            uint64_t v104 = ((uint64_t (*)(char *, uint64_t))v2)(v103, v3);
            v139 = &v135;
            MEMORY[0x270FA5388](v104);
            uint64_t v1 = (uint64_t)&v135 - v138;
            ((void (*)(char *, char *, uint64_t))v153[4])((char *)&v135 - v138, v135, v3);
            if (v136) {
              goto LABEL_132;
            }
            int64_t v138 = v162[0];
            uint64_t v105 = sub_24E28D900();
            ((void (*)(uint64_t, uint64_t))v2)(v1, v3);
            BOOL v99 = v105 < v138;
          }
          else
          {
            if (v93 >= 64)
            {
              ((void (*)(char *, uint64_t))v2)(v90, v3);
              goto LABEL_88;
            }
            uint64_t v1 = sub_24E28D900();
            ((void (*)(char *, uint64_t))v2)(v92, v3);
            BOOL v99 = v1 < v162[0];
          }
          if (v99) {
            goto LABEL_131;
          }
        }
LABEL_88:
        BOOL v106 = v156;
        uint64_t v107 = sub_24E28D910();
        char v148 = &v135;
        MEMORY[0x270FA5388](v107);
        char v109 = (char *)&v135 - ((v108 + 15) & 0xFFFFFFFFFFFFFFF0);
        ((void (*)(char *, char *, uint64_t))v154)(v109, v106, v3);
        if (v107 < 65)
        {
          uint64_t v117 = sub_24E28D910();
          ((void (*)(char *, uint64_t))v2)(v109, v3);
          if (v117 != 64) {
            goto LABEL_101;
          }
          uint64_t v110 = sub_24E28D920();
          if (v110) {
            goto LABEL_101;
          }
        }
        else
        {
          uint64_t v110 = ((uint64_t (*)(char *, uint64_t))v2)(v109, v3);
        }
        uint64_t v144 = &v135;
        MEMORY[0x270FA5388](v110);
        uint64_t v112 = (char *)&v135 - ((v111 + 15) & 0xFFFFFFFFFFFFFFF0);
        ((void (*)(char *, char *, uint64_t))v154)(v112, v156, v3);
        v162[0] = 0x7FFFFFFFFFFFFFFFLL;
        char v113 = sub_24E28D920();
        uint64_t v114 = sub_24E28D910();
        if (v113)
        {
          if (v114 > 64)
          {
            long long v154 = &v135;
            MEMORY[0x270FA5388](v114);
            int v116 = (char *)&v135 - ((v115 + 15) & 0xFFFFFFFFFFFFFFF0);
            sub_24E27E788();
            sub_24E28D8F0();
            uint64_t v1 = sub_24E28D700();
            ((void (*)(char *, uint64_t))v2)(v116, v3);
            ((void (*)(char *, uint64_t))v2)(v112, v3);
            if (v1) {
              goto LABEL_128;
            }
            goto LABEL_101;
          }
LABEL_98:
          uint64_t v1 = (uint64_t)v112;
          uint64_t v118 = sub_24E28D900();
          ((void (*)(char *, uint64_t))v2)(v112, v3);
          if (v162[0] < v118) {
            goto LABEL_128;
          }
          goto LABEL_101;
        }
        if (v114 <= 63) {
          goto LABEL_98;
        }
        long long v154 = &v135;
        uint64_t v163 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v119 = v155;
        MEMORY[0x270FA5388](v114);
        v120 = (char *)&v135 - ((v119 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v121 = ((uint64_t (*)(char *, char *, uint64_t))v153[4])(v120, v112, v3);
        v152 = &v135;
        unint64_t v7 = v150;
        MEMORY[0x270FA5388](v121);
        sub_24E27E788();
        sub_24E28D8F0();
        uint64_t v1 = sub_24E28D700();
        ((void (*)(char *, uint64_t))v2)(v120, v3);
        ((void (*)(char *, uint64_t))v2)(v120, v3);
        if (v1) {
          goto LABEL_128;
        }
LABEL_101:
        int64_t v122 = v156;
        sub_24E28D900();
        ((void (*)(char *, uint64_t))v2)(v122, v3);
        uint64_t v30 = sub_24E28DB00();
        char v123 = swift_isUniquelyReferenced_nonNull_native();
        v162[0] = v10;
        uint64_t v124 = v147;
        uint64_t v1 = (uint64_t)v10;
        unint64_t v2 = sub_24E27C04C(v147, v75);
        uint64_t v126 = v10[2];
        BOOL v127 = (v125 & 1) == 0;
        uint64_t v128 = v126 + v127;
        if (__OFADD__(v126, v127)) {
          goto LABEL_124;
        }
        uint64_t v3 = v125;
        if (v10[3] >= v128)
        {
          if ((v123 & 1) == 0)
          {
            uint64_t v1 = (uint64_t)v162;
            sub_24E27D544();
          }
        }
        else
        {
          sub_24E27C8EC(v128, v123);
          uint64_t v1 = v162[0];
          unint64_t v129 = sub_24E27C04C(v124, v75);
          if ((v3 & 1) != (v130 & 1)) {
            goto LABEL_133;
          }
          unint64_t v2 = v129;
        }
        os_log_type_t v10 = (void *)v162[0];
        if (v3)
        {
LABEL_108:
          uint64_t v131 = v10[7];
          uint64_t v1 = 8 * v2;

          *(void *)(v131 + 8 * v2) = v30;
          goto LABEL_111;
        }
        *(void *)(v162[0] + 8 * (v2 >> 6) + 64) |= 1 << v2;
        v132 = (uint64_t *)(v10[6] + 16 * v2);
        uint64_t *v132 = v124;
        v132[1] = v75;
        *(void *)(v10[7] + 8 * v2) = v30;
        uint64_t v133 = v10[2];
        BOOL v79 = __OFADD__(v133, 1);
        uint64_t v89 = v133 + 1;
        if (v79) {
          goto LABEL_130;
        }
LABEL_110:
        v10[2] = v89;
        swift_bridgeObjectRetain();
LABEL_111:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v9 = v157;
LABEL_7:
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v164);
        if (v7) {
          goto LABEL_8;
        }
LABEL_10:
        int64_t v17 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          ((void (*)(uint64_t, uint64_t))v2)(v1, v3);
          __break(1u);
LABEL_133:
          sub_24E28DA90();
          __break(1u);
          JUMPOUT(0x24E284710);
        }
        if (v17 >= v158)
        {
          unint64_t v19 = v9;
        }
        else
        {
          unint64_t v18 = *(void *)(v151 + 8 * v17);
          if (v18) {
            goto LABEL_13;
          }
          unint64_t v19 = v9 + 1;
          if ((uint64_t)(v9 + 2) < v158)
          {
            unint64_t v18 = *(void *)(v151 + 8 * (v9 + 2));
            if (v18)
            {
              int64_t v17 = v9 + 2;
LABEL_13:
              unint64_t v7 = (v18 - 1) & v18;
              unint64_t v13 = __clz(__rbit64(v18)) + (v17 << 6);
              unint64_t v9 = v17;
              goto LABEL_9;
            }
            unint64_t v19 = v9 + 2;
            if ((uint64_t)(v9 + 3) < v158)
            {
              unint64_t v18 = *(void *)(v151 + 8 * (v9 + 3));
              if (v18)
              {
                int64_t v17 = v9 + 3;
                goto LABEL_13;
              }
              int64_t v17 = v9 + 4;
              unint64_t v19 = v9 + 3;
              if ((uint64_t)(v9 + 4) < v158)
              {
                unint64_t v18 = *(void *)(v151 + 8 * v17);
                if (v18) {
                  goto LABEL_13;
                }
                while (v143 != v9)
                {
                  unint64_t v18 = *(void *)(v142 + 8 * v9++);
                  if (v18)
                  {
                    int64_t v17 = v9 + 4;
                    goto LABEL_13;
                  }
                }
                unint64_t v19 = v141;
              }
            }
          }
        }
        unint64_t v7 = 0;
        memset(v168, 0, 41);
        unint64_t v9 = v19;
        long long v167 = 0u;
        break;
      case 3:
        sub_24E27E918(&v167, (uint64_t)&v164);
        uint64_t v3 = v21;
        uint64_t v38 = __swift_project_boxed_opaque_existential_1(&v164, v165);
        MEMORY[0x270FA5388](v38);
        (*(void (**)(char *))(v40 + 16))((char *)&v135 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
        sub_24E27E558();
        sub_24E28D6C0();
        uint64_t v41 = sub_24E28D800();
        char v42 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v163 = (uint64_t)v10;
        uint64_t v1 = (uint64_t)v10;
        unint64_t v2 = sub_24E27C04C(v21, v20);
        uint64_t v44 = v10[2];
        BOOL v45 = (v43 & 1) == 0;
        uint64_t v46 = v44 + v45;
        if (__OFADD__(v44, v45)) {
          goto LABEL_121;
        }
        uint64_t v3 = v43;
        if (v10[3] >= v46)
        {
          if ((v42 & 1) == 0)
          {
            uint64_t v1 = (uint64_t)&v163;
            sub_24E27D544();
          }
        }
        else
        {
          sub_24E27C8EC(v46, v42);
          uint64_t v1 = v163;
          unint64_t v47 = sub_24E27C04C(v21, v20);
          if ((v3 & 1) != (v48 & 1)) {
            goto LABEL_133;
          }
          unint64_t v2 = v47;
        }
        os_log_type_t v10 = (void *)v163;
        if (v3) {
          goto LABEL_5;
        }
        *(void *)(v163 + 8 * (v2 >> 6) + 64) |= 1 << v2;
        uint64_t v77 = (uint64_t *)(v10[6] + 16 * v2);
        *uint64_t v77 = v21;
        v77[1] = v20;
        *(void *)(v10[7] + 8 * v2) = v41;
        uint64_t v78 = v10[2];
        BOOL v79 = __OFADD__(v78, 1);
        uint64_t v80 = v78 + 1;
        if (!v79) {
          goto LABEL_55;
        }
        goto LABEL_125;
      default:
        uint64_t v22 = sub_24E28D7C0();
        char v23 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v164 = v10;
        uint64_t v1 = (uint64_t)v10;
        unint64_t v2 = sub_24E27C04C(v21, v20);
        uint64_t v25 = v10[2];
        BOOL v26 = (v24 & 1) == 0;
        uint64_t v27 = v25 + v26;
        if (__OFADD__(v25, v26)) {
          goto LABEL_120;
        }
        uint64_t v3 = v24;
        if (v10[3] >= v27)
        {
          if ((v23 & 1) == 0)
          {
            uint64_t v1 = (uint64_t)&v164;
            sub_24E27D544();
          }
        }
        else
        {
          sub_24E27C8EC(v27, v23);
          uint64_t v1 = (uint64_t)v164;
          unint64_t v28 = sub_24E27C04C(v21, v20);
          if ((v3 & 1) != (v29 & 1)) {
            goto LABEL_133;
          }
          unint64_t v2 = v28;
        }
        os_log_type_t v10 = v164;
        if (v3)
        {
          uint64_t v81 = v164[7];
          uint64_t v1 = 8 * v2;

          *(void *)(v81 + 8 * v2) = v22;
        }
        else
        {
          v164[(v2 >> 6) + 8] |= 1 << v2;
          v84 = (uint64_t *)(v10[6] + 16 * v2);
          uint64_t *v84 = v21;
          v84[1] = v20;
          *(void *)(v10[7] + 8 * v2) = v22;
          uint64_t v85 = v10[2];
          BOOL v79 = __OFADD__(v85, 1);
          uint64_t v86 = v85 + 1;
          if (v79) {
            goto LABEL_127;
          }
          v10[2] = v86;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (!v7) {
          goto LABEL_10;
        }
        goto LABEL_8;
    }
  }
  swift_release();
  return v10;
}

uint64_t sub_24E284720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AnyAnalyticsEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E284784(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AnyAnalyticsEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24E2847E0()
{
  unint64_t result = qword_26B1B5048;
  if (!qword_26B1B5048)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1B5048);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsPublisher()
{
  return &type metadata for AnalyticsPublisher;
}

uint64_t sub_24E284830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5038);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E284898(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t StateCaptureHint.version.getter()
{
  return *v0;
}

{
  unsigned int *v0;

  return *v0;
}

uint64_t StateCaptureHint.requestor.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

{
  uint64_t v0;
  uint64_t v1;

  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

void StateCaptureHint.api.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

{
  uint64_t v1;

  *a1 = *(unsigned char *)(v1 + 24);
}

void StateCaptureHint.reason.getter(_DWORD *a1@<X8>)
{
  *a1 = *(_DWORD *)(v1 + 28);
}

{
  uint64_t v1;

  *a1 = *(_DWORD *)(v1 + 28);
}

uint64_t StateCaptureHint.description.getter()
{
  return 0x6E6F69737265765BLL;
}

{
  sub_24E28D970();
  swift_bridgeObjectRelease();
  sub_24E28DA40();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  StateCaptureReason.description.getter();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  return 0x6E6F69737265765BLL;
}

uint64_t StateCaptureHint.init(version:requestor:api:reason:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, int *a5@<X4>, uint64_t a6@<X8>)
{
  char v6 = *a4;
  int v7 = *a5;
  *(_DWORD *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(unsigned char *)(a6 + 24) = v6;
  *(_DWORD *)(a6 + 28) = v7;
  return result;
}

{
  char v6;
  int v7;

  char v6 = *a4;
  int v7 = *a5;
  *(_DWORD *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(unsigned char *)(a6 + 24) = v6;
  *(_DWORD *)(a6 + 28) = v7;
  return result;
}

uint64_t StateCaptureHintAPI.description.getter()
{
  uint64_t v1 = 0x746C7561662ELL;
  if (*v0 != 1) {
    uint64_t v1 = 0x747365757165722ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x726F7272652ELL;
  }
}

{
  unsigned char *v0;
  uint64_t v1;

  uint64_t v1 = 0x746C7561662ELL;
  if (*v0 != 1) {
    uint64_t v1 = 0x747365757165722ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x726F7272652ELL;
  }
}

FindMyCommon::StateCaptureHintAPI_optional __swiftcall StateCaptureHintAPI.init(rawValue:)(Swift::UInt32 rawValue)
{
  unsigned int v2 = 0x2010003u >> (8 * rawValue);
  if (rawValue >= 4) {
    LOBYTE(v2) = 3;
  }
  *uint64_t v1 = v2;
  return (FindMyCommon::StateCaptureHintAPI_optional)rawValue;
}

uint64_t StateCaptureHintAPI.rawValue.getter()
{
  return *v0 + 1;
}

{
  unsigned __int8 *v0;

  return *v0 + 1;
}

BOOL sub_24E284B5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24E284B70()
{
  return sub_24E28DB40();
}

uint64_t sub_24E284BB8()
{
  return sub_24E28DB30();
}

uint64_t sub_24E284BE8()
{
  return sub_24E28DB40();
}

FindMyCommon::StateCaptureHintAPI_optional sub_24E284C2C(Swift::UInt32 *a1)
{
  return StateCaptureHintAPI.init(rawValue:)(*a1);
}

void sub_24E284C34(_DWORD *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t sub_24E284C44()
{
  uint64_t v1 = 0x746C7561662ELL;
  if (*v0 != 1) {
    uint64_t v1 = 0x747365757165722ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x726F7272652ELL;
  }
}

uint64_t StateCaptureReason.rawValue.getter()
{
  return *v0;
}

{
  unsigned int *v0;

  return *v0;
}

uint64_t StateCaptureReason.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

{
  *a2 = result;
  return result;
}

void static StateCaptureReason.general.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

{
  *a1 = 1;
}

void static StateCaptureReason.networking.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

{
  *a1 = 2;
}

void static StateCaptureReason.cellular.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

{
  *a1 = 4;
}

void static StateCaptureReason.authentication.getter(_DWORD *a1@<X8>)
{
  *a1 = 8;
}

{
  *a1 = 8;
}

void sub_24E284CD8()
{
  int v0 = unk_270038E94;
  if ((unk_270038E94 & ~dword_270038E90) == 0) {
    int v0 = 0;
  }
  int v1 = v0 | dword_270038E90;
  int v3 = dword_270038E98;
  int v2 = unk_270038E9C;
  if ((dword_270038E98 & ~v1) == 0) {
    int v3 = 0;
  }
  int v4 = v3 | v1;
  if ((unk_270038E9C & ~v4) == 0) {
    int v2 = 0;
  }
  dword_2698C8F80 = v2 | v4;
}

uint64_t sub_24E284D18@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = (int *)(a1 + 32);
    do
    {
      int v7 = *v5++;
      int v6 = v7;
      if ((v7 & ~v4) == 0) {
        int v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    int v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t static StateCaptureReason.all.getter@<X0>(_DWORD *a1@<X8>)
{
  if (qword_2698C8EE0 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = dword_2698C8F80;
  return result;
}

{
  uint64_t result;

  if (qword_2698C9010 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = dword_2698C9028;
  return result;
}

uint64_t StateCaptureReason.description.getter()
{
  int v1 = *v0;
  if ((*v0 & 1) == 0)
  {
    int v2 = (void *)MEMORY[0x263F8EE78];
    if ((v1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  int v2 = sub_24E2855A8(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    int v2 = sub_24E2855A8((void *)(v3 > 1), v4 + 1, 1, v2);
  }
  v2[2] = v4 + 1;
  uint64_t v5 = &v2[2 * v4];
  v5[4] = 0x6C6172656E65672ELL;
  v5[5] = 0xE800000000000000;
  if ((v1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v2 = sub_24E2855A8(0, v2[2] + 1, 1, v2);
    }
    unint64_t v7 = v2[2];
    unint64_t v6 = v2[3];
    if (v7 >= v6 >> 1) {
      int v2 = sub_24E2855A8((void *)(v6 > 1), v7 + 1, 1, v2);
    }
    v2[2] = v7 + 1;
    unint64_t v8 = &v2[2 * v7];
    v8[4] = 0x6B726F7774656E2ELL;
    v8[5] = 0xEB00000000676E69;
  }
LABEL_12:
  if ((v1 & 4) == 0)
  {
    if ((v1 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int v2 = sub_24E2855A8(0, v2[2] + 1, 1, v2);
  }
  unint64_t v10 = v2[2];
  unint64_t v9 = v2[3];
  if (v10 >= v9 >> 1) {
    int v2 = sub_24E2855A8((void *)(v9 > 1), v10 + 1, 1, v2);
  }
  v2[2] = v10 + 1;
  uint64_t v11 = &v2[2 * v10];
  v11[4] = 0x616C756C6C65632ELL;
  v11[5] = 0xE900000000000072;
  if ((v1 & 8) != 0)
  {
LABEL_20:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v2 = sub_24E2855A8(0, v2[2] + 1, 1, v2);
    }
    unint64_t v13 = v2[2];
    unint64_t v12 = v2[3];
    if (v13 >= v12 >> 1) {
      int v2 = sub_24E2855A8((void *)(v12 > 1), v13 + 1, 1, v2);
    }
    v2[2] = v13 + 1;
    uint64_t v14 = &v2[2 * v13];
    v14[4] = 0x746E65687475612ELL;
    v14[5] = 0xEF6E6F6974616369;
  }
LABEL_25:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B4E78);
  sub_24E285260();
  sub_24E28D6F0();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  return 91;
}

{
  int *v0;
  int v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;

  int v1 = *v0;
  if ((*v0 & 1) == 0)
  {
    int v2 = (void *)MEMORY[0x263F8EE78];
    if ((v1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  int v2 = sub_24E2855A8(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    int v2 = sub_24E2855A8((void *)(v3 > 1), v4 + 1, 1, v2);
  }
  v2[2] = v4 + 1;
  uint64_t v5 = &v2[2 * v4];
  v5[4] = 0x6C6172656E65672ELL;
  v5[5] = 0xE800000000000000;
  if ((v1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v2 = sub_24E2855A8(0, v2[2] + 1, 1, v2);
    }
    unint64_t v7 = v2[2];
    unint64_t v6 = v2[3];
    if (v7 >= v6 >> 1) {
      int v2 = sub_24E2855A8((void *)(v6 > 1), v7 + 1, 1, v2);
    }
    v2[2] = v7 + 1;
    unint64_t v8 = &v2[2 * v7];
    v8[4] = 0x6B726F7774656E2ELL;
    v8[5] = 0xEB00000000676E69;
  }
LABEL_12:
  if ((v1 & 4) == 0)
  {
    if ((v1 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int v2 = sub_24E2855A8(0, v2[2] + 1, 1, v2);
  }
  unint64_t v10 = v2[2];
  unint64_t v9 = v2[3];
  if (v10 >= v9 >> 1) {
    int v2 = sub_24E2855A8((void *)(v9 > 1), v10 + 1, 1, v2);
  }
  v2[2] = v10 + 1;
  uint64_t v11 = &v2[2 * v10];
  v11[4] = 0x616C756C6C65632ELL;
  v11[5] = 0xE900000000000072;
  if ((v1 & 8) != 0)
  {
LABEL_20:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v2 = sub_24E2855A8(0, v2[2] + 1, 1, v2);
    }
    unint64_t v13 = v2[2];
    unint64_t v12 = v2[3];
    if (v13 >= v12 >> 1) {
      int v2 = sub_24E2855A8((void *)(v12 > 1), v13 + 1, 1, v2);
    }
    v2[2] = v13 + 1;
    uint64_t v14 = &v2[2 * v13];
    v14[4] = 0x746E65687475612ELL;
    v14[5] = 0xEF6E6F6974616369;
  }
LABEL_25:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B4E78);
  sub_24E285260();
  sub_24E28D6F0();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  return 91;
}

_DWORD *sub_24E285094@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_24E2850A4(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_24E2850AC@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

_DWORD *sub_24E2850C0@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

_DWORD *sub_24E2850D4@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_24E2850E8(_DWORD *a1, int *a2)
{
  int v3 = *a2;
  int v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

_DWORD *sub_24E285118@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v3 == 0;
  return result;
}

int *sub_24E285144@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = *v2;
  *v2 |= *result;
  int v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *sub_24E285168(_DWORD *result)
{
  *v1 |= *result;
  return result;
}

_DWORD *sub_24E28517C(_DWORD *result)
{
  *v1 &= *result;
  return result;
}

_DWORD *sub_24E285190(_DWORD *result)
{
  *v1 ^= *result;
  return result;
}

_DWORD *sub_24E2851A4@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_24E2851B8(_DWORD *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_24E2851CC(_DWORD *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_24E2851E0(_DWORD *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_24E2851F4()
{
  return *v0 == 0;
}

uint64_t sub_24E285204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

_DWORD *sub_24E28521C(_DWORD *result)
{
  *v1 &= ~*result;
  return result;
}

_DWORD *sub_24E285230@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_24E285240(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_24E28524C(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24E285260()
{
  unint64_t result = qword_26B1B4E80;
  if (!qword_26B1B4E80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1B4E78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B4E80);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t StateCaptureStateData.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

{
  uint64_t v0;
  uint64_t v1;

  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StateCaptureStateData.data.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_24E2856B8(v1, *(void *)(v0 + 24));
  return v1;
}

{
  uint64_t v0;
  uint64_t v1;

  uint64_t v1 = *(void *)(v0 + 24);
  sub_24E2856B8(v1, *(void *)(v0 + 32));
  return v1;
}

void StateCaptureStateData.init(type:title:data:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
}

unint64_t StateCaptureStateData.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = *(void *)(v0 + 24);
  sub_24E28D970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  sub_24E2856B8(v1, v2);
  sub_24E28D5D0();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E285710(v1, v2);
  sub_24E28D760();
  return 0xD00000000000001ALL;
}

uint64_t StateCaptureDateType.description.getter()
{
  return 0x696C61697265732ELL;
}

{
  unsigned char *v0;
  uint64_t v1;

  uint64_t v1 = 0x75626F746F72702ELL;
  if (*v0 != 1) {
    uint64_t v1 = 0x6D6F747375632ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696C61697265732ELL;
  }
}

uint64_t StateCaptureDateType.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 1;
  return result;
}

uint64_t StateCaptureDateType.rawValue.getter()
{
  return 1;
}

uint64_t sub_24E2854B4()
{
  return 1;
}

uint64_t sub_24E2854BC()
{
  return sub_24E28DB40();
}

uint64_t sub_24E285500()
{
  return sub_24E28DB30();
}

uint64_t sub_24E285528()
{
  return sub_24E28DB40();
}

_DWORD *sub_24E285568@<X0>(_DWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 1;
  return result;
}

void sub_24E28557C(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24E285588()
{
  return 0x696C61697265732ELL;
}

void *sub_24E2855A8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B4EB0);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24E286014(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E2856B8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24E285710(uint64_t a1, unint64_t a2)
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

unint64_t sub_24E28576C()
{
  unint64_t result = qword_2698C8F88;
  if (!qword_2698C8F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8F88);
  }
  return result;
}

unint64_t sub_24E2857C4()
{
  unint64_t result = qword_2698C8F90;
  if (!qword_2698C8F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8F90);
  }
  return result;
}

unint64_t sub_24E28581C()
{
  unint64_t result = qword_2698C8F98;
  if (!qword_2698C8F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8F98);
  }
  return result;
}

unint64_t sub_24E285874()
{
  unint64_t result = qword_2698C8FA0;
  if (!qword_2698C8FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8FA0);
  }
  return result;
}

unint64_t sub_24E2858CC()
{
  unint64_t result = qword_2698C8FA8;
  if (!qword_2698C8FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8FA8);
  }
  return result;
}

unint64_t sub_24E285924()
{
  unint64_t result = qword_2698C8FB0;
  if (!qword_2698C8FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8FB0);
  }
  return result;
}

uint64_t destroy for StateCaptureHint()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StateCaptureHint(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StateCaptureHint(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for StateCaptureHint(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  return a1;
}

uint64_t getEnumTagSinglePayload for StateCaptureHint(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StateCaptureHint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StateCaptureHint()
{
  return &type metadata for StateCaptureHint;
}

{
  return &type metadata for StateCaptureHint;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StateCaptureHintAPI(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StateCaptureHintAPI(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x24E285CB8);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_24E285CE0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24E285CE8(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StateCaptureHintAPI()
{
  return &type metadata for StateCaptureHintAPI;
}

{
  return &type metadata for StateCaptureHintAPI;
}

ValueMetadata *type metadata accessor for StateCaptureReason()
{
  return &type metadata for StateCaptureReason;
}

{
  return &type metadata for StateCaptureReason;
}

uint64_t destroy for StateCaptureStateData(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  return sub_24E285710(v2, v3);
}

{
  uint64_t v2;
  unint64_t v3;
  uint64_t vars8;

  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 24);
  unint64_t v3 = *(void *)(a1 + 32);
  return sub_24E285710(v2, v3);
}

void *initializeWithCopy for StateCaptureStateData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_24E2856B8(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

void *assignWithCopy for StateCaptureStateData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[2];
  unint64_t v4 = a2[3];
  sub_24E2856B8(v5, v4);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_24E285710(v6, v7);
  return a1;
}

void *assignWithTake for StateCaptureStateData(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a1[2];
  unint64_t v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_24E285710(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for StateCaptureStateData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

{
  unint64_t v2;

  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StateCaptureStateData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StateCaptureStateData()
{
  return &type metadata for StateCaptureStateData;
}

{
  return &type metadata for StateCaptureStateData;
}

uint64_t getEnumTagSinglePayload for StateCaptureDateType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for StateCaptureDateType(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E285FD4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24E285FFC()
{
  return 0;
}

ValueMetadata *type metadata accessor for StateCaptureDateType()
{
  return &type metadata for StateCaptureDateType;
}

{
  return &type metadata for StateCaptureDateType;
}

uint64_t sub_24E286014(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24E28DA30();
  __break(1u);
  return result;
}

uint64_t sub_24E286110()
{
  uint64_t v0 = sub_24E28D690();
  __swift_allocate_value_buffer(v0, qword_26B1B4E28);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B4E28);
  if (qword_26B1B4E60 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B4E48);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t StateCapture.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_id;
  uint64_t v4 = sub_24E28D660();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t *StateCapture.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  return StateCapture.init(_:)(a1, a2);
}

uint64_t *StateCapture.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v69 = a2;
  uint64_t v66 = a1;
  uint64_t v71 = *v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B4E68);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v65 = (uint64_t)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v64 = type metadata accessor for StateCaptureHandle();
  Description = (void (**)(char *, ValueMetadata *))v64[-1].Description;
  MEMORY[0x270FA5388](v64);
  uint64_t v67 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_24E28D660();
  uint64_t v63 = *(void *)(v73 - 8);
  uint64_t v7 = *(void *)(v63 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v73);
  id v60 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v62 = (char *)&v58 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v58 - v11;
  uint64_t v13 = sub_24E28D870();
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = sub_24E28D6B0();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v15 = sub_24E28D880();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  unint64_t v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = OBJC_IVAR____TtC12FindMyCommon12StateCapture_queue;
  uint64_t v70 = OBJC_IVAR____TtC12FindMyCommon12StateCapture_queue;
  uint64_t v61 = (void (*)(char *, char *, uint64_t))sub_24E286BEC();
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F8F138], v15);
  sub_24E28D6A0();
  v76[0] = MEMORY[0x263F8EE78];
  sub_24E2897E0(&qword_26B1B4E98, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B4E88);
  sub_24E286C2C();
  sub_24E28D950();
  uint64_t v20 = v73;
  *(uint64_t *)((char *)v2 + v19) = sub_24E28D890();
  sub_24E28D650();
  uint64_t v21 = v63;
  uint64_t v22 = *(void (**)(void))(v63 + 16);
  uint64_t v59 = (char *)v3 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_id;
  v22();
  char v23 = v62;
  uint64_t v68 = v12;
  uint64_t v61 = (void (*)(char *, char *, uint64_t))v22;
  ((void (*)(char *, char *, uint64_t))v22)(v62, v12, v20);
  uint64_t v24 = v21;
  unint64_t v25 = (*(unsigned __int8 *)(v21 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v26 = (v7 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v28 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v28 + v25, v23, v20);
  char v29 = (void *)(v28 + v26);
  uint64_t v30 = v69;
  *char v29 = v66;
  v29[1] = v30;
  *(void *)(v28 + v27) = v71;
  char v31 = Description;
  char v74 = v3;
  uint64_t v32 = *(void **)((char *)v3 + v70);
  swift_retain();
  id v33 = v32;
  uint64_t v34 = v65;
  os_state_add_handler(queue:block:)((uint64_t)sub_24E2874DC, v28, v65);

  uint64_t v35 = v64;
  uint64_t v36 = v34;
  if (((unsigned int (*)(uint64_t, uint64_t, ValueMetadata *))v31[6])(v34, 1, v64) == 1)
  {
    swift_release();
    swift_release();
    char v37 = *(void (**)(char *, uint64_t))(v24 + 8);
    uint64_t v38 = v73;
    v37(v68, v73);
    sub_24E287598(v34);
    v37(v59, v38);

    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    uint64_t v58 = v28;
    uint64_t v39 = v67;
    uint64_t v40 = v68;
    ((void (*)(char *, uint64_t, ValueMetadata *))v31[4])(v67, v36, v35);
    ((void (*)(uint64_t, char *, ValueMetadata *))v31[2])((uint64_t)v74 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_handle, v39, v35);
    if (qword_26B1B4E40 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_24E28D690();
    __swift_project_value_buffer(v41, (uint64_t)qword_26B1B4E28);
    char v42 = v60;
    v61(v60, v40, v73);
    swift_retain_n();
    uint64_t v43 = sub_24E28D670();
    os_log_type_t v44 = sub_24E28D830();
    int v45 = v44;
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      v76[0] = v71;
      *(_DWORD *)uint64_t v46 = 136446466;
      sub_24E2897E0(&qword_26B1B4E10, MEMORY[0x263F07508]);
      LODWORD(v70) = v45;
      unint64_t v47 = v42;
      uint64_t v48 = v73;
      uint64_t v49 = sub_24E28DA40();
      uint64_t v75 = sub_24E27B9F4(v49, v50, v76);
      sub_24E28D8D0();
      swift_bridgeObjectRelease();
      uint64_t v51 = *(void (**)(char *, uint64_t))(v24 + 8);
      v51(v47, v48);
      *(_WORD *)(v46 + 12) = 2080;
      sub_24E2897E0(&qword_2698C8FB8, (void (*)(uint64_t))type metadata accessor for StateCaptureHandle);
      uint64_t v52 = sub_24E28DA40();
      uint64_t v75 = sub_24E27B9F4(v52, v53, v76);
      sub_24E28D8D0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E276000, v43, (os_log_type_t)v70, "Added handler: %{public}s %s", (uint8_t *)v46, 0x16u);
      uint64_t v54 = v71;
      swift_arrayDestroy();
      MEMORY[0x253337400](v54, -1, -1);
      MEMORY[0x253337400](v46, -1, -1);

      swift_release();
      swift_release();
      Description[1](v67, v35);
      v51(v68, v48);
    }
    else
    {
      swift_release_n();

      swift_release();
      swift_release();
      BOOL v55 = *(void (**)(char *, uint64_t))(v24 + 8);
      uint64_t v56 = v73;
      v55(v42, v73);
      Description[1](v67, v35);
      v55(v40, v56);
    }
  }
  return v74;
}

unint64_t sub_24E286BEC()
{
  unint64_t result = qword_26B1B4EA0;
  if (!qword_26B1B4EA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1B4EA0);
  }
  return result;
}

unint64_t sub_24E286C2C()
{
  unint64_t result = qword_26B1B4E90;
  if (!qword_26B1B4E90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1B4E88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B4E90);
  }
  return result;
}

uint64_t sub_24E286C88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v77 = a5;
  uint64_t v78 = a4;
  uint64_t v75 = a2;
  uint64_t v76 = a3;
  uint64_t v64 = a6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B4D50);
  MEMORY[0x270FA5388](v7 - 8);
  id v60 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = type metadata accessor for StateCaptureDateType();
  Description = (uint64_t (**)(char *, uint64_t, ValueMetadata *))v59[-1].Description;
  MEMORY[0x270FA5388](v59);
  unint64_t v57 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = type metadata accessor for StateCaptureHint();
  char v74 = (void (**)(char *, void, ValueMetadata *))v81[-1].Description;
  MEMORY[0x270FA5388](v81);
  uint64_t v73 = v10;
  uint64_t v80 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_24E28D660();
  uint64_t v72 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v71 = v11;
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5078);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for StateCaptureReason();
  uint64_t v17 = (void (**)(_DWORD *, ValueMetadata *))v16[-1].Description;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (_DWORD *)((char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = type metadata accessor for StateCaptureHintAPI();
  uint64_t v21 = (uint64_t (**)(unsigned char *, ValueMetadata *))v20[-1].Description;
  MEMORY[0x270FA5388](v20);
  char v23 = (char *)&v57 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E28D570();
  dispatch_semaphore_t v69 = dispatch_semaphore_create(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B4E08);
  swift_allocObject();
  uint64_t v70 = sub_24E28D560();
  int v68 = StateCaptureHint.version.getter();
  uint64_t v24 = StateCaptureHint.requestor.getter();
  uint64_t v66 = v25;
  uint64_t v67 = v24;
  StateCaptureHint.api.getter(v23);
  int v26 = StateCaptureHintAPI.rawValue.getter();
  uint64_t result = v21[1](v23, v20);
  int v65 = v26 - 1;
  if ((v26 - 1) > 2)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  StateCaptureHint.reason.getter(v19);
  int v63 = StateCaptureReason.rawValue.getter();
  v17[1](v19, v16);
  uint64_t v28 = sub_24E28D7F0();
  char v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56);
  uint64_t v62 = v15;
  v29(v15, 1, 1, v28);
  uint64_t v30 = v72;
  char v31 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 16);
  uint64_t v61 = v12;
  v31(v12, v75, v79);
  uint64_t v32 = v74;
  v74[2](v80, a1, v81);
  unint64_t v33 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  unint64_t v34 = (v71 + *((unsigned __int8 *)v32 + 80) + v33) & ~(unint64_t)*((unsigned __int8 *)v32 + 80);
  unint64_t v35 = (v73 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v35 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v36 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v38 = (v37 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = 0;
  *(void *)(v39 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v39 + v33, v61, v79);
  ((void (**)(char *, char *, ValueMetadata *))v32)[4]((char *)(v39 + v34), v80, v81);
  uint64_t v40 = (void *)(v39 + v35);
  uint64_t v41 = v78;
  *uint64_t v40 = v76;
  v40[1] = v41;
  unint64_t v42 = v39 + v36;
  *(_DWORD *)unint64_t v42 = v68;
  uint64_t v43 = v66;
  *(void *)(v42 + 8) = v67;
  *(void *)(v42 + 16) = v43;
  *(unsigned char *)(v42 + 24) = v65;
  *(_DWORD *)(v42 + 28) = v63;
  dispatch_semaphore_t v44 = v69;
  *(void *)(v39 + v37) = v70;
  *(void *)(v39 + v38) = v44;
  *(void *)(v39 + ((v38 + 15) & 0xFFFFFFFFFFFFFFF8)) = v77;
  swift_retain();
  swift_retain();
  int v45 = v44;
  sub_24E28A4B4((uint64_t)v62, (uint64_t)&unk_2698C8FD0, v39);
  swift_release();
  sub_24E28D8A0();
  sub_24E28D540();
  uint64_t v46 = v83;
  if (v83)
  {
    uint64_t v47 = v82;
    uint64_t v48 = v84;
    unint64_t v49 = v85;
    swift_bridgeObjectRetain();
    sub_24E2856B8(v48, v49);
    unint64_t v50 = v60;
    StateCaptureDateType.init(rawValue:)(1u);
    uint64_t v51 = Description;
    uint64_t v52 = v59;
    uint64_t result = Description[6](v50, 1, v59);
    if (result != 1)
    {
      unint64_t v53 = v57;
      v51[4](v57, (uint64_t)v50, v52);
      swift_bridgeObjectRetain();
      sub_24E2856B8(v48, v49);
      uint64_t v54 = v64;
      StateCaptureStateData.init(type:title:data:)(v53, v47, v46, v48, v49, v64);
      sub_24E289748(v47, v46, v48, v49);
      swift_release();

      sub_24E289748(v47, v46, v48, v49);
      BOOL v55 = type metadata accessor for StateCaptureStateData();
      return (*((uint64_t (**)(uint64_t, void, uint64_t, ValueMetadata *))v55[-1].Description + 7))(v54, 0, 1, v55);
    }
    goto LABEL_8;
  }

  swift_release();
  uint64_t v56 = type metadata accessor for StateCaptureStateData();
  return (*((uint64_t (**)(uint64_t, uint64_t, uint64_t, ValueMetadata *))v56[-1].Description + 7))(v64, 1, 1, v56);
}

uint64_t sub_24E28742C()
{
  uint64_t v1 = sub_24E28D660();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24E2874DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_24E28D660() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v2 + v7);
  uint64_t v9 = *(void *)(v2 + v7 + 8);
  uint64_t v10 = *(void *)(v2 + ((v7 + 23) & 0xFFFFFFFFFFFFFFF8));
  return sub_24E286C88(a1, v2 + v6, v8, v9, v10, a2);
}

uint64_t sub_24E287598(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B4E68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E2875F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  *(void *)(v8 + 248) = v20;
  *(_OWORD *)(v8 + 232) = v19;
  *(_OWORD *)(v8 + 216) = v18;
  *(_DWORD *)(v8 + 560) = a8;
  *(void *)(v8 + 200) = a6;
  *(void *)(v8 + 208) = a7;
  *(void *)(v8 + 184) = a4;
  *(void *)(v8 + 192) = a5;
  uint64_t v9 = sub_24E28DB90();
  *(void *)(v8 + 256) = v9;
  *(void *)(v8 + 264) = *(void *)(v9 - 8);
  *(void *)(v8 + 272) = swift_task_alloc();
  uint64_t v10 = sub_24E28D690();
  *(void *)(v8 + 280) = v10;
  *(void *)(v8 + 288) = *(void *)(v10 - 8);
  *(void *)(v8 + 296) = swift_task_alloc();
  *(void *)(v8 + 304) = swift_task_alloc();
  uint64_t v11 = type metadata accessor for StateCaptureReason();
  *(void *)(v8 + 312) = v11;
  *(void *)(v8 + 320) = v11[-1].Description;
  *(void *)(v8 + 328) = swift_task_alloc();
  uint64_t v12 = type metadata accessor for StateCaptureHint();
  *(void *)(v8 + 336) = v12;
  *(void *)(v8 + 344) = v12[-1].Description;
  *(void *)(v8 + 352) = swift_task_alloc();
  *(void *)(v8 + 360) = swift_task_alloc();
  uint64_t v13 = sub_24E28D660();
  *(void *)(v8 + 368) = v13;
  *(void *)(v8 + 376) = *(void *)(v13 - 8);
  *(void *)(v8 + 384) = swift_task_alloc();
  *(void *)(v8 + 392) = swift_task_alloc();
  *(void *)(v8 + 400) = swift_task_alloc();
  *(void *)(v8 + 408) = swift_task_alloc();
  uint64_t v14 = sub_24E28D9C0();
  *(void *)(v8 + 416) = v14;
  *(void *)(v8 + 424) = *(void *)(v14 - 8);
  *(void *)(v8 + 432) = swift_task_alloc();
  *(void *)(v8 + 440) = swift_task_alloc();
  *(void *)(v8 + 448) = swift_task_alloc();
  *(void *)(v8 + 456) = swift_task_alloc();
  *(void *)(v8 + 464) = swift_task_alloc();
  *(void *)(v8 + 472) = swift_task_alloc();
  *(void *)(v8 + 480) = swift_task_alloc();
  uint64_t v15 = sub_24E28D9E0();
  *(void *)(v8 + 488) = v15;
  *(void *)(v8 + 496) = *(void *)(v15 - 8);
  *(void *)(v8 + 504) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E287994, 0, 0);
}

uint64_t sub_24E287994()
{
  uint64_t v47 = v0;
  sub_24E28D9D0();
  sub_24E28D9A0();
  if (qword_26B1B4E40 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 408);
  uint64_t v3 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v41 = *(void *)(v0 + 360);
  uint64_t v5 = *(void *)(v0 + 344);
  uint64_t v43 = *(void *)(v0 + 352);
  uint64_t v6 = *(void *)(v0 + 336);
  uint64_t v7 = *(void *)(v0 + 192);
  *(void *)(v0 + 512) = __swift_project_value_buffer(*(void *)(v0 + 280), (uint64_t)qword_26B1B4E28);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 520) = v8;
  *(void *)(v0 + 528) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v8(v2, v1, v3);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v9(v41, v7, v6);
  v9(v43, v7, v6);
  uint64_t v10 = sub_24E28D670();
  os_log_type_t v11 = sub_24E28D860();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = *(void *)(v0 + 408);
  uint64_t v14 = *(void *)(v0 + 368);
  uint64_t v15 = *(void *)(v0 + 376);
  uint64_t v16 = *(void *)(v0 + 352);
  uint64_t v44 = *(void *)(v0 + 360);
  uint64_t v18 = *(void *)(v0 + 336);
  uint64_t v17 = *(void *)(v0 + 344);
  if (v12)
  {
    unint64_t v35 = *(_DWORD **)(v0 + 328);
    uint64_t v38 = *(void *)(v0 + 320);
    uint64_t v36 = *(void *)(v0 + 312);
    uint64_t v39 = *(void *)(v0 + 352);
    uint64_t v19 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v46 = v42;
    *(_DWORD *)uint64_t v19 = 136446722;
    os_log_type_t type = v11;
    sub_24E2897E0(&qword_26B1B4E10, MEMORY[0x263F07508]);
    uint64_t v20 = sub_24E28DA40();
    *(void *)(v0 + 160) = sub_24E27B9F4(v20, v21, &v46);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    unint64_t v37 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v37(v13, v14);
    *(_WORD *)(v19 + 12) = 2080;
    StateCaptureHint.reason.getter(v35);
    sub_24E2897E0(&qword_26B1B4E70, (void (*)(uint64_t))type metadata accessor for StateCaptureReason);
    uint64_t v22 = sub_24E28DA40();
    unint64_t v24 = v23;
    (*(void (**)(_DWORD *, uint64_t))(v38 + 8))(v35, v36);
    *(void *)(v0 + 168) = sub_24E27B9F4(v22, v24, &v46);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v25(v44, v18);
    *(_WORD *)(v19 + 22) = 2080;
    uint64_t v26 = StateCaptureHint.requestor.getter();
    if (v27)
    {
      unint64_t v28 = v27;
    }
    else
    {
      uint64_t v26 = 1701736302;
      unint64_t v28 = 0xE400000000000000;
    }
    *(void *)(v0 + 176) = sub_24E27B9F4(v26, v28, &v46);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    v25(v39, v18);
    char v29 = v37;
    _os_log_impl(&dword_24E276000, v10, type, "Running state capture %{public}s: reason: %s requestor: %s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x253337400](v42, -1, -1);
    MEMORY[0x253337400](v19, -1, -1);
  }
  else
  {
    char v29 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v29(v13, v14);
    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v30(v44, v18);
    v30(v16, v18);
  }

  *(void *)(v0 + 536) = v29;
  uint64_t v31 = *(void *)(v0 + 232);
  uint64_t v32 = *(int **)(v0 + 200);
  *(_DWORD *)(v0 + 48) = *(_DWORD *)(v0 + 560);
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 216);
  *(unsigned char *)(v0 + 72) = v31;
  *(_DWORD *)(v0 + 76) = HIDWORD(v31);
  int v45 = (uint64_t (*)(uint64_t, uint64_t))((char *)v32 + *v32);
  unint64_t v33 = (void *)swift_task_alloc();
  *(void *)(v0 + 544) = v33;
  *unint64_t v33 = v0;
  v33[1] = sub_24E287ED0;
  return v45(v0 + 16, v0 + 48);
}

uint64_t sub_24E287ED0()
{
  *(void *)(*(void *)v1 + 552) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E2885B8;
  }
  else {
    uint64_t v2 = sub_24E287FE4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E287FE4()
{
  id v60 = v0;
  uint64_t v48 = (void (*)(uint64_t, uint64_t, void))v0[65];
  uint64_t v1 = v0[59];
  uint64_t v44 = v0[64];
  uint64_t v46 = v0[58];
  uint64_t v51 = v0[60];
  os_log_t loga = (os_log_t)v0[57];
  uint64_t v3 = v0[52];
  uint64_t v2 = v0[53];
  uint64_t v4 = v0[50];
  *(void *)os_log_type_t type = v0[46];
  uint64_t v5 = v0[38];
  uint64_t v6 = v0[35];
  uint64_t v7 = v0[36];
  uint64_t v8 = v0[23];
  uint64_t v57 = v0[3];
  uint64_t v58 = v0[2];
  unint64_t v55 = v0[5];
  uint64_t v56 = v0[4];
  sub_24E28D9A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v44, v6);
  v48(v4, v8, *(void *)type);
  uint64_t v9 = *(void (**)(os_log_t, uint64_t, uint64_t))(v2 + 16);
  v9(v46, v51, v3);
  v9(loga, v1, v3);
  uint64_t v10 = sub_24E28D670();
  os_log_type_t v11 = sub_24E28D860();
  log = v10;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = v0[58];
    uint64_t v13 = v0[52];
    uint64_t v45 = v0[53];
    uint64_t v14 = v0[50];
    uint64_t v15 = v0[46];
    uint64_t v38 = (void (*)(uint64_t, uint64_t))v0[67];
    uint64_t v49 = v0[36];
    uint64_t v16 = v0[34];
    uint64_t v50 = v0[35];
    uint64_t v52 = v0[38];
    uint64_t v39 = v0[33];
    uint64_t v40 = v0[57];
    uint64_t v41 = v0[32];
    uint64_t v17 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v59 = v47;
    *(_DWORD *)uint64_t v17 = 136446466;
    sub_24E2897E0(&qword_26B1B4E10, MEMORY[0x263F07508]);
    uint64_t v18 = sub_24E28DA40();
    os_log_type_t typea = v11;
    v0[18] = sub_24E27B9F4(v18, v19, &v59);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    v38(v14, v15);
    *(_WORD *)(v17 + 12) = 2080;
    sub_24E28DB80();
    sub_24E2897E0(&qword_26B1B4EA8, MEMORY[0x263F8F6D8]);
    uint64_t v20 = sub_24E28DB60();
    unint64_t v22 = v21;
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v16, v41);
    v0[19] = sub_24E27B9F4(v20, v22, &v59);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    unint64_t v23 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v23(v12, v13);
    v23(v40, v13);
    _os_log_impl(&dword_24E276000, log, typea, "State capture duration: %{public}s: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253337400](v47, -1, -1);
    MEMORY[0x253337400](v17, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v52, v50);
  }
  else
  {
    uint64_t v24 = v0[57];
    uint64_t v25 = v0[58];
    uint64_t v26 = v0[52];
    uint64_t v27 = v0[53];
    uint64_t v28 = v0[38];
    uint64_t v29 = v0[35];
    uint64_t v30 = v0[36];
    ((void (*)(void, void))v0[67])(v0[50], v0[46]);
    unint64_t v23 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v23(v25, v26);
    v23(v24, v26);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
  }
  v0[10] = v58;
  v0[11] = v57;
  v0[12] = v56;
  v0[13] = v55;
  sub_24E289794(v58, v57, v56, v55);
  sub_24E28D550();
  sub_24E28D8B0();
  sub_24E289748(v58, v57, v56, v55);
  uint64_t v32 = v0[62];
  uint64_t v31 = v0[63];
  uint64_t v34 = v0[60];
  uint64_t v33 = v0[61];
  uint64_t v35 = v0[52];
  v23(v0[59], v35);
  v23(v34, v35);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = (uint64_t (*)(void))v0[1];
  return v36();
}

uint64_t sub_24E2885B8()
{
  uint64_t v65 = v0;
  uint64_t v1 = *(void *)(v0 + 552);
  (*(void (**)(void, void, void))(v0 + 520))(*(void *)(v0 + 384), *(void *)(v0 + 184), *(void *)(v0 + 368));
  MEMORY[0x253337280](v1);
  MEMORY[0x253337280](v1);
  uint64_t v2 = sub_24E28D670();
  os_log_type_t v3 = sub_24E28D840();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void **)(v0 + 552);
    uint64_t v5 = *(void *)(v0 + 384);
    uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
    uint64_t v6 = *(void *)(v0 + 368);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v58 = (void *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    uint64_t v64 = v61;
    *(_DWORD *)uint64_t v7 = 136446466;
    sub_24E2897E0(&qword_26B1B4E10, MEMORY[0x263F07508]);
    uint64_t v8 = sub_24E28DA40();
    *(void *)(v0 + 120) = sub_24E27B9F4(v8, v9, &v64);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    v56(v5, v6);
    *(_WORD *)(v7 + 12) = 2112;
    MEMORY[0x253337280](v4);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 128) = v10;
    sub_24E28D8D0();
    *uint64_t v58 = v10;

    _os_log_impl(&dword_24E276000, v2, v3, "Error from StateCapture handler %{public}s: %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698C8FD8);
    swift_arrayDestroy();
    MEMORY[0x253337400](v58, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253337400](v61, -1, -1);
    MEMORY[0x253337400](v7, -1, -1);
  }
  else
  {
    os_log_type_t v11 = *(void **)(v0 + 552);
    (*(void (**)(void, void))(v0 + 536))(*(void *)(v0 + 384), *(void *)(v0 + 368));
  }
  os_log_type_t typea = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 520);
  uint64_t v59 = *(void *)(v0 + 480);
  uint64_t v12 = *(void *)(v0 + 448);
  uint64_t v51 = *(void *)(v0 + 512);
  os_log_t log = *(os_log_t *)(v0 + 440);
  uint64_t v13 = *(void *)(v0 + 424);
  uint64_t v62 = *(NSObject **)(v0 + 432);
  uint64_t v14 = *(void *)(v0 + 416);
  uint64_t v15 = *(void *)(v0 + 392);
  uint64_t v49 = *(void *)(v0 + 368);
  uint64_t v17 = *(void *)(v0 + 288);
  uint64_t v16 = *(void *)(v0 + 296);
  uint64_t v18 = *(void *)(v0 + 280);
  uint64_t v19 = *(void *)(v0 + 184);
  sub_24E28D9A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v51, v18);
  typea(v15, v19, v49);
  uint64_t v20 = *(void (**)(os_log_t, uint64_t, uint64_t))(v13 + 16);
  v20(log, v59, v14);
  v20(v62, v12, v14);
  unint64_t v21 = sub_24E28D670();
  os_log_type_t type = sub_24E28D860();
  BOOL v22 = os_log_type_enabled(v21, type);
  unint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
  uint64_t v24 = *(void *)(v0 + 424);
  uint64_t v57 = *(void *)(v0 + 440);
  uint64_t v60 = *(void *)(v0 + 432);
  uint64_t v25 = *(void *)(v0 + 416);
  uint64_t v26 = *(void *)(v0 + 392);
  uint64_t v27 = *(void *)(v0 + 368);
  uint64_t v28 = *(void *)(v0 + 288);
  uint64_t v29 = *(void *)(v0 + 296);
  uint64_t v63 = *(void *)(v0 + 280);
  if (v22)
  {
    uint64_t v45 = *(void *)(v0 + 272);
    uint64_t v46 = *(void *)(v0 + 264);
    uint64_t v47 = *(void *)(v0 + 256);
    uint64_t v48 = v21;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    uint64_t v64 = v50;
    *(_DWORD *)uint64_t v30 = 136446466;
    os_log_t loga = (os_log_t)v28;
    sub_24E2897E0(&qword_26B1B4E10, MEMORY[0x263F07508]);
    uint64_t v31 = sub_24E28DA40();
    *(void *)(v0 + 136) = sub_24E27B9F4(v31, v32, &v64);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    v23(v26, v27);
    *(_WORD *)(v30 + 12) = 2080;
    sub_24E28DB80();
    sub_24E2897E0(&qword_26B1B4EA8, MEMORY[0x263F8F6D8]);
    uint64_t v33 = sub_24E28DB60();
    unint64_t v35 = v34;
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    *(void *)(v0 + 112) = sub_24E27B9F4(v33, v35, &v64);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v36(v57, v25);
    v36(v60, v25);
    _os_log_impl(&dword_24E276000, v48, type, "State capture duration: %{public}s: %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253337400](v50, -1, -1);
    MEMORY[0x253337400](v30, -1, -1);

    ((void (*)(uint64_t, uint64_t))loga[1].isa)(v29, v63);
  }
  else
  {
    v23(v26, v27);
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v36(v57, v25);
    v36(v60, v25);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v63);
  }
  unint64_t v37 = *(void **)(v0 + 552);
  sub_24E28D8B0();

  uint64_t v39 = *(void *)(v0 + 496);
  uint64_t v38 = *(void *)(v0 + 504);
  uint64_t v41 = *(void *)(v0 + 480);
  uint64_t v40 = *(void *)(v0 + 488);
  uint64_t v42 = *(void *)(v0 + 416);
  v36(*(void *)(v0 + 448), v42);
  v36(v41, v42);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  return v43();
}

uint64_t StateCapture.deinit()
{
  uint64_t v1 = v0;
  if (qword_26B1B4E40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24E28D690();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1B4E28);
  swift_retain_n();
  os_log_type_t v3 = sub_24E28D670();
  os_log_type_t v4 = sub_24E28D830();
  uint64_t v5 = &qword_26B1B4F90[14];
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v17 = v7;
    *(_DWORD *)uint64_t v6 = 136446466;
    sub_24E28D660();
    sub_24E2897E0(&qword_26B1B4E10, MEMORY[0x263F07508]);
    uint64_t v8 = sub_24E28DA40();
    sub_24E27B9F4(v8, v9, &v17);
    sub_24E28D8D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    type metadata accessor for StateCaptureHandle();
    sub_24E2897E0(&qword_2698C8FB8, (void (*)(uint64_t))type metadata accessor for StateCaptureHandle);
    uint64_t v10 = sub_24E28DA40();
    sub_24E27B9F4(v10, v11, &v17);
    uint64_t v5 = qword_26B1B4F90 + 112;
    sub_24E28D8D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E276000, v3, v4, "Removing handler: %{public}s %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253337400](v7, -1, -1);
    MEMORY[0x253337400](v6, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v12 = v0 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_handle;
  os_state_remove_handler(_:)((void *)(v1 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_handle));
  uint64_t v13 = v1 + v5[107];
  uint64_t v14 = sub_24E28D660();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);

  uint64_t v15 = type metadata accessor for StateCaptureHandle();
  (*((void (**)(uint64_t, ValueMetadata *))v15[-1].Description + 1))(v12, v15);
  return v1;
}

uint64_t StateCapture.__deallocating_deinit()
{
  StateCapture.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24E2890FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_id;
  uint64_t v4 = sub_24E28D660();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_24E289174()
{
  uint64_t v0 = sub_24E28D690();
  __swift_allocate_value_buffer(v0, qword_26B1B4E48);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B4E48);
  return sub_24E28D680();
}

uint64_t sub_24E2891F4()
{
  return sub_24E2897E0(&qword_2698C8FC0, MEMORY[0x263F07508]);
}

uint64_t sub_24E28923C()
{
  return type metadata accessor for StateCapture();
}

uint64_t type metadata accessor for StateCapture()
{
  uint64_t result = qword_26B1B4D40;
  if (!qword_26B1B4D40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E289290()
{
  uint64_t result = sub_24E28D660();
  if (v1 <= 0x3F)
  {
    uint64_t result = (uint64_t)type metadata accessor for StateCaptureHandle();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for StateCapture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StateCapture);
}

uint64_t dispatch thunk of StateCapture.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_24E289394()
{
  uint64_t v11 = sub_24E28D660();
  uint64_t v1 = *(void *)(v11 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = type metadata accessor for StateCaptureHint();
  Description = v5[-1].Description;
  uint64_t v7 = *((unsigned __int8 *)Description + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v12 = v2 | v7 | 7;
  unint64_t v9 = (((((((Description[8] + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v11);
  ((void (*)(uint64_t, ValueMetadata *))Description[1])(v0 + v8, v5);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v12);
}

uint64_t sub_24E289550(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_24E28D660() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  Description = type metadata accessor for StateCaptureHint()[-1].Description;
  unint64_t v7 = (v4 + v5 + *((unsigned __int8 *)Description + 80)) & ~(unint64_t)*((unsigned __int8 *)Description + 80);
  unint64_t v8 = (Description[8] + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = *(void *)(v1 + 24);
  uint64_t v16 = *(void *)(v1 + 16);
  uint64_t v14 = v1 + v7;
  uint64_t v9 = *(void *)(v1 + v8);
  uint64_t v10 = *(void *)(v1 + v8 + 8);
  int v11 = *(_DWORD *)(v1 + ((v8 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24E27DCDC;
  return sub_24E2875F8(a1, v16, v15, v1 + v4, v14, v9, v10, v11);
}

void sub_24E289748(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    sub_24E285710(a3, a4);
  }
}

void sub_24E289794(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_24E2856B8(a3, a4);
  }
}

uint64_t sub_24E2897E0(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for Analytics()
{
  return &type metadata for Analytics;
}

uint64_t destroy for Analytics.Mode(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 41);
  if (v1 >= 3) {
    unsigned int v1 = *(_DWORD *)a1 + 3;
  }
  if (!v1)
  {
    unsigned int v2 = *(unsigned __int8 *)(a1 + 40);
    if (v2 >= 4) {
      unsigned int v2 = *(_DWORD *)a1 + 4;
    }
    if (v2) {
      return __swift_destroy_boxed_opaque_existential_0Tm(a1);
    }
  }
  return a1;
}

uint64_t initializeWithCopy for Analytics.Mode(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 41);
  if (v3 >= 3) {
    unsigned int v3 = *(_DWORD *)a2 + 3;
  }
  if (v3 == 2)
  {
    *(void *)a1 = *(void *)a2;
    char v4 = 2;
  }
  else if (v3 == 1)
  {
    *(void *)a1 = *(void *)a2;
    char v4 = 1;
  }
  else
  {
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 1u:
        long long v7 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v7;
        (**(void (***)(uint64_t))(v7 - 8))(a1);
        char v6 = 1;
        break;
      case 2u:
        long long v8 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v8;
        (**(void (***)(uint64_t))(v8 - 8))(a1);
        char v6 = 2;
        break;
      case 3u:
        long long v9 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v9;
        (**(void (***)(uint64_t))(v9 - 8))(a1);
        char v6 = 3;
        break;
      default:
        char v6 = 0;
        *(unsigned char *)a1 = *(unsigned char *)a2;
        break;
    }
    char v4 = 0;
    *(unsigned char *)(a1 + 40) = v6;
  }
  *(unsigned char *)(a1 + 41) = v4;
  return a1;
}

uint64_t assignWithCopy for Analytics.Mode(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 41);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (!v4)
    {
      unsigned int v5 = *(unsigned __int8 *)(a1 + 40);
      if (v5 >= 4) {
        unsigned int v5 = *(_DWORD *)a1 + 4;
      }
      if (v5) {
        __swift_destroy_boxed_opaque_existential_0Tm(a1);
      }
    }
    unsigned int v6 = *(unsigned __int8 *)(a2 + 41);
    if (v6 >= 3) {
      unsigned int v6 = *(_DWORD *)a2 + 3;
    }
    if (v6 == 2)
    {
      *(void *)a1 = *(void *)a2;
      char v7 = 2;
    }
    else if (v6 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v7 = 1;
    }
    else
    {
      unsigned int v8 = *(unsigned __int8 *)(a2 + 40);
      if (v8 >= 4) {
        unsigned int v8 = *(_DWORD *)a2 + 4;
      }
      switch(v8)
      {
        case 1u:
          uint64_t v10 = *(void *)(a2 + 24);
          *(void *)(a1 + 24) = v10;
          *(void *)(a1 + 32) = *(void *)(a2 + 32);
          (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1, a2);
          char v9 = 1;
          break;
        case 2u:
          uint64_t v11 = *(void *)(a2 + 24);
          *(void *)(a1 + 24) = v11;
          *(void *)(a1 + 32) = *(void *)(a2 + 32);
          (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1, a2);
          char v9 = 2;
          break;
        case 3u:
          uint64_t v12 = *(void *)(a2 + 24);
          *(void *)(a1 + 24) = v12;
          *(void *)(a1 + 32) = *(void *)(a2 + 32);
          (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1, a2);
          char v9 = 3;
          break;
        default:
          char v9 = 0;
          *(unsigned char *)a1 = *(unsigned char *)a2;
          break;
      }
      char v7 = 0;
      *(unsigned char *)(a1 + 40) = v9;
    }
    *(unsigned char *)(a1 + 41) = v7;
  }
  return a1;
}

__n128 __swift_memcpy42_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Analytics.Mode(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 41);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (!v4)
    {
      unsigned int v5 = *(unsigned __int8 *)(a1 + 40);
      if (v5 >= 4) {
        unsigned int v5 = *(_DWORD *)a1 + 4;
      }
      if (v5) {
        __swift_destroy_boxed_opaque_existential_0Tm(a1);
      }
    }
    unsigned int v6 = *(unsigned __int8 *)(a2 + 41);
    if (v6 >= 3) {
      unsigned int v6 = *(_DWORD *)a2 + 3;
    }
    if (v6 == 2)
    {
      *(void *)a1 = *(void *)a2;
      char v7 = 2;
    }
    else if (v6 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v7 = 1;
    }
    else
    {
      unsigned int v8 = *(unsigned __int8 *)(a2 + 40);
      if (v8 >= 4) {
        unsigned int v8 = *(_DWORD *)a2 + 4;
      }
      switch(v8)
      {
        case 1u:
          long long v10 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v10;
          *(void *)(a1 + 32) = *(void *)(a2 + 32);
          char v9 = 1;
          break;
        case 2u:
          long long v11 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v11;
          *(void *)(a1 + 32) = *(void *)(a2 + 32);
          char v9 = 2;
          break;
        case 3u:
          long long v12 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v12;
          *(void *)(a1 + 32) = *(void *)(a2 + 32);
          char v9 = 3;
          break;
        default:
          char v9 = 0;
          *(unsigned char *)a1 = *(unsigned char *)a2;
          break;
      }
      char v7 = 0;
      *(unsigned char *)(a1 + 40) = v9;
    }
    *(unsigned char *)(a1 + 41) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for Analytics.Mode(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 42)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 41);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Analytics.Mode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 26) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 42) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 42) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 41) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24E289DCC(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 41);
  if (result >= 3) {
    return (*(_DWORD *)a1 + 3);
  }
  return result;
}

uint64_t sub_24E289DE8(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 41) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Analytics.Mode()
{
  return &type metadata for Analytics.Mode;
}

uint64_t destroy for Analytics.DiscreteType(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 4) {
    unsigned int v1 = *(_DWORD *)a1 + 4;
  }
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_0Tm(a1);
  }
  return a1;
}

uint64_t initializeWithCopy for Analytics.DiscreteType(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 4) {
    unsigned int v3 = *(_DWORD *)a2 + 4;
  }
  switch(v3)
  {
    case 1u:
      long long v7 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v7;
      (**(void (***)(uint64_t))(v7 - 8))(a1);
      char v4 = 1;
      break;
    case 2u:
      long long v5 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v5;
      (**(void (***)(uint64_t))(v5 - 8))(a1);
      char v4 = 2;
      break;
    case 3u:
      long long v6 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v6;
      (**(void (***)(uint64_t))(v6 - 8))(a1);
      char v4 = 3;
      break;
    default:
      char v4 = 0;
      *(unsigned char *)a1 = *(unsigned char *)a2;
      break;
  }
  *(unsigned char *)(a1 + 40) = v4;
  return a1;
}

uint64_t assignWithCopy for Analytics.DiscreteType(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    if (v4) {
      __swift_destroy_boxed_opaque_existential_0Tm(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 1u:
        uint64_t v7 = *(void *)(a2 + 24);
        *(void *)(a1 + 24) = v7;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
        char v6 = 1;
        break;
      case 2u:
        uint64_t v8 = *(void *)(a2 + 24);
        *(void *)(a1 + 24) = v8;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1, a2);
        char v6 = 2;
        break;
      case 3u:
        uint64_t v9 = *(void *)(a2 + 24);
        *(void *)(a1 + 24) = v9;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1, a2);
        char v6 = 3;
        break;
      default:
        char v6 = 0;
        *(unsigned char *)a1 = *(unsigned char *)a2;
        break;
    }
    *(unsigned char *)(a1 + 40) = v6;
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Analytics.DiscreteType(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    if (v4) {
      __swift_destroy_boxed_opaque_existential_0Tm(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 1u:
        long long v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        char v6 = 1;
        break;
      case 2u:
        long long v8 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v8;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        char v6 = 2;
        break;
      case 3u:
        long long v9 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v9;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        char v6 = 3;
        break;
      default:
        char v6 = 0;
        *(unsigned char *)a1 = *(unsigned char *)a2;
        break;
    }
    *(unsigned char *)(a1 + 40) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for Analytics.DiscreteType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 4) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Analytics.DiscreteType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24E28A288(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 4) {
    return (*(_DWORD *)a1 + 4);
  }
  return result;
}

uint64_t sub_24E28A2A4(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Analytics.DiscreteType()
{
  return &type metadata for Analytics.DiscreteType;
}

unsigned char *storeEnumTagSinglePayload for Analytics.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E28A378);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Analytics.Error()
{
  return &type metadata for Analytics.Error;
}

unint64_t sub_24E28A3B4()
{
  unint64_t result = qword_2698C8FE0;
  if (!qword_2698C8FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C8FE0);
  }
  return result;
}

uint64_t sub_24E28A408()
{
  return sub_24E28DB40();
}

uint64_t sub_24E28A44C()
{
  return sub_24E28DB20();
}

uint64_t sub_24E28A474()
{
  return sub_24E28DB40();
}

uint64_t sub_24E28A4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E28D7F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24E28D7E0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24E27E5AC(a1, &qword_26B1B5078);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24E28D7D0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24E28A660()
{
  uint64_t v0 = sub_24E28D690();
  __swift_allocate_value_buffer(v0, qword_26B1B4D08);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B4D08);
  if (qword_26B1B4D28 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5340);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_24E28A728()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B4D38);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_26B1B4D00 = result;
  return result;
}

uint64_t sub_24E28A760()
{
  type metadata accessor for ReferenceClock.IsolationDomain();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_2698C8FE8 = v0;
  return result;
}

uint64_t sub_24E28A7A0()
{
  uint64_t v0 = sub_24E28D640();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  int v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E28D620();
  sub_24E28D600();
  uint64_t v5 = v4;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_26B1B4CE0 = v5;
  return result;
}

double sub_24E28A878()
{
  if (qword_26B1B4CE8 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_26B1B4CE0;
  qword_26B1B4CF0 = qword_26B1B4CE0;
  return result;
}

double static ReferenceClock.convert(toSystem:)(double a1)
{
  BOOL v2 = TMIsAutomaticTimeEnabled()();
  if (!v2)
  {
    uint64_t v3 = sub_24E278434(v2);
    if (qword_26B1B4CC8 != -1) {
      uint64_t v3 = swift_once();
    }
    MEMORY[0x270FA5388](v3);
    uint64_t v5 = v4 + 4;
    os_unfair_lock_lock(v4 + 4);
    sub_24E28B980(&v7);
    os_unfair_lock_unlock(v5);
    return v7 + a1;
  }
  return a1;
}

double static ReferenceClock.convert(toReference:)(double a1)
{
  BOOL v2 = TMIsAutomaticTimeEnabled()();
  if (!v2)
  {
    uint64_t v3 = sub_24E278434(v2);
    if (qword_26B1B4CC8 != -1) {
      uint64_t v3 = swift_once();
    }
    MEMORY[0x270FA5388](v3);
    uint64_t v5 = v4 + 4;
    os_unfair_lock_lock(v4 + 4);
    sub_24E28B980(&v7);
    os_unfair_lock_unlock(v5);
    return a1 - v7;
  }
  return a1;
}

uint64_t sub_24E28AA94()
{
  return MEMORY[0x270FA2498](sub_24E28AAB0, 0, 0);
}

uint64_t sub_24E28AAB0()
{
  if (qword_2698C8EE8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2698C8FE8;
  return MEMORY[0x270FA2498](sub_24E28AB44, v0, 0);
}

uint64_t sub_24E28AB44()
{
  sub_24E28ABDC(1);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void static ReferenceClock.calibrate()(uint64_t a1)
{
  if (!sub_24E278434(a1))
  {
    sub_24E28ABDC(0);
  }
}

void sub_24E28ABDC(char a1)
{
  uint64_t v2 = sub_24E28D640();
  uint64_t v3 = *(uint8_t **)(v2 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (qword_26B1B4CC8 != -1) {
      swift_once();
    }
    ((void (*)(void))MEMORY[0x270FA5388])();
    uint64_t v54 = sub_24E28BCB8;
    uint64_t v55 = 0;
    double v7 = v6 + 4;
    os_unfair_lock_lock(v6 + 4);
    sub_24E28BCC8(v59);
    os_unfair_lock_unlock(v7);
    if (LOBYTE(v59[0]) != 1) {
      return;
    }
  }
  sub_24E28D580();
  if (!v59[3])
  {
    sub_24E27E5AC((uint64_t)v59, &qword_2698C8F18);
LABEL_32:
    if (qword_26B1B4D20 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_24E28D690();
    __swift_project_value_buffer(v50, (uint64_t)qword_26B1B4D08);
    uint64_t v51 = sub_24E28D670();
    os_log_type_t v52 = sub_24E28D850();
    if (os_log_type_enabled(v51, v52))
    {
      unint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v53 = 0;
      _os_log_impl(&dword_24E276000, v51, v52, "Missing com.apple.timed entitlement!", v53, 2u);
      MEMORY[0x253337400](v53, -1, -1);
    }

    sub_24E28DA00();
    __break(1u);
    return;
  }
  if ((swift_dynamicCast() & 1) == 0 || v58 != 1) {
    goto LABEL_32;
  }
  uint64_t v8 = TMIsAutomaticTimeEnabled()();
  if (v8)
  {
    if (qword_26B1B4CC8 != -1) {
      uint64_t v8 = swift_once();
    }
    MEMORY[0x270FA5388](v8);
    uint64_t v54 = sub_24E28BCA0;
    uint64_t v55 = 0;
    long long v10 = v9 + 4;
    os_unfair_lock_lock(v9 + 4);
    sub_24E28BE34();
    os_unfair_lock_unlock(v10);
    if (qword_26B1B4D20 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24E28D690();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B1B4D08);
    long long v12 = sub_24E28D670();
    os_log_type_t v13 = sub_24E28D860();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_29;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v59[0] = v15;
    *(_DWORD *)uint64_t v14 = 136446210;
    uint64_t v16 = v5;
    uint64_t v57 = v14 + 4;
    static ReferenceClock.timeInterval.getter();
    sub_24E28D5F0();
    sub_24E28BC48();
    uint64_t v17 = sub_24E28DA40();
    unint64_t v19 = v18;
    (*((void (**)(char *, uint64_t))v3 + 1))(v16, v2);
    uint64_t v58 = sub_24E27B9F4(v17, v19, v59);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E276000, v12, v13, "ReferenceClock calibrated: %{public}s delta: 0.0 uncertainty: 0.0", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253337400](v15, -1, -1);
    uint64_t v20 = (uint64_t)v14;
LABEL_28:
    MEMORY[0x253337400](v20, -1, -1);
LABEL_29:

    return;
  }
  if (qword_26B1B4D20 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_24E28D690();
  __swift_project_value_buffer(v21, (uint64_t)qword_26B1B4D08);
  BOOL v22 = sub_24E28D670();
  os_log_type_t v23 = sub_24E28D860();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_24E276000, v22, v23, "Automatic time is DISABLED", v24, 2u);
    MEMORY[0x253337400](v24, -1, -1);
  }

  *(double *)&uint64_t v25 = COERCE_DOUBLE(sub_24E28BB34());
  if ((v27 & 0x100000000) == 0)
  {
    uint64_t v28 = *(void *)&v26;
    int v29 = v27;
    double v30 = *(double *)&v25;
    double v31 = v26;
    double Current = CFAbsoluteTimeGetCurrent();
    if (v31 > 1.0)
    {
      uint64_t v57 = v3;
      uint64_t v33 = sub_24E28D670();
      os_log_type_t v34 = sub_24E28D840();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 134218240;
        v59[0] = v28;
        sub_24E28D8D0();
        *(_WORD *)(v35 + 12) = 1024;
        LODWORD(v59[0]) = v29;
        sub_24E28D8D0();
        _os_log_impl(&dword_24E276000, v33, v34, "TMGMReferenceTime reports high uncertainty: %f (reliability: %d", (uint8_t *)v35, 0x12u);
        MEMORY[0x253337400](v35, -1, -1);
      }

      uint64_t v3 = v57;
    }
    double v36 = Current - v30;
    if (qword_26B1B4CC8 != -1) {
      swift_once();
    }
    uint64_t v37 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
    *((double *)&v56 - 4) = v36;
    *(&v56 - 3) = v28;
    MEMORY[0x270FA5388](v37);
    uint64_t v54 = sub_24E28BBC4;
    uint64_t v55 = v38;
    uint64_t v40 = v39 + 4;
    os_unfair_lock_lock(v39 + 4);
    sub_24E28BE34();
    os_unfair_lock_unlock(v40);
    long long v12 = sub_24E28D670();
    os_log_type_t v41 = sub_24E28D860();
    if (!os_log_type_enabled(v12, v41)) {
      goto LABEL_29;
    }
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    v59[0] = v43;
    *(_DWORD *)uint64_t v42 = 136446722;
    uint64_t v44 = v5;
    uint64_t v45 = v2;
    uint64_t v46 = v3;
    uint64_t v57 = (uint8_t *)(v42 + 4);
    static ReferenceClock.timeInterval.getter();
    sub_24E28D5F0();
    sub_24E28BC48();
    uint64_t v47 = sub_24E28DA40();
    unint64_t v49 = v48;
    (*((void (**)(char *, uint64_t))v46 + 1))(v44, v45);
    uint64_t v58 = sub_24E27B9F4(v47, v49, v59);
    sub_24E28D8D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 12) = 2048;
    uint64_t v58 = *(void *)&v36;
    sub_24E28D8D0();
    *(_WORD *)(v42 + 22) = 2048;
    uint64_t v58 = v28;
    sub_24E28D8D0();
    _os_log_impl(&dword_24E276000, v12, v41, "ReferenceClock calibrated: %{public}s delta: %f uncertainty: %f", (uint8_t *)v42, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x253337400](v43, -1, -1);
    uint64_t v20 = v42;
    goto LABEL_28;
  }
}

CFAbsoluteTime static ReferenceClock.calibrationAge.getter(uint64_t a1)
{
  uint64_t v1 = sub_24E278434(a1);
  if (qword_26B1B4CC8 != -1) {
    uint64_t v1 = swift_once();
  }
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = v2 + 4;
  os_unfair_lock_lock(v2 + 4);
  sub_24E2783D8(&v6);
  os_unfair_lock_unlock(v3);
  long long v4 = v6;
  return CFAbsoluteTimeGetCurrent() - *(double *)&v4 - *((double *)&v4 + 1);
}

uint64_t sub_24E28B580()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24E28B5B0()
{
  return v0;
}

uint64_t sub_24E28B5BC(uint64_t a1)
{
  uint64_t v2 = sub_24E28D5A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(void (**)(char *))(a1 + 32);
  sub_24E28D590();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_24E28B6B0()
{
  qword_26B1B4CD0 = 0;
  qword_26B1B4F60 = 0;
  if (qword_26B1B4CF8 != -1) {
    swift_once();
  }
  qword_26B1B4CF0 = CFAbsoluteTimeGetCurrent();
  byte_26B1B4F68 = 0;
}

uint64_t sub_24E28B728()
{
  uint64_t v0 = sub_24E28D690();
  __swift_allocate_value_buffer(v0, qword_26B1B5340);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5340);
  return sub_24E28D680();
}

uint64_t sub_24E28B7AC(uint64_t a1, int *a2)
{
  long long v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E28B888;
  return v6(a1);
}

uint64_t sub_24E28B888()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

double sub_24E28B980@<D0>(double *a1@<X8>)
{
  return sub_24E28B9A8(a1);
}

double sub_24E28B998@<D0>(void *a1@<X8>)
{
  double result = *(double *)&qword_26B1B4CD0;
  *a1 = qword_26B1B4CD0;
  return result;
}

double sub_24E28B9A8@<D0>(double *a1@<X8>)
{
  (*(void (**)(double *__return_ptr))(v1 + 16))(&v5);
  if (!v2)
  {
    double result = v5;
    *a1 = v5;
  }
  return result;
}

void sub_24E28B9EC()
{
  byte_26B1B4F68 = 1;
}

uint64_t sub_24E28B9FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24E28BA24()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E28BA5C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E27DCDC;
  return MEMORY[0x270FA2498](sub_24E28AAB0, 0, 0);
}

ValueMetadata *type metadata accessor for ReferenceClock()
{
  return &type metadata for ReferenceClock;
}

uint64_t type metadata accessor for ReferenceClock.IsolationDomain()
{
  return self;
}

uint64_t sub_24E28BB34()
{
  return 0;
}

uint64_t sub_24E28BBC4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  qword_26B1B4CD0 = v0[2];
  qword_26B1B4F60 = v1;
  if (qword_26B1B4CF8 != -1) {
    uint64_t result = swift_once();
  }
  qword_26B1B4CF0 = v2;
  byte_26B1B4F68 = 0;
  return result;
}

unint64_t sub_24E28BC48()
{
  unint64_t result = qword_26B1B4CD8;
  if (!qword_26B1B4CD8)
  {
    sub_24E28D640();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B4CD8);
  }
  return result;
}

void sub_24E28BCA0()
{
}

void sub_24E28BCB8(unsigned char *a1@<X8>)
{
  *a1 = byte_26B1B4F68;
}

void *sub_24E28BCC8@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_24E28BD0C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E28BD44(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E27DCDC;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698C9000 + dword_2698C9000);
  return v6(a1, v4);
}

void sub_24E28BDFC()
{
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

double sub_24E28BE1C@<D0>(void *a1@<X8>)
{
  return sub_24E28B998(a1);
}

uint64_t sub_24E28BE34()
{
  return sub_24E28B9FC();
}

uint64_t SANDBOX_NAMED.getter()
{
  return 1;
}

void sandbox_init_with_parameters(_:_:_:_:)()
{
}

__n128 __swift_memcpy66_1(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24E28BED4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 66)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24E28BEF4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 64) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 66) = v3;
  return result;
}

void type metadata accessor for aks_device_state_s(uint64_t a1)
{
}

void type metadata accessor for keybag_lock_state_t(uint64_t a1)
{
}

void sub_24E28BF5C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

NonModularSPI::StateCaptureHintAPI_optional __swiftcall StateCaptureHintAPI.init(rawValue:)(Swift::UInt32 rawValue)
{
  unsigned int v2 = 0x2010003u >> (8 * rawValue);
  if (rawValue >= 4) {
    LOBYTE(v2) = 3;
  }
  *uint64_t v1 = v2;
  return (NonModularSPI::StateCaptureHintAPI_optional)rawValue;
}

NonModularSPI::StateCaptureHintAPI_optional sub_24E28C20C(Swift::UInt32 *a1)
{
  return StateCaptureHintAPI.init(rawValue:)(*a1);
}

void sub_24E28C254()
{
  int v0 = unk_2700391BC;
  if ((unk_2700391BC & ~dword_2700391B8) == 0) {
    int v0 = 0;
  }
  int v1 = v0 | dword_2700391B8;
  int v3 = dword_2700391C0;
  int v2 = unk_2700391C4;
  if ((dword_2700391C0 & ~v1) == 0) {
    int v3 = 0;
  }
  int v4 = v3 | v1;
  if ((unk_2700391C4 & ~v4) == 0) {
    int v2 = 0;
  }
  dword_2698C9028 = v2 | v4;
}

uint64_t sub_24E28C624()
{
  uint64_t v1 = 0x75626F746F72702ELL;
  if (*v0 != 1) {
    uint64_t v1 = 0x6D6F747375632ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696C61697265732ELL;
  }
}

void StateCaptureStateData.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StateCaptureStateData.init(type:title:data:)@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(unsigned char *)a6 = *result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

uint64_t StateCaptureStateData.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  sub_24E28D970();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  swift_bridgeObjectRetain();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E28D760();
  sub_24E2856B8(v1, v2);
  sub_24E28D5D0();
  sub_24E28D760();
  swift_bridgeObjectRelease();
  sub_24E285710(v1, v2);
  sub_24E28D760();
  return 0x203A657079745BLL;
}

unint64_t StateCaptureHandle.description.getter()
{
  return 0xD000000000000017;
}

void os_state_add_handler(queue:block:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v9[4] = sub_24E28CEF0;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_24E28CE0C;
  v9[3] = &block_descriptor_1;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  uint64_t v8 = os_state_add_handler();
  _Block_release(v7);
  *(void *)a3 = v8;
  *(unsigned char *)(a3 + 8) = v8 == 0;
}

_DWORD *sub_24E28CA48(int *a1, void (*a2)(void *__return_ptr, int *))
{
  int v4 = *a1;
  uint64_t v5 = *((void *)a1 + 1);
  unsigned int v7 = a1[4];
  int v6 = a1[5];
  if (v5)
  {
    uint64_t v5 = sub_24E28D770();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  unsigned int v10 = 0x2010002u >> (8 * v7);
  int v18 = v4;
  uint64_t v19 = v5;
  uint64_t v20 = v9;
  if (v7 >= 4) {
    LOBYTE(v10) = 2;
  }
  char v21 = v10;
  int v22 = v6;
  a2(v23, &v18);
  swift_bridgeObjectRelease();
  uint64_t v11 = v24;
  if (!v24) {
    return 0;
  }
  uint64_t v12 = v23[0];
  uint64_t v13 = v23[1];
  uint64_t v14 = v25;
  unint64_t v15 = v26;
  uint64_t v16 = sub_24E28CB38();
  sub_24E28D474(v12, v13, v11, v14, v15);
  return v16;
}

_DWORD *sub_24E28CB38()
{
  int v1 = *v0;
  uint64_t v2 = *((void *)v0 + 3);
  unint64_t v3 = *((void *)v0 + 4);
  unint64_t v4 = v3 >> 62;
  uint64_t v5 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      LODWORD(v5) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2)) {
        goto LABEL_21;
      }
      uint64_t v5 = (int)v5;
LABEL_6:
      if (__OFADD__(v5, 200))
      {
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        sub_24E28DA00();
        __break(1u);
LABEL_28:
        sub_24E28D9F0();
        __break(1u);
        JUMPOUT(0x24E28CDDCLL);
      }
      uint64_t v9 = calloc(v5 + 200, 1uLL);
      if (!v9) {
        goto LABEL_27;
      }
      unsigned int v10 = v9;
      *uint64_t v9 = v1 + 1;
      uint64_t v11 = (char *)(v9 + 34);
      LODWORD(v12) = 0;
      switch((int)v4)
      {
        case 1:
          LODWORD(v12) = HIDWORD(v2) - v2;
          if (__OFSUB__(HIDWORD(v2), v2)) {
            goto LABEL_23;
          }
          unint64_t v12 = (int)v12;
LABEL_13:
          if ((v12 & 0x8000000000000000) != 0 || HIDWORD(v12)) {
            goto LABEL_28;
          }
LABEL_15:
          v9[1] = v12;
          uint64_t v15 = sub_24E28D740();
          strlcpy(v11, (const char *)(v15 + 32), 0x40uLL);
          swift_release();
          switch((int)v4)
          {
            case 0:
            case 3:
              goto LABEL_19;
            case 1:
              if (!__OFSUB__(HIDWORD(v2), v2)) {
                goto LABEL_19;
              }
              goto LABEL_25;
            case 2:
              if (__OFSUB__(*(void *)(v2 + 24), *(void *)(v2 + 16))) {
                goto LABEL_26;
              }
LABEL_19:
              sub_24E28D5E0();
              return v10;
            default:
              JUMPOUT(0);
          }
        case 2:
          uint64_t v14 = *(void *)(v2 + 16);
          uint64_t v13 = *(void *)(v2 + 24);
          BOOL v8 = __OFSUB__(v13, v14);
          unint64_t v12 = v13 - v14;
          if (!v8) {
            goto LABEL_13;
          }
          goto LABEL_24;
        case 3:
          goto LABEL_15;
        default:
          LODWORD(v12) = BYTE6(v3);
          goto LABEL_15;
      }
    case 2uLL:
      uint64_t v7 = *(void *)(v2 + 16);
      uint64_t v6 = *(void *)(v2 + 24);
      BOOL v8 = __OFSUB__(v6, v7);
      uint64_t v5 = v6 - v7;
      if (!v8) {
        goto LABEL_6;
      }
      goto LABEL_22;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v5 = BYTE6(v3);
      goto LABEL_6;
  }
}

uint64_t sub_24E28CE0C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v4 = v3(a2);
  swift_release();
  return v4;
}

uint64_t os_state_remove_handler(_:)(void *a1)
{
  return MEMORY[0x270EDAA80](*a1);
}

unint64_t sub_24E28CE64()
{
  unint64_t result = qword_2698C9030;
  if (!qword_2698C9030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C9030);
  }
  return result;
}

uint64_t sub_24E28CEB8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

_DWORD *sub_24E28CEF0(int *a1)
{
  return sub_24E28CA48(a1, *(void (**)(void *__return_ptr, int *))(v1 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_24E28CF14()
{
  unint64_t result = qword_2698C9038;
  if (!qword_2698C9038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C9038);
  }
  return result;
}

unint64_t sub_24E28CF6C()
{
  unint64_t result = qword_2698C9040;
  if (!qword_2698C9040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C9040);
  }
  return result;
}

unint64_t sub_24E28CFC4()
{
  unint64_t result = qword_2698C9048;
  if (!qword_2698C9048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C9048);
  }
  return result;
}

unint64_t sub_24E28D01C()
{
  unint64_t result = qword_2698C9050;
  if (!qword_2698C9050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C9050);
  }
  return result;
}

unint64_t sub_24E28D074()
{
  unint64_t result = qword_2698C9058;
  if (!qword_2698C9058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C9058);
  }
  return result;
}

unint64_t sub_24E28D0CC()
{
  unint64_t result = qword_2698C9060;
  if (!qword_2698C9060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698C9060);
  }
  return result;
}

unsigned char *_s13NonModularSPI19StateCaptureHintAPIOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x24E28D224);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t initializeWithCopy for StateCaptureStateData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  unint64_t v5 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_24E2856B8(v4, v5);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithCopy for StateCaptureStateData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  unint64_t v4 = *(void *)(a2 + 32);
  sub_24E2856B8(v5, v4);
  uint64_t v6 = *(void *)(a1 + 24);
  unint64_t v7 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v4;
  sub_24E285710(v6, v7);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StateCaptureStateData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a1 + 24);
  unint64_t v6 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  sub_24E285710(v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for StateCaptureHandle()
{
  return &type metadata for StateCaptureHandle;
}

void sub_24E28D474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
    sub_24E285710(a4, a5);
  }
}

Swift::Bool __swiftcall TMIsAutomaticTimeEnabled()()
{
  return TMIsAutomaticTimeEnabled() != 0;
}

BOOL TMGetReferenceTime(_:_:_:)()
{
  return TMGetReferenceTime() != 0;
}

uint64_t sub_24E28D530()
{
  return MEMORY[0x270F28C88]();
}

uint64_t sub_24E28D540()
{
  return MEMORY[0x270F28D10]();
}

uint64_t sub_24E28D550()
{
  return MEMORY[0x270F28D18]();
}

uint64_t sub_24E28D560()
{
  return MEMORY[0x270F28D20]();
}

uint64_t sub_24E28D570()
{
  return MEMORY[0x270F28D68]();
}

uint64_t sub_24E28D580()
{
  return MEMORY[0x270F28DD8]();
}

uint64_t sub_24E28D590()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_24E28D5A0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24E28D5B0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24E28D5C0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24E28D5D0()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_24E28D5E0()
{
  return MEMORY[0x270EF0268]();
}

uint64_t sub_24E28D5F0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_24E28D600()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_24E28D610()
{
  return MEMORY[0x270F28E48]();
}

uint64_t sub_24E28D620()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_24E28D630()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24E28D640()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24E28D650()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24E28D660()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24E28D670()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24E28D680()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24E28D690()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24E28D6A0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24E28D6B0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24E28D6C0()
{
  return MEMORY[0x270F9D010]();
}

uint64_t sub_24E28D6D0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24E28D6E0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24E28D6F0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24E28D700()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_24E28D710()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24E28D720()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24E28D730()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24E28D740()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24E28D750()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24E28D760()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24E28D770()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24E28D780()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24E28D790()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_24E28D7A0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24E28D7B0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_24E28D7C0()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_24E28D7D0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E28D7E0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24E28D7F0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24E28D800()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_24E28D810()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24E28D820()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24E28D830()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24E28D840()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24E28D850()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24E28D860()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24E28D870()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24E28D880()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24E28D890()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24E28D8A0()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_24E28D8B0()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_24E28D8C0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24E28D8D0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24E28D8E0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24E28D8F0()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_24E28D900()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_24E28D910()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_24E28D920()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_24E28D930()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24E28D950()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24E28D960()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24E28D970()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24E28D980()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24E28D990()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24E28D9A0()
{
  return MEMORY[0x270FA2160]();
}

uint64_t sub_24E28D9B0()
{
  return MEMORY[0x270FA2198]();
}

uint64_t sub_24E28D9C0()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24E28D9D0()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24E28D9E0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24E28D9F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24E28DA00()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24E28DA10()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24E28DA20()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24E28DA30()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24E28DA40()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24E28DA50()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_24E28DA60()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24E28DA70()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_24E28DA80()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_24E28DA90()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24E28DAA0()
{
  return MEMORY[0x270F28EC0]();
}

uint64_t sub_24E28DAB0()
{
  return MEMORY[0x270F28EC8]();
}

uint64_t sub_24E28DAC0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24E28DAD0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24E28DAE0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24E28DAF0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24E28DB00()
{
  return MEMORY[0x270EF26E0]();
}

uint64_t sub_24E28DB10()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24E28DB20()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24E28DB30()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24E28DB40()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24E28DB50()
{
  return MEMORY[0x270EF27A0]();
}

uint64_t sub_24E28DB60()
{
  return MEMORY[0x270F28ED8]();
}

uint64_t sub_24E28DB70()
{
  return MEMORY[0x270F28EE0]();
}

uint64_t sub_24E28DB80()
{
  return MEMORY[0x270EF2948]();
}

uint64_t sub_24E28DB90()
{
  return MEMORY[0x270EF2980]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

uint64_t TMGetReferenceTime()
{
  return MEMORY[0x270F23998]();
}

uint64_t TMIsAutomaticTimeEnabled()
{
  return MEMORY[0x270F239A0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
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

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}