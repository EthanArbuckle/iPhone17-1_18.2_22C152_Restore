uint64_t sub_1C2734A38@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *a1 = 1;
  v4 = type metadata accessor for SummarySharingProfileDisplayNameInputSignal.State();
  return sub_1C27365BC((uint64_t)&a1[*(int *)(v4 + 20)], a2);
}

Swift::Void __swiftcall SummarySharingProfileDisplayNameInputSignal.stopObservation()()
{
  uint64_t v1 = *(void *)(v0 + 40);
  v2 = (unsigned char *)(v1 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v1 + 16));
  v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(void *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_1C2734B34(v2);

  os_unfair_lock_unlock(v3);
}

uint64_t sub_1C2734B34(unsigned char *a1)
{
  *a1 = 0;
  uint64_t v1 = (uint64_t)&a1[*(int *)(type metadata accessor for SummarySharingProfileDisplayNameInputSignal.State() + 20)];
  sub_1C273654C(v1, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298);
  sub_1C2733298();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t SummarySharingProfileDisplayNameInputSignal.deinit()
{
  swift_unknownObjectRelease();

  swift_release();
  return v0;
}

uint64_t SummarySharingProfileDisplayNameInputSignal.__deallocating_deinit()
{
  swift_unknownObjectRelease();

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_1C2734C4C()
{
  return sub_1C277AED0();
}

uint64_t sub_1C2734C68()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1C2734C94()
{
  return _s14HealthPlatform43SummarySharingProfileDisplayNameInputSignalC16beginObservation4from14configurationsy0A13Orchestration19OptionalValueAnchorVyAA0efG0VGSg_SayAG21IdentityConfigurationVGtF_0();
}

void sub_1C2734CB8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  uint64_t v2 = (unsigned char *)(v1 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v1 + 16));
  v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(void *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_1C2734B34(v2);

  os_unfair_lock_unlock(v3);
}

uint64_t sub_1C2734D64()
{
  uint64_t v0 = sub_1C277AEE0();
  MEMORY[0x1F4188790](v0 - 8);
  sub_1C2612D30(0, &qword_1EBB83180, (uint64_t (*)(uint64_t))sub_1C265F308, MEMORY[0x1E4FBBE00]);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1C277E480;
  *(void *)(v1 + 56) = sub_1C277AEC0();
  *(void *)(v1 + 64) = sub_1C2734F58(&qword_1EBB829E8, 255, MEMORY[0x1E4F66E70]);
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v1 + 32));
  sub_1C277AED0();
  sub_1C277AEB0();
  return v1;
}

uint64_t sub_1C2734EAC()
{
  return SummarySharingProfileDisplayNameInputSignal.dependencyDidUpdate(anchors:)();
}

uint64_t sub_1C2734ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C2734F58(&qword_1EA305410, a2, (void (*)(uint64_t))type metadata accessor for SummarySharingProfileDisplayNameInputSignal);

  return MEMORY[0x1F411FB20](a1, v3);
}

uint64_t sub_1C2734F3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C2733E4C(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_1C2734F58(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_1C2734FA4(uint64_t a1, uint64_t a2)
{
  sub_1C277C020();
  unint64_t result = sub_1C277C150();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_1C2735028(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v6 = MEMORY[0x1E4FBC870];
    uint64_t v22 = MEMORY[0x1E4FBC870];
    swift_retain();
    sub_1C277C170();
    if (sub_1C277C200())
    {
      uint64_t v6 = sub_1C2644ED8(0, &qword_1EBB80DB0);
      do
      {
        swift_dynamicCast();
        char v7 = sub_1C2734778(&v21, a2);
        if (v3)
        {
          swift_release();

          swift_release_n();
          swift_release();
          return v6;
        }
        id v8 = v21;
        if (v7)
        {
          uint64_t v9 = v22;
          unint64_t v10 = *(void *)(v22 + 16);
          if (*(void *)(v22 + 24) <= v10)
          {
            sub_1C26956D0(v10 + 1);
            uint64_t v9 = v22;
          }
          uint64_t result = sub_1C277C020();
          uint64_t v12 = v9 + 56;
          uint64_t v13 = -1 << *(unsigned char *)(v9 + 32);
          unint64_t v14 = result & ~v13;
          unint64_t v15 = v14 >> 6;
          if (((-1 << v14) & ~*(void *)(v9 + 56 + 8 * (v14 >> 6))) != 0)
          {
            unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v9 + 56 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            char v17 = 0;
            unint64_t v18 = (unint64_t)(63 - v13) >> 6;
            do
            {
              if (++v15 == v18 && (v17 & 1) != 0)
              {
                __break(1u);
                return result;
              }
              BOOL v19 = v15 == v18;
              if (v15 == v18) {
                unint64_t v15 = 0;
              }
              v17 |= v19;
              uint64_t v20 = *(void *)(v12 + 8 * v15);
            }
            while (v20 == -1);
            unint64_t v16 = __clz(__rbit64(~v20)) + (v15 << 6);
          }
          *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
          *(void *)(*(void *)(v9 + 48) + 8 * v16) = v8;
          ++*(void *)(v9 + 16);
        }
        else
        {
        }
      }
      while (sub_1C277C200());
      uint64_t v6 = v22;
    }
    swift_release_n();
    swift_release();
  }
  else
  {
    swift_retain();
    uint64_t v6 = sub_1C27354C4(a1, a2);
    swift_release();
    swift_release();
  }
  return v6;
}

void sub_1C27352BC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v7 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = a3 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v22 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v11 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v12 = v11 | (v7 << 6);
LABEL_17:
    id v23 = *(id *)(*(void *)(a3 + 48) + 8 * v12);
    id v16 = v23;
    char v17 = sub_1C2734778(&v23, a4);

    if (v4) {
      return;
    }
    if (v17)
    {
      *(unint64_t *)((char *)a1 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = __OFADD__(v20++, 1);
      if (v13) {
        goto LABEL_30;
      }
    }
  }
  BOOL v13 = __OFADD__(v7++, 1);
  if (v13)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v7 >= v22) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v21 + 8 * v7);
  if (v14)
  {
LABEL_16:
    unint64_t v10 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v7 << 6);
    goto LABEL_17;
  }
  int64_t v15 = v7 + 1;
  if (v7 + 1 >= v22) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v21 + 8 * v15);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v7 + 2;
  if (v7 + 2 >= v22) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v21 + 8 * v15);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v7 + 3;
  if (v7 + 3 >= v22)
  {
LABEL_26:
    swift_retain();
    sub_1C2742370(a1, a2, v20, a3);
    return;
  }
  unint64_t v14 = *(void *)(v21 + 8 * v15);
  if (v14)
  {
LABEL_15:
    int64_t v7 = v15;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v7 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v7 >= v22) {
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v21 + 8 * v7);
    ++v15;
    if (v14) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
}

uint64_t sub_1C27354C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v16[1] = *MEMORY[0x1E4F143B8];
  char v6 = *(unsigned char *)(a1 + 32);
  unsigned int v7 = v6 & 0x3F;
  unint64_t v8 = (unint64_t)((1 << v6) + 63) >> 6;
  size_t v9 = 8 * v8;
  uint64_t isStackAllocationSafe = swift_retain_n();
  if (v7 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v16 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    swift_retain();
    sub_1C27352BC((void *)((char *)v16 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, a1, a2);
    uint64_t v12 = v11;
    swift_release();
    swift_release();
    if (v3) {
      swift_willThrow();
    }
    swift_release_n();
  }
  else
  {
    BOOL v13 = (void *)swift_slowAlloc();
    bzero(v13, v9);
    swift_retain();
    sub_1C27352BC((unint64_t *)v13, v8, a1, a2);
    uint64_t v12 = v14;
    swift_release();
    swift_release();
    MEMORY[0x1C875D230](v13, -1, -1);
    swift_release_n();
  }
  return v12;
}

uint64_t _s14HealthPlatform43SummarySharingProfileDisplayNameInputSignalC16beginObservation4from14configurationsy0A13Orchestration19OptionalValueAnchorVyAA0efG0VGSg_SayAG21IdentityConfigurationVGtF_0()
{
  uint64_t v1 = v0;
  sub_1C2733298();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2612D30(0, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  unint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v19 - v11;
  uint64_t v13 = *(void *)(v0 + 40);
  uint64_t v14 = (unsigned char *)(v13 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v13 + 16));
  int64_t v15 = (os_unfair_lock_s *)(v13 + ((*(unsigned int *)(*(void *)v13 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v15);
  sub_1C2734A38(v14, (uint64_t)v12);
  os_unfair_lock_unlock(v15);
  sub_1C27365BC((uint64_t)v12, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v10, 1, v3) == 1)
  {
    sub_1C273654C((uint64_t)v12, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298);
    uint64_t v16 = (uint64_t)v10;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v10, v3);
    swift_getObjectType();
    v19[0] = v1;
    sub_1C2734F58(&qword_1EA305410, v17, (void (*)(uint64_t))type metadata accessor for SummarySharingProfileDisplayNameInputSignal);
    sub_1C277AE40();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v16 = (uint64_t)v12;
  }
  return sub_1C273654C(v16, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298);
}

uint64_t sub_1C27359BC(uint64_t a1, uint64_t a2)
{
  return sub_1C2734F58(&qword_1EA305418, a2, (void (*)(uint64_t))type metadata accessor for SummarySharingProfileDisplayNameInputSignal);
}

uint64_t sub_1C2735A04()
{
  return sub_1C2734F58(&qword_1EA305420, 255, (void (*)(uint64_t))sub_1C2733298);
}

uint64_t method lookup function for SummarySharingProfileDisplayNameInputSignal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SummarySharingProfileDisplayNameInputSignal);
}

uint64_t dispatch thunk of SummarySharingProfileDisplayNameInputSignal.__allocating_init(observer:healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t *sub_1C2735A7C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    char v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    sub_1C2733298();
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v8))
    {
      sub_1C2612D30(0, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
      memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v10 + 16))(v6, v7, v9);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_1C2735C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  sub_1C2733298();
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v2, 1, v3);
  if (!result)
  {
    char v6 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
    return v6(v2, v4);
  }
  return result;
}

unsigned char *sub_1C2735CE0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  char v6 = &a2[v4];
  sub_1C2733298();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v7))
  {
    sub_1C2612D30(0, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
    memcpy(v5, v6, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16))(v5, v6, v8);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  }
  return a1;
}

unsigned char *sub_1C2735E20(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  char v6 = &a2[v4];
  sub_1C2733298();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t v10 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v5, 1, v7);
  int v12 = v10(v6, 1, v8);
  if (!v11)
  {
    if (!v12)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 24))(v5, v6, v8);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v5, v8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    sub_1C2612D30(0, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
    memcpy(v5, v6, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16))(v5, v6, v8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  return a1;
}

unsigned char *sub_1C2735FC4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  char v6 = &a2[v4];
  sub_1C2733298();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v7))
  {
    sub_1C2612D30(0, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
    memcpy(v5, v6, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 32))(v5, v6, v8);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  }
  return a1;
}

unsigned char *sub_1C2736104(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  char v6 = &a2[v4];
  sub_1C2733298();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t v10 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v5, 1, v7);
  int v12 = v10(v6, 1, v8);
  if (!v11)
  {
    if (!v12)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 40))(v5, v6, v8);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v5, v8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    sub_1C2612D30(0, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
    memcpy(v5, v6, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 32))(v5, v6, v8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  return a1;
}

uint64_t sub_1C27362A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C27362BC);
}

uint64_t sub_1C27362BC(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1C2612D30(0, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
    int v11 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = &a1[*(int *)(a3 + 20)];
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1C273639C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C27363B0);
}

unsigned char *sub_1C27363B0(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    sub_1C2612D30(0, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1C2736484()
{
  sub_1C2612D30(319, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1C273654C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1C2612D30(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1C27365BC(uint64_t a1, uint64_t a2)
{
  sub_1C2612D30(0, &qword_1EA305428, (uint64_t (*)(uint64_t))sub_1C2733298, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2736650(uint64_t a1, uint64_t (*a2)(uint64_t *))
{
  uint64_t v3 = a1;
  return a2(&v3);
}

uint64_t sub_1C2736688(void *a1, uint64_t (*a2)(void))
{
  return a2(*a1);
}

void *MockFeedItemStorage.__allocating_init()()
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = sub_1C2737B1C;
  result[3] = 0;
  result[4] = sub_1C2737B1C;
  result[5] = 0;
  result[6] = sub_1C2736ADC;
  result[7] = 0;
  result[8] = sub_1C2736E30;
  result[9] = 0;
  return result;
}

uint64_t sub_1C2736728@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_1C2737B60;
  a2[1] = v6;
  return swift_retain();
}

uint64_t sub_1C27367A8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  swift_beginAccess();
  *(void *)(v6 + 16) = sub_1C2737B5C;
  *(void *)(v6 + 24) = v5;
  swift_retain();
  return swift_release();
}

uint64_t sub_1C2736838()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t sub_1C2736884(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_release();
}

uint64_t sub_1C27368D8@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)(uint64_t *a1, uint64_t *a2)@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(v3 + 40);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_1C2737AE4;
  a2[1] = (uint64_t (*)(uint64_t *, uint64_t *))v6;
  return swift_retain();
}

uint64_t sub_1C2736958(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  swift_beginAccess();
  *(void *)(v6 + 32) = sub_1C2737AAC;
  *(void *)(v6 + 40) = v5;
  swift_retain();
  return swift_release();
}

uint64_t sub_1C27369E8()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t sub_1C2736A34(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return swift_release();
}

uint64_t (*sub_1C2736A88())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C2736ADC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2(0);
}

uint64_t sub_1C2736B08@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)(uint64_t *a1, uint64_t *a2)@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 48);
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_1C2737A3C;
  a2[1] = (uint64_t (*)(uint64_t *, uint64_t *))v6;
  return swift_retain();
}

uint64_t sub_1C2736B88(uint64_t *a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *a1;
  uint64_t v10 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  swift_retain();
  a3(v8, a6, v11);

  return swift_release();
}

uint64_t sub_1C2736C18(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  swift_beginAccess();
  *(void *)(v6 + 48) = sub_1C27379D8;
  *(void *)(v6 + 56) = v5;
  swift_retain();
  return swift_release();
}

uint64_t sub_1C2736CA8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *, void *), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = a1;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  v13[0] = a7;
  v13[1] = v11;
  swift_retain();
  a4(&v14, v13);

  return swift_release();
}

uint64_t sub_1C2736D3C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t sub_1C2736D88(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return swift_release();
}

uint64_t (*sub_1C2736DDC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C2736E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void))
{
  return a5(MEMORY[0x1E4FBC860], 0);
}

uint64_t sub_1C2736E64@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)(uint64_t *a1, uint64_t *a2)@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v4 = *(void *)(v3 + 72);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_1C27379D0;
  a2[1] = (uint64_t (*)(uint64_t *, uint64_t *))v6;
  return swift_retain();
}

uint64_t sub_1C2736EE4(uint64_t *a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t a1, char a2), uint64_t))
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v9 = *((unsigned __int8 *)a1 + 24);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = v7;
  swift_retain();
  a3(v4, v5, v6, v9, sub_1C26E44D0, v10);

  return swift_release();
}

uint64_t sub_1C2736FA0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  swift_beginAccess();
  *(void *)(v6 + 64) = sub_1C27379C8;
  *(void *)(v6 + 72) = v5;
  swift_retain();
  return swift_release();
}

uint64_t sub_1C2737030(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, void (*a7)(void *, void *))
{
  v13[0] = a1;
  v13[1] = a2;
  void v13[2] = a3;
  char v14 = a4;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a5;
  *(void *)(v10 + 24) = a6;
  v12[0] = sub_1C26B33A0;
  v12[1] = v10;
  swift_retain();
  a7(v13, v12);

  return swift_release();
}

uint64_t sub_1C27370DC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t sub_1C2737128(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return swift_release();
}

uint64_t (*sub_1C273717C())()
{
  return j__swift_endAccess;
}

uint64_t sub_1C27371D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  swift_retain();
  v7(a1, a2, a3);
  return swift_release();
}

uint64_t sub_1C273724C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  swift_retain();
  v7(a1, a2, a3);
  return swift_release();
}

uint64_t sub_1C27372C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_beginAccess();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 64);
  swift_retain();
  v13(a1, a2, a3, a4, a5, a6);
  return swift_release();
}

uint64_t sub_1C2737364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  swift_retain();
  v7(a1, a2, a3);
  return swift_release();
}

void *MockFeedItemStorage.init()()
{
  uint64_t result = v0;
  v0[2] = sub_1C2737B1C;
  v0[3] = 0;
  v0[4] = sub_1C2737B1C;
  v0[5] = 0;
  v0[6] = sub_1C2736ADC;
  v0[7] = 0;
  v0[8] = sub_1C2736E30;
  v0[9] = 0;
  return result;
}

uint64_t MockFeedItemStorage.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t MockFeedItemStorage.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_1C27374C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  swift_beginAccess();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  swift_retain();
  v8(a1, a2, a3);
  return swift_release();
}

uint64_t sub_1C2737540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  swift_beginAccess();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  swift_retain();
  v8(a1, a2, a3);
  return swift_release();
}

uint64_t sub_1C27375C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  swift_beginAccess();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  swift_retain();
  v8(a1, a2, a3);
  return swift_release();
}

uint64_t sub_1C2737640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *v6;
  swift_beginAccess();
  char v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 64);
  swift_retain();
  v14(a1, a2, a3, a4, a5, a6);
  return swift_release();
}

uint64_t type metadata accessor for MockFeedItemStorage()
{
  return self;
}

uint64_t method lookup function for MockFeedItemStorage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MockFeedItemStorage);
}

uint64_t dispatch thunk of MockFeedItemStorage.replaceExistingHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MockFeedItemStorage.replaceExistingHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MockFeedItemStorage.replaceExistingHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MockFeedItemStorage.updateOrCreateHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MockFeedItemStorage.updateOrCreateHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of MockFeedItemStorage.updateOrCreateHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of MockFeedItemStorage.deleteHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of MockFeedItemStorage.deleteHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of MockFeedItemStorage.deleteHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of MockFeedItemStorage.fetchHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of MockFeedItemStorage.fetchHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of MockFeedItemStorage.fetchHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of MockFeedItemStorage.replaceExisting(with:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of MockFeedItemStorage.updateOrCreate(_:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of MockFeedItemStorage.fetch(matching:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of MockFeedItemStorage.delete(feedItemIdentifiers:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of MockFeedItemStorage.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_1C2737990()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C27379C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  return sub_1C2737030(a1, a2, a3, a4, a5, a6, *(void (**)(void *, void *))(v6 + 16));
}

uint64_t sub_1C27379D0(uint64_t *a1, uint64_t *a2)
{
  return sub_1C2736EE4(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, char), uint64_t))(v2 + 16));
}

uint64_t sub_1C27379D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1C2736CA8(a1, a2, a3, *(void (**)(uint64_t *, void *))(v3 + 16), *(void *)(v3 + 24), (uint64_t)&unk_1F1DCF078, (uint64_t)sub_1C2737A10);
}

uint64_t sub_1C2737A10(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1C2737A3C(uint64_t *a1, uint64_t *a2)
{
  return sub_1C2736B88(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24), (uint64_t)&unk_1F1DCF0C8, (uint64_t)sub_1C2737A74);
}

uint64_t sub_1C2737A74(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_1C2737AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1C2736CA8(a1, a2, a3, *(void (**)(uint64_t *, void *))(v3 + 16), *(void *)(v3 + 24), (uint64_t)&unk_1F1DCF118, (uint64_t)sub_1C2737B20);
}

uint64_t sub_1C2737AE4(uint64_t *a1, uint64_t *a2)
{
  return sub_1C2736B88(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24), (uint64_t)&unk_1F1DCF168, (uint64_t)sub_1C2737B58);
}

uint64_t static FeedSection.entityName.getter()
{
  return 0x7463655364656546;
}

uint64_t sub_1C2737B88()
{
  return 0x7463655364656546;
}

uint64_t FeedSection.__allocating_init(context:identifier:)(void *a1)
{
  uint64_t v3 = self;
  uint64_t v4 = (void *)sub_1C277B820();
  id v5 = objc_msgSend(v3, sel_entityForName_inManagedObjectContext_, v4, a1);

  if (v5)
  {
    id v6 = objc_msgSend(objc_allocWithZone(v1), sel_initWithEntity_insertIntoManagedObjectContext_, v5, a1);
    uint64_t v7 = (void *)sub_1C277B820();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setIdentifier_, v7);

    return (uint64_t)v6;
  }
  else
  {
    uint64_t result = sub_1C277C560();
    __break(1u);
  }
  return result;
}

void FeedSection.diagnosticDescription.getter()
{
  uint64_t v1 = v0;
  uint64_t v31 = sub_1C277A840();
  uint64_t v2 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C277A750();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_1C277C2D0();
  swift_bridgeObjectRelease();
  strcpy((char *)v35, "FeedSection ");
  BYTE5(v35[1]) = 0;
  HIWORD(v35[1]) = -5120;
  id v9 = objc_msgSend(v0, sel_identifier);
  sub_1C277B850();

  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  id v10 = objc_msgSend(v1, sel_feed);
  id v11 = objc_msgSend(v10, sel_objectID);

  id v12 = objc_msgSend(v11, sel_URIRepresentation);
  sub_1C277A6F0();

  sub_1C277A660();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  id v13 = objc_msgSend(v1, sel_feedItems);
  id v14 = objc_msgSend(v13, sel_count);

  id v33 = v14;
  sub_1C277C7B0();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  id v15 = objc_msgSend(v1, sel_feedItems);
  sub_1C273A034(v15, (uint64_t)sub_1C273A46C, 0, (unint64_t *)&unk_1EA305470, (void (*)(uint64_t))type metadata accessor for FeedItem);
  uint64_t v17 = v16;

  if ((v17 & 0x8000000000000000) == 0 && (v17 & 0x4000000000000000) == 0)
  {
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18) {
      goto LABEL_4;
    }
LABEL_12:
    swift_release();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_1C277C5A0();
  swift_release();
  if (!v18) {
    goto LABEL_12;
  }
LABEL_4:
  if (v18 >= 1)
  {
    BOOL v19 = 0;
    unint64_t v29 = 0x80000001C278F7B0;
    unint64_t v30 = v17 & 0xC000000000000001;
    uint64_t v27 = v17;
    unint64_t v28 = 0x80000001C278F7D0;
    v26[1] = 0x80000001C278F7F0;
    do
    {
      if (v30) {
        id v20 = (id)MEMORY[0x1C875C230](v19, v17);
      }
      else {
        id v20 = *(id *)(v17 + 8 * (void)v19 + 32);
      }
      uint64_t v21 = v20;
      int64_t v22 = v19 + 1;
      id v33 = 0;
      unint64_t v34 = 0xE000000000000000;
      sub_1C277C2D0();
      sub_1C277B8D0();
      v32 = v19;
      sub_1C277C7B0();
      sub_1C277B8D0();
      swift_bridgeObjectRelease();
      sub_1C277B8D0();
      id v23 = objc_msgSend(v21, sel_uniqueIdentifier);
      sub_1C277B850();

      sub_1C277B8D0();
      swift_bridgeObjectRelease();
      sub_1C277B8D0();
      id v24 = objc_msgSend(v21, sel_dateSubmitted);
      sub_1C277A810();

      sub_1C273A758(&qword_1EBB82650, MEMORY[0x1E4F27928]);
      uint64_t v25 = v31;
      sub_1C277C7B0();
      sub_1C277B8D0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v25);
      sub_1C277B8D0();
      v32 = (char *)objc_msgSend(v21, sel_sortOrder);
      sub_1C277C7B0();
      sub_1C277B8D0();
      swift_bridgeObjectRelease();
      sub_1C277B8D0();
      v32 = (char *)objc_msgSend(v21, sel_sectionSortOrder);
      sub_1C277C7B0();
      sub_1C277B8D0();
      swift_bridgeObjectRelease();
      sub_1C277B8D0();
      sub_1C277B8D0();

      swift_bridgeObjectRelease();
      BOOL v19 = v22;
      uint64_t v17 = v27;
    }
    while ((char *)v18 != v22);
    goto LABEL_12;
  }
  __break(1u);
}

uint64_t static FeedSection.eligibleIdentifiers.getter()
{
  uint64_t v0 = sub_1C261E738((uint64_t)&unk_1F1DC5540);
  swift_arrayDestroy();
  return v0;
}

uint64_t static ForYouSectionKind.section(for:)(unsigned __int8 *a1)
{
  int v1 = *a1;
  uint64_t result = 0;
  switch(v1)
  {
    case 2:
      uint64_t result = 3;
      break;
    case 3:
      uint64_t result = 2;
      break;
    case 11:
      return result;
    case 17:
      uint64_t result = 1;
      break;
    default:
      if (qword_1EBB86258 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_1C277B130();
      __swift_project_value_buffer(v3, (uint64_t)qword_1EBB86268);
      uint64_t v4 = sub_1C277B100();
      os_log_type_t v5 = sub_1C277BD20();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        uint64_t v7 = swift_slowAlloc();
        uint64_t v10 = v7;
        *(_DWORD *)uint64_t v6 = 136315138;
        unint64_t v8 = ContentKind.rawValue.getter();
        sub_1C263FDFC(v8, v9, &v10);
        sub_1C277C0D0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C2601000, v4, v5, "No section defined for contentKind %s", v6, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C875D230](v7, -1, -1);
        MEMORY[0x1C875D230](v6, -1, -1);
      }

      uint64_t result = 4;
      break;
  }
  return result;
}

void *static ForYouSectionKind.allCases.getter()
{
  return &unk_1F1DC57C0;
}

unint64_t ForYouSectionKind.rawValue.getter(char a1)
{
  unint64_t result = 0x6867696C68676968;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x73656C6369747261;
      break;
    case 3:
      unint64_t result = 0x48726F4673707061;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C2738684(unsigned __int8 *a1, unsigned char *a2)
{
  unint64_t v2 = 0xEA00000000007374;
  uint64_t v3 = 0x6867696C68676968;
  uint64_t v4 = *a1;
  unint64_t v5 = 0x6867696C68676968;
  unint64_t v6 = 0xEA00000000007374;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0x80000001C2789370;
      unint64_t v5 = 0xD000000000000011;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x73656C6369747261;
      break;
    case 3:
      unint64_t v5 = 0x48726F4673707061;
      unint64_t v6 = 0xED000068746C6165;
      break;
    default:
      break;
  }
  switch(*a2)
  {
    case 1:
      unint64_t v2 = 0x80000001C2789370;
      if (v5 == 0xD000000000000011) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x73656C6369747261;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xED000068746C6165;
      if (v5 == 0x48726F4673707061) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_1C277C7E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1C2738840()
{
  return sub_1C277C910();
}

uint64_t sub_1C2738930()
{
  sub_1C277B8B0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2738A08()
{
  return sub_1C277C910();
}

uint64_t sub_1C2738AF4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s14HealthPlatform17ForYouSectionKindO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_1C2738B24(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xEA00000000007374;
  unint64_t v3 = 0x6867696C68676968;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0x80000001C2789370;
      unint64_t v3 = 0xD000000000000011;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x73656C6369747261;
      *(void *)(a1 + 8) = 0xE800000000000000;
      break;
    case 3:
      strcpy((char *)a1, "appsForHealth");
      *(_WORD *)(a1 + 14) = -4864;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

void sub_1C2738BD4(void *a1@<X8>)
{
  *a1 = &unk_1F1DC57E8;
}

uint64_t sub_1C2738BE4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C273A458(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_1C2738C50(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1C2738C50(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_1C277C7A0();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_1C273933C(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  uint64_t v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x1E4FBC860];
    __dst = (char *)(MEMORY[0x1E4FBC860] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x1E4FBC860] + 16);
      id v11 = (char *)MEMORY[0x1E4FBC860];
LABEL_118:
      v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_1C273940C((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v97 = sub_1C2739918((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          v100 = &v97[16 * v96 + 32];
          *(void *)v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x1E4FBC860];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_1C277BAB0();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  id v11 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    id v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_1C277C7E0();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      id v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_1C277C7E0()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v11 = sub_1C27396A8(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      id v11 = sub_1C27396A8((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(void *)v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        v85 = v11;
        v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        v88 = v42;
        unint64_t v89 = v44;
        v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_1C273940C((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        id v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      id v33 = (void *)(v10 + 16 * v9);
      do
      {
        unint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_1C277C7E0() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t result = sub_1C277C550();
  __break(1u);
  return result;
}

uint64_t sub_1C273933C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_1C277C7E0(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1C273940C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_1C277C7E0() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    id v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_1C277C7E0() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_1C273985C((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_1C277C610();
  __break(1u);
  return result;
}

char *sub_1C27396A8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_1C273A8F4();
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1C27397A0(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_1C277C610();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_1C273985C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_1C277C610();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_1C2739918(uint64_t a1)
{
  return sub_1C27396A8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1C273992C(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x1E4F143B8];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_1C2739AB4((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_1C2739AB4((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x1C875D230](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_1C2739AB4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_1C277C8C0();
        swift_bridgeObjectRetain();
        sub_1C277B8B0();
        uint64_t v20 = sub_1C277C910();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      uint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_1C277C7E0() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_1C277C7E0() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    unint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_1C277C8C0();
    swift_bridgeObjectRetain();
    sub_1C277B8B0();
    uint64_t v47 = sub_1C277C910();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_1C277C7E0() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_1C27420DC(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        uint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_1C277C7E0() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

void sub_1C2739FF4(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_1C273A014(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_1C273A034(void *a1, uint64_t a2, uint64_t a3, unint64_t *a4, void (*a5)(uint64_t))
{
  void (*v22)(uint64_t *__return_ptr, _OWORD *);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t *__return_ptr, _OWORD *);
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  void *v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  const void *v39;
  BOOL v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  unint64_t *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  _OWORD v50[2];
  long long v51;
  uint64_t v52;
  unsigned char v53[32];

  uint64_t v46 = a4;
  sub_1C273A7EC(0, a4, a5);
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v9);
  unint64_t v12 = (char *)&v44 - v11;
  uint64_t v13 = (uint64_t)objc_msgSend(a1, sel_count);
  if (v13 <= 0)
  {
    unint64_t v14 = (void *)MEMORY[0x1E4FBC860];
    unint64_t v17 = *(void *)(MEMORY[0x1E4FBC860] + 24);
  }
  else
  {
    sub_1C273A7A0(0, (unint64_t *)&qword_1EBB85220, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
    unint64_t v14 = (void *)swift_allocObject();
    int64_t v15 = _swift_stdlib_malloc_size(v14);
    uint64_t v16 = v15 - 32;
    if (v15 < 32) {
      uint64_t v16 = v15 - 25;
    }
    unint64_t v17 = (2 * (v16 >> 3)) | 1;
    v14[2] = v13;
    v14[3] = v17;
  }
  id v18 = a1;
  swift_retain();
  sub_1C277BCE0();

  uint64_t v19 = &v12[*(int *)(v10 + 44)];
  *(void *)uint64_t v19 = a2;
  *((void *)v19 + 1) = a3;
  if (v13 < 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v45 = a5;
  unint64_t v20 = v17 >> 1;
  uint64_t v21 = v14 + 4;
  if (v13)
  {
    v20 -= v13;
    sub_1C277A630();
    sub_1C273A758(&qword_1EA305468, MEMORY[0x1E4F27660]);
    do
    {
      sub_1C277C0C0();
      unint64_t v22 = *(void (**)(uint64_t *__return_ptr, _OWORD *))v19;
      sub_1C262C460((uint64_t)v53, (uint64_t)&v51);
      if (!v52) {
        goto LABEL_36;
      }
      sub_1C262FD34(&v51, v50);
      v22(&v49, v50);
      unint64_t v23 = v49;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v50);
      *v21++ = v23;
    }
    while (--v13);
  }
  uint64_t v24 = sub_1C277A630();
  uint64_t v25 = sub_1C273A758(&qword_1EA305468, MEMORY[0x1E4F27660]);
  sub_1C277C0C0();
  uint64_t v26 = *(void (**)(uint64_t *__return_ptr, _OWORD *))v19;
  sub_1C262C460((uint64_t)v53, (uint64_t)&v51);
  if (v52)
  {
    uint64_t v47 = MEMORY[0x1E4FBC838] + 8;
    uint64_t v48 = v12;
    while (1)
    {
      sub_1C262FD34(&v51, v50);
      v26(&v49, v50);
      BOOL v27 = v49;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v50);
      if (!v20)
      {
        uint64_t v28 = v14[3];
        if ((uint64_t)((v28 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_33;
        }
        uint64_t v29 = v25;
        unint64_t v30 = v24;
        uint64_t v31 = v28 & 0xFFFFFFFFFFFFFFFELL;
        if (v31 <= 1) {
          BOOL v32 = 1;
        }
        else {
          BOOL v32 = v31;
        }
        sub_1C273A7A0(0, (unint64_t *)&qword_1EBB85220, v47, MEMORY[0x1E4FBBE00]);
        BOOL v33 = (void *)swift_allocObject();
        int64_t v34 = _swift_stdlib_malloc_size(v33);
        uint64_t v35 = v34 - 32;
        if (v34 < 32) {
          uint64_t v35 = v34 - 25;
        }
        uint64_t v36 = v35 >> 3;
        v33[2] = v32;
        v33[3] = (2 * (v35 >> 3)) | 1;
        unint64_t v37 = (unint64_t)(v33 + 4);
        uint64_t v38 = v14[3] >> 1;
        if (v14[2])
        {
          unint64_t v39 = v14 + 4;
          if (v33 != v14 || v37 >= (unint64_t)v39 + 8 * v38) {
            memmove(v33 + 4, v39, 8 * v38);
          }
          v14[2] = 0;
        }
        uint64_t v21 = (void *)(v37 + 8 * v38);
        unint64_t v20 = (v36 & 0x7FFFFFFFFFFFFFFFLL) - v38;
        swift_release();
        unint64_t v14 = v33;
        uint64_t v24 = v30;
        uint64_t v25 = v29;
        unint64_t v12 = v48;
      }
      unint64_t v40 = __OFSUB__(v20--, 1);
      if (v40) {
        break;
      }
      *v21++ = v27;
      sub_1C277C0C0();
      uint64_t v26 = *(void (**)(uint64_t *__return_ptr, _OWORD *))v19;
      sub_1C262C460((uint64_t)v53, (uint64_t)&v51);
      if (!v52) {
        goto LABEL_28;
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
LABEL_28:
  sub_1C273A898((uint64_t)v12, v46, v45);
  int64_t v41 = v14[3];
  if (v41 >= 2)
  {
    unint64_t v42 = v41 >> 1;
    unint64_t v40 = __OFSUB__(v42, v20);
    int64_t v43 = v42 - v20;
    if (v40)
    {
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      return;
    }
    v14[2] = v43;
  }
}

uint64_t sub_1C273A458(uint64_t a1)
{
  return sub_1C264874C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1C273A46C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1C2768568(a1);
  *a2 = result;
  return result;
}

uint64_t _s14HealthPlatform11FeedSectionC03getD10Identifier4fromSSSgShySSG_tFZ_0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1C261E738((uint64_t)&unk_1F1DC5540);
  swift_arrayDestroy();
  sub_1C273992C(v2, a1);
  swift_bridgeObjectRelease();
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_1C261C11C(v3);
  swift_release();
  uint64_t v7 = v4;
  sub_1C2738BE4((uint64_t *)&v7);
  swift_release();
  if (v7[2])
  {
    uint64_t v5 = v7[4];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = 0;
  }
  swift_release();
  return v5;
}

unint64_t sub_1C273A580()
{
  unint64_t result = qword_1EA305448;
  if (!qword_1EA305448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305448);
  }
  return result;
}

unint64_t sub_1C273A5D8()
{
  unint64_t result = qword_1EA305450;
  if (!qword_1EA305450)
  {
    sub_1C273A7A0(255, &qword_1EA305458, (uint64_t)&type metadata for ForYouSectionKind, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305450);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ForYouSectionKind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x1C273A720);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ForYouSectionKind()
{
  return &type metadata for ForYouSectionKind;
}

uint64_t sub_1C273A758(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1C273A7A0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1C273A7EC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    sub_1C2682214();
    a3(255);
    sub_1C273A758(&qword_1EBB82EC0, (void (*)(uint64_t))sub_1C2682214);
    unint64_t v5 = sub_1C277C420();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1C273A898(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1C273A7EC(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1C273A8F4()
{
  if (!qword_1EBB831B8)
  {
    sub_1C273A94C();
    unint64_t v0 = sub_1C277C7C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB831B8);
    }
  }
}

void sub_1C273A94C()
{
  if (!qword_1EBB82EB8)
  {
    unint64_t v0 = sub_1C277BCB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB82EB8);
    }
  }
}

id HealthAppOrchestrationListener.__allocating_init(listener:coordinator:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = (char *)objc_allocWithZone(v4);
  uint64_t v8 = &v7[OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_coordinator];
  *(void *)&v7[OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_coordinator + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v9 = OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_protectedState;
  sub_1C273ABC8();
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 24) = 0;
  *(void *)(v10 + 16) = MEMORY[0x1E4FBC860];
  *(void *)&v7[v9] = v10;
  *(void *)&v7[OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_listener] = a1;
  *((void *)v8 + 1) = a3;
  swift_unknownObjectWeakAssign();
  v14.receiver = v7;
  v14.super_class = v4;
  id v11 = a1;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  objc_msgSend(v11, sel_setDelegate_, v12, v14.receiver, v14.super_class);

  swift_unknownObjectRelease();
  return v12;
}

id HealthAppOrchestrationListener.init(listener:coordinator:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = &v3[OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_coordinator];
  *(void *)&v3[OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_coordinator + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v7 = OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_protectedState;
  sub_1C273ABC8();
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 24) = 0;
  uint64_t v9 = MEMORY[0x1E4FBC860];
  *(void *)&v3[v7] = v8;
  *(void *)(v8 + 16) = v9;
  *(void *)&v3[OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_listener] = a1;
  *((void *)v6 + 1) = a3;
  swift_unknownObjectWeakAssign();
  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for HealthAppOrchestrationListener();
  id v10 = a1;
  id v11 = objc_msgSendSuper2(&v13, sel_init);
  objc_msgSend(v10, sel_setDelegate_, v11, v13.receiver, v13.super_class);

  swift_unknownObjectRelease();
  return v11;
}

void sub_1C273ABC8()
{
  if (!qword_1EBB80DC0)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_1C277C370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB80DC0);
    }
  }
}

uint64_t type metadata accessor for HealthAppOrchestrationListener()
{
  return self;
}

uint64_t sub_1C273AC4C(uint64_t a1, void *a2)
{
  return sub_1C2610A14(a2);
}

id HealthAppOrchestrationListener.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void HealthAppOrchestrationListener.init()()
{
}

id HealthAppOrchestrationListener.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthAppOrchestrationListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for HealthAppOrchestrationListener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthAppOrchestrationListener);
}

uint64_t dispatch thunk of HealthAppOrchestrationListener.__allocating_init(listener:coordinator:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of HealthAppOrchestrationListener.listener(_:shouldAcceptNewConnection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

ValueMetadata *type metadata accessor for HealthAppOrchestrationListener.State()
{
  return &type metadata for HealthAppOrchestrationListener.State;
}

uint64_t sub_1C273ADE8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C273AE10()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C273AE48@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C875D340](v1 + 16);
  *a1 = result;
  return result;
}

uint64_t sub_1C273AE94()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_1C273AED4(uint64_t a1)
{
  return sub_1C273AFF8(a1);
}

uint64_t sub_1C273AEF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C273B3B8(&qword_1EBB82918, a2, (void (*)(uint64_t))type metadata accessor for LegacyGenerationInputSignal);

  return MEMORY[0x1F411FB20](a1, v3);
}

uint64_t sub_1C273AF64(uint64_t a1, uint64_t a2)
{
  return sub_1C273B3B8(&qword_1EBB83B90, a2, (void (*)(uint64_t))type metadata accessor for LegacyGenerationInputSignal);
}

uint64_t sub_1C273AFAC()
{
  return sub_1C273B3B8(&qword_1EBB829C0, 255, (void (*)(uint64_t))sub_1C264FD90);
}

uint64_t sub_1C273AFF8(uint64_t a1)
{
  uint64_t v3 = sub_1C277AEE0();
  MEMORY[0x1F4188790](v3 - 8);
  sub_1C273B2A0();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C264FD90();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C273B2F8(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) == 1)
  {
    sub_1C277AED0();
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    sub_1C277AC10();
    sub_1C273B35C((uint64_t)v6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v6, v8);
  }
  swift_getObjectType();
  CFAbsoluteTime Current = v1;
  sub_1C273B3B8(&qword_1EBB82918, v12, (void (*)(uint64_t))type metadata accessor for LegacyGenerationInputSignal);
  sub_1C277AE40();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_1C273B2A0()
{
  if (!qword_1EBB829C8)
  {
    sub_1C264FD90();
    unint64_t v0 = sub_1C277C0B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB829C8);
    }
  }
}

uint64_t sub_1C273B2F8(uint64_t a1, uint64_t a2)
{
  sub_1C273B2A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C273B35C(uint64_t a1)
{
  sub_1C273B2A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C273B3B8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

Swift::Void __swiftcall Int.moveUp()()
{
  if (__OFADD__(*v0, 1)) {
    __break(1u);
  }
  else {
    ++*v0;
  }
}

Swift::Void __swiftcall Int.moveDown()()
{
  if (__OFSUB__(*v0, 1)) {
    __break(1u);
  }
  else {
    --*v0;
  }
}

id PluginFeedItem.NotificationIdentifier.sourceProfile.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

uint64_t PluginFeedItem.NotificationIdentifier.pluginIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PluginFeedItem.NotificationIdentifier.pluginIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*PluginFeedItem.NotificationIdentifier.pluginIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t PluginFeedItem.NotificationIdentifier.feedItemIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PluginFeedItem.NotificationIdentifier.notificationIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PluginFeedItem.NotificationIdentifier.init(sourceProfile:pluginIdentifier:feedItemIdentifier:notificationIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = result;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  a8[6] = a7;
  return result;
}

uint64_t PluginFeedItem.NotificationIdentifier.description.getter()
{
  uint64_t v1 = sub_1C277A8A0();
  uint64_t v8 = *(void *)(v1 - 8);
  uint64_t v9 = v1;
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  uint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_1C277C2D0();
  sub_1C277B8D0();
  swift_bridgeObjectRetain();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  swift_bridgeObjectRetain();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  swift_bridgeObjectRetain();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v5, sel_identifier);
    sub_1C277A880();

    sub_1C277A850();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v3, v9);
  }
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t PluginFeedItem.NotificationIdentifier.hash(into:)()
{
  uint64_t v1 = *v0;
  if (*v0)
  {
    sub_1C277C8D0();
    id v2 = v1;
    sub_1C277C040();
  }
  else
  {
    sub_1C277C8D0();
  }
  swift_bridgeObjectRetain();
  sub_1C277B8B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C277B8B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C277B8B0();

  return swift_bridgeObjectRelease();
}

unint64_t sub_1C273B87C(char a1)
{
  unint64_t result = 0x7250656372756F73;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1C273B928()
{
  return sub_1C273B87C(*v0);
}

uint64_t sub_1C273B930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C273C854(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C273B958(uint64_t a1)
{
  unint64_t v2 = sub_1C273C2E4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C273B994(uint64_t a1)
{
  unint64_t v2 = sub_1C273C2E4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t PluginFeedItem.NotificationIdentifier.encode(to:)(void *a1)
{
  sub_1C273C338(0, &qword_1EA305508, MEMORY[0x1E4FBBDE0]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v14 - v7;
  uint64_t v10 = *v1;
  uint64_t v9 = v1[1];
  v14[5] = v1[2];
  v14[6] = v9;
  uint64_t v11 = v1[3];
  v14[3] = v1[4];
  v14[4] = v11;
  uint64_t v12 = v1[5];
  v14[1] = v1[6];
  v14[2] = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C273C2E4();
  sub_1C277C9B0();
  uint64_t v19 = v10;
  char v18 = 0;
  sub_1C272E7E8();
  sub_1C277C760();
  if (!v2)
  {
    char v17 = 1;
    sub_1C277C720();
    char v16 = 2;
    sub_1C277C720();
    char v15 = 3;
    sub_1C277C720();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t PluginFeedItem.NotificationIdentifier.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_1C277C8C0();
  sub_1C277C8D0();
  if (v1)
  {
    id v2 = v1;
    sub_1C277C040();
  }
  swift_bridgeObjectRetain();
  sub_1C277B8B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C277B8B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C277B8B0();
  swift_bridgeObjectRelease();
  return sub_1C277C910();
}

void PluginFeedItem.NotificationIdentifier.init(from:)(void *a1@<X0>, void *a2@<X8>)
{
  sub_1C273C338(0, &qword_1EA305518, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v27 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C273C2E4();
  sub_1C277C9A0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    char v35 = 0;
    sub_1C272E9EC();
    sub_1C277C6D0();
    uint64_t v31 = a2;
    id v10 = v36;
    char v34 = 1;
    id v11 = v36;
    uint64_t v12 = sub_1C277C690();
    uint64_t v14 = v13;
    uint64_t v29 = v12;
    id v30 = v10;
    char v33 = 2;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1C277C690();
    uint64_t v17 = v16;
    uint64_t v27 = v15;
    char v32 = 3;
    swift_bridgeObjectRetain();
    uint64_t v28 = v17;
    uint64_t v18 = sub_1C277C690();
    uint64_t v20 = v19;
    uint64_t v21 = v18;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    id v22 = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    unint64_t v23 = v31;
    uint64_t v25 = v28;
    uint64_t v24 = v29;
    *uint64_t v31 = v30;
    v23[1] = v24;
    uint64_t v26 = v27;
    v23[2] = v14;
    v23[3] = v26;
    v23[4] = v25;
    v23[5] = v21;
    v23[6] = v20;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_1C273C024(void *a1@<X0>, void *a2@<X8>)
{
}

uint64_t sub_1C273C03C(void *a1)
{
  return PluginFeedItem.NotificationIdentifier.encode(to:)(a1);
}

uint64_t sub_1C273C05C()
{
  uint64_t v1 = *v0;
  sub_1C277C8C0();
  sub_1C277C8D0();
  if (v1)
  {
    id v2 = v1;
    sub_1C277C040();
  }
  swift_bridgeObjectRetain();
  sub_1C277B8B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C277B8B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C277B8B0();
  swift_bridgeObjectRelease();
  return sub_1C277C910();
}

uint64_t _s14HealthPlatform14PluginFeedItemV22NotificationIdentifierV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  uint64_t v11 = *(void *)(a2 + 32);
  if (*(void *)a1)
  {
    if (v8)
    {
      uint64_t v23 = *(void *)(a2 + 48);
      uint64_t v24 = *(void *)(a2 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(a2 + 24);
      uint64_t v12 = *(void *)(a1 + 24);
      uint64_t v13 = *(void *)(a2 + 32);
      sub_1C2652E20();
      id v14 = v2;
      id v15 = v8;
      char v16 = sub_1C277C030();

      uint64_t v11 = v13;
      uint64_t v5 = v12;
      uint64_t v10 = v22;
      if (v16) {
        goto LABEL_4;
      }
    }
    return 0;
  }
  uint64_t v23 = *(void *)(a2 + 48);
  uint64_t v24 = *(void *)(a2 + 40);
  uint64_t v25 = *(void *)(a1 + 48);
  uint64_t v26 = *(void *)(a1 + 40);
  if (v8) {
    return 0;
  }
LABEL_4:
  if (v3 == v7 && v4 == v9 || (v17 = v11, v18 = sub_1C277C7E0(), v11 = v17, v19 = v18, uint64_t result = 0, (v19 & 1) != 0))
  {
    if (v5 == v10 && v6 == v11 || (v21 = sub_1C277C7E0(), uint64_t result = 0, (v21 & 1) != 0))
    {
      if (v26 == v24 && v25 == v23)
      {
        return 1;
      }
      else
      {
        return sub_1C277C7E0();
      }
    }
  }
  return result;
}

unint64_t sub_1C273C2E4()
{
  unint64_t result = qword_1EA305510;
  if (!qword_1EA305510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305510);
  }
  return result;
}

void sub_1C273C338(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1C273C2E4();
    unint64_t v7 = a3(a1, &_s14descr1F1DC3F91C22NotificationIdentifierV10CodingKeysON, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1C273C3A0()
{
  unint64_t result = qword_1EA305520;
  if (!qword_1EA305520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305520);
  }
  return result;
}

uint64_t _s14descr1F1DC3F91C22NotificationIdentifierVwxx(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s14descr1F1DC3F91C22NotificationIdentifierVwcp(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  a1[6] = *(void *)(a2 + 48);
  id v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s14descr1F1DC3F91C22NotificationIdentifierVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14descr1F1DC3F91C22NotificationIdentifierVwta(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14descr1F1DC3F91C22NotificationIdentifierVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14descr1F1DC3F91C22NotificationIdentifierVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

unsigned char *_s14descr1F1DC3F91C22NotificationIdentifierV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x1C273C714);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14descr1F1DC3F91C22NotificationIdentifierV10CodingKeysOMa()
{
  return &_s14descr1F1DC3F91C22NotificationIdentifierV10CodingKeysON;
}

unint64_t sub_1C273C750()
{
  unint64_t result = qword_1EA305528;
  if (!qword_1EA305528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305528);
  }
  return result;
}

unint64_t sub_1C273C7A8()
{
  unint64_t result = qword_1EA305530;
  if (!qword_1EA305530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305530);
  }
  return result;
}

unint64_t sub_1C273C800()
{
  unint64_t result = qword_1EA305538;
  if (!qword_1EA305538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305538);
  }
  return result;
}

uint64_t sub_1C273C854(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7250656372756F73 && a2 == 0xED0000656C69666FLL;
  if (v2 || (sub_1C277C7E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001C278F980 || (sub_1C277C7E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001C278F9A0 || (sub_1C277C7E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000001C278F9C0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1C277C7E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

double sub_1C273CA1C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (*(unsigned char *)a1 != 1 || v2 && *(unsigned char *)(a1 + 32) == 1)
  {
    uint64_t v3 = *(void *)(a1 + 80);
    long long v4 = *(_OWORD *)(a1 + 8);
    long long v5 = *(_OWORD *)(a1 + 32);
    long long v6 = *(_OWORD *)(a1 + 48);
    long long v7 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)a2 = v4;
    *(void *)(a2 + 16) = v2;
    *(_OWORD *)(a2 + 24) = v5;
    *(_OWORD *)(a2 + 40) = v6;
    *(_OWORD *)(a2 + 56) = v7;
    *(void *)(a2 + 72) = v3;
  }
  else
  {
    *(void *)&long long v4 = 0;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
  return *(double *)&v4;
}

uint64_t sub_1C273CA94(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[3];
  if (v3)
  {
    uint64_t v5 = a1[9];
    uint64_t v4 = a1[10];
    uint64_t v6 = a1[7];
    uint64_t v23 = a1[8];
    uint64_t v8 = a1[5];
    uint64_t v7 = a1[6];
    uint64_t v9 = a1[4];
    uint64_t v11 = a1[1];
    uint64_t v10 = a1[2];
    char v25 = v11 & 1;
    uint64_t v26 = v10;
    uint64_t v27 = v3;
    char v28 = v9 & 1;
    uint64_t v29 = v8;
    uint64_t v30 = v7;
    uint64_t v31 = v6;
    uint64_t v32 = v23;
    uint64_t v33 = v5;
    uint64_t v34 = v4;
    long long v12 = *(_OWORD *)(a2 + 48);
    v24[2] = *(_OWORD *)(a2 + 32);
    v24[3] = v12;
    v24[4] = *(_OWORD *)(a2 + 64);
    long long v13 = *(_OWORD *)(a2 + 16);
    v24[0] = *(_OWORD *)a2;
    v24[1] = v13;
    sub_1C2703E98(v24, (uint64_t)v35);
    uint64_t result = sub_1C265F0D0(v11, v10, v3);
    long long v15 = v40;
    *(_OWORD *)(a1 + 5) = v39;
    uint64_t v16 = v36;
    uint64_t v17 = v37;
    uint64_t v18 = v38;
    a1[1] = v35[0];
    a1[2] = v16;
    a1[3] = v17;
    a1[4] = v18;
    *(_OWORD *)(a1 + 7) = v15;
    *(_OWORD *)(a1 + 9) = v41;
  }
  else
  {
    long long v19 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 32);
    uint64_t v20 = *(unsigned char *)(a2 + 24) & 1;
    uint64_t v22 = *(void *)(a2 + 8);
    uint64_t v21 = *(void *)(a2 + 16);
    a1[1] = *(unsigned char *)a2 & 1;
    a1[2] = v22;
    a1[3] = v21;
    a1[4] = v20;
    *(_OWORD *)(a1 + 7) = v19;
    *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 64);
    return sub_1C2708BB4(a2);
  }
  return result;
}

uint64_t sub_1C273CBE4()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t LegacyGenerationProvider.__allocating_init(environmentalState:)()
{
  uint64_t v0 = swift_allocObject();
  LegacyGenerationProvider.init(environmentalState:)();
  return v0;
}

uint64_t LegacyGenerationProvider.init(environmentalState:)()
{
  type metadata accessor for LegacyGenerationProvider.RequestedGenerationState();
  uint64_t v1 = swift_allocObject();
  sub_1C273CD78();
  uint64_t v2 = swift_allocObject();
  *(unsigned char *)(v2 + 16) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_DWORD *)(v2 + 104) = 0;
  *(void *)(v1 + 16) = v2;
  *(void *)(v0 + 16) = v1;
  sub_1C273CDD8();
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 24) = 0;
  *(void *)(v3 + 16) = 0;
  *(void *)(v0 + 24) = v3;
  sub_1C265011C(&qword_1EBB82838, v4, (void (*)(uint64_t))type metadata accessor for LegacyGenerationProvider);
  swift_retain();
  sub_1C277AFA0();
  swift_release();
  swift_release();
  return v0;
}

uint64_t type metadata accessor for LegacyGenerationProvider.RequestedGenerationState()
{
  return self;
}

void sub_1C273CD78()
{
  if (!qword_1EBB80DC8)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_1C277C370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB80DC8);
    }
  }
}

void sub_1C273CDD8()
{
  if (!qword_1EBB83088)
  {
    sub_1C273CE40();
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_1C277C370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB83088);
    }
  }
}

void sub_1C273CE40()
{
  if (!qword_1EBB82920)
  {
    type metadata accessor for LegacyGenerationInputSignal();
    unint64_t v0 = sub_1C277C0B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB82920);
    }
  }
}

uint64_t type metadata accessor for LegacyGenerationProvider()
{
  return self;
}

void LegacyGenerationProvider.requestBackgroundGeneration(request:)(_OWORD *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1C277AEE0();
  MEMORY[0x1F4188790](v4 - 8);
  sub_1C264FD90();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v10 = a1[3];
  v22[2] = a1[2];
  v22[3] = v10;
  v22[4] = a1[4];
  long long v11 = a1[1];
  v22[0] = *a1;
  v22[1] = v11;
  long long v12 = *(os_unfair_lock_s **)(*(void *)(v2 + 16) + 16);
  uint64_t v20 = v22;
  long long v13 = v12 + 4;
  id v14 = v12 + 26;
  os_unfair_lock_lock(v12 + 26);
  sub_1C273D12C(v13);
  os_unfair_lock_unlock(v14);
  long long v15 = *(os_unfair_lock_s **)(v2 + 24);
  uint64_t v16 = v15 + 4;
  uint64_t v17 = v15 + 6;
  os_unfair_lock_lock(v15 + 6);
  sub_1C26501A8(v16, v21);
  os_unfair_lock_unlock(v17);
  double v18 = v21[0];
  if (v21[0] != 0.0)
  {
    swift_getObjectType();
    sub_1C277AED0();
    v21[0] = CFAbsoluteTimeGetCurrent();
    sub_1C277AC10();
    v21[0] = v18;
    type metadata accessor for LegacyGenerationInputSignal();
    sub_1C265011C(&qword_1EBB82918, 255, (void (*)(uint64_t))type metadata accessor for LegacyGenerationInputSignal);
    sub_1C277AE40();
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
    swift_release();
  }
}

uint64_t sub_1C273D12C(void *a1)
{
  return sub_1C273CA94(a1, *(void *)(v1 + 16));
}

uint64_t LegacyGenerationProvider.inputSignals(for:observer:)(uint64_t a1)
{
  swift_getObjectType();
  uint64_t v2 = swift_conformsToProtocol2();
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v2) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = 0;
  }
  if (!v4) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = *(void *)(v3 + 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
  swift_unknownObjectRetain();
  uint64_t v8 = (void *)v7(ObjectType, v6);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = objc_msgSend(v8, sel_profileIdentifier);
  }
  else
  {
    id v10 = 0;
  }
  id v11 = objc_msgSend(self, sel_primaryProfile);
  long long v12 = v11;
  if (!v10)
  {
    if (!v11) {
      goto LABEL_16;
    }
LABEL_18:

LABEL_19:
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  if (!v11)
  {
    long long v12 = v10;
    goto LABEL_18;
  }
  sub_1C273D478();
  id v13 = v10;
  char v14 = sub_1C277C030();

  if ((v14 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  MEMORY[0x1F4188790](v11);
  uint64_t v16 = v15 + 4;
  uint64_t v17 = v15 + 6;
  os_unfair_lock_lock(v15 + 6);
  sub_1C273D458(v16, &v21);
  os_unfair_lock_unlock(v17);
  uint64_t v18 = v21;
  sub_1C26431F4(0, &qword_1EBB83168, &qword_1EBB829B8);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1C277E480;
  *(void *)(v19 + 56) = type metadata accessor for LegacyGenerationInputSignal();
  *(void *)(v19 + 64) = sub_1C265011C(&qword_1EBB82918, 255, (void (*)(uint64_t))type metadata accessor for LegacyGenerationInputSignal);
  *(void *)(v19 + 32) = v18;
  swift_unknownObjectRelease();
  return v19;
}

uint64_t sub_1C273D3B0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v8 = (void *)*a1;
  if (v8)
  {
    uint64_t v9 = v8;
  }
  else
  {
    type metadata accessor for LegacyGenerationInputSignal();
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = a2;
    v9[3] = a3;
    v9[4] = a4;
    v9[5] = a5;
    *a1 = v9;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_retain();
  }
  *a6 = v9;
  return swift_retain();
}

uint64_t sub_1C273D458@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_1C273D3B0(a1, v2[2], v2[3], v2[4], v2[5], a2);
}

unint64_t sub_1C273D478()
{
  unint64_t result = qword_1EBB85E90;
  if (!qword_1EBB85E90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB85E90);
  }
  return result;
}

unint64_t LegacyGenerationProvider.identifier.getter()
{
  return 0xD000000000000029;
}

uint64_t LegacyGenerationProvider.executors(for:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = *(void *)(v5 + 8);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 16);
  swift_unknownObjectRetain();
  id v10 = (void *)v9(ObjectType, v8);
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_msgSend(v10, sel_profileIdentifier);
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_msgSend(self, sel_primaryProfile);
  char v14 = v13;
  if (!v12)
  {
    if (!v13) {
      goto LABEL_16;
    }
LABEL_18:

LABEL_19:
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  if (!v13)
  {
    char v14 = v12;
    goto LABEL_18;
  }
  sub_1C273D478();
  id v15 = v12;
  char v16 = sub_1C277C030();

  if ((v16 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  sub_1C26431F4(0, &qword_1EBB83198, &qword_1EBB82A30);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1C277E480;
  uint64_t v18 = *(void *)(v2 + 16);
  type metadata accessor for LegacyGenerationExecutor();
  uint64_t v19 = (void *)swift_allocObject();
  void v19[2] = v18;
  v19[3] = v6;
  v19[4] = v5;
  uint64_t v20 = sub_1C265011C(&qword_1EBB82830, 255, (void (*)(uint64_t))type metadata accessor for LegacyGenerationExecutor);
  *(void *)(v17 + 32) = v19;
  *(void *)(v17 + 40) = v20;
  swift_retain();
  return v17;
}

uint64_t LegacyGenerationProvider.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t LegacyGenerationProvider.__deallocating_deinit()
{
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

unint64_t sub_1C273D740()
{
  return 0xD000000000000029;
}

uint64_t sub_1C273D75C(uint64_t a1)
{
  return LegacyGenerationProvider.executors(for:)(a1);
}

uint64_t sub_1C273D780(uint64_t a1)
{
  return LegacyGenerationProvider.inputSignals(for:observer:)(a1);
}

uint64_t method lookup function for LegacyGenerationProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LegacyGenerationProvider);
}

uint64_t dispatch thunk of LegacyGenerationProvider.__allocating_init(environmentalState:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t destroy for LegacyGenerationProvider.RequestedGenerationState.State(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for LegacyGenerationProvider.RequestedGenerationState.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v3;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    uint64_t v4 = *(void *)(a2 + 80);
    long long v8 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v8;
    *(void *)(a1 + 80) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v5;
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    long long v6 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a1 + 24) = v6;
  }
  return a1;
}

uint64_t assignWithCopy for LegacyGenerationProvider.RequestedGenerationState.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  long long v5 = (_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24))
  {
    if (v6)
    {
      *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      uint64_t v7 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v7;
      swift_retain();
      swift_release();
      uint64_t v8 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v8;
      swift_retain();
      swift_release();
      uint64_t v9 = *(void *)(a2 + 80);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = v9;
      swift_retain();
      swift_release();
    }
    else
    {
      sub_1C273DA84(a1 + 8);
      *uint64_t v4 = *v5;
      long long v13 = v5[4];
      long long v15 = v5[1];
      long long v14 = v5[2];
      v4[3] = v5[3];
      v4[4] = v13;
      v4[1] = v15;
      v4[2] = v14;
    }
  }
  else if (v6)
  {
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    uint64_t v10 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v10;
    uint64_t v11 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v11;
    uint64_t v12 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  else
  {
    *uint64_t v4 = *v5;
    long long v16 = *(_OWORD *)(a2 + 24);
    long long v17 = *(_OWORD *)(a2 + 40);
    long long v18 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v18;
    *(_OWORD *)(a1 + 24) = v16;
    *(_OWORD *)(a1 + 40) = v17;
  }
  return a1;
}

uint64_t sub_1C273DA84(uint64_t a1)
{
  return a1;
}

uint64_t assignWithTake for LegacyGenerationProvider.RequestedGenerationState.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = (_OWORD *)(a1 + 8);
  uint64_t v4 = (_OWORD *)(a2 + 8);
  if (!*(void *)(a1 + 24)) {
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a2 + 24);
  if (!v6)
  {
    sub_1C273DA84(a1 + 8);
LABEL_5:
    long long v7 = v4[3];
    v3[2] = v4[2];
    v3[3] = v7;
    v3[4] = v4[4];
    long long v8 = v4[1];
    _OWORD *v3 = *v4;
    v3[1] = v8;
    return a1;
  }
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyGenerationProvider.RequestedGenerationState.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 88)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyGenerationProvider.RequestedGenerationState.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyGenerationProvider.RequestedGenerationState.State()
{
  return &type metadata for LegacyGenerationProvider.RequestedGenerationState.State;
}

uint64_t sub_1C273DC84(uint64_t a1, uint64_t a2)
{
  return sub_1C2649F18(a1, a2, (uint64_t (*)(void))DataVisualizationKind.rawValue.getter);
}

uint64_t sub_1C273DC9C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1920298856;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1920298856;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 7954788;
      break;
    case 2:
      uint64_t v5 = 1801807223;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x68746E6F6DLL;
      break;
    case 4:
      uint64_t v5 = 1918985593;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE300000000000000;
      if (v5 == 7954788) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      if (v5 != 1801807223) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x68746E6F6DLL;
      goto LABEL_12;
    case 4:
      if (v5 != 1918985593) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_1C277C7E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1C273DE10(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x656D6F7268436F6ELL;
  }
  else {
    uint64_t v3 = 0x656D6F726863;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x656D6F7268436F6ELL;
  }
  else {
    uint64_t v5 = 0x656D6F726863;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1C277C7E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1C273DEB4(uint64_t a1, uint64_t a2)
{
  return sub_1C2649F18(a1, a2, (uint64_t (*)(void))LogCategory.rawValue.getter);
}

BOOL PluginFeedItem.hasChanged(from:)(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v93 = (int *)type metadata accessor for PluginFeedItem();
  uint64_t v4 = MEMORY[0x1F4188790](v93);
  uint64_t v92 = (uint64_t)&v89 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v91 = (uint64_t)&v89 - v6;
  uint64_t v7 = type metadata accessor for RelevantDateInterval();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C26903D4();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v11);
  long long v14 = (char *)&v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2743C40(0, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval, MEMORY[0x1E4FBB718]);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  long long v18 = (char *)&v89 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)&v89 - v20;
  MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v89 - v22;
  if ((*(void *)v2 != *(void *)a1 || *(void *)(v2 + 8) != *(void *)(a1 + 8)) && (sub_1C277C7E0() & 1) == 0) {
    return 1;
  }
  uint64_t v24 = *(void *)(a1 + 16);
  uint64_t v25 = *(void *)(a1 + 24);
  int v26 = *(unsigned __int8 *)(a1 + 32);
  switch(*(unsigned char *)(v2 + 32))
  {
    case 1:
      if (v26 != 1) {
        return 1;
      }
      goto LABEL_16;
    case 2:
      if (v26 != 2) {
        return 1;
      }
      goto LABEL_16;
    case 3:
      if (v26 != 3) {
        return 1;
      }
      goto LABEL_16;
    case 4:
      if (v26 != 4) {
        return 1;
      }
      goto LABEL_16;
    case 5:
      if (v26 != 5) {
        return 1;
      }
      goto LABEL_16;
    case 6:
      if (v26 != 6 || v25 | v24) {
        return 1;
      }
      goto LABEL_22;
    default:
      if (*(unsigned char *)(a1 + 32)) {
        return 1;
      }
LABEL_16:
      if ((*(void *)(v2 + 16) != v24 || *(void *)(v2 + 24) != v25) && (sub_1C277C7E0() & 1) == 0) {
        return 1;
      }
LABEL_22:
      if ((sub_1C268C86C(*(void *)(v2 + 88), *(void *)(v2 + 96), *(void *)(a1 + 88), *(void *)(a1 + 96)) & 1) == 0) {
        return 1;
      }
      v90 = v18;
      uint64_t v27 = v8;
      char v28 = v93;
      sub_1C26D30BC(v2 + v93[11], (uint64_t)v23);
      sub_1C26D30BC(a1 + v28[11], (uint64_t)v21);
      uint64_t v29 = (uint64_t)&v14[*(int *)(v12 + 48)];
      sub_1C26D30BC((uint64_t)v23, (uint64_t)v14);
      sub_1C26D30BC((uint64_t)v21, v29);
      uint64_t v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
      if (v30((uint64_t)v14, 1, v7) == 1)
      {
        sub_1C2743B38((uint64_t)v21, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
        sub_1C2743B38((uint64_t)v23, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
        if (v30(v29, 1, v7) == 1)
        {
          sub_1C2743B38((uint64_t)v14, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
          goto LABEL_26;
        }
LABEL_31:
        sub_1C2742D54((uint64_t)v14, (uint64_t (*)(void))sub_1C26903D4);
        return 1;
      }
      sub_1C26D30BC((uint64_t)v14, (uint64_t)v90);
      if (v30(v29, 1, v7) == 1)
      {
        sub_1C2743B38((uint64_t)v21, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
        sub_1C2743B38((uint64_t)v23, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
        sub_1C2742D54((uint64_t)v90, (uint64_t (*)(void))type metadata accessor for RelevantDateInterval);
        goto LABEL_31;
      }
      sub_1C2743CA4(v29, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for RelevantDateInterval);
      uint64_t v37 = (uint64_t)v90;
      if ((sub_1C277A4E0() & 1) == 0 || *(double *)(v37 + *(int *)(v7 + 20)) != *(double *)&v10[*(int *)(v7 + 20)])
      {
        sub_1C2742D54((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for RelevantDateInterval);
        sub_1C2743B38((uint64_t)v21, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
        sub_1C2743B38((uint64_t)v23, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
        sub_1C2742D54(v37, (uint64_t (*)(void))type metadata accessor for RelevantDateInterval);
        sub_1C2743B38((uint64_t)v14, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
        return 1;
      }
      uint64_t v38 = *(int *)(v7 + 24);
      double v39 = *(double *)(v37 + v38);
      double v40 = *(double *)&v10[v38];
      sub_1C2742D54((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for RelevantDateInterval);
      sub_1C2743B38((uint64_t)v21, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
      sub_1C2743B38((uint64_t)v23, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
      sub_1C2742D54(v37, (uint64_t (*)(void))type metadata accessor for RelevantDateInterval);
      sub_1C2743B38((uint64_t)v14, (unint64_t *)&unk_1EBB85F50, (uint64_t (*)(uint64_t))type metadata accessor for RelevantDateInterval);
      if (v39 != v40) {
        return 1;
      }
LABEL_26:
      uint64_t v31 = v93[12];
      char v32 = *(unsigned char *)(v2 + v31);
      LOBYTE(v31) = *(unsigned char *)(a1 + v31);
      char v95 = v32;
      char v94 = v31;
      unint64_t v33 = ContentKind.rawValue.getter();
      uint64_t v35 = v34;
      if (v33 == ContentKind.rawValue.getter() && v35 == v36)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v41 = sub_1C277C7E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v41 & 1) == 0) {
          return 1;
        }
      }
      uint64_t v42 = v93[15];
      int64_t v43 = (void *)(v2 + v42);
      uint64_t v44 = *(void *)(v2 + v42 + 8);
      uint64_t v45 = (void *)(a1 + v42);
      uint64_t v46 = v45[1];
      if (v44)
      {
        if (!v46 || (*v43 != *v45 || v44 != v46) && (sub_1C277C7E0() & 1) == 0) {
          return 1;
        }
      }
      else if (v46)
      {
        return 1;
      }
      uint64_t v47 = v93[26];
      uint64_t v48 = (void *)(v2 + v47);
      uint64_t v49 = *(void *)(v2 + v47 + 8);
      uint64_t v50 = (void *)(a1 + v47);
      uint64_t v51 = v50[1];
      if (v49)
      {
        if (!v51 || (*v48 != *v50 || v49 != v51) && (sub_1C277C7E0() & 1) == 0) {
          return 1;
        }
      }
      else if (v51)
      {
        return 1;
      }
      if ((sub_1C26717D4(*(void *)(v2 + v93[13]), *(void *)(a1 + v93[13])) & 1) == 0
        || (sub_1C266EC30(*(void *)(v2 + v93[16]), *(void *)(a1 + v93[16])) & 1) == 0
        || (sub_1C267154C(*(void *)(v2 + v93[17]), *(void *)(a1 + v93[17])) & 1) == 0)
      {
        return 1;
      }
      uint64_t v52 = v93[18];
      uint64_t v53 = *(void **)(v2 + v52);
      uint64_t v54 = *(void **)(a1 + v52);
      if (v53)
      {
        if (!v54) {
          return 1;
        }
        sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85F30);
        id v55 = v53;
        id v56 = v54;
        char v57 = sub_1C277C030();

        if ((v57 & 1) == 0) {
          return 1;
        }
      }
      else if (v54)
      {
        return 1;
      }
      uint64_t v58 = v93[19];
      int64_t v59 = (void *)(v2 + v58);
      uint64_t v60 = *(void *)(v2 + v58 + 8);
      uint64_t v61 = (void *)(a1 + v58);
      uint64_t v62 = v61[1];
      if (v60)
      {
        if (!v62 || (*v59 != *v61 || v60 != v62) && (sub_1C277C7E0() & 1) == 0) {
          return 1;
        }
      }
      else if (v62)
      {
        return 1;
      }
      uint64_t v63 = v93[20];
      uint64_t v64 = (void *)(v2 + v63);
      uint64_t v65 = *(void *)(v2 + v63 + 8);
      uint64_t v66 = (void *)(a1 + v63);
      uint64_t v67 = v66[1];
      if (v65)
      {
        if (!v67 || (*v64 != *v66 || v65 != v67) && (sub_1C277C7E0() & 1) == 0) {
          return 1;
        }
      }
      else if (v67)
      {
        return 1;
      }
      uint64_t v68 = v93[21];
      uint64_t v69 = (void *)(v2 + v68);
      uint64_t v70 = *(void *)(v2 + v68 + 8);
      uint64_t v71 = (void *)(a1 + v68);
      uint64_t v72 = v71[1];
      if (v70)
      {
        if (!v72 || (*v69 != *v71 || v70 != v72) && (sub_1C277C7E0() & 1) == 0) {
          return 1;
        }
      }
      else if (v72)
      {
        return 1;
      }
      if (*(void *)(v2 + v93[22]) != *(void *)(a1 + v93[22])
        || *(unsigned __int8 *)(v2 + v93[24]) != *(unsigned __int8 *)(a1 + v93[24]))
      {
        return 1;
      }
      int v74 = *(unsigned __int8 *)(v2 + v93[25]);
      sub_1C2742DB4(v2, v91, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      sub_1C2742DB4(a1, v92, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      if (v74 == 2)
      {
        sub_1C2742D54(v92, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        sub_1C2742D54(v91, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      }
      else
      {
        v75 = v93;
        int v76 = *(unsigned __int8 *)(v91 + v93[25]);
        sub_1C2742D54(v91, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        int v77 = *(unsigned __int8 *)(v92 + v75[25]);
        sub_1C2742D54(v92, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        if (v76 == 2)
        {
          if (v77 != 2) {
            return 1;
          }
        }
        else if (v77 == 2 || ((((v76 & 1) == 0) ^ v77) & 1) == 0)
        {
          return 1;
        }
      }
      uint64_t v78 = v93[23];
      int v79 = *(unsigned __int8 *)(v2 + v78);
      int v80 = *(unsigned __int8 *)(a1 + v78);
      if (v79 == 13)
      {
        if (v80 != 13) {
          return 1;
        }
      }
      else if (v80 == 13 || v79 != v80)
      {
        return 1;
      }
      uint64_t v81 = v93[28];
      int v82 = *(unsigned __int8 *)(v2 + v81);
      int v83 = *(unsigned __int8 *)(a1 + v81);
      if (v82) {
        uint64_t v84 = 0x656D6F7268436F6ELL;
      }
      else {
        uint64_t v84 = 0x656D6F726863;
      }
      if (v82) {
        unint64_t v85 = 0xE800000000000000;
      }
      else {
        unint64_t v85 = 0xE600000000000000;
      }
      if (v83) {
        uint64_t v86 = 0x656D6F7268436F6ELL;
      }
      else {
        uint64_t v86 = 0x656D6F726863;
      }
      if (v83) {
        unint64_t v87 = 0xE800000000000000;
      }
      else {
        unint64_t v87 = 0xE600000000000000;
      }
      if (v84 == v86 && v85 == v87)
      {
        swift_bridgeObjectRelease_n();
        return (sub_1C267154C(*(void *)(v2 + v93[14]), *(void *)(a1 + v93[14])) & 1) == 0;
      }
      char v88 = sub_1C277C7E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v88 & 1) == 0) {
        return 1;
      }
      return (sub_1C267154C(*(void *)(v2 + v93[14]), *(void *)(a1 + v93[14])) & 1) == 0;
  }
}

uint64_t Array<A>.difference(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PluginFeedItem();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v98 = (uint64_t)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  v97 = (uint64_t *)((char *)&v91 - v9);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  unint64_t v102 = (unint64_t)&v91 - v11;
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  long long v14 = (uint64_t *)((char *)&v91 - v13);
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v91 - v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (uint64_t *)((char *)&v91 - v18);
  uint64_t v20 = (void *)sub_1C267D41C(MEMORY[0x1E4FBC860]);
  unint64_t v21 = *(void *)(a2 + 16);
  uint64_t v94 = v5;
  uint64_t v95 = a2;
  unint64_t v92 = v21;
  uint64_t v93 = a1;
  v100 = v14;
  if (!v21) {
    goto LABEL_17;
  }
  unint64_t v22 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  unint64_t v23 = *(void *)(v5 + 72);
  swift_bridgeObjectRetain();
  uint64_t v99 = v19;
  unint64_t v101 = v23;
  while (1)
  {
    sub_1C2742DB4(v22, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
    uint64_t v27 = *v19;
    uint64_t v26 = v19[1];
    uint64_t v28 = (uint64_t)v19;
    unint64_t v29 = (unint64_t)v17;
    sub_1C2742DB4(v28, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
    swift_bridgeObjectRetain();
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v103 = v20;
    unint64_t v25 = sub_1C2629588(v27, v26);
    unint64_t v32 = v20[2];
    BOOL v33 = (v31 & 1) == 0;
    uint64_t v34 = v32 + v33;
    if (__OFADD__(v32, v33))
    {
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
      goto LABEL_80;
    }
    char v35 = v31;
    if (v20[3] < v34) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v20 = v103;
      if ((v31 & 1) == 0) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_1C2678EE8();
      uint64_t v20 = v103;
      if ((v35 & 1) == 0)
      {
LABEL_12:
        v20[(v25 >> 6) + 8] |= 1 << v25;
        uint64_t v38 = (uint64_t *)(v20[6] + 16 * v25);
        uint64_t *v38 = v27;
        v38[1] = v26;
        uint64_t v39 = v20[7] + v25 * v101;
        unint64_t v25 = v101;
        uint64_t v17 = (char *)v29;
        sub_1C2743CA4(v29, v39, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        uint64_t v40 = v20[2];
        BOOL v41 = __OFADD__(v40, 1);
        unint64_t v32 = v40 + 1;
        if (v41) {
          goto LABEL_78;
        }
        v20[2] = v32;
        swift_bridgeObjectRetain();
        goto LABEL_4;
      }
    }
LABEL_3:
    uint64_t v24 = v20[7] + v25 * v101;
    unint64_t v25 = v101;
    uint64_t v17 = (char *)v29;
    sub_1C2743AD4(v29, v24);
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v19 = v99;
    sub_1C2742D54((uint64_t)v99, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
    v22 += v25;
    if (!--v21)
    {
      a2 = v95;
      swift_bridgeObjectRelease();
      a1 = v93;
      uint64_t v5 = v94;
      long long v14 = v100;
LABEL_17:
      unint64_t v22 = sub_1C267D41C(MEMORY[0x1E4FBC860]);
      unint64_t v21 = *(void *)(a1 + 16);
      unint64_t v101 = (unint64_t)v20;
      if (v21)
      {
        unint64_t v29 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
        uint64_t v42 = *(void *)(v5 + 72);
        swift_bridgeObjectRetain();
        while (1)
        {
          sub_1C2742DB4(v29, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
          uint64_t v43 = *v14;
          uint64_t v26 = v14[1];
          sub_1C2742DB4((uint64_t)v14, v102, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
          swift_bridgeObjectRetain();
          uint64_t v20 = (void *)v22;
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v103 = (void *)v22;
          unint64_t v25 = sub_1C2629588(v43, v26);
          unint64_t v32 = *(void *)(v22 + 16);
          BOOL v45 = (v44 & 1) == 0;
          uint64_t v46 = v32 + v45;
          if (__OFADD__(v32, v45)) {
            goto LABEL_77;
          }
          char v47 = v44;
          if (v20[3] >= v46)
          {
            uint64_t v20 = (void *)v101;
            if (isUniquelyReferenced_nonNull_native) {
              goto LABEL_27;
            }
            sub_1C2678EE8();
          }
          else
          {
            sub_1C2676818(v46, isUniquelyReferenced_nonNull_native);
            unint64_t v48 = sub_1C2629588(v43, v26);
            if ((v47 & 1) != (v49 & 1)) {
              goto LABEL_83;
            }
            unint64_t v25 = v48;
          }
          uint64_t v20 = (void *)v101;
LABEL_27:
          unint64_t v50 = (unint64_t)v103;
          if (v47)
          {
            unint64_t v22 = (unint64_t)v103;
            sub_1C2743AD4(v102, v103[7] + v25 * v42);
          }
          else
          {
            v103[(v25 >> 6) + 8] |= 1 << v25;
            uint64_t v51 = (uint64_t *)(*(void *)(v50 + 48) + 16 * v25);
            *uint64_t v51 = v43;
            v51[1] = v26;
            unint64_t v22 = v50;
            sub_1C2743CA4(v102, *(void *)(v50 + 56) + v25 * v42, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
            uint64_t v52 = *(void *)(v22 + 16);
            BOOL v41 = __OFADD__(v52, 1);
            unint64_t v32 = v52 + 1;
            if (v41) {
              goto LABEL_79;
            }
            *(void *)(v22 + 16) = v32;
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          long long v14 = v100;
          sub_1C2742D54((uint64_t)v100, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
          v29 += v42;
          if (!--v21)
          {
            swift_bridgeObjectRelease();
            uint64_t v5 = v94;
            a2 = v95;
            break;
          }
        }
      }
      uint64_t v53 = swift_bridgeObjectRetain();
      uint64_t isUniquelyReferenced_nonNull_native = sub_1C2654F18(v53);
      uint64_t v54 = swift_bridgeObjectRetain();
      uint64_t v55 = sub_1C2654F18(v54);
      unint64_t v29 = v55;
      unint64_t v25 = v92;
      if (*(void *)(isUniquelyReferenced_nonNull_native + 16) == v92)
      {
        if (v92 <= *(void *)(v55 + 16) >> 3)
        {
          uint64_t v103 = (void *)v55;
          swift_bridgeObjectRetain();
          sub_1C274175C(isUniquelyReferenced_nonNull_native);
          uint64_t v56 = (uint64_t)v103;
          if (v103[2])
          {
LABEL_35:
            uint64_t v20 = sub_1C261C11C(v56);
            swift_bridgeObjectRelease();
            unint64_t v25 = (unint64_t)sub_1C2690DAC(0, 1, 1, MEMORY[0x1E4FBC860]);
            unint64_t v21 = *(void *)(v25 + 16);
            unint64_t v32 = *(void *)(v25 + 24);
            uint64_t v26 = v21 + 1;
            if (v21 < v32 >> 1)
            {
LABEL_36:
              *(void *)(v25 + 16) = v26;
              unint64_t v57 = v25 + 40 * v21;
              *(void *)(v57 + 32) = v20;
              *(void *)(v57 + 40) = 0;
              *(void *)(v57 + 48) = 0;
              *(void *)(v57 + 56) = 0;
              *(unsigned char *)(v57 + 64) = 32;
              goto LABEL_57;
            }
LABEL_82:
            unint64_t v25 = (unint64_t)sub_1C2690DAC((void *)(v32 > 1), v26, 1, (void *)v25);
            goto LABEL_36;
          }
        }
        else
        {
          swift_bridgeObjectRetain();
          uint64_t v56 = sub_1C27425EC(isUniquelyReferenced_nonNull_native, v29);
          if (*(void *)(v56 + 16)) {
            goto LABEL_35;
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v25 = MEMORY[0x1E4FBC860];
LABEL_57:
        if (*(void *)(v29 + 16) <= *(void *)(isUniquelyReferenced_nonNull_native + 16) >> 3)
        {
          uint64_t v103 = (void *)isUniquelyReferenced_nonNull_native;
          swift_bridgeObjectRetain();
          sub_1C274175C(v29);
          swift_bridgeObjectRelease();
          uint64_t v76 = (uint64_t)v103;
        }
        else
        {
          swift_bridgeObjectRetain();
          uint64_t v76 = sub_1C27425EC(v29, isUniquelyReferenced_nonNull_native);
          swift_bridgeObjectRelease();
        }
        uint64_t v77 = v101;
        if (!*(void *)(v76 + 16)) {
          goto LABEL_67;
        }
        swift_bridgeObjectRetain();
        uint64_t v78 = v96;
        uint64_t v79 = sub_1C2742E1C(v76, v77);
        uint64_t v96 = v78;
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v25 = (unint64_t)sub_1C2690DAC(0, *(void *)(v25 + 16) + 1, 1, (void *)v25);
        }
        unint64_t v81 = *(void *)(v25 + 16);
        unint64_t v80 = *(void *)(v25 + 24);
        if (v81 >= v80 >> 1) {
          unint64_t v25 = (unint64_t)sub_1C2690DAC((void *)(v80 > 1), v81 + 1, 1, (void *)v25);
        }
        *(void *)(v25 + 16) = v81 + 1;
        unint64_t v82 = v25 + 40 * v81;
        *(void *)(v82 + 32) = v79;
        *(void *)(v82 + 40) = 0;
        *(void *)(v82 + 48) = 0;
        *(void *)(v82 + 56) = 0;
        *(unsigned char *)(v82 + 64) = 0;
        if (*(void *)(v76 + 16) > *(void *)(isUniquelyReferenced_nonNull_native + 16) >> 3)
        {
          uint64_t v83 = sub_1C27425EC(v76, isUniquelyReferenced_nonNull_native);
          swift_bridgeObjectRelease();
        }
        else
        {
LABEL_67:
          uint64_t v103 = (void *)isUniquelyReferenced_nonNull_native;
          sub_1C274175C(v76);
          swift_bridgeObjectRelease();
          uint64_t v83 = (uint64_t)v103;
        }
        uint64_t v84 = v101;
        swift_bridgeObjectRetain();
        uint64_t v85 = sub_1C27438A0(v83, v84, v22);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*(void *)(v85 + 16))
        {
          swift_bridgeObjectRetain();
          uint64_t v86 = sub_1C2742E1C(v85, v84);
          swift_release();
          swift_bridgeObjectRelease_n();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v25 = (unint64_t)sub_1C2690DAC(0, *(void *)(v25 + 16) + 1, 1, (void *)v25);
          }
          unint64_t v88 = *(void *)(v25 + 16);
          unint64_t v87 = *(void *)(v25 + 24);
          if (v88 >= v87 >> 1) {
            unint64_t v25 = (unint64_t)sub_1C2690DAC((void *)(v87 > 1), v88 + 1, 1, (void *)v25);
          }
          *(void *)(v25 + 16) = v88 + 1;
          unint64_t v89 = v25 + 40 * v88;
          *(void *)(v89 + 32) = v86;
          *(void *)(v89 + 40) = 0;
          *(void *)(v89 + 48) = 0;
          *(void *)(v89 + 56) = 0;
          *(unsigned char *)(v89 + 64) = 0;
        }
        else
        {
          swift_release();
          swift_bridgeObjectRelease();
        }
        return v25;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v20 = (void *)sub_1C267D66C(MEMORY[0x1E4FBC860]);
      if (!v25)
      {
LABEL_54:
        unint64_t v25 = (unint64_t)sub_1C2741904((uint64_t)v20);
        swift_bridgeObjectRelease();
        sub_1C26D36C0();
        swift_allocError();
        *(void *)uint64_t v75 = v25;
        *(unsigned char *)(v75 + 8) = 0;
        swift_willThrow();
        return v25;
      }
      unint64_t v102 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t isUniquelyReferenced_nonNull_native = a2 + v102;
      unint64_t v101 = *(void *)(v5 + 72);
      swift_bridgeObjectRetain();
      int64_t v59 = v97;
      uint64_t v58 = v98;
      while (1)
      {
        sub_1C2742DB4(isUniquelyReferenced_nonNull_native, (uint64_t)v59, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        uint64_t v26 = *v59;
        unint64_t v21 = v59[1];
        sub_1C2742DB4((uint64_t)v59, v58, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        swift_bridgeObjectRetain();
        char v60 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v103 = v20;
        unint64_t v29 = sub_1C2629588(v26, v21);
        unint64_t v32 = v20[2];
        BOOL v62 = (v61 & 1) == 0;
        uint64_t v63 = v32 + v62;
        if (__OFADD__(v32, v62)) {
          break;
        }
        char v64 = v61;
        if (v20[3] >= v63)
        {
          if ((v60 & 1) == 0)
          {
            sub_1C2678CFC();
            uint64_t v20 = v103;
          }
        }
        else
        {
          sub_1C26764CC(v63, v60);
          uint64_t v20 = v103;
          unint64_t v65 = sub_1C2629588(v26, v21);
          if ((v64 & 1) != (v66 & 1)) {
            goto LABEL_83;
          }
          unint64_t v29 = v65;
        }
        swift_bridgeObjectRelease();
        if ((v64 & 1) == 0)
        {
          v20[(v29 >> 6) + 8] |= 1 << v29;
          uint64_t v67 = (uint64_t *)(v20[6] + 16 * v29);
          *uint64_t v67 = v26;
          v67[1] = v21;
          *(void *)(v20[7] + 8 * v29) = MEMORY[0x1E4FBC860];
          uint64_t v68 = v20[2];
          BOOL v41 = __OFADD__(v68, 1);
          unint64_t v32 = v68 + 1;
          if (v41) {
            goto LABEL_81;
          }
          v20[2] = v32;
          swift_bridgeObjectRetain();
        }
        uint64_t v69 = v20[7];
        unint64_t v70 = *(void *)(v69 + 8 * v29);
        char v71 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v69 + 8 * v29) = v70;
        if ((v71 & 1) == 0)
        {
          unint64_t v70 = sub_1C2690D64(0, *(void *)(v70 + 16) + 1, 1, v70);
          *(void *)(v69 + 8 * v29) = v70;
        }
        unint64_t v22 = *(void *)(v70 + 16);
        unint64_t v72 = *(void *)(v70 + 24);
        if (v22 >= v72 >> 1)
        {
          unint64_t v70 = sub_1C2690D64(v72 > 1, v22 + 1, 1, v70);
          *(void *)(v69 + 8 * v29) = v70;
        }
        *(void *)(v70 + 16) = v22 + 1;
        unint64_t v73 = v70 + v102;
        unint64_t v74 = v101;
        uint64_t v58 = v98;
        sub_1C2743CA4(v98, v73 + v22 * v101, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        swift_bridgeObjectRelease();
        int64_t v59 = v97;
        sub_1C2742D54((uint64_t)v97, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        isUniquelyReferenced_nonNull_native += v74;
        if (!--v25)
        {
          swift_bridgeObjectRelease();
          goto LABEL_54;
        }
      }
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
      goto LABEL_82;
    }
  }
  sub_1C2676818(v34, isUniquelyReferenced_nonNull_native);
  unint64_t v36 = sub_1C2629588(v27, v26);
  if ((v35 & 1) == (v37 & 1))
  {
    unint64_t v25 = v36;
    uint64_t v20 = v103;
    if ((v35 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_3;
  }
LABEL_83:
  uint64_t result = sub_1C277C850();
  __break(1u);
  return result;
}

void *sub_1C273F534()
{
  uint64_t v1 = v0;
  sub_1C261E8D8();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C277C270();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C273F6E4()
{
  return sub_1C273FD6C(&qword_1EA3045A0, (unint64_t *)&qword_1EBB85E80, 0x1E4F2B2C0, (unint64_t *)&qword_1EBB84498);
}

id sub_1C273F708()
{
  return sub_1C273F720((void (*)(void))sub_1C269B7FC);
}

id sub_1C273F720(void (*a1)(void))
{
  uint64_t v2 = v1;
  a1(0);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1C277C270();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C273F8D0()
{
  return sub_1C273F720((void (*)(void))sub_1C269B768);
}

void *sub_1C273F8E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UserProfile();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2643B90();
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1C277C270();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v8;
    return result;
  }
  id result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v6 + 56);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v17) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v17) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v10 + 8 * v13);
      if (!v22)
      {
        int64_t v13 = v21 + 2;
        if (v21 + 2 >= v17) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v10 + 8 * v13);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    unint64_t v20 = *(void *)(v3 + 72) * v19;
    sub_1C2742DB4(*(void *)(v6 + 48) + v20, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for UserProfile);
    id result = (void *)sub_1C2743CA4((uint64_t)v5, *(void *)(v8 + 48) + v20, (uint64_t (*)(void))type metadata accessor for UserProfile);
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v17) {
    goto LABEL_28;
  }
  unint64_t v22 = *(void *)(v10 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v17) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v10 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C273FB44()
{
  return sub_1C273F720((void (*)(void))sub_1C269B2FC);
}

void *sub_1C273FB5C()
{
  uint64_t v1 = v0;
  sub_1C269B708(0, &qword_1EA304630, (void (*)(void))sub_1C265DA88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C277C270();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C273FD30()
{
  return sub_1C273F720((void (*)(void))sub_1C269B674);
}

id sub_1C273FD48()
{
  return sub_1C273FD6C(&qword_1EBB80F20, (unint64_t *)&qword_1EBB85150, 0x1E4F1C118, &qword_1EBB85158);
}

id sub_1C273FD6C(unint64_t *a1, unint64_t *a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v5 = v4;
  sub_1C269B5E8(0, a1, a2, a3, a4);
  uint64_t v6 = *v4;
  uint64_t v7 = sub_1C277C270();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v5 = v8;
    return result;
  }
  id result = (id)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v6 + 56);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v17) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v10 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v17) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v10 + 8 * v13);
      if (!v23)
      {
        int64_t v13 = v22 + 2;
        if (v22 + 2 >= v17) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v10 + 8 * v13);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v19 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    uint64_t v20 = 8 * v19;
    unint64_t v21 = *(void **)(*(void *)(v6 + 48) + v20);
    *(void *)(*(void *)(v8 + 48) + v20) = v21;
    id result = v21;
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v17) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v10 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v17) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v10 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C273FF24()
{
  return sub_1C273F720((void (*)(void))sub_1C269B4C0);
}

id sub_1C273FF3C()
{
  return sub_1C273FD6C(&qword_1EBB83028, &qword_1EBB80D80, 0x1E4F2B448, &qword_1EBB80D88);
}

id sub_1C273FF60()
{
  uint64_t v1 = v0;
  sub_1C269B554();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C277C270();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1C2740108()
{
  uint64_t v1 = v0;
  sub_1C269B708(0, &qword_1EBB83760, (void (*)(void))sub_1C26497D4);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C277C270();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C27402BC()
{
  return sub_1C273FD6C(&qword_1EA304598, &qword_1EBB80DB0, 0x1E4F2B5D8, &qword_1EBB82F98);
}

void *sub_1C27402E0()
{
  uint64_t v1 = v0;
  sub_1C269B708(0, &qword_1EA3045E0, (void (*)(void))sub_1C265D79C);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C277C270();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v13) {
      goto LABEL_28;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27)
      {
        int64_t v9 = v26 + 2;
        if (v26 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v27 = *(void *)(v6 + 8 * v9);
        if (!v27) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 56 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v19 = *(void *)(v17 + 16);
    uint64_t v18 = *(void *)(v17 + 24);
    uint64_t v21 = *(void *)(v17 + 32);
    uint64_t v20 = *(void *)(v17 + 40);
    uint64_t v22 = *(void *)(v17 + 48);
    uint64_t v23 = *(void *)(v4 + 48) + v16;
    long long v24 = *(_OWORD *)v17;
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v17;
    *(void *)(v23 + 16) = v19;
    *(void *)(v23 + 24) = v18;
    *(void *)(v23 + 32) = v21;
    *(void *)(v23 + 40) = v20;
    *(void *)(v23 + 48) = v22;
    id v25 = (id)v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 3;
  if (v28 >= v13) {
    goto LABEL_28;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1C27404F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C277A8A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C269AFF4();
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1C277C270();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)swift_release();
LABEL_30:
    *uint64_t v1 = v8;
    return result;
  }
  id result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  uint64_t v23 = v1;
  long long v24 = (const void *)(v6 + 56);
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    id result = memmove(result, v24, 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v25 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v25) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v24 + v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_28;
      }
      unint64_t v20 = *((void *)v24 + v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v25) {
          goto LABEL_28;
        }
        unint64_t v20 = *((void *)v24 + v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v15 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_12:
    unint64_t v18 = *(void *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v18, v2);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v18, v5, v2);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v25)
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_30;
  }
  unint64_t v20 = *((void *)v24 + v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v25) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v24 + v12);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

id sub_1C274079C()
{
  uint64_t v1 = v0;
  sub_1C269B708(0, &qword_1EBB83018, (void (*)(void))sub_1C265D678);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C277C270();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C2740968()
{
  return sub_1C273FD6C(&qword_1EBB842E8, &qword_1EBB84260, 0x1E4F2B3B8, (unint64_t *)&qword_1EBB84268);
}

void *sub_1C274098C()
{
  uint64_t v1 = v0;
  sub_1C269B708(0, &qword_1EA3045C0, (void (*)(void))sub_1C269AEBC);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C277C270();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C2740B40()
{
  return sub_1C273FD6C(&qword_1EA3045A8, (unint64_t *)&qword_1EBB82FE0, 0x1E4F2B4B8, &qword_1EBB82FF0);
}

uint64_t sub_1C2740B64(void *a1)
{
  uint64_t v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v4 = a1;
    char v5 = sub_1C277C210();

    if (v5)
    {
      uint64_t v6 = sub_1C27410C8();
      swift_bridgeObjectRelease();
      return v6;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1C277C020();
  uint64_t v8 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
    goto LABEL_12;
  }
  type metadata accessor for EncodedFeatureTag();
  id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
  char v11 = sub_1C277C030();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v12;
      if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_12;
      }
      id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
      char v14 = sub_1C277C030();
    }
    while ((v14 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v1;
  uint64_t v18 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C273F720((void (*)(void))sub_1C269AF60);
    uint64_t v16 = v18;
  }
  uint64_t v6 = *(void *)(*(void *)(v16 + 48) + 8 * v9);
  sub_1C27413F0(v9);
  *uint64_t v1 = v18;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1C2740D40(void *a1)
{
  uint64_t v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v4 = a1;
    char v5 = sub_1C277C210();

    if (v5)
    {
      uint64_t v6 = sub_1C2741254();
      swift_bridgeObjectRelease();
      return v6;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1C277C020();
  uint64_t v8 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
    goto LABEL_12;
  }
  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85150);
  id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
  char v11 = sub_1C277C030();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v12;
      if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_12;
      }
      id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
      char v14 = sub_1C277C030();
    }
    while ((v14 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v1;
  uint64_t v18 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C273FD6C(&qword_1EBB80F20, (unint64_t *)&qword_1EBB85150, 0x1E4F1C118, &qword_1EBB85158);
    uint64_t v16 = v18;
  }
  uint64_t v6 = *(void *)(*(void *)(v16 + 48) + 8 * v9);
  sub_1C27413F0(v9);
  *uint64_t v1 = v18;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1C2740F38(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_1C277C8C0();
  swift_bridgeObjectRetain();
  sub_1C277B8B0();
  uint64_t v6 = sub_1C277C910();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  id v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1C277C7E0() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1C277C7E0() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C273F534();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_1C2741594(v8);
  uint64_t *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1C27410C8()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1C277C1C0();
  uint64_t v3 = swift_unknownObjectRetain();
  uint64_t v4 = sub_1C2693C80(v3, v2);
  uint64_t v15 = v4;
  swift_retain();
  uint64_t v5 = sub_1C277C020();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    type metadata accessor for EncodedFeatureTag();
    id v8 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
    char v9 = sub_1C277C030();

    if (v9)
    {
LABEL_6:
      swift_release();
      uint64_t v13 = *(void *)(*(void *)(v4 + 48) + 8 * v7);
      sub_1C27413F0(v7);
      if (sub_1C277C030())
      {
        *uint64_t v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      uint64_t v10 = ~v6;
      while (1)
      {
        unint64_t v7 = (v7 + 1) & v10;
        if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          break;
        }
        id v11 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
        char v12 = sub_1C277C030();

        if (v12) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1C2741254()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1C277C1C0();
  uint64_t v3 = swift_unknownObjectRetain();
  uint64_t v4 = sub_1C2693CC0(v3, v2);
  uint64_t v15 = v4;
  swift_retain();
  uint64_t v5 = sub_1C277C020();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85150);
    id v8 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
    char v9 = sub_1C277C030();

    if (v9)
    {
LABEL_6:
      swift_release();
      uint64_t v13 = *(void *)(*(void *)(v4 + 48) + 8 * v7);
      sub_1C27413F0(v7);
      if (sub_1C277C030())
      {
        *uint64_t v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      uint64_t v10 = ~v6;
      while (1)
      {
        unint64_t v7 = (v7 + 1) & v10;
        if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          break;
        }
        id v11 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
        char v12 = sub_1C277C030();

        if (v12) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_1C27413F0(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_1C277C130();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        uint64_t v11 = sub_1C277C020();

        unint64_t v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(v3 + 48);
            uint64_t v16 = (void *)(v15 + 8 * v2);
            BOOL v17 = (void *)(v15 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v16 >= v17 + 1))
            {
              *uint64_t v16 = *v17;
              int64_t v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v18 = *(void *)(v3 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_1C2741594(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_1C277C130();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_1C277C8C0();
        swift_bridgeObjectRetain();
        sub_1C277B8B0();
        uint64_t v10 = sub_1C277C910();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *uint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1C274175C(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    unint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1C2740F38(v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:

  return swift_release();
}

unint64_t *sub_1C2741904(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x1E4F143B8];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    unint64_t v6 = sub_1C2741A5C((void *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    int64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v2 = sub_1C2741A5C((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x1C875D230](v7, -1, -1);
  }
  return v2;
}

unint64_t *sub_1C2741A5C(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10) {
      return (unint64_t *)sub_1C2741E44(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v10) {
        return (unint64_t *)sub_1C2741E44(result, a2, v4, a3);
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v10) {
          return (unint64_t *)sub_1C2741E44(result, a2, v4, a3);
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    if (*(void *)(*(void *)(*(void *)(a3 + 56) + 8 * v12) + 16) >= 2uLL)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_1C2741E44(result, a2, v4, a3);
      }
    }
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v10) {
    return (unint64_t *)sub_1C2741E44(result, a2, v4, a3);
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v10) {
      return (unint64_t *)sub_1C2741E44(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1C2741BB0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_1C267BD38();
  uint64_t result = sub_1C277C5F0();
  uint64_t v8 = result;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v31) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v31) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v31) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v31) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v31) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = 8 * v13;
    uint64_t v18 = *(void **)(*(void *)(v4 + 56) + v17);
    id v19 = *(id *)(*(void *)(v4 + 48) + v17);
    id v20 = v18;
    uint64_t result = sub_1C277C020();
    uint64_t v21 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t v29 = 8 * v24;
    *(void *)(*(void *)(v8 + 48) + v29) = v19;
    *(void *)(*(void *)(v8 + 56) + v29) = v20;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C2741E44(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_1C2743BA8();
  uint64_t result = sub_1C277C5F0();
  uint64_t v9 = result;
  unint64_t v32 = a1;
  uint64_t v33 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v33) {
        return v9;
      }
      unint64_t v16 = v32[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= v33) {
          return v9;
        }
        unint64_t v16 = v32[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= v33) {
            return v9;
          }
          unint64_t v16 = v32[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= v33) {
              return v9;
            }
            unint64_t v16 = v32[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= v33) {
                  return v9;
                }
                unint64_t v16 = v32[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = *(void *)(*(void *)(v4 + 56) + 8 * v14);
    sub_1C277C8C0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C277B8B0();
    uint64_t result = sub_1C277C910();
    uint64_t v22 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v24);
      }
      while (v29 == -1);
      unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t v30 = (void *)(*(void *)(v9 + 48) + 16 * v25);
    *uint64_t v30 = v20;
    v30[1] = v19;
    *(void *)(*(void *)(v9 + 56) + 8 * v25) = v21;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C27420DC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x1E4FBC870];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_1C261E8D8();
  uint64_t result = sub_1C277C2A0();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_1C277C8C0();
    swift_bridgeObjectRetain();
    sub_1C277B8B0();
    uint64_t result = sub_1C277C910();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    BOOL v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *BOOL v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1C2742370(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x1E4FBC870];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_1C269B5E8(0, &qword_1EA304598, &qword_1EBB80DB0, 0x1E4F2B5D8, &qword_1EBB82F98);
  uint64_t result = sub_1C277C2A0();
  uint64_t v9 = result;
  BOOL v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    id v18 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_1C277C020();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1C27425EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_1C2648F6C();
                  return v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      unint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_1C277C8C0();
      swift_bridgeObjectRetain();
      sub_1C277B8B0();
      uint64_t v19 = sub_1C277C910();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    char v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_1C277C7E0() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        uint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_1C277C7E0() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x1F4188790](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_1C2742A5C((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_1C2648F6C();
    }
    else
    {
      uint64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_1C2742A5C((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_1C2648F6C();
      MEMORY[0x1C875D230](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
}

uint64_t sub_1C2742A5C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v39 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v40 = a3 + 56;
  while (2)
  {
    uint64_t v38 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v15 = a5[3];
        if (v13 >= v14) {
          goto LABEL_45;
        }
        uint64_t v16 = a5[1];
        unint64_t v17 = *(void *)(v16 + 8 * v13);
        if (!v17)
        {
          int64_t v18 = v9 + 2;
          int64_t v15 = v9 + 1;
          if (v9 + 2 >= v14) {
            goto LABEL_45;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (!v17)
          {
            int64_t v15 = v9 + 2;
            if (v9 + 3 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              int64_t v13 = v9 + 3;
              goto LABEL_15;
            }
            int64_t v18 = v9 + 4;
            int64_t v15 = v9 + 3;
            if (v9 + 4 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (!v17)
            {
              int64_t v13 = v9 + 5;
              int64_t v15 = v9 + 4;
              if (v9 + 5 >= v14) {
                goto LABEL_45;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v13);
              if (!v17)
              {
                int64_t v15 = v14 - 1;
                int64_t v36 = v9 + 6;
                while (v14 != v36)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    int64_t v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_1C27420DC(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          int64_t v13 = v18;
        }
LABEL_15:
        uint64_t v11 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
        int64_t v9 = v13;
LABEL_16:
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_1C277C8C0();
        swift_bridgeObjectRetain();
        sub_1C277B8B0();
        uint64_t v22 = sub_1C277C910();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v40 + 8 * (v24 >> 6))) == 0) {
          goto LABEL_3;
        }
        uint64_t v27 = *(void *)(a3 + 48);
        BOOL v28 = (void *)(v27 + 16 * v24);
        BOOL v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_1C277C7E0() & 1) != 0) {
          break;
        }
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          uint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_1C277C7E0() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        uint64_t result = swift_bridgeObjectRelease();
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_23:
      unint64_t v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1) {
      continue;
    }
    return MEMORY[0x1E4FBC870];
  }
}

uint64_t sub_1C2742D54(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C2742DB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C2742E1C(uint64_t a1, uint64_t a2)
{
  sub_1C2743C40(0, &qword_1EBB85780, (uint64_t (*)(uint64_t))type metadata accessor for PluginFeedItem, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v39 - v5;
  uint64_t v7 = type metadata accessor for PluginFeedItem();
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v42 = (uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v41 = (uint64_t)&v39 - v11;
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v44 = v10;
  uint64_t v45 = a1 + 56;
  uint64_t v13 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v12;
  int64_t v46 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v16 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  unint64_t v17 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  uint64_t v18 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v20 = 0;
  unint64_t v43 = MEMORY[0x1E4FBC860];
  if (!v15) {
    goto LABEL_9;
  }
LABEL_7:
  unint64_t v21 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  unint64_t v22 = v21 | (v20 << 6);
  if (!*(void *)(a2 + 16))
  {
LABEL_5:
    (*v16)(v6, 1, 1, v7);
    goto LABEL_6;
  }
  while (1)
  {
    uint64_t v26 = (uint64_t *)(*(void *)(v18 + 48) + 16 * v22);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    swift_bridgeObjectRetain();
    unint64_t v29 = sub_1C2629588(v27, v28);
    if (v30)
    {
      sub_1C2742DB4(*(void *)(a2 + 56) + *(void *)(v44 + 72) * v29, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v31 = 1;
    }
    (*v16)(v6, v31, 1, v7);
    swift_bridgeObjectRelease();
    if ((*v17)(v6, 1, v7) == 1)
    {
LABEL_6:
      uint64_t result = sub_1C2743B38((uint64_t)v6, &qword_1EBB85780, (uint64_t (*)(uint64_t))type metadata accessor for PluginFeedItem);
      if (v15) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v40 = type metadata accessor for PluginFeedItem;
      uint64_t v32 = v41;
      sub_1C2743CA4((uint64_t)v6, v41, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      sub_1C2743CA4(v32, v42, (uint64_t (*)(void))v40);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v43 = sub_1C2690D64(0, *(void *)(v43 + 16) + 1, 1, v43);
      }
      unint64_t v34 = *(void *)(v43 + 16);
      unint64_t v33 = *(void *)(v43 + 24);
      BOOL v35 = (uint64_t (*)())(v34 + 1);
      if (v34 >= v33 >> 1)
      {
        uint64_t v40 = (uint64_t (*)())(v34 + 1);
        uint64_t v38 = sub_1C2690D64(v33 > 1, v34 + 1, 1, v43);
        BOOL v35 = v40;
        unint64_t v43 = v38;
      }
      unint64_t v37 = v43;
      uint64_t v36 = v44;
      *(void *)(v43 + 16) = v35;
      uint64_t result = sub_1C2743CA4(v42, v37+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(void *)(v36 + 72) * v34, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      if (v15) {
        goto LABEL_7;
      }
    }
LABEL_9:
    int64_t v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v23 >= v46) {
      goto LABEL_35;
    }
    unint64_t v24 = *(void *)(v45 + 8 * v23);
    ++v20;
    if (!v24)
    {
      int64_t v20 = v23 + 1;
      if (v23 + 1 >= v46) {
        goto LABEL_35;
      }
      unint64_t v24 = *(void *)(v45 + 8 * v20);
      if (!v24)
      {
        int64_t v20 = v23 + 2;
        if (v23 + 2 >= v46) {
          goto LABEL_35;
        }
        unint64_t v24 = *(void *)(v45 + 8 * v20);
        if (!v24)
        {
          int64_t v20 = v23 + 3;
          if (v23 + 3 >= v46) {
            goto LABEL_35;
          }
          unint64_t v24 = *(void *)(v45 + 8 * v20);
          if (!v24) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v20 << 6);
    if (!*(void *)(a2 + 16)) {
      goto LABEL_5;
    }
  }
  int64_t v25 = v23 + 4;
  if (v25 >= v46)
  {
LABEL_35:
    swift_release();
    return v43;
  }
  unint64_t v24 = *(void *)(v45 + 8 * v25);
  if (v24)
  {
    int64_t v20 = v25;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v20 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v20 >= v46) {
      goto LABEL_35;
    }
    unint64_t v24 = *(void *)(v45 + 8 * v20);
    ++v25;
    if (v24) {
      goto LABEL_24;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1C27432C4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v50 = a2;
  uint64_t v57 = a5;
  uint64_t v51 = a1;
  sub_1C2743C40(0, &qword_1EBB85780, (uint64_t (*)(uint64_t))type metadata accessor for PluginFeedItem, MEMORY[0x1E4FBB718]);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v56 = (uint64_t)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v60 = (uint64_t)&v49 - v10;
  uint64_t v11 = type metadata accessor for PluginFeedItem();
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v55 = (uint64_t)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v12);
  uint64_t v61 = a3;
  uint64_t v62 = (uint64_t)&v49 - v16;
  int64_t v17 = 0;
  uint64_t v18 = *(void *)(a3 + 56);
  uint64_t v52 = 0;
  uint64_t v53 = a3 + 56;
  uint64_t v19 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v18;
  int64_t v54 = (unint64_t)(v19 + 63) >> 6;
  char v64 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
  uint64_t v58 = v15;
  uint64_t v59 = a4;
  uint64_t v63 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  while (v21)
  {
    unint64_t v25 = __clz(__rbit64(v21));
    v21 &= v21 - 1;
    unint64_t v26 = v25 | (v17 << 6);
LABEL_23:
    char v30 = (uint64_t *)(*(void *)(v61 + 48) + 16 * v26);
    uint64_t v31 = v30[1];
    if (*(void *)(a4 + 16))
    {
      uint64_t v32 = *v30;
      swift_bridgeObjectRetain_n();
      unint64_t v33 = sub_1C2629588(v32, v31);
      if (v34)
      {
        uint64_t v35 = v58;
        uint64_t v36 = *(void *)(a4 + 56) + *(void *)(v58 + 72) * v33;
        uint64_t v37 = v60;
        sub_1C2742DB4(v36, v60, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        uint64_t v38 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56);
        v38(v37, 0, 1, v11);
      }
      else
      {
        uint64_t v38 = *v64;
        uint64_t v37 = v60;
        (*v64)(v60, 1, 1, v11);
      }
      swift_bridgeObjectRelease();
      uint64_t v39 = *v63;
      if ((*v63)(v37, 1, v11) == 1) {
        goto LABEL_37;
      }
      sub_1C2743CA4(v37, v62, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      uint64_t v40 = v57;
      if (!*(void *)(v57 + 16))
      {
        uint64_t v37 = v56;
        v38(v56, 1, 1, v11);
LABEL_36:
        sub_1C2742D54(v62, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
LABEL_37:
        uint64_t v23 = v37;
        a4 = v59;
        goto LABEL_5;
      }
      swift_bridgeObjectRetain();
      unint64_t v41 = sub_1C2629588(v32, v31);
      if (v42)
      {
        uint64_t v43 = *(void *)(v40 + 56) + *(void *)(v58 + 72) * v41;
        uint64_t v37 = v56;
        sub_1C2742DB4(v43, v56, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
        uint64_t v44 = 0;
      }
      else
      {
        uint64_t v44 = 1;
        uint64_t v37 = v56;
      }
      v38(v37, v44, 1, v11);
      swift_bridgeObjectRelease();
      if (v39(v37, 1, v11) == 1) {
        goto LABEL_36;
      }
      uint64_t v45 = v55;
      sub_1C2743CA4(v37, v55, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      uint64_t v46 = v62;
      BOOL v47 = PluginFeedItem.hasChanged(from:)(v45);
      sub_1C2742D54(v45, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      sub_1C2742D54(v46, (uint64_t (*)(void))type metadata accessor for PluginFeedItem);
      uint64_t result = swift_bridgeObjectRelease();
      a4 = v59;
      if (v47) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v22 = v60;
      (*v64)(v60, 1, 1, v11);
      swift_bridgeObjectRetain();
      uint64_t v23 = v22;
LABEL_5:
      sub_1C2743B38(v23, &qword_1EBB85780, (uint64_t (*)(uint64_t))type metadata accessor for PluginFeedItem);
      uint64_t result = swift_bridgeObjectRelease();
LABEL_6:
      *(unint64_t *)((char *)v51 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      if (__OFADD__(v52++, 1)) {
        goto LABEL_40;
      }
    }
  }
  int64_t v27 = v17 + 1;
  if (!__OFADD__(v17, 1))
  {
    if (v27 >= v54) {
      goto LABEL_38;
    }
    unint64_t v28 = *(void *)(v53 + 8 * v27);
    ++v17;
    if (!v28)
    {
      int64_t v17 = v27 + 1;
      if (v27 + 1 >= v54) {
        goto LABEL_38;
      }
      unint64_t v28 = *(void *)(v53 + 8 * v17);
      if (!v28)
      {
        int64_t v17 = v27 + 2;
        if (v27 + 2 >= v54) {
          goto LABEL_38;
        }
        unint64_t v28 = *(void *)(v53 + 8 * v17);
        if (!v28)
        {
          int64_t v29 = v27 + 3;
          if (v29 >= v54)
          {
LABEL_38:
            uint64_t v48 = v61;
            swift_retain();
            return sub_1C27420DC(v51, v50, v52, v48);
          }
          unint64_t v28 = *(void *)(v53 + 8 * v29);
          if (!v28)
          {
            while (1)
            {
              int64_t v17 = v29 + 1;
              if (__OFADD__(v29, 1)) {
                goto LABEL_41;
              }
              if (v17 >= v54) {
                goto LABEL_38;
              }
              unint64_t v28 = *(void *)(v53 + 8 * v17);
              ++v29;
              if (v28) {
                goto LABEL_22;
              }
            }
          }
          int64_t v17 = v29;
        }
      }
    }
LABEL_22:
    unint64_t v21 = (v28 - 1) & v28;
    unint64_t v26 = __clz(__rbit64(v28)) + (v17 << 6);
    goto LABEL_23;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C27438A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v10 = 8 * v9;
  swift_bridgeObjectRetain_n();
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1C27432C4((void *)((char *)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0)), v9, a1, a2, a3);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v3) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = (void *)swift_slowAlloc();
    bzero(v13, v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1C27432C4((unint64_t *)v13, v9, a1, a2, a3);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x1C875D230](v13, -1, -1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1C2743AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PluginFeedItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2743B38(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1C2743C40(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1C2743BA8()
{
  if (!qword_1EA3043D0)
  {
    sub_1C2743C40(255, &qword_1EBB83740, (uint64_t (*)(uint64_t))type metadata accessor for PluginFeedItem, MEMORY[0x1E4FBB320]);
    unint64_t v0 = sub_1C277C600();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA3043D0);
    }
  }
}

void sub_1C2743C40(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1C2743CA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id Feed.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id Feed.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for Feed();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id Feed.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Feed();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static Plugin.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1C0D0]);
  uint64_t v1 = (void *)sub_1C277B820();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

char *keypath_get_selector_package()
{
  return sel_package;
}

void sub_1C2743E6C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_package);
  uint64_t v4 = sub_1C277B850();
  uint64_t v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

void sub_1C2743EC8(uint64_t a1, void **a2)
{
  id v2 = *a2;
  id v3 = (id)sub_1C277B820();
  objc_msgSend(v2, sel_setPackage_, v3);
}

void sub_1C2743F2C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_allPluginData);
  type metadata accessor for PluginData();
  sub_1C2744024();
  uint64_t v4 = sub_1C277BBC0();

  *a2 = v4;
}

void sub_1C2743FA0(uint64_t a1, void **a2)
{
  id v2 = *a2;
  type metadata accessor for PluginData();
  sub_1C2744024();
  id v3 = (id)sub_1C277BBB0();
  objc_msgSend(v2, sel_setAllPluginData_, v3);
}

unint64_t sub_1C2744024()
{
  unint64_t result = qword_1EA304B90;
  if (!qword_1EA304B90)
  {
    type metadata accessor for PluginData();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA304B90);
  }
  return result;
}

id static SharableModelReference.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1C0D0]);
  uint64_t v1 = (void *)sub_1C277B820();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1C27440E8()
{
  return MEMORY[0x1E4FBB060];
}

uint64_t sub_1C27440F4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SharableModelReference();
  uint64_t result = sub_1C277C2F0();
  *a1 = result;
  return result;
}

void sub_1C274413C(uint64_t a1, void **a2)
{
  id v2 = *a2;
  id v3 = (id)sub_1C277B820();
  objc_msgSend(v2, sel_setIdentifier_, v3);
}

id sub_1C27441A0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_feedItem);
  *a2 = result;
  return result;
}

id sub_1C27441DC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFeedItem_, *a1);
}

void *ContentStateManager.getMostRecentEntry(in:)(unint64_t a1)
{
  uint64_t v48 = sub_1C277A840();
  uint64_t v2 = *(void *)(v48 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v48);
  BOOL v47 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v46 = (char *)&v38 - v5;
  if (a1 >> 62) {
    goto LABEL_39;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_3:
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  unint64_t v40 = a1;
  unint64_t v41 = a1 & 0xC000000000000001;
  unint64_t v38 = a1 + 32;
  uint64_t v39 = v6;
  uint64_t v45 = (void (**)(char *, uint64_t))(v2 + 8);
  do
  {
    if (v41) {
      id v10 = (id)sub_1C2747C48(v7, a1, &qword_1EBB83000);
    }
    else {
      id v10 = *(id *)(v38 + 8 * v7);
    }
    id v9 = v10;
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_1C277C5A0();
      if (!v6) {
        goto LABEL_40;
      }
      goto LABEL_3;
    }
    id v12 = objc_msgSend(v10, sel_storageEntries);
    sub_1C2644ED8(0, &qword_1EA304900);
    unint64_t v13 = sub_1C277BA40();

    if (v13 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_1C277C5A0();
      if (!v2) {
        goto LABEL_33;
      }
LABEL_13:
      if (v2 >= 1)
      {
        id v42 = v9;
        unint64_t v43 = v7;
        uint64_t v44 = v8;
        unint64_t v14 = 0;
        uint64_t v15 = 0;
        unint64_t v49 = v13 & 0xC000000000000001;
        while (1)
        {
          if (v49)
          {
            id v16 = (id)sub_1C2747C48(v14, v13, &qword_1EA304900);
            if (v15) {
              goto LABEL_20;
            }
          }
          else
          {
            id v16 = *(id *)(v13 + 8 * v14 + 32);
            if (v15)
            {
LABEL_20:
              id v17 = v15;
              id v18 = objc_msgSend(v17, sel_modificationDate);
              uint64_t v19 = v2;
              unint64_t v20 = v13;
              unint64_t v21 = v46;
              sub_1C277A810();

              id v22 = objc_msgSend(v16, sel_modificationDate);
              uint64_t v23 = v47;
              sub_1C277A810();

              char v24 = sub_1C277A7F0();
              unint64_t v25 = *v45;
              unint64_t v26 = v23;
              uint64_t v27 = v48;
              (*v45)(v26, v48);
              unint64_t v28 = v21;
              unint64_t v13 = v20;
              uint64_t v2 = v19;
              v25(v28, v27);

              if (v24) {
                int64_t v29 = v17;
              }
              else {
                int64_t v29 = v16;
              }
              if ((v24 & 1) == 0) {
                id v16 = v17;
              }
            }
          }
          ++v14;
          uint64_t v15 = v16;
          if (v2 == v14)
          {
            swift_bridgeObjectRelease_n();
            unint64_t v8 = v44;
            if (!v44)
            {
              unint64_t v8 = v16;
              uint64_t v6 = v39;
              a1 = v40;
              id v9 = v42;
              unint64_t v7 = v43;
              goto LABEL_6;
            }
            if (v16)
            {
              id v9 = v16;
              uint64_t v2 = v8;
              id v30 = objc_msgSend((id)v2, sel_modificationDate);
              uint64_t v31 = v46;
              sub_1C277A810();

              id v32 = objc_msgSend(v9, sel_modificationDate);
              unint64_t v33 = v47;
              sub_1C277A810();

              LOBYTE(v32) = sub_1C277A7F0();
              char v34 = *v45;
              uint64_t v35 = v33;
              uint64_t v36 = v48;
              (*v45)(v35, v48);
              v34(v31, v36);

              if (v32)
              {

                id v9 = (id)v2;
                unint64_t v8 = v16;
              }
              else
              {

                uint64_t v2 = (uint64_t)v42;
              }
              uint64_t v6 = v39;
              a1 = v40;
              unint64_t v7 = v43;
            }
            else
            {
              uint64_t v2 = (uint64_t)v44;
              unint64_t v8 = 0;
              uint64_t v6 = v39;
              a1 = v40;
              id v9 = v42;
              unint64_t v7 = v43;
            }
LABEL_35:

            goto LABEL_6;
          }
        }
      }
      goto LABEL_38;
    }
    uint64_t v2 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_13;
    }
LABEL_33:
    swift_bridgeObjectRelease_n();
    if (v8)
    {
      uint64_t v2 = (uint64_t)v8;
      unint64_t v8 = 0;
      goto LABEL_35;
    }
LABEL_6:
  }
  while (v7 != v6);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t ContentStateManager.getEntries<A>(from:decoder:)()
{
  sub_1C277BAA0();
  sub_1C26D8890(0, (unint64_t *)&qword_1EBB82E58, &qword_1EBB83000);
  sub_1C277BB20();
  sub_1C2748B98(&qword_1EA305540, (unint64_t *)&qword_1EBB82E58, &qword_1EBB83000);
  sub_1C277B9A0();
  return v1;
}

uint64_t NotificationContentStateManager.createMigrationPublisher(with:identifier:keyValueDomain:dispatchQueue:migrationKey:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v43 = a7;
  uint64_t v44 = a6;
  id v42 = a5;
  uint64_t v46 = a4;
  uint64_t v51 = a2;
  uint64_t v52 = a3;
  uint64_t v53 = a1;
  uint64_t v11 = *(void *)(a8 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v50 = a9;
  MEMORY[0x1F4188790](a1);
  BOOL v47 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = (void (*)(uint64_t))MEMORY[0x1E4FBCC28];
  sub_1C2747FC4(0, &qword_1EBB84A68, MEMORY[0x1E4FBCC28]);
  MEMORY[0x1F4188790](v14 - 8);
  id v16 = (char *)&v41 - v15;
  sub_1C26C9EFC(0);
  uint64_t v57 = v17;
  uint64_t v59 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v45 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_1C26C9EFC;
  int64_t v54 = sub_1C26CA008;
  sub_1C2748874(0, &qword_1EBB82B90, sub_1C26C9EFC, (void (*)(void))sub_1C26CA008);
  uint64_t v56 = v19;
  uint64_t v58 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v48 = (char *)&v41 - v20;
  uint64_t v21 = sub_1C277BDB0();
  uint64_t v60 = a5;
  uint64_t v61 = v21;
  uint64_t v22 = sub_1C277BE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v16, 1, 1, v22);
  sub_1C2748398(0, (unint64_t *)&qword_1EBB82D30, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928], MEMORY[0x1E4F1AC28]);
  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85180);
  sub_1C26C9FD0();
  sub_1C264E780();
  sub_1C277B5C0();
  sub_1C27487D4((uint64_t)v16, &qword_1EBB84A68, v13);
  swift_release();
  uint64_t v23 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v47, v49, a8);
  unint64_t v24 = (*(unsigned __int8 *)(v11 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v25 = (v12 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (char *)swift_allocObject();
  uint64_t v27 = v50;
  *((void *)v26 + 2) = a8;
  *((void *)v26 + 3) = v27;
  uint64_t v28 = v52;
  *((void *)v26 + 4) = v51;
  *((void *)v26 + 5) = v28;
  uint64_t v29 = v43;
  *((void *)v26 + 6) = v44;
  *((void *)v26 + 7) = v29;
  id v30 = v42;
  *((void *)v26 + 8) = v53;
  *((void *)v26 + 9) = v30;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v26[v24], v23, a8);
  uint64_t v31 = v46;
  *(void *)&v26[v25] = v46;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  id v32 = v30;
  id v33 = v31;
  sub_1C277B330();
  char v34 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
  sub_1C261761C(0, &qword_1EBB82CD0, MEMORY[0x1E4F1AAE0]);
  sub_1C26CA008();
  sub_1C2748018(&qword_1EBB82CC8, &qword_1EBB82CD0, v34);
  uint64_t v35 = v48;
  uint64_t v36 = v57;
  uint64_t v37 = v45;
  sub_1C277B5A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v37, v36);
  sub_1C2748234((unint64_t *)&qword_1EBB82B88, &qword_1EBB82B90, v55, (void (*)(void))v54);
  uint64_t v38 = v56;
  uint64_t v39 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v35, v38);
  return v39;
}

uint64_t sub_1C2744D00@<X0>(id *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  id v6 = objc_msgSend(*a1, sel_value);
  uint64_t v7 = sub_1C277A780();
  unint64_t v9 = v8;

  sub_1C277A480();
  if (v3)
  {
    sub_1C263CC84(v7, v9);
    if (qword_1EBB86260 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1C277B130();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EBB86280);
    id v11 = v3;
    id v12 = v3;
    unint64_t v13 = sub_1C277B100();
    os_log_type_t v14 = sub_1C277BD20();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = v24;
      *(_DWORD *)uint64_t v15 = 136315906;
      uint64_t v16 = sub_1C277C9E0();
      sub_1C263FDFC(v16, v17, &v25);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      sub_1C263FDFC(0xD000000000000017, 0x80000001C278C550, &v25);
      sub_1C277C0D0();
      *(_WORD *)(v15 + 22) = 2080;
      uint64_t v18 = sub_1C277C9E0();
      sub_1C263FDFC(v18, v19, &v25);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 32) = 2082;
      id v20 = v3;
      sub_1C26532A4();
      uint64_t v21 = sub_1C277B870();
      sub_1C263FDFC(v21, v22, &v25);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C2601000, v13, v14, "%s %s %s Error: %{public}s", (uint8_t *)v15, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v24, -1, -1);
      MEMORY[0x1C875D230](v15, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, 1, 1, a2);
  }
  else
  {
    sub_1C263CC84(v7, v9);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, 0, 1, a2);
  }
}

uint64_t NotificationContentStateManager.getContentState(for:legacyStringIdentifier:legacyKeyValueDomain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v29 = a5;
  uint64_t v14 = *(void *)(a6 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](a1);
  sub_1C2748284();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v31 = v16;
  uint64_t v32 = v17;
  MEMORY[0x1F4188790](v16);
  id v30 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = NotificationContentStateManager.migrateStringContentStateIfNecessary(contentStateIdentifier:notificationIdentifier:keyValueDomain:)(a3, a4, a1, a2, v29, a6, a7);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v7, a6);
  unint64_t v19 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a6;
  *(void *)(v20 + 24) = a7;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v20 + v19, (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a6);
  uint64_t v21 = (uint64_t *)(v20 + ((v15 + v19 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v21 = a1;
  v21[1] = a2;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_1C27484AC;
  *(void *)(v22 + 24) = v20;
  swift_bridgeObjectRetain();
  sub_1C277B330();
  uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
  sub_1C261761C(0, &qword_1EBB82CD0, MEMORY[0x1E4F1AAE0]);
  sub_1C2747FC4(0, &qword_1EBB83290, (void (*)(uint64_t))type metadata accessor for NotificationContentState);
  sub_1C2748398(0, &qword_1EBB82C48, &qword_1EBB83290, (void (*)(uint64_t))type metadata accessor for NotificationContentState, MEMORY[0x1E4F1AAE0]);
  sub_1C2748018(&qword_1EBB82CC8, &qword_1EBB82CD0, v23);
  sub_1C2748418();
  uint64_t v24 = v30;
  sub_1C277B5A0();
  swift_release();
  swift_release();
  sub_1C274805C(&qword_1EBB82B68, (void (*)(uint64_t))sub_1C2748284);
  uint64_t v25 = v31;
  uint64_t v26 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v24, v25);
  return v26;
}

uint64_t NotificationContentStateManager.migrateStringContentStateIfNecessary(contentStateIdentifier:notificationIdentifier:keyValueDomain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_1C277BDE0();
  id v12 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AC28];
  sub_1C27484E0(0, &qword_1EBB82D60, MEMORY[0x1E4F1AC28]);
  sub_1C2748830(&qword_1EBB82D58, &qword_1EBB82D60, v12);
  uint64_t v13 = sub_1C277B4E0();
  swift_release();
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 32))(v13, a3, a4, a5, a6, a7);
  swift_release();
  return v14;
}

uint64_t NotificationContentStateManager.getContentState(for:legacyDateIdentifier:legacyKeyValueDomain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v29 = a5;
  uint64_t v14 = *(void *)(a6 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](a1);
  sub_1C2748284();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v31 = v16;
  uint64_t v32 = v17;
  MEMORY[0x1F4188790](v16);
  id v30 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = NotificationContentStateManager.migrateDateContentStateIfNecessary(contentStateIdentifier:notificationIdentifier:keyValueDomain:)(a3, a4, a1, a2, v29, a6, a7);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v7, a6);
  unint64_t v19 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a6;
  *(void *)(v20 + 24) = a7;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v20 + v19, (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a6);
  uint64_t v21 = (uint64_t *)(v20 + ((v15 + v19 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v21 = a1;
  v21[1] = a2;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_1C27484AC;
  *(void *)(v22 + 24) = v20;
  swift_bridgeObjectRetain();
  sub_1C277B330();
  uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
  sub_1C261761C(0, &qword_1EBB82CD0, MEMORY[0x1E4F1AAE0]);
  sub_1C2747FC4(0, &qword_1EBB83290, (void (*)(uint64_t))type metadata accessor for NotificationContentState);
  sub_1C2748398(0, &qword_1EBB82C48, &qword_1EBB83290, (void (*)(uint64_t))type metadata accessor for NotificationContentState, MEMORY[0x1E4F1AAE0]);
  sub_1C2748018(&qword_1EBB82CC8, &qword_1EBB82CD0, v23);
  sub_1C2748418();
  uint64_t v24 = v30;
  sub_1C277B5A0();
  swift_release();
  swift_release();
  sub_1C274805C(&qword_1EBB82B68, (void (*)(uint64_t))sub_1C2748284);
  uint64_t v25 = v31;
  uint64_t v26 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v24, v25);
  return v26;
}

uint64_t NotificationContentStateManager.migrateDateContentStateIfNecessary(contentStateIdentifier:notificationIdentifier:keyValueDomain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v19 = a6;
  uint64_t v18 = a4;
  sub_1C27485B8();
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1C277BDB0();
  sub_1C2748398(0, (unint64_t *)&qword_1EBB82D30, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928], MEMORY[0x1E4F1AC28]);
  sub_1C2748960(0, (unint64_t *)&qword_1EBB85920, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB718]);
  sub_1C26C9FD0();
  sub_1C277B500();
  swift_release();
  sub_1C274805C(&qword_1EBB82AC0, (void (*)(uint64_t))sub_1C27485B8);
  uint64_t v15 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 32))(v15, a3, v18, a5, v19, a7);
  swift_release();
  return v16;
}

uint64_t NotificationContentStateManager.getContentState(for:migrationContentStatePublisher:legacyKeyValueDomain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *(void *)(a5 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](a1);
  sub_1C2748284();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v28 = v15;
  uint64_t v29 = v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v27 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 32))(a3, a1, a2, a4, a5, a6);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v6, a5);
  unint64_t v18 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a5;
  *(void *)(v19 + 24) = a6;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v19 + v18, (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
  uint64_t v20 = (void *)(v19 + ((v14 + v18 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v20 = a1;
  v20[1] = a2;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_1C27484AC;
  *(void *)(v21 + 24) = v19;
  swift_bridgeObjectRetain();
  sub_1C277B330();
  uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
  sub_1C261761C(0, &qword_1EBB82CD0, MEMORY[0x1E4F1AAE0]);
  sub_1C2747FC4(0, &qword_1EBB83290, (void (*)(uint64_t))type metadata accessor for NotificationContentState);
  sub_1C2748398(0, &qword_1EBB82C48, &qword_1EBB83290, (void (*)(uint64_t))type metadata accessor for NotificationContentState, MEMORY[0x1E4F1AAE0]);
  sub_1C2748018(&qword_1EBB82CC8, &qword_1EBB82CD0, v22);
  sub_1C2748418();
  uint64_t v23 = v27;
  sub_1C277B5A0();
  swift_release();
  swift_release();
  sub_1C274805C(&qword_1EBB82B68, (void (*)(uint64_t))sub_1C2748284);
  uint64_t v24 = v28;
  uint64_t v25 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v23, v24);
  return v25;
}

uint64_t sub_1C2745ED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, void *a10, uint64_t a11, uint64_t a12)
{
  uint64_t v97 = a8;
  v110 = a7;
  uint64_t v91 = a6;
  uint64_t v112 = a2;
  unint64_t v113 = a5;
  uint64_t v109 = a4;
  v111 = a9;
  uint64_t v99 = *(void *)(a11 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v96 = v14;
  uint64_t v98 = (char *)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2747FC4(0, &qword_1EBB84A68, MEMORY[0x1E4FBCC28]);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v89 - v16;
  sub_1C26CA16C(0);
  uint64_t v101 = *(void *)(v18 - 8);
  uint64_t v102 = v18;
  MEMORY[0x1F4188790](v18);
  v100 = (char *)&v89 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C26CA2B8(0);
  uint64_t v108 = v20;
  uint64_t v106 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v104 = (char *)&v89 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2748874(0, &qword_1EBB82BB0, sub_1C26CA2B8, (void (*)(void))sub_1C26CA324);
  os_log_t v107 = v22;
  Class isa = v22[-1].isa;
  MEMORY[0x1F4188790](v22);
  uint64_t v103 = (char *)&v89 - v23;
  sub_1C2748960(0, (unint64_t *)&qword_1EBB82D00, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4F1AC08]);
  uint64_t v94 = v24;
  uint64_t v92 = *((void *)v24 - 1);
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v89 - v25;
  sub_1C261761C(0, (unint64_t *)&unk_1EBB831E0, MEMORY[0x1E4F1ACE0]);
  uint64_t v95 = v27;
  uint64_t v93 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  v90 = (char *)&v89 - v28;
  sub_1C2747FC4(0, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v29 - 8);
  uint64_t v31 = (char *)&v89 - v30;
  uint64_t v32 = sub_1C277A840();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = MEMORY[0x1F4188790](v32);
  uint64_t v36 = (char *)&v89 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v34);
  uint64_t v38 = (char *)&v89 - v37;
  sub_1C26663F8(a1, (uint64_t)v31);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32) == 1)
  {
    sub_1C27487D4((uint64_t)v31, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    if (qword_1EBB86260 != -1) {
      swift_once();
    }
    uint64_t v95 = a12;
    uint64_t v94 = a10;
    uint64_t v39 = sub_1C277B130();
    __swift_project_value_buffer(v39, (uint64_t)qword_1EBB86280);
    swift_bridgeObjectRetain_n();
    unint64_t v40 = sub_1C277B100();
    os_log_type_t v41 = sub_1C277BD40();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      v115[0] = v43;
      *(_DWORD *)uint64_t v42 = 136315394;
      uint64_t v44 = sub_1C277C9E0();
      uint64_t v114 = sub_1C263FDFC(v44, v45, v115);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v46 = v112;
      uint64_t v114 = sub_1C263FDFC(v112, a3, v115);
      sub_1C277C0D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2601000, v40, v41, "%s Proceeding with migration for %s", (uint8_t *)v42, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v43, -1, -1);
      MEMORY[0x1C875D230](v42, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v46 = v112;
    }
    unint64_t v59 = a3;
    uint64_t v114 = (uint64_t)v110;
    v115[0] = v91;
    uint64_t v60 = sub_1C277BE70();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v17, 1, 1, v60);
    uint64_t v61 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C27484E0(0, (unint64_t *)&qword_1EBB82C60, MEMORY[0x1E4F1AAE0]);
    sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85180);
    uint64_t v93 = MEMORY[0x1E4F1AAE8];
    sub_1C2748830(&qword_1EBB82C58, (unint64_t *)&qword_1EBB82C60, v61);
    sub_1C264E780();
    uint64_t v62 = v100;
    sub_1C277B5C0();
    sub_1C27487D4((uint64_t)v17, &qword_1EBB84A68, MEMORY[0x1E4FBCC28]);
    char v64 = v98;
    uint64_t v63 = v99;
    (*(void (**)(char *, uint64_t, uint64_t))(v99 + 16))(v98, v97, a11);
    unint64_t v65 = (*(unsigned __int8 *)(v63 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
    char v66 = (char *)swift_allocObject();
    uint64_t v67 = v95;
    *((void *)v66 + 2) = a11;
    *((void *)v66 + 3) = v67;
    *((void *)v66 + 4) = v46;
    *((void *)v66 + 5) = v59;
    (*(void (**)(char *, char *, uint64_t))(v63 + 32))(&v66[v65], v64, a11);
    swift_bridgeObjectRetain();
    sub_1C277B330();
    uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C261761C(0, &qword_1EBB82CD0, MEMORY[0x1E4F1AAE0]);
    uint64_t v99 = v69;
    sub_1C26CA2EC();
    sub_1C2748018(&qword_1EBB82CC8, &qword_1EBB82CD0, v68);
    unint64_t v70 = v104;
    uint64_t v71 = v102;
    sub_1C277B5A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v101 + 8))(v62, v71);
    unint64_t v72 = (void *)swift_allocObject();
    uint64_t v73 = v95;
    v72[2] = a11;
    v72[3] = v73;
    unint64_t v74 = v113;
    v72[4] = v112;
    v72[5] = v59;
    uint64_t v75 = v94;
    uint64_t v76 = v109;
    uint64_t v77 = v110;
    v72[6] = v94;
    v72[7] = v76;
    v72[8] = v74;
    v72[9] = v77;
    uint64_t v78 = swift_allocObject();
    *(void *)(v78 + 16) = sub_1C2748B04;
    *(void *)(v78 + 24) = v72;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v79 = v75;
    id v80 = v77;
    sub_1C277B330();
    sub_1C26CA324();
    unint64_t v81 = v103;
    uint64_t v82 = v108;
    sub_1C277B5A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v106 + 8))(v70, v82);
    sub_1C2748234((unint64_t *)&qword_1EBB82BA8, &qword_1EBB82BB0, sub_1C26CA2B8, (void (*)(void))sub_1C26CA324);
    os_log_t v83 = v107;
    uint64_t v84 = sub_1C277B4E0();
    uint64_t result = (*((uint64_t (**)(char *, os_log_t))isa + 1))(v81, v83);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v38, v31, v32);
    if (qword_1EBB86260 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_1C277B130();
    __swift_project_value_buffer(v47, (uint64_t)qword_1EBB86280);
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v36, v38, v32);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v48 = sub_1C277B100();
    os_log_type_t v49 = sub_1C277BD00();
    LODWORD(v110) = v49;
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v108 = swift_slowAlloc();
      v115[0] = v108;
      *(_DWORD *)uint64_t v50 = 136315906;
      os_log_t v107 = v48;
      uint64_t v51 = sub_1C277C9E0();
      uint64_t v114 = sub_1C263FDFC(v51, v52, v115);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v114 = sub_1C263FDFC(v112, a3, v115);
      sub_1C277C0D0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v50 + 22) = 2080;
      sub_1C274805C(&qword_1EBB82650, MEMORY[0x1E4F27928]);
      uint64_t v53 = sub_1C277C7B0();
      uint64_t v114 = sub_1C263FDFC(v53, v54, v115);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      uint64_t v55 = *(void (**)(char *, uint64_t))(v33 + 8);
      v55(v36, v32);
      *(_WORD *)(v50 + 32) = 2080;
      unint64_t v56 = v113;
      swift_bridgeObjectRetain();
      uint64_t v114 = sub_1C263FDFC(v109, v56, v115);
      sub_1C277C0D0();
      swift_bridgeObjectRelease_n();
      os_log_t v57 = v107;
      _os_log_impl(&dword_1C2601000, v107, (os_log_type_t)v110, "%s Migration already completed for %s on %s for key %s", (uint8_t *)v50, 0x2Au);
      uint64_t v58 = v108;
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v58, -1, -1);
      MEMORY[0x1C875D230](v50, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      uint64_t v55 = *(void (**)(char *, uint64_t))(v33 + 8);
      v55(v36, v32);

      swift_bridgeObjectRelease_n();
    }
    sub_1C277B440();
    sub_1C26532A4();
    uint64_t v86 = v90;
    unint64_t v87 = v94;
    sub_1C277B410();
    (*(void (**)(char *, void *))(v92 + 8))(v26, v87);
    sub_1C2748018((unint64_t *)&qword_1EBB831D8, (unint64_t *)&unk_1EBB831E0, MEMORY[0x1E4F1ACE0]);
    uint64_t v88 = v95;
    uint64_t v84 = sub_1C277B4E0();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v86, v88);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v55)(v38, v32);
  }
  uint64_t *v111 = v84;
  return result;
}

uint64_t sub_1C2746DE0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v58 = a6;
  uint64_t v59 = a4;
  uint64_t v61 = a7;
  uint64_t v62 = a5;
  uint64_t v60 = a2;
  sub_1C2748960(0, (unint64_t *)&qword_1EBB82D00, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4F1AC08]);
  uint64_t v10 = v9;
  uint64_t v57 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v55 - v11;
  sub_1C261761C(0, (unint64_t *)&unk_1EBB831E0, MEMORY[0x1E4F1ACE0]);
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v55 - v16;
  uint64_t v18 = (int *)type metadata accessor for NotificationContentState(0);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (uint64_t *)((char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v21 = a1[1];
  if (v21)
  {
    uint64_t v22 = *a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C277A890();
    uint64_t v23 = v60;
    *uint64_t v20 = v60;
    v20[1] = a3;
    uint64_t v24 = (void *)((char *)v20 + v18[6]);
    *uint64_t v24 = v22;
    v24[1] = v21;
    *((unsigned char *)v20 + v18[7]) = 1;
    *((unsigned char *)v20 + v18[8]) = 0;
    uint64_t v25 = qword_1EBB86260;
    swift_bridgeObjectRetain();
    unint64_t v26 = a3;
    if (v25 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1C277B130();
    __swift_project_value_buffer(v27, (uint64_t)qword_1EBB86280);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_1C277B100();
    os_log_type_t v29 = sub_1C277BD40();
    BOOL v30 = os_log_type_enabled(v28, v29);
    uint64_t v31 = v62;
    if (v30)
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v56 = v22;
      uint64_t v33 = v32;
      uint64_t v57 = swift_slowAlloc();
      uint64_t v64 = v57;
      *(_DWORD *)uint64_t v33 = 136315651;
      uint64_t v34 = sub_1C277C9E0();
      uint64_t v63 = sub_1C263FDFC(v34, v35, &v64);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_1C263FDFC(v23, v26, &v64);
      sub_1C277C0D0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 22) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_1C263FDFC(v56, v21, &v64);
      uint64_t v31 = v62;
      sub_1C277C0D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2601000, v28, v29, "%s Migrating %s content state: %{private}s", (uint8_t *)v33, 0x20u);
      uint64_t v36 = v57;
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v36, -1, -1);
      MEMORY[0x1C875D230](v33, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v48 = (*(uint64_t (**)(void *, uint64_t))(*((void *)v58 + 1) + 64))(v20, v31);
    uint64_t result = sub_1C2748B18((uint64_t)v20);
  }
  else
  {
    uint64_t v58 = v12;
    uint64_t v59 = v15;
    uint64_t v37 = v17;
    uint64_t v56 = v10;
    uint64_t v38 = v14;
    if (qword_1EBB86260 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_1C277B130();
    __swift_project_value_buffer(v39, (uint64_t)qword_1EBB86280);
    unint64_t v40 = a3;
    swift_bridgeObjectRetain_n();
    os_log_type_t v41 = sub_1C277B100();
    os_log_type_t v42 = sub_1C277BD40();
    uint64_t v43 = v37;
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v64 = v45;
      *(_DWORD *)uint64_t v44 = 136315394;
      uint64_t v46 = sub_1C277C9E0();
      uint64_t v63 = sub_1C263FDFC(v46, v47, &v64);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v44 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_1C263FDFC(v60, v40, &v64);
      sub_1C277C0D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2601000, v41, v42, "%s No pre-existing content state for %s", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v45, -1, -1);
      MEMORY[0x1C875D230](v44, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v50 = v58;
    uint64_t v51 = v59;
    uint64_t v52 = v38;
    uint64_t v53 = v56;
    uint64_t v54 = v57;
    sub_1C277B440();
    sub_1C26532A4();
    sub_1C277B410();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v50, v53);
    sub_1C2748018((unint64_t *)&qword_1EBB831D8, (unint64_t *)&unk_1EBB831E0, MEMORY[0x1E4F1ACE0]);
    uint64_t v48 = sub_1C277B4E0();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v43, v52);
  }
  *uint64_t v61 = v48;
  return result;
}

uint64_t sub_1C27474DC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v40 = a7;
  uint64_t v41 = a1;
  uint64_t v42 = a4;
  uint64_t v43 = a3;
  sub_1C2747FC4(0, &qword_1EBB84A68, MEMORY[0x1E4FBCC28]);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v36 - v11;
  sub_1C2747FC4(0, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v36 - v14;
  sub_1C26CA4C4();
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBB86260 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1C277B130();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EBB86280);
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_1C277B100();
  os_log_type_t v23 = sub_1C277BD40();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v39 = v18;
    uint64_t v25 = v24;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v45 = v36;
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v37 = v20;
    uint64_t v26 = sub_1C277C9E0();
    uint64_t v38 = a5;
    uint64_t v44 = sub_1C263FDFC(v26, v27, &v45);
    uint64_t v40 = a6;
    uint64_t v20 = v37;
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_1C263FDFC(v41, a2, &v45);
    a6 = v40;
    sub_1C277C0D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C2601000, v22, v23, "%s Marking migration as complete for %s", (uint8_t *)v25, 0x16u);
    uint64_t v28 = v36;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v28, -1, -1);
    uint64_t v29 = v25;
    uint64_t v18 = v39;
    MEMORY[0x1C875D230](v29, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1C277A830();
  uint64_t v30 = sub_1C277A840();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v15, 0, 1, v30);
  uint64_t v31 = sub_1C277BDD0();
  sub_1C27487D4((uint64_t)v15, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  uint64_t v44 = a6;
  uint64_t v45 = v31;
  uint64_t v32 = sub_1C277BE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v12, 1, 1, v32);
  uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AC28];
  sub_1C261761C(0, (unint64_t *)&qword_1EBB82D88, MEMORY[0x1E4F1AC28]);
  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85180);
  sub_1C2748018((unint64_t *)&qword_1EBB82D80, (unint64_t *)&qword_1EBB82D88, v33);
  sub_1C264E780();
  sub_1C277B5C0();
  sub_1C27487D4((uint64_t)v12, &qword_1EBB84A68, MEMORY[0x1E4FBCC28]);
  swift_release();
  sub_1C274805C(&qword_1EBB82C10, (void (*)(uint64_t))sub_1C26CA4C4);
  uint64_t v34 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  return v34;
}

uint64_t sub_1C2747A30@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1C2747A60@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1C2747FC4(0, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v15 - v5;
  uint64_t v7 = sub_1C277A840();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C26663F8(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    uint64_t result = sub_1C27487D4((uint64_t)v6, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_1C277A7B0();
    uint64_t v12 = sub_1C277BBA0();
    uint64_t v13 = v14;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  *a2 = v12;
  a2[1] = v13;
  return result;
}

uint64_t sub_1C2747C20(unint64_t a1, unint64_t a2)
{
  return sub_1C2747C48(a1, a2, &qword_1EBB83000);
}

uint64_t sub_1C2747C34(unint64_t a1, unint64_t a2)
{
  return sub_1C2747C48(a1, a2, &qword_1EA304900);
}

uint64_t sub_1C2747C48(unint64_t a1, unint64_t a2, unint64_t *a3)
{
  sub_1C2644ED8(0, a3);
  if (a2 >> 62)
  {
    uint64_t v5 = sub_1C277C5B0();
    self;
    if (swift_dynamicCastObjCClass()) {
      return v5;
    }
  }
  else
  {
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) > a1)
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20);
      swift_unknownObjectRetain();
      self;
      if (!swift_dynamicCastObjCClass()) {
        goto LABEL_10;
      }
      return v5;
    }
    __break(1u);
  }
LABEL_10:
  sub_1C277C2D0();
  sub_1C277B8D0();
  sub_1C277C9E0();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  swift_getObjectType();
  swift_unknownObjectRelease();
  sub_1C277C9E0();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1C277C570();
  __break(1u);
  return result;
}

uint64_t sub_1C2747E28(uint64_t a1, void **a2)
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14HealthPlatform19ContentStateManagerPAAE10getEntries2in7decoderSayqd__GSo28HKDeviceKeyValueStorageGroupC_10Foundation11JSONDecoderCtSeRd__SERd__lF_0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_storageEntries);
  sub_1C2644ED8(0, &qword_1EA304900);
  sub_1C277BA40();

  sub_1C26D8890(0, &qword_1EA305548, &qword_1EA304900);
  sub_1C2748B98(&qword_1EA305550, &qword_1EA305548, &qword_1EA304900);
  uint64_t v2 = sub_1C277B970();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_1C2747FC4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1C277C0B0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1C2748018(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C261761C(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C274805C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C27480A4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v6 + 8, v5);
}

uint64_t sub_1C274819C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80);
  return sub_1C2745ED4(a1, *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(void **)(v2 + 72), v2 + v3, a2, *(void **)(v2+ ((*(void *)(*(void *)(*(void *)(v2 + 16) - 8) + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1C2748234(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C2748874(255, a2, a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C2748284()
{
  if (!qword_1EBB82B70)
  {
    sub_1C2748398(255, &qword_1EBB82C48, &qword_1EBB83290, (void (*)(uint64_t))type metadata accessor for NotificationContentState, MEMORY[0x1E4F1AAE0]);
    uint64_t v0 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C261761C(255, &qword_1EBB82CD0, MEMORY[0x1E4F1AAE0]);
    sub_1C2748418();
    sub_1C2748018(&qword_1EBB82CC8, &qword_1EBB82CD0, v0);
    unint64_t v1 = sub_1C277B260();
    if (!v2) {
      atomic_store(v1, (unint64_t *)&qword_1EBB82B70);
    }
  }
}

void sub_1C2748398(uint64_t a1, unint64_t *a2, unint64_t *a3, void (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, unint64_t, void))
{
  if (!*a2)
  {
    sub_1C2747FC4(255, a3, a4);
    uint64_t v9 = v8;
    unint64_t v10 = sub_1C26532A4();
    unint64_t v11 = a5(a1, v9, v10, MEMORY[0x1E4FBC0F0]);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

unint64_t sub_1C2748418()
{
  unint64_t result = qword_1EBB82C40;
  if (!qword_1EBB82C40)
  {
    sub_1C2748398(255, &qword_1EBB82C48, &qword_1EBB83290, (void (*)(uint64_t))type metadata accessor for NotificationContentState, MEMORY[0x1E4F1AAE0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB82C40);
  }
  return result;
}

uint64_t sub_1C27484B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

void sub_1C27484E0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, void))
{
  if (!*a2)
  {
    sub_1C2748960(255, (unint64_t *)&qword_1EBB85920, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB718]);
    uint64_t v7 = v6;
    unint64_t v8 = sub_1C26532A4();
    unint64_t v9 = a3(a1, v7, v8, MEMORY[0x1E4FBC0F0]);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_1C2748580()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1C27485B8()
{
  if (!qword_1EBB82AC8)
  {
    sub_1C2748398(255, (unint64_t *)&qword_1EBB82D30, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928], MEMORY[0x1E4F1AC28]);
    sub_1C2748960(255, (unint64_t *)&qword_1EBB85920, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB718]);
    sub_1C26C9FD0();
    unint64_t v0 = sub_1C277B1E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB82AC8);
    }
  }
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, v5 + 16, v4);
}

uint64_t sub_1C2748734()
{
  uint64_t v1 = (void *)(v0
                + ((*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64)
                  + ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80))
                  + 7) & 0xFFFFFFFFFFFFFFF8));
  return (*(uint64_t (**)(void, void))(*(void *)(*(void *)(v0 + 24) + 8) + 56))(*v1, v1[1]);
}

uint64_t sub_1C27487D4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1C2747FC4(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1C2748830(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C27484E0(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C2748874(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  if (!*a2)
  {
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C261761C(255, &qword_1EBB82CD0, MEMORY[0x1E4F1AAE0]);
    a3(255);
    sub_1C2748018(&qword_1EBB82CC8, &qword_1EBB82CD0, v7);
    a4();
    unint64_t v8 = sub_1C277B260();
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_1C2748960(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1C27489AC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1C2748A70@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C2746DE0(a1, *(void *)(v2 + 32), *(void *)(v2 + 40), v2+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80)), *(void *)(v2 + 16), *(char **)(v2 + 24), a2);
}

uint64_t sub_1C2748AB4()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1C2748B04()
{
  return sub_1C27474DC(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 16));
}

uint64_t sub_1C2748B18(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NotificationContentState(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C2748B74@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C2744D00(a1, *(void *)(v2 + 24), a2);
}

uint64_t sub_1C2748B98(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C26D8890(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C2748BF8(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  sub_1C265D8B0();
  uint64_t v17 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = MEMORY[0x1E4FBC860];
  if (v10)
  {
    uint64_t v20 = MEMORY[0x1E4FBC860];
    sub_1C2659E60(0, v10, 0);
    uint64_t v11 = v20;
    uint64_t v12 = a3 + 32;
    uint64_t v16 = v7 + 32;
    while (1)
    {
      v18(v12);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v20 = v11;
      unint64_t v14 = *(void *)(v11 + 16);
      unint64_t v13 = *(void *)(v11 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_1C2659E60(v13 > 1, v14 + 1, 1);
        uint64_t v11 = v20;
      }
      *(void *)(v11 + 16) = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v14, v9, v17);
      v12 += 40;
      if (!--v10) {
        return v11;
      }
    }
    swift_release();
  }
  return v11;
}

uint64_t sub_1C2748DA4(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x1E4FBC860];
    if (!v6) {
      break;
    }
    uint64_t v13 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1C277C3C0();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x1C875C230](v8, a3);
      }
      else {
        id v9 = *(id *)(a3 + 8 * v8 + 32);
      }
      int64_t v10 = v9;
      id v11 = v9;
      a1(&v12, &v11);

      if (v3) {
        return swift_release();
      }
      ++v8;
      sub_1C277C390();
      sub_1C277C3D0();
      sub_1C277C3E0();
      sub_1C277C3A0();
      if (v6 == v8) {
        return v13;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
  }
  return result;
}

void *HealthPlatformContextProvider.Context.optionalHealthStore.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

uint64_t sub_1C2748F3C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E90);
    uint64_t v4 = sub_1C277BA40();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2748FE0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return v3;
  }
  uint64_t v18 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1C265A0D8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v18;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = MEMORY[0x1C875C230](v5, a1);
        unint64_t v8 = *(void *)(v18 + 16);
        unint64_t v7 = *(void *)(v18 + 24);
        if (v8 >= v7 >> 1) {
          sub_1C265A0D8(v7 > 1, v8 + 1, 1);
        }
        ++v5;
        uint64_t v9 = sub_1C274DCD0(&qword_1EBB82708, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
        *(void *)(v18 + 16) = v8 + 1;
        uint64_t v10 = v18 + 16 * v8;
        *(void *)(v10 + 32) = v6;
        *(void *)(v10 + 40) = v9;
      }
      while (v2 != v5);
    }
    else
    {
      id v11 = (uint64_t *)(a1 + 32);
      unint64_t v12 = *(void *)(v18 + 16);
      uint64_t v13 = 16 * v12;
      do
      {
        uint64_t v14 = *v11;
        unint64_t v15 = *(void *)(v18 + 24);
        swift_retain();
        if (v12 >= v15 >> 1) {
          sub_1C265A0D8(v15 > 1, v12 + 1, 1);
        }
        uint64_t v16 = sub_1C274DCD0(&qword_1EBB82708, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
        *(void *)(v18 + 16) = v12 + 1;
        uint64_t v17 = v18 + v13;
        *(void *)(v17 + 32) = v14;
        *(void *)(v17 + 40) = v16;
        v13 += 16;
        ++v11;
        ++v12;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

unint64_t static HealthPlatformContextProvider.errorDomain.getter()
{
  return 0xD00000000000002ELL;
}

BOOL static HealthPlatformContextProvider.Errors.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t HealthPlatformContextProvider.Errors.hash(into:)()
{
  return sub_1C277C8D0();
}

uint64_t HealthPlatformContextProvider.Errors.hashValue.getter()
{
  return sub_1C277C910();
}

uint64_t HealthPlatformContextProvider.__allocating_init(profileStore:experienceStoreOracle:pinnedContentManager:notificationManager:transactionBuilderManager:healthStore:logger:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject();
  HealthPlatformContextProvider.init(profileStore:experienceStoreOracle:pinnedContentManager:notificationManager:transactionBuilderManager:healthStore:logger:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

void *HealthPlatformContextProvider.init(profileStore:experienceStoreOracle:pinnedContentManager:notificationManager:transactionBuilderManager:healthStore:logger:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_lock;
  v22[1] = 0;
  swift_unknownObjectWeakInit();
  v22[2] = MEMORY[0x1E4FBC860];
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v25 = 0;
  sub_1C27494D4((uint64_t)v22, (uint64_t)v26);
  sub_1C2749528();
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 80) = 0;
  sub_1C2749588((uint64_t)v26, v16 + 16);
  sub_1C27495C0((uint64_t)v26);
  *(void *)((char *)v7 + v15) = v16;
  sub_1C26482E4(a1, (uint64_t)(v7 + 2));
  v7[7] = a6;
  sub_1C26482E4(a3, (uint64_t)(v7 + 9));
  v7[8] = a2;
  v7[14] = a4;
  v7[15] = a5;
  uint64_t v17 = (char *)v7 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_logger;
  uint64_t v18 = sub_1C277B130();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v17, a7, v18);
  id v20 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HealthPlatformContextProvider.ObserverShim()), sel_init);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a7, v18);
  __swift_destroy_boxed_opaque_existential_0(a3);
  __swift_destroy_boxed_opaque_existential_0(a1);
  *(void *)((char *)v7 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_observerShim) = v20;
  swift_weakAssign();
  return v7;
}

uint64_t sub_1C27494D4(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakTakeInit();
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(a2 + 8) = *(void *)(a1 + 8);
  *(void *)(a2 + 16) = v4;
  long long v5 = *(_OWORD *)(a1 + 24);
  long long v6 = *(_OWORD *)(a1 + 40);
  *(void *)(a2 + 56) = *(void *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v6;
  *(_OWORD *)(a2 + 24) = v5;
  return a2;
}

void sub_1C2749528()
{
  if (!qword_1EBB83050)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_1C277C370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB83050);
    }
  }
}

uint64_t sub_1C2749588(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C27495C0(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for HealthPlatformContextProvider.ObserverShim()
{
  return self;
}

uint64_t sub_1C2749614(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1C277B130();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B0B8]), sel_init);
  objc_msgSend(v9, sel_setProfileIdentifier_, a1);
  objc_msgSend(v9, sel_resume);
  uint64_t v10 = (void *)v2[7];
  sub_1C26482E4(a2, (uint64_t)v17);
  sub_1C26482E4((uint64_t)(v2 + 9), (uint64_t)v16);
  uint64_t v11 = v2[14];
  uint64_t v12 = v2[15];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, (uint64_t)v2 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_logger, v5);
  type metadata accessor for HealthPlatformContextProvider.Context(0);
  uint64_t v13 = swift_allocObject();
  id v14 = v10;
  swift_retain();
  swift_retain();
  HealthPlatformContextProvider.Context.init(healthStore:primaryProfileHealthStore:healthExperienceStore:pinnedContentManager:notificationManager:transactionBuilderManager:logger:)(v9, v14, v17, (uint64_t)v16, v11, v12, (uint64_t)v8);
  return v13;
}

uint64_t HealthPlatformContextProvider.Context.__allocating_init(healthStore:primaryProfileHealthStore:healthExperienceStore:pinnedContentManager:notificationManager:transactionBuilderManager:logger:)(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject();
  HealthPlatformContextProvider.Context.init(healthStore:primaryProfileHealthStore:healthExperienceStore:pinnedContentManager:notificationManager:transactionBuilderManager:logger:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

Swift::Void __swiftcall HealthPlatformContextProvider.fetchUpdatedProfiles()()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = *(void (**)(void (*)(uint64_t, void *), void *, uint64_t, uint64_t))(v2 + 24);
  swift_retain();
  v3(sub_1C274AEFC, v0, v1, v2);

  swift_release();
}

void sub_1C27498C0(uint64_t a1, void *a2, uint64_t a3)
{
  swift_retain_n();
  uint64_t v6 = sub_1C277B100();
  os_log_type_t v7 = sub_1C277BD40();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    unint64_t v27 = a2;
    id v9 = (uint64_t (*)())swift_slowAlloc();
    uint64_t v28 = v9;
    *(_DWORD *)unint64_t v8 = 136315138;
    uint64_t v29 = a3;
    swift_retain();
    uint64_t v10 = sub_1C277B860();
    uint64_t v29 = sub_1C263FDFC(v10, v11, (uint64_t *)&v28);
    sub_1C277C0D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v6, v7, "%s: Got profile list; updating contexts.", v8, 0xCu);
    swift_arrayDestroy();
    uint64_t v12 = v9;
    a2 = v27;
    MEMORY[0x1C875D230](v12, -1, -1);
    MEMORY[0x1C875D230](v8, -1, -1);

    if (a1)
    {
LABEL_3:
      MEMORY[0x1F4188790](v13);
      uint64_t v15 = (uint64_t)&v14[4];
      uint64_t v16 = v14 + 20;
      os_unfair_lock_lock(v14 + 20);
      sub_1C274E7DC(v15, &v28);
      os_unfair_lock_unlock(v16);
      v28();
      swift_release();
      return;
    }
  }
  else
  {
    swift_release_n();

    if (a1) {
      goto LABEL_3;
    }
  }
  swift_retain();
  id v17 = a2;
  swift_retain();
  id v18 = a2;
  uint64_t v19 = sub_1C277B100();
  os_log_type_t v20 = sub_1C277BD20();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = (uint64_t (*)())swift_slowAlloc();
    uint64_t v28 = v22;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v29 = a3;
    swift_retain();
    uint64_t v23 = sub_1C277B860();
    uint64_t v29 = sub_1C263FDFC(v23, v24, (uint64_t *)&v28);
    sub_1C277C0D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v29 = (uint64_t)a2;
    sub_1C26357E4(0, (unint64_t *)&qword_1EA305660, (unint64_t *)&qword_1EBB831D0);
    uint64_t v25 = sub_1C277C090();
    uint64_t v29 = sub_1C263FDFC(v25, v26, (uint64_t *)&v28);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C2601000, v19, v20, "%s: Failed to fetch profile identifiers: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v22, -1, -1);
    MEMORY[0x1C875D230](v21, -1, -1);
  }
  else
  {
    swift_release_n();
  }
}

uint64_t sub_1C2749CCC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v8 = *a3;
  sub_1C261580C(a1 + 24, (uint64_t)&v30);
  if (!v31)
  {
    uint64_t result = sub_1C274CB14((uint64_t)&v30);
LABEL_11:
    *a4 = nullsub_1;
    a4[1] = 0;
    return result;
  }
  v28[6] = v8;
  sub_1C261F308(&v30, (uint64_t)v32);
  swift_bridgeObjectRetain();
  id v9 = sub_1C274D48C((uint64_t *)(a1 + 16), a2);
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v11 = *(void *)(a1 + 16);
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1C277C5A0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v12 >= (uint64_t)v9) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12 >= (uint64_t)v9)
    {
LABEL_4:
      sub_1C26BA1B8((uint64_t)v9, v12);
      unint64_t v13 = swift_bridgeObjectRetain();
      unint64_t v14 = sub_1C274CF54(v13, a1);
      uint64_t v15 = swift_bridgeObjectRelease();
      MEMORY[0x1F4188790](v15);
      v28[2] = a3;
      v28[3] = v32;
      unint64_t v16 = sub_1C2748DA4((void (*)(uint64_t *__return_ptr, id *))sub_1C274E7F8, (uint64_t)v28, v14);
      swift_bridgeObjectRelease();
      sub_1C2768DF8(v16);
      uint64_t v17 = *(void *)(a1 + 16);
      uint64_t v18 = MEMORY[0x1C875D340](a1);
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)(a1 + 8);
        swift_bridgeObjectRetain();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
        uint64_t v21 = (uint64_t (*)())swift_allocObject();
        *((void *)v21 + 2) = a3;
        *((void *)v21 + 3) = v17;
        *((void *)v21 + 4) = v19;
        *((void *)v21 + 5) = v20;
        *a4 = sub_1C274E884;
        a4[1] = v21;
        return swift_retain();
      }
      swift_retain_n();
      uint64_t v22 = sub_1C277B100();
      os_log_type_t v23 = sub_1C277BD20();
      if (os_log_type_enabled(v22, v23))
      {
        unint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        uint64_t v29 = (uint64_t)a3;
        *(void *)&long long v30 = v25;
        *(_DWORD *)unint64_t v24 = 136315138;
        v28[5] = v24 + 4;
        swift_retain();
        uint64_t v26 = sub_1C277B860();
        uint64_t v29 = sub_1C263FDFC(v26, v27, (uint64_t *)&v30);
        sub_1C277C0D0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C2601000, v22, v23, "%s: Received updated profiles but no delegate set.", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C875D230](v25, -1, -1);
        MEMORY[0x1C875D230](v24, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C274A060(uint64_t a1, unint64_t a2)
{
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_1C277B100();
  os_log_type_t v4 = sub_1C277BD40();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    type metadata accessor for HealthPlatformContextProvider(0);
    swift_retain();
    uint64_t v7 = sub_1C277B860();
    sub_1C263FDFC(v7, v8, &v10);
    sub_1C277C0D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2048;
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_1C277C5A0();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v3, v4, "%s: Informing delegate of %ld contexts.", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v6, -1, -1);
    MEMORY[0x1C875D230](v5, -1, -1);
  }
  else
  {
    swift_release_n();

    swift_bridgeObjectRelease_n();
  }
  swift_getObjectType();
  sub_1C2748FE0(a2);
  sub_1C277AF00();
  return swift_bridgeObjectRelease();
}

void sub_1C274A2AC()
{
  uint64_t v1 = *(os_unfair_lock_s **)((char *)v0 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_lock);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 20;
  os_unfair_lock_lock(v1 + 20);
  sub_1C274E7C0(v2, &v9);
  os_unfair_lock_unlock(v3);
  if (v9 == 1)
  {
    uint64_t v4 = v0[5];
    uint64_t v5 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
    (*(void (**)(void, void, void, uint64_t, uint64_t))(v5 + 8))(*(void *)((char *)v0 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_observerShim), 0, 0, v4, v5);
    uint64_t v6 = v0[5];
    uint64_t v7 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v6);
    unint64_t v8 = *(void (**)(void (*)(uint64_t, void *), void *, uint64_t, uint64_t))(v7 + 24);
    swift_retain();
    v8(sub_1C274AEFC, v0, v6, v7);
    swift_release();
  }
}

uint64_t sub_1C274A3CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v5 = a1 + 24;
  sub_1C261580C(a1 + 24, (uint64_t)v9);
  uint64_t v6 = v10;
  uint64_t result = sub_1C274CB14((uint64_t)v9);
  if (v6)
  {
    char v8 = 0;
  }
  else
  {
    sub_1C274CB14(v5);
    uint64_t result = sub_1C26482E4(a2, v5);
    char v8 = 1;
  }
  *a3 = v8;
  return result;
}

uint64_t HealthPlatformContextProvider.start(delegate:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_lock);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 20;
  os_unfair_lock_lock(v2 + 20);
  sub_1C274AF04(v3);
  os_unfair_lock_unlock(v4);
  uint64_t v5 = *(void *)(v0 + 64);
  sub_1C274C894(v1, *(void *)(v1 + 64));
  uint64_t v6 = *(os_unfair_lock_s **)(v5 + OBJC_IVAR____TtC14HealthPlatform27HealthExperienceStoreOracle_protectedState);
  uint64_t v7 = (uint64_t)&v6[4];
  char v8 = v6 + 16;
  os_unfair_lock_lock(v6 + 16);
  sub_1C26157DC(v7, (uint64_t)&v10);
  os_unfair_lock_unlock(v8);
  if (!v11) {
    return sub_1C274CB14((uint64_t)&v10);
  }
  sub_1C261F308(&v10, (uint64_t)v12);
  sub_1C274A2AC();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
}

Swift::Void __swiftcall HealthPlatformContextProvider.stop()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_lock);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 20;
  os_unfair_lock_lock(v1 + 20);
  sub_1C274CB88(v2);

  os_unfair_lock_unlock(v3);
}

uint64_t sub_1C274A59C(uint64_t a1, void *a2)
{
  *(void *)(a1 + 8) = 0;
  swift_unknownObjectWeakAssign();
  uint64_t v3 = a2[5];
  uint64_t v4 = a2[6];
  __swift_project_boxed_opaque_existential_1(a2 + 2, v3);
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(v4 + 16))(*(void *)((char *)a2 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_observerShim), v3, v4);
}

void HealthPlatformContextProvider.context(for:)()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_lock);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 20;
  os_unfair_lock_lock(v1 + 20);
  sub_1C274CBA4(v2, &v4);
  os_unfair_lock_unlock(v3);
}

void sub_1C274A69C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  sub_1C261580C(a1 + 24, (uint64_t)&v18);
  if (v19)
  {
    sub_1C261F308(&v18, (uint64_t)&v20);
    if (v21) {
      goto LABEL_3;
    }
LABEL_10:
    sub_1C274CB14((uint64_t)&v20);
    sub_1C274DA7C();
    swift_allocError();
    *uint64_t v17 = 1;
    swift_willThrow();
    return;
  }
  unint64_t v14 = *(os_unfair_lock_s **)(*(void *)(a2 + 64)
                             + OBJC_IVAR____TtC14HealthPlatform27HealthExperienceStoreOracle_protectedState);
  uint64_t v15 = (uint64_t)&v14[4];
  unint64_t v16 = v14 + 16;
  os_unfair_lock_lock(v14 + 16);
  sub_1C26157DC(v15, (uint64_t)&v20);
  if (v4)
  {
    os_unfair_lock_unlock(v16);
    __break(1u);
    return;
  }
  os_unfair_lock_unlock(v16);
  sub_1C274CB14((uint64_t)&v18);
  if (!v21) {
    goto LABEL_10;
  }
LABEL_3:
  sub_1C261F308(&v20, (uint64_t)v22);
  unint64_t v10 = *(void *)(a1 + 16);
  char v9 = (void *)(a1 + 16);
  swift_bridgeObjectRetain();
  id v11 = a3;
  uint64_t v12 = sub_1C274CE00(v10, (uint64_t)v11);
  swift_bridgeObjectRelease();

  if (!v12)
  {
    uint64_t v12 = sub_1C2749614((uint64_t)v11, (uint64_t)v22);
    uint64_t v13 = swift_retain();
    MEMORY[0x1C875B930](v13);
    if (*(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1C277BA90();
    }
    sub_1C277BAE0();
    sub_1C277BA60();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  *a4 = v12;
}

uint64_t HealthPlatformContextProvider.profileListDidUpdate(for:)()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = *(void (**)(void (*)(uint64_t, void *), void *, uint64_t, uint64_t))(v2 + 24);
  swift_retain();
  v3(sub_1C274AEFC, v0, v1, v2);

  return swift_release();
}

uint64_t HealthPlatformContextProvider.storeDidUpdate(note:)()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0 + 64)
                            + OBJC_IVAR____TtC14HealthPlatform27HealthExperienceStoreOracle_protectedState);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 16;
  os_unfair_lock_lock(v1 + 16);
  sub_1C26157DC(v2, (uint64_t)&v5);
  os_unfair_lock_unlock(v3);
  if (!v6) {
    return sub_1C274CB14((uint64_t)&v5);
  }
  sub_1C261F308(&v5, (uint64_t)v7);
  sub_1C274A2AC();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
}

uint64_t static HealthPlatformContextProvider.Context.Errors.== infix(_:_:)()
{
  return 1;
}

uint64_t HealthPlatformContextProvider.Context.Errors.hash(into:)()
{
  return sub_1C277C8D0();
}

uint64_t HealthPlatformContextProvider.Context.Errors.hashValue.getter()
{
  return sub_1C277C910();
}

id HealthPlatformContextProvider.Context.healthStore.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t HealthPlatformContextProvider.Context.pinnedContentManager.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C26482E4(v1 + 24, a1);
}

uint64_t HealthPlatformContextProvider.Context.notificationManager.getter()
{
  return swift_retain();
}

id HealthPlatformContextProvider.Context.primaryProfileHealthStore.getter()
{
  return *(id *)(v0 + 72);
}

void *HealthPlatformContextProvider.Context.init(healthStore:primaryProfileHealthStore:healthExperienceStore:pinnedContentManager:notificationManager:transactionBuilderManager:logger:)(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v8 = v7;
  sub_1C274CBC0();
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 24) = 0;
  *(void *)(v16 + 16) = 0;
  v8[16] = v16;
  v8[2] = a1;
  v8[9] = a2;
  sub_1C26482E4((uint64_t)a3, (uint64_t)(v8 + 10));
  sub_1C26482E4(a4, (uint64_t)(v8 + 3));
  v8[8] = a5;
  v8[15] = a6;
  uint64_t v17 = (char *)v8 + OBJC_IVAR____TtCC14HealthPlatform29HealthPlatformContextProvider7Context_logger;
  uint64_t v32 = sub_1C277B130();
  uint64_t v18 = *(void *)(v32 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v17, a7, v32);
  uint64_t v34 = (uint64_t)a3;
  uint64_t v19 = a3[3];
  uint64_t v20 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v19);
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 16);
  id v22 = a1;
  id v31 = a2;
  swift_retain();
  swift_retain();
  os_log_type_t v23 = (void *)v21(v19, v20);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  *(void *)(v24 + 24) = v23;
  aBlock[4] = sub_1C274CCFC;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C26254FC;
  aBlock[3] = &block_descriptor_27;
  uint64_t v25 = _Block_copy(aBlock);
  id v26 = v22;
  id v27 = v23;
  swift_release();
  objc_msgSend(v27, sel_performBlock_, v25);
  _Block_release(v25);

  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a7, v32);
  __swift_destroy_boxed_opaque_existential_0(a4);
  __swift_destroy_boxed_opaque_existential_0(v34);
  return v8;
}

void sub_1C274AEFC(uint64_t a1, void *a2)
{
  sub_1C27498C0(a1, a2, v2);
}

uint64_t sub_1C274AF04(uint64_t a1)
{
  *(void *)(a1 + 8) = *(void *)(v1 + 24);
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1C274AF24(void *a1, void *a2)
{
  id v3 = objc_msgSend(a1, sel_profileIdentifier);
  sub_1C274CC58(0, &qword_1EBB85210, (uint64_t (*)(uint64_t))type metadata accessor for UserProfile, MEMORY[0x1E4FBBE00]);
  uint64_t v4 = type metadata accessor for UserProfile();
  unint64_t v5 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1C277E480;
  id v7 = v3;
  id v8 = objc_msgSend(v7, sel_identifier);
  sub_1C277A880();

  *(void *)(v6 + v5 + *(int *)(v4 + 20)) = v7;
  uint64_t v9 = sub_1C2643840(v6);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();

  id v10 = a2;
  id v11 = sub_1C2642CAC(v9, (uint64_t)v10);

  sub_1C265C4C4((unint64_t)v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void HealthPlatformContextProvider.Context.feedItemStorage(for:scope:)(uint64_t a1@<X1>, void *a2@<X2>, uint64_t *a3@<X8>)
{
  unint64_t v5 = v3;
  id v31 = a2;
  uint64_t v33 = a1;
  uint64_t v7 = sub_1C277ADF0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v13 = objc_msgSend(v12, sel_bundleIdentifier);
  if (v13)
  {
    unint64_t v14 = v13;
    uint64_t v15 = sub_1C277B850();
    uint64_t v28 = v16;
    uint64_t v29 = v15;

    uint64_t v26 = v7;
    uint64_t v17 = a3;
    uint64_t v30 = v4;
    uint64_t v19 = v5[13];
    uint64_t v18 = v5[14];
    __swift_project_boxed_opaque_existential_1(v5 + 10, v19);
    id v27 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v19, v18);
    swift_getObjectType();
    id v20 = v31;
    sub_1C277B090();
    uint64_t v21 = sub_1C277ADE0();
    uint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v26);
    sub_1C26482E4((uint64_t)(v5 + 3), (uint64_t)v32);
    v17[3] = (uint64_t)&type metadata for PluginFeedItemStorage;
    v17[4] = (uint64_t)&protocol witness table for PluginFeedItemStorage;
    uint64_t v24 = swift_allocObject();
    *uint64_t v17 = v24;
    PluginFeedItemStorage.init(storageContext:pluginPackage:scope:executorIdentifier:pinnedContentManager:)(v27, v29, v28, v20, v21, v23, v32, (void *)(v24 + 16));
  }
  else
  {
    sub_1C274CD04();
    swift_allocError();
    swift_willThrow();
  }
}

void HealthPlatformContextProvider.Context.anchorStorage(for:)(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v30 = a1;
  uint64_t v6 = sub_1C277ADF0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v11 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v12 = objc_msgSend(v11, sel_bundleIdentifier);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = sub_1C277B850();
    uint64_t v27 = v15;
    uint64_t v28 = v14;

    uint64_t v26 = v6;
    uint64_t v16 = a2;
    uint64_t v29 = v3;
    uint64_t v18 = *(void *)(v4 + 104);
    uint64_t v17 = *(void *)(v4 + 112);
    __swift_project_boxed_opaque_existential_1((void *)(v4 + 80), v18);
    uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 16))(v18, v17);
    id v20 = objc_msgSend(*(id *)(v4 + 16), sel_profileIdentifier);
    swift_getObjectType();
    sub_1C277B080();
    uint64_t v21 = sub_1C277ADE0();
    uint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v26);
    v16[3] = &type metadata for PluginAnchorStorage;
    v16[4] = &off_1F1DD0270;
    uint64_t v24 = (void *)swift_allocObject();
    *uint64_t v16 = v24;

    v24[2] = v19;
    v24[3] = v20;
    uint64_t v25 = v27;
    v24[4] = v28;
    long long v24[5] = v25;
    v24[6] = v21;
    v24[7] = v23;
  }
  else
  {
    sub_1C274CD04();
    swift_allocError();
    swift_willThrow();
  }
}

void *HealthPlatformContextProvider.Context.notificationManager(for:)()
{
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend(v2, sel_bundleIdentifier);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_1C277B850();
    uint64_t v7 = v6;

    uint64_t v8 = (void *)v0[2];
    uint64_t v9 = v0[8];
    id v10 = (void *)v0[9];
    type metadata accessor for HealthAppPluginNotificationManager();
    swift_allocObject();
    id v11 = v8;
    swift_retain();
    id v12 = v10;
    uint64_t v0 = sub_1C2633658(v11, v5, v7, v9);

    swift_release();
  }
  else
  {
    sub_1C274CD04();
    swift_allocError();
    swift_willThrow();
  }
  return v0;
}

void HealthPlatformContextProvider.Context.sharedSummaryTransactionBuilder(completion:)(void (*a1)(void *, uint64_t), uint64_t a2)
{
  sub_1C2632DE0(*(void **)(v2 + 16), a1, a2);
}

uint64_t HealthPlatformContextProvider.Context.sharingSummaryProfileTransactionBuilder(transaction:)()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_profileIdentifier);
  id v2 = objc_msgSend(v1, sel_type);

  uint64_t result = 0;
  if (v2 == (id)2)
  {
    MEMORY[0x1F4188790](0);
    uint64_t v5 = v4 + 4;
    uint64_t v6 = v4 + 6;
    os_unfair_lock_lock(v4 + 6);
    sub_1C274D9A8(v5, &v7);
    os_unfair_lock_unlock(v6);
    return v7;
  }
  return result;
}

void sub_1C274B7CC(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v40 = a3;
  v42[1] = *(id *)MEMORY[0x1E4F143B8];
  sub_1C274CC58(0, &qword_1EBB82660, MEMORY[0x1E4F27990], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v37 - v8;
  uint64_t v10 = sub_1C277A8A0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v37 - v15;
  uint64_t v39 = a1;
  uint64_t v17 = *a1;
  uint64_t v41 = a4;
  if (v17)
  {
    uint64_t v18 = *(void **)(v17 + 16);
    swift_retain();
    id v19 = objc_msgSend(v18, sel_transactionUUID);
    sub_1C277A880();

    uint64_t v38 = a2;
    id v20 = objc_msgSend(a2, (SEL)&selRef_localizedTitle);
    sub_1C277A880();

    LOBYTE(v20) = sub_1C277A870();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v11 + 8);
    v21(v14, v10);
    v21(v16, v10);
    if (v20)
    {
      *uint64_t v41 = v17;
      return;
    }
    swift_release();
    a2 = v38;
  }
  id v22 = *(id *)(v40 + 16);
  id v23 = objc_msgSend(a2, sel_UUID);
  sub_1C277A880();

  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = (void *)sub_1C277A860();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  }
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B4C0]), sel_initWithHealthStore_transactionUUID_, v22, v24);

  id v26 = objc_msgSend(v25, sel_transactionUUID);
  sub_1C277A880();

  id v27 = objc_msgSend(a2, sel_UUID);
  sub_1C277A880();

  LOBYTE(v27) = sub_1C277A870();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v11 + 8);
  v28(v14, v10);
  v28(v16, v10);
  if (v27)
  {
    v42[0] = 0;
    id v29 = objc_msgSend(v25, sel_isCommittedWithError_, v42);
    if (!v29)
    {
      id v35 = v42[0];
      uint64_t v36 = (void *)sub_1C277A620();

      swift_willThrow();
      *uint64_t v41 = 0;
      return;
    }
    uint64_t v30 = v29;
    id v31 = v42[0];
    unsigned int v32 = objc_msgSend(v30, sel_BOOLValue);

    if (v32)
    {
      uint64_t v33 = v39;
      swift_release();
      type metadata accessor for CachingSharedSummaryTransactionBuilder();
      swift_allocObject();
      uint64_t v34 = sub_1C2662E08(v25, (uint64_t)sub_1C26AD760, 0);

      *uint64_t v33 = v34;
      *uint64_t v41 = v34;
      swift_retain();
      return;
    }
  }

  *uint64_t v41 = 0;
}

id HealthPlatformContextProvider.Context.contextDescription.getter@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(*(id *)(v1 + 16), sel_profileIdentifier);
  *a1 = result;
  return result;
}

uint64_t HealthPlatformContextProvider.Context.Description.init(profileIdentifier:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t HealthPlatformContextProvider.Context.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCC14HealthPlatform29HealthPlatformContextProvider7Context_logger;
  uint64_t v4 = sub_1C277B130();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t static HealthPlatformContextProvider.Context.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85F30);
  id v4 = objc_msgSend(*(id *)(a1 + 16), sel_profileIdentifier);
  id v5 = objc_msgSend(*(id *)(a2 + 16), sel_profileIdentifier);
  LOBYTE(a1) = sub_1C277C030();

  return a1 & 1;
}

unint64_t sub_1C274BDE0()
{
  return 0xD000000000000011;
}

uint64_t sub_1C274BDFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C274E738(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1C274BE28(uint64_t a1)
{
  unint64_t v2 = sub_1C274D9C4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C274BE64(uint64_t a1)
{
  unint64_t v2 = sub_1C274D9C4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t HealthPlatformContextProvider.Context.Description.encode(to:)(void *a1)
{
  v18[2] = *(id *)MEMORY[0x1E4F143B8];
  sub_1C274DA18(0, &qword_1EA305570, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v18[-1] - v6;
  uint64_t v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C274D9C4();
  sub_1C277C9B0();
  uint64_t v9 = self;
  v18[0] = 0;
  id v10 = objc_msgSend(v9, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v8, 1, v18);
  id v11 = v18[0];
  if (v10)
  {
    uint64_t v12 = (void *)sub_1C277A780();
    uint64_t v14 = v13;

    v18[0] = v12;
    v18[1] = v14;
    sub_1C267AD9C();
    sub_1C277C760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return sub_1C263CC84((uint64_t)v12, (unint64_t)v14);
  }
  else
  {
    uint64_t v16 = v11;
    sub_1C277A620();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t HealthPlatformContextProvider.Context.Description.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1C274DA18(0, (unint64_t *)&unk_1EA305588, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)v15 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C274D9C4();
  sub_1C277C9A0();
  if (!v2)
  {
    sub_1C267AC18();
    sub_1C277C6D0();
    uint64_t v11 = v15[0];
    unint64_t v10 = v15[1];
    sub_1C2644ED8(0, &qword_1EBB86050);
    sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E90);
    uint64_t v12 = sub_1C277BE10();
    if (v12)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      sub_1C263CC84(v11, v10);
      *a2 = v12;
    }
    else
    {
      sub_1C274DA7C();
      swift_allocError();
      *uint64_t v14 = 0;
      swift_willThrow();
      sub_1C263CC84(v11, v10);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1C274C324@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return HealthPlatformContextProvider.Context.Description.init(from:)(a1, a2);
}

uint64_t sub_1C274C33C(void *a1)
{
  return HealthPlatformContextProvider.Context.Description.encode(to:)(a1);
}

uint64_t HealthPlatformContextProvider.Context.deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  swift_release();

  __swift_destroy_boxed_opaque_existential_0(v0 + 80);
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtCC14HealthPlatform29HealthPlatformContextProvider7Context_logger;
  uint64_t v2 = sub_1C277B130();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t HealthPlatformContextProvider.Context.__deallocating_deinit()
{
  return sub_1C274C554((void (*)(void))HealthPlatformContextProvider.Context.deinit);
}

void sub_1C274C408(uint64_t a1@<X1>, void *a2@<X2>, uint64_t *a3@<X8>)
{
}

void sub_1C274C420(uint64_t a1@<X1>, void *a2@<X8>)
{
}

void *sub_1C274C438()
{
  return HealthPlatformContextProvider.Context.notificationManager(for:)();
}

void sub_1C274C450(void (*a1)(void *, uint64_t), uint64_t a2)
{
  sub_1C2632DE0(*(void **)(v2 + 16), a1, a2);
}

uint64_t HealthPlatformContextProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);

  __swift_destroy_boxed_opaque_existential_0(v0 + 72);
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_logger;
  uint64_t v2 = sub_1C277B130();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  return v0;
}

uint64_t HealthPlatformContextProvider.__deallocating_deinit()
{
  return sub_1C274C554((void (*)(void))HealthPlatformContextProvider.deinit);
}

uint64_t sub_1C274C554(void (*a1)(void))
{
  a1();

  return swift_deallocClassInstance();
}

void sub_1C274C5B0()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_lock);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 20;
  os_unfair_lock_lock(v1 + 20);
  sub_1C274E898(v2, &v4);
  os_unfair_lock_unlock(v3);
}

void sub_1C274C638()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC14HealthPlatform29HealthPlatformContextProvider_lock);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 20;
  os_unfair_lock_lock(v1 + 20);
  sub_1C274CB88(v2);

  os_unfair_lock_unlock(v3);
}

void sub_1C274C6A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  if (a2)
  {
    v7[4] = a2;
    v7[5] = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 1107296256;
    v7[2] = sub_1C26254FC;
    v7[3] = &block_descriptor_41;
    uint64_t v6 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_msgSend(v5, sel_addObserver_completion_, a1, v6);
  _Block_release(v6);
}

uint64_t sub_1C274C774(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1C2748F3C;
  v6[3] = &block_descriptor_38;
  uint64_t v4 = _Block_copy(v6);
  swift_retain();
  objc_msgSend(v3, sel_fetchAllProfilesWithCompletion_, v4);
  _Block_release(v4);
  return swift_release();
}

void *sub_1C274C828()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

id sub_1C274C850()
{
  return *(id *)(v0 + 72);
}

id sub_1C274C858@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(*(id *)(v1 + 16), sel_profileIdentifier);
  *a1 = result;
  return result;
}

id sub_1C274C894(uint64_t a1, uint64_t a2)
{
  swift_getObjectType();
  if (qword_1EBB86260 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1C277B130();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBB86280);
  swift_unknownObjectRetain_n();
  uint64_t v5 = sub_1C277B100();
  os_log_type_t v6 = sub_1C277BD00();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v16 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_1C271A318();
    sub_1C263FDFC(v9, v10, &v16);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    sub_1C271B100();
    swift_unknownObjectRetain();
    uint64_t v11 = sub_1C277B860();
    uint64_t v15 = sub_1C263FDFC(v11, v12, &v16);
    sub_1C277C0D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v5, v6, "[%s] register(observer:): %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v8, -1, -1);
    MEMORY[0x1C875D230](v7, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v13 = *(void **)(a2 + OBJC_IVAR____TtC14HealthPlatform27HealthExperienceStoreOracle_notificationCenter);
  if (qword_1EBB80DA8 != -1) {
    swift_once();
  }
  return objc_msgSend(v13, sel_addObserver_selector_name_object_, a1, sel_storeDidUpdateWithNote_, qword_1EBB82F40, a2, v15, v16);
}

uint64_t sub_1C274CB14(uint64_t a1)
{
  sub_1C26357E4(0, (unint64_t *)&qword_1EBB80DE0, &qword_1EBB82698);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C274CB88(uint64_t a1)
{
  return sub_1C274A59C(a1, v1);
}

void sub_1C274CBA4(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1C274A69C(a1, *(void *)(v2 + 16), *(void **)(v2 + 24), a2);
}

void sub_1C274CBC0()
{
  if (!qword_1EBB830C0)
  {
    sub_1C274CC58(255, &qword_1EBB80D40, (uint64_t (*)(uint64_t))type metadata accessor for CachingSharedSummaryTransactionBuilder, MEMORY[0x1E4FBB718]);
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_1C277C370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB830C0);
    }
  }
}

void sub_1C274CC58(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1C274CCBC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C274CCFC()
{
  return sub_1C274AF24(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_1C274CD04()
{
  unint64_t result = qword_1EA305560;
  if (!qword_1EA305560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305560);
  }
  return result;
}

uint64_t sub_1C274CD58()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1C274CDB0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C274CE00(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1C277C5A0();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      uint64_t v5 = 4;
      do
      {
        uint64_t v6 = v5 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v7 = MEMORY[0x1C875C230](v5 - 4, a1);
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1)) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v7 = *(void *)(a1 + 8 * v5);
          swift_retain();
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        id v9 = objc_msgSend(*(id *)(v7 + 16), sel_profileIdentifier);
        unsigned int v10 = objc_msgSend(v9, sel_isEqual_, a2);

        if (v10)
        {
          swift_bridgeObjectRelease();
          return v7;
        }
        swift_release();
        ++v5;
      }
      while (v8 != v4);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1C274CF54(unint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  uint64_t v24 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_29;
  }
  for (uint64_t i = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_1C277C5A0())
  {
    unint64_t v4 = 0;
    uint64_t v21 = v2 & 0xFFFFFFFFFFFFFF8;
    unint64_t v22 = v2 & 0xC000000000000001;
    uint64_t v19 = v2;
    uint64_t v20 = v2 + 32;
    uint64_t v18 = i;
    while (1)
    {
      if (v22)
      {
        id v5 = (id)MEMORY[0x1C875C230](v4, v2);
      }
      else
      {
        if (v4 >= *(void *)(v21 + 16)) {
          goto LABEL_27;
        }
        id v5 = *(id *)(v20 + 8 * v4);
      }
      uint64_t v6 = v5;
      if (__OFADD__(v4++, 1)) {
        break;
      }
      unint64_t v8 = *(void *)(a2 + 16);
      if (v8 >> 62)
      {
        swift_bridgeObjectRetain_n();
        id v16 = v6;
        uint64_t v9 = sub_1C277C5A0();
        if (v9)
        {
LABEL_12:
          uint64_t v11 = 4;
          do
          {
            uint64_t v2 = v11 - 4;
            if ((v8 & 0xC000000000000001) != 0)
            {
              uint64_t v12 = MEMORY[0x1C875C230](v11 - 4, v8);
              uint64_t v13 = v11 - 3;
              if (__OFADD__(v2, 1)) {
                goto LABEL_26;
              }
            }
            else
            {
              uint64_t v12 = *(void *)(v8 + 8 * v11);
              swift_retain();
              uint64_t v13 = v11 - 3;
              if (__OFADD__(v2, 1))
              {
LABEL_26:
                __break(1u);
LABEL_27:
                __break(1u);
                goto LABEL_28;
              }
            }
            id v14 = objc_msgSend(*(id *)(v12 + 16), sel_profileIdentifier);
            unsigned int v15 = objc_msgSend(v14, sel_isEqual_, v6);
            swift_release();

            if (v15)
            {

              swift_bridgeObjectRelease_n();
              goto LABEL_5;
            }
            ++v11;
          }
          while (v13 != v9);
        }
      }
      else
      {
        uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        id v10 = v6;
        if (v9) {
          goto LABEL_12;
        }
      }

      swift_bridgeObjectRelease_n();
      sub_1C277C390();
      sub_1C277C3D0();
      sub_1C277C3E0();
      sub_1C277C3A0();
LABEL_5:
      uint64_t v2 = v19;
      if (v4 == v18) {
        return v24;
      }
    }
LABEL_28:
    __break(1u);
LABEL_29:
    ;
  }
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1C274D1B8(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_37;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v5 = 0;
    uint64_t v21 = v3 + 32;
    unint64_t v22 = v3 & 0xC000000000000001;
    unint64_t v23 = a2 & 0xC000000000000001;
    uint64_t v19 = v4;
    uint64_t v20 = v3;
    while (1)
    {
      if (v22)
      {
        uint64_t v6 = MEMORY[0x1C875C230](v5, v3);
      }
      else
      {
        uint64_t v6 = *(void *)(v21 + 8 * v5);
        swift_retain();
      }
      id v7 = objc_msgSend(*(id *)(v6 + 16), sel_profileIdentifier);
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = sub_1C277C5A0();
        if (!v8) {
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v8 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v8) {
          goto LABEL_32;
        }
      }
      id v9 = v23 ? (id)MEMORY[0x1C875C230](0, a2) : *(id *)(a2 + 32);
      id v10 = v9;
      sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E90);
      char v11 = sub_1C277C030();

      if ((v11 & 1) == 0) {
        break;
      }

      swift_bridgeObjectRelease();
LABEL_28:
      swift_release();
      if (__OFADD__(v5++, 1)) {
        goto LABEL_36;
      }
      if (v5 == v4) {
        return 0;
      }
    }
    if (v8 == 1)
    {
LABEL_32:

      swift_bridgeObjectRelease();
      swift_release();
      return v5;
    }
    if (v23)
    {
      uint64_t v12 = 1;
      while (1)
      {
        MEMORY[0x1C875C230](v12, a2);
        uint64_t v13 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          break;
        }
        uint64_t v3 = sub_1C277C030();
        swift_unknownObjectRelease();
        if (v3) {
          goto LABEL_27;
        }
        ++v12;
        if (v13 == v8) {
          goto LABEL_32;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v3 = 5;
      while (1)
      {
        uint64_t v14 = v3 - 3;
        if (__OFADD__(v3 - 4, 1)) {
          break;
        }
        id v15 = *(id *)(a2 + 8 * v3);
        char v16 = sub_1C277C030();

        if (v16)
        {
LABEL_27:

          swift_bridgeObjectRelease();
          uint64_t v4 = v19;
          uint64_t v3 = v20;
          goto LABEL_28;
        }
        ++v3;
        if (v14 == v8) {
          goto LABEL_32;
        }
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
  }
  return 0;
}

char *sub_1C274D48C(uint64_t *a1, unint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = (char *)sub_1C274D1B8(v5, a2);
  char v8 = v7;
  uint64_t v9 = v2;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    id v10 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_81;
    }
    if ((unint64_t)*a1 >> 62)
    {
LABEL_82:
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_1C277C5A0();
      swift_bridgeObjectRelease();
      if (v10 != (char *)v30) {
        goto LABEL_6;
      }
    }
    else if (v10 != *(char **)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      uint64_t v33 = a2 & 0xFFFFFFFFFFFFFF8;
      uint64_t v34 = a1;
      uint64_t v32 = v9;
      unint64_t v35 = a2 & 0xC000000000000001;
      unint64_t v36 = a2 >> 62;
      unint64_t v38 = a2;
      while (1)
      {
        uint64_t v11 = *a1;
        unint64_t v37 = (unint64_t)v6;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          uint64_t v28 = MEMORY[0x1C875C230](v10);
        }
        else
        {
          if (((unint64_t)v10 & 0x8000000000000000) != 0) {
            goto LABEL_70;
          }
          if ((unint64_t)v10 >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_71;
          }
          uint64_t v28 = *(void *)(v11 + 8 * (void)v10 + 32);
          swift_retain();
        }
        uint64_t v6 = (char *)objc_msgSend(*(id *)(v28 + 16), sel_profileIdentifier);
        if (v36)
        {
          swift_bridgeObjectRetain();
          uint64_t v12 = sub_1C277C5A0();
          if (!v12)
          {
LABEL_19:
            swift_release();

            swift_bridgeObjectRelease();
LABEL_35:
            uint64_t v6 = (char *)v37;
            goto LABEL_57;
          }
        }
        else
        {
          uint64_t v12 = *(void *)(v33 + 16);
          swift_bridgeObjectRetain();
          if (!v12) {
            goto LABEL_19;
          }
        }
        if (v35) {
          id v13 = (id)MEMORY[0x1C875C230](0, a2);
        }
        else {
          id v13 = *(id *)(a2 + 32);
        }
        uint64_t v14 = v13;
        a1 = (uint64_t *)sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E90);
        char v15 = sub_1C277C030();

        if ((v15 & 1) == 0)
        {
          if (v12 != 1)
          {
            if (v35)
            {
              uint64_t v16 = 1;
              while (1)
              {
                MEMORY[0x1C875C230](v16, a2);
                uint64_t v9 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  break;
                }
                char v17 = sub_1C277C030();
                swift_unknownObjectRelease();
                if (v17) {
                  goto LABEL_36;
                }
                ++v16;
                a2 = v38;
                if (v9 == v12)
                {
                  swift_release();

                  goto LABEL_33;
                }
              }
              __break(1u);
LABEL_70:
              __break(1u);
LABEL_71:
              __break(1u);
LABEL_72:
              __break(1u);
              goto LABEL_73;
            }
            a2 = 5;
            while (1)
            {
              uint64_t v9 = a2 - 3;
              if (__OFADD__(a2 - 4, 1)) {
                break;
              }
              id v18 = *(id *)(v38 + 8 * a2);
              char v19 = sub_1C277C030();

              if (v19)
              {
LABEL_36:

                a2 = v38;
                swift_bridgeObjectRelease();
                uint64_t v9 = v32;
                goto LABEL_37;
              }
              ++a2;
              if (v9 == v12)
              {
                swift_release();

                a2 = v38;
LABEL_33:
                swift_bridgeObjectRelease();
                uint64_t v9 = v32;
                goto LABEL_34;
              }
            }
LABEL_73:
            __break(1u);
LABEL_74:
            __break(1u);
LABEL_75:
            __break(1u);
LABEL_76:
            __break(1u);
LABEL_77:
            __break(1u);
LABEL_78:
            __break(1u);
LABEL_79:
            __break(1u);
LABEL_80:
            __break(1u);
LABEL_81:
            __break(1u);
            goto LABEL_82;
          }
          swift_release();

          swift_bridgeObjectRelease();
LABEL_34:
          a1 = v34;
          goto LABEL_35;
        }

        swift_bridgeObjectRelease();
LABEL_37:
        swift_release();
        uint64_t v6 = (char *)v37;
        a1 = v34;
        if ((char *)v37 != v10) {
          break;
        }
LABEL_56:
        uint64_t v6 = (char *)(v37 + 1);
        if (__OFADD__(v37, 1)) {
          goto LABEL_74;
        }
LABEL_57:
        if (__OFADD__(v10++, 1)) {
          goto LABEL_72;
        }
        if ((unint64_t)*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v27 = sub_1C277C5A0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v27 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v10 == (char *)v27) {
          return v6;
        }
      }
      uint64_t v20 = *v34;
      if ((*v34 & 0xC000000000000001) != 0)
      {
        uint64_t v21 = MEMORY[0x1C875C230](v37, *v34);
        uint64_t v20 = *v34;
        if ((*v34 & 0xC000000000000001) == 0)
        {
LABEL_42:
          if (((unint64_t)v10 & 0x8000000000000000) != 0) {
            goto LABEL_77;
          }
          if ((unint64_t)v10 >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_78;
          }
          uint64_t v22 = *(void *)(v20 + 8 * (void)v10 + 32);
          swift_retain();
          goto LABEL_45;
        }
      }
      else
      {
        if ((v37 & 0x8000000000000000) != 0) {
          goto LABEL_75;
        }
        if (v37 >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_76;
        }
        uint64_t v21 = *(void *)(v20 + 8 * v37 + 32);
        swift_retain();
        if ((v20 & 0xC000000000000001) == 0) {
          goto LABEL_42;
        }
      }
      uint64_t v22 = MEMORY[0x1C875C230](v10, v20);
      uint64_t v20 = *v34;
LABEL_45:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *uint64_t v34 = v20;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v20 < 0 || (v20 & 0x4000000000000000) != 0)
      {
        uint64_t v20 = sub_1C26B85F0(v20);
        *uint64_t v34 = v20;
      }
      *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 8 * v37 + 0x20) = v22;
      swift_release();
      sub_1C277BA60();
      uint64_t v24 = *v34;
      int v25 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *uint64_t v34 = v24;
      if (!v25 || v24 < 0 || (v24 & 0x4000000000000000) != 0)
      {
        uint64_t v24 = sub_1C26B85F0(v24);
        *uint64_t v34 = v24;
      }
      if (((unint64_t)v10 & 0x8000000000000000) != 0) {
        goto LABEL_79;
      }
      if ((unint64_t)v10 >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_80;
      }
      *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 8 * (void)v10 + 0x20) = v21;
      swift_release();
      sub_1C277BA60();
      goto LABEL_56;
    }
    return v6;
  }
  if (!((unint64_t)*a1 >> 62)) {
    return *(char **)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_1C277C5A0();
  swift_bridgeObjectRelease();
  return (char *)v31;
}

void sub_1C274D9A8(void *a1@<X0>, void *a2@<X8>)
{
  sub_1C274B7CC(a1, *(void **)(v2 + 16), *(void *)(v2 + 24), a2);
}

unint64_t sub_1C274D9C4()
{
  unint64_t result = qword_1EA305578;
  if (!qword_1EA305578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305578);
  }
  return result;
}

void sub_1C274DA18(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1C274D9C4();
    unint64_t v7 = a3(a1, &type metadata for HealthPlatformContextProvider.Context.Description.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1C274DA7C()
{
  unint64_t result = qword_1EA305598;
  if (!qword_1EA305598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305598);
  }
  return result;
}

unint64_t sub_1C274DAD4()
{
  unint64_t result = qword_1EA3055A0;
  if (!qword_1EA3055A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3055A0);
  }
  return result;
}

unint64_t sub_1C274DB2C()
{
  unint64_t result = qword_1EA3055A8;
  if (!qword_1EA3055A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3055A8);
  }
  return result;
}

unint64_t sub_1C274DB84()
{
  unint64_t result = qword_1EA3055B0;
  if (!qword_1EA3055B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3055B0);
  }
  return result;
}

unint64_t sub_1C274DBDC()
{
  unint64_t result = qword_1EA3055B8;
  if (!qword_1EA3055B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3055B8);
  }
  return result;
}

uint64_t sub_1C274DC30(uint64_t a1)
{
  uint64_t result = sub_1C274DCD0((unint64_t *)&unk_1EBB82720, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1C274DC88()
{
  return sub_1C274DCD0(&qword_1EBB82708, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
}

uint64_t sub_1C274DCD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C274DD18(uint64_t a1)
{
  uint64_t result = sub_1C274DCD0(&qword_1EBB82708, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1C274DD70()
{
  return sub_1C274DCD0((unint64_t *)&unk_1EBB82710, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
}

unint64_t sub_1C274DDBC()
{
  unint64_t result = qword_1EA3055C8;
  if (!qword_1EA3055C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3055C8);
  }
  return result;
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.feedItemStorage(for:scope:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.anchorStorage(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.notificationManager(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.sharedSummaryTransactionBuilder(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of HealthPlatformOrchestrationContext.sharingSummaryProfileTransactionBuilder(transaction:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of ProfileStore.add(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of ProfileStore.remove(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ProfileStore.fetchAllProfiles(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_1C274DEEC()
{
  return type metadata accessor for HealthPlatformContextProvider(0);
}

uint64_t type metadata accessor for HealthPlatformContextProvider(uint64_t a1)
{
  return sub_1C2635628(a1, (uint64_t *)&unk_1EBB82748);
}

uint64_t sub_1C274DF14()
{
  uint64_t result = sub_1C277B130();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for HealthPlatformContextProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthPlatformContextProvider);
}

uint64_t dispatch thunk of HealthPlatformContextProvider.__allocating_init(profileStore:experienceStoreOracle:pinnedContentManager:notificationManager:transactionBuilderManager:healthStore:logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

unsigned char *storeEnumTagSinglePayload for HealthPlatformContextProvider.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1C274E0D4);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.Errors()
{
  return &type metadata for HealthPlatformContextProvider.Errors;
}

uint64_t sub_1C274E10C()
{
  return type metadata accessor for HealthPlatformContextProvider.Context(0);
}

uint64_t sub_1C274E114()
{
  uint64_t result = sub_1C277B130();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for HealthPlatformContextProvider.Context(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthPlatformContextProvider.Context);
}

uint64_t dispatch thunk of HealthPlatformContextProvider.Context.__allocating_init(healthStore:primaryProfileHealthStore:healthExperienceStore:pinnedContentManager:notificationManager:transactionBuilderManager:logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.Context.Errors()
{
  return &type metadata for HealthPlatformContextProvider.Context.Errors;
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.Context.Description()
{
  return &type metadata for HealthPlatformContextProvider.Context.Description;
}

unsigned char *_s14HealthPlatform29HealthPlatformContextProviderC7ContextC6ErrorsOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C274E2C4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.Context.Description.CodingKeys()
{
  return &type metadata for HealthPlatformContextProvider.Context.Description.CodingKeys;
}

uint64_t destroy for HealthPlatformContextProvider.ProtectedState(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48))
  {
    return __swift_destroy_boxed_opaque_existential_0(a1 + 24);
  }
  return result;
}

uint64_t initializeWithCopy for HealthPlatformContextProvider.ProtectedState(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakCopyInit();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v6 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v5;
    *(void *)(a1 + 56) = v6;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8))(a1 + 24, a2 + 24, v5);
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v7;
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
  }
  return a1;
}

uint64_t assignWithCopy for HealthPlatformContextProvider.ProtectedState(uint64_t a1, uint64_t a2)
{
  *(void *)(swift_unknownObjectWeakCopyAssign() + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v4)
    {
      *(void *)(a1 + 48) = v4;
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 24, a2 + 24);
      return a1;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 24);
    long long v6 = *(_OWORD *)(a2 + 40);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(_OWORD *)(a1 + 24) = v5;
    *(_OWORD *)(a1 + 40) = v6;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_0(a1 + 24);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  return a1;
}

__n128 initializeWithTake for HealthPlatformContextProvider.ProtectedState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakTakeInit();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(v3 + 8) = *(void *)(a2 + 8);
  *(void *)(v3 + 16) = v4;
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(a2 + 24);
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(v3 + 40) = result;
  *(void *)(v3 + 56) = *(void *)(a2 + 56);
  return result;
}

uint64_t assignWithTake for HealthPlatformContextProvider.ProtectedState(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakTakeAssign();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 24);
  }
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = v4;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthPlatformContextProvider.ProtectedState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  if ((*(void *)(a1 + 8) & 0xF000000000000007) != 0) {
    int v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  }
  else {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthPlatformContextProvider.ProtectedState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      *(void *)(result + 8) = 1;
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthPlatformContextProvider.ProtectedState()
{
  return &type metadata for HealthPlatformContextProvider.ProtectedState;
}

unint64_t sub_1C274E634()
{
  unint64_t result = qword_1EA305640;
  if (!qword_1EA305640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305640);
  }
  return result;
}

unint64_t sub_1C274E68C()
{
  unint64_t result = qword_1EA305648;
  if (!qword_1EA305648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305648);
  }
  return result;
}

unint64_t sub_1C274E6E4()
{
  unint64_t result = qword_1EA305650;
  if (!qword_1EA305650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305650);
  }
  return result;
}

uint64_t sub_1C274E738(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000001C278A5D0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1C277C7E0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1C274E7C0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_1C274A3CC(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_1C274E7DC@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  return sub_1C2749CCC(a1, *(void *)(v2 + 16), *(uint64_t **)(v2 + 24), a2);
}

uint64_t sub_1C274E7F8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1C2749614(*a1, *(void *)(v2 + 24));
  *a2 = result;
  return result;
}

uint64_t sub_1C274E83C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C274E884()
{
  return sub_1C274A060(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_1C274E898(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_1C274E8B4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (!v1) {
    return v2;
  }
  uint64_t v26 = *(void *)(a1 + 16);
  uint64_t v28 = MEMORY[0x1E4FBC860];
  sub_1C2659E40(0, v1, 0);
  uint64_t v2 = v28;
  uint64_t result = sub_1C2751C2C(a1);
  uint64_t v5 = result;
  uint64_t v7 = v26;
  uint64_t v6 = a1;
  uint64_t v8 = 0;
  uint64_t v9 = a1 + 64;
  uint64_t v10 = a1 + 80;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(v6 + 32))
  {
    unint64_t v12 = (unint64_t)v5 >> 6;
    if ((*(void *)(v9 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(v6 + 36) != v4) {
      goto LABEL_24;
    }
    uint64_t v13 = *(void *)(*(void *)(v6 + 48) + 8 * v5);
    uint64_t v14 = *(void *)(*(void *)(v6 + 56) + 8 * v5);
    unint64_t v16 = *(void *)(v28 + 16);
    unint64_t v15 = *(void *)(v28 + 24);
    if (v16 >= v15 >> 1)
    {
      uint64_t v24 = v9;
      uint64_t v25 = v4;
      uint64_t v23 = v10;
      uint64_t result = sub_1C2659E40(v15 > 1, v16 + 1, 1);
      uint64_t v10 = v23;
      uint64_t v9 = v24;
      uint64_t v4 = v25;
      uint64_t v7 = v26;
      uint64_t v6 = a1;
    }
    *(void *)(v28 + 16) = v16 + 1;
    uint64_t v17 = v28 + 16 * v16;
    *(void *)(v17 + 32) = v13;
    *(void *)(v17 + 40) = v14;
    int64_t v11 = 1 << *(unsigned char *)(v6 + 32);
    if (v5 >= v11) {
      goto LABEL_25;
    }
    uint64_t v18 = *(void *)(v9 + 8 * v12);
    if ((v18 & (1 << v5)) == 0) {
      goto LABEL_26;
    }
    if (*(_DWORD *)(v6 + 36) != v4) {
      goto LABEL_27;
    }
    unint64_t v19 = v18 & (-2 << (v5 & 0x3F));
    if (v19)
    {
      int64_t v11 = __clz(__rbit64(v19)) | v5 & 0xFFFFFFFFFFFFFFC0;
    }
    else
    {
      unint64_t v20 = v12 + 1;
      unint64_t v21 = (unint64_t)(v11 + 63) >> 6;
      if (v12 + 1 < v21)
      {
        unint64_t v22 = *(void *)(v9 + 8 * v20);
        if (v22)
        {
LABEL_20:
          int64_t v11 = __clz(__rbit64(v22)) + (v20 << 6);
        }
        else
        {
          while (v21 - 2 != v12)
          {
            unint64_t v22 = *(void *)(v10 + 8 * v12++);
            if (v22)
            {
              unint64_t v20 = v12 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v8;
    uint64_t v5 = v11;
    if (v8 == v7) {
      return v2;
    }
  }
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
  __break(1u);
  return result;
}

uint64_t sub_1C274EAB4(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v26 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v2 = sub_1C277C1C0();
  }
  else {
    uint64_t v2 = *(void *)(a1 + 16);
  }
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v31 = MEMORY[0x1E4FBC860];
    sub_1C265A0F8(0, v2 & ~(v2 >> 63), 0);
    uint64_t result = sub_1C2751CB4(v1);
    uint64_t v28 = result;
    uint64_t v29 = v4;
    char v30 = v5 & 1;
    if (v2 < 0)
    {
      __break(1u);
LABEL_20:
      __break(1u);
    }
    else
    {
      uint64_t v25 = v1;
      do
      {
        while (1)
        {
          uint64_t v13 = v28;
          uint64_t v12 = v29;
          char v14 = v30;
          sub_1C2751D78(v27, v28, v29, v30, v1);
          unint64_t v16 = v15;
          uint64_t v17 = (void *)v27[0];
          id v18 = objc_msgSend(v15, sel_code);
          id v19 = objc_msgSend(v17, sel_longLongValue);

          uint64_t v20 = v31;
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = sub_1C265A0F8(0, *(void *)(v20 + 16) + 1, 1);
            uint64_t v20 = v31;
          }
          unint64_t v22 = *(void *)(v20 + 16);
          unint64_t v21 = *(void *)(v20 + 24);
          if (v22 >= v21 >> 1)
          {
            uint64_t result = sub_1C265A0F8(v21 > 1, v22 + 1, 1);
            uint64_t v20 = v31;
          }
          *(void *)(v20 + 16) = v22 + 1;
          uint64_t v23 = v20 + 16 * v22;
          *(void *)(v23 + 32) = v18;
          *(void *)(v23 + 40) = v19;
          if (v26) {
            break;
          }
          uint64_t v1 = v25;
          sub_1C2751A78(v13, v12, v14, v25, (unint64_t *)&qword_1EBB85E80, 0x1E4F2B2C0, (void (*)())sub_1C2673470);
          uint64_t v7 = v6;
          uint64_t v9 = v8;
          char v11 = v10;
          sub_1C26431E8(v13, v12, v14);
          uint64_t v28 = v7;
          uint64_t v29 = v9;
          char v30 = v11 & 1;
          if (!--v2) {
            goto LABEL_17;
          }
        }
        uint64_t v1 = v25;
        if ((v14 & 1) == 0) {
          goto LABEL_20;
        }
        if (sub_1C277C4A0()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_1C27530F0();
        uint64_t v24 = (void (*)(void *, void))sub_1C277B780();
        sub_1C277C540();
        v24(v27, 0);
        --v2;
      }
      while (v2);
LABEL_17:
      sub_1C26431E8(v28, v29, v30);
      return v31;
    }
  }
  return result;
}

uint64_t static InputSignalIdentifier.objectTypeAnchorQuery.getter()
{
  return sub_1C277AED0();
}

uint64_t static InputSignalSet.LookupKey.objectTypeAnchorQuery.getter()
{
  uint64_t v0 = sub_1C277AEE0();
  MEMORY[0x1F4188790](v0 - 8);
  sub_1C277AED0();
  type metadata accessor for ObjectTypeAnchorQueryInputSignal();
  return sub_1C277ACD0();
}

uint64_t type metadata accessor for ObjectTypeAnchorQueryInputSignal()
{
  return self;
}

void *ObjectTypeAnchorQueryInputSignal.__allocating_init(context:observer:healthStore:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t ObjectType = swift_getObjectType();

  return sub_1C2752214(a1, a3, a4, a5, v5, ObjectType, a2);
}

void *ObjectTypeAnchorQueryInputSignal.__allocating_init(context:observer:healthStore:changesObserver:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *(void *)(a6 + 24);
  uint64_t v14 = *(void *)(a6 + 32);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1(a6, v13);
  unint64_t v16 = sub_1C2752818(a1, a2, a3, a4, a5, v15, v6, v13, v14);
  __swift_destroy_boxed_opaque_existential_0(a6);
  return v16;
}

void *ObjectTypeAnchorQueryInputSignal.init(context:observer:healthStore:changesObserver:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *(void *)(a6 + 24);
  uint64_t v14 = *(void *)(a6 + 32);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1(a6, v13);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v18 + 16))(v17);
  id v19 = sub_1C2752110(a1, a2, a3, a4, a5, (uint64_t)v17, v6, v13, v14);
  __swift_destroy_boxed_opaque_existential_0(a6);
  return v19;
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.init(anchorsByCode:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ObjectTypeAnchorQueryInputSignal.observer.getter()
{
  return swift_unknownObjectRetain();
}

void sub_1C274F090(void *a1, uint64_t *a2, uint64_t a3, uint64_t isUniquelyReferenced_nonNull_native)
{
  uint64_t v7 = sub_1C277AEE0();
  unint64_t v74 = *(void (***)(char *, uint64_t))(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C277B130();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v68 - v15;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v18 = Strong;
    if (a2)
    {
      uint64_t v72 = v10;
      uint64_t v73 = v11;
      swift_getObjectType();
      id v19 = a2;
      sub_1C277AC30();
      uint64_t v20 = a2;
      swift_retain();
      uint64_t v21 = a2;
      swift_retain();
      unint64_t v22 = sub_1C277B100();
      os_log_type_t v23 = sub_1C277BD20();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = swift_slowAlloc();
        uint64_t v71 = isUniquelyReferenced_nonNull_native;
        uint64_t v25 = v24;
        uint64_t v69 = (void *)swift_slowAlloc();
        uint64_t v70 = swift_slowAlloc();
        uint64_t v76 = (void *)v70;
        *(_DWORD *)uint64_t v25 = 136315394;
        uint64_t v68 = v25 + 4;
        sub_1C277AED0();
        sub_1C2752C98(&qword_1EBB841D8, 255, MEMORY[0x1E4F66E78]);
        uint64_t v26 = sub_1C277C7B0();
        unint64_t v28 = v27;
        v74[1](v9, v7);
        uint64_t v75 = sub_1C263FDFC(v26, v28, (uint64_t *)&v76);
        sub_1C277C0D0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 12) = 2112;
        uint64_t v29 = a2;
        uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v75 = v30;
        sub_1C277C0D0();
        uint64_t v31 = v69;
        *uint64_t v69 = v30;

        _os_log_impl(&dword_1C2601000, v22, v23, "[%s] Query failed: %@; attempting to restart query.",
          (uint8_t *)v25,
          0x16u);
        sub_1C264E608();
        swift_arrayDestroy();
        MEMORY[0x1C875D230](v31, -1, -1);
        uint64_t v32 = v70;
        swift_arrayDestroy();
        MEMORY[0x1C875D230](v32, -1, -1);
        uint64_t v33 = v25;
        int isUniquelyReferenced_nonNull_native = v71;
        MEMORY[0x1C875D230](v33, -1, -1);
      }
      else
      {
        swift_release_n();
      }
      (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v72);
      if (qword_1EA303F18 != -1) {
LABEL_37:
      }
        swift_once();
      uint64_t v54 = swift_allocObject();
      *(void *)(v54 + 16) = v18;
      *(void *)(v54 + 24) = isUniquelyReferenced_nonNull_native;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_1C2721A14((uint64_t)sub_1C27530B4, v54);
      swift_release();

      goto LABEL_24;
    }
    if (!a1)
    {
      uint64_t v73 = v11;
      swift_getObjectType();
      sub_1C277AC30();
      swift_retain_n();
      uint64_t v55 = sub_1C277B100();
      os_log_type_t v56 = sub_1C277BD20();
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v57 = swift_slowAlloc();
        uint64_t v72 = v10;
        uint64_t v58 = (uint8_t *)v57;
        uint64_t v70 = swift_slowAlloc();
        uint64_t v76 = (void *)v70;
        uint64_t v71 = isUniquelyReferenced_nonNull_native;
        *(_DWORD *)uint64_t v58 = 136315138;
        uint64_t v69 = v58 + 4;
        sub_1C277AED0();
        sub_1C2752C98(&qword_1EBB841D8, 255, MEMORY[0x1E4F66E78]);
        uint64_t v59 = sub_1C277C7B0();
        unint64_t v61 = v60;
        v74[1](v9, v7);
        uint64_t v75 = sub_1C263FDFC(v59, v61, (uint64_t *)&v76);
        int isUniquelyReferenced_nonNull_native = v71;
        sub_1C277C0D0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C2601000, v55, v56, "[%s] Query failed without reporting an error (nil anchor); attempting to restart query.",
          v58,
          0xCu);
        uint64_t v62 = v70;
        swift_arrayDestroy();
        MEMORY[0x1C875D230](v62, -1, -1);
        MEMORY[0x1C875D230](v58, -1, -1);

        (*(void (**)(char *, uint64_t))(v73 + 8))(v14, v72);
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v73 + 8))(v14, v10);
      }
      if (qword_1EA303F18 != -1) {
        swift_once();
      }
      uint64_t v67 = swift_allocObject();
      *(void *)(v67 + 16) = v18;
      *(void *)(v67 + 24) = isUniquelyReferenced_nonNull_native;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_1C2721A14((uint64_t)sub_1C2753058, v67);
      swift_release();
LABEL_24:
      swift_release();
      return;
    }
    uint64_t v34 = a1;
    id v35 = objc_msgSend(v34, sel_anchors);
    sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E80);
    sub_1C2644ED8(0, &qword_1EBB851C0);
    sub_1C264E7E8((unint64_t *)&qword_1EBB84498, (unint64_t *)&qword_1EBB85E80);
    uint64_t v36 = sub_1C277B760();

    uint64_t v37 = sub_1C274EAB4(v36);
    swift_bridgeObjectRelease();
    uint64_t v38 = *(void *)(v37 + 16);
    if (v38)
    {
      uint64_t v73 = 0;
      unint64_t v74 = v34;
      swift_bridgeObjectRetain();
      uint64_t v72 = v37;
      a2 = (uint64_t *)(v37 + 40);
      uint64_t v39 = (void *)MEMORY[0x1E4FBC868];
      while (1)
      {
        uint64_t v41 = *(a2 - 1);
        uint64_t v40 = *a2;
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v76 = v39;
        unint64_t v43 = sub_1C267315C(v41);
        uint64_t v44 = v39[2];
        BOOL v45 = (v42 & 1) == 0;
        uint64_t v46 = v44 + v45;
        if (__OFADD__(v44, v45))
        {
          __break(1u);
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        char v47 = v42;
        if (v39[3] >= v46)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            uint64_t v39 = v76;
            if (v42) {
              goto LABEL_8;
            }
          }
          else
          {
            sub_1C2677294();
            uint64_t v39 = v76;
            if (v47) {
              goto LABEL_8;
            }
          }
        }
        else
        {
          sub_1C2673AE4(v46, isUniquelyReferenced_nonNull_native);
          unint64_t v48 = sub_1C267315C(v41);
          if ((v47 & 1) != (v49 & 1))
          {
            type metadata accessor for _HKDataTypeCode(0);
            sub_1C277C850();
            __break(1u);
            return;
          }
          unint64_t v43 = v48;
          uint64_t v39 = v76;
          if (v47)
          {
LABEL_8:
            *(void *)(v39[7] + 8 * v43) = v40;
            goto LABEL_9;
          }
        }
        v39[(v43 >> 6) + 8] |= 1 << v43;
        uint64_t v50 = 8 * v43;
        *(void *)(v39[6] + v50) = v41;
        *(void *)(v39[7] + v50) = v40;
        uint64_t v51 = v39[2];
        BOOL v52 = __OFADD__(v51, 1);
        uint64_t v53 = v51 + 1;
        if (v52) {
          goto LABEL_36;
        }
        v39[2] = v53;
LABEL_9:
        a2 += 2;
        swift_bridgeObjectRelease();
        if (!--v38)
        {
          swift_bridgeObjectRelease();
          uint64_t v34 = v74;
          goto LABEL_29;
        }
      }
    }
    uint64_t v39 = (void *)MEMORY[0x1E4FBC868];
LABEL_29:
    uint64_t v63 = swift_bridgeObjectRelease();
    uint64_t v64 = *(void *)(v18 + 96);
    MEMORY[0x1F4188790](v63);
    *(&v68 - 4) = (uint64_t)v34;
    *(&v68 - 3) = v18;
    *(&v68 - 2) = (uint64_t)v39;
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v64 + 24));
    sub_1C2753090((uint64_t *)(v64 + 16), (uint64_t *)&v76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v64 + 24));
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v65 = (uint64_t)v76;
    swift_getObjectType();
    uint64_t v75 = v18;
    uint64_t v76 = (void *)v65;
    type metadata accessor for ObjectTypeAnchorQueryInputSignal();
    sub_1C2752C98(&qword_1EBB83E78, v66, (void (*)(uint64_t))type metadata accessor for ObjectTypeAnchorQueryInputSignal);
    sub_1C277AE40();
    swift_bridgeObjectRelease();
    swift_release();
  }
}

uint64_t ObjectTypeAnchorQueryInputSignal.identifier.getter()
{
  return sub_1C277AED0();
}

uint64_t sub_1C274FB18(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a2;
  uint64_t v34 = a4;
  uint64_t v6 = sub_1C277AEE0();
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C277B130();
  uint64_t v32 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  sub_1C277AC30();
  swift_retain_n();
  uint64_t v12 = sub_1C277B100();
  os_log_type_t v13 = sub_1C277BD40();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = a3;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v36 = v29;
    *(_DWORD *)uint64_t v15 = 136315138;
    unint64_t v27 = v15 + 4;
    sub_1C277AED0();
    sub_1C2752C98(&qword_1EBB841D8, 255, MEMORY[0x1E4F66E78]);
    uint64_t v16 = sub_1C277C7B0();
    uint64_t v28 = v9;
    unint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v6);
    uint64_t v35 = sub_1C263FDFC(v16, v18, &v36);
    sub_1C277C0D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v12, v13, "[%s] Device unlocked; retrying.", v15, 0xCu);
    uint64_t v19 = v29;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v19, -1, -1);
    MEMORY[0x1C875D230](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v28);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v9);
  }
  uint64_t v20 = a1[10];
  uint64_t v21 = a1[11];
  __swift_project_boxed_opaque_existential_1(a1 + 7, v20);
  uint64_t v22 = swift_allocObject();
  swift_weakInit();
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = v33;
  *(void *)(v23 + 16) = v22;
  *(void *)(v23 + 24) = v24;
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 8);
  swift_retain();
  swift_bridgeObjectRetain();
  v25(v34, v23, v20, v21);
  swift_release();
  return swift_release();
}

uint64_t sub_1C274FEF4@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v46 = a4;
  uint64_t v47 = a3;
  uint64_t v6 = sub_1C277AEE0();
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v38 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C277B130();
  uint64_t v43 = *(void *)(v8 - 8);
  uint64_t v44 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(a2, sel_anchors);
  uint64_t v12 = sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E80);
  sub_1C2644ED8(0, &qword_1EBB851C0);
  sub_1C264E7E8((unint64_t *)&qword_1EBB84498, (unint64_t *)&qword_1EBB85E80);
  uint64_t v39 = v12;
  os_log_type_t v13 = v10;
  unint64_t v14 = sub_1C277B760();

  id v15 = a2;
  BOOL v45 = a1;
  uint64_t v16 = v42;
  sub_1C27523B0(v14, a1, v15);

  swift_getObjectType();
  sub_1C277AC30();
  swift_retain_n();
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_1C277B100();
  os_log_type_t v18 = sub_1C277BD40();
  int v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v42 = v16;
    uint64_t v21 = v20;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v49 = v37;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v35 = v21 + 4;
    uint64_t v22 = v38;
    sub_1C277AED0();
    sub_1C2752C98(&qword_1EBB841D8, 255, MEMORY[0x1E4F66E78]);
    int v36 = v19;
    uint64_t v23 = v41;
    uint64_t v24 = sub_1C277C7B0();
    unint64_t v26 = v25;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v22, v23);
    uint64_t v48 = sub_1C263FDFC(v24, v26, &v49);
    sub_1C277C0D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v27 = swift_bridgeObjectRetain();
    uint64_t v28 = MEMORY[0x1C875B960](v27, v39);
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    uint64_t v48 = sub_1C263FDFC(v28, v30, &v49);
    sub_1C277C0D0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v17, (os_log_type_t)v36, "[%s] Types changed: %s", (uint8_t *)v21, 0x16u);
    uint64_t v31 = v37;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v31, -1, -1);
    MEMORY[0x1C875D230](v21, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v43 + 8))(v13, v44);
  uint64_t v32 = v45;
  uint64_t v33 = v47;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t *v32 = v33;
  *uint64_t v46 = v33;
  return swift_bridgeObjectRetain();
}

void sub_1C275039C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*a1) {
    objc_msgSend(*(id *)(a2 + 24), sel_stopQuery_);
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  id v9 = objc_allocWithZone(MEMORY[0x1E4F2B940]);
  v14[4] = sub_1C2753024;
  v14[5] = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1C2615DFC;
  v14[3] = &block_descriptor_28;
  uint64_t v10 = _Block_copy(v14);
  swift_retain();
  id v11 = objc_msgSend(v9, sel_initWithUpdateHandler_, v10);
  _Block_release(v10);
  swift_release();
  uint64_t v12 = *a1;
  id v13 = v11;

  *a1 = v11;
  objc_msgSend(*(id *)(a2 + 24), sel_executeQuery_, v13);
}

void sub_1C27504EC()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)v0 + 16);
  uint64_t v2 = (void **)&v1[4];
  char v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_1C2752FCC(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.anchorsByCode.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.anchorsByCode.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*ObjectTypeAnchorQueryInputSignal.Anchor.anchorsByCode.modify())()
{
  return nullsub_1;
}

void ObjectTypeAnchorQueryInputSignal.Anchor.hasDifference(from:for:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = *v2;
  if ((*a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1C277C170();
    sub_1C2644ED8(0, &qword_1EBB80D80);
    sub_1C264E7E8(&qword_1EBB80D88, &qword_1EBB80D80);
    sub_1C277BC10();
    uint64_t v4 = v33;
    uint64_t v30 = v34;
    uint64_t v6 = v35;
    uint64_t v7 = v36;
    unint64_t v8 = v37;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(v4 + 32);
    uint64_t v30 = v4 + 56;
    uint64_t v6 = ~v9;
    uint64_t v10 = -v9;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v8 = v11 & *(void *)(v4 + 56);
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
  }
  int64_t v29 = (unint64_t)(v6 + 64) >> 6;
  uint64_t v31 = v5;
  while (1)
  {
    uint64_t v12 = v7;
    if (v4 < 0)
    {
      if (!sub_1C277C200()) {
        goto LABEL_41;
      }
      sub_1C2644ED8(0, &qword_1EBB80D80);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v15 = v32;
      swift_unknownObjectRelease();
      if (!v32) {
        goto LABEL_41;
      }
      goto LABEL_30;
    }
    if (!v8) {
      break;
    }
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v14 = v13 | (v7 << 6);
LABEL_29:
    id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    if (!v15) {
      goto LABEL_41;
    }
LABEL_30:
    id v19 = objc_msgSend(v15, sel_code);
    if (*(void *)(v5 + 16) && (unint64_t v20 = sub_1C267315C((uint64_t)v19), (v21 & 1) != 0))
    {
      int v22 = 0;
      uint64_t v23 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
      if (!v3) {
        goto LABEL_8;
      }
LABEL_35:
      id v24 = objc_msgSend(v15, sel_code);
      if (!*(void *)(v3 + 16)) {
        goto LABEL_8;
      }
      unint64_t v25 = sub_1C267315C((uint64_t)v24);
      if ((v26 & 1) == 0) {
        goto LABEL_8;
      }
      uint64_t v27 = *(void *)(*(void *)(v3 + 56) + 8 * v25);

      if (v23 == v27) {
        int v28 = v22;
      }
      else {
        int v28 = 1;
      }
      uint64_t v5 = v31;
      if (v28 == 1) {
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v23 = 0;
      int v22 = 1;
      if (v3) {
        goto LABEL_35;
      }
LABEL_8:

      uint64_t v5 = v31;
      if ((v22 & 1) == 0) {
        goto LABEL_41;
      }
    }
  }
  int64_t v16 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v16 >= v29) {
      goto LABEL_41;
    }
    unint64_t v17 = *(void *)(v30 + 8 * v16);
    ++v7;
    if (!v17)
    {
      uint64_t v7 = v12 + 2;
      if (v12 + 2 >= v29) {
        goto LABEL_41;
      }
      unint64_t v17 = *(void *)(v30 + 8 * v7);
      if (!v17)
      {
        uint64_t v7 = v12 + 3;
        if (v12 + 3 >= v29) {
          goto LABEL_41;
        }
        unint64_t v17 = *(void *)(v30 + 8 * v7);
        if (!v17)
        {
          uint64_t v7 = v12 + 4;
          if (v12 + 4 >= v29) {
            goto LABEL_41;
          }
          unint64_t v17 = *(void *)(v30 + 8 * v7);
          if (!v17)
          {
            uint64_t v18 = v12 + 5;
            while (v29 != v18)
            {
              unint64_t v17 = *(void *)(v30 + 8 * v18++);
              if (v17)
              {
                uint64_t v7 = v18 - 1;
                goto LABEL_28;
              }
            }
LABEL_41:
            sub_1C2648F6C();
            return;
          }
        }
      }
    }
LABEL_28:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v7 << 6);
    goto LABEL_29;
  }
  __break(1u);
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.merged(with:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t result = sub_1C275095C(v4, v3);
  *a1 = result;
  return result;
}

uint64_t sub_1C275095C(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_1C2751798(a1, (uint64_t)sub_1C2752208, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.identifier.getter()
{
  return sub_1C277AED0();
}

uint64_t sub_1C2750A04()
{
  return 0x4273726F68636E61;
}

uint64_t sub_1C2750A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x4273726F68636E61 && a2 == 0xED000065646F4379)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1C277C7E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1C2750AE4(uint64_t a1)
{
  unint64_t v2 = sub_1C2752944();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C2750B20(uint64_t a1)
{
  unint64_t v2 = sub_1C2752944();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_1C2752998(0, &qword_1EBB84380, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v30 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2752944();
  sub_1C277C9A0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  sub_1C267AC6C();
  sub_1C267AD38(&qword_1EBB82DD8);
  sub_1C277C6D0();
  uint64_t v35 = v9;
  uint64_t v10 = sub_1C266C31C((uint64_t)v36);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11)
  {
    unint64_t v13 = (void *)MEMORY[0x1E4FBC868];
LABEL_19:
    (*(void (**)(char *, uint64_t))(v7 + 8))(v35, v6);
    swift_bridgeObjectRelease();
    *a2 = v13;
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v31 = v7;
  uint64_t v32 = v6;
  uint64_t v33 = a2;
  uint64_t v34 = a1;
  swift_bridgeObjectRetain();
  uint64_t v30 = v10;
  uint64_t v12 = (uint64_t *)(v10 + 40);
  unint64_t v13 = (void *)MEMORY[0x1E4FBC868];
  while (1)
  {
    uint64_t v15 = *(v12 - 1);
    uint64_t v14 = *v12;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v36 = v13;
    unint64_t v18 = sub_1C267315C(v15);
    uint64_t v19 = v13[2];
    BOOL v20 = (v17 & 1) == 0;
    uint64_t v21 = v19 + v20;
    if (__OFADD__(v19, v20)) {
      break;
    }
    char v22 = v17;
    if (v13[3] >= v21)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        unint64_t v13 = v36;
        if (v17) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_1C2677294();
        unint64_t v13 = v36;
        if (v22) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_1C2673AE4(v21, isUniquelyReferenced_nonNull_native);
      unint64_t v23 = sub_1C267315C(v15);
      if ((v22 & 1) != (v24 & 1)) {
        goto LABEL_23;
      }
      unint64_t v18 = v23;
      unint64_t v13 = v36;
      if (v22)
      {
LABEL_4:
        *(void *)(v13[7] + 8 * v18) = v14;
        goto LABEL_5;
      }
    }
    v13[(v18 >> 6) + 8] |= 1 << v18;
    uint64_t v25 = 8 * v18;
    *(void *)(v13[6] + v25) = v15;
    *(void *)(v13[7] + v25) = v14;
    uint64_t v26 = v13[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_22;
    }
    void v13[2] = v28;
LABEL_5:
    v12 += 2;
    swift_bridgeObjectRelease();
    if (!--v11)
    {
      swift_bridgeObjectRelease();
      a2 = v33;
      a1 = v34;
      uint64_t v7 = v31;
      uint64_t v6 = v32;
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  type metadata accessor for _HKDataTypeCode(0);
  uint64_t result = sub_1C277C850();
  __break(1u);
  return result;
}

uint64_t ObjectTypeAnchorQueryInputSignal.Anchor.encode(to:)(void *a1)
{
  sub_1C2752998(0, &qword_1EBB83960, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)v30 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2752944();
  uint64_t v33 = v7;
  sub_1C277C9B0();
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = sub_1C274E8B4(v8);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v9 + 16);
  if (!v10)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4FBC868];
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v34 = v12;
    sub_1C267AC6C();
    sub_1C267AD38(&qword_1EBB82DD0);
    uint64_t v28 = v33;
    sub_1C277C760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v28, v4);
    return swift_bridgeObjectRelease();
  }
  v30[1] = v1;
  uint64_t v31 = v5;
  uint64_t v32 = v4;
  swift_bridgeObjectRetain();
  v30[0] = v9;
  uint64_t v11 = (uint64_t *)(v9 + 40);
  uint64_t v12 = (void *)MEMORY[0x1E4FBC868];
  while (1)
  {
    uint64_t v14 = *(v11 - 1);
    uint64_t v13 = *v11;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v34 = v12;
    unint64_t v17 = sub_1C26732B0(v14);
    uint64_t v18 = v12[2];
    BOOL v19 = (v16 & 1) == 0;
    uint64_t v20 = v18 + v19;
    if (__OFADD__(v18, v19)) {
      break;
    }
    char v21 = v16;
    if (v12[3] >= v20)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v12 = v34;
        if (v16) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_1C2677420();
        uint64_t v12 = v34;
        if (v21) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_1C2673DB0(v20, isUniquelyReferenced_nonNull_native);
      unint64_t v22 = sub_1C26732B0(v14);
      if ((v21 & 1) != (v23 & 1)) {
        goto LABEL_21;
      }
      unint64_t v17 = v22;
      uint64_t v12 = v34;
      if (v21)
      {
LABEL_3:
        *(void *)(v12[7] + 8 * v17) = v13;
        goto LABEL_4;
      }
    }
    v12[(v17 >> 6) + 8] |= 1 << v17;
    uint64_t v24 = 8 * v17;
    *(void *)(v12[6] + v24) = v14;
    *(void *)(v12[7] + v24) = v13;
    uint64_t v25 = v12[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_20;
    }
    void v12[2] = v27;
LABEL_4:
    v11 += 2;
    swift_bridgeObjectRelease();
    if (!--v10)
    {
      swift_bridgeObjectRelease();
      uint64_t v5 = v31;
      uint64_t v4 = v32;
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = sub_1C277C850();
  __break(1u);
  return result;
}

unint64_t static ObjectTypeAnchorQueryInputSignal.Anchor.== infix(_:_:)(unint64_t *a1, uint64_t *a2)
{
  return sub_1C26073E8(*a1, *a2);
}

uint64_t sub_1C27511F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t result = sub_1C275095C(v4, v3);
  *a1 = result;
  return result;
}

uint64_t sub_1C2751250@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ObjectTypeAnchorQueryInputSignal.Anchor.init(from:)(a1, a2);
}

uint64_t sub_1C2751268(void *a1)
{
  return ObjectTypeAnchorQueryInputSignal.Anchor.encode(to:)(a1);
}

uint64_t (*ObjectTypeAnchorQueryInputSignal.Configuration.types.modify())()
{
  return nullsub_1;
}

uint64_t static ObjectTypeAnchorQueryInputSignal.Configuration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_1C26706F8(*a1, *a2);
}

uint64_t ObjectTypeAnchorQueryInputSignal.Configuration.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  sub_1C2679854(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t ObjectTypeAnchorQueryInputSignal.Configuration.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_1C277C8C0();
  sub_1C2679854((uint64_t)v3, v1);
  return sub_1C277C910();
}

uint64_t sub_1C2751340(uint64_t *a1, uint64_t *a2)
{
  return sub_1C26706F8(*a1, *a2);
}

uint64_t sub_1C275134C()
{
  uint64_t v1 = *v0;
  sub_1C277C8C0();
  sub_1C2679854((uint64_t)v3, v1);
  return sub_1C277C910();
}

void sub_1C2751394(uint64_t a1)
{
  sub_1C2679854(a1, *v1);
}

uint64_t sub_1C275139C()
{
  uint64_t v1 = *v0;
  sub_1C277C8C0();
  sub_1C2679854((uint64_t)v3, v1);
  return sub_1C277C910();
}

uint64_t ObjectTypeAnchorQueryInputSignal.beginObservation(from:configurations:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = v2[10];
  uint64_t v6 = v2[11];
  __swift_project_boxed_opaque_existential_1(v2 + 7, v5);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
  uint64_t v8 = MEMORY[0x1E4FBC870];
  uint64_t v22 = MEMORY[0x1E4FBC870];
  uint64_t v9 = *(void *)(a2 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v9; ++i)
    {
      unint64_t v11 = swift_bridgeObjectRetain();
      sub_1C26721E4(v11);
    }
    uint64_t v7 = swift_bridgeObjectRelease();
    uint64_t v8 = v22;
  }
  if (v4)
  {
    MEMORY[0x1F4188790](v7);
    uint64_t v13 = v12 + 4;
    uint64_t v14 = v12 + 6;
    os_unfair_lock_lock(v12 + 6);
    sub_1C26DE714(v13);
    os_unfair_lock_unlock(v14);
  }
  uint64_t v15 = sub_1C2672E90(v8);
  swift_bridgeObjectRelease();
  uint64_t v16 = v2[10];
  uint64_t v17 = v2[11];
  __swift_project_boxed_opaque_existential_1(v2 + 7, v16);
  uint64_t v18 = swift_allocObject();
  swift_weakInit();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  *(void *)(v19 + 24) = v15;
  uint64_t v20 = *(void (**)(void (*)(void *, uint64_t *), uint64_t, uint64_t, uint64_t))(v17 + 8);
  swift_retain();
  swift_retain();
  v20(sub_1C2752A38, v19, v16, v17);
  swift_release();
  swift_release();
  return swift_release();
}

Swift::Void __swiftcall ObjectTypeAnchorQueryInputSignal.stopObservation()()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t ObjectTypeAnchorQueryInputSignal.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  swift_release();
  return v0;
}

uint64_t ObjectTypeAnchorQueryInputSignal.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_1C27516B0(uint64_t *a1, uint64_t a2)
{
  return ObjectTypeAnchorQueryInputSignal.beginObservation(from:configurations:)(a1, a2);
}

uint64_t sub_1C27516D4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = *(void *)(*(void *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t sub_1C275172C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C2752C98(&qword_1EBB83E78, a2, (void (*)(uint64_t))type metadata accessor for ObjectTypeAnchorQueryInputSignal);

  return MEMORY[0x1F411FB20](a1, v3);
}

unint64_t sub_1C2751798(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_1C2751FA4();
  if (v9) {
    goto LABEL_26;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = (void *)*a5;
  unint64_t result = sub_1C267315C(v7);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  BOOL v17 = __OFADD__(v15, v16);
  uint64_t v18 = v15 + v16;
  if (v17)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char v19 = v14;
  if (v12[3] < v18)
  {
    sub_1C2673AE4(v18, a4 & 1);
    unint64_t result = sub_1C267315C(v10);
    if ((v19 & 1) == (v20 & 1)) {
      goto LABEL_7;
    }
LABEL_5:
    type metadata accessor for _HKDataTypeCode(0);
    unint64_t result = sub_1C277C850();
    __break(1u);
  }
  if ((a4 & 1) == 0)
  {
    unint64_t v24 = result;
    sub_1C2677294();
    unint64_t result = v24;
    char v21 = (void *)*a5;
    if (v19) {
      goto LABEL_8;
    }
    goto LABEL_12;
  }
LABEL_7:
  char v21 = (void *)*a5;
  if (v19)
  {
LABEL_8:
    uint64_t v22 = v21[7];
    uint64_t v23 = *(void *)(v22 + 8 * result);
    if (v11 < v23) {
      uint64_t v23 = v11;
    }
    *(void *)(v22 + 8 * result) = v23;
LABEL_14:
    uint64_t v28 = sub_1C2751FA4();
    if ((v30 & 1) == 0)
    {
      uint64_t v10 = v28;
      uint64_t v11 = v29;
      char v19 = 1;
      do
      {
        uint64_t v35 = (void *)*a5;
        unint64_t result = sub_1C267315C(v10);
        uint64_t v37 = v35[2];
        BOOL v38 = (v36 & 1) == 0;
        BOOL v17 = __OFADD__(v37, v38);
        uint64_t v39 = v37 + v38;
        if (v17) {
          goto LABEL_27;
        }
        a4 = v36;
        if (v35[3] < v39)
        {
          sub_1C2673AE4(v39, 1);
          unint64_t result = sub_1C267315C(v10);
          if ((a4 & 1) != (v40 & 1)) {
            goto LABEL_5;
          }
        }
        uint64_t v41 = (void *)*a5;
        if (a4)
        {
          uint64_t v31 = v41[7];
          uint64_t v32 = *(void *)(v31 + 8 * result);
          if (v11 < v32) {
            uint64_t v32 = v11;
          }
          *(void *)(v31 + 8 * result) = v32;
        }
        else
        {
          v41[(result >> 6) + 8] |= 1 << result;
          *(void *)(v41[6] + 8 * result) = v10;
          *(void *)(v41[7] + 8 * result) = v11;
          uint64_t v42 = v41[2];
          BOOL v17 = __OFADD__(v42, 1);
          uint64_t v43 = v42 + 1;
          if (v17) {
            goto LABEL_28;
          }
          v41[2] = v43;
        }
        uint64_t v10 = sub_1C2751FA4();
        uint64_t v11 = v33;
      }
      while ((v34 & 1) == 0);
    }
LABEL_26:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1C2648F6C();
    return swift_release();
  }
LABEL_12:
  v21[(result >> 6) + 8] |= 1 << result;
  uint64_t v25 = 8 * result;
  *(void *)(v21[6] + v25) = v10;
  *(void *)(v21[7] + v25) = v11;
  uint64_t v26 = v21[2];
  BOOL v17 = __OFADD__(v26, 1);
  uint64_t v27 = v26 + 1;
  if (!v17)
  {
    CFAbsoluteTime v21[2] = v27;
    goto LABEL_14;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1C2751A50(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1C2751A78(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, uint64_t a6, void (*a7)())
{
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(unsigned char *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if ((*(void *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a1))
    {
      if (*(_DWORD *)(a4 + 36) == a2)
      {
        sub_1C277C140();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_1C277C4B0() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_1C277C4C0();
  sub_1C27531AC(a1, a2, 1);
  sub_1C2644ED8(0, a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  a7();
  char v12 = v11;

  if (v12)
  {
    sub_1C277C490();
    sub_1C277C4E0();
    sub_1C26431E8(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_1C2751C2C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  char v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1C2751CB4(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_1C277C460();
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v1 = 1 << v5;
  if (v6 < 7) {
    return v1;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  unint64_t v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  char v9 = (unint64_t *)(a1 + 80);
  uint64_t v3 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v2 = v10;
    --v8;
    v3 += 64;
    if (v10) {
      return __clz(__rbit64(v2)) + v3;
    }
  }
  return v1;
}

void sub_1C2751D78(void *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  unint64_t v6 = a2;
  if ((a5 & 0xC000000000000001) != 0)
  {
    if (a4)
    {
      sub_1C277C4F0();
      sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E80);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_1C2644ED8(0, &qword_1EBB851C0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v13;
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_18;
  }
  if (a4)
  {
LABEL_10:
    if (sub_1C277C4B0() == *(_DWORD *)(a5 + 36))
    {
      sub_1C277C4C0();
      sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E80);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      unint64_t v6 = sub_1C2673470((uint64_t)v13);
      char v9 = v8;

      if (v9) {
        goto LABEL_12;
      }
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  unint64_t v10 = *(void **)(*(void *)(a5 + 48) + 8 * v6);
  char v11 = *(void **)(*(void *)(a5 + 56) + 8 * v6);
  *a1 = v11;
  v10;
  id v12 = v11;
}

uint64_t sub_1C2751FA4()
{
  void (*v10)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  void v19[2];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = 8 * v6;
    uint64_t v8 = *(void *)(*(void *)(v1 + 48) + 8 * v6);
    uint64_t v9 = *(void *)(*(void *)(v1 + 56) + v7);
    v0[3] = v4;
    v0[4] = v5;
    unint64_t v10 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v19[0] = v8;
    v19[1] = v9;
    v10(&v18, v19);
    return v18;
  }
  id v12 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = (unint64_t)(v0[2] + 64) >> 6;
    if (v12 < v13)
    {
      char v14 = v0[1];
      uint64_t v15 = *(void *)(v14 + 8 * v12);
      if (v15)
      {
LABEL_7:
        uint64_t v5 = (v15 - 1) & v15;
        unint64_t v6 = __clz(__rbit64(v15)) + (v12 << 6);
        int64_t v4 = v12;
        goto LABEL_3;
      }
      BOOL v16 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v13)
      {
        uint64_t v15 = *(void *)(v14 + 8 * v16);
        if (v15)
        {
LABEL_10:
          id v12 = v16;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v13)
        {
          uint64_t v15 = *(void *)(v14 + 8 * (v3 + 3));
          if (v15)
          {
            id v12 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v16 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v13)
          {
            uint64_t v15 = *(void *)(v14 + 8 * v16);
            if (v15) {
              goto LABEL_10;
            }
            id v12 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v13)
            {
              uint64_t v15 = *(void *)(v14 + 8 * v12);
              if (v15) {
                goto LABEL_7;
              }
              int64_t v4 = v13 - 1;
              BOOL v17 = v3 + 6;
              while (v13 != v17)
              {
                uint64_t v15 = *(void *)(v14 + 8 * v17++);
                if (v15)
                {
                  id v12 = v17 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    unint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

void *sub_1C2752110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v22 = a8;
  uint64_t v23 = a9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(boxed_opaque_existential_1, a6, a8);
  unint64_t v18 = sub_1C26813FC(MEMORY[0x1E4FBC860]);
  sub_1C264E310(0, &qword_1EBB84310);
  uint64_t v19 = swift_allocObject();
  *(_DWORD *)(v19 + 24) = 0;
  *(void *)(v19 + 16) = v18;
  a7[12] = v19;
  sub_1C261F308(&v21, (uint64_t)(a7 + 7));
  a7[2] = a5;
  a7[3] = a1;
  a7[4] = a2;
  a7[5] = a3;
  a7[6] = a4;
  return a7;
}

__n128 sub_1C2752208@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

void *sub_1C2752214(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  type metadata accessor for ObjectTypeAnchorQueryInputSignal.QueryObserver();
  uint64_t v13 = swift_allocObject();
  sub_1C264E310(0, &qword_1EBB84308);
  uint64_t v14 = swift_allocObject();
  *(_DWORD *)(v14 + 24) = 0;
  *(void *)(v14 + 16) = 0;
  *(void *)(v13 + 16) = v14;
  *(void *)(v13 + 24) = a4;
  uint64_t v15 = (void *)swift_allocObject();
  BOOL v16 = sub_1C27522E8(a1, a2, a3, (uint64_t)a4, v13, v15, a6, a7);
  id v17 = a4;
  return v16;
}

void *sub_1C27522E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t Input = type metadata accessor for ObjectTypeAnchorQueryInputSignal.QueryObserver();
  char v20 = &off_1F1DCFBB8;
  *(void *)&long long v18 = a5;
  unint64_t v15 = sub_1C26813FC(MEMORY[0x1E4FBC860]);
  sub_1C264E310(0, &qword_1EBB84310);
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 24) = 0;
  *(void *)(v16 + 16) = v15;
  a6[12] = v16;
  sub_1C261F308(&v18, (uint64_t)(a6 + 7));
  a6[2] = a4;
  a6[3] = a1;
  a6[4] = a8;
  a6[5] = a2;
  a6[6] = a3;
  return a6;
}

void sub_1C27523B0(unint64_t a1, uint64_t *a2, void *a3)
{
  unint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_1C277C470();
    unint64_t v34 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    unint64_t v3 = v4 | 0x8000000000000000;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    unint64_t v34 = a1 + 64;
    uint64_t v8 = ~v7;
    uint64_t v9 = -v7;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v6 = v10 & *(void *)(a1 + 64);
    uint64_t v5 = v8;
  }
  uint64_t v11 = 0;
  uint64_t v32 = v5;
  int64_t v33 = (unint64_t)(v5 + 64) >> 6;
  unint64_t v35 = v3;
  while ((v3 & 0x8000000000000000) != 0)
  {
    if (!sub_1C277C530()) {
      goto LABEL_53;
    }
    sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E80);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v15 = v39;
    swift_unknownObjectRelease();
    uint64_t v14 = v11;
    uint64_t v12 = v6;
    if (!v39) {
      goto LABEL_53;
    }
LABEL_33:
    id v19 = objc_msgSend(v15, sel_code, v32);
    uint64_t v20 = *a2;
    if (*(void *)(*a2 + 16) && (unint64_t v21 = sub_1C267315C((uint64_t)v19), (v22 & 1) != 0))
    {
      char v23 = 0;
      id v38 = *(id *)(*(void *)(v20 + 56) + 8 * v21);
    }
    else
    {
      id v38 = 0;
      char v23 = 1;
    }
    id v24 = objc_msgSend(a3, sel_anchors);
    sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85E80);
    sub_1C2644ED8(0, &qword_1EBB851C0);
    sub_1C264E7E8((unint64_t *)&qword_1EBB84498, (unint64_t *)&qword_1EBB85E80);
    uint64_t v25 = sub_1C277B760();

    if ((v25 & 0xC000000000000001) != 0)
    {
      id v26 = v15;
      if (!sub_1C277C500()) {
        goto LABEL_49;
      }
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v27 = v39;
      swift_unknownObjectRelease();
    }
    else
    {
      if (!*(void *)(v25 + 16)) {
        goto LABEL_50;
      }
      id v26 = v15;
      unint64_t v28 = sub_1C2673470((uint64_t)v26);
      if ((v29 & 1) == 0)
      {
LABEL_49:

LABEL_50:
        swift_bridgeObjectRelease();
LABEL_51:
        if (v23) {
          goto LABEL_8;
        }
        goto LABEL_52;
      }
      id v27 = *(id *)(*(void *)(v25 + 56) + 8 * v28);
    }

    swift_bridgeObjectRelease();
    if (!v27) {
      goto LABEL_51;
    }
    id v30 = objc_msgSend(v27, sel_longLongValue);

    if (v38 == v30) {
      char v31 = v23;
    }
    else {
      char v31 = 1;
    }
    if ((v31 & 1) == 0)
    {
LABEL_8:

      goto LABEL_9;
    }
LABEL_52:
    sub_1C277C390();
    sub_1C277C3D0();
    sub_1C277C3E0();
    sub_1C277C3A0();
LABEL_9:
    uint64_t v11 = v14;
    unint64_t v6 = v12;
    unint64_t v3 = v35;
  }
  if (v6)
  {
    uint64_t v12 = (v6 - 1) & v6;
    unint64_t v13 = __clz(__rbit64(v6)) | (v11 << 6);
    uint64_t v14 = v11;
LABEL_32:
    id v15 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
    if (!v15) {
      goto LABEL_53;
    }
    goto LABEL_33;
  }
  int64_t v16 = v11 + 1;
  if (!__OFADD__(v11, 1))
  {
    if (v16 >= v33) {
      goto LABEL_53;
    }
    unint64_t v17 = *(void *)(v34 + 8 * v16);
    uint64_t v14 = v11 + 1;
    if (!v17)
    {
      uint64_t v14 = v11 + 2;
      if (v11 + 2 >= v33) {
        goto LABEL_53;
      }
      unint64_t v17 = *(void *)(v34 + 8 * v14);
      if (!v17)
      {
        uint64_t v14 = v11 + 3;
        if (v11 + 3 >= v33) {
          goto LABEL_53;
        }
        unint64_t v17 = *(void *)(v34 + 8 * v14);
        if (!v17)
        {
          uint64_t v14 = v11 + 4;
          if (v11 + 4 >= v33) {
            goto LABEL_53;
          }
          unint64_t v17 = *(void *)(v34 + 8 * v14);
          if (!v17)
          {
            uint64_t v14 = v11 + 5;
            if (v11 + 5 >= v33) {
              goto LABEL_53;
            }
            unint64_t v17 = *(void *)(v34 + 8 * v14);
            if (!v17)
            {
              uint64_t v18 = v11 + 6;
              while (v33 != v18)
              {
                unint64_t v17 = *(void *)(v34 + 8 * v18++);
                if (v17)
                {
                  uint64_t v14 = v18 - 1;
                  goto LABEL_31;
                }
              }
LABEL_53:
              sub_1C2648F6C();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v12 = (v17 - 1) & v17;
    unint64_t v13 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

void *sub_1C2752818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v21 = a5;
  uint64_t v15 = *(void *)(a8 - 8);
  MEMORY[0x1F4188790](a1);
  unint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (void *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a6, a8);
  return sub_1C2752110(a1, a2, a3, a4, v21, (uint64_t)v17, v18, a8, a9);
}

unint64_t sub_1C2752944()
{
  unint64_t result = qword_1EBB83D88;
  if (!qword_1EBB83D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB83D88);
  }
  return result;
}

void sub_1C2752998(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1C2752944();
    unint64_t v7 = a3(a1, &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1C27529FC()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C2752A38(void *a1, uint64_t *a2)
{
  sub_1C274F090(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

unint64_t sub_1C2752A44()
{
  unint64_t result = qword_1EBB83DB8;
  if (!qword_1EBB83DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB83DB8);
  }
  return result;
}

unint64_t sub_1C2752A9C()
{
  unint64_t result = qword_1EBB83DA8;
  if (!qword_1EBB83DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB83DA8);
  }
  return result;
}

unint64_t sub_1C2752AF4()
{
  unint64_t result = qword_1EBB83DB0;
  if (!qword_1EBB83DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB83DB0);
  }
  return result;
}

unint64_t sub_1C2752B4C()
{
  unint64_t result = qword_1EA305668;
  if (!qword_1EA305668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305668);
  }
  return result;
}

unint64_t sub_1C2752BA4()
{
  unint64_t result = qword_1EBB83E68;
  if (!qword_1EBB83E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB83E68);
  }
  return result;
}

unint64_t sub_1C2752BFC()
{
  unint64_t result = qword_1EBB83E70;
  if (!qword_1EBB83E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB83E70);
  }
  return result;
}

uint64_t sub_1C2752C50(uint64_t a1, uint64_t a2)
{
  return sub_1C2752C98(&qword_1EBB83E80, a2, (void (*)(uint64_t))type metadata accessor for ObjectTypeAnchorQueryInputSignal);
}

uint64_t sub_1C2752C98(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_1C2752CE4()
{
  unint64_t result = qword_1EBB83DA0;
  if (!qword_1EBB83DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB83DA0);
  }
  return result;
}

uint64_t dispatch thunk of ObjectTypeAnchorObserver.startObserving(resultsHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ObjectTypeAnchorObserver.stopObserving()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for ObjectTypeAnchorQueryInputSignal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ObjectTypeAnchorQueryInputSignal);
}

uint64_t dispatch thunk of ObjectTypeAnchorQueryInputSignal.__allocating_init(context:observer:healthStore:changesObserver:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for ObjectTypeAnchorQueryInputSignal.QueryObserver()
{
  return self;
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.Anchor()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor;
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.Configuration()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.Configuration;
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.QueryObserver.State()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.QueryObserver.State;
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.State()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.State;
}

unsigned char *storeEnumTagSinglePayload for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1C2752E8CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys()
{
  return &type metadata for ObjectTypeAnchorQueryInputSignal.Anchor.CodingKeys;
}

unint64_t sub_1C2752EC8()
{
  unint64_t result = qword_1EA305670;
  if (!qword_1EA305670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305670);
  }
  return result;
}

unint64_t sub_1C2752F20()
{
  unint64_t result = qword_1EBB83D98;
  if (!qword_1EBB83D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB83D98);
  }
  return result;
}

unint64_t sub_1C2752F78()
{
  unint64_t result = qword_1EBB83D90;
  if (!qword_1EBB83D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB83D90);
  }
  return result;
}

void sub_1C2752FCC(void **a1)
{
  sub_1C275039C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C2752FEC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C2753024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(a2, a3);
}

uint64_t sub_1C2753058()
{
  return sub_1C274FB18(*(void **)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_1F1DCFCA8, (uint64_t)sub_1C27531C4);
}

uint64_t sub_1C2753090@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C274FEF4(a1, *(void **)(v2 + 16), *(void *)(v2 + 32), a2);
}

uint64_t sub_1C27530B4()
{
  return sub_1C274FB18(*(void **)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_1F1DCFC80, (uint64_t)sub_1C27531C4);
}

void sub_1C27530F0()
{
  if (!qword_1EBB83940)
  {
    sub_1C2644ED8(255, (unint64_t *)&qword_1EBB85E80);
    sub_1C2644ED8(255, &qword_1EBB851C0);
    sub_1C264E7E8((unint64_t *)&qword_1EBB84498, (unint64_t *)&qword_1EBB85E80);
    unint64_t v0 = sub_1C277B790();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB83940);
    }
  }
}

uint64_t sub_1C27531AC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t static InputSignalIdentifier.cloudSyncStatus.getter()
{
  return sub_1C277AED0();
}

uint64_t static InputSignalSet.LookupKey.cloudSyncStatus.getter()
{
  uint64_t v0 = sub_1C277AEE0();
  MEMORY[0x1F4188790](v0 - 8);
  sub_1C277AED0();
  type metadata accessor for CloudSyncStatusInputSignal();
  return sub_1C277ACD0();
}

uint64_t type metadata accessor for CloudSyncStatusInputSignal()
{
  return self;
}

uint64_t SyncError.init(error:)()
{
  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB854D0);

  return sub_1C277B730();
}

uint64_t static SyncError.== infix(_:_:)()
{
  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB854D0);
  sub_1C275346C((unint64_t *)&unk_1EA305678);

  return sub_1C277B710();
}

uint64_t SyncError.hash(into:)()
{
  sub_1C2635734();
  sub_1C27533E0();

  return sub_1C277B7C0();
}

unint64_t sub_1C27533E0()
{
  unint64_t result = qword_1EA305688;
  if (!qword_1EA305688)
  {
    sub_1C2635734();
    sub_1C275346C(&qword_1EA305690);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305688);
  }
  return result;
}

uint64_t sub_1C275346C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C2644ED8(255, (unint64_t *)&qword_1EBB854D0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C27534C0()
{
  return 0x726F727265;
}

uint64_t sub_1C27534D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1C277C7E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1C2753564(uint64_t a1)
{
  unint64_t v2 = sub_1C275378C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C27535A0(uint64_t a1)
{
  unint64_t v2 = sub_1C275378C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SyncError.encode(to:)(void *a1)
{
  sub_1C275BFD0(0, &qword_1EA305698, (uint64_t (*)(void))sub_1C275378C, (uint64_t)&type metadata for SyncError.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C275378C();
  sub_1C277C9B0();
  sub_1C2635734();
  sub_1C27537E0(&qword_1EA3056A8, 255, (void (*)(uint64_t))sub_1C2635734);
  sub_1C277C760();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1C275378C()
{
  unint64_t result = qword_1EA3056A0;
  if (!qword_1EA3056A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3056A0);
  }
  return result;
}

uint64_t sub_1C27537E0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t SyncError.hashValue.getter()
{
  return sub_1C277C910();
}

uint64_t SyncError.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  sub_1C2635734();
  uint64_t v19 = *(void *)(v4 - 8);
  uint64_t v20 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v21 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C275BFD0(0, &qword_1EA3056B0, (uint64_t (*)(void))sub_1C275378C, (uint64_t)&type metadata for SyncError.CodingKeys, MEMORY[0x1E4FBBDC0]);
  uint64_t v7 = v6;
  uint64_t v18 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = type metadata accessor for SyncError(0);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C275378C();
  sub_1C277C9A0();
  if (!v2)
  {
    uint64_t v13 = v18;
    uint64_t v14 = v19;
    sub_1C27537E0(&qword_1EA3056B8, 255, (void (*)(uint64_t))sub_1C2635734);
    uint64_t v15 = v20;
    sub_1C277C6D0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v7);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v12, v21, v15);
    sub_1C2759FA0((uint64_t)v12, v17, type metadata accessor for SyncError);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1C2753B60@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncError.init(from:)(a1, a2);
}

uint64_t sub_1C2753B78(void *a1)
{
  sub_1C275BFD0(0, &qword_1EA305698, (uint64_t (*)(void))sub_1C275378C, (uint64_t)&type metadata for SyncError.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C275378C();
  sub_1C277C9B0();
  sub_1C2635734();
  sub_1C27537E0(&qword_1EA3056A8, 255, (void (*)(uint64_t))sub_1C2635734);
  sub_1C277C760();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1C2753D28()
{
  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB854D0);
  sub_1C275346C((unint64_t *)&unk_1EA305678);

  return sub_1C277B710();
}

uint64_t sub_1C2753DB0()
{
  return sub_1C277C910();
}

uint64_t sub_1C2753E08()
{
  sub_1C2635734();
  sub_1C27533E0();

  return sub_1C277B7C0();
}

uint64_t sub_1C2753E5C()
{
  return sub_1C277C910();
}

uint64_t ActiveSyncState.hash(into:)()
{
  uint64_t v1 = type metadata accessor for SyncError(0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C275FA88(v0, (uint64_t)v7, type metadata accessor for ActiveSyncState);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 2, v1)) {
    return sub_1C277C8D0();
  }
  sub_1C2759FA0((uint64_t)v7, (uint64_t)v4, type metadata accessor for SyncError);
  sub_1C277C8D0();
  sub_1C2635734();
  sub_1C27533E0();
  sub_1C277B7C0();
  return sub_1C275A794((uint64_t)v4, type metadata accessor for SyncError);
}

uint64_t sub_1C275406C()
{
  uint64_t v1 = 0x6574656C706D6F63;
  if (*v0 != 1) {
    uint64_t v1 = 0x64656C696166;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6572676F72506E69;
  }
}

uint64_t sub_1C27540CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C275A074(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C27540F4(uint64_t a1)
{
  unint64_t v2 = sub_1C2759F4C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C2754130(uint64_t a1)
{
  unint64_t v2 = sub_1C2759F4C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C275416C(uint64_t a1)
{
  unint64_t v2 = sub_1C2759EA4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C27541A8(uint64_t a1)
{
  unint64_t v2 = sub_1C2759EA4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C27541E4(uint64_t a1)
{
  unint64_t v2 = sub_1C2759E50();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C2754220(uint64_t a1)
{
  unint64_t v2 = sub_1C2759E50();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C275425C(uint64_t a1)
{
  unint64_t v2 = sub_1C2759EF8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C2754298(uint64_t a1)
{
  unint64_t v2 = sub_1C2759EF8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t ActiveSyncState.encode(to:)(void *a1)
{
  unint64_t v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E4FBBDE0];
  sub_1C275BFD0(0, &qword_1EA3056C0, (uint64_t (*)(void))sub_1C2759E50, (uint64_t)&type metadata for ActiveSyncState.FailedCodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v36 = v3;
  uint64_t v33 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unint64_t v35 = (char *)&v27 - v4;
  uint64_t v37 = type metadata accessor for SyncError(0);
  uint64_t v5 = *(void *)(v37 - 8);
  MEMORY[0x1F4188790](v37);
  uint64_t v34 = (uint64_t)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C275BFD0(0, &qword_1EA3056D0, (uint64_t (*)(void))sub_1C2759EA4, (uint64_t)&type metadata for ActiveSyncState.CompletedCodingKeys, v2);
  uint64_t v31 = *(void *)(v7 - 8);
  uint64_t v32 = v7;
  MEMORY[0x1F4188790](v7);
  id v30 = (char *)&v27 - v8;
  sub_1C275BFD0(0, &qword_1EA3056E0, (uint64_t (*)(void))sub_1C2759EF8, (uint64_t)&type metadata for ActiveSyncState.InProgressCodingKeys, v2);
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v27 - v10;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C275BFD0(0, &qword_1EA3056F0, (uint64_t (*)(void))sub_1C2759F4C, (uint64_t)&type metadata for ActiveSyncState.CodingKeys, v2);
  uint64_t v16 = v15;
  uint64_t v39 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v27 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2759F4C();
  uint64_t v19 = v37;
  sub_1C277C9B0();
  sub_1C275FA88(v38, (uint64_t)v14, type metadata accessor for ActiveSyncState);
  int v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 2, v19);
  if (v20)
  {
    if (v20 == 1)
    {
      char v40 = 0;
      sub_1C2759EF8();
      sub_1C277C700();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
    }
    else
    {
      char v41 = 1;
      sub_1C2759EA4();
      id v26 = v30;
      sub_1C277C700();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v32);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v18, v16);
  }
  else
  {
    uint64_t v21 = v33;
    uint64_t v22 = v34;
    sub_1C2759FA0((uint64_t)v14, v34, type metadata accessor for SyncError);
    char v42 = 2;
    sub_1C2759E50();
    char v23 = v35;
    sub_1C277C700();
    sub_1C27537E0(&qword_1EA305700, 255, (void (*)(uint64_t))type metadata accessor for SyncError);
    uint64_t v24 = v36;
    sub_1C277C760();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v24);
    sub_1C275A794(v22, type metadata accessor for SyncError);
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v18, v16);
  }
}

uint64_t ActiveSyncState.hashValue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SyncError(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C277C8C0();
  sub_1C275FA88(v1, (uint64_t)v8, type metadata accessor for ActiveSyncState);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 2, v2))
  {
    sub_1C277C8D0();
  }
  else
  {
    sub_1C2759FA0((uint64_t)v8, (uint64_t)v5, type metadata accessor for SyncError);
    sub_1C277C8D0();
    sub_1C2635734();
    sub_1C27533E0();
    sub_1C277B7C0();
    sub_1C275A794((uint64_t)v5, type metadata accessor for SyncError);
  }
  return sub_1C277C910();
}

uint64_t ActiveSyncState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E4FBBDC0];
  sub_1C275BFD0(0, &qword_1EA305708, (uint64_t (*)(void))sub_1C2759E50, (uint64_t)&type metadata for ActiveSyncState.FailedCodingKeys, MEMORY[0x1E4FBBDC0]);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  uint64_t v45 = v5;
  MEMORY[0x1F4188790](v4);
  uint64_t v50 = (char *)&v38 - v6;
  sub_1C275BFD0(0, &qword_1EA305710, (uint64_t (*)(void))sub_1C2759EA4, (uint64_t)&type metadata for ActiveSyncState.CompletedCodingKeys, v3);
  uint64_t v42 = *(void *)(v7 - 8);
  uint64_t v43 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v47 = (char *)&v38 - v8;
  sub_1C275BFD0(0, &qword_1EA305718, (uint64_t (*)(void))sub_1C2759EF8, (uint64_t)&type metadata for ActiveSyncState.InProgressCodingKeys, v3);
  uint64_t v40 = *(void *)(v9 - 8);
  uint64_t v41 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v49 = (char *)&v38 - v10;
  sub_1C275BFD0(0, (unint64_t *)&unk_1EA305720, (uint64_t (*)(void))sub_1C2759F4C, (uint64_t)&type metadata for ActiveSyncState.CodingKeys, v3);
  uint64_t v12 = v11;
  uint64_t v48 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v38 - v13;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v16 = MEMORY[0x1F4188790](active);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  int v20 = (char *)&v38 - v19;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2759F4C();
  uint64_t v21 = v51;
  sub_1C277C9A0();
  if (v21) {
    goto LABEL_9;
  }
  uint64_t v39 = v18;
  char v23 = v49;
  uint64_t v22 = v50;
  uint64_t v51 = a1;
  uint64_t v24 = sub_1C277C6E0();
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v26 = sub_1C277C360();
    swift_allocError();
    uint64_t v27 = v14;
    uint64_t v29 = v28;
    sub_1C2706D5C();
    *uint64_t v29 = active;
    sub_1C277C670();
    sub_1C277C340();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v29, *MEMORY[0x1E4FBBA70], v26);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v27, v12);
    a1 = v51;
LABEL_9:
    uint64_t v30 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_0(v30);
  }
  if (*(unsigned char *)(v24 + 32))
  {
    if (*(unsigned char *)(v24 + 32) == 1)
    {
      char v53 = 1;
      sub_1C2759EA4();
      uint64_t v25 = v47;
      sub_1C277C660();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v25, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v14, v12);
      uint64_t v32 = type metadata accessor for SyncError(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v20, 2, 2, v32);
    }
    else
    {
      uint64_t v49 = (char *)v24;
      char v54 = 2;
      sub_1C2759E50();
      sub_1C277C660();
      uint64_t v34 = type metadata accessor for SyncError(0);
      sub_1C27537E0(&qword_1EA305738, 255, (void (*)(uint64_t))type metadata accessor for SyncError);
      uint64_t v35 = (uint64_t)v39;
      uint64_t v36 = v44;
      sub_1C277C6D0();
      uint64_t v37 = v48;
      (*(void (**)(char *, uint64_t))(v45 + 8))(v22, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v12);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v35, 0, 2, v34);
      sub_1C2759FA0(v35, (uint64_t)v20, type metadata accessor for ActiveSyncState);
    }
  }
  else
  {
    char v52 = 0;
    sub_1C2759EF8();
    sub_1C277C660();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v23, v41);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v14, v12);
    uint64_t v33 = type metadata accessor for SyncError(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v20, 1, 2, v33);
  }
  sub_1C2759FA0((uint64_t)v20, v46, type metadata accessor for ActiveSyncState);
  uint64_t v30 = (uint64_t)v51;
  return __swift_destroy_boxed_opaque_existential_0(v30);
}

uint64_t sub_1C275525C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ActiveSyncState.init(from:)(a1, a2);
}

uint64_t sub_1C2755274(void *a1)
{
  return ActiveSyncState.encode(to:)(a1);
}

uint64_t sub_1C2755294()
{
  uint64_t v1 = type metadata accessor for SyncError(0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C275FA88(v0, (uint64_t)v7, type metadata accessor for ActiveSyncState);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 2, v1)) {
    return sub_1C277C8D0();
  }
  sub_1C2759FA0((uint64_t)v7, (uint64_t)v5, type metadata accessor for SyncError);
  sub_1C277C8D0();
  sub_1C2635734();
  sub_1C27533E0();
  sub_1C277B7C0();
  return sub_1C275A794((uint64_t)v5, type metadata accessor for SyncError);
}

uint64_t sub_1C2755448()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SyncError(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C277C8C0();
  sub_1C275FA88(v1, (uint64_t)v8, type metadata accessor for ActiveSyncState);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 2, v2))
  {
    sub_1C277C8D0();
  }
  else
  {
    sub_1C2759FA0((uint64_t)v8, (uint64_t)v6, type metadata accessor for SyncError);
    sub_1C277C8D0();
    sub_1C2635734();
    sub_1C27533E0();
    sub_1C277B7C0();
    sub_1C275A794((uint64_t)v6, type metadata accessor for SyncError);
  }
  return sub_1C277C910();
}

id CloudSyncStatusInputSignal.__allocating_init(observer:healthStore:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for CloudSyncStatusInputSignal.ObserverShim();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = 0;
  id v8 = sub_1C275A1DC(a1, a2, v7, (char *)objc_allocWithZone(v3));
  swift_unknownObjectRelease();
  return v8;
}

id CloudSyncStatusInputSignal.__allocating_init(observer:shim:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(a3 + 32);
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v7);
  id v10 = sub_1C275A67C(a1, a2, v9, v3, v7, v8);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a3);
  return v10;
}

id CloudSyncStatusInputSignal.init(observer:shim:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(a3 + 32);
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v7);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  id v13 = sub_1C275A410(a1, a2, (uint64_t)v11, v3, v7, v8);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a3);
  return v13;
}

uint64_t CloudSyncStatusInputSignal.didUpdate(status:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  uint64_t v13 = a1;
  uint64_t v8 = (void **)(v7 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v7 + 16));
  uint64_t v9 = (os_unfair_lock_s *)(v7 + ((*(unsigned int *)(*(void *)v7 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v9);
  sub_1C275A778(v8, v6);
  os_unfair_lock_unlock(v9);
  swift_getObjectType();
  uint64_t v14 = v2;
  sub_1C27537E0(&qword_1EBB82910, v10, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal);
  sub_1C277AE40();
  return sub_1C275A794((uint64_t)v6, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1C27559C4@<X0>(void **a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *a1;
  id v10 = a2;

  *a1 = a2;
  uint64_t v11 = type metadata accessor for CloudSyncStatusInputSignal.State(0);
  sub_1C2634C4C((uint64_t)a1 + *(int *)(v11 + 20), (uint64_t)v8, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  uint64_t v12 = (uint64_t)a3 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.Anchor(0) + 20);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(active - 8) + 56))(v12, 1, 1, active);
  *a3 = a2;
  id v14 = v10;
  return sub_1C275A7F4((uint64_t)v8, v12);
}

uint64_t CloudSyncStatusInputSignal.Anchor.init(status:activeSyncState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = (uint64_t)a3 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.Anchor(0) + 20);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(active - 8) + 56))(v6, 1, 1, active);
  *a3 = a1;

  return sub_1C275A7F4(a2, v6);
}

uint64_t CloudSyncStatusInputSignal.didUpdate(activeSyncState:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  uint64_t v13 = a1;
  uint64_t v8 = (void **)(v7 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v7 + 16));
  uint64_t v9 = (os_unfair_lock_s *)(v7 + ((*(unsigned int *)(*(void *)v7 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v9);
  sub_1C275A874(v8, v6);
  os_unfair_lock_unlock(v9);
  swift_getObjectType();
  uint64_t v14 = v2;
  sub_1C27537E0(&qword_1EBB82910, v10, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal);
  sub_1C277AE40();
  return sub_1C275A794((uint64_t)v6, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1C2755D48@<X0>(void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = (uint64_t)a1 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.State(0) + 20);
  sub_1C2634CB8(v9, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1C275FA88(a2, v9, type metadata accessor for ActiveSyncState);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(active - 8) + 56);
  v11(v9, 0, 1, active);
  uint64_t v12 = *a1;
  sub_1C275FA88(a2, (uint64_t)v8, type metadata accessor for ActiveSyncState);
  v11((uint64_t)v8, 0, 1, active);
  uint64_t v13 = (uint64_t)a3 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.Anchor(0) + 20);
  v11(v13, 1, 1, active);
  *a3 = v12;
  id v14 = v12;
  return sub_1C275A7F4((uint64_t)v8, v13);
}

id sub_1C2755EF8(uint64_t a1)
{
  uint64_t v2 = v1;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2AD38]), sel_initWithHealthStore_delegate_, *(void *)(v1 + 16), a1);
  uint64_t v4 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = v3;

  if (qword_1EBB82A50 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1C277B130();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBB82A38);
  uint64_t v6 = sub_1C277B100();
  os_log_type_t v7 = sub_1C277BD40();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v13 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_1C277C9E0();
    sub_1C263FDFC(v10, v11, &v13);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v6, v7, "[%s] observing sync status and requests", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v9, -1, -1);
    MEMORY[0x1C875D230](v8, -1, -1);
  }

  objc_msgSend(*(id *)(v2 + 24), sel_startObservingSyncStatus);
  id result = *(id *)(v2 + 24);
  if (result) {
    return objc_msgSend(result, sel_startObservingSyncRequestsMatchingFilter_, 31);
  }
  return result;
}

uint64_t sub_1C27560FC()
{
  return swift_deallocClassInstance();
}

id sub_1C275613C(uint64_t a1)
{
  return sub_1C2755EF8(a1);
}

void sub_1C2756160()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  if (v2)
  {
    objc_msgSend(v2, sel_setDelegate_, 0);
    uint64_t v2 = *(void **)(v1 + 24);
  }
  *(void *)(v1 + 24) = 0;
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncDidStartWith:)(uint64_t a1, void *a2)
{
  return sub_1C275A890(a2);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncFailedWithError:)(uint64_t a1, void *a2)
{
  return sub_1C275AB78(a2);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserverStatusUpdated(_:status:)(uint64_t a1, void *a2)
{
  return sub_1C275B118(a2);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncStartedFor:with:)(uint64_t a1, void *a2, void *a3)
{
  return sub_1C275B360(a2, a3);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncFailedFor:error:)(uint64_t a1, void *a2, void *a3)
{
  return sub_1C275B6F4(a2, a3);
}

uint64_t CloudSyncStatusInputSignal.cloudSyncObserver(_:syncCompletedFor:)(uint64_t a1, void *a2)
{
  return sub_1C275BAF8(a2);
}

id CloudSyncStatusInputSignal.Anchor.status.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

void CloudSyncStatusInputSignal.Anchor.status.setter(void *a1)
{
  *id v1 = a1;
}

uint64_t (*CloudSyncStatusInputSignal.Anchor.status.modify())()
{
  return nullsub_1;
}

uint64_t CloudSyncStatusInputSignal.Anchor.activeSyncState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  return sub_1C2634C4C(v1 + *(int *)(v3 + 20), a1, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
}

uint64_t CloudSyncStatusInputSignal.Anchor.activeSyncState.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.Anchor(0) + 20);

  return sub_1C275A7F4(a1, v3);
}

uint64_t (*CloudSyncStatusInputSignal.Anchor.activeSyncState.modify())()
{
  return nullsub_1;
}

BOOL CloudSyncStatusInputSignal.Anchor.hasDifference(from:for:)(uint64_t a1, uint64_t (*a2)(char *, uint64_t, uint64_t))
{
  v282 = a2;
  uint64_t v284 = a1;
  uint64_t v276 = sub_1C277A840();
  uint64_t v278 = *(void *)(v276 - 8);
  MEMORY[0x1F4188790](v276);
  v256 = (char *)&v236 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1C2634D34(0, &qword_1EBB80D00, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  uint64_t v271 = v4;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v243 = (uint64_t)&v236 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v262 = (uint64_t)&v236 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  v259 = (char *)&v236 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v269 = (uint64_t)&v236 - v11;
  sub_1C263583C(0, (unint64_t *)&unk_1EBB84888, v3);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v237 = (uint64_t)&v236 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v242 = (char *)&v236 - v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v245 = (uint64_t)&v236 - v18;
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  v238 = (char *)&v236 - v20;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v248 = (uint64_t)&v236 - v22;
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  uint64_t v244 = (uint64_t)&v236 - v24;
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  v240 = (char *)&v236 - v26;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  uint64_t v253 = (uint64_t)&v236 - v28;
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  v246 = (char *)&v236 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  uint64_t v258 = (uint64_t)&v236 - v32;
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  uint64_t v252 = (uint64_t)&v236 - v34;
  uint64_t v35 = MEMORY[0x1F4188790](v33);
  v247 = (char *)&v236 - v36;
  uint64_t v37 = MEMORY[0x1F4188790](v35);
  uint64_t v264 = (uint64_t)&v236 - v38;
  uint64_t v39 = MEMORY[0x1F4188790](v37);
  v254 = (char *)&v236 - v40;
  uint64_t v41 = MEMORY[0x1F4188790](v39);
  uint64_t v265 = (uint64_t)&v236 - v42;
  uint64_t v43 = MEMORY[0x1F4188790](v41);
  uint64_t v255 = (uint64_t)&v236 - v44;
  uint64_t v45 = MEMORY[0x1F4188790](v43);
  v251 = (char *)&v236 - v46;
  uint64_t v47 = MEMORY[0x1F4188790](v45);
  uint64_t v268 = (uint64_t)&v236 - v48;
  uint64_t v49 = MEMORY[0x1F4188790](v47);
  v257 = (char *)&v236 - v50;
  MEMORY[0x1F4188790](v49);
  uint64_t v272 = (uint64_t)&v236 - v51;
  uint64_t active = (void *)type metadata accessor for ActiveSyncState(0);
  uint64_t v52 = *(active - 1);
  MEMORY[0x1F4188790](active);
  uint64_t v274 = (uint64_t)&v236 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2634D34(0, &qword_1EBB838F0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v281 = v54;
  MEMORY[0x1F4188790](v54);
  os_log_type_t v56 = (char *)&v236 - v55;
  sub_1C263583C(0, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  uint64_t v58 = MEMORY[0x1F4188790](v57 - 8);
  v250 = (id *)((char *)&v236 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v60 = MEMORY[0x1F4188790](v58);
  v239 = (id *)((char *)&v236 - v61);
  uint64_t v62 = MEMORY[0x1F4188790](v60);
  v241 = (id *)((char *)&v236 - v63);
  uint64_t v64 = MEMORY[0x1F4188790](v62);
  v249 = (id *)((char *)&v236 - v65);
  uint64_t v66 = MEMORY[0x1F4188790](v64);
  v260 = (id *)((char *)&v236 - v67);
  uint64_t v68 = MEMORY[0x1F4188790](v66);
  v263 = (id *)((char *)&v236 - v69);
  uint64_t v70 = MEMORY[0x1F4188790](v68);
  v267 = (id *)((char *)&v236 - v71);
  uint64_t v72 = MEMORY[0x1F4188790](v70);
  v273 = (id *)((char *)&v236 - v73);
  MEMORY[0x1F4188790](v72);
  uint64_t v75 = (char *)&v236 - v74;
  sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  uint64_t v77 = MEMORY[0x1F4188790](v76 - 8);
  id v79 = (char *)&v236 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = MEMORY[0x1F4188790](v77);
  uint64_t v82 = (char *)&v236 - v81;
  MEMORY[0x1F4188790](v80);
  uint64_t v84 = (char *)&v236 - v83;
  int v275 = *(unsigned __int8 *)v282;
  int v270 = *((unsigned __int8 *)v282 + 1);
  int v266 = *((unsigned __int8 *)v282 + 2);
  int v261 = *((unsigned __int8 *)v282 + 3);
  uint64_t v85 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  sub_1C2634C4C((uint64_t)v283 + *(int *)(v85 + 20), (uint64_t)v84, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1C2634C4C(v284, (uint64_t)v75, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  uint64_t v86 = *(void *)(v85 - 8);
  v282 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v86 + 48);
  uint64_t v279 = v86 + 48;
  int v87 = v282(v75, 1, v85);
  uint64_t v277 = v85;
  if (v87 == 1)
  {
    sub_1C2634CB8((uint64_t)v75, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    uint64_t v88 = active;
    (*(void (**)(char *, uint64_t, uint64_t, void *))(v52 + 56))(v82, 1, 1, active);
  }
  else
  {
    sub_1C2634C4C((uint64_t)&v75[*(int *)(v85 + 20)], (uint64_t)v82, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1C275A794((uint64_t)v75, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    uint64_t v88 = active;
  }
  uint64_t v89 = (uint64_t)&v56[v281[12]];
  sub_1C2634C4C((uint64_t)v84, (uint64_t)v56, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1C2634C4C((uint64_t)v82, v89, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  v90 = *(unsigned int (**)(uint64_t, uint64_t, void *))(v52 + 48);
  if (v90((uint64_t)v56, 1, v88) == 1)
  {
    sub_1C2634CB8((uint64_t)v82, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1C2634CB8((uint64_t)v84, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    if (v90(v89, 1, v88) == 1)
    {
      sub_1C2634CB8((uint64_t)v56, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
      goto LABEL_13;
    }
LABEL_9:
    uint64_t v91 = &qword_1EBB838F0;
    uint64_t v92 = &qword_1EBB83A98;
    uint64_t v93 = (void (*)(uint64_t))type metadata accessor for ActiveSyncState;
    uint64_t v94 = (uint64_t)v56;
LABEL_10:
    sub_1C275BDD8(v94, v91, v92, v93);
    return 1;
  }
  sub_1C2634C4C((uint64_t)v56, (uint64_t)v79, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if (v90(v89, 1, v88) == 1)
  {
    sub_1C2634CB8((uint64_t)v82, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1C2634CB8((uint64_t)v84, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    sub_1C275A794((uint64_t)v79, type metadata accessor for ActiveSyncState);
    goto LABEL_9;
  }
  uint64_t v96 = v274;
  sub_1C2759FA0(v89, v274, type metadata accessor for ActiveSyncState);
  char v97 = _s14HealthPlatform15ActiveSyncStateO2eeoiySbAC_ACtFZ_0((uint64_t)v79, v96);
  sub_1C275A794(v96, type metadata accessor for ActiveSyncState);
  sub_1C2634CB8((uint64_t)v82, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1C2634CB8((uint64_t)v84, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  sub_1C275A794((uint64_t)v79, type metadata accessor for ActiveSyncState);
  sub_1C2634CB8((uint64_t)v56, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if ((v97 & 1) == 0) {
    return 1;
  }
LABEL_13:
  uint64_t v98 = v283;
  uint64_t v99 = *v283;
  uint64_t v101 = v276;
  uint64_t v100 = v277;
  uint64_t v102 = v278;
  if (!*v283) {
    goto LABEL_20;
  }
  uint64_t v103 = v273;
  sub_1C2634C4C(v284, (uint64_t)v273, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v282((char *)v103, 1, v100) == 1)
  {
    sub_1C2634CB8((uint64_t)v103, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  }
  else
  {
    id v104 = *v103;
    id v105 = *v103;
    sub_1C275A794((uint64_t)v103, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    if (v104)
    {
      id v286 = v105;
      sub_1C2644ED8(0, &qword_1EBB82FD0);
      uint64_t v106 = sub_1C277C7D0();

      goto LABEL_19;
    }
  }
  uint64_t v106 = 0;
LABEL_19:
  unsigned __int8 v107 = objc_msgSend(v99, sel_isEqual_, v106);
  swift_unknownObjectRelease();
  if (v107) {
    return 0;
  }
LABEL_20:
  if (!v275) {
    goto LABEL_33;
  }
  if (*v98) {
    unsigned int v108 = objc_msgSend(*v98, sel_syncEnabled);
  }
  else {
    unsigned int v108 = 2;
  }
  uint64_t v109 = v267;
  sub_1C2634C4C(v284, (uint64_t)v267, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v282((char *)v109, 1, v100) == 1)
  {
    sub_1C2634CB8((uint64_t)v109, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  }
  else
  {
    id v110 = *v109;
    id v111 = *v109;
    sub_1C275A794((uint64_t)v109, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    if (v110)
    {
      unsigned int v112 = objc_msgSend(v111, sel_syncEnabled);

      if (v108 == 2) {
        goto LABEL_32;
      }
LABEL_28:
      if (v112 == 2 || (v112 == 0) == (v108 != 0)) {
        return 1;
      }
      goto LABEL_33;
    }
  }
  unsigned int v112 = 2;
  if (v108 != 2) {
    goto LABEL_28;
  }
LABEL_32:
  if (v112 != 2) {
    return 1;
  }
LABEL_33:
  if (!v270) {
    goto LABEL_54;
  }
  if (*v98)
  {
    id v113 = objc_msgSend(*v98, sel_restoreCompletionDate);
    if (v113)
    {
      uint64_t v114 = v113;
      uint64_t v115 = (uint64_t)v257;
      sub_1C277A810();

      v116 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56);
      v116(v115, 0, 1, v101);
    }
    else
    {
      v116 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56);
      uint64_t v115 = (uint64_t)v257;
      v116((uint64_t)v257, 1, 1, v101);
    }
    v117 = v263;
    sub_1C275BE34(v115, v272);
  }
  else
  {
    v116 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56);
    v116(v272, 1, 1, v101);
    v117 = v263;
  }
  sub_1C2634C4C(v284, (uint64_t)v117, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v282((char *)v117, 1, v100) == 1)
  {
    sub_1C2634CB8((uint64_t)v117, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
LABEL_45:
    uint64_t v125 = v268;
    v116(v268, 1, 1, v101);
    goto LABEL_48;
  }
  id v118 = *v117;
  id v119 = *v117;
  uint64_t v120 = (uint64_t)v117;
  id v121 = v119;
  sub_1C275A794(v120, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (!v118) {
    goto LABEL_45;
  }
  id v122 = objc_msgSend(v121, sel_restoreCompletionDate);

  if (v122)
  {
    uint64_t v123 = (uint64_t)v251;
    sub_1C277A810();

    uint64_t v124 = 0;
    uint64_t v125 = v268;
  }
  else
  {
    uint64_t v124 = 1;
    uint64_t v125 = v268;
    uint64_t v123 = (uint64_t)v251;
  }
  v116(v123, v124, 1, v101);
  sub_1C275BE34(v123, v125);
LABEL_48:
  uint64_t v126 = v101;
  uint64_t v127 = v272;
  uint64_t v128 = v269;
  uint64_t v129 = v269 + *(int *)(v271 + 48);
  v130 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1C2634C4C(v272, v269, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  v131 = v130;
  uint64_t v132 = v128;
  sub_1C2634C4C(v125, v129, (unint64_t *)&unk_1EBB84888, v131);
  v133 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v102 + 48);
  if (v133(v128, 1, v126) == 1)
  {
    v134 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    sub_1C2634CB8(v125, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    v135 = v134;
    uint64_t v132 = v269;
    sub_1C2634CB8(v127, (unint64_t *)&unk_1EBB84888, v135);
    if (v133(v129, 1, v126) == 1)
    {
      uint64_t v101 = v126;
      sub_1C2634CB8(v132, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
      uint64_t v98 = v283;
      goto LABEL_54;
    }
LABEL_95:
    uint64_t v91 = &qword_1EBB80D00;
    uint64_t v92 = (unint64_t *)&unk_1EBB84888;
    uint64_t v93 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    uint64_t v94 = v132;
    goto LABEL_10;
  }
  uint64_t v136 = v255;
  sub_1C2634C4C(v128, v255, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  if (v133(v129, 1, v126) == 1)
  {
    v137 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    sub_1C2634CB8(v268, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    sub_1C2634CB8(v272, (unint64_t *)&unk_1EBB84888, v137);
    (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v136, v126);
    goto LABEL_95;
  }
  v138 = v256;
  (*(void (**)(char *, uint64_t, uint64_t))(v102 + 32))(v256, v129, v126);
  sub_1C27537E0((unint64_t *)&unk_1EA305758, 255, MEMORY[0x1E4F27928]);
  char v139 = sub_1C277B810();
  v140 = *(void (**)(char *, uint64_t))(v102 + 8);
  v140(v138, v126);
  v141 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1C2634CB8(v268, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  sub_1C2634CB8(v272, (unint64_t *)&unk_1EBB84888, v141);
  uint64_t v142 = v136;
  uint64_t v101 = v126;
  v140((char *)v142, v126);
  sub_1C2634CB8(v128, (unint64_t *)&unk_1EBB84888, v141);
  uint64_t v98 = v283;
  if ((v139 & 1) == 0) {
    return 1;
  }
LABEL_54:
  if (!v266) {
    goto LABEL_120;
  }
  if (*v98)
  {
    id v143 = objc_msgSend(*v98, sel_lastPullDate);
    if (v143)
    {
      v144 = v143;
      uint64_t v145 = (uint64_t)v254;
      sub_1C277A810();

      v146 = *(int **)(v102 + 56);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v146)(v145, 0, 1, v101);
    }
    else
    {
      v146 = *(int **)(v102 + 56);
      uint64_t v145 = (uint64_t)v254;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v146)(v254, 1, 1, v101);
    }
    sub_1C275BE34(v145, v265);
  }
  else
  {
    v146 = *(int **)(v102 + 56);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v146)(v265, 1, 1, v101);
  }
  v147 = v260;
  sub_1C2634C4C(v284, (uint64_t)v260, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  int v148 = v282((char *)v147, 1, v100);
  v281 = v146;
  if (v148 == 1)
  {
    sub_1C2634CB8((uint64_t)v147, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    uint64_t v149 = (uint64_t)v259;
    uint64_t v150 = v265;
LABEL_66:
    uint64_t v158 = v264;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v146)(v264, 1, 1, v101);
    goto LABEL_69;
  }
  id v151 = *v147;
  id v152 = *v147;
  uint64_t v153 = (uint64_t)v147;
  id v154 = v152;
  sub_1C275A794(v153, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  uint64_t v149 = (uint64_t)v259;
  uint64_t v150 = v265;
  if (!v151) {
    goto LABEL_66;
  }
  id v155 = objc_msgSend(v154, sel_lastPullDate);

  if (v155)
  {
    uint64_t v156 = (uint64_t)v247;
    sub_1C277A810();

    uint64_t v157 = 0;
    uint64_t v158 = v264;
  }
  else
  {
    uint64_t v157 = 1;
    uint64_t v158 = v264;
    uint64_t v156 = (uint64_t)v247;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v146)(v156, v157, 1, v101);
  sub_1C275BE34(v156, v158);
LABEL_69:
  uint64_t v159 = v149 + *(int *)(v271 + 48);
  v160 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1C2634C4C(v150, v149, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  sub_1C2634C4C(v158, v159, (unint64_t *)&unk_1EBB84888, v160);
  v161 = *(void **)(v102 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v161)(v149, 1, v101) == 1)
  {
    uint64_t active = v161;
    v162 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    sub_1C2634CB8(v158, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    sub_1C2634CB8(v150, (unint64_t *)&unk_1EBB84888, v162);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))active)(v159, 1, v101) == 1)
    {
      sub_1C2634CB8(v149, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  uint64_t v163 = v252;
  sub_1C2634C4C(v149, v252, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v161)(v159, 1, v101) == 1)
  {
    v164 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    sub_1C2634CB8(v264, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    sub_1C2634CB8(v150, (unint64_t *)&unk_1EBB84888, v164);
    (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v163, v101);
LABEL_74:
    uint64_t v91 = &qword_1EBB80D00;
    uint64_t v92 = (unint64_t *)&unk_1EBB84888;
    uint64_t v93 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    uint64_t v94 = v149;
    goto LABEL_10;
  }
  uint64_t active = v161;
  v165 = v256;
  (*(void (**)(char *, uint64_t, uint64_t))(v102 + 32))(v256, v159, v101);
  sub_1C27537E0((unint64_t *)&unk_1EA305758, 255, MEMORY[0x1E4F27928]);
  int v275 = sub_1C277B810();
  v166 = *(void (**)(char *, uint64_t))(v102 + 8);
  v166(v165, v101);
  v167 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1C2634CB8(v264, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  sub_1C2634CB8(v150, (unint64_t *)&unk_1EBB84888, v167);
  v166((char *)v163, v101);
  uint64_t v98 = v283;
  sub_1C2634CB8(v149, (unint64_t *)&unk_1EBB84888, v167);
  if ((v275 & 1) == 0) {
    return 1;
  }
LABEL_76:
  if (*v98)
  {
    id v168 = objc_msgSend(*v98, sel_lastPushDate);
    uint64_t v169 = v278;
    uint64_t v170 = v262;
    v171 = v249;
    if (v168)
    {
      v172 = v168;
      uint64_t v173 = (uint64_t)v246;
      sub_1C277A810();

      uint64_t v174 = 0;
    }
    else
    {
      uint64_t v174 = 1;
      uint64_t v173 = (uint64_t)v246;
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v281)(v173, v174, 1, v101);
    sub_1C275BE34(v173, v258);
  }
  else
  {
    uint64_t v169 = v278;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v281)(v258, 1, 1, v101);
    uint64_t v170 = v262;
    v171 = v249;
  }
  sub_1C2634C4C(v284, (uint64_t)v171, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v282((char *)v171, 1, v277) == 1)
  {
    sub_1C2634CB8((uint64_t)v171, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
LABEL_87:
    uint64_t v180 = v253;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v281)(v253, 1, 1, v101);
    goto LABEL_90;
  }
  id v175 = *v171;
  id v176 = *v171;
  sub_1C275A794((uint64_t)v171, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (!v175) {
    goto LABEL_87;
  }
  id v177 = objc_msgSend(v176, sel_lastPushDate);

  if (v177)
  {
    uint64_t v178 = (uint64_t)v240;
    sub_1C277A810();

    uint64_t v179 = 0;
    uint64_t v180 = v253;
  }
  else
  {
    uint64_t v179 = 1;
    uint64_t v180 = v253;
    uint64_t v178 = (uint64_t)v240;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v281)(v178, v179, 1, v101);
  sub_1C275BE34(v178, v180);
LABEL_90:
  uint64_t v181 = v170 + *(int *)(v271 + 48);
  v182 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  uint64_t v183 = v258;
  sub_1C2634C4C(v258, v262, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  v184 = v182;
  uint64_t v132 = v262;
  sub_1C2634C4C(v180, v181, (unint64_t *)&unk_1EBB84888, v184);
  v185 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))active;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))active)(v132, 1, v101) == 1)
  {
    v186 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    sub_1C2634CB8(v180, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    v187 = v186;
    uint64_t v132 = v262;
    sub_1C2634CB8(v183, (unint64_t *)&unk_1EBB84888, v187);
    if (v185(v181, 1, v101) == 1)
    {
      sub_1C2634CB8(v132, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
      goto LABEL_97;
    }
    goto LABEL_95;
  }
  uint64_t v188 = v244;
  sub_1C2634C4C(v132, v244, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  if (v185(v181, 1, v101) == 1)
  {
    v189 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    sub_1C2634CB8(v253, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    sub_1C2634CB8(v258, (unint64_t *)&unk_1EBB84888, v189);
    (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v188, v101);
    goto LABEL_95;
  }
  uint64_t v190 = v132;
  v191 = v256;
  (*(void (**)(char *, uint64_t, uint64_t))(v169 + 32))(v256, v181, v101);
  sub_1C27537E0((unint64_t *)&unk_1EA305758, 255, MEMORY[0x1E4F27928]);
  char v192 = sub_1C277B810();
  v193 = *(void (**)(char *, uint64_t))(v169 + 8);
  v193(v191, v101);
  v194 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1C2634CB8(v253, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  sub_1C2634CB8(v258, (unint64_t *)&unk_1EBB84888, v194);
  v193((char *)v188, v101);
  uint64_t v98 = v283;
  sub_1C2634CB8(v190, (unint64_t *)&unk_1EBB84888, v194);
  if ((v192 & 1) == 0) {
    return 1;
  }
LABEL_97:
  if (*v98)
  {
    id v195 = objc_msgSend(*v98, sel_lastPulledUpdateDate);
    uint64_t v196 = (uint64_t)v242;
    v197 = v241;
    v198 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v281;
    if (v195)
    {
      v199 = v195;
      uint64_t v200 = (uint64_t)v238;
      sub_1C277A810();

      uint64_t v201 = 0;
    }
    else
    {
      uint64_t v201 = 1;
      uint64_t v200 = (uint64_t)v238;
    }
    v198(v200, v201, 1, v101);
    sub_1C275BE34(v200, v248);
  }
  else
  {
    v198 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v281;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v281)(v248, 1, 1, v101);
    uint64_t v196 = (uint64_t)v242;
    v197 = v241;
  }
  sub_1C2634C4C(v284, (uint64_t)v197, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v282((char *)v197, 1, v277) == 1)
  {
    sub_1C2634CB8((uint64_t)v197, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
LABEL_108:
    uint64_t v206 = v245;
    v198(v245, 1, 1, v101);
    goto LABEL_111;
  }
  id v202 = *v197;
  id v203 = *v197;
  sub_1C275A794((uint64_t)v197, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (!v202) {
    goto LABEL_108;
  }
  id v204 = objc_msgSend(v203, sel_lastPulledUpdateDate);

  if (v204)
  {
    sub_1C277A810();

    uint64_t v205 = 0;
  }
  else
  {
    uint64_t v205 = 1;
  }
  uint64_t v206 = v245;
  v198(v196, v205, 1, v101);
  sub_1C275BE34(v196, v206);
LABEL_111:
  uint64_t v207 = v243;
  uint64_t v208 = v243 + *(int *)(v271 + 48);
  v209 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  uint64_t v210 = v248;
  sub_1C2634C4C(v248, v243, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  sub_1C2634C4C(v206, v208, (unint64_t *)&unk_1EBB84888, v209);
  if (v185(v207, 1, v101) != 1)
  {
    uint64_t v212 = v237;
    sub_1C2634C4C(v207, v237, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    if (v185(v208, 1, v101) != 1)
    {
      uint64_t v214 = v278;
      uint64_t v215 = v207;
      uint64_t v216 = v212;
      v217 = v256;
      (*(void (**)(char *, uint64_t, uint64_t))(v278 + 32))(v256, v208, v101);
      sub_1C27537E0((unint64_t *)&unk_1EA305758, 255, MEMORY[0x1E4F27928]);
      char v218 = sub_1C277B810();
      v219 = *(void (**)(char *, uint64_t))(v214 + 8);
      v219(v217, v101);
      v220 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
      sub_1C2634CB8(v245, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
      sub_1C2634CB8(v248, (unint64_t *)&unk_1EBB84888, v220);
      v219((char *)v216, v101);
      sub_1C2634CB8(v215, (unint64_t *)&unk_1EBB84888, v220);
      if ((v218 & 1) == 0) {
        return 1;
      }
      goto LABEL_118;
    }
    v213 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    sub_1C2634CB8(v245, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
    sub_1C2634CB8(v248, (unint64_t *)&unk_1EBB84888, v213);
    (*(void (**)(uint64_t, uint64_t))(v278 + 8))(v212, v101);
    goto LABEL_116;
  }
  v211 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1C2634CB8(v206, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  sub_1C2634CB8(v210, (unint64_t *)&unk_1EBB84888, v211);
  if (v185(v208, 1, v101) != 1)
  {
LABEL_116:
    uint64_t v91 = &qword_1EBB80D00;
    uint64_t v92 = (unint64_t *)&unk_1EBB84888;
    uint64_t v93 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    uint64_t v94 = v207;
    goto LABEL_10;
  }
  sub_1C2634CB8(v207, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
LABEL_118:
  id v221 = *v98;
  uint64_t v100 = v277;
  if (*v98)
  {
    id v222 = objc_msgSend(*v98, sel_dataUploadRequestStatus);
    if (v222 != objc_msgSend(v221, sel_dataUploadRequestStatus)) {
      return 1;
    }
  }
LABEL_120:
  if (!v261) {
    return 0;
  }
  if (!*v98
    || (id v223 = objc_msgSend(*v98, sel_errorRequiringUserAction)) == 0
    || (id v286 = v223,
        sub_1C26532A4(),
        sub_1C2644ED8(0, (unint64_t *)&qword_1EBB854D0),
        (swift_dynamicCast() & 1) == 0))
  {
    v227 = v250;
    sub_1C2634C4C(v284, (uint64_t)v250, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    if (v282((char *)v227, 1, v100) == 1)
    {
      sub_1C2634CB8((uint64_t)v227, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    }
    else
    {
      id v228 = *v227;
      id v229 = *v227;
      sub_1C275A794((uint64_t)v227, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
      if (v228)
      {
        id v230 = objc_msgSend(v229, sel_errorRequiringUserAction);

        if (v230)
        {

          return 1;
        }
      }
    }
    return 0;
  }
  v224 = v285;
  uint64_t v225 = v100;
  v226 = v239;
  sub_1C2634C4C(v284, (uint64_t)v239, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (v282((char *)v226, 1, v225) == 1)
  {

    sub_1C2634CB8((uint64_t)v226, &qword_1EBB82908, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
    return 1;
  }
  id v231 = *v226;
  id v232 = *v226;
  sub_1C275A794((uint64_t)v226, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  if (!v231
    || (id v233 = objc_msgSend(v232, sel_errorRequiringUserAction),
        v232,
        !v233)
    || (id v286 = v233, (swift_dynamicCast() & 1) == 0))
  {

    return 1;
  }
  v234 = v285;
  unsigned __int8 v235 = objc_msgSend(v224, sel_isEqual_, v285);

  return (v235 & 1) == 0;
}

uint64_t CloudSyncStatusInputSignal.Anchor.merged(with:)@<X0>(uint64_t a1@<X8>)
{
  return sub_1C275FA88(v1, a1, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t CloudSyncStatusInputSignal.Anchor.identifier.getter()
{
  return sub_1C277AED0();
}

uint64_t sub_1C2758BD0()
{
  return 0x737574617473;
}

uint64_t sub_1C2758BE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x737574617473 && a2 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1C277C7E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1C2758C74(uint64_t a1)
{
  unint64_t v2 = sub_1C275BEB4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C2758CB0(uint64_t a1)
{
  unint64_t v2 = sub_1C275BEB4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t CloudSyncStatusInputSignal.Anchor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  sub_1C275BFD0(0, &qword_1EBB830F8, (uint64_t (*)(void))sub_1C275BEB4, (uint64_t)&type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys, MEMORY[0x1E4FBBDC0]);
  uint64_t v5 = v4;
  uint64_t v23 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v7 = (char *)&v20 - v6;
  uint64_t v8 = type metadata accessor for CloudSyncStatusInputSignal.Anchor(0);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v11 = (id *)((char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v11 = 0;
  uint64_t v12 = (char *)v11 + *(int *)(v9 + 28);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(active - 8) + 56))(v12, 1, 1, active);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C275BEB4();
  sub_1C277C9A0();
  if (!v2)
  {
    uint64_t v14 = v23;
    uint64_t v15 = v26;
    sub_1C275BF08();
    sub_1C275BF60();
    sub_1C277C6D0();
    unint64_t v16 = v25;
    if (v25 >> 60 == 15)
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v5);
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v18 = v24;
      uint64_t v22 = sub_1C2644ED8(0, &qword_1EBB86050);
      sub_1C2644ED8(0, &qword_1EBB82FD0);
      uint64_t v21 = v18;
      uint64_t v17 = sub_1C277BE10();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v5);
      sub_1C2641B58(v21, v16);
    }

    *uint64_t v11 = (id)v17;
    sub_1C275FA88((uint64_t)v11, v15, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1C275A794((uint64_t)v11, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t CloudSyncStatusInputSignal.Anchor.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  v20[2] = *(id *)MEMORY[0x1E4F143B8];
  sub_1C275BFD0(0, &qword_1EBB83108, (uint64_t (*)(void))sub_1C275BEB4, (uint64_t)&type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v20[-1] - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C275BEB4();
  sub_1C277C9B0();
  uint64_t v9 = *v2;
  if (v9)
  {
    uint64_t v10 = self;
    v20[0] = 0;
    id v11 = v9;
    id v12 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v11, 1, v20);
    id v13 = v20[0];
    if (v12)
    {
      uint64_t v14 = (void *)sub_1C277A780();
      unint64_t v16 = v15;

      v20[0] = v14;
      v20[1] = v16;
      sub_1C267AD9C();
      sub_1C277C760();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

      return sub_1C263CC84((uint64_t)v14, (unint64_t)v16);
    }
    uint64_t v18 = v13;
    sub_1C277A620();

    swift_willThrow();
  }
  else
  {
    sub_1C277C770();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1C27592BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1C275FA88(v1, a1, type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1C27592F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CloudSyncStatusInputSignal.Anchor.init(from:)(a1, a2);
}

uint64_t sub_1C275930C(void *a1)
{
  return CloudSyncStatusInputSignal.Anchor.encode(to:)(a1);
}

uint64_t CloudSyncStatusInputSignal.Configuration.identifier.getter()
{
  return sub_1C277AED0();
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeSyncEnabled.getter()
{
  return *v0;
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeSyncEnabled.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*CloudSyncStatusInputSignal.Configuration.observeSyncEnabled.modify())()
{
  return nullsub_1;
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeFirstRestore.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeFirstRestore.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*CloudSyncStatusInputSignal.Configuration.observeFirstRestore.modify())()
{
  return nullsub_1;
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeSyncDates.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeSyncDates.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*CloudSyncStatusInputSignal.Configuration.observeSyncDates.modify())()
{
  return nullsub_1;
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeErrorRequiringUserAction.getter()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t CloudSyncStatusInputSignal.Configuration.observeErrorRequiringUserAction.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 3) = result;
  return result;
}

uint64_t (*CloudSyncStatusInputSignal.Configuration.observeErrorRequiringUserAction.modify())()
{
  return nullsub_1;
}

HealthPlatform::CloudSyncStatusInputSignal::Configuration __swiftcall CloudSyncStatusInputSignal.Configuration.init(observeSyncEnabled:observeFirstRestore:observeSyncDates:observeErrorRequiringUserAction:)(Swift::Bool observeSyncEnabled, Swift::Bool observeFirstRestore, Swift::Bool observeSyncDates, Swift::Bool observeErrorRequiringUserAction)
{
  *uint64_t v4 = observeSyncEnabled;
  v4[1] = observeFirstRestore;
  v4[2] = observeSyncDates;
  v4[3] = observeErrorRequiringUserAction;
  result.observeSyncEnabled = observeSyncEnabled;
  return result;
}

uint64_t CloudSyncStatusInputSignal.Configuration.hash(into:)()
{
  return sub_1C277C8E0();
}

uint64_t CloudSyncStatusInputSignal.Configuration.hashValue.getter()
{
  return sub_1C277C910();
}

uint64_t sub_1C275950C()
{
  return sub_1C277C910();
}

uint64_t CloudSyncStatusInputSignal.identifier.getter()
{
  return sub_1C277AED0();
}

uint64_t CloudSyncStatusInputSignal.observer.getter()
{
  return swift_unknownObjectRetain();
}

void CloudSyncStatusInputSignal.beginObservation(from:configurations:)()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  uint64_t v2 = v1 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v1 + 16);
  uint64_t v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(void *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_1C275C038(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_1C2759688(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a1 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.State(0) + 24));
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  uint64_t v6 = v3[3];
  uint64_t v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 8))(a2, v6, v7);
}

Swift::Void __swiftcall CloudSyncStatusInputSignal.stopObservation()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  uint64_t v2 = v1 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v1 + 16);
  uint64_t v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(void *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_1C27597E8(v2);

  os_unfair_lock_unlock(v3);
}

uint64_t sub_1C27597E8(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + *(int *)(type metadata accessor for CloudSyncStatusInputSignal.State(0) + 24));
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
}

id CloudSyncStatusInputSignal.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void CloudSyncStatusInputSignal.init()()
{
}

id CloudSyncStatusInputSignal.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C275996C()
{
  return swift_unknownObjectRetain();
}

void sub_1C27599A4()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  uint64_t v2 = v1 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v1 + 16);
  uint64_t v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(void *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_1C275FB54(v2);
  os_unfair_lock_unlock(v3);
}

void sub_1C2759A50()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState);
  uint64_t v2 = v1 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v1 + 16);
  uint64_t v3 = (os_unfair_lock_s *)(v1 + ((*(unsigned int *)(*(void *)v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_1C27597E8(v2);

  os_unfair_lock_unlock(v3);
}

uint64_t _s14HealthPlatform15ActiveSyncStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SyncError(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C275FAF0();
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_1C275FA88(a1, (uint64_t)v14, type metadata accessor for ActiveSyncState);
  sub_1C275FA88(a2, v15, type metadata accessor for ActiveSyncState);
  unint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v17 = v16(v14, 2, v4);
  if (!v17)
  {
    sub_1C275FA88((uint64_t)v14, (uint64_t)v10, type metadata accessor for ActiveSyncState);
    if (!v16((char *)v15, 2, v4))
    {
      sub_1C2759FA0(v15, (uint64_t)v7, type metadata accessor for SyncError);
      sub_1C2644ED8(0, (unint64_t *)&qword_1EBB854D0);
      sub_1C275346C((unint64_t *)&unk_1EA305678);
      char v21 = sub_1C277B710();
      sub_1C275A794((uint64_t)v7, type metadata accessor for SyncError);
      sub_1C275A794((uint64_t)v10, type metadata accessor for SyncError);
      uint64_t v19 = type metadata accessor for ActiveSyncState;
      goto LABEL_11;
    }
    sub_1C275A794((uint64_t)v10, type metadata accessor for SyncError);
    goto LABEL_9;
  }
  if (v17 == 1)
  {
    int v18 = v16((char *)v15, 2, v4);
    uint64_t v19 = type metadata accessor for ActiveSyncState;
    if (v18 == 1) {
      goto LABEL_8;
    }
LABEL_9:
    char v21 = 0;
    uint64_t v19 = (uint64_t (*)(void))sub_1C275FAF0;
    goto LABEL_11;
  }
  int v20 = v16((char *)v15, 2, v4);
  uint64_t v19 = type metadata accessor for ActiveSyncState;
  if (v20 != 2) {
    goto LABEL_9;
  }
LABEL_8:
  char v21 = 1;
LABEL_11:
  sub_1C275A794((uint64_t)v14, v19);
  return v21 & 1;
}

unint64_t sub_1C2759E50()
{
  unint64_t result = qword_1EA3056C8;
  if (!qword_1EA3056C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3056C8);
  }
  return result;
}

unint64_t sub_1C2759EA4()
{
  unint64_t result = qword_1EA3056D8;
  if (!qword_1EA3056D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3056D8);
  }
  return result;
}

unint64_t sub_1C2759EF8()
{
  unint64_t result = qword_1EA3056E8;
  if (!qword_1EA3056E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3056E8);
  }
  return result;
}

unint64_t sub_1C2759F4C()
{
  unint64_t result = qword_1EA3056F8;
  if (!qword_1EA3056F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3056F8);
  }
  return result;
}

uint64_t sub_1C2759FA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for CloudSyncStatusInputSignal.ObserverShim()
{
  return self;
}

BOOL _s14HealthPlatform26CloudSyncStatusInputSignalC13ConfigurationV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a1[1] ^ a2[1] | a1[2] ^ a2[2] | a2[3] ^ a1[3]) & 1) == 0;
}

uint64_t sub_1C275A074(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6572676F72506E69 && a2 == 0xEA00000000007373;
  if (v2 || (sub_1C277C7E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574656C706D6F63 && a2 == 0xE900000000000064 || (sub_1C277C7E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1C277C7E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

id sub_1C275A1DC(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = type metadata accessor for CloudSyncStatusInputSignal.State(0);
  uint64_t v10 = v9 - 8;
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (uint64_t *)((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  void v22[3] = type metadata accessor for CloudSyncStatusInputSignal.ObserverShim();
  v22[4] = &off_1F1DCFFE8;
  v22[0] = a3;
  uint64_t v13 = &a4[OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_observer];
  *(void *)uint64_t v13 = a1;
  *((void *)v13 + 1) = a2;
  uint64_t v14 = (char *)v12 + *(int *)(v10 + 28);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(active - 8) + 56))(v14, 1, 1, active);
  sub_1C26482E4((uint64_t)v22, (uint64_t)v12 + *(int *)(v10 + 32));
  *uint64_t v12 = 0;
  sub_1C275FA20();
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + ((*(unsigned int *)(*(void *)v16 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1C275FA88((uint64_t)v12, v16 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v16 + 16), type metadata accessor for CloudSyncStatusInputSignal.State);
  int v17 = a4;
  swift_unknownObjectRetain();
  sub_1C275A794((uint64_t)v12, type metadata accessor for CloudSyncStatusInputSignal.State);
  *(void *)&v17[OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState] = v16;

  v21.receiver = v17;
  v21.super_class = ObjectType;
  id v18 = objc_msgSendSuper2(&v21, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  return v18;
}

id sub_1C275A410(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v13 = type metadata accessor for CloudSyncStatusInputSignal.State(0);
  uint64_t v14 = v13 - 8;
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (uint64_t *)((char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v27[3] = a5;
  void v27[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v27);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(boxed_opaque_existential_1, a3, a5);
  id v18 = &a4[OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_observer];
  *(void *)id v18 = a1;
  *((void *)v18 + 1) = a2;
  uint64_t v19 = (char *)v16 + *(int *)(v14 + 28);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(active - 8) + 56))(v19, 1, 1, active);
  sub_1C26482E4((uint64_t)v27, (uint64_t)v16 + *(int *)(v14 + 32));
  *uint64_t v16 = 0;
  sub_1C275FA20();
  uint64_t v21 = swift_allocObject();
  *(_DWORD *)(v21 + ((*(unsigned int *)(*(void *)v21 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1C275FA88((uint64_t)v16, v21 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v21 + 16), type metadata accessor for CloudSyncStatusInputSignal.State);
  uint64_t v22 = a4;
  swift_unknownObjectRetain();
  sub_1C275A794((uint64_t)v16, type metadata accessor for CloudSyncStatusInputSignal.State);
  *(void *)&v22[OBJC_IVAR____TtC14HealthPlatform26CloudSyncStatusInputSignal_protectedState] = v21;

  v26.receiver = v22;
  v26.super_class = ObjectType;
  id v23 = objc_msgSendSuper2(&v26, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
  return v23;
}

id sub_1C275A67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (char *)objc_allocWithZone(v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a3, a5);
  return sub_1C275A410(a1, a2, (uint64_t)v13, v15, a5, a6);
}

uint64_t sub_1C275A778@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return sub_1C27559C4(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_1C275A794(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C275A7F4(uint64_t a1, uint64_t a2)
{
  sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C275A874@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return sub_1C2755D48(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_1C275A890(void *a1)
{
  swift_getObjectType();
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBB82A50 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1C277B130();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBB82A38);
  id v6 = a1;
  uint64_t v7 = sub_1C277B100();
  os_log_type_t v8 = sub_1C277BD40();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v23 = v21;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v10 = sub_1C277C9E0();
    uint64_t v22 = sub_1C263FDFC(v10, v11, &v23);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v20 = v9 + 14;
    id v12 = v6;
    id v13 = objc_msgSend(v12, sel_description);
    uint64_t v14 = sub_1C277B850();
    unint64_t v16 = v15;

    uint64_t v22 = sub_1C263FDFC(v14, v16, &v23);
    sub_1C277C0D0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v7, v8, "[%s] cloudSyncObserver syncDidStartWith progress:%s", (uint8_t *)v9, 0x16u);
    uint64_t v17 = v21;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v17, -1, -1);
    MEMORY[0x1C875D230](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v18 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v4, 1, 2, v18);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v4);
  return sub_1C275A794((uint64_t)v4, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1C275AB78(void *a1)
{
  swift_getObjectType();
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBB82A50 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1C277B130();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBB82A38);
  id v6 = a1;
  id v7 = a1;
  os_log_type_t v8 = sub_1C277B100();
  os_log_type_t v9 = sub_1C277BD40();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v12 = sub_1C277C9E0();
    uint64_t v21 = sub_1C263FDFC(v12, v13, &v22);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v21 = (uint64_t)a1;
    id v14 = a1;
    sub_1C263583C(0, (unint64_t *)&qword_1EA305660, (void (*)(uint64_t))sub_1C26532A4);
    uint64_t v15 = sub_1C277B860();
    uint64_t v21 = sub_1C263FDFC(v15, v16, &v22);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C2601000, v8, v9, "[%s] cloudSyncObserver syncFailed with error: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v11, -1, -1);
    MEMORY[0x1C875D230](v10, -1, -1);
  }
  else
  {
  }
  id v17 = a1;
  if (!a1) {
    id v17 = objc_msgSend(self, sel_hk_error_userInfo_, 0, 0);
  }
  id v18 = a1;
  sub_1C277A610();
  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB854D0);
  sub_1C277B730();
  uint64_t v19 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v4, 0, 2, v19);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v4);

  return sub_1C275A794((uint64_t)v4, type metadata accessor for ActiveSyncState);
}

uint64_t _s14HealthPlatform26CloudSyncStatusInputSignalC05cloudd8ObserverD9CompletedyySo07HKClouddI0CF_0()
{
  swift_getObjectType();
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBB82A50 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C277B130();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBB82A38);
  uint64_t v4 = sub_1C277B100();
  os_log_type_t v5 = sub_1C277BD40();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = v7;
    *(_DWORD *)id v6 = 136315138;
    uint64_t v8 = sub_1C277C9E0();
    uint64_t v12 = sub_1C263FDFC(v8, v9, &v13);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v4, v5, "[%s] cloudSyncObserverSyncCompleted", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v7, -1, -1);
    MEMORY[0x1C875D230](v6, -1, -1);
  }

  uint64_t v10 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 2, 2, v10);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v2);
  return sub_1C275A794((uint64_t)v2, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1C275B118(void *a1)
{
  swift_getObjectType();
  if (qword_1EBB82A50 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C277B130();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBB82A38);
  id v3 = a1;
  uint64_t v4 = sub_1C277B100();
  os_log_type_t v5 = sub_1C277BD40();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = v15;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v7 = sub_1C277C9E0();
    sub_1C263FDFC(v7, v8, &v16);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    id v9 = v3;
    id v10 = objc_msgSend(v9, sel_description);
    uint64_t v11 = sub_1C277B850();
    unint64_t v13 = v12;

    sub_1C263FDFC(v11, v13, &v16);
    sub_1C277C0D0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v4, v5, "[%s] cloudSyncObserverStatusUpdated with status: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v15, -1, -1);
    MEMORY[0x1C875D230](v6, -1, -1);
  }
  else
  {
  }
  return CloudSyncStatusInputSignal.didUpdate(status:)((uint64_t)v3);
}

uint64_t sub_1C275B360(void *a1, void *a2)
{
  uint64_t v3 = v2;
  swift_getObjectType();
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBB82A50 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C277B130();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBB82A38);
  id v10 = a1;
  id v11 = a2;
  id v12 = v10;
  id v13 = v11;
  id v14 = sub_1C277B100();
  os_log_type_t v15 = sub_1C277BD40();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v39 = v36;
    *(_DWORD *)uint64_t v17 = 136315650;
    uint64_t v18 = sub_1C277C9E0();
    int v35 = v16;
    uint64_t v38 = sub_1C263FDFC(v18, v19, &v39);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    id v20 = objc_msgSend(v12, sel_description);
    uint64_t v21 = sub_1C277B850();
    uint64_t v37 = v3;
    unint64_t v23 = v22;

    uint64_t v38 = sub_1C263FDFC(v21, v23, &v39);
    sub_1C277C0D0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    id v24 = v13;
    id v25 = objc_msgSend(v24, sel_description);
    uint64_t v26 = sub_1C277B850();
    unint64_t v28 = v27;

    uint64_t v38 = sub_1C263FDFC(v26, v28, &v39);
    sub_1C277C0D0();

    swift_bridgeObjectRelease();
    uint64_t v29 = v36;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v29, -1, -1);
    MEMORY[0x1C875D230](v17, -1, -1);
  }
  else
  {
  }
  unsigned int v30 = objc_msgSend(v13, sel_isFinished);
  uint64_t v31 = type metadata accessor for SyncError(0);
  if (v30) {
    uint64_t v32 = 2;
  }
  else {
    uint64_t v32 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v8, v32, 2, v31);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v8);
  return sub_1C275A794((uint64_t)v8, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1C275B6F4(void *a1, void *a2)
{
  uint64_t v3 = v2;
  swift_getObjectType();
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  unint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBB82A50 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C277B130();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBB82A38);
  id v10 = a1;
  id v11 = a2;
  id v12 = v10;
  id v13 = a2;
  id v14 = sub_1C277B100();
  os_log_type_t v15 = sub_1C277BD40();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v37 = v34;
    *(_DWORD *)uint64_t v17 = 136315650;
    uint64_t v18 = sub_1C277C9E0();
    uint64_t v36 = sub_1C263FDFC(v18, v19, &v37);
    int v33 = v16;
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    id v20 = objc_msgSend(v12, sel_description);
    uint64_t v21 = sub_1C277B850();
    uint64_t v35 = v3;
    unint64_t v23 = v22;

    uint64_t v36 = sub_1C263FDFC(v21, v23, &v37);
    sub_1C277C0D0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    uint64_t v36 = (uint64_t)a2;
    id v24 = a2;
    sub_1C263583C(0, (unint64_t *)&qword_1EA305660, (void (*)(uint64_t))sub_1C26532A4);
    uint64_t v25 = sub_1C277B860();
    uint64_t v36 = sub_1C263FDFC(v25, v26, &v37);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();

    uint64_t v27 = v34;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v27, -1, -1);
    MEMORY[0x1C875D230](v17, -1, -1);
  }
  else
  {
  }
  id v28 = a2;
  if (!a2) {
    id v28 = objc_msgSend(self, sel_hk_error_userInfo_, 0, 0);
  }
  id v29 = a2;
  sub_1C277A610();
  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB854D0);
  sub_1C277B730();
  uint64_t v30 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v8, 0, 2, v30);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v8);

  return sub_1C275A794((uint64_t)v8, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1C275BAF8(void *a1)
{
  swift_getObjectType();
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  MEMORY[0x1F4188790](active - 8);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBB82A50 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1C277B130();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBB82A38);
  id v6 = a1;
  uint64_t v7 = sub_1C277B100();
  os_log_type_t v8 = sub_1C277BD40();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v22 = v20;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v10 = sub_1C277C9E0();
    uint64_t v21 = sub_1C263FDFC(v10, v11, &v22);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    id v12 = objc_msgSend(v6, sel_description, v9 + 14);
    uint64_t v13 = sub_1C277B850();
    unint64_t v15 = v14;

    uint64_t v21 = sub_1C263FDFC(v13, v15, &v22);
    sub_1C277C0D0();

    swift_bridgeObjectRelease();
    uint64_t v16 = v20;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v16, -1, -1);
    MEMORY[0x1C875D230](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v17 = type metadata accessor for SyncError(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 2, 2, v17);
  CloudSyncStatusInputSignal.didUpdate(activeSyncState:)((uint64_t)v4);
  return sub_1C275A794((uint64_t)v4, type metadata accessor for ActiveSyncState);
}

uint64_t sub_1C275BDD8(uint64_t a1, unint64_t *a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1C2634D34(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_1C275BE34(uint64_t a1, uint64_t a2)
{
  sub_1C263583C(0, (unint64_t *)&unk_1EBB84888, MEMORY[0x1E4F27928]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C275BEB4()
{
  unint64_t result = qword_1EBB828B0;
  if (!qword_1EBB828B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB828B0);
  }
  return result;
}

void sub_1C275BF08()
{
  if (!qword_1EBB82638)
  {
    unint64_t v0 = sub_1C277C0B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB82638);
    }
  }
}

unint64_t sub_1C275BF60()
{
  unint64_t result = qword_1EBB82640;
  if (!qword_1EBB82640)
  {
    sub_1C275BF08();
    sub_1C267AC18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB82640);
  }
  return result;
}

void sub_1C275BFD0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

uint64_t sub_1C275C038(uint64_t a1)
{
  return sub_1C2759688(a1, *(void *)(v1 + 16));
}

uint64_t sub_1C275C054()
{
  return sub_1C27537E0(&qword_1EA305768, 255, (void (*)(uint64_t))type metadata accessor for SyncError);
}

uint64_t sub_1C275C0A0()
{
  return sub_1C27537E0((unint64_t *)&unk_1EA305770, 255, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
}

uint64_t sub_1C275C0EC()
{
  return sub_1C27537E0((unint64_t *)&unk_1EBB828F8, 255, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1C275C138()
{
  return sub_1C27537E0(&qword_1EBB828E0, 255, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t sub_1C275C184()
{
  return sub_1C27537E0((unint64_t *)&unk_1EBB828E8, 255, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

unint64_t sub_1C275C1D4()
{
  unint64_t result = qword_1EA305780;
  if (!qword_1EA305780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305780);
  }
  return result;
}

unint64_t sub_1C275C22C()
{
  unint64_t result = qword_1EBB82888;
  if (!qword_1EBB82888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB82888);
  }
  return result;
}

unint64_t sub_1C275C284()
{
  unint64_t result = qword_1EBB82890;
  if (!qword_1EBB82890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB82890);
  }
  return result;
}

uint64_t sub_1C275C2D8(uint64_t a1, uint64_t a2)
{
  return sub_1C27537E0(&qword_1EBB83B88, a2, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal);
}

uint64_t sub_1C275C320()
{
  return sub_1C27537E0((unint64_t *)&unk_1EBB828D0, 255, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal.Anchor);
}

uint64_t dispatch thunk of CloudSyncStatusObserverShim.startObserving(delegate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of CloudSyncStatusObserverShim.stopObserving()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t initializeBufferWithCopyOfBuffer for SyncError(uint64_t a1, uint64_t a2)
{
  sub_1C2635734();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for SyncError(uint64_t a1)
{
  sub_1C2635734();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for SyncError(uint64_t a1, uint64_t a2)
{
  sub_1C2635734();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SyncError(uint64_t a1, uint64_t a2)
{
  sub_1C2635734();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SyncError(uint64_t a1, uint64_t a2)
{
  sub_1C2635734();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SyncError(uint64_t a1, uint64_t a2)
{
  sub_1C2635734();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1C275C5F4(uint64_t a1, uint64_t a2)
{
  sub_1C2635734();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SyncError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C275C674);
}

uint64_t sub_1C275C674(uint64_t a1, uint64_t a2)
{
  sub_1C2635734();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_1C275C6E4()
{
  sub_1C2635734();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ActiveSyncState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = type metadata accessor for SyncError(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      sub_1C2635734();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t destroy for ActiveSyncState(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SyncError(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 2, v2);
  if (!result)
  {
    sub_1C2635734();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *initializeWithCopy for ActiveSyncState(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SyncError(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    sub_1C2635734();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *assignWithCopy for ActiveSyncState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SyncError(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      sub_1C2635734();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_1C275A794((uint64_t)a1, type metadata accessor for SyncError);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  sub_1C2635734();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

void *initializeWithTake for ActiveSyncState(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SyncError(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    sub_1C2635734();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *assignWithTake for ActiveSyncState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SyncError(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      sub_1C2635734();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_1C275A794((uint64_t)a1, type metadata accessor for SyncError);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  sub_1C2635734();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t sub_1C275CF48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SyncError(0);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ActiveSyncState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C275CFC8);
}

uint64_t sub_1C275CFC8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for SyncError(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_1C275D04C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SyncError(0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 2, v2);
}

uint64_t sub_1C275D0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SyncError(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 2, v4);
}

void sub_1C275D124()
{
  sub_1C2635734();
  if (v0 <= 0x3F) {
    swift_initEnumMetadataSinglePayload();
  }
}

uint64_t method lookup function for CloudSyncStatusInputSignal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CloudSyncStatusInputSignal);
}

uint64_t dispatch thunk of CloudSyncStatusInputSignal.__allocating_init(observer:shim:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void **initializeWithCopy for CloudSyncStatusInputSignal.Anchor(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v9 = *(void *)(active - 8);
  int v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  id v11 = v4;
  if (v10(v7, 1, active))
  {
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    memcpy(v6, v7, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = type metadata accessor for SyncError(0);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 2, v13))
    {
      memcpy(v6, v7, *(void *)(v9 + 64));
    }
    else
    {
      sub_1C2635734();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v6, v7, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v6, 0, 2, v13);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, active);
  }
  return a1;
}

void **assignWithCopy for CloudSyncStatusInputSignal.Anchor(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  id v8 = v7;

  uint64_t v9 = *(int *)(a3 + 20);
  int v10 = (char *)a1 + v9;
  id v11 = (char *)a2 + v9;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v13 = *(void *)(active - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, active);
  int v16 = v14(v11, 1, active);
  if (!v15)
  {
    if (!v16)
    {
      uint64_t v21 = type metadata accessor for SyncError(0);
      uint64_t v22 = *(void *)(v21 - 8);
      unint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
      int v24 = v23(v10, 2, v21);
      int v25 = v23(v11, 2, v21);
      if (v24)
      {
        if (!v25)
        {
          sub_1C2635734();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v10, v11, v26);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v10, 0, 2, v21);
          return a1;
        }
      }
      else
      {
        if (!v25)
        {
          sub_1C2635734();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 24))(v10, v11, v29);
          return a1;
        }
        sub_1C275A794((uint64_t)v10, type metadata accessor for SyncError);
      }
      size_t v20 = *(void *)(v13 + 64);
      goto LABEL_8;
    }
    sub_1C275A794((uint64_t)v10, type metadata accessor for ActiveSyncState);
LABEL_7:
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    size_t v20 = *(void *)(*(void *)(v19 - 8) + 64);
LABEL_8:
    memcpy(v10, v11, v20);
    return a1;
  }
  if (v16) {
    goto LABEL_7;
  }
  uint64_t v17 = type metadata accessor for SyncError(0);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 2, v17))
  {
    memcpy(v10, v11, *(void *)(v13 + 64));
  }
  else
  {
    sub_1C2635734();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v10, v11, v27);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 2, v17);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, active);
  return a1;
}

void *initializeWithTake for CloudSyncStatusInputSignal.Anchor(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v8 = *(void *)(active - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, active))
  {
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    uint64_t v10 = type metadata accessor for SyncError(0);
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 2, v10))
    {
      memcpy(v5, v6, *(void *)(v8 + 64));
    }
    else
    {
      sub_1C2635734();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v5, v6, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v5, 0, 2, v10);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, active);
  }
  return a1;
}

void **assignWithTake for CloudSyncStatusInputSignal.Anchor(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v11 = *(void *)(active - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, active);
  int v14 = v12(v9, 1, active);
  if (!v13)
  {
    if (!v14)
    {
      uint64_t v19 = type metadata accessor for SyncError(0);
      uint64_t v20 = *(void *)(v19 - 8);
      uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
      int v22 = v21(v8, 2, v19);
      int v23 = v21(v9, 2, v19);
      if (v22)
      {
        if (!v23)
        {
          sub_1C2635734();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v8, v9, v24);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v8, 0, 2, v19);
          return a1;
        }
      }
      else
      {
        if (!v23)
        {
          sub_1C2635734();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 40))(v8, v9, v27);
          return a1;
        }
        sub_1C275A794((uint64_t)v8, type metadata accessor for SyncError);
      }
      size_t v18 = *(void *)(v11 + 64);
      goto LABEL_8;
    }
    sub_1C275A794((uint64_t)v8, type metadata accessor for ActiveSyncState);
LABEL_7:
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    size_t v18 = *(void *)(*(void *)(v17 - 8) + 64);
LABEL_8:
    memcpy(v8, v9, v18);
    return a1;
  }
  if (v14) {
    goto LABEL_7;
  }
  uint64_t v15 = type metadata accessor for SyncError(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 2, v15))
  {
    memcpy(v8, v9, *(void *)(v11 + 64));
  }
  else
  {
    sub_1C2635734();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v8, v9, v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v8, 0, 2, v15);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, active);
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudSyncStatusInputSignal.Anchor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C275DD14);
}

uint64_t sub_1C275DD14(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

void *sub_1C275DDEC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1C275DEB0()
{
  sub_1C263583C(319, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for CloudSyncStatusInputSignal.Configuration(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[4]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudSyncStatusInputSignal.Configuration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudSyncStatusInputSignal.Configuration()
{
  return &type metadata for CloudSyncStatusInputSignal.Configuration;
}

void **sub_1C275E008(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  BOOL v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t active = type metadata accessor for ActiveSyncState(0);
    uint64_t v12 = *(void *)(active - 8);
    int v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    int v14 = v4;
    if (v13(v10, 1, active))
    {
      sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
      memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v16 = type metadata accessor for SyncError(0);
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 2, v16))
      {
        memcpy(v9, v10, *(void *)(v12 + 64));
      }
      else
      {
        sub_1C2635734();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v9, v10, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 2, v16);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, active);
    }
    uint64_t v19 = *(int *)(a3 + 24);
    long long v20 = *(_OWORD *)((char *)a2 + v19 + 24);
    *(_OWORD *)((char *)v7 + v19 + 24) = v20;
    (**(void (***)(void))(v20 - 8))();
  }
  return v7;
}

uint64_t sub_1C275E2B0(id *a1, uint64_t a2)
{
  BOOL v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(active - 8) + 48))(v4, 1, active))
  {
    uint64_t v6 = type metadata accessor for SyncError(0);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v4, 2, v6))
    {
      sub_1C2635734();
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v4, v7);
    }
  }
  uint64_t v8 = (uint64_t)a1 + *(int *)(a2 + 24);

  return __swift_destroy_boxed_opaque_existential_0(v8);
}

void **sub_1C275E3BC(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v11 = *(void *)(active - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  id v13 = v6;
  if (v12(v9, 1, active))
  {
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v15 = type metadata accessor for SyncError(0);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 2, v15))
    {
      memcpy(v8, v9, *(void *)(v11 + 64));
    }
    else
    {
      sub_1C2635734();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v8, v9, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v8, 0, 2, v15);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, active);
  }
  uint64_t v18 = *(int *)(a3 + 24);
  long long v19 = *(_OWORD *)((char *)a2 + v18 + 24);
  *(_OWORD *)((char *)a1 + v18 + 24) = v19;
  (**(void (***)(void))(v19 - 8))();
  return a1;
}

void **sub_1C275E604(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  id v8 = v7;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v13 = *(void *)(active - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, active);
  int v16 = v14(v11, 1, active);
  if (!v15)
  {
    if (!v16)
    {
      uint64_t v21 = type metadata accessor for SyncError(0);
      uint64_t v29 = *(void *)(v21 - 8);
      int v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
      int v23 = v22(v10, 2, v21);
      int v24 = v22(v11, 2, v21);
      if (v23)
      {
        if (!v24)
        {
          sub_1C2635734();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v10, v11, v25);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v10, 0, 2, v21);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v24)
        {
          sub_1C2635734();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 24))(v10, v11, v28);
          goto LABEL_14;
        }
        sub_1C275A794((uint64_t)v10, type metadata accessor for SyncError);
      }
      size_t v20 = *(void *)(v13 + 64);
      goto LABEL_8;
    }
    sub_1C275A794((uint64_t)v10, type metadata accessor for ActiveSyncState);
LABEL_7:
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    size_t v20 = *(void *)(*(void *)(v19 - 8) + 64);
LABEL_8:
    memcpy(v10, v11, v20);
    goto LABEL_14;
  }
  if (v16) {
    goto LABEL_7;
  }
  uint64_t v17 = type metadata accessor for SyncError(0);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 2, v17))
  {
    memcpy(v10, v11, *(void *)(v13 + 64));
  }
  else
  {
    sub_1C2635734();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v10, v11, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 2, v17);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, active);
LABEL_14:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + *(int *)(a3 + 24)), (uint64_t *)((char *)a2 + *(int *)(a3 + 24)));
  return a1;
}

void *sub_1C275E9C8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v10 = *(void *)(active - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, active))
  {
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    uint64_t v12 = type metadata accessor for SyncError(0);
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 2, v12))
    {
      memcpy(v7, v8, *(void *)(v10 + 64));
    }
    else
    {
      sub_1C2635734();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v7, v8, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v7, 0, 2, v12);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, active);
  }
  uint64_t v15 = *(int *)(a3 + 24);
  int v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  long long v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)int v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  *((void *)v16 + 4) = *((void *)v17 + 4);
  return a1;
}

void **sub_1C275EBE8(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t active = type metadata accessor for ActiveSyncState(0);
  uint64_t v11 = *(void *)(active - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, active);
  int v14 = v12(v9, 1, active);
  if (!v13)
  {
    if (!v14)
    {
      uint64_t v19 = type metadata accessor for SyncError(0);
      uint64_t v31 = *(void *)(v19 - 8);
      size_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48);
      int v21 = v20(v8, 2, v19);
      int v22 = v20(v9, 2, v19);
      if (v21)
      {
        if (!v22)
        {
          sub_1C2635734();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v8, v9, v23);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v8, 0, 2, v19);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v22)
        {
          sub_1C2635734();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 40))(v8, v9, v30);
          goto LABEL_14;
        }
        sub_1C275A794((uint64_t)v8, type metadata accessor for SyncError);
      }
      size_t v18 = *(void *)(v11 + 64);
      goto LABEL_8;
    }
    sub_1C275A794((uint64_t)v8, type metadata accessor for ActiveSyncState);
LABEL_7:
    sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
    size_t v18 = *(void *)(*(void *)(v17 - 8) + 64);
LABEL_8:
    memcpy(v8, v9, v18);
    goto LABEL_14;
  }
  if (v14) {
    goto LABEL_7;
  }
  uint64_t v15 = type metadata accessor for SyncError(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 2, v15))
  {
    memcpy(v8, v9, *(void *)(v11 + 64));
  }
  else
  {
    sub_1C2635734();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v8, v9, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v8, 0, 2, v15);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, active);
LABEL_14:
  uint64_t v25 = *(int *)(a3 + 24);
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1 + v25);
  long long v28 = *((_OWORD *)v27 + 1);
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  *((_OWORD *)v26 + 1) = v28;
  *((void *)v26 + 4) = *((void *)v27 + 4);
  return a1;
}

uint64_t sub_1C275EFBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C275EFD0);
}

uint64_t sub_1C275EFD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 24);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_1C275F0B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C275F0C8);
}

void sub_1C275F0C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1C263583C(0, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
  }
}

uint64_t type metadata accessor for CloudSyncStatusInputSignal.State(uint64_t a1)
{
  return sub_1C2635628(a1, qword_1EBB82898);
}

void sub_1C275F1C8()
{
  sub_1C263583C(319, &qword_1EBB83A98, (void (*)(uint64_t))type metadata accessor for ActiveSyncState);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for CloudSyncStatusInputSignal.Anchor.CodingKeys()
{
  return &type metadata for CloudSyncStatusInputSignal.Anchor.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ActiveSyncState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x1C275F364);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActiveSyncState.CodingKeys()
{
  return &type metadata for ActiveSyncState.CodingKeys;
}

ValueMetadata *type metadata accessor for ActiveSyncState.InProgressCodingKeys()
{
  return &type metadata for ActiveSyncState.InProgressCodingKeys;
}

ValueMetadata *type metadata accessor for ActiveSyncState.CompletedCodingKeys()
{
  return &type metadata for ActiveSyncState.CompletedCodingKeys;
}

ValueMetadata *type metadata accessor for ActiveSyncState.FailedCodingKeys()
{
  return &type metadata for ActiveSyncState.FailedCodingKeys;
}

unsigned char *_s14HealthPlatform26CloudSyncStatusInputSignalC6AnchorV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C275F468);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncError.CodingKeys()
{
  return &type metadata for SyncError.CodingKeys;
}

unint64_t sub_1C275F4A4()
{
  unint64_t result = qword_1EA3057F8;
  if (!qword_1EA3057F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3057F8);
  }
  return result;
}

unint64_t sub_1C275F4FC()
{
  unint64_t result = qword_1EA305800;
  if (!qword_1EA305800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305800);
  }
  return result;
}

unint64_t sub_1C275F554()
{
  unint64_t result = qword_1EA305808;
  if (!qword_1EA305808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305808);
  }
  return result;
}

unint64_t sub_1C275F5AC()
{
  unint64_t result = qword_1EA305810;
  if (!qword_1EA305810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305810);
  }
  return result;
}

unint64_t sub_1C275F604()
{
  unint64_t result = qword_1EBB828C8;
  if (!qword_1EBB828C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB828C8);
  }
  return result;
}

unint64_t sub_1C275F65C()
{
  unint64_t result = qword_1EBB828C0;
  if (!qword_1EBB828C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB828C0);
  }
  return result;
}

unint64_t sub_1C275F6B4()
{
  unint64_t result = qword_1EA305818;
  if (!qword_1EA305818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305818);
  }
  return result;
}

unint64_t sub_1C275F70C()
{
  unint64_t result = qword_1EA305820;
  if (!qword_1EA305820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305820);
  }
  return result;
}

unint64_t sub_1C275F764()
{
  unint64_t result = qword_1EA305828;
  if (!qword_1EA305828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305828);
  }
  return result;
}

unint64_t sub_1C275F7BC()
{
  unint64_t result = qword_1EA305830;
  if (!qword_1EA305830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305830);
  }
  return result;
}

unint64_t sub_1C275F814()
{
  unint64_t result = qword_1EA305838;
  if (!qword_1EA305838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305838);
  }
  return result;
}

unint64_t sub_1C275F86C()
{
  unint64_t result = qword_1EA305840;
  if (!qword_1EA305840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305840);
  }
  return result;
}

unint64_t sub_1C275F8C4()
{
  unint64_t result = qword_1EA305848;
  if (!qword_1EA305848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305848);
  }
  return result;
}

unint64_t sub_1C275F91C()
{
  unint64_t result = qword_1EA305850;
  if (!qword_1EA305850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305850);
  }
  return result;
}

unint64_t sub_1C275F974()
{
  unint64_t result = qword_1EA305858;
  if (!qword_1EA305858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305858);
  }
  return result;
}

unint64_t sub_1C275F9CC()
{
  unint64_t result = qword_1EA305860;
  if (!qword_1EA305860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305860);
  }
  return result;
}

void sub_1C275FA20()
{
  if (!qword_1EBB83080)
  {
    type metadata accessor for CloudSyncStatusInputSignal.State(255);
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_1C277C370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB83080);
    }
  }
}

uint64_t sub_1C275FA88(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_1C275FAF0()
{
  if (!qword_1EA305868)
  {
    type metadata accessor for ActiveSyncState(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA305868);
    }
  }
}

uint64_t sub_1C275FB54(uint64_t a1)
{
  return sub_1C275C038(a1);
}

uint64_t SearchSection.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL static SearchMode.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t SearchMode.hash(into:)()
{
  return sub_1C277C8D0();
}

uint64_t SearchMode.hashValue.getter()
{
  return sub_1C277C910();
}

uint64_t sub_1C275FBF8()
{
  return sub_1C277C910();
}

uint64_t sub_1C275FC40()
{
  return sub_1C277C8F0();
}

uint64_t sub_1C275FC6C()
{
  return sub_1C277C910();
}

uint64_t sub_1C275FCB0@<X0>(unsigned __int16 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s14HealthPlatform13SearchSectionO8rawValueACSgs5Int16V_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_1C275FCDC(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t _s14HealthPlatform13SearchSectionO8rawValueACSgs5Int16V_tcfC_0(uint64_t result)
{
  if ((unsigned __int16)result >= 0xDu) {
    return 13;
  }
  else {
    return (unsigned __int16)result;
  }
}

unint64_t sub_1C275FD00()
{
  unint64_t result = qword_1EA305870;
  if (!qword_1EA305870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305870);
  }
  return result;
}

unint64_t sub_1C275FD58()
{
  unint64_t result = qword_1EA305878;
  if (!qword_1EA305878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305878);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SearchMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x1C275FE78);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchMode()
{
  return &type metadata for SearchMode;
}

unsigned char *storeEnumTagSinglePayload for SearchSection(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x1C275FF7CLL);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

uint64_t AddSharedSummariesExecutor.run(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  int v13 = (char *)&v23 - v12;
  (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a4, a5);
  uint64_t v23 = v14;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, AssociatedTypeWitness);
  unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v16 = (v11 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = a4;
  *((void *)v17 + 3) = a5;
  *((void *)v17 + 4) = v5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v15], v13, AssociatedTypeWitness);
  size_t v18 = &v17[v16];
  uint64_t v19 = v26;
  *(void *)size_t v18 = v25;
  *((void *)v18 + 1) = v19;
  uint64_t v20 = v23;
  int v21 = *(void (**)(void (*)(void *, char), char *, uint64_t, uint64_t))(v23 + 40);
  swift_unknownObjectRetain();
  swift_retain();
  v21(sub_1C276066C, v17, ObjectType, v20);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_1C27601D8(id a1, char a2, uint64_t a3, uint64_t a4, void (*a5)(void *, uint64_t), uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    id v17 = a1;
    if (qword_1EBB82A50 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1C277B130();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EBB82A38);
    id v19 = a1;
    id v20 = a1;
    int v21 = sub_1C277B100();
    os_log_type_t v22 = sub_1C277BD20();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v34 = v24;
      *(_DWORD *)uint64_t v23 = 136446466;
      uint64_t v25 = sub_1C277C9E0();
      sub_1C263FDFC(v25, v26, &v34);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2082;
      id v27 = a1;
      sub_1C26532A4();
      uint64_t v28 = sub_1C277B860();
      sub_1C263FDFC(v28, v29, &v34);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      uint64_t v30 = (void (*)(id))MEMORY[0x1E4FBC8D0];
      sub_1C2760C10(a1, 1, MEMORY[0x1E4FBC8D0]);
      sub_1C2760C10(a1, 1, v30);
      _os_log_impl(&dword_1C2601000, v21, v22, "[%{public}s] Failed to create shared summary transaction builder: %{public}s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v24, -1, -1);
      MEMORY[0x1C875D230](v23, -1, -1);
    }
    else
    {
      uint64_t v31 = (void (*)(id))MEMORY[0x1E4FBC8D0];
      sub_1C2760C10(a1, 1, MEMORY[0x1E4FBC8D0]);
      sub_1C2760C10(a1, 1, v31);
    }

    uint64_t v32 = (void *)sub_1C277A610();
    a5(v32, v33);

    char v16 = 1;
  }
  else
  {
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = a7;
    v14[3] = a8;
    v14[4] = a1;
    v14[5] = a5;
    void v14[6] = a6;
    unint64_t v15 = *(void (**)(uint64_t, void (*)(void *, char), void *, uint64_t, uint64_t))(a8 + 24);
    sub_1C26B3334(a1, 0);
    sub_1C26B3334(a1, 0);
    swift_retain();
    v15(a4, sub_1C2760BFC, v14, a7, a8);
    swift_release();
    char v16 = 0;
  }
  sub_1C2760C10(a1, v16, MEMORY[0x1E4FBC8D0]);
}

uint64_t sub_1C276051C()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, AssociatedTypeWitness);
  swift_release();

  return MEMORY[0x1F4186498](v0, v6, v5);
}

void sub_1C276066C(void *a1, char a2)
{
  char v4 = a2 & 1;
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v2[4];
  uint64_t v10 = (uint64_t)v2 + v8;
  uint64_t v11 = (char *)v2 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = *(void (**)(void *, uint64_t))v11;
  uint64_t v13 = *((void *)v11 + 1);

  sub_1C27601D8(a1, v4, v9, v10, v12, v13, v5, v6);
}

uint64_t dispatch thunk of AddSharedSummariesExecutor.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AddSharedSummariesExecutor.makeSharedSummaries(for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

void sub_1C27607C4(id a1, char a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    id v16 = a1;
    id v17 = (void *)sub_1C277A610();
    a4();

    sub_1C2760C10(a1, 1, MEMORY[0x1E4FBC898]);
  }
  else
  {
    uint64_t v13 = (void *)swift_allocObject();
    void v13[2] = a6;
    void v13[3] = a7;
    v13[4] = a4;
    v13[5] = a5;
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = a3;
    v14[3] = a1;
    v14[4] = sub_1C2760C58;
    v14[5] = v13;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_1C2760C58;
    *(void *)(v15 + 24) = v13;
    swift_retain_n();
    swift_retain();
    swift_retain();
    sub_1C2701924(a1, 0);
    sub_1C261ADFC();
    swift_release();
    swift_release();
    swift_release();
  }
}

void sub_1C2760960(id a1, void (*a2)(id))
{
  id v3 = a1;
  if (a1)
  {
    id v4 = a1;
    if (qword_1EBB85FE8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1C277B130();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EBB85FD0);
    id v6 = v3;
    id v7 = v3;
    unint64_t v8 = sub_1C277B100();
    os_log_type_t v9 = sub_1C277BD20();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v17 = v11;
      *(_DWORD *)uint64_t v10 = 136446466;
      uint64_t v12 = sub_1C277C9E0();
      sub_1C263FDFC(v12, v13, &v17);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2082;
      id v14 = v3;
      sub_1C26532A4();
      uint64_t v15 = sub_1C277B860();
      sub_1C263FDFC(v15, v16, &v17);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C2601000, v8, v9, "[%{public}s] Failed to add shared summaries: %{public}s", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v11, -1, -1);
      MEMORY[0x1C875D230](v10, -1, -1);
    }
    else
    {
    }
    id v3 = (id)sub_1C277A610();
  }
  a2(v3);
}

uint64_t sub_1C2760BBC()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1C2760BFC(void *a1, char a2)
{
  sub_1C27607C4(a1, a2 & 1, *(void *)(v2 + 32), *(void (**)(void))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

void sub_1C2760C10(id a1, char a2, void (*a3)(id))
{
  if (a2) {

  }
  else {
    a3(a1);
  }
}

uint64_t sub_1C2760C20()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1C2760C58(void *a1)
{
  sub_1C2760960(a1, *(void (**)(id))(v1 + 32));
}

uint64_t sub_1C2760C64()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C2760CAC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t AnchorStorage.allStoredAnchors(availableSignals:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x1F4188298](sub_1C2760D08, 0, 0);
}

uint64_t sub_1C2760D08()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 32);
  *(void *)(v3 + 32) = v1;
  *(void *)(v3 + 40) = v2;
  id v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  sub_1C276110C();
  *id v4 = v0;
  v4[1] = sub_1C2760E14;
  return MEMORY[0x1F4188160](v0 + 16, 0, 0, 0xD000000000000023, 0x80000001C278FF50, sub_1C2761100, v3, v5);
}

uint64_t sub_1C2760E14()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1C2760F30;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1C26CCF38;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C2760F30()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1C2760F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1C2762B9C();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x1F4188790](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  (*(void (**)(uint64_t, uint64_t (*)(void *, char), uint64_t, uint64_t, uint64_t))(a5 + 8))(a3, sub_1C2762CCC, v14, a4, a5);
  return swift_release();
}

uint64_t sub_1C2761100(uint64_t a1)
{
  return sub_1C2760F94(a1, v1[4], v1[5], v1[2], v1[3]);
}

void sub_1C276110C()
{
  if (!qword_1EA305888)
  {
    sub_1C277AC50();
    sub_1C277AE90();
    sub_1C2761188();
    unint64_t v0 = sub_1C277B7A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA305888);
    }
  }
}

unint64_t sub_1C2761188()
{
  unint64_t result = qword_1EBB84150;
  if (!qword_1EBB84150)
  {
    sub_1C277AC50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB84150);
  }
  return result;
}

uint64_t sub_1C27611E0(id a1, char a2)
{
  if (a2)
  {
    id v3 = a1;
    sub_1C2762B9C();
    return sub_1C277BB50();
  }
  else
  {
    sub_1C2762B9C();
    swift_bridgeObjectRetain();
    return sub_1C277BB60();
  }
}

uint64_t AnchorStorage.store(anchor:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  uint64_t v5[2] = a1;
  return MEMORY[0x1F4188298](sub_1C2761288, 0, 0);
}

uint64_t sub_1C2761288()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  long long v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(void *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  uint64_t v5 = MEMORY[0x1E4FBC848];
  v4[1] = sub_1C2761380;
  return MEMORY[0x1F4188160](v4, 0, 0, 0xD000000000000012, 0x80000001C278FF80, sub_1C2761614, v2, v5 + 8);
}

uint64_t sub_1C2761380()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1C2760F30;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1C26CC418;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C276149C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v18 = a5;
  sub_1C26D3C28();
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t (*)(void *), uint64_t, uint64_t, uint64_t))(a6 + 16))(a3, a4, sub_1C2762B2C, v15, v18, a6);
  return swift_release();
}

uint64_t sub_1C2761614(uint64_t a1)
{
  return sub_1C276149C(a1, v1[4], v1[5], v1[6], v1[2], v1[3]);
}

uint64_t dispatch thunk of AnchorStorage.allStoredAnchors(availableSignals:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of AnchorStorage.store(anchor:for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t destroy for PluginAnchorStorage(id *a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PluginAnchorStorage(void *a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  id v7 = v3;
  id v8 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PluginAnchorStorage(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PluginAnchorStorage(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PluginAnchorStorage()
{
  return &type metadata for PluginAnchorStorage;
}

void sub_1C27617FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1C277ACE0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = *(void **)v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = (char *)swift_allocObject();
  long long v13 = *(_OWORD *)(v3 + 16);
  *((_OWORD *)v12 + 1) = *(_OWORD *)v3;
  *((_OWORD *)v12 + 2) = v13;
  *((_OWORD *)v12 + 3) = *(_OWORD *)(v3 + 32);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v12[v11], (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  unint64_t v14 = &v12[(v9 + v11 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(void *)unint64_t v14 = a2;
  *((void *)v14 + 1) = a3;
  aBlock[4] = sub_1C2762A64;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C26254FC;
  aBlock[3] = &block_descriptor_10_1;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = *(void **)(v3 + 8);
  long long v17 = *(_OWORD *)(v3 + 16);
  long long v21 = *(_OWORD *)(v3 + 32);
  long long v22 = v17;
  id v18 = v10;
  id v19 = v16;
  sub_1C26D90E8((uint64_t)&v22);
  sub_1C26D90E8((uint64_t)&v21);
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v15);
  _Block_release(v15);
}

uint64_t sub_1C2761A08(void *a1, uint64_t a2, void (*a3)(void *, void), uint64_t a4)
{
  v28[1] = a4;
  unint64_t v29 = a3;
  v28[0] = a2;
  uint64_t v5 = sub_1C277A8A0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2669068();
  sub_1C26322C0();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1C277E580;
  uint64_t v10 = a1[2];
  uint64_t v11 = a1[3];
  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  *(void *)(v9 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v13 = sub_1C263226C();
  *(void *)(v9 + 64) = v13;
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v11;
  unint64_t v14 = (void *)a1[1];
  swift_bridgeObjectRetain();
  id v15 = objc_msgSend(v14, sel_identifier);
  sub_1C277A880();

  uint64_t v16 = sub_1C277A850();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)(v9 + 96) = v12;
  *(void *)(v9 + 104) = v13;
  *(void *)(v9 + 72) = v16;
  *(void *)(v9 + 80) = v18;
  uint64_t v20 = a1[4];
  uint64_t v19 = a1[5];
  *(void *)(v9 + 136) = v12;
  *(void *)(v9 + 144) = v13;
  *(void *)(v9 + 112) = v20;
  *(void *)(v9 + 120) = v19;
  swift_bridgeObjectRetain();
  long long v21 = (void *)sub_1C277BCC0();
  id v22 = objc_allocWithZone(MEMORY[0x1E4F1C0D0]);
  uint64_t v23 = (void *)sub_1C277B820();
  id v24 = objc_msgSend(v22, sel_initWithEntityName_, v23);

  objc_msgSend(v24, sel_setPredicate_, v21);
  type metadata accessor for OrchestrationAnchor();
  unint64_t v25 = sub_1C277C000();
  MEMORY[0x1F4188790](v25);
  v28[-2] = v28[0];
  unint64_t v26 = sub_1C26C1474(MEMORY[0x1E4FBC868], (void (*)(void **, id *))sub_1C2762AF8, (uint64_t)&v28[-4], v25);
  swift_bridgeObjectRelease();
  v29(v26, 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2761D14(uint64_t *a1, void **a2, uint64_t a3)
{
  uint64_t v28 = a3;
  id v27 = a1;
  uint64_t v4 = sub_1C277ACE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_1C277AC50();
  uint64_t v8 = *(void *)(v30 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v30);
  unint64_t v26 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v25 - v11;
  unint64_t v13 = *a2;
  id v14 = objc_msgSend(v13, sel_criteria);
  sub_1C277B850();

  sub_1C277AC60();
  sub_1C277AE90();
  id v15 = objc_msgSend(v13, sel_encodedAnchorSet);
  sub_1C277A780();

  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v28, v4);
  uint64_t v16 = v29;
  uint64_t v17 = sub_1C277AE70();
  if (v16) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v12, v30);
  }
  uint64_t v19 = v17;
  uint64_t v20 = (uint64_t)v26;
  uint64_t v21 = v30;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v26, v12, v30);
  swift_retain();
  id v22 = v27;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v31 = *v22;
  *id v22 = 0x8000000000000000;
  sub_1C268BE38(v19, v20, isUniquelyReferenced_nonNull_native);
  *id v22 = v31;
  swift_bridgeObjectRelease();
  id v24 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v24(v20, v21);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v24)(v12, v21);
}

void sub_1C2761FF8(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v72 = a5;
  uint64_t v71 = a2;
  v97[2] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v7 = sub_1C277A8A0();
  uint64_t v92 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C277AC50();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  id v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v68 - v15;
  uint64_t v17 = sub_1C277AE80();
  uint64_t v89 = v14;
  v90 = v9;
  uint64_t v95 = v16;
  uint64_t v96 = v10;
  uint64_t v91 = v7;
  uint64_t v80 = v17;
  unint64_t v81 = v18;
  uint64_t v20 = v71;
  uint64_t v21 = *(void *)(v71 + 16);
  if (v21)
  {
    uint64_t v94 = 0;
    uint64_t v70 = a4;
    unint64_t v79 = sub_1C2669068();
    uint64_t v22 = a3[2];
    uint64_t v87 = a3[3];
    uint64_t v88 = v22;
    uint64_t v23 = a3[4];
    uint64_t v85 = a3[5];
    uint64_t v86 = v23;
    id v84 = (id)a3[1];
    uint64_t v69 = a3;
    id v24 = (void *)*a3;
    uint64_t v25 = v11 + 16;
    unint64_t v26 = *(void (**)(void, void, void))(v11 + 16);
    uint64_t v27 = v20 + ((*(unsigned __int8 *)(v25 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 64));
    uint64_t v82 = (void (**)(char *, uint64_t))(v92 + 8);
    uint64_t v83 = v24;
    uint64_t v75 = (void (**)(char *, uint64_t))(v25 - 8);
    uint64_t v73 = *(void *)(v25 + 56);
    swift_bridgeObjectRetain();
    long long v78 = xmmword_1C277EF40;
    unint64_t v77 = 0x80000001C278FFA0;
    unint64_t v76 = 0x80000001C278A570;
    uint64_t v29 = v95;
    uint64_t v28 = v96;
    uint64_t v74 = v26;
    uint64_t v93 = v25;
    while (1)
    {
      uint64_t v92 = v21;
      v26(v29, v27, v28);
      sub_1C26322C0();
      uint64_t v42 = swift_allocObject();
      *(_OWORD *)(v42 + 16) = v78;
      uint64_t v43 = MEMORY[0x1E4FBB1A0];
      *(void *)(v42 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v44 = sub_1C263226C();
      *(void *)(v42 + 64) = v44;
      uint64_t v45 = v87;
      *(void *)(v42 + 32) = v88;
      *(void *)(v42 + 40) = v45;
      swift_bridgeObjectRetain();
      id v46 = objc_msgSend(v84, sel_identifier);
      uint64_t v47 = v90;
      sub_1C277A880();

      uint64_t v48 = sub_1C277A850();
      uint64_t v50 = v49;
      uint64_t v51 = *v82;
      (*v82)(v47, v91);
      *(void *)(v42 + 96) = v43;
      *(void *)(v42 + 104) = v44;
      *(void *)(v42 + 72) = v48;
      *(void *)(v42 + 80) = v50;
      *(void *)(v42 + 136) = v43;
      *(void *)(v42 + 144) = v44;
      uint64_t v52 = v85;
      *(void *)(v42 + 112) = v86;
      *(void *)(v42 + 120) = v52;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_1C277AC40();
      *(void *)(v42 + 176) = v43;
      *(void *)(v42 + 184) = v44;
      *(void *)(v42 + 152) = v53;
      *(void *)(v42 + 160) = v54;
      uint64_t v55 = (void *)sub_1C277BCC0();
      id v56 = objc_allocWithZone(MEMORY[0x1E4F1C0D0]);
      uint64_t v57 = (void *)sub_1C277B820();
      id v58 = objc_msgSend(v56, sel_initWithEntityName_, v57);

      objc_msgSend(v58, sel_setPredicate_, v55);
      type metadata accessor for OrchestrationAnchor();
      uint64_t v59 = v94;
      unint64_t v60 = sub_1C277C000();
      if (v59)
      {

        sub_1C263CC84(v80, v81);
        (*v75)(v95, v96);
        swift_bridgeObjectRelease();
        a4 = v70;
        goto LABEL_2;
      }
      unint64_t v61 = v60;
      uint64_t v94 = 0;
      if (v60 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v63 = sub_1C277C5A0();
        swift_bridgeObjectRelease();
        uint64_t v36 = v89;
        if (v63)
        {
LABEL_11:
          if ((v61 & 0xC000000000000001) != 0)
          {
            id v62 = (id)MEMORY[0x1C875C230](0, v61);
          }
          else
          {
            if (!*(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              __break(1u);
            }
            id v62 = *(id *)(v61 + 32);
          }
          id v31 = v62;
          swift_bridgeObjectRelease();
          v26(v36, v95, v96);
          if (v31) {
            goto LABEL_7;
          }
          goto LABEL_6;
        }
      }
      else
      {
        uint64_t v36 = v89;
        if (*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_11;
        }
      }
      swift_bridgeObjectRelease();
      v26(v36, v95, v96);
LABEL_6:
      id v30 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      id v31 = objc_msgSend(v30, sel_initWithContext_, v83);
      uint64_t v32 = (void *)sub_1C277B820();
      objc_msgSend(v31, sel_setPluginPackage_, v32);

      id v33 = objc_msgSend(v84, sel_identifier);
      uint64_t v34 = v90;
      sub_1C277A880();

      sub_1C277A850();
      uint64_t v35 = v34;
      uint64_t v36 = v89;
      v51(v35, v91);
      uint64_t v37 = (void *)sub_1C277B820();
      swift_bridgeObjectRelease();
      objc_msgSend(v31, sel_setProfileIdentifier_, v37);

      uint64_t v38 = (void *)sub_1C277B820();
      objc_msgSend(v31, sel_setPlanner_, v38);

      sub_1C277AC40();
      uint64_t v39 = (void *)sub_1C277B820();
      swift_bridgeObjectRelease();
      objc_msgSend(v31, sel_setCriteria_, v39);

LABEL_7:
      uint64_t v40 = *v75;
      uint64_t v28 = v96;
      (*v75)(v36, v96);
      uint64_t v41 = (void *)sub_1C277A770();
      objc_msgSend(v31, sel_setEncodedAnchorSet_, v41);

      uint64_t v29 = v95;
      v40(v95, v28);
      v27 += v73;
      uint64_t v21 = v92 - 1;
      unint64_t v26 = v74;
      if (v92 == 1)
      {
        swift_bridgeObjectRelease();
        a4 = v70;
        a3 = v69;
        break;
      }
    }
  }
  uint64_t v64 = (void *)*a3;
  v97[0] = 0;
  if (objc_msgSend(v64, sel_save_, v97))
  {
    id v65 = v97[0];
    a4(0);
    sub_1C263CC84(v80, v81);
  }
  else
  {
    id v66 = v97[0];
    uint64_t v67 = sub_1C277A620();

    swift_willThrow();
    uint64_t v59 = (void *)v67;
    sub_1C263CC84(v80, v81);
LABEL_2:
    id v19 = v59;
    a4(v59);
  }
}

void sub_1C27627A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *(void **)v4;
  uint64_t v9 = *(void **)(v4 + 8);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  *(void *)(v11 + 32) = v10;
  *(void *)(v11 + 40) = v9;
  long long v12 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v11 + 64) = v12;
  *(void *)(v11 + 80) = a3;
  *(void *)(v11 + 88) = a4;
  v17[4] = sub_1C2762950;
  void v17[5] = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1C26254FC;
  v17[3] = &block_descriptor_29;
  uint64_t v13 = _Block_copy(v17);
  long long v14 = *(_OWORD *)(v4 + 32);
  long long v18 = *(_OWORD *)(v4 + 16);
  long long v19 = v14;
  swift_retain();
  swift_bridgeObjectRetain();
  id v15 = v10;
  id v16 = v9;
  sub_1C26D90E8((uint64_t)&v18);
  sub_1C26D90E8((uint64_t)&v19);
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_performBlock_, v13);
  _Block_release(v13);
}

uint64_t sub_1C27628E8()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 96, 7);
}

void sub_1C2762950()
{
  sub_1C2761FF8(*(void *)(v0 + 16), *(void *)(v0 + 24), (void *)(v0 + 32), *(void (**)(void))(v0 + 80), *(void *)(v0 + 88));
}

uint64_t sub_1C2762960()
{
  uint64_t v1 = sub_1C277ACE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x1F4186498](v0, v6 + 16, v5);
}

uint64_t sub_1C2762A64()
{
  uint64_t v1 = *(void *)(sub_1C277ACE0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + v2;
  uint64_t v4 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = *(void (**)(void *, void))v4;
  uint64_t v6 = *(void *)(v4 + 8);

  return sub_1C2761A08((void *)(v0 + 16), v3, v5, v6);
}

uint64_t sub_1C2762AF8(uint64_t *a1, void **a2)
{
  return sub_1C2761D14(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1C2762B14()
{
  return objectdestroy_12Tm((uint64_t (*)(void))sub_1C26D3C28);
}

uint64_t sub_1C2762B2C(void *a1)
{
  sub_1C26D3C28();

  return sub_1C26CCC3C(a1);
}

void sub_1C2762B9C()
{
  if (!qword_1EA305898)
  {
    sub_1C276110C();
    sub_1C262B07C(255, (unint64_t *)&qword_1EBB831D0);
    unint64_t v0 = sub_1C277BB70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA305898);
    }
  }
}

uint64_t sub_1C2762C1C()
{
  return objectdestroy_12Tm((uint64_t (*)(void))sub_1C2762B9C);
}

uint64_t objectdestroy_12Tm(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x1F4186498](v1, v6, v7);
}

uint64_t sub_1C2762CCC(void *a1, char a2)
{
  char v3 = a2 & 1;
  sub_1C2762B9C();

  return sub_1C27611E0(a1, v3);
}

uint64_t UnfairLock.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = (_DWORD *)swift_slowAlloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = 0;
  return v0;
}

uint64_t UnfairLock.deinit()
{
  MEMORY[0x1C875D230](*(void *)(v0 + 16), -1, -1);
  return v0;
}

BOOL sub_1C2762DC0()
{
  return os_unfair_lock_trylock(*(os_unfair_lock_t *)(v0 + 16));
}

uint64_t method lookup function for UnfairLock(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for UnfairLock);
}

uint64_t dispatch thunk of UnfairLock.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of UnfairLock.trylock()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

id PluginData.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PluginData.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PluginData();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PluginData.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PluginData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t UNUserNotificationCenter.scheduleNotification(_:)(void *a1)
{
  objc_super v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C2763378();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C27640CC(0, &qword_1EA3058A8, MEMORY[0x1E4F1AC18]);
  uint64_t v11 = v10;
  uint64_t v30 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v29 - v12;
  id v14 = objc_msgSend(a1, sel_content);
  id v15 = objc_msgSend(v14, sel_badge);

  if (v15)
  {
    if (qword_1EBB86260 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1C277B130();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EBB86280);
    uint64_t v17 = sub_1C277B100();
    os_log_type_t v18 = sub_1C277BD30();
    if (os_log_type_enabled(v17, v18))
    {
      long long v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v32 = v20;
      *(_DWORD *)long long v19 = 136315138;
      uint64_t v21 = sub_1C277C9E0();
      uint64_t v31 = sub_1C263FDFC(v21, v22, &v32);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C2601000, v17, v18, "[%s] The Health app does not currently support app badging among all Health processes and clients.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v20, -1, -1);
      MEMORY[0x1C875D230](v19, -1, -1);
    }

    sub_1C276342C();
    sub_1C26532A4();
    sub_1C277B450();
    sub_1C26210BC(&qword_1EA3058B8, &qword_1EA3058A8, MEMORY[0x1E4F1AC18]);
    uint64_t v23 = sub_1C277B4E0();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v11);
  }
  else
  {
    id v24 = (void *)swift_allocObject();
    v24[2] = v2;
    v24[3] = a1;
    v24[4] = ObjectType;
    uint64_t v25 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C27640CC(0, (unint64_t *)&qword_1EBB82CC0, MEMORY[0x1E4F1AAE0]);
    sub_1C26210BC(&qword_1EBB82CB8, (unint64_t *)&qword_1EBB82CC0, v25);
    id v26 = v2;
    id v27 = a1;
    sub_1C277B4A0();
    sub_1C2763980();
    uint64_t v23 = sub_1C277B4E0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v23;
}

void sub_1C2763378()
{
  if (!qword_1EA3058A0)
  {
    uint64_t v0 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void))MEMORY[0x1E4F1AAE0];
    sub_1C27640CC(255, (unint64_t *)&qword_1EBB82CC0, MEMORY[0x1E4F1AAE0]);
    sub_1C26210BC(&qword_1EBB82CB8, (unint64_t *)&qword_1EBB82CC0, v0);
    unint64_t v1 = sub_1C277B4B0();
    if (!v2) {
      atomic_store(v1, (unint64_t *)&qword_1EA3058A0);
    }
  }
}

unint64_t sub_1C276342C()
{
  unint64_t result = qword_1EBB82FC0;
  if (!qword_1EBB82FC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB82FC0);
  }
  return result;
}

uint64_t UNNotification.requestContentURL.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1C2629308();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  id v6 = objc_msgSend(v1, sel_request);
  id v7 = objc_msgSend(v6, sel_content);

  id v8 = objc_msgSend(v7, sel_userInfo);
  uint64_t v9 = sub_1C277B760();

  *(void *)&v21[0] = sub_1C277B850();
  *((void *)&v21[0] + 1) = v10;
  sub_1C277C260();
  if (*(void *)(v9 + 16) && (unint64_t v11 = sub_1C2673204((uint64_t)v19), (v12 & 1) != 0)) {
    sub_1C263FED0(*(void *)(v9 + 56) + 32 * v11, (uint64_t)v21);
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  swift_bridgeObjectRelease();
  sub_1C265E4DC((uint64_t)v19);
  sub_1C276405C((uint64_t)v21, (uint64_t)v19);
  if (v20)
  {
    if (swift_dynamicCast())
    {
      sub_1C277A720();
      swift_bridgeObjectRelease();
      return sub_1C2624858((uint64_t)v21, (uint64_t (*)(void))sub_1C262F914);
    }
  }
  else
  {
    sub_1C2624858((uint64_t)v19, (uint64_t (*)(void))sub_1C262F914);
  }
  sub_1C262C460((uint64_t)v21, (uint64_t)v19);
  if (!v20)
  {
    sub_1C2624858((uint64_t)v19, (uint64_t (*)(void))sub_1C262F914);
    uint64_t v14 = sub_1C277A750();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 1, 1, v14);
LABEL_13:
    sub_1C2624858((uint64_t)v5, (uint64_t (*)(void))sub_1C2629308);
    sub_1C277A750();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 1, 1, v14);
  }
  uint64_t v14 = sub_1C277A750();
  int v15 = swift_dynamicCast();
  uint64_t v16 = *(void *)(v14 - 8);
  uint64_t v17 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56);
  v17((uint64_t)v5, v15 ^ 1u, 1, v14);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v16 + 48))(v5, 1, v14) == 1) {
    goto LABEL_13;
  }
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v16 + 32))(a1, v5, v14);
  return v17(a1, 0, 1, v14);
}

uint64_t sub_1C2763814@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  id v8 = (void *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  uint64_t v9 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void))MEMORY[0x1E4F1AC28];
  sub_1C27640CC(0, &qword_1EA3058C0, MEMORY[0x1E4F1AC28]);
  swift_allocObject();
  id v10 = a1;
  id v11 = a2;
  sub_1C277B480();
  sub_1C26210BC(&qword_1EA3058C8, &qword_1EA3058C0, v9);
  uint64_t v12 = sub_1C277B4E0();
  uint64_t result = swift_release();
  *a4 = v12;
  return result;
}

uint64_t sub_1C2763934()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C2763974@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2763814(*(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), a1);
}

unint64_t sub_1C2763980()
{
  unint64_t result = qword_1EA3058B0;
  if (!qword_1EA3058B0)
  {
    sub_1C2763378();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3058B0);
  }
  return result;
}

void sub_1C27639D8(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  id v11 = (void *)swift_allocObject();
  v11[2] = a4;
  v11[3] = sub_1C263B0B8;
  v11[4] = v10;
  v11[5] = a5;
  v14[4] = sub_1C27641BC;
  v14[5] = v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1C2763FF0;
  v14[3] = &block_descriptor_30;
  uint64_t v12 = _Block_copy(v14);
  swift_retain();
  id v13 = a4;
  swift_release();
  objc_msgSend(a3, sel_addNotificationRequest_withCompletionHandler_, v13, v12);
  _Block_release(v12);
}

void sub_1C2763B08(void *a1, void *a2, void (*a3)(void *, uint64_t))
{
  if (a1)
  {
    id v6 = a1;
    if (qword_1EBB86260 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1C277B130();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EBB86280);
    id v8 = a2;
    id v9 = a1;
    id v10 = v8;
    id v11 = a1;
    uint64_t v12 = sub_1C277B100();
    os_log_type_t v13 = sub_1C277BD20();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = v37;
      *(_DWORD *)uint64_t v14 = 136315650;
      uint64_t v15 = sub_1C277C9E0();
      sub_1C263FDFC(v15, v16, &v38);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      id v17 = objc_msgSend(v10, sel_identifier);
      uint64_t v18 = sub_1C277B850();
      unint64_t v20 = v19;

      sub_1C263FDFC(v18, v20, &v38);
      sub_1C277C0D0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 22) = 2080;
      id v21 = a1;
      sub_1C26532A4();
      uint64_t v22 = sub_1C277B870();
      sub_1C263FDFC(v22, v23, &v38);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C2601000, v12, v13, "[%s] Notification %s Error: %s", (uint8_t *)v14, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v37, -1, -1);
      MEMORY[0x1C875D230](v14, -1, -1);
    }
    else
    {
    }
    id v36 = a1;
    a3(a1, 1);
  }
  else
  {
    if (qword_1EBB86260 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_1C277B130();
    __swift_project_value_buffer(v24, (uint64_t)qword_1EBB86280);
    id v25 = a2;
    id v26 = sub_1C277B100();
    os_log_type_t v27 = sub_1C277BD40();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v38 = v29;
      *(_DWORD *)uint64_t v28 = 136315394;
      uint64_t v30 = sub_1C277C9E0();
      sub_1C263FDFC(v30, v31, &v38);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2080;
      id v32 = objc_msgSend(v25, sel_identifier);
      uint64_t v33 = sub_1C277B850();
      unint64_t v35 = v34;

      sub_1C263FDFC(v33, v35, &v38);
      sub_1C277C0D0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C2601000, v26, v27, "[%s] Notification Request Added %s", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v29, -1, -1);
      MEMORY[0x1C875D230](v28, -1, -1);

      a3(v25, 0);
    }
    else
    {

      a3(v25, 0);
    }
  }
}

void sub_1C2763FF0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1C276405C(uint64_t a1, uint64_t a2)
{
  sub_1C262F914();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C27640C0(uint64_t a1, uint64_t a2)
{
  sub_1C27639D8(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32));
}

void sub_1C27640CC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t, unint64_t, void))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1C276342C();
    unint64_t v7 = sub_1C26532A4();
    unint64_t v8 = a3(a1, v6, v7, MEMORY[0x1E4FBC0F0]);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1C2764144()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C276417C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1C27641BC(void *a1)
{
  sub_1C2763B08(a1, *(void **)(v1 + 16), *(void (**)(void *, uint64_t))(v1 + 24));
}

uint64_t HKTypesFeatureTag.value.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HKTypesFeatureTag.value.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*HKTypesFeatureTag.value.modify())()
{
  return nullsub_1;
}

uint64_t HKTypesFeatureTag.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1C2764228()
{
  uint64_t result = swift_getKeyPath();
  qword_1EBB827C8 = result;
  return result;
}

uint64_t static HKTypesFeatureTag.keyPath.getter()
{
  if (qword_1EBB827C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t static HKTypesFeatureTag.keyPath.setter(uint64_t a1)
{
  if (qword_1EBB827C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_1EBB827C8 = a1;
  return swift_release();
}

uint64_t (*static HKTypesFeatureTag.keyPath.modify())()
{
  if (qword_1EBB827C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1C27643D0()
{
  if (qword_1EBB827C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

ValueMetadata *type metadata accessor for HKTypesFeatureTag()
{
  return &type metadata for HKTypesFeatureTag;
}

uint64_t HealthPluginPlanner.fetchCriteria(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v7 = sub_1C277B130();
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v25 = v7;
  MEMORY[0x1F4188790](v7);
  id v26 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C277ACE0();
  uint64_t v22 = *(void *)(v9 - 8);
  uint64_t v23 = v9;
  MEMORY[0x1F4188790](v9);
  id v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  uint64_t v14 = v13;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void *__return_ptr, uint64_t, void, uint64_t, uint64_t))(v14 + 24))(v29, v4, *(void *)(a4 + 8), ObjectType, v14);
  swift_unknownObjectRelease();
  uint64_t v16 = v30;
  uint64_t v17 = v31;
  __swift_project_boxed_opaque_existential_1(v29, v30);
  (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a3;
  id v18[3] = a4;
  uint64_t v19 = v27;
  v18[4] = v12;
  v18[5] = v19;
  v18[6] = v28;
  v18[7] = v4;
  unint64_t v20 = *(void (**)(char *, void (*)(void *, char), void *, uint64_t, uint64_t))(v17 + 8);
  swift_retain();
  swift_unknownObjectRetain();
  v20(v11, sub_1C27663D0, v18, v16, v17);
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v23);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
}

void sub_1C2764988(void *a1, char a2, unint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = sub_1C277B130();
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v37 = v17;
    unint64_t v38 = a3;
    uint64_t v39 = a5;
    id v21 = *(void (**)(uint64_t, uint64_t))(a8 + 16);
    id v22 = a1;
    v21(a7, a8);
    swift_getObjectType();
    sub_1C277AC30();
    swift_unknownObjectRelease();
    sub_1C2701924(a1, 1);
    swift_unknownObjectRetain();
    sub_1C2701924(a1, 1);
    swift_unknownObjectRetain();
    uint64_t v23 = sub_1C277B100();
    os_log_type_t v24 = sub_1C277BD20();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      id v36 = a4;
      uint64_t v26 = v25;
      unint64_t v34 = (void *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v40 = a6;
      uint64_t v41 = v35;
      *(_DWORD *)uint64_t v26 = 136315394;
      swift_unknownObjectRetain();
      uint64_t v27 = sub_1C277B860();
      uint64_t v40 = sub_1C263FDFC(v27, v28, &v41);
      sub_1C277C0D0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2112;
      id v29 = a1;
      uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v40 = v30;
      sub_1C277C0D0();
      uint64_t v31 = v34;
      *unint64_t v34 = v30;
      sub_1C263B3A4(a1, 1);
      sub_1C263B3A4(a1, 1);
      _os_log_impl(&dword_1C2601000, v23, v24, "%s: Failed to load previously stored anchors: %@", (uint8_t *)v26, 0x16u);
      sub_1C27663E4(0, (unint64_t *)&qword_1EBB854A0, (uint64_t (*)(uint64_t))sub_1C2652E20, MEMORY[0x1E4FBB718]);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v31, -1, -1);
      uint64_t v32 = v35;
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v32, -1, -1);
      uint64_t v33 = v26;
      a4 = v36;
      MEMORY[0x1C875D230](v33, -1, -1);
    }
    else
    {
      swift_unknownObjectRelease_n();
      sub_1C263B3A4(a1, 1);
      sub_1C263B3A4(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v16);
    a4(v38);
    sub_1C263B3A4(a1, 1);
  }
  else
  {
    sub_1C2701924(a1, 0);
    uint64_t v20 = sub_1C276651C(a3, (uint64_t)a1);
    sub_1C263B3A4(a1, 0);
    a4(v20);
    swift_bridgeObjectRelease();
  }
}

uint64_t HealthPluginPlanner.workPlan(_:didFail:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v43 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v42 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = sub_1C277B130();
  uint64_t v44 = *(void *)(v15 - 8);
  uint64_t v45 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  swift_getObjectType();
  sub_1C277AC30();
  swift_unknownObjectRelease();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v18(v14, v43, AssociatedTypeWitness);
  swift_unknownObjectRetain();
  id v19 = a2;
  swift_unknownObjectRetain();
  id v20 = a2;
  uint64_t v43 = v17;
  id v21 = sub_1C277B100();
  os_log_type_t v22 = sub_1C277BD20();
  int v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v37 = v18;
    uint64_t v25 = v24;
    uint64_t v40 = (void *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v46 = v5;
    uint64_t v47 = v41;
    *(_DWORD *)uint64_t v25 = 136315650;
    int v39 = v23;
    swift_unknownObjectRetain();
    uint64_t v26 = sub_1C277B860();
    os_log_t v38 = v21;
    uint64_t v46 = sub_1C263FDFC(v26, v27, &v47);
    sub_1C277C0D0();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    v37(v42, v14, AssociatedTypeWitness);
    uint64_t v28 = sub_1C277B860();
    uint64_t v46 = sub_1C263FDFC(v28, v29, &v47);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, AssociatedTypeWitness);
    *(_WORD *)(v25 + 22) = 2112;
    id v30 = a2;
    uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v46 = v31;
    sub_1C277C0D0();
    uint64_t v32 = v40;
    *uint64_t v40 = v31;

    os_log_t v33 = v38;
    _os_log_impl(&dword_1C2601000, v38, (os_log_type_t)v39, "%s: Work plan %s failed: %@", (uint8_t *)v25, 0x20u);
    sub_1C27663E4(0, (unint64_t *)&qword_1EBB854A0, (uint64_t (*)(uint64_t))sub_1C2652E20, MEMORY[0x1E4FBB718]);
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v32, -1, -1);
    uint64_t v34 = v41;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v34, -1, -1);
    MEMORY[0x1C875D230](v25, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v43, v45);
}

uint64_t HealthPluginPlanner.store(anchor:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1C277B130();
  MEMORY[0x1F4188790](v8);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  uint64_t v10 = v9;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void *__return_ptr, uint64_t, void, uint64_t, uint64_t))(v10 + 24))(v18, v4, *(void *)(a4 + 8), ObjectType, v10);
  swift_unknownObjectRelease();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v4;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(void *), void *, uint64_t, uint64_t))(v13 + 16);
  swift_unknownObjectRetain();
  v15(a1, a2, sub_1C2766480, v14, v12, v13);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
}

uint64_t _s14HealthPlatform0A13PluginPlannerPAAE6update6anchor3fory0A13Orchestration20InputSignalAnchorSetC_AG12WorkCriteriaCtF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C27663E4(0, &qword_1EBB83968, MEMORY[0x1E4F66DF8], MEMORY[0x1E4FBBE00]);
  sub_1C277AC50();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1C277E480;
  sub_1C277AC90();
  HealthPluginPlanner.store(anchor:for:)(a1, v7, a3, a4);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C276576C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1C277B130();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v29 = result;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
    id v14 = a1;
    v13(a3, a4);
    swift_getObjectType();
    sub_1C277AC30();
    swift_unknownObjectRelease();
    id v15 = a1;
    swift_unknownObjectRetain();
    id v16 = a1;
    swift_unknownObjectRetain();
    uint64_t v17 = sub_1C277B100();
    os_log_type_t v18 = sub_1C277BD20();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      unint64_t v27 = (void *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v30 = a2;
      uint64_t v31 = v28;
      *(_DWORD *)uint64_t v19 = 136315394;
      swift_unknownObjectRetain();
      uint64_t v20 = sub_1C277B860();
      uint64_t v30 = sub_1C263FDFC(v20, v21, &v31);
      sub_1C277C0D0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2112;
      id v22 = a1;
      uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v30 = v23;
      sub_1C277C0D0();
      uint64_t v24 = v27;
      *unint64_t v27 = v23;

      _os_log_impl(&dword_1C2601000, v17, v18, "%s: Failed to update anchor: %@", (uint8_t *)v19, 0x16u);
      sub_1C27663E4(0, (unint64_t *)&qword_1EBB854A0, (uint64_t (*)(uint64_t))sub_1C2652E20, MEMORY[0x1E4FBB718]);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v24, -1, -1);
      uint64_t v25 = v28;
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v25, -1, -1);
      MEMORY[0x1C875D230](v19, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v29);
  }
  return result;
}

uint64_t HealthPluginPlanner.allStoredAnchors(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v7 = sub_1C277B130();
  uint64_t v22 = *(void *)(v7 - 8);
  uint64_t v23 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v26 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C277ACE0();
  uint64_t v21 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  uint64_t v13 = v12;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void *__return_ptr, uint64_t, void, uint64_t, uint64_t))(v13 + 24))(v27, v4, *(void *)(a4 + 8), ObjectType, v13);
  swift_unknownObjectRelease();
  uint64_t v15 = v28;
  uint64_t v16 = v29;
  __swift_project_boxed_opaque_existential_1(v27, v28);
  (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = v24;
  void v17[5] = v25;
  void v17[6] = v4;
  os_log_type_t v18 = *(void (**)(char *, void (*)(void *, char), void *, uint64_t, uint64_t))(v16 + 8);
  swift_retain();
  swift_unknownObjectRetain();
  v18(v11, sub_1C27664CC, v17, v15, v16);
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v9);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
}

void sub_1C2765FCC(void *a1, char a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = sub_1C277B130();
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v33 = v15;
    uint64_t v34 = a4;
    os_log_type_t v18 = *(void (**)(uint64_t, uint64_t))(a7 + 16);
    id v19 = a1;
    v18(a6, a7);
    swift_getObjectType();
    sub_1C277AC30();
    swift_unknownObjectRelease();
    sub_1C2701924(a1, 1);
    swift_unknownObjectRetain();
    sub_1C2701924(a1, 1);
    swift_unknownObjectRetain();
    uint64_t v20 = sub_1C277B100();
    os_log_type_t v21 = sub_1C277BD20();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v30 = (void *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v35 = a5;
      uint64_t v36 = v32;
      *(_DWORD *)uint64_t v22 = 136315394;
      os_log_t v31 = v20;
      swift_unknownObjectRetain();
      uint64_t v23 = sub_1C277B860();
      uint64_t v35 = sub_1C263FDFC(v23, v24, &v36);
      sub_1C277C0D0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2112;
      id v25 = a1;
      uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v35 = v26;
      sub_1C277C0D0();
      unint64_t v27 = v30;
      *uint64_t v30 = v26;
      sub_1C263B3A4(a1, 1);
      sub_1C263B3A4(a1, 1);
      uint64_t v20 = v31;
      _os_log_impl(&dword_1C2601000, v31, v21, "%s: Failed to retrieve stored anchors; starting criteria from nil anchors: %@",
        (uint8_t *)v22,
        0x16u);
      sub_1C27663E4(0, (unint64_t *)&qword_1EBB854A0, (uint64_t (*)(uint64_t))sub_1C2652E20, MEMORY[0x1E4FBB718]);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v27, -1, -1);
      uint64_t v28 = v32;
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v28, -1, -1);
      MEMORY[0x1C875D230](v22, -1, -1);
    }
    else
    {
      swift_unknownObjectRelease_n();
      sub_1C263B3A4(a1, 1);
      sub_1C263B3A4(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v33 + 8))(v17, v14);
    sub_1C267D090(MEMORY[0x1E4FBC860]);
    a3();
    swift_bridgeObjectRelease();
    sub_1C263B3A4(a1, 1);
  }
  else
  {
    ((void (*)(void *))a3)(a1);
  }
}

uint64_t sub_1C2766388()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

void sub_1C27663D0(void *a1, char a2)
{
  sub_1C2764988(a1, a2 & 1, *(void *)(v2 + 32), *(void (**)(void))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

void sub_1C27663E4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1C2766448()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C2766480(void *a1)
{
  return sub_1C276576C(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_1C276648C()
{
  swift_release();
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1C27664CC(void *a1, char a2)
{
  sub_1C2765FCC(a1, a2 & 1, *(void (**)(void))(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t dispatch thunk of HealthPluginPlanner.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthPluginPlanner.signals.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HealthPluginPlanner.unanchoredCriteria.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1C276651C(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v17 = sub_1C277AC50();
  uint64_t v6 = *(void *)(v17 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v17);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x1E4FBC860];
    if (!v10) {
      break;
    }
    uint64_t v18 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1C277C3C0();
    if (v10 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v12 = 0;
    uint64_t v14 = v3;
    unint64_t v15 = a1 & 0xC000000000000001;
    uint64_t v3 = (void (**)(char *, uint64_t))(v6 + 8);
    unint64_t v16 = a1;
    while (v10 != v12)
    {
      if (v15) {
        MEMORY[0x1C875C230](v12, a1);
      }
      else {
        swift_retain();
      }
      sub_1C277AC90();
      sub_1C277AC90();
      if (*(void *)(a2 + 16))
      {
        sub_1C26733D4((uint64_t)v9);
        if (v13) {
          swift_retain();
        }
      }
      ++v12;
      (*v3)(v9, v17);
      sub_1C277ACA0();
      sub_1C277ACB0();
      swift_allocObject();
      sub_1C277AC70();
      swift_release();
      sub_1C277C390();
      uint64_t v6 = *(void *)(v18 + 16);
      sub_1C277C3D0();
      sub_1C277C3E0();
      sub_1C277C3A0();
      a1 = v16;
      if (v10 == v12) {
        return v18;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
  }
  return result;
}

HealthPlatform::ProminenceFeatureTag __swiftcall ProminenceFeatureTag.init(_:)(HealthPlatform::ProminenceFeatureTag result)
{
  *uint64_t v1 = *(unsigned char *)result.value;
  return result;
}

HealthPlatform::FeedItemProminence_optional __swiftcall FeedItemProminence.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 10) {
    char v2 = 2;
  }
  else {
    char v2 = 3;
  }
  if (rawValue == 5) {
    char v3 = 1;
  }
  else {
    char v3 = v2;
  }
  if (!rawValue) {
    char v3 = 0;
  }
  *uint64_t v1 = v3;
  return (HealthPlatform::FeedItemProminence_optional)rawValue;
}

uint64_t FeedItemProminence.rawValue.getter()
{
  return 5 * *v0;
}

uint64_t sub_1C27667DC()
{
  return sub_1C277C910();
}

uint64_t sub_1C2766824()
{
  return sub_1C277C8D0();
}

uint64_t sub_1C2766854()
{
  return sub_1C277C910();
}

HealthPlatform::FeedItemProminence_optional sub_1C2766898(Swift::Int *a1)
{
  return FeedItemProminence.init(rawValue:)(*a1);
}

uint64_t sub_1C27668A0()
{
  return sub_1C277BA10();
}

void ProminenceFeatureTag.value.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_1C2766910()
{
  unint64_t result = qword_1EA3058D0;
  if (!qword_1EA3058D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3058D0);
  }
  return result;
}

unsigned char *sub_1C276696C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C2766A38);
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

id static DataType.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1C0D0]);
  uint64_t v1 = (void *)sub_1C277B820();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

char *keypath_get_selector_codeRaw()
{
  return sel_codeRaw;
}

id sub_1C2766AD4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_codeRaw);
  *a2 = result;
  return result;
}

id sub_1C2766B08(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCodeRaw_, *a1);
}

uint64_t sub_1C2766B24(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a5;
  uint64_t v30 = a8;
  uint64_t v10 = v9;
  os_log_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v28 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v40 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  unint64_t v15 = (char *)&v26 - v14;
  MEMORY[0x1F4188790](v13);
  uint64_t v33 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v31 = *(void *)(v17 - 8);
  uint64_t v32 = v17;
  MEMORY[0x1F4188790](v17);
  id v19 = (char *)&v26 - v18;
  uint64_t v34 = v8;
  uint64_t v20 = sub_1C277BC40();
  if (!v20) {
    return sub_1C277BAA0();
  }
  uint64_t v21 = v20;
  unint64_t v27 = v15;
  uint64_t v43 = sub_1C277B740();
  uint64_t v35 = sub_1C277C410();
  sub_1C277C3B0();
  uint64_t v41 = v19;
  uint64_t result = sub_1C277BC30();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v23 = (void (**)(char *))(v36 + 2);
    ++v36;
    uint64_t v37 = v23;
    unint64_t v24 = v27;
    while (1)
    {
      id v25 = (void (*)(char *, void))sub_1C277BC70();
      (*v37)(v24);
      v25(v42, 0);
      v38(v24, v40);
      if (v10) {
        break;
      }
      uint64_t v10 = 0;
      (*v36)(v24, AssociatedTypeWitness);
      sub_1C277C3F0();
      sub_1C277BC50();
      if (!--v21)
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v32);
        return v43;
      }
    }
    (*v36)(v24, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v32);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v28 + 32))(v30, v40, v29);
  }
  return result;
}

uint64_t Collection<>.asProfiles(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v10[2] = a1;
  uint64_t v5 = type metadata accessor for Profile();
  unint64_t v7 = sub_1C2766B24((void (*)(char *, char *))sub_1C276744C, (uint64_t)v10, a2, v5, MEMORY[0x1E4FBC248], a3, MEMORY[0x1E4FBC278], v6);
  uint64_t v8 = sub_1C265C4C4(v7);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t SourceProfile.userProfiles.getter(void *a1)
{
  if (!a1) {
    return MEMORY[0x1E4FBC870];
  }
  sub_1C27674B8(0, &qword_1EBB85210, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = type metadata accessor for UserProfile();
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C277E480;
  id v5 = a1;
  id v6 = objc_msgSend(v5, sel_identifier);
  sub_1C277A880();

  *(void *)(v4 + v3 + *(int *)(v2 + 20)) = v5;
  uint64_t v7 = sub_1C2643840(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();

  return v7;
}

uint64_t Collection<>.sourceProfile.getter()
{
  sub_1C27674B8(0, qword_1EBB84FE0, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v6 - v1;
  if (sub_1C277BC40() > 1)
  {
    uint64_t result = sub_1C277C560();
    __break(1u);
  }
  else
  {
    sub_1C277BC60();
    uint64_t v3 = type metadata accessor for UserProfile();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v2, 1, v3) == 1)
    {
      sub_1C26D2F4C((uint64_t)v2);
      return 0;
    }
    else
    {
      id v4 = *(id *)&v2[*(int *)(v3 + 20)];
      sub_1C269B390((uint64_t)v2);
    }
    return (uint64_t)v4;
  }
  return result;
}

void SourceProfile.fetchProfiles(in:)(void *a1, void *a2)
{
  if (a2)
  {
    sub_1C27674B8(0, &qword_1EBB85210, MEMORY[0x1E4FBBE00]);
    uint64_t v5 = type metadata accessor for UserProfile();
    unint64_t v6 = (*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1C277E480;
    unint64_t v8 = v7 + v6;
    id v9 = a2;
    id v10 = objc_msgSend(v9, sel_identifier);
    sub_1C277A880();

    *(void *)(v8 + *(int *)(v5 + 20)) = v9;
    uint64_t v11 = sub_1C2643840(v7);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4FBC870];
  }
  id v12 = a2;
  id v13 = a1;
  unint64_t v14 = sub_1C26D27C0(v11, v13, a2);
  swift_bridgeObjectRelease();

  if (!v2)
  {
    sub_1C265C4C4(v14);
    swift_bridgeObjectRelease();
  }
}

id sub_1C276744C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  type metadata accessor for Profile();
  uint64_t v6 = type metadata accessor for UserProfile();
  id result = static Profile.findOrCreate(_:in:)(*(void **)(a1 + *(int *)(v6 + 20)), v5);
  *a2 = result;
  return result;
}

void sub_1C27674B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for UserProfile();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

id DataType.hkObjectType.getter()
{
  id v1 = objc_msgSend(self, sel_dataTypeWithCode_, objc_msgSend(v0, sel_codeRaw));

  return v1;
}

void *static DataType.findOrCreate(objectType:in:)(void *a1, void *a2)
{
  return sub_1C27678F8(a1, a2, 1);
}

id sub_1C2767664@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(self, sel_dataTypeWithCode_, objc_msgSend(*a1, sel_codeRaw));
  *a2 = result;
  return result;
}

void sub_1C27676C0(id *a1, void **a2)
{
  if (*a1)
  {
    uint64_t v2 = *a2;
    id v3 = *a1;
    objc_msgSend(v2, sel_setCodeRaw_, objc_msgSend(v3, sel_code));
  }
}

void DataType.hkObjectType.setter(void *a1)
{
  if (a1)
  {
    objc_msgSend(v1, sel_setCodeRaw_, objc_msgSend(a1, sel_code));
  }
}

void (*DataType.hkObjectType.modify(void *a1))(id *a1, char a2)
{
  a1[1] = v1;
  *a1 = objc_msgSend(self, sel_dataTypeWithCode_, objc_msgSend(v1, sel_codeRaw));
  return sub_1C276781C;
}

void sub_1C276781C(id *a1, char a2)
{
  id v2 = *a1;
  if (a2)
  {
    if (!v2)
    {
      id v4 = 0;
      goto LABEL_8;
    }
    id v3 = a1[1];
    id v5 = v2;
    objc_msgSend(v3, sel_setCodeRaw_, objc_msgSend(v5, sel_code));
  }
  else
  {
    if (!v2) {
      return;
    }
    id v5 = *a1;
    objc_msgSend(a1[1], sel_setCodeRaw_, objc_msgSend(*a1, sel_code));
  }
  id v4 = v5;
LABEL_8:
}

uint64_t static DataType.entityName.getter()
{
  return 0x6570795461746144;
}

void *sub_1C27678F8(void *a1, void *a2, char a3)
{
  id v4 = v3;
  id v7 = objc_msgSend(a1, sel_code);
  sub_1C2669068();
  sub_1C26322C0();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1C277E470;
  uint64_t v9 = MEMORY[0x1E4FBB5C8];
  *(void *)(v8 + 56) = MEMORY[0x1E4FBB550];
  *(void *)(v8 + 64) = v9;
  *(void *)(v8 + 32) = v7;
  *(void *)(v8 + 96) = MEMORY[0x1E4FBB1A0];
  *(void *)(v8 + 104) = sub_1C263226C();
  *(void *)(v8 + 72) = 0x77615265646F63;
  *(void *)(v8 + 80) = 0xE700000000000000;
  id v10 = (void *)sub_1C277BCC0();
  unint64_t v11 = sub_1C2669680(a2, (uint64_t)v10, a3);
  if (v3)
  {
  }
  else
  {
    id v4 = (void *)v11;
    if (v11)
    {
    }
    else
    {
      id v12 = self;
      id v13 = (void *)sub_1C277B820();
      id v14 = objc_msgSend(v12, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v13, a2);

      type metadata accessor for DataType();
      id v4 = (void *)swift_dynamicCastClassUnconditional();
    }
    objc_msgSend(v4, sel_setCodeRaw_, v7);
  }
  return v4;
}

uint64_t sub_1C2767AB0()
{
  return 0x6570795461746144;
}

uint64_t static DataType.predicate(for:)(uint64_t a1, uint64_t a2)
{
  sub_1C2669068();
  sub_1C26322C0();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C277E470;
  uint64_t v5 = MEMORY[0x1E4FBB1A0];
  *(void *)(v4 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v6 = sub_1C263226C();
  *(void *)(v4 + 32) = 0x6D65744964656566;
  *(void *)(v4 + 40) = 0xE900000000000073;
  *(void *)(v4 + 96) = v5;
  *(void *)(v4 + 104) = v6;
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 72) = a1;
  *(void *)(v4 + 80) = a2;
  swift_bridgeObjectRetain();
  return sub_1C277BCC0();
}

uint64_t static DataType.predicate(for:)()
{
  sub_1C2669068();
  sub_1C26322C0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1C277E470;
  uint64_t v1 = MEMORY[0x1E4FBB1A0];
  *(void *)(v0 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v2 = sub_1C263226C();
  *(void *)(v0 + 64) = v2;
  *(void *)(v0 + 32) = 0xD00000000000001DLL;
  *(void *)(v0 + 40) = 0x80000001C27901C0;
  unint64_t v3 = ContentKind.rawValue.getter();
  *(void *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = v2;
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 80) = v4;
  return sub_1C277BCC0();
}

uint64_t static DataType.predicate(isOneOfDataType:)(unint64_t a1)
{
  sub_1C26322C0();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1C277E470;
  *(void *)(v2 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v2 + 64) = sub_1C263226C();
  *(void *)(v2 + 32) = 0x77615265646F63;
  *(void *)(v2 + 40) = 0xE700000000000000;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v4 = MEMORY[0x1E4FBC860];
  if (!v3)
  {
LABEL_13:
    sub_1C2669068();
    sub_1C2767E3C();
    *(void *)(v2 + 96) = v12;
    *(void *)(v2 + 104) = sub_1C2767E94();
    *(void *)(v2 + 72) = v4;
    return sub_1C277BCC0();
  }
  uint64_t v14 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1C265A118(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v13 = v2;
    uint64_t v6 = 0;
    uint64_t v4 = v14;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x1C875C230](v6, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      id v9 = objc_msgSend(v7, sel_code, v13);

      unint64_t v11 = *(void *)(v14 + 16);
      unint64_t v10 = *(void *)(v14 + 24);
      if (v11 >= v10 >> 1) {
        sub_1C265A118(v10 > 1, v11 + 1, 1);
      }
      ++v6;
      *(void *)(v14 + 16) = v11 + 1;
      *(void *)(v14 + 8 * v11 + 32) = v9;
    }
    while (v3 != v6);
    uint64_t v2 = v13;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void sub_1C2767E3C()
{
  if (!qword_1EA3058D8)
  {
    unint64_t v0 = sub_1C277BB20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA3058D8);
    }
  }
}

unint64_t sub_1C2767E94()
{
  unint64_t result = qword_1EA3058E0;
  if (!qword_1EA3058E0)
  {
    sub_1C2767E3C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3058E0);
  }
  return result;
}

id Keyword.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id Keyword.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for Keyword();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for Keyword()
{
  return self;
}

id Keyword.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Keyword();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2768060(uint64_t a1, uint64_t a2)
{
  return sub_1C26440D0(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1C266A048, 0x6E6967756C50, 0xE600000000000000, (void (*)(void))type metadata accessor for Plugin);
}

uint64_t sub_1C276809C(uint64_t a1, uint64_t a2)
{
  return sub_1C26440D0(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1C266A528, 0x61446E6967756C50, 0xEA00000000006174, (void (*)(void))type metadata accessor for PluginData);
}

unint64_t sub_1C27680E0(void *a1, uint64_t a2)
{
  unint64_t result = sub_1C266AA10(a1, a2, 1);
  if (!result)
  {
    uint64_t v4 = self;
    id v5 = (void *)sub_1C277B820();
    objc_msgSend(v4, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v5, a1);

    type metadata accessor for FeedSection();
    return swift_dynamicCastClassUnconditional();
  }
  return result;
}

void *static Keyword.findOrCreate(_:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C2669068();
  sub_1C26322C0();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1C277E480;
  *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v6 + 64) = sub_1C263226C();
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  swift_bridgeObjectRetain();
  objc_super v7 = (void *)sub_1C277BCC0();
  uint64_t v8 = (void *)sub_1C26440D0(a3, (uint64_t)v7, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1C2669B64, 0x64726F7779654BLL, 0xE700000000000000, (void (*)(void))type metadata accessor for Keyword);

  id v9 = (void *)sub_1C277B820();
  objc_msgSend(v8, sel_setIdentifier_, v9);

  return v8;
}

uint64_t static Keyword.makePredicateForKeywordsWithFeedItems()()
{
  return sub_1C277BCC0();
}

uint64_t Keyword.__allocating_init(context:identifier:)(void *a1)
{
  uint64_t v3 = self;
  uint64_t v4 = (void *)sub_1C277B820();
  id v5 = objc_msgSend(v3, sel_entityForName_inManagedObjectContext_, v4, a1);

  if (v5)
  {
    id v6 = objc_msgSend(objc_allocWithZone(v1), sel_initWithEntity_insertIntoManagedObjectContext_, v5, a1);
    objc_super v7 = (void *)sub_1C277B820();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setIdentifier_, v7);

    return (uint64_t)v6;
  }
  else
  {
    uint64_t result = sub_1C277C560();
    __break(1u);
  }
  return result;
}

uint64_t static Keyword.entityName.getter()
{
  return 0x64726F7779654BLL;
}

uint64_t sub_1C2768550()
{
  return 0x64726F7779654BLL;
}

uint64_t sub_1C2768568(uint64_t a1)
{
  return sub_1C2768580(a1, (void (*)(void))type metadata accessor for FeedItem);
}

uint64_t sub_1C2768580(uint64_t a1, void (*a2)(void))
{
  sub_1C263FED0(a1, (uint64_t)v6);
  a2(0);
  if (swift_dynamicCast()) {
    return v5;
  }
  sub_1C263FED0(a1, (uint64_t)v6);
  sub_1C277C2D0();
  sub_1C277B8D0();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  swift_getDynamicType();
  sub_1C277C9E0();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1C277C560();
  __break(1u);
  return result;
}

uint64_t sub_1C27686A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
  uint64_t v3 = sub_1C26404F8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1C277C610();
  __break(1u);
  return result;
}

uint64_t sub_1C27687F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
  uint64_t v3 = sub_1C2637E48(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[6 * v8 + 4];
  if (a1 + 32 < v9 + 48 * v2 && v9 < a1 + 32 + 48 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1C277C610();
  __break(1u);
  return result;
}

uint64_t sub_1C2768950(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
  uint64_t v3 = sub_1C26907BC(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[7 * v8 + 4];
  if (a1 + 32 < v9 + 56 * v2 && v9 < a1 + 32 + 56 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1C277C610();
  __break(1u);
  return result;
}

uint64_t sub_1C2768AAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_1C269093C(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for ProtectedNotificationContentState(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1C277C610();
  __break(1u);
  return result;
}

uint64_t sub_1C2768C50(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (isUniquelyReferenced_nonNull_native)
  {
    uint64_t v8 = *(void *)(v3 + 24) >> 1;
    if (v8 >= v5)
    {
      unint64_t v9 = *(void *)(a1 + 16);
      if (v9) {
        goto LABEL_5;
      }
LABEL_17:
      if (!v2) {
        goto LABEL_18;
      }
      goto LABEL_22;
    }
  }
  if (v4 <= v5) {
    v4 += v2;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = MEMORY[0x1C875C240](isUniquelyReferenced_nonNull_native, v4, 1, v3);
  swift_bridgeObjectRelease();
  *uint64_t v1 = v3;
  uint64_t v8 = *(void *)(v3 + 24) >> 1;
  unint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_17;
  }
LABEL_5:
  uint64_t v10 = *(void *)(v3 + 16);
  if (v8 - v10 < (uint64_t)v9)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v11 = v3 + 8 * v10 + 32;
  if (a1 + 32 < v11 + 8 * v9 && v11 < a1 + 32 + 8 * v9) {
    goto LABEL_25;
  }
  sub_1C276B8F8();
  swift_arrayInitWithCopy();
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v13 = *(void *)(*v1 + 16);
  BOOL v14 = __OFADD__(v13, v9);
  uint64_t v15 = v13 + v9;
  if (v14)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    uint64_t result = sub_1C277C610();
    __break(1u);
    return result;
  }
  *(void *)(*v1 + 16) = v15;
LABEL_18:
  swift_bridgeObjectRelease();

  return sub_1C277BA60();
}

uint64_t sub_1C2768DF8(unint64_t a1)
{
  return sub_1C2768E10(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_1C276B194);
}

uint64_t sub_1C2768E10(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v6 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v2 = v6;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v7 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8) {
      uint64_t v11 = v8;
    }
    swift_bridgeObjectRetain();
    unint64_t v6 = MEMORY[0x1C875C240](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    unint64_t *v2 = v6;
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  swift_bridgeObjectRelease();

  return sub_1C277BA60();
}

uint64_t sub_1C2768FE4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
  uint64_t v3 = sub_1C2690ED8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[5 * v8 + 4];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2) {
    goto LABEL_24;
  }
  sub_1C262B07C(0, &qword_1EBB829B8);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1C277C610();
  __break(1u);
  return result;
}

uint64_t static Feed.entityName.getter()
{
  return 1684366662;
}

uint64_t sub_1C276916C()
{
  return 1684366662;
}

uint64_t Feed.addSection(identifier:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_managedObjectContext);
  if (v5)
  {
    unint64_t v6 = v5;
    sub_1C2644ED8(0, (unint64_t *)&qword_1EBB85100);
    sub_1C26322C0();
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1C277E470;
    *(void *)(v7 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v7 + 64) = sub_1C263226C();
    *(void *)(v7 + 32) = a1;
    *(void *)(v7 + 40) = a2;
    *(void *)(v7 + 96) = type metadata accessor for Feed();
    *(void *)(v7 + 104) = sub_1C276BA68(&qword_1EA3058E8, (void (*)(uint64_t))type metadata accessor for Feed);
    *(void *)(v7 + 72) = v2;
    swift_bridgeObjectRetain();
    id v8 = v2;
    unint64_t v9 = (void *)sub_1C277BCC0();
    uint64_t v10 = (void *)sub_1C27680E0(v6, (uint64_t)v9);
    uint64_t v11 = (void *)sub_1C277B820();
    objc_msgSend(v10, sel_setIdentifier_, v11);

    objc_msgSend(v10, sel_setFeed_, v8);
    return (uint64_t)v10;
  }
  else
  {
    uint64_t result = sub_1C277C560();
    __break(1u);
  }
  return result;
}

id Feed.__allocating_init(context:kind:associatedProfileIdentifier:dateUpdated:)(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = self;
  unint64_t v9 = (void *)sub_1C277B820();
  id v10 = objc_msgSend(v8, sel_entityForName_inManagedObjectContext_, v9, a1);

  if (!v10)
  {
    sub_1C277C560();
    __break(1u);
    JUMPOUT(0x1C2769610);
  }
  id v11 = objc_msgSend(objc_allocWithZone(v4), sel_initWithEntity_insertIntoManagedObjectContext_, v10, a1);
  BOOL v12 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setKindRawValue_, v12);

  if (a3)
  {
    type metadata accessor for Profile();
    id v13 = a3;
    id v14 = static Profile.findOrCreate(_:in:)(v13, (uint64_t)a1);
    objc_msgSend(v11, sel_setAssociatedProfile_, v14);
  }
  BOOL v15 = (void *)sub_1C277A7E0();
  objc_msgSend(v11, sel_setDateUpdated_, v15);

  uint64_t v16 = sub_1C277A840();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a4, v16);
  return v11;
}

void Feed.kind.setter()
{
  id v1 = (id)sub_1C277B820();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setKindRawValue_, v1);
}

uint64_t static Feed.feedKeyPathString(feedPrefixKeyPath:feedPropertyKeyPath:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_1C277B8D0();
    uint64_t v2 = a1;
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v5 = v2;
  swift_bridgeObjectRetain();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  return v5;
}

void *Feed.Kind.contentKinds.getter(char a1)
{
  uint64_t result = &unk_1F1DC5810;
  switch(a1)
  {
    case 1:
      uint64_t result = &unk_1F1DC5838;
      break;
    case 2:
      return result;
    case 3:
      if (qword_1EBB85960 != -1) {
        swift_once();
      }
      swift_beginAccess();
      uint64_t result = (void *)swift_bridgeObjectRetain();
      break;
    case 4:
      uint64_t result = &unk_1F1DC5860;
      break;
    case 5:
      uint64_t result = &unk_1F1DC58B0;
      break;
    default:
      uint64_t result = &unk_1F1DC5888;
      break;
  }
  return result;
}

void *static Feed.Kind.liveFeeds.getter()
{
  return &unk_1F1DC5928;
}

void *static Feed.Kind.relevanceRankedFeeds.getter()
{
  return &unk_1F1DC5950;
}

uint64_t Feed.Kind.description.getter()
{
  return 0x2E646E694BLL;
}

uint64_t sub_1C2769A54(unsigned __int8 *a1, unsigned char *a2)
{
  unint64_t v2 = 0xED000068746C6165;
  uint64_t v3 = 0x48726F4673707061;
  uint64_t v4 = *a1;
  unint64_t v5 = 0x48726F4673707061;
  unint64_t v6 = 0xED000068746C6165;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0x80000001C2789370;
      unint64_t v5 = 0xD000000000000011;
      break;
    case 2:
      unint64_t v5 = 0x6867696C68676968;
      unint64_t v6 = 0xEA00000000007374;
      break;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v5 = 0x73656369746F6ELL;
      break;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x73656C6369747261;
      break;
    case 5:
      unint64_t v6 = 0xE600000000000000;
      unint64_t v5 = 0x73646E657274;
      break;
    default:
      break;
  }
  switch(*a2)
  {
    case 1:
      unint64_t v2 = 0x80000001C2789370;
      if (v5 == 0xD000000000000011) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v2 = 0xEA00000000007374;
      if (v5 != 0x6867696C68676968) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v2 = 0xE700000000000000;
      if (v5 != 0x73656369746F6ELL) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x73656C6369747261;
      goto LABEL_15;
    case 5:
      unint64_t v2 = 0xE600000000000000;
      if (v5 != 0x73646E657274) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v3) {
        goto LABEL_19;
      }
LABEL_16:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_1C277C7E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1C2769C84()
{
  return sub_1C277C910();
}

uint64_t sub_1C2769DA8()
{
  sub_1C277B8B0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2769EB4()
{
  return sub_1C277C910();
}

uint64_t sub_1C2769FD4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_1C276A004(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0xED000068746C6165;
  unint64_t v3 = 0x48726F4673707061;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0x80000001C2789370;
      unint64_t v3 = 0xD000000000000011;
      goto LABEL_3;
    case 2:
      *a1 = 0x6867696C68676968;
      a1[1] = 0xEA00000000007374;
      break;
    case 3:
      *a1 = 0x73656369746F6ELL;
      a1[1] = 0xE700000000000000;
      break;
    case 4:
      *a1 = 0x73656C6369747261;
      a1[1] = 0xE800000000000000;
      break;
    case 5:
      *a1 = 0x73646E657274;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

void sub_1C276A0F0(void *a1@<X8>)
{
  *a1 = &unk_1F1DC58D8;
}

uint64_t sub_1C276A100()
{
  return sub_1C277BA00();
}

uint64_t sub_1C276A160()
{
  return sub_1C277B9E0();
}

uint64_t sub_1C276A1B0()
{
  return Feed.Kind.description.getter();
}

uint64_t Feed.kind.getter()
{
  id v1 = objc_msgSend(v0, sel_kindRawValue);
  sub_1C277B850();

  uint64_t result = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  if (result == 6)
  {
    uint64_t result = sub_1C277C560();
    __break(1u);
  }
  return result;
}

uint64_t sub_1C276A274@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_kindRawValue);
  sub_1C277B850();

  uint64_t result = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  if (result == 6)
  {
    uint64_t result = sub_1C277C560();
    __break(1u);
  }
  else
  {
    *a2 = result;
  }
  return result;
}

void sub_1C276A338(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  id v3 = (id)sub_1C277B820();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setKindRawValue_, v3);
}

void (*Feed.kind.modify(uint64_t a1))(void **a1)
{
  unint64_t v2 = v1;
  *(void *)a1 = v2;
  id v4 = objc_msgSend(v2, sel_kindRawValue);
  sub_1C277B850();

  char v5 = _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0();
  if (v5 == 6)
  {
    uint64_t result = (void (*)(void **))sub_1C277C560();
    __break(1u);
  }
  else
  {
    *(unsigned char *)(a1 + 8) = v5;
    return sub_1C276A564;
  }
  return result;
}

void sub_1C276A564(void **a1)
{
  id v1 = *a1;
  id v2 = (id)sub_1C277B820();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setKindRawValue_, v2);
}

uint64_t Feed.allFeedItems.getter()
{
  id v1 = objc_msgSend(v0, sel_sections);
  sub_1C273A014(v1, (uint64_t)sub_1C276B5FC, 0);
  uint64_t v3 = v2;

  if ((v3 & 0x8000000000000000) == 0 && (v3 & 0x4000000000000000) == 0)
  {
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4) {
      goto LABEL_4;
    }
LABEL_17:
    swift_release();
    uint64_t v7 = MEMORY[0x1E4FBC860];
    uint64_t v15 = *(void *)(MEMORY[0x1E4FBC860] + 16);
    if (v15)
    {
LABEL_13:
      swift_bridgeObjectRetain();
      uint64_t v16 = 0;
      uint64_t v17 = MEMORY[0x1E4FBC860];
      do
      {
        unint64_t v18 = *(void *)(v7 + 8 * v16++ + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C2768E10(v18, (uint64_t (*)(uint64_t, void, unint64_t))sub_1C276B3C8);
        swift_bridgeObjectRelease();
      }
      while (v15 != v16);
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v17 = MEMORY[0x1E4FBC860];
LABEL_19:
    swift_bridgeObjectRelease();
    return v17;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1C277C5A0();
  swift_release();
  if (!v4) {
    goto LABEL_17;
  }
LABEL_4:
  uint64_t v19 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1C265A138(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v19;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x1C875C230](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      unint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_feedItems);
      sub_1C2739FF4(v10, (uint64_t)sub_1C273A46C, 0);
      uint64_t v12 = v11;

      unint64_t v14 = *(void *)(v19 + 16);
      unint64_t v13 = *(void *)(v19 + 24);
      if (v14 >= v13 >> 1) {
        sub_1C265A138(v13 > 1, v14 + 1, 1);
      }
      ++v6;
      *(void *)(v19 + 16) = v14 + 1;
      *(void *)(v19 + 8 * v14 + 32) = v12;
    }
    while (v4 != v6);
    swift_release();
    uint64_t v15 = *(void *)(v19 + 16);
    if (v15) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t Feed.diagnosticDescription.getter()
{
  id v1 = v0;
  uint64_t v2 = sub_1C277A840();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C277A750();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  sub_1C277C2D0();
  sub_1C277B8D0();
  id v10 = objc_msgSend(v0, sel_objectID);
  id v11 = objc_msgSend(v10, sel_URIRepresentation);

  sub_1C277A6F0();
  sub_1C277A660();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  id v12 = objc_msgSend(v1, sel_kindRawValue);
  sub_1C277B850();

  if (_s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0() == 6) {
    goto LABEL_17;
  }
  Feed.Kind.description.getter();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  id v13 = objc_msgSend(v1, sel_dateUpdated);
  sub_1C277A810();

  sub_1C276BA68(&qword_1EBB82650, MEMORY[0x1E4F27928]);
  sub_1C277C7B0();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1C277B8D0();
  id v14 = objc_msgSend(v1, sel_kindRawValue);
  sub_1C277B850();

  if (_s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0() == 6) {
    goto LABEL_17;
  }
  Feed.Kind.description.getter();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  id v15 = objc_msgSend(v1, sel_sections);
  id v16 = objc_msgSend(v15, sel_count);

  v27[0] = v16;
  sub_1C277C7B0();
  sub_1C277B8D0();
  swift_bridgeObjectRelease();
  sub_1C277B8D0();
  uint64_t v17 = v28;
  id v18 = objc_msgSend(v1, sel_sections);
  sub_1C273A014(v18, (uint64_t)sub_1C276B5FC, 0);
  uint64_t v20 = v19;

  if (v20 < 0 || (v20 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1C277C5A0();
    swift_release();
    if (v21) {
      goto LABEL_6;
    }
LABEL_14:
    swift_release();
    return v17;
  }
  uint64_t v21 = *(void *)(v20 + 16);
  if (!v21) {
    goto LABEL_14;
  }
LABEL_6:
  if (v21 >= 1)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if ((v20 & 0xC000000000000001) != 0) {
        id v23 = (id)MEMORY[0x1C875C230](i, v20);
      }
      else {
        id v23 = *(id *)(v20 + 8 * i + 32);
      }
      unint64_t v24 = v23;
      v27[0] = 0;
      v27[1] = 0xE000000000000000;
      sub_1C277C2D0();
      swift_bridgeObjectRelease();
      strcpy((char *)v27, "FeedSection ");
      BYTE5(v27[1]) = 0;
      HIWORD(v27[1]) = -5120;
      v26[1] = i;
      sub_1C277C7B0();
      sub_1C277B8D0();
      swift_bridgeObjectRelease();
      sub_1C277B8D0();
      sub_1C277B8D0();
      swift_bridgeObjectRelease();
      FeedSection.diagnosticDescription.getter();
      sub_1C277B8D0();

      swift_bridgeObjectRelease();
    }
    swift_release();
    return v28;
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_1C277C560();
  __break(1u);
  return result;
}

uint64_t sub_1C276AF54(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1C26388B8();
        sub_1C276BA68(&qword_1EA305920, (void (*)(uint64_t))sub_1C26388B8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          id v12 = sub_1C26D2520(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1C2644ED8(0, (unint64_t *)&qword_1EBB82EE8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1C277C610();
  __break(1u);
  return result;
}

uint64_t sub_1C276B194(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1C276B9C4(0, &qword_1EA305910, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
        sub_1C276BA18(&qword_1EA305918, &qword_1EA305910, (void (*)(uint64_t))type metadata accessor for HealthPlatformContextProvider.Context);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          id v12 = sub_1C26D2588(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for HealthPlatformContextProvider.Context(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1C277C610();
  __break(1u);
  return result;
}

uint64_t sub_1C276B3C8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C277C5A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1C276B9C4(0, &qword_1EA304280, (void (*)(uint64_t))type metadata accessor for FeedItem);
        sub_1C276BA18(&qword_1EA305908, &qword_1EA304280, (void (*)(uint64_t))type metadata accessor for FeedItem);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          id v12 = sub_1C26D24B4(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for FeedItem();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1C277C610();
  __break(1u);
  return result;
}

uint64_t sub_1C276B5FC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1C2768580(a1, (void (*)(void))type metadata accessor for FeedSection);
  *a2 = result;
  return result;
}

uint64_t _s14HealthPlatform4FeedC4KindO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_1C277C650();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

unint64_t sub_1C276B688()
{
  unint64_t result = qword_1EBB829A0;
  if (!qword_1EBB829A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB829A0);
  }
  return result;
}

unint64_t sub_1C276B6E0()
{
  unint64_t result = qword_1EA3058F0;
  if (!qword_1EA3058F0)
  {
    sub_1C2632364(255, &qword_1EA3058F8, (uint64_t)&type metadata for Feed.Kind, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3058F0);
  }
  return result;
}

uint64_t _s4KindOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s4KindOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x1C276B8C0);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Feed.Kind()
{
  return &type metadata for Feed.Kind;
}

void sub_1C276B8F8()
{
  if (!qword_1EBB82C38)
  {
    sub_1C262B07C(255, (unint64_t *)&qword_1EBB831D0);
    unint64_t v0 = sub_1C277B340();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB82C38);
    }
  }
}

unint64_t sub_1C276B970()
{
  unint64_t result = qword_1EA305900;
  if (!qword_1EA305900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305900);
  }
  return result;
}

void sub_1C276B9C4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1C277BB20();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1C276BA18(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C276B9C4(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C276BA68(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C276BAB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, void *a6@<X5>, void *a7@<X6>, void *a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10, uint64_t a11)
{
  uint64_t v44 = a7;
  uint64_t v45 = a8;
  id v12 = a7;
  uint64_t v59 = a6;
  int v58 = a5;
  uint64_t v56 = a3;
  uint64_t v57 = a4;
  uint64_t v55 = a2;
  uint64_t v47 = a1;
  uint64_t v48 = a11;
  int v60 = a10;
  uint64_t v16 = type metadata accessor for GeneratorContext();
  uint64_t v46 = *(void *)(v16 - 8);
  uint64_t v17 = *(void *)(v46 + 64);
  MEMORY[0x1F4188790](v16 - 8);
  id v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_1C276D0B4;
  uint64_t v49 = sub_1C276D53C;
  sub_1C264677C(0, &qword_1EBB83658, (uint64_t (*)(uint64_t))sub_1C276D0B4, sub_1C276D53C, MEMORY[0x1E4F1A9A8]);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v51 = v19;
  uint64_t v52 = v20;
  MEMORY[0x1F4188790](v19);
  int64_t v22 = (char *)&v43 - v21;
  sub_1C276D570();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v53 = v23;
  uint64_t v54 = v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v26 = (char *)&v43 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v27 = v12;
  LOBYTE(v12) = v60;
  sub_1C2646704(a6, v27, a8, v60);
  sub_1C276D0B4(0);
  uint64_t v29 = v28;
  sub_1C276D53C();
  sub_1C277B550();
  sub_1C2646414(a1, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for GeneratorContext);
  unint64_t v30 = (*(unsigned __int8 *)(v46 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  unint64_t v31 = (v17 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v32 = swift_allocObject();
  sub_1C26467FC((uint64_t)v18, v32 + v30, (uint64_t (*)(void))type metadata accessor for GeneratorContext);
  unint64_t v33 = v32 + v31;
  uint64_t v34 = v59;
  uint64_t v36 = v44;
  uint64_t v35 = v45;
  *(void *)unint64_t v33 = v59;
  *(void *)(v33 + 8) = v36;
  *(void *)(v33 + 16) = v35;
  *(unsigned char *)(v33 + 24) = (_BYTE)v12;
  sub_1C2646704(v34, v36, v35, (char)v12);
  sub_1C2608654();
  sub_1C276D7D0(&qword_1EBB83650, &qword_1EBB83658, (uint64_t (*)(uint64_t))v50, v49);
  uint64_t v37 = v51;
  sub_1C277B500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v22, v37);
  sub_1C26463CC(&qword_1EBB83608, (void (*)(uint64_t))sub_1C276D570);
  uint64_t v38 = v53;
  uint64_t v39 = sub_1C277B4E0();
  uint64_t v40 = v59;
  LOBYTE(v37) = v60;
  sub_1C2645714(v59, v36, v35, v60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v48, v29);
  sub_1C2646908(v47);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v26, v38);
  uint64_t v42 = v56;
  *(void *)a9 = v55;
  *(void *)(a9 + 8) = v42;
  *(void *)(a9 + 16) = v57;
  *(unsigned char *)(a9 + 24) = v58;
  *(void *)(a9 + 32) = v39;
  *(void *)(a9 + 40) = v40;
  *(void *)(a9 + 48) = v36;
  *(void *)(a9 + 56) = v35;
  *(unsigned char *)(a9 + 64) = v37;
  return result;
}

uint64_t sub_1C276BEF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v42 = a3;
  uint64_t v5 = type metadata accessor for GeneratorContext();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v41 = (uint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C277AA10();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for FeatureStatusFeedItemGeneratorPipeline();
  uint64_t v12 = v11 - 8;
  uint64_t v38 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v38 + 64);
  MEMORY[0x1F4188790](v11);
  id v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C276D0B4(0);
  uint64_t v40 = v15;
  uint64_t v44 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v39 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v43 = (char *)&v37 - v18;
  sub_1C2646414(a2, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  unint64_t v19 = (*(unsigned __int8 *)(v38 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  unint64_t v20 = (v13 + *(unsigned __int8 *)(v8 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v21 = swift_allocObject();
  sub_1C26467FC((uint64_t)v14, v21 + v19, (uint64_t (*)(void))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v21 + v20, v10, v7);
  sub_1C276D0FC(0);
  sub_1C276D11C();
  int64_t v22 = v43;
  sub_1C277B4A0();
  uint64_t v23 = v41;
  sub_1C2646414(a2 + *(int *)(v12 + 28), v41, (uint64_t (*)(void))type metadata accessor for GeneratorContext);
  uint64_t v24 = *(void **)a2;
  uint64_t v25 = *(void *)(a2 + 8);
  uint64_t v26 = *(void *)(a2 + 16);
  uint64_t v27 = a2 + *(int *)(v12 + 32);
  uint64_t v28 = *(void **)v27;
  uint64_t v29 = *(void **)(v27 + 8);
  unint64_t v30 = *(void **)(v27 + 16);
  unint64_t v31 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  LOBYTE(v10) = *(unsigned char *)(v27 + 24);
  LODWORD(v38) = *(unsigned __int8 *)(a2 + 24);
  uint64_t v32 = (uint64_t)v39;
  unint64_t v33 = v22;
  uint64_t v34 = v40;
  v31(v39, v33, v40);
  id v35 = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C2646704(v28, v29, v30, (char)v10);
  sub_1C276BAB0(v23, (uint64_t)v24, v25, v26, v38, v28, v29, v30, v42, v10, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v43, v34);
}

uint64_t sub_1C276C2F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v46 = a5;
  uint64_t v47 = a2;
  uint64_t v44 = a1;
  uint64_t v7 = type metadata accessor for GeneratorContext();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v45 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v37 = AssociatedTypeWitness;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v41 = *(void *)(v10 + 64);
  uint64_t v11 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v14 = *(void *)(a3 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v17 = sub_1C277B4B0();
  uint64_t v43 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  uint64_t v42 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v38 = (char *)&v37 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v47, a3);
  uint64_t v21 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v44, AssociatedTypeWitness);
  unint64_t v22 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v23 = (v15 + v22 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a3;
  *(void *)(v24 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v24 + v22, v16, a3);
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v24 + v23, v21, v37);
  uint64_t v25 = v38;
  sub_1C277B4A0();
  uint64_t v26 = (uint64_t)v45;
  (*(void (**)(uint64_t, uint64_t))(a4 + 48))(a3, a4);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)(a4 + 8) + 16))(&v51, a3);
  uint64_t v48 = v51;
  long long v49 = v52;
  char v50 = v53;
  uint64_t v27 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  uint64_t v29 = v28;
  unint64_t v31 = v30;
  LOBYTE(a4) = v32;
  uint64_t v34 = (uint64_t)v42;
  uint64_t v33 = v43;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v42, v25, v17);
  swift_getWitnessTable();
  double v35 = FeedItemGenerator.init<A>(context:domain:feedItemPredicate:feedItemsPublisher:)(v26, (uint64_t)&v48, v27, v29, v31, a4, v34, v17, v46);
  return (*(uint64_t (**)(char *, uint64_t, double))(v33 + 8))(v25, v17, v35);
}

uint64_t sub_1C276C7BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C276C2F0(a1, v2+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80)), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1C276C7FC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C276C834@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 32);
  a2[3] = (uint64_t)&type metadata for FeedItemGenerator;
  a2[4] = (uint64_t)&protocol witness table for FeedItemGenerator;
  *a2 = swift_allocObject();
  return v4(a1);
}

uint64_t SynchronousChangePublisherFeedItemGeneratorPipeline.makeFeedItemsPublisher(change:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  v21[0] = a3;
  v21[1] = a4;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v12 = (char *)v21 - v11;
  uint64_t v13 = *(void *)(a2 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v5, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, AssociatedTypeWitness);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v17 = (v14 + v16 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v21[0];
  *(void *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v18 + v16, v15, a2);
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v17, v12, AssociatedTypeWitness);
  sub_1C276CE60(0, &qword_1EBB836F0, (uint64_t (*)(uint64_t))sub_1C261E938, MEMORY[0x1E4F1AC08]);
  sub_1C261DFC8();
  return sub_1C277B4A0();
}

uint64_t sub_1C276CB50()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, AssociatedTypeWitness);

  return MEMORY[0x1F4186498](v0, v10, v11);
}

uint64_t sub_1C276CCF0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  unint64_t v3 = ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))
     + *(void *)(*(void *)(v1 - 8) + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 16))(v0 + ((v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v1, v2);
  sub_1C261E938(0);
  return sub_1C277B440();
}

void sub_1C276CE60(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t dispatch thunk of ChangePublisherFeedItemGeneratorPipeline.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ChangePublisherFeedItemGeneratorPipeline.feedItemPredicate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ChangePublisherFeedItemGeneratorPipeline.changePublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of ChangePublisherFeedItemGeneratorPipeline.makeFeedItemsPublisher(change:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of SynchronousChangePublisherFeedItemGeneratorPipeline.makeFeedItems(change:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_1C276CF30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for FeatureStatusFeedItemGeneratorPipeline() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1C276BEF8(a1, v6, a2);
}

uint64_t sub_1C276CFB0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C276CFE8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 16);
  a2[3] = (uint64_t)&type metadata for FeedItemGenerator;
  a2[4] = (uint64_t)&protocol witness table for FeedItemGenerator;
  *a2 = swift_allocObject();
  return v4(a1);
}

uint64_t sub_1C276D054()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1C2645714(*(void **)(v0 + 56), *(void **)(v0 + 64), *(void **)(v0 + 72), *(unsigned char *)(v0 + 80));

  return MEMORY[0x1F4186498](v0, 81, 7);
}

void sub_1C276D0B4(uint64_t a1)
{
}

void sub_1C276D0FC(uint64_t a1)
{
}

uint64_t sub_1C276D11C()
{
  return sub_1C26463CC(&qword_1EBB836C0, sub_1C276D0FC);
}

uint64_t sub_1C276D150@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v25 = a3;
  uint64_t v4 = sub_1C277AA10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = type metadata accessor for FeatureStatusFeedItemGeneratorPipeline();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C264677C(0, (unint64_t *)&qword_1EBB82D98, (uint64_t (*)(uint64_t))sub_1C2682888, sub_1C276D834, MEMORY[0x1E4F1AC50]);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v23 = v11;
  uint64_t v24 = v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v22 - v13;
  sub_1C2646414(a1, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  uint64_t v15 = v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v22, v4);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + *(unsigned __int8 *)(v5 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v18 = swift_allocObject();
  sub_1C26467FC((uint64_t)v10, v18 + v16, (uint64_t (*)(void))type metadata accessor for FeatureStatusFeedItemGeneratorPipeline);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v18 + v17, (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  sub_1C2682888();
  sub_1C276D834();
  sub_1C277B4A0();
  sub_1C276D86C();
  uint64_t v19 = v23;
  uint64_t v20 = sub_1C277B4E0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v19);
  *uint64_t v25 = v20;
  return result;
}

uint64_t sub_1C276D468@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for FeatureStatusFeedItemGeneratorPipeline() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_1C277AA10() - 8);
  uint64_t v7 = v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_1C276D150(v1 + v4, v7, a1);
}

uint64_t sub_1C276D53C()
{
  return sub_1C26463CC(&qword_1EBB83710, sub_1C276D0B4);
}

void sub_1C276D570()
{
  if (!qword_1EBB83610)
  {
    sub_1C264677C(255, &qword_1EBB83658, (uint64_t (*)(uint64_t))sub_1C276D0B4, sub_1C276D53C, MEMORY[0x1E4F1A9A8]);
    sub_1C2608654();
    sub_1C276D7D0(&qword_1EBB83650, &qword_1EBB83658, (uint64_t (*)(uint64_t))sub_1C276D0B4, sub_1C276D53C);
    unint64_t v0 = sub_1C277B1E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB83610);
    }
  }
}

uint64_t sub_1C276D658()
{
  uint64_t v1 = (int *)type metadata accessor for GeneratorContext();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;

  uint64_t v6 = (id *)(v0 + v3 + v1[5]);
  sub_1C264C860();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = (char *)v6 + *(int *)(type metadata accessor for CountryRetrievalRecord() + 24);
    uint64_t v8 = sub_1C277A840();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  unint64_t v9 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_0(v5 + v1[7]);
  __swift_destroy_boxed_opaque_existential_0(v5 + v1[8]);
  sub_1C2645714(*(void **)(v0 + v9), *(void **)(v0 + v9 + 8), *(void **)(v0 + v9 + 16), *(unsigned char *)(v0 + v9 + 24));

  return MEMORY[0x1F4186498](v0, v9 + 25, v2 | 7);
}

uint64_t sub_1C276D7D0(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C264677C(255, a2, a3, a4, MEMORY[0x1E4F1A9A8]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C276D834()
{
  return sub_1C26463CC(&qword_1EBB82B48, (void (*)(uint64_t))sub_1C2682888);
}

unint64_t sub_1C276D86C()
{
  unint64_t result = qword_1EBB82D90;
  if (!qword_1EBB82D90)
  {
    sub_1C264677C(255, (unint64_t *)&qword_1EBB82D98, (uint64_t (*)(uint64_t))sub_1C2682888, sub_1C276D834, MEMORY[0x1E4F1AC50]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB82D90);
  }
  return result;
}

uint64_t sub_1C276D908()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, AssociatedTypeWitness);

  return MEMORY[0x1F4186498](v0, v10, v11);
}

uint64_t sub_1C276DAAC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  unint64_t v3 = ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))
     + *(void *)(*(void *)(v1 - 8) + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v2 + 72))(v0 + ((v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v1, v2);
}

void sub_1C276DBF8()
{
  uint64_t v1 = v0;
  v53[1] = *(id *)MEMORY[0x1E4F143B8];
  sub_1C276E39C(0, (unint64_t *)&qword_1EBB84F30, MEMORY[0x1E4F276F0]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v50 - v3;
  uint64_t v5 = sub_1C277A750();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)&v50 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v50 - v13;
  id v15 = objc_msgSend(v1, sel_URL);
  if (v15)
  {
    unint64_t v16 = v15;
    sub_1C277A6F0();

    unint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v17(v4, v12, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v17(v14, v4, v5);
      if (qword_1EBB86260 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_1C277B130();
      __swift_project_value_buffer(v18, (uint64_t)qword_1EBB86280);
      uint64_t v19 = sub_1C277B100();
      os_log_type_t v20 = sub_1C277BD00();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_1C2601000, v19, v20, "Destroying Core Data persistent store", v21, 2u);
        MEMORY[0x1C875D230](v21, -1, -1);
      }

      id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C120]), sel_init);
      id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C188]), sel_initWithManagedObjectModel_, v22);

      uint64_t v24 = (void *)sub_1C277A6A0();
      id v25 = objc_msgSend(v1, sel_type);
      if (!v25)
      {
        sub_1C277B850();
        id v25 = (id)sub_1C277B820();
        swift_bridgeObjectRelease();
      }
      v53[0] = 0;
      unsigned int v26 = objc_msgSend(v23, sel_destroyPersistentStoreAtURL_withType_options_error_, v24, v25, 0, v53);

      if (v26)
      {
        uint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
        id v28 = v53[0];
        v27(v14, v5);
      }
      else
      {
        id v36 = v53[0];
        uint64_t v37 = (void *)sub_1C277A620();

        swift_willThrow();
        (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v14, v5);
        id v38 = v37;
        id v39 = v37;
        uint64_t v40 = sub_1C277B100();
        os_log_type_t v41 = sub_1C277BD20();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = swift_slowAlloc();
          uint64_t v51 = (void *)swift_slowAlloc();
          v53[0] = v51;
          *(_DWORD *)uint64_t v42 = 136315394;
          uint64_t v43 = sub_1C277A660();
          uint64_t v52 = sub_1C263FDFC(v43, v44, (uint64_t *)v53);
          sub_1C277C0D0();
          swift_bridgeObjectRelease();
          char v50 = *(void (**)(char *, uint64_t))(v6 + 8);
          v50(v9, v5);
          *(_WORD *)(v42 + 12) = 2080;
          uint64_t v52 = (uint64_t)v37;
          id v45 = v37;
          sub_1C26532A4();
          uint64_t v46 = sub_1C277B860();
          uint64_t v52 = sub_1C263FDFC(v46, v47, (uint64_t *)v53);
          sub_1C277C0D0();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_1C2601000, v40, v41, "Could not destroy Core Data persistent store at %s Error: %s", (uint8_t *)v42, 0x16u);
          uint64_t v48 = v51;
          swift_arrayDestroy();
          MEMORY[0x1C875D230](v48, -1, -1);
          MEMORY[0x1C875D230](v42, -1, -1);

          v50(v14, v5);
        }
        else
        {

          long long v49 = *(void (**)(char *, uint64_t))(v6 + 8);
          v49(v9, v5);

          v49(v14, v5);
        }
      }
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_1C2685A3C((uint64_t)v4);
  if (qword_1EBB86260 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_1C277B130();
  __swift_project_value_buffer(v29, (uint64_t)qword_1EBB86280);
  id v30 = v1;
  unint64_t v31 = sub_1C277B100();
  os_log_type_t v32 = sub_1C277BD20();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 138412290;
    v53[0] = v30;
    id v35 = v30;
    sub_1C277C0D0();
    *uint64_t v34 = v30;

    _os_log_impl(&dword_1C2601000, v31, v32, "Can't destroy store at description because description has no URL: %@", v33, 0xCu);
    sub_1C276E39C(0, (unint64_t *)&qword_1EBB854A0, (void (*)(uint64_t))sub_1C2652E20);
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v34, -1, -1);
    MEMORY[0x1C875D230](v33, -1, -1);
  }
  else
  {
  }
}

void sub_1C276E39C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1C277C0B0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t SharableModelContext.sharableModelChangePublisher(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v5 = a1;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8[0] = v5;
  v8[1] = 0;
  uint64_t v6 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(a3 + 48))(v8, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

{
  uint64_t v5;
  uint64_t v6;
  void v8[2];

  uint64_t v5 = a1;
  if ((a1 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  if (!sub_1C277C1C0()) {
    goto LABEL_5;
  }
LABEL_3:
  swift_bridgeObjectRetain();
LABEL_6:
  v8[0] = 0;
  v8[1] = v5;
  uint64_t v6 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(a3 + 48))(v8, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t dispatch thunk of SharableModelContext.sourceProfile.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SharableModelContext.summarySharingEntryStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

void *assignWithCopy for PluginSharableModelQueryPredicate(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t HealthKitProvider.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HealthKitProvider.init()()
{
  return v0;
}

uint64_t HealthKitProvider.deinit()
{
  return v0;
}

uint64_t HealthKitProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t HealthKitProvider.environmentalStateComponents(observer:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C277B620();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C26431F4(0, &qword_1EBB83188, &qword_1EBB80D58);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1C277E480;
  *uint64_t v6 = 1;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCAE8], v3);
  type metadata accessor for SummaryPinnedContentStateComponent();
  swift_allocObject();
  uint64_t v8 = swift_unknownObjectRetain();
  uint64_t v9 = sub_1C26DCC78(v8, a2, (void *(*)(void *__return_ptr, uint64_t))sub_1C26DCBEC, 0, (uint64_t (*)(void *))sub_1C26DCC74, 0, (uint64_t)v6);
  uint64_t v10 = sub_1C276F500((unint64_t *)&unk_1EBB82980, (void (*)(uint64_t))type metadata accessor for SummaryPinnedContentStateComponent);
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v10;
  return v7;
}

uint64_t sub_1C276E7B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C277B620();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C26431F4(0, &qword_1EBB83188, &qword_1EBB80D58);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1C277E480;
  *uint64_t v6 = 1;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCAE8], v3);
  type metadata accessor for SummaryPinnedContentStateComponent();
  swift_allocObject();
  uint64_t v8 = swift_unknownObjectRetain();
  uint64_t v9 = sub_1C26DCC78(v8, a2, (void *(*)(void *__return_ptr, uint64_t))sub_1C26DCBEC, 0, (uint64_t (*)(void *))sub_1C26DCC74, 0, (uint64_t)v6);
  uint64_t v10 = sub_1C276F500((unint64_t *)&unk_1EBB82980, (void (*)(uint64_t))type metadata accessor for SummaryPinnedContentStateComponent);
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v10;
  return v7;
}

void *_s14HealthPlatform0A11KitProviderC12inputSignals3for8observerSay0A13Orchestration11InputSignal_pGAG11WorkContext_p_AG0jK8Observer_ptF_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v86 = a4;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C277B130();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  uint64_t v10 = swift_conformsToProtocol2();
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v10) {
    uint64_t v12 = a1;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
  if (v12)
  {
    uint64_t v81 = v7;
    uint64_t v82 = v6;
    uint64_t v87 = (void *)MEMORY[0x1E4FBC860];
    uint64_t ObjectType = swift_getObjectType();
    id v15 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 16);
    swift_unknownObjectRetain();
    uint64_t v84 = ObjectType;
    uint64_t v16 = v15(ObjectType, v11);
    uint64_t v85 = a1;
    if (v16)
    {
      unint64_t v17 = (void *)v16;
      uint64_t v80 = v9;
      sub_1C26431F4(0, &qword_1EBB83168, &qword_1EBB829B8);
      uint64_t v79 = v18;
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1C2788360;
      type metadata accessor for CloudSyncStatusInputSignal.ObserverShim();
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = v17;
      *(void *)(v20 + 24) = 0;
      uint64_t v21 = (objc_class *)type metadata accessor for CloudSyncStatusInputSignal();
      id v22 = (char *)objc_allocWithZone(v21);
      swift_unknownObjectRetain();
      id v78 = v17;
      uint64_t v83 = v11;
      uint64_t v23 = v86;
      id v24 = sub_1C275A1DC(a3, v86, v20, v22);
      swift_unknownObjectRelease();
      *(void *)(inited + 56) = v21;
      *(void *)(inited + 64) = sub_1C276F500(&qword_1EBB82910, (void (*)(uint64_t))type metadata accessor for CloudSyncStatusInputSignal);
      *(void *)(inited + 32) = v24;
      uint64_t InputSignal = type metadata accessor for DatabaseChangesQueryInputSignal();
      uint64_t v26 = *(void *)(v11 + 8);
      uint64_t v27 = (uint64_t)v12;
      uint64_t v28 = v23;
      uint64_t v29 = v78;
      id v30 = v12;
      uint64_t v31 = v84;
      os_log_type_t v32 = sub_1C267A8AC(v27, a3, v28, v78, InputSignal, v84, v26);
      *(void *)(inited + 96) = InputSignal;
      *(void *)(inited + 104) = sub_1C276F500(&qword_1EBB82978, (void (*)(uint64_t))type metadata accessor for DatabaseChangesQueryInputSignal);
      *(void *)(inited + 72) = v32;
      uint64_t v33 = type metadata accessor for FeatureStatusInputSignal();
      swift_unknownObjectRetain_n();
      swift_unknownObjectRetain_n();
      id v34 = v29;
      uint64_t v35 = v86;
      id v36 = sub_1C2680970((uint64_t)v30, a3, v86, (uint64_t)v34, v33, v31, v26);
      *(void *)(inited + 136) = v33;
      *(void *)(inited + 144) = sub_1C276F500(&qword_1EBB82818, (void (*)(uint64_t))type metadata accessor for FeatureStatusInputSignal);
      *(void *)(inited + 112) = v36;
      uint64_t v37 = type metadata accessor for HealthKitUnitPreferencesInputSignal();
      uint64_t v77 = v26;
      id v38 = sub_1C26EA2D0((uint64_t)v30, a3, v35, (uint64_t)v34, v37, v31, v26);
      *(void *)(inited + 176) = v37;
      *(void *)(inited + 184) = sub_1C276F500(&qword_1EBB826E8, (void (*)(uint64_t))type metadata accessor for HealthKitUnitPreferencesInputSignal);
      *(void *)(inited + 152) = v38;
      uint64_t v39 = type metadata accessor for ObjectTypeAnchorQueryInputSignal();
      uint64_t v40 = sub_1C2752214((uint64_t)v30, a3, v35, v34, v39, v31, v26);
      *(void *)(inited + 216) = v39;
      *(void *)(inited + 224) = sub_1C276F500(&qword_1EBB83E78, (void (*)(uint64_t))type metadata accessor for ObjectTypeAnchorQueryInputSignal);
      *(void *)(inited + 192) = v40;
      uint64_t v41 = type metadata accessor for SummarySharingInputSignal();
      uint64_t v42 = v83;
      uint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t))(v83 + 24);
      swift_unknownObjectRetain_n();
      swift_unknownObjectRetain_n();
      id v78 = v34;
      uint64_t v44 = v43(v31, v42);
      uint64_t v45 = v86;
      uint64_t v46 = v77;
      unint64_t v47 = sub_1C26AAF3C((uint64_t)v30, a3, v86, v44, v41, v31, v77);
      *(void *)(inited + 256) = v41;
      *(void *)(inited + 264) = sub_1C276F500((unint64_t *)&unk_1EBB82878, (void (*)(uint64_t))type metadata accessor for SummarySharingInputSignal);
      *(void *)(inited + 232) = v47;
      uint64_t v48 = type metadata accessor for SummaryTransactionInputSignal();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      id v49 = v78;
      uint64_t v50 = v45;
      uint64_t v51 = v46;
      uint64_t v52 = sub_1C2727CFC((uint64_t)v30, a3, v50, (uint64_t)v49, v48, v31, v46);
      *(void *)(inited + 296) = v48;
      *(void *)(inited + 304) = sub_1C276F500(&qword_1EBB82930, (void (*)(uint64_t))type metadata accessor for SummaryTransactionInputSignal);
      *(void *)(inited + 272) = v52;
      char v53 = (objc_class *)type metadata accessor for MedicalIDChangesInputSignal();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      id v54 = v49;
      id v78 = v30;
      id v55 = sub_1C270E240((uint64_t)v30, a3, v86, v54, 0, v53, v31, v51);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      *(void *)(inited + 336) = v53;
      *(void *)(inited + 344) = sub_1C276F500(&qword_1EBB843F0, (void (*)(uint64_t))type metadata accessor for MedicalIDChangesInputSignal);
      *(void *)(inited + 312) = v55;
      sub_1C2768FE4(inited);
      id v56 = objc_msgSend(v54, sel_profileIdentifier);
      id v57 = objc_msgSend(v56, sel_type);

      if (v57 == (id)2)
      {
        uint64_t v58 = swift_initStackObject();
        *(_OWORD *)(v58 + 16) = xmmword_1C277E480;
        uint64_t v59 = type metadata accessor for SummarySharingProfileDisplayNameInputSignal();
        swift_allocObject();
        swift_unknownObjectRetain();
        id v60 = v54;
        SummarySharingProfileDisplayNameInputSignal.init(observer:healthStore:)(a3, v86, v60);
        uint64_t v62 = v61;
        *(void *)(v58 + 56) = v59;
        *(void *)(v58 + 64) = sub_1C276F500(&qword_1EA305410, (void (*)(uint64_t))type metadata accessor for SummarySharingProfileDisplayNameInputSignal);
        *(void *)(v58 + 32) = v62;
        sub_1C2768FE4(v58);
      }
      id v63 = objc_msgSend(v54, sel_profileIdentifier);
      id v64 = objc_msgSend(v63, sel_type);

      if (v64 == (id)1)
      {
        uint64_t v65 = swift_initStackObject();
        *(_OWORD *)(v65 + 16) = xmmword_1C277E480;
        id v66 = (objc_class *)type metadata accessor for PregnancyStateInputSignal();
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        id v67 = v54;
        id v68 = sub_1C26BD1D4((uint64_t)v78, a3, v86, (uint64_t)v67, v66, v84, v51);
        *(void *)(v65 + 56) = v66;
        *(void *)(v65 + 64) = sub_1C276F500(&qword_1EBB82860, (void (*)(uint64_t))type metadata accessor for PregnancyStateInputSignal);
        *(void *)(v65 + 32) = v68;
        uint64_t v69 = swift_bridgeObjectRetain();
        sub_1C2768FE4(v69);

        swift_setDeallocating();
        sub_1C2621120(0, &qword_1EBB829B8);
        swift_arrayDestroy();
      }
      else
      {
      }
    }
    uint64_t v70 = type metadata accessor for HealthAppBuddyCompleteInputSignal();
    swift_allocObject();
    uint64_t v71 = swift_unknownObjectRetain();
    uint64_t v72 = HealthAppBuddyCompleteInputSignal.init(observer:)(v71, v86);
    uint64_t v13 = v87;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_1C2690ED8(0, v13[2] + 1, 1, v13);
    }
    unint64_t v74 = v13[2];
    unint64_t v73 = v13[3];
    if (v74 >= v73 >> 1) {
      uint64_t v13 = sub_1C2690ED8((void *)(v73 > 1), v74 + 1, 1, v13);
    }
    uint64_t v89 = v70;
    uint64_t v90 = sub_1C276F500(&qword_1EBB826B8, (void (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal);
    *(void *)&long long v88 = v72;
    void v13[2] = v74 + 1;
    sub_1C261F308(&v88, (uint64_t)&v13[5 * v74 + 4]);
    swift_unknownObjectRelease();
    swift_release();
  }
  return v13;
}

uint64_t dispatch thunk of HealthStoreContext.optionalHealthStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthStoreContext.primaryProfileHealthStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for HealthKitProvider()
{
  return self;
}

uint64_t method lookup function for HealthKitProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthKitProvider);
}

uint64_t dispatch thunk of HealthKitProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_1C276F500(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t UserProfile.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void *)Profile.hkProfileIdentifier.getter();
  id v5 = objc_msgSend(v4, sel_identifier);
  sub_1C277A880();

  uint64_t result = type metadata accessor for UserProfile();
  *(void *)(a2 + *(int *)(result + 20)) = v4;
  return result;
}

HealthPlatform::FeedItemTimeScope_optional __swiftcall FeedItemTimeScope.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1C277C650();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static FeedItemTimeScope.allCases.getter()
{
  return &unk_1F1DC5AC0;
}

uint64_t FeedItemTimeScope.rawValue.getter()
{
  uint64_t result = 1920298856;
  switch(*v0)
  {
    case 1:
      uint64_t result = 7954788;
      break;
    case 2:
      uint64_t result = 1801807223;
      break;
    case 3:
      uint64_t result = 0x68746E6F6DLL;
      break;
    case 4:
      uint64_t result = 1918985593;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C276F69C()
{
  return sub_1C277C910();
}

uint64_t sub_1C276F768()
{
  sub_1C277B8B0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C276F81C()
{
  return sub_1C277C910();
}

HealthPlatform::FeedItemTimeScope_optional sub_1C276F8E4(Swift::String *a1)
{
  return FeedItemTimeScope.init(rawValue:)(*a1);
}

void sub_1C276F8F0(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1920298856;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE300000000000000;
      uint64_t v3 = 7954788;
      goto LABEL_3;
    case 2:
      *a1 = 1801807223;
      a1[1] = 0xE400000000000000;
      break;
    case 3:
      *a1 = 0x68746E6F6DLL;
      a1[1] = 0xE500000000000000;
      break;
    case 4:
      *a1 = 1918985593;
      a1[1] = 0xE400000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_1C276F980()
{
  return sub_1C277BA00();
}

uint64_t sub_1C276F9E0()
{
  return sub_1C277B9E0();
}

uint64_t sub_1C276FA30(unsigned __int8 *a1, char *a2)
{
  return sub_1C273DC9C(*a1, *a2);
}

void sub_1C276FA3C(void *a1@<X8>)
{
  *a1 = &unk_1F1DC5AE8;
}

void TimeScopeFeatureTag.value.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

HealthPlatform::TimeScopeFeatureTag __swiftcall TimeScopeFeatureTag.init(_:)(HealthPlatform::TimeScopeFeatureTag result)
{
  *uint64_t v1 = *(unsigned char *)result.value;
  return result;
}

unint64_t sub_1C276FA68()
{
  unint64_t result = qword_1EA305928;
  if (!qword_1EA305928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305928);
  }
  return result;
}

unint64_t sub_1C276FAC0()
{
  unint64_t result = qword_1EA305930;
  if (!qword_1EA305930)
  {
    sub_1C276FB18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305930);
  }
  return result;
}

void sub_1C276FB18()
{
  if (!qword_1EA305938)
  {
    unint64_t v0 = sub_1C277BB20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA305938);
    }
  }
}

ValueMetadata *type metadata accessor for FeedItemTimeScope()
{
  return &type metadata for FeedItemTimeScope;
}

unsigned char *_s14HealthPlatform17FeedItemTimeScopeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x1C276FC54);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeScopeFeatureTag()
{
  return &type metadata for TimeScopeFeatureTag;
}

unint64_t sub_1C276FC8C()
{
  unint64_t result = qword_1EBB857D8;
  if (!qword_1EBB857D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB857D8);
  }
  return result;
}

uint64_t RelevantDateInterval.init(interval:rampUpTime:rampDownTime:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = sub_1C277A520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a2, a1, v8);
  uint64_t result = type metadata accessor for RelevantDateInterval();
  *(double *)(a2 + *(int *)(result + 20)) = a3;
  *(double *)(a2 + *(int *)(result + 24)) = a4;
  return result;
}

uint64_t RelevantDateInterval.init(interval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1C277A520();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RelevantDateInterval();
  uint64_t v15 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4) == 1)
  {
    sub_1C277114C(a1, (uint64_t (*)(void))sub_1C265D068);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
    return v11(a2, 1, 1, v8);
  }
  else
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 32);
    v13(v7, a1, v4);
    v13(v10, (uint64_t)v7, v4);
    *(void *)&v10[*(int *)(v8 + 20)] = 0;
    *(void *)&v10[*(int *)(v8 + 24)] = 0;
    sub_1C268F220((uint64_t)v10, a2);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a2, 0, 1, v8);
  }
}

uint64_t RelevantDateInterval.interval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1C277A520();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t RelevantDateInterval.interval.setter(uint64_t a1)
{
  uint64_t v3 = sub_1C277A520();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*RelevantDateInterval.interval.modify())()
{
  return nullsub_1;
}

double RelevantDateInterval.rampUpTime.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for RelevantDateInterval() + 20));
}

uint64_t RelevantDateInterval.rampUpTime.setter(double a1)
{
  uint64_t result = type metadata accessor for RelevantDateInterval();
  *(double *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*RelevantDateInterval.rampUpTime.modify())()
{
  return nullsub_1;
}

double RelevantDateInterval.rampDownTime.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for RelevantDateInterval() + 24));
}

uint64_t RelevantDateInterval.rampDownTime.setter(double a1)
{
  uint64_t result = type metadata accessor for RelevantDateInterval();
  *(double *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*RelevantDateInterval.rampDownTime.modify())()
{
  return nullsub_1;
}

uint64_t RelevantDateInterval.dateOfInitialRelevance.getter()
{
  uint64_t v0 = sub_1C277A840();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C277A510();
  type metadata accessor for RelevantDateInterval();
  sub_1C277A7D0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t RelevantDateInterval.dateOfFinalRelevance.getter()
{
  uint64_t v0 = sub_1C277A840();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C277A4F0();
  type metadata accessor for RelevantDateInterval();
  sub_1C277A7D0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t RelevantDateInterval.init(date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v3 = sub_1C277A840();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = sub_1C277A520();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v14(v9, a1, v3);
  v14(v7, a1, v3);
  sub_1C277A500();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  uint64_t v15 = v18;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v18, v13, v10);
  uint64_t result = type metadata accessor for RelevantDateInterval();
  *(void *)(v15 + *(int *)(result + 20)) = 0;
  *(void *)(v15 + *(int *)(result + 24)) = 0;
  return result;
}

BOOL static RelevantDateInterval.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_1C277A4E0() & 1) != 0
    && (uint64_t v4 = type metadata accessor for RelevantDateInterval(),
        *(double *)(a1 + *(int *)(v4 + 20)) == *(double *)(a2 + *(int *)(v4 + 20))))
  {
    return *(double *)(a1 + *(int *)(v4 + 24)) == *(double *)(a2 + *(int *)(v4 + 24));
  }
  else
  {
    return 0;
  }
}

uint64_t RelevantDateInterval.hash(into:)()
{
  return sub_1C277C900();
}

uint64_t sub_1C27706A8()
{
  uint64_t v1 = 0x69547055706D6172;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E776F44706D6172;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6C61767265746E69;
  }
}

uint64_t sub_1C2770710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C2771828(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C2770738(uint64_t a1)
{
  unint64_t v2 = sub_1C27709A8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C2770774(uint64_t a1)
{
  unint64_t v2 = sub_1C27709A8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t RelevantDateInterval.encode(to:)(void *a1)
{
  sub_1C2771084(0, &qword_1EBB83768, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = &v9[-v6];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C27709A8();
  sub_1C277C9B0();
  v9[15] = 0;
  sub_1C277A520();
  sub_1C26514B4(&qword_1EBB831F8, MEMORY[0x1E4F26E60]);
  sub_1C277C760();
  if (!v1)
  {
    type metadata accessor for RelevantDateInterval();
    v9[14] = 1;
    sub_1C277C740();
    v9[13] = 2;
    sub_1C277C740();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1C27709A8()
{
  unint64_t result = qword_1EBB853B0;
  if (!qword_1EBB853B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB853B0);
  }
  return result;
}

uint64_t RelevantDateInterval.hashValue.getter()
{
  return sub_1C277C910();
}

uint64_t RelevantDateInterval.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v4 = sub_1C277A520();
  uint64_t v23 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v25 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2771084(0, &qword_1EBB80F30, MEMORY[0x1E4FBBDC0]);
  uint64_t v24 = v6;
  uint64_t v22 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = type metadata accessor for RelevantDateInterval();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C27709A8();
  sub_1C277C9A0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v12 = (uint64_t)v11;
  uint64_t v13 = v23;
  char v28 = 0;
  sub_1C26514B4(&qword_1EBB80F28, MEMORY[0x1E4F26E60]);
  uint64_t v14 = v24;
  sub_1C277C6D0();
  uint64_t v15 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  uint64_t v16 = v25;
  id v25 = (char *)v4;
  v15(v12, v16, v4);
  char v27 = 1;
  sub_1C277C6B0();
  *(void *)(v12 + *(int *)(v9 + 20)) = v17;
  char v26 = 2;
  sub_1C277C6B0();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v14);
  *(void *)(v12 + *(int *)(v9 + 24)) = v19;
  sub_1C27710E8(v12, v21);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1C277114C(v12, (uint64_t (*)(void))type metadata accessor for RelevantDateInterval);
}

uint64_t sub_1C2770E70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RelevantDateInterval.init(from:)(a1, a2);
}

uint64_t sub_1C2770E88(void *a1)
{
  return RelevantDateInterval.encode(to:)(a1);
}

BOOL sub_1C2770EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_1C277A4E0() & 1) != 0
      && *(double *)(a1 + *(int *)(a3 + 20)) == *(double *)(a2 + *(int *)(a3 + 20))
      && *(double *)(a1 + *(int *)(a3 + 24)) == *(double *)(a2 + *(int *)(a3 + 24));
}

uint64_t sub_1C2770F0C()
{
  return sub_1C277C900();
}

uint64_t sub_1C2770FC0()
{
  return sub_1C277C910();
}

void sub_1C2771084(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1C27709A8();
    unint64_t v7 = a3(a1, &type metadata for RelevantDateInterval.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1C27710E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RelevantDateInterval();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C277114C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C27711AC()
{
  return sub_1C26514B4(&qword_1EA305940, (void (*)(uint64_t))type metadata accessor for RelevantDateInterval);
}

uint64_t *initializeBufferWithCopyOfBuffer for RelevantDateInterval(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C277A520();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
  }
  return a1;
}

uint64_t destroy for RelevantDateInterval(uint64_t a1)
{
  uint64_t v2 = sub_1C277A520();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for RelevantDateInterval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C277A520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t assignWithCopy for RelevantDateInterval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C277A520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for RelevantDateInterval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C277A520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for RelevantDateInterval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C277A520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_1C2771540(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C277A520();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1C27715AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C277A520();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

unsigned char *storeEnumTagSinglePayload for RelevantDateInterval.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C27716E8);
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

ValueMetadata *type metadata accessor for RelevantDateInterval.CodingKeys()
{
  return &type metadata for RelevantDateInterval.CodingKeys;
}

unint64_t sub_1C2771724()
{
  unint64_t result = qword_1EA305948;
  if (!qword_1EA305948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305948);
  }
  return result;
}

unint64_t sub_1C277177C()
{
  unint64_t result = qword_1EBB853C0;
  if (!qword_1EBB853C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB853C0);
  }
  return result;
}

unint64_t sub_1C27717D4()
{
  unint64_t result = qword_1EBB853B8;
  if (!qword_1EBB853B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB853B8);
  }
  return result;
}

uint64_t sub_1C2771828(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C61767265746E69 && a2 == 0xE800000000000000;
  if (v2 || (sub_1C277C7E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69547055706D6172 && a2 == 0xEA0000000000656DLL || (sub_1C277C7E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E776F44706D6172 && a2 == 0xEC000000656D6954)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1C277C7E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t HealthAppBuddyCompleteInputSignal.__allocating_init(observer:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  HealthAppBuddyCompleteInputSignal.init(observer:)(a1, a2);
  return v4;
}

uint64_t static InputSignalIdentifier.healthAppBuddyComplete.getter()
{
  return sub_1C277AED0();
}

uint64_t static InputSignalSet.LookupKey.healthAppBuddyComplete.getter()
{
  uint64_t v0 = sub_1C277AEE0();
  MEMORY[0x1F4188790](v0 - 8);
  sub_1C277AED0();
  type metadata accessor for HealthAppBuddyCompleteInputSignal();
  return sub_1C277ACD0();
}

uint64_t sub_1C2771AB8(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = sub_1C2771B30(MEMORY[0x1E4F2BD78]);

  return v2 & 1;
}

uint64_t sub_1C2771AF4(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = sub_1C2771B30(MEMORY[0x1E4F2BD70]);

  return v2 & 1;
}

id sub_1C2771B30(void *a1)
{
  if (objc_msgSend(v1, sel_valueForKey_, *a1))
  {
    sub_1C277C110();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_1C262C460((uint64_t)v5, (uint64_t)v6);
  if (!v7)
  {
    sub_1C262F2E4((uint64_t)v6);
    return 0;
  }
  sub_1C2644ED8(0, &qword_1EBB851C0);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v2 = objc_msgSend(v4, sel_BOOLValue);

  return v2;
}

uint64_t sub_1C2771C14(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = sub_1C2771B30(MEMORY[0x1E4F2BD88]);

  return v2 & 1;
}

uint64_t HealthAppBuddyCompleteInputSignal.identifier.getter()
{
  return sub_1C277AED0();
}

uint64_t HealthAppBuddyCompleteInputSignal.observer.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t static HealthAppBuddyCompleteInputSignal.Errors.== infix(_:_:)()
{
  return 1;
}

uint64_t HealthAppBuddyCompleteInputSignal.Errors.hash(into:)()
{
  return sub_1C277C8D0();
}

uint64_t HealthAppBuddyCompleteInputSignal.Errors.hashValue.getter()
{
  return sub_1C277C910();
}

uint64_t *HealthAppBuddyCompleteInputSignal.init(observer:)(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a2;
  uint64_t v16 = a1;
  uint64_t v14 = *v2;
  sub_1C2771F90();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2771FF8();
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 24) = 0;
  *(void *)(v8 + 16) = 0;
  v2[4] = v8;
  sub_1C277B850();
  id v9 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v10 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithSuiteName_, v10, v14);

  if (v11)
  {
    uint64_t v12 = v15;
    v2[2] = v16;
    v2[3] = v12;
    id v17 = v11;
    sub_1C2644ED8(0, &qword_1EBB82EE0);
    sub_1C277AD60();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v2 + OBJC_IVAR____TtC14HealthPlatform33HealthAppBuddyCompleteInputSignal_defaults, v7, v4);
  }
  else
  {
    sub_1C2772058();
    swift_allocError();
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_release();
    swift_deallocPartialClassInstance();
  }
  return v2;
}

uint64_t type metadata accessor for HealthAppBuddyCompleteInputSignal()
{
  uint64_t result = qword_1EBB826C0;
  if (!qword_1EBB826C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1C2771F90()
{
  if (!qword_1EBB829D8)
  {
    sub_1C2644ED8(255, &qword_1EBB82EE0);
    unint64_t v0 = sub_1C277AD50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB829D8);
    }
  }
}

void sub_1C2771FF8()
{
  if (!qword_1EBB83038)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_1C277C370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB83038);
    }
  }
}

unint64_t sub_1C2772058()
{
  unint64_t result = qword_1EA305950;
  if (!qword_1EA305950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305950);
  }
  return result;
}

void sub_1C27720B0(void **a1)
{
  unsigned __int8 v2 = (objc_class *)type metadata accessor for HealthAppBuddyCompleteInputSignal.Observer();
  id v3 = objc_allocWithZone(v2);
  swift_weakInit();
  swift_weakAssign();
  v13.receiver = v3;
  v13.super_class = v2;
  id v4 = objc_msgSendSuper2(&v13, sel_init);
  uint64_t v5 = *a1;
  id v6 = v4;

  *a1 = v4;
  sub_1C277B850();
  sub_1C277B850();
  sub_1C277B850();
  sub_1C2771F90();
  swift_bridgeObjectRetain();
  sub_1C277AD40();
  uint64_t v7 = v14;
  uint64_t v8 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_addObserver_forKeyPath_options_context_, v6, v8, 0, 0);

  swift_bridgeObjectRetain();
  sub_1C277AD40();
  id v9 = v14;
  uint64_t v10 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_addObserver_forKeyPath_options_context_, v6, v10, 0, 0);

  swift_bridgeObjectRetain();
  sub_1C277AD40();
  id v11 = v14;
  uint64_t v12 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_addObserver_forKeyPath_options_context_, v6, v12, 0, 0);

  swift_arrayDestroy();
}

Swift::Void __swiftcall HealthAppBuddyCompleteInputSignal.stopObservation()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 32);
  unsigned __int8 v2 = (void **)&v1[4];
  id v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_1C2772DE4(v2);
  os_unfair_lock_unlock(v3);
}

void sub_1C2772360(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    sub_1C277B850();
    sub_1C277B850();
    sub_1C277B850();
    sub_1C2771F90();
    sub_1C277AD40();
    unsigned __int8 v2 = (void *)sub_1C277B820();
    objc_msgSend(v5, sel_removeObserver_forKeyPath_, v1, v2);

    swift_bridgeObjectRetain();
    sub_1C277AD40();
    id v3 = (void *)sub_1C277B820();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_removeObserver_forKeyPath_, v1, v3);

    swift_bridgeObjectRetain();
    sub_1C277AD40();
    id v4 = (void *)sub_1C277B820();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_removeObserver_forKeyPath_, v1, v4);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C2772510()
{
  uint64_t v1 = sub_1C277AEE0();
  MEMORY[0x1F4188790](v1 - 8);
  sub_1C2772EE8();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  sub_1C277AED0();
  unsigned __int8 v9 = objc_msgSend(self, sel_hasCompletedBuddyWithVersion_, *MEMORY[0x1E4F2BD80]);
  sub_1C277AC10();
  uint64_t v8 = v0;
  sub_1C2773300(&qword_1EBB826B8, (void (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal);
  sub_1C277AE40();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t HealthAppBuddyCompleteInputSignal.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_1C2773364((void **)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC14HealthPlatform33HealthAppBuddyCompleteInputSignal_defaults;
  sub_1C2771F90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v1;
}

uint64_t HealthAppBuddyCompleteInputSignal.__deallocating_deinit()
{
  uint64_t v1 = *(void *)(v0 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_1C2773364((void **)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v2 = v0 + OBJC_IVAR____TtC14HealthPlatform33HealthAppBuddyCompleteInputSignal_defaults;
  sub_1C2771F90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return swift_deallocClassInstance();
}

id sub_1C2772A80()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthAppBuddyCompleteInputSignal.Observer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2772AC4()
{
  return sub_1C277AED0();
}

uint64_t sub_1C2772AE0()
{
  return _s14HealthPlatform0A27AppBuddyCompleteInputSignalC16beginObservation4from14configurationsy0A13Orchestration11ValueAnchorVySbGSg_SayAG21IdentityConfigurationVGtF_0();
}

void sub_1C2772B04()
{
}

uint64_t sub_1C2772B28(uint64_t a1)
{
  uint64_t v2 = sub_1C2773300(&qword_1EBB826B8, (void (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal);

  return MEMORY[0x1F411FB20](a1, v2);
}

uint64_t _s14HealthPlatform0A27AppBuddyCompleteInputSignalC16beginObservation4from14configurationsy0A13Orchestration11ValueAnchorVySbGSg_SayAG21IdentityConfigurationVGtF_0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_1C277AEE0();
  MEMORY[0x1F4188790](v2 - 8);
  sub_1C2772EE8();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = (os_unfair_lock_s *)v0[4];
  objc_super v13 = v0;
  uint64_t v14 = v1;
  unsigned __int8 v9 = (void **)&v8[4];
  uint64_t v10 = v8 + 6;
  os_unfair_lock_lock(v8 + 6);
  sub_1C2773348(v9);
  os_unfair_lock_unlock(v10);
  swift_getObjectType();
  sub_1C277AED0();
  LOBYTE(v15) = objc_msgSend(self, sel_hasCompletedBuddyWithVersion_, *MEMORY[0x1E4F2BD80]);
  sub_1C277AC10();
  uint64_t v15 = v0;
  sub_1C2773300(&qword_1EBB826B8, (void (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal);
  sub_1C277AE40();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_1C2772DE4(void **a1)
{
}

unint64_t sub_1C2772E04()
{
  unint64_t result = qword_1EA305958;
  if (!qword_1EA305958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA305958);
  }
  return result;
}

uint64_t sub_1C2772E58()
{
  return sub_1C2773300(&qword_1EBB83A40, (void (*)(uint64_t))type metadata accessor for HealthAppBuddyCompleteInputSignal);
}

uint64_t sub_1C2772EA0()
{
  return sub_1C2773300(&qword_1EA305960, (void (*)(uint64_t))sub_1C2772EE8);
}

void sub_1C2772EE8()
{
  if (!qword_1EA305968)
  {
    unint64_t v0 = sub_1C277AC20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA305968);
    }
  }
}

uint64_t sub_1C2772F60()
{
  return type metadata accessor for HealthAppBuddyCompleteInputSignal();
}

void sub_1C2772F68()
{
  sub_1C2771F90();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for HealthAppBuddyCompleteInputSignal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthAppBuddyCompleteInputSignal);
}

uint64_t dispatch thunk of HealthAppBuddyCompleteInputSignal.__allocating_init(observer:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

unsigned char *storeEnumTagSinglePayload for HealthAppBuddyCompleteInputSignal.Errors(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1C27730ECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthAppBuddyCompleteInputSignal.Errors()
{
  return &type metadata for HealthAppBuddyCompleteInputSignal.Errors;
}

uint64_t type metadata accessor for HealthAppBuddyCompleteInputSignal.Observer()
{
  return self;
}

ValueMetadata *type metadata accessor for HealthAppBuddyCompleteInputSignal.State()
{
  return &type metadata for HealthAppBuddyCompleteInputSignal.State;
}

uint64_t sub_1C2773158()
{
  uint64_t v0 = sub_1C277AEE0();
  MEMORY[0x1F4188790](v0 - 8);
  sub_1C2772EE8();
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v5 = &v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1C277AED0();
    v7[15] = objc_msgSend(self, sel_hasCompletedBuddyWithVersion_, *MEMORY[0x1E4F2BD80]);
    sub_1C277AC10();
    sub_1C2772510();
    swift_release();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_1C2773300(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1C2773348(void **a1)
{
}

void sub_1C2773364(void **a1)
{
}

uint64_t dispatch thunk of ContentStateManager.requestSyncOnUpdate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ContentStateManager.requestSyncOnUpdate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ContentStateManager.requestSyncOnUpdate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of ContentStateManager.getContentState(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of ContentStateManager.setContentState(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ContentStateManager.removeContentState(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of NotificationContentStateManager.setProtectedContentState(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of NotificationContentStateManager.setUnprotectedContentState(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of NotificationContentStateManager.migrateContentStateIfNecessary(with:notificationIdentifier:keyValueDomain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t DateRangeFeatureTag.value.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C26D30BC(v1, a1);
}

uint64_t DateRangeFeatureTag.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C2773444(a1, a2);
}

uint64_t sub_1C2773444(uint64_t a1, uint64_t a2)
{
  sub_1C263D4EC(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C27734A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1C26D30BC(v1, a1);
}

uint64_t sub_1C27734B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C2773444(a1, a2);
}

uint64_t sub_1C27734BC()
{
  uint64_t result = swift_getKeyPath();
  qword_1EBB827F0 = result;
  return result;
}

uint64_t static DateRangeFeatureTag.keyPath.getter()
{
  if (qword_1EBB827E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t static DateRangeFeatureTag.keyPath.setter(uint64_t a1)
{
  if (qword_1EBB827E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_1EBB827F0 = a1;
  return swift_release();
}

uint64_t (*static DateRangeFeatureTag.keyPath.modify())()
{
  if (qword_1EBB827E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1C2773664()
{
  if (qword_1EBB827E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t *initializeBufferWithCopyOfBuffer for DateRangeFeatureTag(uint64_t *a1, uint64_t *a2)
{
  sub_1C263D4EC(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(v4 - 8);
    uint64_t v7 = type metadata accessor for RelevantDateInterval();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_1C277A520();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 20));
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 24));
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for DateRangeFeatureTag(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RelevantDateInterval();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = sub_1C277A520();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

char *initializeWithCopy for DateRangeFeatureTag(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for RelevantDateInterval();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_1C263D4EC(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_1C277A520();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(void *)&a1[*(int *)(v4 + 20)] = *(void *)&a2[*(int *)(v4 + 20)];
    *(void *)&a1[*(int *)(v4 + 24)] = *(void *)&a2[*(int *)(v4 + 24)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

char *assignWithCopy for DateRangeFeatureTag(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for RelevantDateInterval();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      uint64_t v12 = sub_1C277A520();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(a1, a2, v12);
      *(void *)&a1[*(int *)(v4 + 20)] = *(void *)&a2[*(int *)(v4 + 20)];
      *(void *)&a1[*(int *)(v4 + 24)] = *(void *)&a2[*(int *)(v4 + 24)];
      return a1;
    }
    sub_1C2773C28((uint64_t)a1);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_1C263D4EC(0);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_1C277A520();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
  *(void *)&a1[*(int *)(v4 + 20)] = *(void *)&a2[*(int *)(v4 + 20)];
  *(void *)&a1[*(int *)(v4 + 24)] = *(void *)&a2[*(int *)(v4 + 24)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_1C2773C28(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RelevantDateInterval();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for DateRangeFeatureTag(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for RelevantDateInterval();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_1C263D4EC(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_1C277A520();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    *(void *)&a1[*(int *)(v4 + 20)] = *(void *)&a2[*(int *)(v4 + 20)];
    *(void *)&a1[*(int *)(v4 + 24)] = *(void *)&a2[*(int *)(v4 + 24)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

char *assignWithTake for DateRangeFeatureTag(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for RelevantDateInterval();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      uint64_t v12 = sub_1C277A520();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(a1, a2, v12);
      *(void *)&a1[*(int *)(v4 + 20)] = *(void *)&a2[*(int *)(v4 + 20)];
      *(void *)&a1[*(int *)(v4 + 24)] = *(void *)&a2[*(int *)(v4 + 24)];
      return a1;
    }
    sub_1C2773C28((uint64_t)a1);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_1C263D4EC(0);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_1C277A520();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
  *(void *)&a1[*(int *)(v4 + 20)] = *(void *)&a2[*(int *)(v4 + 20)];
  *(void *)&a1[*(int *)(v4 + 24)] = *(void *)&a2[*(int *)(v4 + 24)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DateRangeFeatureTag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C2773FAC);
}

uint64_t sub_1C2773FAC(uint64_t a1, uint64_t a2)
{
  sub_1C263D4EC(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DateRangeFeatureTag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C277402C);
}

uint64_t sub_1C277402C(uint64_t a1, uint64_t a2)
{
  sub_1C263D4EC(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DateRangeFeatureTag()
{
  uint64_t result = qword_1EBB85D08;
  if (!qword_1EBB85D08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1C27740E8()
{
  sub_1C263D4EC(319);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_1C277417C()
{
  sub_1C2774648();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C277E470;
  *(void *)(inited + 32) = 0xD000000000000032;
  *(void *)(inited + 40) = 0x80000001C278B630;
  *(void *)(inited + 72) = sub_1C277A840();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 48));
  sub_1C277A830();
  *(void *)(inited + 80) = 0xD000000000000038;
  *(void *)(inited + 88) = 0x80000001C278B6F0;
  uint64_t v1 = self;
  unsigned __int8 v2 = objc_msgSend(v1, sel_hasPairedWatch);
  *(void *)(inited + 120) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 96) = v2;
  unint64_t v3 = sub_1C262DBAC(inited);
  id v4 = objc_msgSend(self, sel_mainBundle);
  id v5 = objc_msgSend(v4, sel_infoDictionary);

  if (v5)
  {
    uint64_t v6 = sub_1C277B760();

    unint64_t result = *MEMORY[0x1E4F1D020];
    if (!*MEMORY[0x1E4F1D020])
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = sub_1C277B850();
    if (*(void *)(v6 + 16) && (unint64_t v10 = sub_1C2629588(v8, v9), (v11 & 1) != 0))
    {
      sub_1C263FED0(*(void *)(v6 + 56) + 32 * v10, (uint64_t)&v30);
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v31 + 1))
    {
      uint64_t v12 = MEMORY[0x1E4FBB1A0];
      if (swift_dynamicCast())
      {
        long long v13 = v29[0];
        if (v29[0] == __PAIR128__(0xE400000000000000, 960051513) || (sub_1C277C7E0() & 1) != 0)
        {
          if (qword_1EBB85FE8 != -1) {
            swift_once();
          }
          uint64_t v14 = sub_1C277B130();
          __swift_project_value_buffer(v14, (uint64_t)qword_1EBB85FD0);
          swift_bridgeObjectRetain();
          uint64_t v15 = sub_1C277B100();
          os_log_type_t v16 = sub_1C277BD40();
          if (os_log_type_enabled(v15, v16))
          {
            uint64_t v17 = swift_slowAlloc();
            uint64_t v28 = swift_slowAlloc();
            *(void *)&long long v30 = v28;
            *(_DWORD *)uint64_t v17 = 136315394;
            uint64_t v18 = sub_1C277C9E0();
            sub_1C263FDFC(v18, v19, (uint64_t *)&v30);
            sub_1C277C0D0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v17 + 12) = 2080;
            swift_bridgeObjectRetain();
            *(void *)&v29[0] = sub_1C263FDFC(v13, *((unint64_t *)&v13 + 1), (uint64_t *)&v30);
            sub_1C277C0D0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1C2601000, v15, v16, "[%s] Skipping adding bundle version because it doesn't seem sane: %s", (uint8_t *)v17, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1C875D230](v28, -1, -1);
            MEMORY[0x1C875D230](v17, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
        }
        else
        {
          *((void *)&v31 + 1) = v12;
          long long v30 = v29[0];
          sub_1C262FD34(&v30, v29);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          sub_1C268B27C(v29, 0xD000000000000032, 0x80000001C278B670, isUniquelyReferenced_nonNull_native);
          swift_bridgeObjectRelease();
        }
      }
      goto LABEL_17;
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  sub_1C262F2E4((uint64_t)&v30);
LABEL_17:
  id v20 = objc_msgSend(v1, sel_currentOSBuild);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = MEMORY[0x1E4FBB1A0];
    uint64_t v23 = sub_1C277B850();
    uint64_t v25 = v24;

    *((void *)&v31 + 1) = v22;
    *(void *)&long long v30 = v23;
    *((void *)&v30 + 1) = v25;
    sub_1C262FD34(&v30, v29);
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_1C268B27C(v29, 0xD000000000000031, 0x80000001C278B6B0, v26);
    swift_bridgeObjectRelease();
  }
  return v3;
}

void sub_1C2774648()
{
  if (!qword_1EBB85218)
  {
    sub_1C264EB14();
    unint64_t v0 = sub_1C277C7C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB85218);
    }
  }
}

uint64_t sub_1C27746A0(unsigned char *a1, uint64_t a2)
{
  int v2 = *a1;
  uint64_t v4 = 1;
  switch(*a1)
  {
    case 4:
      if (sub_1C26400F4(0xD000000000000028, 0x80000001C2789100, a2))
      {
        uint64_t v4 = 5;
      }
      else if (sub_1C26400F4(0xD00000000000002CLL, 0x80000001C2788F50, a2))
      {
        uint64_t v4 = 5;
      }
      else
      {
        uint64_t v4 = 4;
      }
      break;
    case 5:
      uint64_t v4 = 2;
      if ((sub_1C26400F4(0xD000000000000028, 0x80000001C2789100, a2) & 1) == 0)
      {
        if (sub_1C26400F4(0xD00000000000002CLL, 0x80000001C2788F50, a2)) {
          uint64_t v4 = 2;
        }
        else {
          uint64_t v4 = 0;
        }
      }
      break;
    case 0xC:
      goto LABEL_11;
    case 0x13:
      return v4;
    default:
      if (qword_1EBB85F78 != -1) {
        swift_once();
      }
      swift_beginAccess();
      uint64_t v5 = qword_1EBB85F18;
      swift_bridgeObjectRetain();
      char v6 = sub_1C26596D8(v2, v5);
      swift_bridgeObjectRelease();
      if (v6)
      {
LABEL_11:
        uint64_t v4 = 3;
      }
      else
      {
        if (v2 == 3) {
          unsigned int v7 = 11;
        }
        else {
          unsigned int v7 = 12;
        }
        if (v2 == 14) {
          uint64_t v4 = 9;
        }
        else {
          uint64_t v4 = v7;
        }
      }
      break;
  }
  return v4;
}

void *HealthAppPluginNotificationManager.__allocating_init(healthStore:bundleIdentifier:notificationManager:primaryHealthStore:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  swift_allocObject();
  unint64_t v10 = sub_1C2633658(a1, a2, a3, a4);

  swift_release();
  return v10;
}

uint64_t sub_1C2774914(void *a1)
{
  return UNUserNotificationCenter.scheduleNotification(_:)(a1);
}

BOOL sub_1C277493C(NSObject *a1, char a2, NSObject *a3)
{
  return sub_1C26D5098(a1, a2 & 1, a3);
}

uint64_t sub_1C2774968(long long *a1)
{
  int v2 = v1;
  uint64_t v64 = *v1;
  sub_1C2779EB4(0, &qword_1EA304B40, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, MEMORY[0x1E4F1AC08]);
  uint64_t v47 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unsigned int v7 = (char *)&v47 - v6;
  sub_1C2779B58(0, &qword_1EA304B48, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, MEMORY[0x1E4F1ACE0]);
  uint64_t v51 = v8;
  uint64_t v50 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v10 = (char *)&v47 - v9;
  sub_1C2778E1C();
  uint64_t v55 = v11;
  uint64_t v54 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  char v53 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2779020();
  uint64_t v60 = v13;
  uint64_t v58 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  id v57 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2779244();
  uint64_t v62 = v15;
  uint64_t v61 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v59 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v17 = a1[1];
  long long v69 = *a1;
  long long v70 = v17;
  long long v18 = a1[3];
  long long v71 = a1[2];
  long long v72 = v18;
  long long v19 = v17;
  id v20 = (void *)v2[2];
  swift_bridgeObjectRetain();
  id v21 = objc_msgSend(v20, sel_profileIdentifier);
  uint64_t v22 = v2[4];
  uint64_t v23 = v2[5];
  id v56 = v21;
  v73[0] = v21;
  v73[1] = v22;
  v73[2] = v23;
  uint64_t v24 = *((void *)&v69 + 1);
  long long v74 = v69;
  long long v75 = v19;
  uint64_t v48 = v19;
  sub_1C2779344((uint64_t)&v72, (uint64_t)v76);
  sub_1C2779344((uint64_t)v76, (uint64_t)&v77);
  unint64_t v25 = v78;
  if (v78)
  {
    if (v78 == 1)
    {
      unint64_t v25 = 0xEB00000000796C6ELL;
      uint64_t v26 = 0x4F656D6954656E6FLL;
    }
    else
    {
      uint64_t v26 = v77;
    }
  }
  else
  {
    unint64_t v25 = 0xE400000000000000;
    uint64_t v26 = 1701736302;
  }
  long long v65 = v69;
  long long v66 = v70;
  long long v67 = v71;
  long long v68 = v72;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v52 = v24;
  swift_bridgeObjectRetain();
  sub_1C27793A0((uint64_t)v76);
  sub_1C26E1BC4((uint64_t)&v69);
  uint64_t v27 = sub_1C277B440();
  uint64_t v49 = v23;
  MEMORY[0x1F4188790](v27);
  *(&v47 - 4) = (uint64_t)v2;
  *(&v47 - 3) = (uint64_t)v73;
  uint64_t v63 = *((void *)&v19 + 1);
  *(&v47 - 2) = v64;
  uint64_t v28 = v47;
  sub_1C277B420();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v28);
  uint64_t v29 = (void *)swift_allocObject();
  _OWORD v29[2] = v2;
  void v29[3] = v26;
  v29[4] = v25;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C277B330();
  sub_1C2778EFC();
  sub_1C2778FA4();
  sub_1C263377C(&qword_1EA305988, (void (*)(uint64_t))sub_1C2778EFC);
  long long v30 = v53;
  uint64_t v31 = v51;
  sub_1C277B5A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v10, v31);
  uint64_t v32 = swift_allocObject();
  long long v33 = v70;
  *(_OWORD *)(v32 + 16) = v69;
  *(_OWORD *)(v32 + 32) = v33;
  long long v34 = v72;
  *(_OWORD *)(v32 + 48) = v71;
  *(_OWORD *)(v32 + 64) = v34;
  uint64_t v35 = v63;
  *(void *)(v32 + 80) = v48;
  *(void *)(v32 + 88) = v35;
  *(void *)(v32 + 96) = v26;
  *(void *)(v32 + 104) = v25;
  uint64_t v36 = v64;
  *(void *)(v32 + 112) = v2;
  *(void *)(v32 + 120) = v36;
  sub_1C26E1BC4((uint64_t)&v69);
  swift_retain();
  sub_1C277B330();
  sub_1C277918C();
  sub_1C2779118(0, &qword_1EA305998, (void (*)(uint64_t))sub_1C277918C);
  sub_1C263377C(&qword_1EA3059B0, (void (*)(uint64_t))sub_1C2778E1C);
  sub_1C27791F4(&qword_1EA3059A8, &qword_1EA305998, (void (*)(uint64_t))sub_1C277918C);
  uint64_t v37 = v57;
  uint64_t v38 = v55;
  sub_1C277B5A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v30, v38);
  uint64_t v39 = swift_allocObject();
  uint64_t v40 = v64;
  *(void *)(v39 + 16) = v2;
  *(void *)(v39 + 24) = v40;
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = sub_1C27794C0;
  *(void *)(v41 + 24) = v39;
  swift_retain();
  sub_1C277B330();
  sub_1C2779B58(0, &qword_1EA3059C0, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, MEMORY[0x1E4F1AAE0]);
  sub_1C263377C(&qword_1EA3059D0, (void (*)(uint64_t))sub_1C2779020);
  sub_1C264F004(&qword_1EA3059C8, &qword_1EA3059C0, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest);
  uint64_t v42 = v59;
  uint64_t v43 = v60;
  sub_1C277B5A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v37, v43);
  sub_1C263377C(&qword_1EA3059D8, (void (*)(uint64_t))sub_1C2779244);
  uint64_t v44 = v62;
  uint64_t v45 = sub_1C277B4E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v61 + 8))(v42, v44);
  return v45;
}

void sub_1C27752BC(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v46 = a4;
  uint64_t v49 = a5;
  uint64_t v9 = sub_1C277B130();
  uint64_t v57 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v47 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1[1];
  uint64_t v48 = *a1;
  uint64_t v12 = a1[2];
  long long v13 = *(_OWORD *)(a1 + 3);
  uint64_t v15 = a1[5];
  uint64_t v14 = a1[6];
  unint64_t v16 = a1[7];
  uint64_t v17 = *(void *)(a2 + 48);
  uint64_t v18 = *(void *)(v17 + 56);
  long long v19 = *(_OWORD *)(v17 + 40);
  v55[0] = *(_OWORD *)(v17 + 24);
  v55[1] = v19;
  uint64_t v56 = v18;
  long long v20 = *(_OWORD *)a3;
  long long v21 = *(_OWORD *)(a3 + 16);
  long long v50 = v13;
  long long v51 = v20;
  long long v22 = *(_OWORD *)(a3 + 32);
  long long v52 = v21;
  long long v53 = v22;
  uint64_t v54 = *(void *)(a3 + 48);
  FeedItemNotificationManagerStore.addOrUpdate(_:)(&v51);
  if (!v5)
  {
    uint64_t v41 = v12;
    uint64_t v42 = v11;
    uint64_t v43 = v9;
    uint64_t v44 = v15;
    uint64_t v45 = v14;
    uint64_t v23 = v47;
    sub_1C277B0F0();
    sub_1C265D7F0((id *)a3);
    sub_1C265D7F0((id *)a3);
    uint64_t v24 = sub_1C277B100();
    os_log_type_t v25 = sub_1C277BD00();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      unint64_t v40 = v16;
      uint64_t v27 = v26;
      uint64_t v28 = swift_slowAlloc();
      *(void *)&v55[0] = v28;
      *(_DWORD *)uint64_t v27 = 136446467;
      uint64_t v29 = sub_1C277C9E0();
      *(void *)&long long v51 = sub_1C263FDFC(v29, v30, (uint64_t *)v55);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2081;
      long long v31 = *(_OWORD *)(a3 + 16);
      long long v51 = *(_OWORD *)a3;
      long long v52 = v31;
      long long v53 = *(_OWORD *)(a3 + 32);
      uint64_t v54 = *(void *)(a3 + 48);
      uint64_t v32 = PluginFeedItem.NotificationIdentifier.description.getter();
      *(void *)&long long v51 = sub_1C263FDFC(v32, v33, (uint64_t *)v55);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      sub_1C269B13C((void **)a3);
      sub_1C269B13C((void **)a3);
      _os_log_impl(&dword_1C2601000, v24, v25, "%{public}s Updated plugin notification request metadata: %{private}s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v28, -1, -1);
      uint64_t v34 = v27;
      unint64_t v16 = v40;
      MEMORY[0x1C875D230](v34, -1, -1);
    }
    else
    {
      sub_1C269B13C((void **)a3);
      sub_1C269B13C((void **)a3);
    }

    (*(void (**)(char *, uint64_t))(v57 + 8))(v23, v43);
    uint64_t v35 = v44;
    uint64_t v36 = v45;
    uint64_t v37 = v42;
    uint64_t v38 = v49;
    uint64_t v39 = v41;
    void *v49 = v48;
    v38[1] = v37;
    v38[2] = v39;
    *(_OWORD *)(v38 + 3) = v50;
    v38[5] = v35;
    v38[6] = v36;
    v38[7] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1C26E1C28(v36, v16);
  }
}

uint64_t sub_1C2775628(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *((void *)a1 + 2);
  uint64_t v7 = *((void *)a1 + 5);
  long long v10 = *a1;
  uint64_t v11 = v6;
  long long v12 = *(long long *)((char *)a1 + 24);
  uint64_t v13 = v7;
  long long v14 = a1[3];
  *(void *)&long long v10 = sub_1C27787BC((uint64_t)&v10);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  sub_1C2779118(0, &qword_1EBB82C48, sub_1C26E097C);
  sub_1C27791F4((unint64_t *)&qword_1EBB82C40, &qword_1EBB82C48, sub_1C26E097C);
  swift_bridgeObjectRetain();
  sub_1C277B500();
  swift_release();
  return swift_release();
}

uint64_t sub_1C2775750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  sub_1C26E097C(0);
  MEMORY[0x1F4188790](v8 - 8);
  long long v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C277A1F8(a1, (uint64_t)v10, (uint64_t (*)(void))sub_1C26E097C);
  uint64_t v11 = (int *)type metadata accessor for NotificationContentState(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v11 - 1) + 48))(v10, 1, v11) == 1)
  {
    uint64_t result = sub_1C277A260((uint64_t)v10, (uint64_t (*)(void))sub_1C26E097C);
    char v13 = 1;
  }
  else
  {
    long long v14 = &v10[v11[6]];
    BOOL v15 = *(void *)v14 == a2 && *((void *)v14 + 1) == a3;
    if (v15 || (sub_1C277C7E0() & 1) != 0)
    {
      if (v10[v11[8]]) {
        char v16 = 0;
      }
      else {
        char v16 = v10[v11[7]] ^ 1;
      }
    }
    else
    {
      char v16 = 1;
    }
    uint64_t result = sub_1C277A260((uint64_t)v10, type metadata accessor for NotificationContentState);
    char v13 = v16 & 1;
  }
  *a4 = v13;
  return result;
}

uint64_t sub_1C27758DC@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v163 = a8;
  uint64_t v156 = a7;
  uint64_t v158 = a6;
  uint64_t v157 = a5;
  v164 = a9;
  v165 = (char *)a3;
  sub_1C2779C20();
  id v155 = v12;
  uint64_t v149 = *((void *)v12 - 1);
  MEMORY[0x1F4188790](v12);
  long long v14 = (char *)&v144 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2779C88();
  uint64_t v16 = v15;
  uint64_t v162 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  int v148 = (char *)&v144 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2779D44();
  uint64_t v145 = v18;
  uint64_t v147 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  v146 = (char *)&v144 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2779E08();
  uint64_t v154 = v20;
  uint64_t v153 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  id v152 = (char *)&v144 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v22 = (int *)type metadata accessor for NotificationContentState(0);
  uint64_t v159 = *((void *)v22 - 1);
  uint64_t v23 = MEMORY[0x1F4188790](v22);
  uint64_t v161 = (uint64_t)&v144 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = v24;
  MEMORY[0x1F4188790](v23);
  v167 = (uint64_t *)((char *)&v144 - v25);
  uint64_t v26 = sub_1C277B130();
  uint64_t v168 = *(void *)(v26 - 8);
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  uint64_t v29 = (char *)&v144 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x1F4188790](v27);
  id v151 = (char *)&v144 - v31;
  uint64_t v32 = MEMORY[0x1F4188790](v30);
  uint64_t v34 = (char *)&v144 - v33;
  uint64_t v35 = MEMORY[0x1F4188790](v32);
  uint64_t v150 = (char *)&v144 - v36;
  uint64_t v37 = MEMORY[0x1F4188790](v35);
  uint64_t v39 = (char *)&v144 - v38;
  char v40 = *a1;
  uint64_t v166 = v37;
  if ((v40 & 1) == 0)
  {
    uint64_t v144 = v16;
    uint64_t v41 = v34;
    uint64_t v42 = *(void *)(a2 + 48);
    unint64_t v43 = *(void *)(a2 + 56);
    if (v43)
    {
      sub_1C26E1C28(*(void *)(a2 + 48), *(void *)(a2 + 56));
      sub_1C26EBD64(v42, v43);
      sub_1C26EBD64(0, 0);
      sub_1C277B0F0();
      swift_bridgeObjectRetain_n();
      uint64_t v44 = sub_1C277B100();
      os_log_type_t v45 = sub_1C277BD40();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        uint64_t v173 = (void (*)(void, void))v47;
        *(_DWORD *)uint64_t v46 = 136446466;
        uint64_t v48 = sub_1C277C9E0();
        *(void *)&long long v171 = sub_1C263FDFC(v48, v49, (uint64_t *)&v173);
        sub_1C277C0D0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v46 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)&long long v171 = sub_1C263FDFC((uint64_t)v165, a4, (uint64_t *)&v173);
        sub_1C277C0D0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C2601000, v44, v45, "%{public}s Not proceeding with %s", (uint8_t *)v46, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C875D230](v47, -1, -1);
        MEMORY[0x1C875D230](v46, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v168 + 8))(v29, v166);
      uint64_t v111 = v144;
      uint64_t v112 = v162;
      id v113 = v155;
      uint64_t v114 = v149;
      uint64_t v115 = v148;
      sub_1C277918C();
      sub_1C277B450();
      sub_1C26532A4();
      sub_1C263377C(&qword_1EA305A00, (void (*)(uint64_t))sub_1C2779C20);
      sub_1C277B5F0();
      (*(void (**)(char *, void))(v114 + 8))(v14, v113);
      sub_1C263377C(&qword_1EA305A18, (void (*)(uint64_t))sub_1C2779C88);
      uint64_t v116 = sub_1C277B4E0();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v112 + 8))(v115, v111);
      goto LABEL_27;
    }
    sub_1C26EBD64(*(void *)(a2 + 48), 0);
    sub_1C26EBD64(0, 0);
    uint64_t v26 = v166;
    uint64_t v34 = v41;
  }
  sub_1C277B0F0();
  swift_bridgeObjectRetain_n();
  long long v50 = sub_1C277B100();
  os_log_type_t v51 = sub_1C277BD40();
  BOOL v52 = os_log_type_enabled(v50, v51);
  uint64_t v162 = a2;
  if (v52)
  {
    uint64_t v53 = swift_slowAlloc();
    id v155 = (void (*)(void, void))swift_slowAlloc();
    uint64_t v173 = v155;
    *(_DWORD *)uint64_t v53 = 136446466;
    uint64_t v54 = sub_1C277C9E0();
    *(void *)&long long v171 = sub_1C263FDFC(v54, v55, (uint64_t *)&v173);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v53 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v56 = (uint64_t)v165;
    *(void *)&long long v171 = sub_1C263FDFC((uint64_t)v165, a4, (uint64_t *)&v173);
    uint64_t v26 = v166;
    a2 = v162;
    sub_1C277C0D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C2601000, v50, v51, "%{public}s Proceeding with %s", (uint8_t *)v53, 0x16u);
    uint64_t v57 = v155;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v57, -1, -1);
    MEMORY[0x1C875D230](v53, -1, -1);

    id v155 = *(void (**)(void, void))(v168 + 8);
    v155(v39, v26);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    id v155 = *(void (**)(void, void))(v168 + 8);
    v155(v39, v26);
    uint64_t v56 = (uint64_t)v165;
  }
  uint64_t v58 = (uint64_t)v158;
  uint64_t v59 = v157;
  uint64_t v60 = v167;
  uint64_t v61 = (char *)v167 + v22[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v158 = v61;
  uint64_t v62 = sub_1C277A890();
  *uint64_t v60 = v56;
  v60[1] = a4;
  uint64_t v63 = (uint64_t *)((char *)v60 + v22[6]);
  *uint64_t v63 = v59;
  v63[1] = v58;
  *((unsigned char *)v60 + v22[7]) = 1;
  *((unsigned char *)v60 + v22[8]) = 0;
  uint64_t v64 = (*(uint64_t (**)(uint64_t))(a2 + 32))(v62);
  if (v64)
  {
    long long v65 = (void *)v64;
    sub_1C277B0F0();
    swift_bridgeObjectRetain_n();
    long long v66 = sub_1C277B100();
    os_log_type_t v67 = sub_1C277BD40();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = swift_slowAlloc();
      uint64_t v157 = swift_slowAlloc();
      uint64_t v173 = (void (*)(void, void))v157;
      *(_DWORD *)uint64_t v68 = 136446466;
      v165 = v34;
      uint64_t v69 = sub_1C277C9E0();
      *(void *)&long long v171 = sub_1C263FDFC(v69, v70, (uint64_t *)&v173);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v68 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v171 = sub_1C263FDFC(v56, a4, (uint64_t *)&v173);
      long long v71 = (void (*)(char *, uint64_t))v155;
      uint64_t v26 = v166;
      sub_1C277C0D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2601000, v66, v67, "%{public}s Scheduling %s", (uint8_t *)v68, 0x16u);
      uint64_t v72 = v157;
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v72, -1, -1);
      MEMORY[0x1C875D230](v68, -1, -1);

      v71(v165, v26);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v155(v34, v26);
    }
    uint64_t v82 = (_OWORD *)v162;
    uint64_t v83 = v151;
    uint64_t v84 = v65;
    id v85 = objc_msgSend(v84, sel_content);
    objc_msgSend(v85, sel_mutableCopy);

    sub_1C277C110();
    swift_unknownObjectRelease();
    sub_1C2644ED8(0, &qword_1EA305A28);
    if (swift_dynamicCast())
    {
      uint64_t v86 = (void *)v171;
      *(void *)&long long v171 = sub_1C277B850();
      *((void *)&v171 + 1) = v87;
      uint64_t v88 = MEMORY[0x1E4FBB1A0];
      sub_1C277C260();
      uint64_t v89 = sub_1C277A850();
      uint64_t v172 = v88;
      *(void *)&long long v171 = v89;
      *((void *)&v171 + 1) = v90;
      id v91 = objc_msgSend(v86, sel_userInfo);
      uint64_t v92 = sub_1C277B760();

      sub_1C262FD34(&v171, v170);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v169 = v92;
      sub_1C268BFE0(v170, (uint64_t)&v173, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_1C265E4DC((uint64_t)&v173);
      uint64_t v94 = (void *)sub_1C277B750();
      swift_bridgeObjectRelease();
      objc_msgSend(v86, sel_setUserInfo_, v94);

      id v95 = objc_msgSend(v84, sel_identifier);
      sub_1C277B850();

      id v96 = v86;
      id v97 = objc_msgSend(v84, sel_trigger);
      uint64_t v98 = (void *)sub_1C277B820();
      swift_bridgeObjectRelease();
      id v99 = objc_msgSend(self, sel_requestWithIdentifier_content_trigger_, v98, v96, v97);

      uint64_t v100 = v84;
    }
    else
    {
      v165 = v84;
      sub_1C277B0F0();
      sub_1C26E1BC4((uint64_t)v82);
      sub_1C26E1BC4((uint64_t)v82);
      uint64_t v101 = sub_1C277B100();
      os_log_type_t v102 = sub_1C277BD30();
      if (os_log_type_enabled(v101, v102))
      {
        uint64_t v103 = swift_slowAlloc();
        uint64_t v104 = swift_slowAlloc();
        uint64_t v173 = (void (*)(void, void))v104;
        *(_DWORD *)uint64_t v103 = 136446466;
        uint64_t v105 = sub_1C277C9E0();
        *(void *)&long long v171 = sub_1C263FDFC(v105, v106, (uint64_t *)&v173);
        sub_1C277C0D0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v103 + 12) = 2080;
        uint64_t v107 = *(void *)(v162 + 16);
        unint64_t v108 = *(void *)(v162 + 24);
        swift_bridgeObjectRetain();
        *(void *)&long long v171 = sub_1C263FDFC(v107, v108, (uint64_t *)&v173);
        uint64_t v82 = (_OWORD *)v162;
        sub_1C277C0D0();
        swift_bridgeObjectRelease();
        sub_1C2779F6C((uint64_t)v82);
        sub_1C2779F6C((uint64_t)v82);
        _os_log_impl(&dword_1C2601000, v101, v102, "%{public}s Unable to create mutable content copy of notification %s", (uint8_t *)v103, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C875D230](v104, -1, -1);
        MEMORY[0x1C875D230](v103, -1, -1);

        uint64_t v109 = v83;
        uint64_t v110 = v166;
      }
      else
      {
        sub_1C2779F6C((uint64_t)v82);
        sub_1C2779F6C((uint64_t)v82);

        uint64_t v109 = v83;
        uint64_t v110 = v26;
      }
      v155(v109, v110);
      uint64_t v100 = v165;
      id v99 = v165;
    }
    uint64_t v173 = (void (*)(void, void))UNUserNotificationCenter.scheduleNotification(_:)(v99);
    uint64_t v136 = (uint64_t)v167;
    uint64_t v137 = v161;
    sub_1C277A1F8((uint64_t)v167, v161, type metadata accessor for NotificationContentState);
    unint64_t v138 = (*(unsigned __int8 *)(v159 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80);
    char v139 = (_OWORD *)swift_allocObject();
    long long v140 = v82[1];
    v139[1] = *v82;
    v139[2] = v140;
    long long v141 = v82[3];
    v139[3] = v82[2];
    v139[4] = v141;
    sub_1C2779F04(v137, (uint64_t)v139 + v138);
    sub_1C26E1BC4((uint64_t)v82);
    sub_1C264F068();
    sub_1C277918C();
    sub_1C263377C(&qword_1EBB82CB8, (void (*)(uint64_t))sub_1C264F068);
    uint64_t v142 = v152;
    sub_1C277B500();
    swift_release();
    swift_release();
    sub_1C263377C((unint64_t *)&unk_1EA305A30, (void (*)(uint64_t))sub_1C2779E08);
    uint64_t v143 = v154;
    uint64_t v116 = sub_1C277B4E0();

    (*(void (**)(char *, uint64_t))(v153 + 8))(v142, v143);
    uint64_t v135 = v136;
  }
  else
  {
    unint64_t v73 = v150;
    sub_1C277B0F0();
    swift_bridgeObjectRetain_n();
    long long v74 = sub_1C277B100();
    os_log_type_t v75 = sub_1C277BD40();
    if (os_log_type_enabled(v74, v75))
    {
      uint64_t v76 = swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      uint64_t v173 = (void (*)(void, void))v77;
      *(_DWORD *)uint64_t v76 = 136446466;
      uint64_t v78 = sub_1C277C9E0();
      *(void *)&long long v171 = sub_1C263FDFC(v78, v79, (uint64_t *)&v173);
      sub_1C277C0D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v76 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v171 = sub_1C263FDFC((uint64_t)v165, a4, (uint64_t *)&v173);
      a2 = v162;
      sub_1C277C0D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2601000, v74, v75, "%{public}s Removing %s", (uint8_t *)v76, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C875D230](v77, -1, -1);
      MEMORY[0x1C875D230](v76, -1, -1);

      uint64_t v80 = v150;
      uint64_t v81 = v26;
      uint64_t v56 = (uint64_t)v165;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v80 = v73;
      uint64_t v81 = v26;
    }
    v155(v80, v81);
    uint64_t v118 = v156;
    uint64_t v119 = v145;
    uint64_t v120 = *(void *)(v156 + 48);
    sub_1C2779EB4(0, (unint64_t *)&qword_1EBB85EA0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
    uint64_t v121 = swift_allocObject();
    *(_OWORD *)(v121 + 16) = xmmword_1C277E480;
    *(void *)(v121 + 32) = v56;
    *(void *)(v121 + 40) = a4;
    id v122 = *(void **)(v120 + 16);
    swift_bridgeObjectRetain();
    uint64_t v123 = (void *)sub_1C277BA30();
    objc_msgSend(v122, sel_removePendingNotificationRequestsWithIdentifiers_, v123);

    uint64_t v124 = (void *)sub_1C277BA30();
    objc_msgSend(v122, sel_removeDeliveredNotificationsWithIdentifiers_, v124);
    swift_bridgeObjectRelease();

    swift_beginAccess();
    sub_1C26482E4(v118 + 56, (uint64_t)&v173);
    uint64_t v125 = v174;
    uint64_t v126 = v175;
    __swift_project_boxed_opaque_existential_1(&v173, v174);
    *(void *)&v170[0] = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v126 + 8) + 72))(v56, a4, v125);
    uint64_t v127 = (uint64_t)v167;
    uint64_t v128 = v161;
    sub_1C277A1F8((uint64_t)v167, v161, type metadata accessor for NotificationContentState);
    unint64_t v129 = (*(unsigned __int8 *)(v159 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80);
    v130 = (_OWORD *)swift_allocObject();
    long long v131 = *(_OWORD *)(a2 + 16);
    v130[1] = *(_OWORD *)a2;
    v130[2] = v131;
    long long v132 = *(_OWORD *)(a2 + 48);
    v130[3] = *(_OWORD *)(a2 + 32);
    v130[4] = v132;
    sub_1C2779F04(v128, (uint64_t)v130 + v129);
    sub_1C26E1BC4(a2);
    uint64_t v133 = MEMORY[0x1E4FBC848] + 8;
    sub_1C2779B58(0, &qword_1EBB82CD0, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4F1AAE0]);
    sub_1C277918C();
    sub_1C264F004(&qword_1EBB82CC8, &qword_1EBB82CD0, v133);
    v134 = v146;
    sub_1C277B500();
    swift_release();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v173);
    sub_1C263377C(&qword_1EA305A20, (void (*)(uint64_t))sub_1C2779D44);
    uint64_t v116 = sub_1C277B4E0();
    (*(void (**)(char *, uint64_t))(v147 + 8))(v134, v119);
    uint64_t v135 = v127;
  }
  uint64_t result = sub_1C277A260(v135, type metadata accessor for NotificationContentState);
LABEL_27:
  uint64_t *v164 = v116;
  return result;
}

uint64_t sub_1C2776EA8(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v44 = a4;
  sub_1C2779AA4();
  uint64_t v8 = v7;
  uint64_t v46 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  os_log_type_t v45 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for NotificationContentState(0);
  MEMORY[0x1F4188790](v10 - 8);
  long long v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C277B130();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v17 = a1[1];
  long long v52 = *a1;
  long long v53 = v17;
  long long v18 = a1[3];
  long long v54 = a1[2];
  long long v55 = v18;
  sub_1C277B0F0();
  sub_1C277A1F8(a2, (uint64_t)v12, type metadata accessor for NotificationContentState);
  uint64_t v19 = sub_1C277B100();
  os_log_type_t v20 = sub_1C277BD40();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v43 = v8;
    uint64_t v22 = v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v42 = a2;
    uint64_t v24 = v23;
    v49[0] = v23;
    *(_DWORD *)uint64_t v22 = 136446466;
    uint64_t v25 = sub_1C277C9E0();
    uint64_t v44 = a3;
    uint64_t v48 = sub_1C263FDFC(v25, v26, v49);
    uint64_t v41 = v13;
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v27 = NotificationContentState.description.getter();
    uint64_t v48 = sub_1C263FDFC(v27, v28, v49);
    a3 = v44;
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    sub_1C277A260((uint64_t)v12, type metadata accessor for NotificationContentState);
    _os_log_impl(&dword_1C2601000, v19, v20, "%{public}s Updating content state %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    uint64_t v29 = v24;
    a2 = v42;
    MEMORY[0x1C875D230](v29, -1, -1);
    uint64_t v30 = v22;
    uint64_t v8 = v43;
    MEMORY[0x1C875D230](v30, -1, -1);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v41);
  }
  else
  {
    sub_1C277A260((uint64_t)v12, type metadata accessor for NotificationContentState);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  swift_beginAccess();
  sub_1C26482E4(a3 + 56, (uint64_t)v49);
  uint64_t v31 = v50;
  uint64_t v32 = v51;
  __swift_project_boxed_opaque_existential_1(v49, v50);
  uint64_t v47 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v32 + 8) + 64))(a2, v31);
  uint64_t v33 = (_OWORD *)swift_allocObject();
  long long v34 = v53;
  v33[1] = v52;
  v33[2] = v34;
  long long v35 = v55;
  v33[3] = v54;
  v33[4] = v35;
  sub_1C26E1BC4((uint64_t)&v52);
  uint64_t v36 = MEMORY[0x1E4FBC848] + 8;
  sub_1C2779B58(0, &qword_1EBB82CD0, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4F1AAE0]);
  sub_1C264F004(&qword_1EBB82CC8, &qword_1EBB82CD0, v36);
  uint64_t v37 = v45;
  sub_1C277B500();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v49);
  sub_1C263377C(&qword_1EA3059E8, (void (*)(uint64_t))sub_1C2779AA4);
  uint64_t v38 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v37, v8);
  return v38;
}

uint64_t sub_1C27773D0(uint64_t a1)
{
  sub_1C2779550(0);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = sub_1C26D86F0;
  v10[3] = v8;
  void v10[4] = sub_1C27795C4;
  v10[5] = v9;
  sub_1C26D851C();
  sub_1C263377C(&qword_1EA304A70, (void (*)(uint64_t))sub_1C26D851C);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C277B4A0();
  sub_1C263377C((unint64_t *)&qword_1EA304A78, sub_1C2779550);
  uint64_t v11 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  swift_release();
  return v11;
}

uint64_t sub_1C27775E8(uint64_t a1)
{
  sub_1C27795D0(0);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = sub_1C26D8994;
  v10[3] = v8;
  void v10[4] = sub_1C27796A0;
  v10[5] = v9;
  sub_1C26D87D4();
  sub_1C263377C(&qword_1EA304AA8, (void (*)(uint64_t))sub_1C26D87D4);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C277B4A0();
  sub_1C263377C((unint64_t *)&qword_1EA304AB0, sub_1C27795D0);
  uint64_t v11 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  swift_release();
  return v11;
}

void sub_1C2777800(uint64_t a1)
{
}

void sub_1C277780C(uint64_t a1)
{
}

void sub_1C2777818(uint64_t a1, SEL *a2)
{
  uint64_t v4 = *(void **)(*(void *)(v2 + 48) + 16);
  id v5 = (id)sub_1C277BA30();
  objc_msgSend(v4, *a2, v5);
}

uint64_t sub_1C277787C()
{
  uint64_t v1 = v0;
  uint64_t v28 = *v0;
  sub_1C27796AC();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  uint64_t v31 = v3;
  MEMORY[0x1F4188790](v2);
  uint64_t v29 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (void *)v0[6];
  uint64_t v6 = (void *)v0[2];
  unint64_t v35 = 0;
  unint64_t v36 = 0xE000000000000000;
  swift_retain();
  sub_1C277C2D0();
  swift_bridgeObjectRelease();
  unint64_t v35 = 0xD00000000000002FLL;
  unint64_t v36 = 0x80000001C278CA90;
  sub_1C277B8D0();
  unint64_t v26 = v36;
  unint64_t v27 = v35;
  unint64_t v35 = 0;
  unint64_t v36 = 0xE000000000000000;
  sub_1C277C2D0();
  sub_1C277B8D0();
  sub_1C277B8D0();
  unint64_t v24 = v36;
  unint64_t v25 = v35;
  unint64_t v7 = v5[4];
  uint64_t v9 = v5[5];
  uint64_t v8 = (void *)v5[6];
  uint64_t v10 = (void *)v5[7];
  unint64_t v35 = v5[3];
  unint64_t v36 = v7;
  uint64_t v37 = v9;
  uint64_t v38 = v8;
  uint64_t v39 = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  id v11 = v8;
  id v12 = v10;
  uint64_t v13 = v6;
  id v14 = objc_msgSend(v6, sel_profileIdentifier);
  uint64_t v15 = sub_1C26BB43C(v14);

  swift_release();
  swift_release();
  swift_release();

  uint64_t v33 = sub_1C277974C;
  long long v34 = v1;
  sub_1C26C1860((uint64_t (*)(void *))sub_1C2779754, (uint64_t)v32, v15);
  uint64_t v17 = sub_1C26D6AFC(v16, v13, v27, v26, v25, v24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v35 = v17;
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v28;
  *(void *)(v18 + 16) = v1;
  *(void *)(v18 + 24) = v19;
  sub_1C264F0F8();
  sub_1C263377C(&qword_1EBB82C68, (void (*)(uint64_t))sub_1C264F0F8);
  swift_retain();
  os_log_type_t v20 = v29;
  sub_1C277B500();
  swift_release();
  swift_release();
  sub_1C263377C(&qword_1EBB82A98, (void (*)(uint64_t))sub_1C27796AC);
  uint64_t v21 = v30;
  uint64_t v22 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v21);
  return v22;
}

uint64_t sub_1C2777C40(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) == *(void *)(a2 + 32) && *(void *)(a1 + 16) == *(void *)(a2 + 40)) {
    return 1;
  }
  else {
    return sub_1C277C7E0();
  }
}

uint64_t sub_1C2777C70(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v31 = *v2;
  sub_1C27796AC();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  uint64_t v34 = v5;
  MEMORY[0x1F4188790](v4);
  uint64_t v32 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = (void *)v2[6];
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = a1;
  id v27 = (id)v2[2];
  unint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_1C277C2D0();
  swift_bridgeObjectRelease();
  unint64_t v38 = 0xD00000000000002FLL;
  unint64_t v39 = 0x80000001C278CA90;
  sub_1C277B8D0();
  unint64_t v28 = v39;
  unint64_t v29 = v38;
  unint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_1C277C2D0();
  sub_1C277B8D0();
  sub_1C277B8D0();
  unint64_t v25 = v39;
  unint64_t v26 = v38;
  unint64_t v8 = v7[4];
  uint64_t v10 = v7[5];
  uint64_t v9 = (void *)v7[6];
  id v11 = (void *)v7[7];
  unint64_t v38 = v7[3];
  unint64_t v39 = v8;
  uint64_t v40 = v10;
  uint64_t v41 = v9;
  uint64_t v42 = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  id v12 = v9;
  id v13 = v11;
  id v14 = v27;
  id v15 = objc_msgSend(v27, sel_profileIdentifier);
  uint64_t v16 = sub_1C26BB43C(v15);

  swift_release();
  swift_release();
  swift_release();

  unint64_t v36 = sub_1C27797D0;
  uint64_t v37 = v30;
  sub_1C26C1860((uint64_t (*)(void *))sub_1C277A2E0, (uint64_t)v35, v16);
  uint64_t v18 = sub_1C26D6AFC(v17, v14, v29, v28, v26, v25);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v38 = v18;
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = v31;
  *(void *)(v19 + 16) = v2;
  *(void *)(v19 + 24) = v20;
  sub_1C264F0F8();
  sub_1C263377C(&qword_1EBB82C68, (void (*)(uint64_t))sub_1C264F0F8);
  swift_retain();
  uint64_t v21 = v32;
  sub_1C277B500();
  swift_release();
  swift_release();
  sub_1C263377C(&qword_1EBB82A98, (void (*)(uint64_t))sub_1C27796AC);
  uint64_t v22 = v33;
  uint64_t v23 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v22);
  return v23;
}

uint64_t sub_1C277805C(uint64_t a1, void *a2)
{
  uint64_t v2 = a2[2];
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = a2[4];
  uint64_t v7 = a2[5];
  if (v6 == v4 && v7 == v5) {
    return 1;
  }
  uint64_t result = sub_1C277C7E0();
  if (result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  uint64_t v10 = a2 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v12 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v13 = *(v10 - 1) == v4 && *v10 == v5;
    if (v13 || (sub_1C277C7E0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v10 += 2;
    if (v12 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2778120(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v6 = sub_1C277A8A0();
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v40 = v6;
  MEMORY[0x1F4188790](v6);
  unint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C277B130();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C277B0F0();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  BOOL v13 = sub_1C277B100();
  os_log_type_t v14 = sub_1C277BD40();
  int v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v38 = v10;
    uint64_t v17 = v16;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v42 = v37;
    *(_DWORD *)uint64_t v17 = 136315906;
    int v36 = v15;
    uint64_t v18 = sub_1C277C9E0();
    unint64_t v35 = a4;
    uint64_t v41 = sub_1C263FDFC(v18, v19, &v42);
    sub_1C277C0D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v33 = v17 + 14;
    id v20 = objc_msgSend(*(id *)(a2 + 16), sel_profileIdentifier, v17 + 14);
    id v21 = objc_msgSend(v20, sel_identifier);
    sub_1C277A880();

    uint64_t v22 = sub_1C277A850();
    uint64_t v34 = v9;
    unint64_t v24 = v23;

    (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v40);
    uint64_t v41 = sub_1C263FDFC(v22, v24, &v42);
    sub_1C277C0D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    uint64_t v25 = *(void *)(a2 + 32);
    unint64_t v26 = *(void *)(a2 + 40);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_1C263FDFC(v25, v26, &v42);
    sub_1C277C0D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 32) = 2080;
    uint64_t v27 = swift_bridgeObjectRetain();
    uint64_t v28 = MEMORY[0x1C875B960](v27, &type metadata for PluginFeedItem.NotificationIdentifier);
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_1C263FDFC(v28, v30, &v42);
    sub_1C277C0D0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2601000, v13, (os_log_type_t)v36, v35, (uint8_t *)v17, 0x2Au);
    uint64_t v31 = v37;
    swift_arrayDestroy();
    MEMORY[0x1C875D230](v31, -1, -1);
    MEMORY[0x1C875D230](v17, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v12, v34);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t sub_1C277855C(uint64_t a1, void *a2)
{
  sub_1C26482E4(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + 56;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0(v3);
  sub_1C261F308(v5, v3);
  return swift_endAccess();
}

uint64_t sub_1C27785C4@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_1C26482E4(v1 + 56, a1);
}

uint64_t sub_1C2778610(long long *a1)
{
  uint64_t v3 = v1 + 56;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0(v3);
  sub_1C261F308(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1C277866C())()
{
  return j__swift_endAccess;
}

unint64_t sub_1C27786C0()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_1C277873C()
{
  return 0;
}

uint64_t sub_1C27787BC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  sub_1C277C2D0();
  swift_bridgeObjectRelease();
  v14[0] = 0xD00000000000002FLL;
  v14[1] = 0x80000001C278CA90;
  sub_1C277B8D0();
  uint64_t v5 = *(void **)(v1 + 16);
  id v6 = objc_allocWithZone(MEMORY[0x1E4F2B138]);
  id v7 = v5;
  unint64_t v8 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_initWithCategory_domainName_healthStore_, 1, v8, v7);

  swift_beginAccess();
  sub_1C26482E4(v2 + 56, (uint64_t)v14);
  uint64_t v10 = v15;
  uint64_t v11 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  uint64_t v12 = NotificationContentStateManager.getContentState(for:legacyStringIdentifier:legacyKeyValueDomain:)(v3, v4, v3, v4, (uint64_t)v9, v10, v11);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  return v12;
}

uint64_t HealthAppPluginNotificationManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  return v0;
}

uint64_t sub_1C277895C(uint64_t a1)
{
  sub_1C2779550(0);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = sub_1C26D86F0;
  v10[3] = v8;
  void v10[4] = sub_1C277A2C4;
  v10[5] = v9;
  sub_1C26D851C();
  sub_1C263377C(&qword_1EA304A70, (void (*)(uint64_t))sub_1C26D851C);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C277B4A0();
  sub_1C263377C((unint64_t *)&qword_1EA304A78, sub_1C2779550);
  uint64_t v11 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  swift_release();
  return v11;
}

uint64_t sub_1C2778B74(uint64_t a1)
{
  sub_1C27795D0(0);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = sub_1C26D8994;
  v10[3] = v8;
  void v10[4] = sub_1C277A2C0;
  v10[5] = v9;
  sub_1C26D87D4();
  sub_1C263377C(&qword_1EA304AA8, (void (*)(uint64_t))sub_1C26D87D4);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C277B4A0();
  sub_1C263377C((unint64_t *)&qword_1EA304AB0, sub_1C27795D0);
  uint64_t v11 = sub_1C277B4E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  swift_release();
  return v11;
}

void sub_1C2778D8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1C2778D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1C2778DA4(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v6 = *(void **)(*(void *)(v4 + 48) + 16);
  id v7 = (id)sub_1C277BA30();
  objc_msgSend(v6, *a4, v7);
}

BOOL sub_1C2778E0C(NSObject *a1, char a2, NSObject *a3)
{
  return sub_1C277493C(a1, a2 & 1, a3);
}

void sub_1C2778E1C()
{
  if (!qword_1EA305978)
  {
    sub_1C2778EFC();
    sub_1C2779B58(255, &qword_1EA304B48, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, MEMORY[0x1E4F1ACE0]);
    sub_1C263377C(&qword_1EA305988, (void (*)(uint64_t))sub_1C2778EFC);
    sub_1C2778FA4();
    unint64_t v0 = sub_1C277B260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA305978);
    }
  }
}

void sub_1C2778EFC()
{
  if (!qword_1EA305980)
  {
    sub_1C2779118(255, &qword_1EBB82C48, sub_1C26E097C);
    sub_1C27791F4((unint64_t *)&qword_1EBB82C40, &qword_1EBB82C48, sub_1C26E097C);
    unint64_t v0 = sub_1C277B1E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA305980);
    }
  }
}

unint64_t sub_1C2778FA4()
{
  unint64_t result = qword_1EA304B58;
  if (!qword_1EA304B58)
  {
    sub_1C2779B58(255, &qword_1EA304B48, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, MEMORY[0x1E4F1ACE0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA304B58);
  }
  return result;
}

void sub_1C2779020()
{
  if (!qword_1EA305990)
  {
    sub_1C2779118(255, &qword_1EA305998, (void (*)(uint64_t))sub_1C277918C);
    sub_1C2778E1C();
    sub_1C27791F4(&qword_1EA3059A8, &qword_1EA305998, (void (*)(uint64_t))sub_1C277918C);
    sub_1C263377C(&qword_1EA3059B0, (void (*)(uint64_t))sub_1C2778E1C);
    unint64_t v0 = sub_1C277B260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA305990);
    }
  }
}

void sub_1C2779118(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    sub_1C26532A4();
    unint64_t v4 = sub_1C277B340();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1C277918C()
{
  if (!qword_1EA3059A0)
  {
    type metadata accessor for NotificationContentState(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA3059A0);
    }
  }
}

uint64_t sub_1C27791F4(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C2779118(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C2779244()
{
  if (!qword_1EA3059B8)
  {
    sub_1C2779B58(255, &qword_1EA3059C0, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest, MEMORY[0x1E4F1AAE0]);
    sub_1C2779020();
    sub_1C264F004(&qword_1EA3059C8, &qword_1EA3059C0, (uint64_t)&type metadata for PluginFeedItem.NotificationRequest);
    sub_1C263377C(&qword_1EA3059D0, (void (*)(uint64_t))sub_1C2779020);
    unint64_t v0 = sub_1C277B260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA3059B8);
    }
  }
}

uint64_t sub_1C2779344(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C27793A0(uint64_t a1)
{
  return a1;
}

void sub_1C27793D0(uint64_t *a1@<X0>, void *a2@<X8>)
{
  sub_1C27752BC(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_1C27793F0()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C2779430(long long *a1)
{
  return sub_1C2775628(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C277943C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(v0 + 72) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 128, 7);
}

uint64_t sub_1C27794AC@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C27758DC(a1, v2 + 16, *(void *)(v2 + 80), *(void *)(v2 + 88), *(void *)(v2 + 96), *(char **)(v2 + 104), *(void *)(v2 + 112), *(void *)(v2 + 120), a2);
}

uint64_t sub_1C27794C0(long long *a1, uint64_t a2)
{
  return sub_1C2776EA8(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1C27794C8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C2779500@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  sub_1C277918C();
  uint64_t result = v5(a1, a1 + *(int *)(v6 + 48));
  *a2 = result;
  return result;
}

void sub_1C2779550(uint64_t a1)
{
}

uint64_t sub_1C277958C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C27795C4(uint64_t a1)
{
  return sub_1C26D5BDC(a1, *(void *)(v1 + 16));
}

void sub_1C27795D0(uint64_t a1)
{
}

void sub_1C277960C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), unint64_t *a4, void (*a5)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    sub_1C263377C(a4, a5);
    unint64_t v8 = sub_1C277B4B0();
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1C27796A0(uint64_t a1)
{
  return sub_1C26D5F34(a1, *(void *)(v1 + 16));
}

void sub_1C27796AC()
{
  if (!qword_1EBB82AA0)
  {
    sub_1C264F0F8();
    sub_1C263377C(&qword_1EBB82C68, (void (*)(uint64_t))sub_1C264F0F8);
    unint64_t v0 = sub_1C277B1E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB82AA0);
    }
  }
}

uint64_t sub_1C277974C(uint64_t a1)
{
  return sub_1C2777C40(a1, v1);
}

uint64_t sub_1C2779754(uint64_t a1)
{
  return sub_1C26D6A98(a1, *(uint64_t (**)(_OWORD *))(v1 + 16)) & 1;
}

uint64_t sub_1C2779774()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C27797AC(uint64_t a1)
{
  return sub_1C2778120(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), "%s Removed all notification requests for profile %s plugin %s. Identifiers: %s");
}

uint64_t sub_1C27797D0(uint64_t a1)
{
  return sub_1C277805C(a1, *(void **)(v1 + 16));
}

uint64_t sub_1C27797D8(uint64_t a1)
{
  return sub_1C2778120(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), "%s Removed plugin feed item notifications for profile %s plugin %s. Identifiers: %s");
}

uint64_t sub_1C27797FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + 56;
  swift_beginAccess();
  return sub_1C26482E4(v3, a2);
}

uint64_t method lookup function for HealthAppPluginNotificationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthAppPluginNotificationManager);
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.__allocating_init(healthStore:bundleIdentifier:notificationManager:primaryHealthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.scheduleUserNotification(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.scheduleCoalescingNotification<A>(for:environment:)(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 136))(a1, a2 & 1);
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.schedulePluginFeedItemNotification(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.getPendingNotifications(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.getDeliveredNotifications(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.removePendingNotifications(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.removeDeliveredNotifications(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.removeAllPluginFeedItemNotifications()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.removePluginFeedItemNotifications(feedItemIdentifiers:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.contentStateManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.contentStateManager.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.contentStateManager.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.legacyContentStateDomain()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.notificationContentStateDomain()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of HealthAppPluginNotificationManager.getContentState(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

void sub_1C2779AA4()
{
  if (!qword_1EA3059E0)
  {
    uint64_t v0 = MEMORY[0x1E4FBC848] + 8;
    sub_1C2779B58(255, &qword_1EBB82CD0, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4F1AAE0]);
    sub_1C264F004(&qword_1EBB82CC8, &qword_1EBB82CD0, v0);
    unint64_t v1 = sub_1C277B1E0();
    if (!v2) {
      atomic_store(v1, (unint64_t *)&qword_1EA3059E0);
    }
  }
}

void sub_1C2779B58(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, unint64_t, void))
{
  if (!*a2)
  {
    unint64_t v8 = sub_1C26532A4();
    unint64_t v9 = a4(a1, a3, v8, MEMORY[0x1E4FBC0F0]);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_1C2779BC8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(v0 + 72) >= 2uLL) {
    swift_bridgeObjectRelease();
  }

  return MEMORY[0x1F4186498](v0, 80, 7);
}

void sub_1C2779C20()
{
  if (!qword_1EA3059F0)
  {
    sub_1C277918C();
    unint64_t v0 = sub_1C277B460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA3059F0);
    }
  }
}

void sub_1C2779C88()
{
  if (!qword_1EA3059F8)
  {
    sub_1C2779C20();
    sub_1C26532A4();
    sub_1C263377C(&qword_1EA305A00, (void (*)(uint64_t))sub_1C2779C20);
    unint64_t v0 = sub_1C277B1B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA3059F8);
    }
  }
}

void sub_1C2779D44()
{
  if (!qword_1EA305A08)
  {
    uint64_t v0 = MEMORY[0x1E4FBC848] + 8;
    sub_1C2779B58(255, &qword_1EBB82CD0, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4F1AAE0]);
    sub_1C277918C();
    sub_1C264F004(&qword_1EBB82CC8, &qword_1EBB82CD0, v0);
    unint64_t v1 = sub_1C277B1E0();
    if (!v2) {
      atomic_store(v1, (unint64_t *)&qword_1EA305A08);
    }
  }
}

void sub_1C2779E08()
{
  if (!qword_1EA305A10)
  {
    sub_1C264F068();
    sub_1C277918C();
    sub_1C263377C(&qword_1EBB82CB8, (void (*)(uint64_t))sub_1C264F068);
    unint64_t v0 = sub_1C277B1E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA305A10);
    }
  }
}

void sub_1C2779EB4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1C2779F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotificationContentState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2779F6C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = *(void *)(a1 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C26EBD64(v2, v3);
  return a1;
}

uint64_t objectdestroy_56Tm()
{
  uint64_t v1 = type metadata accessor for NotificationContentState(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(v0 + 72) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = v2 | 7;
  uint64_t v5 = (v2 + 80) & ~v2;
  uint64_t v6 = v5 + v3;
  uint64_t v7 = v0 + v5;
  swift_bridgeObjectRelease();
  uint64_t v8 = v7 + *(int *)(v1 + 20);
  uint64_t v9 = sub_1C277A8A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, v6, v4);
}

uint64_t sub_1C277A100@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for NotificationContentState(0) - 8);
  uint64_t v4 = (uint64_t)v1 + ((*(unsigned __int8 *)(v3 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  sub_1C277918C();
  uint64_t v6 = (uint64_t)a1 + *(int *)(v5 + 48);
  long long v7 = v1[2];
  *a1 = v1[1];
  a1[1] = v7;
  long long v8 = v1[4];
  a1[2] = v1[3];
  a1[3] = v8;
  sub_1C277A1F8(v4, v6, type metadata accessor for NotificationContentState);

  return sub_1C26E1BC4((uint64_t)(v1 + 1));
}

uint64_t sub_1C277A1B8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C277A1F0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_1C2775750(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1C277A1F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C277A260(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C277A2E0(uint64_t a1)
{
  return sub_1C2779754(a1) & 1;
}

void NoveltyFeatureTag.init(for:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_uniqueIdentifier);
  uint64_t v5 = sub_1C277B850();
  uint64_t v7 = v6;

  *a2 = v5;
  a2[1] = v7;
}

uint64_t NoveltyFeatureTag.value.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

HealthPlatform::NoveltyFeatureTag __swiftcall NoveltyFeatureTag.init(_:)(HealthPlatform::NoveltyFeatureTag result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_1C277A398@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *sub_1C277A3A4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

ValueMetadata *type metadata accessor for NoveltyFeatureTag()
{
  return &type metadata for NoveltyFeatureTag;
}

uint64_t sub_1C277A3C0()
{
  return MEMORY[0x1F411CE58]();
}

uint64_t sub_1C277A3D0()
{
  return MEMORY[0x1F411CE60]();
}

uint64_t sub_1C277A3E0()
{
  return MEMORY[0x1F411CE70]();
}

uint64_t sub_1C277A3F0()
{
  return MEMORY[0x1F411CE78]();
}

uint64_t sub_1C277A400()
{
  return MEMORY[0x1F411CE80]();
}

uint64_t sub_1C277A410()
{
  return MEMORY[0x1F411CE88]();
}

uint64_t sub_1C277A420()
{
  return MEMORY[0x1F411CE90]();
}

uint64_t sub_1C277A430()
{
  return MEMORY[0x1F411CE98]();
}

uint64_t sub_1C277A440()
{
  return MEMORY[0x1F411CEA0]();
}

uint64_t sub_1C277A450()
{
  return MEMORY[0x1F411CEA8]();
}

uint64_t sub_1C277A460()
{
  return MEMORY[0x1F411CEB0]();
}

uint64_t sub_1C277A470()
{
  return MEMORY[0x1F411CEB8]();
}

uint64_t sub_1C277A480()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1C277A490()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1C277A4A0()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1C277A4B0()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1C277A4C0()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1C277A4D0()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1C277A4E0()
{
  return MEMORY[0x1F40E34B0]();
}

uint64_t sub_1C277A4F0()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1C277A500()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1C277A510()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1C277A520()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1C277A530()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1C277A540()
{
  return MEMORY[0x1F40E3560]();
}

uint64_t sub_1C277A550()
{
  return MEMORY[0x1F40E3568]();
}

uint64_t sub_1C277A560()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1C277A570()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1C277A580()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1C277A590()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C277A5A0()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C277A5B0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C277A5C0()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1C277A5D0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1C277A5E0()
{
  return MEMORY[0x1F40E3C88]();
}

uint64_t sub_1C277A5F0()
{
  return MEMORY[0x1F40E3C90]();
}

uint64_t sub_1C277A600()
{
  return MEMORY[0x1F40E3F28]();
}

uint64_t sub_1C277A610()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C277A620()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C277A630()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1C277A640()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1C277A650()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t sub_1C277A660()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1C277A670()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1C277A680()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1C277A690()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1C277A6A0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C277A6B0()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1C277A6C0()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1C277A6D0()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1C277A6E0()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1C277A6F0()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C277A700()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1C277A710()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1C277A720()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1C277A730()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1C277A740()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1C277A750()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C277A760()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1C277A770()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C277A780()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C277A790()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1C277A7A0()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1C277A7B0()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1C277A7C0()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1C277A7D0()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1C277A7E0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1C277A7F0()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1C277A810()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1C277A820()
{
  return MEMORY[0x1F40E5338]();
}

uint64_t sub_1C277A830()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C277A840()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C277A850()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C277A860()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1C277A870()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1C277A880()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C277A890()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C277A8A0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C277A8B0()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1C277A8C0()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1C277A8D0()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1C277A8E0()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1C277A8F0()
{
  return MEMORY[0x1F40E56B0]();
}

uint64_t sub_1C277A900()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1C277A910()
{
  return MEMORY[0x1F40E5718]();
}

uint64_t sub_1C277A920()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1C277A930()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1C277A940()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1C277A950()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1C277A960()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1C277A970()
{
  return MEMORY[0x1F40E5960]();
}

uint64_t sub_1C277A980()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1C277A990()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1C277A9A0()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1C277A9B0()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1C277A9C0()
{
  return MEMORY[0x1F40E5CC0]();
}

uint64_t sub_1C277A9D0()
{
  return MEMORY[0x1F40E5CD0]();
}

uint64_t sub_1C277A9E0()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1C277A9F0()
{
  return MEMORY[0x1F411D038]();
}

uint64_t sub_1C277AA00()
{
  return MEMORY[0x1F411D040]();
}

uint64_t sub_1C277AA10()
{
  return MEMORY[0x1F411F000]();
}

uint64_t sub_1C277AA20()
{
  return MEMORY[0x1F411F008]();
}

uint64_t sub_1C277AA30()
{
  return MEMORY[0x1F411F018]();
}

uint64_t sub_1C277AA40()
{
  return MEMORY[0x1F411F020]();
}

uint64_t sub_1C277AA50()
{
  return MEMORY[0x1F411F028]();
}

uint64_t sub_1C277AA60()
{
  return MEMORY[0x1F411F030]();
}

uint64_t sub_1C277AA70()
{
  return MEMORY[0x1F411F060]();
}

uint64_t sub_1C277AA80()
{
  return MEMORY[0x1F411F068]();
}

uint64_t sub_1C277AA90()
{
  return MEMORY[0x1F411F098]();
}

uint64_t sub_1C277AAA0()
{
  return MEMORY[0x1F411F0A0]();
}

uint64_t sub_1C277AAB0()
{
  return MEMORY[0x1F411F0B0]();
}

uint64_t sub_1C277AAC0()
{
  return MEMORY[0x1F411F0B8]();
}

uint64_t sub_1C277AAD0()
{
  return MEMORY[0x1F411F0C0]();
}

uint64_t sub_1C277AAE0()
{
  return MEMORY[0x1F411F0C8]();
}

uint64_t sub_1C277AAF0()
{
  return MEMORY[0x1F411F0D0]();
}

uint64_t sub_1C277AB00()
{
  return MEMORY[0x1F411F0D8]();
}

uint64_t sub_1C277AB10()
{
  return MEMORY[0x1F411F0E0]();
}

uint64_t sub_1C277AB20()
{
  return MEMORY[0x1F411F0E8]();
}

uint64_t sub_1C277AB30()
{
  return MEMORY[0x1F411F0F0]();
}

uint64_t sub_1C277AB40()
{
  return MEMORY[0x1F411F0F8]();
}

uint64_t sub_1C277AB50()
{
  return MEMORY[0x1F411F100]();
}

uint64_t sub_1C277AB60()
{
  return MEMORY[0x1F411F118]();
}

uint64_t sub_1C277AB70()
{
  return MEMORY[0x1F411F120]();
}

uint64_t sub_1C277AB80()
{
  return MEMORY[0x1F411F128]();
}

uint64_t sub_1C277AB90()
{
  return MEMORY[0x1F411F130]();
}

uint64_t sub_1C277ABA0()
{
  return MEMORY[0x1F411F138]();
}

uint64_t sub_1C277ABB0()
{
  return MEMORY[0x1F411FB08]();
}

uint64_t sub_1C277ABC0()
{
  return MEMORY[0x1F411FB10]();
}

uint64_t sub_1C277ABD0()
{
  return MEMORY[0x1F411FB18]();
}

uint64_t sub_1C277ABF0()
{
  return MEMORY[0x1F411FB28]();
}

uint64_t sub_1C277AC00()
{
  return MEMORY[0x1F411FB30]();
}

uint64_t sub_1C277AC10()
{
  return MEMORY[0x1F411FB38]();
}

uint64_t sub_1C277AC20()
{
  return MEMORY[0x1F411FB40]();
}

uint64_t sub_1C277AC30()
{
  return MEMORY[0x1F411FB48]();
}

uint64_t sub_1C277AC40()
{
  return MEMORY[0x1F411FB50]();
}

uint64_t sub_1C277AC50()
{
  return MEMORY[0x1F411FB58]();
}

uint64_t sub_1C277AC60()
{
  return MEMORY[0x1F411FB60]();
}

uint64_t sub_1C277AC70()
{
  return MEMORY[0x1F411FB68]();
}

uint64_t sub_1C277AC80()
{
  return MEMORY[0x1F411FB70]();
}

uint64_t sub_1C277AC90()
{
  return MEMORY[0x1F411FB78]();
}

uint64_t sub_1C277ACA0()
{
  return MEMORY[0x1F411FB80]();
}

uint64_t sub_1C277ACB0()
{
  return MEMORY[0x1F411FB88]();
}

uint64_t sub_1C277ACC0()
{
  return MEMORY[0x1F411FB90]();
}

uint64_t sub_1C277ACD0()
{
  return MEMORY[0x1F411FB98]();
}

uint64_t sub_1C277ACE0()
{
  return MEMORY[0x1F411FBA0]();
}

uint64_t sub_1C277ACF0()
{
  return MEMORY[0x1F411FBA8]();
}

uint64_t sub_1C277AD00()
{
  return MEMORY[0x1F411FBB0]();
}

uint64_t sub_1C277AD10()
{
  return MEMORY[0x1F411FBB8]();
}

uint64_t sub_1C277AD20()
{
  return MEMORY[0x1F411FBC0]();
}

uint64_t sub_1C277AD30()
{
  return MEMORY[0x1F411FBC8]();
}

uint64_t sub_1C277AD40()
{
  return MEMORY[0x1F411FBD0]();
}

uint64_t sub_1C277AD50()
{
  return MEMORY[0x1F411FBD8]();
}

uint64_t sub_1C277AD60()
{
  return MEMORY[0x1F411FBE0]();
}

uint64_t sub_1C277AD70()
{
  return MEMORY[0x1F411FBE8]();
}

uint64_t sub_1C277AD80()
{
  return MEMORY[0x1F411FBF0]();
}

uint64_t sub_1C277AD90()
{
  return MEMORY[0x1F411FBF8]();
}

uint64_t sub_1C277ADA0()
{
  return MEMORY[0x1F411FC00]();
}

uint64_t sub_1C277ADB0()
{
  return MEMORY[0x1F411FC08]();
}

uint64_t sub_1C277ADC0()
{
  return MEMORY[0x1F411FC10]();
}

uint64_t sub_1C277ADE0()
{
  return MEMORY[0x1F411FC20]();
}

uint64_t sub_1C277ADF0()
{
  return MEMORY[0x1F411FC28]();
}

uint64_t sub_1C277AE00()
{
  return MEMORY[0x1F411FC30]();
}

uint64_t sub_1C277AE20()
{
  return MEMORY[0x1F411FC40]();
}

uint64_t sub_1C277AE30()
{
  return MEMORY[0x1F411FC48]();
}

uint64_t sub_1C277AE40()
{
  return MEMORY[0x1F411FC50]();
}

uint64_t sub_1C277AE50()
{
  return MEMORY[0x1F411FC58]();
}

uint64_t sub_1C277AE60()
{
  return MEMORY[0x1F411FC60]();
}

uint64_t sub_1C277AE70()
{
  return MEMORY[0x1F411FC68]();
}

uint64_t sub_1C277AE80()
{
  return MEMORY[0x1F411FC70]();
}

uint64_t sub_1C277AE90()
{
  return MEMORY[0x1F411FC78]();
}

uint64_t sub_1C277AEA0()
{
  return MEMORY[0x1F411FC80]();
}

uint64_t sub_1C277AEB0()
{
  return MEMORY[0x1F411FC88]();
}

uint64_t sub_1C277AEC0()
{
  return MEMORY[0x1F411FC90]();
}

uint64_t sub_1C277AED0()
{
  return MEMORY[0x1F411FC98]();
}

uint64_t sub_1C277AEE0()
{
  return MEMORY[0x1F411FCA0]();
}

uint64_t sub_1C277AEF0()
{
  return MEMORY[0x1F411FCA8]();
}

uint64_t sub_1C277AF00()
{
  return MEMORY[0x1F411FCB0]();
}

uint64_t sub_1C277AF10()
{
  return MEMORY[0x1F411FCB8]();
}

uint64_t sub_1C277AF20()
{
  return MEMORY[0x1F411FCC0]();
}

uint64_t sub_1C277AF30()
{
  return MEMORY[0x1F411FCC8]();
}

uint64_t sub_1C277AF40()
{
  return MEMORY[0x1F411FCD0]();
}

uint64_t sub_1C277AF50()
{
  return MEMORY[0x1F411FCD8]();
}

uint64_t sub_1C277AF60()
{
  return MEMORY[0x1F411FCE0]();
}

uint64_t sub_1C277AF70()
{
  return MEMORY[0x1F411FCE8]();
}

uint64_t sub_1C277AF80()
{
  return MEMORY[0x1F411FCF0]();
}

uint64_t sub_1C277AF90()
{
  return MEMORY[0x1F411FCF8]();
}

uint64_t sub_1C277AFA0()
{
  return MEMORY[0x1F411FD00]();
}

uint64_t sub_1C277AFB0()
{
  return MEMORY[0x1F411FD08]();
}

uint64_t sub_1C277AFC0()
{
  return MEMORY[0x1F411FD10]();
}

uint64_t sub_1C277AFD0()
{
  return MEMORY[0x1F411FD18]();
}

uint64_t sub_1C277AFE0()
{
  return MEMORY[0x1F411FD20]();
}

uint64_t sub_1C277AFF0()
{
  return MEMORY[0x1F411FD28]();
}

uint64_t sub_1C277B000()
{
  return MEMORY[0x1F411FD30]();
}

uint64_t sub_1C277B010()
{
  return MEMORY[0x1F411FD38]();
}

uint64_t sub_1C277B020()
{
  return MEMORY[0x1F411FD40]();
}

uint64_t sub_1C277B030()
{
  return MEMORY[0x1F411FD48]();
}

uint64_t sub_1C277B040()
{
  return MEMORY[0x1F411FD50]();
}

uint64_t sub_1C277B050()
{
  return MEMORY[0x1F411FD58]();
}

uint64_t sub_1C277B060()
{
  return MEMORY[0x1F411FD60]();
}

uint64_t sub_1C277B070()
{
  return MEMORY[0x1F411FD68]();
}

uint64_t sub_1C277B080()
{
  return MEMORY[0x1F411FD70]();
}

uint64_t sub_1C277B090()
{
  return MEMORY[0x1F411FD78]();
}

uint64_t sub_1C277B0A0()
{
  return MEMORY[0x1F411FD80]();
}

uint64_t sub_1C277B0B0()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_1C277B0C0()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1C277B0D0()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1C277B0E0()
{
  return MEMORY[0x1F411CEC0]();
}

uint64_t sub_1C277B0F0()
{
  return MEMORY[0x1F411F160]();
}

uint64_t sub_1C277B100()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C277B110()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C277B120()
{
  return MEMORY[0x1F4188690]();
}

uint64_t sub_1C277B130()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C277B140()
{
  return MEMORY[0x1F4186B80]();
}

uint64_t sub_1C277B150()
{
  return MEMORY[0x1F41884D0]();
}

uint64_t sub_1C277B160()
{
  return MEMORY[0x1F40D65E8]();
}

uint64_t sub_1C277B170()
{
  return MEMORY[0x1F40D6610]();
}

uint64_t sub_1C277B180()
{
  return MEMORY[0x1F40D6618]();
}

uint64_t sub_1C277B190()
{
  return MEMORY[0x1F40D6658]();
}

uint64_t sub_1C277B1A0()
{
  return MEMORY[0x1F40D6680]();
}

uint64_t sub_1C277B1B0()
{
  return MEMORY[0x1F40D66C8]();
}

uint64_t sub_1C277B1C0()
{
  return MEMORY[0x1F40D66E8]();
}

uint64_t sub_1C277B1D0()
{
  return MEMORY[0x1F40D6700]();
}

uint64_t sub_1C277B1E0()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1C277B1F0()
{
  return MEMORY[0x1F40D6750]();
}

uint64_t sub_1C277B200()
{
  return MEMORY[0x1F40D6768]();
}

uint64_t sub_1C277B210()
{
  return MEMORY[0x1F40D6770]();
}

uint64_t sub_1C277B220()
{
  return MEMORY[0x1F40D6778]();
}

uint64_t sub_1C277B230()
{
  return MEMORY[0x1F40D67C0]();
}

uint64_t sub_1C277B240()
{
  return MEMORY[0x1F40D67E8]();
}

uint64_t sub_1C277B250()
{
  return MEMORY[0x1F40D67F0]();
}

uint64_t sub_1C277B260()
{
  return MEMORY[0x1F40D67F8]();
}

uint64_t sub_1C277B270()
{
  return MEMORY[0x1F40D6810]();
}

uint64_t sub_1C277B280()
{
  return MEMORY[0x1F40D6850]();
}

uint64_t sub_1C277B290()
{
  return MEMORY[0x1F40D6878]();
}

uint64_t sub_1C277B2A0()
{
  return MEMORY[0x1F40D6880]();
}

uint64_t sub_1C277B2B0()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1C277B2C0()
{
  return MEMORY[0x1F40D68A8]();
}

uint64_t sub_1C277B2D0()
{
  return MEMORY[0x1F40D68B0]();
}

uint64_t sub_1C277B2E0()
{
  return MEMORY[0x1F40D68B8]();
}

uint64_t sub_1C277B2F0()
{
  return MEMORY[0x1F40D68C8]();
}

uint64_t sub_1C277B300()
{
  return MEMORY[0x1F40D68E0]();
}

uint64_t sub_1C277B310()
{
  return MEMORY[0x1F40D68F8]();
}

uint64_t sub_1C277B320()
{
  return MEMORY[0x1F40D6900]();
}

uint64_t sub_1C277B330()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t sub_1C277B340()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1C277B350()
{
  return MEMORY[0x1F40D6928]();
}

uint64_t sub_1C277B360()
{
  return MEMORY[0x1F40D6938]();
}

uint64_t sub_1C277B370()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1C277B380()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1C277B390()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1C277B3A0()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1C277B3B0()
{
  return MEMORY[0x1F40D6A58]();
}

uint64_t sub_1C277B3C0()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1C277B3D0()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1C277B3E0()
{
  return MEMORY[0x1F40D6AD0]();
}

uint64_t sub_1C277B3F0()
{
  return MEMORY[0x1F40D6AD8]();
}

uint64_t sub_1C277B400()
{
  return MEMORY[0x1F40D6AE0]();
}

uint64_t sub_1C277B410()
{
  return MEMORY[0x1F40D6AF0]();
}

uint64_t sub_1C277B420()
{
  return MEMORY[0x1F40D6B08]();
}

uint64_t sub_1C277B430()
{
  return MEMORY[0x1F40D6B10]();
}

uint64_t sub_1C277B440()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t sub_1C277B450()
{
  return MEMORY[0x1F40D6B20]();
}

uint64_t sub_1C277B460()
{
  return MEMORY[0x1F40D6B28]();
}

uint64_t sub_1C277B470()
{
  return MEMORY[0x1F40D6B30]();
}

uint64_t sub_1C277B480()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t sub_1C277B490()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1C277B4A0()
{
  return MEMORY[0x1F40D6B70]();
}

uint64_t sub_1C277B4B0()
{
  return MEMORY[0x1F40D6B78]();
}

uint64_t sub_1C277B4C0()
{
  return MEMORY[0x1F411F168]();
}

uint64_t sub_1C277B4D0()
{
  return MEMORY[0x1F411F170]();
}

uint64_t sub_1C277B4E0()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1C277B4F0()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1C277B500()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1C277B510()
{
  return MEMORY[0x1F40D6C90]();
}

uint64_t sub_1C277B520()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1C277B530()
{
  return MEMORY[0x1F40D6CA0]();
}

uint64_t sub_1C277B540()
{
  return MEMORY[0x1F40D6CB0]();
}

uint64_t sub_1C277B550()
{
  return MEMORY[0x1F40D6CC0]();
}

uint64_t sub_1C277B560()
{
  return MEMORY[0x1F40D6D08]();
}

uint64_t sub_1C277B570()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1C277B580()
{
  return MEMORY[0x1F40D6D30]();
}

uint64_t sub_1C277B590()
{
  return MEMORY[0x1F40D6D40]();
}

uint64_t sub_1C277B5A0()
{
  return MEMORY[0x1F40D6D60]();
}

uint64_t sub_1C277B5B0()
{
  return MEMORY[0x1F40D6D68]();
}

uint64_t sub_1C277B5C0()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1C277B5D0()
{
  return MEMORY[0x1F40D6D90]();
}

uint64_t sub_1C277B5E0()
{
  return MEMORY[0x1F40D6DE0]();
}

uint64_t sub_1C277B5F0()
{
  return MEMORY[0x1F40D6E08]();
}

uint64_t sub_1C277B600()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1C277B610()
{
  return MEMORY[0x1F40D6E38]();
}

uint64_t sub_1C277B620()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1C277B630()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C277B640()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1C277B650()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C277B660()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C277B670()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C277B680()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C277B690()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1C277B6A0()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_1C277B6B0()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1C277B6C0()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1C277B6D0()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1C277B6E0()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1C277B6F0()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1C277B700()
{
  return MEMORY[0x1F40E7808]();
}

uint64_t sub_1C277B710()
{
  return MEMORY[0x1F40E7818]();
}

uint64_t sub_1C277B720()
{
  return MEMORY[0x1F40E7820]();
}

uint64_t sub_1C277B730()
{
  return MEMORY[0x1F40E7828]();
}

uint64_t sub_1C277B740()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1C277B750()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C277B760()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C277B770()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1C277B780()
{
  return MEMORY[0x1F41833C0]();
}

uint64_t sub_1C277B790()
{
  return MEMORY[0x1F41833C8]();
}

uint64_t sub_1C277B7A0()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1C277B7B0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C277B7C0()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1C277B7D0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C277B7E0()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_1C277B7F0()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_1C277B800()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_1C277B810()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C277B820()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C277B830()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C277B840()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C277B850()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C277B860()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C277B870()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1C277B880()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1C277B890()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1C277B8A0()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1C277B8B0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C277B8C0()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1C277B8D0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C277B8E0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C277B8F0()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1C277B900()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1C277B920()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1C277B930()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1C277B940()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1C277B950()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1C277B960()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1C277B970()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1C277B980()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1C277B990()
{
  return MEMORY[0x1F4183C48]();
}

uint64_t sub_1C277B9A0()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1C277B9B0()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1C277B9C0()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1C277B9D0()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C277B9E0()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1C277B9F0()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1C277BA00()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1C277BA10()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1C277BA20()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C277BA30()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C277BA40()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C277BA50()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C277BA60()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C277BA70()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1C277BA80()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1C277BA90()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C277BAA0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C277BAB0()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1C277BAC0()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1C277BAD0()
{
  return MEMORY[0x1F4183F20]();
}

uint64_t sub_1C277BAE0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C277BAF0()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1C277BB00()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1C277BB10()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1C277BB20()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C277BB30()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1C277BB40()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C277BB50()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1C277BB60()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1C277BB70()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1C277BB80()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C277BB90()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C277BBA0()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1C277BBB0()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1C277BBC0()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1C277BBD0()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1C277BBE0()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C277BBF0()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1C277BC00()
{
  return MEMORY[0x1F4184180]();
}

uint64_t sub_1C277BC10()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1C277BC20()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1C277BC30()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1C277BC40()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1C277BC50()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1C277BC60()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1C277BC70()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1C277BC80()
{
  return MEMORY[0x1F41844A0]();
}

uint64_t sub_1C277BC90()
{
  return MEMORY[0x1F41844F0]();
}

uint64_t sub_1C277BCA0()
{
  return MEMORY[0x1F4184588]();
}

uint64_t sub_1C277BCB0()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1C277BCC0()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t _sSo12HKObjectTypeC14HealthPlatformE23pinnedContentIdentifierSSvg_0()
{
  return MEMORY[0x1F40E7948]();
}

uint64_t sub_1C277BCE0()
{
  return MEMORY[0x1F40E65D0]();
}

uint64_t sub_1C277BD00()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C277BD10()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C277BD20()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C277BD30()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C277BD40()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C277BD50()
{
  return MEMORY[0x1F411F250]();
}

uint64_t sub_1C277BD60()
{
  return MEMORY[0x1F411F258]();
}

uint64_t sub_1C277BD70()
{
  return MEMORY[0x1F411F260]();
}

uint64_t sub_1C277BD80()
{
  return MEMORY[0x1F411F268]();
}

uint64_t sub_1C277BD90()
{
  return MEMORY[0x1F411F270]();
}

uint64_t sub_1C277BDA0()
{
  return MEMORY[0x1F411F278]();
}

uint64_t sub_1C277BDB0()
{
  return MEMORY[0x1F411F280]();
}

uint64_t sub_1C277BDC0()
{
  return MEMORY[0x1F411F288]();
}

uint64_t sub_1C277BDD0()
{
  return MEMORY[0x1F411F290]();
}

uint64_t sub_1C277BDE0()
{
  return MEMORY[0x1F411F2A0]();
}

uint64_t sub_1C277BDF0()
{
  return MEMORY[0x1F411F2B0]();
}

uint64_t sub_1C277BE00()
{
  return MEMORY[0x1F40E79A0]();
}

uint64_t sub_1C277BE10()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1C277BE20()
{
  return MEMORY[0x1F40E66E0]();
}

uint64_t sub_1C277BE30()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1C277BE40()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C277BE50()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1C277BE60()
{
  return MEMORY[0x1F4187000]();
}

uint64_t sub_1C277BE70()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1C277BE80()
{
  return MEMORY[0x1F4187048]();
}

uint64_t sub_1C277BE90()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1C277BEA0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C277BEB0()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1C277BEC0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C277BED0()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C277BEE0()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1C277BEF0()
{
  return MEMORY[0x1F411F2F0]();
}

uint64_t sub_1C277BF00()
{
  return MEMORY[0x1F4187148]();
}

uint64_t sub_1C277BF10()
{
  return MEMORY[0x1F4187150]();
}

uint64_t sub_1C277BF20()
{
  return MEMORY[0x1F4187158]();
}

uint64_t sub_1C277BF30()
{
  return MEMORY[0x1F4187178]();
}

uint64_t sub_1C277BF40()
{
  return MEMORY[0x1F41871B8]();
}

uint64_t sub_1C277BF50()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1C277BF60()
{
  return MEMORY[0x1F41871F0]();
}

uint64_t sub_1C277BF70()
{
  return MEMORY[0x1F4187210]();
}

uint64_t sub_1C277BF80()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1C277BF90()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1C277BFA0()
{
  return MEMORY[0x1F4187248]();
}

uint64_t sub_1C277BFB0()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1C277BFC0()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1C277BFD0()
{
  return MEMORY[0x1F411F310]();
}

uint64_t sub_1C277BFE0()
{
  return MEMORY[0x1F411F318]();
}

uint64_t sub_1C277BFF0()
{
  return MEMORY[0x1F411F320]();
}

uint64_t sub_1C277C000()
{
  return MEMORY[0x1F40D7078]();
}

uint64_t sub_1C277C010()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1C277C020()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1C277C030()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C277C040()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1C277C050()
{
  return MEMORY[0x1F40E6A98]();
}

uint64_t sub_1C277C060()
{
  return MEMORY[0x1F40E6AC8]();
}

uint64_t sub_1C277C070()
{
  return MEMORY[0x1F40E6AF0]();
}

uint64_t sub_1C277C080()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1C277C090()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1C277C0A0()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1C277C0B0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C277C0C0()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1C277C0D0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C277C0E0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C277C0F0()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1C277C100()
{
  return MEMORY[0x1F40E6D58]();
}

uint64_t sub_1C277C110()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C277C120()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C277C130()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C277C140()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1C277C150()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1C277C160()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1C277C170()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1C277C180()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1C277C190()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1C277C1A0()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1C277C1B0()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1C277C1C0()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1C277C1D0()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1C277C1E0()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1C277C200()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1C277C210()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1C277C220()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1C277C230()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1C277C240()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C277C250()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1C277C260()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1C277C270()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C277C280()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C277C290()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1C277C2A0()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C277C2B0()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1C277C2C0()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1C277C2D0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C277C2E0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C277C2F0()
{
  return MEMORY[0x1F4184D10]();
}

uint64_t sub_1C277C300()
{
  return MEMORY[0x1F4184D18]();
}

uint64_t sub_1C277C310()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1C277C320()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C277C330()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C277C340()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1C277C350()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_1C277C360()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1C277C370()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1C277C380()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C277C390()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C277C3A0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C277C3B0()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1C277C3C0()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C277C3D0()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C277C3E0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C277C3F0()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1C277C400()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1C277C410()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1C277C420()
{
  return MEMORY[0x1F4184FB8]();
}

uint64_t sub_1C277C430()
{
  return MEMORY[0x1F4184FC0]();
}

uint64_t sub_1C277C440()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1C277C450()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C277C460()
{
  return MEMORY[0x1F41851F0]();
}

uint64_t sub_1C277C470()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1C277C480()
{
  return MEMORY[0x1F4185200]();
}

uint64_t sub_1C277C490()
{
  return MEMORY[0x1F4185208]();
}

uint64_t sub_1C277C4A0()
{
  return MEMORY[0x1F4185210]();
}

uint64_t sub_1C277C4B0()
{
  return MEMORY[0x1F4185228]();
}

uint64_t sub_1C277C4C0()
{
  return MEMORY[0x1F4185230]();
}

uint64_t sub_1C277C4D0()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1C277C4E0()
{
  return MEMORY[0x1F4185240]();
}

uint64_t sub_1C277C4F0()
{
  return MEMORY[0x1F4185258]();
}

uint64_t sub_1C277C500()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1C277C510()
{
  return MEMORY[0x1F4185268]();
}

uint64_t sub_1C277C520()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1C277C530()
{
  return MEMORY[0x1F4185278]();
}

uint64_t sub_1C277C540()
{
  return MEMORY[0x1F4185290]();
}

uint64_t sub_1C277C550()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C277C560()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C277C570()
{
  return MEMORY[0x1F41852A8]();
}

uint64_t sub_1C277C580()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1C277C590()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1C277C5A0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C277C5B0()
{
  return MEMORY[0x1F4185360]();
}

uint64_t sub_1C277C5C0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C277C5D0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C277C5E0()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1C277C5F0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C277C600()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1C277C610()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C277C620()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1C277C630()
{
  return MEMORY[0x1F4185410]();
}

uint64_t sub_1C277C650()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C277C660()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1C277C670()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1C277C680()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1C277C690()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C277C6A0()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1C277C6B0()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1C277C6C0()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1C277C6D0()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C277C6E0()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1C277C6F0()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1C277C700()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1C277C710()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1C277C720()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C277C730()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1C277C740()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1C277C750()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1C277C760()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C277C770()
{
  return MEMORY[0x1F4185708]();
}

uint64_t sub_1C277C780()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1C277C790()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1C277C7A0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1C277C7B0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C277C7C0()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1C277C7D0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C277C7E0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C277C7F0()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1C277C800()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1C277C810()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1C277C830()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1C277C840()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C277C850()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C277C860()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C277C870()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C277C880()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C277C890()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C277C8A0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C277C8B0()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1C277C8C0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C277C8D0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C277C8E0()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1C277C8F0()
{
  return MEMORY[0x1F4185ED8]();
}

uint64_t sub_1C277C900()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1C277C910()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C277C920()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1C277C930()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1C277C940()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1C277C950()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1C277C960()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1C277C970()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1C277C980()
{
  return MEMORY[0x1F40D6E78]();
}

uint64_t sub_1C277C990()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1C277C9A0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C277C9B0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C277C9E0()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

uint64_t HKFeatureFlagBloodOxygenSaturationEnabled()
{
  return MEMORY[0x1F40E7CE0]();
}

uint64_t HKIsUnitTesting()
{
  return MEMORY[0x1F40E7D88]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x1F40E7F00]();
}

uint64_t HKShowSensitiveLogItems()
{
  return MEMORY[0x1F40E7F30]();
}

uint64_t HKStringFromProfileType()
{
  return MEMORY[0x1F40E8020]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CC658](a1, *(void *)&a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_trylock()
{
  return MEMORY[0x1F40CD618]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1F4186508]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1F4186510]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x1F41865D0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x1F4186738]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1F4186780]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}