void sub_1D499B8F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D499BBF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D499BCF8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D499C08C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMMLogEventEndDateAfterStartDate(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = [MEMORY[0x1E4F1C9C8] date];
  if ([v2 compare:v1] == -1)
  {
    v3 = (void *)MEMORY[0x1D944E970]();
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = HMFGetLogIdentifier();
      int v8 = 138543874;
      v9 = v5;
      __int16 v10 = 2114;
      v11 = v2;
      __int16 v12 = 2114;
      id v13 = v1;
      _os_log_impl(&dword_1D4999000, v4, OS_LOG_TYPE_ERROR, "%{public}@Log event end date %{public}@ is before start date %{public}@", (uint8_t *)&v8, 0x20u);
    }
    id v6 = v1;

    v2 = v6;
  }

  return v2;
}

id MappedDisplayReasonRadarRequestFilter.__allocating_init(defaultRequestFilter:)(uint64_t a1)
{
  v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason] = MEMORY[0x1E4FBC868];
  *(void *)&v3[OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id MappedDisplayReasonRadarRequestFilter.init(defaultRequestFilter:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason] = MEMORY[0x1E4FBC868];
  *(void *)&v1[OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for MappedDisplayReasonRadarRequestFilter();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for MappedDisplayReasonRadarRequestFilter()
{
  return self;
}

uint64_t sub_1D499C2C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = (uint64_t *)(v3 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v7;
  uint64_t *v7 = 0x8000000000000000;
  sub_1D499CC3C(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t *v7 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1D499C388(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = (uint64_t *)(v2 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason);
  swift_beginAccess();
  uint64_t v7 = *v6;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1D499C8AC(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v10 = *(void *)(v3 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter);
    swift_unknownObjectRetain();
    return v10;
  }
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v8);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

id sub_1D499C458(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = (uint64_t *)(v2 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason);
  swift_beginAccess();
  uint64_t v7 = *v6;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1D499C8AC(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v10 = *(void **)(v3 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter);
    swift_unknownObjectRetain();
    goto LABEL_6;
  }
  uint64_t v10 = *(void **)(*(void *)(v7 + 56) + 8 * v8);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_6:
  v11 = (void *)sub_1D49B36A0();
  id v12 = objc_msgSend(v10, sel_shouldRequestRadarForDisplayReason_, v11);
  swift_unknownObjectRelease();

  return v12;
}

void sub_1D499C5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = (uint64_t *)(v2 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason);
  swift_beginAccess();
  uint64_t v7 = *v6;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1D499C8AC(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v10 = *(void **)(v3 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter);
    swift_unknownObjectRetain();
    goto LABEL_6;
  }
  uint64_t v10 = *(void **)(*(void *)(v7 + 56) + 8 * v8);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_6:
  v11 = (void *)sub_1D49B36A0();
  objc_msgSend(v10, sel_radarRequestedForDisplayReason_, v11);
  swift_unknownObjectRelease();
}

id MappedDisplayReasonRadarRequestFilter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void MappedDisplayReasonRadarRequestFilter.init()()
{
}

id MappedDisplayReasonRadarRequestFilter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MappedDisplayReasonRadarRequestFilter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1D499C8AC(uint64_t a1, uint64_t a2)
{
  sub_1D49B3720();
  sub_1D49B36C0();
  uint64_t v4 = sub_1D49B3730();
  return sub_1D499CE74(a1, a2, v4);
}

uint64_t sub_1D499C924(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD866B8);
  char v36 = a2;
  uint64_t v6 = sub_1D49B36F0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_1D49B3720();
    sub_1D49B36C0();
    uint64_t result = sub_1D49B3730();
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
  v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1D499CC3C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1D499C8AC(a2, a3);
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
    sub_1D499CF58();
LABEL_7:
    v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1D499C924(v15, a4 & 1);
  unint64_t v21 = sub_1D499C8AC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1D49B3710();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for MappedDisplayReasonRadarRequestFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MappedDisplayReasonRadarRequestFilter);
}

uint64_t dispatch thunk of MappedDisplayReasonRadarRequestFilter.__allocating_init(defaultRequestFilter:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of MappedDisplayReasonRadarRequestFilter.add(requestFilter:for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MappedDisplayReasonRadarRequestFilter.shouldRequestRadar(forDisplayReason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of MappedDisplayReasonRadarRequestFilter.radarRequested(forDisplayReason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

unint64_t sub_1D499CE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1D49B3700() & 1) == 0)
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
      while (!v14 && (sub_1D49B3700() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1D499CF58()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD866B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D49B36E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
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
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
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

uint64_t sub_1D499D154()
{
  return 1;
}

id PassThroughRadarRequestFilter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PassThroughRadarRequestFilter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PassThroughRadarRequestFilter();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for PassThroughRadarRequestFilter()
{
  return self;
}

id PassThroughRadarRequestFilter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PassThroughRadarRequestFilter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for PassThroughRadarRequestFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PassThroughRadarRequestFilter);
}

uint64_t dispatch thunk of PassThroughRadarRequestFilter.shouldRequestRadar(forDisplayReason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x50))();
}

uint64_t dispatch thunk of PassThroughRadarRequestFilter.radarRequested(forDisplayReason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

uint64_t MinimumTimeIntervalRadarRequestFilterPreferencesStorage.__allocating_init(lastRequestDateKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  MinimumTimeIntervalRadarRequestFilterPreferencesStorage.init(lastRequestDateKey:)(a1, a2);
  return v4;
}

uint64_t MinimumTimeIntervalRadarRequestFilterPreferencesStorage.init(lastRequestDateKey:)(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD865D0);
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D49B3690();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  uint64_t v11 = self;
  swift_bridgeObjectRetain();
  id v12 = objc_msgSend(v11, sel_standardUserDefaults);
  int64_t v13 = (void *)sub_1D49B36A0();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_objectForKey_, v13);

  if (v14)
  {
    sub_1D49B36D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_1D499D5F8((uint64_t)v18, (uint64_t)v19);
  if (!v20)
  {
    sub_1D499D660((uint64_t)v19, &qword_1EBD866C8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_8;
  }
  int v15 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, v15 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_8:
    sub_1D49B3650();
    sub_1D499D660((uint64_t)v6, (uint64_t *)&unk_1EBD865D0);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    goto LABEL_9;
  }
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v16(v10, v6, v7);
LABEL_9:
  v16((char *)(v2+ OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate), v10, v7);
  return v2;
}

uint64_t sub_1D499D5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD866C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D499D660(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D499D6EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  swift_beginAccess();
  uint64_t v4 = sub_1D49B3690();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_1D499D774(uint64_t a1)
{
  sub_1D49B3690();
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return sub_1D499D8C4((uint64_t)v3);
}

uint64_t sub_1D499D840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  swift_beginAccess();
  uint64_t v4 = sub_1D49B3690();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1D499D8C4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1D49B3690();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v2 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(v8, a1, v4);
  swift_endAccess();
  id v9 = objc_msgSend(self, sel_standardUserDefaults);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v10 = (void *)sub_1D49B3670();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v7, v4);
  id v12 = (void *)sub_1D49B36A0();
  objc_msgSend(v9, sel_setObject_forKey_, v10, v12);

  return ((uint64_t (*)(uint64_t, uint64_t))v11)(a1, v4);
}

void (*sub_1D499DA70(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = sub_1D49B3690();
  v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  uint64_t v6 = malloc(*(void *)(v5 + 64));
  uint64_t v7 = OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  v3[6] = v6;
  v3[7] = v7;
  swift_beginAccess();
  return sub_1D499DB3C;
}

void sub_1D499DB3C(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if (a2)
  {
    uint64_t v4 = (void *)v3[6];
  }
  else
  {
    uint64_t v4 = (void *)v3[6];
    uint64_t v5 = v3[4];
    uint64_t v6 = v3[5];
    uint64_t v7 = v3[3] + v3[7];
    id v8 = objc_msgSend(self, sel_standardUserDefaults);
    (*(void (**)(void *, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    id v9 = (void *)sub_1D49B3670();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
    uint64_t v10 = (void *)sub_1D49B36A0();
    objc_msgSend(v8, sel_setObject_forKey_, v9, v10);
  }
  free(v4);
  free(v3);
}

uint64_t MinimumTimeIntervalRadarRequestFilterPreferencesStorage.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  uint64_t v2 = sub_1D49B3690();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t MinimumTimeIntervalRadarRequestFilterPreferencesStorage.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  uint64_t v2 = sub_1D49B3690();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1D499DD60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  swift_beginAccess();
  uint64_t v4 = sub_1D49B3690();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1D499DDE8(uint64_t a1)
{
  return sub_1D499D8C4(a1);
}

void (*sub_1D499DE0C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1D499DA70(v2);
  return sub_1D499DE68;
}

void sub_1D499DE68(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

double MinimumTimeIntervalRadarRequestFilter.minimumRequestInterval.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_minimumRequestInterval);
}

uint64_t sub_1D499DEC0(uint64_t a1, void *a2)
{
  sub_1D499DF84(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_1D499E09C(v5, v3);
  return swift_endAccess();
}

uint64_t sub_1D499DF30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  return sub_1D499DF84(v3, a1);
}

uint64_t sub_1D499DF84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1D499DFE8(long long *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_1D499E09C(a1, v3);
  return swift_endAccess();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1D499E09C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t (*sub_1D499E0B4())()
{
  return j__swift_endAccess;
}

uint64_t MinimumTimeIntervalRadarRequestFilter.dateFactory.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory);
  swift_retain();
  return v1;
}

uint64_t MinimumTimeIntervalRadarRequestFilter.__allocating_init(minimumRequestInterval:lastRequestDatePreferencesKey:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for MinimumTimeIntervalRadarRequestFilterPreferencesStorage();
  uint64_t v9 = swift_allocObject();
  MinimumTimeIntervalRadarRequestFilterPreferencesStorage.init(lastRequestDateKey:)(a1, a2);
  v11[3] = v8;
  v11[4] = &protocol witness table for MinimumTimeIntervalRadarRequestFilterPreferencesStorage;
  v11[0] = v9;
  return (*(uint64_t (**)(void *, uint64_t (*)(), void, double))(v4 + 128))(v11, sub_1D499E25C, 0, a3);
}

uint64_t type metadata accessor for MinimumTimeIntervalRadarRequestFilterPreferencesStorage()
{
  uint64_t result = qword_1EBD865E0;
  if (!qword_1EBD865E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id MinimumTimeIntervalRadarRequestFilter.__allocating_init(minimumRequestInterval:filterStorage:dateFactory:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  *(double *)&v9[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_minimumRequestInterval] = a4;
  sub_1D499DF84(a1, (uint64_t)&v9[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage]);
  uint64_t v10 = &v9[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory];
  *(void *)uint64_t v10 = a2;
  *((void *)v10 + 1) = a3;
  v13.receiver = v9;
  v13.super_class = v4;
  id v11 = objc_msgSendSuper2(&v13, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v11;
}

id MinimumTimeIntervalRadarRequestFilter.init(minimumRequestInterval:filterStorage:dateFactory:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  *(double *)&v4[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_minimumRequestInterval] = a4;
  sub_1D499DF84(a1, (uint64_t)&v4[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage]);
  uint64_t v8 = &v4[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory];
  *(void *)uint64_t v8 = a2;
  *((void *)v8 + 1) = a3;
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for MinimumTimeIntervalRadarRequestFilter();
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t type metadata accessor for MinimumTimeIntervalRadarRequestFilter()
{
  return self;
}

uint64_t sub_1D499E3F4()
{
  uint64_t v1 = sub_1D49B3690();
  uint64_t v2 = MEMORY[0x1F4188790](v1 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(v0
                                  + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory))(v2);
  uint64_t v5 = v0 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = *(void *)(v5 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v5, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v4, v6, v7);
  return swift_endAccess();
}

id MinimumTimeIntervalRadarRequestFilter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void MinimumTimeIntervalRadarRequestFilter.init()()
{
}

id MinimumTimeIntervalRadarRequestFilter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MinimumTimeIntervalRadarRequestFilter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_1D499E700()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1D49B3690();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  uint64_t v9 = &v17[-v8];
  (*(void (**)(uint64_t))(v0
                                  + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory))(v7);
  uint64_t v10 = v0 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  sub_1D499DF84(v10, (uint64_t)v18);
  uint64_t v11 = v19;
  uint64_t v12 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  sub_1D49B3660();
  double v14 = v13;
  int v15 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
  v15(v6, v2);
  v15(v9, v2);
  return *(double *)(v1 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_minimumRequestInterval) <= v14;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1D499E90C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  return sub_1D499DF84(v3, a2);
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterStorage.lastRequestDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterStorage.lastRequestDate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterStorage.lastRequestDate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_1D499E9A4()
{
  return type metadata accessor for MinimumTimeIntervalRadarRequestFilterPreferencesStorage();
}

uint64_t sub_1D499E9AC()
{
  uint64_t result = sub_1D49B3690();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MinimumTimeIntervalRadarRequestFilterPreferencesStorage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MinimumTimeIntervalRadarRequestFilterPreferencesStorage);
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterPreferencesStorage.__allocating_init(lastRequestDateKey:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterPreferencesStorage.lastRequestDate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterPreferencesStorage.lastRequestDate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterPreferencesStorage.lastRequestDate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t method lookup function for MinimumTimeIntervalRadarRequestFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MinimumTimeIntervalRadarRequestFilter);
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.filterStorage.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.filterStorage.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.filterStorage.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.__allocating_init(minimumRequestInterval:filterStorage:dateFactory:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.shouldRequestRadar(forDisplayReason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.radarRequested(forDisplayReason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_1D49A01F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1D49A0688(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMMSafeHomeUUIDFromLogEvent(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [v1 homeUUID];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1D49A105C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A1E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D49A23EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMDTaggedLoggingCreateDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v22[0] = 0;
  size_t v10 = 8 * a1;
  MEMORY[0x1F4188790](a1);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v11, v10);
  MEMORY[0x1F4188790](v12);
  bzero(v11, v10);
  v22[0] = &a9;
  uint64_t v13 = 0;
  if (a1)
  {
    uint64_t v14 = a1;
    do
    {
      --v14;
      int v15 = (id *)v22[0];
      v22[0] += 8;
      objc_storeStrong((id *)&v11[8 * v13], *v15);
      uint64_t v16 = (id *)v22[0];
      v22[0] += 8;
      id v17 = *v16;
      objc_storeStrong((id *)&v11[8 * v13], *v16);
      if (v17) {
        ++v13;
      }
    }
    while (v14);
  }
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v11 forKeys:v11 count:v13];
  if (a1)
  {
    size_t v19 = v10;
    do
    {

      v19 -= 8;
    }
    while (v19);
    uint64_t v20 = v11 - 8;
    do
    {

      v10 -= 8;
    }
    while (v10);
  }
  return v18;
}

void sub_1D49A31A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A325C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A33F0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A3484(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A3514(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A369C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A37F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__512(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__513(uint64_t a1)
{
}

void sub_1D49A3C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D49A40B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D49A459C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A4AF4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A4C08(_Unwind_Exception *exception_object)
{
}

void sub_1D49A5304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D49A5818(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A62D0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A63BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A64CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A6878(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A69C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A6B5C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A6BF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A6C80(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A6E08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A6F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D49A7308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__826(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__827(uint64_t a1)
{
}

void sub_1D49A7A34(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A7C20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A7D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D49A8184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D49A8510(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A85F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A87E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A8DB0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A8EC4(_Unwind_Exception *exception_object)
{
}

void sub_1D49A96F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D49A99A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49A9B88(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMMDispatchQueueName(void *a1, void *a2)
{
  uint64_t v3 = NSString;
  uint64_t v4 = a2;
  id v5 = a1;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  if (v4) {
    uint64_t v8 = @".";
  }
  else {
    uint64_t v8 = &stru_1F2C81538;
  }
  if (v4) {
    uint64_t v9 = v4;
  }
  else {
    uint64_t v9 = &stru_1F2C81538;
  }
  uint64_t v10 = [v5 hash];

  uint64_t v11 = [v3 stringWithFormat:@"com.apple.HomeKitMetrics.%@%@%@.%tu", v7, v8, v9, v10];

  id v12 = v11;
  uint64_t v13 = [v12 UTF8String];

  return v13;
}

id getLowestError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 userInfo];
  uint64_t v3 = *MEMORY[0x1E4F28A50];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    unsigned int v7 = 0;
    do
    {
      uint64_t v8 = [v4 userInfo];
      uint64_t v9 = [v8 objectForKeyedSubscript:v3];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;

      if (!v11)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        id v17 = [v4 domain];
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v4, "code"), 0);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }

      if (!v9) {
        break;
      }
      uint64_t v4 = v9;
    }
    while (v7++ < 3);
    if (!v9) {
      goto LABEL_15;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = [v9 domain];
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v9, "code"), 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v4 = v9;
  }
  else
  {
LABEL_15:
    id v15 = v1;
    uint64_t v4 = 0;
  }
LABEL_17:

  return v15;
}

void sub_1D49ABC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1261(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1262(uint64_t a1)
{
}

void HMMLogTagWithError(void *a1, void *a2, void *a3, void *a4)
{
  unsigned int v7 = (void *)MEMORY[0x1E4F653F0];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = a1;
  id v12 = [v7 currentTagProcessorList];
  _HMMLogTagActivityWithError(v11, v10, v9, v8, 0, 0, v12);
}

void _HMMLogTagActivityWithError(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v119 = v13;
  v120 = v14;
  if (v14)
  {
    uint64_t v20 = [v14 userInfo];
    id v117 = v18;
    id v118 = v15;
    v116 = v20;
    if (v20
      && ([v20 objectForKey:*MEMORY[0x1E4F28A50]], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int64_t v22 = (HMMTaggedEvent *)v21;
      unint64_t v23 = (void *)MEMORY[0x1D944E970]();
      id v24 = v119;
      HMFGetOSLogHandle();
      v26 = BOOL v25 = v17;
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      id v110 = v16;
      v111 = v25;
      id v114 = v19;
      if (v25)
      {
        unint64_t v28 = 0x1E4F28000;
        if (v27)
        {
          v29 = HMFGetLogIdentifier();
          uint64_t v30 = [v14 domain];
          uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v14, "code"));
          [(HMMTaggedEvent *)v22 domain];
          uint64_t v32 = v112 = v23;
          uint64_t v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HMMTaggedEvent code](v22, "code"));
          *(_DWORD *)buf = 138546434;
          v122 = v29;
          __int16 v123 = 2114;
          id v124 = v118;
          __int16 v125 = 2112;
          id v126 = v16;
          __int16 v127 = 2114;
          v128 = @"errorDomain";
          __int16 v129 = 2112;
          v130 = v30;
          __int16 v131 = 2114;
          v132 = @"errorCode";
          __int16 v133 = 2112;
          v134 = v31;
          __int16 v135 = 2114;
          v136 = @"underlyingErrorDomain";
          __int16 v137 = 2112;
          v138 = v32;
          __int16 v139 = 2114;
          v140 = @"underlyingErrorCode";
          __int16 v141 = 2112;
          v142 = v33;
          __int16 v143 = 2114;
          v144 = v111;
          __int16 v145 = 2112;
          id v146 = v18;
          _os_log_impl(&dword_1D4999000, v26, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x84u);

          unint64_t v23 = v112;
          unint64_t v28 = 0x1E4F28000uLL;
        }

        int64_t v34 = +[HMMTagManager sharedInstance];
        v113 = v22;
        uint64_t v35 = [HMMTaggedEvent alloc];
        uint64_t v36 = [v120 domain];
        v37 = objc_msgSend(*(id *)(v28 + 3792), "numberWithInteger:", objc_msgSend(v120, "code"));
        v38 = [(HMMTaggedEvent *)v113 domain];
        objc_msgSend(*(id *)(v28 + 3792), "numberWithInteger:", -[HMMTaggedEvent code](v113, "code"));
        v108 = id v17 = v111;
        v39 = (void *)v36;
        v47 = HMDTaggedLoggingCreateDictionary(5, v40, v41, v42, v43, v44, v45, v46, @"errorDomain");
        id v15 = v118;
        v48 = [(HMMTaggedEvent *)v35 initWithTag:v118 data:v47];
        id v19 = v114;
        [v34 submitTaggedEvent:v48 processorList:v114];

        id v16 = v110;
        v49 = v113;
        goto LABEL_22;
      }
      if (v27)
      {
        v88 = HMFGetLogIdentifier();
        v89 = [v14 domain];
        v90 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v14, "code"));
        [(HMMTaggedEvent *)v22 domain];
        v92 = v91 = v23;
        v93 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HMMTaggedEvent code](v22, "code"));
        *(_DWORD *)buf = 138545922;
        v122 = v88;
        __int16 v123 = 2114;
        id v124 = v118;
        __int16 v125 = 2112;
        id v126 = v16;
        __int16 v127 = 2114;
        v128 = @"errorDomain";
        __int16 v129 = 2112;
        v130 = v89;
        __int16 v131 = 2114;
        v132 = @"errorCode";
        __int16 v133 = 2112;
        v134 = v90;
        __int16 v135 = 2114;
        v136 = @"underlyingErrorDomain";
        __int16 v137 = 2112;
        v138 = v92;
        __int16 v139 = 2114;
        v140 = @"underlyingErrorCode";
        __int16 v141 = 2112;
        v142 = v93;
        _os_log_impl(&dword_1D4999000, v26, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x70u);

        unint64_t v23 = v91;
      }

      v94 = +[HMMTagManager sharedInstance];
      v95 = [HMMTaggedEvent alloc];
      uint64_t v96 = [v120 domain];
      v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v120, "code"));
      v38 = [(HMMTaggedEvent *)v22 domain];
      v109 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HMMTaggedEvent code](v22, "code"));
      v39 = (void *)v96;
      v104 = HMDTaggedLoggingCreateDictionary(4, v97, v98, v99, v100, v101, v102, v103, @"errorDomain");
      uint64_t v105 = [(HMMTaggedEvent *)v95 initWithTag:v118 data:v104];
      v106 = v22;
      v107 = (void *)v105;
      int64_t v34 = v94;
      [v94 submitTaggedEvent:v105 processorList:v114];

      v49 = v106;
      id v19 = v114;

      id v15 = v118;
      id v17 = 0;
    }
    else
    {
      v50 = (void *)MEMORY[0x1D944E970]();
      id v51 = v13;
      v52 = HMFGetOSLogHandle();
      BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
      if (v17)
      {
        if (v53)
        {
          v54 = HMFGetLogIdentifier();
          [v14 domain];
          id v115 = v19;
          v56 = v55 = v17;
          v57 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v14, "code"));
          *(_DWORD *)buf = 138545410;
          v122 = v54;
          __int16 v123 = 2114;
          id v124 = v118;
          __int16 v125 = 2112;
          id v126 = v16;
          __int16 v127 = 2114;
          v128 = @"errorDomain";
          __int16 v129 = 2112;
          v130 = v56;
          __int16 v131 = 2114;
          v132 = @"errorCode";
          __int16 v133 = 2112;
          v134 = v57;
          __int16 v135 = 2114;
          v136 = v55;
          __int16 v137 = 2112;
          v138 = v117;
          _os_log_impl(&dword_1D4999000, v52, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);

          id v17 = v55;
          id v19 = v115;
        }
        v49 = +[HMMTagManager sharedInstance];
        v58 = [HMMTaggedEvent alloc];
        uint64_t v59 = [v14 domain];
        objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v14, "code"));
        v39 = id v18 = v117;
        int64_t v34 = (void *)v59;
        v37 = HMDTaggedLoggingCreateDictionary(3, v60, v61, v62, v63, v64, v65, v66, @"errorDomain");
        id v15 = v118;
        v38 = [(HMMTaggedEvent *)v58 initWithTag:v118 data:v37];
        [(HMMTaggedEvent *)v49 submitTaggedEvent:v38 processorList:v19];
        goto LABEL_22;
      }
      if (v53)
      {
        v76 = HMFGetLogIdentifier();
        v77 = [v14 domain];
        v78 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v14, "code"));
        *(_DWORD *)buf = 138544898;
        v122 = v76;
        __int16 v123 = 2114;
        id v124 = v118;
        __int16 v125 = 2112;
        id v126 = v16;
        __int16 v127 = 2114;
        v128 = @"errorDomain";
        __int16 v129 = 2112;
        v130 = v77;
        __int16 v131 = 2114;
        v132 = @"errorCode";
        __int16 v133 = 2112;
        v134 = v78;
        _os_log_impl(&dword_1D4999000, v52, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);

        id v17 = 0;
      }

      v49 = +[HMMTagManager sharedInstance];
      v79 = [HMMTaggedEvent alloc];
      uint64_t v80 = [v14 domain];
      v39 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v14, "code"));
      int64_t v34 = (void *)v80;
      v37 = HMDTaggedLoggingCreateDictionary(2, v81, v82, v83, v84, v85, v86, v87, @"errorDomain");
      id v15 = v118;
      v38 = [(HMMTaggedEvent *)v79 initWithTag:v118 data:v37];
      [(HMMTaggedEvent *)v49 submitTaggedEvent:v38 processorList:v19];
    }
    id v18 = v117;
LABEL_22:

    v74 = v116;
    goto LABEL_23;
  }
  v67 = (void *)MEMORY[0x1D944E970]();
  id v68 = v13;
  v69 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v70 = v18;
    id v71 = v19;
    v73 = id v72 = v16;
    *(_DWORD *)buf = 138543874;
    v122 = v73;
    __int16 v123 = 2114;
    id v124 = v15;
    __int16 v125 = 2112;
    id v126 = v72;
    _os_log_impl(&dword_1D4999000, v69, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\"", buf, 0x20u);

    id v16 = v72;
    id v19 = v71;
    id v18 = v70;
  }

  v74 = +[HMMTagManager sharedInstance];
  v75 = [HMMTaggedEvent alloc];
  v49 = [(HMMTaggedEvent *)v75 initWithTag:v15 data:MEMORY[0x1E4F1CC08]];
  [v74 submitTaggedEvent:v49 processorList:v19];
LABEL_23:
}

void HMMLogTagActivityWithError(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = a1;
  id v13 = [a5 tagProcessorList];
  _HMMLogTagActivityWithError(v12, v11, v10, v9, 0, 0, v13);
}

void HMMLogTagWithErrorAndField(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = (void *)MEMORY[0x1E4F653F0];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = a2;
  id v17 = a1;
  id v18 = [v11 currentTagProcessorList];
  _HMMLogTagActivityWithError(v17, v16, v15, v14, v13, v12, v18);
}

void HMMLogTagActivityWithErrorAndField(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = a2;
  id v18 = a1;
  id v19 = [a7 tagProcessorList];
  _HMMLogTagActivityWithError(v18, v17, v16, v15, v14, v13, v19);
}

void sub_1D49B13BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B1470(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B16D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B18C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B1938(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B1B30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B1D58(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B1FA4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B20A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B25CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B29B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B2F08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D49B33A0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D49B3650()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1D49B3660()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1D49B3670()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1D49B3680()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1D49B3690()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1D49B36A0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D49B36B0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D49B36C0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D49B36D0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D49B36E0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1D49B36F0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D49B3700()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D49B3710()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D49B3720()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D49B3730()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1F411CB30]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x1F411CB70]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x1F411CB78]();
}

uint64_t HMFIsInternalBuild()
{
  return MEMORY[0x1F411CB80]();
}

uint64_t HMFUptime()
{
  return MEMORY[0x1F411CBF8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x1F411CC08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}